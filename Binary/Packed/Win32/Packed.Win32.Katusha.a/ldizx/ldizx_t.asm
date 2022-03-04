include ldizx.ash

SIGN1			equ	'SBGN'
SIGN2			equ	'SEND'

	.586p
	.model flat
	.data
	.code
_start:
	ret

db SIGN1	
	include src\ldizxt.inc
db SIGN2

end	_start
