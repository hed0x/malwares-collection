; rowan crowe
; Here's a simple example of exploiting the prefetch queue:

mov ax, 4c00h
mov word ptr cs:[__f], 21cdh      ; 'int 21h' !
__f:
mov ah, 09h                       ; this gets changed to 'int 21h'
mov dx, offset __msg
int 21h
mov ah, 4ch
int 21h

__msg: db 'Hello$'

    If you run it "straight" you'll get a "Hello". If you single step, you
won't.

    This could be handy for protecting code, but remember that because the
change to the code has to be within about 8 bytes (to account for the smaller
prefetch queue on 8086 etc), they will most likely see the change to the code as
it happens, and will be able to bypass it thereafter.


