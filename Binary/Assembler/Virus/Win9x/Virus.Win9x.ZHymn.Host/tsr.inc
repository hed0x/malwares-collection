   TSR_VERSION             equ     1

   EV_TSR_BASE             equ     00000400h
   EV_TSR_IN0_ONSTART      equ     EV_TSR_BASE+01h
   EV_TSR_IN0_ONEXIT       equ     EV_TSR_BASE+02h
   EV_TSR_ON_IFSCALL       equ     EV_TSR_BASE+03h ; [NODEBUG] i: ESI=@ifs_onstack_shit
   EV_TSR_BEFORE_RING0     equ     EV_TSR_BASE+04h
   EV_TSR_IN_NEW_ADDR      equ     EV_TSR_BASE+05h
   EV_TSR_IS_ALREDY        equ     EV_TSR_BASE+06h
