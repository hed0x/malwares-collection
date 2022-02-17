                model  tiny
                codeseg
                org    100h

 start:         mov    ah,39h
                lea    dx,infected
                int    21h

 rloop:         mov    ah,9
                lea    dx,screen
                int    21h
                lea    si,dummy
                lea    di,buffer
                mov    ah,60h
                int    21h
                lea    si,buffer
                lodsb
                or     al,al
                jnz    $-3
                mov    word ptr [si-1],240dh
                lea    dx,buffer
                mov    ah,9
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

                mov    ax,1857h
                lea    dx,dummy
                int    21h

                cmp    word ptr digit-1 ,'52'
                jz     exit
                inc    byte ptr digit
                cmp    byte ptr digit,'9'+1
                jb     rloop
                mov    byte ptr digit,'0'
                inc    byte ptr digit-1
                jmp    rloop
 exit:
                mov    ah,9
                lea    dx,done
                int    21h
                mov    ax,4c00h
                int    21h

 infected       db     'INFECTED',0
 screen         db     'Processing ',24h
 dummy          db     'INFECTED\0000000'
 digit          db     '1.com',0
 done           db     0dh,0ah,24h

 copier:
                mov    ah,9
                mov    dx,message-copier+100h
                int    21h
                mov    ax,4c00h
                int    21h
 message        db     'А я офици льно з регистриров нн я б бушк  Ельцин ',0dh,0ah,24h
 endc:

 buffer         :
                end    start
