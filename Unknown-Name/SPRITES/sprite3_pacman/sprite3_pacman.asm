;--------------- Sprite 3 : Pac-Man --------------
;
; Coded for 29A#6.
;
; Scan a stored bitmap, find the background, define a
; window mask which eliminates this background, draws
; a window, apply the mask, move the window around
; and changes the bitmap once in a while to animate
; the crap. That's it. 
;
; Note1: Pac-Man is the best videogame in the world, 
; and this is a sort of hommage to it. Die you all
; youngsters with your 3D textured shit ! :)
;
; Note2: this time i optimized a little bit: the stored
; bitmaps are very small, and we zoom them 16x before 
; blitting them on the screen. I still compress after.
;
; (Almost) not at all optimized, it's better for code 
; clarity. (I like this phrase - good excuse for a lazy 
; ass).
; by Spanska, February 2002, copyleft
;
; assemble : TASM32 /ml /m3 /z /t sprite3_pacman
; link     : TLINK32 -Tpe -aa sprite3_pacman,,,import32
; compress : UPX -9 sprite3_pacman.exe
;
; Fellow vxers know where to contact me directly. Others 
; can still send an email to guillermito@pipo.com who will 
; transmit.

callW macro x
extrn x:PROC
call x
endm

.386
.model flat

.data

;shitty structures

wndclass:
clsStyle          dd 4003h	; class style
clsLpfnWndProc    dd ?
clsCbClsExtra     dd 0
clsCbWndExtra     dd 0
clsHInstance      dd ?		; instance handle
clsHIcon          dd 0		; class icon handle
clsHCursor        dd 0		; class cursor handle
clsHbrBackground  dd 0		; class background brush
clsLpszMenuName   dd 0		; menu name
clsLpszClassName  dd ?		; far ptr to class name

msg:
msHWND          dd ?
msMESSAGE       dd ?
msWPARAM        dd ?
msLPARAM        dd ?
msTIME          dd ?
msPT            dd ?
protege dd ?

;shit for my window

nom_fenetre	db "Spanska Sprite",0
handle_wd	dd ?
adresse_retour	dd ?
the_DC		dd ?
handle_rgn1	dd ?
handle_rgn2	dd ?

;shit for bmp handling

bmp_largeur	dd ?
bmp_hauteur	dd ?
bmp_largeur16	dd ?
bmp_hauteur16	dd ?
bmp_header	dd ?
bmp_pixels	dd ?
bmp_tmp		dd ?
ligne 		dd ?
colonne		dd ?
compteur_frame	dd 0
ticks_frame	dd ?
ticks_scroll	dd ?
position_x	dd -500
position_y	dd ?
maximum_x	dd ?

background_palette_value	equ 0  ;fill that

include bitmap.asm

.code

PROGRAMME:

;--------- Calculate the first mask and fill some values ---------------------

mov bmp_tmp, offset bmp1
call calculate_region

;***********************************************************
;*************** normal windoze business *******************
;***********************************************************

;--------- Enregistrer la wndclass ---------------------

push 0
callW GetModuleHandleA
push eax			;@@ handle
mov clsHInstance, eax
mov eax, offset wndproc
mov clsLpfnWndProc, eax
mov clsLpszClassName, offset nom_fenetre
push offset wndclass
callW RegisterClassA

;---------- create centered window  -----------------------

pop ebx				;@@ handle
xor eax, eax
push eax			;0
push ebx			;handle
push eax			;0	
push eax			;0
	mov eax, bmp_hauteur	;stored bitmap height
	shl eax, 4		;we gonna show it zoomed 16x
	mov bmp_hauteur16, eax	;save that
push eax			;window height
	mov eax, bmp_largeur	;stored bitmap width
	shl eax, 4		;we gonna show it zoomed 16x
	mov bmp_largeur16, eax	;save this value
push eax			;window width
	push 1			;SM_CYSCREEN
	callW GetSystemMetrics	;get screen height
	sub eax, bmp_hauteur16	;substract height of our window
	shr eax, 1		;and divide the rest by 2 => centered
	mov position_y, eax	;save for later
push eax			;y
	push 0			;SM_CXSCREEN
	callW GetSystemMetrics	;get screen width
	mov maximum_x, eax	;save this
push position_x			;x
push 80000000h 			;WS_POPUP
mov eax, offset nom_fenetre
push eax
push eax
push 0 				;extra style
callW CreateWindowExA
mov handle_wd, eax

;--------- Apply the first mask ---------------------

push 1				;window redraw flag 1=true
push handle_rgn1		;handle of mask 
push handle_wd			;handle of window
callW SetWindowRgn

;--------- Show the window ---------------------

push 1
push handle_wd
callW ShowWindow

;---------- Message loop ---------------

msg_loop:
xor eax, eax
push 1
push eax
push eax
push eax
push offset msg
callW PeekMessageA
jmp process_messages	;we wanna animate even when no message to the wd

jmp msg_loop

;-------------- See if windows is closed ----------------------

process_messages:
cmp msMESSAGE, 12h	;WM_QUIT equ 0012h
je end_loop

;---------- CPU speed independant delay for scroll --------

callW GetTickCount	;get windoze time
push eax		;save it
sub eax, ticks_scroll	;compare since last time
cmp eax, 10		;more than 10 ?
pop eax
jb dont_scroll		;no => don't scroll the window
mov ticks_scroll, eax

;--------- if reach right border, quit --------------

add position_x, 2
mov eax, position_x
add eax, 500
mov ebx, maximum_x		;bah. Lazy.
add ebx, 500
cmp eax, ebx
ja end_loop

;--------- set new position --------------

push 0
push bmp_hauteur16	;bmp_hauteur
push bmp_largeur16	;bmp_largeur
push position_y		;y pos
push position_x		;x pos
push -1			;HWND_TOPMOST
push handle_wd
callW SetWindowPos

;---------- CPU speed independant delay for frames --------

dont_scroll:
callW GetTickCount	;get windoze time
push eax		;save it
sub eax, ticks_frame	;compare since last time
cmp eax, 100		;more than 100 ?
pop eax
jb finish		;no => don't blit a new bitmap
mov ticks_frame, eax	;yes => change frame
inc compteur_frame

;--------- choose which frame ----------------

cmp compteur_frame, 1				;optimize this shit
jne @1
mov bmp_tmp, offset bmp1
call calculate_region
jmp paint
@1:
cmp compteur_frame, 2
jne @2
mov bmp_tmp, offset bmp2
call calculate_region
jmp paint
@2:
cmp compteur_frame, 3
jne @3
mov bmp_tmp, offset bmp3
call calculate_region
jmp paint
@3:
mov bmp_tmp, offset bmp4
call calculate_region

xor eax, eax
mov compteur_frame, eax

paint:

;------- Bitmap in memory => visible window ---------------

push handle_wd
callW GetDC			;get device context
mov the_DC, eax

push 00CC0020h			;copy
push 0				;DIB_RGB_COLORS=0
push bmp_header			;offset of bmp header
push bmp_pixels			;offset of bmp pixels
push bmp_hauteur		;bmp height of source DIB
push bmp_largeur		;bmp width of source DIB
push 0				;y of source rectangle
push 0				;x of source rectangle
push bmp_hauteur16		;bmp height of destination rect
push bmp_largeur16		;bmp width of destination rect
push 0				;y of destination rectangle
push 0				;x of destination rectangle
push the_DC			;DC of da window
callW StretchDIBits		;zoom it by 16 (power of 2 => fast)

push the_DC
push handle_wd
callW ReleaseDC			;release fucking DC

;------- Finish with processing the crappy messages ---------------

finish:
push offset msg
callW TranslateMessage
push offset msg
callW DispatchMessageA
jmp msg_loop

;------------- End --------------

end_loop:
push -1
callW ExitProcess

;--------------- Almost empty window proc to speed up ---------------------

wndproc:

enter 0, 0				;this way it works under NT too

cmp dword ptr [ebp+12], 2		;WM_DESTROY
jne suite
push 0
callW PostQuitMessage
xor eax, eax
jmp wndproc_end

suite:
cmp dword ptr [ebp+12], 84h		;WM_NCHITEST (mouse click)
jne suite2
mov eax, 2				;HTCAPTION
jmp wndproc_end

suite2:
push dword ptr [ebp+20]
push dword ptr [ebp+16]
push dword ptr [ebp+12]
push dword ptr [ebp+8]
callW DefWindowProcA

wndproc_end:
mov ecx, adresse_retour
push ecx

leave
ret 16

;***********************************************************
;*************** scan bmp and define mask ******************
;***********************************************************

calculate_region:

;---- create a first null region -----------------

push 0			;y lower-right
push 0			;x lower-right
push 0			;y upper-left 
push 0			;x upper-left
callW CreateRectRgn	;return region handle
mov handle_rgn1, eax

;---- scan the bitmap header to find some info (8bpp only) -----------

mov esi, bmp_tmp		;pointer to bmp in memory
add esi, 14			;jump over the first part of header
mov bmp_header, esi		;the interesting stuff starts here
mov eax, dword ptr [esi+4]	;grab the width
mov bmp_largeur, eax		;and save it
mov eax, dword ptr [esi+8]	;grab the height
mov bmp_hauteur, eax		;and save it
add esi, dword ptr [esi]	;jump at palette start
add esi, 256*4			;jump at pixel values start
mov bmp_pixels, esi		;save the offset

;---- scan the bitmap to find background ---------

mov eax, bmp_hauteur		;number of lines in the bmp
mov ligne, eax			;save
mov ecx, bmp_hauteur		;first counter for lines

scan_all_lines:
push ecx			;save this first counter
xor eax, eax			;start from first column
mov colonne, eax		;save it
mov ebp, esi			;esi is column start
add ebp, bmp_largeur		;keep column end

scan_one_line:
cmp esi, ebp			;we are at the end of the column?
je end_line			;yes => go to next
lodsb				;grab pixel (256 colors = 1 byte per pixel)
inc colonne			;and inc column counter
cmp al, background_palette_value;is it background?
je scan_one_line		;yes => continue scanning

;---- grab a block of foreground pixels ------------

push colonne			;remember at which column it starts
foreground:
cmp esi, ebp			;we are at the end of the column?
jne bzz
inc colonne
jmp add_to_the_mask		;yes => go to next
bzz:

lodsb				;grab pixel 
inc colonne			;and inc column counter
cmp al, background_palette_value;is it background?
jne foreground			;no => continue scanning

;---- define a region with this block --------------

add_to_the_mask:
pop ecx				;column start of the block of foreground pixels
dec ecx				;fix it
shl ecx, 4			;multiply by 16

mov eax, colonne		;column end of the block of foreground pixels
dec eax				;fix it
shl eax, 4			;multiply by 16

mov ebx, ligne			;line of pixel block
shl ebx, 4			;multiply by 16

push ebx			;y lower-right
push eax			;x lower-right
sub ebx, 16			;the block is 16 pixels high
push ebx			;y upper-left
push ecx			;x upper-left
callW CreateRectRgn		;return region handle
mov handle_rgn2, eax

;---- mix this pixel block with the rest of the mask -------------

push 2 				;RGN_OR
push handle_rgn1		;source region
push handle_rgn2		;source region
push handle_rgn1		;destination region
callW CombineRgn		;combine them

push handle_rgn2		;we don't need this region anymore
callW DeleteObject

jmp scan_one_line

;---- continue scanning the bitmap --------------

end_line:
inc esi
inc esi
dec ligne			;next line
pop ecx				;get the line counter
dec ecx				;why do i use 2 counters for the same thing?
jz fuck				;i probably should get some sleep
jmp scan_all_lines		;process all the dritt bitmap
fuck:

;------- apply the mask -----------------

push 1				;window redraw flag 1=true
push handle_rgn1		;handle to region 
push handle_wd
callW SetWindowRgn
ret

end PROGRAMME

;---------------------copyleft Spanska 2002-----------------------
