                   .MODEL SMALL
                   .386p
                   .CODE

   PUBLIC          InitTurbo, HaltError, HaltTurbo

   EXTRN           _Consts:ABS

   InitTurbo:      PUSH SEG _Consts
                   POP DS
                   RETF
   HaltError:
   HaltTurbo:
                   MOV AH, 4CH
                   INT 21H

                   DW _Consts

                   END
