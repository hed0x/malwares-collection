
include                 ..\..\INCLUDE\consts.inc
include                 ..\MAIN\main.inc

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

imgname                 db      '\desktop.bmp',0
rd                      db      'RefreshDesktop',0

effect_complete         db      0

include                 image.inc

fname                   db      260 dup (?)

randseed                dd      ?
desktopdc               dd      ?
maxx                    dd      ?
maxy                    dd      ?

time:
_Year                   dw      ?
_Month                  dw      ?
_DayOfWeek              dw      ?
_Day                    dw      ?
_Hour                   dw      ?
_Minute                 dw      ?
_Second                 dw      ?
_Milliseconds           dw      ?

tid                     dd      ?
thandle                 dd      ?

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
                        cmp     _Day, 14
                        jne     __return_0

                        cmp     effect_complete, 0
                        jne     __return_0
                        inc     effect_complete

                        call    effect

                        mov     eax, 1
                        retn

effect:

IFDEF   EXE
                        push    260
                        push    offset fname
                        callW   GetWindowsDirectoryA
ELSE
                        push    offset fname
                        callW   getwindir
ENDIF

                        push    offset imgname
                        push    offset fname
                        callW   lstrcat

IFDEF   EXE
                        lea     edx, fname
                        call    fcreate
                        xchg    ebx, eax
                        lea     edx, image
                        mov     ecx, image_size
                        call    fwrite
                        call    fclose
ELSE
                        push    offset fname
                        callW   fcreate
                        xchg    ebx, eax
                        push    0    ;pos
                        push    offset image_size
                        push    offset image
                        push    ebx
                        callW   fwrite
                        push    ebx
                        callW   fclose

ENDIF
                        push    1               ; SPIF_SENDCHANGE
                        push    offset fname    ; param
                        push    0               ; param
                        push    20              ; action=SPI_SETDESKWALLPAPER
                        callW   SystemParametersInfoA

                        push    offset rd
                        push    14h
                        push    1Ah
                        push    0FFFFh ;HWND_BROADCAST
                        callW   SendMessageA

                        retn

IFDEF   EXE

start:                  call    effect

                        push    -1
                        callW   ExitProcess

include                 ..\..\INCLUDE\fioexlow.inc

ELSE

start:                  retn

ENDIF

                        end     start
