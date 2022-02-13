
; registers, flags & stack (except EIP & selectors) that passed into
; call_in_ring0() subroutine will be exactly passed into ring0,
; and, if modified there, returned to caller.

; if ring0-entering request is made alredy from ring0, EAX=0 returned
; if ring0 not entered, EAX=0 returned

include                 RING0.INC
include                 ..\..\INCLUDE\consts.inc

                        public  call_in_ring0

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

ctx                     dd      00010017h  ; 386/486, ctrl,int,seg,dbg
                        db      0C8h dup (?)

save_esp                dd      ?
save_cs                 dd      ?
save_eip                dd      ?
ret_addr                dd      ?

                        align   4
                        db      4096 dup (?)
end_of_temp_stk:

                        .code

call_in_ring0:          pushf
                        xor     eax, eax        ; exit code
                        pusha

                        mov     eax, cs
                        xor     eax, 28h
                        jz      __quit

                        callW   GetVersion
                        test    eax, 80000000h
                        jz      __quit         ; winNT

                        mov     save_esp, esp
                        lea     esp, end_of_temp_stk

                        callW   GetCurrentThread
                        xchg    ebx, eax

                        push    offset ctx
                        push    ebx
                        callW   GetThreadContext
                        or      eax, eax
                        jz      __exit

                        mov     eax, 28h
                        xchg    eax, ctx.dword ptr 0BCh   ; ctx.cs
                        mov     save_cs, eax

                        lea     eax, ring0_caller
                        xchg    eax, ctx.dword ptr 0B8h   ; ctx.eip
                        mov     save_eip, eax

                        mov     ctx.dword ptr 0B4h, esp   ; ctx.ebp <-- ESP

                        push    offset ctx
                        push    ebx
                        callW   SetThreadContext
__exit:
                        mov     esp, save_esp

__quit:                 popa
                        popf

                        ;; temporary
                        push    fs
                        cmp     dword ptr [esp], 0
                        pop     fs
                        jne     __x
                        int 3
__x:                    ;;

                        retn

ring0_caller:           pushf

                        pusha
                        push    ds es
                        push    fs gs

                        push    ss ss
                        pop     ds es

                        xchg    esp, save_esp
                        popa
                        popf

                        pop     ret_addr     ; ret-addr
                        pop     eax          ; r0-proc
                        call    eax
                        push    eax
                        push    ret_addr

                        pushf
                        pusha
                        xchg    esp, save_esp

                        pop     gs fs
                        pop     es ds
                        popa

                        push    ss:save_cs
                        push    ss:save_eip
                        iret

                        end
