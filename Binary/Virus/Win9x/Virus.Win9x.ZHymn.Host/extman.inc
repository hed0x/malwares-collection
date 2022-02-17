   EXTMAN_VERSION          EQU     1

   EV_EXTMAN_BASE          equ     00000B00h
   EV_EXTMAN_GOT_FILENAME  equ     EV_EXTMAN_BASE+01h      ; [NODEBUG] i: edx=filename
   EV_EXTMAN_GOT_EXECEXT   equ     EV_EXTMAN_BASE+02h      ; i: edx=filename
   EV_EXTMAN_GOT_RAR       equ     EV_EXTMAN_BASE+03h      ; i: edx=filename
   EV_EXTMAN_GOT_ZIP       equ     EV_EXTMAN_BASE+04h      ; i: edx=filename
