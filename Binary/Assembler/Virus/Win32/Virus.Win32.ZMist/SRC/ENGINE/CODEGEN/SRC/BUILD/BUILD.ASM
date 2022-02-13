
include                 ..\..\cg_bin.ash

callW                   macro   x
                        extern  x:PROC
                        call    x
                        endm

                        p386
                        model   flat
                        locals  __

                        .data

                        db      0EBh,02h,0FFh,01h       ; signature

include                 ..\codegen.asm  ; CODEGEN

                        db      0EBh,02h,0FFh,02h       ; signature

                        .code

start:
                        push    -1              ; exit 2 md
                        callW   ExitProcess

                        end     start
