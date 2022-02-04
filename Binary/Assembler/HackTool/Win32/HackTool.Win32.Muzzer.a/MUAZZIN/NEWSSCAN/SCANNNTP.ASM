;Check list of NNTP servers for working ones,multithread (v2)
;(c) Vecna

.386
model   flat
locals  __

NUM_THREAD EQU 30

callW  macro   _xxx
  extrn   _xxx:proc
       call    _xxx
endm

.data

dwo equ dword ptr
wo equ word ptr
by equ byte ptr
ofs equ offset

MAX_PATH equ 104h

msg1   db "NNTP list scanner/checker - version 2 - (c) Vecna 2001",13,10,0
msg2   db 13,10
       db "syntax:",13,10
       db "  SCANNNTP <infile> <outfile> <newsgroup>",13,10,0

msg3   db 13,10,"Done!",13,10,0

msg4   db "Entries found: ",0

error1 db "þ Infile not found!",13,10,0
error2 db "þ Memory alloc error!",13,10,0

ineterror db " communication error...",13,10,0
contacted db " group exists!!!",13,10,0
nocontact db " group no exists",13,10,0
netdown   db " cant connect...",13,10,0

newsgroup_size  dd 8

quit      db "QUIT",13,10
quit_size equ $-quit

newsgroup db "GROUP "
groupname db 50 dup (?)

header      dd ?
in_limit    dd ?
in_size     dd ?
in_buffer   dd ?
current_esi dd ?
threads     dd NUM_THREAD dup (?)
argc        dd ?
argv0       db 256 dup (?)
argv1       db 256 dup (?)
argv2       db 256 dup (?)
argv3       db 256 dup (?)

.code



start:
       lea edx, msg1
       call dump_asciiz_edx

       call getcmdline

       lea edx, msg2

       cmp argc, 4
       jne __help

       call main

       lea edx, msg3

  __help:
       call dump_asciiz_edx
       push 0
       callW ExitProcess



main:
       lea esi, argv3
       lea edi, groupname
       sub ecx, ecx
  __nxt_b:
       lodsb
       cmp al, "."
       je __sto

       cmp al, "z"
       ja __fim
       cmp al, "A"
       jb __fim
       cmp al, "Z"
       jb __sto
       cmp al, "a"
       jb __fim
  __sto:
       stosb
       inc ecx
       jmp __nxt_b

  __fim:
       mov eax, 0a0dh
       stosd
       add [newsgroup_size], ecx

       lea edx, argv1
       call fopen
       mov ebx, eax
       inc eax
       jz __error_in
       call fgetsize
       mov [in_size], eax
       push eax
       push 40h
       callW GlobalAlloc
       test eax, eax
       jz __error_mem
       mov [in_buffer], eax
       mov [current_esi], eax
       mov esi, eax
       mov edx, eax
       mov ecx, [in_size]
       call fread
       add eax,[in_buffer]
       mov [in_limit],eax
       call fclose

       sub ecx, ecx
       mov edx, [in_size]
       add edx, esi
  __next_entry:
       cmp esi, edx                     ;edx==limite
       jnb __done_scan_entries
       lodsb
       sub al, 0ah
       jnz __next_entry
       inc ecx
       jmp __next_entry
  __done_scan_entries:
       lea edx, newsgroup
       call dump_asciiz_edx
       lea edx, msg4
       call dump_asciiz_edx
       mov eax, ecx
       call dump_dec
       call dump_crlf

       add esp, -200h
       push esp
       push 101h
       callW WSAStartup
       add esp, 200h
       test eax, eax
       jnz __error_mem

       mov esi, ofs threads
  __check_threads:
       cmp esi,ofs threads+NUM_THREAD*4
       jb __all_threads
       mov esi,ofs threads
       mov edi,esi
       mov ecx,NUM_THREAD
       sub eax,eax
       repe scasd
       je __finished
  __all_threads:
       lodsd
       push 0
       push eax
       callW WaitForSingleObject
       cmp eax,00000102h        ;WAIT_TIMEOUT
       je __check_threads

  __thread_ended:
       mov dwo [esi-4],0

       call get_entry
       test eax,eax
       jz __check_threads

       push 0
       push esp
       push 0
       push eax
       push ofs nntp_thread
       push 0
       push 0
       callW CreateThread
       mov dwo [esi-4],eax
       pop eax
       jmp __check_threads

  __finished:

       callW WSACleanup

       push dwo [in_buffer]
       callW GlobalFree
       jmp __back

  __error_mem:
       lea edx, error2
       call __print
       call fclose
       jmp __back

  __error_in:
       lea edx, error1

  __print:
       call dump_asciiz_edx
  __back:
       ret



do_dec:
       pusha
       xor edx, edx
       mov ebx, 10
       div ebx
       push edx
       or eax, eax
       jz __done
       call do_dec
  __done:
       pop eax
       add al, '0'
       stosb
       mov [esp], edi
       popa
       ret



nt_buffer        equ 0
nt_buffer2       equ nt_buffer+MAX_PATH
nt_ip            equ nt_buffer2+100h
nt_socket        equ nt_ip+4

nntp_thread_vars equ nt_socket+4

nntp_thread:
       pushad
       sub esp,nntp_thread_vars
       mov ebp,esp

       push 0
       push 1
       push 2
       callW socket
       mov [ebp+nt_socket], eax
       inc eax
       jz __socket_error

       mov esi,[ebp+(8*4)+nntp_thread_vars+4]
       push esi
       callW inet_addr
       mov [ebp+nt_ip], eax
       inc eax
       jz __close_socket

       dec eax
       lea edi,[ebp+nt_buffer]
       push 4
       pop ecx
  __next_subnet:
       push eax
       and eax,0ffh
       call do_dec
       cmp cl, 1
       mov al, " "
       je __skipzz
       mov al, "."
  __skipzz:
       stosb
       pop eax
       ror eax, 8
       loop __next_subnet

       mov eax," >= "
       stosd

;127.0.0.1 =>

       lea esi, netdown

       push 0
       push 0
       push dwo [ebp+nt_ip]
       push 077000002h
       mov eax,esp

       push 10h
       push eax
       push dwo [ebp+nt_socket]
       callW connect
       add esp,4*4
       test eax, eax
       jnz  __quit

       lea esi,ineterror

       lea ebx,[ebp+nt_buffer2]

       push 0
       push 100h
       push ebx
       push dwo [ebp+nt_socket]
       callW recv
       inc eax
       jz  __quit

       push 0
       push dwo [newsgroup_size]
       push ofs newsgroup
       push dwo [ebp+nt_socket]
       callW send
       inc eax
       jz  __quit

       push 0
       push 100h
       push ebx
       push dwo [ebp+nt_socket]
       callW recv
       inc eax
       jz  __quit

       lea esi, nocontact

       cmp by [ebx], "2"
       jne  __quit

       lea esi, contacted

       push 0
       push quit_size
       push ofs quit
       push dwo [ebp+nt_socket]
       callW send

       push dwo [ebp+nt_ip]
       call log

  __quit:
       lodsb
       stosb
       test al,al
       jnz __quit
       lea edx,[ebp+nt_buffer]
       call dump_asciiz_edx

  __close_socket:
       push dwo [ebp+nt_socket]
       callW CloseHandle

  __socket_error:
       add esp,nntp_thread_vars
       popad
       ret 4



get_entry:
       pushad
       mov esi,[current_esi]
       mov [esp.pushad_eax],esi

  __entry:
       cmp esi,[in_limit]
       jnb __error
       lodsb
       cmp al, "."
       je __entry
       cmp al, "9"
       ja __done_cpy
       cmp al, "0"
       jae __entry
  __done_cpy:
       mov by [esi-1],0

  __seek_next_entry:
       cmp esi,[in_limit]
       jnb __esi_set
       cmp by [esi], "0"
       jb __inc
       cmp by [esi], "9"
       jbe __esi_set
  __inc:
       inc esi
       jmp __seek_next_entry
  __error:
       mov dwo [esp.pushad_eax],0
  __esi_set:
       mov [current_esi], esi
       popad
       ret



log:
       pushad
       lea edx,argv2
       call fopen
       mov ebx,eax
       inc eax
       jnz __open

       lea edx,argv2
       call fcreate
       mov ebx,eax
       inc eax
       jz __error_out

  __open:
       call fgetsize
       mov edx,eax
       call fseek

       mov ebp,[esp+8*4+4]              ;ebp==IP

       sub esp,200h
       mov edi,esp

       cmp dwo [header],0
       jne __zkipz
       mov al, ';'
       stosb
       mov esi,ofs groupname
  __zpy:
       lodsb
       stosb
       test al,al
       jnz __zpy
       dec edi
       inc dwo [header]
  __zkipz:

       mov eax,' bd'
       stosd
       dec edi

       push 4
       pop ecx
  __dot:
       mov eax,ebp
       and eax,0ffh
       call do_dec
       cmp cl,1
       je __skipzz111
       mov al,","
       stosb
  __skipzz111:
       ror ebp,8
       loop __dot

       mov ax,0a0dh
       stosw

       mov edx,esp
       sub edi,edx
       mov ecx,edi
       call fwrite
       add esp,200h

       call fclose
  __error_out:
       popad
       ret 4

include console.inc
include cmdline.inc
include fioex.inc
include fioexlow.inc
include fioexhdr.inc
include consts.inc

end    start
