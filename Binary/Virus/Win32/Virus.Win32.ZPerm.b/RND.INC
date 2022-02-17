   ; randomer

   rnd                     macro   n
   cmd
                           push    n
   cmd
                           call    my_rnd
   cmd
                           lea     esp, [esp+4]
   cmd
                           endm

   cmd
   my_rnd:                 mov     eax, randseed
   cmd
                           imul    eax, 214013
   cmd
                           add     eax, 2531011
   cmd
                           mov     randseed, eax
   cmd
                           shr     eax, 16
   cmd
                           imul    eax, [esp+4]
   cmd
                           shr     eax, 16
   cmd
                           test    eax, eax
   cmd
                           ret

   cmd
   randomize:              pusha
   cmd
                           call    xxGetTickCount
   cmd
                           xor     randseed, eax
   cmd
                           popa
   cmd
                           ret
   cmd
