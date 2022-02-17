   include                 INCLUDE\consts.inc
   include                 loader.inc
   include                 k32man.inc

   include                 plugin.inc
                           PLUGIN_START    R3IO, W32R3, PERMUTABLE

   dispatch                macro   x
                           hookevent EV_r3_&x, &x
                           endm

   handleevent:            dispatch fcreate
                           dispatch fopen_ro
                           dispatch fopen_rw
                           dispatch fclose
                           dispatch fseek
                           dispatch fread
                           dispatch fwrite
                           dispatch fsetattr
                           dispatch fgetattr
                           dispatch fgetsize
                           dispatch fseekend
                           dispatch deletefile

                           dispatch findfirst
                           dispatch findnext
                           dispatch findclose

                           stc
                           retn

   fzeroerror:             pusha
                           push    0
                           callX   SetLastError
                           popa
                           retn

   fcheckerror:            callX   GetLastError
                           or      eax, eax
                           jz      maplib1  ; CF=0
                           mov     [esp+4].popa_eax, eax
                           stc
   maplib1:                retn

   fcreate:                pusha
                           call    fzeroerror
                           push    0
                           push    FILE_ATTRIBUTE_NORMAL
                           push    CREATE_ALWAYS
                           jmp     maplib9

   fopen_ro:               pusha
                           call    fzeroerror
                           push    0
                           push    FILE_ATTRIBUTE_NORMAL
                           push    OPEN_EXISTING
                           push    0
                           push    FILE_SHARE_READ + FILE_SHARE_WRITE
                           push    GENERIC_READ
                           jmp     maplib10

   fopen_rw:               pusha
                           call    fzeroerror
                           push    0
                           push    FILE_ATTRIBUTE_NORMAL
                           push    OPEN_EXISTING
   maplib9:                push    0
                           push    FILE_SHARE_READ + FILE_SHARE_WRITE
                           push    GENERIC_READ + GENERIC_WRITE
   maplib10:               push    edx
                           callX   CreateFileA
   maplib11:               cmp     eax, -1
                           je      maplib3
                           clc
                           mov     [esp].popa_eax, eax
                           popa

   exit_r3io:              SKIPLOADER
                           retn

   fclose:                 pusha
                           call    fzeroerror
                           push    ebx
                           callX   CloseHandle
   maplib3:                call    fcheckerror
                           popa
                           jmp     exit_r3io

   fseekend:               pusha
                           call    fzeroerror
                           push    FILE_END
                           xor     edx, edx
                           jmp     maplib6

   fseek:                  pusha
                           call    fzeroerror
                           push    FILE_BEGIN
   maplib6:                push    0
                           push    edx
                           push    ebx
                           callX   SetFilePointer
   maplib2:                mov     [esp].popa_eax, eax
                           jmp     maplib3

   fread:                  pusha
                           call    maplib7
                           callX   ReadFile
                           jmp     maplib3

   fwrite:                 pusha
                           call    maplib7
                           callX   WriteFile
                           jmp     maplib3

   maplib7:                pop     esi
                           call    fzeroerror
                           push    0
                           lea     eax, [esp+4].popa_eax
                           push    eax               ; byteswritten
                           push    ecx
                           push    edx
                           push    ebx
                           jmp     esi

   fsetattr:               pusha
                           call    fzeroerror
                           push    ecx
                           push    edx
                           callX   SetFileAttributesA
                           jmp     maplib3

   fgetattr:               pusha
                           call    fzeroerror
                           push    edx
                           callX   GetFileAttributesA
                           mov     [esp].popa_ecx, eax     ; popa.ecx
                           jmp     maplib3

   fgetsize:               pusha
                           call    fzeroerror
                           push    0
                           push    ebx
                           callX   GetFileSize
                           jmp     maplib2

   deletefile:             pusha
                           call    fzeroerror
                           push    edx
                           callX   DeleteFileA
                           jmp     maplib3

   ; i: edi=ff_struc
   ;    edx=filename
   ; o: cf==0  eax=handle
   ;    cf==1  eax=errorcode

   findfirst:              pusha
                           call    fzeroerror
                           push    edi        ; ff_struc
                           push    edx
                           callX   FindFirstFileA
                           jmp     maplib11

   ; i: edi=ff_struc
   ;    ebx=handle
   findnext:               pusha
                           call    fzeroerror
                           push    edi
                           push    ebx
                           callX   FindNextFileA
                           jmp     maplib3

   ; i: ebx=handle

   findclose:              pusha
                           call    fzeroerror
                           push    ebx
                           callX   FindClose
                           jmp     maplib3

                           PLUGIN_END
