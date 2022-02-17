   ; \n      13,10
   ; $  =    end of line
   ; %%      %
   ; \\      \

   ; %c      character

   ; %sNN    string (DWORD PTR)
   ; %sz     ascii-z string (DWORD PTR)

   ; %i[-]bNNb?        ?=lchar, used only if NN <> 0
   ;      w  d
   ;      d  h
   ;

   ; ---------------------------------------------------------------------------

   _get_char_              macro
                           segcs   lodsb
                           cmp     al, '$'
                           je      __exit
                           endm

   printf:                 mov     cs:_save_si, si
                           pop     si
                           mov     cs:_save_eax, eax
                           mov     cs:_save_cx, cx
                           cld

   __getchar:              _get_char_

                           cmp     al, '%'
                           je      __control_1
                           cmp     al, '\'
                           je      __control_2

   __putchar:              call    cs:putchar_ptr

                           jmp     __getchar

   __exit:                 mov     eax, cs:_save_eax
                           mov     cx, cs:_save_cx
                           push    si
                           mov     si, cs:_save_si
                           ret

   __control_1:            _get_char_

                           cmp     al, '%'
                           je      __putchar

                           cmp     al, 'c'
                           je      __c
                           cmp     al, 's'
                           je      __s
                           cmp     al, 'i'
                           je      __n

                           jmp     __putchar

   __s:                    _get_char_

                           cmp     al, 'z'
                           je      __sz

                           sub     al, '0'
                           mov     ah, al
                           _get_char_
                           sub     al, '0'
                           aad     10
                           movzx   eax, ax
                           mov     cs:_len, eax

                           mov     cs:_s_si, si
                           mov     cs:_s_ds, ds
                           pop     si
                           pop     ds
                           mov     ecx, cs:_len
                           jcxz    __a1
   __a2:                   lodsb
                           call    cs:putchar_ptr
                           loop    __a2
   __a1:                   mov     si, cs:_s_si
                           mov     ds, cs:_s_ds

                           jmp     __getchar

   __sz:
                           mov     cs:_s_si, si
                           mov     cs:_s_ds, ds
                           pop     si
                           pop     ds
   __b2:                   lodsb
                           or      al, al
                           jz      __b1
                           call    cs:putchar_ptr
                           jmp     __b2
   __b1:                   mov     si, cs:_s_si
                           mov     ds, cs:_s_ds

                           jmp     __getchar

   __c:                    pop     ax
                           call    cs:putchar_ptr
                           jmp     __getchar

   __n:                    mov     cs:_sign, 0
                           _get_char_
                           cmp     al, '-'
                           je      __ns
                           jmp     __nu

   __ns:                   mov     cs:_sign, 1
                           _get_char_

   __nu:                   cmp     al, 'b'
                           je      __b
                           cmp     al, 'w'
                           je      __w
                           cmp     al, 'd'
                           je      __d

                           jmp     __putchar

   __b:                    cmp     cs:_sign, 1
                           je      __bs
                           pop     ax
                           movzx   ax, al
                           movzx   eax, ax
                           jmp     __i

   __w:                    cmp     cs:_sign, 1
                           je      __ws
                           pop     ax
                           movzx   eax, ax
                           jmp     __i

   __d:                    cmp     cs:_sign, 1
                           je      __ds
                           pop     eax
                           jmp     __i

   __bs:                   pop     ax
                           movsx   ax, al
                           movsx   eax, ax
                           jmp     __i

   __ws:                   pop     ax
                           movsx   eax, ax
                           jmp     __i

   __ds:                   pop     eax
                           jmp     __i

   __i:                    mov     cs:_number, eax

                           _get_char_
                           sub     al, '0'
                           mov     ah, al
                           _get_char_
                           sub     al, '0'
                           aad     10
                           movzx   eax, ax
                           mov     cs:_len, eax

                           _get_char_

                           mov     cs:_base, 2
                           cmp     al, 'b'
                           je      __ok
                           mov     cs:_base, 10
                           cmp     al, 'd'
                           je      __ok
                           mov     cs:_base, 16
                           cmp     al, 'h'
                           je      __ok

                           jmp     __putchar

   __ok:                   cmp     cs:_len, 0
                           je      __ok2
                           _get_char_
                           mov     cs:_lchar, al
   __ok2:
                           call    write_number
                           jmp     __getchar

   __control_2:            _get_char_

                           cmp     al, 'n'
                           je      __crlf

                           jmp     __putchar

   __crlf:                 mov     al, 13
                           call    cs:putchar_ptr
                           mov     al, 10
                           call    cs:putchar_ptr

                           jmp     __getchar

   ; ---------------------------------------------------------------------------

   dos_putchar:            pusha
                           mov     ah, 2
                           mov     dl, al
                           int     21h
                           popa
                           ret

   boot_putchar:           pusha
                           mov     ah, 0Eh
                           mov     bx, 7
                           int     10h
                           popa
                           ret

   ; ---------------------------------------------------------------------------

   write_number:           pushad

                           mov     eax, cs:_number
                           cmp     cs:_sign, 0
                           je      __0
                           or      eax, eax
                           jge     __0
                           mov     cs:_sign, '-'
                           dec     cs:_len
                           neg     eax

   __0:                    mov     ebx, cs:_base
                           xor     esi, esi
   __1:                    xor     edx, edx
                           div     ebx
                           push    edx
                           inc     esi
                           or      eax, eax
                           jnz     __1

                           cmp     cs:_sign, '-'
                           jne     __6
                           cmp     cs:_len, 0
                           je      __6a
                           cmp     cs:_lchar, ' '
                           je      __6
   __6a:                   mov     al, '-'
                           call    cs:putchar_ptr
   __6:

                           mov     ecx, cs:_len
                           sub     ecx, esi
                           jle     __3
   __2:                    mov     al, cs:_lchar
                           call    cs:putchar_ptr
                           loop    __2
   __3:
                           cmp     cs:_sign, '-'
                           jne     __5
                           cmp     cs:_lchar, ' '
                           jne     __5
                           mov     al, '-'
                           call    cs:putchar_ptr
   __5:

                           mov      ecx, esi
   __4:                    pop      ebx
                           mov      al, cs:hexchar[bx]
                           call     cs:putchar_ptr
                           loop     __4

                           popad
                           ret

   ; ---------------------------------------------------------------------------

   hexchar                 db      '0123456789ABCDEF'

   ; ---------------------------------------------------------------------------

   putchar_ptr             dw      ?

   _s_si                   dw      ?
   _s_ds                   dw      ?
   _save_eax               dd      ?
   _save_cx                dw      ?
   _save_si                dw      ?
   _sign                   db      ?
   _number                 dd      ?
   _base                   dd      ?
   _len                    dd      ?
   _lchar                  db      ?

   ; ---------------------------------------------------------------------------
