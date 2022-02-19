;--------------- Sprite 1 : Kiss --------------
;
; Coded for 29A#6.
;
; Scan a stored bitmap, find the background, define a
; window mask which eliminates this background, draws
; a window and apply the mask. That's it.
;
; Note1: as i have just 2 colors in the image, i could
; use a 1 bit per pixel bitmap, which is 8 times 
; shorter, but as i compress the whole stuff, i just
; gain 2 or 3 Kb at the end. Bah. 
;
; Note2: the image was extracted from a funny 
; screensaver called "ValentineKisses".
;
; Not at all optimized, it's better for code clarity.
; (I like this phrase - good excuse for a lazy ass) 
; by Spanska, January 2002, copyleft
;
; assemble : TASM32 /ml /m3 /z /t sprite1_kiss
; link     : TLINK32 -Tpe -aa sprite1_kiss,,,import32
; compress : UPX -9 sprite1_kiss.exe
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

bmp_largeur	dd ?
bmp_hauteur	dd ?
bmp_header	dd ?
bmp_pixels	dd ?

background_palette_value equ 1  ;fill that
ligne 		dd ?
colonne		dd ?

include bitmap.asm

.code

PROGRAMME:

;***********************************************************
;*************** scan bmp and define mask ******************
;***********************************************************

;---- create a first null region -----------------

push 0			;y lower-right
push 0			;x lower-right
push 0			;y upper-left 
push 0			;x upper-left
callW CreateRectRgn	;return region handle
mov handle_rgn1, eax

;---- scan the bitmap header to find some info (8bpp only) -----------

mov esi, offset bitmap		;pointer to bmp in memory
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
je end_line			;yes => go to next

lodsb				;grab pixel 
inc colonne			;and inc column counter
cmp al, background_palette_value;is it background?
jne foreground			;no => continue scanning

;---- define a region with this block --------------

add_to_the_mask:
pop ecx				;column start of the block of foreground pixels
mov eax, colonne		;column end +1 of the block of foreground pixels
dec eax				;fix it
mov ebx, ligne			;line of pixel block
push ebx			;y lower-right
push eax			;x lower-right
sub ebx, 1			;the block is 1 pixel high
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
dec ligne			;next line
pop ecx				;get the line counter
dec ecx				;why do i use 2 counters for the same thing?
jz fuck				;i probably should get some sleep
jmp scan_all_lines		;process all the dritt bitmap
fuck:

;***********************************************************
;*************** normal windoze business *******************
;***********************************************************

;--------- register  wndclass ---------------------

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
push eax
push ebx			;handle
push eax
push eax
push bmp_hauteur		;bmp height
push bmp_largeur		;bmp width
	push 1			;SM_CYSCREEN
	callW GetSystemMetrics	;get screen height
	sub eax, bmp_hauteur	;substract height of our window
	shr eax, 1		;and divide the rest by 2 => centered
push eax			;y
	push 0			;SM_CXSCREEN
	callW GetSystemMetrics	;get screen width
	sub eax, bmp_largeur	;substract width of our window
	shr eax, 1		;and divide the rest by 2 => centered
push eax			;x
push 80000000h 			;WS_POPUP
mov eax, offset nom_fenetre
push eax
push eax
push 0 				;extra style
callW CreateWindowExA
mov handle_wd, eax

;-------- apply the painfully calculated mask ------------

push 1				;window redraw flag 1=true
push handle_rgn1		;handle to region 
push handle_wd
callW SetWindowRgn

;------- and show the shit ------------

push 1
push handle_wd
callW ShowWindow

;---------- message loop ---------------

msg_loop:
xor eax, eax
push 1
push eax
push eax
push eax
push offset msg
callW PeekMessageA
test eax, eax
jnz process_messages

jmp msg_loop

;-------------- see if windows is closed ----------------------

process_messages:
cmp msMESSAGE, 12h		;WM_QUIT equ 0012h
je end_loop

;-------- get DC of the window -----------------

push handle_wd
callW GetDC			;get device context
mov the_DC, eax

;------- bitmap in memory => visible window ---------------

push 00CC0020h		;copy
push 0			;DIB_RGB_COLORS=0
push bmp_header
push bmp_pixels
push bmp_hauteur	;bmp height DIB source
push bmp_largeur	;bmp width DIB source
push 0			;y of source rectangle 
push 0			;x of source rectangle
push bmp_hauteur	;bmp height rect destination
push bmp_largeur	;bmp width rect destination
push 0			;y of destination rectangle 
push 0			;x of destination rectangle
push the_DC		;DC of da window
callW StretchDIBits	;no stretch cause they are same size (sloooow if not)

push the_DC
push handle_wd
callW ReleaseDC		;release fucking DC

push offset msg
callW TranslateMessage
push offset msg
callW DispatchMessageA
jmp msg_loop

;------------- end --------------

end_loop:
push msWPARAM
callW ExitProcess

;--------------- empty window proc to speed up ---------------------

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

end PROGRAMME

;---------------------copyleft Spanska 2002-----------------------