   seh_init                macro
   ;cmd
   ;                        call    __seh_init
   ;cmd
   ;                        mov     esp, [esp+8]
   ;cmd
   ;                        stc
   ;cmd
   ;                        jc      __seh_error
   ;cmd
   ;__seh_init:             xor     eax, eax
   ;cmd
   ;                        push    dword ptr fs:[eax]
   ;cmd
   ;                        mov     fs:[eax], esp
   ;cmd
                           endm

   seh_done                macro
   ;cmd
   ;__seh_error:            pop     dword ptr fs:[0]
   ;cmd
   ;                        pop     eax
   ;cmd
                           endm
