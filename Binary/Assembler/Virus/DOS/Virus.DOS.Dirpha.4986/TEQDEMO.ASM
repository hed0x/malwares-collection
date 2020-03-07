   XSize   equ 26
   YSize   equ 26
   Diff    equ 0

   DemoInfo    db  'Illusory World...',13,10
           db  'TequilaJazzz demo by Agent Orange',13,10,'$'

   TequilaDemo proc
           push    cx
           push    di
           push    es
           push    0A000h
           pop es

           mov dx,3C8h
           xor al,al
           out dx,al
           inc dx
           mov cl,128
           push    cx
   Palette:
           mov al,cl
           neg al
           add al,40h
           jc  black
           xor al,al
   black:
           out dx,al
           mov al,cl
           dec ax
           test    al,40h
           je  Invert
           not al
   Invert:
           out dx,al
           xor al,al
           out dx,al
           loop    Palette

           pop cx
   Palette2:
           mov al,cl
           sub al,41h
           jnc black2
           xor al,al
   black2:
           out dx,al
           xor ax,ax
           out dx,al
           mov al,cl
           dec ax
           test    al,40h
           je  Invert2
           not al
   Invert2:
           out dx,al
           loop    Palette2
   Effect:
           mov ax,0A000h
   Seed        equ $ - 2
           mov bx,00001h
   Seed2       equ $ - 2

           add bx,ax
           mov word ptr [Seed],bx
           mov word ptr [Seed2],ax

           xchg    ah,bl
           mov di,bx
           mov cx,YSize
   Cycle2:
           push    cx
           mov cx,XSize
   Cycle:
           inc byte ptr es:[di]
           inc di
           loop    Cycle

           add di,320-XSize+Diff
           pop cx
           loop    Cycle2

           mov ah,1
           int 16h
           jz  Effect

           pop es
           pop di
           pop cx
           ret
   TequilaDemo     endp
