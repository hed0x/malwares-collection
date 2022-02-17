   ; CWTEST // win9X
   ; ~~~~~~

   include                 plugin.inc
                           PLUGIN_START    CWTEST, CODE32, PERMUTABLE

   handleevent:            hookevent EV_CWTEST_BEEP, _beep
                           hookevent EV_CWTEST_INT3, _int3
                           hookevent EV_CWTEST_BOOT, _boot
                           stc
                           retn

   _beep:                  pusha
                           in      al, 61h
                           or      al, 3
                           out     61h, al
                           mov     ecx, 1000000
                           dec     ecx
                           jnz     $-1
                           in      al, 61h
                           and     al, not 3
                           out     61h, al
                           popa
                           stc
                           retn

   _int3:                  pusha
                           db      0CCh
                           popa
                           stc
                           retn

   _boot:                  pusha
                           ;;
                           mov     dx, 0CF9h       ; reset
                           mov     al, 010b
                           out     dx, al
                           mov     al, 110b
                           out     dx, al
                           ;;
                           popa
                           stc
                           retn

                           PLUGIN_END
