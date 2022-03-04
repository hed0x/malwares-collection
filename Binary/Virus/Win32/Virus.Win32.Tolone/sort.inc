
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;
; Shall sort
;
; ESI = bufer
; ECX = element count
;
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
shsort:
		pusha

		mov edi,ecx				; h=n/2
		shr edi,1				;

		dec ecx					; bound = n-1
		jz shsort_exit

;------------------------------------------------------------------------------
shsort_h:
		mov edx,edi				; EDX=i  =h

;------------------------------------------------------------------------------
shsort_i:
		mov ebx,edx                             ; EBX=j  =i-h
		sub ebx,edi				;

;------------------------------------------------------------------------------
shsort_j:
                lea ebp,[ebx+edi]			; 
		lea ebp,[esi+ebp*4]			; m[j+h]
		mov eax,[ebp]                           ;

		cmp eax,[esi+ebx*4]			; m[j+h]<m[j] ?
		jae shsort_nexti

		mov eax,[ebp]				;
		xchg [esi+ebx*4],eax			; m[j]=m[j-h] t=m[j]
		mov [ebp],eax				; m[j-h]=t

shsort_nextj:
		sub ebx,edi
 		jns shsort_j

;------------------------------------------------------------------------------

shsort_nexti:
		inc edx
		cmp edx,ecx
		jna shsort_i

;------------------------------------------------------------------------------

		shr edi,1
		jnz shsort_h
shsort_exit:
		popa
		ret

comment ~
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;
; SORT
;
; ESI = bufer
; ECX = element count
;
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
sortd:
		pusha

		dec ecx
		jz sort_exit
		
		; ECX = i
sortd_main:
		mov eax,ecx
		dec eax					; j=i-1

sortd_compare:
		lea edi,[esi+ecx*4] 			; m[i]
		lea edx,[esi+eax*4]                     ; m[j]

		mov ebx,[edi]				; m[i]
		cmp [edx],ebx				; m[j]
		jbe sortd_next
                              
		xchg ebx,[edx]				; t=m[j] , m[j]=m[i]
		mov [edi],ebx				; m[i] = t
sortd_next:
		dec eax					; j--
		jns sortd_compare                       ;

		dec ecx                                 ; i--
		jnz sortd_main                          ;

sort_exit:
                popa
                ret
~