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

#ifndef _DOKAN_H_
#define _DOKAN_H_


#include <ntifs.h>
#include <ntdddisk.h>

#include "public.h"

//
// DEFINES
//

int __cdecl swprintf(wchar_t *, const wchar_t *, ...);

#define NTDEVICE_NAME_STRING	L"\\Device\\dokan"
#define SYMBOLIC_NAME_STRING    L"\\DosDevices\\dokan"
#define VOLUME_LABEL			L"DOKAN"

#define TAG (ULONG)'AKOD'


#ifdef ExAllocatePool
#undef ExAllocatePool
#endif
#define ExAllocatePool(size)	ExAllocatePoolWithTag(NonPagedPool, size, TAG)

#define DRIVER_CONTEXT_EVENT		2
#define DRIVER_CONTEXT_IRP_ENTRY	3


#define DOKAN_NOTIFICATION_TIMEOUT	15 // in seconds
#define DOKAN_UNMOUNT_NOTIFICATION_TIMEOUT 5 // in seconds

#define DOKAN_IPR_PENDING_TIMEOUT	15 // in seconds
#define DOKAN_CHECK_INTERVAL		(1000 * 5) // in millisecond

#define DOKAN_KEEPALIVE_TIMEOUT		15 // in seconds

//#define USE_DBGPRINT 1

#ifdef USE_DBGPRINT
	#define DDbgPrint(...)		DbgPrint(__VA_ARGS__)
#else
	#if _WIN32_WINNT >= 0x0501
		#define DDbgPrint(...)	\
			KdPrintEx((DPFLTR_IHVDRIVER_ID, DPFLTR_TRACE_LEVEL, __VA_ARGS__ ))
	#else
		#define DDbgPrint(...) KdPrint((__VA_ARGS__))
	#endif
#endif

#if _WIN32_WINNT < 0x0501
	extern PFN_FSRTLTEARDOWNPERSTREAMCONTEXTS DokanFsRtlTeardownPerStreamContexts;
#endif

//
// FSD_IDENTIFIER_TYPE
//
// Identifiers used to mark the structures
//
typedef enum _FSD_IDENTIFIER_TYPE {
    DVE = ':DVE', // Devcie Extension
    VCB = ':VCB', // Volume Control Block
    FCB = ':FCB', // File Control Block
    CCB = ':CCB', // Context Control Block
} FSD_IDENTIFIER_TYPE;

//
// FSD_IDENTIFIER
//
// Header put in the beginning of every structure
//
typedef struct _FSD_IDENTIFIER {
    FSD_IDENTIFIER_TYPE     Type;
    ULONG                   Size;
} FSD_IDENTIFIER, *PFSD_IDENTIFIER;

//
// DATA
//


typedef struct _IRP_LIST {
	LIST_ENTRY		ListHead;
	KEVENT			NotEmpty;
	KSPIN_LOCK		ListLock;
} IRP_LIST, *PIRP_LIST;


typedef struct _DOKAN_GLOBAL {
	FSD_IDENTIFIER	Identifier;
	ERESOURCE		Resource;
	// the list of waiting IRP for mount service
	IRP_LIST		PendingService;
	IRP_LIST		NotifyService;

} DOKAN_GLOBAL, *PDOKAN_GLOBAL;


// DokanGetDeviceExtension refers Identifier which locates head of VCB
// and DeviceExtension, so make sure Identifier is the top of struct
typedef struct _DokanVolumeControlBlock {

	FSD_IDENTIFIER				Identifier;

	ERESOURCE					Resource;
	PDEVICE_OBJECT				DiskDevice;
	PVOID						DeviceExtension;
	LIST_ENTRY					NextFCB;

	// NotifySync is used by notify directory change
    PNOTIFY_SYNC				NotifySync;
    LIST_ENTRY					DirNotifyList;

} DokanVCB, *PDokanVCB;


typedef struct _DEVICE_EXTENSION {

	FSD_IDENTIFIER			Identifier;

	ERESOURCE				Resource;

	PDOKAN_GLOBAL			Global;
	PDRIVER_OBJECT			DriverObject;
	PDEVICE_OBJECT			DeviceObject;
	
	PDokanVCB				Vcb;

	// the list of waiting Event
	IRP_LIST				PendingIrp;
	IRP_LIST				PendingEvent;
	IRP_LIST				NotifyEvent;

	// while mounted, Mounted is set to drive letter
	ULONG					Mounted;

	// When timeout is occuerd, KillEvent is triggered.
	KEVENT					KillEvent;

	KEVENT					ReleaseEvent;

	// the thread to deal with timeout
	PKTHREAD				TimeoutThread;

	PKTHREAD				EventNotificationThread;

	// Device Number
	ULONG					Number;

	// When UseAltStream is 1, use Alternate stream
	ULONG					UseAltStream;

	ULONG					UseKeepAlive;

	// to make a unique id for pending IRP
	ULONG					SerialNumber;

	ULONG					MountId;

	LARGE_INTEGER			TickCount;

	CACHE_MANAGER_CALLBACKS CacheManagerCallbacks;
    CACHE_MANAGER_CALLBACKS CacheManagerNoOpCallbacks;
} DEVICE_EXTENSION, *PDEVICE_EXTENSION;

// used in CCB->Flags
#define DOKAN_FILE_DIRECTORY	1
#define DOKAN_FILE_DELETED		2
#define DOKAN_FILE_OPENED		4
#define DOKAN_DIR_MATCH_ALL		8
#define DOKAN_DELETE_ON_CLOSE	16

typedef struct _DokanFileControlBlock
{
	FSRTL_ADVANCED_FCB_HEADER	AdvancedFCBHeader;

	FSD_IDENTIFIER				Identifier;

	SECTION_OBJECT_POINTERS		SectionObjectPointers;
	
	FAST_MUTEX				AdvancedFCBHeaderMutex;

	ERESOURCE				MainResource;
	ERESOURCE				PagingIoResource;
	
	PDokanVCB				Vcb;
	LIST_ENTRY				NextFCB;
	ERESOURCE				Resource;
	LIST_ENTRY				NextCCB;

	ULONG					FileCount;

	ULONG					Flags;

	UNICODE_STRING			FileName;

	//uint32 ReferenceCount;
	//uint32 OpenHandleCount;
} DokanFCB, *PDokanFCB;



typedef struct _DokanContextControlBlock
{
	FSD_IDENTIFIER		Identifier;
	ERESOURCE			Resource;
	PDokanFCB			Fcb;
	LIST_ENTRY			NextCCB;
	ULONG64				Context;
	ULONG64				UserContext;
	
	PVOID				SearchPattern;
	ULONG				SearchPatternLength;

	ULONG				Flags;

	int					FileCount;
	ULONG				MountId;
} DokanCCB, *PDokanCCB;


// IRP list which has pending status
// this structure is also used to store event notification IRP
typedef struct _IRP_ENTRY {
	LIST_ENTRY			ListEntry;
	ULONG				SerialNumber;
	PDEVICE_EXTENSION	DeviceExtension;
	PIRP				Irp;
	PIO_STACK_LOCATION	IrpSp;
	PFILE_OBJECT		FileObject;
	BOOLEAN				CancelRoutineFreeMemory;
	LARGE_INTEGER		TickCount;
	PIRP_LIST			IrpList;
} IRP_ENTRY, *PIRP_ENTRY;


typedef struct _DRIVER_EVENT_CONTEXT {
	LIST_ENTRY		ListEntry;
	EVENT_CONTEXT	EventContext;
} DRIVER_EVENT_CONTEXT, *PDRIVER_EVENT_CONTEXT;


DRIVER_INITIALIZE DriverEntry;

DRIVER_DISPATCH DokanDispatchCreate;

DRIVER_DISPATCH DokanDispatchClose;

DRIVER_DISPATCH DokanDispatchRead;

DRIVER_DISPATCH DokanDispatchWrite;

DRIVER_DISPATCH DokanDispatchFlush;

DRIVER_DISPATCH DokanDispatchCleanup;

DRIVER_DISPATCH DokanDispatchDeviceControl;

DRIVER_DISPATCH DokanDispatchFileSystemControl;

DRIVER_DISPATCH DokanDispatchDirectoryControl;

DRIVER_DISPATCH DokanDispatchQueryInformation;

DRIVER_DISPATCH DokanDispatchSetInformation;

DRIVER_DISPATCH DokanDispatchQueryVolumeInformation;

DRIVER_DISPATCH DokanDispatchSetVolumeInformation;

DRIVER_DISPATCH DokanDispatchShutdown;

DRIVER_DISPATCH DokanDispatchPnp;

DRIVER_DISPATCH DokanDispatchLock;

DRIVER_UNLOAD DokanUnload;



DRIVER_CANCEL DokanEventCancelRoutine;

DRIVER_CANCEL DokanIrpCancelRoutine;

DRIVER_DISPATCH DokanRegisterPendingIrpForEvent;

DRIVER_DISPATCH DokanRegisterPendingIrpForService;

DRIVER_DISPATCH DokanCompleteIrp;

NTSTATUS
DokanEventRelease(
	__in PDEVICE_OBJECT DeviceObject);


DRIVER_DISPATCH DokanEventStart;

DRIVER_DISPATCH DokanEventWrite;

PEVENT_CONTEXT
AllocateEventContext(
	__in PDEVICE_EXTENSION	DeviceExtension,
	__in PIRP				Irp,
	__in ULONG				EventContextLength);

VOID
DokanFreeEventContext(
	__in PEVENT_CONTEXT	EventContext);


NTSTATUS
DokanRegisterPendingIrp(
    __in PDEVICE_OBJECT DeviceObject,
    __in PIRP			Irp,
	__in PEVENT_CONTEXT	EventContext);


VOID
DokanEventNotification(
	__in PIRP_LIST		NotifyEvent,
	__in PEVENT_CONTEXT	EventContext);


NTSTATUS
DokanUnmountNotification(
	__in PDEVICE_EXTENSION	DeviceExtension,
	__in PEVENT_CONTEXT		EventContext);


VOID
DokanCompleteDirectoryControl(
	__in PIRP_ENTRY			IrpEntry,
	__in PEVENT_INFORMATION	EventInfo);

VOID
DokanCompleteRead(
	__in PIRP_ENTRY			IrpEntry,
	__in PEVENT_INFORMATION	EventInfo);

VOID
DokanCompleteWrite(
	__in PIRP_ENTRY			IrpEntry,
	__in PEVENT_INFORMATION	EventInfo);


VOID
DokanCompleteQueryInformation(
	__in PIRP_ENTRY			IrpEntry,
	__in PEVENT_INFORMATION	EventInfo);


VOID
DokanCompleteSetInformation(
	__in PIRP_ENTRY			IrpEntry,
	__in PEVENT_INFORMATION EventInfo);

VOID
DokanCompleteCreate(
	__in PIRP_ENTRY			IrpEntry,
	__in PEVENT_INFORMATION	EventInfo);


VOID
DokanCompleteCleanup(
	__in PIRP_ENTRY			IrpEntry,
	__in PEVENT_INFORMATION	EventInfo);


VOID
DokanCompleteLock(
	__in PIRP_ENTRY			IrpEntry,
	__in PEVENT_INFORMATION	EventInfo);

VOID
DokanCompleteQueryVolumeInformation(
	__in PIRP_ENTRY			IrpEntry,
	__in PEVENT_INFORMATION	EventInfo);

VOID
DokanCompleteFlush(
	__in PIRP_ENTRY			IrpEntry,
	__in PEVENT_INFORMATION	EventInfo);

VOID
DokanNoOpRelease (
    IN PVOID Fcb);

BOOLEAN
DokanNoOpAcquire(
    IN PVOID Fcb,
    IN BOOLEAN Wait);

NTSTATUS
DokanCreateDiskDevice(
	__in PDRIVER_OBJECT DriverObject,
	__in ULONG			Number,
	__in PDOKAN_GLOBAL	DokanGlobal);

PDokanVCB
DokanGetVcb (
	 __in PDEVICE_OBJECT DeviceObject);

PDEVICE_EXTENSION
DokanGetDeviceExtension (
	  __in PDEVICE_OBJECT DeviceObject);

VOID
DokanSetCommonEventContext(
	PDEVICE_EXTENSION	DeviceExtension,
	PEVENT_CONTEXT		EventContext,
	PIRP				Irp);

VOID
DokanPrintNTStatus(
	NTSTATUS	Status);


VOID
DokanNotifyReportChange0(
	__in PDokanFCB				Fcb,
	__in PUNICODE_STRING		FileName,
	__in ULONG					FilterMatch,
	__in ULONG					Action);

VOID
DokanNotifyReportChange(
	__in PDokanFCB	Fcb,
	__in ULONG		FilterMatch,
	__in ULONG		Action);


PDokanFCB
DokanAllocateFCB(
	__in PDokanVCB Vcb);


NTSTATUS
DokanFreeFCB(
  __in PDokanFCB Fcb);


PDokanCCB
DokanAllocateCCB(
	__in PDEVICE_EXTENSION DeviceExtension,
	__in PDokanFCB	Fcb);


NTSTATUS
DokanFreeCCB(
  __in PDokanCCB Ccb);

NTSTATUS
DokanStartCheckThread(
	__in PDEVICE_EXTENSION	DeviceExtension);

VOID
DokanStopCheckThread(
	__in PDEVICE_EXTENSION	DeviceExtension);


BOOLEAN
DokanCheckCCB(
	__in PDEVICE_EXTENSION	DeviceExtension,
	__in PDokanCCB	Ccb);

VOID
DokanInitIrpList(
	 __in PIRP_LIST		IrpList);

NTSTATUS
DokanStartEventNotificationThread(
	__in PDEVICE_EXTENSION	DeviceExtension);

VOID
DokanStopEventNotificationThread(
	__in PDEVICE_EXTENSION	DeviceExtension);

#endif // _DOKAN_H_

