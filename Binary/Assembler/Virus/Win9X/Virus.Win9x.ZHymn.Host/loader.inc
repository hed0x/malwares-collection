   LOADER_VERSION          equ     1

   EV_LOADER_BASE          equ     00000100h
   EV_LOADER_SOMETHING     equ     EV_LOADER_BASE+01h

   SKIPLOADER              macro
                           lea     esp, [esp+8]
                           endm
