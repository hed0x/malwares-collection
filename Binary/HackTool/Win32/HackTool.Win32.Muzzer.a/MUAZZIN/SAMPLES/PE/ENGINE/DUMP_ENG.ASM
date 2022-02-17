.586p
.model flat
locals
.code

callW  macro API
extrn API:PROC
       call API
endm

ofs equ offset
by  equ byte ptr
wo  equ word ptr
dwo equ dword ptr

dropname db "ENGINE.BIN",0

main:
       call drop
       push 0
       callW ExitProcess

drop:
       push 0
       push 80h
       push 2
       push 0
       push 0
       push 0c0000000h
       push ofs dropname
       callW CreateFileA
       mov ebx, eax
       inc eax
       jz @@exit
       push 0
       mov eax, esp
       push 0
       push eax
       push ofs engine_end-ofs engine
       push ofs engine
       push ebx
       callW WriteFile
       mov [esp], ebx
       callW CloseHandle
  @@exit:
       ret

.data

include meta.inc

end main

