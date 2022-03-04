;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
;
; Ldizx 1.01
;
; 		(c) 451 2002-03
;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

@dbp		equ	<+SIZE cmd+4*8>

@@ibufer      equ             [ebp @dbp+4]
@@obufer      equ             [ebp @dbp+8]
@@tables      equ             [ebp @dbp+12]


;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
ldizx:
                pusha
                cld

		xor ecx,ecx
                mov cl,SIZE cmd

		sub esp,ecx				; create output bufer
                mov ebp,esp

                push ecx

                xor eax,eax                             ;
                cdq                                     ; edx = eax = 0
		mov edi,ebp
                rep stosb                               ; clear output bufer

                mov esi,@@ibufer                        ; esi=input bufer

;----------------------------------------------------------------------------

@@__dizcycle:
                xor eax,eax				;
                lodsb                                   ; AL=opcode/prefix
                inc [ebp.lc_size]			; SIZE++


;° INT 20 °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

                cmp 2 ptr [esi-1],20CDh                 ; int 20h
                jne @@__gettable
                                                        ; skip all command info
		or edx,LF_RAW				; RAW disassembly
                mov [ebp.lc_size],6                     ; as operand and mask 
                jmp @@__release                         ;

;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
@@__gettable:

                mov ebx,@@tables                        ; EBX=offset to tables

                cmp al,0Fh                              ; extended command?
                jne @@__getdescriptor

                add ebx,256*2                           ; EBX=extended table
                inc [ebp.lc_size]                       ; SIZE++
                lodsb                                   ; AL=next opcode

@@__getdescriptor:

                mov ebx,[ebx+eax*2]                     ; BX=descriptor

                inc bx                                  ;
                jz @@__error                            ; BX=-1?
                dec ebx                                 ;


;° PREFIXES TEST °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
;
		test bl,LFD_PREFIX			;prefix?
		jz @@__nopx

		CMP AL,66h				;OP prefix
		jne @@__ofpx				;

		or dl,LF_POP
;----------------------------------------------------------------------------
@@__ofpx:
		CMP AL,67h				;OF prefix
		jne @@__cspx                            ;

		or dl,LF_POF
;----------------------------------------------------------------------------
@@__cspx:
		CMP AL,2Eh				;CS prefix
		jne @@__dspx                            ;

		or dl,LF_PCS
;----------------------------------------------------------------------------
@@__dspx:
		CMP AL,3Eh				;DS prefix
		jne @@__espx                            ;

		or dl,LF_PDS
;----------------------------------------------------------------------------
@@__espx:
		CMP AL,26h				;ES prefix
		jne @@__sspx                            ;

		or dl,LF_PES
;----------------------------------------------------------------------------
@@__sspx:
		CMP AL,36h				;SS prefix
		jne @@__fspx                            ;

		or dl,LF_PSS
;----------------------------------------------------------------------------
@@__fspx:
		CMP AL,64h				;FS prefix
		jne @@__gspx                            ;

		or dl,LF_PFS
;----------------------------------------------------------------------------
@@__gspx:
		CMP AL,65h				;GS prefix
		jne @@__repzpx                          ;

		or dl,LF_PGS
;----------------------------------------------------------------------------
@@__repzpx:
		CMP AL,0F3h				;REPZ prefix
		jne @@__repnzpx                         ;

		or dx,LF_PREPZ
;----------------------------------------------------------------------------
@@__repnzpx:
		CMP AL,0F2h				;REPNZ prefix
		jne @@__lockpx                          ;

		or dx,LF_PREPNZ
;----------------------------------------------------------------------------
@@__lockpx:
		CMP AL,0F0h				;LOCK prefix
		jne @@__all_px				;

		or dx,LF_PLOCK
;----------------------------------------------------------------------------
@@__all_px:

                inc [ebp.lc_psize]			; psize++
                jmp @@__dizcycle

@@__nopx:

		mov cl,bh				;
                shr cl,5                                ; CL=mask length

;° TTTN °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

                test bl,LFD_TTTN			;tttn is present?
		jz @@__opcdparts

		mov ah,al
		and ah,1111b

		mov [ebp.lc_tttn],AH
		or edx,LF_TTTN
		jmp @@mask
@@__opcdparts:
;° GET W/D/S °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
 
                mov ah,al				; AH=AL=opcode

                cmp cl,6                                ; W presents
                je @@__w7

                cmp cl,5                                ; S/D and W present
                je @@__w6

                cmp cl,4                                ; REG present
                je @@__w5

                cmp cl,3                                ; W & REG present
                jne @@mask

;----------------------------------------------------------------------------
@@__w4:
                or dx,LF_W		                ; W is PRESENT

                test al,00001000b                       ; test W
                jz @@__w5                               ;

		or dx,LF_WV				; W=1


;----------------------------------------------------------------------------
@@__w5:
                or edx,LF_REG     	                ; REG is present

                and ah,111b    	                        ; get REG
                mov [ebp.lc_reg],ah
		jmp @@mask

;----------------------------------------------------------------------------
@@__w6:

		test bl,LFD_D				; D ?
		jz  @@__wS

		or dx,LF_D				; D is present
		jmp @@__wSD
@@__wS:

		or dx,LF_S				; S is present
@@__wSD:

                test al,00000010b                       ; test S/D 
                jz @@__w7

                or dx,LF_SDV		                ; S/D = 1

;----------------------------------------------------------------------------
@@__w7:
		or dx,LF_W				; W is present

                test al,00000001b                       ; test W
                jz @@mask

                or dx,LF_WV	                        ; W=1
@@mask:

;° CREATE MASK °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
;CL=mask length

                mov ah,80h                              ;AH=10000000b
                sar ah,cl                               ;
                and al,ah                               ;AL=command mask
                xor ah,ah				;AH=0
		
		test bh,LFD_0F shr 8			;extended?
		jz @@no0f
		
		shl eax,8				;AH=comand mask
		mov al,0Fh				;AL=extended prefix

@@no0f:
                mov 2 ptr[ebp.lc_mask1],ax 		;write mask1 & mask2
;		mov [ebp.lc_dflags],bx			;write dflags

		test BL,LFD_OFF				; 
		jz @@of__noA0				;
		                                        ; A0/A1/A2/A3 ?

                lea edi,[ebp.lc_offset]
                mov eax,edi

                or edx,LF_MEM                           ;
		jmp @@__of42                            ;
@@of__noA0:


                test bh,LFD_MODRM shr 8
                jz @@__operand

;° MODRM °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

                lodsb                                   ;AL= MODR/M
                inc [EBP.lc_size]                       ;size++

                or edx,LF_MODRM
                mov [ebp.lc_modrm],al

		mov CL,AL                               ;
                mov CH,AL                               ;CH=CL=MODRM 

;------------------------------------------------------------------------------

                and al,00111000b			;
                shr al,3				;AL=R/O

		jnz @@__noF6

;° 0F6/0F7 °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

		cmp [ebp.lc_mask1],0F6h
		jne @@__noF6

		or edx,LF_OPERAND                       ; add operand

;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
@@__noF6:
                mov [ebp.lc_ro],AL

                test bh,LFD_COP_F shr 8                 ;specified r/o?
                jnz @@__rw

		or edx,LF_REG2				;r/o as register
@@__rw:
;------------------------------------------------------------------------------
;CL=MODRM
                and cx,1100000000000111b                ;CL=R/M,CH=MOD

                mov [ebp.lc_rm],CL
                mov [ebp.lc_mod],CH

                cmp ch,11000000b                        ;MOD=11 (reg<-reg/op)?
                je @@__reg1

;-----------------------------------------------------------------------------
                or edx,LF_MEM		                ;memory are used (mod=00/01/10)

                test dl,LF_POF		                ;OFFSET PREFIX (67h)?
                jz @@modrm_32

                cmp cx,110b                             ;R/M=<ESI>+ MOD=00 +<67h>?
                je @@__addoff
@@__reg1:
                or  edx,LF_REG1
                jmp @@__offset

;-----------------------------------------------------------------------------

@@__addoff:
                or edx,LF_OFFSET			;set offset flag
                jmp @@__offset				;


;-----------------------------------------------------------------------------
@@modrm_32:
                cmp cx,101b                             ;MOD=0 & R/M=101b?(no base register)
                je @@__addoff                           ;

                cmp cl,100b                             ;SIB?
                jne @@__reg1				;

;° SIB °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
@@__sib:
                lodsb                                   ;AL=SIB
                inc [EBP.lc_size]                       ;size++

;CH=MOD , CL=R/M=100b ,AL=SIB

                or  edx,LF_SIB
                mov [ebp.lc_sib],AL

;--[GET SCALE]-----------------------------------------------------------------

                push eax
                shr eax,6
                mov [ebp.lc_scale],AL
                pop eax

                mov ah,al                               ;AL=AH=SCALE|INDEX|BASE
                and ax,0000011100111000b                ;AL=INDEX
                shr al,3				;AH=BASE

                cmp ah,101b                             ;no BASE?
                jne @@__sib_base			;

                or ch,ch                                ;MOD=0?
                jnz @@__sib_base

                or  edx,LF_OFFSET	                ;MOD=00 => DWORD offset
                jmp @@__sib_index			;NO base

@@__sib_base:

                or  edx,LF_BASE
                mov [ebp.lc_base],AH                    ;save BASE

@@__sib_index:
                cmp al,100b                             ;NO INDEX ?
                je @@__offset

                or  edx,LF_INDEX
                mov [ebp.lc_index],AL


;° OFFSET °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
@@__offset:
;CH=MOD, CL=R/M
                lea edi,[ebp.lc_offset]
                mov eax,edi

                test edx,LF_OFFSET                      ;SIB+EBP/MODRM+EBP/67h+ESI?
                jnz @@__of42                            ;

                cmp ch,01000000b                        ;BYTE
                je @@__of1

                cmp ch,10000000b                        ;DWORD/WORD
                jne @@__operand

@@__of42:
                test dl,LF_POF				;67h ?
                jnz @@__of2

		movsw
@@__of2:
                movsb
@@__of1:
                movsb

                sub edi,eax
                xchg edi,eax                            ;eax=offset size
                add [ebp.lc_size],AL
                mov [ebp.lc_soffset],AL

                or edx,LF_OFFSET

;° OPERAND °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
@@__operand:
                lea edi,[ebp.lc_operand]
                mov ecx,esi

                test edx,LF_OPERAND	                ;0F6/0F7?
                jnz  @@_opW

;-----------------------------------------------------------------------------

                and BL,LFD_OP_VX                        ; operand ?
                jz @@__release                          ;

;-----------------------------------------------------------------------------

                cmp BL,LFD_OP_V1	                ; 1
                je @@__op1                              ;
		
		cmp BL,LFD_OP_V2			; 2
		je @@__op2                              ;

		cmp BL,LFD_OP_V3			; 
		jne @@__optest6				;
		                                        ; 3
                movsb                                   ;
                jmp @@__op2                             ;
@@__optest6:
;-----------------------------------------------------------------------------
		cmp BL,LFD_OP_V6			;
		jne @@__optest_42                       ;
		                                        ; 6
                movsd                                   ;
                jmp @@__op2                             ;

@@__optest_42:
;-----------------------------------------------------------------------------

                cmp BL,LFD_OP_V4	                ; 4
                je @@__op42                             ;

;-----------------------------------------------------------------------------
; VX : Undefined operand (explore W bit)

                ;W = 0  byte operand
                ;W = 1  dword/word operand

		test dx,LF_S
		jz @@_opW

		test dx,LF_SDV				;  S = 1 ?
		jnz @@__op1
@@_opW:

;-----------------------------------------------------------------------------

                test dx,LF_WV
                jz @@__op1

@@__op42:
                test DL,LF_POP				; 66?
                jnz @@__op2
@@__op4:
                movsw
@@__op2:
                movsb
@@__op1:
                movsb
@@__opsize:
		xchg esi,ecx
                sub ecx,esi				; ECX =size

                add [ebp.lc_size],CL
                mov [ebp.lc_soperand],CL

                or edx,LF_OPERAND

;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

@@__release:
                mov [ebp.lc_flags],edx
		movzx eax,[ebp.lc_size]
@@__exit:
		pop ecx                                 ; SIZE cmd
		add esp,ecx

		mov esi,ebp				; local bufer

		mov edi,@@obufer
		or edi,edi
		jz @@__outsize
	
		rep movsb
@@__outsize:
                mov [esp._eax],eax
                popa
                ret
@@__error:
                xor eax,eax				;
                dec eax                                 ; EAX = FFFFFFFFh
                jmp @@__exit                            ;


