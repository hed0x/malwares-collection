
; extended FileIO/Mapping library-header  4.xx  (c) 1998-99 Z0MBiE

MAP_ADD_SIZE            equ     262144  ; 256k   (add to file size)
MIN_MAP_SIZE            equ     131072  ; 128k   (minimal mapping size)

; mapping size = MAX( MIN_MAP_SIZE,  filesize+MAP_ADD_SIZE )

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

fi_struc                struc
fi_filehandle           dd      ?       ; handle of file
fi_fmohandle            dd      ?       ; handle of file-mapping object
fi_mapoffset            dd      ?       ; handle (offset) of mapping
fi_maxmapsize           dd      ?       ; max size of mapping
fi_fd                   fd_struc ?
                        ends

fa_readonly             equ     000000001h
fa_hidden               equ     000000002h
fa_system               equ     000000004h
fa_directory            equ     000000010h
fa_archive              equ     000000020h
fa_normal               equ     000000080h
fa_temporary            equ     000000100h
fa_atomic_write         equ     000000200h
fa_xaction_write        equ     000000400h

pushad_struc            struc
pushad_edi              dd      ?
pushad_esi              dd      ?
pushad_ebp              dd      ?
pushad_esp              dd      ?
pushad_ebx              dd      ?
pushad_edx              dd      ?
pushad_ecx              dd      ?
pushad_eax              dd      ?
                        ends
