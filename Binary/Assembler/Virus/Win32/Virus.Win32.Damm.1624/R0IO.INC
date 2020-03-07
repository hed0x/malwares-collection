   ; ring-0 file io
   ; release 2.50
   ; (x) 2000 Z0MBiE

   ; subroutines:
   ; ~~~~~~~~~~~
   ; r0_fopen_rw(EDX=filename):CF,EAX=handle/errorcode
   ; r0_fopen_ro(EDX=filename):CF,EAX=handle/errorcode
   ; r0_fclose(EBX=handle)
   ; r0_fread (EDX=buf,ECX=size,ESI=filepos,EBX=handle):CF,EAX=numread/error
   ; r0_fwrite(EDX=buf,ECX=size,ESI=filepos,EBX=handle):CF,EAX=numwritten/error
   ; r0_fgetsize(EBX=handle):CF,eax=filesize/error
   ; r0_make_handle_rw(EBX=handle)
   ; r0_make_handle_ro(EBX=handle)
   ; r0_getattr(EDX=filename):CF, ECX=attribs
   ; r0_setattr(EDX=filename,ECX=attribs):CF

                           ; i: edx=filename
                           ; o: cf, eax=handle

   r0_fopen_rw:            pusha
                           mov     bx, 2042h       ; no i24, denynone, r/w
                           jmp     r0_fopen_any

   r0_fopen_ro:            pusha
                           mov     bx, 2044h       ; no i24, denynone, r/o

   r0_fopen_any:           mov     eax, R0_OPENCREATFILE
                           mov     esi, edx
                           mov     cx, 32          ; archive (unused here)
                           mov     dx, 01h         ; fail | open
                           VxDcall IFSMGR, Ring0_FileIO
                           mov     [esp+7*4], eax
                           popa
                           ret

                           ; i: ebx=handle
   r0_fclose:              pusha
                           mov     eax, R0_CLOSEFILE
                           VxDcall IFSMGR, Ring0_FileIO
                           popa
                           ret

                           ; i: ebx=handle
                           ;    edx=buffer
                           ;    ecx=size
                           ;    esi=file pos
                           ; o: eax=bytes read
   r0_fread:               pusha
                           mov     eax, R0_READFILE
                           xchg    edx, esi
                           VxDcall IFSMGR, Ring0_FileIO
                           mov     [esp+7*4], ecx
                           popa
                           ret

                           ; i: ebx=handle
                           ;    edx=buffer
                           ;    ecx=size
                           ;    esi=file pos
                           ; o: eax=bytes written
   r0_fwrite:              pusha
                           mov     eax, R0_WRITEFILE
                           xchg    edx, esi
                           VxDcall IFSMGR, Ring0_FileIO
                           mov     [esp+7*4], ecx
                           popa
                           ret

                           ; input: EBX=handle
                           ; output: EAX=size
   r0_fgetsize:            pusha
                           mov     eax, R0_GETFILESIZE
                           VxDcall IFSMGR, Ring0_FileIO
                           mov     [esp+7*4], eax
                           popa
                           ret

                           ; input: EBX=handle
   r0_make_handle_rw:      pusha
                           mov     eax, [ebx+0Ch]
                           mov     byte ptr [eax+0Ch], 42h ; denynone, r/w
                           ; 42h=SHARE_DENYNONE+ACCESS_READWRITE
                           popa
                           ret

   r0_make_handle_ro:      pusha
                           mov     eax, [ebx+0Ch]
                           mov     byte ptr [eax+0Ch], 44h ; denynone, r/o
                           popa
                           ret

                           ; input:  EDX=filename
                           ; output: ECX=attribs
   r0_fgetattr:            pusha
                           mov     eax, R0_FILEATTRIBUTES+GET_ATTRIBUTES
                           mov     esi, edx
                           VxDcall IFSMGR, Ring0_FileIO
                           mov     [esp+6*4], eax       ; popa.ecx
                           popa
                           ret

                           ; input:  EDX=filename, ECX=attribs
   r0_fsetattr:            pusha
                           mov     eax, R0_FILEATTRIBUTES+SET_ATTRIBUTES
                           mov     esi, edx
                           VxDcall IFSMGR, Ring0_FileIO
                           popa
                           ret
