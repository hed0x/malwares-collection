   MAINDST_VERSION         equ     1

   EV_MAINDST_BASE         equ     00002E00h
   EV_MAINDST_DO_STEALTH   equ     EV_MAINDST_BASE+01h

   PROCESSENTRY32          struc
   p32e_dwSize             dd      ?
   p32e_cntUsage           dd      ?
   p32e_th32ProcessID      dd      ? ; this process
   p32e_th32DefaultHeapID  dd      ?
   p32e_th32ModuleID       dd      ? ; associated exe
   p32e_cntThreads         dd      ?
   p32e_th32ParentProcessID dd     ? ; this process's parent process
   p32e_pcPriClassBase     dd      ? ; base priority of process's threads
   p32e_dwFlags            dd      ?
   p32e_szExeFile          db      260 dup (?)
   PROCESSENTRY32          ends
