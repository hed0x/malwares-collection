   UTIL_VERSION            equ     1

   EV_UTIL_BASE            equ     00003300h
   EV_UTIL_GETWINDIR       equ     EV_UTIL_BASE+01h
   EV_UTIL_BSAVE           equ     EV_UTIL_BASE+02h
   EV_UTIL_BLOAD           equ     EV_UTIL_BASE+03h
   EV_UTIL_IS_W9X          equ     EV_UTIL_BASE+04h  ; jz win9x, jnz winnt
   EV_UTIL_GETTIME         equ     EV_UTIL_BASE+05h  ; eax=systime, [ms]
   EV_UTIL_BSAVE_EX        equ     EV_UTIL_BASE+06h
   EV_UTIL_BLOAD_EX        equ     EV_UTIL_BASE+07h
   EV_UTIL_GETSYSDIR       equ     EV_UTIL_BASE+08h

   ; BLOAD_EX/BSAVE_EX index in ESI (instead of filename) --> %windir%\n.SWP
   XFILE_1                 equ     1               ; fastname
   XFILE_2                 equ     2               ; dpgn
   XFILE_3                 equ     3               ; pgncont (container)
   XFILE_4                 equ     4               ;
