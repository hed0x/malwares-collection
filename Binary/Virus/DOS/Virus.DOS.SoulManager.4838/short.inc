   .xlist

   dwo     equ dword ptr
   wo      equ word ptr
   by      equ byte ptr
   ofs     equ offset
   L       equ <large>
   S       equ <small>

   BIT     equ 1 SHL

   ;---------------------------------
   sDWORD      STRUC

           wLO dw  ?
           wHI dw  ?

   sDWORD      ENDS

   ;---------------------------------
   sWORD       STRUC

           bLO db  ?
           bHI db  ?

   sWORD       ENDS

   ;---------------------------------
   STO_W       MACRO   xx

           mov ax,xx
           stosw

           ENDM

   ;----------------------------------
   STO_B       MACRO   xx

           mov al,xx
           stosb

           ENDM

   ;---------------------------------
   OUTB        MACRO   p,v

           mov al, &v
           out &p, al

           ENDM

   ;---------------------------------
   OUTW        MACRO   p,v

           mov ax, &v
           out &p, ax

           ENDM

   ;---------------------------------
   ENABLE      MACRO   COND

           COND = 1

           ENDM

   ;---------------------------------
   DISABLE     MACRO   COND

           ENDM

   ;---------------------------------
   max     MACRO   o,l
           local   j1

           cmp o,l
           jbe j1
           mov o,l
       j1:
           ENDM

   ;---------------------------------
   min     MACRO   o,l
           local   j1

           cmp o,l
           jae j1
           mov o,l
       j1:
           ENDM

   ;---------------------------------
   dbw     MACRO   b,w

           db  b
           dw  w

           ENDM

   ;---------------------------------
   mvs     MACRO   dest, src

           push    &src
           pop &dest

           ENDM

   ;---------------------------------
   limit       MACRO   dest, cond, src
           local j1

           cmp dest,src
           j&cond  j1
           mov dest,src
       j1:
           ENDM

   ;---------------------------------
   PLABEL      MACRO   name

           &name   LABEL
           PUBLIC  &name

           ENDM

   .list
