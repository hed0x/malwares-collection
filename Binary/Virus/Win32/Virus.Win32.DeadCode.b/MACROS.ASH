;
calc_xsize	macro param
		xsize=0

		irpc _xs,<param>
			xsize=xsize+1	
		endm
		endm

;
stosx		macro param

		local value,ex,t

			value=0
			ex=0
			calc_xsize

        	        irpc _c,<param>
				t='&_c'

				if t eq '#'			;;null
				 t=0
				endif 

				if t eq '~'                     ;;cr
				 t=0dh
				endif 

				if t eq '|'                     ;;lf
				 t=0ah
				endif 

				value=value or (t shl (8*ex))
				ex=ex+1

				if ex eq 4
					xsize=xsize+4
					mov eax,value
					stosd
					value=0
					ex=0
				endif

			endm

				if ex eq 1
					xsize=xsize+1
					mov al,value
					stosb
				elseif ex eq 2
 					xsize=xsize+2
					mov ax,value
					stosw
				elseif ex eq 3
 					xsize=xsize+3
					mov ax,(value and 00ffffh)
					stosw
					mov al,((value and 0ff0000h) shr 16)
					stosb
				endif
			endm

;
pushx			macro 	param
	local i,t,m,j
			calc_xsize param
;;			mov eax,xsize

			j=xsize/4
			i=j

			if (xsize MOD 4) ne 0
				i=i+1
				j=j+1
			endif

			i=i-1
			xsize=0
			rept j
                       	     	value=0 			;;push value
			     	m=0     			;;pos index
			     	ex=0    			;;4 loop index
				irpc _cs,<param>
			        	if m ge (i*4)
						t='&_cs'

					     	if t eq '#'	;;null
						 t=0
						elseif t eq '~' ;;cr
						 t=0Dh
						elseif t eq '|' ;;lf
						 t=0Ah
						elseif t eq '^' ;;space
						 t=20h
						endif 
						
						value=value or (t shl (8*ex))
						ex=ex+1

						if ex eq 4
						 xsize=xsize+4
						 push value		
						 exitm
						endif
					endif
					m=m+1
			    	endm

				if (ex ne 4) AND (ex ne 0)
        				 	xsize=xsize+4
					 	push value		
				endif
		
			i=i-1	
			endm
		
			endm

;

ps			STRUC
			_edi		DD	?
			_esi		DD	?
			_ebp		DD	?
			_esp		DD	?
			_ebx		DD	?
			_edx		DD	?
			_ecx		DD	?
			_eax		DD	?
ps			ENDS

;
pusho			macro	x
			local a
			call a
			jmp x
a:
			endm

ascii_size	macro	x

		db 10,13,10,13,10,13, 'лллллллллллллллллллллллл',10,13
		db 'Х SIZE Х'
		db x/1000 MOD 10 +'0'
		db x/100  MOD 10 +'0'
		db x/10   MOD 10 +'0'
		db x/1    MOD 10 +'0'
		db ' BYTES =',10,13
		db 'лллллллллллллллллллллллл',10,13,10,13,10,13


		endm
;
ntadd		macro	x
                add esp,((x)/4+1)*4
		endm

;
ntsub		macro	x
                sub esp,((x)/4+1)*4
		endm

