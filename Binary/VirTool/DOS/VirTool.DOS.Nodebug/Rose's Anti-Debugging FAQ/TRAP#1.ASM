; Max Maischein

COMMENT %
       TRAP #1 - the DIV Trap

         This trap sets up an divide by zero (INT 00h) handler and
         generates a divide by zero error. This catches TD* off guard,
         as they report it as a programming error instead of executing
         the handler. This does not work for a directly generated INT 00h.

         Use of this routine could be
         a) in a decoding loop to do the actual decoding in the INT 0 handler,
            and just some fancy XOR in the loop to deceive the user to believe
            that we are actually decoding stuff in the loop.
         b) At the start of the program just to lock TD users out, since the
            handler will set some flags in the program, which will not be set
            if the DIV CX code is NOPped.

02.04.95        Conceived and created by Max Maischein

; Effects on the various debuggers

       TD : TD will loose complete control over the program - the program
            will run without any brakes (and bigger programs might crash).

    TD386 : TD386 keeps full control. Full control in this case means, that
            it reports a divide by zero error. Not so nice for in this case,
            our decoder loop won't be run. Bad luck, is it ? ;->

 Soft-ICE : No sweat for Soft-ICE. Soft-ICE simply traces through the code.
            Bad karma for the protectors indeed.

%
_code segment para public 'code'
  assume cs:_code, ds:_code, ss:_code
                        org     100h
Start:
                        mov     ax, offset Continue
                        mov     dx, cs
                        xor     bx, bx
                        mov     cx, bx
                        mov     es, bx
                        cli
                        xchg    ax, es:[bx]
                        xchg    dx, es:2[bx]
                        sti

                        div     cx
Done:
                        mov     ax, 4C00h
                        int     21h
Continue:
                        cli
                        xchg    ax, es:[bx]
                        xchg    dx, es:2[bx]
                        sti

                        mov     ah, 9
                        mov     dx, offset Msg
                        int     21h
                        jmp     Done

Msg     db      'Program is running fine.',13,10,'$'
CodeEnd         label byte

_code ends
_stack          segment byte
                db      200h dup (?)
_stack           ends
end start
