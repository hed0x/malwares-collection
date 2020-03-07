                   model  tiny
                   codeseg
                   org    100h

    start:         mov    ah,39h
                   lea    dx,infected
                   int    21h

    rloop:         mov    ah,9
                   lea    dx,screen
                   int    21h

                   mov    ah,3ch
                   mov    cx,20h
                   lea    dx,dummy
                   int    21h
                   xchg   ax,bx
                   mov    ah,40h
                   mov    cx,endc-copier
                   lea    dx,copier
                   int    21h
                   mov    ax,5701h
                   mov    cx,1010h
                   mov    dx,1010h
                   int    21h
                   mov    ah,3eh
                   int    21h

                   mov    ax,4300h
                   lea    dx,dummy
                   int    21h

                   inc    byte ptr dummy+10
                   cmp    byte ptr dummy+10,'Z'+1
                   jb     rloop
                   mov    byte ptr dummy+10,'A'
                   inc    byte ptr dummy+9
                   cmp    byte ptr dummy+9,'Z'+1
                   jb     rloop
                   mov    ah,9
                   lea    dx,done
                   int    21h
                   mov    ax,4c00h
                   int    21h

    infected       db     'Infected',0
    screen         db     'Generating files ... '
    dummy          db     'Infected\AA.com',0,0dh,24h
    done           db     'Generating files ... '
                   db     'Done.                ',0dh,0ah,24h

    copier:
                   mov    ah,9
                   mov    dx,message-copier+100h
                   int    21h
                   mov    ax,4c00h
                   int    21h
    message        db     '€ ï ®ä¨æ¨ «ì® § à¥£¨áâà¨à®¢  ï ¡ ¡ãèª  …«ìæ¨ ',0dh,0ah,24h

    endc:          end    start
