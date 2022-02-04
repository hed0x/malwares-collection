;
; (x) uNdErX 2003 - underx@antisocial.com
;
; Linux Wrapper
;

FORMAT ELF EXECUTABLE
ENTRY  start

section readable executable

       ; shared app code
       include 'hmr.asi'

       ; specific OS stuff
       include 'inc\lnxseh.inc'

       ; Win32 API rotten emulation
xGetCommandLineA:
       ; must be called with argc and argv in stack
       pusha
       mov     esi, [esp+(3*4)]
       lea     edi, [cmdline]
       mov     ebx, edi
       lodsd   ; skip fcn addr
       lodsd
       xchg    eax, ecx
.cycle1:
       lodsd
       push    esi
       push    ecx
       xchg    eax, esi
       xor     ecx, ecx
.cycle2:
       inc     ecx
       cmp     byte [esi+ecx], 00h
       jnz     .cycle2
       rep     movsb
       mov     al, ' '
       stosb
       pop     ecx
       pop     esi
       loop    .cycle1
.done:
       mov     [esp+(7*4)], ebx
       popa
       ret

xGetStdHandle:
       mov     eax, [esp+4]
       neg     eax
       sub     eax, 10
       ret     4

xWriteFile:
       pusha

       mov    eax, 4
       mov    ebx, [esp+(8*4)+4]
       mov    ecx, [esp+(8*4)+8]
       mov    edx, [esp+(8*4)+12]
       int    80h

       mov    ecx, [esp+(8*4)+16]
       jecxz  .done
       mov    [ecx], eax
.done:
       mov    [esp+(7*4)], eax
       popa
       ret    5*4
       
xExitProcess:
       xor     eax, eax
       inc     eax
       mov     ebx, [esp+4]
       int     80h

section readable writeable

       ; specific data
       GetCommandLineA dd xGetCommandLineA
       GetStdHandle    dd xGetStdHandle
       WriteFile       dd xWriteFile
       ExitProcess     dd xExitProcess

       ; shared app data
       include 'hmrdata.asi'
       include 'hmrbss.asi'

       ; command line
       cmdline         rb 2048
