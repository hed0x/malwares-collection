   REGSCAN_VERSION         equ     1

   EV_REGSCAN_BASE         equ     00003400h
   EV_REGSCAN_GO           equ     EV_REGSCAN_BASE+01h
   EV_REGSCAN_FOUND_AV_ENTRY equ   EV_REGSCAN_BASE+02h ; EBX=hKey, ECX=keyname, EDI=valuename, EDX=value
   EV_REGSCAN_GOT_FILENAME equ     EV_REGSCAN_BASE+03h ; --//-- (EDX=filename)
