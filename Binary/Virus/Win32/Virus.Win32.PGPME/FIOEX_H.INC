
; ---------------------------------------------------------------------------

MAP_ADD_SIZE            equ     262144  ; 256k   (add to file size)
MIN_MAP_SIZE            equ     131072  ; 128k   (minimal mapping size)

; mapping size = MAX( MIN_MAP_SIZE,  filesize+MAP_ADD_SIZE )

; ---------------------------------------------------------------------------

PAGE_READWRITE          equ     000000004h
FILE_MAP_ALL_ACCESS     equ     0000F001Fh

; ---------------------------------------------------------------------------

fd_struc                struc
fd_fileattr             dd      ?       ; (*) may be modified
fd_time_creation        dq      ?       ; (*) may be modified
fd_time_lastaccess      dq      ?       ; (*) may be modified
fd_time_lastwrite       dq      ?       ; (*) may be modified
fd_size_hi              dd      ?
fd_size                 dd      ?       ; (*) may be modified
                        dd      ?,?
fd_filename             db      260 dup (?)
fd_shortname            db      14 dup (?)
                        ends

; ---------------------------------------------------------------------------

fi_struc                struc
fi_filehandle           dd      ?       ; handle of file
fi_fmohandle            dd      ?       ; handle of file-mapping object
fi_mapoffset            dd      ?       ; handle (offset) of mapping
fi_maxmapsize           dd      ?       ; max size of mapping
fi_fd                   fd_struc ?
                        ends

; ---------------------------------------------------------------------------

