comment á
Ä Assembler ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄGermanÄ
Msg  :  261     [1-266]
From : Daniel Schlenzig                    25-Aug-95  10:16:06  2:2454/500
To   : Henning Rust                                             2:246/2101
Subj : Single Step
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄASM86.GERÄ
Hi Henning!

Henning Rust wrote in a message to Alle:

HR> Hat jemand Informationen oder nen kleines Beispielprog wie
HR> der Single-Step-  Mode (gesetztes Trap-flag) funktioniert.
Hier mal ein Source....

á

        locals  @@

code    segment para
        assume  cs:code,ds:code,es:code,ss:code
        org     100h

start:
        jmp     main

oldint01        dw      ?, ?

main    proc near
        mov     ax, cs
        mov     ds, ax
        mov     es, ax
        cli
        mov     ss, ax
        mov     sp, 100h
        sti

        push    es
        xor     ax, ax
        mov     es, ax
        mov     ax, word ptr es:[4]
        mov     [oldint01], ax
        mov     ax, offset newint01
        mov     word ptr es:[4], ax
        mov     ax, word ptr es:[4 +2]
        mov     [oldint01 +2], ax
        cli
        mov     ax, offset newint01
        mov     word ptr es:[4], ax
        mov     ax, cs
        mov     word ptr es:[4 +2], ax
        sti
        pop     es

        pushf
        pop     ax
        or      ax, 100h
        push    ax
        popf

        mov     ax, 1

        pushf
        pop     ax
        and     ax, not 100h
        push    ax
        popf

        push    es
        cli
        xor     ax, ax
        mov     es, ax
        mov     ax, [oldint01]
        mov     word ptr es:[4], ax
        mov     ax, [oldint01 +2]
        mov     word ptr es:[4 +2], ax
        sti
        pop     es

        mov     ax, 4c00h
        int     21h
main    endp


newint01 proc near
        mov     ax, 0e00h + '.'
        int     10h
        iret
newint01 endp

code    ends
        end     start

