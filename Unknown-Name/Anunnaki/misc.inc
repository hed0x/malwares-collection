            assume ebp:ptr vars
;---------------------------------------------------------------------------;
;                           convert VA to RAW                               ;
;---------------------------------------------------------------------------;
; in  : eax = VA 
; out : eax = RAW       
VaToRaw:        push ebx
            push ecx
            push edx
        
            mov ecx,dword ptr [ebp].ptr_opt_header 
            sub eax,dword ptr [ecx + 28] ; sub IMAGE_BASE
        
rvatoraw :      mov ebx,dword ptr [ebp].ptr_sect_headers
            assume ebx:ptr IMAGE_SECTION_HEADER
            mov ecx,dword ptr [ebp].number_of_sect
        
            ; find the section to which RVA is pointing
try_next_sect:      mov edx,dword ptr [ebx].VirtualAddress
            cmp eax,edx
            jb range_error
            add edx,dword ptr [ebx].Misc.VirtualSize
            cmp eax,edx
            jb found_sect
            add ebx,sizeof IMAGE_SECTION_HEADER
            loop try_next_sect
                
range_error:        xor eax,eax         
            jmp convert_finish
                
found_sect:     sub eax,dword ptr [ebx].VirtualAddress
            add eax,dword ptr [ebx].PointerToRawData
            add eax,dword ptr [ebp].ptrMappedImage
                
convert_finish:     pop edx
            pop ecx
            pop ebx
            ret
;---------------------------------------------------------------------------;
;                          convert RVA to RAW                   ; 
;---------------------------------------------------------------------------;
; in  : eax = RVA
; out : eax = RAW 
RvaToRaw:       push ebx
            push ecx
            push edx
            jmp rvatoraw
;---------------------------------------------------------------------------;
;                          convert Raw to VA                    ; 
;---------------------------------------------------------------------------;
; in  : eax = RAW
; out : eax = VA
RawToVa:        push ebx
            push ecx
            push edx
 
            mov ebx,dword ptr [ebp].ptr_sect_headers
            sub eax,dword ptr [ebp].ptrMappedImage

_try_next_sect:     mov edx,dword ptr [ebx].PointerToRawData
            cmp eax,edx
            jb _range_error
            add edx,dword ptr [ebx].SizeOfRawData
            cmp eax,edx
            jb _found_sect  
            add ebx,sizeof IMAGE_SECTION_HEADER
            loop _try_next_sect
                    
_range_error:       xor eax,eax
            jmp _convert_finish
                
_found_sect:        sub eax,dword ptr [ebx].PointerToRawData
            add eax,dword ptr [ebx].VirtualAddress
            mov ecx,dword ptr [ebp].ptr_opt_header ; add IMAGE_BASE
            add eax,dword ptr [ecx + 28]
                
_convert_finish:    pop edx
            pop ecx
            pop ebx
            retn
            
;---------------------------------------------------------------------------;
;                 Align                     ;
;---------------------------------------------------------------------------; 
;In: eax=ValueToAlign ecx=AlignFactor
;Out: eax=AlignedValue
AlignVal:       push    edx
            push    ecx
            xor     edx,edx                 ; Make edx zero
            push    eax
            div     ecx                     ; Div eax with ecx align factor
            pop     eax
            sub     ecx,edx                 ; Add to eax the rest to have
            add     eax,ecx                 ;  an aligned value
            pop     ecx 
            pop     edx
            retn
;---------------------------------------------------------------------------;
;           Get raw address of last section header                  ;
;---------------------------------------------------------------------------;
; in  : eax = ptr mapped_image               
; out : eax = ptr last section header 
get_last_sec:       push ebx
            push ecx
            add eax, dword ptr[eax + 3ch]
            add eax, 4                     ; IMAGE_NT_HEADER
            mov ebx, eax
            xor ecx, ecx
            mov cx,  word ptr [eax + 2]    ; number of sections 
            add ax,  word ptr [eax + 16]   ; sizeof optional header 
            add eax, 20                    ; sizeof image_nt_header
            dec ecx
            imul ecx,40                    ; sizeof section header 
            add eax, ecx                   ; eax: ptr last section
            pop ecx
            pop ebx  
            retn
                    
;---------------------------------------------------------------------------;
;                  Count file checksum                  ; 
;---------------------------------------------------------------------------;
;  eax = mapped_image (raw)
;  ecx = image_size   (raw) 
Checksum_File:      pushad 
            
            ; alloc HeaderSum
            push eax
            mov ebx,esp
            
            ; alloc Checksum
            push eax
            mov esi,esp
                
            ; make arguments for api call 
            push esi ; PDWORD CheckSum
            push ebx ; PDWORD HeaderSum
            push ecx ; DWORD FileLength
            push eax ; PVOID BaseAddress  
                
            push_sz <Imagehlp\000>
            push esp 
            call dword ptr [ebp].aLoadLibrary
            add esp,12
            test eax,eax
            jz Checksum_err
                
            push_sz <CheckSumMappedFile\000\000>
            push esp
            push eax 
            call MyGetProcAddress
            add esp,6*4
            test eax,eax
            jz Checksum_err
                
            call eax ; call CheckSumMappedFile
                
            test eax,eax ; did call succeed ?
            jz @f  
            mov eax,dword ptr [esi]
            
@@:         add esp,8 ; clean locals
            mov dword ptr [esp + 1ch],eax ; save eax  
            popad 
            retn
                
Checksum_err:       add esp,16 ; clean prepared arguments
            xor eax,eax
            jmp @b 
                
                
                
                    
                    
                                    
                
