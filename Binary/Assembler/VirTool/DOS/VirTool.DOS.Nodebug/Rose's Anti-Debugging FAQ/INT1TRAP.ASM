; INT1TRAP.ASM   By Rowan Crowe 26th Apr 1995
;                Originally from a disassembly of TBDRIVER
;                (anti-virus protection), I've made a few
;                changes and additions.

.model tiny
.code
        org    100h

_entry:
        cli             ; disable interrupts. we need exclusive
                        ; use of the stack.

        push   bx
        push   ax
        pop    ax
        dec    sp       ; if INT 1 is invoked, [SP-2] will change!
        dec    sp       ; SP=SP-2; SP now points to "saved AX"
        pop    bx       ; And what we pop should be the saved AX!
        cmp    ax, bx   ; AX = BX? (if not -- INT 1 is active)
        pop    bx

        sti             ; Re-enable interrupts. we should not be
                        ; badly behaved!

        je     @NotTracing
        mov    dx, offset __trace
        jmp    @WriteMsg
@NotTracing:
        mov    dx, offset __notrace
@WriteMsg:
        mov    ah, 09h  ; Write message to screen function.
        int    21h      ; Do it.
        mov    ah, 4ch  ; Exit to DOS
        int    21h

__trace:       db 'Tracing!',13,10,'$'
__notrace:     db 'Not tracing.',13,10,'$'

end _entry
