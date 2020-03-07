   ; ER1,R2,R3,R3_L or R3_H ?
   ;ER1-EAX,ECX,EDX,EBX,(esp),EBP,ESI,EDI ->> 0,1,2,3,(4),5,6,7
   ;R2-AX,CX,DX,BX,(sp),BP,SI,DI          ->> 0,1,2,3,(4),5,6,7
   ;R3   ax,cx,dx,bx ->> 0,1,2,3
   ;R3_ -AL,CL,DL,BL,AH,CH,DH,BH  ->> 0,1,2,3,4,5,6,7
   ; ER1<>R2
   ; R3_ <>ER1 and  R3_<> R2

   ; R3_ -AL,BL,CL,DL,AH,BH,CH,DH
   ; R4_ -AL,BL,CL,DL,AH,BH,CH,DH
   ; R2-AX,BX,CX,BP,DX,DI,SI
   rEAX EQU 0
   rECX EQU 1
   rEDX EQU 2
   rEBX EQU 3
   rESP EQU 4
   rEBP EQU 5
   rESI EQU 6
   rEDI EQU 7
   rAX EQU 0
   rCX EQU 1
   rDX EQU 2
   rBX EQU 3
   rSP EQU 4
   rBP EQU 5
   rSI EQU 6
   rDI EQU 7
   rAL EQU  0
   _rCL EQU  1
   rDL EQU  2
   rBL EQU  3
   rAH EQU  4
   rCH EQU  5
   rDH EQU  6
   rBH EQU  7
