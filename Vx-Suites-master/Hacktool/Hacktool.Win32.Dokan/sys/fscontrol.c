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
DokanUserFsRequest(
	__in PDEVICE_EXTENSION	DeviceExtension,
	__in PIRP				Irp
	)
{
	NTSTATUS			status = STATUS_NOT_IMPLEMENTED;
	PIO_STACK_LOCATION	irpSp;

	irpSp = IoGetCurrentIrpStackLocation(Irp);

	switch(irpSp->Parameters.FileSystemControl.FsControlCode) {
	case FSCTL_LOCK_VOLUME:
		DDbgPrint("    FSCTL_LOCK_VOLUME\n");
		status = STATUS_SUCCESS;
		break;

	case FSCTL_UNLOCK_VOLUME:
		DDbgPrint("    FSCTL_UNLOCK_VOLUME\n");
		status = STATUS_SUCCESS;
		break;

	case FSCTL_DISMOUNT_VOLUME:
		DDbgPrint("    FSCTL_DISMOUNT_VOLUME\n");
		break;

	case FSCTL_MARK_VOLUME_DIRTY:
		DDbgPrint("    FSCTL_MARK_VOLUME_DIRTY\n");
		status = STATUS_SUCCESS;
		break;

	case FSCTL_IS_VOLUME_MOUNTED:
		DDbgPrint("    FSCTL_IS_VOLUME_MOUNTED\n");
		status = STATUS_SUCCESS;
		break;

	case FSCTL_IS_PATHNAME_VALID:
		DDbgPrint("    FSCTL_IS_PATHNAME_VALID\n");
		status = STATUS_SUCCESS;
		break;

	case FSCTL_GET_RETRIEVAL_POINTERS:
		DDbgPrint("    FSCTL_GET_RETRIEVAL_POINTERS\n");
		status = STATUS_INVALID_PARAMETER;
		break;

	default:
		KdPrint(("    Unknown FSCTL %d\n",
			(irpSp->Parameters.FileSystemControl.FsControlCode >> 2) & 0xFFF));
		status = STATUS_INVALID_DEVICE_REQUEST;
	}

	return status;
}



NTSTATUS
DokanDispatchFileSystemControl(
	__in PDEVICE_OBJECT DeviceObject,
	__in PIRP Irp
	)
{
	NTSTATUS			status = STATUS_INVALID_PARAMETER;
	PIO_STACK_LOCATION	irpSp;
	PDokanVCB			vcb;
	PDEVICE_EXTENSION	deviceExtension;

	PAGED_CODE();

	__try {
		//FsRtlEnterFileSystem();

		DDbgPrint("==> DokanFileSystemControl\n");

		DDbgPrint("  ProcessId %lu\n", IoGetRequestorProcessId(Irp));

		vcb = DokanGetVcb(DeviceObject);
		deviceExtension = DokanGetDeviceExtension(DeviceObject);

		irpSp = IoGetCurrentIrpStackLocation(Irp);

		switch(irpSp->MinorFunction) {
		case IRP_MN_KERNEL_CALL:
			DDbgPrint("	IRP_MN_KERNEL_CALL\n");
			break;
		case IRP_MN_LOAD_FILE_SYSTEM:
			DDbgPrint("	IRP_MN_LOAD_FILE_SYSTEM\n");
			break;
		case IRP_MN_MOUNT_VOLUME:
			DDbgPrint("	IRP_MN_MOUNT_VOLUME\n");
			break;
		case IRP_MN_USER_FS_REQUEST:
			{
				DDbgPrint("	IRP_MN_USER_FS_REQUEST\n");
				DDbgPrint("  code %d\n", irpSp->Parameters.FileSystemControl.FsControlCode);
				status = DokanUserFsRequest(deviceExtension, Irp);
			}
			break;
		case IRP_MN_VERIFY_VOLUME:
			DDbgPrint("	IRP_MN_VERIFY_VOLUME\n");
			break;
		default:
			DDbgPrint("  unknown %d\n", irpSp->MinorFunction);
			break;
		}

	} __finally {
		
		Irp->IoStatus.Status = status;
		Irp->IoStatus.Information = 0;
		IoCompleteRequest(Irp, IO_NO_INCREMENT);

		DokanPrintNTStatus(status);
		DDbgPrint("<== DokanFileSystemControl\n");

		//FsRtlExitFileSystem();
	}

	return status;
}

