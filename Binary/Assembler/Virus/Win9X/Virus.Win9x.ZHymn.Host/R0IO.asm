   include                 INCLUDE\consts.inc
   include                 loader.inc

   include                 plugin.inc
                           PLUGIN_START    R0IO, W9XR0, PERMUTABLE

   dispatch                macro   x
                           hookevent EV_r0_&x, r0_&x
                           endm

   handleevent:            dispatch make_handle_rw ; EBX=handle
                           dispatch make_handle_ro ; EBX=handle
                           dispatch fcreate        ; EDX=filename  :CF,EAX=handle/errorcode
                           dispatch fopen_rw       ; EDX=filename  :CF,EAX=handle/errorcode
                           dispatch fopen_ro       ; EDX=filename  :CF,EAX=handle/errorcode
                           dispatch fclose         ; EBX=handle
                           dispatch fread          ; EDX=buf,ECX=size,ESI=filepos,EBX=handle  :CF,EAX=numread
                           dispatch fwrite         ; EDX=buf,ECX=size,ESI=filepos,EBX=handle  :CF,EAX=numwritten
                           dispatch fgetsize       ; EBX=handle      :CF, eax=filesize/errorcode
                           dispatch fgetattr       ; EDX=filename    :CF, ECX=attribs
                           dispatch fsetattr       ; EDX=filename,ECX=attribs   :CF
                           dispatch renamefile     ; EDX=srcfile, ESI=dstfile   :CF
                           dispatch deletefile     ; EDX=filename  :CF    ; deletes r/o files too
                           dispatch settime_by_name; EDX=filename,ECX=last_modify_datetime   :CF

                           dispatch findfirst
                           dispatch findnext
                           dispatch findclose

                           stc
                           retn

   r0_fileio:              xchg    esi, edx
                           VxDcall IFSMGR, Ring0_FileIO
                           retn

                           ; i: edx=filename
                           ; o: cf, eax=handle/errorcode

   r0_fcreate:             pushad
                           push    12h             ; not exists==create, exists==replace/open
                           jmp     r0_x4

                           ; i: edx=filename
                           ; o: cf, eax=handle/errorcode

   r0_fopen_rw:            pushad
                           push    01h             ; not exists==fail, exists==open
   r0_x4:                  mov     ebx, 2042h      ; no i24, denynone, r/w
                           jmp     r0_x5

   r0_fopen_ro:            pushad
                           mov     ebx, 2044h      ; no i24, denynone, r/o
                           push    01h             ; not exists==fail, exists==open
   r0_x5:                  pop     esi
                           push    32              ; archive
                           pop     ecx
                           mov     eax, R0_OPENCREATFILE
   r0_x2:                  call    r0_fileio
                           mov     [esp].popa_eax, eax

   r0_exit_plugin:         popad
                           SKIPLOADER      ; need CF
                           retn

                           ; i: ebx=handle
   r0_fclose:              pushad
                           mov     eax, R0_CLOSEFILE
   r0_x3:                  call    r0_fileio
                           jmp     r0_exit_plugin

                           ; i: ebx=handle
                           ;    edx=buffer
                           ;    ecx=size
                           ;    esi=file pos
                           ; o: eax=bytes read
   r0_fread:               pushad
                           mov     eax, R0_READFILE
   r0_x1:                  call    r0_fileio
                           mov     [esp].popa_eax, ecx
                           jmp     r0_exit_plugin

                           ; i: ebx=handle
                           ;    edx=buffer
                           ;    ecx=size
                           ;    esi=file pos
                           ; o: eax=bytes written
   r0_fwrite:              pushad
                           mov     eax, R0_WRITEFILE
                           jmp     r0_x1

                           ; i: EBX=handle
                           ; o: EAX=size
   r0_fgetsize:            pushad
                           mov     eax, R0_GETFILESIZE
                           jmp     r0_x2

                           ; input: EBX=handle
   r0_make_handle_rw:      pushad
                           mov     eax, [ebx+0Ch]
                           mov     byte ptr [eax+0Ch], 42h ; denynone, r/w
                           ; 42h=SHARE_DENYNONE+ACCESS_READWRITE
                           jmp     r0_exit_plugin

   r0_make_handle_ro:      pushad
                           mov     eax, [ebx+0Ch]
                           mov     byte ptr [eax+0Ch], 44h ; denynone, r/o
                           jmp     r0_exit_plugin

                           ; input:  EDX=filename
                           ; output: ECX=attribs
   r0_fgetattr:            pushad
                           mov     eax, R0_FILEATTRIBUTES+GET_ATTRIBUTES
                           call    r0_fileio
                           mov     [esp].popa_ecx, eax
                           jmp     r0_exit_plugin

                           ; input:  EDX=filename, ECX=attribs
   r0_fsetattr:            pushad
                           mov     eax, R0_FILEATTRIBUTES+SET_ATTRIBUTES
                           jmp     r0_x3

                           ; input: EDX=source file
                           ;        ESI=destination file
   r0_renamefile:          pushad
                           mov     eax, R0_RENAMEFILE
                           jmp     r0_x3

                           ; input: EDX=file name
   r0_deletefile:          pushad
                           mov     eax, R0_DELETEFILE
                           push    1+2+4+32 ; hidden/system/readonly/archive
                           pop     ecx
                           jmp     r0_x3

                           ; i: ebx=filename
                           ;    ecx=last_modify datetime
   r0_settime_by_name:     pushad
                           mov     eax, R0_FILEATTRIBUTES + SET_ATTRIB_MODIFY_DATETIME
                           shld    edi, ecx, 16           ; really DI:CX
                           jmp     r0_x3

   ; i: EDX=fname/EDI=ff_struc
   ; o: CF,EAX=handle/errorcode

   r0_findfirst:           pusha
                           mov     eax, R0_FINDFIRSTFILE
                           mov     cx, 1+2+4+32 + 16
                           mov     esi, edi
                           jmp     r0_x2

   ; i: EBX=handle/EDI=ff_struc
   ; o: CF

   r0_findnext:            pusha
                           mov     eax, R0_FINDNEXTFILE
                           mov     esi, edi
                           jmp     r0_x3

   ; i: EBX=handle

   r0_findclose:           pusha
                           mov     eax, R0_FINDCLOSEFILE
                           jmp     r0_x3

                           PLUGIN_END
