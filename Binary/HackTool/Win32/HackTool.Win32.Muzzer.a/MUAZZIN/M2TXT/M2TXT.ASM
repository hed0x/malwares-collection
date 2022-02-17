;Muazzin2Text - transform signed muazzins in usenet hybris posts
;(c) Vecna

.386
model   flat
locals  __

callW  macro   _xxx
  extrn   _xxx:proc
       call    _xxx
endm

.data

dwo equ dword ptr
wo equ word ptr
by equ byte ptr
ofs equ offset

msg1   db "Muazzin to text conversor - (c) Vecna 2000",13,10,0
msg2   db 13,10
       db "syntax:",13,10
       db "  M2TXT <name> <version> <signed muazzin filename>",13,10,0

msg3   db 13,10,"þ Muazzin text dumped to disk and copied to clipboard",13,10,0

error1 db "þ Muazzin file not found!",13,10,0
error2 db "þ Memory alloc error!",13,10,0
error3 db "þ Error creating output file!",13,10,0

_subject db 13,10,"Subject: "

subject db 200h dup (?)

msize    dd ?
msize2    dd ?
mbuffer  dd ?
mbuffer2 dd ?

pseed dd ?

argc   dd ?
argv0  db 256 dup (?)
argv1  db 256 dup (?)
argv2  db 256 dup (?)
argv3  db 256 dup (?)

.code

start:
       lea edx, msg1
       call dump_asciiz_edx

       call getcmdline
       cmp argc, 4
       jne help

       call main

       lea edx, msg3
       call dump_asciiz_edx

quit:
       push -1
       callW ExitProcess

help:
       lea edx, msg2
       call dump_asciiz_edx
       jmp quit

main:
       lea edx, argv3
       call fopen
       jc __error
       mov ebx, eax
       call fgetsize
       mov [msize], eax
       push eax
       push 40h
       callW GlobalAlloc
       test eax, eax
       jz __memerror
       mov [mbuffer], eax
       mov edx, eax
       mov ecx, [msize]
       call fread
       mov eax, [msize]
       shl eax,1
       add eax, [msize]
       push eax
       push 40h
       callW GlobalAlloc
       test eax, eax
       jz __memerror
       mov [mbuffer2], eax
       call fclose

       callW GetTickCount
       mov [pseed], eax

       push 26
       call rnd
       push eax
       push 26
       call rnd
       pop ebx
       add ah, bl
       add ax, "AA"
       movzx ebx, ax

       mov edi, ofs subject
       lea esi, argv1
       movsd
       mov al, " "
       stosb

       mov eax, dwo [argv2]
       sub eax, "0000"
       xchg al, ah
       add ax, bx
       ror eax, 16
       xchg al, ah
       add ax, bx
       stosd
       mov al, " "
       stosb
       mov eax, ebx
       stosw

       push 16
       call rnd
       lea ecx, [eax+eax+4]             ;4-34
  __char222:
       push 0          ;dont use enter
       call randcode
       push 26
       call rnd
       add al, "A"
       stosb
       push -1
       call rnd
       bt eax, 0
       jc __skip222
       add by [edi-1], "a"-"A"
  __skip222:
       loop __char222

       sub eax, eax
       stosd
       lea esi, subject
       call validate_string
       mov [edi-4], eax

       mov edi, [mbuffer2]
       lea esi, _subject
  __cont:
       lodsb
       test al, al
       jz __okc
       stosb
       jmp __cont
  __okc:
       mov ax, 0a0dh
       stosw

       push ebx            ;encode seed
       push dwo [mbuffer]  ;input
       push dwo [msize]  ;size
       push edi ;output
       sub edi, [mbuffer2]
       mov [msize2], edi
       call muazzin2txt
       add [msize2], eax

       lea esi, argv3
  __seek0:
       lodsb
       test al, al
       jnz __seek0
       mov dwo [esi-1], "TXT."
       mov byte [esi+3], al
       lea edx, argv3
       call fcreate
       jc __error2
       mov ebx, eax
       mov ecx, [msize2]
       mov edx, [mbuffer2]
       call fwrite

       push 0
       callW OpenClipboard
       test eax, eax
       jz __noclipboard
       callW EmptyClipboard
       push dwo [mbuffer2]
       push 1                   ;  CF_TEXT
       callW SetClipboardData
       callW CloseClipboard
  __noclipboard:

  __close:
       call fclose

       jmp __back
  __memerror:
       lea edx, error2
       call dump_asciiz_edx
       jmp __close
  __error2:
       lea edx, error3
       jmp __print
  __error:
       lea edx, error1
  __print:
       call dump_asciiz_edx
  __back:
       ret

;encode seed
;input
;size
;output
muazzin2txt:
       pushad
       mov edi, [esp+(8*4)+4]
       mov ecx, [esp+(8*4)+8]
       mov esi, [esp+(8*4)+12]
       mov ebx, [esp+(8*4)+16]
       sub edx, edx
       mov eax, 0a0dh
       stosw
  __next_char:
       push ecx
       inc edx
       lodsb
       mov ah, al
       and al, 000001111b
       and ah, 011110000b
       shr ah, 4
       add ax, bx
       cmp al, "Z"
       jbe __ok_al
       sub al, "Z"-"A"
  __ok_al:
       cmp ah, "Z"
       jbe __ok_ah
       sub ah, "Z"-"A"
  __ok_ah:
       stosw
       push 1            ;use enter
       call randcode
       cmp dl, 32
       jbe __no_line
       mov ax, 0a0dh
       stosw
       sub edx, edx
  __no_line:
       pop ecx
       loop __next_char
       mov eax, 0a0d0a0dh
       stosd
       push eax
       add eax, "****"-0a0d0a0dh
       stosd
       pop eax
       stosd
       sub edi, [esp+(8*4)+4]
       mov [esp+7*4], edi
       popad
       ret 16

validate_string:
       push esi
       push ebx
       sub ebx, ebx
       mov eax, ebx
  __loop:
       lodsb
       test al, al
       jz __end
       cmp al, "A"                      ;below A isnt for sure
       jb __loop
       cmp al, "z"                      ;above z isnt for sure
       ja __loop
       cmp al, "a"
       jae __lowcase
       cmp al, "Z"
       ja __loop
  __lowcase:
       and al, 0dfh
       add al, -"A"
       add ebx, eax
       jmp __loop
  __end:
       cmp ebx, "Z"-"A"
       jbe __done
       add ebx, -("Z"-"A")
       jmp __end
  __done:
       lea eax, [ebx+"A"]
       pop ebx
       pop esi
       ret

rnd:
       push ebp ecx edx
       mov eax, [pseed]
       mov ecx, 41c64e6dh
       mul ecx
       add eax, 3039h
       and eax, 7ffffffh
       mov [pseed], eax
       mov ecx, [esp+(4*3)+4]
       sub edx, edx
       div ecx
       xchg eax, edx                           ;value = rnd MOD limit
       pop edx ecx ebp
       ret 4

randcode:
;       int 3
       pushad

       push 16
       call rnd
       test eax, eax
       jnz @@no_garble

       mov ecx, [esp+8*4+4]
       call @@table
table_size equ @@table-$
       db "! @#?$ %&( )?[ ]{ }+* ?0123?456789 :?< >?"
  @@table:
       pop ebx
       push table_size
       call rnd
       xlat
       cmp al, "?"
       jne @@save
       jecxz @@save
       mov al, 0dh
       stosb
       mov al, 0ah
  @@save:
       stosb
       mov [esp], edi
  @@no_garble:
       popad
       ret 4

include console.inc
include cmdline.inc
include fioex.inc
include fioexlow.inc
include fioexhdr.inc
include consts.inc

end    start
