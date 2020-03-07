   ; ring-0 file io

   access_eax              equ     (dword ptr 7*4)

                           ; i: edx=filename
                           ; o: cf, eax=handle
   fopen:                  pusha
                           mov     eax, R0_OPENCREATFILE
                           mov     esi, edx
                           mov     bx, 2022h       ; no int 24, denywrite, r/w
                           mov     cx, 32          ; archive (unused here)
                           mov     dx, 01h         ; fail | open
                           VxDcall IFSMGR, Ring0_FileIO
                           mov     [esp].access_eax, eax
                           popa
                           ret

                           ; i: ebx=handle
   fclose:                 pusha
                           mov     eax, R0_CLOSEFILE
                           VxDcall IFSMGR, Ring0_FileIO
                           popa
                           ret

                           ; i: ebx=handle
                           ;    edx=buffer
                           ;    ecx=size
                           ;    esi=file pos
                           ; o: eax=bytes read
   fread:                  pusha
                           mov     eax, R0_READFILE
                           xchg    edx, esi
                           VxDcall IFSMGR, Ring0_FileIO
                           mov     [esp].access_eax, ecx
                           popa
                           ret

                           ; i: ebx=handle
                           ;    edx=buffer
                           ;    ecx=size
                           ;    esi=file pos
                           ; o: eax=bytes written
   fwrite:                 pusha
                           mov     eax, R0_WRITEFILE
                           xchg    edx, esi
                           VxDcall IFSMGR, Ring0_FileIO
                           mov     [esp].access_eax, ecx
                           popa
                           ret
