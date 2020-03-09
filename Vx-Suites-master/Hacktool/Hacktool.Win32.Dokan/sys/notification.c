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

/*

IOCTL_EVENT_START:
DokanStartEventNotificationThread
  NotificationThread
	# PendingEvent has pending IPRs (IOCTL_EVENT_WAIT)
    # NotifyEvent has IO events (ex.IRP_MJ_READ)
    # notify NotifyEvent using PendingEvent in this loop
	NotificationLoop(&DeviceExtension->PendingEvent,
					      &DeviceExtension->NotifyEvent);

    # PendingService has service events (ex. Unmount notification)
	# NotifyService has pending IRPs (IOCTL_SERVICE_WAIT)
    NotificationLoop(DeviceExtension->Global->PendingService,
                          &DeviceExtension->Global->NotifyService);

IOCTL_EVENT_RELEASE:
DokanStopEventNotificationThread

IRP_MJ_READ:
DokanDispatchRead
  DokanRegisterPendingIrp
    # add IRP_MJ_READ to PendingIrp list
    DokanRegisterPendingIrpMain(PendingIrp)
	# put MJ_READ event into NotifyEvent
    DokanEventNotification(NotifyEvent, EventContext)

IOCTL_EVENT_WAIT:
  DokanRegisterPendingIrpForEvent
    # add this irp to PendingEvent list
    DokanRegisterPendingIrpMain(PendingEvent)

IOCTL_EVENT_INFO:
  DokanCompleteIrp
    DokanCompleteRead

*/


#include "dokan.h"

PEVENT_CONTEXT
AllocateEventContext(
	__in PDEVICE_EXTENSION	DeviceExtension,
	__in PIRP				Irp,
	__in ULONG				EventContextLength
	)
{
	ULONG driverContextLength;
	PDRIVER_EVENT_CONTEXT driverEventContext;
	PEVENT_CONTEXT eventContext;

	driverContextLength = EventContextLength - sizeof(EVENT_CONTEXT) + sizeof(DRIVER_EVENT_CONTEXT);
	driverEventContext = ExAllocatePool(driverContextLength);

	if (driverEventContext == NULL)
		return NULL;

	RtlZeroMemory(driverEventContext, driverContextLength);
	InitializeListHead(&driverEventContext->ListEntry);
	eventContext = &driverEventContext->EventContext;
	eventContext->Length = EventContextLength;

	DokanSetCommonEventContext(DeviceExtension, eventContext, Irp);
	eventContext->SerialNumber = InterlockedIncrement(&DeviceExtension->SerialNumber);

	return eventContext;
}


VOID
DokanFreeEventContext(
	__in PEVENT_CONTEXT	EventContext
	)
{
	PDRIVER_EVENT_CONTEXT driverEventContext =
		CONTAINING_RECORD(EventContext, DRIVER_EVENT_CONTEXT, EventContext);
	ExFreePool(driverEventContext);
}


VOID
DokanEventNotification(
	__in PIRP_LIST		NotifyEvent,
	__in PEVENT_CONTEXT	EventContext
	)
{
	PDRIVER_EVENT_CONTEXT driverEventContext =
		CONTAINING_RECORD(EventContext, DRIVER_EVENT_CONTEXT, EventContext);

	InitializeListHead(&driverEventContext->ListEntry);

	ASSERT(KeGetCurrentIrql() <= DISPATCH_LEVEL);

	//DDbgPrint("DokanEventNotification\n");

	ExInterlockedInsertTailList(
		&NotifyEvent->ListHead,
		&driverEventContext->ListEntry,
		&NotifyEvent->ListLock);

	KeSetEvent(&NotifyEvent->NotEmpty, IO_NO_INCREMENT, FALSE);
}


VOID
ReleasePendingIrp(
	__in PIRP_LIST	PendingIrp
	)
{
	PLIST_ENTRY	listHead;
	LIST_ENTRY	completeList;
	PIRP_ENTRY	irpEntry;
	KIRQL	oldIrql;
	PIRP	irp;
	
	InitializeListHead(&completeList);

	ASSERT(KeGetCurrentIrql() <= DISPATCH_LEVEL);
	KeAcquireSpinLock(&PendingIrp->ListLock, &oldIrql);

	while (!IsListEmpty(&PendingIrp->ListHead)) {
		listHead = RemoveHeadList(&PendingIrp->ListHead);
		irpEntry = CONTAINING_RECORD(listHead, IRP_ENTRY, ListEntry);
		irp = irpEntry->Irp;
		if (irp == NULL) {
			// this IRP has already been canceled
			ASSERT(irpEntry->CancelRoutineFreeMemory == FALSE);
			ExFreePool(irpEntry);
			continue;
		}

		if (IoSetCancelRoutine(irp, NULL) == NULL) {
			// Cancel routine will run as soon as we release the lock
			InitializeListHead(&irpEntry->ListEntry);
			irpEntry->CancelRoutineFreeMemory = TRUE;
			continue;
		}
		InsertTailList(&completeList, &irpEntry->ListEntry);
	}

	KeClearEvent(&PendingIrp->NotEmpty);
	KeReleaseSpinLock(&PendingIrp->ListLock, oldIrql);

	while (!IsListEmpty(&completeList)) {
		listHead = RemoveHeadList(&completeList);
		irpEntry = CONTAINING_RECORD(listHead, IRP_ENTRY, ListEntry);
		irp = irpEntry->Irp;
		irp->IoStatus.Information = 0;
		irp->IoStatus.Status = STATUS_SUCCESS;
		ExFreePool(irpEntry);
		IoCompleteRequest(irp, IO_NO_INCREMENT);
	}
}


VOID
ReleaseNotifyEvent(
	__in PIRP_LIST	NotifyEvent
	)
{
	PDRIVER_EVENT_CONTEXT	driverEventContext;
	PLIST_ENTRY	listHead;
	KIRQL oldIrql;

	ASSERT(KeGetCurrentIrql() <= DISPATCH_LEVEL);
	KeAcquireSpinLock(&NotifyEvent->ListLock, &oldIrql);

	while(!IsListEmpty(&NotifyEvent->ListHead)) {
		listHead = RemoveHeadList(&NotifyEvent->ListHead);
		driverEventContext = CONTAINING_RECORD(
			listHead, DRIVER_EVENT_CONTEXT, ListEntry);
		ExFreePool(driverEventContext);
	}

	KeClearEvent(&NotifyEvent->NotEmpty);
	KeReleaseSpinLock(&NotifyEvent->ListLock, oldIrql);
}


VOID
NotificationLoop(
	__in PIRP_LIST	PendingIrp,
	__in PIRP_LIST	NotifyEvent
	)
{
	PDRIVER_EVENT_CONTEXT	driverEventContext;
	PLIST_ENTRY	listHead;
	PIRP_ENTRY	irpEntry;
	LIST_ENTRY	completeList;
	NTSTATUS	status;
	KIRQL	irpIrql;
	KIRQL	notifyIrql;
	PIRP	irp;
	ULONG	eventLen;
	ULONG	bufferLen;
	PVOID	buffer;

	//DDbgPrint("=> NotificationLoop\n");

	InitializeListHead(&completeList);

	ASSERT(KeGetCurrentIrql() <= DISPATCH_LEVEL);
	KeAcquireSpinLock(&PendingIrp->ListLock, &irpIrql);
	KeAcquireSpinLock(&NotifyEvent->ListLock, &notifyIrql);
		
	while (!IsListEmpty(&PendingIrp->ListHead) &&
		!IsListEmpty(&NotifyEvent->ListHead)) {
			
		listHead = RemoveHeadList(&NotifyEvent->ListHead);

		driverEventContext = CONTAINING_RECORD(
			listHead, DRIVER_EVENT_CONTEXT, ListEntry);

		listHead = RemoveHeadList(&PendingIrp->ListHead);
		irpEntry = CONTAINING_RECORD(listHead, IRP_ENTRY, ListEntry);
			
		eventLen = driverEventContext->EventContext.Length;
			
		// ensure this eventIrp is not cancelled
		irp = irpEntry->Irp;

		if (irp == NULL) {
			// this IRP has already been canceled
			ASSERT(irpEntry->CancelRoutineFreeMemory == FALSE);
			ExFreePool(irpEntry);
			// push back
			InsertTailList(&NotifyEvent->ListHead,
							&driverEventContext->ListEntry);
			continue;
		}

		if (IoSetCancelRoutine(irp, NULL) == NULL) {
			// Cancel routine will run as soon as we release the lock
			InitializeListHead(&irpEntry->ListEntry);
			irpEntry->CancelRoutineFreeMemory = TRUE;
			// push back
			InsertTailList(&NotifyEvent->ListHead,
							&driverEventContext->ListEntry);
			continue;
		}

		// available size that is used for event notification
		bufferLen =
			irpEntry->IrpSp->Parameters.DeviceIoControl.OutputBufferLength;
		// buffer that is used to inform Event
		buffer	= irp->AssociatedIrp.SystemBuffer;

		// buffer is not specified or short of length
		if (bufferLen == 0 || buffer == NULL || bufferLen < eventLen) {
			DDbgPrint("EventNotice : STATUS_INSUFFICIENT_RESOURCES\n");
			DDbgPrint("  bufferLen: %d, eventLen: %d\n", bufferLen, eventLen);
			// push back
			InsertTailList(&NotifyEvent->ListHead,
							&driverEventContext->ListEntry);
			// marks as STATUS_INSUFFICIENT_RESOURCES
			irpEntry->SerialNumber = 0;
		} else {
			// let's copy EVENT_CONTEXT
			RtlCopyMemory(buffer, &driverEventContext->EventContext, eventLen);
			// save event length
			irpEntry->SerialNumber = eventLen;
			ExFreePool(driverEventContext);
		}
		InsertTailList(&completeList, &irpEntry->ListEntry);
	}

	KeClearEvent(&NotifyEvent->NotEmpty);
	KeClearEvent(&PendingIrp->NotEmpty);

	KeReleaseSpinLock(&NotifyEvent->ListLock, notifyIrql);
	KeReleaseSpinLock(&PendingIrp->ListLock, irpIrql);

	while (!IsListEmpty(&completeList)) {
		listHead = RemoveHeadList(&completeList);
		irpEntry = CONTAINING_RECORD(listHead, IRP_ENTRY, ListEntry);
		irp = irpEntry->Irp;
		if (irpEntry->SerialNumber == 0) {
			irp->IoStatus.Information = 0;
			irp->IoStatus.Status = STATUS_INSUFFICIENT_RESOURCES;
		} else {
			irp->IoStatus.Information = irpEntry->SerialNumber;
			irp->IoStatus.Status = STATUS_SUCCESS;
		}
		ExFreePool(irpEntry);
		IoCompleteRequest(irp, IO_NO_INCREMENT);
	}

	//DDbgPrint("<= NotificationLoop\n");
}


VOID
NotificationThread(
	__in PDEVICE_EXTENSION	DeviceExtension
	)
{
	PKEVENT events[5];
	NTSTATUS status;

	DDbgPrint("==> NotificationThread\n");

	events[0] = &DeviceExtension->ReleaseEvent;
	events[1] = &DeviceExtension->NotifyEvent.NotEmpty;
	events[2] = &DeviceExtension->PendingEvent.NotEmpty;
	events[3] = &DeviceExtension->Global->PendingService.NotEmpty;
	events[4] = &DeviceExtension->Global->NotifyService.NotEmpty;

	while (1) {
		status = KeWaitForMultipleObjects(
			3, events, WaitAny, Executive, KernelMode, FALSE, NULL, NULL);

		if (status == STATUS_WAIT_0) {
			;
			break;

		} else if (status == STATUS_WAIT_1 || status == STATUS_WAIT_2) {

			NotificationLoop(
					&DeviceExtension->PendingEvent,
					&DeviceExtension->NotifyEvent);

		} else {
			NotificationLoop(
				&DeviceExtension->Global->PendingService,
				&DeviceExtension->Global->NotifyService);
		}
	}

	DDbgPrint("<== NotificationThread\n");
}



NTSTATUS
DokanStartEventNotificationThread(
	__in PDEVICE_EXTENSION	DeviceExtension)
{
	NTSTATUS status;
	HANDLE	thread;

	DDbgPrint("==> DokanStartEventNotificationThread\n");

	KeResetEvent(&DeviceExtension->ReleaseEvent);

	status = PsCreateSystemThread(&thread, THREAD_ALL_ACCESS,
		NULL, NULL, NULL,
		(PKSTART_ROUTINE)NotificationThread,
		DeviceExtension);

	if (!NT_SUCCESS(status)) {
		return status;
	}

	ObReferenceObjectByHandle(thread, THREAD_ALL_ACCESS, NULL,
		KernelMode, (PVOID*)&DeviceExtension->EventNotificationThread, NULL);

	ZwClose(thread);

	DDbgPrint("<== DokanStartEventNotificationThread\n");

	return STATUS_SUCCESS;
}


VOID
DokanStopEventNotificationThread(
	__in PDEVICE_EXTENSION	DeviceExtension)
{
	DDbgPrint("==> DokanStopEventNotificationThread\n");
	
	KeSetEvent(&DeviceExtension->ReleaseEvent, 0, FALSE);

	if (DeviceExtension->EventNotificationThread) {
		KeWaitForSingleObject(
			DeviceExtension->EventNotificationThread, Executive,
			KernelMode, FALSE, NULL);
		ObDereferenceObject(DeviceExtension->EventNotificationThread);
		DeviceExtension->EventNotificationThread = NULL;
	}
	
	DDbgPrint("<== DokanStopEventNotificationThread\n");
}


NTSTATUS
DokanEventRelease(
	__in PDEVICE_OBJECT DeviceObject)
{
	PDEVICE_EXTENSION	deviceExtension;
	PDokanVCB			vcb;
	PDokanFCB			fcb;
	PDokanCCB			ccb;
	PLIST_ENTRY			fcbEntry, fcbNext, fcbHead;
	PLIST_ENTRY			ccbEntry, ccbNext, ccbHead;
	NTSTATUS			status = STATUS_SUCCESS;

	deviceExtension = DokanGetDeviceExtension(DeviceObject);

	//ExAcquireResourceExclusiveLite(&deviceExtension->Resource, TRUE);
	deviceExtension->Mounted = 0;
	//ExReleaseResourceLite(&deviceExtension->Resource);

	// search CCB list to complete not completed Directory Notification 
	vcb = deviceExtension->Vcb;
	KeEnterCriticalRegion();
	ExAcquireResourceExclusiveLite(&vcb->Resource, TRUE);

	fcbHead = &vcb->NextFCB;

    for (fcbEntry = fcbHead->Flink; fcbEntry != fcbHead; fcbEntry = fcbNext) {

		fcbNext = fcbEntry->Flink;
		fcb = CONTAINING_RECORD(fcbEntry, DokanFCB, NextFCB);

		ExAcquireResourceExclusiveLite(&fcb->Resource, TRUE);

		ccbHead = &fcb->NextCCB;

		for (ccbEntry = ccbHead->Flink; ccbEntry != ccbHead; ccbEntry = ccbNext) {
			ccbNext = ccbEntry->Flink;
			ccb = CONTAINING_RECORD(ccbEntry, DokanCCB, NextCCB);

			DDbgPrint("  NotifyCleanup ccb:%X, context:%X, filename:%wZ\n",
					ccb, (ULONG)ccb->UserContext, &fcb->FileName);
			FsRtlNotifyCleanup(vcb->NotifySync, &vcb->DirNotifyList, ccb);
		}
		ExReleaseResourceLite(&fcb->Resource);
	}

	ExReleaseResourceLite(&vcb->Resource);
	KeLeaveCriticalRegion();

	ReleasePendingIrp(&deviceExtension->PendingIrp);
	ReleasePendingIrp(&deviceExtension->PendingEvent);
	DokanStopCheckThread(deviceExtension);
	DokanStopEventNotificationThread(deviceExtension);

	return status;
}