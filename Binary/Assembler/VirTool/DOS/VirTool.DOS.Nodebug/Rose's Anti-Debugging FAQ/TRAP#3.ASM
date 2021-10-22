;From Andrew Kohlsmith  - Anti-Debugging Trick
;
.model tiny
.code
org 100h

start proc
        mov dx, offset norm

        mov ax, offset tracer
        sub ax, offset @jmp + 2
        mov cs:[point], al

@jmp        db 0ebh
point        db offset normal - offset @jmp - 2

tracer:
        mov dx, offset trace

normal:
        mov ah, 9
        int 21h
        mov ax, 4c00h
        int 21h
start endp

trace        db 13,10,'Traced.$'
norm        db 13,10,'Normal.$'
end start
;------------------------------------------------------------------------------

During normal execution, the processor has the next few instructions inside
the prefetch queue, which is on-chip.  When it executes the
"mov cs:[point], al", it modifies the main memory, but the JMP is already in
the prefetch and the processor never sees the new JMP address.  However, if
you're tracing through, there are hundreds of debugger instructions between
your instructions and the processor gets the modified JMP address.

As I said, this is *very* simple, as it is easy to get past it.  There are
other methods of detecting debuggers (trapping INT3 is an example) but I can't
example them right now.

TZ
