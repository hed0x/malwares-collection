
getcrc		macro param
		local crc,a

		crc=0
		irpc _byte,<param>
		_byte='&_byte&'
			rept 8
				a=(crc and 80000000h)           ;; a=high bit
				crc=(crc shl 1)                 ;; shift crc<<

				_byte=(_byte shl 1)             ;; move byte
				crc = (crc xor (_byte and 100000000b) shr 8)
                                                                ;; if high bit=1
				if a eq 80000000h
				   crc=(crc xor 04C11DB7h)
				endif

			endm 
		endm
				;;add null bites
                                rept 32

				a=(crc and 80000000h)           ;; a=high bit
				crc=(crc shl 1)                 ;; shift crc<<

				if a eq 80000000h		;; if high bit=1
				   crc=(crc xor 04C11DB7h)
				endif
				
				endm

		xcrc32=crc
 		endm


kernelCall	macro   x
		call seh_fkernel
                getcrc x

 		push eax                                        ; kernel adress
		push xcrc32					; crc
		call osimport

		call eax
		endm

