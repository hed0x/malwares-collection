; comment ;)
; BASLR by roy g biv
; 
; It's a tool, not a virus.
; ---
; 
; to build this thing:
; tasm
; ----
; tasm32 /ml /m3 baslr
; tlink32 /B:400000 /x baslr,,,import32
; 
; Code is not self-modifying, so no need to alter section attributes
; ---
; 
; (;

.586 ;rdtsc
.model  flat

extern  GetCommandLineW:proc
extern  CharNextW:proc
extern  WriteFile:proc
extern  CloseHandle:proc
extern  ExitProcess:proc
extern  CreateFileW:proc
extern  ReadFile:proc
extern  SetFilePointer:proc
extern  MessageBoxA:proc

.data
include baslr.inc

baslr_begin     label   near
        push    '!bgr'

;-----------------------------------------------------------------------------
;recover ntdll image base
;-----------------------------------------------------------------------------

        mov     eax, dword ptr fs:[tebProcessEnvironmentBlock]
        mov     eax, dword ptr [eax + pebLdr]
        mov     eax, dword ptr [eax + ldrInLoadOrderModuleList]
        mov     ebx, dword ptr [eax + mlDllBase]
        mov     esi, dword ptr [ebx + e_lfanew]
        call    skip_apis

;-----------------------------------------------------------------------------
;API CRC table, null terminated
;-----------------------------------------------------------------------------

        dd      0E1E08AA1h                      ;KiUserExceptionDispatcher
        dd      0AF7D682Dh                      ;NtAllocateVirtualMemory
        dd      004D1E941h                      ;NtProtectVirtualMemory
        dd      0E6AE7AC8h                      ;NtQueryVirtualMemory

apis_end        label   near
        dd      0

;-----------------------------------------------------------------------------
;VirtualAlloc(address, size, type, prot) -> NtAllocateVirtualMemory(-1, &address, 0, &size, type, prot)
;-----------------------------------------------------------------------------

VirtualAlloc    proc    near
        push    dword ptr [esp + 10h]
        push    dword ptr [esp + 10h]
        lea     eax, dword ptr [esp + 10h]
        push    eax
        push    0
        lea     eax, dword ptr [esp + 14h]
        push    eax
        push    -1
      
xVirtualAlloc   label   near
        mov     eax, '!bgr'
        call    eax
        pop     ecx
        pop     eax
        push    ecx
        ret     0ch
VirtualAlloc    endp

;-----------------------------------------------------------------------------
;VirtualProtect(address, size, newprot, oldprot) -> NtProtectVirtualMemory(-1, &address, &size, newprot, oldprot)
;-----------------------------------------------------------------------------

VirtualProtect  proc    near
        push    dword ptr [esp + 10h]
        push    dword ptr [esp + 10h]
        lea     eax, dword ptr [esp + 10h]
        push    eax
        lea     eax, dword ptr [esp + 10h]
        push    eax
        push    -1

xVirtualProtect label   near
        mov     eax, '!bgr'
        call    eax
        ret     10h
VirtualProtect  endp

map_page        proc    near
        push    1
        pop     ebx

map_next        label   near
        push    esi
        enter   size _MEMORY_BASIC_INFORMATION, 0
        mov     eax, esp

;-----------------------------------------------------------------------------
;VirtualQuery(address, buffer, length) -> NtQueryVirtualMemory(-1, address, 0, buffer, length, &length)
;-----------------------------------------------------------------------------

        push    eax
        push    size _MEMORY_BASIC_INFORMATION
        push    eax
        push    0
        push    esi
        push    -1

xVirtualQuery   label   near
        mov     eax, '!bgr'
        call    eax
        cmp     byte ptr [ebp + _MEMORY_BASIC_INFORMATION.mbiState - size _MEMORY_BASIC_INFORMATION + 1], MEM_COMMIT shr 8
        je      skip_commit
        push    PAGE_READWRITE
        push    MEM_COMMIT
        push    ebx
        push    esi
        call    VirtualAlloc

;-----------------------------------------------------------------------------
;protect relocated page
;-----------------------------------------------------------------------------

        mov     ecx, esp
        push    ecx                             ;VirtualProtect
        push    dword ptr [ebp + _MEMORY_BASIC_INFORMATION.mbiAllocationProtect - size _MEMORY_BASIC_INFORMATION]
        push    ebx                             ;VirtualProtect
        push    eax                             ;VirtualProtect

;-----------------------------------------------------------------------------
;unmap original page
;-----------------------------------------------------------------------------

        push    ecx                             ;VirtualProtect
        push    ebx                             ;PAGE_NOACCESS
        push    ebx                             ;VirtualProtect
        mov     esi, eax
        sub     esi, dword ptr [(edi - size _IMAGE_SECTION_HEADER) + _IMAGE_SECTION_HEADER.shVirtualAddress]
        add     esi, dword ptr [(edi - size _IMAGE_SECTION_HEADER) + _IMAGE_SECTION_HEADER.shName + 4]
        push    esi                             ;VirtualProtect
        push    edi

;-----------------------------------------------------------------------------
;map original page
;-----------------------------------------------------------------------------

        push    ecx
        push    PAGE_READONLY
        push    ebx
        push    esi
        xchg    edi, eax
        call    VirtualProtect

;-----------------------------------------------------------------------------
;insert page-level decompressor/decryptor here
;-----------------------------------------------------------------------------

        xor     ecx, ecx
        mov     ch, 4
        rep     movs dword ptr [edi], dword ptr [esi]
        pop     edi
        call    VirtualProtect
        call    VirtualProtect

skip_commit     label   near
        leave
        pop     eax

;-----------------------------------------------------------------------------
;map in at least 16 bytes, to cover any XMM loads
;it's also enough to cover the largest possible legal instruction (15 bytes)
;-----------------------------------------------------------------------------

        lea     esi, dword ptr [eax + 10h]
        and     si, 0f000h
        cmp     esi, eax
        jnbe    map_next
        ret
map_page        endp

code_reloc      label   near
        pop     eax
        pop     dword ptr [eax + (offset xVirtualQuery - offset apis_end) + 1]
        pop     dword ptr [eax + (offset xVirtualProtect - offset apis_end) + 1]
        pop     dword ptr [eax + (offset xVirtualAlloc - offset apis_end) + 1]
        pop     esi
        mov     cl, offset new_ki - offset ki
        call    skip_code
ki      db      08Bh, 04Ch, 024h, 004h          ;mov  ecx, dword ptr [esp + 4]
        db      08Bh, 01Ch, 024h                ;mov  ebx, dword ptr [esp]
        db      051h                            ;push ecx
        db      053h                            ;push ebx
        db      0E8h                            ;call

new_ki          label   near
        cmp     dword ptr [ebx + erExceptionCode], STATUS_ACCESS_VIOLATION
        jne     old_ki
        mov     esi, dword ptr [ebx + erExceptionAddress]
        call    find_secto
        xchg    ecx, eax
        jecxz   try_sectn

;-----------------------------------------------------------------------------
;attempted to access host image - redirect to relocated image
;-----------------------------------------------------------------------------

        sub     esi, dword ptr [(edi - size _IMAGE_SECTION_HEADER) + _IMAGE_SECTION_HEADER.shName + 4]
        add     esi, dword ptr [(edi - size _IMAGE_SECTION_HEADER) + _IMAGE_SECTION_HEADER.shVirtualAddress]
        mov     dword ptr [eax + ctxEip], esi
        ret

old_ki          label   near
        push    '!bgr'

busy_ret        label   near
        xchg    ebx, eax
        ret

host_num        proc  near
        push    'r'
        pop     eax

host_sect       label   near
        mov     edi, '!bgr'
        ret
host_num        endp

find_secto      proc    near
        call    host_num

find_sectol     label   near
        cmp     dword ptr [edi + _IMAGE_SECTION_HEADER.shName - size _IMAGE_SECTION_HEADER], esi
        jbe     secto_loop
        cmp     dword ptr [edi + _IMAGE_SECTION_HEADER.shName + 4 - size _IMAGE_SECTION_HEADER], esi
        jbe     secto_ret

secto_loop      label   near        
        sub     edi, size _IMAGE_SECTION_HEADER
        dec     eax
        jne     find_sectol

secto_ret       label   near
        ret
find_secto      endp

find_sectn      proc    near
        call    host_num

find_sectnl     label   near
        cmp     dword ptr [edi + _IMAGE_SECTION_HEADER.shVirtualSize - size _IMAGE_SECTION_HEADER], esi
        jbe     sectn_loop
        cmp     dword ptr [edi + _IMAGE_SECTION_HEADER.shVirtualAddress - size _IMAGE_SECTION_HEADER], esi
        jbe     sectn_ret

sectn_loop      label   near        
        sub     edi, size _IMAGE_SECTION_HEADER
        dec     eax
        jne     find_sectnl

sectn_ret       label   near
        ret
find_sectn      endp

try_sectn       label   near
        push    ebx
        push    esi
        call    find_sectn
        xchg    ecx, eax
        jecxz   check_inst
        call    map_page

;-----------------------------------------------------------------------------
;if the exception address matches the exception parameter,
;then exception was caused by eip value and we are done
;-----------------------------------------------------------------------------

check_inst      label   near
        pop     ebp
        pop     eax
        mov     esi, dword ptr [eax + erExceptionInformation]
        cmp     esi, ebp
        je      busy_ret

;-----------------------------------------------------------------------------
;otherwise, exception was caused by memory access
;that can be host memory or unmapped relocated memory
;or it could be a bug in the host, and we skip that case
;-----------------------------------------------------------------------------

find_inst       label   near
        inc     esi
        je      old_ki
        dec     esi
        call    find_sectn
        test    eax, eax
        jne     found_inst
        call    find_secto
        xchg    ecx, eax
        jecxz   old_ki
        sub     esi, dword ptr [(edi - size _IMAGE_SECTION_HEADER) + _IMAGE_SECTION_HEADER.shName + 4]
        add     esi, dword ptr [(edi - size _IMAGE_SECTION_HEADER) + _IMAGE_SECTION_HEADER.shVirtualAddress]

;-----------------------------------------------------------------------------
;we reach here if memory access is in host memory or unmapped relocated memory
;we must examine the instruction and turn it into an absolute memory reference
;because we cannot alter any registers
;-----------------------------------------------------------------------------

found_inst      label   near
        push    esi
        call    map_page
        pop     esi

busy_flag       label   near
        clc
        jb      busy_ret
        mov     bl, ctxEsp
        xchg    ebp, esi

;-----------------------------------------------------------------------------
;point to next instruction, assuming that it's not a call or jump
;-----------------------------------------------------------------------------

        call    get_opsize

inst_delta      label   near
        mov     edi, dword ptr [esp - 4]
        lea     edi, dword ptr [edi + ebx + (offset inst_buff - offset inst_delta) - ctxEsp]
        mov     ecx, dword ptr [esp + 8]
        add     ecx, ebx
        add     dword ptr [ecx + ctxEip - ctxEsp], eax
        xchg    ebx, eax
        lea     edx, dword ptr [ecx + ctxEcx - ctxEsp]
        mov     dword ptr [edi + offset restore_ctx - offset inst_buff + 2], edx
        lea     edx, dword ptr [edi + offset restore_ctx - offset inst_buff - 1]

;-----------------------------------------------------------------------------
;copy all prefixes and first byte of real instruction
;no critical section because no thread switch can occur
;-----------------------------------------------------------------------------

copy_inst       label   near
        dec     ebx
        lods    byte ptr [edi]
        stos    byte ptr [edi]
        cmp     al, 0f0h
        je      copy_inst
        mov     ah, al
        sub     al, 64h
        cmp     al, 3
        jbe     copy_inst
        sub     al, 0f2h - 64h
        cmp     al, 1
        jbe     copy_inst
        and     ah, 0e7h
        cmp     ah, 26h
        je      copy_inst

;-----------------------------------------------------------------------------
;copy next byte if 0f
;-----------------------------------------------------------------------------

        cmp     al, 0fh - 0f2h
        jne     check_moveax
        dec     ebx
        movs    byte ptr [edi], byte ptr [esi]

check_moveax    label   near
        sub     al, 0a0h - 0f2h

;-----------------------------------------------------------------------------
;check for a0-a3 (mov to/from al/eax), a4-a7 (movs/cmps), aa-af (stos/lods/scas)
;-----------------------------------------------------------------------------

        cmp     al, 0fh
        jnbe    check_calljmp

;-----------------------------------------------------------------------------
;check for a0-a3 (mov to/from al/eax) because they don't have any modr/m byte
;-----------------------------------------------------------------------------

        cmp     al, 3
        jbe     inst_eax
        push    ebx
        push    ebx
        xchg    ebx, eax
        pushad
        push    2
        pop     ebp

;-----------------------------------------------------------------------------
;for strings, we have to change the registers temporarily
;so find and map esi and edi if possible
;-----------------------------------------------------------------------------

find_str        label   near
        push    ecx
        mov     esi, dword ptr [ecx + ctxEdi - ctxEsp]
        call    find_sectn
        test    eax, eax
        jne     map_str
        call    find_secto
        xchg    ecx, eax
        jecxz   skip_map
        mov     ecx, dword ptr [(edi - size _IMAGE_SECTION_HEADER) + _IMAGE_SECTION_HEADER.shVirtualAddress]
        sub     ecx, dword ptr [(edi - size _IMAGE_SECTION_HEADER) + _IMAGE_SECTION_HEADER.shName + 4]
        add     esi, ecx
        mov     dword ptr [eax + ctxEdi - ctxEsp], esi
        mov     dword ptr [ebp * 4 + esp + 20h], ecx

map_str         label   near
        call    map_page

skip_map        label   near
        pop     ecx
        add     ecx, 4
        dec     ebp
        jne     find_str
        popad
        mov     ah, offset skip_stack - offset xchg_stack1
        jmp     inst_str

;-----------------------------------------------------------------------------
;save return address on original stack
;-----------------------------------------------------------------------------

call_inst       label    near
        xchg    dword ptr [ecx + ctxEsp - ctxEsp], esp
        push    dword ptr [ecx + ctxEip - ctxEsp]
        xchg    dword ptr [ecx + ctxEsp - ctxEsp], esp

jump_inst       label   near
        mov     eax, dword ptr [ebp]
        mov     dword ptr [ecx + ctxEip - ctxEsp], eax
        xchg    ebx, eax
        ret

;-----------------------------------------------------------------------------
;call and jump indirect are a special case
;because we can't execute them directly
;-----------------------------------------------------------------------------

check_calljmp   label   near
        mov     ah, al
        mov     al, byte ptr [esi]
        and     al, 38h
        cmp     ax, ((0ffh - 0a0h) shl 8) + 20h
        je      jump_inst
        cmp     ax, ((0ffh - 0a0h) shl 8) + 10h
        je      call_inst

;-----------------------------------------------------------------------------
;everything else has modr/m byte replaced by absolute memory reference
;-----------------------------------------------------------------------------

        or      al, 5
        stos    byte ptr [edi]
        dec     ebx
        lods    byte ptr [esi]
        and     al, 0c7h
        mov     ah, al
        and     al, 7
        cmp     al, 4
        jne     skip_sib
        dec     ebx
        lods    byte ptr [esi]
        test    ah, 0c0h
        jne     skip_sib
        and     al, 7
        mov     ah, al

skip_sib        label   near
        cmp     ah, 5
        jne     skip_abs

inst_eax        label   near
        mov     ah, 80h

skip_abs        label   near
        add     eax, eax
        shr     ax, 1
        shr     eax, 0eh
        sub     ebx, eax
        add     esi, eax
        xchg    ebp, eax
        stos    dword ptr [edi]
        xchg    ebx, eax
        xchg    ecx, eax
        rep     movs byte ptr [edi], byte ptr [esi]
        xchg    ecx, eax
        mov     al, offset parse_xchg - offset rest_str

;-----------------------------------------------------------------------------
;set the busy flag to prevent re-entry
;and enable or disable the stack swapping
;this is because string instructions can cause additional faults
;but if the stack was the original value then the second context will overwrite the first one
;so it is necessary to not change the stack value (it's not needed by the instruction anyway)
;however, it must be possible to change the stack in other cases, to allow eg mov esp, [mem]
;-----------------------------------------------------------------------------

inst_str        label   near
        inc     byte ptr [edx + (offset busy_flag - offset restore_ctx) + 1]
        mov     byte ptr [edx + (offset jmp_stack1 - offset restore_ctx) + 2], ah
        mov     byte ptr [edx + (offset jmp_stack2 - offset restore_ctx) + 2], ah
        mov     byte ptr [edx + (offset jmp_rest - offset restore_ctx) + 2], al
        mov     al, 0ebh
        stos    byte ptr [edi]
        mov     eax, edx
        sub     eax, edi
        stos    byte ptr [edi]

;-----------------------------------------------------------------------------
;swap context, need to save only some registers
;-----------------------------------------------------------------------------

        pushfd
        push    dword ptr [ecx + ctxEFlags - ctxEsp]
        popfd

jmp_stack1      label   near
        jmp     xchg_stack1

xchg_stack1     label   near
        xchg    dword ptr [ecx + ctxEsp - ctxEsp], esp

skip_stack      label   near
        mov     edi, dword ptr [ecx + ctxEdi - ctxEsp]
        mov     esi, dword ptr [ecx + ctxEsi - ctxEsp]
        mov     ebx, dword ptr [ecx + ctxEbx - ctxEsp]
        xchg    dword ptr [ecx + ctxEdx - ctxEsp], edx
        mov     eax, dword ptr [ecx + ctxEax - ctxEsp]
        mov     ebp, dword ptr [ecx + ctxEbp - ctxEsp]
        xchg    dword ptr [ecx + ctxEcx - ctxEsp], ecx

;-----------------------------------------------------------------------------
;execute the instruction
;jump is appended to skip rest of buffer and reach restore_ctx
;-----------------------------------------------------------------------------

inst_buff       db      "BASLR - roy g biv"     ;must be exactly 11h bytes long

;-----------------------------------------------------------------------------
;swap context back
;-----------------------------------------------------------------------------

restore_ctx     label   near
        xchg    dword ptr [offset $], ecx

jmp_stack2      label   near
        jmp     xchg_stack2

xchg_stack2     label   near
        xchg    dword ptr [ecx + ctxEsp - ctxEsp], esp
        pushfd
        pop     dword ptr [ecx + ctxEFlags - ctxEsp]
        popfd
        mov     dword ptr [ecx + ctxEdi - ctxEsp], edi
        mov     dword ptr [ecx + ctxEsi - ctxEsp], esi
        mov     dword ptr [ecx + ctxEbx - ctxEsp], ebx
        xchg    dword ptr [ecx + ctxEdx - ctxEsp], edx
        mov     dword ptr [ecx + ctxEax - ctxEsp], eax
        mov     dword ptr [ecx + ctxEbp - ctxEsp], ebp
        dec     byte ptr [edx + (offset busy_flag - offset restore_ctx) + 1]

jmp_rest        label   near
        jmp     parse_xchg

;-----------------------------------------------------------------------------
;if we changed the registers for strings, then we must undo the changes
;-----------------------------------------------------------------------------

rest_str        label   near
        pop     eax
        sub     dword ptr [ecx + ctxEsi - ctxEsp], eax
        pop     eax
        sub     dword ptr [ecx + ctxEdi - ctxEsp], eax

parse_xchg      label   near
        mov     al, 1

parse_ret       label   near
        ret

skip_code       label   near
        pop     edi
        repe    cmps byte ptr [edi], byte ptr [esi]
        jne     parse_ret

;-----------------------------------------------------------------------------
;write enable the call
;-----------------------------------------------------------------------------

        push    eax
        push    esp
        push    PAGE_READWRITE  
        push    4
        push    esi
        call    VirtualProtect

;-----------------------------------------------------------------------------
;replace the call
;-----------------------------------------------------------------------------

        push    esi
        lods    dword ptr [esi]
        add     eax, esi
        mov     dword ptr [edi + (offset old_ki - offset new_ki) + 1], eax
        mov     eax, edi
        sub     eax, esi
        pop     esi
        mov     dword ptr [esi], eax
        pop     eax

;-----------------------------------------------------------------------------
;restore previous protection
;-----------------------------------------------------------------------------

        push    eax
        push    esp
        push    eax
        push    4
        push    esi
        call    VirtualProtect

;-----------------------------------------------------------------------------
;get some information about the PE header
;because we will make a local copy of the section table
;-----------------------------------------------------------------------------

        mov     eax, dword ptr fs:[tebProcessEnvironmentBlock]
        mov     eax, dword ptr [eax + pebImageBaseAddress]
        add     eax, dword ptr [eax + e_lfanew]
        movzx   ecx, byte ptr [eax + _IMAGE_NT_HEADERS.nthFileHeader.fhNumberOfSections]
        mov     byte ptr [edi + (offset host_num - offset new_ki) + 1], cl
        movzx   esi, word ptr [eax + _IMAGE_NT_HEADERS.nthFileHeader.fhSizeOfOptionalHeader]
        lea     esi, dword ptr [eax + esi + _IMAGE_NT_HEADERS.nthOptionalHeader]
        push    dword ptr [eax + ohImageBase]
        imul    ebp, ecx, size _IMAGE_SECTION_HEADER
        push    PAGE_EXECUTE_READWRITE
        push    MEM_COMMIT
        push    ebp
        push    0
        call    VirtualAlloc
        push    eax
        mov     ecx, ebp
        xchg    edi, eax
        rep     movs byte ptr [edi], byte ptr [esi]
        mov     dword ptr [eax + (offset host_sect - offset new_ki) + 1], edi
        pop     edi
        pop     esi

;-----------------------------------------------------------------------------
;convert from section attributes to memory protection value
;-----------------------------------------------------------------------------

alloc_sects     label   near
        movzx   eax, byte ptr [ebp + edi - 1]
        shr     al, 5
        call    skip_xlat
        db      0, PAGE_EXECUTE, PAGE_READONLY, PAGE_EXECUTE_READ, PAGE_READWRITE, PAGE_EXECUTE_READWRITE, PAGE_READWRITE, PAGE_EXECUTE_READWRITE

skip_xlat       label   near
        pop     ebx
        xlat    byte ptr [ebx]
        mov     ebx, dword ptr [ebp + edi + _IMAGE_SECTION_HEADER.shVirtualSize - size _IMAGE_SECTION_HEADER]
        push    esp                             ;VirtualProtect
        push    PAGE_NOACCESS                   ;VirtualProtect
        push    ebx                             ;VirtualProtect
        push    eax
        push    MEM_RESERVE

;-----------------------------------------------------------------------------
;enlarge by random amount to ensure non-sequential addresses
;-----------------------------------------------------------------------------

        rdtsc
        and     eax, 3000h                      ;from 0 to 12kb
        add     eax, ebx
        push    eax
        push    0
        call    VirtualAlloc
        lea     ecx, dword ptr [eax + ebx]
        mov     dword ptr [ebp + edi + _IMAGE_SECTION_HEADER.shVirtualSize - size _IMAGE_SECTION_HEADER], ecx
        xchg    dword ptr [ebp + edi + _IMAGE_SECTION_HEADER.shVirtualAddress - size _IMAGE_SECTION_HEADER], eax
        add     eax, esi
        mov     dword ptr [ebp + edi + _IMAGE_SECTION_HEADER.shName + 4 - size _IMAGE_SECTION_HEADER], eax
        push    eax
        add     eax, ebx
        mov     dword ptr [ebp + edi + _IMAGE_SECTION_HEADER.shName - size _IMAGE_SECTION_HEADER], eax

;-----------------------------------------------------------------------------
;unmap host pages - cannot be dumped anymore
;-----------------------------------------------------------------------------

        call    VirtualProtect
        sub     ebp, size _IMAGE_SECTION_HEADER
        jne     alloc_sects
        pop     eax
        ret
        db      "01/02/08"

include rgblde.asm

skip_apis       label   near
        pop     edi

;-----------------------------------------------------------------------------
;parse export table
;-----------------------------------------------------------------------------

        mov     esi, dword ptr [ebx + esi + IMAGE_DIRECTORY_ENTRY_EXPORT]
        lea     esi, dword ptr [ebx + esi + edAddressOfFunctions]
        lods    dword ptr [esi]                 ;Export Address Table RVA
        lea     edx, dword ptr [ebx + eax]
        lods    dword ptr [esi]                 ;Name Pointer Table RVA
        lea     ecx, dword ptr [ebx + eax]
        lods    dword ptr [esi]                 ;Ordinal Table RVA
        lea     ebp, dword ptr [ebx + eax]
        mov     esi, ecx

push_export     label   near
        push    ecx

get_export      label   near
        lods    dword ptr [esi]
        push    ebx
        add     ebx, eax                        ;Name Pointer VA
        or      eax, -1

crc_outer       label   near
        xor     al, byte ptr [ebx]
        push    8
        pop     ecx

crc_inner       label   near
        add     eax, eax
        jnb     crc_skip
        xor     eax, 4c11db7h                   ;use generator polymonial (see IEEE 802)

crc_skip        label   near
        loop    crc_inner
        sub     cl, byte ptr [ebx]              ;carry set if not zero
        inc     ebx                             ;carry not altered by inc
        jb      crc_outer
        pop     ebx
        cmp     dword ptr [edi], eax
        jne     get_export

;-----------------------------------------------------------------------------
;exports must be sorted alphabetically, otherwise GetProcAddress() would fail
;this allows to push addresses onto the stack, and the order is known
;-----------------------------------------------------------------------------

        pop     ecx
        mov     eax, esi
        sub     eax, ecx                        ;Name Pointer Table VA
        shr     eax, 1
        movzx   eax, word ptr [ebp + eax - 2]   ;get export ordinal
        mov     eax, dword ptr [eax * 4 + edx]  ;get export RVA
        add     eax, ebx
        push    eax
        scas    dword ptr [edi]
        cmp     dword ptr [edi], 0
        jne     push_export
        push    0
        mov     eax, esp
        push    1
        mov     ecx, esp
        push    PAGE_EXECUTE_READWRITE
        push    MEM_COMMIT
        push    ecx
        push    0
        push    eax
        push    -1
        call    dword ptr [eax + 0ch]
        pop     ecx
        pop     eax
        push    eax
        mov     cx, offset skip_apis - offset apis_end
        mov     esi, edi
        mov     edi, eax
ife (offset code_reloc - offset apis_end) and 0ffffff00h
        mov     al, offset code_reloc - offset apis_end
else
        mov     ax, offset code_reloc - offset apis_end
endif
        rep     movsb
        jmp     eax
baslr_end       label   near

.code
code_begin      label   near
        call    GetCommandLineW
        xor     edi, edi
        dec     di
        mov     ebp, dword ptr [eax]
        and     ebp, edi
        cmp     ebp, '"'                        ;Unicode-compatible compare
        je      skip_argv0
        push    ' '
        pop     ebp

skip_argv0      label   near
        push    eax
        call    CharNextW
        mov     ecx, dword ptr [eax]
        and     ecx, edi
        je      skip_argv1
        cmp     ecx, ebp
        jne     skip_argv0

find_argv1      label   near
        push    eax
        call    CharNextW
        mov     ecx, dword ptr [eax]
        and     ecx, edi
        cmp     ecx, ' '                        ;Unicode-compatible compare
        je      find_argv1

skip_argv1      label   near
        xor     edi, edi
        test    ecx, ecx
        je      print_usage
        push    edi
        push    edi
        push    OPEN_EXISTING
        push    edi
        push    edi
        push    GENERIC_READ or GENERIC_WRITE
        push    eax
        call    CreateFileW
        push    eax
        inc     eax
        je      print_usage
        dec     eax
        push    eax                             ;ReadFile
        mov     ecx, esp
        push    edi                             ;ReadFile
        push    esp                             ;ReadFile
        push    4                               ;ReadFile
        push    ecx                             ;ReadFile
        push    eax
        push    edi
        push    edi
        push    e_lfanew
        push    eax
        xchg    ebx, eax
        call    SetFilePointer
        call    ReadFile
        pop     esi
        enter   size _IMAGE_NT_HEADERS + size _IMAGE_SECTION_HEADER, 0
        mov     eax, esp
        push    edi                             ;WriteFile
        push    esp                             ;WriteFile
        push    size _IMAGE_NT_HEADERS          ;WriteFile
        push    eax                             ;WriteFile
        push    ebx                             ;WriteFile
        push    edi                             ;SetFilePointer
        push    edi                             ;SetFilePointer
        push    esi                             ;SetFilePointer
        push    ebx                             ;SetFilePointer
        push    edi                             ;ReadFile
        push    esp                             ;ReadFile
        push    size _IMAGE_NT_HEADERS          ;ReadFile
        push    eax                             ;ReadFile
        push    ebx                             ;ReadFile
        push    edi
        push    edi
        push    esi
        push    ebx
        call    SetFilePointer
        call    ReadFile
        movzx   eax, word ptr [ebp + _IMAGE_NT_HEADERS.nthFileHeader.fhNumberOfSections - (size _IMAGE_NT_HEADERS + size _IMAGE_SECTION_HEADER)]
        dec     eax
        imul    eax, eax, size _IMAGE_SECTION_HEADER
        movzx   ecx, word ptr [ebp + _IMAGE_NT_HEADERS.nthFileHeader.fhSizeOfOptionalHeader - (size _IMAGE_NT_HEADERS + size _IMAGE_SECTION_HEADER)]
        lea     eax, dword ptr [ecx + eax + _IMAGE_NT_HEADERS.nthOptionalHeader]
        add     eax, esi
        lea     ecx, dword ptr [ebp - size _IMAGE_SECTION_HEADER]
        mov     esi, offset baslr_end - offset baslr_begin
        push    edi                             ;WriteFile
        push    esp                             ;WriteFile
        push    size _IMAGE_SECTION_HEADER      ;WriteFile
        push    ecx                             ;WriteFile
        push    ebx                             ;WriteFile
        push    edi                             ;SetFilePointer
        push    edi                             ;SetFilePointer
        push    eax                             ;SetFilePointer
        push    ebx                             ;SetFilePointer
        push    edi                             ;ReadFile
        push    esp                             ;ReadFile
        push    size _IMAGE_SECTION_HEADER      ;ReadFile
        push    ecx                             ;ReadFile
        push    ebx                             ;ReadFile
        push    edi
        push    edi
        push    eax
        push    ebx
        call    SetFilePointer
        call    ReadFile
        push    edi                             ;WriteFile
        push    esp                             ;WriteFile
        push    esi                             ;WriteFile
        push    offset baslr_begin              ;WriteFile
        push    ebx                             ;WriteFile
        push    edi
        push    edi
        mov     eax, dword ptr [ebp + _IMAGE_SECTION_HEADER.shVirtualAddress - size _IMAGE_SECTION_HEADER]
        mov     edx, dword ptr [ebp + _IMAGE_SECTION_HEADER.shSizeOfRawData - size _IMAGE_SECTION_HEADER]
        lea     ecx, dword ptr [eax + edx]
        xchg    dword ptr [ebp + _IMAGE_NT_HEADERS.nthOptionalHeader.ohAddressOfEntryPoint - (size _IMAGE_NT_HEADERS + size _IMAGE_SECTION_HEADER)], ecx
        add     ecx, dword ptr [ebp + _IMAGE_NT_HEADERS.nthOptionalHeader.ohImageBasex - (size _IMAGE_NT_HEADERS + size _IMAGE_SECTION_HEADER)]
        mov     dword ptr [offset baslr_begin + 1], ecx
        mov     ecx, dword ptr [ebp + _IMAGE_SECTION_HEADER.shVirtualSize - size _IMAGE_SECTION_HEADER]
        inc     ecx
        loop    skip_raw
        mov     dword ptr [ebp + _IMAGE_SECTION_HEADER.shVirtualSize - size _IMAGE_SECTION_HEADER], edx
        mov     ecx, edx

skip_raw        label   near
        add     edx, dword ptr [ebp + _IMAGE_SECTION_HEADER.shPointerToRawData - size _IMAGE_SECTION_HEADER]
        push    edx
        push    ebx
        add     dword ptr [ebp + _IMAGE_SECTION_HEADER.shSizeOfRawData - size _IMAGE_SECTION_HEADER], esi
        add     esi, ecx
        mov     ecx, dword ptr [ebp + _IMAGE_NT_HEADERS.nthOptionalHeader.ohSectionAlignment - (size _IMAGE_NT_HEADERS + size _IMAGE_SECTION_HEADER)]
        lea     esi, dword ptr [esi + ecx - 1]
        neg     ecx
        and     esi, ecx
        mov     dword ptr [ebp + _IMAGE_SECTION_HEADER.shVirtualSize - size _IMAGE_SECTION_HEADER], esi
        add     eax, esi
        mov     dword ptr [ebp + _IMAGE_NT_HEADERS.nthOptionalHeader.ohSizeOfImage - (size _IMAGE_NT_HEADERS + size _IMAGE_SECTION_HEADER)], eax
        xor     eax, eax
        mov     dword ptr [ebp + _IMAGE_NT_HEADERS.nthOptionalHeader.ohCheckSum - (size _IMAGE_NT_HEADERS + size _IMAGE_SECTION_HEADER)], eax
        call    SetFilePointer
        call    WriteFile
        call    SetFilePointer
        call    WriteFile
        call    SetFilePointer
        call    WriteFile
        leave
        call    CloseHandle
        push    offset protect_e - offset protect
        pop     eax
        mov     ecx, offset protect
        jmp     print_msg

print_usage     label   near
        push    offset usage_e - offset usage
        pop     eax
        mov     ecx, offset usage

print_msg       label   near
        push    edi
        push    esp
        push    eax
        push    ecx
        push    -0ch
        call    WriteFile
        call    ExitProcess

protect         db      "protect okay!", 0ah
protect_e       label   near
usage           db      "usage: baslr <filename>", 0ah
usage_e         label   near
end             code_begin
