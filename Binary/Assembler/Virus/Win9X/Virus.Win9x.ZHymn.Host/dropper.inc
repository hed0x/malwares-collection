   DROPPER_INSERT_XUI      equ     <word ptr [100h+pe_subsystem]>

   DROPPER_VERSION         equ     1

   EV_DROPPER_BASE         equ     00002400h
   EV_DROPPER_INIT         equ     EV_DROPPER_BASE+01h
   EV_DROPPER_DONE         equ     EV_DROPPER_BASE+02h
   EV_DROPPER_START_ARC    equ     EV_DROPPER_BASE+03h
   EV_DROPPER_START_MAIN   equ     EV_DROPPER_BASE+04h
