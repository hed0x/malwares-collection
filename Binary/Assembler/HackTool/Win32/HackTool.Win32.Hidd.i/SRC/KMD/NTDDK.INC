;======================================================================================
DRIVER_OBJECT                              STRUCT
 DRIVER_OBJECT_START_OFFSET                 WORD 4
 DRIVER_OBJECT_STRUC_SIZE                   WORD SIZEOF DRIVER_OBJECT ;0A8H
 _PDEVICE_OBJECT                            DWORD PTR DEVICE_OBJECT
 FLAGS                                     DWORD 000H
 DRIVER_IMAGE_START                        DWORD ?
 DRIVER_IMAGE_SIZE                         DWORD ?
 PDRIVER_MODULE                            DWORD ?
 PDRVEXT                                   DWORD ?
 DEVICENAME                                UNICODE_STRING <> 
 PHWDATABASE                               DWORD ?

 PFAST_IO_DISPATCH                         DWORD ?
 PDRIVER_INITIALIZE                        DWORD ?
 PDRIVER_STARTIO                           DWORD ?
 PDRIVER_UNLOAD                            DWORD ?

 PDISPATCH_IRP_MJ_CREATE                   DWORD ?
 PDISPATCH_IRP_MJ_CREATE_NAMED_PIPE        DWORD ?
 PDISPATCH_IRP_MJ_CLOSE                    DWORD ?
 PDISPATCH_IRP_MJ_READ                     DWORD ?
 PDISPATCH_IRP_MJ_WRITE                    DWORD ?
 PDISPATCH_IRP_MJ_QUERY_INFORMATION        DWORD ?
 PDISPATCH_IRP_MJ_SET_INFORMATION          DWORD ?
 PDISPATCH_IRP_MJ_QUERY_EA                 DWORD ?
 PDISPATCH_IRP_MJ_SET_EA                   DWORD ?
 PDISPATCH_IRP_MJ_FLUSH_BUFFERS            DWORD ?
 PDISPATCH_IRP_MJ_QUERY_VOLUME_INFORMATION DWORD ?
 PDISPATCH_IRP_MJ_SET_VOLUME_INFORMATION   DWORD ?
 PDISPATCH_IRP_MJ_DIRECTORY_CONTROL        DWORD ?
 PDISPATCH_IRP_MJ_FILE_SYSTEM_CONTROL      DWORD ?
 PDISPATCH_IRP_MJ_DEVICE_CONTROL           DWORD ?
 PDISPATCH_IRP_MJ_INTERNAL_DEVICE_CONTROL  DWORD ?
 PDISPATCH_IRP_MJ_SHUT_DOWN                DWORD ?
 PDISPATCH_IRP_MJ_LOCKCONTROL              DWORD ?
 PDISPATCH_IRP_MJ_CLEANUP                  DWORD ?
 PDISPATCH_IRP_MJ_CREATE_MAILSLOT          DWORD ?
 PDISPATCH_IRP_MJ_QUERY_SECURITY           DWORD ?
 PDISPATCH_IRP_MJ_SET_SECURITY             DWORD ?
 PDISPATCH_IRP_MJ_SET_POWER                DWORD ?
 PDISPATCH_IRP_MJ_WMI                      DWORD ?
 PDISPATCH_IRP_MJ_18                       DWORD ?
 PDISPATCH_IRP_MJ_19                       DWORD ?
 PDISPATCH_IRP_MJ_1A                       DWORD ?
 PDISPATCH_IRP_MJ_1B                       DWORD ?
DRIVER_OBJECT                              ENDS

PDRIVER_OBJECT                 TYPEDEF     PTR DRIVER_OBJECT
;======================================================================================

DEVICE_OBJECT                              STRUCT
 DEVICE_OBJECT_OFFSET                       WORD 3 ;?
 DEVICE_OBJECT_SIZE                         WORD 108H ;SIZEOF DEVICE_OBJECT
 CURRENT_COUNT                             DWORD ?
 PDRIVER_OBJECT                            DWORD PTR DRIVER_OBJECT
 PNEXT_DEVICE_OBJECT                       DWORD PTR DEVICE_OBJECT
 PATTACHED_DEVICE_OBJECT                   DWORD PTR DEVICE_OBJECT
 PCURRENT_IRP                              DWORD PTR _IRP
 PTIMER                                    DWORD ?
 FLAGS                                     DWORD ?
 CHARACTERISTIC                            DWORD ?
 PVPB                                      DWORD ?
 PDEVICE_EXTENSION                         DWORD ?
 DEVICE_TYPE                               DWORD ?
 STACK_SIZE                                DWORD ?
 ALLIGNMENT_REQUIREMENT                    DWORD ?
 ;dodelat
 ;......
DEVICE_OBJECT                              ENDS


PDEVICE_OBJECT               TYPEDEF       PTR   DEVICE_OBJECT

 ;DEVICE_FLAGS  
 DO_BUFFERED_IO                              EQU 0004H
 DO_DEVICE_HAS_NAME                          EQU 0040H

 ;DEVICE_TYPE  LZE POUZIT TO Z W32MAIN, ALE SHR 16
 ;DEV_TYPE ENUM FILE_DEVICE_NONE, FILE_DEVICE_BEEP
;======================================================================================

IO_READ                                    STRUCT
 _Length                                   DWORD ?
 Key                                       DWORD ?
 ByteOffset                                DWORD ?
IO_READ                                    ENDS

IO_WRITE                                   STRUCT
 _Length                                   DWORD ?
 Key                                       DWORD ?
 ByteOffset                                DWORD ?
IO_WRITE                                   ENDS

IO_CONTROL                                 STRUCT
 OutputBufferLength                        DWORD ?
 InputBufferLength                         DWORD ?
 IoControlCode                             DWORD ?
 Type3InputBuffer                          DWORD ?
IO_CONTROL                                 ENDS

IO_SCSI                                    STRUCT
 PSCSI_REQUEST_BLOCK                       DWORD ?
IO_SCSI                                    ENDS



IO_STACK_LOCATION                          STRUCT
 MajorFunction                              BYTE ?
 MinorFunction                              BYTE ?
 Flags                                      BYTE ?
 Control                                    BYTE ?
                                            UNION
 Read                                        IO_READ {}
 Write                                       IO_WRITE {}
 DeviceIoControl                             IO_CONTROL {}
 Scsi                                        IO_SCSI {}
 PDEVICE_OBJECT                              DWORD PTR DEVICE_OBJECT ?
 PFILE_OBJECT                                DWORD PTR FILE_OBJECT ?
 PCompletionRoutine                          DWORD ?
 PContext                                    DWORD ?
                                            ENDS
IO_STACK_LOCATION                          ENDS

PIO_STACK_LOCATION   TYPEDEF               PTR IO_STACK_LOCATION
;======================================================================================

FILE_DEVICE_UNKNOWN EQU 22H
FILE_OBJECT                                STRUCT
FILE_OBJECT                                ENDS
;======================================================================================

;COMMENT  $ jiz definovano
IO_STATUS_BLOCK                            STRUCT 
 Status                                    DWORD ?
 Information                               DWORD ?
IO_STATUS_BLOCK                            ENDS 
;         $
;======================================================================================

_IRP                                        STRUCT
                                            WORD 6
                                            WORD SIZEOF _IRP  ;94H
 PMdlAddress                               DWORD ?
 Flags                                     DWORD ?
                                           UNION  ;AssociatedIrp
 PMasterIrp                                 DWORD ? ;PTR _IRP
 SystemBuffer                               DWORD ?
                                           ENDS   ;AssociatedIrp
 ThreadListEntry                           DWORD ?
                                           DWORD ?
 IoStatus                                  IO_STATUS_BLOCK <> ;{}                    
 RequestorMode                              BYTE ?
 PendingReturned                            BYTE ? ;boolean
 StackCount                                 BYTE ?
 CurrentLocation                            BYTE ?
 Cancel                                     BYTE ? ;boolean
 CancelIrql                                 BYTE ?
 ApcEnvironment                             BYTE ?
 Zoned                                      BYTE ? ;boolean true=4
 PUserIosb                                 DWORD ?
 PUserEvent                                DWORD ?
 Overlay                                   DWORD ?
                                           DWORD ?
 PCancelRoutine                            DWORD ?
 PUserBuffer                               DWORD ?


                                           UNION  ;Tail
 PApc                                       DWORD ?
 ComplKey                                   DWORD ?                
                                            STRUCT ;Overlay
                                             UNION ;x 
 DeviceQueueEntry                            DWORD ?  ;?
                                              STRUCT;y
 PDriverContExt                               DWORD 4 DUP (?)
                                              ENDS  ;y
                                             ENDS  ;x
 PThread                                    DWORD ?
 AuxiliaryBuffer                            DWORD ?
 ListEntry                                  DWORD ?
                                            DWORD ?

 PCurrentIrpStackLocation                   PIO_STACK_LOCATION ?
                                            ENDS   ;Overlay
                                           ENDS ;Tail
_IRP                                       ENDS 

PIRP                           TYPEDEF     PTR   _IRP

;======================================================================================
;irq levels
IRQL_DISPATCH_LEVEL    EQU 02H
IRQL_SYNCHRONIZE_LEVEL EQU 1CH
;======================================================================================

; yoda's additions:

STATUS_SUCCESS                 EQU 0
STATUS_INSUFFICIENT_RESOURCES  EQU 0C000009Ah

; driver types
FILE_DEVICE_NULL               EQU 000000015h

IO_NO_INCREMENT                EQU 0

; MajorFunction constants of IO_STACK_LOCATION
IRP_MJ_DEVICE_CONTROL          EQU 00Eh
