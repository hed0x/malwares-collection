   ; UTIL
   ; ~~~~
   ; - common subroutines

   include                 INCLUDE\consts.inc
   include                 INCLUDE\s2c.inc
   include                 k32man.inc
   include                 rxio.inc
   include                 memory.inc

   include                 plugin.inc
                           PLUGIN_START    UTIL, CODE32, PERMUTABLE

   handleevent:            hookevent EV_UTIL_GETWINDIR, getwindir
                           hookevent EV_UTIL_GETSYSDIR, getsysdir
                           hookevent EV_UTIL_BSAVE, bsave
                           hookevent EV_UTIL_BLOAD, bload
                           hookevent EV_UTIL_IS_W9X, isw9x
                           hookevent EV_UTIL_GETTIME, gettime
                           hookevent EV_UTIL_BSAVE_EX, bsave_ex
                           hookevent EV_UTIL_BLOAD_EX, bload_ex
                           stc
                           retn

   ; ---------------------------------------------------------------------------

   ; input:  EDX=pointer to memory buffer (260 bytes)
   ; output: *EDX filled with %windir%\, EDI points to ending 0

   getwindir:              pusha

                           mov     edi, edx
                           cld

                           IS_RING0        ; EAX changed
                           jz      __ring0

   __ring3:                push    260
                           push    edi
                           callX   GetWindowsDirectoryA
                           add     edi, eax
                           jmp     __copyslash

   __ring0:                VMMcall Get_Config_Directory

                           mov     esi, edx
   __1:                    lodsb
                           stosb
                           or      al, al
                           jnz     __1
                           dec     edi

   __copyslash:            mov     al, '\'
                           cmp     [edi-1], al
                           je      __skipslash
                           stosb
   __skipslash:
                           mov     [esp].popa_edi, edi

                           popa
                           clc
                           retn

   ; ---------------------------------------------------------------------------

   ; input:  EDX=pointer to memory buffer (260 bytes)
   ; output: *EDX filled with %windir%\, EDI points to ending 0

   getsysdir:              call    getwindir
                           push    eax
                           x_stosd SYSTEM\~
                           pop     eax
                           dec     edi
                           retn

   ; ---------------------------------------------------------------------------

   ; input: ESI=filename
   ;        EDX=buffer             (0 == do MALLOC and return addr in EDX)
   ;        ECX=buffer size        (0 == do GetFileSize and return in ECX)

   ; output: EAX==0 -- error
   ;         EAX==1 -- data loaded

   bload:                  pusha

                           xor     edi, edi        ; result

                           xchg    edx, esi
                           event   EV_rx_fopen_ro
                           jc      __exit
                           xchg    ebx, eax

                           or      ecx, ecx
                           jnz     __havesize
                           event   EV_rx_fgetsize
                           xchg    ecx, eax
                           mov     [esp].popa_ecx, ecx
   __havesize:
                           xchg    edx, esi
                           or      edx, edx
                           jnz     __haveaddr
                           event   EV_MEMORY_MALLOC
                           mov     [esp].popa_edx, edx
   __haveaddr:
                           xor     esi, esi
                           event   EV_rx_fread

                           event   EV_rx_fclose

                           inc     edi             ; result

   __exit:                 mov     [esp].popa_eax, edi
                           popa
                           clc
                           retn

   ; input: ESI=filename
   ;        EDX=buffer
   ;        ECX=buffer size

   bsave:                  pusha

                           xchg    edx, esi
                           event   EV_rx_fcreate
                           jc      __exit
                           xchg    ebx, eax

                           xchg    edx, esi
                           xor     esi, esi
                           event   EV_rx_fwrite

                           event   EV_rx_fclose

   __exit:                 popa
                           clc
                           retn

   ; ---------------------------------------------------------------------------

   ; output: ZF==1 (jz)    -- 9x
   ;         ZF==0 (jnz)   -- nt

   isw9x:                  pusha
                           IS_RING0        ; EAX changed
                           jz      __exit          ; ring0: jz w9x
                           callX   GetVersion      ; hi bit: 0 if winNT
                           not     eax
                           test    eax, 80000000h
   __exit:                 popa
                           clc
                           retn

   ; ---------------------------------------------------------------------------

   ; returns: EAX=time since system started, in [ms]

   gettime:                pusha

                           IS_RING0        ; EAX changed
                           jz      __ring0

   __ring3:                callX   GetTickCount
                           jmp     __exit

   __ring0:                VMMcall Get_System_Time

   __exit:                 mov     [esp].popa_eax, eax
                           popa
                           clc
                           retn

   ; ---------------------------------------------------------------------------

   ; input: same as BLOAD, but ESI=file index (not filename)

   bload_ex:               push    esi
                           push    edi
                           sub     esp, 260
                           mov     edi, esp
                           call    ex_buildname
                           mov     esi, esp
                           call    bload
                           lea     esp, [esp+260]
                           pop     edi
                           pop     esi
                           retn

   ; input: same as BSAVE, but ESI=file index (not filename)


   bsave_ex:               pusha
                           sub     esp, 260
                           mov     edi, esp
                           call    ex_buildname
                           mov     esi, esp
                           call    bsave
                           lea     esp, [esp+260]
                           popa
                           retn

   ; input: ESI=index
   ;        EDI=filename ptr

   ex_buildname:           pusha
                           mov     edx, edi
                           call    getwindir
                           lea     eax, [esi+'0']  ; 'n.SWP',0
                           stosb
                           x_stosd .SWP~
                           popa
                           retn

   ; ---------------------------------------------------------------------------

                           PLUGIN_END
