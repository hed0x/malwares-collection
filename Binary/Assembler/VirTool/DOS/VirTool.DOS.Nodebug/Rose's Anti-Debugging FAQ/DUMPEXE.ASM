;Hello,
;  this file contains some stupid anti DUMPEXE code!
;  Compile to COM and enjoy!
;
;(c) 1996 by Piotr Warezak
;awarezak@krysia.uni.lodz.pl

assume	cs:code 			;ss:stack;
segment code

	org	100h
start:
; ***** CHECK FOR DUMPEXE RESIDENT PROGRAM
	@saveregs <ds,es>		;push DS,ES on stack
	mov	ax,cs
	mov	ds,ax
	xor	ax,ax
	cld

	mov	ds,ax
	mov	es,word ptr ds:[0fch*4+2] ;look for DUMPEXE (check FCh vector)
	mov	di,word ptr ds:[0fch*4]
	mov	si,offset(dumpexe)
	mov	cx,12
	repe	cmpsb
	jcxz	halt

kont:	@restoreregs <es,ds>		;pop DS,ES from stack
	jmp	short ok
	db	09ah
halt:	cli				;DUMPEXE installed - halt system!!!
	hlt

dumpexe:db 50h,53h,51h,52h,56h,57h,1eh,06h,55h,89h,0e5h,0d8h,0e3h

ok:	ret				;DUMPEXE not installed - continue

code	ends				;
end	start				;
