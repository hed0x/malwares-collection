;Muazzin packer - turn a normal muazzin in a compressed self-unpack mauzzin
;(c) Vecna 2001

.386
.model flat,stdcall
option casemap :none

include d:\masm32\include\windows.inc
include d:\masm32\include\user32.inc
includelib d:\masm32\lib\user32.lib
include d:\masm32\include\kernel32.inc
includelib d:\masm32\lib\kernel32.lib
include d:\masm32\include\comdlg32.inc
includelib d:\masm32\lib\comdlg32.lib
include d:\masm32\include\aplib.inc
includelib d:\masm32\lib\aplib.lib

.data

filters db 'Muazzin files', 0
        db '*', 0
        db 'All files', 0
        db '*.*', 0
        dd 0

help    db 'Escolha o MUAZZIN(tm) que deseja compactar...', 0

.data?
handle1 dd ?
handle2 dd ?
handle3 dd ?
mua_size dd ?
mem dd ?
muazzin_name_buffer db MAX_PATH dup (?)
my_openfile db SIZE OPENFILENAMEA dup (?)

.code

start:
       invoke GetCommandLine
       mov esi, eax
       mov edi, offset muazzin_name_buffer
  @@search_param1:
       lodsb
       test al, al
       jz @@done_exit
       cmp al, " "
       je @@zopy_param1
       cmp al, 0dh
       jne @@search_param1

  @@opendialog:
       mov esi, offset my_openfile
       mov dword ptr [esi+OPENFILENAMEA.lStructSize], SIZEOF OPENFILENAMEA
       mov dword ptr [esi+OPENFILENAMEA.lpstrFilter], offset filters
       mov dword ptr [esi+OPENFILENAMEA.lpstrFile], offset muazzin_name_buffer
       mov dword ptr [esi+OPENFILENAMEA.nMaxFile], MAX_PATH
       mov dword ptr [esi+OPENFILENAMEA.lpstrTitle], offset help
       mov dword ptr [esi+OPENFILENAMEA.Flags], OFN_FILEMUSTEXIST+OFN_HIDEREADONLY+OFN_LONGNAMES
       invoke GetOpenFileNameA, esi
       test eax, eax
       jz @@done_exit
       mov esi, offset muazzin_name_buffer
       jmp @@process_filename_esi

  @@zopy_param1:
       cmp byte ptr [esi], 0
       jz @@opendialog
       cmp byte ptr [esi], 0dh
       jz @@opendialog
       cmp byte ptr [esi], " "
       jne @@zopy_param2
       inc esi
       jmp @@zopy_param1
  @@zopy_param2:
       lodsb
       stosb
       test al, al
       jz @@done_cpy
       cmp al, 0dh
       je @@done_cpy
       cmp al, " "
       jne @@zopy_param2
  @@done_cpy:
       mov esi, offset muazzin_name_buffer
       cmp byte ptr [esi], 0dh
       je @@opendialog
  @@process_filename_esi:
       invoke CreateFileA, esi, GENERIC_READ+GENERIC_WRITE,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
       mov [handle1], eax
       inc eax
       jz @@done_exit
       invoke GetFileSize, [handle1],0
       mov [mua_size], eax
       invoke CreateFileMapping,[handle1],0,PAGE_READWRITE,0,[mua_size],0
       mov [handle2], eax
       test eax, eax
       jz @@done_exit
       invoke MapViewOfFile,[handle2],FILE_MAP_ALL_ACCESS,0,0,0
       mov [handle3], eax
       test eax, eax
       jz @@done_exit
       invoke GlobalAlloc, 40h, [mua_size]
       mov [mem], eax
       test eax, eax
       jz @@error_exit
       mov esi, [handle3]
       mov edi, [mem]
       mov ecx, [mua_size]
       rep movsb
       invoke aP_workmem_size, [mua_size]
       invoke GlobalAlloc, 40h, eax
       test eax, eax
       mov ebp, eax
       jz @@error_exit
       cld
       mov edi, [handle3]
       mov ecx, size_depacker
       mov esi, offset depacker
       rep movsb
       invoke aP_pack,[mem],edi,[mua_size],ebp,0
       mov edi, [handle3]
       mov [edi+(@@packed_size-depacker)], eax
       add eax, size_depacker
       mov [mua_size], eax
       invoke MessageBeep,-1
  @@error_exit:
       invoke UnmapViewOfFile, [handle3]
       invoke CloseHandle, [handle2]
       invoke SetFilePointer,[handle1],[mua_size],0,FILE_BEGIN
       invoke SetEndOfFile,[handle1]
       invoke CloseHandle, [handle1]
  @@done_exit:
       invoke ExitProcess, 0

depacker:
       call @@delta
  @@delta:
       pop esi
       add esi, (@@packerbuffer-@@delta)
       mov ecx, 12345678h
  @@packed_size equ $-4
       lea edi, [esi+ecx+10h]
       push edi
       push esi
       push edi

include \unpack.asi

  @@packerbuffer:

size_depacker equ $-depacker

end start

