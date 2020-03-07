   ADDPGN_VERSION          equ     1

   EV_ADDPGN_BASE          equ     00001500h
   EV_ADDPGN_ADD_PGN_FILE  equ     EV_ADDPGN_BASE+01h  ; i: EDX=fname
   EV_ADDPGN_ADD_PGN_BUF   equ     EV_ADDPGN_BASE+02h  ; i: ESI=buf, ECX=size
