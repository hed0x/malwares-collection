   ; NOP
   ; ~~~
   ; - main super-puper plugin.

   include                 plugin.inc
                           PLUGIN_START    NOP, CODE32, PERMUTABLE

   handleevent:            nop
                           nop

                           stc
                           retn

                           nop
                           nop

                           PLUGIN_END
