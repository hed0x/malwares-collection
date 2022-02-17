;Muazzin tester - for lousy muazzin contributors ;-)
;(c) Vecna

;***better handling of breed,bloom

.386
model   flat
locals  __

callW  macro   _xxx
  extrn   _xxx:proc
       call    _xxx
endm

;VISUALGAY EQU 1

OFN_HIDEREADONLY          =   00000004h
OFN_FILEMUSTEXIST         =   00001000h
OFN_LONGNAMES             =   00200000h

.data

dwo equ dword ptr
wo equ word ptr
by equ byte ptr
ofs equ offset

msg1   db "Muazzin tester - (c) Vecna 2000",0
msg2   db 13,10
       db "syntax:",13,10
       db "  MZZTEST <muazzin>",13,10,0

msg3   db 13,10,"þ Muazzin processed",13,10,0
msg_0  db "Failed!",13,10,0
msg_00 db "Sucess.",13,10,0
msg_1  db "þ Loading muazzin... ",0
msg_2  db "þ Muazzin size: ",0
msg_3  db "þ Memory alloc... ",0
msg_4  db "þ Reading code... ",0
msg_5  db "þ File format: ",0
msg_6  db "Binary.",13,10,0
msg_7  db "PE file.",13,10,0

m_1 db "Dropper old size: ",0
m_2 db "Dropper new size: ",0
m_3 db "Dropper: "
fname db "OUTPUT.EXE",0

block0 db "Connection blocked!",13,10,0
block1 db "Connection allowed!",13,10,0

m1 db 13,10,"þ Muazzin",13,10,0
m2 db "Request type: ",0
m3 db "IP: ",0
m4 db "port: ",0
m5 db "Supports: ",0
m6 db "ERROR!",13,10,0
m7 db "Type: "
thetype dd 0
   db 13,10,0
m8 db "Version: ",0

dbg0 db "þþþGPFþþþ",7,13,10,0
dbg1 db "Stack Mismatch",13,10,0
dbg2 db "Exception at ",0
dbg3 db "Crash outside muazzin code",13,10,0
dbg4 db "Crash at muazzin offset: ",0
dbg5 db "Registers:",13,10,0
dbg6 db "Flags: ",0
dbg7 db "Code: ",0

;dbg db "",13,10,0

mens1 db "Attach: ",0
mens2 db "Headers: ",13,10,0
mens3 db "Body: ",13,10,0

registers db "EAX = ", 0
sz_reg equ $-registers
          db "EBX = ", 0
          db "ECX = ", 0
          db "EDX = ", 0
          db "ESP = ", 0
          db "EBP = ", 0
          db "ESI = ", 0
          db "EDI = ", 0
          db "EIP = ", 0

index db 5,2,4,3,10,6,1,0,7
sz_index equ $-index

IFDEF VISUALGAY
namebuffer equ argv1

_help_    db 'Choose the muazzin you want test...', 0

filters db 'Muazzin files', 0
        db '*', 0
        db 'All files', 0
        db '*.*', 0
        dd 0

_openfilename     equ this byte
lStructSize       dd ofs _openfilename_size_-ofs _openfilename
hwndOwner         dd 0
hInstance         dd 0
lpstrFilter       dd ofs filters
lpstrCustomFilter dd 0
nMaxCustFilter    dd 0
nFilterIndex      dd 0
lpstrFile         dd ofs namebuffer
nMaxFile          dd MAX_PATH
lpstrFileTitle    dd 0
nMaxFileTitle     dd 0
lpstrInitialDir   dd 0
lpstrTitle        dd ofs _help_
Flags             dd OFN_FILEMUSTEXIST+OFN_HIDEREADONLY+OFN_LONGNAMES
nFileOffset       dw 0
nFileExtension    dw 0
lpstrDefExt       dd 0
lCustData         dd 0
lpfnHook          dd 0
lpTemplateName    dd 0
_openfilename_size_:

visual_buffer dd ?
visual_size   dd ?

ENDIF


_MT_PROCESSDROPPER db "MT_PROCESSDROPPER",0
_MT_BLOCKIP        db "MT_BLOCKIP",0
_MT_APP            db "MT_APP",0
_MT_GENTEXT        db "MT_GENTEXT",0
_MT_QUERY          db "MT_QUERY",0
_MT_BREED          db "MT_BREED",0
_MT_BLOOM          db "MT_BLOOM",0

dropper:
include dropper.inc

argc   dd ?
argv0  db 256 dup (?)
argv1  db 'plugin', 0
       db (256-($-ofs argv1)) dup (?)
argv2  db 256 dup (?)
argv3  db 256 dup (?)

save_esp dd ?

muazzin_limit dd ?
muazzin_base dd ?

muazzin_support dd ?
muazzin_status dd ?

muazzin_struc db size_muazzin_struc dup (?)

contexts db SIZE CONTEXT dup (?)
.code

start:
IFDEF VISUALGAY
       push 64*1024
       push 40h
       callW GlobalAlloc
       mov [visual_buffer], eax
       mov dword [visual_size], 0
ENDIF
       lea edx, msg1
       call dump_asciiz_edx
       call dump_crlf

IFDEF VISUALGAY
       push ofs _openfilename
       callW GetOpenFileNameA                   ;choose 'muazzin' to sign
ELSE
       call getcmdline
       cmp argc, 2
       jne help
ENDIF

       call main

       lea edx, msg3
       call dump_asciiz_edx

quit:
IFDEF VISUALGAY
       push 0
       push ofs msg1
       push [visual_buffer]
       push 0
       callW MessageBoxA
       mov [visual_buffer], eax
       mov dword [visual_size], 0
ENDIF
       push -1
       callW ExitProcess

help:
       lea edx, msg2
       call dump_asciiz_edx
       jmp quit

main:
       lea edx, msg_1
       call dump_asciiz_edx
       lea edx, argv1
       call fopen
       jc __failed
       lea edx, msg_00
       call dump_asciiz_edx
       mov ebx, eax

       lea edx, msg_2
       call dump_asciiz_edx
       call fgetsize
       jc __failed
       mov [muazzin_limit], eax
       mov ebp, eax
       call dump_dec
       call dump_crlf

       lea edx, msg_3
       call dump_asciiz_edx
       push 64*1024
       push 40h
       callW GlobalAlloc
       jc __failed
       mov ecx, ebp
       mov ebp, eax
       mov [muazzin_base], eax
       lea edx, msg_00
       call dump_asciiz_edx

       lea edx, msg_4
       call dump_asciiz_edx
       mov edx, ebp
       mov edi, ebp
       call fread
       lea edx, msg_00
       call dump_asciiz_edx

       lea edx, msg_5
       call dump_asciiz_edx
       mov eax, [edi+3ch]
       cmp eax, ecx
       ja __binary
       cmp wo [edi], "ZM"
       je __exe
       cmp wo [edi], "MZ"
       jne __binary
  __exe:
       cmp dwo [edi+eax], "EP"
       jne __binary
       push ecx
       lea edx, msg_7
       call dump_asciiz_edx
       lea esi, [edi+eax+0f8h]
       pop eax
       mov ecx, [esi+16]
       sub eax, ecx
       mov esi, [esi+20]
       add esi, ebp
       mov [muazzin_limit], ecx
       rep movsb
       xchg eax, ecx
       rep stosb
       jmp __exec
  __binary:
       lea edx, msg_6
       call dump_asciiz_edx
  __exec:
       mov eax, MT_QUERY
       call muazzin_setup
       mov ebx, [muazzin_support]
       and ebx, not MT_QUERY
  __next_kind:
       bsf ecx, ebx
       btr ebx, ecx
       sub eax, eax
       bts eax, ecx
       call muazzin_setup
       test ebx, ebx
       jz __noquery
       jmp __next_kind
  __noquery:
       push ebp
       callW GlobalFree
       call fclose
       jmp __exit
  __failed:
       lea edx, msg_0
       call dump_asciiz_edx
  __exit:
       ret


muazzin_setup:
       pushad

       lea edx, m1
       call dump_asciiz_edx

       mov esi, ofs muazzin_struc

       mov [esi+m_why], eax
       mov [muazzin_status], eax

       push 64*1024
       push 40h
       call GlobalAlloc
       mov edi, eax

extrn GetModuleHandleA:PROC
       mov eax, ofs GetModuleHandleA
       mov [esi+GMH], eax
extrn GetProcAddress:PROC
       mov eax, ofs GetProcAddress
       mov [esi+GPA], eax

       lea edx, m2
       call dump_asciiz_edx
       mov eax, [muazzin_status]
       call check_query
       call dump_crlf

       test eax, MT_QUERY
       jnz __call
       test eax, MT_PROCESSDROPPER
       jz __temp
__unpack:
       call unpack_dropper
       lea edx, m_1
       call dump_asciiz_edx
       mov eax, [esi+m_droppersize]
       call dump_dec
       call dump_crlf
       jmp __call
  __temp:
       test eax, MT_BLOCKIP
       jz __temp1
       callW GetTickCount
       rol eax, 15
       mov [esi+m_ip], eax
       lea edx, m3
       call dump_asciiz_edx
       mov ecx, 4
  __next:
       rol eax, 8
       push eax
       movzx eax, al
       call dump_dec
       cmp ecx, 1
       je __skip
       mov al, "."
       call dump_al
  __skip:
       pop eax
       loop __next
       call dump_crlf
       lea edx, m4
       call dump_asciiz_edx
       callW GetTickCount
       and eax, 0fffh
       add eax, 6000
       call dump_dec
       call dump_crlf
       xchg al, ah
       mov [esi+m_port], eax
       jmp __call
  __temp1:
       test eax, MT_APP
       jz __temp2
       call unpack_dropper
       jmp __call
  __temp2:
       test eax, MT_GENTEXT
       jz __temp3
       mov [esi+m_buffer], edi
       jmp __call
  __temp3:
       test eax, MT_BREED+MT_BLOOM
       jz __call
  __temp5:
       mov dwo [esi+m_iroutine], ofs callback   ;***
       mov [esi+m_muazzin], edi
       mov dwo [edi+menum_kind], 01111111b
       mov [edi+menum_type], "tset"
       mov dwo [edi+menum_version], 00000500h
  __call:
       push ofs __seh
       push dwo fs:[0]
       mov fs:[0], esp
       mov [save_esp], esp

       push ofs muazzin_struc
       call ebp

  __sehout:
       mov esp, [save_esp]
       pop dwo fs:[0]
       add esp, 4

       mov ebp, [muazzin_status]
       cmp ebp, -1
       je __endproc

       test ebp, MT_QUERY
       jz __noquery
       test eax, MR_DONE
       jz __error
       mov [thetype], ebx
       lea edx, m7
       call dump_asciiz_edx
       lea edx, m8
       call dump_asciiz_edx
       mov eax, ecx
       call dump_hexdword
       call dump_crlf
       lea edx, m5
       call dump_asciiz_edx
       mov ebx, esi
       mov [muazzin_support],esi
  __check_flagz:
       bsf ecx, ebx
       btr ebx, ecx
       sub eax, eax
       bts eax, ecx
       call check_query
       test ebx, ebx
       jz __gout
       mov al, "+"
       call dump_al
       jmp __check_flagz
  __gout:
       call dump_crlf
       jmp __endproc
  __noquery:
       test ebp, MT_GENTEXT
       jz __nogentext
       mov esi, ofs muazzin_struc
       cmp dwo [esi+m_result],MR_OK
       jne __error
       mov edi,[esi+m_buffer]
       lea edx, mens1
       call dump_asciiz_edx
       lea edx, [edi+62*1024]
       call dump_asciiz_edx
       call dump_crlf
       lea edx, mens2
       call dump_asciiz_edx
       lea edx, [edi+30*1024]
       call dump_asciiz_edx
       call dump_crlf
       lea edx, mens3
       call dump_asciiz_edx
       mov edx, edi
       call dump_asciiz_edx
       call dump_crlf
       jmp __endproc
  __nogentext:
       test ebp, MT_PROCESSDROPPER
       jz __noprocessdroper
       mov eax, [esi+m_droppersize]
       lea edx, m_2
       call dump_asciiz_edx
       call dump_dec
       call dump_crlf
       lea edx, m_3
       call dump_asciiz_edx
       call dump_crlf
       lea edx, fname
       mov ecx, eax
       call fcreate
       jc __error
       mov ebx, eax
       mov edx, [esi+m_dropper]
       call fwrite
       call fclose
       jmp __endproc
  __noprocessdroper:
       test ebp, MT_APP ;***
       jnz __endproc
  __noapp:
       test ebp, MT_BLOCKIP
       jz __noblock
       mov edx, ofs block0
       test eax, MR_ERROR
       jnz __prnt
       mov edx, ofs block1
  __prnt:
       call dump_asciiz_edx
       jmp __endproc

  __noblock:        ;***
       test ebp, MT_BLOOM
       jnz __endproc
  __nobloom:        ;***
       test ebp, MT_BREED
       jnz __endproc

  __endproc:
       push edi
       callW GlobalFree
       popad
       ret
  __error:
       lea edx, m6
       call dump_asciiz_edx
       jmp __endproc

  __seh:
       mov esi, [esp.EH_ContextRecord]
       mov edi, ofs contexts
       mov ebp, edi
       mov ecx, SIZE CONTEXT
       rep movsb
       mov edi, [esp.EH_ExceptionRecord]
       mov edi, [edi.ER_ExceptionAddress]
       mov esp, [esp.EH_EstablisherFrame]
       lea edx, dbg0
       call dump_asciiz_edx
       cmp [save_esp], esp
       je __stack_ok
       lea edx, dbg1
       call dump_asciiz_edx
       jmp __endproc
  __stack_ok:
       lea edx, dbg2
       call dump_asciiz_edx
       mov eax, edi
       call dump_hexdword
       call dump_crlf
       sub edi, [muazzin_base]
       jb __outside
       cmp edi, [muazzin_limit]
       ja __outside
       lea edx, dbg4
       call dump_asciiz_edx
       mov eax, edi
       call dump_hexdword
       call dump_crlf
       jmp __into
  __outside:
       lea edx, dbg3
       call dump_asciiz_edx

  __into:
       mov edx, ofs dbg5
       call dump_asciiz_edx
       mov edx, ofs registers-sz_reg
       mov ebp, ofs contexts

       mov eax, [ebp.CONTEXT_Eax]
       call print_hexdec

       mov eax, [ebp.CONTEXT_Ebx]
       call print_hexdec

       mov eax, [ebp.CONTEXT_Ecx]
       call print_hexdec

       mov eax, [ebp.CONTEXT_Edx]
       call print_hexdec

       mov eax, [ebp.CONTEXT_Esp]
       call print_hexdec

       mov eax, [ebp.CONTEXT_Ebp]
       call print_hexdec

       mov eax, [ebp.CONTEXT_Esi]
       call print_hexdec

       mov eax, [ebp.CONTEXT_Edi]
       call print_hexdec

       mov eax, [ebp.CONTEXT_Eip]
       call print_hexdec

       mov edx, ofs dbg6
       call dump_asciiz_edx

       mov ebx,[ebp.CONTEXT_EFlags]
       push ebx
       mov al, "c"
       popf
       jnc __nocarry
       mov al, "C"
  __nocarry:
       call dump_al
       call dump_space

       push ebx
       mov al, "z"
       popf
       jnz __nozero
       mov al, "Z"
  __nozero:
       call dump_al
       call dump_space

       push ebx
       mov al, "p"
       popf
       jnp __noparity
       mov al, "P"
  __noparity:
       call dump_al
       call dump_space

       push ebx
       mov al, "o"
       popf
       jnp __nooverf
       mov al, "O"
  __nooverf:
       call dump_al
       call dump_space

       push ebx
       mov al, "s"
       popf
       jnp __nosign
       mov al, "S"
  __nosign:
       call dump_al
       call dump_crlf

       mov edx, ofs dbg7
       call dump_asciiz_edx
       mov esi, [ebp.CONTEXT_Eip]
       mov ecx, 10h
  __dumphex:
       lodsb
       call dump_hexbyte
       call dump_space
       loop __dumphex
       call dump_crlf
       mov dwo [muazzin_status],-1
       jmp __sehout


callback:
;       int 3
       pushad
       push 104h
       push dwo [esp+8*4+4+4]
       push 0
       callW GetModuleFileNameA
       popad
       ret 4


check_query:
       pushad
       test eax, MT_PROCESSDROPPER
       jz __temp
       lea edx, _MT_PROCESSDROPPER
       jmp __print
  __temp:
       test eax, MT_BLOCKIP
       jz __temp1
       lea edx, _MT_BLOCKIP
       jmp __print
  __temp1:
       test eax, MT_APP
       jz __temp2
       lea edx, _MT_APP
       jmp __print
  __temp2:
       test eax, MT_GENTEXT
       jz __temp3
       lea edx, _MT_GENTEXT
       jmp __print
  __temp3:
       test eax, MT_QUERY
       jz __temp4
       lea edx, _MT_QUERY
       jmp __print
  __temp4:
       test eax, MT_BREED
       jz __temp5
       lea edx, _MT_BREED
       jmp __print
  __temp5:
       test eax, MT_BLOOM
       jz __temp6
       lea edx, _MT_BLOOM
  __print:
       call dump_asciiz_edx
  __temp6:
       popad
       ret

print_hexdec:
       add edx, sz_reg
       call dump_asciiz_edx
       push eax
       call dump_hexdword
       call dump_space
       mov al, "("
       call dump_al
       pop eax
       call dump_dec
       mov al, ")"
       call dump_al
       call dump_crlf
       ret

unpack_dropper:
       mov [esi+m_dropper], edi
       push edi
       push ofs dropper
       call _aP_depack_asm
       mov [esi+m_droppersize], eax
       ret

include console.inc
include cmdline.inc
include fioex.inc
include fioexlow.inc
include fioexhdr.inc
include \inc\win32api.inc
include consts.inc

include ..\muazzin.asi
include \unpack.asi

end    start
