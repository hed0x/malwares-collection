   ; RXIO
   ; ~~~~
   ; - universal r0/r3 io

   include                 loader.inc
   include                 r0io.inc
   include                 r3io.inc

   include                 plugin.inc
                           PLUGIN_START    RXIO, CODE32, PERMUTABLE

   dispatch                macro   x
                           hookevent EV_&x, x
                           endm

   handleevent:            dispatch rx_fcreate        ; EDX=filename  :CF,EAX=handle/errorcode
                           dispatch rx_fopen_rw       ; EDX=filename  :CF,EAX=handle/errorcode
                           dispatch rx_fopen_ro       ; EDX=filename  :CF,EAX=handle/errorcode
                           dispatch rx_fclose         ; EBX=handle
                           dispatch rx_fread          ; EDX=buf,ECX=size,ESI=filepos,EBX=handle  :CF,EAX=numread
                           dispatch rx_fwrite         ; EDX=buf,ECX=size,ESI=filepos,EBX=handle  :CF,EAX=numwritten
                           dispatch rx_fgetsize       ; EBX=handle      :CF, eax=filesize/errorcode
                           dispatch rx_fgetattr       ; EDX=filename    :CF, ECX=attribs
                           dispatch rx_fsetattr       ; EDX=filename,ECX=attribs   :CF
                           dispatch rx_deletefile     ; EDX=filename    :CF

                           dispatch rx_findfirst      ; EDX=filename, EDI=ff_struc    :CF, eax=handle
                           dispatch rx_findnext       ; EBX=handle,   EDI=ff_struc    :CF
                           dispatch rx_findclose      ; EBX=handle

                           stc
                           retn

   is0:                    push    eax
                           IS_RING0        ; EAX changed
                           pop     eax
                           retn

   exitrx:                 SKIPLOADER ; skip loader, return to caller (need CF)
                           retn

   m1                      macro   x
   rx_&x:                  call    is0
                           jnz     __r3
   __r0:                   event   EV_r0_&x
                           jmp     exitrx
   __r3:                   event   EV_r3_&x
                           jmp     exitrx
                           endm

                           m1      fcreate
                           m1      fopen_ro
                           m1      fopen_rw
                           m1      fclose
                           m1      fgetsize
                           m1      fgetattr
                           m1      fsetattr
                           m1      deletefile

                           m1      findfirst
                           m1      findnext
                           m1      findclose

   rx_fread:               call    is0
                           jnz     __r3
   __r0:                   event   EV_r0_fread
                           jmp     exitrx
   __r3:                   pusha
                           mov     edx, esi
                           event   EV_r3_fseek
                           popa
                           event   EV_r3_fread
                           jmp     exitrx

   rx_fwrite:              call    is0
                           jnz     __r3
   __r0:                   event   EV_r0_fwrite
                           jmp     exitrx
   __r3:                   pusha
                           mov     edx, esi
                           event   EV_r3_fseek
                           popa
                           event   EV_r3_fwrite
                           jmp     exitrx

                           PLUGIN_END
