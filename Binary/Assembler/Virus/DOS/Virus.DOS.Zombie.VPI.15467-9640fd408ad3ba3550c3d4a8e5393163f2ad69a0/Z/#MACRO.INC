
mve             macro   x, y
                push    y
                pop     x
                endm

setalc          macro
                db      0D6h
                endm

lastword        macro   name
name            equ     word ptr $-2
                endm

lastbyte        macro   name
name            equ     byte ptr $-1
                endm

