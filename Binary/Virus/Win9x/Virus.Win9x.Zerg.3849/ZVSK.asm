   key_esc         equ     011bh

   infected_sign   =       'DS'
   vir_file_size   equ     1

   include         dos.inc
   include         Zerg.inc


                   .model  tiny
                   .386
                   .code
                   org     100h
   start:
                   mov     dx,offset start_msg
                   call    print

                   mov     si,81h
                   mov     di,offset findpath

                   cld
   sl1:            lodsb
                   cmp     al,' '
                   je      sl1
                   cmp     al,0dh
                   je      usage

                   cmp     al,'/'
                   jne     sl3
                   lodsb
                   cmp     al,0dh
                   je      usage
                   or      al,20h
                   cmp     al,'k'
                   jne     usage
                   inc     byte ptr ds:kill_flag
   sl2:            lodsb
                   cmp     al,0dh
                   je      usage
                   cmp     al,' '
                   je      sl2

   sl3:            cmp     al,0dh
                   je      sl5
                   cmp     al,'a'
                   jb      sl4
                   cmp     al,'z'
                   ja      sl4
                   and     al,not 20h
   sl4:            stosb
                   lodsb
                   jmp     sl3
   sl5:            xor     al,al
                   stosb

                   call    get_cursor
                   push    cx
                   and     ch,10011111b
                   or      ch,00100000b
                   call    set_cursor

                   mov     dx,offset key_msg
                   call    print
                   mov     dx,offset findpath
                   call    finds
                   mov     dx,offset space_msg
                   call    print
                   cmp     byte ptr ds:exitflag,0
                   je      normal_quit
                   mov     dx,offset esc_msg
                   call    print
   normal_quit:    mov     dx,offset done_msg
                   call    print

                   pop     cx
                   call    set_cursor
                   int     20h

   usage:          mov     dx,offset usage_msg
                   call    print
                   int     20h

   exitflag        db      0
   kill_flag       db      0
   dotdot          db      ' ........ ',0
   found_msg       db      0dh,0ah,'   [Found Virus]',0
   kill_msg        db      ' .......... [Killed ^_^]',0
   crlf            db      0dh,0ah,0
   space_msg       db      0dh,79 dup(' '),0dh,0
   esc_msg         db      'Program Quited by User.',0dh,0ah,0
   done_msg        db      0dh,0ah,'Scan Done.',0dh,0ah,0
   start_msg       db      0dh,0ah
                   db      '[ZVSK v0.1 beta] - Zerg Virus Scanner and Killer',0dh,0ah
                   db      '             by Dark Slayer in Keelung, Taiwan (ROC)'
                   db      0dh,0ah,0dh,0ah,0

   usage_msg:
   db '  Usage:   ZVSK [switche] [drive:][path]',0dh,0ah
   db '  Switche: /K   Kill virus if found',0dh,0ah,0dh,0ah
   db '  Example: ZVSK C:\WINDOWS     (Scan Virus in C:\WINDOWS\*.*)',0dh,0ah
   db '           ZVSK /K D:          (Scan and Kill virus in D:\*.*)',0dh,0ah,0

   key_msg         db      'Press [ESC] to Quit this program.',0dh,0ah,0

   finds:          ; ds:dx = file path
                   mov     ah,2fh
                   int     21h
                   push    bx
                   sub     sp,2ch
                   mov     ah,1ah
                   mov     si,dx
                   mov     dx,sp
                   int     21h
                   mov     dx,si
   fl1:            lodsb
                   or      al,al
                   jnz     fl1
                   mov     bp,si
                   mov     word ptr ds:[si-1],'*\'
                   mov     word ptr ds:[si-1+2],'*.'
                   mov     byte ptr ds:[si-1+4],0

                   mov     ah,4eh
                   mov     cx,1+2+4+10h
                   cmp     ax,0
                   org     $-2
   findnext:       mov     ah,4fh
                   int     21h
                   jnc     fl2
   findexit:       add     sp,2ch
                   mov     ah,1ah
                   pop     dx
                   int     21h
                   ret

   fl2:            cmp     byte ptr ds:exitflag,0
                   jne     findexit
                   mov     ah,1
                   int     16h
                   jz      nokey
                   xor     ax,ax
                   int     16h
                   cmp     ax,key_esc
                   jne     nokey
                   inc     byte ptr ds:exitflag
                   jmp     findexit

   nokey:          mov     si,sp
                   cmp     byte ptr ds:find_name[si],'.'
                   je      findnext
                   add     si,offset find_name
                   mov     di,bp
                   mov     cx,8+1+3+1
                   rep     movsb
                   mov     si,sp
                   test    byte ptr ds:find_attr[si],10h
                   jz      itsfile
                   push    bp
                   mov     dx,offset findpath
                   call    finds
                   pop     bp
                   jmp     findnext
   itsfile:        mov     si,bp
   fl3:            lodsb
                   or      al,al
                   jnz     fl3
                   lea     di,[si-1]
                   mov     cx,offset findpath+79
                   sub     cx,di
                   jae     fl4

                   xor     ax,ax
                   xchg    al,ds:findpath[30]
                   mov     dx,offset findpath
                   call    print
                   mov     ds:findpath[30],al
                   mov     dx,offset dotdot
                   call    print
                   lea     dx,[di-39]
                   jmp     fl5

   fl4:            mov     al,' '
                   rep     stosb
                   mov     dx,offset findpath
   fl5:            mov     ax,0dh
                   stosw
                   call    print
                   mov     byte ptr ds:[si-1],0
                   call    CleanFile
                   mov     al,0dh
                   int     29h
                   jmp     findnext

   ; dx = offset msg
   print:          push    ax si
                   mov     si,dx
                   cld
   print_loop:     lodsb
                   or      al,al
                   jz      print_exit
                   int     29h
                   jmp     print_loop
   print_exit:     pop     si ax
                   ret

   ; return cx = cursor value
   get_cursor:     push    ax bx dx
                   mov     ah,3
                   xor     bx,bx
                   int     10h
                   pop     dx bx ax
                   ret

   ; cx = cursor value
   set_cursor:     push    ax
                   mov     ah,1
                   int     10h
                   pop     ax
                   ret


   CleanFile:      pusha
                   push    ds es
                   call    CheckFile
                   or      ax,ax
                   jz      CleanFileExit
                   mov     dx,offset found_msg
                   call    print
                   cmp     byte ptr ds:kill_flag,0
                   je      CleanFileExit_

                   mov     ax,4300h
                   mov     dx,offset findpath
                   int     21h
                   jc      CleanFileExit_
                   mov     ds:file_attr,cx

                   test    cx,FILE_ATTRIBUTE_READONLY
                   jz      CleanFileOpen

                   mov     ax,4301h
                   xor     cx,cx
                   int     21h
                   jc      CleanFileExit_

   CleanFileOpen:  mov     ax,3d00h + (ACCESS_WRITEONLY or SHARE_DENYNONE)
                   int     21h
                   jc      RestoreFileAttr
                   xchg    bx,ax

                   mov     ax,5700h
                   int     21h
                   jc      CleanFileClose
                   mov     ds:FileTime,cx
                   mov     ds:FileDate,dx

                   mov     si,offset hostdata.eh_st
   CleanFileLoop:  cmp     ds:[st ptr si.st_size],0
                   je      SetFileSize
                   mov     ax,4200h
                   mov     dx,word ptr ds:[st ptr si.st_pt]
                   mov     cx,word ptr ds:[st ptr si.st_pt+2]
                   int     21h
                   jc      RestoreDateTime

                   mov     ah,40h
                   mov     cx,ds:[st ptr si.st_size]
                   lea     dx,[si+size st]
                   int     21h
                   jc      RestoreDateTime
                   cmp     ax,cx
                   jne     RestoreDateTime

                   add     si,cx
                   add     si,size st
                   jmp     CleanFileLoop

   SetFileSize:    mov     ax,4200h
                   mov     dx,word ptr ds:hostdata.FileSize
                   mov     cx,word ptr ds:hostdata.FileSize[2]
                   int     21h
                   jc      RestoreDateTime

                   mov     ah,40h
                   xor     cx,cx
                   int     21h
                   jc      RestoreDateTime
                   or      ax,ax
                   jnz     RestoreDateTime

                   mov     ax,5701h
                   mov     cx,ds:FileTime
                   mov     dx,ds:FileDate
                   int     21h
                   jc      CleanFileClose

   CleanFileMsg:   mov     dx,offset kill_msg
                   call    print

   RestoreDateTime:mov     ax,5701h
                   mov     cx,0
   FileTime        equ     word ptr $-2
                   mov     dx,0
   FileDate        equ     word ptr $-2
                   int     21h

   CleanFileClose: mov     ah,3eh
                   int     21h

   RestoreFileAttr:mov     ax,4301h
                   mov     cx,0
   file_attr       equ     word ptr $-2
                   test    cx,FILE_ATTRIBUTE_READONLY
                   jz      CleanFileExit_
                   int     21h

   CleanFileExit_: mov     dx,offset crlf
                   call    print
   CleanFileExit:  pop     es ds
                   popa
                   ret

   CheckFile:      push    bx cx dx si di bp
                   push    ds es

                   mov     word ptr ds:infected_flag,0

                   mov     ax,3d00h + (ACCESS_READONLY or SHARE_DENYNONE)
                   mov     dx,offset findpath
                   int     21h
                   jc      CheckFileExit
                   xchg    bx,ax

                   mov     ah,3fh
                   mov     cx,size eh
                   mov     dx,offset hostdata.eh
                   int     21h

                   mov     si,dx
                   cmp     ds:[eh ptr si.eh_checksum],infected_sign
                   jne     CheckFileClose

                   mov     ax,4202h
                   mov     cx,-1
                   mov     dx,-(size hostdata)
                   int     21h
                   jc      CheckFileClose

                   mov     ah,3fh
                   mov     cx,size hostdata
                   mov     dx,offset hostdata
                   int     21h
                   jc      CheckFileClose
                   cmp     ax,cx
                   jne     CheckFileClose

                   mov     si,dx
                   cmp     ds:[hostdata ptr si.InfectedSign],infected_sign
                   jne     CheckFileClose

                   inc     word ptr ds:infected_flag

   CheckFileClose: mov     ah,3eh
                   int     21h
   CheckFileExit:  pop     es ds
                   pop     bp di si dx cx bx
                   mov     ax,0
   infected_flag   equ     word ptr $-2
                   ret

   hostdata        host_data ?
   findpath        db      1024 dup(?)

                   end     start
