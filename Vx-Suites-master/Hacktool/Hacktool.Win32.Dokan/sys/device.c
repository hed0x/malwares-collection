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
DokanDispatchDeviceControl(
	__in PDEVICE_OBJECT DeviceObject,
	__in PIRP Irp
	)

/*++

Routine Description:

	This device control dispatcher handles IOCTLs.

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
	NTSTATUS			status = STATUS_NOT_IMPLEMENTED;
	ULONG				controlCode;

	__try {
		//FsRtlEnterFileSystem();

		Irp->IoStatus.Information = 0;

		irpSp = IoGetCurrentIrpStackLocation(Irp);

		controlCode = irpSp->Parameters.DeviceIoControl.IoControlCode;
	
		if (controlCode != IOCTL_EVENT_WAIT && controlCode != IOCTL_EVENT_INFO) {
		
			DDbgPrint("==> DokanDispatchIoControl\n");
			DDbgPrint("  ProcessId %lu\n", IoGetRequestorProcessId(Irp));
		}

		vcb = DokanGetVcb(DeviceObject);
		deviceExtension = DokanGetDeviceExtension(DeviceObject);

		switch (irpSp->Parameters.DeviceIoControl.IoControlCode) {
		case IOCTL_TEST:
			{
				DDbgPrint("  IOCTL_TEST\n");
				if (irpSp->Parameters.DeviceIoControl.OutputBufferLength >= sizeof(ULONG)) {
					*(ULONG*)Irp->AssociatedIrp.SystemBuffer = DOKAN_VERSION;
					Irp->IoStatus.Information = sizeof(ULONG);
				}
				status = STATUS_SUCCESS;
			}
			break;

		case IOCTL_UNREGFS:
			DDbgPrint("  IOCTL_UNREGFS");
			IoUnregisterFileSystem(DeviceObject);
			DDbgPrint("    IoUnregisterFileSystem\n");
			status = STATUS_SUCCESS;
			break;

	//	case IOCTL_QUERY_DEVICE_NAME:
	//		DDbgPrint("  IOCTL_QUERY_DEVICE_NAME\n");
	//		status = STATUS_SUCCESS;
	//		break;
				
		case IOCTL_EVENT_WAIT:
			//DDbgPrint("  IOCTL_EVENT_WAIT\n");
			status = DokanRegisterPendingIrpForEvent(DeviceObject, Irp);
			break;

		case IOCTL_EVENT_INFO:
			//DDbgPrint("  IOCTL_EVENT_INFO\n");
			status = DokanCompleteIrp(DeviceObject, Irp);
			break;

		case IOCTL_EVENT_RELEASE:
			DDbgPrint("  IOCTL_EVENT_RELEASE\n");
			status = DokanEventRelease(DeviceObject);
			break;

		case IOCTL_EVENT_START:
			{
				/*
				WCHAR			deviceNameBuf[MAXIMUM_FILENAME_LENGTH];
				HANDLE			mupHandle;
				UNICODE_STRING	deviceName;
				swprintf(deviceNameBuf, NTDEVICE_NAME_STRING L"%u", 0);
				RtlInitUnicodeString(&deviceName, deviceNameBuf);

				status = FsRtlRegisterUncProvider(&mupHandle, &deviceName, FALSE);
				if (!NT_SUCCESS(status)) {
					STATUS_ACCESS_DENIED
					STATUS_ACCESS_VIOLATION
					STATUS_DATATYPE_MISALIGNMENT
					STATUS_INSUFFICIENT_RESOURCES
					STATUS_INVALID_HANDLE
					STATUS_INVALID_USER_BUFFER 
					DokanPrintNTStatus(status);
					DDbgPrint("    FsRtlRegisterUncProvider failed: 0x%X!\n", status);
				}
				*/
				DDbgPrint("  IOCTL_EVENT_START\n");
				status = DokanEventStart(DeviceObject, Irp);
			}
			break;

		case IOCTL_EVENT_WRITE:
			DDbgPrint("  IOCTL_EVENT_WRITE\n");
			status = DokanEventWrite(DeviceObject, Irp);
			break;

		case IOCTL_ALTSTREAM_ON:
			DDbgPrint("  IOCTL_ALTSTREAM_ON\n");
			// TODO: reset this value when umounted
			deviceExtension->UseAltStream = 1;
			status = STATUS_SUCCESS;
			break;

		case IOCTL_KEEPALIVE_ON:
			DDbgPrint("   IOCTL_KEEPALIVE_ON\n");
			// TODO: reset this value when umounted
			deviceExtension->UseKeepAlive = 1;
			status = STATUS_SUCCESS;
			break;

		case IOCTL_KEEPALIVE:
			KeEnterCriticalRegion();
			ExAcquireResourceExclusiveLite(&deviceExtension->Resource, TRUE);
			KeQueryTickCount(&deviceExtension->TickCount);
			ExReleaseResourceLite(&deviceExtension->Resource);
			KeLeaveCriticalRegion();
			status = STATUS_SUCCESS;
			break;

		case IOCTL_SERVICE_WAIT:
			status = DokanRegisterPendingIrpForService(DeviceObject, Irp);
			break;

		case IOCTL_DISK_CHECK_VERIFY:
			DDbgPrint("  IOCTL_DISK_CHECK_VERIFY\n");
			break;

		case IOCTL_STORAGE_CHECK_VERIFY:
			DDbgPrint("  IOCTL_STORAGE_CHECK_VERIFY\n");
			break;

		case IOCTL_STORAGE_CHECK_VERIFY2:
			DDbgPrint("  IOCTL_STORAGE_CHECK_VERIFY2\n");
			break;

		case IOCTL_DISK_GET_DRIVE_GEOMETRY:
			{
				PDISK_GEOMETRY	diskGeometry;
				ULONG		    length;

				DDbgPrint("  IOCTL_DISK_GET_DRIVE_GEOMETRY\n");
				if (irpSp->Parameters.DeviceIoControl.OutputBufferLength <
					sizeof(DISK_GEOMETRY)) {
					status = STATUS_BUFFER_TOO_SMALL;
					Irp->IoStatus.Information = 0;
					break;
				}

				diskGeometry = (PDISK_GEOMETRY) Irp->AssociatedIrp.SystemBuffer;
				ASSERT(diskGeometry != NULL);

				length = 1024*1024*1024;
				diskGeometry->Cylinders.QuadPart = length / DOKAN_SECTOR_SIZE / 32 / 2;
				diskGeometry->MediaType = FixedMedia;
				diskGeometry->TracksPerCylinder = 2;
				diskGeometry->SectorsPerTrack = 32;
				diskGeometry->BytesPerSector = DOKAN_SECTOR_SIZE;

				status = STATUS_SUCCESS;
				Irp->IoStatus.Information = sizeof(DISK_GEOMETRY);
			}
			break;

		case IOCTL_DISK_GET_LENGTH_INFO:
			{
				PGET_LENGTH_INFORMATION getLengthInfo;

				DDbgPrint("  IOCTL_DISK_GET_LENGTH_INFO\n");
	            
				if (irpSp->Parameters.DeviceIoControl.OutputBufferLength <
					sizeof(GET_LENGTH_INFORMATION)) {
					status = STATUS_BUFFER_TOO_SMALL;
					Irp->IoStatus.Information = 0;
					break;
				}

				getLengthInfo = (PGET_LENGTH_INFORMATION) Irp->AssociatedIrp.SystemBuffer;
				ASSERT(getLengthInfo != NULL);

				getLengthInfo->Length.QuadPart = 1024*1024*500;
				status = STATUS_SUCCESS;
				Irp->IoStatus.Information = sizeof(GET_LENGTH_INFORMATION);
			}
			break;

		case IOCTL_DISK_GET_PARTITION_INFO:
			DDbgPrint("  IOCTL_DISK_GET_PARTITION_INFO\n");
			break;

		case IOCTL_DISK_GET_PARTITION_INFO_EX:
			DDbgPrint("  IOCTL_DISK_GET_PARTITION_INFO_EX\n");
			break;

		case IOCTL_DISK_IS_WRITABLE:
			DDbgPrint("  IOCTL_DISK_IS_WRITABLE\n");
			status = STATUS_SUCCESS;
			break;

		case IOCTL_DISK_MEDIA_REMOVAL:
			DDbgPrint("  IOCTL_DISK_MEDIA_REMOVAL\n");
			status = STATUS_SUCCESS;
			break;

		case IOCTL_STORAGE_MEDIA_REMOVAL:
			DDbgPrint("  IOCTL_STORAGE_MEDIA_REMOVAL\n");
			status = STATUS_SUCCESS;
			break;

		case IOCTL_DISK_SET_PARTITION_INFO:
			DDbgPrint("  IOCTL_DISK_SET_PARTITION_INFO\n");
			break;

		case IOCTL_DISK_VERIFY:
			DDbgPrint("  IOCTL_DISK_VERIFY\n");
			break;

		default:
			//ASSERT(FALSE);	// should never hit this
			//status = STATUS_NOT_IMPLEMENTED;
			DDbgPrint("   Unknown Code 0x%x\n", irpSp->Parameters.DeviceIoControl.IoControlCode);
			status = STATUS_NOT_IMPLEMENTED;
			break;
		} // switch IoControlCode
	
	} __finally {

		if (status != STATUS_PENDING) {
			//
			// complete the Irp
			//
			Irp->IoStatus.Status = status;
			IoCompleteRequest(Irp, IO_NO_INCREMENT);
		}

		if (controlCode != IOCTL_EVENT_WAIT && controlCode != IOCTL_EVENT_INFO) {
		
			DokanPrintNTStatus(status);
			DDbgPrint("<== DokanDispatchIoControl\n");
		}

		//FsRtlExitFileSystem();
	}

	return status;
}
