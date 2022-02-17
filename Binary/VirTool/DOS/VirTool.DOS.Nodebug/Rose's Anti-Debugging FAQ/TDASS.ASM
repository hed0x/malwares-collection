; Hi !
; This is a special "Anti-Debugger Trap" for you guys out there.
; It is not a trap at all, it just makes use of the fact that TD
; causes an Execption when it tries to interpret "8E F8". Bad luck.
; This trick is 100% compatible to any 80x86 processor (well it should be)
; and fools TD 4.0 for sure. It has not been tested on any other
; debugger, but it may be that it works too ! (Debug interprets
; the code as MOV DS,AX).
; So have fun with this piece of shit, by Exocomp of PIPE AV.

Code	Segment
	Assume	CS:Code, DS:Code
	ORG	0100h
Begin:
	jmp	RealCode

Fool_TD db 8Eh,0F8h	; MOV UnknownSegment, AX

RealCode:
	lea	dx,PassedM
	mov	ah,09h
	int	21h

	mov	ax,4C00h
	int	21h

PassedM db "You passed the Turbo-Debugger Test. Not a fool at all.",13,10,36

code	ends
	end	Begin
