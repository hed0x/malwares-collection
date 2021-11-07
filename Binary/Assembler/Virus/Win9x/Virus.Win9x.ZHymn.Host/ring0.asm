   ; RING0
   ; ~~~~~
   ; - win9X: ring-0 entering plugin

   ; win95 OSR2 -- tested, ok
   ; win98 se   -- tested, ok

   R0STACKSIZE             equ     2048

   include                 INCLUDE\seh.inc
   include                 k32man.inc
   include                 system.inc

   include                 plugin.inc
                           PLUGIN_START    RING0, W32R3, PERMUTABLE

   handleevent:            hookevent EV_RING0_CALL_IN_RING0, ring0_call_in_ring0
                           stc
                           retn

   ; input: EDI=r0proc
   ;        EDX=parameter

   save_esp                =       dword ptr 0
   save_calladdr           =       dword ptr 4
   save_callarg            =       dword ptr 8
   save_cs                 =       dword ptr 12
   save_eip                =       dword ptr 16

   ring0_call_in_ring0:    pusha

                           seh_init

                           mov     ecx, esp
                           sub     esp, R0STACKSIZE+0C8h
                           push    00010000h+1+2+4+10h  ; 386/486, ctrl,int,seg,dbg
                           mov     esi, esp

                           push    eax             ; save_eip
                           push    eax             ; save_cs
                           push    edx             ; save_callarg
                           push    edi             ; save_calladdr
                           push    ecx             ; save_esp

                           pusha
                           event   EV_SYSTEM_GET_VIR_SIZE
                           cld
                           rep     lodsb  ; load all vir pages. important!!!
                           popa

                           callX   GetCurrentThread
                           xchg    ebx, eax

                           push    esi
                           push    ebx
                           callX   GetThreadContext
                           or      eax, eax
                           jz      __error

                           push    28h
                           pop     eax
                           xchg    eax, [esi+0BCh]
                           mov     [esp].save_cs, eax

                           pusho   ring0_caller
                           pop     eax
                           xchg    eax, [esi+0B8h]
                           mov     [esp].save_eip, eax

                           mov     [esi+0B4h], esp         ; context.ebp <-- ESP

                           push    esi
                           push    ebx
                           callX   SetThreadContext

   __error:                add     esp, R0STACKSIZE+0CCh+20

                           seh_done

                           popa
                           clc
                           retn

   ring0_caller:           xchg    esp, [ebp].save_esp

                           pushf
                           pusha
                           push    ds es

                           push    ss ss
                           pop     ds es

                           mov     edx, [ebp].save_callarg
                           call    [ebp].save_calladdr

                           pop     es ds
                           popa
                           popf

                           mov     esp, [ebp].save_esp

                           pushf
                           push    [ebp].save_cs
                           push    [ebp].save_eip
                           iret

                           PLUGIN_END
