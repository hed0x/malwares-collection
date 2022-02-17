;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;kernel scan functions;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; eaxapi1.inc must be included
locals @@
; ######################## get kernel ########################
; returns kernelbase and stores it in 'default' and 'kernel'
; (A) drcmda
get_kernel:
;;            Mov     ecx,[esp+4] ; get kerneladdr from stack
;		mov ecx,[esp+8]
		; get SEH address
		mov eax, fs:[0]
@@sehsearch:
		cmp dword ptr [eax].m_pSEH, -1
		jz @@sehfound
		mov eax, dword ptr [eax].m_pSEH
		jmp @@sehsearch
@@sehfound:
		mov ecx, dword ptr [eax].m_pExcFunction
		or ecx, 0000ffffh ; all PE images begin from 0000h
		inc ecx
@@kernel_loop:
		sub     ecx, 10000h
		cmp 	word ptr [ecx], 'ZM'
		jnz     @@kernel_loop
		mov     [ebp+Offset _Kernel-rec],ecx
		mov     [ebp+Offset _Default-rec],ecx
		ret

; ######################## get apis   ########################
; _Default  = dll base
; ecx       = number of api's in the structure
; esi       = pointer to structure
get_apis:
		mov dword ptr [ebp+_apifound-rec], 0
@@api_loop:
;		inc     esi         ; scan through the api
; esi -> _func...
		push    ecx         ; number of functions in table
		call    @@get_api
		pop     ecx
		cmp eax, -1
		jz	@@noapi
;		lea 	ebx, [esi+10]
;		sub 	eax, ebx
		mov     [esi+6], eax
		jmp 	@@next
@@noapi:	; если не нашли api то ставим int 3 (0CCh);retf(0CBh)
		mov 	1 ptr [esi+5], 0CCh
@@next:
		add     esi, decllen
		loop    @@api_loop
		mov eax, dword ptr [ebp+_apifound-rec]
		; return value - number of functions that have been got
		ret

_apifound	dd 0
_Kernel		dd 0
_Default	dd 0

; ######################## get api    ########################
; _Default = dll base
; esi     = structure entry
@@get_api:
		movzx   ecx, byte ptr [esi] ; len of API name
		mov     edx, [ebp+_Default-rec] ; edx->MZ-header = imagebase
		mov 	eax, edx
		add     eax, [edx+3Ch] ; eax->PE-header
		mov     edx, [eax+78H] ; RVA of export table
		add     edx, [ebp+_Default-rec]

		mov     edi, [edx+32] ;Get Addrofnames 
		add     edi, [ebp+Offset _Default-rec]
		mov     eax, [edx+24] ;Get Numberofnames
		xor     ebx,ebx
@@next_one:
		inc     ebx
		push    edi
		mov 	edi, [edi+ebx*4-4]
		add     edi, [ebp+Offset _Default-rec]; edi->name in names table
		push	ecx eax
		xor     eax, eax        ; calculate hash
@@calc_hash:
		rol     eax, 3
		xor     al, byte ptr [edi]
		inc     edi
		loop @@calc_hash

		cmp 	eax, [esi+1] ; compare with hash
		pop     eax ecx
		pop     edi
		jnz     @@not_found
		mov     ecx, [edx+36] ;Get Addrnameord
		add     ecx, [ebp+Offset _Default-rec] ; ecx->ArrayNumOfFunctions
		dec     ebx	 ; ebx=index of ArrayNumOfFunctions
		movzx   eax, word ptr [ecx+ebx*2]
		mov     ebx, [edx+28] ;Get Addroffunctions
		add     ebx, [ebp+Offset _Default-rec]
		mov     eax, [ebx+eax*4]
		add     eax, [ebp+Offset _Default-rec]
		inc dword ptr [ebp+_apifound-rec]
		ret
@@not_found:
		cmp 	ebx, eax
		jz      exit_search
		jmp     @@next_one
exit_search:
		; if function ' s not found
		push -1
		pop eax
		ret
; #######################################################

