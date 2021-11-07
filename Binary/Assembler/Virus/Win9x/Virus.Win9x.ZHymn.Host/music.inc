   MUSIC_VERSION           equ     1

   USE_USSR                equ     ?               ; only one allowed
   ;USE_HOLMS              equ     ?               ;

   EV_MUSIC_BASE           equ     00003500h
   EV_MUSIC_INIT           equ     EV_MUSIC_BASE+01h  ; start playback
   EV_MUSIC_DONE           equ     EV_MUSIC_BASE+02h  ; stop

   USE_FADE                equ     YES

   IFDEF   USE_USSR
   WAVE_LENGTH             equ     39              ; length [sec]
   ENDIF
   IFDEF   USE_HOLMS
   WAVE_LENGTH             equ     20              ; length [sec]
   ENDIF

   WAVE_CHAN               equ     2
   WAVE_FREQ               equ     44100
   WAVE_BITRATE            equ     16
   WAVE_BLOCK              equ     4
   WAVE_AMP                equ     32000           ; volume: 0..32767
   wavedatasize            equ     176400*WAVE_LENGTH
