.386
here    segment use16
        assume  cs:here,ds:here,es:here,ss:here
        mov     di,offset _output
        mov     si,offset _input
        push    cs
        pop     ds
        push    cs
        pop     es

        mov     dx,offset  f_name
        mov     ax,3D02h
        int     21h
        mov     bx,ax
        mov     cx,2000h
        mov     dx,offset _input
        mov     ah,3Fh
        int     21h
        mov     ah,3Eh
        int     21h
        mov     dx,0

        CALL   packer
        mov   cx,0
        mov     dx,offset  f_name2
        mov     ax,3C00h
        int     21h
        mov     bx,ax
        mov     cx,2000h
        mov     dx,offset _output
        mov     cx,di
        sub     cx,dx
        mov     ah,40h
        int     21h
        mov     ah,3Eh
        int     21h

        mov     ah,4Ch
        int     21h
include coder.inc
        retf


f_name: db      'LZ.BA',0
f_name2: db     'LZ.PKL',0
_table  dw       4FDh   dup     (?) ;for cache
_tree   dw      2000h   dup     (?) ;for cache
_input  dw      1000h   dup     (?)
_output dw      1023h   dup     (?)
;g_ax    dw      0
;g_di    dw      0
;       DS : SI -INPUT
;       ES : DI -OUTPUT
;       Cx      - count n-comp
;       es=ds
;test_notcompress:
here    ends
        end

