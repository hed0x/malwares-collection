;
; (x) uNdErX 2003 - underx@antisocial.com
;
; Windows Wrapper
;

FORMAT PE CONSOLE
ENTRY  start

include 'inc\import.inc'

section '.code' readable executable

       ; shared app code
       include 'hmr.asi'
       include 'inc\winseh.inc'

section '.data' readable writeable executable

       ; shared app data
       include 'hmrdata.asi'

section '.bss' readable writeable

       ; shared app bss
       include 'hmrbss.asi'

section '.idata' import data readable writeable

 library   kernel32, 'KERNEL32.DLL'

 kernel32:
 import    WriteFile,'WriteFile',\
           ExitProcess,'ExitProcess',\
           GetStdHandle,'GetStdHandle',\
           GetCommandLineA,'GetCommandLineA'
