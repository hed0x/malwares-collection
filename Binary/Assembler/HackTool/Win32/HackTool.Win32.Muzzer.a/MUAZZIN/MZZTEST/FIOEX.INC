
; extended FileIO/Mapping library-code  4.xx  (c) 1998-99 Z0MBiE

; fopenEx  (EDX=fname,
;           ESI=*fi_struc)   : CF=1  EAX=errorcode   CF=0
; fcloseEx (ESI=*fi_struc)   : CF=1  EAX=errorcode   CF=0

FILE_BEGIN              equ     0
PAGE_READWRITE          equ     000000004h
;FILE_MAP_ALL_ACCESS     equ     0000F001Fh

fopenEx:                pusha

                        lea     eax, [esi].fi_fd
                        push    eax
                        push    edx
                        callW    FindFirstFileA
                        xchg    ecx, eax
                        call    fcheckerror
                        jc      __exit
                        push    ecx
                        callW    FindClose

                        mov     edx, [esp].pushad_edx
                        mov     ecx, fa_archive
                        call    fsetattr

                        mov     edx, [esp].pushad_edx
                        call    fopen
                        jc      __error
                        xchg    ebx, eax
                        mov     [esi].fi_filehandle, ebx

                        mov     eax, [esi].fi_fd.fd_size

                        add     eax, MAP_ADD_SIZE

                        cmp     eax, MIN_MAP_SIZE
                        jnb     __1
                        mov     eax, MIN_MAP_SIZE
__1:
                        mov     [esi].fi_maxmapsize, eax

                        push    0
                        push    eax
                        push    0
                        push    PAGE_READWRITE
                        push    0
                        push    ebx   ; [esi].fi_filehandle
                        callW    CreateFileMappingA

                        mov     [esi].fi_fmohandle, eax

                        call    fcheckerror
                        jc      __exit

                        push    0       ; file size, 0=map entire file
                        push    0       ; offs-lo
                        push    0       ; offs-hi
                        push    FILE_MAP_ALL_ACCESS
                        push    [esi].fi_fmohandle
                        callW    MapViewOfFile

                        mov     esi, [esp].pushad_esi
                        mov     [esi].fi_mapoffset, eax

                        call    fcheckerror

__exit:                 popa
                        ret

__error:                mov     [esp].pushad_eax, eax
                        jmp     __exit

fcloseEx:               pusha

                        push    [esi].fi_mapoffset
                        callW    UnmapViewOfFile
                        call    fcheckerror
                        jc      __exit

                        mov     ebx, [esi].fi_fmohandle
                        call    fclose ; close not a file but f.-m. object

                        mov     esi, [esp].pushad_esi
                        mov     ebx, [esi].fi_filehandle

                        mov     edx, [esi].fi_fd.fd_size
                        call    fseek
                        jc      __error

                        call    ftrunc
                        jc      __error

                        lea     eax, [esi].fi_fd.fd_time_lastwrite
                        push    eax
                        lea     eax, [esi].fi_fd.fd_time_lastaccess
                        push    eax
                        lea     eax, [esi].fi_fd.fd_time_creation
                        push    eax
                        push    ebx
                        callW    SetFileTime

                        call    fclose
                        jc      __error

                        lea     edx, [esi].fi_fd.fd_filename
                        mov     ecx, [esi].fi_fd.fd_fileattr
                        call    fsetattr

__exit:                 popa
                        ret

__error:                mov     [esp].pushad_eax, eax
                        jmp     __exit

