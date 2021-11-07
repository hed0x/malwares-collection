   IFSCALL_VERSION         equ     1

   EV_IFSCALL_BASE         equ     00000500h
   ; [NODEBUG]
   EV_IFSCALL_GOT_FILENAME equ     EV_IFSCALL_BASE+01h ; i: edx=filename
