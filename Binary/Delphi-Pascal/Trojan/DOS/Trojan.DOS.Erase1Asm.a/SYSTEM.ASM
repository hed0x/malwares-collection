                   model   tiny
                   locals

   extrn           _main:FAR

   _TEXT           segment

                   org     100h

   start:          jmp     near ptr _main

                   ends

                   end     start
