;--------------------------------------------------------------------------;
;                            GetProcAddress                                ;
;--------------------------------------------------------------------------;
; __stdcall 
; in  :[esp + 4] = module_handle
;      [esp + 8] = ptr proc_name
; out : eax = 0 not found
;       eax   > 0 ->found   
MyGetProcAddress:       push        esi
            mov         esi, [esp + 0ch]
            call        strlen
            call        crc32
            mov         [esp + 0ch], eax
            pop         esi
        
;--------------------------------------------------------------------------;
;                           GetProcAddressCrc                              ;
;--------------------------------------------------------------------------;
; __stdcall
; in  : [esp + 4] = module_handle 
;       [esp + 8] = proc_crc
; out : eax = 0 not found
;       eax   > 0 ->found       
GetProcAddressCrc:      pusha
            mov ebx, [esp+4+32]

get_export_base:        mov         ecx, dword ptr[ebx+3Ch]           ; .mz_neptr 
                        mov         ecx, dword ptr[ecx+ebx+78h]       ; ECX=export va
                        jecxz       @return_0                         ; .pe_exporttablerva
                        add         ecx, ebx

                xor         esi, esi                      ; current index
@search_cycle:          lea         edx, [esi*4+ebx]
                        add         edx, [ecx+20h]                ; .ex_namepointersrva
                        mov         edx, [edx]                    ; name va
                        add         edx, ebx                      ; +imagebase

            push        esi
            mov         esi, edx
                        call        strlen
                        add         edx, eax
            call        crc32
            pop         esi

                        cmp         eax, [esp+8+32]               ; compare hashs
                        je          @name_found

                        inc         esi                           ; index++
                        cmp         esi, [ecx+18h]            ; .ex_numofnamepointers
                        jb          @search_cycle

@return_0:              xor         eax, eax                      ; return 0
                        jmp         @return

@name_found:            mov         edx, [ecx+24h]                ; .ex_ordinaltablerva
                        add         edx, ebx                      ; +imagebase
                        movzx       edx, word ptr [edx+esi*2]         ; edx=current ordinal
                        mov         eax, [ecx+1Ch]                ; .ex_addresstablerva
                        add         eax, ebx                      ; +imagebase
                        mov         eax, dword ptr [eax+edx*4]        ; eax=current address
                        add         eax, ebx                      ; +imagebase

@return:                mov         [esp+1Ch], eax                ; popa.eax

                        popa
                        clc
                        retn        8   
                
                    
