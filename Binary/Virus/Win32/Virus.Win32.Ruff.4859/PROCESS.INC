   TH32CS_SNAPHEAPLIST  EQU   00000001h
   TH32CS_SNAPPROCESS  equ 00000002h
   TH32CS_SNAPTHREAD   equ 00000004h
   TH32CS_INHERIT      equ 80000000h
   TH32CS_SNAPMODULE       equ     00000008h
   TH32CS_SNAPALL     equ TH32CS_SNAPHEAPLIST or TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD or TH32CS_SNAPMODULE
   MAX_MODULE_NAME32        equ    255
   THREAD_PRIORITY_HIGHEST  EQU    2
   CREATE_SUSPENDED         EQU    00000004h

   DETACHED_PROCESS         EQU    00000008h

   NORMAL_PRIORITY_CLASS    EQU    00000020h
   IDLE_PRIORITY_CLASS      EQU    00000040h
   HIGH_PRIORITY_CLASS      EQU    00000080h
   REALTIME_PRIORITY_CLASS  EQU    00000100h



   SYNCHRONIZE        EQU              00100000h
   STANDARD_RIGHTS_REQUIRED  EQU        000F0000h
   CREATE_NEW_PROCESS_GROUP EQU   00000200h
   CREATE_UNICODE_ENVIRONMENT EQU  00000400h

   PROCESS_CREATE_THREAD    EQU   0002h
   CREATE_SEPARATE_WOW_VDM  EQU   00000800h
   CREATE_SHARED_WOW_VDM    EQU   00001000h
   CREATE_FORCEDOS          EQU   00002000h

   CREATE_DEFAULT_ERROR_MODE EQU  04000000h
   CREATE_NO_WINDOW          EQU  08000000h
   PROCESS_VM_READ  EQU       0010h
   PROCESS_VM_WRITE  EQU      0020h
   TH32CS_SNAPPROCESS EQU  00000002h
   PROCESSENTRY32 struct
   dwSize               DD    0;
   cntUsage             DD    0
   th32ProcessID        DD    0 ;          // this process
   th32DefaultHeapID    DD    0 ;
   th32ModuleID         DD    0;           // associated exe
   cntThreads           DD    0;
   th32ParentProcessID  DD    0;    // this process's parent process
   pcPriClassBase       DD    0;         // Base priority of process's threads
   dwFlags              DD    0;
   szExeFile                  DB  MAX_PATH DUP(0)   ;    // Path
   PROCESSENTRY32 ends

   MODULEENTRY32  struct
   dwSize               DD    0   ;
   th32ModModuleID      DD    0   ;This module
   th32ProcessID        DD    0   ;owning process
   GlblcntUsage         DD    0   ;Global usage count on the module
   ProccntUsage         DD    0   ;Module usage count in th32ProcessID's context
   modBaseAddr          DD    0   ;Base address of module in th32ProcessID's context
   modBaseSize          DD    0   ;Size in bytes of module starting at modBaseAddr
   hModule              DD    0   ;The hModule of this module in th32ProcessID's context
   szModule             DB MAX_MODULE_NAME32+1 DUP(0)
   szExePath            DB MAX_PATH DUP(0)
   MODULEENTRY32 ends
   PROCESS_ALL_ACCESS EQU STANDARD_RIGHTS_REQUIRED or SYNCHRONIZE or 0FFFh

   FLOATING_SAVE_AREA struct
   ControlWord        dd ?
   StatusWord         dd ?
   TagWordd           dd ?
   ErrorOffset        dd ?
   ErrorSelector      dd ?
   DataOffset         dd ?
   DataSelector       dd ?
   RegisterArea db SIZE_OF_80387_REGISTERS dup(?)
   Cr0NpxState        dd ?
   FLOATING_SAVE_AREA ends

   CONTEXT struct
   ContextFlags    dd    ?
   Dr0              dd    ?
   Dr1              dd    ?
   Dr2              dd    ?
   Dr3              dd    ?
   Dr6              dd    ?
   Dr7              dd    ?

   FloatSave FLOATING_SAVE_AREA  ?
   SegGs   dd    ?
   SegFs   dd    ?
   SegEs   dd    ?
   SegDs   dd    ?

   Edi     dd    ?
   Esi     dd    ?
   Ebx     dd    ?
   Edx     dd    ?
   Ecx     dd    ?
   Eax     dd    ?
   Ebp     dd    ?
   Eip     dd    ?
   SegCs   dd    ?
   EFlags  dd    ?
   Esp     dd    ?
   SegSs   dd    ?

   CONTEXT ends
