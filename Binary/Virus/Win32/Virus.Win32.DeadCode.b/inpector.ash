ltmeparam		struc
			build_size	dd	?		; rebuilded code size
			build_offset	dd	?               ; rebuilded code offset

			mixer_maxswp 	dd	?		; maximup blocks swap

;-----------------------------------------------------------------------------
						
			x_imagebase	dd	?
			x_RVA		dd	?

			x_importn	dd	?
			x_tlsCallback	dd	?


			x_fixup		dd	?
			x_fixupSize	dd	?

			x_importSn	dd	?
		ends