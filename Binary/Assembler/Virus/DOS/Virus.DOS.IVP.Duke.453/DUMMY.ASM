   ;****************************************************************************
   ; Use this to infect and get an encrypted copy of your newly made virus.
   ; To compile use TASM Dummy.asm and Tlink /T Dummy.asm
   ;                                or TLINK Dummy.asm for an EXE file.
   ;****************************************************************************

           .model tiny
           .code
           org 100h

   start:
           mov     ah,9
           mov     dx,offset messege
           int     21h

           int     20h

           .data
   messege db      'Infected with an IVP created file',10,13
           db      'Curtesy of Admiral Bailey - Youngsters Against McAfee',10,13
           db      '$'

   filler  db      1 dup (90)

           ; change the number before the dup to change the size of the
           ; file.

           end     start
