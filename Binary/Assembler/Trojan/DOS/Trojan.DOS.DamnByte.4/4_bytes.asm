.model tiny
.code ; by The Spy
	org 100h
four_damn_bytes:
	lea si,play
	lea di,stop
	xor cx,cx
play:
	mov cl,stop-play
	rep movsb
stop:
end four_damn_bytes
