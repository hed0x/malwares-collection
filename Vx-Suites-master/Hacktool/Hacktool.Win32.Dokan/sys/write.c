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


NTSTATUS
DokanDispatchWrite(
	__in PDEVICE_OBJECT DeviceObject,
	__in PIRP Irp
	)
{
	PIO_STACK_LOCATION	irpSp;
	PFILE_OBJECT		fileObject;
	NTSTATUS			status =STATUS_INVALID_PARAMETER;
	PEVENT_CONTEXT		eventContext;
	ULONG				eventLength;
	PDokanCCB			ccb;
	PDokanVCB			vcb;
	PDokanFCB			fcb;
	PDEVICE_EXTENSION	deviceExtension;
	PVOID				buffer;
	ULONG				bufferLength;

	PAGED_CODE();

	__try {

		FsRtlEnterFileSystem();

		DDbgPrint("==> DokanWrite\n");

		irpSp		= IoGetCurrentIrpStackLocation(Irp);
		fileObject	= irpSp->FileObject;

		vcb = DokanGetVcb(DeviceObject);
		deviceExtension = DokanGetDeviceExtension(DeviceObject);

		if (fileObject == NULL) {
			DDbgPrint("  fileObject == NULL\n");
			status = STATUS_INVALID_PARAMETER;
			__leave;
		}

		if (!DokanCheckCCB(deviceExtension, fileObject->FsContext2)) {
			status = STATUS_INVALID_PARAMETER;
			__leave;
		}

		DDbgPrint("  ProcessId %lu\n", IoGetRequestorProcessId(Irp));
		DDbgPrint("  FileName:%wZ\n", &fileObject->FileName);

		ccb			= fileObject->FsContext2;
		ASSERT(ccb != NULL);

		fcb			= ccb->Fcb;
		ASSERT(fcb != NULL);

		if (fcb->Flags & DOKAN_FILE_DIRECTORY) {
			status = STATUS_INVALID_PARAMETER;
			__leave;
		}

		if (Irp->MdlAddress) {
			DDbgPrint("  use MdlAddress\n");
			buffer = MmGetSystemAddressForMdlSafe(Irp->MdlAddress, NormalPagePriority);
		} else {
			DDbgPrint("  use AssociatedIrp.SystemBuffer\n");
			buffer = Irp->AssociatedIrp.SystemBuffer ;
		}

		if (buffer == NULL) {
			DDbgPrint("  buffer == NULL\n");
			status = STATUS_INVALID_PARAMETER;
			__leave;
		}


		// the length of EventContext is sum of length to write and length of file name
		eventLength = sizeof(EVENT_CONTEXT)
							+ irpSp->Parameters.Write.Length
							+ fcb->FileName.Length;

		eventContext = AllocateEventContext(deviceExtension, Irp, eventLength);

		// no more memory!
		if (eventContext == NULL) {
			status = STATUS_INSUFFICIENT_RESOURCES;
			__leave;
		}

		eventContext->Context = ccb->UserContext;
		//DDbgPrint("   get Context %X\n", (ULONG)ccb->UserContext);

		// When the length is bigger than usual event notitfication buffer,
		// saves pointer in DiverContext to copy EventContext after allocating
		// more bigger memory.
		Irp->Tail.Overlay.DriverContext[DRIVER_CONTEXT_EVENT] = eventContext;

		// offset of file to write
		eventContext->Write.ByteOffset = irpSp->Parameters.Write.ByteOffset;

		if (irpSp->Parameters.Write.ByteOffset.LowPart == FILE_WRITE_TO_END_OF_FILE
			&& irpSp->Parameters.Write.ByteOffset.HighPart == 0xFFFFFFFF) {

			// TODO: offset should be file size?
			DDbgPrint("  WriteOffset = end of file\n");
		}

		// the size of buffer to write
		eventContext->Write.BufferLength = irpSp->Parameters.Write.Length;

		// the offset from the begining of structure
		// the contents to write will be copyed to this offset
		eventContext->Write.BufferOffset = FIELD_OFFSET(EVENT_CONTEXT, Write.FileName[0]) +
										fcb->FileName.Length + sizeof(WCHAR); // adds last null char

		// copies the content to write to EventContext
		RtlCopyMemory((PCHAR)eventContext + eventContext->Write.BufferOffset,
			buffer, irpSp->Parameters.Write.Length);

		// copies file name
		eventContext->Write.FileNameLength = fcb->FileName.Length;
		RtlCopyMemory(eventContext->Write.FileName, fcb->FileName.Buffer, fcb->FileName.Length);
		
		// When eventlength is less than event notification buffer,
		// returns it to user-mode using pending event.
		if (eventLength <= EVENT_CONTEXT_MAX_SIZE) {

			// register this IRP to IRP waiting list and make it pending status
			status = DokanRegisterPendingIrp(DeviceObject, Irp, eventContext);

			// EventContext is no longer valid, clears it
			Irp->Tail.Overlay.DriverContext[DRIVER_CONTEXT_EVENT] = 0;

		// Resuests bigger memory
		// eventContext will be freed later using Irp->Tail.Overlay.DriverContext[DRIVER_CONTEXT_EVENT]
		} else {
			// the length at lest file name can be stored
			ULONG	requestContextLength = max(sizeof(EVENT_CONTEXT), eventContext->Write.BufferOffset);
			PEVENT_CONTEXT requestContext = AllocateEventContext(deviceExtension, Irp, requestContextLength);

			// no more memory!
			if (requestContext == NULL) {
				status = STATUS_INSUFFICIENT_RESOURCES;
				Irp->Tail.Overlay.DriverContext[DRIVER_CONTEXT_EVENT] = 0;
				DokanFreeEventContext(eventContext);
				__leave;
			}

			// copies from begining of EventContext to the end of file name
			RtlCopyMemory(requestContext, eventContext, eventContext->Write.BufferOffset);
			// puts actual size of RequestContext
			requestContext->Length = requestContextLength;
			// requsts enough size to copy EventContext
			requestContext->Write.RequestLength = eventLength;

			// regiters this IRP to IRP wainting list and make it pending status
			status = DokanRegisterPendingIrp(DeviceObject, Irp, requestContext);
		}

	} __finally {

		// if status of IRP is not pending, must complete current IRP
		if (status != STATUS_PENDING) {
			Irp->IoStatus.Status = status;
			Irp->IoStatus.Information = 0;
			IoCompleteRequest(Irp, IO_NO_INCREMENT);
			DokanPrintNTStatus(status);
		} else {
			DDbgPrint("  STATUS_PENDING\n");
		}

		DDbgPrint("<== DokanWrite\n");

		FsRtlExitFileSystem();

	}

	return status;
}



VOID
DokanCompleteWrite(
	__in PIRP_ENTRY			IrpEntry,
	__in PEVENT_INFORMATION	EventInfo
	)
{
	PIRP				irp;
	PIO_STACK_LOCATION	irpSp;
	NTSTATUS			status     = STATUS_SUCCESS;
	ULONG				readLength = 0;
	ULONG				bufferLen  = 0;
	PVOID				buffer	   = NULL;
	PDokanCCB			ccb;

	//FsRtlEnterFileSystem();

	DDbgPrint("==> DokanCompleteWrite %wZ\n", &IrpEntry->FileObject->FileName);

	irp   = IrpEntry->Irp;
	irpSp = IrpEntry->IrpSp;	

	ccb = IrpEntry->FileObject->FsContext2;
	ASSERT(ccb != NULL);

	ccb->UserContext = EventInfo->Context;
	DDbgPrint("   set Context %X\n", (ULONG)ccb->UserContext);

	status = EventInfo->Status;

	irp->IoStatus.Status = status;
	irp->IoStatus.Information = EventInfo->BufferLength;

	if (EventInfo->BufferLength != 0) {
		IrpEntry->FileObject->CurrentByteOffset
			= EventInfo->Write.CurrentByteOffset;
	}

	IoCompleteRequest(irp, IO_NO_INCREMENT);

	DokanPrintNTStatus(status);
	DDbgPrint("<== DokanCompleteWrite\n");

	//FsRtlExitFileSystem();
}

