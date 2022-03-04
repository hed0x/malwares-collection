
include win32api.ash
include ..\ldizx.ash

include import.ash

includelib      import32.lib

LDIZX_SIZE	=	695
LDIZXI_SIZE	=	566


	.386
	.model flat
	.data
	outc	cmd<>
	.code

_start:
	int 3

	push 1000h
	push GMEM_FIXED	
	xcall GlobalAlloc

	xchg edx,eax
	push edx
	call ldizx_init
	add esp,4

	mov esi, offset ldizx		
	mov ecx,LDIZXI_SIZE
main:
	push edx			;tables
	push offset outc		;out
	push esi			;in
	call ldizx
	add esp,4*3

	inc eax
	jz error
	dec eax
	
	add esi,eax
	sub ecx,eax
	jns main	
exit:
	push edx
	xcall GlobalFree

	push 0
	xcall ExitProcess

error:
	nop
	jmp exit

include ..\ldizx.inc


_end:
end _start