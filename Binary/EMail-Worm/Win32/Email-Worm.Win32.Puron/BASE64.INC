;esi=input
;edi=output
;eax=size

       cld
       push byte 3
       call .trans
  .trans_:
       db 'A','B','C','D','E','F','G','H','I','J'
       db 'K','L','M','N','O','P','Q','R','S','T'
       db 'U','V','W','X','Y','Z','a','b','c','d'
       db 'e','f','g','h','i','j','k','l','m','n'
       db 'o','p','q','r','s','t','u','v','w','x'
       db 'y','z','0','1','2','3','4','5','6','7'
       db '8','9','+','/'
.chars dd 0                            ;contador de caracteres
  .trans:
       pop ebx
       pop ecx
       cdq
       mov dword [ebx+ecx+((.chars-.trans_)-3)], edx  ;tricky ;)
       div ecx
       mov ecx, eax
       push edx
   .loop:
       lodsd
       dec esi                              ;edx=original
       mov edx, eax                         ;edx=work copy
       call .temp
       call .CODE64Block3
       call .CODE64Block4
       loop .loop
       pop ecx				;get rest
       jecxz .done00000000
       lodsd
       dec ecx
       jz .rest1
       movzx edx, ax                            ;use only 2 bytes
       call .temp
       call .CODE64Block3
       jmp_ .end
   .rest1:
       movzx edx, al                            ;use 1 byte only
       call .temp
       inc ecx
       inc ecx
   .end:
       mov al, '='
       rep stosb
   .done00000000:
       mov eax, 0A0D0A0Dh
       stosd
       push eax
       mov eax, "--1"
       stosd
       dec edi
       mov eax, [esp]
       stosd
       mov al,"."
       stosb
       pop eax
       stosd
       sub eax, eax
       stosd
       pop ecx
       sub edi, ecx                            ;edi=buffer
       xchg ecx, edi                           ;ecx=size
       jmp_ .endendend

.temp:
       call .CODE64Block1                ;little optimizing routine
       call .CODE64Block2
       ret

.CODE64Block1:
       mov eax, edx
       shr eax, 02h
  .process3:
       jmp_ .process

.CODE64Block2:
       mov eax, edx
       shl al, 04h
       shr ah, 04h
  .process2:
       or al, ah                        ;chained jmps
       jmp_ .process3             ;another "why make it easy?" (c) Vecna ;)

.CODE64Block3:
       mov eax, edx
       shr eax, 08h
       shl al, 02h
       shr ah, 06h
       jmp_ .process2

.CODE64Block4:
       mov eax,edx
       shr eax,10h

  .process:
       and al,00111111b
       xlatb
       stosb
       mov eax, dword [ebx+(.chars-.trans_)]
       inc eax
       mov dword [ebx+(.chars-.trans_)], eax
       pushad
       push byte 04Ch
       pop ecx
       cdq
       div ecx
       test edx, edx
       popad
       jnz .noline
       mov ax, 0A0Dh
       stosw
   .noline:
       ret

.endendend: