
                        p386
                        model   flat
                        .code
                        locals  @@

public                  _compress
public                  _decompress

_compress               proc    c
                        arg     ibuf
                        arg     isize
                        arg     obuf
                        pusha
                        mov    esi, ibuf
                        mov    ecx, isize
                        mov    edi, obuf
                        call   z_encode_asm
                        popa
                        ret
                        endp

_decompress             proc    c
                        arg     ibuf
                        arg     obuf
                        pusha
                        mov     esi, ibuf
                        mov     edi, obuf
                        call    z_decode_asm
                        popa
                        ret
                        endp

x1:
include                 ..\Z_CODING\z_encode.inc
x2:

x3:
include                 ..\Z_CODING\z_decode.inc
x4:

db 13,10
db 13,10
db '-----------------------',13,10
db ' z_encode = '
db (x2-x1)/1000 mod 10+'0'
db (x2-x1)/ 100 mod 10+'0'
db (x2-x1)/  10 mod 10+'0'
db (x2-x1)/   1 mod 10+'0'
db ' bytes',13,10
db ' z_decode = '
db (x4-x3)/1000 mod 10+'0'
db (x4-x3)/ 100 mod 10+'0'
db (x4-x3)/  10 mod 10+'0'
db (x4-x3)/   1 mod 10+'0'
db ' bytes',13,10
db '-----------------------',13,10
db 13,10
db 13,10

                        end
