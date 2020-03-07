   IODAEMON_VERSION        equ     1

   EV_IODAEMON_BASE        equ     00003C00h
   EV_IODAEMON_GOT_EMAIL   equ     EV_IODAEMON_BASE+01h ; edx=email, ecx=len (w/o last 0)
   EV_IODAEMON_GOT_VXCW    equ     EV_IODAEMON_BASE+02h ; esi=data
