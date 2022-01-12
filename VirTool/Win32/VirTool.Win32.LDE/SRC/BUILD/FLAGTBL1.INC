; GENERATED FILE. DO NOT EDIT
; ----- begin of FLAGTBL1.INC -----
@@buildflagtbl:
xor     eax, eax
push    eax
push    eax
push    eax
push    002AAA800h
push    03FFF687Fh
push    0FFE6DEA0h
push    0DBD5FFFFh
push    0FFFEAAAAh
push    0AAAAAAAAh
push    0AAAA0000h
push    eax
push    eax
push    eax
push    eax
push    eax
push    eax
push    000000154h
push    041FFF555h
push    055DEDDAAh
push    019955111h
push    011111FFFh
push    0FA11FFAAh
push    08E60CF96h
push    0FC72D6AAh
push    0AAAAAA88h
push    0888888D5h
push    0528D559Bh
push    0366CD553h
push    0355555FFh
push    0FFFED6F9h
push    068888888h
push    088888888h
push    08D5347CAh
push    0DCC67BDFh
push    0AAAAAAAAh
push    0AAAAAAAAh
push    0ABA94FFDh
push    0D4A7FEEAh
push    053FF7529h
push    0FFA4A7FEh
push    0929FFA4Ah
push    07FE929FFh
mov     ecx, 512
xor     ebx, ebx
@@cycle:
call    @@tree
stosd
loop    @@cycle
retn
@@getbit:
or      ebx, ebx
jnz     @@skip
pop     eax
pop     esi
pop     edx
push    esi
push    eax
mov     bl, 32
@@skip:
dec     ebx
shr     edx, 1
retn
@@tree:
call    @@getbit
jnc     @@tree0
@@tree1:
call    @@getbit
jnc     @@tree10
@@tree11:
mov     eax, C_MODRM
retn
@@tree10:
call    @@getbit
jc      @@tree101
@@tree100:
call    @@getbit
jnc     @@tree1000
@@tree1001:
call    @@getbit
jnc     @@tree10010
@@tree10011:
call    @@getbit
jc      @@tree100111
@@tree100110:
call    @@getbit
jnc     @@tree1001100
@@tree1001101:
mov     eax, C_MEM67
retn
@@tree1001100:
call    @@getbit
jnc     @@tree10011000
@@tree10011001:
mov     eax, C_DATA66+C_MEM2
retn
@@tree10011000:
call    @@getbit
jnc     @@tree100110000
@@tree100110001:
mov     eax, C_PREFIX+C_66
retn
@@tree100110000:
mov     eax, C_DATA2+C_DATA1
retn
@@tree100111:
call    @@getbit
jnc     @@tree1001110
@@tree1001111:
mov     eax, C_MODRM+C_DATA66
retn
@@tree1001110:
call    @@getbit
jnc     @@tree10011100
@@tree10011101:
mov     eax, C_PREFIX+C_67
retn
@@tree10011100:
mov     eax, C_DATA2
retn
@@tree10010:
mov     eax, C_DATAW0
retn
@@tree1000:
mov     eax, C_DATA1
retn
@@tree101:
call    @@getbit
jnc     @@tree1010
@@tree1011:
call    @@getbit
jnc     @@tree10110
@@tree10111:
mov     eax, C_PREFIX
retn
@@tree10110:
mov     eax, C_MODRM+C_DATA1
retn
@@tree1010:
mov     eax, C_DATA66
retn
@@tree0:
call    @@getbit
jc      @@tree01
@@tree00:
mov     eax, -1
retn
@@tree01:
mov     eax, 0
retn
; ----- end of FLAGTBL1.INC -----
