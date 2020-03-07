   ; BEEP
   ; ~~~~
   ; - beep on each event, win9X only

   include                 plugin.inc
                           PLUGIN_START    BEEP, CODE32, PERMUTABLE

   handleevent:            pusha

                           in      al, 61h
                           or      al, 3
                           out     61h, al

                           mov     ecx, 10000
                           loop    $

                           in      al, 61h
                           and     al, not 3
                           out     61h, al

                           popa

                           stc
                           retn

                           PLUGIN_END
