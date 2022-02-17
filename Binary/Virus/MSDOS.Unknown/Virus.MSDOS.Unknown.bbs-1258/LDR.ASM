PAGE  59,132
; WORK-LDR.ASM
seg_a		segment	byte public
		assume	cs:seg_a, ds:seg_a
		org	100h
drive		proc	far
start:
                          jmp short lll          ;  cs:0100 EB02
CS_OFFSET       dw      0002h                                  
lll:                      mov    dx,cs
                          add    dx,CS_OFFSET    ;  cs:0106 031E0201
                          push   dx              ;  cs:010A 53
                          mov    ax,0151h        ;  cs:010B BB5101
                          push   ax              ;  cs:010E 53
                          retf                   ;  cs:010F CB
                          nop                    ;  cs:0110 90
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		int	20h
drive		endp
seg_a		ends
		end	start