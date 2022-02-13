
EV_WALKER_PATCHED       equ     0E8915C1Eh

WALKER_SIZE             equ     40000h

th_pe_struc             struc           ; toolhelp Process info Entry
th_pe_dwSize            dd      ?
th_pe_cntUsage          dd      ?
th_pe_th32ProcessID     dd      ?       ; this process
th_pe_th32DefaultHeapID dd      ?       ; ULONG_PTR
th_pe_th32ModuleID      dd      ?       ; associated exe
th_pe_cntThreads        dd      ?
th_pe_th32ParentProcessID dd    ?       ; this process's parent process
th_pe_pcPriClassBase    dd      ?       ; Base priority of process's threads
th_pe_dwFlags           dd      ?
th_pe_szExeFile         db      260 dup (?)
                        ends


th_me_struc             struc           ; toolhelp Module info Entry
th_me_dwSize            dd      ?
th_me_th32ModuleID      dd      ?
th_me_th32ProcessID     dd      ?
th_me_GlblcntUsage      dd      ?
th_me_ProccntUsage      dd      ?
th_me_modBaseAddr       dd      ?
th_me_modBaseSize       dd      ?
th_me_hModule           dd      ?
th_me_szModule          db      256 dup (?)
th_me_szExePath         db      260 dup (?)
                        ends

mbi_struc               struc
mbi_BaseAddress         dd      ?       ; base address of region
mbi_AllocationBase      dd      ?       ; allocation base address
mbi_AllocationProtect   dd      ?       ; initial access protection
mbi_RegionSize          dd      ?       ; size, in bytes, of region
mbi_State               dd      ?       ; committed, reserved, free
mbi_Protect             dd      ?       ; current access protection
mbi_Type                dd      ?       ; type of pages
                        ends
