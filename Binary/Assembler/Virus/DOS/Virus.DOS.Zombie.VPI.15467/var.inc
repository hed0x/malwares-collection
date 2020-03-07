   ; - -[VAR.INC]- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8

   stamm:          db stamms_max_ip dup ('?')

   EA              db      ?
                   dw      ?
   my_seg2         dw      ?

   header          exe_struc ?

   buf             db      64 dup (?)
