.model tiny
.Radix 16
.code

PUBLIC HEXDIS

ASSUME CS:_TEXT,DS:_TEXT

HEXDIS:
PUSHA
              xor  ah,ah         ;clear upper byte
              mov cl,010         ;divide by 16
              div cl
              mov dx,ax
	      mov ah,02
              call ascii_1       ;convert to bin/ascii
              mov  dl,dh         ;remainder is left in dh
              call ascii_1       ;convert to hex/ascii
              POPA
              RET                ;return to caller

;next routine converts value in al to a hex/ascii character we can print

ascii_1:      add  dl,30h        ;we want range "0" to "9"
              cmp  dl,39h        ;not greater than "9"?
              jle  ascii_2       ;jump if less or equal
              add  dl,7          ;else bump to value "A" to "F"
	      
ascii_2:      int 021            ;Print Character      
              RET       
