MyInt1  proc    near
        or      bp,bp
        jz      short stop              ; bp=0 => end of trace
        push    bp
        mov     bp,sp
        mov     bp,[bp+2]               ; bp = ip of next cmd
        cmp     bp,cs:[_last]
        je      short tracen            ; if it was a 'cmd' -> tracen
                                        ; else goto after block
        mov     bp,sp
        and     wptr [bp+6],0FEFFh      ; TF=0
        push    bx
        mov     bx,cs:[_last]
        push    wptr cs:[bx]            ; save word after block
        pop     cs:[_savew]
        mov     bptr cs:[bx],0CCh       ; put int3 in this place
        pop     bx
        pop     bp
        iret                            ; run til int3
tracen:
        pop     bp
        inc     bp
        inc     bp
        inc     bp
        push    bp                      ; bp = ofs next cmd/block in table
        push    ax
        mov     ax,wptr [bp+2]
        xor     ah,ah
        add     ax,wptr [bp]
        mov     cs:[_last],ax           ; ax = ofs after cmd/block
        mov     bp,wptr [bp]
        cmp     bptr [bp],0CDh          ; is a next cmd a int??
        jne     short not_int
                                        ; yes - let's emul it
        mov     ax,wptr [bp]
        mov     cs:[emuint],ax          ; emuint = cd??
        jmp     short $+2               ; are all of u have a pentium ;)
        pop     ax                      ; function need for int??
emuint  dw      0
        mov     bp,sp
        push    ax
        pushf
        pop     ax
        or      ax,100h                 ; TF=1
        mov     [bp+6],ax
        pop     ax
        pop     bp
        inc     sp
        inc     sp
        push    cs:[_last]
        jmp     short MyInt1

not_int:
        pop     ax
        pop     bp
        inc     sp
        inc     sp
        push    word ptr [bp]           ; next cmd (offset get from the table)
        iret

stop:   pop     ax                      ; all traced
        pop     ax
        pop     ax
        and     ax,0FEFFh               ; TF=0
        push    ax
        push    cs
        push    offset restore          ; need to restore host
        iret
MyInt1  endp

MyInt3  proc    near
        push    bp
        mov     bp,sp
        push    bx ax
        mov     bx,cs:[_last]
        mov     ax,cs:[_savew]          ; restore word where was int3
        mov     wptr cs:[bx],ax
        or      wptr [bp+6],100h        ; TF=1
        mov     wptr [bp+2],bx
        pop     ax bx
        pop     bp
        jmp     MyInt1
MyInt3  endp
