   RING0_VERSION           equ     1

   EV_RING0_BASE           equ     00000300h
   EV_RING0_CALL_IN_RING0  equ     EV_RING0_BASE+01h  ; i: EDI=nearproc,EDX=arg
