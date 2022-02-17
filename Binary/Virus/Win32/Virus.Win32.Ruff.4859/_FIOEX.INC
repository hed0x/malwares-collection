   MAX_MAP_SIZE            equ     10*1048576
   ;MAX_MAP_SIZE            equ      0
   ; fopenEx  (EDX=fname,
   ;           EDI=address)     : CF=1  EAX=errorcode   CF=0 EAX=mapping base
   ;                                                         EBX=file handle
   ;                                                         ECX=file size
   ; fcloseEx (EAX=mapping base,
   ;           EBX=file handle,
   ;           ECX=file size)   : CF=1  EAX=errorcode   CF=0

   FILE_BEGIN              equ     0
   PAGE_READWRITE          equ     000000004h
   FILE_MAP_ALL_ACCESS     equ     0000F001Fh

   fopenEx:                pusha

                           call    fopen
                           jc      __error

                           mov     [esp].access_ebx, eax

                           push    0
                           push    eax
                           mov     eax,[sGetFileSize+ebp]
                           call    eax
                           mov     [esp].access_ecx, eax
                           add     eax,vir_size*30
                           push    0
                           push    eax
   ;                       push    MAX_MAP_SIZE
                           push    0
                           push    PAGE_READWRITE
                           push    0
                           push    [esp].access_ebx + 4*5
                           mov     eax,[sCreateFileMappingA+ebp]
                           call    eax
                           mov     [filemaphandle+ebp],eax

                           mov     [esp].access_eax, eax

                           call    fcheckerror
                           jc      __exit

                           push    0       ; file size, 0=map entire file
                           push    0       ; offs-lo
                           push    0       ; offs-hi
                           push    FILE_MAP_ALL_ACCESS
                           push    [esp].access_eax + 4*4
                           mov     eax,[sMapViewOfFile+ebp]
                           call    eax


                           mov     [esp].access_eax, eax

                           call    fcheckerror

   __exit:                 popa
                           ret

   __error:                mov     [esp].access_eax, eax

                           popa
                           ret

   fcloseEx:               pusha

                           push    eax
                           mov     eax,[sUnmapViewOfFile+ebp]
                           call    eax

                           call    fcheckerror
                           jc      __exit

                           push    FILE_BEGIN
                           push    0
                           push    [esp].access_ecx + 4*2
                           push    [esp].access_ebx + 4*3
                           mov     eax,[sSetFilePointer+ebp]
                           call    eax

                           push    [esp].access_ebx
                           mov     eax,[sSetEndOfFile+ebp]
                           call    eax

                           mov     ebx,[filemaphandle+ebp]
                           call    fclose

                           mov     ebx, [esp].access_ebx
                           call    fclose

                           jnc     __exit
   __error:                mov     [esp].access_eax, eax

   __exit:                 popa
                           ret
