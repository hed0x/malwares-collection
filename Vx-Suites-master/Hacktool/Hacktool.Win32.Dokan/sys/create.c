/*
  Dokan : user-mode file system library for Windows

  Copyright (C) 2008 Hiroki Asakawa info@dokan-dev.net

  http://dokan-dev.net/en

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License as published by the Free
Software Foundation; either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program. If not, see <http://www.gnu.org/licenses/>.
*/


#include "dokan.h"

// We must NOT call without VCB lcok
PDokanFCB
DokanAllocateFCB(
	__in PDokanVCB Vcb
	)
{
	PDokanFCB fcb = ExAllocatePool(sizeof(DokanFCB));

	if (fcb == NULL)
		return NULL;


	ASSERT(fcb != NULL);
	ASSERT(Vcb != NULL);

	RtlZeroMemory(fcb, sizeof(DokanFCB));

	fcb->Identifier.Type = FCB;
	fcb->Identifier.Size = sizeof(DokanFCB);

	fcb->Vcb = Vcb;

	ExInitializeResourceLite(&fcb->MainResource);
    ExInitializeResourceLite(&fcb->PagingIoResource);

	ExInitializeFastMutex(&fcb->AdvancedFCBHeaderMutex);

#if _WIN32_WINNT >= 0x0501
	FsRtlSetupAdvancedHeader(&fcb->AdvancedFCBHeader, &fcb->AdvancedFCBHeaderMutex);
#else
	if (DokanFsRtlTeardownPerStreamContexts) {
		FsRtlSetupAdvancedHeader(&fcb->AdvancedFCBHeader, &fcb->AdvancedFCBHeaderMutex);
	}
#endif


	fcb->AdvancedFCBHeader.ValidDataLength.LowPart = 0xffffffff;
    fcb->AdvancedFCBHeader.ValidDataLength.HighPart = 0x7fffffff;

	fcb->AdvancedFCBHeader.Resource = &fcb->MainResource;
    fcb->AdvancedFCBHeader.PagingIoResource = &fcb->PagingIoResource;

	fcb->AdvancedFCBHeader.AllocationSize.QuadPart = 4096;
	fcb->AdvancedFCBHeader.FileSize.QuadPart = 4096;

	fcb->AdvancedFCBHeader.IsFastIoPossible = FastIoIsNotPossible;

	ExInitializeResourceLite(&fcb->Resource);

	InitializeListHead(&fcb->NextCCB);
	InsertTailList(&Vcb->NextFCB, &fcb->NextFCB);

	return fcb;
}


PDokanFCB
DokanGetFCB(
	__in PDokanVCB	Vcb,
	__in PWCHAR		FileName,
	__in ULONG		FileNameLength)
{
	PLIST_ENTRY		thisEntry, nextEntry, listHead;
	PDokanFCB		fcb = NULL;
	ULONG			pos;

	ExAcquireResourceExclusiveLite(&Vcb->Resource, TRUE);

	// search the FCB which is already allocated
	// (being used now)
	listHead = &Vcb->NextFCB;

    for (thisEntry = listHead->Flink;
			thisEntry != listHead;
			thisEntry = nextEntry) {

		nextEntry = thisEntry->Flink;

        fcb = CONTAINING_RECORD(thisEntry, DokanFCB, NextFCB);

		if (fcb->FileName.Length == FileNameLength) {
			// FileNameLength in bytes
			for (pos = 0; pos < FileNameLength/sizeof(WCHAR); ++pos) {
				if (fcb->FileName.Buffer[pos] != FileName[pos])
					break;
			}
			// we have the FCB which is already allocated and used
			if (pos == FileNameLength/sizeof(WCHAR))
				break;
		}

		fcb = NULL;
	}

	// we don't have FCB
	if (fcb == NULL) {
		DDbgPrint("  Allocate FCB\n");
		
		fcb = DokanAllocateFCB(Vcb);
		
		// no memory?
		if (fcb == NULL) {
			ExFreePool(FileName);
			ExReleaseResourceLite(&Vcb->Resource);
			return NULL;
		}

		ASSERT(fcb != NULL);

		fcb->FileName.Buffer = FileName;
		fcb->FileName.Length = (USHORT)FileNameLength;
		fcb->FileName.MaximumLength = (USHORT)FileNameLength;

	// we already have FCB
	} else {
		// FileName (argument) is never used and must be freed
		ExFreePool(FileName);
	}

	InterlockedIncrement(&fcb->FileCount);

	ExReleaseResourceLite(&Vcb->Resource);
	return fcb;
}



NTSTATUS
DokanFreeFCB(
  __in PDokanFCB Fcb
  )
{
	PDokanVCB vcb;

	ASSERT(Fcb != NULL);

	vcb = Fcb->Vcb;

	ExAcquireResourceExclusiveLite(&vcb->Resource, TRUE);
	ExAcquireResourceExclusiveLite(&Fcb->Resource, TRUE);

	Fcb->FileCount--;

	if (Fcb->FileCount == 0) {

		RemoveEntryList(&Fcb->NextFCB);

		DDbgPrint("  Free FCB:%X\n", Fcb);
		ExFreePool(Fcb->FileName.Buffer);

#if _WIN32_WINNT >= 0x0501
		FsRtlTeardownPerStreamContexts(&Fcb->AdvancedFCBHeader);
#else
		if (DokanFsRtlTeardownPerStreamContexts) {
			DokanFsRtlTeardownPerStreamContexts(&Fcb->AdvancedFCBHeader);
		}
#endif
		ExReleaseResourceLite(&Fcb->Resource);

		ExDeleteResourceLite(&Fcb->Resource);
		ExDeleteResourceLite(&Fcb->MainResource);
		ExDeleteResourceLite(&Fcb->PagingIoResource);
		
		ExFreePool(Fcb);

	} else {
		ExReleaseResourceLite(&Fcb->Resource);
	}

	ExReleaseResourceLite(&vcb->Resource);

	return STATUS_SUCCESS;
}



PDokanCCB
DokanAllocateCCB(
	__in PDEVICE_EXTENSION	DeviceExtension,
	__in PDokanFCB	Fcb
	)
{
	PDokanCCB ccb = ExAllocatePool(sizeof(DokanCCB));

	if (ccb == NULL)
		return NULL;

	ASSERT(ccb != NULL);
	ASSERT(Fcb != NULL);

	RtlZeroMemory(ccb, sizeof(DokanCCB));

	ccb->Identifier.Type = CCB;
	ccb->Identifier.Size = sizeof(DokanCCB);

	ccb->Fcb = Fcb;

	ExInitializeResourceLite(&ccb->Resource);

	InitializeListHead(&ccb->NextCCB);

	ExAcquireResourceExclusiveLite(&Fcb->Resource, TRUE);
	InsertTailList(&Fcb->NextCCB, &ccb->NextCCB);
	ExReleaseResourceLite(&Fcb->Resource);

	ccb->MountId = DeviceExtension->MountId;

	return ccb;
}



NTSTATUS
DokanFreeCCB(
  __in PDokanCCB ccb
  )
{
	PDokanFCB fcb;

	ASSERT(ccb != NULL);
	
	fcb = ccb->Fcb;

	ExAcquireResourceExclusiveLite(&fcb->Resource, TRUE);
	RemoveEntryList(&ccb->NextCCB);
	ExReleaseResourceLite(&fcb->Resource);

	ExDeleteResourceLite(&ccb->Resource);

	if (ccb->SearchPattern)
		ExFreePool(ccb->SearchPattern);

	ExFreePool(ccb);

	return STATUS_SUCCESS;
}


LONG
DokanUnicodeStringChar(
	__in PUNICODE_STRING UnicodeString,
	__in WCHAR	Char)
{
	ULONG i = 0;
	for (; i < UnicodeString->Length/sizeof(WCHAR); ++i) {
		if (UnicodeString->Buffer[i] == Char) {
			return i;
		}
	}
	return -1;
}


NTSTATUS
DokanDispatchCreate(
	__in PDEVICE_OBJECT DeviceObject,
	__in PIRP Irp
	)

/*++

Routine Description:

	This device control dispatcher handles create & close IRPs.

Arguments:

	DeviceObject - Context for the activity.
	Irp 		 - The device control argument block.

Return Value:

	NTSTATUS

--*/
{
	PDokanVCB			vcb;
	PDEVICE_EXTENSION	deviceExtension;
	PIO_STACK_LOCATION	irpSp;
	NTSTATUS			status = STATUS_INVALID_PARAMETER;
	PFILE_OBJECT		fileObject;
	ULONG				info = 0;
	PEPROCESS			process;
	PUNICODE_STRING		processImageName;
	PEVENT_CONTEXT		eventContext;
	PFILE_OBJECT		relatedFileObject;
	ULONG				fileNameLength = 0;
	BOOLEAN				enteringFileSystem = FALSE;
	ULONG				eventLength;
	PDokanFCB			fcb;
	PDokanCCB			ccb;
	PWCHAR				fileName;

	PAGED_CODE();

	__try {
		FsRtlEnterFileSystem();
		enteringFileSystem = TRUE;

		DDbgPrint("==> DokanCreate\n");

		irpSp = IoGetCurrentIrpStackLocation( Irp );
		fileObject = irpSp->FileObject;
		relatedFileObject = fileObject->RelatedFileObject;

		if (fileObject == NULL) {
			DDbgPrint("  fileObject == NULL\n");
			status = STATUS_INVALID_PARAMETER;
			__leave;
		}

		DDbgPrint("  ProcessId %lu\n", IoGetRequestorProcessId(Irp));
		DDbgPrint("  FileName:%wZ\n", &fileObject->FileName);

		vcb = DokanGetVcb(DeviceObject);
		deviceExtension = DokanGetDeviceExtension(DeviceObject);


		DDbgPrint("  IrpSp->Flags = %d\n", irpSp->Flags);
		if (irpSp->Flags & SL_CASE_SENSITIVE)
			DDbgPrint("  IrpSp->Flags SL_CASE_SENSITIVE\n");
		if (irpSp->Flags & SL_FORCE_ACCESS_CHECK)
			DDbgPrint("  IrpSp->Flags SL_FORCE_ACCESS_CHECK\n");
		if (irpSp->Flags & SL_OPEN_PAGING_FILE)
			DDbgPrint("  IrpSp->Flags SL_OPEN_PAGING_FILE\n");
		if (irpSp->Flags & SL_OPEN_TARGET_DIRECTORY)
			DDbgPrint("  IrpSp->Flags SL_OPEN_TARGET_DIRECTORY\n");


		if (relatedFileObject != NULL) {
			fileObject->Vpb = relatedFileObject->Vpb;
		} else {
			fileObject->Vpb = vcb->DiskDevice->Vpb;
		}

		if (relatedFileObject == NULL && fileObject->FileName.Length == 0) {
			DDbgPrint("   request for FS device\n");

			if (irpSp->Parameters.Create.Options & FILE_DIRECTORY_FILE) {
				status = STATUS_NOT_A_DIRECTORY;
			} else {
				info = FILE_OPENED;
				status = STATUS_SUCCESS;
			}
			__leave;
		}

		if (relatedFileObject) {
			fileNameLength += relatedFileObject->FileName.Length;
			fileNameLength += sizeof(WCHAR); // add null char
		}
		fileNameLength += fileObject->FileName.Length;


		// don't open file like stream
		if (!deviceExtension->UseAltStream &&
			DokanUnicodeStringChar(&fileObject->FileName, L':') != -1) {
			status = STATUS_INVALID_PARAMETER;
			info = 0;
			__leave;
		}
			
		// this memory is freed by DokanGetFCB if needed
		// "+ sizeof(WCHAR)" is for the last NULL character
		fileName = ExAllocatePool(fileNameLength + sizeof(WCHAR));
		if (fileName == NULL) {
			status = STATUS_INSUFFICIENT_RESOURCES;
			__leave;
		}

		RtlZeroMemory(fileName, fileNameLength + sizeof(WCHAR));

		if (relatedFileObject != NULL) {
			DDbgPrint("  RelatedFileName:%wZ\n", &relatedFileObject->FileName);

			// copy the file name of related file object
			RtlCopyMemory(fileName,
							relatedFileObject->FileName.Buffer,
							relatedFileObject->FileName.Length);
			// add null char
			// Because the type of FileName is PWCHAR, the last index is length/sizeof(WCHAR)
			fileName[relatedFileObject->FileName.Length/sizeof(WCHAR)] = L'\\';

			// adjust start address by adding file name length of releated file object and last null char
			// copy the file name of fileObject
			RtlCopyMemory((PCHAR)fileName +
							relatedFileObject->FileName.Length + sizeof(WCHAR),
							fileObject->FileName.Buffer,
							fileObject->FileName.Length);

		} else {
			// if related file object is not specifed, copy the file name of file object
			RtlCopyMemory(fileName,
							fileObject->FileName.Buffer,
							fileObject->FileName.Length);
		}

		fcb = DokanGetFCB(vcb, fileName, fileNameLength);
		if (fcb == NULL) {
			status = STATUS_INSUFFICIENT_RESOURCES;
			__leave;
		}

		ccb = DokanAllocateCCB(deviceExtension, fcb);
		if (ccb == NULL) {
			DokanFreeFCB(fcb); // FileName is freed here
			status = STATUS_INSUFFICIENT_RESOURCES;
			__leave;
		}

		fileObject->FsContext = &fcb->AdvancedFCBHeader;
		fileObject->FsContext2 = ccb;
		fileObject->PrivateCacheMap = NULL;
		fileObject->SectionObjectPointer = &fcb->SectionObjectPointers;

		FsRtlExitFileSystem();
		enteringFileSystem = FALSE;

		eventLength = sizeof(EVENT_CONTEXT) + fcb->FileName.Length;
		eventContext = AllocateEventContext(deviceExtension, Irp, eventLength);
				
		if (eventContext == NULL) {
			status = STATUS_INSUFFICIENT_RESOURCES;
			__leave;
		}

		eventContext->Context = 0;

		// copy the file name
		eventContext->Create.FileNameLength = fcb->FileName.Length;
		RtlCopyMemory(eventContext->Create.FileName, fcb->FileName.Buffer, fcb->FileName.Length);

		eventContext->Create.FileAttributes = irpSp->Parameters.Create.FileAttributes;
		eventContext->Create.CreateOptions  = irpSp->Parameters.Create.Options;
		eventContext->Create.DesiredAccess  = irpSp->Parameters.Create.SecurityContext->DesiredAccess;
		eventContext->Create.ShareAccess    = irpSp->Parameters.Create.ShareAccess;

		// register this IRP to waiting IPR list
		status = DokanRegisterPendingIrp(DeviceObject, Irp, eventContext);

	} __finally {

		if (status != STATUS_PENDING) {
			Irp->IoStatus.Status = status;
			Irp->IoStatus.Information = info;
			IoCompleteRequest(Irp, IO_NO_INCREMENT);
			DokanPrintNTStatus(status);
		}

		DDbgPrint("<== DokanCreate\n");

		if (enteringFileSystem)
			FsRtlExitFileSystem();
	}

	return status;
}


VOID
DokanCompleteCreate(
	 __in PIRP_ENTRY			IrpEntry,
	 __in PEVENT_INFORMATION	EventInfo
	 )
{
	PIRP				irp;
	PIO_STACK_LOCATION	irpSp;
	NTSTATUS			status;
	ULONG				info;
	PDokanCCB			ccb;
	PDokanFCB			fcb;

	irp   = IrpEntry->Irp;
	irpSp = IrpEntry->IrpSp;	

	FsRtlEnterFileSystem();

	DDbgPrint("==> DokanCompleteCreate\n");

	ccb	= IrpEntry->FileObject->FsContext2;
	ASSERT(ccb != NULL);
	
	fcb = ccb->Fcb;
	ASSERT(fcb != NULL);

	ccb->UserContext = EventInfo->Context;
	//DDbgPrint("   set Context %X\n", (ULONG)ccb->UserContext);

	status = EventInfo->Status;

	info = EventInfo->Create.Information;

	ExAcquireResourceExclusiveLite(&fcb->Resource, TRUE);
	if (NT_SUCCESS(status) &&
		(irpSp->Parameters.Create.Options & FILE_DIRECTORY_FILE ||
		EventInfo->Create.Flags & DOKAN_FILE_DIRECTORY)) {
		fcb->Flags |= DOKAN_FILE_DIRECTORY;
	}
	ExReleaseResourceLite(&fcb->Resource);

	ExAcquireResourceExclusiveLite(&ccb->Resource, TRUE);
	if (NT_SUCCESS(status))
		ccb->Flags |= DOKAN_FILE_OPENED;
	ExReleaseResourceLite(&ccb->Resource);


	if (NT_SUCCESS(status)) {
		if (info == FILE_CREATED) {
			if (fcb->Flags & DOKAN_FILE_DIRECTORY)
				DokanNotifyReportChange(fcb, FILE_NOTIFY_CHANGE_DIR_NAME, FILE_ACTION_ADDED);
			else
				DokanNotifyReportChange(fcb, FILE_NOTIFY_CHANGE_FILE_NAME, FILE_ACTION_ADDED);
		}
	}

	
	irp->IoStatus.Status = status;
	irp->IoStatus.Information = info;
	IoCompleteRequest(irp, IO_NO_INCREMENT);

	DokanPrintNTStatus(status);
	DDbgPrint("<== DokanCompleteCreate\n");

	FsRtlExitFileSystem();
}




NTSTATUS
DokanDispatchClose(
	__in PDEVICE_OBJECT DeviceObject,
	__in PIRP Irp
	)

/*++

Routine Description:

	This device control dispatcher handles create & close IRPs.

Arguments:

	DeviceObject - Context for the activity.
	Irp 		 - The device control argument block.

Return Value:

	NTSTATUS

--*/
{
	PDokanVCB			vcb;
	PDEVICE_EXTENSION	deviceExtension;
	PIO_STACK_LOCATION	irpSp;
	NTSTATUS			status = STATUS_INVALID_PARAMETER;
	PFILE_OBJECT		fileObject;
	PDokanCCB			ccb;
	PEVENT_CONTEXT		eventContext;
	ULONG				eventLength;
	PDokanFCB			fcb;
	BOOLEAN				enteringFileSystem = FALSE;

	PAGED_CODE();

	__try {

		FsRtlEnterFileSystem();
		enteringFileSystem = TRUE;

		DDbgPrint("==> DokanClose\n");
	
		irpSp = IoGetCurrentIrpStackLocation(Irp);
		fileObject = irpSp->FileObject;

		vcb = DokanGetVcb(DeviceObject);
		deviceExtension = DokanGetDeviceExtension(DeviceObject);

		if (fileObject == NULL) {
			DDbgPrint("  fileObject is NULL\n");
			status = STATUS_SUCCESS;
			__leave;
		}

		DDbgPrint("  ProcessId %lu\n", IoGetRequestorProcessId(Irp));
		DDbgPrint("  FileName:%wZ\n", &fileObject->FileName);


		if (!DokanCheckCCB(deviceExtension, fileObject->FsContext2)) {

			if (fileObject->FsContext2) {
				ccb = fileObject->FsContext2;
				ASSERT(ccb != NULL);

				fcb = ccb->Fcb;
				ASSERT(fcb != NULL);

				DDbgPrint("   Free CCB:%X\n", ccb);
				DokanFreeCCB(ccb);

				DokanFreeFCB(fcb);
			}

			status = STATUS_SUCCESS;
			__leave;
		}

		ccb = fileObject->FsContext2;
		ASSERT(ccb != NULL);

		fcb = ccb->Fcb;
		ASSERT(fcb != NULL);

		eventLength = sizeof(EVENT_CONTEXT) + fcb->FileName.Length;
		eventContext = AllocateEventContext(deviceExtension, Irp, eventLength);

		if (eventContext == NULL) {
			//status = STATUS_INSUFFICIENT_RESOURCES;
			status = STATUS_SUCCESS;
			__leave;
		}

		eventContext->Context = ccb->UserContext;
		DDbgPrint("   UserContext:%X\n", (ULONG)ccb->UserContext);

		// copy the file name to be closed
		eventContext->Close.FileNameLength = fcb->FileName.Length;
		RtlCopyMemory(eventContext->Close.FileName, fcb->FileName.Buffer, fcb->FileName.Length);

		DDbgPrint("   Free CCB:%X\n", ccb);
		DokanFreeCCB(ccb);

		DokanFreeFCB(fcb);

		FsRtlExitFileSystem();
		enteringFileSystem = FALSE;

		// Close can not be pending status
		// don't register this IRP
		//status = DokanRegisterPendingIrp(DeviceObject, Irp, eventContext->SerialNumber);

		// inform it to user-mode
		DokanEventNotification(&deviceExtension->NotifyEvent, eventContext);

		status = STATUS_SUCCESS;

	} __finally {

		if (status != STATUS_PENDING) {
			Irp->IoStatus.Status = status;
			Irp->IoStatus.Information = 0;
			IoCompleteRequest(Irp, IO_NO_INCREMENT);
		}

		DDbgPrint("<== DokanClose\n");

		if (enteringFileSystem)
			FsRtlExitFileSystem();
	}

	return status;
}

