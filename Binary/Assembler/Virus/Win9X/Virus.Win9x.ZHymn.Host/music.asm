   ; MUSIC
   ; ~~~~~
   ; - music effect (play some melody via sb)

   include                 INCLUDE\consts.inc
   include                 INCLUDE\s2c.inc
   include                 memory.inc
   include                 k32man.inc

   include                 plugin.inc
                           PLUGIN_START    MUSIC, W32R3, NON_PERMUTABLE

   handleevent:            hookevent EV_MUSIC_INIT, init
                           hookevent EV_MUSIC_DONE, done
                           stc
                           retn

   ; output: EDI=memory block to be released
   ;         ECX=music length in milliseconds

   init:                   pusha

                           mov     ecx, wavehdrsize+wavedatasize
                           event   EV_MEMORY_MALLOC
                           mov     edi, edx

                           pusha
                           call    gen_wavehdr
                           call    gen_wavedata
                           popa

                           call    playstop

                           push    SND_MEMORY+SND_ASYNC+SND_LOOP
                           push    0
                           push    edi
                           callMM  PlaySound

                           mov     [esp].popa_edi, edi
                           mov     [esp].popa_ecx, 1000*WAVE_LENGTH

                           popa
                           clc
                           retn

   ; input: EDI=memory block to release

   done:                   pusha

                           call    playstop

                           mov     edx, edi
                           event   EV_MEMORY_MFREE

                           popa
                           clc
                           retn

   playstop:               push    SND_PURGE
                           push    0
                           push    0
                           callMM  PlaySound
                           retn

   ; action: generate .WAV header
   ; input: EDI=wavehdr ptr

   gen_wavehdr:            getofs  esi, wavehdr
                           push    wavehdrsize
                           pop     ecx
                           cld
                           rep     movsb
                           retn

   ; action: generate single note, waveform=sin(t)
   ; input:  EBX=note frequency [Hz]
   ;         ECX=note length    [ms]
   ;         ESI=amplitude      0..32767
   ;         EDI=data ptr
   ;         EBP.bit0: 0=c1-->c2, 1=c2-->c1

   gen_note:               pusha
                           finit
   __cycle:
   ; EAX <-- ECX*freq/WAVE_FREQ*Pi*2
                           mov     eax, ecx
                           imul    eax, ebx
                           push    eax
                           fild    dword ptr [esp]
                           fldpi
                           fmul
                           push    WAVE_FREQ/2
                           fild    dword ptr [esp]
                           pop     eax
                           fdiv
   ; EAX <-- sin(EAX) * WAVE_AMP
                           fsin
                           fild    [esp+4].pusha_esi
                           fmul
                           fistp   dword ptr [esp]
                           pop     eax
   IFDEF   USE_FADE
   ; chan1=EAX*ECX/ECX0,
   ; chan2=EAX*(ECX0-ECX)/EBP
                           push    eax
                           imul    eax, ecx
                           push    eax
                           fild    dword ptr [esp]
                           fild    [esp+8].pusha_ecx
                           fdiv
                           fistp   dword ptr [esp]
                           pop     eax
                           add     ax, [edi]
                           stosw
                           sub     [esp], eax
                           pop     eax
                           test    ebp, 1          ; note#
                           jnz     __skipxchg
                           xchg    ax, [edi-2]
                           add     ax, [edi]
   __skipxchg:             stosw
   ELSE
                           add     ax, [edi]
                           stosw                   ; channel 1
                           add     ax, [edi]
                           stosw                   ; channel 2
   ENDIF
                           loop    __cycle
                           popa
                           retn

   wavehdr                 label   byte
                           db      'RIFF'          ; BYTE  riff_sign[4];   // ='RIFF'
                           dd      wavehdrsize+wavedatasize-8  ; DWORD riff_size;      // filesize-8=datasize+sizeof(wavehdr)-8=datasize+50
                           db      'WAVEfmt '      ; BYTE  wavefmt_sign[8];// ='WAVEfmt '
                           dd      10h             ; DWORD wavefmt_size;   // sizeof(PCMWAVEFORMAT)=12h
                           dw      WAVE_FORMAT_PCM ; WORD  wFormatTag;     // type=WAVE_FORMAT_PCM=1
                           dw      WAVE_CHAN       ; WORD  nChannels;      // channels=1/2
                           dd      WAVE_FREQ       ; DWORD nSamplesPerSec; // freq=11025/22050/44100
                           dd      WAVE_FREQ*WAVE_BLOCK    ; DWORD nBytesPerSec;   // bytespersecond=freq*channels*bitrate/8=176400
                           dw      WAVE_BLOCK      ; WORD  nBlockAlign;    // =1/2/4
                           dw      WAVE_BITRATE    ; WORD  wBitsPerSample; // =8/16
                           db      'data'          ; BYTE  data_sign[4];   // ='data'
                           dd      wavedatasize    ; DWORD data_size;      // =datasize
   wavehdrsize             equ     $-wavehdr

   ; action: generate music in PCM format
   ; input:  EDI=data ptr

   IFDEF   USE_USSR

   gen_wavedata:           xor     edx, edx        ; note#

   __cycle:                getofs  esi, snd_index
                           mov     cl, [esi+edx]

                           movzx   ebx, cl
                           shr     ebx, 4
                           movzx   ebx, word ptr [esi+ebx*2+snd_freq-snd_index]

                           and     ecx, 15
                           movzx   ecx, byte ptr [esi+ecx+snd_delay-snd_index]

                           imul    ecx, snd_delay_mult*WAVE_FREQ/1000

                           or      bl, bl
                           jz      __skip1
                           inc     ebp                     ; non-zero note#

                           mov     esi, WAVE_AMP*2/3
                           call    gen_note
                           shr     ebx, 1
                           mov     esi, WAVE_AMP/3
                           call    gen_note
   __skip1:

   ;                       mov     esi, WAVE_AMP*1/3
   ;                       mov     ebx, 3300
   ;                       call    gen_note

                           lea     edi, [edi+ecx*4]

                           inc     edx
                           cmp     dl, snd_notes
                           jb      __cycle

                           retn

   snd_index               label   byte
   db      07h, 51h, 82h, 51h, 61h, 72h, 31h, 31h, 62h, 51h, 41h
   db      52h, 11h, 11h, 22h, 21h, 31h, 42h, 41h, 51h, 62h, 71h
   db      81h, 93h, 0Ah, 51h,0A2h, 91h, 81h, 92h, 71h, 51h, 82h
   db      71h, 61h, 72h, 31h, 31h, 62h, 51h, 41h, 52h, 31h, 11h
   db      82h, 71h, 61h, 52h, 02h,0A4h, 91h, 81h, 71h, 81h, 93h
   db      51h, 53h, 01h, 89h, 0Ah, 71h, 61h, 51h, 61h, 73h, 31h
   db      34h, 01h, 82h, 61h, 71h, 82h, 61h, 71h, 82h, 61h, 81h
   db     0B4h, 01h,0B9h, 05h,0A1h, 91h, 81h, 91h,0A3h, 81h, 84h
   db      01h, 99h, 0Ah, 81h, 71h, 61h, 71h, 83h, 61h, 64h, 01h
   db      82h, 71h, 61h, 52h, 0Ah, 11h, 11h, 0Ah, 54h, 0Ah, 62h
   db      0Ah, 72h, 0Ah, 84h
   snd_notes               equ     $-snd_index

   snd_freq                label   word

   dw      0
   dw      525
   dw      589
   dw      661
   dw      700
   dw      786
   dw      882
   dw      990
   dw      1049
   dw      1178
   dw      1323
   dw      1400
   dw      1572
   dw      1765
   dw      1982

   snd_delay_mult          equ     55
   snd_delay               label   byte
   db      1, 4, 8, 12, 16, 2, 6, 20, 10, 14, 1

   ENDIF   ; USE_USSR
   IFDEF   USE_HOLMS

   gen_wavedata:           xor     edx, edx                ; note#

   __cycle1:               getofs  esi, snd_freq
                           movzx   ebx, byte ptr [esi+edx] ; index
                           movzx   ebx, word ptr [esi+ebx*2+snd_freq_table-snd_freq]
                           movzx   ecx, byte ptr [esi+edx+snd_delay-snd_freq]
                           imul    ecx, snd_delay_mult*WAVE_FREQ/1000
                           or      bl, bl
                           jz      __skip1
                           inc     ebp                     ; non-zero note#

                           mov     esi, WAVE_AMP
                           call    gen_note
   __skip1:

   ;                       mov     esi, WAVE_AMP*1/3
   ;                       mov     ebx, 3300
   ;                       call    gen_note

                           lea     edi, [edi+ecx*4]

                           inc     edx
                           cmp     edx, snd_notes
                           jb      __cycle1
                           retn

   snd_notes               equ     110

   snd_freq                label   byte
   db      2, 0, 0, 2, 3, 0, 5, 0, 8, 7
   db      6, 7, 8, 0, 7, 0, 6, 0, 5, 4
   db      3, 4, 5, 0, 4, 0, 3, 0, 3, 1
   db      0, 1, 2, 0, 1, 0, 2, 0, 1, 0
   db      2, 0, 0, 2, 3, 0, 5, 0,10, 9
   db      8, 9,10, 0, 9, 0, 8, 0, 7, 8
   db      9, 8, 7, 0, 9, 0, 7, 0, 9, 0
   db      6, 0, 8, 0, 7, 8, 9, 8, 7, 0
   db      9, 0, 7, 0, 9, 0, 6, 0, 8, 0
   db      7, 0, 7, 6, 5, 0, 5, 4, 3, 0
   db      5, 0, 8, 0, 9, 0, 7, 8, 0, 8

   snd_freq_table          label   word
   dw        0     ; 0
   dw      262     ; 1
   dw      350     ; 2
   dw      440     ; 3
   dw      466     ; 4
   dw      524     ; 5
   dw      584     ; 6
   dw      660     ; 7
   dw      700     ; 8
   dw      784     ; 9
   dw      880     ; 10

   snd_delay_mult          equ     55

   snd_delay               label   byte
   db      10, 5, 2, 2, 5, 5, 5, 5, 2, 2
   db       2, 2,10, 5, 5, 5, 2, 2, 2, 2
   db       2, 2,10, 5, 5, 5, 2, 2,10, 5
   db       2, 2, 2, 2, 2, 2, 2, 2, 2, 2
   db      10, 5, 2, 2, 5, 5, 5, 5, 2, 2
   db       2, 2,10, 5, 5, 5, 2, 2, 2, 2
   db       2, 2, 2, 2, 2, 2, 2, 2, 2, 2
   db       2, 2, 2, 2, 2, 2, 2, 2, 2, 2
   db       2, 2, 2, 2, 2, 2, 2, 2, 2, 2
   db       2, 2, 2, 2, 2, 2, 2, 2, 2, 2
   db       2, 2,10, 5, 2, 2, 7, 1, 1,20

   ENDIF   ; USE_HOLMS

                           PLUGIN_END
