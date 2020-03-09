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

int __cdecl swprintf(wchar_t *, const wchar_t *, ...);

VOID
DokanCheckKeepAlive(
	PDEVICE_EXTENSION	DeviceExtension)
{
	LARGE_INTEGER		tickCount;
	ULONG				eventLength;
	PEVENT_CONTEXT		eventContext;
	ULONG				mounted;

	//DDbgPrint("==> DokanCheckKeepAlive\n");

	KeQueryTickCount(&tickCount);
	ExAcquireResourceSharedLite(&DeviceExtension->Resource, TRUE);

	if ( (tickCount.QuadPart - DeviceExtension->TickCount.QuadPart) * KeQueryTimeIncrement()
		> DOKAN_KEEPALIVE_TIMEOUT * 10000 * 1000) {
	

		mounted = DeviceExtension->Mounted;

		ExReleaseResourceLite(&DeviceExtension->Resource);


		DDbgPrint("  Force to umount\n");

		if (!mounted) {
			// not mounted
			return;
		}

		eventLength = sizeof(EVENT_CONTEXT);
		eventContext = ExAllocatePool(eventLength);
				
		if (eventContext == NULL) {
			;//STATUS_INSUFFICIENT_RESOURCES;
			DokanEventRelease(DeviceExtension->DeviceObject);
			return;
		}

		RtlZeroMemory(eventContext, eventLength);
		eventContext->Length = eventLength;

		// set drive letter
		eventContext->Flags = mounted;

		DokanEventNotification(&DeviceExtension->Global->NotifyService, eventContext);

		DokanEventRelease(DeviceExtension->DeviceObject);

	} else {
		ExReleaseResourceLite(&DeviceExtension->Resource);
	}

	//DDbgPrint("<== DokanCheckKeepAlive\n");
}



NTSTATUS
ReleaseTimeoutPendingIrp(
   PDEVICE_EXTENSION	DeviceExtension
   )
{
	KIRQL				oldIrql;
    PLIST_ENTRY			thisEntry, nextEntry, listHead;
	PIRP_ENTRY			irpEntry;
	LARGE_INTEGER		tickCount;
	LIST_ENTRY			completeList;
	PIRP				irp;

	DDbgPrint("==> ReleaseTimeoutPendingIRP\n");
	InitializeListHead(&completeList);

	ASSERT(KeGetCurrentIrql() <= DISPATCH_LEVEL);
	KeAcquireSpinLock(&DeviceExtension->PendingIrp.ListLock, &oldIrql);

	// when IRP queue is empty, there is nothing to do
	if (IsListEmpty(&DeviceExtension->PendingIrp.ListHead)) {
		KeReleaseSpinLock(&DeviceExtension->PendingIrp.ListLock, oldIrql);
		DDbgPrint("  IrpQueue is Empty\n");
		return STATUS_SUCCESS;
	}

	KeQueryTickCount(&tickCount);

	// search timeout IRP through pending IRP list
	listHead = &DeviceExtension->PendingIrp.ListHead;

    for (thisEntry = listHead->Flink;
		thisEntry != listHead;
		thisEntry = nextEntry) {

        nextEntry = thisEntry->Flink;

        irpEntry = CONTAINING_RECORD(thisEntry, IRP_ENTRY, ListEntry);

		// this IRP is NOT timeout yet
		if ( (tickCount.QuadPart - irpEntry->TickCount.QuadPart) * KeQueryTimeIncrement()
			< DOKAN_IPR_PENDING_TIMEOUT * 10000 * 1000) {
			break;
		}

		RemoveEntryList(thisEntry);

		DDbgPrint(" timeout Irp #%X\n", irpEntry->SerialNumber);

		irp = irpEntry->Irp;

		if (irp == NULL) {
			// this IRP has already been canceled
			ASSERT(irpEntry->CancelRoutineFreeMemory == FALSE);
			ExFreePool(irpEntry);
			continue;
		}

		// this IRP is not canceled yet
		if (IoSetCancelRoutine(irp, NULL) == NULL) {
			// Cancel routine will run as soon as we release the lock
			InitializeListHead(&irpEntry->ListEntry);
			irpEntry->CancelRoutineFreeMemory = TRUE;
			continue;
		}
		// IrpEntry is saved here for CancelRoutine
		// Clear it to prevent to be completed by CancelRoutine twice
		irp->Tail.Overlay.DriverContext[DRIVER_CONTEXT_IRP_ENTRY] = NULL;
		InsertTailList(&completeList, &irpEntry->ListEntry);
	}

	if (IsListEmpty(&DeviceExtension->PendingIrp.ListHead)) {
		KeClearEvent(&DeviceExtension->PendingIrp.NotEmpty);
	}
	KeReleaseSpinLock(&DeviceExtension->PendingIrp.ListLock, oldIrql);
	
	while (!IsListEmpty(&completeList)) {
		listHead = RemoveHeadList(&completeList);
		irpEntry = CONTAINING_RECORD(listHead, IRP_ENTRY, ListEntry);
		irp = irpEntry->Irp;
		irp->IoStatus.Information = 0;
		irp->IoStatus.Status = STATUS_INSUFFICIENT_RESOURCES;
		ExFreePool(irpEntry);
		IoCompleteRequest(irp, IO_NO_INCREMENT);
	}

	DDbgPrint("<== ReleaseTimeoutPendingIRP\n");
	return STATUS_SUCCESS;
}



VOID
DokanTimeoutThread(
	PDEVICE_EXTENSION	DeviceExtension)
/*++

Routine Description:

	checks wheter pending IRP is timeout or not each DOKAN_CHECK_INTERVAL

--*/
{
	NTSTATUS		status;
	KTIMER			timer;
	PVOID			pollevents[2];
	LARGE_INTEGER	timeout = {0};

	DDbgPrint("==> DokanTimeoutThread\n");

	KeInitializeTimerEx(&timer, SynchronizationTimer);
	
	pollevents[0] = (PVOID)&DeviceExtension->KillEvent;
	pollevents[1] = (PVOID)&timer;

	KeSetTimerEx(&timer, timeout, DOKAN_CHECK_INTERVAL, NULL);
	
	while (TRUE) {
		status = KeWaitForMultipleObjects(2, pollevents, WaitAny,
			Executive, KernelMode, FALSE, NULL, NULL);
		
		if (!NT_SUCCESS(status) || status ==  STATUS_WAIT_0) {
			DDbgPrint("  DokanTimeoutThread catched KillEvent\n");
			// KillEvent or something error is occured
			break;
		}

		ReleaseTimeoutPendingIrp(DeviceExtension);
		if (DeviceExtension->UseKeepAlive)
			DokanCheckKeepAlive(DeviceExtension);
	}

	KeCancelTimer(&timer);

	DDbgPrint("<== DokanTimeoutThread\n");

	PsTerminateSystemThread(STATUS_SUCCESS);
}


NTSTATUS
DokanStartCheckThread(
	__in PDEVICE_EXTENSION	DeviceExtension)
/*++

Routine Description:

	execute DokanTimeoutThread

--*/
{
	NTSTATUS status;
	HANDLE	thread;

	DDbgPrint("==> DokanStartCheckThread\n");

	KeInitializeEvent(&DeviceExtension->KillEvent, NotificationEvent, FALSE);

	status = PsCreateSystemThread(&thread, THREAD_ALL_ACCESS,
		NULL, NULL, NULL, (PKSTART_ROUTINE)DokanTimeoutThread, DeviceExtension);

	if (!NT_SUCCESS(status)) {
		return status;
	}

	ObReferenceObjectByHandle(thread, THREAD_ALL_ACCESS, NULL,
		KernelMode, (PVOID*)&DeviceExtension->TimeoutThread, NULL);

	ZwClose(thread);

	DDbgPrint("<== DokanStartCheckThread\n");

	return STATUS_SUCCESS;
}


VOID
DokanStopCheckThread(
	__in PDEVICE_EXTENSION	DeviceExtension)
/*++

Routine Description:

	exits DokanTimeoutThread

--*/
{
	DDbgPrint("==> DokanStopCheckThread\n");
	
	KeSetEvent(&DeviceExtension->KillEvent, 0, FALSE);

	if (DeviceExtension->TimeoutThread) {
		KeWaitForSingleObject(DeviceExtension->TimeoutThread, Executive,
			KernelMode, FALSE, NULL);
		ObDereferenceObject(DeviceExtension->TimeoutThread);
	}
	
	DDbgPrint("<== DokanStopCheckThread\n");
}


NTSTATUS
DokanInformServiceAboutUnmount(
   __in PDEVICE_OBJECT	DeviceObject,
   __in PIRP			Irp)
{

	return STATUS_SUCCESS;
}

