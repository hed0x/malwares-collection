   ; advanced FileIO library  4.xx  (c) 1998-2000 Z0MBiE

   ;  ***ALL FUNCTIONS***: if (CF==1) EAX=error code
   ;
   ; fcreate  (EDX=fname) : EAX=handle
   ; fopen_ro (EDX=fname) : EAX=handle
   ; fopen_rw (EDX=fname) : EAX=handle
   ; fclose   (EBX=handle)
   ; fseek    (EBX=handle, EDX=newpos) : EAX=new pos
   ; fread    (EBX=handle, EDX=buffer, ECX=size) : EAX=bytesread
   ; fwrite   (EBX,EDX,ECX) : EAX=byteswritten
   ; fsetattr (EBX,ECX)
   ; fgetsize (EBX) : EAX

   OPEN_EXISTING           equ     3
   CREATE_ALWAYS           equ     2
   GENERIC_READ            equ     80000000h
   GENERIC_WRITE           equ     40000000h
   FILE_SHARE_READ         equ     00000001h
   FILE_SHARE_WRITE        equ     00000002h
   FILE_ATTRIBUTE_NORMAL   equ     00000080h
   FILE_BEGIN              equ     0
   FILE_END                equ     2

   cmd
   fzeroerror:             pusha
   cmd
                           push    0
   cmd
                           call    xxSetLastError
   cmd
                           popa
   cmd
                           ret

   cmd
   fcheckerror:            call    xxGetLastError
   cmd
                           or      eax, eax
   cmd
                           jz      maplib1  ; CF=0
   cmd
                           mov     [esp+7*4]+4, eax
   cmd
                           stc
   cmd
   maplib1:                ret

   cmd
   fcreate:                pusha
   cmd
                           call    fzeroerror
   cmd
                           push    0
   cmd
                           push    FILE_ATTRIBUTE_NORMAL
   cmd
                           push    CREATE_ALWAYS
   cmd
                           stc
   cmd
                           jc      maplib9
   cmd
   fopen_ro:               pusha
   cmd
                           call    fzeroerror
   cmd
                           push    0
   cmd
                           push    FILE_ATTRIBUTE_NORMAL
   cmd
                           push    OPEN_EXISTING
   cmd
                           push    0
   cmd
                           push    FILE_SHARE_READ + FILE_SHARE_WRITE
   cmd
                           push    GENERIC_READ
   cmd
                           stc
   cmd
                           jc      maplib10
   cmd
   fopen_rw:               pusha
   cmd
                           call    fzeroerror
   cmd
                           push    0
   cmd
                           push    FILE_ATTRIBUTE_NORMAL
   cmd
                           push    OPEN_EXISTING
   cmd
   maplib9:                push    0
   cmd
                           push    FILE_SHARE_READ + FILE_SHARE_WRITE
   cmd
                           push    GENERIC_READ + GENERIC_WRITE
   cmd
   maplib10:               push    edx
   cmd
                           call    xxCreateFileA
   cmd
                           cmp     eax, -1
   cmd
                           je      maplib3
   cmd
                           clc
   cmd
                           mov     [esp+7*4], eax
   cmd
                           popa
   cmd
                           ret

   cmd
   fclose:                 pusha
   cmd
                           call    fzeroerror
   cmd
                           push    ebx
   cmd
                           call    xxCloseHandle
   cmd
   maplib3:                call    fcheckerror
   cmd
                           popa
   cmd
                           ret

   cmd
   fseekend:               pusha
   cmd
                           call    fzeroerror
   cmd
                           push    FILE_END
   cmd
                           xor     edx, edx
   cmd
                           jz      maplib6
   cmd
   fseek:                  pusha
   cmd
                           call    fzeroerror
   cmd
                           push    FILE_BEGIN
   cmd
   maplib6:                push    0
   cmd
                           push    edx
   cmd
                           push    ebx
   cmd
                           call    xxSetFilePointer
   cmd
   maplib2:                mov     [esp+7*4], eax
   cmd
                           clc
   cmd
                           jnc     maplib3
   cmd
   fread:                  pusha
   cmd
                           call    maplib7
   cmd
                           call    xxReadFile
   cmd
                           clc
   cmd
                           jnc     maplib3
   cmd
   fwrite:                 pusha
   cmd
                           call    maplib7
   cmd
                           call    xxWriteFile
   cmd
                           or      esp, esp
   cmd
                           jnz     maplib3
   cmd
   maplib7:                pop     esi
   cmd
                           call    fzeroerror
   cmd
                           push    0
   cmd
                           lea     eax, [esp+7*4] + 4
   cmd
                           push    eax               ; byteswritten
   cmd
                           push    ecx
   cmd
                           push    edx
   cmd
                           push    ebx
   cmd
                           push    esi
   cmd
                           ret
   cmd
   fsetattr:               pusha
   cmd
                           call    fzeroerror
   cmd
                           push    ecx
   cmd
                           push    edx
   cmd
                           call    xxSetFileAttributesA
   cmd
                           clc
   cmd
                           jnc     maplib3
   cmd
   fgetsize:               pusha
   cmd
                           call    fzeroerror
   cmd
                           push    0
   cmd
                           push    ebx
   cmd
                           call    xxGetFileSize
   cmd
                           or      esp, esp
   cmd
                           jnz     maplib2
   cmd
