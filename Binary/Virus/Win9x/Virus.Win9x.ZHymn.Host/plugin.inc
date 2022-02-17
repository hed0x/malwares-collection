   ; ---------------------------------------------------------------------------

   include                 isdebug.inc

   ; ---------------------------------------------------------------------------

   plugin_struc            struc
   plugin_size             dd    ? ; plugin CODE size in bytes, 16-byte aligned
   plugin_version          dd    ? ; plugin version (1,2,...)
   plugin_id               dd    ? ; plugin ID == # of 1st plugin's event
   plugin_flags            dd    ? ; plugin flags. (see FL_PGN_xxx)
                           ends

   FL_PGN_DISABLED         equ     00000001h       ; =='TO BE REMOVED'

   FL_PGN_PERMUTABLE       equ     00000002h
   FL_PGN_NON_PERMUTABLE   equ     0               ; default

   FL_PGN_W9XR0            equ     00000004h
   FL_PGN_W32R3            equ     00000008h
   FL_PGN_CODE32           equ     FL_PGN_W9XR0+FL_PGN_W32R3

   FL_PGN_reserved4        equ     00000010h       ;
   FL_PGN_reserved5        equ     00000020h       ;
   FL_PGN_reserved6        equ     00000040h       ;
   FL_PGN_reserved7        equ     00000080h       ;
   FL_PGN_reserved8        equ     00000100h       ;
   FL_PGN_reserved9        equ     00000200h       ;
   FL_PGN_reserved10       equ     00000400h       ;
   FL_PGN_reserved11       equ     00000800h       ;
   FL_PGN_reserved12       equ     00001000h       ;
   FL_PGN_reserved13       equ     00002000h       ;
   FL_PGN_reserved14       equ     00004000h       ;
   FL_PGN_reserved15       equ     00008000h       ;
   ; other bits (16..31) are user-defined

   ; ---------------------------------------------------------------------------

   event                   macro   evxxx
                           mov     eax, _evbase_ shl 8 + evxxx
                           call    ebp
                           endm

   eventX                  macro   evxxx
                           push    ebp
                           mov     ebp, [ebp]
                           event   evxxx
                           pop     ebp
                           endm

   pusho                   macro   lbl
                           local   __tmp
                           call    __tmp
                           jmp     lbl
   __tmp:                  endm

   getofs                  macro   reg, lbl
                           call    $+5
                           pop     reg
                           sub     reg, $-1-lbl
                           endm

   IS_RING0                macro
                           mov     eax, cs
                           test    al, 11b
                           ; jz  ring0   -- w9x
                           ; jnz ring3   -- w9x, wNT
                           endm

   ; ---------------------------------------------------------------------------

   PLUGIN_START            macro   PLUGIN, F1,F2,F3,F4,F5,F6,F7,F8,F9

   include                 &PLUGIN&.INC

   _evbase_                equ     EV_&PLUGIN&_BASE

                           p586
                           model   flat
                           locals  __

   data                    segment dword public '.PLUGIN' use32
                           assume  cs:data, ds:data, ss:data, es:data

                           ; plugin_struc. see plugin.inc
   plugin_start:           dd      plugin_end-plugin_start
                           dd      &PLUGIN&_VERSION
                           dd      EV_&PLUGIN&_BASE

                           j       = 0
                           ifnb    <F1>
                           j       = j + FL_PGN_&F1
                           endif
                           ifnb    <F2>
                           j       = j + FL_PGN_&F2
                           endif
                           ifnb    <F3>
                           j       = j + FL_PGN_&F3
                           endif
                           ifnb    <F4>
                           j       = j + FL_PGN_&F4
                           endif
                           ifnb    <F5>
                           j       = j + FL_PGN_&F5
                           endif
                           ifnb    <F6>
                           j       = j + FL_PGN_&F6
                           endif
                           ifnb    <F7>
                           j       = j + FL_PGN_&F7
                           endif
                           ifnb    <F8>
                           j       = j + FL_PGN_&F8
                           endif
                           ifnb    <F9>
                           j       = j + FL_PGN_&F9
                           endif

                           dd      j

   ;                       jmp     handleevent

                           endm

   ; ---------------------------------------------------------------------------

   PLUGIN_END              macro

   ;                       align   16
                           i       =  $-plugin_start
                           j       = (i+15) and (not 15)
                           j       = j - i
                           if      j ne 0
                           db      j dup (0)
                           endif

   plugin_end:
   data                    ends
                           end     ; no entry point

                           endm

   ; ---------------------------------------------------------------------------

   hookevent               macro   event, lbl
                           cmp     ax, event and 0FFFFh
                           je      lbl
                           endm

   ; ---------------------------------------------------------------------------
