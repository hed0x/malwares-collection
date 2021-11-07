   ; ADDPGN
   ; ~~~~~~
   ; - on each '.pgn' & '.uue' file found (via RECSERCH)
   ; - open file,
   ;   allocate memory,
   ;   read file into memory,
   ;   if ADDPGNU/X present: UUE/RSA decode (EV_ADDPGNU/X_DECRYPT),
   ;   add plugin (EV_PLUGMAN_ADD),
   ;   close file,
   ;   free memory
   ;

   include                 r3io.inc
   include                 memory.inc
   include                 plugman.inc
   include                 extman.inc
   include                 system.inc
   include                 addpgnx.inc
   include                 addpgnu.inc
   include                 badfile.inc
   include                 fastname.inc

   include                 plugin.inc
                           PLUGIN_START    ADDPGN, W32R3, PERMUTABLE

   handleevent:            hookevent EV_EXTMAN_GOT_FILENAME, checkext
                           hookevent EV_ADDPGN_ADD_PGN_FILE, addpgnfile
                           hookevent EV_ADDPGN_ADD_PGN_BUF, addpgnbuf
                           stc
                           retn

   checkext:               neg     ecx
                           cmp     ecx, -'ngp.'
                           je      addpgnfile
                           cmp     ecx, -'euu.'
                           je      addpgnfile
                           neg     ecx

                           stc
                           retn

   addpgnfile:             neg     ecx

                           pusha

                           event   EV_BADFILE_ISBADFILE
                           jnc     __exit
                           event   EV_FASTNAME_ISNEWFILE
                           jnc     __exit

                           event   EV_r3_fopen_ro
                           jc      __exit
                           xchg    ebx, eax

                           event   EV_r3_fgetsize

                           xor     ecx, ecx
                           cmp     eax, 65536
                           jae     __close
                           xchg    ecx, eax

                           event   EV_MEMORY_MALLOC

                           event   EV_r3_fread

   __close:                event   EV_r3_fclose

                           mov     esi, edx
                           event   EV_ADDPGN_ADD_PGN_BUF

                           event   EV_MEMORY_MFREE

   __exit:                 popa
                           stc     ; leave unhandled
                           retn

   ; input: ESI=buffer
   ;        ECX=size

   addpgnbuf:              pusha

                           ; do buffer copy,
                           ; 'coz contents will be changed
                           event   EV_MEMORY_MALLOC
                           pusha
                           mov     edi, edx
                           cld
                           rep     movsb
                           popa
                           mov     esi, edx

                           event   EV_ADDPGNU_DECRYPT  ; UUE-decode
                           event   EV_ADDPGNX_DECRYPT  ; RSA-decode, then add

                           event   EV_MEMORY_MFREE

                           popa
                           stc
                           retn

                           PLUGIN_END
