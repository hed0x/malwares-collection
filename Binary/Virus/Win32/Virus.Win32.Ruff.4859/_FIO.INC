   ;ALL_FIO                equ     TRUE

   ; fopen  (EDX=fname)  : CF=1  EAX=errorcode   CF=0 EAX=handle
   ; fclose (EBX=handle) : CF=1  EAX=errorcode   CF=0
   ; IFDEF ALL_FIO
   ; fcreate(EDX=fname)  : CF=1  EAX=errorcode   CF=0 EAX=handle
   ; fread  (EBX=handle,
   ;         EDX=buffer,
   ;         ECX=size)   : CF=1  EAX=errorcode   CF=0 EAX=bytesread
   ; fwrite(EBX,EDX,ECX) : CF=1  EAX=errorcode   CF=0 EAX=bytesread
   ; ENDIF

   OPEN_EXISTING           equ             3
   CREATE_ALWAYS           equ             2
   ;GENERIC_READ            equ             080000000h
   ;GENERIC_WRITE           equ             040000000h
   FILE_SHARE_READ         equ             000000001h
   FILE_SHARE_WRITE        equ             000000002h
   FILE_ATTRIBUTE_NORMAL   equ             000000080h

   access_ebx              equ     (dword ptr 16)
   access_ecx              equ     (dword ptr 24)
   access_eax              equ     (dword ptr 28)

   fcheckerror:            mov     eax,[sGetLastError+ebp]
                           call    eax
                           or      eax, eax
                           jz      __1  ; CF=0
                           mov     [esp].access_eax+4, 0   ; zero EAX in POPA
                           stc
   __1:                    ret

   fopen:                  pusha
                           ;;
                           push    0
                           push    FILE_ATTRIBUTE_NORMAL
                           push    OPEN_EXISTING
                           push    0
                           push    FILE_SHARE_READ
                           push    GENERIC_READ + GENERIC_WRITE
                           push    edx
                           mov     eax,[sCreateFileA+ebp]
                           call    eax
                           or      eax,eax
                           jnz     __1
                           stc
   __1:
                           mov     [esp].access_eax, eax
   ;GetLastError ¢ íâ®¬ á«ãç ¥ ¯®ç¥¬ã â® ¢®§¢à é ¥â ®è¨¡ªã 07eh .
   ;                       call    fcheckerror

                           popa
                           ret

   IFDEF                   ALL_FIO

   fcreate:                pusha
                           ;;
                           push    0
                           push    FILE_ATTRIBUTE_NORMAL
                           push    CREATE_ALWAYS
                           push    0
                           push    FILE_SHARE_READ
                           push    GENERIC_READ + GENERIC_WRITE
                           push    edx
                           mov     eax,[sCreateFileA+ebp]
                           call    eax
                           ;;
                           mov     [esp].access_eax, eax
                           call    fcheckerror
                           popa
                           ret

   ENDIF

   fclose:                 pusha
                           ;;
                           push    ebx
                           mov     eax,[sCloseHandle+ebp]
                           call    eax
                           ;;
                           call    fcheckerror
                           popa
                           ret

   IFDEF                   ALL_FIO

   fread:                  pusha
                           ;;
                           push    0
                           lea     eax, [esp].access_eax + 4
                           push    eax               ; bytesread
                           push    ecx
                           push    edx
                           push    ebx
                           mov     eax,[sReadFile+ebp]
                           call    eax
                           ;;
                           call    fcheckerror
                           popa
                           ret

   fwrite:                 pusha
                           ;;
                           push    0
                           lea     eax, [esp].access_eax + 4
                           push    eax               ; byteswritten
                           push    ecx
                           push    edx
                           push    ebx
                           mov     eax,[sWriteFile+ebp]
                           call    eax

                           ;;
                           call    fcheckerror
                           popa
                           ret

   ENDIF
