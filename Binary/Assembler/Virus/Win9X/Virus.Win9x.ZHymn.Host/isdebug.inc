   ; comment the following line to compile fully working version

   ;DEBUG                  equ     ?       ; used if defined

   IFDEF                   DEBUG
   EXT_EXE                 equ     'm0z.'
   EXT_DLL                 equ     'm0z.'
   EXT_VXD                 equ     'm0z.'
   EXT_SCR                 equ     'm0z.'
   ELSE
   EXT_EXE                 equ     'exe.'
   EXT_DLL                 equ     'lld.'
   EXT_VXD                 equ     'dxv.'
   EXT_SCR                 equ     'rcs.'
   ENDIF
