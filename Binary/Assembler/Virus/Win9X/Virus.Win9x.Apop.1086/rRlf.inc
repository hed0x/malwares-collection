   VxDcall macro VxD, Service
       db  0CDh
       db  020h
       dw  Service
       dw  VxD
   endm

   VMMcall macro Service
       VxDcall VMM, Service
   endm

   function                equ   <[esp+0ch+28 + 4]>
   drive                   equ   <[esp+10h+28 + 4]>
   ioreq_ptr               equ   <[esp+1ch+28 + 4]>

   VMM                     equ     0001h
   PageAllocate            equ     0053h
   PageFree        equ 0055h
   Exec_VxD_Int        equ 008Fh
   PAGEZEROINIT            equ     00000001h
   PAGEFIXED               equ     00000008h
   PG_SYS                  equ     1
   PageModifyPermissions   equ     0133h
   PC_WRITEABLE            equ     00020000H
   PC_USER                 equ     00040000H
   PC_STATIC               equ     20000000H
   Call_When_Idle          equ     003Ah
   Get_System_Time         equ     003Fh
   Install_IO_Handler      equ     0096h
   IFSMGR                  equ     0040h
   InstallFileSystemApiHook equ    0067h
   IFSFN_OPEN              equ     36
   IFSFN_RENAME            equ     37
   IFSFN_FILEATTRIB        equ     33
   UniToBCSPath            equ     0041h
   Ring0_FileIO            equ     0032h
   R0_OPENCREATFILE        equ     0D500h
   R0_OPENCREAT_IN_CONTEXT equ     0D501h
   R0_READFILE             equ     0D600h
   R0_WRITEFILE            equ     0D601h
   R0_READFILE_IN_CONTEXT  equ     0D602h
   R0_WRITEFILE_IN_CONTEXT equ     0D603h
   R0_CLOSEFILE            equ     0D700h
   R0_GETFILESIZE          equ     0D800h
   R0_FINDFIRSTFILE        equ     04E00h
   R0_FINDNEXTFILE         equ     04F00h
   R0_FINDCLOSEFILE        equ     0DC00h
   R0_FILEATTRIBUTES       equ     04300h
   GET_ATTRIBUTES          equ     00h
   SET_ATTRIBUTES          equ     01h
   R0_RENAMEFILE           equ     05600h
   R0_DELETEFILE           equ     04100h
   R0_LOCKFILE             equ     05C00h
   R0_GETDISKFREESPACE     equ     03600h
   R0_READABSOLUTEDISK     equ     0DD00h
   R0_WRITEABSOLUTEDISK    equ     0DE00h
