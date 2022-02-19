;--------------- Sprite 5 : Crazy car --------------
;
; Coded for 29A#6.
;
; Store a big bitmap composed of different frames 
; and move it randomly across the screen. Each time
; just blit the good frame with the good mask to
; produce an animation.
;
; Note1: These bitmaps were found on the net.
;
; Not at all optimized, it's better for code clarity. 
; (I like this phrase - good excuse for a lazy ass).
; by Spanska, February 2002, copyleft
;
; assemble : TASM32 /ml /m3 /z /t sprite5_crazycar
; link     : TLINK32 -Tpe -aa sprite5_crazycar,,,import32
; compress : UPX -9 sprite5_crazycar.exe
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

background_palette_value	equ 0  ;fill that
bmp_largeur_s	equ 2160
bmp_hauteur_s	equ 60
bmp_largeur_d	equ 60
bmp_hauteur_d	equ 60
bmp_header	equ offset bitmap + 14
bmp_pixels	equ offset bitmap + 14 + 40 + 1024
frame_number	equ bmp_largeur_s / bmp_largeur_d
angle_each	dd - (360 / frame_number) 
deg2rad		dd 180
virg_fixe	dd 256
bmp_tmp		dd ?
ligne 		dd ?
colonne		dd ?
position_x	dd ?
position_y	dd ?
speed_x		dd 1
speed_y		dd 0
maximum_x	dd ?
maximum_y	dd ?
ticks_scroll	dd ?
ticks_frame	dd ?
compteur_frame	dd 1
source_x	dd ?
seed 		dd 0FFAABB11h
run_or_turn	dd 1
compteur_run	dd 20
new_direction	dd ?
border_turning	dd 0

include bitmap.asm

.code

PROGRAMME:

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
push bmp_hauteur_d		;window height
push bmp_largeur_d		;window width
	push 1			;SM_CYSCREEN
	callW GetSystemMetrics	;get screen height
	mov maximum_y, eax
	sub eax, bmp_hauteur_d	;substract height of our window
	shr eax, 1		;and divide the rest by 2 => centered
	mov ebx, eax
	shl ebx, 8		;set it in our fixed point mode for later
	mov position_y, ebx	;save for later
push eax			;y
	push 0			;SM_CXSCREEN
	callW GetSystemMetrics	;get screen width
	mov maximum_x, eax	;save this
	sub eax, bmp_largeur_d	;substract width of our window
	shr eax, 1		;and divide the rest by 2 => centered
	mov ebx, eax
	shl ebx, 8		;set it in our fixed point mode for later
	mov position_x, ebx
push eax			;x
push 80000000h 			;WS_POPUP
mov eax, offset nom_fenetre
push eax
push eax
push 0 				;extra style
callW CreateWindowExA
mov handle_wd, eax

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
cmp msMESSAGE, 12h		;WM_QUIT equ 0012h
je end_loop

;---------- CPU speed independant delay for frames --------

callW GetTickCount		;get windoze time
push eax			;save it
sub eax, ticks_frame		;compare since last time
cmp eax, 50			;more than x ?
pop eax
jb scroll			;no => just move the window
mov ticks_frame, eax		;yes => change frame to a new bitmap

;------ decide if we run straight or it's time to turn ---------- 

cmp run_or_turn, 0		;if 0 => run straight
jne turning			;if 1 => we are already turning
dec compteur_run		;dec run counter
jnz scroll			;not at the end of the run => just move the window

;--------- end of a run : choose a new random direction ------------

call random			;0<eax<255
xor edx, edx			;always clean edx when you divide
mov ebx, 7			;255/7 is 36.4, just our number of frames, o miracle!
div ebx				;slower than dividing by 2^x, but again we don't care
test eax, eax			;we don't want 36 or -1 as a value
jz blah				;so if it's not 0
dec eax				;dec it
blah:				;and now 0<eax<35
mov new_direction, eax		;now 0<eax<36, it's the new random direction
mov run_or_turn, 1		;remember that we are now in turning mode
call random			;0<eax<255
shr eax, 2			;0<eax<31
mov compteur_run, eax		;reset the run counter for the next one

;-------- go smoothly from old direction to new one ----------------

turning:
mov eax, compteur_frame		;this is the current direction (or frame, it's linked)
mov ebx, new_direction		;this is the direction we need to reach smoothly
sub eax, ebx			;check the difference
js turn_left			;strictly negative => we have to turn one step left
jnz turn_right			;strictly positive => we turn one step right
mov run_or_turn, 0		;zero => new direction reached, we are now in run mode
jmp scroll			;so move the window

turn_right:
dec compteur_frame		;you turn right as you decrease frame number 
cmp compteur_frame, -1		;are we at the lowest limit? (0 is a valid frame nb)
jne set_frame			;no => let's draw the new frame
mov compteur_frame, frame_number;yes => circle and start again from the last frame
jmp set_frame			;and draw it

turn_left:
inc compteur_frame		;you turn left as you increase frame number 
cmp compteur_frame, frame_number;are we at the highest limit?
jne set_frame			;no => let's draw the new frame
mov compteur_frame, 0		;yes => circle and start again from the first frame

;--------- draw a new frame ----------------

set_frame:
mov eax, compteur_frame	;get the frame number
mov ebx, bmp_largeur_d	;get the width of one frame
mul ebx			;and multiply them
mov source_x, eax	;we gonna draw just this part of the big bmp

mov esi, bmp_pixels	;beginning of big bitmap pixels
add esi, eax		;add the pointer to the current frame
mov bmp_tmp, esi	;this is the offset of the current frame
call calculate_region	;we gonna calculate the mask of just this frame

;------- calculate the x,y speeds in function of the direction ------------

calculate_speed:
fldpi			;load pi
fild deg2rad		;load 360/2
fdiv			;calculate (2*pi)/360 to go from degrees to radians
fild angle_each		;load angle step between each frame
fmul			;multiply by (2*pi)/360 to have the step in radians
fild compteur_frame	;load frame number
fmul			;multiply by the step to have the direction angle
fsincos			;get cos (y factor) and sin (x factor)
fild virg_fixe		;we cannot deal with decimals of a pixel, so work with fixed point
fmul			;the format we use is BYTE1BYTE2BYTE3.BYTE4; so mul 256 by the cos
fistp speed_y		;pop y speed in this format
neg speed_y		;if angle/frame=zero, sprite going up, so decrease y, so neg it
fild virg_fixe		;load again the fixed point factor (256 = 1 byte)
fmul			;and this time multiply it by the sinus to get the x speed
fistp speed_x		;and pop it

;---------- CPU speed independant delay for scroll --------

scroll:
callW GetTickCount	;get windoze time
push eax		;save it
sub eax, ticks_scroll	;compare since last time
cmp eax, 10		;more than x ?
pop eax
jb finish		;no => don't do anything
mov ticks_scroll, eax

;--------- add calculated speed to current position --------------

mov eax, speed_x	
add position_x, eax
mov eax, speed_y
add position_y, eax

;--------- check if sprite wanna quit your desktop --------------

mov eax, position_x
shr eax, 8
cmp eax, 20
jb approaching_left_border
mov ebx, maximum_x
sub ebx, 70
cmp eax, ebx
ja approaching_right_border
mov eax, position_y
shr eax, 8
cmp eax, 20
jb approaching_top_border
mov ebx, maximum_y
sub ebx, 70
cmp eax, ebx
ja approaching_bottom_border
mov border_turning, 0
jmp move_the_window

;------- litte bug wanna get out? Come back! --------------

approaching_left_border:	;optimize this shit
cmp border_turning, 1
je move_the_window
mov eax, 9
sub eax, compteur_frame
add eax, 27
mov new_direction, eax
jmp set_run_or_turn_to_1

approaching_right_border:
cmp border_turning, 1
je move_the_window
mov eax, 36
sub eax, compteur_frame
mov new_direction, eax
jmp set_run_or_turn_to_1

approaching_top_border:
cmp border_turning, 1
je move_the_window
mov eax, 18
sub eax, compteur_frame
jns grmbl
add eax, 36
grmbl:
mov new_direction, eax
jmp set_run_or_turn_to_1

approaching_bottom_border:
cmp border_turning, 1
je move_the_window
mov eax, 18
sub eax, compteur_frame
jns grmbl2
add eax, 36
grmbl2:
mov new_direction, eax

set_run_or_turn_to_1:
mov run_or_turn, 1
mov border_turning, 1

;--------- move the window --------------

move_the_window:
push 0
push bmp_hauteur_d	;bmp_hauteur
push bmp_largeur_d	;bmp_largeur
mov eax, position_y	;from our fixed point mode (BYTE1BYTE2BYTE3.BYTE4)
shr eax, 8		;to normal number (0BYTE1BYTE2BYTE3)
push eax		;y pos
mov eax, position_x	;from our fixed point mode (BYTE1BYTE2BYTE3.BYTE4)
shr eax, 8		;to normal number (0BYTE1BYTE2BYTE3)
push eax		;x pos
push -1			;HWND_TOPMOST
push handle_wd
callW SetWindowPos

paint:

;------- Bitmap in memory => visible window ---------------

push handle_wd
callW GetDC			;get device context
mov the_DC, eax

push 00CC0020h;copy
push 0				;DIB_RGB_COLORS=0
push bmp_header
push bmp_pixels
push bmp_hauteur_s		;bmp height DIB source
push bmp_largeur_s		;bmp width DIB source
push 0				;y du rectangle source
push source_x			;x du rectangle source
push bmp_hauteur_s		;bmp height rect destination
push bmp_largeur_s		;bmp width rect destination
push 0				;y du rectangle destination
push 0				;x du rectangle destination
push the_DC			;DC of da window
callW StretchDIBits		;no stretch cause they are same size (sloooow if not)

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

;------- set pointeur at start of the small part of big bmp -----------

mov esi, bmp_tmp		;our frame starts here

;---- scan the bitmap to find background ---------

mov eax, bmp_hauteur_s		;number of lines in the bmp
mov ligne, eax			;save
mov ecx, bmp_hauteur_s		;first counter for lines

scan_all_lines:
push ecx			;save this first counter
xor eax, eax			;start from first column
mov colonne, eax		;save it
mov ebp, esi			;esi is column start
add ebp, bmp_largeur_d		;keep column end

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
mov eax, colonne		;column end of the block of foreground pixels
dec eax				;fix it
mov ebx, ligne			;line of pixel block

push ebx			;y lower-right
push eax			;x lower-right
sub ebx, 1			;the block is 16 pixels high
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
add esi, (frame_number-1)*bmp_largeur_d
jmp scan_all_lines		;process all the dritt bitmap
fuck:

;------- apply the mask -----------------

push 1				;window redraw flag 1=true
push handle_rgn1		;handle to region 
push handle_wd
callW SetWindowRgn

ret

;----- random

random: 

mov eax, 214013h
imul seed
sub edx, edx
add eax, 2531011h
mov seed, eax			;simple pseudo-random routines have a clear periodicity,
xchg eax, ebx			;so to add some more entropy and a different serie 
callW GetTickCount		;each time (slow but here we don't care), I:
xor eax, ebx			; - xor with milliseconds
and eax, 11111111b		; - just use the low bits (so 0<eax<255)
ret				;and don't tell me it's not a good way, this is a
				;stupid animation, not a cryptographic algorithm
end PROGRAMME

;---------------------copyleft Spanska 2002-----------------------
