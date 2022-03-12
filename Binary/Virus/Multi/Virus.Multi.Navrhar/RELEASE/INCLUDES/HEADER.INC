; compatibility module with new versions
ifndef PASS2
include globals.1
else
include globals.2
endif

; debug section (dos4gw only!) ......................
moddef       macro flagsZ
mdflags         dd   'IMOD'  ; independent module signature
        cmp    initialize, 0
        je     cont
        ret
cont:

             endm

debug_out macro text
          local ltext, skip
          push  esi eax
          lea   esi, ltext
          mov   eax, 'DOUT'
          int   57h
          pop   eax esi
          jmp   skip
ltext     db text, 0
skip:
          endm
kernel_out macro text
          local ltext, skip
          push  esi eax
          lea   esi, ltext[ebp]
          mov   eax, 'DOUT'
          int   57h
          pop   eax esi
          jmp   skip
ltext     db text, 0
skip:
          endm

debug_int macro int
          push  edx eax
          lea   edx, int
          mov   eax, 'DINT'
          int   57h
          pop   eax esi
          endm
debug_hex macro int
          push  edx eax
          lea   edx, int
          mov   eax, 'DHEX'
          int   57h
          pop   eax esi
          endm

INVOKE_BP macro
IFDEF DEBUG
          int 3
ENDIF
          endm
IFDEF DEBUG
marker       macro txt
             local obskoc
             int 3
             jmp   obskoc
             db txt
obskoc:
             endm
ELSE
marker       macro txt
             endm
ENDIF

RAISE_X      macro except_no
             push  eax
             mov   al, 1
             or    eax, eax
             pop   eax
             endm
