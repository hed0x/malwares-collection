; RAR file generator, isn't used in this release
; #########################################################################

.data

ArchiveHeader struct
        HEAD_CRC        WORD    ?       ; CRC of fields HEAD_TYPE to RESERVED2
        HEAD_TYPE       BYTE    ?       ; Header type: 0x73
        HEAD_FLAGS      WORD    ?       ; Bit flags
        HEAD_SIZE       WORD    ?       ; Archive header total size including archive comments
        RESERVED1       WORD    ?       ; Reserved
        RESERVED2       DWORD   ?       ; Reserved
ArchiveHeader ends

FileHeader struct
        HEAD_CRC        WORD    ?       ; CRC of fields from HEAD_TYPE to FILEATTR
        HEAD_TYPE       BYTE    ?       ; Header type: 0x74
        HEAD_FLAGS      WORD    ?       ; Bit flags: 0x04 - file encrypted with password
        HEAD_SIZE       WORD    ?       ; File header full size including file name and comments
        PACK_SIZE       DWORD   ?       ; Compressed file size
        UNP_SIZE        DWORD   ?       ; Uncompressed file size
        HOST_OS         BYTE    ?       ; Operating system used for archiving
        FILE_CRC        DWORD   ?       ; File CRC
        FTIME           DWORD   ?       ; Date and time in standard MS DOS format
        UNP_VER         BYTE    ?       ; RAR version needed to extract file
        METHOD          BYTE    ?       ; Packing method
        NAME_SIZE       WORD    ?       ; File name size
        ATTR            DWORD   ?       ; File attributes
FileHeader ends

HEAD_MARKER             equ     072h    ; Marker block
HEAD_ARCHIVE            equ     073h    ; Archive header
HEAD_FILE               equ     074h    ; File header
HEAD_COMNT              equ     075h    ; Comment header
HEAD_EXTRA              equ     076h    ; Extra information
HEAD_SUBBLOCK           equ     077h    ; Subblock
HEAD_RECOVERY           equ     078h    ; Recovery record

        NROUNDS                 equ     32

        InitSubstTable          db      215, 19,149, 35, 73,197,192,205,249, 28, 16,119, 48,221,  2, 42
                                db      232,  1,177,233, 14, 88,219, 25,223,195,244, 90, 87,239,153,137
                                db      255,199,147, 70, 92, 66,246, 13,216, 40, 62, 29,217,230, 86,  6
                                db      71, 24,171,196,101,113,218,123, 93, 91,163,178,202, 67, 44,235
                                db      107,250, 75,234, 49,167,125,211, 83,114,157,144, 32,193,143, 36
                                db      158,124,247,187, 89,214,141, 47,121,228, 61,130,213,194,174,251
                                db      97,110, 54,229,115, 57,152, 94,105,243,212, 55,209,245, 63, 11
                                db      164,200, 31,156, 81,176,227, 21, 76, 99,139,188,127, 17,248, 51
                                db      207,120,189,210,  8,226, 41, 72,183,203,135,165,166, 60, 98,  7
                                db      122, 38,155,170, 69,172,252,238, 39,134, 59,128,236, 27,240, 80
                                db      131,  3, 85,206,145, 79,154,142,159,220,201,133, 74, 64, 20,129
                                db      224,185,138,103,173,182, 43, 34,254, 82,198,151,231,180, 58, 10
                                db      118, 26,102, 12, 50,132, 22,191,136,111,162,179, 45,  4,148,108
                                db      161, 56, 78,126,242,222, 15,175,146, 23, 33,241,181,190, 77,225
                                db        0, 46,169,186, 68, 95,237, 65, 53,208,253,168,  9, 18,100, 52
                                db      116,184,160, 96,109, 37, 30,106,140,104,150,  5,204,117,112, 84

        MarkHeader              db      052h, 061h, 072h, 021h, 01ah, 007h, 000h ; Original RAR header

.data?
        SubstTable              db      256 dup(?)
        PN1                     db      ?
        PN2                     db      ?
        PN3                     db      ?
        OldKey0                 dw      ?
        OldKey1                 dw      ?
        OldKey2                 dw      ?
        OldKey3                 dw      ?
        Key0                    dd      ?
        Key1                    dd      ?
        Key2                    dd      ?
        Key3                    dd      ?

.code

substLong proc uses ebx t: DWORD
        mov     ebx, t
        xor     eax, eax
        mov     edx, ebx
        and     edx, 0ffh
        shr     ebx, 8
        mov     al, byte ptr[SubstTable+edx]
        mov     edx, ebx
        and     edx, 0ffh
        shr     ebx, 8
        mov     ah, byte ptr[SubstTable+edx]
        mov     edx, ebx
        and     edx, 0ffh
        shr     ebx, 8
        movzx   edx, byte ptr[SubstTable+edx]
        shl     edx, 16
        or      eax, edx
        mov     edx, ebx
        and     edx, 0ffh
        movzx   edx, byte ptr[SubstTable+edx]
        shl     edx, 24
        or      eax, edx
        ret
substLong endp

UpdKeys proc Buf: DWORD
        mov     ecx, 4
        mov     edx, Buf
@l:
        movzx   eax, byte ptr[edx]
        mov     eax, dword ptr[CRCTable+eax*4]
        xor     Key0, eax
        movzx   eax, byte ptr[edx+1]
        mov     eax, dword ptr[CRCTable+eax*4]
        xor     Key1, eax
        movzx   eax, byte ptr[edx+2]
        mov     eax, dword ptr[CRCTable+eax*4]
        xor     Key2, eax
        movzx   eax, byte ptr[edx+3]
        mov     eax, dword ptr[CRCTable+eax*4]
        xor     Key3, eax
        add     edx, 4
        loop    @l
        ret
UpdKeys endp

EncryptBlock proc uses esi Buf: DWORD
        LOCAL   A, B, C1, D, T, TA, TB: DWORD

        mov     esi, Buf
        m2m     A, dword ptr[esi]
        mov     eax, Key0
        xor     A, eax
        m2m     B, dword ptr[esi+4]
        mov     eax, Key1
        xor     B, eax
        m2m     C1, dword ptr[esi+8]
        mov     eax, Key2
        xor     C1, eax
        m2m     D, dword ptr[esi+12]
        mov     eax, Key3
        xor     D, eax

        xor     ecx, ecx
@l:
        ; T=((C+rol(D,11))^Key[I&3]);
        mov     eax, D
        rol     eax, 11
        add     eax, C1
        mov     edx, ecx
        and     edx, 3
        xor     eax, dword ptr[Key0+edx*4]
        mov     T, eax

        ; TA=A^substLong(T);
        invoke  substLong, T
        xor     eax, A
        mov     TA, eax

        ; T=((D^rol(C,17))+Key[I&3]);
        mov     eax, C1
        rol     eax, 17
        xor     eax, D
        mov     edx, ecx
        and     edx, 3
        add     eax, dword ptr[Key0+edx*4]                    
        mov     T, eax

        ; TB=B^substLong(T);
        invoke  substLong, T
        xor     eax, B
        mov     TB, eax

        m2m     A, C1
        m2m     B, D
        m2m     C1, TA
        m2m     D, TB

        inc     ecx
        cmp     ecx, NROUNDS
        jl      @l

        mov     eax, C1
        xor     eax, Key0
        mov     dword ptr[esi], eax
        mov     eax, D
        xor     eax, Key1
        mov     dword ptr[esi+4], eax
        mov     eax, A
        xor     eax, Key2
        mov     dword ptr[esi+8], eax
        mov     eax, B
        xor     eax, Key3
        mov     dword ptr[esi+12], eax

        invoke  UpdKeys, Buf
        ret
EncryptBlock endp

SetOldKeys proc szPassword: DWORD
        LOCAL   Ch1: BYTE

        invoke  lstrlen, szPassword
        invoke  CRC32UpdateRar, 0ffffffffh, szPassword, eax

        mov     OldKey0, ax
        shr     eax, 16
        mov     OldKey1, ax
        mov     OldKey2, 0
        mov     OldKey3, 0
        mov     PN1, 0
        mov     PN2, 0
        mov     PN3, 0

        mov     edx, szPassword

@l:
        movzx   eax, byte ptr[edx]
        add     PN1, al
        xor     PN2, al
        add     PN3, al
        rol     PN3, 1

        mov     ecx, dword ptr[CRCTable+eax*4]
        xor     ecx, eax
        xor     OldKey2, cx 

        mov     ecx, dword ptr[CRCTable+eax*4]
        shr     ecx, 16
        add     ecx, eax
        add     OldKey3, cx 

        inc     edx
        cmp     byte ptr[edx], 0
        jnz     @l

        ret
SetOldKeys endp

SetCryptKeys proc uses esi edi ebx szPassword: DWORD
        LOCAL   Psw[256]: BYTE
        LOCAL   N1: BYTE
        LOCAL   N2: BYTE
        LOCAL   I, J, K, PswLength: DWORD

        invoke  SetOldKeys, szPassword

        mov     Key0, 0D3A3B879h
        mov     Key1, 03F6D12F7h
        mov     Key2, 07515A235h
        mov     Key3, 0A4E7F123h

        invoke  ZeroMemory, addr Psw, 256
        invoke  lstrcpy, addr Psw, szPassword
        invoke  lstrlen, szPassword
        mov     PswLength, eax

        mov     esi, offset InitSubstTable
        mov     edi, offset SubstTable
        mov     ecx, 256
        rep movsb

        mov     J, 0
        .WHILE  J < 256
                mov     I, 0

        @fori:
                lea     eax, Psw
                mov     ecx, I
                inc     ecx
                movzx   eax, byte ptr[eax+ecx]
                add     eax, J
                and     eax, 0ffh
                mov     eax, dword ptr[CRCTable+eax*4]
                mov     N2, al

                lea     eax, Psw
                mov     ecx, I
                movzx   eax, byte ptr[eax+ecx]
                sub     eax, J
                and     eax, 0ffh
                mov     eax, dword ptr[CRCTable+eax*4]
                mov     N1, al

                mov     K, 1
                .WHILE  TRUE
                        mov     cl, N1
                        .IF     cl == N2
                                .BREAK
                        .ENDIF

                        movzx   eax, N1
                        add     eax, offset SubstTable
                        mov     bl, byte ptr[eax]
                        movzx   edx, N1
                        add     edx, I
                        add     edx, K
                        and     edx, 0ffh
                        add     edx, offset SubstTable
                        mov     cl, [edx]
                        mov     byte ptr[eax], cl
                        mov     byte ptr[edx], bl

                        inc     N1
                        inc     K
                .ENDW

                add     I, 2
                mov     eax, PswLength
                cmp     I, eax
                jl      @fori

                inc     J
        .ENDW

        lea     ebx, Psw
        mov     I, 0
@l:
        invoke  EncryptBlock, ebx
        add     ebx, 16
        add     I, 16
        mov     eax, I
        cmp     eax, PswLength
        jl      @l
      
        ret
SetCryptKeys endp

RarCloak proc begin_offs, len, zfile: DWORD
        LOCAL   bTemp[16]: BYTE
        LOCAL   bRead: DWORD

        .IF     !len
                ret
        .ENDIF

        invoke  SetFilePointer, zfile, begin_offs, NULL, FILE_BEGIN

@l:
        invoke  SetFilePointer, zfile, 0, NULL, FILE_CURRENT
        push    eax
        invoke  ReadFile, zfile, addr bTemp, 16, addr bRead, NULL
        invoke  EncryptBlock, addr bTemp
        pop     eax
        invoke  SetFilePointer, zfile, eax, NULL, FILE_BEGIN
        invoke  WriteFile, zfile, addr bTemp, 16, addr bRead, NULL
        sub     len, 16
        jnz     @l

        ret
RarCloak endp

; Archive type: store only; szPassword can be NULL
CreateRarFile proc uses ebx InFile, OutFile, StoreAs, szPassword: DWORD
        LOCAL   hFileIn, hFileOut, buf, dwWritten, bRead: DWORD
        LOCAL   a_hdr: ArchiveHeader
        LOCAL   f_hdr: FileHeader
        LOCAL   storeas_len: DWORD
        LOCAL   f_date: WORD
        LOCAL   f_time: WORD
        LOCAL   crypt_offset: DWORD
        LOCAL   crypt_allign: DWORD

        xor     ebx, ebx
        invoke  GlobalAlloc, GMEM_FIXED, 8192
        mov     buf, eax

        invoke  CreateFile, InFile, GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL
        mov     hFileIn, eax
        inc     eax
        jz      @cra_ret

        invoke  CreateFile, OutFile, GENERIC_WRITE or GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, CREATE_ALWAYS, 0, NULL
        mov     hFileOut, eax
        inc     eax
        jz      @cra_ret

        invoke  lstrlen, StoreAs
        mov     storeas_len, eax

        invoke  WriteFile, hFileOut, offset MarkHeader, 7, addr dwWritten, NULL

        invoke  ZeroMemory, addr a_hdr, sizeof ArchiveHeader
        invoke  ZeroMemory, addr f_hdr, sizeof FileHeader
        mov     a_hdr.HEAD_TYPE, HEAD_ARCHIVE
        mov     a_hdr.HEAD_SIZE, sizeof ArchiveHeader
        invoke  CRC32Update, 0, addr a_hdr.HEAD_TYPE, sizeof ArchiveHeader - 2
        mov     a_hdr.HEAD_CRC, ax
        invoke  WriteFile, hFileOut, addr a_hdr, sizeof ArchiveHeader, addr dwWritten, NULL

        mov     f_hdr.HEAD_TYPE, HEAD_FILE
        mov     f_hdr.HEAD_SIZE, sizeof FileHeader
        mov     eax, storeas_len
        add     f_hdr.HEAD_SIZE, ax
        mov     f_hdr.NAME_SIZE, ax

        invoke  GetFileSize, hFileIn, NULL
        mov     f_hdr.PACK_SIZE, eax
        mov     f_hdr.UNP_SIZE, eax
        mov     f_hdr.HEAD_FLAGS, 8040h

        .IF     szPassword
                or      f_hdr.HEAD_FLAGS, 04h
                ; 16 byte aligned (TODO: div->and)
                mov     ecx, 16
                xor     edx, edx
                div     ecx
                sub     ecx, edx
                add     f_hdr.PACK_SIZE, ecx
                mov     crypt_allign, ecx
        .ENDIF

        mov     f_hdr.HOST_OS, 2        ; Win32
        invoke  CRC32File, hFileIn
        mov     f_hdr.FILE_CRC, eax

        mov     f_hdr.UNP_VER, 14h
        mov     f_hdr.METHOD, 30h   ; Store only
        mov     f_hdr.ATTR, 20h

        invoke  ZipFilePutTime, addr f_time, addr f_date
        movzx   eax, f_date
        shl     eax, 16
        or      ax, f_time
        mov     f_hdr.FTIME, eax

        invoke  CRC32Update, 0, addr f_hdr.HEAD_TYPE, sizeof FileHeader - 2
        invoke  CRC32Update, eax, StoreAs, storeas_len
        mov     f_hdr.HEAD_CRC, ax

        invoke  WriteFile, hFileOut, addr f_hdr, sizeof FileHeader, addr dwWritten, NULL
        invoke  WriteFile, hFileOut, StoreAs, storeas_len, addr dwWritten, NULL
        invoke  SetFilePointer, hFileOut, 0, NULL, FILE_CURRENT
        mov     crypt_offset, eax

@l:
        invoke  ReadFile, hFileIn, buf, 8192, addr bRead, NULL
        .IF     bRead
                invoke  WriteFile, hFileOut, buf, bRead, addr dwWritten, NULL
                jmp     @l
        .ENDIF

        .IF     szPassword
                invoke  SetCryptKeys, szPassword
                invoke  WriteFile, hFileOut, buf, crypt_allign, addr dwWritten, NULL
                invoke  RarCloak, crypt_offset, f_hdr.PACK_SIZE, hFileOut
        .ENDIF

        invoke  CloseHandle, hFileIn
        invoke  CloseHandle, hFileOut
        inc     ebx

@cra_ret:
        invoke  GlobalFree, buf
        mov     eax, ebx
        ret
CreateRarFile endp
