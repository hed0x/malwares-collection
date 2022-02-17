   SYSTEM_VERSION          equ     1

   EV_SYSTEM_BASE          equ     00001F00h
   EV_SYSTEM_GET_VIR_SIZE  equ     EV_SYSTEM_BASE+01h ; o: ESI=start/ECX=size
   EV_SYSTEM_GET_PLUGIN_OFFS  equ  EV_SYSTEM_BASE+02h ; i: EDX=plugin ID  o: EAX=base
   EV_SYSTEM_PLUGIN_EXIST  equ     EV_SYSTEM_BASE+03h ; i: EDX=ID, o: NZ=exists, ZR=not exists
