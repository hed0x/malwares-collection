
;     WWPACK PU 3.05 User Antihack Code example (A)     by Piotr Warezak
;
;     This is an example containing some antihack code that can be added
;     to the EXE file while packing with 'PU -uh -uah1uah1.com' command.
;
;  Please assemble this file to COM before using WWPACK. Out size: 17 bytes


assume cs:code;
segment code

        org 100h
start:

;This is the easiest trick affecting on most real debuggers and EXE tracers
;(like TRON, CUP, UUP, etc.) Instead of 2xNOT sequence you may use XCHG
;instruction. Instead of DS and AX registers you can use ES,BX/CX/DX.
;0000:0005 address can be replaced with 0000:0004 or 0000:0006.
        push ds      			;save DS register
        xor ax,ax			;zero DS register
        mov ds,ax
        not word ptr ds:[0005]		;cut INT1 vector for a moment
        jmp short j1
        db 09ah
j1:     not word ptr ds:[0005]		;restore INT1 vector
        pop ds				;restore DS register

code ends;
end start;