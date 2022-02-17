   K32MAN_VERSION          equ     1

   EV_K32MAN_BASE                  equ     00000200h
   EV_K32MAN_GET_PROC_ADDRESS      equ     EV_K32MAN_BASE+01h ; [NODEBUG] i: EDI=hash, o: EAX=0/va
   EV_K32MAN_GET_PROC_ADDRESS_EX   equ     EV_K32MAN_BASE+02h ; [NODEBUG] i: EBX=base, EDI=hash, o: EAX=0/va
   EV_K32MAN_GET_KERNEL_BASE       equ     EV_K32MAN_BASE+03h ; o: EBX=kernel ptr
   EV_K32MAN_GET_VXDCALL0          equ     EV_K32MAN_BASE+04h ; o: EBX=kernel ptr EAX=vxdcall0
   ;;
   EV_K32MAN_GET_ADVAPI32DLL_BASE  equ     EV_K32MAN_BASE+05h ; [NODEBUG] o: EBX=ADVAPI32.DLL base
   EV_K32MAN_GET_WINMMDLL_BASE     equ     EV_K32MAN_BASE+06h ; o: EBX=WINMM.DLL base
   EV_K32MAN_GET_WSOCK32DLL_BASE   equ     EV_K32MAN_BASE+07h ; o: EBX=WSOCK32.DLL base

   calchash                macro   procname
                           hash = 0
                           irpc    c, <procname>
                           hash = ((hash shl 7) and 0FFFFFFFFh) or (hash shr (32-7))
                           hash = hash xor "&c"
                           endm
                           endm

   mov_h                   macro   reg, procname
                           calchash procname
                           mov     reg, hash
                           endm

   callX                   macro   procname
                           push    edi
                           mov_h   edi, procname
                           event   EV_K32MAN_GET_PROC_ADDRESS
                           pop     edi
                           call    eax
                           endm

   callQ                   macro   procname
                           push    edi
                           mov_h   edi, procname
                           eventX  EV_K32MAN_GET_PROC_ADDRESS
                           pop     edi
                           call    eax
                           endm

   callXX                  macro   procname
                           ; input: EBX=dll base
                           push    edi
                           mov_h   edi, procname
                           event   EV_K32MAN_GET_PROC_ADDRESS_EX
                           pop     edi
                           call    eax
                           endm

   callREG                 macro   procname
                           push    ebx
                           event   EV_K32MAN_GET_ADVAPI32DLL_BASE
                           push    edi
                           mov_h   edi, procname
                           event   EV_K32MAN_GET_PROC_ADDRESS_EX
                           pop     edi
                           pop     ebx
                           call    eax
                           endm

   callMM                  macro   procname
                           push    ebx
                           event   EV_K32MAN_GET_WINMMDLL_BASE
                           push    edi
                           mov_h   edi, procname
                           event   EV_K32MAN_GET_PROC_ADDRESS_EX
                           pop     edi
                           pop     ebx
                           call    eax
                           endm

   callWSK                 macro   procname
                           push    ebx
                           event   EV_K32MAN_GET_WSOCK32DLL_BASE
                           push    edi
                           mov_h   edi, procname
                           event   EV_K32MAN_GET_PROC_ADDRESS_EX
                           pop     edi
                           pop     ebx
                           call    eax
                           endm
