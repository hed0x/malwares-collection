;Graphic effect of Happy99, by Spanska
;A cute fireworks animation, done using a particle algorithm stolen from 
;a beautiful 256 bytes demo by Picard/Hydrogen
;
;if you want to understand comments, learn french or use Altavista ;)
;at the very end, you can post a message for me in alt.comp.virus

;--------------------------- (c) Spanska 1999 ---------------------------------

.386
.model flat

extrn       GetModuleHandleA    :PROC
extrn       RegisterClassA      :PROC
extrn       CreateWindowExA     :PROC
extrn       ShowWindow      :PROC
extrn       UpdateWindow        :PROC
extrn       PeekMessageA        :PROC
extrn       SetPixelV       :PROC
extrn       TranslateMessage    :PROC
extrn       DispatchMessageA    :PROC
extrn       DefWindowProcA      :PROC
extrn       LocalAlloc      :PROC
extrn       LocalFree       :PROC
extrn       GetDC           :PROC
extrn       ReleaseDC       :PROC
extrn       PostQuitMessage     :PROC
extrn       ExitProcess     :PROC

nombre_explosion_maxi equ 16

.data

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
    
nb_explosions   dd 0
compteur    dd 0
color       dd ?
yy      dd ?
xx      dd ?
seed        dd 0FFAABB11h
theDC       dd ?
writebuffer dd ?
nom_fenetre     db "Happy 2000 to 29A readers !!",0
handle      dd ?
handle_wd   dd ?
adresse_retour dd ?

.code

HOST:

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

push 0
push handle
push 0
push 0
push 512            ;hauteur
push 256            ;largeur
push 100            ;y
push 100            ;x
push 00080000h+00040000h
push offset nom_fenetre
push offset nom_fenetre
push 0              ;extra style
call CreateWindowExA
mov handle_wd, eax

push 1
push handle_wd
call ShowWindow

push handle_wd
call UpdateWindow

;----- le message loop

msg_loop:
push 1
push 0
push 0
push 0
push offset msg
call PeekMessageA
cmp eax, 0
jnz process_messages

;-------- dessiner tous les points

mov eax, compteur
and eax, nombre_explosion_maxi-1
mov compteur, eax
cmp eax, 0
jz ini_explosion

la_suite:
push handle_wd
call GetDC
mov theDC, eax

mov ecx, 16*256             ;16 explosions of 256 pixels each
mov esi, writebuffer

zozo2:

mov eax, dword ptr [esi+8]          ;get Y coordinate
mov dword ptr [esi+20], eax         ;save it in a unused zone
mov eax, dword ptr [esi+12]         ;get X coordinate
mov dword ptr [esi+24], eax         ;save it in unused zone

add dword ptr [esi], 001000h            ;gravity: add 0.1 pixel to Y speed
lodsd                       ;load Y speed
add dword ptr [esi+4], eax          ;add Y speed to Y coordinate 
lodsd                       ;load X speed
add dword ptr [esi+4], eax          ;add X speed to X coordinate

lodsd                       ;load Y coordinate
sar eax, 16                 ;remove decimal part
mov edx, eax                    ;save in edx
lodsd                       ;load X coordinate
sar eax, 16                 ;remove decimal part
mov ebx, eax                    ;save in ebx

lodsd                       ;load color
cmp eax, 0                  ;color=0?
jne point_pas_noir              ;no: decrease color intensity
add esi, 8                  ;yes: go to next pixel
jmp fin_loop

point_pas_noir:
sub byte ptr [esi-4], 1             ;decrease Red component of color
jnc R_pas_a_zero                ;if positive, go to next component
mov byte ptr [esi-4], 0             ;if negative, put 0
R_pas_a_zero:
sub byte ptr [esi-3], 1             ;decrease Green component of color
jnc G_pas_a_zero                ;if positive, go to next component
mov byte ptr [esi-3], 0             ;if negative, put 0
G_pas_a_zero:
sub byte ptr [esi-2], 1             ;decrease Blue component of color
jnc B_pas_a_zero                ;if positive, go to next component
mov byte ptr [esi-2], 0             ;if negative, put 0
B_pas_a_zero:

push esi        ;be careful, this API fucks esi, ecx
push ecx

push eax        ;colorref
push edx        ;y
push ebx        ;x
push theDC      ;the Device Context
call SetPixelV      ;quand la fenetre est repeinte, on met le pixel à sa coordonnée

pop ecx
pop esi

lodsd           ;get the precedent Y coord from unused zone where we saved it
sar eax, 16     ;remove decimal part
mov edx, eax        ;put in edx
lodsd           ;get the precedent X coord from unused zone where we saved it
sar eax, 16     ;remove decimal part

push esi        ;be careful, this API fucks esi, ecx
push ecx

push 0          ;black
push edx
push eax
push theDC
call SetPixelV      ;remove pixel from precedent position

pop ecx
pop esi

fin_loop:
add esi, 4      ;esi points to next pixel structure

dec ecx
jnz zozo2

push theDC
push handle_wd
call ReleaseDC

inc compteur

jmp msg_loop

;----- pour voir si la fenetre est fermée

process_messages:

cmp msMESSAGE, 12h  ;WM_QUIT equ 0012h
je end_loop

push offset msg
call TranslateMessage
push offset msg
call DispatchMessageA
jmp msg_loop

end_loop:

push writebuffer
call LocalFree

push    msWPARAM
call    ExitProcess             ;this terminates the program

;----- procédure de fenêtre vide pour accélérer

wndproc:

pop eax
mov adresse_retour, eax
cmp dword ptr [esp+4], 2
jne suite

push 0
call PostQuitMessage
xor eax, eax
jmp suite2

suite:
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
shl eax, 13             ;chaque explosion se garde un buffer de 8192
mov edi, writebuffer            ;(256 pixels, 32 bits par pixel)
add edi, eax
mov ecx, 256                ;on va calculer les 256 points

call random
shr eax, 7              ;X: 0FFFFFFFFh/128 = 1FFFFFF
mov xx, eax             ;virgule fixe: 1FF,FFFF = 512
call random
shr eax, 8              ;Y: 0FFFFFFFFh/256 = FFFFFF
mov yy, eax             ;virgule fixe: FF,FFFF = 256

call random
shr eax, 8              ;COULEUR: codee sur 3 octets
or eax, 0AF0F0Fh            ;masque pour augmenter la luminosite
mov color, eax

zozo:
call random
shr eax, 15             ;VITESSE: 0FFFFFFFFh/32768 = 1FFFF 
mov [edi], eax              ;virgule fixe: 1,FFFF = entre 1 et 2
mov [edi+4], ecx            ;ANGLE: en radians, ecx presque random

fild dword ptr [edi+4]          ;charge l'angle dans le copro
fsin                    ;sinus = composante en X
fimul dword ptr [edi]           ;multiplie par la vitesse: resultat sur le stack
fild dword ptr [edi+4]          ;charge l'angle par dessus
fcos                    ;cosinus = composante en Y
fimul dword ptr [edi]           ;multiplie par la vitesse: resultat sur le stack
fistp dword ptr [edi]           ;decharge la composante en Y
fistp dword ptr [edi+4]         ;decharge la composante en X

add edi, 8
                    ;structure d'un pixel:
mov eax, yy             ;0  dd composante vitesse en Y 
stosd                   ;4  dd composante vitesse en X
mov eax, xx             ;8  dd coordonnee Y
stosd                   ;12 dd coordonnee X
                    ;16 dd couleur
mov eax, color              ;20 dd rien, used to save precedent Y coord 
stosd                   ;24 dd rien, used to save precedent X coord
                    ;28 dd rien
add edi, 12             
loop zozo

inc nb_explosions
jmp la_suite

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
