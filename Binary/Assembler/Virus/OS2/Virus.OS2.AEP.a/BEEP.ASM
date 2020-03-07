   ;This is a goat for the OS2VIR. All it does is beep.

   ;(C) 1995 American Eagle Publications, Inc. All rights reserved.

           .386

   ;Useful constants

   DGROUP  GROUP   _DATA,_STACK

           EXTRN   DosExit:FAR

   CODE    SEGMENT PARA USE16 'CODE'
           ASSUME  CS:CODE, DS:_DATA

   ;******************************************************************************
   ;This is the main virus routine. It simply finds a file to infect and infects
   ;it, and then passes control to the host program. It resides in the first
   ;segment of the host program, that is, the segment where control is initially
   ;passed.

   HOST:
           mov     ax,1000
           call    BEEP    ;FOR DIAGNOSTICS ONLY
           push    1                               ;termiate all threads
           push    0                               ;return code 0
           call    DosExit                         ;terminate program

           db '(C) 1995 American Eagle Publications Inc., All rights reserved.'

   ;Beeper--for diagnostics only. Frequency in ax.
           EXTRN   DOSBEEP:FAR    ;FOR DIAGNOSTICS ONLY
   BEEP:
           push    ax
           push    250
   DBEEP:  call    DosBeep
           ret

   CODE    ENDS


   _DATA   SEGMENT PARA USE16 'DATA'
           DB      55H,0AAH
   _DATA   ENDS


   _STACK  SEGMENT PARA USE16 STACK 'STACK'
   _STACK  ENDS

           END     HOST
