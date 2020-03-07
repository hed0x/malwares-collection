   VxDcall                 macro   VxD, Service
                           db      0CDh
                           db      020h
                           dw      Service
                           dw      VxD
                           endm

   VMMcall                 macro   Service
                           VxDcall VMM, Service
                           endm

   pusho                   macro   lbl
                           local   __tmp
                           call    __tmp
                           jmp     lbl
   __tmp:                  endm

   getofs                  macro   reg, lab
                           call    $+5
                           pop     reg
                           sub     reg, $-1-offset lab
                           endm
