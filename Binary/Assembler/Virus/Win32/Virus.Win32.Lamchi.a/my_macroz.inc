@pushvar	macro	variable, empty
	local   next_instr
	ifnb <empty>
	%out too much arguments in macro '@pushvar'
	.err
	endif
	call next_instr
	variable
next_instr:
endm

@messagebox	macro	message, empty
	ifnb <empty>
	%out too much arguments in macro '@pushvar'
	.err
	endif

        push 0
	@pushsz "Debug"
	@pushsz <message>
	push 0
	call MessageBoxA
endm

calle	macro	api
	extrn	api:PROC
	call	api
endm

@gimme_delta	macro
	local	gimme_delta
        call gimme_delta
gimme_delta:
	mov esi, esp
        lodsd
        sub eax, offset gimme_delta
	xchg eax, ebp
        mov esp, esi
endm

calla	macro	api
	call	dword ptr [ebp+api]
endm
