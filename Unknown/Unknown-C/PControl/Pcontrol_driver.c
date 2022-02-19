   /*pControl driver
   coded by v1rusL4ir (2008) viruslair[at]ihrisko[dot]org

       This code is freeware.You can use,modify,distribute this code
       but you can't sell it or use as part of commercial software without my approval.
       Contact me and we can make a deal.

       Use this code/tool at own risk.Im not responsible of anything you do with this code.
       I don't take responsibility of any damage caused by improper usage of this code/tool
       Keep the original copyright but dont misrepresent modifyed version as original one.
   */


   #include <ntddk.h>
   #include <windef.h>

   #define DEVICE_NAME L"\\Device\\PControl_device"
   #define DEVICE_LINK L"\\DosDevices\\PControl_device"
   #define INDEX_MAX 10

   PDEVICE_OBJECT g_DriverDevice;
   HANDLE g_hFile;

   BOOLEAN g_notify = FALSE,g_open = FALSE;

   typedef struct pinfo{
       HANDLE parent;
       HANDLE process;
       BOOLEAN create;
   }PROC_INFO;

   PROC_INFO *p_buffer;
   UINT index = 0;

   VOID NotifyRoutine (HANDLE  parentId,HANDLE  processId,BOOLEAN  Create)
   {
       PROC_INFO p_info;
       p_info.parent  = parentId;
       p_info.process = processId;
       p_info.create  = Create;

       if(Create) DbgPrint("Execution detected.PID :%d",processId);
       else DbgPrint("Termination detected.PID :%d",processId);

       DbgPrint("index: %d\n",index);

       if( index < INDEX_MAX ){
           memcpy(&p_buffer[index],&p_info,sizeof(PROC_INFO));
           index++;
       }
   }

   NTSTATUS OnRead (IN PDEVICE_OBJECT DeviceObject, IN PIRP Irp)
   {
       NTSTATUS NtStatus = STATUS_UNSUCCESSFUL;
       void *pBuffer;
       UINT dwDataRead = 0;
       DWORD i, Written , SendCount;
       PIO_STACK_LOCATION pIoStackIrp = NULL;

       pIoStackIrp = IoGetCurrentIrpStackLocation(Irp);

       if(pIoStackIrp && Irp->MdlAddress){
           if(index > 0){
               if((pBuffer = MmGetSystemAddressForMdlSafe(Irp->MdlAddress, NormalPagePriority)) != NULL){
                   SendCount = pIoStackIrp->Parameters.Read.Length / sizeof(PROC_INFO);

                   if(SendCount > index)
                       SendCount = index;

                   if(SendCount >= 1){

                       dwDataRead = SendCount * sizeof(PROC_INFO);
                       memcpy(pBuffer, p_buffer, SendCount * sizeof(PROC_INFO));

                       index -= SendCount;

                       if(index)
                           memmove(p_buffer, &p_buffer[SendCount], index * sizeof(PROC_INFO));

                       NtStatus = STATUS_SUCCESS;
                   }
               }
           }
       }

       Irp->IoStatus.Status = NtStatus;
       Irp->IoStatus.Information = dwDataRead;
       IoCompleteRequest(Irp, IO_NO_INCREMENT);

       return NtStatus;
   }
   NTSTATUS OnWrite (IN PDEVICE_OBJECT DeviceObject, IN PIRP Irp){
       DbgPrint("DRIVER: Writing do device detected\n");

       return STATUS_SUCCESS;
   }

   NTSTATUS OnCreate (IN PDEVICE_OBJECT DeviceObject, IN PIRP Irp){
       if(PsSetCreateProcessNotifyRoutine(NotifyRoutine,FALSE) == STATUS_INVALID_PARAMETER){
           DbgPrint("DRIVER: Error registering notify routine.\n");
           return STATUS_UNSUCCESSFUL;
       }
       g_notify = TRUE;
       DbgPrint("Notify callback registered successfully.\n");

       return STATUS_SUCCESS;
   }

   NTSTATUS OnClose (IN PDEVICE_OBJECT DeviceObject, IN PIRP Irp){
       if(g_notify){
           PsSetCreateProcessNotifyRoutine(NotifyRoutine,TRUE);
           g_notify = FALSE;
           DbgPrint("DRIVER: Notify callback unregistered.\n");
       }
       return STATUS_SUCCESS;
   }

   NTSTATUS Unsupported(PDEVICE_OBJECT DeviceObject, PIRP Irp){
     return STATUS_NOT_SUPPORTED;
   }


   VOID OnUnload(IN PDRIVER_OBJECT DriverObject){

       UNICODE_STRING deviceLink;
       if(g_notify){
           PsSetCreateProcessNotifyRoutine(NotifyRoutine,TRUE);
           DbgPrint("DRIVER: Unload called.Removing callback.\n");
       }

       ExFreePoolWithTag((PVOID)p_buffer, 'ATAD');

       RtlInitUnicodeString( &deviceLink, DEVICE_LINK );
       IoDeleteSymbolicLink( &deviceLink );
       IoDeleteDevice( DriverObject->DeviceObject );
       DbgPrint("DRIVER: removed I/O device.\n");
   }

   NTSTATUS DriverEntry(IN PDRIVER_OBJECT DriverObject,IN PUNICODE_STRING theRegistryPath)
   {
       UNICODE_STRING deviceName,deviceLink;
       NTSTATUS status;
       UINT i;

       // Register a dispatch function for Unload
       DriverObject->DriverUnload = OnUnload;

       if((p_buffer = (PROC_INFO *)ExAllocatePoolWithTag(NonPagedPool, sizeof(PROC_INFO) * INDEX_MAX, 'ATAD')) == NULL){
           DbgPrint("DRIVER: Cannot allocate memory \n");
           return STATUS_UNSUCCESSFUL;
       }

       RtlInitUnicodeString(&deviceName,DEVICE_NAME);
       RtlInitUnicodeString(&deviceLink,DEVICE_LINK);

       status = IoCreateDevice ( DriverObject,0,&deviceName,FILE_DEVICE_UNKNOWN,0,TRUE,&g_DriverDevice );
       if( NT_SUCCESS(status)) {
           status = IoCreateSymbolicLink (&deviceLink,&deviceName);
           DbgPrint("DRIVER: I/O device created.\n");
       }else{
           DbgPrint("DRIVER: failed to create I/O device\n");
           return STATUS_UNSUCCESSFUL;
       }

       // set unsupported
       for(i = 0; i < IRP_MJ_MAXIMUM_FUNCTION; i++)
           DriverObject->MajorFunction[i] = Unsupported;

       // register handling function
       DriverObject->MajorFunction[IRP_MJ_READ]            = OnRead; // when there was an reading operation
       DriverObject->MajorFunction[IRP_MJ_WRITE]           = OnWrite;// when there was writing operation
       DriverObject->MajorFunction[IRP_MJ_CREATE]          = OnCreate;
       DriverObject->MajorFunction[IRP_MJ_CLOSE]           = OnClose;

       g_DriverDevice->Flags |= DO_DIRECT_IO;
       g_DriverDevice->Flags &= ~DO_DEVICE_INITIALIZING;

       return STATUS_SUCCESS;
   }
