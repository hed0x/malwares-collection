.model tiny
.code ; by The Spy
     org 100h
five_damn_bytes:
     lea si,play
     lea di,stop
play:
     mov cx,stop-play
     rep movsb
stop:
end five_damn_bytes
