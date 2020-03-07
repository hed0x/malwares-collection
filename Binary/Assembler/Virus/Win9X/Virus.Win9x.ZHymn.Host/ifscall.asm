   ; IFSCALL
   ; ~~~~~~~
   ; - on each IFS call
   ; - analyze function (IFSFN_OPEN, etc.)
   ; - generate current filename (via IFSMGR_UniToBCSPath)
   ; - call EV_IFSCALL_GOT_FILENAME event

   include                 INCLUDE\consts.inc
   include                 tsr.inc
   include                 memory.inc

   include                 plugin.inc
                           PLUGIN_START    IFSCALL, W9XR0, PERMUTABLE

   handleevent:            hookevent EV_TSR_ON_IFSCALL, ifscall_onifscall
                           stc
                           retn

                           ; ESI=ifs_handler onstack shit
   ifscall_onifscall:
                           mov     eax, [esi]._function    ; check function

                           cmp     eax, IFSFN_OPEN
                           je      __func1
                           cmp     eax, IFSFN_RENAME
                           je      __func1
                           cmp     eax, IFSFN_FILEATTRIB
                           je      __func1

   __quit:                 clc
                           retn

   __func1:                pusha
                           sub     esp, MAXPATH
                           mov     edi, esp
                           cld

                           mov     eax, [esi]._drive
                           or      al, al
                           jle     __exit

                           add     al, 'A'-1       ; drive
                           stosb
                           mov     al, ':'         ; ':'
                           stosb
                           mov     eax, [esi]._ioreq_ptr
                           mov     eax, [eax+0Ch]  ; eax <-- filename
                           add     eax, 4          ; skip "
                           push    [esi]._codepage ; BCS_WANSI/BCS_OEM
                           push    MAXPATH-1       ; max name length
                           push    eax             ; uni-str
                           push    edi             ; output-str
                           VxDcall IFSMGR, UniToBCSPath
                           add     esp, 4*4

                           or      edx, edx        ; converted normally?
                           jnz     __exit
                           mov     [edi+eax], dl   ; 0

   ;USE_MYSTACK            equ     ?
   RING0_MYSTACK_SIZE      equ     65536

   IFDEF   USE_MYSTACK
                           mov     edi, esp

                           mov     ecx, RING0_MYSTACK_SIZE
                           event   EV_MEMORY_MALLOC

                           lea     esp, [edx+RING0_MYSTACK_SIZE]

                           pusha
                           mov     edx, edi
                           event   EV_IFSCALL_GOT_FILENAME
                           popa

                           mov     esp, edi
                           event   EV_MEMORY_MFREE
   ELSE    ; USE_MYSTACK

                           mov     edx, esp
                           event   EV_IFSCALL_GOT_FILENAME

   ENDIF   ; USE_MYSTACK

   __exit:                 add     esp, MAXPATH
                           popa
                           jmp     __quit


                           PLUGIN_END
