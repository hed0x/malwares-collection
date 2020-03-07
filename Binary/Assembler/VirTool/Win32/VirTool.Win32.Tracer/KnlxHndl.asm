;this is disassembly of system xHandler (kernel32.dll)

        PUSH    EBP
        MOV EBP,ESP
        SUB ESP,8
        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        PUSH    EBP
        CLD
        MOV EBX,DWORD PTR [EBP+0CH]    ; xFrame (exception_registration)
        MOV EAX,DWORD PTR [EBP+8]      ; EXCEPTION_REC_ptr
        TEST    DWORD PTR [EAX+4],6    ; EXCEPTION_RECORD.ExceptionFlags
        JNZ SHORT LOC_5
        MOV DWORD PTR [EBP-8],EAX
        MOV EAX,DWORD PTR [EBP+10H]    ; CONTEXT_ptr
        MOV DWORD PTR [EBP-4],EAX
        LEA EAX,DWORD PTR [EBP-8]
        MOV DWORD PTR [EBX-4],EAX
        MOV ESI,DWORD PTR [EBX+0CH]    ; xFrame.xScope
        MOV EDI,DWORD PTR [EBX+8]      ; xFrame.xTable
LOC_1:
        CMP ESI,0FFFFFFFFH         ; if xScope == -1 ; -1..end of xTables chain
        JE  SHORT LOC_4        ; goto Unhandled
        LEA ECX,[ESI][ESI*2]       ; size of xTable structure 12 bytes
        CMP DWORD PTR [EDI+4][ECX*4],0 ; if xTableArray[xScope].filter == 0  ;not present
        JE  SHORT LOC_2        ; goto next xTable_RECORD

        PUSH    ESI
        PUSH    EBP
        LEA EBP,DWORD PTR [EBX+10H]
        CALL    DWORD PTR [EDI+4][ECX*4]   ; call xTableArray[xScope].filter
            ; it will call UnhandledExceptionFilter and from that is called
                ; procedure ("top-level exception filter function") that was 
                ; specified as parameter of SetUnhandledExceptionFilter 
                ; (procedure should RETURN! - for authors of PECRYPT32)

        POP EBP
        POP ESI
        MOV EBX,DWORD PTR [EBP+0CH]    ; xFrame
        OR  EAX,EAX            ; return code is
        JZ  SHORT LOC_2        ; == 0 do next xTable_RECORD
        JS  SHORT LOC_3        ; <  0 do return (0)

        MOV EDI,DWORD PTR [EBX+8]      ; xFrame.xTable
        PUSH    EBX            ; xFrame
        CALL    XXXXX
        ADD ESP,4

        LEA EBP,DWORD PTR [EBX+10H]
        PUSH    ESI            ; xScope
        PUSH    EBX
        CALL    YYYYY
        ADD ESP,8

        LEA ECX,[ESI][ESI*2]
        MOV EAX,[EDI][ECX*4]
        MOV DWORD PTR [EBX+0CH],EAX    ; xScope = xTableArray[xScope].NextxScope
        CALL    DWORD PTR [EDI+8][ECX*4]   ; call xTableArray[xScope].handler
                           ; it will call ExitProcess or ExitThread

LOC_2:
        MOV EDI,DWORD PTR [EBX+8]      ; do next xTable_RECORD in xTableArray
        LEA ECX,[ESI][ESI*2]
        MOV ESI,[EDI][ECX*4]       ; esi = xTable.NextxScope
        JMP SHORT LOC_1
LOC_3:
        MOV EAX,0              ; Okay
        JMP SHORT LOC_6
LOC_4:
        MOV EAX,1              ; unhandled, do next xFrame
        JMP SHORT LOC_6
LOC_5:
        PUSH    EBP
        LEA EBP,DWORD PTR [EBX+10H]
        PUSH    0FFFFFFFFH         ; xScope
        PUSH    EBX
        CALL    YYYYY
        ADD ESP,8
        POP EBP
        MOV EAX,1              ; unhandled, do next xFrame
LOC_6:
        POP EBP
        POP EDI
        POP ESI
        POP EBX
        MOV ESP,EBP
        POP EBP
        RETN

