
ltmedata	struc

		ltmed_desc		cmd<>
		ltmed_command 	 	db 	23 dup (?)
		ltmed_link	 	dd 	?
		ltmed_label	   	dd	?
		ltmed_flags		db      ?
		ends


LTMED_EXTERNAL	equ	00000001b

;-----------------------------------------------------------------------------

one		struc
		one_next	dd		?
		one_prev	dd		?
		one_data	ltmedata	<>
		ends


;-----------------------------------------------------------------------------
list_header 	struc
		list_first	dd		?
		list_last	dd		?
		list_mem	dd		?
		list_bufer	dd		?
		ends

;-----------------------------------------------------------------------------


ONEDATA_SIZE	equ	<SIZE ltmedata>
