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


/*++

--*/

#include "dokan.h"


#ifdef ALLOC_PRAGMA
#pragma alloc_text (INIT, DriverEntry)
#pragma alloc_text (PAGE, DokanUnload)
#pragma alloc_text (PAGE, DokanDispatchCreate)
#pragma alloc_text (PAGE, DokanDispatchClose)
#pragma alloc_text (PAGE, DokanDispatchShutdown)
#pragma alloc_text (PAGE, DokanDispatchFileSystemControl)
#pragma alloc_text (PAGE, DokanDispatchDeviceControl)
#pragma alloc_text (PAGE, DokanDispatchDirectoryControl)
#pragma alloc_text (PAGE, DokanDispatchQueryInformation)
#pragma alloc_text (PAGE, DokanDispatchSetInformation)
#pragma alloc_text (PAGE, DokanDispatchQueryVolumeInformation)
#pragma alloc_text (PAGE, DokanDispatchSetVolumeInformation)
#pragma alloc_text (PAGE, DokanDispatchPnp)
#pragma alloc_text (PAGE, DokanDispatchLock)
#endif


#if _WIN32_WINNT < 0x0501
	PFN_FSRTLTEARDOWNPERSTREAMCONTEXTS DokanFsRtlTeardownPerStreamContexts;
#endif


BOOLEAN
DokanFastIoCheckIfPossible (
    __in PFILE_OBJECT	FileObject,
    __in PLARGE_INTEGER	FileOffset,
    __in ULONG			Length,
    __in BOOLEAN		Wait,
    __in ULONG			LockKey,
    __in BOOLEAN		CheckForReadOperation,
    __out PIO_STATUS_BLOCK	IoStatus,
    __in PDEVICE_OBJECT		DeviceObject
    )
{
	DDbgPrint("DokanFastIoCheckIfPossible\n");
	return FALSE;
}


BOOLEAN
DokanFastIoRead (
    __in PFILE_OBJECT	FileObject,
    __in PLARGE_INTEGER	FileOffset,
    __in ULONG			Length,
    __in BOOLEAN		Wait,
    __in ULONG			LockKey,
    __in PVOID			Buffer,
    __out PIO_STATUS_BLOCK	IoStatus,
    __in PDEVICE_OBJECT		DeviceObject
    )
{
	DDbgPrint("DokanFastIoRead\n");
	return FALSE;
}



VOID
DokanAcquireForCreateSection(
	__in PFILE_OBJECT FileObject
	)
{
	PDokanCCB ccb;
	PDokanFCB fcb;

	ccb = (PDokanCCB)FileObject->FsContext2;
	ASSERT(ccb != NULL);
	
	fcb = ccb->Fcb;
	ASSERT(fcb != NULL);

	ExAcquireResourceExclusiveLite(&fcb->MainResource, TRUE);
	ExAcquireResourceExclusiveLite(&fcb->PagingIoResource, TRUE);

	DDbgPrint("DokanAcquireForCreateSection\n");
}


VOID
DokanReleaseForCreateSection(
   __in PFILE_OBJECT FileObject
	)
{
	PDokanCCB ccb;
	PDokanFCB fcb;

	ccb = (PDokanCCB)FileObject->FsContext2;
	ASSERT(ccb != NULL);
	
	fcb = ccb->Fcb;
	ASSERT(fcb != NULL);

	ExReleaseResourceLite(&fcb->PagingIoResource);
	ExReleaseResourceLite(&fcb->MainResource);

	DDbgPrint("DokanReleaseForCreateSection\n");
}


//PDEVICE_EXTENSION Global = NULL;

NTSTATUS
DriverEntry(
	__in PDRIVER_OBJECT  DriverObject,
	__in PUNICODE_STRING RegistryPath
	)

/*++

Routine Description:

	This routine gets called by the system to initialize the driver.

Arguments:

	DriverObject	- the system supplied driver object.
	RegistryPath	- the system supplied registry path for this driver.

Return Value:

	NTSTATUS

--*/

{
	PDEVICE_OBJECT		deviceObject;
	NTSTATUS			status;
	PFAST_IO_DISPATCH	fastIoDispatch;
	ULONG				deviceNumber;
	PDOKAN_GLOBAL		dokanGlobal;
	UNICODE_STRING		functionName;

	DDbgPrint("==> DriverEntry ver.%x, %s %s\n", DOKAN_VERSION, __DATE__, __TIME__);

	dokanGlobal = ExAllocatePool(sizeof(DOKAN_GLOBAL));
	if (dokanGlobal == NULL) {
		return STATUS_INSUFFICIENT_RESOURCES;
	}

	RtlZeroMemory(dokanGlobal, sizeof(DOKAN_GLOBAL));
	DokanInitIrpList(&dokanGlobal->PendingService);
	DokanInitIrpList(&dokanGlobal->NotifyService);

	for (deviceNumber = 0; deviceNumber < DOKAN_DEVICE_MAX; ++deviceNumber) {
		status = DokanCreateDiskDevice(DriverObject, deviceNumber, dokanGlobal);
		if (status != STATUS_SUCCESS)
			break;
	}

	//
	// Set up dispatch entry points for the driver.
	//
	DriverObject->DriverUnload								= DokanUnload;

	DriverObject->MajorFunction[IRP_MJ_CREATE]				= DokanDispatchCreate;
	DriverObject->MajorFunction[IRP_MJ_CLOSE]				= DokanDispatchClose;
	DriverObject->MajorFunction[IRP_MJ_CLEANUP] 			= DokanDispatchCleanup;

	DriverObject->MajorFunction[IRP_MJ_DEVICE_CONTROL]		= DokanDispatchDeviceControl;
	DriverObject->MajorFunction[IRP_MJ_FILE_SYSTEM_CONTROL] = DokanDispatchFileSystemControl;
	DriverObject->MajorFunction[IRP_MJ_DIRECTORY_CONTROL]   = DokanDispatchDirectoryControl;

	DriverObject->MajorFunction[IRP_MJ_QUERY_INFORMATION]   = DokanDispatchQueryInformation;
    DriverObject->MajorFunction[IRP_MJ_SET_INFORMATION]     = DokanDispatchSetInformation;

    DriverObject->MajorFunction[IRP_MJ_QUERY_VOLUME_INFORMATION]	= DokanDispatchQueryVolumeInformation;
    DriverObject->MajorFunction[IRP_MJ_SET_VOLUME_INFORMATION]		= DokanDispatchSetVolumeInformation;

	DriverObject->MajorFunction[IRP_MJ_READ]				= DokanDispatchRead;
	DriverObject->MajorFunction[IRP_MJ_WRITE]				= DokanDispatchWrite;
	DriverObject->MajorFunction[IRP_MJ_FLUSH_BUFFERS]		= DokanDispatchFlush;

	DriverObject->MajorFunction[IRP_MJ_SHUTDOWN]            = DokanDispatchShutdown;
	DriverObject->MajorFunction[IRP_MJ_PNP]					= DokanDispatchPnp;

	DriverObject->MajorFunction[IRP_MJ_LOCK_CONTROL]		= DokanDispatchLock;

	//fastIoDispatch = ExAllocatePool(sizeof(FAST_IO_DISPATCH));
	// TODO: check fastIoDispatch

	//RtlZeroMemory(fastIoDispatch, sizeof(FAST_IO_DISPATCH));

	//fastIoDispatch->SizeOfFastIoDispatch = sizeof(FAST_IO_DISPATCH);
    //fastIoDispatch->FastIoCheckIfPossible = DokanFastIoCheckIfPossible;
    //fastIoDispatch->FastIoRead = DokanFastIoRead;
	//fastIoDispatch->AcquireFileForNtCreateSection = DokanAcquireForCreateSection;
	//fastIoDispatch->ReleaseFileForNtCreateSection = DokanReleaseForCreateSection;

	//DriverObject->FastIoDispatch = fastIoDispatch;


#if _WIN32_WINNT < 0x0501
    RtlInitUnicodeString(&functionName, L"FsRtlTeardownPerStreamContexts");
    DokanFsRtlTeardownPerStreamContexts = MmGetSystemRoutineAddress(&functionName);
#endif

	DDbgPrint("<== DriverEntry\n");

	return( status );
}


VOID
DokanUnload(
	__in PDRIVER_OBJECT DriverObject
	)

/*++

Routine Description:

	This routine gets called to remove the driver from the system.

Arguments:

	DriverObject	- the system supplied driver object.

Return Value:

	NTSTATUS

--*/

{

	PDEVICE_OBJECT		deviceObject = DriverObject->DeviceObject;
	PDEVICE_EXTENSION	deviceExtension;
	UNICODE_STRING		symbolicLinkName;
	WCHAR				symbolicLinkBuf[MAXIMUM_FILENAME_LENGTH];

	DDbgPrint("==> DokanUnload\n");

	PAGED_CODE();

	deviceExtension = DokanGetDeviceExtension(deviceObject);
	ASSERT( deviceExtension->Identifier.Type == DVE );

	//
	// Delete the user-mode symbolic link and deviceobjct.
	//
	swprintf(symbolicLinkBuf, SYMBOLIC_NAME_STRING L"%u", deviceExtension->Number);
	RtlInitUnicodeString(&symbolicLinkName, SYMBOLIC_NAME_STRING);
	IoDeleteSymbolicLink(&symbolicLinkName);

	if (deviceExtension->Number == 0) {
		ExFreePool(deviceExtension->Global);
	}

	// delete diskDeviceObject
	//IoDeleteDevice(vcb->DiskDevice);

	// delete DeviceObject
	IoDeleteDevice(deviceObject);

	DDbgPrint("<== DokanUnload\n");
	return;
}



NTSTATUS
DokanDispatchShutdown(
	__in PDEVICE_OBJECT DeviceObject,
	__in PIRP Irp
   )
{
	DDbgPrint("==> DokanShutdown\n");
	DDbgPrint("<== DokanShutdown\n");
	return STATUS_SUCCESS;
}




NTSTATUS
DokanDispatchPnp(
	__in PDEVICE_OBJECT DeviceObject,
	__in PIRP Irp
   )
{
	NTSTATUS status = STATUS_SUCCESS;

	PAGED_CODE();
	
	DDbgPrint("==> DokanPnp\n");

	Irp->IoStatus.Status = status;
	Irp->IoStatus.Information = 0;
	IoCompleteRequest(Irp, IO_NO_INCREMENT);

	DDbgPrint("<== DokanPnp\n");

	return status;
}



BOOLEAN
DokanNoOpAcquire(
    __in PVOID Fcb,
    __in BOOLEAN Wait
    )
{
    UNREFERENCED_PARAMETER( Fcb );
    UNREFERENCED_PARAMETER( Wait );

	DDbgPrint("==> DokanNoOpAcquire\n");

    ASSERT(IoGetTopLevelIrp() == NULL);

    IoSetTopLevelIrp((PIRP)FSRTL_CACHE_TOP_LEVEL_IRP);

	DDbgPrint("<== DokanNoOpAcquire\n");
    
	return TRUE;
}


VOID
DokanNoOpRelease(
    __in PVOID Fcb
    )
{
	DDbgPrint("==> DokanNoOpRelease\n");
    ASSERT(IoGetTopLevelIrp() == (PIRP)FSRTL_CACHE_TOP_LEVEL_IRP);

    IoSetTopLevelIrp( NULL );

    UNREFERENCED_PARAMETER( Fcb );
	
	DDbgPrint("<== DokanNoOpRelease\n");
    return;
}



PDokanVCB
DokanGetVcb(
	 __in PDEVICE_OBJECT DeviceObject
	 )
{
	PDEVICE_EXTENSION deviceExtension;
	PDokanVCB vcb = DeviceObject->DeviceExtension;
	
	if (vcb->Identifier.Type == DVE) {
		deviceExtension = DeviceObject->DeviceExtension;
		ASSERT(deviceExtension->Identifier.Type == DVE);

		vcb = deviceExtension->Vcb;
		ASSERT(vcb->Identifier.Type == VCB);
	
	} else {
		ASSERT(vcb->Identifier.Type == VCB);
		deviceExtension = vcb->DeviceExtension;
		ASSERT(deviceExtension->Identifier.Type == DVE);
	}

	return vcb;
}


PDEVICE_EXTENSION
DokanGetDeviceExtension(
	  __in PDEVICE_OBJECT DeviceObject
	  )
{
	PDEVICE_EXTENSION deviceExtension;
	PDokanVCB vcb;
	
	ASSERT(DeviceObject);

	vcb = DeviceObject->DeviceExtension;
	
	if (vcb->Identifier.Type == DVE) {
		deviceExtension = DeviceObject->DeviceExtension;
		ASSERT(deviceExtension->Identifier.Type == DVE);

		vcb = deviceExtension->Vcb;
		ASSERT(vcb->Identifier.Type == VCB);
	
	} else {
		ASSERT(vcb->Identifier.Type == VCB);
		deviceExtension = vcb->DeviceExtension;
		ASSERT(deviceExtension->Identifier.Type == DVE);
	}

	return deviceExtension;
}


VOID
DokanSetCommonEventContext(
	PDEVICE_EXTENSION	DeviceExtension,
	PEVENT_CONTEXT		EventContext,
	PIRP				Irp)
{
	PIO_STACK_LOCATION  irpSp;

	irpSp			= IoGetCurrentIrpStackLocation(Irp);

	EventContext->MajorFunction = irpSp->MajorFunction;
	EventContext->MinorFunction = irpSp->MinorFunction;
	EventContext->Flags			= irpSp->Flags;

	EventContext->ProcessId = IoGetRequestorProcessId(Irp);
}


#define PrintStatus(val, flag) if(val == flag) DDbgPrint("  status = " #flag "\n")


VOID
DokanPrintNTStatus(
	NTSTATUS	Status)
{
	PrintStatus(Status, STATUS_SUCCESS);
	PrintStatus(Status, STATUS_NO_MORE_FILES);
	PrintStatus(Status, STATUS_END_OF_FILE);
	PrintStatus(Status, STATUS_NO_SUCH_FILE);
	PrintStatus(Status, STATUS_NOT_IMPLEMENTED);
	PrintStatus(Status, STATUS_BUFFER_OVERFLOW);
	PrintStatus(Status, STATUS_FILE_IS_A_DIRECTORY);
	PrintStatus(Status, STATUS_SHARING_VIOLATION);
	PrintStatus(Status, STATUS_OBJECT_NAME_INVALID);
	PrintStatus(Status, STATUS_OBJECT_NAME_NOT_FOUND);
	PrintStatus(Status, STATUS_OBJECT_NAME_COLLISION);
	PrintStatus(Status, STATUS_OBJECT_PATH_INVALID);
	PrintStatus(Status, STATUS_OBJECT_PATH_NOT_FOUND);
	PrintStatus(Status, STATUS_OBJECT_PATH_SYNTAX_BAD);
	PrintStatus(Status, STATUS_ACCESS_DENIED);
	PrintStatus(Status, STATUS_ACCESS_VIOLATION);
	PrintStatus(Status, STATUS_INVALID_PARAMETER);
	PrintStatus(Status, STATUS_INVALID_USER_BUFFER);
	PrintStatus(Status, STATUS_INVALID_HANDLE);
}



VOID
DokanNotifyReportChange0(
	__in PDokanFCB			Fcb,
	__in PUNICODE_STRING	FileName,
	__in ULONG				FilterMatch,
	__in ULONG				Action)
{
	USHORT	nameOffset;

	DDbgPrint("==> DokanNotifyReportChange %wZ\n", FileName);

	ASSERT(Fcb != NULL);
	ASSERT(FileName != NULL);

	// search the last "\"
	nameOffset = (USHORT)(FileName->Length/sizeof(WCHAR)-1);
	for(; FileName->Buffer[nameOffset] != L'\\'; --nameOffset)
		;
	nameOffset++; // the next is the begining of filename

	nameOffset *= sizeof(WCHAR); // Offset is in bytes

	FsRtlNotifyFullReportChange(
		Fcb->Vcb->NotifySync,
		&Fcb->Vcb->DirNotifyList,
		(PSTRING)FileName,
		nameOffset,
		NULL, // StreamName
		NULL, // NormalizedParentName
		FilterMatch,
		Action,
		NULL); // TargetContext

	DDbgPrint("<== DokanNotifyReportChange\n");
}


VOID
DokanNotifyReportChange(
	__in PDokanFCB	Fcb,
	__in ULONG		FilterMatch,
	__in ULONG		Action)
{
	ASSERT(Fcb != NULL);
	DokanNotifyReportChange0(Fcb, &Fcb->FileName, FilterMatch, Action);
}


BOOLEAN
DokanCheckCCB(
	__in PDEVICE_EXTENSION	DeviceExtension,
	__in PDokanCCB	Ccb)
{
	ASSERT(DeviceExtension != NULL);

	if (Ccb == NULL) {
		DDbgPrint("   ccb is NULL\n");
		return FALSE;
	}

	if (Ccb->MountId != DeviceExtension->MountId) {
		DDbgPrint("   MountId is different\n");
		return FALSE;
	}

	if (!DeviceExtension->Mounted) {
		DDbgPrint("  Not mounted\n");
		return FALSE;
	}

	return TRUE;
}