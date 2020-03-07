; /* ---------------------------------------------------
;   |                                                   |
;   |  >>> The(c)King1980 <<<                           |
;   |                                                   |
;   |  E-Mail   : TheKing1980@hotmail.com               |
;   |  Internet : http://www.geocities.com/Eureka/2675  |
;   |                                                   |
;    --------------------------------------------------- */

section .text

global main

main:
    MOV ecx,INFO
    CALL    Write

    POP eax
    POP eax
    CMP al,2
    JNZ Quit1

    POP ecx
    MOV ecx,[ecx]
argv0:
    INC ecx
    MOV al,[ecx]
    TEST    al,al
    JNZ argv0

    MOV edi,FName
argv1:
    INC ecx
    MOV al,[ecx]
    MOV [edi],al
    INC edi
    TEST    al,al
    JNZ argv1

    MOV ecx,TXT1
    CALL    Write
    MOV ecx,FName
    PUSH    ecx
    CALL    Write

    XOR edx,edx
    MOV eax,5
    POP ebx
    MOV ecx,2
    INT 80h
    TEST    eax,eax
    JS  Quit2
    MOV [FHND],eax

    XCHG    eax,ebx
    MOV eax,19
    XOR ecx,ecx
    MOV edx,2
    INT 80h
    MOV [FSize],eax

    PUSH    0
    PUSH    DWORD [FHND]
    PUSH    1
    PUSH    3
    PUSH    eax
    PUSH    0
    MOV eax,90
    MOV ebx,esp
    INT 80h
    ADD esp,24
    TEST    eax,eax
    JS  Quit3
    MOV [FMEM],eax

    CMP [eax],DWORD 464C457Fh
    JNZ Quit4

    MOV ebx,[eax + 28]
    ADD ebx,eax
    XOR ecx,ecx
    MOV cx,[eax + 44]
    XOR edx,edx
    MOV dx,[eax + 42]
NextPH:
    MOV [ebx + 24],DWORD 7
    ADD ebx,edx
    LOOP    NextPH

    MOV eax,91
    MOV ebx,[FMEM]
    MOV ecx,[FSize]
    INT 80h

    MOV eax,6
    MOV ebx,[FHND]
    INT 80h

    MOV ecx,TXT2

Quit:
    CALL    Write
    MOV eax,1
    MOV ebx,0
    INT 80h

Quit1:
    MOV ecx,ERR1
    JMP Quit

Quit2:
    MOV ecx,ERR2
    JMP Quit

Quit3:
    MOV ecx,ERR3
    JMP Quit

Quit4:
    MOV ecx,ERR4
    JMP Quit

Write:
    XOR edx,edx
    PUSH    ecx
WriteLoop:
    INC edx
    INC ecx
    MOV al,[ecx]
    TEST    al,al
    JNZ WriteLoop
    POP ecx
    MOV eax,4
    MOV ebx,1
    INT 80h
    RET

section .data

INFO    DB  'ELFWRSEC - Set PF_WRITE flag in all PH sections         >>> The(c)King1980 <<<',10,13,10,13,0
ERR1    DB  'Usage: elfwrsec <file>',10,13,10,13,0
ERR2    DB  ' ... Cannot open !',10,13,10,13,0
ERR3    DB  ' ... Cannot map file !',10,13,10,13,0
ERR4    DB  ' ... Not an executable ELF file !',10,13,10,13,0
TXT1    DB  'Input file : ',0
TXT2    DB  ' ... OK !',10,13,10,13,0

FHND    DD  0
FSize   DD  0
FMEM    DD  0

section .bss

FName   RESB    256
