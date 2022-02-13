;----------OpenGL in win32asm example----------------
;
; Cleaned and updated for 29A.
;
; draws a complex 3D object, a face composed by 2363 points
; defining 4640 polygons, and smooth-shades it. For esthetics,
; sets a color dependant of 3D coordinates. The object was in
; 3D Studio format first, i converted it to C code for OpenGL
; and then to asm data. As this object is symetric, i could 
; remove half of this data, and cut half of the calculations,
; but i wanted to code a routine to handle whatever 3D object, 
; symetric or not. I compressed the executable after, anyway.
;
;  - left button click and mouse XY for XY rotation
;  - right button click and mouse X for distance
;  - space to see the effect of averaging normals at each vertex:
;     - one normal for each polygon (flat shading)
;     - three averaged normals for each polygon (smooth shading)
;
; not at all optimized, it's better for code clarity. 
; by Spanska, January 2002, copyleft
;
; assemble : TASM32 /ml /m3 /z /t face2
; link     : TLINK32 -Tpe -aa face2,,,import32 opengl32
; compress : UPX -9 face2.exe
;
; Fellow vxers know where to contact me directly. Others 
; can still send an email to guillermito@pipo.com who will 
; transmit.

callW macro   x
 extrn   x:PROC
 call    x
endm

	.386p
	.model flat,STDCALL

.data

;------------- funky structures ---------------------

paint_struct:
 pshdc          dd ? 
 psfErase       dd 0
 psrcPaint      dd offset rect_struct 
 psfRestore     dd ? 
 psfIncUpdate   dd ? 
 psrgbReserved  db 32 dup(?) 
    
rect_struct:
 rcLeft         dd ?
 rcTop          dd ?
 rcRight        dd ?
 rcBottom       dd ?

wndclassx:
 clscbSize        dd wndclassx_size
 clsStyle         dd 20h+2+1	; class style CS_OWNDC+CS_VREDRAW+CS_HREDRAW
 clsLpfnWndProc   dd ?
 clsCbClsExtra    dd 0
 clsCbWndExtra    dd 0
 clsHInstance     dd ?		; instance handle
 clsHIcon         dd 0		; class icon handle
 clsHCursor       dd 0		; class cursor handle
 clsHbrBackground dd 7		; class background brush
 clsLpszMenuName  dd 0		; menu name
 clsLpszClassName dd ?		; far ptr to class name
 clshIconSm       dd 0
wndclassx_size equ $-offset wndclassx

msg:
 msHWND          dd ?
 msMESSAGE       dd ?
 msWPARAM        dd ?
 msLPARAM        dd ?
 msTIME          dd ?
 msPT            dd ?
    
DDPIXELFORMAT_struct:
 pfd_nSize           dw 0
 pfd_nVersion        dw 0
 pfd_dwFlags         dd 0
 pfd_iPixelType      db 0
 pfd_cColorBits      db 0 
 pfd_cRedBits        db 0
 pfd_cRedShift       db 0
 pfd_cGreenBits      db 0
 pfd_cGreenShift     db 0
 pfd_cBlueBits       db 0
 pfd_cBlueShift      db 0
 pfd_cAlphaBits      db 0
 pfd_cAlphaShift     db 0
 pfd_cAccumBits      db 0
 pfd_cAccumRedBits   db 0
 pfd_cAccumGreenBits db 0
 pfd_cAccumBlueBits  db 0
 pfd_cAccumAlphaBits db 0
 pfd_cDepthBits      db 0
 pfd_cStencilBits    db 0
 pfd_cAuxBuffers     db 0
 pfd_iLayerType      db 0
 pfd_bReserved       db 0
 pfd_dwLayerMask     dd 0
 pfd_dwVisibleMask   dd 0
 pfd_dwDamageMask    dd 0
DDPIXELFORMAT_struct_size equ $-offset DDPIXELFORMAT_struct

;------------- some data ---------------------
 
nom_fenetre	db "OpenGL example by Spanska",0
handle		dd ?
handle_wd	dd ?
adresse_retour	dd ?
pixformat	dd ?
theDC		dd ?
theRC		dd ? 
angle		dd 0

;--------- data that can be changed with mouse ------------

mouse_xy_old	dd ?
mouse_xy_new	dd ?
mouse_inc_x	dd ?
mouse_inc_y	dd ?
mouse_sensit	dd 5
float TYPEDEF REAL4
cur_anglex 	float 0
cur_angley 	float 0
cur_anglez 	float 0
cur_distance 	float -20.0
smooth_or_flat 	dd 0

;-------- name some simple precision float numbers  ---------------------
; (NB: i may not use them all)

p0_1 float   0.1
p0_2 float   0.2
p0_5 float   0.5
m0_5 float  -0.5
p1_0 float   1.0
m1_0 float  -1.0
p1_3 float   1.333333333
m1_4 float  -1.4
m1_5 float  -1.5
p1_5 float   1.5
p1_6 float   1.6
p1_7 float   1.7
p1_8 float   1.8
p1_85 float  1.85
p1_9 float   1.9
p2_0 float   2.0
m2_0 float  -2.0
m3_0 float  -3.0
p3_0 float   3.0
m4_0 float  -4.0
p4_0 float   4.0
m5_0 float  -5.0
p5_0 float   5.0
p6_0 float   6.0
m6_0 float  -6.0
p7_0 float   7.0
p8_0 float   8.0
m8_0 float  -8.0
p10  float  10.0
m10  float -10.0
m15  float -15.0
p20  float  20.0
m40  float -40.0
p40  float  40.0
p45  float  45.0
p99  float  99.0

;-------- name some double precision float numbers  ---------------------
; (NB: i may not use them all)

dfloat TYPEDEF REAL8
p0__02 dfloat  0.02
m0__02 dfloat -0.02
p0__1 dfloat  0.1
m0__1 dfloat -0.1
p1__0 dfloat  1.0
m1__0 dfloat -1.0
p1__33 dfloat 1.3333
p2__0 dfloat  2.0
m2__0 dfloat -2.0
p3__0 dfloat  3.0
m3__0 dfloat -3.0
p4__0 dfloat  4.0
m4__0 dfloat -4.0
p5__0 dfloat  5.0
m5__0 dfloat -5.0
p7__0 dfloat  7.0
pp10  dfloat  10.0
mm10  dfloat -10.0
pp20  dfloat  20.0
pp30  dfloat  30.0
pp40  dfloat  40.0
pp45  dfloat  45.0
pp100 dfloat  100.0

;-------- small structures with float numbers ---------------------

Light_Diffuse:
qq1 float 0.2		;Red
qq2 float 0.2		;Green
qq3 float 0.2		;Blue
qq4 float 1.0		;alpha

Light_Position:
qq5 float 0.0		;x
qq6 float 0.0		;y
qq7 float 10.0		;z
qq8 float 0		;directional source

mat_Ambient  float 1.0,0.01,0.01,1.0
mat_Diffuse  float 1.0,0.01,0.01,1.0
mat_Specular float 0.5,0.5,0.5,1.0
mat_Shine    float 5.0

;-------- data to construct the face ---------------------

include index.asm	;index of polygons
include coords.asm	;coordz of vertex

index_1 dd ?
index_2 dd ?
index_3 dd ?
index_4 dd ?

x1 dd ?
y1 dd ?
z1 dd ?
x2 dd ?
y2 dd ?
z2 dd ?
x3 dd ?
y3 dd ?
z3 dd ?

normal_x dd ?
normal_y dd ?
normal_z dd ?
longueur dd ?
v1normal_x dd ?
v1normal_y dd ?
v1normal_z dd ?
v2normal_x dd ?
v2normal_y dd ?
v2normal_z dd ?
v3normal_x dd ?
v3normal_y dd ?
v3normal_z dd ?

table_faces_normals dd ?
current_pointer_facettes dd ?
current_pointer_normals dd ?

a dd ?
b dd ?
c dd ?
anx1 dd 0
any1 dd 0
anz1 dd 0
anx2 dd 0
any2 dd 0
anz2 dd 0
anx3 dd 0
any3 dd 0
anz3 dd 0

.code

start:

;------------- get memory for the big table ---------------------
; table = 441 faces * (24 dd)
; these 24 dd are:
; index123,xyz1,xyz2,xyz3,normalxyz,an1xyz,an2xyz,an3xyz

mov eax, nb_polygons*(24*4)
add eax, 1024		;just in case
push eax		;number of bytes to allocate
push 40h		;40h=LMEM_ZEROINIT
callW LocalAlloc
mov table_faces_normals, eax

;---------------- pre-calculate everything -----------------------
; - normals of each triangle first, we could stop here for flat shading
; - using these, calculate average normals for each vertex, needed for smooth shading

mov ecx, nb_polygons
mov esi, offset facettes
mov eax, table_faces_normals
mov current_pointer_normals, eax

;--- get indexes of the current polygon

get_indexes:
lodsd		; index no 1
mov index_2, eax
lodsd		; index no 2
mov index_1, eax
lodsd		; index no 3
mov index_3, eax

pusha

;--- using these indexes, get xyz of the three vertexes (corners)

mov esi, offset coords	;esi at start of coordz table
mov eax, index_1	;eax = index of first coordz
mov ebx, 12
mul ebx			;1 index = 3 coordz of 4 bytes
add esi, eax
lodsd			;get x
mov x1, eax
lodsd			;get y
mov y1, eax
lodsd			;get z
mov z1, eax

mov esi, offset coords	;same for second vertex
mov eax, index_2
mov ebx, 12
mul ebx
add esi, eax
lodsd
mov x2, eax
lodsd
mov y2, eax
lodsd
mov z2, eax
		
mov esi, offset coords	;same for second vertex
mov eax, index_3
mov ebx, 12
mul ebx
add esi, eax
lodsd
mov x3, eax
lodsd
mov y3, eax
lodsd
mov z3, eax	
	
;-- now use these coordz to calculate normals (xyz) of each polygon

;coa = -(py1 * (pz2-pz3) + py2*(pz3-pz1) + py3*(pz1-pz2)) 

fld z2
fsub z3
fmul y1
fld z3
fsub z1
fmul y2
fld z1
fsub z2
fmul y3
fadd
fadd
fchs
fstp normal_x		;save it

;cob = -(pz1 * (px2-px3) + pz2*(px3-px1) + pz3*(px1-px2)) 

fld x2
fsub x3
fmul z1
fld x3
fsub x1
fmul z2
fld x1
fsub x2
fmul z3
fadd
fadd
fchs
fstp normal_y		;save it

;coc = -(px1 * (py2-py3) + px2*(py3-py1) + px3*(py1-py2))

fld y2
fsub y3
fmul x1
fld y3
fsub y1
fmul x2
fld y1
fsub y2
fmul x3
fadd
fadd
fchs
fstp normal_z		;save it

;--- calculate the length of the normal
;absvec = sqrt ((double) ((coa*coa) + (cob*cob) + (coc*coc)))
; not useful actually because glNormalize will take care of that
; maybe speed difference, but i didn't noticed

fld normal_x
fmul normal_x
fld normal_y
fmul normal_y
fld normal_z
fmul normal_z
fadd
fadd
fsqrt
fstp longueur

;--- normalize this length to 1  
; we divide each xyz component by the length of the normal vector
; not useful actually because glNormalize will take care of that
; maybe speed difference, but i didn't noticed

;  norm[0] = coa/absvec

fld normal_x
fdiv longueur
fstp normal_x

;  norm[1] = cob/absvec

fld normal_y
fdiv longueur
fstp normal_y

;  norm[2] = coc/absvec

fld normal_z
fdiv longueur
fstp normal_z

;--- put all the stuff in the big table
; This table has the data for 441 polygons.
; for each polygon we have:
; dd index1,index2,index3,x1,y1,z1,x2,y2,z2,x3,y3,z3,nx,ny,nz,an1xyz,an2xyz,an3xyz
; see above for a clearer structure

mov edi, current_pointer_normals
mov eax, index_1
stosd
mov eax, index_2
stosd
mov eax, index_3
stosd
mov eax, x1
stosd
mov eax, y1
stosd
mov eax, z1
stosd
mov eax, x2
stosd
mov eax, y2
stosd
mov eax, z2
stosd
mov eax, x3
stosd
mov eax, y3
stosd
mov eax, z3
stosd
mov eax, normal_x
stosd
mov eax, normal_y
stosd
mov eax, normal_z
stosd
xor eax, eax		;stuff we still need to calculate (averaged normals)
stosd			;so fill with zeros
stosd
stosd
stosd
stosd
stosd
stosd
stosd
stosd
mov current_pointer_normals, edi

popa

dec ecx
jnz get_indexes

;ok so here we have one big table of 441 faces * 24 dd :
;
;dd index1, index2, index3
;dd x1, y1, z1
;dd x2, y2, z2
;dd x3, y3, z3
;dd normalx, normaly, normalz
;dd averagednormalx1, averagednormaly1, averagednormalz1   <= need to calculate them now
;dd averagednormalx2, averagednormaly2, averagednormalz2   <= need to calculate them now
;dd averagednormalx3, averagednormaly3, averagednormalz3   <= need to calculate them now

;--- calculate the averaged normals to smooth the light

; we have to find which polygons share a vertex, and then
; calculate the average normal at this vertex.

;loop1: for each face, put index1, index2, index3 in 3 variables a b c
; now start again from beginning of the table
; loop2: check if "a" matches one of the 3 indexes
; if yes, go to the normals, add them to 3 variables anx1, any1, anz1
; same for b and c
; continue loop2
;   to avoid bad shadowing in the middle, between 2 semi-faces:
;   if x1=0 then anx=0 ; if x2=0...
;put anx, any, anz in the averaged normal of the current face
;loop1

mov ecx, nb_polygons
mov esi, table_faces_normals

loop1:

lodsd			; get the 3 indexes and put them in a temp location
mov a, eax
lodsd
mov b, eax
lodsd
mov c, eax
add esi, (24*4)-12
mov edi, esi
sub edi, (3*4)*3

pusha

mov ecx, nb_polygons
mov esi, table_faces_normals
xor eax, eax		; clean the temp variables
mov anx1, eax
mov any1, eax
mov anz1, eax
mov anx2, eax
mov any2, eax
mov anz2, eax
mov anx3, eax
mov any3, eax
mov anz3, eax

loop2:
@0:		;check if other polygons share the first vertex
lodsd
cmp eax, a
jne @1
fld dword ptr [esi+44]	;normal_x
fadd anx1
fstp anx1
fld dword ptr [esi+48]	;normal_y
fadd any1
fstp any1
fld dword ptr [esi+52]	;normal_z
fadd anz1
fstp anz1
@1:		;check if other polygons share the second vertex
cmp eax, b
jne @2
fld dword ptr [esi+44]	;normal_x
fadd anx2
fstp anx2
fld dword ptr [esi+48]	;normal_y
fadd any2
fstp any2
fld dword ptr [esi+52]	;normal_z
fadd anz2
fstp anz2
@2:		;check if other polygons share the third vertex
cmp eax, c
jne @3
fld dword ptr [esi+44]	;normal_x
fadd anx3
fstp anx3
fld dword ptr [esi+48]	;normal_y
fadd any3
fstp any3
fld dword ptr [esi+52]	;normal_z
fadd anz3
fstp anz3

@3:		;check if other polygons share the first vertex
lodsd
cmp eax, a
jne @4
fld dword ptr [esi+40]	;normal_x
fadd anx1
fstp anx1
fld dword ptr [esi+44]	;normal_y
fadd any1
fstp any1
fld dword ptr [esi+48]	;normal_z
fadd anz1
fstp anz1
@4:		;check if other polygons share the second vertex
cmp eax, b
jne @5
fld dword ptr [esi+40]	;normal_x
fadd anx2
fstp anx2
fld dword ptr [esi+44]	;normal_y
fadd any2
fstp any2
fld dword ptr [esi+48]	;normal_z
fadd anz2
fstp anz2
@5:		;check if other polygons share the third vertex
cmp eax, c
jne @6
fld dword ptr [esi+40]	;normal_x
fadd anx3
fstp anx3
fld dword ptr [esi+44]	;normal_y
fadd any3
fstp any3
fld dword ptr [esi+48]	;normal_z
fadd anz3
fstp anz3

@6:		;check if other polygons share the first vertex
lodsd
cmp eax, a
jne @7
fld dword ptr [esi+36]	;normal_x
fadd anx1
fstp anx1
fld dword ptr [esi+40]	;normal_y
fadd any1
fstp any1
fld dword ptr [esi+44]	;normal_z
fadd anz1
fstp anz1
@7:		;check if other polygons share the second vertex
cmp eax, b
jne @8
fld dword ptr [esi+36]	;normal_x
fadd anx2
fstp anx2
fld dword ptr [esi+40]	;normal_y
fadd any2
fstp any2
fld dword ptr [esi+44]	;normal_z
fadd anz2
fstp anz2
@8:		;check if other polygons share the third vertex
cmp eax, c
jne @9
fld dword ptr [esi+36]	;normal_x
fadd anx3
fstp anx3
fld dword ptr [esi+40]	;normal_y
fadd any3
fstp any3
fld dword ptr [esi+44]	;normal_z
fadd anz3
fstp anz3
@9:
add esi, (24*4)-12

end_loop2:
dec ecx
jnz loop2

popa

;--- small trick to avoid bad smoothing along the 2 semi-faces
;
;here esi = next struct, edi = current anx1 
;small routine to smooth the shadow between 2 semi-faces
;ie all triangles touching the frontier (x=0) have their normal X=0

cmp dword ptr [esi-(21*4)], 0	;x1
jne buzzz1
mov anx1, 0
buzzz1:
cmp dword ptr [esi-(18*4)], 0	;x2
jne buzzz2
mov anx2, 0
buzzz2:
cmp dword ptr [esi-(15*4)], 0	;x3
jne buzzz3
mov anx3, 0
buzzz3:

;--- put calculated averaged normals at each vertex in the table

mov eax, anx1
stosd
mov eax, any1
stosd
mov eax, anz1
stosd
mov eax, anx2
stosd
mov eax, any2
stosd
mov eax, anz2
stosd
mov eax, anx3
stosd
mov eax, any3
stosd
mov eax, anz3
stosd

dec ecx
jnz loop1

;----------------- OK, now normal windows stuph ---------------------

;----------------- register wndclass ----------------------------

push 0
callW GetModuleHandleA
mov handle, eax

mov clsHInstance, eax
mov eax, offset wndproc
mov clsLpfnWndProc, eax
mov clsLpszClassName, offset nom_fenetre

push offset wndclassx
callW RegisterClassExA

;--------------------- create the window --------------------------

push 0
push handle
push 0
push 0				;HWND_DESKTOP
push 500			;hauteur
push 500			;largeur
push 0				;y
push 0				;x
push 0CF0000h+4000000h+2000000h	;WS_OVERLAPPEDWINDOW+WS_CLIPSIBLINGS+WS_CLIPCHILDREN
push offset nom_fenetre
push offset nom_fenetre
push 0 				;extra style
callW CreateWindowExA
mov handle_wd, eax

;------------------------ show window ------------------------------

push 1
push handle_wd
callW ShowWindow

push handle_wd
callW UpdateWindow

call enable_opengl

;------------------------ the message loop ----------------------------------

winmain_msg_loop:
push 0
push 0
push handle_wd
callW InvalidateRect		;force paint?

push 1
push 0
push 0
push 0
push offset msg
callW PeekMessageA
cmp eax, 0
jnz process_messages

jmp winmain_msg_loop

;----- check if window is closed --------

process_messages:

cmp msMESSAGE, 12h	;WM_QUIT equ 0012h
je end_loop

push offset msg
callW TranslateMessage
push offset msg
callW DispatchMessageA
jmp winmain_msg_loop

end_loop:

call disable_opengl

push table_faces_normals
callW LocalFree

push msWPARAM
callW ExitProcess

;------------------ windows proc ------------------------

wndproc proc hwnd:DWORD, wmsg:DWORD, wparam:DWORD, lparam:DWORD

cmp wmsg,2			;WM_DESTROY?
jne suite1
push 0
callW PostQuitMessage
xor eax, eax
jmp wndproc_end

suite1:
cmp wmsg, 0fh			;WM_PAINT?
jne suite3
push offset rect_struct
push handle_wd
callW GetClientRect
mov eax, theDC
mov pshdc, eax
push offset paint_struct
push handle_wd
callW BeginPaint
call draw_opengl
mov eax, theDC
mov pshdc, eax
push offset paint_struct
push handle_wd
callW EndPaint
xor eax, eax
jmp wndproc_end

suite3:
cmp wmsg, 200h			;WM_MOUSEMOVE?
jne suite4

mov eax, lparam			;when the mouse is in the window,
mov mouse_xy_new, eax		;save current mouse y (hi dw) and x (low dw) 

test wparam, 1			;MK_LBUTTON = 1 ?
jz check_right_button		;no left button clicked => don't bother with angles

mov eax, mouse_xy_new
and eax, 0000ffffh		;get mouse x new position
mov ebx, mouse_xy_old
and ebx, 0000ffffh		;get mouse x old position
sub eax, ebx			;get the difference in pixels
mov mouse_inc_x, eax		;store it, integer format
fild mouse_inc_x		;transform it in float format
fild mouse_sensit		;5 pixels movement = 1 degree angle
fdiv				;reduce it
fld cur_anglez			;now load the current angle
fadd				;add the angle increment to the current angle
fstp cur_anglez			;notice that when mouse moves on the screen X 2D axis	
				;the OpenGL object rotates around the space Y 3D axis
mov eax, mouse_xy_new
and eax, 0ffff0000h		;get mouse y new position
ror eax, 16
mov ebx, mouse_xy_old
and ebx, 0ffff0000h		;get mouse y old position
ror ebx, 16
sub eax, ebx			;get the difference in pixels
mov mouse_inc_y, eax		;store it, integer format
fild mouse_inc_y		;transform it in float format
fild mouse_sensit		;5 pixels movement = 1 degree angle
fdiv				;reduce it
fld cur_anglex			;add the angle increment to the current angle
fadd				;add the angle increment to the current angle
fstp cur_anglex			;notice that when mouse moves on the screen Y 2D axis
				;the OpenGL object rotates around the space X 3D axis
check_right_button:
test wparam, 2			;MK_RBUTTON = 2 ?
jz fin_test_mouse		;no right button clicked => don't bother with distance

mov eax, mouse_xy_new
and eax, 0000ffffh		;get mouse x new position
mov ebx, mouse_xy_old
and ebx, 0000ffffh		;get mouse x old position
sub eax, ebx			;get the difference in pixels
mov mouse_inc_x, eax		;store it, integer format
fild mouse_inc_x		;transform it in float format
fild mouse_sensit		;5 pixels movement = 1 unit in OpenGL space
fdiv				;reduce it
fld cur_distance		;now load the current distance
fadd				;add the distance increment to the current distance
fstp cur_distance		;and save it

fin_test_mouse:
mov eax, mouse_xy_new		;new position
mov mouse_xy_old, eax		;becomes old position

suite4:
cmp wmsg, 102h			;WM_CHAR?
jne suite5			;stuff for keyboard control

cmp wparam, " "
jne end_all_tests
xor smooth_or_flat,0ffh

end_all_tests:
xor eax, eax
jmp wndproc_end

suite5:
push lparam
push wparam
push wmsg
push hwnd    
callW DefWindowProcA

wndproc_end:
ret
wndproc          endp

;--------------------- disable OpenGL ----------------------

disable_opengl:
push 0
push 0
callW wglMakeCurrent

push theRC
callW wglDeleteContext

push theDC
push handle_wd
callW ReleaseDC

ret

;--------------------- enable OpenGL for window -----------------------------------

enable_opengl:

push handle_wd
callW GetDC
mov theDC, eax

mov pfd_nSize, DDPIXELFORMAT_struct_size
mov pfd_nVersion, 1 
mov pfd_dwFlags, 20h+1+4	;PFD_SUPPORT_OPENGL OR PFD_DOUBLEBUFFER OR PFD_DRAW_TO_WINDOW
mov pfd_dwLayerMask, 0		;PFD_MAIN_PLANE
mov pfd_iPixelType, 0		;PFD_TYPE_RGBA
mov pfd_cColorBits, 24
mov pfd_cDepthBits, 16
mov pfd_cAccumBits, 0
mov pfd_cStencilBits, 0
push offset DDPIXELFORMAT_struct
push theDC
callW ChoosePixelFormat
mov pixformat, eax

push offset DDPIXELFORMAT_struct
push pixformat
push theDC
callW SetPixelFormat		;once you call this, td32 becomes crazy?

push theDC
callW wglCreateContext
mov theRC, eax

push theRC
push theDC
callW wglMakeCurrent

;--------------------- prepare OpenGL ----------------------

push 0
push 0
push 0
push 0
callW glClearColor

push 500		;height
push 500		;width
push 0			;y
push 0			;x
callW glViewport

push p1__0
callW glClearDepth
push 0b71h		;GL_DEPTH_TEST
callW glEnable
push 203h		;GL_LEQUAL
callW glDepthFunc
push 1102h		;GL_NICEST
push 0c50h		;GL_PERSPECTIVE_CORRECTION_HINT
callW glHint
push 1d01h		;GL_SMOOTH
callW glShadeModel
push 0b44h		;GL_CULL_FACE
callW glEnable		;don't show faces when drawn ccw

push 1701h		;GL_PROJECTION
callW glMatrixMode
callW glLoadIdentity

push pp100		;zfar
push p1__0		;znear
push p0__02		;top
push m0__02		;bottom
push p0__02		;right
push m0__02		;left
callW glFrustum
push 1700h		;GL_MODELVIEW
callW glMatrixMode
callW glLoadIdentity

push offset Light_Diffuse
push 1201h			;GL_DIFFUSE
push 4000h			;GL_LIGHT0
callW glLightfv

push offset Light_Position
push 1203h			;GL_POSITION
push 4000h			;GL_LIGHT0
callW glLightfv

push 0b57h			;GL_COLOR_MATERIAL
callW glEnable

push 0ba1h			;GL_NORMALIZE let OpenGL normalize normal length (=1) 
callW glEnable			;so we don't have to do it; slower but don't care 
				;because we precalculate everything before drawing
ret

;--------------------- calculate, draw, eat cpu time... ----------------------

draw_opengl:

push 4000h+100h		;GL_COLOR_BUFFER_BIT+GL_DEPTH_BUFFER_BIT
callW glClear

;---- Draw 

callW glLoadIdentity

push cur_distance 	;translate z axis
push 0
push 0
callW glTranslatef

push 0
push 0
push p1_0		;rotate x axis
push cur_anglex
callW glRotatef
push 0
push p1_0		;rotate y axis
push 0
push cur_angley
callW glRotatef
push p1_0		;rotate z axis
push 0
push 0
push cur_anglez
callW glRotatef

push p1_0
push p1_0
push p1_0
callW glColor3f
push 0b50h		;GL_LIGHTING
callW glEnable
push 4000h		;GL_LIGHT0
callW glEnable

push 4			;GL_TRIANGLES
callW glBegin

push offset mat_Ambient
push 1200h	;GL_AMBIENT
push 404h	;GL_FRONT
callW glMaterialfv
push offset mat_Diffuse
push 1201h	;GL_DIFFUSE
push 404h	;GL_FRONT
callW glMaterialfv
push offset mat_Specular
push 1202h	;GL_SPECULAR
push 404h	;GL_FRONT
callW glMaterialfv
push offset mat_Shine
push 1601h	;GL_SHININESS
push 404h	;GL_FRONT
callW glMaterialfv

;As a reminder: we have one big table of 441 faces * 24 dd :
;
;dd index1, index2, index3
;dd x1, y1, z1
;dd x2, y2, z2
;dd x3, y3, z3
;dd normalx, normaly, normalz
;dd averagednormalx1, averagednormaly1, averagednormalz1
;dd averagednormalx2, averagednormaly2, averagednormalz2
;dd averagednormalx3, averagednormaly3, averagednormalz3

;--- Draw these fucking polygons at once

mov ecx, nb_polygons
mov esi, table_faces_normals

draw_them_all_at_once:
push ecx

;--- get everything we need in the table

add esi, 12
lodsd
mov x1, eax
lodsd
mov y1, eax
lodsd
mov z1, eax
lodsd
mov x2, eax
lodsd
mov y2, eax
lodsd
mov z2, eax
lodsd
mov x3, eax
lodsd
mov y3, eax
lodsd
mov z3, eax
lodsd
mov normal_x, eax
lodsd
mov normal_y, eax
lodsd
mov normal_z, eax
lodsd
mov anx1, eax
lodsd
mov any1, eax
lodsd
mov anz1, eax
lodsd
mov anx2, eax
lodsd
mov any2, eax
lodsd
mov anz2, eax
lodsd
mov anx3, eax
lodsd
mov any3, eax
lodsd
mov anz3, eax

;--- at least, draw the shit

cmp smooth_or_flat, 0
je smooth_shading 

;--- option1: flat shade the face

flat_shading:

; flat means one polygon = one normal

push normal_z		;use not the averaged normals at each vertex
push normal_y		;but the polygon normal => each polygon becomes
push normal_x		;very visible and flat
callW glNormal3f

;  the polygon is white

push p1_0		;Blue
push p1_0		;Green
push p1_0		;Red
callW glColor3f

; draw it, finally

push z2
push y2
push x2
callW glVertex3f
push z1
push y1
push x1
callW glVertex3f
push z3
push y3
push x3
callW glVertex3f

jmp end_smooth

;--- option2: smooth shade the face

smooth_shading:

; first vertex

fld z2			;this point has his own ghostly color dependant of coordz
fld p0_2		;add 0.2 too coord to have the Blue value
faddp			;to be a bit lighter
fstp normal_z		;no use here: tmp storage
fld x2			;etc...
fld p0_2
faddp
fstp normal_y
fld y2
fld p0_2
faddp
fstp normal_x
push anz2		;averaged normal at this point
push any2
push anx2
callW glNormal3f
push normal_z		;color of the point
push normal_y
push normal_x
callW glColor3f
push z2			;coords of the point
push y2
push x2
callW glVertex3f

; second vertex, same shit

fld z1
fld p0_2
faddp
fstp normal_z
fld x1
fld p0_2
faddp
fstp normal_y
fld y1
fld p0_2
faddp
fstp normal_x
push anz1
push any1
push anx1
callW glNormal3f
push normal_z
push normal_y
push normal_x
callW glColor3f
push z1
push y1
push x1
callW glVertex3f

; third vertex, same again

fld z3
fld p0_2
faddp
fstp normal_z
fld x3
fld p0_2
faddp
fstp normal_y
fld y3
fld p0_2
faddp
fstp normal_x
push anz3
push any3
push anx3
callW glNormal3f
push normal_z
push normal_y
push normal_x
callW glColor3f
push z3
push y3
push x3
callW glVertex3f

end_smooth:

pop ecx
dec ecx
jnz draw_them_all_at_once

callW glEnd

push theDC
callW SwapBuffers

ret

end start

;---------------------copyleft Spanska 2002-----------------------